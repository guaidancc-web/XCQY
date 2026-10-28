-file("src/lib/thrift/thrift_disk_log_transport.erl",
      1).

-module(thrift_disk_log_transport).

-behaviour(thrift_transport).

-export([new/2,
         new_transport_factory/2,
         new_transport_factory/3]).

-export([read/2,
         write/2,
         force_flush/1,
         flush/1,
         close/1]).

-record(dl_transport,
        {log,
         close_on_close = false,
         sync_every = infinity,
         sync_tref}).

-type state() :: #dl_transport{}.

-file("inc/thrift_transport_behaviour.hrl", 1).

-spec write(state(), iolist() | binary()) -> {state(),
                                              ok | {error, _Reason}}.

-spec read(state(), non_neg_integer()) -> {state(),
                                           {ok, binary()} | {error, _Reason}}.

-spec flush(state()) -> {state(),
                         ok | {error, _Reason}}.

-spec close(state()) -> {state(),
                         ok | {error, _Reason}}.

-file("src/lib/thrift/thrift_disk_log_transport.erl",
      40).

new(LogName, Opts)
    when is_atom(LogName), is_list(Opts) ->
    State = parse_opts(Opts, #dl_transport{log = LogName}),
    State2 = case State#dl_transport.sync_every of
                 N when is_integer(N), N > 0 ->
                     {ok, TRef} = timer:apply_interval(N,
                                                       thrift_disk_log_transport,
                                                       force_flush,
                                                       [State]),
                     State#dl_transport{sync_tref = TRef};
                 _ -> State
             end,
    thrift_transport:new(thrift_disk_log_transport, State2).

parse_opts([], State) -> State;
parse_opts([{close_on_close, Bool} | Rest], State)
    when is_boolean(Bool) ->
    parse_opts(Rest,
               State#dl_transport{close_on_close = Bool});
parse_opts([{sync_every, Int} | Rest], State)
    when is_integer(Int), Int > 0 ->
    parse_opts(Rest, State#dl_transport{sync_every = Int}).

read(State, _Len) ->
    {State, {error, no_read_from_disk_log}}.

write(This = #dl_transport{log = Log}, Data) ->
    {This,
     disk_log:balog(Log, erlang:iolist_to_binary(Data))}.

force_flush(#dl_transport{log = Log}) ->
    error_logger:info_msg("~p syncing~n",
                          [thrift_disk_log_transport]),
    disk_log:sync(Log).

flush(This = #dl_transport{log = Log,
                           sync_every = SE}) ->
    case SE of
        undefined -> disk_log:sync(Log);
        _Else -> ok
    end,
    {This, ok}.

close(This = #dl_transport{close_on_close = false}) ->
    {This, ok};
close(This = #dl_transport{log = Log}) ->
    {This, disk_log:lclose(Log)}.

new_transport_factory(Name, ExtraLogOpts) ->
    new_transport_factory(Name,
                          ExtraLogOpts,
                          [{close_on_close, true}, {sync_every, 500}]).

new_transport_factory(Name, ExtraLogOpts,
                      TransportOpts) ->
    F = fun () ->
                factory_impl(Name, ExtraLogOpts, TransportOpts)
        end,
    {ok, F}.

factory_impl(Name, ExtraLogOpts, TransportOpts) ->
    LogOpts = [{name, Name},
               {format, external},
               {type, wrap}
               | ExtraLogOpts],
    Log = case disk_log:open(LogOpts) of
              {ok, LogS} -> LogS;
              {repaired, LogS, Info1, Info2} ->
                  error_logger:info_msg("Disk log ~p repaired: ~p, ~p~n",
                                        [LogS, Info1, Info2]),
                  LogS
          end,
    new(Log, TransportOpts).

