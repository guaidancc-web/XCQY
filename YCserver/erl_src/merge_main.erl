-file("src/merge/merge_main.erl", 1).

-module(merge_main).

-behaviour(application).

-export([start/0, start/2, stop/0, stop/1]).

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

-file("src/merge/merge_main.erl", 20).

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

-file("src/merge/merge_main.erl", 21).

start() ->
    start_applications([crypto, emysql, merge_main]).

start(_Type, _Args) ->
    error_logger:logfile({open,
                          lists:concat(["error_merge", node(), ".log"])}),
    init_db(),
    merge_sup:start_link().

stop() ->
    logger:info("节点[~ts]正在关闭...", [node()], merge_main, 40),
    try stop_applications([crypto, emysql, merge_main]),
        logger:info("节点[~ts]已经关闭.", [node()], merge_main, 43)
    catch
        T:X ->
            logger:error("节点[~ts]关闭时发生异常[~w]: ~w",
                         [node(), T, X],
                         merge_main,
                         46),
            {error, X}
    end,
    init:stop().

stop(_State) -> ok.

start_applications(Apps) ->
    manage_applications(fun lists:foldl/3,
                        fun application:start/1,
                        fun application:stop/1,
                        already_started,
                        cannot_start_application,
                        Apps).

stop_applications(Apps) ->
    manage_applications(fun lists:foldr/3,
                        fun application:stop/1,
                        fun application:start/1,
                        not_started,
                        cannot_stop_application,
                        Apps).

manage_applications(Iterate, Do, Undo, SkipError,
                    ErrorTag, Apps) ->
    F = fun (App, Acc) ->
                case Do(App) of
                    ok -> [App | Acc];
                    {error, {SkipError, _}} -> Acc;
                    {error, Reason} ->
                        lists:foreach(Undo, Acc),
                        throw({error, {ErrorTag, App, Reason}})
                end
        end,
    Iterate(F, [], Apps),
    ok.

init_db() ->
    {ok,
     [DbHost,
      DbPort,
      DbUser,
      DbPass,
      DbName,
      DbEncode,
      DbConnNumMin,
      DbConnNumMax]} =
        application:get_env(merge_target),
    emysql:add_pool(merge_target,
                    DbConnNumMin,
                    DbConnNumMax,
                    DbUser,
                    DbPass,
                    DbHost,
                    DbPort,
                    DbName,
                    DbEncode),
    {ok, SrvList} = application:get_env(merge_src_list),
    logger:debug("加载merge_target数据库连接", [], merge_main, 96),
    lists:foreach(fun ({Platform,
                        ZoneId,
                        DbHost1,
                        DbPort1,
                        DbUser1,
                        DbPass1,
                        DbName1,
                        DbEncode1,
                        DbConnNumMin1,
                        DbConnNumMax1}) ->
                          DataSource = merge_util:dbsrc(Platform, ZoneId),
                          logger:debug("加载~w数据库连接",
                                       [DataSource],
                                       merge_main,
                                       102),
                          emysql:add_pool(DataSource,
                                          DbConnNumMin1,
                                          DbConnNumMax1,
                                          DbUser1,
                                          DbPass1,
                                          DbHost1,
                                          DbPort1,
                                          DbName1,
                                          DbEncode1)
                  end,
                  SrvList),
    ok.

