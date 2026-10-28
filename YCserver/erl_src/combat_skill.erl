-file("src/mod/combat/combat_skill.erl", 1).

-module(combat_skill).

-export([get_default_skill/1,
         get_basic_skills/4,
         base_skill/1,
         get_skills_from_ai/2,
         get_plot_skills/1,
         modify_by_talent/2,
         modify_by_talent/3,
         can_use_skill/3,
         is_multi_skill/1,
         is_multi_skill/2,
         can_pursue_attack/1,
         can_revive/1,
         get_dmg_ratio/2,
         is_illegal_auto_skill/1,
         limit_skill/1,
         is_skill_in_cooldown/2,
         add_skill_cooldown/2,
         add_skill_cooldown/3,
         add_skill_cooldown/4,
         get_skill_cooldown_info/1,
         load_pre_cooldown/1,
         get_summon_skill_cooldown_info/1,
         skill_cooldown_reduce/1,
         skill_check/2,
         skill_check/3,
         skill_check/4,
         choose_pre_skill/5,
         choose_skill/5,
         choose_pet_skill/5,
         auto_action/1,
         validate_skill/2,
         validate_skill/4,
         validate_target/3,
         merge_buff/2,
         get_target_by_skill/2,
         passive_to_variety_skill/3,
         variety_atk_skill/1,
         get_wing_power_by_combat_type/0,
         get_sq_point_by_combat_type/0,
         pet_choose_pre_skill/5,
         get_hipe_skill/2]).

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

-file("src/mod/combat/combat_skill.erl", 54).

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

-file("src/mod/combat/combat_skill.erl", 55).

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

-file("src/mod/combat/combat_skill.erl", 56).

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

-file("src/mod/combat/combat_skill.erl", 57).

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

-file("src/mod/combat/combat_skill.erl", 58).

-file("inc/ai.hrl", 1).

-record(ai_rule,
        {id :: undefined | non_neg_integer(),
         lev :: undefined | non_neg_integer(),
         type = 0 :: non_neg_integer(),
         repeat = 0,
         prob,
         condition = [],
         action = []}).

-file("src/mod/combat/combat_skill.erl", 59).

choose_pre_skill(Pid, SkillId, TargetId, OtherId,
                 #combat{}) ->
    case combat_cache:f(by_pid, Pid) of
        Atk = #fighter{id = Fid, is_escape = 0, is_auto = 0,
                       pre_action = undefined, action = undefined} ->
            case can_choose_target(Atk, TargetId) of
                {false, Reason} ->
                    Data = {0, Reason},
                    combat:pack_10771(Pid, Data),
                    false;
                {true, Dfd = #fighter{}} ->
                    case choose_skill_check(SkillId, Atk, Dfd, OtherId) of
                        {false, Reason} ->
                            Data = {0, Reason},
                            combat:pack_10771(Pid, Data),
                            false;
                        {true,
                         Skill = #c_skill{skill =
                                              #skill{type = 4,
                                                     lev = SkillLev}}} ->
                            logger:debug("悬着技能成功:~w",
                                         [{Skill, TargetId}],
                                         combat_skill,
                                         80),
                            NewAtk = variety_skill(Atk#fighter{pre_action =
                                                                   {Skill,
                                                                    TargetId}}),
                            combat_cache:u(NewAtk),
                            Data = {Fid, 1, TargetId, SkillId, SkillLev},
                            combat:pack_10733(Pid, Data),
                            true;
                        _ ->
                            Data = {0, lang:get("该技能不是预先出手技能，无法使用")},
                            combat:pack_10771(Pid, Data),
                            false
                    end
            end;
        #fighter{} ->
            Data = {0, lang:get("已经选择过技能")},
            combat:pack_10771(Pid, Data),
            false;
        _ -> false
    end.

pet_choose_pre_skill(Pid, SkillId, TargetId, OtherId,
                     #combat{}) ->
    case combat_cache:f(by_master_pid, Pid) of
        Atk = #fighter{id = Fid, is_escape = 0, is_auto = 0,
                       pre_action = undefined, action = undefined} ->
            case can_choose_target(Atk, TargetId) of
                {false, Reason} ->
                    Data = {0, Reason},
                    combat:pack_10773(Pid, Data),
                    false;
                {true, Dfd = #fighter{}} ->
                    case choose_skill_check(SkillId, Atk, Dfd, OtherId) of
                        {false, Reason} ->
                            Data = {0, Reason},
                            combat:pack_10773(Pid, Data),
                            false;
                        {true,
                         Skill = #c_skill{skill =
                                              #skill{type = 4,
                                                     lev = SkillLev}}} ->
                            logger:debug("悬着技能成功:~w",
                                         [{Skill, TargetId}],
                                         combat_skill,
                                         118),
                            NewAtk = variety_skill(Atk#fighter{pre_action =
                                                                   {Skill,
                                                                    TargetId}}),
                            combat_cache:u(NewAtk),
                            Data = {Fid, 1, TargetId, SkillId, SkillLev},
                            combat:pack_10733(Pid, Data),
                            true;
                        _ ->
                            Data = {0, lang:get("该技能不是预先出手技能，无法使用")},
                            combat:pack_10773(Pid, Data),
                            false
                    end
            end;
        #fighter{} ->
            Data = {0, lang:get("已经选择过技能")},
            combat:pack_10773(Pid, Data),
            false;
        _ -> false
    end.

choose_skill(Pid, SkillId, TargetId, OtherId,
             #combat{observers = Observers}) ->
    case combat_cache:f(by_pid, Pid) of
        Atk = #fighter{id = Fid, is_escape = 0, group = Group,
                       name = _Name, is_auto = 0,
                       special_attr =
                           #special_attr{pre_action = _PreAction}} ->
            case can_choose_target(Atk, TargetId) of
                {false, Reason} ->
                    combat:pack_10732(Pid, 0, Reason),
                    false;
                {true, Dfd = #fighter{}} ->
                    case choose_skill_check(SkillId, Atk, Dfd, OtherId) of
                        {false, Reason} ->
                            combat:pack_10732(Pid, 0, Reason),
                            false;
                        {true,
                         Skill = #c_skill{lev = SkillLev,
                                          skill = #skill{type = 0}}} ->
                            VarietyAtk = variety_skill(Atk#fighter{action =
                                                                       {Skill,
                                                                        TargetId},
                                                                   is_auto =
                                                                       0}),
                            cast_choose_skill(Group,
                                              {Fid,
                                               SkillId,
                                               SkillLev,
                                               TargetId}),
                            combat:pack_10733_ob(Observers, Fid, 1),
                            ok,
                            NewAtk = VarietyAtk#fighter{hook_index = 1},
                            combat_cache:u(NewAtk),
                            true;
                        _ ->
                            combat:pack_10732(Pid,
                                              0,
                                              lang:get("该技能不是主动技能，无法使用")),
                            false
                    end
            end;
        _ -> false
    end.

choose_pet_skill(Pid, SkillId, TargetId, OtherId,
                 #combat{observers = Observers}) ->
    case combat_cache:f(by_master_pid, Pid) of
        Atk = #fighter{type = Type, id = Fid, is_escape = 0,
                       group = Group, name = _Name, is_auto = 0,
                       special_attr = #special_attr{pre_action = _PreAction}}
            when Type =:= 3 orelse Type =:= 6 ->
            case can_choose_target(Atk, TargetId) of
                {false, Reason} ->
                    combat:pack_10732(Pid, 0, Reason),
                    false;
                {true, Dfd = #fighter{}} ->
                    case choose_skill_check(SkillId, Atk, Dfd, OtherId) of
                        {false, Reason} ->
                            combat:pack_10732(Pid, 0, Reason),
                            false;
                        {true, Skill = #c_skill{lev = SkillLev}} ->
                            NewAtk = variety_skill(Atk#fighter{action =
                                                                   {Skill,
                                                                    TargetId},
                                                               is_auto = 0}),
                            cast_choose_skill(Group,
                                              {Fid,
                                               SkillId,
                                               SkillLev,
                                               TargetId}),
                            combat:pack_10733_ob(Observers, Fid, 1),
                            ok,
                            combat_cache:u(NewAtk),
                            true
                    end
            end;
        _ -> false
    end.

cast_choose_skill(Group,
                  {Fid, SkillId, SkillLev, TargetId}) ->
    Data1 = {Fid, 1, TargetId, SkillId, SkillLev},
    Data2 = {Fid, 1, 0, 0, 0},
    lists:foreach(fun (#fighter{type = 1, pid = Pid})
                          when is_pid(Pid) ->
                          combat:pack_10733(Pid, Data1);
                      (_) -> ignore
                  end,
                  combat_cache:all(Group)),
    lists:foreach(fun (#fighter{type = 1, pid = Pid})
                          when is_pid(Pid) ->
                          combat:pack_10733(Pid, Data2);
                      (_) -> ignore
                  end,
                  combat_cache:all(combat_cache:op(Group))),
    ok.

can_choose_target(#fighter{id = Sid, group = Sgroup,
                           special_attr =
                               #special_attr{can_attack_stealth = CanAttack}},
                  TargetId)
    when TargetId > 0 ->
    case combat_cache:f(by_id, TargetId) of
        #fighter{id = Tid, group = Tgroup,
                 special_status = #special_status{is_stealth = 1}}
            when Sid =/= Tid andalso
                     Sgroup =/= Tgroup andalso CanAttack =:= 0 ->
            {false, lang:get("不能选择隐身目标")};
        #fighter{is_escape = 1} ->
            {false, lang:get("不能选择逃走目标")};
        Dfd = #fighter{id = TargetId} -> {true, Dfd};
        _ -> {false, lang:get("要选择的目标不存在")}
    end;
can_choose_target(_, _) ->
    {false, lang:get("要选择的目标不存在")}.

get_can_max_use_item() ->
    CombatType = get(combat_type),
    case CombatType of
        43 -> 3;
        60 -> 3;
        _ -> 10
    end.

choose_skill_check(Skill, Self, Target, OtherId) ->
    CheckSeq = [skill_exist,
                item,
                cooldown,
                snow,
                target_type,
                self_status,
                self_special,
                target_status,
                summon_exists,
                halo_exists,
                defence_check],
    do_skill_check(CheckSeq,
                   true,
                   Skill,
                   Self,
                   Target,
                   OtherId).

skill_check(Skill, Self) ->
    skill_check(Skill, Self, undefined, 0).

skill_check(Skill, Self, OtherId) ->
    skill_check(Skill, Self, undefined, OtherId).

skill_check(Skill, Self, Target, OtherId) ->
    CheckSeq = [skill_exist,
                item,
                cooldown,
                snow,
                self_cond,
                mp,
                anger,
                target_type,
                self_status,
                self_special,
                target_status,
                summon_exists,
                halo_exists,
                defence_check],
    do_skill_check(CheckSeq,
                   true,
                   Skill,
                   Self,
                   Target,
                   OtherId).

do_skill_check([], Result, _, _, _, _) -> Result;
do_skill_check([skill_exist | T], true,
               Skill = #c_skill{id = SkillId},
               Self = #fighter{active_skills = ActiveSkills,
                               type = SelfType},
               Target, OtherId) ->
    case lists:keymember(SkillId, #c_skill.id, ActiveSkills)
        of
        false -> {false, lang:get("当前战斗类型不能选择此技能")};
        _ ->
            case SkillId of
                1004 ->
                    NewSkill = Skill#c_skill{ext_args =
                                                 [{item_id, OtherId}]},
                    do_skill_check(T,
                                   {true, NewSkill},
                                   NewSkill,
                                   Self,
                                   Target,
                                   OtherId);
                1006 when SelfType =:= 1 ->
                    case pet:can_catch(Self, Target) of
                        {true, _} ->
                            do_skill_check(T,
                                           {true, Skill},
                                           Skill,
                                           Self,
                                           Target,
                                           OtherId);
                        {false, Reason} -> {false, Reason}
                    end;
                1008 when SelfType =:= 1 ->
                    NewSkill = Skill#c_skill{ext_args =
                                                 [{pet_id, OtherId}]},
                    do_skill_check(T,
                                   {true, NewSkill},
                                   NewSkill,
                                   Self,
                                   Target,
                                   OtherId);
                1009 when SelfType =:= 1 ->
                    NewSkill = Skill#c_skill{ext_args =
                                                 [{child_id, OtherId}]},
                    do_skill_check(T,
                                   {true, NewSkill},
                                   NewSkill,
                                   Self,
                                   Target,
                                   OtherId);
                1006 -> {false, lang:get("不可选择该技能")};
                1008 -> {false, lang:get("不可选择该技能")};
                1009 -> {false, lang:get("不可选择该技能")};
                _ ->
                    do_skill_check(T,
                                   {true, Skill},
                                   Skill,
                                   Self,
                                   Target,
                                   OtherId)
            end
    end;
do_skill_check([skill_exist | T], true, SkillId,
               Self = #fighter{type = SelfType,
                               active_skills = ActiveSkills,
                               has_summon_pet = HasSummonPet},
               Target, OtherId) ->
    case lists:keyfind(SkillId, #c_skill.id, ActiveSkills)
        of
        false -> {false, lang:get("当前战斗类型不能选择此技能")};
        Skill ->
            case SkillId of
                1004 ->
                    NewSkill = Skill#c_skill{ext_args =
                                                 [{item_id, OtherId}]},
                    do_skill_check(T,
                                   {true, NewSkill},
                                   NewSkill,
                                   Self,
                                   Target,
                                   OtherId);
                1006 when SelfType =:= 1 ->
                    case pet:can_catch(Self, Target) of
                        {true, _} ->
                            do_skill_check(T,
                                           {true, Skill},
                                           Skill,
                                           Self,
                                           Target,
                                           OtherId);
                        {false, Reason} -> {false, Reason}
                    end;
                1008 when SelfType =:= 1 ->
                    case HasSummonPet >= 4 of
                        true -> {false, lang:get("该场战斗召唤宠物已达上限")};
                        false ->
                            NewSkill = Skill#c_skill{ext_args =
                                                         [{pet_id, OtherId}]},
                            do_skill_check(T,
                                           {true, NewSkill},
                                           NewSkill,
                                           Self,
                                           Target,
                                           OtherId)
                    end;
                1009 when SelfType =:= 1 ->
                    case HasSummonPet >= 4 of
                        true -> {false, lang:get("该场战斗召唤宠物已达上限")};
                        false ->
                            NewSkill = Skill#c_skill{ext_args =
                                                         [{child_id, OtherId}]},
                            do_skill_check(T,
                                           {true, NewSkill},
                                           NewSkill,
                                           Self,
                                           Target,
                                           OtherId)
                    end;
                1006 -> {false, lang:get("不可选择该技能")};
                1008 -> {false, lang:get("不可选择该技能")};
                _ ->
                    do_skill_check(T,
                                   {true, Skill},
                                   Skill,
                                   Self,
                                   Target,
                                   OtherId)
            end
    end;
do_skill_check([item | T], {true, Skill},
               Skill = #c_skill{id = 1004, skill = S,
                                ext_args = [{item_id, ItemId}]},
               Self = #fighter{pid = Pid, type = SelfType,
                               master_fid = MasterFid,
                               has_use_item = SHasUseItem},
               Target, OtherId) ->
    Flag = case SelfType of
               3 ->
                   case combat_cache:f(by_id, MasterFid) of
                       #fighter{pid = RolePid, has_use_item = HasUseItem} ->
                           {true, {RolePid, HasUseItem}};
                       _ -> {false, lang:get("无法找到角色")}
                   end;
               6 ->
                   case combat_cache:f(by_id, MasterFid) of
                       #fighter{pid = RolePid, has_use_item = HasUseItem} ->
                           {true, {RolePid, HasUseItem}};
                       _ -> {false, lang:get("无法找到角色")}
                   end;
               _ -> {true, {Pid, SHasUseItem}}
           end,
    MaxCanUseItem = get_can_max_use_item(),
    case Flag of
        {false, Reason} -> {false, Reason};
        {true, {_CheckPid, UsedItem}}
            when UsedItem >= MaxCanUseItem ->
            {false, lang:get("该场战斗使用物品已达上限")};
        {true, {CheckPid, _}} ->
            Context = combat_cache:get_context(),
            CombatType = case Context of
                             #combat_context{type = TmpType} -> TmpType;
                             _ -> 0
                         end,
            case role:apply(sync,
                            CheckPid,
                            {combat_script_item,
                             has_item,
                             [ItemId, CombatType]})
                of
                {true, Citem = #c_item{script_id = 40007}} ->
                    case SelfType of
                        1 ->
                            Skill1 = Skill#c_skill{skill =
                                                       S#skill{target_type = 2},
                                                   ext_args =
                                                       [{item_id, Citem}]},
                            do_skill_check(T,
                                           {true, Skill1},
                                           Skill1,
                                           Self,
                                           Target,
                                           OtherId);
                        _ -> {false, lang:get("宠物无法使用怒气道具")}
                    end;
                {true, Citem} ->
                    Skill1 = Skill#c_skill{ext_args = [{item_id, Citem}]},
                    do_skill_check(T,
                                   {true, Skill1},
                                   Skill1,
                                   Self,
                                   Target,
                                   OtherId);
                {false, Reason} -> {false, Reason};
                _Err -> {false, lang:get("不能使用该物品")}
            end
    end;
