-file("src/lib/date.erl", 1).

-module(date).

-export([now2/0,
         unixtime/0,
         unixtime2/0,
         unixtime/1,
         is_valid/2,
         is_same_day/2,
         now_diff/2,
         next_diff/3,
         next_diff/2,
         next_diff/1,
         week_next_diff/2,
         week_next_diff/3,
         diff/2,
         diff/3,
         day_diff/2,
         datetime_to_seconds/1,
         seconds_to_datetime/1,
         is_today/1,
         is_today_five_reset/1,
         is_same_five_reset/2,
         is_same_week/2,
         is_same_week/3,
         day_of_the_week/1,
         day_of_the_week/3,
         open_srv_day/0,
         parse_time/1,
         parse_time/2,
         get_five_reset/1,
         seconds_to_str/1,
         hour/0,
         time/0,
         date/0,
         date_to_gregorian_days/3,
         seconds_of_the_day/0,
         seconds_of_the_day/1]).

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

-file("src/lib/date.erl", 49).

now2() -> os:timestamp().

-spec unixtime() -> pos_integer().

unixtime() ->
    {M, S, _} = erlang:now(),
    M * 1000000 + S.

-spec unixtime2() -> pos_integer().

unixtime2() ->
    {M, S, _} = os:timestamp(),
    M * 1000000 + S.

-spec unixtime(X) -> pos_integer() when X :: ms |
                                             zero |
                                             {zero, pos_integer()} |
                                             {next_day, pos_integer()}.

unixtime(ms) ->
    {S1, S2, S3} = erlang:now(),
    trunc(S1 * 1000000000 + S2 * 1000 + S3 / 1000);
unixtime(zero) ->
    {M, S, MS} = erlang:now(),
    {_, Time} = calendar:now_to_local_time({M, S, MS}),
    M * 1000000 + S - calendar:time_to_seconds(Time);
unixtime(five) -> unixtime(zero) + 3600 * 5;
unixtime({five, Ts}) -> unixtime({zero, Ts}) + 3600 * 5;
unixtime({zero, Ts}) ->
    Base = unixtime(zero),
    case Ts > Base of
        false -> Base - util:ceil((Base - Ts) / 86400) * 86400;
        true -> (Ts - Base) div 86400 * 86400 + Base
    end;
unixtime({next_day, Ts}) ->
    unixtime({zero, Ts}) + 86400;
unixtime({next_time, DayTs}) ->
    Now = unixtime(),
    NextT = next_diff(DayTs),
    Now + NextT.

-spec open_srv_day() -> non_neg_integer() | false.

open_srv_day() ->
    case env:srv_open_time() of
        0 -> false;
        OpenTime ->
            Now = date:unixtime(),
            day_diff(OpenTime, Now) + 1
    end.

-spec diff(atom(), pos_integer()) -> pos_integer().

diff(T, Ts) -> diff(T, Ts, unixtime(ms)).

-spec diff(atom(), pos_integer(),
           pos_integer()) -> pos_integer().

diff(second, Ts1, Ts2) -> Ts1 - Ts2;
diff(minute, Ts1, Ts2) -> trunc((Ts1 - Ts2) / 60);
diff(hour, Ts1, Ts2) -> trunc((Ts1 - Ts2) / 3600);
diff(day, Ts1, Ts2) -> trunc((Ts1 - Ts2) / 86400);
diff(week, Ts1, Ts2) when Ts2 < Ts1 ->
    diff(week, Ts2, Ts1);
diff(week, Ts1, Ts2) ->
    case is_same_day(Ts1, Ts2) of
        true -> 0;
        _ ->
            TsW1 = day_of_the_week(Ts1),
            TsW2 = day_of_the_week(Ts2),
            NewTs1 = Ts1 + (7 - TsW1) * 86400,
            NewTs2 = Ts2 + (7 - TsW2) * 86400,
            diff(week7, NewTs1, NewTs2)
    end;
diff(Label = {week, _}, Ts1, Ts2) when Ts2 < Ts1 ->
    diff(Label, Ts2, Ts1);
diff({week, WeekDay}, Ts1, Ts2) ->
    case is_same_day(Ts1, Ts2) of
        true -> 0;
        _ ->
            TsW1 = day_of_the_week(Ts1),
            TsW2 = day_of_the_week(Ts2),
            Weekend1 = weekend_diff(WeekDay, TsW1),
            Weekend2 = weekend_diff(WeekDay, TsW2),
            NewTs1 = Ts1 + (Weekend1 - TsW1) * 86400,
            NewTs2 = Ts2 + (Weekend2 - TsW2) * 86400,
            diff(week7, NewTs1, NewTs2)
    end;
diff(week7, Ts1, Ts2) ->
    trunc((Ts2 - Ts1) / (7 * 86400)).

