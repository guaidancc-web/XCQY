-file("src/mod/skill/skill_ver.erl", 1).

-module(skill_ver).

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

-file("src/mod/skill/skill_ver.erl", 11).

-file("inc/skill.hrl", 1).

-record(m_skill,
        {ver = 6 :: pos_integer(),
         skills = [] :: [{non_neg_integer(), non_neg_integer()}],
         is_open_skl_prac = 0 :: 0 | 1,
         selected_skl_prac = 0 :: non_neg_integer(),
         skill_prac = [] :: list(),
         skill_couple = [] :: list(),
         skill_sworn = [] :: list(),
         speed = [] :: list(),
         skill_unique = [],
         skill_clsld_done = [],
         unique_coolddown_time = 0,
         skl_unique_point = 100,
         sq_double = 0,
         is_open_sq_double = 0,
         sq_exp_statistics = []}).

-record(role_base_skill,
        {id = 0,
         lev = 0,
         type :: undefined | non_neg_integer(),
         sub_type :: undefined | non_neg_integer(),
         max_lev = 0,
         name = "",
         way = 1,
         study_lev = 1,
         cost = [],
         attr = []}).

-record(skill,
        {id = 0,
         lev = 0,
         type = 0 :: non_neg_integer(),
         sub_type = 0 :: non_neg_integer(),
         speed = 1,
         name = "",
         acc_ratio = 1000,
         acc_low = 0,
         acc_high = 1000,
         attack_type = 0 :: non_neg_integer(),
         elem_type = 0 :: non_neg_integer(),
         target_type = 1 :: non_neg_integer(),
         attack_times = 1 :: non_neg_integer(),
         target_list = [],
         self_cond = [],
         self_loss = [],
         target_cond = [],
         dmg_addt = 0 :: non_neg_integer(),
         dmg_ratio = [1000] :: non_neg_integer(),
         pre_cooldown = 0,
         cooldown = 0 :: non_neg_integer(),
         cost_mp = 0 :: non_neg_integer(),
         cost_anger = 0,
         cost_other = [] :: [{atom(), non_neg_integer()}],
         buff_self = [] :: [tuple()],
         buff_target = [] :: [tuple()],
         script_id = 0 :: non_neg_integer(),
         script_args = [] :: [integer()],
         addt_scripts = [] ::
             [{non_neg_integer(), non_neg_integer(), list()}],
         play_time = 0 :: non_neg_integer()}).

-record(chief_classes,
        {leader_id = 0,
         classes = 0,
         name = "",
         sex = 0,
         lev = 0,
         looks = []}).

-record(sq_exp_statistics,
        {combat_type = 0, times = 0, gain = 0, real_gain = 0}).

-file("src/mod/skill/skill_ver.erl", 12).

do({m_skill,
    Ver = 1,
    Skills,
    IsOpenSklPrac,
    SelectedSklPrac,
    SkillPrac}) ->
    SkillCouple = [],
    do({m_skill,
        Ver + 1,
        Skills,
        IsOpenSklPrac,
        SelectedSklPrac,
        SkillPrac,
        SkillCouple});
do({m_skill,
    Ver = 2,
    Skills,
    IsOpenSklPrac,
    SelectedSklPrac,
    SkillPrac,
    SkillCouple}) ->
    SkillSworn = [],
    do({m_skill,
        Ver + 1,
        Skills,
        IsOpenSklPrac,
        SelectedSklPrac,
        SkillPrac,
        SkillCouple,
        SkillSworn});
do({m_skill,
    Ver = 3,
    Skills,
    IsOpenSklPrac,
    SelectedSklPrac,
    SkillPrac,
    SkillCouple,
    SkillSworn}) ->
    Speed = [],
    do({m_skill,
        Ver + 1,
        Skills,
        IsOpenSklPrac,
        SelectedSklPrac,
        SkillPrac,
        SkillCouple,
        SkillSworn,
        Speed});
do({m_skill,
    Ver = 4,
    Skills,
    IsOpenSklPrac,
    SelectedSklPrac,
    SkillPrac,
    SkillCouple,
    SkillSworn,
    Speed}) ->
    SkillUnique = [],
    SkillClsldDone = [],
    UniqueCoolddownTime = 0,
    SklUniquePoint = 100,
    SqDouble = 0,
    IsOpenSqDouble = 0,
    do({m_skill,
        Ver + 1,
        Skills,
        IsOpenSklPrac,
        SelectedSklPrac,
        SkillPrac,
        SkillCouple,
        SkillSworn,
        Speed,
        SkillUnique,
        SkillClsldDone,
        UniqueCoolddownTime,
        SqDouble,
        IsOpenSqDouble,
        SklUniquePoint});
do({m_skill,
    Ver = 5,
    Skills,
    IsOpenSklPrac,
    SelectedSklPrac,
    SkillPrac,
    SkillCouple,
    SkillSworn,
    Speed,
    SkillUnique,
    SkillClsldDone,
    UniqueCoolddownTime,
    SqDouble,
    IsOpenSqDouble,
    SklUniquePoint}) ->
    SkillStatistics = [],
    do({m_skill,
        Ver + 1,
        Skills,
        IsOpenSklPrac,
        SelectedSklPrac,
        SkillPrac,
        SkillCouple,
        SkillSworn,
        Speed,
        SkillUnique,
        SkillClsldDone,
        UniqueCoolddownTime,
        SqDouble,
        IsOpenSqDouble,
        SklUniquePoint,
        SkillStatistics});
do(Data = #m_skill{}) -> {ok, Data};
do(Data) ->
    logger:error("技能数据转换出错：~w", [Data], skill_ver, 36),
    {false, lang:get("技能数据转换出错")}.

