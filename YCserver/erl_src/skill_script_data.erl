-file("src/data/skill_script_data.erl", 1).

-module(skill_script_data).

-export([get_buff/1, get_init_buff/1]).

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

-file("src/data/skill_script_data.erl", 14).

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

-file("src/data/skill_script_data.erl", 15).

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

-file("src/data/skill_script_data.erl", 16).

get_buff(10000) ->
    #c_buff_base{id = 10000, eff_type = buff, type = 10000,
                 max_layer = 1};
get_buff(10001) ->
    #c_buff_base{id = 10001, eff_type = debuff,
                 type = 20010, max_layer = 3, script_id = 200001};
get_buff(10002) ->
    #c_buff_base{id = 10002, eff_type = debuff,
                 type = 20042, max_layer = 1, script_id = 227000};
get_buff(10003) ->
    #c_buff_base{id = 10003, eff_type = buff, type = 10110,
                 max_layer = 1, script_id = 107010};
get_buff(10004) ->
    #c_buff_base{id = 10004, eff_type = debuff,
                 type = 20015, max_layer = 1, script_id = 204020};
get_buff(10005) ->
    #c_buff_base{id = 10005, eff_type = debuff,
                 type = 20019, max_layer = 1, script_id = 206020};
get_buff(10006) ->
    #c_buff_base{id = 10006, eff_type = debuff,
                 type = 20035, max_layer = 1, script_id = 221000};
get_buff(10007) ->
    #c_buff_base{id = 10007, eff_type = buff, type = 10000,
                 max_layer = 1};
get_buff(10010) ->
    #c_buff_base{id = 10010, eff_type = buff, type = 10000,
                 max_layer = 1};
get_buff(10011) ->
    #c_buff_base{id = 10011, eff_type = buff, type = 10000,
                 max_layer = 1};
get_buff(10012) ->
    #c_buff_base{id = 10012, eff_type = buff, type = 10000,
                 max_layer = 1};
get_buff(10013) ->
    #c_buff_base{id = 10013, eff_type = buff, type = 10000,
                 max_layer = 1};
get_buff(10014) ->
    #c_buff_base{id = 10014, eff_type = buff, type = 10000,
                 max_layer = 1};
get_buff(10020) ->
    #c_buff_base{id = 10020, eff_type = buff, type = 10000,
                 max_layer = 1};
get_buff(10021) ->
    #c_buff_base{id = 10021, eff_type = buff, type = 10000,
                 max_layer = 1};
get_buff(10022) ->
    #c_buff_base{id = 10022, eff_type = buff, type = 10000,
                 max_layer = 1};
get_buff(10023) ->
    #c_buff_base{id = 10023, eff_type = buff, type = 10000,
                 max_layer = 1};
get_buff(10024) ->
    #c_buff_base{id = 10024, eff_type = buff, type = 10000,
                 max_layer = 1};
get_buff(10025) ->
    #c_buff_base{id = 10025, eff_type = buff, type = 10000,
                 max_layer = 1};
get_buff(10026) ->
    #c_buff_base{id = 10026, eff_type = buff, type = 10000,
                 max_layer = 1};
get_buff(10027) ->
    #c_buff_base{id = 10027, eff_type = buff, type = 10000,
                 max_layer = 1};
get_buff(10028) ->
    #c_buff_base{id = 10028, eff_type = buff, type = 10000,
                 max_layer = 1};
get_buff(10029) ->
    #c_buff_base{id = 10029, eff_type = buff, type = 10000,
                 max_layer = 1};
get_buff(10030) ->
    #c_buff_base{id = 10030, eff_type = buff, type = 10000,
                 max_layer = 1};
get_buff(10031) ->
    #c_buff_base{id = 10031, eff_type = buff, type = 10000,
                 max_layer = 1};
get_buff(10032) ->
    #c_buff_base{id = 10032, eff_type = buff, type = 10000,
                 max_layer = 1};
get_buff(10047) ->
    #c_buff_base{id = 10047, eff_type = buff, type = 10000,
                 max_layer = 1};
get_buff(10048) ->
    #c_buff_base{id = 10048, eff_type = buff, type = 10000,
                 max_layer = 1};
get_buff(10049) ->
    #c_buff_base{id = 10049, eff_type = buff, type = 10000,
                 max_layer = 1};
get_buff(10050) ->
    #c_buff_base{id = 10050, eff_type = buff, type = 10000,
                 max_layer = 1};
get_buff(10051) ->
    #c_buff_base{id = 10051, eff_type = buff, type = 10000,
                 max_layer = 1};
get_buff(10052) ->
    #c_buff_base{id = 10052, eff_type = buff, type = 10000,
                 max_layer = 1};
get_buff(20001) ->
    #c_buff_base{id = 20001, eff_type = buff, type = 10290,
                 max_layer = 3, script_id = 124000};
get_buff(20002) ->
    #c_buff_base{id = 20002, eff_type = debuff,
                 type = 20030, max_layer = 1, script_id = 206020};
get_buff(20003) ->
    #c_buff_base{id = 20003, eff_type = debuff,
                 type = 20035, max_layer = 1, script_id = 221000};
get_buff(20004) ->
    #c_buff_base{id = 20004, eff_type = buff, type = 20004,
                 max_layer = 1, script_id = 107013};
get_buff(20005) ->
    #c_buff_base{id = 20005, eff_type = buff, type = 20005,
                 max_layer = 1, script_id = 100000};
get_buff(20006) ->
    #c_buff_base{id = 20006, eff_type = buff, type = 20006,
                 max_layer = 1, script_id = 161001};
get_buff(30001) ->
    #c_buff_base{id = 30001, eff_type = buff, type = 10300,
                 max_layer = 1, script_id = 125000};
get_buff(30002) ->
    #c_buff_base{id = 30002, eff_type = buff, type = 10270,
                 max_layer = 1, script_id = 120000};
get_buff(30003) ->
    #c_buff_base{id = 30003, eff_type = buff, type = 10190,
                 max_layer = 1, script_id = 111020};
get_buff(30004) ->
    #c_buff_base{id = 30004, eff_type = debuff,
                 type = 20042, max_layer = 1, script_id = 227000};
get_buff(30005) ->
    #c_buff_base{id = 30005, eff_type = debuff,
                 type = 20029, max_layer = 1, script_id = 211020};
get_buff(30006) ->
    #c_buff_base{id = 30006, eff_type = buff, type = 30006,
                 max_layer = 1, script_id = 117021};
get_buff(30007) ->
    #c_buff_base{id = 30007, eff_type = debuff,
                 type = 20027, max_layer = 1, script_id = 210010};
get_buff(30008) ->
    #c_buff_base{id = 30008, eff_type = debuff,
                 type = 20049, max_layer = 1, script_id = 238000};
get_buff(30009) ->
    #c_buff_base{id = 30009, eff_type = debuff,
                 type = 30009, max_layer = 1, script_id = 239000};
get_buff(31002) ->
    #c_buff_base{id = 31002, eff_type = buff, type = 10000,
                 max_layer = 1};
get_buff(31003) ->
    #c_buff_base{id = 31003, eff_type = buff, type = 10000,
                 max_layer = 1};
get_buff(40001) ->
    #c_buff_base{id = 40001, eff_type = debuff,
                 type = 20041, max_layer = 1, script_id = 225000};
get_buff(40002) ->
    #c_buff_base{id = 40002, eff_type = buff, type = 10380,
                 max_layer = 1, script_id = 133000};
get_buff(40003) ->
    #c_buff_base{id = 40003, eff_type = debuff,
                 type = 20039, max_layer = 1, script_id = 222000};
get_buff(40004) ->
    #c_buff_base{id = 40004, eff_type = buff, type = 30010,
                 max_layer = 1, script_id = 144000};
get_buff(40005) ->
    #c_buff_base{id = 40005, eff_type = debuff,
                 type = 20041, max_layer = 1, script_id = 225000};
get_buff(40006) ->
    #c_buff_base{id = 40006, eff_type = debuff,
                 type = 20013, max_layer = 1, script_id = 203020};
get_buff(40007) ->
    #c_buff_base{id = 40007, eff_type = debuff,
                 type = 20044, max_layer = 1, script_id = 230021};
get_buff(40008) ->
    #c_buff_base{id = 40008, eff_type = buff, type = 10090,
                 max_layer = 1, script_id = 106020};
get_buff(40009) ->
    #c_buff_base{id = 40009, eff_type = buff, type = 10300,
                 max_layer = 2, script_id = 143000};
get_buff(40010) ->
    #c_buff_base{id = 40010, eff_type = debuff,
                 type = 20045, max_layer = 1, script_id = 234001};
get_buff(40011) ->
    #c_buff_base{id = 40011, eff_type = buff, type = 40011,
                 max_layer = 1, script_id = 142000};
get_buff(40012) ->
    #c_buff_base{id = 40012, eff_type = buff, type = 10230,
                 max_layer = 1, script_id = 114010};
get_buff(40013) ->
    #c_buff_base{id = 40013, eff_type = buff, type = 10230,
                 max_layer = 1, script_id = 114010};
get_buff(40014) ->
    #c_buff_base{id = 40014, eff_type = buff, type = 40014,
                 max_layer = 1, script_id = 100000};
get_buff(40015) ->
    #c_buff_base{id = 40015, eff_type = buff, type = 40015,
                 max_layer = 1, script_id = 100000};
get_buff(40016) ->
    #c_buff_base{id = 40016, eff_type = debuff,
                 type = 20042, max_layer = 1, script_id = 227000};
get_buff(40017) ->
    #c_buff_base{id = 40017, eff_type = debuff,
                 type = 40017, max_layer = 1, script_id = 225001};
get_buff(50000) ->
    #c_buff_base{id = 50000, eff_type = buff, type = 10000,
                 max_layer = 1};
get_buff(50001) ->
    #c_buff_base{id = 50001, eff_type = buff, type = 10010,
                 max_layer = 1, script_id = 102020};
get_buff(50002) ->
    #c_buff_base{id = 50002, eff_type = debuff,
                 type = 20040, max_layer = 1, script_id = 223000};
get_buff(50003) ->
    #c_buff_base{id = 50003, eff_type = buff, type = 10210,
                 max_layer = 1, script_id = 112020};
get_buff(50004) ->
    #c_buff_base{id = 50004, eff_type = buff, type = 10350,
                 max_layer = 1, script_id = 130021};
get_buff(50005) ->
    #c_buff_base{id = 50005, eff_type = buff, type = 50005,
                 max_layer = 1, script_id = 133000};
get_buff(50006) ->
    #c_buff_base{id = 50006, eff_type = buff, type = 50006,
                 max_layer = 1, script_id = 125001};
get_buff(50007) ->
    #c_buff_base{id = 50007, eff_type = debuff,
                 type = 20040, max_layer = 1, script_id = 223001};
get_buff(50008) ->
    #c_buff_base{id = 50008, eff_type = buff, type = 50005,
                 max_layer = 1, script_id = 133000};
get_buff(50009) ->
    #c_buff_base{id = 50009, eff_type = buff, type = 80040,
                 max_layer = 1, script_id = 117020};
get_buff(50010) ->
    #c_buff_base{id = 50010, eff_type = buff, type = 10000,
                 max_layer = 1};
get_buff(50011) ->
    #c_buff_base{id = 50011, eff_type = buff, type = 10000,
                 max_layer = 1};
get_buff(50012) ->
    #c_buff_base{id = 50012, eff_type = buff, type = 10000,
                 max_layer = 1};
get_buff(50013) ->
    #c_buff_base{id = 50013, eff_type = buff, type = 10000,
                 max_layer = 1};
get_buff(50014) ->
    #c_buff_base{id = 50014, eff_type = buff, type = 10000,
                 max_layer = 1};
get_buff(50020) ->
    #c_buff_base{id = 50020, eff_type = buff, type = 10000,
                 max_layer = 1};
get_buff(50021) ->
    #c_buff_base{id = 50021, eff_type = buff, type = 10000,
                 max_layer = 1};
get_buff(50022) ->
    #c_buff_base{id = 50022, eff_type = buff, type = 10000,
                 max_layer = 1};
get_buff(50023) ->
    #c_buff_base{id = 50023, eff_type = buff, type = 10000,
                 max_layer = 1};
get_buff(50024) ->
    #c_buff_base{id = 50024, eff_type = buff, type = 10000,
                 max_layer = 1};
get_buff(50025) ->
    #c_buff_base{id = 50025, eff_type = buff, type = 10000,
                 max_layer = 1};
get_buff(50026) ->
    #c_buff_base{id = 50026, eff_type = buff, type = 10000,
                 max_layer = 1};
get_buff(50027) ->
    #c_buff_base{id = 50027, eff_type = buff, type = 10000,
                 max_layer = 1};
get_buff(50028) ->
    #c_buff_base{id = 50028, eff_type = buff, type = 10000,
                 max_layer = 1};
get_buff(50029) ->
    #c_buff_base{id = 50029, eff_type = buff, type = 10000,
                 max_layer = 1};
get_buff(50030) ->
    #c_buff_base{id = 50030, eff_type = buff, type = 10000,
                 max_layer = 1};
get_buff(50031) ->
    #c_buff_base{id = 50031, eff_type = buff, type = 10000,
                 max_layer = 1};
get_buff(50032) ->
    #c_buff_base{id = 50032, eff_type = buff, type = 10000,
                 max_layer = 1};
get_buff(50033) ->
    #c_buff_base{id = 50033, eff_type = buff, type = 10000,
                 max_layer = 1};
