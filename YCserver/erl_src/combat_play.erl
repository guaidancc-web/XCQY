-file("src/mod/combat/combat_play.erl", 1).

-module(combat_play).

-export([init/0,
         clear_all_play/0,
         has_play/0,
         commit_sub_play/0,
         commit_play/0,
         reset_play_id/0,
         gen_action_play/0,
         gen_sub_skill_play/2,
         gen_sub_summon_play/3,
         add_sub_play/1,
         add_sub_play/3,
         add_buff_sub_play/5,
         add_buff_sub_play/6,
         add_buff_miss_sub_play/5,
         calc_play_time/1,
         calc_end_time/1,
         get_order/0,
         get_sub_order/0,
         put_sub_order/1]).

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

-file("src/mod/combat/combat_play.erl", 33).

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

-file("src/mod/combat/combat_play.erl", 34).

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

-file("src/mod/combat/combat_play.erl", 35).

init() ->
    put(play_next_id, 1),
    put(sub_play_next_id, 1),
    put(move_play, []),
    put(sub_move_play, []),
    put(skill_play, []),
    put(sub_skill_play, []),
    put(buff_play, []),
    put(sub_buff_play, []),
    put(summon_play, []),
    put(sub_summon_play, []),
    ok.

get_order() -> get(play_next_id).

get_sub_order() -> get(sub_play_next_id).

put_sub_order(SubOrder) ->
    put(sub_play_next_id, SubOrder).

