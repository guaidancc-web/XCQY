-file("src/merge/merge_context.erl", 1).

-module(merge_context).

-behaviour(gen_server).

-export([start_link/0,
         start/0,
         start/1,
         truncate/0,
         truncate/1,
         update_srv_id/2,
         merge_finish/1,
         all_finish/0,
         delete_expire/1,
         update_english_role_name/0]).

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

-file("src/merge/merge_context.erl", 27).

-file("inc/merge.hrl", 1).

-record(merge_table,
        {name = <<>>,
         table = <<>>,
         dao,
         server,
         next_key = 0,
         process = merge_main_proc,
         state,
         new_srv_id,
         old_srv_id}).

-record(merge_server,
        {platform = "",
         zone_id = 1,
         data_source,
         schema,
         target_schema,
         index = 0,
         size = 0}).

-record(merge_role_name,
        {key = {0, <<>>, 0},
         name = <<>>,
         lev = 0,
         exp = 0,
         data_source}).

-file("src/merge/merge_context.erl", 28).

-record(state, {process_list = []}).

start_link() ->
    gen_server:start_link({global, merge_context},
                          merge_context,
                          [],
                          []).

start() ->
    gen_server:cast({global, merge_context}, merge_begin).

start(TableName) ->
    gen_server:cast({global, merge_context},
                    {merge_begin, TableName}).

merge_finish(Process) ->
    gen_server:cast({global, merge_context},
                    {merge_finish, Process}).

truncate() ->
    gen_server:cast({global, merge_context}, truncate).

truncate(TableName) ->
    gen_server:cast({global, merge_context},
                    {truncate, TableName}).

update_srv_id(OldSrvId, NewSrvId) ->
    gen_server:cast({global, merge_context},
                    {update_srv_id, OldSrvId, NewSrvId}).

all_finish() ->
    gen_server:cast({global, merge_context}, all_finish).

