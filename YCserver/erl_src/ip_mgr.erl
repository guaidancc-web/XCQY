-file("src/mod/misc/ip_mgr.erl", 1).

-module(ip_mgr).

-behaviour(gen_server).

-export([start_link/0,
         info/1,
         is_max/1,
         set/1,
         del/1,
         inc/1,
         dec/1,
         top/1,
         top/2,
         add_block/1,
         del_block/1,
         reload_block/0,
         is_blocked/1,
         ip2bitstring/1]).

-export([init/1,
         handle_call/3,
         handle_cast/2,
         handle_info/2,
         terminate/2,
         code_change/3]).

-file("inc/common.hrl", 1).

-type p() :: bitstring().

-type z() :: non_neg_integer().

-type role_id() :: {pos_integer(), p(), z()}.

-type unit_id() :: {pos_integer(), pos_integer()}.

-type pos() :: {pos_integer(),
                non_neg_integer(),
                non_neg_integer()}.

-record(center,
        {ready = 0 :: 1 | 0,
         pid :: undefined | pid(),
         node :: undefined | atom(),
         center_platform = "" :: list(),
         center_zone_id = 0 :: non_neg_integer(),
         platform = <<>> :: bitstring(),
         zone_id = 0 :: non_neg_integer(),
         combine = [] :: [{bitstring(), non_neg_integer()}]}).

-record(notice_rec,
        {type = 11, digit_attr = [], str_attr = []}).

-file("src/mod/misc/ip_mgr.erl", 29).

-file("inc/ip_info.hrl", 1).

-record(ip_info,
        {ip :: undefined | tuple(),
         connected = 0 :: reset | non_neg_integer(),
         max_conn = -1 :: integer(),
         conn_times = 0 :: pos_integer()}).

-file("src/mod/misc/ip_mgr.erl", 30).

-record(state, {}).

-spec start_link() -> {ok, pid()} |
                      ignore |
                      {error, term()}.

start_link() ->
    gen_server:start_link({local, ip_mgr}, ip_mgr, [], []).