calc_play_time(ActionList = [_ | _]) ->
    Time = do_calc_play_time(ActionList, 0),
    [_Round] =
        combat_cache:get_context_elem([#combat_context.round]),
    logger:debug("[回合播报时间],回合:~w 动作列表:~w, 总时间:~w",
                 [_Round, ActionList, Time],
                 combat_play,
                 66),
    max(round(Time), 1500);
calc_play_time(_) -> 1500.

calc_end_time(ActionList = [_ | _]) ->
    Time = do_calc_play_time(ActionList, 0),
    max(round(Time), 1500);
calc_end_time(_) -> 1500.

do_calc_play_time([], Max) -> Max;
do_calc_play_time([{_Order, Plays} | T], Max) ->
    case Plays of
        [_ | _] ->
            Time = get_plays_time(Plays),
            do_calc_play_time(T, Max + Time);
        _ -> do_calc_play_time(T, Max)
    end.

get_plays_time(Plays) ->
    get_plays_time(Plays, 0, 0, false).

get_plays_time([], _, MaxTime, Result) ->
    case Result of
        {true, 0} -> MaxTime + 400;
        _ -> MaxTime
    end;
get_plays_time([#skill_play{sub_order = SubOrder} | T],
               SubOrder, MaxTime, Result) ->
    get_plays_time(T, SubOrder, MaxTime, Result);
get_plays_time([P = #skill_play{skill_id = _SkillId,
                                sub_order = SubOrder}
                | T],
               _, MaxTime, Result) ->
    {Time, AttackType} = get_skill_time(P),
    NewResult = case Result of
                    false -> {true, AttackType};
                    _ -> Result
                end,
    get_plays_time(T, SubOrder, MaxTime + Time, NewResult);
get_plays_time([_ | T], SubOrder, MaxTime, Result) ->
    get_plays_time(T, SubOrder, MaxTime, Result).

get_skill_time(#skill_play{skill_id = SkillId,
                           attack_type = AttackType, self_type = SelfType,
                           self_origin_id = SelfOriginId,
                           self_res_id = SelfResId}) ->
    case SkillId of
        1001 -> {300, 1};
        1002 -> {300, 1};
        1004 -> {300, 1};
        1005 -> {300, 1};
        1006 -> {800, 1};
        1007 -> {500, 1};
        1008 -> {800, 1};
        _ ->
            ResId = case SelfType of
                        1 -> 0;
                        5 -> guard_data:model(SelfOriginId);
                        3 -> SelfResId;
                        6 -> 0;
                        2 -> unit_data:model(SelfOriginId);
                        4 -> 0;
                        _ -> 0
                    end,
            Time = skill_time_data:get(SkillId, ResId),
            {Time, AttackType}
    end.

has_play() ->
    LenSkill = length(get(skill_play)),
    LenBuff = length(get(buff_play)),
    LenSummon = length(get(summon_play)),
    LenSkill + LenBuff + LenSummon > 0.

clear_all_play() ->
    put(sub_skill_play, []),
    put(skill_play, []),
    put(sub_buff_play, []),
    put(buff_play, []),
    put(sub_summon_play, []),
    put(summon_play, []),
    put(sub_play_next_id, 1),
    put(play_next_id, 1).

getAndIncreaseSubPlayId() ->
    Id = get(sub_play_next_id),
    put(sub_play_next_id, Id + 1),
    Id.

reset_play_id() ->
    put(play_next_id, 1),
    put(sub_play_next_id, 1).

commit_sub_play() ->
    LenSkill = length(get(sub_skill_play)),
    LenBuff = length(get(sub_buff_play)),
    LenSummon = length(get(sub_summon_play)),
    case LenSkill + LenBuff + LenSummon > 0 of
        true -> getAndIncreaseSubPlayId();
        false -> ignore
    end.

commit_play() ->
    Id = get(play_next_id),
    LenSkill = length(get(sub_skill_play)),
    put(skill_play, get(sub_skill_play) ++ get(skill_play)),
    put(sub_skill_play, []),
    LenBuff = length(get(sub_buff_play)),
    put(buff_play, get(sub_buff_play) ++ get(buff_play)),
    put(sub_buff_play, []),
    LenSummon = length(get(sub_summon_play)),
    put(summon_play,
        get(sub_summon_play) ++ get(summon_play)),
    put(sub_summon_play, []),
    case LenSkill + LenBuff + LenSummon > 0 of
        true -> put(play_next_id, Id + 1);
        false -> ignore
    end,
    put(sub_play_next_id, 1).

gen_action_play() ->
    SkillPlayList = format_skill_play(),
    BuffPlayList = format_buff_play(),
    SummonPlayList = format_summon_play(),
    {SkillPlayList, BuffPlayList, SummonPlayList}.

format_skill_play() ->
    format_skill_play(lists:reverse(get(skill_play)),
                      {},
                      []).

format_skill_play([], {}, Result) ->
    lists:reverse(Result);
format_skill_play([], {Lorder, Lplays}, Result) ->
    lists:reverse([{Lorder, Lplays} | Result]);
format_skill_play([Play = #skill_play{order = Order}
                   | T],
                  {}, Result) ->
    format_skill_play(T, {Order, [Play]}, Result);
format_skill_play([Play = #skill_play{order = Order}
                   | T],
                  {Order, PrevPlays}, Result) ->
    format_skill_play(T,
                      {Order, PrevPlays ++ [Play]},
                      Result);
format_skill_play([Play = #skill_play{order = Order}
                   | T],
                  {Lorder, Lplays}, Result) ->
    format_skill_play(T,
                      {Order, [Play]},
                      [{Lorder, Lplays} | Result]).

format_buff_play() -> lists:reverse(get(buff_play)).

format_summon_play() -> lists:reverse(get(summon_play)).

-spec gen_sub_skill_play(atom(),
                         tuple()) -> #skill_play{}.

gen_sub_skill_play(attack,
                   {Self,
                    Target,
                    Skill,
                    SelfChanges,
                    TargetChanges,
                    IsHit,
                    IsCrit,
                    IsSelfDie,
                    IsTargetDie}) ->
    ShowPassiveSkill = [],
    IsDefence = 0,
    gen_sub_skill_play(attack,
                       {Self,
                        Target,
                        Skill,
                        SelfChanges,
                        TargetChanges,
                        IsHit,
                        IsCrit,
                        IsSelfDie,
                        IsTargetDie,
                        ShowPassiveSkill,
                        IsDefence});
gen_sub_skill_play(attack,
                   {Self,
                    Target,
                    Skill,
                    SelfChanges,
                    TargetChanges,
                    IsHit,
                    IsCrit,
                    IsSelfDie,
                    IsTargetDie,
                    ShowPassiveSkill}) ->
    IsDefence = 0,
    gen_sub_skill_play(attack,
                       {Self,
                        Target,
                        Skill,
                        SelfChanges,
                        TargetChanges,
                        IsHit,
                        IsCrit,
                        IsSelfDie,
                        IsTargetDie,
                        ShowPassiveSkill,
                        IsDefence});
gen_sub_skill_play(special_range_attack,
                   {Self,
                    Target,
                    Skill,
                    SelfChanges,
                    TargetChanges,
                    IsHit,
                    IsCrit,
                    IsSelfDie,
                    IsTargetDie}) ->
    ShowPassiveSkill = [],
    IsDefence = 0,
    gen_sub_skill_play(special_range_attack,
                       {Self,
                        Target,
                        Skill,
                        SelfChanges,
                        TargetChanges,
                        IsHit,
                        IsCrit,
                        IsSelfDie,
                        IsTargetDie,
                        ShowPassiveSkill,
                        IsDefence});
gen_sub_skill_play(special_range_attack,
                   {Self,
                    Target,
                    Skill,
                    SelfChanges,
                    TargetChanges,
                    IsHit,
                    IsCrit,
                    IsSelfDie,
                    IsTargetDie,
                    ShowPassiveSkill}) ->
    IsDefence = 0,
    gen_sub_skill_play(special_range_attack,
                       {Self,
                        Target,
                        Skill,
                        SelfChanges,
                        TargetChanges,
                        IsHit,
                        IsCrit,
                        IsSelfDie,
                        IsTargetDie,
                        ShowPassiveSkill,
                        IsDefence});
gen_sub_skill_play(attack,
                   {#fighter{id = Sid, type = Type, origin_id = OriginId,
                             talk = Talk, is_die_disappear = IsSelfDieDisappear,
                             classes = Classes, res_id = ResId},
                    #fighter{id = Tid,
                             is_die_disappear = IsTargetDieDisappear},
                    #c_skill{id = SkillId, lev = SkillLev,
                             skill = #skill{attack_type = AttackType},
                             action_msg = ActionMsg},
                    SelfChanges,
                    TargetChanges,
                    IsHit,
                    IsCrit,
                    IsSelfDie,
                    IsTargetDie,
                    ShowPassiveSkills,
                    IsDefence}) ->
    #skill_play{action_type = 0, attack_type = AttackType,
                self_type = Type, self_classes = Classes,
                self_origin_id = OriginId, self_res_id = ResId,
                skill_id = SkillId, skill_lev = SkillLev, self_id = Sid,
                target_id = Tid, self_changes = SelfChanges,
                target_changes = TargetChanges, is_hit = IsHit,
                is_crit = IsCrit, is_defence = IsDefence,
                is_self_die = IsSelfDie,
                is_self_die_disappear = IsSelfDieDisappear,
                is_target_die = IsTargetDie,
                is_target_die_disappear = IsTargetDieDisappear,
                show_passive_skills = ShowPassiveSkills, talk = Talk,
                action_msg = ActionMsg};