do_skill_check([item | T], {true, Skill}, Skill, Self,
               Target, OtherId) ->
    do_skill_check(T,
                   {true, Skill},
                   Skill,
                   Self,
                   Target,
                   OtherId);
do_skill_check([cooldown | T], {true, Skill}, Skill,
               Self = #fighter{id = Sid}, Target, OtherId) ->
    case is_skill_in_cooldown(Sid, Skill) of
        true -> {false, lang:get("技能冷却中, 请选择其他技能")};
        _ ->
            do_skill_check(T,
                           {true, Skill},
                           Skill,
                           Self,
                           Target,
                           OtherId)
    end;
do_skill_check([self_cond | T], {true, Skill},
               Skill = #c_skill{skill = #skill{self_cond = []}}, Self,
               Target, OtherId) ->
    do_skill_check(T,
                   {true, Skill},
                   Skill,
                   Self,
                   Target,
                   OtherId);
do_skill_check([self_cond | T], {true, Skill},
               Skill = #c_skill{id = SkillID, lev = Lev,
                                skill = #skill{self_cond = SelfCond}},
               Self = #fighter{}, Target, OtherId) ->
    case do_check_self_cond(SelfCond, Self) of
        {false, Reason, Label} ->
            case Label of
                wing_power ->
                    case wing_data:get_fuck_skill_id(SkillID) of
                        FuckID when FuckID > 0 ->
                            FuckSkill =
                                combat_script_skill:to_combat_skill({FuckID,
                                                                     Lev}),
                            case FuckSkill of
                                #c_skill{skill = Skill2} ->
                                    NewReason =
                                        notice:format(lang:get("能量不足，已转换为~ts"),
                                                      [{string_2,
                                                        5,
                                                        Skill2#skill.name}]),
                                    DoubleFuckSkill =
                                        FuckSkill#c_skill{action_msg =
                                                              NewReason},
                                    do_skill_check([self_cond | T],
                                                   {true, DoubleFuckSkill},
                                                   DoubleFuckSkill,
                                                   Self,
                                                   Target,
                                                   OtherId);
                                _ -> {false, Reason}
                            end;
                        _ -> {false, Reason}
                    end;
                _ -> {false, Reason}
            end;
        true ->
            do_skill_check(T,
                           {true, Skill},
                           Skill,
                           Self,
                           Target,
                           OtherId)
    end;
do_skill_check([mp | T], {true, Skill},
               Skill = #c_skill{skill = #skill{cost_mp = CostMp}},
               Self = #fighter{mp = Mp, cost_mp_ratio = CostMpRatio},
               Target, OtherId) ->
    CostMp1 = round(CostMp * CostMpRatio / 1000),
    case Mp < CostMp1 of
        true -> {false, lang:get("魔法不足, 请选择其他技能")};
        _ ->
            do_skill_check(T,
                           {true, Skill},
                           Skill,
                           Self,
                           Target,
                           OtherId)
    end;
do_skill_check([snow | T], {true, Skill},
               Skill = #c_skill{act_flag = variety_4},
               Self = #fighter{}, Target, OtherId) ->
    Atk = combat_cache:get_ext_val(Self, 1, 0),
    case Atk > 0 of
        true ->
            do_skill_check(T,
                           {true, Skill},
                           Skill,
                           Self,
                           Target,
                           OtherId);
        _ -> {false, lang:get("没有雪球可丢，请先搓个雪球")}
    end;
do_skill_check([snow | T], {true, Skill}, Skill, Self,
               Target, OtherId) ->
    do_skill_check(T,
                   {true, Skill},
                   Skill,
                   Self,
                   Target,
                   OtherId);
do_skill_check([anger | T], {true, Skill},
               Skill = #c_skill{skill =
                                    #skill{cost_anger = CostAnger}},
               Self = #fighter{anger = Anger,
                               combat_init_attr =
                                   #combat_init_attr{use_anger_ratio =
                                                         UseAngerRatio}},
               Target, OtherId) ->
    NeedAnger = round(CostAnger * UseAngerRatio / 1000),
    case Anger < NeedAnger of
        true -> {false, lang:get("怒气不足, 请选择其他技能")};
        _ ->
            do_skill_check(T,
                           {true, Skill},
                           Skill,
                           Self,
                           Target,
                           OtherId)
    end;
do_skill_check([target_type | T], {true, Skill},
               Skill = #c_skill{skill =
                                    #skill{target_type = TargetType}},
               Self = #fighter{id = Sid, group = Sgroup,
                               master_fid = MasterFid, lover = LoverId},
               Target = #fighter{id = Tid, origin_id = ToriginId,
                                 group = Tgroup, type = FighterType},
               OtherId) ->
    Result = case TargetType of
                 2 -> Sid =:= Tid;
                 0 -> Sgroup =:= Tgroup;
                 1 -> Sgroup =/= Tgroup;
                 5 -> Sgroup =:= Tgroup andalso Sid =/= Tid;
                 4 -> MasterFid =:= Tid;
                 6 -> LoverId =:= ToriginId andalso Sgroup =:= Tgroup;
                 3 -> true;
                 8 -> true;
                 9 -> Sgroup =:= Tgroup andalso FighterType =:= 3;
                 _ -> false
             end,
    case Result of
        true ->
            do_skill_check(T,
                           {true, Skill},
                           Skill,
                           Self,
                           Target,
                           OtherId);
        false -> {false, lang:get("不能对该目标使用此技能")}
    end;
do_skill_check([target_type | T], {true, Skill}, Skill,
               Self, Target, OtherId) ->
    do_skill_check(T,
                   {true, Skill},
                   Skill,
                   Self,
                   Target,
                   OtherId);
do_skill_check([self_status | T], {true, Skill}, Skill,
               Self = #fighter{is_escape = IsEscape}, Target,
               OtherId) ->
    case IsEscape =:= 0 of
        true ->
            do_skill_check(T,
                           {true, Skill},
                           Skill,
                           Self,
                           Target,
                           OtherId);
        false -> {false, lang:get("当前状态下不能选择技能")}
    end;
do_skill_check([self_special | T],
               {true, Skill = #c_skill{id = SkillId}}, Skill,
               Self = #fighter{special_status =
                                   #special_status{cannot_use_skill =
                                                       CanNotUseSkill}},
               Target, OtherId) ->
    case CanNotUseSkill of
        1 ->
            case lists:member(SkillId,
                              limit_skill(cannot_use_skill))
                of
                true ->
                    do_skill_check(T,
                                   {true, Skill},
                                   Skill,
                                   Self,
                                   Target,
                                   OtherId);
                false -> {false, lang:get("当前状态下不能选择技能")}
            end;
        0 ->
            do_skill_check(T,
                           {true, Skill},
                           Skill,
                           Self,
                           Target,
                           OtherId)
    end;
do_skill_check([target_status | T], {true, Skill},
               Skill, Self, Target = #fighter{is_escape = IsEscape},
               OtherId) ->
    case IsEscape =:= 0 of
        true ->
            do_skill_check(T,
                           {true, Skill},
                           Skill,
                           Self,
                           Target,
                           OtherId);
        false -> {false, lang:get("目标已经逃跑")}
    end;
do_skill_check([target_status | T], {true, Skill},
               Skill, Self, Target, OtherId) ->
    do_skill_check(T,
                   {true, Skill},
                   Skill,
                   Self,
                   Target,
                   OtherId);
do_skill_check([summon_exists | T],
               {true,
                Skill = #c_skill{skill =
                                     #skill{script_id = 20070,
                                            script_args = [UnitId | _]}}},
               Skill, Self = #fighter{group = Sgroup}, Target,
               OtherId) ->
    case combat_cache:f(by_baseid, UnitId) of
        #fighter{group = SummonGroup, is_die = 0, is_escape = 0}
            when SummonGroup =:= Sgroup ->
            {false, lang:get("战场已经存在嘲讽图腾了,不能进行召唤")};
        _ ->
            do_skill_check(T,
                           {true, Skill},
                           Skill,
                           Self,
                           Target,
                           OtherId)
    end;
do_skill_check([summon_exists | T], {true, Skill},
               Skill, Self, Target, OtherId) ->
    do_skill_check(T,
                   {true, Skill},
                   Skill,
                   Self,
                   Target,
                   OtherId);
do_skill_check([halo_exists | T],
               {true,
                Skill = #c_skill{skill = #skill{script_id = 20071}}},
               Skill, Self = #fighter{group = Sgroup},
               Target = #fighter{buffs = Buffs}, OtherId) ->
    case combat_buff:get_eff_halo(Sgroup) of
        [_ | _] -> {false, lang:get("战场已经存在结界, 无法释放")};
        _ ->
            logger:debug("==========", [], combat_skill, 474),
            case lists:keyfind(129001, #c_buff.script_id, Buffs) of
                #c_buff{duration_left = Left} when Left > 0 ->
                    {false, lang:get("隐身状态的宠物不能支撑结界, 无法释放")};
                _ ->
                    do_skill_check(T,
                                   {true, Skill},
                                   Skill,
                                   Self,
                                   Target,
                                   OtherId)
            end
    end;
do_skill_check([halo_exists | T], {true, Skill}, Skill,
               Self, Target, OtherId) ->
    do_skill_check(T,
                   {true, Skill},
                   Skill,
                   Self,
                   Target,
                   OtherId);
do_skill_check([defence_check | T],
               {true,
                Skill = #c_skill{skill = #skill{script_id = 10001}}},
               Skill, Self = #fighter{buffs = Buffs}, Target,
               OtherId) ->
    case lists:keymember(halo, #c_buff.sec_type, Buffs) of
        true -> {false, lang:get("宠物正在支撑着结界,无法进行防御")};
        _ ->
            do_skill_check(T,
                           {true, Skill},
                           Skill,
                           Self,
                           Target,
                           OtherId)
    end;
do_skill_check([defence_check | T], {true, Skill},
               Skill, Self, Target, OtherId) ->
    do_skill_check(T,
                   {true, Skill},
                   Skill,
                   Self,
                   Target,
                   OtherId);
do_skill_check(_, {false, Reason}, _, _, _, _) ->
    {false, Reason}.

do_check_self_cond([], _Self) -> true;
do_check_self_cond([{Label, Op, Val} | T],
                   Self = #fighter{hp = Hp, hp_max = HpMax}) ->
    case Label of
        hp ->
            case role_cond:comp(Op, Hp, Val) of
                false ->
                    case Op of
                        lt ->
                            {false,
                             util:flist(lang:get("气血必须小于~w才能使用该技能"), [Val]),
                             Label};
                        gt ->
                            {false,
                             util:flist(lang:get("气血必须大于~w才能使用该技能"), [Val]),
                             Label};
                        _ -> {false, lang:get("你的气血不满足条件, 无法使用"), hp}
                    end;
                true -> do_check_self_cond(T, Self)
            end;
        hp_ratio ->
            case role_cond:comp(Op, Hp / HpMax * 1000, Val) of
                false ->
                    case Op of
                        lt ->
                            {false,
                             util:flist(lang:get("气血必须小于~w%才能使用该技能"),
                                        [round(Val / 10)]),
                             Label};
                        gt ->
                            {false,
                             util:flist(lang:get("气血必须大于~w%才能使用该技能"),
                                        [round(Val / 10)]),
                             Label};
                        _ -> {false, lang:get("你的气血不满足条件, 无法使用"), Label}
                    end;
                true -> do_check_self_cond(T, Self)
            end;
        wing_power ->
            PowerVal = combat_cache:get_ext_val(Self, 8, 0),
            NeedVal = get_wing_power_by_combat_type(),
            case role_cond:comp(Op, PowerVal, NeedVal) of
                false ->
                    case Op of
                        gt ->
                            {false,
                             util:flist(lang:get("能量不足＞~w"), [NeedVal]),
                             Label};
                        ge ->
                            {false,
                             util:flist(lang:get("能量不足~w"), [NeedVal]),
                             Label};
                        _ -> {false, lang:get("你的晶石能量不满足条件, 无法使用"), Label}
                    end;
                true -> do_check_self_cond(T, Self)
            end;
        sq_point ->
            SqPoint = combat_cache:get_ext_val(Self, 9, 0),
            NeedVal = get_sq_point_by_combat_type(),
            case role_cond:comp(Op, SqPoint, NeedVal) of
                false ->
                    case Op of
                        gt -> {false, lang:get("灵气不足,职业绝招释放失败"), Label};
                        ge -> {false, lang:get("灵气不足,职业绝招释放失败"), Label};
                        _ -> {false, lang:get("灵气不足,职业绝招释放失败"), Label}
                    end;
                true -> do_check_self_cond(T, Self)
            end;
        _ -> do_check_self_cond(T, Self)
    end.

auto_action([]) -> ok;
auto_action([Atk = #fighter{id = Sid,
                            special_attr =
                                SpecialAttr = #special_attr{next_action_stay =
                                                                1}}
             | T]) ->
    NewSpecialAttr =
        SpecialAttr#special_attr{next_action_stay = 0},
    Msg = notice:format(lang:get("吓尿了，受到[~ts]的影响，你只能被动防御"),
                        [{string_2, 5, lang:get("恐惧")}]),
    NewSkill = combat_script_skill:to_combat_skill({1001,
                                                    1}),
    NewSkill1 = NewSkill#c_skill{action_msg = Msg},
    NewAtk = Atk#fighter{special_attr = NewSpecialAttr,
                         action = {NewSkill1, Sid}},
    combat_cache:u(NewAtk),
    auto_action(T);
auto_action([Atk = #fighter{type = 1,
                            special_attr =
                                SpecialAttr = #special_attr{pre_action =
                                                                {SkillId,
                                                                 SkillLev,
                                                                 Tid}}}
             | T]) ->
    NewSpecialAttr = SpecialAttr#special_attr{pre_action =
                                                  undefined},
    NewAtk = Atk#fighter{special_attr = NewSpecialAttr},
    case combat_script_skill:to_combat_skill({SkillId,
                                              SkillLev})
        of
        Cskill = #c_skill{} ->
            combat_cache:u(NewAtk#fighter{action = {Cskill, Tid}}),
            auto_action(T);
        _ -> auto_action([NewAtk | T])
    end;
auto_action([Atk = #fighter{group = Sgroup, type = 1,
                            action = undefined, is_auto = OldAuto,
                            last_skill = _LastSkill}
             | T]) ->
    case ai:check_catch(Atk,
                        combat_cache:all(combat_cache:op(Sgroup)))
        of
        false ->
            Context = combat_cache:get_context(),
            AiAtk = ai:act(Atk,
                           Context#combat_context{self_side =
                                                      combat_cache:all(Sgroup),
                                                  op_side =
                                                      combat_cache:all(combat_cache:op(Sgroup))}),
            NewAtk = variety_skill(AiAtk#fighter{is_auto = 1}),
            combat_cache:u(NewAtk),
            case OldAuto of
                1 -> skip;
                0 -> combat:pack_10740(NewAtk)
            end,
            auto_action(T);
        {true, AiAtk} ->
            NewAtk = AiAtk#fighter{is_auto = 1},
            combat_cache:u(NewAtk),
            case OldAuto of
                1 -> skip;
                0 -> combat:pack_10740(NewAtk)
            end,
            auto_action(T)
    end;
auto_action([#fighter{type = 1,
                      action =
                          {#c_skill{skill = #skill{script_id = 20071}}, Tid},
                      group = Sgroup}
             | T1]) ->
    case lists:keytake(Tid, #fighter.id, T1) of
        {value,
         Atk = #fighter{type = 3,
                        action = {#c_skill{id = 1001}, _}, group = Sgroup},
         T2} ->
            Context = combat_cache:get_context(),
            AiAtk = ai:act(Atk,
                           Context#combat_context{self_side =
                                                      combat_cache:all(Sgroup),
                                                  op_side =
                                                      combat_cache:all(combat_cache:op(Sgroup))}),
            NewAtk = variety_skill(AiAtk),
            combat_cache:u(NewAtk),
            auto_action(T2);
        _ -> auto_action(T1)
    end;
auto_action([Atk = #fighter{type = 3,
                            action = undefined, group = Sgroup}
             | T]) ->
    Context = combat_cache:get_context(),
    AiAtk = ai:act(Atk,
                   Context#combat_context{self_side =
                                              combat_cache:all(Sgroup),
                                          op_side =
                                              combat_cache:all(combat_cache:op(Sgroup))}),
    NewAtk = variety_skill(AiAtk),
    combat_cache:u(NewAtk),
    auto_action(T);
