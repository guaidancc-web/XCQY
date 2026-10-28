-file("src/mod/combat/combat_fighter.erl", 1).

-module(combat_fighter).

-export([fighter_init/3,
         fighter_init_pet/5,
         fighter_init_child/5,
         all_pos/0,
         add_fighters/3,
         remove_fighter/1,
         remove_fighter/3,
         sort_action/0,
         revoke_dead_pos/0,
         update_sort_action/0,
         update_sort_action/1,
         handle_join/2,
         ghost_and_revive_check/1,
         passive_round/2,
         add_slave/3,
         formation_init/7,
         format_fighter_status/0,
         do_join/3,
         all_enter/4,
         enter_combat/3,
         enter_combat_failed/3,
         preside/6,
         modify_cost_mp_ratio/2,
         wave_next_calc/1,
         do_revoke_dead_pos/5,
         unit_talk/2,
         special_init/4,
         calc_formation/3,
         treat_slave_attr/2,
         treat_unit_attr/2,
         disturb_action_order/1]).

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

-file("src/mod/combat/combat_fighter.erl", 44).

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

-file("src/mod/combat/combat_fighter.erl", 45).

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

-file("src/mod/combat/combat_fighter.erl", 46).

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

-file("src/mod/combat/combat_fighter.erl", 47).

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

-file("src/mod/combat/combat_fighter.erl", 48).

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

-file("src/mod/combat/combat_fighter.erl", 49).

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

-file("src/mod/combat/combat_fighter.erl", 50).

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

-file("src/mod/combat/combat_fighter.erl", 51).

-file("inc/dungeon.hrl", 1).

-record(m_dungeon,
        {ver = 4,
         dun_id = 0,
         battle_id = 0,
         cards = [],
         unit_rewards = [],
         unit_rewarded = 0}).

-record(dungeon_base,
        {id = 0,
         name = "",
         type = 2,
         need_num = 1,
         cond_enter = [],
         cond_loss = [],
         cross_cond_enter = [],
         cross_cond_loss = [],
         exit_pos = last ::
             last |
             {non_neg_integer(),
              non_neg_integer(),
              non_neg_integer()},
         battle_name_list = [],
         lev_interval = 0,
         unit_list = [],
         lev_max = 0,
         team_dungeon = 0}).

-record(dungeon_role_info,
        {id = {0, "", 0} ::
             {non_neg_integer(), bitstring(), non_neg_integer()},
         score_list = [] :: [tuple()]}).

-record(dungeon_unit_count, {id = 0, num = 0}).

-record(dungeon_score,
        {id = 0,
         score = 0 :: non_neg_integer(),
         grade = 1 :: pos_integer()}).

-record(dungeon_lord_data,
        {unit_id = 0,
         id = 0,
         floor = 0,
         map_id = 0,
         is_lord = 0,
         msg = ""}).

-record(dungeon_lord,
        {key = {0, 0},
         dun_id = 0,
         floor = 0,
         lords = [],
         ranks = []}).

-record(dungeon_lord_role,
        {id,
         name,
         sex = 0 :: 0..1,
         classes = 0 :: 0..6,
         lev = 0 :: non_neg_integer(),
         looks = []}).

-record(dungeon_rank_role,
        {id,
         name,
         sex = 0 :: 0..1,
         classes = 0 :: 0..6,
         lev = 0 :: non_neg_integer(),
         fc = 0,
         looks = [],
         up = 1,
         rank = 0,
         val1 = 0,
         val2 = 0,
         val3 = 0,
         val4 = 0,
         msg1 = "",
         msg2 = "",
         msg3 = ""}).

-record(dungeon_first,
        {key = {0, 0}, dun_id = 0, floor = 0, roles = []}).

-record(dungeon_first_role,
        {id,
         name,
         sex = 0 :: 0..1,
         classes = 0 :: 0..6,
         lev = 0 :: non_neg_integer()}).

-record(dungeon_reward_data,
        {id = 0,
         floor = 0,
         type = 0,
         item_list = [],
         title = "",
         msg = "",
         cast_msg = ""}).

-record(dungeon_team,
        {id = {0, "", 0} :: tuple(),
         leader :: undefined | tuple(),
         members = [] :: list(),
         member_num = 1 :: non_neg_integer(),
         dun_id = 0 :: non_neg_integer(),
         status = 0 :: non_neg_integer(),
         kicked = [] :: list()}).

-record(dungeon_enlistment,
        {id = {0, "", 0} :: tuple(),
         member_num = 1 :: non_neg_integer(),
         dun_id = 0 :: non_neg_integer(),
         leader :: undefined | tuple()}).

-record(dungeon_mate,
        {id = {0, "", 0} :: tuple(),
         name = "" :: string(),
         pid :: undefined | pid(),
         face_id = 0 :: non_neg_integer(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         lev_break_times = 0 :: non_neg_integer(),
         status = 3 :: non_neg_integer(),
         looks = [] :: list(),
         fc = 0 :: non_neg_integer(),
         dun_id = 0 :: non_neg_integer(),
         team_id = {0, "", 0} :: tuple(),
         matched = 0 :: non_neg_integer(),
         join_time = 0 :: non_neg_integer(),
         origin_ids = [] :: list()}).

-record(dungeon_invitation,
        {id = {0, "", 0},
         name = "",
         lev = 0,
         classes = 0,
         sex = 0,
         type = 1,
         team_id = {0, "", 0},
         dun_id = 0,
         dun_name = "",
         time = 0}).

-record(dungeon_card,
        {item_id = 0,
         item_num = 0,
         announce = 0,
         selected = 0}).

-file("src/mod/combat/combat_fighter.erl", 52).

-file("inc/looks.hrl", 1).

-file("src/mod/combat/combat_fighter.erl", 53).

-file("inc/warrior.hrl", 1).

-record(warrior_ready_zone,
        {cross_id = 0,
         map_id = 0 :: non_neg_integer(),
         map_zone = 0,
         map_plat = "",
         map_pid :: pid() | undefined,
         member_size = 0 :: non_neg_integer(),
         group_id = 0 :: pos_integer(),
         exit_npc,
         combat_mode = 1,
         init_combat_mode = 0}).

-record(warrior_zone,
        {cross_id = 0,
         id = 0,
         key,
         group_id = 0 :: pos_integer(),
         seq_id = 0,
         pid,
         is_close = 0}).

-record(warrior_field,
        {id = 0 :: non_neg_integer(),
         key,
         cross_id = 0,
         group_id = 0 :: non_neg_integer(),
         seq_id = 0 :: non_neg_integer(),
         pid :: pid() | undefined,
         map_id = 0,
         map_pid,
         map_plat = "",
         map_zone = 0,
         green_num = 0,
         green_score = 0,
         white_num = 0,
         white_score = 0,
         phase = 0,
         combat_mode = 1}).

-record(warrior_zone_role,
        {id,
         pid,
         name = "",
         sex = 0,
         classes = 0,
         lev = 0 :: non_neg_integer(),
         group_id = 0 :: pos_integer(),
         field_id = 0,
         camp = 0,
         revive = 0,
         status = 0,
         is_combat = 0,
         combat_pid,
         last_combat_over_time = 0,
         last_role_id,
         win_count = 0,
         combat_count = 0,
         score = 0,
         cross_id = 0}).

-record(warrior,
        {id ::
             undefined |
             {pos_integer(), bitstring(), non_neg_integer()},
         pid :: pid() | undefined,
         name = "" :: string(),
         sex = 0,
         classes = 0,
         face_id = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         fc = 0 :: non_neg_integer(),
         group_id = 0 :: pos_integer(),
         kill = 0 :: non_neg_integer(),
         multi_kill = 0 :: non_neg_integer(),
         score = 0 :: non_neg_integer(),
         rank = 0 :: pos_integer(),
         revive = 0 :: non_neg_integer(),
         death = 0 :: non_neg_integer(),
         multi_death = 0 :: non_neg_integer(),
         dead_time = 0 :: non_neg_integer(),
         camp = 0,
         ready_map_id = 0 :: non_neg_integer(),
         ready_map_pid :: pid() | undefined,
         ready_map_plat = "",
         ready_map_zone = 0,
         seq_id = 0 :: non_neg_integer(),
         field_id = 0 :: non_neg_integer(),
         field_map_id = 0 :: non_neg_integer(),
         field_map_plat = "",
         field_map_zone = 0,
         field_pid :: pid() | undefined,
         field_time = 0,
         magic_buff = [] :: list(),
         status = 0,
         looks = [],
         cross_id = 0,
         combat_mode = 1}).

-record(warrior_group_data,
        {id = 0, name = "", order = 0, members = []}).

-record(warrior_win_item_data,
        {base_id = 0,
         weight = 0,
         max = 0,
         is_notice = 0,
         num = 0}).

-record(warrior_drop_item_data,
        {base_id = 0,
         weight = 0,
         result = 0,
         is_notice = 0,
         num = 0}).

-record(warrior_scene_unit,
        {battle_id = 0,
         type = 0,
         sub_type = 0,
         buff_id = 0,
         spec_id = 0,
         item_base_id = 0,
         unit_base_id = 0,
         field_id = 0}).

-record(warrior_buff_data,
        {buff_id = 0, type = 0, unit_base_id = 0, name = ""}).

-record(warrior_magic_buff,
        {buff_id = 0,
         name = "",
         status = 0,
         type = 0,
         x = 0,
         y = 0,
         time = 0,
         owner_id,
         owner_name = "",
         next_owner_id,
         next_owner_pid,
         camp = 0}).

-record(warrior_combat, {pid, field_id = 0, field_key}).

-record(warrior_timer_data,
        {id = 0,
         phase = 0,
         type = 0,
         spec_id = 0,
         buff_id = 0,
         start = 0,
         interval = 0,
         finished = 0,
         num = 0,
         max = 0}).

-record(warrior_combat_result,
        {field_pid,
         lose_buff = 0,
         win_buff = 0,
         takeover = false,
         round = 0}).

-record(warrior_combat_win,
        {field_pid,
         lose_buff = 0,
         win_buff = 0,
         takeover = false,
         score = 0,
         round = 0,
         id,
         name,
         camp = 0,
         wish_buff = 0}).

-record(warrior_combat_lose,
        {field_pid,
         lose_buff = 0,
         win_buff = 0,
         takeover = false,
         score = 0,
         round = 0,
         id,
         name,
         camp = 0,
         revive = 0}).

-record(warrior_embattle,
        {role_id = {0, "", 0}, pets = [], guards = []}).

-record(warrior_rank_reward_data,
        {group = 0,
         min = 0,
         max = 0,
         items = [],
         title = "",
         content = ""}).

-file("src/mod/combat/combat_fighter.erl", 54).

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

-file("src/mod/combat/combat_fighter.erl", 55).

format_fighter_status() ->
    [{Id,
      Hp,
      TmpHpMax,
      Mp,
      HpMax,
      MpMax,
      IsDie,
      IsDieDisappear,
      Pos,
      Order,
      IsEscape}
     || #fighter{id = Id, hp = Hp, tmp_hp_max = TmpHpMax,
                 mp = Mp, hp_max = HpMax, mp_max = MpMax, is_die = IsDie,
                 is_die_disappear = IsDieDisappear, pos = Pos,
                 order = Order, is_escape = IsEscape}
            <- combat_cache:all()].

special_init(103,
             #combat_start_args{ext_args = _CombatArgs}, Atk, Dfd) ->
    WarriorMode = get_combat_mode(103),
    do_special_init(WarriorMode, Atk, Dfd);
special_init(_, _, Atk, Dfd) -> {Atk, Dfd}.

calc_special_guard([], List) -> List;
calc_special_guard([#fighter{base_id = BaseId,
                             classes = Classes, type = 5}
                    | T],
                   List) ->
    GuardType = case Classes of
                    1 -> 1;
                    2 -> 1;
                    3 -> 1;
                    4 -> 2;
                    5 -> 3;
                    6 -> 1;
                    _ -> 1
                end,
    case lists:keyfind(GuardType, 1, List) of
        {_, Num, Guards} ->
            calc_special_guard(T,
                               lists:keystore(GuardType,
                                              1,
                                              List,
                                              {GuardType,
                                               Num + 1,
                                               [BaseId | Guards]}));
        _ ->
            calc_special_guard(T,
                               lists:keystore(GuardType,
                                              1,
                                              List,
                                              {GuardType, 1, [BaseId]}))
    end;
calc_special_guard([_ | T], List) ->
    calc_special_guard(T, List).

same_guard_list(ListA, ListB) ->
    same_guard_list(ListA, ListB, []).

same_guard_list([], _, SameList = [_ | _]) ->
    {_, Num, ListA, ListB} = util:rand_list(SameList),
    {Mnum, _} = util:rand_list([{1, 80}, {2, 20}], 2),
    MaxNum = min(Mnum, Num),
    LenA = length(ListA),
    LenB = length(ListB),
    case LenB >= LenA of
        true ->
            case util:rand_list_n(ListA, MaxNum) of
                GetA = [_ | _] ->
                    case choose_guard(GetA, ListB, length(GetA), ListA) of
                        {true, GetB} -> {true, GetA, GetB};
                        _ -> false
                    end;
                _ -> false
            end;
        false ->
            case util:rand_list_n(ListB, MaxNum) of
                GetB = [_ | _] ->
                    case choose_guard(GetB, ListA, length(GetB), ListB) of
                        {true, GetA} -> {true, GetA, GetB};
                        _ -> false
                    end;
                _ -> false
            end
    end;
same_guard_list([], _, _) -> false;
same_guard_list([{GuardType, NumA, GuardsA} | T], ListB,
                SameList) ->
    case lists:keyfind(GuardType, 1, ListB) of
        {_, NumB, GuardsB} ->
            same_guard_list(T,
                            ListB,
                            [{GuardType, min(NumA, NumB), GuardsA, GuardsB}
                             | SameList]);
        _ -> same_guard_list(T, ListB, SameList)
    end.

choose_guard(ListA, ListB, Num, BaseListA) ->
    choose_guard(ListA, ListB, Num, BaseListA, []).

choose_guard([], _, Num, _, GetB) when Num =< 0 ->
    {true, GetB};
choose_guard([], ListB, Num, BaseListA, GetB) ->
    Len = length(ListB),
    case Len >= Num of
        true ->
            case util:rand_list_n(ListB -- BaseListA, Num) of
                RandB = [_ | _] -> {true, GetB ++ RandB};
                _ -> false
            end;
        _ -> false
    end;
choose_guard([BaseId | T], ListB, Num, BaseListA,
             GetB) ->
    case lists:member(BaseId, ListB) of
        true ->
            choose_guard(T,
                         lists:delete(BaseId, ListB),
                         Num - 1,
                         BaseListA,
                         [BaseId | GetB]);
        _ -> choose_guard(T, ListB, Num, BaseListA, GetB)
    end.

do_special_init(3, Atk, Dfd) ->
    GuardA = calc_special_guard(Atk, []),
    GuardB = calc_special_guard(Dfd, []),
    LeaderAName = case lists:keyfind(1, #fighter.type, Atk)
                      of
                      #fighter{name = Ln1} -> Ln1;
                      _ -> "未知"
                  end,
    LeaderBName = case lists:keyfind(1, #fighter.type, Dfd)
                      of
                      #fighter{name = Ln2} -> Ln2;
                      _ -> "未知"
                  end,
    case same_guard_list(GuardA, GuardB) of
        {true, GetA, GetB} ->
            Fun1 = fun (#fighter{type = Type, base_id = Aid}) ->
                           Type =:= 5 andalso lists:member(Aid, GetA) =:= true
                   end,
            Fun2 = fun (#fighter{type = Type, base_id = Bid}) ->
                           Type =:= 5 andalso lists:member(Bid, GetB) =:= true
                   end,
            {ChangeA, RestA} = lists:partition(Fun1, Atk),
            {ChangeB, RestB} = lists:partition(Fun2, Dfd),
            case length(ChangeA) =:= length(ChangeB) of
                true ->
                    {NewChangeA, NewChangeB} = do_change_guard(ChangeA,
                                                               ChangeB,
                                                               LeaderAName,
                                                               LeaderBName),
                    {RestA ++ NewChangeA, RestB ++ NewChangeB};
                false -> {Atk, Dfd}
            end;
        _ -> {Atk, Dfd}
    end;
do_special_init(_, Atk, Dfd) -> {Atk, Dfd}.

do_change_guard(AList, BList, LeaderAName,
                LeaderBName) ->
    do_change_guard(AList,
                    BList,
                    LeaderAName,
                    LeaderBName,
                    [],
                    []).

do_change_guard([], [], _, _, NewAList, NewBList) ->
    {NewAList, NewBList};
do_change_guard([A = #fighter{id = Aid, group = Agroup,
                              looks = Alooks, formation = AformId,
                              formation_lev = AformLev, pos = Apos,
                              guard_pid = AguardPid, guard_fid = AguardFid,
                              guard_pos = AguardPos}
                 | T1],
                [B = #fighter{id = Bid, group = Bgroup, looks = Blooks,
                              formation = BformId, formation_lev = BformLev,
                              pos = Bpos, guard_pid = BguardPid,
                              guard_fid = BguardFid, guard_pos = BguardPos}
                 | T2],
                LeaderAName, LeaderBName, NewAList, NewBList) ->
    LookA = [{72, Agroup, Apos, LeaderAName}],
    LookB = [{72, Bgroup, Bpos, LeaderBName}],
    NewA = A#fighter{id = Bid, group = Bgroup,
                     looks = LookA ++ Alooks, formation = BformId,
                     formation_lev = BformLev, pos = Bpos,
                     guard_pid = BguardPid, guard_fid = BguardFid,
                     guard_pos = BguardPos},
    NewB = B#fighter{id = Aid, group = Agroup,
                     looks = LookB ++ Blooks, formation = AformId,
                     formation_lev = AformLev, pos = Apos,
                     guard_pid = AguardPid, guard_fid = AguardFid,
                     guard_pos = AguardPos},
    do_change_guard(T1,
                    T2,
                    LeaderAName,
                    LeaderBName,
                    [NewB | NewAList],
                    [NewA | NewBList]).