weekend_diff(WeekDay, TsW1) when WeekDay >= TsW1 ->
    WeekDay;
weekend_diff(WeekDay, _TsW1) -> WeekDay + 7.

day_diff(FromTime, ToTime) when ToTime > FromTime ->
    FromDate = unixtime({zero, FromTime}),
    ToDate = unixtime({zero, ToTime}),
    case (ToDate - FromDate) / (3600 * 24) of
        Diff when Diff < 0 -> 0;
        Diff -> round(Diff)
    end;
day_diff(FromTime, ToTime) when ToTime =:= FromTime ->
    0;
day_diff(FromTime, ToTime) ->
    day_diff(ToTime, FromTime).

-spec next_diff(H, M, S) -> Seconds when H :: 0..23,
                                         M :: 0..59, S :: 0..59,
                                         Seconds :: pos_integer().

next_diff(H, M, S) ->
    Sec = H * 3600 + M * 60 + S,
    next_diff(Sec).

-spec next_diff(0..86400 | [0..86400]) -> Seconds ::
                                              pos_integer().

next_diff(L = [_ | _]) ->
    lists:min([next_diff(Sec) || Sec <- L]);
next_diff({H, M, S}) -> next_diff(H, M, S);
next_diff(Sec) ->
    Now = unixtime(),
    next_diff(Sec, Now).

next_diff(Sec, T) ->
    Zero = unixtime({zero, T}),
    Base = Zero + Sec,
    case Base > T of
        true -> Base - T;
        false -> Base + 86400 - T
    end.

-spec week_next_diff([1..7],
                     0..86400 | [0..86400]) -> Seconds :: pos_integer().

week_next_diff(WeekDays = [_ | _], Sec) ->
    Now = unixtime(),
    week_next_diff(WeekDays, Now, Sec).

week_next_diff(WeekDays = [_ | _], Now, Sec) ->
    NextT = next_diff(Sec),
    WeekDay = day_of_the_week(Now + NextT),
    do_week_next_diff(WeekDay, WeekDays, NextT, 0).

do_week_next_diff(_WeekDay, _WeekDays, _NextT, N)
    when N > 7 ->
    io:format("[~w:~w]error:WeekDays:~w",
              [date, 216, _WeekDays]),
    0;
do_week_next_diff(WeekDay, WeekDays, NextT, N) ->
    case lists:member(WeekDay, WeekDays) of
        true -> NextT;
        false when WeekDay >= 7 ->
            do_week_next_diff(1, WeekDays, NextT + 86400, N + 1);
        false ->
            do_week_next_diff(WeekDay + 1,
                              WeekDays,
                              NextT + 86400,
                              N + 1)
    end.

-spec now_diff(N, {H, I, S}) -> integer() when N ::
                                                   today |
                                                   tomorrow |
                                                   non_neg_integer(),
                                               H :: 0..23, I :: 0..59,
                                               S :: 0..59.

now_diff(today, {H, I, S}) -> now_diff(0, {H, I, S});
now_diff(tomorrow, {H, I, S}) -> now_diff(1, {H, I, S});
now_diff(N, {H, I, S}) when is_integer(N), N >= 0 ->
    {_, Time} = calendar:local_time(),
    N * 86400 + calendar:time_to_seconds({H, I, S}) -
        calendar:time_to_seconds(Time).

-spec is_valid(T, Datetime) -> boolean() when T ::
                                                  date | time | datetime,
                                              Datetime :: {Y, M, D} |
                                                          {H, I, S} |
                                                          {{Y, M, D},
                                                           {H, I, S}},
                                              Y :: pos_integer(),
                                              M :: pos_integer(),
                                              D :: pos_integer(),
                                              H :: non_neg_integer(),
                                              I :: non_neg_integer(),
                                              S :: non_neg_integer().

is_valid(date, Date) -> calendar:valid_date(Date);
is_valid(time, {H, I, S}) ->
    H >= 0 andalso
        H < 24 andalso
            I >= 0 andalso I < 60 andalso S >= 0 andalso S < 60;
is_valid(datetime, {Date, Time}) ->
    calendar:valid_date(Date) andalso is_valid(time, Time);
is_valid(_, _) -> false.

-spec is_same_day(Ts1, Ts2) -> boolean() when Ts1 ::
                                                  pos_integer(),
                                              Ts2 :: pos_integer().

is_same_day(Ts1, Ts2) ->
    unixtime({zero, Ts1}) =:= unixtime({zero, Ts2}).

-spec is_today(pos_integer()) -> boolean().

is_today(Unixtime) ->
    unixtime(zero) =:= unixtime({zero, Unixtime}).

is_today_five_reset(Unixtime) ->
    get_five_reset(date:unixtime()) =:=
        get_five_reset(Unixtime).

