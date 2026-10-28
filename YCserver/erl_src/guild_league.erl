-file("src/mod/guild/guild_league.erl", 1).

-module(guild_league).

-behaviour(gen_fsm).

-export([start_link/0,
         enroll/1,
         push/2,
         info/1,
         update_grade_rank/1,
         vote/2,
         gm/1]).

-export([init/1,
         handle_event/3,
         handle_sync_event/4,
         handle_info/3,
         terminate/3,
         code_change/4]).

-export([idle/2, ready/2, active/2, reward/2]).

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

-file("src/mod/guild/guild_league.erl", 24).

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

-file("src/mod/guild/guild_league.erl", 25).

-file("inc/battle.hrl", 1).

-record(battle_base,
        {id = 1 :: pos_integer(),
         type = 1 :: pos_integer(),
         sub_id = 0,
         sub_type = 0,
         name :: undefined | atom(),
         pid :: undefined | undefine | pid(),
         global = [] :: list(),
         map = [] :: list(),
         unit = [] :: list(),
         point = [] :: list(),
         trigger = [] :: list(),
         enter_point = {0, 0, 0} ::
             {non_neg_integer(),
              non_neg_integer(),
              non_neg_integer()}}).

-record(battle,
        {id = 1 :: pos_integer(),
         type = 1 :: pos_integer(),
         sub_id = 0,
         sub_type = 0,
         name :: undefined | atom(),
         pid :: undefined | undefine | pid(),
         map = [] :: list(),
         enter_point = {0, 0, 0} ::
             {non_neg_integer(),
              non_neg_integer(),
              non_neg_integer()},
         ext = [],
         role_id = {0, "", 0}}).

-record(battle_context,
        {grade = 1 :: pos_integer(),
         score = 0 :: non_neg_integer(),
         round = 0 :: non_neg_integer(),
         max_dmg = 0 :: non_neg_integer(),
         hurt = 0 :: non_neg_integer(),
         ratio_val = 0,
         die_num = 0}).