get_buff(51000) ->
    #c_buff_base{id = 51000, eff_type = buff, type = 10000,
                 max_layer = 1};
get_buff(51001) ->
    #c_buff_base{id = 51001, eff_type = buff, type = 10000,
                 max_layer = 1};
get_buff(51002) ->
    #c_buff_base{id = 51002, eff_type = buff, type = 10000,
                 max_layer = 1};
get_buff(51003) ->
    #c_buff_base{id = 51003, eff_type = buff, type = 10000,
                 max_layer = 1};
get_buff(51004) ->
    #c_buff_base{id = 51004, eff_type = buff, type = 10000,
                 max_layer = 1};
get_buff(51005) ->
    #c_buff_base{id = 51005, eff_type = buff, type = 10000,
                 max_layer = 1};
get_buff(51006) ->
    #c_buff_base{id = 51006, eff_type = buff, type = 10000,
                 max_layer = 1};
get_buff(51007) ->
    #c_buff_base{id = 51007, eff_type = buff, type = 10000,
                 max_layer = 1};
get_buff(51008) ->
    #c_buff_base{id = 51008, eff_type = buff, type = 10000,
                 max_layer = 1};
get_buff(51009) ->
    #c_buff_base{id = 51009, eff_type = buff, type = 10000,
                 max_layer = 1};
get_buff(51010) ->
    #c_buff_base{id = 51010, eff_type = buff, type = 10000,
                 max_layer = 1};
get_buff(51011) ->
    #c_buff_base{id = 51011, eff_type = buff, type = 10000,
                 max_layer = 1};
get_buff(51012) ->
    #c_buff_base{id = 51012, eff_type = buff, type = 10000,
                 max_layer = 1};
get_buff(51013) ->
    #c_buff_base{id = 51013, eff_type = buff, type = 10000,
                 max_layer = 1};
get_buff(51014) ->
    #c_buff_base{id = 51014, eff_type = buff, type = 10000,
                 max_layer = 1};
get_buff(51100) ->
    #c_buff_base{id = 51100, eff_type = buff, type = 10000,
                 max_layer = 1};
get_buff(51101) ->
    #c_buff_base{id = 51101, eff_type = buff, type = 10000,
                 max_layer = 1};
get_buff(51102) ->
    #c_buff_base{id = 51102, eff_type = buff, type = 10000,
                 max_layer = 1};
get_buff(51103) ->
    #c_buff_base{id = 51103, eff_type = buff, type = 10000,
                 max_layer = 1};
get_buff(51104) ->
    #c_buff_base{id = 51104, eff_type = buff, type = 10000,
                 max_layer = 1};
get_buff(51105) ->
    #c_buff_base{id = 51105, eff_type = buff, type = 10000,
                 max_layer = 1};
get_buff(51106) ->
    #c_buff_base{id = 51106, eff_type = buff, type = 10000,
                 max_layer = 1};
get_buff(51107) ->
    #c_buff_base{id = 51107, eff_type = buff, type = 10000,
                 max_layer = 1};
get_buff(51108) ->
    #c_buff_base{id = 51108, eff_type = buff, type = 10000,
                 max_layer = 1};
get_buff(51109) ->
    #c_buff_base{id = 51109, eff_type = buff, type = 10000,
                 max_layer = 1};
get_buff(51110) ->
    #c_buff_base{id = 51110, eff_type = buff, type = 10000,
                 max_layer = 1};
get_buff(51111) ->
    #c_buff_base{id = 51111, eff_type = buff, type = 10000,
                 max_layer = 1};
get_buff(51112) ->
    #c_buff_base{id = 51112, eff_type = buff, type = 10000,
                 max_layer = 1};
get_buff(51200) ->
    #c_buff_base{id = 51200, eff_type = buff, type = 10000,
                 max_layer = 1};
get_buff(51201) ->
    #c_buff_base{id = 51201, eff_type = buff, type = 10000,
                 max_layer = 1};
get_buff(51202) ->
    #c_buff_base{id = 51202, eff_type = buff, type = 10000,
                 max_layer = 1};
get_buff(51203) ->
    #c_buff_base{id = 51203, eff_type = buff, type = 10000,
                 max_layer = 1};
get_buff(51204) ->
    #c_buff_base{id = 51204, eff_type = buff, type = 10000,
                 max_layer = 1};
get_buff(51205) ->
    #c_buff_base{id = 51205, eff_type = buff, type = 10000,
                 max_layer = 1};
get_buff(51206) ->
    #c_buff_base{id = 51206, eff_type = buff, type = 10000,
                 max_layer = 1};
get_buff(51207) ->
    #c_buff_base{id = 51207, eff_type = buff, type = 10000,
                 max_layer = 1};
get_buff(51208) ->
    #c_buff_base{id = 51208, eff_type = buff, type = 10000,
                 max_layer = 1};
get_buff(51209) ->
    #c_buff_base{id = 51209, eff_type = buff, type = 10000,
                 max_layer = 1};
get_buff(51210) ->
    #c_buff_base{id = 51210, eff_type = buff, type = 10000,
                 max_layer = 1};
get_buff(51211) ->
    #c_buff_base{id = 51211, eff_type = buff, type = 10000,
                 max_layer = 1};
get_buff(51212) ->
    #c_buff_base{id = 51212, eff_type = buff, type = 10000,
                 max_layer = 1};
get_buff(51213) ->
    #c_buff_base{id = 51213, eff_type = buff, type = 80040,
                 max_layer = 1, script_id = 117020};
get_buff(51214) ->
    #c_buff_base{id = 51214, eff_type = buff, type = 80040,
                 max_layer = 1, script_id = 117020};
get_buff(51215) ->
    #c_buff_base{id = 51215, eff_type = buff, type = 80040,
                 max_layer = 1, script_id = 117020};
get_buff(51216) ->
    #c_buff_base{id = 51216, eff_type = buff, type = 80040,
                 max_layer = 1, script_id = 117020};
get_buff(51217) ->
    #c_buff_base{id = 51217, eff_type = buff, type = 88009,
                 max_layer = 1, script_id = 100000};
get_buff(51218) ->
    #c_buff_base{id = 51218, eff_type = buff, type = 88009,
                 max_layer = 1, script_id = 100000};
get_buff(51219) ->
    #c_buff_base{id = 51219, eff_type = buff, type = 88009,
                 max_layer = 1, script_id = 100000};
get_buff(69001) ->
    #c_buff_base{id = 69001, eff_type = debuff,
                 type = 69001, max_layer = 1, script_id = 202010};
get_buff(69003) ->
    #c_buff_base{id = 69003, eff_type = debuff,
                 type = 69003, max_layer = 1, script_id = 245000};
get_buff(69007) ->
    #c_buff_base{id = 69007, eff_type = debuff,
                 type = 69007, max_layer = 1, script_id = 202010};
get_buff(69504) ->
    #c_buff_base{id = 69504, eff_type = buff, type = 69504,
                 max_layer = 1, script_id = 120010};
get_buff(69505) ->
    #c_buff_base{id = 69505, eff_type = buff, type = 69505,
                 max_layer = 1, script_id = 157000};
get_buff(69506) ->
    #c_buff_base{id = 69506, eff_type = buff, type = 69506,
                 max_layer = 1, script_id = 100000};
get_buff(69507) ->
    #c_buff_base{id = 69507, eff_type = buff, type = 69507,
                 max_layer = 1, script_id = 125000};
get_buff(69508) ->
    #c_buff_base{id = 69508, eff_type = buff, type = 69508,
                 max_layer = 1, script_id = 252000};
get_buff(69509) ->
    #c_buff_base{id = 69509, eff_type = buff, type = 69509,
                 max_layer = 3, script_id = 100000};
get_buff(69510) ->
    #c_buff_base{id = 69510, eff_type = buff, type = 69510,
                 max_layer = 3, script_id = 117021};
get_buff(69511) ->
    #c_buff_base{id = 69511, eff_type = buff, type = 69511,
                 max_layer = 3, script_id = 125000};
get_buff(69512) ->
    #c_buff_base{id = 69512, eff_type = buff, type = 69512,
                 max_layer = 1, script_id = 100000};
get_buff(69513) ->
    #c_buff_base{id = 69513, eff_type = buff, type = 69513,
                 max_layer = 1, script_id = 325001};
get_buff(69514) ->
    #c_buff_base{id = 69514, eff_type = buff, type = 69513,
                 max_layer = 1, script_id = 425001};
get_buff(69515) ->
    #c_buff_base{id = 69515, eff_type = buff, type = 69515,
                 max_layer = 1, script_id = 325002};
get_buff(60000) ->
    #c_buff_base{id = 60000, eff_type = debuff,
                 type = 30110, max_layer = 1, script_id = 216020};
get_buff(60001) ->
    #c_buff_base{id = 60001, eff_type = debuff,
                 type = 30120, max_layer = 3, script_id = 225000};
get_buff(70000) ->
    #c_buff_base{id = 70000, eff_type = debuff,
                 type = 20043, max_layer = 1, script_id = 230020};
get_buff(70001) ->
    #c_buff_base{id = 70001, eff_type = debuff,
                 type = 20030, max_layer = 1, script_id = 211021};
get_buff(70002) ->
    #c_buff_base{id = 70002, eff_type = debuff,
                 type = 20042, max_layer = 1, script_id = 227000};
get_buff(70003) ->
    #c_buff_base{id = 70003, eff_type = buff, type = 10050,
                 max_layer = 1, script_id = 104020};
get_buff(70004) ->
    #c_buff_base{id = 70004, eff_type = buff, type = 10230,
                 max_layer = 1, script_id = 114010};
get_buff(70005) ->
    #c_buff_base{id = 70005, eff_type = buff, type = 10190,
                 max_layer = 1, script_id = 111020};
get_buff(70006) ->
    #c_buff_base{id = 70006, eff_type = buff, type = 10330,
                 max_layer = 1, script_id = 129001};
get_buff(70007) ->
    #c_buff_base{id = 70007, eff_type = debuff,
                 type = 20045, max_layer = 1, script_id = 234000};
get_buff(70008) ->
    #c_buff_base{id = 70008, eff_type = debuff,
                 type = 20048, max_layer = 1, script_id = 237000};
get_buff(70009) ->
    #c_buff_base{id = 70009, eff_type = buff, type = 10090,
                 max_layer = 1, script_id = 106020};
get_buff(70010) ->
    #c_buff_base{id = 70010, eff_type = debuff,
                 type = 20041, max_layer = 1, script_id = 225000};
get_buff(70011) ->
    #c_buff_base{id = 70011, eff_type = debuff,
                 type = 20013, max_layer = 1, script_id = 203020};
get_buff(70012) ->
    #c_buff_base{id = 70012, eff_type = buff, type = 10030,
                 max_layer = 1, script_id = 103020};
get_buff(70013) ->
    #c_buff_base{id = 70013, eff_type = buff, type = 10070,
                 max_layer = 1, script_id = 105020};
get_buff(70014) ->
    #c_buff_base{id = 70014, eff_type = buff, type = 10050,
                 max_layer = 1, script_id = 104020};
get_buff(70015) ->
    #c_buff_base{id = 70015, eff_type = buff, type = 10090,
                 max_layer = 1, script_id = 106020};
get_buff(70016) ->
    #c_buff_base{id = 70016, eff_type = buff, type = 10030,
                 max_layer = 1, script_id = 103020};
get_buff(70017) ->
    #c_buff_base{id = 70017, eff_type = buff, type = 10070,
                 max_layer = 1, script_id = 105020};
get_buff(70018) ->
    #c_buff_base{id = 70018, eff_type = debuff,
                 type = 20047, max_layer = 1, script_id = 236000};
get_buff(70019) ->
    #c_buff_base{id = 70019, eff_type = debuff,
                 type = 20046, max_layer = 1, script_id = 235002};
get_buff(70020) ->
    #c_buff_base{id = 70020, eff_type = buff, type = 10050,
                 max_layer = 1, script_id = 104020};
get_buff(70021) ->
    #c_buff_base{id = 70021, eff_type = debuff,
                 type = 20011, max_layer = 1, script_id = 202021};
get_buff(70022) ->
    #c_buff_base{id = 70022, eff_type = debuff,
                 type = 20024, max_layer = 1, script_id = 209011};
get_buff(70023) ->
    #c_buff_base{id = 70023, eff_type = debuff,
                 type = 20041, max_layer = 1, script_id = 225000};
get_buff(70024) ->
    #c_buff_base{id = 70024, eff_type = debuff,
                 type = 20024, max_layer = 1, script_id = 209011};
get_buff(70025) ->
    #c_buff_base{id = 70025, eff_type = buff, type = 10240,
                 max_layer = 1, script_id = 115011};
get_buff(70026) ->
    #c_buff_base{id = 70026, eff_type = buff, type = 70026,
                 max_layer = 1, script_id = 117020};
get_buff(70027) ->
    #c_buff_base{id = 70027, eff_type = buff, type = 10190,
                 max_layer = 1, script_id = 111020};
get_buff(70028) ->
    #c_buff_base{id = 70028, eff_type = buff, type = 70028,
                 max_layer = 2, script_id = 120011};
get_buff(70029) ->
    #c_buff_base{id = 70029, eff_type = debuff,
                 type = 20030, max_layer = 1, script_id = 211021};
get_buff(70030) ->
    #c_buff_base{id = 70030, eff_type = buff, type = 70030,
                 max_layer = 1, script_id = 117022};
