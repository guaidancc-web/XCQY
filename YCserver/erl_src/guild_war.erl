-file("src/mod/guild/guild_war.erl", 1).

-module(guild_war).

-behaviour(gen_fsm).

-export([start_link/1,
         login/1,
         handle_buff/1,
         logout/1,
         join/1,
         join_to_follow/2,
         leave/1,
         fight/2,
         combat_over/1,
         cast_enemy/3,
         check_gain/2,
         check_pick/2,
         pick_gain/2,
         info/1,
         get_member_results/1,
         get_join_guild/0,
         is_matched/0,
         is_opening/0,
         check_alliance/2,
         push/2,
         role_callback/2,
         role_callback/4,
         guild_callback/2,
         gm/1,
         get_guild_role_side/1,
         get_last_join_num/1,
         submit/3,
         cast_submit/0,
         call/1,
         cast/1,
         rank_reward/2,
         update_rank/0,
         m/1,
         world_all_leave/0,
         clean_data/0]).

-export([idle/2, ready/2, active/2, reward/2]).

-export([init/1,
         handle_event/3,
         handle_sync_event/4,
         handle_info/3,
         terminate/3,
         code_change/4]).

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

-file("src/mod/guild/guild_war.erl", 53).

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

-file("src/mod/guild/guild_war.erl", 54).

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

-file("src/mod/guild/guild_war.erl", 55).

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

-file("src/mod/guild/guild_war.erl", 56).

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

-file("src/mod/guild/guild_war.erl", 57).

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

-file("src/mod/guild/guild_war.erl", 58).

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

-file("src/mod/guild/guild_war.erl", 59).

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

-file("src/mod/guild/guild_war.erl", 60).

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

-file("src/mod/guild/guild_war.erl", 61).

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

-file("src/mod/guild/guild_war.erl", 62).

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

-file("src/mod/guild/guild_war.erl", 63).

-file("inc/link.hrl", 1).

-record(link,
        {socket :: undefined | port(),
         conn_pid :: undefined | pid(),
         ip = {0, 0, 0, 0} :: {0..255, 0..255, 0..255, 0..255},
         port = 0 :: non_neg_integer(),
         lag = 0 :: non_neg_integer()}).

-file("src/mod/guild/guild_war.erl", 64).

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

-file("src/mod/guild/guild_war.erl", 65).

-file("inc/attr.hrl", 1).

-record(attr_base,
        {type = 0 :: non_neg_integer(),
         name = 0 :: pos_integer(),
         flag = 0 :: non_neg_integer(),
         calc_type = 0 :: non_neg_integer(),
         val = 0 :: non_neg_integer()}).

-record(attr,
        {ver = 3,
         fc = 0 :: non_neg_integer(),
         speed = 260 :: pos_integer(),
         hp_max = 0 :: non_neg_integer(),
         mp_max = 0 :: non_neg_integer(),
         atk_speed = 0 :: non_neg_integer(),
         phy_dmg = 0 :: non_neg_integer(),
         magic_dmg = 0 :: non_neg_integer(),
         phy_def = 0 :: non_neg_integer(),
         magic_def = 0 :: non_neg_integer(),
         crit = 0 :: non_neg_integer(),
         tenacity = 0 :: non_neg_integer(),
         accuracy = 0 :: non_neg_integer(),
         evasion = 0 :: non_neg_integer(),
         holy_dmg = 0 :: non_neg_integer(),
         crit_dmg = 0 :: non_neg_integer(),
         crit_dmg_def = 0 :: non_neg_integer(),
         dmg_ratio = 0 :: non_neg_integer(),
         def_ratio = 0 :: non_neg_integer(),
         enhance_control = 0 :: non_neg_integer(),
         anti_control = 0 :: non_neg_integer(),
         escape = 0 :: non_neg_integer(),
         anti_escape = 0 :: non_neg_integer(),
         capture = 0 :: non_neg_integer(),
         phy_def_ratio = 0 :: non_neg_integer(),
         magic_def_ratio = 0 :: non_neg_integer(),
         phy_accuracy = 0 :: non_neg_integer(),
         magic_accuracy = 0 :: non_neg_integer(),
         phy_evasion = 0 :: non_neg_integer(),
         magic_evasion = 0 :: non_neg_integer(),
         phy_crit = 0 :: non_neg_integer(),
         magic_crit = 0 :: non_neg_integer(),
         phy_tenacity = 0 :: non_neg_integer(),
         magic_tenacity = 0 :: non_neg_integer(),
         heal_val = 0 :: non_neg_integer(),
         heal_ratio = 0 :: non_neg_integer(),
         eff_heal_ratio = 0 :: non_neg_integer(),
         phy_dmg_ratio = 0 :: non_neg_integer(),
         magic_dmg_ratio = 0 :: non_neg_integer(),
         strength = 0,
         constitution = 0,
         magic = 0,
         agility = 0,
         endurance = 0,
         exp_ratio = 0}).