gen_sub_skill_play(special_range_attack,
                   {#fighter{id = Sid, type = Type, origin_id = OriginId,
                             talk = Talk, is_die_disappear = IsSelfDieDisappear,
                             classes = Classes, res_id = ResId},
                    #fighter{id = Tid,
                             is_die_disappear = IsTargetDieDisappear},
                    #c_skill{id = SkillId, lev = SkillLev,
                             skill = #skill{attack_type = AttackType},
                             action_msg = ActionMsg},
                    SelfChanges,
                    TargetChanges,
                    IsHit,
                    IsCrit,
                    IsSelfDie,
                    IsTargetDie,
                    ShowPassiveSkills,
                    IsDefence}) ->
    #skill_play{action_type = 12, attack_type = AttackType,
                self_type = Type, self_classes = Classes,
                self_origin_id = OriginId, self_res_id = ResId,
                skill_id = SkillId, skill_lev = SkillLev, self_id = Sid,
                target_id = Tid, self_changes = SelfChanges,
                target_changes = TargetChanges, is_hit = IsHit,
                is_crit = IsCrit, is_defence = IsDefence,
                is_self_die = IsSelfDie,
                is_self_die_disappear = IsSelfDieDisappear,
                is_target_die = IsTargetDie,
                is_target_die_disappear = IsTargetDieDisappear,
                show_passive_skills = ShowPassiveSkills, talk = Talk,
                action_msg = ActionMsg};
