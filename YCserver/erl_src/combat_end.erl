-file("src/mod/combat/combat_end.erl", 1).

-module(combat_end).

-export([combat_over/1,
         combat_over_calc/6,
         combat_over_leave/1,
         do_combat_over_leave/9,
         enter_combat_failed/3,
         combat_over_error/3,
         do_combat_over_error/5,
         do_combat_over_error/1,
         add_combat_gl_notice/2]).

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

-file("src/mod/combat/combat_end.erl", 22).

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

-file("src/mod/combat/combat_end.erl", 23).

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

-file("src/mod/combat/combat_end.erl", 24).

-file("inc/gain.hrl", 1).

-record(gain,
        {label :: undefined | atom(),
         val :: undefined | term(),
         msg = "" :: list(),
         source = 0 :: non_neg_integer(),
         notice_msg = "" :: list(),
         reason :: undefined | atom(),
         ext = 0 :: term(),
         notice = 0 :: 0..1,
         ext_val = 0}).

-record(loss,
        {label :: undefined | atom(),
         val :: undefined | term(),
         msg = "" :: list(),
         notice_msg = "" :: list(),
         source = 0 :: non_neg_integer(),
         reason :: undefined | atom(),
         ext = 0 :: term(),
         ext_val = 0,
         auto_scene = "" :: list()}).

-record(gain_text_opts,
        {order = loss :: gain | loss,
         gain_tag = "" :: string(),
         loss_tag = "" :: string(),
         split_str = "，" :: string(),
         split_op_str = "，" :: string(),
         merge_type = [] :: list(),
         fly_to_bag = 0 :: non_neg_integer()}).

-file("src/mod/combat/combat_end.erl", 25).

-file("inc/drop.hrl", 1).

-record(drop_rule,
        {unit_id = 0,
         type = 1,
         super_r = 0,
         first_r = 0,
         second_r = 0,
         third_r = 0}).

-record(drop_base,
        {unit_id = 0,
         item_id = 0,
         num = 0,
         ratio = 0,
         classes = 0,
         lev_min = 0,
         lev_max = 0,
         notice = 0,
         sound_effect = 0}).

-file("src/mod/combat/combat_end.erl", 26).

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

-file("src/mod/combat/combat_end.erl", 27).

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

-file("src/mod/combat/combat_end.erl", 28).

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

-file("src/mod/combat/combat_end.erl", 29).

-file("inc/quest.hrl", 1).

-file("inc/quest_king.hrl", 1).

-record(quest_king,
        {ver = 1,
         stage = 1,
         finish = [],
         doing = [],
         rf_times = 0}).

-file("inc/quest.hrl", 36).

-record(quest_data,
        {id = 1 :: pos_integer(),
         phase = 1 :: pos_integer(),
         quest_line = 1,
         type = 1 :: pos_integer(),
         sec_type = 1 :: pos_integer(),
         name = "" :: list(),
         mode = 1 :: pos_integer(),
         leader_cond = [] :: [tuple()],
         is_leader_quest = 0 :: 0 | 1,
         can_giveup = 0 :: 0..1,
         lev = 1 :: pos_integer(),
         lev_break_min_times = 0 :: non_neg_integer(),
         lev_break_max_times = 0 :: non_neg_integer(),
         max_lev = 0 :: non_neg_integer(),
         auto_finished_lev = 0 :: non_neg_integer(),
         classes = 0 :: 0..4,
         pre_quest ::
             undefined | non_neg_integer() | [non_neg_integer()],
         check_distance = 0 :: 0..1,
         npc_accept_battle = 0 :: non_neg_integer(),
         npc_accept_id = 0 :: non_neg_integer(),
         npc_accept = 0 :: non_neg_integer(),
         npc_commit_battle = 0 :: non_neg_integer(),
         npc_commit_id = 0 :: non_neg_integer(),
         npc_commit = 0 :: non_neg_integer(),
         start_time = 0 ::
             tuple() | non_neg_integer() | undefined,
         end_time = 0 :: tuple() | non_neg_integer() | undefined,
         condition = [] :: [tuple()],
         progress = [] :: [tuple()],
         rewards_accept = [] :: [tuple()],
         rewards_commit = [] :: [tuple()],
         commit_loss = [] :: [tuple()],
         rewards_vip = [] :: [tuple()],
         action_accept = [] :: [tuple()],
         action_commit = [] :: [tuple()],
         times = 1 :: non_neg_integer(),
         desc = "" :: list(),
         auto_accept = 0 :: 0..1,
         is_auto_finished_gain = 0 :: 0..1,
         weekdays = [] :: [pos_integer()],
         white_list = [] :: list(),
         black_list = [] :: list(),
         notice_msg = "" :: list(),
         val_from_prev = 0 :: 0..1,
         honor = 0 :: non_neg_integer(),
         ach_num = 0 :: non_neg_integer(),
         rewards_badge = 0 :: non_neg_integer(),
         day = 0 :: non_neg_integer(),
         extra = []}).

-record(quest_extra_data,
        {name = 0, classes = 0, val1 = 0, val2 = 0, list = []}).

-record(quest_classes,
        {quest_id = 0,
         first_time = 0,
         ring = 1,
         round = 0,
         total_count = 0,
         done_list = []}).

-record(quest_offer,
        {quest_id = 0,
         day_count = 0,
         leader_count = 0,
         leader_quest_count = 0,
         round = 0,
         total_count = 0,
         team_args = []}).

-record(quest_treasure,
        {quest_id = 0, round = 0, total_count = 0}).

-record(quest_guild,
        {quest_id = 0,
         last_accepted = 0,
         ring = 1,
         round = 0,
         total_count = 0,
         done_list = []}).

-record(quest_chain,
        {quest_id = 0,
         accept_time = 0,
         type = 0,
         ext_data = [],
         round = 0,
         total_count = 0,
         commit_npc}).

-record(quest_marriage,
        {quest_id = 0,
         type = 0,
         sec_type = 0,
         round = 0,
         total_count = 0,
         ext_data = quest_marriage:quest_ext_data()}).

-record(quest_couple,
        {quest_id = 0,
         type = 0,
         sec_type = 0,
         round = 0,
         total_count = 0,
         partner_id,
         ext_data = quest_couple:quest_ext_data()}).

-record(quest_prac,
        {part = 1, chapter = 2, section = 0}).

-record(quest_plant,
        {quest_id = 0,
         last_accepted = 0,
         last_commited = 0,
         round = 0,
         unit_id = 0,
         phase = 0,
         pos = {0, 0, 0},
         done_list = []}).

-record(quest_teacher,
        {quest_id = 0,
         type = 0,
         sec_type = 0,
         partner_id,
         round = 0,
         total_count = 0,
         stats = [],
         ext_data = quest_teacher:quest_ext_data()}).

-record(quest_shipping, {list = []}).

-record(quest_pursue,
        {quest_id = 0,
         last_accepted = 0,
         round_started = 0,
         ring = 1,
         round = 0,
         total_count = 0,
         done_list = []}).

-record(quest_child,
        {quest_id = 0,
         last_accepted = 0,
         last_commited = 0,
         round = 0,
         mode = 1,
         unit_id = 0,
         done_list = []}).

-record(quest_pregnancy,
        {quest_id = 0,
         last_accepted = 0,
         last_commited = 0,
         round = 0,
         mode = 1,
         done_list = []}).

-record(quest_acquaintance,
        {quest_id = 0,
         last_accepted = 0,
         last_commited = 0,
         round = 0,
         partner_id = 0,
         partner_name = "",
         done_list = [],
         ring = 0,
         rpc_accepted = 0}).

-record(quest_summer,
        {ver = 1,
         finish = [],
         doing = [],
         score = 0,
         rewarded = []}).