auto_action([Atk = #fighter{type = 6,
                            action = undefined, group = Sgroup}
             | T]) ->
    Context = combat_cache:get_context(),
    AiAtk = ai:act(Atk,
                   Context#combat_context{self_side =
                                              combat_cache:all(Sgroup),
                                          op_side =
                                              combat_cache:all(combat_cache:op(Sgroup))}),
    NewAtk = variety_skill(AiAtk),
    combat_cache:u(NewAtk),
    auto_action(T);
auto_action([Atk = #fighter{type = 4,
                            special_attr =
                                SpecialAttr = #special_attr{pre_action =
                                                                {SkillId,
                                                                 SkillLev,
                                                                 Tid}}}
             | T]) ->
    NewSpecialAttr = SpecialAttr#special_attr{pre_action =
                                                  undefined},
    NewAtk = Atk#fighter{special_attr = NewSpecialAttr},
    case combat_script_skill:to_combat_skill({SkillId,
                                              SkillLev})
        of
        Cskill = #c_skill{} ->
            combat_cache:u(NewAtk#fighter{action = {Cskill, Tid}}),
            auto_action(T);
        _ -> auto_action([NewAtk | T])
    end;
auto_action([Atk = #fighter{type = 4,
                            action = undefined, group = Sgroup}
             | T]) ->
    Context = combat_cache:get_context(),
    AiAtk = ai:act(Atk,
                   Context#combat_context{self_side =
                                              combat_cache:all(Sgroup),
                                          op_side =
                                              combat_cache:all(combat_cache:op(Sgroup))}),
    combat_cache:u(AiAtk),
    auto_action(T);
auto_action([Atk = #fighter{type = 5,
                            special_attr =
                                SpecialAttr = #special_attr{pre_action =
                                                                {SkillId,
                                                                 SkillLev,
                                                                 Tid}}}
             | T]) ->
    NewSpecialAttr = SpecialAttr#special_attr{pre_action =
                                                  undefined},
    NewAtk = Atk#fighter{special_attr = NewSpecialAttr},
    case combat_script_skill:to_combat_skill({SkillId,
                                              SkillLev})
        of
        Cskill = #c_skill{} ->
            combat_cache:u(NewAtk#fighter{action = {Cskill, Tid}}),
            auto_action(T);
        _ -> auto_action([NewAtk | T])
    end;
auto_action([#fighter{type = 5, action = undefined}
             | T]) ->
    auto_action(T);
auto_action([Atk = #fighter{type = 2,
                            special_attr =
                                SpecialAttr = #special_attr{pre_action =
                                                                {SkillId,
                                                                 SkillLev,
                                                                 Tid}}}
             | T]) ->
    NewSpecialAttr = SpecialAttr#special_attr{pre_action =
                                                  undefined},
    NewAtk = Atk#fighter{special_attr = NewSpecialAttr},
    case combat_script_skill:to_combat_skill({SkillId,
                                              SkillLev})
        of
        Cskill = #c_skill{} ->
            combat_cache:u(NewAtk#fighter{action = {Cskill, Tid}}),
            auto_action(T);
        _ -> auto_action([NewAtk | T])
    end;
auto_action([Atk = #fighter{type = 2,
                            action = undefined, group = Sgroup}
             | T]) ->
    [CombatType] =
        combat_cache:get_context_elem([#combat_context.type]),
    Context = combat_cache:get_context(),
    AiAtk = ai:act(Atk,
                   Context#combat_context{self_side =
                                              combat_cache:all(Sgroup),
                                          op_side =
                                              combat_cache:all(combat_cache:op(Sgroup))}),
    NewAtk = variety_skill(AiAtk),
    SpeedFlag = case NewAtk of
                    #fighter{action =
                                 {#c_skill{skill = #skill{speed = Speed}}, _}}
                        when Speed > 1 ->
                        true;
                    _ -> false
                end,
    case CombatType of
        68 when not SpeedFlag -> auto_action(T);
        69 when not SpeedFlag -> auto_action(T);
        70 when not SpeedFlag -> auto_action(T);
        72 when not SpeedFlag -> auto_action(T);
        _ ->
            combat_cache:u(NewAtk),
            auto_action(T)
    end;
auto_action([_Atk | T]) -> auto_action(T).

variety_skill(Atk = #fighter{group = Sgroup,
                             action =
                                 {#c_skill{lev = SkillLev, act_flag = variety_1,
                                           skill =
                                               #skill{cooldown = Cooldown,
                                                      pre_cooldown =
                                                          PreCooldown,
                                                      script_args =
                                                          [SelfSkillId,
                                                           TargetSkillId]},
                                           trigger_after = TriggerAfter},
                                  TargetId}}) ->
    case combat_cache:f(by_id, TargetId) of
        #fighter{group = Sgroup} ->
            CSkill1 = #c_skill{skill = Skill1} =
                          combat_script_skill:to_combat_skill({SelfSkillId,
                                                               SkillLev}),
            NewSkill = Skill1#skill{cooldown = Cooldown,
                                    pre_cooldown = PreCooldown},
            NewCSkill = CSkill1#c_skill{skill = NewSkill},
            NewAction = {NewCSkill, TargetId},
            Atk#fighter{action = NewAction};
        #fighter{} ->
            CSkill1 = #c_skill{skill = Skill1} =
                          combat_script_skill:to_combat_skill({TargetSkillId,
                                                               SkillLev}),
            NewSkill = Skill1#skill{cooldown = Cooldown,
                                    pre_cooldown = PreCooldown},
            NewCSkill = CSkill1#c_skill{skill = NewSkill,
                                        trigger_after = TriggerAfter},
            NewAction = {NewCSkill, TargetId},
            Atk#fighter{action = NewAction};
        _ -> Atk
    end;
variety_skill(Atk = #fighter{special_status =
                                 #special_status{energy = Energy},
                             action =
                                 {BaseSkill = #c_skill{lev = SkillLev,
                                                       act_flag = variety_2,
                                                       ext_args = ExtArgs,
                                                       skill =
                                                           #skill{cooldown =
                                                                      Cooldown,
                                                                  pre_cooldown =
                                                                      PreCooldown,
                                                                  script_args =
                                                                      [NeedEnergy,
                                                                       SelfSkillId,
                                                                       TargetSkillId]}},
                                  TargetId}}) ->
    case Energy < NeedEnergy of
        true ->
            CSkill1 = #c_skill{skill = Skill1} =
                          combat_script_skill:to_combat_skill({SelfSkillId,
                                                               SkillLev}),
            NewSkill = Skill1#skill{cooldown = Cooldown,
                                    pre_cooldown = PreCooldown},
            NewCSkill = CSkill1#c_skill{skill = NewSkill,
                                        variety_base = BaseSkill,
                                        ext_args = ExtArgs},
            NewAction = {NewCSkill, TargetId},
            Atk#fighter{action = NewAction};
        false ->
            CSkill1 = #c_skill{skill = Skill1} =
                          combat_script_skill:to_combat_skill({TargetSkillId,
                                                               SkillLev}),
            NewSkill = Skill1#skill{cooldown = Cooldown,
                                    pre_cooldown = PreCooldown},
            NewCSkill = CSkill1#c_skill{skill = NewSkill,
                                        variety_base = BaseSkill,
                                        ext_args = ExtArgs},
            NewAction = {NewCSkill, TargetId},
            Atk#fighter{action = NewAction}
    end;
variety_skill(Atk = #fighter{action =
                                 {BaseSkill = #c_skill{lev = SkillLev,
                                                       act_flag = variety_3,
                                                       skill =
                                                           #skill{cooldown =
                                                                      Cooldown,
                                                                  pre_cooldown =
                                                                      PreCooldown,
                                                                  script_args =
                                                                      [Ratio,
                                                                       SkillId1,
                                                                       SkillId2]}},
                                  TargetId}}) ->
    case util:rand(1, 1000) =< Ratio of
        true ->
            CSkill1 = #c_skill{skill = Skill1} =
                          combat_script_skill:to_combat_skill({SkillId1,
                                                               SkillLev}),
            NewSkill = Skill1#skill{cooldown = Cooldown,
                                    pre_cooldown = PreCooldown},
            NewCSkill = CSkill1#c_skill{skill = NewSkill,
                                        variety_base = BaseSkill},
            NewAction = {NewCSkill, TargetId},
            Atk#fighter{action = NewAction};
        false ->
            CSkill1 = #c_skill{skill = Skill1} =
                          combat_script_skill:to_combat_skill({SkillId2,
                                                               SkillLev}),
            NewSkill = Skill1#skill{cooldown = Cooldown,
                                    pre_cooldown = PreCooldown},
            NewCSkill = CSkill1#c_skill{skill = NewSkill,
                                        variety_base = BaseSkill},
            NewAction = {NewCSkill, TargetId},
            Atk#fighter{action = NewAction}
    end;
variety_skill(Atk = #fighter{action =
                                 {BaseSkill = #c_skill{lev = SkillLev,
                                                       act_flag = variety_4,
                                                       skill =
                                                           #skill{cooldown =
                                                                      Cooldown,
                                                                  pre_cooldown =
                                                                      PreCooldown,
                                                                  script_args =
                                                                      SkillList}},
                                  TargetId}}) ->
    AtkVal = combat_cache:get_ext_val(Atk, 1, 1),
    case lists:keyfind(AtkVal, 1, SkillList) of
        {_, SkillId} ->
            CSkill1 = #c_skill{skill = Skill1} =
                          combat_script_skill:to_combat_skill({SkillId,
                                                               SkillLev}),
            NewSkill = Skill1#skill{cooldown = Cooldown,
                                    pre_cooldown = PreCooldown},
            NewCSkill = CSkill1#c_skill{skill = NewSkill,
                                        variety_base = BaseSkill},
            NewAction = {NewCSkill, TargetId},
            Atk#fighter{action = NewAction};
        false -> Atk
    end;
variety_skill(Atk = #fighter{action =
                                 {BaseSkill = #c_skill{lev = SkillLev,
                                                       act_flag = variety_5,
                                                       skill =
                                                           #skill{cooldown =
                                                                      Cooldown,
                                                                  pre_cooldown =
                                                                      PreCooldown,
                                                                  script_args =
                                                                      [Ratio,
                                                                       SkillId1,
                                                                       SkillId2]}},
                                  TargetId}}) ->
    case util:rand(1, 1000) =< Ratio of
        true ->
            CSkill1 = #c_skill{skill = Skill1} =
                          combat_script_skill:to_combat_skill({SkillId1,
                                                               SkillLev}),
            NewSkill = Skill1#skill{cooldown = Cooldown,
                                    pre_cooldown = PreCooldown},
            NewCSkill = CSkill1#c_skill{skill = NewSkill,
                                        variety_base = BaseSkill},
            NewAction = {NewCSkill, TargetId},
            Atk#fighter{action = NewAction};
        false ->
            CSkill1 = #c_skill{skill = Skill1} =
                          combat_script_skill:to_combat_skill({SkillId2,
                                                               SkillLev}),
            NewSkill = Skill1#skill{cooldown = Cooldown,
                                    pre_cooldown = PreCooldown},
            NewCSkill = CSkill1#c_skill{skill = NewSkill,
                                        variety_base = BaseSkill},
            NewAction = {NewCSkill, TargetId},
            Atk#fighter{action = NewAction}
    end;
variety_skill(Atk = #fighter{action =
                                 {BaseSkill = #c_skill{lev = SkillLev,
                                                       act_flag = variety_6,
                                                       skill =
                                                           #skill{cooldown =
                                                                      Cooldown,
                                                                  pre_cooldown =
                                                                      PreCooldown,
                                                                  script_args =
                                                                      [RatioList]},
                                                       trigger_before =
                                                           TriggerBefore},
                                  TargetId}}) ->
    SkillId = case util:rand_list(RatioList, 1) of
                  {_, _SkillId} -> _SkillId;
                  _ -> 1005
              end,
    CSkill = #c_skill{skill = Skill} =
                 combat_script_skill:to_combat_skill({SkillId,
                                                      SkillLev}),
    NewSkill = Skill#skill{cooldown = Cooldown,
                           pre_cooldown = PreCooldown},
    NewCSkill = CSkill#c_skill{skill = NewSkill,
                               variety_base = BaseSkill,
                               trigger_before = TriggerBefore},
    NewAction = {NewCSkill, TargetId},
    Atk#fighter{action = NewAction};
variety_skill(Atk = #fighter{action =
                                 {#c_skill{id = 1000}, TargetId},
                             passive_skills = PassiveSkills}) ->
    case combat_cache:f(by_script_id, PassiveSkills, 60164)
        of
        #c_skill{skill =
                     #skill{script_args = [_, ChangeSkillId]}} ->
            CSkill =
                combat_script_skill:to_combat_skill({ChangeSkillId, 1}),
            NewAction = {CSkill, TargetId},
            Atk#fighter{action = NewAction};
        _ -> Atk
    end;
variety_skill(Atk) -> Atk.

variety_atk_skill(#c_skill{variety_base =
                               BaseSkill = #c_skill{lev = SkillLev,
                                                    act_flag = variety_5,
                                                    skill =
                                                        #skill{cooldown =
                                                                   Cooldown,
                                                               pre_cooldown =
                                                                   PreCooldown,
                                                               script_args =
                                                                   [Ratio,
                                                                    SkillId1,
                                                                    SkillId2]}}}) ->
    case util:rand(1, 1000) =< Ratio of
        true ->
            CSkill1 = #c_skill{skill = Skill1} =
                          combat_script_skill:to_combat_skill({SkillId1,
                                                               SkillLev}),
            NewSkill = Skill1#skill{cooldown = Cooldown,
                                    pre_cooldown = PreCooldown},
            CSkill1#c_skill{skill = NewSkill,
                            variety_base = BaseSkill};
        false ->
            CSkill1 = #c_skill{skill = Skill1} =
                          combat_script_skill:to_combat_skill({SkillId2,
                                                               SkillLev}),
            NewSkill = Skill1#skill{cooldown = Cooldown,
                                    pre_cooldown = PreCooldown},
            CSkill1#c_skill{skill = NewSkill,
                            variety_base = BaseSkill}
    end;
variety_atk_skill(Skill) -> Skill.

passive_to_variety_skill(#fighter{special_status =
                                      #special_status{energy = Energy}},
                         #c_skill{variety_base =
                                      BaseSkill = #c_skill{lev = SkillLev,
                                                           act_flag = variety_2,
                                                           skill =
                                                               #skill{cooldown =
                                                                          Cooldown,
                                                                      pre_cooldown
                                                                          =
                                                                          PreCooldown,
                                                                      script_args
                                                                          =
                                                                          [NeedEnergy,
                                                                           SelfSkillId,
                                                                           TargetSkillId]}},
                                  skill = #skill{dmg_addt = DmgAddt}},
                         ReduceDmg) ->
    case Energy < NeedEnergy of
        true ->
            CSkill1 = #c_skill{skill =
                                   Skill1 = #skill{dmg_ratio = DmgRatio}} =
                          combat_script_skill:to_combat_skill({SelfSkillId,
                                                               SkillLev}),
            NewDmgRatio = [round(D * ReduceDmg / 1000)
                           || D <- DmgRatio],
            NewDmgAddt = round(DmgAddt * ReduceDmg / 1000),
            NewSkill = Skill1#skill{cooldown = Cooldown,
                                    pre_cooldown = PreCooldown,
                                    dmg_ratio = NewDmgRatio,
                                    dmg_addt = NewDmgAddt},
            CSkill1#c_skill{skill = NewSkill,
                            variety_base = BaseSkill,
                            passive_args = {DmgRatio, DmgAddt}};
        false ->
            CSkill1 = #c_skill{skill =
                                   Skill1 = #skill{dmg_ratio = DmgRatio}} =
                          combat_script_skill:to_combat_skill({TargetSkillId,
                                                               SkillLev}),
            NewDmgRatio = [round(D * ReduceDmg / 1000)
                           || D <- DmgRatio],
            NewDmgAddt = round(DmgAddt * ReduceDmg / 1000),
            NewSkill = Skill1#skill{cooldown = Cooldown,
                                    pre_cooldown = PreCooldown,
                                    dmg_ratio = NewDmgRatio,
                                    dmg_addt = NewDmgAddt},
            CSkill1#c_skill{skill = NewSkill,
                            variety_base = BaseSkill,
                            passive_args = {DmgRatio, DmgAddt}}
    end;
