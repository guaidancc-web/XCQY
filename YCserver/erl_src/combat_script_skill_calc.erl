-file("src/mod/combat/combat_script_skill_calc.erl", 1).

-module(combat_script_skill_calc).

-export([attack/5,
         attack/6,
         heal/5,
         escape/5,
         defence/5,
         catch_pet/5,
         protect/5,
         cast/6,
         use_item/5,
         loss_coin/5,
         under_control_skill/2,
         under_weakness_skill/2,
         under_special_control_skill/2,
         is_anger_skill/1,
         is_anger_skill/2,
         suicide/5,
         summon_pet/5,
         summon_child/5,
         passive_activate/3,
         passive_activate/4,
         calc_cost/2,
         find_can_summon_pet/1,
         check_skill_act/1,
         assist_attack_play/5,
         calc_talisman_rival/3]).

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

-file("src/mod/combat/combat_script_skill_calc.erl",
      38).

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

-file("src/mod/combat/combat_script_skill_calc.erl",
      39).

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

-file("src/mod/combat/combat_script_skill_calc.erl",
      40).

-file("inc/skill.hrl", 1).

-record(m_skill,
        {ver = 6 :: pos_integer(),
         skills = [] :: [{non_neg_integer(), non_neg_integer()}],
         is_open_skl_prac = 0 :: 0 | 1,
         selected_skl_prac = 0 :: non_neg_integer(),
         skill_prac = [] :: list(),
         skill_couple = [] :: list(),
         skill_sworn = [] :: list(),
         speed = [] :: list(),
         skill_unique = [],
         skill_clsld_done = [],
         unique_coolddown_time = 0,
         skl_unique_point = 100,
         sq_double = 0,
         is_open_sq_double = 0,
         sq_exp_statistics = []}).

-record(role_base_skill,
        {id = 0,
         lev = 0,
         type :: undefined | non_neg_integer(),
         sub_type :: undefined | non_neg_integer(),
         max_lev = 0,
         name = "",
         way = 1,
         study_lev = 1,
         cost = [],
         attr = []}).

-record(skill,
        {id = 0,
         lev = 0,
         type = 0 :: non_neg_integer(),
         sub_type = 0 :: non_neg_integer(),
         speed = 1,
         name = "",
         acc_ratio = 1000,
         acc_low = 0,
         acc_high = 1000,
         attack_type = 0 :: non_neg_integer(),
         elem_type = 0 :: non_neg_integer(),
         target_type = 1 :: non_neg_integer(),
         attack_times = 1 :: non_neg_integer(),
         target_list = [],
         self_cond = [],
         self_loss = [],
         target_cond = [],
         dmg_addt = 0 :: non_neg_integer(),
         dmg_ratio = [1000] :: non_neg_integer(),
         pre_cooldown = 0,
         cooldown = 0 :: non_neg_integer(),
         cost_mp = 0 :: non_neg_integer(),
         cost_anger = 0,
         cost_other = [] :: [{atom(), non_neg_integer()}],
         buff_self = [] :: [tuple()],
         buff_target = [] :: [tuple()],
         script_id = 0 :: non_neg_integer(),
         script_args = [] :: [integer()],
         addt_scripts = [] ::
             [{non_neg_integer(), non_neg_integer(), list()}],
         play_time = 0 :: non_neg_integer()}).

-record(chief_classes,
        {leader_id = 0,
         classes = 0,
         name = "",
         sex = 0,
         lev = 0,
         looks = []}).

-record(sq_exp_statistics,
        {combat_type = 0, times = 0, gain = 0, real_gain = 0}).

-file("src/mod/combat/combat_script_skill_calc.erl",
      41).

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

-file("src/mod/combat/combat_script_skill_calc.erl",
      42).

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

-file("src/mod/combat/combat_script_skill_calc.erl",
      43).

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

-file("src/mod/combat/combat_script_skill_calc.erl",
      44).

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

-file("src/mod/combat/combat_script_skill_calc.erl",
      45).

-file("inc/child.hrl", 1).

-record(m_child,
        {ver = 1,
         kids = [] :: list(),
         fertility = 0 :: non_neg_integer(),
         tonic = 0 :: non_neg_integer(),
         hungry_notice_lev = []}).

-record(child_attr,
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
         max_aspd_aptitude = 0,
         study_str = 0,
         study_con = 0,
         study_mag = 0,
         study_agi = 0,
         study_end = 0}).

-record(child_study_plan,
        {ver = 1,
         is_init = 1,
         study_str_easy = 0,
         study_con_easy = 0,
         study_mag_easy = 0,
         study_agi_easy = 0,
         study_end_easy = 0,
         study_str_hard = 0,
         study_con_hard = 0,
         study_mag_hard = 0,
         study_agi_hard = 0,
         study_end_hard = 0,
         study_str_plan_easy = 0,
         study_con_plan_easy = 0,
         study_mag_plan_easy = 0,
         study_agi_plan_easy = 0,
         study_end_plan_easy = 0,
         study_str_plan_hard = 0,
         study_con_plan_hard = 0,
         study_mag_plan_hard = 0,
         study_agi_plan_hard = 0,
         study_end_plan_hard = 0}).

-record(child_base,
        {id = 0,
         name = "",
         classes,
         sex,
         hp_aptitude = 0,
         phy_aptitude = 0,
         pdef_aptitude = 0,
         magic_aptitude = 0,
         aspd_aptitude = 0,
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
         unit_id = 0,
         unit_id_1 = 0,
         unit_id_2 = 0,
         unit_id_3 = 0,
         classes_skills = []}).

-record(child,
        {id = {0, "", 0} :: tuple(),
         ver = 5,
         parents = [] :: list(),
         custody = {0, "", 0} :: tuple(),
         name = "" :: string(),
         base_id = 0,
         sex = 0 :: 0 | 1,
         classes = 0 :: non_neg_integer(),
         classes_type = 1,
         embryo = 1 :: non_neg_integer(),
         pregnant_time = 0 :: non_neg_integer(),
         birth_time = 0 :: non_neg_integer(),
         stage = 1 :: non_neg_integer(),
         status = 0,
         follow = {0, "", 0} :: tuple(),
         maturity = 0 :: non_neg_integer(),
         growth = 0 :: non_neg_integer(),
         ext_growth = 0,
         growth_type = 5 :: non_neg_integer(),
         lev = 1 :: non_neg_integer(),
         skills = [] :: list(),
         talent_skills = [],
         hungry = 100,
         add_point = 0,
         add_point_item = [],
         grade = 0,
         grade_attr = [],
         hp = 0,
         mp = 0,
         attr,
         looks = [],
         stones = [] :: list(),
         use_growth = 0,
         study_easy = 0,
         study_hard = 0,
         day_easy = 0,
         day_hard = 0,
         study_easy_time = 0,
         study_hard_time = 0,
         talent = 0,
         child_attr = #child_attr{},
         name_changed = 0 :: non_neg_integer(),
         last_name_changed = 0 :: non_neg_integer(),
         maturity_added_log = [] :: list(),
         last_added_maturity = 0 :: non_neg_integer(),
         handbook_attr = [],
         handbook_num = 0,
         star_handbook_num = 0,
         combat_talk = [],
         free_study = 0,
         study_plan = #child_study_plan{},
         spirit_attached = 0 :: 0 | 1,
         spirit_skills = [],
         spirit_info = [],
         child_skin = []}).

-record(child_parent,
        {id = {0, "", 0} :: tuple(),
         ver = 0,
         name = "" :: string(),
         sex = 0 :: 0 | 1,
         account = "",
         lev = 1,
         classes = 0 :: non_neg_integer(),
         looks = [] :: list(),
         intimacy = 0 :: non_neg_integer()}).

-record(child_base_skill,
        {id = 0,
         name = "",
         type = 0,
         step = 0,
         lev = 0,
         max_exp = 0,
         attr = []}).

-record(child_skill,
        {id = 0,
         lev = 1,
         step = 0,
         type = 0,
         source = 1,
         is_open = 1,
         exp = 1}).

-record(child_stone,
        {id = 0,
         type = 0,
         base_id = 0,
         role_id = {0, "", 0},
         attr = [],
         extra = [],
         reset_attr = []}).

-record(child_talent_skill,
        {id = 0, grade = 0, lev = 1, exp = 0}).

-record(child_rank, {type = 1, list = []}).

-record(child_rank_rc,
        {id = {0, "", 0} :: tuple(),
         rank = 1,
         ver = 0,
         father_id = {0, "", 0},
         father_name = "",
         father_classes = 0,
         father_sex = 0,
         mother_id = {0, "", 0},
         mother_name = "",
         mother_classes = 0,
         mother_sex = 0,
         custody = {0, "", 0} :: tuple(),
         name = "" :: string(),
         base_id = 0,
         sex = 0 :: 0 | 1,
         classes = 0 :: non_neg_integer(),
         classes_type = 1,
         lev = 1 :: non_neg_integer(),
         val1 = 0 :: non_neg_integer(),
         val2 = 0 :: non_neg_integer(),
         val3 = 0 :: non_neg_integer(),
         val4 = 0 :: non_neg_integer(),
         time = 0}).

-record(child_skin,
        {ver = 2,
         skin_id = 0,
         skin_active_flag = 0,
         expire_time = 0,
         timer_flag = 0}).

-file("src/mod/combat/combat_script_skill_calc.erl",
      46).