-record(quest_single_dog,
        {ver = 1, finish = [], round = 1, extra = #{}}).

-record(quest_sign_draw, {finish = [], doing = []}).

-record(quest_score_exchange,
        {finish = [], doing = []}).

-record(quest_long_active, {finish = [], doing = []}).

-record(m_quest,
        {ver = 19,
         quest = [] :: list(),
         acceptable = [] :: list(),
         finished = [] :: list(),
         day_finished = [],
         quest_classes = #quest_classes{} :: #quest_classes{},
         quest_offer = #quest_offer{} :: #quest_offer{},
         quest_prac = #quest_prac{} :: #quest_prac{},
         quest_treasure = #quest_treasure{},
         quest_guild = #quest_guild{},
         quest_chain = #quest_chain{},
         quest_marriage = #quest_marriage{},
         quest_couple = #quest_couple{},
         quest_plant = #quest_plant{},
         quest_teacher = #quest_teacher{},
         quest_shipping = #quest_shipping{},
         quest_pursue = #quest_pursue{},
         quest_line = 2,
         quest_child = #quest_child{},
         quest_pregnancy = #quest_pregnancy{},
         quest_acquaintance = #quest_acquaintance{},
         quest_king = #quest_king{},
         quest_summer = #quest_summer{},
         quest_single_dog = #quest_single_dog{},
         quest_sign_draw = #quest_sign_draw{},
         quest_score_exchange = #quest_score_exchange{},
         quest_long_active = #quest_long_active{}}).

-record(quest,
        {id = 1 :: pos_integer(),
         name = "" :: binary(),
         type = 1 :: pos_integer(),
         sec_type = 1 :: pos_integer(),
         finish = 0 :: 0..2,
         quality = 0 :: 0..4,
         progress = [] :: [tuple()],
         accept_time = 0 :: non_neg_integer(),
         end_time = 0 :: non_neg_integer(),
         finish_time = 0 :: non_neg_integer(),
         round = 0 :: non_neg_integer()}).

-record(quest_progress,
        {id = 0 :: non_neg_integer(),
         label :: undefined | atom(),
         target = 0 :: non_neg_integer(),
         param = [] :: list(),
         finish = 0 :: 0..1,
         trigger :: undefined | tuple(),
         target_val = 1 :: pos_integer(),
         value = 0 :: non_neg_integer(),
         msg = "" :: bitstring() | string(),
         ext_data = [] :: [tuple()],
         dyn_ext_data = [] :: [tuple()]}).

-record(quest_rewards,
        {prob = 1000 :: pos_integer(),
         classes = 0 :: 0..4,
         gain :: undefined | tuple(),
         action :: undefined | function()}).

-record(quest_stats,
        {sec_type = 1, stats = [], desc = []}).

-file("src/mod/combat/combat_end.erl", 30).

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

-file("src/mod/combat/combat_end.erl", 31).

-file("inc/trigger.hrl", 1).

-record(trigger,
        {id = 1 :: pos_integer(),
         label :: undefined | atom(),
         m :: undefined | atom(),
         f :: undefined | function() | atom(),
         a = [] :: list()}).

-record(evt_enter_map,
        {id = 1 :: pos_integer(),
         base_id = 1 :: pos_integer(),
         x = 0 :: non_neg_integer(),
         y = 0 :: non_neg_integer()}).

-record(evt_ico, {id = 0 :: non_neg_integer()}).

-record(evt_close_guide, {id = 0 :: pos_integer()}).

-record(evt_guild, {}).

-record(evt_guild_leave, {val = 0}).

-record(evt_guild_war, {}).

-record(evt_battle_plot,
        {plot_id = 1 :: pos_integer(),
         role_id = {1, "", 0} ::
             {pos_integer(), bitstring(), non_neg_integer()},
         role_name = "" :: bitstring(),
         role_pid :: undefined | pid()}).

-record(evt_plot,
        {id = 1 :: pos_integer(), type = 1 :: pos_integer()}).

-record(evt_shop_buy,
        {assets_type = 0 :: non_neg_integer(),
         val = 0 :: non_neg_integer(),
         base_id = 0 :: non_neg_integer(),
         bind = 0 :: 0..1,
         num = 0 :: non_neg_integer()}).

-record(evt_store_buy, {s_items = []}).

-record(evt_enchant,
        {base_id = 1 :: pos_integer(),
         pre_lev = 1 :: pos_integer(),
         lev = 1 :: pos_integer(),
         type = 0 :: non_neg_integer(),
         pos = 0 :: non_neg_integer(),
         quality = 0 :: non_neg_integer()}).

-record(evt_select, {type = 0 :: non_neg_integer()}).

-record(evt_guild_lev, {}).

-record(evt_skill_up, {id = 0, lev = 0}).

-record(evt_skill_unique_up, {id = 0, lev = 0}).

-record(evt_quest_treasure, {}).

-record(evt_fc,
        {val :: undefined | pos_integer(),
         now_val = 0 :: non_neg_integer()}).

-record(evt_wedding_score, {}).

-record(evt_wedding_req_agreed, {}).

-record(evt_wedding_marry, {}).

-record(evt_wedding_divorce, {}).

-record(evt_guard, {base_id = 0, num = 0}).

-record(evt_leave_map,
        {id = 1 :: pos_integer(),
         base_id = 1 :: pos_integer(),
         x = 0 :: non_neg_integer(),
         y = 0 :: non_neg_integer()}).

-record(evt_move_map,
        {base_id = 1 :: non_neg_integer(),
         x = 0 :: non_neg_integer(),
         y = 0 :: non_neg_integer()}).

-record(evt_dungeon_enter,
        {id = 0 :: non_neg_integer()}).

-record(evt_dungeon_exit,
        {id = 0 :: non_neg_integer()}).

-record(evt_dungeon_pass,
        {id = 0 :: non_neg_integer()}).

-record(evt_dungeon_kill_unit,
        {dun_id = 0, unit_id = 0}).

-record(evt_dungeon_unit_reward,
        {id = 0 :: non_neg_integer()}).

-record(evt_get_item,
        {base_id = 1 :: pos_integer(),
         num = 1 :: pos_integer()}).

-record(evt_use_item,
        {base_id :: undefined | pos_integer(),
         num = 0 :: pos_integer()}).

-record(evt_use_item_type,
        {type = 0 :: non_neg_integer()}).

-record(evt_del_item,
        {base_id :: undefined | pos_integer(),
         num = 0 :: pos_integer()}).

-record(evt_gain_coin,
        {val = 1 :: pos_integer(),
         source :: undefined | atom()}).

-record(evt_have_coin, {val = 1 :: pos_integer()}).

-record(evt_loss_coin,
        {val = 1 :: pos_integer(),
         reason :: undefined | atom()}).

-record(evt_gain_gold,
        {val = 1 :: pos_integer(),
         source :: undefined | atom()}).

-record(evt_loss_gold,
        {val = 1 :: pos_integer(),
         reason :: undefined | atom()}).

-record(evt_loss_gold_bind, {val = 1 :: pos_integer()}).

-record(evt_levup,
        {old_lev = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer()}).

-record(evt_logout, {}).

-record(evt_tower, {floor = 0, unit_id = 0}).

-record(evt_tower_floor, {floor = 0}).

-record(evt_glory, {lev_id = 0}).

-record(evt_reset_eqm, {type = 0}).

-record(evt_cli_loaded, {mod = 0 :: non_neg_integer()}).

-record(evt_eqm, {type = 0}).

-record(evt_pet_war, {base_id = 0}).

-record(evt_pet_skill, {base_id = 0}).

-record(evt_pet_rest, {base_id = 0}).

-record(evt_select_pet, {}).

-record(evt_get_pet,
        {base_id = 0,
         genre = 0,
         lev = 0,
         status = 0,
         is_catched = false,
         talent = 0}).

-record(evt_del_pet, {base_id = 0, num = 0}).

-record(evt_levup_pet,
        {pet_id = 0, base_id = 0, lev = 0}).

-record(evt_aptitude_pet, {base_id = 0, genre = 0}).

-record(evt_pick_flower, {id}).

-record(evt_send_flower,
        {num = 0, val = 0, base_id = 0, recv_id, items = []}).

-record(evt_recv_flower, {num = 0, val = 0, send_id}).

-record(evt_accept_quest, {id = 0 :: pos_integer()}).

-record(evt_commit_quest,
        {id = 0 :: pos_integer(), sec_type = 0}).

-record(evt_finish_quest, {id = 0 :: pos_integer()}).

-record(evt_quest_guild_round, {}).

-record(evt_commit_quest_chain,
        {id = 0 :: pos_integer(), type = 0}).

-record(evt_giveup_quest, {id = 0 :: pos_integer()}).

-record(evt_quest_del, {id = 0 :: pos_integer()}).

-record(evt_map_role_enter,
        {id = 0 :: non_neg_integer(),
         platform = <<>> :: bitstring(),
         zone_id = 0 :: non_neg_integer(),
         map_id = 1 :: pos_integer(),
         map_base_id = 1 :: pos_integer(),
         x = 0 :: non_neg_integer(),
         y = 0 :: non_neg_integer()}).

-record(evt_map_role_move,
        {role_id = {0, "", 0},
         role_pid = 0 :: non_neg_integer() | pid(),
         map_id = 1 :: pos_integer(),
         map_base_id = 1 :: pos_integer(),
         sx = 0 :: non_neg_integer(),
         sy = 0 :: non_neg_integer(),
         dx = 0 :: non_neg_integer(),
         dy = 0 :: non_neg_integer(),
         event = 0 :: non_neg_integer()}).

-record(evt_map_role_leave,
        {role_pid = 0 :: non_neg_integer() | pid(),
         map_id = 1 :: pos_integer(),
         map_base_id = 1 :: pos_integer()}).

-record(evt_combat_round,
        {round :: undefined | pos_integer(),
         self = [] :: [tuple()],
         opp = [] :: [tuple()]}).

-record(evt_combat_init,
        {self = [] :: [tuple()], opp = [] :: [tuple()]}).

-record(evt_kill_npc,
        {id = 0 :: non_neg_integer(),
         base_id = 1 :: pos_integer(),
         origin_id = {1, 1} :: tuple(),
         ratio_val = 0,
         num = 1 :: pos_integer()}).

-record(evt_kill_npc_lose,
        {id = 0 :: non_neg_integer(),
         base_id = 1 :: pos_integer(),
         num = 1 :: pos_integer()}).

-record(evt_kill_role_clone,
        {id = {0, "robot", 0}, ratio_val = 0}).

-record(evt_fight_unit,
        {id = 0 :: non_neg_integer(),
         base_id = 1 :: pos_integer(),
         num = 1 :: pos_integer()}).

-record(evt_mount_combat,
        {combat_type = 0 :: non_neg_integer(),
         is_win = 0 :: non_neg_integer()}).

-record(evt_unit_click,
        {id = 0 :: non_neg_integer(),
         role_id = {0, "", 0},
         name = "",
         pid,
         type = 0 :: non_neg_integer(),
         base_id = 0 :: non_neg_integer(),
         do_type = -1 :: integer()}).

-record(evt_online_time, {acc_time = 0, add_val = 0}).

-record(evt_battle_role_enter,
        {id = 0 :: non_neg_integer(),
         platform = "" :: bitstring(),
         zone_id = 0 :: non_neg_integer(),
         pid :: undefined | pid(),
         conn_pid :: undefined | pid(),
         name = "" :: bitstring(),
         dun_id = 0 :: non_neg_integer(),
         last_pos = {0, 0, 0} ::
             {non_neg_integer(),
              non_neg_integer(),
              non_neg_integer()},
         enter_pos = {0, 0, 0} ::
             {non_neg_integer(),
              non_neg_integer(),
              non_neg_integer()},
         dun_role :: undefined | tuple()}).

-record(evt_battle_enter_map,
        {id = {0, "", 0} ::
             {non_neg_integer(), bitstring(), non_neg_integer()},
         name = "" :: bitstring(),
         pid :: undefined | pid(),
         map_base_id = 0 :: non_neg_integer()}).

-record(evt_battle_role_login,
        {id = 0 :: non_neg_integer(),
         platform = "" :: bitstring(),
         zone_id = 0 :: non_neg_integer(),
         pid :: undefined | pid(),
         conn_pid :: undefined | pid(),
         name = "" :: bitstring(),
         last_pos = {0, 0, 0} ::
             {non_neg_integer(),
              non_neg_integer(),
              non_neg_integer()},
         enter_pos = {0, 0, 0} ::
             {non_neg_integer(),
              non_neg_integer(),
              non_neg_integer()}}).

-record(evt_battle_role_exit,
        {id = 0 :: non_neg_integer(),
         platform = "" :: bitstring(),
         zone_id = 0 :: non_neg_integer(),
         name = "" :: bitstring()}).

-record(evt_battle_role_logout,
        {id = 0 :: non_neg_integer(),
         platform = "" :: bitstring(),
         zone_id = 0 :: non_neg_integer(),
         name = "" :: bitstring(),
         ext_id = 0 :: non_neg_integer()}).

-record(evt_battle_unit_killed,
        {unit_id = {1, 1} :: {pos_integer(), pos_integer()},
         base_id = 1 :: pos_integer(),
         type = 1 :: pos_integer(),
         role_list = [] ::
             [{role_id(), list(), undefined | pid()}]}).

-record(evt_battle_unit_picked,
        {unit_id = {1, 1} :: {pos_integer(), pos_integer()},
         base_id = 1 :: pos_integer(),
         type = 102 :: pos_integer(),
         action_type = 1 :: pos_integer(),
         map_base_id = 1,
         x = 1,
         y = 1,
         role_id = {1, "", 0},
         role_name = "",
         role_pid}).

-record(evt_battle_unit_die,
        {unit_id = {1, 1} :: {pos_integer(), pos_integer()},
         base_id = 1 :: pos_integer(),
         type = 1 :: pos_integer()}).

-record(evt_create_unit,
        {unit_id = {1, 1}, base_id = 1, type = 1}).

-record(evt_team_join, {pid :: undefined | pid()}).

-record(evt_team_leave, {}).

-record(evt_team_away, {}).

-record(evt_team_follow, {}).

-record(evt_team_appoint, {status, leader_id}).

-record(evt_arena_fight, {}).

-record(evt_arena_win, {cup = 0}).

-record(evt_trial, {mode = 0}).

-record(evt_escort, {}).

-record(evt_friend, {num = 0}).

-record(evt_fairyland, {}).

-record(evt_fairyland_floor,
        {floor = 0, is_leader = 0}).

-record(evt_fairyland_box, {box_punish = 0}).

-record(evt_pet, {}).

-record(evt_pet_lev, {old_lev = 0, lev = 0}).

-record(evt_quest_offer_ring, {ring = 0, old_ring = 0}).

-record(evt_quest_offer_reward, {}).

-record(evt_qualifying_combat, {type = 0}).

-record(evt_qualifying_combat_over,
        {type = 0, win_flag = 0}).

-record(evt_guild_answer, {}).

-record(evt_parade, {}).

-record(evt_market_silver_first_on_sale, {}).

-record(evt_market_gold_bind_buy,
        {base_id = 0,
         num = 0,
         init_price = 0,
         price = 0,
         margin = 0}).

-record(evt_market_gold_bind_sold,
        {base_id = 0, price = 0}).

-record(evt_kill_guild_robber, {}).

-record(evt_shipping_sail, {type = 0}).

-record(evt_shipping_commit, {type = 0, pack_type = 0}).

-record(evt_shipping_help, {}).

-record(evt_treasure, {base_id = 0}).

-record(evt_treasure_compass, {}).

-record(evt_guild_propagate, {}).

-record(evt_pay, {sn = "", gold = 0, source = 0}).

-record(evt_kill_treasure_ghost, {}).

-record(evt_pray, {}).

-record(evt_skill_prac_levup, {id = 0, lev = 0}).

-record(evt_skill_life_levup, {id = 0, lev = 0}).

-record(evt_skill_life_produce,
        {id = 0, base_id = 0, num = 0}).

-record(evt_blacksmith_embed, {num = 0}).

-record(evt_blacksmith_embed_lev, {lev = 0}).

-record(evt_blacksmith_enchant,
        {base_id = 0,
         is_succ = 0,
         luck_list = 0,
         is_protect = 0,
         all_lev = 0,
         pre_all_lev = 0,
         sum_lev = 0,
         pre_sum_lev = 0}).

-record(evt_guild_plant_mature, {}).

-record(evt_examination, {type = 1 :: 1..3}).

-record(evt_question_match, {score = 0}).

-record(evt_question_match_answer, {is_right = 0}).

-record(evt_question_match_mvp, {}).

-record(evt_question_match_last_right, {count = 0}).

-record(evt_warrior_fight, {win_flag = 0}).

-record(evt_warrior_reward, {win_flag = 0, score = 0}).

-record(evt_warrior, {}).

-record(evt_gold_league_fight, {win_flag = 0}).

-record(evt_gold_league_reward,
        {win_flag = 0, score = 0}).

-record(evt_gold_league, {}).

-record(evt_achievement, {id = 0}).

-record(evt_gain_achieve, {val = 0}).

-record(evt_gain_gold_bind,
        {val = 1 :: pos_integer(),
         source :: undefined | atom()}).

-record(evt_have_gold_bind, {val = 1 :: pos_integer()}).

-record(evt_wing,
        {grade = 1 :: pos_integer(),
         growth = 1 :: pos_integer(),
         star = 0}).

-record(evt_wing_reset, {}).

-record(evt_wing_skill, {count = 0}).

-record(evt_wing_lev,
        {grade = 1 :: pos_integer(), star_lev = 0}).

-record(evt_fuse, {base_id = 0 :: non_neg_integer()}).

-record(evt_guild_post,
        {post = 0 :: non_neg_integer()}).

-record(evt_examination_answer,
        {is_right = 1 :: 1 | 2}).

-record(evt_pet_use_item, {base_id = 0}).

-record(evt_pet_repleace_skill, {}).

-record(evt_activity, {val = 0}).

-record(evt_pet_rename, {}).

-record(evt_pet_free, {}).

-record(evt_pet_stone_upgrade, {grade = 0}).

-record(evt_guard_upgrade_eqm, {}).

-record(evt_guard_reset_eqm, {}).

-record(evt_guard_embed_gem, {}).

-record(evt_friend_intimacy, {val = 0}).

-record(evt_friend_intimacy_camp,
        {val = 0, target_id = {0, "", 0}}).

-record(evt_friend_zone_photo, {}).

-record(evt_friend_zone_like, {val = 0}).

-record(evt_friend_zone_liked, {val = 0}).

-record(evt_friend_zone_like_baby, {val = 0}).

-record(evt_friend_zone_leave_trend, {}).

-record(evt_friend_zone_leave_trended, {val = 0}).

-record(evt_formation_lev, {id = 0, lev = 0}).

-record(evt_alchemy_produce, {item_list = []}).

-record(evt_alchemy_melt, {item_list = []}).

-record(evt_classes_challenge_order, {order = 0}).

-record(evt_classes_challenge_rank, {rank = 0}).

-record(evt_classes_challenge_up_rank, {rank = 0}).

-record(evt_market_silver_assets,
        {assets = coin, val = 0}).

-record(evt_market_silver_sold,
        {assets = [], sold_items = []}).

-record(evt_market_silver_buy, {num = 0}).

-record(evt_combat_statistics,
        {revive = 0,
         pet_revive = 0,
         cast_pet = 0,
         use_item = 0,
         is_win = 0,
         is_die = 0,
         guard = [],
         kill_group = 0,
         killed_group = 0,
         kill_group_pet = 0,
         kill_group_target = 0,
         killed_group_target = 0,
         kill_group_target_pet = 0}).

-record(evt_honor, {id = 0}).

-record(evt_pre_honor, {pre_id = 0}).

-record(evt_fashion, {}).

-record(evt_gain_character, {val = 1 :: pos_integer()}).

-record(evt_campaign_unit_match, {val = 0}).

-record(evt_campaign_unit_heap2, {val = 0}).

-record(evt_campaign_unit_match_boss, {val = 0}).

-record(evt_campaign_unit_card, {val = 0}).

-record(evt_campaign_unit_card_boss, {val = 0}).

-record(evt_campaign_unit_order, {val = 0}).

-record(evt_campaign_unit_order_boss, {val = 0}).

-record(evt_campaign_unit_steal, {val = 0}).

-record(evt_campaign_unit_kill, {val = 0}).

-record(evt_campaign_unit_base, {val = 0}).

-record(evt_campaign_unit_kill_boss, {val = 0}).

-record(evt_campaign_unit_fox, {val = 0}).

-record(evt_qualifying, {}).

-record(evt_gain_guild, {val = 1 :: pos_integer()}).

-record(evt_guard_score,
        {val = 0 :: non_neg_integer()}).

-record(evt_constellation,
        {lev = 0 :: non_neg_integer(),
         base_id = 0 :: non_neg_integer()}).

-record(evt_constellation_score,
        {lev = 0 :: non_neg_integer(),
         base_id = 0 :: non_neg_integer()}).

-record(evt_roll,
        {point = 0 :: non_neg_integer(),
         reward = 0 :: non_neg_integer()}).

-record(evt_finish_marriage_question, {}).

-record(evt_commit_marriage_question, {}).

-record(evt_marriage_flower, {}).

-record(evt_finish_couple_question, {}).

-record(evt_finish_couple_task, {}).

-record(evt_commit_couple_question, {}).

-record(evt_couple_flower, {}).

-record(evt_cultivate_plant, {}).

-record(evt_guild_plant_irrigate, {}).

-record(evt_teacher_score_sum, {score = 0}).

-record(evt_teacher_student, {num = 0}).

-record(evt_finish_ask_question, {fun_type = 0}).

-record(evt_teacher_to_sudent, {id = {0, "", 0}}).

-record(evt_teacher, {num = 0}).

-record(evt_commit_ask_question, {}).

-record(evt_get_pet_item_skill_guide, {}).

-record(evt_brave_trial_order, {order = 0}).

-record(evt_shipping_dun, {flag = 0}).

-record(evt_consume, {gold = 0, source = 0}).

-record(evt_guild_hero, {}).

-record(evt_hero, {}).

-record(evt_lover_combat, {win_flag = 0}).

-record(evt_wedding_treasure, {base_id = 0}).

-record(evt_constellation_first, {base_id = 0}).

-record(evt_boss_first, {base_id = 0}).

-record(evt_quest_prac_help, {}).

-record(evt_arena_win_rate, {classes = 0, rate = 0}).

-record(evt_wedding_guest, {}).

-record(evt_dragon_boat, {camp_id = 0}).

-record(evt_dragon_boat_rank, {camp_id = 0, rank = 0}).

-record(evt_dragon_boat_cplt,
        {camp_id = 0, time_span = 0}).

-record(evt_mount_dye_diff, {dye_id = 0, val = 0}).

-record(evt_arena_cup, {cup = 0}).

-record(evt_arena_cup_target, {id = 0}).

-record(evt_arena_roll, {flag = 0, num = 0}).

-record(evt_achi_num, {id = 0, num = 0}).

-record(evt_dun_first, {id = 0, floor = 0}).

-record(evt_tournament_combat, {type = 0}).

-record(evt_comprehend_eqm, {}).

-record(evt_elf_combat, {}).

-record(evt_finish_goal, {id = 0}).

-record(evt_hide_seek, {}).

-record(evt_hide_seek_help, {}).

-record(evt_hide_seek_reward, {}).

-record(evt_camp_fruit, {base_id = 0, num = 0}).

-record(evt_camp_fruit_help, {base_id = 0, num = 0}).

-record(evt_camp_fruit_reward, {}).

-record(evt_tournament,
        {awesome_kill = 0,
         awesome_kill_num = 0,
         awesome_dmg = 0,
         awesome_heal = 0,
         awesome_control = 0,
         mvp = 0,
         rank_lev = 0,
         liked = 0 :: non_neg_integer(),
         best_win_count = 0 :: non_neg_integer()}).

-record(evt_tournament_point,
        {rank_lev = 0, rank_point = 0}).

-record(evt_friend_circle,
        {photos = 0, mentions = 0, day_num = 0}).

-record(evt_friend_circle_liked, {num = 0, other = 0}).

-record(evt_friend_circle_like, {self = 0}).

-record(evt_friend_circle_commented,
        {num = 0, other = 0}).

-record(evt_friend_circle_comment, {self = 0}).

-record(evt_family_update, {type = 0, lev = 0}).

-record(evt_family, {lev = 0}).

-record(evt_family_env, {env = 0}).

-record(evt_family_self_magic_beans, {}).

-record(evt_family_help_magic_beans, {}).

-record(evt_family_furnishing, {type = 0, count = 0}).

-record(evt_own_mount, {status = 0, count = 0}).

-record(evt_mount_growth, {growth = 0}).

-record(evt_mount_appearand, {count = 0}).

-record(evt_mount_mange_pet, {}).

-record(evt_mount_lev, {lev = 0}).

-record(evt_mount_attr, {}).

-record(evt_everyday, {val = 0}).

-record(evt_campaign_reward,
        {type = 0, sec_type = 0, id = 0}).

-record(evt_wedding_day, {day = 0}).

-record(evt_lev_break, {}).

-record(evt_enjoy_moon, {}).

-record(evt_enjoy_moon_wish, {type = 1}).

-record(evt_join_glue_pudding, {}).

-record(evt_glue_pudding_answer, {result = 0}).

-record(evt_glue_pudding_win, {}).

-record(evt_join_kongming_lanterns, {camp_id = 0}).

-record(evt_kongming_lanterns_answer,
        {camp_id = 0, result = 0}).

-record(evt_kongming_lanterns_win, {camp_id = 0}).

-record(evt_join_mid_pudding, {}).

-record(evt_mid_pudding_answer, {result = 0}).

-record(evt_mid_pudding_win, {}).

-record(evt_mid_pudding_agenda, {}).

-record(evt_guild_dragon, {}).

-record(evt_lev_break_active, {}).

-record(evt_camp_cake_finish, {}).

-record(evt_camp_cake_exit, {}).

-record(evt_camp_cake_sub, {}).

-record(evt_national_wisdom, {}).

-record(evt_national_wisdom_right, {}).

-record(evt_national_wisdom_luckyer, {}).

-record(evt_campaign_bag_fill, {}).

-record(evt_rainbow_lottery_day, {}).

-record(evt_campaign_bag_reward, {}).

-record(evt_lev_break_exch, {val = 0}).

-record(evt_classes_modify_times, {times = 0}).

-record(evt_use_fruit_limit, {base_id = 0, lev = 0}).

-record(endless_challenge_cross, {wave = 0}).

-record(endless_challenge_card, {}).

-record(evt_camp_halloween, {}).

-record(evt_camp_halloween_rank, {win = 0, rank = 0}).

-record(evt_camp_halloween_first, {}).

-record(evt_sworn_finish, {times = 0}).

-record(evt_sworn_invite, {times = 0}).

-record(evt_sworn_defined_name, {times = 0}).

-record(evt_sworn_name, {times = 0}).

-record(evt_sworn_skill, {times = 0}).

-record(evt_other, {}).

-record(evt_guild_league_join, {}).

-record(evt_guild_league_cannon, {}).

-record(evt_guild_league_win, {}).

-record(evt_campaign_snow, {val = 0}).

-record(evt_child_info,
        {growth_type = 0, skills = [], talent_skills = []}).

-record(evt_child_eat, {base_id = 0, num = 0}).

-record(evt_child_study,
        {study_str = 0,
         study_con = 0,
         study_mag = 0,
         study_agi = 0,
         study_end = 0}).

-record(evt_go_to_bed, {}).

-record(evt_child_combat,
        {combat_type = 0 :: non_neg_integer(),
         is_win = 0 :: non_neg_integer()}).

-record(evt_child_deliver, {}).

-record(evt_child_grow, {stage}).

-record(evt_fashion_collect_lev, {lev = 0}).

-record(evt_maze, {times = 0}).

-record(evt_maze_sweep, {}).

-record(evt_maze_monster, {}).

-record(evt_maze_gold, {gold = 0}).

-record(evt_maze_monkey, {}).

-record(evt_maze_cat, {}).

-record(evt_may_day_bags, {}).

-record(evt_may_day_help, {}).

-record(evt_may_day_clean, {camp_id = 0}).

-record(evt_rencounter, {is_win = 0}).

-record(evt_rencounter_star,
        {rank_lev = 1, star = 0, total_star = 0}).

-record(evt_guild_siege_combat, {is_win = 0, star = 1}).

-record(evt_guild_dungeon, {}).

-record(evt_guild_pray, {}).

-record(evt_talisman, {type = 0, id = 0}).

-record(evt_camp_whiteday, {type = 0}).

-record(evt_camp_animal_chess, {}).

-record(evt_animal_chess_win, {}).

-record(evt_animal_chess_soldier, {}).

-record(evt_animal_chess_fail, {}).

-record(evt_animal_chess_coach_killed, {}).

-record(evt_animal_chess_kill_coach, {}).

-record(evt_animal_chess_kill_soldier, {}).

-record(evt_pet_add_point, {pet_id = 0, base_id = 0}).

-record(evt_combat_over,
        {combat_type = 0, win_flag = win}).

-record(evt_goodvoice, {}).

-record(evt_spirit_treasure_general, {}).

-record(evt_spirit_treasure_boss, {}).

-record(evt_spirit_treasure_offer_star, {star = 0}).

-record(evt_spirit_treasure_first_kill, {}).

-record(evt_spirit_treasure_boss_wave, {wave = 0}).

-record(evt_oracle_treasure_general, {}).

-record(evt_oracle_treasure_boss, {}).

-record(evt_oracle_treasure_offer_star, {star = 0}).

-record(evt_oracle_treasure_first_kill, {}).

-record(evt_oracle_treasure_boss_wave, {wave = 0}).

-record(evt_oracle_treasure_boss_times, {times = 0}).

-record(evt_camp_7_7th_point, {val = 0}).

-record(evt_chat_guild, {}).

-record(evt_guard_activate, {}).

-record(evt_exquisite_shelf_wave, {wave = 0}).

-record(evt_chat, {channel = undefined, content = ""}).

-record(evt_combat_wing_power, {val = 0}).

-record(evt_combat_sq_point,
        {combat_type = 0,
         is_win = lose,
         val = 0,
         unit_lev = 0}).

-record(evt_guild_dragon_times, {times = 0}).

-record(evt_guild_dragon_rank, {rank = 0}).

-record(evt_guild_dragon_total_point, {point = 0}).

-record(evt_exquisite_shelf_help, {}).

-record(evt_rushing_top_final_times, {final_times = 0}).

-record(g_evt_lev, {val = 0}).

-record(g_evt_member, {val = 0}).

-record(evt_expression, {}).

-record(evt_fuse_expression, {cost_item_id = 0}).

-record(evt_kingbadge,
        {base_id = 0 :: non_neg_integer()}).

-record(evt_sprog_mount, {}).

-record(evt_gods_duel_score, {score = 0}).

-record(evt_provocation_times, {}).

-record(evt_provocation_5v5, {}).

-record(evt_quest_offer_teacher, {}).

-record(evt_boss_teacher, {}).

-record(evt_constellation_kill, {}).

-record(evt_tower_teacher, {}).

-record(evt_gain_experience, {val = 0}).

-record(evt_provocation_use_horn, {}).

-record(evt_provocation_duel_win, {}).

-record(evt_provocation_duel_5v5_win, {}).

-record(evt_stars_trial,
        {base_id = 0,
         round = 99,
         use_item_num = 50,
         self_die_times = 0,
         pet_summon = 0,
         combat_formation = 0}).

-record(evt_stars_trial_combat_round, {dies = []}).

-record(evt_stars_trial_combat,
        {npc_dies = 0,
         after_die_done = 0,
         skill_use_times = []}).

-record(evt_camp_black_white_chess, {}).

-record(evt_black_white_chess_change_in_round,
        {change_num = 0}).

-record(evt_black_white_chess_win, {}).

-record(evt_black_white_chess_lose, {}).

-record(evt_black_white_chess_more_than_ops_chess,
        {num = 0}).

-record(evt_black_white_chess_draw_whitout_ask_draw,
        {}).

-record(evt_black_white_chess_win_remain_one_color, {}).

-record(evt_black_white_chess_lose_remain_one_color,
        {}).

-record(evt_canyon_summit_join, {}).

-record(evt_canyon_summit_cannon, {}).

-record(evt_canyon_summit_win, {}).

-record(evt_star_moon, {}).

-record(evt_truth_dare_join, {}).

-record(evt_truth_dare_lucky, {}).

-record(evt_truth_dare_lucky_choose, {type = 0}).

-record(evt_truth_dare_end, {type = 0}).

-record(evt_truth_dare_two_fail, {}).

-record(evt_truth_dare_one_shot, {}).

-record(evt_general_send_flower, {items = []}).

-file("src/mod/combat/combat_end.erl", 32).

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

-file("src/mod/combat/combat_end.erl", 33).

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

-file("src/mod/combat/combat_end.erl", 34).

-file("inc/wedding.hrl", 1).

-record(m_wedding,
        {ver = 1,
         lover_id = {0, "", 0},
         lover_name = "",
         status = 0,
         honor_ids = [],
         reward = [],
         mail = []}).

-record(lover,
        {id = {0, "", 0} ::
             {non_neg_integer(), bitstring(), non_neg_integer()},
         name = "" :: bitstring(),
         lover_id = {0, "", 0} ::
             {non_neg_integer(), bitstring(), non_neg_integer()},
         lover_name = "" :: bitstring(),
         type = 1 :: 1..2,
         status = 1 :: 0..2,
         ring_lev = 0 :: non_neg_integer(),
         intimacy = 0 :: non_neg_integer(),
         order_index = 0 :: non_neg_integer(),
         order_time = 0 :: non_neg_integer(),
         atmosp = 0 :: non_neg_integer(),
         index = 0 :: non_neg_integer(),
         time = 0 :: non_neg_integer(),
         lover_sex = 2 :: 0..2,
         lover_classes = 0,
         lover_lev = 0,
         lover_fc = 0,
         lover_pet_fc = 0,
         lover_face = 0}).

-record(guest,
        {id = {0, "", 0} ::
             {non_neg_integer(), bitstring(), non_neg_integer()},
         name = "" :: bitstring(),
         pid = 0 :: 0 | pid(),
         act_list = [],
         unit_list = [],
         classes = 0,
         sex = 0,
         lev = 0,
         face = 0}).

-record(wedding_atmosp_data,
        {type = 0 :: non_neg_integer(),
         min_val = 0 :: non_neg_integer(),
         max_val = 0 :: non_neg_integer(),
         exp = 0 :: non_neg_integer(),
         scene_reward = [] :: list(),
         scene_msg = "" :: string(),
         male_reward = [] :: list(),
         famale_reward = [] :: list(),
         title = "" :: string(),
         content = "" :: string()}).

-record(wedding_act_data,
        {id = 0,
         type = 0,
         target = 1,
         free_num = 0,
         max_num = 0,
         cost = [],
         msg = "",
         log_msg = "",
         atmosp = 0,
         gain = [],
         main_gain = [],
         effect_type = 0,
         effect_id = 1,
         effect_num = 1,
         cd = 0}).

-record(wedding_rank, {type = 0, list = []}).

-record(wedding_rank_rc,
        {id = {{0, "", 0}, {0, "", 0}},
         male_id = {0, "", 0},
         male_name = "",
         rank = 1,
         time = 0 :: non_neg_integer(),
         male_sex = 0 :: 0..2,
         male_classes = 0 :: 0..4,
         male_lev = 0 :: non_neg_integer(),
         female_id = {0, "", 0},
         female_name = "",
         female_sex = 0 :: 0..2,
         female_classes = 0 :: 0..4,
         female_lev = 0 :: non_neg_integer(),
         val1 = 0 :: non_neg_integer(),
         val2 = 0 :: non_neg_integer(),
         val3 = 0 :: non_neg_integer(),
         val4 = 0 :: non_neg_integer(),
         desc = ""}).

-record(wedding_rank_cfg,
        {type = 0 :: non_neg_integer(),
         num = 100 :: non_neg_integer(),
         keys =
             [#wedding_rank_rc.val3,
              #wedding_rank_rc.val2,
              #wedding_rank_rc.val1]
             :: [pos_integer()],
         min_val = 1 :: pos_integer()}).

-record(wedding_unit_data,
        {id = 0, target = 0, rand = [], limit = 0}).

-record(wedding_rank_honor_data,
        {type = 0,
         rank = 0,
         male_honor = 0,
         female_honor = 0,
         reward = [],
         title = "",
         content = ""}).

-record(wedding_rank_honor_type_data,
        {type = 0, day = day}).

-file("src/mod/combat/combat_end.erl", 35).

-file("inc/mount.hrl", 1).

-record(mount_goal,
        {ver = 1 :: non_neg_integer(),
         finish = [] :: list(),
         doing = [] :: list(),
         day_reward = [] :: list()}).

-record(m_mount,
        {ver = 10 :: pos_integer(),
         mounts = [] :: list(),
         mount_goal = #mount_goal{},
         next_mount_id = 1 :: non_neg_integer(),
         ride_mount = 0,
         appearance_list = [],
         combat_active_times = [],
         dye_list = [],
         dye_diff_list = [],
         pre_mount_status = 0 :: non_neg_integer(),
         evolution_list = [],
         double_ride_role = {1, "", 0} ::
             {pos_integer(), list(), non_neg_integer()},
         is_driver = 0}).

-record(mount,
        {ver = 4 :: pos_integer(),
         index = 0 :: non_neg_integer(),
         mount_base_id = 0 :: non_neg_integer(),
         transformation_id = 0 :: non_neg_integer(),
         lev = 1 :: pos_integer(),
         skill_point = 1 :: pos_integer(),
         fail_times = 0 :: non_neg_integer(),
         upgrade_lev = 0 :: non_neg_integer(),
         live_status = 0,
         skill_list = [],
         fight_times = 0 :: non_neg_integer(),
         spirit = 0 :: non_neg_integer(),
         growth = 1 :: pos_integer(),
         growth_item_num = 0 :: non_neg_integer(),
         speed_lev = 1 :: pos_integer(),
         manger_pets = [],
         tmp_growth = 1 :: pos_integer(),
         tmp_skill_list = [],
         decorate_list = [],
         score = 0,
         expire_time = 0}).

-record(mount_skill,
        {skill_index = 1 :: pos_integer(),
         skill_id = 1 :: non_neg_integer(),
         skill_lev = 0 :: non_neg_integer()}).

-record(mount_decorate,
        {decorate_index = 1 :: pos_integer(),
         decorate_base_id = 0 :: non_neg_integer(),
         is_hide = 0 :: non_neg_integer()}).

-record(mount_dye,
        {trans_id = 0, dye_id = 0, cache_dye_list = []}).

-record(mount_evolution,
        {trans_id = 0, evolution_id = 0}).

-file("src/mod/combat/combat_end.erl", 36).

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

-file("src/mod/combat/combat_end.erl", 37).

-file("inc/campaign.hrl", 1).

-record(campaign_eggs,
        {ver = 0,
         location = 0 :: non_neg_integer(),
         footprints = [],
         last_moved = 0 :: non_neg_integer(),
         rolled = 0 :: non_neg_integer(),
         rewarded = []}).

-record(camp_login,
        {camp_id = 0,
         m_time = 0,
         num = 0,
         days = [],
         buys = []}).

-record(camp_login_data,
        {day = 0, reward = [], buys = [], cost = []}).

-record(camp_login_buy_data,
        {id = 0, reward = [], cost = [], cd = 0}).

-record(campaign_bags,
        {ver = 0,
         collected = [],
         last_filled = 0 :: non_neg_integer(),
         rewarded = 0}).

-record(campaign_card,
        {ver = 0,
         card_ver = 0,
         init = 0,
         times = 0,
         card_list = []}).

-record(campaign_card_open,
        {ver = 0,
         card_ver = 0,
         times = 0,
         init = 0,
         card_list = []}).

-record(camp_wish_flower,
        {ver = 1,
         floor = 1,
         times = 0,
         all_times = 0,
         camp_id = 0}).

-record(camp_new_flop,
        {ver = 1,
         group = 0,
         times = 0,
         rewarded = [],
         camp_id = 0}).

-record(camp_consume_rebate,
        {ver = 1, limit_item = []}).

-record(camp_new_acc_charge,
        {ver = 1, charge_val = 0, get_reward = []}).

-record(camp_charge_seven_gift,
        {ver = 1, id = 0, buy_time = 0, can_reward = []}).

-record(camp_lucky_tree,
        {id = 0,
         times = 0,
         reward_list = [],
         delay_reward = []}).

-record(camp_long_active,
        {ver = 1,
         id = 0,
         lev = 0,
         token_list = [],
         reward_levs = [],
         week_box = 0,
         last_reset_time = 0}).

-record(m_campaign,
        {ver = 27,
         acc = [] :: list(),
         can_reward = [] :: list(),
         rewarded = [] :: list(),
         eggs = #campaign_eggs{},
         bags = #campaign_bags{},
         first_charge_double = [],
         camp_login = #camp_login{},
         hide_seek,
         login_roll,
         recharge = camp_series_recharge:init(),
         camp_card = #campaign_card{},
         wish_times = 0,
         camp_limit = [],
         camp_card_open = #campaign_card_open{},
         recharge_open = camp_series_recharge_open:init(),
         camp_wish_flower = #camp_wish_flower{},
         camp_doll = camp_doll:init(),
         camp_sign,
         camp_exchange,
         camp_animal_chess,
         camp_new_flop = #camp_new_flop{},
         multiplex_assert = 0,
         camp_consume_rebate = camp_consume_rebate:init(),
         camp_black_white_chess =
             camp_black_white_chess_mgr:init(),
         camp_scratch_card = camp_scratch_card:init(),
         camp_new_acc_charge = camp_new_acc_charge:init(),
         camp_charge_seven_gift = camp_charge_seven_gift:init(),
         camp_lucky_tree = camp_lucky_tree:init(),
         camp_long_active = camp_long_active:init(),
         gift_custom = camp_gift_custom:init()}).

-record(campaign_handle,
        {time = 0 :: non_neg_integer(),
         evt = {evt_rpc} :: tuple(),
         call_from = rpc :: evt | rpc,
         add_can_reward = 0 :: non_neg_integer(),
         camp :: undefined | tuple(),
         camp_info :: undefined | tuple(),
         push_list = [] :: [tuple()],
         push_cli = 0 :: 0..1,
         rpc_reward_num = 1 :: non_neg_integer(),
         return_acc = 0}).

-record(camp_collection,
        {camp_end_time = 0,
         reward_list = [],
         extra_data = [],
         random_index,
         red_dot}).

-record(camp_ico,
        {id = 0 :: non_neg_integer(),
         ico_id = 0 :: non_neg_integer(),
         name = "",
         is_show = 0 :: 0..1,
         start_time = 0 :: non_neg_integer() | tuple(),
         end_time = 0 :: non_neg_integer() | tuple(),
         white_list = [] :: list(),
         black_list = [] :: list(),
         min_open_time = 0 :: non_neg_integer() | tuple(),
         max_open_time = 0 :: non_neg_integer() | tuple()}).

-record(camp_cfg,
        {id = 0 :: non_neg_integer(),
         name = "" :: bitstring(),
         group_id = 0 :: non_neg_integer(),
         start_time = 0 :: non_neg_integer() | tuple(),
         end_time = 0 :: non_neg_integer() | tuple(),
         cli_start_time = 0 :: non_neg_integer() | tuple(),
         cli_end_time = 0 :: non_neg_integer() | tuple(),
         type = 0 :: pos_integer(),
         sec_type = 0 :: non_neg_integer(),
         status = 1 :: 0..1,
         reward_type = 2 :: pos_integer(),
         settlement = 2 :: non_neg_integer(),
         reward_title = "" :: bitstring(),
         reward_content = "" :: bitstring(),
         loss_items = [] :: list(),
         auto_buy = 0,
         reward = [] :: list(),
         camp_cond :: undefined | tuple(),
         reward_max = 1 :: non_neg_integer(),
         white_list = [] :: list(),
         black_list = [] :: list(),
         min_open_time = 0 :: non_neg_integer() | tuple(),
         max_open_time = 0 :: non_neg_integer() | tuple(),
         finish_id = 0 :: non_neg_integer(),
         finish_days = 0 :: non_neg_integer(),
         finish_end_days = 0 :: non_neg_integer(),
         cond_reward = [],
         merge_min = 0,
         merge_max = 0,
         is_keep_time = 0}).

-record(camp_cache,
        {id = 0 :: non_neg_integer(),
         sec_type = 0 :: non_neg_integer(),
         is_srv_open = 0 :: 0..1,
         start_time = 0 :: non_neg_integer(),
         end_time = 0 :: non_neg_integer(),
         cli_start_time = 0 :: non_neg_integer(),
         cli_end_time = 0 :: non_neg_integer()}).

-record(camp_unit,
        {id = {0, 0}, base_id = 0, map_id = 0}).

-record(camp_time,
        {id = 0, start_time = 0, end_time = 0}).

-record(camp_item,
        {item = 0,
         start_time = 0,
         end_time = 0,
         open = 0,
         msg = 0}).

-record(camp_assets_data,
        {type = 0, items = [], max = 0, var_type = day}).

-record(camp_gift_custom,
        {ver = 1,
         camp_id = 0,
         gift = [],
         buy = [],
         extra_reward = 0}).

-file("src/mod/combat/combat_end.erl", 38).

-file("inc/camp_7_7th.hrl", 1).

-author("jia").

-record(camp_7_7th_sign,
        {id = {0, "", 0},
         name = "",
         classes = 0,
         head_id = 0,
         sex = 0 :: 0..2,
         lev = 0,
         time,
         msg = "",
         is_sign = 0,
         online = 0}).

-record(m_camp_7_7th,
        {other_id = {0, "", 0},
         other_name = "",
         other_sex = 0,
         other_lev = 0,
         other_classes = 0,
         status = 0,
         point = 0,
         get_times = 1,
         time = 0}).

-record(camp_7_7th_link,
        {id = {0, "", 0}, is_break = 0}).

-file("src/mod/combat/combat_end.erl", 39).

-file("inc/buff.hrl", 1).

-record(m_buff, {ver = 2, r_list = [], show = 1}).

-record(buff_base,
        {id = 1,
         name = "",
         class = 0,
         lev = 0,
         cancel = 0,
         same_buff_mode = 0,
         type = 1,
         sub_type = 0,
         time_mode = 0,
         max_time_num = 1,
         duration = 0,
         max_effect_lev = 1,
         looks = [],
         attr = [],
         guard_attr = [],
         pet_attr = [],
         end_date = 0,
         extra = [],
         effect = [],
         dynamic_attr = [],
         pvp_limit = 0,
         desc = ""}).

-record(buff,
        {ver = 4,
         id = 1,
         class = 0,
         lev = 0,
         cancel = 0,
         type = 1,
         same_buff_mode = 0,
         time_mode = 0,
         duration = 0,
         max_duration = 1,
         effect_lev = 1,
         end_date = 0,
         start_time = 0,
         looks = [],
         dynamic_attr = [],
         pvped = 0,
         ext_param = [],
         args = 1}).

-file("src/mod/combat/combat_end.erl", 40).

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

-file("src/mod/combat/combat_end.erl", 41).

combat_over(Combat = #combat{type = 1, winner = Winner,
                             loser = Loser}) ->
    {RatioVal, Rewards} = loser_exit_combat(sync,
                                            Loser,
                                            Combat),
    AssignResult = assign_gains(Rewards, Winner, Loser),
    winner_exit_combat(Winner,
                       Combat#combat{assign_gains = AssignResult,
                                     ratio_val = RatioVal});
combat_over(Combat = #combat{type = 3, winner = Winner,
                             loser = Loser}) ->
    {RatioVal, Rewards} = loser_exit_combat(sync,
                                            Loser,
                                            Combat),
    AssignResult = assign_gains(Rewards, Winner, Loser),
    winner_exit_combat(Winner,
                       Combat#combat{assign_gains = AssignResult,
                                     ratio_val = RatioVal});
combat_over(Combat = #combat{type = 2, winner = Winner,
                             loser = Loser}) ->
    {RatioVal, Rewards} = loser_exit_combat(sync,
                                            Loser,
                                            Combat),
    AssignResult = assign_gains(Rewards, Winner, Loser),
    winner_exit_combat(Winner,
                       Combat#combat{assign_gains = AssignResult,
                                     ratio_val = RatioVal});
