-file("src/mod/combat/combat_cache.erl", 1).

-module(combat_cache).

-export([init/3,
         get_context/0,
         get_context_elem/1,
         save_context/1,
         atk/0,
         dfd/0,
         op/1,
         all_op/1,
         all/0,
         all/1,
         all_living/0,
         all_living/1,
         f/2,
         f/3,
         u/1,
         u/2,
         do_u/3,
         f_origin/2,
         set_ext_val/3,
         get_ext_val/3]).

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

-file("src/mod/combat/combat_cache.erl", 34).

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

-file("src/mod/combat/combat_cache.erl", 35).

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

-file("src/mod/combat/combat_cache.erl", 36).

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

-file("src/mod/combat/combat_cache.erl", 37).

-file("inc/wing.hrl", 1).

-record(m_wing,
        {ver = 11 :: pos_integer(),
         grade = 0 :: non_neg_integer(),
         growth = 0,
         enhance_num = 0,
         wing_id = 0,
         plot_wing_id = 0,
         expiry = [],
         tmp_grade = 0 :: non_neg_integer(),
         tmp_growth = 0,
         tmp_wing_id = 0,
         star_lev = 1 :: non_neg_integer(),
         valid_plan = 1,
         plan_data = [] :: list(),
         change_times = 0,
         reset_times = 0,
         lev_break_skill = [],
         wing_ids = [],
         exp = 0,
         old_grade = 0,
         old_star = 0,
         appearance_list = [],
         speed = 1,
         wing_group_list = [],
         wing_power = 100}).

-record(wing_skill_plan,
        {index = 1,
         plan_name = [] :: list(),
         skills = [],
         tmp_skills = []}).

-record(wing_lev_break_skill,
        {ver = 1,
         skill_grade = 0,
         skill_id = 0,
         skill_lev = 0,
         skill_val = 0}).

-record(wing_skill,
        {ver = 1, key = {0, 0}, id = 0, lev = 0, is_lock = 0}).

-record(wing_lock_data,
        {grade = 0, max = 0, item_list = []}).

-record(wing_appearance,
        {id = 0,
         time = 0,
         timeout = 0,
         grade = 0,
         star_lev = 0}).

-record(wing_base_group,
        {group_id = 0,
         need_grade = 0,
         wing_ids = [],
         grades = [],
         loss_item = []}).

-record(wing_group,
        {ver = 1,
         group_id = 0,
         wing_ids = [],
         wing_times = 0,
         rewarded = 0}).

-file("src/mod/combat/combat_cache.erl", 38).

init(_Combat = #combat{type = CombatType,
                       start_args = StartArgs},
     OriginAtkList, OriginDfdList) ->
    put(next_fighter_id, 1),
    put(start_args, StartArgs),
    put(combat_type, CombatType),
    init_pos(CombatType, OriginAtkList, OriginDfdList),
    ok.

init_pos(_CombatType, OriginAtkList, OriginDfdList) ->
    AtkPrePosList = [PrePos
                     || #fighter{pos = PrePos} <- OriginAtkList],
    DfdPrePosList = [PrePos
                     || #fighter{pos = PrePos} <- OriginDfdList],
    Fun = fun (PosList) ->
                  [begin
                       case lists:member(Pos, PosList) of
                           true -> {Pos, 1};
                           _ -> {Pos, 0}
                       end
                   end
                   || Pos <- lists:seq(1, 13)]
          end,
    put({pos, 0}, Fun(AtkPrePosList)),
    put({pos, 1}, Fun(DfdPrePosList)),
    ok.

all() -> get(0) ++ get(1).

all_living() ->
    L = [F
         || F = #fighter{type = Type, is_escape = 0,
                         is_die = IsDie, is_die_disappear = IsDieDisappear}
                <- all(),
            Type =:= 2 andalso IsDie =:= 0 orelse
                Type =:= 2 andalso
                    IsDie =:= 1 andalso IsDieDisappear =:= 0
                    orelse Type =/= 2],
    L.

all_living(Group) ->
    L = [F
         || F = #fighter{type = Type, is_escape = 0,
                         is_die = IsDie, is_die_disappear = IsDieDisappear}
                <- all(Group),
            Type =:= 2 andalso IsDie =:= 0 orelse
                Type =:= 2 andalso
                    IsDie =:= 1 andalso IsDieDisappear =:= 0
                    orelse Type =/= 2],
    L.

all(0) -> atk();
all(1) -> dfd().

atk() -> get(0).

dfd() -> get(1).

op(0) -> 1;
op(1) -> 0.

all_op(Sgroup) -> all(op(Sgroup)).

get_ext_val(#fighter{ext_args = ExtArgs}, Type,
            DefVal) ->
    case lists:keyfind(Type, 1, ExtArgs) of
        {_, Val} -> Val;
        _ -> DefVal
    end.

set_ext_val(ExtArgs, Type, Val) ->
    lists:keystore(Type, 1, ExtArgs, {Type, Val}).

f(by_pid, Pid) ->
    Idx = case is_pid(Pid) of
              true -> #fighter.pid;
              false -> #fighter.id
          end,
    case lists:keyfind(Pid, Idx, get(0)) of
        false ->
            case lists:keyfind(Pid, Idx, get(1)) of
                false -> false;
                F -> F
            end;
        F -> F
    end;
