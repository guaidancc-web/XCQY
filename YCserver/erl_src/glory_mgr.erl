-file("src/mod/glory/glory_mgr.erl", 1).

-module(glory_mgr).

-behaviour(gen_server).

-export([init/1,
         handle_call/3,
         handle_cast/2,
         handle_info/2,
         terminate/2,
         code_change/3]).

-export([start_link/0,
         combat_result/1,
         lookup/1,
         reset/0,
         update_role/1,
         lookup_floor/1,
         cast/1,
         rank/0,
         friend_glory_role/1,
         day_five_reward/2,
         day_reward/2]).

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

-file("src/mod/glory/glory_mgr.erl", 27).

-file("inc/glory.hrl", 1).

-record(m_glory,
        {ver = 2,
         id = 0,
         title_id = 0,
         end_time = 0,
         new_id = 0,
         new_title_id = 0,
         switch_time = 0,
         max_id = 0,
         mtime = 0,
         reset_time = 0,
         last_week = 0,
         reward_list = [],
         day_reward = 0,
         lost_times = 0}).

-record(glory_role,
        {id = {0, "", 0},
         classes = 0,
         name = "",
         sex = 0,
         lev = 0,
         new_id = 0,
         max_id = 0,
         new_title_id = 0,
         mtime = 0,
         reset_time = 0,
         last_week = 0,
         update_time = 0,
         day_reward = 0}).

-record(glory_floor,
        {floor = 0,
         ver = 0,
         first = [],
         role_list = [],
         max_list = [],
         record_list = [],
         num = 0}).

-record(glory_rank_data,
        {min = 0, max = 0, reward = []}).

-record(glory_open_rank_data,
        {min = 0,
         max = 0,
         open = 0,
         reward = [],
         title = "",
         content = "",
         honor_id = 0}).

-record(glory_lev_data,
        {id = 0,
         name = "",
         title_id = 0,
         need_title_id = 0,
         need_lev = 0,
         need_fc = 0,
         fc_del = 0,
         fc_add = 0,
         lev_break = 0,
         unit_id = 0,
         all_point = 0,
         guard_num = 0,
         skill_prac = [],
         skill_prac_lev = [],
         first_reward = [],
         first_exp_mod = 0,
         normal_reward = [],
         normal_exp_mod = 0,
         day_reward = [],
         day_exp_mod = 0,
         buff_num = 0,
         buff_id = 0}).

-record(glory_title_data,
        {title_id = 0,
         next_title_id = 0,
         title_name = "",
         honor_id = 0,
         rate = 0}).

-file("src/mod/glory/glory_mgr.erl", 28).

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

-file("src/mod/glory/glory_mgr.erl", 29).

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

-file("src/mod/glory/glory_mgr.erl", 30).

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

-file("src/mod/glory/glory_mgr.erl", 31).

-file("inc/rank.hrl", 1).

-record(rank,
        {type = 1,
         show_list = [],
         list = [],
         last_val = 0,
         len = 0}).

-record(rank_rc,
        {ver = 3 :: pos_integer(),
         id = {roleid, platform, zoneid} :: term(),
         rank = 1,
         time = 0 :: non_neg_integer(),
         role_id = 0 :: non_neg_integer(),
         platform = "" :: list(),
         zone_id = 0 :: non_neg_integer(),
         name = "" :: list(),
         sex = 0 :: 0..2,
         classes = 0 :: 0..4,
         lev = 0 :: non_neg_integer(),
         val1 = 0 :: non_neg_integer(),
         val2 = 0 :: non_neg_integer(),
         val3 = 0 :: non_neg_integer(),
         val4 = 0 :: non_neg_integer(),
         desc = "",
         pet,
         guard,
         eqm}).

