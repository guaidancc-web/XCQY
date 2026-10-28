-file("src/mod/hero/hero_mgr.erl", 1).

-module(hero_mgr).

-behaviour(gen_fsm).

-export([start_link/0,
         m/0,
         split/1,
         split/2,
         call/1,
         cast/1,
         lookup/1,
         update_data/1,
         group_name/1,
         login/1,
         logout/1,
         series_name/1]).

-export([idle/2,
         idle_notice/2,
         idle_prepare/2,
         notice/2,
         prepare/2,
         fight/2,
         box/2,
         reward/2,
         over/2]).

-export([init/1,
         handle_event/3,
         handle_sync_event/4,
         handle_info/3,
         terminate/3,
         code_change/4]).

-record(state,
        {switch = open,
         ts,
         timeout,
         start_time = 0,
         m_time = 0,
         ready_zones = [],
         zones = [],
         id = 1,
         npc_battle_id,
         world_lev = 0}).

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

-file("src/mod/hero/hero_mgr.erl", 57).

-file("inc/role.hrl", 1).

-record(role,
        {ver = 76 :: pos_integer(),
         pid :: undefined | pid(),
         loop_counter = 1 :: pos_integer(),
         is_gain = false,
         need_sync = false :: boolean(),
         time_info = {0, 0} ::
             {non_neg_integer(), non_neg_integer()},
         time_reg = 1 :: pos_integer(),
         ip_reg = {0, 0, 0, 0} :: tuple(),
         ip_last_login = {0, 0, 0, 0} :: tuple(),
         lock_status = 0,
         id = {1, "", 0} ::
             {pos_integer(), list(), non_neg_integer()},
         platform = "" :: list(),
         zone_id = 0 :: non_neg_integer(),
         channel_reg = 0 :: non_neg_integer(),
         dispense = "",
         device_id = "",
         device_type = 1,
         device_key = "",
         account = "" :: list(),
         name = "" :: list(),
         charge = 0 :: non_neg_integer(),
         consume = 0,
         label = 0 :: 0..2,
         sex = 2 :: 0..2,
         classes = 0 :: 0..5,
         lev = 0 :: non_neg_integer(),
         realm = 0 :: non_neg_integer(),
         speed = 0 :: non_neg_integer(),
         hp = 1 :: pos_integer(),
         mp = 1 :: pos_integer(),
         hp_max = 1 :: pos_integer(),
         mp_max = 1 :: pos_integer(),
         face = 1 :: pos_integer(),
         assets :: undefined | tuple(),
         attr :: undefined | tuple(),
         link :: undefined | tuple(),
         trigger = {1, []} :: {pos_integer(), [tuple()]},
         timer :: undefined | tuple(),
         pos :: undefined | tuple(),
         extra = [] :: [{non_neg_integer(), term()}],
         status = 0 :: 0..4,
         s_action = 0 :: non_neg_integer(),
         s_ride = 0 :: 0..3,
         s_event = 0 :: non_neg_integer(),
         s_event_pid = 0 :: 0 | undefined | pid(),
         s_name = 0 :: 0 | 1,
         s_looks = [] ::
             [{non_neg_integer(),
               non_neg_integer(),
               non_neg_integer(),
               bitstring()}],
         s_follow = [] :: [tuple()],
         debug_rpc = false :: boolean(),
         name_used = "" :: string(),
         cross_type = 0,
         m_attr_point,
         m_combat,
         m_quest,
         m_pet,
         m_skill,
         m_var,
         m_guard,
         m_plot,
         m_dungeon,
         m_guild,
         m_home,
         m_option,
         m_wing,
         m_team,
         m_honor,
         m_friend,
         m_wake,
         m_arena,
         m_market_silver,
         m_escort,
         m_buff,
         m_formation,
         m_skill_life,
         m_trial,
         m_fashion,
         m_satiety,
         m_agenda,
         m_parade,
         m_mail = [],
         m_qualifying,
         m_treasure,
         m_campaign,
         m_shipping,
         m_checkin,
         m_tower,
         m_classes_challenge,
         m_fairyland,
         m_glory,
         m_examination,
         m_adm,
         m_alchemy,
         m_pet_store,
         m_store,
         m_achievement,
         m_wedding,
         m_constellation,
         m_investment,
         m_privilege,
         m_limit_return,
         m_pray,
         m_teacher,
         m_help,
         m_achieve_shop,
         m_brave_trial,
         m_camp_dragon_boat,
         m_over_seas,
         m_hook_setting,
         m_tournament,
         m_market_gold,
         m_goal,
         m_family,
         m_charge_gift,
         m_mount,
         m_camp_web,
         m_handbook,
         m_endless_challenge,
         m_lev_break,
         m_head,
         m_extension,
         m_camp_cake,
         m_rainbow_lottery,
         m_sworn,
         m_gods_duel,
         m_preparation,
         m_reward_back,
         m_child,
         m_maze,
         m_raffle,
         m_rencounter,
         m_talisman,
         m_month_gift,
         m_pay_turn,
         m_camp_box,
         m_camp_pay_continus,
         m_spirit_treasure,
         m_camp_discount,
         m_camp_7_7th,
         m_new_expression,
         m_exquisite_shelf,
         m_camp_recharge,
         m_camp_recharge_gift,
         m_camp_collection,
         m_camp_cut_price,
         m_camp_inquiry,
         m_gods_place,
         m_camp_slot_machine,
         m_camp_sign_draw,
         m_agenda_week,
         m_exp_bottle,
         m_camp_zillionaire,
         m_provocation,
         m_oracle_treasure,
         m_camp_pass_flower_language,
         m_camp_score_exchange,
         m_camp_pray,
         p_bag,
         p_store,
         p_eqm,
         p_family_store}).

-record(map_role,
        {pid :: undefined | pid(),
         rid = 0 :: non_neg_integer(),
         platform = "" :: list(),
         zone_id = 0 :: non_neg_integer(),
         name = "" :: list(),
         speed = 1 :: pos_integer(),
         conn_pid :: undefined | pid(),
         map = 0 :: non_neg_integer(),
         grid_pid :: undefined | pid(),
         dir = 0 :: non_neg_integer(),
         x = 0 :: non_neg_integer(),
         y = 0 :: non_neg_integer(),
         gx = 0 :: non_neg_integer(),
         gy = 0 :: non_neg_integer(),
         status = 0 :: non_neg_integer(),
         action = 0 :: non_neg_integer(),
         ride = 0 :: non_neg_integer(),
         event = 0 :: non_neg_integer(),
         hidden = 0 :: 0..1,
         label = 0 :: 0..2,
         lev = 1 :: pos_integer(),
         sex = 0 :: 0..2,
         classes = 0 :: 0..5,
         realm = 0 :: non_neg_integer(),
         face = 1 :: pos_integer(),
         fc = 0 :: non_neg_integer(),
         prop = [] :: [{non_neg_integer(), string()}],
         looks = [] :: list(),
         follow_list = [] :: list(),
         guild = "" :: bitstring(),
         guild_post = "" :: bitstring(),
         guild_signature = "" :: bitstring(),
         guild_id = {0, "", 0} ::
             {non_neg_integer(), bitstring(), non_neg_integer()},
         team_status = 0 :: 0..4,
         team_num = 0,
         lover_rid = 0 :: non_neg_integer(),
         lover_platform = "" :: list(),
         lover_zone_id = 0 :: non_neg_integer(),
         lover_name = "" :: list(),
         lover_status = 0 :: non_neg_integer(),
         team_mark = 401 :: non_neg_integer(),
         foot_mark = 0 :: non_neg_integer()}).