gen_sub_skill_play(system_attack,
                   {#fighter{id = Tid,
                             is_die_disappear = IsTargetDieDisappear},
                    {SkillId, SkillLev},
                    TargetChanges,
                    ActionMsg}) ->
    #skill_play{action_type = 10, attack_type = 1,
                self_id = 0, target_id = Tid,
                target_changes = TargetChanges, skill_id = SkillId,
                skill_lev = SkillLev, is_hit = 1, is_target_die = 0,
                is_target_die_disappear = IsTargetDieDisappear,
                action_msg = ActionMsg};
gen_sub_skill_play(protect,
                   {#fighter{id = Sid,
                             is_die_disappear = IsSelfDieDisappear, type = Type,
                             origin_id = OriginId, classes = Classes,
                             res_id = ResId},
                    #fighter{id = Tid},
                    SelfChanges,
                    IsSelfDie,
                    ShowPassiveSkills}) ->
    #skill_play{action_type = 1, attack_type = 0,
                skill_id = 1003, self_type = Type,
                self_classes = Classes, self_origin_id = OriginId,
                self_res_id = ResId, self_id = Sid, target_id = Tid,
                show_passive_skills = ShowPassiveSkills,
                self_changes = SelfChanges, is_hit = 1,
                is_self_die = IsSelfDie,
                is_self_die_disappear = IsSelfDieDisappear};
gen_sub_skill_play(protect_link,
                   {#fighter{id = Sid,
                             is_die_disappear = IsSelfDieDisappear, type = Type,
                             origin_id = OriginId, classes = Classes,
                             res_id = ResId},
                    #fighter{id = Tid},
                    SelfChanges,
                    IsSelfDie,
                    ShowPassiveSkills}) ->
    #skill_play{action_type = 9, attack_type = 1,
                skill_id = 1003, self_type = Type,
                self_classes = Classes, self_origin_id = OriginId,
                self_res_id = ResId, self_id = Sid, target_id = Tid,
                show_passive_skills = ShowPassiveSkills,
                self_changes = SelfChanges, is_hit = 1,
                is_self_die = IsSelfDie,
                is_self_die_disappear = IsSelfDieDisappear};
gen_sub_skill_play(use_item,
                   {#fighter{id = Sid, type = Type, origin_id = OriginId,
                             classes = Classes, res_id = ResId},
                    #fighter{id = Tid},
                    SkillId,
                    SkillLev,
                    SelfChanges,
                    TargetChanges,
                    IsSelfDie,
                    IsTargetDie}) ->
    #skill_play{action_type = 0, attack_type = 1,
                skill_id = SkillId, skill_lev = SkillLev, self_id = Sid,
                self_type = Type, self_classes = Classes,
                self_origin_id = OriginId, self_res_id = ResId,
                target_id = Tid, self_changes = SelfChanges,
                target_changes = TargetChanges, is_self_die = IsSelfDie,
                is_target_die = IsTargetDie};
