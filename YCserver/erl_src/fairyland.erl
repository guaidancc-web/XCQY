-file("src/mod/fairyland/fairyland.erl", 1).

-module(fairyland).

-behaviour(gen_fsm).

-export([start_link/0,
         init/0,
         login/1,
         logout/1,
         join/1,
         join_to_follow/1,
         quit/1,
         teleport/2,
         role_callback/2,
         role_callback/4,
         evt_callback/2,
         check_gain/3,
         check_gain/4,
         check_pick/2,
         combat_check/2,
         combat_over/1,
         pick_gain/2,
         use_item/2,
         raffle_boss_reward/2,
         update_roll_counter/1,
         reset_roll_counter/1,
         update_roll_crystal/2,
         check_crystall_val/2,
         info/1,
         push/2,
         gm/2,
         reload/0]).

-export([init/1,
         handle_event/3,
         handle_sync_event/4,
         handle_info/3,
         terminate/3,
         code_change/4]).

-export([idle/2, notice/2, active/2]).

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

-file("src/mod/fairyland/fairyland.erl", 44).

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

-file("src/mod/fairyland/fairyland.erl", 45).

-file("inc/fairyland.hrl", 1).

-record(m_fairyland,
        {ver = 0,
         keys = [],
         forward_envoys = [],
         floor = 0 :: integer(),
         last_joined = 0 :: integer(),
         triggers = [],
         exp = 0 :: non_neg_integer(),
         boss_prizes = []}).

-record(fairyland_floor,
        {id = 0 :: integer(),
         forward_envoy = 0 :: integer(),
         map_id = 0 :: integer(),
         map_pid :: undefined | pid(),
         map_base_id = 0 :: integer()}).

-record(fairyland_role,
        {id = {0, "", 0} :: tuple(),
         name = "" :: string(),
         joined = 0 :: integer(),
         pid :: undefined | pid(),
         forward_envoys = [],
         box_boss_rewarded = 0 :: non_neg_integer(),
         exp = 0 :: non_neg_integer()}).

-file("src/mod/fairyland/fairyland.erl", 46).

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

-file("src/mod/fairyland/fairyland.erl", 47).

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

-file("src/mod/fairyland/fairyland.erl", 48).

-file("inc/combat.hrl", 1).

-record(combat,
        {type :: undefined | non_neg_integer(),
         pid :: undefined | pid(),
         result :: undefined | integer(),
         round = 1 :: non_neg_integer(),
         start_args :: undefined | tuple(),
         observers = [],
         winner = [],
         loser = [],
         atk_formation = 1,
         atk_formation_lev = 1,
         dfd_formation = 1,
         dfd_formation_lev = 1,
         waiting_join = [],
         cur_plot = 0,
         waiting_next_wave = [] :: [tuple()],
         all_waiting_next_wave = [],
         ts,
         start_time = 0 :: non_neg_integer(),
         t_play = 0 :: integer(),
         t_idle = 500 :: integer(),
         assign_gains = [],
         ratio_val = 0,
         start_failed_reason :: undefined | atom()}).

-record(fighter,
        {id = 0 :: non_neg_integer(),
         pid = 0 :: non_neg_integer() | pid(),
         type = 1,
         name = "",
         group = 0,
         classes = 0,
         sex = 0,
         face_id = 0,
         hp = 0,
         mp = 0,
         hp_max = 0,
         tmp_hp_max = 0,
         mp_max = 0,
         lev = 0,
         looks = [],
         is_die = 0,
         is_die_disappear = 0,
         is_escape = 0,
         is_defence = 0,
         is_radiance = 0,
         is_leader = 0,
         self_preside_status = 0,
         self_preside_text = "",
         target_preside_status = 0,
         target_preside_text = "",
         rid = 0,
         platform = "",
         zone_id = 0,
         origin_id,
         base_id = 0 :: non_neg_integer(),
         lover,
         res_id = 0,
         active_skills = [],
         passive_skills = [],
         halo_skills = [],
         has_use_item = 0,
         buffs = [],
         buff_infos = [],
         skill_cooldown = [],
         skill_infos = [],
         pet_skill_infos = [],
         child_skill_infos = [],
         last_skill = 0,
         attr,
         combat_init_attr,
         combat_dynamic_attr,
         pet_attr,
         m_init,
         action_num = 0,
         formation = 1,
         formation_lev = 1,
         pos = 0,
         order = 0,
         combat_statistics,
         result = 3,
         is_ai_action = 0,
         pre_action,
         action,
         talk = "",
         special_status,
         special_attr,
         s_event = 0,
         s_event_pid,
         active_pet,
         backup_pets = [],
         active_child,
         backup_childs = [],
         has_summon_pet = 0,
         active_guard = [],
         team_guard = [],
         is_hosted = 0,
         is_ready = 0,
         is_auto = 0,
         is_double_point = 0,
         plot = {id, [], []},
         max_catch_num = 0,
         catched = [],
         learn_skills = [],
         m_dungeon,
         anti_heal = 0,
         anger = 0,
         skill_prac_atk = 0,
         skill_prac_phy_def = 0,
         skill_prac_magic_def = 0,
         m_lev_break,
         sworn_id,
         dun_args,
         ext_args = [],
         talisman = [],
         master_pid = 0,
         master_fid = 0,
         master_pos = 0,
         combat_talk = [],
         guard_pid = 0,
         guard_fid = 0,
         guard_pos = 0,
         cost_mp_ratio = 1000,
         slave = [],
         unit_type = 0,
         ratio_val = 0,
         unit_fun_type = 0,
         ai_id = 0,
         ai = {[], []},
         ext = [],
         skill_plan = [],
         hook_index = 1,
         force_is_auto = 0}).

-record(combat_start_args,
        {common_referee :: undefined | pid(),
         other_referees = [] :: [{atom(), pid()}],
         ext_args = [] :: [{atom(), term()}],
         max_guard = 4}).

-record(combat_over_calc_data,
        {fighter :: undefined | tuple(),
         combat_result :: undefined | non_neg_integer(),
         rewards = [] :: [tuple()],
         record :: undefined | tuple()}).

-record(c_observer,
        {role_id = {0, "", 0} ::
             {non_neg_integer(), list(), non_neg_integer()},
         pid :: undefined | pid(),
         name = "" :: list(),
         group = 0}).

-record(m_combat,
        {ver = 3 :: pos_integer(),
         pid :: undefined | pid(),
         observe_pid :: undefined | pid(),
         is_debug = 0 :: 0..1,
         ext = [] :: [tuple()],
         self_preside = [],
         target_preside = [],
         combat_type = 0}).

-record(m_combat_init,
        {skills = [] ::
             [{non_neg_integer(), non_neg_integer()}],
         talents = [],
         wing_skills = [],
         eff_skills = [],
         guard_skills = []}).

-record(fighter_wrap,
        {fighter,
         combat_pid = 0,
         s_event,
         m_team,
         status,
         s_action,
         pos :: undefined | tuple(),
         combat_type = 0}).

-record(c_item,
        {item_id,
         base_id :: undefined | non_neg_integer(),
         step = 0,
         target_type :: undefined | non_neg_integer(),
         skill_id = 0,
         skill_lev = 0,
         script_id :: undefined | non_neg_integer(),
         script_args = [] :: [integer()],
         buff_self = [],
         buff_target = [],
         anti_heal = 0,
         can_effect = 0,
         action :: undefined | function()}).

-record(c_skill,
        {id = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         passive_type = [] :: non_neg_integer(),
         act_flag = undefined,
         type_flag = undefined,
         use_type = {live, live},
         special_type = [],
         skill :: undefined | tuple(),
         action_no = 1 :: non_neg_integer(),
         target_no = 1 :: non_neg_integer(),
         keep_kill_num = 0 :: non_neg_integer(),
         action :: undefined | {atom(), list()},
         ext_args = [] :: [{atom(), non_neg_integer()}],
         trigger_before = [] ::
             [{{atom(), atom()}, [integer()]}],
         trigger_after = [] :: [{{atom(), atom()}, [integer()]}],
         reduce_dmg = 1000,
         reduce_heal = 1000,
         action_msg = "",
         pursue_attack = 0,
         pursue_skill_attack = 0,
         passive_args,
         variety_base}).

-record(c_buff_base,
        {id,
         eff_type = buff :: buff | debuff,
         type = 1,
         max_layer = 1,
         script_id = 0}).

-record(c_buff,
        {id :: undefined | non_neg_integer(),
         type,
         sec_type,
         layer = 1,
         script_id,
         caster_id :: undefined | non_neg_integer(),
         action_num = 0 :: non_neg_integer(),
         eff_type = buff :: buff | debuff,
         eff_sec_type = normal :: normal | control,
         hit_rate = 1000 :: non_neg_integer(),
         can_dispel = 1 :: 0..1,
         visible = 1 :: 0..1,
         time_unit = 0 :: non_neg_integer(),
         duration = 0 :: non_neg_integer(),
         duration_left = 0 :: non_neg_integer(),
         period = 1 :: non_neg_integer(),
         args = [],
         eff_val_before :: undefined | function(),
         eff_val_after :: undefined | function(),
         eff_before :: undefined | function(),
         eff :: undefined | function(),
         recalc :: undefined | function(),
         eff_after :: undefined | function(),
         compare :: undefined | function(),
         tips_calc :: undefined | function(),
         hit :: undefined | function(),
         can_eff :: undefined | function(),
         die_eff = 0,
         halo_eff_fighter_type = [] :: list()}).

-record(combat_statistics,
        {total_hurt = 0 :: non_neg_integer(),
         total_dmg = 0 :: non_neg_integer(),
         round_dmg = 0 :: non_neg_integer(),
         max_dmg = 0 :: non_neg_integer(),
         revive = 0,
         pet_revive = 0,
         cast_pet = 0,
         guard = [],
         has_use_item = 0,
         total_heal = 0,
         control_num = 0,
         dispel_num = 0,
         is_die = 0,
         kill_group = 0,
         killed_group = 0,
         kill_group_pet = 0,
         kill_group_target = 0,
         killed_group_target = 0,
         kill_group_target_pet = 0,
         child_skills = [],
         die_times = 0,
         skill_use_times = [],
         after_die_done = 0,
         auto_round = []}).

-record(combat_context,
        {type :: undefined | non_neg_integer(),
         start_time = 0 :: integer(),
         round = 0,
         pos_num = 0 :: integer(),
         origin_atk = [],
         origin_dfd = [],
         playing = [],
         self_side = [],
         op_side = [],
         skill_cooldown = [],
         all_waiting_next_wave = [] :: [list()],
         passive_attack = [] :: [],
         passive_skill_attack = [],
         pursue_attack = false,
         pursue_skill_attack = false,
         pursue_attack_list = [],
         revive_self = [],
         nirvana_list = [],
         ghost_list = [],
         revive_list = [],
         kill_by_self_list = [],
         avatar_list = [],
         mate_suck_list = [],
         skill_hurt = false :: true | false,
         skill_pursue_crit = false :: true | false,
         kill_someone = false :: true | false,
         skill_crit = false :: true | false,
         skill_dmg = 0,
         action_dmg = 0,
         multi_pursue_num = 0,
         link_hurt = [],
         is_passive_attack = false,
         revive_count = 0,
         is_skill_range = false,
         fisrt_target_id = 0,
         round_die = [],
         common_cooldown = []}).

-record(passive_effect,
        {atk_addt = 0 :: non_neg_integer(),
         atk_ratio = 0 :: non_neg_integer(),
         atk_holy_addt = 0 :: non_neg_integer(),
         buff_holy_addt = 0,
         atk_holy_ratio = 0 :: non_neg_integer(),
         dmg_addt = 0 :: non_neg_integer(),
         phy_dmg_dec = 0,
         magic_dmg_dec = 0,
         dmg_ext = 0,
         dmg_ratio = 0 :: non_neg_integer(),
         dmg_ratio_add = 0,
         def_ratio = 0 :: non_neg_integer(),
         hurt_multi = 0,
         suck_hp = 0,
         kill_suck_hp = 0,
         stone_suck_hp,
         suck_mp = 0,
         suck_mp_loss = 0,
         suck_mp_max = 0,
         master_suck_hp,
         feedback = 0,
         heal_ratio = 0,
         anti_skill,
         def_anti = 0,
         crit_ratio = 0,
         hit_ratio = 0,
         dec_def_ratio = 0,
         dec_phy_def = 0,
         dec_magic_def = 0,
         dec_phy_def_ratio = 0,
         dec_magic_def_ratio = 0,
         float_dmg = 0,
         ghost_atk = 0,
         phy_dmg_ratio = 0,
         defence = 0,
         magic_dmg_ratio = 0,
         revive_self_atk = 0,
         dec_dmg_flag = 0,
         self_val_changed = [],
         self_changed = [],
         target_val_changed = [],
         target_changed = [],
         buff_self_to_self = [] :: [tuple()],
         buff_self_to_target = [] :: [tuple()],
         buff_target_to_self = [] :: [tuple()],
         buff_target_to_target = [] :: [tuple()],
         del_target_buff = [],
         show_passive_skills = [] ::
             [{non_neg_integer(),
               non_neg_integer(),
               non_neg_integer()}],
         talents = [],
         pet_effect = [],
         conflict_list = [],
         ext_args = [],
         flag = 0,
         injury_ratio = 0,
         tar_ignore_die_ratio = 0,
         target_def_add_buff = [],
         phy_crit_extra_dmg = 0,
         mag_crit_extra_dmg = 0}).

-record(combat_init_attr,
        {dmg_ratio = 0,
         hurt_ratio = 0,
         magic_hurt_ratio = 0,
         crit_dmg_ratio = 0,
         crit_hurt_ratio = 0,
         heal_ratio = 0 :: non_neg_integer(),
         eff_heal_ratio = 0 :: non_neg_integer(),
         item_effect_ratio = 0,
         eff_item_effect_ratio = 0,
         can_be_crit = 1,
         anti_poison = 0,
         phy_dmg_ratio = 0,
         magic_dmg_ratio = 0,
         def_anger_ratio = 0,
         use_anger_ratio = 1000,
         debuff_buff_expire_ratio = {0, 0, 0},
         dec_ghost_ratio = 0,
         heal_crit_ratio = 0,
         eff_revive_ratio = 0,
         eff_heal_val = 0,
         add_chaos_ratio = 0,
         sworn_protect,
         anti_crit_ratio = 0,
         atk_not_anger = 0,
         hit_ratio = 0,
         phy_crit_extra_dmg = 0,
         mag_crit_extra_dmg = 0}).

-record(combat_dynamic_attr,
        {dmg_ratio = 0,
         hurt_ratio = 0,
         phy_hurt_ratio = 0,
         magic_hurt_ratio = 0,
         phy_final_hurt_ratio = 0,
         magic_final_hurt_ratio = 0,
         crit_dmg_ratio = 0,
         crit_hurt_ratio = 0,
         buff_reduce_dmg = 0,
         heal_ratio = 0 :: non_neg_integer(),
         eff_heal_ratio = 0 :: non_neg_integer(),
         eff_heal_val = 0,
         feedback = 0,
         reduce_dmg = 0,
         stone_reduce_dmg = 0,
         accuracy = 0,
         phy_accuracy = 0,
         magic_accuracy = 0,
         evasion = 0,
         phy_evasion = 0,
         magic_evasion = 0,
         phy_dmg_ratio = 0,
         magic_dmg_ratio = 0,
         can_attack_stealth = 0,
         buff_reduce_dmg_max = 0,
         mirror_feedback_rate = 0}).

-record(special_attr,
        {absorb_shield = 0,
         absorb_shield_type = 0,
         absorb_order = 0,
         absorb_shield_suck = 0,
         absorb_dmg = 0,
         magic_absorb_dmg = 0,
         model_order = 0,
         immunity = 0,
         has_immunity = 0,
         pre_action,
         next_action_stay = 0,
         reduce_self_phy_dmg = 0,
         reduce_phy_dmg = 0,
         anti_control_ratio = 0,
         can_feedback = 1,
         fixed_feedback = 0,
         can_anti_attack = 1,
         can_revive_self = 1,
         model_id = 0,
         model_val = 0,
         fixed_dmg = 0,
         anti_ratio = 0,
         anti_times = 0,
         anti_skill = base,
         anti_dmg_ratio = 0,
         protector = undefined,
         has_nirvana = 0,
         nirvaning = 0,
         has_ghost = 0,
         ghosting = 0,
         reviving = 0,
         has_revive_self = 0,
         anti_trial = 0,
         can_attack_stealth = 0,
         control_num = 0,
         has_fearless = 0,
         add_phy_layer = 0,
         last_dispel_phy_dmg_ratio = 0,
         last_eva_phy_dmg_ratio = 0,
         round_add_magic_dmg = 0,
         sleep_layer = 0,
         stone_layer = 0,
         is_sworn_protect = 0,
         is_sworn_heal = 0,
         chaos_ratio = 300,
         round_hurt = 0,
         dec_dmg,
         multi_atk_num = 0,
         has_multi_atk = 0,
         assist_atk_ratio = 0,
         assist_atk_skill = base,
         assist_atk_hurt_ratio = 1000,
         suck_hp = 0,
         suck_times = 1,
         rebound_times = 0,
         rebound_dmg_ratio = 0,
         trap_owener = 0,
         trap_buff = [],
         trap_ratio = 0,
         be_dmg_mp_times = 0,
         flush_pet_times = 0,
         save_life_times = 0,
         elem_dmg_absorb = 0,
         wheel_dmg = 0,
         wheel_skill = 0,
         be_attack_times = undefined,
         first_target_id = 0,
         rebound_type = 1,
         iron_body_times = 0,
         hp_link = 0}).