-record(role_info,
        {id = 0 :: non_neg_integer(),
         platform = "" :: list(),
         zone_id = 0 :: non_neg_integer(),
         name = "" :: list(),
         lock_status = 0 :: 0..3,
         lev = 1 :: pos_integer(),
         break_times = 0 :: non_neg_integer(),
         sex = 0 :: 0..2,
         classes = 0 :: 0..5,
         fc = 0 :: pos_integer(),
         guild = "" :: list()}).

-record(role_name_used,
        {ver = 1,
         id = {0, "", 0},
         name = "",
         new_name = "",
         sex = 0,
         classes = 0,
         time = 0}).

-record(role_profile,
        {id = {0, "", 0} :: tuple(),
         name = "" :: list(),
         lev = 1 :: pos_integer(),
         sex = 0 :: 0..2,
         classes = 0 :: 0..5,
         fc = 0 :: pos_integer(),
         face = 0 :: non_neg_integer(),
         guild_id = {0, "", 0} :: tuple(),
         guild_name = "" :: list(),
         looks = [],
         achievement_point = 0 :: non_neg_integer(),
         achievement_assets_point = 0,
         achievement_list = [],
         status = 0 :: 0..4,
         team_status = 0 :: 0..4,
         team_num = 0,
         name_used = "" :: string(),
         honor_id = 0 :: non_neg_integer(),
         lover_name = "" :: string(),
         teacher_name = "" :: string(),
         tournament_lev = 0 :: non_neg_integer(),
         family_id = {0, "", 0} :: tuple(),
         break_times = 0 :: non_neg_integer(),
         pre_honor_id = 0 :: non_neg_integer()}).

-record(role_cache,
        {id = {1, "", 0} ::
             {pos_integer(), bitstring(), non_neg_integer()},
         pid :: undefined | pid(),
         link,
         account = "" :: bitstring(),
         name = "" :: bitstring(),
         label = 0 :: 0..2,
         face = 1,
         sex = 2 :: 0..2,
         classes = 0 :: 0..4,
         lev = 0 :: non_neg_integer(),
         hp = 1 :: pos_integer(),
         mp = 1 :: pos_integer(),
         hp_max = 1 :: pos_integer(),
         mp_max = 1 :: pos_integer(),
         status = 0 :: 0..4,
         s_action = 0 :: non_neg_integer(),
         s_event = 0 :: non_neg_integer(),
         pos,
         channel_reg = 0 :: non_neg_integer()}).

-record(card_state,
        {gold = 0,
         gold_bind = 0,
         buy_time = 0,
         state = 0,
         day = 0,
         day_sum = 0,
         daily_time = 0}).

-record(m_new_expression,
        {s_expression = [], b_expression = []}).

-file("src/mod/hero/hero_mgr.erl", 58).

-file("inc/hero.hrl", 1).

-record(hero_ready_zone,
        {map_id = 0 :: non_neg_integer(),
         map_pid :: pid() | undefined,
         member_size = 0 :: non_neg_integer(),
         group_id = 0 :: pos_integer(),
         exit_npc}).

-record(hero_zone,
        {id = 0 :: non_neg_integer(),
         pid :: pid() | undefined,
         series = 0,
         flag = 0}).

-record(hero_group,
        {id = 0,
         score = 0,
         num = 0,
         offline_num = 0,
         all_num = 0,
         ave_fc = 0,
         sum_fc = 0}).

-record(hero_group_team,
        {group = 0, num = 0, fight = 0, match = 0}).

-record(hero_series,
        {group = 0,
         num = 0,
         ave_fc = 0,
         sum_fc = 0,
         map_id = 0 :: non_neg_integer(),
         map_pid :: pid() | undefined,
         members = []}).

-record(hero_series_ready,
        {tiger = #hero_series{},
         dragon = #hero_series{},
         series = 0,
         ave_fc = 0,
         num = 0}).

-record(hero_series_data,
        {min = 0, max = 0, series = 0, name = ""}).

-record(hero_role,
        {id = {0, "", 0},
         pid,
         status = 0,
         name = "",
         sex = 0,
         classes = 0,
         lev = 0,
         win = 0,
         win_streak = 0,
         times = 0,
         die = 4,
         rank_point = 0,
         score = 0,
         is_combat = 0,
         last_combat_over_time = 0,
         last_role_id,
         zone_id = 0,
         zone_pid,
         team_status = 0,
         team_lev = 40,
         team_len = 1,
         match = 0,
         exp = 0,
         has_enter = 0,
         looks = [],
         has_mail = 0,
         group = 1,
         box = 0,
         series = 0,
         fc = 0,
         m_time = 0}).

-record(hero_reward_data,
        {min = 0,
         max = 0,
         flag = 0,
         item_list = [],
         exp_mode = 0,
         pet_exp_mode = 0}).

-record(hero_win_data,
        {min = 0,
         max = 0,
         flag = 0,
         item_list = [],
         exp = 0,
         pet_exp = 0}).

-file("src/mod/hero/hero_mgr.erl", 59).

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

-file("src/mod/hero/hero_mgr.erl", 60).

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

-file("src/mod/hero/hero_mgr.erl", 61).

-file("inc/pos.hrl", 1).

-record(pos_history,
        {map = 0 :: non_neg_integer(),
         platform = "" :: list(),
         zone_id = 0 :: non_neg_integer(),
         x = 0 :: non_neg_integer(),
         y = 0 :: non_neg_integer()}).

-record(pos,
        {map = 10001 :: non_neg_integer(),
         platform = "" :: list(),
         zone_id = 0 :: non_neg_integer(),
         last :: undefined | #pos_history{},
         map_base_id = 0 :: non_neg_integer(),
         map_pid = 0 :: non_neg_integer() | pid(),
         map_grid_pid = 0 :: non_neg_integer() | pid(),
         hidden = 1 :: 0 | 1,
         x = 0 :: non_neg_integer(),
         y = 0 :: non_neg_integer(),
         dir = 0 :: 0..255}).

-file("src/mod/hero/hero_mgr.erl", 62).

-file("inc/looks.hrl", 1).

-file("src/mod/hero/hero_mgr.erl", 63).

-file("inc/team.hrl", 1).

-record(team,
        {ver = 0,
         pid :: undefined | pid(),
         leader,
         members = [] :: list(),
         applys = [],
         pos :: undefined | tuple(),
         member_num = 1,
         status = 0,
         matched = 0 :: non_neg_integer(),
         is_fly = 0 :: 0 | 1,
         order = [],
         team_formation = 1,
         team_formation_lev = 1,
         usurpers = [],
         type = 0,
         lev_flag = 0,
         lev_min = 0,
         lev_max = 0,
         last_join_time = 0,
         combat_num = 0,
         chat_recruit_info = [],
         target = 0,
         cross_type = 0,
         dun_id = 0}).

-record(m_team,
        {ver = 0,
         pid :: undefined | pid(),
         status = 3 :: non_neg_integer(),
         applys = [],
         mod = 0,
         speed = 0,
         recruitment_time = 0,
         recruitment_ids = lists:seq(1, 5),
         recruitment = [],
         member_num = 0}).

