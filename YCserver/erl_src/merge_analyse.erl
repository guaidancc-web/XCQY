-file("src/merge/merge_analyse.erl", 1).

-module(merge_analyse).

-export([do/1, get/2]).

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

-file("src/merge/merge_analyse.erl", 16).

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

-file("src/merge/merge_analyse.erl", 17).

do([]) -> ok;
do([role_clear | T]) ->
    logger:info("正在清除废弃小号", [], merge_analyse, 25),
    do_role_clear(),
    logger:info("完成废弃小号清理", [], merge_analyse, 27),
    do(T);
do([role_name | T]) ->
    logger:info("正在全局性数据分析", [], merge_analyse, 30),
    ok = do_role_name(),
    logger:info("完成全局性数据分析", [], merge_analyse, 32),
    do(T);
do([_ | T]) -> do(T).

get(role_name, {RoleId, SrvId, RoleName}) ->
    case ets:lookup(ets_merge_role_name, {RoleId, SrvId}) of
        [] -> RoleName;
        [#merge_role_name{name = NewRoleName}] -> NewRoleName
    end.

do_role_clear() ->
    SrvList = merge_util:all_server(),
    deal_role_clear_srv(SrvList),
    ok.

deal_role_clear_srv([]) -> ok;
deal_role_clear_srv([#merge_server{data_source =
                                       DataSource}
                     | T]) ->
    merge_dao_role:clear_role(DataSource),
    deal_role_clear_srv(T).

do_role_name() ->
    SrvList = merge_util:all_server(),
    deal_role_name_srv(SrvList, 1, length(SrvList)),
    ok.

deal_role_name([], _DataSource, _Index, _Size) -> ok;
deal_role_name([[RoleId, Platform, ZoneId, Name, Lev]
                | T],
               DataSource, 1, Size) ->
    ets:insert(ets_merge_role_name_temp,
               #merge_role_name{key = {RoleId, Platform, ZoneId},
                                name = Name, lev = Lev,
                                data_source = DataSource}),
    deal_role_name(T, DataSource, 1, Size);
deal_role_name([[RoleId, Platform, ZoneId, Name, Lev]
                | T],
               DataSource, Index, Size) ->
    case ets:lookup(ets_merge_role_name_temp, Name) of
        [] ->
            ets:insert(ets_merge_role_name_temp,
                       #merge_role_name{key = {RoleId, Platform, ZoneId},
                                        name = Name, lev = Lev,
                                        data_source = DataSource}),
            ignore;
        [#merge_role_name{key = {ORoleId, OPlatform, OZoneId},
                          name = OName, lev = OLev, data_source = ODataSource}]
            when OLev =:= Lev ->
            {ok, MasterExp} =
                merge_dao_role_info:get_exp(ODataSource,
                                            ORoleId,
                                            OPlatform,
                                            OZoneId),
            {ok, SlaveExp} = merge_dao_role_info:get_exp(DataSource,
                                                         RoleId,
                                                         Platform,
                                                         ZoneId),
            case MasterExp > SlaveExp of
                true ->
                    ets:insert(ets_merge_role_name,
                               #merge_role_name{key =
                                                    {RoleId, Platform, ZoneId},
                                                name =
                                                    convert_role_name2(RoleId,
                                                                       Platform,
                                                                       ZoneId,
                                                                       Name,
                                                                       Lev,
                                                                       DataSource)});
                false ->
                    ets:insert(ets_merge_role_name_temp,
                               #merge_role_name{key =
                                                    {RoleId, Platform, ZoneId},
                                                name = Name, lev = Lev,
                                                data_source = DataSource}),
                    ets:insert(ets_merge_role_name,
                               #merge_role_name{key =
                                                    {ORoleId,
                                                     OPlatform,
                                                     OZoneId},
                                                name =
                                                    convert_role_name2(ORoleId,
                                                                       OPlatform,
                                                                       OZoneId,
                                                                       OName,
                                                                       OLev,
                                                                       ODataSource)})
            end;
        [#merge_role_name{lev = OLev}] when OLev > Lev ->
            ets:insert(ets_merge_role_name,
                       #merge_role_name{key = {RoleId, Platform, ZoneId},
                                        name =
                                            convert_role_name2(RoleId,
                                                               Platform,
                                                               ZoneId,
                                                               Name,
                                                               Lev,
                                                               DataSource),
                                        lev = Lev});
        [#merge_role_name{key = {ORoleId, OPlatform, OZoneId},
                          lev = OLev, name = OName, data_source = ODataSource}]
            when OLev < Lev ->
            ets:insert(ets_merge_role_name_temp,
                       #merge_role_name{key = {RoleId, Platform, ZoneId},
                                        name = Name, lev = Lev,
                                        data_source = DataSource}),
            ets:insert(ets_merge_role_name,
                       #merge_role_name{key = {ORoleId, OPlatform, OZoneId},
                                        name =
                                            convert_role_name2(ORoleId,
                                                               OPlatform,
                                                               OZoneId,
                                                               OName,
                                                               OLev,
                                                               ODataSource)})
    end,
    deal_role_name(T, DataSource, Index, Size).

deal_role_name_srv([], _Index, _Size) -> ok;
deal_role_name_srv([#merge_server{data_source =
                                      DataSource}
                    | T],
                   Index, Size) ->
    {ok, RoleNameList} =
        merge_dao_role:get_roles_name(DataSource),
    ok = deal_role_name(RoleNameList,
                        DataSource,
                        Index,
                        Size),
    deal_role_name_srv(T, Index + 1, Size).

convert_role_name2(RoleId, Platform, ZoneId, Name, Lev,
                   DataSource) ->
    RoleName = convert_role_name(ZoneId, Name),
    case ets:lookup(ets_merge_role_name_temp, RoleName) of
        [] ->
            ets:insert(ets_merge_role_name_temp,
                       #merge_role_name{key = {RoleId, Platform, ZoneId},
                                        name = RoleName, lev = Lev,
                                        data_source = DataSource}),
            RoleName;
        _ ->
            convert_role_name3(RoleId,
                               Platform,
                               ZoneId,
                               Name,
                               Lev,
                               DataSource,
                               RoleName,
                               1)
    end.

convert_role_name3(RoleId, Platform, ZoneId, Name, Lev,
                   DataSource, RoleName, Num) ->
    NewRoleName = util:to_list(RoleName) ++
                      "_" ++ util:to_list(Num),
    case ets:lookup(ets_merge_role_name_temp, NewRoleName)
        of
        [] ->
            ets:insert(ets_merge_role_name_temp,
                       #merge_role_name{key = {RoleId, Platform, ZoneId},
                                        name = NewRoleName, lev = Lev,
                                        data_source = DataSource}),
            NewRoleName;
        _ ->
            convert_role_name3(RoleId,
                               Platform,
                               ZoneId,
                               Name,
                               Lev,
                               DataSource,
                               RoleName,
                               Num + 1)
    end.

convert_role_name(ZoneId, Name) ->
    util:flist("[s~w]~ts", [ZoneId, Name]).