under_control_skill(_,
                    #c_skill{special_type = SpecialType}) ->
    case lists:member(under_control, SpecialType) of
        true -> true;
        false -> false
    end.

under_weakness_skill(_,
                     #c_skill{special_type = SpecialType}) ->
    case lists:member(under_weakness, SpecialType) of
        true -> true;
        false -> false
    end.

is_anger_skill(Self, CSkill = #c_skill{}) ->
    #c_skill{special_type = SpecialType} =
        combat_script_skill_ext:exec_trigger_before(CSkill,
                                                    Self,
                                                    #fighter{}),
    case lists:member(anger_skill, SpecialType) of
        true -> true;
        false -> false
    end.

is_anger_skill(#c_skill{special_type = SpecialType}) ->
    case lists:member(anger_skill, SpecialType) of
        true -> true;
        false -> false
    end.

under_special_control_skill(Self,
                            CSkill = #c_skill{special_type = SpecialType}) ->
    case lists:member(under_special_control, SpecialType) of
        true -> true;
        false ->
            case is_anger_skill(Self, CSkill) of
                true -> true;
                false -> false
            end
    end.

escape(Skill, Self, _Target, _SkillAddtArg,
       _ActionEffect) ->
    EscapeRate = case {Self, get(combat_type)} of
                     {#fighter{type = 1}, 18} -> 30;
                     _ -> 100
                 end,
    logger:debug("逃跑成功率是:~w",
                 [EscapeRate],
                 combat_script_skill_calc,
                 91),
    IsHit = case util:rand(1, 100) =< EscapeRate of
                true ->
                    combat_cache:u(Self, [{is_escape, 0, 1}]),
                    case combat_cache:f(by_master_id, Self#fighter.id) of
                        Pet = #fighter{type = 3} ->
                            combat_cache:u(Pet, [{is_escape, 0, 1}]);
                        Child = #fighter{type = 6} ->
                            combat_cache:u(Child, [{is_escape, 0, 1}]);
                        _ -> ignore
                    end,
                    1;
                false -> 0
            end,
    combat_pet:pet_talk(Self, 7),
    combat_child:child_talk(Self, 7),
    combat_fighter:unit_talk(Self, 7),
    combat_play:add_sub_play(combat_play:gen_sub_skill_play(escape,
                                                            {Self,
                                                             Skill,
                                                             IsHit})).

defence(Skill, Self, _Target, _SkillAddtArg,
        _ActionEffect) ->
    passive_activate(exec_defence,
                     Self,
                     _Target,
                     check_skill_act(Skill)),
    combat_cache:u(Self, [{is_defence, 0, 1}]),
    combat_play:add_sub_play(combat_play:gen_sub_skill_play(defence,
                                                            {Self, Skill})).

protect(_, #fighter{id = Id}, #fighter{id = Id}, _,
        _) ->
    ok;
protect(_, _Self = #fighter{id = Sid},
        _Target = #fighter{id = Tid}, _, _) ->
    combat_cache:u(Tid, [{protector, 0, {Sid, 2, 500}}]),
    ok.

loss_coin(Skill = #c_skill{}, #fighter{id = Sid},
          #fighter{id = Tid, pid = Pid, type = TargetType},
          SkillAddtArg, Ae) ->
    Self = combat_cache:f(by_id, Sid),
    Target = combat_cache:f(by_id, Tid),
    LossVal = combat_script_item:calc_loss_coin(),
    Result = case TargetType of
                 1 ->
                     case role:apply(sync,
                                     Pid,
                                     {combat_script_item,
                                      loss_assets,
                                      [LossVal]})
                         of
                         {true, GetVal} ->
                             Ae1 = Ae#action_effect{hit_ratio = 10000,
                                                    direct_dmg = 1},
                             Talk = case GetVal > 0 of
                                        true ->
                                            case util:rand(1, 3) of
                                                1 ->
                                                    notice:format(lang:get("拿你~ts银币点金{face_1,36}"),
                                                                  [{string_2,
                                                                    6,
                                                                    GetVal}]);
                                                2 ->
                                                    notice:format(lang:get("~ts银币点化成了金币{face_1,31}"),
                                                                  [{string_2,
                                                                    6,
                                                                    GetVal}]);
                                                _ ->
                                                    notice:format(lang:get("拿你~ts银币用用{face_1,36}"),
                                                                  [{string_2,
                                                                    6,
                                                                    GetVal}])
                                            end;
                                        _ -> lang:get("哎哟你真穷，一毛钱都没有")
                                    end,
                             Self1 = Self#fighter{talk = Talk},
                             combat_cache:u(Self1),
                             combat_cache:u(Sid, [{ext, 1, {1, GetVal}}]),
                             attack(Skill, Self1, Target, SkillAddtArg, Ae1),
                             true;
                         _ -> {false, lang:get("哎哟，失手了没偷到")}
                     end;
                 _ -> {false, lang:get("哎哟哟你藏哪里了")}
             end,
    case Result of
        {false, ActMsg} ->
            NewSkill = combat_script_skill:to_combat_skill({1005,
                                                            1}),
            NewSelf = Self#fighter{talk = ActMsg},
            combat_play:add_sub_play(combat_play:gen_sub_skill_play(wait,
                                                                    {NewSelf,
                                                                     NewSkill}));
        _ -> ok
    end.

use_item(#c_skill{ext_args = [{item_id, Citem}]},
         #fighter{id = Sid, pid = Pid, lev = Lev,
                  has_use_item = HasUseItem, type = Type,
                  master_fid = MasterFid},
         #fighter{id = Tid}, _, _) ->
    Self = combat_cache:f(by_id, Sid),
    Target = combat_cache:f(by_id, Tid),
    Result = case Type of
                 3 ->
                     case combat_cache:f(by_id, MasterFid) of
                         #fighter{has_use_item = MasterHasItem,
                                  pid = MasterPid} ->
                             {MasterPid, MasterHasItem};
                         _ -> {undefined, []}
                     end;
                 6 ->
                     case combat_cache:f(by_id, MasterFid) of
                         #fighter{has_use_item = MasterHasItem,
                                  pid = MasterPid} ->
                             {MasterPid, MasterHasItem};
                         _ -> {undefined, []}
                     end;
                 _ -> {Pid, HasUseItem}
             end,
    Result1 = case Result of
                  {_CheckPid, UseItem} when UseItem >= 10 ->
                      {false, lang:get("该场战斗使用物品已达上限")};
                  {CheckPid, _} when is_pid(CheckPid) ->
                      case role:apply(sync,
                                      CheckPid,
                                      {combat_script_item, loss_item, [Citem]})
                          of
                          {true,
                           #c_item{base_id = ItemBaseId, action = Action,
                                   script_args = Args, step = Step}}
                              when Action =/= undefined ->
                              [CombatType] =
                                  combat_cache:get_context_elem([#combat_context.type]),
                              NewLev = case Type =:= 3 orelse Type =:= 6 of
                                           true ->
                                               case combat_cache:f(by_id,
                                                                   MasterFid)
                                                   of
                                                   #fighter{lev = RoleLev} ->
                                                       RoleLev;
                                                   _ -> Lev
                                               end;
                                           _ -> Lev
                                       end,
                              NewArgs = case CombatType =:= 110 orelse
                                                 CombatType =:= 111
                                            of
                                            true ->
                                                case Step > NewLev of
                                                    true ->
                                                        case
                                                            skill_life_data:get_combat({ItemBaseId,
                                                                                        NewLev})
                                                            of
                                                            #{args :=
                                                                  LevArgs} ->
                                                                LevArgs;
                                                            _ -> Args
                                                        end;
                                                    _ -> Args
                                                end;
                                            _ -> Args
                                        end,
                              combat_util:run(Action,
                                              [Citem#c_item{script_args =
                                                                NewArgs},
                                               Self,
                                               Target]),
                              true;
                          {true, _} -> {false, lang:get("无法使用的道具")};
                          {false, Reason} -> {false, Reason};
                          _ -> {false, lang:get("无法扣除道具，使用失败")}
                      end;
                  _ -> {false, lang:get("无法扣除道具，使用失败")}
              end,
    case Result1 of
        {false, ActMsg} ->
            NewSkill = combat_script_skill:to_combat_skill({1005,
                                                            1}),
            NewSkill1 = NewSkill#c_skill{action_msg = ActMsg},
            combat_play:add_sub_play(combat_play:gen_sub_skill_play(wait,
                                                                    {Self,
                                                                     NewSkill1}));
        _ -> ok
    end;
use_item(_, _, _, _, _) -> ok.

catch_pet(Skill = #c_skill{},
          Self = #fighter{id = Sid, name = _Sname, type = Type},
          Target = #fighter{id = Tid, name = _Tname},
          _SkillAddtArg, _ActionEffect) ->
    case pet:can_catch(Self, Target) of
        {true, {PetBaseId, Genre, Ratio}} ->
            case util:rand(1, 1000) =< Ratio of
                _ when Type == 2 ->
                    CatchPlay = combat_play:gen_sub_skill_play(catch_pet,
                                                               {Self,
                                                                Target,
                                                                Skill,
                                                                0,
                                                                0}),
                    combat_play:add_sub_play(CatchPlay);
                true ->
                    ExtL = [{catched, 1, {PetBaseId, Genre}}],
                    combat_cache:u(Sid, ExtL),
                    combat_cache:u(Tid, [{hp, 0, 0}]),
                    CatchPlay = combat_play:gen_sub_skill_play(catch_pet,
                                                               {Self,
                                                                Target,
                                                                Skill,
                                                                1,
                                                                1}),
                    combat_play:add_sub_play(CatchPlay);
                false ->
                    CatchPlay = combat_play:gen_sub_skill_play(catch_pet,
                                                               {Self,
                                                                Target,
                                                                Skill,
                                                                0,
                                                                0}),
                    combat_play:add_sub_play(CatchPlay)
            end;
        _ -> ok
    end.

suicide(_Skill = #c_skill{skill =
                              #skill{buff_target = BuffTarget}},
        Self = #fighter{}, Target = #fighter{}, _SkillAddtArg,
        _Ae) ->
    combat_cache:u(Self#fighter{hp = 0, is_die = 1}),
    lists:foreach(fun (Buff) ->
                          combat_buff:buff_add(Buff, Self, Target)
                  end,
                  BuffTarget),
    combat_play:add_sub_play(combat_play:gen_sub_skill_play(suicide,
                                                            {Self})),
    ok;
suicide(_Skill, _Self, _Target, _SkillAddtArg, _Ae) ->
    ok.

summon_pet(_Skill = #c_skill{ext_args = ExtArgs},
           #fighter{name = _Name, pid = Spid}, _Target, _Sadt,
           _Ae) ->
    PetId = case lists:keyfind(pet_id, 1, ExtArgs) of
                {pet_id, SmnPetId} -> SmnPetId;
                false -> false
            end,
    case combat_cache:f(by_pid, Spid) of
        Self = #fighter{backup_pets = BackUpPets} ->
            case lists:keyfind(PetId, #c_pet.id, BackUpPets) of
                #c_pet{can_summon = 0} ->
                    notice:send({pid, Spid}, 1, lang:get("已经出战过的宠物不能再次出战"));
                #c_pet{} -> do_summon_pet(Self, PetId);
                false ->
                    case find_can_summon_pet(Self) of
                        {false, _R} -> ok;
                        {true, BeSmnPetId} -> do_summon_pet(Self, BeSmnPetId)
                    end
            end;
        _ -> skip
    end,
    ok.

find_can_summon_pet(#fighter{backup_pets = BackUpPets,
                             has_summon_pet = HasSummonPet}) ->
    case HasSummonPet >= 4 of
        true -> {false, lang:get("您出战的宠物个数已经达到上限")};
        false ->
            PartitionFun = fun (#c_pet{can_summon = Can}) ->
                                   Can =:= 1;
                               (_) -> false
                           end,
            {CanSummonPets, _} = lists:partition(PartitionFun,
                                                 BackUpPets),
            SortFun = fun (Elm1, Elm2) ->
                              Elm1#c_pet.lev > Elm2#c_pet.lev
                      end,
            case lists:sort(SortFun, CanSummonPets) of
                [MaxLevPet | _] -> {true, MaxLevPet#c_pet.id};
                [] -> {false, lang:get("没有可以进行召唤的宠物")}
            end
    end.

do_summon_pet(Self = #fighter{id = Sid, pid = Spid,
                              active_pet = ActivePet, backup_pets = BackUpPets,
                              active_child = ActiveChild,
                              backup_childs = BackUpChilds},
              PetId) ->
    case lists:keyfind(PetId, #c_pet.id, BackUpPets) of
        #c_pet{can_summon = 0} ->
            notice:send({pid, Spid}, 1, lang:get("已经出战过的宠物不能再次出战"));
        NewCpet = #c_pet{lev = PetLev, hp = Hp} ->
            BackUpPets1 = lists:keydelete(PetId,
                                          #c_pet.id,
                                          BackUpPets),
            NewBackUpPets = case ActivePet of
                                #c_pet{} ->
                                    ActivePet1 = ActivePet#c_pet{can_summon =
                                                                     0},
                                    [ActivePet1 | BackUpPets1];
                                _ -> BackUpPets1
                            end,
            NewBackUpChilds = case ActiveChild of
                                  #c_child{} ->
                                      ActiveChild1 =
                                          ActiveChild#c_child{can_summon = 0},
                                      [ActiveChild1 | BackUpChilds];
                                  _ -> BackUpChilds
                              end,
            [Round, Type] =
                combat_cache:get_context_elem([#combat_context.round,
                                               #combat_context.type]),
            {NeedReduce, ActionMsg} = case (Type =:= 40 orelse
                                                Type =:= 58)
                                               andalso Round >= 12
                                          of
                                          true ->
                                              MaxHp = PetLev * 150,
                                              case Hp >= MaxHp of
                                                  true -> {0, ""};
                                                  false ->
                                                      {1,
                                                       lang:get("当前回合数超过≥12，新召宠物生命值有所降低")}
                                              end;
                                          _ -> {0, ""}
                                      end,
            combat_cache:u(Sid,
                           [{active_pet, 0, NewCpet},
                            {active_child, 0, undefined},
                            {backup_childs, 0, NewBackUpChilds},
                            {backup_pets, 0, NewBackUpPets},
                            {has_summon_pet, 1, 1}]),
            combat_play:add_sub_play(combat_play:gen_sub_skill_play(summon_pet,
                                                                    {Self,
                                                                     ActionMsg})),
            Order = combat_play:get_order(),
            SubOrder = combat_play:get_sub_order(),
            SummonPetList = combat_pet:switch_pet(Self,
                                                  NewCpet,
                                                  NeedReduce),
            combat_play:commit_sub_play(),
            {Summons, SubFlag} =
                combat_pet:enter_war(SummonPetList),
            SummonPlay = combat_play:gen_sub_summon_play(0,
                                                         Self,
                                                         Summons),
            combat_play:add_sub_play(SummonPlay, Order, SubOrder),
            case SubFlag of
                1 -> combat_play:commit_sub_play();
                _ -> skip
            end,
            combat_stat:update_cast_pet(Self),
            ok;
        false -> notice:send({pid, Spid}, 1, lang:get("找不到宠物"))
    end,
    ok.

summon_child(_Skill = #c_skill{ext_args = ExtArgs},
             #fighter{name = _Name, pid = Spid, type = FighterType},
             _Target, _Sadt, _Ae) ->
    ChildId = case lists:keyfind(child_id, 1, ExtArgs) of
                  {_, SmnChildId} -> SmnChildId;
                  false -> false
              end,
    case combat_cache:f(by_pid, Spid) of
        Self = #fighter{backup_childs = BackUpChilds} ->
            case lists:keyfind(ChildId, #c_child.id, BackUpChilds)
                of
                #c_child{can_summon = 0} ->
                    notice:send({pid, Spid}, 1, lang:get("已经出战过的孩子不能再次出战"));
                #c_child{hungry = Hungry} ->
                    SummonRate = case child_data:get_happiness(Hungry) of
                                     {_, 0, _} -> 1000;
                                     {_, 1, _SummonRate} -> _SummonRate
                                 end,
                    case util:rand(1, 1000) =< SummonRate of
                        true -> do_summon_child(Self, ChildId);
                        false ->
                            case FighterType of
                                1 ->
                                    Msg = lang:get("您的孩子垂头丧气的，不肯出战！"),
                                    notice:send({pid, Spid}, 3, Msg);
                                _ -> ok
                            end
                    end;
                false -> ok
            end;
        _ -> skip
    end,
    ok.

do_summon_child(Self = #fighter{id = Sid, pid = Spid,
                                active_child = ActiveChild,
                                backup_childs = BackUpChilds,
                                active_pet = ActivePet,
                                backup_pets = BackUpPets},
                ChildId) ->
    case lists:keyfind(ChildId, #c_child.id, BackUpChilds)
        of
        #c_child{can_summon = 0} ->
            notice:send({pid, Spid}, 1, lang:get("已经出战过的孩子不能再次出战"));
        NewCchild = #c_child{lev = ChildLev, hp = Hp} ->
            BackUpChilds1 = lists:keydelete(ChildId,
                                            #c_child.id,
                                            BackUpChilds),
            NewBackUpChilds = case ActiveChild of
                                  #c_child{} ->
                                      ActiveChild1 =
                                          ActiveChild#c_child{can_summon = 0},
                                      [ActiveChild1 | BackUpChilds1];
                                  _ -> BackUpChilds1
                              end,
            NewBackUpPets = case ActivePet of
                                #c_pet{} ->
                                    ActivePet1 = ActivePet#c_pet{can_summon =
                                                                     0},
                                    [ActivePet1 | BackUpPets];
                                _ -> BackUpPets
                            end,
            [Round, Type] =
                combat_cache:get_context_elem([#combat_context.round,
                                               #combat_context.type]),
            {NeedReduce, ActionMsg} = case (Type =:= 40 orelse
                                                Type =:= 58)
                                               andalso Round >= 12
                                          of
                                          true ->
                                              MaxHp = ChildLev * 150,
                                              case Hp >= MaxHp of
                                                  true -> {0, ""};
                                                  false ->
                                                      {1,
                                                       lang:get("当前回合数超过≥12，新召孩子生命值有所降低")}
                                              end;
                                          _ -> {0, ""}
                                      end,
            combat_cache:u(Sid,
                           [{active_child, 0, NewCchild},
                            {active_pet, 0, undefined},
                            {backup_pets, 0, NewBackUpPets},
                            {backup_childs, 0, NewBackUpChilds},
                            {has_summon_pet, 1, 1}]),
            combat_play:add_sub_play(combat_play:gen_sub_skill_play(summon_pet,
                                                                    {Self,
                                                                     ActionMsg})),
            Order = combat_play:get_order(),
            SubOrder = combat_play:get_sub_order(),
            SummonChildList = combat_child:switch_child(Self,
                                                        NewCchild,
                                                        NeedReduce),
            combat_play:commit_sub_play(),
            {Summons, SubFlag} =
                combat_child:enter_war(SummonChildList),
            SummonPlay = combat_play:gen_sub_summon_play(0,
                                                         Self,
                                                         Summons),
            combat_play:add_sub_play(SummonPlay, Order, SubOrder),
            case SubFlag of
                1 -> combat_play:commit_sub_play();
                _ -> skip
            end,
            combat_stat:update_cast_pet(Self),
            ok;
        false -> notice:send({pid, Spid}, 1, lang:get("找不到孩子"))
    end,
    ok.

heal(Skill = #c_skill{special_type = SpecialType,
                      reduce_heal = ReduceHeal,
                      skill =
                          #skill{buff_target = BuffTarget,
                                 target_type = SkillTargetType}},
     Self = #fighter{id = Sid, name = _Sname,
                     attr =
                         #attr{heal_ratio = SHealRatio, heal_val = HealVal},
                     combat_init_attr = SCombatInitAttr,
                     combat_dynamic_attr = SCombatDynamicAttr},
     Target = #fighter{id = Tid, name = _Tname, type = TType,
                       attr = #attr{eff_heal_ratio = TEffhealRatio},
                       combat_init_attr = TCombatInitAttr,
                       combat_dynamic_attr = TCombatDynamicAttr,
                       special_status =
                           #special_status{is_anti_heal = IsAntiHeal},
                       special_attr = #special_attr{hp_link = HpLink},
                       master_fid = MasterFid},
     #c_skill_addt_arg{self_changed = SelfChanges00,
                       self_val_changed = SelfValChanges00,
                       target_changed = TargetChanges00,
                       target_val_changed = TargetValChanges00,
                       target_buff = TargetBuff,
                       show_passive_skills = TargetPassive,
                       ext_args = ExtArgs},
     #action_effect{heal_hp = HealHp,
                    can_anti_heal = CanAntiHeal}) ->
    HealRatio = SCombatInitAttr#combat_init_attr.heal_ratio
                    + SCombatDynamicAttr#combat_dynamic_attr.heal_ratio
                    + SHealRatio,
    EffHealRatio =
        TCombatInitAttr#combat_init_attr.eff_heal_ratio +
            TCombatDynamicAttr#combat_dynamic_attr.eff_heal_ratio
            + TEffhealRatio,
    HealCritRatio =
        SCombatInitAttr#combat_init_attr.heal_crit_ratio,
    Pe = #passive_effect{},
    {SelfValChanges11, SelfChanges11} = calc_cost(Skill,
                                                  Self),
    {SelfValChanges22, SelfChanges22} = calc_changes(self,
                                                     Skill,
                                                     Pe,
                                                     Self),
    SelfValChanges = SelfValChanges00 ++
                         SelfValChanges11 ++ SelfValChanges22,
    SelfChanges = SelfChanges00 ++
                      SelfChanges11 ++ SelfChanges22,
    #passive_effect{heal_ratio = PassiveHealRatio} =
        passive_activate(heal,
                         Self,
                         Target,
                         check_skill_act(Skill)),
    HasEffect = case lists:member(anger_skill, SpecialType)
                    of
                    true -> true;
                    _ ->
                        case ExtArgs of
                            [{anti_heal_ratio, 1}] -> true;
                            _ -> false
                        end
                end,
    HealHp0 = round(HealHp *
                        (HealRatio + PassiveHealRatio + 1000)
                        / 1000),
    HealHp1 = round(HealHp0 * (EffHealRatio + 1000) / 1000),
    NewHealHp1 = case HasEffect of
                     true -> HealHp;
                     _ -> HealHp1
                 end,
    HealHp2 = case HasEffect of
                  true -> NewHealHp1;
                  _ -> round(NewHealHp1 * ReduceHeal / 1000)
              end,
    CritResult = case util:rand(1, 1000) =< HealCritRatio
                          andalso lists:member(heal_crit, SpecialType) =:= true
                     of
                     true -> 1;
                     false -> 0
                 end,
    NewHealVal = case SkillTargetType of
                     6 -> 0;
                     _ ->
                         case HasEffect of
                             true -> 0;
                             _ ->
                                 HealVal +
                                     TCombatDynamicAttr#combat_dynamic_attr.eff_heal_val
                         end
                 end,
    NewHealVal1 = round(NewHealVal *
                            (HealRatio + PassiveHealRatio + 1000)
                            / 1000),
    HealHp3 = round(HealHp2 +
                        NewHealVal1 * ReduceHeal / 1000),
    HealHp4 = case CritResult of
                  1 -> round(1500 * HealHp3 / 1000);
                  0 -> HealHp3
              end,
    ok,
    TargetValChanges = case IsAntiHeal =:= 1 andalso
                                CanAntiHeal =:= 1
                           of
                           true -> TargetValChanges00;
                           false -> TargetValChanges00 ++ [{hp, 1, HealHp4}]
                       end,
    TargetChanges = case IsAntiHeal =:= 1 andalso
                             CanAntiHeal =:= 1
                        of
                        true -> TargetChanges00;
                        false -> TargetChanges00 ++ [{0, HealHp4, 0}]
                    end,
    combat_cache:u(Sid, SelfValChanges),
    combat_cache:u(Tid, TargetValChanges),
    combat_stat:update_total_heal(Sid, HealHp4),
    passive_activate(eff_heal,
                     Self,
                     Target,
                     check_skill_act(Skill#c_skill{ext_args =
                                                       [{heal_val, HealHp4}]})),
    lists:foreach(fun (Buff) ->
                          combat_buff:buff_add(Buff, Self, Target)
                  end,
                  BuffTarget),
    lists:foreach(fun (Buff) ->
                          combat_buff:buff_add(Buff, Target, Target)
                  end,
                  TargetBuff),
    combat_play:add_sub_play(combat_play:gen_sub_skill_play(attack,
                                                            {Self,
                                                             Target,
                                                             Skill,
                                                             SelfChanges,
                                                             TargetChanges,
                                                             1,
                                                             CritResult,
                                                             0,
                                                             0,
                                                             TargetPassive})),
    {LinkFighter, HpLinkRatio} = case TType of
                                     3 ->
                                         case combat_cache:f(by_id, MasterFid)
                                             of
                                             Master = #fighter{is_escape = 0,
                                                               is_die = 0}
                                                 when HpLink > 0 ->
                                                 {Master, HpLink};
                                             _ -> {undefined, 0}
                                         end;
                                     _ ->
                                         case combat_cache:f(by_master_id, Tid)
                                             of
                                             Pet = #fighter{is_escape = 0,
                                                            is_die = 0,
                                                            special_attr =
                                                                #special_attr{hp_link
                                                                                  =
                                                                                  PetHpLink}}
                                                 when PetHpLink > 0 ->
                                                 {Pet, PetHpLink};
                                             _ -> {undefined, 0}
                                         end
                                 end,
    case IsAntiHeal =:= 1 andalso CanAntiHeal =:= 1 of
        true -> ok;
        false ->
            case LinkFighter of
                #fighter{id = LinkId} ->
                    HealHp5 = round(HealHp4 * HpLinkRatio / 1000),
                    LinkValChanges = [{hp, 1, HealHp5}],
                    LinkChanges = [{0, HealHp5, 0}],
                    combat_cache:u(LinkId, LinkValChanges),
                    combat_play:add_sub_play(combat_play:gen_sub_skill_play(attack,
                                                                            {Self,
                                                                             LinkFighter,
                                                                             Skill,
                                                                             [],
                                                                             LinkChanges,
                                                                             1,
                                                                             CritResult,
                                                                             0,
                                                                             0,
                                                                             []}));
                _ -> ok
            end
    end,
    ok.

cast(ActionType,
     Skill = #c_skill{id = _SkillId,
                      skill = #skill{buff_target = BuffTarget}},
     Self = #fighter{id = Sid, name = _Sname,
                     group = Sgroup},
     Target = #fighter{id = Tid, name = _Tname,
                       group = Tgroup},
     #c_skill_addt_arg{self_val_changed = Svc,
                       self_changed = Sc, target_val_changed = Tvc,
                       target_changed = Tc},
     Ae = #action_effect{}) ->
    Pe = #passive_effect{},
    case Sgroup =:= Tgroup of
        true ->
            {SelfValChanges11, SelfChanges11} = calc_cost(Skill,
                                                          Self),
            {SelfValChanges22, SelfChanges22} = calc_changes(self,
                                                             Skill,
                                                             Pe,
                                                             Self),
            SelfValChanges = Svc ++
                                 SelfValChanges11 ++ SelfValChanges22,
            SelfChanges = Sc ++ SelfChanges11 ++ SelfChanges22,
            combat_cache:u(Sid, SelfValChanges),
            combat_cache:u(Tid, Tvc),
            lists:foreach(fun (Buff) ->
                                  combat_buff:buff_add(Buff, Self, Target)
                          end,
                          BuffTarget),
            combat_play:add_sub_play(combat_play:gen_sub_skill_play(ActionType,
                                                                    {Self,
                                                                     Target,
                                                                     Skill,
                                                                     SelfChanges,
                                                                     Tc,
                                                                     1,
                                                                     0,
                                                                     0,
                                                                     0,
                                                                     [],
                                                                     0}));
        false ->
            case is_hit(Skill, Self, Target, Ae) of
                true ->
                    {SelfValChanges11, SelfChanges11} = calc_cost(Skill,
                                                                  Self),
                    {SelfValChanges22, SelfChanges22} = calc_changes(self,
                                                                     Skill,
                                                                     Pe,
                                                                     Self),
                    SelfValChanges = Svc ++
                                         SelfValChanges11 ++ SelfValChanges22,
                    SelfChanges = Sc ++ SelfChanges11 ++ SelfChanges22,
                    combat_cache:u(Sid, SelfValChanges),
                    combat_cache:u(Tid, Tvc),
                    lists:foreach(fun (Buff) ->
                                          combat_buff:buff_add(Buff,
                                                               Self,
                                                               Target)
                                  end,
                                  BuffTarget),
                    combat_play:add_sub_play(combat_play:gen_sub_skill_play(ActionType,
                                                                            {Self,
                                                                             Target,
                                                                             Skill,
                                                                             SelfChanges,
                                                                             Tc,
                                                                             1,
                                                                             0,
                                                                             0,
                                                                             0,
                                                                             [],
                                                                             0}));
                false ->
                    {SelfValChanges11, SelfChanges11} = calc_cost(Skill,
                                                                  Self),
                    {SelfValChanges22, SelfChanges22} = calc_changes(self,
                                                                     Skill,
                                                                     Pe,
                                                                     Self),
                    SelfValChanges = SelfValChanges11 ++ SelfValChanges22,
                    SelfChanges = SelfChanges11 ++ SelfChanges22,
                    combat_cache:u(Sid, SelfValChanges),
                    combat_play:add_sub_play(combat_play:gen_sub_skill_play(ActionType,
                                                                            {Self,
                                                                             Target,
                                                                             Skill,
                                                                             SelfChanges,
                                                                             Tc,
                                                                             0,
                                                                             0,
                                                                             0,
                                                                             0,
                                                                             [],
                                                                             0}))
            end
    end.

calc_changes(self,
             Skill = #c_skill{action_no = ActionNo,
                              target_no = TargetNo},
             #passive_effect{self_val_changed = Svc,
                             self_changed = Sc},
             Self)
    when ActionNo =< 1 andalso TargetNo =< 1 ->
    {SelfAngerValChange, SelfAngerChange} =
        calc_self_anger(Skill, Self),
    {Svc ++ SelfAngerValChange, Sc ++ SelfAngerChange};
calc_changes(_, _, _, _) -> {[], []}.

calc_cost(Skill = #c_skill{action_no = ActionNo,
                           target_no = TargetNo},
          Self)
    when ActionNo =< 1 andalso TargetNo =< 1 ->
    do_calc_cost(Skill, Self);
calc_cost(_, _) -> {[], []}.

do_calc_cost(#c_skill{skill =
                          #skill{cost_mp = CostMp, cost_anger = CostAnger,
                                 cost_other = CostOther, self_loss = SelfLoss}},
             Self = #fighter{name = _SName,
                             cost_mp_ratio = CostMpRatio,
                             combat_init_attr =
                                 #combat_init_attr{use_anger_ratio =
                                                       CostAngerRatio}}) ->
    CostMp1 = round(CostMp * CostMpRatio / 1000),
    CostAnger1 = round(CostAnger * CostAngerRatio / 1000),
    {Svc11, Sc11} = calc_cost_other(CostOther, Self),
    {Svc22, Sc22} = calc_self_loss(SelfLoss, Self),
    Svc33 = [{mp, 1, -CostMp1}],
    Sc33 = [{1, -CostMp1, 0}],
    {Svc44, Sc44} = case CostAnger1 > 0 of
                        true ->
                            {[{anger, 1, -CostAnger1}], [{9, -CostAnger1, 0}]};
                        _ -> {[], []}
                    end,
    {Svc11 ++ Svc22 ++ Svc33 ++ Svc44,
     Sc11 ++ Sc22 ++ Sc33 ++ Sc44};
do_calc_cost(_, _) -> {[], []}.

calc_cost_other(CostOther, Self) ->
    calc_cost_other(CostOther, Self, [], []).

calc_cost_other([], _, Svc, Sc) -> {Svc, Sc};
calc_cost_other([R | T], Self, Svc, Sc) ->
    logger:error("暂时不支持这种消耗:~w",
                 [R],
                 combat_script_skill_calc,
                 639),
    calc_cost_other(T, Self, Svc, Sc).

calc_self_loss(SelfLoss, Self) ->
    calc_self_loss(SelfLoss, Self, [], []).

calc_self_loss([], _Self, Svc, Sc) -> {Svc, Sc};
calc_self_loss([{hp, Val} | T], Self, Svc, Sc) ->
    Svc1 = [{hp, 1, -Val} | Svc],
    Sc1 = [{0, -Val, 0} | Sc],
    calc_self_loss(T, Self, Svc1, Sc1);
