-file("src/merge/merge_dets_arena.erl", 1).

-module(merge_dets_arena).

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

-file("src/merge/merge_dets_arena.erl", 17).

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

-file("src/merge/merge_dets_arena.erl", 18).

-file("inc/arena.hrl", 1).

-record(m_arena,
        {ver = 1,
         cd_time = 0 :: non_neg_integer(),
         acc_num = 0 :: non_neg_integer(),
         cup = 1000 :: non_neg_integer(),
         roll_time = 0,
         roll_id = 0,
         roll_graph = []}).

-record(arena_role,
        {id = {0, "", 0} :: tuple(),
         ver = 6,
         name = "" :: bitstring(),
         win = 0 :: non_neg_integer(),
         acc_num = 0,
         sex = 0 :: 0..1,
         classes = 0 :: 0..4,
         lev = 0 :: non_neg_integer(),
         last_time = 0 :: non_neg_integer(),
         is_robot = 0 :: 0..1,
         cup = 0,
         next_log_id = 1,
         log = [],
         win_list = [],
         win_ratio = 0,
         day_time_flag = 0,
         enemy = [],
         day_win = 0,
         day_lost = 0,
         def_acc_num = 0,
         def_win = 0,
         max_cup = 1000,
         acc_sword_num = 0,
         acc_mage_num = 0,
         acc_archer_num = 0,
         acc_orc_num = 0,
         acc_devine_num = 0,
         acc_moon_num = 0,
         acc_templar_num = 0,
         win_sword = 0,
         win_mage = 0,
         win_archer = 0,
         win_orc = 0,
         win_devine = 0,
         win_moon = 0,
         win_templar = 0,
         init_def = 0,
         formation = 1,
         formation_lev = 1,
         guards = [],
         last_win_role}).

-record(arena_enemy,
        {order = 0,
         role_id = {0, "", 0},
         is_robot = 0,
         classes = 0,
         lev = 0,
         sex = 0,
         cup = 0,
         soul = 1}).

-record(arena_log,
        {log_id = 1,
         s_role_id = {0, "", 0} :: tuple(),
         s_name = "" :: list(),
         result = 0 :: 0..1,
         t_role_id = {0, "", 0} :: tuple(),
         t_name = "" :: list(),
         time = 0 :: non_neg_integer(),
         s_cup = 0,
         t_cup = 0,
         s_cup_change = 0,
         t_cup_change = 0,
         feedback = 0}).

-record(arena_role_index,
        {id = {0, "", 0},
         lev = 0,
         cup = 0,
         time = 0,
         day_time_flag = 0,
         day_win = 0,
         day_lost = 0,
         win_list = [],
         win_ratio = 0}).

-record(arena_robot,
        {id = {0, "robot", 0},
         lev = 0,
         name = "",
         classes = 0,
         sex = 0,
         cup = 0}).

-record(arena_graph,
        {id = 1,
         base_id = 0,
         num = 0,
         status = 0,
         quality = 0}).

-record(arena_graph_base,
        {id = 1,
         base_id = 0,
         num = 0,
         quality = 0,
         name = "",
         sex = 0,
         classes = 0,
         lev_low = 0,
         lev_high = 0,
         ratio = 0,
         times = 1,
         order_list = []}).

-file("src/merge/merge_dets_arena.erl", 19).

do_init(Table = #merge_table{server =
                                 #merge_server{index = Size, size = Size}}) ->
    merge_util:dets_merge(arena_role,
                          "arena_role.dets",
                          set,
                          #arena_role.id,
                          undefined),
    SrvList = merge_util:all_server(),
    List = [util:to_list(util:flist("~ts_~w",
                                    [Platform, ZoneId]))
            || #merge_server{platform = Platform, zone_id = ZoneId}
                   <- SrvList],
    merge_arena_log(List),
    {ok, [], Table};
do_init(Table) -> {ok, [], Table}.

do_convert([], Table) -> {ok, Table}.

do_end(_Table) -> ignore.

merge_arena_log(L) ->
    dets:open_file(arena_log,
                   [{file, "../dets/arena_log.dets"},
                    {type, set},
                    {keypos, 1}]),
    dets:delete_all_objects(arena_log),
    ets:new(arena_log,
            [named_table, public, set, {keypos, 1}]),
    merge_arena_log_other(L),
    dets:close(arena_log),
    ok.

merge_arena_log_other([]) -> ok;
merge_arena_log_other([PlatformZone | T]) ->
    {ok, DetsFlag} = util:string_to_term("arena_log_" ++
                                             PlatformZone),
    dets:open_file(DetsFlag,
                   [{file,
                     "../dets/" ++ PlatformZone ++ "/arena_log.dets"},
                    {type, set}]),
    case dets:first(DetsFlag) of
        '$end_of_table' ->
            logger:info("~s 目录下没有需要合并的竞技场排名数据",
                        [PlatformZone],
                        merge_dets_arena,
                        54);
        _ ->
            dets:traverse(DetsFlag,
                          fun (Data = {_Key, _Val}) ->
                                  handle_compare(Data),
                                  continue;
                              (_) -> continue
                          end),
            ok
    end,
    dets:close(DetsFlag),
    merge_arena_log_other(T).

handle_compare(Data = {Key = arena_log,
                       {RankList1, LastRankList1, LastJoin1, TodayJoin1}}) ->
    case ets:lookup(arena_log, Key) of
        [{Key,
          {RankList2, LastRankList2, LastJoin2, TodayJoin2}}] ->
            NewRankList = RankList1 ++ RankList2,
            NewRankList1 = util:keys_sort([#arena_role.acc_num,
                                           #arena_role.lev,
                                           #arena_role.cup],
                                          NewRankList),
            NewRankList2 = lists:sublist(NewRankList1, 100),
            NewLastRankList = LastRankList1 ++ LastRankList2,
            NewLastJoin = LastJoin1 ++ LastJoin2,
            NewTodayJoin = TodayJoin1 ++ TodayJoin2,
            NewData = {Key,
                       {NewRankList2,
                        NewLastRankList,
                        NewLastJoin,
                        NewTodayJoin}},
            ets:insert(arena_log, NewData),
            dets:insert(arena_log, NewData);
        [] ->
            ets:insert(arena_log, Data),
            dets:insert(arena_log, Data)
    end;
handle_compare(_) -> ok.

