-file("src/mod/endless_challenge/endless_challenge_v"
      "er.erl",
      1).

-module(endless_challenge_ver).

-export([do/1]).

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

-file("src/mod/endless_challenge/endless_challenge_v"
      "er.erl",
      12).

-file("inc/endless_challenge.hrl", 1).

-record(m_endless_challenge,
        {ver = 3 :: pos_integer(),
         is_prepare = 0 :: non_neg_integer(),
         choose_skills = [],
         reward_list = [],
         best_wave = 0 :: non_neg_integer(),
         skill_list = [] :: list(),
         turn_count = 0,
         free_count = 0,
         fighter_times = 0}).

-record(mate_data,
        {id = {0, "", 0},
         name = "",
         classes = 0,
         sex = 0,
         lev = 0,
         best_wave = 0,
         max_wave = 0,
         is_prepare = 0 :: non_neg_integer(),
         choose_skills = []}).

-record(endless_challenge_rank,
        {ver = 1 :: non_neg_integer(),
         id = {0, "", 0},
         name = "",
         classes = 0,
         sex = 0,
         lev = 0,
         wave = 0 :: non_neg_integer(),
         use_time = 0 :: non_neg_integer(),
         mate_datas = []}).

-file("src/mod/endless_challenge/endless_challenge_v"
      "er.erl",
      13).

do({m_endless_challenge,
    Ver = 1,
    IsPrepare,
    ChooseSkills,
    RewardList,
    BestWave,
    SkillList}) ->
    TrunCount = 0,
    FreeCount = 0,
    FightTimes = case BestWave =:= 0 of
                     true -> 1;
                     false -> 0
                 end,
    do({m_endless_challenge,
        Ver + 1,
        IsPrepare,
        ChooseSkills,
        RewardList,
        BestWave,
        SkillList,
        TrunCount,
        FreeCount,
        FightTimes});
do({m_endless_challenge,
    Ver = 2,
    IsPrepare,
    ChooseSkills,
    RewardList,
    BestWave,
    SkillList,
    TrunCount,
    FreeCount,
    FightTimes}) ->
    NewSkillList = SkillList -- [82122, 82126],
    NewChooseSkills = lists:filter(fun ({_,
                                         ChooseSkillId}) ->
                                           lists:member(ChooseSkillId,
                                                        [82122, 82126])
                                               =:= false
                                   end,
                                   ChooseSkills),
    do({m_endless_challenge,
        Ver + 1,
        IsPrepare,
        NewChooseSkills,
        RewardList,
        BestWave,
        NewSkillList,
        TrunCount,
        FreeCount,
        FightTimes});
do(Data = #m_endless_challenge{ver = 3}) -> {ok, Data};
do(Data) ->
    logger:error("无尽挑战数据版本转化失败：~w",
                 [Data],
                 endless_challenge_ver,
                 30),
    {false, lang:get("无尽挑战数据版本转化失败：")}.