calc_self_loss([{hp_ratio, Val} | T],
               Self = #fighter{hp_max = HpMax}, Svc, Sc) ->
    Val1 = round(HpMax * Val / 1000),
    Svc1 = [{hp, 1, -Val1} | Svc],
    Sc1 = [{0, -Val1, 0} | Sc],
    calc_self_loss(T, Self, Svc1, Sc1);
calc_self_loss([{tmp_hp_max, Val} | T],
               Self = #fighter{hp_max = HpMax}, Svc, Sc) ->
    logger:debug("扣除血量上限",
                 [],
                 combat_script_skill_calc,
                 656),
    Val1 = round(HpMax * Val / 1000),
    Svc1 = [{tmp_hp_max, 1, -Val1} | Svc],
    Sc1 = [{13, -Val1, 0} | Sc],
    calc_self_loss(T, Self, Svc1, Sc1);
calc_self_loss([{hp_ratio_2, Val} | T],
               Self = #fighter{hp = Hp, hp_max = HpMax}, Svc, Sc) ->
    Hp2 = round(HpMax * Val / 1000),
    case Hp > Hp2 of
        true ->
            Svc1 = [{hp, 0, Hp2} | Svc],
            Sc1 = [{0, -(Hp - Hp2), 0} | Sc],
            calc_self_loss(T, Self, Svc1, Sc1);
        false -> calc_self_loss(T, Self, Svc, Sc)
    end;
calc_self_loss([{mp_2, Val} | T],
               Self = #fighter{mp = Mp}, Svc, Sc) ->
    Svc1 = [{mp, 0, Val} | Svc],
    Sc1 = [{1, -(Mp - Val), 0} | Sc],
    calc_self_loss(T, Self, Svc1, Sc1);
calc_self_loss([{wing_power, _Val} | T], Self, Svc,
               Sc) ->
    Val = combat_skill:get_wing_power_by_combat_type(),
    Svc1 = [{fighter_ext_wing_power, 1, -Val} | Svc],
    OldVal = combat_cache:get_ext_val(Self, 8, 0),
    Sc1 = [{14, max(OldVal - Val, 0), 0} | Sc],
    calc_self_loss(T, Self, Svc1, Sc1);
calc_self_loss([{sq_point, _Val} | T], Self, Svc, Sc) ->
    Val = combat_skill:get_sq_point_by_combat_type(),
    Svc1 = [{fighter_ext_sq_point, 1, -Val} | Svc],
    OldVal = combat_cache:get_ext_val(Self, 9, 0),
    Sc1 = [{16, max(OldVal - Val, 0), 0} | Sc],
    calc_self_loss(T, Self, Svc1, Sc1);
calc_self_loss([_ | T], Self, Svc, Sc) ->
    calc_self_loss(T, Self, Svc, Sc).

dmg(AttackType,
    CSkill = #c_skill{action_no = ActionNo,
                      skill =
                          #skill{elem_type = ElemType, dmg_addt = DmgAddt},
                      reduce_dmg = ReduceDmg, pursue_attack = IsPursue},
    Self = #fighter{classes = _Classes, name = _Sname,
                    type = SType, base_id = SBaseId,
                    attr =
                        #attr{phy_dmg = PhyDmg, magic_dmg = MagicDmg,
                              holy_dmg = AtkHoly, dmg_ratio = SelfDmgRatio,
                              phy_dmg_ratio = SelfPhyDmgRatio,
                              magic_dmg_ratio = SelfMagicDmgRatio,
                              crit_dmg = SelfCritDmgRatio},
                    special_attr =
                        #special_attr{reduce_self_phy_dmg = ReduceSelfPhyDmg,
                                      anti_dmg_ratio = AntiDmgRatio,
                                      round_add_magic_dmg = RoundAddMagicDmg,
                                      assist_atk_hurt_ratio = AstDmgRatio},
                    special_status =
                        #special_status{is_taunt = SelfIsTaunt},
                    combat_init_attr =
                        #combat_init_attr{dmg_ratio = SInitDmgRatio,
                                          crit_dmg_ratio = SInitCritDmgRatio,
                                          phy_dmg_ratio = SInitPhyDmgRatio,
                                          magic_dmg_ratio = SInitMagicDmgRatio,
                                          anti_crit_ratio = SAntiCritRatio,
                                          phy_crit_extra_dmg = PhyCritExtraDmg,
                                          mag_crit_extra_dmg = MagCritExtraDmg},
                    combat_dynamic_attr =
                        #combat_dynamic_attr{dmg_ratio = SDynamicDmgRatio,
                                             crit_dmg_ratio =
                                                 SDynamicCritDmgRatio,
                                             phy_dmg_ratio =
                                                 SDynamicPhyDmgRatio,
                                             magic_dmg_ratio =
                                                 SDynamicMagicDmgRatio}},
    Target = #fighter{attr =
                          #attr{phy_def = Pdef, magic_def = Mdef,
                                def_ratio = DefRatio, phy_def_ratio = PdefRatio,
                                magic_def_ratio = MdefRatio,
                                crit_dmg_def = TargetCritDmgDef},
                      type = TType, name = _Tname, classes = Tclasses,
                      base_id = _TBaseId, is_defence = TargetDefence,
                      special_attr =
                          #special_attr{reduce_phy_dmg = ReducePhyDmg,
                                        fixed_dmg = 0},
                      special_status =
                          #special_status{dec_taunt_dmg_ratio =
                                              DecTauntDmgRatio},
                      combat_init_attr =
                          #combat_init_attr{hurt_ratio = TInitHurtRatio,
                                            crit_hurt_ratio =
                                                TInitCritHurtRatio,
                                            magic_hurt_ratio =
                                                TInitMagicHurtRatio},
                      combat_dynamic_attr =
                          #combat_dynamic_attr{hurt_ratio = TDynamicHurtRatio,
                                               phy_hurt_ratio =
                                                   TDynamicPhyHurtRatio,
                                               magic_hurt_ratio =
                                                   TDynamicMagicHurtRatio,
                                               crit_hurt_ratio =
                                                   TDynamicCritHurtRatio,
                                               reduce_dmg = TDynamicReduceDmg,
                                               buff_reduce_dmg = BuffReduceDmg,
                                               stone_reduce_dmg =
                                                   TStoneReduceDmg,
                                               phy_final_hurt_ratio =
                                                   PhyFinalHurtRatio,
                                               magic_final_hurt_ratio =
                                                   MagicFinalHurtRatio},
                      buffs = TBuffs},
    #action_effect{direct_dmg = undefined,
                   can_crit = CanCrit, crit_flag = CritFlag,
                   crit_ratio = CritRatio, act_dmg_ratio = ActDmgRatio,
                   crit_dmg_ratio = CritDmgRatio, holy_addt = HolyAddt,
                   dec_def_ratio = DecDefRatio, default_atk = DefAtk,
                   hurt_multi = HurtMulti,
                   dec_magic_def_ratio = AcDecMagicDefRatio,
                   act_dmg = ActDmg, extern_dmg = ExternDmg,
                   act_hurt_multi = ActHurtMulti},
    #passive_effect{atk_addt = AtkAddt,
                    crit_ratio = PassCritRatio, defence = PassDefence,
                    atk_holy_addt = PassiveHolyAddt,
                    dmg_ratio = PassiveDmgRatio,
                    dmg_ratio_add = PassiveDmgRatioAdd,
                    dmg_addt = PassiveDmgAddt, def_ratio = PassiveDefRatio,
                    float_dmg = FloatDmg, dec_def_ratio = PdecDefRatio,
                    dec_phy_def_ratio = PdecPhyDefRatio,
                    dec_magic_def_ratio = PdecMagicDefRatio,
                    hurt_multi = PsHurtMulti,
                    phy_dmg_ratio = PassPhyDmgRatio,
                    magic_dmg_ratio = PassMagicDmgRatio,
                    buff_holy_addt = PassiveBuffHolyAddt,
                    phy_dmg_dec = PassPhyDmgDec,
                    magic_dmg_dec = PassMagicDmgDec,
                    dec_phy_def = PassDecPhyDef,
                    dec_magic_def = PassDecMagicDef, dmg_ext = PassDmgExt,
                    phy_crit_extra_dmg = PassivePhyCritExtraDmg,
                    mag_crit_extra_dmg = PassiveMagCritExtraDmg}) ->
    {AtkTalismanDmgRatio, DfdTalismanDefRatio} =
        calc_talisman_rival(attack, Self, Target),
    logger:debug("宝物克制属性:~w",
                 [{AtkTalismanDmgRatio, DfdTalismanDefRatio}],
                 combat_script_skill_calc,
                 822),
    TypeHurtRatio = case ElemType of
                        1 -> TDynamicMagicHurtRatio + TInitMagicHurtRatio;
                        _ -> TDynamicPhyHurtRatio
                    end,
    SAttrDmgRatio = SInitDmgRatio + SDynamicDmgRatio,
    SAttrCritDmgRatio = SInitCritDmgRatio,
    SDynamicCritDmgRatio,
    TAttrHurtRatio = TInitHurtRatio + TDynamicHurtRatio +
                         TypeHurtRatio,
    TAttrCritHurtRaito = TInitCritHurtRatio +
                             TDynamicCritHurtRatio,
    SkillDmgRatio = combat_skill:get_dmg_ratio(CSkill,
                                               ActionNo),
    Atk = case ElemType of
              1 -> MagicDmg + RoundAddMagicDmg;
              _ -> PhyDmg + AtkAddt
          end,
    Def = case ElemType of
              1 ->
                  round((Mdef + PassDefence - PassDecMagicDef) *
                            (1000 -
                                 (DecDefRatio + PdecDefRatio + PdecMagicDefRatio
                                      + AcDecMagicDefRatio))
                            / 1000);
              _ ->
                  round((Pdef + PassDefence - PassDecPhyDef) *
                            (1000 -
                                 (DecDefRatio + PdecDefRatio + PdecPhyDefRatio))
                            / 1000)
          end,
    SelfAllDmgRatio = case ElemType of
                          1 ->
                              SelfDmgRatio + SelfMagicDmgRatio +
                                  AtkTalismanDmgRatio;
                          _ ->
                              SelfDmgRatio + SelfPhyDmgRatio +
                                  AtkTalismanDmgRatio
                      end,
    IsDefence = case ElemType of
                    0 -> TargetDefence;
                    _ -> 0
                end,
    AfterDefending = case IsDefence of
                         1 -> 5.0e-1;
                         _ -> 1
                     end,
    TAttrDefRatio = case ElemType of
                        1 ->
                            -(MdefRatio + DefRatio + PassiveDefRatio +
                                  DfdTalismanDefRatio);
                        _ ->
                            -(PdefRatio + DefRatio + PassiveDefRatio +
                                  DfdTalismanDefRatio)
                    end,
    AddAntiRatio = case AttackType of
                       anti_attack -> AntiDmgRatio;
                       assist_attack -> AstDmgRatio;
                       _ -> 0
                   end,
    BuffReduceDmg1 = calc_buff_reduce_dmg(ElemType,
                                          BuffReduceDmg,
                                          PhyFinalHurtRatio,
                                          MagicFinalHurtRatio),
    logger:debug("===BuffReduceDmg1=======:~w",
                 [BuffReduceDmg1],
                 combat_script_skill_calc,
                 877),
    ChildExtHurt = case lists:member(SType, [5, 3]) =:= true
                            andalso TType =:= 6
                       of
                       true ->
                           case Tclasses =:= 5 of
                               true -> 180;
                               _ -> 120
                           end;
                       _ -> 0
                   end,
    BaseDmgAdjustRatio = SkillDmgRatio + SAttrDmgRatio +
                             PassiveDmgRatio
                             + ActDmgRatio
                             + AddAntiRatio
                             + ChildExtHurt,
    DmgAdjustRatio = max(0,
                         BaseDmgAdjustRatio *
                             (1 + TAttrHurtRatio / 1000 +
                                  PassiveDmgRatioAdd / 1000
                                  + (SelfAllDmgRatio + TAttrDefRatio) / 1000)),
    ok,
    BaseAtk = case is_integer(DefAtk) of
                  true -> DefAtk;
                  false -> Atk + ActDmg
              end,
    AllPhyDmgRatio = SInitPhyDmgRatio + PassPhyDmgRatio +
                         SDynamicPhyDmgRatio,
    AllMagicDmgRatio = SInitMagicDmgRatio +
                           PassMagicDmgRatio
                           + SDynamicMagicDmgRatio,
    BaseHurt = lists:max([1,
                          util:ceil(BaseAtk / 10),
                          BaseAtk - Def]),
    BaseHurt1 = calc_base_dmg(BaseHurt, Self, Target),
    BaseHurt2 = case ElemType of
                    1 ->
                        round(BaseHurt1 * (1000 + AllMagicDmgRatio) / 1000);
                    _ -> round(BaseHurt1 * (1000 + AllPhyDmgRatio) / 1000)
                end,
    BaseAtkFinal = round((BaseHurt2 *
                              (DmgAdjustRatio / 1000)
                              + DmgAddt
                              + PassiveDmgAddt)
                             * AfterDefending),
    StatusReduceDmg = case SelfIsTaunt of
                          1 ->
                              case
                                  combat_script_skill_calc:is_anger_skill(CSkill)
                                  of
                                  true -> 0;
                                  false -> DecTauntDmgRatio
                              end;
                          _ -> 0
                      end,
    ok,
    DmgHp = dmg_float(BaseAtkFinal,
                      ReduceDmg,
                      TDynamicReduceDmg,
                      BuffReduceDmg1,
                      FloatDmg,
                      StatusReduceDmg,
                      TStoneReduceDmg),
    DmgHp1 = case ElemType of
                 0 ->
                     round(DmgHp * (1000 - (ReducePhyDmg + ReduceSelfPhyDmg))
                               / 1000);
                 _ -> DmgHp
             end,
    DmgHp2 = case ElemType of
                 1 -> max(1, DmgHp1 - PassMagicDmgDec + PassDmgExt);
                 _ -> max(1, DmgHp1 - PassPhyDmgDec + PassDmgExt)
             end,
    logger:debug("暴击和神圣伤害前最终伤害~w",
                 [DmgHp2],
                 combat_script_skill_calc,
                 935),
    ExternDmg1 = dmg_float(ExternDmg,
                           ReduceDmg,
                           TDynamicReduceDmg,
                           BuffReduceDmg1,
                           FloatDmg,
                           StatusReduceDmg,
                           TStoneReduceDmg),
    LastDmgHp = DmgHp2,
    ok,
    AtkHolyHp = AtkHoly + HolyAddt + PassiveHolyAddt +
                    PassiveBuffHolyAddt,
    AtkHolyHp1 = case lists:keyfind(50006,
                                    #c_buff.id,
                                    TBuffs)
                     of
                     #c_buff{duration_left = Left} when Left >= 1 ->
                         AtkHolyHp * 1.0e-1;
                     _ ->
                         case lists:keyfind(90251, #c_buff.id, TBuffs) of
                             #c_buff{duration_left = Left} when Left >= 1 ->
                                 AtkHolyHp * 2.0e-1;
                             _ -> AtkHolyHp
                         end
                 end,
    DmgHolyHp = round(AtkHolyHp1),
    LastDmgHolyHp = DmgHolyHp,
    DecCritRatio = case SType =:= 3 andalso
                            SBaseId =:= 20006
                       of
                       true ->
                           case IsPursue of
                               1 -> -100;
                               _ -> 0
                           end;
                       _ -> 0
                   end,
    LastCritRatio = max(1,
                        1500 + SelfCritDmgRatio + SAttrCritDmgRatio +
                            TAttrCritHurtRaito
                            + CritDmgRatio
                            + DecCritRatio
                            - TargetCritDmgDef),
    AllExtCrit = CritRatio + PassCritRatio,
    AntiCritRatio = case AttackType of
                        anti_attack -> SAntiCritRatio;
                        _ -> 0
                    end,
    CritResult = is_crit(CSkill,
                         Self,
                         Target,
                         AllExtCrit,
                         AntiCritRatio),
    logger:debug("是否暴击:~w",
                 [CritResult],
                 combat_script_skill_calc,
                 976),
    CritExtraDmg = case ElemType of
                       0 -> PhyCritExtraDmg + PassivePhyCritExtraDmg;
                       _ -> MagCritExtraDmg + PassiveMagCritExtraDmg
                   end,
    logger:debug("暴击伤害:~w",
                 [{PhyCritExtraDmg, MagCritExtraDmg}],
                 combat_script_skill_calc,
                 981),
    {GetDmgHp, GetHolyHp, GetCrit, GetDefence} = case
                                                     CanCrit =:= 1 andalso
                                                         CritResult =:= true
                                                         orelse CritFlag =:= 1
                                                     of
                                                     true ->
                                                         {round(LastDmgHp *
                                                                    LastCritRatio
                                                                    / 1000),
                                                          round(LastDmgHolyHp *
                                                                    LastCritRatio
                                                                    / 1000)
                                                              + CritExtraDmg,
                                                          1,
                                                          IsDefence};
                                                     false ->
                                                         {LastDmgHp,
                                                          LastDmgHolyHp,
                                                          0,
                                                          IsDefence}
                                                 end,
    GetDmgHp1 = round((GetDmgHp + ExternDmg1) * HurtMulti /
                          1000
                          * (1000 + PsHurtMulti + ActHurtMulti)
                          / 1000),
    GetHolyHp1 = round(GetHolyHp * HurtMulti / 1000 *
                           (1000 + PsHurtMulti + ActHurtMulti)
                           / 1000),
    {GetDmgHp1,
     GetHolyHp1,
     GetCrit,
     GetDefence,
     PassiveBuffHolyAddt};
dmg(_AttackType,
    _Skill = #c_skill{skill = #skill{elem_type = ElemType}},
    _Self,
    _Target = #fighter{is_defence = TargetDefence,
                       special_attr = #special_attr{fixed_dmg = FixedDmg}},
    #action_effect{direct_dmg = undefined}, _Pe)
    when is_integer(FixedDmg) =:= true andalso FixedDmg > 0
             orelse is_tuple(FixedDmg) ->
    IsDefence = case ElemType of
                    0 -> TargetDefence;
                    _ -> 0
                end,
    case FixedDmg of
        {Fixed1, Fixed2} ->
            {util:rand(Fixed1, Fixed2), 0, 0, IsDefence, 0};
        _ -> {FixedDmg, 0, 0, IsDefence, 0}
    end;
dmg(_AttackType,
    _Skill = #c_skill{skill = #skill{elem_type = ElemType}},
    _Self, _Target = #fighter{is_defence = TargetDefence},
    #action_effect{direct_dmg = DirectDmg,
                   calc_def = CalcDef},
    _Pe)
    when is_integer(DirectDmg) ->
    IsDefence = case ElemType of
                    0 -> TargetDefence;
                    _ -> 0
                end,
    NewDirectDmg = case CalcDef of
                       1 ->
                           case IsDefence of
                               1 -> round(5.0e-1 * DirectDmg);
                               _ -> DirectDmg
                           end;
                       _ -> DirectDmg
                   end,
    {NewDirectDmg, 0, 0, IsDefence, 0};
dmg(_AttackType,
    _Skill = #c_skill{skill = #skill{elem_type = ElemType}},
    _Self, _Target = #fighter{is_defence = TargetDefence},
    _Ae, _Pe) ->
    IsDefence = case ElemType of
                    0 -> TargetDefence;
                    _ -> 0
                end,
    {0, 0, 0, IsDefence, 0}.

dmg_float(Dmg, ReduceDmg, DynamicReduceDmg,
          BuffReduceDmg, FloatDmg, StatusReduceDmg,
          TStoneReduceDmg) ->
    Dmg1 = Dmg * util:rand(985, 1015) / 1000,
    Dmg2 = Dmg1 * ReduceDmg / 1000 *
               (max(1000 - DynamicReduceDmg, 0) / 1000)
               * (max(1000 + BuffReduceDmg, 0) / 1000)
               * (max(1000 + FloatDmg, 0) / 1000)
               * (max(1000 - StatusReduceDmg, 0) / 1000)
               * (max(1000 - TStoneReduceDmg, 0) / 1000),
    ok,
    util:check_min(round(Dmg2), 0).

is_crit(_, #fighter{},
        #fighter{type = 2, attr = #attr{tenacity = Tenacity}},
        _, _)
    when Tenacity =:= -1 ->
    true;
is_crit(_,
        #fighter{special_status =
                     #special_status{can_crit = 0}},
        _, _, _) ->
    false;
is_crit(_, _,
        #fighter{combat_init_attr =
                     #combat_init_attr{can_be_crit = 0}},
        _, _) ->
    false;
is_crit(#c_skill{skill = #skill{elem_type = ElemType}},
        _Self = #fighter{attr =
                             #attr{crit = Crit, phy_crit = PhyCrit,
                                   magic_crit = MagicCrit}},
        _Target = #fighter{attr =
                               #attr{tenacity = Tenacity,
                                     phy_tenacity = PhyTenacity,
                                     magic_tenacity = MagicTenacity}},
        CritRatio, AntiCritRatio) ->
    {Crit1, Tenacity1} = case ElemType of
                             1 -> {Crit + MagicCrit, Tenacity + MagicTenacity};
                             _ -> {Crit + PhyCrit, Tenacity + PhyTenacity}
                         end,
    FinalCritRate = util:check_range(Crit1 + CritRatio +
                                         AntiCritRatio
                                         - Tenacity1,
                                     0,
                                     500),
    logger:debug("FinalCritRate:~w",
                 [FinalCritRate],
                 combat_script_skill_calc,
                 1098),
    util:rand(1, 1000) =< FinalCritRate.

attack(Skill, Self, Target, SkillAddtArg,
       ActionEffect) ->
    attack(attack,
           Skill,
           Self,
           Target,
           SkillAddtArg,
           ActionEffect).

