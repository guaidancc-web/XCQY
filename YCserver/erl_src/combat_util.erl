-file("src/mod/combat/combat_util.erl", 1).

-module(combat_util).

-export([is_die_disappear/2,
         is_die/1,
         pack_cast/3,
         notice/3,
         count_f/1,
         count_f/2,
         get_not_die/2,
         get_not_die/3,
         get_not_die/4,
         get_not_die_label/3,
         get_not_die_label/4,
         get_not_die_label/5,
         get_not_die_label_count/6,
         can_choose_stealth/1,
         can_choose_stealth/2,
         get_target/2,
         get_target/3,
         get_target/4,
         classes_to_attack_type/3,
         check_combat_result/1,
         common_check_combat_result/1,
         common_check_combat_result/2,
         stop_check_combat_result/2,
         filter_fighter/2,
         filter_fighter/3,
         is_control/1,
         f_to_id/1,
         id_to_f/2,
         id_to_f/1,
         get_skills_from_ai/2,
         default_preside/2,
         run/2,
         ai/4,
         get_ai/4,
         send/2,
         unit_to_combat_type/1,
         init_model/3,
         contains_fighter/2,
         auto_and_hosted/0,
         calc_auto/2,
         check_max_round/1,
         cast_enemy/3,
         member_enter_ob/3,
         async_member_enter_ob/3,
         member_leave_ob/1,
         async_member_leave_ob/1,
         check_preside/2,
         update_preside/4,
         is_all_die/1,
         has_next_wave/1,
         special_add_fighter/1,
         init_fighter/2,
         init_skill/3,
         init_looks/3,
         merge_anger_skill/1,
         check_contain_skilll/2,
         pre_action_calc/1]).

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

-file("src/mod/combat/combat_util.erl", 69).

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

-file("src/mod/combat/combat_util.erl", 70).

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

-file("src/mod/combat/combat_util.erl", 71).

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

-file("src/mod/combat/combat_util.erl", 72).

-file("inc/ai.hrl", 1).

-record(ai_rule,
        {id :: undefined | non_neg_integer(),
         lev :: undefined | non_neg_integer(),
         type = 0 :: non_neg_integer(),
         repeat = 0,
         prob,
         condition = [],
         action = []}).

-file("src/mod/combat/combat_util.erl", 73).

-file("inc/guard.hrl", 1).

-record(m_guard,
        {ver = 1 :: pos_integer(),
         free_war_ids = [] :: [pos_integer()],
         tactics_fields = [] :: list(),
         tactics_attr = [] :: list(),
         guards = [] :: list()}).

-record(guard_eqm,
        {ver = 5,
         base_id :: undefined | non_neg_integer(),
         type :: undefined | non_neg_integer(),
         lev,
         eqm_attrs = [] :: list(),
         reset_base_id = 0,
         reset_attrs = [] :: list(),
         gem = [] :: list(),
         is_init = 1,
         timeout = 0,
         back_effect_timeout = 0,
         back_effect_attr = []}).

-record(guard_astroid,
        {ver = 2 :: non_neg_integer(),
         aroused = [] :: non_neg_integer(),
         skills = [] :: list(),
         attrs = [] :: list(),
         growth = 0 :: non_neg_integer(),
         active = 0 :: non_neg_integer()}).

-record(guard_astroid_star,
        {ver = 0,
         id = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         exp = 0 :: non_neg_integer(),
         attrs = [] :: list()}).

