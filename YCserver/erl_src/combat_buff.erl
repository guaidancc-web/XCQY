-file("src/mod/combat/combat_buff.erl", 1).

-module(combat_buff).

-export([buff_init/1,
         init_special/1,
         buff_add/3,
         buff_add/4,
         buff_add/5,
         gen_buff_infos/1,
         buff_clear_escape/0,
         buff_eff/1,
         buff_eff_pre/1,
         buff_calc/2,
         buff_del/2,
         buff_del/3,
         halo_check/0,
         get_eff_halo/1]).

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

-file("src/mod/combat/combat_buff.erl", 28).

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

-file("src/mod/combat/combat_buff.erl", 29).

-file("inc/lev_break.hrl", 1).

-record(m_lev_break,
        {ver = 0,
         trial = 0 :: non_neg_integer(),
         done = 0 :: non_neg_integer(),
         times = 0 :: non_neg_integer(),
         attr_point = 0 :: non_neg_integer()}).

-file("src/mod/combat/combat_buff.erl", 30).

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

-file("src/mod/combat/combat_buff.erl", 31).

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

-file("src/mod/combat/combat_buff.erl", 32).

buff_init(FighterList) when is_list(FighterList) ->
    lists:foreach(fun (Self = #fighter{type = Type,
                                       group = Group}) ->
                          combat_skill:load_pre_cooldown(Self),
                          #passive_effect{buff_self_to_self = BuffSelf} =
                              combat_script_skill_calc:passive_activate(init,
                                                                        Self,
                                                                        Self),
                          logger:debug("===========:~w",
                                       [BuffSelf],
                                       combat_buff,
                                       46),
                          lists:foreach(fun (Buff) ->
                                                buff_add(Buff,
                                                         Self,
                                                         Self,
                                                         false)
                                        end,
                                        BuffSelf),
                          HaloList = get_eff_halo(Group),
                          logger:debug("======附加光环:~w",
                                       [HaloList],
                                       combat_buff,
                                       52),
                          HaloFun = fun ({Fid, Halos}) ->
                                            Caster = combat_cache:f(by_id, Fid),
                                            [buff_add(HaloBuff,
                                                      Caster,
                                                      Self,
                                                      false)
                                             || HaloBuff <- Halos];
                                        (_) -> ok
                                    end,
                          lists:foreach(HaloFun, HaloList),
                          case Type of
                              3 -> combat_pet:init_war(Self);
                              6 -> combat_child:init_war(Self);
                              _ -> skip
                          end
                  end,
                  FighterList);
