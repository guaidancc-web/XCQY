-file("src/mod/combat/combat_script_buff.erl", 1).

-module(combat_script_buff).

-export([convert_buff/1,
         convert_buff/2,
         get_script/1,
         default_tips/1,
         default_hit/3]).

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

-file("src/mod/combat/combat_script_buff.erl", 92).

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

-file("src/mod/combat/combat_script_buff.erl", 93).

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

-file("src/mod/combat/combat_script_buff.erl", 94).

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

-file("src/mod/combat/combat_script_buff.erl", 95).

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

-file("src/mod/combat/combat_script_buff.erl", 96).

to_combat_buff(L, multi) ->
    Fun = fun ({BuffId,
                HitRate,
                Duration,
                DisPel,
                BuffArgs},
               List) ->
                  case to_combat_buff({BuffId,
                                       HitRate,
                                       Duration,
                                       DisPel,
                                       BuffArgs},
                                      normal)
                      of
                      false -> List;
                      Buff -> [Buff | List]
                  end
          end,
    NewBuffs = lists:foldl(Fun, [], L),
    NewBuffs;
to_combat_buff({Id, HitRate, Duration, Dispel, Args},
               normal) ->
    case skill_script_data:get_buff(Id) of
        false ->
            logger:error("没有定义Id=~w的BUFF",
                         [Id],
                         combat_script_buff,
                         113),
            false;
        #c_buff_base{type = Type, eff_type = EffType,
                     script_id = ScriptId} ->
            case get_script(ScriptId) of
                false ->
                    logger:error("没有Id=~w, script:~w的BUFF脚本",
                                 [Id, ScriptId],
                                 combat_script_buff,
                                 118),
                    false;
                Buff ->
                    Buff#c_buff{id = Id, type = Type, eff_type = EffType,
                                hit_rate = HitRate, can_dispel = Dispel,
                                duration = Duration, duration_left = Duration,
                                args = Args}
            end
    end;
to_combat_buff(_BuffData, _Type) ->
    logger:error("错误的战斗buff参数arsg:~w, type:~w 无法转换：~w",
                 [_BuffData, _Type, util:get_stacktrace()],
                 combat_script_buff,
                 125),
    false.