-record(rank_cfg,
        {type = 0 :: non_neg_integer(),
         num = 100 :: non_neg_integer(),
         keys = [#rank_rc.val3, #rank_rc.val2, #rank_rc.val1] ::
             [pos_integer()],
         min_val = 1 :: pos_integer(),
         nologin = 0 :: non_neg_integer(),
         zone = rank_zone_1 :: atom()}).

-file("src/mod/glory/glory_mgr.erl", 32).

-file("inc/pet.hrl", 1).

-record(pet_attr,
        {point = 0,
         p_str = 0,
         p_con = 0,
         p_mag = 0,
         p_agi = 0,
         p_end = 0,
         pre_str = 0,
         pre_con = 0,
         pre_mag = 0,
         pre_agi = 0,
         pre_end = 0,
         max_hp_apt_used = 0,
         max_phy_apt_used = 0,
         max_pdef_apt_used = 0,
         max_magic_apt_used = 0,
         max_aspd_apt_used = 0,
         hp_aptitude = 0,
         phy_aptitude = 0,
         pdef_aptitude = 0,
         magic_aptitude = 0,
         aspd_aptitude = 0,
         max_hp_aptitude = 0,
         max_phy_aptitude = 0,
         max_pdef_aptitude = 0,
         max_magic_aptitude = 0,
         max_aspd_aptitude = 0}).

-record(pet_tmp_aptitude,
        {is_valid = 0,
         tmp_genre = 0,
         tmp_pet_attr = #pet_attr{} :: #pet_attr{},
         tmp_skills = [],
         tmp_growth = 0,
         tmp_growth_type = 0,
         tmp_happy = 0,
         talent = 0}).

-record(pet_base,
        {id = 0,
         name = "",
         type = 1,
         genre = 0,
         hp_aptitude = 0,
         phy_aptitude = 0,
         pdef_aptitude = 0,
         magic_aptitude = 0,
         aspd_aptitude = 0,
         need_lev_break = 0,
         base_skills = [],
         vari_skills = [],
         lev_break_skills = [],
         has_break_skill = 0,
         base_happy = 1000,
         min_happy_ratio = 800,
         max_happy_ratio = 1050,
         min_happy_genre_ratio = 1000,
         max_happy_genre_ratio = 1100,
         growth_blue = 0,
         growth_purple = 0,
         growth_orange = 0,
         growth_red = 0,
         model_id = 0,
         model_id1 = 0,
         model_id2 = 0,
         model_id3 = 0,
         skin_id_0 = 0,
         skin_id_1 = 0,
         skin_id_2 = 0,
         skin_id_3 = 0,
         skin_id_s0 = 0,
         skin_id_s1 = 0,
         skin_id_s2 = 0,
         skin_id_s3 = 0,
         cost = [],
         lev_break_cost = [],
         max_wash_time = 0,
         manual_level = 0}).

-record(pet_base_skill,
        {id = 0,
         name = "",
         type = 0,
         step = 0,
         lev = 0,
         max_exp = 0,
         attr = []}).

-record(pet_skill,
        {id = 0,
         lev = 1,
         exp = 1,
         step = 0,
         type = 0,
         source = 1,
         is_lock = 0,
         is_last_study = 0}).

-record(pet_skin,
        {use_skin = 0,
         has_skin = [],
         add_hp_aptitude = 0,
         add_phy_aptitude = 0,
         add_pdef_aptitude = 0,
         add_magic_aptitude = 0,
         add_aspd_aptitude = 0,
         add_growth = 0}).

-record(pet,
        {ver = 32 :: pos_integer(),
         id = 1 :: pos_integer(),
         type = 1 :: pos_integer(),
         name = "" :: bitstring(),
         lev = 1 :: pos_integer(),
         talent = 0,
         growth = 0,
         growth_type = 2,
         use_growth = 0,
         genre = 0,
         exp = 0 :: non_neg_integer(),
         max_exp = 1 :: pos_integer(),
         status = 0 :: 0 | 1,
         base_id :: undefined | pos_integer(),
         attr :: undefined | tuple(),
         hp = 1,
         mp = 1,
         hp_max = 1,
         mp_max = 1,
         pet_attr = #pet_attr{} :: #pet_attr{},
         happy = 0 :: non_neg_integer(),
         looks = [] :: list(),
         skills = [],
         comprehend_lev = 1,
         grade = 0,
         grade_attr = [],
         stones = [],
         feed_item = [],
         feed_point = 0,
         free_reset_flag = 0,
         combat_talk = [],
         lock = 0,
         wash_time = 0,
         ai_skillid = 0,
         mount_skills = [],
         break_times = 0,
         is_first = 0,
         handbook_attr = [],
         handbook_num = 0,
         star_handbook_num = 0,
         pet_tmp_aptitude = #pet_tmp_aptitude{},
         glue_pudding_used = 0,
         pet_skin = #pet_skin{},
         spirit_attached = 0 :: 0 | 1,
         spirit_attached_id = 0 :: non_neg_integer(),
         spirit_skills = [],
         spirit_info = [],
         unreal = [],
         spirit_child_flag = 0 :: 0 | 1,
         spirit_child_id = {0, "", 0} :: tuple(),
         unreal_looks_flag = 0 :: 0 | 1,
         pet_rune = []}).

-record(m_pet,
        {ver = 2 :: pos_integer(),
         fresh_id = 1,
         next_id = 1 :: pos_integer(),
         pets = [] :: list(),
         rename = 3 :: non_neg_integer(),
         pet_nums = 5,
         time = 0}).

-record(m_pet_store,
        {ver = 1 :: pos_integer(),
         next_id = 1 :: pos_integer(),
         pets = [] :: list(),
         pet_nums = 4}).

-record(pet_goods,
        {base_id :: undefined | pos_integer(),
         actv_lev :: undefined | pos_integer(),
         stock :: undefined | pos_integer()}).

-record(pet_shop_data,
        {base_id :: undefined | pos_integer(),
         name :: undefined | binary(),
         actv_lev :: undefined | pos_integer(),
         def_buy_price :: undefined | pos_integer(),
         stock :: undefined | pos_integer()}).

-record(pet_exchange_data,
        {base_id = 0,
         item_id = 0,
         item_num = 0,
         exchange_item_num = 0,
         genre = 0,
         talent = 0}).

-record(pet_stone_polish_data,
        {stone_id = 0,
         attr = [],
         attr_name = 0,
         val_list = [],
         skill_list = []}).

-record(pet_unreal, {item_id = 0, timeout = 0}).

-record(pet_unreal_data,
        {item_id = 0,
         attr = [],
         skills = [],
         model_id = 0,
         skin_id = 0}).

-record(pet_rune,
        {rune_index = 0,
         rune_type = 0,
         rune_status = 0,
         rune_id = 0,
         rune_lev = 0,
         is_resonance = 0,
         resonances = []}).

-record(pet_resonance,
        {resonance_index = 0,
         resonance_id = 0,
         rune_index = 0}).

-file("src/mod/glory/glory_mgr.erl", 33).

-file("inc/var.hrl", 1).

-record(m_var,
        {ver = 1,
         last_reset_time = 0 :: non_neg_integer(),
         last_reset_five_time = 0,
         last_reset_week_five_time = 0,
         day_vars = [] :: [tuple()],
         day_five_vars = [] :: [tuple()],
         week_five_vars = [],
         last_acc_time = 0,
         acc_time = 0,
         acc_vars = [] :: [tuple()],
         other_vars = [] :: [tuple()]}).

-record(role_var,
        {id = {0, "", 0} :: tuple(),
         ver = 1,
         last_reset_time = 0 :: non_neg_integer(),
         day_vars = [] :: [tuple()],
         forever_vars = [] :: [tuple()],
         last_reset_five_time = 0,
         last_reset_week_five_time = 0,
         day_five_vars = [] :: [tuple()],
         week_five_vars = []}).

-file("src/mod/glory/glory_mgr.erl", 34).

-file("/usr/local/lib/erlang/lib/stdlib-2.1/include/"
      "ms_transform.hrl",
      1).

-file("src/mod/glory/glory_mgr.erl", 35).

-record(state, {}).

update_role(Role = #role{id = RoleId, classes = Classes,
                         name = Name, sex = Sex, lev = Lev,
                         m_glory =
                             #m_glory{new_id = Id, max_id = MaxId,
                                      new_title_id = TitleId, mtime = Mtime,
                                      reset_time = ResetTime,
                                      last_week = LastWeek}}) ->
    DayReward = var:get_var(Role, week_five, 300, 0),
    GloryRole = #glory_role{id = RoleId, classes = Classes,
                            name = Name, sex = Sex, lev = Lev, new_id = Id,
                            max_id = MaxId, new_title_id = TitleId,
                            mtime = Mtime, reset_time = ResetTime,
                            last_week = LastWeek, day_reward = DayReward,
                            update_time = date:unixtime()},
    logger:debug("正在更新数据:~w", [GloryRole], glory_mgr, 44),
    glory_mgr ! {update_role, GloryRole};
