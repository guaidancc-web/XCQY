-file("src/mod/gods_duel/gods_duel_ver.erl", 1).

-module(gods_duel_ver).

-export([conver_m_gods_duel/1,
         conver_match_profile/1,
         conver_m_gods_place/1]).

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

-file("src/mod/gods_duel/gods_duel_ver.erl", 15).

-file("inc/gods_duel.hrl", 1).

-record(gods_duel_team,
        {ver = 1 :: pos_integer(),
         id = {0, "", 0},
         name = "",
         lev = 0,
         match_group = 0,
         leader = {0, "", 0},
         member_num = 0,
         members = [],
         fight_capacity = 0,
         applys = [],
         invite_info = [],
         declaration = "",
         win_times = 0,
         loss_times = 0,
         qualification = 0,
         team_group_256 = 0,
         team_group_64 = 0,
         team_group_8 = 0,
         team_group_4 = 0,
         team_seq = 0,
         team_index = 0}).

-record(gods_duel_team_mate,
        {ver = 1,
         id = {0, "", 0},
         name = "",
         classes = 0,
         sex = 0,
         lev = 0,
         break_times = 0,
         position = 0,
         fight_capacity = 0,
         join_time = 0}).

-record(m_gods_duel,
        {ver = 2, team_id = {0, "", 0}, gods_score = 0}).

-record(gods_duel_season_data,
        {ver = 1, serial_id = 0, history_season_info = []}).

-record(gods_duel_season_info,
        {ver = 1,
         id = 0,
         status = 0,
         teams = [],
         group_order = 0,
         season_time_info = []}).

-record(invite_info,
        {id = {0, "", 0},
         name = "",
         lev = 0,
         break_times = 0,
         classes = 0,
         sex = 0,
         total_fc = 0,
         online = 0}).

-record(gods_duel_join_team,
        {id = {0, "", 0},
         team_pid = undefined,
         team_data = undefined,
         fighters = [],
         is_ready = false}).

-record(gods_duel_match,
        {id = {0, 0},
         teams = [],
         combat_pid = undefined :: pid(),
         calc_args = [],
         combat_ref = undefined,
         is_over = 0,
         map_id = 0,
         map_pid = undefined,
         roles = []}).

-record(gods_duel_match_profile,
        {id = 0,
         ver = 1,
         season_id = 0,
         match_type = 0,
         match_round = 0,
         match_id = 0,
         group_id = 0,
         combat_type = 0,
         atk_name,
         dfd_name,
         combat_pid = undefined :: pid(),
         is_over = 0,
         platform = "",
         zone_id = 0,
         time = 0,
         fc_diff = 0,
         round = 0}).

