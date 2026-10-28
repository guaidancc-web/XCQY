-file("src/mod/oracle_treasure/oracle_treasure_role_"
      "ver.erl",
      1).

-module(oracle_treasure_role_ver).

-export([do/1, do_unit/1]).

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

-file("src/mod/oracle_treasure/oracle_treasure_role_"
      "ver.erl",
      14).

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

-file("src/mod/oracle_treasure/oracle_treasure_role_"
      "ver.erl",
      15).

do({m_oracle_treasure,
    Ver = 1,
    IsOffer,
    UnitId,
    IsGet,
    CardGainList,
    MaxWave,
    WaveReward}) ->
    WeekTimes = 0,
    Times = 0,
    do({m_oracle_treasure,
        Ver + 1,
        IsOffer,
        UnitId,
        IsGet,
        CardGainList,
        MaxWave,
        WaveReward,
        WeekTimes,
        Times});
do(Data = #m_oracle_treasure{ver = 2}) -> {ok, Data};
do(Data) ->
    logger:error("数据转换失败:~w",
                 [Data],
                 oracle_treasure_role_ver,
                 27),
    {false, lang:get("天启试炼数据转换失败")}.

do_unit({oracle_treasure_unit,
         BaseId,
         Difficulty,
         KillTimes,
         OfferTeams}) ->
    Ver = 0,
    DiffStar = 0,
    DiffNum = 0,
    do_unit({oracle_treasure_unit,
             BaseId,
             Ver + 1,
             Difficulty,
             KillTimes,
             OfferTeams,
             DiffStar,
             DiffNum});
do_unit(Data = #oracle_treasure_unit{ver = 1}) ->
    {ok, Data};
do_unit(_D) ->
    logger:debug("数据版本 ~w",
                 [_D],
                 oracle_treasure_role_ver,
                 39),
    {false, lang:get("天启单位版本转换失败")}.

