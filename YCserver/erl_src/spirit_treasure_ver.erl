-file("src/mod/spirit_treasure/spirit_treasure_ver.erl",
      1).

-module(spirit_treasure_ver).

-export([do_unit/1]).

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

-file("src/mod/spirit_treasure/spirit_treasure_ver.erl",
      13).

-file("inc/spirit_treasure.hrl", 1).

-record(m_spirit_treasure,
        {ver = 1,
         is_offer = 0,
         unit_id = 0,
         is_get = 0,
         card_gain_list = [],
         max_wave = 0,
         wave_reward = []}).

-record(spirit_treasure_state,
        {ts,
         timeout = 0,
         state_name,
         cross_type = 0,
         map_info = []}).

-record(spirit_treasure_unit,
        {base_id = {0, 0},
         ver = 1,
         difficulty = 1,
         kill_times = 0,
         offer_teams = [],
         now_star = 1,
         diff_num = 0}).

-record(spirit_treasure_team,
        {leader_id = {0, "", 0},
         all_mate_id = [],
         team_mates = [],
         record_id = {0, {0, "", 0}},
         wave = 0,
         use_time = 0}).

-record(spirit_treasure_offer_mate,
        {id = {0, "", 0},
         name = "",
         lev = 0,
         classes = 0,
         sex = 0,
         fc = 0,
         break_times = 0,
         status = 2,
         looks = []}).

-record(spirit_treasure_rank_rc,
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

-record(spirit_treasure_rank_list,
        {group = 0, min_val = {0, 0}, list = [], len = 0}).

-file("src/mod/spirit_treasure/spirit_treasure_ver.erl",
      14).

do_unit({spirit_treasure_unit,
         BaseId,
         Difficulty,
         KillTimes,
         OfferTeams}) ->
    Ver = 0,
    NowStar = 1,
    DiffNum = 0,
    do_unit({spirit_treasure_unit,
             BaseId,
             Ver + 1,
             Difficulty,
             KillTimes,
             OfferTeams,
             NowStar,
             DiffNum});
do_unit(Data = #spirit_treasure_unit{ver = 1}) ->
    {ok, Data};
do_unit(_D) ->
    logger:debug("数据版本 ~w", [_D], spirit_treasure_ver, 27),
    {false, lang:get("龙王单位版本转换失败")}.