passive_to_variety_skill(#fighter{},
                         #c_skill{variety_base =
                                      BaseSkill = #c_skill{lev = SkillLev,
                                                           act_flag = variety_3,
                                                           skill =
                                                               #skill{cooldown =
                                                                          Cooldown,
                                                                      pre_cooldown
                                                                          =
                                                                          PreCooldown,
                                                                      script_args
                                                                          =
                                                                          [Ratio,
                                                                           SkillId1,
                                                                           SkillId2]}},
                                  skill = #skill{dmg_addt = DmgAddt}},
                         ReduceDmg) ->
    case util:rand(1, 1000) =< Ratio of
        true ->
            CSkill1 = #c_skill{skill =
                                   Skill1 = #skill{dmg_ratio = DmgRatio}} =
                          combat_script_skill:to_combat_skill({SkillId1,
                                                               SkillLev}),
            NewDmgRatio = [round(D * ReduceDmg / 1000)
                           || D <- DmgRatio],
            NewDmgAddt = round(DmgAddt * ReduceDmg / 1000),
            NewSkill = Skill1#skill{cooldown = Cooldown,
                                    pre_cooldown = PreCooldown,
                                    dmg_ratio = NewDmgRatio,
                                    dmg_addt = NewDmgAddt},
            CSkill1#c_skill{skill = NewSkill,
                            variety_base = BaseSkill,
                            passive_args = {DmgRatio, DmgAddt}};
        false ->
            CSkill1 = #c_skill{skill =
                                   Skill1 = #skill{dmg_ratio = DmgRatio}} =
                          combat_script_skill:to_combat_skill({SkillId2,
                                                               SkillLev}),
            NewDmgRatio = [round(D * ReduceDmg / 1000)
                           || D <- DmgRatio],
            NewDmgAddt = round(DmgAddt * ReduceDmg / 1000),
            NewSkill = Skill1#skill{cooldown = Cooldown,
                                    pre_cooldown = PreCooldown,
                                    dmg_ratio = NewDmgRatio,
                                    dmg_addt = NewDmgAddt},
            CSkill1#c_skill{skill = NewSkill,
                            variety_base = BaseSkill,
                            passive_args = {DmgRatio, DmgAddt}}
    end;
passive_to_variety_skill(#fighter{},
                         #c_skill{variety_base =
                                      BaseSkill = #c_skill{lev = SkillLev,
                                                           act_flag = variety_5,
                                                           skill =
                                                               #skill{cooldown =
                                                                          Cooldown,
                                                                      pre_cooldown
                                                                          =
                                                                          PreCooldown,
                                                                      script_args
                                                                          =
                                                                          [Ratio,
                                                                           SkillId1,
                                                                           SkillId2]}},
                                  skill = #skill{dmg_addt = DmgAddt}},
                         ReduceDmg) ->
    case util:rand(1, 1000) =< Ratio of
        true ->
            CSkill1 = #c_skill{skill =
                                   Skill1 = #skill{dmg_ratio = DmgRatio}} =
                          combat_script_skill:to_combat_skill({SkillId1,
                                                               SkillLev}),
            NewDmgRatio = [round(D * ReduceDmg / 1000)
                           || D <- DmgRatio],
            NewDmgAddt = round(DmgAddt * ReduceDmg / 1000),
            NewSkill = Skill1#skill{cooldown = Cooldown,
                                    pre_cooldown = PreCooldown,
                                    dmg_ratio = NewDmgRatio,
                                    dmg_addt = NewDmgAddt},
            CSkill1#c_skill{skill = NewSkill,
                            variety_base = BaseSkill,
                            passive_args = {DmgRatio, DmgAddt}};
        false ->
            CSkill1 = #c_skill{skill =
                                   Skill1 = #skill{dmg_ratio = DmgRatio}} =
                          combat_script_skill:to_combat_skill({SkillId2,
                                                               SkillLev}),
            NewDmgRatio = [round(D * ReduceDmg / 1000)
                           || D <- DmgRatio],
            NewDmgAddt = round(DmgAddt * ReduceDmg / 1000),
            NewSkill = Skill1#skill{cooldown = Cooldown,
                                    pre_cooldown = PreCooldown,
                                    dmg_ratio = NewDmgRatio,
                                    dmg_addt = NewDmgAddt},
            CSkill1#c_skill{skill = NewSkill,
                            variety_base = BaseSkill,
                            passive_args = {DmgRatio, DmgAddt}}
    end;
passive_to_variety_skill(#fighter{},
                         #c_skill{variety_base =
                                      BaseSkill = #c_skill{lev = SkillLev,
                                                           act_flag = variety_6,
                                                           skill =
                                                               #skill{cooldown =
                                                                          Cooldown,
                                                                      pre_cooldown
                                                                          =
                                                                          PreCooldown,
                                                                      script_args
                                                                          =
                                                                          [RatioList]}},
                                  skill =
                                      #skill{dmg_addt = DmgAddt,
                                             target_list = TargetList}},
                         ReduceDmg) ->
    SkillId = case util:rand_list(RatioList, 1) of
                  {_, _SkillId} -> _SkillId;
                  _ -> 1005
              end,
    CSkill = #c_skill{skill =
                          Skill = #skill{dmg_ratio = DmgRatio}} =
                 combat_script_skill:to_combat_skill({SkillId,
                                                      SkillLev}),
    NewDmgRatio = [round(D * ReduceDmg / 1000)
                   || D <- DmgRatio],
    NewDmgAddt = round(DmgAddt * ReduceDmg / 1000),
    NewSkill = Skill#skill{cooldown = Cooldown,
                           pre_cooldown = PreCooldown, dmg_ratio = NewDmgRatio,
                           dmg_addt = NewDmgAddt, target_list = TargetList},
    CSkill#c_skill{skill = NewSkill,
                   variety_base = BaseSkill,
                   passive_args = {DmgRatio, DmgAddt}};
passive_to_variety_skill(_,
                         Cskill = #c_skill{skill =
                                               Skill = #skill{dmg_ratio =
                                                                  DmgRatio,
                                                              dmg_addt =
                                                                  DmgAddt}},
                         ReduceDmg) ->
    NewDmgRatio = [round(D * ReduceDmg / 1000)
                   || D <- DmgRatio],
    NewDmgAddt = round(DmgAddt * ReduceDmg / 1000),
    NewSkill = Skill#skill{dmg_ratio = NewDmgRatio,
                           dmg_addt = NewDmgAddt},
    Cskill#c_skill{skill = NewSkill,
                   passive_args = {DmgRatio, DmgAddt}}.

is_skill_in_cooldown(Fid, #c_skill{id = SkillId}) ->
    is_skill_in_cooldown(Fid, SkillId);
is_skill_in_cooldown(Fid, SkillId) ->
    case combat_cache:f(by_id, Fid) of
        #fighter{type = 2, skill_cooldown = Cds} ->
            case lists:keyfind(SkillId, 1, Cds) of
                {SkillId, TimeLeft} when TimeLeft > 0 -> true;
                _ ->
                    case skill_combat_data:get_common_cd(SkillId) of
                        {CDSkillId, CommonCd, Times} ->
                            [Round, CommonCooldown] =
                                combat_cache:get_context_elem([#combat_context.round,
                                                               #combat_context.common_cooldown]),
                            case lists:keyfind(CDSkillId, 1, CommonCooldown) of
                                {_, BeginRound, UseTimes} ->
                                    case Round - BeginRound < CommonCd andalso
                                             UseTimes >= Times
                                        of
                                        true -> true;
                                        _ -> false
                                    end;
                                _ -> false
                            end;
                        _ -> false
                    end
            end;
        #fighter{skill_cooldown = Cds} ->
            case lists:keyfind(SkillId, 1, Cds) of
                {SkillId, TimeLeft} when TimeLeft > 0 -> true;
                _ -> false
            end;
        _ -> false
    end.

load_pre_cooldown(#fighter{id = Sid,
                           active_skills = ActiveSkills}) ->
    lists:foreach(fun (Skill = #c_skill{skill =
                                            #skill{pre_cooldown = PreCooldown}})
                          when PreCooldown > 0 ->
                          add_skill_cooldown(Sid, Skill, 0, pre_cooldown);
                      (_) -> skip
                  end,
                  ActiveSkills),
    ok.

add_skill_cooldown(Fid, Skill) ->
    add_skill_cooldown(Fid, Skill, 0, cooldown).

add_skill_cooldown(Fid, Skill, RoundLimit) ->
    add_skill_cooldown(Fid, Skill, RoundLimit, cooldown).

add_skill_cooldown(Fid,
                   Skill = #c_skill{id = SkillId,
                                    skill =
                                        #skill{cooldown = Cooldown,
                                               pre_cooldown = PreCooldown}},
                   RoundLimit, Mode) ->
    logger:debug("技能进入冷却:~w", [Skill], combat_skill, 993),
    SkillId1 = skill_combat_data:get_skill_cd(SkillId),
    {GetCooldown, NewGetCooldown} = case Mode of
                                        cooldown -> {Cooldown, Cooldown + 1};
                                        _ -> {PreCooldown, PreCooldown}
                                    end,
    case GetCooldown > 0 orelse RoundLimit =:= 1 of
        true ->
            case combat_cache:f(by_id, Fid) of
                F = #fighter{name = _Name, type = Type,
                             skill_cooldown = Cds}
                    when Type =:= 1 orelse
                             Type =:= 3 orelse
                                 Type =:= 6 orelse
                                     Type =:= 4 orelse
                                         Type =:= 5 orelse Type =:= 2 ->
                    logger:debug("技能进入冷却:~w", [Skill], combat_skill, 1009),
                    case Type =:= 2 of
                        true ->
                            logger:debug("技能进入冷却:~w",
                                         [Skill],
                                         combat_skill,
                                         1012),
                            add_common_skill_cooldown(F, Skill);
                        _ -> skip
                    end,
                    case lists:keyfind(SkillId1, 1, Cds) of
                        {SkillId1, TimeLeft} when TimeLeft > 0 -> ignore;
                        _ ->
                            Cds1 = lists:keystore(SkillId1,
                                                  1,
                                                  Cds,
                                                  {SkillId1, NewGetCooldown}),
                            combat_cache:u(F#fighter{skill_cooldown = Cds1})
                    end;
                _ -> skip
            end;
        false ->
            case combat_cache:f(by_id, Fid) of
                F = #fighter{type = Type} when Type =:= 2 ->
                    add_common_skill_cooldown(F, Skill);
                _ -> skip
            end
    end.

add_common_skill_cooldown(#fighter{type = 2},
                          #c_skill{id = SkillId, skill = #skill{}}) ->
    [Round, CommonCooldown] =
        combat_cache:get_context_elem([#combat_context.round,
                                       #combat_context.common_cooldown]),
    case skill_combat_data:get_common_cd(SkillId) of
        {CDSkillId, CdRound, _Times} ->
            case lists:keyfind(CDSkillId, 1, CommonCooldown) of
                {_, BeginRound, UseTimes} ->
                    case Round - BeginRound < CdRound of
                        true ->
                            NewData = {CDSkillId, BeginRound, UseTimes + 1},
                            NewCommonCooldown = lists:keystore(CDSkillId,
                                                               1,
                                                               CommonCooldown,
                                                               NewData),
                            logger:debug("公共CD数据:~w",
                                         [NewCommonCooldown],
                                         combat_skill,
                                         1046),
                            combat_cache:save_context([{#combat_context.common_cooldown,
                                                        NewCommonCooldown}]);
                        _ ->
                            NewData = {CDSkillId, Round, 1},
                            NewCommonCooldown = lists:keystore(CDSkillId,
                                                               1,
                                                               CommonCooldown,
                                                               NewData),
                            logger:debug("公共CD数据:~w",
                                         [NewCommonCooldown],
                                         combat_skill,
                                         1051),
                            combat_cache:save_context([{#combat_context.common_cooldown,
                                                        NewCommonCooldown}])
                    end;
                _ ->
                    Data = {CDSkillId, Round, 1},
                    NewCommonCooldown = [Data | CommonCooldown],
                    logger:debug("公共CD数据:~w",
                                 [NewCommonCooldown],
                                 combat_skill,
                                 1057),
                    combat_cache:save_context([{#combat_context.common_cooldown,
                                                NewCommonCooldown}])
            end;
        _ -> skip
    end;
add_common_skill_cooldown(_F, _Cs) -> skip.

get_skill_cooldown_info(Fid) ->
    case combat_cache:f(by_id, Fid) of
        #fighter{active_skills = ActiveSkills,
                 skill_cooldown = Cds} ->
            do_get_skill_cooldown_info(ActiveSkills, Cds, []);
        _ -> []
    end.

get_summon_skill_cooldown_info(Fid) ->
    case combat_cache:f(by_master_id, Fid) of
        #fighter{active_skills = ActiveSkills,
                 skill_cooldown = Cds} ->
            do_get_skill_cooldown_info(ActiveSkills, Cds, []);
        _ -> []
    end.

do_get_skill_cooldown_info([], _, Result) -> Result;
do_get_skill_cooldown_info([#c_skill{id = SkillId} | T],
                           Cds, Result) ->
    case lists:keyfind(SkillId, 1, Cds) of
        {SkillId, CdTimeLeft} ->
            do_get_skill_cooldown_info(T,
                                       Cds,
                                       [{SkillId, CdTimeLeft} | Result]);
        _ -> do_get_skill_cooldown_info(T, Cds, Result)
    end.

skill_cooldown_reduce(Fid) ->
    skill_cooldown_reduce(Fid, 1).

skill_cooldown_reduce(Fid, CdReduce) ->
    case combat_cache:f(by_id, Fid) of
        F = #fighter{type = Type, id = _Id,
                     skill_cooldown = Cds}
            when Type =:= 1 orelse
                     Type =:= 4 orelse
                         Type =:= 3 orelse
                             Type =:= 6 orelse Type =:= 5 orelse Type =:= 2 ->
            Cds1 = [{SkillId,
                     util:check_min(CdTimeLeft - CdReduce, 0)}
                    || {SkillId, CdTimeLeft} <- Cds],
            combat_cache:u(F#fighter{skill_cooldown = Cds1});
        _ -> ignore
    end.

can_use_skill(Skill, Self = #fighter{id = Sid},
              Target = #fighter{id = Tid, is_die = IsDie}) ->
    {SelfMode, TargetMode} = skill_mode(Self, Skill),
    SkillMode = case Sid =:= Tid of
                    true -> SelfMode;
                    false -> TargetMode
                end,
    case IsDie of
        1 ->
            case lists:member(SkillMode, [die, all]) of
                true -> can_revive(Target);
                false -> 0
            end;
        0 ->
            case lists:member(SkillMode, [all, live]) of
                true -> 1;
                false -> 0
            end
    end.

skill_mode(#fighter{},
           #c_skill{skill = #skill{script_id = 10004},
                    ext_args = [{item_id, Citem}]}) ->
    case Citem of
        #c_item{action = Action, script_id = 40003}
            when Action =/= undefined ->
            {die, die};
        _Err -> {live, live}
    end;
skill_mode(_,
           #c_skill{use_type = {SelfMode, TargetMode}}) ->
    {SelfMode, TargetMode}.

can_revive(#fighter{is_die = 1,
                    special_attr =
                        #special_attr{has_ghost = 0, ghosting = 0},
                    special_status = #special_status{cannot_revive = 0},
                    is_die_disappear = 0}) ->
    1;
can_revive(_) -> 0.

get_dmg_ratio(#c_skill{skill =
                           #skill{dmg_ratio = DmgRatioList}},
              ActionNo)
    when is_list(DmgRatioList) ->
    case length(DmgRatioList) >= ActionNo of
        true -> lists:nth(ActionNo, DmgRatioList);
        false -> lists:last(DmgRatioList)
    end;
get_dmg_ratio(#c_skill{skill =
                           #skill{dmg_ratio = DmgRatio}},
              _ActionNo) ->
    DmgRatio.

is_illegal_auto_skill(SkillId) ->
    lists:member(SkillId,
                 [1001, 1002, 1003, 1004, 1005, 1006, 1008, 1009]).

limit_skill(weakness) -> [1002, 1004, 1005, 1008, 1009];
limit_skill(stun) -> [1005];
limit_skill(silent) ->
    [1000,
     1001,
     1002,
     1003,
     1004,
     1005,
     1008,
     1009,
     1101,
     1102,
     1103,
     1104,
     1105];
limit_skill(rest) -> [1002, 1004, 1005, 1008, 1009];
limit_skill(seal) ->
    [1001, 1002, 1003, 1004, 1005, 1008, 1009];
limit_skill(tempt) ->
    [1001, 1002, 1003, 1004, 1005, 1008, 1009];
limit_skill(cannot_use_skill) ->
    [1000, 1001, 1002, 1003, 1004, 1005, 1008, 1009, 60526];
limit_skill(_) -> [].

is_multi_skill(Skill, Self) ->
    Skill1 =
        combat_script_skill_ext:exec_trigger_before(Skill,
                                                    Self,
                                                    #fighter{}),
    is_multi_skill(Skill1).

is_multi_skill(#c_skill{skill =
                            #skill{name = _SkillName,
                                   target_list = TargetList}}) ->
    case [1 || {_, _, Num} <- TargetList, Num > 1] of
        [] -> false;
        _ -> true
    end.

can_pursue_attack(#c_skill{skill =
                               #skill{attack_type = 1}}) ->
    false;
can_pursue_attack(Skill) ->
    case is_multi_skill(Skill) of
        false -> true;
        true -> false
    end.

get_default_skill(#fighter{base_id = BaseId,
                           type = Type, active_skills = ActiveSkills,
                           classes = Classes}) ->
    BaseSkill = base_skill(Type, BaseId, Classes),
    case lists:keyfind(BaseSkill, #c_skill.id, ActiveSkills)
        of
        false ->
            Cskill = #c_skill{skill =
                                  Skill = #skill{attack_type = AttackType}} =
                         combat_script_skill:to_combat_skill({1000, 1}),
            NewAttackType = combat_util:classes_to_attack_type(Type,
                                                               Classes,
                                                               AttackType),
            Cskill#c_skill{skill =
                               Skill#skill{attack_type = NewAttackType}};
        Cskill1 = #c_skill{skill =
                               Skill1 = #skill{attack_type = AttackType}} ->
            NewAttackType = combat_util:classes_to_attack_type(Type,
                                                               Classes,
                                                               AttackType),
            Cskill1#c_skill{skill =
                                Skill1#skill{attack_type = NewAttackType}}
    end.

get_basic_skills(CombatType, 1, BaseId, Classes) ->
    BaseSkill = base_skill(1, BaseId, Classes),
    L = case CombatType of
            52 -> [];
            112 -> [BaseSkill, 1001, 1003, 1004, 1008, 1009];
            7 -> [BaseSkill, 1001, 1003, 1004, 1006, 1008, 1009];
            51 -> [BaseSkill, 1001, 1003, 1004, 1006, 1008, 1009];
            102 -> [BaseSkill, 1001, 1003, 1004, 1006, 1008, 1009];
            104 -> [BaseSkill, 1001, 1003, 1004, 1006, 1008, 1009];
            106 -> [BaseSkill, 1001, 1003, 1004, 1006, 1008, 1009];
            107 -> [BaseSkill, 1001, 1003, 1004, 1006, 1008, 1009];
            41 -> [BaseSkill, 1001, 1003, 1004, 1006, 1008, 1009];
            2 -> [BaseSkill, 1001, 1003, 1004, 1006, 1008, 1009];
            103 -> [BaseSkill, 1001, 1003, 1004, 1006, 1008, 1009];
            105 -> [BaseSkill, 1001, 1003, 1004, 1006, 1008, 1009];
            35 -> [BaseSkill, 1001, 1003, 1004, 1006, 1008, 1009];
            37 -> [BaseSkill, 1001, 1003, 1004, 1006, 1008, 1009];
            40 -> [BaseSkill, 1001, 1003, 1004, 1006, 1008, 1009];
            58 -> [BaseSkill, 1001, 1003, 1004, 1006, 1008, 1009];
            108 -> [BaseSkill, 1001, 1003, 1004, 1006, 1008, 1009];
            46 -> [BaseSkill, 1001, 1003, 1004, 1006, 1008, 1009];
            49 -> [BaseSkill, 1001, 1003, 1004, 1006];
            110 -> [BaseSkill, 1001, 1003, 1004, 1006, 1008, 1009];
            111 -> [BaseSkill, 1001, 1003, 1004, 1006, 1008, 1009];
            113 -> [BaseSkill, 1001, 1003, 1004, 1006, 1008, 1009];
            56 -> [BaseSkill, 1001, 1003, 1004, 1006, 1008, 1009];
            114 -> [BaseSkill, 1001, 1003, 1004, 1006, 1008, 1009];
            62 -> [BaseSkill, 1001, 1003, 1004, 1006, 1008, 1009];
            70 -> [BaseSkill, 1001, 1003, 1004, 1006, 1008, 1009];
            116 -> [BaseSkill, 1001, 1003, 1004, 1006, 1008, 1009];
            _ ->
                [BaseSkill, 1001, 1002, 1003, 1004, 1006, 1008, 1009]
        end,
    lists:foldl(fun (Id, List) ->
                        case combat_script_skill:to_combat_skill({Id, 1}) of
                            Cskill = #c_skill{} -> [Cskill | List];
                            _ -> List
                        end
                end,
                [],
                L);
get_basic_skills(_, 3, BaseId, Classes) ->
    BaseSkill = base_skill(3, BaseId, Classes),
    L = [BaseSkill, 1001, 1002, 1003, 1004],
    lists:foldl(fun (Id, List) ->
                        case combat_script_skill:to_combat_skill({Id, 1}) of
                            Cskill = #c_skill{} -> [Cskill | List];
                            _ -> List
                        end
                end,
                [],
                L);
get_basic_skills(_, 6, BaseId, Classes) ->
    BaseSkill = base_skill(6, BaseId, Classes),
    L = [BaseSkill, 1001, 1002, 1003, 1004],
    lists:foldl(fun (Id, List) ->
                        case combat_script_skill:to_combat_skill({Id, 1}) of
                            Cskill = #c_skill{} -> [Cskill | List];
                            _ -> List
                        end
                end,
                [],
                L);
get_basic_skills(CombatType, 4, BaseId, Classes) ->
    BaseSkill = base_skill(4, BaseId, Classes),
    L = case CombatType of
            100 ->
                [BaseSkill, 1001, 1002, 1003, 1005, 1007, 1008, 1009];
            11 ->
                [BaseSkill, 1001, 1002, 1003, 1005, 1007, 1008, 1009];
            _ -> [BaseSkill, 1001, 1002, 1003, 1005, 1007]
        end,
    lists:foldl(fun (Id, List) ->
                        case combat_script_skill:to_combat_skill({Id, 1}) of
                            Cskill = #c_skill{} -> [Cskill | List];
                            _ -> List
                        end
                end,
                [],
                L);
get_basic_skills(_, FighterType, BaseId, Classes) ->
    BaseSkill = base_skill(FighterType, BaseId, Classes),
    L = [BaseSkill, 1001, 1002, 1003, 1005, 1007],
    lists:foldl(fun (Id, List) ->
                        case combat_script_skill:to_combat_skill({Id, 1}) of
                            Cskill = #c_skill{} -> [Cskill | List];
                            _ -> List
                        end
                end,
                [],
                L).

base_skill(#fighter{type = 3, base_id = 10035,
                    passive_skills = PassiveSkills}) ->
    case combat_cache:f(by_script_id, PassiveSkills, 60164)
        of
        #c_skill{skill = #skill{script_args = [_, SkillId]}} ->
            SkillId;
        _ -> 1000
    end;
base_skill(#fighter{type = Type, classes = Classes,
                    base_id = BaseId}) ->
    base_skill(Type, BaseId, Classes).

base_skill(Type, _BaseId, Classes)
    when Type =:= 1 orelse Type =:= 4 ->
    case Classes of
        1 -> 1101;
        2 -> 1102;
        3 -> 1103;
        4 -> 1104;
        5 -> 1105;
        6 -> 1106;
        7 -> 1126;
        _ -> 1000
    end;
base_skill(Type, BaseId, _Classes) when Type =:= 5 ->
    case guard_data:get_guard_cfg(BaseId) of
        #guard_data{normal_atk_id = NormalId} -> NormalId;
        _ -> 1000
    end;
base_skill(2, _BaseId, Classes) ->
    case Classes of
        1 -> 1101;
        2 -> 1102;
        3 -> 1103;
        4 -> 1104;
        5 -> 1105;
        6 -> 1106;
        7 -> 1126;
        _ -> 1000
    end;
base_skill(_FighterType, _BaseId, _Classes) -> 1000.

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

get_plot_skills(#fighter{classes = Classes,
                         type = 1}) ->
    case get(plot_add_skills) of
        L = [_ | _] ->
            L1 = [List
                  || {C, List} <- L, C =:= Classes orelse C =:= 0],
            L2 = lists:flatten(L1),
            [{SkillId, 1} || SkillId <- L2];
        _ -> []
    end;