gen_sub_skill_play(die_master_effect,
                   {#fighter{id = Sid, type = Type, origin_id = OriginId,
                             classes = Classes, res_id = ResId},
                    #fighter{id = Tid},
                    TargetChanges,
                    IsSelfDie,
                    IsTargetDie,
                    ShowPassiveSkills}) ->
    #skill_play{action_type = 2, attack_type = 1,
                skill_id = 2000, skill_lev = 1, self_id = Sid,
                self_type = Type, self_classes = Classes,
                self_origin_id = OriginId, self_res_id = ResId,
                target_id = Tid, target_changes = TargetChanges,
                is_self_die = IsSelfDie, is_target_die = IsTargetDie,
                show_passive_skills = ShowPassiveSkills};
gen_sub_skill_play(wait,
                   {_Self = #fighter{id = Sid, talk = Talk, type = Type,
                                     origin_id = OriginId, classes = Classes,
                                     res_id = ResId},
                    #c_skill{id = SkillId, action_msg = ActionMsg}}) ->
    #skill_play{action_type = 2, attack_type = 1,
                skill_id = SkillId, self_id = Sid, target_id = Sid,
                talk = Talk, action_msg = ActionMsg, self_type = Type,
                self_classes = Classes, self_origin_id = OriginId,
                self_res_id = ResId};
gen_sub_skill_play(special_wait,
                   {#fighter{id = Sid, talk = Talk, type = Type,
                             origin_id = OriginId, classes = Classes,
                             res_id = ResId},
                    #fighter{id = Tid},
                    #c_skill{id = SkillId, action_msg = ActionMsg},
                    SelfChanges,
                    TargetChanges}) ->
    #skill_play{action_type = 11, attack_type = 1,
                skill_id = SkillId, self_id = Sid, target_id = Tid,
                talk = Talk, action_msg = ActionMsg, self_type = Type,
                self_classes = Classes, self_origin_id = OriginId,
                self_res_id = ResId, self_changes = SelfChanges,
                target_changes = TargetChanges};
gen_sub_skill_play(buff_wait,
                   {#fighter{id = Sid, talk = Talk, type = Type,
                             origin_id = OriginId, classes = Classes,
                             res_id = ResId},
                    #fighter{id = Tid},
                    #c_skill{id = SkillId, action_msg = ActionMsg},
                    SelfChanges,
                    TargetChanges}) ->
    #skill_play{action_type = 0, attack_type = 1,
                skill_id = SkillId, self_id = Sid, target_id = Tid,
                talk = Talk, action_msg = ActionMsg, self_type = Type,
                self_classes = Classes, self_origin_id = OriginId,
                self_res_id = ResId, self_changes = SelfChanges,
                target_changes = TargetChanges};
gen_sub_skill_play(pet_talk,
                   {_Self = #fighter{id = Sid, type = Type,
                                     origin_id = OriginId, classes = Classes,
                                     res_id = ResId},
                    TalkMsg}) ->
    #skill_play{action_type = 2, attack_type = 1,
                skill_id = 1005, self_id = Sid, target_id = Sid,
                talk = TalkMsg, self_type = Type,
                self_classes = Classes, self_origin_id = OriginId,
                self_res_id = ResId};
gen_sub_skill_play(unit_talk,
                   {_Self = #fighter{id = Sid, type = Type,
                                     origin_id = OriginId, classes = Classes,
                                     res_id = ResId},
                    TalkMsg}) ->
    #skill_play{action_type = 2, attack_type = 1,
                skill_id = 1005, self_id = Sid, target_id = Sid,
                talk = TalkMsg, self_type = Type,
                self_classes = Classes, self_origin_id = OriginId,
                self_res_id = ResId};