is_same_five_reset(Ts1, Ts2) ->
    get_five_reset(Ts1) =:= get_five_reset(Ts2).

get_five_reset(Unixtime) ->
    UnixFive = unixtime({five, Unixtime}),
    case Unixtime < UnixFive of
        true -> UnixFive - 86400;
        false -> UnixFive
    end.

is_same_week(Ts1, Ts2) -> is_same_week(Ts1, Ts2, 0).

is_same_week(Ts1, Ts2, OffSet) when Ts1 > Ts2 ->
    is_same_week(Ts2, Ts1, OffSet);
is_same_week(Ts1, Ts2, _OffSet)
    when Ts2 - Ts1 >= 86400 * 7 ->
    false;
is_same_week(Ts1, Ts2, OffSet) ->
    BaseT = 1388937600 + OffSet,
    WeekS = 604800,
    W1 = (Ts1 - BaseT) div WeekS,
    W2 = (Ts2 - BaseT) div WeekS,
    W1 =:= W2.

-spec datetime_to_seconds(DateTime) -> false |
                                       Seconds when DateTime :: {{Y, M, D},
                                                                 {H, M, S}},
                                                    Y :: pos_integer(),
                                                    M :: 1..12, D :: 1..31,
                                                    H :: 0..23, M :: 0..59,
                                                    S :: 0..59,
                                                    Seconds :: pos_integer().

datetime_to_seconds({Year,
                     Month,
                     Day,
                     Hour,
                     Minute,
                     Second}) ->
    datetime_to_seconds({{Year, Month, Day},
                         {Hour, Minute, Second}});
datetime_to_seconds(DateTime) ->
    case get({datetime_to_seconds, DateTime}) of
        T when is_integer(T) -> T;
        _ ->
            case calendar:local_time_to_universal_time_dst(DateTime)
                of
                [] -> false;
                [_, Udate] ->
                    T = calendar:datetime_to_gregorian_seconds(Udate) -
                            719528 * 24 * 3600,
                    put({datetime_to_seconds, DateTime}, T),
                    T;
                [Udate] ->
                    T = calendar:datetime_to_gregorian_seconds(Udate) -
                            719528 * 24 * 3600,
                    put({datetime_to_seconds, DateTime}, T),
                    T
            end
    end.

-spec seconds_to_datetime(Unixtime) -> {{Y ::
                                             non_neg_integer(),
                                         M :: non_neg_integer(),
                                         D :: non_neg_integer()},
                                        {HH :: non_neg_integer(),
                                         MM :: non_neg_integer,
                                         SS ::
                                             non_neg_integer()}} when Unixtime ::
                                                                          non_neg_integer().

seconds_to_datetime(Unixtime) ->
    DT = calendar:gregorian_seconds_to_datetime(Unixtime +
                                                    calendar:datetime_to_gregorian_seconds({{1970,
                                                                                             1,
                                                                                             1},
                                                                                            {0,
                                                                                             0,
                                                                                             0}})),
    erlang:universaltime_to_localtime(DT).

-spec day_of_the_week(Unixtime ::
                          non_neg_integer()) -> 1..7.

day_of_the_week({Year, Month, Day}) ->
    day_of_the_week(Year, Month, Day);
day_of_the_week(Unixtime) ->
    {{Y, M, D}, _} = seconds_to_datetime(Unixtime),
    day_of_the_week(Y, M, D).

-spec day_of_the_week(Year :: non_neg_integer(),
                      Month :: non_neg_integer(),
                      Day :: non_neg_integer()) -> 1..7.

day_of_the_week(Year, Month, Day) ->
    (date_to_gregorian_days(Year, Month, Day) + 5) rem 7 +
        1.

-spec parse_time(term()) -> non_neg_integer().

parse_time({day, OffSet}) -> unixtime(zero) + OffSet;
parse_time({open_time, T}) ->
    time_label(srv_open_time) + T * 86400;
parse_time({open_time, T, OffSet}) ->
    time_label(srv_open_time) + T * 86400 + OffSet;
parse_time({merge_time, T}) ->
    time_label(merge_time) + T * 86400;
parse_time({merge_time, T, OffSet}) ->
    time_label(merge_time) + T * 86400 + OffSet;
parse_time(T) when is_integer(T) -> T;
parse_time({Year, Month, Day, Hour, Minute, Second}) ->
    datetime_to_seconds({{Year, Month, Day},
                         {Hour, Minute, Second}});
parse_time({{Year, Month, Day},
            {Hour, Minute, Second}}) ->
    datetime_to_seconds({{Year, Month, Day},
                         {Hour, Minute, Second}});
parse_time(T) ->
    logger:error("错误的时间格式：~w", [T], date, 371),
    0.

