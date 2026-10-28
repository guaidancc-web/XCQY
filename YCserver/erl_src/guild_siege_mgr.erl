-file("src/mod/guild_siege/guild_siege_mgr.erl", 1).

-module(guild_siege_mgr).

-behaviour(gen_server).

-export([start_link/0, call/1, cast/1, info/1]).

-export([init/1,
         handle_call/3,
         handle_cast/2,
         handle_info/2,
         terminate/2,
         code_change/3]).

-export([insert_role/1,
         lookup_match/1,
         lookup_match/2,
         lookup_match_guild/1,
         lookup_role/1,
         lookup_role_log/1,
         match_result/2,
         get_match/1,
         get_result/1,
         get_castle/3,
         get_guild_log/2,
         get_self_setting/1,
         get_role_log/1,
         send_result_mail/2,
         watch_combat/3]).

-record(state, {init = 0}).

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

-file("src/mod/guild_siege/guild_siege_mgr.erl", 42).

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

-file("src/mod/guild_siege/guild_siege_mgr.erl", 43).

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

-file("src/mod/guild_siege/guild_siege_mgr.erl", 44).

-file("inc/guild_siege.hrl", 1).

-record(guild_siege_match,
        {ver = 1,
         round = 1,
         match_id = 1,
         lev_group = 0,
         guild_ids = [],
         guild_match_list = [],
         has_result = 0,
         win_guild_id = {0, "", 0}}).

-record(guild_siege_match_guild,
        {ver = 1,
         guild_id = {0, "", 0},
         guild_name = "",
         guild_lev = 0,
         round = 1,
         match_id = 1,
         score = 0,
         score_time = 0,
         score_log = [],
         win_star_3 = 0,
         win_star_2 = 0,
         win_star_1 = 0,
         atk_times = 0,
         win_times = 0,
         castle_num = 0,
         best_atk_id = {0, "", 0},
         best_atk_name = "",
         best_atk_data = {0, 0, 0},
         best_atk_combat_replay = {0, "", 0},
         best_def_id = {0, "", 0},
         best_def_name = "",
         best_def_data = {0, 0},
         best_def_combat_replay = {0, "", 0},
         castle_list = [],
         logs = []}).

-record(guild_siege_match_combat_log,
        {ver = 2,
         time = 0,
         star = 1,
         guild_id_1 = {0, "", 0},
         guild_name_1 = "",
         role_id_1 = {0, "", 0},
         role_name_1 = "",
         role_order_1 = 1,
         guild_id_2 = {0, "", 0},
         guild_name_2 = "",
         role_id_2 = {0, "", 0},
         role_name_2 = "",
         role_order_2 = 1,
         is_win = 0,
         combat_replay_id = {0, "", 0},
         role_lev_1 = 0,
         role_lev_2 = 0}).

-record(guild_siege_castle,
        {ver = 1,
         id = {0, "", 0},
         order = 0,
         castle_type = 0,
         name = "",
         lev = 0,
         lev_break_times = 0,
         sex = 0,
         classes = 0,
         loss_star = 0,
         def_win_times = 0,
         def_win_min_order = 0,
         def_times = 0,
         atk_times = 0,
         atk_win_times = 0,
         castle_log = [],
         can_look = 0,
         formation = 1,
         formation_lev = 1,
         guards = [],
         is_combat = 0,
         combat_pid,
         combat_id = {0, "", 0},
         combat_name = ""}).

-record(guild_siege_role,
        {ver = 1,
         id = {0, "", 0},
         name = "",
         lev = 0,
         lev_break_times = 0,
         sex = 0,
         classes = 0,
         formation = 1,
         formation_lev = 1,
         guards = [],
         first_pet = 0,
         first_pet_base_id = 0,
         robot_role}).

-record(guild_siege_role_log,
        {ver = 1,
         id = {0, "", 0},
         name = "",
         atk_num = 0,
         atk_log = []}).

-record(guild_siege_guild_rank,
        {ver = 2,
         guild_id = {0, "", 0},
         score = 0,
         logs = [],
         win_times = 0,
         all_times = 0,
         last_guild_id = {0, "", 0},
         punish_time = 0}).

-file("src/mod/guild_siege/guild_siege_mgr.erl", 45).

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

-file("src/mod/guild_siege/guild_siege_mgr.erl", 46).

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