-record(battle_role,
        {id,
         status = 1,
         pid,
         name,
         sex = 0 :: 0..1,
         classes = 0 :: 0..6,
         lev = 0 :: non_neg_integer(),
         is_kill_boss = 0 :: 0..1,
         sub_id = 0 :: non_neg_integer(),
         flip_cards = [] :: [],
         has_reward_floor = [],
         context = #battle_context{}}).

-record(battle_combat_info,
        {sub_id = 0, sub_type = 0, gains = []}).

-record(battle_trigger,
        {name :: undefined | bitstring(),
         status = open :: open | close,
         event = [] :: [tuple()],
         vars = [] :: [tuple()],
         condition = [] :: [tuple()],
         action = [] :: list()}).

-record(tri_timer,
        {mode :: undefined | cycle | count,
         times = 0 :: integer(),
         timeout = 1000 :: pos_integer()}).

-record(cfg_act,
        {tpl :: undefined | atom(), cfg = [] :: list()}).

-record(tpl_act,
        {name = "" :: string(),
         type :: undefined | atom(),
         code = "" :: string(),
         args = [] :: list(),
         desc = "" :: string()}).

-record(cfg_cond,
        {tpl = "" :: string(), cfg = [] :: list()}).

-record(tpl_cond,
        {name = "" :: string(),
         code = "" :: string(),
         args = [] :: list(),
         desc = "" :: string()}).

-record(cfg_evt,
        {tpl = "" :: string(), cfg = [] :: list()}).

-record(tpl_evt,
        {name = "" :: string(),
         code = "" :: string(),
         args = [] :: list(),
         desc = "" :: string()}).

-record(cfg_val,
        {tpl = "" :: string(), cfg = [] :: list()}).

-record(tpl_val,
        {name = "" :: string(),
         code = "" :: string(),
         args = [] :: list(),
         desc = "" :: string()}).

-record(cfg_unit,
        {tpl = "" :: string(), cfg = [] :: list()}).

-record(tpl_unit,
        {name = "" :: string(),
         code = "" :: string(),
         args = [] :: list(),
         desc = "" :: string()}).

-record(point,
        {map = 1 :: pos_integer(),
         x = 0 :: non_neg_integer(),
         y = 0 :: non_neg_integer()}).

-record(tpl_fun,
        {name :: undefined | atom(),
         return :: undefined | unit | point,
         args = [] :: [atom()],
         code = "" :: string(),
         mfa_code = "" :: string(),
         label = "" :: string(),
         desc = "" :: string()}).

-file("src/mod/guild/guild_league.erl", 26).

-file("inc/unit.hrl", 1).

-record(unit_order,
        {order :: undefined | move | guard | attack | atom(),
         type = 0 :: 0..2,
         arg :: undefined | tuple() | [tuple()],
         data :: undefined | term(),
         condition = [] :: list(),
         over :: undefined | defense | stop | atom()}).

-record(unit_data,
        {id = 0 :: pos_integer(),
         type = 1 :: non_neg_integer(),
         fun_type = 1 :: non_neg_integer(),
         desc = "",
         classes = 0,
         sex = 0,
         lev = 1,
         name = "" :: list(),
         activity = 0 :: 0..1,
         guide_lev = 0 :: non_neg_integer(),
         status = 0 :: non_neg_integer(),
         nature = 0 :: non_neg_integer(),
         disabled = "" :: bitstring(),
         condition = [] :: [tuple()],
         speed = 120 :: pos_integer(),
         lock = 0 :: 0 | 1,
         t_move = 3 :: pos_integer(),
         t_atk = 3 :: pos_integer(),
         range_trace = 200 :: pos_integer(),
         range_atk = 100 :: pos_integer(),
         gain = [] :: list(),
         formation = 1,
         formation_lev = 1,
         slave = [] :: list(),
         talk = [] :: list(),
         looks = [] :: list(),
         data = [] :: list(),
         def_status = defense :: defense | patrol | loaf}).

-record(unit,
        {id = {1, 1} :: {pos_integer(), pos_integer()},
         base_id = 0 :: non_neg_integer(),
         type = 1 :: non_neg_integer(),
         fun_type = 1,
         name = "" :: list(),
         pid = 0 :: non_neg_integer() | pid(),
         lev = 1,
         classes = 0,
         sex = 0,
         activity = 0 :: 0..1,
         dun_info :: undefined | {pid(), pos_integer()},
         combat_pid = 0 :: non_neg_integer() | pid(),
         status = 0 :: non_neg_integer(),
         guide_lev = 0 :: non_neg_integer(),
         nature = 0 :: non_neg_integer(),
         disabled = "" :: list(),
         condition = [] :: [tuple()],
         speed = 180 :: pos_integer(),
         lock = 0 :: 0 | 1,
         range_trace = 200 :: pos_integer(),
         range_atk = 100 :: pos_integer(),
         defxy = {0, 0, 0} :: tuple(),
         def_status = defense :: defense | patrol | loaf,
         talk = [] :: list(),
         pos :: undefined | tuple(),
         data :: undefined | term(),
         looks = [] :: [tuple()],
         evt = [] :: [atom()],
         formation = 1,
         formation_lev = 1,
         slave = [] :: list(),
         prop = [] :: [{non_neg_integer(), string()}],
         order = [] :: list(),
         path = [] :: list(),
         ts = {1, 1, 1} ::
             {pos_integer(), pos_integer(), pos_integer()},
         t_move = 3 :: pos_integer(),
         t_atk = 3 :: pos_integer(),
         ai_id = 0,
         ai = {[], []} :: {list(), list()},
         attr,
         role_id = {0, "", 0}}).

-record(map_unit,
        {id = {1, 1} :: {pos_integer(), pos_integer()},
         base_id = 0 :: non_neg_integer(),
         type = 1 :: pos_integer(),
         activity = 0 :: 0..1,
         status = 0 :: non_neg_integer(),
         classes = 0,
         sex = 0,
         guide_lev = 0 :: non_neg_integer(),
         name = "" :: list(),
         speed = 1 :: pos_integer(),
         x = 0 :: non_neg_integer(),
         y = 0 :: non_neg_integer(),
         gx = 0 :: non_neg_integer(),
         gy = 0 :: non_neg_integer(),
         looks = [] :: [tuple()],
         prop = [] :: [tuple()]}).

-record(plot_unit,
        {id = 0 :: pos_integer(),
         name = "" :: bitstring(),
         base_id = 0 :: non_neg_integer(),
         type = 1,
         fun_type = 1,
         dun_id = 0 :: non_neg_integer(),
         map = 0 :: non_neg_integer(),
         x = 0 :: non_neg_integer(),
         y = 0 :: non_neg_integer(),
         dir = 0 :: non_neg_integer(),
         act_type = "" :: bitstring(),
         looks = [] :: [tuple()],
         status = 0 :: non_neg_integer(),
         quest_id = 0 :: non_neg_integer(),
         quest_prog_id = 0 :: non_neg_integer(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer()}).

-record(unit_statue,
        {type = 0,
         id = {0, "", 0},
         name = "",
         lev = 0,
         classes = 0,
         sex = 0,
         looks = []}).

-file("src/mod/guild/guild_league.erl", 27).

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

-file("src/mod/guild/guild_league.erl", 28).

-record(state,
        {ts = 0 :: tuple(),
         timeout = 0 :: non_neg_integer(),
         is_judge = false :: boolean(),
         is_matched = false :: boolean(),
         phase = 1 :: non_neg_integer(),
         next_id = 0 :: non_neg_integer(),
         season = 0 :: non_neg_integer(),
         match_ref :: undefined | reference(),
         later_ref :: undefined | reference(),
         later_phase = 0 :: non_neg_integer(),
         cannon_ref :: undefined | reference(),
         grade_ref :: undefined | reference(),
         init_ref :: undefined | reference(),
         is_init = false :: boolean()}).

enroll([H | T]) -> guild_league ! {enroll, [H | T]};
enroll(_) -> ok.

push(Pid, Cmd = 17600) ->
    guild_league ! {push, Pid, Cmd}.

info(status) ->
    gen_fsm:sync_send_all_state_event(guild_league,
                                      info_status).

update_grade_rank(Grade) ->
    guild_league ! {update_grade_rank, Grade}.

vote(Phase, Voting) ->
    guild_league ! {vote, Phase, Voting}.

gm({phase, Phase}) -> guild_league ! {set_phase, Phase};
gm(reset_all) -> guild_league ! reset_all;
gm({timeout, StateName}) ->
    guild_league ! {timeout, StateName};
gm(attend_all) -> guild_league ! attend_all.

idle(timeout, State) ->
    State1 = State#state{ts = now(), timeout = 1200 * 1000,
                         is_judge = false},
    ets:delete_all_objects(guild_league_role),
    cast_all(guild_league_agent,
             change_status,
             [{1, 1200}]),
    Msg =
        notice:format(lang:get("~ts准备厅已开启，请各公会成员火速前往集结！{face_1, 7}"),
                      [{string_2, 1, lang:get("冠军联赛")}]),
    cast_all(notice, cast, [all, 5, Msg]),
    NewState = set_state(ready, State1),
    continue(ready, NewState);
idle(_, State) -> continue(idle, State).

ready(timeout, State = #state{}) ->
    State1 = State#state{ts = now(),
                         timeout = agenda:get_duration(2106) * 1000},
    NewState = set_state(active, State1),
    cast_all(guild_league_agent,
             change_status,
             [{2, agenda:get_duration(2106)}]),
    Msg =
        notice:format(lang:get("一触即发，~ts战场入口已经打开！看看谁能拿下第一滴血！{face_1, 7}"),
                      [{string_2, 1, lang:get("冠军联赛")}]),
    cast_all(notice, cast, [all, 5, Msg]),
    continue(active, NewState);
ready(_, State) -> continue(ready, State).

active(timeout, State) ->
    NewState = State#state{ts = now(),
                           timeout = 300 * 1000},
    stop_fighting(),
    guild_league_match:calc_result(),
    cast_all(guild_league_agent, change_status, [{3, 300}]),
    Msg =
        notice:format(lang:get("~ts顺利结束！经过一番激烈的争夺，快看看又是哪家公会领先！{face_1, "
                               "18}"),
                      [{string_2, 1, lang:get("冠军联赛")}]),
    cast_all(notice, cast, [all, 5, Msg]),
    continue(reward, NewState);
active(_, State) -> continue(active, State).

reward(timeout,
       State = #state{phase = Phase, grade_ref = OldRef,
                      season = Season}) ->
    case erlang:is_reference(OldRef) of
        true -> erlang:cancel_timer(OldRef);
        _ -> ok
    end,
    NewPhase = min(8, Phase + 1),
    {_, Tt} = get_state(NewPhase),
    Timeout = Tt,
    NewSeason = Season,
    env:save(guild_league_phase, NewPhase),
    env:save(guild_league_season, NewSeason),
    GradeTimeout = date:next_diff({23, 0, 0}),
    GradeRef = case NewPhase of
                   8 ->
                       logger:info("赛季切换时间 ~w",
                                   [GradeTimeout],
                                   guild_league,
                                   182),
                       erlang:send_after(max(1, GradeTimeout - 30) * 1000,
                                         self(),
                                         season_enroll);
                   _ ->
                       logger:info("冠军组升级时间 ~w",
                                   [GradeTimeout],
                                   guild_league,
                                   185),
                       erlang:send_after(GradeTimeout * 1000,
                                         self(),
                                         reset_grade)
               end,
    State1 = State#state{ts = now(), timeout = Timeout,
                         phase = NewPhase, season = NewSeason,
                         grade_ref = GradeRef},
    JoinGs = ets:tab2list(guild_league_guild),
    JoinAs = ets:tab2list(guild_league_alliance),
    guild_league_guild:update_rank(),
    cast_all(guild_league_agent,
             shift,
             [#{phase => NewPhase, season => NewSeason,
                guilds => JoinGs, alliances => JoinAs,
                timeout => Timeout div 1000}]),
    all_leave(),
    guild_league_guild:update_champion(NewPhase, Season),
    NewState = set_state(idle, State1),
    logger:debug("下次开始时间 ~w", [Timeout], guild_league, 202),
    continue(idle, NewState);
