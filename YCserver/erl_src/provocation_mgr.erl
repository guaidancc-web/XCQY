-file("src/mod/provocation/provocation_mgr.erl", 1).

-module(provocation_mgr).

-behaviour(gen_server).

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

-file("src/mod/provocation/provocation_mgr.erl", 11).

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

-file("src/mod/provocation/provocation_mgr.erl", 12).

-file("inc/provocation.hrl", 1).

-record(m_provocation,
        {ver = 3,
         room_id = 0,
         book_id = 0,
         identity = 0,
         triggers = [],
         map_id = 0,
         room_check = 1,
         book_check = 0,
         video_check = 0,
         invited_list = [],
         published_list = [],
         pick_batch_list = [],
         pick_box_num = 0,
         pick_packet_num = 0}).

-record(provocation_room,
        {ver = 1,
         id = 0,
         pid = undefined :: pid(),
         name = [],
         room_lev_min = 0,
         min_lev_break = 0,
         room_lev_max = 200,
         max_lev_break = 1,
         master_fc = 0,
         mode = 1,
         password = [],
         status = 0,
         master_id = {0, "", 0},
         master_lev = 0,
         master_break = 0,
         master_name = [],
         master_sex = 0,
         master_class = 0,
         master_head = 0,
         customer_id = {0, "", 0},
         master_team_pid = undefined :: pid(),
         customer_team_pid = undefined :: pid(),
         last_vedio_id = {0, "", 0},
         provocation_type = 0,
         target_rival = {0, "", 0},
         target_name = [],
         make_horn_role = {0, "", 0},
         horn_name = [],
         horn_start_time = 0}).

-record(provocation_team,
        {ver = 1,
         team_formation = 0,
         team_formation_lev = 0,
         order = [],
         guards = [],
         team_mate = []}).

-record(provocation_fight_team,
        {leader_id = {0, "", 0}, fighters = []}).

-record(provocation_profile,
        {ver = 2,
         id = {0, "", 0},
         pid = undefined :: pid(),
         name = "",
         classes = 0,
         lev = 0,
         sex = 0,
         break_times = 0,
         fc = 0,
         looks = [] :: list(),
         head = 0,
         formation_id = 1 :: non_neg_integer(),
         formation_lev = 1 :: non_neg_integer(),
         guards = [],
         join_time = 0}).

-record(provocation_book,
        {ver = 1,
         id = 0,
         name = [],
         book_lev_min = 0,
         min_lev_break = 0,
         book_lev_max = 200,
         max_lev_break = 0,
         master_fc = 0,
         mode = 1,
         master_id = {0, "", 0},
         master_lev = 0,
         master_name = [],
         master_sex = 0,
         master_class = 0,
         master_head = 0,
         master_break = 0,
         live_status = 1,
         time_stamp = 0,
         provocation_type = 0}).