-record(special_status,
        {is_weakness = 0,
         is_seal = 0,
         is_silent = 0 :: 0..1,
         is_rest = 0,
         is_stealth = 0,
         cannot_use_skill = 0,
         is_taunt = 0 :: 0..1,
         is_chaos = 0,
         chaos_skill = 0,
         is_stun = 0,
         is_sleep = 0,
         is_stone = 0,
         is_anti_heal = 0,
         can_crit = 1,
         cannot_revive = 0,
         taunt_pid = undefined,
         soul_link = undefined,
         buff_revive_self = undefined,
         lover_revive_self = undefined,
         dec_taunt_dmg_ratio = 0,
         can_use_anger_skill = 1,
         bleed = 0,
         energy = 0,
         modify_script = [],
         is_tempt = 0,
         tempt_ratio = 0,
         tempt_dmg = 0,
         be_attack_skills = []}).

-record(buff_play,
        {order = 0 :: non_neg_integer(),
         sub_order = 0 :: non_neg_integer(),
         action_type :: undefined | non_neg_integer(),
         buff_id :: undefined | non_neg_integer(),
         layer = 1 :: pos_integer(),
         time_unit = 1 :: non_neg_integer(),
         duration = 0 :: non_neg_integer(),
         duration_left = 0 :: non_neg_integer(),
         is_hit = 1 :: 0..1,
         can_dispel = 1 :: 0..1,
         caster_id = 0 :: non_neg_integer(),
         target_id = 0 :: non_neg_integer(),
         skill_fid = 0 :: non_neg_integer(),
         target_changes = [] :: [{non_neg_integer(), integer()}],
         is_target_die = 0 :: 0..1,
         is_target_die_disappear = 0 :: 0..1,
         tips_args = [] :: [integer()]}).

-record(summon_play,
        {order = 0 :: non_neg_integer(),
         sub_order = 0 :: non_neg_integer(),
         summon_type :: undefined | non_neg_integer(),
         summoner_id :: undefined | non_neg_integer(),
         summons = [] :: [tuple()]}).

-record(skill_play,
        {order = 0 :: non_neg_integer(),
         sub_order = 0 :: non_neg_integer(),
         action_type :: undefined | non_neg_integer(),
         skill_id = 0 :: non_neg_integer(),
         skill_lev = 1 :: non_neg_integer(),
         attack_type :: undefined | non_neg_integer(),
         self_id = 0 :: non_neg_integer(),
         self_type = 0,
         self_classes = 0,
         self_origin_id = 0,
         self_res_id = 0,
         target_id = 0 :: non_neg_integer(),
         self_changes = [] :: [{non_neg_integer(), integer()}],
         target_changes = [] :: [{non_neg_integer(), integer()}],
         show_passive_skills = [] ::
             [{non_neg_integer(),
               non_neg_integer(),
               non_neg_integer()}],
         is_hit = 1 :: 0..1,
         is_defence = 0 :: 0..1,
         is_crit = 0 :: 0..1,
         is_self_die = 0 :: 0..1,
         is_self_die_disappear = 0 :: 0..1,
         is_target_die = 0 :: 0..1,
         is_target_die_disappear = 0 :: 0..1,
         talk = "" :: list(),
         action_msg = ""}).

-record(c_pet,
        {id = 0,
         ver = 6,
         base_id = 0,
         can_summon = 1,
         status = 0,
         name = "",
         lev = 0,
         looks = [],
         skills = [],
         hp = 1,
         mp = 1,
         attr,
         combat_talk = [],
         talent = 0,
         pet_attr,
         grade = 0,
         skill_plan = [],
         is_first = 0}).

-record(c_guard,
        {base_id = 0,
         war_id = 0,
         name = "",
         classes = 0,
         skills = [],
         attr,
         looks = []}).

-record(c_child,
        {id = 0,
         origin_id,
         ver = 1,
         base_id = 0,
         grade = 0,
         status = 0,
         can_summon = 1,
         name = "",
         classes = 0,
         lev = 0,
         looks = [],
         skills = [],
         hp = 1,
         mp = 1,
         attr,
         combat_talk = [],
         hungry = 0}).

-record(c_skill_addt_arg,
        {self_val_changed = [] :: [{atom(), integer()}],
         self_changed = [] :: [{non_neg_integer(), integer()}],
         target_val_changed = [] :: [{atom(), integer()}],
         target_changed = [] :: [{non_neg_integer(), integer()}],
         self_buff = [] :: [tuple()],
         target_buff = [] :: [tuple()],
         show_passive_skills = [] :: [tuple()],
         ext_args,
         skip_exec = 0,
         passive_flag,
         conflict_list = []}).

-record(action_effect,
        {can_crit = 1,
         can_feedback = 1,
         can_protect = 1,
         heal_hp = 0,
         can_anti_heal = 0,
         crit_flag = 0,
         holy_addt = 0,
         suck_hp = 0,
         mate_suck_hp = undefined,
         dec_def_ratio = 0,
         dec_magic_def_ratio = 0,
         default_atk = undefined,
         direct_dmg = undefined,
         calc_def = 0,
         hurt_multi = 1000,
         act_dmg = 0,
         hit_ratio = 0,
         crit_ratio = 0,
         crit_dmg_ratio = 0,
         act_dmg_ratio = 0,
         target_val_changes = [],
         target_changes = [],
         suck_buff,
         crit_suck_hp = 0,
         dmg_buff = [],
         injury_ratio = 0,
         extern_dmg = 0,
         act_hurt_multi = 0,
         alice_suck_max = 0}).

-record(combat_record_chat_mgr,
        {id = {0, "", 0},
         name = "",
         classes = 0,
         sex = 0,
         lev = 0,
         break_times = 0,
         msg = "",
         report_cnt = 0}).

-record(combat_record,
        {id,
         type = 1,
         ver = 10,
         atk_name = "",
         dfd_name = "",
         combat_type = 0,
         time = 0,
         frames = [],
         cited = 0,
         likes = [],
         liked = 0,
         replayed = 0,
         round = 0,
         fighters = [],
         avg_lev = 0,
         shared = 0,
         atk_sex = 0,
         atk_classes = 0,
         dfd_sex = 0,
         dfd_classes = 0,
         screen_msg = []}).

-record(combat_record_role,
        {id = {0, "", 0}, recent = [], collection = []}).

-record(combat_record_marvelous,
        {id, combat_type = 0, time = 0}).

-record(combat_record_hot,
        {id,
         combat_type = 0,
         replayed = 0,
         shared = 0,
         liked = 0,
         time = 0}).

-record(combat_record_fighter,
        {id = {0, "", 0},
         name = "",
         classes = 0,
         sex = 0,
         lev = 0,
         group = 0}).

-file("src/mod/fairyland/fairyland.erl", 49).

-file("inc/gain.hrl", 1).

-record(gain,
        {label :: undefined | atom(),
         val :: undefined | term(),
         msg = "" :: list(),
         source = 0 :: non_neg_integer(),
         notice_msg = "" :: list(),
         reason :: undefined | atom(),
         ext = 0 :: term(),
         notice = 0 :: 0..1,
         ext_val = 0}).

-record(loss,
        {label :: undefined | atom(),
         val :: undefined | term(),
         msg = "" :: list(),
         notice_msg = "" :: list(),
         source = 0 :: non_neg_integer(),
         reason :: undefined | atom(),
         ext = 0 :: term(),
         ext_val = 0,
         auto_scene = "" :: list()}).

-record(gain_text_opts,
        {order = loss :: gain | loss,
         gain_tag = "" :: string(),
         loss_tag = "" :: string(),
         split_str = "，" :: string(),
         split_op_str = "，" :: string(),
         merge_type = [] :: list(),
         fly_to_bag = 0 :: non_neg_integer()}).

-file("src/mod/fairyland/fairyland.erl", 50).

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

-file("src/mod/fairyland/fairyland.erl", 51).

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

-file("src/mod/fairyland/fairyland.erl", 52).

-file("inc/trigger.hrl", 1).

-record(trigger,
        {id = 1 :: pos_integer(),
         label :: undefined | atom(),
         m :: undefined | atom(),
         f :: undefined | function() | atom(),
         a = [] :: list()}).

-record(evt_enter_map,
        {id = 1 :: pos_integer(),
         base_id = 1 :: pos_integer(),
         x = 0 :: non_neg_integer(),
         y = 0 :: non_neg_integer()}).

-record(evt_ico, {id = 0 :: non_neg_integer()}).

-record(evt_close_guide, {id = 0 :: pos_integer()}).

-record(evt_guild, {}).

-record(evt_guild_leave, {val = 0}).

-record(evt_guild_war, {}).

-record(evt_battle_plot,
        {plot_id = 1 :: pos_integer(),
         role_id = {1, "", 0} ::
             {pos_integer(), bitstring(), non_neg_integer()},
         role_name = "" :: bitstring(),
         role_pid :: undefined | pid()}).

-record(evt_plot,
        {id = 1 :: pos_integer(), type = 1 :: pos_integer()}).

-record(evt_shop_buy,
        {assets_type = 0 :: non_neg_integer(),
         val = 0 :: non_neg_integer(),
         base_id = 0 :: non_neg_integer(),
         bind = 0 :: 0..1,
         num = 0 :: non_neg_integer()}).

-record(evt_store_buy, {s_items = []}).

-record(evt_enchant,
        {base_id = 1 :: pos_integer(),
         pre_lev = 1 :: pos_integer(),
         lev = 1 :: pos_integer(),
         type = 0 :: non_neg_integer(),
         pos = 0 :: non_neg_integer(),
         quality = 0 :: non_neg_integer()}).

-record(evt_select, {type = 0 :: non_neg_integer()}).

-record(evt_guild_lev, {}).

-record(evt_skill_up, {id = 0, lev = 0}).

-record(evt_skill_unique_up, {id = 0, lev = 0}).

-record(evt_quest_treasure, {}).

-record(evt_fc,
        {val :: undefined | pos_integer(),
         now_val = 0 :: non_neg_integer()}).

-record(evt_wedding_score, {}).

-record(evt_wedding_req_agreed, {}).

-record(evt_wedding_marry, {}).

-record(evt_wedding_divorce, {}).

-record(evt_guard, {base_id = 0, num = 0}).

-record(evt_leave_map,
        {id = 1 :: pos_integer(),
         base_id = 1 :: pos_integer(),
         x = 0 :: non_neg_integer(),
         y = 0 :: non_neg_integer()}).

-record(evt_move_map,
        {base_id = 1 :: non_neg_integer(),
         x = 0 :: non_neg_integer(),
         y = 0 :: non_neg_integer()}).

-record(evt_dungeon_enter,
        {id = 0 :: non_neg_integer()}).

-record(evt_dungeon_exit,
        {id = 0 :: non_neg_integer()}).

-record(evt_dungeon_pass,
        {id = 0 :: non_neg_integer()}).

-record(evt_dungeon_kill_unit,
        {dun_id = 0, unit_id = 0}).

-record(evt_dungeon_unit_reward,
        {id = 0 :: non_neg_integer()}).

-record(evt_get_item,
        {base_id = 1 :: pos_integer(),
         num = 1 :: pos_integer()}).

-record(evt_use_item,
        {base_id :: undefined | pos_integer(),
         num = 0 :: pos_integer()}).

-record(evt_use_item_type,
        {type = 0 :: non_neg_integer()}).

-record(evt_del_item,
        {base_id :: undefined | pos_integer(),
         num = 0 :: pos_integer()}).

-record(evt_gain_coin,
        {val = 1 :: pos_integer(),
         source :: undefined | atom()}).

-record(evt_have_coin, {val = 1 :: pos_integer()}).

-record(evt_loss_coin,
        {val = 1 :: pos_integer(),
         reason :: undefined | atom()}).

-record(evt_gain_gold,
        {val = 1 :: pos_integer(),
         source :: undefined | atom()}).

-record(evt_loss_gold,
        {val = 1 :: pos_integer(),
         reason :: undefined | atom()}).

-record(evt_loss_gold_bind, {val = 1 :: pos_integer()}).

-record(evt_levup,
        {old_lev = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer()}).

-record(evt_logout, {}).

-record(evt_tower, {floor = 0, unit_id = 0}).

-record(evt_tower_floor, {floor = 0}).

-record(evt_glory, {lev_id = 0}).

-record(evt_reset_eqm, {type = 0}).

-record(evt_cli_loaded, {mod = 0 :: non_neg_integer()}).

-record(evt_eqm, {type = 0}).

-record(evt_pet_war, {base_id = 0}).

-record(evt_pet_skill, {base_id = 0}).

-record(evt_pet_rest, {base_id = 0}).

-record(evt_select_pet, {}).

-record(evt_get_pet,
        {base_id = 0,
         genre = 0,
         lev = 0,
         status = 0,
         is_catched = false,
         talent = 0}).

-record(evt_del_pet, {base_id = 0, num = 0}).

-record(evt_levup_pet,
        {pet_id = 0, base_id = 0, lev = 0}).

-record(evt_aptitude_pet, {base_id = 0, genre = 0}).

-record(evt_pick_flower, {id}).

-record(evt_send_flower,
        {num = 0, val = 0, base_id = 0, recv_id, items = []}).

-record(evt_recv_flower, {num = 0, val = 0, send_id}).

-record(evt_accept_quest, {id = 0 :: pos_integer()}).

-record(evt_commit_quest,
        {id = 0 :: pos_integer(), sec_type = 0}).

-record(evt_finish_quest, {id = 0 :: pos_integer()}).

-record(evt_quest_guild_round, {}).

-record(evt_commit_quest_chain,
        {id = 0 :: pos_integer(), type = 0}).

-record(evt_giveup_quest, {id = 0 :: pos_integer()}).

-record(evt_quest_del, {id = 0 :: pos_integer()}).

-record(evt_map_role_enter,
        {id = 0 :: non_neg_integer(),
         platform = <<>> :: bitstring(),
         zone_id = 0 :: non_neg_integer(),
         map_id = 1 :: pos_integer(),
         map_base_id = 1 :: pos_integer(),
         x = 0 :: non_neg_integer(),
         y = 0 :: non_neg_integer()}).

-record(evt_map_role_move,
        {role_id = {0, "", 0},
         role_pid = 0 :: non_neg_integer() | pid(),
         map_id = 1 :: pos_integer(),
         map_base_id = 1 :: pos_integer(),
         sx = 0 :: non_neg_integer(),
         sy = 0 :: non_neg_integer(),
         dx = 0 :: non_neg_integer(),
         dy = 0 :: non_neg_integer(),
         event = 0 :: non_neg_integer()}).

-record(evt_map_role_leave,
        {role_pid = 0 :: non_neg_integer() | pid(),
         map_id = 1 :: pos_integer(),
         map_base_id = 1 :: pos_integer()}).

-record(evt_combat_round,
        {round :: undefined | pos_integer(),
         self = [] :: [tuple()],
         opp = [] :: [tuple()]}).

-record(evt_combat_init,
        {self = [] :: [tuple()], opp = [] :: [tuple()]}).

-record(evt_kill_npc,
        {id = 0 :: non_neg_integer(),
         base_id = 1 :: pos_integer(),
         origin_id = {1, 1} :: tuple(),
         ratio_val = 0,
         num = 1 :: pos_integer()}).

-record(evt_kill_npc_lose,
        {id = 0 :: non_neg_integer(),
         base_id = 1 :: pos_integer(),
         num = 1 :: pos_integer()}).

-record(evt_kill_role_clone,
        {id = {0, "robot", 0}, ratio_val = 0}).

-record(evt_fight_unit,
        {id = 0 :: non_neg_integer(),
         base_id = 1 :: pos_integer(),
         num = 1 :: pos_integer()}).

-record(evt_mount_combat,
        {combat_type = 0 :: non_neg_integer(),
         is_win = 0 :: non_neg_integer()}).

-record(evt_unit_click,
        {id = 0 :: non_neg_integer(),
         role_id = {0, "", 0},
         name = "",
         pid,
         type = 0 :: non_neg_integer(),
         base_id = 0 :: non_neg_integer(),
         do_type = -1 :: integer()}).

-record(evt_online_time, {acc_time = 0, add_val = 0}).

-record(evt_battle_role_enter,
        {id = 0 :: non_neg_integer(),
         platform = "" :: bitstring(),
         zone_id = 0 :: non_neg_integer(),
         pid :: undefined | pid(),
         conn_pid :: undefined | pid(),
         name = "" :: bitstring(),
         dun_id = 0 :: non_neg_integer(),
         last_pos = {0, 0, 0} ::
             {non_neg_integer(),
              non_neg_integer(),
              non_neg_integer()},
         enter_pos = {0, 0, 0} ::
             {non_neg_integer(),
              non_neg_integer(),
              non_neg_integer()},
         dun_role :: undefined | tuple()}).

-record(evt_battle_enter_map,
        {id = {0, "", 0} ::
             {non_neg_integer(), bitstring(), non_neg_integer()},
         name = "" :: bitstring(),
         pid :: undefined | pid(),
         map_base_id = 0 :: non_neg_integer()}).

-record(evt_battle_role_login,
        {id = 0 :: non_neg_integer(),
         platform = "" :: bitstring(),
         zone_id = 0 :: non_neg_integer(),
         pid :: undefined | pid(),
         conn_pid :: undefined | pid(),
         name = "" :: bitstring(),
         last_pos = {0, 0, 0} ::
             {non_neg_integer(),
              non_neg_integer(),
              non_neg_integer()},
         enter_pos = {0, 0, 0} ::
             {non_neg_integer(),
              non_neg_integer(),
              non_neg_integer()}}).

-record(evt_battle_role_exit,
        {id = 0 :: non_neg_integer(),
         platform = "" :: bitstring(),
         zone_id = 0 :: non_neg_integer(),
         name = "" :: bitstring()}).

