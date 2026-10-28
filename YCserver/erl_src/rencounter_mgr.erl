-file("src/mod/rencounter/rencounter_mgr.erl", 1).

-module(rencounter_mgr).

-behaviour(gen_fsm).

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

-file("src/mod/rencounter/rencounter_mgr.erl", 11).

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

-file("src/mod/rencounter/rencounter_mgr.erl", 12).

-file("inc/rencounter.hrl", 1).

-record(m_rencounter, {ver = 1}).

-record(rencounter_role,
        {ver = 1,
         id = {0, "", 0},
         name = "",
         classes = 0,
         lev = 0,
         sex = 0,
         break_times = 0,
         fc = 0,
         looks = [] :: list(),
         rank_lev = 1,
         star = 0,
         total_star = 0,
         join_times = 0,
         max_joins = 4 * 2,
         has_get_rank = 1,
         last_matched = 0,
         best_rank = 0,
         best_star = 0,
         best_total_star = 0,
         update_best_star_time = 0,
         win_lasted_times = 0,
         last_result = 0,
         season_join_times = 0,
         season_win_times = 0,
         season_lasted_win = 0,
         total_join_times = 0,
         total_win_times = 0,
         best_laster_win = 0,
         last_join_times = 0,
         last_win_times = 0,
         last_lasted_win = 0}).

-record(rencounter_match_role,
        {ver = 1,
         id = {0, "", 0},
         pid = undefined :: pid(),
         name = "",
         classes = 0,
         lev = 0,
         sex = 0,
         break_times = 0,
         fc = 0,
         looks = [] :: list(),
         rank_lev = 1,
         star = 0,
         win_lasted_times = 0,
         mode = 1,
         trail_times = 0,
         last_matched = 0,
         match_id = 0,
         retrys = 0}).

-record(rencounter_match,
        {id = 0 :: non_neg_integer(),
         mode = 1,
         match_roles = [] :: list(),
         time = 0 :: non_neg_integer(),
         combat_pid :: undefined | pid(),
         calc_args = [] :: list()}).

-file("src/mod/rencounter/rencounter_mgr.erl", 13).

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

-file("src/mod/rencounter/rencounter_mgr.erl", 14).

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

-file("src/mod/rencounter/rencounter_mgr.erl", 15).

-file("inc/lev_break.hrl", 1).

-record(m_lev_break,
        {ver = 0,
         trial = 0 :: non_neg_integer(),
         done = 0 :: non_neg_integer(),
         times = 0 :: non_neg_integer(),
         attr_point = 0 :: non_neg_integer()}).

-file("src/mod/rencounter/rencounter_mgr.erl", 16).

-record(state,
        {timeout = 0,
         ts = 0,
         match_ref = undefined,
         rank_ref = undefined,
         season_ref = undefined,
         sync_season_ref = undefined,
         reset_role = undefined}).

-export([init/1,
         handle_event/3,
         handle_sync_event/4,
         handle_info/3,
         terminate/3,
         code_change/4]).

-export([idle/2, prepare/2, active/2]).

-export([call/1,
         info/1,
         cast/1,
         next/0,
         m/1,
         get_total_star/2,
         add_star/3,
         start_link/0,
         get_season_time/0,
         calc_join_times/1,
         get_reset_total_star/2]).

-export([combat_over/1]).