buff_init(Group) ->
    All = combat_cache:all(Group),
    [CombatType] =
        combat_cache:get_context_elem([#combat_context.type]),
    lists:foreach(fun (Self = #fighter{type = Type,
                                       classes = Classes}) ->
                          combat_skill:load_pre_cooldown(Self),
                          #passive_effect{buff_self_to_self = BuffSelf} =
                              combat_script_skill_calc:passive_activate(init,
                                                                        Self,
                                                                        Self),
                          lists:foreach(fun (Buff) ->
                                                buff_add(Buff,
                                                         Self,
                                                         Self,
                                                         false)
                                        end,
                                        BuffSelf),
                          case Type of
                              1 ->
                                  Buffs =
                                      skill_script_data:get_init_buff({CombatType,
                                                                       Classes}),
                                  InitCombatBuff =
                                      combat_script_buff:convert_buff(Buffs),
                                  buff_add(InitCombatBuff, Self, Self);
                              _ -> ok
                          end,
                          HaloList = get_eff_halo(Group),
                          logger:debug("======附加光环:~w",
                                       [HaloList],
                                       combat_buff,
                                       92),
                          HaloFun = fun ({Fid, Halos}) ->
                                            Caster = combat_cache:f(by_id, Fid),
                                            [buff_add(HaloBuff,
                                                      Caster,
                                                      Self,
                                                      false)
                                             || HaloBuff <- Halos];
                                        (_) -> ok
                                    end,
                          lists:foreach(HaloFun, HaloList),
                          case Type of
                              3 -> combat_pet:init_war(Self);
                              6 -> combat_child:init_war(Self);
                              _ -> skip
                          end
                  end,
                  All).

init_special(#combat{type = 108,
                     start_args = #combat_start_args{ext_args = ExtArgs}}) ->
    case lists:keyfind(buff, 1, ExtArgs) of
        {_, Buffs} ->
            BuffSelf = combat_script_buff:convert_buff(Buffs),
            case lists:keyfind(match_pid, 1, ExtArgs) of
                {_, operating, _} ->
                    All = combat_cache:all(0),
                    lists:foreach(fun (Self = #fighter{type = _Type}) ->
                                          lists:foreach(fun (Buff) ->
                                                                buff_add(Buff,
                                                                         Self,
                                                                         Self,
                                                                         false)
                                                        end,
                                                        BuffSelf)
                                  end,
                                  All);
                {_, attacking, _} ->
                    All = combat_cache:all(1),
                    lists:foreach(fun (Self = #fighter{type = _Type}) ->
                                          lists:foreach(fun (Buff) ->
                                                                buff_add(Buff,
                                                                         Self,
                                                                         Self,
                                                                         false)
                                                        end,
                                                        BuffSelf)
                                  end,
                                  All);
                _ -> ok
            end;
        _ -> ok
    end,
    AtkL = combat_cache:all(0),
    DfdL = combat_cache:all(1),
    AavgLev = util:list_avg([Lv + 6 * Bts
                             || #fighter{lev = Lv,
                                         m_lev_break =
                                             #m_lev_break{times = Bts},
                                         type = 1}
                                    <- AtkL]),
    DavgLev = util:list_avg([Lv + 6 * Bts
                             || #fighter{lev = Lv,
                                         m_lev_break =
                                             #m_lev_break{times = Bts},
                                         type = 1}
                                    <- DfdL]),
    logger:debug("平均等级 ~w ~w",
                 [AavgLev, DavgLev],
                 combat_buff,
                 137),
    case {guild_league_guild:subsidize_buff(DavgLev -
                                                AavgLev),
          guild_league_guild:subsidize_buff(AavgLev - DavgLev)}
        of
        {[H | T], _} ->
            logger:debug("补偿buff ----> ~w",
                         [[H | T]],
                         combat_buff,
                         140),
            SBuffSelf = combat_script_buff:convert_buff([H | T]),
            lists:foreach(fun (Self = #fighter{type = _Type}) ->
                                  lists:foreach(fun (Buff) ->
                                                        buff_add(Buff,
                                                                 Self,
                                                                 Self,
                                                                 false)
                                                end,
                                                SBuffSelf)
                          end,
                          AtkL);
        {_, [H | T]} ->
            logger:debug("补偿buff ----> ~w",
                         [[H | T]],
                         combat_buff,
                         149),
            SBuffSelf = combat_script_buff:convert_buff([H | T]),
            lists:foreach(fun (Self = #fighter{type = _Type}) ->
                                  lists:foreach(fun (Buff) ->
                                                        buff_add(Buff,
                                                                 Self,
                                                                 Self,
                                                                 false)
                                                end,
                                                SBuffSelf)
                          end,
                          DfdL);
        _ -> ok
    end;
init_special(#combat{type = 116,
                     start_args = #combat_start_args{ext_args = ExtArgs}}) ->
    case lists:keyfind(buff, 1, ExtArgs) of
        {_, Buffs} ->
            BuffSelf = combat_script_buff:convert_buff(Buffs),
            case lists:keyfind(match_pid, 1, ExtArgs) of
                {_, operating, _} ->
                    All = combat_cache:all(0),
                    lists:foreach(fun (Self = #fighter{type = _Type}) ->
                                          lists:foreach(fun (Buff) ->
                                                                buff_add(Buff,
                                                                         Self,
                                                                         Self,
                                                                         false)
                                                        end,
                                                        BuffSelf)
                                  end,
                                  All);
                {_, attacking, _} ->
                    All = combat_cache:all(1),
                    lists:foreach(fun (Self = #fighter{type = _Type}) ->
                                          lists:foreach(fun (Buff) ->
                                                                buff_add(Buff,
                                                                         Self,
                                                                         Self,
                                                                         false)
                                                        end,
                                                        BuffSelf)
                                  end,
                                  All);
                _ -> ok
            end;
        _ -> ok
    end;
init_special(#combat{type = 43,
                     start_args = #combat_start_args{ext_args = ExtArgs}}) ->
    case lists:keyfind(endless_buff_args, 1, ExtArgs) of
        {_, BuffArgs} ->
            Fun = fun (Self = #fighter{type = 1,
                                       origin_id = RoleId}) ->
                          case lists:keyfind(RoleId, 1, BuffArgs) of
                              {_, Buff, _Round} ->
                                  lists:foreach(fun (AddBuff) ->
                                                        buff_add(AddBuff,
                                                                 Self,
                                                                 Self,
                                                                 false)
                                                end,
                                                Buff);
                              _ -> ok
                          end;
                      (_) -> ok
                  end,
            lists:foreach(Fun, combat_cache:all(0)),
            ok;
        _ -> ok
    end;
init_special(#combat{type = 11,
                     start_args = #combat_start_args{ext_args = ExtArgs}}) ->
    case lists:keyfind(dun_floor_args, 1, ExtArgs) of
        {_, BuffArgs} ->
            Fun = fun (Self = #fighter{type = 1,
                                       origin_id = RoleId}) ->
                          case lists:keyfind(RoleId, 1, BuffArgs) of
                              {_, Buff} ->
                                  lists:foreach(fun (AddBuff) ->
                                                        buff_add(AddBuff,
                                                                 Self,
                                                                 Self,
                                                                 false)
                                                end,
                                                Buff);
                              _ -> ok
                          end;
                      (_) -> ok
                  end,
            lists:foreach(Fun, combat_cache:all(0)),
            ok;
        _ -> ok
    end;
init_special(_) -> ok.

buff_add([], _, _) -> ok;
buff_add([Buff | Rest], Caster, Target) ->
    buff_add(Buff, Caster, Target),
    buff_add(Rest, Caster, Target);
buff_add(Buff, Caster, Target) ->
    buff_add(Buff, Caster, Target, true).

buff_add(Buff, Caster, Target, NeedPlay) ->
    buff_add(Buff,
             Caster,
             Target,
             Caster#fighter.id,
             NeedPlay).

buff_add(Buff = #c_buff{id = BuffId,
                        script_id = ScriptId, sec_type = SecBuffType,
                        eff_before = EffBefore, eff_val_before = EffValBefore,
                        duration = Duration, hit = Hit},
         #fighter{id = CasterId, base_id = BaseId, name = _Sname,
                  action_num = ActionNum, order = Sorder,
                  classes = Sclasses, type = Stype, pet_attr = PetAttr,
                  special_attr = #special_attr{control_num = ControlNum}},
         #fighter{name = _Tname, id = Tid, order = Torder,
                  type = Ttype, classes = Tclasses},
         SkillFid, NeedPlay) ->
    CacherCaster = combat_cache:f(by_id, CasterId),
    CacherTarget = #fighter{buffs = Buffs} =
                       combat_cache:f(by_id, Tid),
    {SelfTlsmEnhanceControl, TargetTlsmAntiControl} =
        combat_script_skill_calc:calc_talisman_rival(buff,
                                                     CacherCaster,
                                                     CacherTarget),
    logger:debug("法宝属性变化信息:~w",
                 [{SelfTlsmEnhanceControl, TargetTlsmAntiControl}],
                 combat_buff,
                 242),
    SelfAttr = #attr{enhance_control = SelfEnhanceControl} =
                   CacherCaster#fighter.attr,
    TargetAttr = #attr{anti_control = TargetAntiControl} =
                     CacherTarget#fighter.attr,
    Caster = CacherCaster#fighter{attr =
                                      SelfAttr#attr{enhance_control =
                                                        SelfEnhanceControl +
                                                            SelfTlsmEnhanceControl}},
    Target = CacherTarget#fighter{attr =
                                      TargetAttr#attr{anti_control =
                                                          TargetAntiControl +
                                                              TargetTlsmAntiControl}},
    IsHit = case Hit of
                undefined ->
                    combat_script_buff:default_hit(Buff, Caster, Target);
                _ -> Hit(Buff, Caster, Target)
            end,
    case IsHit of
        false ->
            ok,
            combat_play:add_buff_miss_sub_play(1,
                                               Buff,
                                               Caster,
                                               Target,
                                               SkillFid);
        true ->
            NewDuration = case Duration =:= 0 of
                              true -> 0;
                              false ->
                                  case SecBuffType of
                                      control
                                          when ScriptId =:= 251000 orelse
                                                   BuffId =:= 90249 ->
                                          Duration;
                                      anti_control
                                          when Stype =:= 3 orelse Stype =:= 6 ->
                                          AddDuration = util:rand(-1, 0),
                                          Duration + AddDuration;
                                      control ->
                                          DurationAdd1 = case
                                                             lists:member(ScriptId,
                                                                          [245000,
                                                                           236000])
                                                             of
                                                             true -> 0;
                                                             _ ->
                                                                 case (Stype =:=
                                                                           5
                                                                           orelse
                                                                           Stype
                                                                               =:=
                                                                               1)
                                                                          andalso
                                                                          (Ttype
                                                                               =:=
                                                                               5
                                                                               orelse
                                                                               Ttype
                                                                                   =:=
                                                                                   1)
                                                                              andalso
                                                                              (Tclasses
                                                                                   =:=
                                                                                   4
                                                                                   orelse
                                                                                   Tclasses
                                                                                       =:=
                                                                                       5)
                                                                     of
                                                                     true -> -1;
                                                                     false -> 0
                                                                 end
                                                         end,
                                          DurationAdd2 = case
                                                             lists:member(Stype,
                                                                          [3,
                                                                           6])
                                                             of
                                                             false
                                                                 when ScriptId
                                                                          =/=
                                                                          236000 ->
                                                                 case Sorder >
                                                                          Torder
                                                                     of
                                                                     true -> 1;
                                                                     _ -> 0
                                                                 end;
                                                             _
                                                                 when BaseId =:=
                                                                          20012
                                                                          andalso
                                                                          ScriptId
                                                                              =:=
                                                                              260000 ->
                                                                 case Sorder >
                                                                          Torder
                                                                     of
                                                                     true -> 1;
                                                                     _ -> 0
                                                                 end;
                                                             _
                                                                 when BaseId =:=
                                                                          20010
                                                                          andalso
                                                                          ScriptId
                                                                              =:=
                                                                              223002 ->
                                                                 case Sorder >
                                                                          Torder
                                                                     of
                                                                     true -> 1;
                                                                     _ -> 0
                                                                 end;
                                                             _ -> 0
                                                         end,
                                          DurationAdd3 = case Sclasses =:= 4
                                                                  andalso
                                                                  (Stype =:= 1
                                                                       orelse
                                                                       Stype =:=
                                                                           4)
                                                             of
                                                             true ->
                                                                 case ControlNum
                                                                          >= 1
                                                                     of
                                                                     true -> -1;
                                                                     false -> 0
                                                                 end;
                                                             false -> 0
                                                         end,
                                          Duration + DurationAdd1 + DurationAdd2
                                              + DurationAdd3;
                                      stealth
                                          when Stype =:= 3 andalso
                                                   ScriptId =/= 129002 ->
                                          AddDuration1 = case PetAttr of
                                                             {Pstr,
                                                              Pcon,
                                                              Pmag,
                                                              Pagi,
                                                              Pend} ->
                                                                 AllPoint = Pstr
                                                                                +
                                                                                Pcon
                                                                                +
                                                                                Pmag
                                                                                +
                                                                                Pagi
                                                                                +
                                                                                Pend,
                                                                 PconRatio =
                                                                     Pcon /
                                                                         AllPoint
                                                                         * 100,
                                                                 case PconRatio
                                                                          >= 30
                                                                     of
                                                                     true ->
                                                                         {AddDuration,
                                                                          _} =
                                                                             util:rand_list([{-2,
                                                                                              800},
                                                                                             {-1,
                                                                                              150},
                                                                                             {0,
                                                                                              50}],
                                                                                            2),
                                                                         AddDuration;
                                                                     false ->
                                                                         {AddDuration,
                                                                          _} =
                                                                             util:rand_list([{-1,
                                                                                              800},
                                                                                             {0,
                                                                                              150},
                                                                                             {1,
                                                                                              50}],
                                                                                            2),
                                                                         AddDuration
                                                                 end;
                                                             _ ->
                                                                 {AddDuration,
                                                                  _} =
                                                                     util:rand_list([{-1,
                                                                                      800},
                                                                                     {0,
                                                                                      150},
                                                                                     {1,
                                                                                      50}],
                                                                                    2),
                                                                 AddDuration
                                                         end,
                                          Duration + AddDuration1;
                                      _ -> Duration
                                  end
                          end,
            case Duration =/= 0 andalso NewDuration =< 0 of
                true ->
                    combat_play:add_buff_miss_sub_play(1,
                                                       Buff,
                                                       Caster,
                                                       Target,
                                                       SkillFid);
                false ->
                    NewBuff = Buff#c_buff{caster_id = CasterId,
                                          action_num = ActionNum,
                                          duration_left = NewDuration},
                    {Result, NewTarget, CastBuff, CastDelBuff} = case
                                                                     compare(NewBuff,
                                                                             Buffs,
                                                                             Caster,
                                                                             Target)
                                                                     of
                                                                     {true,
                                                                      NewBuffs,
                                                                      CBuff} ->
                                                                         NT =
                                                                             combat_cache:u(Target#fighter{buffs
                                                                                                               =
                                                                                                               NewBuffs}),
                                                                         {true,
                                                                          NT,
                                                                          CBuff,
                                                                          undefined};
                                                                     {true,
                                                                      NewBuffs,
                                                                      CBuff,
                                                                      DelBuff} ->
                                                                         NT =
                                                                             combat_cache:u(Target#fighter{buffs
                                                                                                               =
                                                                                                               NewBuffs}),
                                                                         {true,
                                                                          NT,
                                                                          CBuff,
                                                                          DelBuff};
                                                                     false ->
                                                                         {false,
                                                                          Target,
                                                                          NewBuff,
                                                                          undefined}
                                                                 end,
                    case Result of
                        true ->
                            ok,
                            NewTarget1 = recalc_attr(NewTarget),
                            TargetChanges = case EffBefore of
                                                undefined -> [];
                                                _ ->
                                                    EffBefore(CastBuff,
                                                              NewTarget1)
                                            end,
                            TargetValChanges = case EffValBefore of
                                                   undefined -> [];
                                                   _ ->
                                                       EffValBefore(CastBuff,
                                                                    Caster,
                                                                    NewTarget1)
                                               end,
                            combat_cache:u(Tid, TargetValChanges),
                            case SecBuffType of
                                control ->
                                    combat_stat:update_control_num(CasterId);
                                _ -> ok
                            end,
                            case NeedPlay of
                                true ->
                                    case CastDelBuff of
                                        #c_buff{} ->
                                            combat_play:add_buff_sub_play(0,
                                                                          CastDelBuff,
                                                                          Caster,
                                                                          Target,
                                                                          SkillFid,
                                                                          []);
                                        _ -> ok
                                    end,
                                    combat_play:add_buff_sub_play(1,
                                                                  CastBuff,
                                                                  Caster,
                                                                  NewTarget1,
                                                                  SkillFid,
                                                                  TargetChanges);
                                false -> ignore
                            end;
                        false -> ignore
                    end,
                    Result
            end
    end.