-record(evt_battle_role_logout,
        {id = 0 :: non_neg_integer(),
         platform = "" :: bitstring(),
         zone_id = 0 :: non_neg_integer(),
         name = "" :: bitstring(),
         ext_id = 0 :: non_neg_integer()}).

-record(evt_battle_unit_killed,
        {unit_id = {1, 1} :: {pos_integer(), pos_integer()},
         base_id = 1 :: pos_integer(),
         type = 1 :: pos_integer(),
         role_list = [] ::
             [{role_id(), list(), undefined | pid()}]}).

-record(evt_battle_unit_picked,
        {unit_id = {1, 1} :: {pos_integer(), pos_integer()},
         base_id = 1 :: pos_integer(),
         type = 102 :: pos_integer(),
         action_type = 1 :: pos_integer(),
         map_base_id = 1,
         x = 1,
         y = 1,
         role_id = {1, "", 0},
         role_name = "",
         role_pid}).

-record(evt_battle_unit_die,
        {unit_id = {1, 1} :: {pos_integer(), pos_integer()},
         base_id = 1 :: pos_integer(),
         type = 1 :: pos_integer()}).

-record(evt_create_unit,
        {unit_id = {1, 1}, base_id = 1, type = 1}).

-record(evt_team_join, {pid :: undefined | pid()}).

-record(evt_team_leave, {}).

-record(evt_team_away, {}).

-record(evt_team_follow, {}).

-record(evt_team_appoint, {status, leader_id}).

-record(evt_arena_fight, {}).

-record(evt_arena_win, {cup = 0}).

-record(evt_trial, {mode = 0}).

-record(evt_escort, {}).

-record(evt_friend, {num = 0}).

-record(evt_fairyland, {}).

-record(evt_fairyland_floor,
        {floor = 0, is_leader = 0}).

-record(evt_fairyland_box, {box_punish = 0}).

-record(evt_pet, {}).

-record(evt_pet_lev, {old_lev = 0, lev = 0}).

-record(evt_quest_offer_ring, {ring = 0, old_ring = 0}).

-record(evt_quest_offer_reward, {}).

-record(evt_qualifying_combat, {type = 0}).

-record(evt_qualifying_combat_over,
        {type = 0, win_flag = 0}).

-record(evt_guild_answer, {}).

-record(evt_parade, {}).

-record(evt_market_silver_first_on_sale, {}).

-record(evt_market_gold_bind_buy,
        {base_id = 0,
         num = 0,
         init_price = 0,
         price = 0,
         margin = 0}).

-record(evt_market_gold_bind_sold,
        {base_id = 0, price = 0}).

-record(evt_kill_guild_robber, {}).

-record(evt_shipping_sail, {type = 0}).

-record(evt_shipping_commit, {type = 0, pack_type = 0}).

-record(evt_shipping_help, {}).

-record(evt_treasure, {base_id = 0}).

-record(evt_treasure_compass, {}).

-record(evt_guild_propagate, {}).

-record(evt_pay, {sn = "", gold = 0, source = 0}).

-record(evt_kill_treasure_ghost, {}).

-record(evt_pray, {}).

-record(evt_skill_prac_levup, {id = 0, lev = 0}).

-record(evt_skill_life_levup, {id = 0, lev = 0}).

-record(evt_skill_life_produce,
        {id = 0, base_id = 0, num = 0}).

-record(evt_blacksmith_embed, {num = 0}).

-record(evt_blacksmith_embed_lev, {lev = 0}).

-record(evt_blacksmith_enchant,
        {base_id = 0,
         is_succ = 0,
         luck_list = 0,
         is_protect = 0,
         all_lev = 0,
         pre_all_lev = 0,
         sum_lev = 0,
         pre_sum_lev = 0}).

-record(evt_guild_plant_mature, {}).

-record(evt_examination, {type = 1 :: 1..3}).

-record(evt_question_match, {score = 0}).

-record(evt_question_match_answer, {is_right = 0}).

-record(evt_question_match_mvp, {}).

-record(evt_question_match_last_right, {count = 0}).

-record(evt_warrior_fight, {win_flag = 0}).

-record(evt_warrior_reward, {win_flag = 0, score = 0}).

-record(evt_warrior, {}).

-record(evt_gold_league_fight, {win_flag = 0}).

-record(evt_gold_league_reward,
        {win_flag = 0, score = 0}).

-record(evt_gold_league, {}).

-record(evt_achievement, {id = 0}).

-record(evt_gain_achieve, {val = 0}).

-record(evt_gain_gold_bind,
        {val = 1 :: pos_integer(),
         source :: undefined | atom()}).

-record(evt_have_gold_bind, {val = 1 :: pos_integer()}).

-record(evt_wing,
        {grade = 1 :: pos_integer(),
         growth = 1 :: pos_integer(),
         star = 0}).

-record(evt_wing_reset, {}).

-record(evt_wing_skill, {count = 0}).

-record(evt_wing_lev,
        {grade = 1 :: pos_integer(), star_lev = 0}).

-record(evt_fuse, {base_id = 0 :: non_neg_integer()}).

-record(evt_guild_post,
        {post = 0 :: non_neg_integer()}).

-record(evt_examination_answer,
        {is_right = 1 :: 1 | 2}).

-record(evt_pet_use_item, {base_id = 0}).

-record(evt_pet_repleace_skill, {}).

-record(evt_activity, {val = 0}).

-record(evt_pet_rename, {}).

-record(evt_pet_free, {}).

-record(evt_pet_stone_upgrade, {grade = 0}).

-record(evt_guard_upgrade_eqm, {}).

-record(evt_guard_reset_eqm, {}).

-record(evt_guard_embed_gem, {}).

-record(evt_friend_intimacy, {val = 0}).

-record(evt_friend_intimacy_camp,
        {val = 0, target_id = {0, "", 0}}).

-record(evt_friend_zone_photo, {}).

-record(evt_friend_zone_like, {val = 0}).

-record(evt_friend_zone_liked, {val = 0}).

-record(evt_friend_zone_like_baby, {val = 0}).

-record(evt_friend_zone_leave_trend, {}).

-record(evt_friend_zone_leave_trended, {val = 0}).

-record(evt_formation_lev, {id = 0, lev = 0}).

-record(evt_alchemy_produce, {item_list = []}).

-record(evt_alchemy_melt, {item_list = []}).

-record(evt_classes_challenge_order, {order = 0}).

-record(evt_classes_challenge_rank, {rank = 0}).

-record(evt_classes_challenge_up_rank, {rank = 0}).

-record(evt_market_silver_assets,
        {assets = coin, val = 0}).

-record(evt_market_silver_sold,
        {assets = [], sold_items = []}).

-record(evt_market_silver_buy, {num = 0}).

-record(evt_combat_statistics,
        {revive = 0,
         pet_revive = 0,
         cast_pet = 0,
         use_item = 0,
         is_win = 0,
         is_die = 0,
         guard = [],
         kill_group = 0,
         killed_group = 0,
         kill_group_pet = 0,
         kill_group_target = 0,
         killed_group_target = 0,
         kill_group_target_pet = 0}).

-record(evt_honor, {id = 0}).

-record(evt_pre_honor, {pre_id = 0}).

-record(evt_fashion, {}).

-record(evt_gain_character, {val = 1 :: pos_integer()}).

-record(evt_campaign_unit_match, {val = 0}).

-record(evt_campaign_unit_heap2, {val = 0}).

-record(evt_campaign_unit_match_boss, {val = 0}).

-record(evt_campaign_unit_card, {val = 0}).

-record(evt_campaign_unit_card_boss, {val = 0}).

-record(evt_campaign_unit_order, {val = 0}).

-record(evt_campaign_unit_order_boss, {val = 0}).

-record(evt_campaign_unit_steal, {val = 0}).

-record(evt_campaign_unit_kill, {val = 0}).

-record(evt_campaign_unit_base, {val = 0}).

-record(evt_campaign_unit_kill_boss, {val = 0}).

-record(evt_campaign_unit_fox, {val = 0}).

-record(evt_qualifying, {}).

-record(evt_gain_guild, {val = 1 :: pos_integer()}).

-record(evt_guard_score,
        {val = 0 :: non_neg_integer()}).

-record(evt_constellation,
        {lev = 0 :: non_neg_integer(),
         base_id = 0 :: non_neg_integer()}).

-record(evt_constellation_score,
        {lev = 0 :: non_neg_integer(),
         base_id = 0 :: non_neg_integer()}).

-record(evt_roll,
        {point = 0 :: non_neg_integer(),
         reward = 0 :: non_neg_integer()}).

-record(evt_finish_marriage_question, {}).

-record(evt_commit_marriage_question, {}).

-record(evt_marriage_flower, {}).

-record(evt_finish_couple_question, {}).

-record(evt_finish_couple_task, {}).

-record(evt_commit_couple_question, {}).

-record(evt_couple_flower, {}).

-record(evt_cultivate_plant, {}).

-record(evt_guild_plant_irrigate, {}).

-record(evt_teacher_score_sum, {score = 0}).

-record(evt_teacher_student, {num = 0}).

-record(evt_finish_ask_question, {fun_type = 0}).

-record(evt_teacher_to_sudent, {id = {0, "", 0}}).

-record(evt_teacher, {num = 0}).

-record(evt_commit_ask_question, {}).

-record(evt_get_pet_item_skill_guide, {}).

-record(evt_brave_trial_order, {order = 0}).

-record(evt_shipping_dun, {flag = 0}).

-record(evt_consume, {gold = 0, source = 0}).

-record(evt_guild_hero, {}).

-record(evt_hero, {}).

-record(evt_lover_combat, {win_flag = 0}).

-record(evt_wedding_treasure, {base_id = 0}).

-record(evt_constellation_first, {base_id = 0}).

-record(evt_boss_first, {base_id = 0}).

-record(evt_quest_prac_help, {}).

-record(evt_arena_win_rate, {classes = 0, rate = 0}).

-record(evt_wedding_guest, {}).

-record(evt_dragon_boat, {camp_id = 0}).

-record(evt_dragon_boat_rank, {camp_id = 0, rank = 0}).

-record(evt_dragon_boat_cplt,
        {camp_id = 0, time_span = 0}).

-record(evt_mount_dye_diff, {dye_id = 0, val = 0}).

-record(evt_arena_cup, {cup = 0}).

-record(evt_arena_cup_target, {id = 0}).

-record(evt_arena_roll, {flag = 0, num = 0}).

-record(evt_achi_num, {id = 0, num = 0}).

-record(evt_dun_first, {id = 0, floor = 0}).

-record(evt_tournament_combat, {type = 0}).

-record(evt_comprehend_eqm, {}).

-record(evt_elf_combat, {}).

-record(evt_finish_goal, {id = 0}).

-record(evt_hide_seek, {}).

-record(evt_hide_seek_help, {}).

-record(evt_hide_seek_reward, {}).

-record(evt_camp_fruit, {base_id = 0, num = 0}).

-record(evt_camp_fruit_help, {base_id = 0, num = 0}).

-record(evt_camp_fruit_reward, {}).

-record(evt_tournament,
        {awesome_kill = 0,
         awesome_kill_num = 0,
         awesome_dmg = 0,
         awesome_heal = 0,
         awesome_control = 0,
         mvp = 0,
         rank_lev = 0,
         liked = 0 :: non_neg_integer(),
         best_win_count = 0 :: non_neg_integer()}).

-record(evt_tournament_point,
        {rank_lev = 0, rank_point = 0}).

-record(evt_friend_circle,
        {photos = 0, mentions = 0, day_num = 0}).

-record(evt_friend_circle_liked, {num = 0, other = 0}).

-record(evt_friend_circle_like, {self = 0}).

-record(evt_friend_circle_commented,
        {num = 0, other = 0}).

-record(evt_friend_circle_comment, {self = 0}).

-record(evt_family_update, {type = 0, lev = 0}).

-record(evt_family, {lev = 0}).

-record(evt_family_env, {env = 0}).

-record(evt_family_self_magic_beans, {}).

-record(evt_family_help_magic_beans, {}).

-record(evt_family_furnishing, {type = 0, count = 0}).

-record(evt_own_mount, {status = 0, count = 0}).

-record(evt_mount_growth, {growth = 0}).

-record(evt_mount_appearand, {count = 0}).

-record(evt_mount_mange_pet, {}).

-record(evt_mount_lev, {lev = 0}).

-record(evt_mount_attr, {}).

-record(evt_everyday, {val = 0}).

-record(evt_campaign_reward,
        {type = 0, sec_type = 0, id = 0}).

-record(evt_wedding_day, {day = 0}).

-record(evt_lev_break, {}).

-record(evt_enjoy_moon, {}).

-record(evt_enjoy_moon_wish, {type = 1}).

-record(evt_join_glue_pudding, {}).

-record(evt_glue_pudding_answer, {result = 0}).

-record(evt_glue_pudding_win, {}).

-record(evt_join_kongming_lanterns, {camp_id = 0}).

-record(evt_kongming_lanterns_answer,
        {camp_id = 0, result = 0}).

-record(evt_kongming_lanterns_win, {camp_id = 0}).

-record(evt_join_mid_pudding, {}).

-record(evt_mid_pudding_answer, {result = 0}).

-record(evt_mid_pudding_win, {}).

-record(evt_mid_pudding_agenda, {}).

-record(evt_guild_dragon, {}).

-record(evt_lev_break_active, {}).

-record(evt_camp_cake_finish, {}).

-record(evt_camp_cake_exit, {}).

-record(evt_camp_cake_sub, {}).

-record(evt_national_wisdom, {}).

-record(evt_national_wisdom_right, {}).

-record(evt_national_wisdom_luckyer, {}).

-record(evt_campaign_bag_fill, {}).

-record(evt_rainbow_lottery_day, {}).

-record(evt_campaign_bag_reward, {}).

-record(evt_lev_break_exch, {val = 0}).

-record(evt_classes_modify_times, {times = 0}).

-record(evt_use_fruit_limit, {base_id = 0, lev = 0}).

-record(endless_challenge_cross, {wave = 0}).

-record(endless_challenge_card, {}).

-record(evt_camp_halloween, {}).

-record(evt_camp_halloween_rank, {win = 0, rank = 0}).

-record(evt_camp_halloween_first, {}).

-record(evt_sworn_finish, {times = 0}).

-record(evt_sworn_invite, {times = 0}).

-record(evt_sworn_defined_name, {times = 0}).

-record(evt_sworn_name, {times = 0}).

-record(evt_sworn_skill, {times = 0}).

-record(evt_other, {}).

-record(evt_guild_league_join, {}).

-record(evt_guild_league_cannon, {}).

-record(evt_guild_league_win, {}).

-record(evt_campaign_snow, {val = 0}).

-record(evt_child_info,
        {growth_type = 0, skills = [], talent_skills = []}).

-record(evt_child_eat, {base_id = 0, num = 0}).

-record(evt_child_study,
        {study_str = 0,
         study_con = 0,
         study_mag = 0,
         study_agi = 0,
         study_end = 0}).

-record(evt_go_to_bed, {}).

-record(evt_child_combat,
        {combat_type = 0 :: non_neg_integer(),
         is_win = 0 :: non_neg_integer()}).

-record(evt_child_deliver, {}).

-record(evt_child_grow, {stage}).

-record(evt_fashion_collect_lev, {lev = 0}).

-record(evt_maze, {times = 0}).

-record(evt_maze_sweep, {}).

-record(evt_maze_monster, {}).

-record(evt_maze_gold, {gold = 0}).

-record(evt_maze_monkey, {}).

-record(evt_maze_cat, {}).

-record(evt_may_day_bags, {}).

-record(evt_may_day_help, {}).

-record(evt_may_day_clean, {camp_id = 0}).

-record(evt_rencounter, {is_win = 0}).

-record(evt_rencounter_star,
        {rank_lev = 1, star = 0, total_star = 0}).

-record(evt_guild_siege_combat, {is_win = 0, star = 1}).

-record(evt_guild_dungeon, {}).

-record(evt_guild_pray, {}).

-record(evt_talisman, {type = 0, id = 0}).

-record(evt_camp_whiteday, {type = 0}).

-record(evt_camp_animal_chess, {}).

-record(evt_animal_chess_win, {}).

-record(evt_animal_chess_soldier, {}).

-record(evt_animal_chess_fail, {}).

-record(evt_animal_chess_coach_killed, {}).

-record(evt_animal_chess_kill_coach, {}).

-record(evt_animal_chess_kill_soldier, {}).

-record(evt_pet_add_point, {pet_id = 0, base_id = 0}).

-record(evt_combat_over,
        {combat_type = 0, win_flag = win}).

-record(evt_goodvoice, {}).

-record(evt_spirit_treasure_general, {}).

-record(evt_spirit_treasure_boss, {}).

-record(evt_spirit_treasure_offer_star, {star = 0}).

-record(evt_spirit_treasure_first_kill, {}).

-record(evt_spirit_treasure_boss_wave, {wave = 0}).

-record(evt_oracle_treasure_general, {}).

-record(evt_oracle_treasure_boss, {}).

-record(evt_oracle_treasure_offer_star, {star = 0}).

-record(evt_oracle_treasure_first_kill, {}).

-record(evt_oracle_treasure_boss_wave, {wave = 0}).

-record(evt_oracle_treasure_boss_times, {times = 0}).

-record(evt_camp_7_7th_point, {val = 0}).

-record(evt_chat_guild, {}).

-record(evt_guard_activate, {}).

-record(evt_exquisite_shelf_wave, {wave = 0}).

-record(evt_chat, {channel = undefined, content = ""}).

-record(evt_combat_wing_power, {val = 0}).

-record(evt_combat_sq_point,
        {combat_type = 0,
         is_win = lose,
         val = 0,
         unit_lev = 0}).

-record(evt_guild_dragon_times, {times = 0}).

