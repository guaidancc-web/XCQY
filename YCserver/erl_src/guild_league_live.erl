-file("src/mod/guild/guild_league_live.erl", 1).

-module(guild_league_live).

-export([init/1,
         init_log_id/0,
         lookup/1,
         list/0,
         update/1,
         add_log/2,
         get_log_id/0,
         format/1]).

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

-file("src/mod/guild/guild_league_live.erl", 20).

-file("inc/guild_league.hrl", 1).

-record(guild_league_role,
        {id = {0, "", 0} :: tuple(),
         gid = {0, "", 0} :: tuple(),
         ver = 1,
         name = "" :: bitstring(),
         sex = 0 :: 0..1,
         classes = 0 :: 0..4,
         lev = 0 :: non_neg_integer(),
         win = 0 :: non_neg_integer(),
         lost = 0 :: non_neg_integer(),
         to_war = 0,
         movability = 500 :: non_neg_integer(),
         match_id = 0 :: non_neg_integer(),
         side = 1,
         pid :: undefined | reference(),
         phase = 0 :: non_neg_integer(),
         season = 0 :: non_neg_integer(),
         key = {{0, "", 0}, 0},
         last_killed = 0 :: non_neg_integer(),
         picked = 0 :: non_neg_integer(),
         last_win = 0 :: non_neg_integer(),
         score = 0 :: non_neg_integer(),
         is_trump = 0,
         operating_unit = 0 :: 0 | tuple(),
         last_operated = 0 :: non_neg_integer(),
         attacked_unit = 0 :: non_neg_integer(),
         guarded_unit = 0 :: non_neg_integer(),
         cannon_attacked = 0 :: non_neg_integer(),
         cannon_used = 0 :: non_neg_integer(),
         guarding_unit = 0 :: non_neg_integer(),
         operating_num = 0 :: non_neg_integer()}).

-record(guild_league_guild,
        {id = {0, "", 0} :: tuple(),
         key = {{0, "", 0}, 0, 0},
         ver = 5,
         name = "" :: bitstring(),
         lev = 0 :: non_neg_integer(),
         leader_name = "" :: list(),
         leader_id = {0, "", 0} ::
             {non_neg_integer(), list(), non_neg_integer()},
         match_id = 0 :: non_neg_integer(),
         member_num = 0 :: non_neg_integer(),
         win = 0 :: non_neg_integer(),
         side = 1,
         totem = 0 :: non_neg_integer(),
         phase = 0 :: non_neg_integer(),
         grade = 4 :: non_neg_integer(),
         season = 0 :: non_neg_integer(),
         group = 0 :: non_neg_integer(),
         order = 0 :: non_neg_integer(),
         time = 0 :: non_neg_integer(),
         is_win = 0 :: non_neg_integer(),
         score = 0 :: non_neg_integer(),
         strenth = 0 :: non_neg_integer(),
         members = [],
         trumps = [],
         attacked_unit = 0 :: non_neg_integer(),
         consecutive_win = 0 :: non_neg_integer(),
         season_consecutive_win = 0 :: non_neg_integer(),
         avg_lev = 0 :: non_neg_integer(),
         eliminated = 8 :: non_neg_integer()}).

-record(guild_league_match,
        {id = {0, 0} :: {non_neg_integer(), non_neg_integer()},
         pid :: undefined | pid(),
         map_id = 0 :: non_neg_integer(),
         map_pid = 0 :: pid(),
         battle_id = 0 :: non_neg_integer(),
         battle_pid = 0 :: pid(),
         win_side = 0,
         time = 0 :: non_neg_integer(),
         phase = 0,
         season = 0 :: non_neg_integer(),
         combat_time = 0,
         is_judge = false,
         can_join = false,
         cannon_ready = false,
         later_phase = 0 :: non_neg_integer(),
         grade = 0 :: non_neg_integer(),
         type = 0 :: non_neg_integer()}).