get_buff(70031) ->
    #c_buff_base{id = 70031, eff_type = buff, type = 70031,
                 max_layer = 1, script_id = 117023};
get_buff(70032) ->
    #c_buff_base{id = 70032, eff_type = buff, type = 70032,
                 max_layer = 2, script_id = 124000};
get_buff(70033) ->
    #c_buff_base{id = 70033, eff_type = debuff,
                 type = 70033, max_layer = 1, script_id = 225000};
get_buff(70034) ->
    #c_buff_base{id = 70034, eff_type = debuff,
                 type = 70034, max_layer = 1, script_id = 223002};
get_buff(70035) ->
    #c_buff_base{id = 70035, eff_type = debuff,
                 type = 70034, max_layer = 1, script_id = 100000};
get_buff(70036) ->
    #c_buff_base{id = 70036, eff_type = debuff,
                 type = 20011, max_layer = 1, script_id = 202021};
get_buff(70037) ->
    #c_buff_base{id = 70037, eff_type = debuff,
                 type = 70036, max_layer = 1, script_id = 246000};
get_buff(70038) ->
    #c_buff_base{id = 70038, eff_type = debuff,
                 type = 70028, max_layer = 1, script_id = 120011};
get_buff(70039) ->
    #c_buff_base{id = 70039, eff_type = buff, type = 70028,
                 max_layer = 1, script_id = 144000};
get_buff(70040) ->
    #c_buff_base{id = 70040, eff_type = buff, type = 30010,
                 max_layer = 1, script_id = 144000};
get_buff(70041) ->
    #c_buff_base{id = 70041, eff_type = buff, type = 70041,
                 max_layer = 3, script_id = 100000};
get_buff(70042) ->
    #c_buff_base{id = 70042, eff_type = buff, type = 70042,
                 max_layer = 3, script_id = 100000};
get_buff(70043) ->
    #c_buff_base{id = 70043, eff_type = buff, type = 10290,
                 max_layer = 1, script_id = 100000};
get_buff(70044) ->
    #c_buff_base{id = 70044, eff_type = buff, type = 10190,
                 max_layer = 1, script_id = 111020};
get_buff(70045) ->
    #c_buff_base{id = 70045, eff_type = buff, type = 70045,
                 max_layer = 2, script_id = 256000};
get_buff(70046) ->
    #c_buff_base{id = 70046, eff_type = buff, type = 10270,
                 max_layer = 1, script_id = 120000};
get_buff(70047) ->
    #c_buff_base{id = 70047, eff_type = buff, type = 70047,
                 max_layer = 3, script_id = 117020};
get_buff(70048) ->
    #c_buff_base{id = 70048, eff_type = buff, type = 70048,
                 max_layer = 3, script_id = 117020};
get_buff(70049) ->
    #c_buff_base{id = 70049, eff_type = buff, type = 70049,
                 max_layer = 3, script_id = 117020};
get_buff(70050) ->
    #c_buff_base{id = 70050, eff_type = buff, type = 70050,
                 max_layer = 3, script_id = 117020};
get_buff(70051) ->
    #c_buff_base{id = 70051, eff_type = buff, type = 70051,
                 max_layer = 1, script_id = 125001};
get_buff(70052) ->
    #c_buff_base{id = 70052, eff_type = buff, type = 70052,
                 max_layer = 1, script_id = 139020};
get_buff(70053) ->
    #c_buff_base{id = 70053, eff_type = debuff,
                 type = 20042, max_layer = 1, script_id = 227000};
get_buff(70054) ->
    #c_buff_base{id = 70054, eff_type = debuff,
                 type = 70054, max_layer = 1, script_id = 223002};
get_buff(70055) ->
    #c_buff_base{id = 70055, eff_type = buff, type = 70055,
                 max_layer = 1, script_id = 120010};
get_buff(70056) ->
    #c_buff_base{id = 70056, eff_type = debuff,
                 type = 70056, max_layer = 1, script_id = 159000};
get_buff(70057) ->
    #c_buff_base{id = 70057, eff_type = debuff,
                 type = 70057, max_layer = 1, script_id = 260000};
get_buff(70058) ->
    #c_buff_base{id = 70058, eff_type = debuff,
                 type = 20046, max_layer = 1, script_id = 100000};
get_buff(70059) ->
    #c_buff_base{id = 70059, eff_type = debuff,
                 type = 20046, max_layer = 1, script_id = 239001};
get_buff(70060) ->
    #c_buff_base{id = 70060, eff_type = debuff,
                 type = 70060, max_layer = 1, script_id = 211022};
get_buff(70061) ->
    #c_buff_base{id = 70061, eff_type = buff, type = 10330,
                 max_layer = 1, script_id = 129002};
get_buff(70062) ->
    #c_buff_base{id = 70062, eff_type = buff, type = 10170,
                 max_layer = 1, script_id = 110010};
get_buff(70063) ->
    #c_buff_base{id = 70063, eff_type = buff, type = 70063,
                 max_layer = 1, script_id = 139021};
get_buff(70064) ->
    #c_buff_base{id = 70064, eff_type = debuff,
                 type = 20043, max_layer = 1, script_id = 230020};
get_buff(70065) ->
    #c_buff_base{id = 70065, eff_type = buff, type = 70065,
                 max_layer = 1, script_id = 157001};
get_buff(70066) ->
    #c_buff_base{id = 70066, eff_type = buff, type = 70055,
                 max_layer = 1, script_id = 120010};
get_buff(70067) ->
    #c_buff_base{id = 70067, eff_type = buff, type = 70055,
                 max_layer = 1, script_id = 120010};
get_buff(70068) ->
    #c_buff_base{id = 70068, eff_type = buff, type = 70055,
                 max_layer = 1, script_id = 120010};
get_buff(70069) ->
    #c_buff_base{id = 70069, eff_type = buff, type = 70055,
                 max_layer = 1, script_id = 120010};
get_buff(70070) ->
    #c_buff_base{id = 70070, eff_type = buff, type = 70055,
                 max_layer = 1, script_id = 120010};
get_buff(70071) ->
    #c_buff_base{id = 70071, eff_type = buff, type = 70055,
                 max_layer = 1, script_id = 120010};
get_buff(70072) ->
    #c_buff_base{id = 70072, eff_type = buff, type = 70072,
                 max_layer = 1, script_id = 163000};
get_buff(70073) ->
    #c_buff_base{id = 70073, eff_type = buff, type = 70073,
                 max_layer = 3, script_id = 117021};
get_buff(70074) ->
    #c_buff_base{id = 70074, eff_type = debuff,
                 type = 20017, max_layer = 1, script_id = 117024};
get_buff(70075) ->
    #c_buff_base{id = 70075, eff_type = buff, type = 70075,
                 max_layer = 1, script_id = 117022};
get_buff(70076) ->
    #c_buff_base{id = 70076, eff_type = buff, type = 10170,
                 max_layer = 1, script_id = 110012};
get_buff(70077) ->
    #c_buff_base{id = 70077, eff_type = debuff,
                 type = 70077, max_layer = 1, script_id = 203020};
get_buff(70078) ->
    #c_buff_base{id = 70078, eff_type = debuff,
                 type = 70078, max_layer = 1, script_id = 204020};
get_buff(70079) ->
    #c_buff_base{id = 70079, eff_type = buff, type = 70079,
                 max_layer = 1, script_id = 117022};
get_buff(70080) ->
    #c_buff_base{id = 70080, eff_type = buff, type = 70080,
                 max_layer = 1, script_id = 107010};
get_buff(70081) ->
    #c_buff_base{id = 70081, eff_type = buff, type = 70081,
                 max_layer = 1, script_id = 157002};
get_buff(70082) ->
    #c_buff_base{id = 70082, eff_type = debuff,
                 type = 20046, max_layer = 1, script_id = 235001};
get_buff(70083) ->
    #c_buff_base{id = 70083, eff_type = buff, type = 70083,
                 max_layer = 1, script_id = 120012};
get_buff(70084) ->
    #c_buff_base{id = 70084, eff_type = buff, type = 70084,
                 max_layer = 1, script_id = 125001};
get_buff(70085) ->
    #c_buff_base{id = 70085, eff_type = buff, type = 30010,
                 max_layer = 1, script_id = 144000};
get_buff(70086) ->
    #c_buff_base{id = 70086, eff_type = buff, type = 100802,
                 max_layer = 1, script_id = 125000};
get_buff(70087) ->
    #c_buff_base{id = 70087, eff_type = buff, type = 70087,
                 max_layer = 1, script_id = 100000};
get_buff(80000) ->
    #c_buff_base{id = 80000, eff_type = debuff,
                 type = 20030, max_layer = 1, script_id = 211021};
get_buff(80001) ->
    #c_buff_base{id = 80001, eff_type = debuff,
                 type = 20039, max_layer = 1, script_id = 222001};
get_buff(80002) ->
    #c_buff_base{id = 80002, eff_type = buff, type = 10070,
                 max_layer = 1, script_id = 105021};
get_buff(80003) ->
    #c_buff_base{id = 80003, eff_type = debuff,
                 type = 20017, max_layer = 1, script_id = 205020};
get_buff(80004) ->
    #c_buff_base{id = 80004, eff_type = buff, type = 10280,
                 max_layer = 1, script_id = 120010};
get_buff(80005) ->
    #c_buff_base{id = 80005, eff_type = buff, type = 10010,
                 max_layer = 1, script_id = 102020};
get_buff(80006) ->
    #c_buff_base{id = 80006, eff_type = buff, type = 10090,
                 max_layer = 1, script_id = 106021};
get_buff(80007) ->
    #c_buff_base{id = 80007, eff_type = debuff,
                 type = 20017, max_layer = 1, script_id = 205020};
get_buff(80008) ->
    #c_buff_base{id = 80008, eff_type = buff, type = 10300,
                 max_layer = 1, script_id = 125000};
get_buff(80009) ->
    #c_buff_base{id = 80009, eff_type = debuff,
                 type = 20013, max_layer = 1, script_id = 203020};
get_buff(80010) ->
    #c_buff_base{id = 80010, eff_type = debuff,
                 type = 20042, max_layer = 1, script_id = 227000};
get_buff(80011) ->
    #c_buff_base{id = 80011, eff_type = buff, type = 10070,
                 max_layer = 1, script_id = 105020};
get_buff(80012) ->
    #c_buff_base{id = 80012, eff_type = debuff,
                 type = 20030, max_layer = 1, script_id = 211021};
get_buff(80013) ->
    #c_buff_base{id = 80013, eff_type = buff, type = 10010,
                 max_layer = 1, script_id = 102020};
get_buff(80014) ->
    #c_buff_base{id = 80014, eff_type = debuff,
                 type = 20037, max_layer = 1, script_id = 221002};
get_buff(80015) ->
    #c_buff_base{id = 80015, eff_type = buff, type = 10070,
                 max_layer = 1, script_id = 105020};
get_buff(80016) ->
    #c_buff_base{id = 80016, eff_type = debuff,
                 type = 20032, max_layer = 1, script_id = 212020};
get_buff(80017) ->
    #c_buff_base{id = 80017, eff_type = buff, type = 10070,
                 max_layer = 1, script_id = 105020};
get_buff(80018) ->
    #c_buff_base{id = 80018, eff_type = debuff,
                 type = 20043, max_layer = 1, script_id = 230020};
get_buff(80019) ->
    #c_buff_base{id = 80019, eff_type = debuff,
                 type = 20039, max_layer = 1, script_id = 222001};
get_buff(80020) ->
    #c_buff_base{id = 80020, eff_type = debuff,
                 type = 20010, max_layer = 3, script_id = 200002};
get_buff(80021) ->
    #c_buff_base{id = 80021, eff_type = buff, type = 10010,
                 max_layer = 1, script_id = 102020};
get_buff(80022) ->
    #c_buff_base{id = 80022, eff_type = debuff,
                 type = 20027, max_layer = 1, script_id = 210010};
get_buff(80023) ->
    #c_buff_base{id = 80023, eff_type = debuff,
                 type = 20023, max_layer = 1, script_id = 208010};
get_buff(80024) ->
    #c_buff_base{id = 80024, eff_type = debuff,
                 type = 20040, max_layer = 1, script_id = 223001};
get_buff(80025) ->
    #c_buff_base{id = 80025, eff_type = buff, type = 10170,
                 max_layer = 1, script_id = 110010};
get_buff(80026) ->
    #c_buff_base{id = 80026, eff_type = debuff,
                 type = 20039, max_layer = 1, script_id = 222001};
get_buff(80027) ->
    #c_buff_base{id = 80027, eff_type = debuff,
                 type = 20041, max_layer = 1, script_id = 225000};
get_buff(80028) ->
    #c_buff_base{id = 80028, eff_type = debuff,
                 type = 20030, max_layer = 1, script_id = 211021};
get_buff(80029) ->
    #c_buff_base{id = 80029, eff_type = debuff,
                 type = 20032, max_layer = 1, script_id = 212020};
get_buff(80030) ->
    #c_buff_base{id = 80030, eff_type = buff, type = 10070,
                 max_layer = 3, script_id = 105020};
get_buff(80031) ->
    #c_buff_base{id = 80031, eff_type = buff, type = 10190,
                 max_layer = 1, script_id = 111020};
get_buff(80032) ->
    #c_buff_base{id = 80032, eff_type = buff, type = 10170,
                 max_layer = 1, script_id = 110010};
get_buff(80033) ->
    #c_buff_base{id = 80033, eff_type = debuff,
                 type = 20049, max_layer = 1, script_id = 238000};