attack(ActionType,
       Skill = #c_skill{special_type = SpecialType,
                        target_no = TargetNo,
                        skill =
                            #skill{buff_target = BuffTarget,
                                   elem_type = ElemType}},
       S = #fighter{id = Sid, name = _Sname,
                    combat_init_attr =
                        #combat_init_attr{atk_not_anger = SAtkNotAnger}},
       #fighter{id = Tid, name = _Tname, hp_max = ThpMax,
                type = TargetType,
                combat_init_attr =
                    #combat_init_attr{def_anger_ratio = TdefAngerRatio}},
       #c_skill_addt_arg{self_val_changed = AddtSvc,
                         self_changed = AddtSc, target_val_changed = AddtTvc,
                         target_changed = AddtTc,
                         show_passive_skills = BaseShow, self_buff = AddtSBuff},
       ActionEffect = #action_effect{target_val_changes =
                                         ActEffValChanges,
                                     target_changes = ActEffChanges,
                                     injury_ratio = InjuryRatio,
                                     mate_suck_hp = MateSuckFun}) ->
    FirstSelf = #fighter{} = combat_cache:f(by_id, Sid),
    FirstTarget = combat_cache:f(by_id, Tid),
    combat_pet:pet_talk(FirstSelf, 2),
    combat_pet:pet_talk(FirstTarget, 3),
    combat_child:child_talk(FirstSelf, 2),
    combat_child:child_talk(FirstTarget, 3),
    combat_fighter:unit_talk(FirstSelf, 2),
    combat_fighter:unit_talk(FirstTarget, 3),
    SkillIsHit = is_hit(Skill,
                        FirstSelf,
                        FirstTarget,
                        ActionEffect),
    case SkillIsHit of
        false ->
            IsHit = 0,
            IsCrit = 0,
            IsSelfDie = 0,
            IsTargetDie = 0,
            #passive_effect{show_passive_skills = ShowPassiveSkills,
                            target_val_changed = DodgeTvc,
                            target_changed = DodgeTc} =
                passive_activate(dodge,
                                 FirstSelf,
                                 FirstTarget,
                                 check_skill_act(Skill)),
            ok,
            {SelfValChanges, SelfChanges} = calc_cost(Skill,
                                                      FirstSelf),
            {SelfAngerValChange, SelfAngerChange} =
                calc_self_anger(Skill, FirstSelf),
            SelfValChanges1 = SelfValChanges ++ SelfAngerValChange,
            SelfChanges1 = SelfChanges ++ SelfAngerChange,
            TargetValChanges = DodgeTvc,
            TargetChanges = DodgeTc,
            combat_cache:u(Sid, SelfValChanges1),
            combat_cache:u(Tid, TargetValChanges),
            combat_play:add_sub_play(combat_play:gen_sub_skill_play(ActionType,
                                                                    {FirstSelf,
                                                                     FirstTarget,
                                                                     Skill,
                                                                     SelfChanges1,
                                                                     TargetChanges,
                                                                     IsHit,
                                                                     IsCrit,
                                                                     IsSelfDie,
                                                                     IsTargetDie,
                                                                     ShowPassiveSkills
                                                                         ++
                                                                         BaseShow})),
            anti_attack_play(Skill,
                             FirstSelf,
                             FirstTarget,
                             ActionEffect,
                             #passive_effect{});
        true ->
            combat_cache:save_context([{#combat_context.skill_hurt,
                                        true}]),
            IsHit = 1,
            Pe = #passive_effect{buff_self_to_self = PsvBfs2s,
                                 buff_self_to_target = PsvBfs2t,
                                 buff_target_to_self = PsvBft2s,
                                 buff_target_to_target = PsvBft2t,
                                 del_target_buff = DelTargetBuffs,
                                 self_val_changed = PassiveSvc,
                                 self_changed = PassiveSc,
                                 target_val_changed = PassiveTvc,
                                 target_changed = PassiveTc,
                                 suck_hp = PassiveSuck, kill_suck_hp = KillSuck,
                                 stone_suck_hp = PassiveStoneSuck,
                                 suck_mp = PassiveSuckMp,
                                 suck_mp_loss = PassiveSuckMpLoss,
                                 suck_mp_max = PassiveSuckMpMax,
                                 master_suck_hp = PassiveMasterSuck,
                                 show_passive_skills = ShowPassiveSkills1,
                                 ghost_atk = GhostAtk,
                                 revive_self_atk = ReviveSelfAtk,
                                 dec_dmg_flag = DecDmgFlag,
                                 injury_ratio = PeInjuryRatio,
                                 tar_ignore_die_ratio = TarIgnoreDieRatio,
                                 target_def_add_buff = TargetDefAddBuff} =
                     passive_activate(attack,
                                      FirstSelf,
                                      FirstTarget,
                                      check_skill_act(Skill)),
            ShowPassiveSkills = BaseShow ++ ShowPassiveSkills1,
            Self = combat_cache:f(by_id, Sid),
            Target = #fighter{special_attr = TSAttr,
                              buffs = TbuffList,
                              special_status =
                                  #special_status{is_sleep = IsSleep,
                                                  is_stone = IsStone}} =
                         combat_cache:f(by_id, Tid),
            {DmgHpBeforeAbsorb,
             DmgHolyHpBeforeAbsorb,
             IsCrit,
             IsDefence,
             BuffDmg} =
                dmg(attack, Skill, Self, Target, ActionEffect, Pe),
            logger:debug("~w:~w:~w:~w:~w",
                         [DmgHpBeforeAbsorb,
                          DmgHolyHpBeforeAbsorb,
                          IsCrit,
                          IsDefence,
                          BuffDmg],
                         combat_script_skill_calc,
                         1203),
            case IsCrit of
                1 ->
                    combat_cache:save_context([{#combat_context.skill_crit,
                                                true},
                                               {#combat_context.skill_pursue_crit,
                                                true}]);
                _ -> ignore
            end,
            ActionEffect1 = case IsCrit of
                                1 ->
                                    case ActionEffect#action_effect.crit_suck_hp
                                             > 0
                                        of
                                        true ->
                                            combat_skill:add_skill_cooldown(Sid,
                                                                            Skill,
                                                                            1);
                                        _ -> ok
                                    end,
                                    ActionEffect;
                                _ ->
                                    ActionEffect#action_effect{crit_suck_hp = 0}
                            end,
            {ReboundTargetPlay,
             ReboundSc,
             ReboundSvc,
             DmgHpRebound,
             DmgHolyHpRebound,
             TSAttrRebound} =
                calc_rebound(Skill,
                             DmgHpBeforeAbsorb,
                             DmgHolyHpBeforeAbsorb,
                             TSAttr,
                             Sid,
                             Tid,
                             TbuffList),
            {DmgHpMirrorFeedback, DmgHolyHpMirrorFeedback} =
                calc_mirror_feedback(Skill,
                                     DmgHpRebound,
                                     DmgHolyHpRebound,
                                     Sid,
                                     Tid),
            {SelfValChanges1, SelfChanges1} = calc_cost(Skill,
                                                        Self),
            {SelfAngerValChange, SelfAngerChange} =
                calc_self_anger(Skill, Self),
            logger:debug("========怒气计算====:~w",
                         [{SelfAngerValChange, SelfAngerChange}],
                         combat_script_skill_calc,
                         1241),
            SelfValChanges = SelfValChanges1 ++
                                 PassiveSvc ++
                                     AddtSvc ++
                                         ReboundSvc ++ SelfAngerValChange,
            SelfChanges = SelfChanges1 ++
                              PassiveSc ++
                                  AddtSc ++ ReboundSc ++ SelfAngerChange,
            combat_cache:u(Sid, SelfValChanges),
            {AbsorbPlay, DmgHp11, DmgHolyHp11, TSAttr0} =
                calc_shield(DmgHpMirrorFeedback,
                            DmgHolyHpMirrorFeedback,
                            TSAttrRebound,
                            ElemType,
                            Sid,
                            Tid,
                            TbuffList),
            {ProtectFlag, DmgHp22, DmgHolyHp22} = calc_protect(S,
                                                               Target,
                                                               DmgHp11,
                                                               DmgHolyHp11),
            {ProtectFlag1, DmgHp44, DmgHolyHp44} = case ProtectFlag
                                                       of
                                                       1 ->
                                                           {ProtectFlag,
                                                            DmgHp22,
                                                            DmgHolyHp22};
                                                       _ ->
                                                           calc_pet_protect(S,
                                                                            Target,
                                                                            DmgHp22,
                                                                            DmgHolyHp22)
                                                   end,
            LastTarget = #fighter{hp = Thp} = combat_cache:f(by_id,
                                                             Tid),
            {DmgHp55, DmgHolyHp55} = case ProtectFlag1 of
                                         1 -> {DmgHp44, DmgHolyHp44};
                                         _ ->
                                             combat_sworn:protect(Target,
                                                                  DmgHp44,
                                                                  DmgHolyHp44)
                                     end,
            NewDmgHp = DmgHp55,
            NewDmgHolyHp = DmgHolyHp55,
            DmgTotal0 = NewDmgHp + NewDmgHolyHp,
            {DecDmgTc, DmgTotal, TSAttr1} = calc_dec_dmg(DmgTotal0,
                                                         Target,
                                                         TSAttr0,
                                                         DecDmgFlag),
            NewDmgTotal0 = calc_max_dmg(FirstSelf,
                                        LastTarget,
                                        DmgTotal),
            {NewDmgTotal1, IgnoreDieTC} = case TarIgnoreDieRatio > 0
                                                   andalso
                                                   Thp - NewDmgTotal0 < 1
                                              of
                                              true ->
                                                  {0, [{15, 0, NewDmgTotal0}]};
                                              _ -> {NewDmgTotal0, []}
                                          end,
            logger:debug("攻击最终伤害：~w",
                         [NewDmgTotal1],
                         combat_script_skill_calc,
                         1290),
            {NewDmgTotal, AfterDmgPsvBft2t, AfterShowPsvSkill} =
                case TargetDefAddBuff of
                    [{DmgHpRatio,
                      DefRatio,
                      AfterDmgPsvBft2t0,
                      TargetSkill = #c_skill{id = TargetSkillId}}
                     | _] ->
                        case round(DmgHpRatio * ThpMax / 1000) =< NewDmgTotal1
                            of
                            true ->
                                combat_skill:add_skill_cooldown(Tid,
                                                                TargetSkill,
                                                                1),
                                {round(NewDmgTotal1 * DefRatio / 1000),
                                 AfterDmgPsvBft2t0,
                                 [{Tid, TargetSkillId, 1}]};
                            _ -> {NewDmgTotal1, [], []}
                        end;
                    _ -> {NewDmgTotal1, [], []}
                end,
            NewShowPassiveSkills = ShowPassiveSkills ++
                                       AfterShowPsvSkill,
            NewInjuryRatio = InjuryRatio + PeInjuryRatio,
            {InjuryTvc, InjuryTc} = case NewInjuryRatio > 0 of
                                        true ->
                                            Injury1 = round(NewDmgTotal *
                                                                NewInjuryRatio
                                                                / 1000),
                                            Injury2 = case TargetType of
                                                          1 ->
                                                              round(Injury1 *
                                                                        1.5);
                                                          _ -> Injury1
                                                      end,
                                            {[{tmp_hp_max, 1, -Injury2}],
                                             [{13, -Injury2, 0}]};
                                        _ -> {[], []}
                                    end,
            Thp1 = Thp - NewDmgTotal,
            {AngerValChange, AngerChange} = case TargetType =:= 1
                                                     andalso SAtkNotAnger =:= 0
                                                of
                                                true ->
                                                    RealDmg = case Thp1 > 0 of
                                                                  true ->
                                                                      Thp -
                                                                          Thp1;
                                                                  false -> Thp
                                                              end,
                                                    AngerRatio =
                                                        util:check_range(RealDmg
                                                                             /
                                                                             ThpMax
                                                                             *
                                                                             100,
                                                                         0,
                                                                         100),
                                                    AngerVal = if AngerRatio >=
                                                                      85 ->
                                                                      36;
                                                                  AngerRatio >=
                                                                      55 ->
                                                                      28;
                                                                  AngerRatio >=
                                                                      35 ->
                                                                      20;
                                                                  AngerRatio >=
                                                                      25 ->
                                                                      15;
                                                                  AngerRatio >=
                                                                      15 ->
                                                                      10;
                                                                  AngerRatio >=
                                                                      5 ->
                                                                      6;
                                                                  true -> 3
                                                               end,
                                                    NewAngerVal =
                                                        util:ceil(AngerVal *
                                                                      (1000 +
                                                                           TdefAngerRatio)
                                                                      / 1000),
                                                    {[{anger, 1, NewAngerVal}],
                                                     [{9, NewAngerVal, 0}]};
                                                _ -> {[], []}
                                            end,
            TSAttr2 = calc_sleep(Sid,
                                 Tid,
                                 TbuffList,
                                 TSAttr1,
                                 IsSleep),
            TSAttr3 = calc_stone(Sid,
                                 Tid,
                                 TbuffList,
                                 TSAttr2,
                                 IsStone),
            TSAttr4 = update_round_hurt(Sid, TSAttr3, NewDmgTotal),
            calc_trap(Sid, Tid, TSAttr4),
            case check_save_skill_dmg(Skill) of
                true ->
                    combat_cache:save_context([{#combat_context.skill_dmg,
                                                NewDmgTotal}]),
                    [ActionDmg] =
                        combat_cache:get_context_elem([#combat_context.action_dmg]),
                    combat_cache:save_context([{#combat_context.action_dmg,
                                                ActionDmg + NewDmgTotal}]),
                    case
                        combat_cache:get_context_elem([#combat_context.link_hurt])
                        of
                        [LinkHurtInfo] ->
                            NewLinkHurtInfo = lists:keyreplace(TargetNo,
                                                               2,
                                                               LinkHurtInfo,
                                                               {Tid,
                                                                TargetNo,
                                                                NewDmgTotal}),
                            combat_cache:save_context([{#combat_context.link_hurt,
                                                        NewLinkHurtInfo}]);
                        _ -> skip
                    end;
                _ -> skip
            end,
            combat_stat:update_total_dmg(Sid, NewDmgTotal),
            case Thp1 < 1 of
                true ->
                    combat_pet:pet_talk(LastTarget, 4),
                    combat_pet:pet_talk(LastTarget, 5),
                    combat_child:child_talk(LastTarget, 4),
                    combat_child:child_talk(LastTarget, 5),
                    combat_fighter:unit_talk(LastTarget, 4),
                    IsSelfDie = 0,
                    TargetBaseValChanges = [{hp, 0, 0},
                                            {special_attr, 0, TSAttr4},
                                            {protector, 0, del},
                                            {anger, 1, -50}],
                    TargetBaseChanges = [{0, -NewDmgTotal, 0}, {9, -50, 0}],
                    TargetValChanges = ActEffValChanges ++
                                           TargetBaseValChanges ++
                                               PassiveTvc ++
                                                   AddtTvc ++ InjuryTvc,
                    combat_cache:u(Tid, TargetValChanges),
                    AfterTarget = combat_cache:f(by_id, Tid),
                    AfterSelf = combat_cache:f(by_id, Sid),
                    #passive_effect{target_changed = NirvanaTargetChanges,
                                    show_passive_skills = NirvanaPassive} =
                        passive_activate(nirvana, AfterSelf, AfterTarget),
                    AfterNirvanaTarget = combat_cache:f(by_id, Tid),
                    AfterNirvanaSelf = combat_cache:f(by_id, Sid),
                    TargetChanges = ActEffChanges ++
                                        TargetBaseChanges ++
                                            AbsorbPlay ++
                                                PassiveTc ++
                                                    AddtTc ++
                                                        DecDmgTc ++
                                                            NirvanaTargetChanges
                                                                ++
                                                                InjuryTc ++
                                                                    ReboundTargetPlay
                                                                        ++
                                                                        IgnoreDieTC,
                    combat_cache:save_context([{#combat_context.kill_someone,
                                                true}]),
                    #passive_effect{show_passive_skills =
                                        AfterTargetPassive,
                                    self_val_changed = AtkAfterSVC,
                                    self_changed = AtkAfterSc} =
                        passive_activate(attack_after,
                                         AfterNirvanaSelf,
                                         AfterNirvanaTarget,
                                         check_skill_act(Skill)),
                    combat_cache:u(Sid, AtkAfterSVC),
                    passive_activate(attack_after_2,
                                     AfterNirvanaSelf,
                                     AfterNirvanaTarget,
                                     check_skill_act(Skill)),
                    #passive_effect{show_passive_skills =
                                        MasterDiePassive} =
                        case TargetType of
                            1 ->
                                case combat_cache:f(by_master_id, Tid) of
                                    TargetPet = #fighter{is_die = 0,
                                                         is_escape = 0} ->
                                        combat_script_skill_calc:passive_activate(master_die,
                                                                                  TargetPet,
                                                                                  TargetPet);
                                    _ -> #passive_effect{}
                                end;
                            _ -> #passive_effect{}
                        end,
                    logger:debug("显示的被动信息:~w",
                                 [MasterDiePassive],
                                 combat_script_skill_calc,
                                 1411),
                    passive_revive_self(GhostAtk,
                                        ReviveSelfAtk,
                                        AfterNirvanaSelf,
                                        AfterNirvanaTarget),
                    DiePassive = passive_die_effect(AfterSelf, AfterTarget),
                    AfterTarget1 = #fighter{is_die = IsTargetDie} =
                                       combat_cache:f(by_id, Tid),
                    AfterSelf1 = combat_cache:f(by_id, Sid),
                    AllShowPassiveSkills = NewShowPassiveSkills ++
                                               AfterTargetPassive ++
                                                   DiePassive ++
                                                       NirvanaPassive ++
                                                           MasterDiePassive,
                    PlaySkill = check_exchange_play_skill(Self, Skill),
                    combat_play:add_sub_play(combat_play:gen_sub_skill_play(ActionType,
                                                                            {AfterSelf1,
                                                                             AfterTarget1,
                                                                             PlaySkill,
                                                                             SelfChanges
                                                                                 ++
                                                                                 AtkAfterSc,
                                                                             TargetChanges,
                                                                             IsHit,
                                                                             IsCrit,
                                                                             IsSelfDie,
                                                                             IsTargetDie,
                                                                             AllShowPassiveSkills,
                                                                             IsDefence})),
                    case
                        combat_cache:get_context_elem([#combat_context.round_die])
                        of
                        [RoundDieList] ->
                            logger:debug("本回合死亡单位:~w",
                                         [RoundDieList],
                                         combat_script_skill_calc,
                                         1429),
                            NewRoundDieList = [Tid | RoundDieList],
                            combat_cache:save_context([{#combat_context.round_die,
                                                        NewRoundDieList}]);
                        _ -> ok
                    end,
                    SelfToSelf = PsvBfs2s ++ AddtSBuff,
                    lists:foreach(fun (Buff) ->
                                          combat_buff:buff_add(Buff, Self, Self)
                                  end,
                                  SelfToSelf),
                    combat_stat:update_kill(Sid, Tid),
                    case lists:member(suck_immune, SpecialType) of
                        false ->
                            logger:debug("普通吸血率:~w,击杀吸血率:~w",
                                         [PassiveSuck, KillSuck],
                                         combat_script_skill_calc,
                                         1448),
                            fun_suck(ActionEffect1,
                                     {PassiveSuck, PassiveStoneSuck, KillSuck},
                                     {PassiveSuckMp,
                                      PassiveSuckMpLoss,
                                      PassiveSuckMpMax},
                                     NewDmgTotal,
                                     Self,
                                     Target,
                                     Skill,
                                     IsSelfDie);
                        _ -> ok
                    end,
                    fun_master_suck(PassiveMasterSuck,
                                    NewDmgTotal,
                                    Self,
                                    Skill),
                    fun_mate_suck(MateSuckFun, NewDmgTotal, Self, Skill),
                    fun_suck_buff(ActionEffect1, NewDmgTotal, Self, Skill),
                    fun_dmg_buff(ActionEffect1,
                                 NewDmgTotal,
                                 BuffDmg,
                                 Self,
                                 Target),
                    ok;
                false ->
                    IsSelfDie = 0,
                    IsTargetDie = 0,
                    TargetBaseValChanges = [{hp, 0, Thp1},
                                            {special_attr, 0, TSAttr4},
                                            {protector, 0, del}]
                                               ++ AngerValChange,
                    TargetBaseChanges = [{0, -NewDmgTotal, 0}] ++
                                            AngerChange,
                    TargetValChanges = ActEffValChanges ++
                                           TargetBaseValChanges ++
                                               PassiveTvc ++
                                                   AddtTvc ++ InjuryTvc,
                    TargetChanges = ActEffChanges ++
                                        TargetBaseChanges ++
                                            AbsorbPlay ++
                                                PassiveTc ++
                                                    AddtTc ++
                                                        DecDmgTc ++
                                                            InjuryTc ++
                                                                IgnoreDieTC,
                    combat_cache:u(Tid, TargetValChanges),
                    lists:foreach(fun (DelBuff) ->
                                          combat_buff:buff_del(Tid,
                                                               Sid,
                                                               DelBuff)
                                  end,
                                  DelTargetBuffs),
                    combat_stat:update_dispel_num(Sid, DelTargetBuffs),
                    AfterTarget = combat_cache:f(by_id, Tid),
                    AfterSelf = combat_cache:f(by_id, Sid),
                    #passive_effect{buff_target_to_target =
                                        AfterToTargetBuff,
                                    show_passive_skills = AfterTargetPassive,
                                    self_val_changed = AtkAfterSVC,
                                    self_changed = AtkAfterSc} =
                        passive_activate(attack_after,
                                         AfterSelf,
                                         AfterTarget,
                                         check_skill_act(Skill)),
                    combat_cache:u(Sid, AtkAfterSVC),
                    passive_activate(attack_after_2,
                                     AfterSelf,
                                     AfterTarget,
                                     check_skill_act(Skill)),
                    NewBuffTarget = case lists:member(first_buff,
                                                      SpecialType)
                                        of
                                        true ->
                                            case TargetNo =:= 1 of
                                                true -> BuffTarget;
                                                false -> []
                                            end;
                                        _ -> BuffTarget
                                    end,
                    SelfToTarget = NewBuffTarget ++ PsvBfs2t,
                    TargetToTarget = PsvBft2t ++
                                         AfterToTargetBuff ++ AfterDmgPsvBft2t,
                    lists:foreach(fun (Buff) ->
                                          combat_buff:buff_add(Buff,
                                                               Self,
                                                               Target)
                                  end,
                                  SelfToTarget),
                    lists:foreach(fun (Buff) ->
                                          combat_buff:buff_add(Buff,
                                                               Target,
                                                               Target)
                                  end,
                                  TargetToTarget),
                    SelfToSelf = PsvBfs2s ++ AddtSBuff,
                    TargetToSelf = case lists:member(buff_immune,
                                                     SpecialType)
                                       of
                                       true -> [];
                                       _ -> PsvBft2s
                                   end,
                    lists:foreach(fun (Buff) ->
                                          combat_buff:buff_add(Buff, Self, Self)
                                  end,
                                  SelfToSelf),
                    lists:foreach(fun (Buff) ->
                                          combat_buff:buff_add(Buff,
                                                               Target,
                                                               Self)
                                  end,
                                  TargetToSelf),
                    SuckTarget = combat_cache:f(by_id, Tid),
                    SuckSelf = combat_cache:f(by_id, Sid),
                    case lists:member(suck_immune, SpecialType) of
                        false ->
                            logger:debug("吸血率:~w",
                                         [PassiveSuck],
                                         combat_script_skill_calc,
                                         1531),
                            fun_suck(ActionEffect1,
                                     {PassiveSuck, PassiveStoneSuck, undefined},
                                     {PassiveSuckMp,
                                      PassiveSuckMpLoss,
                                      PassiveSuckMpMax},
                                     NewDmgTotal,
                                     SuckSelf,
                                     SuckTarget,
                                     Skill,
                                     IsSelfDie);
                        _ -> ok
                    end,
                    fun_master_suck(PassiveMasterSuck,
                                    NewDmgTotal,
                                    SuckSelf,
                                    Skill),
                    fun_mate_suck(MateSuckFun, NewDmgTotal, Self, Skill),
                    fun_suck_buff(ActionEffect1,
                                  NewDmgTotal,
                                  SuckSelf,
                                  Skill),
                    fun_dmg_buff(ActionEffect1,
                                 NewDmgTotal,
                                 BuffDmg,
                                 SuckSelf,
                                 SuckTarget),
                    AllShowPassiveSkills = NewShowPassiveSkills ++
                                               AfterTargetPassive,
                    PlaySkill = check_exchange_play_skill(Self, Skill),
                    combat_play:add_sub_play(combat_play:gen_sub_skill_play(ActionType,
                                                                            {Self,
                                                                             Target,
                                                                             PlaySkill,
                                                                             SelfChanges
                                                                                 ++
                                                                                 AtkAfterSc,
                                                                             TargetChanges,
                                                                             IsHit,
                                                                             IsCrit,
                                                                             IsSelfDie,
                                                                             IsTargetDie,
                                                                             AllShowPassiveSkills,
                                                                             IsDefence})),
                    IsFeedBackKill = feedback_attack_play(FirstTarget,
                                                          FirstSelf,
                                                          Skill,
                                                          ActionEffect1,
                                                          Pe,
                                                          NewDmgTotal),
                    case IsFeedBackKill of
                        true -> skip;
                        false ->
                            anti_attack_play(Skill,
                                             FirstSelf,
                                             FirstTarget,
                                             ActionEffect,
                                             Pe)
                    end
            end
    end.

calc_dec_dmg(DmgTotal, _Target,
             TSAttr = #special_attr{dec_dmg = {Rate, Ratio, AllDmg}},
             1)
    when DmgTotal > 0 andalso AllDmg > 0 ->
    DecDmg = round(DmgTotal * Ratio / 1000),
    DecDmg1 = min(DecDmg, AllDmg),
    DmgTotal1 = max(DmgTotal - DecDmg1, 0),
    AllDmg1 = AllDmg - DecDmg1,
    NewDecDmgAttr = case AllDmg1 > 0 of
                        true -> {Rate, Ratio, AllDmg1};
                        _ -> undefined
                    end,
    DecPlay = [{11, DecDmg1, 0}],
    {DecPlay,
     DmgTotal1,
     TSAttr#special_attr{dec_dmg = NewDecDmgAttr}};
calc_dec_dmg(DmgTotal, _, TSAttr, _) ->
    {[], DmgTotal, TSAttr}.

anti_attack(#c_skill{skill = #skill{attack_type = 1}},
            _, _, _, _Pe) ->
    false;
anti_attack(Skill,
            _S = #fighter{id = Sid,
                          special_attr =
                              #special_attr{can_anti_attack = CanAntiAttack},
                          name = _Sname},
            _T = #fighter{id = Tid, buffs = TBuffs,
                          special_attr =
                              #special_attr{fixed_feedback = FixedFeedback,
                                            anti_times = AntiTimes,
                                            anti_ratio = AntiRatio,
                                            anti_skill = AntiSkill},
                          special_status =
                              #special_status{is_stun = 0, is_sleep = 0,
                                              is_stone = 0, is_weakness = 0}},
            _ActionEffect,
            #passive_effect{anti_skill = PsvAntiSkill,
                            def_anti = PsvDefAnti}) ->
    logger:debug("是否可以被反击:~w, 是否忽略偷袭:~w",
                 [CanAntiAttack, FixedFeedback],
                 combat_script_skill_calc,
                 1592),
    AntiFlag = case CanAntiAttack of
                   0 ->
                       case FixedFeedback of
                           0 -> false;
                           _ -> util:rand(1, 1000) =< 500
                       end;
                   _ -> true
               end,
    case AntiFlag of
        true ->
            case combat_skill:is_multi_skill(Skill) of
                true -> false;
                _ ->
                    Target = #fighter{name = _Tname} = combat_cache:f(by_id,
                                                                      Tid),
                    Flag = case PsvDefAnti =:= 1 of
                               true -> {true, AntiSkill};
                               false ->
                                   case PsvAntiSkill of
                                       undefined ->
                                           {util:rand(1, 1000) =< AntiRatio,
                                            AntiSkill};
                                       _ -> {true, PsvAntiSkill}
                                   end
                           end,
                    case Flag of
                        {true, GetAntiSkill} ->
                            case AntiTimes > 0 of
                                true ->
                                    NewAntiTimes = AntiTimes - 1,
                                    case NewAntiTimes > 0 of
                                        true ->
                                            combat_cache:u(Tid,
                                                           [{anti_times,
                                                             0,
                                                             NewAntiTimes}]);
                                        false ->
                                            ClearBuff = [Buff
                                                         || Buff =
                                                                #c_buff{sec_type
                                                                            =
                                                                            anti}
                                                                <- TBuffs],
                                            lists:foreach(fun (Buff) ->
                                                                  combat_buff:buff_del(Tid,
                                                                                       Tid,
                                                                                       Buff)
                                                          end,
                                                          ClearBuff),
                                            combat_cache:u(Tid,
                                                           [{anti_times, 0, 0}])
                                    end;
                                false -> skip
                            end,
                            Self = #fighter{hp = Shp} = combat_cache:f(by_id,
                                                                       Sid),
                            CSkill = case GetAntiSkill of
                                         {SkillId, SkillLev} ->
                                             case
                                                 combat_script_skill:to_combat_skill({SkillId,
                                                                                      SkillLev})
                                                 of
                                                 AntiCskill = #c_skill{} ->
                                                     AntiCskill;
                                                 _ ->
                                                     combat_skill:get_default_skill(Target)
                                             end;
                                         SkillId when is_integer(SkillId) ->
                                             case
                                                 combat_script_skill:to_combat_skill({SkillId,
                                                                                      1})
                                                 of
                                                 AntiCskill = #c_skill{} ->
                                                     AntiCskill;
                                                 _ ->
                                                     combat_skill:get_default_skill(Target)
                                             end;
                                         _ ->
                                             combat_skill:get_default_skill(Target)
                                     end,
                            case is_hit(CSkill, Target, Self) of
                                true ->
                                    combat_play:commit_sub_play(),
                                    AntiAtkPe = #passive_effect{suck_hp =
                                                                    PassiveSuck,
                                                                crit_ratio =
                                                                    CritRatio} =
                                                    passive_activate(attack,
                                                                     filter_passive_skill(Target#fighter{action
                                                                                                             =
                                                                                                             {CSkill,
                                                                                                              1}},
                                                                                          anti_attack),
                                                                     filter_passive_skill(Self,
                                                                                          anti_attack)),
                                    {DmgHp,
                                     DmgHolyHp,
                                     IsCrit,
                                     _IsDefence,
                                     _BuffDmg} =
                                        dmg(anti_attack,
                                            CSkill,
                                            Target,
                                            Self,
                                            #action_effect{crit_ratio =
                                                               CritRatio},
                                            AntiAtkPe),
                                    Dmg = DmgHp + DmgHolyHp,
                                    IsAntiAtkKill = Shp =< Dmg,
                                    SuckTarget = combat_cache:f(by_id, Tid),
                                    SuckSelf = combat_cache:f(by_id, Sid),
                                    logger:debug("反击吸血:~w",
                                                 [PassiveSuck],
                                                 combat_script_skill_calc,
                                                 1662),
                                    fun_suck(#action_effect{},
                                             {PassiveSuck,
                                              undefined,
                                              undefined},
                                             {0, 0, 0},
                                             Dmg,
                                             SuckTarget,
                                             SuckSelf,
                                             CSkill,
                                             0),
                                    {true,
                                     Dmg,
                                     IsAntiAtkKill,
                                     IsCrit,
                                     CSkill,
                                     1};
                                false ->
                                    combat_play:commit_sub_play(),
                                    {true, 0, false, 0, CSkill, 0}
                            end;
                        _ -> false
                    end
            end;
        _ -> false
    end;
