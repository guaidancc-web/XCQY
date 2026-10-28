-file("src/mod/robot/robot_mgr.erl", 1).

-module(robot_mgr).

-behaviour(gen_server).

-export([update/1,
         levup_update/2,
         get_role/1,
         get_role_cross/1,
         get_base_role/1,
         get_looks_role/1,
         get_top_lev/0,
         start_link/0,
         get_role_index/2,
         get_role_index_list/1,
         get_role_all_fc/1,
         ver/1,
         get_world_max_fc/1,
         get_world_max_sub_fc/1,
         clear_robot/0]).

-export([init/1,
         handle_call/3,
         handle_cast/2,
         handle_info/2,
         terminate/2,
         code_change/3]).

-record(state, {}).

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

-file("src/mod/robot/robot_mgr.erl", 31).

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

-file("src/mod/robot/robot_mgr.erl", 32).

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

-file("src/mod/robot/robot_mgr.erl", 33).

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

-file("src/mod/robot/robot_mgr.erl", 34).

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

-file("src/mod/robot/robot_mgr.erl", 35).

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

-file("src/mod/robot/robot_mgr.erl", 36).

-file("inc/lev_break.hrl", 1).

-record(m_lev_break,
        {ver = 0,
         trial = 0 :: non_neg_integer(),
         done = 0 :: non_neg_integer(),
         times = 0 :: non_neg_integer(),
         attr_point = 0 :: non_neg_integer()}).

-file("src/mod/robot/robot_mgr.erl", 37).

