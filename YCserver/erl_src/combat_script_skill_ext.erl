-file("src/mod/combat/combat_script_skill_ext.erl", 1).

-module(combat_script_skill_ext).

-export([append_trigger/1,
         exec_trigger_before/3,
         exec_trigger_after/3]).

-export([script_1000/4,
         script_1001/4,
         script_1003/4,
         script_1004/4,
         script_1005/4,
         script_1007/4,
         script_1008/4,
         script_1009/4,
         script_1010/4,
         script_1011/4,
         script_1012/4,
         script_1013/4,
         script_1014/4,
         script_1015/4,
         script_1016/4,
         script_1017/4,
         script_1018/4,
         script_1019/4,
         script_1020/4,
         script_1021/4,
         script_2000/4,
         script_2001/4,
         script_2002/4,
         script_2003/4,
         script_2004/4]).

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

-file("src/mod/combat/combat_script_skill_ext.erl", 46).

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

-file("src/mod/combat/combat_script_skill_ext.erl", 47).

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

-file("src/mod/combat/combat_script_skill_ext.erl", 48).

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

-file("src/mod/combat/combat_script_skill_ext.erl", 49).

-spec append_trigger(Cskill :: undefined |
                               #c_skill{}) -> NewCskill :: undefined |
                                                           #c_skill{}.

append_trigger(undefined) -> undefined;
append_trigger(Cs = #c_skill{skill =
                                 #skill{addt_scripts = AddtScripts}}) ->
    do_append_trigger(Cs, AddtScripts, [], []).

do_append_trigger(Cs, [], TriggerBefore,
                  TriggerAfter) ->
    Cs#c_skill{trigger_before = TriggerBefore,
               trigger_after = TriggerAfter};
do_append_trigger(Cs, [{1, ScriptId, Args} | T],
                  TriggerBefore, TriggerAfter) ->
    Flag = case ScriptId of
               1000 -> {ok, {combat_script_skill_ext, script_1000}};
               1001 -> {ok, {combat_script_skill_ext, script_1001}};
               1003 -> {ok, {combat_script_skill_ext, script_1003}};
               1004 -> {ok, {combat_script_skill_ext, script_1004}};
               1005 -> {ok, {combat_script_skill_ext, script_1005}};
               1007 -> {ok, {combat_script_skill_ext, script_1007}};
               1008 -> {ok, {combat_script_skill_ext, script_1008}};
               1009 -> {ok, {combat_script_skill_ext, script_1009}};
               1010 -> {ok, {combat_script_skill_ext, script_1010}};
               1011 -> {ok, {combat_script_skill_ext, script_1011}};
               1012 -> {ok, {combat_script_skill_ext, script_1012}};
               1013 -> {ok, {combat_script_skill_ext, script_1013}};
               1014 -> {ok, {combat_script_skill_ext, script_1014}};
               1015 -> {ok, {combat_script_skill_ext, script_1015}};
               1016 -> {ok, {combat_script_skill_ext, script_1016}};
               1017 -> {ok, {combat_script_skill_ext, script_1017}};
               1018 -> {ok, {combat_script_skill_ext, script_1018}};
               1019 -> {ok, {combat_script_skill_ext, script_1019}};
               1020 -> {ok, {combat_script_skill_ext, script_1020}};
               1021 -> {ok, {combat_script_skill_ext, script_1021}};
               _ -> false
           end,
    case Flag of
        {ok, F} ->
            do_append_trigger(Cs,
                              T,
                              [{F, Args} | TriggerBefore],
                              TriggerAfter);
        false ->
            do_append_trigger(Cs, T, TriggerBefore, TriggerAfter)
    end;
do_append_trigger(Cs, [{2, ScriptId, Args} | T],
                  TriggerBefore, TriggerAfter) ->
    Flag = case ScriptId of
               2000 -> {ok, {combat_script_skill_ext, script_2000}};
               2001 -> {ok, {combat_script_skill_ext, script_2001}};
               2002 -> {ok, {combat_script_skill_ext, script_2002}};
               2003 -> {ok, {combat_script_skill_ext, script_2003}};
               2004 -> {ok, {combat_script_skill_ext, script_2004}};
               _ -> false
           end,
    case Flag of
        {ok, F} ->
            do_append_trigger(Cs,
                              T,
                              TriggerBefore,
                              [{F, Args} | TriggerAfter]);
        false ->
            do_append_trigger(Cs, T, TriggerBefore, TriggerAfter)
    end;
do_append_trigger(Cs, [_Err | T], TriggerBefore,
                  TriggerAfter) ->
    logger:error("无法转换的前置/后置脚本:~w",
                 [_Err],
                 combat_script_skill_ext,
                 106),
    do_append_trigger(Cs, T, TriggerBefore, TriggerAfter).

-spec exec_trigger_before(Cskill, Self,
                          Target) -> #c_skill{} when Cskill :: #c_skill{},
                                                     Self :: #fighter{},
                                                     Target :: #fighter{}.

exec_trigger_before(Cs = #c_skill{trigger_before =
                                      TriggerBefore},
                    Self, Target) ->
    do_exec_trigger_before(TriggerBefore, Self, Target, Cs).