combat_over(Combat = #combat{type = 11, winner = Winner,
                             loser = Loser}) ->
    dungeon_mgr:combat_over(Combat),
    {RatioVal, Rewards} = loser_exit_combat(sync,
                                            Loser,
                                            Combat),
    AssignResult = assign_gains(Rewards, Winner, Loser),
    winner_exit_combat(Winner,
                       Combat#combat{assign_gains = AssignResult,
                                     ratio_val = RatioVal});
combat_over(Combat = #combat{type = 51, winner = Winner,
                             loser = Loser}) ->
    {RatioVal, Rewards} = loser_exit_combat(sync,
                                            Loser,
                                            Combat),
    AssignResult = assign_gains(Rewards, Winner, Loser),
    winner_exit_combat(Winner,
                       Combat#combat{assign_gains = AssignResult,
                                     ratio_val = RatioVal});
combat_over(Combat = #combat{type = 23, winner = Winner,
                             loser = Loser}) ->
    {RatioVal, Rewards} = loser_exit_combat(sync,
                                            Loser,
                                            Combat),
    AssignResult = assign_gains(Rewards, Winner, Loser),
    winner_exit_combat(Winner,
                       Combat#combat{assign_gains = AssignResult,
                                     ratio_val = RatioVal});
combat_over(Combat = #combat{type = 24, winner = Winner,
                             loser = Loser}) ->
    {RatioVal, Rewards} = loser_exit_combat(sync,
                                            Loser,
                                            Combat),
    AssignResult = assign_gains(Rewards, Winner, Loser),
    winner_exit_combat(Winner,
                       Combat#combat{assign_gains = AssignResult,
                                     ratio_val = RatioVal});
combat_over(Combat = #combat{type = 38, winner = Winner,
                             loser = Loser}) ->
    {RatioVal, Rewards} = loser_exit_combat(sync,
                                            Loser,
                                            Combat),
    AssignResult = assign_gains(Rewards, Winner, Loser),
    winner_exit_combat(Winner,
                       Combat#combat{assign_gains = AssignResult,
                                     ratio_val = RatioVal});
combat_over(Combat = #combat{type = 39, winner = Winner,
                             loser = Loser}) ->
    {RatioVal, Rewards} = loser_exit_combat(sync,
                                            Loser,
                                            Combat),
    AssignResult = assign_gains(Rewards, Winner, Loser),
    winner_exit_combat(Winner,
                       Combat#combat{assign_gains = AssignResult,
                                     ratio_val = RatioVal});
combat_over(Combat = #combat{type = 42, winner = Winner,
                             loser = Loser}) ->
    {RatioVal, Rewards} = loser_exit_combat(sync,
                                            Loser,
                                            Combat),
    AssignResult = assign_gains(Rewards, Winner, Loser),
    winner_exit_combat(Winner,
                       Combat#combat{assign_gains = AssignResult,
                                     ratio_val = RatioVal});
combat_over(Combat = #combat{type = 35, winner = Winner,
                             loser = Loser}) ->
    {RatioVal, Rewards} = loser_exit_combat(sync,
                                            Loser,
                                            Combat),
    AssignResult = assign_gains(Rewards, Winner, Loser),
    winner_exit_combat(Winner,
                       Combat#combat{assign_gains = AssignResult,
                                     ratio_val = RatioVal});
combat_over(Combat = #combat{type = 31, winner = Winner,
                             loser = Loser}) ->
    {RatioVal, Rewards} = loser_exit_combat(sync,
                                            Loser,
                                            Combat),
    AssignResult = assign_gains(Rewards, Winner, Loser),
    winner_exit_combat(Winner,
                       Combat#combat{assign_gains = AssignResult,
                                     ratio_val = RatioVal});
combat_over(Combat = #combat{type = 57, winner = Winner,
                             loser = Loser}) ->
    {RatioVal, Rewards} = loser_exit_combat(sync,
                                            Loser,
                                            Combat),
    AssignResult = assign_gains(Rewards, Winner, Loser),
    winner_exit_combat(Winner,
                       Combat#combat{assign_gains = AssignResult,
                                     ratio_val = RatioVal});
combat_over(Combat = #combat{type = 32, winner = Winner,
                             loser = Loser}) ->
    {RatioVal, Rewards} = loser_exit_combat(sync,
                                            Loser,
                                            Combat),
    AssignResult = assign_gains(Rewards, Winner, Loser),
    winner_exit_combat(Winner,
                       Combat#combat{assign_gains = AssignResult,
                                     ratio_val = RatioVal});
combat_over(Combat = #combat{type = 47, winner = Winner,
                             loser = Loser}) ->
    {RatioVal, Rewards} = loser_exit_combat(sync,
                                            Loser,
                                            Combat),
    AssignResult = assign_gains(Rewards, Winner, Loser),
    winner_exit_combat(Winner,
                       Combat#combat{assign_gains = AssignResult,
                                     ratio_val = RatioVal});
combat_over(Combat = #combat{type = 48, winner = Winner,
                             loser = Loser}) ->
    {RatioVal, Rewards} = loser_exit_combat(sync,
                                            Loser,
                                            Combat),
    AssignResult = assign_gains(Rewards, Winner, Loser),
    winner_exit_combat(Winner,
                       Combat#combat{assign_gains = AssignResult,
                                     ratio_val = RatioVal});
combat_over(Combat = #combat{type = 16, winner = Winner,
                             loser = Loser}) ->
    tower:combat_over(Combat),
    {RatioVal, Rewards} = loser_exit_combat(sync,
                                            Loser,
                                            Combat),
    AssignResult = assign_gains(Rewards, Winner, Loser),
    friend:combat_add_intimacy(Winner, 1),
    winner_exit_combat(Winner,
                       Combat#combat{assign_gains = AssignResult,
                                     ratio_val = RatioVal});
combat_over(Combat = #combat{type = 100,
                             winner = Winner, loser = Loser}) ->
    AssignResult = arena:combat_over(Combat),
    NewCombat = Combat#combat{assign_gains = AssignResult},
    loser_exit_combat(async, Loser, NewCombat),
    winner_exit_combat(Winner, NewCombat);
combat_over(Combat = #combat{type = 8, winner = Winner,
                             loser = Loser}) ->
    {RatioVal, Rewards} = loser_exit_combat(sync,
                                            Loser,
                                            Combat),
    AssignResult = assign_gains(Rewards, Winner, Loser),
    winner_exit_combat(Winner,
                       Combat#combat{ratio_val = RatioVal,
                                     assign_gains = AssignResult});