get_buff(80034) ->
    #c_buff_base{id = 80034, eff_type = buff, type = 10390,
                 max_layer = 1, script_id = 139020};
get_buff(80035) ->
    #c_buff_base{id = 80035, eff_type = buff, type = 10010,
                 max_layer = 1, script_id = 102020};
get_buff(80036) ->
    #c_buff_base{id = 80036, eff_type = buff, type = 10230,
                 max_layer = 1, script_id = 114010};
get_buff(80037) ->
    #c_buff_base{id = 80037, eff_type = buff, type = 10270,
                 max_layer = 1, script_id = 120000};
get_buff(80038) ->
    #c_buff_base{id = 80038, eff_type = buff, type = 80038,
                 max_layer = 1, script_id = 115010};
get_buff(80039) ->
    #c_buff_base{id = 80039, eff_type = buff, type = 10270,
                 max_layer = 1, script_id = 120000};
get_buff(80040) ->
    #c_buff_base{id = 80040, eff_type = buff, type = 80040,
                 max_layer = 1, script_id = 117020};
get_buff(80041) ->
    #c_buff_base{id = 80041, eff_type = buff, type = 10170,
                 max_layer = 1, script_id = 110010};
get_buff(80042) ->
    #c_buff_base{id = 80042, eff_type = buff, type = 10190,
                 max_layer = 1, script_id = 111020};
get_buff(80043) ->
    #c_buff_base{id = 80043, eff_type = buff, type = 10340,
                 max_layer = 1, script_id = 130020};
get_buff(80044) ->
    #c_buff_base{id = 80044, eff_type = buff, type = 10341,
                 max_layer = 1, script_id = 100000};
get_buff(80045) ->
    #c_buff_base{id = 80045, eff_type = buff, type = 10211,
                 max_layer = 1, script_id = 117020};
get_buff(80046) ->
    #c_buff_base{id = 80046, eff_type = buff, type = 10212,
                 max_layer = 1, script_id = 125001};
get_buff(80047) ->
    #c_buff_base{id = 80047, eff_type = buff, type = 80047,
                 max_layer = 10, script_id = 112020};
get_buff(80048) ->
    #c_buff_base{id = 80048, eff_type = debuff,
                 type = 80048, max_layer = 1, script_id = 221000};
get_buff(80049) ->
    #c_buff_base{id = 80049, eff_type = debuff,
                 type = 80049, max_layer = 1, script_id = 247000};
get_buff(80050) ->
    #c_buff_base{id = 80050, eff_type = buff, type = 80050,
                 max_layer = 1, script_id = 158000};
get_buff(80051) ->
    #c_buff_base{id = 80051, eff_type = debuff,
                 type = 20039, max_layer = 1, script_id = 222001};
get_buff(80052) ->
    #c_buff_base{id = 80052, eff_type = buff, type = 80052,
                 max_layer = 1, script_id = 102030};
get_buff(80053) ->
    #c_buff_base{id = 80053, eff_type = buff, type = 80053,
                 max_layer = 1, script_id = 130020};
get_buff(85250) ->
    #c_buff_base{id = 85250, eff_type = debuff,
                 type = 88003, max_layer = 1, script_id = 203021};
get_buff(85340) ->
    #c_buff_base{id = 85340, eff_type = buff, type = 80040,
                 max_layer = 3, script_id = 117023};
get_buff(88003) ->
    #c_buff_base{id = 88003, eff_type = debuff,
                 type = 88003, max_layer = 1, script_id = 203021};
get_buff(88004) ->
    #c_buff_base{id = 88004, eff_type = debuff,
                 type = 88004, max_layer = 1, script_id = 204021};
get_buff(88005) ->
    #c_buff_base{id = 88005, eff_type = debuff,
                 type = 88005, max_layer = 1, script_id = 217022};
get_buff(88006) ->
    #c_buff_base{id = 88006, eff_type = debuff,
                 type = 88006, max_layer = 1, script_id = 217023};
get_buff(88009) ->
    #c_buff_base{id = 88009, eff_type = buff, type = 88009,
                 max_layer = 1, script_id = 115011};
get_buff(88019) ->
    #c_buff_base{id = 88019, eff_type = buff, type = 88019,
                 max_layer = 1, script_id = 110010};
get_buff(88020) ->
    #c_buff_base{id = 88020, eff_type = buff, type = 88020,
                 max_layer = 1, script_id = 110010};
get_buff(88021) ->
    #c_buff_base{id = 88021, eff_type = buff, type = 88021,
                 max_layer = 1, script_id = 139020};
get_buff(88022) ->
    #c_buff_base{id = 88022, eff_type = buff, type = 88022,
                 max_layer = 1, script_id = 139020};
get_buff(88028) ->
    #c_buff_base{id = 88028, eff_type = debuff,
                 type = 88028, max_layer = 1, script_id = 211022};
get_buff(88029) ->
    #c_buff_base{id = 88029, eff_type = debuff,
                 type = 88029, max_layer = 1, script_id = 211022};
get_buff(88030) ->
    #c_buff_base{id = 88030, eff_type = buff, type = 88030,
                 max_layer = 1, script_id = 111022};
get_buff(88031) ->
    #c_buff_base{id = 88031, eff_type = buff, type = 88031,
                 max_layer = 1, script_id = 111022};
get_buff(88032) ->
    #c_buff_base{id = 88032, eff_type = buff, type = 500061,
                 max_layer = 1, script_id = 125004};
get_buff(88033) ->
    #c_buff_base{id = 88033, eff_type = buff, type = 500062,
                 max_layer = 1, script_id = 125005};
get_buff(88034) ->
    #c_buff_base{id = 88034, eff_type = buff, type = 500061,
                 max_layer = 1, script_id = 125004};
get_buff(88035) ->
    #c_buff_base{id = 88035, eff_type = buff, type = 500062,
                 max_layer = 1, script_id = 125005};
get_buff(88040) ->
    #c_buff_base{id = 88040, eff_type = buff, type = 500063,
                 max_layer = 1, script_id = 153000};
get_buff(88041) ->
    #c_buff_base{id = 88041, eff_type = debuff,
                 type = 500063, max_layer = 1, script_id = 254000};
get_buff(88042) ->
    #c_buff_base{id = 88042, eff_type = buff, type = 102101,
                 max_layer = 1, script_id = 117020};
get_buff(88043) ->
    #c_buff_base{id = 88043, eff_type = buff, type = 102102,
                 max_layer = 3, script_id = 155000};
get_buff(88044) ->
    #c_buff_base{id = 88044, eff_type = buff, type = 102102,
                 max_layer = 3, script_id = 155000};
get_buff(88045) ->
    #c_buff_base{id = 88045, eff_type = buff, type = 88045,
                 max_layer = 3, script_id = 107010};
get_buff(88046) ->
    #c_buff_base{id = 88046, eff_type = buff, type = 88046,
                 max_layer = 1, script_id = 120001};
get_buff(88047) ->
    #c_buff_base{id = 88047, eff_type = buff, type = 88047,
                 max_layer = 3, script_id = 113000};
get_buff(88048) ->
    #c_buff_base{id = 88048, eff_type = buff, type = 88048,
                 max_layer = 1, script_id = 119000};
get_buff(84010) ->
    #c_buff_base{id = 84010, eff_type = buff, type = 84010,
                 max_layer = 1, script_id = 111020};
get_buff(85680) ->
    #c_buff_base{id = 85680, eff_type = buff, type = 85680,
                 max_layer = 1, script_id = 117020};
get_buff(85730) ->
    #c_buff_base{id = 85730, eff_type = buff, type = 85730,
                 max_layer = 1, script_id = 117020};
get_buff(85750) ->
    #c_buff_base{id = 85750, eff_type = buff, type = 85750,
                 max_layer = 1, script_id = 120000};
get_buff(85751) ->
    #c_buff_base{id = 85751, eff_type = debuff,
                 type = 85751, max_layer = 1, script_id = 200001};
get_buff(85790) ->
    #c_buff_base{id = 85790, eff_type = buff, type = 85730,
                 max_layer = 1, script_id = 117021};
get_buff(90000) ->
    #c_buff_base{id = 90000, eff_type = buff, type = 10370,
                 max_layer = 1, script_id = 132000};
get_buff(90001) ->
    #c_buff_base{id = 90001, eff_type = buff, type = 30020,
                 max_layer = 1, script_id = 100000};
get_buff(90002) ->
    #c_buff_base{id = 90002, eff_type = buff, type = 10010,
                 max_layer = 1, script_id = 102020};
get_buff(90003) ->
    #c_buff_base{id = 90003, eff_type = buff, type = 10300,
                 max_layer = 1, script_id = 125000};
get_buff(90004) ->
    #c_buff_base{id = 90004, eff_type = buff, type = 30030,
                 max_layer = 1, script_id = 100000};
get_buff(90005) ->
    #c_buff_base{id = 90005, eff_type = buff, type = 30040,
                 max_layer = 1, script_id = 100000};
get_buff(90006) ->
    #c_buff_base{id = 90006, eff_type = buff, type = 10220,
                 max_layer = 1, script_id = 113000};
get_buff(90007) ->
    #c_buff_base{id = 90007, eff_type = debuff,
                 type = 20042, max_layer = 1, script_id = 227000};
get_buff(90008) ->
    #c_buff_base{id = 90008, eff_type = buff, type = 10300,
                 max_layer = 1, script_id = 125000};
get_buff(90009) ->
    #c_buff_base{id = 90009, eff_type = buff, type = 10320,
                 max_layer = 1, script_id = 129000};
get_buff(90010) ->
    #c_buff_base{id = 90010, eff_type = buff, type = 30050,
                 max_layer = 1, script_id = 100000};
get_buff(90011) ->
    #c_buff_base{id = 90011, eff_type = buff, type = 10010,
                 max_layer = 1, script_id = 102020};
get_buff(90012) ->
    #c_buff_base{id = 90012, eff_type = buff, type = 10370,
                 max_layer = 1, script_id = 132000};
get_buff(90013) ->
    #c_buff_base{id = 90013, eff_type = buff, type = 10210,
                 max_layer = 1, script_id = 112020};
get_buff(90014) ->
    #c_buff_base{id = 90014, eff_type = buff, type = 10110,
                 max_layer = 1, script_id = 107010};
get_buff(90015) ->
    #c_buff_base{id = 90015, eff_type = buff, type = 30060,
                 max_layer = 1, script_id = 100000};
get_buff(90016) ->
    #c_buff_base{id = 90016, eff_type = debuff,
                 type = 20010, max_layer = 3, script_id = 200001};
get_buff(90017) ->
    #c_buff_base{id = 90017, eff_type = buff, type = 10300,
                 max_layer = 3, script_id = 125000};
get_buff(90018) ->
    #c_buff_base{id = 90018, eff_type = debuff,
                 type = 10370, max_layer = 3, script_id = 132000};
get_buff(90019) ->
    #c_buff_base{id = 90019, eff_type = buff, type = 30070,
                 max_layer = 1, script_id = 100000};
get_buff(90020) ->
    #c_buff_base{id = 90020, eff_type = buff, type = 10210,
                 max_layer = 1, script_id = 112020};
get_buff(90021) ->
    #c_buff_base{id = 90021, eff_type = buff, type = 20043,
                 max_layer = 3, script_id = 230020};
get_buff(90022) ->
    #c_buff_base{id = 90022, eff_type = buff, type = 10070,
                 max_layer = 1, script_id = 105020};
get_buff(90023) ->
    #c_buff_base{id = 90023, eff_type = buff, type = 10280,
                 max_layer = 1, script_id = 120010};
get_buff(90024) ->
    #c_buff_base{id = 90024, eff_type = buff, type = 30080,
                 max_layer = 1, script_id = 100000};
get_buff(90025) ->
    #c_buff_base{id = 90025, eff_type = debuff,
                 type = 30090, max_layer = 1, script_id = 100000};
get_buff(90026) ->
    #c_buff_base{id = 90026, eff_type = buff, type = 30100,
                 max_layer = 1, script_id = 100000};
get_buff(90027) ->
    #c_buff_base{id = 90027, eff_type = buff, type = 10220,
                 max_layer = 1, script_id = 113000};
get_buff(90028) ->
    #c_buff_base{id = 90028, eff_type = buff, type = 10220,
                 max_layer = 1, script_id = 113000};
get_buff(90029) ->
    #c_buff_base{id = 90029, eff_type = debuff,
                 type = 20010, max_layer = 1, script_id = 200001};
get_buff(90030) ->
    #c_buff_base{id = 90030, eff_type = buff, type = 10370,
                 max_layer = 1, script_id = 132000};
get_buff(90031) ->
    #c_buff_base{id = 90031, eff_type = buff, type = 10010,
                 max_layer = 1, script_id = 102020};
get_buff(90032) ->
    #c_buff_base{id = 90032, eff_type = buff, type = 10370,
                 max_layer = 1, script_id = 132000};
get_buff(90033) ->
    #c_buff_base{id = 90033, eff_type = buff, type = 20011,
                 max_layer = 1, script_id = 202020};
get_buff(90034) ->
    #c_buff_base{id = 90034, eff_type = buff, type = 10280,
                 max_layer = 1, script_id = 120010};
get_buff(90035) ->
    #c_buff_base{id = 90035, eff_type = buff, type = 10370,
                 max_layer = 1, script_id = 132000};
get_buff(90036) ->
    #c_buff_base{id = 90036, eff_type = debuff,
                 type = 20010, max_layer = 1, script_id = 200001};