get_plot_skills(_) -> [].

merge_talent([], SkillTalents) -> SkillTalents;
merge_talent([{Id, TalentList} | T], SkillTalents) ->
    case lists:keyfind(Id, 1, SkillTalents) of
        {_, OldTalentList} ->
            SkillTalents1 = lists:keystore(Id,
                                           1,
                                           SkillTalents,
                                           {Id, OldTalentList ++ TalentList}),
            merge_talent(T, SkillTalents1);
        _ -> merge_talent(T, [{Id, TalentList} | SkillTalents])
    end;
merge_talent([_ | T], SkillTalents) ->
    merge_talent(T, SkillTalents).

modify_by_talent(Skills, []) -> Skills;
modify_by_talent(Skills, SkillTalents) ->
    SkillTalents1 = merge_talent(SkillTalents, []),
    modify_by_talent(Skills, SkillTalents1, []).

modify_by_talent([], _, Result) ->
    lists:reverse(Result);
modify_by_talent([Skill = #c_skill{id = Id} | T],
                 Talents, Result) ->
    case lists:keyfind(Id, 1, Talents) of
        false -> modify_by_talent(T, Talents, [Skill | Result]);
        {_, TalentList} ->
            NewSkill = do_modify_by_talent(Skill, TalentList),
            modify_by_talent(T, Talents, [NewSkill | Result])
    end.

do_modify_by_talent(Skill = #c_skill{}, TalentList)
    when is_list(TalentList) ->
    #{cd := CdTalent, self_buff := SBuffTalent,
      target_buff := TBuffTalent,
      skill_before := BeforeTalent,
      skill_after := AfterTalent, times := TimesTalent,
      num := NumTalent, dmg_ratio := DmgTalent,
      hit_ratio := HitTalent, script := ScriptTalent,
      update_script := UpdateScript, self_cond := CondTalent,
      self_loss := LossTalent,
      special_type := SpecialTypeTalent} =
        split_talent(TalentList),
    do_do_modify_by_talent(Skill,
                           [{cd, CdTalent},
                            {self_buff, SBuffTalent},
                            {target_buff, TBuffTalent},
                            {skill_before, BeforeTalent},
                            {skill_after, AfterTalent},
                            {times, TimesTalent},
                            {num, NumTalent},
                            {dmg, DmgTalent},
                            {hit, HitTalent},
                            {script, ScriptTalent},
                            {update_script, UpdateScript},
                            {self_cond, CondTalent},
                            {self_loss, LossTalent},
                            {special_type, SpecialTypeTalent}]);
do_modify_by_talent(Skill, _) -> Skill.

split_talent(TalentList) ->
    split_talent(TalentList,
                 #{cd => 0, dmg_ratio => 0, hit_ratio => 0,
                   self_buff => {[], [], []}, target_buff => [],
                   skill_before => {[], []}, skill_after => {[], []},
                   times => {0, []}, num => [], script => {undefined, []},
                   update_script => [], self_cond => [], self_loss => [],
                   special_type => []}).