-record(guard,
        {ver = 2,
         base_id = 0 :: non_neg_integer(),
         war_id = 0 :: non_neg_integer(),
         name = "" :: string(),
         alias = "" :: string(),
         classes = 0 :: non_neg_integer(),
         quality = 0 :: non_neg_integer(),
         status = 0 :: non_neg_integer(),
         tac_pos = 0 :: non_neg_integer(),
         skills = [] :: list(),
         eqm = [] :: list(),
         attr :: undefined | tuple(),
         score = 0 :: non_neg_integer(),
         astroid = #guard_astroid{} :: #guard_astroid{}}).

-record(guard_data,
        {base_id = 0 :: non_neg_integer(),
         name = "" :: binary(),
         alias = "" :: binary(),
         classes = 0 :: non_neg_integer(),
         quality = 0 :: non_neg_integer(),
         loss = [] :: tuple(),
         recruit_lev = 1 :: non_neg_integer(),
         desc = "" :: list(),
         normal_atk_id = 0 :: integer(),
         ai_id = 0 :: integer(),
         base_score = 0,
         growth = 0 :: non_neg_integer()}).

-record(guard_eqm_data,
        {base_id = 0 :: non_neg_integer(),
         lev = 1 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         type = 0 :: non_neg_integer(),
         quality = 0 :: non_neg_integer(),
         loss_coin = 0 :: [tuple()],
         reset_coin = 0 :: [tuple()],
         gem_list = [] :: list()}).

-record(guard_lev_data,
        {base_id :: undefined | non_neg_integer(),
         lev :: undefined | non_neg_integer(),
         lev_up_exp :: undefined | non_neg_integer(),
         attrs = [] :: non_neg_integer()}).

-record(guard_eqm_gem,
        {id = 0, base_id = 0, type = 0, lev = 0}).

-record(guard_eqm_gem_data,
        {base_id = 0,
         next_base_id = 0,
         name = "",
         lev = 0,
         type = 0,
         need_lev = 0,
         loss_coin = [],
         attrs = []}).

-file("src/mod/combat/combat_util.erl", 74).

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

-file("src/mod/combat/combat_util.erl", 75).

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

-file("src/mod/combat/combat_util.erl", 76).

-file("inc/formation.hrl", 1).

-record(m_formation,
        {id = 1, lev = 1, pos = 1, forms = [], team_form = []}).

-record(formation, {id = 0, lev = 0, exp = 0}).

-record(formation_data,
        {id = 0,
         type = 1,
         lev = 0,
         max_lev = 1,
         name = "",
         pos_desc = [],
         attr_1 = [],
         attr_2 = [],
         attr_3 = [],
         attr_4 = [],
         attr_5 = [],
         pet_attr = [],
         strong_restrain = [],
         weak_restrain = [],
         next_exp = 0,
         need_item = [],
         item_id = 0}).

-file("src/mod/combat/combat_util.erl", 77).

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

-file("src/mod/combat/combat_util.erl", 78).

-file("inc/campaign.hrl", 1).

-record(campaign_eggs,
        {ver = 0,
         location = 0 :: non_neg_integer(),
         footprints = [],
         last_moved = 0 :: non_neg_integer(),
         rolled = 0 :: non_neg_integer(),
         rewarded = []}).

-record(camp_login,
        {camp_id = 0,
         m_time = 0,
         num = 0,
         days = [],
         buys = []}).

-record(camp_login_data,
        {day = 0, reward = [], buys = [], cost = []}).

-record(camp_login_buy_data,
        {id = 0, reward = [], cost = [], cd = 0}).

-record(campaign_bags,
        {ver = 0,
         collected = [],
         last_filled = 0 :: non_neg_integer(),
         rewarded = 0}).

-record(campaign_card,
        {ver = 0,
         card_ver = 0,
         init = 0,
         times = 0,
         card_list = []}).

-record(campaign_card_open,
        {ver = 0,
         card_ver = 0,
         times = 0,
         init = 0,
         card_list = []}).

-record(camp_wish_flower,
        {ver = 1,
         floor = 1,
         times = 0,
         all_times = 0,
         camp_id = 0}).

-record(camp_new_flop,
        {ver = 1,
         group = 0,
         times = 0,
         rewarded = [],
         camp_id = 0}).

-record(camp_consume_rebate,
        {ver = 1, limit_item = []}).

-record(camp_new_acc_charge,
        {ver = 1, charge_val = 0, get_reward = []}).

-record(camp_charge_seven_gift,
        {ver = 1, id = 0, buy_time = 0, can_reward = []}).

-record(camp_lucky_tree,
        {id = 0,
         times = 0,
         reward_list = [],
         delay_reward = []}).

-record(camp_long_active,
        {ver = 1,
         id = 0,
         lev = 0,
         token_list = [],
         reward_levs = [],
         week_box = 0,
         last_reset_time = 0}).

-record(m_campaign,
        {ver = 27,
         acc = [] :: list(),
         can_reward = [] :: list(),
         rewarded = [] :: list(),
         eggs = #campaign_eggs{},
         bags = #campaign_bags{},
         first_charge_double = [],
         camp_login = #camp_login{},
         hide_seek,
         login_roll,
         recharge = camp_series_recharge:init(),
         camp_card = #campaign_card{},
         wish_times = 0,
         camp_limit = [],
         camp_card_open = #campaign_card_open{},
         recharge_open = camp_series_recharge_open:init(),
         camp_wish_flower = #camp_wish_flower{},
         camp_doll = camp_doll:init(),
         camp_sign,
         camp_exchange,
         camp_animal_chess,
         camp_new_flop = #camp_new_flop{},
         multiplex_assert = 0,
         camp_consume_rebate = camp_consume_rebate:init(),
         camp_black_white_chess =
             camp_black_white_chess_mgr:init(),
         camp_scratch_card = camp_scratch_card:init(),
         camp_new_acc_charge = camp_new_acc_charge:init(),
         camp_charge_seven_gift = camp_charge_seven_gift:init(),
         camp_lucky_tree = camp_lucky_tree:init(),
         camp_long_active = camp_long_active:init(),
         gift_custom = camp_gift_custom:init()}).

-record(campaign_handle,
        {time = 0 :: non_neg_integer(),
         evt = {evt_rpc} :: tuple(),
         call_from = rpc :: evt | rpc,
         add_can_reward = 0 :: non_neg_integer(),
         camp :: undefined | tuple(),
         camp_info :: undefined | tuple(),
         push_list = [] :: [tuple()],
         push_cli = 0 :: 0..1,
         rpc_reward_num = 1 :: non_neg_integer(),
         return_acc = 0}).

-record(camp_collection,
        {camp_end_time = 0,
         reward_list = [],
         extra_data = [],
         random_index,
         red_dot}).

-record(camp_ico,
        {id = 0 :: non_neg_integer(),
         ico_id = 0 :: non_neg_integer(),
         name = "",
         is_show = 0 :: 0..1,
         start_time = 0 :: non_neg_integer() | tuple(),
         end_time = 0 :: non_neg_integer() | tuple(),
         white_list = [] :: list(),
         black_list = [] :: list(),
         min_open_time = 0 :: non_neg_integer() | tuple(),
         max_open_time = 0 :: non_neg_integer() | tuple()}).

-record(camp_cfg,
        {id = 0 :: non_neg_integer(),
         name = "" :: bitstring(),
         group_id = 0 :: non_neg_integer(),
         start_time = 0 :: non_neg_integer() | tuple(),
         end_time = 0 :: non_neg_integer() | tuple(),
         cli_start_time = 0 :: non_neg_integer() | tuple(),
         cli_end_time = 0 :: non_neg_integer() | tuple(),
         type = 0 :: pos_integer(),
         sec_type = 0 :: non_neg_integer(),
         status = 1 :: 0..1,
         reward_type = 2 :: pos_integer(),
         settlement = 2 :: non_neg_integer(),
         reward_title = "" :: bitstring(),
         reward_content = "" :: bitstring(),
         loss_items = [] :: list(),
         auto_buy = 0,
         reward = [] :: list(),
         camp_cond :: undefined | tuple(),
         reward_max = 1 :: non_neg_integer(),
         white_list = [] :: list(),
         black_list = [] :: list(),
         min_open_time = 0 :: non_neg_integer() | tuple(),
         max_open_time = 0 :: non_neg_integer() | tuple(),
         finish_id = 0 :: non_neg_integer(),
         finish_days = 0 :: non_neg_integer(),
         finish_end_days = 0 :: non_neg_integer(),
         cond_reward = [],
         merge_min = 0,
         merge_max = 0,
         is_keep_time = 0}).

-record(camp_cache,
        {id = 0 :: non_neg_integer(),
         sec_type = 0 :: non_neg_integer(),
         is_srv_open = 0 :: 0..1,
         start_time = 0 :: non_neg_integer(),
         end_time = 0 :: non_neg_integer(),
         cli_start_time = 0 :: non_neg_integer(),
         cli_end_time = 0 :: non_neg_integer()}).

-record(camp_unit,
        {id = {0, 0}, base_id = 0, map_id = 0}).

-record(camp_time,
        {id = 0, start_time = 0, end_time = 0}).

-record(camp_item,
        {item = 0,
         start_time = 0,
         end_time = 0,
         open = 0,
         msg = 0}).

-record(camp_assets_data,
        {type = 0, items = [], max = 0, var_type = day}).

-record(camp_gift_custom,
        {ver = 1,
         camp_id = 0,
         gift = [],
         buy = [],
         extra_reward = 0}).

-file("src/mod/combat/combat_util.erl", 79).

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

-file("src/mod/combat/combat_util.erl", 80).

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

-file("src/mod/combat/combat_util.erl", 81).

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

-file("src/mod/combat/combat_util.erl", 82).

-file("inc/looks.hrl", 1).

-file("src/mod/combat/combat_util.erl", 83).

send(#fighter{type = 1, pid = Pid}, Msg)
    when is_pid(Pid) ->
    notice:send({pid, Pid}, 3, Msg),
    ok;
send(Pid, Msg) when is_pid(Pid) ->
    notice:send({pid, Pid}, 3, Msg),
    ok;
send(_, _) -> ok.

merge_anger_skill(Skills) ->
    merge_anger_skill(Skills, []).

merge_anger_skill([], NewSkills) -> NewSkills;
merge_anger_skill([{SkillId, Lev} | T], NewSkills) ->
    {MaxLev, RestT} = do_merge_anger_skill(T, SkillId, Lev),
    merge_anger_skill(RestT,
                      [{SkillId, MaxLev} | NewSkills]).

check_contain_skilll([], _SkillIdList) -> false;
check_contain_skilll([#c_skill{skill = #skill{id = Id}}
                      | T],
                     SkillIdList) ->
    case lists:member(Id, SkillIdList) of
        true -> true;
        false -> check_contain_skilll(T, SkillIdList)
    end.

do_merge_anger_skill(T, SkillId, Lev) ->
    do_merge_anger_skill(T, SkillId, Lev, []).

do_merge_anger_skill([], _, MaxLev, RestT) ->
    {MaxLev, RestT};
do_merge_anger_skill([{Id, Lev} | T], Id, MaxLev,
                     RestT) ->
    do_merge_anger_skill(T, Id, max(Lev, MaxLev), RestT);
do_merge_anger_skill([H | T], Id, MaxLev, RestT) ->
    do_merge_anger_skill(T, Id, MaxLev, [H | RestT]).

notice(FighterList, Type, Msg) ->
    lists:foreach(fun (#fighter{type = 1, pid = Pid})
                          when is_pid(Pid) ->
                          notice:send({pid, Pid}, Type, Msg);
                      (_) -> ignore
                  end,
                  FighterList),
    ok.

-spec is_die_disappear(CombatType, F) -> 0 |
                                         1 when CombatType :: non_neg_integer(),
                                                F :: #fighter{}.

is_die_disappear(_, #fighter{type = 1}) -> 0;
is_die_disappear(_, #fighter{type = 4}) -> 0;
is_die_disappear(_, #fighter{type = 5}) -> 0;
is_die_disappear(_, _) -> 1.

-spec is_die(Hp) -> 1 | 0 when Hp :: number().

is_die(#fighter{hp = Hp}) when Hp =< 0 -> 1;
is_die(Hp) when Hp =< 0 -> 1;
is_die(_) -> 0.

init_fighter(52, Fighter) ->
    campaign_snow:init_fighter(Fighter);
init_fighter(_, Fighter) -> Fighter.

init_skill(52, Fighter, Minit) ->
    campaign_snow:init_skill(Fighter, Minit);
init_skill(_CombatType, _Fighter, Minit) -> Minit.

init_looks(52, Fighter, Looks) ->
    Looks1 = campaign_snow:init_looks(Fighter, Looks),
    Looks2 = add_looks_buff_icon(Looks1),
    force_show_looks(52, Looks2);
init_looks(CombatType, Fighter, Looks) ->
    FormerPetLooks = pet_show_former_looks(CombatType,
                                           Fighter,
                                           Looks),
    force_show_looks(CombatType, FormerPetLooks).

pet_show_former_looks(CombatType, #fighter{type = 3},
                      Looks) ->
    logger:debug("宠物外形:~w", [Looks], combat_util, 185),
    ForceCombTypes = buff_data:pet_former_combat_type(),
    case lists:member(CombatType, ForceCombTypes) of
        true ->
            logger:debug("宠物外形:~w",
                         [[Look
                           || Look = {LookType, _Mode, _Value, _Str} <- Looks,
                              LookType =/= 75, LookType =/= 79]],
                         combat_util,
                         189),
            [Look
             || Look = {LookType, _Mode, _Value, _Str} <- Looks,
                LookType =/= 75, LookType =/= 79];
        _ -> Looks
    end;
pet_show_former_looks(_CombatType, _F, Looks) -> Looks.

force_show_looks(CombatType, Looks) ->
    ForceCombTypes = buff_data:transform_combat_type(),
    case lists:member(CombatType, ForceCombTypes) of
        true ->
            case lists:keyfind(74, 1, Looks) of
                {74, Mode, Value, Str} ->
                    case lists:keyfind(53, 1, Looks) of
                        false ->
                            lists:keystore(53,
                                           1,
                                           Looks,
                                           {53, Mode, Value, Str});
                        _ -> Looks
                    end;
                _ -> Looks
            end;
        _ -> Looks
    end.

add_looks_buff_icon(Looks) ->
    case lists:keyfind(53, 1, Looks) of
        {53, Mode, Value, Str} ->
            case lists:keyfind(74, 1, Looks) of
                false ->
                    lists:keystore(74, 1, Looks, {74, Mode, Value, Str});
                _ -> Looks
            end;
        _ -> Looks
    end.

cast_enemy(Combat = #combat{type = 104}, AtkList,
           DfdList) ->
    top_compete_util:cast_enemy(Combat, AtkList, DfdList);
cast_enemy(Combat = #combat{type = 107}, AtkList,
           DfdList) ->
    hero_role:cast_enemy(Combat, AtkList, DfdList);
cast_enemy(Combat = #combat{type = 41}, AtkList,
           DfdList) ->
    elf_role:cast_enemy(Combat, AtkList, DfdList);
cast_enemy(#combat{type = 105,
                   start_args = #combat_start_args{ext_args = ExtArgs}},
           AtkList, DfdList) ->
    guild_war:cast_enemy(AtkList, DfdList, ExtArgs);
cast_enemy(#combat{type = 106,
                   start_args = #combat_start_args{ext_args = ExtArgs}},
           AtkList, DfdList) ->
    guild_hero:cast_enemy(AtkList, DfdList, ExtArgs);
cast_enemy(#combat{type = 108,
                   start_args = #combat_start_args{ext_args = ExtArgs}},
           AtkList, DfdList) ->
    guild_league_role:cast_enemy(AtkList, DfdList, ExtArgs);
cast_enemy(#combat{type = 8}, AtkList, DfdList) ->
    quest_offer:cast_enemy(AtkList, DfdList);
cast_enemy(#combat{type = 116,
                   start_args = #combat_start_args{ext_args = ExtArgs}},
           AtkList, DfdList) ->
    canyon_summit_role:cast_enemy(AtkList,
                                  DfdList,
                                  ExtArgs);
cast_enemy(_, _, _) -> ok.

unit_to_combat_type(#unit{type = Type,
                          fun_type = FunType}) ->
    unit_to_combat_type(Type, FunType);
unit_to_combat_type(#unit_data{type = Type,
                               fun_type = FunType}) ->
    unit_to_combat_type(Type, FunType);
unit_to_combat_type(_) -> 1.

unit_to_combat_type(_, 3) -> 8;
unit_to_combat_type(_, 8) -> 10;
unit_to_combat_type(_, 10) -> 11;
unit_to_combat_type(_, 13) -> 13;
unit_to_combat_type(_, 11) -> 16;
unit_to_combat_type(_, 18) -> 21;
unit_to_combat_type(_, 21) -> 23;
unit_to_combat_type(_, 22) -> 24;
unit_to_combat_type(_, 38) -> 38;
unit_to_combat_type(_, 39) -> 39;
unit_to_combat_type(_, 37) -> 35;
unit_to_combat_type(_, 42) -> 42;
unit_to_combat_type(_, 32) -> 31;
unit_to_combat_type(_, 33) -> 32;
unit_to_combat_type(_, 55) -> 47;
unit_to_combat_type(_, 56) -> 48;
unit_to_combat_type(_, 59) -> 51;
unit_to_combat_type(_, 64) -> 57;
unit_to_combat_type(_, 57) -> 50;
unit_to_combat_type(_, 65) -> 61;
unit_to_combat_type(_, 66) -> 62;
unit_to_combat_type(_, 70) -> 69;
unit_to_combat_type(_, 71) -> 70;
unit_to_combat_type(_, 67) -> 63;
unit_to_combat_type(_, _) -> 1.

init_model(23, 2, BaseId) ->
    campaign_unit:init_model(23, BaseId);
init_model(31, 2, BaseId) ->
    campaign_unit:init_model(31, BaseId);
init_model(38, 2, BaseId) ->
    campaign_unit:init_model(38, BaseId);
init_model(51, 2, BaseId) ->
    campaign_unit:init_model(51, BaseId);
init_model(5, 2, BaseId) ->
    world_boss:init_model(BaseId);
init_model(50, 2, BaseId) ->
    treasure:init_model(BaseId);
init_model(_Type, _UnitType, _) -> 0.

classes_to_attack_type(1, 2, _) -> 1;
classes_to_attack_type(1, 3, _) -> 1;
classes_to_attack_type(1, 5, _) -> 1;
classes_to_attack_type(1, 6, _) -> 1;
classes_to_attack_type(1, _, _) -> 0;
classes_to_attack_type(_, _, AttackType) -> AttackType.

check_preside(6, _) -> {6, ""};
check_preside(7, _) -> {7, ""};
check_preside(PresideType, PresideList) ->
    case lists:keyfind(PresideType, 1, PresideList) of
        {_, PresideText = [_ | _]} -> {8, PresideText};
        _ -> {PresideType, ""}
    end.

update_preside(Role = #role{m_combat =
                                Mc = #m_combat{self_preside = SelfPreside,
                                               target_preside = TargetPreside}},
               Type, Flag, Text) ->
    {NewSelfPreside, NewTargetPreside} = case Type of
                                             _ when Flag =:= 0 -> {[], []};
                                             0 ->
                                                 SelfPreside1 =
                                                     lists:keystore(Flag,
                                                                    1,
                                                                    SelfPreside,
                                                                    {Flag,
                                                                     Text}),
                                                 {SelfPreside1, TargetPreside};
                                             1 ->
                                                 TargetPreside1 =
                                                     lists:keystore(Flag,
                                                                    1,
                                                                    TargetPreside,
                                                                    {Flag,
                                                                     Text}),
                                                 {SelfPreside, TargetPreside1}
                                         end,
    NewMc = Mc#m_combat{self_preside = NewSelfPreside,
                        target_preside = NewTargetPreside},
    {ok,
     {NewSelfPreside, NewTargetPreside},
     Role#role{m_combat = NewMc}}.

-spec
     count_f(CondList) -> non_neg_integer() when CondList ::
                                                     [{non_neg_integer(),
                                                       any()}].

count_f(CondList) ->
    count_f(combat_cache:all(), CondList).

-spec count_f(FighterList,
              CondList) -> non_neg_integer() when FighterList ::
                                                      [#fighter{}],
                                                  CondList ::
                                                      [{non_neg_integer(),
                                                        any()}].

count_f(FighterList, CondList) ->
    count_f(FighterList, CondList, 0).

count_f([], _, N) -> N;
count_f([F | T], CondList, N) ->
    case do_count_fighter(F, CondList) of
        true -> count_f(T, CondList, N + 1);
        false -> count_f(T, CondList, N)
    end.

do_count_fighter(_F, []) -> true;
do_count_fighter(F = #fighter{}, [{Pos, Val} | T]) ->
    case erlang:element(Pos, F) of
        Val -> do_count_fighter(F, T);
        _ -> false
    end;
do_count_fighter(F, [{Pos, Val} | T]) ->
    logger:error("错误的匹配参数:F:~w, ~w,~w",
                 [F, Pos, Val],
                 combat_util,
                 380),
    do_count_fighter(F, T).

-spec pack_cast(FighterList, Code,
                Data) -> ok when FighterList :: [#fighter{}] | [pid()],
                                 Code :: pos_integer(), Data :: any().

pack_cast(FighterList, Code, Data) ->
    case sys_conn:pack(Code, Data) of
        {ok, Bin} ->
            lists:foreach(fun (#fighter{type = 1, pid = Pid})
                                  when is_pid(Pid) ->
                                  Pid ! {socket_proxy, Bin};
                              (#c_observer{pid = Pid}) when is_pid(Pid) ->
                                  Pid ! {socket_proxy, Bin};
                              (Pid) when is_pid(Pid) ->
                                  Pid ! {socket_proxy, Bin};
                              (_) -> ignore
                          end,
                          FighterList);
        {false, Reason} ->
            logger:error("打包数据出错[Code:~w][Data:~w][Reason:~w]",
                         [Code, Data, Reason],
                         combat_util,
                         403)
    end.

get_not_die_label(Sid, Tgroup, Label) ->
    get_not_die_label(Sid, Tgroup, [], [], Label).

get_not_die_label(Sid, Tgroup, DelList, Label) ->
    get_not_die_label(Sid, Tgroup, DelList, [], Label).

get_not_die_label(Sid, Tgroup, DelList, Cond, Label) ->
    get_not_die2(Sid, Tgroup, DelList, Cond, Label).

get_not_die2(Sid, Tgroup, DelList, Cond, Label) ->
    Self = combat_cache:f(by_id, Sid),
    List = get_auto_target(Sid, Tgroup),
    Fun = fun (Id, GetList) ->
                  lists:keydelete(Id, #fighter.id, GetList)
          end,
    Fun1 = fun ({is_stealth, 0}, GetList1) ->
                   L = [F
                        || F <- GetList1, can_choose_stealth(Self, F) =:= true],
                   L;
               ({type, [3]}, GetList1) ->
                   L = [F
                        || F = #fighter{type = 3, master_fid = MasterFid}
                               <- GetList1,
                           MasterFid =/= 0],
                   L;
               ({type, [6]}, GetList1) ->
                   L = [F
                        || F = #fighter{type = 6, master_fid = MasterFid}
                               <- GetList1,
                           MasterFid =/= 0],
                   L;
               ({type, TypeList}, GetList1) ->
                   L = [F
                        || F = #fighter{type = Type} <- GetList1,
                           lists:member(Type, TypeList) =:= true],
                   L;
               (_, GetList1) -> GetList1
           end,
    List1 = lists:foldl(Fun, List, DelList),
    List2 = lists:foldl(Fun1, List1, Cond),
    NewList = case Label of
                  min_hp ->
                      TargetList1 = [{Hp / max(1, HpMax), Tf}
                                     || Tf = #fighter{hp = Hp, hp_max = HpMax}
                                            <- List2],
                      TargetList2 = lists:keysort(1, TargetList1),
                      [Tf1 || {_, Tf1} <- TargetList2];
                  _ -> util:shuffle(List2)
              end,
    do_get_not_die(NewList).

get_not_die(Sid, Tgroup) ->
    get_not_die(Sid, Tgroup, [], []).

get_not_die(Sid, Tgroup, DelList) ->
    get_not_die(Sid, Tgroup, DelList, []).

get_not_die(Sid, Tgroup, DelList, Cond) ->
    get_not_die2(Sid, Tgroup, DelList, Cond, rand).

do_get_not_die([]) -> undefined;
do_get_not_die([F = #fighter{is_die = 0, is_escape = 0}
                | _T]) ->
    F;
do_get_not_die([_H | T]) -> do_get_not_die(T).

get_not_die_label_count(Sid, Tgroup, DelList, Cond,
                        Label, Count) ->
    get_not_die_label_count(Sid,
                            Tgroup,
                            DelList,
                            Cond,
                            Label,
                            Count,
                            []).

get_not_die_label_count(_Sid, _Tgroup, _DelList, _Cond,
                        _Label, 0, TargetList) ->
    TargetList;
get_not_die_label_count(Sid, Tgroup, DelList, Cond,
                        Label, Count, TargetList) ->
    case get_not_die_label(Sid,
                           Tgroup,
                           DelList,
                           Cond,
                           Label)
        of
        F = #fighter{id = Fid} ->
            get_not_die_label_count(Sid,
                                    Tgroup,
                                    [Fid | DelList],
                                    Cond,
                                    Label,
                                    Count - 1,
                                    [F | TargetList]);
        _ ->
            get_not_die_label_count(Sid,
                                    Tgroup,
                                    DelList,
                                    Cond,
                                    Label,
                                    Count - 1,
                                    TargetList)
    end.

can_choose_stealth(#fighter{group = Group},
                   #fighter{group = Group}) ->
    true;
can_choose_stealth(#fighter{special_attr =
                                #special_attr{can_attack_stealth = 1}},
                   _) ->
    true;
can_choose_stealth(#fighter{},
                   #fighter{special_status =
                                #special_status{is_stealth = 1}}) ->
    false;
can_choose_stealth(_, _) -> true.

can_choose_stealth(#fighter{special_attr =
                                #special_attr{can_attack_stealth = 1}}) ->
    true;
can_choose_stealth(_) -> false.

get_target(Sid, Tgroup) ->
    get_target(Sid, Tgroup, [], []).

get_target(Sid, Tgroup, DelList) ->
    get_target(Sid, Tgroup, DelList, []).

get_target(Sid, Tgroup, DelList, Cond) ->
    List = get_auto_target(Sid, Tgroup),
    Fun = fun (Id, GetList) ->
                  lists:keydelete(Id, #fighter.id, GetList)
          end,
    Fun1 = fun ({is_stealth, Val}, GetList1) ->
                   L = [F
                        || F = #fighter{special_status =
                                            #special_status{is_stealth = V}}
                               <- GetList1,
                           V =:= Val],
                   L;
               (_, GetList1) -> GetList1
           end,
    List1 = lists:foldl(Fun, List, DelList),
    List2 = lists:foldl(Fun1, List1, Cond),
    NewList = util:shuffle(List2),
    do_get_target(NewList).

do_get_target([]) -> undefined;
do_get_target([F = #fighter{is_escape = 0} | _T]) -> F;
do_get_target([_H | T]) -> do_get_target(T).

get_auto_target(_Sid, Tgroup) when is_list(Tgroup) ->
    Tgroup;
get_auto_target(Sid, Tgroup) ->
    {L1, L2, L3} =
        do_get_auto_target(combat_cache:all(Tgroup),
                           [],
                           [],
                           []),
    Result = L1 ++ L2 ++ L3,
    case get({auto_action_target, Sid}) of
        undefined -> Result;
        Tid ->
            case combat_cache:f(by_id, Tid) of
                F = #fighter{is_die = 0, is_escape = 0} ->
                    Result1 = Result -- [F],
                    [F | Result1];
                _ -> Result
            end
    end.

do_get_auto_target([], L1, L2, L3) ->
    {lists:reverse(L1), lists:reverse(L2), L3};
do_get_auto_target([F = #fighter{type = 3} | T], L1, L2,
                   L3) ->
    do_get_auto_target(T, L1, [F | L2], L3);
do_get_auto_target([F = #fighter{type = 6} | T], L1, L2,
                   L3) ->
    do_get_auto_target(T, L1, [F | L2], L3);
do_get_auto_target([F | T], L1, L2, L3) ->
    do_get_auto_target(T, [F | L1], L2, L3).

is_control(#fighter{special_status =
                        #special_status{is_seal = 1}}) ->
    1;
is_control(#fighter{special_status =
                        #special_status{is_silent = 1}}) ->
    1;
is_control(#fighter{special_status =
                        #special_status{is_taunt = 1}}) ->
    1;
is_control(#fighter{special_status =
                        #special_status{is_chaos = 1}}) ->
    1;
is_control(#fighter{special_status =
                        #special_status{is_stun = 1}}) ->
    1;
is_control(#fighter{special_status =
                        #special_status{is_sleep = 1}}) ->
    1;
is_control(#fighter{special_status =
                        #special_status{is_stone = 1}}) ->
    1;
is_control(_) -> 0.

calc_auto(_, 107) -> 0;
calc_auto(_, 4) -> 0;
calc_auto(_, 6) -> 0;
calc_auto(_, 100) -> 0;
calc_auto(_, 112) -> 0;
calc_auto(_, 102) -> 0;
calc_auto(_, 104) -> 0;
calc_auto(_, 106) -> 0;
calc_auto(_, 21) -> 0;
calc_auto(_, 103) -> 0;
calc_auto(_, 35) -> 0;
calc_auto(_, 105) -> 0;
calc_auto(_, 38) -> 0;
calc_auto(_, 39) -> 0;
calc_auto(_, 40) -> 0;
calc_auto(_, 58) -> 0;
calc_auto(_, 108) -> 0;
calc_auto(_, 110) -> 0;
calc_auto(_, 111) -> 0;
calc_auto(_, 52) -> 0;
calc_auto(_, 113) -> 0;
calc_auto(_, 56) -> 0;
calc_auto(_, 57) -> 0;
calc_auto(_, 114) -> 0;
calc_auto(_, 60) -> 0;
calc_auto(_, 115) -> 0;
calc_auto(_, 68) -> 0;
calc_auto(_, 116) -> 0;
calc_auto(_, 72) -> 0;
calc_auto(#fighter{is_auto = IsAuto}, _) -> IsAuto.

auto_and_hosted() ->
    IsAuto = case get(combat_auto) of
                 1 -> 1;
                 _ -> 0
             end,
    IsHosted = case get(disconnect_status) of
                   {combat, _, _} -> 1;
                   {team, _, _} -> 1;
                   {normal, _, _} -> 1;
                   _ -> 0
               end,
    {IsAuto, IsHosted}.

check_max_round(4) -> {special, 40};
check_max_round(100) -> {special, 13};
check_max_round(102) -> {special, 15};
check_max_round(104) -> {special, 15};
check_max_round(105) -> {special, 15};
check_max_round(107) -> {special, 15};
check_max_round(41) -> {special, 15};
check_max_round(46) -> {special, 15};
check_max_round(103) -> {special, 10};
check_max_round(40) -> {special, 15};
check_max_round(58) -> {special, 15};
check_max_round(108) -> {special, 15};
check_max_round(112) -> {special, 15};
check_max_round(110) -> {special, 30};
check_max_round(52) -> {snow, 16};
check_max_round(113) -> {special, 13};
check_max_round(114) -> {special, 12};
check_max_round(116) -> {special, 15};
check_max_round(42) -> {combat_unit, 6};
check_max_round(_) -> {normal, 100}.

check_combat_result(#combat{all_waiting_next_wave =
                                [_ | _],
                            type = CombatType, round = CurRound}) ->
    case common_check_combat_result({CombatType, CurRound},
                                    round)
        of
        10 -> 98;
        Result -> Result
    end;
check_combat_result(#combat{type = CombatType,
                            round = CurRound}) ->
    case
        combat_cache:get_context_elem([#combat_context.all_waiting_next_wave])
        of
        [_ | _] ->
            case common_check_combat_result({CombatType, CurRound},
                                            round)
                of
                10 -> 98;
                Result -> Result
            end;
        _ ->
            common_check_combat_result({CombatType, CurRound},
                                       round)
    end.

common_check_combat_result({CombatType, CurRound}) ->
    common_check_combat_result({CombatType, CurRound},
                               action).

common_check_combat_result({CombatType, CurRound},
                           CheckType) ->
    {Mode, MaxRound} = check_max_round(CombatType),
    common_check_combat_result(Mode,
                               CombatType,
                               MaxRound,
                               CurRound,
                               CheckType).

stop_check_combat_result(CombatType, _CurRound)
    when CombatType =:= 71 ->
    10;
stop_check_combat_result(CombatType, _CurRound) ->
    Atk = combat_cache:atk(),
    Dfd = combat_cache:dfd(),
    A = is_all_die(Atk),
    D = is_all_die(Dfd),
    AtkHasRole = contains_fighter(combat_cache:atk(), [1]),
    if A =:= false andalso D =:= true -> 10;
       A =:= true andalso D =:= false -> 11;
       A =:= true andalso D =:= true ->
           case AtkHasRole of
               true -> 11;
               false -> 10
           end;
       true -> calc_result_score(CombatType, Atk, Dfd)
    end.

common_check_combat_result(combat_unit, _CombatType,
                           MaxRound, CurRound, _CheckType) ->
    Atk = combat_cache:atk(),
    Dfd = combat_cache:dfd(),
    A = is_all_snow(Atk),
    D = is_all_snow(Dfd),
    case CurRound > MaxRound of
        true -> 11;
        false ->
            if A =:= true andalso D =:= true -> 10;
               A =:= false andalso D =:= true -> 10;
               A =:= true andalso D =:= false -> 11;
               true -> 99
            end
    end;
common_check_combat_result(snow, _CombatType, MaxRound,
                           CurRound, _CheckType) ->
    Atk = combat_cache:atk(),
    Dfd = combat_cache:dfd(),
    A = is_all_snow(Atk),
    D = is_all_snow(Dfd),
    case CurRound >= MaxRound of
        true -> calc_snow_num(Atk, Dfd);
        false ->
            if A =:= true andalso D =:= true -> 10;
               A =:= false andalso D =:= true -> 10;
               A =:= true andalso D =:= false -> 11;
               true -> 99
            end
    end;
common_check_combat_result(special, CombatType,
                           MaxRound, CurRound, _CheckType) ->
    Atk = combat_cache:atk(),
    Dfd = combat_cache:dfd(),
    A = is_all_die(Atk),
    D = is_all_die(Dfd),
    case CurRound >= MaxRound of
        true -> calc_result_score(CombatType, Atk, Dfd);
        false ->
            if A =:= true andalso D =:= true -> 10;
               A =:= false andalso D =:= true -> 10;
               A =:= true andalso D =:= false -> 11;
               true -> 99
            end
    end;
common_check_combat_result(normal, _CombatType,
                           MaxRound, CurRound, _CheckType) ->
    AtkHasRole = contains_fighter(combat_cache:atk(), [1]),
    Atk = combat_cache:atk(),
    Dfd = combat_cache:dfd(),
    A = is_all_die(Atk),
    D = is_all_die(Dfd),
    case CurRound >= MaxRound of
        true ->
            case AtkHasRole of
                true -> 11;
                false -> 10
            end;
        false ->
            if A =:= true andalso D =:= true ->
                   case AtkHasRole of
                       true -> 11;
                       false -> 10
                   end;
               A =:= false andalso D =:= true -> 10;
               A =:= true andalso D =:= false -> 11;
               true -> 99
            end
    end.

calc_result_score(CombatType, Atk, Dfd) ->
    ScoreAtk = do_calc_result_score(Atk),
    ScoreDfd = do_calc_result_score(Dfd),
    send_result_mail(CombatType,
                     Atk,
                     ScoreAtk,
                     Dfd,
                     ScoreDfd),
    case ScoreAtk >= ScoreDfd of
        true -> 10;
        false -> 11
    end.

do_calc_result_score(Fighter) ->
    do_calc_result_score(Fighter, 0).

do_calc_result_score([], Score) -> Score;
do_calc_result_score([#fighter{is_escape = 1} | T],
                     Score) ->
    do_calc_result_score(T, Score);
do_calc_result_score([#fighter{type = 2} | T], Score) ->
    do_calc_result_score(T, Score);
do_calc_result_score([#fighter{type = 4} | T], Score) ->
    do_calc_result_score(T, Score);
do_calc_result_score([#fighter{id = Fid, type = 5,
                               hp = Hp, hp_max = HpMax, is_die = IsDie}
                      | T],
                     Score) ->
    [AvatarList] =
        combat_cache:get_context_elem([#combat_context.avatar_list]),
    case lists:keymember(Fid, 1, AvatarList) of
        true -> do_calc_result_score(T, Score);
        _ ->
            AddScore = case IsDie of
                           1 -> round(Hp / HpMax * 100);
                           0 -> round(50 + Hp / HpMax * 100)
                       end,
            do_calc_result_score(T, AddScore + Score)
    end;
do_calc_result_score([#fighter{id = Fid, type = 3,
                               hp = Hp, hp_max = HpMax, is_die = IsDie}
                      | T],
                     Score) ->
    [KillList] =
        combat_cache:get_context_elem([#combat_context.kill_by_self_list]),
    case lists:keymember(Fid, 2, KillList) of
        true -> do_calc_result_score(T, Score);
        _ ->
            AddScore = case IsDie of
                           1 -> round(Hp / HpMax * 100);
                           0 -> round(50 + Hp / HpMax * 100)
                       end,
            do_calc_result_score(T, AddScore + Score)
    end;
do_calc_result_score([#fighter{hp = Hp, hp_max = HpMax,
                               is_die = IsDie}
                      | T],
                     Score) ->
    AddScore = case IsDie of
                   1 -> round(Hp / HpMax * 100);
                   0 -> round(50 + Hp / HpMax * 100)
               end,
    do_calc_result_score(T, AddScore + Score).

is_all_die(Fighters) ->
    HasRole = contains_fighter(Fighters, [1]),
    Fighters1 = [F
                 || F = #fighter{is_escape = 0} <- Fighters],
    Fun = fun (#fighter{type = Type}) -> Type =:= 1 end,
    {RoleList, OtherList} = lists:partition(Fun, Fighters1),
    is_all_die(RoleList, OtherList, HasRole).

is_all_die([], _OtherList, true) -> true;
is_all_die(RoleList, OtherList, _) ->
    case lists:keymember(0, #fighter.is_die, RoleList) of
        false ->
            case lists:keymember(0, #fighter.is_die, OtherList) of
                false -> true;
                true -> false
            end;
        true -> false
    end.

calc_snow_num(Atk, Dfd) ->
    Anum = lists:sum([1
                      || #fighter{special_status =
                                      #special_status{is_stun = 1}}
                             <- Atk]),
    Dnum = lists:sum([1
                      || #fighter{special_status =
                                      #special_status{is_stun = 1}}
                             <- Dfd]),
    if Anum =:= Dnum ->
           ALev = lists:sum([combat_cache:get_ext_val(F, 3, 0)
                             || F = #fighter{special_status =
                                                 #special_status{is_stun = 0}}
                                    <- Atk]),
           BLev = lists:sum([combat_cache:get_ext_val(F, 3, 0)
                             || F = #fighter{special_status =
                                                 #special_status{is_stun = 0}}
                                    <- Dfd]),
           if ALev =:= BLev -> 2;
              ALev > BLev -> 11;
              true -> 10
           end;
       Anum > Dnum -> 11;
       true -> 10
    end.

is_all_snow(Fighters) ->
    HasRole = contains_fighter(Fighters, [1]),
    Fighters1 = [F
                 || F = #fighter{is_escape = 0} <- Fighters],
    Fun = fun (#fighter{type = Type}) -> Type =:= 1 end,
    {RoleList, OtherList} = lists:partition(Fun, Fighters1),
    is_all_snow(RoleList, OtherList, HasRole).

is_all_snow([], _OtherList, true) -> true;
is_all_snow(RoleList, OtherList, _) ->
    case check_snow(RoleList) of
        false ->
            case check_snow(OtherList) of
                false -> true;
                true -> false
            end;
        true -> false
    end.

check_snow([]) -> false;
check_snow([#fighter{special_status =
                         #special_status{is_stun = 0}}
            | _T]) ->
    true;
check_snow([_ | T]) -> check_snow(T).

has_next_wave(#combat{all_waiting_next_wave =
                          [NextWave | T]}) ->
    {true, NextWave, T};
has_next_wave(_) -> false.

contains_fighter(FighterList, TypeList) ->
    contains_fighter(FighterList, TypeList, false).

contains_fighter([], _, Result) -> Result;
contains_fighter([#fighter{type = Type} | T], TypeList,
                 Result) ->
    case lists:member(Type, TypeList) of
        true -> true;
        false -> contains_fighter(T, TypeList, Result)
    end;
contains_fighter([_Err | T], TypeList, Result) ->
    contains_fighter(T, TypeList, Result).

-spec filter_fighter(FighterList,
                     TypeList) -> list() when FighterList :: list(),
                                              TypeList :: list().

filter_fighter(FighterList, TypeList) ->
    [F
     || F = #fighter{type = Type} <- FighterList,
        lists:member(Type, TypeList)].

filter_fighter(FighterList, Types1, Types2) ->
    filter_fighter(FighterList, Types1, Types2, [], []).

filter_fighter([], _Types1, _Types2, List1, List2) ->
    {List1, List2};
filter_fighter([F = #fighter{type = Type} | T], Types1,
               Types2, List1, List2) ->
    case lists:member(Type, Types1) of
        true ->
            filter_fighter(T, Types1, Types2, [F | List1], List2);
        _ ->
            case lists:member(Type, Types2) of
                true ->
                    filter_fighter(T, Types1, Types2, List1, [F | List2]);
                _ -> filter_fighter(T, Types1, Types2, List1, List2)
            end
    end;
filter_fighter([_ | T], Types1, Types2, List1, List2) ->
    filter_fighter(T, Types1, Types2, List1, List2).

get_skills_from_ai(#fighter{type = 2}, {AiRules, _}) ->
    do_get_skills_from_ai(AiRules, []);
get_skills_from_ai(_, _) -> [].

do_get_skills_from_ai([], Result) -> Result;
do_get_skills_from_ai([#ai_rule{action = Action} | T],
                      Result) ->
    Skills = make_get_skills_from_ai(Action, []),
    do_get_skills_from_ai(T, Result ++ Skills).

make_get_skills_from_ai([], Result) -> Result;
make_get_skills_from_ai([{_, skill, SkillId} | T],
                        Result) ->
    make_get_skills_from_ai(T, [{SkillId, 1} | Result]);
make_get_skills_from_ai([_ | T], Result) ->
    make_get_skills_from_ai(T, Result).

-spec id_to_f(Ids) -> [F :: tuple()] when Ids ::
                                              [non_neg_integer()].

id_to_f(Ids) when is_list(Ids) -> id_to_f(Ids, []);
id_to_f(_) -> [].

id_to_f([], Result) -> Result;
id_to_f([Id | T], Result) ->
    case combat_cache:f(by_id, Id) of
        false -> id_to_f(T, Result);
        F -> id_to_f(T, [F | Result])
    end.

f_to_id(undefined) -> undefined;
f_to_id(#fighter{id = Id}) -> Id;
f_to_id(L) when is_list(L) ->
    [Id || #fighter{id = Id} <- L].

default_preside(2, BaseId) ->
    unit_data:default_preside(BaseId);
default_preside(_Type, _Id) -> 0.

member_enter_ob(Role, CombatPid, BeWatcherId) ->
    team_common:async_member(Role,
                             2,
                             {combat_util,
                              async_member_enter_ob,
                              [CombatPid, BeWatcherId]}).

async_member_enter_ob(Role, CombatPid, BeWatcherId)
    when is_pid(CombatPid) ->
    {ok, Ob} = role_convert:to(c_observer, Role),
    #role{id = RoleId, s_event = Event} = Role,
    WatchArgs = case Event of
                    11 ->
                        case warrior_api:get_id(Role) of
                            {ok, GroupId, SeqId} ->
                                #{warrior_camp => GroupId,
                                  warrior_seq => SeqId};
                            _ -> #{}
                        end;
                    17 ->
                        case guild_war:get_guild_role_side(RoleId) of
                            {true, MatchId, Side} ->
                                #{guild_id => MatchId, guild_side => Side};
                            _ -> #{}
                        end;
                    21 ->
                        case hero_mgr:lookup(RoleId) of
                            #hero_role{group = Group} -> #{hero_camp => Group};
                            false -> #{}
                        end;
                    22 ->
                        #role{m_guild = #m_guild{id = GuildId}} = Role,
                        #{guild_id => GuildId};
                    32 ->
                        case guild_league_role:get_side(RoleId) of
                            {true, MatchId, Side} ->
                                #{guild_id => MatchId, guild_side => Side};
                            _ -> #{}
                        end;
                    _ -> #{}
                end,
    WatchArgs1 = case BeWatcherId of
                     false -> WatchArgs;
                     _ -> WatchArgs#{watch_id => BeWatcherId}
                 end,
    CombatPid ! {observer_enter, Ob, WatchArgs1},
    ok;
async_member_enter_ob(_, _, _) -> ok.

special_add_fighter(#combat{type = CombatType,
                            round = Round}) ->
    case combat_util_data:get_add_fighter({CombatType,
                                           Round})
        of
        #{group := Group, num := CanNum,
          unit_ids := UnitBaseIds} ->
            CanNum1 = min(13, CanNum),
            case do_special_add_fighter(CanNum1, UnitBaseIds, []) of
                UnitList = [_ | _] -> {true, Group, UnitList};
                _ -> false
            end;
        _ -> false
    end.

do_special_add_fighter(Num, _, UnitList)
    when Num =< 0 ->
    UnitList;
do_special_add_fighter(_, [], UnitList) -> UnitList;
do_special_add_fighter(Num, AllUnitList, UnitList) ->
    case util:rand_list(AllUnitList, 2) of
        {UnitBaseId, _} ->
            case unit_data:get(UnitBaseId) of
                #unit_data{} ->
                    do_special_add_fighter(Num - 1,
                                           AllUnitList,
                                           [{unit_baseid, UnitBaseId}
                                            | UnitList]);
                _ ->
                    do_special_add_fighter(Num - 1, AllUnitList, UnitList)
            end;
        _ ->
            do_special_add_fighter(Num - 1, AllUnitList, UnitList)
    end.

member_leave_ob(Role) ->
    team_common:async_member(Role,
                             2,
                             {combat_util, async_member_leave_ob, []}).

async_member_leave_ob(Role = #role{id = RoleId,
                                   m_combat =
                                       MC = #m_combat{observe_pid = CombatPid}})
    when is_pid(CombatPid) ->
    CombatPid ! {observer_leave, RoleId},
    role:link_send(Role, 10706, {1, ""}),
    {ok,
     Role#role{m_combat =
                   MC#m_combat{observe_pid = undefined}}};
async_member_leave_ob(_) -> ok.

get_ai(CombatType, Type, Classes, AiId)
    when Type =:= 1 orelse Type =:= 4 ->
    case ai_data:get_combat_ai({CombatType, Classes}) of
        NewAiId when is_integer(NewAiId) -> NewAiId;
        _ -> AiId
    end;
get_ai(_, _, _, AiId) -> AiId.

ai(_CombatType, Type, BaseId, AiId) when Type =:= 2 ->
    case AiId > 0 of
        true ->
            AiList = ai_data:get_ai(AiId),
            {{AiList, []}, AiId};
        false ->
            case unit_data:get_ai(BaseId) of
                false -> {{[], []}, AiId};
                0 -> {{[], []}, AiId};
                GetAiId ->
                    AiList = ai_data:get_ai(GetAiId),
                    {{AiList, []}, GetAiId}
            end
    end;
ai(_CombatType, Type, _BaseId, AiId)
    when Type =:= 3 orelse
             Type =:= 6 orelse
                 Type =:= 1 orelse Type =:= 4 orelse Type =:= 5 ->
    case AiId > 0 of
        true ->
            AiList = ai_data:get_ai(AiId),
            {{AiList, []}, AiId};
        false -> {{[], []}, AiId}
    end;
ai(_, _, _, AiId) -> {{[], []}, AiId}.

pre_action_calc([]) -> ok;
pre_action_calc([Id | Rest]) ->
    case combat_cache:f(by_id, Id) of
        Self = #fighter{id = Sid, type = Type, action = Action,
                        pre_action =
                            {Skill = #c_skill{skill =
                                                  #skill{attack_times =
                                                             AttackTimes,
                                                         target_list =
                                                             TargetList}},
                             TargetId}}
            when Type =:= 1 orelse Type =:= 3 ->
            DoSelf = Self#fighter{action = {Skill, TargetId}},
            {Skill1, TargetId1} = case
                                      combat_skill:validate_skill(Skill, DoSelf)
                                      of
                                      {Vskill, Vtarget} -> {Vskill, Vtarget};
                                      Vskill -> {Vskill, TargetId}
                                  end,
            logger:debug("===============:~w",
                         [Skill1],
                         combat_util,
                         1140),
            {_LastTarget, ChooseSkill} = case
                                             combat_skill:validate_target(Skill1,
                                                                          Sid,
                                                                          TargetId1)
                                             of
                                             Target = #fighter{} ->
                                                 {Target, Skill1};
                                             {Skill2, Target = #fighter{}} ->
                                                 {Target, Skill2};
                                             undefined -> {undefined, Skill1}
                                         end,
            logger:debug("=================技能:~w",
                         [ChooseSkill],
                         combat_util,
                         1146),
            SkillAddtArg = #c_skill_addt_arg{},
            PreActionSelf = Self#fighter{action =
                                             {ChooseSkill, TargetId1}},
            combat_cache:u(PreActionSelf),
            case combat_skill:is_skill_in_cooldown(Sid, ChooseSkill)
                of
                false ->
                    combat:for_attack_start(1,
                                            AttackTimes,
                                            ChooseSkill,
                                            PreActionSelf,
                                            PreActionSelf,
                                            SkillAddtArg,
                                            TargetList),
                    AfterPreActionSelf = combat_cache:f(by_id, Sid),
                    combat_cache:u(AfterPreActionSelf#fighter{action =
                                                                  Action}),
                    combat_skill:add_skill_cooldown(Sid, ChooseSkill);
                _ -> ok
            end,
            pre_action_calc(Rest);
        _ -> pre_action_calc(Rest)
    end.

send_result_mail(CombatType, Atk, ScoreAtk, Dfd,
                 ScoreDfd) ->
    AtkNames = [Name
                || #fighter{name = Name, type = 1} <- Atk],
    StrAtkName =
        util:flist(string:join(lists:duplicate(length(AtkNames),
                                               "~ts"),
                               ","),
                   AtkNames),
    DfdNames = [Name
                || #fighter{name = Name, type = 1} <- Dfd],
    StrDfdName =
        util:flist(string:join(lists:duplicate(length(DfdNames),
                                               "~ts"),
                               ","),
                   DfdNames),
    {WinSc, WinNames, LoseSc, LoseNames} = case ScoreAtk >
                                                    ScoreDfd
                                               of
                                               true ->
                                                   ShowWinSc =
                                                       util:flist(lang:get("获胜方结算评分为~w%"),
                                                                  [ScoreAtk]),
                                                   ShowLoseSc =
                                                       util:flist(lang:get("战败方结算评分为~w%"),
                                                                  [ScoreDfd]),
                                                   {ShowWinSc,
                                                    StrAtkName,
                                                    ShowLoseSc,
                                                    StrDfdName};
                                               false
                                                   when ScoreAtk =:= ScoreDfd ->
                                                   ShowWinSc =
                                                       util:flist(lang:get("获胜方结算评分为~w%"),
                                                                  [ScoreAtk]),
                                                   ShowLoseSc =
                                                       util:flist(lang:get("战败方结算评分为~w%"),
                                                                  [ScoreDfd -
                                                                       1]),
                                                   {ShowWinSc,
                                                    StrAtkName,
                                                    ShowLoseSc,
                                                    StrDfdName};
                                               _ ->
                                                   ShowWinSc =
                                                       util:flist(lang:get("获胜方结算评分为~w%"),
                                                                  [ScoreDfd]),
                                                   ShowLoseSc =
                                                       util:flist(lang:get("战败方结算评分为~w%"),
                                                                  [ScoreAtk]),
                                                   {ShowWinSc,
                                                    StrDfdName,
                                                    ShowLoseSc,
                                                    StrAtkName}
                                           end,
    CombatName = log:combat_name(CombatType),
    Title = lang:get("战斗胜负公示"),
    Content =
        notice:format(lang:get("亲爱的勇者，~ts战斗中双方鏖战超时，将由系统判定胜负：\n~ts\n~ts\n~ts\n"
                               "~ts\n~ts\n~ts"),
                      [{string_2, 1, CombatName},
                       {string_2, 5, WinSc},
                       {role_2, WinNames},
                       {string_2, 5, LoseSc},
                       {role_2, LoseNames},
                       {string_2,
                        1,
                        lang:get("计算公式:(剩余单位数量*50%+每个单位剩余血量百分比)×100%")},
                       {string_2,
                        1,
                        lang:get("注意：单位不包含临时召唤物，如傀儡秘术、先祖图腾、分身等")}]),
    logger:debug("战斗结束信息:~w",
                 [{Title, Content}],
                 combat_util,
                 1190),
    put(combat_over_mail, {Title, Content}).

run({ActMod, ActFun}, Args) ->
    erlang:apply(ActMod, ActFun, Args).