get_buff(90037) ->
    #c_buff_base{id = 90037, eff_type = debuff,
                 type = 10300, max_layer = 1, script_id = 125000};
get_buff(90038) ->
    #c_buff_base{id = 90038, eff_type = buff, type = 10370,
                 max_layer = 1, script_id = 132000};
get_buff(90039) ->
    #c_buff_base{id = 90039, eff_type = buff, type = 10210,
                 max_layer = 1, script_id = 112020};
get_buff(90040) ->
    #c_buff_base{id = 90040, eff_type = debuff,
                 type = 20010, max_layer = 1, script_id = 200001};
get_buff(90041) ->
    #c_buff_base{id = 90041, eff_type = debuff,
                 type = 20046, max_layer = 1, script_id = 235000};
get_buff(90042) ->
    #c_buff_base{id = 90042, eff_type = debuff,
                 type = 20011, max_layer = 1, script_id = 202020};
get_buff(90043) ->
    #c_buff_base{id = 90043, eff_type = buff, type = 10410,
                 max_layer = 1, script_id = 107010};
get_buff(90044) ->
    #c_buff_base{id = 90044, eff_type = buff, type = 10370,
                 max_layer = 1, script_id = 132000};
get_buff(90045) ->
    #c_buff_base{id = 90045, eff_type = buff, type = 10370,
                 max_layer = 1, script_id = 132000};
get_buff(90046) ->
    #c_buff_base{id = 90046, eff_type = debuff,
                 type = 20011, max_layer = 10, script_id = 202020};
get_buff(90047) ->
    #c_buff_base{id = 90047, eff_type = buff, type = 10340,
                 max_layer = 1, script_id = 130020};
get_buff(90048) ->
    #c_buff_base{id = 90048, eff_type = buff, type = 10260,
                 max_layer = 1, script_id = 125000};
get_buff(90049) ->
    #c_buff_base{id = 90049, eff_type = buff, type = 10210,
                 max_layer = 1, script_id = 117020};
get_buff(90050) ->
    #c_buff_base{id = 90050, eff_type = debuff,
                 type = 20039, max_layer = 1, script_id = 222001};
get_buff(90051) ->
    #c_buff_base{id = 90051, eff_type = buff, type = 10310,
                 max_layer = 1, script_id = 126000};
get_buff(90052) ->
    #c_buff_base{id = 90052, eff_type = buff, type = 10280,
                 max_layer = 1, script_id = 120010};
get_buff(90053) ->
    #c_buff_base{id = 90053, eff_type = debuff,
                 type = 20046, max_layer = 1, script_id = 235000};
get_buff(90054) ->
    #c_buff_base{id = 90054, eff_type = buff, type = 10270,
                 max_layer = 1, script_id = 120000};
get_buff(90055) ->
    #c_buff_base{id = 90055, eff_type = debuff,
                 type = 20041, max_layer = 1, script_id = 225000};
get_buff(90056) ->
    #c_buff_base{id = 90056, eff_type = buff, type = 10260,
                 max_layer = 1, script_id = 125000};
get_buff(90057) ->
    #c_buff_base{id = 90057, eff_type = buff, type = 10220,
                 max_layer = 1, script_id = 113000};
get_buff(90058) ->
    #c_buff_base{id = 90058, eff_type = debuff,
                 type = 20044, max_layer = 1, script_id = 230021};
get_buff(90059) ->
    #c_buff_base{id = 90059, eff_type = buff, type = 10370,
                 max_layer = 1, script_id = 132000};
get_buff(90060) ->
    #c_buff_base{id = 90060, eff_type = debuff,
                 type = 20011, max_layer = 1, script_id = 202020};
get_buff(90061) ->
    #c_buff_base{id = 90061, eff_type = debuff,
                 type = 30090, max_layer = 1, script_id = 100000};
get_buff(90062) ->
    #c_buff_base{id = 90062, eff_type = buff, type = 10410,
                 max_layer = 1, script_id = 107010};
get_buff(90063) ->
    #c_buff_base{id = 90063, eff_type = buff, type = 10410,
                 max_layer = 1, script_id = 126000};
get_buff(90064) ->
    #c_buff_base{id = 90064, eff_type = debuff,
                 type = 20010, max_layer = 3, script_id = 200001};
get_buff(90065) ->
    #c_buff_base{id = 90065, eff_type = debuff,
                 type = 20041, max_layer = 1, script_id = 225000};
get_buff(90066) ->
    #c_buff_base{id = 90066, eff_type = buff, type = 10290,
                 max_layer = 3, script_id = 100000};
get_buff(90067) ->
    #c_buff_base{id = 90067, eff_type = buff, type = 10291,
                 max_layer = 1, script_id = 104020};
get_buff(90068) ->
    #c_buff_base{id = 90068, eff_type = buff, type = 10292,
                 max_layer = 1, script_id = 104020};
get_buff(90069) ->
    #c_buff_base{id = 90069, eff_type = buff, type = 10293,
                 max_layer = 1, script_id = 104020};
get_buff(90070) ->
    #c_buff_base{id = 90070, eff_type = buff, type = 10010,
                 max_layer = 1, script_id = 102020};
get_buff(90071) ->
    #c_buff_base{id = 90071, eff_type = buff, type = 10370,
                 max_layer = 1, script_id = 132000};
get_buff(90072) ->
    #c_buff_base{id = 90072, eff_type = buff, type = 10290,
                 max_layer = 1, script_id = 100000};
get_buff(90073) ->
    #c_buff_base{id = 90073, eff_type = buff, type = 10270,
                 max_layer = 1, script_id = 120000};
get_buff(90074) ->
    #c_buff_base{id = 90074, eff_type = buff, type = 10220,
                 max_layer = 1, script_id = 113000};
get_buff(90075) ->
    #c_buff_base{id = 90075, eff_type = buff, type = 10280,
                 max_layer = 1, script_id = 120010};
get_buff(90076) ->
    #c_buff_base{id = 90076, eff_type = buff, type = 10070,
                 max_layer = 1, script_id = 116020};
get_buff(90077) ->
    #c_buff_base{id = 90077, eff_type = buff, type = 10080,
                 max_layer = 1, script_id = 106010};
get_buff(90078) ->
    #c_buff_base{id = 90078, eff_type = buff, type = 10370,
                 max_layer = 1, script_id = 132000};
get_buff(90079) ->
    #c_buff_base{id = 90079, eff_type = buff, type = 0,
                 max_layer = 1, script_id = 100000};
get_buff(90080) ->
    #c_buff_base{id = 90080, eff_type = buff, type = 10060,
                 max_layer = 1, script_id = 105010};
get_buff(90081) ->
    #c_buff_base{id = 90081, eff_type = debuff,
                 type = 20011, max_layer = 3, script_id = 202020};
get_buff(90082) ->
    #c_buff_base{id = 90082, eff_type = debuff,
                 type = 20032, max_layer = 1, script_id = 212020};
get_buff(90083) ->
    #c_buff_base{id = 90083, eff_type = debuff,
                 type = 20011, max_layer = 1, script_id = 202020};
get_buff(90084) ->
    #c_buff_base{id = 90084, eff_type = buff, type = 10330,
                 max_layer = 1, script_id = 129000};
get_buff(90085) ->
    #c_buff_base{id = 90085, eff_type = buff, type = 10210,
                 max_layer = 1, script_id = 117020};
get_buff(90086) ->
    #c_buff_base{id = 90086, eff_type = buff, type = 0,
                 max_layer = 1, script_id = 225000};
get_buff(90087) ->
    #c_buff_base{id = 90087, eff_type = buff, type = 0,
                 max_layer = 1, script_id = 100000};
get_buff(90088) ->
    #c_buff_base{id = 90088, eff_type = debuff,
                 type = 20041, max_layer = 1, script_id = 225000};
get_buff(90089) ->
    #c_buff_base{id = 90089, eff_type = buff, type = 0,
                 max_layer = 1, script_id = 100000};
get_buff(90090) ->
    #c_buff_base{id = 90090, eff_type = buff, type = 10370,
                 max_layer = 1, script_id = 132000};
get_buff(90091) ->
    #c_buff_base{id = 90091, eff_type = buff, type = 10210,
                 max_layer = 1, script_id = 112020};
get_buff(90092) ->
    #c_buff_base{id = 90092, eff_type = buff, type = 10210,
                 max_layer = 1, script_id = 117020};
get_buff(90093) ->
    #c_buff_base{id = 90093, eff_type = buff, type = 20041,
                 max_layer = 1, script_id = 225000};
get_buff(90094) ->
    #c_buff_base{id = 90094, eff_type = buff, type = 10210,
                 max_layer = 1, script_id = 112020};
get_buff(90095) ->
    #c_buff_base{id = 90095, eff_type = buff, type = 10010,
                 max_layer = 1, script_id = 102020};
get_buff(90096) ->
    #c_buff_base{id = 90096, eff_type = buff, type = 0,
                 max_layer = 1, script_id = 100000};
get_buff(90097) ->
    #c_buff_base{id = 90097, eff_type = buff, type = 0,
                 max_layer = 1, script_id = 132000};
get_buff(90098) ->
    #c_buff_base{id = 90098, eff_type = buff, type = 10070,
                 max_layer = 1, script_id = 105020};
get_buff(90099) ->
    #c_buff_base{id = 90099, eff_type = buff, type = 10210,
                 max_layer = 1, script_id = 117020};
get_buff(90100) ->
    #c_buff_base{id = 90100, eff_type = buff, type = 10210,
                 max_layer = 1, script_id = 117020};
get_buff(90101) ->
    #c_buff_base{id = 90101, eff_type = buff, type = 10210,
                 max_layer = 1, script_id = 117020};
get_buff(90102) ->
    #c_buff_base{id = 90102, eff_type = buff, type = 10210,
                 max_layer = 1, script_id = 117020};
get_buff(90103) ->
    #c_buff_base{id = 90103, eff_type = buff, type = 0,
                 max_layer = 1, script_id = 132000};
get_buff(90104) ->
    #c_buff_base{id = 90104, eff_type = buff, type = 0,
                 max_layer = 1, script_id = 132000};
get_buff(90105) ->
    #c_buff_base{id = 90105, eff_type = buff, type = 0,
                 max_layer = 1, script_id = 132000};
get_buff(90106) ->
    #c_buff_base{id = 90106, eff_type = buff, type = 10330,
                 max_layer = 1, script_id = 129000};
get_buff(90107) ->
    #c_buff_base{id = 90107, eff_type = buff, type = 10300,
                 max_layer = 1, script_id = 125000};
get_buff(90108) ->
    #c_buff_base{id = 90108, eff_type = buff, type = 10070,
                 max_layer = 1, script_id = 125000};
get_buff(90109) ->
    #c_buff_base{id = 90109, eff_type = buff, type = 0,
                 max_layer = 1, script_id = 225000};
get_buff(90110) ->
    #c_buff_base{id = 90110, eff_type = buff, type = 0,
                 max_layer = 1, script_id = 100000};
get_buff(90111) ->
    #c_buff_base{id = 90111, eff_type = debuff,
                 type = 20010, max_layer = 1, script_id = 200001};
get_buff(90112) ->
    #c_buff_base{id = 90112, eff_type = buff, type = 10270,
                 max_layer = 1, script_id = 120000};
get_buff(90113) ->
    #c_buff_base{id = 90113, eff_type = debuff, type = 0,
                 max_layer = 1, script_id = 132000};
get_buff(90114) ->
    #c_buff_base{id = 90114, eff_type = debuff,
                 type = 10210, max_layer = 1, script_id = 117020};
get_buff(90115) ->
    #c_buff_base{id = 90115, eff_type = debuff,
                 type = 10210, max_layer = 1, script_id = 117020};
get_buff(90116) ->
    #c_buff_base{id = 90116, eff_type = debuff,
                 type = 10210, max_layer = 1, script_id = 117020};
get_buff(90117) ->
    #c_buff_base{id = 90117, eff_type = buff, type = 10210,
                 max_layer = 3, script_id = 112020};
get_buff(90118) ->
    #c_buff_base{id = 90118, eff_type = debuff,
                 type = 20011, max_layer = 3, script_id = 202020};
get_buff(90119) ->
    #c_buff_base{id = 90119, eff_type = debuff, type = 0,
                 max_layer = 1, script_id = 132000};
get_buff(90120) ->
    #c_buff_base{id = 90120, eff_type = debuff,
                 type = 20032, max_layer = 1, script_id = 217020};
get_buff(90121) ->
    #c_buff_base{id = 90121, eff_type = buff, type = 10300,
                 max_layer = 1, script_id = 125000};
get_buff(90122) ->
    #c_buff_base{id = 90122, eff_type = buff, type = 10210,
                 max_layer = 1, script_id = 112020};
get_buff(90123) ->
    #c_buff_base{id = 90123, eff_type = buff, type = 10390,
                 max_layer = 1, script_id = 139020};
get_buff(90124) ->
    #c_buff_base{id = 90124, eff_type = debuff,
                 type = 10210, max_layer = 1, script_id = 117020};
get_buff(90125) ->
    #c_buff_base{id = 90125, eff_type = buff, type = 0,
                 max_layer = 1, script_id = 100000};
get_buff(90126) ->
    #c_buff_base{id = 90126, eff_type = debuff, type = 0,
                 max_layer = 1, script_id = 132000};
get_buff(90127) ->
    #c_buff_base{id = 90127, eff_type = buff, type = 10270,
                 max_layer = 1, script_id = 120000};
