-file("src/mod/client/client_auth.erl", 1).

-module(client_auth).

-behaviour(gen_server).

-export([start_link/0,
         check_cdkey/1,
         check_open/2,
         close_test/0,
         open_test/0,
         reload_white_list/0]).

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

-file("src/mod/client/client_auth.erl", 22).

-record(state, {}).

check_cdkey(_Account) -> 0.

close_test() ->
    env:del(server_test_mode),
    logger:info("关闭测试成功", [], client_auth, 31),
    ok.

open_test() ->
    env:save(server_test_mode, 1),
    logger:info("开启测试成功", [], client_auth, 37),
    ok.

reload_white_list() ->
    client_auth ! reload_white_list,
    ok.

check_open(_, Account) ->
    Now = date:unixtime(),
    SrvOpenTime = env:get(srv_open_time),
    case Now >= SrvOpenTime of
        true ->
            IsTest = env:get(server_test_mode),
            case IsTest of
                1 ->
                    case in_white_list(Account) of
                        true -> true;
                        false -> {false, lang:get("当前服务器还在维护中，请耐心等待")}
                    end;
                _ -> true
            end;
        false ->
            case in_white_list(Account) of
                true -> true;
                false -> {false, lang:get("当前服务器还未开服，请耐心等待")}
            end
    end.

in_white_list(Account) ->
    case catch ets:lookup(account_white_list, Account) of
        [_] -> true;
        [] -> false;
        _Err ->
            logger:error("查询白名单账号失败:~w", [_Err], client_auth, 77),
            false
    end.

start_link() ->
    gen_server:start_link({local, client_auth},
                          client_auth,
                          [],
                          []).

init([]) ->
    logger:info("[~w] 正在启动...",
                [client_auth],
                client_auth,
                92),
    process_flag(trap_exit, true),
    State = #state{},
    ets:new(account_white_list,
            [set, named_table, public, {keypos, 1}]),
    case load_white_list() of
        true ->
            logger:info("[~w] 启动完成",
                        [client_auth],
                        client_auth,
                        99),
            {ok, State};
        false ->
            logger:error("加载白名单配置时失败", [], client_auth, 102),
            {stop, load_white_error}
    end.

handle_call(_Request, _From, State) -> {noreply, State}.

handle_cast(_Msg, State) -> {noreply, State}.

handle_info(reload_white_list, State) ->
    ets:delete_all_objects(account_white_list),
    load_white_list(),
    {noreply, State};
handle_info(_Info, State) -> {noreply, State}.

terminate(_Reason, _State) ->
    logger:info("[~w] 正在关闭...",
                [client_auth],
                client_auth,
                120),
    logger:info("[~w] 关闭完成",
                [client_auth],
                client_auth,
                121),
    ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

load_white_list() ->
    Sql = "select account, name from sys_white_list",
    case db:get_all(Sql, []) of
        {ok, L} -> do_load_white_list(L);
        {error, _Err} ->
            logger:error("加载白名单列表失败:~w", [_Err], client_auth, 138),
            false
    end.

do_load_white_list([]) -> true;
do_load_white_list([[Account, Name] | T]) ->
    ets:insert(account_white_list, {Account, Name}),
    do_load_white_list(T).