anti_attack(_, _, _, _, _) -> false.

calc_sleep(_Sid, _Tid, _Buffs, SpecialAttr, 0) ->
    SpecialAttr;
calc_sleep(Sid, Tid, Buffs,
           SpecialAttr = #special_attr{sleep_layer = SleepLayer},
           1)
    when SleepLayer > 0 ->
    NewSleepLayer = SleepLayer - 1,
    case NewSleepLayer > 0 of
        true ->
            SpecialAttr#special_attr{sleep_layer = NewSleepLayer};
        _ ->
            ClearBuff = [Buff
                         || Buff = #c_buff{script_id = BuffId} <- Buffs,
                            lists:member(BuffId, [245000])],
            lists:foreach(fun (Buff) ->
                                  combat_buff:buff_del(Tid, Sid, Buff)
                          end,
                          ClearBuff),
            SpecialAttr#special_attr{sleep_layer = 0}
    end;
calc_sleep(_Sid, _Tid, _Buffs, SpecialAttr, _) ->
    SpecialAttr.

calc_stone(_Sid, _Tid, _Buffs, SpecialAttr, 0) ->
    SpecialAttr;
calc_stone(Sid, Tid, Buffs,
           SpecialAttr = #special_attr{stone_layer = StoneLayer},
           1)
    when StoneLayer > 0 ->
    NewStoneLayer = StoneLayer - 1,
    case NewStoneLayer > 0 of
        true ->
            SpecialAttr#special_attr{stone_layer = NewStoneLayer};
        _ ->
            ClearBuff = [Buff
                         || Buff = #c_buff{script_id = BuffId} <- Buffs,
                            lists:member(BuffId, [246000])],
            lists:foreach(fun (Buff) ->
                                  combat_buff:buff_del(Tid, Sid, Buff)
                          end,
                          ClearBuff),
            SpecialAttr#special_attr{stone_layer = 0}
    end;
calc_stone(_Sid, _Tid, _Buffs, SpecialAttr, _) ->
    SpecialAttr.

update_round_hurt(Sid,
                  SpecialAttr = #special_attr{round_hurt = RoundHurt,
                                              be_attack_times = undefined},
                  Val) ->
    SpecialAttr#special_attr{round_hurt = RoundHurt + Val,
                             be_attack_times = {[Sid], 1}};
update_round_hurt(Sid,
                  SpecialAttr = #special_attr{round_hurt = RoundHurt,
                                              be_attack_times = {FL, Times}},
                  Val) ->
    case lists:member(Sid, FL) of
        true ->
            SpecialAttr#special_attr{round_hurt = RoundHurt + Val};
        _ ->
            SpecialAttr#special_attr{round_hurt = RoundHurt + Val,
                                     be_attack_times = {[Sid | FL], Times + 1}}
    end.

calc_trap(Sid, _Tid,
          #special_attr{trap_ratio = TrapRatio,
                        trap_owener = TrapOwerer, trap_buff = TrapBuffs}) ->
    logger:debug("处理嘲讽陷阱：~w",
                 [{Sid, TrapRatio, TrapOwerer, TrapBuffs}],
                 combat_script_skill_calc,
                 1727),
    Self = combat_cache:f(by_id, Sid),
    case util:rand(1, 1000) =< TrapRatio of
        true ->
            BuffSource = combat_cache:f(by_id, TrapOwerer),
            CBuffs = combat_script_buff:convert_buff(TrapBuffs),
            [combat_buff:buff_add(Buff, BuffSource, Self, true)
             || Buff = #c_buff{} <- CBuffs],
            ok;
        _ -> ok
    end.

is_hit(Skill, Self, Target) ->
    is_hit(Skill, Self, Target, #action_effect{}).

is_hit(#c_skill{}, _Self = #fighter{},
       _Target = #fighter{type = 2,
                          attr = #attr{evasion = -1}},
       _ActionEffect = #action_effect{hit_ratio =
                                          _AddHitRatio}) ->
    true;
is_hit(CSkill = #c_skill{skill =
                             #skill{acc_ratio = SkAccRatio,
                                    acc_low = SkAccRaitoMin,
                                    acc_high = SkAccRatioMax,
                                    elem_type = ElemType}},
       _Self = #fighter{attr =
                            #attr{accuracy = AccRatio,
                                  phy_accuracy = PhyAccRatio,
                                  magic_accuracy = MagicAccRatio},
                        combat_init_attr =
                            #combat_init_attr{hit_ratio = InitHitRatio},
                        combat_dynamic_attr =
                            #combat_dynamic_attr{accuracy = DynamicAccRatio,
                                                 phy_accuracy =
                                                     DynamicPhyAccRatio,
                                                 magic_accuracy =
                                                     DynamicMagicAccRatio}},
       _Target = #fighter{type = TargetType,
                          attr =
                              #attr{evasion = Evasion, phy_evasion = PhyEvasion,
                                    magic_evasion = MagicEvasion},
                          combat_dynamic_attr =
                              #combat_dynamic_attr{evasion = DynamicEvasion,
                                                   phy_evasion =
                                                       DynamicPhyEvasion,
                                                   magic_evasion =
                                                       DynamicMagicEvasion}},
       _ActionEffect = #action_effect{hit_ratio =
                                          AddHitRatio}) ->
    case is_anger_skill(CSkill) of
        true -> true;
        _ ->
            {AccRatio1, Evasion1} = case ElemType of
                                        1 ->
                                            {AccRatio + MagicAccRatio +
                                                 DynamicAccRatio
                                                 + DynamicMagicAccRatio,
                                             Evasion + MagicEvasion +
                                                 DynamicEvasion
                                                 + DynamicMagicEvasion};
                                        _ ->
                                            {AccRatio + PhyAccRatio +
                                                 DynamicAccRatio
                                                 + DynamicPhyAccRatio,
                                             Evasion + PhyEvasion +
                                                 DynamicEvasion
                                                 + DynamicPhyEvasion}
                                    end,
            BaseHit = case TargetType of
                          2 -> 990;
                          _ -> 950
                      end,
            H2 = util:check_range(BaseHit + AccRatio1 - Evasion1,
                                  500,
                                  1000),
            Hr = H2 * SkAccRatio / 1000,
            CalcAccRatio = util:check_range(Hr,
                                            SkAccRaitoMin,
                                            SkAccRatioMax),
            FinalAccRatio = CalcAccRatio * 10,
            LastFinalAccRatio = FinalAccRatio + AddHitRatio +
                                    InitHitRatio,
            logger:debug("=======命中率=====:~w",
                         [round(InitHitRatio)],
                         combat_script_skill_calc,
                         1784),
            util:rand(1, 10000) =< LastFinalAccRatio
    end.

feedback_attack_play(Target, Self = #fighter{id = Sid},
                     Skill, Ae, Pe, Dmg) ->
    case feedback_attack(Target, Self, Skill, Ae, Pe, Dmg)
        of
        {true, IsFeedBackKill, FeedBackDmg} ->
            {FeedSvc, FeedSc, IsFeedDie} = case IsFeedBackKill of
                                               true ->
                                                   {[{hp, 0, 0},
                                                     {anger, 1, -50}],
                                                    [{0, -FeedBackDmg, 0},
                                                     {9, -50, 0}],
                                                    1};
                                               false ->
                                                   {[{hp, 1, -FeedBackDmg}],
                                                    [{0, -FeedBackDmg, 0}],
                                                    0}
                                           end,
            combat_cache:u(Sid, FeedSvc),
            AfterFeedPassive = anti_after_passive(Sid, #fighter{}),
            FeedSubPlay = combat_play:gen_sub_skill_play(feedback,
                                                         {Target,
                                                          Self,
                                                          FeedSc,
                                                          IsFeedDie,
                                                          AfterFeedPassive}),
            combat_play:add_sub_play(FeedSubPlay),
            IsFeedBackKill;
        _ -> false
    end.

anti_attack_play(Skill, Self = #fighter{id = Sid},
                 Target, ActionEffect, Pe) ->
    case anti_attack(Skill, Self, Target, ActionEffect, Pe)
        of
        {true, _, _, _, AntiSkill, 0} ->
            AntiSubPlay =
                combat_play:gen_sub_skill_play(anti_attack,
                                               {Target,
                                                Self,
                                                AntiSkill,
                                                [],
                                                0,
                                                0,
                                                0,
                                                []}),
            combat_play:add_sub_play(AntiSubPlay);
        {true,
         AntiAtkDmg,
         AntiKilled,
         AntiCrit,
         AntiSkill,
         AntiAtkHit} ->
            {AntiSvc, AntiSc, IsAntiDie} = case AntiKilled of
                                               true ->
                                                   {[{hp, 0, 0},
                                                     {anger, 1, -50}],
                                                    [{0, -AntiAtkDmg, 0},
                                                     {9, -50, 0}],
                                                    1};
                                               false ->
                                                   {[{hp, 1, -AntiAtkDmg}],
                                                    [{0, -AntiAtkDmg, 0}],
                                                    0}
                                           end,
            combat_cache:u(Sid, AntiSvc),
            AfterAntiPassive = anti_after_passive(Sid, Target),
            AntiSubPlay =
                combat_play:gen_sub_skill_play(anti_attack,
                                               {Target,
                                                Self,
                                                AntiSkill,
                                                AntiSc,
                                                IsAntiDie,
                                                AntiAtkHit,
                                                AntiCrit,
                                                AfterAntiPassive}),
            combat_play:add_sub_play(AntiSubPlay);
        _ -> skip
    end.

anti_after_passive(Sid, Target) ->
    case combat_cache:f(by_id, Sid) of
        AfterSelf = #fighter{is_die = 0} ->
            #passive_effect{buff_self_to_self = AfterToSelfBuff,
                            buff_target_to_target = AfterToTargetBuff,
                            show_passive_skills = Passive} =
                passive_activate(anti_after, AfterSelf, Target),
            lists:foreach(fun (Buff) ->
                                  combat_buff:buff_add(Buff,
                                                       AfterSelf,
                                                       AfterSelf)
                          end,
                          AfterToSelfBuff),
            lists:foreach(fun (Buff) ->
                                  combat_buff:buff_add(Buff, Target, Target)
                          end,
                          AfterToTargetBuff),
            Passive;
        _ ->
            #passive_effect{buff_target_to_target =
                                AfterToTargetBuff,
                            show_passive_skills = Passive} =
                passive_activate(anti_after, #fighter{}, Target),
            lists:foreach(fun (Buff) ->
                                  combat_buff:buff_add(Buff, Target, Target)
                          end,
                          AfterToTargetBuff),
            Passive
    end.

assist_attack_play(Skill,
                   #fighter{id = MasterFid, type = 1, name = _Name},
                   Target = #fighter{id = Tid}, ActionEffect, Pe) ->
    case combat_cache:f(by_master_id, MasterFid) of
        Self = #fighter{id = Sid, name = _Rame, is_die = 0,
                        is_escape = 0,
                        special_status =
                            #special_status{is_stun = 0, is_sleep = 0,
                                            is_stone = 0, is_weakness = 0,
                                            is_rest = 0, is_seal = 0}} ->
            case assist_attack(Skill,
                               Self,
                               Target,
                               ActionEffect,
                               Pe)
                of
                {true, _, _, _, AstSkill, 0} ->
                    PetAssistsShowPassive = [{Sid, 85710, 0}],
                    AntiSubPlay =
                        combat_play:gen_sub_skill_play(assist_attack,
                                                       {Self,
                                                        Target,
                                                        AstSkill,
                                                        [],
                                                        0,
                                                        0,
                                                        0,
                                                        PetAssistsShowPassive}),
                    combat_play:add_sub_play(AntiSubPlay);
                {true,
                 AntiAtkDmg,
                 AntiKilled,
                 AntiCrit,
                 AntiSkill,
                 AntiAtkHit} ->
                    {TgtSvc, TgtC, IsAstDie} = case AntiKilled of
                                                   true ->
                                                       {[{hp, 0, 0},
                                                         {anger, 1, -50}],
                                                        [{0, -AntiAtkDmg, 0},
                                                         {9, -50, 0}],
                                                        1};
                                                   false ->
                                                       {[{hp, 1, -AntiAtkDmg}],
                                                        [{0, -AntiAtkDmg, 0}],
                                                        0}
                                               end,
                    combat_cache:u(Tid, TgtSvc),
                    AfterAntiPassive = anti_after_passive(Sid, Target),
                    PetAssistsShowPassive = [{Sid, 85710, 0}],
                    AntiSubPlay =
                        combat_play:gen_sub_skill_play(assist_attack,
                                                       {Self,
                                                        Target,
                                                        AntiSkill,
                                                        TgtC,
                                                        AntiAtkHit,
                                                        AntiCrit,
                                                        IsAstDie,
                                                        AfterAntiPassive ++
                                                            PetAssistsShowPassive}),
                    combat_play:add_sub_play(AntiSubPlay),
                    combat_play:commit_play();
                _ -> skip
            end;
        _ -> false
    end;
assist_attack_play(_Skill, _S, _T, _Ae, _Pe) -> skip.