get_buff(90128) ->
    #c_buff_base{id = 90128, eff_type = buff, type = 0,
                 max_layer = 1, script_id = 100000};
get_buff(90129) ->
    #c_buff_base{id = 90129, eff_type = buff, type = 0,
                 max_layer = 1, script_id = 100000};
get_buff(90130) ->
    #c_buff_base{id = 90130, eff_type = buff, type = 0,
                 max_layer = 1, script_id = 100000};
get_buff(90131) ->
    #c_buff_base{id = 90131, eff_type = buff, type = 0,
                 max_layer = 1, script_id = 100000};
get_buff(90132) ->
    #c_buff_base{id = 90132, eff_type = buff, type = 0,
                 max_layer = 1, script_id = 100000};
get_buff(90133) ->
    #c_buff_base{id = 90133, eff_type = debuff, type = 0,
                 max_layer = 1, script_id = 132000};
get_buff(90134) ->
    #c_buff_base{id = 90134, eff_type = debuff, type = 1,
                 max_layer = 1, script_id = 202020};
get_buff(90135) ->
    #c_buff_base{id = 90135, eff_type = buff, type = 10330,
                 max_layer = 1, script_id = 129000};
get_buff(90136) ->
    #c_buff_base{id = 90136, eff_type = buff, type = 10381,
                 max_layer = 1, script_id = 133001};
get_buff(90137) ->
    #c_buff_base{id = 90137, eff_type = debuff,
                 type = 20045, max_layer = 1, script_id = 234002};
get_buff(90138) ->
    #c_buff_base{id = 90138, eff_type = debuff,
                 type = 20015, max_layer = 1, script_id = 204020};
get_buff(90139) ->
    #c_buff_base{id = 90139, eff_type = debuff,
                 type = 20019, max_layer = 1, script_id = 206020};
get_buff(90140) ->
    #c_buff_base{id = 90140, eff_type = debuff, type = 0,
                 max_layer = 1, script_id = 132000};
get_buff(90141) ->
    #c_buff_base{id = 90141, eff_type = debuff,
                 type = 20041, max_layer = 1, script_id = 225000};
get_buff(90142) ->
    #c_buff_base{id = 90142, eff_type = buff, type = 10280,
                 max_layer = 1, script_id = 120010};
get_buff(90143) ->
    #c_buff_base{id = 90143, eff_type = buff, type = 10270,
                 max_layer = 1, script_id = 120000};
get_buff(90144) ->
    #c_buff_base{id = 90144, eff_type = debuff,
                 type = 20037, max_layer = 1, script_id = 221002};
get_buff(90145) ->
    #c_buff_base{id = 90145, eff_type = buff, type = 10330,
                 max_layer = 1, script_id = 129001};
get_buff(90146) ->
    #c_buff_base{id = 90146, eff_type = buff, type = 10230,
                 max_layer = 1, script_id = 114010};
get_buff(90147) ->
    #c_buff_base{id = 90147, eff_type = buff, type = 0,
                 max_layer = 1, script_id = 100000};
get_buff(90148) ->
    #c_buff_base{id = 90148, eff_type = debuff,
                 type = 10270, max_layer = 1, script_id = 120000};
get_buff(90149) ->
    #c_buff_base{id = 90149, eff_type = debuff, type = 0,
                 max_layer = 1, script_id = 132000};
get_buff(90150) ->
    #c_buff_base{id = 90150, eff_type = debuff, type = 0,
                 max_layer = 1, script_id = 100000};
get_buff(90151) ->
    #c_buff_base{id = 90151, eff_type = debuff, type = 0,
                 max_layer = 1, script_id = 132000};
get_buff(90152) ->
    #c_buff_base{id = 90152, eff_type = debuff, type = 0,
                 max_layer = 1, script_id = 132000};
get_buff(90153) ->
    #c_buff_base{id = 90153, eff_type = debuff, type = 0,
                 max_layer = 1, script_id = 100000};
get_buff(90154) ->
    #c_buff_base{id = 90154, eff_type = debuff,
                 type = 20041, max_layer = 1, script_id = 225000};
get_buff(90155) ->
    #c_buff_base{id = 90155, eff_type = buff, type = 50006,
                 max_layer = 1, script_id = 125001};
get_buff(90156) ->
    #c_buff_base{id = 90156, eff_type = buff, type = 70026,
                 max_layer = 1, script_id = 117020};
get_buff(90157) ->
    #c_buff_base{id = 90157, eff_type = buff, type = 70026,
                 max_layer = 1, script_id = 117020};
get_buff(90158) ->
    #c_buff_base{id = 90158, eff_type = debuff, type = 0,
                 max_layer = 1, script_id = 225000};
get_buff(90159) ->
    #c_buff_base{id = 90159, eff_type = buff, type = 10270,
                 max_layer = 1, script_id = 120000};
get_buff(90160) ->
    #c_buff_base{id = 90160, eff_type = buff, type = 70026,
                 max_layer = 1, script_id = 117020};
get_buff(90161) ->
    #c_buff_base{id = 90161, eff_type = debuff, type = 0,
                 max_layer = 1, script_id = 132000};
get_buff(90162) ->
    #c_buff_base{id = 90162, eff_type = debuff,
                 type = 30010, max_layer = 1, script_id = 144000};
get_buff(90163) ->
    #c_buff_base{id = 90163, eff_type = buff, type = 10270,
                 max_layer = 1, script_id = 120000};
get_buff(90164) ->
    #c_buff_base{id = 90164, eff_type = buff, type = 10300,
                 max_layer = 1, script_id = 125000};
get_buff(90165) ->
    #c_buff_base{id = 90165, eff_type = buff, type = 70026,
                 max_layer = 1, script_id = 117020};
get_buff(90166) ->
    #c_buff_base{id = 90166, eff_type = buff, type = 10340,
                 max_layer = 1, script_id = 130020};
get_buff(90167) ->
    #c_buff_base{id = 90167, eff_type = buff, type = 50005,
                 max_layer = 1, script_id = 133000};
get_buff(90168) ->
    #c_buff_base{id = 90168, eff_type = buff, type = 10270,
                 max_layer = 1, script_id = 120000};
get_buff(90169) ->
    #c_buff_base{id = 90169, eff_type = buff, type = 40011,
                 max_layer = 1, script_id = 142000};
get_buff(90170) ->
    #c_buff_base{id = 90170, eff_type = debuff,
                 type = 200101, max_layer = 1, script_id = 200001};
get_buff(90171) ->
    #c_buff_base{id = 90171, eff_type = debuff, type = 0,
                 max_layer = 1, script_id = 132000};
get_buff(90172) ->
    #c_buff_base{id = 90172, eff_type = buff, type = 10300,
                 max_layer = 1, script_id = 125000};
get_buff(90173) ->
    #c_buff_base{id = 90173, eff_type = buff, type = 50006,
                 max_layer = 1, script_id = 125001};
get_buff(90174) ->
    #c_buff_base{id = 90174, eff_type = buff, type = 10280,
                 max_layer = 1, script_id = 120010};
get_buff(90175) ->
    #c_buff_base{id = 90175, eff_type = debuff, type = 0,
                 max_layer = 1, script_id = 100000};
get_buff(90176) ->
    #c_buff_base{id = 90176, eff_type = buff, type = 10170,
                 max_layer = 1, script_id = 110010};
get_buff(90177) ->
    #c_buff_base{id = 90177, eff_type = buff, type = 10330,
                 max_layer = 1, script_id = 129001};
get_buff(90178) ->
    #c_buff_base{id = 90178, eff_type = debuff, type = 0,
                 max_layer = 1, script_id = 132000};
get_buff(90179) ->
    #c_buff_base{id = 90179, eff_type = debuff,
                 type = 20032, max_layer = 1, script_id = 217020};
get_buff(90180) ->
    #c_buff_base{id = 90180, eff_type = debuff,
                 type = 200411, max_layer = 1, script_id = 225000};
get_buff(90181) ->
    #c_buff_base{id = 90181, eff_type = debuff,
                 type = 200101, max_layer = 3, script_id = 200001};
get_buff(90182) ->
    #c_buff_base{id = 90182, eff_type = debuff,
                 type = 200481, max_layer = 1, script_id = 237000};
get_buff(90183) ->
    #c_buff_base{id = 90183, eff_type = debuff,
                 type = 10300, max_layer = 1, script_id = 125000};
get_buff(90184) ->
    #c_buff_base{id = 90184, eff_type = debuff,
                 type = 20040, max_layer = 1, script_id = 223000};
get_buff(90185) ->
    #c_buff_base{id = 90185, eff_type = buff, type = 10080,
                 max_layer = 1, script_id = 106010};
get_buff(90186) ->
    #c_buff_base{id = 90186, eff_type = buff, type = 10060,
                 max_layer = 1, script_id = 105010};
get_buff(90187) ->
    #c_buff_base{id = 90187, eff_type = buff, type = 500051,
                 max_layer = 1, script_id = 133002};
get_buff(90188) ->
    #c_buff_base{id = 90188, eff_type = buff, type = 10270,
                 max_layer = 1, script_id = 120000};
get_buff(90189) ->
    #c_buff_base{id = 90189, eff_type = buff, type = 102101,
                 max_layer = 1, script_id = 112010};
get_buff(90190) ->
    #c_buff_base{id = 90190, eff_type = buff, type = 10240,
                 max_layer = 1, script_id = 115010};
get_buff(90191) ->
    #c_buff_base{id = 90191, eff_type = buff, type = 10210,
                 max_layer = 1, script_id = 112020};
get_buff(90192) ->
    #c_buff_base{id = 90192, eff_type = buff, type = 10280,
                 max_layer = 1, script_id = 120010};
get_buff(90193) ->
    #c_buff_base{id = 90193, eff_type = debuff,
                 type = 200481, max_layer = 1, script_id = 237000};
get_buff(90194) ->
    #c_buff_base{id = 90194, eff_type = debuff,
                 type = 200101, max_layer = 3, script_id = 200001};
get_buff(90195) ->
    #c_buff_base{id = 90195, eff_type = buff, type = 10110,
                 max_layer = 1, script_id = 103020};
get_buff(90196) ->
    #c_buff_base{id = 90196, eff_type = buff, type = 10030,
                 max_layer = 1, script_id = 107010};
get_buff(90197) ->
    #c_buff_base{id = 90197, eff_type = buff, type = 10300,
                 max_layer = 1, script_id = 125000};
get_buff(90198) ->
    #c_buff_base{id = 90198, eff_type = debuff, type = 0,
                 max_layer = 1, script_id = 100000};
get_buff(90199) ->
    #c_buff_base{id = 90199, eff_type = debuff, type = 0,
                 max_layer = 1, script_id = 100000};
get_buff(90200) ->
    #c_buff_base{id = 90200, eff_type = debuff, type = 0,
                 max_layer = 1, script_id = 100000};
get_buff(90201) ->
    #c_buff_base{id = 90201, eff_type = buff, type = 10110,
                 max_layer = 1, script_id = 103020};
get_buff(90202) ->
    #c_buff_base{id = 90202, eff_type = buff, type = 10030,
                 max_layer = 1, script_id = 107010};
get_buff(90203) ->
    #c_buff_base{id = 90203, eff_type = buff, type = 10300,
                 max_layer = 1, script_id = 125000};
get_buff(90204) ->
    #c_buff_base{id = 90204, eff_type = buff, type = 10270,
                 max_layer = 1, script_id = 120000};
get_buff(90205) ->
    #c_buff_base{id = 90205, eff_type = buff, type = 10300,
                 max_layer = 1, script_id = 125000};
get_buff(90206) ->
    #c_buff_base{id = 90206, eff_type = buff, type = 10370,
                 max_layer = 1, script_id = 132000};
get_buff(90207) ->
    #c_buff_base{id = 90207, eff_type = buff, type = 10110,
                 max_layer = 1, script_id = 103020};
get_buff(90208) ->
    #c_buff_base{id = 90208, eff_type = buff, type = 10300,
                 max_layer = 1, script_id = 125000};
get_buff(90209) ->
    #c_buff_base{id = 90209, eff_type = buff, type = 10270,
                 max_layer = 1, script_id = 120000};
get_buff(90210) ->
    #c_buff_base{id = 90210, eff_type = debuff, type = 0,
                 max_layer = 1, script_id = 100000};
get_buff(90211) ->
    #c_buff_base{id = 90211, eff_type = debuff,
                 type = 200101, max_layer = 1, script_id = 200001};
get_buff(90212) ->
    #c_buff_base{id = 90212, eff_type = buff, type = 10330,
                 max_layer = 1, script_id = 129001};
get_buff(90213) ->
    #c_buff_base{id = 90213, eff_type = debuff, type = 0,
                 max_layer = 1, script_id = 100000};
get_buff(90214) ->
    #c_buff_base{id = 90214, eff_type = buff, type = 100701,
                 max_layer = 1, script_id = 116020};
get_buff(90215) ->
    #c_buff_base{id = 90215, eff_type = buff, type = 100701,
                 max_layer = 1, script_id = 116020};
get_buff(90216) ->
    #c_buff_base{id = 90216, eff_type = buff, type = 100701,
                 max_layer = 1, script_id = 116020};
get_buff(90217) ->
    #c_buff_base{id = 90217, eff_type = buff, type = 102101,
                 max_layer = 1, script_id = 112020};
get_buff(90218) ->
    #c_buff_base{id = 90218, eff_type = buff, type = 10270,
                 max_layer = 1, script_id = 120000};
