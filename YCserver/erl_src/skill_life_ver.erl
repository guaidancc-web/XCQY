-file("src/mod/skill/skill_life_ver.erl", 1).

-module(skill_life_ver).

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

-file("src/mod/skill/skill_life_ver.erl", 11).

-file("inc/skill_life.hrl", 1).

-record(m_skill_life, {ver = 2, skills = []}).

-record(skill_life, {id = 0, lev = 0, exp = 0}).

-file("src/mod/skill/skill_life_ver.erl", 12).

do({m_skill_life, Ver = 1, Skills}) ->
    NewSkills = [#skill_life{id = Id, lev = Lev, exp = 0}
                 || {skill_life, Id, Lev} <- Skills],
    do({m_skill_life, Ver + 1, NewSkills});
do(Data = #m_skill_life{}) -> {ok, Data};
do(Data) ->
    logger:error("技能数据转换出错：~w", [Data], skill_life_ver, 20),
    {false, lang:get("技能数据转换出错")}.