-record(guild_league_alliance,
        {id = {0, 0} :: {integer(), integer()},
         gids = [] :: list(),
         names = [],
         totems = [] :: list(),
         win = 0 :: non_neg_integer(),
         lost = 0 :: non_neg_integer(),
         movability = 0 :: non_neg_integer(),
         member_num = 0 :: non_neg_integer(),
         members = [],
         remain_num = 0,
         match_id = 0 :: non_neg_integer(),
         side = 1,
         totem = 0 :: non_neg_integer(),
         map_id = 0 :: non_neg_integer(),
         map_pid = 0 :: pid(),
         phase = 0 :: non_neg_integer(),
         season = 0 :: non_neg_integer(),
         time = 0 :: non_neg_integer(),
         is_win = 0 :: non_neg_integer(),
         score = 0 :: non_neg_integer(),
         duration = 0 :: non_neg_integer(),
         attacked_unit = 0 :: non_neg_integer(),
         guarded_unit = 0 :: non_neg_integer(),
         remain_unit = 3 :: non_neg_integer(),
         grade = 4 :: non_neg_integer(),
         subsidize_buff = [] :: list()}).

-record(guild_league_trump,
        {id = {0, "", 0} :: tuple(),
         gid = {0, "", 0} :: tuple(),
         name = "" :: bitstring(),
         sex = 0 :: 0..1,
         classes = 0 :: 0..4,
         lev = 0 :: non_neg_integer(),
         pos = 1 :: non_neg_integer()}).

-record(guild_league_unit,
        {id = {0, 0} :: tuple(),
         phase = 0,
         season = 0 :: non_neg_integer(),
         grade = 4 :: non_neg_integer(),
         match_id = 0 :: non_neg_integer(),
         battle_id = 0 :: non_neg_integer(),
         side = 0,
         duration = 1000 :: non_neg_integer(),
         operators = [] :: list(),
         last_operated = 0 :: non_neg_integer()}).

-record(guild_league_operator,
        {id = {0, "", 0} :: tuple(),
         gid = {0, "", 0} :: tuple(),
         name = "" :: bitstring(),
         sex = 0 :: 0..1,
         classes = 0 :: 0..4,
         lev = 0 :: non_neg_integer(),
         side = 0,
         timeout = 0 :: non_neg_integer()}).

-record(guild_league_summary,
        {id = {0, "", 0} :: tuple(),
         ver = 4,
         name = "" :: bitstring(),
         lev = 0 :: non_neg_integer(),
         leader_name = "" :: list(),
         leader_id = {0, "", 0} ::
             {non_neg_integer(), list(), non_neg_integer()},
         member_num = 0 :: non_neg_integer(),
         season_win = 0 :: non_neg_integer(),
         season_lost = 0 :: non_neg_integer(),
         season_draw = 0 :: non_neg_integer(),
         total_win = 0 :: non_neg_integer(),
         totem = 0 :: non_neg_integer(),
         season_score = 0 :: non_neg_integer(),
         total_score = 0 :: non_neg_integer(),
         grade = 4 :: non_neg_integer(),
         rank = 0 :: non_neg_integer(),
         group = 0 :: non_neg_integer(),
         order = 0 :: non_neg_integer(),
         recent_matchs = [] :: list(),
         absence = 0 :: non_neg_integer(),
         attacked_unit = 0 :: non_neg_integer(),
         last_result = 0 :: non_neg_integer(),
         strenth = 0 :: non_neg_integer(),
         consecutive_win = 0 :: non_neg_integer(),
         season_consecutive_win = 0 :: non_neg_integer(),
         eliminated = 8 :: non_neg_integer()}).

-record(guild_league_guess,
        {id = {0, "", 0} :: tuple(),
         ver = 0 :: non_neg_integer(),
         name = "" :: bitstring(),
         sex = 0 :: 0..1,
         classes = 0 :: 0..4,
         lev = 0 :: non_neg_integer(),
         season = 0 :: non_neg_integer(),
         choices = [] :: list(),
         time = 0 :: non_neg_integer()}).

-record(guild_league_guess_choice,
        {gid = {0, "", 0} :: tuple(),
         phase = 0 :: non_neg_integer(),
         bingo = 0 :: 0..2}).