get_buff(90219) ->
    #c_buff_base{id = 90219, eff_type = debuff,
                 type = 10270, max_layer = 1, script_id = 120000};
get_buff(90220) ->
    #c_buff_base{id = 90220, eff_type = buff, type = 10110,
                 max_layer = 5, script_id = 103020};
get_buff(90221) ->
    #c_buff_base{id = 90221, eff_type = buff, type = 10370,
                 max_layer = 1, script_id = 132000};
get_buff(90222) ->
    #c_buff_base{id = 90222, eff_type = debuff,
                 type = 10270, max_layer = 1, script_id = 120000};
get_buff(90223) ->
    #c_buff_base{id = 90223, eff_type = buff, type = 20046,
                 max_layer = 1, script_id = 235001};
get_buff(90224) ->
    #c_buff_base{id = 90224, eff_type = buff, type = 10240,
                 max_layer = 1, script_id = 115011};
get_buff(90225) ->
    #c_buff_base{id = 90225, eff_type = buff, type = 50006,
                 max_layer = 1, script_id = 125001};
get_buff(90226) ->
    #c_buff_base{id = 90226, eff_type = buff, type = 10270,
                 max_layer = 1, script_id = 120000};
get_buff(90227) ->
    #c_buff_base{id = 90227, eff_type = buff, type = 100601,
                 max_layer = 1, script_id = 105010};
get_buff(90228) ->
    #c_buff_base{id = 90228, eff_type = buff, type = 100801,
                 max_layer = 1, script_id = 106010};
get_buff(90230) ->
    #c_buff_base{id = 90230, eff_type = buff, type = 700261,
                 max_layer = 1, script_id = 117020};
get_buff(90231) ->
    #c_buff_base{id = 90231, eff_type = buff, type = 700261,
                 max_layer = 1, script_id = 117020};
get_buff(90232) ->
    #c_buff_base{id = 90232, eff_type = buff, type = 2,
                 max_layer = 1, script_id = 100000};
get_buff(90233) ->
    #c_buff_base{id = 90233, eff_type = debuff,
                 type = 20010, max_layer = 3, script_id = 200001};
get_buff(90234) ->
    #c_buff_base{id = 90234, eff_type = buff, type = 50006,
                 max_layer = 1, script_id = 148000};
get_buff(90235) ->
    #c_buff_base{id = 90235, eff_type = debuff,
                 type = 90235, max_layer = 3, script_id = 250000};
get_buff(90236) ->
    #c_buff_base{id = 90236, eff_type = buff, type = 50007,
                 max_layer = 1, script_id = 148000};
get_buff(90238) ->
    #c_buff_base{id = 90238, eff_type = buff, type = 90238,
                 max_layer = 3, script_id = 149000};
get_buff(90241) ->
    #c_buff_base{id = 90241, eff_type = debuff,
                 type = 90240, max_layer = 1, script_id = 251000};
get_buff(90242) ->
    #c_buff_base{id = 90242, eff_type = buff, type = 10270,
                 max_layer = 1, script_id = 120000};
get_buff(90243) ->
    #c_buff_base{id = 90243, eff_type = buff, type = 10370,
                 max_layer = 1, script_id = 132000};
get_buff(90244) ->
    #c_buff_base{id = 90244, eff_type = debuff,
                 type = 20046, max_layer = 1, script_id = 235001};
get_buff(90245) ->
    #c_buff_base{id = 90245, eff_type = debuff,
                 type = 200461, max_layer = 1, script_id = 118020};
get_buff(90246) ->
    #c_buff_base{id = 90246, eff_type = debuff,
                 type = 200461, max_layer = 1, script_id = 100000};
get_buff(90247) ->
    #c_buff_base{id = 90247, eff_type = debuff,
                 type = 20050, max_layer = 1, script_id = 252000};
get_buff(90248) ->
    #c_buff_base{id = 90248, eff_type = debuff,
                 type = 20041, max_layer = 1, script_id = 225000};
get_buff(90249) ->
    #c_buff_base{id = 90249, eff_type = debuff,
                 type = 20046, max_layer = 1, script_id = 245000};
get_buff(90250) ->
    #c_buff_base{id = 90250, eff_type = debuff,
                 type = 200461, max_layer = 1, script_id = 255000};
get_buff(90251) ->
    #c_buff_base{id = 90251, eff_type = buff, type = 50006,
                 max_layer = 1, script_id = 125001};
get_buff(90252) ->
    #c_buff_base{id = 90252, eff_type = debuff,
                 type = 20030, max_layer = 1, script_id = 211021};
get_buff(90253) ->
    #c_buff_base{id = 90253, eff_type = buff, type = 10331,
                 max_layer = 1, script_id = 129000};
get_buff(90255) ->
    #c_buff_base{id = 90255, eff_type = debuff,
                 type = 70028, max_layer = 1, script_id = 234001};
get_buff(90256) ->
    #c_buff_base{id = 90256, eff_type = buff, type = 10342,
                 max_layer = 1, script_id = 100000};
get_buff(90257) ->
    #c_buff_base{id = 90257, eff_type = buff, type = 10210,
                 max_layer = 1, script_id = 117020};
get_buff(90258) ->
    #c_buff_base{id = 90258, eff_type = debuff, type = 1,
                 max_layer = 3, script_id = 112020};
get_buff(90259) ->
    #c_buff_base{id = 90259, eff_type = debuff, type = 5,
                 max_layer = 3, script_id = 200001};
get_buff(90261) ->
    #c_buff_base{id = 90261, eff_type = debuff, type = 1,
                 max_layer = 1, script_id = 106010};
get_buff(90262) ->
    #c_buff_base{id = 90262, eff_type = debuff, type = 2,
                 max_layer = 1, script_id = 105010};
get_buff(90263) ->
    #c_buff_base{id = 90263, eff_type = buff, type = 70028,
                 max_layer = 1, script_id = 100000};
get_buff(90265) ->
    #c_buff_base{id = 90265, eff_type = debuff, type = 8,
                 max_layer = 1, script_id = 100000};
get_buff(90266) ->
    #c_buff_base{id = 90266, eff_type = debuff,
                 type = 70029, max_layer = 1, script_id = 100000};
get_buff(90270) ->
    #c_buff_base{id = 90270, eff_type = debuff, type = 1,
                 max_layer = 1, script_id = 100000};
get_buff(90271) ->
    #c_buff_base{id = 90271, eff_type = debuff, type = 1,
                 max_layer = 1, script_id = 100000};
get_buff(90272) ->
    #c_buff_base{id = 90272, eff_type = debuff, type = 1,
                 max_layer = 1, script_id = 100000};
get_buff(90273) ->
    #c_buff_base{id = 90273, eff_type = debuff, type = 1,
                 max_layer = 1, script_id = 125002};
get_buff(90274) ->
    #c_buff_base{id = 90274, eff_type = debuff,
                 type = 10270, max_layer = 1, script_id = 120000};
get_buff(90275) ->
    #c_buff_base{id = 90275, eff_type = buff, type = 10211,
                 max_layer = 1, script_id = 112020};
get_buff(90276) ->
    #c_buff_base{id = 90276, eff_type = buff, type = 10212,
                 max_layer = 1, script_id = 125000};
get_buff(90277) ->
    #c_buff_base{id = 90277, eff_type = debuff,
                 type = 70029, max_layer = 1, script_id = 100000};
get_buff(90278) ->
    #c_buff_base{id = 90278, eff_type = debuff, type = 5,
                 max_layer = 3, script_id = 200001};
get_buff(90279) ->
    #c_buff_base{id = 90279, eff_type = debuff, type = 1,
                 max_layer = 1, script_id = 106020};
get_buff(90280) ->
    #c_buff_base{id = 90280, eff_type = debuff, type = 2,
                 max_layer = 1, script_id = 105020};
get_buff(90281) ->
    #c_buff_base{id = 90281, eff_type = debuff,
                 type = 41233, max_layer = 1, script_id = 109010};
get_buff(90282) ->
    #c_buff_base{id = 90282, eff_type = debuff,
                 type = 20011, max_layer = 1, script_id = 202021};
get_buff(90283) ->
    #c_buff_base{id = 90283, eff_type = buff, type = 10270,
                 max_layer = 1, script_id = 120000};
get_buff(90284) ->
    #c_buff_base{id = 90284, eff_type = buff, type = 88021,
                 max_layer = 1, script_id = 139020};
get_buff(90285) ->
    #c_buff_base{id = 90285, eff_type = debuff, type = 0,
                 max_layer = 1, script_id = 132000};
get_buff(90286) ->
    #c_buff_base{id = 90286, eff_type = buff, type = 10170,
                 max_layer = 1, script_id = 110010};
get_buff(90287) ->
    #c_buff_base{id = 90287, eff_type = debuff, type = 0,
                 max_layer = 1, script_id = 100000};
get_buff(90288) ->
    #c_buff_base{id = 90288, eff_type = debuff, type = 0,
                 max_layer = 1, script_id = 100000};
get_buff(90289) ->
    #c_buff_base{id = 90289, eff_type = debuff,
                 type = 70036, max_layer = 1, script_id = 246000};
get_buff(90290) ->
    #c_buff_base{id = 90290, eff_type = debuff, type = 5,
                 max_layer = 3, script_id = 200001};
get_buff(90291) ->
    #c_buff_base{id = 90291, eff_type = debuff,
                 type = 20030, max_layer = 1, script_id = 211021};
get_buff(90292) ->
    #c_buff_base{id = 90292, eff_type = debuff,
                 type = 10270, max_layer = 1, script_id = 120000};
get_buff(90293) ->
    #c_buff_base{id = 90293, eff_type = debuff,
                 type = 90293, max_layer = 1, script_id = 230020};
get_buff(90294) ->
    #c_buff_base{id = 90294, eff_type = debuff,
                 type = 90294, max_layer = 3, script_id = 200001};
get_buff(90295) ->
    #c_buff_base{id = 90295, eff_type = debuff, type = 5,
                 max_layer = 3, script_id = 200001};
get_buff(90296) ->
    #c_buff_base{id = 90296, eff_type = debuff,
                 type = 90296, max_layer = 1, script_id = 100000};
get_buff(90297) ->
    #c_buff_base{id = 90297, eff_type = debuff,
                 type = 90297, max_layer = 1, script_id = 100000};
get_buff(90298) ->
    #c_buff_base{id = 90298, eff_type = debuff,
                 type = 90298, max_layer = 1, script_id = 100000};
get_buff(90299) ->
    #c_buff_base{id = 90299, eff_type = debuff,
                 type = 90299, max_layer = 1, script_id = 100000};
get_buff(90300) ->
    #c_buff_base{id = 90300, eff_type = buff, type = 90300,
                 max_layer = 1, script_id = 132000};
get_buff(90301) ->
    #c_buff_base{id = 90301, eff_type = buff, type = 90301,
                 max_layer = 1, script_id = 132000};
get_buff(90302) ->
    #c_buff_base{id = 90302, eff_type = buff, type = 90302,
                 max_layer = 1, script_id = 132000};
get_buff(90303) ->
    #c_buff_base{id = 90303, eff_type = buff, type = 90303,
                 max_layer = 1, script_id = 132000};
get_buff(90304) ->
    #c_buff_base{id = 90304, eff_type = buff, type = 90304,
                 max_layer = 1, script_id = 119000};
get_buff(90305) ->
    #c_buff_base{id = 90305, eff_type = buff, type = 90305,
                 max_layer = 1, script_id = 116020};
get_buff(90306) ->
    #c_buff_base{id = 90306, eff_type = buff, type = 90306,
                 max_layer = 1, script_id = 130022};
get_buff(90307) ->
    #c_buff_base{id = 90307, eff_type = buff, type = 90307,
                 max_layer = 1, script_id = 111020};
get_buff(90308) ->
    #c_buff_base{id = 90308, eff_type = buff, type = 90308,
                 max_layer = 1, script_id = 132000};
get_buff(90309) ->
    #c_buff_base{id = 90309, eff_type = buff, type = 90309,
                 max_layer = 1, script_id = 125000};
get_buff(90310) ->
    #c_buff_base{id = 90310, eff_type = buff, type = 90310,
                 max_layer = 1, script_id = 125000};
get_buff(90311) ->
    #c_buff_base{id = 90311, eff_type = buff, type = 90306,
                 max_layer = 1, script_id = 130022};
get_buff(90312) ->
    #c_buff_base{id = 90312, eff_type = buff, type = 90306,
                 max_layer = 1, script_id = 130022};
get_buff(90313) ->
    #c_buff_base{id = 90313, eff_type = buff, type = 90313,
                 max_layer = 1, script_id = 132000};
get_buff(90314) ->
    #c_buff_base{id = 90314, eff_type = buff, type = 90314,
                 max_layer = 1, script_id = 117021};
get_buff(90315) ->
    #c_buff_base{id = 90315, eff_type = buff, type = 90315,
                 max_layer = 1, script_id = 100000};
get_buff(90316) ->
    #c_buff_base{id = 90316, eff_type = buff, type = 90316,
                 max_layer = 1, script_id = 100000};
get_buff(90317) ->
    #c_buff_base{id = 90317, eff_type = debuff,
                 type = 90317, max_layer = 1, script_id = 239000};
get_buff(90318) ->
    #c_buff_base{id = 90318, eff_type = debuff,
                 type = 90318, max_layer = 1, script_id = 100000};
get_buff(90319) ->
    #c_buff_base{id = 90319, eff_type = buff, type = 90319,
                 max_layer = 1, script_id = 102030};
