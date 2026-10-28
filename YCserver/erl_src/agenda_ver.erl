-file("src/mod/agenda/agenda_ver.erl", 1).

-module(agenda_ver).

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

-file("src/mod/agenda/agenda_ver.erl", 12).

-file("inc/agenda.hrl", 1).

-record(m_agenda,
        {ver = 1 :: non_neg_integer(),
         progress = [],
         activity = 0 :: non_neg_integer(),
         last_joined = 0 :: non_neg_integer(),
         rewarded = [] :: [non_neg_integer()],
         last_rewarded = 0 :: non_neg_integer(),
         recommends = [] :: list(),
         last_recommended = 0 :: non_neg_integer()}).

-record(agenda_prog,
        {ver = 1,
         id = 0 :: non_neg_integer(),
         joined = 0 :: non_neg_integer(),
         last_joined = 0 :: non_neg_integer()}).

-record(agenda_stat,
        {id = 0 :: non_neg_integer(), joined = 0, finised = 0}).

-record(agenda_stat_role,
        {id = {0, "", 0},
         lev = 0,
         date = {0, 0, 0},
         logs = []}).

-record(m_agenda_week,
        {ver = 1,
         id = 0,
         week_activity = 0 :: non_neg_integer(),
         rewards = [],
         last_add_activity_time = 0}).

-file("src/mod/agenda/agenda_ver.erl", 13).

do({m_agenda,
    Ver = 0,
    Progress,
    Activity,
    Last_joined,
    Rewarded,
    Last_rewarded}) ->
    Recommends = [],
    Recommended = 0,
    do({m_agenda,
        Ver + 1,
        Progress,
        Activity,
        Last_joined,
        Rewarded,
        Last_rewarded,
        Recommends,
        Recommended});
do(Data = #m_agenda{ver = 1, progress = Progs}) ->
    case do_prog(Progs, []) of
        {ok, NewProgs} ->
            {ok, Data#m_agenda{progress = NewProgs}};
        Else -> Else
    end;
do(_) -> {false, lang:get("日程数据转换失败")}.

do_prog([], Progs) -> {ok, Progs};
do_prog([H | T], Progs) ->
    case do_prog(H) of
        {ok, D} -> do_prog(T, [D | Progs]);
        Else -> Else
    end.

do_prog({agenda_prog, Id, Joined}) ->
    do_prog({agenda_prog, 1, Id, Joined, 0});
do_prog(D = #agenda_prog{ver = 1}) -> {ok, D}.

