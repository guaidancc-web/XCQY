-file("src/merge/merge_dao_role.erl", 1).

-module(merge_dao_role).

-export([get_roles_name/1, clear_role/1]).

-export([do_init/1,
         do_convert/2,
         do_end/1,
         update_srv_id/1]).

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

-file("src/merge/merge_dao_role.erl", 23).

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

-file("src/merge/merge_dao_role.erl", 24).

do_init(Table) ->
    merge_util:batch_insert_offset(Table, undefined).

do_convert([], Table) -> {ok, Table}.

do_end(_Table = #merge_table{server =
                                 #merge_server{index = Index, size = Size}})
    when Index =:= Size ->
    logger:info("正在修改角色名称...", [], merge_dao_role, 34),
    RoleNameList = ets:tab2list(ets_merge_role_name),
    update_role_name(RoleNameList),
    logger:info("完成修改角色名称", [], merge_dao_role, 37),
    ignore;
do_end(_Table) -> ignore.

update_srv_id(_Table = #merge_table{old_srv_id =
                                        {OldPlat, OldZone},
                                    new_srv_id = {NewPlat, NewZone}}) ->
    Sql = "update role set platform = ?, zone_id "
          "= ? where platform = ? and zone_id = "
          "? ",
    case merge_db:exec(merge_target,
                       Sql,
                       [NewPlat, NewZone, OldPlat, OldZone])
        of
        ok -> ok;
        {error, Msg} -> {error, Msg}
    end.

get_roles_name(DataSource) ->
    Sql = "select id, platform, zone_id, name, "
          "lev from role",
    case merge_db:get_all4page(DataSource, Sql, [], 3000) of
        {ok, Data} -> {ok, Data};
        {error, Reason} -> {error, Reason}
    end.

clear_role(DataSource) ->
    Now = date:unixtime(),
    ClearDate = Now - 3888000,
    Sql1 = util:flist("delete from role where login_time < "
                      "~w and lev < 45",
                      [ClearDate]),
    case merge_db:exec(DataSource, Sql1, []) of
        ok ->
            logger:info("清理role表完成:~ts",
                        [Sql1],
                        merge_dao_role,
                        72),
            Sql2 =
                util:flist("delete from role_info where login_time "
                           "< ~w and lev < 45",
                           [ClearDate]),
            case merge_db:exec(DataSource, Sql2, []) of
                ok ->
                    logger:info("清理role_info表完成:~ts",
                                [Sql2],
                                merge_dao_role,
                                76),
                    ok;
                {error, Reason} -> {error, Reason}
            end;
        {error, Reason} -> {error, Reason}
    end.

update_role_name([]) -> ok;
update_role_name([#merge_role_name{key =
                                       {RoleId, Platform, ZoneId},
                                   name = RoleName}
                  | T]) ->
    Sql = "update role set name = ? where id = "
          "? and platform = ? and zone_id = ?",
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