combat_over(Combat = #combat{type = 5, winner = Winner,
                             loser = Loser}) ->
    world_boss:combat_over(Combat),
    {RatioVal, Rewards} = loser_exit_combat(sync,
                                            Loser,
                                            Combat),
    AssignResult = assign_gains(Rewards, Winner, Loser),
    friend:combat_add_intimacy(Winner, 1),
    NewCombat = Combat#combat{assign_gains = AssignResult,
                              ratio_val = RatioVal},
    winner_exit_combat(Winner, NewCombat);
combat_over(Combat = #combat{type = 7, winner = Winner,
                             loser = Loser}) ->
    {RatioVal, Rewards} = loser_exit_combat(sync,
                                            Loser,
                                            Combat),
    AssignResult = assign_gains(Rewards, Winner, Loser),
    escort:combat_over(Combat),
    winner_exit_combat(Winner,
                       Combat#combat{assign_gains = AssignResult,
                                     ratio_val = RatioVal});
combat_over(Combat = #combat{type = 9, winner = Winner,
                             loser = Loser}) ->
    {RatioVal, Rewards} = loser_exit_combat(sync,
                                            Loser,
                                            Combat),
    AssignResult = assign_gains(Rewards, Winner, Loser),
    NewCombat = Combat#combat{assign_gains = AssignResult,
                              ratio_val = RatioVal},
    guild_robber:combat_over(Combat),
    winner_exit_combat(Winner, NewCombat);
combat_over(Combat = #combat{type = 14, winner = Winner,
                             loser = Loser}) ->
    {RatioVal, Rewards} = loser_exit_combat(sync,
                                            Loser,
                                            Combat),
    AssignResult = assign_gains(Rewards, Winner, Loser),
    NewCombat = Combat#combat{assign_gains = AssignResult,
                              ratio_val = RatioVal},
    winner_exit_combat(Winner, NewCombat);
combat_over(Combat = #combat{type = 13, winner = Winner,
                             loser = Loser}) ->
    {RatioVal, Rewards} = loser_exit_combat(sync,
                                            Loser,
                                            Combat),
    AssignResult = assign_gains(Rewards, Winner, Loser),
    NewCombat = Combat#combat{assign_gains = AssignResult,
                              ratio_val = RatioVal},
    winner_exit_combat(Winner, NewCombat);
combat_over(Combat = #combat{type = 10, winner = Winner,
                             loser = Loser}) ->
    {RatioVal, Rewards} = loser_exit_combat(sync,
                                            Loser,
                                            Combat),
    AssignResult = assign_gains(Rewards, Winner, Loser),
    winner_exit_combat(Winner,
                       Combat#combat{assign_gains = AssignResult,
                                     ratio_val = RatioVal});
combat_over(Combat = #combat{type = 22, winner = Winner,
                             loser = Loser}) ->
    {RatioVal, Rewards} = loser_exit_combat(sync,
                                            Loser,
                                            Combat),
    AssignResult = assign_gains(Rewards, Winner, Loser),
    winner_exit_combat(Winner,
                       Combat#combat{assign_gains = AssignResult,
                                     ratio_val = RatioVal});
combat_over(Combat = #combat{type = 19, winner = Winner,
                             loser = Loser}) ->
    fairyland:combat_over(Combat),
    {RatioVal, Rewards} = loser_exit_combat(sync,
                                            Loser,
                                            Combat),
    AssignResult = assign_gains(Rewards, Winner, Loser),
    NewCombat = Combat#combat{assign_gains = AssignResult,
                              ratio_val = RatioVal},
    winner_exit_combat(Winner, NewCombat);
combat_over(Combat = #combat{type = 18, winner = Winner,
                             loser = Loser}) ->
    {RatioVal, Rewards} = loser_exit_combat(sync,
                                            Loser,
                                            Combat),
    AssignResult = assign_gains(Rewards, Winner, Loser),
    NewCombat = Combat#combat{assign_gains = AssignResult,
                              ratio_val = RatioVal},
    winner_exit_combat(Winner, NewCombat);
combat_over(Combat = #combat{type = 15, winner = Winner,
                             loser = Loser}) ->
    {RatioVal, Rewards} = loser_exit_combat(sync,
                                            Loser,
                                            Combat),
    AssignResult = assign_gains(Rewards, Winner, Loser),
    winner_exit_combat(Winner,
                       Combat#combat{assign_gains = AssignResult,
                                     ratio_val = RatioVal});
combat_over(Combat = #combat{type = 26, winner = Winner,
                             loser = Loser}) ->
    constellation:combat_over(Combat),
    {RatioVal, Rewards} = loser_exit_combat(sync,
                                            Loser,
                                            Combat),
    AssignResult = assign_gains(Rewards, Winner, Loser),
    NewCombat = Combat#combat{assign_gains = AssignResult,
                              ratio_val = RatioVal},
    winner_exit_combat(Winner, NewCombat);
combat_over(Combat = #combat{type = 68, winner = Winner,
                             loser = Loser}) ->
    stars_trial_mgr:combat_over(Combat),
    {RatioVal, Rewards} = loser_exit_combat(sync,
                                            Loser,
                                            Combat),
    AssignResult = assign_gains(Rewards, Winner, Loser),
    NewCombat = Combat#combat{assign_gains = AssignResult,
                              ratio_val = RatioVal},
    case lists:keymember(1, #fighter.type, Winner) of
        true ->
            MaxDieTimes = lists:max([DieTimes
                                     || #fighter{combat_statistics =
                                                     #combat_statistics{die_times
                                                                            =
                                                                            DieTimes}}
                                            <- Loser]),
            AfterDieFlag = case [ok
                                 || #fighter{is_die_disappear = 0,
                                             combat_statistics =
                                                 #combat_statistics{is_die = 1,
                                                                    after_die_done
                                                                        = 0}}
                                        <- Loser]
                               of
                               L = [_ | _] when length(L) >= 5 -> 1;
                               _ -> 0
                           end,
            Fun = fun (#fighter{combat_statistics =
                                    #combat_statistics{skill_use_times =
                                                           SkillUse}},
                       Rtn) ->
                          format:merge_val(SkillUse, Rtn);
                      (_, Rtn) -> Rtn
                  end,
            UnitSkillUse = lists:foldl(Fun, [], Loser),
            CombatEvt = #evt_stars_trial_combat{npc_dies =
                                                    MaxDieTimes,
                                                after_die_done = AfterDieFlag,
                                                skill_use_times = UnitSkillUse},
            logger:debug("银月战斗成就=========:~w",
                         [CombatEvt],
                         combat_end,
                         223),
            [role_trigger:async_fire(OriginId, CombatEvt)
             || #fighter{type = 1, origin_id = OriginId} <- Winner],
            ok;
        _ -> ok
    end,
    winner_exit_combat(Winner, NewCombat);
combat_over(Combat = #combat{type = 72, winner = Winner,
                             loser = Loser}) ->
    star_moon_mgr:combat_over(Combat),
    {RatioVal, Rewards} = loser_exit_combat(sync,
                                            Loser,
                                            Combat),
    AssignResult = assign_gains(Rewards, Winner, Loser),
    NewCombat = Combat#combat{assign_gains = AssignResult,
                              ratio_val = RatioVal},
    winner_exit_combat(Winner, NewCombat);
combat_over(Combat = #combat{type = 105,
                             winner = Winner, loser = Loser}) ->
    guild_war:combat_over(Combat),
    loser_exit_combat(async, Loser, Combat),
    winner_exit_combat(Winner, Combat);
combat_over(Combat = #combat{type = 28, winner = Winner,
                             loser = Loser}) ->
    guild_treasure:combat_over(Combat),
    {RatioVal, Rewards} = loser_exit_combat(sync,
                                            Loser,
                                            Combat),
    AssignResult = assign_gains(Rewards, Winner, Loser),
    NewCombat = Combat#combat{assign_gains = AssignResult,
                              ratio_val = RatioVal},
    winner_exit_combat(Winner, NewCombat);
combat_over(Combat = #combat{type = 106,
                             winner = Winner, loser = Loser}) ->
    guild_hero:combat_over(Combat),
    loser_exit_combat(async, Loser, Combat),
    winner_exit_combat(Winner, Combat);
combat_over(Combat = #combat{type = 37, winner = Winner,
                             loser = Loser}) ->
    {RatioVal, Rewards} = loser_exit_combat(sync,
                                            Loser,
                                            Combat),
    AssignResult = assign_gains(Rewards, Winner, Loser),
    NewCombat = Combat#combat{assign_gains = AssignResult,
                              ratio_val = RatioVal},
    winner_exit_combat(Winner, NewCombat);
combat_over(Combat = #combat{type = 40, winner = Winner,
                             loser = Loser}) ->
    tournament:combat_over(Combat),
    loser_exit_combat(async, Loser, Combat),
    winner_exit_combat(Winner, Combat);
combat_over(Combat = #combat{type = 58, winner = Winner,
                             loser = Loser}) ->
    tournament:combat_over(Combat),
    loser_exit_combat(async, Loser, Combat),
    winner_exit_combat(Winner, Combat);
combat_over(Combat = #combat{type = 43, winner = Winner,
                             loser = Loser}) ->
    endless_challenge_combat:combat_over(Combat),
    loser_exit_combat(async, Loser, Combat),
    winner_exit_combat(Winner, Combat);
combat_over(Combat = #combat{type = 45, winner = Winner,
                             loser = Loser}) ->
    lev_break:combat_over(Combat),
    loser_exit_combat(async, Loser, Combat),
    winner_exit_combat(Winner, Combat);
combat_over(Combat = #combat{type = 108,
                             winner = Winner, loser = Loser}) ->
    guild_league_role:combat_over(Combat),
    loser_exit_combat(async, Loser, Combat),
    winner_exit_combat(Winner, Combat);
combat_over(Combat = #combat{type = 116,
                             winner = Winner, loser = Loser}) ->
    canyon_summit_role:combat_over(Combat),
    loser_exit_combat(async, Loser, Combat),
    winner_exit_combat(Winner, Combat);
combat_over(Combat = #combat{type = 49, winner = Winner,
                             loser = Loser}) ->
    sworn:combat_over(Combat),
    loser_exit_combat(async, Loser, Combat),
    winner_exit_combat(Winner, Combat);
combat_over(Combat = #combat{type = 110,
                             winner = Winner, loser = Loser}) ->
    gods_duel_match:combat_over(Combat),
    loser_exit_combat(async, Loser, Combat),
    winner_exit_combat(Winner, Combat);
combat_over(Combat = #combat{type = 111,
                             winner = Winner, loser = Loser}) ->
    gods_duel_match:combat_over(Combat),
    loser_exit_combat(async, Loser, Combat),
    winner_exit_combat(Winner, Combat);
combat_over(Combat = #combat{type = 55, winner = Winner,
                             loser = Loser}) ->
    maze:combat_over(Combat),
    {RatioVal, Rewards} = loser_exit_combat(sync,
                                            Loser,
                                            Combat),
    AssignResult = assign_gains(Rewards, Winner, Loser),
    winner_exit_combat(Winner,
                       Combat#combat{assign_gains = AssignResult,
                                     ratio_val = RatioVal});
combat_over(Combat = #combat{type = 113,
                             winner = Winner, loser = Loser}) ->
    rencounter_mgr:combat_over(Combat),
    loser_exit_combat(async, Loser, Combat),
    winner_exit_combat(Winner, Combat);
combat_over(Combat = #combat{type = 56, winner = Winner,
                             loser = Loser}) ->
    guild_dungeon:combat_over(Combat),
    {RatioVal, Rewards} = loser_exit_combat(sync,
                                            Loser,
                                            Combat),
    AssignResult = assign_gains(Rewards, Winner, Loser),
    winner_exit_combat(Winner,
                       Combat#combat{assign_gains = AssignResult,
                                     ratio_val = RatioVal});
combat_over(Combat = #combat{type = 61, winner = Winner,
                             loser = Loser}) ->
    spirit_treasure_mgr:combat_over(Combat),
    {RatioVal, Rewards} = loser_exit_combat(async,
                                            Loser,
                                            Combat),
    AssignResult = assign_gains(Rewards, Winner, Loser),
    winner_exit_combat(Winner,
                       Combat#combat{assign_gains = AssignResult,
                                     ratio_val = RatioVal});
combat_over(Combat = #combat{type = 62, winner = Winner,
                             loser = Loser}) ->
    spirit_treasure_combat:combat_over(Combat),
    {RatioVal, Rewards} = loser_exit_combat(async,
                                            Loser,
                                            Combat),
    AssignResult = assign_gains(Rewards, Winner, Loser),
    winner_exit_combat(Winner,
                       Combat#combat{assign_gains = AssignResult,
                                     ratio_val = RatioVal});
combat_over(Combat = #combat{type = 69, winner = Winner,
                             loser = Loser}) ->
    oracle_treasure_mgr:combat_over(Combat),
    {RatioVal, Rewards} = loser_exit_combat(async,
                                            Loser,
                                            Combat),
    AssignResult = assign_gains(Rewards, Winner, Loser),
    winner_exit_combat(Winner,
                       Combat#combat{assign_gains = AssignResult,
                                     ratio_val = RatioVal});
combat_over(Combat = #combat{type = 70, winner = Winner,
                             loser = Loser}) ->
    oracle_treasure_combat:combat_over(Combat),
    {RatioVal, Rewards} = loser_exit_combat(async,
                                            Loser,
                                            Combat),
    AssignResult = assign_gains(Rewards, Winner, Loser),
    winner_exit_combat(Winner,
                       Combat#combat{assign_gains = AssignResult,
                                     ratio_val = RatioVal});
combat_over(Combat = #combat{type = 63, winner = Winner,
                             loser = Loser}) ->
    exquisite_shelf_mgr:combat_over(Combat),
    {RatioVal, Rewards} = loser_exit_combat(async,
                                            Loser,
                                            Combat),
    AssignResult = assign_gains(Rewards, Winner, Loser),
    winner_exit_combat(Winner,
                       Combat#combat{assign_gains = AssignResult,
                                     ratio_val = RatioVal});
combat_over(Combat = #combat{type = CombatType,
                             winner = Winner, loser = Loser})
    when CombatType =:= 65 orelse CombatType =:= 66 ->
    guild_dragon_mgr:combat_over(Combat),
    {RatioVal, Rewards} = loser_exit_combat(async,
                                            Loser,
                                            Combat),
    AssignResult = assign_gains(Rewards, Winner, Loser),
    winner_exit_combat(Winner,
                       Combat#combat{assign_gains = AssignResult,
                                     ratio_val = RatioVal});
combat_over(Combat = #combat{type = 115,
                             winner = Winner, loser = Loser}) ->
    provocation_mgr:combat_over(Combat),
    loser_exit_combat(async, Loser, Combat),
    winner_exit_combat(Winner, Combat);
combat_over(Combat = #combat{type = 71, winner = Winner,
                             loser = Loser}) ->
    gods_challenge_mgr:combat_over(Combat),
    loser_exit_combat(async, Loser, Combat),
    winner_exit_combat(Winner, Combat);
combat_over(Combat = #combat{type = _Type,
                             winner = Winner, loser = Loser}) ->
    loser_exit_combat(async, Loser, Combat),
    winner_exit_combat(Winner, Combat).

loser_exit_combat(Type, Loser, Combat) ->
    NewRatioVal = case lists:keyfind(1,
                                     #fighter.is_leader,
                                     Loser)
                      of
                      #fighter{type = 2, ratio_val = RatioVal} -> RatioVal;
                      _False -> 0
                  end,
    loser_exit_combat(Type, Loser, Combat, [], NewRatioVal).

loser_exit_combat(_, [], _, Rewards, RatioVal) ->
    {RatioVal, Rewards};
loser_exit_combat(Label,
                  [F = #fighter{type = 2, base_id = BaseId,
                                is_leader = IsLeader, pid = Pid, name = _Name}
                   | T],
                  Combat = #combat{type = CombatType, winner = Winner,
                                   loser = Loser},
                  Rewards, RatioVal) ->
    DropRewards = case IsLeader of
                      1 ->
                          calc_drop(CombatType,
                                    [assets, item],
                                    F,
                                    RatioVal,
                                    []);
                      0 ->
                          case drop_data:can_get_item(BaseId) of
                              1 ->
                                  calc_drop(CombatType,
                                            [assets, item],
                                            F,
                                            RatioVal,
                                            []);
                              _ ->
                                  calc_drop(CombatType,
                                            [assets],
                                            F,
                                            RatioVal,
                                            [])
                          end
                  end,
    unit:combat_info(Pid, {lost, self(), Winner, Loser}),
    loser_exit_combat(Label,
                      T,
                      Combat,
                      DropRewards ++ Rewards,
                      RatioVal);