get_buff(90320) ->
    #c_buff_base{id = 90320, eff_type = buff, type = 90320,
                 max_layer = 1, script_id = 112020};
get_buff(90321) ->
    #c_buff_base{id = 90321, eff_type = buff, type = 90321,
                 max_layer = 1, script_id = 132000};
get_buff(90322) ->
    #c_buff_base{id = 90322, eff_type = buff, type = 90322,
                 max_layer = 1, script_id = 133000};
get_buff(90323) ->
    #c_buff_base{id = 90323, eff_type = buff, type = 90323,
                 max_layer = 1, script_id = 100000};
get_buff(90324) ->
    #c_buff_base{id = 90324, eff_type = debuff,
                 type = 90324, max_layer = 1, script_id = 212020};
get_buff(90325) ->
    #c_buff_base{id = 90325, eff_type = buff, type = 90325,
                 max_layer = 1, script_id = 100000};
get_buff(90326) ->
    #c_buff_base{id = 90326, eff_type = buff, type = 90326,
                 max_layer = 1, script_id = 100000};
get_buff(90327) ->
    #c_buff_base{id = 90327, eff_type = buff, type = 90327,
                 max_layer = 1, script_id = 100000};
get_buff(90328) ->
    #c_buff_base{id = 90328, eff_type = buff, type = 90328,
                 max_layer = 1, script_id = 100000};
get_buff(90329) ->
    #c_buff_base{id = 90329, eff_type = buff, type = 90329,
                 max_layer = 1, script_id = 100000};
get_buff(90330) ->
    #c_buff_base{id = 90330, eff_type = buff, type = 90330,
                 max_layer = 1, script_id = 112020};
get_buff(90331) ->
    #c_buff_base{id = 90331, eff_type = debuff,
                 type = 90331, max_layer = 1, script_id = 202020};
get_buff(90332) ->
    #c_buff_base{id = 90332, eff_type = buff, type = 90332,
                 max_layer = 1, script_id = 125000};
get_buff(90333) ->
    #c_buff_base{id = 90333, eff_type = buff, type = 90333,
                 max_layer = 1, script_id = 117020};
get_buff(90334) ->
    #c_buff_base{id = 90334, eff_type = buff, type = 90334,
                 max_layer = 1, script_id = 119000};
get_buff(90335) ->
    #c_buff_base{id = 90335, eff_type = buff, type = 90335,
                 max_layer = 1, script_id = 133000};
get_buff(90336) ->
    #c_buff_base{id = 90336, eff_type = buff, type = 90336,
                 max_layer = 1, script_id = 117020};
get_buff(90337) ->
    #c_buff_base{id = 90337, eff_type = buff, type = 90300,
                 max_layer = 1, script_id = 132000};
get_buff(90338) ->
    #c_buff_base{id = 90338, eff_type = debuff,
                 type = 90338, max_layer = 1, script_id = 221001};
get_buff(90339) ->
    #c_buff_base{id = 90339, eff_type = buff, type = 90333,
                 max_layer = 1, script_id = 117020};
get_buff(90340) ->
    #c_buff_base{id = 90340, eff_type = buff, type = 90340,
                 max_layer = 1, script_id = 125000};
get_buff(90341) ->
    #c_buff_base{id = 90341, eff_type = buff, type = 90341,
                 max_layer = 1, script_id = 120000};
get_buff(90342) ->
    #c_buff_base{id = 90342, eff_type = buff, type = 90342,
                 max_layer = 1, script_id = 118020};
get_buff(90343) ->
    #c_buff_base{id = 90343, eff_type = buff, type = 90343,
                 max_layer = 1, script_id = 112020};
get_buff(90344) ->
    #c_buff_base{id = 90344, eff_type = buff, type = 90344,
                 max_layer = 1, script_id = 100000};
get_buff(90345) ->
    #c_buff_base{id = 90345, eff_type = buff, type = 90345,
                 max_layer = 1, script_id = 112020};
get_buff(90346) ->
    #c_buff_base{id = 90346, eff_type = buff, type = 90346,
                 max_layer = 1, script_id = 106020};
get_buff(90347) ->
    #c_buff_base{id = 90347, eff_type = buff, type = 90347,
                 max_layer = 1, script_id = 132000};
get_buff(90348) ->
    #c_buff_base{id = 90348, eff_type = buff, type = 90348,
                 max_layer = 10, script_id = 112020};
get_buff(90349) ->
    #c_buff_base{id = 90349, eff_type = buff, type = 90349,
                 max_layer = 1, script_id = 317001};
get_buff(90350) ->
    #c_buff_base{id = 90350, eff_type = buff, type = 90350,
                 max_layer = 1, script_id = 417001};
get_buff(90502) ->
    #c_buff_base{id = 90502, eff_type = buff, type = 90502,
                 max_layer = 1, script_id = 125003};
get_buff(90503) ->
    #c_buff_base{id = 90503, eff_type = buff, type = 90503,
                 max_layer = 1, script_id = 111020};
get_buff(90504) ->
    #c_buff_base{id = 90504, eff_type = buff, type = 90504,
                 max_layer = 1, script_id = 103020};
get_buff(90505) ->
    #c_buff_base{id = 90505, eff_type = debuff, type = 90505,
                 max_layer = 1, script_id = 202020};
get_buff(90506) ->
    #c_buff_base{id = 90506, eff_type = buff, type = 90506,
                 max_layer = 1, script_id = 256001};
get_buff(90507) ->
    #c_buff_base{id = 90507, eff_type = buff, type = 90507,
                 max_layer = 1, script_id = 104020};
get_buff(90508) ->
    #c_buff_base{id = 90508, eff_type = buff, type = 90508,
                 max_layer = 1, script_id = 111020};
get_buff(90509) ->
    #c_buff_base{id = 90509, eff_type = buff, type = 90509,
                 max_layer = 1, script_id = 103020};
get_buff(90510) ->
    #c_buff_base{id = 90510, eff_type = buff, type = 90510,
                 max_layer = 1, script_id = 106020};
get_buff(90511) ->
    #c_buff_base{id = 90511, eff_type = buff, type = 90511,
                 max_layer = 1, script_id = 256002};
get_buff(90500) ->
    #c_buff_base{id = 90500, eff_type = buff, type = 90500,
                 max_layer = 99, script_id = 417001};
get_buff(90501) ->
    #c_buff_base{id = 90501, eff_type = buff, type = 90501,
                 max_layer = 3, script_id = 417001};
get_buff(90351) ->
    #c_buff_base{id = 90351, eff_type = buff, type = 90346,
                 max_layer = 1, script_id = 125000};
get_buff(90352) ->
    #c_buff_base{id = 90352, eff_type = buff, type = 90352,
                 max_layer = 1, script_id = 100000};
get_buff(90353) ->
    #c_buff_base{id = 90353, eff_type = buff, type = 90349,
                 max_layer = 1, script_id = 317001};
get_buff(90354) ->
    #c_buff_base{id = 90354, eff_type = buff, type = 90343,
                 max_layer = 3, script_id = 112020};
get_buff(90355) ->
    #c_buff_base{id = 90355, eff_type = buff, type = 90355,
                 max_layer = 1, script_id = 325001};
get_buff(90356) ->
    #c_buff_base{id = 90356, eff_type = buff, type = 90356,
                 max_layer = 1, script_id = 425001};
get_buff(90357) ->
    #c_buff_base{id = 90357, eff_type = buff, type = 90347,
                 max_layer = 1, script_id = 132000};
get_buff(90358) ->
    #c_buff_base{id = 90358, eff_type = buff, type = 90345,
                 max_layer = 1, script_id = 112020};
get_buff(90359) ->
    #c_buff_base{id = 90359, eff_type = buff, type = 90359,
                 max_layer = 1, script_id = 120010};
get_buff(90360) ->
    #c_buff_base{id = 90360, eff_type = buff, type = 90360,
                 max_layer = 1, script_id = 100000};
get_buff(90361) ->
    #c_buff_base{id = 90361, eff_type = buff, type = 90361,
                 max_layer = 1, script_id = 325001};
get_buff(90362) ->
    #c_buff_base{id = 90362, eff_type = buff, type = 90362,
                 max_layer = 1, script_id = 425001};
get_buff(90363) ->
    #c_buff_base{id = 90363, eff_type = debuff,
                 type = 90363, max_layer = 1, script_id = 100000};
get_buff(90364) ->
    #c_buff_base{id = 90364, eff_type = buff, type = 90364,
                 max_layer = 1, script_id = 112020};
get_buff(90365) ->
    #c_buff_base{id = 90365, eff_type = buff, type = 90365,
                 max_layer = 1, script_id = 120000};
get_buff(90366) ->
    #c_buff_base{id = 90366, eff_type = buff, type = 90366,
                 max_layer = 1, script_id = 112020};
get_buff(90367) ->
    #c_buff_base{id = 90367, eff_type = buff, type = 90367,
                 max_layer = 1, script_id = 125000};
get_buff(90368) ->
    #c_buff_base{id = 90368, eff_type = buff, type = 90368,
                 max_layer = 1, script_id = 125000};
get_buff(90369) ->
    #c_buff_base{id = 90369, eff_type = buff, type = 90369,
                 max_layer = 1, script_id = 112020};
get_buff(90370) ->
    #c_buff_base{id = 90370, eff_type = buff, type = 90368,
                 max_layer = 1, script_id = 125000};
get_buff(90371) ->
    #c_buff_base{id = 90371, eff_type = buff, type = 90371,
                 max_layer = 1, script_id = 102030};
get_buff(90372) ->
    #c_buff_base{id = 90372, eff_type = buff, type = 90372,
                 max_layer = 1, script_id = 100000};
get_buff(90373) ->
    #c_buff_base{id = 90373, eff_type = buff, type = 90373,
                 max_layer = 1, script_id = 120010};
get_buff(90374) ->
    #c_buff_base{id = 90374, eff_type = buff, type = 90374,
                 max_layer = 1, script_id = 112020};
get_buff(90375) ->
    #c_buff_base{id = 90375, eff_type = buff, type = 90375,
                 max_layer = 1, script_id = 100000};
get_buff(90376) ->
    #c_buff_base{id = 90376, eff_type = buff, type = 90376,
                 max_layer = 1, script_id = 120010};
get_buff(90377) ->
    #c_buff_base{id = 90377, eff_type = buff, type = 90377,
                 max_layer = 1, script_id = 125000};
get_buff(90378) ->
    #c_buff_base{id = 90378, eff_type = buff, type = 90378,
                 max_layer = 1, script_id = 125000};
get_buff(90379) ->
    #c_buff_base{id = 90379, eff_type = buff, type = 90379,
                 max_layer = 1, script_id = 112020};
get_buff(90380) ->
    #c_buff_base{id = 90380, eff_type = buff, type = 90380,
                 max_layer = 1, script_id = 100000};
get_buff(90381) ->
    #c_buff_base{id = 90381, eff_type = buff, type = 90380,
                 max_layer = 1, script_id = 100000};
get_buff(90382) ->
    #c_buff_base{id = 90382, eff_type = buff, type = 90382,
                 max_layer = 1, script_id = 325001};
get_buff(90383) ->
    #c_buff_base{id = 90383, eff_type = buff, type = 90382,
                 max_layer = 1, script_id = 425001};
get_buff(90384) ->
    #c_buff_base{id = 90384, eff_type = buff, type = 90384,
                 max_layer = 1, script_id = 325001};
get_buff(90385) ->
    #c_buff_base{id = 90385, eff_type = buff, type = 90384,
                 max_layer = 1, script_id = 425001};
get_buff(90386) ->
    #c_buff_base{id = 90386, eff_type = buff, type = 90341,
                 max_layer = 1, script_id = 106020};
get_buff(90387) ->
    #c_buff_base{id = 90387, eff_type = buff, type = 90387,
                 max_layer = 1, script_id = 100000};
get_buff(90388) ->
    #c_buff_base{id = 90388, eff_type = buff, type = 90388,
                 max_layer = 1, script_id = 120010};
get_buff(90389) ->
    #c_buff_base{id = 90389, eff_type = buff, type = 90388,
                 max_layer = 1, script_id = 102030};
get_buff(90390) ->
    #c_buff_base{id = 90390, eff_type = buff, type = 90390,
                 max_layer = 1, script_id = 120000};
get_buff(90391) ->
    #c_buff_base{id = 90391, eff_type = buff, type = 10010,
                 max_layer = 1, script_id = 102020};
get_buff(90392) ->
    #c_buff_base{id = 90392, eff_type = buff, type = 10210,
                 max_layer = 1, script_id = 117020};
get_buff(90393) ->
    #c_buff_base{id = 90393, eff_type = buff, type = 90393,
                 max_layer = 1, script_id = 114010};
get_buff(90394) ->
    #c_buff_base{id = 90394, eff_type = buff, type = 90394,
                 max_layer = 1, script_id = 112020};
get_buff(_) -> false.

get_init_buff({5, 4}) -> [{90393, 1000, 0, 0, [100]}];
get_init_buff({26, 4}) -> [{90393, 1000, 0, 0, [100]}];
get_init_buff({68, 4}) -> [{90393, 1000, 0, 0, [100]}];
get_init_buff({72, 4}) -> [{90393, 1000, 0, 0, [100]}];
get_init_buff({69, 4}) -> [{90393, 1000, 0, 0, [100]}];
get_init_buff({70, 4}) -> [{90393, 1000, 0, 0, [100]}];
get_init_buff(_) -> [].