parse_time({week, Sday, SOffSet},
           {week, Eday, EOffSet}) ->
    Week = calendar:day_of_the_week(erlang:date()),
    ZeroT = unixtime(zero),
    if Sday =< Eday andalso
           Week >= Sday andalso Week =< Eday ->
           {ZeroT - (Week - Sday) * 86400 + SOffSet,
            ZeroT + (Eday - Week) * 86400 + EOffSet};
       Sday =< Eday andalso Week < Sday ->
           {ZeroT + (Sday - Week) * 86400 + SOffSet,
            ZeroT + (Eday - Week) * 86400 + EOffSet};
       Sday =< Eday ->
           {ZeroT + (Sday + 7 - Week) * 86400 + SOffSet,
            ZeroT + (Eday + 7 - Week) * 86400 + EOffSet};
       Week =< Sday andalso Week > Eday ->
           {ZeroT + (Sday - Week) * 86400 + SOffSet,
            ZeroT + (Eday + 7 - Week) * 86400 + EOffSet};
       Week >= Sday andalso Week > Eday ->
           {ZeroT - (Week - Sday) * 86400 + SOffSet,
            ZeroT + (Eday + 7 - Week) * 86400 + EOffSet};
       true ->
           {ZeroT - (Week + 7 - Sday) * 86400 + SOffSet,
            ZeroT + (Eday - Week) * 86400 + EOffSet}
    end;
parse_time(StartT, EndT) ->
    {parse_time(StartT), parse_time(EndT)}.

time_label(Label) ->
    case get(Label) of
        T when is_integer(T) -> T;
        _ ->
            T = case Label of
                    srv_open_time -> env:srv_open_time();
                    _ -> env:get(Label)
                end,
            if is_integer(T) andalso T > 0 ->
                   T1 = date:unixtime({zero, T}),
                   put(Label, T1),
                   T1;
               true -> -1
            end
    end.

date_to_gregorian_days(Year, Month, Day)
    when is_integer(Day), Day > 0 ->
    Last = last_day_of_the_month(Year, Month),
    if Day =< Last ->
           dy(Year) + dm(Month) + df(Year, Month) + Day - 1
    end.

last_day_of_the_month(Year, Month)
    when is_integer(Year), Year >= 0 ->
    do_last_day_of_the_month(Year, Month).

do_last_day_of_the_month(_, 4) -> 30;
do_last_day_of_the_month(_, 6) -> 30;
do_last_day_of_the_month(_, 9) -> 30;
do_last_day_of_the_month(_, 11) -> 30;
do_last_day_of_the_month(Y, 2) ->
    case is_leap_year(Y) of
        true -> 29;
        false -> 28
    end;
do_last_day_of_the_month(_, M)
    when is_integer(M), M > 0, M < 13 ->
    31.

is_leap_year(Year)
    when Year rem 4 =:= 0, Year rem 100 > 0 ->
    true;
is_leap_year(Year) when Year rem 400 =:= 0 -> true;
is_leap_year(_) -> false.

dy(Year) when Year =< 0 -> 0;
dy(Year) ->
    X = Year - 1,
    X div 4 - X div 100 + X div 400 + X * 365 + 366.

dm(1) -> 0;
dm(2) -> 31;
dm(3) -> 59;
dm(4) -> 90;
dm(5) -> 120;
dm(6) -> 151;
dm(7) -> 181;
dm(8) -> 212;
dm(9) -> 243;
dm(10) -> 273;
dm(11) -> 304;
dm(12) -> 334.

df(_, Month) when Month < 3 -> 0;
df(Year, _) ->
    case is_leap_year(Year) of
        true -> 1;
        false -> 0
    end.

seconds_to_str(Seconds) when Seconds >= 3600 * 24 ->
    util:flist(lang:get("~w天"), [Seconds div (3600 * 24)]);
seconds_to_str(Seconds) when Seconds >= 3600 ->
    util:flist(lang:get("~w小时"), [Seconds div 3600]);
seconds_to_str(Seconds) when Seconds >= 60 ->
    util:flist(lang:get("~w分钟"), [Seconds div 60]);
seconds_to_str(Seconds) ->
    util:flist(lang:get("~w秒"), [Seconds]).

hour() ->
    {_, {Hour, _, _}} = calendar:local_time(),
    Hour.

time() ->
    {_, Time} = seconds_to_datetime(unixtime()),
    Time.

date() ->
    {Date, _} = seconds_to_datetime(unixtime()),
    Date.

seconds_of_the_day() ->
    {_, {Hour, Min, Sec}} = calendar:local_time(),
    Hour * 3600 + Min * 60 + Sec.

seconds_of_the_day({Hour, Min, Sec}) ->
    Hour * 3600 + Min * 60 + Sec.