split_talent([], MapTalent) -> MapTalent;
split_talent([{2, [Cd]} | T],
             MapTalent = #{cd := CdTalent}) ->
    split_talent(T, MapTalent#{cd := CdTalent + Cd});
split_talent([{1, [Cd]} | T],
             MapTalent = #{cd := CdTalent}) ->
    split_talent(T, MapTalent#{cd := CdTalent - Cd});
split_talent([{11, [Dmg]} | T],
             MapTalent = #{dmg_ratio := DmgTalent}) ->
    split_talent(T,
                 MapTalent#{dmg_ratio := DmgTalent + Dmg});
split_talent([{12, [Hit]} | T],
             MapTalent = #{hit_ratio := HitTalent}) ->
    split_talent(T,
                 MapTalent#{hit_ratio := HitTalent + Hit});
split_talent([{3, [CleanBuff, UpdateBuff, AddBuff]}
              | T],
             MapTalent = #{self_buff :=
                               {CleanBuff1, UpdateBuff1, AddBuff1}}) ->
    NewCleanBuff = lists:usort(CleanBuff ++ CleanBuff1),
    NewUpdateBuff = UpdateBuff1 ++ UpdateBuff,
    NewAddBuff = AddBuff1 ++ AddBuff,
    split_talent(T,
                 MapTalent#{self_buff :=
                                {NewCleanBuff, NewUpdateBuff, NewAddBuff}});
split_talent([{4,
               [Flag, CleanBuff, UpdateBuff, AddBuff]}
              | T],
             MapTalent = #{target_buff := TargetBuffList}) ->
    NewTargetBuffList = case lists:keyfind(Flag,
                                           1,
                                           TargetBuffList)
                            of
                            {_, CleanBuff1, UpdateBuff1, AddBuff1} ->
                                NewCleanBuff = lists:usort(CleanBuff ++
                                                               CleanBuff1),
                                NewUpdateBuff = UpdateBuff1 ++ UpdateBuff,
                                NewAddBuff = AddBuff1 ++ AddBuff,
                                lists:keystore(Flag,
                                               1,
                                               TargetBuffList,
                                               {Flag,
                                                NewCleanBuff,
                                                NewUpdateBuff,
                                                NewAddBuff});
                            _ ->
                                [{Flag, CleanBuff, UpdateBuff, AddBuff}
                                 | TargetBuffList]
                        end,
    split_talent(T,
                 MapTalent#{target_buff := NewTargetBuffList});
split_talent([{5, [CleanB, UpdateB]} | T],
             MapTalent = #{skill_before := {CleanB1, UpdateB1}}) ->
    NewCleanB = lists:usort(CleanB ++ CleanB1),
    NewUpdateB = UpdateB ++ UpdateB1,
    split_talent(T,
                 MapTalent#{skill_before := {NewCleanB, NewUpdateB}});
split_talent([{6, [CleanA, UpdateA]} | T],
             MapTalent = #{skill_after := {CleanA1, UpdateA1}}) ->
    NewCleanA = lists:usort(CleanA ++ CleanA1),
    NewUpdateA = UpdateA ++ UpdateA1,
    split_talent(T,
                 MapTalent#{skill_after := {NewCleanA, NewUpdateA}});
split_talent([{7, [Num, TargetList]} | T],
             MapTalent = #{times := {Num1, TargetList1}}) ->
    NewNum = Num + Num1,
    NewTargetList = TargetList1 ++ TargetList,
    split_talent(T,
                 MapTalent#{times := {NewNum, NewTargetList}});
split_talent([{8, [Num]} | T],
             MapTalent = #{times := {Num1, TargetList1}}) ->
    NewNum = Num1 - Num,
    NewTargetList = case NewNum > 0 of
                        true -> lists:sublist(TargetList1, NewNum);
                        false -> []
                    end,
    split_talent(T,
                 MapTalent#{times := {NewNum, NewTargetList}});
split_talent([{9, [Flag, Num]} | T],
             MapTalent = #{num := NumList}) ->
    NewNumList = case lists:keyfind(Flag, 1, NumList) of
                     {_, Num1} ->
                         lists:keystore(Flag, 1, NumList, {Flag, Num + Num1});
                     _ -> [{Flag, Num} | NumList]
                 end,
    split_talent(T, MapTalent#{num := NewNumList});
split_talent([{10, [Flag, Num]} | T],
             MapTalent = #{num := NumList}) ->
    NewNumList = case lists:keyfind(Flag, 1, NumList) of
                     {_, Num1} ->
                         lists:keystore(Flag, 1, NumList, {Flag, Num1 - Num});
                     _ -> [{Flag, -Num} | NumList]
                 end,
    split_talent(T, MapTalent#{num := NewNumList});
split_talent([{13, [ScriptId, Args]} | T], MapTalent) ->
    split_talent(T, MapTalent#{script := {ScriptId, Args}});
split_talent([{14, [ScriptList]} | T],
             MapTalent = #{update_script := ScriptList1}) ->
    split_talent(T,
                 MapTalent#{update_script := ScriptList ++ ScriptList1});
split_talent([{15, [SelfCond]} | T],
             MapTalent = #{self_cond := SelfCond1}) ->
    split_talent(T,
                 MapTalent#{self_cond := SelfCond ++ SelfCond1});
split_talent([{16, [SelfLoss]} | T],
             MapTalent = #{self_loss := SelfLoss1}) ->
    split_talent(T,
                 MapTalent#{self_loss := SelfLoss ++ SelfLoss1});
split_talent([{17, [SpecialType]} | T],
             MapTalent = #{special_type := SpecialType1}) ->
    split_talent(T,
                 MapTalent#{special_type :=
                                [SpecialType | SpecialType1]});
split_talent([Err | T], MapTalent) ->
    logger:error("无法匹配的天赋属性:~w", [Err], combat_skill, 1563),
    split_talent(T, MapTalent).

do_do_modify_by_talent(Skill, []) -> Skill;
do_do_modify_by_talent(Skill, [{Key, Val} | T]) ->
    Skill1 = do_do_modify_by_talent(Skill, Key, Val),
    do_do_modify_by_talent(Skill1, T).

do_do_modify_by_talent(Skill, cd, 0) -> Skill;
do_do_modify_by_talent(Skill, dmg, 0) -> Skill;
do_do_modify_by_talent(Skill, hit, 0) -> Skill;
do_do_modify_by_talent(Skill, self_buff, {[], []}) ->
    Skill;
do_do_modify_by_talent(Skill, target_buff, {[], []}) ->
    Skill;
do_do_modify_by_talent(Skill, skill_before, {[], []}) ->
    Skill;
do_do_modify_by_talent(Skill, skill_after, {[], []}) ->
    Skill;
do_do_modify_by_talent(Skill, times, {0, []}) -> Skill;
do_do_modify_by_talent(Skill, num, {[]}) -> Skill;
do_do_modify_by_talent(Skill, script,
                       {undefined, []}) ->
    Skill;
do_do_modify_by_talent(Skill, update_script, []) ->
    Skill;
do_do_modify_by_talent(Skill, self_cond, []) -> Skill;
do_do_modify_by_talent(Skill, self_loss, []) -> Skill;
do_do_modify_by_talent(Skill, special_type, []) ->
    Skill;
do_do_modify_by_talent(Skill = #c_skill{skill =
                                            S = #skill{cooldown = Cd}},
                       cd, CdTalent)
    when is_integer(CdTalent) ->
    NewCd = max(0, Cd + CdTalent),
    Skill#c_skill{skill = S#skill{cooldown = NewCd}};
do_do_modify_by_talent(Skill = #c_skill{skill =
                                            S = #skill{dmg_ratio = DmgRatio}},
                       dmg, DmgTalent)
    when is_list(DmgRatio) ->
    NewDmgRatio = [V + DmgTalent || V <- DmgRatio],
    Skill#c_skill{skill = S#skill{dmg_ratio = NewDmgRatio}};
do_do_modify_by_talent(Skill = #c_skill{skill =
                                            S = #skill{acc_ratio = AccRatio}},
                       hit, HitTalent)
    when is_integer(AccRatio) ->
    NewAccRatio = AccRatio + HitTalent,
    Skill#c_skill{skill = S#skill{acc_ratio = NewAccRatio}};
do_do_modify_by_talent(Skill = #c_skill{skill =
                                            S = #skill{buff_self = BuffSelf}},
                       self_buff, {DelB, UpdateBuff, AddBuff}) ->
    UpdateBuff1 =
        combat_script_buff:convert_buff(UpdateBuff),
    AddBuff1 = combat_script_buff:convert_buff(AddBuff),
    NewUpdateBuff = [Buff
                     || Buff = #c_buff{id = BuffId} <- UpdateBuff1,
                        not lists:member(BuffId, DelB)],
    NewAddBuff = [Buff
                  || Buff = #c_buff{id = BuffId} <- AddBuff1,
                     not lists:member(BuffId, DelB)],
    BuffSelf1 = [Buff
                 || Buff = #c_buff{id = BuffId} <- BuffSelf,
                    not lists:member(BuffId, DelB)],
    BuffSelf2 = merge_buff(BuffSelf1, NewUpdateBuff),
    BuffSelf3 = BuffSelf2 ++ NewAddBuff,
    Skill#c_skill{skill = S#skill{buff_self = BuffSelf3}};
do_do_modify_by_talent(Skill = #c_skill{skill =
                                            S = #skill{buff_target =
                                                           BuffTarget}},
                       target_buff, BuffTarget1) ->
    NewBuffTarget = lists:foldl(fun ({Flag,
                                      DelT,
                                      UpdateT,
                                      AddT},
                                     BuffT) ->
                                        UpdateT1 =
                                            combat_script_buff:convert_buff(UpdateT),
                                        AddT1 =
                                            combat_script_buff:convert_buff(AddT),
                                        Len = length(BuffT),
                                        case Flag =< Len of
                                            true ->
                                                BuffList = lists:nth(Flag,
                                                                     BuffT),
                                                NewUpdateT = [Buff
                                                              || Buff =
                                                                     #c_buff{id
                                                                                 =
                                                                                 BuffId}
                                                                     <- UpdateT1,
                                                                 not
                                                                     lists:member(BuffId,
                                                                                  DelT)],
                                                NewAddT = [Buff
                                                           || Buff = #c_buff{id
                                                                                 =
                                                                                 BuffId}
                                                                  <- AddT1,
                                                              not
                                                                  lists:member(BuffId,
                                                                               DelT)],
                                                BuffList1 = [Buff
                                                             || Buff =
                                                                    #c_buff{id =
                                                                                BuffId}
                                                                    <- BuffList,
                                                                not
                                                                    lists:member(BuffId,
                                                                                 DelT)],
                                                BuffList2 =
                                                    merge_buff(BuffList1,
                                                               NewUpdateT),
                                                BuffList3 = BuffList2 ++
                                                                NewAddT,
                                                util:update_list(Flag,
                                                                 BuffT,
                                                                 BuffList3);
                                            _ ->
                                                NewAddT = [Buff
                                                           || Buff = #c_buff{id
                                                                                 =
                                                                                 BuffId}
                                                                  <- AddT1,
                                                              not
                                                                  lists:member(BuffId,
                                                                               DelT)],
                                                BuffT ++ [NewAddT]
                                        end
                                end,
                                BuffTarget,
                                BuffTarget1),
    Skill#c_skill{skill =
                      S#skill{buff_target = NewBuffTarget}};
do_do_modify_by_talent(Skill = #c_skill{id = SkillId,
                                        skill =
                                            S = #skill{addt_scripts =
                                                           AddtScripts}},
                       skill_before, {DelB, UpdateB}) ->
    NewUpdateB = [{Sid, Args}
                  || {Sid, Args} <- UpdateB, not lists:member(Sid, DelB)],
    AddtScripts1 = [{Type, Sid, Args}
                    || {Type, Sid, Args} <- AddtScripts,
                       not lists:member(Sid, DelB)],
    AddtScripts2 = case SkillId =:= 50003 of
                       true -> add_addt_script(AddtScripts1, 1, NewUpdateB);
                       _ -> merge_addt_script(AddtScripts1, 1, NewUpdateB)
                   end,
    combat_script_skill_ext:append_trigger(Skill#c_skill{skill
                                                             =
                                                             S#skill{addt_scripts
                                                                         =
                                                                         AddtScripts2}});
do_do_modify_by_talent(Skill = #c_skill{skill =
                                            S = #skill{addt_scripts =
                                                           AddtScripts}},
                       skill_after, {DelA, UpdateA}) ->
    NewUpdateA = [{Sid, Args}
                  || {Sid, Args} <- UpdateA, not lists:member(Sid, DelA)],
    AddtScripts1 = [{Type, Sid, Args}
                    || {Type, Sid, Args} <- AddtScripts,
                       not lists:member(Sid, DelA)],
    AddtScripts2 = merge_addt_script(AddtScripts1,
                                     2,
                                     NewUpdateA),
    combat_script_skill_ext:append_trigger(Skill#c_skill{skill
                                                             =
                                                             S#skill{addt_scripts
                                                                         =
                                                                         AddtScripts2}});
do_do_modify_by_talent(Skill = #c_skill{skill =
                                            S = #skill{attack_times =
                                                           AttackTimes,
                                                       target_list =
                                                           TargetList}},
                       times, {Num, TargetList1}) ->
    {NewAttackTimes, NewTargetList} = case Num > 0 of
                                          true ->
                                              AttackTimes1 = AttackTimes + Num,
                                              TargetList2 =
                                                  merge_target_list(AttackTimes1,
                                                                    TargetList,
                                                                    TargetList1),
                                              {AttackTimes1, TargetList2};
                                          false ->
                                              AttackTimes1 = max(1,
                                                                 AttackTimes +
                                                                     Num),
                                              TargetList2 =
                                                  lists:sublist(TargetList,
                                                                AttackTimes1),
                                              {AttackTimes1, TargetList2}
                                      end,
    Skill#c_skill{skill =
                      S#skill{attack_times = NewAttackTimes,
                              target_list = NewTargetList}};
do_do_modify_by_talent(Skill = #c_skill{skill =
                                            S = #skill{target_list =
                                                           TargetList}},
                       num, NumList) ->
    NewTargetList = merge_num_list(TargetList, NumList),
    Skill#c_skill{skill =
                      S#skill{target_list = NewTargetList}};
do_do_modify_by_talent(Skill = #c_skill{skill =
                                            S = #skill{script_args = OldArgs}},
                       script, {ScriptId, Args}) ->
    NewArgs = merge_script_args(OldArgs, Args),
    NewS = S#skill{script_id = ScriptId,
                   script_args = NewArgs},
    NewSkill = Skill#c_skill{skill = NewS},
    case
        combat_script_skill:to_combat_skill(NewSkill#c_skill{skill
                                                                 =
                                                                 NewS#skill{buff_self
                                                                                =
                                                                                [],
                                                                            buff_target
                                                                                =
                                                                                []}})
        of
        #c_skill{action = NewAction} ->
            NewSkill#c_skill{action = NewAction};
        _ -> Skill
    end;
do_do_modify_by_talent(Skill = #c_skill{skill =
                                            S = #skill{script_id = Script,
                                                       script_args = Args}},
                       update_script, UpdateScript) ->
    NewArgs = update_script_args(Script,
                                 Args,
                                 UpdateScript),
    Skill#c_skill{skill = S#skill{script_args = NewArgs}};
do_do_modify_by_talent(Skill = #c_skill{skill =
                                            S = #skill{self_cond = SelfCond}},
                       self_cond, CondTalent) ->
    NewSelfCond = merge_self_cond(SelfCond, CondTalent),
    Skill#c_skill{skill = S#skill{self_cond = NewSelfCond}};
do_do_modify_by_talent(Skill = #c_skill{skill =
                                            S = #skill{self_loss = SelfLoss}},
                       self_loss, LossTalent) ->
    NewSelfLoss = merge_self_loss(SelfLoss, LossTalent),
    Skill#c_skill{skill = S#skill{self_loss = NewSelfLoss}};
do_do_modify_by_talent(Skill = #c_skill{special_type =
                                            OldSpecialType},
                       special_type, SpecialType) ->
    Skill#c_skill{special_type =
                      OldSpecialType ++ SpecialType};
do_do_modify_by_talent(Skill, _Err, _) ->
    logger:error("未知的天赋技能处理:~w",
                 [_Err],
                 combat_skill,
                 1703),
    Skill.

merge_buff(BuffList, []) -> BuffList;
merge_buff(BuffList,
           [#c_buff{id = BuffId, duration = Duration1,
                    args = BuffArgs, hit_rate = HitRate}
            | T]) ->
    case lists:keyfind(BuffId, #c_buff.id, BuffList) of
        false -> merge_buff(BuffList, T);
        OldBuff = #c_buff{duration = Duration,
                          duration_left = DurationLeft, args = OldBuffArgs,
                          hit_rate = OldHitRate}
            when length(OldBuffArgs) =:= length(BuffArgs) ->
            {NewDuration, NewDurationLeft} = case Duration of
                                                 0 -> {Duration, DurationLeft};
                                                 _ ->
                                                     {Duration + Duration1,
                                                      DurationLeft + Duration1}
                                             end,
            NewHitRate = HitRate + OldHitRate,
            NewArgs = merge_list_val(OldBuffArgs, BuffArgs),
            NewBuffList = lists:keystore(BuffId,
                                         #c_buff.id,
                                         BuffList,
                                         OldBuff#c_buff{hit_rate = NewHitRate,
                                                        args = NewArgs,
                                                        duration = NewDuration,
                                                        duration_left =
                                                            NewDurationLeft}),
            merge_buff(NewBuffList, T);
        #c_buff{args = OldBuffArgs} ->
            logger:error("无法合并buff参数BuffId:~w, BuffArgs:~w, OldBuffArgs"
                         ":~w, Stack:~w",
                         [BuffId, BuffArgs, OldBuffArgs, util:get_stacktrace()],
                         combat_skill,
                         1725),
            merge_buff(BuffList, T)
    end.

merge_addt_script(Scripts, _Flag, []) -> Scripts;
merge_addt_script(Scripts, Flag,
                  [{ScriptId, Args} | T]) ->
    case lists:keyfind(ScriptId, 2, Scripts) of
        {Flag1, _, Args1} ->
            NewArgs = merge_list_val2(Args1, Args),
            NewScripts = lists:keystore(ScriptId,
                                        2,
                                        Scripts,
                                        {Flag1, ScriptId, NewArgs}),
            merge_addt_script(NewScripts, Flag, T);
        _ ->
            NewScripts = Scripts ++ [{Flag, ScriptId, Args}],
            merge_addt_script(NewScripts, Flag, T)
    end.

add_addt_script(Scripts, _Flag, []) -> Scripts;
add_addt_script(Scripts, Flag,
                [{ScriptId, Args} | T]) ->
    NewScripts = Scripts ++ [{Flag, ScriptId, Args}],
    add_addt_script(NewScripts, Flag, T);
add_addt_script(Scripts, Flag, [_ | T]) ->
    add_addt_script(Scripts, Flag, T).

merge_target_list(AttackTimes, TargetList,
                  AddTargetList) ->
    Len = length(TargetList),
    if Len =:= AttackTimes -> TargetList;
       Len > AttackTimes ->
           lists:sublist(TargetList, AttackTimes);
       true ->
           merge_target_list(AttackTimes,
                             Len,
                             TargetList,
                             AddTargetList)
    end.

merge_target_list(_, _, TargetList, []) -> TargetList;
merge_target_list(AttackTimes, Len, TargetList, _)
    when Len > AttackTimes ->
    TargetList;
merge_target_list(AttackTimes, Len, TargetList,
                  [{TargetMode, TargetNum} | T]) ->
    NewTargetList = TargetList ++
                        [{Len + 1, TargetMode, TargetNum}],
    merge_target_list(AttackTimes,
                      Len + 1,
                      NewTargetList,
                      T);
merge_target_list(AttackTimes, Len, TargetList,
                  [_ | T]) ->
    merge_target_list(AttackTimes, Len + 1, TargetList, T).

merge_num_list(TargetList, []) -> TargetList;
merge_num_list(TargetList, [{Flag, Num} | T]) ->
    case lists:keyfind(Flag, 1, TargetList) of
        {Flag, TargetMode, TargetNum} ->
            NewTargetNum = TargetNum + Num,
            NewTargetList = lists:keystore(Flag,
                                           1,
                                           TargetList,
                                           {Flag, TargetMode, NewTargetNum}),
            merge_num_list(NewTargetList, T);
        _ -> merge_num_list(TargetList, T)
    end.

merge_script_args(OldArgs, Args)
    when is_list(OldArgs) ->
    Len = length(OldArgs),
    merge_script_args(OldArgs, Len, Args, []);
merge_script_args(_OldArgs, Args) -> Args.

merge_script_args(_, _, [], Args) ->
    lists:reverse(Args);
merge_script_args(OldArgs, Len, [{Key, old} | T], Args)
    when Key =< Len ->
    OldVal = lists:nth(Key, OldArgs),
    merge_script_args(OldArgs, Len, T, [OldVal | Args]);
merge_script_args(OldArgs, Len, [{Key, Val} | T], Args)
    when Key =< Len ->
    OldVal = lists:nth(Key, OldArgs),
    NewVal = OldVal + Val,
    merge_script_args(OldArgs, Len, T, [NewVal | Args]);
merge_script_args(OldArgs, Len, [Val | T], Args) ->
    merge_script_args(OldArgs, Len, T, [Val | Args]).

update_script_args(_, Args, []) -> Args;
update_script_args(Script, Args, [{Script, KvList} | T])
    when is_list(Args) ->
    NewArgs = lists:foldl(fun (Kv, AList) ->
                                  case do_update_script_args(AList, Kv) of
                                      {true, NewArgs} -> NewArgs;
                                      false ->
                                          logger:error("无法更新脚本ScriptId:~w, Args:~w, KV:~w",
                                                       [Script, AList, Kv],
                                                       combat_skill,
                                                       1817),
                                          AList
                                  end
                          end,
                          Args,
                          KvList),
    update_script_args(Script, NewArgs, T);
update_script_args(Script, Args, [_ | T]) ->
    update_script_args(Script, Args, T).

do_update_script_args(Args, Kv) ->
    do_update_script_args(Args, Kv, 1, []).

do_update_script_args([], _Kv, _Num, _Args) -> false;
do_update_script_args([OldVal | T], {Key, Op, Val}, Key,
                      Args)
    when is_integer(Val) ->
    NewVal = case Op of
                 add -> OldVal + Val;
                 min -> OldVal - Val;
                 mul -> OldVal * Val;
                 'div' -> OldVal / Val;
                 set -> Val
             end,
    {true, lists:reverse([round(NewVal) | Args]) ++ T};
do_update_script_args([OldVal | T], {Key, Val}, Key,
                      Args)
    when is_list(Val) andalso is_list(OldVal) ->
    NewVal = OldVal ++ Val,
    {true, lists:reverse([NewVal | Args]) ++ T};