-spec update(#role{} | #robot_role{}) -> ok.

update(#role{lev = Lev}) when Lev < 20 -> ok;
update(#role{s_event = 1}) -> ok;
update(Role = #role{}) ->
    {ok, Robot} = role_convert:to(robot_role, Role),
    update_fc(Role),
    update(Robot);
update(Robot = #robot_role{}) ->
    update_role_index(Robot),
    sync_robot(Robot, all);
update(_R) ->
    logger:error("非法参数: ~w", [_R], robot_mgr, 50),
    ok.

levup_update(#role{lev = Lev}, _) when Lev < 20 -> ok;
levup_update(Role = #role{}, OldLev) ->
    {ok, Robot} = role_convert:to(robot_role, Role),
    update_fc(Role),
    levup_role_index(Robot, OldLev),
    sync_robot(Robot, all),
    ok.

-spec get_role(role_id()) -> {ok, #robot_role{}} |
                             null |
                             false.

get_role(RoleId) ->
    case catch ets:lookup(robot_role, RoleId) of
        [R = #robot_role{}] -> {ok, R};
        _ ->
            case catch dets:lookup(robot_role, RoleId) of
                [R = #robot_role{}] -> {ok, R};
                [] -> null;
                _ -> false
            end
    end.

-spec get_base_role(role_id()) -> {ok, #robot_role{}} |
                                  null |
                                  false.

get_base_role(RoleId) ->
    case catch ets:lookup(robot_role, RoleId) of
        [R = #robot_role{}] -> {ok, R};
        [] -> null;
        _ -> false
    end.

-spec get_looks_role(role_id()) -> {ok, [term()]} |
                                   null |
                                   false.

get_looks_role(RoleId) ->
    case catch ets:lookup(robot_role, RoleId) of
        [#robot_role{looks = Looks}] -> {ok, Looks};
        [] -> null;
        _ -> false
    end.

update_fc(Role) ->
    Data = attr:calc_fc(Role),
    SubData = fc_update:calc_sub_fc(Role),
    gen_server:cast(robot_mgr, {update_fc, Data, SubData}).

get_world_max_fc(Role) ->
    Data = attr:calc_fc(Role),
    case env:get(max_world_fc) of
        [OH | OT] ->
            NewData = do_update_fc(Data, [OH | OT]),
            env:save(max_world_fc, NewData);
        _ -> env:save(max_world_fc, Data)
    end.

get_world_max_sub_fc(Role) ->
    Data = fc_update:calc_sub_fc(Role),
    case env:get(max_world_sub_fc) of
        [OH | OT] ->
            NewData = do_update_fc(Data, [OH | OT]),
            env:save(max_world_sub_fc, NewData);
        _ -> env:save(max_world_sub_fc, Data)
    end.

update_role_index(RobotRole) ->
    RobotRoleIndex = to_role_index(RobotRole),
    gen_server:cast(robot_mgr,
                    {update_role_index, RobotRoleIndex}).

levup_role_index(RobotRole, OldLev) ->
    RobotRoleIndex = to_role_index(RobotRole),
    gen_server:cast(robot_mgr,
                    {levup_role_index, RobotRoleIndex, OldLev}).

get_role_cross(RoleId = {_Id, Platform, ZoneId}) ->
    cross:call(Platform,
               ZoneId,
               robot_mgr,
               get_role,
               [RoleId]).

get_top_lev() ->
    case env:get(top_lev) of
        Lev when is_integer(Lev) -> Lev;
        _ -> 0
    end.

update_top_lev(Lev) ->
    case get_top_lev() < Lev of
        true -> env:set(top_lev, Lev);
        _ -> ok
    end.

get_role_all_fc(RoleId) ->
    case catch ets:lookup_element(robot_role,
                                  RoleId,
                                  #robot_role.all_fc)
        of
        AllFc when is_integer(AllFc) -> {ok, AllFc};
        _Err ->
            logger:error("获取个人战力时异常:~w", [_Err], robot_mgr, 155),
            false
    end.

get_role_index(by_lev, Lev) ->
    case catch ets:lookup(robot_role_index, Lev) of
        [{_Lev, DataRoles}] -> DataRoles;
        [] -> [];
        _Err ->
            logger:error("查询角色等级索引失败:~w", [_Err], robot_mgr, 165),
            []
    end.

get_role_index_list(LevList) ->
    get_role_index_list(LevList, []).

get_role_index_list([], DataRoles) -> DataRoles;
get_role_index_list([Lev | T], DataRoles) ->
    AddDataRoles = get_role_index(by_lev, Lev),
    get_role_index_list(T, AddDataRoles ++ DataRoles).

start_link() ->
    gen_server:start_link({local, robot_mgr},
                          robot_mgr,
                          [],
                          []).

init([]) ->
    logger:info("[~w] 正在启动...",
                [robot_mgr],
                robot_mgr,
                184),
    dets:open_file(robot_role,
                   [{file, "./dets/robot_role.dets"},
                    {keypos, #robot_role.id}]),
    ets:new(robot_role,
            [set, named_table, public, {keypos, #robot_role.id}]),
    ets:new(robot_role_index, [set, named_table, public]),
    case env:get(max_world_fc_version) of
        2 -> ok;
        _ ->
            env:del(max_world_fc),
            env:del(max_world_sub_fc),
            env:save(max_world_fc_version, 2)
    end,
    case load_data() of
        [] ->
            State = #state{},
            logger:info("[~w] 启动完成", [robot_mgr], robot_mgr, 200),
            {ok, State};
        _Err ->
            logger:error("离线数据加载:~w", [_Err], robot_mgr, 203),
            {stop, data_load_err}
    end.

handle_call(_Request, _From, State) -> {noreply, State}.

handle_cast({update_fc, [NH | NT], [SNH | SNT]},
            State) ->
    case env:get(max_world_fc) of
        [OH | OT] ->
            NewData = do_update_fc([NH | NT], [OH | OT]),
            env:save(max_world_fc, NewData);
        _ -> env:save(max_world_fc, [NH | NT])
    end,
    case env:get(max_world_sub_fc) of
        [OH1 | OT1] ->
            NewSubData = do_update_fc([SNH | SNT], [OH1 | OT1]),
            env:save(max_world_sub_fc, NewSubData);
        _ -> env:save(max_world_sub_fc, [SNH | SNT])
    end,
    {noreply, State};
handle_cast({update_role_index,
             RobotRoleIndex = #robot_role_index{id = RoleId,
                                                lev = Lev}},
            State) ->
    update_top_lev(Lev),
    case catch ets:lookup(robot_role_index, Lev) of
        [{Lev, DataRoles}] ->
            DataRoles1 = lists:keystore(RoleId,
                                        #robot_role_index.id,
                                        DataRoles,
                                        RobotRoleIndex),
            DataRoles2 = util:keys_sort([#robot_role_index.time],
                                        DataRoles1),
            NewDataRoles = lists:sublist(DataRoles2, 250),
            LevData = {Lev, NewDataRoles},
            ets:insert(robot_role_index, LevData),
            ok;
        [] ->
            LevData = {Lev, [RobotRoleIndex]},
            ets:insert(robot_role_index, LevData),
            ok;
        _Err ->
            logger:error("更新等级战力索引失败:~w", [_Err], robot_mgr, 245),
            ok
    end,
    {noreply, State};
handle_cast({levup_role_index,
             RobotRoleIndex = #robot_role_index{id = RoleId,
                                                lev = Lev},
             OldLev},
            State) ->
    update_top_lev(Lev),
    case catch ets:lookup(robot_role_index, OldLev) of
        [{OldLev, DataRoles1}] ->
            NewDataRoles1 = lists:keydelete(RoleId,
                                            #robot_role_index.id,
                                            DataRoles1),
            LevData1 = {OldLev, NewDataRoles1},
            ets:insert(robot_role_index, LevData1),
            ok;
        _ -> ok
    end,
    case catch ets:lookup(robot_role_index, Lev) of
        [{Lev, DataRoles2}] ->
            DataRoles3 = lists:keystore(RoleId,
                                        #robot_role_index.id,
                                        DataRoles2,
                                        RobotRoleIndex),
            DataRoles4 = util:keys_sort([#robot_role_index.time],
                                        DataRoles3),
            NewDataRoles2 = lists:sublist(DataRoles4, 250),
            LevData2 = {Lev, NewDataRoles2},
            ets:insert(robot_role_index, LevData2),
            ok;
        [] ->
            LevData3 = {Lev, [RobotRoleIndex]},
            ets:insert(robot_role_index, LevData3),
            ok;
        _Err ->
            logger:error("创建/更新等级战力索引失败:~w",
                         [_Err],
                         robot_mgr,
                         277),
            ok
    end,
    {noreply, State};
handle_cast(_Msg, State) -> {noreply, State}.

handle_info(_Info, State) -> {noreply, State}.

terminate(_Reason, _State) ->
    dets:close(robot_role),
    ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

sync_robot(Robot, ets) ->
    ets:insert(robot_role, Robot#robot_role{});
sync_robot(Robot, dets) ->
    dets:insert(robot_role, Robot);
sync_robot(Robot, _) ->
    sync_robot(Robot, ets),
    sync_robot(Robot, dets).

load_data() ->
    case dets:first(robot_role) of
        '$end_of_table' ->
            logger:info("离线数据没有数据需要加载", [], robot_mgr, 315),
            [];
        _ ->
            dets:traverse(robot_role,
                          fun (Robot) ->
                                  case ver(Robot) of
                                      false -> {done, false};
                                      {ok, Robot} ->
                                          init_load(Robot),
                                          continue;
                                      {ok, NewRobot} ->
                                          init_load(NewRobot),
                                          dets:insert(robot_role, NewRobot),
                                          continue
                                  end
                          end)
    end.

init_load(Robot = #robot_role{id = RoleId,
                              lev = Lev}) ->
    update_top_lev(Lev),
    RobotRoleIndex = to_role_index(Robot),
    case catch ets:lookup(robot_role_index, Lev) of
        [{Lev, DataRoles}] ->
            DataRoles1 = lists:keystore(RoleId,
                                        #robot_role_index.id,
                                        DataRoles,
                                        RobotRoleIndex),
            DataRoles2 = util:keys_sort([#robot_role_index.time],
                                        DataRoles1),
            NewDataRoles = lists:sublist(DataRoles2, 250),
            LevData = {Lev, NewDataRoles},
            ets:insert(robot_role_index, LevData),
            ok;
        [] ->
            LevData = {Lev, [RobotRoleIndex]},
            ets:insert(robot_role_index, LevData),
            ok;
        _Err ->
            logger:error("创建等级战力索引失败:~w", [_Err], robot_mgr, 355),
            ok
    end.

ver({robot_role,
     Ver = 1,
     RoleId,
     Name,
     Sex,
     Classes,
     Lev,
     Fc,
     Face,
     AiId,
     Skills,
     Talents,
     Pet,
     Guard,
     Slave,
     Attr,
     Looks,
     Time,
     MForm}) ->
    NewVer = Ver + 1,
    Cup = case Lev >= 20 of
              true ->
                  case arena_mgr:get_role_cup(RoleId) of
                      {ok, GetCup} -> GetCup;
                      _ -> 1000
                  end;
              false -> 1000
          end,
    PetFc = 3000,
    AllFc = Fc + PetFc,
    ver({robot_role,
         NewVer,
         RoleId,
         Name,
         Sex,
         Classes,
         Lev,
         Fc,
         Face,
         AiId,
         Skills,
         Talents,
         Pet,
         Guard,
         Slave,
         Attr,
         Looks,
         Time,
         MForm,
         PetFc,
         AllFc,
         Cup});
ver({robot_role,
     Ver = 2,
     RoleId,
     Name,
     Sex,
     Classes,
     Lev,
     Fc,
     Face,
     AiId,
     Skills,
     Talents,
     Pet,
     Guard,
     Slave,
     Attr,
     Looks,
     Time,
     MForm,
     PetFc,
     AllFc,
     Cup}) ->
    NewVer = Ver + 1,
    BackupPets = [],
    ver({robot_role,
         NewVer,
         RoleId,
         Name,
         Sex,
         Classes,
         Lev,
         Fc,
         Face,
         AiId,
         Skills,
         Talents,
         Pet,
         BackupPets,
         Guard,
         Slave,
         Attr,
         Looks,
         Time,
         MForm,
         PetFc,
         AllFc,
         Cup});
ver({robot_role,
     Ver = 3,
     RoleId,
     Name,
     Sex,
     Classes,
     Lev,
     Fc,
     Face,
     AiId,
     Skills,
     Talents,
     Pet,
     BackupPets,
     Guard,
     Slave,
     Attr,
     Looks,
     Time,
     MForm,
     PetFc,
     AllFc,
     Cup}) ->
    NewVer = Ver + 1,
    MLevBreak = #m_lev_break{},
    ver({robot_role,
         NewVer,
         RoleId,
         Name,
         Sex,
         Classes,
         Lev,
         Fc,
         Face,
         AiId,
         Skills,
         Talents,
         Pet,
         BackupPets,
         Guard,
         Slave,
         Attr,
         Looks,
         Time,
         MForm,
         PetFc,
         AllFc,
         Cup,
         MLevBreak});
ver(Robot = #robot_role{ver = 4}) ->
    ver_f([attr, pet, guard, backup_pets, looks], Robot);
ver(_Robot) -> false.

ver_f([], Robot = #robot_role{fc = Fc, pet = Pet}) ->
    PetFc = case Pet of
                #c_pet{talent = Talent} -> Talent;
                _ -> 0
            end,
    AllFc = Fc + PetFc,
    {ok, Robot#robot_role{pet_fc = PetFc, all_fc = AllFc}};
ver_f([Label | T], Robot) ->
    case do_ver_f(Label, Robot) of
        false -> false;
        {ok, NewRobot} -> ver_f(T, NewRobot)
    end.

do_ver_f(attr, Robot = #robot_role{attr = Attr}) ->
    case attr_ver:do(Attr) of
        {ok, NewAttr} -> {ok, Robot#robot_role{attr = NewAttr}};
        _ -> false
    end;
do_ver_f(looks, Robot = #robot_role{looks = Looks}) ->
    NewLooks = looks:check_looks(Looks),
    {ok, Robot#robot_role{looks = NewLooks}};
do_ver_f(guard, Robot = #robot_role{guard = Guard}) ->
    Guard1 = guard_list_ver(Guard),
    {ok, Robot#robot_role{guard = Guard1}};
do_ver_f(backup_pets,
         Robot = #robot_role{backup_pets = BackupPets}) ->
    BackupPets1 = pet_list_ver(BackupPets),
    {ok, Robot#robot_role{backup_pets = BackupPets1}};
do_ver_f(pet, Robot = #robot_role{pet = Pet}) ->
    Pet1 = ver_pet(Pet),
    Result = case Pet1 of
                 #c_pet{attr = Attr} ->
                     case attr_ver:do(Attr) of
                         {ok, NewAttr} -> {true, Pet1#c_pet{attr = NewAttr}};
                         _ -> false
                     end;
                 undefined -> {true, undefined};
                 _ -> false
             end,
    case Result of
        {true, NewPet} -> {ok, Robot#robot_role{pet = NewPet}};
        _ -> false
    end.

pet_list_ver(Pets) -> pet_list_ver(Pets, []).

pet_list_ver([], Pets) -> lists:reverse(Pets);
pet_list_ver([Pet | T], Pets) ->
    Pet1 = ver_pet(Pet),
    case Pet1 of
        #c_pet{attr = Attr} ->
            case attr_ver:do(Attr) of
                {ok, NewAttr} ->
                    Pet2 = Pet1#c_pet{attr = NewAttr},
                    pet_list_ver(T, [Pet2 | Pets]);
                _ -> pet_list_ver(T, Pets)
            end;
        _ -> pet_list_ver(T, Pets)
    end.

guard_list_ver(Guard) -> guard_list_ver(Guard, []).

guard_list_ver([], Guard) -> lists:reverse(Guard);
guard_list_ver([G | T], Guard) ->
    case guard_ver(G) of
        {ok, G1 = #c_guard{}} ->
            guard_list_ver(T, [G1 | Guard]);
        _ -> guard_list_ver(T, Guard)
    end.

guard_ver({c_guard,
           Base_id,
           War_id,
           Name,
           Classes,
           Skills,
           Attr}) ->
    guard_ver({c_guard,
               Base_id,
               War_id,
               Name,
               Classes,
               Skills,
               Attr,
               []});
guard_ver(G = #c_guard{attr = Attr}) ->
    case attr_ver:do(Attr) of
        {ok, NewAttr} -> {ok, G#c_guard{attr = NewAttr}};
        _ -> {ok, G#c_guard{attr = #attr{}}}
    end;
guard_ver(_) -> {false, lang:get("守护转换失败")}.

ver_pet({c_pet,
         Id,
         BaseId,
         CanSummon,
         Status,
         Name,
         Lev,
         Looks,
         Skills,
         Hp,
         Mp,
         Attr}) ->
    Ver = 1,
    CombatTalk = pet_effect:init_talk(BaseId),
    ver_pet({c_pet,
             Id,
             Ver,
             BaseId,
             CanSummon,
             Status,
             Name,
             Lev,
             Looks,
             Skills,
             Hp,
             Mp,
             Attr,
             CombatTalk});
ver_pet({c_pet,
         Id,
         Ver = 1,
         BaseId,
         CanSummon,
         Status,
         Name,
         Lev,
         Looks,
         Skills,
         Hp,
         Mp,
         Attr,
         CombatTalk}) ->
    NewVer = Ver + 1,
    Talent = round((6500 + calc_skill_talent(Skills)) / 3),
    ver_pet({c_pet,
             Id,
             NewVer,
             BaseId,
             CanSummon,
             Status,
             Name,
             Lev,
             Looks,
             Skills,
             Hp,
             Mp,
             Attr,
             CombatTalk,
             Talent});
ver_pet({c_pet,
         Id,
         Ver = 2,
         BaseId,
         CanSummon,
         Status,
         Name,
         Lev,
         Looks,
         Skills,
         Hp,
         Mp,
         Attr,
         CombatTalk,
         Talent}) ->
    NewVer = Ver + 1,
    PetAttr = undefined,
    ver_pet({c_pet,
             Id,
             NewVer,
             BaseId,
             CanSummon,
             Status,
             Name,
             Lev,
             Looks,
             Skills,
             Hp,
             Mp,
             Attr,
             CombatTalk,
             Talent,
             PetAttr});
ver_pet({c_pet,
         Id,
         Ver = 3,
         BaseId,
         CanSummon,
         Status,
         Name,
         Lev,
         Looks,
         Skills,
         Hp,
         Mp,
         Attr,
         CombatTalk,
         Talent,
         PetAttr}) ->
    NewVer = Ver + 1,
    Grade = 0,
    ver_pet({c_pet,
             Id,
             NewVer,
             BaseId,
             CanSummon,
             Status,
             Name,
             Lev,
             Looks,
             Skills,
             Hp,
             Mp,
             Attr,
             CombatTalk,
             Talent,
             PetAttr,
             Grade});
ver_pet({c_pet,
         Id,
         Ver = 4,
         BaseId,
         CanSummon,
         Status,
         Name,
         Lev,
         Looks,
         Skills,
         Hp,
         Mp,
         Attr,
         CombatTalk,
         Talent,
         PetAttr,
         Grade}) ->
    NewVer = Ver + 1,
    SkillPlan = [],
    ver_pet({c_pet,
             Id,
             NewVer,
             BaseId,
             CanSummon,
             Status,
             Name,
             Lev,
             Looks,
             Skills,
             Hp,
             Mp,
             Attr,
             CombatTalk,
             Talent,
             PetAttr,
             Grade,
             SkillPlan});
ver_pet({c_pet,
         Id,
         Ver = 5,
         BaseId,
         CanSummon,
         Status,
         Name,
         Lev,
         Looks,
         Skills,
         Hp,
         Mp,
         Attr,
         CombatTalk,
         Talent,
         PetAttr,
         Grade,
         SkillPlan}) ->
    NewVer = Ver + 1,
    IsFirst = 0,
    ver_pet({c_pet,
             Id,
             NewVer,
             BaseId,
             CanSummon,
             Status,
             Name,
             Lev,
             Looks,
             Skills,
             Hp,
             Mp,
             Attr,
             CombatTalk,
             Talent,
             PetAttr,
             Grade,
             SkillPlan,
             IsFirst});
ver_pet(CPet = #c_pet{ver = 6}) -> CPet;
ver_pet(undefined) -> undefined;
ver_pet(_CPet) ->
    logger:error("CPet版本转换失败:~w", [_CPet], robot_mgr, 503),
    undefined.

calc_skill_talent(Skills) ->
    Fun = fun ({Id, Lev}, Point) ->
                  case skill_data:get_pet({Id, Lev}) of
                      #pet_base_skill{step = Step} ->
                          case Step of
                              1 -> 300 + Point;
                              2 -> 600 + Point;
                              _ -> Point
                          end;
                      _ -> Point
                  end
          end,
    lists:foldl(Fun, 0, Skills).

to_role_index(#robot_role{lev = Lev, id = RoleId,
                          sex = Sex, classes = Classes, fc = Fc, time = Time,
                          pet_fc = PetFc, cup = Cup, all_fc = AllFc}) ->
    #robot_role_index{id = RoleId, sex = Sex,
                      classes = Classes, lev = Lev, fc = Fc, pet_fc = PetFc,
                      all_fc = AllFc, cup = Cup, time = Time}.

do_update_fc([], Fc) -> Fc;
do_update_fc([{Type, Val} | T], Fc) ->
    case lists:keyfind(Type, 1, Fc) of
        {_, Old} ->
            do_update_fc(T,
                         lists:keyreplace(Type, 1, Fc, {Type, max(Val, Old)}));
        _ -> do_update_fc(T, [{Type, Val} | Fc])
    end.

clear_robot() ->
    ClearTime = date:unixtime() - 90 * 86400,
    ClearFun = fun (#robot_role{id = Id, time = Time,
                                lev = Lev},
                    Rtn)
                       when Time < ClearTime andalso Lev =< 40 ->
                       [Id | Rtn];
                   (_, Rtn) -> Rtn
               end,
    RolrIds = dets:foldl(ClearFun, [], robot_role),
    [dets:delete(robot_role, Id) || Id <- RolrIds],
    ok.

