-file("src/lib/thrift/thrift_reconnecting_client.erl",
      1).

-module(thrift_reconnecting_client).

-behaviour(gen_server).

-export([call/3, get_stats/1, get_and_reset_stats/1]).

-export([start_link/6]).

-export([init/1,
         handle_call/3,
         handle_cast/2,
         handle_info/2,
         terminate/2,
         code_change/3]).

-record(state,
        {client = nil,
         host,
         port,
         thrift_svc,
         thrift_opts,
         reconn_min,
         reconn_max,
         reconn_time = 0,
         op_cnt_dict,
         op_time_dict}).

start_link(Host, Port, ThriftSvc, ThriftOpts, ReconnMin,
           ReconnMax) ->
    gen_server:start_link(thrift_reconnecting_client,
                          [Host,
                           Port,
                           ThriftSvc,
                           ThriftOpts,
                           ReconnMin,
                           ReconnMax],
                          []).

call(Pid, Op, Args) ->
    gen_server:call(Pid, {call, Op, Args}).

get_stats(Pid) -> gen_server:call(Pid, get_stats).

get_and_reset_stats(Pid) ->
    gen_server:call(Pid, get_and_reset_stats).

init([Host, Port, TSvc, TOpts, ReconnMin, ReconnMax]) ->
    process_flag(trap_exit, true),
    State = #state{host = Host, port = Port,
                   thrift_svc = TSvc, thrift_opts = TOpts,
                   reconn_min = ReconnMin, reconn_max = ReconnMax,
                   op_cnt_dict = dict:new(), op_time_dict = dict:new()},
    {ok, try_connect(State)}.

handle_call({call, Op, _}, _From,
            State = #state{client = nil}) ->
    {reply,
     {error, noconn},
     incr_stats(Op, "failfast", 1, State)};
handle_call({call, Op, Args}, _From,
            State = #state{client = Client}) ->
    Timer = timer_fun(),
    Result = (catch thrift_client:call(Client, Op, Args)),
    Time = Timer(),
    case Result of
        {C, {ok, Reply}} ->
            S = incr_stats(Op,
                           "success",
                           Time,
                           State#state{client = C}),
            {reply, {ok, Reply}, S};
        {_, {E, Msg}} when E == error; E == exception ->
            S = incr_stats(Op, "error", Time, try_connect(State)),
            {reply, {E, Msg}, S};
        Other ->
            S = incr_stats(Op, "error", Time, try_connect(State)),
            {reply, Other, S}
    end;
handle_call(get_stats, _From, State = #state{}) ->
    {reply, stats(State), State};
handle_call(get_and_reset_stats, _From,
            State = #state{}) ->
    {reply, stats(State), reset_stats(State)}.

handle_cast(_Msg, State) -> {noreply, State}.

handle_info(try_connect, State) ->
    {noreply, try_connect(State)};
handle_info(_Info, State) -> {noreply, State}.

terminate(_Reason, #state{client = Client}) ->
    thrift_client:close(Client),
    ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

try_connect(State = #state{client = OldClient,
                           host = Host, port = Port, thrift_svc = TSvc,
                           thrift_opts = TOpts}) ->
    case OldClient of
        nil -> ok;
        _ -> catch thrift_client:close(OldClient)
    end,
    case catch thrift_client_util:new(Host,
                                      Port,
                                      TSvc,
                                      TOpts)
        of
        {ok, Client} ->
            State#state{client = Client, reconn_time = 0};
        {E, Msg} when E == error; E == exception ->
            ReconnTime = reconn_time(State),
            error_logger:error_msg("[~w] ~w connect failed (~w), trying "
                                   "again in ~w ms~n",
                                   [self(), TSvc, Msg, ReconnTime]),
            erlang:send_after(ReconnTime, self(), try_connect),
            State#state{client = nil, reconn_time = ReconnTime}
    end.

reconn_time(#state{reconn_min = ReconnMin,
                   reconn_time = 0}) ->
    ReconnMin;
reconn_time(#state{reconn_max = ReconnMax,
                   reconn_time = ReconnMax}) ->
    ReconnMax;
reconn_time(#state{reconn_max = ReconnMax,
                   reconn_time = R}) ->
    Backoff = 2 * R,
    case Backoff > ReconnMax of
        true -> ReconnMax;
        false -> Backoff
    end.

timer_fun() ->
    T1 = erlang:now(),
    fun () ->
            T2 = erlang:now(),
            timer:now_diff(T2, T1)
    end.

incr_stats(Op, Result, Time,
           State = #state{op_cnt_dict = OpCntDict,
                          op_time_dict = OpTimeDict}) ->
    Key = lists:flatten([atom_to_list(Op), ["_" | Result]]),
    State#state{op_cnt_dict =
                    dict:update_counter(Key, 1, OpCntDict),
                op_time_dict =
                    dict:update_counter(Key, Time, OpTimeDict)}.

stats(#state{thrift_svc = TSvc, op_cnt_dict = OpCntDict,
             op_time_dict = OpTimeDict}) ->
    Svc = atom_to_list(TSvc),
    F = fun (Key, Count, Stats) ->
                Name = lists:flatten([Svc, ["_" | Key]]),
                Micros = dict:fetch(Key, OpTimeDict),
                [{Name, Count, Micros} | Stats]
        end,
    dict:fold(F, [], OpCntDict).

reset_stats(State = #state{}) ->
    State#state{op_cnt_dict = dict:new(),
                op_time_dict = dict:new()}.

