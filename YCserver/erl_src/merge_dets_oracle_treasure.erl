-file("src/merge/merge_dets_oracle_treasure.erl", 1).

-module(merge_dets_oracle_treasure).

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

-file("src/merge/merge_dets_oracle_treasure.erl", 14).

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

-file("src/merge/merge_dets_oracle_treasure.erl", 15).

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

-file("src/merge/merge_dets_oracle_treasure.erl", 16).

-file("inc/oracle_treasure.hrl", 1).

-record(m_oracle_treasure,
        {ver = 2,
         is_offer = 0,
         unit_id = 0,
         is_get = 0,
         card_gain_list = [],
         max_wave = 0,
         wave_reward = [],
         week_times = 0,
         times = 0}).

-record(oracle_treasure_state,
        {ts,
         timeout = 0,
         state_name,
         cross_type = 0,
         map_info = []}).

-record(oracle_treasure_unit,
        {base_id = {0, 0},
         ver = 1,
         difficulty = 1,
         kill_times = 0,
         offer_teams = [],
         now_star = 0,
         diff_num = 0}).

-record(oracle_treasure_team,
        {leader_id = {0, "", 0},
         all_mate_id = [],
         team_mates = [],
         record_id = {0, {0, "", 0}},
         wave = 0,
         use_time = 0}).

-record(oracle_treasure_offer_mate,
        {id = {0, "", 0},
         name = "",
         lev = 0,
         classes = 0,
         sex = 0,
         fc = 0,
         break_times = 0,
         status = 2,
         looks = []}).

-record(oracle_treasure_rank_rc,
        {id = {0, "", 0},
         name = "",
         lev = 0,
         classes = 0,
         sex = 0,
         fc = 0,
         break_times = 0,
         wave = 0,
         use_time = 0,
         rank = 0}).

-record(oracle_treasure_rank_list,
        {group = 0, min_val = {0, 0}, list = [], len = 0}).

-file("src/merge/merge_dets_oracle_treasure.erl", 17).

do_init(Table = #merge_table{server =
                                 #merge_server{index = Size, size = Size}}) ->
    SrvList = merge_util:all_server(),
    List = [util:to_list(util:flist("~ts_~w",
                                    [Platform, ZoneId]))
            || #merge_server{platform = Platform, zone_id = ZoneId}
                   <- SrvList],
    merge(List),
    merge_util:dets_merge(ets_oracle_treasure_offer,
                          "ets_oracle_treasure_offer.dets",
                          set,
                          1,
                          undefined),
    {ok, [], Table};
do_init(Table) -> {ok, [], Table}.

do_convert([], Table) -> {ok, Table}.

do_end(_Table) -> ignore.

merge([FirstDets | T]) ->
    dets:open_file(ets_oracle_treasure_unit,
                   [{file, "../dets/ets_oracle_treasure_unit.dets"},
                    {type, set},
                    {keypos, #oracle_treasure_unit.base_id}]),
    dets:delete_all_objects(ets_oracle_treasure_unit),
    dets:open_file(ets_oracle_treasure_unit_first,
                   [{file,
                     "../dets/" ++
                         FirstDets ++ "/ets_oracle_treasure_unit.dets"},
                    {type, set},
                    {keypos, #oracle_treasure_unit.base_id}]),
    ets:new(ets_oracle_treasure_unit,
            [named_table,
             public,
             set,
             {keypos, #oracle_treasure_unit.base_id}]),
    case dets:first(ets_oracle_treasure_unit_first) of
        '$end_of_table' ->
            logger:info("~ts 目录下没有需要合并的龙王试炼数据",
                        [FirstDets],
                        merge_dets_oracle_treasure,
                        45);
        _ ->
            dets:traverse(ets_oracle_treasure_unit_first,
                          fun (F = #oracle_treasure_unit{}) ->
                                  ets:insert(ets_oracle_treasure_unit, F),
                                  dets:insert(ets_oracle_treasure_unit, F),
                                  continue;
                              (_) -> continue
                          end),
            ok
    end,
    merge_other(T),
    dets:close(ets_oracle_treasure_unit),
    dets:close(ets_oracle_treasure_unit_first),
    ok.

merge_other([]) -> ok;
merge_other([PlatformZone | T]) ->
    {ok, DetsFlag} =
        util:string_to_term("ets_oracle_treasure_unit" ++
                                PlatformZone),
    dets:open_file(DetsFlag,
                   [{file,
                     "../dets/" ++
                         PlatformZone ++ "/ets_oracle_treasure_unit.dets"},
                    {type, set},
                    {keypos, #oracle_treasure_unit.base_id}]),
    case dets:first(DetsFlag) of
        '$end_of_table' ->
            logger:info("~ts 目录下没有需要合并的天启试炼数据",
                        [PlatformZone],
                        merge_dets_oracle_treasure,
                        71);
        _ ->
            dets:traverse(DetsFlag,
                          fun (F = #oracle_treasure_unit{}) ->
                                  handle_compare(F),
                                  continue;
                              (_) -> continue
                          end),
            ok
    end,
    dets:close(DetsFlag),
    merge_other(T).

handle_compare(FSpt = #oracle_treasure_unit{base_id =
                                                BaseId,
                                            offer_teams = OfferTeams,
                                            kill_times = KillTimes,
                                            difficulty = Difficulty}) ->
    case ets:lookup(ets_oracle_treasure_unit, BaseId) of
        [Spt = #oracle_treasure_unit{offer_teams = MOfferTeams,
                                     kill_times = MKillTimes,
                                     difficulty = MDifficulty}] ->
            ets:insert(ets_oracle_treasure_unit,
                       Spt#oracle_treasure_unit{offer_teams =
                                                    OfferTeams ++ MOfferTeams,
                                                kill_times =
                                                    max(KillTimes, MKillTimes),
                                                difficulty =
                                                    max(Difficulty,
                                                        MDifficulty)}),
            dets:insert(ets_oracle_treasure_unit,
                        Spt#oracle_treasure_unit{offer_teams =
                                                     OfferTeams ++ MOfferTeams,
                                                 kill_times =
                                                     max(KillTimes, MKillTimes),
                                                 difficulty =
                                                     max(Difficulty,
                                                         MDifficulty)});
        [] ->
            ets:insert(ets_oracle_treasure_unit, FSpt),
            dets:insert(ets_oracle_treasure_unit, FSpt)
    end.