gen_sub_skill_play(defence,
                   {_Self = #fighter{id = Sid, talk = Talk, type = Type,
                                     origin_id = OriginId, classes = Classes,
                                     res_id = ResId},
                    #c_skill{id = SkillId, action_msg = ActionMsg}}) ->
    #skill_play{action_type = 2, attack_type = 1,
                skill_id = SkillId, self_id = Sid, target_id = Sid,
                talk = Talk, self_type = Type, self_classes = Classes,
                self_origin_id = OriginId, action_msg = ActionMsg,
                self_res_id = ResId};
gen_sub_skill_play(feedback,
                   {Self, Target, TargetChanges, IsTargetDie}) ->
    gen_sub_skill_play(feedback,
                       {Self, Target, [], TargetChanges, IsTargetDie, []});
gen_sub_skill_play(feedback,
                   {Self,
                    Target,
                    TargetChanges,
                    IsTargetDie,
                    ShowPassiveSkill}) ->
    gen_sub_skill_play(feedback,
                       {Self,
                        Target,
                        [],
                        TargetChanges,
                        IsTargetDie,
                        ShowPassiveSkill});
gen_sub_skill_play(feedback,
                   {#fighter{id = Sid, type = Type, origin_id = OriginId,
                             classes = Classes, res_id = ResId},
                    #fighter{id = Tid,
                             is_die_disappear = IsTargetDieDisappear},
                    SelfChanges,
                    TargetChanges,
                    IsTargetDie,
                    ShowPassiveSkills}) ->
    #skill_play{action_type = 4, self_type = Type,
                self_classes = Classes, self_origin_id = OriginId,
                attack_type = 0, skill_id = 1000, self_id = Sid,
                target_id = Tid, self_changes = SelfChanges,
                target_changes = TargetChanges,
                show_passive_skills = ShowPassiveSkills, is_hit = 1,
                is_target_die = IsTargetDie,
                is_target_die_disappear = IsTargetDieDisappear,
                self_res_id = ResId};
gen_sub_skill_play(anti_attack,
                   {#fighter{id = Sid, type = Type, origin_id = OriginId,
                             classes = Classes, res_id = ResId},
                    #fighter{id = Tid,
                             is_die_disappear = IsTargetDieDisappear},
                    #c_skill{id = SkillId, lev = SkillLev,
                             skill = #skill{attack_type = AttackType}},
                    TargetChanges,
                    IsTargetDie,
                    IsHit,
                    IsCrit,
                    ShowPassiveSkills}) ->
    #skill_play{action_type = 7, self_type = Type,
                self_classes = Classes, self_origin_id = OriginId,
                attack_type = AttackType, skill_id = SkillId,
                skill_lev = SkillLev, self_id = Sid, target_id = Tid,
                target_changes = TargetChanges,
                show_passive_skills = ShowPassiveSkills, is_hit = IsHit,
                is_crit = IsCrit, is_target_die = IsTargetDie,
                is_target_die_disappear = IsTargetDieDisappear,
                self_res_id = ResId};
gen_sub_skill_play(assist_attack,
                   {#fighter{id = Sid, type = Type, origin_id = OriginId,
                             classes = Classes, res_id = ResId},
                    #fighter{id = Tid,
                             is_die_disappear = IsTargetDieDisappear,
                             is_defence = IsDefence},
                    #c_skill{id = SkillId, lev = SkillLev,
                             skill = #skill{attack_type = AttackType}},
                    TargetChanges,
                    IsHit,
                    IsCrit,
                    IsTargetDie,
                    ShowPassiveSkills}) ->
    #skill_play{action_type = 0, self_type = Type,
                self_classes = Classes, self_origin_id = OriginId,
                attack_type = AttackType, skill_id = SkillId,
                skill_lev = SkillLev, self_id = Sid, target_id = Tid,
                target_changes = TargetChanges,
                show_passive_skills = ShowPassiveSkills, is_hit = IsHit,
                is_crit = IsCrit, is_target_die = IsTargetDie,
                is_target_die_disappear = IsTargetDieDisappear,
                self_res_id = ResId, is_defence = IsDefence};