f(by_id, Id) ->
    case lists:keyfind(Id, #fighter.id, get(0)) of
        false ->
            case lists:keyfind(Id, #fighter.id, get(1)) of
                false -> false;
                F -> F
            end;
        F -> F
    end;
f(by_originid, Id) ->
    case lists:keyfind(Id, #fighter.origin_id, get(0)) of
        false ->
            case lists:keyfind(Id, #fighter.origin_id, get(1)) of
                false -> false;
                F -> F
            end;
        F -> F
    end;
f(by_baseid, Id) ->
    case lists:keyfind(Id, #fighter.base_id, get(0)) of
        false ->
            case lists:keyfind(Id, #fighter.base_id, get(1)) of
                false -> false;
                F -> F
            end;
        F -> F
    end;
f(by_type, Type) ->
    case lists:keyfind(Type, #fighter.type, get(0)) of
        false ->
            case lists:keyfind(Type, #fighter.type, get(1)) of
                false -> false;
                F -> F
            end;
        F -> F
    end;
f(by_master_pid, Pid) ->
    case do_f(by_master_pid, Pid, get(0)) of
        false ->
            case do_f(by_master_pid, Pid, get(1)) of
                false -> false;
                F -> F
            end;
        F -> F
    end;
f(by_master_id, Id) ->
    case do_f(by_master_id, Id, get(0)) of
        false ->
            case do_f(by_master_id, Id, get(1)) of
                false -> false;
                F -> F
            end;
        F -> F
    end;
f(by_guard_pid, Pid) ->
    case [F
          || F = #fighter{guard_pid = Fpid} <- get(0),
             Fpid =:= Pid]
        of
        [] ->
            case [F1
                  || F1 = #fighter{guard_pid = Fpid1} <- get(1),
                     Fpid1 =:= Pid]
                of
                [] -> [];
                FList1 -> FList1
            end;
        FList -> FList
    end;
f(by_guard_id, Id) ->
    case [F
          || F = #fighter{guard_fid = Gid} <- get(0), Gid =:= Id]
        of
        [] ->
            case [F1
                  || F1 = #fighter{guard_fid = Gid1} <- get(1),
                     Gid1 =:= Id]
                of
                [] -> [];
                FList1 -> FList1
            end;
        FList -> FList
    end.

f(by_script_id, SkillList, ScriptId) ->
    case do_find_script_id(SkillList, ScriptId) of
        false -> undefined;
        Skill -> Skill
    end.

do_f(by_master_pid, _Pid, []) -> false;
do_f(by_master_pid, Pid,
     [F = #fighter{master_pid = Pid, is_escape = 0} | _]) ->
    F;
do_f(by_master_pid, Pid, [_ | T]) ->
    do_f(by_master_pid, Pid, T);
do_f(by_master_id, _Fid, []) -> false;
do_f(by_master_id, Fid,
     [F = #fighter{master_fid = Fid, is_escape = 0} | _]) ->
    F;
do_f(by_master_id, Fid, [_ | T]) ->
    do_f(by_master_id, Fid, T).

do_find_script_id([], _) -> false;
do_find_script_id([Cskill = #c_skill{skill =
                                         #skill{script_id = ScriptId}}
                   | _T],
                  ScriptId) ->
    Cskill;
do_find_script_id([_ | T], ScriptId) ->
    do_find_script_id(T, ScriptId).

f_origin(by_pid, Pid) ->
    Idx = case is_pid(Pid) of
              true -> #fighter.pid;
              false -> #fighter.id
          end,
    [OriginAtkList] =
        get_context_elem([#combat_context.origin_atk]),
    case lists:keyfind(Pid, Idx, OriginAtkList) of
        false ->
            [OriginDfdList] =
                get_context_elem([#combat_context.origin_dfd]),
            case lists:keyfind(Pid, Idx, OriginDfdList) of
                false -> false;
                F -> F
            end;
        F -> F
    end;
f_origin(by_id, Id) ->
    [OriginAtkList] =
        get_context_elem([#combat_context.origin_atk]),
    case lists:keyfind(Id, #fighter.id, OriginAtkList) of
        false ->
            [OriginDfdList] =
                get_context_elem([#combat_context.origin_dfd]),
            case lists:keyfind(Id, #fighter.id, OriginDfdList) of
                false -> false;
                F -> F
            end;
        F -> F
    end.

get_context() -> get(context).

get_context_elem(PosList) ->
    Context = get(context),
    [erlang:element(Pos, Context) || Pos <- PosList].

save_context(Context)
    when is_record(Context, combat_context) ->
    put(context, Context);
save_context(Changes) when is_list(Changes) ->
    do_save_context(Changes, get(context)).

do_save_context([], Context) -> put(context, Context);
do_save_context([{Pos, Val} | T], Context) ->
    do_save_context(T,
                    erlang:setelement(Pos, Context, Val)).

u(F = #fighter{id = Id, group = Group, name = _Name}) ->
    put(Group,
        lists:keyreplace(Id, #fighter.id, get(Group), F)),
    F.

u(#fighter{id = Id}, L) -> u(Id, L);
u(Pid, L) when is_pid(Pid) ->
    case f(by_pid, Pid) of
        F = #fighter{} -> do_u(F, L, update);
        _ -> ignore
    end;
u(Id, L) ->
    case f(by_id, Id) of
        F = #fighter{} -> do_u(F, L, update);
        _ -> ignore
    end.

do_u(F, [], update) -> u(F);
do_u(F, [], calc_only) -> F;
do_u(F, [{Key, Type, Val} | T], Flag) ->
    NF = case Key of
             hp when Type =:= 0 ->
                 HpMax = min(F#fighter.hp_max, F#fighter.tmp_hp_max),
                 NewHp = util:check_range(Val, 0, HpMax),
                 IsDie = combat_util:is_die(NewHp),
                 F#fighter{hp = NewHp, is_die = IsDie};
             hp when Type =:= 1 ->
                 Hp = F#fighter.hp,
                 HpMax = min(F#fighter.hp_max, F#fighter.tmp_hp_max),
                 NewHp = util:check_range(Hp + Val, 0, HpMax),
                 IsDie = combat_util:is_die(NewHp),
                 F#fighter{hp = NewHp, is_die = IsDie};
             hp when Type =:= 3 ->
                 Hp = F#fighter.hp,
                 HpMax = min(F#fighter.hp_max, F#fighter.tmp_hp_max),
                 Val1 = round(HpMax * Val / 1000),
                 NewHp = util:check_range(Hp + Val1, 0, HpMax),
                 IsDie = combat_util:is_die(NewHp),
                 F#fighter{hp = NewHp, is_die = IsDie};
             hp_max when Type =:= 0 ->
                 Hp = F#fighter.hp,
                 NewHp = util:check_range(Hp, 0, Val),
                 F#fighter{hp_max = Val, hp = NewHp};
             hp_max when Type =:= 1 ->
                 Hp = F#fighter.hp,
                 HpMax = (F#fighter.attr)#attr.hp_max,
                 NewHpMax = max(1, HpMax + Val),
                 NewHp = util:check_range(Hp, 0, NewHpMax),
                 F#fighter{hp = NewHp, hp_max = NewHpMax};
             hp_max when Type =:= 3 ->
                 Hp = F#fighter.hp,
                 HpMax = (F#fighter.attr)#attr.hp_max,
                 Val1 = round(HpMax * Val / 1000),
                 NewHpMax = max(1, HpMax + Val1),
                 NewHp = util:check_range(Hp, 0, NewHpMax),
                 F#fighter{hp = NewHp, hp_max = NewHpMax};
             tmp_hp_max when Type =:= 0 ->
                 HpMax = (F#fighter.attr)#attr.hp_max,
                 NewTmpHpMax = max(min(HpMax, Val),
                                   util:ceil(HpMax / 2)),
                 logger:debug("改变伤势:~w",
                              [NewTmpHpMax],
                              combat_cache,
                              351),
                 F#fighter{tmp_hp_max = NewTmpHpMax};
             tmp_hp_max when Type =:= 1 ->
                 TmpHpMax = F#fighter.tmp_hp_max,
                 HpMax = (F#fighter.attr)#attr.hp_max,
                 NewTmpHpMax = max(min(HpMax, TmpHpMax + Val),
                                   util:ceil(HpMax / 2)),
                 logger:debug("改变伤势:~w",
                              [NewTmpHpMax],
                              combat_cache,
                              357),
                 F#fighter{tmp_hp_max = NewTmpHpMax};
             mp when Type =:= 0 ->
                 MpMax = F#fighter.mp_max,
                 NewMp = util:check_range(Val, 0, MpMax),
                 F#fighter{mp = NewMp};
             mp when Type =:= 1 ->
                 Mp = F#fighter.mp,
                 MpMax = F#fighter.mp_max,
                 NewMp = util:check_range(Mp + Val, 0, MpMax),
                 F#fighter{mp = NewMp};
             mp when Type =:= 3 ->
                 Mp = F#fighter.mp,
                 MpMax = F#fighter.mp_max,
                 Val1 = round(MpMax * Val / 1000),
                 NewMp = util:check_range(Mp + Val1, 0, MpMax),
                 F#fighter{mp = NewMp};
             mp_max when Type =:= 0 ->
                 Mp = F#fighter.mp,
                 NewMp = util:check_range(Mp, 0, Val),
                 F#fighter{mp = NewMp, mp_max = Val};
             mp_max when Type =:= 1 ->
                 Mp = F#fighter.mp,
                 MpMax = F#fighter.mp_max,
                 NewMpMax = max(1, MpMax + Val),
                 NewMp = util:check_range(Mp, 0, NewMpMax),
                 F#fighter{mp = NewMp, mp_max = NewMpMax};
             be_dmg_mp_times ->
                 SpecialAttr = #special_attr{be_dmg_mp_times = BeTimes} =
                                   F#fighter.special_attr,
                 F#fighter{special_attr =
                               SpecialAttr#special_attr{be_dmg_mp_times =
                                                            BeTimes + Val}};
             pos when Type =:= 0 -> F#fighter{pos = Val};
             has_use_item ->
                 HasUseItem = F#fighter.has_use_item,
                 F#fighter{has_use_item = HasUseItem + 1};
             has_summon_pet ->
                 HasSummonPet = F#fighter.has_summon_pet,
                 F#fighter{has_summon_pet = HasSummonPet + 1};
             is_die ->
                 case Val =:= 0 of
                     true ->
                         SpecialAttr = F#fighter.special_attr,
                         [ReviveList] =
                             get_context_elem([#combat_context.revive_list]),
                         NewReviveList = lists:keydelete(F#fighter.id,
                                                         1,
                                                         ReviveList),
                         save_context([{#combat_context.revive_list,
                                        NewReviveList}]),
                         F#fighter{is_die = Val,
                                   special_attr =
                                       SpecialAttr#special_attr{reviving = 0}};
                     false -> F#fighter{is_die = Val}
                 end;
             is_escape -> F#fighter{is_escape = Val};
             is_radiance -> F#fighter{is_radiance = Val};
             self_preside -> F#fighter{self_preside_status = Val};
             self_preside_text -> F#fighter{self_preside_text = Val};
             target_preside ->
                 F#fighter{target_preside_status = Val};
             target_preside_text ->
                 F#fighter{target_preside_text = Val};
             is_hosted -> F#fighter{is_hosted = Val};
             is_ready -> F#fighter{is_ready = Val};
             is_defence -> F#fighter{is_defence = Val};
             action -> F#fighter{action = Val};
             looks when Type =:= 0 andalso is_list(Val) ->
                 F#fighter{looks = Val};
             anti_heal when Type =:= 1 ->
                 AntiHeal = F#fighter.anti_heal,
                 F#fighter{anti_heal =
                               util:check_min(AntiHeal + Val, 0)};
             anger when Type =:= 1 ->
                 Anger = F#fighter.anger,
                 NewAnger = util:check_range(Anger + Val, 0, 100),
                 F#fighter{anger = NewAnger};
             anger when Type =:= 0 ->
                 NewAnger = util:check_range(Val, 0, 100),
                 F#fighter{anger = NewAnger};
             attr -> F#fighter{attr = Val};
             atk_speed when Type =:= 1 ->
                 Attr = #attr{atk_speed = AtkSpeed} = F#fighter.attr,
                 F#fighter{attr =
                               Attr#attr{atk_speed =
                                             util:check_min(AtkSpeed + Val,
                                                            0)}};
             atk_speed when Type =:= 3 ->
                 Attr = #attr{atk_speed = AtkSpeed} = F#fighter.attr,
                 F#fighter{attr =
                               Attr#attr{atk_speed =
                                             util:check_min(round(AtkSpeed *
                                                                      (1 +
                                                                           Val /
                                                                               1000)),
                                                            0)}};
             speed when Type =:= 1 ->
                 Attr = #attr{speed = Speed} = F#fighter.attr,
                 F#fighter{attr =
                               Attr#attr{speed =
                                             util:check_min(Speed + Val, 0)}};
             speed when Type =:= 3 ->
                 Attr = #attr{speed = Speed} = F#fighter.attr,
                 F#fighter{attr =
                               Attr#attr{speed =
                                             util:check_min(round(Speed *
                                                                      (1 +
                                                                           Val /
                                                                               1000)),
                                                            0)}};
             phy_dmg when Type =:= 1 ->
                 Attr = #attr{phy_dmg = PhyDmg} = F#fighter.attr,
                 F#fighter{attr =
                               Attr#attr{phy_dmg =
                                             util:check_min(PhyDmg + Val, 0)}};
             phy_dmg when Type =:= 3 ->
                 Attr = #attr{phy_dmg = PhyDmg} = F#fighter.attr,
                 F#fighter{attr =
                               Attr#attr{phy_dmg =
                                             util:check_min(round(PhyDmg *
                                                                      (1 +
                                                                           Val /
                                                                               1000)),
                                                            0)}};
             magic_dmg when Type =:= 1 ->
                 Attr = #attr{magic_dmg = MagicDmg} = F#fighter.attr,
                 F#fighter{attr =
                               Attr#attr{magic_dmg =
                                             util:check_min(MagicDmg + Val,
                                                            0)}};
             magic_dmg when Type =:= 3 ->
                 Attr = #attr{magic_dmg = MagicDmg} = F#fighter.attr,
                 F#fighter{attr =
                               Attr#attr{magic_dmg =
                                             util:check_min(round(MagicDmg *
                                                                      (1 +
                                                                           Val /
                                                                               1000)),
                                                            0)}};
             phy_def when Type =:= 1 ->
                 Attr = #attr{phy_def = Phydef} = F#fighter.attr,
                 F#fighter{attr =
                               Attr#attr{phy_def =
                                             util:check_min(Phydef + Val, 0)}};
             phy_def when Type =:= 3 ->
                 Attr = #attr{phy_def = Phydef} = F#fighter.attr,
                 F#fighter{attr =
                               Attr#attr{phy_def =
                                             util:check_min(round(Phydef *
                                                                      (1 +
                                                                           Val /
                                                                               1000)),
                                                            0)}};
             magic_def when Type =:= 1 ->
                 Attr = #attr{magic_def = Magicdef} = F#fighter.attr,
                 F#fighter{attr =
                               Attr#attr{magic_def =
                                             util:check_min(Magicdef + Val,
                                                            0)}};
             magic_def when Type =:= 3 ->
                 Attr = #attr{magic_def = Magicdef} = F#fighter.attr,
                 F#fighter{attr =
                               Attr#attr{magic_def =
                                             util:check_min(round(Magicdef *
                                                                      (1 +
                                                                           Val /
                                                                               1000)),
                                                            0)}};
             crit when Type =:= 1 ->
                 Attr = #attr{crit = Crit} = F#fighter.attr,
                 F#fighter{attr =
                               Attr#attr{crit = util:check_min(Crit + Val, 0)}};
             phy_crit when Type =:= 1 ->
                 Attr = #attr{phy_crit = Crit} = F#fighter.attr,
                 F#fighter{attr =
                               Attr#attr{phy_crit =
                                             util:check_min(Crit + Val, 0)}};
             magic_crit when Type =:= 1 ->
                 Attr = #attr{magic_crit = Crit} = F#fighter.attr,
                 F#fighter{attr =
                               Attr#attr{magic_crit =
                                             util:check_min(Crit + Val, 0)}};
             tenacity when Type =:= 1 ->
                 Attr = #attr{tenacity = Ten} = F#fighter.attr,
                 F#fighter{attr =
                               Attr#attr{tenacity =
                                             util:check_min(Ten + Val, 0)}};
             phy_tenacity when Type =:= 1 ->
                 Attr = #attr{phy_tenacity = Ten} = F#fighter.attr,
                 F#fighter{attr =
                               Attr#attr{phy_tenacity =
                                             util:check_min(Ten + Val, 0)}};
             magic_tenacity when Type =:= 1 ->
                 Attr = #attr{magic_tenacity = Ten} = F#fighter.attr,
                 F#fighter{attr =
                               Attr#attr{magic_tenacity =
                                             util:check_min(Ten + Val, 0)}};
             def_ratio when Type =:= 1 ->
                 Attr = #attr{def_ratio = DefRatio} = F#fighter.attr,
                 F#fighter{attr =
                               Attr#attr{def_ratio =
                                             util:check_min(DefRatio + Val,
                                                            0)}};
             phy_def_ratio when Type =:= 1 ->
                 Attr = #attr{phy_def_ratio = PhyDefRatio} =
                            F#fighter.attr,
                 F#fighter{attr =
                               Attr#attr{phy_def_ratio =
                                             util:check_min(PhyDefRatio + Val,
                                                            0)}};
             magic_def_ratio when Type =:= 1 ->
                 Attr = #attr{magic_def_ratio = MagicDefRatio} =
                            F#fighter.attr,
                 F#fighter{attr =
                               Attr#attr{magic_def_ratio =
                                             util:check_min(MagicDefRatio + Val,
                                                            0)}};
             accuracy when Type =:= 1 ->
                 Attr = #attr{accuracy = Acc} = F#fighter.attr,
                 F#fighter{attr =
                               Attr#attr{accuracy =
                                             util:check_min(Acc + Val, 0)}};
             phy_accuracy when Type =:= 1 ->
                 Attr = #attr{phy_accuracy = Acc} = F#fighter.attr,
                 F#fighter{attr =
                               Attr#attr{phy_accuracy =
                                             util:check_min(Acc + Val, 0)}};
             magic_accuracy when Type =:= 1 ->
                 Attr = #attr{magic_accuracy = Acc} = F#fighter.attr,
                 F#fighter{attr =
                               Attr#attr{magic_accuracy =
                                             util:check_min(Acc + Val, 0)}};
             evasion when Type =:= 1 ->
                 Attr = #attr{evasion = Eva} = F#fighter.attr,
                 F#fighter{attr =
                               Attr#attr{evasion =
                                             util:check_min(Eva + Val, 0)}};
             phy_evasion when Type =:= 1 ->
                 Attr = #attr{phy_evasion = Eva} = F#fighter.attr,
                 F#fighter{attr =
                               Attr#attr{phy_evasion =
                                             util:check_min(Eva + Val, 0)}};
             magic_evasion when Type =:= 1 ->
                 Attr = #attr{magic_evasion = Eva} = F#fighter.attr,
                 F#fighter{attr =
                               Attr#attr{magic_evasion =
                                             util:check_min(Eva + Val, 0)}};
             enhance_control when Type =:= 1 ->
                 Attr = #attr{enhance_control = EnhanceControl} =
                            F#fighter.attr,
                 F#fighter{attr =
                               Attr#attr{enhance_control =
                                             util:check_min(EnhanceControl +
                                                                Val,
                                                            0)}};
             enhance_control when Type =:= 3 ->
                 Attr = #attr{enhance_control = EnhanceControl} =
                            F#fighter.attr,
                 F#fighter{attr =
                               Attr#attr{evasion =
                                             util:check_min(round(EnhanceControl
                                                                      *
                                                                      (1 +
                                                                           Val /
                                                                               1000)),
                                                            0)}};
             anti_control when Type =:= 1 ->
                 Attr = #attr{anti_control = AntiControl} =
                            F#fighter.attr,
                 F#fighter{attr =
                               Attr#attr{anti_control =
                                             util:check_min(AntiControl + Val,
                                                            0)}};
             anti_control when Type =:= 3 ->
                 Attr = #attr{anti_control = AntiControl} =
                            F#fighter.attr,
                 F#fighter{attr =
                               Attr#attr{evasion =
                                             util:check_min(round(AntiControl *
                                                                      (1 +
                                                                           Val /
                                                                               1000)),
                                                            0)}};
             combat_init_attr -> F#fighter{combat_init_attr = Val};
             i_hit_ratio ->
                 CombatInitAttr = #combat_init_attr{hit_ratio =
                                                        HitRatio} =
                                      F#fighter.combat_init_attr,
                 F#fighter{combat_init_attr =
                               CombatInitAttr#combat_init_attr{hit_ratio =
                                                                   HitRatio +
                                                                       Val}};
             i_sworn_protect ->
                 CombatInitAttr = F#fighter.combat_init_attr,
                 F#fighter{combat_init_attr =
                               CombatInitAttr#combat_init_attr{sworn_protect =
                                                                   Val}};
             i_add_chaos_ratio when Type =:= 1 ->
                 CombatInitAttr = #combat_init_attr{add_chaos_ratio =
                                                        AddChaosRatio} =
                                      F#fighter.combat_init_attr,
                 F#fighter{combat_init_attr =
                               CombatInitAttr#combat_init_attr{add_chaos_ratio =
                                                                   AddChaosRatio
                                                                       + Val}};
             i_item_effect_ratio when Type =:= 1 ->
                 CombatInitAttr = #combat_init_attr{item_effect_ratio =
                                                        ItemEffectRatio} =
                                      F#fighter.combat_init_attr,
                 F#fighter{combat_init_attr =
                               CombatInitAttr#combat_init_attr{item_effect_ratio
                                                                   =
                                                                   ItemEffectRatio
                                                                       + Val}};
             i_eff_item_effect_ratio when Type =:= 1 ->
                 CombatInitAttr = #combat_init_attr{eff_item_effect_ratio
                                                        = EffItemEffectRatio} =
                                      F#fighter.combat_init_attr,
                 F#fighter{combat_init_attr =
                               CombatInitAttr#combat_init_attr{eff_item_effect_ratio
                                                                   =
                                                                   EffItemEffectRatio
                                                                       + Val}};
             i_anti_poison when Type =:= 1 ->
                 CombatInitAttr = #combat_init_attr{anti_poison =
                                                        AntiPoison} =
                                      F#fighter.combat_init_attr,
                 F#fighter{combat_init_attr =
                               CombatInitAttr#combat_init_attr{anti_poison =
                                                                   AntiPoison +
                                                                       Val}};
             i_phy_dmg_raito when Type =:= 1 ->
                 CombatInitAttr = #combat_init_attr{phy_dmg_ratio =
                                                        PhyDmgRatio} =
                                      F#fighter.combat_init_attr,
                 F#fighter{combat_init_attr =
                               CombatInitAttr#combat_init_attr{phy_dmg_ratio =
                                                                   PhyDmgRatio +
                                                                       Val}};
             i_magic_dmg_raito when Type =:= 1 ->
                 CombatInitAttr = #combat_init_attr{magic_dmg_ratio =
                                                        MagicDmgRatio} =
                                      F#fighter.combat_init_attr,
                 F#fighter{combat_init_attr =
                               CombatInitAttr#combat_init_attr{magic_dmg_ratio =
                                                                   MagicDmgRatio
                                                                       + Val}};
             i_can_be_crit when Type =:= 0 ->
                 CombatInitAttr = F#fighter.combat_init_attr,
                 F#fighter{combat_init_attr =
                               CombatInitAttr#combat_init_attr{can_be_crit =
                                                                   Val}};
             i_hurt_ratio when Type =:= 0 ->
                 CombatInitAttr = F#fighter.combat_init_attr,
                 F#fighter{combat_init_attr =
                               CombatInitAttr#combat_init_attr{hurt_ratio =
                                                                   Val}};
             i_hurt_ratio when Type =:= 1 ->
                 CombatInitAttr = #combat_init_attr{hurt_ratio =
                                                        HurtRatio} =
                                      F#fighter.combat_init_attr,
                 F#fighter{combat_init_attr =
                               CombatInitAttr#combat_init_attr{hurt_ratio =
                                                                   HurtRatio +
                                                                       Val}};
             i_magic_hurt_ratio when Type =:= 1 ->
                 CombatInitAttr = #combat_init_attr{magic_hurt_ratio =
                                                        HurtRatio} =
                                      F#fighter.combat_init_attr,
                 F#fighter{combat_init_attr =
                               CombatInitAttr#combat_init_attr{magic_hurt_ratio
                                                                   =
                                                                   HurtRatio +
                                                                       Val}};
             i_dmg_ratio when Type =:= 0 ->
                 CombatInitAttr = F#fighter.combat_init_attr,
                 F#fighter{combat_init_attr =
                               CombatInitAttr#combat_init_attr{dmg_ratio =
                                                                   Val}};
             i_dmg_ratio when Type =:= 1 ->
                 CombatInitAttr = #combat_init_attr{dmg_ratio =
                                                        DmgRatio} =
                                      F#fighter.combat_init_attr,
                 F#fighter{combat_init_attr =
                               CombatInitAttr#combat_init_attr{dmg_ratio =
                                                                   DmgRatio +
                                                                       Val}};
             i_heal_ratio when Type =:= 0 ->
                 CombatInitAttr = F#fighter.combat_init_attr,
                 F#fighter{combat_init_attr =
                               CombatInitAttr#combat_init_attr{heal_ratio =
                                                                   Val}};
             i_heal_ratio when Type =:= 1 ->
                 CombatInitAttr = #combat_init_attr{heal_ratio =
                                                        HealRatio} =
                                      F#fighter.combat_init_attr,
                 F#fighter{combat_init_attr =
                               CombatInitAttr#combat_init_attr{heal_ratio =
                                                                   HealRatio +
                                                                       Val}};
             i_eff_heal_ratio when Type =:= 0 ->
                 CombatInitAttr = F#fighter.combat_init_attr,
                 F#fighter{combat_init_attr =
                               CombatInitAttr#combat_init_attr{eff_heal_ratio =
                                                                   Val}};
             i_eff_heal_ratio when Type =:= 1 ->
                 CombatInitAttr = #combat_init_attr{eff_heal_ratio =
                                                        EffHealRatio} =
                                      F#fighter.combat_init_attr,
                 F#fighter{combat_init_attr =
                               CombatInitAttr#combat_init_attr{eff_heal_ratio =
                                                                   EffHealRatio
                                                                       + Val}};
             i_crit_hurt_ratio when Type =:= 0 ->
                 CombatInitAttr = F#fighter.combat_init_attr,
                 F#fighter{combat_init_attr =
                               CombatInitAttr#combat_init_attr{crit_hurt_ratio =
                                                                   Val}};
             i_crit_hurt_ratio when Type =:= 1 ->
                 CombatInitAttr = #combat_init_attr{crit_hurt_ratio =
                                                        CritHurtRatio} =
                                      F#fighter.combat_init_attr,
                 F#fighter{combat_init_attr =
                               CombatInitAttr#combat_init_attr{crit_hurt_ratio =
                                                                   CritHurtRatio
                                                                       + Val}};
             i_crit_dmg_ratio when Type =:= 0 ->
                 CombatInitAttr = F#fighter.combat_init_attr,
                 F#fighter{combat_init_attr =
                               CombatInitAttr#combat_init_attr{crit_dmg_ratio =
                                                                   Val}};
             i_crit_dmg_ratio when Type =:= 1 ->
                 CombatInitAttr = #combat_init_attr{crit_dmg_ratio =
                                                        CritDmgRatio} =
                                      F#fighter.combat_init_attr,
                 F#fighter{combat_init_attr =
                               CombatInitAttr#combat_init_attr{crit_dmg_ratio =
                                                                   CritDmgRatio
                                                                       + Val}};
             i_debuff_buff_expire_ratio ->
                 CombatInitAttr = F#fighter.combat_init_attr,
                 F#fighter{combat_init_attr =
                               CombatInitAttr#combat_init_attr{debuff_buff_expire_ratio
                                                                   = Val}};
             i_dec_ghost_ratio when Type =:= 1 ->
                 CombatInitAttr = #combat_init_attr{dec_ghost_ratio =
                                                        DecGhostRatio} =
                                      F#fighter.combat_init_attr,
                 F#fighter{combat_init_attr =
                               CombatInitAttr#combat_init_attr{dec_ghost_ratio =
                                                                   DecGhostRatio
                                                                       + Val}};
             i_heal_crit_ratio when Type =:= 1 ->
                 CombatInitAttr = #combat_init_attr{heal_crit_ratio =
                                                        HealCritRatio} =
                                      F#fighter.combat_init_attr,
                 F#fighter{combat_init_attr =
                               CombatInitAttr#combat_init_attr{heal_crit_ratio =
                                                                   HealCritRatio
                                                                       + Val}};
             i_eff_revive_ratio when Type =:= 1 ->
                 CombatInitAttr = #combat_init_attr{eff_revive_ratio =
                                                        EffReviceRatio} =
                                      F#fighter.combat_init_attr,
                 F#fighter{combat_init_attr =
                               CombatInitAttr#combat_init_attr{eff_revive_ratio
                                                                   =
                                                                   EffReviceRatio
                                                                       + Val}};
             i_eff_heal_val when Type =:= 1 ->
                 CombatInitAttr = #combat_init_attr{eff_heal_val =
                                                        EffHealVal} =
                                      F#fighter.combat_init_attr,
                 F#fighter{combat_init_attr =
                               CombatInitAttr#combat_init_attr{eff_heal_val =
                                                                   EffHealVal +
                                                                       Val}};
             i_anti_crit_ratio ->
                 CombatInitAttr = F#fighter.combat_init_attr,
                 F#fighter{combat_init_attr =
                               CombatInitAttr#combat_init_attr{anti_crit_ratio =
                                                                   Val}};
             i_atk_not_anger ->
                 CombatInitAttr = F#fighter.combat_init_attr,
                 F#fighter{combat_init_attr =
                               CombatInitAttr#combat_init_attr{atk_not_anger =
                                                                   Val}};
             def_anger_ratio when Type =:= 1 ->
                 CombatInitAttr = #combat_init_attr{def_anger_ratio =
                                                        DefAngerRatio} =
                                      F#fighter.combat_init_attr,
                 F#fighter{combat_init_attr =
                               CombatInitAttr#combat_init_attr{def_anger_ratio =
                                                                   DefAngerRatio
                                                                       + Val}};
             use_anger_ratio when Type =:= 1 ->
                 CombatInitAttr = #combat_init_attr{use_anger_ratio =
                                                        UseAngerRatio} =
                                      F#fighter.combat_init_attr,
                 F#fighter{combat_init_attr =
                               CombatInitAttr#combat_init_attr{use_anger_ratio =
                                                                   UseAngerRatio
                                                                       + Val}};
             ext ->
                 case Val of
                     {ExtKey, ExtVal} ->
                         OldExt = F#fighter.ext,
                         NewExt = lists:keystore(ExtKey,
                                                 1,
                                                 OldExt,
                                                 {ExtKey, ExtVal}),
                         F#fighter{ext = NewExt};
                     _ -> F
                 end;
             phy_crit_extra_dmg ->
                 logger:debug("增加暴击附加伤害:~w", [Val], combat_cache, 638),
                 CombatInitAttr = F#fighter.combat_init_attr,
                 NewCombatInitAttr =
                     CombatInitAttr#combat_init_attr{phy_crit_extra_dmg =
                                                         Val},
                 F#fighter{combat_init_attr = NewCombatInitAttr};
             mag_crit_extra_dmg ->
                 logger:debug("增加暴击附加伤害:~w", [Val], combat_cache, 643),
                 CombatInitAttr = #combat_init_attr{mag_crit_extra_dmg =
                                                        CritExtraDmg} =
                                      F#fighter.combat_init_attr,
                 NewCombatInitAttr =
                     CombatInitAttr#combat_init_attr{mag_crit_extra_dmg =
                                                         CritExtraDmg + Val},
                 F#fighter{combat_init_attr = NewCombatInitAttr};
             combat_dynamic_attr ->
                 F#fighter{combat_dynamic_attr = Val};
             d_eff_heal_val when Type =:= 1 ->
                 CombatDynamicAttr = #combat_dynamic_attr{eff_heal_val =
                                                              EffHealVal} =
                                         F#fighter.combat_dynamic_attr,
                 F#fighter{combat_dynamic_attr =
                               CombatDynamicAttr#combat_dynamic_attr{eff_heal_val
                                                                         =
                                                                         EffHealVal
                                                                             +
                                                                             Val}};
             d_accuracy when Type =:= 1 ->
                 CombatDynamicAttr = #combat_dynamic_attr{accuracy =
                                                              Accuracy} =
                                         F#fighter.combat_dynamic_attr,
                 F#fighter{combat_dynamic_attr =
                               CombatDynamicAttr#combat_dynamic_attr{accuracy =
                                                                         Accuracy
                                                                             +
                                                                             Val}};
             d_phy_accuracy when Type =:= 1 ->
                 CombatDynamicAttr = #combat_dynamic_attr{phy_accuracy =
                                                              PhyAccuracy} =
                                         F#fighter.combat_dynamic_attr,
                 F#fighter{combat_dynamic_attr =
                               CombatDynamicAttr#combat_dynamic_attr{phy_accuracy
                                                                         =
                                                                         PhyAccuracy
                                                                             +
                                                                             Val}};
             d_magic_accuracy when Type =:= 1 ->
                 CombatDynamicAttr = #combat_dynamic_attr{magic_accuracy
                                                              = MagicAccuracy} =
                                         F#fighter.combat_dynamic_attr,
                 F#fighter{combat_dynamic_attr =
                               CombatDynamicAttr#combat_dynamic_attr{magic_accuracy
                                                                         =
                                                                         MagicAccuracy
                                                                             +
                                                                             Val}};
             d_evasion when Type =:= 1 ->
                 CombatDynamicAttr = #combat_dynamic_attr{evasion =
                                                              Evasion} =
                                         F#fighter.combat_dynamic_attr,
                 F#fighter{combat_dynamic_attr =
                               CombatDynamicAttr#combat_dynamic_attr{evasion =
                                                                         Evasion
                                                                             +
                                                                             Val}};
             d_phy_evasion when Type =:= 1 ->
                 CombatDynamicAttr = #combat_dynamic_attr{phy_evasion =
                                                              PhyEvasion} =
                                         F#fighter.combat_dynamic_attr,
                 F#fighter{combat_dynamic_attr =
                               CombatDynamicAttr#combat_dynamic_attr{phy_evasion
                                                                         =
                                                                         PhyEvasion
                                                                             +
                                                                             Val}};
             d_magic_evasion when Type =:= 1 ->
                 CombatDynamicAttr = #combat_dynamic_attr{magic_evasion =
                                                              MagicEvasion} =
                                         F#fighter.combat_dynamic_attr,
                 F#fighter{combat_dynamic_attr =
                               CombatDynamicAttr#combat_dynamic_attr{magic_evasion
                                                                         =
                                                                         MagicEvasion
                                                                             +
                                                                             Val}};
             d_buff_reduce_dmg_max ->
                 CombatDynamicAttr = F#fighter.combat_dynamic_attr,
                 F#fighter{combat_dynamic_attr =
                               CombatDynamicAttr#combat_dynamic_attr{buff_reduce_dmg_max
                                                                         =
                                                                         Val}};
             d_buff_reduce_dmg when Type =:= 0 ->
                 CombatDynamicAttr = #combat_dynamic_attr{buff_reduce_dmg
                                                              = ReduceDmg,
                                                          buff_reduce_dmg_max =
                                                              BuffReduceDmgMax} =
                                         F#fighter.combat_dynamic_attr,
                 NewReduceDmg = if ReduceDmg =< 0 andalso Val < 0 ->
                                       min(ReduceDmg, Val);
                                   ReduceDmg >= 0 andalso Val < 0 ->
                                       ReduceDmg + Val;
                                   ReduceDmg =< 0 andalso Val > 0 ->
                                       ReduceDmg + Val;
                                   ReduceDmg >= 0 andalso Val > 0 ->
                                       max(ReduceDmg, Val);
                                   true -> min(ReduceDmg, Val)
                                end,
                 logger:debug("==========:~w",
                              [BuffReduceDmgMax],
                              combat_cache,
                              687),
                 NewReduceDmg1 = case BuffReduceDmgMax =/= 0 of
                                     true ->
                                         max(NewReduceDmg, BuffReduceDmgMax);
                                     _ -> NewReduceDmg
                                 end,
                 F#fighter{combat_dynamic_attr =
                               CombatDynamicAttr#combat_dynamic_attr{buff_reduce_dmg
                                                                         =
                                                                         NewReduceDmg1}};
             d_reduce_dmg when Type =:= 1 ->
                 CombatDynamicAttr = #combat_dynamic_attr{reduce_dmg =
                                                              ReduceDmg} =
                                         F#fighter.combat_dynamic_attr,
                 F#fighter{combat_dynamic_attr =
                               CombatDynamicAttr#combat_dynamic_attr{reduce_dmg
                                                                         =
                                                                         ReduceDmg
                                                                             +
                                                                             Val}};
             d_stone_reduce_dmg when Type =:= 1 ->
                 CombatDynamicAttr =
                     #combat_dynamic_attr{stone_reduce_dmg = ReduceDmg} =
                         F#fighter.combat_dynamic_attr,
                 F#fighter{combat_dynamic_attr =
                               CombatDynamicAttr#combat_dynamic_attr{stone_reduce_dmg
                                                                         =
                                                                         ReduceDmg
                                                                             +
                                                                             Val}};
             d_phy_dmg_raito when Type =:= 1 ->
                 CombatDynamicAttr = #combat_dynamic_attr{phy_dmg_ratio =
                                                              PhyDmgRatio} =
                                         F#fighter.combat_dynamic_attr,
                 F#fighter{combat_dynamic_attr =
                               CombatDynamicAttr#combat_dynamic_attr{phy_dmg_ratio
                                                                         =
                                                                         PhyDmgRatio
                                                                             +
                                                                             Val}};
             d_magic_dmg_raito when Type =:= 1 ->
                 CombatDynamicAttr = #combat_dynamic_attr{magic_dmg_ratio
                                                              = MagicDmgRatio} =
                                         F#fighter.combat_dynamic_attr,
                 F#fighter{combat_dynamic_attr =
                               CombatDynamicAttr#combat_dynamic_attr{magic_dmg_ratio
                                                                         =
                                                                         MagicDmgRatio
                                                                             +
                                                                             Val}};
             d_feedback ->
                 CombatDynamicAttr = F#fighter.combat_dynamic_attr,
                 F#fighter{combat_dynamic_attr =
                               CombatDynamicAttr#combat_dynamic_attr{feedback =
                                                                         Val}};
             d_mirror_feedback ->
                 CombatDynamicAttr = F#fighter.combat_dynamic_attr,
                 F#fighter{combat_dynamic_attr =
                               CombatDynamicAttr#combat_dynamic_attr{mirror_feedback_rate
                                                                         =
                                                                         Val}};
             d_hurt_ratio when Type =:= 0 ->
                 CombatDynamicAttr = F#fighter.combat_dynamic_attr,
                 F#fighter{combat_dynamic_attr =
                               CombatDynamicAttr#combat_dynamic_attr{hurt_ratio
                                                                         =
                                                                         Val}};
             d_hurt_ratio when Type =:= 1 ->
                 CombatDynamicAttr = #combat_dynamic_attr{hurt_ratio =
                                                              HurtRatio} =
                                         F#fighter.combat_dynamic_attr,
                 F#fighter{combat_dynamic_attr =
                               CombatDynamicAttr#combat_dynamic_attr{hurt_ratio
                                                                         =
                                                                         HurtRatio
                                                                             +
                                                                             Val}};
             d_phy_hurt_ratio when Type =:= 0 ->
                 CombatDynamicAttr = F#fighter.combat_dynamic_attr,
                 F#fighter{combat_dynamic_attr =
                               CombatDynamicAttr#combat_dynamic_attr{phy_hurt_ratio
                                                                         =
                                                                         Val}};
             d_phy_hurt_ratio when Type =:= 1 ->
                 CombatDynamicAttr = #combat_dynamic_attr{phy_hurt_ratio
                                                              = HurtRatio} =
                                         F#fighter.combat_dynamic_attr,
                 F#fighter{combat_dynamic_attr =
                               CombatDynamicAttr#combat_dynamic_attr{phy_hurt_ratio
                                                                         =
                                                                         HurtRatio
                                                                             +
                                                                             Val}};
             d_magic_hurt_ratio when Type =:= 0 ->
                 CombatDynamicAttr = F#fighter.combat_dynamic_attr,
                 F#fighter{combat_dynamic_attr =
                               CombatDynamicAttr#combat_dynamic_attr{magic_hurt_ratio
                                                                         =
                                                                         Val}};
             d_magic_hurt_ratio when Type =:= 1 ->
                 CombatDynamicAttr =
                     #combat_dynamic_attr{magic_hurt_ratio = HurtRatio} =
                         F#fighter.combat_dynamic_attr,
                 F#fighter{combat_dynamic_attr =
                               CombatDynamicAttr#combat_dynamic_attr{magic_hurt_ratio
                                                                         =
                                                                         HurtRatio
                                                                             +
                                                                             Val}};
             d_phy_final_hurt_ratio when Type =:= 0 ->
                 CombatDynamicAttr = F#fighter.combat_dynamic_attr,
                 F#fighter{combat_dynamic_attr =
                               CombatDynamicAttr#combat_dynamic_attr{phy_final_hurt_ratio
                                                                         =
                                                                         Val}};
             d_phy_final_hurt_ratio when Type =:= 1 ->
                 CombatDynamicAttr =
                     #combat_dynamic_attr{phy_final_hurt_ratio = HurtRatio} =
                         F#fighter.combat_dynamic_attr,
                 F#fighter{combat_dynamic_attr =
                               CombatDynamicAttr#combat_dynamic_attr{phy_final_hurt_ratio
                                                                         =
                                                                         HurtRatio
                                                                             +
                                                                             Val}};
             d_magic_final_hurt_ratio when Type =:= 0 ->
                 CombatDynamicAttr = F#fighter.combat_dynamic_attr,
                 F#fighter{combat_dynamic_attr =
                               CombatDynamicAttr#combat_dynamic_attr{magic_final_hurt_ratio
                                                                         =
                                                                         Val}};
             d_magic_final_hurt_ratio when Type =:= 1 ->
                 CombatDynamicAttr =
                     #combat_dynamic_attr{magic_final_hurt_ratio =
                                              HurtRatio} =
                         F#fighter.combat_dynamic_attr,
                 F#fighter{combat_dynamic_attr =
                               CombatDynamicAttr#combat_dynamic_attr{magic_final_hurt_ratio
                                                                         =
                                                                         HurtRatio
                                                                             +
                                                                             Val}};
             d_dmg_ratio when Type =:= 0 ->
                 CombatDynamicAttr = F#fighter.combat_dynamic_attr,
                 F#fighter{combat_dynamic_attr =
                               CombatDynamicAttr#combat_dynamic_attr{dmg_ratio =
                                                                         Val}};
             d_dmg_ratio when Type =:= 1 ->
                 CombatDynamicAttr = #combat_dynamic_attr{dmg_ratio =
                                                              DmgRatio} =
                                         F#fighter.combat_dynamic_attr,
                 F#fighter{combat_dynamic_attr =
                               CombatDynamicAttr#combat_dynamic_attr{dmg_ratio =
                                                                         DmgRatio
                                                                             +
                                                                             Val}};
             d_phy_dmg_ratio when Type =:= 0 ->
                 CombatDynamicAttr = F#fighter.combat_dynamic_attr,
                 F#fighter{combat_dynamic_attr =
                               CombatDynamicAttr#combat_dynamic_attr{phy_dmg_ratio
                                                                         =
                                                                         Val}};
             d_phy_dmg_ratio when Type =:= 1 ->
                 CombatDynamicAttr = #combat_dynamic_attr{phy_dmg_ratio =
                                                              DmgRatio} =
                                         F#fighter.combat_dynamic_attr,
                 F#fighter{combat_dynamic_attr =
                               CombatDynamicAttr#combat_dynamic_attr{phy_dmg_ratio
                                                                         =
                                                                         DmgRatio
                                                                             +
                                                                             Val}};
             d_magic_dmg_ratio when Type =:= 0 ->
                 CombatDynamicAttr = F#fighter.combat_dynamic_attr,
                 F#fighter{combat_dynamic_attr =
                               CombatDynamicAttr#combat_dynamic_attr{magic_dmg_ratio
                                                                         =
                                                                         Val}};
             d_magic_dmg_ratio when Type =:= 1 ->
                 CombatDynamicAttr = #combat_dynamic_attr{magic_dmg_ratio
                                                              = DmgRatio} =
                                         F#fighter.combat_dynamic_attr,
                 F#fighter{combat_dynamic_attr =
                               CombatDynamicAttr#combat_dynamic_attr{magic_dmg_ratio
                                                                         =
                                                                         DmgRatio
                                                                             +
                                                                             Val}};
             d_heal_ratio when Type =:= 0 ->
                 CombatDynamicAttr = F#fighter.combat_dynamic_attr,
                 F#fighter{combat_dynamic_attr =
                               CombatDynamicAttr#combat_dynamic_attr{heal_ratio
                                                                         =
                                                                         Val}};
             d_heal_ratio when Type =:= 1 ->
                 CombatDynamicAttr = #combat_dynamic_attr{heal_ratio =
                                                              HealRatio} =
                                         F#fighter.combat_dynamic_attr,
                 F#fighter{combat_dynamic_attr =
                               CombatDynamicAttr#combat_dynamic_attr{heal_ratio
                                                                         =
                                                                         HealRatio
                                                                             +
                                                                             Val}};
             d_eff_heal_ratio when Type =:= 0 ->
                 CombatDynamicAttr = F#fighter.combat_dynamic_attr,
                 F#fighter{combat_dynamic_attr =
                               CombatDynamicAttr#combat_dynamic_attr{eff_heal_ratio
                                                                         =
                                                                         Val}};
             d_eff_heal_ratio when Type =:= 1 ->
                 CombatDynamicAttr = #combat_dynamic_attr{eff_heal_ratio
                                                              = EffHealRatio} =
                                         F#fighter.combat_dynamic_attr,
                 F#fighter{combat_dynamic_attr =
                               CombatDynamicAttr#combat_dynamic_attr{eff_heal_ratio
                                                                         =
                                                                         EffHealRatio
                                                                             +
                                                                             Val}};
             d_crit_hurt_ratio when Type =:= 0 ->
                 CombatDynamicAttr = F#fighter.combat_dynamic_attr,
                 F#fighter{combat_dynamic_attr =
                               CombatDynamicAttr#combat_dynamic_attr{crit_hurt_ratio
                                                                         =
                                                                         Val}};
             d_crit_hurt_ratio when Type =:= 1 ->
                 CombatDynamicAttr = #combat_dynamic_attr{crit_hurt_ratio
                                                              = CritHurtRatio} =
                                         F#fighter.combat_dynamic_attr,
                 F#fighter{combat_dynamic_attr =
                               CombatDynamicAttr#combat_dynamic_attr{crit_hurt_ratio
                                                                         =
                                                                         CritHurtRatio
                                                                             +
                                                                             Val}};
             d_crit_dmg_ratio when Type =:= 0 ->
                 CombatDynamicAttr = F#fighter.combat_dynamic_attr,
                 F#fighter{combat_dynamic_attr =
                               CombatDynamicAttr#combat_dynamic_attr{crit_dmg_ratio
                                                                         =
                                                                         Val}};
             d_crit_dmg_ratio when Type =:= 1 ->
                 CombatDynamicAttr = #combat_dynamic_attr{crit_dmg_ratio
                                                              = CritDmgRatio} =
                                         F#fighter.combat_dynamic_attr,
                 F#fighter{combat_dynamic_attr =
                               CombatDynamicAttr#combat_dynamic_attr{crit_dmg_ratio
                                                                         =
                                                                         CritDmgRatio
                                                                             +
                                                                             Val}};
             last_skill -> F#fighter{last_skill = Val};
             fighter_ext_args when is_list(Val) ->
                 F#fighter{ext_args = Val};
             fighter_ext_args_snow_def when Type =:= 0 ->
                 ExtArgs = F#fighter.ext_args,
                 NewExtArgs = set_ext_val(ExtArgs, 2, Val),
                 F#fighter{ext_args = NewExtArgs};
             fighter_ext_args_snow_def when Type =:= 1 ->
                 ExtArgs = F#fighter.ext_args,
                 OldVal = get_ext_val(F, 2, 0),
                 NewExtArgs = set_ext_val(ExtArgs, 2, OldVal + Val),
                 F#fighter{ext_args = NewExtArgs};
             fighter_ext_wing_power when Type =:= 1 ->
                 ExtArgs = F#fighter.ext_args,
                 OldVal = get_ext_val(F, 8, 0),
                 NewExtArgs = set_ext_val(ExtArgs,
                                          8,
                                          max(OldVal + Val, 0)),
                 F#fighter{ext_args = NewExtArgs};
             fighter_ext_sq_point when Type =:= 1 ->
                 ExtArgs = F#fighter.ext_args,
                 OldVal = get_ext_val(F, 9, 0),
                 NewExtArgs = set_ext_val(ExtArgs,
                                          9,
                                          max(OldVal + Val, 0)),
                 F#fighter{ext_args = NewExtArgs};
             special_attr when is_record(Val, special_attr) ->
                 F#fighter{special_attr = Val};
             dec_dmg ->
                 SpecialAttr = F#fighter.special_attr,
                 F#fighter{special_attr =
                               SpecialAttr#special_attr{dec_dmg = Val}};
             multi_atk_num ->
                 SpecialAttr = F#fighter.special_attr,
                 F#fighter{special_attr =
                               SpecialAttr#special_attr{multi_atk_num = Val}};
             has_multi_atk ->
                 SpecialAttr = F#fighter.special_attr,
                 F#fighter{special_attr =
                               SpecialAttr#special_attr{has_multi_atk = Val}};
             round_add_magic_dmg ->
                 SpecialAttr = #special_attr{round_add_magic_dmg =
                                                 RoundAddMagicDmg} =
                                   F#fighter.special_attr,
                 F#fighter{special_attr =
                               SpecialAttr#special_attr{round_add_magic_dmg =
                                                            RoundAddMagicDmg +
                                                                Val}};
             round_hurt ->
                 SpecialAttr = #special_attr{round_hurt = RoundHurt} =
                                   F#fighter.special_attr,
                 F#fighter{special_attr =
                               SpecialAttr#special_attr{round_hurt =
                                                            RoundHurt + Val}};
             chaos_ratio when Type =:= 1 ->
                 SpecialAttr = #special_attr{chaos_ratio = ChaosRatio} =
                                   F#fighter.special_attr,
                 F#fighter{special_attr =
                               SpecialAttr#special_attr{chaos_ratio =
                                                            ChaosRatio + Val}};
             chaos_ratio when Type =:= 0 ->
                 SpecialAttr = F#fighter.special_attr,
                 F#fighter{special_attr =
                               SpecialAttr#special_attr{chaos_ratio = Val}};
             control_num when Type =:= 1 ->
                 SpecialAttr = #special_attr{control_num = ControlNum} =
                                   F#fighter.special_attr,
                 F#fighter{special_attr =
                               SpecialAttr#special_attr{control_num =
                                                            ControlNum + Val}};
             save_life_times ->
                 SpecialAttr = F#fighter.special_attr,
                 F#fighter{special_attr =
                               SpecialAttr#special_attr{save_life_times = Val}};
             iron_body_times ->
                 SpecialAttr = F#fighter.special_attr,
                 F#fighter{special_attr =
                               SpecialAttr#special_attr{iron_body_times = Val}};
             elem_dmg_absorb when Type =:= 1 ->
                 SpecialAttr = #special_attr{elem_dmg_absorb = OldVal} =
                                   F#fighter.special_attr,
                 logger:debug("~ts设置的值:~w",
                              [F#fighter.name, OldVal + Val],
                              combat_cache,
                              848),
                 F#fighter{special_attr =
                               SpecialAttr#special_attr{elem_dmg_absorb =
                                                            OldVal + Val}};
             elem_dmg_absorb ->
                 SpecialAttr = F#fighter.special_attr,
                 F#fighter{special_attr =
                               SpecialAttr#special_attr{elem_dmg_absorb = Val}};
             anti_trial ->
                 SpecialAttr = F#fighter.special_attr,
                 F#fighter{special_attr =
                               SpecialAttr#special_attr{anti_trial = Val}};
             add_phy_layer when Type =:= 1 ->
                 SpecialAttr = #special_attr{add_phy_layer =
                                                 AddPhyLayer} =
                                   F#fighter.special_attr,
                 F#fighter{special_attr =
                               SpecialAttr#special_attr{add_phy_layer =
                                                            AddPhyLayer + Val}};
             immunity ->
                 SpecialAttr = F#fighter.special_attr,
                 F#fighter{special_attr =
                               SpecialAttr#special_attr{immunity = Val}};
             has_immunity ->
                 SpecialAttr = F#fighter.special_attr,
                 F#fighter{special_attr =
                               SpecialAttr#special_attr{has_immunity = Val}};
             protector ->
                 SpecialAttr = #special_attr{protector = OldProtector} =
                                   F#fighter.special_attr,
                 NewProtector = case Val of
                                    {ProId, ProNum, ProRatio} ->
                                        {ProId, ProNum, ProRatio};
                                    del ->
                                        case OldProtector of
                                            {ProId, ProNum, ProRatio} ->
                                                case ProNum - 1 =< 0 of
                                                    true -> undefined;
                                                    false ->
                                                        {ProId,
                                                         ProNum - 1,
                                                         ProRatio - 250}
                                                end;
                                            _ -> undefined
                                        end;
                                    _ -> undefined
                                end,
                 F#fighter{special_attr =
                               SpecialAttr#special_attr{protector =
                                                            NewProtector}};
             can_feedback ->
                 SpecialAttr = F#fighter.special_attr,
                 F#fighter{special_attr =
                               SpecialAttr#special_attr{can_feedback = Val}};
             fixed_feedback ->
                 SpecialAttr = F#fighter.special_attr,
                 F#fighter{special_attr =
                               SpecialAttr#special_attr{fixed_feedback = Val}};
             suck_hp when Type =:= 1 ->
                 SpecialAttr = #special_attr{suck_hp = SuckHp} =
                                   F#fighter.special_attr,
                 NewSpecialAttr = SpecialAttr#special_attr{suck_hp =
                                                               SuckHp + Val},
                 F#fighter{special_attr = NewSpecialAttr};
             suck_hp when Type =:= 0 ->
                 SpecialAttr = F#fighter.special_attr,
                 F#fighter{special_attr =
                               SpecialAttr#special_attr{suck_hp = Val}};
             suck_times when Type =:= 1 ->
                 SpecialAttr = #special_attr{suck_times = SuckTimes} =
                                   F#fighter.special_attr,
                 NewSpecialAttr = SpecialAttr#special_attr{suck_times =
                                                               SuckTimes + Val},
                 F#fighter{special_attr = NewSpecialAttr};
             suck_times when Type =:= 0 ->
                 SpecialAttr = F#fighter.special_attr,
                 F#fighter{special_attr =
                               SpecialAttr#special_attr{suck_times = Val}};
             flush_pet_times when Type =:= 1 ->
                 SpecialAttr = #special_attr{flush_pet_times =
                                                 FlushPetTimes} =
                                   F#fighter.special_attr,
                 F#fighter{special_attr =
                               SpecialAttr#special_attr{flush_pet_times =
                                                            FlushPetTimes +
                                                                Val}};
             flush_pet_times when Type =:= 0 ->
                 SpecialAttr = F#fighter.special_attr,
                 F#fighter{special_attr =
                               SpecialAttr#special_attr{flush_pet_times = Val}};
             is_sworn_protect ->
                 SpecialAttr = F#fighter.special_attr,
                 F#fighter{special_attr =
                               SpecialAttr#special_attr{is_sworn_protect =
                                                            Val}};
             is_sworn_heal ->
                 SpecialAttr = F#fighter.special_attr,
                 F#fighter{special_attr =
                               SpecialAttr#special_attr{is_sworn_heal = Val}};
             sleep_layer ->
                 SpecialAttr = F#fighter.special_attr,
                 F#fighter{special_attr =
                               SpecialAttr#special_attr{sleep_layer = Val}};
             stone_layer ->
                 SpecialAttr = F#fighter.special_attr,
                 F#fighter{special_attr =
                               SpecialAttr#special_attr{stone_layer = Val}};
             can_anti_attack ->
                 SpecialAttr = F#fighter.special_attr,
                 F#fighter{special_attr =
                               SpecialAttr#special_attr{can_anti_attack = Val}};
             can_attack_stealth ->
                 SpecialAttr = F#fighter.special_attr,
                 F#fighter{special_attr =
                               SpecialAttr#special_attr{can_attack_stealth =
                                                            Val}};
             fixed_dmg ->
                 SpecialAttr = F#fighter.special_attr,
                 F#fighter{special_attr =
                               SpecialAttr#special_attr{fixed_dmg = Val}};
             has_nirvana ->
                 SpecialAttr = F#fighter.special_attr,
                 F#fighter{special_attr =
                               SpecialAttr#special_attr{has_nirvana = Val}};
             nirvaning ->
                 SpecialAttr = F#fighter.special_attr,
                 F#fighter{special_attr =
                               SpecialAttr#special_attr{nirvaning = Val}};
             has_ghost ->
                 SpecialAttr = F#fighter.special_attr,
                 F#fighter{special_attr =
                               SpecialAttr#special_attr{has_ghost = Val}};
             has_fearless ->
                 SpecialAttr = F#fighter.special_attr,
                 F#fighter{special_attr =
                               SpecialAttr#special_attr{has_fearless = Val}};
             ghosting ->
                 SpecialAttr = F#fighter.special_attr,
                 F#fighter{special_attr =
                               SpecialAttr#special_attr{ghosting = Val}};
             reviving ->
                 SpecialAttr = F#fighter.special_attr,
                 F#fighter{special_attr =
                               SpecialAttr#special_attr{reviving = Val}};
             has_revive_self ->
                 SpecialAttr = F#fighter.special_attr,
                 F#fighter{special_attr =
                               SpecialAttr#special_attr{has_revive_self = Val}};
             model_id ->
                 SpecialAttr = F#fighter.special_attr,
                 F#fighter{special_attr =
                               SpecialAttr#special_attr{model_id = Val}};
             model_val ->
                 SpecialAttr = F#fighter.special_attr,
                 F#fighter{special_attr =
                               SpecialAttr#special_attr{model_val = Val}};
             model_order ->
                 SpecialAttr = F#fighter.special_attr,
                 F#fighter{special_attr =
                               SpecialAttr#special_attr{model_order = Val}};
             absorb_dmg when Type =:= 0 ->
                 SpecialAttr = F#fighter.special_attr,
                 F#fighter{special_attr =
                               SpecialAttr#special_attr{absorb_dmg = Val}};
             absorb_dmg when Type =:= 1 ->
                 SpecialAttr = #special_attr{absorb_dmg = AbsorbDmg} =
                                   F#fighter.special_attr,
                 F#fighter{special_attr =
                               SpecialAttr#special_attr{absorb_dmg =
                                                            util:check_min(AbsorbDmg
                                                                               +
                                                                               Val,
                                                                           0)}};
             magic_absorb_dmg when Type =:= 0 ->
                 SpecialAttr = F#fighter.special_attr,
                 F#fighter{special_attr =
                               SpecialAttr#special_attr{magic_absorb_dmg =
                                                            Val}};
             magic_absorb_dmg when Type =:= 1 ->
                 logger:debug("增加护盾吸收值:~w", [Val], combat_cache, 969),
                 SpecialAttr = #special_attr{magic_absorb_dmg =
                                                 MagAbsorbDmg} =
                                   F#fighter.special_attr,
                 F#fighter{special_attr =
                               SpecialAttr#special_attr{magic_absorb_dmg =
                                                            util:check_min(MagAbsorbDmg
                                                                               +
                                                                               Val,
                                                                           0)}};
             absorb_order ->
                 SpecialAttr = F#fighter.special_attr,
                 F#fighter{special_attr =
                               SpecialAttr#special_attr{absorb_order = Val}};
             absorb_shield ->
                 SpecialAttr = F#fighter.special_attr,
                 F#fighter{special_attr =
                               SpecialAttr#special_attr{absorb_shield = Val}};
             absorb_shield_suck ->
                 SpecialAttr = F#fighter.special_attr,
                 F#fighter{special_attr =
                               SpecialAttr#special_attr{absorb_shield_suck =
                                                            Val}};
             absorb_shield_type ->
                 SpecialAttr = F#fighter.special_attr,
                 F#fighter{special_attr =
                               SpecialAttr#special_attr{absorb_shield_type =
                                                            Val}};
             rebound_times ->
                 SpecialAttr = F#fighter.special_attr,
                 F#fighter{special_attr =
                               SpecialAttr#special_attr{rebound_times = Val}};
             rebound_dmg_ratio ->
                 SpecialAttr = F#fighter.special_attr,
                 F#fighter{special_attr =
                               SpecialAttr#special_attr{rebound_dmg_ratio =
                                                            Val}};
             rebound_type ->
                 SpecialAttr = F#fighter.special_attr,
                 F#fighter{special_attr =
                               SpecialAttr#special_attr{rebound_type = Val}};
             trap_owener ->
                 SpecialAttr = F#fighter.special_attr,
                 F#fighter{special_attr =
                               SpecialAttr#special_attr{trap_owener = Val}};
             trap_buff ->
                 SpecialAttr = F#fighter.special_attr,
                 F#fighter{special_attr =
                               SpecialAttr#special_attr{trap_buff = Val}};
             trap_ratio ->
                 SpecialAttr = F#fighter.special_attr,
                 F#fighter{special_attr =
                               SpecialAttr#special_attr{trap_ratio = Val}};
             pre_action ->
                 SpecialAttr = F#fighter.special_attr,
                 F#fighter{special_attr =
                               SpecialAttr#special_attr{pre_action = Val}};
             next_action_stay ->
                 SpecialAttr = F#fighter.special_attr,
                 F#fighter{special_attr =
                               SpecialAttr#special_attr{next_action_stay =
                                                            Val}};
             reduce_phy_dmg when Type =:= 0 ->
                 SpecialAttr = F#fighter.special_attr,
                 F#fighter{special_attr =
                               SpecialAttr#special_attr{reduce_phy_dmg = Val}};
             reduce_phy_dmg when Type =:= 1 ->
                 SpecialAttr = #special_attr{reduce_phy_dmg =
                                                 ReducePhyDmg} =
                                   F#fighter.special_attr,
                 F#fighter{special_attr =
                               SpecialAttr#special_attr{reduce_phy_dmg =
                                                            util:check_min(ReducePhyDmg
                                                                               +
                                                                               Val,
                                                                           0)}};
             reduce_self_phy_dmg when Type =:= 0 ->
                 SpecialAttr = F#fighter.special_attr,
                 F#fighter{special_attr =
                               SpecialAttr#special_attr{reduce_self_phy_dmg =
                                                            Val}};
             reduce_self_phy_dmg when Type =:= 1 ->
                 SpecialAttr = #special_attr{reduce_self_phy_dmg =
                                                 ReduceSelfPhyDmg} =
                                   F#fighter.special_attr,
                 F#fighter{special_attr =
                               SpecialAttr#special_attr{reduce_self_phy_dmg =
                                                            util:check_min(ReduceSelfPhyDmg
                                                                               +
                                                                               Val,
                                                                           0)}};
             anti_control_ratio when Type =:= 0 ->
                 SpecialAttr = F#fighter.special_attr,
                 F#fighter{special_attr =
                               SpecialAttr#special_attr{anti_control_ratio =
                                                            Val}};
             anti_control_ratio when Type =:= 1 ->
                 SpecialAttr = #special_attr{anti_control_ratio =
                                                 AntiControl} =
                                   F#fighter.special_attr,
                 F#fighter{special_attr =
                               SpecialAttr#special_attr{anti_control_ratio =
                                                            util:check_min(AntiControl
                                                                               +
                                                                               Val,
                                                                           0)}};
             anti_ratio when Type =:= 0 ->
                 SpecialAttr = F#fighter.special_attr,
                 F#fighter{special_attr =
                               SpecialAttr#special_attr{anti_ratio = Val}};
             anti_ratio when Type =:= 1 ->
                 SpecialAttr = #special_attr{anti_ratio = AntiRatio} =
                                   F#fighter.special_attr,
                 F#fighter{special_attr =
                               SpecialAttr#special_attr{anti_ratio =
                                                            util:check_min(AntiRatio
                                                                               +
                                                                               Val,
                                                                           0)}};
             anti_dmg_ratio when Type =:= 1 ->
                 SpecialAttr = #special_attr{anti_dmg_ratio =
                                                 AntiDmgRatio} =
                                   F#fighter.special_attr,
                 F#fighter{special_attr =
                               SpecialAttr#special_attr{anti_dmg_ratio =
                                                            util:check_min(AntiDmgRatio
                                                                               +
                                                                               Val,
                                                                           0)}};
             anti_skill ->
                 SpecialAttr = F#fighter.special_attr,
                 F#fighter{special_attr =
                               SpecialAttr#special_attr{anti_skill = Val}};
             last_dispel_phy_dmg_ratio when Type =:= 0 ->
                 SpecialAttr = F#fighter.special_attr,
                 F#fighter{special_attr =
                               SpecialAttr#special_attr{last_dispel_phy_dmg_ratio
                                                            = Val}};
             last_eva_phy_dmg_ratio when Type =:= 0 ->
                 SpecialAttr = F#fighter.special_attr,
                 F#fighter{special_attr =
                               SpecialAttr#special_attr{last_eva_phy_dmg_ratio =
                                                            Val}};
             first_target_id when Type =:= 0 ->
                 SpecialAttr = F#fighter.special_attr,
                 F#fighter{special_attr =
                               SpecialAttr#special_attr{first_target_id = Val}};
             hp_link ->
                 SpecialAttr = F#fighter.special_attr,
                 F#fighter{special_attr =
                               SpecialAttr#special_attr{hp_link = Val}};
             catched ->
                 Catched = F#fighter.catched,
                 F#fighter{catched = [Val | Catched]};
             active_pet -> F#fighter{active_pet = Val};
             backup_pets -> F#fighter{backup_pets = Val};
             active_child -> F#fighter{active_child = Val};
             backup_childs -> F#fighter{backup_childs = Val};
             is_die_disappear -> F#fighter{is_die_disappear = Val};
             skill_cooldown -> F#fighter{skill_cooldown = Val};
             combat_talk -> F#fighter{combat_talk = Val};
             special_status when is_record(Val, special_status) ->
                 F#fighter{special_status = Val};
             buff_revive_self ->
                 SpecialStatus = F#fighter.special_status,
                 F#fighter{special_status =
                               SpecialStatus#special_status{buff_revive_self =
                                                                Val}};
             can_use_anger_skill ->
                 SpecialStatus = F#fighter.special_status,
                 F#fighter{special_status =
                               SpecialStatus#special_status{can_use_anger_skill
                                                                = Val}};
             lover_revive_self ->
                 SpecialAttr = F#fighter.special_status,
                 F#fighter{special_status =
                               SpecialAttr#special_status{lover_revive_self =
                                                              Val}};
             is_seal ->
                 SpecialStatus = F#fighter.special_status,
                 F#fighter{special_status =
                               SpecialStatus#special_status{is_seal = Val}};
             is_stun ->
                 SpecialStatus = F#fighter.special_status,
                 F#fighter{special_status =
                               SpecialStatus#special_status{is_stun = Val}};
             is_tempt ->
                 SpecialStatus = F#fighter.special_status,
                 F#fighter{special_status =
                               SpecialStatus#special_status{is_tempt = Val}};
             tempt_ratio ->
                 SpecialStatus = F#fighter.special_status,
                 F#fighter{special_status =
                               SpecialStatus#special_status{tempt_ratio = Val}};
             tempt_dmg ->
                 SpecialStatus = F#fighter.special_status,
                 F#fighter{special_status =
                               SpecialStatus#special_status{tempt_dmg = Val}};
             is_sleep ->
                 SpecialStatus = F#fighter.special_status,
                 F#fighter{special_status =
                               SpecialStatus#special_status{is_sleep = Val}};
             is_stone ->
                 SpecialStatus = F#fighter.special_status,
                 F#fighter{special_status =
                               SpecialStatus#special_status{is_stone = Val}};
             is_anti_heal ->
                 SpecialStatus = F#fighter.special_status,
                 F#fighter{special_status =
                               SpecialStatus#special_status{is_anti_heal =
                                                                Val}};
             is_silent ->
                 SpecialStatus = F#fighter.special_status,
                 F#fighter{special_status =
                               SpecialStatus#special_status{is_silent = Val}};
             is_weakness ->
                 SpecialStatus = F#fighter.special_status,
                 F#fighter{special_status =
                               SpecialStatus#special_status{is_weakness = Val}};
             is_rest ->
                 SpecialStatus = F#fighter.special_status,
                 F#fighter{special_status =
                               SpecialStatus#special_status{is_rest = Val}};
             is_taunt ->
                 SpecialStatus = F#fighter.special_status,
                 F#fighter{special_status =
                               SpecialStatus#special_status{is_taunt = Val}};
             is_stealth ->
                 SpecialStatus = F#fighter.special_status,
                 F#fighter{special_status =
                               SpecialStatus#special_status{is_stealth = Val}};
             is_chaos ->
                 SpecialStatus = F#fighter.special_status,
                 F#fighter{special_status =
                               SpecialStatus#special_status{is_chaos = Val}};
             chaos_skill ->
                 SpecialStatus = F#fighter.special_status,
                 F#fighter{special_status =
                               SpecialStatus#special_status{chaos_skill = Val}};
             dec_taunt_dmg_ratio when Type =:= 1 ->
                 SpecialStatus = #special_status{dec_taunt_dmg_ratio =
                                                     DecTauntDmgRatio} =
                                     F#fighter.special_status,
                 F#fighter{special_status =
                               SpecialStatus#special_status{dec_taunt_dmg_ratio
                                                                =
                                                                DecTauntDmgRatio
                                                                    + Val}};
             cannot_use_skill ->
                 SpecialStatus = F#fighter.special_status,
                 F#fighter{special_status =
                               SpecialStatus#special_status{cannot_use_skill =
                                                                Val}};
             cannot_revive ->
                 SpecialStatus = F#fighter.special_status,
                 F#fighter{special_status =
                               SpecialStatus#special_status{cannot_revive =
                                                                Val}};
             taunt_pid ->
                 SpecialStatus = F#fighter.special_status,
                 F#fighter{special_status =
                               SpecialStatus#special_status{taunt_pid = Val}};
             soul_link ->
                 SpecialStatus = F#fighter.special_status,
                 F#fighter{special_status =
                               SpecialStatus#special_status{soul_link = Val}};
             can_crit ->
                 SpecialStatus = F#fighter.special_status,
                 F#fighter{special_status =
                               SpecialStatus#special_status{can_crit = Val}};
             bleed when Type =:= 1 ->
                 SpecialStatus = #special_status{bleed = Bleed} =
                                     F#fighter.special_status,
                 F#fighter{special_status =
                               SpecialStatus#special_status{bleed =
                                                                Bleed + Val}};
             bleed when Type =:= 0 ->
                 SpecialStatus = F#fighter.special_status,
                 F#fighter{special_status =
                               SpecialStatus#special_status{bleed = Val}};
             energy when Type =:= 1 ->
                 SpecialStatus = #special_status{energy = Energy} =
                                     F#fighter.special_status,
                 F#fighter{special_status =
                               SpecialStatus#special_status{energy =
                                                                Energy + Val}};
             energy when Type =:= 0 ->
                 SpecialStatus = F#fighter.special_status,
                 F#fighter{special_status =
                               SpecialStatus#special_status{energy = Val}};
             assist_atk_ratio ->
                 SpecialAttr = F#fighter.special_attr,
                 F#fighter{special_attr =
                               SpecialAttr#special_attr{assist_atk_ratio =
                                                            Val}};
             assist_atk_hurt_ratio ->
                 SpecialAttr = F#fighter.special_attr,
                 F#fighter{special_attr =
                               SpecialAttr#special_attr{assist_atk_hurt_ratio =
                                                            Val}};
             wheel_dmg ->
                 SpecialAttr = F#fighter.special_attr,
                 F#fighter{special_attr =
                               SpecialAttr#special_attr{wheel_dmg = Val}};
             wheel_skill ->
                 SpecialAttr = F#fighter.special_attr,
                 F#fighter{special_attr =
                               SpecialAttr#special_attr{wheel_skill = Val}};
             be_attack_skills ->
                 SpecialStatus = F#fighter.special_status,
                 F#fighter{special_status =
                               SpecialStatus#special_status{be_attack_skills =
                                                                Val}};
             _ ->
                 logger:error("暂不支持的属性修改:Key=~w, Type=~w, Val=~w",
                              [Key, Type, Val],
                              combat_cache,
                              1178),
                 F
         end,
    do_u(NF, T, Flag).