do_exec_trigger_before([], _, _, Cs) -> Cs;
do_exec_trigger_before([{Fun, Args} | T], Self, Target,
                       Cs) ->
    Cs1 = combat_util:run(Fun, [Cs, Args, Self, Target]),
    do_exec_trigger_before(T, Self, Target, Cs1).

-spec exec_trigger_after(Cskill, Self,
                         Target) -> ok when Cskill :: #c_skill{},
                                            Self :: #fighter{},
                                            Target :: #fighter{}.

exec_trigger_after(Cs = #c_skill{trigger_after =
                                     TriggerAfter},
                   Self, Target) ->
    do_exec_trigger_after(TriggerAfter, Self, Target, Cs).

do_exec_trigger_after([], _, _, _) ->
    combat_cache:save_context([{#combat_context.kill_someone,
                                false},
                               {#combat_context.skill_crit, false},
                               {#combat_context.skill_hurt, false},
                               {#combat_context.pursue_attack, false},
                               {#combat_context.pursue_attack_list, []},
                               {#combat_context.revive_count, 0}]),
    ok;
do_exec_trigger_after([{Fun, Args} | T], Self, Target,
                      Cs) ->
    combat_util:run(Fun, [Cs, Args, Self, Target]),
    do_exec_trigger_after(T, Self, Target, Cs).

script_1000(Skill = #c_skill{skill =
                                 S = #skill{dmg_ratio = DmgRatio}},
            [BuffId, AddDmgRatioList], _Self,
            #fighter{buffs = BuffTarget}) ->
    AtkFlag = case lists:keyfind(BuffId,
                                 #c_buff.id,
                                 BuffTarget)
                  of
                  #c_buff{layer = Lay} -> {true, Lay};
                  _ -> false
              end,
    case AtkFlag of
        {true, Layer} ->
            case length(AddDmgRatioList) >= Layer of
                true ->
                    AddDmgRatio = lists:nth(Layer, AddDmgRatioList),
                    NewDmgRatio = [D + AddDmgRatio || D <- DmgRatio],
                    NewS = S#skill{dmg_ratio = NewDmgRatio},
                    Skill#c_skill{skill = NewS};
                false -> Skill
            end;
        false -> Skill
    end;
script_1000(Skill, Args, Self, _Target) ->
    err_script(Skill, Args, Self).

script_1001(Skill = #c_skill{skill =
                                 S = #skill{target_list = TargetList}},
            LevList, _Self = #fighter{lev = Lev}, _Target) ->
    case TargetList of
        [{TargetMode, TargetType, TargetNum}] ->
            NewTargetList = case gen_script_1001(Lev, LevList) of
                                {true, Num} ->
                                    NewTargetNum = max(1, TargetNum + Num - 1),
                                    [{TargetMode, TargetType, NewTargetNum}];
                                _ -> [{TargetMode, TargetType, TargetNum}]
                            end,
            Skill#c_skill{skill =
                              S#skill{target_list = NewTargetList}};
        _ -> Skill
    end;
script_1001(Skill, Args, Self, _Target) ->
    err_script(Skill, Args, Self).

gen_script_1001(Lev, LevList) ->
    gen_script_1001(Lev, LevList, 0).

gen_script_1001(_Lev, [], Num) -> {true, max(1, Num)};
gen_script_1001(Lev, [L | T], Num) when Lev >= L ->
    gen_script_1001(Lev, T, Num + 1);
gen_script_1001(_Lev, _LevList, 0) ->
    logger:error("错误的攻击参数:~w,~w",
                 [_Lev, _LevList],
                 combat_script_skill_ext,
                 212),
    {true, 1};
gen_script_1001(_Lev, _LevList, Num) -> {true, Num}.

script_1003(Skill = #c_skill{skill =
                                 S = #skill{attack_times = ActTimes,
                                            target_list = TargetList}},
            [Ratio, TargetMode, TargetNum, ActTimeList], _Self,
            #fighter{}) ->
    case util:rand(1, 1000) =< Ratio of
        true ->
            {ActNum, _} = case ActTimeList of
                              [_ | _] -> util:rand_list(ActTimeList, 2);
                              _ -> {1, 0}
                          end,
            case ActNum > 0 of
                true ->
                    NewActTimes = ActTimes + ActNum,
                    AddTargetList = [{ActTimes + Num, TargetMode, TargetNum}
                                     || Num <- lists:seq(1, ActNum)],
                    NewTargetList = TargetList ++ AddTargetList,
                    NewS = S#skill{attack_times = NewActTimes,
                                   target_list = NewTargetList},
                    Skill#c_skill{skill = NewS};
                false -> Skill
            end;
        false -> Skill
    end;
script_1003(Skill, Args, Self, _Target) ->
    err_script(Skill, Args, Self).

script_1004(Skill = #c_skill{skill =
                                 S = #skill{target_list = TargetList}},
            LevList, _Self = #fighter{lev = Lev}, _Target)
    when length(TargetList) =:= length(LevList) andalso
             LevList =/= [] ->
    CalcNum = gen_script_1004(Lev, LevList),
    AttackTimes = max(1, CalcNum),
    NewTargetList = lists:sublist(TargetList, AttackTimes),
    NewS = S#skill{attack_times = AttackTimes,
                   target_list = NewTargetList},
    Skill#c_skill{skill = NewS};
script_1004(Skill, Args, Self, _Target) ->
    err_script(Skill, Args, Self).

gen_script_1004(Lev, LevList) ->
    gen_script_1004(Lev, LevList, 0).

gen_script_1004(_Lev, [], Num) -> Num;
gen_script_1004(Lev, [L | T], Num) when Lev >= L ->
    gen_script_1004(Lev, T, Num + 1);
gen_script_1004(_Lev, _LevList, Num) -> Num.

script_1005(Skill, BuffList,
            #fighter{id = Sid, buffs = Buffs}, _Target) ->
    ClearBuff = [Buff
                 || Buff = #c_buff{id = BuffId} <- Buffs,
                    lists:member(BuffId, BuffList)],
    lists:foreach(fun (Buff) ->
                          combat_buff:buff_del(Sid, Sid, Buff)
                  end,
                  ClearBuff),
    Skill;
script_1005(Skill, Args, Self, _Target) ->
    err_script(Skill, Args, Self).

script_1007(Skill = #c_skill{skill =
                                 S = #skill{attack_times = ActTimes,
                                            target_list = TargetList}},
            [BuffId, TargetMode, TargetNum], _Self,
            #fighter{buffs = BuffTarget}) ->
    AtkFlag = case lists:keyfind(BuffId,
                                 #c_buff.id,
                                 BuffTarget)
                  of
                  #c_buff{} -> true;
                  _ -> false
              end,
    case AtkFlag of
        true ->
            NewActTimes = ActTimes + 1,
            NewTargetList = TargetList ++
                                [{ActTimes + 1, TargetMode, TargetNum}],
            NewS = S#skill{attack_times = NewActTimes,
                           target_list = NewTargetList},
            Skill#c_skill{skill = NewS};
        false -> Skill
    end;
script_1007(Skill, Args, Self, _Target) ->
    err_script(Skill, Args, Self).

script_1008(Skill = #c_skill{skill =
                                 S = #skill{buff_target = AddBuffTargets}},
            [BuffId, DelBuffId], #fighter{buffs = SelfBuffs},
            _Target) ->
    AtkFlag = case lists:keyfind(BuffId,
                                 #c_buff.id,
                                 SelfBuffs)
                  of
                  #c_buff{} -> true;
                  _ -> false
              end,
    case AtkFlag of
        false ->
            NewAddBuff = gen_script_1008(AddBuffTargets, DelBuffId),
            NewS = S#skill{buff_target = NewAddBuff},
            Skill#c_skill{skill = NewS};
        true -> Skill
    end;
script_1008(Skill, Args, Self, _Target) ->
    err_script(Skill, Args, Self).

gen_script_1008(AddBuff, DelBuffId) ->
    gen_script_1008(AddBuff, DelBuffId, []).

gen_script_1008([], _Del, AddBuff) ->
    lists:reverse(AddBuff);
gen_script_1008([BuffList | T], Del, AddBuff) ->
    NewBuffList = lists:keydelete(Del,
                                  #c_buff.id,
                                  BuffList),
    gen_script_1008(T, Del, [NewBuffList | AddBuff]).

script_1009(Skill = #c_skill{skill =
                                 S = #skill{script_args = ScriptArgs}},
            UpdateArgs, _Self, _Target) ->
    ArgsLen = length(ScriptArgs),
    NewScripts = gen_script_1009(ScriptArgs,
                                 ArgsLen,
                                 UpdateArgs),
    NewS = S#skill{script_args = NewScripts},
    Skill#c_skill{skill = NewS};
script_1009(Skill, Args, Self, _Target) ->
    err_script(Skill, Args, Self).

gen_script_1009(ScriptArgs, _, []) -> ScriptArgs;
gen_script_1009(ScriptArgs, ArgsLen, [{Key, List} | T])
    when Key =< ArgsLen ->
    OldVal = lists:nth(Key, ScriptArgs),
    {Val, _} = util:rand_list(List, 2),
    NewVal = if is_integer(OldVal) andalso
                    is_integer(Val) ->
                    OldVal + Val;
                is_list(OldVal) andalso is_list(Val) -> OldVal ++ Val;
                true -> OldVal
             end,
    NewScriptArgs = do_gen_script_1009(ScriptArgs,
                                       {Key, NewVal},
                                       1,
                                       []),
    gen_script_1009(NewScriptArgs, ArgsLen, T).

do_gen_script_1009([], _, _, Args) ->
    lists:reverse(Args);
do_gen_script_1009([_ | T], {Key, NewVal}, Key, Args) ->
    lists:reverse([NewVal | Args]) ++ T;
do_gen_script_1009([H | T], {Key, NewVal}, Num, Args) ->
    do_gen_script_1009(T,
                       {Key, NewVal},
                       Num + 1,
                       [H | Args]).

script_1010(Skill = #c_skill{skill =
                                 S = #skill{script_args = ScriptArgs}},
            [Key, LevList], _Self = #fighter{lev = Lev}, _Target) ->
    Val = gen_script_1010(Lev, LevList),
    NewScripts = do_gen_script_1010(ScriptArgs,
                                    {Key, Val},
                                    1,
                                    []),
    NewS = S#skill{script_args = NewScripts},
    Skill#c_skill{skill = NewS};
script_1010(Skill, Args, Self, _Target) ->
    err_script(Skill, Args, Self).

gen_script_1010(_Lev, []) -> 1;
gen_script_1010(Lev, [{NeedLev, Val} | _T])
    when Lev >= NeedLev ->
    Val;
gen_script_1010(Lev, [_ | T]) ->
    gen_script_1010(Lev, T).

do_gen_script_1010([], _, _, Args) ->
    lists:reverse(Args);
do_gen_script_1010([_ | T], {Key, NewVal}, Key, Args) ->
    lists:reverse([NewVal | Args]) ++ T;
do_gen_script_1010([H | T], {Key, NewVal}, Num, Args) ->
    do_gen_script_1010(T,
                       {Key, NewVal},
                       Num + 1,
                       [H | Args]).

script_1011(Skill = #c_skill{skill =
                                 S = #skill{script_args = ScriptArgs}},
            [BuffId, Ratio, UpdateArgs],
            _Self = #fighter{buffs = Buffs}, _Target) ->
    case lists:keyfind(BuffId, #c_buff.id, Buffs) of
        #c_buff{} ->
            case util:rand(1, 1000) =< Ratio of
                true ->
                    ArgsLen = length(ScriptArgs),
                    NewScripts = gen_script_1011(ScriptArgs,
                                                 ArgsLen,
                                                 UpdateArgs),
                    NewS = S#skill{script_args = NewScripts},
                    Skill#c_skill{skill = NewS};
                false -> Skill
            end;
        _ -> Skill
    end;
script_1011(Skill, Args, Self, _Target) ->
    err_script(Skill, Args, Self).

gen_script_1011(ScriptArgs, _, []) -> ScriptArgs;
gen_script_1011(ScriptArgs, ArgsLen, [{Key, Val} | T])
    when Key =< ArgsLen ->
    OldVal = lists:nth(Key, ScriptArgs),
    NewVal = if is_integer(OldVal) andalso
                    is_integer(Val) ->
                    OldVal + Val;
                is_list(OldVal) andalso is_list(Val) -> OldVal ++ Val;
                true -> OldVal
             end,
    NewScriptArgs = do_gen_script_1011(ScriptArgs,
                                       {Key, NewVal},
                                       1,
                                       []),
    gen_script_1011(NewScriptArgs, ArgsLen, T).

do_gen_script_1011([], _, _, Args) ->
    lists:reverse(Args);
do_gen_script_1011([_ | T], {Key, NewVal}, Key, Args) ->
    lists:reverse([NewVal | Args]) ++ T;
do_gen_script_1011([H | T], {Key, NewVal}, Num, Args) ->
    do_gen_script_1011(T,
                       {Key, NewVal},
                       Num + 1,
                       [H | Args]).

script_1012(Skill = #c_skill{skill =
                                 S = #skill{buff_target = BuffTarget}},
            [BuffId, Ratio, Flag, UpdateBuff],
            _Self = #fighter{buffs = Buffs}, _Target) ->
    case lists:keyfind(BuffId, #c_buff.id, Buffs) of
        #c_buff{} ->
            case util:rand(1, 1000) =< Ratio of
                true ->
                    OldTBuff = case length(BuffTarget) >= Flag of
                                   true -> lists:nth(Flag, BuffTarget);
                                   false -> []
                               end,
                    OldTBuff1 = case OldTBuff of
                                    [_ | _] -> OldTBuff;
                                    _ -> []
                                end,
                    UpdateBuff1 =
                        combat_script_buff:convert_buff(UpdateBuff),
                    NewTBuff = combat_skill:merge_buff(OldTBuff1,
                                                       UpdateBuff1),
                    NewBuffTarget = util:update_list(Flag,
                                                     BuffTarget,
                                                     NewTBuff),
                    NewS = S#skill{buff_target = NewBuffTarget},
                    Skill#c_skill{skill = NewS};
                false -> Skill
            end;
        _ -> Skill
    end;
script_1012(Skill, Args, Self, _Target) ->
    err_script(Skill, Args, Self).

script_1013(Skill = #c_skill{special_type =
                                 SpecialType},
            [NeedMaxLayer],
            _Self = #fighter{id = Sid, buffs = Buffs,
                             special_status = #special_status{energy = Energy},
                             name = Sname},
            _Target = #fighter{name = Tname}) ->
    case NeedMaxLayer of
        1 ->
            case Energy >= 3 of
                true ->
                    case lists:keyfind(energy, #c_buff.sec_type, Buffs) of
                        EnergyBuff = #c_buff{} ->
                            combat_buff:buff_del(Sid, Sid, EnergyBuff);
                        _ -> ignore
                    end,
                    Skill#c_skill{special_type =
                                      [max_energy | SpecialType]};
                false -> Skill
            end;
        0 ->
            Skill#c_skill{special_type =
                              [max_energy | SpecialType]};
        _Err ->
            logger:error("[~ts]对[~ts]释放技能时出错[Skill:~w][~w]",
                         [Sname, Tname, Skill, _Err],
                         combat_script_skill_ext,
                         455),
            Skill
    end;
script_1013(Skill, Args, Self, _Target) ->
    err_script(Skill, Args, Self).

script_1014(Skill = #c_skill{skill =
                                 S = #skill{attack_times = ActTimes,
                                            target_list = TargetList}},
            [], _Self = #fighter{order = Sorder},
            #fighter{order = Torder}) ->
    Flag = case Sorder < Torder of
               true -> atk;
               false -> buff
           end,
    case Flag of
        atk ->
            NewActTimes = ActTimes + 1,
            NewTargetList = TargetList ++ [{ActTimes + 1, 2, 1}],
            NewS = S#skill{attack_times = NewActTimes,
                           target_list = NewTargetList, buff_self = []},
            Skill#c_skill{skill = NewS};
        buff -> Skill
    end;
script_1014(Skill, Args, Self, _Target) ->
    err_script(Skill, Args, Self).

script_1015(Skill = #c_skill{skill =
                                 S = #skill{script_id = ScriptId,
                                            script_args = ScriptArgs,
                                            target_list = TargetList}},
            RatioList, _Self = #fighter{}, _Target) ->
    case TargetList of
        [{TargetMode, TargetType, TargetNum}] ->
            {AddNum, _} = util:rand_list(RatioList, 2),
            NewTargetList = [{TargetMode,
                              TargetType,
                              TargetNum + AddNum}],
            NewScriptArgs = case ScriptId of
                                20060 ->
                                    case ScriptArgs of
                                        [InjuryRatio,
                                         LinkHurtRatio,
                                         TargetNnum,
                                         MgRatioList] ->
                                            [InjuryRatio,
                                             LinkHurtRatio,
                                             TargetNnum + AddNum,
                                             MgRatioList];
                                        _ -> ScriptArgs
                                    end;
                                _ -> ScriptArgs
                            end,
            Skill#c_skill{skill =
                              S#skill{script_args = NewScriptArgs,
                                      target_list = NewTargetList}};
        _ -> Skill
    end;
script_1015(Skill, Args, Self, _Target) ->
    err_script(Skill, Args, Self).

script_1016(Skill = #c_skill{skill = S = #skill{}},
            [Key], _Self = #fighter{lev = Lev}, _Target) ->
    case skill_combat_data:get_dmg_addt({Key, Lev}) of
        DmgAddt when is_integer(DmgAddt) ->
            Skill#c_skill{skill = S#skill{dmg_addt = DmgAddt}};
        _ -> Skill
    end;
script_1016(Skill, Args, Self, _Target) ->
    err_script(Skill, Args, Self).

script_1017(Skill = #c_skill{special_type =
                                 SpecialType},
            [], _Self = #fighter{}, _Target) ->
    NewSpecialType = [anger_skill | SpecialType],
    Skill#c_skill{special_type = NewSpecialType};
script_1017(Skill, Args, Self, _Target) ->
    err_script(Skill, Args, Self).

script_1018(Skill = #c_skill{skill =
                                 S = #skill{target_list = TargetList}},
            [BuffId],
            _Self = #fighter{id = Sid, buffs = Buffs,
                             name = _Sname},
            _Target = #fighter{name = _Tname}) ->
    case lists:keyfind(BuffId, #c_buff.id, Buffs) of
        Buff = #c_buff{layer = Layer} ->
            combat_buff:buff_del(Sid, Sid, Buff),
            case TargetList of
                [{TargetMode, TargetType, TargetNum}] ->
                    NewTargetList = [{TargetMode,
                                      TargetType,
                                      TargetNum + Layer}],
                    Skill#c_skill{skill =
                                      S#skill{target_list = NewTargetList}};
                _ -> Skill
            end;
        _ -> Skill
    end;
script_1018(Skill, Args, Self, _Target) ->
    err_script(Skill, Args, Self).

script_1019(Skill = #c_skill{}, [BuffId],
            _Self = #fighter{id = Sid, buffs = Buffs,
                             name = _Sname},
            _Target = #fighter{name = _Tname}) ->
    case lists:keyfind(BuffId, #c_buff.id, Buffs) of
        Buff = #c_buff{layer = Layer} ->
            combat_buff:buff_del(Sid, Sid, Buff),
            combat_cache:u(Sid, [{multi_atk_num, 0, Layer}]),
            Skill;
        _ -> Skill
    end;
script_1019(Skill, Args, Self, _Target) ->
    err_script(Skill, Args, Self).

script_1020(Skill = #c_skill{skill =
                                 S = #skill{attack_times = AttackTimes,
                                            target_list = TargetList}},
            [RandList], _Self = #fighter{}, _Target = #fighter{}) ->
    logger:debug("随机技能目标:~w",
                 [RandList],
                 combat_script_skill_ext,
                 563),
    AddNum = case util:rand_list(RandList, 1) of
                 {_, _AddNum} -> _AddNum;
                 _ -> 0
             end,
    logger:debug("随机技能目标:~w",
                 [AddNum],
                 combat_script_skill_ext,
                 568),
    NewAttackTimes = AttackTimes + AddNum,
    logger:debug("随机技能目标:~w",
                 [NewAttackTimes],
                 combat_script_skill_ext,
                 570),
    NewTargetList = case TargetList of
                        [_Elem | _] -> lists:duplicate(NewAttackTimes, _Elem);
                        _ -> TargetList
                    end,
    NewSkill = Skill#c_skill{skill =
                                 S#skill{attack_times = NewAttackTimes,
                                         target_list = NewTargetList}},
    logger:debug("随机技能目标:~w",
                 [NewSkill],
                 combat_script_skill_ext,
                 577),
    NewSkill;
script_1020(Skill, Args, Self, _Target) ->
    err_script(Skill, Args, Self).

script_1021(Skill = #c_skill{skill =
                                 S = #skill{attack_times = AttackTimes,
                                            target_list = TargetList}},
            [ScriptId],
            _Self = #fighter{passive_skills = PassiveSkills},
            _Target = #fighter{}) ->
    case combat_cache:f(by_script_id,
                        PassiveSkills,
                        ScriptId)
        of
        #c_skill{skill =
                     #skill{script_args = [Ratio1, Ratio2, _, _]}} ->
            AddNum = case Ratio1 =< util:rand(1, 1000) of
                         true ->
                             case Ratio2 =< util:rand(1, 1000) of
                                 true -> 2;
                                 _ -> 1
                             end;
                         _ -> 0
                     end,
            NewAttackTimes = AttackTimes + AddNum,
            NewTargetList = case TargetList of
                                [_Elem | _] ->
                                    lists:duplicate(NewAttackTimes, _Elem);
                                _ -> TargetList
                            end,
            NewSkill = Skill#c_skill{skill =
                                         S#skill{attack_times = NewAttackTimes,
                                                 target_list = NewTargetList}},
            logger:debug("随机技能目标:~w",
                         [NewSkill],
                         combat_script_skill_ext,
                         604),
            NewSkill;
        _ -> Skill
    end;
script_1021(Skill, Args, Self, _Target) ->
    err_script(Skill, Args, Self).

script_2000(_Skill, [Buff], Self, _Target) ->
    case
        combat_cache:get_context_elem([#combat_context.skill_crit])
        of
        [true] ->
            AddBuffs = combat_script_buff:convert_buff([Buff]),
            lists:foreach(fun (Abuff) ->
                                  combat_buff:buff_add(Abuff, Self, Self)
                          end,
                          AddBuffs);
        _ -> skip
    end,
    ok;
script_2000(Skill, Args, Self, _Target) ->
    err_script(Skill, Args, Self).

script_2001(_Skill, [Buff], Self, _Target) ->
    AddBuffs = combat_script_buff:convert_buff([Buff]),
    lists:foreach(fun (Abuff) ->
                          combat_buff:buff_add(Abuff, Self, Self)
                  end,
                  AddBuffs),
    ok;
script_2001(Skill, Args, Self, _Target) ->
    err_script(Skill, Args, Self).

script_2002(_Skill, [],
            #fighter{id = Sid, buffs = Buffs}, _Target) ->
    ClearBuff = [Buff
                 || Buff = #c_buff{sec_type = control} <- Buffs],
    lists:foreach(fun (Buff) ->
                          combat_buff:buff_del(Sid, Sid, Buff)
                  end,
                  ClearBuff),
    ok;
script_2002(Skill, Args, Self, _Target) ->
    err_script(Skill, Args, Self).

script_2003(_Skill, [Ratio, Buff], Self, _Target) ->
    case util:rand(1, 1000) =< Ratio of
        true ->
            AddBuffs = combat_script_buff:convert_buff(Buff),
            lists:foreach(fun (Abuff) ->
                                  combat_buff:buff_add(Abuff, Self, Self)
                          end,
                          AddBuffs),
            ok;
        _ -> ok
    end;
script_2003(Skill, Args, Self, _Target) ->
    err_script(Skill, Args, Self).

script_2004(_Skill, [Buff],
            Self = #fighter{id = Sid,
                            special_attr =
                                #special_attr{control_num = ControlNum},
                            buffs = Buffs},
            _Target) ->
    case ControlNum > 0 of
        true ->
            ClearBuff = [B
                         || B = #c_buff{sec_type = SecType} <- Buffs,
                            SecType =:= add_control_ratio],
            lists:foreach(fun (Cb) ->
                                  combat_buff:buff_del(Sid, Sid, Cb)
                          end,
                          ClearBuff),
            ok;
        _ ->
            AddBuffs = combat_script_buff:convert_buff([Buff]),
            lists:foreach(fun (Abuff) ->
                                  combat_buff:buff_add(Abuff, Self, Self)
                          end,
                          AddBuffs),
            ok
    end;
script_2004(Skill, Args, Self, _Target) ->
    err_script(Skill, Args, Self).

err_script(Skill = #c_skill{id = Id}, Args,
           #fighter{name = Name}) ->
    logger:error("[~ts]在使用技能:~w,参数不匹配:~w",
                 [Name, Id, Args],
                 combat_script_skill_ext,
                 675),
    Skill.