gen_sub_skill_play(escape,
                   {_Self = #fighter{id = Sid, talk = Talk, type = Type,
                                     origin_id = OriginId, classes = Classes,
                                     res_id = ResId},
                    #c_skill{id = SkillId},
                    IsHit}) ->
    #skill_play{action_type = 3, attack_type = 1,
                self_type = Type, self_classes = Classes,
                self_origin_id = OriginId, skill_id = SkillId,
                self_id = Sid, target_id = Sid, talk = Talk,
                is_hit = IsHit, self_res_id = ResId};
gen_sub_skill_play(catch_pet,
                   {#fighter{id = Sid,
                             is_die_disappear = IsSelfDieDisappear, talk = Talk,
                             type = Type, origin_id = OriginId,
                             classes = Classes, res_id = ResId},
                    #fighter{id = Tid,
                             is_die_disappear = IsTargetDieDisappear},
                    #c_skill{id = SkillId, lev = SkillLev,
                             skill = #skill{attack_type = AttackType}},
                    IsHit,
                    IsTargetDie}) ->
    #skill_play{action_type = 5, attack_type = AttackType,
                talk = Talk, self_type = Type, self_classes = Classes,
                self_origin_id = OriginId, skill_id = SkillId,
                skill_lev = SkillLev, self_id = Sid, target_id = Tid,
                is_hit = IsHit,
                is_self_die_disappear = IsSelfDieDisappear,
                is_target_die = IsTargetDie,
                is_target_die_disappear = IsTargetDieDisappear,
                self_res_id = ResId};
gen_sub_skill_play(suicide,
                   {#fighter{id = Sid, is_die_disappear = IsDieDisappear,
                             talk = Talk, type = Type, origin_id = OriginId,
                             classes = Classes, res_id = ResId}}) ->
    #skill_play{action_type = 6, attack_type = 0,
                skill_id = 1007, self_type = Type,
                self_classes = Classes, self_origin_id = OriginId,
                self_id = Sid, target_id = Sid, is_self_die = 1,
                is_target_die = 1,
                is_self_die_disappear = IsDieDisappear,
                is_target_die_disappear = IsDieDisappear, talk = Talk,
                self_res_id = ResId};
gen_sub_skill_play(summon_pet,
                   {#fighter{id = Sid, is_die_disappear = IsDieDisappear,
                             type = Type, origin_id = OriginId,
                             classes = Classes, res_id = ResId},
                    ActionMsg}) ->
    #skill_play{action_type = 8, attack_type = 1,
                self_type = Type, self_classes = Classes,
                self_origin_id = OriginId, skill_id = 1008,
                self_id = Sid, target_id = Sid,
                is_self_die_disappear = IsDieDisappear,
                is_target_die_disappear = IsDieDisappear,
                self_res_id = ResId, action_msg = ActionMsg}.

gen_sub_summon_play(SummonType,
                    _Self = #fighter{id = Sid}, Summons) ->
    #summon_play{summon_type = SummonType,
                 summoner_id = Sid, summons = Summons};
gen_sub_summon_play(SummonType, Sid, Summons) ->
    #summon_play{summon_type = SummonType,
                 summoner_id = Sid, summons = Summons}.

add_sub_play(P) when is_record(P, skill_play) ->
    Order = get(play_next_id),
    SubOrder = get(sub_play_next_id),
    put(sub_skill_play,
        [P#skill_play{order = Order, sub_order = SubOrder}
         | get(sub_skill_play)]);
add_sub_play(P) when is_record(P, buff_play) ->
    Order = get(play_next_id),
    SubOrder = get(sub_play_next_id),
    NewP = P#buff_play{order = Order, sub_order = SubOrder},
    put(sub_buff_play, [NewP | get(sub_buff_play)]);