-file("src/mod/guild_siege/guild_siege_mgr.erl", 47).

-file("inc/assets.hrl", 1).

-record(assets,
        {ver = 41 :: pos_integer(),
         exp = 0 :: non_neg_integer(),
         coin = 0 :: non_neg_integer(),
         coin_bind = 0 :: non_neg_integer(),
         gold = 0 :: non_neg_integer(),
         gold_bind = 0 :: non_neg_integer(),
         intelligs = 0 :: non_neg_integer(),
         guild = 0 :: non_neg_integer(),
         energy = 0 :: non_neg_integer(),
         satiety = 300 :: non_neg_integer(),
         stars_score = 0 :: non_neg_integer(),
         reserve_exp = 0 :: non_neg_integer(),
         character = 0 :: non_neg_integer(),
         alchemy = 0 :: non_neg_integer(),
         love = 0 :: non_neg_integer(),
         teacher_score = 0 :: non_neg_integer(),
         tournament = 0 :: non_neg_integer(),
         lottery_luck = 0 :: non_neg_integer(),
         endless_challenge = 0 :: non_neg_integer(),
         handbook_point = 0 :: non_neg_integer(),
         autumn_score = 0 :: non_neg_integer(),
         star_gold = 0 :: non_neg_integer(),
         halloween = 0 :: non_neg_integer(),
         thanksgiving = 0 :: non_neg_integer(),
         new_year = 0 :: non_neg_integer(),
         firecracker = 0 :: non_neg_integer(),
         glue_pudding = 0 :: non_neg_integer(),
         crystal = 0 :: non_neg_integer(),
         ticket = 0 :: non_neg_integer(),
         brother = 0 :: non_neg_integer(),
         egg = 0 :: non_neg_integer(),
         exchange = 0 :: non_neg_integer(),
         turn = 0 :: non_neg_integer(),
         father = 0 :: non_neg_integer(),
         lucky_ticket = 0 :: non_neg_integer(),
         dollar = 0 :: non_neg_integer(),
         naughty = 0 :: non_neg_integer(),
         concentric = 0 :: non_neg_integer(),
         qixiIntegral = 0 :: non_neg_integer(),
         sunshine = 0 :: non_neg_integer(),
         cut_price = 0 :: non_neg_integer(),
         single_dog = 0 :: non_neg_integer(),
         panda_score = 0 :: non_neg_integer(),
         joyful_egg = 0 :: non_neg_integer(),
         godswar = 0 :: non_neg_integer(),
         skl_unique_exp = 0 :: non_neg_integer(),
         happy_score = 0 :: non_neg_integer(),
         slot_machine = 0 :: non_neg_integer(),
         reserve_gold = 0 :: non_neg_integer(),
         zillionaire_sc = 0,
         score_exchange = 0 :: non_neg_integer(),
         new_open_turn = 0 :: non_neg_integer(),
         long_active = 0 :: non_neg_integer(),
         long_score = 0 :: non_neg_integer(),
         camp_pray_sc = 0 :: non_neg_integer()}).

-file("src/mod/guild_siege/guild_siege_mgr.erl", 48).

start_link() ->
    gen_server:start_link({local, guild_siege_mgr},
                          guild_siege_mgr,
                          [],
                          []).

call(Msg) ->
    case catch gen_server:call(guild_siege_mgr, Msg, 10000)
        of
        {'EXIT', {timeout, _}} -> {error, timeout};
        {'EXIT', {noproc, _}} -> {error, noproc};
        {'EXIT', {normal, _}} -> {error, exit};
        {'EXIT', _Call_Err} -> {error, _Call_Err};
        _Call_Return -> _Call_Return
    end.

cast(Msg) -> gen_server:cast(guild_siege_mgr, Msg).

info(Msg) -> guild_siege_mgr ! Msg.

match_result(MatchList, NotMatchList) ->
    cast({match_result, MatchList, NotMatchList}).

