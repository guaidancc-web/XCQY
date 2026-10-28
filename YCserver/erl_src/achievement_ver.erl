-file("src/mod/quest/achievement_ver.erl", 1).

-module(achievement_ver).

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

-file("src/mod/quest/achievement_ver.erl", 11).

-file("inc/achievement.hrl", 1).

-record(m_achievement,
        {ver = 3 :: pos_integer(),
         point = 0 :: non_neg_integer(),
         finish = [] :: [{pos_integer(), pos_integer()}],
         doing = [] :: [tuple()],
         overdue = [] :: [pos_integer()],
         assets_point = 0 :: non_neg_integer(),
         focus = []}).

-record(achievement_log,
        {id = 0,
         accept = 0 :: integer(),
         finish = 0 :: integer()}).

-file("src/mod/quest/achievement_ver.erl", 12).

do({m_achievement,
    Ver = 1,
    Point,
    Finish,
    Doing,
    Overdue}) ->
    AssetsPoint = Point,
    do({m_achievement,
        Ver + 1,
        Point,
        Finish,
        Doing,
        Overdue,
        AssetsPoint});
do({m_achievement,
    Ver = 2,
    Point,
    Finish,
    Doing,
    Overdue,
    AssetsPoint}) ->
    Focus = [],
    do({m_achievement,
        Ver + 1,
        Point,
        Finish,
        Doing,
        Overdue,
        AssetsPoint,
        Focus});
do(Data = #m_achievement{}) -> {ok, Data};
do(Data) ->
    logger:error("成就数据转换出错：~w",
                 [Data],
                 achievement_ver,
                 22),
    {false, lang:get("成就数据转换出错")}.