-spec convert_buff(Buffs) -> [#c_buff{}] when Buffs ::
                                                  [tuple()].

convert_buff(Buffs) -> convert_buff(Buffs, normal).

convert_buff(Buffs, Mode) ->
    convert_buff(Buffs, Mode, []).

convert_buff([], _Mode, Result) -> Result;
convert_buff([BuffParam | T], Mode, Result) ->
    case to_combat_buff(BuffParam, Mode) of
        false -> convert_buff(T, Mode, Result);
        Buff -> convert_buff(T, Mode, [Buff | Result])
    end.

-spec default_tips(Buff) -> [integer()] when Buff ::
                                                 tuple().

default_tips(#c_buff{args = Args}) when is_list(Args) ->
    Args;
default_tips(_) -> [].

default_hit(#c_buff{hit_rate = HitRate}, _Caster,
            _Target) ->
    util:rand(1, 1000) =< HitRate.

get_script(100000 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = buff,
            compare = fun (_, _, _) -> -1 end};
get_script(102020 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = buff,
            sec_type = round_heal,
            eff =
                fun (#c_buff{args = [MaxRatio, Val, RoundMaxRatio],
                             duration = Duration, duration_left = DurationLeft},
                     _Caster = #fighter{},
                     Target = #fighter{hp_max = HpMax}) ->
                        NewMaxRatio = round(MaxRatio +
                                                max(0, Duration - DurationLeft)
                                                    * RoundMaxRatio),
                        HealHp = round(Val + HpMax * NewMaxRatio / 1000),
                        combat_cache:u(Target, [{hp, 1, HealHp}]),
                        [{0, HealHp, 0}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     184),
                        []
                end,
            compare = fun (_, _, _) -> -1 end};
get_script(102030 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = buff,
            sec_type = round_pre,
            eff =
                fun (#c_buff{args = [MaxRatio, Val, RoundMaxRatio],
                             duration = Duration, duration_left = DurationLeft},
                     _Caster = #fighter{},
                     Target = #fighter{hp_max = HpMax}) ->
                        NewMaxRatio = round(MaxRatio +
                                                max(0, Duration - DurationLeft)
                                                    * RoundMaxRatio),
                        HealHp = round(Val + HpMax * NewMaxRatio / 1000),
                        combat_cache:u(Target, [{hp, 1, HealHp}]),
                        [{0, HealHp, 0}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     206),
                        []
                end,
            compare = fun (_, _, _) -> -1 end};
get_script(103010 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = buff,
            recalc =
                fun (#c_buff{args = [Val]}, _Caster, _Target) ->
                        [{phy_dmg, 1, Val}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     225),
                        []
                end,
            compare =
                fun (#c_buff{args = [Val]}, _, _) -> Val;
                    (#c_buff{id = BuffId, args = Args}, _, _) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     232),
                        -1
                end};
get_script(103020 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = buff,
            recalc =
                fun (#c_buff{args = [Ratio]}, _Caster, _Target) ->
                        [{phy_dmg, 3, Ratio}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     248),
                        []
                end,
            compare =
                fun (#c_buff{args = [Ratio]}, _, _) -> Ratio;
                    (#c_buff{id = BuffId, args = Args}, _, _) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     255),
                        -1
                end};
get_script(104010 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = buff,
            recalc =
                fun (#c_buff{args = [Val]}, _Caster, _Target) ->
                        [{magic_dmg, 1, Val}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     272),
                        []
                end,
            compare =
                fun (#c_buff{args = [Val]}, _, _) -> Val;
                    (#c_buff{id = BuffId, args = Args}, _, _) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     279),
                        -1
                end};
get_script(104020 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = buff,
            recalc =
                fun (#c_buff{args = [Ratio]}, _Caster, _Target) ->
                        [{magic_dmg, 3, Ratio}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     295),
                        []
                end,
            compare =
                fun (#c_buff{args = [Ratio]}, _, _) -> Ratio;
                    (#c_buff{id = BuffId, args = Args}, _, _) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     302),
                        -1
                end};
get_script(105010 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = buff,
            recalc =
                fun (#c_buff{args = [Val]}, _Caster, _Target) ->
                        [{phy_def, 1, Val}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     319),
                        []
                end,
            compare =
                fun (#c_buff{args = [Val]}, _, _) -> Val;
                    (#c_buff{id = BuffId, args = Args}, _, _) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     326),
                        -1
                end};
get_script(105020 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = buff,
            recalc =
                fun (#c_buff{args = [Ratio]}, _Caster, _Target) ->
                        [{phy_def, 3, Ratio}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     342),
                        []
                end,
            compare =
                fun (#c_buff{args = [Ratio]}, _, _) -> Ratio;
                    (#c_buff{id = BuffId, args = Args}, _, _) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     349),
                        -1
                end};
get_script(105021 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = buff,
            recalc =
                fun (#c_buff{args = [ValA, ValB]}, _Caster,
                     _Target = #fighter{lev = Lev}) ->
                        Val = round(Lev * ValA + ValB),
                        [{phy_def, 1, Val}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     366),
                        []
                end,
            compare =
                fun (#c_buff{args = [ValA, ValB]}, _,
                     #fighter{lev = Lev}) ->
                        round(Lev * ValA + ValB);
                    (#c_buff{id = BuffId, args = Args}, _, _) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     373),
                        -1
                end};
get_script(106010 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = buff,
            recalc =
                fun (#c_buff{args = [Val]}, _Caster, _Target) ->
                        [{magic_def, 1, Val}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     390),
                        []
                end,
            compare =
                fun (#c_buff{args = [Val]}, _, _) -> Val;
                    (#c_buff{id = BuffId, args = Args}, _, _) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     397),
                        -1
                end};
get_script(106020 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = buff,
            recalc =
                fun (#c_buff{args = [Ratio]}, _Caster, _Target) ->
                        [{magic_def, 3, Ratio}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     413),
                        []
                end,
            compare =
                fun (#c_buff{args = [Ratio]}, _, _) -> Ratio;
                    (#c_buff{id = BuffId, args = Args}, _, _) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     420),
                        -1
                end};
get_script(106021 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = buff,
            recalc =
                fun (#c_buff{args = [ValA, ValB]}, _Caster,
                     _Target = #fighter{lev = Lev}) ->
                        Val = round(ValA * Lev + ValB),
                        [{magic_def, 1, Val}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     437),
                        []
                end,
            compare =
                fun (#c_buff{args = [ValA, ValB]}, _,
                     #fighter{lev = Lev}) ->
                        round(Lev * ValA + ValB);
                    (#c_buff{id = BuffId, args = Args}, _, _) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     444),
                        -1
                end};
get_script(107010 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = buff,
            recalc =
                fun (#c_buff{layer = Layer, args = [Val]}, _Caster,
                     _Target) ->
                        [{crit, 1, Val * Layer}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     461),
                        []
                end,
            compare =
                fun (#c_buff{args = [Val]}, _, _) -> Val;
                    (#c_buff{id = BuffId, args = Args}, _, _) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     468),
                        -1
                end};
get_script(107011 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = buff,
            recalc =
                fun (#c_buff{args = [Val]}, _Caster, _Target) ->
                        [{phy_crit, 1, Val}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     484),
                        []
                end,
            compare =
                fun (#c_buff{args = [Val]}, _, _) -> Val;
                    (#c_buff{id = BuffId, args = Args}, _, _) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     491),
                        -1
                end};
get_script(107012 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = buff,
            recalc =
                fun (#c_buff{args = [Val]}, _Caster, _Target) ->
                        [{magic_crit, 1, Val}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     507),
                        []
                end,
            compare =
                fun (#c_buff{args = [Val]}, _, _) -> Val;
                    (#c_buff{id = BuffId, args = Args}, _, _) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     514),
                        -1
                end};
get_script(107013 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = buff,
            sec_type = round_pre,
            recalc =
                fun (#c_buff{args = [Val, _HealRatio]}, #fighter{},
                     _Target) ->
                        [{magic_crit, 1, Val}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     532),
                        []
                end,
            eff =
                fun (Buff = #c_buff{args = [_Val, HealRatio]},
                     _Caster = #fighter{},
                     _Target = #fighter{id = Sid, is_die = IsDie,
                                        hp_max = HpMax}) ->
                        case IsDie of
                            1 ->
                                EffectBuff = to_combat_buff({20005,
                                                             1000,
                                                             1,
                                                             0,
                                                             []},
                                                            normal),
                                combat_buff:buff_add(EffectBuff,
                                                     _Target,
                                                     _Target),
                                combat_buff:buff_del(Sid, Buff),
                                case combat_cache:f(by_id, Sid) of
                                    #fighter{buffs = Buffs} ->
                                        [combat_buff:buff_del(Sid, CBuff)
                                         || CBuff = #c_buff{script_id = 161001}
                                                <- Buffs];
                                    _ -> ok
                                end,
                                HealHp = round(HpMax * HealRatio / 1000),
                                combat_cache:u(Sid,
                                               [{is_die, 0, 0},
                                                {hp, 0, HealHp},
                                                {is_die_disappear, 0, 0}]),
                                [{2, 0, 0}, {0, HealHp, 0}];
                            _ -> []
                        end;
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     559),
                        []
                end,
            die_eff = 1};
get_script(108010 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = buff,
            recalc =
                fun (#c_buff{args = [Val]}, _Caster, _Target) ->
                        [{tenacity, 1, Val}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     577),
                        []
                end,
            compare =
                fun (#c_buff{args = [Val]}, _, _) -> Val;
                    (#c_buff{id = BuffId, args = Args}, _, _) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     584),
                        -1
                end};
get_script(108011 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = buff,
            recalc =
                fun (#c_buff{args = [Val]}, _Caster, _Target) ->
                        [{phy_tenacity, 1, Val}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     600),
                        []
                end,
            compare =
                fun (#c_buff{args = [Val]}, _, _) -> Val;
                    (#c_buff{id = BuffId, args = Args}, _, _) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     607),
                        -1
                end};
get_script(108012 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = buff,
            recalc =
                fun (#c_buff{args = [Val]}, _Caster, _Target) ->
                        [{magic_tenacity, 1, Val}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     623),
                        []
                end,
            compare =
                fun (#c_buff{args = [Val]}, _, _) -> Val;
                    (#c_buff{id = BuffId, args = Args}, _, _) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     630),
                        -1
                end};
get_script(109010 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = buff,
            recalc =
                fun (#c_buff{args = [Val]}, _Caster, _Target) ->
                        [{d_accuracy, 1, Val}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     647),
                        []
                end,
            compare =
                fun (#c_buff{args = [Val]}, _, _) -> Val;
                    (#c_buff{id = BuffId, args = Args}, _, _) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     654),
                        -1
                end};
get_script(109011 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = buff,
            recalc =
                fun (#c_buff{args = [Val]}, _Caster, _Target) ->
                        [{d_phy_accuracy, 1, Val}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     670),
                        []
                end,
            compare =
                fun (#c_buff{args = [Val]}, _, _) -> Val;
                    (#c_buff{id = BuffId, args = Args}, _, _) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     677),
                        -1
                end};
get_script(109012 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = buff,
            recalc =
                fun (#c_buff{args = [Val]}, _Caster, _Target) ->
                        [{d_magic_accuracy, 1, Val}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     693),
                        []
                end,
            compare =
                fun (#c_buff{args = [Val]}, _, _) -> Val;
                    (#c_buff{id = BuffId, args = Args}, _, _) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     700),
                        -1
                end};
get_script(110010 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = buff,
            recalc =
                fun (#c_buff{args = [Val]}, _Caster, _Target) ->
                        [{d_evasion, 1, Val}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     717),
                        []
                end,
            compare =
                fun (#c_buff{args = [Val]}, _, _) -> Val;
                    (#c_buff{id = BuffId, args = Args}, _, _) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     724),
                        -1
                end};
get_script(110011 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = buff,
            recalc =
                fun (#c_buff{args = [Val]}, _Caster, _Target) ->
                        [{d_phy_evasion, 1, Val}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     740),
                        []
                end,
            compare =
                fun (#c_buff{args = [Val]}, _, _) -> Val;
                    (#c_buff{id = BuffId, args = Args}, _, _) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     747),
                        -1
                end};
get_script(110012 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = buff,
            recalc =
                fun (#c_buff{args = [Val]}, _Caster, _Target) ->
                        [{d_magic_evasion, 1, Val}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     763),
                        []
                end,
            compare =
                fun (#c_buff{args = [Val]}, _, _) -> Val;
                    (#c_buff{id = BuffId, args = Args}, _, _) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     770),
                        -1
                end};
get_script(111010 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = buff,
            recalc =
                fun (#c_buff{args = [Val]}, _Caster,
                     _Target = #fighter{}) ->
                        [{atk_speed, 1, Val}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     787),
                        []
                end,
            eff_val_before =
                fun (#c_buff{}, _Caster, _Target = #fighter{}) ->
                        combat_fighter:update_sort_action(),
                        [];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     798),
                        []
                end,
            eff_val_after =
                fun (#c_buff{}, _Caster, _Target = #fighter{}) ->
                        combat_fighter:update_sort_action(),
                        [];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     809),
                        []
                end,
            compare =
                fun (#c_buff{args = [Val]}, _, _) -> Val;
                    (#c_buff{id = BuffId, args = Args}, _, _) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     816),
                        -1
                end};
get_script(111020 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = buff,
            recalc =
                fun (#c_buff{args = [Ratio]}, _Caster,
                     _Target = #fighter{}) ->
                        [{atk_speed, 3, Ratio}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     832),
                        []
                end,
            eff_val_before =
                fun (#c_buff{}, _Caster, _Target = #fighter{}) ->
                        combat_fighter:update_sort_action(),
                        [];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     843),
                        []
                end,
            eff_val_after =
                fun (#c_buff{}, _Caster, _Target = #fighter{}) ->
                        combat_fighter:update_sort_action(),
                        [];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     854),
                        []
                end,
            compare =
                fun (#c_buff{args = [Ratio]}, _, _) -> Ratio;
                    (#c_buff{id = BuffId, args = Args}, _, _) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     861),
                        -1
                end};
get_script(111022 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = buff,
            recalc =
                fun (#c_buff{args = [Ratio, Base]}, _Caster,
                     _Target = #fighter{}) ->
                        [{atk_speed, 3, Ratio}, {atk_speed, 1, Base}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     878),
                        []
                end,
            eff_val_before =
                fun (#c_buff{}, _Caster, _Target = #fighter{}) ->
                        combat_fighter:update_sort_action(),
                        [];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     889),
                        []
                end,
            eff_val_after =
                fun (#c_buff{}, _Caster, _Target = #fighter{}) ->
                        combat_fighter:update_sort_action(),
                        [];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     900),
                        []
                end,
            compare = fun (_, _, _) -> -1 end};
get_script(112010 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = buff,
            recalc =
                fun (#c_buff{args = [Val]}, _Caster, _Target) ->
                        [{phy_dmg, 1, Val}, {magic_dmg, 1, Val}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     918),
                        []
                end,
            compare =
                fun (#c_buff{args = [Val]}, _, _) -> Val;
                    (#c_buff{id = BuffId, args = Args}, _, _) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     925),
                        -1
                end};
get_script(112020 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = buff,
            recalc =
                fun (#c_buff{args = [Ratio]}, _Caster, _Target) ->
                        [{phy_dmg, 3, Ratio}, {magic_dmg, 3, Ratio}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     942),
                        []
                end,
            compare =
                fun (#c_buff{args = [Ratio]}, _, _) -> Ratio;
                    (#c_buff{id = BuffId, args = Args}, _, _) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     949),
                        -1
                end};
get_script(113000 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = buff,
            eff_val_before =
                fun (#c_buff{args = [Ratio, 0, _Lev]}, #fighter{},
                     _Target) ->
                        [{anti_ratio, 1, Ratio}];
                    (#c_buff{args = [Ratio, SkillId, Lev]}, #fighter{},
                     _Target) ->
                        [{anti_ratio, 1, Ratio},
                         {anti_skill, 0, {SkillId, Lev}}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     971),
                        []
                end,
            eff_val_after =
                fun (#c_buff{args = [Ratio, _, _]}, _Self, _Target) ->
                        [{anti_ratio, 1, -Ratio}, {anti_skill, 0, base}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     981),
                        []
                end,
            compare = fun (_, _, _) -> -1 end};
get_script(113001 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = buff,
            sec_type = anti,
            eff_val_before =
                fun (#c_buff{args = [Ratio, 0, _Lev, AntiTimes]},
                     #fighter{}, _Target) ->
                        [{anti_ratio, 1, Ratio}, {anti_times, 0, AntiTimes}];
                    (#c_buff{args = [Ratio, SkillId, Lev, AntiTimes]},
                     #fighter{}, _Target) ->
                        [{anti_ratio, 1, Ratio},
                         {anti_skill, 0, {SkillId, Lev}},
                         {anti_times, 0, AntiTimes}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     1005),
                        []
                end,
            eff_val_after =
                fun (#c_buff{args = [Ratio, _, _, _]}, _Self,
                     _Target) ->
                        [{anti_ratio, 1, -Ratio},
                         {anti_skill, 0, base},
                         {anti_times, 0, 0}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     1015),
                        []
                end,
            compare = fun (_, _, _) -> -1 end};
get_script(114010 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = buff,
            recalc =
                fun (#c_buff{args = [Val]}, _Caster, _Target) ->
                        [{enhance_control, 1, Val}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     1033),
                        []
                end,
            compare =
                fun (#c_buff{args = [Val]}, _, _) -> Val;
                    (#c_buff{id = BuffId, args = Args}, _, _) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     1040),
                        -1
                end};
get_script(115010 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = buff,
            recalc =
                fun (#c_buff{args = [Val]}, _Caster, _Target) ->
                        [{anti_control, 1, Val}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     1057),
                        []
                end,
            compare =
                fun (#c_buff{args = [Val]}, _, _) -> Val;
                    (#c_buff{id = BuffId, args = Args}, _, _) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     1064),
                        -1
                end};
get_script(115011 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = buff,
            sec_type = anti_control,
            eff_val_before =
                fun (#c_buff{args = [Val]}, _Caster, _Target) ->
                        [{anti_control_ratio, 1, Val}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     1082),
                        []
                end,
            eff_val_after =
                fun (#c_buff{args = [Val]}, _Caster, _Target) ->
                        [{anti_control_ratio, 1, -Val}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     1092),
                        []
                end};
get_script(116010 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = buff,
            recalc =
                fun (#c_buff{args = [Val]}, _Caster, _Target) ->
                        [{phy_def, 1, Val}, {magic_def, 1, Val}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     1109),
                        []
                end,
            compare =
                fun (#c_buff{args = [Val]}, _, _) -> Val;
                    (#c_buff{id = BuffId, args = Args}, _, _) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     1116),
                        -1
                end};
get_script(116020 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = buff,
            recalc =
                fun (#c_buff{args = [Ratio]}, _Caster, _Target) ->
                        [{phy_def, 3, Ratio}, {magic_def, 3, Ratio}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     1132),
                        []
                end,
            compare =
                fun (#c_buff{args = [Ratio]}, _, _) -> Ratio;
                    (#c_buff{id = BuffId, args = Args}, _, _) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     1139),
                        -1
                end};
get_script(117020 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = buff,
            recalc =
                fun (#c_buff{args = [Ratio], layer = Layer}, _Caster,
                     _Target) ->
                        [{d_dmg_ratio, 1, Ratio * Layer}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     1155),
                        []
                end,
            compare =
                fun (#c_buff{args = [Ratio]}, _, _) -> Ratio;
                    (#c_buff{id = BuffId, args = Args}, _, _) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     1162),
                        -1
                end};
get_script(117021 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = buff,
            recalc =
                fun (#c_buff{args = [Ratio], layer = Layer}, _Caster,
                     _Target) ->
                        logger:debug("当前buff层数:~w",
                                     [Layer],
                                     combat_script_buff,
                                     1178),
                        [{d_dmg_ratio, 1, Ratio * Layer}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     1181),
                        []
                end,
            compare =
                fun (#c_buff{args = [_Ratio],
                             duration_left = DurationLeft},
                     _, _) ->
                        DurationLeft;
                    (#c_buff{id = BuffId, args = Args}, _, _) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     1188),
                        -1
                end};
get_script(117022 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = buff,
            recalc =
                fun (#c_buff{args = [Ratio]}, _Caster, _Target) ->
                        [{d_phy_dmg_ratio, 1, Ratio}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     1205),
                        []
                end};
get_script(117023 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = buff,
            recalc =
                fun (#c_buff{args = [Ratio]}, _Caster, _Target) ->
                        [{d_magic_dmg_ratio, 1, Ratio}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     1222),
                        []
                end};
get_script(117024 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = buff,
            recalc =
                fun (#c_buff{args = [Ratio]},
                     _Caster = #fighter{attr = #attr{phy_def = PhyDef}},
                     _Target) ->
                        Val = util:check_min(round(PhyDef * (Ratio / 1000)), 0),
                        logger:debug("原物防值：~w降低的物防值：~w",
                                     [PhyDef, Val],
                                     combat_script_buff,
                                     1238),
                        [{phy_def, 3, -Ratio}, {phy_dmg, 1, Val}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     1241),
                        []
                end,
            compare =
                fun (#c_buff{args = [Ratio]}, _, _) -> Ratio;
                    (#c_buff{id = BuffId, args = Args}, _, _) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     1248),
                        -1
                end};
get_script(118020 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = buff,
            recalc =
                fun (#c_buff{args = [Ratio, Val]}, _Caster,
                     _Target = #fighter{hp_max = HpMax}) ->
                        AddVal = round(HpMax * Ratio / 1000 + Val),
                        [{hp_max, 1, AddVal}, {tmp_hp_max, 1, AddVal}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     1266),
                        []
                end,
            eff_before =
                fun (#c_buff{args = [_Ratio, _Val]},
                     _Target = #fighter{hp_max = HpMax}) ->
                        [{10, HpMax, 0}]
                end,
            eff_val_before =
                fun (#c_buff{args = [_Ratio, _Val]}, _Caster,
                     _Target = #fighter{hp_max = _HpMax}) ->
                        []
                end};
get_script(119000 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = buff,
            recalc =
                fun (#c_buff{args = [SuckRatio]}, _Caster, Target) ->
                        combat_cache:u(Target, [{suck_hp, 0, SuckRatio}]),
                        [];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     1296),
                        []
                end,
            eff_val_after =
                fun (#c_buff{args = [_SuckRatio]}, _Caster, Target) ->
                        combat_cache:u(Target, [{suck_hp, 0, 0}]),
                        [];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     1307),
                        []
                end,
            eff_val_before =
                fun (#c_buff{}, _Caster, _Target) -> [] end};
get_script(120000 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = buff,
            sec_type = shield_atk,
            eff_val_before =
                fun (#c_buff{args = [ShieldNum, Ratio]}, #fighter{},
                     _Target) ->
                        [{absorb_shield, 0, ShieldNum},
                         {absorb_shield_suck, 0, Ratio}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     1329),
                        []
                end,
            eff_val_after =
                fun (#c_buff{args = [_ShieldNum, _Ratio]}, _Self,
                     _Target) ->
                        [{absorb_shield, 0, 0}, {absorb_shield_suck, 0, 0}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     1339),
                        []
                end,
            compare =
                fun (#c_buff{args = [Num, _]}, _, _) -> Num end};
get_script(120001 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = buff,
            sec_type = shield_atk,
            eff_val_before =
                fun (#c_buff{args = [ShieldNumRatioList, Ratio]},
                     #fighter{}, _Target) ->
                        ShieldNum = case util:rand_list(ShieldNumRatioList, 2)
                                        of
                                        {_ShieldNum, _} -> _ShieldNum;
                                        _ -> 1
                                    end,
                        logger:debug("+护盾", [], combat_script_buff, 1359),
                        [{absorb_shield, 0, ShieldNum},
                         {absorb_shield_suck, 0, Ratio}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     1362),
                        []
                end,
            eff_val_after =
                fun (#c_buff{args = [_ShieldNum, _Ratio]}, _Self,
                     _Target) ->
                        logger:debug("删除护盾", [], combat_script_buff, 1370),
                        [{absorb_shield, 0, 0}, {absorb_shield_suck, 0, 0}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     1373),
                        []
                end,
            compare = fun (_, _, _) -> -1 end};
get_script(120002 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = buff,
            sec_type = shield_atk,
            eff_val_before =
                fun (#c_buff{args = [ShieldNumRatioList, Ratio]},
                     #fighter{}, _Target) ->
                        ShieldNum = case util:rand_list(ShieldNumRatioList, 2)
                                        of
                                        {_ShieldNum, _} -> _ShieldNum;
                                        _ -> 1
                                    end,
                        logger:debug("+护盾", [], combat_script_buff, 1393),
                        [{absorb_shield, 0, ShieldNum},
                         {absorb_shield_suck, 0, Ratio}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     1396),
                        []
                end,
            eff_val_after =
                fun (#c_buff{args = [_ShieldNum, _Ratio]}, _Self,
                     _Target) ->
                        logger:debug("删除护盾", [], combat_script_buff, 1404),
                        [{absorb_shield, 0, 0}, {absorb_shield_suck, 0, 0}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     1407),
                        []
                end,
            compare = fun (_, _, _) -> -1 end};
get_script(120010 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = buff,
            sec_type = shield_dmg,
            eff_val_before =
                fun (#c_buff{args = [Ratio, BaseVal]},
                     #fighter{hp_max = HpMax}, _Target) ->
                        Shield = round(HpMax * Ratio / 1000 + BaseVal),
                        [{absorb_dmg, 0, Shield}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     1427),
                        []
                end,
            eff_val_after =
                fun (#c_buff{args = [_Ratio, _BaseVal]}, _Self,
                     _Target) ->
                        [{absorb_dmg, 0, 0}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     1437),
                        []
                end,
            tips_calc =
                fun (#c_buff{args = [Ratio, BaseVal]},
                     #fighter{hp_max = HpMax}, _Target) ->
                        Shield = round(HpMax * Ratio / 1000 + BaseVal),
                        [Shield];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     1448),
                        []
                end,
            compare = fun (_, _, _) -> -1 end};
get_script(120011 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = buff,
            sec_type = shield_dmg,
            eff_val_before =
                fun (#c_buff{args = [Val]}, #fighter{}, _Target) ->
                        [{absorb_dmg, 1, Val}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     1465),
                        []
                end,
            eff_val_after =
                fun (#c_buff{args = [_Val]}, _Self, _Target) ->
                        [{absorb_dmg, 0, 0}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     1475),
                        []
                end};
get_script(120012 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = buff,
            sec_type = shield_dmg,
            eff_val_before =
                fun (#c_buff{args = [Val]}, #fighter{}, _Target) ->
                        logger:debug("+法术护盾", [], combat_script_buff, 1490),
                        [{magic_absorb_dmg, 1, Val}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     1493),
                        []
                end,
            eff_val_after =
                fun (#c_buff{args = [_Val]}, _Self, _Target) ->
                        logger:debug("删除护盾", [], combat_script_buff, 1501),
                        [{magic_absorb_dmg, 0, 0}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     1504),
                        []
                end,
            compare = fun (_, _, _) -> -1 end};
get_script(124000 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = buff,
            sec_type = energy,
            recalc =
                fun (#c_buff{layer = Layer, args = [Ratio]}, _Caster,
                     _Target) ->
                        [{energy, 0, Layer}, {magic_dmg, 3, Ratio * Layer}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     1523),
                        []
                end,
            compare =
                fun (#c_buff{args = [Ratio]}, _, _) -> Ratio;
                    (#c_buff{id = BuffId, args = Args}, _, _) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     1530),
                        -1
                end};
get_script(125000 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = buff,
            recalc =
                fun (#c_buff{args = [Ratio]}, _Caster, _Target) ->
                        [{d_hurt_ratio, 1, -Ratio}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     1547),
                        []
                end,
            compare =
                fun (#c_buff{args = [Ratio]}, _, _) -> Ratio;
                    (#c_buff{id = BuffId, args = Args}, _, _) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     1554),
                        -1
                end};
get_script(125001 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = buff,
            recalc =
                fun (#c_buff{args = [Ratio], layer = Layer}, _Caster,
                     _Target) ->
                        [{d_buff_reduce_dmg, 0, -Ratio * Layer}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     1571),
                        []
                end};
get_script(125002 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = buff,
            recalc =
                fun (#c_buff{args = [Ratio]}, _Caster, _Target) ->
                        [{d_phy_hurt_ratio, 1, -Ratio}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     1588),
                        []
                end,
            compare =
                fun (#c_buff{args = [Ratio]}, _, _) -> Ratio;
                    (#c_buff{id = BuffId, args = Args}, _, _) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     1595),
                        -1
                end};
get_script(125003 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = buff,
            recalc =
                fun (#c_buff{args = [Ratio]}, _Caster, _Target) ->
                        [{d_magic_hurt_ratio, 1, -Ratio}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     1612),
                        []
                end,
            compare =
                fun (#c_buff{args = [Ratio]}, _, _) -> Ratio;
                    (#c_buff{id = BuffId, args = Args}, _, _) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     1619),
                        -1
                end};
get_script(125004 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = buff,
            recalc =
                fun (#c_buff{args = [Ratio]}, _Caster, _Target) ->
                        [{d_phy_final_hurt_ratio, 1, -Ratio}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     1636),
                        []
                end,
            compare =
                fun (#c_buff{args = [Ratio]}, _, _) -> Ratio;
                    (#c_buff{id = BuffId, args = Args}, _, _) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     1643),
                        -1
                end};
get_script(125005 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = buff,
            recalc =
                fun (#c_buff{args = [Ratio]}, _Caster, _Target) ->
                        [{d_magic_final_hurt_ratio, 1, -Ratio}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     1660),
                        []
                end,
            compare =
                fun (#c_buff{args = [Ratio]}, _, _) -> Ratio;
                    (#c_buff{id = BuffId, args = Args}, _, _) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     1667),
                        -1
                end};
get_script(126000 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = buff,
            recalc =
                fun (#c_buff{args = [Ratio]}, _Caster, _Target) ->
                        [{d_crit_dmg_ratio, 1, Ratio}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     1685),
                        []
                end,
            compare =
                fun (#c_buff{args = [Ratio]}, _, _) -> Ratio;
                    (#c_buff{id = BuffId, args = Args}, _, _) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     1692),
                        -1
                end};
get_script(129000 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = buff,
            sec_type = stealth,
            recalc =
                fun (#c_buff{args = [Ratio]}, _Caster, _Target) ->
                        [{d_hurt_ratio, 1, -Ratio}, {is_stealth, 0, 1}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     1710),
                        []
                end,
            compare = fun (_, _, _) -> -1 end};
get_script(129001 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = buff,
            sec_type = stealth,
            recalc =
                fun (#c_buff{args = []}, _Caster, _Target) ->
                        [{is_stealth, 0, 1}, {cannot_use_skill, 0, 1}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     1729),
                        []
                end,
            compare = fun (_, _, _) -> -1 end};
get_script(129002 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = buff,
            sec_type = stealth,
            recalc =
                fun (#c_buff{args = []}, _Caster, _Target) ->
                        [{is_stealth, 0, 1}, {cannot_use_skill, 0, 1}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     1748),
                        []
                end,
            compare = fun (_, _, _) -> -1 end};
get_script(130020 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = buff,
            recalc =
                fun (#c_buff{args = [Ratio]}, _Caster, _Target) ->
                        [{d_eff_heal_ratio, 1, Ratio}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     1766),
                        []
                end,
            compare =
                fun (#c_buff{args = [Ratio]}, _, _) -> Ratio;
                    (#c_buff{id = BuffId, args = Args}, _, _) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     1773),
                        -1
                end};
get_script(130021 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = buff,
            recalc =
                fun (#c_buff{args = [Ratio]}, _Caster, _Target) ->
                        [{d_heal_ratio, 1, Ratio}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     1789),
                        []
                end,
            compare =
                fun (#c_buff{args = [Ratio]}, _, _) -> Ratio;
                    (#c_buff{id = BuffId, args = Args}, _, _) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     1796),
                        -1
                end};
get_script(130022 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = buff,
            recalc =
                fun (#c_buff{args = [Ratio]}, _Caster, _Target) ->
                        [{d_heal_ratio, 1, Ratio},
                         {d_eff_heal_ratio, 1, Ratio}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     1812),
                        []
                end,
            compare =
                fun (#c_buff{args = [Ratio]}, _, _) -> Ratio;
                    (#c_buff{id = BuffId, args = Args}, _, _) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     1819),
                        -1
                end};
get_script(132000 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = buff,
            eff_val_before =
                fun (#c_buff{args = [BaseId]}, _Caster,
                     _Target = #fighter{}) ->
                        [{model_id, 0, BaseId}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     1836),
                        []
                end,
            eff_val_after =
                fun (#c_buff{args = [_BaseId]}, _Caster,
                     _Target = #fighter{}) ->
                        [{model_id, 0, 0}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     1846),
                        []
                end,
            eff_before =
                fun (#c_buff{args = [BaseId]}, _Target) ->
                        [{3, BaseId, 0}];
                    (#c_buff{id = BuffId, args = Args}, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     1854),
                        []
                end,
            eff_after =
                fun (#c_buff{args = [_BaseId]}, _Target) -> [{3, 0, 0}];
                    (#c_buff{id = BuffId, args = Args}, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     1862),
                        []
                end};
get_script(133000 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = buff,
            sec_type = buff_revive_self,
            recalc =
                fun (#c_buff{args =
                                 [DefRatio, Ratio, SkillId, HpBase, HpRatio]},
                     _Caster, _Target) ->
                        [{d_hurt_ratio, 1, -DefRatio},
                         {buff_revive_self,
                          0,
                          {Ratio, HpBase, HpRatio, SkillId}}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     1880),
                        []
                end,
            compare = fun (_, _, _) -> -1 end};
get_script(133001 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = buff,
            sec_type = lover_revive_self,
            recalc =
                fun (#c_buff{args =
                                 [DefRatio, Ratio, SkillId, HpBase, HpRatio]},
                     _Caster, _Target) ->
                        [{d_hurt_ratio, 1, -DefRatio},
                         {lover_revive_self,
                          0,
                          {Ratio, HpBase, HpRatio, SkillId}}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     1899),
                        []
                end,
            compare = fun (_, _, _) -> -1 end};
get_script(133002 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = buff,
            sec_type = buff_revive_self,
            recalc =
                fun (#c_buff{args =
                                 [Ratio,
                                  SkillId,
                                  HpBase,
                                  HpRatio,
                                  MpBase,
                                  MpRatio]},
                     _Caster, _Target) ->
                        [{buff_revive_self,
                          0,
                          #{ratio => Ratio, hp => HpBase, hp_ratio => HpRatio,
                            skill_id => SkillId, mp => MpBase,
                            mp_ratio => MpRatio}}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     1917),
                        []
                end,
            compare = fun (_, _, _) -> -1 end};
get_script(139020 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = buff,
            recalc =
                fun (#c_buff{args = [Ratio]}, _Caster, _Target) ->
                        [{d_feedback, 0, Ratio}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     1935),
                        []
                end,
            compare =
                fun (#c_buff{args = [Ratio]}, _, _) -> Ratio;
                    (#c_buff{id = BuffId, args = Args}, _, _) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     1942),
                        -1
                end};
get_script(139021 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = buff,
            recalc =
                fun (#c_buff{args = [Ratio]}, _Caster, _Target) ->
                        [{d_mirror_feedback, 0, Ratio}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     1959),
                        []
                end,
            compare =
                fun (#c_buff{args = [Ratio]}, _, _) -> Ratio;
                    (#c_buff{id = BuffId, args = Args}, _, _) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     1966),
                        -1
                end};
get_script(142000 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = buff,
            eff_val_before =
                fun (#c_buff{args = []}, _Caster,
                     _Target = #fighter{}) ->
                        [{immunity, 0, 1}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     1984),
                        []
                end,
            eff_val_after =
                fun (#c_buff{args = []}, _Caster,
                     _Target = #fighter{}) ->
                        [{immunity, 0, 0}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     1994),
                        []
                end};
get_script(143000 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = buff,
            recalc =
                fun (#c_buff{args = [Ratio]}, _Caster, _Target) ->
                        [{dec_taunt_dmg_ratio, 1, Ratio}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     2011),
                        []
                end};
get_script(144000 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = buff,
            recalc =
                fun (#c_buff{args = [LinkRatio]},
                     _Caster = #fighter{id = Sid}, _Target) ->
                        [{soul_link, 0, {Sid, LinkRatio}}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     2028),
                        []
                end,
            compare = fun (_, _, _) -> -1 end};
get_script(148000 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = buff,
            sec_type = snow_def,
            eff_val_before =
                fun (#c_buff{args = [ShieldNum]}, #fighter{},
                     _Target) ->
                        [{fighter_ext_args_snow_def, 1, ShieldNum}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     2047),
                        []
                end,
            eff_val_after =
                fun (#c_buff{args = [_ShieldNum]}, _Self, _Target) ->
                        [{fighter_ext_args_snow_def, 0, 0}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     2058),
                        []
                end,
            compare = fun (_, _, _) -> -1 end};
get_script(149000 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = buff,
            sec_type = snow_atk, compare = fun (_, _, _) -> -1 end};
get_script(153000 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = buff,
            eff =
                fun (#c_buff{args = [Val], duration = _Duration,
                             duration_left = _DurationLeft},
                     _Caster = #fighter{}, Target = #fighter{}) ->
                        combat_cache:u(Target, [{anger, 1, Val}]),
                        [{9, Val, 0}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     2086),
                        []
                end,
            compare = fun (_, _, _) -> -1 end};
get_script(155000 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = buff,
            sec_type = add_control_ratio,
            compare = fun (_, _, _) -> -1 end};
get_script(157000 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = buff,
            sec_type = rebound_atk,
            eff_val_before =
                fun (#c_buff{args = [ReboundNum]}, #fighter{},
                     _Target) ->
                        [{rebound_times, 0, ReboundNum},
                         {rebound_dmg_ratio, 0, 1000}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     2115),
                        []
                end,
            eff_val_after =
                fun (#c_buff{args = [_ShieldNum]}, _Self, _Target) ->
                        [{rebound_times, 0, 0}, {rebound_dmg_ratio, 0, 0}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     2125),
                        []
                end,
            compare = fun (_, _, _) -> -1 end};
get_script(157001 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = buff,
            sec_type = rebound_atk,
            eff_val_before =
                fun (#c_buff{args = [ReboundNum, BackRatio]},
                     #fighter{}, _Target) ->
                        [{rebound_times, 0, ReboundNum},
                         {rebound_dmg_ratio, 0, BackRatio}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     2143),
                        []
                end,
            eff_val_after =
                fun (#c_buff{args = [_ShieldNum, _BackRatio]}, _Self,
                     _Target) ->
                        [{rebound_times, 0, 0}, {rebound_dmg_ratio, 0, 0}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     2153),
                        []
                end,
            compare = fun (_, _, _) -> -1 end};
get_script(157002 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = buff,
            sec_type = rebound_atk,
            eff_val_before =
                fun (#c_buff{args = [ReboundNum, BackRatio]},
                     #fighter{}, _Target) ->
                        [{rebound_times, 0, ReboundNum},
                         {rebound_dmg_ratio, 0, BackRatio},
                         {rebound_type, 0, 0}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     2171),
                        []
                end,
            eff_val_after =
                fun (#c_buff{args = [_ShieldNum, _]}, _Self, _Target) ->
                        [{rebound_times, 0, 0},
                         {rebound_dmg_ratio, 0, 0},
                         {rebound_type, 0, 1}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     2181),
                        []
                end,
            compare = fun (_, _, _) -> -1 end};
get_script(158000 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = buff,
            sec_type = trap_buff,
            eff_val_before =
                fun (#c_buff{args = [TrapRatio, ActionBuffs]},
                     #fighter{id = Sid}, _Target) ->
                        [{trap_owener, 0, Sid},
                         {trap_ratio, 0, TrapRatio},
                         {trap_buff, 0, ActionBuffs}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     2201),
                        []
                end,
            eff_val_after =
                fun (#c_buff{args = [_TrapRatio, _ActionBuffs]}, _Self,
                     _Target) ->
                        [{trap_owener, 0, 0},
                         {trap_buff, 0, []},
                         {trap_ratio, 0, 0}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     2211),
                        []
                end,
            compare = fun (_, _, _) -> -1 end};
get_script(159000 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = debuff,
            sec_type = trap_buff,
            eff_val_before =
                fun (#c_buff{args = []}, #fighter{}, _Target) ->
                        [{has_fearless, 0, 1}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     2230),
                        []
                end,
            eff_val_after =
                fun (#c_buff{args = []}, _Self, _Target) ->
                        [{has_fearless, 0, 0}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     2240),
                        []
                end,
            compare = fun (_, _, _) -> -1 end};
get_script(163000 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = buff,
            compare = fun (_, _, _) -> -1 end};
get_script(200001 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = debuff,
            eff =
                fun (#c_buff{layer = Layer, args = [Ratio]}, Caster,
                     Target = #fighter{hp_max = HpMax, type = Ttype}) ->
                        case get(combat_type) of
                            56 when Ttype =:= 2 -> [];
                            65 when Ttype =:= 2 -> [];
                            _ ->
                                DmgHp = round(HpMax * Layer * Ratio / 1000),
                                combat_cache:u(Target, [{hp, 1, -DmgHp}]),
                                combat_stat:update_total_dmg(Caster, DmgHp),
                                [{0, -DmgHp, 0}]
                        end;
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     2281),
                        []
                end,
            recalc =
                fun (#c_buff{layer = Layer, args = [_Ratio]}, _Caster,
                     _Target) ->
                        [{bleed, 0, Layer}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     2291),
                        []
                end};
get_script(202010 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = debuff,
            eff =
                fun (#c_buff{args = [DmgHp]}, Caster = #fighter{},
                     Target = #fighter{}) ->
                        combat_cache:u(Target, [{hp, 1, -DmgHp}]),
                        combat_stat:update_total_dmg(Caster, DmgHp),
                        [{0, -DmgHp, 0}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     2310),
                        []
                end,
            compare = fun (_, _, _) -> -2 end};
get_script(202020 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = debuff,
            eff =
                fun (#c_buff{args = [MaxRatio, Val]},
                     Caster = #fighter{},
                     Target = #fighter{hp_max = HpMax}) ->
                        DmgHp = round(Val + HpMax * MaxRatio / 1000),
                        combat_cache:u(Target, [{hp, 1, -DmgHp}]),
                        combat_stat:update_total_dmg(Caster, DmgHp),
                        [{0, -DmgHp, 0}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     2331),
                        []
                end,
            tips_calc =
                fun (#c_buff{args = [MaxRatio, Val]},
                     _Caster = #fighter{}, _Target = #fighter{}) ->
                        [round(MaxRatio / 10), Val];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     2341),
                        []
                end,
            compare =
                fun (#c_buff{args = [MaxRatio, Val]}, _,
                     #fighter{hp_max = HpMax}) ->
                        round(Val + HpMax * MaxRatio / 1000);
                    (#c_buff{id = BuffId, args = Args}, _, _) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     2348),
                        -1
                end};
get_script(202021 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = debuff,
            eff =
                fun (#c_buff{args = [MaxRatio, Val]},
                     Caster = #fighter{},
                     Target = #fighter{hp = Hp, lev = Lev}) ->
                        DmgHp = min(round(Val + Hp * MaxRatio / 1000),
                                    Lev * 50),
                        combat_cache:u(Target, [{hp, 1, -DmgHp}]),
                        combat_stat:update_total_dmg(Caster, DmgHp),
                        [{0, -DmgHp, 0}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     2368),
                        []
                end,
            tips_calc =
                fun (#c_buff{args = [MaxRatio, Val]},
                     _Caster = #fighter{}, _Target = #fighter{}) ->
                        [round(MaxRatio / 10), Val];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     2378),
                        []
                end,
            compare =
                fun (#c_buff{args = [MaxRatio, Val]}, _,
                     #fighter{hp_max = HpMax}) ->
                        round(Val + HpMax * MaxRatio / 1000);
                    (#c_buff{id = BuffId, args = Args}, _, _) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     2385),
                        -1
                end};
get_script(203010 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = debuff,
            recalc =
                fun (#c_buff{args = [Val]}, _Caster, _Target) ->
                        [{phy_dmg, 1, -Val}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     2402),
                        []
                end,
            compare =
                fun (#c_buff{args = [Val]}, _, _) -> Val;
                    (#c_buff{id = BuffId, args = Args}, _, _) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     2409),
                        -1
                end};
get_script(203020 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = debuff,
            recalc =
                fun (#c_buff{args = [Ratio]}, _Caster, _Target) ->
                        [{phy_dmg, 3, -Ratio}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     2425),
                        []
                end,
            compare =
                fun (#c_buff{args = [Ratio]}, _, _) -> Ratio;
                    (#c_buff{id = BuffId, args = Args}, _, _) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     2432),
                        -1
                end};
get_script(203021 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = debuff,
            recalc =
                fun (#c_buff{args = [Ratio]}, _Caster, _Target) ->
                        [{phy_dmg, 3, -Ratio}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     2448),
                        []
                end,
            compare = fun (_, _, _) -> -1 end};
get_script(204010 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = debuff,
            recalc =
                fun (#c_buff{args = [Val]}, _Caster, _Target) ->
                        [{magic_dmg, 1, -Val}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     2466),
                        []
                end,
            compare =
                fun (#c_buff{args = [Val]}, _, _) -> Val;
                    (#c_buff{id = BuffId, args = Args}, _, _) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     2473),
                        -1
                end};
get_script(204020 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = debuff,
            recalc =
                fun (#c_buff{args = [Ratio]}, _Caster, _Target) ->
                        [{magic_dmg, 3, -Ratio}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     2489),
                        []
                end,
            compare =
                fun (#c_buff{args = [Ratio]}, _, _) -> Ratio;
                    (#c_buff{id = BuffId, args = Args}, _, _) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     2496),
                        -1
                end};
get_script(204021 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = debuff,
            recalc =
                fun (#c_buff{args = [Ratio]}, _Caster, _Target) ->
                        [{magic_dmg, 3, -Ratio}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     2512),
                        []
                end,
            compare = fun (_, _, _) -> -1 end};
get_script(205010 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = debuff,
            recalc =
                fun (#c_buff{args = [Val]}, _Caster, _Target) ->
                        [{phy_def, 1, -Val}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     2530),
                        []
                end,
            compare =
                fun (#c_buff{args = [Val]}, _, _) -> Val;
                    (#c_buff{id = BuffId, args = Args}, _, _) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     2537),
                        -1
                end};
get_script(205020 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = debuff,
            recalc =
                fun (#c_buff{args = [Ratio]}, _Caster, _Target) ->
                        [{phy_def, 3, -Ratio}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     2553),
                        []
                end,
            compare =
                fun (#c_buff{args = [Ratio]}, _, _) -> Ratio;
                    (#c_buff{id = BuffId, args = Args}, _, _) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     2560),
                        -1
                end};
get_script(206010 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = debuff,
            recalc =
                fun (#c_buff{args = [Val]}, _Caster, _Target) ->
                        [{magic_def, 1, -Val}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     2577),
                        []
                end,
            compare =
                fun (#c_buff{args = [Val]}, _, _) -> Val;
                    (#c_buff{id = BuffId, args = Args}, _, _) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     2584),
                        -1
                end};
get_script(206020 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = debuff,
            recalc =
                fun (#c_buff{args = [Ratio]}, _Caster, _Target) ->
                        [{magic_def, 3, -Ratio}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     2600),
                        []
                end,
            compare =
                fun (#c_buff{args = [Ratio]}, _, _) -> Ratio;
                    (#c_buff{id = BuffId, args = Args}, _, _) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     2607),
                        -1
                end};
get_script(207010 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = debuff,
            recalc =
                fun (#c_buff{args = [Val]}, _Caster, _Target) ->
                        [{crit, 1, -Val}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     2624),
                        []
                end,
            compare =
                fun (#c_buff{args = [Val]}, _, _) -> Val;
                    (#c_buff{id = BuffId, args = Args}, _, _) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     2631),
                        -1
                end};
get_script(207011 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = debuff,
            recalc =
                fun (#c_buff{args = [Val]}, _Caster, _Target) ->
                        [{phy_crit, 1, -Val}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     2647),
                        []
                end,
            compare =
                fun (#c_buff{args = [Val]}, _, _) -> Val;
                    (#c_buff{id = BuffId, args = Args}, _, _) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     2654),
                        -1
                end};
get_script(207012 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = debuff,
            recalc =
                fun (#c_buff{args = [Val]}, _Caster, _Target) ->
                        [{magic_crit, 1, -Val}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     2670),
                        []
                end,
            compare =
                fun (#c_buff{args = [Val]}, _, _) -> Val;
                    (#c_buff{id = BuffId, args = Args}, _, _) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     2677),
                        -1
                end};
get_script(208010 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = debuff,
            recalc =
                fun (#c_buff{args = [Val]}, _Caster, _Target) ->
                        [{tenacity, 1, -Val}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     2694),
                        []
                end,
            compare =
                fun (#c_buff{args = [Val]}, _, _) -> Val;
                    (#c_buff{id = BuffId, args = Args}, _, _) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     2701),
                        -1
                end};
get_script(208011 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = debuff,
            recalc =
                fun (#c_buff{args = [Val]}, _Caster, _Target) ->
                        [{phy_tenacity, 1, -Val}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     2717),
                        []
                end,
            compare =
                fun (#c_buff{args = [Val]}, _, _) -> Val;
                    (#c_buff{id = BuffId, args = Args}, _, _) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     2724),
                        -1
                end};
get_script(208012 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = debuff,
            recalc =
                fun (#c_buff{args = [Val]}, _Caster, _Target) ->
                        [{magic_tenacity, 1, -Val}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     2740),
                        []
                end,
            compare =
                fun (#c_buff{args = [Val]}, _, _) -> Val;
                    (#c_buff{id = BuffId, args = Args}, _, _) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     2747),
                        -1
                end};
get_script(209010 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = debuff,
            recalc =
                fun (#c_buff{args = [Val]}, _Caster, _Target) ->
                        [{d_accuracy, 1, -Val}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     2764),
                        []
                end,
            compare =
                fun (#c_buff{args = [Val]}, _, _) -> Val;
                    (#c_buff{id = BuffId, args = Args}, _, _) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     2771),
                        -1
                end};
get_script(209011 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = debuff,
            recalc =
                fun (#c_buff{args = [Val]}, _Caster, _Target) ->
                        [{d_phy_accuracy, 1, -Val}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     2787),
                        []
                end,
            compare =
                fun (#c_buff{args = [Val]}, _, _) -> Val;
                    (#c_buff{id = BuffId, args = Args}, _, _) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     2794),
                        -1
                end};
get_script(209012 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = debuff,
            recalc =
                fun (#c_buff{args = [Val]}, _Caster, _Target) ->
                        [{d_magic_accuracy, 1, -Val}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     2810),
                        []
                end,
            compare =
                fun (#c_buff{args = [Val]}, _, _) -> Val;
                    (#c_buff{id = BuffId, args = Args}, _, _) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     2817),
                        -1
                end};
get_script(210010 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = debuff,
            recalc =
                fun (#c_buff{args = [Val]}, _Caster, _Target) ->
                        [{d_evasion, 1, -Val}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     2834),
                        []
                end,
            compare =
                fun (#c_buff{args = [Val]}, _, _) -> Val;
                    (#c_buff{id = BuffId, args = Args}, _, _) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     2841),
                        -1
                end};
get_script(210011 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = debuff,
            recalc =
                fun (#c_buff{args = [Val]}, _Caster, _Target) ->
                        [{d_phy_evasion, 1, -Val}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     2857),
                        []
                end,
            compare =
                fun (#c_buff{args = [Val]}, _, _) -> Val;
                    (#c_buff{id = BuffId, args = Args}, _, _) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     2864),
                        -1
                end};
get_script(210012 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = debuff,
            recalc =
                fun (#c_buff{args = [Val]}, _Caster, _Target) ->
                        [{d_magic_evasion, 1, -Val}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     2880),
                        []
                end,
            compare =
                fun (#c_buff{args = [Val]}, _, _) -> Val;
                    (#c_buff{id = BuffId, args = Args}, _, _) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     2887),
                        -1
                end};
get_script(211010 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = debuff,
            recalc =
                fun (#c_buff{args = [Val]}, _Caster,
                     _Target = #fighter{}) ->
                        [{atk_speed, 1, -Val}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     2904),
                        []
                end,
            eff_val_before =
                fun (#c_buff{}, _Caster, _Target = #fighter{}) ->
                        combat_fighter:update_sort_action(),
                        [];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     2915),
                        []
                end,
            eff_val_after =
                fun (#c_buff{}, _Caster, _Target = #fighter{}) ->
                        combat_fighter:update_sort_action(),
                        [];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     2926),
                        []
                end,
            compare =
                fun (#c_buff{args = [Val]}, _, _) -> Val;
                    (#c_buff{id = BuffId, args = Args}, _, _) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     2933),
                        -1
                end};
get_script(211020 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = debuff,
            recalc =
                fun (#c_buff{args = [Ratio]}, _Caster,
                     _Target = #fighter{}) ->
                        [{atk_speed, 3, -Ratio}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     2949),
                        []
                end,
            eff_val_before =
                fun (#c_buff{}, _Caster, _Target = #fighter{}) ->
                        combat_fighter:update_sort_action(),
                        [];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     2960),
                        []
                end,
            eff_val_after =
                fun (#c_buff{}, _Caster, _Target = #fighter{}) ->
                        combat_fighter:update_sort_action(),
                        [];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     2971),
                        []
                end,
            compare =
                fun (#c_buff{args = [Ratio]}, _, _) -> Ratio;
                    (#c_buff{id = BuffId, args = Args}, _, _) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     2978),
                        -1
                end};
get_script(211021 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = debuff,
            recalc =
                fun (#c_buff{args = [Ratio, Base]}, _Caster,
                     _Target = #fighter{}) ->
                        [{atk_speed, 3, -Ratio}, {atk_speed, 1, -Base}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     2994),
                        []
                end,
            eff_val_before =
                fun (#c_buff{}, _Caster, _Target = #fighter{}) ->
                        combat_fighter:update_sort_action(),
                        [];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     3005),
                        []
                end,
            eff_val_after =
                fun (#c_buff{}, _Caster, _Target = #fighter{}) ->
                        combat_fighter:update_sort_action(),
                        [];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     3016),
                        []
                end};
get_script(211022 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = debuff,
            recalc =
                fun (#c_buff{args = [Ratio, Base]}, _Caster,
                     _Target = #fighter{}) ->
                        [{atk_speed, 3, -Ratio}, {atk_speed, 1, -Base}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     3032),
                        []
                end,
            eff_val_before =
                fun (#c_buff{}, _Caster, _Target = #fighter{}) ->
                        combat_fighter:update_sort_action(),
                        [];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     3043),
                        []
                end,
            eff_val_after =
                fun (#c_buff{}, _Caster, _Target = #fighter{}) ->
                        combat_fighter:update_sort_action(),
                        [];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     3054),
                        []
                end,
            compare = fun (_, _, _) -> -1 end};
get_script(212010 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = debuff,
            recalc =
                fun (#c_buff{args = [Val]}, _Caster, _Target) ->
                        [{phy_dmg, 1, -Val}, {magic_dmg, 1, -Val}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     3072),
                        []
                end,
            compare =
                fun (#c_buff{args = [Val]}, _, _) -> Val;
                    (#c_buff{id = BuffId, args = Args}, _, _) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     3079),
                        -1
                end};
get_script(212020 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = debuff,
            recalc =
                fun (#c_buff{args = [Ratio]}, _Caster, _Target) ->
                        [{phy_dmg, 3, -Ratio}, {magic_dmg, 3, -Ratio}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     3095),
                        []
                end,
            compare =
                fun (#c_buff{args = [Ratio]}, _, _) -> Ratio;
                    (#c_buff{id = BuffId, args = Args}, _, _) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     3102),
                        -1
                end};
get_script(216010 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = debuff,
            recalc =
                fun (#c_buff{args = [Val]}, _Caster, _Target) ->
                        [{phy_def, 1, -Val}, {magic_def, 1, -Val}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     3119),
                        []
                end,
            compare =
                fun (#c_buff{args = [Val]}, _, _) -> Val;
                    (#c_buff{id = BuffId, args = Args}, _, _) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     3126),
                        -1
                end};
get_script(216020 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = debuff,
            recalc =
                fun (#c_buff{args = [Ratio]}, _Caster, _Target) ->
                        [{phy_def, 3, -Ratio}, {magic_def, 3, -Ratio}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     3142),
                        []
                end,
            compare =
                fun (#c_buff{args = [Ratio]}, _, _) -> Ratio;
                    (#c_buff{id = BuffId, args = Args}, _, _) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     3149),
                        -1
                end};
get_script(217020 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = debuff,
            recalc =
                fun (#c_buff{args = [Ratio]}, _Caster, _Target) ->
                        [{d_dmg_ratio, 1, -Ratio}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     3166),
                        []
                end,
            compare =
                fun (#c_buff{args = [Ratio]}, _, _) -> Ratio;
                    (#c_buff{id = BuffId, args = Args}, _, _) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     3173),
                        -1
                end};
get_script(217021 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = debuff,
            recalc =
                fun (#c_buff{args = [Ratio]}, _Caster, _Target) ->
                        [{d_dmg_ratio, 1, -Ratio}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     3190),
                        []
                end,
            compare =
                fun (#c_buff{args = [_Ratio],
                             duration_left = DurationLeft},
                     _, _) ->
                        DurationLeft;
                    (#c_buff{id = BuffId, args = Args}, _, _) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     3197),
                        -1
                end};
get_script(217022 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = debuff,
            recalc =
                fun (#c_buff{args = [Ratio]}, _Caster, _Target) ->
                        [{d_phy_dmg_ratio, 1, -Ratio}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     3214),
                        []
                end};
get_script(217023 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = debuff,
            recalc =
                fun (#c_buff{args = [Ratio]}, _Caster, _Target) ->
                        [{d_magic_dmg_ratio, 1, -Ratio}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     3231),
                        []
                end};
get_script(221000 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = debuff,
            sec_type = control,
            recalc =
                fun (#c_buff{args = [_BuffLev, _]}, _Caster, _Target) ->
                        [{is_silent, 0, 1}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     3249),
                        []
                end,
            hit =
                fun (#c_buff{hit_rate = HitRate,
                             args = [BuffLev, MaxRatio]},
                     _Caster = #fighter{id = CasterId, type = Type,
                                        attr =
                                            #attr{enhance_control =
                                                      EnhanceControl},
                                        special_attr =
                                            #special_attr{control_num =
                                                              ControlNum}},
                     #fighter{lev = Tlev, type = TType,
                              attr = #attr{anti_control = AntiControl},
                              special_attr =
                                  #special_attr{anti_control_ratio =
                                                    AntiControlRatio},
                              ratio_val = RatioVal}) ->
                        ReduceRatio = case Type =:= 2 of
                                          true -> 1000;
                                          false ->
                                              if ControlNum =:= 0 -> 1000;
                                                 ControlNum =:= 1 -> 600;
                                                 ControlNum =:= 2 -> 300;
                                                 true -> 100
                                              end
                                      end,
                        NewTlev = case TType =:= 2 of
                                      true ->
                                          case RatioVal > 0 of
                                              true -> RatioVal;
                                              false -> Tlev
                                          end;
                                      false -> Tlev
                                  end,
                        Flag = case util:rand(1, 1000) =< AntiControlRatio of
                                   true -> false;
                                   false ->
                                       Ratio1 = round(HitRate +
                                                          (BuffLev - NewTlev) *
                                                              20
                                                          + EnhanceControl
                                                          - AntiControl),
                                       LastRatio = util:check_range(Ratio1,
                                                                    100,
                                                                    MaxRatio),
                                       util:rand(1, 1000) =<
                                           LastRatio * ReduceRatio / 1000
                               end,
                        case Flag of
                            true ->
                                combat_cache:u(CasterId, [{control_num, 1, 1}]);
                            false -> skip
                        end,
                        Flag;
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     3288),
                        false
                end,
            compare = fun (_, _, _) -> -1 end};
get_script(221001 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = debuff,
            sec_type = control,
            recalc =
                fun (#c_buff{args = [_MaxRatio]}, _Caster = #fighter{},
                     _Target) ->
                        [{is_silent, 0, 1}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     3307),
                        []
                end,
            hit =
                fun (#c_buff{hit_rate = HitRate, args = [MaxRatio]},
                     _Caster = #fighter{id = CasterId, lev = Slev,
                                        type = Type,
                                        attr =
                                            #attr{enhance_control =
                                                      EnhanceControl},
                                        special_attr =
                                            #special_attr{control_num =
                                                              ControlNum}},
                     #fighter{lev = Tlev, type = TType,
                              attr = #attr{anti_control = AntiControl},
                              special_attr =
                                  #special_attr{anti_control_ratio =
                                                    AntiControlRatio},
                              ratio_val = RatioVal}) ->
                        ReduceRatio = case Type =:= 2 of
                                          true -> 1000;
                                          false ->
                                              if ControlNum =:= 0 -> 1000;
                                                 ControlNum =:= 1 -> 600;
                                                 ControlNum =:= 2 -> 300;
                                                 true -> 100
                                              end
                                      end,
                        NewTlev = case TType =:= 2 of
                                      true ->
                                          case RatioVal > 0 of
                                              true -> RatioVal;
                                              false -> Tlev
                                          end;
                                      false -> Tlev
                                  end,
                        Flag = case util:rand(1, 1000) =< AntiControlRatio of
                                   true -> false;
                                   false ->
                                       Ratio1 = round(HitRate +
                                                          (Slev - NewTlev) * 20
                                                          + EnhanceControl
                                                          - AntiControl),
                                       LastRatio = util:check_range(Ratio1,
                                                                    100,
                                                                    MaxRatio),
                                       util:rand(1, 1000) =<
                                           LastRatio * ReduceRatio / 1000
                               end,
                        case Flag of
                            true ->
                                combat_cache:u(CasterId, [{control_num, 1, 1}]);
                            false -> skip
                        end,
                        Flag;
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     3346),
                        false
                end,
            compare = fun (_, _, _) -> -1 end};
get_script(221002 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = debuff,
            sec_type = control,
            eff_val_before =
                fun (#c_buff{args = [ModelId, _HurtRatio, _MaxRatio]},
                     _Caster, _Target = #fighter{}) ->
                        [{model_id, 0, ModelId}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     3365),
                        []
                end,
            eff_val_after =
                fun (#c_buff{args = [_ModelId, _HurtRatio, _MaxRatio]},
                     _Caster, _Target = #fighter{}) ->
                        [{model_id, 0, 0}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     3375),
                        []
                end,
            eff_before =
                fun (#c_buff{args = [ModelId, _HurtRatio, _MaxRatio]},
                     _Target) ->
                        [{3, ModelId, 0}];
                    (#c_buff{id = BuffId, args = Args}, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     3383),
                        []
                end,
            eff_after =
                fun (#c_buff{args = [_ModelId, _HurtRatio, _MaxRatio]},
                     _Target) ->
                        [{3, 0, 0}];
                    (#c_buff{id = BuffId, args = Args}, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     3391),
                        []
                end,
            recalc =
                fun (#c_buff{args = [_ModelId, HurtRatio, _MaxRatio]},
                     _Caster, _Target) ->
                        [{d_hurt_ratio, 1, HurtRatio}, {is_stun, 0, 1}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     3401),
                        []
                end,
            hit =
                fun (#c_buff{hit_rate = HitRate,
                             args = [_ModelId, _HurtRaio, MaxRatio]},
                     _Caster = #fighter{id = CasterId, type = Type,
                                        lev = Slev,
                                        attr =
                                            #attr{enhance_control =
                                                      EnhanceControl},
                                        special_attr =
                                            #special_attr{control_num =
                                                              ControlNum}},
                     #fighter{lev = Tlev, type = TType,
                              attr = #attr{anti_control = AntiControl},
                              special_attr =
                                  #special_attr{anti_control_ratio =
                                                    AntiControlRatio},
                              ratio_val = RatioVal}) ->
                        ReduceRatio = case Type =:= 2 of
                                          true -> 1000;
                                          false ->
                                              if ControlNum =:= 0 -> 1000;
                                                 ControlNum =:= 1 -> 600;
                                                 ControlNum =:= 2 -> 300;
                                                 true -> 100
                                              end
                                      end,
                        NewTlev = case TType =:= 2 of
                                      true ->
                                          case RatioVal > 0 of
                                              true -> RatioVal;
                                              false -> Tlev
                                          end;
                                      false -> Tlev
                                  end,
                        Flag = case util:rand(1, 1000) =< AntiControlRatio of
                                   true -> false;
                                   false ->
                                       Ratio1 = round(HitRate +
                                                          (Slev - NewTlev) * 20
                                                          + EnhanceControl
                                                          - AntiControl),
                                       LastRatio = util:check_range(Ratio1,
                                                                    100,
                                                                    MaxRatio),
                                       util:rand(1, 1000) =<
                                           LastRatio * ReduceRatio / 1000
                               end,
                        case Flag of
                            true ->
                                combat_cache:u(CasterId, [{control_num, 1, 1}]);
                            false -> skip
                        end,
                        Flag;
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     3440),
                        false
                end,
            compare = fun (_, _, _) -> -1 end};
get_script(222000 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = debuff,
            sec_type = control,
            recalc =
                fun (#c_buff{args =
                                 [_BuffLev, _MaxLev, DmgRatio, HurtRatio]},
                     _Caster = #fighter{pid = Spid}, _Target) ->
                        [{is_taunt, 0, 1},
                         {taunt_pid, 0, Spid},
                         {d_dmg_ratio, 1, -DmgRatio},
                         {d_hurt_ratio, 1, HurtRatio}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     3459),
                        []
                end,
            hit =
                fun (#c_buff{hit_rate = HitRate,
                             args = [BuffLev, MaxRatio, _DmgRatio, _HurtRatio]},
                     _Caster = #fighter{id = CasterId, type = Type,
                                        attr =
                                            #attr{enhance_control =
                                                      EnhanceControl},
                                        special_attr =
                                            #special_attr{control_num =
                                                              ControlNum},
                                        buffs = CasterBuffs},
                     #fighter{lev = Tlev,
                              attr = #attr{anti_control = AntiControl},
                              special_attr =
                                  #special_attr{anti_control_ratio =
                                                    AntiControlRatio},
                              ratio_val = RatioVal}) ->
                        ReduceRatio = case Type of
                                          2 -> 1000;
                                          1 ->
                                              if ControlNum =:= 0 -> 1000;
                                                 ControlNum =:= 1 -> 700;
                                                 ControlNum =:= 2 -> 200;
                                                 true -> 100
                                              end;
                                          4 ->
                                              if ControlNum =:= 0 -> 1000;
                                                 ControlNum =:= 1 -> 700;
                                                 ControlNum =:= 2 -> 200;
                                                 true -> 100
                                              end;
                                          _ ->
                                              if ControlNum =:= 0 -> 1000;
                                                 ControlNum =:= 1 -> 400;
                                                 ControlNum =:= 2 -> 200;
                                                 true -> 100
                                              end
                                      end,
                        AddRatio = case lists:keyfind(add_control_ratio,
                                                      #c_buff.sec_type,
                                                      CasterBuffs)
                                       of
                                       #c_buff{layer = Layer, args = [Ar]} ->
                                           round(Layer * Ar);
                                       _ -> 0
                                   end,
                        NewTlev = case Type =:= 2 of
                                      true ->
                                          case RatioVal > 0 of
                                              true -> RatioVal;
                                              false -> Tlev
                                          end;
                                      false -> Tlev
                                  end,
                        Flag = case util:rand(1, 1000) =< AntiControlRatio of
                                   true -> false;
                                   false ->
                                       Ratio1 = round(HitRate +
                                                          (BuffLev - NewTlev) *
                                                              20
                                                          + EnhanceControl
                                                          - AntiControl),
                                       LastRatio = min(util:check_range(Ratio1,
                                                                        300,
                                                                        MaxRatio)
                                                           + AddRatio,
                                                       1000),
                                       case env:get(gm_notice) of
                                           1 ->
                                               Msg =
                                                   notice:format(lang:get("免封概率:~w, 基础概率:~w, 等级差:~w, 控制加强:~w, 怪物抵抗~w, "
                                                                          "附加概率:~w, 总概率:~w"),
                                                                 [AntiControlRatio,
                                                                  HitRate,
                                                                  BuffLev -
                                                                      NewTlev,
                                                                  EnhanceControl,
                                                                  AntiControl,
                                                                  AddRatio,
                                                                  round(LastRatio
                                                                            *
                                                                            ReduceRatio
                                                                            /
                                                                            1000)]),
                                               notice:cast(all, 3, Msg);
                                           _ -> ok
                                       end,
                                       util:rand(1, 1000) =<
                                           LastRatio * ReduceRatio / 1000
                               end,
                        case Flag of
                            true ->
                                combat_cache:u(CasterId, [{control_num, 1, 1}]);
                            false -> skip
                        end,
                        Flag;
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     3526),
                        false
                end,
            compare = fun (_, _, _) -> -1 end};
get_script(222001 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = debuff,
            sec_type = control,
            recalc =
                fun (#c_buff{args = [_MaxRatio, DmgRatio, HurtRatio]},
                     _Caster = #fighter{pid = Spid}, _Target) ->
                        [{is_taunt, 0, 1},
                         {taunt_pid, 0, Spid},
                         {d_dmg_ratio, 1, -DmgRatio},
                         {d_hurt_ratio, 1, HurtRatio}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     3544),
                        []
                end,
            hit =
                fun (#c_buff{hit_rate = HitRate,
                             args = [MaxRatio, _DmgRatio, _HurtRatio]},
                     _Caster = #fighter{id = CasterId, lev = Slev,
                                        type = Type,
                                        attr =
                                            #attr{enhance_control =
                                                      EnhanceControl},
                                        special_attr =
                                            #special_attr{control_num =
                                                              ControlNum}},
                     #fighter{lev = Tlev, type = TType,
                              attr = #attr{anti_control = AntiControl},
                              special_attr =
                                  #special_attr{anti_control_ratio =
                                                    AntiControlRatio},
                              ratio_val = RatioVal}) ->
                        ReduceRatio = case Type =:= 2 of
                                          true -> 1000;
                                          false ->
                                              if ControlNum =:= 0 -> 1000;
                                                 ControlNum =:= 1 -> 400;
                                                 ControlNum =:= 2 -> 200;
                                                 true -> 100
                                              end
                                      end,
                        NewTlev = case TType =:= 2 of
                                      true ->
                                          case RatioVal > 0 of
                                              true -> RatioVal;
                                              false -> Tlev
                                          end;
                                      false -> Tlev
                                  end,
                        Flag = case util:rand(1, 1000) =< AntiControlRatio of
                                   true -> false;
                                   false ->
                                       Ratio1 = round(HitRate +
                                                          (Slev - NewTlev) * 20
                                                          + EnhanceControl
                                                          - AntiControl),
                                       LastRatio = util:check_range(Ratio1,
                                                                    100,
                                                                    MaxRatio),
                                       util:rand(1, 1000) =<
                                           LastRatio * ReduceRatio / 1000
                               end,
                        case Flag of
                            true ->
                                combat_cache:u(CasterId, [{control_num, 1, 1}]);
                            false -> skip
                        end,
                        Flag;
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     3584),
                        false
                end,
            compare = fun (_, _, _) -> -1 end};
get_script(223000 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = debuff,
            sec_type = control,
            recalc =
                fun (#c_buff{args = [_BuffLev, _MaxRatio]}, _Caster,
                     _Target) ->
                        [{is_seal, 0, 1}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     3603),
                        []
                end,
            hit =
                fun (#c_buff{hit_rate = HitRate,
                             args = [BuffLev, MaxRatio]},
                     _Caster = #fighter{id = CasterId, buffs = CasterBuffs,
                                        type = Type,
                                        attr =
                                            #attr{enhance_control =
                                                      EnhanceControl},
                                        special_attr =
                                            #special_attr{control_num =
                                                              ControlNum}},
                     #fighter{lev = Tlev, type = TType,
                              attr = #attr{anti_control = AntiControl},
                              special_attr =
                                  #special_attr{anti_control_ratio =
                                                    AntiControlRatio},
                              ratio_val = RatioVal}) ->
                        ReduceRatio = case Type =:= 2 of
                                          true -> 1000;
                                          false ->
                                              if ControlNum =:= 0 -> 1000;
                                                 ControlNum =:= 1 -> 600;
                                                 ControlNum =:= 2 -> 300;
                                                 true -> 100
                                              end
                                      end,
                        NewTlev = case TType =:= 2 of
                                      true ->
                                          case RatioVal > 0 of
                                              true -> RatioVal;
                                              false -> Tlev
                                          end;
                                      false -> Tlev
                                  end,
                        AddRatio = case lists:keyfind(add_control_ratio,
                                                      #c_buff.sec_type,
                                                      CasterBuffs)
                                       of
                                       #c_buff{layer = Layer, args = [Ar]} ->
                                           round(Layer * Ar);
                                       _ -> 0
                                   end,
                        Flag = case util:rand(1, 1000) =< AntiControlRatio of
                                   true -> false;
                                   false ->
                                       Ratio1 = round(HitRate +
                                                          (BuffLev - NewTlev) *
                                                              20
                                                          + EnhanceControl
                                                          - AntiControl
                                                          + AddRatio),
                                       LastRatio = util:check_range(Ratio1,
                                                                    100,
                                                                    MaxRatio),
                                       util:rand(1, 1000) =<
                                           LastRatio * ReduceRatio / 1000
                               end,
                        case Flag of
                            true ->
                                combat_cache:u(CasterId, [{control_num, 1, 1}]);
                            false -> skip
                        end,
                        Flag;
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     3647),
                        false
                end,
            compare = fun (_, _, _) -> -1 end};
get_script(223001 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = debuff,
            sec_type = control,
            recalc =
                fun (#c_buff{args = [_MaxRatio]}, _Caster, _Target) ->
                        [{is_seal, 0, 1}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     3665),
                        []
                end,
            hit =
                fun (#c_buff{hit_rate = HitRate, args = [MaxRatio]},
                     _Caster = #fighter{id = CasterId, lev = Slev,
                                        type = Type,
                                        attr =
                                            #attr{enhance_control =
                                                      EnhanceControl},
                                        special_attr =
                                            #special_attr{control_num =
                                                              ControlNum}},
                     #fighter{lev = Tlev, type = TType,
                              attr = #attr{anti_control = AntiControl},
                              special_attr =
                                  #special_attr{anti_control_ratio =
                                                    AntiControlRatio},
                              ratio_val = RatioVal}) ->
                        ReduceRatio = case Type =:= 2 of
                                          true -> 1000;
                                          false ->
                                              if ControlNum =:= 0 -> 1000;
                                                 ControlNum =:= 1 -> 600;
                                                 ControlNum =:= 2 -> 300;
                                                 true -> 100
                                              end
                                      end,
                        NewTlev = case TType =:= 2 of
                                      true ->
                                          case RatioVal > 0 of
                                              true -> RatioVal;
                                              false -> Tlev
                                          end;
                                      false -> Tlev
                                  end,
                        Flag = case util:rand(1, 1000) =< AntiControlRatio of
                                   true -> false;
                                   false ->
                                       Ratio1 = round(HitRate +
                                                          (Slev - NewTlev) * 20
                                                          + EnhanceControl
                                                          - AntiControl),
                                       LastRatio = util:check_range(Ratio1,
                                                                    100,
                                                                    MaxRatio),
                                       util:rand(1, 1000) =<
                                           LastRatio * ReduceRatio / 1000
                               end,
                        case Flag of
                            true ->
                                combat_cache:u(CasterId, [{control_num, 1, 1}]);
                            false -> skip
                        end,
                        Flag;
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     3704),
                        false
                end,
            compare = fun (_, _, _) -> -1 end};
get_script(223002 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = debuff,
            sec_type = control,
            recalc =
                fun (#c_buff{args =
                                 [_MaxRatio,
                                  _Ratio1,
                                  _Ratio2,
                                  _Ratio3,
                                  _Ratio4]},
                     _Caster, _Target) ->
                        [{is_seal, 0, 1}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     3723),
                        []
                end,
            hit =
                fun (#c_buff{hit_rate = HitRate,
                             args = [MaxRatio, Rate1, Rate2, Rate3, Rate4]},
                     _Caster = #fighter{id = CasterId, lev = _Slev,
                                        type = Type,
                                        attr =
                                            #attr{enhance_control =
                                                      EnhanceControl},
                                        special_attr =
                                            #special_attr{control_num =
                                                              ControlNum},
                                        pet_attr = PetAttr},
                     #fighter{lev = Tlev, type = TType,
                              attr = #attr{anti_control = AntiControl},
                              special_attr =
                                  #special_attr{anti_control_ratio =
                                                    AntiControlRatio},
                              ratio_val = RatioVal}) ->
                        ReduceRatio = case Type =:= 2 of
                                          true -> 1000;
                                          false ->
                                              if ControlNum =:= 0 -> 1000;
                                                 ControlNum =:= 1 -> 600;
                                                 ControlNum =:= 2 -> 300;
                                                 true -> 100
                                              end
                                      end,
                        _NewTlev = case TType =:= 2 of
                                       true ->
                                           case RatioVal > 0 of
                                               true -> RatioVal;
                                               false -> Tlev
                                           end;
                                       false -> Tlev
                                   end,
                        NewHitRate = case PetAttr of
                                         {Pstr, Pcon, Pmag, Pagi, Pend} ->
                                             combat_pet:calc_agi_ratio({Pstr,
                                                                        Pcon,
                                                                        Pmag,
                                                                        Pagi,
                                                                        Pend},
                                                                       [Rate1,
                                                                        Rate2,
                                                                        Rate3,
                                                                        Rate4]);
                                         _ -> HitRate
                                     end,
                        NewHitRate1 = case TType =:= 1 orelse TType =:= 4 of
                                          true -> NewHitRate / 3;
                                          false -> NewHitRate
                                      end,
                        Flag = case util:rand(1, 1000) =< AntiControlRatio of
                                   true -> false;
                                   false ->
                                       Ratio1 = round(NewHitRate1 +
                                                          EnhanceControl
                                                          - AntiControl),
                                       LastRatio = util:check_range(Ratio1,
                                                                    100,
                                                                    MaxRatio),
                                       util:rand(1, 1000) =<
                                           LastRatio * ReduceRatio / 1000
                               end,
                        case Flag of
                            true ->
                                combat_cache:u(CasterId, [{control_num, 1, 1}]);
                            false -> skip
                        end,
                        Flag;
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     3775),
                        false
                end,
            compare = fun (_, _, _) -> -1 end};
get_script(225000 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = debuff,
            recalc =
                fun (#c_buff{args = [Ratio]}, _Caster, _Target) ->
                        [{d_hurt_ratio, 1, Ratio}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     3793),
                        []
                end,
            compare =
                fun (#c_buff{args = [Ratio]}, _, _) -> Ratio;
                    (#c_buff{id = BuffId, args = Args}, _, _) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     3800),
                        -1
                end};
get_script(225001 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = debuff,
            recalc =
                fun (#c_buff{args = [Ratio], layer = Layer}, _Caster,
                     _Target) ->
                        [{d_hurt_ratio, 1, Ratio * Layer}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     3818),
                        []
                end,
            compare =
                fun (#c_buff{args = [Ratio]}, _, _) -> Ratio;
                    (#c_buff{id = BuffId, args = Args}, _, _) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     3825),
                        -1
                end};
get_script(227000 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = debuff,
            recalc =
                fun (#c_buff{args = [Ratio]}, _Caster, _Target) ->
                        [{d_hurt_ratio, 1, Ratio}, {is_weakness, 0, 1}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     3842),
                        []
                end,
            compare = fun (_, _, _) -> -1 end};
get_script(228000 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = debuff,
            recalc =
                fun (#c_buff{args = []}, _Caster, _Target) ->
                        [{is_rest, 0, 1}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     3860),
                        []
                end,
            compare = fun (_, _, _) -> -1 end};
get_script(230020 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = debuff,
            recalc =
                fun (#c_buff{args = [Ratio]}, _Caster, _Target) ->
                        [{d_eff_heal_ratio, 1, -Ratio}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     3878),
                        []
                end,
            compare =
                fun (#c_buff{args = [Ratio]}, _, _) -> Ratio;
                    (#c_buff{id = BuffId, args = Args}, _, _) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     3885),
                        -1
                end};
get_script(230021 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = debuff,
            recalc =
                fun (#c_buff{args = [Ratio]}, _Caster, _Target) ->
                        [{d_heal_ratio, 1, -Ratio}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     3901),
                        []
                end,
            compare =
                fun (#c_buff{args = [Ratio]}, _, _) -> Ratio;
                    (#c_buff{id = BuffId, args = Args}, _, _) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     3908),
                        -1
                end};
get_script(234000 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = debuff,
            sec_type = control,
            recalc =
                fun (#c_buff{args = [SkillId, _]}, _Self, _Target) ->
                        [{is_chaos, 0, 1}, {chaos_skill, 0, SkillId}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     3926),
                        []
                end,
            eff_val_before =
                fun (#c_buff{},
                     #fighter{combat_init_attr =
                                  #combat_init_attr{add_chaos_ratio =
                                                        AddChaosRatio}},
                     _Target) ->
                        [{chaos_ratio, 1, AddChaosRatio}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     3936),
                        []
                end,
            eff_val_after =
                fun (#c_buff{}, _Caster, _Target = #fighter{}) ->
                        [{chaos_ratio, 0, 300}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     3946),
                        []
                end,
            hit =
                fun (#c_buff{hit_rate = HitRate, args = [_, MaxRatio]},
                     _Caster = #fighter{id = CasterId, lev = Slev,
                                        type = Type,
                                        attr =
                                            #attr{enhance_control =
                                                      EnhanceControl},
                                        special_attr =
                                            #special_attr{control_num =
                                                              ControlNum}},
                     #fighter{lev = Tlev, type = TType,
                              attr = #attr{anti_control = AntiControl},
                              special_attr =
                                  #special_attr{anti_control_ratio =
                                                    AntiControlRatio},
                              ratio_val = RatioVal}) ->
                        ReduceRatio = case Type =:= 2 of
                                          true -> 1000;
                                          false ->
                                              if ControlNum =:= 0 -> 1000;
                                                 ControlNum =:= 1 -> 600;
                                                 ControlNum =:= 2 -> 300;
                                                 true -> 100
                                              end
                                      end,
                        NewTlev = case TType =:= 2 of
                                      true ->
                                          case RatioVal > 0 of
                                              true -> RatioVal;
                                              false -> Tlev
                                          end;
                                      false -> Tlev
                                  end,
                        Flag = case util:rand(1, 1000) =< AntiControlRatio of
                                   true -> false;
                                   false ->
                                       LastRatio = case Type of
                                                       3 -> round(HitRate);
                                                       6 -> round(HitRate);
                                                       _ ->
                                                           Ratio1 =
                                                               round(HitRate +
                                                                         (Slev -
                                                                              NewTlev)
                                                                             *
                                                                             20
                                                                         +
                                                                         EnhanceControl
                                                                         -
                                                                         AntiControl),
                                                           util:check_range(Ratio1,
                                                                            100,
                                                                            MaxRatio)
                                                   end,
                                       LastRatio1 = LastRatio * ReduceRatio /
                                                        1000,
                                       util:rand(1, 1000) =< LastRatio1
                               end,
                        case Flag of
                            true ->
                                combat_cache:u(CasterId, [{control_num, 1, 1}]);
                            false -> skip
                        end,
                        Flag;
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     3993),
                        false
                end,
            compare = fun (_, _, _) -> -1 end};
get_script(234001 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = debuff,
            sec_type = control,
            recalc =
                fun (#c_buff{args = [SkillId, _, _BuffLev]}, _Self,
                     _Target) ->
                        [{is_chaos, 0, 1}, {chaos_skill, 0, SkillId}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     4012),
                        []
                end,
            eff_val_before =
                fun (#c_buff{},
                     #fighter{combat_init_attr =
                                  #combat_init_attr{add_chaos_ratio =
                                                        AddChaosRatio}},
                     _Target) ->
                        [{chaos_ratio, 1, AddChaosRatio}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     4022),
                        []
                end,
            eff_val_after =
                fun (#c_buff{}, _Caster, _Target = #fighter{}) ->
                        [{chaos_ratio, 0, 300}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     4032),
                        []
                end,
            hit =
                fun (#c_buff{hit_rate = HitRate,
                             args = [_, MaxRatio, BuffLev]},
                     _Caster = #fighter{id = CasterId, type = Type,
                                        buffs = CasterBuffs,
                                        attr =
                                            #attr{enhance_control =
                                                      EnhanceControl},
                                        special_attr =
                                            #special_attr{control_num =
                                                              ControlNum}},
                     #fighter{lev = Tlev, type = TType,
                              attr = #attr{anti_control = AntiControl},
                              special_attr =
                                  #special_attr{anti_control_ratio =
                                                    AntiControlRatio},
                              ratio_val = RatioVal}) ->
                        ReduceRatio = case Type =:= 2 of
                                          true -> 1000;
                                          false ->
                                              if ControlNum =:= 0 -> 1000;
                                                 ControlNum =:= 1 -> 600;
                                                 ControlNum =:= 2 -> 300;
                                                 true -> 100
                                              end
                                      end,
                        NewTlev = case TType =:= 2 of
                                      true ->
                                          case RatioVal > 0 of
                                              true -> RatioVal;
                                              false -> Tlev
                                          end;
                                      false -> Tlev
                                  end,
                        AddRatio = case lists:keyfind(add_control_ratio,
                                                      #c_buff.sec_type,
                                                      CasterBuffs)
                                       of
                                       #c_buff{layer = Layer, args = [Ar]} ->
                                           round(Layer * Ar);
                                       _ -> 0
                                   end,
                        Flag = case util:rand(1, 1000) =< AntiControlRatio of
                                   true -> false;
                                   false ->
                                       Ratio1 = round(HitRate +
                                                          (BuffLev - NewTlev) *
                                                              20
                                                          + EnhanceControl
                                                          - AntiControl),
                                       LastRatio = min(util:check_range(Ratio1,
                                                                        100,
                                                                        MaxRatio)
                                                           + AddRatio,
                                                       1000),
                                       util:rand(1, 1000) =<
                                           LastRatio * ReduceRatio / 1000
                               end,
                        case Flag of
                            true ->
                                combat_cache:u(CasterId, [{control_num, 1, 1}]);
                            false -> skip
                        end,
                        Flag;
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     4076),
                        false
                end,
            compare = fun (_, _, _) -> -1 end};
get_script(234002 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = debuff,
            sec_type = control,
            recalc =
                fun (#c_buff{}, _Caster, _Target) ->
                        [{is_chaos, 0, 1}, {chaos_skill, 0, 0}]
                end,
            hit =
                fun (#c_buff{}, #fighter{}, #fighter{}) -> true;
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     4099),
                        false
                end,
            compare = fun (_, _, _) -> -1 end};
get_script(235000 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = debuff,
            sec_type = control,
            recalc =
                fun (#c_buff{}, _Caster, _Target) -> [{is_stun, 0, 1}]
                end,
            hit =
                fun (#c_buff{hit_rate = HitRate, args = [MaxRatio]},
                     _Caster = #fighter{id = CasterId, lev = Slev,
                                        type = Type,
                                        attr =
                                            #attr{enhance_control =
                                                      EnhanceControl},
                                        special_attr =
                                            #special_attr{control_num =
                                                              ControlNum}},
                     #fighter{lev = Tlev, type = TType,
                              attr = #attr{anti_control = AntiControl},
                              special_attr =
                                  #special_attr{anti_control_ratio =
                                                    AntiControlRatio},
                              ratio_val = RatioVal}) ->
                        ReduceRatio = case Type =:= 2 of
                                          true -> 1000;
                                          false ->
                                              if ControlNum =:= 0 -> 1000;
                                                 ControlNum =:= 1 -> 600;
                                                 ControlNum =:= 2 -> 300;
                                                 true -> 100
                                              end
                                      end,
                        NewTlev = case TType =:= 2 of
                                      true ->
                                          case RatioVal > 0 of
                                              true -> RatioVal;
                                              false -> Tlev
                                          end;
                                      false -> Tlev
                                  end,
                        Flag = case util:rand(1, 1000) =< AntiControlRatio of
                                   true -> false;
                                   false ->
                                       LastRatio = case Type of
                                                       3 -> round(HitRate);
                                                       6 -> round(HitRate);
                                                       _ ->
                                                           Ratio1 =
                                                               round(HitRate +
                                                                         (Slev -
                                                                              NewTlev)
                                                                             *
                                                                             20
                                                                         +
                                                                         EnhanceControl
                                                                         -
                                                                         AntiControl),
                                                           util:check_range(Ratio1,
                                                                            100,
                                                                            MaxRatio)
                                                   end,
                                       LastRatio1 = LastRatio * ReduceRatio /
                                                        1000,
                                       util:rand(1, 1000) =< LastRatio1
                               end,
                        case Flag of
                            true ->
                                combat_cache:u(CasterId, [{control_num, 1, 1}]);
                            false -> skip
                        end,
                        Flag;
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     4162),
                        false
                end,
            compare = fun (_, _, _) -> -1 end};
get_script(235001 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = debuff,
            sec_type = control,
            recalc =
                fun (#c_buff{}, _Caster, _Target) -> [{is_stun, 0, 1}]
                end,
            hit =
                fun (#c_buff{}, #fighter{}, #fighter{}) -> true;
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     4185),
                        false
                end,
            compare = fun (_, _, _) -> -1 end};
get_script(235002 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = debuff,
            sec_type = control,
            recalc =
                fun (#c_buff{}, _Caster, _Target) -> [{is_stun, 0, 1}]
                end,
            hit =
                fun (#c_buff{hit_rate = HitRate, args = [MaxRatio]},
                     _Caster = #fighter{id = CasterId, lev = Slev,
                                        type = Type,
                                        attr =
                                            #attr{enhance_control =
                                                      EnhanceControl},
                                        special_attr =
                                            #special_attr{control_num =
                                                              ControlNum}},
                     #fighter{lev = Tlev, type = TType,
                              attr = #attr{anti_control = AntiControl},
                              special_attr =
                                  #special_attr{anti_control_ratio =
                                                    AntiControlRatio},
                              ratio_val = RatioVal}) ->
                        ReduceRatio = case Type =:= 2 of
                                          true -> 1000;
                                          false ->
                                              if ControlNum =:= 0 -> 1000;
                                                 ControlNum =:= 1 -> 600;
                                                 ControlNum =:= 2 -> 300;
                                                 true -> 100
                                              end
                                      end,
                        NewTlev = case TType =:= 2 of
                                      true ->
                                          case RatioVal > 0 of
                                              true -> RatioVal;
                                              false -> Tlev
                                          end;
                                      false -> Tlev
                                  end,
                        NewAntiControlRatio = case TType =:= 2 of
                                                  true -> AntiControlRatio;
                                                  _ -> 0
                                              end,
                        Flag = case util:rand(1, 1000) =< NewAntiControlRatio of
                                   true -> false;
                                   false ->
                                       LastRatio = case Type of
                                                       3 -> round(HitRate);
                                                       6 -> round(HitRate);
                                                       _ ->
                                                           Ratio1 =
                                                               round(HitRate +
                                                                         (Slev -
                                                                              NewTlev)
                                                                             *
                                                                             20
                                                                         +
                                                                         EnhanceControl
                                                                         -
                                                                         AntiControl),
                                                           util:check_range(Ratio1,
                                                                            100,
                                                                            MaxRatio)
                                                   end,
                                       LastRatio1 = LastRatio * ReduceRatio /
                                                        1000,
                                       util:rand(1, 1000) =< LastRatio1
                               end,
                        case Flag of
                            true ->
                                combat_cache:u(CasterId, [{control_num, 1, 1}]);
                            false -> skip
                        end,
                        Flag;
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     4252),
                        false
                end,
            compare = fun (_, _, _) -> -1 end};
get_script(236000 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = debuff,
            sec_type = control,
            eff_val_before =
                fun (#c_buff{}, _Caster,
                     _Target = #fighter{name = _Tname}) ->
                        [{next_action_stay, 0, 1}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     4272),
                        []
                end,
            eff_val_after =
                fun (#c_buff{}, _Caster,
                     _Target = #fighter{name = _Tname}) ->
                        [{next_action_stay, 0, 0}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     4282),
                        []
                end,
            hit =
                fun (#c_buff{hit_rate = HitRate, args = [MaxRatio]},
                     _Caster = #fighter{id = CasterId, lev = Slev,
                                        type = Type,
                                        attr =
                                            #attr{enhance_control =
                                                      EnhanceControl},
                                        special_attr =
                                            #special_attr{control_num =
                                                              ControlNum}},
                     _Target = #fighter{lev = Tlev, type = TType,
                                        attr =
                                            #attr{anti_control = AntiControl},
                                        special_attr =
                                            #special_attr{anti_control_ratio =
                                                              AntiControlRatio,
                                                          has_fearless =
                                                              HasFearLess},
                                        ratio_val = RatioVal}) ->
                        ReduceRatio = case Type =:= 2 of
                                          true -> 1000;
                                          false ->
                                              if ControlNum =:= 0 -> 1000;
                                                 true -> 0
                                              end
                                      end,
                        NewTlev = case TType =:= 2 of
                                      true ->
                                          case RatioVal > 0 of
                                              true -> RatioVal;
                                              false -> Tlev
                                          end;
                                      false -> Tlev
                                  end,
                        Flag = case util:rand(1, 1000) =< AntiControlRatio of
                                   true -> false;
                                   false ->
                                       case HasFearLess of
                                           1 -> false;
                                           _ ->
                                               LastRatio = case Type of
                                                               3 ->
                                                                   round(HitRate);
                                                               6 ->
                                                                   round(HitRate);
                                                               _ ->
                                                                   Ratio1 =
                                                                       round(HitRate
                                                                                 +
                                                                                 (Slev
                                                                                      -
                                                                                      NewTlev)
                                                                                     *
                                                                                     19
                                                                                 +
                                                                                 EnhanceControl
                                                                                 -
                                                                                 AntiControl),
                                                                   util:check_range(Ratio1,
                                                                                    100,
                                                                                    MaxRatio)
                                                           end,
                                               LastRatio1 = LastRatio *
                                                                ReduceRatio
                                                                / 1000,
                                               util:rand(1, 1000) =< LastRatio1
                                       end
                               end,
                        case Flag of
                            true ->
                                BraveBuff = to_combat_buff({70056,
                                                            1000,
                                                            3,
                                                            1,
                                                            []},
                                                           normal),
                                logger:debug("增加勇敢buff:~w",
                                             [BraveBuff],
                                             combat_script_buff,
                                             4328),
                                combat_buff:buff_add(BraveBuff,
                                                     _Caster,
                                                     _Target),
                                combat_cache:u(CasterId, [{control_num, 1, 1}]);
                            false -> skip
                        end,
                        Flag;
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     4335),
                        false
                end,
            compare = fun (_, _, _) -> -1 end};
get_script(237000 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = debuff,
            recalc =
                fun (#c_buff{}, _Caster, _Target) ->
                        [{cannot_revive, 0, 1}]
                end,
            compare = fun (_, _, _) -> -1 end};
get_script(238000 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = debuff,
            recalc =
                fun (#c_buff{}, _Caster, _Target) -> [{can_crit, 0, 0}]
                end,
            compare = fun (_, _, _) -> -1 end};
get_script(239000 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = debuff,
            sec_type = control,
            recalc =
                fun (#c_buff{args = [Ratio, _BuffLev, _MaxRatio]},
                     _Caster, _Target) ->
                        [{d_reduce_dmg, 1, Ratio}, {is_stun, 0, 1}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     4384),
                        []
                end,
            hit =
                fun (#c_buff{hit_rate = HitRate,
                             args = [_, BuffLev, MaxRatio]},
                     _Caster = #fighter{id = CasterId, type = Type,
                                        attr =
                                            #attr{enhance_control =
                                                      EnhanceControl},
                                        special_attr =
                                            #special_attr{control_num =
                                                              ControlNum}},
                     #fighter{lev = Tlev,
                              attr = #attr{anti_control = AntiControl},
                              special_attr =
                                  #special_attr{anti_control_ratio =
                                                    AntiControlRatio}}) ->
                        ReduceRatio = case Type =:= 2 of
                                          true -> 1000;
                                          false ->
                                              if ControlNum =:= 0 -> 1000;
                                                 ControlNum =:= 1 -> 600;
                                                 ControlNum =:= 2 -> 300;
                                                 true -> 100
                                              end
                                      end,
                        Flag = case util:rand(1, 1000) =< AntiControlRatio of
                                   true -> false;
                                   false ->
                                       Ratio1 = round(HitRate +
                                                          (BuffLev - Tlev) * 20
                                                          + EnhanceControl
                                                          - AntiControl),
                                       LastRatio = util:check_range(Ratio1,
                                                                    100,
                                                                    MaxRatio),
                                       util:rand(1, 1000) =<
                                           LastRatio * ReduceRatio / 1000
                               end,
                        case Flag of
                            true ->
                                combat_cache:u(CasterId, [{control_num, 1, 1}]);
                            false -> skip
                        end,
                        Flag;
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     4415),
                        false
                end,
            compare = fun (_, _, _) -> -1 end};
get_script(239001 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = debuff,
            sec_type = control,
            recalc =
                fun (#c_buff{args = [Ratio, _MaxRatio, _, _, _, _]},
                     _Caster, _Target) ->
                        [{d_reduce_dmg, 1, Ratio}, {is_stun, 0, 1}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     4435),
                        []
                end,
            hit =
                fun (#c_buff{hit_rate = HitRate,
                             args = [_, MaxRatio, Rate1, Rate2, Rate3, Rate4]},
                     _Caster = #fighter{id = CasterId, type = Type,
                                        pet_attr = PetAttr,
                                        special_attr =
                                            #special_attr{control_num =
                                                              ControlNum}},
                     #fighter{special_attr =
                                  #special_attr{anti_control_ratio =
                                                    AntiControlRatio}}) ->
                        ReduceRatio = case Type =:= 2 of
                                          true -> 1000;
                                          false ->
                                              if ControlNum =:= 0 -> 1000;
                                                 ControlNum =:= 1 -> 600;
                                                 ControlNum =:= 2 -> 300;
                                                 true -> 100
                                              end
                                      end,
                        NewHitRate = case PetAttr of
                                         {Pstr, Pcon, Pmag, Pagi, Pend} ->
                                             combat_pet:calc_stone_ratio({Pstr,
                                                                          Pcon,
                                                                          Pmag,
                                                                          Pagi,
                                                                          Pend},
                                                                         [Rate1,
                                                                          Rate2,
                                                                          Rate3,
                                                                          Rate4]);
                                         _ -> HitRate
                                     end,
                        LastRatio = util:check_range(NewHitRate, 0, MaxRatio),
                        logger:debug("冰冻概率==========:~w",
                                     [LastRatio],
                                     combat_script_buff,
                                     4464),
                        Flag = case util:rand(1, 1000) =< AntiControlRatio of
                                   true -> false;
                                   false ->
                                       util:rand(1, 1000) =<
                                           LastRatio * ReduceRatio / 1000
                               end,
                        case Flag of
                            true ->
                                combat_cache:u(CasterId, [{control_num, 1, 1}]);
                            false -> skip
                        end,
                        Flag;
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     4476),
                        false
                end,
            compare = fun (_, _, _) -> -1 end};
get_script(245000 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = debuff,
            sec_type = control,
            eff_val_before =
                fun (#c_buff{args = [MaxLayer, _BuffLev, _MaxRatio]},
                     #fighter{}, _Target) ->
                        [{sleep_layer, 0, MaxLayer}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     4496),
                        []
                end,
            recalc =
                fun (#c_buff{args = [_MaxLayer, _BuffLev, _MaxRatio]},
                     _Caster, _Target) ->
                        [{is_sleep, 0, 1}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     4506),
                        []
                end,
            eff_val_after =
                fun (#c_buff{args = [_MaxLayer, _BuffLev, _MaxRatio]},
                     _Self, _Target) ->
                        [{sleep_layer, 0, 0}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     4516),
                        []
                end,
            hit =
                fun (#c_buff{hit_rate = HitRate,
                             args = [_, BuffLev, MaxRatio]},
                     _Caster = #fighter{id = CasterId, type = Type,
                                        attr =
                                            #attr{enhance_control =
                                                      EnhanceControl},
                                        special_attr =
                                            #special_attr{control_num =
                                                              ControlNum}},
                     #fighter{lev = Tlev, type = TType,
                              attr = #attr{anti_control = AntiControl},
                              special_attr =
                                  #special_attr{anti_control_ratio =
                                                    AntiControlRatio},
                              ratio_val = RatioVal}) ->
                        ReduceRatio = case Type =:= 2 of
                                          true -> 1000;
                                          false ->
                                              if ControlNum =:= 0 -> 1000;
                                                 ControlNum =:= 1 -> 600;
                                                 ControlNum =:= 2 -> 300;
                                                 true -> 100
                                              end
                                      end,
                        NewTlev = case TType =:= 2 of
                                      true ->
                                          case RatioVal > 0 of
                                              true -> RatioVal;
                                              false -> Tlev
                                          end;
                                      false -> Tlev
                                  end,
                        Flag = case util:rand(1, 1000) =< AntiControlRatio of
                                   true -> false;
                                   false ->
                                       Ratio1 = round(HitRate +
                                                          (BuffLev - NewTlev) *
                                                              20
                                                          + EnhanceControl
                                                          - AntiControl),
                                       LastRatio = util:check_range(Ratio1,
                                                                    300,
                                                                    MaxRatio),
                                       util:rand(1, 1000) =<
                                           LastRatio * ReduceRatio / 1000
                               end,
                        case Flag of
                            true ->
                                combat_cache:u(CasterId, [{control_num, 1, 1}]);
                            false -> skip
                        end,
                        Flag;
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     4555),
                        false
                end,
            compare = fun (_, _, _) -> -1 end};
get_script(246000 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = debuff,
            sec_type = control,
            eff_val_before =
                fun (#c_buff{args =
                                 [MaxLayer,
                                  _MaxRatio,
                                  _ReduceRatio,
                                  _Rate1,
                                  _Rate2,
                                  _Rate3,
                                  _Rate4]},
                     #fighter{}, _Target) ->
                        [{stone_layer, 0, MaxLayer}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     4574),
                        []
                end,
            recalc =
                fun (#c_buff{args =
                                 [_MaxLayer,
                                  _MaxRatio,
                                  ReduceRatio,
                                  _Rate1,
                                  _Rate2,
                                  _Rate3,
                                  _Rate4]},
                     _Caster, _Target) ->
                        [{is_stone, 0, 1},
                         {d_stone_reduce_dmg, 1, ReduceRatio}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     4584),
                        []
                end,
            eff_val_after =
                fun (#c_buff{args =
                                 [_MaxLayer,
                                  _MaxRatio,
                                  _ReduceRatio,
                                  _Rate1,
                                  _Rate2,
                                  _Rate3,
                                  _Rate4]},
                     _Self, _Target) ->
                        [{stone_layer, 0, 0}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     4594),
                        []
                end,
            hit =
                fun (#c_buff{hit_rate = HitRate,
                             args =
                                 [_,
                                  MaxRatio,
                                  _ReduceRatio,
                                  Rate1,
                                  Rate2,
                                  Rate3,
                                  Rate4]},
                     _Caster = #fighter{id = CasterId, lev = Slev,
                                        type = Type, pet_attr = PetAttr,
                                        attr =
                                            #attr{enhance_control =
                                                      EnhanceControl},
                                        special_attr =
                                            #special_attr{control_num =
                                                              ControlNum}},
                     #fighter{lev = Tlev, type = TType,
                              attr = #attr{anti_control = AntiControl},
                              special_attr =
                                  #special_attr{anti_control_ratio =
                                                    AntiControlRatio},
                              ratio_val = RatioVal}) ->
                        ReduceRatio = case Type =:= 2 of
                                          true -> 1000;
                                          false ->
                                              if ControlNum =:= 0 -> 1000;
                                                 ControlNum =:= 1 -> 400;
                                                 ControlNum =:= 2 -> 300;
                                                 true -> 100
                                              end
                                      end,
                        NewTlev = case TType =:= 2 of
                                      true ->
                                          case RatioVal > 0 of
                                              true -> RatioVal;
                                              false -> Tlev
                                          end;
                                      false -> Tlev
                                  end,
                        NewHitRate = case PetAttr of
                                         {Pstr, Pcon, Pmag, Pagi, Pend} ->
                                             combat_pet:calc_stone_ratio({Pstr,
                                                                          Pcon,
                                                                          Pmag,
                                                                          Pagi,
                                                                          Pend},
                                                                         [Rate1,
                                                                          Rate2,
                                                                          Rate3,
                                                                          Rate4]);
                                         _ -> HitRate
                                     end,
                        Flag = case util:rand(1, 1000) =< AntiControlRatio of
                                   true -> false;
                                   false ->
                                       LastRatio = case Type of
                                                       3 -> round(NewHitRate);
                                                       6 -> round(NewHitRate);
                                                       _ ->
                                                           Ratio1 =
                                                               round(NewHitRate
                                                                         +
                                                                         (Slev -
                                                                              NewTlev)
                                                                             *
                                                                             20
                                                                         +
                                                                         EnhanceControl
                                                                         -
                                                                         AntiControl),
                                                           util:check_range(Ratio1,
                                                                            100,
                                                                            MaxRatio)
                                                   end,
                                       LastRatio1 = LastRatio * ReduceRatio /
                                                        1000,
                                       util:rand(1, 1000) =< LastRatio1
                               end,
                        case Flag of
                            true ->
                                combat_cache:u(CasterId, [{control_num, 1, 1}]);
                            false -> skip
                        end,
                        Flag;
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     4647),
                        false
                end,
            compare = fun (_, _, _) -> -1 end};
get_script(247000 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = debuff,
            recalc =
                fun (#c_buff{}, _Caster, _Target) ->
                        [{is_anti_heal, 0, 1}]
                end,
            compare = fun (_, _, _) -> -1 end};
get_script(250000 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = debuff,
            sec_type = snow_val, compare = fun (_, _, _) -> -1 end};
get_script(251000 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = debuff,
            sec_type = control,
            eff_val_before =
                fun (#c_buff{args = [ModelId]}, _Caster,
                     _Target = #fighter{}) ->
                        [{model_id, 0, ModelId}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     4690),
                        []
                end,
            eff_val_after =
                fun (#c_buff{args = [_ModelId]}, _Caster,
                     _Target = #fighter{}) ->
                        [{model_id, 0, 0}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     4700),
                        []
                end,
            eff_before =
                fun (#c_buff{args = [ModelId]}, _Target) ->
                        [{3, ModelId, 0}];
                    (#c_buff{id = BuffId, args = Args}, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     4708),
                        []
                end,
            eff_after =
                fun (#c_buff{args = [_ModelId]}, _Target) ->
                        [{3, 0, 0}];
                    (#c_buff{id = BuffId, args = Args}, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     4716),
                        []
                end,
            recalc =
                fun (#c_buff{}, _Caster, _Target) -> [{is_stun, 0, 1}]
                end,
            hit =
                fun (#c_buff{}, #fighter{}, #fighter{}) -> true;
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     4727),
                        false
                end,
            compare = fun (_, _, _) -> -1 end};
get_script(252000 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = debuff,
            sec_type = boom, compare = fun (_, _, _) -> -1 end};
get_script(254000 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = debuff,
            eff =
                fun (#c_buff{args = [Val], duration = _Duration,
                             duration_left = _DurationLeft},
                     _Caster = #fighter{}, Target = #fighter{}) ->
                        combat_cache:u(Target, [{anger, 1, -Val}]),
                        [{9, -Val, 0}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     4755),
                        []
                end,
            compare = fun (_, _, _) -> -1 end};
get_script(255000 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = debuff,
            recalc =
                fun (#c_buff{args = [Ratio]}, _Caster, _Target) ->
                        [{can_use_anger_skill, 1, {0, Ratio}}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     4773),
                        []
                end};
get_script(256000 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = buff,
            recalc =
                fun (#c_buff{args = [Ratio, Ratio1, _Val]}, _Caster,
                     _Target) ->
                        [{d_buff_reduce_dmg, 0, -Ratio},
                         {d_dmg_ratio, 1, Ratio1}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     4791),
                        []
                end,
            eff_val_before =
                fun (#c_buff{}, _Caster,
                     _Target = #fighter{id = Fid, ext_args = ExtArgs}) ->
                        NewExtArgs = combat_cache:set_ext_val(ExtArgs, 6, 1),
                        combat_cache:u(Fid,
                                       [{fighter_ext_args, 0, NewExtArgs}]),
                        [];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     4804),
                        []
                end,
            eff_val_after =
                fun (#c_buff{}, _Caster,
                     _Target = #fighter{id = Fid, ext_args = ExtArgs}) ->
                        NewExtArgs = combat_cache:set_ext_val(ExtArgs, 6, 0),
                        combat_cache:u(Fid,
                                       [{fighter_ext_args, 0, NewExtArgs}]),
                        [];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     4816),
                        []
                end,
            compare =
                fun (#c_buff{id = _BuffId, args = _Args}, _, _) -> -1
                end};
get_script(260000 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = debuff,
            sec_type = control,
            recalc =
                fun (#c_buff{args = [_MaxRatio, TemptRatio]},
                     _Caster = #fighter{attr = #attr{magic_dmg = MagicDmg}},
                     _Target) ->
                        [{is_tempt, 0, 1},
                         {tempt_ratio, 0, TemptRatio},
                         {tempt_dmg, 0, MagicDmg}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     4838),
                        []
                end,
            hit =
                fun (#c_buff{hit_rate = HitRate, args = [MaxRatio, _]},
                     _Caster = #fighter{id = CasterId, lev = Slev,
                                        type = Type,
                                        attr =
                                            #attr{enhance_control =
                                                      EnhanceControl},
                                        special_attr =
                                            #special_attr{control_num =
                                                              ControlNum}},
                     #fighter{type = TType, group = Group, lev = Tlev,
                              attr = #attr{anti_control = AntiControl},
                              special_attr =
                                  #special_attr{anti_control_ratio =
                                                    AntiControlRatio}}) ->
                        TargetGroupF = combat_cache:all(Group),
                        BeControlNum = erlang:length([true
                                                      || #fighter{buffs = Buffs}
                                                             <- TargetGroupF,
                                                         lists:keymember(ScriptId,
                                                                         #c_buff.script_id,
                                                                         Buffs)]),
                        [CombatType] =
                            combat_cache:get_context_elem([#combat_context.type]),
                        BeControlNumDescRatio =
                            skill_combat_data:get_control_desc({CombatType,
                                                                BeControlNum}),
                        logger:debug("衰减概率为:~w",
                                     [{CombatType,
                                       BeControlNumDescRatio,
                                       BeControlNum}],
                                     combat_script_buff,
                                     4851),
                        ReduceRatio = case Type =:= 2 of
                                          true -> 1000;
                                          false ->
                                              if ControlNum =:= 0 -> 1000;
                                                 ControlNum =:= 1 -> 450;
                                                 true -> 100
                                              end
                                      end,
                        NewHitRate1 = case TType =:= 1 orelse TType =:= 4 of
                                          true -> HitRate;
                                          false -> HitRate
                                      end,
                        Flag = case util:rand(1, 1000) =< AntiControlRatio of
                                   true -> false;
                                   false ->
                                       Ratio1 = round(round(NewHitRate1 +
                                                                (Slev - Tlev) *
                                                                    20
                                                                + EnhanceControl
                                                                - AntiControl)
                                                          *
                                                          BeControlNumDescRatio
                                                          / 1000),
                                       LastRatio = util:check_range(Ratio1,
                                                                    100,
                                                                    MaxRatio),
                                       util:rand(1, 1000) =<
                                           LastRatio * ReduceRatio / 1000
                               end,
                        case Flag of
                            true ->
                                combat_cache:u(CasterId, [{control_num, 1, 1}]);
                            false -> skip
                        end,
                        Flag;
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     4881),
                        false
                end,
            compare = fun (_, _, _) -> -1 end};
get_script(161001 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = buff,
            eff =
                fun (#c_buff{args = [Ratio, Type]},
                     _Caster = #fighter{}, _Target = #fighter{id = Sid}) ->
                        case util:rand(1, 1000) < Ratio of
                            true ->
                                case combat_cache:f(by_id, Sid) of
                                    #fighter{buffs = Buffs} ->
                                        ClearBuff = case Type of
                                                        1 ->
                                                            [Buff
                                                             || Buff =
                                                                    #c_buff{can_dispel
                                                                                =
                                                                                1,
                                                                            eff_type
                                                                                =
                                                                                buff}
                                                                    <- Buffs];
                                                        2 ->
                                                            [Buff
                                                             || Buff =
                                                                    #c_buff{can_dispel
                                                                                =
                                                                                1,
                                                                            eff_type
                                                                                =
                                                                                debuff}
                                                                    <- Buffs];
                                                        3 ->
                                                            [Buff
                                                             || Buff =
                                                                    #c_buff{can_dispel
                                                                                =
                                                                                1,
                                                                            eff_type
                                                                                =
                                                                                debuff,
                                                                            sec_type
                                                                                =
                                                                                SecType}
                                                                    <- Buffs,
                                                                SecType =/=
                                                                    control];
                                                        4 ->
                                                            [Buff
                                                             || Buff =
                                                                    #c_buff{can_dispel
                                                                                =
                                                                                1,
                                                                            sec_type
                                                                                =
                                                                                control}
                                                                    <- Buffs];
                                                        5 ->
                                                            [Buff
                                                             || Buff = #c_buff{}
                                                                    <- Buffs];
                                                        _ -> []
                                                    end,
                                        lists:foreach(fun (Buff) ->
                                                              combat_buff:buff_del(Sid,
                                                                                   Buff)
                                                      end,
                                                      ClearBuff);
                                    _ -> ok
                                end;
                            _ -> []
                        end;
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     4926),
                        []
                end,
            die_eff = 1};
get_script(325001 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = buff,
            sec_type = halo, die_eff = 1,
            halo_eff_fighter_type = [3, 6, 5],
            recalc =
                fun (#c_buff{args =
                                 [_HaloAdd, DmgReduceRatio, DmgReduceRatioMax]},
                     _Caster, _Target = #fighter{}) ->
                        logger:debug("buff325001计算====================",
                                     [],
                                     combat_script_buff,
                                     4948),
                        [{d_buff_reduce_dmg_max, 1, -DmgReduceRatioMax},
                         {d_buff_reduce_dmg, 0, -DmgReduceRatio}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     4951),
                        []
                end};
get_script(325002 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = buff,
            sec_type = halo, die_eff = 1,
            halo_eff_fighter_type =
                [3, 6, 2, 1, 4, fighter_type_guard],
            recalc =
                fun (#c_buff{args =
                                 [_HaloAdd, DmgReduceRatio, DmgReduceRatioMax]},
                     _Caster, _Target = #fighter{}) ->
                        logger:debug("buff325001计算====================",
                                     [],
                                     combat_script_buff,
                                     4968),
                        [{d_buff_reduce_dmg, 0, -DmgReduceRatio},
                         {d_buff_reduce_dmg_max, 1, -DmgReduceRatioMax}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     4971),
                        []
                end};
get_script(317001 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = buff,
            sec_type = halo, die_eff = 1,
            halo_eff_fighter_type = [2],
            recalc =
                fun (#c_buff{args = [_HaloAdd, DmgRatio]}, _Caster,
                     _Target = #fighter{}) ->
                        logger:debug("buff325001计算====================",
                                     [],
                                     combat_script_buff,
                                     4988),
                        [{d_dmg_ratio, 1, DmgRatio}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     4991),
                        []
                end};
get_script(425001 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = buff,
            sec_type = halo_add,
            recalc =
                fun (#c_buff{args = [DmgReduceRatio]}, _Caster,
                     _Target) ->
                        logger:debug("buff425001计算====================",
                                     [],
                                     combat_script_buff,
                                     5006),
                        [{d_buff_reduce_dmg, 0, -DmgReduceRatio}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     5009),
                        []
                end};
get_script(417001 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = buff,
            sec_type = halo_add,
            recalc =
                fun (#c_buff{args = [DmgRatio]}, _Caster, _Target) ->
                        logger:debug("buff425001计算====================",
                                     [],
                                     combat_script_buff,
                                     5025),
                        [{d_dmg_ratio, 1, DmgRatio}];
                    (#c_buff{id = BuffId, args = Args}, _Caster, _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     5028),
                        []
                end};
get_script(256001 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = buff,
            eff_val_before =
                fun (#c_buff{args = [Ratio]}, _Caster,
                     Target = #fighter{}) ->
                        case rand_enemy_id(Target) of
                            false -> [];
                            {true, EnemyId} ->
                                [{protector, 0, {EnemyId, 2, Ratio}}]
                        end;
                    (#c_buff{id = BuffId, args = Args}, _Caster,
                     _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     6100),
                        []
                end,
            eff_val_after =
                fun (#c_buff{}, _Caster, #fighter{}) ->
                        [{protector, 0, del}];
                    (#c_buff{id = BuffId, args = Args}, _Caster,
                     _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     6110),
                        []
                end,
            compare = fun (_, _, _) -> -1 end};

get_script(256002 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = buff,
            recalc =
                fun (#c_buff{args = [SpeedRatio, PhyRatio, HpRatio]},
                     _Caster, #fighter{id = Tid}) ->
                        BaseSpeed =
                            case combat_cache:f_origin(by_id, Tid) of
                                #fighter{attr = #attr{speed = S}} -> S;
                                _ -> 0
                            end,
                        Delta = round(BaseSpeed * SpeedRatio / 1000),
                        [{speed, 1, Delta},
                         {phy_dmg, 3, PhyRatio},
                         {hp_max, 3, HpRatio}];
                    (#c_buff{id = BuffId, args = Args}, _Caster,
                     _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     6120),
                        []
                end,
            compare = fun (_, _, _) -> -1 end};

get_script(256003 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = debuff,
            recalc =
                fun (#c_buff{}, _Caster, _Target) ->
                        [{is_silent, 0, 1}, {d_hurt_ratio, 1, 200}];
                    (#c_buff{id = BuffId, args = Args}, _Caster,
                     _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     6130),
                        []
                end,
            compare = fun (_, _, _) -> -1 end};

get_script(_) -> false.

rand_enemy_id(#fighter{group = Group}) ->
    Enemies =
        [F
         || F = #fighter{is_die = 0, is_escape = 0}
                <- combat_cache:all(combat_cache:op(Group))],
    case Enemies of
        [] -> false;
        _ ->
            Enemy = lists:nth(util:rand(1, length(Enemies)), Enemies),
            {true, Enemy#fighter.id}
    end.