-record(evt_guild_dragon_rank, {rank = 0}).

-record(evt_guild_dragon_total_point, {point = 0}).

-record(evt_exquisite_shelf_help, {}).

-record(evt_rushing_top_final_times, {final_times = 0}).

-record(g_evt_lev, {val = 0}).

-record(g_evt_member, {val = 0}).

-record(evt_expression, {}).

-record(evt_fuse_expression, {cost_item_id = 0}).

-record(evt_kingbadge,
        {base_id = 0 :: non_neg_integer()}).

-record(evt_sprog_mount, {}).

-record(evt_gods_duel_score, {score = 0}).

-record(evt_provocation_times, {}).

-record(evt_provocation_5v5, {}).

-record(evt_quest_offer_teacher, {}).

-record(evt_boss_teacher, {}).

-record(evt_constellation_kill, {}).

-record(evt_tower_teacher, {}).

-record(evt_gain_experience, {val = 0}).

-record(evt_provocation_use_horn, {}).

-record(evt_provocation_duel_win, {}).

-record(evt_provocation_duel_5v5_win, {}).

-record(evt_stars_trial,
        {base_id = 0,
         round = 99,
         use_item_num = 50,
         self_die_times = 0,
         pet_summon = 0,
         combat_formation = 0}).

-record(evt_stars_trial_combat_round, {dies = []}).

-record(evt_stars_trial_combat,
        {npc_dies = 0,
         after_die_done = 0,
         skill_use_times = []}).

-record(evt_camp_black_white_chess, {}).

-record(evt_black_white_chess_change_in_round,
        {change_num = 0}).

-record(evt_black_white_chess_win, {}).

-record(evt_black_white_chess_lose, {}).

-record(evt_black_white_chess_more_than_ops_chess,
        {num = 0}).

-record(evt_black_white_chess_draw_whitout_ask_draw,
        {}).

-record(evt_black_white_chess_win_remain_one_color, {}).

-record(evt_black_white_chess_lose_remain_one_color,
        {}).

-record(evt_canyon_summit_join, {}).

-record(evt_canyon_summit_cannon, {}).

-record(evt_canyon_summit_win, {}).

-record(evt_star_moon, {}).

-record(evt_truth_dare_join, {}).

-record(evt_truth_dare_lucky, {}).

-record(evt_truth_dare_lucky_choose, {type = 0}).

-record(evt_truth_dare_end, {type = 0}).

-record(evt_truth_dare_two_fail, {}).

-record(evt_truth_dare_one_shot, {}).

-record(evt_general_send_flower, {items = []}).

-file("src/mod/fairyland/fairyland.erl", 53).

-file("inc/assets.hrl", 1).

-record(assets,
        {ver = 41 :: pos_integer(),
         exp = 0 :: non_neg_integer(),
         coin = 0 :: non_neg_integer(),
         coin_bind = 0 :: non_neg_integer(),
         gold = 0 :: non_neg_integer(),
         gold_bind = 0 :: non_neg_integer(),
         intelligs = 0 :: non_neg_integer(),
         guild = 0 :: non_neg_integer(),
         energy = 0 :: non_neg_integer(),
         satiety = 300 :: non_neg_integer(),
         stars_score = 0 :: non_neg_integer(),
         reserve_exp = 0 :: non_neg_integer(),
         character = 0 :: non_neg_integer(),
         alchemy = 0 :: non_neg_integer(),
         love = 0 :: non_neg_integer(),
         teacher_score = 0 :: non_neg_integer(),
         tournament = 0 :: non_neg_integer(),
         lottery_luck = 0 :: non_neg_integer(),
         endless_challenge = 0 :: non_neg_integer(),
         handbook_point = 0 :: non_neg_integer(),
         autumn_score = 0 :: non_neg_integer(),
         star_gold = 0 :: non_neg_integer(),
         halloween = 0 :: non_neg_integer(),
         thanksgiving = 0 :: non_neg_integer(),
         new_year = 0 :: non_neg_integer(),
         firecracker = 0 :: non_neg_integer(),
         glue_pudding = 0 :: non_neg_integer(),
         crystal = 0 :: non_neg_integer(),
         ticket = 0 :: non_neg_integer(),
         brother = 0 :: non_neg_integer(),
         egg = 0 :: non_neg_integer(),
         exchange = 0 :: non_neg_integer(),
         turn = 0 :: non_neg_integer(),
         father = 0 :: non_neg_integer(),
         lucky_ticket = 0 :: non_neg_integer(),
         dollar = 0 :: non_neg_integer(),
         naughty = 0 :: non_neg_integer(),
         concentric = 0 :: non_neg_integer(),
         qixiIntegral = 0 :: non_neg_integer(),
         sunshine = 0 :: non_neg_integer(),
         cut_price = 0 :: non_neg_integer(),
         single_dog = 0 :: non_neg_integer(),
         panda_score = 0 :: non_neg_integer(),
         joyful_egg = 0 :: non_neg_integer(),
         godswar = 0 :: non_neg_integer(),
         skl_unique_exp = 0 :: non_neg_integer(),
         happy_score = 0 :: non_neg_integer(),
         slot_machine = 0 :: non_neg_integer(),
         reserve_gold = 0 :: non_neg_integer(),
         zillionaire_sc = 0,
         score_exchange = 0 :: non_neg_integer(),
         new_open_turn = 0 :: non_neg_integer(),
         long_active = 0 :: non_neg_integer(),
         long_score = 0 :: non_neg_integer(),
         camp_pray_sc = 0 :: non_neg_integer()}).

-file("src/mod/fairyland/fairyland.erl", 54).

-file("inc/map.hrl", 1).

-record(map,
        {id = 1 :: pos_integer(),
         platform = "" :: list(),
         zone_id = 0 :: non_neg_integer(),
         base_id = 1 :: pos_integer(),
         res_id = 0 :: non_neg_integer(),
         pid :: undefined | pid(),
         ctrl_pid :: undefined | pid(),
         grid_info = [] :: [{pid(), pos_integer()}],
         name = "" :: bitstring(),
         condition = [] :: list(),
         num = 0 :: non_neg_integer(),
         width = 1 :: pos_integer(),
         height = 1 :: pos_integer()}).

-record(map_grid,
        {map_pid :: undefined | pid(),
         map_id = 1 :: pos_integer(),
         base_id = 1 :: pos_integer(),
         width = 1 :: pos_integer(),
         height = 1 :: pos_integer()}).

-record(map_data,
        {id = 1 :: pos_integer(),
         name = "" :: list(),
         condition = [] :: [tuple()],
         revive = [] :: [tuple()],
         width = 1 :: pos_integer(),
         height = 1 :: pos_integer(),
         grid_x = 0 :: pos_integer(),
         grid_y = 0 :: pos_integer(),
         max_pre_layer = 60 :: pos_integer(),
         startup = 0 :: 0..1,
         is_single = 0 :: 0..1}).

-file("src/mod/fairyland/fairyland.erl", 55).

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

-file("src/mod/fairyland/fairyland.erl", 56).

-file("inc/package.hrl", 1).

-record(package,
        {type = 1 :: integer(),
         next_id = 1 :: pos_integer(),
         volume = 0 :: non_neg_integer(),
         free_cell = [] :: list(),
         items = [] :: [tuple()]}).

-file("src/mod/fairyland/fairyland.erl", 57).

-file("inc/buff.hrl", 1).

-record(m_buff, {ver = 2, r_list = [], show = 1}).

-record(buff_base,
        {id = 1,
         name = "",
         class = 0,
         lev = 0,
         cancel = 0,
         same_buff_mode = 0,
         type = 1,
         sub_type = 0,
         time_mode = 0,
         max_time_num = 1,
         duration = 0,
         max_effect_lev = 1,
         looks = [],
         attr = [],
         guard_attr = [],
         pet_attr = [],
         end_date = 0,
         extra = [],
         effect = [],
         dynamic_attr = [],
         pvp_limit = 0,
         desc = ""}).

-record(buff,
        {ver = 4,
         id = 1,
         class = 0,
         lev = 0,
         cancel = 0,
         type = 1,
         same_buff_mode = 0,
         time_mode = 0,
         duration = 0,
         max_duration = 1,
         effect_lev = 1,
         end_date = 0,
         start_time = 0,
         looks = [],
         dynamic_attr = [],
         pvped = 0,
         ext_param = [],
         args = 1}).

-file("src/mod/fairyland/fairyland.erl", 58).

-file("inc/link.hrl", 1).

-record(link,
        {socket :: undefined | port(),
         conn_pid :: undefined | pid(),
         ip = {0, 0, 0, 0} :: {0..255, 0..255, 0..255, 0..255},
         port = 0 :: non_neg_integer(),
         lag = 0 :: non_neg_integer()}).

-file("src/mod/fairyland/fairyland.erl", 59).

-file("inc/pet.hrl", 1).

-record(pet_attr,
        {point = 0,
         p_str = 0,
         p_con = 0,
         p_mag = 0,
         p_agi = 0,
         p_end = 0,
         pre_str = 0,
         pre_con = 0,
         pre_mag = 0,
         pre_agi = 0,
         pre_end = 0,
         max_hp_apt_used = 0,
         max_phy_apt_used = 0,
         max_pdef_apt_used = 0,
         max_magic_apt_used = 0,
         max_aspd_apt_used = 0,
         hp_aptitude = 0,
         phy_aptitude = 0,
         pdef_aptitude = 0,
         magic_aptitude = 0,
         aspd_aptitude = 0,
         max_hp_aptitude = 0,
         max_phy_aptitude = 0,
         max_pdef_aptitude = 0,
         max_magic_aptitude = 0,
         max_aspd_aptitude = 0}).

-record(pet_tmp_aptitude,
        {is_valid = 0,
         tmp_genre = 0,
         tmp_pet_attr = #pet_attr{} :: #pet_attr{},
         tmp_skills = [],
         tmp_growth = 0,
         tmp_growth_type = 0,
         tmp_happy = 0,
         talent = 0}).

-record(pet_base,
        {id = 0,
         name = "",
         type = 1,
         genre = 0,
         hp_aptitude = 0,
         phy_aptitude = 0,
         pdef_aptitude = 0,
         magic_aptitude = 0,
         aspd_aptitude = 0,
         need_lev_break = 0,
         base_skills = [],
         vari_skills = [],
         lev_break_skills = [],
         has_break_skill = 0,
         base_happy = 1000,
         min_happy_ratio = 800,
         max_happy_ratio = 1050,
         min_happy_genre_ratio = 1000,
         max_happy_genre_ratio = 1100,
         growth_blue = 0,
         growth_purple = 0,
         growth_orange = 0,
         growth_red = 0,
         model_id = 0,
         model_id1 = 0,
         model_id2 = 0,
         model_id3 = 0,
         skin_id_0 = 0,
         skin_id_1 = 0,
         skin_id_2 = 0,
         skin_id_3 = 0,
         skin_id_s0 = 0,
         skin_id_s1 = 0,
         skin_id_s2 = 0,
         skin_id_s3 = 0,
         cost = [],
         lev_break_cost = [],
         max_wash_time = 0,
         manual_level = 0}).

-record(pet_base_skill,
        {id = 0,
         name = "",
         type = 0,
         step = 0,
         lev = 0,
         max_exp = 0,
         attr = []}).

-record(pet_skill,
        {id = 0,
         lev = 1,
         exp = 1,
         step = 0,
         type = 0,
         source = 1,
         is_lock = 0,
         is_last_study = 0}).

-record(pet_skin,
        {use_skin = 0,
         has_skin = [],
         add_hp_aptitude = 0,
         add_phy_aptitude = 0,
         add_pdef_aptitude = 0,
         add_magic_aptitude = 0,
         add_aspd_aptitude = 0,
         add_growth = 0}).

-record(pet,
        {ver = 32 :: pos_integer(),
         id = 1 :: pos_integer(),
         type = 1 :: pos_integer(),
         name = "" :: bitstring(),
         lev = 1 :: pos_integer(),
         talent = 0,
         growth = 0,
         growth_type = 2,
         use_growth = 0,
         genre = 0,
         exp = 0 :: non_neg_integer(),
         max_exp = 1 :: pos_integer(),
         status = 0 :: 0 | 1,
         base_id :: undefined | pos_integer(),
         attr :: undefined | tuple(),
         hp = 1,
         mp = 1,
         hp_max = 1,
         mp_max = 1,
         pet_attr = #pet_attr{} :: #pet_attr{},
         happy = 0 :: non_neg_integer(),
         looks = [] :: list(),
         skills = [],
         comprehend_lev = 1,
         grade = 0,
         grade_attr = [],
         stones = [],
         feed_item = [],
         feed_point = 0,
         free_reset_flag = 0,
         combat_talk = [],
         lock = 0,
         wash_time = 0,
         ai_skillid = 0,
         mount_skills = [],
         break_times = 0,
         is_first = 0,
         handbook_attr = [],
         handbook_num = 0,
         star_handbook_num = 0,
         pet_tmp_aptitude = #pet_tmp_aptitude{},
         glue_pudding_used = 0,
         pet_skin = #pet_skin{},
         spirit_attached = 0 :: 0 | 1,
         spirit_attached_id = 0 :: non_neg_integer(),
         spirit_skills = [],
         spirit_info = [],
         unreal = [],
         spirit_child_flag = 0 :: 0 | 1,
         spirit_child_id = {0, "", 0} :: tuple(),
         unreal_looks_flag = 0 :: 0 | 1,
         pet_rune = []}).

-record(m_pet,
        {ver = 2 :: pos_integer(),
         fresh_id = 1,
         next_id = 1 :: pos_integer(),
         pets = [] :: list(),
         rename = 3 :: non_neg_integer(),
         pet_nums = 5,
         time = 0}).

-record(m_pet_store,
        {ver = 1 :: pos_integer(),
         next_id = 1 :: pos_integer(),
         pets = [] :: list(),
         pet_nums = 4}).

-record(pet_goods,
        {base_id :: undefined | pos_integer(),
         actv_lev :: undefined | pos_integer(),
         stock :: undefined | pos_integer()}).

-record(pet_shop_data,
        {base_id :: undefined | pos_integer(),
         name :: undefined | binary(),
         actv_lev :: undefined | pos_integer(),
         def_buy_price :: undefined | pos_integer(),
         stock :: undefined | pos_integer()}).

-record(pet_exchange_data,
        {base_id = 0,
         item_id = 0,
         item_num = 0,
         exchange_item_num = 0,
         genre = 0,
         talent = 0}).

-record(pet_stone_polish_data,
        {stone_id = 0,
         attr = [],
         attr_name = 0,
         val_list = [],
         skill_list = []}).

-record(pet_unreal, {item_id = 0, timeout = 0}).

-record(pet_unreal_data,
        {item_id = 0,
         attr = [],
         skills = [],
         model_id = 0,
         skin_id = 0}).

-record(pet_rune,
        {rune_index = 0,
         rune_type = 0,
         rune_status = 0,
         rune_id = 0,
         rune_lev = 0,
         is_resonance = 0,
         resonances = []}).

-record(pet_resonance,
        {resonance_index = 0,
         resonance_id = 0,
         rune_index = 0}).

-file("src/mod/fairyland/fairyland.erl", 60).

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

-file("src/mod/fairyland/fairyland.erl", 61).

-file("inc/var.hrl", 1).

-record(m_var,
        {ver = 1,
         last_reset_time = 0 :: non_neg_integer(),
         last_reset_five_time = 0,
         last_reset_week_five_time = 0,
         day_vars = [] :: [tuple()],
         day_five_vars = [] :: [tuple()],
         week_five_vars = [],
         last_acc_time = 0,
         acc_time = 0,
         acc_vars = [] :: [tuple()],
         other_vars = [] :: [tuple()]}).

-record(role_var,
        {id = {0, "", 0} :: tuple(),
         ver = 1,
         last_reset_time = 0 :: non_neg_integer(),
         day_vars = [] :: [tuple()],
         forever_vars = [] :: [tuple()],
         last_reset_five_time = 0,
         last_reset_week_five_time = 0,
         day_five_vars = [] :: [tuple()],
         week_five_vars = []}).

-file("src/mod/fairyland/fairyland.erl", 62).

-record(state,
        {ts = 0 :: tuple(),
         timeout = 0 :: non_neg_integer(),
         gen_ref :: undefined | reference(),
         boss_floors = [] :: list(),
         boss_ref :: undefined | reference(),
         exp_ref :: undefined | reference()}).

init() -> #m_fairyland{}.

login(Role = #role{s_event = 6,
                   pos =
                       Pos = #pos{map_base_id = MapBaseId,
                                  last =
                                      #pos_history{platform = OldP,
                                                   zone_id = OldZ, map = LMapId,
                                                   x = Lx, y = Ly},
                                  map = MapId},
                   m_fairyland =
                       FairyLand = #m_fairyland{floor = Floor}}) ->
    logger:debug("还在活动 floor:~w, map_id ~w",
                 [Floor, MapId],
                 fairyland,
                 127),
    case ets:lookup(fairyland_floor, Floor) of
        [#fairyland_floor{map_base_id = MapBaseId,
                          map_id = MapId}] ->
            {ok, FRole} = role_convert:to(fairyland_role, Role),
            case gen_fsm:sync_send_all_state_event(fairyland,
                                                   {login, FRole})
                of
                ok ->
                    {Role1, NewTriggers} = add_trigger([evt_move_map,
                                                        evt_team_leave,
                                                        evt_team_join],
                                                       Role,
                                                       []),
                    Role2 = Role1#role{m_fairyland =
                                           FairyLand#m_fairyland{triggers =
                                                                     NewTriggers}},
                    {ok, Role2};
                _ ->
                    NewPos = Pos#pos{platform = OldP, zone_id = OldZ,
                                     map = LMapId, x = Lx, y = Ly},
                    NewRole = clean_iteams(Role#role{s_event = 0,
                                                     pos = NewPos,
                                                     m_fairyland =
                                                         #m_fairyland{}},
                                           no),
                    {ok, NewRole}
            end;
        _ ->
            NewPos = Pos#pos{platform = OldP, zone_id = OldZ,
                             map = LMapId, x = Lx, y = Ly},
            NewRole = clean_iteams(Role#role{s_event = 0,
                                             pos = NewPos,
                                             m_fairyland = #m_fairyland{}},
                                   no),
            {ok, NewRole}
    end;