fighter_init(Group, CombatType, FighterList) ->
    {InitAtk, InitDfd} = get(init_fighter),
    InitArgs = case Group of
                   0 -> {InitAtk, InitDfd};
                   1 -> {InitDfd, InitAtk}
               end,
    PosType = calc_pos_type(FighterList),
    fighter_init(Group,
                 PosType,
                 CombatType,
                 InitArgs,
                 FighterList,
                 []).

fighter_init(_Group, _PosType, _CombatType, _InitArgs,
             [], Result) ->
    Result;
fighter_init(Group, PosType, CombatType, InitArgs,
             [F | T], Result) ->
    InitFlist = fighter_init_type(Group,
                                  PosType,
                                  CombatType,
                                  InitArgs,
                                  F),
    NewResult = InitFlist ++ Result,
    fighter_init(Group,
                 PosType,
                 CombatType,
                 InitArgs,
                 T,
                 NewResult).

fighter_init_type(Group, PosType, CombatType, InitArgs,
                  F) ->
    case do_fighter_init(Group,
                         PosType,
                         CombatType,
                         InitArgs,
                         F)
        of
        undefined -> [];
        F1 = #fighter{} ->
            GuardList = fighter_init_guard(Group,
                                           PosType,
                                           CombatType,
                                           InitArgs,
                                           F1),
            case lists:member(CombatType, [49, 52]) of
                true -> [F1] ++ GuardList;
                _ ->
                    NewF1 = init_summon_skill(CombatType, F1),
                    StartArgs = get(start_args),
                    CombatMode = get_combat_mode(CombatType),
                    case fighter_init_pet(Group,
                                          PosType,
                                          CombatType,
                                          InitArgs,
                                          NewF1,
                                          CombatMode,
                                          StartArgs)
                        of
                        {NewBackpPets, PetList} ->
                            [NewF1#fighter{backup_pets = NewBackpPets}] ++
                                PetList ++ GuardList;
                        PetList -> [NewF1] ++ PetList ++ GuardList
                    end
            end
    end.

fighter_init_pet(Group, PosType, CombatType, InitArgs,
                 Fighter, Mode, StartArgs)
    when CombatType =:= 103 andalso Mode =:= 4 ->
    fighter_backup_pets(Group,
                        PosType,
                        CombatType,
                        InitArgs,
                        Fighter,
                        StartArgs);
fighter_init_pet(Group, PosType, CombatType, InitArgs,
                 F, _Mode, _StartArgs) ->
    fighter_init_pet(Group,
                     PosType,
                     CombatType,
                     InitArgs,
                     F).

fighter_init_pet(Group, PosType, CombatType, InitArgs,
                 #fighter{id = Fid, pid = Pid, pos = MasterPos,
                          formation = Formation, formation_lev = FormationLev,
                          active_pet = ActivePet = #c_pet{}}) ->
    FighterPet = combat_pet:to_fighter(ActivePet),
    ActivePet1 = FighterPet#fighter{master_pid = Pid,
                                    master_fid = Fid, master_pos = MasterPos,
                                    formation = Formation,
                                    formation_lev = FormationLev},
    case do_fighter_init(Group,
                         PosType,
                         CombatType,
                         InitArgs,
                         ActivePet1)
        of
        undefined -> [];
        PetF -> [PetF]
    end;
fighter_init_pet(_Group, _PosType, _CombatType,
                 _InitArgs, _Fighter) ->
    [].

fighter_init_child(Group, PosType, CombatType, InitArgs,
                   #fighter{id = Fid, pid = Pid, pos = MasterPos,
                            formation = Formation, formation_lev = FormationLev,
                            active_child = ActiveChild = #c_child{}}) ->
    FighterChild = combat_child:to_fighter(ActiveChild),
    ActiveChild1 = FighterChild#fighter{master_pid = Pid,
                                        master_fid = Fid,
                                        master_pos = MasterPos,
                                        formation = Formation,
                                        formation_lev = FormationLev},
    case do_fighter_init(Group,
                         PosType,
                         CombatType,
                         InitArgs,
                         ActiveChild1)
        of
        undefined -> [];
        ChildF -> [ChildF]
    end;
fighter_init_child(_Group, _PosType, _CombatType,
                   _InitArgs, _Fighter) ->
    [].

fighter_backup_pets(Group, PosType, CombatType,
                    InitArgs, Fighter,
                    #combat_start_args{ext_args = CombatArgs}) ->
    #fighter{id = Fid, pid = Pid, pos = MasterPos,
             formation = Formation, formation_lev = FormationLev,
             active_pet = ActivePet, backup_pets = BackupPets} =
        Fighter,
    PetF1 = case ActivePet of
                #c_pet{} ->
                    FighterPet = combat_pet:to_fighter(ActivePet),
                    ActivePet1 = FighterPet#fighter{master_pid = Pid,
                                                    master_fid = Fid,
                                                    master_pos = MasterPos,
                                                    formation = Formation,
                                                    formation_lev =
                                                        FormationLev},
                    case do_fighter_init(Group,
                                         PosType,
                                         CombatType,
                                         InitArgs,
                                         ActivePet1)
                        of
                        undefined -> [];
                        PetF -> [PetF]
                    end;
                _ -> []
            end,
    Embattle1 = case lists:keyfind(warrior_combat_embattle,
                                   1,
                                   CombatArgs)
                    of
                    {_, Embattle} -> Embattle;
                    _ -> []
                end,
    Pets1 = case lists:keyfind(Group, 1, Embattle1) of
                {_, {Pets, _Guards}} -> Pets;
                _ -> []
            end,
    BaseIds = case PetF1 of
                  [] -> [];
                  [#fighter{base_id = BaseId} | _] -> [BaseId]
              end,
    {NewBackupPets, FighterPets} =
        fighter_backup_pets(lists:reverse(lists:keysort(#c_pet.lev,
                                                        BackupPets)),
                            Pets1,
                            2,
                            Group,
                            PosType,
                            CombatType,
                            InitArgs,
                            BaseIds,
                            []),
    {NewBackupPets, PetF1 ++ FighterPets}.

fighter_backup_pets([], _, _, _Group, _PosType,
                    _CombatType, _InitArgs, _BaseIds, Result) ->
    {[], Result};
fighter_backup_pets(BackupPets, _, Num, _Group,
                    _PosType, _CombatType, _InitArgs, _BaseIds, Result)
    when Num =< 0 ->
    {BackupPets, Result};
fighter_backup_pets(BackupPets, [Id | T], Num, Group,
                    PosType, CombatType, InitArgs, BaseIds, Result) ->
    case lists:keyfind(Id, #c_pet.id, BackupPets) of
        #c_pet{base_id = BaseId} = BackupPet ->
            FighterPet =
                combat_pet:to_fighter(BackupPet#c_pet{skill_plan = []}),
            case do_fighter_init(Group,
                                 PosType,
                                 CombatType,
                                 InitArgs,
                                 FighterPet)
                of
                undefined ->
                    fighter_backup_pets(lists:keydelete(Id,
                                                        #c_pet.id,
                                                        BackupPets),
                                        T,
                                        Num,
                                        Group,
                                        PosType,
                                        CombatType,
                                        InitArgs,
                                        [BaseId | BaseIds],
                                        Result);
                FighterPet1 ->
                    fighter_backup_pets(lists:keydelete(Id,
                                                        #c_pet.id,
                                                        BackupPets),
                                        T,
                                        Num - 1,
                                        Group,
                                        PosType,
                                        CombatType,
                                        InitArgs,
                                        [BaseId | BaseIds],
                                        [FighterPet1 | Result])
            end;
        _ ->
            fighter_backup_pets(BackupPets,
                                T,
                                Num,
                                Group,
                                PosType,
                                CombatType,
                                InitArgs,
                                BaseIds,
                                Result)
    end;
fighter_backup_pets([BackupPet = #c_pet{base_id =
                                            BaseId}
                     | BackupPets],
                    [], Num, Group, PosType, CombatType, InitArgs, BaseIds,
                    Result) ->
    case lists:member(BaseId, BaseIds) of
        false ->
            FighterPet =
                combat_pet:to_fighter(BackupPet#c_pet{skill_plan = []}),
            case do_fighter_init(Group,
                                 PosType,
                                 CombatType,
                                 InitArgs,
                                 FighterPet)
                of
                undefined ->
                    fighter_backup_pets(BackupPets,
                                        [],
                                        Num,
                                        Group,
                                        PosType,
                                        CombatType,
                                        InitArgs,
                                        BaseIds,
                                        Result);
                FighterPet1 ->
                    fighter_backup_pets(BackupPets,
                                        [],
                                        Num - 1,
                                        Group,
                                        PosType,
                                        CombatType,
                                        InitArgs,
                                        [BaseId | BaseIds],
                                        [FighterPet1 | Result])
            end;
        _ ->
            fighter_backup_pets(BackupPets,
                                [],
                                Num,
                                Group,
                                PosType,
                                CombatType,
                                InitArgs,
                                BaseIds,
                                Result)
    end.

init_summon_skill(CombatType,
                  Fighter = #fighter{type = Type, active_pet = ActivePet,
                                     backup_pets = BackUpPets, m_dungeon = Mdun,
                                     backup_childs = BackUpChilds}) ->
    NeedBackUpPet = case Type =:= 4 of
                        true ->
                            case lists:member(CombatType, [100]) of
                                true -> 1;
                                false ->
                                    case check_dungeon(Mdun) of
                                        1 -> 1;
                                        0 -> 0
                                    end
                            end;
                        false -> 1
                    end,
    case NeedBackUpPet of
        1 ->
            PetSkillInfos = do_init_pet_skill(CombatType,
                                              [ActivePet | BackUpPets],
                                              []),
            ChildSkillInfos = do_init_child_skill(CombatType,
                                                  BackUpChilds,
                                                  []),
            Fighter#fighter{pet_skill_infos = PetSkillInfos,
                            child_skill_infos = ChildSkillInfos};
        0 ->
            PetSkillInfos = do_init_pet_skill(CombatType,
                                              [ActivePet],
                                              []),
            Fighter#fighter{pet_skill_infos = PetSkillInfos,
                            backup_pets = [], backup_childs = []}
    end.

check_dungeon(#m_dungeon{dun_id = DunId}) ->
    case dungeon_data:get(DunId) of
        #dungeon_base{type = 5} -> 1;
        _ -> 0
    end;
check_dungeon(_) -> 0.

do_init_pet_skill(_, [], PetSkills) -> PetSkills;
do_init_pet_skill(CombatType,
                  [#c_pet{id = PetId, skills = Skills, base_id = BaseId}
                   | T],
                  PetSkills) ->
    BasicSkills = get_basic_skills(CombatType,
                                   3,
                                   BaseId,
                                   0),
    {ActiveSkill, _PassiveSkill, _} =
        combat_script_skill:convert_skill(Skills),
    ActiveSkill1 = BasicSkills ++ ActiveSkill,
    ActiveSkillInfos = [{SkillId, SkillLev}
                        || #c_skill{id = SkillId, lev = SkillLev}
                               <- ActiveSkill1],
    HasSkill = [{SkillId, SkillLev}
                || {SkillId, SkillLev} <- Skills],
    PassiveSkillInfos = HasSkill -- ActiveSkillInfos,
    SkillInfo = [{0, ActiveSkillInfos},
                 {1, PassiveSkillInfos}],
    NewPetSkills = [{PetId, SkillInfo} | PetSkills],
    do_init_pet_skill(CombatType, T, NewPetSkills);
do_init_pet_skill(CombatType, [_ | T], PetSkills) ->
    do_init_pet_skill(CombatType, T, PetSkills).

do_init_child_skill(_, [], ChildSkills) -> ChildSkills;
do_init_child_skill(CombatType,
                    [#c_child{id = ChildId, skills = Skills,
                              base_id = BaseId}
                     | T],
                    ChildSkills) ->
    BasicSkills = get_basic_skills(CombatType,
                                   6,
                                   BaseId,
                                   0),
    {ActiveSkill, _PassiveSkill, _} =
        combat_script_skill:convert_skill(Skills),
    ActiveSkill1 = BasicSkills ++ ActiveSkill,
    ActiveSkillInfos = [{SkillId, SkillLev}
                        || #c_skill{id = SkillId, lev = SkillLev}
                               <- ActiveSkill1],
    HasSkill = [{SkillId, SkillLev}
                || {SkillId, SkillLev} <- Skills],
    PassiveSkillInfos = HasSkill -- ActiveSkillInfos,
    SkillInfo = [{0, ActiveSkillInfos},
                 {1, PassiveSkillInfos}],
    NewChildSkills = [{ChildId, SkillInfo} | ChildSkills],
    do_init_child_skill(CombatType, T, NewChildSkills);
do_init_child_skill(CombatType, [_ | T], ChildSkills) ->
    do_init_child_skill(CombatType, T, ChildSkills).

fighter_init_guard(_Group, _PosType, 107, _InitArgs,
                   _F) ->
    [];
fighter_init_guard(_Group, _PosType, 102, _InitArgs,
                   _F) ->
    [];
fighter_init_guard(_Group, _PosType, 40, _InitArgs,
                   _F) ->
    [];
fighter_init_guard(_Group, _PosType, 23, _InitArgs,
                   _F) ->
    [];
fighter_init_guard(_Group, _PosType, 51, _InitArgs,
                   _F) ->
    [];
fighter_init_guard(_Group, _PosType, 35, _InitArgs,
                   _F) ->
    [];
fighter_init_guard(_Group, _PosType, 31, _InitArgs,
                   _F) ->
    [];
fighter_init_guard(_Group, _PosType, 105, _InitArgs,
                   _F) ->
    [];
fighter_init_guard(_Group, _PosType, 108, _InitArgs,
                   _F) ->
    [];
fighter_init_guard(_Group, _PosType, 29, _InitArgs,
                   _F) ->
    [];
fighter_init_guard(_Group, _PosType, 52, _InitArgs,
                   _F) ->
    [];
fighter_init_guard(_Group, _PosType, 110, _InitArgs,
                   _F) ->
    [];
fighter_init_guard(_Group, _PosType, 111, _InitArgs,
                   _F) ->
    [];
fighter_init_guard(_Group, _PosType, 116, _InitArgs,
                   _F) ->
    [];
fighter_init_guard(Group, PosType, 103 = CombatType,
                   InitArgs,
                   F = #fighter{id = Fid, pid = Pid, pos = Pos,
                                active_guard = ActiveGuard,
                                formation = Formation,
                                formation_lev = FormationLev}) ->
    CombatMode = get_combat_mode(103),
    CombatGuard = case CombatMode of
                      4 -> calc_guard_list_warrior_pet(Group, F, ActiveGuard);
                      _ -> calc_guard_list(F, ActiveGuard, Group)
                  end,
    do_fighter_init_guard(Group,
                          PosType,
                          CombatType,
                          InitArgs,
                          CombatGuard,
                          [],
                          {Pid, Fid, Pos, Formation, FormationLev});
fighter_init_guard(Group, PosType, 58 = CombatType,
                   InitArgs,
                   F = #fighter{id = Fid, pid = Pid, pos = Pos,
                                active_guard = ActiveGuard,
                                formation = Formation,
                                formation_lev = FormationLev}) ->
    CombatGuard = calc_guard_tour_2v2_list(F,
                                           ActiveGuard,
                                           Group),
    do_fighter_init_guard(Group,
                          PosType,
                          CombatType,
                          InitArgs,
                          CombatGuard,
                          [],
                          {Pid, Fid, Pos, Formation, FormationLev});