-record(team_mate,
        {ver = 0,
         id = {0, "", 0},
         name = "",
         pid :: undefined | pid(),
         face_id = 0 :: non_neg_integer(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         lev_break_times = 0 :: non_neg_integer(),
         status = 3 :: non_neg_integer(),
         looks = [] :: list(),
         fc = 0 :: non_neg_integer(),
         expect_type = [] :: non_neg_integer(),
         s_ride = 0,
         team_pid :: undefined | pid(),
         matched = 0 :: non_neg_integer(),
         formation_id = 1,
         formation_lev = 1,
         mod = 0,
         speed = 0,
         join_type = 1,
         join_sub_type = 0,
         join_time = 0,
         combat_num = 0,
         constellation_lev = 0,
         lover_id = {0, "", 0},
         lover_name = "",
         lover_status = 0,
         quest_couple_round = 0}).

-record(team_recruitment,
        {ver = 0,
         id :: undefined | tuple(),
         name = "" :: string(),
         face_id = 0 :: non_neg_integer(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         pid,
         type = 0,
         status = 1,
         member_num = 1,
         inviter_status = 0,
         lev_min = 0,
         lev_max = 0,
         matched = 0 :: non_neg_integer(),
         notice_list = [] :: list(),
         cur_classes = [] :: list(),
         constellation_lev = 0,
         chat_recruit_info = [],
         lover_id = {0, "", 0},
         lover_name = "",
         lover_status = 0,
         quest_couple_round = 0,
         precision_notice_list = [] :: list(),
         cross_type = 0}).

-record(team_recruit_room,
        {lev = 0, role_num = 0, members = []}).

-record(team_usurper,
        {id = {0, "", 0} :: tuple(),
         name = "" :: string(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         leader_objected = 0 :: 0 | 1,
         total = 0 :: integer(),
         pros = 0 :: integer(),
         cons = 0 :: integer(),
         time = 0 :: integer(),
         voted_ids = []}).

-record(team_recruit_lev_range,
        {flag = 0, lev = 0, val1 = 0, val2 = 0}).

-record(team_start_args, {pos, is_fly = 0, target = 0}).

-file("src/mod/hero/hero_mgr.erl", 64).

-file("inc/timer.hrl", 1).

-record(timer,
        {id :: undefined | term(),
         timeout = 1000 :: pos_integer(),
         m :: undefined | atom(),
         f :: undefined | function() | atom(),
         a = [] :: [term()],
         times = 1 :: integer(),
         next_tick = 0 :: non_neg_integer(),
         set_time = 1 :: pos_integer()}).

-record(rtimer,
        {ref :: undefined | reference(),
         key :: undefined | reference(),
         timers = [] :: [#timer{}]}).

-record(s_timer,
        {ref :: undefined | reference(),
         timers = [] :: [#timer{}]}).

-file("src/mod/hero/hero_mgr.erl", 65).

login(Role = #role{s_event = Event, pid = RolePid})
    when Event =:= 21 orelse Event =:= 20 ->
    Role1 = looks:del([54, 56, 63],
                      Role#role{s_event = 0, s_event_pid = undefined}),
    looks:async_del(RolePid, 63),
    map:role_enter(util:rand_list([{10001, 306, 3507},
                                   {10001, 2583, 3848},
                                   {10001, 4957, 3680},
                                   {10001, 445, 2565},
                                   {10001, 4646, 704},
                                   {10001, 841, 1033},
                                   {10001, 2098, 1834},
                                   {10001, 3617, 1816}]),
                   Role1);
login(_) -> ok.

logout(#role{s_event = Event, id = Id})
    when Event =:= 21 orelse Event =:= 20 ->
    hero_mgr ! {logout, Id},
    ok;
logout(_) -> ok.

-spec m() -> ok.

m() ->
    logger:info("有人输入了下阶段", [], hero_mgr, 86),
    gen_fsm:send_event(hero_mgr, timeout).

start_link() ->
    gen_fsm:start_link({local, hero_mgr}, hero_mgr, [], []).

cast(Event) ->
    gen_fsm:send_all_state_event(hero_mgr, Event).

call(Event) ->
    try gen_fsm:sync_send_all_state_event(hero_mgr, Event)
    catch
        _Type:_Reason ->
            logger:debug("Type: ~w  Reason: ~w",
                         [_Type, _Reason],
                         hero_mgr,
                         103),
            {error, timeout}
    end.

split(List) ->
    Fun = fun (#hero_role{group = Group}) -> Group == 1 end,
    split(Fun, List).

split(Fun, List) -> lists:splitwith(Fun, List).

group_name(1) -> lang:get("部落");
group_name(_) -> lang:get("联盟").

series_name(Series) ->
    case hero_data:get_series(Series) of
        #hero_series_data{name = Name} -> Name;
        _ -> ""
    end.

init([]) ->
    logger:info("开始启动...", [], hero_mgr, 128),
    process_flag(trap_exit, true),
    ets:new(hero_role,
            [set, named_table, public, {keypos, #hero_role.id}]),
    TimeLeft = get_idle_time(),
    {WorldLev, _} = world_lev:get_world_lev(),
    State = #state{ts = date:now2(),
                   timeout = TimeLeft * 1000, world_lev = WorldLev},
    NewState = set_npc(TimeLeft, State),
    logger:info("启动完成", [], hero_mgr, 135),
    {ok, idle, NewState, TimeLeft * 1000}.

handle_event({sign,
              #{id := RoleId, pid := Pid, group := Group,
                team_lev := TeamLev, team_len := TeamLen,
                series := Series}},
             StateName = prepare,
             State = #state{ready_zones = ReadyZones}) ->
    case lookup(RoleId) of
        #hero_role{group = Group} ->
            case lists:keyfind(Series,
                               #hero_series_ready.series,
                               ReadyZones)
                of
                #hero_series_ready{tiger =
                                       #hero_series{group = Group,
                                                    map_id = MapId}} ->
                    role:apply(async,
                               Pid,
                               {hero_role,
                                apply_enter_ready,
                                [#{map_id => MapId, group => Group,
                                   team_lev => TeamLev, team_len => TeamLen,
                                   series => Series, hero_pid => self(),
                                   state_name => StateName}]});
                #hero_series_ready{dragon =
                                       #hero_series{map_id = MapId}} ->
                    role:apply(async,
                               Pid,
                               {hero_role,
                                apply_enter_ready,
                                [#{map_id => MapId, group => Group,
                                   team_lev => TeamLev, team_len => TeamLen,
                                   series => Series, hero_pid => self(),
                                   state_name => StateName}]});
                _ -> ignore
            end;
        #hero_role{} ->
            notice:npc_talk({pid, Pid},
                            20064,
                            lang:get("你已经自己退出，不能再参加了"));
        _ ->
            case lists:keyfind(Series,
                               #hero_series_ready.series,
                               ReadyZones)
                of
                #hero_series_ready{tiger =
                                       #hero_series{group = Group,
                                                    map_id = MapId}} ->
                    role:apply(async,
                               Pid,
                               {hero_role,
                                apply_enter_ready,
                                [#{map_id => MapId, group => Group,
                                   team_lev => TeamLev, team_len => TeamLen,
                                   series => Series, hero_pid => self(),
                                   state_name => StateName}]});
                #hero_series_ready{dragon =
                                       #hero_series{map_id = MapId}} ->
                    role:apply(async,
                               Pid,
                               {hero_role,
                                apply_enter_ready,
                                [#{map_id => MapId, group => Group,
                                   team_lev => TeamLev, team_len => TeamLen,
                                   series => Series, hero_pid => self(),
                                   state_name => StateName}]});
                _ -> ignore
            end
    end,
    continue(StateName, State);
handle_event(Info = {leave,
                     #{id := RoleId, pid := Pid}},
             StateName, State) ->
    case lookup(RoleId) of
        #hero_role{zone_pid = ZonePid} when is_pid(ZonePid) ->
            case util:is_process_alive(ZonePid) of
                true -> hero:cast(ZonePid, Info);
                _ ->
                    role:apply(async,
                               Pid,
                               {hero_role, apply_leave_zone, [self()]})
            end;
        #hero_role{} ->
            role:apply(async,
                       Pid,
                       {hero_role, apply_leave_zone, [self()]});
        _ -> ignore
    end,
    continue(StateName, State);
handle_event(Info = {leave_succ, RoleId}, StateName,
             State) ->
    case lookup(RoleId) of
        #hero_role{zone_pid = ZonePid} when is_pid(ZonePid) ->
            hero:cast(ZonePid, Info);
        R = #hero_role{} ->
            update_data(R#hero_role{status = 2});
        _ -> ignore
    end,
    continue(StateName, State);
handle_event(Info = {push,
                     #{id := RoleId, pid := RolePid}},
             StateName, State) ->
    case lookup(RoleId) of
        #hero_role{zone_pid = ZonePid} when is_pid(ZonePid) ->
            hero:cast(ZonePid, Info);
        _ -> push_state(RolePid, StateName, State)
    end,
    continue(StateName, State);
handle_event({logout, RoleId}, StateName, State) ->
    case lookup(RoleId) of
        #hero_role{zone_pid = ZonePid} when is_pid(ZonePid) ->
            hero:cast(ZonePid, {logout, RoleId});
        R = #hero_role{} ->
            update_data(R#hero_role{status = 2});
        _ -> ignore
    end,
    continue(StateName, State);
handle_event({close_zone, ZoneId}, StateName,
             State = #state{zones = Zones}) ->
    NewZones = case lists:keyfind(ZoneId,
                                  #hero_zone.id,
                                  Zones)
                   of
                   Zone = #hero_zone{} ->
                       lists:keyreplace(ZoneId,
                                        #hero_zone.id,
                                        Zones,
                                        Zone#hero_zone{flag = 0});
                   _ -> Zones
               end,
    case [1 || #hero_zone{flag = 1} <- NewZones] of
        [] ->
            IdleTime = get_idle_time(),
            NState = State#state{ts = date:now2(),
                                 timeout = IdleTime * 1000, zones = []},
            NState1 = del_npc(NState),
            server_timer:clean(),
            NewState = case IdleTime of
                           IdleTime when is_integer(IdleTime) ->
                               set_npc(IdleTime, NState1);
                           _ -> NState
                       end,
            continue(idle, NewState);
        _ -> continue(StateName, State#state{zones = NewZones})
    end;
handle_event({push_role, #{pid := Pid, id := RoleId}},
             StateName, State) ->
    case hero_mgr:lookup(RoleId) of
        R = #hero_role{} ->
            hero:push_role(R#hero_role{pid = Pid});
        _ -> ignore
    end,
    continue(StateName, State);
handle_event({update_team_status,
              TeamLev,
              TeamLen,
              ChangeList},
             StateName, State) ->
    Fun = fun ({Flag, RoleId}) ->
                  case hero_mgr:lookup(RoleId) of
                      Tc = #hero_role{name = _RoleName, lev = RoleLev} ->
                          NewTc = case Flag of
                                      leader ->
                                          Tc#hero_role{team_status = 1,
                                                       team_lev = TeamLev,
                                                       team_len = TeamLen,
                                                       match = util:rand(1, 3)};
                                      away ->
                                          Tc#hero_role{team_status = 3,
                                                       team_lev = RoleLev,
                                                       team_len = 1, match = 0};
                                      none ->
                                          Tc#hero_role{team_status = 0,
                                                       team_lev = RoleLev,
                                                       team_len = 1, match = 0};
                                      follow ->
                                          Tc#hero_role{team_status = 2,
                                                       team_lev = RoleLev,
                                                       team_len = 1, match = 0};
                                      _ -> Tc
                                  end,
                          hero:push_role(NewTc),
                          hero_mgr:update_data(NewTc);
                      _ -> skip
                  end;
              (_) -> skip
          end,
    lists:foreach(Fun, ChangeList),
    continue(StateName, State);
handle_event({sign_succ,
              R = #hero_role{name = _Name, series = Series,
                             group = Group, fc = Fc}},
             StateName, State = #state{ready_zones = ReadyZones}) ->
    NewReadyZones = case lists:keyfind(Series,
                                       #hero_series_ready.series,
                                       ReadyZones)
                        of
                        S = #hero_series_ready{tiger =
                                                   Data = #hero_series{group =
                                                                           Group,
                                                                       sum_fc =
                                                                           SumFc,
                                                                       num =
                                                                           Num},
                                               dragon =
                                                   #hero_series{sum_fc = OSumFc,
                                                                num = ONum}} ->
                            NNum = Num + 1,
                            NewSumFc = SumFc + Fc,
                            NewTFc = NewSumFc / NNum,
                            NewData = Data#hero_series{ave_fc = NewTFc,
                                                       num = NNum,
                                                       sum_fc = NewSumFc},
                            AvgFc = (NewSumFc + OSumFc) / (NNum + ONum),
                            NS = S#hero_series_ready{tiger = NewData,
                                                     ave_fc = AvgFc},
                            lists:keyreplace(Series,
                                             #hero_series_ready.series,
                                             ReadyZones,
                                             NS);
                        S = #hero_series_ready{dragon =
                                                   Data = #hero_series{group =
                                                                           Group,
                                                                       sum_fc =
                                                                           SumFc,
                                                                       num =
                                                                           Num},
                                               tiger =
                                                   #hero_series{sum_fc = OSumFc,
                                                                num = ONum}} ->
                            NNum = Num + 1,
                            NewSumFc = SumFc + Fc,
                            NewDFc = NewSumFc / NNum,
                            NewData = Data#hero_series{ave_fc = NewDFc,
                                                       num = NNum,
                                                       sum_fc = NewSumFc},
                            AvgFc = (NewSumFc + OSumFc) / (NNum + ONum),
                            NS = S#hero_series_ready{dragon = NewData,
                                                     ave_fc = AvgFc},
                            lists:keyreplace(Series,
                                             #hero_series_ready.series,
                                             ReadyZones,
                                             NS);
                        _ -> ReadyZones
                    end,
    Now = date:unixtime(),
    logger:debug("武道会报名成功~ts, series:~w, group:~w",
                 [_Name, Series, Group],
                 hero_mgr,
                 310),
    hero:push_role(R),
    update_data(R#hero_role{m_time = Now}),
    continue(StateName,
             State#state{ready_zones = NewReadyZones});
handle_event(_Event, StateName, State) ->
    continue(StateName, State).

handle_sync_event({get_leader_sign_statue, _}, _From,
                  StateName = idle, State) ->
    Msg = open_msg(),
    continue(StateName, {false, Msg}, State);
handle_sync_event({get_leader_sign_statue, _}, _From,
                  StateName, State)
    when StateName == idle_notice orelse
             StateName == idle_prepare orelse StateName == notice ->
    Msg = open_msg(),
    continue(StateName, {false, Msg}, State);
handle_sync_event({get_leader_sign_statue,
                   #{id := RoleId, num := Num}},
                  _From, StateName, State)
    when StateName == prepare ->
    Reply = case hero_mgr:lookup(RoleId) of
                #hero_role{group = _Group} when Num >= 1 ->
                    {false, lang:get("已经报名的，不能带其他玩家一起报名")};
                #hero_role{group = _Group} -> {ok, true};
                _ -> {ok, true}
            end,
    continue(StateName, Reply, State);
handle_sync_event({get_leader_sign_statue,
                   #{id := RoleId}},
                  _From, StateName, State)
    when StateName == fight ->
    Reply = case hero_mgr:lookup(RoleId) of
                #hero_role{} -> {false, lang:get("已经报名过了")};
                _ -> {ok, true}
            end,
    continue(StateName, Reply, State);
handle_sync_event({get_leader_sign_statue, _}, _From,
                  StateName, State) ->
    continue(StateName,
             {false, lang:get("活动已开始，下次早点过来报名吧")},
             State);
handle_sync_event({get_sign_statue, _}, _From,
                  StateName = idle, State) ->
    Msg = open_msg(),
    continue(StateName, {false, Msg}, State);
handle_sync_event({get_sign_statue, _}, _From,
                  StateName, State)
    when StateName == idle_notice orelse
             StateName == idle_prepare orelse StateName == notice ->
    Msg = open_msg(),
    continue(StateName, {false, Msg}, State);
handle_sync_event({get_sign_statue, #{id := RoleId}},
                  _From, StateName, State)
    when StateName == prepare orelse StateName == fight ->
    Reply = case hero_mgr:lookup(RoleId) of
                #hero_role{} -> {false, lang:get("已经分配了阵营，请退出队伍再进入")};
                _ -> {ok, true}
            end,
    continue(StateName, Reply, State);
handle_sync_event({get_sign_statue, _}, _From,
                  StateName, State) ->
    continue(StateName,
             {false, lang:get("活动已开始，下次早点过来报名吧")},
             State);
handle_sync_event({get_ready_num, _}, _From,
                  StateName = idle, State) ->
    Msg = open_msg(),
    continue(StateName, {false, Msg}, State);
handle_sync_event({get_ready_num, _}, _From, StateName,
                  State)
    when StateName == idle_notice orelse
             StateName == idle_prepare orelse StateName == notice ->
    Msg = open_msg(),
    continue(StateName, {false, Msg}, State);
handle_sync_event({get_ready_num,
                   #{id := RoleId, series := Series, fc := Fc}},
                  _From, StateName = prepare,
                  State = #state{ready_zones = ReadyZones}) ->
    Reply = case lookup(RoleId) of
                #hero_role{group = Group} ->
                    {ok, StateName, self(), Group};
                _ ->
                    case lists:keyfind(Series,
                                       #hero_series_ready.series,
                                       ReadyZones)
                        of
                        #hero_series_ready{tiger = #hero_series{num = TNum},
                                           dragon = #hero_series{num = DNum}}
                            when TNum < DNum ->
                            {ok, StateName, self(), 1};
                        #hero_series_ready{tiger = #hero_series{num = TNum},
                                           dragon = #hero_series{num = DNum}}
                            when TNum > DNum ->
                            {ok, StateName, self(), 2};
                        #hero_series_ready{tiger =
                                               #hero_series{num = Num,
                                                            ave_fc = TAvgFc},
                                           dragon =
                                               #hero_series{num = Num,
                                                            ave_fc = DAvgFc},
                                           ave_fc = AvgFc}
                            when Fc > AvgFc ->
                            case util:rand(0, 1) of
                                0 ->
                                    case TAvgFc > DAvgFc of
                                        true -> {ok, StateName, self(), 2};
                                        _ -> {ok, StateName, self(), 1}
                                    end;
                                _ ->
                                    case DAvgFc > TAvgFc of
                                        true -> {ok, StateName, self(), 1};
                                        _ -> {ok, StateName, self(), 2}
                                    end
                            end;
                        #hero_series_ready{tiger =
                                               #hero_series{num = Num,
                                                            ave_fc = TAvgFc},
                                           dragon =
                                               #hero_series{num = Num,
                                                            ave_fc = DAvgFc}} ->
                            case util:rand(0, 1) of
                                0 ->
                                    case TAvgFc > DAvgFc of
                                        true -> {ok, StateName, self(), 1};
                                        _ -> {ok, StateName, self(), 2}
                                    end;
                                _ ->
                                    case DAvgFc > TAvgFc of
                                        true -> {ok, StateName, self(), 2};
                                        _ -> {ok, StateName, self(), 1}
                                    end
                            end;
                        #hero_series_ready{} ->
                            case util:rand(0, 1) of
                                0 -> {ok, StateName, self(), 1};
                                _ -> {ok, StateName, self(), 2}
                            end;
                        _ -> {false, lang:get("没有找这个该分区")}
                    end
            end,
    continue(StateName, Reply, State);
handle_sync_event(Info = {get_ready_num,
                          #{series := Series}},
                  _From, StateName = fight,
                  State = #state{start_time = StartTime,
                                 zones = Zones}) ->
    Now = date:unixtime(),
    Reply = case Now =< StartTime + 15 * 60 of
                true ->
                    case lists:keyfind(Series, #hero_zone.series, Zones) of
                        #hero_zone{flag = 0} -> {false, lang:get("你的分组已经结束了")};
                        #hero_zone{pid = Pid} ->
                            case hero:call(Pid, Info) of
                                {ok, Group} -> {ok, StateName, Pid, Group};
                                Err -> Err
                            end;
                        _ -> {false, lang:get("你的分组没有找到")}
                    end;
                _ -> {false, lang:get("活动已开始很久了，下次早点过来报名吧")}
            end,
    continue(StateName, Reply, State);
handle_sync_event({get_ready_num, _RoleId}, _From,
                  StateName, State) ->
    continue(StateName,
             {false, lang:get("活动已开始，下次早点过来报名吧")},
             State);
handle_sync_event(_Event, _From, StateName, State) ->
    Reply = ok,
    continue(StateName, Reply, State).

handle_info({timer_tick, Msg}, Phase, State) ->
    NewState = case tick(Phase, Msg, State) of
                   {ok, {set, Timer}, RtnState} ->
                       server_timer:set(Timer),
                       RtnState;
                   {ok, {set, Timer}} ->
                       server_timer:set(Timer),
                       State;
                   {ok, remove, RtnState} ->
                       server_timer:timer(remove),
                       RtnState;
                   remove ->
                       server_timer:timer(remove),
                       State;
                   _False ->
                       logger:debug("[Msg:~w]定时器返回值:~w",
                                    [Msg, _False],
                                    hero_mgr,
                                    488),
                       server_timer:timer(remove),
                       State
               end,
    continue(Phase, NewState);
handle_info(reload_idle_time, StateName = idle,
            State) ->
    IdleTime = get_idle_time(),
    logger:info("重置勇士战场时间，下次时间:~w",
                [IdleTime],
                hero_mgr,
                496),
    NState = del_npc(State),
    NewState = set_npc(IdleTime, NState),
    continue(StateName,
             NewState#state{ts = date:now2(),
                            timeout = IdleTime * 1000});
handle_info({prepare_notice, Num}, StateName = prepare,
            State) ->
    Msg = case Num of
              1 ->
                  notice:format(lang:get("~ts准备厅10分钟后关闭，快快招兵买马，组队备战吧！{face_1, "
                                         "16}"),
                                [{string_2, 1, lang:get("荣耀战场")}]);
              _ ->
                  notice:format(lang:get("~ts准备厅5分钟后关闭，快快招兵买马，组队备战吧！{face_1, 16}"),
                                [{string_2, 1, lang:get("荣耀战场")}])
          end,
    notice:cast(all, 8, Msg),
    erlang:send_after(5 * 60 * 1000,
                      self(),
                      {prepare_notice, Num + 1}),
    continue(StateName, State);
handle_info({prepare_exp, Num}, StateName = prepare,
            State = #state{ready_zones = ReadyZones}) ->
    [begin
         map:async_apply(MapPid,
                         {hero_role, apply_prepare_exp, []}),
         map:async_apply(MapPid2,
                         {hero_role, apply_prepare_exp, []})
     end
     || #hero_series_ready{tiger =
                               #hero_series{map_pid = MapPid},
                           dragon = #hero_series{map_pid = MapPid2}}
            <- ReadyZones],
    erlang:send_after(60 * 1000,
                      self(),
                      {prepare_exp, Num + 1}),
    continue(StateName, State);
handle_info({world_lev, WorldLev}, StateName, State) ->
    continue(StateName, State#state{world_lev = WorldLev});
handle_info(_Info, StateName, State) ->
    continue(StateName, State).

terminate(_Reason, _StateName, State) ->
    del_npc(State),
    ok.

code_change(_OldVsn, StateName, State, _Extra) ->
    {ok, StateName, State}.

idle(timeout, State = #state{switch = close}) ->
    logger:info("空闲阶段处于close状态，无需开启", [], hero_mgr, 542),
    {next_state, idle, State};
idle(timeout, State) ->
    Now = date:unixtime(),
    case world_lev_limit(State, Now) of
        true ->
            Timeout = 5 * 60,
            Args = [{string_2, 1, lang:get("荣耀战场")}],
            Msg =
                notice:format(lang:get("~ts入口将在~ts分钟后开启，请各位勇士做好准备！{face_1, 7}"),
                              Args ++ [{string_2, 1, 15}]),
            notice:cast(all, 8, Msg),
            NewState = State#state{ts = date:now2(),
                                   timeout = Timeout * 1000, start_time = Now,
                                   m_time = Now + Timeout},
            push_state(idle, NewState),
            continue(idle_notice, NewState);
        _ ->
            IdleTime = get_idle_time(),
            NState = State#state{ts = date:now2(), start_time = 0,
                                 timeout = IdleTime * 1000},
            NState2 = del_npc(NState),
            NewState = case IdleTime of
                           IdleTime when is_integer(IdleTime) ->
                               set_npc(IdleTime, NState2);
                           _ -> NState
                       end,
            continue(idle, NewState)
    end;
idle(_Event, State) -> continue(idle, State).

idle_notice(timeout, State) ->
    Now = date:unixtime(),
    Timeout = 5 * 60,
    Args = [{string_2, 1, lang:get("荣耀战场")}],
    Msg =
        notice:format(lang:get("~ts入口将在~ts分钟后开启，请各位勇士做好准备！{face_1, 7}"),
                      Args ++ [{string_2, 1, 10}]),
    notice:cast(all, 8, Msg),
    NewState = State#state{ts = date:now2(),
                           timeout = Timeout * 1000, start_time = Now,
                           m_time = Now + Timeout},
    push_state(idle_notice, NewState),
    continue(idle_prepare, NewState);
idle_notice(_Event, State) ->
    continue(idle_notice, State).

idle_prepare(timeout, State) ->
    logger:info("荣耀战场进入公告阶段", [], hero_mgr, 592),
    ets:delete_all_objects(hero_role),
    Now = date:unixtime(),
    Timeout = 5 * 60,
    Args = [{string_2, 1, lang:get("荣耀战场")}],
    Msg =
        notice:format(lang:get("~ts入口将在~ts分钟后开启，请各位勇士做好准备！{face_1, 7}"),
                      Args ++ [{string_2, 1, util:ceil(Timeout / 60)}]),
    notice:cast(all, 8, Msg),
    SeriesList = hero_data:serieses(),
    case init_ready_zone(State, SeriesList) of
        {ok, ReadyState} ->
            NewState = ReadyState#state{ts = date:now2(),
                                        timeout = Timeout * 1000,
                                        m_time = Now + Timeout,
                                        start_time = Now},
            push_state(notice, NewState),
            continue(notice, NewState);
        {false, Msg} ->
            logger:error("创建战场准备区失败:~ts", [Msg], hero_mgr, 609),
            TimeLeft = get_idle_time(),
            NewState = State#state{ts = date:now2(),
                                   timeout = TimeLeft * 1000},
            push_state(idle, NewState),
            continue(idle, NewState);
        _False ->
            logger:error("创建战场准备区失败:~w", [_False], hero_mgr, 615),
            {stop, normal, State}
    end;
idle_prepare(_Event, State) ->
    continue(idle_prepare, State).

notice(timeout, State = #state{}) ->
    ets:delete_all_objects(hero_role),
    logger:info("荣耀战场战场进入报名阶段", [], hero_mgr, 625),
    Now = date:unixtime(),
    Timeout = 15 * 60,
    Fmt = lang:get("~ts已经开启报名，请各位勇士火速前往参加！{face_1, 16}"),
    Args = [{string_2, 1, lang:get("荣耀战场")}],
    Msg = notice:format(Fmt, Args),
    notice:cast(all, 8, Msg),
    erlang:send_after(5 * 60 * 1000,
                      self(),
                      {prepare_notice, 1}),
    erlang:send_after(60 * 1000, self(), {prepare_exp, 1}),
    NState = State#state{ts = date:now2(),
                         timeout = Timeout * 1000, m_time = Now + Timeout,
                         start_time = Now, zones = []},
    NState1 = del_npc(NState),
    NewState = npc(NState1),
    push_state(prepare, NewState),
    erlang:send_after(300 * 1000, self(), {notice_msg, 1}),
    continue(prepare, NewState);
notice(_Event, State) -> continue(notice, State).

prepare(timeout,
        State = #state{ready_zones = ReadyZones}) ->
    honor_mgr:clear(list_to_atom(lists:concat(["hero_honor_",
                                               1]))),
    honor_mgr:clear(list_to_atom(lists:concat(["hero_honor_",
                                               2]))),
    honor_mgr:clear(list_to_atom(lists:concat(["hero_honor_",
                                               3]))),
    honor_mgr:clear(list_to_atom(lists:concat(["hero_honor_",
                                               4]))),
    logger:info("荣耀战场进入进入战场阶段", [], hero_mgr, 655),
    Now = date:unixtime(),
    RoleList = ets:tab2list(hero_role),
    ReadyZones1 = series_role(RoleList, ReadyZones),
    ReadyZones3 = lists:keysort(#hero_series_ready.series,
                                ReadyZones1),
    ReadyZones4 = series_merge(ReadyZones3, [], []),
    ReadyZones5 = lists:keysort(#hero_series_ready.series,
                                ReadyZones4),
    ReadyZones6 = lists:reverse(ReadyZones5),
    ReadyZones7 = series_merge(ReadyZones6, [], []),
    logger:info("武道大会准备区：{~ts, ~w}, ~w",
                [env:get(platform), env:get(zone_id), ReadyZones],
                hero_mgr,
                664),
    case create_zone(State, ReadyZones7) of
        {ok, NState = #state{zones = _Zones}} ->
            Timeout = 55 * 60,
            Fmt = lang:get("~ts活动正式开始！为了阵营的胜利，战斗吧！{face_1, 7}"),
            Msg = notice:format(Fmt,
                                [{string_2, 1, lang:get("荣耀战场")}]),
            notice:cast(all, 8, Msg),
            NewState = NState#state{ts = date:now2(),
                                    timeout = Timeout * 1000, ready_zones = [],
                                    start_time = Now, m_time = Now + Timeout},
            close_ready_zone(ReadyZones),
            push_state(fight, NewState),
            continue(fight, NewState);
        {false, Reason} ->
            Msg = Reason,
            notice:cast(all, 8, Msg),
            [role:apply(async,
                        RPid,
                        {hero_role, apply_leave_zone, [undefined]})
             || #hero_role{pid = RPid, status = 1} <- RoleList],
            IdleTime = get_idle_time(),
            close_ready_zone(ReadyZones),
            push_state(idle, State),
            NState = del_npc(State),
            continue(idle,
                     NState#state{ts = date:now2(),
                                  timeout = IdleTime * 1000, start_time = Now,
                                  ready_zones = []});
        _Err ->
            logger:error("创建战场错误[Err:~w]", [_Err], hero_mgr, 694),
            [role:apply(async,
                        RPid,
                        {hero_role, apply_leave_zone, [undefined]})
             || #hero_role{pid = RPid, status = 1} <- RoleList],
            IdleTime = get_idle_time(),
            close_ready_zone(ReadyZones),
            push_state(idle, State),
            NState = del_npc(State),
            continue(idle,
                     NState#state{ts = date:now2(),
                                  timeout = IdleTime * 1000, ready_zones = []})
    end;
prepare(_Event, State) -> continue(prepare, State).

fight(timeout, State = #state{zones = Zones}) ->
    logger:info("荣耀战场战斗阶段结束", [], hero_mgr, 711),
    Now = date:unixtime(),
    Timeout = 60,
    [hero:cast(Pid, end_fight)
     || #hero_zone{pid = Pid} <- Zones],
    NewState = State#state{ts = date:now2(),
                           timeout = Timeout * 1000, start_time = Now,
                           m_time = Now + Timeout},
    push_state(reward, NewState),
    continue(reward, NewState);
fight(_Event, State) -> continue(fight, State).

reward(timeout, State = #state{zones = Zones}) ->
    logger:info("荣耀战场奖励阶段", [], hero_mgr, 727),
    Now = date:unixtime(),
    Timeout = 5 * 60,
    [hero:cast(Pid, end_reward)
     || #hero_zone{pid = Pid} <- Zones],
    NewState = State#state{ts = date:now2(),
                           timeout = 5 * 60 * 1000, start_time = Now,
                           m_time = Now + Timeout},
    push_state(box, NewState),
    continue(box, NewState);
reward(_Event, State) -> continue(reward, State).

box(timeout, State = #state{zones = Zones}) ->
    logger:info("荣耀战场结束", [], hero_mgr, 744),
    [hero:cast(Pid, over)
     || #hero_zone{pid = Pid} <- Zones],
    NState = State#state{ts = date:now2(), start_time = 0,
                         timeout = 10 * 1000},
    push_state(idle, NState),
    NState2 = del_npc(NState),
    IdleTime = get_idle_time(),
    NewState = case IdleTime of
                   IdleTime when is_integer(IdleTime) ->
                       set_npc(IdleTime, NState2);
                   _ -> NState
               end,
    continue(over, NewState);
box(_Event, State) -> continue(box, State).

over(timeout, State = #state{zones = Zones}) ->
    [hero:cast(Pid, stop)
     || #hero_zone{pid = Pid, flag = 1} <- Zones],
    IdleTime = get_idle_time(),
    NState = State#state{ts = date:now2(), start_time = 0,
                         timeout = IdleTime * 1000},
    continue(idle, NState);
over(_Event, State) -> continue(over, State).

get_idle_time() ->
    case agenda_data:get(2019) of
        #{args := Days1} ->
            Time1 = date:week_next_diff(Days1, 19 * 3600 + 45 * 60),
            case agenda_data:get(2023) of
                #{args := Days2} ->
                    Time2 = date:week_next_diff(Days2, 14 * 3600 + 15 * 60),
                    case Time1 < Time2 of
                        true -> Time1;
                        _ -> Time2
                    end;
                _ -> Time1
            end;
        _False ->
            logger:error("错误的日程活动配置[Id:~w][Err:~w]",
                         [2019, _False],
                         hero_mgr,
                         789),
            undefined
    end.

push_state(Pid, notice, #state{m_time = MTime}) ->
    role:pack_send(Pid, 16300, {1, MTime});
push_state(Pid, prepare, #state{m_time = MTime}) ->
    role:pack_send(Pid, 16300, {2, MTime});
push_state(Pid, fight, #state{m_time = MTime}) ->
    role:pack_send(Pid, 16300, {3, MTime});
push_state(Pid, reward, #state{m_time = MTime}) ->
    role:pack_send(Pid, 16300, {4, MTime});
push_state(Pid, box, #state{m_time = MTime}) ->
    role:pack_send(Pid, 16300, {5, MTime});
push_state(Pid, _StateName, _State) ->
    role:pack_send(Pid, 16300, {0, 0}).

push_state(notice, #state{m_time = MTime}) ->
    role_group:pack_send(world, 16300, {1, MTime});
push_state(prepare, #state{m_time = MTime}) ->
    role_group:pack_send(world, 16300, {2, MTime});
push_state(fight, #state{m_time = MTime}) ->
    role_group:pack_send(world, 16300, {3, MTime});
push_state(reward, #state{m_time = MTime}) ->
    role_group:pack_send(world, 16300, {4, MTime});
push_state(box, #state{m_time = MTime}) ->
    role_group:pack_send(world, 16300, {5, MTime});
push_state(_, _) ->
    role_group:pack_send(world, 16300, {0, 0}).

init_ready_zone(State, []) -> {ok, State};
init_ready_zone(State = #state{ready_zones =
                                   ReadyZones},
                [Series | T]) ->
    case map_mgr:create(30009) of
        {ok, TMapPid, TMapId} ->
            Tiger = #hero_series{group = 1, map_id = TMapId,
                                 map_pid = TMapPid},
            case map_mgr:create(30010) of
                {ok, DMapPid, DMapId} ->
                    case unit_mgr:fetch_ids(2) of
                        {ok, [Id1, Id2 | _]} ->
                            BattleId1 = {24, Id1},
                            BattleId2 = {24, Id2},
                            unit_mgr:create(BattleId1,
                                            20066,
                                            {TMapId, 2044, 1511}),
                            unit_mgr:create(BattleId2,
                                            20066,
                                            {DMapId, 2044, 1511});
                        _ -> ignore
                    end,
                    Dragon = #hero_series{group = 2, map_id = DMapId,
                                          map_pid = DMapPid},
                    Ready = #hero_series_ready{tiger = Tiger,
                                               dragon = Dragon,
                                               series = Series},
                    init_ready_zone(State#state{ready_zones =
                                                    [Ready | ReadyZones]},
                                    T);
                _Err ->
                    logger:error("创建武道准备区失败:~w", [_Err], hero_mgr, 846),
                    false
            end;
        _Err ->
            logger:error("创建武道准备区失败:~w", [_Err], hero_mgr, 850),
            false
    end.

create_zone(State, []) -> {ok, State};
create_zone(State = #state{id = Id, zones = Zones},
            [S = #hero_series_ready{series = Series, tiger = Tiger,
                                    dragon = Dragon}
             | T]) ->
    case check_create_zone([Tiger, Dragon], Series) of
        ok ->
            case hero:start_link(#{id => Id, series => Series}) of
                {ok, Pid} ->
                    Zone = #hero_zone{id = Id, series = Series, pid = Pid,
                                      flag = 1},
                    enter_zone(S, Zone),
                    create_zone(State#state{zones = [Zone | Zones],
                                            id = Id + 1},
                                T);
                False ->
                    logger:error("创建战场失败[Err:~w]", [False], hero_mgr, 867),
                    False
            end;
        {false, Reason} -> {false, Reason}
    end.

check_create_zone([], _) -> ok;
check_create_zone([#hero_series{group = Group,
                                members = []}
                   | _],
                  Series) ->
    SName = case hero_data:get_series(Series) of
                #hero_series_data{name = Name} -> Name;
                _ -> ""
            end,
    {false,
     notice:format(lang:get("~ts 的 ~ts 报名人数不足1人，无法开启战场"),
                   [{string_2, 1, SName},
                    {string_2, 1, group_name(Group)}])};
check_create_zone([_ | T], Series) ->
    check_create_zone(T, Series).

enter_zone(#hero_series_ready{series = Series,
                              tiger = #hero_series{members = Members1},
                              dragon = #hero_series{members = Members2}},
           Zone) ->
    enter_zone(Members1 ++ Members2, Series, Zone).

enter_zone([], _, _Zone) -> ok;
enter_zone([R = #hero_role{pid = Pid, status = 1,
                           group = Group}
            | T],
           Series, Zone = #hero_zone{pid = ZonePid}) ->
    update_data(R#hero_role{series = Series}),
    hero:cast(ZonePid, {enter, Pid, Group}),
    enter_zone(T, Series, Zone);
enter_zone([R | T], Series, Zone) ->
    update_data(R#hero_role{series = Series}),
    enter_zone(T, Series, Zone).

close_ready_zone([]) -> ok;
close_ready_zone([#hero_series_ready{tiger =
                                         #hero_series{map_pid = TMapPid,
                                                      map_id = TMapId},
                                     dragon =
                                         #hero_series{map_pid = DMapPid,
                                                      map_id = DMapId}}
                  | T]) ->
    map:stop(TMapPid),
    map:stop(DMapPid),
    unit_mgr:remove_map_all(TMapId),
    unit_mgr:remove_map_all(DMapId),
    close_ready_zone(T).

lookup(RoleId) ->
    case ets:lookup(hero_role, RoleId) of
        [R] -> R;
        _ -> false
    end.

update_data(Data) -> ets:insert(hero_role, Data).

series_role([], ReadyZones) -> ReadyZones;
series_role([R = #hero_role{series = Series,
                            group = Group}
             | T],
            ReadyZones) ->
    NewReadyZones = case lists:keyfind(Series,
                                       #hero_series_ready.series,
                                       ReadyZones)
                        of
                        S = #hero_series_ready{tiger =
                                                   Data = #hero_series{group =
                                                                           Group,
                                                                       members =
                                                                           Members}} ->
                            NewMembers = [R | Members],
                            NewData = Data#hero_series{members = NewMembers},
                            NS = S#hero_series_ready{tiger = NewData},
                            lists:keyreplace(Series,
                                             #hero_series_ready.series,
                                             ReadyZones,
                                             NS);
                        S = #hero_series_ready{dragon =
                                                   Data = #hero_series{members =
                                                                           Members}} ->
                            NewMembers = [R | Members],
                            NewData = Data#hero_series{members = NewMembers},
                            NS = S#hero_series_ready{dragon = NewData},
                            lists:keyreplace(Series,
                                             #hero_series_ready.series,
                                             ReadyZones,
                                             NS);
                        _ -> ReadyZones
                    end,
    series_role(T, NewReadyZones).

series_merge([], List, []) -> List;
series_merge([H = #hero_series_ready{tiger =
                                         #hero_series{num = Num}}
              | T],
             List, [])
    when Num < 15 ->
    series_merge(T, List, [H]);
series_merge([H = #hero_series_ready{dragon =
                                         #hero_series{num = Num}}
              | T],
             List, [])
    when Num < 15 ->
    series_merge(T, List, [H]);
series_merge([H | T], List, []) ->
    series_merge(T, [H | List], []);
series_merge([H = #hero_series_ready{tiger =
                                         TData = #hero_series{members =
                                                                  TMembers},
                                     dragon =
                                         DData = #hero_series{members =
                                                                  DMembers}}
              | T],
             List,
             [#hero_series_ready{tiger =
                                     #hero_series{members = OTMembers},
                                 dragon =
                                     #hero_series{members = ODMembers}}]) ->
    NewTMembers = TMembers ++ OTMembers,
    NewDMembers = DMembers ++ ODMembers,
    TNum = length(NewTMembers),
    DNum = length(NewDMembers),
    NH = H#hero_series_ready{tiger =
                                 TData#hero_series{members = NewTMembers,
                                                   num = TNum},
                             dragon =
                                 DData#hero_series{members = NewDMembers,
                                                   num = DNum}},
    case TNum >= 15 andalso DNum >= 15 of
        true -> series_merge(T, [NH | List], []);
        _ -> series_merge(T, List, [NH])
    end;