update_role(GloryRole = #glory_role{}) ->
    ets:insert(glory_role, GloryRole),
    dets:insert(glory_role, GloryRole).

lookup_role(RoleId) ->
    case ets:lookup(glory_role, RoleId) of
        [GR = #glory_role{}] -> GR;
        _ -> false
    end.

friend_glory_role(RoleId) ->
    FriendList = friend:list_id(RoleId),
    Fun = fun (Id, Rtn) ->
                  case lookup_role(Id) of
                      GR = #glory_role{} -> [GR | Rtn];
                      _ -> Rtn
                  end
          end,
    lists:foldl(Fun, [], FriendList).

lookup_floor(FloorList) when is_list(FloorList) ->
    lookup_floor(FloorList, []);
lookup_floor(Floor) when is_integer(Floor) ->
    case ets:lookup(glory_floor, Floor) of
        [GR = #glory_floor{}] -> GR;
        _ -> false
    end.

lookup_floor([], List) -> List;
lookup_floor([Floor | T], List) ->
    case lookup_floor(Floor) of
        F = #glory_floor{} -> lookup_floor(T, [F | List]);
        _ -> lookup_floor(T, List)
    end.

update_floor(F) ->
    ets:insert(glory_floor, F),
    dets:insert(glory_floor, F).

lookup(LevId) ->
    case catch ets:lookup(ets_glory_rank, LevId) of
        [{_, First, Rank}] -> {true, LevId, First, Rank, []};
        [{_, First, Rank, Recent}] ->
            {true, LevId, First, Rank, Recent};
        [] -> null;
        _Err ->
            logger:error("无法请求荣耀试炼排行数据:~w", [_Err], glory_mgr, 98),
            false
    end.

insert(Data) ->
    ets:insert(ets_glory_rank, Data),
    dets:insert(dets_glory_rank, Data),
    ok.

combat_result(Result = #{}) ->
    gen_server:cast(glory_mgr, {combat_result, Result}).

cast(Info) -> gen_server:cast(glory_mgr, Info).

reset() -> glory_mgr ! reset.

start_link() ->
    gen_server:start_link({local, glory_mgr},
                          glory_mgr,
                          [],
                          []).

init([]) ->
    logger:info("[~w] 正在启动...",
                [glory_mgr],
                glory_mgr,
                130),
    process_flag(trap_exit, true),
    dets:open_file(dets_glory_rank,
                   [{file, "./dets/glory_rank.dets"}, {keypos, 1}]),
    ets:new(ets_glory_rank,
            [set, named_table, public, {keypos, 1}]),
    dets:to_ets(dets_glory_rank, ets_glory_rank),
    dets:open_file(glory_role,
                   [{file, "./dets/glory_role.dets"},
                    {keypos, #glory_role.id}]),
    ets:new(glory_role,
            [set, named_table, public, {keypos, #glory_role.id}]),
    dets:to_ets(glory_role, glory_role),
    dets:open_file(glory_floor,
                   [{file, "./dets/glory_floor.dets"},
                    {keypos, #glory_floor.floor}]),
    ets:new(glory_floor,
            [set,
             named_table,
             public,
             {keypos, #glory_floor.floor}]),
    load_data(),
    floor_num(ets:tab2list(glory_floor)),
    erlang:send_after(util:rand(1000, 6000),
                      self(),
                      clean_redundancy),
    State = #state{},
    Now = date:unixtime(),
    {Today, {H, _, _}} = date:seconds_to_datetime(Now),
    NextHour = date:datetime_to_seconds({Today, {H, 0, 1}})
                   + 3600,
    Ref = erlang:send_after(max(NextHour - Now, 1) * 1000,
                            self(),
                            update_hour_zero),
    RefFive = erlang:send_after(date:next_diff(4, 59, 0) *
                                    1000,
                                self(),
                                update_hour_five),
    put(zero_ref, Ref),
    put(five_ref, RefFive),
    logger:info("[~w] 启动完成", [glory_mgr], glory_mgr, 152),
    {ok, State}.

handle_call(_Request, _From, State) -> {noreply, State}.

handle_cast({combat_result,
             #{lev_id := LevId, need_lev := NeedLev,
               role_id := RoleId, role_name := RoleName,
               role_lev := RoleLev, role_classes := RoleClasses,
               combat_time := CombatTime, record := Record}},
            State) ->
    case lookup(LevId) of
        {true, LevId, First, RankList, Recent} ->
            One = {RoleId,
                   RoleName,
                   RoleLev,
                   RoleClasses,
                   CombatTime},
            NewRankList = case RoleLev >= NeedLev + 10 of
                              true -> RankList;
                              false ->
                                  RankList1 = [One | RankList],
                                  RankList2 = lists:keysort(5, RankList1),
                                  lists:sublist(RankList2, 10)
                          end,
            case lists:keymember(RoleId, 1, NewRankList) of
                true ->
                    [combat_record:delete({4, {LevId, DelId}})
                     || {DelId, _, _, _, _} <- RankList -- NewRankList],
                    combat_record:save(4, {LevId, RoleId}, Record),
                    ok;
                _ -> ok
            end,
            NewRecent = lists:sublist([One | lists:keydelete(RoleId,
                                                             1,
                                                             Recent)],
                                      10),
            [combat_record:delete({6, {LevId, DelId1}})
             || {DelId1, _, _, _, _} <- Recent -- NewRecent],
            combat_record:save(6, {LevId, RoleId}, Record),
            Data = {LevId, First, NewRankList, NewRecent},
            insert(Data);
        null ->
            First = {RoleId, RoleName, RoleLev, RoleClasses},
            RankList = [{RoleId,
                         RoleName,
                         RoleLev,
                         RoleClasses,
                         CombatTime}],
            Data = {LevId, First, RankList, RankList},
            P = env:get(platform),
            Z = env:get(zone_id),
            combat_record:save(3, {LevId, P, Z}, Record),
            combat_record:save(4, {LevId, RoleId}, Record),
            combat_record:save(6, {LevId, RoleId}, Record),
            case NeedLev >= 45 of
                true ->
                    Msg =
                        notice:format(lang:get("一鸣惊人！~ts在~ts第~w关拔得头筹，获得全服首杀，一大批小伙伴膜拜中。"),
                                      [{role_2, RoleName},
                                       {string_2, 1, lang:get("[爵位挑战]")},
                                       LevId]),
                    notice:cast(all, 5, Msg);
                false -> ok
            end,
            insert(Data);
        _ -> skip
    end,
    {noreply, State};
handle_cast({update_floor,
             #{id := RoleId, old_id := OldId, old_max_id := MaxId,
               new_id := NewWave, max_id := NewMaxId}},
            State) ->
    logger:debug("=====================================更新层数",
                 [],
                 glory_mgr,
                 206),
    role_floor(RoleId, OldId, del),
    role_floor(RoleId, MaxId, del_max),
    role_floor(RoleId, NewWave, update),
    role_floor(RoleId, NewMaxId, update_max),
    {noreply, State};
handle_cast(_Msg, State) -> {noreply, State}.

handle_info(reset, State) ->
    MaxLev = 50,
    do_reset(MaxLev),
    {noreply, State};
handle_info(clean_redundancy, State) ->
    logger:info("开始清除冗余录像", [], glory_mgr, 224),
    {noreply, State};
handle_info({update_role,
             GR = #glory_role{id = RoleId, classes = Classes,
                              name = Name, sex = Sex, lev = Lev, new_id = Id,
                              max_id = MaxId, new_title_id = TitleId,
                              mtime = Mtime, reset_time = ResetTime,
                              day_reward = DayReward, last_week = LastWeek,
                              update_time = UpdateTime}},
            State) ->
    case lookup_role(RoleId) of
        Old = #glory_role{new_id = OldId, mtime = OldTime} ->
            NewMTime = case OldId == Id of
                           true -> OldTime;
                           _ -> Mtime
                       end,
            update_role(Old#glory_role{id = RoleId,
                                       classes = Classes, name = Name,
                                       sex = Sex, lev = Lev, new_id = Id,
                                       max_id = MaxId, new_title_id = TitleId,
                                       mtime = NewMTime, reset_time = ResetTime,
                                       day_reward = DayReward,
                                       last_week = LastWeek,
                                       update_time = UpdateTime});
        _ -> update_role(GR)
    end,
    {noreply, State};
handle_info(update_hour_zero, State) ->
    Now = date:unixtime(),
    {Today, {H, _, _}} = date:seconds_to_datetime(Now),
    case get(zero_ref) of
        OldRef when is_reference(OldRef) ->
            erlang:cancel_timer(OldRef);
        _ -> skip
    end,
    NextHour = date:datetime_to_seconds({Today, {H, 0, 1}})
                   + 3600,
    Ref = erlang:send_after(max(NextHour - Now, 1) * 1000,
                            self(),
                            update_hour_zero),
    put(zero_ref, Ref),
    TRankList = rank(),
    RankList = [R
                || R = #glory_role{new_id = TNewId} <- TRankList,
                   TNewId > 0],
    RankLen = length(RankList),
    RankRc = to_rank_rc(lists:sublist(RankList, 100),
                        1,
                        []),
    rank_zone:cast(56,
                   {replace, 56, RankRc, #{reward => 0}}),
    case H =:= 0 of
        true -> log:rank(RankRc, 56);
        _ -> ok
    end,
    case lists:member(calendar:day_of_the_week(Today), [1])
        of
        true when H == 0 -> rank_reward(RankList, 1, RankLen);
        _ -> ignore
    end,
    OpenTime = env:srv_open_time(),
    case OpenTime >=
             date:datetime_to_seconds({{2017, 7, 17}, {9, 0, 0}})
        of
        true when H == 0 ->
            open_rank_reward(RankList,
                             date:open_srv_day(),
                             1,
                             RankLen),
            open_rank_honor(RankList,
                            date:open_srv_day(),
                            1,
                            RankLen,
                            []);
        _ -> ignore
    end,
    {noreply, State};
handle_info(update_hour_five, State) ->
    case get(five_ref) of
        OldRef when is_reference(OldRef) ->
            erlang:cancel_timer(OldRef);
        _ -> skip
    end,
    Ref = erlang:send_after(date:next_diff(4, 59, 0) * 1000,
                            self(),
                            update_hour_five),
    put(five_ref, Ref),
    Now = date:unixtime(),
    {Today, _} = date:seconds_to_datetime(Now),
    FloorList = ets:tab2list(glory_floor),
    case lists:member(calendar:day_of_the_week(Today), [1])
        of
        true ->
            ets:delete_all_objects(glory_role),
            dets:delete_all_objects(glory_role),
            clean_floor(FloorList);
        _ -> ignore
    end,
    {noreply, State};
handle_info(gm_week_reset, State) ->
    _Now = date:unixtime(),
    FloorList = ets:tab2list(glory_floor),
    ets:delete_all_objects(glory_role),
    dets:delete_all_objects(glory_role),
    clean_floor(FloorList),
    {noreply, State};
handle_info(gm_week_zero, State) ->
    RankList = rank(),
    RankLen = length(RankList),
    RankRc = to_rank_rc(lists:sublist(RankList, 100),
                        1,
                        []),
    logger:debug("===========================:~w",
                 [RankRc],
                 glory_mgr,
                 319),
    rank_zone:cast(56,
                   {replace, 56, RankRc, #{reward => 0}}),
    rank_reward(RankList, 1, RankLen),
    {noreply, State};
handle_info({update_record, FirstId, RecId}, State) ->
    logger:debug("爵位录像更新:~w", [FirstId], glory_mgr, 327),
    Old = #glory_floor{record_list = RecordList} = case
                                                       lookup_floor(FirstId)
                                                       of
                                                       F = #glory_floor{} -> F;
                                                       _ ->
                                                           #glory_floor{floor =
                                                                            FirstId}
                                                   end,
    NewRecord = lists:sublist([RecId | RecordList], 10),
    DelIds = RecordList -- NewRecord,
    combat_record:info({cite, RecId}),
    combat_record:info({minus_citeds, DelIds}),
    update_floor(Old#glory_floor{record_list = NewRecord}),
    {noreply, State};
handle_info(_Info, State) -> {noreply, State}.

terminate(_Reason, _State) ->
    logger:info("[~w] 正在关闭...",
                [glory_mgr],
                glory_mgr,
                345),
    logger:info("[~w] 关闭完成", [glory_mgr], glory_mgr, 346),
    ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

role_floor(RoleId, Floor, Label) ->
    Old = #glory_floor{max_list = MaxList,
                       role_list = RoleList, num = Num} =
              case lookup_floor(Floor) of
                  F = #glory_floor{} -> F;
                  _ -> #glory_floor{floor = Floor}
              end,
    NF = case Label of
             del ->
                 Old#glory_floor{role_list = RoleList -- [RoleId]};
             del_max ->
                 Old#glory_floor{max_list = MaxList -- [RoleId]};
             update ->
                 NewNum = Num + 1,
                 case glory_data:get_level(Floor) of
                     #glory_lev_data{buff_id = BuffId, buff_num = BuffNum}
                         when NewNum == BuffNum andalso BuffId > 0 ->
                         notice:cast(all,
                                     5,
                                     notice:format(lang:get("喜大普奔！~ts第~ts关经过玩家的不断努力，怪物被打的头破血流，全服玩家挑战时可获得~ts了！"),
                                                   [{string_2,
                                                     1,
                                                     lang:get("爵位闯关")},
                                                    {string_2, 1, Floor},
                                                    {string_2,
                                                     3,
                                                     lang:get("增益加成")}]));
                     _ -> ignore
                 end,
                 Old#glory_floor{role_list =
                                     (RoleList -- [RoleId]) ++ [RoleId],
                                 num = NewNum};
             update_max ->
                 Old#glory_floor{max_list =
                                     (MaxList -- [RoleId]) ++ [RoleId]};
             _ -> Old
         end,
    logger:debug("=========================:~w",
                 [NF],
                 glory_mgr,
                 381),
    update_floor(NF).

rank() ->
    RoleList = ets:tab2list(glory_role),
    util:keys_sort([#glory_role.lev,
                    {asc, #glory_role.mtime},
                    #glory_role.new_id],
                   RoleList).

to_rank_rc([], _, Acc) -> lists:reverse(Acc);
to_rank_rc([Warrior | Rest], Rank, Acc) ->
    #glory_role{id = Id = {RId, Plat, ZoneId}, name = Name,
                sex = Sex, classes = Classes, lev = Lev, new_id = Floor,
                max_id = MaxId, mtime = Mtime, new_title_id = TitleId} =
        Warrior,
    NHonorId = case glory_data:get_title(TitleId) of
                   #glory_title_data{honor_id = THonorId} -> THonorId;
                   _ -> 0
               end,
    RankRc = #rank_rc{id = Id, rank = Rank, role_id = RId,
                      platform = Plat, zone_id = ZoneId, name = Name,
                      sex = Sex, classes = Classes, lev = Lev, val1 = Floor,
                      val2 = Mtime, val3 = MaxId, val4 = NHonorId},
    to_rank_rc(Rest, Rank + 1, [RankRc | Acc]).

do_reset(LevId) when LevId =< 0 -> ok;
do_reset(LevId) ->
    case lookup(LevId) of
        {true, LevId, _, RankList} ->
            logger:info("清除~w关试炼记录", [LevId], glory_mgr, 407),
            NewRankList = [{RoleId,
                            RoleName,
                            RoleLev,
                            RoleClasses,
                            CombatTime}
                           || {RoleId,
                               RoleName,
                               RoleLev,
                               RoleClasses,
                               CombatTime}
                                  <- RankList,
                              CombatTime > 30],
            case NewRankList of
                [{RoleId, RoleName, RoleLev, RoleClasses, _CombatTime}
                 | _] ->
                    NewFirst = {RoleId, RoleName, RoleLev, RoleClasses},
                    Data = {LevId, NewFirst, NewRankList},
                    insert(Data);
                _ ->
                    ets:delete(ets_glory_rank, LevId),
                    dets:delete(dets_glory_rank, LevId),
                    ok
            end,
            do_reset(LevId - 1);
        null -> do_reset(LevId - 1);
        _ -> do_reset(LevId - 1)
    end.

rank_reward([], _, _RankLen) -> ok;
rank_reward([#glory_role{id = RoleId} | T], Rank,
            RankLen)
    when Rank =< 100 ->
    case glory_data:get_rank(Rank) of
        #glory_rank_data{reward = Reward} ->
            mail:send(RoleId,
                      lang:get("爵位排行榜"),
                      notice:format(lang:get("本周在爵位挑战中脱颖而出，获得了第~ts名的好名次，超越了本服~ts名玩家"),
                                    [{string_2, 1, Rank},
                                     {string_2, 1, RankLen - Rank + 1}]),
                      Reward);
        _ -> ignore
    end,
    rank_reward(T, Rank + 1, RankLen);
rank_reward([#glory_role{id = RoleId, new_id = Id,
                         last_week = LastWeek}
             | T],
            Rank, RankLen) ->
    case glory_data:get_rank(Rank) of
        #glory_rank_data{reward = Reward} when Id > LastWeek ->
            mail:send(RoleId,
                      lang:get("爵位排行榜"),
                      notice:format(lang:get("本周排名第~ts，超越了本服共~ts名玩家，比上周挑战进度增加了~ts关"),
                                    [{string_2, 1, Rank},
                                     {string_2, 1, RankLen - Rank + 1},
                                     {string_2, 1, Id - LastWeek}]),
                      Reward);
        #glory_rank_data{reward = Reward} when Id == LastWeek ->
            mail:send(RoleId,
                      lang:get("爵位排行榜"),
                      notice:format(lang:get("本周排名第~ts，超越了本服共~ts名玩家"),
                                    [{string_2, 1, Rank},
                                     {string_2, 1, RankLen - Rank + 1}]),
                      Reward);
        #glory_rank_data{reward = Reward} ->
            mail:send(RoleId,
                      lang:get("爵位排行榜"),
                      notice:format(lang:get("本周排名第~ts，超越了本服共~ts名玩家，比上周挑战进度退步了~ts关"),
                                    [{string_2, 1, Rank},
                                     {string_2, 1, RankLen - Rank + 1},
                                     {string_2, 1, LastWeek - Id}]),
                      Reward);
        _ -> ignore
    end,
    rank_reward(T, Rank + 1, RankLen).

open_rank_reward([], _Open, _Rank, _RankLen) -> ok;
open_rank_reward([#glory_role{id = RoleId} | T], Open,
                 Rank, RankLen) ->
    case glory_data:get_open_rank({Rank, Open}) of
        #glory_open_rank_data{reward = Reward = [_ | _],
                              title = Title, content = Content} ->
            logger:info("爵位开服排行榜：rank：~w， Title:~ts, content:~ts, "
                        "Reward:~w",
                        [Rank, Title, Content, Reward],
                        glory_mgr,
                        455),
            mail:send(RoleId, Title, Content, Reward);
        _ -> ignore
    end,
    open_rank_reward(T, Open, Rank + 1, RankLen).

open_rank_honor([], _Open, _Rank, _RankLen, []) -> ok;
open_rank_honor([], _Open, _Rank, _RankLen, List) ->
    honor_mgr:replace(list_to_atom(lists:concat(["glory_honor_",
                                                 open])),
                      List,
                      0),
    ok;
open_rank_honor([#glory_role{id = RoleId, name = Name}
                 | T],
                Open, Rank, RankLen, List) ->
    NList = case glory_data:get_open_rank({Rank, Open}) of
                #glory_open_rank_data{honor_id = HonorId}
                    when HonorId > 0 ->
                    logger:info("爵位开服排行榜：rank：~w, ~w, ~ts， honor_id:~w",
                                [Rank, RoleId, Name, HonorId],
                                glory_mgr,
                                471),
                    [{RoleId, HonorId} | List];
                _ -> List
            end,
    open_rank_honor(T, Open, Rank + 1, RankLen, NList).

day_reward([], _) -> ok;
day_reward([#glory_role{id = RoleId, name = _Name,
                        mtime = Mtime, new_id = _Id, lev = _Lev,
                        new_title_id = _TitleId}
            | T],
           Now) ->
    logger:debug("===============================:~w",
                 [{date:get_five_reset(Now),
                   date:get_five_reset(Mtime)}],
                 glory_mgr,
                 481),
    case date:get_five_reset(Now) =:=
             date:get_five_reset(Mtime)
        of
        true -> ignore;
        _ ->
            Title = lang:get("爵位每日结算"),
            Content = lang:get("您昨日未参与爵位闯关，无法获得结算奖励。今天请加油，拿回您应得的！"),
            mail:send(RoleId, Title, Content)
    end,
    day_reward(T, Now).

day_five_reward([], _) -> ok;
day_five_reward([#glory_role{id = RoleId, name = Name,
                             day_reward = DayReward, mtime = Mtime, new_id = Id,
                             lev = Lev, new_title_id = TitleId}
                 | T],
                Now) ->
    case DayReward of
        1 -> ignore;
        _ ->
            case date:is_same_five_reset(Now, Mtime) of
                true ->
                    case glory_data:get_level(Id) of
                        #glory_lev_data{day_reward = Reward,
                                        day_exp_mod = ExpMod} ->
                            NewRate = case glory_data:get_title(TitleId) of
                                          #glory_title_data{rate = Rate} ->
                                              Rate;
                                          _ -> 0
                                      end,
                            AddExp = role:get_exp_mod(#role{lev = Lev,
                                                            m_pet = #m_pet{}},
                                                      ExpMod,
                                                      NewRate),
                            logger:info("爵位每周奖励:~w, ~ts, ~w",
                                        [RoleId, Name, Reward ++ AddExp],
                                        glory_mgr,
                                        511),
                            Title = lang:get("爵位每周结算"),
                            Content =
                                notice:format(lang:get("您在爵位闯关中成功挑战至~ts层，请继续努力，看好你哦！不要忘了挑战层数越高，奖励越丰厚哦"
                                                       "{face_1, 3}"),
                                              [{string_2, 1, Id}]),
                            mail:send(RoleId, Title, Content, Reward ++ AddExp);
                        _ -> ignore
                    end;
                _ -> ignore
            end
    end,
    day_five_reward(T, Now).

clean_floor([]) -> ok;
clean_floor([F = #glory_floor{} | T]) ->
    update_floor(F#glory_floor{role_list = []}),
    clean_floor(T).

load_data() ->
    case dets:first(glory_floor) of
        '$end_of_table' ->
            dets:to_ets(glory_floor, glory_floor),
            logger:info("没有数据需要加载", [], glory_mgr, 535),
            [];
        _ ->
            dets:traverse(glory_floor,
                          fun (Data) ->
                                  case glory_ver:do(floor, Data) of
                                      {false, Reason} ->
                                          logger:error("数据转换失败:~w",
                                                       [Reason],
                                                       glory_mgr,
                                                       542),
                                          {done, false};
                                      {ok, NewData = #glory_floor{}} ->
                                          ets:insert(glory_floor, NewData),
                                          dets:insert(glory_floor, NewData),
                                          continue
                                  end
                          end)
    end.

floor_num([]) -> ok;
floor_num([I = #glory_floor{floor = Floor, num = 0}
           | T]) ->
    MatchSpec = [{{glory_role,
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '$1',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_'},
                  [{'>=', '$1', {const, Floor}}],
                  [1]}],
    List = ets:select(glory_role, MatchSpec),
    Num = length(List),
    ets:insert(glory_floor, I#glory_floor{num = Num}),
    dets:insert(glory_floor, I#glory_floor{num = Num}),
    floor_num(T);
floor_num([_ | T]) -> floor_num(T).

