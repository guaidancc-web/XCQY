-file("src/mod/quest/goal_ver.erl", 1).

-module(goal_ver).

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

-file("src/mod/quest/goal_ver.erl", 8).

-file("inc/goal.hrl", 1).

-record(m_goal,
        {ver = 2 :: non_neg_integer(),
         finish = [] :: [pos_integer()],
         doing = [] :: [tuple()],
         day_reward = [] :: [],
         days = 0 :: non_neg_integer(),
         day_time = 0 :: non_neg_integer(),
         discount = [],
         count_reward = []}).

-file("src/mod/quest/goal_ver.erl", 9).

-spec do(tuple()) -> {false, bitstring()} |
                     {ok, #m_goal{}}.

do({m_goal,
    Ver = 0,
    Finish,
    Doing,
    DayReward,
    Days,
    DayTime,
    DisCount}) ->
    CountReward = [],
    do({m_goal,
        Ver + 1,
        Finish,
        Doing,
        DayReward,
        Days,
        DayTime,
        DisCount,
        CountReward});
do({m_goal,
    Ver = 1,
    _Finish,
    _Doing,
    _DayReward,
    Days,
    DayTime,
    DisCount,
    CountReward}) ->
    do({m_goal,
        Ver + 1,
        [],
        [],
        [],
        Days,
        DayTime,
        DisCount,
        CountReward});
do(MGoal = #m_goal{ver = 2}) -> {ok, MGoal};
do(_) -> {false, lang:get("任务数据版本转换")}.