-spec info(tuple()) -> {ok, #ip_info{}} |
                       {error, term()}.

info(Ip) ->
    case catch ets:lookup(ip_mgr, Ip) of
        [Info] -> {ok, Info};
        [] -> {error, ip_info_undefined};
        {'EXIT', {badarg, _}} -> {error, ip_mgr_not_running}
    end.

-spec is_max(tuple()) -> boolean().

is_max(Ip) ->
    case info(Ip) of
        {ok, #ip_info{max_conn = -1}} -> false;
        {ok, #ip_info{connected = C, max_conn = M}}
            when C =< M ->
            false;
        _ -> true
    end.

-spec set(#ip_info{}) -> ok | {error, term()}.

set(Info = #ip_info{ip = Ip, connected = C}) ->
    case info(Ip) of
        {ok, _} when C =:= reset ->
            ets:insert(ip_mgr, Info#ip_info{connected = 0}),
            ok;
        {ok, #ip_info{connected = Connected}} ->
            ets:insert(ip_mgr, Info#ip_info{connected = Connected}),
            ok;
        {error, ip_info_undefined} ->
            ets:insert(ip_mgr, Info),
            ok;
        Err -> Err
    end.

-spec del(tuple()) -> ok | {error, term()}.

del(Ip) ->
    case ets:info(ip_mgr, size) of
        undefined -> {error, ip_mgr_not_running};
        _ ->
            ets:delete(ip_mgr, Ip),
            ok
    end.

-spec inc(tuple()) -> ok |
                      {error, max_connection} |
                      {error, term()}.

inc(Ip) ->
    case info(Ip) of
        {ok, _} ->
            ets:update_counter(ip_mgr,
                               Ip,
                               [{#ip_info.connected, 1},
                                {#ip_info.conn_times, 1}]),
            ok;
        {error, ip_info_undefined} ->
            set(#ip_info{ip = Ip, connected = 1, conn_times = 1});
        Err -> Err
    end.

-spec dec(tuple()) -> ok | {error, term()}.

dec(Ip) ->
    case info(Ip) of
        {ok, _} ->
            ets:update_counter(ip_mgr,
                               Ip,
                               {#ip_info.connected, -1}),
            ok;
        Err -> Err
    end.

top(T) -> top(T, 30).

top(connected, N) ->
    L = ets:tab2list(ip_mgr),
    Nl = lists:sort(fun sort_connected/2, L),
    lists:sublist(Nl, N);
top(conn_times, N) ->
    L = ets:tab2list(ip_mgr),
    Nl = lists:sort(fun sort_conn_times/2, L),
    lists:sublist(Nl, N).

add_block(AddIps) ->
    gen_server:cast(ip_mgr, {add_block, AddIps}).

del_block(DelIps) ->
    gen_server:cast(ip_mgr, {del_block, DelIps}).

reload_block() -> gen_server:cast(ip_mgr, reload_block).

is_blocked(Ip) ->
    IpStr = ip2bitstring(Ip),
    case catch ets:lookup(ip_block, IpStr) of
        [_] -> true;
        [] -> false;
        _Err ->
            logger:error("查询是否被封禁ip时发生错误:~w", [_Err], ip_mgr, 146),
            false
    end.

ip2bitstring({N1, N2, N3, N4}) ->
    list_to_bitstring(integer_to_list(N1) ++
                          "." ++
                              integer_to_list(N2) ++
                                  "." ++
                                      integer_to_list(N3) ++
                                          "." ++ integer_to_list(N4)).

init([]) ->
    logger:info("[~w] 正在启动...", [ip_mgr], ip_mgr, 158),
    process_flag(trap_exit, true),
    ets:new(ip_mgr,
            [set, named_table, public, {keypos, #ip_info.ip}]),
    ets:new(ip_block,
            [set, named_table, public, {keypos, 1}]),
    State = #state{},
    logger:info("[~w] 启动完成", [ip_mgr], ip_mgr, 165),
    {ok, State}.

handle_call(_Request, _From, State) -> {noreply, State}.

handle_cast({add_block, AddIps}, State) ->
    lists:foreach(fun (Ip) -> ets:delete(ip_block, Ip) end,
                  AddIps),
    lists:foreach(fun (Ip) -> ets:insert(ip_block, {Ip})
                  end,
                  AddIps),
    logger:debug("增加的IPs:~w", [AddIps], ip_mgr, 179),
    {noreply, State};
handle_cast({del_block, DelIps}, State) ->
    lists:foreach(fun (Ip) -> ets:delete(ip_block, Ip) end,
                  DelIps),
    logger:debug("移除的IPs:~w", [DelIps], ip_mgr, 187),
    {noreply, State};
handle_cast(reload_block, State) ->
    load_block(),
    {noreply, State};
handle_cast(_Msg, State) -> {noreply, State}.

handle_info(reload_block, State) ->
    load_block(),
    {noreply, State};
handle_info(_Info, State) -> {noreply, State}.

terminate(_Reason, _State) ->
    logger:info("[~w] 正在关闭...", [ip_mgr], ip_mgr, 206),
    logger:info("[~w] 关闭完成", [ip_mgr], ip_mgr, 207),
    ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

sort_connected(#ip_info{connected = C1},
               #ip_info{connected = C2})
    when C1 =< C2 ->
    false;
sort_connected(_, _) -> true.

sort_conn_times(#ip_info{conn_times = C1},
                #ip_info{conn_times = C2})
    when C1 =< C2 ->
    false;
sort_conn_times(_, _) -> true.

load_block() ->
    Sql = "select ip from admin_blockip",
    case db:get_all(Sql) of
        {ok, L} ->
            logger:debug("封禁的ip列表: ~w", [L], ip_mgr, 230),
            ets:delete_all_objects(ip_block),
            lists:foreach(fun ([Ip]) -> ets:insert(ip_block, {Ip})
                          end,
                          L);
        {error, _Err} ->
            logger:error("加载封禁ip列表时发生错误: ~w", [_Err], ip_mgr, 237)
    end,
    ok.

