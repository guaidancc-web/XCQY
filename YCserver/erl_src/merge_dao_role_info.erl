-file("src/merge/merge_dao_role_info.erl", 1).

-module(merge_dao_role_info).

-export([get_exp/4]).

-export([do_init/1,
         do_convert/2,
         do_end/1,
         delete_expire/1]).

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

-file("src/merge/merge_dao_role_info.erl", 23).

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

-file("src/merge/merge_dao_role_info.erl", 24).

do_init(Table = #merge_table{}) ->
    merge_util:batch_insert_offset(Table, undefined).

do_convert([], Table) -> {ok, Table}.

do_end(_Table = #merge_table{server =
                                 #merge_server{index = Index, size = Size}})
    when Index =:= Size ->
    logger:info("正在修改附加表角色名称...",
                [],
                merge_dao_role_info,
                33),
    RoleNameList = ets:tab2list(ets_merge_role_name),
    update_role_name(RoleNameList),
    logger:info("完成修改附加表角色名称", [], merge_dao_role_info, 36),
    ignore;
do_end(_Table) -> ignore.

get_exp(DataSource, RoleId, Platform, ZoneId) ->
    Sql = "select exp from role_info where rid "
          "= ? and platform = ? and zone_id = ?",
    case merge_db:get_one(DataSource,
                          Sql,
                          [RoleId, Platform, ZoneId])
        of
        {ok, undefined} ->
            logger:info("角色没有资产信息DataSource:~w, RoleId:~w, platform:~s"
                        ", zone_id:~w",
                        [DataSource, RoleId, Platform, ZoneId],
                        merge_dao_role_info,
                        45),
            {ok, 1};
        {error, undefined} ->
            logger:info("角色没有资产信息DataSource:~w, RoleId:~w, platform:~s"
                        ", zone_id:~w",
                        [DataSource, RoleId, Platform, ZoneId],
                        merge_dao_role_info,
                        48),
            {ok, 1};
        {ok, Exp} -> {ok, Exp};
        {error, Msg} ->
            logger:info("角色没有资产信息DataSource:~w, RoleId:~w, platform:~s"
                        ", zone_id:~w",
                        [DataSource, RoleId, Platform, ZoneId],
                        merge_dao_role_info,
                        52),
            throw({db_error, role_assets_get_exp, Msg})
    end.

delete_expire(Table) ->
    merge_util:delete_expire(Table,
                             "rid, platform, zone_id").

update_role_name([]) -> ok;
update_role_name([#merge_role_name{key =
                                       {RoleId, Platform, ZoneId},
                                   name = RoleName}
                  | T]) ->
    Sql = "update role_info set name = ? where "
          "rid = ? and platform = ? and zone_id "
          "= ?",
    case merge_db:exec(merge_target,
                       Sql,
                       [RoleName, RoleId, Platform, ZoneId])
        of
        ok -> update_role_name(T);
        {error, Msg} ->
            throw({update_role_name,
                   {RoleId, Platform, ZoneId},
                   Msg})
    end;
update_role_name(_) -> ok.