reward(_, State) -> continue(reward, State).

start_link() ->
    gen_fsm:start_link({local, guild_league},
                       guild_league,
                       [],
                       []).

init([]) ->
    logger:info("开始启动...", [], guild_league, 216),
    process_flag(trap_exit, true),
    guild_league_live:init_log_id(),
    ets:new(guild_league_guild,
            [set,
             named_table,
             public,
             {keypos, #guild_league_guild.id}]),
    ets:new(guild_league_guild_log,
            [set,
             named_table,
             public,
             {keypos, #guild_league_guild.key}]),
    LogFile = "./dets/guild_league_guild_log.dets",
    dets:open_file(guild_league_guild_log,
                   [{file, LogFile}, {keypos, #guild_league_guild.key}]),
    ets:new(guild_league_role,
            [set,
             named_table,
             public,
             {keypos, #guild_league_role.id}]),
    ets:new(guild_league_match,
            [set,
             named_table,
             public,
             {keypos, #guild_league_match.id}]),
    ets:new(guild_league_alliance,
            [set,
             named_table,
             public,
             {keypos, #guild_league_alliance.id}]),
    dets:open_file(guild_league_unit,
                   [{file, "./dets/guild_league_unit.dets"},
                    {keypos, #guild_league_unit.id}]),
    ets:new(guild_league_unit,
            [set,
             named_table,
             public,
             {keypos, #guild_league_unit.id}]),
    ets:new(guild_league_rank,
            [set, named_table, public, {keypos, 1}]),
    dets:open_file(guild_league_rank,
                   [{file, "./dets/guild_league_rank.dets"}, {keypos, 1}]),
    dets:open_file(guild_league_summary,
                   [{file, "./dets/guild_league_summary.dets"},
                    {keypos, #guild_league_summary.id}]),
    ets:new(guild_league_summary,
            [set,
             named_table,
             public,
             {keypos, #guild_league_summary.id}]),
    ets:new(guild_league_alliance_log,
            [set,
             named_table,
             public,
             {keypos, #guild_league_alliance.id}]),
    dets:open_file(guild_league_alliance_log,
                   [{file, "./dets/guild_league_alliance_log.dets"},
                    {keypos, #guild_league_alliance.id}]),
    dets:open_file(guild_league_live,
                   [{file, "./dets/guild_league_live.dets"},
                    {keypos, #guild_league_live.id}]),
    ets:new(guild_league_live,
            [set,
             named_table,
             public,
             {keypos, #guild_league_live.id}]),
    dets:open_file(guild_league_poll,
                   [{file, "./dets/guild_league_poll.dets"},
                    {keypos, #guild_league_poll.gid}]),
    ets:new(guild_league_poll,
            [set,
             named_table,
             public,
             {keypos, #guild_league_poll.gid}]),
    dets:open_file(guild_league_champion,
                   [{file, "./dets/guild_league_champion.dets"},
                    {keypos, #guild_league_champion.season}]),
    ets:new(guild_league_champion,
            [set,
             named_table,
             public,
             {keypos, #guild_league_champion.season}]),
    guild_league_guild:load_data([guild,
                                  rank,
                                  summary,
                                  alliance,
                                  unit,
                                  live,
                                  poll,
                                  champion]),
    NextId = case env:get(guild_league_next_id) of
                 NId when is_integer(NId) -> NId;
                 _ ->
                     env:save(guild_league_next_id, 1),
                     1
             end,
    Phase = case env:get(guild_league_phase) of
                Phs when is_integer(Phs) -> Phs;
                _ ->
                    env:save(guild_league_phase, 1),
                    1
            end,
    {StateName, Timeout} = get_state(pause),
    Season = case env:get(guild_league_season) of
                 Sn when is_integer(Sn) -> Sn;
                 _ ->
                     env:save(guild_league_season, 1),
                     1
             end,
    InitRef = erlang:send_after(600000,
                                self(),
                                start_enrolling),
    State = #state{ts = now(), timeout = Timeout,
                   next_id = NextId, phase = Phase, season = Season,
                   init_ref = InitRef},
    NewState = set_state(StateName, State),
    logger:info("启动完成 state_name: ~w, timeout: ~w",
                [StateName, Timeout],
                guild_league,
                271),
    {ok, StateName, NewState, Timeout}.

handle_event(_Event, StateName, State) ->
    logger:error("未知消息 ~w, ~w",
                 [_Event, StateName],
                 guild_league,
                 275),
    continue(StateName, State).

handle_sync_event(info_status, _From, StateName,
                  State = #state{timeout = infinity}) ->
    Reply = {0, 0},
    continue(Reply, StateName, State);
handle_sync_event(info_status, _From, StateName,
                  State = #state{ts = Ts, timeout = Timeout}) ->
    St = case StateName of
             ready -> 1;
             active -> 2;
             _ -> 0
         end,
    Rest = util:time_left(Timeout, Ts),
    Reply = {St, Rest div 1000},
    continue(Reply, StateName, State);
handle_sync_event(_Event, _From, StateName, State) ->
    logger:error("未知消息 ~w, ~w",
                 [_Event, StateName],
                 guild_league,
                 293),
    Reply = false,
    continue(Reply, StateName, State).

handle_info(start_enrolling, idle,
            State = #state{init_ref = OldRef, timeout = Timeout}) ->
    case erlang:is_reference(OldRef) of
        true -> erlang:cancel_timer(OldRef);
        _ -> ok
    end,
    Ref = case ets:info(guild_league_summary, size) of
              0 when Timeout =/= infinity ->
                  cast_all(guild_league_agent, start_enrolling, []),
                  erlang:send_after(30000, self(), init_grade);
              _ ->
                  logger:info("已经初始化过", [], guild_league, 308),
                  ok
          end,
    continue(idle,
             State#state{init_ref = Ref, is_init = false});
handle_info(start_enrolling, StateName, State) ->
    logger:debug("活动时间中不能初始化", [], guild_league, 313),
    continue(StateName, State);
handle_info(collect_update, idle,
            State = #state{match_ref = OldRef}) ->
    case erlang:is_reference(OldRef) of
        true -> erlang:cancel_timer(OldRef);
        _ -> ok
    end,
    cast_all(guild_league_agent, collect_update, []),
    Ref = erlang:send_after(30000, self(), match),
    continue(idle,
             State#state{match_ref = Ref, is_init = false});
handle_info(collect_update, StateName, State) ->
    logger:debug("活动时间中不能初始化", [], guild_league, 326),
    continue(StateName, State);
handle_info(season_enroll, idle,
            State = #state{grade_ref = OldRef}) ->
    case erlang:is_reference(OldRef) of
        true -> erlang:cancel_timer(OldRef);
        _ -> ok
    end,
    cast_all(guild_league_agent, season_enroll, []),
    Ref = erlang:send_after(30000, self(), reset_grade),
    continue(idle,
             State#state{grade_ref = Ref, is_init = false});
handle_info(season_enroll, StateName, State) ->
    logger:debug("活动时间中不能提交", [], guild_league, 339),
    continue(StateName, State);
handle_info({enroll, Gs}, idle,
            State = #state{is_init = false}) ->
    logger:debug("收到~w公会", [length(Gs)], guild_league, 344),
    logger:debug("~w", [Gs], guild_league, 345),
    ets:insert(guild_league_guild, Gs),
    continue(idle, State);
handle_info({enroll, _}, StateName,
            State = #state{is_matched = _IsMatched}) ->
    logger:debug("错过登记时间 ~w ~w",
                 [StateName, _IsMatched],
                 guild_league,
                 349),
    continue(StateName, State);
handle_info(init_grade, idle, State) ->
    guild_league_guild:init_grade(),
    env:save(guild_league_phase, 1),
    continue(idle, State#state{is_init = true, phase = 1});
handle_info(init_grade, StateName, State) ->
    logger:debug("活动时间中不能初始化", [], guild_league, 358),
    continue(StateName, State);
handle_info(match, idle, State) ->
    NewState = set_state(match, State),
    continue(idle, NewState);
handle_info(match, StateName, State) ->
    logger:debug("活动时间中不能匹配", [], guild_league, 366),
    continue(StateName, State);
handle_info(judge, active,
            State = #state{later_ref = LaterRef,
                           later_phase = LaterPhase}) ->
    case erlang:is_reference(LaterRef) of
        true -> erlang:cancel_timer(LaterRef);
        _ -> ok
    end,
    NewLaterPhase = LaterPhase + 1,
    case NewLaterPhase >= 1 of
        true ->
            guild_league_match:judge(1),
            continue(active,
                     State#state{is_judge = true,
                                 later_phase = NewLaterPhase});
        _ ->
            NewLaterRef = erlang:send_after(900 * 1000,
                                            self(),
                                            judge),
            guild_league_match:judge(NewLaterPhase),
            continue(active,
                     State#state{later_ref = NewLaterRef,
                                 later_phase = NewLaterPhase})
    end;
handle_info(judge, StateName, State) ->
    continue(StateName, State);
handle_info(cannon_ready, active,
            State = #state{cannon_ref = CannonRef}) ->
    case erlang:is_reference(CannonRef) of
        true -> erlang:cancel_timer(CannonRef);
        _ -> ok
    end,
    guild_league_match:cannon_ready(),
    continue(active, State);
handle_info(cannon_ready, StateName, State) ->
    continue(StateName, State);
handle_info({push, Pid, 17600}, StateName,
            State = #state{timeout = infinity}) ->
    Reply = {0, 0},
    role:pack_send(Pid, 17600, Reply),
    continue(StateName, State);
handle_info({push, Pid, 17600}, StateName,
            State = #state{ts = Ts, timeout = Timeout}) ->
    St = case StateName of
             ready -> 1;
             active -> 2;
             _ -> 0
         end,
    Rest = util:time_left(Timeout, Ts),
    Reply = {St, Rest div 1000},
    role:pack_send(Pid, 17600, Reply),
    continue(StateName, State);
handle_info({set_phase, Phase}, StateName, State) ->
    env:save(guild_league_phase, Phase),
    continue(StateName, State#state{phase = Phase});
handle_info(reset_all, StateName,
            State = #state{init_ref = OldRef}) ->
    case erlang:is_reference(OldRef) of
        true -> erlang:cancel_timer(OldRef);
        _ -> ok
    end,
    env:save(guild_league_phase, 1),
    env:save(guild_league_season, 1),
    guild_league_guild:clear_all(),
    big_world:cast(all, guild_league_agent, gm, [clear]),
    InitRef = erlang:send_after(10000,
                                self(),
                                start_enrolling),
    continue(StateName,
             State#state{phase = 1, season = 1, init_ref = InitRef,
                         is_init = false});
handle_info(attend_all, idle, State) ->
    ets:insert(guild_league_summary,
               [S#guild_league_summary{absence = 0}
                || S <- ets:tab2list(guild_league_summary)]),
    continue(idle, State);
handle_info({update_grade_rank, Grade}, StateName,
            State) ->
    guild_league_guild:update_grade_rank(Grade),
    continue(StateName, State);
handle_info({timeout, Fun}, StateName, State) ->
    case lists:member(Fun, [idle, ready, active, reward]) of
        true -> guild_league:Fun(timeout, State);
        _ -> continue(StateName, State)
    end;
handle_info(reset_grade, idle,
            State = #state{grade_ref = OldRef, phase = Phase,
                           season = Season}) ->
    case erlang:is_reference(OldRef) of
        true -> erlang:cancel_timer(OldRef);
        _ -> ok
    end,
    case Phase of
        8 ->
            guild_league_guild:reset_grade(Phase),
            guild_league_guild:reset_rank(Phase),
            NewSeason = Season + 1,
            NewPhase = 1,
            env:save(guild_league_phase, NewPhase),
            env:save(guild_league_season, NewSeason),
            cast_all(guild_league_agent,
                     set_state,
                     [#{phase => NewPhase, season => NewSeason}]),
            continue(idle,
                     State#state{phase = NewPhase, season = NewSeason});
        4 ->
            guild_league_guild:reset_grade(Phase),
            guild_league_guild:reset_rank(Phase),
            continue(idle, State);
        _ -> continue(idle, State)
    end;
handle_info({reset_grade, Phase}, idle,
            State = #state{}) ->
    case Phase =:= 8 orelse Phase =:= 4 of
        true ->
            self() ! reset_grade,
            continue(idle, State#state{phase = Phase});
        _ -> continue(idle, State)
    end;
handle_info({vote, Phase, Voting}, idle,
            State = #state{phase = Phase}) ->
    acc_voting(Voting, Phase),
    continue(idle, State);
handle_info({vote, _Phase, _Voting}, StateName,
            State) ->
    continue(StateName, State);
handle_info(_Info, StateName, State) ->
    logger:error("未知消息 ~w, ~w",
                 [_Info, StateName],
                 guild_league,
                 494),
    continue(StateName, State).

terminate(_Reason, _StateName, _State) -> ok.

code_change(_OldVsn, StateName, State, _Extra) ->
    {ok, StateName, State}.

get_state(pause) -> {idle, infinity};
get_state(_) ->
    case agenda_data:get(2106) of
        #{args := Days1, starttime := StartTime1} ->
            Timeout = date:week_next_diff(Days1, StartTime1 - 1200),
            {idle, Timeout * 1000};
        _False ->
            logger:error("错误的日程活动配置[Id:~w][Err:~w]",
                         [2106, _False],
                         guild_league,
                         516),
            {idle, infinity}
    end.

get_match_time(_) ->
    case agenda_data:get(2106) of
        #{args := WeekDays} ->
            date:week_next_diff(WeekDays, {14, 59, 30});
        _ -> date:next_diff({14, 59, 30})
    end.

continue(StateName,
         State = #state{timeout = infinity}) ->
    {next_state, StateName, State, infinity};
continue(StateName,
         State = #state{ts = Ts, timeout = Timeout}) ->
    {next_state,
     StateName,
     State,
     util:time_left(Timeout, Ts)}.

continue(Reply, StateName,
         State = #state{timeout = infinity}) ->
    {reply, Reply, StateName, State, infinity};
continue(Reply, StateName,
         State = #state{ts = Ts, timeout = Timeout}) ->
    {reply,
     Reply,
     StateName,
     State,
     util:time_left(Timeout, Ts)}.

set_state(idle, State = #state{timeout = infinity}) ->
    State;
set_state(idle,
          State = #state{timeout = Timeout, ts = Ts,
                         match_ref = OldRef, phase = Phase, season = Season,
                         later_ref = LaterRef, cannon_ref = CannonRef}) ->
    case erlang:is_reference(OldRef) of
        true -> erlang:cancel_timer(OldRef);
        _ -> ok
    end,
    case erlang:is_reference(CannonRef) of
        true -> erlang:cancel_timer(CannonRef);
        _ -> ok
    end,
    case erlang:is_reference(LaterRef) of
        true -> erlang:cancel_timer(LaterRef);
        _ -> ok
    end,
    clear_maps(),
    Rest = util:time_left(Timeout, Ts),
    MatchTime = get_match_time(Phase),
    logger:info("下次匹配时间 ~w, 距离开始时间 ~w",
                [MatchTime, Rest],
                guild_league,
                560),
    Ref = case Rest div 1000 - MatchTime of
              T when T =< 0 ->
                  case guild_league_guild:find_today(#{phase => Phase,
                                                       season => Season})
                      of
                      {ok, Matches, Alliances, Guilds} ->
                          logger:info("重启前匹配过 ~w", [Phase], guild_league, 565),
                          ets:insert(guild_league_match, Matches),
                          ets:insert(guild_league_guild, Guilds),
                          ets:insert(guild_league_alliance, Alliances);
                      _ -> erlang:send_after(1, self(), collect_update)
                  end;
              _ ->
                  erlang:send_after(MatchTime * 1000,
                                    self(),
                                    collect_update)
          end,
    State#state{match_ref = Ref, later_phase = 0};
set_state(match,
          State = #state{phase = Phase, next_id = NextId,
                         match_ref = OldRef, season = Season}) ->
    case erlang:is_reference(OldRef) of
        true -> erlang:cancel_timer(OldRef);
        _ -> ok
    end,
    ets:delete_all_objects(guild_league_role),
    ets:delete_all_objects(guild_league_unit),
    NewNextId = guild_league_guild:pair(#{next_id => NextId,
                                          phase => Phase, season => Season}),
    L2 = ets:tab2list(guild_league_match),
    create_maps(L2),
    env:save(guild_league_next_id, NewNextId),
    guild_league_guild:sync_log_index(),
    State#state{next_id = NewNextId, is_matched = true,
                is_init = true};
set_state(ready, State) ->
    L = ets:tab2list(guild_league_alliance),
    create_maps(L),
    State;
set_state(active,
          State = #state{later_ref = LaterRef,
                         cannon_ref = CannonRef}) ->
    case erlang:is_reference(CannonRef) of
        true -> erlang:cancel_timer(CannonRef);
        _ -> ok
    end,
    case erlang:is_reference(LaterRef) of
        true -> erlang:cancel_timer(LaterRef);
        _ -> ok
    end,
    NewLaterRef = erlang:send_after(900 * 1000,
                                    self(),
                                    judge),
    NewCannonRef = erlang:send_after(720 * 1000,
                                     self(),
                                     cannon_ready),
    guild_league_match:active(),
    State#state{later_phase = 0, later_ref = NewLaterRef,
                cannon_ref = NewCannonRef};
set_state(_, State) -> State.

create_maps([]) -> ok;
create_maps([G = #guild_league_alliance{} | T]) ->
    ets:insert(guild_league_alliance,
               G#guild_league_alliance{map_id = true}),
    create_maps(T);
create_maps([M = #guild_league_match{} | T]) ->
    guild_league_match:start_link(M),
    create_maps(T).

clear_maps() ->
    do_clear_maps(ets:tab2list(guild_league_match)),
    do_clear_maps(ets:tab2list(guild_league_alliance)).

do_clear_maps([]) -> ok;
do_clear_maps([#guild_league_alliance{id = Id,
                                      map_pid = Pid}
               | T]) ->
    clear_units(Pid),
    map:stop(Pid),
    ets:delete(guild_league_alliance, Id),
    do_clear_maps(T);
do_clear_maps([#guild_league_match{id = Id,
                                   map_pid = MapPid, pid = Pid}
               | T]) ->
    clear_units(MapPid),
    ets:delete(guild_league_match, Id),
    map:stop(MapPid),
    guild_league_match:stop(Pid),
    do_clear_maps(T).

clear_units(MapPid) ->
    case map:unit_list(MapPid) of
        {ok, L} ->
            lists:foreach(fun (#map_unit{id = Uid}) ->
                                  unit_mgr:remove(Uid);
                              (_) -> ok
                          end,
                          L);
        _ -> ok
    end.

all_leave() ->
    all_leave(ets:tab2list(guild_league_role)),
    all_leave(ets:tab2list(guild_league_match)).

all_leave([]) -> ok;
all_leave([#guild_league_role{pid = Pid} | T])
    when is_pid(Pid) ->
    role:apply(async,
               Pid,
               {guild_league_role, callback, [leave]}),
    all_leave(T);
all_leave([#guild_league_match{map_pid = Pid} | T])
    when is_pid(Pid) ->
    map:async_apply(Pid,
                    {guild_league_role, callback, [leave]}),
    all_leave(T);
all_leave([_ | T]) -> all_leave(T).

stop_fighting() ->
    stop_fighting(ets:match(guild_league_role,
                            #guild_league_role{pid = '$1', _ = '_'})).

stop_fighting([]) -> ok;
stop_fighting([[Pid] | T]) when is_pid(Pid) ->
    role:apply(async,
               Pid,
               {guild_league_role, callback, [stop_fighting]}),
    stop_fighting(T);
stop_fighting([_ | T]) -> stop_fighting(T).

cast_all(M, F, A) ->
    case [] of
        [_ | _] ->
            [big_world:cast(P, Z, M, F, A) || {P, Z} <- []];
        _ -> big_world:cast(all, M, F, A)
    end.

acc_voting([], _) -> ok;
acc_voting([{Gid, Num} | T], Phase) ->
    P1 = case ets:lookup(guild_league_poll, Gid) of
             [P = #guild_league_poll{phase = Phase, voted = Has}] ->
                 P#guild_league_poll{voted = Has + Num};
             _ ->
                 #guild_league_poll{gid = Gid, voted = Num,
                                    phase = Phase}
         end,
    guild_league_guild:update(P1),
    guild_league_guild:sync_data(P1),
    acc_voting(T, Phase).