loser_exit_combat(sync,
                  [F = #fighter{pid = Pid, type = 1} | T], Combat,
                  Rewards, RatioVal)
    when is_pid(Pid) ->
    CombatOverCalcData = gen_combat_over_calc_data(loser,
                                                   F,
                                                   Combat),
    role:apply(async,
               Pid,
               {combat_end,
                combat_over_calc,
                [async, CombatOverCalcData, lose, Combat, #{}]}),
    loser_exit_combat(sync, T, Combat, Rewards, RatioVal);
loser_exit_combat(async,
                  [F = #fighter{pid = Pid, type = 1} | T],
                  Combat = #combat{type = 34}, Rewards, RatioVal)
    when is_pid(Pid) ->
    Wave = get(shipping_wave),
    Num = get(shipping_num),
    CombatOverCalcData = gen_combat_over_calc_data(loser,
                                                   F,
                                                   Combat),
    role:apply(async,
               Pid,
               {combat_end,
                combat_over_calc,
                [async,
                 CombatOverCalcData,
                 lose,
                 Combat,
                 #{num => Num, wave => Wave}]}),
    loser_exit_combat(async, T, Combat, Rewards, RatioVal);
loser_exit_combat(async,
                  [F = #fighter{pid = Pid, type = 1} | T],
                  Combat = #combat{type = 43}, Rewards, RatioVal)
    when is_pid(Pid) ->
    Wave = get(endless_challenge_wave),
    CombatOverCalcData = gen_combat_over_calc_data(loser,
                                                   F,
                                                   Combat),
    role:apply(async,
               Pid,
               {combat_end,
                combat_over_calc,
                [async,
                 CombatOverCalcData,
                 lose,
                 Combat,
                 #{wave => Wave}]}),
    loser_exit_combat(async, T, Combat, Rewards, RatioVal);
loser_exit_combat(async,
                  [F = #fighter{pid = Pid, type = 1} | T],
                  Combat = #combat{type = 60, round = Round}, Rewards,
                  RatioVal)
    when is_pid(Pid) ->
    Wave = get(glory_id),
    CombatOverCalcData = gen_combat_over_calc_data(loser,
                                                   F,
                                                   Combat),
    role:apply(async,
               Pid,
               {combat_end,
                combat_over_calc,
                [async,
                 CombatOverCalcData,
                 lose,
                 Combat,
                 #{wave => Wave, round => Round}]}),
    loser_exit_combat(async, T, Combat, Rewards, RatioVal);
loser_exit_combat(async,
                  [F = #fighter{pid = Pid, type = 1} | T],
                  Combat = #combat{type = 62, round = Round}, Rewards,
                  RatioVal)
    when is_pid(Pid) ->
    Wave = get(spirit_treasure_wave),
    CombatOverCalcData = gen_combat_over_calc_data(loser,
                                                   F,
                                                   Combat),
    role:apply(async,
               Pid,
               {combat_end,
                combat_over_calc,
                [async,
                 CombatOverCalcData,
                 lose,
                 Combat,
                 #{wave => Wave, round => Round}]}),
    loser_exit_combat(async, T, Combat, Rewards, RatioVal);
loser_exit_combat(async,
                  [F = #fighter{pid = Pid, type = 1} | T],
                  Combat = #combat{type = 70, round = Round}, Rewards,
                  RatioVal)
    when is_pid(Pid) ->
    Wave = get(oracle_treasure_wave),
    CombatOverCalcData = gen_combat_over_calc_data(loser,
                                                   F,
                                                   Combat),
    role:apply(async,
               Pid,
               {combat_end,
                combat_over_calc,
                [async,
                 CombatOverCalcData,
                 lose,
                 Combat,
                 #{wave => Wave, round => Round}]}),
    loser_exit_combat(async, T, Combat, Rewards, RatioVal);
loser_exit_combat(async,
                  [F = #fighter{pid = Pid, type = 1} | T], Combat,
                  Rewards, RatioVal)
    when is_pid(Pid) ->
    CombatOverCalcData = gen_combat_over_calc_data(loser,
                                                   F,
                                                   Combat),
    role:apply(async,
               Pid,
               {combat_end,
                combat_over_calc,
                [async, CombatOverCalcData, lose, Combat, #{}]}),
    loser_exit_combat(async, T, Combat, Rewards, RatioVal);
loser_exit_combat(Type, [_ | T], Combat, Rewards,
                  RatioVal) ->
    loser_exit_combat(Type, T, Combat, Rewards, RatioVal).

winner_exit_combat([], Combat) -> Combat;
winner_exit_combat([F = #fighter{type = 1, pid = Pid}
                    | T],
                   Combat = #combat{type = 15,
                                    start_args =
                                        #combat_start_args{ext_args = ExtArgs},
                                    winner = Winner})
    when is_pid(Pid) ->
    {WinOrLoss, WRL} = case lists:keyfind(rid, 1, ExtArgs)
                           of
                           {rid, Rid} ->
                               case lists:keyfind(Rid,
                                                  #fighter.origin_id,
                                                  Winner)
                                   of
                                   #fighter{} -> {win, winner};
                                   false -> {lose, loser}
                               end;
                           false -> {win, winner}
                       end,
    CombatOverCalcData = gen_combat_over_calc_data(WRL,
                                                   F,
                                                   Combat),
    role:apply(async,
               Pid,
               {combat_end,
                combat_over_calc,
                [async, CombatOverCalcData, WinOrLoss, Combat, #{}]}),
    winner_exit_combat(T, Combat);
winner_exit_combat([F = #fighter{type = 1, pid = Pid}
                    | T],
                   Combat = #combat{type = 45, winner = Winner})
    when is_pid(Pid) ->
    {WinOrLoss, WRL} = case lists:keymember(1,
                                            #fighter.is_leader,
                                            Winner)
                           of
                           false -> {lose, loser};
                           _ -> {win, winner}
                       end,
    CombatOverCalcData = gen_combat_over_calc_data(WRL,
                                                   F,
                                                   Combat),
    role:apply(async,
               Pid,
               {combat_end,
                combat_over_calc,
                [async, CombatOverCalcData, WinOrLoss, Combat, #{}]}),
    winner_exit_combat(T, Combat);
winner_exit_combat([F = #fighter{type = 1, pid = Pid}
                    | T],
                   Combat = #combat{type = 34})
    when is_pid(Pid) ->
    Wave = get(shipping_wave),
    Num = get(shipping_num),
    CombatOverCalcData = gen_combat_over_calc_data(winner,
                                                   F,
                                                   Combat),
    role:apply(async,
               Pid,
               {combat_end,
                combat_over_calc,
                [async,
                 CombatOverCalcData,
                 win,
                 Combat,
                 #{num => Num, wave => Wave}]}),
    winner_exit_combat(T, Combat);
winner_exit_combat([F = #fighter{type = 1, pid = Pid}
                    | T],
                   Combat = #combat{type = 43})
    when is_pid(Pid) ->
    Wave = get(endless_challenge_wave),
    CombatOverCalcData = gen_combat_over_calc_data(winner,
                                                   F,
                                                   Combat),
    role:apply(async,
               Pid,
               {combat_end,
                combat_over_calc,
                [async,
                 CombatOverCalcData,
                 win,
                 Combat,
                 #{wave => Wave}]}),
    winner_exit_combat(T, Combat);
winner_exit_combat([F = #fighter{type = 1, pid = Pid}
                    | T],
                   Combat = #combat{type = 60, round = Round})
    when is_pid(Pid) ->
    Wave = get(glory_id),
    CombatOverCalcData = gen_combat_over_calc_data(winner,
                                                   F,
                                                   Combat),
    role:apply(async,
               Pid,
               {combat_end,
                combat_over_calc,
                [async,
                 CombatOverCalcData,
                 win,
                 Combat,
                 #{wave => Wave, round => Round}]}),
    winner_exit_combat(T, Combat);
winner_exit_combat([F = #fighter{type = 1, pid = Pid}
                    | T],
                   Combat = #combat{type = 62, round = Round})
    when is_pid(Pid) ->
    Wave = get(spirit_treasure_wave),
    CombatOverCalcData = gen_combat_over_calc_data(winner,
                                                   F,
                                                   Combat),
    role:apply(async,
               Pid,
               {combat_end,
                combat_over_calc,
                [async,
                 CombatOverCalcData,
                 win,
                 Combat,
                 #{wave => Wave, round => Round}]}),
    winner_exit_combat(T, Combat);
winner_exit_combat([F = #fighter{type = 1, pid = Pid}
                    | T],
                   Combat = #combat{type = 70, round = Round})
    when is_pid(Pid) ->
    Wave = get(oracle_treasure_wave),
    CombatOverCalcData = gen_combat_over_calc_data(winner,
                                                   F,
                                                   Combat),
    role:apply(async,
               Pid,
               {combat_end,
                combat_over_calc,
                [async,
                 CombatOverCalcData,
                 win,
                 Combat,
                 #{wave => Wave, round => Round}]}),
    winner_exit_combat(T, Combat);
winner_exit_combat([F = #fighter{type = 1, pid = Pid,
                                 combat_statistics =
                                     #combat_statistics{die_times = DieTimes}}
                    | T],
                   Combat = #combat{winner = Winner,
                                    atk_formation = Formation, type = 68,
                                    round = Round})
    when is_pid(Pid) ->
    CombatOverCalcData = gen_combat_over_calc_data(winner,
                                                   F,
                                                   Combat),
    CombatStatArgs = case get(stars_trail_combat_stat) of
                         Stat when is_map(Stat) -> Stat;
                         _ ->
                             CombatStatFun = fun (#fighter{type = 1,
                                                           has_use_item =
                                                               HasUseItem,
                                                           combat_statistics =
                                                               #combat_statistics{cast_pet
                                                                                      =
                                                                                      CastPet}},
                                                  #{cast_pet := RtnPetCastNum,
                                                    use_item :=
                                                        RtnUseItemNum}) ->
                                                     #{cast_pet =>
                                                           CastPet +
                                                               RtnPetCastNum,
                                                       use_item =>
                                                           HasUseItem +
                                                               RtnUseItemNum};
                                                 (_, Rtn) -> Rtn
                                             end,
                             _CombatStatArgs = lists:foldl(CombatStatFun,
                                                           #{use_item => 0,
                                                             cast_pet => 0},
                                                           Winner),
                             put(stars_trail_combat_stat, _CombatStatArgs),
                             _CombatStatArgs
                     end,
    CombatStatArgs1 = CombatStatArgs#{die_times => DieTimes,
                                      formation => Formation, round => Round},
    role:apply(async,
               Pid,
               {combat_end,
                combat_over_calc,
                [async,
                 CombatOverCalcData,
                 win,
                 Combat,
                 CombatStatArgs1]}),
    winner_exit_combat(T, Combat);
winner_exit_combat([F = #fighter{type = 1, pid = Pid,
                                 combat_statistics =
                                     #combat_statistics{die_times = _DieTimes}}
                    | T],
                   Combat = #combat{winner = _Winner,
                                    atk_formation = _Formation, type = 72,
                                    round = _Round})
    when is_pid(Pid) ->
    CombatOverCalcData = gen_combat_over_calc_data(winner,
                                                   F,
                                                   Combat),
    role:apply(async,
               Pid,
               {combat_end,
                combat_over_calc,
                [async, CombatOverCalcData, win, Combat, #{}]}),
    winner_exit_combat(T, Combat);
winner_exit_combat([F = #fighter{type = 1, pid = Pid}
                    | T],
                   Combat)
    when is_pid(Pid) ->
    CombatOverCalcData = gen_combat_over_calc_data(winner,
                                                   F,
                                                   Combat),
    role:apply(async,
               Pid,
               {combat_end,
                combat_over_calc,
                [async, CombatOverCalcData, win, Combat, #{}]}),
    winner_exit_combat(T, Combat);
winner_exit_combat([#fighter{type = 2, pid = Pid,
                             name = _Name}
                    | T],
                   Combat = #combat{winner = Winner, loser = Loser}) ->
    unit:combat_info(Pid, {win, self(), Winner, Loser}),
    winner_exit_combat(T, Combat);
winner_exit_combat([_ | T], Combat) ->
    winner_exit_combat(T, Combat).

calc_drop(_CombatType, [], _F, _RatioVal, Rewards) ->
    Rewards;
calc_drop(CombatType, [assets | T],
          F = #fighter{type = 2, base_id = BaseId}, RatioVal,
          Rewards) ->
    Reward = calc_assets_drop(BaseId, RatioVal),
    calc_drop(CombatType,
              T,
              F,
              RatioVal,
              Reward ++ Rewards);
calc_drop(CombatType, [item | T],
          F = #fighter{type = 2, base_id = BaseId}, RatioVal,
          Rewards) ->
    Reward = calc_item_drop(BaseId),
    calc_drop(CombatType,
              T,
              F,
              RatioVal,
              Reward ++ Rewards);
calc_drop(CombatType, [_ | T], F = #fighter{type = 2},
          RatioVal, Rewards) ->
    calc_drop(CombatType, T, F, RatioVal, Rewards);
calc_drop(_, _, _, _, Rewards) -> Rewards.

calc_assets_drop(BaseId, RatioVal) ->
    case unit_data:get(BaseId) of
        #unit_data{gain = GL = [_ | _]} ->
            Fun = fun ({Type, Key}, GainList) ->
                          case levup_data:get_exp({Type, RatioVal}) of
                              #{coin := Coin, exp := Exp, pet_exp := PetExp} ->
                                  NewGainList = case Key of
                                                    90000 when Coin =/= 0 ->
                                                        G = #gain{label = coin,
                                                                  val = Coin},
                                                        [G#gain{ext =
                                                                    {drop,
                                                                     BaseId},
                                                                source = 3}
                                                         | GainList];
                                                    90010 when Exp =/= 0 ->
                                                        G = #gain{label = exp,
                                                                  val = Exp},
                                                        [G#gain{ext =
                                                                    {drop,
                                                                     BaseId},
                                                                source = 3}
                                                         | GainList];
                                                    90005 when PetExp =/= 0 ->
                                                        G = #gain{label =
                                                                      pet_exp,
                                                                  val = PetExp},
                                                        [G#gain{ext =
                                                                    {drop,
                                                                     BaseId},
                                                                source = 3}
                                                         | GainList];
                                                    _ -> GainList
                                                end,
                                  NewGainList;
                              _ -> GainList
                          end
                  end,
            Gain = lists:foldl(Fun, [], GL),
            [{2, [], Gain}];
        _ -> []
    end.

calc_item_drop(BaseId) ->
    case drop:produce(BaseId) of
        {true, 3, _, _} -> [{3, BaseId}];
        {true, RuleType, SuperGain, NorMalGain} ->
            [{RuleType, SuperGain, NorMalGain}];
        _ -> []
    end.

combat_over_calc(Role = #role{id = RoleId, pid = _Pid,
                              name = _Name, lev = _Lev},
                 SyncFlag,
                 #combat_over_calc_data{fighter =
                                            F = #fighter{group = Group,
                                                         is_leader = IsLeader,
                                                         is_die = IsDie,
                                                         catched = Catched,
                                                         plot = _Plot,
                                                         is_escape = _IsEscape,
                                                         is_auto = IsAuto,
                                                         force_is_auto =
                                                             ForceIsAuto,
                                                         combat_statistics =
                                                             CombatStatistics,
                                                         has_use_item =
                                                             HasUseItem},
                                        rewards = Rewards, record = Record},
                 WinOrLose,
                 Combat = #combat{type = CombatType, result = _Result,
                                  start_args =
                                      _StartArgs = #combat_start_args{ext_args =
                                                                          ExtArgs},
                                  start_time = StartTime, winner = Winner,
                                  loser = Loser, round = Round,
                                  ratio_val = RatioVal},
                 Args) ->
    CombatTime = max(1, date:unixtime() - StartTime),
    FighterMate = [Mate
                   || Mate = #fighter{type = 1, origin_id = OriginId,
                                      group = Sgroup}
                          <- Winner ++ Loser,
                      OriginId =/= RoleId andalso Sgroup =:= Group],
    FightGuard = [OriginId
                  || #fighter{type = 5, origin_id = OriginId,
                              group = Sgroup}
                         <- Winner ++ Loser,
                     Sgroup =:= Group],
    FightGuard1 = calc_combat_guard(FightGuard, Role),
    team_common:combat_over(Role),
    {Role0, NewRewards} = check_gain(Rewards,
                                     WinOrLose,
                                     Role,
                                     F,
                                     CombatType,
                                     Loser,
                                     ExtArgs),
    {Role1, SuccessGL, FailedGL} = do_gain_loss(CombatType,
                                                NewRewards,
                                                Role0,
                                                RatioVal),
    combat_fail_send(CombatType, FailedGL, Role),
    combat_gl_notice(Role1, SuccessGL),
    notice:gain_item(Role1, SuccessGL),
    log:drop(Role1, SuccessGL, "战斗掉落", "战斗掉落"),
    catch log:combat_over(Role1,
                          CombatType,
                          WinOrLose,
                          Round),
    drop:notice(Role1, CombatType, SuccessGL),
    notice_timeout(Role, WinOrLose, CombatType, Round),
    DelRole1 = del_combat_gl_notice(Role1),
    Role2 = DelRole1,
    Role3 = case CombatType of
                4 when IsLeader =:= 1 ->
                    trial:combat_over(Role2, WinOrLose, Round);
                68 ->
                    logger:debug("=========银月胜利:~w",
                                 [{Args, ExtArgs}],
                                 combat_end,
                                 644),
                    stars_trial_mgr:combat_over(Role2,
                                                WinOrLose,
                                                Args,
                                                ExtArgs);
                4 -> trial:reward_helper(Role2, WinOrLose, ExtArgs);
                11 when WinOrLose =:= win ->
                    dungeon_mgr:combat_over(Role2,
                                            WinOrLose,
                                            Loser,
                                            #{combat_time => CombatTime}),
                    Role2;
                16 when WinOrLose =:= win ->
                    case length(FighterMate) > 0 of
                        true ->
                            agenda:take_care_junior(Role2,
                                                    FighterMate,
                                                    tower_boss);
                        false -> Role2
                    end;
                13 when WinOrLose =:= win ->
                    case length(FighterMate) > 0 of
                        true -> agenda:take_care_junior(Role2, FighterMate);
                        false -> Role2
                    end;
                21 ->
                    glory:combat_over(Role2,
                                      WinOrLose,
                                      {CombatTime, Round, Record});
                34 ->
                    shipping_combat:combat_over(Role2,
                                                WinOrLose,
                                                ExtArgs,
                                                Args);
                37 ->
                    camp_dragon_boat:combat_over(Role2,
                                                 WinOrLose,
                                                 Round,
                                                 Loser);
                43 ->
                    endless_challenge_combat:combat_over(Role2,
                                                         WinOrLose,
                                                         ExtArgs,
                                                         Args);
                60 ->
                    glory_combat:combat_over(Role2,
                                             WinOrLose,
                                             ExtArgs,
                                             Args);
                62 ->
                    spirit_treasure_combat:combat_over(Role2,
                                                       WinOrLose,
                                                       ExtArgs,
                                                       Args);
                70 ->
                    oracle_treasure_combat:combat_over(Role2,
                                                       WinOrLose,
                                                       ExtArgs,
                                                       Args);
                46 -> camp_cake:combat_over(Role2, WinOrLose, ExtArgs);
                _ -> Role2
            end,
    Role4 = handle_catched_pet(Role3,
                               WinOrLose,
                               Catched,
                               CombatType),
    Role5 = status_update(Role4,
                          CombatType,
                          F,
                          Combat,
                          WinOrLose),
    Role6 = pet_skill:combat_comprehend(WinOrLose,
                                        CombatType,
                                        Role5),
    CombatEvt = calc_combat_trigger(Role,
                                    Combat,
                                    WinOrLose,
                                    CombatStatistics#combat_statistics{guard =
                                                                           FightGuard1,
                                                                       has_use_item
                                                                           =
                                                                           HasUseItem,
                                                                       is_die =
                                                                           IsDie}),
    Role7 = role_trigger:fire(CombatEvt, Role6),
    Role8 = buff:calc_pvp(Role7, CombatType),
    NRole = Role8,
    CombatResult = handle_combat_result_show(CombatType, F),
    TableRewards = format_rewards(SuccessGL),
    case ForceIsAuto of
        1 -> ignore;
        _ -> put(combat_auto, IsAuto)
    end,
    ResultMsg = "",
    role:link_send(NRole,
                   10790,
                   {CombatResult, ResultMsg, TableRewards}),
    ok,
    case SyncFlag of
        sync -> {ok, {true, []}, NRole};
        async -> {ok, NRole}
    end.

notice_timeout(Role, WinOrLose, CombatType, Round) ->
    {Mode, MaxRound} =
        combat_util:check_max_round(CombatType),
    do_notice_timeout(Role,
                      WinOrLose,
                      CombatType,
                      Mode,
                      Round,
                      MaxRound).

do_notice_timeout(Role, WinOrLose, 100, _Mode, Round,
                  MaxRound)
    when Round >= MaxRound - 1 ->
    case WinOrLose of
        win ->
            notice:send(Role,
                        3,
                        notice:format(lang:get("战斗累计超过~ts回合，系统判定~ts获胜"),
                                      [{string_2, 1, Round},
                                       {string_2, 1, lang:get("己方")}]));
        _ ->
            notice:send(Role,
                        3,
                        notice:format(lang:get("战斗累计超过~ts回合，系统判定~ts失败"),
                                      [{string_2, 1, Round},
                                       {string_2, 1, lang:get("己方")}]))
    end;
do_notice_timeout(Role, WinOrLose, 112, _Mode, Round,
                  MaxRound)
    when Round >= MaxRound - 1 ->
    case WinOrLose of
        win ->
            notice:send(Role,
                        3,
                        notice:format(lang:get("战斗累计超过~ts回合，系统判定~ts获胜"),
                                      [{string_2, 1, Round},
                                       {string_2, 1, lang:get("己方")}]));
        _ ->
            notice:send(Role,
                        3,
                        notice:format(lang:get("战斗累计超过~ts回合，系统判定~ts失败"),
                                      [{string_2, 1, Round},
                                       {string_2, 1, lang:get("己方")}]))
    end;
do_notice_timeout(Role, WinOrLose, 52, _Mode, Round,
                  MaxRound)
    when Round >= MaxRound - 1 ->
    case WinOrLose of
        win ->
            notice:send(Role,
                        3,
                        notice:format(lang:get("战斗累计超过~ts回合，系统判定~ts获胜"),
                                      [{string_2, 1, Round},
                                       {string_2, 1, lang:get("己方")}]));
        _ ->
            notice:send(Role,
                        3,
                        notice:format(lang:get("战斗累计超过~ts回合，系统判定~ts失败"),
                                      [{string_2, 1, Round},
                                       {string_2, 1, lang:get("己方")}]))
    end;
do_notice_timeout(Role, WinOrLose, 102, _Mode, Round,
                  MaxRound)
    when Round >= MaxRound - 1 ->
    case WinOrLose of
        win ->
            notice:send(Role,
                        3,
                        notice:format(lang:get("战斗累计超过~ts回合，系统判定~ts获胜"),
                                      [{string_2, 1, Round},
                                       {string_2, 1, lang:get("己方")}]));
        _ ->
            notice:send(Role,
                        3,
                        notice:format(lang:get("战斗累计超过~ts回合，系统判定~ts失败"),
                                      [{string_2, 1, Round},
                                       {string_2, 1, lang:get("己方")}]))
    end;
do_notice_timeout(Role, WinOrLose, 104, _Mode, Round,
                  MaxRound)
    when Round >= MaxRound - 1 ->
    case WinOrLose of
        win ->
            notice:send(Role,
                        3,
                        notice:format(lang:get("战斗累计超过~ts回合，系统判定~ts获胜"),
                                      [{string_2, 1, Round},
                                       {string_2, 1, lang:get("己方")}]));
        _ ->
            notice:send(Role,
                        3,
                        notice:format(lang:get("战斗累计超过~ts回合，系统判定~ts失败"),
                                      [{string_2, 1, Round},
                                       {string_2, 1, lang:get("己方")}]))
    end;
do_notice_timeout(Role, WinOrLose, 107, _Mode, Round,
                  MaxRound)
    when Round >= MaxRound - 1 ->
    case WinOrLose of
        win ->
            notice:send(Role,
                        3,
                        notice:format(lang:get("战斗累计超过~ts回合，系统判定~ts获胜"),
                                      [{string_2, 1, Round},
                                       {string_2, 1, lang:get("己方")}]));
        _ ->
            notice:send(Role,
                        3,
                        notice:format(lang:get("战斗累计超过~ts回合，系统判定~ts失败"),
                                      [{string_2, 1, Round},
                                       {string_2, 1, lang:get("己方")}]))
    end;
do_notice_timeout(Role, WinOrLose, 41, _Mode, Round,
                  MaxRound)
    when Round >= MaxRound - 1 ->
    case WinOrLose of
        win ->
            notice:send(Role,
                        3,
                        notice:format(lang:get("战斗累计超过~ts回合，系统判定~ts获胜"),
                                      [{string_2, 1, Round},
                                       {string_2, 1, lang:get("己方")}]));
        _ ->
            notice:send(Role,
                        3,
                        notice:format(lang:get("战斗累计超过~ts回合，系统判定~ts失败"),
                                      [{string_2, 1, Round},
                                       {string_2, 1, lang:get("己方")}]))
    end;
do_notice_timeout(Role, WinOrLose, 105, _Mode, Round,
                  MaxRound)
    when Round >= MaxRound - 1 ->
    case WinOrLose of
        win ->
            notice:send(Role,
                        3,
                        notice:format(lang:get("战斗累计超过~ts回合，系统判定~ts获胜"),
                                      [{string_2, 1, Round},
                                       {string_2, 1, lang:get("己方")}]));
        _ ->
            notice:send(Role,
                        3,
                        notice:format(lang:get("战斗累计超过~ts回合，系统判定~ts失败"),
                                      [{string_2, 1, Round},
                                       {string_2, 1, lang:get("己方")}]))
    end;
do_notice_timeout(Role, WinOrLose, 40, _Mode, Round,
                  MaxRound)
    when Round >= MaxRound - 1 ->
    case WinOrLose of
        win ->
            notice:send(Role,
                        3,
                        notice:format(lang:get("战斗累计超过~ts回合，系统判定~ts获胜"),
                                      [{string_2, 1, Round},
                                       {string_2, 1, lang:get("己方")}]));
        _ ->
            notice:send(Role,
                        3,
                        notice:format(lang:get("战斗累计超过~ts回合，系统判定~ts失败"),
                                      [{string_2, 1, Round},
                                       {string_2, 1, lang:get("己方")}]))
    end;
do_notice_timeout(Role, WinOrLose, 58, _Mode, Round,
                  MaxRound)
    when Round >= MaxRound - 1 ->
    case WinOrLose of
        win ->
            notice:send(Role,
                        3,
                        notice:format(lang:get("战斗累计超过~ts回合，系统判定~ts获胜"),
                                      [{string_2, 1, Round},
                                       {string_2, 1, lang:get("己方")}]));
        _ ->
            notice:send(Role,
                        3,
                        notice:format(lang:get("战斗累计超过~ts回合，系统判定~ts失败"),
                                      [{string_2, 1, Round},
                                       {string_2, 1, lang:get("己方")}]))
    end;
do_notice_timeout(Role, WinOrLose, 108, _Mode, Round,
                  MaxRound)
    when Round >= MaxRound - 1 ->
    case WinOrLose of
        win ->
            notice:send(Role,
                        3,
                        notice:format(lang:get("战斗累计超过~ts回合，系统判定~ts获胜"),
                                      [{string_2, 1, Round},
                                       {string_2, 1, lang:get("己方")}]));
        _ ->
            notice:send(Role,
                        3,
                        notice:format(lang:get("战斗累计超过~ts回合，系统判定~ts失败"),
                                      [{string_2, 1, Round},
                                       {string_2, 1, lang:get("己方")}]))
    end;
do_notice_timeout(Role, WinOrLose, 116, _Mode, Round,
                  MaxRound)
    when Round >= MaxRound - 1 ->
    case WinOrLose of
        win ->
            notice:send(Role,
                        3,
                        notice:format(lang:get("战斗累计超过~ts回合，系统判定~ts获胜"),
                                      [{string_2, 1, Round},
                                       {string_2, 1, lang:get("己方")}]));
        _ ->
            notice:send(Role,
                        3,
                        notice:format(lang:get("战斗累计超过~ts回合，系统判定~ts失败"),
                                      [{string_2, 1, Round},
                                       {string_2, 1, lang:get("己方")}]))
    end;
do_notice_timeout(_, _, _, _, _, _) -> ok.

combat_fail_send(11, FailedGL, Role) ->
    SendGL = [GL
              || GL = #gain{reason = bag_full} <- FailedGL],
    case format:gain_to_val(SendGL) of
        Items = [_ | _] ->
            Title = lang:get("副本单位奖励"),
            Content = lang:get("您的背包空间不足, 奖励通过邮件发送, 请验收"),
            Items1 = [{BaseId, 0, Num} || {BaseId, Num} <- Items],
            mail:send(Role,
                      #{title => Title, content => Content, items => Items1}),
            ok;
        _ -> ok
    end;
combat_fail_send(13, FailedGL, Role) ->
    SendGL = [GL
              || GL = #gain{reason = bag_full} <- FailedGL],
    case format:gain_to_val(SendGL) of
        Items = [_ | _] ->
            Title = lang:get("上古封妖奖励"),
            Content = lang:get("您的背包空间不足, 奖励通过邮件发送, 请验收"),
            Items1 = [{BaseId, 0, Num} || {BaseId, Num} <- Items],
            mail:send(Role,
                      #{title => Title, content => Content, items => Items1}),
            ok;
        _ -> ok
    end;
combat_fail_send(35, FailedGL, Role) ->
    SendGL = [GL
              || GL = #gain{reason = bag_full} <- FailedGL],
    case format:gain_to_val(SendGL) of
        Items = [_ | _] ->
            Title = lang:get("点银成金奖励"),
            Content = lang:get("您的背包空间不足, 奖励通过邮件发送, 请验收"),
            Items1 = [{BaseId, 0, Num} || {BaseId, Num} <- Items],
            mail:send(Role,
                      #{title => Title, content => Content, items => Items1}),
            ok;
        _ -> ok
    end;
combat_fail_send(26, FailedGL, Role) ->
    SendGL = [GL
              || GL = #gain{reason = bag_full} <- FailedGL],
    case format:gain_to_val(SendGL) of
        Items = [_ | _] ->
            Title = lang:get("星座挑战奖励"),
            Content = lang:get("您的背包空间不足, 奖励通过邮件发送, 请验收"),
            Items1 = [{BaseId, 0, Num} || {BaseId, Num} <- Items],
            mail:send(Role,
                      #{title => Title, content => Content, items => Items1}),
            ok;
        _ -> ok
    end;
combat_fail_send(5, FailedGL, Role) ->
    SendGL = [GL
              || GL = #gain{reason = bag_full} <- FailedGL],
    case format:gain_to_val(SendGL) of
        Items = [_ | _] ->
            Title = lang:get("世界boss奖励"),
            Content = lang:get("您的背包空间不足, 奖励通过邮件发送, 请验收"),
            Items1 = [{BaseId, 0, Num} || {BaseId, Num} <- Items],
            mail:send(Role,
                      #{title => Title, content => Content, items => Items1}),
            ok;
        _ -> ok
    end;
combat_fail_send(39, FailedGL, Role) ->
    SendGL = [GL
              || GL = #gain{reason = bag_full} <- FailedGL],
    case format:gain_to_val(SendGL) of
        Items = [_ | _] ->
            Title = lang:get("妖王奖励"),
            Content = lang:get("您的背包空间不足, 奖励通过邮件发送, 请验收"),
            Items1 = [{BaseId, 0, Num} || {BaseId, Num} <- Items],
            mail:send(Role,
                      #{title => Title, content => Content, items => Items1}),
            ok;
        _ -> ok
    end;
combat_fail_send(38, FailedGL, Role) ->
    SendGL = [GL
              || GL = #gain{reason = bag_full} <- FailedGL],
    case format:gain_to_val(SendGL) of
        Items = [_ | _] ->
            Title = lang:get("河妖奖励"),
            Content = lang:get("您的背包空间不足, 奖励通过邮件发送, 请验收"),
            Items1 = [{BaseId, 0, Num} || {BaseId, Num} <- Items],
            mail:send(Role,
                      #{title => Title, content => Content, items => Items1}),
            ok;
        _ -> ok
    end;
combat_fail_send(42, FailedGL, Role) ->
    SendGL = [GL
              || GL = #gain{reason = bag_full} <- FailedGL],
    case format:gain_to_val(SendGL) of
        Items = [_ | _] ->
            Title = lang:get("顽皮萌娃"),
            Content = lang:get("您的背包空间不足, 奖励通过邮件发送, 请验收"),
            Items1 = [{BaseId, 0, Num} || {BaseId, Num} <- Items],
            mail:send(Role,
                      #{title => Title, content => Content, items => Items1}),
            ok;
        _ -> ok
    end;
combat_fail_send(48, FailedGL, Role) ->
    SendGL = [GL
              || GL = #gain{reason = bag_full} <- FailedGL],
    case format:gain_to_val(SendGL) of
        Items = [_ | _] ->
            Title = lang:get("驱除妖灵"),
            Content = lang:get("您的背包空间不足, 奖励通过邮件发送, 请验收"),
            Items1 = [{BaseId, 0, Num} || {BaseId, Num} <- Items],
            mail:send(Role,
                      #{title => Title, content => Content, items => Items1}),
            ok;
        _ -> ok
    end;
combat_fail_send(47, FailedGL, Role) ->
    SendGL = [GL
              || GL = #gain{reason = bag_full} <- FailedGL],
    case format:gain_to_val(SendGL) of
        Items = [_ | _] ->
            Title = lang:get("驱除妖灵"),
            Content = lang:get("您的背包空间不足, 奖励通过邮件发送, 请验收"),
            Items1 = [{BaseId, 0, Num} || {BaseId, Num} <- Items],
            mail:send(Role,
                      #{title => Title, content => Content, items => Items1}),
            ok;
        _ -> ok
    end;
combat_fail_send(17, FailedGL, Role) ->
    SendGL = [GL
              || GL = #gain{reason = bag_full} <- FailedGL],
    case format:gain_to_val(SendGL) of
        Items = [_ | _] ->
            Title = lang:get("职业挑战奖励"),
            Content = lang:get("您的背包空间不足, 奖励通过邮件发送, 请验收"),
            Items1 = [{BaseId, 0, Num} || {BaseId, Num} <- Items],
            mail:send(Role,
                      #{title => Title, content => Content, items => Items1}),
            ok;
        _ -> ok
    end;
combat_fail_send(36, FailedGL, Role) ->
    SendGL = [GL
              || GL = #gain{reason = bag_full} <- FailedGL],
    case format:gain_to_val(SendGL) of
        Items = [_ | _] ->
            Title = lang:get("五彩贺小年"),
            Content = lang:get("您的背包空间不足, 奖励通过邮件发送, 请验收"),
            Items1 = [{BaseId, 0, Num} || {BaseId, Num} <- Items],
            mail:send(Role,
                      #{title => Title, content => Content, items => Items1}),
            ok;
        _ -> ok
    end;
combat_fail_send(8, FailedGL, Role) ->
    SendGL = [GL
              || GL = #gain{reason = bag_full} <- FailedGL],
    case format:gain_to_val(SendGL) of
        Items = [_ | _] ->
            Title = lang:get("悬赏奖励"),
            Content = lang:get("您的背包空间不足, 奖励通过邮件发送, 请验收"),
            Items1 = [{BaseId, 0, Num} || {BaseId, Num} <- Items],
            mail:send(Role,
                      #{title => Title, content => Content, items => Items1}),
            ok;
        _ -> ok
    end;
combat_fail_send(51, FailedGL, Role) ->
    SendGL = [GL
              || GL = #gain{reason = bag_full} <- FailedGL],
    case format:gain_to_val(SendGL) of
        Items = [_ | _] ->
            Title = lang:get("堆雪人奖励"),
            Content = lang:get("您的背包空间不足, 奖励通过邮件发送, 请验收"),
            Items1 = [{BaseId, 0, Num} || {BaseId, Num} <- Items],
            mail:send(Role,
                      #{title => Title, content => Content, items => Items1}),
            ok;
        _ -> ok
    end;
combat_fail_send(52, FailedGL, Role) ->
    SendGL = [GL
              || GL = #gain{reason = bag_full} <- FailedGL],
    case format:gain_to_val(SendGL) of
        Items = [_ | _] ->
            Title = lang:get("堆雪人奖励"),
            Content = lang:get("您的背包空间不足, 奖励通过邮件发送, 请验收"),
            Items1 = [{BaseId, 0, Num} || {BaseId, Num} <- Items],
            mail:send(Role,
                      #{title => Title, content => Content, items => Items1}),
            ok;
        _ -> ok
    end;
combat_fail_send(31, FailedGL, Role) ->
    SendGL = [GL
              || GL = #gain{reason = bag_full} <- FailedGL],
    case format:gain_to_val(SendGL) of
        Items = [_ | _] ->
            Title = lang:get("赏歌大会奖励"),
            Content = lang:get("您的背包空间不足, 奖励通过邮件发送, 请验收"),
            Items1 = [{BaseId, 0, Num} || {BaseId, Num} <- Items],
            mail:send(Role,
                      #{title => Title, content => Content, items => Items1}),
            ok;
        _ -> ok
    end;
combat_fail_send(32, FailedGL, Role) ->
    SendGL = [GL
              || GL = #gain{reason = bag_full} <- FailedGL],
    case format:gain_to_val(SendGL) of
        Items = [_ | _] ->
            Title = lang:get("草木妖王奖励"),
            Content = lang:get("您的背包空间不足, 奖励通过邮件发送, 请查收"),
            Items1 = [{BaseId, 0, Num} || {BaseId, Num} <- Items],
            mail:send(Role,
                      #{title => Title, content => Content, items => Items1}),
            ok;
        _ -> ok
    end;
combat_fail_send(_, _, _) -> ok.

handle_combat_result_show(_CombatType,
                          #fighter{result = CombatResult}) ->
    CombatResult.

check_gain(Rewards, WinOrLose,
           Role = #role{attr = #attr{exp_ratio = ExpRatio}}, _F, 3,
           Loser, ExtArgs) ->
    {Flag, Role1} =
        agenda:combat_loss_double_point(WinOrLose, 3, Role),
    {ChainRewards, ChainRole} =
        quest_chain:check_gain(WinOrLose,
                               Rewards,
                               ExtArgs,
                               Loser,
                               Role1),
    NRewards = [G
                || G = #gain{label = Label} <- ChainRewards,
                   Label =/= pet_exp],
    PetExpReward = case pet:get_war_pet(Role) of
                       {ok, #pet{lev = PetLev}} ->
                           case levup_data:get_exp({1001, PetLev}) of
                               #{pet_exp := PetExp} when PetExp > 0 ->
                                   [#gain{label = pet_exp,
                                          val = round(PetExp * 7)}];
                               _ -> []
                           end;
                       _ -> []
                   end,
    NRewards0 = [begin
                     case Label =:= exp of
                         true ->
                             G#gain{val =
                                        round(Val * (1000 + ExpRatio) / 1000)};
                         _ -> G
                     end
                 end
                 || G = #gain{label = Label, val = Val} <- NRewards],
    NRewards1 = NRewards0 ++ PetExpReward,
    NewRewards = case Flag of
                     true ->
                         Fun = fun (G = #gain{label = Label, val = Val},
                                    GainList)
                                       when Label =:= coin orelse
                                                Label =:= exp orelse
                                                    Label =:= pet_exp ->
                                       [G#gain{val = Val * 2} | GainList];
                                   (G, GainList) -> [G | GainList]
                               end,
                         lists:foldl(Fun, [], NRewards1);
                     false -> NRewards1
                 end,
    BuffAddRewards = special_buff_rewards(ChainRole,
                                          NewRewards,
                                          [36, 37]),
    NewRole = ChainRole,
    {NewRole, BuffAddRewards};
check_gain(Rewards, WinOrLose, Role = #role{lev = Lev},
           _F, 8, _Loser, ExtArgs) ->
    Role0 = case teacher:teacher_in_team(Role) of
                true ->
                    role_trigger:fire(#evt_quest_offer_teacher{}, Role);
                _ -> Role
            end,
    {Flag,
     Role1 = #role{m_quest =
                       MQuest = #m_quest{quest_offer =
                                             QOffer = #quest_offer{day_count =
                                                                       DayCount}}}} =
        agenda:combat_loss_double_point(WinOrLose, 8, Role0),
    TeamArgs = [{double_point, Flag} | ExtArgs],
    Role2 = Role1#role{m_quest =
                           MQuest#m_quest{quest_offer =
                                              QOffer#quest_offer{team_args =
                                                                     TeamArgs}}},
    Rewarded = var:get_var(Role, day, 88, 0),
    logger:debug("奖励 ~w, WinOrLose: ~w",
                 [Rewards, WinOrLose],
                 combat_end,
                 1101),
    logger:debug("其他参数 ~w", [ExtArgs], combat_end, 1102),
    {WorldLev, _} = world_lev:get_world_lev(Role),
    NewRewards = case Lev < WorldLev - 10 of
                     true ->
                         lists:foldl(fun (Gain = #gain{label = item_base_id,
                                                       val = Val},
                                          Rtn) ->
                                             NewVal = lists:map(fun
                                                                    ({ItemBaseId,
                                                                      Bind,
                                                                      Num}) ->
                                                                        case
                                                                            lists:member(ItemBaseId,
                                                                                         [21521,
                                                                                          21522,
                                                                                          21524,
                                                                                          21525])
                                                                            of
                                                                            true ->
                                                                                {ItemBaseId,
                                                                                 1,
                                                                                 Num};
                                                                            _ ->
                                                                                {ItemBaseId,
                                                                                 Bind,
                                                                                 Num}
                                                                        end
                                                                end,
                                                                Val),
                                             [Gain#gain{val = NewVal} | Rtn];
                                         (Other, Rtn) -> [Other | Rtn]
                                     end,
                                     [],
                                     Rewards);
                     _ -> Rewards
                 end,
    logger:debug("悬赏奖励:~w", [NewRewards], combat_end, 1120),
    case {NewRewards, WinOrLose} of
        {[], _} ->
            Role3 = teacher:get_teacher_gain(Role2, 8),
            {Role3, NewRewards};
        {_, win} when DayCount < 30 andalso Rewarded < 6 ->
            Msg = notice:format(lang:get("在~ts中成功击退盗宝贼，获得~ts"),
                                [{string_2, 1, lang:get("悬赏任务")},
                                 {item_2, format:gain_to_val(NewRewards)}]),
            notice:send(Role2, 3, Msg),
            Role3 = teacher:get_teacher_gain(Role2, 8),
            {var:acc_var(Role3, day, 88), NewRewards};
        {_, win} when Rewarded < 24 ->
            Rewards1 = [{90000, 10000}],
            case DayCount =:= 30 of
                true -> [];
                _ -> []
            end,
            Msg = case DayCount >= 30 of
                      true ->
                          notice:format(lang:get("在~ts中成功击退盗宝贼，由于今日完成悬赏次数过多，获得~ts"),
                                        [{string_2, 1, lang:get("悬赏任务")},
                                         {item_2, Rewards1}]);
                      _ ->
                          notice:format(lang:get("在~ts中成功击退盗宝贼，由于今日已获得多次奖励，获得~ts"),
                                        [{string_2, 1, lang:get("悬赏任务")},
                                         {item_2, Rewards1}])
                  end,
            notice:send(Role2, 3, Msg),
            {var:acc_var(Role2, day, 88),
             format:val_to_gain(Rewards1)};
        _ -> {Role2, []}
    end;
check_gain(Rewards, WinOrLose, Role, _F, 13, _Loser,
           ExtArgs) ->
    treasure:get_ghost_reward(WinOrLose,
                              Rewards,
                              ExtArgs,
                              Role);
check_gain(Rewards, WinOrLose, Role, _F, 11, Loser,
           _ExtArgs) ->
    dungeon_util:calc_unit_gain(WinOrLose,
                                Rewards,
                                Loser,
                                Role);
check_gain(Rewards, WinOrLose, Role, _F, 5, _Loser,
           ExtArgs) ->
    world_boss:check_gain(Role,
                          WinOrLose,
                          ExtArgs,
                          Rewards);
check_gain(_Rewards, WinOrLose, Role, _F, 9, _Loser,
           _ExtArgs) ->
    guild_robber:check_gain(Role, WinOrLose);
check_gain(Rewards, WinOrLose, Role, _F, 28, _Loser,
           _ExtArgs) ->
    guild_treasure:check_gain(Role, Rewards, WinOrLose);
check_gain(_Rewards, WinOrLose, Role, _F, 14, _Loser,
           _ExtArgs) ->
    quest_guild:check_gain(Role, WinOrLose);
check_gain(_Rewards, WinOrLose, Role, _F, 64, _Loser,
           _ExtArgs) ->
    quest_single_dog:check_gain(Role, WinOrLose);
check_gain(_Rewards, WinOrLose, Role, _F, 16, _Loser,
           ExtArgs) ->
    tower:check_gain(Role, ExtArgs, WinOrLose);
check_gain(_Rewards, WinOrLose, Role, _F, 17, _Loser,
           ExtArgs) ->
    classes_challenge:check_gain(Role, WinOrLose, ExtArgs);
check_gain(Rewards, WinOrLose, Role, _F, 18, Loser,
           _ExtArgs) ->
    fairyland:check_gain(Role, Rewards, WinOrLose, Loser);
check_gain(_Rewards, WinOrLose, Role, _F, 19, _Loser,
           _ExtArgs) ->
    fairyland:check_gain(Role, 19, WinOrLose);
check_gain(_Rewards, WinOrLose, Role, _F, 20, _Loser,
           _ExtArgs) ->
    fairyland:check_gain(Role, 20, WinOrLose);
check_gain(Rewards, WinOrLose, Role, _F, 22, _Loser,
           ExtArgs) ->
    quest_chain:check_gain(WinOrLose,
                           Rewards,
                           ExtArgs,
                           Role);
check_gain(Rewards, WinOrLose, Role, _F, 51, Loser,
           _ExtArgs) ->
    campaign_unit:check_gain(Role,
                             WinOrLose,
                             51,
                             Loser,
                             Rewards);
check_gain(Rewards, WinOrLose, Role, _F, 23, Loser,
           _ExtArgs) ->
    campaign_unit:check_gain(Role,
                             WinOrLose,
                             23,
                             Loser,
                             Rewards);
check_gain(Rewards, WinOrLose, Role, _F, 24, Loser,
           _ExtArgs) ->
    campaign_unit:check_gain(Role,
                             WinOrLose,
                             24,
                             Loser,
                             Rewards);
check_gain(Rewards, WinOrLose, Role, _F, 38, Loser,
           _ExtArgs) ->
    campaign_unit:check_gain(Role,
                             WinOrLose,
                             38,
                             Loser,
                             Rewards);
check_gain(Rewards, WinOrLose, Role, _F, 39, Loser,
           _ExtArgs) ->
    campaign_unit:check_gain(Role,
                             WinOrLose,
                             39,
                             Loser,
                             Rewards);
check_gain(Rewards, WinOrLose, Role, _F, 42, Loser,
           _ExtArgs) ->
    campaign_unit:check_gain(Role,
                             WinOrLose,
                             42,
                             Loser,
                             Rewards);
check_gain(Rewards, WinOrLose, Role, _F, 35, Loser,
           _ExtArgs) ->
    campaign_unit:check_gain(Role,
                             WinOrLose,
                             35,
                             Loser,
                             Rewards);
check_gain(Rewards, WinOrLose, Role, _F, 31, Loser,
           _ExtArgs) ->
    campaign_unit:check_gain(Role,
                             WinOrLose,
                             31,
                             Loser,
                             Rewards);
check_gain(Rewards, WinOrLose, Role, _F, 32, Loser,
           _ExtArgs) ->
    campaign_unit:check_gain(Role,
                             WinOrLose,
                             32,
                             Loser,
                             Rewards);
check_gain(Rewards, WinOrLose, Role, _F, 57, Loser,
           _ExtArgs) ->
    campaign_unit:check_gain(Role,
                             WinOrLose,
                             57,
                             Loser,
                             Rewards);
check_gain(Rewards, WinOrLose, Role, F, 47, Loser,
           _ExtArgs) ->
    campaign_unit:check_gain(Role,
                             WinOrLose,
                             47,
                             Loser,
                             Rewards,
                             F);
check_gain(Rewards, WinOrLose, Role, F, 48, Loser,
           _ExtArgs) ->
    campaign_unit:check_gain(Role,
                             WinOrLose,
                             48,
                             Loser,
                             Rewards,
                             F);
check_gain(Rewards, WinOrLose, Role, _F, 15, _Loser,
           ExtArgs) ->
    quest_prac:check_gain(WinOrLose,
                          Rewards,
                          ExtArgs,
                          Role);
check_gain(Rewards, WinOrLose, Role, _F, 59, _Loser,
           ExtArgs) ->
    quest_king:check_gain(WinOrLose,
                          Rewards,
                          ExtArgs,
                          Role);
check_gain(Rewards, WinOrLose, TRole, _F, 26, _Loser,
           ExtArgs) ->
    CampList = camp_assets:get(TRole, 2, 0),
    Role = camp_assets:acc(TRole, 2),
    CampGain = format:val_to_gain(CampList),
    constellation:check_gain(Role,
                             WinOrLose,
                             ExtArgs,
                             Rewards ++ CampGain);
check_gain(_Rewards, WinOrLose, Role, _F, 105, _Loser,
           _ExtArgs) ->
    guild_war:check_gain(Role, WinOrLose);
check_gain(_Rewards, WinOrLose, Role, _F, 52, _Loser,
           _ExtArgs) ->
    campaign_snow:check_gain(Role, WinOrLose);
check_gain(_Rewards, WinOrLose, Role, _F, 36, _Loser,
           ExtArgs) ->
    brave_trial:check_gain(Role, WinOrLose, ExtArgs);
check_gain(_Rewards, WinOrLose, Role, _F, 45, _Loser,
           ExtArgs) ->
    lev_break:check_gain(Role, WinOrLose, ExtArgs);
check_gain(_Rewards, WinOrLose, Role, _F, 108, _Loser,
           _ExtArgs) ->
    guild_league_role:check_gain(Role, WinOrLose);
check_gain(_Rewards, WinOrLose, Role, _F, 67, _Loser,
           ExtArgs) ->
    skill_unique:check_gain(Role, WinOrLose, ExtArgs);
check_gain(_Rewards, WinOrLose, Role, _F, 61, _Loser,
           ExtArgs) ->
    spirit_treasure_role:check_gain(Role,
                                    WinOrLose,
                                    ExtArgs);
check_gain(_Rewards, WinOrLose, Role, _F, 63, _Loser,
           ExtArgs) ->
    exquisite_shelf_role:check_gain(Role,
                                    WinOrLose,
                                    ExtArgs);
check_gain(Rewards, WinOrLose, Role, _F = #fighter{},
           68, _Loser, ExtArgs) ->
    stars_trial_mgr:check_gain(Role,
                               WinOrLose,
                               ExtArgs,
                               Rewards);
check_gain(Rewards, WinOrLose, Role, _F = #fighter{},
           72, _Loser, ExtArgs) ->
    star_moon_mgr:check_gain(Role,
                             WinOrLose,
                             ExtArgs,
                             Rewards);
check_gain(_Rewards, WinOrLose, Role, _F, 69, _Loser,
           ExtArgs) ->
    oracle_treasure_role:check_gain(Role,
                                    WinOrLose,
                                    ExtArgs);
check_gain(_Rewards, WinOrLose, Role, _F, 116, _Loser,
           _ExtArgs) ->
    canyon_summit_role:check_gain(Role, WinOrLose);
check_gain(Rewards, _WinOrLose, Role, _F, _CombatType,
           _Loser, _ExtArgs) ->
    {Role, Rewards}.

do_gain_loss(CombatType, Rewards,
             Role = #role{lev = RoleLev}, RatioVal) ->
    AbsRatio = case lists:member(CombatType, [11, 52]) of
                   true -> 100;
                   false ->
                       case RatioVal > 0 of
                           true ->
                               Abs = abs(RoleLev - RatioVal),
                               case Abs < 5 of
                                   true -> 100;
                                   false ->
                                       util:check_range(110 - Abs * 5, 20, 100)
                               end;
                           false -> 0
                       end
               end,
    PetAbsRatio = case lists:member(CombatType, [11, 52]) of
                      true -> 100;
                      false ->
                          case pet:get_war_pet(Role) of
                              {ok, #pet{lev = PetLev}} ->
                                  case RatioVal > 0 of
                                      true ->
                                          case PetLev =< RatioVal of
                                              true -> 100;
                                              false ->
                                                  PetAbs = abs(PetLev -
                                                                   RatioVal),
                                                  case PetAbs < 5 of
                                                      true -> 100;
                                                      false ->
                                                          round(util:check_range(110
                                                                                     -
                                                                                     PetAbs
                                                                                         *
                                                                                         5,
                                                                                 20,
                                                                                 100))
                                                  end
                                          end;
                                      false -> 0
                                  end;
                              _ -> 0
                          end
                  end,
    NewRewards = filter_exp_and_coin_reward(Rewards,
                                            AbsRatio,
                                            PetAbsRatio,
                                            []),
    case role_gain:auto_overlap(NewRewards, Role, "", true)
        of
        {ok, NewRole, SuccessGL, FailedGL} ->
            {NewRole, SuccessGL, FailedGL};
        _ -> {Role, [], []}
    end.

filter_exp_and_coin_reward([], _, _, Rewards) ->
    Rewards;
filter_exp_and_coin_reward([#gain{label = coin} | T], 0,
                           PetRatio, Rewards) ->
    filter_exp_and_coin_reward(T, 0, PetRatio, Rewards);
filter_exp_and_coin_reward([#gain{label = exp} | T], 0,
                           PetRatio, Rewards) ->
    filter_exp_and_coin_reward(T, 0, PetRatio, Rewards);
filter_exp_and_coin_reward([#gain{label = pet_exp} | T],
                           Ratio, 0, Rewards) ->
    filter_exp_and_coin_reward(T, Ratio, 0, Rewards);
filter_exp_and_coin_reward([G = #gain{label = coin,
                                      val = Val}
                            | T],
                           Ratio, PetRatio, Rewards) ->
    NewVal = round(Val * Ratio / 100),
    NewG = case lists:keyfind(coin, #gain.label, Rewards) of
               #gain{val = OldVal} ->
                   G#gain{label = coin, val = NewVal + OldVal};
               _ -> G#gain{label = coin, val = NewVal}
           end,
    NewRewards = lists:keystore(coin,
                                #gain.label,
                                Rewards,
                                NewG),
    filter_exp_and_coin_reward(T,
                               Ratio,
                               PetRatio,
                               NewRewards);
filter_exp_and_coin_reward([G = #gain{label = exp,
                                      val = Val}
                            | T],
                           Ratio, PetRatio, Rewards) ->
    NewVal = round(Val * Ratio / 100),
    NewG = case lists:keyfind(exp, #gain.label, Rewards) of
               #gain{val = OldVal} ->
                   G#gain{label = exp, val = NewVal + OldVal};
               _ -> G#gain{label = exp, val = NewVal}
           end,
    NewRewards = lists:keystore(exp,
                                #gain.label,
                                Rewards,
                                NewG),
    filter_exp_and_coin_reward(T,
                               Ratio,
                               PetRatio,
                               NewRewards);
filter_exp_and_coin_reward([G = #gain{label = pet_exp,
                                      val = Val}
                            | T],
                           Ratio, PetRatio, Rewards) ->
    NewVal = round(Val * PetRatio / 100),
    NewG = case lists:keyfind(pet_exp, #gain.label, Rewards)
               of
               #gain{val = OldVal} ->
                   G#gain{label = pet_exp, val = NewVal + OldVal};
               _ -> G#gain{label = pet_exp, val = NewVal}
           end,
    NewRewards = lists:keystore(pet_exp,
                                #gain.label,
                                Rewards,
                                NewG),
    filter_exp_and_coin_reward(T,
                               Ratio,
                               PetRatio,
                               NewRewards);
filter_exp_and_coin_reward([G | T], Ratio, PetRatio,
                           Rewards) ->
    filter_exp_and_coin_reward(T,
                               Ratio,
                               PetRatio,
                               [G | Rewards]).

format_rewards(Rewards) -> format_rewards(Rewards, []).

format_rewards([], Result) -> Result;
format_rewards([#gain{label = exp, val = Val} | T],
               Result) ->
    format_rewards(T, [{90010, Val} | Result]);
format_rewards([#gain{label = coin, val = Val} | T],
               Result) ->
    format_rewards(T, [{90000, Val} | Result]);
format_rewards([#gain{label = item_base_id, val = Val}
                | T],
               Result) ->
    Items = [{BaseId, Num} || {BaseId, _Bind, Num} <- Val],
    format_rewards(T, Items ++ Result);
format_rewards([_ | T], Result) ->
    format_rewards(T, Result).

handle_catched_pet(Role, win, Catched, CombatType) ->
    do_handle_catched_pet(Role, Catched, CombatType);
handle_catched_pet(Role, _WinOrLose, _Catched,
                   _CombatType) ->
    Role.

do_handle_catched_pet(Role, [], _) -> Role;
do_handle_catched_pet(Role, [{0, _Genre} | T],
                      CombatType) ->
    do_handle_catched_pet(Role, T, CombatType);
do_handle_catched_pet(Role = #role{name = RoleName},
                      [{BaseId, Genre} | T], CombatType) ->
    case pet:create(Role,
                    #{base_id => BaseId, genre => Genre, is_catched => true,
                      from => "战斗捉取"})
        of
        {ok, Role1} ->
            case CombatType of
                44 ->
                    PetName = case pet_data:get_base(BaseId) of
                                  #pet_base{name = PN} ->
                                      util:flist(lang:get("[变异~ts]"), [PN]);
                                  _ -> ""
                              end,
                    Msg1 =
                        notice:format(lang:get("~ts在使用~ts寻宝时，偶遇了~ts，并和它成为伙伴{face_1,38}"),
                                      [{role_2, RoleName},
                                       {string_2, 5, lang:get("远古藏宝图")},
                                       {string_2, 1, PetName}]),
                    notice:cast(all, 5, Msg1),
                    role:pack_send(Role1, 10547, {BaseId, Genre}),
                    ok;
                50 when Genre =:= 1 ->
                    PetName = case pet_data:get_base(BaseId) of
                                  #pet_base{name = PN} ->
                                      util:flist(lang:get("[变异~ts]"), [PN]);
                                  _ -> ""
                              end,
                    Msg1 =
                        notice:format(lang:get("~ts领养了一只可爱的宠物宝宝，竟然发现是一只~ts，真是好心有好报呀{face_1,7}"),
                                      [{role_2, RoleName},
                                       {string_2, 1, PetName}]),
                    notice:cast(all, 5, Msg1),
                    role:pack_send(Role1, 10547, {BaseId, Genre}),
                    ok;
                _ -> skip
            end,
            do_handle_catched_pet(Role1, T, CombatType);
        {false, _Reason} ->
            ok,
            do_handle_catched_pet(Role, T, CombatType)
    end.

assign_gains(_, [], _Loser) -> [];
assign_gains([], _, _Loser) -> [];
assign_gains(Gains, Winner, Loser) ->
    Leader = [F || F = #fighter{is_leader = 1} <- Loser],
    do_assign_gains(Gains, Winner, Leader, []).

do_assign_gains([], Winner, _LoseLeader, Result) ->
    Fids = [Fid
            || #fighter{id = Fid, type = Type} <- Winner,
               Type =:= 1],
    combine_assign_result(Fids, Result);
do_assign_gains([{2, SuperItems, NormalItems} | T],
                Winner, LoseLeader, Result) ->
    L = [Fid
         || #fighter{id = Fid, type = Type} <- Winner,
            Type =:= 1],
    ItemsResult = do_copy_assign_gains(SuperItems ++
                                           NormalItems,
                                       L),
    do_assign_gains(T,
                    Winner,
                    LoseLeader,
                    ItemsResult ++ Result);
do_assign_gains([{3, UnitId} | T], Winner, LoseLeader,
                Result) ->
    L = [F
         || F = #fighter{type = Type} <- Winner, Type =:= 1],
    ItemsResult = do_single_assign_gains(UnitId, L),
    do_assign_gains(T,
                    Winner,
                    LoseLeader,
                    ItemsResult ++ Result);
do_assign_gains([{1, SuperItems, NormalItems} | T],
                Winner, LoseLeader, Result) ->
    L = [Fid
         || #fighter{id = Fid, type = Type, is_leader = 1}
                <- Winner,
            Type =:= 1],
    SuperItemsResult = do_sort_assign_gains(SuperItems, L),
    NormalItemsResult = do_sort_assign_gains(NormalItems,
                                             L),
    do_assign_gains(T,
                    Winner,
                    LoseLeader,
                    SuperItemsResult ++ NormalItemsResult ++ Result);
do_assign_gains([_ | T], Winner, LoseLeader, Result) ->
    do_assign_gains(T, Winner, LoseLeader, Result).

do_copy_assign_gains(Gains, Fids) ->
    Fun = fun (Fid, Assign) ->
                  FidList = [{Fid, Gain} || Gain <- Gains],
                  FidList ++ Assign
          end,
    lists:foldl(Fun, [], Fids).

do_sort_assign_gains(Gains, Fids) ->
    case Fids of
        [Fid | _] -> [{Fid, Gain} || Gain <- Gains];
        _ -> []
    end.

do_single_assign_gains(UnitId, FighterList) ->
    Fun = fun (F = #fighter{id = Fid}, Assign) ->
                  case drop:produce(UnitId, F) of
                      {true, _, SuperGain, NorMalGain} ->
                          FidList = [{Fid, Gain}
                                     || Gain <- SuperGain ++ NorMalGain],
                          FidList ++ Assign;
                      _Err -> Assign
                  end
          end,
    lists:foldl(Fun, [], FighterList).

combine_assign_result(Fids, Assigns) ->
    do_combine_assign_result(Fids, Assigns, []).

do_combine_assign_result([], _, Result) -> Result;
do_combine_assign_result([Fid | T], Assigns, Result) ->
    Gains = [Gain || {Id, Gain} <- Assigns, Id =:= Fid],
    do_combine_assign_result(T,
                             Assigns,
                             [{Fid, Gains} | Result]).

gen_combat_over_calc_data(loser, F = #fighter{id = Fid},
                          #combat{result = Result,
                                  assign_gains = AssignGains}) ->
    CombatResult = case Result of
                       3 -> 3;
                       2 -> 2;
                       _ -> 0
                   end,
    Rewards = get_self_rewards(AssignGains, Fid),
    #combat_over_calc_data{fighter =
                               F#fighter{result = CombatResult},
                           combat_result = CombatResult, rewards = Rewards,
                           record = combat_record:get_buffer()};
gen_combat_over_calc_data(winner,
                          F = #fighter{id = Fid},
                          #combat{result = Result,
                                  assign_gains = AssignGains}) ->
    CombatResult = case Result of
                       3 -> 3;
                       2 -> 2;
                       _ -> 1
                   end,
    Rewards = get_self_rewards(AssignGains, Fid),
    #combat_over_calc_data{fighter =
                               F#fighter{result = CombatResult},
                           combat_result = CombatResult, rewards = Rewards,
                           record = combat_record:get_buffer()}.

get_self_rewards(AssignGains, Fid) ->
    case lists:keyfind(Fid, 1, AssignGains) of
        {Fid, Gains = [_ | _]} -> Gains;
        _ -> []
    end.

status_update(Role = #role{hp_max = HpMax,
                           mp_max = MpMax, assets = #assets{satiety = Satiety},
                           m_dungeon = #m_dungeon{dun_id = DunId}},
              CombatType, #fighter{hp = Hp, mp = Mp, is_die = IsDie},
              #combat{winner = Winner, loser = Loser}, WinOrLose) ->
    SpecialFlag = lists:member(CombatType,
                               [3, 5, 8, 9, 10, 13, 16, 55]),
    Flag = case SpecialFlag =:= true andalso IsDie =:= 1 of
               true -> special;
               false ->
                   WeddingFlag = wedding:buff_flag(Role),
                   case CombatType of
                       3 ->
                           case util:rand(1, 100) =< 50 of
                               true when WeddingFlag == false -> check;
                               true -> true;
                               false -> check
                           end;
                       100 -> normal;
                       112 -> normal;
                       102 -> normal;
                       104 -> normal;
                       107 -> normal;
                       41 -> normal;
                       6 -> normal;
                       105 -> normal;
                       106 -> normal;
                       103 -> normal;
                       21 -> normal;
                       18 -> normal;
                       20 -> normal;
                       19 -> normal;
                       17 -> normal;
                       36 -> normal;
                       40 -> normal;
                       58 -> normal;
                       108 -> normal;
                       43 -> normal;
                       60 -> normal;
                       110 -> normal;
                       111 -> normal;
                       114 -> normal;
                       115 -> normal;
                       116 -> normal;
                       11 ->
                           case dungeon_data:get(DunId) of
                               #dungeon_base{type = 5} -> normal;
                               _ when IsDie == 1 -> special;
                               _ -> true
                           end;
                       _ -> true
                   end
           end,
    UpdateFlag = case Flag of
                     normal -> normal;
                     special ->
                         LossVal = max(1, min(20, Satiety)),
                         Loss = [#loss{label = satiety, val = LossVal}],
                         case role_gain:do(Loss, Role) of
                             {ok, Role1} ->
                                 notice:send(Role1,
                                             3,
                                             {lang:get("死亡扣除~ts点饱食度"),
                                              [{string_2, 5, LossVal}]}),
                                 {suc, Role1};
                             _ -> fail
                         end;
                     true ->
                         Loss = [#loss{label = satiety, val = 1}],
                         case role_gain:do(Loss, Role) of
                             {ok, Role1} -> {suc, Role1};
                             _ -> fail
                         end;
                     check ->
                         case Satiety >= 1 of
                             true -> {suc, Role};
                             false -> fail
                         end;
                     false -> {suc, Role}
                 end,
    case UpdateFlag of
        {suc, NewRole} ->
            NewRole1 = NewRole#role{hp =
                                        recalc_status(CombatType,
                                                      hp,
                                                      WinOrLose,
                                                      IsDie,
                                                      Hp,
                                                      HpMax),
                                    mp =
                                        recalc_status(CombatType,
                                                      mp,
                                                      WinOrLose,
                                                      IsDie,
                                                      Mp,
                                                      MpMax)},
            NewRole2 = pet_status_update(CombatType,
                                         WinOrLose,
                                         1,
                                         NewRole1,
                                         Winner ++ Loser),
            attr:push_10011(NewRole2),
            NewRole2;
        normal -> Role;
        fail ->
            NewRole = Role#role{hp = util:check_range(Hp, 1, HpMax),
                                mp = util:check_range(Mp, 1, MpMax)},
            NewRole1 = pet_status_update(CombatType,
                                         WinOrLose,
                                         0,
                                         NewRole,
                                         Winner ++ Loser),
            attr:push_10011(NewRole1),
            NewRole1
    end.

recalc_status(_CombatType, hp, _WinOrLose, _IsDie, _Val,
              MaxVal) ->
    MaxVal;
recalc_status(_CombatType, mp, _WinOrLose, _IsDie, _Val,
              MaxVal) ->
    MaxVal;
recalc_status(_CombatType, pet_hp, _WinOrLose, _IsDie,
              _Val, MaxVal) ->
    MaxVal;
recalc_status(_CombatType, pet_mp, _WinOrLose, _IsDie,
              _Val, MaxVal) ->
    MaxVal.

pet_status_update(CombatType, WinOrLose, IsHeal,
                  Role = #role{m_pet = Mpet = #m_pet{pets = Pets}},
                  FighterList) ->
    NewPets = do_pet_status_update(IsHeal,
                                   CombatType,
                                   WinOrLose,
                                   Role,
                                   Pets,
                                   FighterList),
    NewMpet = Mpet#m_pet{pets = NewPets},
    NewRole = Role#role{m_pet = NewMpet},
    NewRole.

do_pet_status_update(_IsHeal, _CombatType, _WinOrLose,
                     _Role, Pets, []) ->
    Pets;
do_pet_status_update(IsHeal, CombatType, WinOrLose,
                     Role = #role{pid = RolePid}, Pets,
                     [#fighter{type = 3, origin_id = PetId,
                               master_pid = RolePid, hp = PetHp, mp = PetMp,
                               is_die = IsDie}
                      | T]) ->
    case lists:keyfind(PetId, #pet.id, Pets) of
        Pet = #pet{hp_max = PetHpMax, mp_max = PetMpMax} ->
            NewPet = case IsHeal of
                         1 ->
                             Pet#pet{hp =
                                         recalc_status(CombatType,
                                                       pet_hp,
                                                       WinOrLose,
                                                       IsDie,
                                                       PetHp,
                                                       PetHpMax),
                                     mp =
                                         recalc_status(CombatType,
                                                       pet_mp,
                                                       WinOrLose,
                                                       IsDie,
                                                       PetMp,
                                                       PetMpMax)};
                         0 ->
                             Pet#pet{hp = util:check_range(PetHp, 1, PetHpMax),
                                     mp = util:check_range(PetMp, 1, PetMpMax)}
                     end,
            pet:push_10525(Role, NewPet),
            NewPets = lists:keyreplace(PetId,
                                       #pet.id,
                                       Pets,
                                       NewPet),
            do_pet_status_update(IsHeal,
                                 CombatType,
                                 WinOrLose,
                                 Role,
                                 NewPets,
                                 T);
        _ ->
            do_pet_status_update(IsHeal,
                                 CombatType,
                                 WinOrLose,
                                 Role,
                                 Pets,
                                 T)
    end;
do_pet_status_update(IsHeal, CombatType, WinOrLose,
                     Role, Pets, [_ | T]) ->
    do_pet_status_update(IsHeal,
                         CombatType,
                         WinOrLose,
                         Role,
                         Pets,
                         T).

combat_over_leave(Combat = #combat{type = CombatType,
                                   winner = Winner, loser = Loser,
                                   ratio_val = CombatRatioVal}) ->
    Fun = fun (F, {RList, PList, CList}) ->
                  case F#fighter.type of
                      1 -> {[F | RList], PList, CList};
                      3 -> {RList, [F | PList], CList};
                      6 -> {RList, PList, [F | CList]};
                      _ -> {RList, PList, CList}
                  end
          end,
    {WinRL, WinPL, WinCL} = lists:foldl(Fun,
                                        {[], [], []},
                                        Winner),
    {LossRL, LossPL, LossCL} = lists:foldl(Fun,
                                           {[], [], []},
                                           Loser),
    catch log:combat_round(Combat),
    catch qualifying_util:combat_over(Combat),
    catch c_guild_siege_mgr:combat_over(Combat),
    catch warrior:combat_over(Combat),
    catch top_compete:combat_over(Combat),
    catch hero_role:combat_over(Combat),
    catch elf_role:combat_over(Combat),
    catch gold_league:combat_over(Combat),
    catch combat_record:save(Combat),
    case get(combat_over_mail) of
        {Title, Content} ->
            logger:debug("战斗结束信息:~w",
                         [WinPL ++ LossPL],
                         combat_end,
                         1651),
            [begin
                 case env:get(is_big_world_center) of
                     true ->
                         big_world:cast(P,
                                        Z,
                                        mail,
                                        send,
                                        [RoleId, Title, Content]);
                     _ -> mail:send(RoleId, Title, Content)
                 end
             end
             || #fighter{type = 1, origin_id = RoleId, platform = P,
                         zone_id = Z}
                    <- WinRL ++ LossRL];
        _ ->
            logger:debug("战斗结束信息===========", [], combat_end, 1660),
            ok
    end,
    lists:foreach(fun (F1 = #fighter{pid = Pid,
                                     plot = Plot}) ->
                          role:apply(async,
                                     Pid,
                                     {combat_end,
                                      do_combat_over_leave,
                                      [win,
                                       F1,
                                       Loser,
                                       Plot,
                                       CombatRatioVal,
                                       WinPL,
                                       WinCL,
                                       CombatType]})
                  end,
                  WinRL),
    lists:foreach(fun (F2 = #fighter{pid = Pid,
                                     plot = Plot}) ->
                          role:apply(async,
                                     Pid,
                                     {combat_end,
                                      do_combat_over_leave,
                                      [lose,
                                       F2,
                                       Winner,
                                       Plot,
                                       CombatRatioVal,
                                       LossPL,
                                       LossCL,
                                       CombatType]})
                  end,
                  LossRL).

do_combat_over_leave(Role = #role{name = _Name,
                                  m_combat = MC},
                     WinOrLose,
                     #fighter{id = Fid, is_escape = Escape,
                              is_leader = IsLeader},
                     OtherList, Plot, CombatRatioVal, PetList, ChildList,
                     CombatType) ->
    ok,
    Role0 = Role#role{status = 0,
                      m_combat =
                          MC#m_combat{pid = undefined, combat_type = 0}},
    Role1 = plot:merge(Role0, Plot),
    Role2 = pet:loss_happy(CombatType, Role1, Fid, PetList),
    Role3 = child_effect:loss_hungry(CombatType,
                                     Role2,
                                     Fid,
                                     ChildList),
    Role4 = child_talent:combat_add_talent(Role3,
                                           CombatType,
                                           ChildList),
    NewRole = Role4,
    map:role_status_update(NewRole),
    case Escape of
        1 -> team:escape(NewRole);
        _ -> ok
    end,
    NewRole1 = case CombatType of
                   6 when IsLeader =:= 1 ->
                       combat_mgr:end_trans(NewRole, WinOrLose);
                   _ -> NewRole
               end,
    NRole = do_trigger_evt(OtherList,
                           WinOrLose,
                           NewRole1,
                           CombatRatioVal),
    {ok,
     role_trigger:fire(#evt_combat_over{combat_type =
                                            CombatType,
                                        win_flag = WinOrLose},
                       NRole)}.

do_trigger_evt([], _Flag, Role, _RatioVal) -> Role;
do_trigger_evt([#fighter{rid = UnitId, type = 2,
                         base_id = BaseId, origin_id = OriginId}
                | T],
               Flag, Role, RatioVal) ->
    Fun = fun (#fighter{type = 2, base_id = Bid},
               {Num, List})
                  when Bid =:= BaseId ->
                  {Num + 1, List};
              (OtherF = #fighter{}, {Num, List}) ->
                  {Num, [OtherF | List]};
              (_, {Num, List}) -> {Num, List}
          end,
    {SameNum, OtherList} = lists:foldl(Fun, {1, []}, T),
    Role0 = case Flag of
                win ->
                    role_trigger:fire(#evt_kill_npc{id = UnitId,
                                                    base_id = BaseId,
                                                    num = SameNum,
                                                    ratio_val = RatioVal,
                                                    origin_id = OriginId},
                                      Role);
                _ ->
                    role_trigger:fire(#evt_kill_npc_lose{id = UnitId,
                                                         base_id = BaseId,
                                                         num = SameNum},
                                      Role)
            end,
    NRole = role_trigger:fire(#evt_fight_unit{id = UnitId,
                                              base_id = BaseId, num = SameNum},
                              Role0),
    do_trigger_evt(OtherList, Flag, NRole, RatioVal);
do_trigger_evt([#fighter{rid = Rid, type = 4} | T],
               Flag, Role, RatioVal) ->
    NRole = case Flag of
                win ->
                    role_trigger:fire(#evt_kill_role_clone{id = Rid,
                                                           ratio_val =
                                                               RatioVal},
                                      Role);
                _ -> Role
            end,
    do_trigger_evt(T, Flag, NRole, RatioVal);
do_trigger_evt([_ | T], Flag, Role, RatioVal) ->
    do_trigger_evt(T, Flag, Role, RatioVal).

calc_combat_trigger(Role = #role{pid = RolePid,
                                 m_mount =
                                     #m_mount{next_mount_id = NextMountId},
                                 m_wedding = #m_wedding{lover_id = LoverId}},
                    #combat{type = CombatType, winner = Winner,
                            loser = Loser},
                    WinOrLose,
                    #combat_statistics{revive = Revive,
                                       pet_revive = PetRevive,
                                       cast_pet = CastPet, is_die = IsDie,
                                       has_use_item = HasUseItem, guard = Guard,
                                       kill_group = KilleGroup,
                                       killed_group = KilledGroup,
                                       kill_group_pet = KillGroupPet,
                                       kill_group_target = KillGroupTarget,
                                       killed_group_target = KilledGroupTarget,
                                       kill_group_target_pet =
                                           KillGroupTargetPet}) ->
    IsWin = case WinOrLose of
                win -> 1;
                _ -> 0
            end,
    LoverFighter = case WinOrLose of
                       win ->
                           lists:keyfind(LoverId, #fighter.origin_id, Winner);
                       _ -> lists:keyfind(LoverId, #fighter.origin_id, Loser)
                   end,
    LoverEvt = case LoverFighter of
                   #fighter{} -> [#evt_lover_combat{win_flag = IsWin}];
                   _ -> []
               end,
    EvtList = LoverEvt ++
                  [#evt_combat_statistics{revive = Revive,
                                          pet_revive = PetRevive,
                                          cast_pet = CastPet,
                                          use_item = HasUseItem, is_die = IsDie,
                                          is_win = IsWin, guard = Guard,
                                          kill_group = KilleGroup,
                                          killed_group = KilledGroup,
                                          kill_group_pet = KillGroupPet,
                                          kill_group_target = KillGroupTarget,
                                          killed_group_target =
                                              KilledGroupTarget,
                                          kill_group_target_pet =
                                              KillGroupTargetPet}],
    EvtList1 = case NextMountId > 1 of
                   true ->
                       MountEvt = #evt_mount_combat{combat_type = CombatType,
                                                    is_win = IsWin},
                       [MountEvt | EvtList];
                   false -> EvtList
               end,
    EvtList2 = case child:is_pregnant(Role) of
                   {true, _} ->
                       ChildEvt = #evt_child_combat{combat_type = CombatType,
                                                    is_win = IsWin},
                       [ChildEvt | EvtList1];
                   _ -> EvtList1
               end,
    Times = var:get_var(Role, day, 617, 0),
    EvtList3 = case Times < 1 andalso
                        IsWin =:= 1 andalso
                            CombatType =/= 3 andalso CombatType =/= 6
                   of
                   true ->
                       Camp7_7thEvt = #evt_camp_7_7th_point{val = 2},
                       [Camp7_7thEvt | EvtList2];
                   _ -> EvtList2
               end,
    Roles = case IsWin of
                1 -> Winner;
                _ -> Loser
            end,
    EvtList4 = case lists:keyfind(RolePid,
                                  #fighter.pid,
                                  Roles)
                   of
                   Fighter = #fighter{} ->
                       Power = combat_cache:get_ext_val(Fighter, 8, 0),
                       WingPowerEvt = #evt_combat_wing_power{val = Power},
                       AddWingEvtList = [WingPowerEvt | EvtList3],
                       case skill_unique:is_unstand_skill_unique(Role) of
                           true ->
                               UnitAvgLev = round(lists:sum([Lev
                                                             || #fighter{lev =
                                                                             Lev}
                                                                    <- Loser])
                                                      / length(Loser)),
                               SqPoint = combat_cache:get_ext_val(Fighter,
                                                                  9,
                                                                  0),
                               SqPointEvt = #evt_combat_sq_point{combat_type =
                                                                     CombatType,
                                                                 is_win = IsWin,
                                                                 val = SqPoint,
                                                                 unit_lev =
                                                                     UnitAvgLev},
                               [SqPointEvt | AddWingEvtList];
                           _ -> AddWingEvtList
                       end;
                   _ ->
                       logger:debug("找不到角色同步翅膀能量~w",
                                    [RolePid],
                                    combat_end,
                                    1815),
                       EvtList3
               end,
    EvtList4.

calc_combat_guard(FightGuard,
                  #role{m_guard = #m_guard{guards = Guards}}) ->
    do_calc_combat_guard(FightGuard, Guards, []).

do_calc_combat_guard([], _, FightGuard) -> FightGuard;
do_calc_combat_guard([BaseId | T], Guards,
                     FightGuard) ->
    case lists:keyfind(BaseId, #guard.base_id, Guards) of
        #guard{score = Score} ->
            do_calc_combat_guard(T,
                                 Guards,
                                 [{BaseId, Score} | FightGuard]);
        _ -> do_calc_combat_guard(T, Guards, FightGuard)
    end.

enter_combat_failed(Combat = #combat{type = 40},
                    AtkList, DfdList) ->
    tournament:combat_fail(Combat, AtkList, DfdList);
enter_combat_failed(Combat = #combat{type = 58},
                    AtkList, DfdList) ->
    tournament:combat_fail(Combat, AtkList, DfdList);
enter_combat_failed(Combat = #combat{type = 110},
                    AtkList, DfdList) ->
    gods_duel_match:combat_fail(Combat, AtkList, DfdList);
enter_combat_failed(Combat = #combat{type = 111},
                    AtkList, DfdList) ->
    gods_duel_match:combat_fail(Combat, AtkList, DfdList);
enter_combat_failed(_Combat, _AtkList, _DfdList) -> ok.

combat_over_error(_Combat = #combat{type = 2}, AtkList,
                  DfdList) ->
    lists:foreach(fun (F = #fighter{pid = Pid, plot = Plot,
                                    type = 1})
                          when is_pid(Pid) ->
                          role:apply(async,
                                     Pid,
                                     {combat_end,
                                      do_combat_over_error,
                                      [lose, F, DfdList, Plot]});
                      (_F) -> skip
                  end,
                  AtkList),
    ok;
combat_over_error(Combat = #combat{type = 40}, AtkList,
                  DfdList) ->
    tournament:combat_fail(Combat, AtkList, DfdList),
    lists:foreach(fun (F = #fighter{pid = Pid, plot = Plot,
                                    type = 1})
                          when is_pid(Pid) ->
                          role:apply(async,
                                     Pid,
                                     {combat_end,
                                      do_combat_over_error,
                                      [lose, F, DfdList, Plot]});
                      (_F) -> skip
                  end,
                  AtkList),
    ok;
combat_over_error(Combat = #combat{type = 58}, AtkList,
                  DfdList) ->
    tournament:combat_fail(Combat, AtkList, DfdList),
    lists:foreach(fun (F = #fighter{pid = Pid, plot = Plot,
                                    type = 1})
                          when is_pid(Pid) ->
                          role:apply(async,
                                     Pid,
                                     {combat_end,
                                      do_combat_over_error,
                                      [lose, F, DfdList, Plot]});
                      (_F) -> skip
                  end,
                  AtkList),
    ok;
combat_over_error(_Combat, AtkList, DfdList) ->
    lists:foreach(fun (#fighter{pid = Pid, type = 1})
                          when is_pid(Pid) ->
                          role:apply(async,
                                     Pid,
                                     {combat_end, do_combat_over_error, []});
                      (_F) -> skip
                  end,
                  AtkList),
    lists:foreach(fun (#fighter{pid = Pid, type = 1})
                          when is_pid(Pid) ->
                          role:apply(async,
                                     Pid,
                                     {combat_end, do_combat_over_error, []});
                      (_F) -> skip
                  end,
                  DfdList),
    ok.

do_combat_over_error(Role = #role{name = _Name,
                                  m_combat = MC},
                     WinOrLose, F, FoeL, Plot) ->
    ok,
    Role1 = Role#role{status = 0,
                      m_combat =
                          MC#m_combat{pid = undefined, combat_type = 0}},
    role:link_send(Role1, 10790, {3, "", []}),
    Role2 = plot:merge(Role1, Plot),
    NRole = do_trigger_evt(FoeL, WinOrLose, Role2, F),
    map:role_status_update(NRole),
    {ok, NRole}.

do_combat_over_error(Role = #role{name = _Name,
                                  m_combat = MC}) ->
    Role1 = Role#role{status = 0,
                      m_combat =
                          MC#m_combat{pid = undefined, combat_type = 0}},
    role:link_send(Role1, 10790, {3, "", []}),
    map:role_status_update(Role1),
    {ok, Role1}.

add_combat_gl_notice(MFA, Role) ->
    NoticeList = var:get_var(Role, other, 2006, []),
    NewNoticeList = [MFA | NoticeList],
    var:set_var(Role, other, 2006, NewNoticeList).

del_combat_gl_notice(Role) ->
    var:del_var(Role, other, 2006).

combat_gl_notice(_Role, []) -> ok;
combat_gl_notice(Role, SuccessGL) ->
    NoticeList = var:get_var(Role, other, 2006, []),
    List = lists:reverse(NoticeList),
    case List of
        [_ | _] -> combat_mfa_notice(List, SuccessGL, Role);
        _Empty -> notice:gl(SuccessGL, Role, lang:get("你"))
    end,
    ok.

combat_mfa_notice([], _SucGL, _Role) -> ok;
combat_mfa_notice([H | Rest], SucGL, Role) ->
    case H of
        {F} -> catch erlang:apply(F, [Role, SucGL]);
        {F, A} -> catch erlang:apply(F, [Role, SucGL | A]);
        {M, F, A} ->
            catch erlang:apply(M, F, [Role, SucGL | A]);
        _ -> skip
    end,
    combat_mfa_notice(Rest, SucGL, Role).

special_buff_rewards(Role, RewardsList, [H | T]) ->
    NRewardsList = case
                       buff:is_special_effect_exists_one_param(Role, H)
                       of
                       {true, ValueAdd} ->
                           logger:debug("~w", [H], combat_end, 1940),
                           calc_ward_by_precent(H, RewardsList, [], ValueAdd);
                       {false, _} -> RewardsList;
                       _Err ->
                           logger:error("case error:~w",
                                        [_Err],
                                        combat_end,
                                        1945),
                           RewardsList
                   end,
    special_buff_rewards(Role, NRewardsList, T);
special_buff_rewards(_Role, RewardsList, []) ->
    RewardsList.

calc_ward_by_precent(_H, [], NewWards, _ValueAdd) ->
    NewWards;
calc_ward_by_precent(37,
                     [#gain{label = coin, val = Val} | Rest], NewRewards,
                     ValueAdd) ->
    NewExpReward = [#gain{label = coin,
                          val = round(Val * (ValueAdd + 1000) / 1000)}
                    | NewRewards],
    logger:debug("buff:~w加成，原银币~w,加成后~w",
                 [37, Val, round(Val * (ValueAdd + 1000) / 1000)],
                 combat_end,
                 1954),
    calc_ward_by_precent(37, Rest, NewExpReward, ValueAdd);
calc_ward_by_precent(BuffId,
                     [#gain{label = exp, val = Val} | Rest], NewRewards,
                     ValueAdd)
    when BuffId =/= 37 ->
    NewExpReward = [#gain{label = exp,
                          val = round(Val * (ValueAdd + 1000) / 1000)}
                    | NewRewards],
    logger:debug("buff:~w加成，原经验~w,加成后~w",
                 [BuffId, Val, round(Val * (ValueAdd + 1000) / 1000)],
                 combat_end,
                 1958),
    calc_ward_by_precent(BuffId,
                         Rest,
                         NewExpReward,
                         ValueAdd);
calc_ward_by_precent(BuffId, [Reward | Rest],
                     NewRewards, ValueAdd) ->
    calc_ward_by_precent(BuffId,
                         Rest,
                         [Reward | NewRewards],
                         ValueAdd).

