-file("src/merge/merge_dets_glory.erl", 1).

-module(merge_dets_glory).

-export([do_init/1, do_convert/2, do_end/1]).

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

-file("src/merge/merge_dets_glory.erl", 12).

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

-file("src/merge/merge_dets_glory.erl", 13).

-file("inc/mail.hrl", 1).

-record(mail,
        {sess ::
             undefined |
             {pos_integer(), bitstring(), non_neg_integer()},
         to ::
             undefined |
             {pos_integer(), bitstring(), non_neg_integer()},
         from ::
             undefined |
             {non_neg_integer(), bitstring(), non_neg_integer()},
         from_face = 0 :: non_neg_integer(),
         from_name = "" :: bitstring(),
         to_face = 0 :: non_neg_integer(),
         to_name = "" :: bitstring(),
         type = 0 :: 0..1,
         status = 0 :: 0..1,
         del_type = 0 :: 0..1,
         title = "" :: bitstring(),
         content = "" :: bitstring(),
         item_list = [] :: [tuple()],
         source = 0 :: pos_integer(),
         rev_ts = 0 :: pos_integer(),
         ts = 0 :: pos_integer(),
         read_ts = 0 :: non_neg_integer()}).

-file("src/merge/merge_dets_glory.erl", 14).

-file("inc/glory.hrl", 1).

-record(m_glory,
        {ver = 2,
         id = 0,
         title_id = 0,
         end_time = 0,
         new_id = 0,
         new_title_id = 0,
         switch_time = 0,
         max_id = 0,
         mtime = 0,
         reset_time = 0,
         last_week = 0,
         reward_list = [],
         day_reward = 0,
         lost_times = 0}).

-record(glory_role,
        {id = {0, "", 0},
         classes = 0,
         name = "",
         sex = 0,
         lev = 0,
         new_id = 0,
         max_id = 0,
         new_title_id = 0,
         mtime = 0,
         reset_time = 0,
         last_week = 0,
         update_time = 0,
         day_reward = 0}).

-record(glory_floor,
        {floor = 0,
         ver = 0,
         first = [],
         role_list = [],
         max_list = [],
         record_list = [],
         num = 0}).

-record(glory_rank_data,
        {min = 0, max = 0, reward = []}).

-record(glory_open_rank_data,
        {min = 0,
         max = 0,
         open = 0,
         reward = [],
         title = "",
         content = "",
         honor_id = 0}).

-record(glory_lev_data,
        {id = 0,
         name = "",
         title_id = 0,
         need_title_id = 0,
         need_lev = 0,
         need_fc = 0,
         fc_del = 0,
         fc_add = 0,
         lev_break = 0,
         unit_id = 0,
         all_point = 0,
         guard_num = 0,
         skill_prac = [],
         skill_prac_lev = [],
         first_reward = [],
         first_exp_mod = 0,
         normal_reward = [],
         normal_exp_mod = 0,
         day_reward = [],
         day_exp_mod = 0,
         buff_num = 0,
         buff_id = 0}).

-record(glory_title_data,
        {title_id = 0,
         next_title_id = 0,
         title_name = "",
         honor_id = 0,
         rate = 0}).

-file("src/merge/merge_dets_glory.erl", 15).

do_init(Table = #merge_table{server =
                                 #merge_server{index = Size, size = Size}}) ->
    SrvList = merge_util:all_server(),
    List = [util:to_list(util:flist("~ts_~w",
                                    [Platform, ZoneId]))
            || #merge_server{platform = Platform, zone_id = ZoneId}
                   <- SrvList],
    merge(List),
    {ok, [], Table};
do_init(Table) -> {ok, [], Table}.

do_convert([], Table) -> {ok, Table}.

do_end(_Table) -> ignore.

merge([FirstDets | T]) ->
    dets:open_file(glory_floor,
                   [{file, "../dets/glory_floor.dets"},
                    {type, set},
                    {keypos, #glory_floor.floor}]),
    dets:delete_all_objects(glory_floor),
    dets:open_file(glory_floor_first,
                   [{file, "../dets/" ++ FirstDets ++ "/glory_floor.dets"},
                    {type, set},
                    {keypos, #glory_floor.floor}]),
    ets:new(glory_floor,
            [named_table,
             public,
             set,
             {keypos, #glory_floor.floor}]),
    case dets:first(glory_floor_first) of
        '$end_of_table' ->
            logger:info("~ts 目录下没有需要合并的爵位数据",
                        [FirstDets],
                        merge_dets_glory,
                        39);
        _ ->
            dets:traverse(glory_floor_first,
                          fun (F = #glory_floor{}) ->
                                  ets:insert(glory_floor, F),
                                  dets:insert(glory_floor, F),
                                  continue;
                              (_) -> continue
                          end),
            ok
    end,
    merge_other(T),
    dets:close(glory_floor),
    dets:close(glory_floor_first),
    ok.

merge_other([]) -> ok;
merge_other([PlatformZone | T]) ->
    {ok, DetsFlag} = util:string_to_term("glory_floor" ++
                                             PlatformZone),
    dets:open_file(DetsFlag,
                   [{file,
                     "../dets/" ++ PlatformZone ++ "/glory_floor.dets"},
                    {type, set},
                    {keypos, #glory_floor.floor}]),
    case dets:first(DetsFlag) of
        '$end_of_table' ->
            logger:info("~ts 目录下没有需要合并的爵位数据",
                        [PlatformZone],
                        merge_dets_glory,
                        65);
        _ ->
            dets:traverse(DetsFlag,
                          fun (F = #glory_floor{}) ->
                                  handle_compare(F),
                                  continue;
                              (_) -> continue
                          end),
            ok
    end,
    dets:close(DetsFlag),
    merge_other(T).

handle_compare(F = #glory_floor{floor = Floor,
                                record_list = NRecordList,
                                role_list = NRoleList, max_list = NMaxList}) ->
    case ets:lookup(glory_floor, Floor) of
        [OF = #glory_floor{record_list = RecordList,
                           role_list = RoleList, max_list = MaxList}] ->
            ets:insert(glory_floor,
                       OF#glory_floor{record_list = RecordList ++ NRecordList,
                                      role_list = RoleList ++ NRoleList,
                                      max_list = MaxList ++ NMaxList}),
            dets:insert(glory_floor,
                        OF#glory_floor{record_list = RecordList ++ NRecordList,
                                       role_list = RoleList ++ NRoleList,
                                       max_list = MaxList ++ NMaxList});
        [] ->
            ets:insert(glory_floor, F),
            dets:insert(glory_floor, F)
    end.