login(Role) ->
    case ets:lookup(fairyland_floor, 1) of
        [#fairyland_floor{}] -> {ok, Role};
        _ -> {ok, clean_iteams(Role, no)}
    end.

logout(#role{id = Id, s_event = 6}) ->
    fairyland ! {logout, Id},
    ok;
logout(_) -> ok.

join(#role{cross_type = 1}) ->
    {false, lang:get("跨服状态不能参与")};
join(#role{lev = Lev}) when Lev < 30 ->
    {false, util:flist(lang:get("角色等级达到~w才可以参加哦"), [30])};
join(#role{m_team = #m_team{pid = Pid, status = 2}})
    when is_pid(Pid) ->
    {false, lang:get("你在跟随队伍中，不能参与哦")};
join(#role{s_event = 6}) ->
    {false, lang:get("你已经在活动中了")};
join(Role = #role{name = Name,
                  pos =
                      #pos{map = MapId, x = X, y = Y, platform = OldPlatform,
                           zone_id = OldZoneId}}) ->
    case join_check([event, team], Role) of
        true ->
            {ok, FRole} = role_convert:to(fairyland_role, Role),
            case gen_fsm:sync_send_all_state_event(fairyland,
                                                   {join, FRole})
                of
                {true, ToPos, Envoys, Exp} ->
                    {Role1, NewTriggers} = add_trigger([evt_move_map,
                                                        evt_team_leave,
                                                        evt_team_join],
                                                       Role,
                                                       []),
                    Role2 = Role1#role{s_event = 6,
                                       m_fairyland =
                                           #m_fairyland{forward_envoys = Envoys,
                                                        triggers = NewTriggers,
                                                        floor = 0, exp = Exp}},
                    TeamEvt = make_team_event(Role2),
                    case map:role_enter(ToPos, TeamEvt, Role2) of
                        {error, Reason} ->
                            logger:error("[~s]进入地图失败:~w",
                                         [Name, Reason],
                                         fairyland,
                                         192),
                            {false, lang:get("进入地图失败")};
                        {ok, Role3 = #role{pos = Pos}} ->
                            Last = #pos_history{map = MapId, x = X, y = Y,
                                                platform = OldPlatform,
                                                zone_id = OldZoneId},
                            NewRole = fire_join_event(Role3#role{pos =
                                                                     Pos#pos{last
                                                                                 =
                                                                                 Last}}),
                            push(NewRole, 14603),
                            map:role_update(NewRole),
                            {ok, NewRole}
                    end;
                {false, Why} -> {false, Why}
            end;
        Else -> Else
    end;
join(_) -> {false, lang:get("当前状态不能参与")}.

join_to_follow(Role) ->
    case join(Role) of
        {ok, NewRole} ->
            team:follow(NewRole),
            {ok, NewRole};
        {false, Why} ->
            Msg = util:flist(lang:get("队长正在彩虹冒险中，~ts"), [Why]),
            notice:send(Role, 1, Msg)
    end.

-spec quit(#role{}) -> {ok, NewRole :: #role{}} |
                       {false, Why :: bitstring()}.

quit(Role = #role{m_fairyland =
                      #m_fairyland{triggers = Triggers, boss_prizes = Prizes},
                  s_event = 6}) ->
    case team:get_status(Role) of
        {true, 2} -> {false, lang:get("你在跟随队伍中呢")};
        _ ->
            {Role1, _NewTriggers} = remove_trigger(all,
                                                   Triggers,
                                                   Role),
            Role2 = Role1#role{s_event = 0,
                               m_fairyland =
                                   #m_fairyland{boss_prizes = Prizes}},
            TeamEvt = make_team_event(Role2),
            case map:role_enter(util:rand_list([{10001, 306, 3507},
                                                {10001, 2583, 3848},
                                                {10001, 4957, 3680},
                                                {10001, 445, 2565},
                                                {10001, 4646, 704},
                                                {10001, 841, 1033},
                                                {10001, 2098, 1834},
                                                {10001, 3617, 1816}]),
                                TeamEvt,
                                Role2)
                of
                {error, Reason} ->
                    logger:error("退出活动地进入主城时出错:~w",
                                 [Reason],
                                 fairyland,
                                 234),
                    {false, lang:get("退出失败")};
                {ok, Nr} ->
                    map:role_update(Nr),
                    {ok, Nr}
            end
    end;
quit(Role) -> {ok, Role}.

teleport(Role = #role{s_event = 6,
                      m_fairyland = #m_fairyland{floor = Floor}},
         #unit{base_id = BaseId}) ->
    case team:get_status(Role) of
        {true, 2} -> {false, lang:get("你在跟随队伍中呢")};
        {true, 3} -> {false, lang:get("在队伍中只能由队长操作")};
        _ ->
            case team:get_members_follow_num(Role) of
                Num when is_integer(Num) andalso Num >= 3 ->
                    case join_check([event, team], Role) of
                        true ->
                            case team:get_members(Role) of
                                TeamList
                                    when Floor =/= 0 orelse
                                             length(TeamList) >= 3 - 1 ->
                                    case ets:lookup(fairyland_floor, Floor) of
                                        _ when Floor =:= 12 ->
                                            do_teleport(Role,
                                                        Floor - 1,
                                                        BaseId);
                                        _ when Floor =:= 1 ->
                                            do_teleport(Role,
                                                        Floor + 1,
                                                        BaseId);
                                        [#fairyland_floor{forward_envoy =
                                                              BaseId}] ->
                                            do_teleport(Role,
                                                        Floor + 1,
                                                        BaseId);
                                        _ when Floor > 0 ->
                                            do_teleport(Role,
                                                        Floor - 1,
                                                        BaseId);
                                        _ -> {false, lang:get("呆在原地吧")}
                                    end;
                                _ ->
                                    {false,
                                     util:flist(lang:get("需要队伍~w人才可以进入"), [3])}
                            end;
                        Else -> Else
                    end;
                _ ->
                    Msg = notice:format(lang:get("归队人数不足~ts人, 无法进行传送"),
                                        [{string_2, 1, 3}]),
                    {false, Msg}
            end
    end;
teleport(_Role, _) -> {false, lang:get("不在彩虹中")}.

check_pick(Role = #role{m_fairyland =
                            #m_fairyland{keys = Keys},
                        s_event = 6},
           PickArgs = #{base_id := BaseId}) ->
    case team:get_status(Role) of
        {true, 1} ->
            case role_misc:check_event(Role, [6]) of
                true ->
                    case [Mate
                          || Mate = #team_mate{pid = Pid}
                                 <- team:get_members(Role),
                             is_pid(Pid)]
                        of
                        TeamList when length(TeamList) >= 3 - 1 ->
                            case check_keys(lists:keysort(1, Keys), BaseId) of
                                {ok, K, _Gain} ->
                                    {true,
                                     PickArgs#{team_mates => TeamList,
                                               key => K}};
                                Else -> Else
                            end;
                        _ -> {false, util:flist(lang:get("需要队伍~w人合力开启"), [3])}
                    end;
                Else -> Else
            end;
        _ -> {false, lang:get("队长才可以开宝箱")}
    end;
check_pick(_, _PickArgs) -> {false, lang:get("不在彩虹中")}.

pick_gain(Role = #role{m_fairyland =
                           FairyLand = #m_fairyland{keys = Keys, floor = Floor,
                                                    forward_envoys = Envoys}},
          #{base_id := BaseId, key := K, team_mates := Mates}) ->
    NewKeys = case lists:keyfind(K, 1, Keys) of
                  {K, 1} -> lists:keydelete(K, 1, Keys);
                  {K, N} -> lists:keyreplace(K, 1, Keys, {K, N - 1})
              end,
    Role1 = Role#role{m_fairyland =
                          FairyLand#m_fairyland{keys = NewKeys}},
    case check_punish(Role1, BaseId) of
        {ok, Role2} ->
            push(Role1, 14603),
            team:leader_async(Role2,
                              {fairyland,
                               role_callback,
                               [{sync_team,
                                 NewKeys,
                                 Floor,
                                 Envoys,
                                 box_punish}]}),
            {ok, Role2};
        _ ->
            push(Role1, 14603),
            roll:fairyland_box(BaseId, [Role | Mates]),
            team:leader_async(Role1,
                              {fairyland,
                               role_callback,
                               [{sync_team,
                                 NewKeys,
                                 Floor,
                                 Envoys,
                                 box_normal}]}),
            {ok, Role1}
    end.

combat_check(Role = #role{m_fairyland =
                              #m_fairyland{floor = Floor}},
             Unit = #unit{base_id = 79619}) ->
    case combat_mgr:check_self(19, Role, Unit) of
        true ->
            case team:get_fighters(Role) of
                {ok, Mates} ->
                    _Res = combat_mgr:start_combat(19,
                                                   Mates,
                                                   Unit,
                                                   #combat_start_args{ext_args =
                                                                          Floor}),
                    logger:debug("开战结果 ~w", [_Res], fairyland, 338),
                    {ok};
                Else -> Else
            end;
        Else -> Else
    end;
combat_check(Role = #role{m_fairyland =
                              #m_fairyland{floor = Floor}},
             Unit = #unit{base_id = 79630}) ->
    case team:get_fighters(Role) of
        {ok, Mates} ->
            _Res = combat_mgr:start_combat(20,
                                           Mates,
                                           Unit,
                                           #combat_start_args{ext_args =
                                                                  Floor}),
            logger:debug("开战结果 ~w", [_Res], fairyland, 348),
            {ok};
        Else -> Else
    end;
combat_check(Role, Unit) ->
    case combat_mgr:check_self(18, Role, Unit) of
        true ->
            case team:get_fighters(Role) of
                {ok, Mates} ->
                    _Res = combat_mgr:start_combat(18, Mates, Unit),
                    logger:debug("开战结果 ~w", [_Res], fairyland, 358),
                    ok;
                _Else ->
                    logger:debug("开战结果 ~w", [_Else], fairyland, 361),
                    ok
            end;
        Else -> Else
    end.

-spec combat_over(Combat :: #combat{}) -> list().

combat_over(#combat{type = 19, winner = Winner,
                    start_args = #combat_start_args{ext_args = Floor}}) ->
    case [F || F = #fighter{type = 1, group = 0} <- Winner]
        of
        WinnerF = [_ | _] ->
            Leader = [{{R, P, Z}, Name}
                      || #fighter{rid = R, platform = P, zone_id = Z,
                                  name = Name, is_leader = 1}
                             <- WinnerF],
            fairyland ! {kill_boss, Floor, Leader},
            ok;
        _ -> ok
    end;
combat_over(_) -> ok.

role_callback(Role, quit) ->
    case quit(Role) of
        {ok, NewRole} ->
            notice:return(lang:get("彩虹冒险活动结束了")),
            {ok, NewRole};
        _ -> ok
    end;
role_callback(Role, {sync_team, Keys, Floor, Envoys}) ->
    role_callback(Role,
                  {sync_team, Keys, Floor, Envoys, normal});
role_callback(Role = #role{m_fairyland = FairyLand},
              {sync_team, Keys, Floor, Envoys, Label}) ->
    Role2 = Role#role{m_fairyland =
                          FairyLand#m_fairyland{keys = Keys, floor = Floor,
                                                forward_envoys = Envoys}},
    push(Role2, 14603),
    case Label of
        teleport ->
            {ok,
             role_trigger:fire(#evt_fairyland_floor{floor = Floor,
                                                    is_leader = 0},
                               Role2)};
        box_punish ->
            {ok,
             role_trigger:fire(#evt_fairyland_box{box_punish = 1},
                               Role2)};
        box_normal ->
            {ok,
             role_trigger:fire(#evt_fairyland_box{box_punish = 0},
                               Role2)};
        _ -> {ok, Role2}
    end;
role_callback(Role = #role{m_fairyland =
                               FairyLand = #m_fairyland{exp = Exp},
                           lev = Lev, id = Id},
              add_exp) ->
    Add = case fairyland_data:get_waiting_exp(Lev) of
              #{exp := Add0} -> Add0;
              _ -> 0
          end,
    Gain0 = [{90010, Add}],
    Gain = case pet:get_war_pet(Role) of
               {ok, #pet{lev = PetLev}} ->
                   case fairyland_data:get_waiting_exp(PetLev) of
                       #{pet_exp := PExp} -> [{90005, PExp} | Gain0];
                       _ -> Gain0
                   end;
               _ -> Gain0
           end,
    NewExp = Exp + Add,
    Role2 = Role#role{m_fairyland =
                          FairyLand#m_fairyland{exp = NewExp}},
    case role_gain:do_notice(format:val_to_gain(Gain),
                             Role2)
        of
        {ok, Role3} ->
            push(Role3, 14603),
            fairyland ! {update_exp, Id, NewExp},
            {ok, Role3};
        _ -> ok
    end;
role_callback(Role, clean_iteams) ->
    Role2 = clean_iteams(Role, push),
    {ok, Role2};
role_callback(Role, {box_punish, ItemId, ItemNum}) ->
    case box_punish(Role, ItemId, ItemNum) of
        {ok, Role2} -> {ok, Role2};
        _ -> ok
    end;
role_callback(Role = #role{assets =
                               #assets{satiety = Satiety}},
              {punish_satiety, Num}) ->
    Loss = format:val_to_loss([{90014, min(Num, Satiety)}]),
    case role_gain:do_notice(Loss, Role) of
        {ok, Role1} -> {ok, Role1};
        _ -> ok
    end;
role_callback(Role, {show_punish, BaseId, Id, Num}) ->
    push(Role, 14606, {BaseId, Id, Num}),
    ok;
role_callback(Role, {raffle_boss_reward, BossId}) ->
    case fairyland:raffle_boss_reward(Role, BossId) of
        {ok, ItemId, NewRole} ->
            push(NewRole, 14605, {1, "", ItemId}),
            {ok, NewRole};
        _ -> ok
    end;
role_callback(_, _Args) ->
    logger:debug("未知调用 ~w", [_Args], fairyland, 471),
    ok.

role_callback(_, Role, _, {follow_join, Envoys}) ->
    {Role1, NewTriggers} = add_trigger([evt_move_map,
                                        evt_team_leave,
                                        evt_team_join],
                                       Role,
                                       []),
    Role2 = Role1#role{s_event = 6,
                       m_fairyland =
                           #m_fairyland{triggers = NewTriggers,
                                        forward_envoys = Envoys, floor = 0}},
    FireRole = fire_join_event(Role2),
    {ok, FRole} = role_convert:to(fairyland_role, FireRole),
    fairyland ! {follow_join, FRole},
    push(FireRole, 14603),
    {ok, FireRole};
role_callback(_,
              Role = #role{m_fairyland =
                               #m_fairyland{triggers = Triggers,
                                            boss_prizes = Prizes}},
              _, follow_quit) ->
    {Role1, _NewTriggers} = remove_trigger(all,
                                           Triggers,
                                           Role),
    Role2 = Role1#role{m_fairyland =
                           #m_fairyland{triggers = [], floor = 0,
                                        boss_prizes = Prizes}},
    NewRole = clean_iteams(Role2, push),
    {ok, NewRole}.

evt_callback(_Evt = #evt_move_map{base_id = _BaseId},
             Role = #role{s_event = 6, pos = #pos{map_pid = Pid},
                          m_fairyland = #m_fairyland{floor = Floor}}) ->
    Now = date:unixtime(),
    case erlang:get(fairyland_last_fight) of
        _ when Floor < 7 -> ok;
        Last when is_integer(Last) andalso Now - Last < 15 ->
            logger:debug("上次时间 ~w", [Now - Last], fairyland, 509),
            ok;
        _ ->
            case buff:lookup(Role, 20033) of
                #buff{} -> ok;
                _ ->
                    case team:get_status(Role) of
                        {true, 2} -> ok;
                        _ ->
                            case map:unit_list(Pid) of
                                {ok, L} -> check_fight(L, Role);
                                _ ->
                                    logger:debug("地图没怪", [], fairyland, 523),
                                    ok
                            end
                    end
            end
    end;
evt_callback(_Evt = #evt_team_leave{},
             Role = #role{s_event = 6, m_fairyland = FairyLand}) ->
    Role2 = Role#role{m_fairyland =
                          FairyLand#m_fairyland{keys = []}},
    map:role_update(Role2),
    {ok, Role2};
evt_callback(#evt_team_join{pid = Pid},
             #role{m_fairyland =
                       #m_fairyland{keys = Keys, floor = Floor,
                                    forward_envoys = Envoys}}) ->
    role:apply(async,
               Pid,
               {fairyland,
                role_callback,
                [{sync_team, Keys, Floor, Envoys}]}),
    ok;
evt_callback(_Evt, _Role) ->
    logger:debug("未知事件回调 ~w", [_Evt], fairyland, 543),
    ok.

