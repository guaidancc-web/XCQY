-file("src/merge/merge_dao_behaviour.erl", 1).

-module(merge_dao_behaviour).

-export([merge/1,
         truncate/1,
         update_srv_id/1,
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

-file("src/merge/merge_dao_behaviour.erl", 18).

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

-file("src/merge/merge_dao_behaviour.erl", 19).

merge(Table = #merge_table{name = _Name,
                           dao = DaoMod}) ->
    {ok, Data, NewTable} = case DaoMod:do_init(Table) of
                               {ok, Rs, NT} -> {ok, Rs, NT};
                               {error, Msg} ->
                                   catch logger:debug("初始失败[~ts] [Reason:~ts]",
                                                      [_Name, Msg],
                                                      merge_dao_behaviour,
                                                      28),
                                   throw({dao_init_error, DaoMod, Msg})
                           end,
    case DaoMod:do_convert(Data, NewTable) of
        {ok, NewTable2} -> DaoMod:do_end(NewTable2);
        {error, Reason} ->
            logger:info("~w处理do_convert出错:~ts",
                        [DaoMod, Reason],
                        merge_dao_behaviour,
                        35),
            throw({dao_do_convert_error, DaoMod, Reason})
    end.

truncate(#merge_table{table = TableName}) ->
    Sql = util:flist("truncate ~ts", [TableName]),
    merge_db:exec(merge_target, Sql, []).

update_srv_id(Table = #merge_table{dao = DaoMod}) ->
    case DaoMod:update_srv_id(Table) of
        {error, Msg} ->
            throw({dao_update_srv_id_error, DaoMod, Msg});
        _ -> ok
    end.

delete_expire(Table = #merge_table{table = TableName,
                                   dao = DaoMod}) ->
    case DaoMod:delete_expire(Table) of
        {error, Msg} ->
            catch logger:info("删除~ts过期数据有误:~ts",
                              [TableName, Msg],
                              merge_dao_behaviour,
                              56),
            throw({dao_delete_expire, DaoMod, Msg});
        _ -> ok
    end.