series_merge([], List, [H]) -> [H | List].

set_npc(IdleTime, State) when is_integer(IdleTime) ->
    NState = del_npc(State),
    Now = date:unixtime(),
    Next = Now + IdleTime,
    case date:is_today(Next) of
        false ->
            NpcTime = date:unixtime({zero, Next}),
            Timeout = erlang:max(date:diff(second, NpcTime, Now) +
                                     30,
                                 10),
            Timer = #timer{id = create_npc,
                           timeout = Timeout * 1000},
            server_timer:set(Timer),
            NState;
        _ ->
            case world_lev_limit(State, Now) of
                true -> npc(NState);
                _ -> NState
            end
    end;
set_npc(_IdleTime, State) -> State.

tick(idle, create_npc, State) ->
    case world_lev_limit(State, date:unixtime()) of
        true ->
            State1 = del_npc(State),
            {ok, remove, npc(State1)};
        _ -> remove
    end;
tick(Phase, Msg, _State) ->
    logger:error("阶段[Phase:~w]收到未知的定时消息[Msg:~w]",
                 [Phase, Msg],
                 hero_mgr,
                 999),
    remove.

npc(State) ->
    case unit_mgr:fetch_ids(1) of
        {ok, [Id]} ->
            BattleId = {24, Id},
            case unit_mgr:create(BattleId,
                                 20064,
                                 {10001, 3031, 2313})
                of
                {ok, _} -> State#state{npc_battle_id = BattleId};
                _ -> State
            end;
        _ -> State
    end.

