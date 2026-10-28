-file("src/mod/constellation/constellation.erl", 1).

-module(constellation).

-behaviour(gen_fsm).

-export([start_link/0,
         init/0,
         login/1,
         combat_check/2,
         summon/1,
         summoned_expire/1,
         fight_summon/1,
         treat_slave_attr/2,
         treat_unit_attr/2,
         combat_over/1,
         check_gain/4,
         info/1,
         push/2,
         get_tar_role/1,
         update_tar_role/1,
         login_send_mail/1,
         get_first/1,
         rpc_get_guard/2,
         clean_units/0,
         clean_units/1]).

-export([idle/2, notice/2, active/2]).

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

-file("src/mod/constellation/constellation.erl", 37).

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

-file("src/mod/constellation/constellation.erl", 38).

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

-file("src/mod/constellation/constellation.erl", 39).

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

-file("src/mod/constellation/constellation.erl", 40).

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

-file("src/mod/constellation/constellation.erl", 41).

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

-file("src/mod/constellation/constellation.erl", 42).

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

-file("src/mod/constellation/constellation.erl", 43).

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

-file("src/mod/constellation/constellation.erl", 44).

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

-file("src/mod/constellation/constellation.erl", 45).

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

-file("src/mod/constellation/constellation.erl", 46).

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

-file("src/mod/constellation/constellation.erl", 47).

-file("inc/link.hrl", 1).

-record(link,
        {socket :: undefined | port(),
         conn_pid :: undefined | pid(),
         ip = {0, 0, 0, 0} :: {0..255, 0..255, 0..255, 0..255},
         port = 0 :: non_neg_integer(),
         lag = 0 :: non_neg_integer()}).

-file("src/mod/constellation/constellation.erl", 48).

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

-file("src/mod/constellation/constellation.erl", 49).

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

-file("src/mod/constellation/constellation.erl", 50).

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

-file("src/mod/constellation/constellation.erl", 51).

-file("inc/lev_break.hrl", 1).

-record(m_lev_break,
        {ver = 0,
         trial = 0 :: non_neg_integer(),
         done = 0 :: non_neg_integer(),
         times = 0 :: non_neg_integer(),
         attr_point = 0 :: non_neg_integer()}).

-file("src/mod/constellation/constellation.erl", 52).

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

-file("src/mod/constellation/constellation.erl", 53).

-file("inc/constellation.hrl", 1).

-record(m_constellation,
        {ver = 2,
         lev = 0 :: non_neg_integer(),
         finished = [],
         summoned = []}).

-record(constellation_first,
        {key = {0, 0},
         ver = 0,
         lev = 0 :: non_neg_integer(),
         winner = [],
         mtime = 0,
         base_id = 0}).

-record(constellation_unit,
        {id = {0, 0},
         lev = 0,
         base_id = 0,
         map_id = 0,
         x = 0,
         y = 0,
         fail = 0,
         guards = []}).

-record(constellation_winner,
        {ver = 0,
         id = {0, "", 0},
         name = "" :: string(),
         classes = 0 :: non_neg_integer(),
         sex = 0 :: non_neg_integer(),
         looks = [],
         finished = 0 :: non_neg_integer(),
         round = 0 :: non_neg_integer(),
         is_leader = 0 :: non_neg_integer()}).

-record(constellation_summoned,
        {ver = 2,
         lev = 0 :: non_neg_integer(),
         base_id = 0 :: non_neg_integer(),
         map = 0 :: non_neg_integer(),
         x = 0 :: non_neg_integer(),
         y = 0 :: non_neg_integer(),
         time = 0 :: non_neg_integer()}).

-record(constellation_role,
        {id = {0, "", 0},
         name = "" :: string(),
         classes = 0 :: non_neg_integer(),
         sex = 0 :: non_neg_integer(),
         id_now = 0 :: non_neg_integer(),
         title_lev = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         max_kill = 0 :: non_neg_integer()}).

-record(constellation_first_data,
        {min = 0, max = 0, rate = 0, attr = []}).

-record(constellation_guard,
        {id = {0, "", 0},
         name = "",
         lev = 0,
         sex = 0,
         classes = 0,
         looks = [],
         base_id = 0}).

-file("src/mod/constellation/constellation.erl", 54).

-file("inc/head.hrl", 1).

-record(m_head,
        {ver = 2 :: pos_integer(),
         id_now = 0 :: non_neg_integer(),
         time_buy = 0 :: non_neg_integer(),
         day = 0 :: non_neg_integer(),
         head = [] :: list(),
         frame_id_now = 0 :: non_neg_integer(),
         frame_time_buy = 0 :: non_neg_integer(),
         frame_day = 0 :: non_neg_integer(),
         head_frame = [] :: list()}).

-record(head,
        {id = 0 :: non_neg_integer(),
         time_buy = 0 :: non_neg_integer(),
         day = 0 :: non_neg_integer(),
         list = [] :: list()}).

-record(head_frame,
        {id = 0 :: non_neg_integer(),
         time_buy = 0 :: non_neg_integer(),
         day = 0 :: non_neg_integer(),
         list = [] :: list()}).

-file("src/mod/constellation/constellation.erl", 55).

-file("inc/package.hrl", 1).

-record(package,
        {type = 1 :: integer(),
         next_id = 1 :: pos_integer(),
         volume = 0 :: non_neg_integer(),
         free_cell = [] :: list(),
         items = [] :: [tuple()]}).

-file("src/mod/constellation/constellation.erl", 56).

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

-file("src/mod/constellation/constellation.erl", 57).

-file("inc/robot.hrl", 1).

-record(robot_role,
        {ver = 4,
         id = {0, "", 0} :: tuple(),
         name = "" :: list(),
         sex = 0 :: 0..1,
         classes = 0 :: 0..4,
         lev = 0 :: non_neg_integer(),
         fc = 0,
         face = 0,
         ai_id = 0,
         skills = [],
         talents = [],
         pet,
         backup_pets = [],
         guard,
         slave = [],
         attr :: undefined | tuple(),
         looks = [],
         time = 0,
         m_formation,
         pet_fc = 0,
         all_fc = 0,
         cup = 1000,
         m_lev_break}).

-record(robot_role_index,
        {id = {0, "", 0} :: tuple(),
         sex = 0 :: 0..1,
         classes = 0 :: 0..4,
         lev = 0 :: non_neg_integer(),
         fc = 0,
         pet_fc = 0,
         cup = 1000,
         all_fc = 0,
         time = 0}).

-file("src/mod/constellation/constellation.erl", 58).

-record(state,
        {ts = 0 :: tuple(),
         timeout = 0 :: non_neg_integer(),
         gen_ref :: undefined | reference()}).

init() -> #m_constellation{}.

login(TRole = #role{m_constellation =
                        MConstell = #m_constellation{summoned =
                                                         [#constellation_summoned{time
                                                                                      =
                                                                                      Last}]}}) ->
    Role = del_item(TRole),
    Now = date:unixtime(),
    case 3600 - (Now - Last) of
        Timeout when Timeout > 0 ->
            Timer = #timer{id = constellation_summon_expire,
                           timeout = Timeout * 1000, times = 1,
                           m = constellation, f = summoned_expire, a = []},
            {ok, role_timer:set(Timer, Role)};
        _ ->
            {ok,
             Role#role{m_constellation =
                           MConstell#m_constellation{summoned = []}}}
    end;
login(TRole = #role{m_constellation =
                        #m_constellation{lev = Lev}})
    when Lev > 0 ->
    Role = del_item(TRole),
    case var:get_var(Role, other, 2096, 0) of
        0 ->
            role:apply(async,
                       self(),
                       {constellation, login_send_mail, []});
        _ -> ok
    end,
    {ok, Role};
login(TRole) ->
    Role = del_item(TRole),
    {ok, Role}.

login_send_mail(Role = #role{m_constellation =
                                 #m_constellation{lev = Lev}}) ->
    Role1 = var:set_var(Role, other, 2096, 1),
    update_tar_role(Role1),
    Title = lang:get("星座驾照认证"),
    Content =
        notice:format(lang:get("由于你之前在星座挑战中的英勇奋战，星辰学院特此颁发~ts星驾照，请查收。祝您在星座挑战中小"
                               "车越开越稳^-^"),
                      [{string_2, 1, Lev}]),
    Items = [{23800, 1}],
    mail:send(Role1, Title, Content, Items),
    {ok, Role1}.

del_item(Role = #role{p_bag = PBag = #package{}}) ->
    case package:count(by_base_id, 23800, PBag) of
        {_, Num} when Num > 1 ->
            Loss = format:val_to_loss([{23800, Num - 1}]),
            case role_gain:do(Loss, Role) of
                {ok, NRole} -> NRole;
                _ -> Role
            end;
        _ -> Role
    end.

get_first(UId = {_, _}) ->
    Result = case ets:lookup(constellation_unit, UId) of
                 [#constellation_unit{lev = Lev, base_id = BaseId,
                                      fail = Fail}] ->
                     case ets:lookup(constellation_first1, {Lev, BaseId}) of
                         [#constellation_first{mtime = Mtime,
                                               winner = Winner}] ->
                             {Lev, BaseId, 1, Mtime, 100, Winner};
                         _ ->
                             NewRate = case ets:lookup(constellation_first1,
                                                       {Lev, BaseId})
                                           of
                                           [] ->
                                               case
                                                   constellation_data:get_first(Fail)
                                                   of
                                                   #constellation_first_data{rate
                                                                                 =
                                                                                 Rate} ->
                                                       Rate;
                                                   _ -> 1000
                                               end;
                                           _ -> 1000
                                       end,
                             {Lev, BaseId, 0, 0, NewRate, []}
                     end;
                 _ -> {0, 0, 0, 0, 100, []}
             end,
    sys_conn:pack_send(15207, Result).

rpc_get_guard(Role, UnitId) ->
    Result = case ets:lookup(constellation_unit, UnitId) of
                 [#constellation_unit{lev = Lev, base_id = BaseId,
                                      guards = Guards}] ->
                     {Lev, BaseId, Guards};
                 _ -> {0, 0, []}
             end,
    logger:debug("========:~w",
                 [Result],
                 constellation,
                 180),
    role:pack_send(Role, 15208, Result).