-record(provocation_fighter,
        {id = {0, "", 0} :: tuple(),
         name = "" :: string(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         kill_num = 0,
         dead_num = 0,
         total_heal = 0,
         control_num = 0,
         total_hurt = 0 :: non_neg_integer(),
         total_dmg = 0 :: non_neg_integer(),
         mvp_score = 0 :: non_neg_integer()}).

-record(provocation_result,
        {id = {0, "", 0},
         ver = 1,
         is_win = 1,
         mates = [],
         rival = [],
         match_id = 0,
         record_pz = {"", 0} :: tuple(),
         time = 0}).

-record(provocation_result_role,
        {id = {0, "", 0},
         ver = 1,
         recent = [],
         last_recent = []}).

-record(provocation_slices,
        {key = {0, 0}, role_list = []}).

-record(provocation_publish,
        {help_id = 0,
         msg_id = 0,
         record_id = 0,
         channel = 0,
         map_id = 0}).

-record(provocation_box,
        {map_id = 0,
         type = 0,
         batch_id = 0,
         time_stamp = 0,
         boxlist = []}).

-file("src/mod/provocation/provocation_mgr.erl", 13).

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

-file("src/mod/provocation/provocation_mgr.erl", 14).

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

-file("src/mod/provocation/provocation_mgr.erl", 15).

-file("inc/lev_break.hrl", 1).

-record(m_lev_break,
        {ver = 0,
         trial = 0 :: non_neg_integer(),
         done = 0 :: non_neg_integer(),
         times = 0 :: non_neg_integer(),
         attr_point = 0 :: non_neg_integer()}).

-file("src/mod/provocation/provocation_mgr.erl", 16).

-file("inc/battle.hrl", 1).

-record(battle_base,
        {id = 1 :: pos_integer(),
         type = 1 :: pos_integer(),
         sub_id = 0,
         sub_type = 0,
         name :: undefined | atom(),
         pid :: undefined | undefine | pid(),
         global = [] :: list(),
         map = [] :: list(),
         unit = [] :: list(),
         point = [] :: list(),
         trigger = [] :: list(),
         enter_point = {0, 0, 0} ::
             {non_neg_integer(),
              non_neg_integer(),
              non_neg_integer()}}).

-record(battle,
        {id = 1 :: pos_integer(),
         type = 1 :: pos_integer(),
         sub_id = 0,
         sub_type = 0,
         name :: undefined | atom(),
         pid :: undefined | undefine | pid(),
         map = [] :: list(),
         enter_point = {0, 0, 0} ::
             {non_neg_integer(),
              non_neg_integer(),
              non_neg_integer()},
         ext = [],
         role_id = {0, "", 0}}).

-record(battle_context,
        {grade = 1 :: pos_integer(),
         score = 0 :: non_neg_integer(),
         round = 0 :: non_neg_integer(),
         max_dmg = 0 :: non_neg_integer(),
         hurt = 0 :: non_neg_integer(),
         ratio_val = 0,
         die_num = 0}).

-record(battle_role,
        {id,
         status = 1,
         pid,
         name,
         sex = 0 :: 0..1,
         classes = 0 :: 0..6,
         lev = 0 :: non_neg_integer(),
         is_kill_boss = 0 :: 0..1,
         sub_id = 0 :: non_neg_integer(),
         flip_cards = [] :: [],
         has_reward_floor = [],
         context = #battle_context{}}).

-record(battle_combat_info,
        {sub_id = 0, sub_type = 0, gains = []}).

-record(battle_trigger,
        {name :: undefined | bitstring(),
         status = open :: open | close,
         event = [] :: [tuple()],
         vars = [] :: [tuple()],
         condition = [] :: [tuple()],
         action = [] :: list()}).

-record(tri_timer,
        {mode :: undefined | cycle | count,
         times = 0 :: integer(),
         timeout = 1000 :: pos_integer()}).

-record(cfg_act,
        {tpl :: undefined | atom(), cfg = [] :: list()}).

-record(tpl_act,
        {name = "" :: string(),
         type :: undefined | atom(),
         code = "" :: string(),
         args = [] :: list(),
         desc = "" :: string()}).

-record(cfg_cond,
        {tpl = "" :: string(), cfg = [] :: list()}).

-record(tpl_cond,
        {name = "" :: string(),
         code = "" :: string(),
         args = [] :: list(),
         desc = "" :: string()}).

-record(cfg_evt,
        {tpl = "" :: string(), cfg = [] :: list()}).

-record(tpl_evt,
        {name = "" :: string(),
         code = "" :: string(),
         args = [] :: list(),
         desc = "" :: string()}).

-record(cfg_val,
        {tpl = "" :: string(), cfg = [] :: list()}).

-record(tpl_val,
        {name = "" :: string(),
         code = "" :: string(),
         args = [] :: list(),
         desc = "" :: string()}).

-record(cfg_unit,
        {tpl = "" :: string(), cfg = [] :: list()}).

-record(tpl_unit,
        {name = "" :: string(),
         code = "" :: string(),
         args = [] :: list(),
         desc = "" :: string()}).

-record(point,
        {map = 1 :: pos_integer(),
         x = 0 :: non_neg_integer(),
         y = 0 :: non_neg_integer()}).

-record(tpl_fun,
        {name :: undefined | atom(),
         return :: undefined | unit | point,
         args = [] :: [atom()],
         code = "" :: string(),
         mfa_code = "" :: string(),
         label = "" :: string(),
         desc = "" :: string()}).

-file("src/mod/provocation/provocation_mgr.erl", 17).

-file("inc/map.hrl", 1).

-record(map,
        {id = 1 :: pos_integer(),
         platform = "" :: list(),
         zone_id = 0 :: non_neg_integer(),
         base_id = 1 :: pos_integer(),
         res_id = 0 :: non_neg_integer(),
         pid :: undefined | pid(),
         ctrl_pid :: undefined | pid(),
         grid_info = [] :: [{pid(), pos_integer()}],
         name = "" :: bitstring(),
         condition = [] :: list(),
         num = 0 :: non_neg_integer(),
         width = 1 :: pos_integer(),
         height = 1 :: pos_integer()}).

-record(map_grid,
        {map_pid :: undefined | pid(),
         map_id = 1 :: pos_integer(),
         base_id = 1 :: pos_integer(),
         width = 1 :: pos_integer(),
         height = 1 :: pos_integer()}).

-record(map_data,
        {id = 1 :: pos_integer(),
         name = "" :: list(),
         condition = [] :: [tuple()],
         revive = [] :: [tuple()],
         width = 1 :: pos_integer(),
         height = 1 :: pos_integer(),
         grid_x = 0 :: pos_integer(),
         grid_y = 0 :: pos_integer(),
         max_pre_layer = 60 :: pos_integer(),
         startup = 0 :: 0..1,
         is_single = 0 :: 0..1}).

-file("src/mod/provocation/provocation_mgr.erl", 18).

-file("inc/team.hrl", 1).

-record(team,
        {ver = 0,
         pid :: undefined | pid(),
         leader,
         members = [] :: list(),
         applys = [],
         pos :: undefined | tuple(),
         member_num = 1,
         status = 0,
         matched = 0 :: non_neg_integer(),
         is_fly = 0 :: 0 | 1,
         order = [],
         team_formation = 1,
         team_formation_lev = 1,
         usurpers = [],
         type = 0,
         lev_flag = 0,
         lev_min = 0,
         lev_max = 0,
         last_join_time = 0,
         combat_num = 0,
         chat_recruit_info = [],
         target = 0,
         cross_type = 0,
         dun_id = 0}).

-record(m_team,
        {ver = 0,
         pid :: undefined | pid(),
         status = 3 :: non_neg_integer(),
         applys = [],
         mod = 0,
         speed = 0,
         recruitment_time = 0,
         recruitment_ids = lists:seq(1, 5),
         recruitment = [],
         member_num = 0}).

-record(team_mate,
        {ver = 0,
         id = {0, "", 0},
         name = "",
         pid :: undefined | pid(),
         face_id = 0 :: non_neg_integer(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         lev_break_times = 0 :: non_neg_integer(),
         status = 3 :: non_neg_integer(),
         looks = [] :: list(),
         fc = 0 :: non_neg_integer(),
         expect_type = [] :: non_neg_integer(),
         s_ride = 0,
         team_pid :: undefined | pid(),
         matched = 0 :: non_neg_integer(),
         formation_id = 1,
         formation_lev = 1,
         mod = 0,
         speed = 0,
         join_type = 1,
         join_sub_type = 0,
         join_time = 0,
         combat_num = 0,
         constellation_lev = 0,
         lover_id = {0, "", 0},
         lover_name = "",
         lover_status = 0,
         quest_couple_round = 0}).

-record(team_recruitment,
        {ver = 0,
         id :: undefined | tuple(),
         name = "" :: string(),
         face_id = 0 :: non_neg_integer(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         pid,
         type = 0,
         status = 1,
         member_num = 1,
         inviter_status = 0,
         lev_min = 0,
         lev_max = 0,
         matched = 0 :: non_neg_integer(),
         notice_list = [] :: list(),
         cur_classes = [] :: list(),
         constellation_lev = 0,
         chat_recruit_info = [],
         lover_id = {0, "", 0},
         lover_name = "",
         lover_status = 0,
         quest_couple_round = 0,
         precision_notice_list = [] :: list(),
         cross_type = 0}).

-record(team_recruit_room,
        {lev = 0, role_num = 0, members = []}).

-record(team_usurper,
        {id = {0, "", 0} :: tuple(),
         name = "" :: string(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         leader_objected = 0 :: 0 | 1,
         total = 0 :: integer(),
         pros = 0 :: integer(),
         cons = 0 :: integer(),
         time = 0 :: integer(),
         voted_ids = []}).

-record(team_recruit_lev_range,
        {flag = 0, lev = 0, val1 = 0, val2 = 0}).

-record(team_start_args, {pos, is_fly = 0, target = 0}).

-file("src/mod/provocation/provocation_mgr.erl", 19).

-file("inc/pos.hrl", 1).

-record(pos_history,
        {map = 0 :: non_neg_integer(),
         platform = "" :: list(),
         zone_id = 0 :: non_neg_integer(),
         x = 0 :: non_neg_integer(),
         y = 0 :: non_neg_integer()}).

-record(pos,
        {map = 10001 :: non_neg_integer(),
         platform = "" :: list(),
         zone_id = 0 :: non_neg_integer(),
         last :: undefined | #pos_history{},
         map_base_id = 0 :: non_neg_integer(),
         map_pid = 0 :: non_neg_integer() | pid(),
         map_grid_pid = 0 :: non_neg_integer() | pid(),
         hidden = 1 :: 0 | 1,
         x = 0 :: non_neg_integer(),
         y = 0 :: non_neg_integer(),
         dir = 0 :: 0..255}).

-file("src/mod/provocation/provocation_mgr.erl", 20).

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

-file("src/mod/provocation/provocation_mgr.erl", 21).

-file("inc/item.hrl", 1).

-record(item_base,
        {id = 0 :: non_neg_integer(),
         name = "" :: list(),
         type = 0 :: non_neg_integer(),
         quality = 0 :: 0..4,
         overlap = 1 :: pos_integer(),
         look_id = 0 :: non_neg_integer(),
         use_type = 0 :: 0..4,
         expire_type = 0 :: non_neg_integer(),
         expire_time = 0 ::
             non_neg_integer() |
             {{pos_integer(), pos_integer(), pos_integer()},
              {non_neg_integer(),
               non_neg_integer(),
               non_neg_integer()}},
         attr = [] :: [tuple()],
         lev = 0,
         classes = 0,
         sex = 2,
         buy_source = [],
         condition = [] :: [tuple()],
         effect = [] :: [tuple()],
         alchemy = 0 :: non_neg_integer()}).

-record(item,
        {ver = 0 :: non_neg_integer(),
         id = 0 :: non_neg_integer(),
         base_id = 0 :: non_neg_integer(),
         bind = 1 :: 0 | 1,
         look_id = 0,
         type = 0 :: non_neg_integer(),
         use_type = 0 :: 0..4,
         quality = 0 :: 0..4,
         craft = 0 :: 0..5,
         enchant = -1 :: integer(),
         growth_lev = 0,
         growth_val = 0,
         step = 0 :: pos_integer(),
         quantity = 1 :: 0..250,
         pos = 0 :: non_neg_integer(),
         expire_type = 0 :: 0..4,
         expire_time = 0 :: non_neg_integer(),
         attr = [] :: [tuple()],
         reset_attr = [],
         lev = 1 :: pos_integer(),
         classes = 0 :: 0..6,
         sex = 2 :: 0..2,
         extra = [] :: [tuple()],
         data = [] :: [any()]}).

-record(item_extra_info, {source, price}).

-file("src/mod/provocation/provocation_mgr.erl", 22).

-record(state,
        {room_nextid = 1,
         room_list = [],
         map_list = [],
         match_id = 1,
         book_nextid = 1,
         book_list = [],
         box_list = [],
         box_id = 1}).

-export([init/1,
         handle_call/3,
         handle_cast/2,
         handle_info/2,
         terminate/2,
         code_change/3]).

-export([start_link/0,
         call/1,
         info/1,
         cast/1,
         combat_over/1]).

-export([gm_resetroom/0,
         gm_resetbook/0,
         gm_lookmap/0,
         gm_lookroom/0,
         gm_lookstate/0]).

-spec start_link() -> {ok, pid()} |
                      ignore |
                      {error, term()}.

start_link() ->
    gen_server:start_link({local, provocation_mgr},
                          provocation_mgr,
                          [],
                          []).

call(Info) ->
    case catch gen_server:call(provocation_mgr, Info, 10000)
        of
        {'EXIT', {timeout, _}} -> {error, timeout};
        {'EXIT', {noproc, _}} -> {error, noproc};
        {'EXIT', {normal, _}} -> {error, exit};
        {'EXIT', _Call_Err} -> {error, _Call_Err};
        _Call_Return -> _Call_Return
    end.

cast(Args) -> gen_server:cast(provocation_mgr, Args).

info(Args) -> provocation_mgr ! Args.

combat_over(#combat{winner = Winner, type = CombatType,
                    loser = Loser,
                    start_args = #combat_start_args{ext_args = ExtArgs},
                    round = Round}) ->
    WinnerF = [F
               || F = #fighter{type = Ftype} <- Winner,
                  Ftype == 1 orelse Ftype == 5],
    LoserF = [F
              || F = #fighter{type = Ftype} <- Loser,
                 Ftype == 1 orelse Ftype == 5],
    {MatchId, RoomId, PkType} = ExtArgs,
    PZ = cast_record(#{round => Round, winner => WinnerF,
                       loser => LoserF, record => combat_record:get_buffer(),
                       match_id => MatchId}),
    cast({combat_over, RoomId, MatchId, PZ, WinnerF}),
    cast({push_room_info, RoomId}),
    combat_statistics(#{winner => WinnerF,
                        combat_type => CombatType, loser => LoserF,
                        match_id => MatchId, round => Round, record_pz => PZ,
                        pk_type => PkType});
combat_over(_) -> skip.

init([]) ->
    logger:info("跨服约战管理器启动...", [], provocation_mgr, 92),
    process_flag(trap_exit, true),
    dets:open_file(provocation_profile,
                   [{file, "./dets/provocation_profile.dets"},
                    {keypos, #provocation_profile.id},
                    {type, set}]),
    ets:new(provocation_profile,
            [set,
             named_table,
             public,
             {keypos, #provocation_profile.id}]),
    dets:to_ets(provocation_profile, provocation_profile),
    dets:open_file(provocation_slices,
                   [{file, "./dets/provocation_slices.dets"},
                    {keypos, #provocation_slices.key},
                    {type, set}]),
    ets:new(provocation_slices,
            [set,
             named_table,
             public,
             {keypos, #provocation_slices.key}]),
    dets:to_ets(provocation_slices, provocation_slices),
    dets:open_file(provocation_fight_team_info,
                   [{file, "./dets/provocation_fight_team_info.dets"},
                    {keypos, #provocation_fight_team.leader_id},
                    {type, set}]),
    ets:new(provocation_fight_team_info,
            [set,
             named_table,
             public,
             {keypos, #provocation_fight_team.leader_id}]),
    dets:to_ets(provocation_fight_team_info,
                provocation_fight_team_info),
    load_data(),
    MapList = case map_mgr:create(53014) of
                  {ok, MapPid, MapId} ->
                      unit_mgr:create({56, 1}, 20072, {MapId, 1037, 690}),
                      [{MapId, MapPid, 0}];
                  _ ->
                      logger:error("生成地图失败", [], provocation_mgr, 116),
                      []
              end,
    NextId = case env:get(provocation_next_id) of
                 NId when is_integer(NId) -> NId;
                 _ ->
                     env:save(provocation_next_id, 1),
                     1
             end,
    logger:info("[~w] 启动完成...",
                [provocation_mgr],
                provocation_mgr,
                125),
    {ok, #state{map_list = MapList, match_id = NextId}}.

handle_call({enter, Num}, _From,
            State = #state{map_list = Maps}) ->
    {TransX, TransY} = case map_data:get(53014) of
                           {ok, #map_data{revive = Revive}} ->
                               case util:rand_list(Revive) of
                                   {X, Y} -> {X, Y};
                                   _ -> {1167, 723}
                               end;
                           _ -> {1167, 723}
                       end,
    {NMaps, EnterId} = case query_map_info(Maps,
                                           Num,
                                           {-1, -1, -1})
                           of
                           {-1, -1, -1} ->
                               case map_mgr:create(53014) of
                                   {ok, MapPid, MapId} ->
                                       unit_mgr:create({56, 1},
                                                       20072,
                                                       {MapId, 1037, 690}),
                                       {[{MapId, MapPid, Num} | Maps], MapId};
                                   _ ->
                                       logger:error("生成地图失败",
                                                    [],
                                                    provocation_mgr,
                                                    144),
                                       {Maps, 53014}
                               end;
                           {MapId, MapPid, ONum} ->
                               Maps2 = lists:keyreplace(MapId,
                                                        1,
                                                        Maps,
                                                        {MapId,
                                                         MapPid,
                                                         ONum + Num}),
                               {Maps2, MapId}
                       end,
    Reply = {ok,
             {env:get(platform),
              env:get(zone_id),
              EnterId,
              TransX,
              TransY}},
    {reply, Reply, State#state{map_list = NMaps}};
handle_call({exit, OMapId, Num}, _From,
            State = #state{map_list = Maps}) ->
    NMaps = case lists:keyfind(OMapId, 1, Maps) of
                {OMapId, MapPid, RoleNum} ->
                    case RoleNum - Num =< 0 of
                        true ->
                            case length(Maps) of
                                1 ->
                                    lists:keyreplace(OMapId,
                                                     1,
                                                     Maps,
                                                     {OMapId, MapPid, 0});
                                _ ->
                                    map:stop(MapPid),
                                    lists:keydelete(OMapId, 1, Maps)
                            end;
                        _ ->
                            lists:keyreplace(OMapId,
                                             1,
                                             Maps,
                                             {OMapId, MapPid, RoleNum - Num})
                    end;
                _ ->
                    logger:error("没找到该地图:~w",
                                 [OMapId],
                                 provocation_mgr,
                                 170),
                    Maps
            end,
    {MapId, X, Y} = util:rand_list([{10001, 306, 3507},
                                    {10001, 2583, 3848},
                                    {10001, 4957, 3680},
                                    {10001, 445, 2565},
                                    {10001, 4646, 704},
                                    {10001, 841, 1033},
                                    {10001, 2098, 1834},
                                    {10001, 3617, 1816}]),
    Reply = {ok,
             {env:get(platform), env:get(zone_id), MapId, X, Y}},
    {reply, Reply, State#state{map_list = NMaps}};
handle_call(refresh_rooms, _From,
            State = #state{room_list = RoomList}) ->
    {reply, {ok, RoomList}, State};
handle_call(refresh_books, _From,
            State = #state{book_list = BookList}) ->
    {reply, {ok, BookList}, State};
handle_call({create_room,
             #{room_name := RoomName, room_mode := RoomMode,
               room_lev_min := MinLev, min_lev_break := MinBreak,
               room_lev_max := MaxLev, max_lev_break := MaxBreak,
               master_fc := MasterFc, pass_word := PassWord,
               master_team_pid := MTeamPid, master_id := Id,
               master_lev := Lev, master_name := Name,
               master_sex := Sex, master_class := Classes,
               master_head := HeadId, break_times := BreakTimes,
               room_type := RoomType}},
            _From,
            State = #state{room_list = RoomList,
                           room_nextid = NextId}) ->
    NRoom = #provocation_room{id = NextId, name = RoomName,
                              mode = RoomMode, room_lev_min = MinLev,
                              min_lev_break = MinBreak, room_lev_max = MaxLev,
                              max_lev_break = MaxBreak, master_fc = MasterFc,
                              password = PassWord, master_team_pid = MTeamPid,
                              status = 1, master_id = Id, master_lev = Lev,
                              master_break = BreakTimes, master_name = Name,
                              master_sex = Sex, master_class = Classes,
                              master_head = HeadId,
                              provocation_type = RoomType},
    NRoomList = [NRoom | RoomList],
    logger:debug("~w", [NRoomList], provocation_mgr, 186),
    NewNextId = NextId + 1,
    push_all_20704(NRoom),
    Reply = {ok, NextId},
    {reply,
     Reply,
     State#state{room_list = NRoomList,
                 room_nextid = NewNextId}};
handle_call({create_book,
             #{book_name := BookName, book_mode := BookMode,
               book_lev_min := MinLev, min_lev_break := MinBreak,
               book_lev_max := MaxLev, max_lev_break := MaxBreak,
               break_times := BreakTimes, master_fc := MasterFc,
               master_id := Id, master_lev := Lev, master_name := Name,
               master_sex := Sex, master_class := Classes,
               master_head := HeadId,
               provocation_type := ProvocationType}},
            _From,
            State = #state{book_list = BookList,
                           book_nextid = NextId}) ->
    NBook = #provocation_book{id = NextId, name = BookName,
                              mode = BookMode, book_lev_min = MinLev,
                              min_lev_break = MinBreak, book_lev_max = MaxLev,
                              max_lev_break = MaxBreak, master_fc = MasterFc,
                              master_id = Id, master_lev = Lev,
                              master_break = BreakTimes, master_name = Name,
                              master_sex = Sex, master_class = Classes,
                              master_head = HeadId, live_status = 1,
                              time_stamp = date:unixtime2(),
                              provocation_type = ProvocationType},
    NBookList = [NBook | BookList],
    logger:debug("~w", [NBookList], provocation_mgr, 195),
    set_expire(),
    NewNextId = NextId + 1,
    Reply = {ok, NBook},
    {reply,
     Reply,
     State#state{book_list = NBookList,
                 book_nextid = NewNextId}};
handle_call({join_room, RoomId, Args}, _From,
            State = #state{room_list = RoomList}) ->
    {Reply, NState} = case lists:keytake(RoomId,
                                         #provocation_room.id,
                                         RoomList)
                          of
                          {value,
                           RoomInfo = #provocation_room{customer_id = CRid,
                                                        customer_team_pid =
                                                            CTPid},
                           Rest} ->
                              case CRid =:= {0, "", 0} andalso
                                       CTPid =:= undefined
                                  of
                                  true ->
                                      case check_room([password, lev],
                                                      RoomInfo,
                                                      Args)
                                          of
                                          true ->
                                              NRoomInfo =
                                                  RoomInfo#provocation_room{status
                                                                                =
                                                                                2,
                                                                            customer_team_pid
                                                                                =
                                                                                maps:get(customer_teamid,
                                                                                         Args),
                                                                            customer_id
                                                                                =
                                                                                maps:get(customer_id,
                                                                                         Args)},
                                              push_all_20704(NRoomInfo),
                                              {{ok, NRoomInfo},
                                               State#state{room_list =
                                                               [NRoomInfo
                                                                | Rest]}};
                                          {false, Reason} ->
                                              {{false, Reason}, State}
                                      end;
                                  _ ->
                                      {{false,
                                        lang:get("本房间满员，可加入或创建其他房间{face_1,3}")},
                                       State}
                              end;
                          _ -> {{false, lang:get("该房间已关闭")}, State}
                      end,
    {reply, Reply, NState};
handle_call({change_roominfo,
             Rid,
             RoomId,
             RoomName,
             RoomMode,
             MinLev,
             MinBreak,
             MaxLev,
             MaxBreak,
             PassWord,
             RoomType},
            _From, State = #state{room_list = RoomList}) ->
    {Reply, NState} = case lists:keytake(RoomId,
                                         #provocation_room.id,
                                         RoomList)
                          of
                          {value,
                           RoomInfo = #provocation_room{master_id = MRid,
                                                        status = Status,
                                                        provocation_type =
                                                            OType,
                                                        horn_start_time =
                                                            HornTime},
                           Rest} ->
                              case MRid =:= Rid of
                                  true ->
                                      case HornTime =/= 0 andalso
                                               OType =/= RoomType
                                          of
                                          true ->
                                              {{false,
                                                lang:get("已发起决斗邀请函，决斗结束前不能更改模式哟{face_1,2}")},
                                               State};
                                          _ ->
                                              NRoomInfo = case Status of
                                                              3 ->
                                                                  NewRoomInfo =
                                                                      RoomInfo#provocation_room{name
                                                                                                    =
                                                                                                    RoomName,
                                                                                                room_lev_min
                                                                                                    =
                                                                                                    MinLev,
                                                                                                room_lev_max
                                                                                                    =
                                                                                                    MaxLev,
                                                                                                min_lev_break
                                                                                                    =
                                                                                                    MinBreak,
                                                                                                max_lev_break
                                                                                                    =
                                                                                                    MaxBreak,
                                                                                                password
                                                                                                    =
                                                                                                    PassWord,
                                                                                                mode
                                                                                                    =
                                                                                                    RoomMode,
                                                                                                provocation_type
                                                                                                    =
                                                                                                    RoomType,
                                                                                                status
                                                                                                    =
                                                                                                    2},
                                                                  notice_room(NewRoomInfo,
                                                                              lang:get("房间信息变动，请重新准备")),
                                                                  NewRoomInfo;
                                                              _ ->
                                                                  RoomInfo#provocation_room{name
                                                                                                =
                                                                                                RoomName,
                                                                                            room_lev_min
                                                                                                =
                                                                                                MinLev,
                                                                                            room_lev_max
                                                                                                =
                                                                                                MaxLev,
                                                                                            min_lev_break
                                                                                                =
                                                                                                MinBreak,
                                                                                            max_lev_break
                                                                                                =
                                                                                                MaxBreak,
                                                                                            password
                                                                                                =
                                                                                                PassWord,
                                                                                            mode
                                                                                                =
                                                                                                RoomMode,
                                                                                            provocation_type
                                                                                                =
                                                                                                RoomType}
                                                          end,
                                              push_all_20704(NRoomInfo),
                                              {{ok, NRoomInfo},
                                               State#state{room_list =
                                                               [NRoomInfo
                                                                | Rest]}}
                                      end;
                                  false ->
                                      {{false, lang:get("不是房主，不能修改房间")}, State}
                              end;
                          _ -> {{false, lang:get("该房间已关闭")}, State}
                      end,
    {reply, Reply, NState};
handle_call({change_bookinfo,
             #{id := BookId, book_name := BookName,
               book_mode := BookMode, book_lev_min := MinLev,
               min_lev_break := MinBreak, book_lev_max := MaxLev,
               max_lev_break := MaxBreak, break_times := BreakTimes,
               master_fc := MasterFc, master_lev := Lev,
               master_name := Name, master_class := Classes,
               master_head := HeadId,
               provocation_type := ProvocationType}},
            _From, State = #state{book_list = BookList}) ->
    {Reply, NState} = case lists:keytake(BookId,
                                         #provocation_book.id,
                                         BookList)
                          of
                          {value, BookInfo = #provocation_book{}, Rest} ->
                              NBookInfo = BookInfo#provocation_book{name =
                                                                        BookName,
                                                                    mode =
                                                                        BookMode,
                                                                    book_lev_min
                                                                        =
                                                                        MinLev,
                                                                    min_lev_break
                                                                        =
                                                                        MinBreak,
                                                                    book_lev_max
                                                                        =
                                                                        MaxLev,
                                                                    max_lev_break
                                                                        =
                                                                        MaxBreak,
                                                                    master_fc =
                                                                        MasterFc,
                                                                    master_lev =
                                                                        Lev,
                                                                    master_break
                                                                        =
                                                                        BreakTimes,
                                                                    master_name
                                                                        = Name,
                                                                    master_class
                                                                        =
                                                                        Classes,
                                                                    master_head
                                                                        =
                                                                        HeadId,
                                                                    live_status
                                                                        = 1,
                                                                    time_stamp =
                                                                        date:unixtime2(),
                                                                    provocation_type
                                                                        =
                                                                        ProvocationType},
                              set_expire(),
                              {{ok, NBookInfo},
                               State#state{book_list = [NBookInfo | Rest]}};
                          _ -> {{false, lang:get("该战书已关闭")}, State}
                      end,
    {reply, Reply, NState};
handle_call({quest_roominfo, RoomId, Rid}, _From,
            State = #state{room_list = RoomList}) ->
    Reply = case lists:keyfind(RoomId,
                               #provocation_room.id,
                               RoomList)
                of
                RoomInfo = #provocation_room{} ->
                    case Rid =:= 0 of
                        true -> ok;
                        _ -> push_20704(Rid, RoomInfo)
                    end,
                    {ok, RoomInfo};
                _ -> {false, lang:get("该房间已关闭")}
            end,
    {reply, Reply, State};
handle_call({kick_rival, RoomId, KickRoleId, Rid},
            _From, State = #state{room_list = RoomList}) ->
    {Reply, NState} = case lists:keytake(RoomId,
                                         #provocation_room.id,
                                         RoomList)
                          of
                          {value,
                           RoomInfo = #provocation_room{master_id = MRid,
                                                        customer_id = CRid},
                           Rest} ->
                              case MRid =:= Rid of
                                  false ->
                                      {{false, lang:get("只有房主才能踢人")}, State};
                                  _ ->
                                      case CRid =:= KickRoleId of
                                          true ->
                                              NRoomInfo =
                                                  RoomInfo#provocation_room{customer_id
                                                                                =
                                                                                {0,
                                                                                 "",
                                                                                 0},
                                                                            customer_team_pid
                                                                                =
                                                                                undefined,
                                                                            status
                                                                                =
                                                                                1},
                                              push_all_20704(NRoomInfo),
                                              {{ok, NRoomInfo},
                                               State#state{room_list =
                                                               [NRoomInfo
                                                                | Rest]}};
                                          _ ->
                                              {{false,
                                                lang:get("已经离开房间了，不用踢了")},
                                               State}
                                      end
                              end;
                          _ -> {{false, lang:get("该房间已关闭")}, State}
                      end,
    {reply, Reply, NState};
handle_call({team_ready, RoomId, Rid}, _From,
            State = #state{room_list = RoomList}) ->
    {Reply, NState} = case lists:keytake(RoomId,
                                         #provocation_room.id,
                                         RoomList)
                          of
                          {value,
                           RoomInfo = #provocation_room{customer_id = CRid},
                           Rest} ->
                              case CRid =:= Rid of
                                  false ->
                                      {{false, lang:get("只有队长才能准备")}, State};
                                  _ ->
                                      NRoomInfo =
                                          RoomInfo#provocation_room{status = 3},
                                      push_all_20704(NRoomInfo),
                                      {{ok, NRoomInfo},
                                       State#state{room_list =
                                                       [NRoomInfo | Rest]}}
                              end;
                          _ -> {{false, lang:get("该房间已关闭")}, State}
                      end,
    {reply, Reply, NState};
handle_call({start_combat, Rid, RoomId}, _From,
            State = #state{room_list = RoomList,
                           match_id = MatchId}) ->
    {Reply, NState} = case lists:keytake(RoomId,
                                         #provocation_room.id,
                                         RoomList)
                          of
                          {value,
                           RoomInfo = #provocation_room{master_id = MRid,
                                                        status = Status,
                                                        customer_id = CRid,
                                                        provocation_type =
                                                            Type},
                           Rest} ->
                              case MRid =:= Rid of
                                  false ->
                                      {{false, lang:get("只有房主才能开始")}, State};
                                  _ ->
                                      case Status =:= 3 of
                                          true ->
                                              AtkFighters = case
                                                                ets:lookup(provocation_fight_team_info,
                                                                           MRid)
                                                                of
                                                                [#provocation_fight_team{fighters
                                                                                             =
                                                                                             Fighters1}] ->
                                                                    Fighters1;
                                                                [] -> []
                                                            end,
                                              DfdFighters = case
                                                                ets:lookup(provocation_fight_team_info,
                                                                           CRid)
                                                                of
                                                                [#provocation_fight_team{fighters
                                                                                             =
                                                                                             Fighters2}] ->
                                                                    Fighters2;
                                                                [] -> []
                                                            end,
                                              case AtkFighters =:= [] orelse
                                                       DfdFighters =:= []
                                                  of
                                                  true ->
                                                      {{false,
                                                        lang:get("出战信息发生变动，请重新开始")},
                                                       State};
                                                  _ ->
                                                      StartArgs =
                                                          #combat_start_args{ext_args
                                                                                 =
                                                                                 {MatchId,
                                                                                  RoomId,
                                                                                  Type}},
                                                      case
                                                          combat_mgr:start_combat(115,
                                                                                  AtkFighters,
                                                                                  DfdFighters,
                                                                                  StartArgs)
                                                          of
                                                          {ok, Pid} ->
                                                              NRoomInfo =
                                                                  RoomInfo#provocation_room{pid
                                                                                                =
                                                                                                Pid,
                                                                                            status
                                                                                                =
                                                                                                4},
                                                              env:save(provocation_next_id,
                                                                       MatchId +
                                                                           1),
                                                              {ok,
                                                               State#state{room_list
                                                                               =
                                                                               [NRoomInfo
                                                                                | Rest],
                                                                           match_id
                                                                               =
                                                                               MatchId
                                                                                   +
                                                                                   1}};
                                                          _ ->
                                                              {{false,
                                                                lang:get("对方正忙，发起战斗失败")},
                                                               State}
                                                      end
                                              end;
                                          _ ->
                                              {{false,
                                                lang:get("对方还没有准备，不能开始")},
                                               State}
                                      end
                              end;
                          _ -> {{false, lang:get("该房间已关闭")}, State}
                      end,
    {reply, Reply, NState};
handle_call({cancel_ready, RoomId, Rid}, _From,
            State = #state{room_list = RoomList}) ->
    {Reply, NState} = case lists:keytake(RoomId,
                                         #provocation_room.id,
                                         RoomList)
                          of
                          {value,
                           RoomInfo = #provocation_room{customer_id = CRid,
                                                        status = Status,
                                                        provocation_type =
                                                            Type},
                           Rest} ->
                              case Status of
                                  3 ->
                                      case CRid =:= Rid of
                                          false ->
                                              {{false, lang:get("只有队长才能取消准备")},
                                               State};
                                          _ ->
                                              NRoomInfo =
                                                  RoomInfo#provocation_room{status
                                                                                =
                                                                                2},
                                              push_all_20704(NRoomInfo),
                                              {{ok, NRoomInfo, Type},
                                               State#state{room_list =
                                                               [NRoomInfo
                                                                | Rest]}}
                                      end;
                                  _ ->
                                      {{false, lang:get("不在准备状态，不用取消准备")},
                                       State}
                              end;
                          _ -> {{false, lang:get("该房间已关闭")}, State}
                      end,
    {reply, Reply, NState};
handle_call({login_book, Rid, BookId}, _From,
            State = #state{book_list = BookList}) ->
    {Reply, NState} = case lists:keytake(BookId,
                                         #provocation_book.id,
                                         BookList)
                          of
                          {value,
                           BookInfo = #provocation_book{master_id = MRid},
                           Rest} ->
                              case MRid =:= Rid of
                                  true ->
                                      NBookInfo =
                                          BookInfo#provocation_book{live_status
                                                                        = 1},
                                      {ok,
                                       State#state{book_list =
                                                       [NBookInfo | Rest]}};
                                  _ ->
                                      logger:error("战书拥有者出错~w,~w",
                                                   [Rid, MRid],
                                                   provocation_mgr,
                                                   376),
                                      {false, State}
                              end;
                          _ -> {false, State}
                      end,
    {reply, Reply, NState};
