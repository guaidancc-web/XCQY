-file("src/mod/qualifying/qualifying_news.erl", 1).

-module(qualifying_news).

-export([check_new/4]).

-file("inc/qualifying.hrl", 1).

-record(m_qualifying,
        {rank_point = 1000,
         season_combat_count = 0,
         season_win_count = 0,
         update_time = 0,
         day_win = 0,
         day_log = [],
         sign_type = 0,
         win_flag = 0,
         win_five_flag = 0}).

-record(qualifying_role_mark,
        {id = {0, "", 0},
         ver = 4,
         name = "",
         rank_lev = 0,
         rank_type = 0,
         rank_point = 1000,
         lev = 0,
         sex = 0,
         classes = 0,
         looks = [],
         thumb_up = 0,
         thumb_up_other = 0,
         day_flag = 0,
         day_win = 0,
         day_win_streak = 0,
         season_max_rank_point = 1000,
         season_combat_count = 0,
         season_win_count = 0,
         season_win_streak = 0,
         season_max_win_streak = 0,
         week_flag = 0,
         week_max_rank_point = 0,
         up_ranklev_reward = []}).

-record(qualifying_role,
        {id = {0, "", 0},
         status = 0,
         name = "",
         sex = 0,
         classes = 0,
         lev = 0,
         fc = 0,
         rank_lev = 1,
         rank_point = 1000,
         looks = [],
         type = 1,
         times = 1,
         point = 1,
         cross_group = 0 :: non_neg_integer()}).

-record(qualifying_team,
        {ids = [],
         origin_team = [],
         rank_point = 1,
         point = 1,
         match_time = 0,
         reward_point = 1,
         cross_group = 0 :: non_neg_integer()}).

-record(qualifying_rank_data,
        {lev = 1,
         max_lev = 1,
         point = 0,
         need_point = 200,
         rank_type = 0,
         lev_name = "",
         gain = [],
         five_gain = [],
         rank_type_name = [],
         uplev_reward = 0}).

-record(qualifying_zone_role,
        {id = {0, "", 0},
         name = "",
         is_online = 1,
         zone_pid,
         pid,
         zone_id = 0}).

-record(qualifying_season_data,
        {ver = 1,
         id = 1 :: pos_integer(),
         end_time = 0,
         count = 0,
         champion_list = []}).

-file("src/mod/qualifying/qualifying_news.erl", 14).

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

-file("src/mod/qualifying/qualifying_news.erl", 15).

-file("inc/notice.hrl", 1).

-record(notice,
        {id = 1 :: pos_integer(),
         type = 0 :: non_neg_integer(),
         pos = 1 :: pos_integer(),
         start_time = 0 :: non_neg_integer(),
         end_time = 0 :: non_neg_integer(),
         msg = "" :: bitstring()}).

-record(notice_board,
        {id = 1,
         type = 1,
         start_time = 0,
         end_time = 0,
         title = "",
         content = "",
         msg = "",
         gain = [],
         condition = []}).

-record(notice_scroll,
        {id = 1,
         type = 1,
         start_time = 0,
         end_time = 0,
         interval_time = 0,
         content = ""}).

-record(notice_board_log, {id = 1, log_list = []}).

-record(campaign_notice,
        {title = [] :: list(),
         content = [] :: list(),
         process = [] :: list(),
         extern_content = [] :: list(),
         rewards = [] :: list()}).

-file("src/mod/qualifying/qualifying_news.erl", 16).

check_new(Result, Mark, TeamMate, Status) ->
    case lists:member(Result, [2, 1]) of
        true ->
            Now = date:unixtime(),
            check([1, 2, 3, 4], Now, Mark, TeamMate, Status, []);
        false -> {Status, []}
    end.

check([], _Now, _Mark, _TeamMate, Status, AddNew) ->
    {Status, AddNew};
check([NewType | T], Now, Mark, TeamMate, Status,
      AddNew) ->
    case check_val(NewType, Status) of
        true ->
            case check(NewType, Mark, TeamMate) of
                false -> check(T, Now, Mark, TeamMate, Status, AddNew);
                {add, Type, Val, Msg} ->
                    NewStatus = lists:keystore(Type,
                                               1,
                                               Status,
                                               {Type, Val}),
                    check(T,
                          Now,
                          Mark,
                          TeamMate,
                          NewStatus,
                          [{Now, Msg} | AddNew]);
                {skip, Msg} ->
                    check(T,
                          Now,
                          Mark,
                          TeamMate,
                          Status,
                          [{Now, Msg} | AddNew])
            end;
        false -> check(T, Now, Mark, TeamMate, Status, AddNew)
    end.

check_val(Type, Status) ->
    Result = lists:keyfind(Type, 1, Status),
    check_val(Type, Result, Status).

check_val(1, {_, 1}, _Status) -> false;
check_val(_Type, _Result, _Status) -> true.

check(1,
      #qualifying_role_mark{name = Name, day_win = DayWin},
      TeamMate)
    when DayWin >= 1 ->
    NameList = [TName || #{name := TName} <- TeamMate],
    Msg = msg(1, [Name | NameList]),
    {add, 1, 1, Msg};
check(2,
      #qualifying_role_mark{name = Name, day_win_streak = 6},
      _TeamMate) ->
    Msg = msg(2, Name),
    {skip, Msg};
check(3,
      #qualifying_role_mark{name = Name, day_win_streak = 8},
      _TeamMate) ->
    Msg = msg(3, Name),
    {skip, Msg};
check(4,
      #qualifying_role_mark{name = Name, day_win_streak = 10},
      _TeamMate) ->
    Msg = msg(4, Name),
    {skip, Msg};
check(_Type,
      #qualifying_role_mark{name = _Name,
                            day_win_streak = _DayWin},
      _) ->
    false.

msg(1, NameList) ->
    NameArgs = string:join(NameList, "、"),
    Msg = notice:format(lang:get("~ts先声夺人，拿下今日第一滴血。"),
                        [{string_2, 2, NameArgs}]),
    notice:cast(all, 4, Msg),
    Msg;
msg(2, Name) ->
    Msg = notice:format(lang:get("~ts已经暴走，率先拿下6场全胜！"),
                        [{role_2, Name}]),
    notice:cast(all, 4, Msg),
    Msg;
msg(3, Name) ->
    Msg = notice:format(lang:get("~ts已经暴走，率先拿下8场全胜！"),
                        [{role_2, Name}]),
    notice:cast(all, 4, Msg),
    Msg;
msg(4, Name) ->
    Msg = notice:format(lang:get("~ts已经暴走，率先拿下10场全胜！"),
                        [{role_2, Name}]),
    notice:cast(all, 4, Msg),
    Msg.