-record(attr_calc,
        {attr :: undefined | #attr{},
         attr_no_ratio :: undefined | #attr{},
         ratio :: undefined | #attr{},
         attr_no_fc :: undefined | #attr{},
         ratio_no_fc :: undefined | #attr{}}).

-record(m_attr_point,
        {ver = 2,
         ext_point = [],
         first_free = 0,
         valid_plan = 1,
         plan_data = [],
         change_plan_times = 0}).

-record(attr_point_plan,
        {index = 1 :: pos_integer(),
         plan_name = [],
         strength = 0 :: pos_integer(),
         constitution = 0 :: non_neg_integer(),
         magic = 0 :: non_neg_integer(),
         agility = 0 :: non_neg_integer(),
         endurance = 0 :: non_neg_integer(),
         pre_str = 0,
         pre_con = 0,
         pre_magic = 0,
         pre_agi = 0,
         pre_end = 0}).

-file("src/mod/guild/guild_war.erl", 66).

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

-file("src/mod/guild/guild_war.erl", 67).

-file("inc/guild.hrl", 1).

-type guild_id() :: {non_neg_integer(),
                     list(),
                     non_neg_integer()}.

-record(guild_apply,
        {id = {0, "", 0},
         name = "",
         classes = 0,
         sex = 0,
         lev = 1,
         time = 0,
         type = 0,
         looks = [],
         cup = 0 :: non_neg_integer(),
         donation = 0 :: non_neg_integer(),
         tag = 0 :: non_neg_integer(),
         msg = "" :: string()}).

-record(guild_envelop,
        {ver = 1,
         title = "" :: string(),
         amount = 0 :: non_neg_integer(),
         remain = 0 :: non_neg_integer(),
         total = 0 :: non_neg_integer(),
         num = 0 :: non_neg_integer(),
         time = 0 :: non_neg_integer(),
         packs = [],
         log = [] :: list()}).

-record(guild_role,
        {id = {1, "", 0} ::
             {pos_integer(), list(), non_neg_integer()},
         pid :: undefined | pid(),
         name = "" :: list(),
         sex = 0 :: 0 | 1,
         classes = 0 :: 0..4,
         lev = 1 :: pos_integer(),
         lev_break_times = 0 :: non_neg_integer(),
         fc = 1 :: pos_integer(),
         synth_fc = 1 :: pos_integer(),
         post = 0 :: 0..5,
         status = 0 :: 0 | 1,
         last_login = 1 :: pos_integer(),
         last_logout = 1 :: pos_integer(),
         enter_time = 0 :: non_neg_integer(),
         signature = "" :: list(),
         value = 0,
         total_value = 0 :: non_neg_integer(),
         cup = 0 :: non_neg_integer(),
         looks = [],
         envelope = #guild_envelop{},
         requirement = [],
         signed = 0 :: non_neg_integer(),
         last_signed = 0 :: non_neg_integer(),
         mails = [],
         active = 0,
         ability = 0,
         chat_num = 0,
         doing = 0,
         chat_num_list = [],
         doing_list = [],
         element_attr = [] :: list(),
         tmp_element_attr = [] :: list()}).

-record(guild_leaver,
        {id = {1, "", 0} ::
             {pos_integer(), list(), non_neg_integer()},
         name = "" :: list(),
         guild_id = {1, "", 0} ::
             {pos_integer(), list(), non_neg_integer()},
         value = 0,
         total_value = 0 :: non_neg_integer(),
         time = 0 :: integer()}).

-record(guild_boss,
        {lev = 1 :: non_neg_integer(),
         step = 1 :: non_neg_integer(),
         unit_id = 0 :: non_neg_integer(),
         name = "",
         hp = 0 :: non_neg_integer(),
         hp_max = 0 :: non_neg_integer(),
         exp = 0 :: non_neg_integer(),
         called = 0 :: integer(),
         log = [] :: list(),
         last_renamed = 0 :: non_neg_integer()}).

-record(guild_mercenary,
        {id = {0, "", 0},
         key :: undefined | tuple(),
         lev = 0 :: non_neg_integer(),
         name = "" :: string(),
         dispatched = 0 :: non_neg_integer(),
         recruited = 0 :: non_neg_integer(),
         score = 0 :: non_neg_integer(),
         gain = [],
         guard :: undefined | tuple()}).

-record(guild_totem,
        {ver = 0 :: non_neg_integer(),
         id = util:rand_list([101, 102, 103, 104, 105]) ::
             non_neg_integer(),
         changeable = 1 :: non_neg_integer(),
         last_changed = 0 :: non_neg_integer()}).

-record(guild_question_answer,
        {ver = 0,
         id = {0, "", 0},
         name = "" :: string(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         guild_name = "" :: string(),
         option = 0 :: 0..4,
         result = 0 :: 0 | 1,
         score = 0 :: non_neg_integer(),
         answered = 0 :: non_neg_integer(),
         totem_id = 0 :: non_neg_integer(),
         rank = 0 :: non_neg_integer()}).

-record(guild_question,
        {ver = 0,
         id = 0 :: non_neg_integer(),
         answer = 0 :: 0..4,
         asked = 0 :: non_neg_integer(),
         answers = [] :: [#guild_question_answer{}],
         cheat_off = [],
         asked_num = 0 :: non_neg_integer(),
         cheat_nums = []}).

-record(guild_robber,
        {ver = 0 :: non_neg_integer(),
         id :: undefined | tuple(),
         today_generated = 0 :: non_neg_integer(),
         gen_hour = 0 :: non_neg_integer(),
         gen_time = 0 :: non_neg_integer(),
         total_killed = 0 :: non_neg_integer(),
         last_killed = 0 :: non_neg_integer(),
         killed_time = 0 :: non_neg_integer(),
         fighters = [],
         picker = []}).

-record(guild_treasure,
        {ver = 1 :: non_neg_integer(),
         added = 0 :: non_neg_integer(),
         setting_chance = 0 :: non_neg_integer(),
         setting_time = 0 :: non_neg_integer(),
         gen_time = 0 :: non_neg_integer(),
         generated = 0 :: non_neg_integer(),
         unit_num = 0 :: non_neg_integer(),
         total_killed = 0 :: non_neg_integer(),
         last_killed = 0 :: non_neg_integer(),
         killed_time = 0 :: non_neg_integer(),
         can_open = 0 :: 0,
         fighters = [],
         picker = [],
         type = win}).

-record(guild_loot,
        {ver = 0, items = [], log = [], allocated = []}).

-record(guild_usurper,
        {ver = 0,
         id :: undefined | tuple(),
         name = "" :: string(),
         classes = 0,
         sex = 0,
         ctime = 0 :: integer()}).

-record(guild_invitation,
        {ver = 0,
         id :: undefined | tuple(),
         name = "" :: string(),
         classes = 0,
         sex = 0,
         lev = 0,
         ctime = 0 :: integer(),
         guild_id :: undefined | tuple(),
         guild_name = "" :: string()}).

-record(guild_plant_irrigator,
        {id = {0, "", 0} :: tuple(),
         name = "" :: string(),
         classes = 0,
         sex = 0,
         ctime = 0 :: integer()}).

-record(guild_plant,
        {ver = 0,
         pos = {0, 0},
         owner_rid = {0, "", 0},
         owner_name = "",
         irrigations = [],
         phase = 0,
         sowed = 0,
         matured = 0,
         fired = 0 :: 0 | 1,
         unit_id = {0, 0},
         unit_base_id = 0}).

-record(guild_union_apply,
        {ver = 0,
         id = {0, "", 0},
         name = "" :: string(),
         leader_id = {0, "", 0},
         leader_name = "" :: string(),
         ctime = 0 :: integer()}).

-record(guild_campaign,
        {acc = [] :: list(),
         can_reward = [] :: list(),
         rewarded = [] :: list()}).

-record(guild_camp_web,
        {acc = [] :: list(),
         can_reward = [] :: list(),
         rewarded = [] :: list(),
         overdue_time = 0 :: non_neg_integer(),
         end_reward = [] :: list(),
         time_list = [] :: list()}).

-record(element_info,
        {ver = 1, build_type = 0, lev = 1, time = 0}).

-record(guild,
        {id = {0, "", 0} ::
             {non_neg_integer(), list(), non_neg_integer()},
         ver = 21 :: non_neg_integer(),
         name = "" :: list(),
         assets = 5000000,
         max_assets = 5000000,
         upkeep = 0,
         pid :: undefined | pid(),
         leader_name = "" :: list(),
         leader_id = {0, "", 0} ::
             {non_neg_integer(), list(), non_neg_integer()},
         leader_sex = 0 :: 0 | 1,
         leader_classes = 0 :: 0..6,
         leader_lev = 0 :: non_neg_integer(),
         members = [] :: [#guild_role{}],
         mem_num = 0 :: non_neg_integer(),
         fresh_num = 0 :: non_neg_integer(),
         max_mem_num = 90,
         max_fresh_num = 100,
         board = "" :: list(),
         health = 100,
         join_type = 2,
         join_condition = [],
         apply_list = [],
         event_list = [],
         lev = 1 :: pos_integer(),
         lev_time = 0 :: non_neg_integer(),
         academy_lev = 0 :: non_neg_integer(),
         academy_time = 0 :: non_neg_integer(),
         store_lev = 0 :: non_neg_integer(),
         store_time = 0 :: non_neg_integer(),
         exchequer_lev = 0 :: non_neg_integer(),
         exchequer_time = 0 :: non_neg_integer(),
         lev_ref :: undefined | reference(),
         welfare_time = 0,
         welfare_list = [],
         store_tick_time = 0,
         store_list = [],
         create_time = 0,
         flag = 0,
         map_pid = 0,
         map_id = 0,
         boss = #guild_boss{},
         mercenarys = [] :: [#guild_mercenary{}],
         totem = #guild_totem{} :: #guild_totem{},
         question = #guild_question{},
         robber_num = 0 :: non_neg_integer(),
         robber_total_num = 0 :: non_neg_integer(),
         usurpers = [],
         activity = 0,
         plants = [],
         announcement = "" :: string(),
         union_applys = [] :: list(),
         union_applied = [] :: list(),
         today_used_medal = 0 :: integer(),
         last_medal_used = 0 :: integer(),
         today_upgraded_build = 0 :: integer(),
         last_build_upgraded = 0 :: integer(),
         today_destory_build = 0 :: integer(),
         last_build_destory = 0 :: integer(),
         treasure = #guild_treasure{},
         loot = #guild_loot{},
         week_assets = 0 :: integer(),
         formalizing_lev = 35 :: integer(),
         name_used = "" :: string(),
         create_id = {0, "", 0},
         create_name = "",
         guild_camp = #guild_campaign{},
         guild_camp_web = #guild_camp_web{},
         max_chat_num = 0,
         max_doing = 0,
         max_fc = 0,
         max_synth_fc = 0,
         element_info = [],
         uplev_element_times = 0,
         last_uplev_element = 0,
         upgrade_element_time = 0,
         mail_list = [],
         limit_mode = 0,
         is_lock_board = 0,
         board_id = {0, "", 0},
         announce_id = {0, "", 0}}).

-record(guild_element_attr,
        {ver = 1,
         effect_obj = 1,
         attr = [],
         attr_snd = [],
         add_skill_list = [],
         high_attr = [],
         end_time = 0}).

-record(m_guild,
        {ver = 3 :: pos_integer(),
         id = {0, "", 0} ::
             {non_neg_integer(), list(), non_neg_integer()},
         name = "" :: list(),
         pid :: undefined | pid(),
         enter_time = 0,
         guild_lev = 1,
         post = 0 :: non_neg_integer(),
         value = 0,
         total_value = 0 :: non_neg_integer(),
         signature = "" :: list(),
         element_attr = [] :: list(),
         tmp_element_attr = [] :: list(),
         build_speed_num = 0 :: non_neg_integer()}).

-record(guild_emblem,
        {ver = 0, id = 0, type = 0, lev = 0}).

-record(m_guild_emblem,
        {ver = 0 :: non_neg_integer(),
         remain_point = 0 :: non_neg_integer(),
         total_point = 0 :: non_neg_integer(),
         emblems = []}).

-file("src/mod/guild/guild_war.erl", 68).

-file("inc/guild_war.hrl", 1).

-record(guild_war_role,
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
         movability = 1000 :: non_neg_integer(),
         match_id = {1, 0},
         side = 1,
         pid :: undefined | reference(),
         type = 0 :: non_neg_integer(),
         key = {{0, "", 0}, 0},
         last_killed = 0 :: non_neg_integer(),
         picked = 0 :: non_neg_integer(),
         last_win = 0 :: non_neg_integer(),
         score = 0 :: non_neg_integer(),
         team_status = 0,
         team_fc = 0,
         team_len = 0}).

-record(guild_war_guild,
        {id = {0, "", 0} :: tuple(),
         key = {{0, "", 0}, 0},
         ver = 2,
         name = "" :: bitstring(),
         lev = 0 :: non_neg_integer(),
         leader_name = "" :: list(),
         leader_id = {0, "", 0} ::
             {non_neg_integer(), list(), non_neg_integer()},
         match_id = {1, 0},
         member_num = 0 :: non_neg_integer(),
         win = 0 :: non_neg_integer(),
         side = 1,
         totem = 0 :: non_neg_integer(),
         type = 0 :: non_neg_integer(),
         time = 0 :: non_neg_integer(),
         is_win = 0 :: non_neg_integer(),
         score = 0 :: non_neg_integer(),
         week_assets = 0 :: non_neg_integer()}).

-record(guild_war_match,
        {id = {0, 0} :: {non_neg_integer(), non_neg_integer()},
         pid :: undefined | pid(),
         map_platform = "",
         map_zone_id = 0,
         map_id = 0 :: non_neg_integer(),
         map_pid = 0 :: pid(),
         win_side = 0,
         time = 0 :: non_neg_integer(),
         type = 0,
         combat_time = 0}).

-record(guild_war_alliance,
        {id = {{0, 0}, 0} :: {integer(), integer()},
         gids = [] :: list(),
         names = [],
         totems = [] :: list(),
         win = 0 :: non_neg_integer(),
         lost = 0 :: non_neg_integer(),
         movability = 0 :: non_neg_integer(),
         member_num = 0 :: non_neg_integer(),
         members = [],
         remain_num = 0,
         match_id = {0, 0},
         side = 1,
         totem = 0 :: non_neg_integer(),
         map_platform = "",
         map_zone_id = 0,
         map_id = 0 :: non_neg_integer(),
         map_pid = 0 :: pid(),
         type = 0 :: non_neg_integer(),
         time = 0 :: non_neg_integer(),
         is_win = 0 :: non_neg_integer(),
         score = 0 :: non_neg_integer()}).

-file("src/mod/guild/guild_war.erl", 69).

-file("inc/looks.hrl", 1).

-file("src/mod/guild/guild_war.erl", 70).

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

-file("src/mod/guild/guild_war.erl", 71).

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

-file("src/mod/guild/guild_war.erl", 72).

-file("inc/rank.hrl", 1).

-record(rank,
        {type = 1,
         show_list = [],
         list = [],
         last_val = 0,
         len = 0}).

-record(rank_rc,
        {ver = 3 :: pos_integer(),
         id = {roleid, platform, zoneid} :: term(),
         rank = 1,
         time = 0 :: non_neg_integer(),
         role_id = 0 :: non_neg_integer(),
         platform = "" :: list(),
         zone_id = 0 :: non_neg_integer(),
         name = "" :: list(),
         sex = 0 :: 0..2,
         classes = 0 :: 0..4,
         lev = 0 :: non_neg_integer(),
         val1 = 0 :: non_neg_integer(),
         val2 = 0 :: non_neg_integer(),
         val3 = 0 :: non_neg_integer(),
         val4 = 0 :: non_neg_integer(),
         desc = "",
         pet,
         guard,
         eqm}).

-record(rank_cfg,
        {type = 0 :: non_neg_integer(),
         num = 100 :: non_neg_integer(),
         keys = [#rank_rc.val3, #rank_rc.val2, #rank_rc.val1] ::
             [pos_integer()],
         min_val = 1 :: pos_integer(),
         nologin = 0 :: non_neg_integer(),
         zone = rank_zone_1 :: atom()}).

-file("src/mod/guild/guild_war.erl", 73).

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

-file("src/mod/guild/guild_war.erl", 74).

-record(state,
        {ts = 0 :: tuple(),
         timeout = 0 :: non_neg_integer(),
         type = 1,
         next_id = 1,
         match_ref :: undefined | reference(),
         judge_ref :: undefined | reference(),
         is_judge = false :: boolean(),
         mode = 1 :: 1 | 2,
         open_mode = 1,
         is_cross = 0,
         guild_list = []}).

world_all_leave() ->
    role_group:apply(world, {guild_war, leave, []}).

clean_data() ->
    ets:delete_all_objects(guild_war_guild_log),
    ets:delete_all_objects(guild_war_role),
    ets:delete_all_objects(guild_war_guild),
    ets:delete_all_objects(guild_war_match),
    ets:delete_all_objects(guild_war_alliance),
    ok.

join(#role{s_event = 17}) ->
    {false, lang:get("已经在活动中")};
join(#role{m_team = #m_team{pid = Pid, status = 2}})
    when is_pid(Pid) ->
    {false, lang:get("你跟随队伍中")};
join(Role) ->
    case check_join([lev,
                     world_lev,
                     event,
                     guild,
                     to_war,
                     movability,
                     team],
                    Role,
                    #{time => date:unixtime()})
        of
        {ok, Args} ->
            case check_cross(Role, Args) of
                {ok, Role1} -> do_join(Role1, Args);
                Fail -> Fail
            end;
        Else -> Else
    end.

leave(#role{m_team = #m_team{pid = Pid}})
    when is_pid(Pid) ->
    {false, lang:get("在队伍中，请先退出队伍")};
leave(Role = #role{cross_type = CrossType,
                   s_event = Event, id = Id, name = Name})
    when Event =:= 17 orelse Event =:= 18 ->
    case CrossType of
        0 -> cast({leave, Id});
        _ -> cross:cast(guild_war, cast, [{leave, Id}])
    end,
    PreRole1 = looks:del([64], Role),
    PreRole = looks:add({64, 0, 0, ""}, PreRole1, replace),
    Role1 = looks:calc(PreRole#role{s_event = 0}),
    ToPos = util:rand_list([{10001, 306, 3507},
                            {10001, 2583, 3848},
                            {10001, 4957, 3680},
                            {10001, 445, 2565},
                            {10001, 4646, 704},
                            {10001, 841, 1033},
                            {10001, 2098, 1834},
                            {10001, 3617, 1816}]),
    case map:role_enter(ToPos,
                        guild_war,
                        Role1#role{cross_type = 0})
        of
        {error, Reason} ->
            logger:error("[~ts]退出公会战场失败:~w",
                         [Name, Reason],
                         guild_war,
                         260),
            {false, lang:get("退出公会战场失败")};
        {ok, NewRole} ->
            role_misc:push_cross(NewRole),
            case CrossType of
                0 -> skip;
                _ ->
                    cross:cast(role_group,
                               leave,
                               [center_world, NewRole#role.pid])
            end,
            {ok, NewRole}
    end;
leave(_) -> {false, lang:get("不在公会战中")}.

join_to_follow(Role = #role{id = Id}, LeaderId) ->
    case check_alliance(Id, LeaderId) of
        true ->
            case join(Role) of
                {ok, NewRole} ->
                    team:follow(NewRole),
                    {ok, NewRole};
                {false, Why} ->
                    Msg = util:flist(lang:get("队长正在公会战中，~ts"), [Why]),
                    notice:send(Role, 1, Msg)
            end;
        _ ->
            notice:send(Role, 1, lang:get("队长正在公会战中，你和队长不是同一公会联盟"))
    end.

fight(#role{m_team = #m_team{pid = Pid, status = 2}},
      _TargetId)
    when is_pid(Pid) ->
    {false, lang:get("跟随队伍中，不能操作")};
fight(#role{m_combat = #m_combat{pid = CombatPid}},
      _TargetId)
    when is_pid(CombatPid) ->
    {false, lang:get("战斗中，不能操作")};
fight(Role = #role{s_event = 17, id = Id}, TargetId) ->
    Now = date:unixtime(),
    case ets:lookup(guild_war_role, Id) of
        [#guild_war_role{last_killed = Last}]
            when Now - Last < 90 ->
            {false,
             notice:format(lang:get("刚刚战败了，请稍后~ts秒"),
                           [{string_2, 5, 90 - (Now - Last)}])};
        [#guild_war_role{last_win = Last}]
            when Now - Last < 30 ->
            {false,
             notice:format(lang:get("刚刚胜利一场，请稍后~ts秒"),
                           [{string_2, 5, 30 - (Now - Last)}])};
        [#guild_war_role{movability = M}] when M =< 1 ->
            {false, lang:get("行动力不足，不能发起战斗")};
        [#guild_war_role{match_id = MatchId}] ->
            case ets:lookup(guild_war_match, MatchId) of
                [#guild_war_match{win_side = WinSide}]
                    when WinSide =/= 0 ->
                    {false, lang:get("战斗已经结束了")};
                _ ->
                    case check_alliance(Id, TargetId) of
                        true -> {false, lang:get("对方是自己人")};
                        _ -> combat_check(Role, TargetId, Now)
                    end
            end;
        _ -> {false, lang:get("行动力不足")}
    end;
fight(_, _) -> {false, lang:get("不在公会战中")}.

combat_over(#combat{winner = Winner, loser = Loser,
                    start_args = #combat_start_args{ext_args = ExtArgs}}) ->
    WinnerF = [F#fighter{active_skills = [],
                         passive_skills = [], buff_infos = [], ai = {[], []}}
               || F = #fighter{type = 1} <- Winner],
    LoserF = [F#fighter{active_skills = [],
                        passive_skills = [], buff_infos = [], ai = {[], []}}
              || F = #fighter{type = 1} <- Loser],
    case lists:keyfind(match_id, 1, ExtArgs) of
        {_, {2, _}} ->
            combat_cast(WinnerF, LoserF),
            cross:cast(guild_war,
                       cast,
                       [{combat_over, WinnerF, LoserF}]);
        _ ->
            combat_cast(WinnerF, LoserF),
            cast({combat_over, WinnerF, LoserF})
    end.

check_gain(Role = #role{id = Id, lev = Lev,
                        name = Name},
           WinOrLost) ->
    Gain1 = case levup_data:get_exp({3300, Lev}) of
                #{exp := Exp} ->
                    G1 = [{90010, Exp}],
                    case pet:get_war_pet(Role) of
                        {ok, #pet{lev = PetLev}} ->
                            case levup_data:get_exp({3300, PetLev}) of
                                #{pet_exp := PetExp} -> [{90005, PetExp} | G1];
                                _ -> G1
                            end;
                        _ -> G1
                    end;
                _R ->
                    logger:debug("找不到经验模型 ~w ~w",
                                 [Lev, _R],
                                 guild_war,
                                 348),
                    []
            end,
    WarRole = ets:lookup(guild_war_role, Id),
    Gain2 = case WarRole of
                [#guild_war_role{win = Win, lost = Lost}]
                    when Lost + Win > 3 ->
                    [{90011, 5} | [{Type,
                                    round(Val * 2.99999999999999988898e-1)}
                                   || {Type, Val} <- Gain1]];
                _ -> [{90011, 30} | Gain1]
            end,
    Gain3 = case WarRole of
                [#guild_war_role{win = Win1, lost = Lost1}]
                    when Lost1 + Win1 < 6 ->
                    case util:rand(1, 100) =< 30 of
                        true ->
                            ResType = case WinOrLost of
                                          win -> 1;
                                          _ -> 2
                                      end,
                            case guild_war_data:get_combat_reward(ResType) of
                                L = [_ | _] ->
                                    case util:rand_list(L, item_weight) of
                                        #{item_id := ItemId,
                                          item_num := ItemNum,
                                          announce := Announce} ->
                                            ItemId0 =
                                                item_type:special_id(ItemId),
                                            case Announce of
                                                1 ->
                                                    AnStr = case WinOrLost of
                                                                win ->
                                                                    notice:format(lang:get("~ts在公会战中高歌猛进，淘汰对手之后竟在地上发现一件~ts{face_1, "
                                                                                           "20}"),
                                                                                  [{role_2,
                                                                                    Name},
                                                                                   {item_2,
                                                                                    ItemId0,
                                                                                    ItemNum}]);
                                                                _ ->
                                                                    notice:format(lang:get("~ts在公会战中被冲散，寻找队友的过程中竟发现了一件~ts{face_1, "
                                                                                           "29}"),
                                                                                  [{role_2,
                                                                                    Name},
                                                                                   {item_2,
                                                                                    ItemId0,
                                                                                    ItemNum}])
                                                            end,
                                                    notice:cast(all, 5, AnStr);
                                                _ -> ok
                                            end,
                                            [{ItemId0, 0, ItemNum} | Gain2];
                                        _ -> Gain2
                                    end;
                                _ -> Gain2
                            end;
                        _ -> Gain2
                    end;
                _ -> Gain2
            end,
    logger:debug("奖励 ~w", [Gain3], guild_war, 391),
    Gain4 = format:val_to_gain(Gain3),
    NRole = case role_gain:do_notice(Gain4, Role) of
                {ok, Role1} -> Role1;
                _ -> Role
            end,
    {NRole, []}.

check_pick(#role{id = _Id, name = Name,
                 cross_type = CrossType},
           PickArgs = #{base_id := BaseId}) ->
    Gain = case guild_war_data:get_box_reward(BaseId) of
               L = [_ | _] ->
                   case util:rand_list(L, item_weight) of
                       #{item_id := ItemId, item_num := ItemNum,
                         announce := Announce} ->
                           ItemId0 = item_type:special_id(ItemId),
                           case Announce of
                               1 ->
                                   AnStr =
                                       notice:format(lang:get("~ts以胜利者的姿态打开了公会战~ts，高高兴兴把~ts捧回家！{face_1, "
                                                              "10}"),
                                                     [{role_2, Name},
                                                      {string_2,
                                                       5,
                                                       lang:get("胜利宝箱")},
                                                      {item_2,
                                                       ItemId0,
                                                       ItemNum}]),
                                   notice:cast(all, 5, AnStr);
                               _ -> ok
                           end,
                           [{ItemId0, 0, ItemNum}];
                       _ -> []
                   end;
               _ -> []
           end,
    {true,
     PickArgs#{gain => Gain, cross_type => CrossType}};
check_pick(_, _PickArgs) -> {false, lang:get("不在公会中")}.

pick_gain(Role = #role{pid = _Pid}, Gain) ->
    Gain1 = format:val_to_gain(Gain),
    case role_gain:do_notice(Gain1, Role) of
        {ok, Role1} ->
            Role2 = case team:sync_away(Role1) of
                        {ok, ARole = #role{}} -> ARole;
                        _ -> Role1
                    end,
            async_leave(Role2, "", true);
        {false, #gain{msg = Msg}} ->
            notice:return(Msg),
            ok;
        _R ->
            logger:debug("未知返回 ~w", [_R], guild_war, 436),
            ok
    end.

login(Role = #role{s_event = Event, pos = Pos})
    when Event =:= 17 orelse Event =:= 18 ->
    {LMapId, Lx, Ly} = util:rand_list([{10001, 306, 3507},
                                       {10001, 2583, 3848},
                                       {10001, 4957, 3680},
                                       {10001, 445, 2565},
                                       {10001, 4646, 704},
                                       {10001, 841, 1033},
                                       {10001, 2098, 1834},
                                       {10001, 3617, 1816}]),
    NewPos = Pos#pos{map = LMapId, x = Lx, y = Ly},
    handle_buff(Role#role{pos = NewPos, s_event = 0});
login(Role) -> handle_buff(Role).

handle_buff(Role = #role{m_guild = MG}) ->
    Role1 = case buff:del(Role, 22002) of
                {ok, NRole} -> NRole;
                _ -> Role
            end,
    Now = date:unixtime(),
    case {MG, env:get(guild_war_champion_buff)} of
        {#m_guild{id = Gid}, {Gid, Start}}
            when Now - Start < 86400 * 7 ->
            case buff_data:get(22002) of
                B = #buff_base{} ->
                    case buff:add(Role1,
                                  B#buff_base{duration =
                                                  86400 * 7 - (Now - Start)})
                        of
                        {ok, Role2} -> {ok, Role2};
                        _ -> {ok, Role1}
                    end;
                _ -> {ok, Role1}
            end;
        _ -> {ok, Role1}
    end.

logout(#role{s_event = Event, id = Id,
             cross_type = CrossType})
    when Event =:= 17 orelse Event =:= 18 ->
    case CrossType of
        1 -> cross:cast(guild_war, cast, [{logout, Id}]);
        _ -> cast({logout, Id})
    end,
    ok;
logout(_) -> ok.

info(status) ->
    case check_srv_open() of
        true ->
            gen_fsm:sync_send_all_state_event(guild_war,
                                              info_status);
        _ -> {0, 86400}
    end.

get_member_results(#role{m_guild =
                             #m_guild{id = Id}}) ->
    get_member_results(Id);
get_member_results(Id) ->
    ets:match_object(guild_war_role,
                     #guild_war_role{gid = Id, _ = '_'}).

get_opposite_member(#role{id = Id}) ->
    get_opposite_member(Id);
get_opposite_member(Id = {_, P, Z}) ->
    case cross:call(P, Z, ets, lookup, [guild_war_role, Id])
        of
        [#guild_war_role{match_id = MatchId, side = Side}] ->
            Opposite = get_opposite_side(Side),
            case ets:lookup(guild_war_alliance, {MatchId, Opposite})
                of
                [#guild_war_alliance{remain_num = Remain}]
                    when Remain < 1 orelse Remain > 10 ->
                    [];
                [#guild_war_alliance{members = Members,
                                     match_id = {MatchType, _}}] ->
                    case do_get_opposite_member(Members) of
                        [] ->
                            case MatchType of
                                2 ->
                                    cross:cast(guild_war,
                                               cast,
                                               [{calc_remain,
                                                 {MatchId, Opposite}}]);
                                _ -> cast({calc_remain, {MatchId, Opposite}})
                            end,
                            [];
                        ReMembers -> ReMembers
                    end;
                _ -> []
            end;
        _ -> []
    end.

is_matched() -> ets:info(guild_war_match, size) > 0.

is_opening() ->
    case info(status) of
        {St, _} when St > 0 -> true;
        _ -> false
    end.

check_alliance(Rid1 = {_, P1, Z1},
               Rid2 = {_, P2, Z2}) ->
    Result1 = cross:call(P1,
                         Z1,
                         guild_role,
                         find_role,
                         [Rid1]),
    Result2 = cross:call(P2,
                         Z2,
                         guild_role,
                         find_role,
                         [Rid2]),
    case {Result1, Result2} of
        {{ok, Gid}, {ok, Gid}} -> true;
        {{ok, Gid1}, {ok, Gid2}} ->
            Result3 = cross:call(P1,
                                 Z1,
                                 ets,
                                 lookup,
                                 [guild_war_guild, Gid1]),
            Result4 = cross:call(P2,
                                 Z2,
                                 ets,
                                 lookup,
                                 [guild_war_guild, Gid2]),
            case {Result3, Result4} of
                {[#guild_war_guild{match_id = MatchId, side = Side}],
                 [#guild_war_guild{match_id = MatchId, side = Side}]} ->
                    true;
                _Err -> false
            end;
        _Err -> false
    end.

push(Role, Cmd = 15500) ->
    Data = info(status),
    role:link_send(Role, Cmd, Data);
push(Role = #role{m_guild = #m_guild{id = Gid}},
     Cmd = 15501) ->
    Data = case ets:lookup(guild_war_guild, Gid) of
               [#guild_war_guild{match_id = Mid}] ->
                   case ets:lookup(guild_war_alliance, {Mid, 1}) of
                       [A1 = #guild_war_alliance{}] ->
                           {[A1 | ets:lookup(guild_war_alliance, {Mid, 2})]};
                       _ -> {ets:lookup(guild_war_alliance, {Mid, 2})}
                   end;
               _ -> {[]}
           end,
    role:link_send(Role, Cmd, Data);
push(Role = #role{id = Id}, Cmd = 15505) ->
    WR = case ets:lookup(guild_war_role, Id) of
             [R = #guild_war_role{}] -> R;
             _ -> #guild_war_role{}
         end,
    Data = {WR},
    role:link_send(Role, Cmd, Data);
push(Role, Cmd = 15506) ->
    WL = ets:tab2list(guild_war_guild_log),
    Mode = case env:get(guild_war_mode) of
               M when is_integer(M) -> M;
               _ ->
                   env:set(guild_war_mode, 1),
                   1
           end,
    Data = {WL, Mode},
    role:link_send(Role, Cmd, Data);
push(Role = #role{m_guild = #m_guild{id = Gid}},
     Cmd = 15507) ->
    L = get_member_results(Gid),
    Data = {L},
    role:link_send(Role, Cmd, Data);
push(Role = #role{id = Id}, Cmd = 15508) ->
    L = get_opposite_member(Id),
    Data = {L},
    role:link_send(Role, Cmd, Data);
push(Role, Cmd = 15509) ->
    Type = 0,
    Data = {Type},
    role:link_send(Role, Cmd, Data);
push(_, _Cmd) ->
    logger:debug("无法推送 ~w", [_Cmd], guild_war, 598),
    ok.

role_callback(Role = #role{s_event = Event}, leave)
    when Event =:= 17 orelse Event =:= 18 ->
    Role2 = case team:sync_away(Role) of
                {ok, ARole = #role{}} -> ARole;
                _ -> Role
            end,
    async_leave(Role2, lang:get("公会战活动结束了"), true);
role_callback(_, leave) -> ok;
role_callback(Role, leave_by_movability) ->
    NRole = do_reward_role(Role, 2),
    push(NRole, 15505),
    set_delay_out(NRole, lang:get("行动力耗尽"), async_leave);
role_callback(Role = #role{s_event = Event},
              {reward, lost})
    when Event =:= 18 orelse Event =:= 17 ->
    NRole = do_reward_role(Role, 2),
    push(NRole, 15505),
    set_delay_out(NRole, lang:get("活动结束"), async_leave);
role_callback(Role = #role{s_event = Event},
              {reward, win})
    when Event =:= 18 orelse Event =:= 17 ->
    Msg =
        notice:format(lang:get("恭喜获得公会战胜利！请等待~ts，拾取属于~ts的奖励"),
                      [{string_2, 5, lang:get("一分钟")},
                       {string_2, 5, lang:get("胜利者")}]),
    notice:pop(Role, 2, Msg),
    NRole = do_reward_role(Role, 1),
    push(NRole, 15505),
    push(NRole, 15509),
    {ok, NRole};
role_callback(Role = #role{s_event = 18, name = _Name},
              to_war) ->
    logger:debug("~ts被动进入", [_Name], guild_war, 629),
    case join(Role) of
        {ok, NewRole} ->
            push(NewRole, 15500),
            {ok, NewRole};
        _R ->
            logger:debug("~ts被动进入失败 ~w",
                         [_Name, _R],
                         guild_war,
                         635),
            Timer = #timer{id = guild_war_to_war,
                           timeout = 100 * 1000, times = 1, m = guild_war,
                           f = role_callback, a = [to_war]},
            {ok, role_timer:set(Timer, Role)}
    end;
role_callback(#role{}, to_war) -> ok;
role_callback(Role = #role{s_event = 18, name = _Name},
              {ready, Num}) ->
    logger:debug("~ts 设定进入倒计时", [_Name], guild_war, 643),
    Timer = #timer{id = guild_war_to_war,
                   timeout = Num * 200, times = 1, m = guild_war,
                   f = role_callback, a = [to_war]},
    {ok, role_timer:set(Timer, Role)};
role_callback(#role{}, ready) -> ok;
role_callback(Role,
              {lost, Gr = #guild_war_role{movability = 0}, _}) ->
    NRole = Role,
    role:link_send(Role, 15505, {Gr}),
    set_delay_out(NRole, lang:get("行动力耗尽"), reward_leave);
role_callback(Role = #role{pos =
                               #pos{map_base_id = 30008}},
              {lost, Gr = #guild_war_role{}, _Side}) ->
    role:link_send(Role, 15505, {Gr}),
    Role1 = case team:away(Role) of
                {ok, ARole} -> ARole;
                _ -> Role
            end,
    Notice1 = case team:get_status(Role) of
                  {true, _} -> lang:get("战斗失败，队员被冲散在战场四周！");
                  _ -> lang:get("战斗失败")
              end,
    notice:send(Role, 3, Notice1),
    Notice2 = notice:format(lang:get("扣除行动力~ts"),
                            [{string_2, 1, 300}]),
    notice:send(Role, 3, Notice2),
    Timer = #timer{id = guild_war_split, timeout = 1000,
                   times = 1, m = guild_war, f = role_callback,
                   a = [split]},
    {ok, role_timer:set(Timer, Role1)};
role_callback(Role, {push, Cmd}) ->
    push(Role, Cmd),
    ok;
role_callback(Role = #role{s_event = 17,
                           m_combat = #m_combat{pid = CombatPid}},
              stop_fighting)
    when is_pid(CombatPid) ->
    case team:get_status(Role) of
        {true, 2} -> ok;
        _ ->
            CombatPid ! stop,
            ok
    end;
role_callback(_, stop_fighting) -> ok;
role_callback(Role = #role{s_event = Event},
              async_leave)
    when Event =:= 18 orelse Event =:= 17 ->
    push(Role, 15509),
    async_leave(Role, "");
role_callback(Role = #role{s_event = Event},
              reward_leave)
    when Event =:= 18 orelse Event =:= 17 ->
    Role1 = do_reward_role(Role, 2),
    push(Role1, 15509),
    async_leave(Role1, "");
role_callback(Role = #role{s_event = Event}, split)
    when Event =:= 18 orelse Event =:= 17 ->
    {X, Y} = map:rand_pos(30008),
    case map:role_transmit(4, 0, X, Y, Role) of
        Role3 = #role{} -> {ok, Role3};
        _Err ->
            logger:error("归队传送时, 地图内传送出错:~w",
                         [_Err],
                         guild_war,
                         698),
            {ok, Role}
    end;
role_callback(_, _Info) ->
    logger:debug("未知消息 ~w", [_Info], guild_war, 702),
    ok.

role_callback(_, Role = #role{name = _Name}, _,
              {follow_join, Side, MatchId, Event, IsReady}) ->
    logger:debug("~ts 跟随进入", [_Name], guild_war, 706),
    Role2 = do_side_looks(Side, Role#role{s_event = Event}),
    Role3 = case IsReady of
                true ->
                    logger:debug("~ts 设定进入倒计时", [_Name], guild_war, 710),
                    Timer = #timer{id = guild_war_to_war,
                                   timeout = 100 * 1000, times = 1,
                                   m = guild_war, f = role_callback,
                                   a = [to_war]},
                    role_timer:set(Timer, Role2);
                _ -> Role2
            end,
    map:role_update(Role3),
    Role4 = var:set_var(Role3, day, 45, 0),
    R = to(Side, Role4, MatchId),
    cast({follow_join, R}),
    case Event of
        17 -> guild_role:update(Role4, doing);
        _ -> ignore
    end,
    {ok, role_trigger:fire([#evt_guild_war{}], Role4)};
role_callback(_, Role = #role{id = Id}, _,
              follow_to_war) ->
    cast({follow_to_war, Id}),
    guild_role:update(Role, doing),
    {ok, role_trigger:fire([#evt_guild_war{}], Role)};
role_callback(_,
              Role = #role{id = Id, cross_type = CrossType}, _,
              follow_leave) ->
    case CrossType of
        0 -> cast({leave, Id});
        _ -> cross:cast(guild_war, cast, [{leave, Id}])
    end,
    PreRole1 = looks:del([64], Role),
    PreRole = looks:add({64, 0, 0, ""}, PreRole1, replace),
    Role1 = looks:calc(PreRole#role{s_event = 0}),
    map:role_update(Role1),
    {ok, Role1}.

guild_callback(#guild{members = Members}, add_buff) ->
    lists:foreach(fun (#guild_role{pid = Pid})
                          when is_pid(Pid) ->
                          buff:async_add(Pid, 22002);
                      (_) -> ok
                  end,
                  Members),
    ok;
guild_callback(#guild{members = Members}, del_buff) ->
    lists:foreach(fun (#guild_role{pid = Pid})
                          when is_pid(Pid) ->
                          buff:async_del(Pid, 22002);
                      (_) -> ok
                  end,
                  Members),
    ok.

get_guild_role_side(#role{id = RoleId, s_event = 17}) ->
    get_guild_role_side(RoleId);
get_guild_role_side({Rid, Plat, Zone}) ->
    case ets:lookup(guild_war_role, {Rid, Plat, Zone}) of
        [#guild_war_role{match_id = MatchId, side = Side}] ->
            {true, MatchId, Side};
        _ -> {false, lang:get("未查询到对方公会战参战信息")}
    end;
get_guild_role_side(_) ->
    {false, lang:get("未查询到对方公会战参战信息")}.

get_last_join_num(Id) ->
    case ets:lookup(guild_war_rank, Id) of
        [#guild_war_guild{member_num = GMnum}] -> GMnum;
        _ -> 0
    end.

gm(match) -> guild_war ! gm_match;
gm(match_notice) -> guild_war ! gm_match_notice;
gm(pre_match) -> guild_war ! gm_pre_match.

check_open_mode(_IsCross = 1) -> 2;
check_open_mode(_) ->
    Platform = env:get(platform),
    ZoneId = env:get(zone_id),
    DataList = guild_war_data:get_all_cross_list(),
    case lists:keymember({Platform, ZoneId}, 1, DataList) of
        true -> 3;
        _ -> 1
    end.

cast_submit() -> guild_war ! cast_submit.

submit(Platform, ZoneId, GuildList) ->
    guild_war ! {submit, Platform, ZoneId, GuildList}.

call(Msg) ->
    case catch gen_fsm:sync_send_all_state_event(guild_war,
                                                 Msg,
                                                 10000)
        of
        {'EXIT', {timeout, _}} -> {error, timeout};
        {'EXIT', {noproc, _}} -> {error, noproc};
        {'EXIT', {normal, _}} -> {error, exit};
        {'EXIT', _Call_Err} -> {error, _Call_Err};
        _Call_Return -> _Call_Return
    end.

cast(Msg) ->
    gen_fsm:send_all_state_event(guild_war, Msg).

m(Event) -> gen_fsm:send_event(guild_war, Event).

start_link(Mod) ->
    gen_fsm:start_link({local, guild_war},
                       guild_war,
                       [Mod],
                       []).

init([Mod]) ->
    logger:info("开始启动...", [], guild_war, 822),
    {StateName, Timeout} = get_state(),
    ets:new(guild_war_guild,
            [set,
             named_table,
             public,
             {keypos, #guild_war_guild.id}]),
    ets:new(guild_war_guild_log,
            [set,
             named_table,
             public,
             {keypos, #guild_war_guild.key}]),
    LogFile = "./dets/guild_war_guild_log.dets",
    case dets:open_file(guild_war_guild_log,
                        [{file, LogFile}, {keypos, #guild_war_guild.key}])
        of
        {error, {keypos_mismatch, LogFile}} ->
            file:delete(LogFile),
            dets:open_file(guild_war_guild_log,
                           [{file, LogFile}, {keypos, #guild_war_guild.key}]);
        _R ->
            logger:debug("guild_war_guild_log dets : ~w",
                         [_R],
                         guild_war,
                         832),
            ok
    end,
    ets:new(guild_war_role,
            [set,
             named_table,
             public,
             {keypos, #guild_war_role.id}]),
    ets:new(guild_war_match,
            [set,
             named_table,
             public,
             {keypos, #guild_war_match.id}]),
    ets:new(guild_war_alliance,
            [set,
             named_table,
             public,
             {keypos, #guild_war_alliance.id}]),
    ets:new(guild_war_rank,
            [set,
             named_table,
             public,
             {keypos, #guild_war_guild.id}]),
    dets:open_file(guild_war_rank,
                   [{file, "./dets/guild_war_rank.dets"},
                    {keypos, #guild_war_guild.id}]),
    load_data(),
    NextId = case env:get(guild_war_next_id) of
                 NId when is_integer(NId) -> NId;
                 _ ->
                     env:save(guild_war_next_id, 1),
                     1
             end,
    Now = date:unixtime(),
    Mode0 = case util:ceil((date:day_diff(1457884800, Now) +
                                1)
                               / 7)
                     rem 2
                of
                0 -> 2;
                _ -> 1
            end,
    {Type, Mode} = case date:day_of_the_week(Now) of
                       4 when Timeout > 86400000 ->
                           case Mode0 of
                               2 -> {1, 1};
                               _ -> {1, 2}
                           end;
                       2 when Timeout > 86400000 -> {2, Mode0};
                       D when D > 2 andalso D < 5 -> {2, Mode0};
                       D when D > 4 andalso Mode0 =:= 1 -> {1, 2};
                       D when D > 4 -> {1, 1};
                       _ -> {1, Mode0}
                   end,
    env:set(guild_war_mode, Mode),
    case env:get(guild_war_precious_pool) of
        undefined -> env:set(guild_war_precious_pool, 0);
        _ -> ok
    end,
    IsCross = case Mod of
                  center -> 1;
                  _ -> 0
              end,
    OpenMode = check_open_mode(IsCross),
    State = #state{ts = now(), timeout = Timeout,
                   next_id = NextId, type = Type, mode = Mode,
                   is_cross = IsCross, open_mode = OpenMode},
    NewState = do_match(StateName, State),
    put(guild_memeber_num, []),
    logger:info("启动完成 state_name: ~w, timeout: ~w",
                [StateName, Timeout],
                guild_war,
                896),
    {ok, StateName, NewState, Timeout}.

handle_event({reload}, StateName,
             State = #state{is_cross = IsCross,
                            open_mode = OldOpenMode}) ->
    OpenMode = check_open_mode(IsCross),
    logger:info("收到重载公会战从[~w]模式转换成[~w]模式",
                [OldOpenMode, OpenMode],
                guild_war,
                902),
    continue(StateName, State#state{open_mode = OpenMode});
handle_event({follow_join,
              WR = #guild_war_role{gid = _Gid}},
             StateName, State = #state{open_mode = OpenMode})
    when StateName =:= ready ->
    handle_join(WR, StateName, OpenMode),
    continue(StateName, State);
handle_event({follow_join,
              WR = #guild_war_role{gid = Gid}},
             StateName,
             State = #state{open_mode = OpenMode,
                            guild_list = GuildList})
    when StateName =:= active ->
    handle_join(WR, StateName, OpenMode),
    MemLen = get_mem_len(Gid, State),
    NewGuildList = lists:keystore(Gid,
                                  1,
                                  GuildList,
                                  {Gid, MemLen + 1}),
    logger:debug("==========================================",
                 [],
                 guild_war,
                 915),
    put(guild_memeber_num, NewGuildList),
    logger:debug("==========================================:~w",
                 [NewGuildList],
                 guild_war,
                 917),
    continue(StateName,
             State#state{guild_list = NewGuildList});
handle_event({follow_join, _}, StateName, State) ->
    continue(StateName, State);
handle_event({follow_to_war, Id}, active,
             State = #state{open_mode = OpenMode}) ->
    case ets:lookup(guild_war_role, Id) of
        [R = #guild_war_role{to_war = Acc}] ->
            insert_role(R#guild_war_role{to_war = Acc + 1},
                        OpenMode);
        _ -> ok
    end,
    continue(active, State);
handle_event({follow_to_war, _}, StateName, State) ->
    continue(StateName, State);
handle_event({leave, Id}, StateName,
             State = #state{is_judge = IsJudge,
                            open_mode = OpenMode})
    when StateName =:= ready orelse StateName =:= active ->
    case ets:lookup(guild_war_role, Id) of
        [WR = #guild_war_role{match_id = MatchId, side = Side,
                              movability = Rm, pid = Pid}]
            when is_pid(Pid) ->
            insert_role(WR#guild_war_role{pid = 0}, OpenMode),
            case ets:lookup(guild_war_alliance, {MatchId, Side}) of
                [A = #guild_war_alliance{match_id = MatchId}]
                    when Rm < 1 ->
                    leave_judge(OpenMode, IsJudge, A),
                    map_async({match, MatchId},
                              {guild_war, role_callback, [{push, 15501}]});
                [A = #guild_war_alliance{movability = Gm,
                                         remain_num = GRnum,
                                         match_id = MatchId}] ->
                    leave_judge(OpenMode,
                                IsJudge,
                                A#guild_war_alliance{movability =
                                                         max(0, Gm - Rm),
                                                     remain_num =
                                                         max(0, GRnum - 1)}),
                    map_async({match, MatchId},
                              {guild_war, role_callback, [{push, 15501}]});
                _ -> ok
            end;
        _ -> ok
    end,
    continue(StateName, State);
handle_event({leave, _}, StateName, State) ->
    continue(StateName, State);
handle_event({combat_start, Ids, Ids2}, active,
             State = #state{open_mode = OpenMode}) ->
    atk_movability_lost(Ids,
                        #{team_len => length(Ids), team_len2 => length(Ids2)},
                        OpenMode),
    continue(active, State);
handle_event({combat_start, _, _}, StateName, State) ->
    continue(StateName, State);
handle_event({combat_over, Winner, Loser}, active,
             State = #state{is_judge = IsJudge,
                            open_mode = OpenMode}) ->
    case Winner of
        [] -> ok;
        _ ->
            WinScore = get_win_score(length(Loser)) div
                           length(Winner),
            calc_fighter({win, WinScore}, IsJudge, Winner, OpenMode)
    end,
    calc_fighter(lost, IsJudge, Loser, OpenMode),
    continue(active, State);
handle_event({combat_over, _, _}, StateName, State) ->
    continue(StateName, State);
handle_event({logout, Id}, StateName,
             State = #state{is_judge = IsJudge,
                            open_mode = OpenMode})
    when StateName =:= ready orelse StateName =:= active ->
    case ets:lookup(guild_war_role, Id) of
        [WR = #guild_war_role{match_id = MatchId, side = Side,
                              movability = Rm}] ->
            insert_role(WR#guild_war_role{pid = 0}, OpenMode),
            case ets:lookup(guild_war_alliance, {MatchId, Side}) of
                [A = #guild_war_alliance{match_id = MatchId}]
                    when Rm < 1 ->
                    leave_judge(OpenMode, IsJudge, A),
                    map_async({match, MatchId},
                              {guild_war, role_callback, [{push, 15501}]});
                [A = #guild_war_alliance{movability = Gm,
                                         remain_num = GRnum,
                                         match_id = MatchId}] ->
                    leave_judge(OpenMode,
                                IsJudge,
                                A#guild_war_alliance{movability =
                                                         max(0, Gm - Rm),
                                                     remain_num =
                                                         max(0, GRnum - 1)}),
                    map_async({match, MatchId},
                              {guild_war, role_callback, [{push, 15501}]});
                _ -> ok
            end;
        _ -> ok
    end,
    continue(StateName, State);
handle_event({logout, _}, StateName, State) ->
    continue(StateName, State);
handle_event({calc_remain, AId}, StateName,
             State = #state{is_judge = IsJudge,
                            open_mode = OpenMode})
    when StateName =:= ready orelse StateName =:= active ->
    case ets:lookup(guild_war_alliance, AId) of
        [A = #guild_war_alliance{remain_num = Remain,
                                 match_id = MatchId}]
            when Remain < 1 ->
            leave_judge(OpenMode, IsJudge, A),
            map_async({match, MatchId},
                      {guild_war, role_callback, [{push, 15501}]});
        [A = #guild_war_alliance{members = Members,
                                 match_id = MatchId}] ->
            {Movability, Remain} = calc_remain(Members, 0, 0),
            leave_judge(OpenMode,
                        IsJudge,
                        A#guild_war_alliance{movability = Movability,
                                             remain_num = Remain}),
            map_async({match, MatchId},
                      {guild_war, role_callback, [{push, 15501}]});
        _ -> ok
    end,
    continue(StateName, State);
handle_event({calc_remain, _}, StateName, State) ->
    continue(StateName, State);
handle_event({update_team_status,
              TeamFc,
              TeamLen,
              ChangeList},
             StateName, State = #state{open_mode = OpenMode}) ->
    Fun = fun ({Flag, RoleId}) ->
                  case ets:lookup(guild_war_role, RoleId) of
                      [Tc = #guild_war_role{name = _RoleName,
                                            lev = _RoleLev}] ->
                          NewTc = case Flag of
                                      leader ->
                                          Tc#guild_war_role{team_status = 1,
                                                            team_fc = TeamFc,
                                                            team_len = TeamLen};
                                      away ->
                                          Tc#guild_war_role{team_status = 3,
                                                            team_fc = TeamFc,
                                                            team_len = 1};
                                      none ->
                                          Tc#guild_war_role{team_status = 0,
                                                            team_fc = TeamFc,
                                                            team_len = 1};
                                      follow ->
                                          Tc#guild_war_role{team_status = 2,
                                                            team_fc = TeamFc,
                                                            team_len = 1};
                                      _ -> Tc
                                  end,
                          insert_role(NewTc, OpenMode);
                      _ -> skip
                  end;
              (_) -> skip
          end,
    lists:foreach(Fun, ChangeList),
    continue(StateName, State);
handle_event(_Event, StateName, State) ->
    logger:error("未知消息 ~w", [_Event], guild_war, 1049),
    continue(StateName, State).

handle_sync_event({join, _WR}, _From, active,
                  State = #state{is_judge = true}) ->
    Reply = {false,
             lang:get("参战人数达到最大上限，请为参战的公会勇士加油助威吧{face_1, 18}")},
    continue(Reply, active, State);
handle_sync_event({join, WR}, _From, StateName,
                  State = #state{open_mode = OpenMode})
    when StateName =:= ready ->
    logger:debug("==========================================",
                 [],
                 guild_war,
                 1058),
    handle_join(WR, StateName, OpenMode),
    Reply = {ok, StateName},
    continue(Reply, StateName, State);
handle_sync_event({join,
                   WR = #guild_war_role{gid = Gid}},
                  _From, StateName,
                  State = #state{open_mode = OpenMode,
                                 guild_list = GuildList})
    when StateName =:= active ->
    logger:debug("==========================================",
                 [],
                 guild_war,
                 1064),
    MemLen = get_mem_len(Gid, State),
    case MemLen >= 100 of
        true ->
            logger:debug("==========================================",
                         [],
                         guild_war,
                         1068),
            Reply = {false,
                     notice:format(lang:get(""), [{string_2, 5, 100}])},
            continue(Reply, StateName, State);
        _ ->
            logger:debug("==========================================",
                         [],
                         guild_war,
                         1072),
            handle_join(WR, StateName, OpenMode),
            NewGuildList = lists:keystore(Gid,
                                          1,
                                          GuildList,
                                          {Gid, MemLen + 1}),
            put(guild_memeber_num, NewGuildList),
            logger:debug("==========================================:~w",
                         [NewGuildList],
                         guild_war,
                         1076),
            Reply = {ok, StateName},
            continue(Reply,
                     StateName,
                     State#state{guild_list = NewGuildList})
    end;
handle_sync_event({join, _WR}, _From, StateName,
                  State) ->
    Reply = {false, lang:get("活动时间还没到")},
    continue(Reply, StateName, State);
handle_sync_event({to_war, Gid, Id}, _From, active,
                  State = #state{open_mode = OpenMode,
                                 guild_list = GuildList}) ->
    case ets:lookup(guild_war_role, Id) of
        [R = #guild_war_role{to_war = Acc, gid = Gid}] ->
            insert_role(R#guild_war_role{to_war = Acc + 1},
                        OpenMode);
        _ -> ok
    end,
    MemLen = get_mem_len(Gid, State),
    NewGuildList = lists:keystore(Gid,
                                  1,
                                  GuildList,
                                  {Gid, MemLen + 1}),
    logger:debug("==========================================",
                 [],
                 guild_war,
                 1093),
    put(guild_memeber_num, NewGuildList),
    logger:debug("==========================================:~w",
                 [NewGuildList],
                 guild_war,
                 1095),
    Reply = ok,
    continue(Reply,
             active,
             State#state{guild_list = NewGuildList});
handle_sync_event({to_war, _, _}, _From, StateName,
                  State) ->
    Reply = {false, lang:get("还没到开打时间")},
    continue(Reply, StateName, State);
handle_sync_event({login, _Id, _Pid}, _From, active,
                  State) ->
    Reply = false,
    continue(Reply, active, State);
handle_sync_event({login, _Id, _Pid}, _From, StateName,
                  State) ->
    Reply = false,
    continue(Reply, StateName, State);
handle_sync_event(info_status, _From, StateName,
                  State = #state{ts = Ts, timeout = Timeout}) ->
    St = case StateName of
             ready -> 1;
             active -> 2;
             reward -> 3;
             _ -> 0
         end,
    Rest = util:time_left(Timeout, Ts),
    Reply = {St, Rest div 1000},
    continue(Reply, StateName, State);
handle_sync_event({reward_precious, Result}, _From,
                  StateName, State) ->
    HasPool = env:get(guild_war_precious_pool),
    Reply = case guild_war_data:get_result_reward(Result) of
                _ when HasPool =:= 0 -> false;
                Items = [_ | _] ->
                    Fun = fun (DropData) ->
                                  case DropData of
                                      DataRatio = #{item_id := TmpItemId,
                                                    item_weight := Ratio} ->
                                          case lists:member(TmpItemId,
                                                            [29010, 29011])
                                              of
                                              true ->
                                                  DataRatio#{item_weight =>
                                                                 Ratio *
                                                                     HasPool};
                                              false -> DataRatio
                                          end;
                                      Oth -> Oth
                                  end
                          end,
                    NewItems = lists:map(Fun, Items),
                    case util:rand_list(NewItems, item_weight) of
                        #{item_id := ItemId} ->
                            case lists:member(ItemId, [29010, 29011]) of
                                true ->
                                    env:save(guild_war_precious_pool, 0),
                                    true;
                                _ -> false
                            end;
                        _Err -> false
                    end;
                _Err1 -> false
            end,
    continue(Reply, StateName, State);
handle_sync_event(_Event, _From, StateName, State) ->
    logger:error("未知消息 ~w", [_Event], guild_war, 1154),
    Reply = false,
    continue(Reply, StateName, State).

handle_info(match, idle,
            State = #state{open_mode = 2}) ->
    put(guild_list, []),
    do_cast_join_guild(),
    erlang:send_after(30 * 1000, self(), match2),
    continue(idle, State);
handle_info(match2, idle, State) ->
    NewState = do_match(match, State),
    continue(idle, NewState);
handle_info(match2, StateName, State) ->
    logger:debug("活动时间中不能匹配", [], guild_war, 1173),
    continue(StateName, State);
handle_info(match, StateName,
            State = #state{open_mode = 3}) ->
    logger:info("本服开启跨服模式，不进行匹配", [], guild_war, 1179),
    continue(StateName, State);
handle_info(match, idle,
            State = #state{open_mode = 1}) ->
    NewState = case check_srv_open() of
                   true -> do_match(match, State);
                   _ -> State
               end,
    continue(idle, NewState);
handle_info(match, StateName, State) ->
    logger:debug("活动时间中不能匹配", [], guild_war, 1190),
    continue(StateName, State);
handle_info(cast_submit, StateName, State) ->
    {Platform, ZoneId, DataList} = get_join_guild(),
    cross:cast(guild_war,
               submit,
               [Platform, ZoneId, DataList]),
    logger:info("收到跨服收集请求，提交本服数据", [], guild_war, 1197),
    continue(StateName, State);
handle_info({submit, Platform, ZoneId, AddGuildList},
            idle, State) ->
    AllGuildList = get(guild_list),
    DataList = get_cross_list(),
    case lists:keyfind({Platform, ZoneId}, 1, DataList) of
        {_, Order} ->
            NewGuildList = case lists:keyfind(Order,
                                              1,
                                              AllGuildList)
                               of
                               {_, GuildList} ->
                                   merge_guild(AddGuildList, GuildList);
                               _ -> AddGuildList
                           end,
            NewAllGuildList = lists:keystore(Order,
                                             1,
                                             AllGuildList,
                                             {Order, NewGuildList}),
            put(guild_list, NewAllGuildList),
            logger:info("收到[~ts][~w]的公会信息",
                        [Platform, ZoneId],
                        guild_war,
                        1212),
            continue(idle, State);
        _ ->
            logger:info("收到[~ts][~w]的公会信息,但是找不到对应组号",
                        [Platform, ZoneId],
                        guild_war,
                        1215),
            continue(idle, State)
    end;
handle_info({submit, Platform, ZoneId, _}, StateName,
            State) ->
    logger:info("超时收到[~tw][~w]提交的公会信息",
                [Platform, ZoneId],
                guild_war,
                1219),
    continue(StateName, State);
handle_info(gm_match, idle,
            State = #state{type = Type, mode = Mode}) ->
    NewState = case check_srv_open() of
                   true ->
                       ets:match_delete(guild_war_guild_log,
                                        #guild_war_guild{key =
                                                             {'_', Type, Mode},
                                                         _ = '_'}),
                       do_match(match, State);
                   _ -> State
               end,
    continue(idle, NewState);
handle_info(gm_match_notice, idle, State) ->
    case check_srv_open() of
        true -> do_match(match_notice, State);
        _ -> State
    end,
    continue(idle, State);
handle_info(gm_pre_match, idle, State) ->
    case check_srv_open() of
        true -> do_match(pre_match, State);
        _ -> State
    end,
    continue(idle, State);
handle_info(gm_match, StateName, State) ->
    logger:debug("活动时间中不能匹配", [], guild_war, 1248),
    continue(StateName, State);
handle_info(judge, active,
            State = #state{open_mode = OpenMode})
    when OpenMode =/= 3 ->
    logger:info("裁判时间，进行裁判", [], guild_war, 1254),
    do_judge(OpenMode),
    continue(active, State#state{is_judge = true});
handle_info(judge, StateName, State) ->
    continue(StateName, State);
handle_info(reset_match, idle, State) ->
    NewState = do_match(idle, State),
    continue(idle, NewState);
handle_info(reset_match, StateName, State) ->
    logger:info("活动时间中不能匹配", [], guild_war, 1265),
    continue(StateName, State);
handle_info({create_box, MapId, Num, WinId}, StateName,
            State) ->
    case WinId of
        {_, P, Z} ->
            do_run_mfa({P, Z}, guild_treasure, add, [WinId]);
        [_ | _] ->
            [do_run_mfa({P, Z}, guild_treasure, add, [Gid])
             || Gid = {_, P, Z} <- WinId]
    end,
    create_box({20, MapId}, Num),
    continue(StateName, State);
handle_info({create_fail_box, WinId}, StateName,
            State) ->
    case WinId of
        {_, P, Z} ->
            do_run_mfa({P, Z}, guild_treasure, add_fail, [WinId]);
        [_ | _] ->
            [do_run_mfa({P, Z}, guild_treasure, add_fail, [Gid])
             || Gid = {_, P, Z} <- WinId]
    end,
    continue(StateName, State);
handle_info(ready_to_war, StateName = active, State) ->
    ready_to_war(State),
    continue(StateName, State);
handle_info(_Info, StateName, State) ->
    logger:error("未知消息 ~w", [_Info], guild_war, 1295),
    continue(StateName, State).

terminate(_Reason, _StateName, _State) -> ok.

code_change(_OldVsn, StateName, State, _Extra) ->
    {ok, StateName, State}.

merge_guild([], GuildList) -> GuildList;
merge_guild([Guild = #guild_war_guild{id = Id} | T],
            GuildList) ->
    GuildList1 = lists:keystore(Id,
                                #guild_war_guild.id,
                                GuildList,
                                Guild),
    merge_guild(T, GuildList1).

insert_role([], _OpenMode) -> ok;
insert_role([H | T], OpenMode) ->
    insert_role(H, OpenMode),
    insert_role(T, OpenMode);
insert_role(GuildWarRole = #guild_war_role{}, 1) ->
    ets:insert(guild_war_role, GuildWarRole),
    ok;
insert_role(GuildWarRole = #guild_war_role{id =
                                               {_, P, Z}},
            2) ->
    ets:insert(guild_war_role, GuildWarRole),
    cross:cast(P,
               Z,
               ets,
               insert,
               [guild_war_role, GuildWarRole]),
    ok;
insert_role(_, _) -> ok.

insert_match(GuildMatch = #guild_war_match{}, 1) ->
    ets:insert(guild_war_match, GuildMatch),
    ok;
insert_match(GuildMatch = #guild_war_match{id =
                                               MatchId},
             2) ->
    ets:insert(guild_war_match, GuildMatch),
    Gids1 = case ets:lookup(guild_war_alliance,
                            {MatchId, 1})
                of
                [#guild_war_alliance{gids = Ids1}] -> Ids1;
                _Err -> []
            end,
    Gids2 = case ets:lookup(guild_war_alliance,
                            {MatchId, 2})
                of
                [#guild_war_alliance{gids = Ids2}] -> Ids2;
                _Err2 -> []
            end,
    GidList = Gids1 ++ Gids2,
    sync_data(group_by_platform(GidList, []),
              ets,
              insert,
              [guild_war_match, GuildMatch]),
    ok;
insert_match(_, _) -> ok.

insert_guild([], _OpenMode) -> ok;
insert_guild([H | T], OpenMode) ->
    insert_guild(H, OpenMode),
    insert_guild(T, OpenMode);
insert_guild(WarGuild = #guild_war_guild{}, 1) ->
    ets:insert(guild_war_guild, WarGuild),
    ok;
insert_guild(WarGuild = #guild_war_guild{id =
                                             {_, P, Z}},
             2) ->
    ets:insert(guild_war_guild, WarGuild),
    cross:cast(P,
               Z,
               ets,
               insert,
               [guild_war_guild, WarGuild]),
    ok;
insert_guild(_, _) -> ok.

insert_guild_log([], _OpenMode) -> ok;
insert_guild_log([H | T], OpenMode) ->
    insert_guild_log(H, OpenMode),
    insert_guild_log(T, OpenMode);
insert_guild_log(WarGuildLog = #guild_war_guild{}, 1) ->
    ets:insert(guild_war_guild_log, WarGuildLog),
    dets:insert(guild_war_guild_log, WarGuildLog),
    ok;
insert_guild_log(WarGuildLog = #guild_war_guild{id =
                                                    {_, P, Z}},
                 2) ->
    ets:insert(guild_war_guild_log, WarGuildLog),
    dets:insert(guild_war_guild_log, WarGuildLog),
    sync_data(group_by_order({P, Z}),
              ets,
              insert,
              [guild_war_guild_log, WarGuildLog]),
    sync_data(group_by_order({P, Z}),
              dets,
              insert,
              [guild_war_guild_log, WarGuildLog]),
    ok;
insert_guild_log(_, _) -> ok.

insert_guild_rank([], _OpenMode) -> ok;
insert_guild_rank([H | T], OpenMode) ->
    insert_guild_rank(H, OpenMode),
    insert_guild_rank(T, OpenMode);
insert_guild_rank(GuildRank = #guild_war_guild{}, 1) ->
    ets:insert(guild_war_rank, GuildRank),
    dets:insert(guild_war_rank, GuildRank),
    ok;
insert_guild_rank(GuildRank = #guild_war_guild{id =
                                                   {_, P, Z}},
                  2) ->
    ets:insert(guild_war_rank, GuildRank),
    dets:insert(guild_war_rank, GuildRank),
    cross:cast(P,
               Z,
               ets,
               insert,
               [guild_war_rank, GuildRank]),
    cross:cast(P,
               Z,
               dets,
               insert,
               [guild_war_rank, GuildRank]),
    ok;
insert_guild_rank(_, _) -> ok.

base_insert_guild_alliance([]) -> ok;
base_insert_guild_alliance([H | T]) ->
    ets:insert(guild_war_alliance, H),
    base_insert_guild_alliance(T).

insert_guild_alliance([], _OpenMode) -> ok;
insert_guild_alliance([H | T], OpenMode) ->
    insert_guild_alliance(H, OpenMode),
    insert_guild_alliance(T, OpenMode);
insert_guild_alliance(GuildAlliance =
                          #guild_war_alliance{},
                      1) ->
    ets:insert(guild_war_alliance, GuildAlliance),
    ok;
insert_guild_alliance(GuildAlliance =
                          #guild_war_alliance{gids = Gids1, match_id = MatchId,
                                              side = Side},
                      2) ->
    ets:insert(guild_war_alliance, GuildAlliance),
    GidList = case ets:lookup(guild_war_alliance,
                              {MatchId, get_opposite_side(Side)})
                  of
                  [#guild_war_alliance{gids = Gids2}] -> Gids1 ++ Gids2;
                  _Err -> Gids1
              end,
    sync_data(group_by_platform(GidList, []),
              ets,
              insert,
              [guild_war_alliance, GuildAlliance]),
    ok;
insert_guild_alliance(_, _) -> ok.

run_mfa(1, M, F, A) ->
    erlang:apply(M, F, A),
    ok;
run_mfa(_, M, F, A) ->
    DataList = get_cross_list(),
    do_run_mfa(DataList, M, F, A).

do_run_mfa([], _M, _F, _A) -> ok;
do_run_mfa([{{P, Z}, _} | T], M, F, A) ->
    do_run_mfa({P, Z}, M, F, A),
    do_run_mfa(T, M, F, A);
do_run_mfa({P, Z}, M, F, A) ->
    cross:cast(P, Z, M, F, A).

sync_data([], _, _, _) -> ok;
sync_data([{{P, Z}, _} | T], M, F, A) ->
    cross:cast(P, Z, M, F, A),
    sync_data(T, M, F, A).

group_by_platform([], List) -> List;
group_by_platform([Id = {_, P, Z} | T], List) ->
    Dest = c_mirror:get_zone_mapping(P, Z),
    List1 = case lists:keyfind(Dest, 1, List) of
                {_, L} ->
                    lists:keyreplace(Dest, 1, List, {Dest, [Id | L]});
                _ -> [{Dest, [Id]} | List]
            end,
    group_by_platform(T, List1).

group_by_order({P, Z}) ->
    DataList = get_cross_list(),
    RealDest = c_mirror:get_zone_mapping(P, Z),
    case lists:keyfind(RealDest, 1, DataList) of
        {_, Order} ->
            [{Dest, GetOrder}
             || {Dest, GetOrder} <- DataList, GetOrder =:= Order];
        _ -> []
    end.

get_cross_list() ->
    case env:get(center) of
        #center{center_platform = CenterPlatform,
                center_zone_id = CenterZoneId} ->
            guild_war_data:get_cross_list({CenterPlatform,
                                           CenterZoneId});
        _ -> []
    end.

delete_all_guild_role(1) ->
    ets:delete_all_objects(guild_war_role),
    ok;
delete_all_guild_role(2) ->
    ets:delete_all_objects(guild_war_role),
    DataList = get_cross_list(),
    Fun = fun ({{Platform, ZoneId}, _}) ->
                  cross:cast(Platform,
                             ZoneId,
                             ets,
                             delete_all_objects,
                             [guild_war_role])
          end,
    lists:foreach(Fun, DataList),
    ok;
delete_all_guild_role(_) -> ok.

delete_all_guild(1) ->
    ets:delete_all_objects(guild_war_guild),
    ok;
delete_all_guild(2) ->
    ets:delete_all_objects(guild_war_guild),
    DataList = get_cross_list(),
    Fun = fun ({{Platform, ZoneId}, _}) ->
                  cross:cast(Platform,
                             ZoneId,
                             ets,
                             delete_all_objects,
                             [guild_war_guild])
          end,
    lists:foreach(Fun, DataList),
    ok;
delete_all_guild(_) -> ok.

delete_all_guild_log(1) ->
    ets:delete_all_objects(guild_war_guild_log),
    dets:delete_all_objects(guild_war_guild_log),
    ok;
delete_all_guild_log(2) ->
    ets:delete_all_objects(guild_war_guild_log),
    dets:delete_all_objects(guild_war_guild_log),
    DataList = get_cross_list(),
    Fun = fun ({{Platform, ZoneId}, _}) ->
                  cross:cast(Platform,
                             ZoneId,
                             ets,
                             delete_all_objects,
                             [guild_war_guild_log]),
                  cross:cast(Platform,
                             ZoneId,
                             dets,
                             delete_all_objects,
                             [guild_war_guild_log])
          end,
    lists:foreach(Fun, DataList),
    ok;
delete_all_guild_log(_) -> ok.

delete_all_guild_rank(1) ->
    ets:delete_all_objects(guild_war_rank),
    dets:delete_all_objects(guild_war_rank),
    ok;
delete_all_guild_rank(2) ->
    ets:delete_all_objects(guild_war_rank),
    dets:delete_all_objects(guild_war_rank),
    DataList = get_cross_list(),
    Fun = fun ({{Platform, ZoneId}, _}) ->
                  cross:cast(Platform,
                             ZoneId,
                             ets,
                             delete_all_objects,
                             [guild_war_rank]),
                  cross:cast(Platform,
                             ZoneId,
                             dets,
                             delete_all_objects,
                             [guild_war_rank])
          end,
    lists:foreach(Fun, DataList),
    ok;
delete_all_guild_rank(_) -> ok.

delete_all_guild_alliance(1) ->
    ets:delete_all_objects(guild_war_alliance),
    ok;
delete_all_guild_alliance(2) ->
    ets:delete_all_objects(guild_war_alliance),
    DataList = get_cross_list(),
    Fun = fun ({{Platform, ZoneId}, _}) ->
                  cross:cast(Platform,
                             ZoneId,
                             ets,
                             delete_all_objects,
                             [guild_war_alliance])
          end,
    lists:foreach(Fun, DataList),
    ok;
delete_all_guild_alliance(_) -> ok.

delete_all_match(1) ->
    ets:delete_all_objects(guild_war_match),
    ok;
delete_all_match(2) ->
    ets:delete_all_objects(guild_war_match),
    DataList = get_cross_list(),
    Fun = fun ({{Platform, ZoneId}, _}) ->
                  cross:cast(Platform,
                             ZoneId,
                             ets,
                             delete_all_objects,
                             [guild_war_match])
          end,
    lists:foreach(Fun, DataList),
    ok;
delete_all_match(_) -> ok.

idle(timeout, State = #state{open_mode = 3}) ->
    NewState = State#state{ts = now(),
                           timeout = 1200 * 1000, is_judge = false,
                           guild_list = []},
    put(guild_memeber_num, []),
    logger:info("公会战-本服跨服进入通知阶段", [], guild_war, 1566),
    continue(ready, NewState);
idle(timeout, State = #state{open_mode = OpenMode}) ->
    State1 = State#state{ts = now(), timeout = 1200 * 1000,
                         is_judge = false, guild_list = []},
    put(guild_memeber_num, []),
    delete_all_guild_role(OpenMode),
    NewState = do_match(ready, State1),
    case check_srv_open() of
        true ->
            case env:get(guild_war_match_fail) of
                {Gid, P, Z} ->
                    do_run_mfa({P, Z}, guild_treasure, add, [{Gid, P, Z}]);
                _ -> ok
            end,
            run_mfa(OpenMode,
                    role_group,
                    pack_send,
                    [world, 15500, {1, 1200}]),
            Msg =
                notice:format(lang:get("~ts准备厅已开启，请各公会成员火速前往集结！{face_1, 7}"),
                              [{string_2, 1, lang:get("公会战")}]),
            run_mfa(OpenMode, notice, cast, [all, 5, Msg]);
        _ ->
            Msg =
                notice:format(lang:get("由于开服时间不足3天，本次~ts活动暂不开启 {face_1, 7}"),
                              [{string_2, 1, lang:get("公会战")}]),
            run_mfa(OpenMode, notice, cast, [all, 5, Msg]),
            ok
    end,
    logger:info("公会战-本服[~w]模式进入通知阶段",
                [OpenMode],
                guild_war,
                1593),
    continue(ready, NewState);
idle(_, State) -> continue(idle, State).

ready(timeout, State = #state{open_mode = 3}) ->
    OldVal = env:get(guild_war_precious_pool),
    env:save(guild_war_precious_pool, OldVal + 1),
    NewState = State#state{ts = now(),
                           timeout = agenda:get_duration(2015) * 1000},
    logger:info("公会战-本服跨服进入开始阶段", [], guild_war, 1604),
    continue(active, NewState);
ready(timeout,
      State = #state{judge_ref = OldRef,
                     open_mode = OpenMode}) ->
    case erlang:is_reference(OldRef) of
        true -> erlang:cancel_timer(OldRef);
        _ -> ok
    end,
    Ref = erlang:send_after(600 * 1000, self(), judge),
    NewState = State#state{ts = now(),
                           timeout = agenda:get_duration(2015) * 1000,
                           judge_ref = Ref},
    erlang:send_after(100 * 1000, self(), ready_to_war),
    do_match(active, NewState),
    case check_srv_open() of
        true ->
            run_mfa(OpenMode,
                    role_group,
                    pack_send,
                    [world, 15500, {2, agenda:get_duration(2015)}]),
            Msg =
                notice:format(lang:get("一触即发，~ts战场入口已经打开！看看谁能拿下第一滴血！{face_1, 7}"),
                              [{string_2, 1, lang:get("公会战")}]),
            run_mfa(OpenMode, notice, cast, [all, 5, Msg]);
        _ -> ok
    end,
    OldVal = env:get(guild_war_precious_pool),
    env:save(guild_war_precious_pool, OldVal + 1),
    logger:info("公会战-本服[~w]模式进入开始阶段",
                [OpenMode],
                guild_war,
                1628),
    continue(active, NewState);
ready(_, State) -> continue(ready, State).

active(timeout, State = #state{open_mode = 3}) ->
    NewState = State#state{ts = now(),
                           timeout = 300 * 1000},
    logger:info("公会战-本服跨服进入奖励阶段", [], guild_war, 1637),
    continue(reward, NewState);
active(timeout, State = #state{open_mode = OpenMode}) ->
    NewState = State#state{ts = now(),
                           timeout = 300 * 1000},
    stop_fighting(),
    calc_match_result(OpenMode),
    acc_score(OpenMode),
    case check_srv_open() of
        true ->
            run_mfa(OpenMode,
                    role_group,
                    pack_send,
                    [world, 15500, {3, 300}]),
            Msg =
                notice:format(lang:get("~ts顺利结束！经过一番激烈的争夺，快看看又是哪家公会领先！{face_1, "
                                       "18}"),
                              [{string_2, 1, lang:get("公会战")}]),
            run_mfa(OpenMode, notice, cast, [all, 5, Msg]);
        _ ->
            Msg =
                notice:format(lang:get("各个公会建立未满3天，公会战~ts。请各个公会加紧建设，积极备战！"),
                              [{string_2, 1, lang:get("暂不开启")}]),
            run_mfa(OpenMode, notice, cast, [all, 5, Msg]),
            ok
    end,
    logger:info("公会战-本服[~w]模式进入奖励阶段",
                [OpenMode],
                guild_war,
                1657),
    continue(reward, NewState);
active(_, State) -> continue(active, State).

reward(timeout,
       State = #state{type = Type, mode = Mode,
                      open_mode = 3}) ->
    {_, Tt} = agenda:get_state_timeout(2015, 1200),
    Timeout = Tt * 1000,
    NewType = case Type of
                  1 -> 2;
                  _ -> 1
              end,
    NewMode = case NewType of
                  1 ->
                      case Mode of
                          1 -> 2;
                          _ -> 1
                      end;
                  _ -> Mode
              end,
    env:set(guild_war_mode, NewMode),
    State1 = State#state{ts = now(), timeout = Timeout,
                         type = NewType, mode = NewMode},
    NewState = do_match(idle, State1),
    logger:info("公会战-本服跨服进入结束", [], guild_war, 1686),
    continue(idle, NewState);
reward(timeout,
       State = #state{type = Type, mode = Mode,
                      open_mode = OpenMode}) ->
    {_Label, Tt} = agenda:get_state_timeout(2015, 1200),
    Timeout = Tt * 1000,
    NewType = case Type of
                  1 -> 2;
                  _ -> 1
              end,
    NewMode = case NewType of
                  1 ->
                      case Mode of
                          1 -> 2;
                          _ -> 1
                      end;
                  _ -> Mode
              end,
    env:set(guild_war_mode, NewMode),
    State1 = State#state{ts = now(), timeout = Timeout,
                         type = NewType, mode = NewMode},
    all_leave(),
    NewState = do_match(idle, State1),
    run_mfa(OpenMode, guild_war, update_rank, []),
    run_mfa(OpenMode, guild_war, rank_reward, [Type, Mode]),
    run_mfa(OpenMode,
            role_group,
            pack_send,
            [world, 15500, {0, Tt}]),
    logger:debug("下次开始时间 ~w", [Timeout], guild_war, 1717),
    logger:info("公会战-本服[~w]模式进入结束阶段",
                [OpenMode],
                guild_war,
                1718),
    continue(idle, NewState);
reward(_, State) -> continue(reward, State).

do_cast_join_guild() ->
    DataList = get_cross_list(),
    Fun = fun ({{Platform, ZoneId}, _Order}) ->
                  logger:info("[~ts][~w]进行提交",
                              [Platform, ZoneId],
                              guild_war,
                              1730),
                  cross:cast(Platform, ZoneId, guild_war, cast_submit, [])
          end,
    lists:foreach(Fun, DataList).

get_state() ->
    {StateName, Timeout} = case
                               agenda:get_state_timeout(2015, 1200)
                               of
                               {idle, Tt} -> {idle, Tt};
                               {notice, _} -> {ready, 1200};
                               {active, _} ->
                                   {active, agenda:get_duration(2015)}
                           end,
    {StateName, Timeout * 1000}.

get_join_guild() ->
    Now = date:unixtime(),
    Conds = [{'>=', '$3', 1},
             {'>=', '$7', 50},
             {'>=', {'-', Now, '$8'}, 3600 * 24 * 3}],
    MatchSpec = [{#guild{id = '$1', name = '$2', lev = '$3',
                         leader_id = '$4', leader_name = '$5', totem = '$6',
                         mem_num = '$7', create_time = '$8', week_assets = '$9',
                         _ = '_'},
                  Conds,
                  [{#guild_war_guild{id = '$1', name = '$2', lev = '$3',
                                     leader_id = '$4', leader_name = '$5',
                                     totem = '$6', week_assets = '$9', key = "",
                                     match_id = ""}}]}],
    L = ets:select(guild_list, MatchSpec),
    L1 = set_week_assets(L),
    L2 = set_guild_score(L1),
    Platform = env:get(platform),
    ZoneId = env:get(zone_id),
    {Platform, ZoneId, L2}.

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

do_match(idle,
         State = #state{timeout = Timeout, ts = Ts,
                        match_ref = OldRef, type = Type, mode = Mode,
                        open_mode = OpenMode}) ->
    case erlang:is_reference(OldRef) of
        true -> erlang:cancel_timer(OldRef);
        _ -> ok
    end,
    clear_maps(OpenMode),
    Rest = util:time_left(Timeout, Ts),
    MatchTime = case agenda_data:get(2015) of
                    #{args := WeekDays} ->
                        date:week_next_diff(WeekDays, {15, 0, 0});
                    _ -> date:next_diff({15, 0, 0})
                end,
    logger:info("下次匹配时间 ~w, 距离开始时间 ~w",
                [MatchTime, Rest],
                guild_war,
                1783),
    Ref = case Rest div 1000 - MatchTime of
              T when T =< 0 ->
                  case find_today_matched(Type, Mode) of
                      false -> erlang:send_after(1, self(), match);
                      ok ->
                          logger:info("重启前匹配过 ~w, ~w",
                                      [Type, Mode],
                                      guild_war,
                                      1790),
                          ok
                  end;
              _ -> erlang:send_after(MatchTime * 1000, self(), match)
          end,
    State#state{match_ref = Ref};
do_match(match,
         State = #state{type = Type, next_id = NextId,
                        match_ref = OldRef, mode = Mode, open_mode = 1}) ->
    logger:info("单服模式进行匹配", [], guild_war, 1798),
    case erlang:is_reference(OldRef) of
        true -> erlang:cancel_timer(OldRef);
        _ -> ok
    end,
    clear_maps(1),
    delete_all_guild(1),
    case Type of
        1 when Mode =:= 1 ->
            delete_all_guild_rank(1),
            delete_all_guild_log(1);
        _ -> ok
    end,
    Now = date:unixtime(),
    {_Platform, _ZoneId, MatchList} = get_join_guild(),
    MatchList1 = sort_guild(MatchList, Mode, Type),
    NewNextId = do_create_match(MatchList1,
                                #{next_id => NextId, time => Now, type => Type,
                                  mode => Mode, match_type => 1,
                                  open_mode => 1}),
    delete_all_guild_role(2),
    env:save(guild_war_next_id, NewNextId),
    notice_match(),
    State#state{next_id = NewNextId};
do_match(match,
         State = #state{type = Type, next_id = NextId,
                        match_ref = OldRef, mode = Mode, open_mode = 2}) ->
    case erlang:is_reference(OldRef) of
        true -> erlang:cancel_timer(OldRef);
        _ -> ok
    end,
    clear_maps(2),
    delete_all_guild(2),
    case Type of
        1 when Mode =:= 1 ->
            logger:debug("Type:~w, Mode:~w, 删除旧的排行和记录",
                         [Type, Mode],
                         guild_war,
                         1831),
            delete_all_guild_rank(2),
            delete_all_guild_log(2);
        _ ->
            logger:debug("Type:~w, Mode:~w, 不删除旧的排行和记录",
                         [Type, Mode],
                         guild_war,
                         1835),
            ok
    end,
    Now = date:unixtime(),
    L1 = get(guild_list),
    Args = #{next_id => NextId, time => Now, type => Type,
             mode => Mode, match_type => 2, open_mode => 2},
    Fun = fun ({_Order, GuildList}, NowArgs) ->
                  L2 = sort_guild(GuildList, Mode, Type),
                  NewNextId = do_create_match(L2, NowArgs),
                  NowArgs#{next_id => NewNextId}
          end,
    #{next_id := GetNewNextId} = lists:foldl(Fun, Args, L1),
    delete_all_guild_role(2),
    env:save(guild_war_next_id, GetNewNextId),
    notice_match(),
    State#state{next_id = GetNewNextId};
do_match(match_notice, State) ->
    notice_match_guild(),
    State;
do_match(pre_match,
         State = #state{type = Type, next_id = NextId,
                        mode = Mode}) ->
    Now = date:unixtime(),
    {_, _, MatchList} = get_join_guild(),
    MatchList1 = sort_guild(MatchList, Mode, Type),
    do_create_pre_match(MatchList1,
                        #{next_id => NextId, time => Now, type => Type,
                          mode => Mode}),
    State;
do_match(ready, State = #state{open_mode = OpenMode}) ->
    L = ets:tab2list(guild_war_alliance),
    Platform = env:get(platform),
    ZoneId = env:get(zone_id),
    create_maps(Platform, ZoneId, OpenMode, L),
    State;
do_match(active,
         State = #state{open_mode = OpenMode}) ->
    L = ets:tab2list(guild_war_match),
    Platform = env:get(platform),
    ZoneId = env:get(zone_id),
    create_maps(Platform, ZoneId, OpenMode, L),
    State;
do_match(_, State) -> State.

do_create_match([], #{next_id := NextId}) ->
    env:del(guild_war_match_fail),
    NextId;
do_create_match([G1 = #guild_war_guild{id =
                                           Id1 = {_, P1, Z1}}],
                Args = #{next_id := NextId, open_mode := OpenMode}) ->
    env:save(guild_war_match_fail, Id1),
    WG1 = to(1, G1, Args),
    {Items, Assets} = {[{23014, 2}], 1000000},
    do_run_mfa({P1, Z1}, guild_loot, add, [Id1, Items]),
    do_run_mfa({P1, Z1},
               guild_common,
               add_assets,
               [Id1, {not_weekly, Assets}]),
    Content =
        notice:format(lang:get("由于参与公会战的公会总数为奇数，本轮你的公会轮空。直接获得公会战胜利，获得200点公会战积"
                               "分、~ts公会资金、~ts。下一轮公会战必定不轮空，希望公会加紧发展，积极备战！"),
                      [{string_2, 5, Assets}, {item_2, Items}]),
    Msg =
        notice:format(lang:get("本轮公会战轮空，不战而胜，获得~ts公会资金、~ts。{face_1, "
                               "18}"),
                      [{string_2, 5, Assets}, {item_2, Items}]),
    do_run_mfa({P1, Z1}, guild, notice, [Id1, Msg]),
    do_run_mfa({P1, Z1},
               guild_mgr,
               apply,
               [async,
                Id1,
                {guild_common,
                 sync_send_mail,
                 [#{content => Content,
                    from_name => lang:get("公会战议事厅")}]}]),
    acc_score(OpenMode, [WG1#guild_war_guild{score = 200}]),
    NextId + 1;
do_create_match([G1 = #guild_war_guild{id =
                                           Id1 = {_, P1, Z1},
                                       name = Name1},
                 G2 = #guild_war_guild{id = Id2 = {_, P2, Z2},
                                       name = Name2},
                 G3 = #guild_war_guild{id = Id3 = {_, P3, Z3},
                                       name = Name3},
                 G4 = #guild_war_guild{id = Id4 = {_, P4, Z4},
                                       name = Name4}
                 | T],
                Args = #{next_id := NextId, time := Now, type := Type,
                         mode := 2, match_type := MatchType,
                         open_mode := OpenMode}) ->
    WG1 = #guild_war_guild{totem = TotemId1} = to(1,
                                                  G1,
                                                  Args),
    WG2 = #guild_war_guild{totem = TotemId2} = to(2,
                                                  G2,
                                                  Args),
    WG3 = #guild_war_guild{totem = TotemId3} = to(2,
                                                  G3,
                                                  Args),
    WG4 = #guild_war_guild{totem = TotemId4} = to(1,
                                                  G4,
                                                  Args),
    B = #guild_war_match{id = {MatchType, NextId},
                         time = Now, type = Type},
    WA1 = #guild_war_alliance{id = {{MatchType, NextId}, 1},
                              gids = [Id1, Id4], names = [Name1, Name4],
                              totems = [TotemId1, TotemId4], side = 1,
                              type = Type, time = Now,
                              match_id = {MatchType, NextId}},
    WA2 = #guild_war_alliance{id = {{MatchType, NextId}, 2},
                              gids = [Id2, Id3], names = [Name2, Name3],
                              totems = [TotemId2, TotemId3], side = 2,
                              type = Type, time = Now,
                              match_id = {MatchType, NextId}},
    FmtMsg =
        lang:get("公会战对阵名单已经出炉，本公会将联合~ts公会共同对阵~ts、~ts公会，请所有成员准时参"
                 "加公会战，一同守卫我们的荣誉{face_1, 7}"),
    FmtContent =
        lang:get("本公会将于今日~ts联合~ts公会共同对阵~ts、~ts公会。请所有成员准时参加，团结一致"
                 "，共克强敌！"),
    Msg1 = notice:format(FmtMsg,
                         [{string_2, 2, Name4},
                          {string_2, 2, Name2},
                          {string_2, 2, Name3}]),
    Msg4 = notice:format(FmtMsg,
                         [{string_2, 2, Name1},
                          {string_2, 2, Name2},
                          {string_2, 2, Name3}]),
    Content1 = notice:format(FmtContent,
                             [{string_2, 5, lang:get("19:40")},
                              {string_2, 2, Name4},
                              {string_2, 2, Name2},
                              {string_2, 2, Name3}]),
    Content4 = notice:format(FmtContent,
                             [{string_2, 5, lang:get("19:40")},
                              {string_2, 2, Name1},
                              {string_2, 2, Name2},
                              {string_2, 2, Name3}]),
    do_run_mfa({P1, Z1},
               guild_common,
               send_mail,
               [Id1, "", Content1]),
    do_run_mfa({P4, Z4},
               guild_common,
               send_mail,
               [Id4, "", Content4]),
    do_run_mfa({P1, Z1}, guild, notice, [Id1, Msg1]),
    do_run_mfa({P4, Z4}, guild, notice, [Id4, Msg4]),
    Msg2 = notice:format(FmtMsg,
                         [{string_2, 2, Name3},
                          {string_2, 2, Name1},
                          {string_2, 2, Name4}]),
    Msg3 = notice:format(FmtMsg,
                         [{string_2, 2, Name2},
                          {string_2, 2, Name1},
                          {string_2, 2, Name4}]),
    Content2 = notice:format(FmtContent,
                             [{string_2, 5, lang:get("19:40")},
                              {string_2, 2, Name3},
                              {string_2, 2, Name1},
                              {string_2, 2, Name4}]),
    Content3 = notice:format(FmtContent,
                             [{string_2, 5, lang:get("19:40")},
                              {string_2, 2, Name2},
                              {string_2, 2, Name1},
                              {string_2, 2, Name4}]),
    do_run_mfa({P2, Z2},
               guild_common,
               send_mail,
               [Id2, "", Content2]),
    do_run_mfa({P3, Z3},
               guild_common,
               send_mail,
               [Id3, "", Content3]),
    do_run_mfa({P2, Z2}, guild, notice, [Id2, Msg2]),
    do_run_mfa({P3, Z3}, guild, notice, [Id3, Msg3]),
    insert_guild([WG1, WG2, WG3, WG4], OpenMode),
    insert_guild_log([WG1, WG2, WG3, WG4], OpenMode),
    base_insert_guild_alliance([WA1, WA2]),
    insert_guild_alliance([WA1, WA2], OpenMode),
    insert_match(B, OpenMode),
    do_create_match(T, Args#{next_id := NextId + 1});
do_create_match([G1 = #guild_war_guild{id =
                                           Id1 = {_, P1, Z1},
                                       name = Name1},
                 G2 = #guild_war_guild{id = Id2 = {_, P2, Z2},
                                       name = Name2},
                 G3 = #guild_war_guild{id = Id3 = {_, P3, Z3},
                                       name = Name3}
                 | T],
                Args = #{next_id := NextId, time := Now, type := Type,
                         mode := 2, match_type := MatchType,
                         open_mode := OpenMode}) ->
    WG1 = #guild_war_guild{totem = TotemId1} = to(1,
                                                  G1,
                                                  Args),
    WG2 = #guild_war_guild{totem = TotemId2} = to(2,
                                                  G2,
                                                  Args),
    WG3 = #guild_war_guild{totem = TotemId3} = to(2,
                                                  G3,
                                                  Args),
    B = #guild_war_match{id = {MatchType, NextId},
                         time = Now, type = Type},
    WA1 = #guild_war_alliance{id = {{MatchType, NextId}, 1},
                              gids = [Id1], names = [Name1],
                              totems = [TotemId1], side = 1, type = Type,
                              time = Now, match_id = {MatchType, NextId}},
    WA2 = #guild_war_alliance{id = {{MatchType, NextId}, 2},
                              gids = [Id2, Id3], names = [Name2, Name3],
                              totems = [TotemId2, TotemId3], side = 2,
                              type = Type, time = Now,
                              match_id = {MatchType, NextId}},
    FmtMsg =
        lang:get("公会战对阵名单已经出炉，本公会的对手是~ts、~ts公会，请所有成员准时参加公会战，一同守"
                 "卫我们的荣誉{face_1, 7}"),
    FmtContent =
        lang:get("本公会将于今日~ts对阵~ts、~ts公会。请所有成员准时参加，团结一致，共克强敌！"),
    Msg1 = notice:format(FmtMsg,
                         [{string_2, 2, Name2}, {string_2, 2, Name3}]),
    Content1 = notice:format(FmtContent,
                             [{string_2, 5, lang:get("19:40")},
                              {string_2, 2, Name2},
                              {string_2, 2, Name3}]),
    do_run_mfa({P1, Z1},
               guild_common,
               send_mail,
               [Id1, "", Content1]),
    do_run_mfa({P1, Z1}, guild, notice, [Id1, Msg1]),
    Msg2 =
        notice:format(lang:get("公会战对阵名单已经出炉，本公会将联合~ts公会共同对阵~ts公会，请所有成员准时参加公会战"
                               "，一同守卫我们的荣誉{face_1, 7}"),
                      [{string_2, 2, Name3}, {string_2, 2, Name1}]),
    Msg3 =
        notice:format(lang:get("公会战对阵名单已经出炉，本公会将联合~ts公会共同对阵~ts公会，请所有成员准时参加公会战"
                               "，一同守卫我们的荣誉{face_1, 7}"),
                      [{string_2, 2, Name2}, {string_2, 2, Name1}]),
    Content2 =
        notice:format(lang:get("本公会将于今日~ts联合~ts公会共同对阵~ts公会。请所有成员准时参加，团结一致，共克强敌！"),
                      [{string_2, 5, lang:get("19:40")},
                       {string_2, 2, Name3},
                       {string_2, 2, Name1}]),
    Content3 =
        notice:format(lang:get("本公会将于今日~ts联合~ts公会共同对阵~ts公会。请所有成员准时参加，团结一致，共克强敌！"),
                      [{string_2, 5, lang:get("19:40")},
                       {string_2, 2, Name2},
                       {string_2, 2, Name1}]),
    do_run_mfa({P2, Z2},
               guild_common,
               send_mail,
               [Id2, "", Content2]),
    do_run_mfa({P3, Z3},
               guild_common,
               send_mail,
               [Id3, "", Content3]),
    do_run_mfa({P2, Z2}, guild, notice, [Id2, Msg2]),
    do_run_mfa({P3, Z3}, guild, notice, [Id3, Msg3]),
    insert_guild([WG1, WG2, WG3], OpenMode),
    insert_guild_log([WG1, WG2, WG3], OpenMode),
    base_insert_guild_alliance([WA1, WA2]),
    insert_guild_alliance([WA1, WA2], OpenMode),
    insert_match(B, OpenMode),
    do_create_match(T, Args#{next_id := NextId + 1});
do_create_match([G1 = #guild_war_guild{id =
                                           Id1 = {_, P1, Z1},
                                       name = Name1},
                 G2 = #guild_war_guild{id = Id2 = {_, P2, Z2},
                                       name = Name2}
                 | T],
                Args = #{next_id := NextId, time := Now, type := Type,
                         match_type := MatchType, open_mode := OpenMode}) ->
    WG1 = #guild_war_guild{totem = TotemId1} = to(1,
                                                  G1,
                                                  Args),
    WG2 = #guild_war_guild{totem = TotemId2} = to(2,
                                                  G2,
                                                  Args),
    B = #guild_war_match{id = {MatchType, NextId},
                         time = Now, type = Type},
    WA1 = #guild_war_alliance{id = {{MatchType, NextId}, 1},
                              gids = [Id1], names = [Name1],
                              totems = [TotemId1], side = 1, type = Type,
                              time = Now, match_id = {MatchType, NextId}},
    WA2 = #guild_war_alliance{id = {{MatchType, NextId}, 2},
                              gids = [Id2], names = [Name2],
                              totems = [TotemId2], side = 2, type = Type,
                              time = Now, match_id = {MatchType, NextId}},
    Msg1 =
        notice:format(lang:get("公会战对阵名单已经出炉，本公会的对手是~ts公会，请所有成员准时参加公会战，一同守卫我们的"
                               "荣誉{face_1, 7}"),
                      [{string_2, 2, Name2}]),
    Content1 =
        notice:format(lang:get("本公会将于今日~ts对阵~ts公会。请所有成员准时参加，团结一致，共克强敌！"),
                      [{string_2, 5, lang:get("19:40")},
                       {string_2, 2, Name2}]),
    do_run_mfa({P1, Z1},
               guild_common,
               send_mail,
               [Id1, "", Content1]),
    do_run_mfa({P1, Z1}, guild, notice, [Id1, Msg1]),
    Msg2 =
        notice:format(lang:get("公会战对阵名单已经出炉，本公会的对手是~ts公会，请所有成员准时参加公会战，一同守卫我们的"
                               "荣誉{face_1, 7}"),
                      [{string_2, 2, Name1}]),
    Content2 =
        notice:format(lang:get("本公会将于今日~ts对阵~ts公会。请所有成员准时参加，团结一致，共克强敌！"),
                      [{string_2, 5, lang:get("19:40")},
                       {string_2, 2, Name1}]),
    do_run_mfa({P2, Z2},
               guild_common,
               send_mail,
               [Id2, "", Content2]),
    do_run_mfa({P2, Z2}, guild, notice, [Id2, Msg2]),
    insert_guild([WG1, WG2], OpenMode),
    insert_guild_log([WG1, WG2], OpenMode),
    base_insert_guild_alliance([WA1, WA2]),
    insert_guild_alliance([WA1, WA2], OpenMode),
    insert_match(B, OpenMode),
    do_create_match(T, Args#{next_id := NextId + 1}).

do_create_pre_match([], _) -> ok;
do_create_pre_match([#guild_war_guild{name = Name1}],
                    _Args) ->
    logger:info("公会战匹配 ~ts轮空", [Name1], guild_war, 1995),
    ok;
do_create_pre_match([#guild_war_guild{name = Name1},
                     #guild_war_guild{name = Name2},
                     #guild_war_guild{name = Name3},
                     #guild_war_guild{name = Name4}
                     | T],
                    Args = #{mode := 2}) ->
    logger:info("公会战匹配 ~ts、~ts对阵~ts、~ts",
                [Name1, Name4, Name2, Name3],
                guild_war,
                1998),
    do_create_pre_match(T, Args);
do_create_pre_match([#guild_war_guild{name = Name1},
                     #guild_war_guild{name = Name2},
                     #guild_war_guild{name = Name3}
                     | T],
                    Args = #{mode := 2}) ->
    logger:info("公会战匹配 ~ts对阵~ts、~ts",
                [Name1, Name2, Name3],
                guild_war,
                2001),
    do_create_pre_match(T, Args);
do_create_pre_match([#guild_war_guild{name = Name1},
                     #guild_war_guild{name = Name2}
                     | T],
                    Args) ->
    logger:info("公会战匹配 ~ts对阵~ts",
                [Name1, Name2],
                guild_war,
                2004),
    do_create_pre_match(T, Args).

create_maps(_, _, _, []) -> ok;
create_maps(Platform, ZoneId, OpenMode,
            [G = #guild_war_alliance{} | T]) ->
    case map_mgr:create(30006) of
        {ok, MapPid, MapId} ->
            NewG = G#guild_war_alliance{map_id = MapId,
                                        map_pid = MapPid,
                                        map_platform = Platform,
                                        map_zone_id = ZoneId},
            insert_guild_alliance(NewG, OpenMode),
            create_units({20, MapId}, [{79716, 2044, 1514}]),
            create_maps(Platform, ZoneId, OpenMode, T);
        _Err ->
            logger:error("创建准备区失败: ~w", [_Err], guild_war, 2017),
            ok
    end;
create_maps(Platform, ZoneId, OpenMode,
            [G = #guild_war_match{} | T]) ->
    case map_mgr:create(30008) of
        {ok, MapPid, MapId} ->
            NewG = G#guild_war_match{map_id = MapId,
                                     map_pid = MapPid, map_platform = Platform,
                                     map_zone_id = ZoneId},
            insert_match(NewG, OpenMode),
            create_units({20, MapId},
                         [{79717, 463, 838}, {79718, 3375, 1625}]),
            create_maps(Platform, ZoneId, OpenMode, T);
        _Err ->
            logger:error("创建战区区失败: ~w", [_Err], guild_war, 2028),
            ok
    end.

to(Side,
   #guild{id = Id, name = Name, lev = Lev,
          totem = #guild_totem{id = TotemId},
          leader_id = LeaderId, leader_name = LeaderName},
   #{next_id := NextId, time := Time, type := Type,
     mode := Mode, match_type := MatchType}) ->
    #guild_war_guild{id = Id, name = Name, lev = Lev,
                     leader_id = LeaderId, leader_name = LeaderName,
                     side = Side, match_id = {MatchType, NextId},
                     totem = TotemId, time = Time, type = Type,
                     key = {Id, Type, Mode}};
to(Side,
   #guild_war_guild{id = Id, name = Name, lev = Lev,
                    totem = #guild_totem{id = TotemId},
                    leader_id = LeaderId, leader_name = LeaderName,
                    week_assets = WAssets},
   #{next_id := NextId, time := Time, type := Type,
     mode := Mode, match_type := MatchType}) ->
    #guild_war_guild{id = Id, name = Name, lev = Lev,
                     leader_id = LeaderId, leader_name = LeaderName,
                     side = Side, match_id = {MatchType, NextId},
                     totem = TotemId, time = Time, type = Type,
                     week_assets = WAssets, key = {Id, Type, Mode}};
to(Side,
   Role = #role{id = Id, name = Name, lev = Lev, pid = Pid,
                m_guild = #m_guild{id = Gid}, sex = Sex,
                classes = Classes,
                m_team = #m_team{status = TeamStatus, pid = TeamPid},
                attr = #attr{fc = RFc}},
   MatchId) ->
    NewTeamStatue = case is_pid(TeamPid) of
                        true -> TeamStatus;
                        _ -> 0
                    end,
    Members = team:get_members(Role),
    TeamFc = util:list_avg([TFc
                            || #team_mate{fc = TFc} <- Members]
                               ++ [RFc]),
    TeamLen = length(Members) + 1,
    #guild_war_role{id = Id, name = Name, lev = Lev,
                    side = Side, match_id = MatchId, pid = Pid, gid = Gid,
                    sex = Sex, classes = Classes,
                    team_status = NewTeamStatue, team_len = TeamLen,
                    team_fc = TeamFc, movability = get_movability(Role)}.

do_join(Role = #role{pos =
                         #pos{map_base_id = OldMapBaseId},
                     name = Name, m_guild = #m_guild{id = Gid}, s_event = 18,
                     id = Id},
        #{side := Side, map_id := MapId,
          map_platform := MapPlatfrom, map_zone_id := MapZoneId,
          guild_name := GName, match_id := {WarType, MatchId}}) ->
    logger:debug("~ts 在准备区进入战场", [Name], guild_war, 2090),
    Result = case WarType of
                 1 -> call({to_war, Gid, Id});
                 _ -> cross:call(guild_war, call, [{to_war, Gid, Id}])
             end,
    case Result of
        ok when OldMapBaseId =:= 30008 ->
            {false, lang:get("你已经在战场了")};
        ok ->
            {CrossType, ToPos} = get_pos({MapPlatfrom,
                                          MapZoneId,
                                          MapId},
                                         Side,
                                         WarType),
            Role1 = do_side_looks(Side, Role#role{s_event = 17}),
            Role2 = var:set_var(Role1, day, 45, 0),
            TeamEvt = make_team_event(Role2,
                                      Side,
                                      {WarType, MatchId},
                                      false),
            case map:role_enter(ToPos,
                                TeamEvt,
                                Role2#role{cross_type = CrossType})
                of
                {error, Reason} ->
                    logger:error("[~ts]进入公会战场失败:~w",
                                 [Name, Reason],
                                 guild_war,
                                 2107),
                    {false, lang:get("进入公会战场失败")};
                {ok, NewRole} ->
                    role_misc:push_cross(NewRole),
                    team:stop_recruiting(NewRole),
                    Msg =
                        notice:format(lang:get("~ts带领队伍强势进入，~ts士气大振！{face_1, 18}"),
                                      [{role_2, Name}, {string_2, 2, GName}]),
                    guild_role:update(NewRole, doing),
                    case WarType of
                        1 -> notice:cast({map, MapId}, 22, Msg);
                        _ -> cross:cast(notice, cast, [{map, MapId}, 22, Msg])
                    end,
                    {ok, role_trigger:fire([#evt_guild_war{}], NewRole)}
            end;
        {false, Reason} -> {false, Reason};
        _Err ->
            logger:error("进入公会正式区发生错误:~w", [_Err], guild_war, 2125),
            {false, lang:get("系统繁忙，请稍后尝试")}
    end;
do_join(Role = #role{name = Name},
        #{side := Side, match_id := {WarType, MatchId},
          ready_map_id := ReadyMapId,
          ready_map_platform := ReadyMapPlatform,
          ready_map_zone_id := ReadyMapZoneId}) ->
    logger:debug("~ts 进入准备区", [Name], guild_war, 2129),
    WR = to(Side, Role, {WarType, MatchId}),
    Result = case WarType of
                 1 -> call({join, WR});
                 _ -> cross:call(guild_war, call, [{join, WR}])
             end,
    case Result of
        {ok, StateName} ->
            {CrossType, ToPos} = get_pos({ReadyMapPlatform,
                                          ReadyMapZoneId,
                                          ReadyMapId},
                                         WarType),
            Role1 = case StateName of
                        ready -> Role#role{s_event = 18};
                        _ ->
                            logger:debug("设定倒计时 ~ts", [Name], guild_war, 2143),
                            Timer = #timer{id = guild_war_to_war,
                                           timeout = 100 * 1000, times = 1,
                                           m = guild_war, f = role_callback,
                                           a = [to_war]},
                            role_timer:set(Timer, Role#role{s_event = 18})
                    end,
            Role2 = do_side_looks(Side, Role1),
            IsReady = case StateName of
                          ready -> false;
                          _ -> true
                      end,
            Role3 = var:set_var(Role2, day, 45, 0),
            TeamEvt = make_team_event(Role3,
                                      Side,
                                      {WarType, MatchId},
                                      IsReady),
            case map:role_enter(ToPos,
                                TeamEvt,
                                Role3#role{cross_type = CrossType})
                of
                {error, Reason} ->
                    logger:error("[~ts]进入公会战场失败:~w",
                                 [Name, Reason],
                                 guild_war,
                                 2156),
                    {false, lang:get("进入公会战场失败")};
                {ok, NewRole} ->
                    role_misc:push_cross(NewRole),
                    team:stop_recruiting(NewRole),
                    case CrossType of
                        0 -> skip;
                        _ ->
                            {ok, Ginfo} = role_convert:to(member, NewRole),
                            cross:cast(role_group, join, [center_world, Ginfo])
                    end,
                    {ok, NewRole}
            end;
        {false, Reason} -> {false, Reason};
        _Err ->
            logger:error("进入准备区发生错误:~w", [_Err], guild_war, 2172),
            {false, lang:get("系统繁忙，请稍后尝试")}
    end.

get_pos({MapPlatfrom, MapZoneId, MapId}, Side, 2) ->
    {X, Y} = case Side of
                 1 ->
                     util:rand_list([{3320, 1600},
                                     {3017, 1578},
                                     {3293, 1438},
                                     {2975, 1390},
                                     {2720, 1440}]);
                 _ ->
                     util:rand_list([{680, 800},
                                     {440, 800},
                                     {440, 960},
                                     {1120, 880},
                                     {920, 760}])
             end,
    {1, {MapPlatfrom, MapZoneId, MapId, X, Y}};
get_pos({_, _, MapId}, Side, _) ->
    {X, Y} = case Side of
                 1 ->
                     util:rand_list([{3320, 1600},
                                     {3017, 1578},
                                     {3293, 1438},
                                     {2975, 1390},
                                     {2720, 1440}]);
                 _ ->
                     util:rand_list([{680, 800},
                                     {440, 800},
                                     {440, 960},
                                     {1120, 880},
                                     {920, 760}])
             end,
    {0, {MapId, X, Y}}.

get_pos({Platform, ZoneId, MapId}, 2) ->
    case map_data:get(30006) of
        {ok, #map_data{revive = [{X, Y} | _]}} ->
            {1, {Platform, ZoneId, MapId, X, Y}};
        _ -> {1, {Platform, ZoneId, MapId, 1450, 1051}}
    end;
get_pos({_, _, MapId}, _) ->
    case map_data:get(30006) of
        {ok, #map_data{revive = [{X, Y} | _]}} ->
            {0, {MapId, X, Y}};
        _ -> {0, {MapId, 1450, 1051}}
    end.

do_side_looks(Side,
              Role = #role{m_guild = #m_guild{post = Post}}) ->
    HonorId = guild_role:post2honor(Post),
    NRole = case honor:use(replace, Role, HonorId, push) of
                {ok, Role1} -> Role1;
                _ -> Role
            end,
    Look2 = {64, 0, Side, ""},
    looks:add(Look2, NRole, replace).

combat_check(Role = #role{id = Id = {_, Splat, Szone}},
             TargetId = {_, Tplat, Tzone}, Now) ->
    case role_query:rec(by_id, TargetId, fighter_wrap) of
        {ok, #fighter_wrap{status = 2}} ->
            {false, lang:get("对方在战斗中")};
        {ok, Target = #fighter_wrap{s_event = 17}} ->
            case cross:call(Tplat,
                            Tzone,
                            ets,
                            lookup,
                            [guild_war_role, TargetId])
                of
                [#guild_war_role{last_killed = Last}]
                    when Now - Last < 90 ->
                    {false,
                     notice:format(lang:get("对方才刚刚战败了，请稍后~ts秒"),
                                   [{string_2, 5, 90 - (Now - Last)}])};
                [#guild_war_role{last_win = Last}]
                    when Now - Last < 30 ->
                    {false,
                     notice:format(lang:get("对方才刚刚战斗完，请稍后~ts秒"),
                                   [{string_2, 5, 30 - (Now - Last)}])};
                [#guild_war_role{movability = M, match_id = DfdGid,
                                 side = DfdSide}]
                    when M >= 0 ->
                    {Flag1, AtkList} = team:get_fighters(Role),
                    {Flag2, DfdList} = team:get_fighters(Target),
                    case Flag1 =:= ok andalso Flag2 =:= ok of
                        true ->
                            case check_team_mate(AtkList) of
                                ok ->
                                    AtkGroup = case cross:call(Splat,
                                                               Szone,
                                                               ets,
                                                               lookup,
                                                               [guild_war_role,
                                                                Id])
                                                   of
                                                   [#guild_war_role{match_id =
                                                                        TmpAtkGid,
                                                                    side =
                                                                        TmpAtkSide}] ->
                                                       {TmpAtkGid, TmpAtkSide};
                                                   _ -> {{0, 0}, 1}
                                               end,
                                    ObserverArgs = {observer_args,
                                                    [{0, AtkGroup},
                                                     {1, {DfdGid, DfdSide}}]},
                                    StartArgs = #combat_start_args{ext_args =
                                                                       [ObserverArgs,
                                                                        {match_id,
                                                                         DfdGid}]},
                                    case combat_mgr:start_combat(105,
                                                                 AtkList,
                                                                 DfdList,
                                                                 StartArgs)
                                        of
                                        {ok, _Pid} -> ok;
                                        _ -> {false, lang:get("对方正忙，无法发起战斗")}
                                    end;
                                Else -> Else
                            end;
                        false -> {false, lang:get("无法发起战斗")}
                    end;
                _ -> {false, lang:get("对方行动力不足了")}
            end;
        {ok, #fighter_wrap{s_event = 18}} ->
            role:apply(async,
                       TargetId,
                       {guild_war, role_callback, [to_war]}),
            {false, lang:get("对方还没准备好")};
        _ ->
            case cross:call(Tplat,
                            Tzone,
                            ets,
                            lookup,
                            [guild_war_role, TargetId])
                of
                [#guild_war_role{movability = M, pid = Pid,
                                 match_id = {WarType, _}}]
                    when M > 0 andalso is_pid(Pid) ->
                    case WarType of
                        2 -> cross:cast(guild_war, cast, [{leave, TargetId}]);
                        _ -> cast({leave, TargetId})
                    end;
                _ -> ok
            end,
            {false, lang:get("对方不在公会战中")}
    end.

cast_enemy(AtkList, DfdList, ExtArgs) ->
    #fighter{name = AName} = lists:keyfind(1,
                                           #fighter.is_leader,
                                           AtkList),
    #fighter{name = DName} = lists:keyfind(1,
                                           #fighter.is_leader,
                                           DfdList),
    Msg = notice:format(lang:get("向~ts带领的队伍主动发起攻击！"),
                        [{role_2, DName}]),
    Msg2 = notice:format(lang:get("你遭遇了~ts的队伍！"),
                         [{role_2, AName}]),
    Ids2 = encounter_notice(DfdList, Msg2),
    Ids = encounter_notice(AtkList, Msg),
    logger:debug("发起攻击ids ~w", [Ids], guild_war, 2279),
    case lists:keyfind(match_id, 1, ExtArgs) of
        {_, {2, _}} ->
            cross:cast(guild_war,
                       cast,
                       [{combat_start, Ids, Ids2}]);
        _ -> cast({combat_start, Ids, Ids2})
    end.

calc_fighter(_Type, _IsJudge, [], _OpenMode) -> ok;
calc_fighter(Type, IsJudge,
             L = [#fighter{origin_id = Id} | _], OpenMode) ->
    case ets:lookup(guild_war_role, Id) of
        [#guild_war_role{match_id = MatchId, side = Side,
                         gid = Gid}] ->
            acc_win(Type, Gid, OpenMode),
            case ets:lookup(guild_war_alliance, {MatchId, Side}) of
                [A = #guild_war_alliance{}] ->
                    calc_fighter(Type, IsJudge, L, A, OpenMode);
                _ ->
                    logger:error("找不到公会联盟信息[~w]",
                                 [{MatchId, Side}],
                                 guild_war,
                                 2297),
                    ok
            end;
        _ ->
            logger:error("找不到角色参战信息[~w]", [Id], guild_war, 2301),
            ok
    end.

calc_fighter(Type, true, [],
             A0 = #guild_war_alliance{side = Side,
                                      match_id = MatchId, remain_num = 0,
                                      win = Win, lost = Lost},
             OpenMode) ->
    A = case Type of
            {win, _} -> A0#guild_war_alliance{win = Win + 1};
            _ -> A0#guild_war_alliance{lost = Lost + 1}
        end,
    case ets:lookup(guild_war_match, MatchId) of
        [M = #guild_war_match{map_pid = Pid, win_side = 0}] ->
            case ets:lookup(guild_war_alliance,
                            {MatchId, get_opposite_side(Side)})
                of
                [A2 = #guild_war_alliance{}] ->
                    save_result(OpenMode,
                                get_opposite_side(Side),
                                M,
                                A2,
                                A);
                _ ->
                    logger:error("找不到联盟 ~w",
                                 [{MatchId, get_opposite_side(Side)}],
                                 guild_war,
                                 2317),
                    ok
            end,
            map:async_apply(Pid,
                            {guild_war, role_callback, [{push, 15501}]});
        [M = #guild_war_match{}] ->
            logger:error("战区已结算 ~w", [M], guild_war, 2322),
            ok;
        _ ->
            logger:error("找不到战区", [], guild_war, 2325),
            ok
    end,
    ok;
calc_fighter(Type, true, [],
             A0 = #guild_war_alliance{side = Side,
                                      match_id = MatchId, remain_num = M1,
                                      movability = M1, win = Win, lost = Lost},
             OpenMode) ->
    A = case Type of
            {win, _} -> A0#guild_war_alliance{win = Win + 1};
            _ -> A0#guild_war_alliance{lost = Lost + 1}
        end,
    case ets:lookup(guild_war_match, MatchId) of
        [H = #guild_war_match{map_pid = Pid, win_side = 0}] ->
            case ets:lookup(guild_war_alliance,
                            {MatchId, get_opposite_side(Side)})
                of
                [A2 = #guild_war_alliance{remain_num = M2,
                                          movability = M2}]
                    when M2 > M1 ->
                    save_result(OpenMode,
                                get_opposite_side(Side),
                                H,
                                A2,
                                A);
                [A2 = #guild_war_alliance{remain_num = M2,
                                          movability = M2}]
                    when M2 < M1 ->
                    save_result(OpenMode, Side, H, A, A2);
                [A2 = #guild_war_alliance{remain_num = M1,
                                          movability = M1}] ->
                    save_result(OpenMode, 3, H, A, A2);
                _ ->
                    insert_guild_alliance(A, OpenMode),
                    ok
            end,
            map:async_apply(Pid,
                            {guild_war, role_callback, [{push, 15501}]});
        [H = #guild_war_match{}] ->
            logger:error("战区已结算 ~w", [H], guild_war, 2350),
            ok;
        _ ->
            logger:error("找不到战区", [], guild_war, 2353),
            ok
    end,
    ok;
calc_fighter(lost, _, [],
             A = #guild_war_alliance{match_id = MatchId,
                                     lost = Lost},
             OpenMode) ->
    NewA = A#guild_war_alliance{lost = Lost + 1},
    insert_guild_alliance(NewA, OpenMode),
    map_async({match, MatchId},
              {guild_war, role_callback, [{push, 15501}]}),
    ok;
calc_fighter(_, _, [],
             A = #guild_war_alliance{win = Win, match_id = MatchId},
             OpenMode) ->
    NewA = A#guild_war_alliance{win = Win + 1},
    insert_guild_alliance(NewA, OpenMode),
    map_async({match, MatchId},
              {guild_war, role_callback, [{push, 15501}]}),
    ok;
calc_fighter({win, AddScore}, IsJudge,
             [#fighter{origin_id = Id} | T],
             A = #guild_war_alliance{remain_num = Remain},
             OpenMode) ->
    case ets:lookup(guild_war_role, Id) of
        [R = #guild_war_role{pid = Pid, win = RWin,
                             movability = 0, score = Score}] ->
            NewR = R#guild_war_role{win = RWin + 1,
                                    score = Score + AddScore,
                                    last_win = date:unixtime()},
            insert_role(NewR, OpenMode),
            role:apply(async,
                       Pid,
                       {guild_war, role_callback, [{push, 15505}]}),
            role:apply(async,
                       Pid,
                       {guild_war, role_callback, [leave_by_movability]}),
            notice:send({pid, Pid},
                        3,
                        lang:get("战斗胜利，公会又向胜利迈进一步！")),
            calc_fighter({win, AddScore},
                         IsJudge,
                         T,
                         A#guild_war_alliance{remain_num = max(0, Remain - 1)},
                         OpenMode);
        [R = #guild_war_role{pid = Pid, win = RWin,
                             score = Score}] ->
            NewR = R#guild_war_role{win = RWin + 1,
                                    score = Score + AddScore,
                                    last_win = date:unixtime()},
            insert_role(NewR, OpenMode),
            role:apply(async,
                       Pid,
                       {guild_war, role_callback, [{push, 15505}]}),
            notice:send({pid, Pid},
                        3,
                        lang:get("战斗胜利，公会又向胜利迈进一步！")),
            calc_fighter({win, AddScore}, IsJudge, T, A, OpenMode);
        _ ->
            calc_fighter({win, AddScore}, IsJudge, T, A, OpenMode)
    end;
calc_fighter(lost, IsJudge,
             [#fighter{origin_id = Id} | T],
             A = #guild_war_alliance{movability = Gm,
                                     remain_num = Remain},
             OpenMode) ->
    case ets:lookup(guild_war_role, Id) of
        [R = #guild_war_role{movability = Rm, pid = Pid,
                             side = Side}] ->
            NewRm = max(0, Rm - 300),
            NewRemain = case NewRm of
                            0 -> max(0, Remain - 1);
                            _ -> Remain
                        end,
            NewR = R#guild_war_role{movability = NewRm,
                                    last_killed = date:unixtime()},
            insert_role(NewR, OpenMode),
            role:apply(async,
                       Pid,
                       {guild_war, role_callback, [{lost, NewR, Side}]}),
            calc_fighter(lost,
                         IsJudge,
                         T,
                         A#guild_war_alliance{movability =
                                                  max(NewRm,
                                                      Gm - max(0, Rm - NewRm)),
                                              remain_num = NewRemain},
                         OpenMode);
        _ -> calc_fighter(lost, IsJudge, T, A, OpenMode)
    end.

make_team_event(Role = #role{s_event = Event}, Side,
                MatchId, IsReady) ->
    case check_team(Role) of
        [] -> self;
        MateIds when Event =:= 18 ->
            #{label => enter_event, event => Event,
              role_ids => MateIds,
              mfa =>
                  {guild_war,
                   role_callback,
                   [{follow_join, Side, MatchId, Event, IsReady}]}};
        MateIds when Event =:= 17 ->
            #{label => enter_event, event => Event,
              role_ids => MateIds,
              mfa => {guild_war, role_callback, [follow_to_war]}};
        MateIds ->
            #{label => exit_event, event => Event,
              role_ids => MateIds,
              mfa => {guild_war, role_callback, [follow_leave]}}
    end.

check_team(Role = #role{m_team =
                            #m_team{pid = Pid, status = 1}})
    when is_pid(Pid) ->
    Now = date:unixtime(),
    case team:get_members(Role) of
        TeamList = [_ | _] ->
            [Id
             || Mate = #team_mate{id = Id, status = 2} <- TeamList,
                can_team_join(Role, Mate, Now)];
        _ -> []
    end;
check_team(_) -> [].

can_team_join(Role, Mate, Now) ->
    do_can_team_join([lev,
                      world_lev,
                      guild,
                      movability,
                      to_war,
                      enter_time],
                     Role,
                     Mate,
                     Now).

do_can_team_join([], _, _, _) -> true;
do_can_team_join([lev | T], Role,
                 Mate = #team_mate{lev = Lev, name = Name, pid = Pid},
                 Now) ->
    case Lev >= 30 of
        true -> do_can_team_join(T, Role, Mate, Now);
        _ ->
            Msg = notice:format(lang:get("队员~ts等级不足~ts级，自动离开了队伍"),
                                [{role_2, Name}, {string_2, 5, 30}]),
            team:notice(Role, Msg),
            role:apply(async, Pid, {team, async_leave, []}),
            false
    end;
do_can_team_join([world_lev | T], Role,
                 Mate = #team_mate{name = Name, pid = Pid}, Now) ->
    Lev = lev_break:lev(Mate),
    {WorldLev, _} = world_lev:get_world_lev(Role),
    case abs(Lev - WorldLev) < 25 of
        true -> do_can_team_join(T, Role, Mate, Now);
        _ ->
            Msg =
                notice:format(lang:get("队员~ts等级低于世界等级~ts级，自动离开了队伍"),
                              [{role_2, Name}, {string_2, 5, 25}]),
            team:notice(Role, Msg),
            role:apply(async, Pid, {team, async_leave, []}),
            false
    end;
do_can_team_join([guild | T],
                 Role = #role{id = LeaderId},
                 Mate = #team_mate{id = Id, name = Name, pid = Pid},
                 Now) ->
    case check_alliance(LeaderId, Id) of
        true -> do_can_team_join(T, Role, Mate, Now);
        _ ->
            Msg =
                notice:format(lang:get("队员~ts和队长不在同一公会联盟，自动离开了队伍"),
                              [{role_2, Name}]),
            team:notice(Role, Msg),
            role:apply(async, Pid, {team, async_leave, []}),
            false
    end;
do_can_team_join([movability | T], Role,
                 Mate = #team_mate{id = Id, name = Name, pid = Pid},
                 Now) ->
    case check_movability(Id) of
        true -> do_can_team_join(T, Role, Mate, Now);
        _ ->
            Msg = notice:format(lang:get("队员~ts行动力不足，自动离开了队伍"),
                                [{role_2, Name}]),
            team:notice(Role, Msg),
            role:apply(async, Pid, {team, async_leave, []}),
            false
    end;
do_can_team_join([to_war | T], Role,
                 Mate = #team_mate{id = Id, name = Name, pid = Pid},
                 Now) ->
    case check_to_war(Id) of
        true -> do_can_team_join(T, Role, Mate, Now);
        _ ->
            Msg = notice:format(lang:get("队员~ts不能进入战场，自动离开了队伍"),
                                [{role_2, Name}]),
            team:notice(Role, Msg),
            role:apply(async, Pid, {team, async_leave, []}),
            false
    end;
do_can_team_join([enter_time | T], Role,
                 Mate = #team_mate{id = Id = {_, P, Z}, name = Name,
                                   pid = Pid},
                 Now) ->
    Open = case date:open_srv_day() of
               N when is_integer(N) -> N;
               _ -> 1
           end,
    case cross:call(P, Z, guild_role, get, [Id]) of
        #guild_role{} when Open =< 7 ->
            do_can_team_join(T, Role, Mate, Now);
        #guild_role{enter_time = Entered}
            when Now - Entered >= 3600 * 24 * 3 ->
            do_can_team_join(T, Role, Mate, Now);
        _ ->
            Msg = notice:format(lang:get("队员~ts入会时间不足3天，自动离开了队伍"),
                                [{role_2, Name}]),
            team:notice(Role, Msg),
            role:apply(async, Pid, {team, async_leave, []}),
            false
    end.

clear_maps(3) -> skip;
clear_maps(OpenMode) ->
    do_clear_maps(ets:tab2list(guild_war_alliance)),
    do_clear_maps(ets:tab2list(guild_war_match)),
    delete_all_guild_alliance(OpenMode),
    delete_all_match(OpenMode),
    ok.

do_clear_maps([]) -> ok;
do_clear_maps([#guild_war_alliance{map_pid = Pid}
               | T]) ->
    clear_units(Pid),
    map:stop(Pid),
    do_clear_maps(T);
do_clear_maps([#guild_war_match{map_pid = Pid} | T]) ->
    clear_units(Pid),
    map:stop(Pid),
    do_clear_maps(T).

stop_fighting() ->
    stop_fighting(ets:tab2list(guild_war_role)).

stop_fighting([]) -> ok;
stop_fighting([#guild_war_role{pid = Pid} | T])
    when is_pid(Pid) ->
    role:apply(async,
               Pid,
               {guild_war, role_callback, [stop_fighting]}),
    stop_fighting(T);
stop_fighting([_ | T]) -> stop_fighting(T).

all_leave() ->
    all_leave(ets:tab2list(guild_war_role)),
    all_leave(ets:tab2list(guild_war_alliance)).

all_leave([]) -> ok;
all_leave([#guild_war_role{pid = Pid} | T])
    when is_pid(Pid) ->
    role:apply(async,
               Pid,
               {guild_war, role_callback, [leave]}),
    all_leave(T);
all_leave([#guild_war_alliance{map_pid = Pid} | T])
    when is_pid(Pid) ->
    map:async_apply(Pid,
                    {guild_war, role_callback, [leave]}),
    all_leave(T);
all_leave([_ | T]) -> all_leave(T).

check_movability(#role{id = Id}) ->
    check_movability(Id);
check_movability(Id = {_, P, Z}) ->
    case cross:call(P, Z, ets, lookup, [guild_war_role, Id])
        of
        [#guild_war_role{movability = M}] when M < 1 -> false;
        _ -> true
    end.

check_to_war(#role{id = Id}) -> check_to_war(Id);
check_to_war(Id = {_, P, Z}) ->
    case cross:call(P, Z, ets, lookup, [guild_war_role, Id])
        of
        [#guild_war_role{to_war = Acc}] when Acc > 0 -> false;
        _ -> true
    end.

map_async({match, Id}, MFA) ->
    case ets:lookup(guild_war_match, Id) of
        [#guild_war_match{map_pid = Pid}] ->
            map_async(Pid, MFA);
        _ -> ok
    end;
map_async(#guild_war_match{pid = Pid}, MFA) ->
    map_async(Pid, MFA);
map_async(Pid, MFA) when is_pid(Pid) ->
    map:async_apply(Pid, MFA);
map_async(_, _) -> ok.

handle_join(WR = #guild_war_role{id = Id, pid = Pid,
                                 movability = Rm1, gid = Gid},
            StateName, OpenMode) ->
    {WR2, AddNum} = case ets:lookup(guild_war_role, Id) of
                        [WR1 = #guild_war_role{movability = Rm2}]
                            when StateName =:= active ->
                            {WR1#guild_war_role{pid = Pid,
                                                movability = max(0, Rm2 - 0)},
                             0};
                        [] when StateName =:= active ->
                            {WR#guild_war_role{movability = max(0, Rm1 - 0)},
                             1};
                        [WR1 = #guild_war_role{}] ->
                            {WR1#guild_war_role{pid = Pid}, 0};
                        [] -> {WR, 1};
                        _E ->
                            logger:error("其他参与类型 ~w", [_E], guild_war, 2580),
                            {WR, 1}
                    end,
    #guild_war_role{match_id = MatchId, side = Side,
                    movability = Rm} =
        WR2,
    insert_role(WR2, OpenMode),
    case ets:lookup(guild_war_guild, Gid) of
        [G = #guild_war_guild{member_num = GMnum}] ->
            insert_guild(G#guild_war_guild{member_num =
                                               GMnum + AddNum},
                         OpenMode);
        _ -> ok
    end,
    case Rm1 of
        1000 -> ignore;
        _ ->
            notice:send(Id,
                        3,
                        notice:format(lang:get("受世界等级与公会职位影响，你的行动力减少为~ts"),
                                      [{string_2, 5, Rm1}]))
    end,
    role:apply(async,
               Pid,
               {guild_war, role_callback, [{push, 15505}]}),
    case ets:lookup(guild_war_alliance, {MatchId, Side}) of
        [A = #guild_war_alliance{movability = Gm,
                                 member_num = Mnum, remain_num = Rnum,
                                 match_id = MatchId, members = Mems}]
            when Rm < 1 ->
            Mems1 = [Id | Mems -- [Id]],
            NewA = A#guild_war_alliance{movability = Gm + Rm,
                                        member_num = Mnum + AddNum,
                                        remain_num = Rnum, members = Mems1},
            insert_guild_alliance(NewA, OpenMode),
            map_async({match, MatchId},
                      {guild_war, role_callback, [{push, 15501}]});
        [A = #guild_war_alliance{movability = Gm,
                                 member_num = Mnum, remain_num = Rnum,
                                 match_id = MatchId, members = Mems}] ->
            Mems1 = [Id | Mems -- [Id]],
            NewA = A#guild_war_alliance{movability = Gm + Rm,
                                        member_num = Mnum + AddNum,
                                        remain_num = Rnum + 1, members = Mems1},
            insert_guild_alliance(NewA, OpenMode),
            map_async({match, MatchId},
                      {guild_war, role_callback, [{push, 15501}]});
        _R ->
            logger:error("找不到联盟 ~w ~w",
                         [{MatchId, Side}, _R],
                         guild_war,
                         2611),
            ok
    end.

calc_match_result(OpenMode) ->
    L = ets:tab2list(guild_war_match),
    calc_match_result(OpenMode, L).

calc_match_result(_OpenMode, []) -> [];
calc_match_result(OpenMode,
                  [H = #guild_war_match{win_side = 0, id = MatchId}
                   | T]) ->
    case {ets:lookup(guild_war_alliance, {MatchId, 1}),
          ets:lookup(guild_war_alliance, {MatchId, 2})}
        of
        {[A1 = #guild_war_alliance{remain_num = M1}],
         [A2 = #guild_war_alliance{remain_num = M2}]}
            when M1 > M2 ->
            save_result(OpenMode, 1, H, A1, A2),
            calc_match_result(OpenMode, T);
        {[A1 = #guild_war_alliance{movability = M1,
                                   remain_num = Rnum}],
         [A2 = #guild_war_alliance{movability = M2,
                                   remain_num = Rnum}]}
            when M1 > M2 ->
            save_result(OpenMode, 1, H, A1, A2),
            calc_match_result(OpenMode, T);
        {[A1 = #guild_war_alliance{movability = M,
                                   remain_num = Rem}],
         [A2 = #guild_war_alliance{remain_num = Rem,
                                   movability = M}]} ->
            save_result(OpenMode, 3, H, A1, A2),
            calc_match_result(OpenMode, T);
        {[A1 = #guild_war_alliance{}],
         [A2 = #guild_war_alliance{}]} ->
            save_result(OpenMode, 2, H, A2, A1),
            calc_match_result(OpenMode, T);
        _Else ->
            logger:error("战场结算异常 ~w", [_Else], guild_war, 2635),
            calc_match_result(OpenMode, T)
    end;
calc_match_result(OpenMode, [_ | T]) ->
    calc_match_result(OpenMode, T).

result_reward([], _) -> ok;
result_reward([Id | T], Type) ->
    case ets:lookup(guild_war_role, Id) of
        [#guild_war_role{pid = Pid}] when is_pid(Pid) ->
            role:apply(async,
                       Pid,
                       {guild_war, role_callback, [{reward, Type}]});
        _ -> ok
    end,
    result_reward(T, Type).

notice_match() ->
    case do_notice_match(ets:tab2list(guild_war_match), [])
        of
        [] -> ok;
        Arr ->
            Fmt =
                lang:get("公会战对阵名单已经出炉，具体安排如下：\n~ts\n谁才是最强大的公会，让我们拭目以待！{"
                         "face_1, 18}"),
            Fun = fun ({Order, MsgList}) ->
                          DataList = get_cross_list(),
                          CastList = [Dest
                                      || {Dest, GetOrder} <- DataList,
                                         GetOrder =:= Order],
                          Res = string:join(MsgList, "、\n"),
                          Msg = notice:format(Fmt, [{string_1, [Res]}]),
                          lists:foreach(fun ({P, Z}) ->
                                                cross:cast(P,
                                                           Z,
                                                           notice,
                                                           cast,
                                                           [all, 5, Msg])
                                        end,
                                        CastList)
                  end,
            lists:foreach(Fun, Arr)
    end.

do_notice_match([], DestList) -> DestList;
do_notice_match([#guild_war_match{id = MatchId} | T],
                DestList) ->
    case {ets:lookup(guild_war_alliance, {MatchId, 1}),
          ets:lookup(guild_war_alliance, {MatchId, 2})}
        of
        {[#guild_war_alliance{gids = Gids1, names = Name1}],
         [#guild_war_alliance{gids = Gids2, names = Name2}]} ->
            Msg = notice:format(lang:get("~ts 对阵 ~ts"),
                                [{string_2, 2, get_alliance_name(Name1)},
                                 {string_2, 2, get_alliance_name(Name2)}]),
            Order = find_order(Gids1 ++ Gids2),
            NewMsgList = case lists:keyfind(Order, 1, DestList) of
                             {_, MsgList} -> [Msg | MsgList];
                             _ -> [Msg]
                         end,
            NewDestList = lists:keystore(Order,
                                         1,
                                         DestList,
                                         {Order, NewMsgList}),
            do_notice_match(T, NewDestList);
        _ -> do_notice_match(T, DestList)
    end.

find_order([]) -> 0;
find_order(GidList) ->
    DataList = get_cross_list(),
    find_order(GidList, DataList).

find_order([], _) -> 0;
find_order([{_, P, Z} | T], DataList) ->
    RealDest = c_mirror:get_zone_mapping(P, Z),
    case lists:keyfind(RealDest, 1, DataList) of
        {_, Order} -> Order;
        _ -> find_order(T, DataList)
    end;
find_order([_ | T], DataList) ->
    find_order(T, DataList).

notice_match_guild() ->
    do_notice_match_guild(ets:tab2list(guild_war_match)).

do_notice_match_guild([]) -> [];
do_notice_match_guild([#guild_war_match{id = MatchId}
                       | T]) ->
    case {ets:lookup(guild_war_alliance, {MatchId, 1}),
          ets:lookup(guild_war_alliance, {MatchId, 2})}
        of
        {[#guild_war_alliance{gids = [Id1, Id4],
                              names = [Name1, Name4]}],
         [#guild_war_alliance{gids = [Id2, Id3],
                              names = [Name2, Name3]}]} ->
            FmtMsg =
                lang:get("公会战对阵名单已经出炉，本公会将联合~ts公会共同对阵~ts、~ts公会，请所有成员准时参"
                         "加公会战，一同守卫我们的荣誉{face_1, 7}"),
            FmtContent =
                lang:get("本公会将于今日~ts联合~ts公会共同对阵~ts、~ts公会。请所有成员准时参加，团结一致"
                         "，共克强敌！"),
            Msg1 = notice:format(FmtMsg,
                                 [{string_2, 2, Name4},
                                  {string_2, 2, Name2},
                                  {string_2, 2, Name3}]),
            Msg4 = notice:format(FmtMsg,
                                 [{string_2, 2, Name1},
                                  {string_2, 2, Name2},
                                  {string_2, 2, Name3}]),
            Content1 = notice:format(FmtContent,
                                     [{string_2, 5, lang:get("19:40")},
                                      {string_2, 2, Name4},
                                      {string_2, 2, Name2},
                                      {string_2, 2, Name3}]),
            Content4 = notice:format(FmtContent,
                                     [{string_2, 5, lang:get("19:40")},
                                      {string_2, 2, Name1},
                                      {string_2, 2, Name2},
                                      {string_2, 2, Name3}]),
            guild_common:send_mail(Id1, "", Content1),
            guild_common:send_mail(Id4, "", Content4),
            guild:notice(Id1, Msg1),
            guild:notice(Id4, Msg4),
            Msg2 = notice:format(FmtMsg,
                                 [{string_2, 2, Name3},
                                  {string_2, 2, Name1},
                                  {string_2, 2, Name4}]),
            Msg3 = notice:format(FmtMsg,
                                 [{string_2, 2, Name2},
                                  {string_2, 2, Name1},
                                  {string_2, 2, Name4}]),
            Content2 = notice:format(FmtContent,
                                     [{string_2, 5, lang:get("19:40")},
                                      {string_2, 2, Name3},
                                      {string_2, 2, Name1},
                                      {string_2, 2, Name4}]),
            Content3 = notice:format(FmtContent,
                                     [{string_2, 5, lang:get("19:40")},
                                      {string_2, 2, Name2},
                                      {string_2, 2, Name1},
                                      {string_2, 2, Name4}]),
            guild_common:send_mail(Id2, "", Content2),
            guild_common:send_mail(Id3, "", Content3),
            guild:notice(Id2, Msg2),
            guild:notice(Id3, Msg3);
        {[#guild_war_alliance{gids = [Id1], names = [Name1]}],
         [#guild_war_alliance{gids = [Id2, Id3],
                              names = [Name2, Name3]}]} ->
            FmtMsg =
                lang:get("公会战对阵名单已经出炉，本公会的对手是~ts、~ts公会，请所有成员准时参加公会战，一同守"
                         "卫我们的荣誉{face_1, 7}"),
            FmtContent =
                lang:get("本公会将于今日~ts对阵~ts、~ts公会。请所有成员准时参加，团结一致，共克强敌！"),
            Msg1 = notice:format(FmtMsg,
                                 [{string_2, 2, Name2}, {string_2, 2, Name3}]),
            Content1 = notice:format(FmtContent,
                                     [{string_2, 5, lang:get("19:40")},
                                      {string_2, 2, Name2},
                                      {string_2, 2, Name3}]),
            guild_common:send_mail(Id1, "", Content1),
            guild:notice(Id1, Msg1),
            Msg2 =
                notice:format(lang:get("公会战对阵名单已经出炉，本公会将联合~ts公会共同对阵~ts公会，请所有成员准时参加公会战"
                                       "，一同守卫我们的荣誉{face_1, 7}"),
                              [{string_2, 2, Name3}, {string_2, 2, Name1}]),
            Msg3 =
                notice:format(lang:get("公会战对阵名单已经出炉，本公会将联合~ts公会共同对阵~ts公会，请所有成员准时参加公会战"
                                       "，一同守卫我们的荣誉{face_1, 7}"),
                              [{string_2, 2, Name2}, {string_2, 2, Name1}]),
            Content2 =
                notice:format(lang:get("本公会将于今日~ts联合~ts公会共同对阵~ts公会。请所有成员准时参加，团结一致，共克强敌！"),
                              [{string_2, 5, lang:get("19:40")},
                               {string_2, 2, Name3},
                               {string_2, 2, Name1}]),
            Content3 =
                notice:format(lang:get("本公会将于今日~ts联合~ts公会共同对阵~ts公会。请所有成员准时参加，团结一致，共克强敌！"),
                              [{string_2, 5, lang:get("19:40")},
                               {string_2, 2, Name2},
                               {string_2, 2, Name1}]),
            guild_common:send_mail(Id2, "", Content2),
            guild_common:send_mail(Id3, "", Content3),
            guild:notice(Id2, Msg2),
            guild:notice(Id3, Msg3);
        {[#guild_war_alliance{gids = [Id2, Id3],
                              names = [Name2, Name3]}],
         [#guild_war_alliance{gids = [Id1], names = [Name1]}]} ->
            FmtMsg =
                lang:get("公会战对阵名单已经出炉，本公会的对手是~ts、~ts公会，请所有成员准时参加公会战，一同守"
                         "卫我们的荣誉{face_1, 7}"),
            FmtContent =
                lang:get("本公会将于今日~ts对阵~ts、~ts公会。请所有成员准时参加，团结一致，共克强敌！"),
            Msg1 = notice:format(FmtMsg,
                                 [{string_2, 2, Name2}, {string_2, 2, Name3}]),
            Content1 = notice:format(FmtContent,
                                     [{string_2, 5, lang:get("19:40")},
                                      {string_2, 2, Name2},
                                      {string_2, 2, Name3}]),
            guild_common:send_mail(Id1, "", Content1),
            guild:notice(Id1, Msg1),
            Msg2 =
                notice:format(lang:get("公会战对阵名单已经出炉，本公会将联合~ts公会共同对阵~ts公会，请所有成员准时参加公会战"
                                       "，一同守卫我们的荣誉{face_1, 7}"),
                              [{string_2, 2, Name3}, {string_2, 2, Name1}]),
            Msg3 =
                notice:format(lang:get("公会战对阵名单已经出炉，本公会将联合~ts公会共同对阵~ts公会，请所有成员准时参加公会战"
                                       "，一同守卫我们的荣誉{face_1, 7}"),
                              [{string_2, 2, Name2}, {string_2, 2, Name1}]),
            Content2 =
                notice:format(lang:get("本公会将于今日~ts联合~ts公会共同对阵~ts公会。请所有成员准时参加，团结一致，共克强敌！"),
                              [{string_2, 5, lang:get("19:40")},
                               {string_2, 2, Name3},
                               {string_2, 2, Name1}]),
            Content3 =
                notice:format(lang:get("本公会将于今日~ts联合~ts公会共同对阵~ts公会。请所有成员准时参加，团结一致，共克强敌！"),
                              [{string_2, 5, lang:get("19:40")},
                               {string_2, 2, Name2},
                               {string_2, 2, Name1}]),
            guild_common:send_mail(Id2, "", Content2),
            guild_common:send_mail(Id3, "", Content3),
            guild:notice(Id2, Msg2),
            guild:notice(Id3, Msg3);
        {[#guild_war_alliance{gids = [Id1], names = [Name1]}],
         [#guild_war_alliance{gids = [Id2], names = [Name2]}]} ->
            Msg1 =
                notice:format(lang:get("公会战对阵名单已经出炉，本公会的对手是~ts公会，请所有成员准时参加公会战，一同守卫我们的"
                                       "荣誉{face_1, 7}"),
                              [{string_2, 2, Name2}]),
            Content1 =
                notice:format(lang:get("本公会将于今日~ts对阵~ts公会。请所有成员准时参加，团结一致，共克强敌！"),
                              [{string_2, 5, lang:get("19:40")},
                               {string_2, 2, Name2}]),
            guild_common:send_mail(Id1, "", Content1),
            guild:notice(Id1, Msg1),
            Msg2 =
                notice:format(lang:get("公会战对阵名单已经出炉，本公会的对手是~ts公会，请所有成员准时参加公会战，一同守卫我们的"
                                       "荣誉{face_1, 7}"),
                              [{string_2, 2, Name1}]),
            Content2 =
                notice:format(lang:get("本公会将于今日~ts对阵~ts公会。请所有成员准时参加，团结一致，共克强敌！"),
                              [{string_2, 5, lang:get("19:40")},
                               {string_2, 2, Name1}]),
            guild_common:send_mail(Id2, "", Content2),
            guild:notice(Id2, Msg2);
        _ -> ok
    end,
    do_notice_match_guild(T).

encounter_notice([], _) -> [];
encounter_notice([{leader, #role{id = Id, pid = Pid}, _}
                  | T],
                 Msg) ->
    notice:send({pid, Pid}, 3, Msg),
    [Id | encounter_notice(T, Msg)];
encounter_notice([{leader,
                   #fighter_wrap{fighter =
                                     #fighter{origin_id = Id, pid = Pid}},
                   _}
                  | T],
                 Msg) ->
    notice:send({pid, Pid}, 3, Msg),
    [Id | encounter_notice(T, Msg)];
encounter_notice([#team_mate{id = Id, pid = Pid} | T],
                 Msg) ->
    notice:send({pid, Pid}, 3, Msg),
    [Id | encounter_notice(T, Msg)];
encounter_notice([#fighter{origin_id = Id, pid = Pid,
                           type = 1}
                  | T],
                 Msg) ->
    notice:send({pid, Pid}, 3, Msg),
    [Id | encounter_notice(T, Msg)];
encounter_notice([Id = {_, _, _} | T], Msg) ->
    notice:send(Id, 3, Msg),
    [Id | encounter_notice(T, Msg)];
encounter_notice([_ | T], Msg) ->
    encounter_notice(T, Msg).

atk_movability_lost([], _, _) -> ok;
atk_movability_lost(L = [Id | T], Args, OpenMode) ->
    case ets:lookup(guild_war_role, Id) of
        [#guild_war_role{match_id = MatchId, side = Side,
                         gid = Gid}] ->
            case ets:lookup(guild_war_alliance, {MatchId, Side}) of
                [A = #guild_war_alliance{}] ->
                    atk_movability_lost(L, Args, A, OpenMode);
                _ ->
                    logger:error("没找到联盟 ~w, ~w",
                                 [Gid, {MatchId, Side}],
                                 guild_war,
                                 2800),
                    atk_movability_lost(T, Args, OpenMode)
            end;
        _ ->
            logger:error("没找到参战者 ~w", [Id], guild_war, 2804),
            atk_movability_lost(T, Args, OpenMode)
    end.

atk_movability_lost([], _Args,
                    A = #guild_war_alliance{match_id = MatchId},
                    OpenMode) ->
    map_async({match, MatchId},
              {guild_war, role_callback, [{push, 15501}]}),
    insert_guild_alliance(A, OpenMode),
    ok;
atk_movability_lost([Id | T],
                    Args = #{team_len := TeamLen, team_len2 := TeamLen2},
                    A = #guild_war_alliance{movability = Gm}, OpenMode) ->
    case ets:lookup(guild_war_role, Id) of
        [R = #guild_war_role{movability = Rm}] ->
            DelGM = util:floor(min(14 + 70 / (TeamLen / TeamLen2),
                                   70)),
            Msg3 = notice:format(lang:get("消耗行动力~ts"),
                                 [{string_2, 1, DelGM}]),
            encounter_notice([Id], Msg3),
            NewRm = max(1, Rm - DelGM),
            insert_role(R#guild_war_role{movability = NewRm},
                        OpenMode),
            NewA = A#guild_war_alliance{movability =
                                            max(NewRm,
                                                Gm - max(0, Rm - NewRm))},
            atk_movability_lost(T, Args, NewA, OpenMode);
        _ ->
            logger:error("找不到参战者 ~w", [Id], guild_war, 2822),
            atk_movability_lost(T, Args, A, OpenMode)
    end.

async_leave(Role, Msg) -> async_leave(Role, Msg, true).

async_leave(Role = #role{name = Name,
                         cross_type = CrossType},
            Msg, NeedAway) ->
    PreRole1 = looks:del([64], Role),
    PreRole = looks:add({64, 0, 0, ""}, PreRole1, replace),
    Role1 = looks:calc(PreRole#role{s_event = 0}),
    Role2 = case NeedAway of
                true -> team_leave_away(Role1);
                _ -> Role1
            end,
    ToPos = util:rand_list([{10001, 306, 3507},
                            {10001, 2583, 3848},
                            {10001, 4957, 3680},
                            {10001, 445, 2565},
                            {10001, 4646, 704},
                            {10001, 841, 1033},
                            {10001, 2098, 1834},
                            {10001, 3617, 1816}]),
    case map:role_enter(ToPos,
                        self,
                        Role2#role{cross_type = 0})
        of
        {error, Reason} ->
            logger:error("[~ts]退出公会战场失败:~w",
                         [Name, Reason],
                         guild_war,
                         2841),
            {ok, Role2};
        {ok, NewRole} ->
            role_misc:push_cross(NewRole),
            case Msg of
                "" -> ok;
                _ -> notice:send(Role, 3, Msg)
            end,
            case CrossType of
                0 -> skip;
                _ ->
                    cross:cast(role_group,
                               leave,
                               [center_world, NewRole#role.pid])
            end,
            {ok, NewRole}
    end.

do_judge(OpenMode) ->
    L = ets:tab2list(guild_war_match),
    do_judge(OpenMode, L).

do_judge(_, []) -> [];
do_judge(OpenMode,
         [H = #guild_war_match{win_side = 0, id = MatchId}
          | T]) ->
    case {ets:lookup(guild_war_alliance, {MatchId, 1}),
          ets:lookup(guild_war_alliance, {MatchId, 2})}
        of
        {[A1 = #guild_war_alliance{remain_num = M}],
         [A2 = #guild_war_alliance{remain_num = M2}]}
            when M2 < 1 andalso M > 0 ->
            save_result(OpenMode, 1, H, A1, A2),
            do_judge(OpenMode, T);
        {[A1 = #guild_war_alliance{remain_num = M1}],
         [A2 = #guild_war_alliance{remain_num = M}]}
            when M1 < 1 andalso M > 0 ->
            save_result(OpenMode, 2, H, A2, A1),
            do_judge(OpenMode, T);
        {[A1 = #guild_war_alliance{remain_num = 0}],
         [A2 = #guild_war_alliance{remain_num = 0}]} ->
            save_result(OpenMode, 3, H, A1, A2),
            do_judge(OpenMode, T);
        {[A1 = #guild_war_alliance{remain_num = M1,
                                   movability = M1}],
         [A2 = #guild_war_alliance{remain_num = M2,
                                   movability = M2}]}
            when M1 > M2 ->
            save_result(OpenMode, 1, H, A1, A2),
            do_judge(OpenMode, T);
        {[A1 = #guild_war_alliance{remain_num = M1,
                                   movability = M1}],
         [A2 = #guild_war_alliance{remain_num = M2,
                                   movability = M2}]}
            when M2 > M1 ->
            save_result(OpenMode, 2, H, A2, A1),
            do_judge(OpenMode, T);
        {[A1 = #guild_war_alliance{remain_num = M,
                                   movability = M}],
         [A2 = #guild_war_alliance{remain_num = M,
                                   movability = M}]} ->
            save_result(OpenMode, 3, H, A1, A2),
            do_judge(OpenMode, T);
        _Else -> do_judge(OpenMode, T)
    end;
do_judge(OpenMode, [_ | T]) -> do_judge(OpenMode, T).

leave_judge(OpenMode, true,
            A1 = #guild_war_alliance{remain_num = M0,
                                     match_id = MatchId, side = Side})
    when M0 < 1 ->
    case ets:lookup(guild_war_match, MatchId) of
        [H = #guild_war_match{win_side = 0}] ->
            case ets:lookup(guild_war_alliance,
                            {MatchId, get_opposite_side(Side)})
                of
                [A2 = #guild_war_alliance{remain_num = M}] when M > 0 ->
                    save_result(OpenMode,
                                get_opposite_side(Side),
                                H,
                                A2,
                                A1);
                [A2 = #guild_war_alliance{remain_num = 0}] ->
                    save_result(OpenMode, 3, H, A1, A2);
                _ ->
                    logger:error("找不到联盟 ~w",
                                 [{MatchId, get_opposite_side(Side)}],
                                 guild_war,
                                 2899),
                    ok
            end;
        [#guild_war_match{}] ->
            logger:debug("已经出战场结果了", [], guild_war, 2903),
            ok;
        _ ->
            logger:error("找不到战场 ~w", [MatchId], guild_war, 2906),
            ok
    end;
leave_judge(OpenMode, true,
            A1 = #guild_war_alliance{remain_num = M1,
                                     movability = M1, match_id = MatchId,
                                     side = Side}) ->
    case ets:lookup(guild_war_match, MatchId) of
        [H = #guild_war_match{win_side = 0}] ->
            case ets:lookup(guild_war_alliance,
                            {MatchId, get_opposite_side(Side)})
                of
                [A2 = #guild_war_alliance{remain_num = M2,
                                          movability = M2}]
                    when M2 > M1 ->
                    save_result(OpenMode,
                                get_opposite_side(Side),
                                H,
                                A2,
                                A1);
                [A2 = #guild_war_alliance{remain_num = M2,
                                          movability = M2}]
                    when M2 < M1 ->
                    save_result(OpenMode, Side, H, A1, A2);
                [A2 = #guild_war_alliance{remain_num = M1,
                                          movability = M1}] ->
                    save_result(OpenMode, 3, H, A1, A2);
                _ ->
                    logger:error("找不到联盟 ~w",
                                 [{MatchId, get_opposite_side(Side)}],
                                 guild_war,
                                 2921),
                    ok
            end;
        [#guild_war_match{}] ->
            logger:debug("已经出战场结果了", [], guild_war, 2925),
            ok;
        _ ->
            logger:error("找不到战场 ~w", [MatchId], guild_war, 2928),
            ok
    end;
leave_judge(OpenMode, _, A) ->
    insert_guild_alliance(A, OpenMode).

save_result(OpenMode, 3, H,
            A1 = #guild_war_alliance{names = Names1,
                                     members = Mems1, gids = Gid1},
            A2 = #guild_war_alliance{names = Names2,
                                     members = Mems2, gids = Gid2}) ->
    Name1 = get_alliance_name(Names1),
    Name2 = get_alliance_name(Names2),
    NewH = H#guild_war_match{win_side = 3},
    insert_match(NewH, OpenMode),
    AL = [A1#guild_war_alliance{is_win = 3, score = 60},
          A2#guild_war_alliance{is_win = 3, score = 60}],
    insert_guild_alliance(AL, OpenMode),
    do_save_result(OpenMode, Gid1, 3, 60),
    do_save_result(OpenMode, Gid2, 3, 60),
    exhaust_notice(H, A1, A2),
    do_reward_guild(Gid1,
                    {[{23014, 3}], 500000},
                    draw,
                    Name2),
    do_reward_guild(Gid2,
                    {[{23014, 3}], 500000},
                    draw,
                    Name1),
    result_reward(Mems1, lost),
    result_reward(Mems2, lost),
    Msg =
        notice:format(lang:get("~ts公会与~ts公会势均力敌，在公会战中打成平局！{face_1, 19}"),
                      [{string_2, 2, Name2}, {string_2, 2, Name1}]),
    case OpenMode of
        2 ->
            sync_data(group_by_platform(Gid1 ++ Gid2, []),
                      notice,
                      cast,
                      [all, 5, Msg]);
        _ -> notice:cast(all, 5, Msg)
    end;
save_result(OpenMode, WinSide,
            H = #guild_war_match{map_id = MapId},
            A1 = #guild_war_alliance{names = Names1, gids = WinId,
                                     remain_num = Remain, members = Mems1},
            A2 = #guild_war_alliance{names = Names2,
                                     members = Mems2, gids = LostId}) ->
    Name1 = get_alliance_name(Names1),
    Name2 = get_alliance_name(Names2),
    NewH = H#guild_war_match{win_side = WinSide},
    insert_match(NewH, OpenMode),
    AL = [A1#guild_war_alliance{is_win = 1, score = 200},
          A2#guild_war_alliance{is_win = 2, score = 20}],
    exhaust_notice(H, A1, A2),
    do_reward_guild(WinId,
                    {[{23014, 5}], 2000000},
                    win,
                    Name2),
    do_reward_guild(LostId,
                    {[{23014, 3}], 500000},
                    lost,
                    Name1),
    insert_guild_alliance(AL, OpenMode),
    do_save_result(OpenMode, WinId, 1, 200),
    do_save_result(OpenMode, LostId, 2, 20),
    result_reward(Mems1, win),
    result_reward(Mems2, lost),
    Msg =
        notice:format(lang:get("~ts公会成员众志成城，力克强敌~ts公会取得公会战胜利！{face_1, "
                               "18}"),
                      [{string_2, 2, Name1}, {string_2, 2, Name2}]),
    case OpenMode of
        2 ->
            sync_data(group_by_platform(WinId ++ LostId, []),
                      notice,
                      cast,
                      [all, 5, Msg]);
        _ -> notice:cast(all, 5, Msg)
    end,
    logger:debug("================:~w",
                 [LostId],
                 guild_war,
                 2977),
    case lost_box(LostId, []) of
        [] -> ignore;
        LostId2 ->
            logger:debug("================:~w",
                         [LostId2],
                         guild_war,
                         2982),
            erlang:send_after(60000,
                              self(),
                              {create_fail_box, LostId2})
    end,
    erlang:send_after(60000,
                      self(),
                      {create_box, MapId, Remain + 2, WinId}),
    ok.

lost_box([], List) -> List;
lost_box(I = {_, _, _}, List) ->
    GuildMemeberList = case get(guild_memeber_num) of
                           L when is_list(L) -> L;
                           _ -> []
                       end,
    logger:debug("================:~w",
                 [GuildMemeberList],
                 guild_war,
                 2994),
    MemNum = case lists:keyfind(I, 1, GuildMemeberList) of
                 {_, TMemNum} -> TMemNum;
                 _ -> 0
             end,
    logger:debug("================:~w",
                 [MemNum],
                 guild_war,
                 2999),
    case MemNum >= 10 of
        true -> [I | List];
        _ -> List
    end;
lost_box([I | T], List) ->
    NewList = lost_box(I, List),
    lost_box(T, NewList).

do_save_result(_OpenMode, [], _, _) -> ok;
do_save_result(OpenMode, [Gid | T], Result, Score) ->
    case ets:lookup(guild_war_guild, Gid) of
        [G = #guild_war_guild{}] ->
            NewG = G#guild_war_guild{is_win = Result,
                                     score = Score},
            insert_guild(NewG, OpenMode),
            insert_guild_log(NewG, OpenMode);
        _ -> ok
    end,
    do_save_result(OpenMode, T, Result, Score).

create_units(_Where, []) -> ok;
create_units(Where = {GuildMatchId, MapId},
             [{BaseId, X, Y} | T]) ->
    unit_mgr:create(GuildMatchId, BaseId, {MapId, X, Y}),
    create_units(Where, T).

create_box(_, Num) when Num < 1 -> ok;
create_box(Where = {GuildMatchId, MapId}, Num) ->
    {X, Y} = map:rand_pos(30008),
    unit_mgr:create(GuildMatchId, 79720, {MapId, X, Y}),
    create_box(Where, Num - 1).

acc_score(OpenMode) ->
    L = ets:tab2list(guild_war_guild),
    acc_score(OpenMode, L).

acc_score(_OpenMode, []) -> ok;
acc_score(OpenMode,
          [G = #guild_war_guild{id = Id, score = AddScore,
                                win = AddWin, member_num = GMnum}
           | T]) ->
    case ets:lookup(guild_war_rank, Id) of
        [#guild_war_guild{score = Score, win = Win}] ->
            NewG = G#guild_war_guild{score = AddScore + Score,
                                     win = AddWin + Win, member_num = GMnum},
            insert_guild_rank(NewG, OpenMode);
        _ -> insert_guild_rank(G, OpenMode)
    end,
    acc_score(OpenMode, T).

rank_reward(2, 2) ->
    L1 = ets:tab2list(guild_war_rank),
    L2 = util:keys_sort([#guild_war_guild.win,
                         #guild_war_guild.score],
                        L1),
    do_rank_reward(L2, 1);
rank_reward(_, _) -> ok.

update_rank() ->
    Now = date:unixtime(),
    L1 = ets:tab2list(guild_war_rank),
    L2 = util:keys_sort([#guild_war_guild.win,
                         #guild_war_guild.score],
                        L1),
    L3 = lists:sublist(L2, 100),
    L4 = to_rank_list(L3, 1, Now),
    rank_zone:cast(40, {replace, 40, L4, #{reward => 1}}).

to_rank_list([], _, _) -> [];
to_rank_list([#guild_war_guild{id =
                                   {GId, GPlatform, GZoneId},
                               name = GuildName, leader_name = RoleName,
                               leader_id = {Rid, RPlatform, RZoneId},
                               score = Score, win = Win}
              | T],
             Num, Now) ->
    RankRc = #rank_rc{id = {GId, GPlatform, GZoneId},
                      role_id = Rid, platform = RPlatform, zone_id = RZoneId,
                      name = RoleName, desc = GuildName, val1 = Score,
                      val2 = Win},
    [RankRc | to_rank_list(T, Num + 1, Now)].

do_reward_role(Role, Result) ->
    case var:get_var(Role, day, 45, 0) of
        0 ->
            do_reward_role(var:set_var(Role, day, 45, 1),
                           Result,
                           true);
        _ -> do_reward_role(Role, Result, false)
    end.

do_reward_role(Role, _Result, false) -> Role;
do_reward_role(Role = #role{lev = Lev, name = Name,
                            id = Id},
               Result, _) ->
    Gain1 = case levup_data:get_exp({3300, Lev}) of
                #{exp := Exp} ->
                    G1 = [{90010, round(Exp * 8)}],
                    case pet:get_war_pet(Role) of
                        {ok, #pet{lev = PetLev}} ->
                            case levup_data:get_exp({3300, PetLev}) of
                                #{pet_exp := PetExp} ->
                                    [{90005, round(PetExp * 5)} | G1];
                                _ -> G1
                            end;
                        _ -> G1
                    end;
                _R ->
                    logger:debug("找不到经验模型 ~w ~w",
                                 [Lev, _R],
                                 guild_war,
                                 3096),
                    []
            end,
    Gain2 = case guild_war_data:get_result_reward(Result) of
                Items0 = [_ | _] ->
                    Items = case env:get(guild_war_precious_pool) of
                                0 ->
                                    [Oi
                                     || Oi = #{item_id := OId} <- Items0,
                                        lists:member(OId, [29010, 29011]) =:=
                                            false];
                                _ ->
                                    case
                                        gen_fsm:sync_send_all_state_event(guild_war,
                                                                          {reward_precious,
                                                                           Result})
                                        of
                                        true ->
                                            [Oi
                                             || Oi = #{item_id := OId}
                                                    <- Items0,
                                                lists:member(OId,
                                                             [29010, 29011])];
                                        _ ->
                                            [Oi
                                             || Oi = #{item_id := OId}
                                                    <- Items0,
                                                lists:member(OId,
                                                             [29010, 29011])
                                                    =:= false]
                                    end
                            end,
                    case util:rand_list(Items, item_weight) of
                        #{item_id := ItemId, item_num := ItemNum,
                          announce := Announce} ->
                            ItemId0 = item_type:special_id(ItemId),
                            case Announce of
                                1 when Result =:= 1 ->
                                    AnStr =
                                        notice:format(lang:get("~ts大杀四方，帮助公会取得公会战胜利的同时，还从对手身上摸了一件~ts{face_1, "
                                                               "44}"),
                                                      [{role_2, Name},
                                                       {item_2,
                                                        ItemId0,
                                                        ItemNum}]),
                                    case lists:member(ItemId, [29010, 29011]) of
                                        true -> notice:cast(all, 10, AnStr);
                                        false -> notice:cast(all, 5, AnStr)
                                    end;
                                1 ->
                                    AnStr =
                                        notice:format(lang:get("~ts从战场败退，正垂头丧气，猛见脚下躺着一件~ts{face_1, 42}"),
                                                      [{role_2, Name},
                                                       {item_2,
                                                        ItemId0,
                                                        ItemNum}]),
                                    case lists:member(ItemId, [29010, 29011]) of
                                        true -> notice:cast(all, 10, AnStr);
                                        false -> notice:cast(all, 5, AnStr)
                                    end;
                                _ -> ok
                            end,
                            [{ItemId0, 0, ItemNum} | Gain1];
                        _Err ->
                            logger:error("找不到奖励 ~w", [_Err], guild_war, 3134),
                            Gain1
                    end;
                _Err1 ->
                    logger:error("找不到奖励 ~w", [_Err1], guild_war, 3138),
                    Gain1
            end,
    Content = case Result of
                  1 -> lang:get("恭喜您获得公会战的胜利，您出色的表现帮助公会赢得荣誉与利益，这是您的战利品！");
                  _ ->
                      lang:get("感谢您参与公会战，虽然不幸出局，但您的努力一定能帮助公会朝胜利迈进，这是您的荣誉奖励！")
              end,
    MailInfo = #{items => Gain2, title => lang:get("公会战奖励"),
                 content => Content},
    mail:send(Id, MailInfo),
    Role.

do_rank_reward([], _) -> ok;
do_rank_reward([#guild_war_guild{id = Id, name = Name}
                | T],
               Rank) ->
    case Rank of
        1 ->
            case env:get(guild_war_champion_buff) of
                {OldGid = {_, _P, _Z}, _} ->
                    guild_mgr:apply(async,
                                    OldGid,
                                    {guild_war, guild_callback, [del_buff]});
                _ -> ok
            end,
            env:save(guild_war_champion_buff,
                     {Id, date:unixtime()}),
            guild_mgr:apply(async,
                            Id,
                            {guild_war, guild_callback, [add_buff]}),
            honor_mgr:replace(guild_war_champion, [{Id, 30110}], 0),
            AnStr =
                notice:format(lang:get("本届公会战到此落幕，~ts公会众志成城，最终夺得~ts的称号并获得为期一周的公会任务加成效"
                                       "果！恭喜他们{face_1, 18}"),
                              [{string_2, 2, Name},
                               {string_2, 1, lang:get("天下第一会")}]),
            notice:cast(all, 5, AnStr);
        _ -> ok
    end,
    case guild_war_data:get_rank_reward(Rank) of
        #{items := Items} ->
            Msg = notice:format(lang:get("公会战排行榜勇夺第~ts，"),
                                [{string_2, 5, Rank}]),
            guild_loot:add(Id, Items, Msg),
            Notice = case Rank of
                         1 ->
                             notice:format(lang:get("雄起！公会成员万众一心，在本届公会战中力压群雄，公会战勇夺第一！所有成员获得了~ts的称号"
                                                    "并获得了为期一周的公会任务加成效果{face_1, 18}"),
                                           [{string_2, 1, lang:get("天下第一会")}]);
                         _ ->
                             notice:format(lang:get("公会成员万众一心，在本届公会战中夺得了第~ts名！获得了~ts的奖励，会长快快论功行赏吧{"
                                                    "face_1, 18}"),
                                           [{string_2, 1, Rank},
                                            {item_2, Items}])
                     end,
            Content = case Rank of
                          1 ->
                              notice:format(lang:get("雄起！公会成员万众一心，在本届公会战中力压群雄，公会战勇夺第一！所有成员获得了~ts的称号"
                                                     "并获得了为期一周的公会任务加成效果"),
                                            [{string_2, 1, lang:get("天下第一会")}]);
                          _ ->
                              notice:format(lang:get("公会成员万众一心，在本届公会战中夺得了第~ts名！获得了~ts的奖励，会长快快论功行赏吧"),
                                            [{string_2, 1, Rank},
                                             {item_2, Items}])
                      end,
            guild_common:send_mail(Id, "", Content),
            guild:notice(Id, Notice),
            do_rank_reward(T, Rank + 1);
        _ -> do_rank_reward(T, Rank + 1)
    end.

combat_cast(Winner, Loser) ->
    do_combat_cast(win, Winner, Loser),
    do_combat_cast(lost, Loser, Winner).

do_combat_cast(_Type, _Ours, []) -> ok;
do_combat_cast(Type,
               Ours = [#fighter{origin_id = Oid = {_, P, Z}} | _],
               Theirs) ->
    #fighter{name = LeadName} = lists:keyfind(1,
                                              #fighter.is_leader,
                                              Theirs),
    Roles = [{Id, Name}
             || #fighter{origin_id = Id, name = Name} <- Ours],
    Msg = case Type of
              win ->
                  notice:format(lang:get("~ts战胜了~ts带领的~ts人队伍，我方气势大涨{face_1,18}"),
                                [{role_1, Roles},
                                 {role_2, LeadName},
                                 {string_2, 5, length(Theirs)}]);
              _ ->
                  notice:format(lang:get("~ts惜败于~ts带领的~ts人队伍，再继续努力{face_1,21}"),
                                [{role_1, Roles},
                                 {role_2, LeadName},
                                 {string_2, 5, length(Theirs)}])
          end,
    case cross:call(P,
                    Z,
                    ets,
                    lookup,
                    [guild_war_role, Oid])
        of
        [#guild_war_role{gid = Gid}] ->
            cross:cast(P, Z, guild, notice, [Gid, Msg]);
        _ -> logger:error("~w找不到参赛公会", [Oid], guild_war, 3210)
    end;
do_combat_cast(_, _, _) -> ok.

set_delay_out(Role, Msg, reward_leave) ->
    Role2 = team_leave_away(Role),
    Timer = #timer{id = guild_war_reward_leave,
                   timeout = 5 * 1000, times = 1, m = guild_war,
                   f = role_callback, a = [reward_leave]},
    case Msg of
        "" -> ok;
        _ ->
            Msg2 = notice:format(lang:get("~ts, ~ts秒后将自动离开战场"),
                                 [{string_1, Msg}, {string_2, 1, 5}]),
            notice:send(Role, 3, Msg2)
    end,
    {ok, role_timer:set(Timer, Role2)};
set_delay_out(Role, Msg, Type) ->
    Role2 = team_leave_away(Role),
    Timer = #timer{id = guild_war_leave, timeout = 5 * 1000,
                   times = 1, m = guild_war, f = role_callback,
                   a = [Type]},
    case Msg of
        "" -> ok;
        _ ->
            Msg2 = notice:format(lang:get("~ts, ~ts秒后将自动离开战场"),
                                 [{string_1, Msg}, {string_2, 1, 5}]),
            notice:send(Role, 3, Msg2)
    end,
    {ok, role_timer:set(Timer, Role2)}.

check_cross(Role = #role{cross_type = 1},
            #{match_id := {2, _}}) ->
    team_recruit:cancel_reg(Role),
    {ok, Role};
check_cross(Role = #role{cross_type = 1}, _) ->
    team_recruit:cancel_reg(Role),
    cross:cast(role_group,
               leave,
               [center_world, Role#role.pid]),
    {ok, Role#role{cross_type = 0}};
check_cross(Role, _) -> {ok, Role}.

check_join([], _, Args) -> {ok, Args};
check_join([lev | _T], #role{lev = Lev}, _)
    when Lev < 30 ->
    {false,
     notice:format(lang:get("角色等级达到~ts才可以参与公会战"),
                   [{string_2, 5, 30}])};
check_join([lev | T], Role, Args) ->
    check_join(T, Role, Args);
check_join([world_lev | T], Role, Args) ->
    Lev = lev_break:lev(Role),
    {WorldLev, _} = world_lev:get_world_lev(Role),
    case abs(Lev - WorldLev) < 25 of
        true -> check_join(T, Role, Args);
        _ ->
            {false,
             notice:format(lang:get("角色等级低于世界等级~ts级，不能参加公会战"),
                           [{string_2, 5, 25}])}
    end;
check_join([guild | _T],
           #role{m_guild = #m_guild{enter_time = Entered}},
           #{time := Now})
    when Now - Entered < 3600 * 24 * 3 ->
    {false, lang:get("进入公会3天以上的成员才能参与公会战")};
check_join([guild | T],
           Role = #role{id = {_, P, Z},
                        m_guild = #m_guild{id = Gid}},
           Args) ->
    case cross:call(P,
                    Z,
                    ets,
                    lookup,
                    [guild_war_guild, Gid])
        of
        [#guild_war_guild{match_id = MatchId, side = Side,
                          name = GName}] ->
            case ets:lookup(guild_war_match, MatchId) of
                [#guild_war_match{win_side = 0, map_id = MapId,
                                  map_platform = MapPlatfrom,
                                  map_zone_id = MapZoneId}] ->
                    case ets:lookup(guild_war_alliance, {MatchId, Side}) of
                        [#guild_war_alliance{map_id = ReadyMapId,
                                             map_platform = ReadyMapPlatform,
                                             map_zone_id = ReadyMapZoneId}] ->
                            check_join(T,
                                       Role,
                                       Args#{side => Side, map_id => MapId,
                                             map_platform => MapPlatfrom,
                                             map_zone_id => MapZoneId,
                                             match_id => MatchId,
                                             ready_map_id => ReadyMapId,
                                             ready_map_platform =>
                                                 ReadyMapPlatform,
                                             ready_map_zone_id =>
                                                 ReadyMapZoneId,
                                             guild_name => GName});
                        _ -> {false, lang:get("准备区还没开放")}
                    end;
                _ -> {false, lang:get("胜负已分，无法进入战场")}
            end;
        _ -> {false, lang:get("你公会没有参与本次公会战")}
    end;
check_join([guild | _], _Role, _) ->
    {false, lang:get("不在公会中不能参与")};
check_join([event | T], Role, Args) ->
    case role_misc:check_event(Role, [0, 2, 18]) of
        true -> check_join(T, Role, Args);
        Else -> Else
    end;
check_join([team | T], Role = #role{s_event = Event},
           Args = #{match_id := {WarType, _}}) ->
    case WarType =:= 2 andalso
             (Event =:= 0 orelse Event =:= 2 orelse Event =:= 28)
        of
        true ->
            case team:get_status(Role) of
                false -> check_join(T, Role, Args);
                _ -> {false, lang:get("跨服公会战不允许组队进入，请进入准备区再组队")}
            end;
        _ -> check_join(T, Role, Args)
    end;
check_join([team | T], Role, Args) ->
    check_join(T, Role, Args);
check_join([to_war | T], Role, Args) ->
    case check_to_war(Role) of
        true -> check_join(T, Role, Args);
        _ -> {false, lang:get("你已从战场退出过，不能再进入")}
    end;
check_join([movability | T], Role, Args) ->
    case check_movability(Role) of
        true -> check_join(T, Role, Args);
        _ -> {false, lang:get("行动力不足，不能进入战场")}
    end.

do_reward_guild([], _, _Type, _Name) -> ok;
do_reward_guild([Gid = {_, P, Z} | T],
                Loot = {Items, Assets}, Type, Name) ->
    Pref = case Type of
               win -> lang:get("公会战胜利！");
               _ -> lang:get("公会战结束！")
           end,
    do_run_mfa({P, Z}, guild_loot, add, [Gid, Items, Pref]),
    do_run_mfa({P, Z},
               guild_common,
               add_assets,
               [Gid, {not_weekly, Assets}]),
    GuildMemeberList = case get(guild_memeber_num) of
                           L when is_list(L) -> L;
                           _ -> []
                       end,
    MemNum = case lists:keyfind(Gid, 1, GuildMemeberList) of
                 {_, TMemNum} -> TMemNum;
                 _ -> 0
             end,
    Fmt = case Type of
              win ->
                  lang:get("在大家的骁勇奋战之下，本会在公会战中战胜~ts，获得公会秘藏和~ts公会资金，真是大快人心"
                           "{face_1,18}");
              lost when MemNum >= 10 ->
                  lang:get("虽然大家努力奋战，但本会仍遗憾败于~ts，获得公会秘藏~ts公会资金，成员们纷纷表示要发愤"
                           "图强{face_1,1}");
              lost ->
                  lang:get("虽然大家努力奋战，但本会仍遗憾败于~ts，仅获得了~ts公会资金，成员们纷纷表示要发愤图强"
                           "{face_1,1}");
              _ ->
                  lang:get("虽然大家努力奋战，但本会仍遗憾战平~ts，仅获得了~ts公会资金，成员们纷纷表示要发愤图强"
                           "{face_1,1}")
          end,
    Msg = notice:format(Fmt,
                        [{string_2, 2, Name}, {string_2, 5, Assets}]),
    do_run_mfa({P, Z}, guild, notice, [Gid, Msg]),
    do_reward_guild(T, Loot, Type, Name).

check_team_mate([]) -> ok;
check_team_mate([#team_mate{id =
                                Id = {_, Platform, ZoneId},
                            name = Name}
                 | T]) ->
    case cross:call(Platform,
                    ZoneId,
                    ets,
                    lookup,
                    [guild_war_role, Id])
        of
        [#guild_war_role{movability = M}] when M =< 1 ->
            {false,
             notice:format(lang:get("你队伍中的~ts行动不足以发起挑战"),
                           [{role_2, Name}])};
        _ -> check_team_mate(T)
    end;
check_team_mate([_ | T]) -> check_team_mate(T).

exhaust_notice(#guild_war_match{map_id = MapId},
               #guild_war_alliance{movability = M1, remain_num = M1},
               #guild_war_alliance{movability = M2,
                                   remain_num = M2}) ->
    Msg = lang:get("双方筋疲力，尽无人能发起战斗，公会战结束"),
    notice:cast({map, MapId}, 3, Msg);
exhaust_notice(_, _, _) -> ok.

ready_to_war(State) ->
    L = ets:tab2list(guild_war_role),
    {Leaders, NoLeaders} = ready_to_war_sort(L,
                                             State,
                                             [],
                                             []),
    do_ready_to_war(Leaders ++ NoLeaders, 0).

do_ready_to_war([], _) -> ok;
do_ready_to_war([#guild_war_role{pid = Pid} | T], Num)
    when is_pid(Pid) ->
    role:apply(async,
               Pid,
               {guild_war, role_callback, [{ready, Num}]}),
    do_ready_to_war(T, Num + 1);
do_ready_to_war([_ | T], Num) ->
    do_ready_to_war(T, Num).

ready_to_war_sort([], _State, Leaders, NoLeaders) ->
    Leaders1 = util:keys_sort([#guild_war_role.team_fc,
                               #guild_war_role.team_len],
                              Leaders),
    NoLeaders1 = util:keys_sort([#guild_war_role.team_fc,
                                 #guild_war_role.team_len],
                                NoLeaders),
    {Leaders1, NoLeaders1};
ready_to_war_sort([I = #guild_war_role{gid = Gid,
                                       team_status = TeamStatus}
                   | T],
                  State, Leaders, NoLeaders) ->
    case get_mem_len(Gid, State) >= 100 of
        true -> ready_to_war_sort(T, State, Leaders, NoLeaders);
        _ when TeamStatus == 1 ->
            ready_to_war_sort(T, State, [I | Leaders], NoLeaders);
        _ ->
            ready_to_war_sort(T, State, Leaders, [I | NoLeaders])
    end.

team_leave_away(Role = #role{cross_type = CrossType}) ->
    case CrossType of
        1 ->
            case team:async_leave(Role) of
                {ok, ARole} -> ARole;
                _ -> Role
            end;
        _ ->
            case team:get_status(Role) of
                {true, 2} ->
                    case team:away(Role) of
                        {ok, ARole} -> ARole;
                        _ -> Role
                    end;
                {true, 1} ->
                    case team:async_leave(Role) of
                        {ok, ARole} -> ARole;
                        _ -> Role
                    end;
                _ -> Role
            end
    end.

load_data() ->
    F1 = fun (G1) ->
                 case ver(G1) of
                     {ok, NewG1} ->
                         ets:insert(guild_war_guild_log, NewG1),
                         continue;
                     _ -> continue
                 end
         end,
    F2 = fun (G2) ->
                 case ver(G2) of
                     {ok, NewG2} ->
                         ets:insert(guild_war_rank, NewG2),
                         continue;
                     _ -> continue
                 end
         end,
    case dets:first(guild_war_guild_log) of
        '$end_of_table' -> ok;
        _ -> dets:traverse(guild_war_guild_log, F1)
    end,
    case dets:first(guild_war_rank) of
        '$end_of_table' -> ok;
        _ -> dets:traverse(guild_war_rank, F2)
    end.

ver({guild_war_guild,
     GuildId,
     Key,
     Ver = 1,
     Name,
     Lev,
     LeaderName,
     LeaderId,
     MatchId,
     MemNum,
     Win,
     Side,
     Totem,
     Type,
     Time,
     IsWin,
     Score,
     WeekAssets}) ->
    NewVer = Ver + 1,
    NewMatchId = {1, MatchId},
    ver({guild_war_guild,
         GuildId,
         Key,
         NewVer,
         Name,
         Lev,
         LeaderName,
         LeaderId,
         NewMatchId,
         MemNum,
         Win,
         Side,
         Totem,
         Type,
         Time,
         IsWin,
         Score,
         WeekAssets});
ver(GuildWar = #guild_war_guild{}) -> {ok, GuildWar};
ver(_Err) ->
    logger:error("公会战数据版本转换失败:~w", [_Err], guild_war, 3453),
    false.

check_srv_open() ->
    case date:open_srv_day() of
        N when is_integer(N) -> N > 3;
        _ -> false
    end.

sort_guild([], _, _) -> [];
sort_guild(L, 1, 1) ->
    L2 = util:keys_sort([#guild_war_guild.week_assets], L),
    do_sort_rand(L2);
sort_guild(L, _, _) ->
    MaxAssets = max(1,
                    lists:max([A
                               || #guild_war_guild{week_assets = A} <- L])),
    MaxScore = max(1,
                   lists:max([S || #guild_war_guild{score = S} <- L])),
    Fun = fun (#guild_war_guild{week_assets = A1,
                                score = S1},
               #guild_war_guild{week_assets = A2, score = S2}) ->
                  Rate1 = max(150, round(600 * A1 / MaxAssets)) +
                              max(150, round(400 * S1 / MaxScore)),
                  Rate2 = max(150, round(600 * A2 / MaxAssets)) +
                              max(150, round(400 * S2 / MaxScore)),
                  Rate1 > Rate2
          end,
    L1 = lists:sort(Fun, L),
    FailId = env:get(guild_war_match_fail),
    case lists:reverse(L1) of
        [G = #guild_war_guild{id = FailId}, G2 | Rest] ->
            lists:reverse([G2, G | Rest]);
        _ -> L1
    end.

set_week_assets(L) ->
    RL = rank:list_show(31),
    set_week_assets(L, RL).

set_week_assets([], _) -> [];
set_week_assets([H = #guild_war_guild{id = Id} | T],
                RL) ->
    case lists:keyfind(Id, #rank_rc.id, RL) of
        #rank_rc{val2 = Val2} ->
            [H#guild_war_guild{week_assets = Val2}
             | set_week_assets(T, RL)];
        _ ->
            [H#guild_war_guild{week_assets = 0} | set_week_assets(T,
                                                                  RL)]
    end.

set_guild_score(G) ->
    Rank = ets:tab2list(guild_war_rank),
    set_guild_score(G, Rank, []).

set_guild_score([], _, G) -> lists:reverse(G);
set_guild_score([G1 = #guild_war_guild{id = Id} | T],
                Rank, G) ->
    case lists:keyfind(Id, #guild_war_guild.id, Rank) of
        #guild_war_guild{score = Score} ->
            set_guild_score(T,
                            Rank,
                            [G1#guild_war_guild{score = Score} | G]);
        _ -> set_guild_score(T, Rank, [G1 | G])
    end.

do_sort_rand([]) -> [];
do_sort_rand(L) when length(L) =:= 5 ->
    case lists:keyfind(env:get(guild_war_match_fail),
                       #guild_war_guild.id,
                       L)
        of
        G1 = #guild_war_guild{id = Gid1} ->
            [G1 | lists:keydelete(Gid1, #guild_war_guild.id, L)];
        _ -> L
    end;
do_sort_rand([A1, A2, A3, A4 | T]) ->
    [B1, B2, B3, B4] = util:rand_list_n([A1, A2, A3, A4],
                                        4),
    [B1, B2, B3, B4 | do_sort_rand(T)];
do_sort_rand(L) ->
    case lists:keyfind(env:get(guild_war_match_fail),
                       #guild_war_guild.id,
                       L)
        of
        G1 = #guild_war_guild{id = Gid1} ->
            [G1 | lists:keydelete(Gid1, #guild_war_guild.id, L)];
        _ -> L
    end.

get_win_score(5) -> 100;
get_win_score(4) -> 72;
get_win_score(3) -> 45;
get_win_score(2) -> 24;
get_win_score(_) -> 10.

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

get_opposite_side(1) -> 2;
get_opposite_side(_) -> 1.

acc_win({win, _}, Gid, OpenMode) ->
    case ets:lookup(guild_war_guild, Gid) of
        [G = #guild_war_guild{win = Win}] ->
            insert_guild(G#guild_war_guild{win = Win + 1},
                         OpenMode);
        _ -> ok
    end;
acc_win(_, _, _) -> ok.

get_alliance_name(Names) -> string:join(Names, "、").

find_today_matched(Type, Mode) ->
    Now = date:unixtime(),
    case [G
          || G = #guild_war_guild{time = Time,
                                  key = {_, GType, GMode}, score = 0}
                 <- ets:tab2list(guild_war_guild_log),
             GType =:= Type andalso
                 GMode =:= Mode andalso date:is_same_day(Time, Now)]
        of
        [] -> false;
        L ->
            case do_find_today_matched(L, [], [], []) of
                {ok, Matches, Alliances, Guilds} ->
                    ets:insert(guild_war_match, Matches),
                    ets:insert(guild_war_guild, Guilds),
                    ets:insert(guild_war_alliance, Alliances),
                    ok;
                _ -> false
            end
    end.

do_find_today_matched([], Matches, Alliances, Guilds) ->
    {ok, Matches, Alliances, Guilds};
do_find_today_matched([G = #guild_war_guild{match_id =
                                                MatchId,
                                            type = Type, time = Now}
                       | T],
                      Matches, Alliances, Guilds) ->
    Fun = fun (#guild_war_guild{match_id = Mid}) ->
                  Mid =:= MatchId
          end,
    Fun2 = fun (#guild_war_guild{side = Side}) -> Side =:= 1
           end,
    case lists:partition(Fun, T) of
        {Sat = [_ | _], UnSat} ->
            case lists:partition(Fun2, [G | Sat]) of
                {Red, Black} ->
                    Ids1 = [Id1 || #guild_war_guild{id = Id1} <- Red],
                    Names1 = [Name1
                              || #guild_war_guild{name = Name1} <- Red],
                    Totems1 = [Totem1
                               || #guild_war_guild{totem = Totem1} <- Red],
                    WA1 = #guild_war_alliance{id = {MatchId, 1},
                                              gids = Ids1, names = Names1,
                                              totems = Totems1, side = 1,
                                              type = Type, time = Now,
                                              match_id = MatchId},
                    Ids2 = [Id2 || #guild_war_guild{id = Id2} <- Black],
                    Names2 = [Name2
                              || #guild_war_guild{name = Name2} <- Black],
                    Totems2 = [Totem2
                               || #guild_war_guild{totem = Totem2} <- Black],
                    WA2 = #guild_war_alliance{id = {MatchId, 2},
                                              gids = Ids2, names = Names2,
                                              totems = Totems2, side = 2,
                                              type = Type, time = Now,
                                              match_id = MatchId},
                    B = #guild_war_match{id = MatchId, time = Now,
                                         type = Type},
                    do_find_today_matched(UnSat,
                                          [B | Matches],
                                          [WA1, WA2 | Alliances],
                                          [G | Sat ++ Guilds]);
                _ -> false
            end;
        _ -> false
    end.

calc_remain([], Movability, Remain) ->
    {Movability, Remain};
calc_remain([Id | T], Movability, Remain) ->
    case ets:lookup(guild_war_role, Id) of
        [#guild_war_role{movability = M, pid = Pid}]
            when M > 0 andalso is_pid(Pid) ->
            calc_remain(T, Movability + M, Remain + 1);
        _ -> calc_remain(T, Movability, Remain)
    end.

do_get_opposite_member([]) -> [];
do_get_opposite_member([Id = {_, P, Z} | T]) ->
    case cross:call(P, Z, ets, lookup, [guild_war_role, Id])
        of
        [R = #guild_war_role{movability = M, pid = Pid}]
            when M > 0 andalso is_pid(Pid) ->
            [R | do_get_opposite_member(T)];
        _ -> do_get_opposite_member(T)
    end.

get_movability(Role = #role{m_guild =
                                #m_guild{post = Post}}) ->
    Lev = lev_break:lev(Role),
    {WorldLev, _} = world_lev:get_world_lev(Role),
    WLevRate = case WorldLev - Lev of
                   Val when Val >= 20 -> 100;
                   Val when Val >= 15 -> 300;
                   Val when Val >= 10 -> 400;
                   Val when Val >= 5 -> 600;
                   _ -> 1000
               end,
    PostRate = case Post of
                   10 -> 700;
                   0 -> 500;
                   _ -> 1000
               end,
    util:floor(1000 * (WLevRate / 1000) *
                   (PostRate / 1000)).

get_mem_len(Gid, #state{guild_list = GuildList}) ->
    case lists:keyfind(Gid, 1, GuildList) of
        {_, Num} -> Num;
        _ -> 0
    end.