assist_attack(_Skill,
              SelfPet = #fighter{id = Sid,
                                 special_attr =
                                     #special_attr{assist_atk_skill =
                                                       AssistSkill,
                                                   assist_atk_ratio = Ratio}},
              _Target = #fighter{id = Tid}, _ActionEffect, _Pe) ->
    Target = #fighter{hp = Thp} = combat_cache:f(by_id,
                                                 Tid),
    case util:rand(1, 1000) =< Ratio of
        true when Thp > 0 ->
            logger:debug("协助攻击判定",
                         [],
                         combat_script_skill_calc,
                         1903),
            CSkill = case AssistSkill of
                         {SkillId, SkillLev} ->
                             case combat_script_skill:to_combat_skill({SkillId,
                                                                       SkillLev})
                                 of
                                 AntiCskill = #c_skill{} -> AntiCskill;
                                 _ -> combat_skill:get_default_skill(SelfPet)
                             end;
                         SkillId when is_integer(SkillId) ->
                             case combat_script_skill:to_combat_skill({SkillId,
                                                                       1})
                                 of
                                 AntiCskill = #c_skill{} -> AntiCskill;
                                 _ -> combat_skill:get_default_skill(SelfPet)
                             end;
                         _ -> combat_skill:get_default_skill(SelfPet)
                     end,
            case is_hit(CSkill, SelfPet, Target) of
                true ->
                    logger:debug("协助攻击判定",
                                 [],
                                 combat_script_skill_calc,
                                 1920),
                    combat_play:commit_sub_play(),
                    #passive_effect{suck_hp = PassiveSuck,
                                    crit_ratio = CritRatio} =
                        passive_activate(attack,
                                         filter_passive_skill(SelfPet,
                                                              anti_attack),
                                         filter_passive_skill(SelfPet,
                                                              anti_attack)),
                    {DmgHp, DmgHolyHp, IsCrit, _IsDefence, _BuffDmg} =
                        dmg(anti_attack,
                            CSkill,
                            SelfPet,
                            Target,
                            #action_effect{crit_ratio = CritRatio},
                            #passive_effect{}),
                    logger:debug("伤害计算:~w",
                                 [{DmgHp,
                                   DmgHolyHp,
                                   IsCrit,
                                   _IsDefence,
                                   _BuffDmg}],
                                 combat_script_skill_calc,
                                 1925),
                    Dmg = DmgHp + DmgHolyHp,
                    IsAstAtkKill = Thp =< Dmg,
                    SuckTarget = combat_cache:f(by_id, Tid),
                    SuckSelf = combat_cache:f(by_id, Sid),
                    fun_suck(#action_effect{},
                             {PassiveSuck, undefined, undefined},
                             {0, 0, 0},
                             Dmg,
                             SuckTarget,
                             SuckSelf,
                             CSkill,
                             0),
                    {true, Dmg, IsAstAtkKill, IsCrit, CSkill, 1};
                false ->
                    combat_play:commit_sub_play(),
                    {true, 0, false, 0, CSkill, 0}
            end;
        _ -> false
    end;
assist_attack(_Skill, _Self, _Target, _Ae, _Pe) ->
    false.

calc_pet_protect(S, Target = #fighter{id = Tid}, DmgHp,
                 DmgHolyHp) ->
    case combat_pet:protect_master(S,
                                   Target,
                                   DmgHp,
                                   DmgHolyHp)
        of
        {true, DmgHp1, DmgHolyHp1, PetDmg, PetDmgHoly} ->
            Tpet = #fighter{hp = TpetHp, id = TpetId} =
                       combat_cache:f(by_master_id, Tid),
            LastPetHp = TpetHp - (PetDmg + PetDmgHoly),
            {IsTPetDie, TpetVC, TpetC} = case LastPetHp =< 0 of
                                             true ->
                                                 {1,
                                                  [{hp, 0, 0}],
                                                  [{0,
                                                    -(PetDmg + PetDmgHoly),
                                                    0}]};
                                             false ->
                                                 {0,
                                                  [{hp, 0, LastPetHp}],
                                                  [{0,
                                                    -(PetDmg + PetDmgHoly),
                                                    0}]}
                                         end,
            combat_cache:u(TpetId, TpetVC),
            PetProPlay = combat_play:gen_sub_skill_play(protect,
                                                        {Tpet,
                                                         Target,
                                                         TpetC,
                                                         IsTPetDie,
                                                         []}),
            combat_play:add_sub_play(PetProPlay),
            {1, DmgHp1, DmgHolyHp1};
        {false, DmgHp1, DmgHolyHp1, _PetDmg, _PetDmgHoly} ->
            {0, DmgHp1, DmgHolyHp1}
    end.

calc_protect(_S,
             #fighter{special_status =
                          #special_status{soul_link = undefined},
                      special_attr = #special_attr{protector = undefined}},
             DmgHp, DmgHolyHp) ->
    {0, DmgHp, DmgHolyHp};
calc_protect(_S,
             Target = #fighter{hp = Hp,
                               special_status =
                                   #special_status{soul_link = Soul},
                               special_attr = #special_attr{protector = Prote}},
             DmgHp, DmgHolyHp) ->
    {ProteFlag, DmgHp2, DmgHolyHp2} = case Prote of
                                          {PrtId, _Num, Sratio1} ->
                                              case combat_cache:f(by_id, PrtId)
                                                  of
                                                  Protector1 = #fighter{hp =
                                                                            ProtectHp,
                                                                        is_die =
                                                                            0,
                                                                        is_escape
                                                                            = 0,
                                                                        special_status
                                                                            =
                                                                            #special_status{}} ->
                                                      ProtectDmg1 = round(DmgHp
                                                                              *
                                                                              Sratio1
                                                                              /
                                                                              1000),
                                                      DmgHp1 = DmgHp -
                                                                   ProtectDmg1,
                                                      ProtectHolyDmg1 =
                                                          round(DmgHolyHp *
                                                                    Sratio1
                                                                    / 1000),
                                                      DmgHolyHp1 = DmgHolyHp -
                                                                       ProtectHolyDmg1,
                                                      {NewDmgHp,
                                                       NewDmgHolyHp,
                                                       NewProtectDmg,
                                                       NewProtectHolyDmg} =
                                                          case DmgHp1 +
                                                                   DmgHolyHp1
                                                                   >= Hp
                                                              of
                                                              true ->
                                                                  case DmgHp +
                                                                           DmgHolyHp
                                                                           <
                                                                           ProtectHp
                                                                      of
                                                                      true ->
                                                                          Total =
                                                                              Hp
                                                                                  -
                                                                                  1,
                                                                          case
                                                                              DmgHp1
                                                                                  =/=
                                                                                  0
                                                                                  andalso
                                                                                  DmgHolyHp1
                                                                                      =/=
                                                                                      0
                                                                              of
                                                                              true ->
                                                                                  Ratio =
                                                                                      DmgHp1
                                                                                          /
                                                                                          (DmgHp1
                                                                                               +
                                                                                               DmgHolyHp1),
                                                                                  RtnDmgHp =
                                                                                      round(Total
                                                                                                *
                                                                                                Ratio),
                                                                                  RtnDmgHolyHp =
                                                                                      Total
                                                                                          -
                                                                                          RtnDmgHp,
                                                                                  RtnProtectDmg =
                                                                                      ProtectDmg1
                                                                                          +
                                                                                          DmgHp1
                                                                                          -
                                                                                          RtnDmgHp,
                                                                                  RtnProtectHolyDmp =
                                                                                      ProtectHolyDmg1
                                                                                          +
                                                                                          DmgHolyHp1
                                                                                          -
                                                                                          RtnProtectDmg,
                                                                                  {RtnDmgHp,
                                                                                   RtnDmgHolyHp,
                                                                                   RtnProtectDmg,
                                                                                   RtnProtectHolyDmp};
                                                                              _ ->
                                                                                  case
                                                                                      DmgHolyHp1
                                                                                          =:=
                                                                                          0
                                                                                      of
                                                                                      true ->
                                                                                          {Total,
                                                                                           0,
                                                                                           ProtectDmg1
                                                                                               +
                                                                                               DmgHp1
                                                                                               -
                                                                                               Total,
                                                                                           ProtectHolyDmg1};
                                                                                      false ->
                                                                                          {0,
                                                                                           Total,
                                                                                           ProtectDmg1,
                                                                                           ProtectHolyDmg1
                                                                                               +
                                                                                               DmgHolyHp1
                                                                                               -
                                                                                               Total}
                                                                                  end
                                                                          end;
                                                                      false ->
                                                                          {DmgHp1,
                                                                           DmgHolyHp1,
                                                                           ProtectDmg1,
                                                                           ProtectHolyDmg1}
                                                                  end;
                                                              false ->
                                                                  {DmgHp1,
                                                                   DmgHolyHp1,
                                                                   ProtectDmg1,
                                                                   ProtectHolyDmg1}
                                                          end,
                                                      protect_play(Protector1,
                                                                   NewProtectDmg,
                                                                   NewProtectHolyDmg,
                                                                   Target),
                                                      {1,
                                                       NewDmgHp,
                                                       NewDmgHolyHp};
                                                  _ -> {0, DmgHp, DmgHolyHp}
                                              end;
                                          _ -> {0, DmgHp, DmgHolyHp}
                                      end,
    {ProteFlag1, DmgHp4, DmgHolyHp4} = case Soul of
                                           {Sid2, Sratio2} ->
                                               case combat_cache:f(by_id, Sid2)
                                                   of
                                                   Protector2 = #fighter{is_die
                                                                             =
                                                                             0,
                                                                         is_escape
                                                                             =
                                                                             0} ->
                                                       ProtectDmg2 =
                                                           round(DmgHp2 *
                                                                     Sratio2
                                                                     / 1000),
                                                       DmgHp3 = DmgHp2 -
                                                                    ProtectDmg2,
                                                       ProtectHolyDmg2 =
                                                           round(DmgHolyHp2 *
                                                                     Sratio2
                                                                     / 1000),
                                                       DmgHolyHp3 = DmgHolyHp2 -
                                                                        ProtectHolyDmg2,
                                                       protect_link_play(Protector2,
                                                                         ProtectDmg2,
                                                                         ProtectHolyDmg2,
                                                                         Target),
                                                       {1, DmgHp3, DmgHolyHp3};
                                                   _ ->
                                                       {ProteFlag,
                                                        DmgHp2,
                                                        DmgHolyHp2}
                                               end;
                                           _ -> {ProteFlag, DmgHp2, DmgHolyHp2}
                                       end,
    {ProteFlag1, DmgHp4, DmgHolyHp4}.

protect_play(Protector = #fighter{hp = ProtectHp,
                                  id = ProtectId},
             ProtectDmg, ProtectHolyDmg, Target) ->
    LastProtectHp = ProtectHp -
                        (ProtectDmg + ProtectHolyDmg),
    {IsProtectDie, ProtectVC, ProtectC} = case LastProtectHp
                                                   =< 0
                                              of
                                              true ->
                                                  {1,
                                                   [{hp, 0, 0},
                                                    {anger, 1, -50}],
                                                   [{0,
                                                     -(ProtectDmg +
                                                           ProtectHolyDmg),
                                                     0},
                                                    {9, -50, 0}]};
                                              false ->
                                                  {0,
                                                   [{hp, 0, LastProtectHp}],
                                                   [{0,
                                                     -(ProtectDmg +
                                                           ProtectHolyDmg),
                                                     0}]}
                                          end,
    combat_cache:u(ProtectId, ProtectVC),
    ProtectPlay = combat_play:gen_sub_skill_play(protect,
                                                 {Protector,
                                                  Target,
                                                  ProtectC,
                                                  IsProtectDie,
                                                  []}),
    combat_play:add_sub_play(ProtectPlay).

protect_link_play(Protector = #fighter{hp = ProtectHp,
                                       id = ProtectId},
                  ProtectDmg, ProtectHolyDmg, Target) ->
    LastProtectHp = ProtectHp -
                        (ProtectDmg + ProtectHolyDmg),
    {IsProtectDie, ProtectVC, ProtectC} = case LastProtectHp
                                                   =< 0
                                              of
                                              true ->
                                                  {1,
                                                   [{hp, 0, 0},
                                                    {anger, 1, -50}],
                                                   [{0,
                                                     -(ProtectDmg +
                                                           ProtectHolyDmg),
                                                     0},
                                                    {9, -50, 0}]};
                                              false ->
                                                  {0,
                                                   [{hp, 0, LastProtectHp}],
                                                   [{0,
                                                     -(ProtectDmg +
                                                           ProtectHolyDmg),
                                                     0}]}
                                          end,
    combat_cache:u(ProtectId, ProtectVC),
    ProtectPlay =
        combat_play:gen_sub_skill_play(protect_link,
                                       {Protector,
                                        Target,
                                        ProtectC,
                                        IsProtectDie,
                                        []}),
    combat_play:add_sub_play(ProtectPlay).

