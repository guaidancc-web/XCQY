-file("src/mod/classes_challenge/classes_challenge_v"
      "er.erl",
      1).

-module(classes_challenge_ver).

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

-file("src/mod/classes_challenge/classes_challenge_v"
      "er.erl",
      12).

-file("inc/classes_challenge.hrl", 1).

-record(m_classes_challenge,
        {ver = 2,
         id = 0 :: integer(),
         round = 0 :: integer(),
         done_list = [] :: list(),
         rewarded = [] :: list(),
         last_accepted = 0 :: integer(),
         time_span = 0 :: integer(),
         triggers = [],
         star = 0 :: integer(),
         gains = []}).

-record(classes_challenge_team,
        {ver = 0,
         id = [] :: list(),
         time_span = 0 :: integer(),
         members = [],
         star = 0 :: non_neg_integer(),
         rank = 0 :: non_neg_integer()}).

-record(classes_challenge_role,
        {ver = 0,
         id = {0, "", 0},
         name = "" :: string(),
         sex = 0 :: 0 | 1,
         classes = 0 :: 0..5,
         time_span = 0 :: integer(),
         rank = 0 :: non_neg_integer(),
         star = 0 :: non_neg_integer(),
         is_leader = 0 :: 0 | 1}).

-file("src/mod/classes_challenge/classes_challenge_v"
      "er.erl",
      13).

do({m_classes_challenge,
    Ver = 0,
    Id,
    Round,
    Done_list,
    Rewarded,
    Last_accepted,
    Time_span,
    Triggers}) ->
    Star = 0,
    do({m_classes_challenge,
        Ver + 1,
        Id,
        Round,
        Done_list,
        Rewarded,
        Last_accepted,
        Time_span,
        Triggers,
        Star});
do({m_classes_challenge,
    Ver = 1,
    Id,
    Round,
    Done_list,
    Rewarded,
    Last_accepted,
    Time_span,
    Triggers,
    Star}) ->
    Gains = [],
    do({m_classes_challenge,
        Ver + 1,
        Id,
        Round,
        Done_list,
        Rewarded,
        Last_accepted,
        Time_span,
        Triggers,
        Star,
        Gains});
do(Data = #m_classes_challenge{ver = 2}) -> {ok, Data};
do(_) -> {false, lang:get("职业挑战数据转换失败")}.