-record(guild_league_poll,
        {gid = {0, "", 0} :: tuple(),
         phase = 0 :: non_neg_integer(),
         voted = 0 :: non_neg_integer()}).

-record(guild_league_live,
        {id = 0 :: non_neg_integer(),
         phase = 0 :: non_neg_integer(),
         season = 0 :: non_neg_integer(),
         grade = 0 :: non_neg_integer(),
         type = 0 :: non_neg_integer(),
         time = 0 :: non_neg_integer(),
         names1 = [] :: string(),
         names2 = [] :: string(),
         logs = [] :: list()}).

-record(guild_league_champion,
        {season = 0 :: non_neg_integer(), top3 = []}).

-file("src/mod/guild/guild_league_live.erl", 21).

init(#guild_league_match{type = 4}) -> ok;
init(#guild_league_match{grade = 1, phase = Phase,
                         id = Id, season = Season, time = Time, type = Type})
    when Phase > 4 ->
    Names1 = case ets:lookup(guild_league_alliance, {Id, 1})
                 of
                 [#guild_league_alliance{names = N1}] -> N1;
                 _ -> []
             end,
    Names2 = case ets:lookup(guild_league_alliance, {Id, 2})
                 of
                 [#guild_league_alliance{names = N2}] -> N2;
                 _ -> []
             end,
    Live = #guild_league_live{id = Id, phase = Phase,
                              grade = 1, names1 = Names1, names2 = Names2,
                              season = Season, time = Time, type = Type},
    update(Live),
    guild_league_guild:sync_data(Live);
init(_) -> ok.

update(Live = #guild_league_live{}) ->
    ets:insert(guild_league_live, Live),
    dets:insert(guild_league_live, Live).

lookup(Id) -> ets:lookup(guild_league_live, Id).

list() -> ets:tab2list(guild_league_live).

get_log_id() ->
    env:update_counter(guild_league_live_log_id, 1).

init_log_id() -> env:set(guild_league_live_log_id, 1).

add_log(MatchId, [H | T]) ->
    {Id, Msg} = {get_log_id(), [H | T]},
    case ets:lookup(guild_league_live, MatchId) of
        [Live = #guild_league_live{logs = Logs}] ->
            Now = date:unixtime(),
            Live1 = Live#guild_league_live{logs =
                                               [{Id, Msg, Now} | Logs]},
            update(Live1),
            guild_league_guild:sync_data(Live1);
        _ -> ok
    end;
add_log(MatchId, {Id, [H | T]}) ->
    Msg = [H | T],
    case ets:lookup(guild_league_live, MatchId) of
        [Live = #guild_league_live{logs = Logs}] ->
            Live1 = case lists:keyfind(Id, 1, Logs) of
                        {_, _, Time} ->
                            Live#guild_league_live{logs =
                                                       lists:keyreplace(Id,
                                                                        1,
                                                                        Logs,
                                                                        {Id,
                                                                         Msg,
                                                                         Time})};
                        _ ->
                            Now = date:unixtime(),
                            Live#guild_league_live{logs =
                                                       [{Id, Msg, Now} | Logs]}
                    end,
            update(Live1),
            guild_league_guild:sync_data(Live1);
        _ -> ok
    end.

format(#{atk_num := ANum, dfd_num := DNum})
    when ANum < 3 orelse DNum < 3 ->
    logger:debug("人数不够", [], guild_league_live, 106),
    ok;
format(Args = #{atk_id := AtkId = {R, P, Z},
                dfd_id := DfdId, atk_num := ANum, dfd_num := DNum,
                atk_name := AName, dfd_name := DName, type := fighting,
                ext_args := ExtArgs}) ->
    case lists:keyfind(log_id, 1, ExtArgs) of
        {log_id, LogId} when LogId =/= 0 ->
            logger:debug("log_id -----> ~w",
                         [LogId],
                         guild_league_live,
                         111),
            Fmt =
                lang:get("~ts的~ts的~ts人队伍与~ts的~ts的~ts人队伍发生了激烈战斗~ts"),
            GnameA = guild_league_guild:get_name(by_rid, AtkId),
            GnameD = guild_league_guild:get_name(by_rid, DfdId),
            ButtonStr = case Args of
                            #{rec_id := {Rt, {R1, P1, Z1}}} ->
                                util:flist(lang:get("{rec_1,~w,~w,~ts,~w,~ts,~ts}"),
                                           [Rt, R1, P1, Z1, AName, DName]);
                            _ ->
                                util:flist(lang:get("{watch_1,~w,~ts,~w}"),
                                           [R, P, Z])
                        end,
            FArgs = [{string_2, 2, GnameA},
                     {role_2, AName},
                     {string_2, 2, ANum},
                     {string_2, 2, GnameD},
                     {role_2, DName},
                     {string_2, 2, DNum},
                     {string_1, ButtonStr}],
            Msg = notice:format(Fmt, FArgs),
            {ok, LogId, Msg};
        _ -> ok
    end;
format(Args = #{atk_id := AtkId = {R, P, Z},
                dfd_id := DfdId, atk_num := ANum, dfd_num := DNum,
                atk_name := AName, dfd_name := DName, type := guarding,
                ext_args := ExtArgs}) ->
    case lists:keyfind(log_id, 1, ExtArgs) of
        {log_id, LogId} when LogId =/= 0 ->
            Fmt =
                lang:get("~ts的~ts~ts人守塔队伍在顽强抵抗着~ts的~ts~ts人攻塔队伍~ts"),
            GnameA = guild_league_guild:get_name(by_rid, AtkId),
            GnameD = guild_league_guild:get_name(by_rid, DfdId),
            ButtonStr = case Args of
                            #{rec_id := {Rt, {R1, P1, Z1}}} ->
                                util:flist(lang:get("{rec_1,~w,~w,~ts,~w,~ts,~ts}"),
                                           [Rt, R1, P1, Z1, AName, DName]);
                            _ ->
                                util:flist(lang:get("{watch_1,~w,~ts,~w}"),
                                           [R, P, Z])
                        end,
            FArgs = [{string_2, 2, GnameA},
                     {role_2, AName},
                     {string_2, 2, ANum},
                     {string_2, 2, GnameD},
                     {role_2, DName},
                     {string_2, 2, DNum},
                     {string_1, ButtonStr}],
            Msg = notice:format(Fmt, FArgs),
            {ok, LogId, Msg};
        _ -> ok
    end;