init([]) ->
    logger:info("[~w] 正在启动...",
                [merge_context],
                merge_context,
                69),
    erlang:register(merge_context, self()),
    ets:new(ets_merge_role_name_temp,
            [duplicate_bag,
             named_table,
             public,
             {keypos, #merge_role_name.name}]),
    ets:new(ets_merge_role_name,
            [duplicate_bag,
             named_table,
             public,
             {keypos, #merge_role_name.key}]),
    {ok, List} = merge_data:tables(),
    ProList = [Process
               || #merge_table{process = Process} <- List],
    NewProList = sets:to_list(sets:from_list(ProList)),
    logger:debug("ProList:~w",
                 [NewProList],
                 merge_context,
                 77),
    start_process(NewProList),
    logger:info("[~w] 启动完成",
                [merge_context],
                merge_context,
                79),
    case init:get_plain_arguments() of
        ["immediacy"] ->
            gen_server:cast({global, merge_context}, merge_begin);
        _Other ->
            logger:debug("没有直接运行:~ts", [_Other], merge_context, 84)
    end,
    {ok, #state{process_list = NewProList}}.

handle_call(_Request, _From, State) -> {noreply, State}.

handle_cast(merge_begin,
            State = #state{process_list = ProList}) ->
    case merge_checker:check_all() of
        ok ->
            ok = merge_analyse:do([role_clear, role_name]),
            start_merge(ProList);
        {false, Reason} ->
            catch logger:info("检查有误", [], merge_context, 98),
            catch logger:info("检查有误:~w",
                              [Reason],
                              merge_context,
                              99),
            catch logger:info("检查有误:~ts",
                              [Reason],
                              merge_context,
                              100)
    end,
    {noreply, State};
handle_cast({merge_begin, TableName}, State) ->
    {ok, List} = merge_data:tables(),
    case lists:keyfind(util:term_to_string(TableName),
                       #merge_table.table,
                       List)
        of
        false -> logger:info("没找到该表信息", [], merge_context, 107);
        Table ->
            Sql = util:flist("truncate ~w", [TableName]),
            merge_db:exec(merge_target, Sql, []),
            SrvList = merge_util:all_server(),
            tables_merge_srv(Table, SrvList),
            logger:info("转换完成:~w", [TableName], merge_context, 113)
    end,
    {noreply, State};
handle_cast({merge_finish, Process},
            State = #state{process_list = ProList}) ->
    logger:info("进程~w完成处理", [Process], merge_context, 119),
    case ProList -- [Process] of
        [] ->
            logger:info("全部进程已经处理完成", [], merge_context, 122),
            all_finish(),
            {noreply, State#state{process_list = []}};
        NewProList ->
            logger:info("还有进程还没处理完成:~w",
                        [NewProList],
                        merge_context,
                        126),
            {noreply, State#state{process_list = NewProList}}
    end;
handle_cast(truncate, State) ->
    do_truncate(),
    {noreply, State};
handle_cast({truncate, TableName}, State) ->
    merge_dao_behaviour:truncate(TableName),
    logger:info("删除成功:~w", [TableName], merge_context, 136),
    {noreply, State};
handle_cast({update_srv_id, OldSrvId, NewSrvId},
            State) ->
    do_update_srv_id(OldSrvId, NewSrvId),
    {noreply, State};
handle_cast(all_finish, State) ->
    logger:info("开始删除过期数据...", [], merge_context, 146),
    {ok, List} = merge_data:tables(),
    ok = delete_expire(List),
    logger:info("完成删除过期数据...", [], merge_context, 149),
    logger:info("修改英文重名角色名...", [], merge_context, 150),
    ok = update_english_role_name(),
    logger:info("完成英文重名角色名", [], merge_context, 152),
    logger:info("---------------------------------------------",
                [],
                merge_context,
                153),
    logger:info("---------------------------------------------",
                [],
                merge_context,
                154),
    logger:info("合服完成, 请迁移生成后的DETS和LOG到主合服....",
                [],
                merge_context,
                155),
    logger:info("---------------------------------------------",
                [],
                merge_context,
                156),
    logger:info("---------------------------------------------",
                [],
                merge_context,
                157),
    ok,
    erlang:send_after(30000, self(), close),
    {noreply, State};
handle_cast(_Msg, State) -> {noreply, State}.

handle_info(close, State) ->
    erlang:halt(0, [{flush, false}]),
    {noreply, State};
handle_info(_Info, State) -> {noreply, State}.

terminate(_Reason, _State) -> ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

do_truncate() ->
    {ok, List} = merge_data:tables(),
    do_truncate(List).

do_truncate([]) ->
    logger:info("清档完成", [], merge_context, 185),
    ok;
do_truncate([Table | T]) ->
    merge_dao_behaviour:truncate(Table),
    do_truncate(T).

start_process([]) -> ok;
start_process([Process | T]) ->
    merge_srv:start_link(Process),
    start_process(T).

start_merge([]) -> ok;
start_merge([Process | T]) ->
    merge_srv:start_merge(Process),
    start_merge(T).

do_update_srv_id(OldSrvId, NewSrvId) ->
    logger:info("正在修正数据...", [], merge_context, 203),
    {ok, List} = merge_data:tables(),
    do_update_srv_id(List, OldSrvId, NewSrvId).

do_update_srv_id([], _OldSrvId, _NewSrvId) ->
    logger:info("完成修正数据", [], merge_context, 207);
do_update_srv_id([Table = #merge_table{dao = DaoMod}
                  | T],
                 OldSrvId, NewSrvId) ->
    case lists:keyfind(exports, 1, DaoMod:module_info()) of
        false ->
            logger:info("该模块没有方法[~w]",
                        [DaoMod],
                        merge_context,
                        211),
            do_update_srv_id(T, OldSrvId, NewSrvId);
        {exports, FunList} ->
            case [Fun || Fun = {update_srv_id, 1} <- FunList] of
                [{update_srv_id, 1}] ->
                    logger:info("处理模块:~w", [DaoMod], merge_context, 216),
                    merge_dao_behaviour:update_srv_id(Table#merge_table{old_srv_id
                                                                            =
                                                                            OldSrvId,
                                                                        new_srv_id
                                                                            =
                                                                            NewSrvId,
                                                                        server =
                                                                            #merge_server{data_source
                                                                                              =
                                                                                              merge_target}}),
                    do_update_srv_id(T, OldSrvId, NewSrvId);
                _ -> do_update_srv_id(T, OldSrvId, NewSrvId)
            end
    end.

delete_expire([]) ->
    logger:info("删除role表过期数据...", [], merge_context, 226),
    case merge_util:delete_expire(role, undefined) of
        ok -> ok;
        {error, Reason} ->
            logger:info("删除role表过期数据出错了:~w",
                        [Reason],
                        merge_context,
                        230),
            catch logger:info("删除role表过期数据出错了:~ts",
                              [Reason],
                              merge_context,
                              231),
            {error, Reason}
    end;
delete_expire([Table = #merge_table{table = TableName,
                                    dao = DaoMod}
               | T]) ->
    case lists:keyfind(exports, 1, DaoMod:module_info()) of
        false ->
            logger:info("该模块没有方法[~w]",
                        [DaoMod],
                        merge_context,
                        237),
            delete_expire(T);
        {exports, FunList} ->
            case [Fun || Fun = {delete_expire, 1} <- FunList] of
                [{delete_expire, 1}] ->
                    logger:info("删除~ts表过期数据...",
                                [TableName],
                                merge_context,
                                242),
                    merge_dao_behaviour:delete_expire(Table),
                    delete_expire(T);
                _ -> delete_expire(T)
            end
    end.

tables_merge_srv(_, []) -> ok;
tables_merge_srv(Table, [Server | T]) ->
    merge_dao_behaviour:merge(Table#merge_table{server =
                                                    Server}),
    tables_merge_srv(Table, T).

update_english_role_name() ->
    Sql = "select name from role group by name "
          "having count(*) > 1",
    case merge_db:get_all(merge_target, Sql, []) of
        {ok, Data} -> update_role_name(Data);
        {error, Reason} -> {error, Reason}
    end.

update_role_name([]) -> ok;
update_role_name([RoleName | T]) ->
    Sql = "select name, zone_id from role where "
          "name = ?",
    case merge_db:get_all(merge_target, Sql, [RoleName]) of
        {ok, Data} ->
            ok = do_update_role_name(Data),
            update_role_name(T);
        {error, Reason} -> {error, Reason}
    end.

do_update_role_name([]) -> ok;
do_update_role_name([[RoleName, ZoneId] | T]) ->
    Sql =
        util:flist("select name from role where name like "
                   "'[s~w]~ts%'",
                   [ZoneId, RoleName]),
    logger:info("RoleName:~ts, ZoneId:~w",
                [RoleName, ZoneId],
                merge_context,
                278),
    case merge_db:get_all(merge_target, Sql, []) of
        {ok, []} ->
            Sql1 = "update role set name = concat('[s', "
                   "zone_id, ']', name) where name = ? and "
                   "zone_id = ?",
            case merge_db:exec(merge_target,
                               Sql1,
                               [RoleName, ZoneId])
                of
                ok ->
                    Sql2 = "update role_info set name = concat('[s', "
                           "zone_id, ']', name) where name = ? and "
                           "zone_id = ?",
                    case merge_db:exec(merge_target,
                                       Sql2,
                                       [RoleName, ZoneId])
                        of
                        ok -> do_update_role_name(T);
                        {error, Msg} -> {error, Msg}
                    end;
                {error, Msg} -> {error, Msg}
            end;
        {ok, Data} ->
            L = length(Data),
            case check_same_name(ZoneId, RoleName, L + 1) of
                {ok, Num} ->
                    Sql1 = util:flist("update role set name = concat('[s', "
                                      "zone_id, ']', name, '_~w') where name "
                                      "= ? and zone_id = ?",
                                      [Num]),
                    case merge_db:exec(merge_target,
                                       Sql1,
                                       [RoleName, ZoneId])
                        of
                        ok ->
                            Sql2 =
                                util:flist("update role_info set name = concat('[s', "
                                           "zone_id, ']', name , '_~w') where name "
                                           "= ? and zone_id = ?",
                                           [Num]),
                            case merge_db:exec(merge_target,
                                               Sql2,
                                               [RoleName, ZoneId])
                                of
                                ok -> do_update_role_name(T);
                                {error, Msg} -> {error, Msg}
                            end;
                        {error, Msg} -> {error, Msg}
                    end;
                {error, Reason} -> {error, Reason}
            end;
        {error, Reason} -> {error, Reason}
    end.

check_same_name(ZoneId, Name, Num) ->
    Sql =
        util:flist("select name from role where name = concat('[s"
                   "', ~w, ']', '~ts', '_~w')",
                   [ZoneId, Name, Num]),
    case merge_db:get_all(merge_target, Sql, []) of
        {ok, []} -> {ok, Num};
        {ok, _Data} -> check_same_name(ZoneId, Name, Num + 1);
        {error, Reason} -> {error, Reason}
    end.