init([]) ->
    logger:info("英雄擂台管理器启动...", [], rencounter_mgr, 58),
    process_flag(trap_exit, true),
    dets:open_file(rencounter_role,
                   [{file, "./dets/rencounter_role.dets"},
                    {keypos, #rencounter_role.id}]),
    ets:new(rencounter_role,
            [set,
             named_table,
             public,
             {keypos, #rencounter_role.id}]),
    dets:to_ets(rencounter_role, rencounter_role),
    dets:open_file(rencounter_rank,
                   [{file, "./dets/rencounter_rank.dets"}, {keypos, 1}]),
    ets:new(rencounter_rank,
            [set, named_table, public, {keypos, 1}]),
    dets:to_ets(rencounter_rank, rencounter_rank),
    ets:new(rencounter_match_role,
            [set,
             named_table,
             public,
             {keypos, #rencounter_match_role.id}]),
    ets:new(rencounter_match,
            [set,
             named_table,
             public,
             {keypos, #rencounter_match.id}]),
    {StateName, TimeOut} = get_state(),
    env:set(rencounter_match_id, 1),
    case env:get(rencounter_season_id) of
        undefined -> env:save(rencounter_season_id, 1);
        _ -> ok
    end,
    case env:get(rencounter_season_reset_times) of
        undefined -> env:save(rencounter_season_reset_times, 0);
        _ -> ok
    end,
    SeasonTt = get_next_season_reset(),
    SeasonRef = erlang:send_after(SeasonTt * 1000,
                                  self(),
                                  season_reset),
    SyncSeasonRef = erlang:send_after(10000 * 1000,
                                      self(),
                                      sync_season_id),
    ResetRoleTt = date:next_diff(5, 0, 2) * 1000,
    ResetRoleRef = erlang:send_after(ResetRoleTt,
                                     self(),
                                     reset_role),
    State = #state{ts = now(), timeout = TimeOut,
                   season_ref = SeasonRef, sync_season_ref = SyncSeasonRef,
                   reset_role = ResetRoleRef},
    State1 = case StateName of
                 active ->
                     MatchRef = erlang:send_after(5000, self(), match),
                     RankRef = erlang:send_after(300000,
                                                 self(),
                                                 update_rank),
                     State#state{rank_ref = RankRef, match_ref = MatchRef};
                 _ -> State
             end,
    logger:info("英雄擂台管理器启动完成...", [], rencounter_mgr, 117),
    NewState = State1,
    {ok, StateName, NewState, TimeOut}.

handle_event({quit,
              RoleId = {_, Platform, ZoneId},
              RolePid},
             StateName, State) ->
    case lookup_rencounter_match_role(RoleId) of
        {ok, #rencounter_match_role{match_id = MatchId}}
            when MatchId =/= 0 ->
            logger:debug("无法退出:~w", [RoleId], rencounter_mgr, 126),
            Msg = lang:get("已经完成了匹配，请完成对战吧"),
            big_world:cast(Platform,
                           ZoneId,
                           notice,
                           send,
                           [{conn_pid, RolePid}, 1, Msg]),
            ok;
        _ ->
            remove_rencounter_match_role(RoleId),
            callback_role(RoleId,
                          RolePid,
                          {rencounter_role, callback, [quit]}),
            ok
    end,
    continue(StateName, State);
handle_event({combat_over,
              _Args = #{win_role_id := WRoleId,
                        lose_role_id := LRoleId, statistics := CombatStatistics,
                        ext_args := #{match_id := MatchId}}},
             StateName, State) ->
    case lookup_match(MatchId) of
        {ok, MatchInfo = #rencounter_match{mode = _Mode}} ->
            logger:debug("比赛信息：~w",
                         [MatchInfo],
                         rencounter_mgr,
                         142),
            calc_combat(WRoleId, CombatStatistics, MatchInfo, 1),
            calc_combat(LRoleId, CombatStatistics, MatchInfo, 0),
            remove_rencounter_match(MatchId);
        _ ->
            logger:error("战斗结算失败，不存在的比赛:~w",
                         [_Args],
                         rencounter_mgr,
                         151)
    end,
    continue(StateName, State);
handle_event(_Event, StateName, State) ->
    logger:error("未知消息 ~w", [_Event], rencounter_mgr, 157),
    continue(StateName, State).

handle_sync_event(get_status, _From, StateName,
                  State = #state{timeout = TimeOut, ts = Ts}) ->
    Seconds = util:time_left(TimeOut, Ts) div 1000,
    EndTime = date:unixtime() + Seconds,
    Status = statename_to_status(StateName),
    SeasonId = env:get(rencounter_season_id),
    {SeasonStartTime, SeasonEndTime} = get_season_time(),
    Reply = {ok,
             Status,
             EndTime,
             SeasonId,
             SeasonStartTime,
             SeasonEndTime},
    continue(Reply, StateName, State);
handle_sync_event({join,
                   #{role_id := RoleId, role_pid := RolePid, name := Name,
                     classes := Classes, lev := Lev, sex := Sex,
                     break_times := BreakTimes, fc := Fc, looks := Looks}},
                  _From, StateName, State) ->
    ShowList = [],
    Now = date:unixtime(),
    case lookup_rencounter_role(RoleId) of
        {ok,
         EtsRctRole = #rencounter_role{rank_lev = RankLev,
                                       star = Star,
                                       win_lasted_times = WinLasterTimes}} ->
            NewEtsRctRole = EtsRctRole#rencounter_role{name = Name,
                                                       sex = Sex,
                                                       classes = Classes,
                                                       lev = Lev,
                                                       break_times = BreakTimes,
                                                       fc = Fc, looks = Looks},
            update_rencounter_role(NewEtsRctRole),
            Mode = get_join_mode(StateName, EtsRctRole),
            RencounterMatchRole = #rencounter_match_role{id =
                                                             RoleId,
                                                         name = Name, sex = Sex,
                                                         pid = RolePid,
                                                         classes = Classes,
                                                         lev = Lev,
                                                         break_times =
                                                             BreakTimes,
                                                         fc = Fc, looks = Looks,
                                                         mode = Mode,
                                                         trail_times = 0,
                                                         rank_lev = RankLev,
                                                         star = Star,
                                                         win_lasted_times =
                                                             WinLasterTimes,
                                                         last_matched = Now},
            update_rencounter_match_role(RencounterMatchRole);
        _ ->
            RencounterRole = #rencounter_role{id = RoleId,
                                              name = Name, classes = Classes,
                                              lev = Lev, sex = Sex,
                                              break_times = BreakTimes, fc = Fc,
                                              looks = Looks,
                                              last_matched = Now},
            update_rencounter_role(RencounterRole),
            Mode = get_join_mode(StateName, RencounterRole),
            RencounterMatchRole = #rencounter_match_role{id =
                                                             RoleId,
                                                         name = Name, sex = Sex,
                                                         pid = RolePid,
                                                         classes = Classes,
                                                         lev = Lev,
                                                         break_times =
                                                             BreakTimes,
                                                         fc = Fc, looks = Looks,
                                                         mode = Mode,
                                                         trail_times = 0,
                                                         last_matched = Now},
            update_rencounter_match_role(RencounterMatchRole)
    end,
    Reply = {ok, #{show_list => ShowList}},
    continue(Reply, StateName, State);
handle_sync_event({get_upgrade_reward,
                   RoleId = {_, Platform, ZoneId},
                   TargetRankLev},
                  _From, StateName, State) ->
    Reply = case lookup_rencounter_role(RoleId) of
                {ok,
                 RctRole = #rencounter_role{best_rank = BestRank,
                                            has_get_rank = HasGetRank}}
                    when TargetRankLev =:= BestRank ->
                    case HasGetRank < TargetRankLev of
                        true ->
                            NewRctRole = RctRole#rencounter_role{has_get_rank =
                                                                     TargetRankLev},
                            update_rencounter_role(NewRctRole),
                            big_world:cast(Platform,
                                           ZoneId,
                                           rencounter_agent,
                                           info,
                                           [{update_rencounter_role,
                                             NewRctRole}]),
                            {ok, #{}};
                        false ->
                            big_world:cast(Platform,
                                           ZoneId,
                                           rencounter_agent,
                                           info,
                                           [{update_rencounter_role, RctRole}]),
                            {false, lang:get("您已经领取过该奖励")}
                    end;
                _ -> {false, lang:get("您已经领取过该奖励")}
            end,
    continue(Reply, StateName, State);
handle_sync_event(_Event, _From, StateName, State) ->
    logger:error("未知消息 ~w", [_Event], rencounter_mgr, 221),
    Reply = false,
    continue(Reply, StateName, State).

handle_info({combat_success, MatchId, CombatPid},
            StateName, State) ->
    case lookup_match(MatchId) of
        {ok, MatchInfo} ->
            NewMatchInfo = MatchInfo#rencounter_match{combat_pid =
                                                          CombatPid},
            update_match(NewMatchInfo);
        _ -> ok
    end,
    continue(StateName, State);
handle_info({combat_faild, MatchInfo}, StateName,
            State) ->
    combat_result(combat_error, MatchInfo),
    continue(StateName, State);
handle_info(reset_role, StateName,
            State = #state{reset_role = OldRef}) ->
    case erlang:is_reference(OldRef) of
        true -> erlang:cancel_timer(OldRef);
        false -> ok
    end,
    ResetRoleTt = date:next_diff(5, 0, 2) * 1000,
    ResetRoleRef = erlang:send_after(ResetRoleTt,
                                     self(),
                                     reset_role),
    Fun = fun (RctRole = #rencounter_role{}, Rtn) ->
                  NewRctRole = calc_join_times(RctRole),
                  [NewRctRole | Rtn];
              (_, Rtn) -> Rtn
          end,
    ModifyList = ets:foldl(Fun, [], rencounter_role),
    update_rencounter_role(ModifyList),
    big_world:cast(all,
                   rencounter_agent,
                   info,
                   [reset_role]),
    NewState = State#state{reset_role = ResetRoleRef},
    continue(StateName, NewState);
handle_info(clean_rank, StateName, State) ->
    ets:delete_all_objects(rencounter_rank),
    dets:delete_all_objects(rencounter_rank),
    big_world:cast(all,
                   rencounter_agent,
                   info,
                   [clean_rank]),
    continue(StateName, State);
handle_info(stop_match, StateName, State) ->
    Fun = fun (#rencounter_match_role{id = RoleId,
                                      pid = RolePid, match_id = MatchId},
               ok)
                  when MatchId =:= 0 ->
                  callback_role(RoleId,
                                RolePid,
                                {rencounter_role, callback, [stop_match]}),
                  ok;
              (_, ok) -> ok
          end,
    ets:foldl(Fun, ok, rencounter_match_role),
    continue(StateName, State);
handle_info({set_rank_lev,
             RoleId = {_, Platform, ZoneId},
             RankLev,
             Star},
            StateName, State) ->
    logger:debug("gm_reset_join=====:~w",
                 [RoleId],
                 rencounter_mgr,
                 282),
    case lookup_rencounter_role(RoleId) of
        {ok, RctRole} ->
            NewRctRole = RctRole#rencounter_role{rank_lev = RankLev,
                                                 star = Star,
                                                 best_rank = RankLev},
            update_rencounter_role(NewRctRole),
            big_world:cast(Platform,
                           ZoneId,
                           rencounter_agent,
                           info,
                           [{update_rencounter_role, NewRctRole}]),
            ok;
        false -> ok
    end,
    continue(StateName, State);
handle_info({gm_reset_join,
             RoleId = {_, Platform, ZoneId}},
            StateName, State) ->
    logger:debug("gm_reset_join=====:~w",
                 [RoleId],
                 rencounter_mgr,
                 295),
    case lookup_rencounter_role(RoleId) of
        {ok, RctRole} ->
            NewRctRole =
                calc_join_times(RctRole#rencounter_role{last_matched =
                                                            0}),
            update_rencounter_role(NewRctRole),
            big_world:cast(Platform,
                           ZoneId,
                           rencounter_agent,
                           info,
                           [{update_rencounter_role, NewRctRole}]),
            ok;
        false -> ok
    end,
    continue(StateName, State);
handle_info({gm_set_times,
             RoleId = {_, Platform, ZoneId},
             Times},
            StateName, State) ->
    logger:debug("gm_set_times=====:~w",
                 [RoleId],
                 rencounter_mgr,
                 309),
    case lookup_rencounter_role(RoleId) of
        {ok, RctRole} ->
            NewRctRole = RctRole#rencounter_role{max_joins = Times,
                                                 join_times = 0},
            update_rencounter_role(NewRctRole),
            big_world:cast(Platform,
                           ZoneId,
                           rencounter_agent,
                           info,
                           [{update_rencounter_role, NewRctRole}]),
            ok;
        false -> ok
    end,
    continue(StateName, State);
handle_info(sync_season_id, StateName,
            State = #state{sync_season_ref = OldRef}) ->
    case erlang:is_reference(OldRef) of
        true -> erlang:cancel_timer(OldRef);
        false -> ok
    end,
    SyncSeasonRef = erlang:send_after(10000 * 1000,
                                      self(),
                                      sync_season_id),
    NewState = State#state{sync_season_ref = SyncSeasonRef},
    SeasonId = env:get(rencounter_season_id),
    big_world:cast(all,
                   rencounter_agent,
                   info,
                   [{sync_season_id, SeasonId}]),
    continue(StateName, NewState);
handle_info(season_reset, StateName,
            State = #state{season_ref = OldRef}) ->
    logger:debug("擂台======", [], rencounter_mgr, 339),
    case erlang:is_reference(OldRef) of
        true -> erlang:cancel_timer(OldRef);
        false -> ok
    end,
    SeasonTt = get_next_season_reset(),
    SeasonRef = erlang:send_after(SeasonTt * 1000,
                                  self(),
                                  season_reset),
    ResetTimes = env:get(rencounter_season_reset_times),
    case ResetTimes =:= 3 of
        true ->
            env:save(rencounter_season_reset_times, 0),
            NewSeasonId = env:save_counter(rencounter_season_id, 1),
            big_world:cast(all,
                           rencounter_agent,
                           info,
                           [{sync_season_id, NewSeasonId}]),
            {SeasonStartTime, SeasonEndTime} = get_season_time(),
            big_world:cast(all,
                           rencounter_agent,
                           info,
                           [{update_season_time,
                             SeasonStartTime,
                             SeasonEndTime}]),
            update_rank(),
            reset_rank_lev();
        false ->
            env:save_counter(rencounter_season_reset_times, 1),
            {SeasonStartTime, SeasonEndTime} = get_season_time(),
            big_world:cast(all,
                           rencounter_agent,
                           info,
                           [{update_season_time,
                             SeasonStartTime,
                             SeasonEndTime}])
    end,
    NewState = State#state{season_ref = SeasonRef},
    continue(StateName, NewState);
handle_info(gm_season_reset, StateName,
            State = #state{season_ref = OldRef}) ->
    logger:debug("擂台======", [], rencounter_mgr, 371),
    case erlang:is_reference(OldRef) of
        true -> erlang:cancel_timer(OldRef);
        false -> ok
    end,
    SeasonTt = get_next_season_reset(),
    SeasonRef = erlang:send_after(SeasonTt * 1000,
                                  self(),
                                  season_reset),
    env:save(rencounter_season_reset_times, 0),
    NewSeasonId = env:save_counter(rencounter_season_id, 1),
    big_world:cast(all,
                   rencounter_agent,
                   info,
                   [{sync_season_id, NewSeasonId}]),
    update_rank(),
    reset_rank_lev(),
    NewState = State#state{season_ref = SeasonRef},
    continue(StateName, NewState);
handle_info(match, active,
            State = #state{match_ref = OldRef}) ->
    case erlang:is_reference(OldRef) of
        true -> erlang:cancel_timer(OldRef);
        false -> ok
    end,
    match(),
    Ref = erlang:send_after(5000, self(), match),
    NewState = State#state{match_ref = Ref},
    continue(active, NewState);
handle_info(match, StateName, State) ->
    logger:debug("结束匹配", [], rencounter_mgr, 404),
    continue(StateName, State);
handle_info(update_rank, active,
            State = #state{rank_ref = OldRankRef}) ->
    case erlang:is_reference(OldRankRef) of
        true -> erlang:cancel_timer(OldRankRef);
        _ -> ok
    end,
    update_rank(),
    RankRef = erlang:send_after(300000,
                                self(),
                                update_rank),
    NewState = State#state{rank_ref = RankRef},
    continue(active, NewState);
handle_info(update_rank, StateName, State) ->
    logger:debug("排行终止", [], rencounter_mgr, 419),
    update_rank(),
    continue(StateName, State);
handle_info({start_combat, MatchId}, StateName,
            State) ->
    case lookup_match(MatchId) of
        {ok, MatchInfo} ->
            MgrPid = self(),
            spawn(fun () -> start_combat(MatchInfo, MgrPid) end);
        _ ->
            logger:error("不存在的对战信息:~w",
                         [MatchId],
                         rencounter_mgr,
                         433),
            ok
    end,
    continue(StateName, State);
handle_info(next, StateName, State) ->
    continue(StateName, State);
handle_info(reload_state, idle, State) ->
    {_StateName, TimeOut} = get_state(),
    logger:info("新时间-----> ~w state : ~w",
                [TimeOut, _StateName],
                rencounter_mgr,
                445),
    continue(idle,
             State#state{ts = now(), timeout = TimeOut});
handle_info(reload_state, StateName, State) ->
    continue(StateName, State);
handle_info(_Info, StateName, State) ->
    logger:error("未知消息 ~w", [_Info], rencounter_mgr, 452),
    continue(StateName, State).

terminate(_Reason, _StateName, _State) -> ok.

code_change(_OldVsn, StateName, State, _Extra) ->
    {ok, StateName, State}.

continue(StateName,
         State = #state{timeout = infinity}) ->
    {next_state, StateName, State, infinity};
continue(StateName,
         State = #state{ts = Ts, timeout = TimeOut}) ->
    {next_state,
     StateName,
     State,
     util:time_left(TimeOut, Ts)}.

continue(Reply, StateName,
         State = #state{timeout = infinity}) ->
    {reply, Reply, StateName, State, infinity};
continue(Reply, StateName,
         State = #state{ts = Ts, timeout = TimeOut}) ->
    {reply,
     Reply,
     StateName,
     State,
     util:time_left(TimeOut, Ts)}.

idle(timeout, State = #state{}) ->
    State1 = State#state{ts = now(), timeout = 300 * 1000},
    EndTime = date:unixtime() + 300,
    big_world:cast(all,
                   rencounter_agent,
                   info,
                   [{update_status, 2, EndTime}]),
    continue(prepare, State1).

prepare(timeout,
        State = #state{rank_ref = OldRankRef,
                       match_ref = OldMatchref}) ->
    State1 = State#state{ts = now(), timeout = 1800 * 1000},
    case erlang:is_reference(OldMatchref) of
        true -> erlang:cancel_timer(OldMatchref);
        false -> ok
    end,
    Ref = erlang:send_after(5000, self(), match),
    case erlang:is_reference(OldRankRef) of
        true -> erlang:cancel_timer(OldRankRef);
        _ -> ok
    end,
    ets:delete_all_objects(rencounter_match_role),
    update_rank(),
    RankRef = erlang:send_after(300000,
                                self(),
                                update_rank),
    NewState = State1#state{rank_ref = RankRef,
                            match_ref = Ref},
    EndTime = date:unixtime() + 1800,
    big_world:cast(all,
                   rencounter_agent,
                   info,
                   [{update_status, 3, EndTime}]),
    continue(active, NewState).

active(timeout,
       State = #state{rank_ref = OldRankRef}) ->
    {_StateName, TimeOut} = get_state(),
    State1 = State#state{ts = now(), timeout = TimeOut},
    Now = date:unixtime(),
    EndTime = Now + TimeOut,
    big_world:cast(all,
                   rencounter_agent,
                   info,
                   [{update_status, 1, EndTime}]),
    info(stop_match),
    case erlang:is_reference(OldRankRef) of
        true -> erlang:cancel_timer(OldRankRef);
        _ -> ok
    end,
    update_rank(),
    RankRef = erlang:send_after(1200000,
                                self(),
                                update_rank),
    NewState = State1#state{rank_ref = RankRef},
    continue(idle, NewState).

call(Msg) ->
    try gen_fsm:sync_send_all_state_event(rencounter_mgr,
                                          Msg)
    catch
        _Type:_Reason ->
            logger:error("英雄擂台调用失败 Type:~w Reason:~w, Msg:~w",
                         [_Type, _Reason, Msg],
                         rencounter_mgr,
                         554),
            {error, timeout}
    end.

info(Msg) -> rencounter_mgr ! Msg.

next() -> gen_fsm:send_event(rencounter_mgr, timeout).

m(reload_state) -> rencounter_mgr ! reload_state.

cast(Msg) ->
    gen_fsm:send_all_state_event(rencounter_mgr, Msg).

start_link() ->
    gen_fsm:start_link({local, rencounter_mgr},
                       rencounter_mgr,
                       [],
                       []).

get_total_star(RankLev, Star) ->
    rencounter_data:get_total(RankLev) + Star.

get_reset_total_star(RankLev, Star) ->
    case RankLev < 6 of
        true -> get_total_star(RankLev, Star);
        false -> get_total_star(RankLev, 0)
    end.

add_star(RankLev, Star, AddStar) ->
    case rencounter_data:get_rank_star(RankLev) of
        #{star := MaxStar} when Star + AddStar >= MaxStar ->
            add_star(RankLev + 1, Star + AddStar - MaxStar, 0);
        _ when Star + AddStar < 0 ->
            case RankLev > 1 of
                true ->
                    case rencounter_data:get_rank_star(RankLev - 1) of
                        #{star := MaxStar} ->
                            add_star(RankLev - 1, Star + AddStar + MaxStar, 0);
                        _ -> {RankLev, Star}
                    end;
                false -> {RankLev, Star}
            end;
        _ -> {RankLev, Star + AddStar}
    end.

calc_join_times(RctRole = #rencounter_role{join_times =
                                               JoinTimes,
                                           max_joins = MaxJoins,
                                           last_matched = LastMatched}) ->
    Now = date:unixtime(),
    case date:is_same_day(LastMatched, Now) of
        true -> RctRole;
        false ->
            case agenda_data:get(1029) of
                #{args := WeekDays} ->
                    case lists:member(date:day_of_the_week(Now), WeekDays)
                        of
                        true ->
                            NewMaxJoins = min(MaxJoins - JoinTimes + 4, 2 * 4),
                            RctRole#rencounter_role{join_times = 0,
                                                    max_joins = NewMaxJoins,
                                                    last_matched = Now};
                        false -> RctRole
                    end;
                _ -> RctRole
            end
    end.

callback_role({_Rid, Platform, ZoneId}, RolePid, Mfa) ->
    big_world:cast(Platform,
                   ZoneId,
                   role,
                   apply,
                   [async, RolePid, Mfa]).

combat_over(#combat{winner = Winners, loser = Losers,
                    start_args = #combat_start_args{ext_args = ExtArgs},
                    round = Round}) ->
    WinRoles = [W || W = #fighter{type = 1} <- Winners],
    LoseRoles = [L || L = #fighter{type = 1} <- Losers],
    case {WinRoles, LoseRoles} of
        {[#fighter{pid = Wpid, origin_id = WRoleId}],
         [#fighter{pid = Lpid, origin_id = LRoleId}]} ->
            CombatRecord = combat_record:get_buffer(),
            Ids = [Id
                   || #fighter{origin_id = Id} <- WinRoles ++ LoseRoles],
            IsMarvel = is_marvel(Round, WinRoles, LoseRoles),
            RecordArgs = #{combat_type => 113, ids => Ids,
                           cross => true, round => Round, winner => WinRoles,
                           loser => LoseRoles, record => CombatRecord,
                           is_marvel => IsMarvel},
            case Ids of
                [{_, Platfrom, ZoneId} | _] ->
                    big_world:cast(Platfrom,
                                   ZoneId,
                                   combat_record,
                                   save,
                                   [RecordArgs#{pz => {Platfrom, ZoneId}}]);
                _ -> ok
            end,
            CombatStatistics = make_combat_statistics(1,
                                                      Winners,
                                                      Losers),
            Args = #{win_pid => Wpid, win_role_id => WRoleId,
                     lose_pid => Lpid, lose_role_id => LRoleId,
                     round => Round, statistics => CombatStatistics,
                     ext_args => ExtArgs},
            cast({combat_over, Args});
        _Err ->
            WinRoleIds = [WRid
                          || #fighter{type = 1, origin_id = WRid} <- Winners],
            LoseRoleIds = [LRid
                           || #fighter{type = 1, origin_id = LRid} <- Losers],
            logger:error("英雄擂台战斗结束错误：~w",
                         [{WinRoleIds, LoseRoleIds}],
                         rencounter_mgr,
                         657),
            ok
    end.

make_combat_statistics(Result, Winner, Loser) ->
    case Result of
        1 ->
            SStatistics = do_make_statistics(Winner, #{data => []}),
            TStatistics = do_make_statistics(Loser, #{data => []}),
            {SStatistics, TStatistics};
        0 ->
            SStatistics = do_make_statistics(Loser, #{data => []}),
            TStatistics = do_make_statistics(Winner, #{data => []}),
            {SStatistics, TStatistics}
    end.

do_make_statistics([], Statistics) -> Statistics;
do_make_statistics([#fighter{type = 1,
                             origin_id = RoleId, name = RoleName,
                             classes = RoleClasses, lev = RoleLev,
                             sex = RoleSex,
                             combat_statistics =
                                 #combat_statistics{total_dmg = Dmg,
                                                    total_heal = Heal}}
                    | T],
                   Statistics = #{data := Data}) ->
    NewData = [{0, 0, Dmg, Heal} | Data],
    MainRole = {RoleId,
                RoleName,
                RoleClasses,
                RoleSex,
                RoleLev},
    do_make_statistics(T,
                       Statistics#{data => NewData, role => MainRole});
do_make_statistics([#fighter{type = 4,
                             origin_id = RoleId, name = RoleName,
                             classes = RoleClasses, lev = RoleLev,
                             sex = RoleSex,
                             combat_statistics =
                                 #combat_statistics{total_dmg = Dmg,
                                                    total_heal = Heal}}
                    | T],
                   Statistics = #{data := Data}) ->
    NewData = [{0, 0, Dmg, Heal} | Data],
    MainRole = {RoleId,
                RoleName,
                RoleClasses,
                RoleSex,
                RoleLev},
    do_make_statistics(T,
                       Statistics#{data => NewData, role => MainRole});
do_make_statistics([#fighter{type = 5, base_id = BaseId,
                             combat_statistics =
                                 #combat_statistics{total_dmg = Dmg,
                                                    total_heal = Heal}}
                    | T],
                   Statistics = #{data := Data}) ->
    Fun = fun ({Type, _, _, _}) -> Type =:= 1 end,
    {GuardData, RestData} = lists:partition(Fun, Data),
    NewGuardData = case lists:keyfind(BaseId, 2, GuardData)
                       of
                       {_, _, OldDmg, OldHeal} ->
                           lists:keystore(BaseId,
                                          1,
                                          GuardData,
                                          {1,
                                           BaseId,
                                           Dmg + OldDmg,
                                           Heal + OldHeal});
                       _ -> [{1, BaseId, Dmg, Heal} | GuardData]
                   end,
    NewData = NewGuardData ++ RestData,
    do_make_statistics(T, Statistics#{data => NewData});
do_make_statistics([#fighter{type = 3, base_id = BaseId,
                             combat_statistics =
                                 #combat_statistics{total_dmg = Dmg,
                                                    total_heal = Heal}}
                    | T],
                   Statistics = #{data := Data}) ->
    NewData = case lists:keyfind(2, 1, Data) of
                  {_, _, OldDmg, OldHeal} ->
                      lists:keystore(2,
                                     1,
                                     Data,
                                     {2, BaseId, Dmg + OldDmg, Heal + OldHeal});
                  _ -> [{2, BaseId, Dmg, Heal} | Data]
              end,
    do_make_statistics(T, Statistics#{data => NewData});
do_make_statistics([_ | T], Statistics) ->
    do_make_statistics(T, Statistics).

remove_rencounter_match(MatchId) ->
    ets:delete(rencounter_match, MatchId).

lookup_rencounter_role(RoleId) ->
    case catch ets:lookup(rencounter_role, RoleId) of
        [RencounterRole = #rencounter_role{}] ->
            {ok, RencounterRole};
        _ -> false
    end.

lookup_rencounter_match_role(RoleId) ->
    case catch ets:lookup(rencounter_match_role, RoleId) of
        [MatchRole = #rencounter_match_role{}] ->
            {ok, MatchRole};
        _ -> false
    end.

remove_rencounter_match_role(RoleId) ->
    ets:delete(rencounter_match_role, RoleId).

update_rencounter_match_role(RoleInfo) ->
    ets:insert(rencounter_match_role, RoleInfo).

update_rencounter_role(RoleInfo) ->
    ets:insert(rencounter_role, RoleInfo),
    dets:insert(rencounter_role, RoleInfo).

update_match(MatchInfo) ->
    ets:insert(rencounter_match, MatchInfo).

lookup_match(MatchId) ->
    case catch ets:lookup(rencounter_match, MatchId) of
        [Match = #rencounter_match{}] -> {ok, Match};
        _ -> false
    end.

factory_match_id() ->
    env:update_counter(rencounter_match_id, 1).

get_state() ->
    {StateName, TimeOut} = case
                               agenda:get_state_timeout(1029, 300)
                               of
                               {idle, Tt} -> {idle, Tt};
                               {notice, Tt} -> {prepare, Tt};
                               {active, _Tt} -> {active, 1800}
                           end,
    TimeOut1 = second_timeout(StateName, TimeOut),
    {StateName, TimeOut1 * 1000}.

second_timeout(idle, TimeOut) ->
    Now = date:unixtime(),
    case agenda_data:get(1029) of
        #{args := [H | T]} ->
            case date:week_next_diff([H | T], Now, {19, 0, 0}) of
                Tt when Tt < TimeOut -> Tt;
                _ -> TimeOut
            end;
        _ ->
            case date:next_diff({19, 0, 0}) of
                Tt when Tt < TimeOut -> Tt;
                _ -> TimeOut
            end
    end;
second_timeout(_StateName, TimeOut) -> TimeOut.

match() ->
    MatchList = ets:tab2list(rencounter_match_role),
    GroupList = fetch_group(MatchList, []),
    batch_match(GroupList),
    todo.

fetch_group([], GroupList) -> GroupList;
fetch_group([#rencounter_match_role{match_id = MatchId}
             | Rest],
            GroupList)
    when MatchId =/= 0 ->
    fetch_group(Rest, GroupList);
fetch_group([RctRole = #rencounter_match_role{lev = Lev,
                                              break_times = BreakTimes,
                                              mode = Mode}
             | Rest],
            GroupList) ->
    GroupId = rencounter_data:get_group_id(Lev, BreakTimes),
    Key = {GroupId, Mode},
    NewGroupList = case lists:keyfind(Key, 1, GroupList) of
                       {_, GroupMatchRoleList} ->
                           NewGroupMatchRoleList = {Key,
                                                    [RctRole
                                                     | GroupMatchRoleList]},
                           lists:keyreplace(Key,
                                            1,
                                            GroupList,
                                            NewGroupMatchRoleList);
                       _ -> [{Key, [RctRole]} | GroupList]
                   end,
    fetch_group(Rest, NewGroupList).

batch_match([]) -> ok;
batch_match([{{_GroupId, Mode}, MatchRoleList}
             | Rest]) ->
    logger:debug("正在对组~w的~w进行匹配",
                 [_GroupId, Mode],
                 rencounter_mgr,
                 810),
    SortMatchRoleList = util:keys_sort([{asc,
                                         #rencounter_match_role.star},
                                        {asc, #rencounter_match_role.rank_lev},
                                        #rencounter_match_role.trail_times],
                                       MatchRoleList),
    do_match(SortMatchRoleList, [], Mode),
    batch_match(Rest).

do_match([], UnMatchRoleList, _Mode) ->
    update_match_times(UnMatchRoleList);
do_match([RctRole = #rencounter_match_role{} | Rest],
         UnMatchRoleList, Mode) ->
    case check_condition(RctRole, Rest) of
        {true,
         MatchedRole = #rencounter_match_role{id =
                                                  MatchedRoleId}} ->
            LeftMatchRoleList = lists:keydelete(MatchedRoleId,
                                                #rencounter_match_role.id,
                                                Rest),
            make_match(RctRole, MatchedRole, Mode),
            do_match(LeftMatchRoleList, UnMatchRoleList, Mode);
        _ -> do_match(Rest, [RctRole | UnMatchRoleList], Mode)
    end.

check_condition(_MatchRole, []) -> false;
check_condition(MatchRole =
                    #rencounter_match_role{rank_lev = RankLev1,
                                           star = Star1,
                                           trail_times = TrailTimes1},
                [DoMatchRole = #rencounter_match_role{rank_lev =
                                                          RankLev2,
                                                      star = Star2,
                                                      trail_times = TrailTimes2}
                 | Rest]) ->
    TotalStar1 = get_total_star(RankLev1, Star1),
    TotalStar2 = get_total_star(RankLev2, Star2),
    TrailTimes = min(TrailTimes1, TrailTimes2),
    StarGap = get_match_star_gap(TrailTimes),
    logger:debug("==========:~w",
                 [{TotalStar1, TotalStar2, TrailTimes, StarGap}],
                 rencounter_mgr,
                 836),
    case abs(TotalStar2 - TotalStar1) =< StarGap of
        true -> {true, DoMatchRole};
        false ->
            case TrailTimes >= 16 andalso RankLev1 =:= RankLev2 of
                true -> {true, DoMatchRole};
                false -> check_condition(MatchRole, Rest)
            end
    end.

make_match(MatchRole1 = #rencounter_match_role{id =
                                                   Rid1,
                                               pid = Rpid1},
           MatchRole2 = #rencounter_match_role{id = Rid2,
                                               pid = Rpid2},
           Mode) ->
    MatchId = factory_match_id(),
    R1 = MatchRole1#rencounter_match_role{match_id =
                                              MatchId},
    R2 = MatchRole2#rencounter_match_role{match_id =
                                              MatchId},
    update_rencounter_match_role(R1),
    update_rencounter_match_role(R2),
    Now = date:unixtime(),
    MatchInfo = #rencounter_match{id = MatchId,
                                  match_roles = [R1, R2], time = Now,
                                  mode = Mode},
    update_match(MatchInfo),
    erlang:send_after(5000,
                      self(),
                      {start_combat, MatchId}),
    callback_role(Rid1,
                  Rpid1,
                  {rencounter_role, callback, [match_success]}),
    callback_role(Rid2,
                  Rpid2,
                  {rencounter_role, callback, [match_success]}),
    notice_role_prepare(R1, R2),
    ok.

notice_role_prepare(R1 = #rencounter_match_role{pid =
                                                    Pid1},
                    R2 = #rencounter_match_role{pid = Pid2}) ->
    role:pack_send(Pid1, 19305, {R2}),
    role:pack_send(Pid2, 19305, {R1}),
    ok.

update_match_times([]) -> ok;
update_match_times([RctRole =
                        #rencounter_match_role{trail_times = TrailTimes}
                    | Rest]) ->
    logger:debug("增加匹配次数:~w",
                 [RctRole],
                 rencounter_mgr,
                 874),
    NewRctRole = RctRole#rencounter_match_role{trail_times =
                                                   TrailTimes + 1},
    update_rencounter_match_role(NewRctRole),
    update_match_times(Rest).

statename_to_status(idle) -> 1;
statename_to_status(prepare) -> 2;
statename_to_status(active) -> 3.

get_match_star_gap(TrailTimes) ->
    case TrailTimes of
        0 -> 0;
        1 -> 0;
        2 -> 0;
        3 -> 0;
        4 -> 0;
        5 -> 0;
        6 -> 0;
        7 -> 1;
        8 -> 1;
        9 -> 1;
        10 -> 1;
        11 -> 1;
        12 -> 1;
        13 -> 1;
        14 -> 1;
        15 -> 1;
        16 -> 1;
        17 -> 1;
        18 -> 1;
        19 -> 1;
        20 -> 1;
        21 -> 1;
        22 -> 1;
        23 -> 1;
        24 -> 2;
        25 -> 2;
        26 -> 2;
        27 -> 2;
        28 -> 2;
        29 -> 2;
        30 -> 2;
        31 -> 2;
        32 -> 2;
        33 -> 2;
        34 -> 2;
        35 -> 2;
        36 -> 3;
        37 -> 3;
        38 -> 3;
        39 -> 3;
        40 -> 3;
        41 -> 3;
        42 -> 3;
        43 -> 3;
        44 -> 3;
        45 -> 3;
        46 -> 3;
        47 -> 3;
        48 -> 4;
        49 -> 4;
        50 -> 4;
        51 -> 4;
        52 -> 4;
        53 -> 4;
        54 -> 4;
        55 -> 4;
        56 -> 4;
        57 -> 4;
        58 -> 4;
        59 -> 4;
        60 -> 4;
        61 -> 4;
        62 -> 4;
        63 -> 4;
        64 -> 4;
        65 -> 4;
        66 -> 4;
        67 -> 4;
        68 -> 4;
        69 -> 4;
        70 -> 4;
        71 -> 4;
        72 -> 4;
        73 -> 4;
        74 -> 4;
        75 -> 4;
        76 -> 4;
        77 -> 4;
        78 -> 4;
        79 -> 4;
        80 -> 4;
        81 -> 4;
        82 -> 4;
        83 -> 4;
        84 -> 4;
        85 -> 5;
        86 -> 5;
        87 -> 5;
        88 -> 5;
        89 -> 5;
        90 -> 5;
        91 -> 5;
        92 -> 5;
        93 -> 5;
        94 -> 5;
        95 -> 5;
        96 -> 5;
        97 -> 5;
        98 -> 5;
        99 -> 5;
        100 -> 5;
        101 -> 5;
        102 -> 5;
        103 -> 5;
        104 -> 5;
        105 -> 5;
        106 -> 5;
        107 -> 5;
        108 -> 5;
        109 -> 5;
        110 -> 5;
        111 -> 5;
        112 -> 5;
        113 -> 5;
        114 -> 5;
        115 -> 5;
        116 -> 5;
        117 -> 5;
        118 -> 5;
        119 -> 5;
        120 -> 5;
        121 -> 6;
        122 -> 6;
        123 -> 6;
        124 -> 6;
        125 -> 6;
        126 -> 6;
        127 -> 6;
        128 -> 6;
        129 -> 6;
        130 -> 6;
        131 -> 6;
        132 -> 6;
        133 -> 6;
        134 -> 6;
        135 -> 6;
        136 -> 6;
        137 -> 6;
        138 -> 6;
        139 -> 6;
        140 -> 6;
        141 -> 6;
        142 -> 6;
        143 -> 6;
        144 -> 6;
        145 -> 7;
        146 -> 7;
        147 -> 7;
        148 -> 7;
        149 -> 7;
        150 -> 7;
        151 -> 7;
        152 -> 7;
        153 -> 7;
        154 -> 7;
        155 -> 7;
        156 -> 7;
        157 -> 7;
        158 -> 7;
        159 -> 7;
        160 -> 7;
        161 -> 7;
        162 -> 7;
        163 -> 7;
        164 -> 7;
        165 -> 7;
        166 -> 7;
        167 -> 7;
        168 -> 7;
        169 -> 8;
        170 -> 8;
        171 -> 8;
        172 -> 8;
        173 -> 8;
        174 -> 8;
        175 -> 8;
        176 -> 8;
        177 -> 8;
        178 -> 8;
        179 -> 8;
        180 -> 8;
        _ -> 8
    end.

start_combat(MatchInfo = #rencounter_match{id = MatchId,
                                           match_roles = [R1, R2]},
             MgrPid) ->
    logger:debug("开始战斗:~w",
                 [MatchInfo],
                 rencounter_mgr,
                 1074),
    Attacker = get_fighter(R1),
    Defender = get_fighter(R2),
    case {Attacker, Defender} of
        {#fighter_wrap{}, #fighter_wrap{}} ->
            StartArgs = #combat_start_args{ext_args =
                                               #{match_id => MatchId}},
            case combat_mgr:start_combat(113,
                                         [Attacker],
                                         [Defender],
                                         StartArgs)
                of
                {ok, CombatPid} ->
                    MgrPid ! {combat_success, MatchId, CombatPid};
                {false, Reason} ->
                    logger:error("~w发起战斗失败, Reason:~w",
                                 [MatchInfo, Reason],
                                 rencounter_mgr,
                                 1084),
                    MgrPid ! {combat_faild, MatchInfo}
            end;
        _ -> MgrPid ! {combat_faild, MatchInfo}
    end;
start_combat(_Else, _) ->
    logger:error("开始战斗失败:~w",
                 [_Else],
                 rencounter_mgr,
                 1092),
    ok.

combat_result(combat_error,
              _MatchInfo = #rencounter_match{id = MatchId,
                                             match_roles = [R1, R2]}) ->
    logger:debug("战斗发起失败,清理数据:~w",
                 [_MatchInfo],
                 rencounter_mgr,
                 1096),
    do_combat_result(combat_error, R1),
    do_combat_result(combat_error, R2),
    ets:delete(rencounter_match, MatchId).

do_combat_result(combat_error,
                 #rencounter_match_role{id = RoleId, pid = RolePid}) ->
    remove_rencounter_match_role(RoleId),
    callback_role(RoleId,
                  RolePid,
                  {rencounter_role, callback, [combat_faild]});
do_combat_result(_Type, _MatchRoleole) ->
    logger:error("未知的战斗结果类型:~w, 角色信息:~w",
                 [_Type, _MatchRoleole],
                 rencounter_mgr,
                 1105),
    ok.

get_fighter(RctRole = #rencounter_match_role{id =
                                                 RoleId = {Rid,
                                                           Platform,
                                                           ZoneId},
                                             retrys = TryNum}) ->
    case big_world:call(Platform,
                        ZoneId,
                        role_query,
                        rec,
                        [by_id, Rid, Platform, ZoneId, fighter_wrap])
        of
        {ok, #fighter_wrap{status = 2, s_event = _Event}} ->
            logger:error("英雄擂台活动中，角色[~w]在战斗中~w无法转换",
                         [RoleId, _Event],
                         rencounter_mgr,
                         1112),
            false;
        {ok, Fw = #fighter_wrap{s_event = 45}} -> Fw;
        {ok,
         Fw = #fighter_wrap{s_event = _Event = 0,
                            status = _Status}} ->
            logger:error("英雄擂台活动中，角色[~w]在~w中~w转换",
                         [RoleId, _Status, _Event],
                         rencounter_mgr,
                         1117),
            Fw;
        {ok,
         #fighter_wrap{status = _Status, s_event = _Event}} ->
            logger:error("英雄擂台活动中，角色[~w]在~w中~w无法转换",
                         [RoleId, _Status, _Event],
                         rencounter_mgr,
                         1120),
            false;
        {error, timeout} ->
            case TryNum >= 3 of
                false ->
                    logger:debug("角色转换[~w]超时, 正在重试第~w次",
                                 [RoleId, TryNum + 1],
                                 rencounter_mgr,
                                 1125),
                    get_fighter(RctRole#rencounter_match_role{retrys =
                                                                  TryNum + 1});
                true ->
                    logger:error("角色转换[~w]仍然超时,不再尝试",
                                 [RoleId],
                                 rencounter_mgr,
                                 1128),
                    false
            end;
        {error, not_found} ->
            logger:error("角色掉线[~w], 无法转换",
                         [RoleId],
                         rencounter_mgr,
                         1132),
            false;
        _Err ->
            logger:error("角色转换[~w]错误：~w",
                         [RoleId, _Err],
                         rencounter_mgr,
                         1135),
            false
    end.

calc_combat(RoleId, CombatStatistics, MatchInfo,
            WinOrLose) ->
    logger:debug("进行战斗结算:~w",
                 [{RoleId, CombatStatistics, MatchInfo, WinOrLose}],
                 rencounter_mgr,
                 1140),
    case lookup_rencounter_match_role(RoleId) of
        {ok,
         RctMatchRole = #rencounter_match_role{lev = Lev,
                                               break_times = BreakTimes}} ->
            GroupId = rencounter_data:get_group_id(Lev, BreakTimes),
            OldRctRole = case lookup_rencounter_role(RoleId) of
                             {ok, _OldRctRole} -> _OldRctRole;
                             _ -> #rencounter_role{}
                         end,
            calc_combat_rewards([sync_event,
                                 calc_lev,
                                 sync_statistics],
                                RctMatchRole,
                                #{result => WinOrLose,
                                  combat_statistics => CombatStatistics,
                                  group_id => GroupId, match_info => MatchInfo,
                                  rencounter_role => OldRctRole});
        _Err ->
            logger:error("英雄擂台战斗结束无法查询角色[~w]比赛信息，错误:~w",
                         [RoleId, _Err],
                         rencounter_mgr,
                         1150),
            ok
    end.

calc_combat_rewards([],
                    _RctMatchRole = #rencounter_match_role{id = RoleId},
                    _Args) ->
    ets:delete(rencounter_match_role, RoleId),
    ok;
calc_combat_rewards([sync_event | Rest],
                    RctMatchRole = #rencounter_match_role{id = RoleId,
                                                          pid = RolePid},
                    Args) ->
    callback_role(RoleId,
                  RolePid,
                  {rencounter_role, callback, [combat_end]}),
    calc_combat_rewards(Rest, RctMatchRole, Args);
calc_combat_rewards([sync_statistics | Rest],
                    RctMatchRole = #rencounter_match_role{id = RoleId,
                                                          pid = RolePid,
                                                          rank_lev = SRankLev,
                                                          star = SStar},
                    Args = #{combat_statistics := CombatStatistics,
                             match_info := MatchInfo,
                             rencounter_role :=
                                 #rencounter_role{rank_lev = NewRankLev,
                                                  star = NewStar},
                             result := WinOrLose}) ->
    {#{data := WinStatistics}, #{data := LoseStatistics}} =
        CombatStatistics,
    {SelfStatustics, TargetStatustics} = case WinOrLose of
                                             1 ->
                                                 {WinStatistics,
                                                  LoseStatistics};
                                             0 ->
                                                 {LoseStatistics, WinStatistics}
                                         end,
    #rencounter_match_role{id = TRoleId, name = TName,
                           classes = TClasses, sex = TSex, lev = TLev,
                           rank_lev = TRankLev, star = TStar} =
        get_target_info(RoleId, MatchInfo),
    Reply = {WinOrLose,
             TRoleId,
             TName,
             TClasses,
             TSex,
             TLev,
             TRankLev,
             TStar,
             SRankLev,
             SStar,
             NewRankLev,
             NewStar,
             SelfStatustics,
             TargetStatustics},
    logger:debug("推送战斗结算数据:~w",
                 [Reply],
                 rencounter_mgr,
                 1177),
    role:pack_send(RolePid, 19306, Reply),
    calc_combat_rewards(Rest, RctMatchRole, Args);
calc_combat_rewards([_ | Rest], RctMatchRole,
                    Args = #{match_info := #rencounter_match{mode = 2}}) ->
    calc_combat_rewards(Rest, RctMatchRole, Args);
calc_combat_rewards([calc_lev | Rest],
                    RctMatchRole = #rencounter_match_role{id =
                                                              RoleId = {_,
                                                                        Platform,
                                                                        ZoneId},
                                                          pid = RolePid,
                                                          rank_lev = OldRankLev,
                                                          name = _RoleName},
                    Args = #{result := WinOrLose, group_id := GroupId}) ->
    case lookup_rencounter_role(RoleId) of
        {ok,
         RencounterRole = #rencounter_role{rank_lev = RankLev,
                                           star = Star,
                                           win_lasted_times = WLTimes,
                                           season_lasted_win = SLWTimes,
                                           best_laster_win = BLWTimes,
                                           season_win_times = SWTimes,
                                           season_join_times = SJTimes,
                                           total_win_times = TWTimes,
                                           total_join_times = TJTimes,
                                           best_rank = BestRank,
                                           best_star = BestStar,
                                           best_total_star = BestTotalStar,
                                           update_best_star_time = UpBSTime,
                                           has_get_rank = HasGetRank}} ->
            CostRencounterRole = #rencounter_role{join_times =
                                                      JoinTimes} =
                                     calc_join_times(RencounterRole),
            RencounterRole1 =
                CostRencounterRole#rencounter_role{join_times =
                                                       JoinTimes + 1,
                                                   last_result = WinOrLose,
                                                   season_join_times =
                                                       SJTimes + 1,
                                                   total_join_times =
                                                       TJTimes + 1},
            RencounterRole3 = #rencounter_role{win_lasted_times =
                                                   WinLastedTimes} =
                                  case WinOrLose of
                                      1 ->
                                          RencounterRole2 =
                                              RencounterRole1#rencounter_role{total_win_times
                                                                                  =
                                                                                  TWTimes
                                                                                      +
                                                                                      1,
                                                                              season_win_times
                                                                                  =
                                                                                  SWTimes
                                                                                      +
                                                                                      1},
                                          NewWLTimes = WLTimes + 1,
                                          NewSLWTimes = max(SLWTimes,
                                                            NewWLTimes),
                                          NewBLWTimes = max(BLWTimes,
                                                            NewWLTimes),
                                          RencounterRole2#rencounter_role{win_lasted_times
                                                                              =
                                                                              NewWLTimes,
                                                                          season_lasted_win
                                                                              =
                                                                              NewSLWTimes,
                                                                          best_laster_win
                                                                              =
                                                                              NewBLWTimes};
                                      _ ->
                                          RencounterRole1#rencounter_role{win_lasted_times
                                                                              =
                                                                              0}
                                  end,
            AddStar = case WinOrLose of
                          1 ->
                              case WinLastedTimes rem 3 =:= 0 of
                                  true when RankLev < 6 -> 2;
                                  _ -> 1
                              end;
                          0 ->
                              case RankLev of
                                  1 ->
                                      Msg = lang:get("当前段位不会损失星星"),
                                      big_world:cast(Platform,
                                                     ZoneId,
                                                     notice,
                                                     pop,
                                                     [{pid, RolePid}, 2, Msg]),
                                      0;
                                  2 when Star =:= 0 ->
                                      Msg = lang:get("当前擂台不会降阶"),
                                      big_world:cast(Platform,
                                                     ZoneId,
                                                     notice,
                                                     pop,
                                                     [{pid, RolePid}, 2, Msg]),
                                      0;
                                  3 when Star =:= 0 ->
                                      Msg = lang:get("当前擂台不会降阶"),
                                      big_world:cast(Platform,
                                                     ZoneId,
                                                     notice,
                                                     pop,
                                                     [{pid, RolePid}, 2, Msg]),
                                      0;
                                  _ -> -1
                              end
                      end,
            {NewRankLev, NewStar} = add_star(RankLev,
                                             Star,
                                             AddStar),
            TotalStar = get_total_star(NewRankLev, NewStar),
            {NewBestRank,
             NewBestStar,
             NewBestTotalStar,
             UpdateBestTime} =
                case NewRankLev > BestRank orelse
                         NewRankLev =:= BestRank andalso NewStar > BestStar
                    of
                    true ->
                        case NewRankLev > BestRank of
                            true ->
                                send_best_rank_notice(NewRankLev, RctMatchRole),
                                ok;
                            false -> ok
                        end,
                        Now = date:unixtime(),
                        {NewRankLev, NewStar, TotalStar, Now};
                    false -> {BestRank, BestStar, BestTotalStar, UpBSTime}
                end,
            RencounterRole4 =
                RencounterRole3#rencounter_role{rank_lev = NewRankLev,
                                                star = NewStar,
                                                total_star = TotalStar,
                                                best_star = NewBestStar,
                                                best_rank = NewBestRank,
                                                best_total_star =
                                                    NewBestTotalStar,
                                                update_best_star_time =
                                                    UpdateBestTime},
            RencounterRole5 = case NewRankLev > BestRank of
                                  true ->
                                      case HasGetRank < OldRankLev of
                                          true ->
                                              case
                                                  rencounter_data:get_rewards({GroupId,
                                                                               OldRankLev})
                                                  of
                                                  #{stage_item := StageItem} ->
                                                      UnBindItem = [{Assets,
                                                                     0,
                                                                     Val}
                                                                    || {Assets,
                                                                        Val}
                                                                           <- StageItem],
                                                      {StrRct, Honor} = case
                                                                            rencounter_data:get_rank_star(RankLev)
                                                                            of
                                                                            #{rencounter
                                                                                  :=
                                                                                  _StrRct,
                                                                              title
                                                                                  :=
                                                                                  _Honor} ->
                                                                                {_StrRct,
                                                                                 _Honor};
                                                                            _ ->
                                                                                {lang:get("飞瀑村"),
                                                                                 lang:get("学徒")}
                                                                        end,
                                                      MailTitle =
                                                          lang:get("英雄擂台晋级奖励"),
                                                      MailContent =
                                                          notice:format(lang:get("您晋级至~ts-~ts未领取，现通过邮件下发给您："),
                                                                        [{string_2,
                                                                          2,
                                                                          StrRct},
                                                                         {string_2,
                                                                          1,
                                                                          Honor}]),
                                                      big_world:cast(Platform,
                                                                     ZoneId,
                                                                     mail,
                                                                     send,
                                                                     [RoleId,
                                                                      MailTitle,
                                                                      MailContent,
                                                                      UnBindItem]),
                                                      RencounterRole4#rencounter_role{has_get_rank
                                                                                          =
                                                                                          OldRankLev};
                                                  _Err ->
                                                      logger:error("获取【~w】进阶奖励配置失败:~w",
                                                                   [{GroupId,
                                                                     RankLev},
                                                                    _Err],
                                                                   rencounter_mgr,
                                                                   1269),
                                                      RencounterRole4
                                              end;
                                          false -> RencounterRole4
                                      end;
                                  false -> RencounterRole4
                              end,
            NewRencounterRole = RencounterRole5,
            update_rencounter_role(NewRencounterRole),
            big_world:cast(Platform,
                           ZoneId,
                           rencounter_agent,
                           info,
                           [{sync_rencounter_role,
                             NewRencounterRole,
                             WinOrLose,
                             GroupId}]),
            calc_combat_rewards(Rest,
                                RctMatchRole,
                                Args#{rencounter_role => NewRencounterRole});
        _ -> calc_combat_rewards(Rest, RctMatchRole, Args)
    end;
calc_combat_rewards([combat_reward | Rest],
                    RctMatchRole = #rencounter_match_role{id = RoleId,
                                                          pid = RolePid},
                    Args = #{result := WinOrLose, group_id := GroupId,
                             rencounter_role := RctRole}) ->
    logger:debug("给角色发送奖励:~w",
                 [{RoleId,
                   RolePid,
                   {rencounter_role,
                    callback,
                    [{combat_reward, RctRole, WinOrLose, GroupId}]}}],
                 rencounter_mgr,
                 1287),
    callback_role(RoleId,
                  RolePid,
                  {rencounter_role,
                   callback,
                   [{combat_reward, RctRole, WinOrLose, GroupId}]}),
    calc_combat_rewards(Rest, RctMatchRole, Args);
calc_combat_rewards([_Else | Rest], RctMatchRole,
                    Args) ->
    logger:error("未处理的战斗计算类型:~w",
                 [_Else],
                 rencounter_mgr,
                 1293),
    calc_combat_rewards(Rest, RctMatchRole, Args).

get_target_info(RoleId,
                #rencounter_match{match_roles = Roles}) ->
    case lists:keydelete(RoleId,
                         #rencounter_match_role.id,
                         Roles)
        of
        [Target] -> Target;
        _ -> #rencounter_match_role{}
    end.

keys() ->
    [{asc, #rencounter_role.update_best_star_time},
     #rencounter_role.star,
     #rencounter_role.rank_lev].

update_rank() ->
    logger:debug("进行排行=========", [], rencounter_mgr, 1310),
    L = ets:tab2list(rencounter_role),
    L1 = sort_rank(L),
    logger:debug("排行数据=========\n~w\n================",
                 [L1],
                 rencounter_mgr,
                 1313),
    dets:delete_all_objects(rencounter_rank),
    ets:delete_all_objects(rencounter_rank),
    ets:insert(rencounter_rank, L1),
    dets:insert(rencounter_rank, L1),
    big_world:cast(all,
                   rencounter_agent,
                   info,
                   [{update_rank, L1}]).

sort_rank(List) ->
    GroupList = group_role(List, []),
    RankList = sort_group(GroupList, []),
    RankList.

group_role([], GroupList) -> GroupList;
group_role([RctRole = #rencounter_role{lev = Lev,
                                       break_times = BreakTimes,
                                       season_join_times = SJTimes}
            | Rest],
           GroupList)
    when SJTimes > 0 ->
    GroupId = rencounter_data:get_group_id(Lev, BreakTimes),
    case lists:keyfind(GroupId, 1, GroupList) of
        {_, RctRoleList} ->
            NewGroupList = lists:keystore(GroupId,
                                          1,
                                          GroupList,
                                          {GroupId, [RctRole | RctRoleList]}),
            group_role(Rest, NewGroupList);
        _ ->
            NewGroupList = [{GroupId, [RctRole]} | GroupList],
            group_role(Rest, NewGroupList)
    end;
group_role([_ | Rest], GroupList) ->
    group_role(Rest, GroupList).

sort_group([], RankList) -> RankList;
sort_group([{GroupId, RctRoleList} | Rest], RankList) ->
    GroupSortList = lists:sublist(util:keys_sort(keys(),
                                                 RctRoleList),
                                  100),
    NewRankList = [{GroupId, GroupSortList} | RankList],
    sort_group(Rest, NewRankList).

reset_rank_lev() ->
    Now = date:unixtime(),
    Fun = fun (RctRole = #rencounter_role{rank_lev =
                                              RankLev,
                                          star = Star,
                                          season_join_times = SJTimes,
                                          season_win_times = SWTimes,
                                          season_lasted_win = SLWTimes},
               ok) ->
                  TotalStar = get_reset_total_star(RankLev, Star),
                  NewTotalStar = max(TotalStar - 15, 0),
                  ResetStart = case RankLev < 6 of
                                   true -> Star;
                                   _ -> 0
                               end,
                  {NewRankLev, NewStar} = add_star(RankLev,
                                                   ResetStart,
                                                   NewTotalStar - TotalStar),
                  NewRctRole = RctRole#rencounter_role{rank_lev =
                                                           NewRankLev,
                                                       star = NewStar,
                                                       total_star =
                                                           NewTotalStar,
                                                       best_rank = NewRankLev,
                                                       best_star = NewStar,
                                                       best_total_star =
                                                           NewTotalStar,
                                                       update_best_star_time =
                                                           Now,
                                                       win_lasted_times = 0,
                                                       last_result = 0,
                                                       season_join_times = 0,
                                                       season_win_times = 0,
                                                       season_lasted_win = 0,
                                                       last_join_times =
                                                           SJTimes,
                                                       last_win_times = SWTimes,
                                                       last_lasted_win =
                                                           SLWTimes,
                                                       has_get_rank =
                                                           NewRankLev,
                                                       join_times = 0,
                                                       max_joins = 4},
                  logger:debug("赛季重置后， 旧段位:~w,新段位：~w",
                               [RctRole, NewRctRole],
                               rencounter_mgr,
                               1360),
                  update_rencounter_role(NewRctRole),
                  ok;
              (_, ok) -> ok
          end,
    ets:foldl(Fun, ok, rencounter_role).

get_join_mode(active,
              #rencounter_role{join_times = Times,
                               max_joins = MaxJoins}) ->
    case Times >= MaxJoins of
        true -> 2;
        _ -> 1
    end;
get_join_mode(_, _) -> 2.

get_next_season_reset() ->
    Now = date:unixtime(),
    date:week_next_diff([1], Now, {0, 0, 2}).

get_season_time() ->
    Now = date:unixtime(),
    ResetTimes = env:get(rencounter_season_reset_times),
    NextResetSecs = date:week_next_diff([1],
                                        Now,
                                        {0, 0, 2}),
    EndTime = Now + NextResetSecs +
                  (3 - ResetTimes) * 604790,
    StartTime = EndTime - 2419200,
    {StartTime, EndTime}.

is_marvel(Round, WinRoles, LoseRoles) ->
    Round >= 8 andalso
        (check_in_rank(WinRoles) orelse
             check_in_rank(LoseRoles)).

check_in_rank([]) -> false;
check_in_rank([#fighter{origin_id = Fid, lev = Lev,
                        m_lev_break = #m_lev_break{times = BreakTimes}}
               | Rest]) ->
    GroupId = rencounter_data:get_group_id(Lev, BreakTimes),
    case catch ets:lookup(rencounter_rank, GroupId) of
        [{_, RankList}] ->
            case lists:keymember(Fid, #rencounter_role.id, RankList)
                of
                true -> true;
                false -> check_in_rank(Rest)
            end;
        _ -> check_in_rank(Rest)
    end.

send_best_rank_notice(RankLev,
                      #rencounter_match_role{id = {_, Platform, ZoneId},
                                             name = RoleName}) ->
    case RankLev of
        6 ->
            Msg =
                notice:format(lang:get("一战封神！~ts在~ts上十步一杀，击败无数强敌，终于登上失落神殿成为战神！"),
                              [{role_2, RoleName},
                               {string_2, 1, lang:get("英雄擂台")}]),
            big_world:cast(all, notice, cast, [all, 5, Msg]);
        5 ->
            Msg =
                notice:format(lang:get("势不可挡！~ts在~ts上力压群雄，登上了圣心城成为了一代宗师！"),
                              [{role_2, RoleName},
                               {string_2, 1, lang:get("英雄擂台")}]),
            big_world:cast(Platform,
                           ZoneId,
                           notice,
                           cast,
                           [all, 5, Msg]);
        4 ->
            Msg =
                notice:format(lang:get("勇不可当！~ts在~ts上力压群雄，登上了极北之域成为了一代豪杰！"),
                              [{role_2, RoleName},
                               {string_2, 1, lang:get("英雄擂台")}]),
            big_world:cast(Platform,
                           ZoneId,
                           notice,
                           cast,
                           [all, 5, Msg]);
        _ -> ok
    end.