fighter_init_guard(Group, PosType, CombatType, InitArgs,
                   F = #fighter{id = Fid, pid = Pid, pos = Pos,
                                active_guard = ActiveGuard,
                                formation = Formation,
                                formation_lev = FormationLev}) ->
    CombatGuard = calc_guard_list(F, ActiveGuard, Group),
    do_fighter_init_guard(Group,
                          PosType,
                          CombatType,
                          InitArgs,
                          CombatGuard,
                          [],
                          {Pid, Fid, Pos, Formation, FormationLev}).

do_fighter_init_guard(_Group, _PosType, _CombatType,
                      _InitArgs, [], Flist, _) ->
    lists:reverse(Flist);
do_fighter_init_guard(Group, PosType, CombatType,
                      InitArgs, [Guard | T], Flist,
                      {Pid, Fid, Pos, Formation, FormationLev}) ->
    Guard1 = Guard#fighter{guard_pid = Pid, guard_fid = Fid,
                           guard_pos = Pos, formation = Formation,
                           formation_lev = FormationLev},
    case do_fighter_init(Group,
                         PosType,
                         CombatType,
                         InitArgs,
                         Guard1)
        of
        undefined ->
            do_fighter_init_guard(Group,
                                  PosType,
                                  CombatType,
                                  InitArgs,
                                  T,
                                  Flist,
                                  {Pid, Fid, Pos, Formation, FormationLev});
        F1 ->
            do_fighter_init_guard(Group,
                                  PosType,
                                  CombatType,
                                  InitArgs,
                                  T,
                                  [F1 | Flist],
                                  {Pid, Fid, Pos, Formation, FormationLev})
    end.

calc_guard_list(#fighter{is_leader = 0}, _, _) -> [];
calc_guard_list(F, ActiveGuard, Group) ->
    GetGuardNum = case get(start_args) of
                      #combat_start_args{max_guard = MaxGuard} -> MaxGuard;
                      _ -> 4
                  end,
    CombatGuard1 = combat_guard:to_fighter_list(F,
                                                ActiveGuard),
    CombatGuard2 = lists:keysort(#fighter.pos,
                                 CombatGuard1),
    Len = length(CombatGuard2),
    put({combat_guards, Group}, CombatGuard2),
    case Len > GetGuardNum of
        true -> lists:sublist(CombatGuard2, GetGuardNum);
        false -> CombatGuard2
    end.

calc_guard_tour_2v2_list(#fighter{is_leader = 0}, _,
                         _) ->
    [];
calc_guard_tour_2v2_list(F = #fighter{origin_id =
                                          OriginId},
                         ActiveGuard, Group) ->
    case get(start_args) of
        #combat_start_args{ext_args = {_, Order1, Order2}} ->
            TOrder = case lists:member(OriginId, Order1) of
                         true -> Order1;
                         _ -> Order2
                     end,
            Order = guard_tour_2v2_order(TOrder, 1, []),
            ActiveGuard2 = guard_tour_2v2_active(ActiveGuard,
                                                 Order,
                                                 []),
            CombatGuard1 = combat_guard:to_fighter_list(F,
                                                        ActiveGuard2),
            CombatGuard2 = guard_tour_2v2_pos(CombatGuard1,
                                              Order,
                                              []),
            lists:keysort(#fighter.pos, CombatGuard2);
        _ -> calc_guard_list(F, ActiveGuard, Group)
    end.

guard_tour_2v2_order([], _Num, List) -> List;
guard_tour_2v2_order([I | T], Num, List) ->
    guard_tour_2v2_order(T, Num + 1, [{I, Num} | List]).

guard_tour_2v2_active([], _Order, List) ->
    lists:reverse(List);
guard_tour_2v2_active([Guard = #c_guard{base_id =
                                            BaseId}
                       | T],
                      Order, List) ->
    case lists:keyfind(BaseId, 1, Order) of
        {_, _} ->
            guard_tour_2v2_active(T, Order, [Guard | List]);
        _ -> guard_tour_2v2_active(T, Order, List)
    end.