format(Args = #{atk_id := AtkId = {R, P, Z},
                dfd_id := DfdId, atk_num := ANum, dfd_num := DNum,
                atk_name := AName, dfd_name := DName, type := attacking,
                ext_args := ExtArgs}) ->
    case lists:keyfind(log_id, 1, ExtArgs) of
        {log_id, LogId} when LogId =/= 0 ->
            Fmt =
                lang:get("~ts的~ts~ts人守塔队伍在顽强抵抗着~ts的~ts~ts人攻塔队伍~ts"),
            GnameA = guild_league_guild:get_name(by_rid, AtkId),
            GnameD = guild_league_guild:get_name(by_rid, DfdId),
            ButtonStr = case Args of
                            #{rec_id := {Rt, {R1, P1, Z1}}} ->
                                util:flist(lang:get("{rec_1,~w,~w,~ts,~w,~ts,~ts}"),
                                           [Rt, R1, P1, Z1, AName, DName]);
                            _ ->
                                util:flist(lang:get("{watch_1,~w,~ts,~w}"),
                                           [R, P, Z])
                        end,
            FArgs = [{string_2, 2, GnameA},
                     {role_2, AName},
                     {string_2, 2, ANum},
                     {string_2, 2, GnameD},
                     {role_2, DName},
                     {string_2, 2, DNum},
                     {string_1, ButtonStr}],
            Msg = notice:format(Fmt, FArgs),
            {ok, LogId, Msg};
        _ -> ok
    end;
format(_) -> ok.