passive_die_effect(Self,
                   Target = #fighter{type = Ttype})
    when Ttype =:= 3 ->
    passive_activate(die_master_effect, Target, #fighter{}),
    passive_activate(die_effect, Target, Self),
    #passive_effect{show_passive_skills =
                        ShowPassiveSkills} =
        passive_activate(kill_effect, Self, Target),
    ShowPassiveSkills;
passive_die_effect(Self,
                   Target = #fighter{type = Ttype})
    when Ttype =:= 6 ->
    passive_activate(die_master_effect, Target, #fighter{}),
    #passive_effect{show_passive_skills =
                        ShowPassiveSkills} =
        passive_activate(die_effect, Target, Self),
    ShowPassiveSkills;
passive_die_effect(Self,
                   Target = #fighter{type = Ttype})
    when Ttype =:= 5 ->
    #passive_effect{show_passive_skills =
                        ShowPassiveSkills} =
        passive_activate(die_effect, Target, Self),
    ShowPassiveSkills;
passive_die_effect(Self,
                   Target = #fighter{type = Ttype})
    when Ttype =:= 2 ->
    #passive_effect{show_passive_skills =
                        ShowPassiveSkills} =
        passive_activate(die_effect, Target, Self),
    ShowPassiveSkills;
passive_die_effect(Self,
                   Target = #fighter{type = Ttype})
    when Ttype =:= 1 ->
    #passive_effect{show_passive_skills =
                        ShowPassiveSkills} =
        passive_activate(die_effect, Target, Self),
    ShowPassiveSkills;
passive_die_effect(_, _) -> [].

passive_revive_self(_GhostAtk = 1, _ReviveSelfAtk,
                    _Self,
                    Target = #fighter{id = Tid, type = FighterType,
                                      special_attr =
                                          #special_attr{nirvaning = Nirvaning}})
    when (FighterType =:= 3 orelse
              FighterType =:= 2 orelse FighterType =:= 6)
             andalso Nirvaning =:= 0 ->
    case passive_activate(revive_self_2, #fighter{}, Target)
        of
        #passive_effect{flag = 1} -> ok;
        _ ->
            Tvc = [{has_ghost, 0, 0}, {is_die_disappear, 0, 1}],
            combat_cache:u(Tid, Tvc),
            ok
    end;
passive_revive_self(_GhostAtk, _ReviveSelfAtk = 1,
                    _Self, Target = #fighter{type = FighterType})
    when FighterType =:= 3 orelse
             FighterType =:= 6 orelse FighterType =:= 2 ->
    passive_activate(revive_self_2, #fighter{}, Target),
    ok;
passive_revive_self(_GhostAtk, _ReviveSelfAtk, _Self,
                    Target = #fighter{id = Tid, type = FighterType,
                                      master_fid = MasterFid,
                                      special_attr =
                                          #special_attr{has_ghost = HasGhost,
                                                        has_nirvana =
                                                            HasNirvana,
                                                        nirvaning =
                                                            Nirvaning}}) ->
    case (FighterType =:= 3 orelse FighterType =:= 6)
             andalso MasterFid =:= 0
        of
        true ->
            Tvc = [{has_ghost, 0, 0}, {is_die_disappear, 0, 1}],
            combat_cache:u(Tid, Tvc),
            ok;
        _ ->
            case HasGhost of
                1 ->
                    passive_activate(revive_self_2, #fighter{}, Target),
                    skip;
                0 ->
                    passive_activate(revive_self, #fighter{}, Target),
                    passive_activate(revive_self_2, #fighter{}, Target),
                    IsNirvana = HasNirvana =:= 1 andalso Nirvaning =:= 1,
                    case IsNirvana =:= false of
                        true -> buff_revive_self(Target);
                        false -> ok
                    end
            end
    end.

buff_revive_self(#fighter{id = Fid,
                          attr = #attr{hp_max = HpMax, mp_max = MpMax},
                          special_status =
                              #special_status{buff_revive_self = BuffReviveSelf,
                                              lover_revive_self =
                                                  LoverReviveSelf},
                          buffs = Buffs})
    when BuffReviveSelf =/= undefined orelse
             LoverReviveSelf =/= undefined ->
    Flag = case BuffReviveSelf of
               {Ratio1, HpBase1, HpRatio1, SkillId1} ->
                   case util:rand(1, 1000) =< Ratio1 of
                       true ->
                           case combat_script_skill:to_combat_skill({SkillId1,
                                                                     1})
                               of
                               Cskill1 = #c_skill{} ->
                                   HealHp1 = round(HpMax * HpRatio1 / 1000 +
                                                       HpBase1),
                                   Ae1 = #action_effect{heal_hp = HealHp1},
                                   [ReviveSelf1] =
                                       combat_cache:get_context_elem([#combat_context.revive_self]),
                                   case lists:keymember(Fid, 1, ReviveSelf1) of
                                       true -> false;
                                       _ ->
                                           NewReviveSelf1 = lists:keystore(Fid,
                                                                           1,
                                                                           ReviveSelf1,
                                                                           {Fid,
                                                                            Cskill1,
                                                                            Ae1,
                                                                            []}),
                                           ClearBuff1 = [Buff
                                                         || Buff =
                                                                #c_buff{sec_type
                                                                            =
                                                                            buff_revive_self}
                                                                <- Buffs],
                                           lists:foreach(fun (Buff) ->
                                                                 combat_buff:buff_del(Fid,
                                                                                      Fid,
                                                                                      Buff)
                                                         end,
                                                         ClearBuff1),
                                           combat_cache:save_context([{#combat_context.revive_self,
                                                                       NewReviveSelf1}]),
                                           true
                                   end;
                               _ -> false
                           end;
                       false -> false
                   end;
               #{ratio := Ratio1, hp := HpBase1, hp_ratio := HpRatio1,
                 skill_id := SkillId1, mp := MpBase1,
                 mp_ratio := MpRatio1} ->
                   case util:rand(1, 1000) =< Ratio1 of
                       true ->
                           case combat_script_skill:to_combat_skill({SkillId1,
                                                                     1})
                               of
                               Cskill1 = #c_skill{} ->
                                   HealHp1 = round(HpMax * HpRatio1 / 1000 +
                                                       HpBase1),
                                   AddMp1 = round(MpMax * MpRatio1 / 1000 +
                                                      MpBase1),
                                   {Tvc1, Tc1} = case AddMp1 > 0 of
                                                     true ->
                                                         {[{mp, 1, AddMp1}],
                                                          [{1, AddMp1, 0}]};
                                                     false -> {[], []}
                                                 end,
                                   Ae1 = #action_effect{heal_hp = HealHp1,
                                                        target_val_changes =
                                                            Tvc1,
                                                        target_changes = Tc1},
                                   [ReviveSelf1] =
                                       combat_cache:get_context_elem([#combat_context.revive_self]),
                                   case lists:keymember(Fid, 1, ReviveSelf1) of
                                       true -> false;
                                       _ ->
                                           NewReviveSelf1 = lists:keystore(Fid,
                                                                           1,
                                                                           ReviveSelf1,
                                                                           {Fid,
                                                                            Cskill1,
                                                                            Ae1,
                                                                            []}),
                                           ClearBuff1 = [Buff
                                                         || Buff =
                                                                #c_buff{sec_type
                                                                            =
                                                                            buff_revive_self}
                                                                <- Buffs],
                                           lists:foreach(fun (Buff) ->
                                                                 combat_buff:buff_del(Fid,
                                                                                      Fid,
                                                                                      Buff)
                                                         end,
                                                         ClearBuff1),
                                           combat_cache:save_context([{#combat_context.revive_self,
                                                                       NewReviveSelf1}]),
                                           true
                                   end;
                               _ -> false
                           end;
                       false -> false
                   end;
               _ -> false
           end,
    case Flag of
        false ->
            case LoverReviveSelf of
                {Ratio2, HpBase2, HpRatio2, SkillId2} ->
                    case util:rand(1, 1000) =< Ratio2 of
                        true ->
                            case combat_script_skill:to_combat_skill({SkillId2,
                                                                      1})
                                of
                                Cskill2 = #c_skill{} ->
                                    HealHp2 = round(HpMax * HpRatio2 / 1000 +
                                                        HpBase2),
                                    Ae2 = #action_effect{heal_hp = HealHp2},
                                    [ReviveSelf2] =
                                        combat_cache:get_context_elem([#combat_context.revive_self]),
                                    NewReviveSelf2 = lists:keystore(Fid,
                                                                    1,
                                                                    ReviveSelf2,
                                                                    {Fid,
                                                                     Cskill2,
                                                                     Ae2,
                                                                     []}),
                                    ClearBuff2 = [Buff
                                                  || Buff = #c_buff{sec_type =
                                                                        lover_revive_self}
                                                         <- Buffs],
                                    lists:foreach(fun (Buff) ->
                                                          combat_buff:buff_del(Fid,
                                                                               Fid,
                                                                               Buff)
                                                  end,
                                                  ClearBuff2),
                                    combat_cache:save_context([{#combat_context.revive_self,
                                                                NewReviveSelf2}]),
                                    true;
                                _ -> false
                            end;
                        false -> false
                    end;
                _ -> false
            end;
        _ -> false
    end,
    ok;
buff_revive_self(_) -> ok.

fun_suck_buff(#action_effect{suck_buff =
                                 {Ratio, BuffList}},
              Dmg, Self, _Skill) ->
    Val = round(Dmg * Ratio / 1000),
    case Val > 0 of
        true ->
            NewBuffList = [Buff#c_buff{args = [Val]}
                           || Buff = #c_buff{} <- BuffList],
            lists:foreach(fun (SuckBuff) ->
                                  combat_buff:buff_add(SuckBuff, Self, Self)
                          end,
                          NewBuffList),
            ok;
        false -> ok
    end;
fun_suck_buff(_, _, _, _) -> ok.

fun_dmg_buff(#action_effect{dmg_buff =
                                {Ratio, BuffList}},
             Dmg, BuffDmg, Self, Target) ->
    Dmg1 = max(0, Dmg - BuffDmg),
    Val = round(Dmg1 * Ratio / 1000),
    case Val > 0 of
        true ->
            NewBuffList = [Buff#c_buff{args = [Val]}
                           || Buff = #c_buff{} <- BuffList],
            lists:foreach(fun (DmgBuff) ->
                                  combat_buff:buff_add(DmgBuff, Self, Target)
                          end,
                          NewBuffList),
            ok;
        false -> ok
    end;
fun_dmg_buff(_, _, _, _, _) -> ok.

fun_master_suck(PassiveFun, Dmg,
                Self = #fighter{type = SummonType, name = _Sname,
                                master_pid = MasterPid,
                                attr = #attr{phy_dmg = PhyDmg}},
                #c_skill{act_flag = ActFlag, target_no = TargetNo,
                         skill = #skill{script_id = ScriptId}})
    when SummonType =:= 3 orelse SummonType =:= 6 ->
    SuckHp = calc_master_suck(PassiveFun, Dmg),
    case SuckHp =:= 0 of
        true -> skip;
        false ->
            NewSuckHp = min(SuckHp,
                            round(PhyDmg * 5.99999999999999977796e-1)),
            SuckRatio = calc_suck_ratio(ScriptId,
                                        ActFlag,
                                        TargetNo),
            NewSuckHp1 = round(NewSuckHp * SuckRatio / 1000),
            case combat_cache:f(by_pid, MasterPid) of
                Master = #fighter{name = _Tname, type = Type, id = Tid,
                                  is_escape = 0, is_die = 0}
                    when Type =:= 1 orelse Type =:= 4 ->
                    ok,
                    SuckSvc = [{hp, 1, NewSuckHp1}],
                    SuckSc = [{0, NewSuckHp1, 0}],
                    combat_cache:u(Tid, SuckSvc),
                    SuckPlay = combat_play:gen_sub_skill_play(feedback,
                                                              {Self,
                                                               Master,
                                                               SuckSc,
                                                               0}),
                    combat_play:add_sub_play(SuckPlay);
                _ -> skip
            end
    end;
fun_master_suck(_, _, _, _) -> ok.

fun_mate_suck(FunSuck, Dmg, Self = #fighter{},
              #c_skill{}) ->
    case is_function(FunSuck) of
        true -> FunSuck(Self, Dmg);
        _ -> skip
    end.

calc_master_suck(undefined, _Dmg) -> 0;
calc_master_suck(Fun, Dmg) when is_function(Fun) ->
    Fun(Dmg);
calc_master_suck(_, _) -> 0.

calc_suck_ratio(20059, _ActFlag = last_dmg, TargetNo)
    when TargetNo > 1 ->
    SRatio = math:pow(2.0e-1, TargetNo - 1) * 1000,
    util:check_range(SRatio, 0, 1000);
calc_suck_ratio(_ScriptId, _ActFlag = last_dmg,
                TargetNo)
    when TargetNo > 1 ->
    SRatio = math:pow(2, TargetNo - 1),
    util:check_range(1000 * 1 / SRatio, 0, 1000);
calc_suck_ratio(_, _ActFlag = magic_suck, TargetNo)
    when TargetNo > 1 ->
    SRatio = math:pow(3, TargetNo - 1),
    util:check_range(1000 * 1 / SRatio, 0, 1000);
calc_suck_ratio(_, _, _) -> 1000.

fun_suck(ActionEffect,
         {PassiveFun, PassiveStoneSuck, KillSuck}, PassiveSuckMp,
         Dmg,
         Self = #fighter{type = FighterType, id = Sid,
                         name = _Sname,
                         special_attr =
                             #special_attr{suck_hp = SuckAttr,
                                           suck_times = SuckTimes},
                         base_id = Baseid},
         Target = #fighter{id = Tid, name = _Tname,
                           hp_max = HpMax},
         Skill = #c_skill{act_flag = ActFlag,
                          target_no = TargetNo,
                          skill = #skill{script_id = ScriptId}},
         IsSelfDie) ->
    ValidSuckAttr = case FighterType of
                        1 -> round(SuckAttr / (SuckTimes * SuckTimes));
                        _ -> SuckAttr
                    end,
    logger:debug("吸血比例:~w",
                 [PassiveFun],
                 combat_script_skill_calc,
                 2395),
    SuckHp1 = calc_suck(ActionEffect,
                        PassiveFun + ValidSuckAttr,
                        Dmg),
    {SuckMp1, LossMp} = calc_suck_mp(PassiveSuckMp, Dmg),
    {SuckHp2, SuckMp2} = calc_control_suck(Skill,
                                           Self,
                                           Target),
    SuckHp3 = calc_stone_suck(PassiveStoneSuck,
                              Dmg,
                              Target),
    SuckHp4 = calc_kill_suck(KillSuck, HpMax),
    logger:debug("击杀吸血值：~w",
                 [SuckHp4],
                 combat_script_skill_calc,
                 2401),
    SuckHp = SuckHp1 + SuckHp2 + SuckHp3 + SuckHp4,
    SuckMp = SuckMp1 + SuckMp2,
    case SuckHp =:= 0 andalso
             SuckMp =:= 0 andalso LossMp =:= 0
        of
        true -> skip;
        false ->
            SuckRatio = calc_suck_ratio(ScriptId,
                                        ActFlag,
                                        TargetNo),
            NewSuckHp = round(SuckHp * SuckRatio / 1000),
            NewSuckHp2 = calc_alice_suck(Baseid,
                                         ActionEffect,
                                         NewSuckHp),
            SuckSvc = [{hp, 1, NewSuckHp2},
                       {mp, 1, SuckMp},
                       {suck_times, 1, 1}],
            SuckSc = [{0, NewSuckHp2, 0}, {1, SuckMp, 0}],
            Tvc = [{mp, 1, -LossMp}],
            Tc = [{1, -LossMp, 0}],
            combat_cache:u(Sid, SuckSvc),
            combat_cache:u(Tid, Tvc),
            SuckPlay = combat_play:gen_sub_skill_play(feedback,
                                                      {Target,
                                                       Self,
                                                       Tc,
                                                       SuckSc,
                                                       IsSelfDie,
                                                       []}),
            combat_play:add_sub_play(SuckPlay)
    end.

calc_suck(#action_effect{suck_hp = SuckRatio1,
                         crit_suck_hp = CritSuckHp},
          SuckRatio2, Dmg) ->
    SuckRatio = max(0, SuckRatio1) + max(0, SuckRatio2) +
                    max(0, CritSuckHp),
    Val = round(SuckRatio * Dmg / 1000),
    Val;
calc_suck(_, _, _) -> 0.

calc_stone_suck({SuckRatio, ControlSuckRatio}, Dmg,
                #fighter{special_status =
                             #special_status{is_stone = IsStone}}) ->
    Val = case IsStone of
              1 -> round(ControlSuckRatio * Dmg / 1000);
              _ -> round(SuckRatio * Dmg / 1000)
          end,
    Val;
calc_stone_suck(_, _, _) -> 0.

calc_suck_mp({LossRatio, SuckRatio, MaxVal}, Dmg)
    when LossRatio > 0 ->
    LossVal = min(MaxVal, round(LossRatio * Dmg / 1000)),
    SuckVal = round(LossVal * SuckRatio / 1000),
    {SuckVal, LossVal};
calc_suck_mp(_, _) -> {0, 0}.

calc_control_suck(#c_skill{special_type = SpecialType},
                  _Self = #fighter{hp_max = HpMax, mp_max = MpMax},
                  _Target = #fighter{special_status =
                                         #special_status{is_seal = IsSeal,
                                                         is_silent = IsSilent,
                                                         is_taunt = IsTaunt,
                                                         is_chaos = IsChaos,
                                                         is_stun = IsStun,
                                                         is_sleep = IsSleep,
                                                         is_stone =
                                                             IsStone}}) ->
    case lists:member(suck_control, SpecialType) of
        true ->
            case IsSeal =:= 1 orelse
                     IsSilent =:= 1 orelse
                         IsTaunt =:= 1 orelse
                             IsChaos =:= 1 orelse
                                 IsStun =:= 1 orelse
                                     IsSleep =:= 1 orelse IsStone =:= 1
                of
                true ->
                    {round(HpMax * 50 / 1000), round(MpMax * 50 / 1000)};
                false -> {0, 0}
            end;
        false -> {0, 0}
    end.

calc_kill_suck(SuckRatio, HpMax)
    when is_integer(SuckRatio) ->
    round(SuckRatio * HpMax / 1000);
calc_kill_suck(_, _) -> 0.

calc_alice_suck(20018,
                #action_effect{alice_suck_max = SuckMax}, SuckHp) ->
    min(SuckMax, SuckHp);
calc_alice_suck(_, _, S) -> S.

feedback_attack(_, _, _,
                #action_effect{can_feedback = 0}, _, _) ->
    false;
feedback_attack(#fighter{},
                #fighter{special_attr =
                             #special_attr{can_feedback = 0}},
                _, _, _, _) ->
    false;
feedback_attack(_Target = #fighter{name = _Tname,
                                   id = Tid},
                _Self = #fighter{id = Sid, name = _Sname},
                _Skill = #c_skill{}, _Ae,
                #passive_effect{feedback = FeedBack1}, Dmg) ->
    #fighter{combat_dynamic_attr =
                 #combat_dynamic_attr{feedback = FeedBack2}} =
        combat_cache:f(by_id, Tid),
    #fighter{hp = Shp} = combat_cache:f(by_id, Sid),
    FeedBack = max(FeedBack1, FeedBack2),
    case FeedBack > 0 of
        true ->
            FeedBackDmg = round(Dmg * FeedBack / 1000),
            IsFeedBackKill = Shp =< FeedBackDmg,
            {true, IsFeedBackKill, FeedBackDmg};
        false -> false
    end.

calc_shield(DmgHpBeforeAbsorb, DmgHolyHpBeforeAbsorb,
            TSAttr = #special_attr{absorb_dmg = 0,
                                   magic_absorb_dmg = 0, absorb_shield = 0,
                                   absorb_order = 0, absorb_shield_type = 0},
            _ElemType, _Sid, _Tid, _TbuffList) ->
    {[], DmgHpBeforeAbsorb, DmgHolyHpBeforeAbsorb, TSAttr};
calc_shield(DmgHpBeforeAbsorb, DmgHolyHpBeforeAbsorb,
            TSAttr = #special_attr{absorb_shield_type = ShieldType,
                                   absorb_shield = ShieldNum,
                                   absorb_shield_suck = SuckRatio,
                                   absorb_order = AbsorbOrder,
                                   absorb_dmg = AbsorbDmg,
                                   magic_absorb_dmg = MagicAbsorbDmg,
                                   round_hurt = RoundHurt,
                                   elem_dmg_absorb = ElemDmgAbsorb},
            ElemType, _Sid, _Tid, _TbuffList)
    when DmgHpBeforeAbsorb >= 0 andalso
             DmgHolyHpBeforeAbsorb >= 0 ->
    NowOrder = combat_play:get_order(),
    CheckFlag = case ShieldNum > 0 of
                    true -> true;
                    false ->
                        case ShieldType of
                            1 -> true;
                            _ -> NowOrder =:= AbsorbOrder
                        end
                end,
    logger:debug("触发吸收护盾:~w",
                 [{NowOrder, AbsorbOrder, CheckFlag}],
                 combat_script_skill_calc,
                 2532),
    case CheckFlag of
        true ->
            {NewShieldNum, SetOrder, NewShieldType} = case
                                                          ShieldType
                                                          of
                                                          1 ->
                                                              {max(0,
                                                                   ShieldNum -
                                                                       1),
                                                               0,
                                                               0};
                                                          _ ->
                                                              _ShieldNum = case
                                                                               NowOrder
                                                                                   =:=
                                                                                   AbsorbOrder
                                                                               of
                                                                               true ->
                                                                                   ShieldNum;
                                                                               false ->
                                                                                   max(0,
                                                                                       ShieldNum
                                                                                           -
                                                                                           1)
                                                                           end,
                                                              {_ShieldNum,
                                                               NowOrder,
                                                               ShieldType}
                                                      end,
            logger:debug("触发吸收护盾:~w",
                         [{NowOrder,
                           AbsorbOrder,
                           ShieldType,
                           CheckFlag,
                           NewShieldNum}],
                         combat_script_skill_calc,
                         2546),
            AllDmg = DmgHpBeforeAbsorb + DmgHolyHpBeforeAbsorb,
            DmgAbsorb = case SuckRatio > 0 of
                            true -> round(AllDmg * SuckRatio / 1000);
                            false -> 0
                        end,
            AbsorbTc = [{4, AllDmg, 0}],
            {AbsorbTc,
             0,
             0,
             TSAttr#special_attr{absorb_shield = NewShieldNum,
                                 absorb_order = SetOrder,
                                 round_hurt = RoundHurt + AllDmg,
                                 absorb_shield_type = NewShieldType,
                                 elem_dmg_absorb = ElemDmgAbsorb + DmgAbsorb}};
        false ->
            NewAbsorbDmg = case ElemType of
                               1 -> AbsorbDmg + MagicAbsorbDmg;
                               _ -> AbsorbDmg
                           end,
            case NewAbsorbDmg > 0 of
                true ->
                    {DmgHpBeforeAbsorb1,
                     DmgHolyHpBeforeAbsorb1,
                     NewMagicAbsorbDmg} =
                        case ElemType of
                            1 ->
                                calc_absorb_shield(DmgHpBeforeAbsorb,
                                                   DmgHolyHpBeforeAbsorb,
                                                   MagicAbsorbDmg);
                            _ ->
                                {DmgHpBeforeAbsorb,
                                 DmgHolyHpBeforeAbsorb,
                                 MagicAbsorbDmg}
                        end,
                    {DmgHpAfterAbsorb, DmgHolyHpAfterAbsorb, AbsorbDmg22} =
                        calc_absorb_shield(DmgHpBeforeAbsorb1,
                                           DmgHolyHpBeforeAbsorb1,
                                           AbsorbDmg),
                    ok,
                    AbsorbPlay = [{4, AbsorbDmg - AbsorbDmg22, 0}],
                    {AbsorbPlay,
                     DmgHpAfterAbsorb,
                     DmgHolyHpAfterAbsorb,
                     TSAttr#special_attr{absorb_dmg = AbsorbDmg22,
                                         magic_absorb_dmg = NewMagicAbsorbDmg,
                                         round_hurt =
                                             RoundHurt +
                                                 (AbsorbDmg - AbsorbDmg22)}};
                false ->
                    {[], DmgHpBeforeAbsorb, DmgHolyHpBeforeAbsorb, TSAttr}
            end
    end;
calc_shield(DmgHpBeforeAbsorb, DmgHolyHpBeforeAbsorb,
            TSAttr, _ElemType, _Sid, _Tid, _TbuffList) ->
    {[], DmgHpBeforeAbsorb, DmgHolyHpBeforeAbsorb, TSAttr}.

calc_absorb_shield(Dmg, HolyDmg, Absorb) ->
    NewDmg = max(Dmg - Absorb, 0),
    Absorb1 = max(Absorb - Dmg, 0),
    NewHolyDmg = max(HolyDmg - Absorb1, 0),
    Absorb2 = max(Absorb1 - HolyDmg, 0),
    NewAbsorb = Absorb2,
    {NewDmg, NewHolyDmg, NewAbsorb}.

calc_rebound(_Skill, DmgHpBeforeAbsorb,
             DmgHolyHpBeforeAbsorb,
             TSAttr = #special_attr{rebound_times = 0}, _Sid, _Tid,
             _TbuffList) ->
    {[],
     [],
     [],
     DmgHpBeforeAbsorb,
     DmgHolyHpBeforeAbsorb,
     TSAttr};
calc_rebound(#c_skill{skill =
                          #skill{elem_type = ElemType}},
             DmgHpBeforeAbsorb, DmgHolyHpBeforeAbsorb,
             TSAttr = #special_attr{rebound_times = ReboundTimes,
                                    rebound_dmg_ratio = ReboundDmgRatio,
                                    rebound_type = ReboundType},
             Sid, Tid, _TbuffList)
    when ReboundTimes > 0 andalso
             ElemType =:= ReboundType ->
    NewShieldNum = max(0, ReboundTimes - 1),
    Target = #fighter{hp_max = MaxTHp} =
                 combat_cache:f(by_id, Tid),
    Self = #fighter{hp = Shp} = combat_cache:f(by_id, Sid),
    AllDmg = round(min(DmgHpBeforeAbsorb +
                           DmgHolyHpBeforeAbsorb,
                       MaxTHp)),
    ReboundTc = [{4, AllDmg, 0}],
    ReboundDmg = round(AllDmg * ReboundDmgRatio / 1000),
    logger:debug("反弹伤害为:~w",
                 [{ReboundDmg, ReboundDmgRatio}],
                 combat_script_skill_calc,
                 2617),
    IsFeedBackKill = ReboundDmg >= Shp,
    {ReboundSvc, ReboundSc, IsReboundDie} = case
                                                IsFeedBackKill
                                                of
                                                true ->
                                                    {[{hp, 0, 0},
                                                      {anger, 1, -50}],
                                                     [{0, -ReboundDmg, 0},
                                                      {9, -50, 0}],
                                                     1};
                                                false when ReboundDmg > 0 ->
                                                    {[{hp, 1, -ReboundDmg}],
                                                     [{0, -ReboundDmg, 0}],
                                                     0};
                                                _ -> {[], [], 0}
                                            end,
    combat_cache:u(Sid, ReboundSvc),
    AfterFeedPassive = anti_after_passive(Sid, #fighter{}),
    case ReboundSc of
        [_ | _] ->
            FeedSubPlay = combat_play:gen_sub_skill_play(feedback,
                                                         {Target,
                                                          Self,
                                                          ReboundSc,
                                                          IsReboundDie,
                                                          AfterFeedPassive}),
            combat_play:add_sub_play(FeedSubPlay);
        _ -> ok
    end,
    NewTSAttr = TSAttr#special_attr{rebound_times =
                                        NewShieldNum},
    {ReboundTc, [], [], 0, 0, NewTSAttr};
calc_rebound(_Skill, DmgHpBeforeAbsorb,
             DmgHolyHpBeforeAbsorb, TSAttr, _Sid, _Tid,
             _TbuffList) ->
    {[],
     [],
     [],
     DmgHpBeforeAbsorb,
     DmgHolyHpBeforeAbsorb,
     TSAttr}.

passive_activate(Flag, Self, Target) ->
    passive_activate(Flag, Self, Target, {[], []}).