guard_tour_2v2_pos([], _Order, List) -> List;
guard_tour_2v2_pos([F = #fighter{base_id = BaseId} | T],
                   Order, List) ->
    case lists:keyfind(BaseId, 1, Order) of
        {_, Pos} ->
            NF = F#fighter{pos = Pos},
            guard_tour_2v2_pos(T, Order, [NF | List]);
        _ -> guard_tour_2v2_pos(T, Order, [F | List])
    end.

calc_guard_list_warrior_pet(Group, F, ActiveGuard) ->
    GetGuardList = case get(start_args) of
                       #combat_start_args{ext_args = Args} ->
                           case lists:keyfind(warrior_combat_embattle, 1, Args)
                               of
                               {_, List} ->
                                   case lists:keyfind(Group, 1, List) of
                                       {_, {_Pets, GuildsId}} -> GuildsId;
                                       _ -> []
                                   end;
                               _ -> []
                           end;
                       _ -> []
                   end,
    CombatGuard1 = combat_guard:to_fighter_list(F,
                                                ActiveGuard),
    PosList = [2, 3],
    do_calc_guard_list_warrior_pet(GetGuardList,
                                   PosList,
                                   lists:keysort(#fighter.pos, CombatGuard1),
                                   []).

do_calc_guard_list_warrior_pet(_, [], _, Result) ->
    Result;
do_calc_guard_list_warrior_pet(_, _, [], Result) ->
    Result;
do_calc_guard_list_warrior_pet([], [Pos | PosList],
                               [Guard | Guards], Result) ->
    logger:debug("=====出战伙伴id======== ~w",
                 [Guard#fighter.base_id],
                 combat_fighter,
                 524),
    do_calc_guard_list_warrior_pet([],
                                   PosList,
                                   Guards,
                                   [Guard#fighter{pos = Pos} | Result]);
do_calc_guard_list_warrior_pet([Id | T],
                               [Pos | PosList], Guards, Result) ->
    logger:debug("============= ~w",
                 [{Id, lists:keyfind(Id, #fighter.base_id, Guards)}],
                 combat_fighter,
                 527),
    logger:debug("============= ~w",
                 [Guards],
                 combat_fighter,
                 528),
    case lists:keyfind(Id, #fighter.base_id, Guards) of
        Guard = #fighter{} ->
            do_calc_guard_list_warrior_pet(T,
                                           PosList,
                                           lists:keydelete(Id,
                                                           #fighter.base_id,
                                                           Guards),
                                           [Guard#fighter{pos = Pos} | Result]);
        _ ->
            do_calc_guard_list_warrior_pet(T,
                                           [Pos | PosList],
                                           Guards,
                                           Result)
    end.

calc_pos_type(FighterList) ->
    calc_pos_type(FighterList, unit).

calc_pos_type([], PosType) -> PosType;
calc_pos_type([#fighter{type = 1} | _T], _) -> role;
calc_pos_type([_ | T], PosType) ->
    calc_pos_type(T, PosType).

do_fighter_init(Group, PosType, CombatType,
                Both = {_, Enemy},
                Fighter = #fighter{name = _Name, origin_id = OriginId,
                                   base_id = BaseId, pid = Pid, type = Type,
                                   m_init = Minit, pos = PreAssignedPos,
                                   master_pos = MasterPos, classes = Classes,
                                   ai_id = AiId, looks = Looks}) ->
    Pos = case Type of
              3 ->
                  case MasterPos of
                      0 ->
                          case PreAssignedPos > 0 of
                              true ->
                                  take_pos(Group, PreAssignedPos),
                                  PreAssignedPos;
                              false ->
                                  assign_fighter_pos(Group,
                                                     PosType,
                                                     Type,
                                                     MasterPos)
                          end;
                      _ -> assign_fighter_pos(Group, PosType, Type, MasterPos)
                  end;
              6 ->
                  case MasterPos of
                      0 ->
                          case PreAssignedPos > 0 of
                              true ->
                                  take_pos(Group, PreAssignedPos),
                                  PreAssignedPos;
                              false ->
                                  assign_fighter_pos(Group,
                                                     PosType,
                                                     Type,
                                                     MasterPos)
                          end;
                      _ -> assign_fighter_pos(Group, PosType, Type, MasterPos)
                  end;
              2 ->
                  case combat_util_data:def_pos(BaseId) of
                      PrePos when is_integer(PrePos) -> PrePos;
                      _ ->
                          case PreAssignedPos > 0 of
                              true ->
                                  take_pos(Group, PreAssignedPos),
                                  PreAssignedPos;
                              false -> assign_fighter_pos(Group, PosType, Type)
                          end
                  end;
              _ when CombatType == 58 ->
                  case get(start_args) of
                      #combat_start_args{ext_args = {_, Order1, Order2}} ->
                          TOrder = case Group of
                                       0 -> Order1;
                                       _ -> Order2
                                   end,
                          Order = guard_tour_2v2_order(TOrder, 1, []),
                          logger:debug("位置1 ~w", [Order], combat_fighter, 598),
                          case lists:keyfind(OriginId, 1, Order) of
                              {_, TPos} ->
                                  case is_pos_taken(Group, TPos) of
                                      true ->
                                          assign_fighter_pos(Group,
                                                             PosType,
                                                             Type);
                                      _ ->
                                          take_pos(Group, TPos),
                                          TPos
                                  end;
                              _ ->
                                  case PreAssignedPos > 0 of
                                      true ->
                                          take_pos(Group, PreAssignedPos),
                                          PreAssignedPos;
                                      false ->
                                          assign_fighter_pos(Group,
                                                             PosType,
                                                             Type)
                                  end
                          end;
                      _ ->
                          case PreAssignedPos > 0 of
                              true ->
                                  take_pos(Group, PreAssignedPos),
                                  PreAssignedPos;
                              false -> assign_fighter_pos(Group, PosType, Type)
                          end
                  end;
              _ when CombatType == 64 ->
                  case Type of
                      5 -> assign_fighter_pos(Group, PosType, Type);
                      _ ->
                          case PreAssignedPos > 0 of
                              true ->
                                  take_pos(Group, PreAssignedPos),
                                  PreAssignedPos;
                              false -> assign_fighter_pos(Group, PosType, Type)
                          end
                  end;
              _ ->
                  case PreAssignedPos > 0 of
                      true ->
                          take_pos(Group, PreAssignedPos),
                          PreAssignedPos;
                      false -> assign_fighter_pos(Group, PosType, Type)
                  end
          end,
    logger:debug("初始化位置 ~w",
                 [{Group,
                   PosType,
                   Type,
                   MasterPos,
                   PreAssignedPos,
                   OriginId,
                   Pos}],
                 combat_fighter,
                 652),
    case Pos of
        undefined ->
            logger:error("无法给[~ts][~w][~w][~w]分配一个站位[~w]",
                         [_Name,
                          Type,
                          CombatType,
                          MasterPos,
                          get({pos, Group})],
                         combat_fighter,
                         655),
            undefined;
        _ ->
            Fid = assign_fighter_id(),
            Pid1 = case is_pid(Pid) of
                       true -> Pid;
                       false -> Fid
                   end,
            F = combat_util:init_fighter(CombatType, Fighter),
            FaceId = case Type of
                         3 -> F#fighter.base_id;
                         6 -> F#fighter.base_id;
                         _ -> F#fighter.face_id
                     end,
            ok,
            NewAiId = combat_util:get_ai(CombatType,
                                         Type,
                                         Classes,
                                         AiId),
            {Ai, GetAiId} = combat_util:ai(CombatType,
                                           Type,
                                           BaseId,
                                           NewAiId),
            BasicSkills = get_basic_skills(CombatType,
                                           Type,
                                           BaseId,
                                           Classes),
            AiSkills = combat_skill:get_skills_from_ai(F, Ai),
            PlotSkills = combat_skill:get_plot_skills(F),
            {ActiveSkills11,
             PassiveSkills11,
             HaloSkills,
             SkillTalents,
             BaseAngerSkills} =
                case combat_util:init_skill(CombatType, F, Minit) of
                    #m_combat_init{skills = Skills, talents = Talents,
                                   wing_skills = WingSkills,
                                   eff_skills = EffSkills} ->
                        HipeSkill = combat_skill:get_hipe_skill(Skills, []),
                        AllSkills = Skills ++
                                        AiSkills ++ PlotSkills ++ HipeSkill,
                        {ActiveSkills0, PassiveSkills0, HaloSkills0} =
                            combat_script_skill:convert_skill(AllSkills),
                        {ActiveSkills0,
                         PassiveSkills0,
                         HaloSkills0,
                         Talents,
                         combat_util:merge_anger_skill(WingSkills ++
                                                           EffSkills)};
                    _ -> {[], [], [], [], []}
                end,
            #passive_effect{talents = PassSkillTalents} =
                combat_script_skill_calc:passive_activate(talent,
                                                          F#fighter{passive_skills
                                                                        =
                                                                        PassiveSkills11},
                                                          F),
            SkillTalents1 = SkillTalents ++ PassSkillTalents,
            ActiveSkills22 =
                combat_skill:modify_by_talent(ActiveSkills11 ++
                                                  BasicSkills,
                                              SkillTalents1),
            PassiveSkills22 =
                combat_skill:modify_by_talent(PassiveSkills11,
                                              SkillTalents1),
            {AngerSkills, PassAngerSkills} =
                combat_script_skill:convert_anger_skill(BaseAngerSkills),
            {ActiveSkills33, PassiveSkills33} = case Type of
                                                    3 ->
                                                        #passive_effect{pet_effect
                                                                            =
                                                                            PetEffect} =
                                                            combat_script_skill_calc:passive_activate(pet_effect,
                                                                                                      F#fighter{active_skills
                                                                                                                    =
                                                                                                                    ActiveSkills22,
                                                                                                                passive_skills
                                                                                                                    =
                                                                                                                    PassiveSkills22},
                                                                                                      F),
                                                        combat_pet:init_pet_effect({ActiveSkills22,
                                                                                    PassiveSkills22},
                                                                                   PetEffect);
                                                    6 ->
                                                        #passive_effect{pet_effect
                                                                            =
                                                                            PetEffect} =
                                                            combat_script_skill_calc:passive_activate(pet_effect,
                                                                                                      F#fighter{active_skills
                                                                                                                    =
                                                                                                                    ActiveSkills22,
                                                                                                                passive_skills
                                                                                                                    =
                                                                                                                    PassiveSkills22},
                                                                                                      F),
                                                        combat_pet:init_pet_effect({ActiveSkills22,
                                                                                    PassiveSkills22},
                                                                                   PetEffect);
                                                    _ ->
                                                        {ActiveSkills22,
                                                         PassiveSkills22}
                                                end,
            ActiveSkills = ActiveSkills33,
            PassiveSkills = PassiveSkills33 ++ PassAngerSkills,
            ActiveSkillInfos = [{SkillId, SkillLev}
                                || #c_skill{id = SkillId, lev = SkillLev}
                                       <- ActiveSkills],
            AngerSkillInfos = [{SkillId, SkillLev}
                               || #c_skill{id = SkillId, lev = SkillLev}
                                      <- AngerSkills],
            SkillInfos = [{0, ActiveSkillInfos},
                          {3, AngerSkillInfos}],
            IsDieDisappear =
                combat_util:is_die_disappear(CombatType, F),
            {AutoFlag, {RatioVal, NewAttr}} =
                calc_dynamic_attr(CombatType, F, Both),
            UnitTalks = [unit_data:unit_talk(EnBaseId)
                         || #fighter{type = 2, base_id = EnBaseId} <- Enemy],
            {IsAuto, ForceIsAuto} = case [1
                                          || #{is_auto := 1} <- UnitTalks]
                                        of
                                        [_ | _] -> {1, 1};
                                        _ ->
                                            {combat_util:calc_auto(F,
                                                                   CombatType),
                                             0}
                                    end,
            InitAnger = case Type of
                            1 -> util:rand(10, 15);
                            _ -> 0
                        end,
            Looks1 = combat_util:init_looks(CombatType,
                                            F,
                                            looks:check_looks(Looks)),
            CostMpRatio = calc_mp_ratio(F, PassiveSkills),
            F1 = F#fighter{id = Fid, pid = Pid1, face_id = FaceId,
                           cost_mp_ratio = CostMpRatio, group = Group,
                           pos = Pos, attr = NewAttr,
                           active_skills = ActiveSkills ++ AngerSkills,
                           passive_skills = PassiveSkills,
                           halo_skills = HaloSkills, skill_infos = SkillInfos,
                           special_status = #special_status{},
                           special_attr =
                               #special_attr{model_id =
                                                 combat_util:init_model(CombatType,
                                                                        Type,
                                                                        BaseId)},
                           combat_init_attr = #combat_init_attr{},
                           combat_dynamic_attr = #combat_dynamic_attr{},
                           is_die_disappear = IsDieDisappear,
                           combat_statistics = #combat_statistics{}, ai = Ai,
                           ai_id = GetAiId, ratio_val = RatioVal,
                           is_auto = IsAuto, looks = Looks1,
                           target_preside_status =
                               combat_util:default_preside(Type, BaseId),
                           anger = InitAnger, force_is_auto = ForceIsAuto},
            F2 = case AutoFlag of
                     {true, PercentList} ->
                         Percent1 = case lists:keyfind(Pos, 1, PercentList) of
                                        {Pos, _OldHpMax, Percent} -> Percent;
                                        {Pos, Percent} -> Percent;
                                        _ -> 1000
                                    end,
                         AutoHp = util:floor(NewAttr#attr.hp_max * Percent1 /
                                                 1000),
                         AutoMp = NewAttr#attr.mp_max,
                         AutoHpMax = NewAttr#attr.hp_max,
                         AutoMpMax = NewAttr#attr.mp_max,
                         logger:debug("怪物血量百分比 ~w ~w ~w ~w",
                                      [Pos,
                                       Percent1,
                                       util:floor(NewAttr#attr.hp_max * Percent1
                                                      / 1000),
                                       AutoHp],
                                      combat_fighter,
                                      779),
                         IsDie = case Percent1 of
                                     0 -> 1;
                                     _ -> 0
                                 end,
                         F1#fighter{hp = AutoHp, mp = AutoMp,
                                    hp_max = AutoHpMax, mp_max = AutoMpMax,
                                    lev = RatioVal, is_die = IsDie};
                     true ->
                         AutoHp = NewAttr#attr.hp_max,
                         AutoMp = NewAttr#attr.mp_max,
                         AutoHpMax = NewAttr#attr.hp_max,
                         AutoMpMax = NewAttr#attr.mp_max,
                         F1#fighter{hp = AutoHp, mp = AutoMp,
                                    hp_max = AutoHpMax, tmp_hp_max = AutoHpMax,
                                    mp_max = AutoMpMax, lev = RatioVal};
                     false -> F1
                 end,
            F3 = fix_hp_and_mp(CombatType, F2),
            SkillPlan = get_skill_plan(F3),
            F4 = F3#fighter{skill_plan = SkillPlan},
            init_startup_status(CombatType, F4)
    end.

get_basic_skills(CombatType, FighterType, BaseId,
                 Classes) ->
    BasicSkills = combat_skill:get_basic_skills(CombatType,
                                                FighterType,
                                                BaseId,
                                                Classes),
    case get(plot_limited_skills) of
        L = [_ | _] -> do_get_basic_skills(BasicSkills, L, []);
        _ -> BasicSkills
    end.

do_get_basic_skills([], _, Result) -> Result;
do_get_basic_skills([Cs = #c_skill{id = Id} | T], L,
                    Result) ->
    case lists:member(Id, L) of
        true -> do_get_basic_skills(T, L, Result);
        false -> do_get_basic_skills(T, L, [Cs | Result])
    end.

unit_talk(Self = #fighter{id = Sid, type = 2,
                          combat_talk = CombatTalk, base_id = BaseId},
          Type) ->
    case lists:keyfind(Type, 1, CombatTalk) of
        {_, TalkMsg} when TalkMsg =/= "" ->
            case unit_convert:rand_talk(BaseId, Type) of
                true ->
                    NewCombatTalk = lists:keydelete(Type, 1, CombatTalk),
                    combat_cache:u(Sid, [{combat_talk, 0, NewCombatTalk}]),
                    combat_play:add_sub_play(combat_play:gen_sub_skill_play(unit_talk,
                                                                            {Self,
                                                                             TalkMsg})),
                    ok;
                _ -> ok
            end;
        _ -> ok
    end;
unit_talk(_, _) -> ok.

preside(IsSameGroup, Group, Sid, _, 7, _) ->
    TargetList = combat_cache:all(Group),
    Tvc = case IsSameGroup of
              1 ->
                  [{self_preside, 0, to_preside_status(7)},
                   {self_preside_text, 0, ""}];
              _ ->
                  [{target_preside, 0, to_preside_status(7)},
                   {target_preside_text, 0, ""}]
          end,
    Tc = [{5, to_preside_status(7), ""}],
    Fun = fun (#fighter{id = Tid}, Update) ->
                  combat_cache:u(Tid, Tvc),
                  [{Sid, Tid, Tc} | Update]
          end,
    UpdateData = lists:foldl(Fun, [], TargetList),
    {true, UpdateData};
preside(IsSameGroup, _Group, Sid, Fid, PresideType,
        PresideText) ->
    Tvc = case IsSameGroup of
              1 ->
                  [{self_preside, 0, to_preside_status(PresideType)},
                   {self_preside_text, 0, PresideText}];
              _ ->
                  [{target_preside, 0, to_preside_status(PresideType)},
                   {target_preside_text, 0, PresideText}]
          end,
    Tc = [{5, to_preside_status(PresideType), PresideText}],
    combat_cache:u(Fid, Tvc),
    {true, [{Sid, Fid, Tc}]}.

to_preside_status(1) -> 1;
to_preside_status(2) -> 2;
to_preside_status(3) -> 3;
to_preside_status(4) -> 4;
to_preside_status(5) -> 5;
to_preside_status(6) -> 0;
to_preside_status(7) -> 0;
to_preside_status(8) -> 6.

assign_fighter_pos(Group, PosType, FighterType) ->
    PosList = case FighterType of
                  5 ->
                      do_sort_pos([1, 2, 3, 4, 5, 11, 12, 13, 10, 9, 7, 6, 8],
                                  get({pos, Group}),
                                  []);
                  _ -> sort_pos(FighterType, PosType, get({pos, Group}))
              end,
    logger:debug("分配位置 Group:~w PosType: ~w FighterType "
                 "~w PosList ~w",
                 [Group, PosType, FighterType, PosList],
                 combat_fighter,
                 910),
    case do_assign_fighter_pos(PosList) of
        undefined -> undefined;
        Pos -> take_pos(Group, Pos, PosList)
    end.

do_assign_fighter_pos([]) -> undefined;
do_assign_fighter_pos([{PosId, 0} | _T]) -> PosId;
do_assign_fighter_pos([_ | T]) ->
    do_assign_fighter_pos(T).

assign_fighter_pos(Group, _PosType, 3, 0) ->
    PosList = do_sort_pos([8,
                           7,
                           9,
                           6,
                           10,
                           4,
                           5,
                           2,
                           3,
                           1,
                           11,
                           13,
                           12],
                          get({pos, Group}),
                          []),
    case do_assign_fighter_pos(PosList) of
        undefined -> undefined;
        Pos -> take_pos(Group, Pos, PosList)
    end;
assign_fighter_pos(Group, _PosType, 6, 0) ->
    PosList = do_sort_pos([1,
                           2,
                           3,
                           4,
                           5,
                           11,
                           12,
                           13,
                           10,
                           9,
                           7,
                           6,
                           8],
                          get({pos, Group}),
                          []),
    case do_assign_fighter_pos(PosList) of
        undefined -> undefined;
        Pos -> take_pos(Group, Pos, PosList)
    end;
assign_fighter_pos(Group, _PosType, 3, MasterPos) ->
    PetPos = if MasterPos =:= 1 -> 8;
                MasterPos =:= 2 -> 7;
                MasterPos =:= 3 -> 9;
                MasterPos =:= 4 -> 6;
                true -> 10
             end,
    case is_pos_taken(Group, PetPos) of
        true -> undefined;
        false -> take_pos(Group, PetPos)
    end;
assign_fighter_pos(Group, _PosType, 6, MasterPos) ->
    PetPos = if MasterPos =:= 1 -> 8;
                MasterPos =:= 2 -> 7;
                MasterPos =:= 3 -> 9;
                MasterPos =:= 4 -> 6;
                true -> 10
             end,
    case is_pos_taken(Group, PetPos) of
        true -> undefined;
        false -> take_pos(Group, PetPos)
    end;
assign_fighter_pos(_, _, _, _) -> undefined.

sort_pos(FighterType, PosType, L) ->
    PosList = case FighterType of
                  1 -> [1, 2, 3, 4, 5, 8, 7, 6, 9, 10, 11, 12, 13];
                  4 -> [1, 2, 3, 4, 5, 8, 7, 6, 9, 10, 11, 12, 13];
                  2 when PosType =:= role ->
                      [1, 2, 3, 4, 5, 8, 7, 6, 9, 10, 11, 12, 13];
                  2 -> [1, 2, 3, 4, 5, 8, 7, 6, 9, 10, 11, 12, 13];
                  5 -> [1, 2, 3, 4, 5, 8, 7, 6, 9, 10, 11, 12, 13];
                  _ -> [1, 2, 3, 4, 5, 8, 7, 6, 9, 10, 11, 12, 13]
              end,
    do_sort_pos(PosList, L, []).

do_sort_pos([], _, Result) -> lists:reverse(Result);
do_sort_pos([Pos | T], L, Result) ->
    case lists:keyfind(Pos, 1, L) of
        false -> do_sort_pos(T, L, Result);
        {Pos, IsTaken} ->
            do_sort_pos(T, L, [{Pos, IsTaken} | Result])
    end.

is_pos_taken(Group, Pos) ->
    PosList = get({pos, Group}),
    case lists:keyfind(Pos, 1, PosList) of
        {Pos, 0} -> false;
        _ -> true
    end.

take_pos(Group, Pos) ->
    PosList = get({pos, Group}),
    PosList1 = lists:keystore(Pos, 1, PosList, {Pos, 1}),
    put({pos, Group}, PosList1),
    Pos.

take_pos(Group, Pos, PosList) ->
    PosList1 = lists:keystore(Pos, 1, PosList, {Pos, 1}),
    put({pos, Group}, PosList1),
    Pos.

assign_fighter_id() ->
    Id = get(next_fighter_id),
    put(next_fighter_id, Id + 1),
    Id.

all_pos() ->
    [{Id, Pos}
     || #fighter{id = Id, pos = Pos} <- combat_cache:all()].

has_empty_pos(Group) ->
    case [PosId || {PosId, 0} <- get({pos, Group})] of
        [] -> false;
        _ -> true
    end.

revoke_dead_pos() ->
    [CombatType] =
        combat_cache:get_context_elem([#combat_context.type]),
    AtkPos = get({pos, 0}),
    DfdPos = get({pos, 1}),
    do_revoke_dead_pos(CombatType,
                       combat_cache:all(0),
                       0,
                       AtkPos,
                       []),
    do_revoke_dead_pos(CombatType,
                       combat_cache:all(1),
                       1,
                       DfdPos,
                       []).

do_revoke_dead_pos(_, _, Group, [], Result) ->
    put({pos, Group}, Result);
do_revoke_dead_pos(CombatType, Fighters, Group,
                   [{PosId, 0} | T], Result) ->
    do_revoke_dead_pos(CombatType,
                       Fighters,
                       Group,
                       T,
                       [{PosId, 0} | Result]);
do_revoke_dead_pos(CombatType, Fighters, Group,
                   [{PosId, 1} | T], Result) ->
    case can_revoke_pos(Fighters, PosId) of
        true ->
            do_revoke_dead_pos(CombatType,
                               Fighters,
                               Group,
                               T,
                               [{PosId, 0} | Result]);
        false ->
            do_revoke_dead_pos(CombatType,
                               Fighters,
                               Group,
                               T,
                               [{PosId, 1} | Result])
    end.

can_revoke_pos([], _PosId) -> true;
can_revoke_pos([#fighter{id = Fid, pos = PosId,
                         is_escape = 1}
                | T],
               PosId) ->
    combat_cache:u(Fid, [{pos, 0, 0}]),
    can_revoke_pos(T, PosId);
can_revoke_pos([#fighter{id = Fid, pos = PosId,
                         is_die = 1, is_die_disappear = 1}
                | T],
               PosId) ->
    combat_cache:u(Fid, [{pos, 0, 0}]),
    can_revoke_pos(T, PosId);
can_revoke_pos([#fighter{pos = PosId} | _T], PosId) ->
    false;
can_revoke_pos([_ | T], PosId) ->
    can_revoke_pos(T, PosId).

init_startup_status(7,
                    F = #fighter{type = 2, unit_type = 8}) ->
    F;
init_startup_status(52, F) -> campaign_snow:init_f(F);
init_startup_status(100,
                    F = #fighter{hp_max = HpMax, mp_max = MpMax}) ->
    F#fighter{hp = HpMax, mp = MpMax};
init_startup_status(102,
                    F = #fighter{hp_max = HpMax, mp_max = MpMax}) ->
    F#fighter{hp = HpMax, mp = MpMax};
init_startup_status(104,
                    F = #fighter{hp_max = HpMax, mp_max = MpMax}) ->
    F#fighter{hp = HpMax, mp = MpMax};
init_startup_status(106,
                    F = #fighter{hp_max = HpMax, mp_max = MpMax}) ->
    F#fighter{hp = HpMax, mp = MpMax};
init_startup_status(107,
                    F = #fighter{hp_max = HpMax, mp_max = MpMax}) ->
    F#fighter{hp = HpMax, mp = MpMax};
init_startup_status(105,
                    F = #fighter{hp_max = HpMax, mp_max = MpMax}) ->
    F#fighter{hp = HpMax, mp = MpMax};
init_startup_status(2,
                    F = #fighter{hp_max = HpMax, mp_max = MpMax}) ->
    F#fighter{hp = HpMax, mp = MpMax};
init_startup_status(40,
                    F = #fighter{hp_max = HpMax, mp_max = MpMax}) ->
    F#fighter{hp = HpMax, mp = MpMax};
init_startup_status(58,
                    F = #fighter{hp_max = HpMax, mp_max = MpMax}) ->
    F#fighter{hp = HpMax, mp = MpMax};
init_startup_status(108,
                    F = #fighter{hp_max = HpMax, mp_max = MpMax}) ->
    F#fighter{hp = HpMax, mp = MpMax};
init_startup_status(110,
                    F = #fighter{hp_max = HpMax, mp_max = MpMax}) ->
    F#fighter{hp = HpMax, mp = MpMax};
init_startup_status(111,
                    F = #fighter{hp_max = HpMax, mp_max = MpMax}) ->
    F#fighter{hp = HpMax, mp = MpMax};
init_startup_status(113,
                    F = #fighter{hp_max = HpMax, mp_max = MpMax}) ->
    F#fighter{hp = HpMax, mp = MpMax};
init_startup_status(115,
                    F = #fighter{hp_max = HpMax, mp_max = MpMax}) ->
    F#fighter{hp = HpMax, mp = MpMax};
init_startup_status(116,
                    F = #fighter{hp_max = HpMax, mp_max = MpMax}) ->
    F#fighter{hp = HpMax, mp = MpMax};
init_startup_status(_R, F) -> F.

calc_dynamic_attr(CombatType,
                  F = #fighter{type = 2, attr = {Percent}}, Both) ->
    CombatStartArgs = get(start_args),
    {RatioVal, Attr} = unit_convert:dynamic_attr(CombatType,
                                                 F,
                                                 Both,
                                                 CombatStartArgs),
    {{true, Percent}, {RatioVal, Attr}};
calc_dynamic_attr(CombatType,
                  F = #fighter{type = 2, attr = {M, Fun, A}}, Both) ->
    CombatStartArgs = get(start_args),
    {RatioVal, Attr1} =
        unit_convert:dynamic_attr(CombatType,
                                  F,
                                  Both,
                                  CombatStartArgs),
    Attr = erlang:apply(M, Fun, [Attr1 | A]),
    {true, {RatioVal, Attr}};
calc_dynamic_attr(22,
                  #fighter{type = 2, attr = Attr, ratio_val = RatioVal},
                  _Both)
    when Attr =/= undefined ->
    {true, {RatioVal, Attr}};
calc_dynamic_attr(26,
                  #fighter{type = 2, attr = Attr, ratio_val = RatioVal},
                  _Both)
    when Attr =/= undefined ->
    {true, {RatioVal, Attr}};
calc_dynamic_attr(CombatType,
                  F = #fighter{type = 2, attr = undefined}, Both) ->
    CombatStartArgs = get(start_args),
    {true,
     unit_convert:dynamic_attr(CombatType,
                               F,
                               Both,
                               CombatStartArgs)};
calc_dynamic_attr(_, #fighter{attr = undefined},
                  _Both) ->
    {false, {0, #attr{}}};
calc_dynamic_attr(_, #fighter{attr = Attr}, _Both) ->
    {false, {0, Attr}}.

fix_hp_and_mp(56,
              F = #fighter{hp = Hp, mp = Mp, hp_max = HpMax,
                           mp_max = MpMax}) ->
    NewHp = Hp,
    NewMp = max(1, Mp),
    NewHpMax = max(1, HpMax),
    NewMpMax = max(1, MpMax),
    F#fighter{hp = NewHp, mp = NewMp, hp_max = NewHpMax,
              tmp_hp_max = NewHpMax, mp_max = NewMpMax};
fix_hp_and_mp(_CombatType,
              F = #fighter{hp = Hp, mp = Mp, hp_max = HpMax,
                           mp_max = MpMax}) ->
    NewHp = max(1, Hp),
    NewMp = max(1, Mp),
    NewHpMax = max(1, HpMax),
    NewMpMax = max(1, MpMax),
    F#fighter{hp = NewHp, mp = NewMp, hp_max = NewHpMax,
              tmp_hp_max = NewHpMax, mp_max = NewMpMax}.

sort_action() ->
    L1 = lists:sort(fun (#fighter{attr =
                                      #attr{atk_speed = AtkSpeed1}},
                         #fighter{attr = #attr{atk_speed = AtkSpeed2}}) ->
                            case AtkSpeed1 > AtkSpeed2 of
                                true -> true;
                                false -> false
                            end
                    end,
                    combat_cache:all()),
    sort_action(L1, 1, []).

sort_action([], _, BaseSort) ->
    put(combat_base_sort, lists:reverse(BaseSort)),
    ok;
sort_action([F = #fighter{id = Fid,
                          attr = #attr{atk_speed = AtkSpeed}}
             | T],
            Flag, BaseSort) ->
    combat_cache:u(F#fighter{order = Flag}),
    sort_action(T,
                Flag + 1,
                [{Fid, Flag, AtkSpeed} | BaseSort]).

disturb_action_order(FighterList) ->
    F = fun (X = #fighter{attr =
                              Attr = #attr{atk_speed = AtkSpeed}}) ->
                R = if AtkSpeed =< 1000 ->
                           util:rand(round(-5.0e-2 * AtkSpeed),
                                     round(5.0e-2 * AtkSpeed));
                       AtkSpeed > 1000 andalso AtkSpeed =< 2000 ->
                           util:rand(round(-2.99999999999999988898e-2 *
                                               AtkSpeed),
                                     round(2.99999999999999988898e-2 *
                                               AtkSpeed));
                       AtkSpeed > 2000 ->
                           util:rand(round(-2.0e-2 * AtkSpeed),
                                     round(2.0e-2 * AtkSpeed));
                       true ->
                           util:rand(round(-5.0e-2 * AtkSpeed),
                                     round(5.0e-2 * AtkSpeed))
                    end,
                NewAtkSpeed = max(0, AtkSpeed + R),
                X#fighter{attr = Attr#attr{atk_speed = NewAtkSpeed}}
        end,
    [F(X) || X = #fighter{} <- FighterList].

update_sort_action() ->
    case get(combat_base_sort) of
        undefined -> ok;
        BaseOrder ->
            AllFighter = combat_cache:all(),
            do_update_sort_action(BaseOrder, AllFighter)
    end.

update_sort_action(#fighter{id = Fid,
                            attr = #attr{atk_speed = AtkSpeed}}) ->
    BaseOrder = get(combat_base_sort),
    NewBaseOrder = make_base_order(BaseOrder,
                                   {Fid, AtkSpeed},
                                   false,
                                   1,
                                   []),
    put(combat_base_sort, NewBaseOrder),
    AllFighter = combat_cache:all(),
    do_update_sort_action(NewBaseOrder, AllFighter);
update_sort_action(_) -> ok.

make_base_order([], {_Fid2, _AtkSpeed2}, true, _Flag,
                BaseOrder) ->
    lists:reverse(BaseOrder);
make_base_order([], {Fid2, AtkSpeed2}, false, Flag,
                BaseOrder) ->
    lists:reverse([{Fid2, Flag, AtkSpeed2} | BaseOrder]);
make_base_order([{Fid1, _, AtkSpeed1} | T],
                {Fid2, AtkSpeed2}, true, Flag, BaseOrder) ->
    make_base_order(T,
                    {Fid2, AtkSpeed2},
                    true,
                    Flag + 1,
                    [{Fid1, Flag, AtkSpeed1} | BaseOrder]);
make_base_order([{Fid1, _, AtkSpeed1} | T],
                {Fid2, AtkSpeed2}, false, Flag, BaseOrder) ->
    case AtkSpeed1 >= AtkSpeed2 of
        true ->
            make_base_order(T,
                            {Fid2, AtkSpeed2},
                            false,
                            Flag + 1,
                            [{Fid1, Flag, AtkSpeed1} | BaseOrder]);
        false ->
            NewBaseOrder = [{Fid1, Flag + 1, AtkSpeed1},
                            {Fid2, Flag, AtkSpeed2}
                            | BaseOrder],
            make_base_order(T,
                            {Fid2, AtkSpeed2},
                            true,
                            Flag + 2,
                            NewBaseOrder)
    end.

do_update_sort_action(BaseOrder, AllF) ->
    Fun = fun (#fighter{id = Id1,
                        attr = #attr{atk_speed = AtkSpeed1}},
               #fighter{id = Id2,
                        attr = #attr{atk_speed = AtkSpeed2}}) ->
                  if AtkSpeed1 > AtkSpeed2 -> true;
                     AtkSpeed1 =:= AtkSpeed2 ->
                         Flag1 = case lists:keyfind(Id1, 1, BaseOrder) of
                                     {_, Fg1, _} -> Fg1;
                                     _ -> 10000
                                 end,
                         Flag2 = case lists:keyfind(Id2, 1, BaseOrder) of
                                     {_, Fg2, _} -> Fg2;
                                     _ -> 10000
                                 end,
                         Flag1 < Flag2;
                     true -> false
                  end
          end,
    SortF = lists:sort(Fun, AllF),
    do_set_order(SortF, 1).

do_set_order([], _) -> ok;
do_set_order([F | T], Flag) ->
    combat_cache:u(F#fighter{order = Flag}),
    do_set_order(T, Flag + 1).

add_fighters(Type, Group, Args) ->
    add_fighters(Args, Type, Group, []).

add_fighters([], _, _, Result) -> Result;
add_fighters([Arg | T], Type, Group, Result) ->
    Added = add_fighter(Type, Group, Arg),
    add_fighters(T, Type, Group, Result ++ Added).

handle_join(all,
            Combat = #combat{waiting_join = WaitingJoin}) ->
    case do_join(WaitingJoin, Combat, []) of
        Joined = [_ | _] -> Joined;
        _ -> []
    end.

do_join([], _, Result) -> Result;
do_join([F = #fighter{name = _Name, group = Group} | T],
        Combat, Result) ->
    case add_fighter(by_matching, Group, F) of
        [] ->
            logger:error("[~ts]加入战斗失败，添加参战者失败",
                         [_Name],
                         combat_fighter,
                         1263),
            do_join(T, Combat, Result);
        NFs -> do_join(T, Combat, Result ++ NFs)
    end.

add_fighter(by_summon, Group, {Pos, UnitBaseId}) ->
    case unit_convert:to(unit_base_id_to_fighter,
                         UnitBaseId)
        of
        {ok, F} ->
            Idx = case Group of
                      0 -> #combat_context.origin_atk;
                      _ -> #combat_context.origin_dfd
                  end,
            [CombatType, OriginList] =
                combat_cache:get_context_elem([#combat_context.type,
                                               Idx]),
            remove_pos_fighter(by_pos, Group, Pos),
            SummonFighter = F#fighter{pos = Pos},
            case fighter_init(Group, CombatType, [SummonFighter]) of
                [NF = #fighter{id = Fid}] ->
                    put(Group, combat_cache:all(Group) ++ [NF]),
                    combat_cache:save_context([{Idx, [NF | OriginList]}]),
                    combat_buff:buff_init([NF]),
                    update_sort_action(NF),
                    SummonList1 = [combat_cache:f(by_id, Fid)],
                    SummonList2 = combat:append_infos(SummonList1),
                    [combat_cache:u(Summon)
                     || Summon = #fighter{} <- SummonList2];
                _ ->
                    logger:error("新增参战者[NpcBaseId=~w]失败，初始化失败",
                                 [UnitBaseId],
                                 combat_fighter,
                                 1295),
                    []
            end;
        _Err ->
            logger:error("新增参战者[NpcBaseId=~w]失败, 转换失败:~w",
                         [UnitBaseId, _Err],
                         combat_fighter,
                         1299),
            []
    end;
add_fighter(by_summon, Group, UnitBaseId) ->
    case has_empty_pos(Group) of
        true ->
            case unit_convert:to(unit_base_id_to_fighter,
                                 UnitBaseId)
                of
                {ok, F} ->
                    Idx = case Group of
                              0 -> #combat_context.origin_atk;
                              _ -> #combat_context.origin_dfd
                          end,
                    [CombatType, OriginList] =
                        combat_cache:get_context_elem([#combat_context.type,
                                                       Idx]),
                    F1 = remove_fighter(Group, UnitBaseId, F),
                    case fighter_init(Group, CombatType, [F1]) of
                        [NF = #fighter{id = Fid}] ->
                            put(Group, combat_cache:all(Group) ++ [NF]),
                            combat_cache:save_context([{Idx,
                                                        [NF | OriginList]}]),
                            combat_buff:buff_init([NF]),
                            update_sort_action(NF),
                            SummonList1 = [combat_cache:f(by_id, Fid)],
                            SummonList2 = combat:append_infos(SummonList1),
                            [combat_cache:u(Summon)
                             || Summon = #fighter{} <- SummonList2];
                        _ ->
                            logger:error("新增参战者[NpcBaseId=~w]失败，初始化失败",
                                         [UnitBaseId],
                                         combat_fighter,
                                         1325),
                            []
                    end;
                _Err ->
                    logger:error("新增参战者[NpcBaseId=~w]失败, 转换失败:~w",
                                 [UnitBaseId, _Err],
                                 combat_fighter,
                                 1329),
                    []
            end;
        false ->
            logger:error("动态增加参战者失败[way=召唤, Group=~w, NpcBaseId=~w]，无法再增加了",
                         [Group, UnitBaseId],
                         combat_fighter,
                         1333),
            []
    end;
add_fighter(by_matching, Group, F) ->
    case has_empty_pos(Group) of
        true ->
            Idx = case Group of
                      0 -> #combat_context.origin_atk;
                      _ -> #combat_context.origin_dfd
                  end,
            [CombatType, OriginList] =
                combat_cache:get_context_elem([#combat_context.type,
                                               Idx]),
            case fighter_init(Group, CombatType, [F]) of
                [NF = #fighter{id = Fid1}, Pet = #fighter{id = Fid2}] ->
                    put(Group, combat_cache:all(Group) ++ [NF, Pet]),
                    combat_cache:save_context([{Idx,
                                                [NF, Pet | OriginList]}]),
                    combat_buff:buff_init([NF, Pet]),
                    update_sort_action(NF),
                    update_sort_action(Pet),
                    SummonList1 = [combat_cache:f(by_id, Fid1)],
                    SummonList2 = combat:append_infos(SummonList1),
                    SummonList3 = [combat_cache:f(by_id, Fid2)],
                    SummonList4 = combat:append_infos(SummonList3),
                    [combat_cache:u(Summon)
                     || Summon = #fighter{} <- SummonList2 ++ SummonList4];
                [NF = #fighter{id = Fid}] ->
                    put(Group, combat_cache:all(Group) ++ [NF]),
                    combat_cache:save_context([{Idx, [NF | OriginList]}]),
                    combat_buff:buff_init([NF]),
                    update_sort_action(NF),
                    SummonList1 = [combat_cache:f(by_id, Fid)],
                    SummonList2 = combat:append_infos(SummonList1),
                    [combat_cache:u(Summon)
                     || Summon = #fighter{} <- SummonList2];
                _Err ->
                    logger:error("新增参战者失败，初始化失败:~w",
                                 [_Err],
                                 combat_fighter,
                                 1365),
                    []
            end;
        false ->
            logger:error("通过匹配系统动态增加参战者失败，无法再增加了",
                         [],
                         combat_fighter,
                         1369),
            []
    end;
add_fighter(pet_clone, Group, F) ->
    OpList = combat_cache:all(Group),
    lists:foreach(fun (Fighter = #fighter{type = 3,
                                          master_pid = 0}) ->
                          remove_fighter(Fighter);
                      (_) -> skip
                  end,
                  OpList),
    lists:foreach(fun (Fighter = #fighter{type = 6,
                                          master_pid = 0}) ->
                          remove_fighter(Fighter);
                      (_) -> skip
                  end,
                  OpList),
    case has_empty_pos(Group) of
        true ->
            Idx = case Group of
                      0 -> #combat_context.origin_atk;
                      _ -> #combat_context.origin_dfd
                  end,
            [CombatType, OriginList] =
                combat_cache:get_context_elem([#combat_context.type,
                                               Idx]),
            case fighter_init(Group, CombatType, [F]) of
                [NF = #fighter{id = Fid1}, Pet = #fighter{id = Fid2}] ->
                    put(Group, combat_cache:all(Group) ++ [NF, Pet]),
                    combat_cache:save_context([{Idx,
                                                [NF, Pet | OriginList]}]),
                    combat_buff:buff_init([NF]),
                    update_sort_action(NF),
                    update_sort_action(Pet),
                    [combat_cache:f(by_id, Fid1),
                     combat_cache:f(by_id, Fid2)];
                [NF = #fighter{id = Fid}] ->
                    put(Group, combat_cache:all(Group) ++ [NF]),
                    combat_cache:save_context([{Idx, [NF | OriginList]}]),
                    combat_buff:buff_init([NF]),
                    update_sort_action(NF),
                    SummonList1 = [combat_cache:f(by_id, Fid)],
                    SummonList2 = combat:append_infos(SummonList1),
                    [combat_cache:u(Summon)
                     || Summon = #fighter{} <- SummonList2];
                _ ->
                    logger:error("新增参战者失败，初始化失败:~w",
                                 [F],
                                 combat_fighter,
                                 1406),
                    []
            end;
        false ->
            logger:error("通过匹配系统动态增加参战者失败，无法再增加了",
                         [],
                         combat_fighter,
                         1410),
            []
    end;
add_fighter(guard_clone, Group, F) ->
    case has_empty_pos(Group) of
        true ->
            Idx = case Group of
                      0 -> #combat_context.origin_atk;
                      _ -> #combat_context.origin_dfd
                  end,
            [CombatType, OriginList] =
                combat_cache:get_context_elem([#combat_context.type,
                                               Idx]),
            case fighter_init(Group, CombatType, [F]) of
                [NF = #fighter{id = Fid1}, Pet = #fighter{id = Fid2}] ->
                    put(Group, combat_cache:all(Group) ++ [NF, Pet]),
                    combat_cache:save_context([{Idx,
                                                [NF, Pet | OriginList]}]),
                    combat_buff:buff_init([NF]),
                    update_sort_action(NF),
                    update_sort_action(Pet),
                    [combat_cache:f(by_id, Fid1),
                     combat_cache:f(by_id, Fid2)];
                [NF = #fighter{id = Fid}] ->
                    put(Group, combat_cache:all(Group) ++ [NF]),
                    combat_cache:save_context([{Idx, [NF | OriginList]}]),
                    combat_buff:buff_init([NF]),
                    update_sort_action(NF),
                    SummonList1 = [combat_cache:f(by_id, Fid)],
                    SummonList2 = combat:append_infos(SummonList1),
                    [combat_cache:u(Summon)
                     || Summon = #fighter{} <- SummonList2];
                _ ->
                    logger:error("新增参战者失败，初始化失败:~w",
                                 [F],
                                 combat_fighter,
                                 1438),
                    []
            end;
        false ->
            logger:error("通过匹配系统动态增加参战者失败，无法再增加了",
                         [],
                         combat_fighter,
                         1442),
            []
    end;
add_fighter(guard_glory, Group,
            F = #fighter{attr = Attr = #attr{}, hp = Hp, mp = Mp,
                         hp_max = HpMax, tmp_hp_max = TmpHpMax, mp_max = MpMax,
                         is_die = IsDie}) ->
    case has_empty_pos(Group) of
        true ->
            Idx = case Group of
                      0 -> #combat_context.origin_atk;
                      _ -> #combat_context.origin_dfd
                  end,
            [CombatType, OriginList] =
                combat_cache:get_context_elem([#combat_context.type,
                                               Idx]),
            case fighter_init(Group, CombatType, [F]) of
                [NF = #fighter{id = Fid1}, Pet = #fighter{id = Fid2}] ->
                    put(Group, combat_cache:all(Group) ++ [NF, Pet]),
                    combat_cache:save_context([{Idx,
                                                [NF, Pet | OriginList]}]),
                    combat_buff:buff_init([NF]),
                    update_sort_action(NF),
                    update_sort_action(Pet),
                    [combat_cache:f(by_id, Fid1),
                     combat_cache:f(by_id, Fid2)];
                [TNF = #fighter{id = Fid, hp = _THp, hp_max = _THpMax,
                                tmp_hp_max = TTmpHpMax}] ->
                    logger:debug("======================:~w是否有空的位置：~w, "
                                 "hp = ~w, mp = ~w, hp_max = ~w, tmp_hp_max "
                                 "= ~w, mp_max = ~w, is_die = ~w",
                                 [Fid,
                                  has_empty_pos(Group),
                                  {Hp, _THp},
                                  Mp,
                                  {HpMax, _THpMax},
                                  {TmpHpMax, TTmpHpMax},
                                  MpMax,
                                  IsDie],
                                 combat_fighter,
                                 1463),
                    NewTmpHpMax = case TmpHpMax of
                                      0 -> TTmpHpMax;
                                      _ when TmpHpMax < HpMax / 2 -> TTmpHpMax;
                                      _ -> TmpHpMax
                                  end,
                    NF = TNF#fighter{attr = Attr, hp = Hp, mp = Mp,
                                     hp_max = HpMax, tmp_hp_max = NewTmpHpMax,
                                     mp_max = MpMax, is_die = IsDie},
                    put(Group, combat_cache:all(Group) ++ [NF]),
                    combat_cache:save_context([{Idx, [NF | OriginList]}]),
                    combat_buff:buff_init([NF]),
                    update_sort_action(NF),
                    SummonList1 = [combat_cache:f(by_id, Fid)],
                    SummonList2 = combat:append_infos(SummonList1),
                    [combat_cache:u(Summon)
                     || Summon = #fighter{} <- SummonList2];
                _ ->
                    logger:error("新增参战者失败，初始化失败:~w",
                                 [F],
                                 combat_fighter,
                                 1479),
                    []
            end;
        false ->
            logger:error("通过匹配系统动态增加参战者失败，无法再增加了",
                         [],
                         combat_fighter,
                         1483),
            []
    end.

remove_fighter(Fighter = #fighter{pos = PosId,
                                  group = Group}) ->
    combat_cache:u(Fighter#fighter{is_escape = 1}),
    force_revoke_pos(Group, PosId),
    ok;
remove_fighter(Fid) ->
    logger:debug("=================================1111111111111",
                 [],
                 combat_fighter,
                 1493),
    case combat_cache:f(by_id, Fid) of
        F = #fighter{pos = PosId, is_escape = 0,
                     group = Group} ->
            logger:debug("=================================1111111111111",
                         [],
                         combat_fighter,
                         1496),
            combat_cache:u(F#fighter{is_escape = 1}),
            force_revoke_pos(Group, PosId),
            ok;
        _ ->
            logger:debug("=================================1111111111111",
                         [],
                         combat_fighter,
                         1501),
            {error, lang:get("找不到要移除的目标")}
    end.

remove_fighter(Group, UnitBaseId, F1) ->
    case lists:keyfind(UnitBaseId,
                       #fighter.base_id,
                       combat_cache:all(Group))
        of
        F = #fighter{type = 2, is_die = 1, is_escape = 0,
                     is_die_disappear = 1, is_leader = IsLeader, pid = Pid,
                     rid = Rid, origin_id = Id} ->
            put(Group, combat_cache:all(Group) -- [F]),
            F1#fighter{is_leader = IsLeader, pid = Pid, rid = Rid,
                       origin_id = Id};
        _ -> F1
    end.

remove_pos_fighter(by_pos, Group, Pos) ->
    case lists:keyfind(Pos,
                       #fighter.pos,
                       combat_cache:all(Group))
        of
        F = #fighter{type = 2, is_escape = 0} ->
            combat_cache:u(F#fighter{is_escape = 1,
                                     is_die_disappear = 1}),
            force_revoke_pos(Group, Pos),
            ok;
        _ -> ok
    end.

force_revoke_pos(Group, PosId) ->
    PosList = get({pos, Group}),
    put({pos, Group},
        lists:keystore(PosId, 1, PosList, {PosId, 0})).

modify_cost_mp_ratio(CombatType, FighterList)
    when CombatType =:= 100 orelse
             CombatType =:= 103 orelse
                 CombatType =:= 104 orelse
                     CombatType =:= 106 orelse
                         CombatType =:= 107 orelse
                             CombatType =:= 113 orelse
                                 CombatType =:= 112 orelse
                                     CombatType =:= 6 orelse
                                         CombatType =:= 115 orelse
                                             CombatType =:= 114 orelse
                                                 CombatType =:= 41 ->
    case calc_classes_num(FighterList, 0, undefined, false)
        of
        {Num, Pid, IsAssist} when Num >= 3 ->
            Msg = notice:format(lang:get("由于辅助职业超过~ts个，守护技能蓝耗增加了"),
                                [{string_2, 5, "2"}]),
            case is_pid(Pid) of
                true -> notice:send({pid, Pid}, 3, Msg);
                false -> skip
            end,
            update_cost_mp_ratio(FighterList, Num, IsAssist, []);
        _ -> FighterList
    end;
modify_cost_mp_ratio(_, FighterList) -> FighterList.

calc_classes_num([], Num, Pid, IsAssist) ->
    {Num, Pid, IsAssist};
calc_classes_num([#fighter{type = 5, classes = Classes}
                  | T],
                 Num, Pid, IsAssist)
    when Classes =:= 4 orelse Classes =:= 5 ->
    calc_classes_num(T, Num + 1, Pid, IsAssist);
calc_classes_num([#fighter{type = 1, classes = Classes,
                           pid = Pid}
                  | T],
                 Num, _LastPid, _) ->
    IsAssist = Classes =:= 4 orelse Classes =:= 5,
    case IsAssist of
        true -> calc_classes_num(T, Num + 1, Pid, IsAssist);
        _ -> calc_classes_num(T, Num, Pid, IsAssist)
    end;
calc_classes_num([_ | T], Num, Pid, IsAssist) ->
    calc_classes_num(T, Num, Pid, IsAssist).

update_cost_mp_ratio([], _, _, FighterList) ->
    FighterList;
update_cost_mp_ratio([F = #fighter{type = 5,
                                   classes = _Classes}
                      | T],
                     Num, IsAssist, FighterList) ->
    CostRatio = case Num =< 3 of
                    true -> 1800;
                    _ -> 2300
                end,
    update_cost_mp_ratio(T,
                         Num,
                         IsAssist,
                         [F#fighter{cost_mp_ratio = CostRatio} | FighterList]);
update_cost_mp_ratio([F | T], Num, _IsAssist,
                     FighterList) ->
    update_cost_mp_ratio(T,
                         Num,
                         _IsAssist,
                         [F | FighterList]).

formation_init(Group, FormationId, FormationLev,
               FighterList, CombatType, TFormationId,
               _TFormationLev) ->
    IsRestrain = case lists:member(CombatType,
                                   [114,
                                    100,
                                    102,
                                    104,
                                    103,
                                    114,
                                    4,
                                    6,
                                    105,
                                    106,
                                    107,
                                    41,
                                    40,
                                    108,
                                    110,
                                    111,
                                    113,
                                    58,
                                    115,
                                    116])
                     of
                     true ->
                         case formation_data:get({FormationId, FormationLev}) of
                             #formation_data{strong_restrain = StrRes,
                                             weak_restrain = WeakRes}
                                 when is_list(StrRes) andalso
                                          is_list(WeakRes) ->
                                 case lists:member(TFormationId, StrRes) of
                                     true -> strong;
                                     _ ->
                                         case lists:member(TFormationId,
                                                           WeakRes)
                                             of
                                             true -> weak;
                                             _ -> false
                                         end
                                 end;
                             _ -> false
                         end;
                     false -> false
                 end,
    case formation_data:get({FormationId, FormationLev}) of
        #formation_data{attr_1 = Attr1, attr_2 = Attr2,
                        attr_3 = Attr3, attr_4 = Attr4, attr_5 = Attr5,
                        pet_attr = PetAttr} ->
            put({formation_effect, Group}, {PetAttr, IsRestrain}),
            do_formation_init({Attr1,
                               Attr2,
                               Attr3,
                               Attr4,
                               Attr5,
                               PetAttr,
                               IsRestrain},
                              FighterList,
                              []);
        _ -> FighterList
    end.

do_formation_init(_, [], FighterList) -> FighterList;
do_formation_init({Attr1,
                   Attr2,
                   Attr3,
                   Attr4,
                   Attr5,
                   PetAttr,
                   IsRestrain},
                  [F = #fighter{name = _Name, pos = Pos, type = Type}
                   | T],
                  FighterList) ->
    GetAttr1 = case Pos of
                   1 -> Attr1;
                   2 -> Attr2;
                   3 -> Attr3;
                   4 -> Attr4;
                   5 -> Attr5;
                   _ -> []
               end,
    GetAttr2 = case lists:member(Type, [3, 6]) of
                   true -> PetAttr;
                   false -> []
               end,
    GetAttr3 = case IsRestrain of
                   strong -> [{24, 100}];
                   weak -> [{23, 50}];
                   _ -> []
               end,
    GetAttr = GetAttr1 ++ GetAttr2 ++ GetAttr3,
    NewF = calc_formation(F, GetAttr, []),
    do_formation_init({Attr1,
                       Attr2,
                       Attr3,
                       Attr4,
                       Attr5,
                       PetAttr,
                       IsRestrain},
                      T,
                      [NewF | FighterList]).

calc_formation(F, [], []) -> F;
calc_formation(F, [], ValList) ->
    combat_cache:do_u(F, ValList, calc_only);
calc_formation(F, [{Name, Val} | T], ValList) ->
    Kv = case Name of
             33 -> [{i_heal_ratio, 1, Val}];
             34 -> [{i_eff_heal_ratio, 1, Val}];
             23 -> [{i_dmg_ratio, 1, Val}];
             32 -> [{i_hurt_ratio, 1, Val}];
             53 -> [{atk_speed, 3, Val}];
             56 -> [{phy_def, 3, Val}];
             57 -> [{magic_def, 3, Val}];
             54 -> [{phy_dmg, 3, Val}];
             55 -> [{magic_dmg, 3, Val}];
             24 -> [{def_ratio, 1, Val}];
             30 -> [{phy_def_ratio, 1, Val}];
             31 -> [{magic_def_ratio, 1, Val}];
             _ ->
                 logger:error("阵法遇到未知属性:~w:~w",
                              [Name, Val],
                              combat_fighter,
                              1661),
                 []
         end,
    calc_formation(F, T, Kv ++ ValList).

add_slave(CombatType = 26, AtkList, DfdList) ->
    logger:debug("===add_slave===========:",
                 [],
                 combat_fighter,
                 1670),
    AtkList1 = mark_leader(AtkList),
    DfdList1 = mark_leader(DfdList),
    AtkRoleNum = count_num(AtkList1, CombatType),
    DfdRoleNum = count_num(DfdList1, CombatType),
    AtkList2 = do_add_slave(AtkList1, DfdRoleNum, []),
    DfdList2 = do_add_slave(DfdList1, AtkRoleNum, []),
    ExchangeRobotDfdList = case get(start_args) of
                               #combat_start_args{ext_args = ExtArgs} ->
                                   logger:debug("===add_slave===========:~w",
                                                [ExtArgs],
                                                combat_fighter,
                                                1679),
                                   case lists:keyfind(constellation_guard,
                                                      1,
                                                      ExtArgs)
                                       of
                                       {_, ConstellationGuards = [_ | _]} ->
                                           logger:debug("======add_slave==:~w",
                                                        [ConstellationGuards],
                                                        combat_fighter,
                                                        1682),
                                           Fun = fun (F = #fighter{base_id =
                                                                       BaseId,
                                                                   classes =
                                                                       Classes},
                                                      Rtn) ->
                                                         case
                                                             lists:keyfind(BaseId,
                                                                           #constellation_guard.base_id,
                                                                           ConstellationGuards)
                                                             of
                                                             #constellation_guard{id
                                                                                      =
                                                                                      {0,
                                                                                       "",
                                                                                       0}} ->
                                                                 [F | Rtn];
                                                             _C =
                                                                 #constellation_guard{name
                                                                                          =
                                                                                          Name,
                                                                                      sex
                                                                                          =
                                                                                          Sex,
                                                                                      looks
                                                                                          =
                                                                                          Looks} ->
                                                                 logger:debug("=====add_slave===:~w",
                                                                              [_C],
                                                                              combat_fighter,
                                                                              1688),
                                                                 NewF =
                                                                     F#fighter{name
                                                                                   =
                                                                                   Name,
                                                                               sex
                                                                                   =
                                                                                   Sex,
                                                                               looks
                                                                                   =
                                                                                   Looks},
                                                                 [NewF | Rtn];
                                                             _
                                                                 when Classes >
                                                                          0 ->
                                                                 Rtn;
                                                             _ -> [F | Rtn]
                                                         end
                                                 end,
                                           lists:reverse(lists:foldl(Fun,
                                                                     [],
                                                                     DfdList2));
                                       _ -> DfdList2
                                   end;
                               _ -> DfdList2
                           end,
    {AtkList3, DfdList3} = combat_pet:add_pet(CombatType,
                                              AtkList2,
                                              ExchangeRobotDfdList),
    {AtkForMationId, AtkForMationLev, AtkList4} =
        make_formation(CombatType, AtkList3),
    {DfdForMationId, DfdForMationLev, DfdList4} =
        make_formation(CombatType, DfdList3),
    {AtkList4,
     DfdList4,
     AtkForMationId,
     AtkForMationLev,
     DfdForMationId,
     DfdForMationLev};
add_slave(CombatType = 67, AtkList, DfdList) ->
    logger:debug("===add_slave===========:",
                 [],
                 combat_fighter,
                 1707),
    AtkList1 = mark_leader(AtkList),
    DfdList1 = mark_leader(DfdList),
    AtkRoleNum = count_num(AtkList1, CombatType),
    DfdRoleNum = count_num(DfdList1, CombatType),
    AtkList2 = do_add_slave(AtkList1, DfdRoleNum, []),
    DfdList2 = do_add_slave(DfdList1, AtkRoleNum, []),
    ExchangeRobotDfdList = case get(start_args) of
                               #combat_start_args{ext_args = ExtArgs} ->
                                   logger:debug("===add_slave===========:~w",
                                                [ExtArgs],
                                                combat_fighter,
                                                1716),
                                   case lists:keyfind(statue_info, 1, ExtArgs)
                                       of
                                       {_,
                                        _StatueInfo = #unit_statue{name = Name,
                                                                   sex = Sex,
                                                                   classes =
                                                                       Classes,
                                                                   looks =
                                                                       Looks},
                                        MasterBaseId} ->
                                           logger:debug("======add_slave==:~w",
                                                        [_StatueInfo],
                                                        combat_fighter,
                                                        1719),
                                           Fun = fun (F = #fighter{base_id =
                                                                       BaseId},
                                                      Rtn)
                                                         when BaseId =:=
                                                                  MasterBaseId ->
                                                         NewF = F#fighter{name =
                                                                              Name,
                                                                          sex =
                                                                              Sex,
                                                                          looks
                                                                              =
                                                                              Looks,
                                                                          classes
                                                                              =
                                                                              Classes},
                                                         [NewF | Rtn];
                                                     (F, Rtn) -> [F | Rtn]
                                                 end,
                                           lists:reverse(lists:foldl(Fun,
                                                                     [],
                                                                     DfdList2));
                                       _ -> DfdList2
                                   end;
                               _ -> DfdList2
                           end,
    {AtkList3, DfdList3} = combat_pet:add_pet(CombatType,
                                              AtkList2,
                                              ExchangeRobotDfdList),
    {AtkForMationId, AtkForMationLev, AtkList4} =
        make_formation(CombatType, AtkList3),
    {DfdForMationId, DfdForMationLev, DfdList4} =
        make_formation(CombatType, DfdList3),
    {AtkList4,
     DfdList4,
     AtkForMationId,
     AtkForMationLev,
     DfdForMationId,
     DfdForMationLev};
add_slave(CombatType, AtkList, DfdList) ->
    AtkList1 = mark_leader(AtkList),
    DfdList1 = mark_leader(DfdList),
    AtkRoleNum = count_num(AtkList1, CombatType),
    DfdRoleNum = count_num(DfdList1, CombatType),
    AtkList2 = do_add_slave(AtkList1, DfdRoleNum, []),
    DfdList2 = do_add_slave(DfdList1, AtkRoleNum, []),
    {AtkList3, DfdList3} = combat_pet:add_pet(CombatType,
                                              AtkList2,
                                              DfdList2),
    {AtkForMationId, AtkForMationLev, AtkList4} =
        make_formation(CombatType, AtkList3),
    {DfdForMationId, DfdForMationLev, DfdList4} =
        make_formation(CombatType, DfdList3),
    {AtkList4,
     DfdList4,
     AtkForMationId,
     AtkForMationLev,
     DfdForMationId,
     DfdForMationLev}.

do_add_slave([], _, Result) -> lists:reverse(Result);
do_add_slave([F = #fighter{type = 2, slave = Slave,
                           ratio_val = RatioVal}
              | T],
             OpSideRoleNum, Result) ->
    SlaveFs = gen_slave(Slave, OpSideRoleNum, RatioVal, []),
    do_add_slave(T, OpSideRoleNum, SlaveFs ++ [F | Result]);
do_add_slave([F = #fighter{type = 4, slave = Slave,
                           ratio_val = RatioVal}
              | T],
             OpSideRoleNum, Result) ->
    SlaveFs = gen_slave(Slave, OpSideRoleNum, RatioVal, []),
    do_add_slave(T, OpSideRoleNum, SlaveFs ++ [F | Result]);
do_add_slave([F | T], OpSideRoleNum, Result) ->
    do_add_slave(T, OpSideRoleNum, [F | Result]).

gen_slave([], _, _, Result) -> Result;
gen_slave([{UnitBaseId, NeedNum, Ratio} | T],
          OpSideRoleNum, RatioVal, Result)
    when OpSideRoleNum >= NeedNum ->
    case util:rand(1, 100) =< Ratio of
        true ->
            case unit_convert:to(unit_base_id_to_fighter,
                                 UnitBaseId)
                of
                {ok, F} ->
                    gen_slave(T,
                              OpSideRoleNum,
                              RatioVal,
                              [F#fighter{ratio_val = RatioVal} | Result]);
                _Err ->
                    logger:error("转化随从怪[~w]出错:~w",
                                 [UnitBaseId, _Err],
                                 combat_fighter,
                                 1766),
                    gen_slave(T, OpSideRoleNum, RatioVal, Result)
            end;
        false -> gen_slave(T, OpSideRoleNum, RatioVal, Result)
    end;
gen_slave([{UnitBaseId, NeedNum, Ratio, {M, Fun, A}}
           | T],
          OpSideRoleNum, RatioVal, Result)
    when OpSideRoleNum >= NeedNum ->
    case util:rand(1, 100) =< Ratio of
        true ->
            case unit_convert:to(unit_base_id_to_fighter,
                                 UnitBaseId)
                of
                {ok, F} ->
                    gen_slave(T,
                              OpSideRoleNum,
                              RatioVal,
                              [erlang:apply(M,
                                            Fun,
                                            [F#fighter{ratio_val = RatioVal}
                                             | A])
                               | Result]);
                _Err ->
                    logger:error("转化随从怪[~w]出错:~w",
                                 [UnitBaseId, _Err],
                                 combat_fighter,
                                 1780),
                    gen_slave(T, OpSideRoleNum, RatioVal, Result)
            end;
        false -> gen_slave(T, OpSideRoleNum, RatioVal, Result)
    end;
gen_slave([{Pos,
            UnitBaseId,
            NeedNum,
            Ratio,
            {M, Fun, A}}
           | T],
          OpSideRoleNum, RatioVal, Result)
    when OpSideRoleNum >= NeedNum ->
    case util:rand(1, 100) =< Ratio of
        true ->
            case unit_convert:to(unit_base_id_to_fighter,
                                 UnitBaseId)
                of
                {ok, F} ->
                    gen_slave(T,
                              OpSideRoleNum,
                              RatioVal,
                              [erlang:apply(M,
                                            Fun,
                                            [F#fighter{pos = Pos,
                                                       ratio_val = RatioVal}
                                             | A])
                               | Result]);
                _Err ->
                    logger:error("转化随从怪[~w]出错:~w",
                                 [UnitBaseId, _Err],
                                 combat_fighter,
                                 1794),
                    gen_slave(T, OpSideRoleNum, RatioVal, Result)
            end;
        false -> gen_slave(T, OpSideRoleNum, RatioVal, Result)
    end;
gen_slave([{UnitBaseId, NeedNum, Ratio, {M, Fun, A}}
           | T],
          OpSideRoleNum, RatioVal, Result)
    when OpSideRoleNum >= NeedNum ->
    case util:rand(1, 100) =< Ratio of
        true ->
            case unit_convert:to(unit_base_id_to_fighter,
                                 UnitBaseId)
                of
                {ok, F} ->
                    gen_slave(T,
                              OpSideRoleNum,
                              RatioVal,
                              [erlang:apply(M,
                                            Fun,
                                            [F#fighter{ratio_val = RatioVal}
                                             | A])
                               | Result]);
                _Err ->
                    logger:error("转化随从怪[~w]出错:~w",
                                 [UnitBaseId, _Err],
                                 combat_fighter,
                                 1808),
                    gen_slave(T, OpSideRoleNum, RatioVal, Result)
            end;
        false -> gen_slave(T, OpSideRoleNum, RatioVal, Result)
    end;
gen_slave([{Pos, UnitBaseId, NeedNum, Ratio} | T],
          OpSideRoleNum, RatioVal, Result)
    when OpSideRoleNum >= NeedNum ->
    case util:rand(1, 100) =< Ratio of
        true ->
            case unit_convert:to(unit_base_id_to_fighter,
                                 UnitBaseId)
                of
                {ok, F} ->
                    gen_slave(T,
                              OpSideRoleNum,
                              RatioVal,
                              [F#fighter{pos = Pos, ratio_val = RatioVal}
                               | Result]);
                _Err ->
                    logger:error("转化随从怪[~w]出错:~w",
                                 [UnitBaseId, _Err],
                                 combat_fighter,
                                 1822),
                    gen_slave(T, OpSideRoleNum, RatioVal, Result)
            end;
        false -> gen_slave(T, OpSideRoleNum, RatioVal, Result)
    end;
gen_slave([_ | T], OpSideRoleNum, RatioVal, Result) ->
    gen_slave(T, OpSideRoleNum, RatioVal, Result).

mark_leader([]) -> {1, 1, []};
mark_leader([F = #fighter{} | T]) ->
    [F#fighter{is_leader = 1} | T].

make_formation(102, FighterList) ->
    NewFighterList = [F#fighter{formation = 1,
                                formation_lev = 1}
                      || F <- FighterList],
    {1, 1, NewFighterList};
make_formation(103, FighterList) ->
    WarriorMode = get_combat_mode(103),
    case WarriorMode of
        4 ->
            NewFighterList = [F#fighter{formation = 1,
                                        formation_lev = 1}
                              || F <- FighterList],
            {1, 1, NewFighterList};
        _ -> do_make_formation(103, FighterList)
    end;
make_formation(CombatType, FighterList) ->
    do_make_formation(CombatType, FighterList).

do_make_formation(CombatType, FighterList) ->
    case lists:keyfind(1, #fighter.is_leader, FighterList)
        of
        #fighter{type = Type, formation = ForMationId,
                 formation_lev = ForMationLev,
                 active_guard = ActiveGuard}
            when Type =:= 1 orelse Type =:= 4 ->
            Len1 = calc_guard_num(ActiveGuard),
            Len2 = length(FighterList),
            Len3 = length(ActiveGuard),
            {GfmId, GfmLev} = case Len1 + Len2 >= 5 of
                                  true -> {ForMationId, ForMationLev};
                                  false
                                      when CombatType == 58 andalso
                                               Len2 + Len3 >= 5 ->
                                      {ForMationId, ForMationLev};
                                  false -> {1, 1}
                              end,
            NewFighterList = [F#fighter{formation = GfmId,
                                        formation_lev = GfmLev}
                              || F <- FighterList],
            {GfmId, GfmLev, NewFighterList};
        #fighter{formation = ForMationId,
                 formation_lev = ForMationLev} ->
            NewFighterList = [F#fighter{formation = ForMationId,
                                        formation_lev = ForMationLev}
                              || F <- FighterList],
            {ForMationId, ForMationLev, NewFighterList};
        _Err ->
            logger:error("战斗无法找到领队:~w",
                         [_Err],
                         combat_fighter,
                         1873),
            NewFighterList = [F#fighter{formation = 1,
                                        formation_lev = 1}
                              || F <- FighterList],
            {1, 1, NewFighterList}
    end.

calc_guard_num(ActiveGuard) ->
    calc_guard_num(ActiveGuard, 0).

calc_guard_num([], Num) -> Num;
calc_guard_num([#c_guard{war_id = WarId} | T], Num)
    when WarId =/= 0 ->
    calc_guard_num(T, Num + 1);
calc_guard_num([{#c_guard{}, _} | T], Num) ->
    calc_guard_num(T, Num + 1);
calc_guard_num([_ | T], Num) -> calc_guard_num(T, Num).

count_num(FighterList, CombatType) ->
    count_num(FighterList, CombatType, 0).

count_num([], _, FighterNum) -> FighterNum;
count_num([#fighter{type = 1, is_leader = 1,
                    active_guard = ActiveGuards}
           | T],
          CombatType, FighterNum) ->
    GuardNum = case CombatType of
                   49 -> 0;
                   _ -> length(ActiveGuards)
               end,
    count_num(T, CombatType, FighterNum + 1 + GuardNum);
count_num([#fighter{type = 1} | T], CombatType,
          FighterNum) ->
    count_num(T, CombatType, FighterNum + 1);
count_num([_ | T], CombatType, FighterNum) ->
    count_num(T, CombatType, FighterNum).

ghost_and_revive_check(_Observers) ->
    KillSelfData = case
                       combat_cache:get_context_elem([#combat_context.kill_by_self_list])
                       of
                       [KillBySelf = [_ | _]] ->
                           Fun1 = fun ({Kgroup, Fid, Round},
                                       {NeedDie, LastKillBySelf}) ->
                                          NewRound = max(Round - 1, 0),
                                          NewK = {Kgroup, Fid, NewRound},
                                          case NewRound =< 0 of
                                              true ->
                                                  {[NewK | NeedDie],
                                                   LastKillBySelf};
                                              false ->
                                                  {NeedDie,
                                                   [NewK | LastKillBySelf]}
                                          end
                                  end,
                           {DoKill, LastKillBySelf2} = lists:foldl(Fun1,
                                                                   {[], []},
                                                                   KillBySelf),
                           combat_cache:save_context([{#combat_context.kill_by_self_list,
                                                       LastKillBySelf2}]),
                           kill_by_self(DoKill);
                       _ -> []
                   end,
    AvatarData = case
                     combat_cache:get_context_elem([#combat_context.avatar_list])
                     of
                     [AvatarList = [_ | _]] ->
                         Fun2 = fun ({Fid, Round}, {NeedDie, LastAvatarList}) ->
                                        NewRound = max(Round - 1, 0),
                                        NewK = {Fid, NewRound},
                                        case NewRound =< 0 of
                                            true ->
                                                {[NewK | NeedDie],
                                                 LastAvatarList};
                                            false ->
                                                {NeedDie,
                                                 [NewK | LastAvatarList]}
                                        end
                                end,
                         {DoAva, LastAvatarList2} = lists:foldl(Fun2,
                                                                {[], []},
                                                                AvatarList),
                         combat_cache:save_context([{#combat_context.avatar_list,
                                                     LastAvatarList2}]),
                         avatar_list(DoAva);
                     _ -> []
                 end,
    NirvanaData = case
                      combat_cache:get_context_elem([#combat_context.nirvana_list])
                      of
                      [NirvanaList = [_ | _]] ->
                          Fun5 = fun ({Fid, Round, HealHp, HealMp, Rate, Skill},
                                      {NeedNirvana, LastNirvana}) ->
                                         NewRound = max(Round - 1, 0),
                                         NewN = {Fid,
                                                 NewRound,
                                                 HealHp,
                                                 HealMp,
                                                 Rate,
                                                 Skill},
                                         Flag = NewRound =< 0 andalso
                                                    util:rand(1, 1000) =< Rate,
                                         case Flag of
                                             true ->
                                                 case
                                                     combat_skill:is_skill_in_cooldown(Fid,
                                                                                       Skill)
                                                     of
                                                     false ->
                                                         combat_skill:add_skill_cooldown(Fid,
                                                                                         Skill),
                                                         {[NewN | NeedNirvana],
                                                          LastNirvana};
                                                     true ->
                                                         {NeedNirvana,
                                                          [NewN | LastNirvana]}
                                                 end;
                                             false ->
                                                 {NeedNirvana,
                                                  [NewN | LastNirvana]}
                                         end
                                 end,
                          {DoNirvana, NirvanaList2} = lists:foldl(Fun5,
                                                                  {[], []},
                                                                  NirvanaList),
                          combat_cache:save_context([{#combat_context.nirvana_list,
                                                      NirvanaList2}]),
                          nirvana_list(DoNirvana);
                      _ -> []
                  end,
    GhostData = case
                    combat_cache:get_context_elem([#combat_context.ghost_list])
                    of
                    [GhostList = [_ | _]] ->
                        Fun3 = fun ({Fid, Round, HealHp, HealMp, Rate, Skill},
                                    {NeedGhost, LastGhost}) ->
                                       NewRound = max(Round - 1, 0),
                                       NewG = {Fid,
                                               NewRound,
                                               HealHp,
                                               HealMp,
                                               Rate,
                                               Skill},
                                       Flag = NewRound =< 0 andalso
                                                  util:rand(1, 1000) =< Rate,
                                       case Flag of
                                           true ->
                                               case
                                                   combat_skill:is_skill_in_cooldown(Fid,
                                                                                     Skill)
                                                   of
                                                   false ->
                                                       combat_skill:add_skill_cooldown(Fid,
                                                                                       Skill),
                                                       {[NewG | NeedGhost],
                                                        LastGhost};
                                                   true ->
                                                       {NeedGhost,
                                                        [NewG | LastGhost]}
                                               end;
                                           false ->
                                               {NeedGhost, [NewG | LastGhost]}
                                       end
                               end,
                        {DoGhost, GhostList2} = lists:foldl(Fun3,
                                                            {[], []},
                                                            GhostList),
                        combat_cache:save_context([{#combat_context.ghost_list,
                                                    GhostList2}]),
                        ghost_list(DoGhost);
                    _ -> []
                end,
    ReviveData = case
                     combat_cache:get_context_elem([#combat_context.revive_list])
                     of
                     [ReviveList = [_ | _]] ->
                         Fun4 = fun ({Fid, Round, HealHp, HealMp, Rate, Skill},
                                     {NeedRevive, LastRevive}) ->
                                        NewRound = max(Round - 1, 0),
                                        NewR = {Fid,
                                                NewRound,
                                                HealHp,
                                                HealMp,
                                                Rate,
                                                Skill},
                                        Rand = util:rand(1, 1000),
                                        Flag = NewRound =< 0 andalso
                                                   Rand =< Rate,
                                        case Flag of
                                            true ->
                                                case
                                                    combat_skill:is_skill_in_cooldown(Fid,
                                                                                      Skill)
                                                    of
                                                    false ->
                                                        combat_skill:add_skill_cooldown(Fid,
                                                                                        Skill),
                                                        {[NewR | NeedRevive],
                                                         LastRevive};
                                                    true ->
                                                        {NeedRevive,
                                                         [NewR | LastRevive]}
                                                end;
                                            false ->
                                                {NeedRevive,
                                                 [NewR | LastRevive]}
                                        end
                                end,
                         {DoRevive, ReviveList2} = lists:foldl(Fun4,
                                                               {[], []},
                                                               ReviveList),
                         combat_cache:save_context([{#combat_context.revive_list,
                                                     ReviveList2}]),
                         revive_list(DoRevive);
                     _ -> []
                 end,
    ChangesData = AvatarData ++
                      KillSelfData ++ GhostData ++ ReviveData ++ NirvanaData,
    put(changes_10720, ChangesData),
    combat_play:commit_play(),
    ok.

kill_by_self(KillList) -> kill_by_self(KillList, []).

kill_by_self([], Changes) -> Changes;
kill_by_self([{_, Fid, _} | T], Changes) ->
    case combat_cache:f(by_id, Fid) of
        F = #fighter{} ->
            Sc = [{2, 1, 0}],
            remove_fighter(F#fighter{is_die = 1,
                                     is_die_disappear = 1}),
            kill_by_self(T, [{Fid, Sc} | Changes]);
        _ -> kill_by_self(T, Changes)
    end.

avatar_list(KillList) -> avatar_list(KillList, []).

avatar_list([], Changes) -> Changes;
avatar_list([{Fid, _} | T], Changes) ->
    case combat_cache:f(by_id, Fid) of
        F = #fighter{} ->
            Sc = [{2, 1, 0}],
            remove_fighter(F#fighter{is_die = 1,
                                     is_die_disappear = 1}),
            avatar_list(T, [{Fid, Sc} | Changes]);
        _ -> avatar_list(T, Changes)
    end.

nirvana_list(NirvanaList) ->
    nirvana_list(NirvanaList, []).

nirvana_list([], Changes) -> Changes;
nirvana_list([{Fid,
               _NewRound,
               HealHp,
               _HealMp,
               _Ratio,
               _Skill}
              | T],
             Changes) ->
    case combat_cache:f(by_id, Fid) of
        #fighter{is_die = 0, is_escape = 0,
                 special_attr =
                     #special_attr{has_nirvana = 1, nirvaning = 1}} ->
            logger:debug("涅槃复活:~w", [Fid], combat_fighter, 2069),
            Svc = [{is_die, 0, 0},
                   {hp, 0, HealHp},
                   {nirvaning, 0, 0}],
            Sc = [{2, 0, 0}, {0, HealHp, 0}],
            combat_cache:u(Fid, Svc),
            nirvana_list(T, [{Fid, Sc} | Changes]);
        _ -> nirvana_list(T, Changes)
    end.

ghost_list(GhostList) -> ghost_list(GhostList, []).

ghost_list([], Changes) -> Changes;
ghost_list([{Fid,
             _NewRound,
             HealHp,
             _HealMp,
             _Ratio,
             _Skill}
            | T],
           Changes) ->
    case combat_cache:f(by_id, Fid) of
        Self = #fighter{is_die = 1, group = Group,
                        is_escape = 0, is_die_disappear = 0} ->
            Svc = [{is_die, 0, 0},
                   {hp, 0, HealHp},
                   {ghosting, 0, 0},
                   {is_radiance, 0, 0}],
            Sc = [{2, 0, 0}, {0, HealHp, 0}],
            combat_cache:u(Fid, Svc),
            HaloList = combat_buff:get_eff_halo(Group),
            logger:debug("======附加光环:~w",
                         [HaloList],
                         combat_fighter,
                         2090),
            HaloFun = fun ({HaloFid, Halos}) ->
                              Caster = combat_cache:f(by_id, HaloFid),
                              [combat_buff:buff_add(HaloBuff,
                                                    Caster,
                                                    Self,
                                                    false)
                               || HaloBuff <- Halos];
                          (_) -> ok
                      end,
            lists:foreach(HaloFun, HaloList),
            ghost_list(T, [{Fid, Sc} | Changes]);
        #fighter{} ->
            combat_cache:u(Fid, [{ghosting, 0, 0}]),
            ghost_list(T, Changes);
        _ -> ghost_list(T, Changes)
    end.

revive_list(ReviveList) -> revive_list(ReviveList, []).

revive_list([], Changes) -> Changes;
revive_list([{Fid,
              _NewRound,
              HealHp,
              _HealMp,
              _Ratio,
              _Skill}
             | T],
            Changes) ->
    case combat_cache:f(by_id, Fid) of
        #fighter{is_die = 1, is_escape = 0,
                 is_die_disappear = 0} ->
            Svc = [{is_die, 0, 0},
                   {hp, 0, HealHp},
                   {reviving, 0, 0}],
            Sc = [{2, 0, 0}, {0, HealHp, 0}],
            combat_cache:u(Fid, Svc),
            revive_list(T, [{Fid, Sc} | Changes]);
        #fighter{} ->
            combat_cache:u(Fid, [{reviving, 0, 0}]),
            revive_list(T, Changes);
        _ -> revive_list(T, Changes)
    end.

passive_round([], Changes) ->
    OldChanges = get(changes_10720),
    put(changes_10720, OldChanges ++ Changes),
    ok;
passive_round([Self = #fighter{id = Sid, is_die = IsDie,
                               is_escape = 0}
               | T],
              Changes) ->
    case combat_script_skill_calc:passive_activate(round,
                                                   Self,
                                                   #fighter{},
                                                   {[], [{is_die, IsDie}]})
        of
        #passive_effect{self_val_changed = [],
                        self_changed = []} ->
            passive_round(T, Changes);
        #passive_effect{self_val_changed = Svc,
                        self_changed = Sc} ->
            combat_cache:u(Sid, Svc),
            passive_round(T, [{Sid, Sc} | Changes]);
        _ -> passive_round(T, Changes)
    end;
passive_round([_ | T], Changes) ->
    passive_round(T, Changes).

all_enter([], _, _, _) -> true;
all_enter([F = #fighter{pid = Pid, name = _Name,
                        type = 1}
           | T],
          NeedExitRoleList, NeedExitNpcList,
          Combat = #combat{type = CombatType})
    when is_pid(Pid) ->
    case catch role:apply(sync,
                          Pid,
                          {combat_fighter, enter_combat, [self(), CombatType]})
        of
        {false, Reason} ->
            {false, Reason, NeedExitRoleList, NeedExitNpcList};
        true ->
            all_enter(T,
                      [F | NeedExitRoleList],
                      NeedExitNpcList,
                      Combat);
        _Err ->
            logger:error("[~ts]进入战斗失败:~w",
                         [_Name, _Err],
                         combat_fighter,
                         2153),
            {false,
             lang:get("进入战斗失败"),
             NeedExitRoleList,
             NeedExitNpcList}
    end;
all_enter([#fighter{pid = _Pid, name = _Name, type = 1}
           | _T],
          NeedExitRoleList, NeedExitNpcList, _Combat) ->
    {false,
     util:flist(lang:get("[~ts]进入战斗失败"), [_Name]),
     NeedExitRoleList,
     NeedExitNpcList};
all_enter([F = #fighter{pid = Pid, name = _Name,
                        type = 2}
           | T],
          NeedExitRoleList, NeedExitNpcList, Combat)
    when is_pid(Pid) ->
    case catch unit:combat_call(Pid, {start, self()}) of
        ok ->
            all_enter(T,
                      NeedExitRoleList,
                      [F | NeedExitNpcList],
                      Combat);
        {error, Reason} ->
            {false,
             Reason,
             NeedExitRoleList,
             [F | NeedExitNpcList]};
        {false, combat} ->
            {false,
             lang:get("进入战斗失败"),
             NeedExitRoleList,
             [F | NeedExitNpcList]};
        _Err ->
            logger:error("[~ts]进入战斗失败:~w",
                         [_Name, _Err],
                         combat_fighter,
                         2168),
            {false,
             lang:get("进入战斗失败"),
             NeedExitRoleList,
             [F | NeedExitNpcList]}
    end;
all_enter([_H | T], NeedExitRoleList, NeedExitNpcList,
          Combat) ->
    all_enter(T, NeedExitRoleList, NeedExitNpcList, Combat).

enter_combat(Role = #role{id = RoleId, pid = Pid,
                          name = Name, status = Status,
                          m_combat =
                              MC = #m_combat{pid = OldCombatPid,
                                             observe_pid = ObCombatPid},
                          s_event = Event},
             CombatPid, CombatType) ->
    case is_pid(ObCombatPid) of
        true ->
            ObCombatPid ! {observer_leave, RoleId},
            role:pack_send(Pid, 10706, {1, ""});
        false -> skip
    end,
    case Event of
        25 when CombatType =/= 40 andalso CombatType =/= 58 ->
            logger:error("~ts~w 在~w发起了~w战斗",
                         [Name, RoleId, Event, CombatType],
                         combat_fighter,
                         2185);
        24 when CombatType =/= 40 andalso CombatType =/= 58 ->
            logger:error("~ts~w 在~w发起了~w战斗",
                         [Name, RoleId, Event, CombatType],
                         combat_fighter,
                         2187);
        _ -> ok
    end,
    if is_pid(OldCombatPid) ->
           Msg = util:flist(lang:get("[~ts]已在战斗中[Type=~w]，发起战斗失败"),
                            [Name, CombatType]),
           {ok, {false, Msg}, Role};
       Status =/= 0 ->
           Msg = util:flist(lang:get("[~ts]当前状态不能发起战斗，状态=~w"),
                            [Name, Status]),
           {ok, {false, Msg}, Role};
       true ->
           Role1 = Role#role{status = 2,
                             m_combat =
                                 MC#m_combat{pid = CombatPid,
                                             observe_pid = undefined,
                                             combat_type = CombatType}},
           map:role_status_update(Role1),
           role_query:sync_cache(Role1),
           {ok, true, Role1}
    end.

enter_combat_failed(Role = #role{m_combat =
                                     MC = #m_combat{pid = CombatPid}},
                    CombatPid, _CombatType) ->
    Role1 = Role#role{status = 0,
                      m_combat =
                          MC#m_combat{pid = undefined, combat_type = 0}},
    map:role_status_update(Role1),
    {ok, Role1};
enter_combat_failed(Role, _, _) -> {ok, Role}.

get_skill_plan(#fighter{skill_plan = SkillPlan,
                        active_skills = ActiveSkills}) ->
    get_skill_plan(ActiveSkills, SkillPlan, []).

get_skill_plan(_ActiveSkills, [], NewSkillPlan) ->
    NewSkillPlan;
get_skill_plan(ActiveSkills, [{Index, SkillId} | Rest],
               NewSkillPlan) ->
    case lists:keymember(SkillId, #c_skill.id, ActiveSkills)
        of
        true ->
            get_skill_plan(ActiveSkills,
                           Rest,
                           [{Index, SkillId} | NewSkillPlan]);
        false ->
            get_skill_plan(ActiveSkills, Rest, NewSkillPlan)
    end.

wave_next_calc(#combat{result = 98, type = 43}) ->
    passive_wave(combat_cache:all(), []),
    endless_challenge_combat:next_wave_revoke_ghost(),
    endless_challenge_combat:wave_update_fighter();
wave_next_calc(#combat{result = 98, type = 60}) ->
    glory_combat:next_wave_revoke_ghost(),
    ok;
wave_next_calc(#combat{result = 98, type = 62}) ->
    spirit_treasure_combat:next_wave_revoke_ghost(),
    spirit_treasure_combat:wave_update_fighter(),
    ok;
wave_next_calc(#combat{result = 98, type = 70}) ->
    oracle_treasure_combat:next_wave_revoke_ghost(),
    oracle_treasure_combat:wave_update_fighter(),
    ok;
wave_next_calc(#combat{result = 98, type = 71}) ->
    gods_challenge_combat:next_wave_revoke_ghost(),
    ok;
wave_next_calc(_) -> ok.

passive_wave([], Changes) ->
    logger:debug("触发波数被动:~w",
                 [Changes],
                 combat_fighter,
                 2264),
    OldChanges = get(changes_10720),
    put(changes_10720, OldChanges ++ Changes),
    ok;
passive_wave([Self = #fighter{id = Sid, is_die = 0,
                              is_escape = 0}
              | T],
             Changes) ->
    case combat_script_skill_calc:passive_activate(wave,
                                                   Self,
                                                   #fighter{})
        of
        #passive_effect{self_val_changed = [],
                        self_changed = []} ->
            passive_wave(T, Changes);
        #passive_effect{self_val_changed = Svc,
                        self_changed = Sc} ->
            combat_cache:u(Sid, Svc),
            passive_wave(T, [{Sid, Sc} | Changes]);
        _ -> passive_wave(T, Changes)
    end;
passive_wave([_ | T], Changes) ->
    passive_wave(T, Changes).

get_combat_mode(103) ->
    case get(warrior_combat_mode) of
        undefined ->
            #combat_start_args{ext_args = CombatArgs} =
                get(start_args),
            WarriorMode = case lists:keyfind(warrior_combat_mode,
                                             1,
                                             CombatArgs)
                              of
                              {_, CombatMode} -> CombatMode;
                              _ -> 1
                          end,
            put(warrior_combat_mode, WarriorMode),
            WarriorMode;
        WarriorMode -> WarriorMode
    end;
get_combat_mode(_) -> 0.

treat_slave_attr(Fighter, AttrRate) ->
    Fighter#fighter{attr =
                        {combat_fighter, treat_unit_attr, [AttrRate]}}.

treat_unit_attr(Attr = #attr{hp_max = HpMax,
                             phy_dmg = PhyDmg, magic_dmg = MagicDmg,
                             atk_speed = AtkSpeed, phy_def = PhyDef,
                             magic_def = MagicDef},
                AttrArgs)
    when is_map(AttrArgs) ->
    logger:debug("随从怪属性特殊处理----> ~w",
                 [AttrArgs],
                 combat_fighter,
                 2302),
    {HpRate,
     PhyDmgRate,
     MagicDmgRate,
     PhyDefRate,
     MagicDefRate,
     SpeedRate} =
        get_treat_rate(AttrArgs),
    NewHpMax = round(HpMax * HpRate / 1000),
    NewPhyDmg = round(PhyDmg * PhyDmgRate / 1000),
    NewMagicDmg = round(MagicDmg * MagicDmgRate / 1000),
    NewPhyDef = round(PhyDef * PhyDefRate / 1000),
    NewMagicDef = round(MagicDef * MagicDefRate / 1000),
    NewAtkSpeed = round(AtkSpeed * SpeedRate / 1000),
    logger:debug("增强后的属性:~w",
                 [{NewHpMax,
                   NewPhyDmg,
                   NewMagicDmg,
                   NewAtkSpeed,
                   NewPhyDef,
                   NewMagicDef}],
                 combat_fighter,
                 2312),
    Attr#attr{hp_max = NewHpMax, phy_dmg = NewPhyDmg,
              magic_dmg = NewMagicDmg, atk_speed = NewAtkSpeed,
              phy_def = NewPhyDef, magic_def = NewMagicDef};
treat_unit_attr(Attr = #attr{hp_max = HpMax,
                             phy_dmg = PhyDmg, magic_dmg = MagicDmg,
                             atk_speed = AtkSpeed, phy_def = PhyDef,
                             magic_def = MagicDef},
                AttrRate) ->
    logger:debug("随从怪属性特殊处理----> ~w",
                 [AttrRate],
                 combat_fighter,
                 2316),
    NewHpMax = round(HpMax * AttrRate / 1000),
    NewPhyDmg = round(PhyDmg * AttrRate / 1000),
    NewMagicDmg = round(MagicDmg * AttrRate / 1000),
    NewAtkSpeed = round(AtkSpeed * AttrRate / 1000),
    NewPhyDef = round(PhyDef * AttrRate / 1000),
    NewMagicDef = round(MagicDef * AttrRate / 1000),
    logger:debug("增强后的属性:~w",
                 [{NewHpMax,
                   NewPhyDmg,
                   NewMagicDmg,
                   NewAtkSpeed,
                   NewPhyDef,
                   NewMagicDef}],
                 combat_fighter,
                 2323),
    Attr#attr{hp_max = NewHpMax, phy_dmg = NewPhyDmg,
              magic_dmg = NewMagicDmg, atk_speed = NewAtkSpeed,
              phy_def = NewPhyDef, magic_def = NewMagicDef}.

get_treat_rate(Args) ->
    HpRate = case Args of
                 #{hp := _HpRate} -> _HpRate;
                 _ -> 1000
             end,
    PhyDmgRate = case Args of
                     #{phy_dmg := _PhyDmgRate} -> _PhyDmgRate;
                     _ -> 1000
                 end,
    MagicDmgRate = case Args of
                       #{magic_dmg := _MagicDmgRate} -> _MagicDmgRate;
                       _ -> 1000
                   end,
    PhyDefRate = case Args of
                     #{phy_def := _PhyDefRate} -> _PhyDefRate;
                     _ -> 1000
                 end,
    MagicDefRate = case Args of
                       #{magic_def := _MagicDefRate} -> _MagicDefRate;
                       _ -> 1000
                   end,
    SpeedRate = case Args of
                    #{speed := _SpeedRate} -> _SpeedRate;
                    _ -> 1000
                end,
    {HpRate,
     PhyDmgRate,
     MagicDmgRate,
     PhyDefRate,
     MagicDefRate,
     SpeedRate}.

calc_mp_ratio(#fighter{cost_mp_ratio = MpRatio},
              PassiveSkills) ->
    case combat_cache:f(by_script_id, PassiveSkills, 60020)
        of
        #c_skill{} -> MpRatio + 200;
        _ -> MpRatio
    end.