do_update_script_args([_OldVal | T], {Key, set, Val},
                      Key, Args) ->
    NewVal = Val,
    {true, lists:reverse([NewVal | Args]) ++ T};
do_update_script_args([H | T], Kv, Num, Args) ->
    do_update_script_args(T, Kv, Num + 1, [H | Args]).

merge_list_val(L1, L2) when length(L1) =:= length(L2) ->
    L = lists:seq(1, length(L1)),
    Fun = fun (Idx, La, Lb) ->
                  A = lists:nth(Idx, La),
                  B = lists:nth(Idx, Lb),
                  if is_integer(A) andalso is_integer(B) -> A + B;
                     is_list(A) andalso is_list(B) -> B;
                     is_tuple(A) andalso is_tuple(B) -> B;
                     true -> A
                  end
          end,
    [Fun(Idx, L1, L2) || Idx <- L];
merge_list_val(L1, L2) ->
    logger:error("2个列表数量不一样，无法合并数值:~w, ~w",
                 [L1, L2],
                 combat_skill,
                 1862),
    L1.

merge_list_val2(L1, L2)
    when length(L1) =:= length(L2) ->
    L = lists:seq(1, length(L1)),
    Fun = fun (Idx, La, Lb) ->
                  A = lists:nth(Idx, La),
                  B = lists:nth(Idx, Lb),
                  if is_integer(A) andalso is_integer(B) -> A + B;
                     is_list(A) andalso is_list(B) -> B;
                     is_tuple(A) andalso is_tuple(B) -> B;
                     true -> A
                  end
          end,
    [Fun(Idx, L1, L2) || Idx <- L];
merge_list_val2(L1, L2) when length(L1) < length(L2) ->
    Len1 = length(L1),
    L = lists:seq(1, Len1),
    Fun = fun (Idx, La, Lb) ->
                  A = lists:nth(Idx, La),
                  B = lists:nth(Idx, Lb),
                  if is_integer(A) andalso is_integer(B) -> A + B;
                     is_list(A) andalso is_list(B) -> B;
                     is_tuple(A) andalso is_tuple(B) -> B;
                     true -> A
                  end
          end,
    SubList = lists:nthtail(Len1, L2),
    [Fun(Idx, L1, L2) || Idx <- L] ++ SubList;
merge_list_val2(L1, L2) ->
    logger:error("2个列表数量不一样，无法合并数值:~w, ~w",
                 [L1, L2],
                 combat_skill,
                 1895),
    L1.

merge_self_cond(SelfCond, []) -> SelfCond;
merge_self_cond(SelfCond, [{Label, Op1, Val} | T]) ->
    case lists:keyfind(Label, 1, SelfCond) of
        {Label, Op, OldVal} ->
            NewVal = case Op1 of
                         add -> OldVal + Val;
                         min -> OldVal - Val;
                         mul -> OldVal * Val;
                         'div' -> OldVal / Val;
                         set -> Val
                     end,
            NewSelfCond = lists:keystore(Label,
                                         1,
                                         SelfCond,
                                         {Label, Op, NewVal}),
            merge_self_cond(NewSelfCond, T);
        _ -> merge_self_cond(SelfCond, T)
    end.

merge_self_loss(SelfLoss, []) -> SelfLoss;
merge_self_loss(SelfLoss, [{Label, Op1, Val} | T]) ->
    case lists:keyfind(Label, 1, SelfLoss) of
        {Label, OldVal} ->
            NewVal = case Op1 of
                         add -> OldVal + Val;
                         min -> OldVal - Val;
                         mul -> OldVal * Val;
                         'div' -> OldVal / Val;
                         set -> Val
                     end,
            NewSelfLoss = lists:keystore(Label,
                                         1,
                                         SelfLoss,
                                         {Label, NewVal}),
            merge_self_loss(NewSelfLoss, T);
        _ -> merge_self_loss(SelfLoss, T)
    end.

validate_skill(Skill,
               Self = #fighter{action = Action}) ->
    validate_skill([under_control,
                    stun,
                    sleep,
                    stone,
                    cannot_use_skill,
                    seal,
                    weakness,
                    rest,
                    chaos,
                    silent,
                    taunt,
                    use_anger_skill,
                    summon_exists,
                    halo_exists,
                    tempt],
                   Skill,
                   Self,
                   Action).

validate_skill(_, undefined, _Self, _Action) ->
    undefined;
validate_skill(_, _Skill, _Self, undefined) ->
    undefined;
validate_skill([under_control | T], Skill, Self,
               Action) ->
    case combat_script_skill_calc:under_control_skill(Self,
                                                      Skill)
        of
        true -> validate_skill([], Skill, Self, Action);
        false -> validate_skill(T, Skill, Self, Action)
    end;
validate_skill([tempt | T],
               Skill = #c_skill{skill = #skill{id = SkillId}},
               Self = #fighter{id = Sid,
                               special_status =
                                   #special_status{is_tempt = 1,
                                                   tempt_ratio = Ratio}},
               Action) ->
    case lists:member(SkillId, limit_skill(tempt)) of
        true -> validate_skill(T, Skill, Self, Action);
        false ->
            case
                combat_script_skill_calc:under_special_control_skill(Self,
                                                                     Skill)
                of
                true -> validate_skill(T, Skill, Self, Action);
                false ->
                    case combat_script_skill_calc:is_anger_skill(Self,
                                                                 Skill)
                        of
                        true -> validate_skill(T, Skill, Self, Action);
                        false ->
                            case lists:member(SkillId, limit_skill(weakness)) of
                                true -> validate_skill(T, Skill, Self, Action);
                                false ->
                                    case util:rand(1, 1000) =< Ratio of
                                        true ->
                                            NewSkill =
                                                combat_script_skill:to_combat_skill({60519,
                                                                                     1}),
                                            validate_skill([],
                                                           NewSkill,
                                                           Self,
                                                           {NewSkill, Sid});
                                        false ->
                                            validate_skill(T,
                                                           Skill,
                                                           Self,
                                                           Action)
                                    end
                            end
                    end
            end
    end;
validate_skill([stun | T],
               Skill = #c_skill{id = SkillId},
               Self = #fighter{id = Sid,
                               special_status = #special_status{is_stun = 1}},
               Action) ->
    case lists:member(SkillId, limit_skill(stun)) of
        true -> validate_skill(T, Skill, Self, Action);
        false ->
            Msg = lang:get("当前处于眩晕状态, 不能出手"),
            NewSkill = combat_script_skill:to_combat_skill({1005,
                                                            1}),
            NewSkill1 = NewSkill#c_skill{action_msg = Msg},
            validate_skill([], NewSkill1, Self, {NewSkill1, Sid})
    end;
validate_skill([sleep | T],
               Skill = #c_skill{id = SkillId},
               Self = #fighter{id = Sid,
                               special_status = #special_status{is_sleep = 1}},
               Action) ->
    case lists:member(SkillId, limit_skill(stun)) of
        true -> validate_skill(T, Skill, Self, Action);
        false ->
            Msg = lang:get("当前处于昏睡状态, 不能出手"),
            NewSkill = combat_script_skill:to_combat_skill({1005,
                                                            1}),
            NewSkill1 = NewSkill#c_skill{action_msg = Msg},
            validate_skill([], NewSkill1, Self, {NewSkill1, Sid})
    end;
validate_skill([stone | T],
               Skill = #c_skill{id = SkillId},
               Self = #fighter{id = Sid,
                               special_status = #special_status{is_stone = 1}},
               Action) ->
    case lists:member(SkillId, limit_skill(stun)) of
        true -> validate_skill(T, Skill, Self, Action);
        false ->
            Msg = lang:get("当前处于石化状态, 不能出手"),
            NewSkill = combat_script_skill:to_combat_skill({1005,
                                                            1}),
            NewSkill1 = NewSkill#c_skill{action_msg = Msg},
            validate_skill([], NewSkill1, Self, {NewSkill1, Sid})
    end;
validate_skill([cannot_use_skill | T],
               Skill = #c_skill{id = SkillId},
               Self = #fighter{id = Sid,
                               special_status =
                                   #special_status{cannot_use_skill = 1}},
               Action) ->
    case lists:member(SkillId,
                      limit_skill(cannot_use_skill))
        of
        true -> validate_skill(T, Skill, Self, Action);
        false ->
            Msg = lang:get("当前处于隐身状态, 不能出手"),
            NewSkill = combat_script_skill:to_combat_skill({1005,
                                                            1}),
            NewSkill1 = NewSkill#c_skill{action_msg = Msg},
            validate_skill([], NewSkill1, Self, {NewSkill1, Sid})
    end;
validate_skill([seal | T],
               Skill = #c_skill{id = SkillId},
               Self = #fighter{id = Sid,
                               special_status = #special_status{is_seal = 1}},
               Action) ->
    case
        combat_script_skill_calc:under_special_control_skill(Self,
                                                             Skill)
        of
        true -> validate_skill(T, Skill, Self, Action);
        false ->
            case lists:member(SkillId, limit_skill(seal)) of
                true -> validate_skill(T, Skill, Self, Action);
                false ->
                    Msg = lang:get("当前处于封印状态, 不能出手"),
                    NewSkill = combat_script_skill:to_combat_skill({1005,
                                                                    1}),
                    NewSkill1 = NewSkill#c_skill{action_msg = Msg},
                    validate_skill([], NewSkill1, Self, {NewSkill1, Sid})
            end
    end;
validate_skill([weakness | T],
               Skill = #c_skill{id = SkillId},
               Self = #fighter{id = Sid,
                               special_status =
                                   #special_status{is_weakness = 1}},
               Action) ->
    case combat_script_skill_calc:under_weakness_skill(Self,
                                                       Skill)
        of
        true -> validate_skill(T, Skill, Self, Action);
        false ->
            case lists:member(SkillId, limit_skill(weakness)) of
                true -> validate_skill(T, Skill, Self, Action);
                false ->
                    Msg = lang:get("当前处于休息状态，可以召唤宠物和使用道具，其它技能不能出手。"),
                    NewSkill = combat_script_skill:to_combat_skill({1005,
                                                                    1}),
                    NewSkill1 = NewSkill#c_skill{action_msg = Msg},
                    validate_skill([], NewSkill1, Self, {NewSkill1, Sid})
            end
    end;
validate_skill([rest | T],
               Skill = #c_skill{id = SkillId},
               Self = #fighter{id = Sid,
                               special_status = #special_status{is_rest = 1}},
               Action) ->
    case lists:member(SkillId, limit_skill(rest)) of
        true -> validate_skill(T, Skill, Self, Action);
        false ->
            Msg = lang:get("当前处于休息状态，可以召唤宠物和使用道具，其它技能不能出手。"),
            NewSkill = combat_script_skill:to_combat_skill({1005,
                                                            1}),
            NewSkill1 = NewSkill#c_skill{action_msg = Msg},
            validate_skill([], NewSkill1, Self, {NewSkill1, Sid})
    end;
validate_skill([chaos | T], _Skill,
               Self = #fighter{id = Sid, group = Sgroup,
                               special_status =
                                   #special_status{is_weakness = IsWeekNess,
                                                   is_chaos = 1,
                                                   chaos_skill = ChaosSkillId},
                               special_attr =
                                   #special_attr{chaos_ratio = ChaosRatio}},
               _Action) ->
    case IsWeekNess =:= 1 of
        true -> undefined;
        _ ->
            NewChaosSkillId = case ChaosSkillId of
                                  0 -> base_skill(Self);
                                  _ -> ChaosSkillId
                              end,
            Group = case util:rand(1, 1000) =< ChaosRatio of
                        true -> Sgroup;
                        false -> combat_cache:op(Sgroup)
                    end,
            NewTargeId = case combat_util:get_not_die(Sid,
                                                      Group,
                                                      [Sid],
                                                      [{is_stealth, 0}])
                             of
                             undefined -> undefined;
                             #fighter{id = Id, name = _Tname,
                                      group = _Tgroup} ->
                                 Id
                         end,
            Msg = notice:format(lang:get("打懵了，受到[~ts]的影响，你的攻击不受控制"),
                                [{string_2, 5, lang:get("混乱")}]),
            logger:debug("嘲讽技能id:~w",
                         [NewChaosSkillId],
                         combat_skill,
                         2066),
            NewSkill = #c_skill{skill = S} =
                           combat_script_skill:to_combat_skill({NewChaosSkillId,
                                                                1}),
            NewSkill1 = NewSkill#c_skill{skill =
                                             S#skill{target_type = 3},
                                         action_msg = Msg},
            validate_skill(T,
                           NewSkill1,
                           Self,
                           {NewSkill1, NewTargeId})
    end;
validate_skill([silent | T],
               Skill = #c_skill{id = SkillId},
               Self = #fighter{id = Sid, group = Sgroup,
                               special_status = #special_status{is_silent = 1}},
               Action) ->
    case
        combat_script_skill_calc:under_special_control_skill(Self,
                                                             Skill)
        of
        true -> validate_skill(T, Skill, Self, Action);
        false ->
            case lists:member(SkillId, limit_skill(silent)) of
                true -> validate_skill(T, Skill, Self, Action);
                false ->
                    case Action of
                        {_, TargetId} ->
                            NewSkill = get_default_skill(Self),
                            NewTargeId = case combat_cache:f(by_id, TargetId) of
                                             #fighter{group = Tgroup}
                                                 when Sgroup =:= Tgroup ->
                                                 case
                                                     combat_util:get_not_die(Sid,
                                                                             combat_cache:op(Sgroup),
                                                                             [],
                                                                             [{is_stealth,
                                                                               0}])
                                                     of
                                                     undefined -> undefined;
                                                     #fighter{id = Id} -> Id
                                                 end;
                                             #fighter{id = Id} -> Id;
                                             _ ->
                                                 case
                                                     combat_util:get_not_die(Sid,
                                                                             combat_cache:op(Sgroup),
                                                                             [],
                                                                             [{is_stealth,
                                                                               0}])
                                                     of
                                                     undefined -> undefined;
                                                     #fighter{id = Id} -> Id
                                                 end
                                         end,
                            Msg = lang:get("当前处于沉默状态, 无法使用技能"),
                            NewSkill1 = NewSkill#c_skill{action_msg = Msg},
                            validate_skill(T,
                                           NewSkill1,
                                           Self,
                                           {NewSkill1, NewTargeId});
                        _ -> undefined
                    end
            end
    end;
validate_skill([taunt | T], Skill,
               Self = #fighter{id = Sid, group = Sgroup,
                               special_status =
                                   #special_status{is_taunt = 1,
                                                   is_weakness = IsWeekNess,
                                                   taunt_pid = TauntPid}},
               Action) ->
    case Action of
        {#c_skill{id = 1002}, _} when IsWeekNess =:= 1 ->
            undefined;
        {#c_skill{id = 1005}, _} when IsWeekNess =:= 1 ->
            undefined;
        {#c_skill{id = 1004}, _} ->
            validate_skill(T, Skill, Self, Action);
        {#c_skill{id = 1008}, _} ->
            validate_skill(T, Skill, Self, Action);
        {#c_skill{id = 1009}, _} ->
            validate_skill(T, Skill, Self, Action);
        {#c_skill{id = 1002}, _} ->
            validate_skill(T, Skill, Self, Action);
        {_, Tid} ->
            case
                combat_script_skill_calc:under_special_control_skill(Self,
                                                                     Skill)
                of
                true -> validate_skill(T, Skill, Self, Action);
                false ->
                    ActionResult = case combat_cache:f(by_id, Tid) of
                                       #fighter{} ->
                                           case combat_cache:f(by_pid, TauntPid)
                                               of
                                               Tf = #fighter{is_die = 0,
                                                             is_escape = 0} ->
                                                   {true, Tf};
                                               _ -> other_target
                                           end;
                                       _ -> undefined
                                   end,
                    case ActionResult of
                        {true,
                         Target = #fighter{id = Id,
                                           special_status =
                                               #special_status{is_stealth =
                                                                   IsStealth}}} ->
                            Msg =
                                notice:format(lang:get("受到~ts影响，自动转变成普攻攻击嘲讽方"),
                                              [{string_2, 5, lang:get("嘲讽")}]),
                            Flag = case IsStealth of
                                       1 ->
                                           combat_util:can_choose_stealth(Self,
                                                                          Target);
                                       0 -> true
                                   end,
                            case Flag of
                                true ->
                                    NewSkill = get_default_skill(Self),
                                    NewSkill1 = NewSkill#c_skill{action_msg =
                                                                     Msg},
                                    validate_skill(T,
                                                   NewSkill1,
                                                   Self,
                                                   {NewSkill1, Id});
                                false ->
                                    validate_skill(T,
                                                   Skill,
                                                   Self,
                                                   {Skill, undefined})
                            end;
                        other_target ->
                            case util:rand(1, 1000) =< 0 of
                                true ->
                                    Msg =
                                        notice:format(lang:get("受到~ts影响，自动转变成普攻攻击嘲讽方"),
                                                      [{string_2,
                                                        5,
                                                        lang:get("嘲讽")}]),
                                    NewSkill = get_default_skill(Self),
                                    NewSkill1 = NewSkill#c_skill{action_msg =
                                                                     Msg},
                                    TId = case combat_util:get_not_die(Sid,
                                                                       combat_cache:op(Sgroup),
                                                                       [],
                                                                       [{is_stealth,
                                                                         0}])
                                              of
                                              undefined -> undefined;
                                              #fighter{id = Id} -> Id
                                          end,
                                    validate_skill(T,
                                                   NewSkill1,
                                                   Self,
                                                   {NewSkill1, TId});
                                _ ->
                                    validate_skill(T, Skill, Self, {Skill, Tid})
                            end;
                        _ -> undefined
                    end
            end
    end;
validate_skill([use_anger_skill | T], Skill,
               Self = #fighter{id = Sid, group = Sgroup,
                               special_status =
                                   #special_status{can_use_anger_skill =
                                                       {0, Ratio}}},
               Action) ->
    case combat_script_skill_calc:is_anger_skill(Skill) of
        true -> undefined;
        _ ->
            case util:rand(1, 1000) =< Ratio of
                true ->
                    NewTargeId = case combat_util:get_not_die(Sid,
                                                              combat_cache:op(Sgroup),
                                                              [Sid],
                                                              [{is_stealth, 0}])
                                     of
                                     undefined -> undefined;
                                     #fighter{id = Id, name = _Tname,
                                              group = _Tgroup} ->
                                         Id
                                 end,
                    Msg = notice:format(lang:get("打懵了，受到[~ts]的影响，你的攻击不受控制"),
                                        [{string_2, 5, lang:get("爆燃果")}]),
                    NewSkill = #c_skill{skill = S} =
                                   combat_script_skill:to_combat_skill({base_skill(Self),
                                                                        1}),
                    NewSkill1 = NewSkill#c_skill{skill =
                                                     S#skill{target_type = 3},
                                                 action_msg = Msg},
                    validate_skill(T,
                                   NewSkill1,
                                   Self,
                                   {NewSkill1, NewTargeId});
                _ -> validate_skill(T, Skill, Self, Action)
            end
    end;