get_match(Role = #role{m_guild =
                           #m_guild{id = GuildId}}) ->
    case guild_siege:check_role(Role, [lev, guild]) of
        true ->
            case lookup_match(by_guild_id, GuildId) of
                {true, SiegeMatch} -> {true, SiegeMatch};
                _ -> {false, lang:get("公会当前没有参加公会攻城战")}
            end;
        {false, Reason} -> {false, Reason}
    end;
get_match(_) -> {false, lang:get("当前没有公会")}.

get_guild_log(Role = #role{m_guild =
                               #m_guild{id = GuildId}},
              Flag) ->
    case guild_siege:check_role(Role, [lev, guild]) of
        true ->
            Result = case Flag of
                         1 -> lookup_match_guild_log(GuildId);
                         2 -> lookup_match_guild_log(other, GuildId)
                     end,
            case Result of
                {true, Logs} -> {true, Logs};
                _ -> {false, lang:get("找不到日志")}
            end;
        {false, Reason} -> {false, Reason}
    end;
get_guild_log(_, _) -> {false, lang:get("没有公会无法参与")}.

watch_combat(#role{m_combat = #m_combat{pid = Pid}}, _,
             _)
    when is_pid(Pid) ->
    {false, lang:get("正在战斗中不能观战")};
watch_combat(Role = #role{m_guild =
                              #m_guild{id = GuildId},
                          id = RoleId},
             Flag, Order) ->
    case guild_siege:check_role(Role,
                                [lev, guild, watch_combat])
        of
        true ->
            Result = case Flag of
                         1 -> lookup_match_guild(GuildId);
                         2 -> lookup_match_guild(other, GuildId)
                     end,
            case Result of
                {true,
                 #guild_siege_match_guild{castle_list = CastleList}} ->
                    case lists:keyfind(Order,
                                       #guild_siege_castle.order,
                                       CastleList)
                        of
                        #guild_siege_castle{id = OtherId, is_combat = 1,
                                            combat_pid = CombatPid,
                                            combat_id = CombatId}
                            when is_pid(CombatPid) andalso
                                     OtherId =/= RoleId andalso
                                         CombatId =/= RoleId ->
                            {ok, Ob} = role_convert:to(c_observer, Role),
                            WatchArgs = #{watch_id => CombatId},
                            CombatPid ! {observer_enter, Ob, WatchArgs},
                            combat_util:member_enter_ob(Role,
                                                        CombatPid,
                                                        OtherId),
                            {true, ""};
                        _ -> {false, lang:get("战斗已经结束")}
                    end;
                _ -> {false, lang:get("对方公会没有参战")}
            end;
        {false, Reason} -> {false, Reason}
    end;
watch_combat(_, _, _) -> {false, lang:get("活动已经结束")}.

get_self_setting(Role = #role{id = RoleId}) ->
    case guild_siege:check_role(Role,
                                [lev, guild, open_table])
        of
        true ->
            case guild_siege_mgr:lookup_role(RoleId) of
                {true,
                 #guild_siege_role{formation = Form,
                                   formation_lev = FormLev, guards = Guards,
                                   first_pet_base_id = PetBaseId}} ->
                    {true, Form, FormLev, PetBaseId, Guards};
                _ -> {false, lang:get("当前没有堡垒")}
            end;
        {false, Reason} -> {false, Reason}
    end.