check_gain(Role = #role{m_fairyland =
                            FairyLand = #m_fairyland{boss_prizes = Prizes}},
           19, win) ->
    logger:debug("奖励", [], fairyland, 548),
    case fairyland_data:get_boss_reward(79619) of
        [_ | _] ->
            Role1 = Role#role{m_fairyland =
                                  FairyLand#m_fairyland{boss_prizes =
                                                            lists:keystore(79619,
                                                                           1,
                                                                           Prizes,
                                                                           {79619,
                                                                            date:unixtime()})}},
            push(Role1, 14604, {79619}),
            Timer = #timer{id = fairyland_boss_reward,
                           timeout = 10000, times = 1, m = fairyland,
                           f = role_callback,
                           a = [{raffle_boss_reward, 79619}]},
            NRole = role_timer:add(Timer, Role1),
            {NRole, []};
        _ -> {Role, []}
    end;
check_gain(Role = #role{id = Id,
                        m_fairyland =
                            FairyLand = #m_fairyland{boss_prizes = Prizes}},
           20, win) ->
    logger:debug("奖励", [], fairyland, 564),
    case ets:lookup(fairyland_role, Id) of
        [#fairyland_role{box_boss_rewarded = Rewarded}]
            when Rewarded > 0 ->
            notice:send(Role, 3, lang:get("已经领取过奖励，无法再获得")),
            {Role, []};
        _ ->
            case fairyland_data:get_boss_reward(79630) of
                [_ | _] ->
                    Role1 = Role#role{m_fairyland =
                                          FairyLand#m_fairyland{boss_prizes =
                                                                    lists:keystore(79630,
                                                                                   1,
                                                                                   Prizes,
                                                                                   {79630,
                                                                                    date:unixtime()})}},
                    push(Role1, 14604, {79630}),
                    Timer = #timer{id = fairyland_boss_reward,
                                   timeout = 20000, times = 1, m = fairyland,
                                   f = role_callback,
                                   a = [{raffle_boss_reward, 79630}]},
                    NRole = role_timer:add(Timer, Role1),
                    {NRole, []};
                _ -> {Role, []}
            end
    end;
check_gain(Role, _Rewards, _) ->
    erlang:put(fairyland_last_fight, date:unixtime()),
    {Role, []}.

check_gain(Role = #role{m_fairyland =
                            FairyLand = #m_fairyland{keys = Keys, floor = Floor,
                                                     forward_envoys = Envoys},
                        m_team = #m_team{pid = Pid, status = 1}},
           Rewards, win, Loser)
    when is_pid(Pid) ->
    erlang:put(fairyland_last_fight, date:unixtime()),
    case get_key_loot(Loser) of
        Loot0 = [_ | _] ->
            Loot = case buff:lookup(Role, 20034) of
                       #buff{} ->
                           logger:debug("加钥匙概率", [], fairyland, 595),
                           Fun = fun ({3, Ow}) -> {3, Ow + 10000};
                                     ({Okey, Ow}) -> {Okey, Ow}
                                 end,
                           [Fun(One) || One <- Loot0];
                       _ ->
                           logger:debug("没钥匙符", [], fairyland, 603),
                           Loot0
                   end,
            case util:rand_list(Loot, 2) of
                {0, _} -> {Role, Rewards};
                {K, _} ->
                    NewKeys = case lists:keyfind(K, 1, Keys) of
                                  {K, N} ->
                                      lists:keyreplace(K, 1, Keys, {K, N + 1});
                                  _ -> [{K, 1} | Keys]
                              end,
                    Role1 = Role#role{m_fairyland =
                                          FairyLand#m_fairyland{keys =
                                                                    NewKeys}},
                    team:leader_async(Role1,
                                      {fairyland,
                                       role_callback,
                                       [{sync_team, NewKeys, Floor, Envoys}]}),
                    GainMsg = notice:format(lang:get("战斗胜利，获得~ts"),
                                            [{string_2, 1, key_to_name(K)}]),
                    team:notice(Role, GainMsg),
                    push(Role1, 14603),
                    notice_gain(Role1, Rewards),
                    {Role1, Rewards}
            end;
        _ ->
            notice_gain(Role, Rewards),
            {Role, Rewards}
    end;
check_gain(Role, Rewards, win, _) ->
    case team:get_status(Role) of
        false ->
            notice:send(Role, 3, lang:get("不在队伍中不能获得宝箱钥匙，快加入队伍吧"));
        _ -> ok
    end,
    erlang:put(fairyland_last_fight, date:unixtime()),
    {Role, Rewards};
check_gain(Role, _Rewards, _, _) ->
    erlang:put(fairyland_last_fight, date:unixtime()),
    {Role, []}.

get_key_loot([]) -> false;
get_key_loot([#fighter{type = 2, base_id = BaseId}
              | T]) ->
    case fairyland_data:get_key_loot(BaseId) of
        Loot = [_ | _] -> Loot;
        _ -> get_key_loot(T)
    end.

raffle_boss_reward(Role = #role{m_fairyland =
                                    FairyLand = #m_fairyland{boss_prizes =
                                                                 Prizes},
                                id = Id, name = RName},
                   BossId) ->
    case fairyland_data:get_boss_reward(BossId) of
        Loot = [_ | _] ->
            case util:rand_list(Loot, item_weight) of
                _Cfg = #{item_id := ItemId0, item_num := ItemNum,
                         announce := Announce} ->
                    ItemId = item_type:special_id(ItemId0),
                    case lists:keyfind(BossId, 1, Prizes) of
                        {BossId, _} ->
                            Role1 = Role#role{m_fairyland =
                                                  FairyLand#m_fairyland{boss_prizes
                                                                            =
                                                                            lists:keydelete(BossId,
                                                                                            1,
                                                                                            Prizes)}},
                            case
                                role_gain:do_notice(format:val_to_gain([{ItemId,
                                                                         0,
                                                                         ItemNum}]),
                                                    Role1)
                                of
                                {ok, Role2} ->
                                    case BossId of
                                        79630 ->
                                            fairyland ! {box_boss_reward, Id};
                                        _ -> ok
                                    end,
                                    case Announce of
                                        1 ->
                                            Msg =
                                                notice:format(lang:get("~ts在蹂躏了BOSS~ts后，还顺手从他裤兜里掏出了传世之宝~ts扬长而去"),
                                                              [{role_1,
                                                                Id,
                                                                RName},
                                                               {unit_1, BossId},
                                                               {item_2,
                                                                ItemId}]),
                                            notice:cast(all, 5, Msg);
                                        _ -> ok
                                    end,
                                    Msg2 = notice:format(lang:get("~ts获得~ts"),
                                                         [{role_1, Id, RName},
                                                          {item_2, ItemId}]),
                                    team:notice(Role, Msg2),
                                    {ok, ItemId, Role2};
                                {false, #gain{reason = bag_full}} ->
                                    case BossId of
                                        79630 ->
                                            fairyland ! {box_boss_reward, Id};
                                        _ -> ok
                                    end,
                                    case Announce of
                                        1 ->
                                            Msg =
                                                notice:format(lang:get("~ts在蹂躏了BOSS~ts后，还顺手从他裤兜里掏出了传世之宝~ts扬长而去"),
                                                              [{role_1,
                                                                Id,
                                                                RName},
                                                               {unit_1, BossId},
                                                               {item_2,
                                                                ItemId}]),
                                            notice:cast(all, 5, Msg);
                                        _ -> ok
                                    end,
                                    Msg2 = notice:format(lang:get("~ts获得~ts"),
                                                         [{role_1, Id, RName},
                                                          {item_2, ItemId}]),
                                    team:notice(Role1, Msg2),
                                    Title = lang:get("彩虹BOSS奖励"),
                                    Content = lang:get("背包已满，奖励通过邮件发送，请查收。"),
                                    mail:send(Role1,
                                              #{title => Title,
                                                content => Content,
                                                items =>
                                                    [{ItemId, 0, ItemNum}]}),
                                    {ok, ItemId, Role1};
                                {false, #gain{msg = Msg}} -> {false, Msg};
                                Else -> Else
                            end;
                        _ -> {false, lang:get("没有奖励")}
                    end;
                _Cfg ->
                    logger:debug("奖励 ~w", [_Cfg], fairyland, 707),
                    {false, lang:get("没有奖励")}
            end;
        _ -> {false, lang:get("没有奖励")}
    end.

update_roll_counter(Id) ->
    Add = case ets:lookup(fairyland_roll, Id) of
              [] -> 0;
              [{_, A}] -> A
          end,
    logger:debug("增加点 ~w", [Add], fairyland, 720),
    NewAdd = min(8, Add + 4),
    ets:insert(fairyland_roll, {Id, NewAdd}),
    Add.

update_roll_crystal(Id, AddVal) ->
    OldVal = case ets:lookup(fairyland_roll_crystal, Id) of
                 [] -> 0;
                 [{_, A}] -> A
             end,
    ets:insert(fairyland_roll_crystal,
               {Id, min(OldVal + AddVal, 300)}).

check_crystall_val(Id, AddVal) ->
    OldVal = case ets:lookup(fairyland_roll_crystal, Id) of
                 [] -> 0;
                 [{_, A}] -> A
             end,
    max(0, min(300 - OldVal, AddVal)).

reset_roll_counter(Id) ->
    ets:insert(fairyland_roll, {Id, 0}).

use_item(#role{s_event = Event}, _) when Event =/= 6 ->
    {false, lang:get("你不在彩虹中")};
use_item(Role = #role{m_fairyland =
                          #m_fairyland{floor = Floor}},
         random_floor) ->
    case team:get_status(Role) of
        {true, 2} -> {false, lang:get("你在跟随队伍中呢")};
        _ ->
            Start = max(1, Floor - 3),
            End = min(12, Floor + 2),
            NewFloor = util:rand_list(lists:seq(Start, End) --
                                          [0, Floor]),
            case ets:lookup(fairyland_floor, Floor) of
                [#fairyland_floor{forward_envoy = BaseId}]
                    when Floor =/= 12 ->
                    do_teleport(Role, NewFloor, BaseId);
                _ -> do_teleport(Role, NewFloor, 0)
            end
    end;
use_item(#role{m_fairyland =
                   #m_fairyland{floor = Floor}},
         add_enemy) ->
    case Floor > 0 of
        true ->
            fairyland ! {add_enemy, Floor},
            ok;
        _ -> {false, lang:get("这里不能召唤")}
    end;
use_item(#role{m_fairyland =
                   #m_fairyland{floor = Floor}},
         add_box) ->
    case Floor > 0 of
        true ->
            fairyland ! {add_box, Floor},
            ok;
        _ -> {false, lang:get("这里不能召唤")}
    end;
use_item(Role = #role{m_fairyland =
                          FairyLand = #m_fairyland{floor = Floor,
                                                   forward_envoys = Envoys,
                                                   keys = Keys}},
         find_forward) ->
    case ets:lookup(fairyland_floor, Floor) of
        [#fairyland_floor{forward_envoy = BaseId}] ->
            NewEnvoys = lists:keystore(Floor,
                                       1,
                                       Envoys,
                                       {Floor, BaseId}),
            Role1 = Role#role{m_fairyland =
                                  FairyLand#m_fairyland{forward_envoys =
                                                            NewEnvoys}},
            push(Role1, 14603),
            team:leader_async(Role1,
                              {fairyland,
                               role_callback,
                               [{sync_team, Keys, Floor, NewEnvoys}]}),
            case Floor of
                12 -> ok;
                _ ->
                    Msg = notice:format(lang:get("彩虹幻境通往~ts层的正确传送使者是~ts"),
                                        [{string_2, 1, Floor + 1},
                                         {unit_1, BaseId}]),
                    team:notice(Role1, Msg)
            end,
            {ok, Role1};
        _ -> {false, lang:get("活动还没开始")}
    end.

info(status) ->
    gen_fsm:sync_send_all_state_event(fairyland,
                                      info_status).

reload() -> fairyland ! reload.

push(#role{link = #link{conn_pid = ConnPid}},
     Cmd = 14600) ->
    Data = info(status),
    sys_conn:pack_send(ConnPid, Cmd, Data);
push(#role{m_fairyland = FairyLand,
           link = #link{conn_pid = ConnPid}},
     Cmd = 14603) ->
    sys_conn:pack_send(ConnPid, Cmd, {FairyLand}).

push(#role{link = #link{conn_pid = ConnPid}},
     Cmd = 14604, Data) ->
    sys_conn:pack_send(ConnPid, Cmd, Data);
push(#role{link = #link{conn_pid = ConnPid}},
     Cmd = 14606, Data) ->
    sys_conn:pack_send(ConnPid, Cmd, Data);
push(#role{link = #link{conn_pid = ConnPid}},
     Cmd = 14605, Data) ->
    sys_conn:pack_send(ConnPid, Cmd, Data).

gm(Role = #role{s_event = 6}, {teleport, Floor}) ->
    case ets:lookup(fairyland_floor, max(1, Floor - 1)) of
        [#fairyland_floor{forward_envoy = BaseId}] ->
            do_teleport(Role, Floor, BaseId);
        _ -> {false, lang:get("呆在原地吧")}
    end;
gm(Role = #role{s_event = 6,
                m_fairyland =
                    FairyLand = #m_fairyland{floor = Floor,
                                             forward_envoys = Envoys}},
   {gen_keys, Num}) ->
    NewKeys = [{K, Num} || K <- lists:seq(1, 3)],
    Role2 = Role#role{m_fairyland =
                          FairyLand#m_fairyland{keys = NewKeys}},
    team:leader_async(Role2,
                      {fairyland,
                       role_callback,
                       [{sync_team, NewKeys, Floor, Envoys}]}),
    push(Role2, 14603),
    {ok, Role2};
gm(_Role, _) -> {false, lang:get("无效命令")}.

start_link() ->
    gen_fsm:start_link({local, fairyland},
                       fairyland,
                       [],
                       []).