combat_check(#role{cross_type = 1}, _) ->
    {false, lang:get("跨服状态无法挑战星座")};
combat_check(_Role = #role{pos =
                               #pos{map = MapId, x = X, y = Y}},
             _U = #unit{pos =
                            #pos{map = DestMapId, x = DestX, y = DestY}})
    when MapId =/= DestMapId orelse
             abs(X - DestX) >= 500 orelse Y - DestY >= 500 ->
    {false, lang:get("您距离该单位太远，无法操作{face_1,121}")};
combat_check(Role, U) ->
    Now = date:unixtime(),
    case erlang:get(constellation_combat_cd) of
        Ts when is_integer(Ts) andalso Now - Ts < 3 ->
            {false, lang:get("你操作太快了")};
        _ ->
            erlang:put(constellation_combat_cd, Now),
            do_combat_check(Role, U)
    end.

summon(#role{lev = Lev}) when Lev < 70 ->
    {false,
     notice:format(lang:get("召唤星座功能在~ts级后开放，加油升级吧{face_1,36}"),
                   [{string_2, 5, 70}])};
summon(#role{s_event = Event})
    when Event =:= 24 orelse Event =:= 25 ->
    {false, lang:get("武道会中不能挑战星座")};
summon(Role = #role{m_constellation =
                        #m_constellation{lev = OpenLev}}) ->
    TodayKilled = var:get_var(Role, day_five, 140, 0),
    case var:get_var(Role, day_five, 37, 0) >= 3 of
        true -> {false, lang:get("今日星座挑战次数已达上限哟{face_1, 22}")};
        _ when TodayKilled >= 2 ->
            {false,
             notice:format(lang:get("每天最多挑战~ts次召唤星座"),
                           [{string_2, 5, 2}])};
        _ ->
            {WorldLev, _} = world_lev:get_world_lev(),
            case constellation_data:get_refreshing(WorldLev) of
                #{unit := Units, lev := Levs} ->
                    FirstList = ets:tab2list(constellation_first1),
                    BaseLev0 = case [FLev
                                     || #constellation_first{lev = FLev}
                                            <- FirstList]
                                   of
                                   [] -> 0;
                                   FList -> lists:max(FList)
                               end,
                    BaseLev1 = max(1, min(OpenLev + 1, BaseLev0)),
                    BaseLev = min(8, BaseLev1),
                    case [O || O = {Lv, _} <- Levs, Lv =< BaseLev] of
                        [] -> {false, lang:get("没有可挑战的的星座哦")};
                        Levs1 ->
                            {SummonLev, _} = util:rand_list(Levs1, 1),
                            {BaseId, _} = util:rand_list(Units),
                            do_summon(Role, {BaseId, SummonLev})
                    end;
                _ -> {false, lang:get("服务器等级没达标大家继续努力吧")}
            end
    end.

do_summon(Role = #role{m_constellation = MConstell},
          {BaseId, SummonLev}) ->
    DoneToday = var:get_var(Role, day_five, 139, 0),
    case constellation_data:get_summon(DoneToday + 1) of
        #{cost := Cost} ->
            Loss = format:val_to_loss(Cost),
            case role_gain:do_notice(Loss, Role) of
                {ok, Role1} ->
                    MapId = 10004,
                    case {1823, 1054} of
                        {X, Y} ->
                            Summoned = #constellation_summoned{base_id = BaseId,
                                                               lev = SummonLev,
                                                               map = MapId,
                                                               x = X, y = Y,
                                                               time =
                                                                   date:unixtime()},
                            Role2 = var:acc_var(Role1, day_five, 139),
                            Role3 = Role2#role{m_constellation =
                                                   MConstell#m_constellation{summoned
                                                                                 =
                                                                                 [Summoned]}},
                            Timer = #timer{id = constellation_summon_expire,
                                           timeout = 3600 * 1000, times = 1,
                                           m = constellation,
                                           f = summoned_expire, a = []},
                            Role4 = role_timer:set(Timer, Role3),
                            push(Role4, 15201),
                            StarStr = util:flist(lang:get("~w星"), [SummonLev]),
                            Msg = notice:format(lang:get("~ts~ts已经被召唤出来，快去挑战吧"),
                                                [{string_2, 6, StarStr},
                                                 {unit_1, BaseId}]),
                            {ok, Msg, Role4};
                        _ -> {false, lang:get("找不到合适位置")}
                    end;
                {false, #loss{msg = Msg}} -> {false, Msg}
            end;
        _ -> {false, lang:get("召唤次数用完了")}
    end.

summoned_expire(Role = #role{m_constellation =
                                 MConstell = #m_constellation{summoned =
                                                                  [#constellation_summoned{lev
                                                                                               =
                                                                                               SummonLev,
                                                                                           base_id
                                                                                               =
                                                                                               BaseId}]}}) ->
    StarStr = util:flist(lang:get("~w星"), [SummonLev]),
    Msg = notice:format(lang:get("~ts~ts已随流星而去，下次记得快点挑战哦"),
                        [{string_2, 6, StarStr}, {unit_1, BaseId}]),
    notice:send(Role, 3, Msg),
    Role1 = Role#role{m_constellation =
                          MConstell#m_constellation{summoned = []}},
    push(Role1, 15201),
    {ok, Role1};
summoned_expire(_) -> ok.

fight_summon(#role{m_constellation =
                       #m_constellation{summoned =
                                            [#constellation_summoned{map =
                                                                         SMap}]},
                   pos = #pos{map = Map}})
    when Map =/= SMap ->
    {false, lang:get("请先找到单位")};
fight_summon(#role{s_event = Event})
    when Event =:= 24 orelse Event =:= 25 ->
    {false, lang:get("武道会中不能挑战星座")};
fight_summon(Role = #role{lev = LeaderLev,
                          m_constellation =
                              #m_constellation{summoned =
                                                   [#constellation_summoned{base_id
                                                                                =
                                                                                BaseId,
                                                                            lev
                                                                                =
                                                                                NeedLev}]}}) ->
    case constellation_data:get_unit({NeedLev, BaseId}) of
        Args = #{unit_id := BaseId} ->
            case team:get_fighters(Role) of
                {ok, Mates} when length(Mates) < 3 ->
                    {false,
                     util:flist(lang:get("星座的力量不可小觑，组够~w个人再来挑战我吧！"), [3])};
                {ok, Mates} ->
                    AllLev = [Lev || #team_mate{lev = Lev} <- Mates],
                    Unit = get_star_unit(Args#{all_lev =>
                                                   [LeaderLev | AllLev]},
                                         BaseId,
                                         NeedLev),
                    ExtArgs = [{unit_id, {summon, BaseId, NeedLev}}],
                    _Res = combat_mgr:start_combat(26,
                                                   Mates,
                                                   Unit,
                                                   #combat_start_args{ext_args =
                                                                          ExtArgs}),
                    logger:debug("开战结果 ~w", [_Res], constellation, 297),
                    ok;
                Else -> Else
            end;
        _ -> {false, lang:get("找不到星座")}
    end;
fight_summon(_) -> {false, lang:get("当前没有召唤的星座")}.