add_sub_play(P) when is_record(P, summon_play) ->
    Order = get(play_next_id),
    SubOrder = get(sub_play_next_id),
    put(sub_summon_play,
        [P#summon_play{order = Order, sub_order = SubOrder}
         | get(sub_summon_play)]).

add_sub_play(P, Order, SubOrder)
    when is_record(P, skill_play) ->
    put(sub_skill_play,
        [P#skill_play{order = Order, sub_order = SubOrder}
         | get(sub_skill_play)]);
add_sub_play(P, Order, SubOrder)
    when is_record(P, buff_play) ->
    NewP = P#buff_play{order = Order, sub_order = SubOrder},
    put(sub_buff_play, [NewP | get(sub_buff_play)]);
add_sub_play(P, Order, SubOrder)
    when is_record(P, summon_play) ->
    put(sub_summon_play,
        [P#summon_play{order = Order, sub_order = SubOrder}
         | get(sub_summon_play)]).

add_buff_sub_play(ActionType, Buff, Caster, Target,
                  TargetChanges) ->
    add_buff_sub_play(ActionType,
                      Buff,
                      Caster,
                      Target,
                      Target#fighter.id,
                      TargetChanges).

add_buff_sub_play(ActionType,
                  Buff = #c_buff{id = BuffId, layer = Layer,
                                 can_dispel = Dispel, duration = Duration,
                                 duration_left = DurationLeft,
                                 tips_calc = TipsCalc},
                  Caster, Target = #fighter{id = Tid}, SkillFid,
                  TargetChanges) ->
    TipsArgs = case TipsCalc of
                   undefined -> combat_script_buff:default_tips(Buff);
                   _ -> TipsCalc(Buff, Caster, Target)
               end,
    CasterId = case Caster of
                   #fighter{id = CasterId1} -> CasterId1;
                   _ -> 0
               end,
    BuffPlay = case TargetChanges of
                   [_ | _] ->
                       #fighter{is_die = IsTargetDie,
                                is_die_disappear = IsTargetDieDisappear} =
                           combat_cache:f(by_id, Tid),
                       #buff_play{action_type = ActionType, buff_id = BuffId,
                                  layer = Layer, duration = Duration,
                                  duration_left = DurationLeft,
                                  can_dispel = Dispel, caster_id = CasterId,
                                  target_id = Tid, skill_fid = SkillFid,
                                  tips_args = TipsArgs,
                                  target_changes = TargetChanges,
                                  is_target_die = IsTargetDie,
                                  is_target_die_disappear =
                                      IsTargetDieDisappear};
                   _ ->
                       #buff_play{action_type = ActionType, buff_id = BuffId,
                                  layer = Layer, duration = Duration,
                                  duration_left = DurationLeft,
                                  can_dispel = Dispel, caster_id = CasterId,
                                  target_id = Tid, skill_fid = SkillFid,
                                  tips_args = TipsArgs}
               end,
    add_sub_play(BuffPlay).

add_buff_miss_sub_play(ActionType,
                       Buff = #c_buff{id = BuffId, layer = Layer,
                                      can_dispel = Dispel, duration = Duration,
                                      duration_left = DurationLeft,
                                      tips_calc = TipsCalc},
                       Caster, Target = #fighter{id = Tid}, SkillFid) ->
    TipsArgs = case TipsCalc of
                   undefined -> combat_script_buff:default_tips(Buff);
                   _ -> TipsCalc(Buff, Caster, Target)
               end,
    CasterId = case Caster of
                   #fighter{id = CasterId1} -> CasterId1;
                   _ -> 0
               end,
    BuffPlay = #buff_play{action_type = ActionType,
                          buff_id = BuffId, layer = Layer, duration = Duration,
                          duration_left = DurationLeft, can_dispel = Dispel,
                          caster_id = CasterId, target_id = Tid,
                          skill_fid = SkillFid, tips_args = TipsArgs,
                          is_hit = 0},
    add_sub_play(BuffPlay).