handle_call({recommend_rival, GroupLev, FcGroup, MyId},
            _From, State) ->
    NList = get_recommend(GroupLev, FcGroup, MyId, 20),
    FList = provocation_util:make_friend_data(NList, []),
    logger:debug("~w", [FList], provocation_mgr, 387),
    {reply, FList, State};
handle_call({recent_role, FighterList}, _From, State) ->
    FList = provocation_util:make_friend_data(FighterList,
                                              []),
    {reply, FList, State};
handle_call({send_book, GroupLev, FcGroup, MyId}, _From,
            State) ->
    RidList = get_recommend(GroupLev, FcGroup, MyId, 10),
    RList = [begin
                 RName = case ets:lookup(provocation_profile, Rid) of
                             [#provocation_profile{name = Name}] -> Name;
                             _ -> []
                         end,
                 {Rid, RName}
             end
             || Rid <- RidList],
    logger:debug("~w", [RList], provocation_mgr, 402),
    {reply, RList, State};
handle_call({get_provocation_profile, Id}, _From,
            State) ->
    Data = case ets:lookup(provocation_profile, Id) of
               [PP = #provocation_profile{}] -> PP;
               _ -> false
           end,
    {reply, Data, State};
handle_call({check_box, MapId, UnitId}, _From,
            State = #state{box_list = BoxList}) ->
    NBoxList = [PB
                || PB = #provocation_box{map_id = MapId2} <- BoxList,
                   MapId2 =:= MapId],
    Data = find_box_unit(UnitId, NBoxList),
    {reply, Data, State};
handle_call({make_red_packet,
             _WinRid = {_, WP, WZ},
             Name,
             _LossRid = {_, LP, LZ}},
            _From, State) ->
    logger:debug("~w", [_LossRid], provocation_mgr, 422),
    {Data, State1} = case cross_arena_data:get(2) of
                         {{BoxId, _}, _} ->
                             Msg =
                                 notice:format(lang:get("~ts豪气冲天，决斗获胜后激情澎湃，在跨服约战场景中洒下了红包雨{face_1,10}{f"
                                                        "ace_1,10}{face_1,10} ~ts"),
                                               [{role_2, Name},
                                                {action_1,
                                                 lang:get("前往拾取"),
                                                 1,
                                                 1}]),
                             make_cast_system(Msg, WP, WZ, LP, LZ),
                             BoxName = util:flist("~ts的红包", [Name]),
                             set_expire_box(),
                             {true,
                              create_map_box(State, BoxId, 1, BoxName, 2)};
                         _ERR ->
                             logger:debug("~w", [_ERR], provocation_mgr, 431),
                             {false, State}
                     end,
    {reply, Data, State1};
handle_call(gm_lookstate, _From, State) ->
    {reply, State, State};
handle_call(_Request, _From, State) -> {noreply, State}.

handle_cast({push_room_info, RoomId},
            State = #state{room_list = RoomList}) ->
    case lists:keyfind(RoomId,
                       #provocation_room.id,
                       RoomList)
        of
        RoomInfo = #provocation_room{master_id = MRid,
                                     customer_id = CRid,
                                     master_team_pid = MTPid,
                                     customer_team_pid = CTPid} ->
            Data = provocation_util:make_room_info(RoomInfo),
            logger:debug("~w", [Data], provocation_mgr, 447),
            push_team_20704(MTPid, MRid, Data),
            push_team_20704(CTPid, CRid, Data);
        _ ->
            logger:debug("该房间已关闭~w",
                         [RoomId],
                         provocation_mgr,
                         451),
            ok
    end,
    {noreply, State};
handle_cast({revoke_bookinfo, BookId},
            State = #state{book_list = BookList}) ->
    NBookList = lists:keydelete(BookId,
                                #provocation_book.id,
                                BookList),
    {noreply, State#state{book_list = NBookList}};
handle_cast({change_room_mod,
             RoomId,
             Rid,
             1,
             Mode,
             TeamPId},
            State = #state{room_list = RoomList}) ->
    NRoomList = case lists:keytake(RoomId,
                                   #provocation_room.id,
                                   RoomList)
                    of
                    {value,
                     RoomInfo = #provocation_room{master_id = MRid},
                     Rest} ->
                        NRoomInfo = case Rid =:= MRid of
                                        true ->
                                            RoomInfo#provocation_room{mode =
                                                                          Mode,
                                                                      master_team_pid
                                                                          =
                                                                          TeamPId};
                                        _ ->
                                            logger:error("不是房主~w",
                                                         [Rid],
                                                         provocation_mgr,
                                                         468),
                                            RoomInfo
                                    end,
                        push_all_20704(NRoomInfo),
                        [NRoomInfo | Rest];
                    _ ->
                        logger:error("没找到房间~w", [RoomId], provocation_mgr, 474),
                        RoomList
                end,
    {noreply, State#state{room_list = NRoomList}};
handle_cast({change_room_mod,
             RoomId,
             Rid,
             2,
             _Mode,
             TeamPId},
            State = #state{room_list = RoomList}) ->
    NRoomList = case lists:keytake(RoomId,
                                   #provocation_room.id,
                                   RoomList)
                    of
                    {value,
                     RoomInfo = #provocation_room{customer_id = CRid},
                     Rest} ->
                        NRoomInfo = case Rid =:= CRid of
                                        true ->
                                            RoomInfo#provocation_room{customer_team_pid
                                                                          =
                                                                          TeamPId};
                                        _ ->
                                            logger:error("不是客队队长~w",
                                                         [Rid],
                                                         provocation_mgr,
                                                         485),
                                            RoomInfo
                                    end,
                        push_all_20704(NRoomInfo),
                        [NRoomInfo | Rest];
                    _ ->
                        logger:error("没找到房间~w", [RoomId], provocation_mgr, 491),
                        RoomList
                end,
    {noreply, State#state{room_list = NRoomList}};
handle_cast({take_over_team,
             RoomId,
             Rid,
             TPid,
             Identity},
            State = #state{room_list = RoomList}) ->
    NRoomList = case lists:keytake(RoomId,
                                   #provocation_room.id,
                                   RoomList)
                    of
                    {value,
                     RoomInfo = #provocation_room{make_horn_role = HornRole},
                     Rest} ->
                        NRoomInfo = case Identity of
                                        1 ->
                                            RoomInfo1 = case HornRole =/=
                                                                 {0, "", 0}
                                                            of
                                                            true ->
                                                                case
                                                                    check_role_in_team(TPid,
                                                                                       HornRole)
                                                                    of
                                                                    true ->
                                                                        RoomInfo;
                                                                    _ ->
                                                                        make_cancle_mail(RoomInfo),
                                                                        clean_room_horn(RoomInfo)
                                                                end;
                                                            _ -> RoomInfo
                                                        end,
                                            case ets:lookup(provocation_profile,
                                                            Rid)
                                                of
                                                [#provocation_profile{name =
                                                                          Name,
                                                                      classes =
                                                                          Classes,
                                                                      lev = Lev,
                                                                      sex = Sex,
                                                                      fc = Fc,
                                                                      head =
                                                                          HeadId,
                                                                      break_times
                                                                          =
                                                                          BreakTimes}] ->
                                                    RoomInfo1#provocation_room{master_fc
                                                                                   =
                                                                                   Fc,
                                                                               master_id
                                                                                   =
                                                                                   Rid,
                                                                               master_lev
                                                                                   =
                                                                                   Lev,
                                                                               master_name
                                                                                   =
                                                                                   Name,
                                                                               master_sex
                                                                                   =
                                                                                   Sex,
                                                                               master_class
                                                                                   =
                                                                                   Classes,
                                                                               master_head
                                                                                   =
                                                                                   HeadId,
                                                                               master_break
                                                                                   =
                                                                                   BreakTimes,
                                                                               master_team_pid
                                                                                   =
                                                                                   TPid};
                                                _ ->
                                                    logger:error("没有找到玩家档案~w",
                                                                 [Rid],
                                                                 provocation_mgr,
                                                                 517),
                                                    RoomInfo1
                                            end;
                                        2 ->
                                            NewRoomInfo =
                                                RoomInfo#provocation_room{customer_id
                                                                              =
                                                                              Rid,
                                                                          customer_team_pid
                                                                              =
                                                                              TPid,
                                                                          status
                                                                              =
                                                                              2},
                                            notice_room(NewRoomInfo,
                                                        lang:get("房间信息变动，请重新准备")),
                                            NewRoomInfo;
                                        _ -> RoomInfo
                                    end,
                        push_all_20704(NRoomInfo),
                        [NRoomInfo | Rest];
                    _ ->
                        logger:info("没找到房间~w", [RoomId], provocation_mgr, 529),
                        RoomList
                end,
    {noreply, State#state{room_list = NRoomList}};
handle_cast({team_leave_room, RoomId, RId, 1},
            State = #state{room_list = RoomList}) ->
    logger:debug("===", [], provocation_mgr, 536),
    NRoomList = case lists:keytake(RoomId,
                                   #provocation_room.id,
                                   RoomList)
                    of
                    {value,
                     RoomInfo = #provocation_room{master_id = RId,
                                                  customer_id = CRid,
                                                  customer_team_pid = CTPid},
                     Rest} ->
                        case CRid =:= {0, "", 0} of
                            true -> Rest;
                            _ ->
                                logger:debug("===", [], provocation_mgr, 542),
                                make_cancle_mail(RoomInfo),
                                case ets:lookup(provocation_profile, CRid) of
                                    [#provocation_profile{name = Name,
                                                          classes = Classes,
                                                          lev = Lev, sex = Sex,
                                                          fc = Fc,
                                                          head = HeadId}] ->
                                        NRoomInfo =
                                            RoomInfo#provocation_room{master_fc
                                                                          = Fc,
                                                                      status =
                                                                          1,
                                                                      master_id
                                                                          =
                                                                          CRid,
                                                                      master_lev
                                                                          = Lev,
                                                                      master_name
                                                                          =
                                                                          Name,
                                                                      master_sex
                                                                          = Sex,
                                                                      master_class
                                                                          =
                                                                          Classes,
                                                                      master_head
                                                                          =
                                                                          HeadId,
                                                                      customer_id
                                                                          =
                                                                          {0,
                                                                           "",
                                                                           0},
                                                                      customer_team_pid
                                                                          =
                                                                          undefined,
                                                                      master_team_pid
                                                                          =
                                                                          CTPid},
                                        NRoomInfo2 = clean_room_horn(NRoomInfo),
                                        role:apply(async,
                                                   CRid,
                                                   {provocation_role,
                                                    role_callback,
                                                    [take_over_room]}),
                                        push_team_20704(CTPid,
                                                        CRid,
                                                        provocation_util:make_room_info(NRoomInfo2)),
                                        [NRoomInfo2 | Rest];
                                    _ ->
                                        logger:error("没有找到玩家档案~w",
                                                     [CRid],
                                                     provocation_mgr,
                                                     553),
                                        Rest
                                end
                        end;
                    {value,
                     RoomInfo = #provocation_room{master_id = _MId},
                     Rest} ->
                        logger:debug("异常调用，房主id不对，调用者：~w,实际者:~w",
                                     [RId, _MId],
                                     provocation_mgr,
                                     558),
                        [RoomInfo | Rest];
                    _ ->
                        logger:info("房间已关闭", [], provocation_mgr, 561),
                        RoomList
                end,
    {noreply, State#state{room_list = NRoomList}};
handle_cast({team_leave_room, RoomId, RId, 2},
            State = #state{room_list = RoomList}) ->
    logger:debug("===", [], provocation_mgr, 566),
    NRoomList = case lists:keytake(RoomId,
                                   #provocation_room.id,
                                   RoomList)
                    of
                    {value,
                     RoomInfo = #provocation_room{master_id = MRId,
                                                  customer_id = RId,
                                                  master_team_pid = MTPid},
                     Rest} ->
                        case MRId =:= {0, "", 0} of
                            true -> Rest;
                            _ ->
                                logger:debug("===", [], provocation_mgr, 572),
                                NRoomInfo = RoomInfo#provocation_room{status =
                                                                          1,
                                                                      customer_id
                                                                          =
                                                                          {0,
                                                                           "",
                                                                           0},
                                                                      customer_team_pid
                                                                          =
                                                                          undefined},
                                push_team_20704(MTPid,
                                                MRId,
                                                provocation_util:make_room_info(NRoomInfo)),
                                [NRoomInfo | Rest]
                        end;
                    {value,
                     RoomInfo = #provocation_room{customer_id = _CId},
                     Rest} ->
                        logger:debug("异常调用，调用者id不对，调用者：~w,实际者:~w",
                                     [RId, _CId],
                                     provocation_mgr,
                                     578),
                        [RoomInfo | Rest];
                    _ ->
                        logger:info("房间已关闭", [], provocation_mgr, 581),
                        RoomList
                end,
    {noreply, State#state{room_list = NRoomList}};
handle_cast({update_role_profile,
             Info = #provocation_profile{id = Id},
             PushFlag},
            State) ->
    case ets:lookup(provocation_profile, Id) of
        [] ->
            case provocation_util:make_slices_roles(Info) of
                NInfo = #provocation_slices{} ->
                    update_provocation_slices(NInfo);
                _ -> ok
            end;
        [#provocation_profile{lev = Lev, fc = Fc,
                              break_times = BreakTimes}] ->
            case provocation_util:replace_slices_roles(Lev,
                                                       Fc,
                                                       BreakTimes,
                                                       Info)
                of
                NInfo = #provocation_slices{} ->
                    update_provocation_slices(NInfo);
                _ -> ok
            end
    end,
    update_provocation_profile(Info),
    case PushFlag of
        {push, RoomId} -> cast({push_room_info, RoomId});
        _ -> ok
    end,
    {noreply, State};
handle_cast({update_fight_team,
             Fighters = #provocation_fight_team{}},
            State) ->
    update_provocation_fight_team_info(Fighters),
    {noreply, State};
handle_cast({combat_over,
             RoomId,
             MatchId,
             {Platform, ZoneId},
             WinnerF},
            State = #state{room_list = RoomList}) ->
    NState = case lists:keytake(RoomId,
                                #provocation_room.id,
                                RoomList)
                 of
                 {value,
                  RoomInfo = #provocation_room{master_id =
                                                   MRid = {_, MP, MZ},
                                               master_name = MName,
                                               customer_id = CRid = {_, CP, CZ},
                                               provocation_type = Type,
                                               make_horn_role =
                                                   HornRole = {_, HP, HZ},
                                               horn_name = HornName,
                                               target_rival =
                                                   TargetRid = {_, TP, TZ},
                                               target_name = TargetName,
                                               horn_start_time = HornTime},
                  Rest} ->
                     NRoomInfo = RoomInfo#provocation_room{status = 2,
                                                           pid = undefined,
                                                           last_vedio_id =
                                                               {MatchId,
                                                                Platform,
                                                                ZoneId}},
                     case Type of
                         1 ->
                             WinName = case lists:keyfind(MRid,
                                                          #fighter.origin_id,
                                                          WinnerF)
                                           of
                                           #fighter{} ->
                                               case HornTime =/= 0 andalso
                                                        HornRole =/= {0, "", 0}
                                                   of
                                                   true ->
                                                       Msg1 =
                                                           notice:format(lang:get("威武霸气！~ts在自己发起的擂台决斗中大获全胜，败方心服口服{face_1,43}{fac"
                                                                                  "e_1,43}"),
                                                                         [{role_2,
                                                                           HornName}]),
                                                       make_cast_scroll(Msg1,
                                                                        HP,
                                                                        HZ,
                                                                        TP,
                                                                        TZ),
                                                       make_horn_mail(HornRole);
                                                   _ -> ok
                                               end,
                                               Msg =
                                                   notice:format(lang:get("~ts{string_2, #ffff00, 在跨服决斗中大获全胜，获得了}~ts{str"
                                                                          "ing_2, #ffff00, 和}~ts{string_2, #ffff00, "
                                                                          "约战场景已刷出胜利宝箱}{face_1,25}\n~ts"),
                                                                 [{role_2,
                                                                   MName},
                                                                  {item_2,
                                                                   24046},
                                                                  {item_2,
                                                                   70150},
                                                                  {action_1,
                                                                   lang:get("前往拾取"),
                                                                   1,
                                                                   1}]),
                                               make_cast_world(Msg,
                                                               MP,
                                                               MZ,
                                                               CP,
                                                               CZ),
                                               make_duel_mail(MRid,
                                                              CRid,
                                                              MName),
                                               MName;
                                           _ ->
                                               case HornTime =/= 0 andalso
                                                        TargetRid =/= {0, "", 0}
                                                   of
                                                   true ->
                                                       Msg1 =
                                                           notice:format(lang:get("不惧挑战！~ts接受了他人的擂台决斗并大获全胜，吃瓜群众一片喝彩{face_1,18}"),
                                                                         [{role_2,
                                                                           TargetName}]),
                                                       make_cast_scroll(Msg1,
                                                                        TP,
                                                                        TZ,
                                                                        HP,
                                                                        HZ),
                                                       make_horn_mail(TargetRid);
                                                   _ -> ok
                                               end,
                                               CName = case
                                                           ets:lookup(provocation_profile,
                                                                      CRid)
                                                           of
                                                           [#provocation_profile{name
                                                                                     =
                                                                                     Name}] ->
                                                               Name;
                                                           _ -> lang:get("神秘高手")
                                                       end,
                                               Msg =
                                                   notice:format(lang:get("~ts{string_2, #ffff00, 在跨服决斗中大获全胜，获得了}~ts{str"
                                                                          "ing_2, #ffff00, 和}~ts{string_2, #ffff00, "
                                                                          "约战场景已刷出胜利宝箱}{face_1,25}~ts"),
                                                                 [{role_2,
                                                                   CName},
                                                                  {item_2,
                                                                   24046},
                                                                  {item_2,
                                                                   70150},
                                                                  {action_1,
                                                                   lang:get("前往拾取"),
                                                                   1,
                                                                   1}]),
                                               make_cast_world(Msg,
                                                               CP,
                                                               CZ,
                                                               MP,
                                                               MZ),
                                               make_duel_mail(CRid,
                                                              MRid,
                                                              CName),
                                               CName
                                       end,
                             State1 = case cross_arena_data:get(1) of
                                          {{BoxId, _}, _} ->
                                              set_expire_box(),
                                              BoxName = util:flist("~ts的宝箱",
                                                                   [WinName]),
                                              create_map_box(State,
                                                             BoxId,
                                                             1,
                                                             BoxName,
                                                             1);
                                          _ -> State
                                      end,
                             NRoomInfo2 = clean_room_horn(NRoomInfo),
                             push_all_20704(NRoomInfo2),
                             State1#state{room_list = [NRoomInfo2 | Rest]};
                         _ ->
                             push_all_20704(NRoomInfo),
                             State#state{room_list = [NRoomInfo | Rest]}
                     end;
                 _ ->
                     logger:info("房间已关闭", [], provocation_mgr, 671),
                     State
             end,
    {noreply, NState};
handle_cast({pick_box, MapId, UnitId = {Bid, NumId}},
            State = #state{box_list = BoxList}) ->
    NBoxList = [begin
                    NewUnitId = {Bid, NumId - MapId * 100 + MapId2 * 100},
                    NList = case lists:member(NewUnitId, List) of
                                true ->
                                    case NewUnitId =/= UnitId of
                                        true -> unit_mgr:remove(NewUnitId);
                                        false -> ok
                                    end,
                                    lists:delete(NewUnitId, List);
                                _ -> List
                            end,
                    PB#provocation_box{boxlist = NList}
                end
                || PB = #provocation_box{map_id = MapId2,
                                         boxlist = List}
                       <- BoxList],
    {noreply, State#state{box_list = NBoxList}};
handle_cast({logout_book, BookId, Rid},
            State = #state{book_list = BookList}) ->
    NBookList = case lists:keytake(BookId,
                                   #provocation_book.id,
                                   BookList)
                    of
                    {value,
                     BookInfo = #provocation_book{master_id = MRid},
                     Rest} ->
                        case MRid =:= Rid of
                            true ->
                                NBookInfo =
                                    BookInfo#provocation_book{live_status = 0},
                                [NBookInfo | Rest];
                            _ ->
                                logger:error("战书拥有者出错~w,~w",
                                             [Rid, MRid],
                                             provocation_mgr,
                                             699),
                                BookList
                        end;
                    _ ->
                        logger:debug("战书已过期", [], provocation_mgr, 703),
                        BookList
                end,
    {noreply, State#state{book_list = NBookList}};
handle_cast({target,
             Rid,
             TargetRid,
             HornName,
             TargetName,
             RoomId},
            State = #state{room_list = RoomList}) ->
    NRoomList = case lists:keytake(RoomId,
                                   #provocation_room.id,
                                   RoomList)
                    of
                    {value, RoomInfo = #provocation_room{}, Rest} ->
                        NRoomInfo = RoomInfo#provocation_room{target_rival =
                                                                  TargetRid,
                                                              target_name =
                                                                  TargetName,
                                                              make_horn_role =
                                                                  Rid,
                                                              horn_name =
                                                                  HornName,
                                                              horn_start_time =
                                                                  date:unixtime()},
                        set_expire_horn(),
                        push_all_20704(NRoomInfo),
                        [NRoomInfo | Rest];
                    _ ->
                        logger:error("房间信息出错~w",
                                     [RoomId],
                                     provocation_mgr,
                                     717),
                        RoomList
                end,
    {noreply, State#state{room_list = NRoomList}};
handle_cast({cancle_room_horn, RoomId},
            State = #state{room_list = RoomList}) ->
    NRoomList = case lists:keytake(RoomId,
                                   #provocation_room.id,
                                   RoomList)
                    of
                    {value, RoomInfo = #provocation_room{}, Rest} ->
                        make_cancle_mail(RoomInfo),
                        NRoomInfo = clean_room_horn(RoomInfo),
                        push_all_20704(NRoomInfo),
                        notice_room(NRoomInfo,
                                    lang:get("队伍人数变动，请重新确认准备{face_1,7}")),
                        [NRoomInfo | Rest];
                    _ ->
                        logger:error("房间信息出错~w",
                                     [RoomId],
                                     provocation_mgr,
                                     731),
                        RoomList
                end,
    {noreply, State#state{room_list = NRoomList}};
handle_cast({cancle_room_ready, RoomId},
            State = #state{room_list = RoomList}) ->
    NRoomList = case lists:keytake(RoomId,
                                   #provocation_room.id,
                                   RoomList)
                    of
                    {value, RoomInfo = #provocation_room{}, Rest} ->
                        NRoomInfo = RoomInfo#provocation_room{status = 2},
                        push_all_20704(NRoomInfo),
                        [NRoomInfo | Rest];
                    _ ->
                        logger:error("房间信息出错~w",
                                     [RoomId],
                                     provocation_mgr,
                                     743),
                        RoomList
                end,
    {noreply, State#state{room_list = NRoomList}};
handle_cast(gm_resetroom, State) ->
    {noreply, State#state{room_list = [], room_nextid = 1}};
handle_cast(gm_resetbook, State) ->
    {noreply, State#state{book_list = [], book_nextid = 1}};
handle_cast(gm_lookmap,
            State = #state{map_list = MapList}) ->
    logger:info("~w", [MapList], provocation_mgr, 755),
    {noreply, State};
handle_cast(gm_lookroom,
            State = #state{room_list = RoomList}) ->
    logger:info("~w", [RoomList], provocation_mgr, 759),
    {noreply, State};
handle_cast(_Msg, State) ->
    logger:error("收到未知消息:~w", [_Msg], provocation_mgr, 763),
    {noreply, State}.

handle_info(expire_book,
            State = #state{book_list = BookList}) ->
    case get(expire_book_ref) of
        undefined -> ignore;
        OldRef when is_reference(OldRef) ->
            erlang:cancel_timer(OldRef)
    end,
    Now = date:unixtime(),
    NBookList = case [Book
                      || Book = #provocation_book{time_stamp = Time}
                             <- BookList,
                         Time + 2 * 24 * 3600 =< Now]
                    of
                    [] -> BookList;
                    ExpireBookList when is_list(ExpireBookList) ->
                        [role:apply(async,
                                    Rid,
                                    {provocation_role,
                                     role_callback,
                                     [{expire_book, BookId}]})
                         || #provocation_book{id = BookId, master_id = Rid}
                                <- ExpireBookList],
                        BookList -- ExpireBookList
                end,
    MinExpire = case
                    lists:keysort(#provocation_book.time_stamp, NBookList)
                    of
                    [#provocation_book{time_stamp = Time} | _] ->
                        Time + 2 * 24 * 3600 - Now;
                    _ -> 0
                end,
    case MinExpire > 0 of
        true ->
            Ref = erlang:send_after(MinExpire * 1000,
                                    self(),
                                    expire_book),
            put(expire_book_ref, Ref);
        _ -> erase(expire_book_ref)
    end,
    {noreply, State#state{book_list = NBookList}};
handle_info(expire_box,
            State = #state{box_list = BoxList}) ->
    logger:debug("=======", [], provocation_mgr, 796),
    case get(expire_box_ref) of
        undefined -> ignore;
        OldRef when is_reference(OldRef) ->
            erlang:cancel_timer(OldRef)
    end,
    Now = date:unixtime(),
    NBoxList = case [PB
                     || PB = #provocation_box{time_stamp = Time} <- BoxList,
                        Time + 60 * 100 =< Now]
                   of
                   [] -> BoxList;
                   ExpireBoxList when is_list(ExpireBoxList) ->
                       [unit_mgr:remove(List)
                        || #provocation_box{boxlist = List} <- ExpireBoxList],
                       BoxList -- ExpireBoxList
               end,
    MinExpire = case
                    lists:keysort(#provocation_box.time_stamp, NBoxList)
                    of
                    [#provocation_box{time_stamp = Time} | _] ->
                        Time + 60 * 100 - Now;
                    _ -> 0
                end,
    case MinExpire > 0 of
        true ->
            Ref = erlang:send_after(MinExpire * 1000,
                                    self(),
                                    expire_box),
            put(expire_box_ref, Ref);
        _ -> erase(expire_box_ref)
    end,
    {noreply, State#state{box_list = NBoxList}};
handle_info(expire_horn,
            State = #state{room_list = RoomList}) ->
    case get(expire_horn_ref) of
        undefined -> ignore;
        OldRef when is_reference(OldRef) ->
            erlang:cancel_timer(OldRef)
    end,
    Now = date:unixtime(),
    NRoomList = case [Room
                      || Room = #provocation_room{horn_start_time = StartTime}
                             <- RoomList,
                         StartTime =/= 0 andalso StartTime + 60 =< Now]
                    of
                    [] -> RoomList;
                    ExpireRoomList when is_list(ExpireRoomList) ->
                        Fun = fun (RoomInfo = #provocation_room{id = RoomId,
                                                                make_horn_role =
                                                                    Rid = {_,
                                                                           P1,
                                                                           Z1},
                                                                horn_name =
                                                                    HornName,
                                                                target_rival =
                                                                    {_, P2, Z2},
                                                                target_name =
                                                                    TargetName},
                                   Tmp) ->
                                      NRoomInfo = clean_room_horn(RoomInfo),
                                      make_horn_auto_mail(Rid, TargetName),
                                      Msg =
                                          notice:format(lang:get("不战而胜！~ts下达擂台决斗战书后，~ts未能在30分钟内应战，吃瓜群众纷纷散去{face"
                                                                 "_1,112}"),
                                                        [{role_2, HornName},
                                                         {role_2, TargetName}]),
                                      make_cast_system(Msg, P1, Z1, P2, Z2),
                                      lists:keyreplace(RoomId,
                                                       #provocation_room.id,
                                                       Tmp,
                                                       NRoomInfo);
                                  (_, Tmp) -> Tmp
                              end,
                        lists:foldl(Fun, RoomList, ExpireRoomList)
                end,
    MinExpire = case
                    lists:keysort(#provocation_room.horn_start_time,
                                  NRoomList)
                    of
                    [#provocation_room{horn_start_time = Time} | _] ->
                        Time + 60 - Now;
                    _ -> 0
                end,
    case MinExpire > 0 of
        true ->
            Ref = erlang:send_after(MinExpire * 1000,
                                    self(),
                                    expire_horn),
            put(expire_horn_ref, Ref);
        _ -> erase(expire_horn_ref)
    end,
    {noreply, State#state{room_list = NRoomList}};
handle_info(_Info, State) ->
    logger:debug("收到未知消息:~w",
                 [_Info],
                 provocation_mgr,
                 863),
    {noreply, State}.

terminate(_Reason, _State) ->
    logger:info("[~w] 正在关闭...",
                [provocation_mgr],
                provocation_mgr,
                867),
    logger:info("[~w] 关闭完成",
                [provocation_mgr],
                provocation_mgr,
                868),
    ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

push_all_20704(RoomInfo = #provocation_room{master_id =
                                                MRid,
                                            customer_id = CRid,
                                            master_team_pid = MTPid,
                                            customer_team_pid = CTPid}) ->
    push_team_20704(MTPid,
                    MRid,
                    provocation_util:make_room_info(RoomInfo)),
    push_team_20704(CTPid,
                    CRid,
                    provocation_util:make_room_info(RoomInfo)).

push_team_20704(TPid, LRid, Data) ->
    case team:info(TPid) of
        {ok, #team{members = Members}} when Members =/= [] ->
            [role:pack_send(Pid, 20704, Data)
             || #team_mate{pid = Pid} <- Members];
        _ when LRid =/= {0, "", 0} ->
            role:pack_send(LRid, 20704, Data);
        _ -> ok
    end.

push_20704(RoleId = {_, _, _}, RoomInfo) ->
    role:pack_send(RoleId,
                   20704,
                   provocation_util:make_room_info(RoomInfo));
push_20704(_R, _RommInfo) -> ok.

notice_team(TPid, LRid, Msg) ->
    case team:info(TPid) of
        {ok, #team{members = Members}} when Members =/= [] ->
            [notice:send({pid, Pid}, 1, Msg)
             || #team_mate{pid = Pid} <- Members];
        _ when LRid =/= {0, "", 0} -> notice:send(LRid, 1, Msg);
        _ -> ok
    end.

notice_room(#provocation_room{master_team_pid = MTPid,
                              customer_team_pid = CTPid, master_id = MRid,
                              customer_id = CRid},
            Msg) ->
    case MTPid =:= undefined of
        true -> notice:send(MRid, 1, Msg);
        false -> notice_team(MTPid, MRid, Msg)
    end,
    case CTPid =:= undefined of
        true -> notice:send(CRid, 1, Msg);
        false -> notice_team(CTPid, CRid, Msg)
    end.

check_room([mode | T],
           RoomInfo = #provocation_room{mode = Mode},
           Args = #{team_number := Num}) ->
    LimitNum = case Mode =:= 2 of
                   true -> 1;
                   false -> 5
               end,
    case Num =< LimitNum of
        true -> check_room(T, RoomInfo, Args);
        _ -> {false, lang:get("队伍人数超过房间限制")}
    end;
check_room([password | T],
           RoomInfo = #provocation_room{password = PW},
           Args = #{password := PassWord}) ->
    case PW =:= PassWord of
        true -> check_room(T, RoomInfo, Args);
        _ -> {false, lang:get("房间密码不对")}
    end;
check_room([lev | T],
           RoomInfo = #provocation_room{room_lev_min = MinLev,
                                        room_lev_max = MaxLev,
                                        min_lev_break = MinBreak,
                                        max_lev_break = MaxBreak},
           Args = #{customer_lev := Lev,
                    customer_break := BreakTimes}) ->
    case MinLev =< Lev andalso
             MinBreak =< BreakTimes andalso
                 MaxLev >= Lev andalso MaxBreak >= BreakTimes
        of
        true -> check_room(T, RoomInfo, Args);
        _ -> {false, lang:get("房间等级段不符")}
    end;
check_room([fc | T],
           RoomInfo = #provocation_room{master_fc = MFc},
           Args = #{customer_fc := Fc}) ->
    case MFc * 9.0e-1 =< Fc andalso MFc * 1.1 >= Fc of
        true -> check_room(T, RoomInfo, Args);
        _ -> {false, lang:get("战力不符")}
    end;
check_room([], _, _) -> true.

query_map_info([], _Num, {ZoneId, ZonePid, Count}) ->
    {ZoneId, ZonePid, Count};
query_map_info([{MapId, MapPid, RoleCount} | Rest], Num,
               {_MapId, _MapPid, Count})
    when RoleCount + Num =< 1 ->
    case RoleCount < Count orelse Count =:= -1 of
        true ->
            query_map_info(Rest, Num, {MapId, MapPid, RoleCount});
        false ->
            query_map_info(Rest, Num, {_MapId, _MapPid, Count})
    end;
query_map_info([_ | Rest], Num,
               {MapId, MapPid, RoleCount}) ->
    query_map_info(Rest, Num, {MapId, MapPid, RoleCount}).

cast_record(#{round := Round, winner := Winner,
              loser := Loser, record := Record,
              match_id := MatchId}) ->
    Ids = [Id
           || #fighter{origin_id = Id = {_, _, _}}
                  <- Winner ++ Loser],
    IsMarvel = is_marvel(Round, Winner, Loser),
    CastM = #{record => Record, is_marvel => IsMarvel,
              combat_type => 115, match_id => MatchId},
    case Ids of
        [{_, Platfrom, ZoneId} | _] ->
            logger:debug("跨服约战保存录像，是否精彩：~w",
                         [IsMarvel],
                         provocation_mgr,
                         952),
            cross:cast(Platfrom,
                       ZoneId,
                       combat_record,
                       save,
                       [CastM#{ids => Ids, cross => true,
                               pz => {Platfrom, ZoneId}}]),
            {Platfrom, ZoneId};
        _ -> {"", 0}
    end.

is_marvel(Round, _Winner, _Loser) -> Round >= 3.

combat_statistics(#{winner := Winner, loser := Loser,
                    match_id := MatchId, round := Round, record_pz := PZ,
                    pk_type := PkType}) ->
    SumDmgW = lists:sum([Dmg1
                         || #fighter{combat_statistics =
                                         #combat_statistics{total_dmg = Dmg1}}
                                <- Winner]),
    AvgDmgW = round(SumDmgW / 5 / Round),
    SumDmgL = lists:sum([Dmg4
                         || #fighter{combat_statistics =
                                         #combat_statistics{total_dmg = Dmg4}}
                                <- Loser]),
    AvgDmgL = round(SumDmgL / 5 / Round),
    WFighters = [to(fighter, F, AvgDmgW)
                 || F <- lists:keysort(#fighter.type, Winner)],
    LFighters = [to(fighter, F, AvgDmgL)
                 || F <- lists:keysort(#fighter.type, Loser)],
    MaxDmg = lists:max([Dmg3
                        || #fighter{combat_statistics =
                                        #combat_statistics{total_dmg = Dmg3}}
                               <- Loser ++ Winner]),
    MaxKill = lists:max([Kill
                         || #fighter{combat_statistics =
                                         #combat_statistics{kill_group_target =
                                                                Kill}}
                                <- Loser ++ Winner]),
    MaxHeal = lists:max([Heal
                         || #fighter{combat_statistics =
                                         #combat_statistics{total_heal = Heal}}
                                <- Loser ++ Winner]),
    MaxControl = lists:max([Control
                            || #fighter{combat_statistics =
                                            #combat_statistics{control_num =
                                                                   Control}}
                                   <- Loser ++ Winner]),
    MvpScore = case Winner of
                   [] ->
                       logger:error("战斗结束没有胜利者 ~w",
                                    [Loser],
                                    provocation_mgr,
                                    979),
                       0;
                   _ ->
                       lists:max([calc_mvp_score(Stats, AvgDmgW)
                                  || #fighter{combat_statistics = Stats}
                                         <- Winner])
               end,
    LossMvpScore = case Loser of
                       [] ->
                           logger:error("战斗结束没有失败者 ~w",
                                        [Winner],
                                        provocation_mgr,
                                        985),
                           0;
                       _ ->
                           lists:max([calc_mvp_score(Stats, AvgDmgL)
                                      || #fighter{combat_statistics = Stats}
                                             <- Loser])
                   end,
    StatsArgs = #{max_dmg => MaxDmg, max_kill => MaxKill,
                  max_heal => MaxHeal, max_control => MaxControl,
                  mvp_score => MvpScore, loss_mvp_score => LossMvpScore},
    [begin
         Best = get_best(win,
                         Statistics,
                         StatsArgs#{avg_dmg => AvgDmgW}),
         cross:cast(Platform,
                    ZoneId,
                    provocation_agent,
                    combat_over,
                    [#{id => Id, type => win, mates => WFighters,
                       best => Best, rival => LFighters, match_id => MatchId,
                       record_pz => PZ, pk_type => PkType}])
     end
     || #fighter{origin_id = Id = {_, Platform, ZoneId},
                 combat_statistics = Statistics}
            <- Winner,
        Platform =/= ""],
    [begin
         Best = get_best(lost,
                         Statistics,
                         StatsArgs#{avg_dmg => AvgDmgL}),
         cross:cast(Platform,
                    ZoneId,
                    provocation_agent,
                    combat_over,
                    [#{id => Id, type => lost, mates => LFighters,
                       best => Best, rival => WFighters, match_id => MatchId,
                       record_pz => PZ, pk_type => PkType}])
     end
     || #fighter{origin_id = Id = {_, Platform, ZoneId},
                 combat_statistics = Statistics}
            <- Loser,
        Platform =/= ""].

to(fighter,
   #fighter{origin_id = Id, type = FType, base_id = BaseId,
            sex = Sex, lev = Lev, classes = Classes, name = Name,
            combat_statistics =
                Stats = #combat_statistics{total_hurt = TotalHurt,
                                           total_dmg = TotalDmg,
                                           kill_group_target = KillNum,
                                           killed_group_target = DeadNum,
                                           total_heal = TotalHeal,
                                           control_num = ControlNum}},
   AvgDmg) ->
    MvpScore = calc_mvp_score(Stats, AvgDmg),
    P1 = #provocation_fighter{id = Id, sex = Sex, lev = Lev,
                              classes = Classes, name = Name,
                              total_hurt = TotalHurt, total_dmg = TotalDmg,
                              kill_num = KillNum, dead_num = DeadNum,
                              total_heal = TotalHeal, control_num = ControlNum,
                              mvp_score = MvpScore},
    Id2 = case FType of
              5 -> {BaseId, "", 0};
              _ -> Id
          end,
    P1#provocation_fighter{id = Id2}.

calc_mvp_score(_, 0) -> 0;
calc_mvp_score(#combat_statistics{total_dmg = TotalDmg,
                                  total_heal = TotalHeal,
                                  control_num = ControlNum},
               AvgDmg) ->
    MvpScore = round(TotalDmg / 1000) +
                   round(ControlNum * AvgDmg * 2 / 1000)
                   + round(TotalHeal / 1000),
    logger:debug("mvp计算：总输出~w，总治疗 ~w，控制数 ~w，队伍平均输出 ~w, "
                 "mvp分数 ~w",
                 [TotalDmg, TotalHeal, ControlNum, AvgDmg, MvpScore],
                 provocation_mgr,
                 1015),
    MvpScore.

get_best(Type,
         Stats = #combat_statistics{total_dmg = TotalDmg,
                                    kill_group_target = KillNum,
                                    total_heal = TotalHeal,
                                    control_num = ControlNum},
         #{max_dmg := MaxDmg, max_kill := MaxKill,
           max_heal := MaxHeal, max_control := MaxControl,
           mvp_score := MvpScore, loss_mvp_score := LossMvpScore,
           avg_dmg := AvgDmg}) ->
    AddAwesomeKill = case KillNum >= 8 of
                         true -> 1;
                         _ -> 0
                     end,
    AddAwesomeKillNum = case KillNum of
                            0 -> 0;
                            MaxKill -> 1;
                            _ -> 0
                        end,
    AddAwesomeDmg = case TotalDmg of
                        0 -> 0;
                        MaxDmg -> 1;
                        _ -> 0
                    end,
    AddAwesomeHeal = case TotalHeal of
                         0 -> 0;
                         MaxHeal -> 1;
                         _ -> 0
                     end,
    AddAwesomeControl = case ControlNum of
                            0 -> 0;
                            MaxControl -> 1;
                            _ -> 0
                        end,
    {AddMvp, AddLossMvp} = case calc_mvp_score(Stats,
                                               AvgDmg)
                               of
                               0 -> {0, 0};
                               MvpScore when Type =:= win -> {1, 0};
                               LossMvpScore when Type =:= lost -> {0, 1};
                               _ -> {0, 0}
                           end,
    if AddAwesomeKill > 0 -> 1;
       AddMvp > 0 -> 4;
       AddAwesomeDmg > 0 -> 2;
       AddAwesomeKillNum > 0 -> 3;
       AddAwesomeHeal > 0 -> 5;
       AddAwesomeControl > 0 -> 6;
       AddLossMvp > 0 -> 7;
       true -> 0
    end.

load_data() ->
    case dets:first(provocation_profile) of
        '$end_of_table' ->
            logger:info("没有数据需要加载", [], provocation_mgr, 1069),
            [];
        _ ->
            dets:traverse(provocation_profile,
                          fun (P) ->
                                  case provocation_ver:do_profile(P) of
                                      {false, Reason} ->
                                          logger:error("跨服约战数据转换失败:~w",
                                                       [Reason],
                                                       provocation_mgr,
                                                       1076),
                                          {done, false};
                                      {ok, P1 = #provocation_profile{}} ->
                                          ets:insert(provocation_profile, P1),
                                          dets:insert(provocation_profile, P1),
                                          continue
                                  end
                          end)
    end.

set_expire() ->
    case get(expire_book_ref) of
        undefined ->
            put(expire_book_ref,
                erlang:send_after(2 * 24 * 3600 * 1000,
                                  self(),
                                  expire_book));
        OldRef when is_reference(OldRef) -> ok
    end.

set_expire_box() ->
    case get(expire_box_ref) of
        undefined ->
            logger:debug("=====", [], provocation_mgr, 1099),
            put(expire_box_ref,
                erlang:send_after(60 * 100 * 1000, self(), expire_box));
        OldRef when is_reference(OldRef) ->
            logger:debug("=====~w",
                         [OldRef],
                         provocation_mgr,
                         1102),
            ok
    end.

set_expire_horn() ->
    case get(expire_horn_ref) of
        undefined ->
            put(expire_horn_ref,
                erlang:send_after(60 * 1000, self(), expire_horn));
        OldRef when is_reference(OldRef) -> ok
    end.

get_recommend(GroupLev, FcGroup, MyId, NeedNum)
    when is_integer(FcGroup) ->
    logger:debug("~w,~w",
                 [GroupLev, FcGroup],
                 provocation_mgr,
                 1115),
    case ets:lookup(provocation_slices, {GroupLev, FcGroup})
        of
        [#provocation_slices{role_list = RList}] ->
            NewNum = length(RList) - 1,
            NewList = RList -- [MyId],
            get_recommend_roles(GroupLev,
                                [FcGroup - 1, FcGroup + 1],
                                NewNum,
                                NewList,
                                NeedNum);
        _ ->
            get_recommend_roles(GroupLev,
                                [FcGroup - 1, FcGroup + 1],
                                0,
                                [],
                                NeedNum)
    end.

get_recommend_roles(_, _, Num, List, NeedNum)
    when Num > NeedNum ->
    util:rand_list_n(List, NeedNum);
get_recommend_roles(_, [MinF, MaxF], _Num, List, _)
    when MaxF - MinF > 6 ->
    List;
get_recommend_roles(GroupLev, [MFcGroup, LFcGroup], Num,
                    List, NeedNum)
    when Num =< NeedNum ->
    L1 = case MFcGroup > 0 of
             true ->
                 case ets:lookup(provocation_slices,
                                 {GroupLev, MFcGroup})
                     of
                     [#provocation_slices{role_list = RList1}] -> RList1;
                     _ -> []
                 end;
             _ -> []
         end,
    L2 = case ets:lookup(provocation_slices,
                         {GroupLev, LFcGroup})
             of
             [#provocation_slices{role_list = RList2}] -> RList2;
             _ -> []
         end,
    NewList = List ++ L1 ++ L2,
    NewNum = length(NewList),
    get_recommend_roles(GroupLev,
                        [MFcGroup - 1, LFcGroup + 1],
                        NewNum,
                        NewList,
                        NeedNum).

create_map_box(State = #state{map_list = MapList,
                              box_list = BoxList, box_id = BatchId},
               BoxId, Num, Name, Type) ->
    BoxList1 = [#provocation_box{map_id = MapId,
                                 type = Type, batch_id = BatchId,
                                 time_stamp = date:unixtime(),
                                 boxlist =
                                     do_create_box(BatchId,
                                                   Num,
                                                   BoxId,
                                                   MapId,
                                                   Name,
                                                   [])}
                || {MapId, _, _} <- MapList],
    State#state{box_list = BoxList ++ BoxList1,
                box_id = BatchId + 1}.

do_create_box(_, Num, _BoxId, _MapId, _Name, BoxList)
    when Num =< 0 ->
    BoxList;
do_create_box(BatchId, Num, BoxId, MapId, Name,
              BoxList) ->
    case map:rand_pos(53014) of
        {X, Y} ->
            case unit_mgr:create({56,
                                  MapId * 100 + BatchId * 10 + Num},
                                 BoxId,
                                 {MapId, X, Y})
                of
                {ok, Unit = #unit{id = UnitId}} ->
                    unit_mgr:set_element(Unit, [{#unit.name, Name}]),
                    do_create_box(BatchId,
                                  Num - 1,
                                  BoxId,
                                  MapId,
                                  Name,
                                  [UnitId | BoxList]);
                _ ->
                    do_create_box(BatchId,
                                  Num - 1,
                                  BoxId,
                                  MapId,
                                  Name,
                                  BoxList)
            end;
        _ ->
            do_create_box(BatchId,
                          Num - 1,
                          BoxId,
                          MapId,
                          Name,
                          BoxList)
    end.

clean_room_horn(RoomInfo) ->
    RoomInfo#provocation_room{target_rival = {0, "", 0},
                              make_horn_role = {0, "", 0}, horn_name = [],
                              target_name = [], horn_start_time = 0}.

check_role_in_team(TPid, TargetRid) ->
    case team:info(TPid) of
        {ok, #team{members = Members}} when Members =/= [] ->
            logger:debug("~w", [Members], provocation_mgr, 1203),
            IdList = [Id
                      || #team_mate{id = Id, status = Status} <- Members,
                         Status =:= 2 orelse Status =:= 1],
            lists:member(TargetRid, IdList);
        _ -> false
    end.

make_cast_scroll(Msg, P1, Z1, P2, Z2) ->
    cross:cast(P1, Z1, notice, cast, [all, 11, Msg]),
    case c_mirror:get_zone_mapping(P1, Z1) =:=
             c_mirror:get_zone_mapping(P2, Z2)
        of
        true -> ok;
        _ when Z2 =/= 0 andalso P2 =/= [] ->
            cross:cast(P2, Z2, notice, cast, [all, 11, Msg]);
        _ -> ok
    end.

make_cast_system(Msg, P1, Z1, P2, Z2) ->
    cross:cast(P1, Z1, notice, cast, [all, 5, Msg]),
    case c_mirror:get_zone_mapping(P1, Z1) =:=
             c_mirror:get_zone_mapping(P2, Z2)
        of
        true -> ok;
        _ when Z2 =/= 0 andalso P2 =/= [] ->
            cross:cast(P2, Z2, notice, cast, [all, 5, Msg]);
        _ -> ok
    end.

make_cast_world(Msg, P1, Z1, P2, Z2) ->
    cross:cast(P1, Z1, notice, cast, [all, 10, Msg]),
    case c_mirror:get_zone_mapping(P1, Z1) =:=
             c_mirror:get_zone_mapping(P2, Z2)
        of
        true -> ok;
        _ when Z2 =/= 0 andalso P2 =/= [] ->
            cross:cast(P2, Z2, notice, cast, [all, 10, Msg]);
        _ -> ok
    end.

find_box_unit(_UnitId, []) ->
    {false, lang:get("该宝箱已过期")};
find_box_unit(UnitId,
              [#provocation_box{type = Type, batch_id = BatchId,
                                boxlist = List}
               | T]) ->
    case lists:member(UnitId, List) of
        true -> {true, Type, BatchId};
        _ -> find_box_unit(UnitId, T)
    end.

make_horn_mail(Rid) ->
    case cross_arena_data:get_gift(2) of
        {GiftId, Bind, GiftNum} ->
            Items = [{GiftId, Bind, GiftNum}],
            mail:send(Rid,
                      #{title => lang:get("决斗挑战成功"),
                        content =>
                            lang:get("恭喜您在自己发起的决斗中获胜，作为决斗发起者，您额外获得了以下奖励"),
                        items => Items});
        _ -> ok
    end.

make_horn_auto_mail(Rid, TargetName) ->
    case cross_arena_data:get_gift(3) of
        {GiftId, Bind, GiftNum} ->
            Items = [{GiftId, Bind, GiftNum}],
            mail:send(Rid,
                      #{title => lang:get("决斗不战而胜"),
                        content =>
                            notice:format(lang:get("由于~ts未能准时应战，系统判定您不战而胜，作为决斗发起者，您获得了以下奖励"),
                                          [{role_2, TargetName}]),
                        items => Items});
        _ -> ok
    end.

make_cancle_mail(#provocation_room{make_horn_role =
                                       HornRole,
                                   horn_name = HornName,
                                   target_rival = TargetRid,
                                   horn_start_time = HornTime}) ->
    case HornRole =/= {0, "", 0} andalso HornTime =/= 0 of
        true ->
            mail:send(HornRole,
                      #{title => lang:get("决斗取消通知"),
                        content =>
                            lang:get("作为决斗发起者，由于您提前退出决斗房间，与玩家名的决斗正式取消\n（取消决斗将不返还任何奖"
                                     "励或费用")}),
            mail:send(TargetRid,
                      #{title => lang:get("决斗取消通知"),
                        content =>
                            notice:format(lang:get("由于决斗发起者~ts提前退出决斗房间，与您的决斗正式取消，特此通知"),
                                          [{role_2, HornName}])});
        _ -> ok
    end.

make_duel_mail(Rid, LossRid, WinName) ->
    case cross_arena_data:get_gift(1) of
        {GiftId, Bind, GiftNum} ->
            NewItem = case item:make(70150, 1, 1) of
                          {ok, [Item]} ->
                              Item2 = Item#item{data = [LossRid]},
                              logger:debug("~w",
                                           [Item2],
                                           provocation_mgr,
                                           1275),
                              [{GiftId, Bind, GiftNum}, Item2];
                          _ -> [{GiftId, Bind, GiftNum}]
                      end,
            mail:send(Rid,
                      #{title => lang:get("决斗获胜奖励"),
                        content =>
                            lang:get("恭喜您在决斗中大获全胜，全服玩家都目睹了您的风采，作为胜方队长，您获得了以下奖励"),
                        items => NewItem});
        _ -> ok
    end,
    mail:send(LossRid,
              #{title => lang:get("决斗结果通知"),
                content =>
                    notice:format(lang:get("您在与~ts的决斗中遗憾战败，请不要灰心，真正的强者百折不挠，祝您越战越勇{face_1,18}"),
                                  [{role_2, WinName}]),
                items => []}).

update_provocation_profile(Info) ->
    ets:insert(provocation_profile, Info),
    dets:insert(provocation_profile, Info),
    ok.

update_provocation_fight_team_info(Info) ->
    ets:insert(provocation_fight_team_info, Info),
    dets:insert(provocation_fight_team_info, Info),
    ok.

update_provocation_slices(Info) ->
    ets:insert(provocation_slices, Info),
    dets:insert(provocation_slices, Info),
    ok.

gm_resetroom() -> cast(gm_resetroom).

gm_lookmap() -> cast(gm_lookmap).

gm_lookroom() -> cast(gm_lookroom).

gm_resetbook() -> cast(gm_resetbook).

gm_lookstate() -> call(gm_lookstate).