get_role_log(Role = #role{id = RoleId, name = RoleName,
                          m_guild = #m_guild{id = GuildId}}) ->
    HasJoin = case catch
                       ets:lookup_element(guild_siege_match_guild,
                                          GuildId,
                                          #guild_siege_match_guild.match_id)
                  of
                  MatchId when is_integer(MatchId) -> 1;
                  _ -> 0
              end,
    {Flag, Reason1} = case guild_siege:check_role(Role,
                                                  [lev, guild])
                          of
                          true -> {1, ""};
                          {false, Reason} -> {0, Reason}
                      end,
    case lookup_role_log(RoleId) of
        {true, Log} -> {true, {HasJoin, Flag, Reason1, Log}};
        null ->
            {true,
             {HasJoin,
              Flag,
              Reason1,
              #guild_siege_role_log{id = RoleId, name = RoleName}}};
        _ ->
            {true,
             {0,
              Flag,
              Reason1,
              #guild_siege_role_log{id = RoleId, name = RoleName}}}
    end;
get_role_log(#role{id = RoleId, name = RoleName}) ->
    {true,
     {0,
      #guild_siege_role_log{id = RoleId, name = RoleName}}}.

get_castle(Role = #role{m_guild =
                            #m_guild{id = GuildId}},
           Flag, Order) ->
    case guild_siege:check_role(Role, [lev, guild]) of
        true ->
            Result = case Flag of
                         1 -> lookup_match_guild(GuildId);
                         2 -> lookup_match_guild(other, GuildId)
                     end,
            case Result of
                {true,
                 #guild_siege_match_guild{castle_list = CastleList}} ->
                    case lists:keyfind(Order,
                                       #guild_siege_castle.order,
                                       CastleList)
                        of
                        Castle = #guild_siege_castle{can_look = CanLook} ->
                            NewCastle = case Flag of
                                            1 -> Castle;
                                            _ ->
                                                case CanLook of
                                                    0 ->
                                                        Castle#guild_siege_castle{formation
                                                                                      =
                                                                                      1,
                                                                                  formation_lev
                                                                                      =
                                                                                      1,
                                                                                  guards
                                                                                      =
                                                                                      []};
                                                    _ -> Castle
                                                end
                                        end,
                            {true, NewCastle};
                        _ -> {false, lang:get("对方没有城堡")}
                    end;
                _ -> {false, lang:get("对方公会没有参战")}
            end;
        {false, Reason} -> {false, Reason}
    end;
get_castle(_, _, _) -> {false, lang:get("你没有公会")}.

lookup_match(MatchId) ->
    case catch ets:lookup(guild_siege_match, MatchId) of
        [SiegeMatch = #guild_siege_match{}] ->
            {true, SiegeMatch};
        [] -> null;
        _Err ->
            logger:error("无法查询到匹配:~w",
                         [_Err],
                         guild_siege_mgr,
                         218),
            false
    end.

get_result(GuildId) ->
    case catch ets:lookup_element(guild_siege_match_guild,
                                  GuildId,
                                  #guild_siege_match_guild.match_id)
        of
        MatchId when is_integer(MatchId) ->
            case catch ets:lookup_element(guild_siege_match,
                                          MatchId,
                                          #guild_siege_match.has_result)
                of
                HasResult when is_integer(HasResult) ->
                    case HasResult of
                        0 -> {true, MatchId};
                        _ -> match_over
                    end;
                _ -> false
            end;
        _ -> false
    end.

lookup_match(by_guild_id, GuildId) ->
    case catch ets:lookup_element(guild_siege_match_guild,
                                  GuildId,
                                  #guild_siege_match_guild.match_id)
        of
        MatchId when is_integer(MatchId) ->
            lookup_match(MatchId);
        _ -> false
    end.

lookup_match_guild(GuildId) ->
    case catch ets:lookup(guild_siege_match_guild, GuildId)
        of
        [Guild = #guild_siege_match_guild{}] -> {true, Guild};
        [] -> null;
        _Err ->
            logger:error("无法查询到公会数据:~w",
                         [_Err],
                         guild_siege_mgr,
                         256),
            false
    end.

lookup_match_guild(other, GuildId) ->
    case get_other_guild(GuildId) of
        {true, OtherGuildId} ->
            lookup_match_guild(OtherGuildId);
        false -> false
    end.

lookup_match_guild_log(GuildId) ->
    case catch ets:lookup_element(guild_siege_match_guild,
                                  GuildId,
                                  #guild_siege_match_guild.logs)
        of
        Logs when is_list(Logs) -> {true, Logs};
        _Err -> false
    end.

lookup_match_guild_log(other, GuildId) ->
    case get_other_guild(GuildId) of
        {true, OtherGuildId} ->
            lookup_match_guild_log(OtherGuildId);
        false -> false
    end.

get_other_guild(GuildId) ->
    case catch ets:lookup_element(guild_siege_match_guild,
                                  GuildId,
                                  #guild_siege_match_guild.match_id)
        of
        MatchId when is_integer(MatchId) ->
            case catch ets:lookup_element(guild_siege_match,
                                          MatchId,
                                          #guild_siege_match.guild_ids)
                of
                [OtherGuildId, GuildId] -> {true, OtherGuildId};
                [GuildId, OtherGuildId] -> {true, OtherGuildId};
                _ ->
                    logger:error("找不到公会ID列表:~w,~w",
                                 [MatchId, GuildId],
                                 guild_siege_mgr,
                                 296),
                    false
            end;
        _ ->
            logger:error("找不到公会的匹配ID:~w",
                         [GuildId],
                         guild_siege_mgr,
                         300),
            false
    end.

lookup_role(RoleId) ->
    case catch ets:lookup(guild_siege_role, RoleId) of
        [SiegeRole = #guild_siege_role{}] -> {true, SiegeRole};
        [] -> false;
        _Err ->
            logger:error("无法查询到角色的战斗数据:~w",
                         [_Err],
                         guild_siege_mgr,
                         310),
            false
    end.

lookup_role_log(RoleId) ->
    case catch ets:lookup(guild_siege_role_log, RoleId) of
        [Log = #guild_siege_role_log{}] -> {true, Log};
        [] -> null;
        _Err ->
            logger:error("无法查询到角色的攻击记录:~w",
                         [_Err],
                         guild_siege_mgr,
                         320),
            false
    end.

init([]) ->
    logger:info("[~w] 正在启动...",
                [guild_siege_mgr],
                guild_siege_mgr,
                328),
    State = #state{},
    ets:new(guild_siege_role,
            [set,
             named_table,
             public,
             {keypos, #guild_siege_role.id}]),
    dets:open_file(guild_siege_role,
                   [{file, "./dets/guild_siege_role.dets"},
                    {keypos, #guild_siege_role.id},
                    {type, set}]),
    ets:new(guild_siege_match,
            [set,
             named_table,
             public,
             {keypos, #guild_siege_match.match_id}]),
    dets:open_file(guild_siege_match,
                   [{file, "./dets/guild_siege_match.dets"},
                    {keypos, #guild_siege_match.match_id},
                    {type, set}]),
    ets:new(guild_siege_match_guild,
            [set,
             named_table,
             public,
             {keypos, #guild_siege_match_guild.guild_id}]),
    dets:open_file(guild_siege_match_guild,
                   [{file, "./dets/guild_siege_match_guild.dets"},
                    {keypos, #guild_siege_match_guild.guild_id},
                    {type, set}]),
    ets:new(guild_siege_role_log,
            [set,
             named_table,
             public,
             {keypos, #guild_siege_role_log.id}]),
    dets:open_file(guild_siege_role_log,
                   [{file, "./dets/guild_siege_role_log.dets"},
                    {keypos, #guild_siege_role_log.id},
                    {type, set}]),
    env:set(guild_siege_status, undefined),
    dets:to_ets(guild_siege_role, guild_siege_role),
    case c_guild_siege_mgr:load_data(normal) of
        [] ->
            erlang:send_after(util:rand(60, 120) * 1000,
                              self(),
                              init),
            logger:info("[~w] 启动完成",
                        [guild_siege_mgr],
                        guild_siege_mgr,
                        349),
            {ok, State};
        _Err ->
            logger:error("公会攻城战数据文件载入失败:~w",
                         [_Err],
                         guild_siege_mgr,
                         352),
            {stop, data_load_err}
    end.

handle_call(_Request, _From, State) -> {noreply, State}.

handle_cast({match_result, MatchList, NotMatchList},
            State) ->
    logger:info("收到跨服攻城战匹配结果", [], guild_siege_mgr, 362),
    match_init(MatchList),
    cast_match_result(MatchList),
    not_match(NotMatchList),
    {noreply, State};
handle_cast({init_status, {Status, EndTime, Round}},
            State) ->
    case world_lev:get_world_lev() of
        {WorldLev, _} when WorldLev >= 65 ->
            logger:info("收到初始化活动状态:[~w][~w][~w]",
                        [Status, EndTime, Round],
                        guild_siege_mgr,
                        373),
            Now = date:unixtime(),
            env:set(guild_siege_status, {Status, EndTime, Round}),
            LeftTime = max(0, EndTime - Now),
            role_group:pack_send(world,
                                 19100,
                                 {Status, LeftTime, Round});
        _ ->
            logger:info("世界等级不足，不同步攻城战数据",
                        [],
                        guild_siege_mgr,
                        379),
            skip
    end,
    {noreply, State#state{init = 1}};
handle_cast(_Event, State) ->
    logger:error("公会攻城战管理进程收到未处理的消息:~w",
                 [_Event],
                 guild_siege_mgr,
                 386),
    {noreply, State}.

handle_info(init, State = #state{init = 0}) ->
    case world_lev:get_world_lev() of
        {WorldLev, _} when WorldLev >= 65 ->
            case big_world:is_connect() of
                {true, _} ->
                    logger:info("请求跨服攻城战状态", [], guild_siege_mgr, 395),
                    big_world:cast(c_guild_siege_mgr,
                                   init_status,
                                   [env:get(platform), env:get(zone_id)]),
                    ok;
                _ -> skip
            end,
            erlang:send_after(util:rand(120, 180) * 1000,
                              self(),
                              init),
            {noreply, State};
        _ ->
            logger:info("世界等级不足，不同步攻城战数据",
                        [],
                        guild_siege_mgr,
                        404),
            {noreply, State#state{init = 1}}
    end;
handle_info(init, State) -> {noreply, State};
handle_info({status_update, {Status, EndTime, Round}},
            State) ->
    case world_lev:get_world_lev() of
        {WorldLev, _} when WorldLev >= 65 ->
            Now = date:unixtime(),
            env:set(guild_siege_status, {Status, EndTime, Round}),
            LeftTime = max(0, EndTime - Now),
            case Status of
                1 ->
                    Msg = notice:format(lang:get("~ts活动进入备战阶段，参战公会请提前做好准备"),
                                        [{string_2, 1, lang:get("公会攻城战")}]),
                    notice:cast(all, 5, Msg);
                2 ->
                    Msg =
                        notice:format(lang:get("~ts活动正式开战，摧城拔寨、向胜利进军{face_1,7}"),
                                      [{string_2, 1, lang:get("公会攻城战")}]),
                    notice:cast(all, 5, Msg);
                0 ->
                    Msg =
                        notice:format(lang:get("本次~ts正式结束，结果将在一分钟后公布，请各参赛公会耐心等待{face_1,18}"),
                                      [{string_2, 1, lang:get("公会攻城战")}]),
                    notice:cast(all, 5, Msg);
                _ -> skip
            end,
            role_group:pack_send(world,
                                 19100,
                                 {Status, LeftTime, Round});
        _ -> skip
    end,
    {noreply, State};
handle_info({cast_submit, Round}, State) ->
    start_clean(),
    GetWorldLev = case world_lev:get_world_lev() of
                      {WorldLev, _} -> WorldLev;
                      _ -> 50
                  end,
    case GetWorldLev >= 65 of
        true ->
            GuildSiegeList = get_join_guild(),
            Len = length(GuildSiegeList),
            logger:info("收到中央服要求提交第[~w]轮攻城战公会，当前符合有[~w]公会符合,世界等级[~w]",
                        [Round, Len, GetWorldLev],
                        guild_siege_mgr,
                        447),
            case Len > 0 of
                true ->
                    big_world:cast(c_guild_siege_mgr,
                                   submit,
                                   [env:get(platform),
                                    env:get(zone_id),
                                    GuildSiegeList]),
                    {noreply, State};
                _ -> {noreply, State}
            end;
        _ ->
            logger:info("收到中央服要求提交第[~w]轮攻城战公会，当前世界等级[~w]不足",
                        [Round, GetWorldLev],
                        guild_siege_mgr,
                        456),
            {noreply, State}
    end;
handle_info(_Info, State) ->
    logger:error("公会攻城战管理进程收到未处理的消息:~w",
                 [_Info],
                 guild_siege_mgr,
                 462),
    {noreply, State}.

terminate(_Reason, _State) ->
    logger:info("[~w] 正在关闭...",
                [guild_siege_mgr],
                guild_siege_mgr,
                466),
    logger:info("[~w] 关闭完成",
                [guild_siege_mgr],
                guild_siege_mgr,
                467),
    ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

clean_match() ->
    ets:delete_all_objects(guild_siege_match),
    dets:delete_all_objects(guild_siege_match),
    ok.

clean_match_guild() ->
    ets:delete_all_objects(guild_siege_match_guild),
    dets:delete_all_objects(guild_siege_match_guild),
    ok.

start_clean() ->
    ets:delete_all_objects(guild_siege_role),
    dets:delete_all_objects(guild_siege_role),
    ets:delete_all_objects(guild_siege_role_log),
    dets:delete_all_objects(guild_siege_role_log),
    clean_match(),
    clean_match_guild(),
    ok.

insert_role(GsRole = #guild_siege_role{}) ->
    ets:insert(guild_siege_role, GsRole),
    dets:insert(guild_siege_role, GsRole),
    ok.

match_init(MatchList) ->
    [c_guild_siege_mgr:insert_match(SiegeMatch)
     || SiegeMatch = #guild_siege_match{} <- MatchList],
    ok.

cast_match_result([]) -> ok;
cast_match_result(MatchList) ->
    Fmt =
        lang:get("公会战攻城战对阵名单已经出炉，具体安排如下：\n~ts\n谁才是最强大的公会，让我们拭目以"
                 "待！{face_1, 18}"),
    Fun = fun (#guild_siege_match{guild_match_list =
                                      [#guild_siege_match_guild{guild_id =
                                                                    GuildId1,
                                                                guild_name =
                                                                    Name1},
                                       #guild_siege_match_guild{guild_id =
                                                                    GuildId2,
                                                                guild_name =
                                                                    Name2}]},
               MsgList) ->
                  Msg = notice:format(lang:get("~ts 对阵 ~ts"),
                                      [{string_2, 2, Name1},
                                       {string_2, 2, Name2}]),
                  Content1 =
                      notice:format(lang:get("公会攻城战:本公会将对阵~ts，请公会管理积极组织进攻、率领大家夺得胜利{face_1,18}"),
                                    [{string_2, 2, Name2}]),
                  Content2 =
                      notice:format(lang:get("公会攻城战:本公会将对阵~ts，请公会管理积极组织进攻、率领大家夺得胜利{face_1,18}"),
                                    [{string_2, 2, Name1}]),
                  Notice1 =
                      notice:format(lang:get("公会攻城战对阵名单出炉:本公会将对阵~ts，请公会管理积极组织进攻、率领大家夺得胜利{fa"
                                             "ce_1,18}"),
                                    [{string_2, 2, Name2}]),
                  Notice2 =
                      notice:format(lang:get("公会攻城战对阵名单出炉:本公会将对阵~ts，请公会管理积极组织进攻、率领大家夺得胜利{fa"
                                             "ce_1,18}"),
                                    [{string_2, 2, Name1}]),
                  case role_misc:is_local_role(GuildId1) of
                      true ->
                          guild_mgr:apply(async,
                                          GuildId1,
                                          {guild_common,
                                           sync_send_mail,
                                           [#{content => Content1,
                                              from_name =>
                                                  lang:get("公会战议事厅")}]}),
                          guild:notice(GuildId1, Notice1);
                      _ -> ok
                  end,
                  case role_misc:is_local_role(GuildId2) of
                      true ->
                          guild_mgr:apply(async,
                                          GuildId2,
                                          {guild_common,
                                           sync_send_mail,
                                           [#{content => Content2,
                                              from_name =>
                                                  lang:get("公会战议事厅")}]}),
                          guild:notice(GuildId2, Notice2);
                      _ -> ok
                  end,
                  [Msg | MsgList]
          end,
    MsgList = lists:foldl(Fun, [], MatchList),
    Res = string:join(MsgList, "、\n"),
    CastMsg = notice:format(Fmt, [{string_1, [Res]}]),
    notice:cast(all, 5, CastMsg),
    ok.

not_match([]) -> ok;
not_match([GuildId | T]) ->
    Title = lang:get("公会攻城战结算奖励"),
    {WinItems1, WinAssets1} = case
                                  guild_siege_data:get_guild(1)
                                  of
                                  #{assets := WinAssets, base_id := WinBaseId,
                                    num := WinNum} ->
                                      {[{WinBaseId, WinNum}], WinAssets};
                                  _ -> {[], 0}
                              end,
    Content =
        notice:format(lang:get("本次公会攻城战活动我方公会轮空，自动获得胜利，获得~ts公会资金和~ts奖励"),
                      [{string_2, 1, WinAssets1}, {item_2, WinItems1}]),
    MailContent = lang:get("本次公会攻城战活动我方公会轮空，自动获得胜利，请查收奖励"),
    guild_mgr:apply(async,
                    GuildId,
                    {guild_common,
                     sync_send_mail,
                     [#{content => Content,
                        from_name => lang:get("公会战议事厅")}]}),
    guild_mgr:apply(async,
                    GuildId,
                    {guild_siege_mgr,
                     send_result_mail,
                     [#{reward_type => 4, title => Title,
                        content => MailContent, is_not_match => 1}]}),
    guild_loot:add(GuildId, WinItems1, lang:get("公会战攻城轮空")),
    guild_common:add_assets(GuildId,
                            {not_weekly, WinAssets1}),
    guild:notice(GuildId, Content),
    not_match(T).

send_result_mail(#guild{members = Members},
                 #{reward_type := RewardType, content := Content,
                   title := Title, is_not_match := IsNotMatch}) ->
    Now = date:unixtime(),
    Fun = fun (#guild_role{id = Id, last_login = LastLogin,
                           lev = Lev, enter_time = EnterTime}) ->
                  case IsNotMatch of
                      1 ->
                          case Lev >= 65 andalso
                                   Now >= EnterTime + 86400 * 3 andalso
                                       LastLogin + 86400 * 2 >= Now
                              of
                              true ->
                                  Items = case
                                              guild_siege_data:get_base_reward(RewardType)
                                              of
                                              #{mod_id := ExpMode,
                                                exp_ratio := ExpRatio,
                                                base_reward := BaseReward} ->
                                                  RoleExp = case
                                                                levup_data:get_exp({ExpMode,
                                                                                    Lev})
                                                                of
                                                                #{exp := GetExp}
                                                                    when GetExp
                                                                             >
                                                                             0 ->
                                                                    [{90010,
                                                                      round(GetExp
                                                                                *
                                                                                ExpRatio
                                                                                /
                                                                                1000)}];
                                                                _ -> []
                                                            end,
                                                  RoleExp ++ BaseReward;
                                              _ -> []
                                          end,
                                  mail:send(Id,
                                            #{title => Title,
                                              content => Content,
                                              items => Items}),
                                  ok;
                              _ -> ok
                          end;
                      _ ->
                          case Now >= EnterTime + 86400 * 3 of
                              true ->
                                  case lookup_role_log(Id) of
                                      {true,
                                       #guild_siege_role_log{atk_num = AtkNum}}
                                          when AtkNum > 0 ->
                                          Items = case
                                                      guild_siege_data:get_base_reward(RewardType)
                                                      of
                                                      #{mod_id := ExpMode,
                                                        exp_ratio := ExpRatio,
                                                        base_reward :=
                                                            BaseReward} ->
                                                          RoleExp = case
                                                                        levup_data:get_exp({ExpMode,
                                                                                            Lev})
                                                                        of
                                                                        #{exp :=
                                                                              GetExp}
                                                                            when
                                                                              GetExp
                                                                                  >
                                                                                  0 ->
                                                                            [{90010,
                                                                              round(GetExp
                                                                                        *
                                                                                        ExpRatio
                                                                                        /
                                                                                        1000)}];
                                                                        _ -> []
                                                                    end,
                                                          RoleExp ++ BaseReward;
                                                      _ -> []
                                                  end,
                                          mail:send(Id,
                                                    #{title => Title,
                                                      content => Content,
                                                      items => Items});
                                      _ -> ok
                                  end;
                              _ -> ok
                          end,
                          ok
                  end
          end,
    [Fun(R) || R <- Members],
    ok.

get_join_guild() ->
    L = ets:tab2list(guild_list),
    get_join_guild(L, []).

get_join_guild([], GuildSiege) -> GuildSiege;
get_join_guild([G = #guild{id = GuildId} | T],
               GuildSiege) ->
    case guild_siege:convert_guild(G) of
        {true, LevGroup, MatchGuild} ->
            get_join_guild(T,
                           [{LevGroup, MatchGuild} | GuildSiege]);
        _ ->
            Msg =
                notice:format(lang:get("公会攻城战：公会里入会~ts天且大于~ts级的成员数量达到~ts，才能参与公会攻城战。公会"
                                       "目前不符合条件，请全体公会成员一起努力，让公会发展壮大起来吧！{face_1,18}"),
                              [{string_2, 1, 3},
                               {string_2, 1, 65},
                               {string_2, 1, 50}]),
            guild_mgr:apply(async,
                            GuildId,
                            {guild_common,
                             sync_send_mail,
                             [#{content => Msg,
                                from_name => lang:get("公会战议事厅")}]}),
            get_join_guild(T, GuildSiege)
    end.

