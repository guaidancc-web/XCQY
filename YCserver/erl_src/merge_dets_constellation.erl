-file("src/merge/merge_dets_constellation.erl", 1).

-module(merge_dets_constellation).

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

-file("src/merge/merge_dets_constellation.erl", 14).

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

-file("src/merge/merge_dets_constellation.erl", 15).

-file("inc/constellation.hrl", 1).

-record(m_constellation,
        {ver = 2,
         lev = 0 :: non_neg_integer(),
         finished = [],
         summoned = []}).

-record(constellation_first,
        {key = {0, 0},
         ver = 0,
         lev = 0 :: non_neg_integer(),
         winner = [],
         mtime = 0,
         base_id = 0}).

-record(constellation_unit,
        {id = {0, 0},
         lev = 0,
         base_id = 0,
         map_id = 0,
         x = 0,
         y = 0,
         fail = 0,
         guards = []}).

-record(constellation_winner,
        {ver = 0,
         id = {0, "", 0},
         name = "" :: string(),
         classes = 0 :: non_neg_integer(),
         sex = 0 :: non_neg_integer(),
         looks = [],
         finished = 0 :: non_neg_integer(),
         round = 0 :: non_neg_integer(),
         is_leader = 0 :: non_neg_integer()}).

-record(constellation_summoned,
        {ver = 2,
         lev = 0 :: non_neg_integer(),
         base_id = 0 :: non_neg_integer(),
         map = 0 :: non_neg_integer(),
         x = 0 :: non_neg_integer(),
         y = 0 :: non_neg_integer(),
         time = 0 :: non_neg_integer()}).

-record(constellation_role,
        {id = {0, "", 0},
         name = "" :: string(),
         classes = 0 :: non_neg_integer(),
         sex = 0 :: non_neg_integer(),
         id_now = 0 :: non_neg_integer(),
         title_lev = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         max_kill = 0 :: non_neg_integer()}).

-record(constellation_first_data,
        {min = 0, max = 0, rate = 0, attr = []}).

-record(constellation_guard,
        {id = {0, "", 0},
         name = "",
         lev = 0,
         sex = 0,
         classes = 0,
         looks = [],
         base_id = 0}).

-file("src/merge/merge_dets_constellation.erl", 16).

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
    dets:open_file(constellation_first1,
                   [{file, "../dets/constellation_first1.dets"},
                    {type, set},
                    {keypos, #constellation_first.key}]),
    dets:delete_all_objects(constellation_first1),
    dets:open_file(constellation_first_first,
                   [{file,
                     "../dets/" ++ First ++ "/constellation_first1.dets"},
                    {type, set},
                    {keypos, #constellation_first.key}]),
    ets:new(constellation_first1,
            [named_table,
             public,
             set,
             {keypos, #constellation_first.lev}]),
    case dets:first(constellation_first_first) of
        '$end_of_table' ->
            logger:info("~ts 目录下没有需要合并的星座挑战数据",
                        [First],
                        merge_dets_constellation,
                        40);
        _ ->
            dets:traverse(constellation_first_first,
                          fun (G = #constellation_first{}) ->
                                  ets:insert(constellation_first1, G),
                                  dets:insert(constellation_first1, G),
                                  continue;
                              (_) -> continue
                          end),
            ok
    end,
    merge_other(T),
    dets:close(constellation_first1),
    dets:close(constellation_first_first),
    ok.

merge_other([]) -> ok;
merge_other([PlatformZone | T]) ->
    {ok, DetsFlag} =
        util:string_to_term("constellation_first_" ++
                                PlatformZone),
    dets:open_file(DetsFlag,
                   [{file,
                     "../dets/" ++
                         PlatformZone ++ "/constellation_first1.dets"},
                    {type, set},
                    {keypos, #constellation_first.key}]),
    case dets:first(DetsFlag) of
        '$end_of_table' ->
            logger:info("~ts 目录下没有需要合并的星座挑战数据",
                        [PlatformZone],
                        merge_dets_constellation,
                        66);
        _ ->
            dets:traverse(DetsFlag,
                          fun (G = #constellation_first{}) ->
                                  handle_compare(G),
                                  continue;
                              (_) -> continue
                          end),
            ok
    end,
    dets:close(DetsFlag),
    merge_other(T).

handle_compare(G = #constellation_first{lev = Lev}) ->
    case ets:lookup(constellation_first1, Lev) of
        [#constellation_first{}] -> ok;
        _ ->
            ets:insert(constellation_first1, G),
            dets:insert(constellation_first1, G)
    end.