-record(gods_duel_fighter,
        {id = {0, "", 0} :: tuple(),
         name = "" :: string(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         kill_num = 0,
         dead_num = 0,
         total_heal = 0,
         control_num = 0,
         total_hurt = 0 :: non_neg_integer(),
         total_dmg = 0 :: non_neg_integer(),
         mvp_score = 0 :: non_neg_integer()}).

-record(gods_duel_vote,
        {ver = 0 :: non_neg_integer(),
         id = {0, "", 0} :: tuple(),
         name = "" :: bitstring(),
         sex = 0 :: 0..1,
         classes = 0 :: 0..4,
         lev = 0 :: non_neg_integer(),
         season = 0 :: non_neg_integer(),
         choices = [] :: list(),
         time = 0 :: non_neg_integer()}).

-record(gods_duel_vote_choice,
        {id = {0, "", 0} :: tuple(),
         match_round = 0 :: non_neg_integer(),
         match_zone = 0,
         is_right = 0 :: 0..2}).

-record(gods_duel_poll,
        {id = {0, "", 0} :: tuple(),
         match_round = 0 :: non_neg_integer(),
         voted_cnt = 0 :: non_neg_integer()}).

-record(gods_duel_profile,
        {id = {0, "", 0} :: tuple(),
         ver = 1 :: non_neg_integer(),
         name = "" :: string(),
         lev = 0 :: non_neg_integer(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         rank_lev = 1 :: non_neg_integer(),
         gods_duel_score = 0 :: non_neg_integer()}).

-record(gods_challenge_info,
        {id, combat_pid, is_over = 0}).

-record(gods_duel_team_rank,
        {ver = 1, serial_id = 0, history_season_info = []}).

-record(gods_duel_team_rank_data,
        {ver = 1,
         id = {0, "", 0},
         name = "",
         leader = {0, "", 0},
         member_num = 0,
         members = [],
         fight_capacity = 0,
         win_times = 0,
         qualification = 0,
         rank = 0}).

-record(gods_duel_team_rank_mate,
        {ver = 1,
         id = {0, "", 0},
         name = "",
         classes = 0,
         sex = 2,
         lev = 0,
         break_times = 0,
         position = 2,
         fight_capacity = 0,
         looks = []}).

-record(gods_challenge_team,
        {season_id = 0,
         team_name = "",
         member_num = 0,
         members = []}).

-record(gods_challenge_team_mate,
        {id = {0, "", 0}, name = ""}).

-file("src/mod/gods_duel/gods_duel_ver.erl", 16).

-file("inc/gods_place.hrl", 1).

-record(gods_place_team_statue,
        {ver = 1,
         team_id = 0,
         id = {0, "", 0},
         name = "",
         lev = 0,
         members = [],
         qualification = 0,
         serial_id = 0,
         team_leader = {0, "", 0}}).

-record(gods_place_team_mate_statue,
        {ver = 1,
         id = {0, "", 0},
         name = "",
         lev = 0,
         classes = 0,
         sex = 0,
         break_times = 0,
         looks = []}).

-record(m_gods_place,
        {ver = 3,
         group_id = 0,
         zone_id = 0,
         zone_pid = 0,
         pick_chest = 0,
         worship_times = 0,
         total_num = 0,
         sys_barrage = 1,
         ply_barrage = 1,
         barrage_time = 0,
         efficiency_flag = 0,
         pick_flag = 0}).

-file("src/mod/gods_duel/gods_duel_ver.erl", 17).

conver_match_profile({gods_duel_match_profile,
                      Id,
                      SeasonId,
                      MatchType,
                      MatchRound,
                      MatchId,
                      GroupId,
                      CombatType,
                      AtkName,
                      DfdName,
                      CombatPid,
                      IsOver,
                      Platform,
                      ZoneId,
                      Time}) ->
    Ver = 1,
    FcDiff = 0,
    Round = 0,
    conver_match_profile({gods_duel_match_profile,
                          Id,
                          Ver,
                          SeasonId,
                          MatchType,
                          MatchRound,
                          MatchId,
                          GroupId,
                          CombatType,
                          AtkName,
                          DfdName,
                          CombatPid,
                          IsOver,
                          Platform,
                          ZoneId,
                          Time,
                          FcDiff,
                          Round});
conver_match_profile(Data = #gods_duel_match_profile{ver
                                                         = 1}) ->
    {ok, Data};
conver_match_profile(_Data) ->
    logger:error("诸神录像数据转化出错:~w",
                 [_Data],
                 gods_duel_ver,
                 30),
    {false, lang:get("诸神录像数据转化出错")}.

conver_m_gods_duel({m_gods_duel, Ver = 1, TeamId}) ->
    GodsScore = 0,
    conver_m_gods_duel({m_gods_duel,
                        Ver + 1,
                        TeamId,
                        GodsScore});
conver_m_gods_duel(Data = #m_gods_duel{ver = 2}) ->
    {ok, Data};
conver_m_gods_duel(_Err) ->
    logger:error("角色诸神信息版本转换失败:~w",
                 [_Err],
                 gods_duel_ver,
                 39),
    {false, lang:get("角色诸神信息版本转换失败")}.

conver_m_gods_place({m_gods_place,
                     Ver = 1,
                     GroupId,
                     ZoneId,
                     ZonePid,
                     PickChest,
                     WorshipTimes,
                     TotalNum,
                     SysBarrage,
                     PlyBarrage,
                     BarrageTime}) ->
    EfficiencyFlag = 0,
    conver_m_gods_place({m_gods_place,
                         Ver + 1,
                         GroupId,
                         ZoneId,
                         ZonePid,
                         PickChest,
                         WorshipTimes,
                         TotalNum,
                         SysBarrage,
                         PlyBarrage,
                         BarrageTime,
                         EfficiencyFlag});
conver_m_gods_place({m_gods_place,
                     Ver = 2,
                     GroupId,
                     ZoneId,
                     ZonePid,
                     PickChest,
                     WorshipTimes,
                     TotalNum,
                     SysBarrage,
                     PlyBarrage,
                     BarrageTime,
                     EfficiencyFlag}) ->
    PickFlag = 0,
    conver_m_gods_place({m_gods_place,
                         Ver + 1,
                         GroupId,
                         ZoneId,
                         ZonePid,
                         PickChest,
                         WorshipTimes,
                         TotalNum,
                         SysBarrage,
                         PlyBarrage,
                         BarrageTime,
                         EfficiencyFlag,
                         PickFlag});
conver_m_gods_place(Data = #m_gods_place{ver = 3}) ->
    {ok, Data};
conver_m_gods_place(_Err) ->
    logger:error("角色诸神殿堂信息版本转换失败:~w",
                 [_Err],
                 gods_duel_ver,
                 51),
    {false, lang:get("角色诸神殿堂信息版本转换失败")}.