gen_buff_infos(F = #fighter{buffs = Buffs}) ->
    gen_buff_infos(Buffs, F, []).

gen_buff_infos([], _, BuffInfos) -> BuffInfos;
gen_buff_infos([_Buff = #c_buff{id = Id, layer = Layer,
                                caster_id = _CasterId, duration = Duration,
                                duration_left = DurationLeft,
                                can_dispel = CanDispel, tips_calc = _TipsCalc,
                                visible = 1}
                | T],
               F, BuffInfos) ->
    gen_buff_infos(T,
                   F,
                   [{Id, Layer, Duration, DurationLeft, CanDispel}
                    | BuffInfos]);
gen_buff_infos([_ | T], F, BuffInfos) ->
    gen_buff_infos(T, F, BuffInfos).

buff_clear_escape() ->
    buff_clear_escape(combat_cache:all()).

buff_clear_escape([]) -> ok;
buff_clear_escape([F = #fighter{is_escape = 1,
                                buffs = [_ | _]}
                   | T]) ->
    combat_cache:u(F#fighter{buffs = []}),
    buff_clear_escape(T);
buff_clear_escape([_ | T]) -> buff_clear_escape(T).

buff_calc(Fids, Combat) ->
    {NeedCalcFids, NeedClearFids, NeedBuffList} =
        buff_time_reduce(Fids),
    do_buff_calc(NeedCalcFids,
                 NeedClearFids,
                 NeedBuffList,
                 Combat).

do_buff_calc(NeedCalcFids, NeedClearFids, NeedBuffList,
             #combat{}) ->
    combat_play:clear_all_play(),
    lists:foreach(fun (Fid) -> buff_eff(Fid) end,
                  NeedCalcFids),
    buff_clear_expire(NeedClearFids),
    halo_check(),
    combat_play:commit_play(),
    BuffPlays = get(buff_play),
    case length(BuffPlays) > 0 orelse NeedBuffList =/= [] of
        true ->
            Data = {NeedBuffList, BuffPlays},
            put(buff_10720, Data);
        false -> put(buff_10720, {[], []})
    end,
    combat_play:clear_all_play(),
    buff_clear_escape().

buff_time_reduce(Fids) ->
    Fs = combat_util:id_to_f(Fids),
    buff_time_reduce(Fs, [], [], []).

buff_time_reduce([], NeedCalcFids, NeedClearFids,
                 NeedBuffList) ->
    {NeedCalcFids, NeedClearFids, NeedBuffList};
buff_time_reduce([F = #fighter{id = Fid, name = _Name,
                               buffs = Buffs,
                               combat_init_attr =
                                   #combat_init_attr{debuff_buff_expire_ratio =
                                                         DebuffBuffExpireArgs}}
                  | T],
                 NeedCalcFids, NeedClearFids, NeedBuffList) ->
    {Buffs1, NeedCalc, NeedClear} =
        do_buff_time_reduce(Buffs, DebuffBuffExpireArgs),
    combat_cache:u(F#fighter{buffs = Buffs1}),
    NeedCalcFids1 = case NeedCalc of
                        true -> [Fid | NeedCalcFids];
                        false -> NeedCalcFids
                    end,
    NeedClearFids1 = case NeedClear of
                         true -> [Fid | NeedClearFids];
                         false -> NeedClearFids
                     end,
    NeedBuffList1 = case NeedCalc of
                        true -> [{Fid, Buffs1} | NeedBuffList];
                        false -> NeedBuffList
                    end,
    buff_time_reduce(T,
                     NeedCalcFids1,
                     NeedClearFids1,
                     NeedBuffList1).

do_buff_time_reduce(Buffs, DebuffExpireArgs) ->
    do_buff_time_reduce(Buffs,
                        DebuffExpireArgs,
                        [],
                        false,
                        false).

do_buff_time_reduce([], _DebuffExpireArgs, NewBuffs,
                    NeedCalc, NeedClear) ->
    {NewBuffs, NeedCalc, NeedClear};
do_buff_time_reduce([Buff = #c_buff{id = _BuffId,
                                    eff_type = EffType, can_dispel = CanDispel,
                                    duration = Duration,
                                    duration_left = DurationLeft,
                                    sec_type = SecType}
                     | T],
                    {NeedDuration, DebuffRatio, ControlBuffRatio}, NewBuffs,
                    _NeedCalc, NeedClear) ->
    TimeReduce = 1,
    DL = case EffType =:= debuff andalso
                  DurationLeft =< NeedDuration andalso CanDispel =:= 1
             of
             true ->
                 case util:rand(1, 1000) =< DebuffRatio of
                     true -> 0;
                     _ ->
                         case SecType =:= control of
                             true ->
                                 case util:rand(1, 1000) =< ControlBuffRatio of
                                     true -> 0;
                                     false ->
                                         util:check_range(DurationLeft -
                                                              TimeReduce,
                                                          0,
                                                          Duration)
                                 end;
                             false ->
                                 util:check_range(DurationLeft - TimeReduce,
                                                  0,
                                                  Duration)
                         end
                 end;
             _ ->
                 util:check_range(DurationLeft - TimeReduce, 0, Duration)
         end,
    {NeedClear1, DurationLeft1} = case Duration > 0 of
                                      true ->
                                          case NeedClear of
                                              true -> {true, DL};
                                              false -> {DL =:= 0, DL}
                                          end;
                                      false -> {NeedClear, 0}
                                  end,
    do_buff_time_reduce(T,
                        {NeedDuration, DebuffRatio, ControlBuffRatio},
                        [Buff#c_buff{duration_left = DurationLeft1} | NewBuffs],
                        true,
                        NeedClear1);
do_buff_time_reduce([Buff | T], DebuffExpireArgs,
                    NewBuffs, NeedCalc, NeedClear) ->
    do_buff_time_reduce(T,
                        DebuffExpireArgs,
                        [Buff | NewBuffs],
                        NeedCalc,
                        NeedClear).

buff_eff(Id) ->
    case combat_cache:f(by_id, Id) of
        Target = #fighter{buffs = Buffs, name = _Name,
                          is_die = IsDie, is_escape = 0} ->
            Buffs1 = case IsDie of
                         1 -> [Buff || Buff = #c_buff{die_eff = 1} <- Buffs];
                         0 ->
                             lists:filter(fun (#c_buff{sec_type = round_pre,
                                                       duration = Duration,
                                                       duration_left =
                                                           DurationLeft}) ->
                                                  DurationLeft =/= Duration - 1;
                                              (_) -> true
                                          end,
                                          Buffs)
                     end,
            PreFun = fun (#c_buff{sec_type = SecType}) ->
                             SecType =:= round_pre
                     end,
            {_PreBuffList, EndBuffList} = lists:partition(PreFun,
                                                          Buffs1),
            Buffs2 = sort_buff_eff(EndBuffList, [], []),
            do_buff_eff(Buffs2, Target);
        _ -> ok
    end.

buff_eff_pre(Id) ->
    case combat_cache:f(by_id, Id) of
        Target = #fighter{buffs = Buffs, name = _Name,
                          is_die = IsDie, is_escape = 0} ->
            Buffs1 = case IsDie of
                         1 -> [Buff || Buff = #c_buff{die_eff = 1} <- Buffs];
                         0 -> Buffs
                     end,
            PreFun = fun (#c_buff{sec_type = SecType}) ->
                             SecType =:= round_pre
                     end,
            {PreBuffList, _EndBuffList} = lists:partition(PreFun,
                                                          Buffs1),
            Buffs2 = sort_buff_eff(PreBuffList, [], []),
            do_buff_eff(Buffs2, Target);
        _ -> ok
    end.

sort_buff_eff([], Buff, DeBuff) -> Buff ++ DeBuff;
sort_buff_eff([B = #c_buff{eff_type = buff} | T], Buff,
              DeBuff) ->
    sort_buff_eff(T, [B | Buff], DeBuff);
sort_buff_eff([B | T], Buff, DeBuff) ->
    sort_buff_eff(T, Buff, [B | DeBuff]).

do_buff_eff([], _) -> ok;
do_buff_eff([#c_buff{eff = undefined} | T], Target) ->
    do_buff_eff(T, Target);
do_buff_eff([#c_buff{caster_id = undefined} | T],
            Target) ->
    do_buff_eff(T, Target);
do_buff_eff([Buff = #c_buff{id = _BuffId,
                            sec_type = SecType, caster_id = CasterId, eff = Eff,
                            can_eff = CanEff, period = Period}
             | T],
            Target = #fighter{name = _Name})
    when Period > 0 ->
    case combat_cache:f_origin(by_id, CasterId) of
        false ->
            logger:error("无法找到BuffId=~w的释放者Id=[~w]",
                         [_BuffId, CasterId],
                         combat_buff,
                         562);
        Caster ->
            case CanEff =:= undefined orelse
                     CanEff(Buff, Caster, Target) =:= true
                of
                true ->
                    TargetChanges = Eff(Buff, Caster, Target),
                    case SecType of
                        round_pre ->
                            PrePlaySkill = get_round_pre_play_skill(Buff,
                                                                    Target),
                            combat_play:add_sub_play(combat_play:gen_sub_skill_play(buff_wait,
                                                                                    {#fighter{},
                                                                                     Target,
                                                                                     PrePlaySkill,
                                                                                     [],
                                                                                     TargetChanges})),
                            combat_play:add_buff_sub_play(2,
                                                          Buff,
                                                          Caster,
                                                          Target,
                                                          []);
                        _ ->
                            combat_play:add_buff_sub_play(2,
                                                          Buff,
                                                          Caster,
                                                          Target,
                                                          TargetChanges)
                    end;
                _ -> ignore
            end
    end,
    do_buff_eff(T, Target);
do_buff_eff([_ | T], Target) -> do_buff_eff(T, Target).

buff_clear_expire(Fids) -> buff_clear_expire(Fids, []).

buff_clear_expire([], NeedClearBuffFids) ->
    NeedClearBuffFids;
buff_clear_expire([Fid | T], NeedClearBuffFids) ->
    case do_buff_clear_expire(Fid) of
        true -> buff_clear_expire(T, [Fid | NeedClearBuffFids]);
        false -> buff_clear_expire(T, NeedClearBuffFids)
    end.

do_buff_clear_expire(Fid) ->
    #fighter{buffs = Buffs} = combat_cache:f(by_id, Fid),
    NeedClearBuffs = [Buff
                      || Buff = #c_buff{duration = Duration,
                                        duration_left = DurationLeft}
                             <- Buffs,
                         Duration > 0 andalso DurationLeft =< 0],
    lists:foreach(fun (Buff) -> buff_del(Fid, Buff) end,
                  NeedClearBuffs),
    length(NeedClearBuffs) > 0.

recalc_attr(F = #fighter{id = Fid}) ->
    buff_recalc_attr(F),
    combat_cache:f(by_id, Fid).

buff_recalc_attr(#fighter{id = Fid, name = _Name,
                          buffs = Buffs}) ->
    OriginF = combat_cache:f_origin(by_id, Fid),
    #fighter{attr = NewAttr, hp_max = HpMax, mp_max = MpMax,
             special_status = SpecialStatus,
             combat_dynamic_attr = CombatDynamicAttr} =
        do_buff_recalc_attr(Buffs, OriginF),
    combat_cache:u(Fid,
                   [{attr, 0, NewAttr},
                    {special_status, 0, SpecialStatus},
                    {combat_dynamic_attr, 0, CombatDynamicAttr},
                    {hp_max, 0, HpMax},
                    {mp_max, 0, MpMax}]).

do_buff_recalc_attr([], F) -> F;
do_buff_recalc_attr([#c_buff{recalc = undefined} | T],
                    F) ->
    do_buff_recalc_attr(T, F);
do_buff_recalc_attr([#c_buff{caster_id = undefined}
                     | T],
                    F) ->
    do_buff_recalc_attr(T, F);
do_buff_recalc_attr([Buff = #c_buff{id = _BuffId,
                                    caster_id = CasterId, recalc = Recalc}
                     | T],
                    F) ->
    case combat_cache:f_origin(by_id, CasterId) of
        false ->
            logger:error("无法找到BuffId=~w的释放者Id=[~w]",
                         [_BuffId, CasterId],
                         combat_buff,
                         627),
            do_buff_recalc_attr(T, F);
        Caster ->
            case Recalc(Buff, Caster, F) of
                L = [_ | _] ->
                    NF = combat_cache:do_u(F, L, calc_only),
                    do_buff_recalc_attr(T, NF);
                _ -> do_buff_recalc_attr(T, F)
            end
    end.

compare(Buff, Buffs, Caster, Target) ->
    compare(Buff, Buffs, Caster, Target, [], undefined).

compare(Buff, [], _, _, Buffs, _) ->
    {true, [Buff | Buffs], Buff};
compare(Buff = #c_buff{id = Id},
        [OldBuff = #c_buff{id = Id, layer = NowLayer} | T],
        Caster, Target, Buffs, _) ->
    case skill_script_data:get_buff(Id) of
        #c_buff_base{max_layer = 1} ->
            case compare_buff(OldBuff, Buff, Caster, Target) of
                true -> {true, Buffs ++ [Buff] ++ T, Buff};
                false -> false
            end;
        #c_buff_base{max_layer = MaxLayer} ->
            NewLayer = min(MaxLayer, NowLayer + 1),
            NewBuff = Buff#c_buff{layer = NewLayer},
            {true, Buffs ++ [NewBuff] ++ T, NewBuff}
    end;
compare(Buff = #c_buff{type = Type},
        [OldBuff = #c_buff{type = Type} | T], Caster, Target,
        Buffs, _) ->
    case compare_buff(OldBuff, Buff, Caster, Target) of
        true -> {true, Buffs ++ [Buff] ++ T, Buff, OldBuff};
        false -> false
    end;
compare(Buff, [OldBuff | T], Caster, Target, Buffs,
        AddBuff) ->
    compare(Buff,
            T,
            Caster,
            Target,
            [OldBuff | Buffs],
            AddBuff).

compare_buff(OldBuff = #c_buff{caster_id = OldCasterId,
                               compare = OldCompare},
             Buff = #c_buff{compare = Compare}, Caster, Target) ->
    case combat_cache:f_origin(by_id, OldCasterId) of
        OldCaster = #fighter{} ->
            ComparePoint = do_compare(Buff,
                                      Compare,
                                      Caster,
                                      Target),
            OldComparePoint = do_compare(OldBuff,
                                         OldCompare,
                                         OldCaster,
                                         Target),
            case ComparePoint =:= -2 andalso OldComparePoint =:= -2
                of
                true -> true;
                false -> ComparePoint > OldComparePoint
            end;
        _ -> false
    end.

do_compare(Buff, Compare, Caster, Target) ->
    case is_function(Compare) of
        true -> Compare(Buff, Caster, Target);
        false -> -1
    end.

buff_del(Tid, Buff) -> buff_del(Tid, Tid, Buff).

buff_del(Tid, SkillFid,
         Buff = #c_buff{id = BuffId, caster_id = CasterId,
                        script_id = ScriptId, eff_after = EffAfter,
                        eff_val_after = EffValAfter}) ->
    Caster = combat_cache:f_origin(by_id, CasterId),
    Target = #fighter{name = _Name, buffs = Buffs} =
                 combat_cache:f(by_id, Tid),
    NewBuffs = lists:keydelete(BuffId, #c_buff.id, Buffs),
    Target1 = Target#fighter{buffs = NewBuffs},
    combat_cache:u(Target1),
    logger:debug("[~ts]身上的buff[~w]清除了:~w",
                 [_Name, BuffId, util:get_stacktrace()],
                 combat_buff,
                 723),
    recalc_attr(Target1),
    TargetChanges = case EffAfter of
                        undefined -> [];
                        _ -> EffAfter(Buff, Target1)
                    end,
    TargetValChanges = case EffValAfter of
                           undefined -> [];
                           _ -> EffValAfter(Buff, Caster, Target1)
                       end,
    NewExtArgs = case combat_cache:f(by_id, Tid) of
                     Target = #fighter{ext_args = ExtArgs}
                         when ScriptId == 256000 ->
                         combat_cache:set_ext_val(ExtArgs, 6, 0);
                     _ -> []
                 end,
    combat_cache:u(Tid, TargetValChanges ++ NewExtArgs),
    combat_play:add_buff_sub_play(0,
                                  Buff,
                                  Caster,
                                  Target1,
                                  SkillFid,
                                  TargetChanges).

halo_check() ->
    AllFights = combat_cache:all(),
    DelHalos = do_halo_check(AllFights, []),
    case DelHalos of
        [_ | _] ->
            [begin
                 [begin
                      Target = combat_cache:f(by_id, Fid),
                      combat_play:add_sub_play(combat_play:gen_sub_skill_play(buff_wait,
                                                                              {#fighter{},
                                                                               Target,
                                                                               combat_script_skill:to_combat_skill({50101,
                                                                                                                    1}),
                                                                               [],
                                                                               []})),
                      buff_del(Fid, Halo)
                  end
                  || Halo <- Halos]
             end
             || {Fid, Halos} <- DelHalos],
            combat_play:commit_play();
        _ -> skip
    end.

do_halo_check([], HaloList) -> HaloList;
do_halo_check([F = #fighter{id = Fid, name = _Name}
               | RestF],
              HaloList) ->
    DelHalos = get_del_halos(F),
    do_halo_check(RestF, [{Fid, DelHalos} | HaloList]).

get_del_halos(#fighter{name = _Name, buffs = Buffs,
                       is_escape = 0}) ->
    lists:filter(fun (#c_buff{id = BuffId,
                              sec_type = halo_add, caster_id = CasterId}) ->
                         case combat_cache:f(by_id, CasterId) of
                             #fighter{is_die = 0, is_escape = 0,
                                      buffs = CasterBuffs} ->
                                 case lists:keyfind(halo,
                                                    #c_buff.sec_type,
                                                    CasterBuffs)
                                     of
                                     #c_buff{args = [HaloAdd | _]} ->
                                         case lists:keymember(BuffId,
                                                              1,
                                                              HaloAdd)
                                             of
                                             true -> false;
                                             _ -> true
                                         end;
                                     _ -> true
                                 end;
                             _ -> true
                         end;
                     (_) -> false
                 end,
                 Buffs);
get_del_halos(_F) -> [].

get_eff_halo(Group) ->
    AllFights = combat_cache:all(Group),
    Fun = fun (#fighter{id = Fid, buffs = Buffs,
                        is_escape = 0, is_die = IsDie, type = FType},
               Rtn) ->
                  Halos = case IsDie of
                              1 ->
                                  [{Fid,
                                    combat_script_buff:convert_buff(HaloAdd)}
                                   || #c_buff{halo_eff_fighter_type =
                                                  HaleEffType,
                                              sec_type = halo, die_eff = 1,
                                              args = [HaloAdd | _]}
                                          <- Buffs,
                                      lists:member(FType, HaleEffType)];
                              _ ->
                                  [{Fid,
                                    combat_script_buff:convert_buff(HaloAdd)}
                                   || #c_buff{halo_eff_fighter_type =
                                                  HaleEffType,
                                              sec_type = halo,
                                              args = [HaloAdd | _]}
                                          <- Buffs,
                                      lists:member(FType, HaleEffType)]
                          end,
                  Halos ++ Rtn;
              (_, Rtn) -> Rtn
          end,
    FighgterHalos = lists:foldl(Fun, [], AllFights),
    FighgterHalos.

get_round_pre_play_skill(#c_buff{id = BuffId},
                         Fighter) ->
    case BuffId of
        20004 ->
            #fighter{is_die = IsDie} = Fighter,
            case IsDie of
                1 -> combat_script_skill:to_combat_skill({20010, 1});
                _ -> combat_script_skill:to_combat_skill({50101, 1})
            end;
        _ -> combat_script_skill:to_combat_skill({50101, 1})
    end.