do_combat_check(#role{s_event = Event}, _)
    when Event =:= 24 orelse Event =:= 25 ->
    {false, lang:get("武道会中不能挑战星座")};
do_combat_check(Role = #role{m_constellation =
                                 #m_constellation{lev = OpenLev},
                             lev = LeaderLev},
                U = #unit{id = Id}) ->
    Rewarded = var:get_var(Role, day_five, 37, 0),
    case ets:lookup(constellation_unit, Id) of
        [#constellation_unit{lev = NeedLev}]
            when Rewarded >= 3 andalso NeedLev > OpenLev ->
            {false, lang:get("今日挑战次数已满，无法挑战更高星座。")};
        [#constellation_unit{lev = NeedLev}]
            when NeedLev >= 13 andalso OpenLev < 12 ->
            {false,
             notice:format(lang:get("获得~ts星星座的认可再来挑战我吧。（当前可挑战星级：~ts星）"),
                           [{string_2, 5, 12}, {string_2, 5, OpenLev + 1}])};
        [#constellation_unit{lev = NeedLev}]
            when NeedLev > OpenLev + 1 andalso NeedLev =< 12 ->
            {false,
             notice:format(lang:get("获得~ts星星座的认可再来挑战我吧。（当前可挑战星级：~ts星）"),
                           [{string_2, 5, NeedLev - 1},
                            {string_2, 5, OpenLev + 1}])};
        [#constellation_unit{lev = NeedLev, base_id = BaseId,
                             fail = Fail, guards = Guards}] ->
            case constellation_data:get_unit({NeedLev, BaseId}) of
                Args = #{unit_id := BaseId, attr := Attr} ->
                    case team:get_fighters(Role) of
                        {ok, Mates} when length(Mates) < 3 ->
                            {false,
                             util:flist(lang:get("星座的力量不可小觑，组够~w个人再来挑战我吧！"),
                                        [3])};
                        {ok, Mates} ->
                            AllLev = [Lev || #team_mate{lev = Lev} <- Mates],
                            FirstAttr = case ets:lookup(constellation_first1,
                                                        {NeedLev, BaseId})
                                            of
                                            [] ->
                                                case
                                                    constellation_data:get_first(Fail)
                                                    of
                                                    #constellation_first_data{attr
                                                                                  =
                                                                                  FAttr} ->
                                                        FAttr;
                                                    _ -> []
                                                end;
                                            _ -> []
                                        end,
                            Unit = get_star_unit(Args#{all_lev =>
                                                           [LeaderLev | AllLev],
                                                       attr :=
                                                           Attr ++ FirstAttr},
                                                 U),
                            ExtArgs = [{unit_id, {BaseId, NeedLev}},
                                       {constellation_guard, Guards}],
                            _Res = combat_mgr:start_combat(26,
                                                           Mates,
                                                           Unit,
                                                           #combat_start_args{ext_args
                                                                                  =
                                                                                  ExtArgs}),
                            logger:debug("开战结果 ~w", [_Res], constellation, 338),
                            {ok};
                        Else -> Else
                    end;
                #{unit_id := UnitId, location := [{Map, _, _} | _]} ->
                    Msg = notice:format(lang:get("你现在还不够资格挑战我，请前往~ts挑战~ts"),
                                        [{string_2, 4, map:name(Map)},
                                         {unit_1, UnitId}]),
                    {false, Msg};
                _ -> {false, lang:get("你现在还不够资格挑战我")}
            end;
        _E ->
            logger:debug("================:~w",
                         [{Id, _E}],
                         constellation,
                         349),
            {false, lang:get("无法开打")}
    end;
do_combat_check(_, _) -> {false, lang:get("现在不能开打")}.

check_gain(Role, Result = win, ExtArgs, Rewards)
    when is_list(ExtArgs) ->
    case lists:keyfind(unit_id, 1, ExtArgs) of
        {unit_id, OldArgs} ->
            check_gain(Role, Result, OldArgs, Rewards);
        _Else ->
            logger:error("星座战斗结算错误：~w",
                         [_Else],
                         constellation,
                         360),
            {Role, []}
    end;
check_gain(Role = #role{m_constellation = MConstell},
           Result = win, {summon, BaseId, NeedLev}, Rewards) ->
    Role1 = Role#role{m_constellation =
                          MConstell#m_constellation{summoned = []}},
    Role2 = var:acc_var(Role1, day_five, 140),
    check_gain(Role2, Result, {BaseId, NeedLev}, Rewards);
check_gain(Role, Result, {summon, BaseId, NeedLev},
           Rewards) ->
    check_gain(Role, Result, {BaseId, NeedLev}, Rewards);
check_gain(Role = #role{m_constellation =
                            MConstell = #m_constellation{lev = OpenLev,
                                                         finished = FinL},
                        name = Name, lev = _Lev,
                        m_lev_break = #m_lev_break{times = _Times}},
           win, {BaseId, NeedLev}, Rewards) ->
    FinL1 = [O || O = {_, _} <- FinL],
    NewFinL = case lists:keyfind({BaseId, NeedLev},
                                 1,
                                 FinL1)
                  of
                  {_, _} -> FinL;
                  _ ->
                      Now = date:unixtime(),
                      [{{BaseId, NeedLev}, Now} | FinL1]
              end,
    IsLeader = case team:get_status(Role) of
                   {true, 1} -> true;
                   _ -> false
               end,
    Rewarded = var:get_var(Role, day_five, 37, 0),
    Role1 = var:acc_var(Role, day_five, 37),
    Evt = case teacher:teacher_in_team(Role1) of
              true ->
                  [#evt_constellation{lev = NeedLev, base_id = BaseId},
                   #evt_constellation_kill{}];
              _ -> #evt_constellation{lev = NeedLev, base_id = BaseId}
          end,
    Role2 = role_trigger:fire(Evt, Role1),
    case produce(NeedLev, Role2) of
        _ when Rewarded >= 3 andalso Rewarded =< 8 ->
            push(Role2, 15201),
            {agenda:reward_helper(Role2,
                                  10,
                                  lang:get("今日挑战次数已满，无法获得道具与提升星级")),
             []};
        _ when Rewarded >= 3 ->
            push(Role2, 15201),
            notice:send(Role2, 3, lang:get("今日挑战次数已满，无法获得道具与提升星级")),
            {Role2, []};
        {false, Msg} ->
            push(Role2, 15201),
            notice:send(Role2, 3, lang:get("找不到掉落数据")),
            logger:error("找不到掉落数据：~w", [Msg], constellation, 402),
            {Role2, []};
        {ok, SuperItems, NormalItems} ->
            Role3 = reward_buff(Role2, BaseId, NeedLev),
            Role4 = case NeedLev - OpenLev of
                        1 when IsLeader orelse OpenLev < 3 ->
                            Role3#role{m_constellation =
                                           MConstell#m_constellation{lev =
                                                                         NeedLev,
                                                                     finished =
                                                                         NewFinL}};
                        _ ->
                            Role3#role{m_constellation =
                                           MConstell#m_constellation{finished =
                                                                         NewFinL}}
                    end,
            SuperItems1 = [{item_type:special_id(ItemId),
                            Bind,
                            Num,
                            Announce}
                           || {ItemId, Bind, Num, Announce} <- SuperItems],
            NormalItems1 = [{item_type:special_id(ItemId),
                             Bind,
                             Num,
                             Announce}
                            || {ItemId, Bind, Num, Announce} <- NormalItems],
            [begin
                 case Announce of
                     1 ->
                         StarStr = util:flist(lang:get("~w星"), [NeedLev]),
                         Msg =
                             notice:format(lang:get("~ts~ts被~ts成功挑战，点点星光化作一个~ts{face_1,36}"),
                                           [{string_2, 6, StarStr},
                                            {unit_1, BaseId},
                                            {role_2, Name},
                                            {item_2, ItemId, Num}]),
                         notice:cast(all, 5, Msg);
                     _ -> ok
                 end,
                 Msg2 = notice:format(lang:get("~ts获得~ts"),
                                      [{role_2, Name}, {item_2, ItemId, Num}]),
                 team:notice(Role, Msg2)
             end
             || {ItemId, _Bind, Num, Announce} <- SuperItems1],
            [begin
                 case Announce of
                     1 ->
                         StarStr = util:flist(lang:get("~w星"), [NeedLev]),
                         Msg =
                             notice:format(lang:get("~ts~ts被~ts成功挑战，点点星光化作一个~ts{face_1,36}"),
                                           [{string_2, 6, StarStr},
                                            {unit_1, BaseId},
                                            {role_2, Name},
                                            {item_2, ItemId, Num}]),
                         notice:cast(all, 5, Msg);
                     _ -> ok
                 end,
                 Msg2 = notice:format(lang:get("~ts获得~ts"),
                                      [{role_2, Name}, {item_2, ItemId, Num}]),
                 team:notice(Role, Msg2)
             end
             || {ItemId, _Bind, Num, Announce} <- NormalItems1],
            SuperItems2 = [{ItemId, Bind, Num}
                           || {ItemId, Bind, Num, _Announce} <- SuperItems1],
            NormalItems2 = [{ItemId, Bind, Num}
                            || {ItemId, Bind, Num, _Announce} <- NormalItems1],
            Gain = format:val_to_gain(lists:flatten([SuperItems2
                                                     | NormalItems2]))
                       ++ Rewards,
            push(Role4, 15201),
            Role5 = role_trigger:fire(#evt_constellation_score{lev =
                                                                   NeedLev,
                                                               base_id =
                                                                   BaseId},
                                      Role4),
            Role6 = case var:get_var(Role2, other, 2096, 0) of
                        0 ->
                            mail:send(Role5,
                                      lang:get("星座驾照认证"),
                                      lang:get("恭喜你首次完成了星座挑战，星辰学院特此颁发了星座驾照，请查收。祝您在星座挑战中小车越开越稳^-^"),
                                      [{23800, 1}]),
                            var:set_var(Role5, other, 2096, 1);
                        _ -> Role5
                    end,
            update_tar_role(Role6),
            {Role6, Gain}
    end;