init([]) ->
    logger:info("开始启动...", [], fairyland, 855),
    ets:new(fairyland_floor,
            [set,
             named_table,
             public,
             {keypos, #fairyland_floor.id}]),
    ets:new(fairyland_role,
            [set,
             named_table,
             public,
             {keypos, #fairyland_role.id}]),
    ets:new(fairyland_hit,
            [set, named_table, public, {keypos, 1}]),
    ets:new(fairyland_roll,
            [set, named_table, public, {keypos, 1}]),
    ets:new(fairyland_roll_crystal,
            [set, named_table, public, {keypos, 1}]),
    {StateName, Timeout} = get_state(),
    ExpRef = erlang:send_after(60000, self(), add_exp),
    State = #state{ts = now(), timeout = Timeout,
                   exp_ref = ExpRef},
    NewState = case StateName of
                   notice ->
                       create_maps([0, 99]),
                       State;
                   active ->
                       create_maps([0, 99]),
                       create_maps(),
                       Ref = erlang:send_after(180000, self(), gen_monster),
                       BossRef = erlang:send_after(1800000, self(), gen_boss),
                       State#state{gen_ref = Ref, boss_ref = BossRef};
                   _ -> State
               end,
    logger:info("启动完成 state_name: ~w, timeout: ~w",
                [StateName, Timeout],
                fairyland,
                880),
    {ok, StateName, NewState, Timeout}.

handle_event(_Event, StateName, State) ->
    continue(StateName, State).

handle_sync_event({login,
                   FRole = #fairyland_role{id = Id, pid = Pid}},
                  _From, StateName, State) ->
    Reply = case StateName =:= notice orelse
                     StateName =:= active
                of
                true ->
                    case ets:lookup(fairyland_role, Id) of
                        [O = #fairyland_role{}] ->
                            save(O#fairyland_role{pid = Pid});
                        _ -> save(FRole)
                    end,
                    ok;
                _ -> false
            end,
    continue(Reply, StateName, State);
handle_sync_event({join,
                   FRole = #fairyland_role{id = Id, pid = Pid}},
                  _From, StateName, State) ->
    Reply = case ets:lookup(fairyland_floor, 0) of
                [#fairyland_floor{map_id = MapId,
                                  map_base_id = MapBaseId}] ->
                    case get_enter_pos(MapBaseId) of
                        {ok, X, Y} ->
                            {NewEnvoys, NewExp} = case
                                                      ets:lookup(fairyland_role,
                                                                 Id)
                                                      of
                                                      [Old =
                                                           #fairyland_role{forward_envoys
                                                                               =
                                                                               Envoys,
                                                                           exp =
                                                                               Exp}] ->
                                                          save(Old#fairyland_role{pid
                                                                                      =
                                                                                      Pid}),
                                                          {Envoys, Exp};
                                                      _ ->
                                                          save(FRole),
                                                          {[], 0}
                                                  end,
                            {true, {MapId, X, Y}, NewEnvoys, NewExp};
                        _ -> {false, lang:get("进不去")}
                    end;
                _ ->
                    logger:debug("找不到准备区", [], fairyland, 919),
                    {false, lang:get("活动还没开始")}
            end,
    continue(Reply, StateName, State);
handle_sync_event(info_status, _From, StateName,
                  State = #state{ts = Ts, timeout = Timeout}) ->
    St = case StateName of
             notice -> 1;
             active -> 2;
             _ -> 0
         end,
    Rest = util:time_left(Timeout, Ts),
    Reply = {St, Rest div 1000},
    continue(Reply, StateName, State);
handle_sync_event(_Event, _From, StateName, State) ->
    logger:debug("未知消息 ~w", [_Event], fairyland, 934),
    Reply = false,
    continue(Reply, StateName, State).

handle_info({logout, Id}, StateName, State) ->
    case ets:lookup(fairyland_role, Id) of
        [FRole = #fairyland_role{}] ->
            save(FRole#fairyland_role{pid = 0});
        _ -> ok
    end,
    continue(StateName, State);
handle_info({teleport, Id, Floor, BaseId}, StateName,
            State) ->
    case ets:lookup(fairyland_role, Id) of
        [FRole = #fairyland_role{forward_envoys = Envoys}] ->
            FRole1 = FRole#fairyland_role{forward_envoys =
                                              lists:keystore(Floor,
                                                             1,
                                                             Envoys,
                                                             {Floor, BaseId})},
            save(FRole1);
        _ -> ok
    end,
    continue(StateName, State);
handle_info({teleport, Id, Floor, BaseId, Mates},
            StateName, State) ->
    case ets:lookup(fairyland_role, Id) of
        [FRole = #fairyland_role{forward_envoys = Envoys}] ->
            FRole1 = FRole#fairyland_role{forward_envoys =
                                              lists:keystore(Floor,
                                                             1,
                                                             Envoys,
                                                             {Floor, BaseId})},
            save(FRole1);
        _ -> ok
    end,
    case ets:info(fairyland_hit, size) of
        N = 2 ->
            case check_arrived(Mates) of
                Mates1 = [{Id, Name} | _] ->
                    Msg =
                        notice:format(lang:get("~ts的队伍第~ts个达到彩虹第12层，获得了丰厚奖励。大家加油冲刺啦"),
                                      [{role_1, Id, Name},
                                       {string_2, 6, N + 1}]),
                    notice:cast(all, 5, Msg),
                    ets:insert(fairyland_hit, {N + 1, Mates1}),
                    reward_sprinting(Mates1, N + 1);
                _ -> ok
            end;
        N when N < 3 ->
            case check_arrived(Mates) of
                Mates1 = [{Id, Name} | _] ->
                    Msg =
                        notice:format(lang:get("~ts的队伍第~ts个达到彩虹第12层，获得了丰厚奖励。目前还剩~ts个名额，大家加油冲刺啦"),
                                      [{role_1, Id, Name},
                                       {string_2, 6, N + 1},
                                       {string_2, 6, 3 - N - 1}]),
                    notice:cast(all, 5, Msg),
                    ets:insert(fairyland_hit, {N + 1, Mates1}),
                    reward_sprinting(Mates1, N + 1);
                _ -> ok
            end;
        _ -> ok
    end,
    continue(StateName, State);
handle_info({follow_join,
             FRole = #fairyland_role{id = Id, pid = Pid}},
            StateName, State) ->
    case ets:lookup(fairyland_floor, 0) of
        [#fairyland_floor{}] ->
            case ets:lookup(fairyland_role, Id) of
                [Old = #fairyland_role{}] ->
                    save(Old#fairyland_role{pid = Pid});
                _ ->
                    save(FRole),
                    []
            end;
        _ ->
            logger:debug("找不到准备区", [], fairyland, 1001),
            ok
    end,
    continue(StateName, State);
handle_info(gen_monster, active,
            State = #state{gen_ref = OldRef}) ->
    case erlang:is_reference(OldRef) of
        true -> erlang:cancel_timer(OldRef);
        _ -> ok
    end,
    complement_units(),
    Ref = erlang:send_after(180000, self(), gen_monster),
    NewState = State#state{gen_ref = Ref},
    continue(active, NewState);
handle_info(gen_monster, StateName, State) ->
    continue(StateName, State);
handle_info({add_enemy, Floor}, active, State) ->
    add_enemy(Floor),
    continue(active, State);
handle_info({add_enemy, _}, StateName, State) ->
    continue(StateName, State);
handle_info({add_box, Floor}, active, State) ->
    add_box(Floor),
    continue(active, State);
handle_info({add_box, _}, StateName, State) ->
    continue(StateName, State);
handle_info(gen_boss, active,
            State = #state{boss_ref = OldRef,
                           boss_floors = Floors}) ->
    case erlang:is_reference(OldRef) of
        true -> erlang:cancel_timer(OldRef);
        _ -> ok
    end,
    logger:debug("boss时间", [], fairyland, 1037),
    NewFloors = create_boss(Floors),
    case NewFloors of
        [FloorA, FloorB] ->
            Msg =
                notice:format(lang:get("~ts彩虹boss出现在彩虹第~ts层和第~ts层啦，拿起你们的武器！进攻！"),
                              [{string_2, 1, lang:get("彩虹冒险")},
                               {string_2, 5, FloorA},
                               {string_2, 5, FloorB}]),
            notice:cast(all, 5, Msg);
        _ -> ok
    end,
    Ref = erlang:send_after(600000, self(), gen_boss),
    NewState = State#state{boss_ref = Ref,
                           boss_floors = NewFloors},
    continue(active, NewState);
handle_info(gen_boss, StateName, State) ->
    continue(StateName, State);
handle_info({kill_boss, Floor, Leader}, active,
            State = #state{boss_floors = Floors}) ->
    case Leader of
        [{_Rid, RName} | _] ->
            logger:debug("~w", [Leader], fairyland, 1055),
            Msg2 =
                notice:format(lang:get("~ts第~ts层的BOSS~ts被惨无人道的欺负了，宝物被~ts的队伍抢走了。(??`ω′?)"),
                              [{string_2, 1, lang:get("彩虹冒险")},
                               {string_2, 1, Floor},
                               {unit_1, 79619},
                               {role_2, RName}]),
            notice:cast(all, 5, Msg2);
        _ -> ok
    end,
    NewFloors = Floors -- [Floor],
    logger:debug("击杀boss ~w", [Floor], fairyland, 1062),
    NewState = State#state{boss_floors = NewFloors},
    continue(active, NewState);
handle_info({kill_boss, _, _}, StateName, State) ->
    continue(StateName, State);
handle_info({box_boss_reward, Id}, active, State) ->
    case ets:lookup(fairyland_role, Id) of
        [R = #fairyland_role{box_boss_rewarded = Rewarded}] ->
            save(R#fairyland_role{box_boss_rewarded =
                                      Rewarded + 1});
        _ ->
            save(#fairyland_role{id = Id, box_boss_rewarded = 1})
    end,
    continue(active, State);
handle_info({box_boss_reward, _}, StateName, State) ->
    continue(StateName, State);
handle_info(add_exp, notice,
            State = #state{exp_ref = OldRef}) ->
    case ets:lookup(fairyland_floor, 0) of
        [#fairyland_floor{map_pid = MapPid}] ->
            map:async_apply(MapPid,
                            {fairyland, role_callback, [add_exp]});
        _ ->
            logger:debug("找不到准备区", [], fairyland, 1087),
            ok
    end,
    case erlang:is_reference(OldRef) of
        true -> erlang:cancel_timer(OldRef);
        _ -> ok
    end,
    NewRef = erlang:send_after(60000, self(), add_exp),
    State1 = State#state{exp_ref = NewRef},
    continue(notice, State1);
handle_info(add_exp, StateName, State) ->
    continue(StateName, State);
handle_info({update_exp, Id, NewExp}, notice, State) ->
    case ets:lookup(fairyland_role, Id) of
        [R = #fairyland_role{}] ->
            save(R#fairyland_role{exp = NewExp});
        _ -> ok
    end,
    continue(notice, State);
handle_info({update_exp, _, _}, StateName, State) ->
    continue(StateName, State);
handle_info(reload, StateName, State)
    when StateName =:= idle ->
    {_, Tt} = agenda:get_state_timeout(2006, 600),
    Timeout = Tt * 1000,
    NewState = State#state{ts = now(), timeout = Timeout,
                           boss_floors = []},
    logger:info("重载彩虹活动,倒计时:~w秒", [Tt], fairyland, 1124),
    continue(idle, NewState);
handle_info(_Info, StateName, State) ->
    logger:debug("未知消息 ~w", [_Info], fairyland, 1128),
    continue(StateName, State).

terminate(_Reason, _StateName, _State) -> ok.

code_change(_OldVsn, StateName, State, _Extra) ->
    {ok, StateName, State}.

idle(timeout, State = #state{exp_ref = OldRef}) ->
    ets:delete_all_objects(fairyland_role),
    ets:delete_all_objects(fairyland_hit),
    ets:delete_all_objects(fairyland_roll),
    ets:delete_all_objects(fairyland_roll_crystal),
    case env:get(fairyland_roll_pool) of
        Pool when is_integer(Pool) ->
            logger:debug("旧珍兽奖池系数 ~w", [Pool], fairyland, 1150),
            env:save(fairyland_roll_pool, Pool + 1);
        _ -> env:save(fairyland_roll_pool, 1)
    end,
    case erlang:is_reference(OldRef) of
        true -> erlang:cancel_timer(OldRef);
        _ -> ok
    end,
    ExpRef = erlang:send_after(60000, self(), add_exp),
    State1 = State#state{ts = now(), timeout = 600 * 1000,
                         exp_ref = ExpRef, boss_floors = []},
    create_maps([0, 99]),
    Msg =
        notice:format(lang:get("~ts活动10分钟后将开启，大家赶紧拉起小伙伴的手，准备去寻宝啦"),
                      [{string_2, 1, lang:get("彩虹冒险")}]),
    notice:cast(all, 8, Msg),
    role_group:pack_send(world, 14600, {1, 600}),
    continue(notice, State1);
idle(_, State) -> continue(idle, State).

notice(timeout,
       State = #state{gen_ref = OldRef,
                      boss_ref = OldBossRef}) ->
    case erlang:is_reference(OldRef) of
        true -> erlang:cancel_timer(OldRef);
        _ -> ok
    end,
    case erlang:is_reference(OldBossRef) of
        true -> erlang:cancel_timer(OldBossRef);
        _ -> ok
    end,
    Ref = erlang:send_after(180000, self(), gen_monster),
    BossRef = erlang:send_after(1800000, self(), gen_boss),
    State1 = State#state{ts = now(), timeout = 3600 * 1000,
                         gen_ref = Ref, boss_ref = BossRef},
    create_maps(),
    Msg =
        notice:format(lang:get("~ts活动开始啦，大家赶紧冲冲冲！！不然宝物就被别人抢走喽！！"),
                      [{string_2, 1, lang:get("彩虹冒险")}]),
    notice:cast(all, 8, Msg),
    role_group:pack_send(world, 14600, {2, 3600}),
    continue(active, State1);
notice(_, State) -> continue(notice, State).

active(timeout, State) ->
    all_quit(),
    stop_maps(),
    {_, Tt} = agenda:get_state_timeout(2006, 600),
    Timeout = Tt * 1000,
    NewState = State#state{ts = now(), timeout = Timeout,
                           boss_floors = []},
    reward_hit_honor(),
    Msg = notice:format(lang:get("~ts活动结束啦！！感谢大家的踊跃参与！！"),
                        [{string_2, 1, lang:get("彩虹冒险")}]),
    notice:cast(all, 8, Msg),
    role_group:pack_send(world, 14600, {0, Timeout}),
    role_group:apply(world,
                     {fairyland, role_callback, [clean_iteams]}),
    raffle:switch(1),
    logger:debug("下次开始时间 ~w", [Timeout], fairyland, 1218),
    continue(idle, NewState);
active(_, State) -> continue(active, State).

do_teleport(Role = #role{m_fairyland =
                             FairyLand = #m_fairyland{floor = Floor,
                                                      forward_envoys = Envoys,
                                                      keys = Keys},
                         name = Name, id = Id},
            NewFloor, BaseId) ->
    case ets:lookup(fairyland_floor, NewFloor) of
        [#fairyland_floor{map_id = MapId,
                          map_base_id = MapBaseId}] ->
            case get_enter_pos(MapBaseId) of
                {ok, X, Y} ->
                    NewEnvoys = case NewFloor > Floor of
                                    true ->
                                        lists:keystore(Floor,
                                                       1,
                                                       Envoys,
                                                       {Floor, BaseId});
                                    _ -> Envoys
                                end,
                    Role1 = Role#role{m_fairyland =
                                          FairyLand#m_fairyland{forward_envoys =
                                                                    NewEnvoys,
                                                                floor =
                                                                    NewFloor}},
                    case map:role_enter({MapId, X, Y}, Role1) of
                        {error, Reason} ->
                            logger:error("[~s]进入地图失败:~w",
                                         [Name, Reason],
                                         fairyland,
                                         1246),
                            {false, lang:get("进入地图失败")};
                        {ok, NewRole} ->
                            EnterMsg = notice:format(lang:get("你已进入彩虹~ts层"),
                                                     [{string_2, 1, NewFloor}]),
                            case team:get_status(Role) of
                                {true, 1} -> team:notice(Role, EnterMsg);
                                _ -> notice:send(Role, 3, EnterMsg)
                            end,
                            case BaseId =/= 0 andalso NewFloor > Floor of
                                true ->
                                    case team:get_status(NewRole) of
                                        {true, 2} ->
                                            fairyland !
                                                {teleport, Id, Floor, BaseId};
                                        _ when NewFloor =:= 12 ->
                                            case team:get_members(NewRole) of
                                                Mates when is_list(Mates) ->
                                                    Mates1 = [{MId, MName}
                                                              || #team_mate{id =
                                                                                MId,
                                                                            name
                                                                                =
                                                                                MName}
                                                                     <- Mates],
                                                    fairyland !
                                                        {teleport,
                                                         Id,
                                                         Floor,
                                                         BaseId,
                                                         [{Id, Name} | Mates1]};
                                                _ ->
                                                    fairyland !
                                                        {teleport,
                                                         Id,
                                                         Floor,
                                                         BaseId,
                                                         [{Id, Name}]}
                                            end;
                                        _ ->
                                            fairyland !
                                                {teleport, Id, Floor, BaseId}
                                    end;
                                _ -> ok
                            end,
                            push(NewRole, 14603),
                            team:leader_async(NewRole,
                                              {fairyland,
                                               role_callback,
                                               [{sync_team,
                                                 Keys,
                                                 NewFloor,
                                                 NewEnvoys}]}),
                            {ok,
                             role_trigger:fire(#evt_fairyland_floor{floor =
                                                                        NewFloor,
                                                                    is_leader =
                                                                        1},
                                               NewRole)}
                    end;
                _ -> {false, lang:get("进不去")}
            end;
        _ when Floor =:= 0 -> {false, lang:get("活动还没开始，请稍等")};
        _ -> {false, lang:get("没有下一层了")}
    end.

get_state() ->
    {StateName, Timeout} = case
                               agenda:get_state_timeout(2006, 600)
                               of
                               {idle, Tt} -> {idle, Tt};
                               {notice, _} -> {notice, 600};
                               {active, _} -> {active, 3600}
                           end,
    {StateName, Timeout * 1000}.

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

create_maps() ->
    [_ | L] = fairyland_data:list() -- [99],
    create_maps(L).

create_maps([]) -> [];
create_maps([Id | T]) ->
    case fairyland_data:get(Id) of
        Cfg = #{id := 99, map := MapBaseId} ->
            create_units(guide, MapBaseId, Cfg),
            create_maps(T);
        Cfg = #{map := MapBaseId, neutral_unit := Neutrals} ->
            case map_mgr:create(MapBaseId) of
                {ok, MapPid, MapId} when Id =:= 0 ->
                    Forward = util:rand_list(Neutrals),
                    Floor = #fairyland_floor{id = Id, map_id = MapId,
                                             map_pid = MapPid,
                                             map_base_id = MapBaseId,
                                             forward_envoy = Forward},
                    create_units(guide, MapId, Cfg),
                    ets:insert(fairyland_floor, Floor),
                    create_maps(T);
                {ok, MapPid, MapId} ->
                    Forward = util:rand_list(Neutrals),
                    Floor = #fairyland_floor{id = Id, map_id = MapId,
                                             map_pid = MapPid,
                                             map_base_id = MapBaseId,
                                             forward_envoy = Forward},
                    create_units(box_boss, MapId, Cfg),
                    create_units(MapId, Cfg),
                    ets:insert(fairyland_floor, Floor),
                    create_maps(T);
                {error, Err} ->
                    logger:error("id : ~w 创建地图失败: ~w",
                                 [Id, Err],
                                 fairyland,
                                 1333),
                    create_maps(T)
            end;
        _ ->
            logger:error("id : ~w 找不到配置", [Id], fairyland, 1337),
            create_maps(T)
    end.

stop_maps() ->
    case fairyland_data:get(99) of
        #{neutral_unit := GuildUnits} ->
            unit_mgr:remove([{10, GUid} || GUid <- GuildUnits]);
        _ -> ok
    end,
    lists:foreach(fun (#fairyland_floor{map_pid = Pid}) ->
                          remove_units(Pid),
                          map:stop(Pid)
                  end,
                  ets:tab2list(fairyland_floor)),
    ets:delete_all_objects(fairyland_floor).

create_units(MapId,
             Cfg = #{enemy_unit := EnemyUnit,
                     box_unit := BoxUnits}) ->
    create_units(neutral, MapId, Cfg),
    OnlineFac = ets:info(fairyland_role, size),
    NewEnemyUnit = [{UUid,
                     calc_enemy_num(UCardinal, OnlineFac)}
                    || {UUid, UCardinal} <- EnemyUnit, UCardinal > 0],
    create_units(enemy,
                 MapId,
                 Cfg#{enemy_unit := NewEnemyUnit}),
    NewBoxUnits = [{BUid, calc_box_num(Cardinal, OnlineFac)}
                   || {BUid, Cardinal} <- BoxUnits, Cardinal > 0],
    logger:debug("有宝箱 ~w", [NewBoxUnits], fairyland, 1361),
    create_units(box, MapId, Cfg#{box_unit := NewBoxUnits});
create_units(MapId, Cfg = #{neutral_unit := _}) ->
    create_units(neutral, MapId, Cfg).

create_units(neutral, _MapId, #{neutral_unit := []}) ->
    ok;
create_units(neutral, _MapId,
             #{neutral_location := []}) ->
    ok;
create_units(guide, _MapId, #{neutral_unit := []}) ->
    ok;
create_units(guide, _MapId,
             #{neutral_location := []}) ->
    ok;
create_units(box, _MapId, #{box_unit := []}) -> ok;
create_units(enemy, _MapId, #{enemy_unit := []}) -> ok;
create_units(neutral, MapId,
             Cfg = #{neutral_unit := [UnitId | T],
                     neutral_location := Location}) ->
    {X, Y} = util:rand_list(Location),
    unit_mgr:create(10, UnitId, {MapId, X, Y}),
    create_units(neutral,
                 MapId,
                 Cfg#{neutral_unit := T,
                      neutral_location := Location -- [{X, Y}]});
create_units(_, _MapId, #{num := Num}) when Num < 1 ->
    ok;
create_units(guide, MapId,
             Cfg = #{neutral_unit := [UnitId | T],
                     neutral_location := Location}) ->
    {X, Y} = util:rand_list(Location),
    unit_mgr:create({10, UnitId}, UnitId, {MapId, X, Y}),
    create_units(guide,
                 MapId,
                 Cfg#{neutral_unit := T,
                      neutral_location := Location -- [{X, Y}]});
create_units(_, _MapId, #{num := Num}) when Num < 1 ->
    ok;
create_units(enemy, MapId,
             Cfg = #{map := MapBaseId,
                     enemy_unit := [{UnitId, Num} | Units]}) ->
    case Num > 0 of
        true ->
            {X, Y} = map:rand_pos(MapBaseId),
            unit_mgr:create(10, UnitId, {MapId, X, Y});
        _ -> ok
    end,
    case Num > 1 of
        true ->
            create_units(enemy,
                         MapId,
                         Cfg#{enemy_unit := [{UnitId, Num - 1} | Units]});
        _ ->
            create_units(enemy, MapId, Cfg#{enemy_unit := Units})
    end;
create_units(box, MapId,
             Cfg = #{map := MapBaseId,
                     box_unit := [{UnitId, Num} | Units]}) ->
    case Num > 0 of
        true ->
            {X, Y} = map:rand_pos(MapBaseId),
            unit_mgr:create(10, UnitId, {MapId, X, Y});
        _ -> ok
    end,
    case Num > 1 of
        true ->
            create_units(box,
                         MapId,
                         Cfg#{box_unit := [{UnitId, Num - 1} | Units]});
        _ -> create_units(box, MapId, Cfg#{box_unit := Units})
    end;
create_units(box_boss, MapId,
             #{map := _MapBaseId, id := 12}) ->
    {X, Y} = {2900, 2222},
    unit_mgr:create(10, 79630, {MapId, X, Y}),
    ok;
create_units(box_boss, _MapId, _Cfg) -> ok.

remove_units(Pid) ->
    case map:unit_list(Pid) of
        {ok, L} ->
            lists:foreach(fun (#map_unit{id = Id}) ->
                                  unit_mgr:remove(Id)
                          end,
                          L);
        _ -> ok
    end.

complement_units() ->
    complement_units(ets:tab2list(fairyland_floor)).

complement_units([]) -> ok;
complement_units([#fairyland_floor{map_pid = MapPid,
                                   map_id = MapId, id = Id}
                  | T]) ->
    case fairyland_data:get(Id) of
        Cfg = #{enemy_unit := EnemyUnit, box_unit := BoxUnit} ->
            case map:unit_list(MapPid) of
                {ok, L} ->
                    EnemyIds = [EI || {EI, _} <- EnemyUnit],
                    clear_units(L, [BI || {BI, _} <- BoxUnit] ++ EnemyIds),
                    create_units(MapId, Cfg#{neutral_unit := []}),
                    complement_units(T);
                Err ->
                    logger:error("id : ~w 找不到单位: ~w",
                                 [Id, Err],
                                 fairyland,
                                 1451),
                    create_units(MapId, Cfg#{neutral_unit := []}),
                    complement_units(T)
            end;
        _ ->
            case Id of
                0 -> ok;
                _ ->
                    logger:error("id : ~w 找不到配置", [Id], fairyland, 1459)
            end,
            complement_units(T)
    end.

add_trigger([], Role, Triggers) -> {Role, Triggers};
add_trigger([Label | T], Role, Triggers) ->
    case lists:keyfind(Label, 1, Triggers) of
        {Label, _} -> add_trigger(T, Role, Triggers);
        _ ->
            {TriId, Role1} = role_trigger:add(#trigger{label =
                                                           Label,
                                                       m = fairyland,
                                                       f = evt_callback,
                                                       a = []},
                                              Role),
            add_trigger(T, Role1, [TriId | Triggers])
    end.

remove_trigger(all, Triggers, Role) ->
    Role0 = role_trigger:del(Triggers, Role),
    {Role0, []};
remove_trigger(Label, Triggers, Role) ->
    TriIds = [Tid
              || Tid = {Lb, _} <- Triggers, Lb =:= Label],
    Role0 = role_trigger:del(TriIds, Role),
    {Role0,
     [One || One = {OLb, _} <- Triggers, OLb =/= Label]}.

save(D = #fairyland_role{}) ->
    ets:insert(fairyland_role, D).

check_fight([], _) -> ok;
check_fight([#map_unit{x = Ux, y = Uy, id = UnitId}
             | T],
            Role = #role{id = {_, P, Z}, pos = #pos{x = X, y = Y}})
    when abs(Ux - X) < 100 andalso abs(Uy - Y) < 100 ->
    case unit_mgr:info(P, Z, UnitId) of
        {ok, Unit = #unit{fun_type = 16}} ->
            case combat_mgr:check_self(18, Role, Unit) of
                true ->
                    case team:get_fighters(Role) of
                        {ok, Mates} ->
                            _Res = combat_mgr:start_combat(18, Mates, Unit),
                            logger:debug("开战结果 ~w", [_Res], fairyland, 1498),
                            ok;
                        _Else ->
                            logger:debug("开战结果 ~w", [_Else], fairyland, 1501),
                            ok
                    end;
                _ -> check_fight(T, Role)
            end;
        _ -> check_fight(T, Role)
    end;
check_fight([_ | T], Role) -> check_fight(T, Role).

all_quit() -> all_quit(ets:tab2list(fairyland_role)).

all_quit([]) -> ok;
all_quit([#fairyland_role{pid = Pid} | T])
    when is_pid(Pid) ->
    role:apply(async,
               Pid,
               {fairyland, role_callback, [quit]}),
    all_quit(T);
all_quit([_ | T]) -> all_quit(T).

check_keys([], _) -> {false, lang:get("没有这个宝箱的钥匙呢")};
check_keys([{K, _N} | T], BaseId) ->
    case lists:member(BaseId, key_to_box(K)) of
        true -> {ok, K, []};
        _ -> check_keys(T, BaseId)
    end.

key_to_box(1) -> [79640];
key_to_box(2) -> [79640, 79641];
key_to_box(3) -> [79640, 79641, 79642, 79643];
key_to_box(_) -> [].

create_boss(Floors = [_, _]) -> Floors;
create_boss(Floors) ->
    Possibles = [P
                 || P = {Fl, _} <- fairyland_data:get_boss_floor(),
                    lists:member(Fl, Floors) =/= true],
    {Floor, _} = util:rand_list(Possibles, 2),
    case ets:lookup(fairyland_floor, Floor) of
        [#fairyland_floor{map_id = MapId,
                          map_base_id = MapBaseId}] ->
            {X, Y} = map:rand_pos(MapBaseId),
            unit_mgr:create(10, 79619, {MapId, X, Y}),
            create_boss([Floor | Floors]);
        _ -> Floors
    end.

add_enemy(Id) ->
    case ets:lookup(fairyland_floor, Id) of
        [#fairyland_floor{map_pid = MapPid, map_id = MapId}] ->
            case fairyland_data:get(Id) of
                Cfg = #{enemy_unit := EnemyUnit} ->
                    case map:unit_list(MapPid) of
                        {ok, L} ->
                            EnemyIds = [EI || {EI, _} <- EnemyUnit],
                            clear_units(L, EnemyIds),
                            OnlineFac = ets:info(fairyland_role, size),
                            NewEnemyUnit = [{UUid,
                                             calc_enemy_num(UCardinal,
                                                            OnlineFac)}
                                            || {UUid, UCardinal} <- EnemyUnit,
                                               UCardinal > 0],
                            create_units(enemy,
                                         MapId,
                                         Cfg#{enemy_unit := NewEnemyUnit});
                        Err ->
                            logger:error("id : ~w 找不到单位: ~w",
                                         [Id, Err],
                                         fairyland,
                                         1570),
                            ok
                    end;
                _ ->
                    logger:error("id : ~w 找不到配置", [Id], fairyland, 1574),
                    ok
            end;
        _ -> ok
    end.

add_box(Id) ->
    case ets:lookup(fairyland_floor, Id) of
        [#fairyland_floor{map_pid = MapPid, map_id = MapId}] ->
            case fairyland_data:get(Id) of
                Cfg = #{box_unit := BoxUnit} ->
                    case map:unit_list(MapPid) of
                        {ok, L} ->
                            BoxIds = [BI || {BI, _} <- BoxUnit],
                            clear_units(L, BoxIds),
                            create_units(neutral, MapId, Cfg),
                            OnlineFac = ets:info(fairyland_role, size),
                            NewBoxUnits = [{BUid,
                                            calc_box_num(Cardinal, OnlineFac)}
                                           || {BUid, Cardinal} <- BoxUnit,
                                              Cardinal > 0],
                            logger:debug("有宝箱 ~w",
                                         [NewBoxUnits],
                                         fairyland,
                                         1592),
                            create_units(box,
                                         MapId,
                                         Cfg#{box_unit := NewBoxUnits});
                        Err ->
                            logger:error("id : ~w 找不到单位: ~w",
                                         [Id, Err],
                                         fairyland,
                                         1595),
                            ok
                    end;
                _ ->
                    logger:error("id : ~w 找不到配置", [Id], fairyland, 1599),
                    ok
            end;
        _ -> ok
    end.

check_team(Role = #role{m_team =
                            #m_team{pid = Pid, status = 1}})
    when is_pid(Pid) ->
    case team:get_members(Role) of
        TeamList = [_ | _] ->
            [Id || #team_mate{id = Id, status = 2} <- TeamList];
        _ -> []
    end;
check_team(_) -> [].

make_team_event(Role = #role{s_event = Event,
                             m_fairyland =
                                 #m_fairyland{forward_envoys = Envoys}}) ->
    case check_team(Role) of
        [] -> self;
        MateIds when Event =:= 6 ->
            #{label => enter_event, event => Event,
              role_ids => MateIds,
              mfa =>
                  {fairyland, role_callback, [{follow_join, Envoys}]}};
        MateIds ->
            #{label => exit_event, event => Event,
              role_ids => MateIds,
              mfa => {fairyland, role_callback, [follow_quit]}}
    end.

reward_sprinting([], _) -> ok;
reward_sprinting([{Id, _} | T], Order) ->
    case util:rand_list(fairyland_data:get_sprint_reward(),
                        item_weight)
        of
        #{item_id := ItemId, item_num := ItemNum} ->
            MailInfo = #{items => [{ItemId, 0, ItemNum}],
                         title => lang:get("彩虹冲刺12层奖励"),
                         content =>
                             notice:format(lang:get("恭喜你在彩虹冒险活动中以第~ts名的达到12层，表现优越，这是您的奖励，请查收."),
                                           [{string_2, 6, Order}])},
            mail:send(Id, MailInfo),
            reward_sprinting(T, Order);
        _ -> ok
    end.

key_to_name(1) -> lang:get("铜钥匙一把");
key_to_name(2) -> lang:get("银钥匙一把");
key_to_name(_) -> lang:get("金钥匙一把").

calc_box_num(Cardinal, Fac) ->
    min(8, max(1, round(Cardinal * Fac * 5 / 192 / 100))).

calc_enemy_num(Cardinal, Fac) ->
    min(8, max(4, round(Cardinal * Fac * 5 / 182 / 100))).

clear_units(L, Ids) ->
    lists:foreach(fun (#map_unit{base_id = BaseId,
                                 id = Uid}) ->
                          case lists:member(BaseId, Ids) of
                              true -> unit_mgr:remove(Uid);
                              _ -> ok
                          end
                  end,
                  L).

check_arrived(Mates) ->
    check_arrived(Mates,
                  lists:flatten([Hit
                                 || {_, Hit} <- ets:tab2list(fairyland_hit)])).

check_arrived([], _) -> [];
check_arrived([{Id, Name} | T], Arrived) ->
    case lists:keyfind(Id, 1, Arrived) of
        false -> [{Id, Name} | check_arrived(T, Arrived)];
        _ -> check_arrived(T, Arrived)
    end.

notice_gain(Role, Rewards) ->
    case [Val
          || #gain{label = item_base_id, val = Val} <- Rewards]
        of
        [] -> ok;
        L1 ->
            L2 = lists:flatten(L1),
            Msg = notice:format(lang:get("队长获得~ts"),
                                [{item_2, L2}]),
            team:notice(Role, Msg)
    end.

clean_iteams(Role2 = #role{p_bag = Bag,
                           link = #link{conn_pid = ConnPid}},
             IsPush) ->
    case package:del(by_base_id_all,
                     Bag,
                     [20078, 20079, 20080, 20081, 20082, 20084])
        of
        {ok, NewBag, DelList} ->
            case IsPush of
                push ->
                    package:push_item_info(del, ConnPid, [{1, DelList}]);
                _ -> ok
            end,
            Role2#role{p_bag = NewBag};
        _ -> Role2
    end.

check_punish(Role, BaseId) ->
    case
        util:rand_list(fairyland_data:get_box_reward(BaseId),
                       item_weight)
        of
        #{item_id := ItemId, item_num := ItemNum} ->
            logger:debug("惩罚id ~w", [ItemId], fairyland, 1698),
            case lists:member(ItemId, [1, 2, 3]) of
                true ->
                    Timer = #timer{id = fairyland_punish, timeout = 7000,
                                   times = 1, m = fairyland, f = role_callback,
                                   a = [{box_punish, ItemId, ItemNum}]},
                    NRole = role_timer:add(Timer, Role),
                    push(NRole, 14606, {BaseId, ItemId, ItemNum}),
                    team:leader_async(NRole,
                                      {fairyland,
                                       role_callback,
                                       [{show_punish,
                                         BaseId,
                                         ItemId,
                                         ItemNum}]}),
                    {ok, NRole};
                _ -> false
            end;
        _R ->
            logger:debug("没有惩罚 ~w", [_R], fairyland, 1709),
            false
    end.

box_punish(Role = #role{assets =
                            #assets{satiety = Satiety}},
           1, Num) ->
    Loss = format:val_to_loss([{90014, min(Num, Satiety)}]),
    case role_gain:do_notice(Loss, Role) of
        {ok, Role1} ->
            team:notice(Role,
                        notice:format(lang:get("不走运呐，队长踩到地上的葩葩，大家~ts"),
                                      [{string_2,
                                        1,
                                        util:flist(lang:get("饱食度-~w"),
                                                   [Num])}])),
            team:leader_async(Role1,
                              {fairyland,
                               role_callback,
                               [{punish_satiety, Num}]}),
            {ok, Role1};
        _ -> false
    end;
box_punish(Role, 2, Num) ->
    team:notice(Role,
                notice:format(lang:get("由于队长被一妹纸吸引，带着大家~ts了"),
                              [{string_2,
                                1,
                                util:flist(lang:get("回到第~w层"), [Num])}])),
    do_teleport(Role, Num, 0);
box_punish(Role = #role{m_fairyland =
                            #m_fairyland{floor = Floor}},
           3, Num) ->
    NewFloor = max(1, Floor - Num),
    team:notice(Role,
                notice:format(lang:get("队长打开宝箱发现里面是一马桶，带着大家~ts了"),
                              [{string_2,
                                1,
                                util:flist(lang:get("倒退~w层"), [Num])}])),
    do_teleport(Role, NewFloor, 0);
box_punish(_, _, _) -> false.

join_check([], _) -> true;
join_check([event | T], Role) ->
    case role_misc:check_event(Role, [6]) of
        true -> join_check(T, Role);
        Else -> Else
    end;
join_check([team | T], Role) ->
    case team:get_members(Role) of
        TeamList = [_ | _] ->
            case [{Id, Name}
                  || #team_mate{id = Id, name = Name, lev = Lev}
                         <- TeamList,
                     Lev < 30]
                of
                [] -> join_check(T, Role);
                Fails ->
                    {false,
                     notice:format(lang:get("队友~ts等级不足~ts，不能参与彩虹冒险"),
                                   [{role_1, Fails}, {string_2, 1, 30}])}
            end;
        _ -> join_check(T, Role)
    end.

fire_join_event(Role) ->
    case var:get_var(Role, day, 31, 0) of
        0 ->
            Role1 = var:acc_var(Role, day, 31),
            role_trigger:fire(#evt_fairyland{}, Role1);
        _ -> Role
    end.

reward_hit_honor() ->
    L1 = lists:flatten([[{I, 11047} || {I, _} <- Hit]
                        || {_, Hit} <- ets:tab2list(fairyland_hit)]),
    honor_mgr:replace(fairyland_hit, L1, 0).

get_enter_pos(70012) ->
    {X, Y} = util:rand_list([{3470, 1401},
                             {1102, 1487},
                             {866, 777},
                             {3276, 759},
                             {3200, 1966},
                             {886, 1949},
                             {2047, 1871},
                             {2056, 869},
                             {1533, 1286},
                             {2536, 1302},
                             {2530, 1789},
                             {1559, 1788}]),
    {ok, X, Y};
get_enter_pos(70005) ->
    {X, Y} = util:rand_list([{479, 829},
                             {1869, 740},
                             {2055, 328},
                             {591, 1580},
                             {2270, 1329},
                             {3251, 681},
                             {1507, 1774},
                             {3436, 1689}]),
    {ok, X, Y};
get_enter_pos(MapBaseId) ->
    case map_data:get(MapBaseId) of
        {ok, #map_data{revive = [{X, Y} | _]}} -> {ok, X, Y};
        _ -> false
    end.