passive_activate(Flag,
                 Self = #fighter{name = _SelfName,
                                 passive_skills = SelfPassiveSkills},
                 Target = #fighter{name = _TargetName,
                                   passive_skills = TargetPassiveSkills},
                 {CanNotActType, ExtArgs}) ->
    CheckSelfPassive = [Skill
                        || Skill = #c_skill{act_flag = ActFlag}
                               <- SelfPassiveSkills,
                           lists:member(ActFlag, CanNotActType) =:= false],
    CheckTargetPassive = [Skill
                          || Skill = #c_skill{act_flag = ActFlag}
                                 <- TargetPassiveSkills,
                             lists:member(ActFlag, CanNotActType) =:= false],
    case Flag of
        attack ->
            SelfPassiveSkills1 = [Skill
                                  || Skill = #c_skill{passive_type = Type}
                                         <- CheckSelfPassive,
                                     lists:member(1, Type)],
            TargetPassiveSkills1 = [Skill
                                    || Skill = #c_skill{passive_type = Type}
                                           <- CheckTargetPassive,
                                       lists:member(2, Type)],
            passive_activate(Flag,
                             SelfPassiveSkills1,
                             TargetPassiveSkills1,
                             Self,
                             Target,
                             #passive_effect{ext_args = ExtArgs});
        attack_after ->
            SelfPassiveSkills1 = [Skill
                                  || Skill = #c_skill{passive_type = Type}
                                         <- CheckSelfPassive,
                                     lists:member(3, Type)],
            TargetPassiveSkills1 = [Skill
                                    || Skill = #c_skill{passive_type = Type}
                                           <- CheckTargetPassive,
                                       lists:member(4, Type)],
            passive_activate(Flag,
                             SelfPassiveSkills1,
                             TargetPassiveSkills1,
                             Self,
                             Target,
                             #passive_effect{});
        attack_after_2 ->
            SelfPassiveSkills1 = [Skill
                                  || Skill = #c_skill{passive_type = Type}
                                         <- CheckSelfPassive,
                                     lists:member(18, Type)],
            passive_activate(Flag,
                             SelfPassiveSkills1,
                             [],
                             Self,
                             Target,
                             #passive_effect{});
        action_end ->
            SelfPassiveSkills1 = [Skill
                                  || Skill = #c_skill{passive_type = Type}
                                         <- CheckSelfPassive,
                                     lists:member(23, Type)],
            passive_activate(Flag,
                             SelfPassiveSkills1,
                             [],
                             Self,
                             Target,
                             #passive_effect{});
        anti_after ->
            SelfPassiveSkills1 = [Skill
                                  || Skill = #c_skill{passive_type = Type}
                                         <- CheckSelfPassive,
                                     lists:member(4, Type)],
            TargetPassiveSkills1 = [Skill
                                    || Skill = #c_skill{passive_type = Type}
                                           <- CheckTargetPassive,
                                       lists:member(113, Type)],
            passive_activate(Flag,
                             SelfPassiveSkills1,
                             TargetPassiveSkills1,
                             Self,
                             Target,
                             #passive_effect{});
        revive_self ->
            TargetPassiveSkills1 = [Skill
                                    || Skill = #c_skill{passive_type = Type}
                                           <- CheckTargetPassive,
                                       lists:member(8, Type)],
            passive_activate(Flag,
                             [],
                             TargetPassiveSkills1,
                             Self,
                             Target,
                             #passive_effect{});
        revive_self_2 ->
            TargetPassiveSkills1 = [Skill
                                    || Skill = #c_skill{passive_type = Type}
                                           <- CheckTargetPassive,
                                       lists:member(22, Type)],
            passive_activate(Flag,
                             [],
                             TargetPassiveSkills1,
                             Self,
                             Target,
                             #passive_effect{});
        dodge ->
            SelfPassiveSkills1 = [Skill
                                  || Skill = #c_skill{passive_type = Type}
                                         <- CheckSelfPassive,
                                     lists:member(104, Type)],
            TargetPassiveSkills1 = [Skill
                                    || Skill = #c_skill{passive_type = Type}
                                           <- CheckTargetPassive,
                                       lists:member(111, Type)],
            passive_activate(Flag,
                             SelfPassiveSkills1,
                             TargetPassiveSkills1,
                             Self,
                             Target,
                             #passive_effect{});
        buff_miss ->
            SelfPassiveSkills1 = [Skill
                                  || Skill = #c_skill{passive_type = Type}
                                         <- CheckSelfPassive,
                                     lists:member(109, Type)],
            passive_activate(Flag,
                             SelfPassiveSkills1,
                             [],
                             Self,
                             Target,
                             #passive_effect{});
        heal ->
            SelfPassiveSkills1 = [Skill
                                  || Skill = #c_skill{passive_type = Type}
                                         <- CheckSelfPassive,
                                     lists:member(106, Type)],
            passive_activate(Flag,
                             SelfPassiveSkills1,
                             [],
                             Self,
                             Target,
                             #passive_effect{ext_args = ExtArgs});
        eff_heal ->
            TargetPassiveSkills1 = [Skill
                                    || Skill = #c_skill{passive_type = Type}
                                           <- CheckTargetPassive,
                                       lists:member(112, Type)],
            passive_activate(Flag,
                             [],
                             TargetPassiveSkills1,
                             Self,
                             Target,
                             #passive_effect{ext_args = ExtArgs});
        dispel ->
            SelfPassiveSkills1 = [Skill
                                  || Skill = #c_skill{passive_type = Type}
                                         <- CheckSelfPassive,
                                     lists:member(105, Type)],
            passive_activate(Flag,
                             SelfPassiveSkills1,
                             [],
                             Self,
                             Target,
                             #passive_effect{});
        die_master_effect ->
            SelfPassiveSkills1 = [Skill
                                  || Skill = #c_skill{passive_type = Type}
                                         <- CheckSelfPassive,
                                     lists:member(107, Type)],
            passive_activate(Flag,
                             SelfPassiveSkills1,
                             [],
                             Self,
                             Target,
                             #passive_effect{});
        die_effect ->
            SelfPassiveSkills1 = [Skill
                                  || Skill = #c_skill{passive_type = Type}
                                         <- CheckSelfPassive,
                                     lists:member(114, Type)],
            passive_activate(Flag,
                             SelfPassiveSkills1,
                             [],
                             Self,
                             Target,
                             #passive_effect{});
        kill_effect ->
            SelfPassiveSkills1 = [Skill
                                  || Skill = #c_skill{passive_type = Type}
                                         <- CheckSelfPassive,
                                     lists:member(115, Type)],
            passive_activate(Flag,
                             SelfPassiveSkills1,
                             [],
                             Self,
                             Target,
                             #passive_effect{});
        pre_action ->
            SelfPassiveSkills1 = [Skill
                                  || Skill = #c_skill{passive_type = Type}
                                         <- CheckSelfPassive,
                                     lists:member(5, Type)],
            passive_activate(Flag,
                             SelfPassiveSkills1,
                             [],
                             Self,
                             Target,
                             #passive_effect{});
        mount_pre_action ->
            SelfPassiveSkills1 = [Skill
                                  || Skill = #c_skill{passive_type = Type}
                                         <- CheckSelfPassive,
                                     lists:member(110, Type)],
            passive_activate(Flag,
                             SelfPassiveSkills1,
                             [],
                             Self,
                             Target,
                             #passive_effect{});
        die ->
            SelfPassiveSkills1 = [Skill
                                  || Skill = #c_skill{passive_type = Type}
                                         <- CheckSelfPassive,
                                     lists:member(10, Type)],
            passive_activate(Flag,
                             SelfPassiveSkills1,
                             [],
                             Self,
                             Target,
                             #passive_effect{});
        talent ->
            SelfPassiveSkills1 = [Skill
                                  || Skill = #c_skill{passive_type = Type}
                                         <- CheckSelfPassive,
                                     lists:member(11, Type)],
            passive_activate(Flag,
                             SelfPassiveSkills1,
                             [],
                             Self,
                             Target,
                             #passive_effect{});
        pet_effect ->
            SelfPassiveSkills1 = [Skill
                                  || Skill = #c_skill{passive_type = Type}
                                         <- CheckSelfPassive,
                                     lists:member(103, Type)],
            passive_activate(Flag,
                             SelfPassiveSkills1,
                             [],
                             Self,
                             Target,
                             #passive_effect{});
        init ->
            SelfPassiveSkills1 = [Skill
                                  || Skill = #c_skill{passive_type = Type}
                                         <- CheckSelfPassive,
                                     lists:member(100, Type)],
            passive_activate(Flag,
                             SelfPassiveSkills1,
                             [],
                             Self,
                             Target,
                             #passive_effect{});
        round ->
            SelfPassiveSkills1 = [Skill
                                  || Skill = #c_skill{passive_type = Type}
                                         <- CheckSelfPassive,
                                     lists:member(102, Type)],
            passive_activate(Flag,
                             SelfPassiveSkills1,
                             [],
                             Self,
                             Target,
                             #passive_effect{ext_args = ExtArgs});
        kill ->
            SelfPassiveSkills1 = [Skill
                                  || Skill = #c_skill{passive_type = Type}
                                         <- CheckSelfPassive,
                                     lists:member(9, Type)],
            passive_activate(Flag,
                             SelfPassiveSkills1,
                             [],
                             Self,
                             Target,
                             #passive_effect{});
        pet_init ->
            SelfPassiveSkills1 = [Skill
                                  || Skill = #c_skill{passive_type = Type}
                                         <- CheckSelfPassive,
                                     lists:member(13, Type)],
            passive_activate(Flag,
                             SelfPassiveSkills1,
                             [],
                             Self,
                             Target,
                             #passive_effect{});
        wave ->
            SelfPassiveSkills1 = [Skill
                                  || Skill = #c_skill{passive_type = Type}
                                         <- CheckSelfPassive,
                                     lists:member(108, Type)],
            passive_activate(Flag,
                             SelfPassiveSkills1,
                             [],
                             Self,
                             Target,
                             #passive_effect{});
        nirvana ->
            TargetPassiveSkills1 = [Skill
                                    || Skill = #c_skill{passive_type = Type}
                                           <- CheckTargetPassive,
                                       lists:member(16, Type)],
            passive_activate(Flag,
                             [],
                             TargetPassiveSkills1,
                             Self,
                             Target,
                             #passive_effect{});
        exec_defence ->
            TargetPassiveSkills1 = [Skill
                                    || Skill = #c_skill{passive_type = Type}
                                           <- CheckSelfPassive,
                                       lists:member(19, Type)],
            passive_activate(Flag,
                             [],
                             TargetPassiveSkills1,
                             Self,
                             Target,
                             #passive_effect{});
        master_die ->
            TargetPassiveSkills1 = [Skill
                                    || Skill = #c_skill{passive_type = Type}
                                           <- CheckSelfPassive,
                                       lists:member(24, Type)],
            passive_activate(Flag,
                             [],
                             TargetPassiveSkills1,
                             Self,
                             Target,
                             #passive_effect{});
        buff_calc ->
            SelfPassiveSkills1 = [Skill
                                  || Skill = #c_skill{passive_type = Type}
                                         <- CheckSelfPassive,
                                     lists:member(24, Type)],
            passive_activate(Flag,
                             [],
                             SelfPassiveSkills1,
                             Self,
                             Target,
                             #passive_effect{});
        _ -> #passive_effect{}
    end.

passive_activate(_Flag, [], [], _, _, Result) -> Result;
passive_activate(Flag,
                 [#c_skill{id = _Id, action = undefined} | T],
                 TargetPassiveSkills, Self, Target, Result) ->
    logger:error("技能[~w]的脚本为空",
                 [_Id],
                 combat_script_skill_calc,
                 2836),
    passive_activate(Flag,
                     T,
                     TargetPassiveSkills,
                     Self,
                     Target,
                     Result);
passive_activate(Flag,
                 [Skill = #c_skill{id = _Id, action = Action} | T],
                 TargetPassiveSkills, Self, Target, Result) ->
    ConflictList = Result#passive_effect.conflict_list,
    ExtArgs = Result#passive_effect.ext_args,
    SkillAddtArg = #c_skill_addt_arg{conflict_list =
                                         ConflictList,
                                     passive_flag = Flag, ext_args = ExtArgs},
    Pe = combat_util:run(Action,
                         [Skill, Self, Target, SkillAddtArg]),
    Result1 = merge_passive_effect(Pe, Result),
    passive_activate(Flag,
                     T,
                     TargetPassiveSkills,
                     Self,
                     Target,
                     Result1);
passive_activate(Flag, [],
                 [Skill = #c_skill{id = _Id, action = Action} | T], Self,
                 Target, Result) ->
    Flag1 = case Flag of
                attack -> defence;
                attack_after -> defence_after;
                _ -> Flag
            end,
    ExtArgs = Result#passive_effect.ext_args,
    SkillAddtArg = #c_skill_addt_arg{passive_flag = Flag1,
                                     ext_args = ExtArgs},
    Pe = #passive_effect{buff_self_to_self = BuffSelf,
                         buff_self_to_target = BuffTarget,
                         self_val_changed = Svc, self_changed = Sc,
                         target_val_changed = Tvc, target_changed = Tc} =
             combat_util:run(Action,
                             [Skill, Target, Self, SkillAddtArg]),
    Pe1 = Pe#passive_effect{buff_target_to_target =
                                BuffSelf,
                            buff_target_to_self = BuffTarget,
                            buff_self_to_self = [], buff_self_to_target = [],
                            self_val_changed = Tvc, self_changed = Tc,
                            target_val_changed = Svc, target_changed = Sc},
    Result1 = merge_passive_effect(Pe1, Result),
    passive_activate(Flag, [], T, Self, Target, Result1).

merge_passive_effect(Pe1, Pe2)
    when is_record(Pe1, passive_effect) andalso
             is_record(Pe2, passive_effect) ->
    Size = erlang:tuple_size(Pe1),
    merge_passive_effect(2,
                         Size,
                         Pe1,
                         Pe2,
                         #passive_effect{});
merge_passive_effect(Pe1, Pe2) ->
    logger:error("无法合并被动技能效果:Pe1=~w, Pe2=~w",
                 [Pe1, Pe2],
                 combat_script_skill_calc,
                 2868),
    #passive_effect{}.

merge_passive_effect(N, N, Pe1, Pe2, Result) ->
    Val1 = erlang:element(N, Pe1),
    Val2 = erlang:element(N, Pe2),
    Val = do_merge_effect(Val1, Val2),
    erlang:setelement(N, Result, Val);
merge_passive_effect(M, N, Pe1, Pe2, Result)
    when M < N ->
    Val1 = erlang:element(M, Pe1),
    Val2 = erlang:element(M, Pe2),
    Val = do_merge_effect(Val1, Val2),
    Result1 = erlang:setelement(M, Result, Val),
    merge_passive_effect(M + 1, N, Pe1, Pe2, Result1).

do_merge_effect(Val1, Val2) ->
    if is_number(Val1) andalso is_number(Val2) ->
           Val1 + Val2;
       is_list(Val1) andalso is_list(Val2) -> Val1 ++ Val2;
       is_function(Val1) -> Val1;
       is_function(Val2) -> Val2;
       is_tuple(Val1) -> Val1;
       is_tuple(Val2) -> Val2;
       Val1 =:= undefined andalso Val2 =:= undefined ->
           undefined;
       true ->
           logger:error("被动技能效果~w与~w无法叠加:~w",
                        [Val1, Val2, util:get_stacktrace()],
                        combat_script_skill_calc,
                        2899),
           Val1
    end.

calc_max_dmg(#fighter{unit_fun_type = 3},
             #fighter{hp_max = HpMax, type = Type}, DmgTotal)
    when Type =/= 2 ->
    HpLimit = round(HpMax * 150 / 1000),
    min(DmgTotal, HpLimit);
calc_max_dmg(_, _, DmgTotal) -> DmgTotal.

calc_base_dmg(BaseHurt, _, _) -> BaseHurt.

check_skill_act(#c_skill{pursue_attack = IsPursue,
                         act_flag = ActFlag, ext_args = ExtArgs}) ->
    CanNot1 = case IsPursue of
                  1 -> [more_attack];
                  _ -> []
              end,
    CanNot2 = case ActFlag of
                  pursue -> [pursue];
                  _ -> []
              end,
    {CanNot1 ++ CanNot2, ExtArgs}.

filter_passive_skill(Fighter = #fighter{name = _Name,
                                        passive_skills = PassiveSkills},
                     AllowSpecialType) ->
    NewPassiveSkills = [Skill
                        || Skill = #c_skill{special_type = SpecialType}
                               <- PassiveSkills,
                           lists:member(AllowSpecialType, SpecialType) =:=
                               true],
    case AllowSpecialType of
        anti_attack ->
            logger:debug("Name~w反击技能:~w",
                         [_Name, NewPassiveSkills],
                         combat_script_skill_calc,
                         2944);
        _ -> ok
    end,
    Fighter#fighter{passive_skills = NewPassiveSkills}.

check_save_skill_dmg(#c_skill{target_no = TargetNo,
                              skill = #skill{script_id = ScriptId}}) ->
    case ScriptId of
        20059 -> TargetNo =< 1;
        20074 -> TargetNo =< 1;
        _ -> true
    end;
check_save_skill_dmg(_) -> true.

calc_talisman_rival(attack, Self, Target) ->
    {SelfDmgRatio, _, _, _} = calc_talisman_rival(Self,
                                                  Target),
    {_, TargetDefRatio, _, _} = calc_talisman_rival(Target,
                                                    Self),
    {SelfDmgRatio, TargetDefRatio};
calc_talisman_rival(buff, Self, Target) ->
    {_, _, SelfEnhanceControl, _} =
        calc_talisman_rival(Self, Target),
    {_, _, _, TargetAntiControl} =
        calc_talisman_rival(Target, Self),
    {SelfEnhanceControl, TargetAntiControl};
calc_talisman_rival(_Flag, Self, Target) ->
    calc_talisman_rival(Self, Target).

calc_talisman_rival(_Self = #fighter{talisman =
                                         LeftTalisman},
                    _Target = #fighter{talisman = RightTalisman}) ->
    Fun = fun (LSetPos = {Pos, SetId}, Rtn) ->
                  case talisman_data:get_rival_set(LSetPos) of
                      #{rival_list := LRivalList = [_ | _]} ->
                          case [{RPos, RSetId}
                                || {RPos, RSetId} <- RightTalisman,
                                   lists:member(RSetId, LRivalList)]
                              of
                              [{RPos, RSetId} | _] ->
                                  TalismanAdd = rival_talisman_attr({Pos,
                                                                     SetId},
                                                                    {RPos,
                                                                     RSetId}),
                                  merge_talisman_attr(Rtn, TalismanAdd);
                              _ -> Rtn
                          end;
                      _ -> Rtn
                  end
          end,
    lists:foldl(Fun, {0, 0, 0, 0}, LeftTalisman).

merge_talisman_attr({LDmgRatio,
                     LDefRatio,
                     LEnhanceControl,
                     LAntiControl},
                    {LDmgRatioAdd,
                     LDefRatioAdd,
                     LEnhanceControlAdd,
                     LAntiControlAdd}) ->
    {LDmgRatio + LDmgRatioAdd,
     LDefRatio + LDefRatioAdd,
     LEnhanceControl + LEnhanceControlAdd,
     LAntiControl + LAntiControlAdd}.

rival_talisman_attr(LSetPos, {_, RSetId}) ->
    case talisman_data:get_rival_set(LSetPos) of
        #{rival_list := LRivalList = [_ | _],
          dmg_ratio := LDmgRatio, def_ratio := LDefRatio,
          enhance_control := LEnhanceControl,
          anti_control := LAntiControl} ->
            case lists:member(RSetId, LRivalList) of
                true ->
                    {LDmgRatio, LDefRatio, LEnhanceControl, LAntiControl};
                _ -> {0, 0, 0, 0}
            end;
        _ -> {0, 0, 0, 0}
    end.

calc_self_anger(#c_skill{skill =
                             #skill{script_id = 10001}},
                _) ->
    {[], []};
calc_self_anger(#c_skill{skill =
                             #skill{script_id = 10002}},
                _) ->
    {[], []};
calc_self_anger(#c_skill{skill =
                             #skill{script_id = 10003}},
                _) ->
    {[], []};
calc_self_anger(#c_skill{skill =
                             #skill{script_id = 10004}},
                _) ->
    {[], []};
calc_self_anger(#c_skill{skill =
                             #skill{script_id = 10005}},
                _) ->
    {[], []};
calc_self_anger(#c_skill{skill =
                             #skill{script_id = 10006}},
                _) ->
    {[], []};
calc_self_anger(#c_skill{skill =
                             #skill{script_id = 10008}},
                _) ->
    {[], []};
calc_self_anger(#c_skill{skill =
                             #skill{script_id = 10009}},
                _) ->
    {[], []};
calc_self_anger(Skill = #c_skill{pursue_attack = 0,
                                 action_no = ActionNo, target_no = TargetNo,
                                 skill = #skill{type = Type}},
                #fighter{type = 1})
    when ActionNo =< 1 andalso TargetNo =< 1 ->
    case
        combat_cache:get_context_elem([#combat_context.is_passive_attack])
        of
        [true] -> {[], []};
        _ ->
            case is_anger_skill(Skill) orelse Type =:= 4 of
                true -> {[], []};
                _ -> {[{anger, 1, 2}], [{9, 2, 0}]}
            end
    end;
calc_self_anger(_, _) -> {[], []}.

calc_buff_reduce_dmg(0, BuffReduceDmg,
                     PhyFinalHurtRatio, _) ->
    if BuffReduceDmg >= 0 andalso PhyFinalHurtRatio >= 0 ->
           max(BuffReduceDmg, PhyFinalHurtRatio);
       BuffReduceDmg >= 0 andalso PhyFinalHurtRatio =< 0 ->
           BuffReduceDmg + PhyFinalHurtRatio;
       BuffReduceDmg =< 0 andalso PhyFinalHurtRatio >= 0 ->
           BuffReduceDmg + PhyFinalHurtRatio;
       BuffReduceDmg < 0 andalso PhyFinalHurtRatio < 0 ->
           min(BuffReduceDmg, PhyFinalHurtRatio);
       true -> max(BuffReduceDmg, PhyFinalHurtRatio)
    end;
calc_buff_reduce_dmg(1, BuffReduceDmg, _,
                     MagicFinalHurtRatio) ->
    if BuffReduceDmg >= 0 andalso
           MagicFinalHurtRatio >= 0 ->
           max(BuffReduceDmg, MagicFinalHurtRatio);
       BuffReduceDmg >= 0 andalso MagicFinalHurtRatio =< 0 ->
           BuffReduceDmg + MagicFinalHurtRatio;
       BuffReduceDmg =< 0 andalso MagicFinalHurtRatio >= 0 ->
           BuffReduceDmg + MagicFinalHurtRatio;
       BuffReduceDmg < 0 andalso MagicFinalHurtRatio < 0 ->
           min(BuffReduceDmg, MagicFinalHurtRatio);
       true -> max(BuffReduceDmg, MagicFinalHurtRatio)
    end;
calc_buff_reduce_dmg(_, BuffReduceDmg, _, _) ->
    BuffReduceDmg.

calc_mirror_feedback(_SKill = #c_skill{id = SkillId},
                     DmgHp, DmgHolyHp, AtkId, BeAtkId) ->
    case combat_cache:f(by_id, BeAtkId) of
        #fighter{combat_dynamic_attr =
                     #combat_dynamic_attr{mirror_feedback_rate = 0}} ->
            {DmgHp, DmgHolyHp};
        BeAtkFighter = #fighter{group = BeAtkGroup,
                                combat_dynamic_attr =
                                    #combat_dynamic_attr{mirror_feedback_rate =
                                                             Rate}} ->
            case combat_util:get_not_die(BeAtkId,
                                         combat_cache:op(BeAtkGroup),
                                         [AtkId],
                                         [{is_stealth, 0}])
                of
                Target = #fighter{id = FeedbackTid, hp = THp,
                                  name = _Name} ->
                    DmgFeedBack = round(DmgHp * Rate / 1000),
                    NewDmgHp = max(0, DmgHp - DmgFeedBack),
                    logger:debug("反弹伤害:~w, 反弹目标:~ts",
                                 [DmgFeedBack, _Name],
                                 combat_script_skill_calc,
                                 3074),
                    Tvc = [{hp, 1, -DmgFeedBack}],
                    combat_cache:u(FeedbackTid, Tvc),
                    Tc = [{0, -DmgFeedBack, 0}],
                    IsDie = combat_util:is_die(THp - DmgFeedBack),
                    ShowPassiveSkills = [{BeAtkId, SkillId, 1}],
                    MirrorFeedbackPlay =
                        combat_play:gen_sub_skill_play(feedback,
                                                       {BeAtkFighter,
                                                        Target,
                                                        Tc,
                                                        IsDie,
                                                        ShowPassiveSkills}),
                    logger:debug("反弹播报数据:~w",
                                 [MirrorFeedbackPlay],
                                 combat_script_skill_calc,
                                 3085),
                    combat_play:add_sub_play(MirrorFeedbackPlay),
                    {NewDmgHp, DmgHolyHp};
                _ -> {DmgHp, DmgHolyHp}
            end;
        _ -> {DmgHp, DmgHolyHp}
    end.

check_exchange_play_skill(#fighter{special_attr =
                                       #special_attr{wheel_skill = 60547}},
                          Skill = #c_skill{id = 60019}) ->
    Skill#c_skill{id = 60548};
check_exchange_play_skill(_F, Skill) -> Skill.