validate_skill([summon_exists | T],
               Skill = #c_skill{skill = #skill{script_id = 20070}},
               Self = #fighter{id = Sid, group = Sgroup}, Action) ->
    case combat_cache:f(by_baseid, 99998) of
        #fighter{group = SummonGroup}
            when SummonGroup =:= Sgroup ->
            Msg = lang:get("己方已经存在图腾了,无法召唤"),
            NewSkill = combat_script_skill:to_combat_skill({1005,
                                                            1}),
            NewSkill1 = NewSkill#c_skill{action_msg = Msg},
            validate_skill([], NewSkill1, Self, {NewSkill1, Sid});
        _ -> validate_skill(T, Skill, Self, Action)
    end;
validate_skill([halo_exists | T],
               Skill = #c_skill{skill = #skill{script_id = 20071}},
               Self = #fighter{id = Sid, group = Sgroup}, Action) ->
    case combat_buff:get_eff_halo(Sgroup) of
        [_ | _] ->
            Msg = lang:get("己方已经存在结界了,无法释放"),
            NewSkill = combat_script_skill:to_combat_skill({1005,
                                                            1}),
            NewSkill1 = NewSkill#c_skill{action_msg = Msg},
            validate_skill([], NewSkill1, Self, {NewSkill1, Sid});
        _ -> validate_skill(T, Skill, Self, Action)
    end;
validate_skill([], Skill,
               Self = #fighter{id = Sid, type = Type, group = Sgroup},
               Action)
    when Type =/= 2 ->
    case Action of
        {NewSkill, TargetId} ->
            case do_skill_check([self_cond,
                                 mp,
                                 summon_exists,
                                 anger,
                                 self_special],
                                {true, NewSkill},
                                NewSkill,
                                Self,
                                undefined,
                                0)
                of
                {true, FuckSkill} -> {FuckSkill, TargetId};
                {false, Reason} ->
                    CheckFlag = case
                                    combat_script_skill_calc:under_control_skill(Self,
                                                                                 Skill)
                                    of
                                    true -> undefined;
                                    false ->
                                        case
                                            combat_script_skill_calc:under_special_control_skill(Self,
                                                                                                 Skill)
                                            of
                                            true -> special;
                                            false -> true
                                        end
                                end,
                    CheckFlag1 = case Skill of
                                     #c_skill{skill = #skill{type = 4}} ->
                                         pre_action;
                                     _ -> CheckFlag
                                 end,
                    case CheckFlag1 of
                        undefined -> undefined;
                        pre_action ->
                            NormalSkill =
                                combat_script_skill:to_combat_skill({1005, 1}),
                            NormalSkill1 = NormalSkill#c_skill{action_msg =
                                                                   Reason},
                            {NormalSkill1, Sid};
                        special ->
                            NormalSkill =
                                combat_script_skill:to_combat_skill({1005, 1}),
                            NormalSkill1 = NormalSkill#c_skill{action_msg =
                                                                   Reason},
                            {NormalSkill1, Sid};
                        true ->
                            NormalSkill = get_default_skill(Self),
                            NormalSkill1 = NormalSkill#c_skill{action_msg =
                                                                   Reason},
                            NewTargeId = case combat_cache:f(by_id, TargetId) of
                                             #fighter{group = Tgroup}
                                                 when Sgroup =:= Tgroup ->
                                                 case
                                                     combat_util:get_not_die(Sid,
                                                                             combat_cache:op(Sgroup),
                                                                             [],
                                                                             [{is_stealth,
                                                                               0}])
                                                     of
                                                     undefined -> undefined;
                                                     #fighter{id = Id} -> Id
                                                 end;
                                             #fighter{id = Id} -> Id;
                                             _ ->
                                                 case
                                                     combat_util:get_not_die(Sid,
                                                                             combat_cache:op(Sgroup),
                                                                             [],
                                                                             [{is_stealth,
                                                                               0}])
                                                     of
                                                     undefined -> undefined;
                                                     #fighter{id = Id} -> Id
                                                 end
                                         end,
                            {NormalSkill1, NewTargeId}
                    end
            end;
        _ -> undefined
    end;
validate_skill([], _Skill, _Self, Action) -> Action;
validate_skill([_ | T], Skill, Self, Action) ->
    validate_skill(T, Skill, Self, Action).

validate_target(undefined, _Sid, _Tid) -> undefined;
validate_target(_, _Sid, undefined) -> undefined;
validate_target(#c_skill{id = SkillId,
                         skill = #skill{target_type = TargetType}},
                Sid, Sid) ->
    case combat_cache:f(by_id, Sid) of
        Target = #fighter{is_die = 0, is_escape = 0,
                          group = Group} ->
            case TargetType of
                1 ->
                    combat_util:get_not_die(Sid,
                                            combat_cache:op(Group),
                                            [],
                                            [{is_stealth, 0}]);
                8 ->
                    combat_util:get_not_die(Sid,
                                            combat_cache:op(Group),
                                            [],
                                            [{is_stealth, 0}, {type, [3, 6]}]);
                3 -> Target;
                0 -> Target;
                2 -> Target;
                4 -> Target;
                5 -> combat_util:get_not_die(Sid, Group, [Sid]);
                9 ->
                    combat_util:get_not_die(Sid,
                                            Group,
                                            [],
                                            [{type, [3, 6]}]);
                _ ->
                    logger:error("技能[~w]的目标类型不正确:~w",
                                 [SkillId, TargetType],
                                 combat_skill,
                                 2295),
                    undefined
            end;
        _ -> undefined
    end;
validate_target(#c_skill{id = 1006}, Sid, Tid) ->
    case combat_cache:f(by_id, Sid) of
        false -> undefined;
        Self = #fighter{} ->
            case combat_cache:f(by_id, Tid) of
                Target = #fighter{is_die = 0, is_escape = 0} ->
                    case pet:can_catch(Self, Target) of
                        {true, _} -> Target;
                        _ -> undefined
                    end;
                _ -> undefined
            end
    end;
validate_target(Skill = #c_skill{skill =
                                     #skill{target_type = TargetType}},
                Sid, Tid) ->
    case combat_cache:f(by_id, Sid) of
        Self = #fighter{group = Sgroup, lover = LoverId} ->
            case combat_cache:f(by_id, Tid) of
                Target = #fighter{group = Tgroup, is_die = 0,
                                  is_escape = 0, origin_id = ToriginId,
                                  special_status =
                                      #special_status{is_stealth = 1}} ->
                    case TargetType of
                        8 ->
                            combat_util:get_not_die(Sid,
                                                    combat_cache:op(Sgroup),
                                                    [],
                                                    [{is_stealth, 0},
                                                     {type, [3, 6]}]);
                        9 -> Target;
                        1 ->
                            case combat_util:can_choose_stealth(Self, Target) of
                                true -> Target;
                                false ->
                                    combat_util:get_not_die(Sid,
                                                            combat_cache:op(Sgroup),
                                                            [],
                                                            [{is_stealth, 0}])
                            end;
                        0 ->
                            case Tgroup =:= Sgroup of
                                true -> Target;
                                false -> combat_util:get_not_die(Sid, Sgroup)
                            end;
                        5 ->
                            case Tgroup =:= Sgroup of
                                true -> Target;
                                false ->
                                    combat_util:get_not_die(Sid, Sgroup, [Sid])
                            end;
                        3 ->
                            case Tgroup =:= Sgroup of
                                true -> Target;
                                false ->
                                    combat_util:get_not_die(Sid,
                                                            combat_cache:op(Sgroup),
                                                            [],
                                                            [{is_stealth, 0}])
                            end;
                        2 -> Self;
                        4 -> Target;
                        6 ->
                            case Sgroup =:= Tgroup andalso LoverId =:= ToriginId
                                of
                                true -> Target;
                                false -> undefined
                            end;
                        _ -> undefined
                    end;
                Target = #fighter{group = Tgroup, is_die = 0,
                                  is_escape = 0, origin_id = ToriginId} ->
                    case TargetType of
                        8 ->
                            combat_util:get_not_die(Sid,
                                                    combat_cache:op(Sgroup),
                                                    [],
                                                    [{is_stealth, 0},
                                                     {type, [3, 6]}]);
                        9 -> Target;
                        1 ->
                            case Tgroup =:= Sgroup of
                                true ->
                                    combat_util:get_not_die(Sid,
                                                            combat_cache:op(Sgroup),
                                                            [],
                                                            [{is_stealth, 0}]);
                                false -> Target
                            end;
                        0 ->
                            case Tgroup =:= Sgroup of
                                true -> Target;
                                false -> combat_util:get_not_die(Sid, Sgroup)
                            end;
                        5 ->
                            case Tgroup =:= Sgroup of
                                true -> Target;
                                false ->
                                    combat_util:get_not_die(Sid, Sgroup, [Sid])
                            end;
                        3 -> Target;
                        2 -> Self;
                        4 -> Target;
                        6 ->
                            case Sgroup =:= Tgroup andalso LoverId =:= ToriginId
                                of
                                true -> Target;
                                false -> undefined
                            end;
                        _ -> undefined
                    end;
                Target = #fighter{origin_id = ToriginId, group = Tgroup,
                                  is_die = 1, is_escape = 0,
                                  is_die_disappear = 0} ->
                    case can_use_skill(Skill, Self, Target) of
                        1 ->
                            case TargetType of
                                6 ->
                                    case Sgroup =:= Tgroup andalso
                                             LoverId =:= ToriginId
                                        of
                                        true -> Target;
                                        false -> undefined
                                    end;
                                _ -> Target
                            end;
                        0 ->
                            case TargetType of
                                1 ->
                                    case combat_util:can_choose_stealth(Self) of
                                        true ->
                                            combat_util:get_not_die(Sid,
                                                                    combat_cache:op(Sgroup));
                                        false ->
                                            combat_util:get_not_die(Sid,
                                                                    combat_cache:op(Sgroup),
                                                                    [],
                                                                    [{is_stealth,
                                                                      0}])
                                    end;
                                8 ->
                                    combat_util:get_not_die(Sid,
                                                            combat_cache:op(Sgroup),
                                                            [],
                                                            [{type, [3, 6]}]);
                                9 ->
                                    combat_util:get_not_die(Sid,
                                                            Sgroup,
                                                            [],
                                                            [{type, [3, 6]}]);
                                0 -> combat_util:get_not_die(Sid, Sgroup);
                                5 ->
                                    combat_util:get_not_die(Sid, Sgroup, [Sid]);
                                3 ->
                                    case Tgroup =:= Sgroup of
                                        true ->
                                            combat_util:get_not_die(Sid,
                                                                    Sgroup);
                                        false ->
                                            combat_util:get_not_die(Sid,
                                                                    Tgroup,
                                                                    [],
                                                                    [{is_stealth,
                                                                      0}])
                                    end;
                                2 ->
                                    case skill_mode(Self, Skill) of
                                        {_, die} -> undefined;
                                        _ -> Self
                                    end;
                                _ -> undefined
                            end
                    end;
                #fighter{group = Tgroup} ->
                    case skill_mode(Self, Skill) of
                        {_, die} -> undefined;
                        _ ->
                            case TargetType of
                                1 ->
                                    combat_util:get_not_die(Sid,
                                                            combat_cache:op(Sgroup),
                                                            [],
                                                            [{is_stealth, 0}]);
                                0 -> combat_util:get_not_die(Sid, Sgroup);
                                5 ->
                                    combat_util:get_not_die(Sid, Sgroup, [Sid]);
                                8 ->
                                    combat_util:get_not_die(Sid,
                                                            combat_cache:op(Sgroup),
                                                            [],
                                                            [{is_stealth, 0},
                                                             {type, [3, 6]}]);
                                9 ->
                                    combat_util:get_not_die(Sid,
                                                            Sgroup,
                                                            [],
                                                            [{type, [3, 6]}]);
                                2 ->
                                    case skill_mode(Self, Skill) of
                                        {_, die} -> undefined;
                                        _ -> Self
                                    end;
                                3 ->
                                    case Tgroup =:= Sgroup of
                                        true ->
                                            combat_util:get_not_die(Sid,
                                                                    Sgroup);
                                        false ->
                                            combat_util:get_not_die(Sid,
                                                                    Tgroup,
                                                                    [],
                                                                    [{is_stealth,
                                                                      0}])
                                    end;
                                6 -> undefined;
                                _ -> undefined
                            end
                    end;
                false ->
                    combat_util:get_not_die(Sid,
                                            combat_cache:op(Sgroup),
                                            [],
                                            [{is_stealth, 0}]);
                _ -> undefined
            end;
        _ -> undefined
    end.

get_target_by_skill(Self = #fighter{id = Sid,
                                    group = Sgroup},
                    #c_skill{skill = #skill{target_type = TargetType}}) ->
    case TargetType of
        8 ->
            combat_util:get_target(Sid,
                                   combat_cache:op(Sgroup),
                                   [],
                                   [{type, [3, 6]}]);
        9 ->
            combat_util:get_not_die(Sid,
                                    combat_cache:op(Sgroup),
                                    [],
                                    [{type, [3, 6]}]);
        1 ->
            combat_util:get_target(Sid, combat_cache:op(Sgroup));
        0 -> combat_util:get_target(Sid, Sgroup);
        5 -> combat_util:get_target(Sid, Sgroup, [Sid]);
        3 ->
            NewGroup = case util:rand(0, 1) of
                           0 -> Sgroup;
                           1 -> combat_cache:op(Sgroup)
                       end,
            combat_util:get_target(Sid, NewGroup);
        2 -> Self;
        4 -> combat_util:get_target(Sid, Sgroup);
        6 -> combat_util:get_target(Sid, Sgroup);
        _ -> undefined
    end.

get_wing_power_by_combat_type() ->
    CombatType = get(combat_type),
    wing_data:get_fuck_skill_power(CombatType).

get_sq_point_by_combat_type() ->
    CombatType = get(combat_type),
    case lists:member(CombatType,
                      [103,
                       114,
                       104,
                       107,
                       102,
                       105,
                       40,
                       108,
                       110,
                       111,
                       113,
                       58,
                       116])
        of
        true -> 2;
        _ ->
            case lists:member(CombatType, [0, 6, 115]) of
                true -> 0;
                _ -> 1
            end
    end.

get_hipe_skill([], HipeSkill) -> HipeSkill;
get_hipe_skill([{60507, Lev} | Rest], HipeSkill) ->
    get_hipe_skill(Rest, [{60511, Lev} | HipeSkill]);
get_hipe_skill([{60557, Lev} | Rest], HipeSkill) ->
    get_hipe_skill(Rest, [{60561, Lev} | HipeSkill]);
get_hipe_skill([_ | Rest], HipeSkill) ->
    get_hipe_skill(Rest, HipeSkill).