check_gain(Role, _, _, _) -> {Role, []}.

treat_slave_attr(Fighter, Attr0) ->
    Fighter#fighter{attr =
                        {constellation, treat_unit_attr, [Attr0]}}.

treat_unit_attr(Attr, Attr0) -> do_attr(Attr0, Attr).

combat_over(#combat{winner = Winner, loser = Loser,
                    start_args = #combat_start_args{ext_args = ExtArgs},
                    round = Round}) ->
    case lists:keyfind(unit_id, 1, ExtArgs) of
        {_, {BaseId, NeedLev}} ->
            case [#constellation_winner{id = RoleId, name = Name,
                                        is_leader = IsLeader, round = Round,
                                        sex = Sex, classes = Classes,
                                        looks = Looks}
                  || #fighter{type = 1, origin_id = RoleId, name = Name,
                              is_leader = IsLeader, sex = Sex,
                              classes = Classes, looks = Looks}
                         <- Winner]
                of
                [] ->
                    case [OriginId
                          || #fighter{type = 2, origin_id = OriginId,
                                      is_leader = 1}
                                 <- Winner]
                        of
                        _Upps = [UId | _] ->
                            logger:debug("Ids ~w", [_Upps], constellation, 484),
                            RoleNames = [Name
                                         || #fighter{type = 1, name = Name,
                                                     is_leader = 1}
                                                <- Loser],
                            constellation !
                                {combat_over,
                                 #{loser => RoleNames, id => UId,
                                   lev => NeedLev, base_id => BaseId}};
                        _ -> ok
                    end;
                WinL ->
                    case [OriginId
                          || #fighter{type = 2, origin_id = OriginId,
                                      is_leader = 1}
                                 <- Loser]
                        of
                        _Upps = [UId | _] ->
                            logger:debug("Ids ~w", [_Upps], constellation, 492),
                            Record = combat_record:get_buffer(),
                            constellation !
                                {combat_over,
                                 #{winner => WinL, id => UId, lev => NeedLev,
                                   base_id => BaseId, record => Record}};
                        _ -> ok
                    end
            end;
        _ -> ok
    end;
combat_over(_) -> ok.

info(status) ->
    gen_fsm:sync_send_all_state_event(constellation,
                                      info_status).

push(#role{link = #link{conn_pid = ConnPid}},
     Cmd = 15200) ->
    Data = info(status),
    sys_conn:pack_send(ConnPid, Cmd, Data);
push(Role = #role{link = #link{conn_pid = ConnPid},
                  m_constellation = MConstell},
     Cmd = 15201) ->
    DoneToday = var:get_var(Role, day_five, 139, 0),
    sys_conn:pack_send(ConnPid,
                       Cmd,
                       {MConstell, DoneToday}).

start_link() ->
    gen_fsm:start_link({local, constellation},
                       constellation,
                       [],
                       []).