del_npc(State = #state{npc_battle_id = Npc = {_, _}}) ->
    unit_mgr:remove(Npc),
    State#state{npc_battle_id = undefined};
del_npc(State) -> State.

open_msg() ->
    notice:format(lang:get("活动尚未开启，请先做好战前准备！\n活动开启时间：周三~ts，周六~ts"),
                  [{string_2, 4, lang:get("20：00")},
                   {string_2, 4, lang:get("14：30")}]).

world_lev_limit(#state{world_lev = WLev}, Now) ->
    Week = date:day_of_the_week(Now),
    case lists:keyfind(Week, 1, [{3, 60}]) of
        {_, MinWLev} when WLev >= MinWLev -> true;
        {_, _} -> false;
        _ -> true
    end.

continue(StateName,
         #state{timeout = undefined} = State) ->
    {next_state, StateName, State, infinity};
continue(StateName,
         State = #state{ts = Ts, timeout = Tidle}) ->
    {next_state,
     StateName,
     State,
     util:time_left(Tidle, Ts)}.

continue(StateName, Reply,
         #state{timeout = undefined} = State) ->
    {reply, Reply, StateName, State, infinity};
continue(StateName, Reply,
         State = #state{ts = Ts, timeout = Tidle}) ->
    {reply,
     Reply,
     StateName,
     State,
     util:time_left(Tidle, Ts)}.

