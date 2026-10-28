-file("src/merge/merge_dets_honor.erl", 1).

-module(merge_dets_honor).

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

-file("src/merge/merge_dets_honor.erl", 12).

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

-file("src/merge/merge_dets_honor.erl", 13).

-file("inc/honor.hrl", 1).

-record(m_honor,
        {ver = 3,
         use_id = 0,
         last_id = 0,
         r_list = [] :: list(),
         pre_id = 0,
         r_pre_list = [] :: list(),
         pre_reward_list = [] :: list()}).

-record(honor,
        {id = 0 :: non_neg_integer(),
         end_time = 0 :: non_neg_integer()}).

-record(pre_honor,
        {pre_id = 0 :: non_neg_integer(),
         end_time = 0 :: non_neg_integer()}).

-record(honor_info,
        {key :: undefined | atom(),
         list = [] :: list(),
         end_time = 0 :: non_neg_integer()}).

-record(honor_base,
        {id = 0 :: non_neg_integer(),
         name = "" :: list(),
         type = 0 :: non_neg_integer(),
         mode_type = 0 :: non_neg_integer(),
         show_type = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         is_cast = 0,
         sex = 2 :: non_neg_integer(),
         attr_list = [] :: list(),
         is_can_pre = 0 :: non_neg_integer(),
         collect_val = 0 :: non_neg_integer(),
         color = 12 :: non_neg_integer()}).

-record(pre_honor_base,
        {pre_id = 0 :: non_neg_integer(),
         pre_name = "" :: list(),
         is_cast = 0,
         items = [] :: list(),
         loss_items = [] :: list()}).

-file("src/merge/merge_dets_honor.erl", 14).

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

merge([First | T]) ->
    dets:open_file(honor_info,
                   [{file, "../dets/honor_info.dets"},
                    {type, set},
                    {keypos, #honor_info.key}]),
    dets:delete_all_objects(honor_info),
    dets:open_file(honor_info_first,
                   [{file, "../dets/" ++ First ++ "/honor_info.dets"},
                    {type, set},
                    {keypos, #honor_info.key}]),
    ets:new(honor_info,
            [named_table, public, set, {keypos, #honor_info.key}]),
    case dets:first(honor_info_first) of
        '$end_of_table' ->
            logger:info("~ts 目录下没有需要合并的称号数据",
                        [First],
                        merge_dets_honor,
                        38);
        _ ->
            dets:traverse(honor_info_first,
                          fun (HonorInfo = #honor_info{}) ->
                                  ets:insert(honor_info, HonorInfo),
                                  dets:insert(honor_info, HonorInfo),
                                  continue;
                              (_) -> continue
                          end),
            ok
    end,
    merge_other(T),
    dets:close(honor_info),
    dets:close(honor_info_first),
    ok.

merge_other([]) -> ok;
merge_other([PlatformZone | T]) ->
    {ok, DetsFlag} = util:string_to_term("honor_info_" ++
                                             PlatformZone),
    dets:open_file(DetsFlag,
                   [{file,
                     "../dets/" ++ PlatformZone ++ "/honor_info.dets"},
                    {type, set},
                    {keypos, #honor_info.key}]),
    case dets:first(DetsFlag) of
        '$end_of_table' ->
            logger:info("~ts 目录下没有需要合并的称号数据",
                        [PlatformZone],
                        merge_dets_honor,
                        64);
        _ ->
            dets:traverse(DetsFlag,
                          fun (HonorInfo = #honor_info{}) ->
                                  handle_compare(HonorInfo),
                                  continue;
                              (_) -> continue
                          end),
            ok
    end,
    dets:close(DetsFlag),
    merge_other(T).

handle_compare(Honor = #honor_info{key = Key,
                                   list = List1}) ->
    case ets:lookup(honor_info, Key) of
        [HonorInfo = #honor_info{list = List2}] ->
            ets:insert(honor_info,
                       HonorInfo#honor_info{list = List1 ++ List2}),
            dets:insert(honor_info,
                        HonorInfo#honor_info{list = List1 ++ List2});
        [] ->
            ets:insert(honor_info, Honor),
            dets:insert(honor_info, Honor)
    end.