init([]) ->
    logger:info("开始启动...", [], constellation, 522),
    ets:new(constellation_unit,
            [set,
             named_table,
             public,
             {keypos, #constellation_unit.id}]),
    dets:open_file(constellation_unit,
                   [{file, "./dets/constellation_unit.dets"},
                    {keypos, #constellation_unit.id}]),
    dets:open_file(constellation_first,
                   [{file, "./dets/constellation_first.dets"},
                    {keypos, 2}]),
    dets:open_file(constellation_first1,
                   [{file, "./dets/constellation_first1.dets"},
                    {keypos, #constellation_first.key}]),
    ets:new(constellation_first1,
            [set,
             named_table,
             public,
             {keypos, #constellation_first.key}]),
    ets:new(constellation_role,
            [set,
             named_table,
             public,
             {keypos, #constellation_role.id}]),
    dets:open_file(constellation_role,
                   [{file, "./dets/constellation_role.dets"},
                    {keypos, #constellation_role.id}]),
    dets:to_ets(constellation_role, constellation_role),
    dets:to_ets(constellation_unit, constellation_unit),
    ets:new(constellation_unit_num,
            [set, named_table, public, {keypos, 1}]),
    load_data(),
    dets:delete_all_objects(constellation_first),
    init_data(),
    {StateName, Timeout} = get_state(),
    State = #state{ts = now(), timeout = Timeout},
    State1 = case StateName of
                 active ->
                     clean_units(),
                     init_unit(),
                     gen_units(),
                     UnitNum = statistics_units(),
                     update_unit_num(UnitNum),
                     next_refresh(State);
                 _ -> State
             end,
    logger:info("启动完成 state_name: ~w, timeout: ~w",
                [StateName, Timeout],
                constellation,
                553),
    {ok, StateName, State1, Timeout}.

handle_event(_Event, StateName, State) ->
    continue(StateName, State).

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
    Reply = ok,
    continue(Reply, StateName, State).

handle_info(refresh_units, active, State) ->
    clean_units(),
    gen_units(),
    UnitNum = statistics_units(),
    update_unit_num(UnitNum),
    UnitInfo = ets:tab2list(constellation_unit),
    Data = {UnitNum, UnitInfo},
    role_group:pack_send(world, 15205, Data),
    State1 = next_refresh(State),
    continue(active, State1);
handle_info(refresh_units, StateName, State) ->
    continue(StateName, State);
handle_info({combat_over,
             #{winner := WinL, id := UId, lev := NeedLev,
               base_id := BaseId, record := Record}},
            StateName, State) ->
    logger:debug("星座击杀胜利:", [], constellation, 596),
    Key = {NeedLev, BaseId},
    case ets:lookup(constellation_first1, Key) of
        [#constellation_first{}] -> ok;
        _ ->
            Now = date:unixtime(),
            F = #constellation_first{key = Key, mtime = Now,
                                     lev = NeedLev, base_id = BaseId,
                                     winner = WinL},
            P = env:get(platform),
            Z = env:get(zone_id),
            combat_record:save(14, {NeedLev, P, Z}, Record),
            reward_first(WinL, NeedLev, BaseId),
            dets:insert(constellation_first1, F),
            ets:insert(constellation_first1, F)
    end,
    case ets:lookup(constellation_unit, UId) of
        [#constellation_unit{}] ->
            remove_constellation_unit(UId),
            case ets:info(constellation_unit, size) of
                0 ->
                    logger:debug("星座击杀完成:", [], constellation, 616),
                    role_group:pack_send(world, 15205, {[], []});
                _ -> ok
            end;
        _ -> ok
    end,
    continue(StateName, State);
handle_info({combat_over,
             #{loser := Loser, id := UId, lev := NeedLev,
               base_id := BaseId}},
            StateName, State) ->
    {UnitOldMapId, MapId, NewFail, Guards} = case
                                                 ets:lookup(constellation_unit,
                                                            UId)
                                                 of
                                                 [#constellation_unit{map_id =
                                                                          OldMapId,
                                                                      fail =
                                                                          Fail,
                                                                      guards =
                                                                          _Guards}] ->
                                                     {OldMapId,
                                                      util:rand_list(map_list()
                                                                         --
                                                                         [OldMapId]),
                                                      Fail + 1,
                                                      _Guards};
                                                 _ ->
                                                     {0,
                                                      util:rand_list(map_list()),
                                                      1,
                                                      []}
                                             end,
    remove_constellation_unit(UId),
    case map:rand_pos(MapId) of
        {X, Y} ->
            case make_unit(BaseId, NeedLev) of
                UnitBase = #unit_data{} ->
                    case unit_mgr:create(17, UnitBase, {MapId, X, Y}) of
                        {ok, _Unit = #unit{id = Id}} ->
                            StarStr = util:flist(lang:get("~w星"), [NeedLev]),
                            Msg = case ets:lookup(constellation_first1,
                                                  {NeedLev, BaseId})
                                      of
                                      [] ->
                                          notice:format(lang:get("~ts~ts在击败~ts带领的队伍后，不屑地“哼”了一声并跑到了~ts某处（首杀荣誉虚位以"
                                                                 "待）{face_1,7}"),
                                                        [{string_2, 6, StarStr},
                                                         {unit_1, BaseId},
                                                         {role_2, Loser},
                                                         {map_1, MapId}]);
                                      _ ->
                                          notice:format(lang:get("~ts~ts在击败~ts带领的队伍后，不屑地“哼”了一声并跑到了~ts某处{face_1,7}"),
                                                        [{string_2, 6, StarStr},
                                                         {unit_1, BaseId},
                                                         {role_2, Loser},
                                                         {map_1, MapId}])
                                  end,
                            notice:cast(all, 10, Msg),
                            NewConstellationUnit = #constellation_unit{id = Id,
                                                                       lev =
                                                                           NeedLev,
                                                                       base_id =
                                                                           BaseId,
                                                                       map_id =
                                                                           MapId,
                                                                       x = X,
                                                                       y = Y,
                                                                       fail =
                                                                           NewFail,
                                                                       guards =
                                                                           Guards},
                            insert_constellation_unit(NewConstellationUnit),
                            update_unit_change_map(UnitOldMapId, MapId),
                            ok;
                        _False -> false
                    end;
                _ -> ok
            end;
        _ ->
            logger:error("找不到地图坐标 map:~w",
                         [MapId],
                         constellation,
                         654),
            false
    end,
    continue(StateName, State);
handle_info(_Info, StateName, State) ->
    logger:debug("未知消息 ~w", [_Info], constellation, 660),
    continue(StateName, State).

terminate(_Reason, _StateName, _State) -> ok.

code_change(_OldVsn, StateName, State, _Extra) ->
    {ok, StateName, State}.

idle(timeout, State) ->
    State1 = State#state{ts = now(), timeout = 300 * 1000},
    role_group:pack_send(world, 15200, {1, 300}),
    continue(notice, State1);
idle(_, State) -> continue(idle, State).

notice(timeout, State) ->
    clean_units(),
    State1 = State#state{ts = now(),
                         timeout = agenda:get_duration(2013) * 1000},
    init_unit(),
    State2 = case gen_units() of
                 ok ->
                     UnitNum = statistics_units(),
                     update_unit_num(UnitNum),
                     UnitInfo = ets:tab2list(constellation_unit),
                     Data = {UnitNum, UnitInfo},
                     role_group:pack_send(world, 15205, Data),
                     next_refresh(State1);
                 _ -> State1
             end,
    role_group:pack_send(world,
                         15200,
                         {2, agenda:get_duration(2013)}),
    continue(active, State2);
notice(_, State) -> continue(notice, State).

active(timeout, State) ->
    clean_units(all),
    {_, Tt} = agenda:get_state_timeout(2013, 300),
    Timeout = Tt * 1000,
    NewState = State#state{ts = now(), timeout = Timeout},
    role_group:pack_send(world, 15200, {0, Tt}),
    continue(idle, NewState);
active(_, State) -> continue(active, State).

get_state() ->
    {StateName, Timeout} = case
                               agenda:get_state_timeout(2013, 300)
                               of
                               {idle, Tt} -> {idle, Tt};
                               {notice, _} -> {notice, 300};
                               {active, _} ->
                                   {active, agenda:get_duration(2013)}
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

create_units(_, Num) when Num < 0 -> ok;
create_units(#{base_lev := BaseLev0, unit := Units,
               map := Maps, old_unit_list := OldUnitList},
             Num)
    when Num < 1 andalso BaseLev0 < 12 ->
    BaseLev = BaseLev0 + 1,
    {BaseId, _} = util:rand_list(Units, 2),
    MapId = lists:nth(Num rem length(Maps) + 1, Maps),
    Flag = case lists:keyfind(BaseLev,
                              #constellation_unit.lev,
                              OldUnitList)
               of
               #constellation_unit{} -> true;
               _ -> false
           end,
    case map:rand_pos(MapId) of
        _ when Flag == true -> ok;
        {X, Y} ->
            case make_unit(BaseId, BaseLev) of
                UnitBase = #unit_data{} ->
                    case unit_mgr:create(17, UnitBase, {MapId, X, Y}) of
                        {ok, _Unit = #unit{id = Id}} ->
                            CUnit = #constellation_unit{id = Id, lev = BaseLev,
                                                        base_id = BaseId,
                                                        map_id = MapId, x = X,
                                                        y = Y},
                            insert_constellation_unit(CUnit),
                            cast_msg(CUnit),
                            ok;
                        _False -> false
                    end;
                _ -> ok
            end;
        _ ->
            logger:error("找不到地图坐标 map:~w",
                         [MapId],
                         constellation,
                         781),
            false
    end;
create_units(_, Num) when Num < 1 -> ok;
create_units(Args = #{lev := Levs, unit := Units,
                      map := Maps, old_unit_list := OldUnitList},
             Num) ->
    {BaseId, _} = util:rand_list(Units, 2),
    {Lev, _} = util:rand_list(Levs, 2),
    MapId = lists:nth(Num rem length(Maps) + 1, Maps),
    Flag = case ets:lookup(constellation_first1,
                           {Lev, BaseId})
               of
               [] ->
                   case [1
                         || #constellation_unit{lev = TLev, base_id = TBaseId}
                                <- OldUnitList,
                            TLev == Lev andalso TBaseId == BaseId]
                       of
                       [_ | _] -> true;
                       _ -> false
                   end;
               _ -> false
           end,
    case map:rand_pos(MapId) of
        _ when Flag == true andalso Lev >= 4 ->
            create_units(Args, Num);
        {X, Y} ->
            case make_unit(BaseId, Lev) of
                UnitBase = #unit_data{} ->
                    case unit_mgr:create(17, UnitBase, {MapId, X, Y}) of
                        {ok, _Unit = #unit{id = Id}} ->
                            CUnit = #constellation_unit{id = Id, lev = Lev,
                                                        base_id = BaseId,
                                                        map_id = MapId, x = X,
                                                        y = Y},
                            insert_constellation_unit(CUnit),
                            cast_msg(CUnit),
                            create_units(Args, Num - 1);
                        _False -> false
                    end;
                _ -> create_units(Args, Num - 1)
            end;
        _ ->
            logger:error("找不到地图坐标 map:~w",
                         [MapId],
                         constellation,
                         819),
            false
    end.

map_list() ->
    util:rand_list_n([10002, 10007, 10004, 10003, 10001],
                     2).

create_lev_high_unites(#{lev_high := Levs, map := Maps,
                         unit := Units}) ->
    {BaseId, _} = util:rand_list(Units, 2),
    {Lev, _} = util:rand_list(Levs, 2),
    MapId = util:rand_list(Maps),
    Count = case catch ets:select_count(constellation_unit,
                                        [{#constellation_unit{_ = '_',
                                                              lev = '$1'},
                                          [{'>=', '$1', 13}],
                                          [true]}])
                of
                _Count when is_integer(_Count) -> _Count;
                _ -> 0
            end,
    Flag = Count >= 1,
    case map:rand_pos(MapId) of
        _ when Flag =:= true -> ok;
        {X, Y} ->
            Guards = create_high_guards(Lev, BaseId),
            case make_unit(BaseId, Lev) of
                _ when Lev == 0 -> ok;
                _ when Guards == [] -> ok;
                UnitBase = #unit_data{} ->
                    case unit_mgr:create(17, UnitBase, {MapId, X, Y}) of
                        {ok, _Unit = #unit{id = Id}} ->
                            CUnit = #constellation_unit{id = Id, lev = Lev,
                                                        base_id = BaseId,
                                                        map_id = MapId, x = X,
                                                        y = Y, guards = Guards},
                            insert_constellation_unit(CUnit),
                            cast_msg(CUnit),
                            ok;
                        _False -> false
                    end;
                _ -> ok
            end;
        _ ->
            logger:error("找不到地图坐标 map:~w",
                         [MapId],
                         constellation,
                         860),
            false
    end;
create_lev_high_unites(_) -> ok.

gen_units() ->
    {WorldLev, _} = world_lev:get_world_lev(),
    case constellation_data:get_refreshing(WorldLev) of
        Args = #{min := Min, max := Max, lev := Levs} ->
            OnlineNum = ets:info(role_id_index, size),
            Rand = util:ceil(OnlineNum * 10 / 400),
            TNum = util:check_range(Rand, Min, Max),
            Maps = map_list(),
            MapStr = [{string_2, 4, map:name(MapId)}
                      || MapId <- Maps],
            MapArgs = string:join(lists:duplicate(length(Maps),
                                                  "~ts"),
                                  "、"),
            Fmt1 =
                notice:format(lang:get("流星划过天际，~ts已经降临到~ts，大家快去挑战吧{face_1,7}"),
                              [{string_2, 1, lang:get("十二星座")},
                               {string_1, MapArgs}]),
            Msg = notice:format(Fmt1, MapStr),
            notice:cast(all, 5, Msg),
            FirstList = ets:tab2list(constellation_first1),
            BaseLev0 = case [FLev
                             || #constellation_first{lev = FLev} <- FirstList]
                           of
                           [] -> 0;
                           FList -> lists:max(FList)
                       end,
            NewLevs = [O
                       || O = {Lv, _} <- Levs, Lv =< BaseLev0 + 1],
            BaseLev = max(0,
                          lists:max([Lvm || {Lvm, _} <- NewLevs]) - 1),
            OUnitList = ets:tab2list(constellation_unit),
            Num = max(0, TNum - length(OUnitList)),
            logger:info("基础等级 ~w, 等级列表 ~w, 数量 ~w",
                        [BaseLev, NewLevs, Num],
                        constellation,
                        889),
            create_units(Args#{map => Maps, base_lev => BaseLev,
                               lev := NewLevs, old_unit_list => OUnitList},
                         Num),
            create_units(Args#{map => Maps, base_lev => 0,
                               lev := NewLevs, old_unit_list => OUnitList},
                         1),
            create_lev_high_unites(Args#{map => Maps});
        _ ->
            logger:error("没有刷新怪配置，世界等级 ~w",
                         [WorldLev],
                         constellation,
                         895),
            false
    end.

make_unit(BaseId, Lev) ->
    case unit_data:get(BaseId) of
        UnitBase = #unit_data{name = Name} ->
            NewUnitName = util:flist(lang:get("~w星~ts"),
                                     [Lev, Name]),
            UnitBase#unit_data{name = NewUnitName};
        _ ->
            logger:debug("找不到单位配置 ~w",
                         [BaseId],
                         constellation,
                         908),
            false
    end.

clean_units() -> clean_units(normal).

clean_units(Label) ->
    lists:foreach(fun (#constellation_unit{id = Id,
                                           lev = Lev, base_id = BaseId}) ->
                          case ets:lookup(constellation_first1, {Lev, BaseId})
                              of
                              [_ | _] ->
                                  unit_mgr:remove(Id),
                                  remove_constellation_unit(Id);
                              _ when Label == all -> unit_mgr:remove(Id);
                              _ -> ignore
                          end
                  end,
                  ets:tab2list(constellation_unit)).

init_unit() ->
    DoList = lists:foldl(fun (OUnit = #constellation_unit{id
                                                              = Id,
                                                          base_id = BaseId,
                                                          lev = Lev,
                                                          map_id = MapId, x = X,
                                                          y = Y},
                              Rtn) ->
                                 case ets:lookup(constellation_first1,
                                                 {Lev, BaseId})
                                     of
                                     [_ | _] -> ignore;
                                     _ ->
                                         case make_unit(BaseId, Lev) of
                                             UnitBase = #unit_data{} ->
                                                 case unit_mgr:create(17,
                                                                      UnitBase,
                                                                      {MapId,
                                                                       X,
                                                                       Y})
                                                     of
                                                     {ok,
                                                      _Unit = #unit{id =
                                                                        UId}} ->
                                                         CUnit =
                                                             OUnit#constellation_unit{id
                                                                                          =
                                                                                          UId},
                                                         [{Id, CUnit} | Rtn];
                                                     _False -> Rtn
                                                 end;
                                             _ -> Rtn
                                         end
                                 end
                         end,
                         [],
                         ets:tab2list(constellation_unit)),
    [remove_constellation_unit(DelId)
     || {DelId, _InUnit} <- DoList],
    [insert_constellation_unit(InUnit)
     || {_DelId, InUnit} <- DoList].

next_refresh(State = #state{gen_ref = OldRef}) ->
    case erlang:is_reference(OldRef) of
        true -> erlang:cancel_timer(OldRef);
        _ -> ok
    end,
    {_, Time} = date:seconds_to_datetime(date:unixtime()),
    Timeout = case Time of
                  {H, M, _} when M < 30 -> date:next_diff({H, 30, 0});
                  {0, _, _} -> date:next_diff({1, 30, 0});
                  {H, _, _} -> date:next_diff({H + 1, 30, 0})
              end,
    logger:info("下次刷新时间 ~w", [Timeout], constellation, 966),
    GenRef = erlang:send_after(Timeout * 1000,
                               self(),
                               refresh_units),
    State#state{gen_ref = GenRef}.

get_star_unit(Args = #{attr := Attr0},
              U = #unit{base_id = BaseId}) ->
    case unit_convert:to(fighter, U) of
        {ok, Fighter = #fighter{}} ->
            NewSlave = case Args of
                           #{follower := Slave} ->
                               [{I,
                                 N,
                                 O,
                                 {constellation, treat_slave_attr, [Attr0]}}
                                || {I, N, O} <- Slave];
                           _ -> []
                       end,
            [Fighter#fighter{attr =
                                 {constellation, treat_unit_attr, [Attr0]},
                             slave = NewSlave}];
        _R ->
            logger:error("单位转换失败 [~w] ~w",
                         [BaseId, _R],
                         constellation,
                         981),
            []
    end.

get_star_unit(Args = #{attr := Attr0}, BaseId, Lev) ->
    case unit_convert:to(unit_base_id_to_fighter, BaseId) of
        {ok, Fighter = #fighter{name = Name}} ->
            NewName = util:flist(lang:get("~w星~ts"), [Lev, Name]),
            NewSlave = case Args of
                           #{follower := Slave} ->
                               [{I,
                                 N,
                                 O,
                                 {constellation, treat_slave_attr, [Attr0]}}
                                || {I, N, O} <- Slave];
                           _ -> []
                       end,
            [Fighter#fighter{attr =
                                 {constellation, treat_unit_attr, [Attr0]},
                             slave = NewSlave, name = NewName}];
        _R ->
            logger:error("单位转换失败 [~w] ~w",
                         [BaseId, _R],
                         constellation,
                         995),
            []
    end.

do_attr([], Attr) -> Attr;
do_attr([{51, Rate} | T], Attr = #attr{hp_max = Val}) ->
    do_attr(T, Attr#attr{hp_max = round(Val * Rate / 100)});
do_attr([{52, Rate} | T], Attr = #attr{mp_max = Val}) ->
    do_attr(T, Attr#attr{mp_max = round(Val * Rate / 100)});
do_attr([{53, Rate} | T],
        Attr = #attr{atk_speed = Val}) ->
    do_attr(T,
            Attr#attr{atk_speed = round(Val * Rate / 100)});
do_attr([{54, Rate} | T],
        Attr = #attr{phy_dmg = Val}) ->
    do_attr(T,
            Attr#attr{phy_dmg = round(Val * Rate / 100)});
do_attr([{55, Rate} | T],
        Attr = #attr{magic_dmg = Val}) ->
    do_attr(T,
            Attr#attr{magic_dmg = round(Val * Rate / 100)});
do_attr([{56, Rate} | T],
        Attr = #attr{phy_def = Val}) ->
    do_attr(T,
            Attr#attr{phy_def = round(Val * Rate / 100)});
do_attr([{57, Rate} | T],
        Attr = #attr{magic_def = Val}) ->
    do_attr(T,
            Attr#attr{magic_def = round(Val * Rate / 100)});
do_attr([{58, Rate} | T], Attr = #attr{crit = Val}) ->
    do_attr(T, Attr#attr{crit = round(Val * Rate / 100)});
do_attr([{59, Rate} | T],
        Attr = #attr{tenacity = Val}) ->
    do_attr(T,
            Attr#attr{tenacity = round(Val * Rate / 100)});
do_attr([{23, Rate} | T],
        Attr = #attr{dmg_ratio = Val}) ->
    do_attr(T, Attr#attr{dmg_ratio = Val + Rate});
do_attr([{24, Rate} | T],
        Attr = #attr{def_ratio = Val}) ->
    do_attr(T, Attr#attr{def_ratio = Val + Rate});
do_attr([{25, Rate} | T],
        Attr = #attr{enhance_control = Val}) ->
    do_attr(T, Attr#attr{enhance_control = Val + Rate});
do_attr([{26, Rate} | T],
        Attr = #attr{anti_control = Val}) ->
    do_attr(T, Attr#attr{anti_control = Val + Rate});
do_attr([{Type, Rate} | T], Attr) ->
    logger:error("未知属性 ~w, ~w",
                 [Type, Rate],
                 constellation,
                 1040),
    do_attr(T, Attr).

reward_first(WinL, NeedLev, BaseId) ->
    case constellation_data:get_first_reward(NeedLev) of
        #{items := Items} ->
            MailInfo = #{items => [{I, 0, N} || {I, N} <- Items],
                         title => lang:get("星级首杀奖励"),
                         content =>
                             notice:format(lang:get("你是第一个在~ts中击败~ts星级的勇者，特发此奖励，敬请查收"),
                                           [{string_2, 1, lang:get("十二星座")},
                                            {string_2, 5, NeedLev}])},
            mail:send([Id
                       || #constellation_winner{id = Id} <- WinL],
                      MailInfo),
            [role_trigger:async_fire(Id,
                                     #evt_constellation_first{base_id =
                                                                  NeedLev})
             || #constellation_winner{id = Id} <- WinL],
            case [Name
                  || #constellation_winner{name = Name, is_leader = 1}
                         <- WinL]
                of
                [LName | _] ->
                    StarStr = util:flist(lang:get("~w星"), [NeedLev]),
                    Msg =
                        notice:format(lang:get("<color='#ffff00'>首杀达成！</color>~ts<color='#fff"
                                               "f00'>带领的队伍成功挑战</color>~ts~ts~ts<color='#ffff0"
                                               "0'>，获得全服首杀荣誉与奖励！</color>{face_1,25}"),
                                      [{role_2, LName},
                                       {string_2, 1, lang:get("十二星座")},
                                       {string_2, 6, StarStr},
                                       {unit_1, BaseId}]),
                    notice:cast(all, 10, Msg);
                _ -> ok
            end;
        _ -> ok
    end.

reward_buff(Role, BaseId, NeedLev) ->
    case constellation_data:get_unit({NeedLev, BaseId}) of
        #{buff_id := BuffId} ->
            case buff:add_and_calc(Role, BuffId) of
                {ok, Role1} -> Role1;
                _ -> Role
            end;
        _ -> Role
    end.

statistics_units() ->
    Fun = fun (#constellation_unit{map_id = MapId}, Rtn) ->
                  case lists:keyfind(MapId, 1, Rtn) of
                      {_, Num} ->
                          lists:keystore(MapId, 1, Rtn, {MapId, Num + 1});
                      _ -> [{MapId, 1} | Rtn]
                  end
          end,
    ets:foldl(Fun, [], constellation_unit).

update_unit_num(UnitNum) ->
    ets:delete_all_objects(constellation_unit_num),
    [ets:insert(constellation_unit_num, Data)
     || Data <- UnitNum].

update_unit_change_map(FromMapId, ToMapId) ->
    case ets:lookup(constellation_unit_num, FromMapId) of
        [{FromMapId, Count}] ->
            ets:insert(constellation_unit_num,
                       {FromMapId, max(Count - 1, 0)});
        _ -> ok
    end,
    case ets:lookup(constellation_unit_num, ToMapId) of
        [{ToMapId, ToCount}] ->
            ets:insert(constellation_unit_num,
                       {ToMapId, ToCount + 1});
        _ -> ets:insert(constellation_unit_num, {ToMapId, 1})
    end.

get_tar_role(Rid) ->
    case ets:lookup(constellation_role, Rid) of
        [TargetRole | _] -> {ok, TargetRole};
        _ -> {false, no_tar_role}
    end.

update_tar_role(Role = #role{id = Rid,
                             m_constellation =
                                 #m_constellation{lev = Lev,
                                                  finished = Finished},
                             name = Name, sex = Sex, classes = Classes,
                             m_head = #m_head{id_now = IdNow}}) ->
    case ets:lookup(constellation_role, Rid) of
        [#constellation_role{lev = OLev}]
            when OLev < Lev andalso OLev > 5 ->
            StarStr = util:flist(lang:get("~w星难度"), [Lev]),
            mail:send(Role,
                      lang:get("星座驾照升级"),
                      notice:format(lang:get("恭喜你在星座挑战中成功挑战~ts，星座驾照从~ts级提升至~ts级，祝您在星座挑战中小车越"
                                             "开越稳^-^"),
                                    [{string_2, 6, StarStr},
                                     {string_1, OLev},
                                     {string_1, Lev}]),
                      []);
        _ -> skip
    end,
    MaxKill = case Finished of
                  [] -> 0;
                  _ ->
                      Finished2 = [FinishLev
                                   || {{_, FinishLev}, _} <- Finished],
                      lists:max(Finished2)
              end,
    TitleLev = Lev,
    TarRole = #constellation_role{id = Rid,
                                  classes = Classes, id_now = IdNow, sex = Sex,
                                  name = Name, lev = Lev, max_kill = MaxKill,
                                  title_lev = TitleLev},
    dets:insert(constellation_role, TarRole),
    ets:insert(constellation_role, TarRole),
    TarRole.

cast_msg(#constellation_unit{lev = Lev,
                             base_id = BaseId, map_id = MapId,
                             guards = Guards}) ->
    StarStr = util:flist(lang:get("~w星"), [Lev]),
    case ets:lookup(constellation_first1, {Lev, BaseId}) of
        [] ->
            case constellation_data:get_first_reward(Lev) of
                #{items := [_ | _]} ->
                    Msg =
                        notice:format(lang:get("~ts~ts<color='#ffff00'>首次降临，全服首杀荣誉究竟花落谁家，让我们拭"
                                               "目以待</color>{face_1,7}"),
                                      [{string_2, 6, StarStr},
                                       {unit_1, BaseId}]),
                    notice:cast(all, 10, Msg);
                _ -> ignore
            end;
        _ -> ok
    end,
    case Lev >= 13 of
        true ->
            InitStr = string:join(lists:duplicate(length(Guards),
                                                  "  ~ts:~ts"),
                                  "\n"),
            GuardClassesNames = lists:foldl(fun
                                                (#constellation_guard{classes =
                                                                          Classes,
                                                                      name =
                                                                          Name},
                                                 Rtn) ->
                                                    [{string_2,
                                                      5,
                                                      format:classes_name(Classes)},
                                                     {role_2, Name}
                                                     | Rtn]
                                            end,
                                            [],
                                            Guards),
            GuardStr = notice:format(InitStr, GuardClassesNames),
            HighMsg =
                notice:format(lang:get("<color='#ffff00'>电闪雷鸣！</color>~ts~ts<color='#"
                                       "ffff00'>出现在</color>~ts<color='#ffff00'>了！</co"
                                       "lor>{face_1, 7}\n <color='#ffff00'>星座守护者:</co"
                                       "lor>\n~ts\n<color='#ffff00'>勇士们快快拿起武器前去挑战吧！</"
                                       "color>{face_1, 18}"),
                              [{string_2, 6, StarStr},
                               {unit_1, BaseId},
                               {map_1, MapId},
                               {string_1, GuardStr}]),
            notice:cast(all, 10, HighMsg);
        _ -> ignore
    end,
    ok;
cast_msg(_) -> ok.

load_data() ->
    case dets:first(constellation_first) of
        '$end_of_table' ->
            dets:to_ets(constellation_first1, constellation_first1),
            logger:info("没有数据需要加载", [], constellation, 1169),
            [];
        _ ->
            dets:traverse(constellation_first,
                          fun (Data) ->
                                  case constellation_ver:do(first, Data) of
                                      {false, Reason} ->
                                          logger:error("数据转换失败:~w",
                                                       [Reason],
                                                       constellation,
                                                       1176),
                                          {done, false};
                                      {ok, NewData = #constellation_first{}} ->
                                          logger:debug("~w",
                                                       [NewData],
                                                       constellation,
                                                       1179),
                                          ets:insert(constellation_first1,
                                                     NewData),
                                          dets:insert(constellation_first1,
                                                      NewData),
                                          continue
                                  end
                          end)
    end.

init_data() -> init_data(first).

init_data(first) ->
    case date:unixtime() =<
             date:datetime_to_seconds({{2017, 8, 4}, {7, 0, 0}})
        of
        true ->
            List = ets:tab2list(constellation_first1),
            init_data(List);
        _ -> ignore
    end;
init_data([]) -> ok;
init_data([H = #constellation_first{lev = Lev,
                                    base_id = 0}
           | T]) ->
    lists:foreach(fun (BaseId) ->
                          NH = H#constellation_first{key = {Lev, BaseId},
                                                     base_id = BaseId},
                          ets:insert(constellation_first1, NH),
                          dets:insert(constellation_first1, NH)
                  end,
                  [77002, 77003, 77005, 77009, 77001, 77011, 77008]),
    init_data(T);
init_data([_ | T]) -> init_data(T);
init_data(_) -> ok.

create_high_guards(Lev, BaseId) ->
    case constellation_data:get_unit({Lev, BaseId}) of
        #{follower := Follower,
          follower_num := FollowerNumList} ->
            FollowerNum = case FollowerNumList of
                              [_ | _] ->
                                  {TFollowerNum, _} =
                                      util:rand_list(FollowerNumList),
                                  TFollowerNum;
                              _ -> 0
                          end,
            Follower2 = [{unit_data:get(UnitId), O, I}
                         || {UnitId, O, I} <- Follower],
            Follower3 = [{TUnitId, O, I}
                         || {#unit_data{id = TUnitId, classes = Classes}, O, I}
                                <- Follower2,
                            Classes > 0],
            DelNum = max(0, 6 - FollowerNum),
            Follower4 = lists:sublist(util:shuffle(Follower3),
                                      DelNum),
            Follower5 = Follower -- Follower4,
            logger:debug("======================:~w",
                         [{DelNum, Follower4}],
                         constellation,
                         1229),
            logger:debug("======================:~w",
                         [Follower5],
                         constellation,
                         1230),
            Follower6 = [{unit_data:get(UnitId), O, I}
                         || {UnitId, O, I} <- Follower5],
            Follower7 = [{TUnitId, O, I}
                         || {#unit_data{id = TUnitId, classes = Classes}, O, I}
                                <- Follower6,
                            Classes > 0],
            logger:debug("======================:~w",
                         [Follower7],
                         constellation,
                         1233),
            lists:foldl(fun gen_gurad_fun/2, [], Follower7);
        _ -> []
    end.

gen_gurad_fun({UnitId, _, _}, Rtn) ->
    ClasseType = case unit_data:get(UnitId) of
                     #unit_data{classes = Classes} -> Classes;
                     _ -> 0
                 end,
    RankType = case ClasseType of
                   1 -> 21;
                   2 -> 22;
                   3 -> 23;
                   4 -> 24;
                   5 -> 25;
                   6 -> 26;
                   7 -> 27;
                   _ -> 0
               end,
    case rank:list(RankType) of
        List = [_ | _] when length(List) >= 5 ->
            RankRcs = lists:sublist(List, 5),
            RankFun = fun (#rank_rc{id = RoleId},
                           {RtnRankData, Index}) ->
                              {[{RoleId, rank_to_rate(Index)} | RtnRankData],
                               Index + 1}
                      end,
            {RobotIds, _} = lists:foldl(RankFun, {[], 1}, RankRcs),
            RobotId = case util:rand_list(RobotIds, 2) of
                          {_Id, _} -> _Id;
                          _ -> {0, "", 0}
                      end,
            logger:debug("==========:~w",
                         [RobotId],
                         constellation,
                         1268),
            case robot_mgr:get_role(RobotId) of
                {ok,
                 #robot_role{name = Name, sex = Sex, lev = Lev,
                             looks = Looks}} ->
                    Guard = #constellation_guard{id = RobotId,
                                                 base_id = UnitId,
                                                 classes = ClasseType,
                                                 name = Name, sex = Sex,
                                                 lev = Lev, looks = Looks},
                    [Guard | Rtn];
                _ ->
                    Guard = #constellation_guard{id = RobotId,
                                                 base_id = UnitId},
                    [Guard | Rtn]
            end;
        _ -> Rtn
    end;
gen_gurad_fun({_, UnitId, _Args1, _Args2}, Rtn) ->
    gen_gurad_fun({UnitId, _Args1, _Args2}, Rtn);
gen_gurad_fun(_, Rtn) -> Rtn.

rank_to_rate(Rank) ->
    case Rank of
        1 -> 250;
        2 -> 225;
        3 -> 200;
        4 -> 175;
        5 -> 150;
        _ -> 100
    end.

remove_constellation_unit(UnitId) ->
    ets:delete(constellation_unit, UnitId),
    dets:delete(constellation_unit, UnitId).

insert_constellation_unit(Unit) ->
    ets:insert(constellation_unit, Unit),
    dets:insert(constellation_unit, Unit).

produce(StarLev,
        _Role = #role{classes = Classes, lev = Lev,
                      m_lev_break =
                          _MLevBreak = #m_lev_break{times = BreakTime}}) ->
    case get_drop(StarLev, Classes, Lev, BreakTime) of
        {true, SuperItems, NormalItems} ->
            {ok, SuperItems, NormalItems};
        {false, Reason} -> {false, Reason};
        null -> {false, null}
    end.

get_drop(StarLev, Classes, Lev, BreakTime) ->
    logger:debug("挑战的星座等级：~w",
                 [StarLev],
                 constellation,
                 1319),
    case constellation_data:get_rule(StarLev) of
        RuleList when length(RuleList) > 0 ->
            Rule = lists:nth(1, RuleList),
            case do_produce(Rule, Classes, Lev, BreakTime) of
                {SuperItems, NormalItems} ->
                    {true, SuperItems, NormalItems};
                _ -> {false, lang:get("找不到掉落数据")}
            end;
        _ -> null
    end.

do_produce(Rule = #{lev := StarLev}, Classes, Lev,
           BreakTime) ->
    NorMalList =
        constellation_data:get_normal_list(StarLev),
    SuperList = constellation_data:get_super_list(StarLev),
    SuperList1 = [Db
                  || Db = #{classes := Classes1, lev_min := LevMin,
                            lev_max := LevMax, break_times_min := BreakTimeMin,
                            break_times_max := BreakTimeMax}
                         <- SuperList,
                     (Classes1 =:= Classes orelse Classes1 =:= 0) andalso
                         (LevMin =:= 0 andalso LevMax =:= 0 orelse
                              LevMin =:= 0 andalso Lev =< LevMax orelse
                                  Lev >= LevMin andalso LevMax =:= 0 orelse
                                      Lev >= LevMin andalso Lev =< LevMax)
                             andalso
                             (BreakTimeMin =:= 0 andalso BreakTimeMax =:= 0
                                  orelse
                                  BreakTimeMin =:= 0 andalso
                                      BreakTime =< BreakTimeMax
                                      orelse
                                      BreakTime >= BreakTimeMin andalso
                                          BreakTimeMax =:= 0
                                          orelse
                                          BreakTime >= BreakTimeMin andalso
                                              BreakTime =< BreakTimeMax)],
    NorMalList1 = [Db2
                   || Db2 = #{classes := Classes2, lev_min := LevMin2,
                              lev_max := LevMax2,
                              break_times_min := BreakTimeMin2,
                              break_times_max := BreakTimeMax2}
                          <- NorMalList,
                      (Classes2 =:= Classes orelse Classes2 =:= 0) andalso
                          (LevMin2 =:= 0 andalso LevMax2 =:= 0 orelse
                               LevMin2 =:= 0 andalso Lev =< LevMax2 orelse
                                   Lev >= LevMin2 andalso LevMax2 =:= 0 orelse
                                       Lev >= LevMin2 andalso Lev =< LevMax2)
                              andalso
                              (BreakTimeMin2 =:= 0 andalso BreakTimeMax2 =:= 0
                                   orelse
                                   BreakTimeMin2 =:= 0 andalso
                                       BreakTime =< BreakTimeMax2
                                       orelse
                                       BreakTime >= BreakTimeMin2 andalso
                                           BreakTimeMax2 =:= 0
                                           orelse
                                           BreakTime >= BreakTimeMin2 andalso
                                               BreakTime =< BreakTimeMax2)],
    {SuperItems, NormalItems} = drop_progress(Rule,
                                              SuperList1,
                                              NorMalList1),
    SuperItems1 = [{ItemId, Bind, Num, Notice}
                   || {ItemId, Bind, Num, Notice} <- SuperItems,
                      ItemId =/= 0],
    NormalItems1 = [{ItemId, Bind, Num, Notice}
                    || {ItemId, Bind, Num, Notice} <- NormalItems,
                       ItemId =/= 0],
    {SuperItems1, NormalItems1}.

drop_progress(Rule, Super, NorMal) ->
    drop_progress(Rule, Super, NorMal, 1, [], []).

drop_progress(_Rule, _Super, _Normal, Flag, SuperI,
              NorMalI)
    when Flag >= 5 ->
    {SuperI, NorMalI};
drop_progress(Rule, [], NorMal, 1, SuperI, NorMalI) ->
    drop_progress(Rule, [], NorMal, 2, SuperI, NorMalI);
drop_progress(Rule = #{super_r := Sratio}, Super,
              NorMal, 1, SuperI, NorMalI) ->
    case util:rand(1, 10000) =< Sratio of
        true ->
            case util:rand_list(Super, ratio) of
                Db = #{item_id := ItemId, num := Num, bind := Bind,
                       notice := Notice}
                    when is_map(Db) ->
                    drop_progress(Rule,
                                  Super,
                                  NorMal,
                                  3,
                                  [{ItemId, Bind, Num, Notice} | SuperI],
                                  NorMalI);
                _Err ->
                    drop_progress(Rule, Super, NorMal, 2, SuperI, NorMalI)
            end;
        false ->
            drop_progress(Rule, Super, NorMal, 2, SuperI, NorMalI)
    end;
drop_progress(Rule, Super, [], Flag, SuperI, NorMalI) ->
    drop_progress(Rule,
                  Super,
                  [],
                  Flag + 1,
                  SuperI,
                  NorMalI);
drop_progress(Rule = #{super_r := _Sratio,
                       first_r := Fratio, second_r := Seratio,
                       third_r := Tratio},
              Super, NorMal, Flag, SuperI, NorMalI) ->
    Ratio = case Flag of
                2 -> Fratio;
                3 -> Seratio;
                _ -> Tratio
            end,
    case util:rand(1, 10000) =< Ratio of
        true ->
            case util:rand_list(NorMal, ratio) of
                Db = #{item_id := ItemId, num := Num, bind := Bind,
                       notice := Notice}
                    when is_map(Db) ->
                    drop_progress(Rule,
                                  Super,
                                  NorMal,
                                  Flag + 1,
                                  SuperI,
                                  [{ItemId, Bind, Num, Notice} | NorMalI]);
                _ ->
                    drop_progress(Rule,
                                  Super,
                                  NorMal,
                                  Flag + 1,
                                  SuperI,
                                  NorMalI)
            end;
        false ->
            drop_progress(Rule,
                          Super,
                          NorMal,
                          Flag + 1,
                          SuperI,
                          NorMalI)
    end.

