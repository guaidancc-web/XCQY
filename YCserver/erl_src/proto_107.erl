-file("src/proto/proto_107.erl", 1).

-module(proto_107).

-export([pack/3, unpack/3]).

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

-file("src/proto/proto_107.erl", 14).

-file("inc/protocol.hrl", 1).

-record(module,
        {code :: undefined | pos_integer(),
         type :: undefined | game_server | monitor | tester,
         need_auth = true :: boolean(),
         caller = connector :: connector | object,
         module :: undefined | atom(),
         desc = "" :: string()}).

-record(rpc,
        {code = 0 :: non_neg_integer(),
         disable = false :: boolean(),
         autolog = false :: boolean(),
         autozip = false :: boolean(),
         condition = [] :: [tuple()],
         log_title :: undefined | string(),
         req_desc ::
             undefined |
             string() |
             {string(), [atom()]} |
             {atom(), atom(), tuple()},
         req = [] :: {atom(), [tuple()]} | [tuple()],
         reply_desc ::
             undefined |
             string() |
             {string(), [atom()]} |
             {atom(), atom(), tuple()},
         reply = [] :: {atom(), [tuple()]} | [tuple()],
         parser :: undefined | atom(),
         mod :: undefined | atom(),
         can_cache = true :: boolean()}).

-file("src/proto/proto_107.erl", 15).

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

-file("src/proto/proto_107.erl", 16).

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

-file("src/proto/proto_107.erl", 17).

-file("inc/combat_hook_setting.hrl", 1).

-record(m_hook_setting,
        {ver = 2,
         valid_index = 0 :: non_neg_integer(),
         plan_data = [] :: list()}).

-record(hook_setting,
        {index = 1 :: pos_integer(),
         name = [] :: pos_integer(),
         skill_plan = [] :: list()}).

-file("src/proto/proto_107.erl", 18).

-spec pack(srv | cli, non_neg_integer(),
           tuple()) -> {ok, binary()} |
                       {error, {unknown_pack_command, non_neg_integer()}}.

pack(cli, 10705, {V0_rid, V0_platform, V0_zone_id}) ->
    D_a_t_a = <<V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10705:16/little,
       D_a_t_a/binary>>};
pack(srv, 10705, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10705:16/little,
       D_a_t_a/binary>>};
pack(cli, 10706, {}) ->
    {ok, <<2:32/little, 10706:16/little>>};
pack(srv, 10706, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10706:16/little,
       D_a_t_a/binary>>};
pack(cli, 10707, {V0_battle_id, V0_id}) ->
    D_a_t_a = <<V0_battle_id:32/little, V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10707:16/little,
       D_a_t_a/binary>>};
pack(srv, 10707, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10707:16/little,
       D_a_t_a/binary>>};
pack(cli, 10710, {}) ->
    {ok, <<2:32/little, 10710:16/little>>};
pack(srv, 10710,
     {V0_combat_type,
      V0_enter_type,
      V0_enter_view,
      V0_start_time,
      V0_atk_formation,
      V0_atk_formation_lev,
      V0_dfd_formation,
      V0_dfd_formation_lev,
      V0_round,
      V0_guide,
      V0_status,
      V0_wait_time,
      V0_time,
      V0_fighter_list,
      V0_summon_num,
      V0_use_item_num,
      V0_anger,
      V0_use_anger_ratio,
      V0_skill_infos,
      V0_pet_skill_infos,
      V0_child_skill_infos,
      V0_skill_cooldown_list,
      V0_skill_cooldown_list_pet,
      V0_backup_pets,
      V0_backup_childs}) ->
    D_a_t_a = <<V0_combat_type:8/little,
                V0_enter_type:8/little, V0_enter_view:8/little,
                V0_start_time:32/little, V0_atk_formation:8/little,
                V0_atk_formation_lev:8/little,
                V0_dfd_formation:8/little,
                V0_dfd_formation_lev:8/little, V0_round:16/little,
                V0_guide:16/little, V0_status:8/little,
                V0_wait_time:8/little, V0_time:8/little,
                (length(V0_fighter_list)):16/little,
                (list_to_binary([<<V1_id:16/little, V1_group:8/little,
                                   V1_type:8/little, V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:16/little, V1_base_id:32/little,
                                   V1_master_fid:16/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_sex:8/little, V1_classes:8/little,
                                   V1_lev:16/little, V1_face_id:32/little,
                                   V1_is_die:8/little,
                                   V1_is_die_disappear:8/little,
                                   V1_hp:32/signed-little,
                                   V1_tmp_hp_max:32/signed-little,
                                   V1_mp:32/signed-little, V1_pos:8/little,
                                   V1_order:8/little,
                                   V1_self_preside_status:8/little,
                                   (protocol:pack(string,
                                                  V1_self_preside_text))/binary,
                                   V1_target_preside_status:8/little,
                                   (protocol:pack(string,
                                                  V1_target_preside_text))/binary,
                                   V1_is_auto:8/little, V1_is_hosted:8/little,
                                   V1_fc:32/little, V1_hp_max:32/signed-little,
                                   V1_mp_max:32/signed-little,
                                   V1_model_id:32/little,
                                   (length(V1_looks)):16/little,
                                   (list_to_binary([<<V2_looks_type:32/little,
                                                      V2_looks_mode:32/little,
                                                      V2_looks_val:32/little,
                                                      (protocol:pack(string,
                                                                     V2_looks_str))/binary>>
                                                    || {V2_looks_type,
                                                        V2_looks_mode,
                                                        V2_looks_val,
                                                        V2_looks_str}
                                                           <- V1_looks]))/binary,
                                   (length(V1_buff_infos)):16/little,
                                   (list_to_binary([<<V2_buff_id:32/little,
                                                      V2_layer:8/little,
                                                      V2_duration:8/little,
                                                      V2_duration_left:8/little,
                                                      V2_can_dispel:8/little>>
                                                    || {V2_buff_id,
                                                        V2_layer,
                                                        V2_duration,
                                                        V2_duration_left,
                                                        V2_can_dispel}
                                                           <- V1_buff_infos]))/binary>>
                                 || #fighter{id = V1_id, group = V1_group,
                                             type = V1_type, rid = V1_rid,
                                             platform = V1_platform,
                                             zone_id = V1_zone_id,
                                             base_id = V1_base_id,
                                             master_fid = V1_master_fid,
                                             name = V1_name, sex = V1_sex,
                                             classes = V1_classes, lev = V1_lev,
                                             face_id = V1_face_id,
                                             is_die = V1_is_die,
                                             is_die_disappear =
                                                 V1_is_die_disappear,
                                             hp = V1_hp,
                                             tmp_hp_max = V1_tmp_hp_max,
                                             mp = V1_mp, pos = V1_pos,
                                             order = V1_order,
                                             self_preside_status =
                                                 V1_self_preside_status,
                                             self_preside_text =
                                                 V1_self_preside_text,
                                             target_preside_status =
                                                 V1_target_preside_status,
                                             target_preside_text =
                                                 V1_target_preside_text,
                                             is_auto = V1_is_auto,
                                             is_hosted = V1_is_hosted,
                                             attr =
                                                 #attr{fc = V1_fc,
                                                       hp_max = V1_hp_max,
                                                       mp_max = V1_mp_max},
                                             special_attr =
                                                 #special_attr{model_id =
                                                                   V1_model_id},
                                             looks = V1_looks,
                                             buff_infos = V1_buff_infos}
                                        <- V0_fighter_list]))/binary,
                V0_summon_num:8/little, V0_use_item_num:8/little,
                V0_anger:16/little, V0_use_anger_ratio:16/little,
                (length(V0_skill_infos)):16/little,
                (list_to_binary([<<V1_skill_type_1:8/little,
                                   (length(V1_skill_data_1)):16/little,
                                   (list_to_binary([<<V2_skill_id_1:32/little,
                                                      V2_skill_lev_1:8/little>>
                                                    || {V2_skill_id_1,
                                                        V2_skill_lev_1}
                                                           <- V1_skill_data_1]))/binary>>
                                 || {V1_skill_type_1, V1_skill_data_1}
                                        <- V0_skill_infos]))/binary,
                (length(V0_pet_skill_infos)):16/little,
                (list_to_binary([<<V1_pet_id:32/little,
                                   (length(V1_pet_skill_infos)):16/little,
                                   (list_to_binary([<<V2_skill_type_2:8/little,
                                                      (length(V2_skill_data_2)):16/little,
                                                      (list_to_binary([<<V3_skill_id_2:32/little,
                                                                         V3_skill_lev_2:8/little>>
                                                                       || {V3_skill_id_2,
                                                                           V3_skill_lev_2}
                                                                              <- V2_skill_data_2]))/binary>>
                                                    || {V2_skill_type_2,
                                                        V2_skill_data_2}
                                                           <- V1_pet_skill_infos]))/binary>>
                                 || {V1_pet_id, V1_pet_skill_infos}
                                        <- V0_pet_skill_infos]))/binary,
                (length(V0_child_skill_infos)):16/little,
                (list_to_binary([<<V1_child_id:32/little,
                                   (length(V1_child_skill_infos)):16/little,
                                   (list_to_binary([<<V2_skill_type_3:8/little,
                                                      (length(V2_skill_data_3)):16/little,
                                                      (list_to_binary([<<V3_skill_id_3:32/little,
                                                                         V3_skill_lev_3:8/little>>
                                                                       || {V3_skill_id_3,
                                                                           V3_skill_lev_3}
                                                                              <- V2_skill_data_3]))/binary>>
                                                    || {V2_skill_type_3,
                                                        V2_skill_data_3}
                                                           <- V1_child_skill_infos]))/binary>>
                                 || {V1_child_id, V1_child_skill_infos}
                                        <- V0_child_skill_infos]))/binary,
                (length(V0_skill_cooldown_list)):16/little,
                (list_to_binary([<<V1_skill_id:32/little,
                                   V1_cd_left:16/little>>
                                 || {V1_skill_id, V1_cd_left}
                                        <- V0_skill_cooldown_list]))/binary,
                (length(V0_skill_cooldown_list_pet)):16/little,
                (list_to_binary([<<V1_skill_id:32/little,
                                   V1_cd_left:16/little>>
                                 || {V1_skill_id, V1_cd_left}
                                        <- V0_skill_cooldown_list_pet]))/binary,
                (length(V0_backup_pets)):16/little,
                (list_to_binary([<<V1_id:32/little,
                                   V1_base_id:32/little, V1_can_summon:8/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_lev:8/little>>
                                 || #c_pet{id = V1_id, base_id = V1_base_id,
                                           can_summon = V1_can_summon,
                                           name = V1_name, lev = V1_lev}
                                        <- V0_backup_pets]))/binary,
                (length(V0_backup_childs)):16/little,
                (list_to_binary([<<V1_id:32/little,
                                   V1_base_id:32/little, V1_can_summon:8/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_lev:8/little, V1_hungry:32/little>>
                                 || #c_child{id = V1_id, base_id = V1_base_id,
                                             can_summon = V1_can_summon,
                                             name = V1_name, lev = V1_lev,
                                             hungry = V1_hungry}
                                        <- V0_backup_childs]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10710:16/little,
       D_a_t_a/binary>>};
pack(cli, 10711, {}) ->
    {ok, <<2:32/little, 10711:16/little>>};
pack(srv, 10711, {V0_result}) ->
    D_a_t_a = <<V0_result:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10711:16/little,
       D_a_t_a/binary>>};
pack(cli, 10720, {}) ->
    {ok, <<2:32/little, 10720:16/little>>};
pack(srv, 10720,
     {V0_round,
      V0_start_time,
      V0_action_list,
      V0_buff_play_list,
      V0_summon_play_list,
      V0_buff_list,
      V0_buff_play_list2,
      V0_fighter_status_list,
      V0_combat_result,
      V0_guide,
      V0_time,
      V0_fighter_changes,
      V0_summon_num,
      V0_use_item_num,
      V0_skill_cooldown_list,
      V0_skill_cooldown_list_pet,
      V0_backup_pets,
      V0_backup_childs}) ->
    D_a_t_a = <<V0_round:16/little, V0_start_time:32/little,
                (length(V0_action_list)):16/little,
                (list_to_binary([<<V1_order:8/little,
                                   (length(V1_sub_action_list)):16/little,
                                   (list_to_binary([<<V2_self_id:16/little,
                                                      V2_target_id:16/little,
                                                      V2_sub_order:8/little,
                                                      V2_skill_id:32/little,
                                                      V2_skill_lev:8/little,
                                                      V2_attack_type:8/little,
                                                      V2_action_type:8/little,
                                                      (length(V2_self_changes)):16/little,
                                                      (list_to_binary([<<V3_change_type:8/little,
                                                                         V3_change_val:32/signed-little,
                                                                         V3_other_val:32/signed-little>>
                                                                       || {V3_change_type,
                                                                           V3_change_val,
                                                                           V3_other_val}
                                                                              <- V2_self_changes]))/binary,
                                                      (length(V2_target_changes)):16/little,
                                                      (list_to_binary([<<V3_change_type:8/little,
                                                                         V3_change_val:32/signed-little,
                                                                         V3_other_val:32/signed-little>>
                                                                       || {V3_change_type,
                                                                           V3_change_val,
                                                                           V3_other_val}
                                                                              <- V2_target_changes]))/binary,
                                                      (length(V2_show_passive_skills)):16/little,
                                                      (list_to_binary([<<V3_id:16/little,
                                                                         V3_skill_id:32/little,
                                                                         V3_show_type:8/little>>
                                                                       || {V3_id,
                                                                           V3_skill_id,
                                                                           V3_show_type}
                                                                              <- V2_show_passive_skills]))/binary,
                                                      V2_is_hit:8/little,
                                                      V2_is_crit:8/little,
                                                      V2_is_defence:8/little,
                                                      V2_is_self_die:8/little,
                                                      V2_is_self_die_disappear:8/little,
                                                      V2_is_target_die:8/little,
                                                      V2_is_target_die_disappear:8/little,
                                                      (protocol:pack(string,
                                                                     V2_talk))/binary,
                                                      (protocol:pack(string,
                                                                     V2_action_msg))/binary>>
                                                    || #skill_play{self_id =
                                                                       V2_self_id,
                                                                   target_id =
                                                                       V2_target_id,
                                                                   sub_order =
                                                                       V2_sub_order,
                                                                   skill_id =
                                                                       V2_skill_id,
                                                                   skill_lev =
                                                                       V2_skill_lev,
                                                                   attack_type =
                                                                       V2_attack_type,
                                                                   action_type =
                                                                       V2_action_type,
                                                                   self_changes
                                                                       =
                                                                       V2_self_changes,
                                                                   target_changes
                                                                       =
                                                                       V2_target_changes,
                                                                   show_passive_skills
                                                                       =
                                                                       V2_show_passive_skills,
                                                                   is_hit =
                                                                       V2_is_hit,
                                                                   is_crit =
                                                                       V2_is_crit,
                                                                   is_defence =
                                                                       V2_is_defence,
                                                                   is_self_die =
                                                                       V2_is_self_die,
                                                                   is_self_die_disappear
                                                                       =
                                                                       V2_is_self_die_disappear,
                                                                   is_target_die
                                                                       =
                                                                       V2_is_target_die,
                                                                   is_target_die_disappear
                                                                       =
                                                                       V2_is_target_die_disappear,
                                                                   talk =
                                                                       V2_talk,
                                                                   action_msg =
                                                                       V2_action_msg}
                                                           <- V1_sub_action_list]))/binary>>
                                 || {V1_order, V1_sub_action_list}
                                        <- V0_action_list]))/binary,
                (length(V0_buff_play_list)):16/little,
                (list_to_binary([<<V1_order:8/little,
                                   V1_sub_order:8/little,
                                   V1_action_type:8/little,
                                   V1_buff_id:32/little, V1_layer:8/little,
                                   V1_duration:8/little,
                                   V1_duration_left:8/little,
                                   V1_is_hit:8/little, V1_can_dispel:8/little,
                                   V1_caster_id:16/little,
                                   V1_target_id:16/little,
                                   V1_skill_fid:16/little,
                                   (length(V1_target_changes)):16/little,
                                   (list_to_binary([<<V2_change_type:8/little,
                                                      V2_change_val:32/signed-little,
                                                      V2_other_val:32/signed-little>>
                                                    || {V2_change_type,
                                                        V2_change_val,
                                                        V2_other_val}
                                                           <- V1_target_changes]))/binary>>
                                 || #buff_play{order = V1_order,
                                               sub_order = V1_sub_order,
                                               action_type = V1_action_type,
                                               buff_id = V1_buff_id,
                                               layer = V1_layer,
                                               duration = V1_duration,
                                               duration_left = V1_duration_left,
                                               is_hit = V1_is_hit,
                                               can_dispel = V1_can_dispel,
                                               caster_id = V1_caster_id,
                                               target_id = V1_target_id,
                                               skill_fid = V1_skill_fid,
                                               target_changes =
                                                   V1_target_changes}
                                        <- V0_buff_play_list]))/binary,
                (length(V0_summon_play_list)):16/little,
                (list_to_binary([<<V1_order:8/little,
                                   V1_sub_order:8/little,
                                   V1_summon_type:8/little,
                                   V1_summoner_id:16/little,
                                   (length(V1_summons)):16/little,
                                   (list_to_binary([<<V2_id:16/little,
                                                      V2_group:8/little,
                                                      V2_type:8/little,
                                                      V2_rid:32/little,
                                                      (protocol:pack(string,
                                                                     V2_platform))/binary,
                                                      V2_zone_id:16/little,
                                                      V2_base_id:32/little,
                                                      V2_master_fid:16/little,
                                                      (protocol:pack(string,
                                                                     V2_name))/binary,
                                                      V2_sex:8/little,
                                                      V2_classes:8/little,
                                                      V2_lev:16/little,
                                                      V2_face_id:32/little,
                                                      V2_is_die:8/little,
                                                      V2_is_die_disappear:8/little,
                                                      V2_hp:32/signed-little,
                                                      V2_tmp_hp_max:32/signed-little,
                                                      V2_mp:32/signed-little,
                                                      V2_pos:8/little,
                                                      V2_order:8/little,
                                                      V2_fc:32/little,
                                                      V2_hp_max:32/signed-little,
                                                      V2_mp_max:32/signed-little,
                                                      (length(V2_looks)):16/little,
                                                      (list_to_binary([<<V3_looks_type:32/little,
                                                                         V3_looks_mode:32/little,
                                                                         V3_looks_val:32/little,
                                                                         (protocol:pack(string,
                                                                                        V3_looks_str))/binary>>
                                                                       || {V3_looks_type,
                                                                           V3_looks_mode,
                                                                           V3_looks_val,
                                                                           V3_looks_str}
                                                                              <- V2_looks]))/binary,
                                                      V2_model_id:32/little,
                                                      (length(V2_buff_infos)):16/little,
                                                      (list_to_binary([<<V3_buff_id:32/little,
                                                                         V3_layer:8/little,
                                                                         V3_duration:8/little,
                                                                         V3_duration_left:8/little,
                                                                         V3_can_dispel:8/little>>
                                                                       || {V3_buff_id,
                                                                           V3_layer,
                                                                           V3_duration,
                                                                           V3_duration_left,
                                                                           V3_can_dispel}
                                                                              <- V2_buff_infos]))/binary>>
                                                    || #fighter{id = V2_id,
                                                                group =
                                                                    V2_group,
                                                                type = V2_type,
                                                                rid = V2_rid,
                                                                platform =
                                                                    V2_platform,
                                                                zone_id =
                                                                    V2_zone_id,
                                                                base_id =
                                                                    V2_base_id,
                                                                master_fid =
                                                                    V2_master_fid,
                                                                name = V2_name,
                                                                sex = V2_sex,
                                                                classes =
                                                                    V2_classes,
                                                                lev = V2_lev,
                                                                face_id =
                                                                    V2_face_id,
                                                                is_die =
                                                                    V2_is_die,
                                                                is_die_disappear
                                                                    =
                                                                    V2_is_die_disappear,
                                                                hp = V2_hp,
                                                                tmp_hp_max =
                                                                    V2_tmp_hp_max,
                                                                mp = V2_mp,
                                                                pos = V2_pos,
                                                                order =
                                                                    V2_order,
                                                                attr =
                                                                    #attr{fc =
                                                                              V2_fc,
                                                                          hp_max
                                                                              =
                                                                              V2_hp_max,
                                                                          mp_max
                                                                              =
                                                                              V2_mp_max},
                                                                looks =
                                                                    V2_looks,
                                                                special_attr =
                                                                    #special_attr{model_id
                                                                                      =
                                                                                      V2_model_id},
                                                                buff_infos =
                                                                    V2_buff_infos}
                                                           <- V1_summons]))/binary>>
                                 || #summon_play{order = V1_order,
                                                 sub_order = V1_sub_order,
                                                 summon_type = V1_summon_type,
                                                 summoner_id = V1_summoner_id,
                                                 summons = V1_summons}
                                        <- V0_summon_play_list]))/binary,
                (length(V0_buff_list)):16/little,
                (list_to_binary([<<V1_fighter_id:16/little,
                                   (length(V1_buffs)):16/little,
                                   (list_to_binary([<<V2_id:32/little,
                                                      V2_layer:8/little,
                                                      V2_duration:8/little,
                                                      V2_duration_left:8/little>>
                                                    || #c_buff{id = V2_id,
                                                               layer = V2_layer,
                                                               duration =
                                                                   V2_duration,
                                                               duration_left =
                                                                   V2_duration_left}
                                                           <- V1_buffs]))/binary>>
                                 || {V1_fighter_id, V1_buffs}
                                        <- V0_buff_list]))/binary,
                (length(V0_buff_play_list2)):16/little,
                (list_to_binary([<<V1_order:8/little,
                                   V1_sub_order:8/little,
                                   V1_action_type:8/little,
                                   V1_buff_id:32/little, V1_layer:8/little,
                                   V1_duration:8/little,
                                   V1_duration_left:8/little,
                                   V1_is_hit:8/little, V1_can_dispel:8/little,
                                   V1_caster_id:16/little,
                                   V1_target_id:16/little,
                                   V1_skill_fid:16/little,
                                   (length(V1_target_changes)):16/little,
                                   (list_to_binary([<<V2_change_type:8/little,
                                                      V2_change_val:32/signed-little,
                                                      V2_other_val:32/signed-little>>
                                                    || {V2_change_type,
                                                        V2_change_val,
                                                        V2_other_val}
                                                           <- V1_target_changes]))/binary>>
                                 || #buff_play{order = V1_order,
                                               sub_order = V1_sub_order,
                                               action_type = V1_action_type,
                                               buff_id = V1_buff_id,
                                               layer = V1_layer,
                                               duration = V1_duration,
                                               duration_left = V1_duration_left,
                                               is_hit = V1_is_hit,
                                               can_dispel = V1_can_dispel,
                                               caster_id = V1_caster_id,
                                               target_id = V1_target_id,
                                               skill_fid = V1_skill_fid,
                                               target_changes =
                                                   V1_target_changes}
                                        <- V0_buff_play_list2]))/binary,
                (length(V0_fighter_status_list)):16/little,
                (list_to_binary([<<V1_id:16/little,
                                   V1_hp:32/signed-little,
                                   V1_tmp_hp_max:32/signed-little,
                                   V1_mp:32/signed-little,
                                   V1_hp_max:32/signed-little,
                                   V1_mp_max:32/signed-little,
                                   V1_is_die:8/little,
                                   V1_is_die_disappear:8/little,
                                   V1_pos:8/little, V1_order:8/little,
                                   V1_is_escape:8/little>>
                                 || {V1_id,
                                     V1_hp,
                                     V1_tmp_hp_max,
                                     V1_mp,
                                     V1_hp_max,
                                     V1_mp_max,
                                     V1_is_die,
                                     V1_is_die_disappear,
                                     V1_pos,
                                     V1_order,
                                     V1_is_escape}
                                        <- V0_fighter_status_list]))/binary,
                V0_combat_result:8/little, V0_guide:16/little,
                V0_time:8/little,
                (length(V0_fighter_changes)):16/little,
                (list_to_binary([<<V1_id:16/little,
                                   (length(V1_self_changes)):16/little,
                                   (list_to_binary([<<V2_change_type:8/little,
                                                      V2_change_val:32/signed-little,
                                                      V2_other_val:32/signed-little>>
                                                    || {V2_change_type,
                                                        V2_change_val,
                                                        V2_other_val}
                                                           <- V1_self_changes]))/binary>>
                                 || {V1_id, V1_self_changes}
                                        <- V0_fighter_changes]))/binary,
                V0_summon_num:8/little, V0_use_item_num:8/little,
                (length(V0_skill_cooldown_list)):16/little,
                (list_to_binary([<<V1_skill_id:32/little,
                                   V1_cd_left:16/little>>
                                 || {V1_skill_id, V1_cd_left}
                                        <- V0_skill_cooldown_list]))/binary,
                (length(V0_skill_cooldown_list_pet)):16/little,
                (list_to_binary([<<V1_skill_id:32/little,
                                   V1_cd_left:16/little>>
                                 || {V1_skill_id, V1_cd_left}
                                        <- V0_skill_cooldown_list_pet]))/binary,
                (length(V0_backup_pets)):16/little,
                (list_to_binary([<<V1_id:32/little,
                                   V1_base_id:32/little, V1_can_summon:8/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_lev:8/little>>
                                 || #c_pet{id = V1_id, base_id = V1_base_id,
                                           can_summon = V1_can_summon,
                                           name = V1_name, lev = V1_lev}
                                        <- V0_backup_pets]))/binary,
                (length(V0_backup_childs)):16/little,
                (list_to_binary([<<V1_id:32/little,
                                   V1_base_id:32/little, V1_can_summon:8/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_lev:8/little, V1_hungry:32/little>>
                                 || #c_child{id = V1_id, base_id = V1_base_id,
                                             can_summon = V1_can_summon,
                                             name = V1_name, lev = V1_lev,
                                             hungry = V1_hungry}
                                        <- V0_backup_childs]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10720:16/little,
       D_a_t_a/binary>>};
pack(cli, 10722, {}) ->
    {ok, <<2:32/little, 10722:16/little>>};
pack(srv, 10722, {V0_start_time, V0_fighter_changes}) ->
    D_a_t_a = <<V0_start_time:32/little,
                (length(V0_fighter_changes)):16/little,
                (list_to_binary([<<V1_id:16/little,
                                   (length(V1_self_changes)):16/little,
                                   (list_to_binary([<<V2_change_type:8/little,
                                                      V2_change_val:32/signed-little,
                                                      V2_other_val:32/signed-little>>
                                                    || {V2_change_type,
                                                        V2_change_val,
                                                        V2_other_val}
                                                           <- V1_self_changes]))/binary>>
                                 || {V1_id, V1_self_changes}
                                        <- V0_fighter_changes]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10722:16/little,
       D_a_t_a/binary>>};
pack(cli, 10723, {}) ->
    {ok, <<2:32/little, 10723:16/little>>};
pack(srv, 10723, {V0_start_time, V0_fighter_changes}) ->
    D_a_t_a = <<V0_start_time:32/little,
                (length(V0_fighter_changes)):16/little,
                (list_to_binary([<<V1_sid:16/little, V1_tid:16/little,
                                   (length(V1_self_changes)):16/little,
                                   (list_to_binary([<<V2_change_type:8/little,
                                                      V2_change_val:32/signed-little,
                                                      (protocol:pack(string,
                                                                     V2_other_val))/binary>>
                                                    || {V2_change_type,
                                                        V2_change_val,
                                                        V2_other_val}
                                                           <- V1_self_changes]))/binary>>
                                 || {V1_sid, V1_tid, V1_self_changes}
                                        <- V0_fighter_changes]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10723:16/little,
       D_a_t_a/binary>>};
pack(cli, 10731, {V0_round}) ->
    D_a_t_a = <<V0_round:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10731:16/little,
       D_a_t_a/binary>>};
pack(srv, 10731, {V0_msg}) ->
    D_a_t_a = <<(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10731:16/little,
       D_a_t_a/binary>>};
pack(cli, 10732,
     {V0_skill_id, V0_target_id, V0_other_id}) ->
    D_a_t_a = <<V0_skill_id:32/little,
                V0_target_id:16/little, V0_other_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10732:16/little,
       D_a_t_a/binary>>};
pack(srv, 10732, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10732:16/little,
       D_a_t_a/binary>>};
pack(cli, 10733, {}) ->
    {ok, <<2:32/little, 10733:16/little>>};
pack(srv, 10733,
     {V0_id,
      V0_result,
      V0_target_id,
      V0_skill_id,
      V0_skill_lev}) ->
    D_a_t_a = <<V0_id:16/little, V0_result:8/little,
                V0_target_id:16/little, V0_skill_id:32/little,
                V0_skill_lev:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10733:16/little,
       D_a_t_a/binary>>};
pack(cli, 10734,
     {V0_skill_id, V0_target_id, V0_other_id}) ->
    D_a_t_a = <<V0_skill_id:32/little,
                V0_target_id:16/little, V0_other_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10734:16/little,
       D_a_t_a/binary>>};
pack(srv, 10734, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10734:16/little,
       D_a_t_a/binary>>};
pack(cli, 10735, {}) ->
    {ok, <<2:32/little, 10735:16/little>>};
pack(srv, 10735, {V0_id, V0_result}) ->
    D_a_t_a = <<V0_id:16/little, V0_result:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10735:16/little,
       D_a_t_a/binary>>};
pack(cli, 10740, {V0_flag}) ->
    D_a_t_a = <<V0_flag:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10740:16/little,
       D_a_t_a/binary>>};
pack(srv, 10740, {V0_flag, V0_result, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little, V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10740:16/little,
       D_a_t_a/binary>>};
pack(cli, 10741, {V0_target_id, V0_preside_type}) ->
    D_a_t_a = <<V0_target_id:16/little,
                V0_preside_type:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10741:16/little,
       D_a_t_a/binary>>};
pack(srv, 10741, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10741:16/little,
       D_a_t_a/binary>>};
pack(cli, 10742, {}) ->
    {ok, <<2:32/little, 10742:16/little>>};
pack(srv, 10742,
     {V0_self_preside, V0_target_preside}) ->
    D_a_t_a = <<(length(V0_self_preside)):16/little,
                (list_to_binary([<<V1_flag1:8/little,
                                   (protocol:pack(string, V1_text2))/binary>>
                                 || {V1_flag1, V1_text2}
                                        <- V0_self_preside]))/binary,
                (length(V0_target_preside)):16/little,
                (list_to_binary([<<V1_flag2:8/little,
                                   (protocol:pack(string, V1_text2))/binary>>
                                 || {V1_flag2, V1_text2}
                                        <- V0_target_preside]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10742:16/little,
       D_a_t_a/binary>>};
pack(cli, 10743, {V0_type, V0_flag, V0_text}) ->
    D_a_t_a = <<V0_type:8/little, V0_flag:8/little,
                (protocol:pack(string, V0_text))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10743:16/little,
       D_a_t_a/binary>>};
pack(srv, 10743, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10743:16/little,
       D_a_t_a/binary>>};
pack(cli, 10744,
     {V0_type, V0_rec_id, V0_platform, V0_zone_id}) ->
    D_a_t_a = <<V0_type:8/little, V0_rec_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10744:16/little,
       D_a_t_a/binary>>};
pack(srv, 10744, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10744:16/little,
       D_a_t_a/binary>>};
pack(cli, 10745, {}) ->
    {ok, <<2:32/little, 10745:16/little>>};
pack(srv, 10745, {}) ->
    {ok, <<2:32/little, 10745:16/little>>};
pack(cli, 10746, {}) ->
    {ok, <<2:32/little, 10746:16/little>>};
pack(srv, 10746, {}) ->
    {ok, <<2:32/little, 10746:16/little>>};
pack(cli, 10747, {}) ->
    {ok, <<2:32/little, 10747:16/little>>};
pack(srv, 10747, {V0_list}) ->
    D_a_t_a = <<(length(V0_list)):16/little,
                (list_to_binary([<<V1_likable:8/little,
                                   V1_type:8/little, V1_rec_id:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:16/little,
                                   V1_combat_type:8/little,
                                   (protocol:pack(string, V1_atk_name))/binary,
                                   (protocol:pack(string, V1_dfd_name))/binary,
                                   V1_atk_sex:8/little, V1_atk_classes:8/little,
                                   V1_dfd_sex:8/little, V1_dfd_classes:8/little,
                                   V1_time:32/little, V1_liked:32/little,
                                   V1_replayed:32/little, V1_shared:32/little,
                                   V1_round:32/little, V1_avg_lev:32/little>>
                                 || {V1_likable,
                                     #combat_record{id =
                                                        {V1_type,
                                                         {V1_rec_id,
                                                          V1_platform,
                                                          V1_zone_id}},
                                                    combat_type =
                                                        V1_combat_type,
                                                    atk_name = V1_atk_name,
                                                    dfd_name = V1_dfd_name,
                                                    atk_sex = V1_atk_sex,
                                                    atk_classes =
                                                        V1_atk_classes,
                                                    dfd_sex = V1_dfd_sex,
                                                    dfd_classes =
                                                        V1_dfd_classes,
                                                    time = V1_time,
                                                    liked = V1_liked,
                                                    replayed = V1_replayed,
                                                    shared = V1_shared,
                                                    round = V1_round,
                                                    avg_lev = V1_avg_lev}}
                                        <- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10747:16/little,
       D_a_t_a/binary>>};
pack(cli, 10748, {}) ->
    {ok, <<2:32/little, 10748:16/little>>};
pack(srv, 10748, {V0_list}) ->
    D_a_t_a = <<(length(V0_list)):16/little,
                (list_to_binary([<<V1_likable:8/little,
                                   V1_type:8/little, V1_rec_id:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:16/little,
                                   V1_combat_type:8/little,
                                   (protocol:pack(string, V1_atk_name))/binary,
                                   (protocol:pack(string, V1_dfd_name))/binary,
                                   V1_atk_sex:8/little, V1_atk_classes:8/little,
                                   V1_dfd_sex:8/little, V1_dfd_classes:8/little,
                                   V1_time:32/little, V1_liked:32/little,
                                   V1_replayed:32/little, V1_shared:32/little,
                                   V1_round:32/little, V1_avg_lev:32/little>>
                                 || {V1_likable,
                                     #combat_record{id =
                                                        {V1_type,
                                                         {V1_rec_id,
                                                          V1_platform,
                                                          V1_zone_id}},
                                                    combat_type =
                                                        V1_combat_type,
                                                    atk_name = V1_atk_name,
                                                    dfd_name = V1_dfd_name,
                                                    atk_sex = V1_atk_sex,
                                                    atk_classes =
                                                        V1_atk_classes,
                                                    dfd_sex = V1_dfd_sex,
                                                    dfd_classes =
                                                        V1_dfd_classes,
                                                    time = V1_time,
                                                    liked = V1_liked,
                                                    replayed = V1_replayed,
                                                    shared = V1_shared,
                                                    round = V1_round,
                                                    avg_lev = V1_avg_lev}}
                                        <- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10748:16/little,
       D_a_t_a/binary>>};
pack(cli, 10749, {}) ->
    {ok, <<2:32/little, 10749:16/little>>};
pack(srv, 10749, {V0_list}) ->
    D_a_t_a = <<(length(V0_list)):16/little,
                (list_to_binary([<<V1_likable:8/little,
                                   V1_type:8/little, V1_rec_id:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:16/little,
                                   V1_combat_type:8/little,
                                   (protocol:pack(string, V1_atk_name))/binary,
                                   (protocol:pack(string, V1_dfd_name))/binary,
                                   V1_atk_sex:8/little, V1_atk_classes:8/little,
                                   V1_dfd_sex:8/little, V1_dfd_classes:8/little,
                                   V1_time:32/little, V1_liked:32/little,
                                   V1_replayed:32/little, V1_shared:32/little,
                                   V1_round:32/little, V1_avg_lev:32/little>>
                                 || {V1_likable,
                                     #combat_record{id =
                                                        {V1_type,
                                                         {V1_rec_id,
                                                          V1_platform,
                                                          V1_zone_id}},
                                                    combat_type =
                                                        V1_combat_type,
                                                    atk_name = V1_atk_name,
                                                    dfd_name = V1_dfd_name,
                                                    atk_sex = V1_atk_sex,
                                                    atk_classes =
                                                        V1_atk_classes,
                                                    dfd_sex = V1_dfd_sex,
                                                    dfd_classes =
                                                        V1_dfd_classes,
                                                    time = V1_time,
                                                    liked = V1_liked,
                                                    replayed = V1_replayed,
                                                    shared = V1_shared,
                                                    round = V1_round,
                                                    avg_lev = V1_avg_lev}}
                                        <- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10749:16/little,
       D_a_t_a/binary>>};
pack(cli, 10750,
     {V0_type, V0_id, V0_platform, V0_zone_id}) ->
    D_a_t_a = <<V0_type:8/little, V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10750:16/little,
       D_a_t_a/binary>>};
pack(srv, 10750, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10750:16/little,
       D_a_t_a/binary>>};
pack(cli, 10751,
     {V0_type, V0_id, V0_platform, V0_zone_id}) ->
    D_a_t_a = <<V0_type:8/little, V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10751:16/little,
       D_a_t_a/binary>>};
pack(srv, 10751, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10751:16/little,
       D_a_t_a/binary>>};
pack(cli, 10752,
     {V0_type, V0_id, V0_platform, V0_zone_id}) ->
    D_a_t_a = <<V0_type:8/little, V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10752:16/little,
       D_a_t_a/binary>>};
pack(srv, 10752, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10752:16/little,
       D_a_t_a/binary>>};
pack(cli, 10753,
     {V0_type, V0_id, V0_platform, V0_zone_id}) ->
    D_a_t_a = <<V0_type:8/little, V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10753:16/little,
       D_a_t_a/binary>>};
pack(srv, 10753,
     {V0_likable,
      #combat_record{id =
                         {V0_type, {V0_rec_id, V0_platform, V0_zone_id}},
                     combat_type = V0_combat_type, atk_name = V0_atk_name,
                     dfd_name = V0_dfd_name, atk_sex = V0_atk_sex,
                     atk_classes = V0_atk_classes, dfd_sex = V0_dfd_sex,
                     dfd_classes = V0_dfd_classes, time = V0_time,
                     liked = V0_liked, replayed = V0_replayed,
                     shared = V0_shared, round = V0_round,
                     avg_lev = V0_avg_lev, fighters = V0_fighters}}) ->
    D_a_t_a = <<V0_likable:8/little, V0_type:8/little,
                V0_rec_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little, V0_combat_type:8/little,
                (protocol:pack(string, V0_atk_name))/binary,
                (protocol:pack(string, V0_dfd_name))/binary,
                V0_atk_sex:8/little, V0_atk_classes:8/little,
                V0_dfd_sex:8/little, V0_dfd_classes:8/little,
                V0_time:32/little, V0_liked:32/little,
                V0_replayed:32/little, V0_shared:32/little,
                V0_round:32/little, V0_avg_lev:32/little,
                (length(V0_fighters)):16/little,
                (list_to_binary([<<V1_rid:32/little,
                                   (protocol:pack(string,
                                                  V1_r_platform))/binary,
                                   V1_r_zone_id:16/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_sex:8/little, V1_classes:8/little,
                                   V1_lev:16/little, V1_group:8/little>>
                                 || #combat_record_fighter{id =
                                                               {V1_rid,
                                                                V1_r_platform,
                                                                V1_r_zone_id},
                                                           name = V1_name,
                                                           sex = V1_sex,
                                                           classes = V1_classes,
                                                           lev = V1_lev,
                                                           group = V1_group}
                                        <- V0_fighters]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10753:16/little,
       D_a_t_a/binary>>};
pack(cli, 10754, {V0_rank_type}) ->
    D_a_t_a = <<V0_rank_type:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10754:16/little,
       D_a_t_a/binary>>};
pack(srv, 10754, {V0_rank_type, V0_list}) ->
    D_a_t_a = <<V0_rank_type:8/little,
                (length(V0_list)):16/little,
                (list_to_binary([<<V1_likable:8/little,
                                   V1_type:8/little, V1_rec_id:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:16/little,
                                   V1_combat_type:8/little,
                                   (protocol:pack(string, V1_atk_name))/binary,
                                   (protocol:pack(string, V1_dfd_name))/binary,
                                   V1_atk_sex:8/little, V1_atk_classes:8/little,
                                   V1_dfd_sex:8/little, V1_dfd_classes:8/little,
                                   V1_time:32/little, V1_liked:32/little,
                                   V1_replayed:32/little, V1_shared:32/little,
                                   V1_round:32/little, V1_avg_lev:32/little>>
                                 || {V1_likable,
                                     #combat_record{id =
                                                        {V1_type,
                                                         {V1_rec_id,
                                                          V1_platform,
                                                          V1_zone_id}},
                                                    combat_type =
                                                        V1_combat_type,
                                                    atk_name = V1_atk_name,
                                                    dfd_name = V1_dfd_name,
                                                    atk_sex = V1_atk_sex,
                                                    atk_classes =
                                                        V1_atk_classes,
                                                    dfd_sex = V1_dfd_sex,
                                                    dfd_classes =
                                                        V1_dfd_classes,
                                                    time = V1_time,
                                                    liked = V1_liked,
                                                    replayed = V1_replayed,
                                                    shared = V1_shared,
                                                    round = V1_round,
                                                    avg_lev = V1_avg_lev}}
                                        <- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10754:16/little,
       D_a_t_a/binary>>};
pack(cli, 10755, {V0_type}) ->
    D_a_t_a = <<V0_type:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10755:16/little,
       D_a_t_a/binary>>};
pack(srv, 10755, {V0_list}) ->
    D_a_t_a = <<(length(V0_list)):16/little,
                (list_to_binary([<<V1_likable:8/little,
                                   V1_type:8/little, V1_rec_id:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:16/little,
                                   V1_combat_type:8/little,
                                   (protocol:pack(string, V1_atk_name))/binary,
                                   (protocol:pack(string, V1_dfd_name))/binary,
                                   V1_atk_sex:8/little, V1_atk_classes:8/little,
                                   V1_dfd_sex:8/little, V1_dfd_classes:8/little,
                                   V1_time:32/little, V1_liked:32/little,
                                   V1_replayed:32/little, V1_shared:32/little,
                                   V1_round:32/little, V1_avg_lev:32/little>>
                                 || {V1_likable,
                                     #combat_record{id =
                                                        {V1_type,
                                                         {V1_rec_id,
                                                          V1_platform,
                                                          V1_zone_id}},
                                                    combat_type =
                                                        V1_combat_type,
                                                    atk_name = V1_atk_name,
                                                    dfd_name = V1_dfd_name,
                                                    atk_sex = V1_atk_sex,
                                                    atk_classes =
                                                        V1_atk_classes,
                                                    dfd_sex = V1_dfd_sex,
                                                    dfd_classes =
                                                        V1_dfd_classes,
                                                    time = V1_time,
                                                    liked = V1_liked,
                                                    replayed = V1_replayed,
                                                    shared = V1_shared,
                                                    round = V1_round,
                                                    avg_lev = V1_avg_lev}}
                                        <- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10755:16/little,
       D_a_t_a/binary>>};
pack(cli, 10756,
     {V0_type, V0_rec_id, V0_platform, V0_zone_id}) ->
    D_a_t_a = <<V0_type:8/little, V0_rec_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10756:16/little,
       D_a_t_a/binary>>};
pack(srv, 10756, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10756:16/little,
       D_a_t_a/binary>>};
pack(cli, 10757, {}) ->
    {ok, <<2:32/little, 10757:16/little>>};
pack(srv, 10757, {V0_online, V0_liked}) ->
    D_a_t_a = <<V0_online:32/little, V0_liked:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10757:16/little,
       D_a_t_a/binary>>};
pack(cli, 10758, {V0_combat_type}) ->
    D_a_t_a = <<V0_combat_type:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10758:16/little,
       D_a_t_a/binary>>};
pack(srv, 10758, {V0_combat_type, V0_list}) ->
    D_a_t_a = <<V0_combat_type:32/little,
                (length(V0_list)):16/little,
                (list_to_binary([<<V1_likable:8/little,
                                   V1_type:8/little, V1_rec_id:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:16/little,
                                   V1_combat_type:32/little,
                                   (protocol:pack(string, V1_atk_name))/binary,
                                   (protocol:pack(string, V1_dfd_name))/binary,
                                   V1_atk_sex:8/little, V1_atk_classes:8/little,
                                   V1_dfd_sex:8/little, V1_dfd_classes:8/little,
                                   V1_time:32/little, V1_liked:32/little,
                                   V1_replayed:32/little, V1_shared:32/little,
                                   V1_round:32/little, V1_avg_lev:32/little>>
                                 || {V1_likable,
                                     #combat_record{id =
                                                        {V1_type,
                                                         {V1_rec_id,
                                                          V1_platform,
                                                          V1_zone_id}},
                                                    combat_type =
                                                        V1_combat_type,
                                                    atk_name = V1_atk_name,
                                                    dfd_name = V1_dfd_name,
                                                    atk_sex = V1_atk_sex,
                                                    atk_classes =
                                                        V1_atk_classes,
                                                    dfd_sex = V1_dfd_sex,
                                                    dfd_classes =
                                                        V1_dfd_classes,
                                                    time = V1_time,
                                                    liked = V1_liked,
                                                    replayed = V1_replayed,
                                                    shared = V1_shared,
                                                    round = V1_round,
                                                    avg_lev = V1_avg_lev}}
                                        <- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10758:16/little,
       D_a_t_a/binary>>};
pack(cli, 10759, {}) ->
    {ok, <<2:32/little, 10759:16/little>>};
pack(srv, 10759, {V0_list}) ->
    D_a_t_a = <<(length(V0_list)):16/little,
                (list_to_binary([<<V1_combat_tyeo:32/little,
                                   V1_val:32/little>>
                                 || {V1_combat_tyeo, V1_val}
                                        <- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10759:16/little,
       D_a_t_a/binary>>};
pack(cli, 10760, {V0_rid, V0_platform, V0_zone_id}) ->
    D_a_t_a = <<V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10760:16/little,
       D_a_t_a/binary>>};
pack(srv, 10760, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10760:16/little,
       D_a_t_a/binary>>};
pack(cli, 10761, {}) ->
    {ok, <<2:32/little, 10761:16/little>>};
pack(srv, 10761,
     {{V0_rid, V0_platform, V0_zone_id},
      V0_name,
      V0_type}) ->
    D_a_t_a = <<V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little,
                (protocol:pack(string, V0_name))/binary,
                V0_type:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10761:16/little,
       D_a_t_a/binary>>};
pack(cli, 10762,
     {V0_rid, V0_platform, V0_zone_id, V0_flag, V0_type}) ->
    D_a_t_a = <<V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little, V0_flag:8/little,
                V0_type:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10762:16/little,
       D_a_t_a/binary>>};
pack(srv, 10762, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10762:16/little,
       D_a_t_a/binary>>};
pack(cli, 10763, {}) ->
    {ok, <<2:32/little, 10763:16/little>>};
pack(srv, 10763, {V0_valid_plan, V0_plan_data}) ->
    D_a_t_a = <<V0_valid_plan:8/little,
                (length(V0_plan_data)):16/little,
                (list_to_binary([<<V1_index:8/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   (length(V1_skill_plan)):16/little,
                                   (list_to_binary([<<V2_skill_index:8/little,
                                                      V2_skill_id:32/little>>
                                                    || {V2_skill_index,
                                                        V2_skill_id}
                                                           <- V1_skill_plan]))/binary>>
                                 || #hook_setting{index = V1_index,
                                                  name = V1_name,
                                                  skill_plan = V1_skill_plan}
                                        <- V0_plan_data]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10763:16/little,
       D_a_t_a/binary>>};
pack(cli, 10764, {V0_index, V0_skill_plan}) ->
    D_a_t_a = <<V0_index:8/little,
                (length(V0_skill_plan)):16/little,
                (list_to_binary([<<V1_skill_index:8/little,
                                   V1_skill_id:32/little>>
                                 || {V1_skill_index, V1_skill_id}
                                        <- V0_skill_plan]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10764:16/little,
       D_a_t_a/binary>>};
pack(srv, 10764, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10764:16/little,
       D_a_t_a/binary>>};
pack(cli, 10765, {V0_skill_id}) ->
    D_a_t_a = <<V0_skill_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10765:16/little,
       D_a_t_a/binary>>};
pack(srv, 10765, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10765:16/little,
       D_a_t_a/binary>>};
pack(cli, 10766, {V0_index}) ->
    D_a_t_a = <<V0_index:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10766:16/little,
       D_a_t_a/binary>>};
pack(srv, 10766, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10766:16/little,
       D_a_t_a/binary>>};
pack(cli, 10767, {}) ->
    {ok, <<2:32/little, 10767:16/little>>};
pack(srv, 10767, {V0_skill_id}) ->
    D_a_t_a = <<V0_skill_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10767:16/little,
       D_a_t_a/binary>>};
pack(cli, 10768, {V0_index, V0_name}) ->
    D_a_t_a = <<V0_index:8/little,
                (protocol:pack(string, V0_name))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10768:16/little,
       D_a_t_a/binary>>};
pack(srv, 10768, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10768:16/little,
       D_a_t_a/binary>>};
pack(cli, 10769,
     {V0_type,
      V0_rec_id,
      V0_platform,
      V0_zone_id,
      V0_round,
      V0_msg}) ->
    D_a_t_a = <<V0_type:8/little, V0_rec_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little, V0_round:32/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10769:16/little,
       D_a_t_a/binary>>};
pack(srv, 10769, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10769:16/little,
       D_a_t_a/binary>>};
pack(cli, 10770, {}) ->
    {ok, <<2:32/little, 10770:16/little>>};
pack(srv, 10770, {V0_combat_record_chat_mgr}) ->
    D_a_t_a =
        <<(length(V0_combat_record_chat_mgr)):16/little,
          (list_to_binary([<<V1_rid:32/little,
                             (protocol:pack(string, V1_platform))/binary,
                             V1_zone_id:32/little,
                             (protocol:pack(string, V1_name))/binary,
                             V1_classes:8/little, V1_lev:16/little,
                             V1_sex:8/little, V1_break_times:8/little,
                             (protocol:pack(string, V1_msg))/binary>>
                           || #combat_record_chat_mgr{id =
                                                          {V1_rid,
                                                           V1_platform,
                                                           V1_zone_id},
                                                      name = V1_name,
                                                      classes = V1_classes,
                                                      lev = V1_lev,
                                                      sex = V1_sex,
                                                      break_times =
                                                          V1_break_times,
                                                      msg = V1_msg}
                                  <- V0_combat_record_chat_mgr]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10770:16/little,
       D_a_t_a/binary>>};
pack(cli, 10771,
     {V0_skill_id, V0_target_id, V0_other_id}) ->
    D_a_t_a = <<V0_skill_id:32/little,
                V0_target_id:16/little, V0_other_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10771:16/little,
       D_a_t_a/binary>>};
pack(srv, 10771, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10771:16/little,
       D_a_t_a/binary>>};
pack(cli, 10772, {}) ->
    {ok, <<2:32/little, 10772:16/little>>};
pack(srv, 10772, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10772:16/little,
       D_a_t_a/binary>>};
pack(cli, 10773,
     {V0_skill_id, V0_target_id, V0_other_id}) ->
    D_a_t_a = <<V0_skill_id:32/little,
                V0_target_id:16/little, V0_other_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10773:16/little,
       D_a_t_a/binary>>};
pack(srv, 10773, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10773:16/little,
       D_a_t_a/binary>>};
pack(cli, 10774, {}) ->
    {ok, <<2:32/little, 10774:16/little>>};
pack(srv, 10774, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10774:16/little,
       D_a_t_a/binary>>};
pack(cli, 10775, {}) ->
    {ok, <<2:32/little, 10775:16/little>>};
pack(srv, 10775, {V0_help_combat_info, V0_round}) ->
    D_a_t_a = <<(length(V0_help_combat_info)):16/little,
                (list_to_binary([<<V1_skill_id:32/little,
                                   V1_times:32/little,
                                   V1_skill_status:8/little>>
                                 || {V1_skill_id, V1_times, V1_skill_status}
                                        <- V0_help_combat_info]))/binary,
                V0_round:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10775:16/little,
       D_a_t_a/binary>>};
pack(cli, 10776, {}) ->
    {ok, <<2:32/little, 10776:16/little>>};
pack(srv, 10776, {V0_observer_skill_cd}) ->
    D_a_t_a = <<(length(V0_observer_skill_cd)):16/little,
                (list_to_binary([<<V1_skill_id:32/little,
                                   V1_skill_status:8/little>>
                                 || {V1_skill_id, V1_skill_status}
                                        <- V0_observer_skill_cd]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10776:16/little,
       D_a_t_a/binary>>};
pack(cli, 10777, {V0_skill_id}) ->
    D_a_t_a = <<V0_skill_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10777:16/little,
       D_a_t_a/binary>>};
pack(srv, 10777, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10777:16/little,
       D_a_t_a/binary>>};
pack(cli, 10778, {}) ->
    {ok, <<2:32/little, 10778:16/little>>};
pack(srv, 10778, {V0_reward}) ->
    D_a_t_a = <<(length(V0_reward)):16/little,
                (list_to_binary([<<V1_reward_id:32/little,
                                   V1_id:32/little, V1_type:32/little,
                                   V1_end_time:32/little>>
                                 || {V1_reward_id, V1_id, V1_type, V1_end_time}
                                        <- V0_reward]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10778:16/little,
       D_a_t_a/binary>>};
pack(cli, 10779, {V0_combat_type, V0_reward_id}) ->
    D_a_t_a = <<V0_combat_type:32/little,
                V0_reward_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10779:16/little,
       D_a_t_a/binary>>};
pack(srv, 10779, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10779:16/little,
       D_a_t_a/binary>>};
pack(cli, 10780, {}) ->
    {ok, <<2:32/little, 10780:16/little>>};
pack(srv, 10780, {V0_end_time}) ->
    D_a_t_a = <<V0_end_time:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10780:16/little,
       D_a_t_a/binary>>};
pack(cli, 10789, {}) ->
    {ok, <<2:32/little, 10789:16/little>>};
pack(srv, 10789, {V0_result}) ->
    D_a_t_a = <<V0_result:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10789:16/little,
       D_a_t_a/binary>>};
pack(cli, 10790, {}) ->
    {ok, <<2:32/little, 10790:16/little>>};
pack(srv, 10790, {V0_result, V0_msg, V0_gl_list}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary,
                (length(V0_gl_list)):16/little,
                (list_to_binary([<<V1_base_id:32/little,
                                   V1_val:32/little>>
                                 || {V1_base_id, V1_val}
                                        <- V0_gl_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10790:16/little,
       D_a_t_a/binary>>};
pack(_Type, Code, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
             binary()) -> {ok, tuple()} |
                          {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(srv, 10705, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {ok, {V1_rid, V1_platform, V1_zone_id}};
unpack(cli, 10705, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 10706, _B0) -> {ok, {}};
unpack(cli, 10706, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 10707, _B0) ->
    {V1_battle_id, _B1} = protocol:uint32(_B0),
    {V1_id, _B2} = protocol:uint32(_B1),
    {ok, {V1_battle_id, V1_id}};
unpack(cli, 10707, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 10710, _B0) -> {ok, {}};
unpack(cli, 10710, _B0) ->
    {V1_combat_type, _B1} = protocol:uint8(_B0),
    {V1_enter_type, _B2} = protocol:uint8(_B1),
    {V1_enter_view, _B3} = protocol:uint8(_B2),
    {V1_start_time, _B4} = protocol:uint32(_B3),
    {V1_atk_formation, _B5} = protocol:uint8(_B4),
    {V1_atk_formation_lev, _B6} = protocol:uint8(_B5),
    {V1_dfd_formation, _B7} = protocol:uint8(_B6),
    {V1_dfd_formation_lev, _B8} = protocol:uint8(_B7),
    {V1_round, _B9} = protocol:uint16(_B8),
    {V1_guide, _B10} = protocol:uint16(_B9),
    {V1_status, _B11} = protocol:uint8(_B10),
    {V1_wait_time, _B12} = protocol:uint8(_B11),
    {V1_time, _B13} = protocol:uint8(_B12),
    {V1_fighter_list, _B61} = protocol:array(_B13,
                                             fun (_B14) ->
                                                     {V2_id, _B15} =
                                                         protocol:uint16(_B14),
                                                     {V2_group, _B16} =
                                                         protocol:uint8(_B15),
                                                     {V2_type, _B17} =
                                                         protocol:uint8(_B16),
                                                     {V2_rid, _B18} =
                                                         protocol:uint32(_B17),
                                                     {V2_platform, _B19} =
                                                         protocol:string(_B18),
                                                     {V2_zone_id, _B20} =
                                                         protocol:uint16(_B19),
                                                     {V2_base_id, _B21} =
                                                         protocol:uint32(_B20),
                                                     {V2_master_fid, _B22} =
                                                         protocol:uint16(_B21),
                                                     {V2_name, _B23} =
                                                         protocol:string(_B22),
                                                     {V2_sex, _B24} =
                                                         protocol:uint8(_B23),
                                                     {V2_classes, _B25} =
                                                         protocol:uint8(_B24),
                                                     {V2_lev, _B26} =
                                                         protocol:uint16(_B25),
                                                     {V2_face_id, _B27} =
                                                         protocol:uint32(_B26),
                                                     {V2_is_die, _B28} =
                                                         protocol:uint8(_B27),
                                                     {V2_is_die_disappear,
                                                      _B29} =
                                                         protocol:uint8(_B28),
                                                     {V2_hp, _B30} =
                                                         protocol:int32(_B29),
                                                     {V2_tmp_hp_max, _B31} =
                                                         protocol:int32(_B30),
                                                     {V2_mp, _B32} =
                                                         protocol:int32(_B31),
                                                     {V2_pos, _B33} =
                                                         protocol:uint8(_B32),
                                                     {V2_order, _B34} =
                                                         protocol:uint8(_B33),
                                                     {V2_self_preside_status,
                                                      _B35} =
                                                         protocol:uint8(_B34),
                                                     {V2_self_preside_text,
                                                      _B36} =
                                                         protocol:string(_B35),
                                                     {V2_target_preside_status,
                                                      _B37} =
                                                         protocol:uint8(_B36),
                                                     {V2_target_preside_text,
                                                      _B38} =
                                                         protocol:string(_B37),
                                                     {V2_is_auto, _B39} =
                                                         protocol:uint8(_B38),
                                                     {V2_is_hosted, _B40} =
                                                         protocol:uint8(_B39),
                                                     {V2_fc, _B41} =
                                                         protocol:uint32(_B40),
                                                     {V2_hp_max, _B42} =
                                                         protocol:int32(_B41),
                                                     {V2_mp_max, _B43} =
                                                         protocol:int32(_B42),
                                                     {V2_model_id, _B44} =
                                                         protocol:uint32(_B43),
                                                     {V2_looks, _B51} =
                                                         protocol:array(_B44,
                                                                        fun
                                                                            (_B45) ->
                                                                                {V3_looks_type,
                                                                                 _B46} =
                                                                                    protocol:uint32(_B45),
                                                                                {V3_looks_mode,
                                                                                 _B47} =
                                                                                    protocol:uint32(_B46),
                                                                                {V3_looks_val,
                                                                                 _B48} =
                                                                                    protocol:uint32(_B47),
                                                                                {V3_looks_str,
                                                                                 _B49} =
                                                                                    protocol:string(_B48),
                                                                                {{V3_looks_type,
                                                                                  V3_looks_mode,
                                                                                  V3_looks_val,
                                                                                  V3_looks_str},
                                                                                 _B49}
                                                                        end),
                                                     {V2_buff_infos, _B59} =
                                                         protocol:array(_B51,
                                                                        fun
                                                                            (_B52) ->
                                                                                {V3_buff_id,
                                                                                 _B53} =
                                                                                    protocol:uint32(_B52),
                                                                                {V3_layer,
                                                                                 _B54} =
                                                                                    protocol:uint8(_B53),
                                                                                {V3_duration,
                                                                                 _B55} =
                                                                                    protocol:uint8(_B54),
                                                                                {V3_duration_left,
                                                                                 _B56} =
                                                                                    protocol:uint8(_B55),
                                                                                {V3_can_dispel,
                                                                                 _B57} =
                                                                                    protocol:uint8(_B56),
                                                                                {{V3_buff_id,
                                                                                  V3_layer,
                                                                                  V3_duration,
                                                                                  V3_duration_left,
                                                                                  V3_can_dispel},
                                                                                 _B57}
                                                                        end),
                                                     {{V2_id,
                                                       V2_group,
                                                       V2_type,
                                                       V2_rid,
                                                       V2_platform,
                                                       V2_zone_id,
                                                       V2_base_id,
                                                       V2_master_fid,
                                                       V2_name,
                                                       V2_sex,
                                                       V2_classes,
                                                       V2_lev,
                                                       V2_face_id,
                                                       V2_is_die,
                                                       V2_is_die_disappear,
                                                       V2_hp,
                                                       V2_tmp_hp_max,
                                                       V2_mp,
                                                       V2_pos,
                                                       V2_order,
                                                       V2_self_preside_status,
                                                       V2_self_preside_text,
                                                       V2_target_preside_status,
                                                       V2_target_preside_text,
                                                       V2_is_auto,
                                                       V2_is_hosted,
                                                       V2_fc,
                                                       V2_hp_max,
                                                       V2_mp_max,
                                                       V2_model_id,
                                                       V2_looks,
                                                       V2_buff_infos},
                                                      _B59}
                                             end),
    {V1_summon_num, _B62} = protocol:uint8(_B61),
    {V1_use_item_num, _B63} = protocol:uint8(_B62),
    {V1_anger, _B64} = protocol:uint16(_B63),
    {V1_use_anger_ratio, _B65} = protocol:uint16(_B64),
    {V1_skill_infos, _B74} = protocol:array(_B65,
                                            fun (_B66) ->
                                                    {V2_skill_type_1, _B67} =
                                                        protocol:uint8(_B66),
                                                    {V2_skill_data_1, _B72} =
                                                        protocol:array(_B67,
                                                                       fun
                                                                           (_B68) ->
                                                                               {V3_skill_id_1,
                                                                                _B69} =
                                                                                   protocol:uint32(_B68),
                                                                               {V3_skill_lev_1,
                                                                                _B70} =
                                                                                   protocol:uint8(_B69),
                                                                               {{V3_skill_id_1,
                                                                                 V3_skill_lev_1},
                                                                                _B70}
                                                                       end),
                                                    {{V2_skill_type_1,
                                                      V2_skill_data_1},
                                                     _B72}
                                            end),
    {V1_pet_skill_infos, _B87} = protocol:array(_B74,
                                                fun (_B75) ->
                                                        {V2_pet_id, _B76} =
                                                            protocol:uint32(_B75),
                                                        {V2_pet_skill_infos,
                                                         _B85} =
                                                            protocol:array(_B76,
                                                                           fun
                                                                               (_B77) ->
                                                                                   {V3_skill_type_2,
                                                                                    _B78} =
                                                                                       protocol:uint8(_B77),
                                                                                   {V3_skill_data_2,
                                                                                    _B83} =
                                                                                       protocol:array(_B78,
                                                                                                      fun
                                                                                                          (_B79) ->
                                                                                                              {V4_skill_id_2,
                                                                                                               _B80} =
                                                                                                                  protocol:uint32(_B79),
                                                                                                              {V4_skill_lev_2,
                                                                                                               _B81} =
                                                                                                                  protocol:uint8(_B80),
                                                                                                              {{V4_skill_id_2,
                                                                                                                V4_skill_lev_2},
                                                                                                               _B81}
                                                                                                      end),
                                                                                   {{V3_skill_type_2,
                                                                                     V3_skill_data_2},
                                                                                    _B83}
                                                                           end),
                                                        {{V2_pet_id,
                                                          V2_pet_skill_infos},
                                                         _B85}
                                                end),
    {V1_child_skill_infos, _B100} = protocol:array(_B87,
                                                   fun (_B88) ->
                                                           {V2_child_id, _B89} =
                                                               protocol:uint32(_B88),
                                                           {V2_child_skill_infos,
                                                            _B98} =
                                                               protocol:array(_B89,
                                                                              fun
                                                                                  (_B90) ->
                                                                                      {V3_skill_type_3,
                                                                                       _B91} =
                                                                                          protocol:uint8(_B90),
                                                                                      {V3_skill_data_3,
                                                                                       _B96} =
                                                                                          protocol:array(_B91,
                                                                                                         fun
                                                                                                             (_B92) ->
                                                                                                                 {V4_skill_id_3,
                                                                                                                  _B93} =
                                                                                                                     protocol:uint32(_B92),
                                                                                                                 {V4_skill_lev_3,
                                                                                                                  _B94} =
                                                                                                                     protocol:uint8(_B93),
                                                                                                                 {{V4_skill_id_3,
                                                                                                                   V4_skill_lev_3},
                                                                                                                  _B94}
                                                                                                         end),
                                                                                      {{V3_skill_type_3,
                                                                                        V3_skill_data_3},
                                                                                       _B96}
                                                                              end),
                                                           {{V2_child_id,
                                                             V2_child_skill_infos},
                                                            _B98}
                                                   end),
    {V1_skill_cooldown_list, _B105} = protocol:array(_B100,
                                                     fun (_B101) ->
                                                             {V2_skill_id,
                                                              _B102} =
                                                                 protocol:uint32(_B101),
                                                             {V2_cd_left,
                                                              _B103} =
                                                                 protocol:uint16(_B102),
                                                             {{V2_skill_id,
                                                               V2_cd_left},
                                                              _B103}
                                                     end),
    {V1_skill_cooldown_list_pet, _B110} =
        protocol:array(_B105,
                       fun (_B106) ->
                               {V2_skill_id, _B107} = protocol:uint32(_B106),
                               {V2_cd_left, _B108} = protocol:uint16(_B107),
                               {{V2_skill_id, V2_cd_left}, _B108}
                       end),
    {V1_backup_pets, _B118} = protocol:array(_B110,
                                             fun (_B111) ->
                                                     {V2_id, _B112} =
                                                         protocol:uint32(_B111),
                                                     {V2_base_id, _B113} =
                                                         protocol:uint32(_B112),
                                                     {V2_can_summon, _B114} =
                                                         protocol:uint8(_B113),
                                                     {V2_name, _B115} =
                                                         protocol:string(_B114),
                                                     {V2_lev, _B116} =
                                                         protocol:uint8(_B115),
                                                     {{V2_id,
                                                       V2_base_id,
                                                       V2_can_summon,
                                                       V2_name,
                                                       V2_lev},
                                                      _B116}
                                             end),
    {V1_backup_childs, _B127} = protocol:array(_B118,
                                               fun (_B119) ->
                                                       {V2_id, _B120} =
                                                           protocol:uint32(_B119),
                                                       {V2_base_id, _B121} =
                                                           protocol:uint32(_B120),
                                                       {V2_can_summon, _B122} =
                                                           protocol:uint8(_B121),
                                                       {V2_name, _B123} =
                                                           protocol:string(_B122),
                                                       {V2_lev, _B124} =
                                                           protocol:uint8(_B123),
                                                       {V2_hungry, _B125} =
                                                           protocol:uint32(_B124),
                                                       {{V2_id,
                                                         V2_base_id,
                                                         V2_can_summon,
                                                         V2_name,
                                                         V2_lev,
                                                         V2_hungry},
                                                        _B125}
                                               end),
    {ok,
     {V1_combat_type,
      V1_enter_type,
      V1_enter_view,
      V1_start_time,
      V1_atk_formation,
      V1_atk_formation_lev,
      V1_dfd_formation,
      V1_dfd_formation_lev,
      V1_round,
      V1_guide,
      V1_status,
      V1_wait_time,
      V1_time,
      V1_fighter_list,
      V1_summon_num,
      V1_use_item_num,
      V1_anger,
      V1_use_anger_ratio,
      V1_skill_infos,
      V1_pet_skill_infos,
      V1_child_skill_infos,
      V1_skill_cooldown_list,
      V1_skill_cooldown_list_pet,
      V1_backup_pets,
      V1_backup_childs}};
unpack(srv, 10711, _B0) -> {ok, {}};
unpack(cli, 10711, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {ok, {V1_result}};
unpack(srv, 10720, _B0) -> {ok, {}};
unpack(cli, 10720, _B0) ->
    {V1_round, _B1} = protocol:uint16(_B0),
    {V1_start_time, _B2} = protocol:uint32(_B1),
    {V1_action_list, _B43} = protocol:array(_B2,
                                            fun (_B3) ->
                                                    {V2_order, _B4} =
                                                        protocol:uint8(_B3),
                                                    {V2_sub_action_list, _B41} =
                                                        protocol:array(_B4,
                                                                       fun
                                                                           (_B5) ->
                                                                               {V3_self_id,
                                                                                _B6} =
                                                                                   protocol:uint16(_B5),
                                                                               {V3_target_id,
                                                                                _B7} =
                                                                                   protocol:uint16(_B6),
                                                                               {V3_sub_order,
                                                                                _B8} =
                                                                                   protocol:uint8(_B7),
                                                                               {V3_skill_id,
                                                                                _B9} =
                                                                                   protocol:uint32(_B8),
                                                                               {V3_skill_lev,
                                                                                _B10} =
                                                                                   protocol:uint8(_B9),
                                                                               {V3_attack_type,
                                                                                _B11} =
                                                                                   protocol:uint8(_B10),
                                                                               {V3_action_type,
                                                                                _B12} =
                                                                                   protocol:uint8(_B11),
                                                                               {V3_self_changes,
                                                                                _B18} =
                                                                                   protocol:array(_B12,
                                                                                                  fun
                                                                                                      (_B13) ->
                                                                                                          {V4_change_type,
                                                                                                           _B14} =
                                                                                                              protocol:uint8(_B13),
                                                                                                          {V4_change_val,
                                                                                                           _B15} =
                                                                                                              protocol:int32(_B14),
                                                                                                          {V4_other_val,
                                                                                                           _B16} =
                                                                                                              protocol:int32(_B15),
                                                                                                          {{V4_change_type,
                                                                                                            V4_change_val,
                                                                                                            V4_other_val},
                                                                                                           _B16}
                                                                                                  end),
                                                                               {V3_target_changes,
                                                                                _B24} =
                                                                                   protocol:array(_B18,
                                                                                                  fun
                                                                                                      (_B19) ->
                                                                                                          {V4_change_type,
                                                                                                           _B20} =
                                                                                                              protocol:uint8(_B19),
                                                                                                          {V4_change_val,
                                                                                                           _B21} =
                                                                                                              protocol:int32(_B20),
                                                                                                          {V4_other_val,
                                                                                                           _B22} =
                                                                                                              protocol:int32(_B21),
                                                                                                          {{V4_change_type,
                                                                                                            V4_change_val,
                                                                                                            V4_other_val},
                                                                                                           _B22}
                                                                                                  end),
                                                                               {V3_show_passive_skills,
                                                                                _B30} =
                                                                                   protocol:array(_B24,
                                                                                                  fun
                                                                                                      (_B25) ->
                                                                                                          {V4_id,
                                                                                                           _B26} =
                                                                                                              protocol:uint16(_B25),
                                                                                                          {V4_skill_id,
                                                                                                           _B27} =
                                                                                                              protocol:uint32(_B26),
                                                                                                          {V4_show_type,
                                                                                                           _B28} =
                                                                                                              protocol:uint8(_B27),
                                                                                                          {{V4_id,
                                                                                                            V4_skill_id,
                                                                                                            V4_show_type},
                                                                                                           _B28}
                                                                                                  end),
                                                                               {V3_is_hit,
                                                                                _B31} =
                                                                                   protocol:uint8(_B30),
                                                                               {V3_is_crit,
                                                                                _B32} =
                                                                                   protocol:uint8(_B31),
                                                                               {V3_is_defence,
                                                                                _B33} =
                                                                                   protocol:uint8(_B32),
                                                                               {V3_is_self_die,
                                                                                _B34} =
                                                                                   protocol:uint8(_B33),
                                                                               {V3_is_self_die_disappear,
                                                                                _B35} =
                                                                                   protocol:uint8(_B34),
                                                                               {V3_is_target_die,
                                                                                _B36} =
                                                                                   protocol:uint8(_B35),
                                                                               {V3_is_target_die_disappear,
                                                                                _B37} =
                                                                                   protocol:uint8(_B36),
                                                                               {V3_talk,
                                                                                _B38} =
                                                                                   protocol:string(_B37),
                                                                               {V3_action_msg,
                                                                                _B39} =
                                                                                   protocol:string(_B38),
                                                                               {{V3_self_id,
                                                                                 V3_target_id,
                                                                                 V3_sub_order,
                                                                                 V3_skill_id,
                                                                                 V3_skill_lev,
                                                                                 V3_attack_type,
                                                                                 V3_action_type,
                                                                                 V3_self_changes,
                                                                                 V3_target_changes,
                                                                                 V3_show_passive_skills,
                                                                                 V3_is_hit,
                                                                                 V3_is_crit,
                                                                                 V3_is_defence,
                                                                                 V3_is_self_die,
                                                                                 V3_is_self_die_disappear,
                                                                                 V3_is_target_die,
                                                                                 V3_is_target_die_disappear,
                                                                                 V3_talk,
                                                                                 V3_action_msg},
                                                                                _B39}
                                                                       end),
                                                    {{V2_order,
                                                      V2_sub_action_list},
                                                     _B41}
                                            end),
    {V1_buff_play_list, _B64} = protocol:array(_B43,
                                               fun (_B44) ->
                                                       {V2_order, _B45} =
                                                           protocol:uint8(_B44),
                                                       {V2_sub_order, _B46} =
                                                           protocol:uint8(_B45),
                                                       {V2_action_type, _B47} =
                                                           protocol:uint8(_B46),
                                                       {V2_buff_id, _B48} =
                                                           protocol:uint32(_B47),
                                                       {V2_layer, _B49} =
                                                           protocol:uint8(_B48),
                                                       {V2_duration, _B50} =
                                                           protocol:uint8(_B49),
                                                       {V2_duration_left,
                                                        _B51} =
                                                           protocol:uint8(_B50),
                                                       {V2_is_hit, _B52} =
                                                           protocol:uint8(_B51),
                                                       {V2_can_dispel, _B53} =
                                                           protocol:uint8(_B52),
                                                       {V2_caster_id, _B54} =
                                                           protocol:uint16(_B53),
                                                       {V2_target_id, _B55} =
                                                           protocol:uint16(_B54),
                                                       {V2_skill_fid, _B56} =
                                                           protocol:uint16(_B55),
                                                       {V2_target_changes,
                                                        _B62} =
                                                           protocol:array(_B56,
                                                                          fun
                                                                              (_B57) ->
                                                                                  {V3_change_type,
                                                                                   _B58} =
                                                                                      protocol:uint8(_B57),
                                                                                  {V3_change_val,
                                                                                   _B59} =
                                                                                      protocol:int32(_B58),
                                                                                  {V3_other_val,
                                                                                   _B60} =
                                                                                      protocol:int32(_B59),
                                                                                  {{V3_change_type,
                                                                                    V3_change_val,
                                                                                    V3_other_val},
                                                                                   _B60}
                                                                          end),
                                                       {{V2_order,
                                                         V2_sub_order,
                                                         V2_action_type,
                                                         V2_buff_id,
                                                         V2_layer,
                                                         V2_duration,
                                                         V2_duration_left,
                                                         V2_is_hit,
                                                         V2_can_dispel,
                                                         V2_caster_id,
                                                         V2_target_id,
                                                         V2_skill_fid,
                                                         V2_target_changes},
                                                        _B62}
                                               end),
    {V1_summon_play_list, _B113} = protocol:array(_B64,
                                                  fun (_B65) ->
                                                          {V2_order, _B66} =
                                                              protocol:uint8(_B65),
                                                          {V2_sub_order, _B67} =
                                                              protocol:uint8(_B66),
                                                          {V2_summon_type,
                                                           _B68} =
                                                              protocol:uint8(_B67),
                                                          {V2_summoner_id,
                                                           _B69} =
                                                              protocol:uint16(_B68),
                                                          {V2_summons, _B111} =
                                                              protocol:array(_B69,
                                                                             fun
                                                                                 (_B70) ->
                                                                                     {V3_id,
                                                                                      _B71} =
                                                                                         protocol:uint16(_B70),
                                                                                     {V3_group,
                                                                                      _B72} =
                                                                                         protocol:uint8(_B71),
                                                                                     {V3_type,
                                                                                      _B73} =
                                                                                         protocol:uint8(_B72),
                                                                                     {V3_rid,
                                                                                      _B74} =
                                                                                         protocol:uint32(_B73),
                                                                                     {V3_platform,
                                                                                      _B75} =
                                                                                         protocol:string(_B74),
                                                                                     {V3_zone_id,
                                                                                      _B76} =
                                                                                         protocol:uint16(_B75),
                                                                                     {V3_base_id,
                                                                                      _B77} =
                                                                                         protocol:uint32(_B76),
                                                                                     {V3_master_fid,
                                                                                      _B78} =
                                                                                         protocol:uint16(_B77),
                                                                                     {V3_name,
                                                                                      _B79} =
                                                                                         protocol:string(_B78),
                                                                                     {V3_sex,
                                                                                      _B80} =
                                                                                         protocol:uint8(_B79),
                                                                                     {V3_classes,
                                                                                      _B81} =
                                                                                         protocol:uint8(_B80),
                                                                                     {V3_lev,
                                                                                      _B82} =
                                                                                         protocol:uint16(_B81),
                                                                                     {V3_face_id,
                                                                                      _B83} =
                                                                                         protocol:uint32(_B82),
                                                                                     {V3_is_die,
                                                                                      _B84} =
                                                                                         protocol:uint8(_B83),
                                                                                     {V3_is_die_disappear,
                                                                                      _B85} =
                                                                                         protocol:uint8(_B84),
                                                                                     {V3_hp,
                                                                                      _B86} =
                                                                                         protocol:int32(_B85),
                                                                                     {V3_tmp_hp_max,
                                                                                      _B87} =
                                                                                         protocol:int32(_B86),
                                                                                     {V3_mp,
                                                                                      _B88} =
                                                                                         protocol:int32(_B87),
                                                                                     {V3_pos,
                                                                                      _B89} =
                                                                                         protocol:uint8(_B88),
                                                                                     {V3_order,
                                                                                      _B90} =
                                                                                         protocol:uint8(_B89),
                                                                                     {V3_fc,
                                                                                      _B91} =
                                                                                         protocol:uint32(_B90),
                                                                                     {V3_hp_max,
                                                                                      _B92} =
                                                                                         protocol:int32(_B91),
                                                                                     {V3_mp_max,
                                                                                      _B93} =
                                                                                         protocol:int32(_B92),
                                                                                     {V3_looks,
                                                                                      _B100} =
                                                                                         protocol:array(_B93,
                                                                                                        fun
                                                                                                            (_B94) ->
                                                                                                                {V4_looks_type,
                                                                                                                 _B95} =
                                                                                                                    protocol:uint32(_B94),
                                                                                                                {V4_looks_mode,
                                                                                                                 _B96} =
                                                                                                                    protocol:uint32(_B95),
                                                                                                                {V4_looks_val,
                                                                                                                 _B97} =
                                                                                                                    protocol:uint32(_B96),
                                                                                                                {V4_looks_str,
                                                                                                                 _B98} =
                                                                                                                    protocol:string(_B97),
                                                                                                                {{V4_looks_type,
                                                                                                                  V4_looks_mode,
                                                                                                                  V4_looks_val,
                                                                                                                  V4_looks_str},
                                                                                                                 _B98}
                                                                                                        end),
                                                                                     {V3_model_id,
                                                                                      _B101} =
                                                                                         protocol:uint32(_B100),
                                                                                     {V3_buff_infos,
                                                                                      _B109} =
                                                                                         protocol:array(_B101,
                                                                                                        fun
                                                                                                            (_B102) ->
                                                                                                                {V4_buff_id,
                                                                                                                 _B103} =
                                                                                                                    protocol:uint32(_B102),
                                                                                                                {V4_layer,
                                                                                                                 _B104} =
                                                                                                                    protocol:uint8(_B103),
                                                                                                                {V4_duration,
                                                                                                                 _B105} =
                                                                                                                    protocol:uint8(_B104),
                                                                                                                {V4_duration_left,
                                                                                                                 _B106} =
                                                                                                                    protocol:uint8(_B105),
                                                                                                                {V4_can_dispel,
                                                                                                                 _B107} =
                                                                                                                    protocol:uint8(_B106),
                                                                                                                {{V4_buff_id,
                                                                                                                  V4_layer,
                                                                                                                  V4_duration,
                                                                                                                  V4_duration_left,
                                                                                                                  V4_can_dispel},
                                                                                                                 _B107}
                                                                                                        end),
                                                                                     {{V3_id,
                                                                                       V3_group,
                                                                                       V3_type,
                                                                                       V3_rid,
                                                                                       V3_platform,
                                                                                       V3_zone_id,
                                                                                       V3_base_id,
                                                                                       V3_master_fid,
                                                                                       V3_name,
                                                                                       V3_sex,
                                                                                       V3_classes,
                                                                                       V3_lev,
                                                                                       V3_face_id,
                                                                                       V3_is_die,
                                                                                       V3_is_die_disappear,
                                                                                       V3_hp,
                                                                                       V3_tmp_hp_max,
                                                                                       V3_mp,
                                                                                       V3_pos,
                                                                                       V3_order,
                                                                                       V3_fc,
                                                                                       V3_hp_max,
                                                                                       V3_mp_max,
                                                                                       V3_looks,
                                                                                       V3_model_id,
                                                                                       V3_buff_infos},
                                                                                      _B109}
                                                                             end),
                                                          {{V2_order,
                                                            V2_sub_order,
                                                            V2_summon_type,
                                                            V2_summoner_id,
                                                            V2_summons},
                                                           _B111}
                                                  end),
    {V1_buff_list, _B124} = protocol:array(_B113,
                                           fun (_B114) ->
                                                   {V2_fighter_id, _B115} =
                                                       protocol:uint16(_B114),
                                                   {V2_buffs, _B122} =
                                                       protocol:array(_B115,
                                                                      fun
                                                                          (_B116) ->
                                                                              {V3_id,
                                                                               _B117} =
                                                                                  protocol:uint32(_B116),
                                                                              {V3_layer,
                                                                               _B118} =
                                                                                  protocol:uint8(_B117),
                                                                              {V3_duration,
                                                                               _B119} =
                                                                                  protocol:uint8(_B118),
                                                                              {V3_duration_left,
                                                                               _B120} =
                                                                                  protocol:uint8(_B119),
                                                                              {{V3_id,
                                                                                V3_layer,
                                                                                V3_duration,
                                                                                V3_duration_left},
                                                                               _B120}
                                                                      end),
                                                   {{V2_fighter_id, V2_buffs},
                                                    _B122}
                                           end),
    {V1_buff_play_list2, _B145} = protocol:array(_B124,
                                                 fun (_B125) ->
                                                         {V2_order, _B126} =
                                                             protocol:uint8(_B125),
                                                         {V2_sub_order, _B127} =
                                                             protocol:uint8(_B126),
                                                         {V2_action_type,
                                                          _B128} =
                                                             protocol:uint8(_B127),
                                                         {V2_buff_id, _B129} =
                                                             protocol:uint32(_B128),
                                                         {V2_layer, _B130} =
                                                             protocol:uint8(_B129),
                                                         {V2_duration, _B131} =
                                                             protocol:uint8(_B130),
                                                         {V2_duration_left,
                                                          _B132} =
                                                             protocol:uint8(_B131),
                                                         {V2_is_hit, _B133} =
                                                             protocol:uint8(_B132),
                                                         {V2_can_dispel,
                                                          _B134} =
                                                             protocol:uint8(_B133),
                                                         {V2_caster_id, _B135} =
                                                             protocol:uint16(_B134),
                                                         {V2_target_id, _B136} =
                                                             protocol:uint16(_B135),
                                                         {V2_skill_fid, _B137} =
                                                             protocol:uint16(_B136),
                                                         {V2_target_changes,
                                                          _B143} =
                                                             protocol:array(_B137,
                                                                            fun
                                                                                (_B138) ->
                                                                                    {V3_change_type,
                                                                                     _B139} =
                                                                                        protocol:uint8(_B138),
                                                                                    {V3_change_val,
                                                                                     _B140} =
                                                                                        protocol:int32(_B139),
                                                                                    {V3_other_val,
                                                                                     _B141} =
                                                                                        protocol:int32(_B140),
                                                                                    {{V3_change_type,
                                                                                      V3_change_val,
                                                                                      V3_other_val},
                                                                                     _B141}
                                                                            end),
                                                         {{V2_order,
                                                           V2_sub_order,
                                                           V2_action_type,
                                                           V2_buff_id,
                                                           V2_layer,
                                                           V2_duration,
                                                           V2_duration_left,
                                                           V2_is_hit,
                                                           V2_can_dispel,
                                                           V2_caster_id,
                                                           V2_target_id,
                                                           V2_skill_fid,
                                                           V2_target_changes},
                                                          _B143}
                                                 end),
    {V1_fighter_status_list, _B159} = protocol:array(_B145,
                                                     fun (_B146) ->
                                                             {V2_id, _B147} =
                                                                 protocol:uint16(_B146),
                                                             {V2_hp, _B148} =
                                                                 protocol:int32(_B147),
                                                             {V2_tmp_hp_max,
                                                              _B149} =
                                                                 protocol:int32(_B148),
                                                             {V2_mp, _B150} =
                                                                 protocol:int32(_B149),
                                                             {V2_hp_max,
                                                              _B151} =
                                                                 protocol:int32(_B150),
                                                             {V2_mp_max,
                                                              _B152} =
                                                                 protocol:int32(_B151),
                                                             {V2_is_die,
                                                              _B153} =
                                                                 protocol:uint8(_B152),
                                                             {V2_is_die_disappear,
                                                              _B154} =
                                                                 protocol:uint8(_B153),
                                                             {V2_pos, _B155} =
                                                                 protocol:uint8(_B154),
                                                             {V2_order, _B156} =
                                                                 protocol:uint8(_B155),
                                                             {V2_is_escape,
                                                              _B157} =
                                                                 protocol:uint8(_B156),
                                                             {{V2_id,
                                                               V2_hp,
                                                               V2_tmp_hp_max,
                                                               V2_mp,
                                                               V2_hp_max,
                                                               V2_mp_max,
                                                               V2_is_die,
                                                               V2_is_die_disappear,
                                                               V2_pos,
                                                               V2_order,
                                                               V2_is_escape},
                                                              _B157}
                                                     end),
    {V1_combat_result, _B160} = protocol:uint8(_B159),
    {V1_guide, _B161} = protocol:uint16(_B160),
    {V1_time, _B162} = protocol:uint8(_B161),
    {V1_fighter_changes, _B172} = protocol:array(_B162,
                                                 fun (_B163) ->
                                                         {V2_id, _B164} =
                                                             protocol:uint16(_B163),
                                                         {V2_self_changes,
                                                          _B170} =
                                                             protocol:array(_B164,
                                                                            fun
                                                                                (_B165) ->
                                                                                    {V3_change_type,
                                                                                     _B166} =
                                                                                        protocol:uint8(_B165),
                                                                                    {V3_change_val,
                                                                                     _B167} =
                                                                                        protocol:int32(_B166),
                                                                                    {V3_other_val,
                                                                                     _B168} =
                                                                                        protocol:int32(_B167),
                                                                                    {{V3_change_type,
                                                                                      V3_change_val,
                                                                                      V3_other_val},
                                                                                     _B168}
                                                                            end),
                                                         {{V2_id,
                                                           V2_self_changes},
                                                          _B170}
                                                 end),
    {V1_summon_num, _B173} = protocol:uint8(_B172),
    {V1_use_item_num, _B174} = protocol:uint8(_B173),
    {V1_skill_cooldown_list, _B179} = protocol:array(_B174,
                                                     fun (_B175) ->
                                                             {V2_skill_id,
                                                              _B176} =
                                                                 protocol:uint32(_B175),
                                                             {V2_cd_left,
                                                              _B177} =
                                                                 protocol:uint16(_B176),
                                                             {{V2_skill_id,
                                                               V2_cd_left},
                                                              _B177}
                                                     end),
    {V1_skill_cooldown_list_pet, _B184} =
        protocol:array(_B179,
                       fun (_B180) ->
                               {V2_skill_id, _B181} = protocol:uint32(_B180),
                               {V2_cd_left, _B182} = protocol:uint16(_B181),
                               {{V2_skill_id, V2_cd_left}, _B182}
                       end),
    {V1_backup_pets, _B192} = protocol:array(_B184,
                                             fun (_B185) ->
                                                     {V2_id, _B186} =
                                                         protocol:uint32(_B185),
                                                     {V2_base_id, _B187} =
                                                         protocol:uint32(_B186),
                                                     {V2_can_summon, _B188} =
                                                         protocol:uint8(_B187),
                                                     {V2_name, _B189} =
                                                         protocol:string(_B188),
                                                     {V2_lev, _B190} =
                                                         protocol:uint8(_B189),
                                                     {{V2_id,
                                                       V2_base_id,
                                                       V2_can_summon,
                                                       V2_name,
                                                       V2_lev},
                                                      _B190}
                                             end),
    {V1_backup_childs, _B201} = protocol:array(_B192,
                                               fun (_B193) ->
                                                       {V2_id, _B194} =
                                                           protocol:uint32(_B193),
                                                       {V2_base_id, _B195} =
                                                           protocol:uint32(_B194),
                                                       {V2_can_summon, _B196} =
                                                           protocol:uint8(_B195),
                                                       {V2_name, _B197} =
                                                           protocol:string(_B196),
                                                       {V2_lev, _B198} =
                                                           protocol:uint8(_B197),
                                                       {V2_hungry, _B199} =
                                                           protocol:uint32(_B198),
                                                       {{V2_id,
                                                         V2_base_id,
                                                         V2_can_summon,
                                                         V2_name,
                                                         V2_lev,
                                                         V2_hungry},
                                                        _B199}
                                               end),
    {ok,
     {V1_round,
      V1_start_time,
      V1_action_list,
      V1_buff_play_list,
      V1_summon_play_list,
      V1_buff_list,
      V1_buff_play_list2,
      V1_fighter_status_list,
      V1_combat_result,
      V1_guide,
      V1_time,
      V1_fighter_changes,
      V1_summon_num,
      V1_use_item_num,
      V1_skill_cooldown_list,
      V1_skill_cooldown_list_pet,
      V1_backup_pets,
      V1_backup_childs}};
unpack(srv, 10722, _B0) -> {ok, {}};
unpack(cli, 10722, _B0) ->
    {V1_start_time, _B1} = protocol:uint32(_B0),
    {V1_fighter_changes, _B11} = protocol:array(_B1,
                                                fun (_B2) ->
                                                        {V2_id, _B3} =
                                                            protocol:uint16(_B2),
                                                        {V2_self_changes, _B9} =
                                                            protocol:array(_B3,
                                                                           fun
                                                                               (_B4) ->
                                                                                   {V3_change_type,
                                                                                    _B5} =
                                                                                       protocol:uint8(_B4),
                                                                                   {V3_change_val,
                                                                                    _B6} =
                                                                                       protocol:int32(_B5),
                                                                                   {V3_other_val,
                                                                                    _B7} =
                                                                                       protocol:int32(_B6),
                                                                                   {{V3_change_type,
                                                                                     V3_change_val,
                                                                                     V3_other_val},
                                                                                    _B7}
                                                                           end),
                                                        {{V2_id,
                                                          V2_self_changes},
                                                         _B9}
                                                end),
    {ok, {V1_start_time, V1_fighter_changes}};
unpack(srv, 10723, _B0) -> {ok, {}};
unpack(cli, 10723, _B0) ->
    {V1_start_time, _B1} = protocol:uint32(_B0),
    {V1_fighter_changes, _B12} = protocol:array(_B1,
                                                fun (_B2) ->
                                                        {V2_sid, _B3} =
                                                            protocol:uint16(_B2),
                                                        {V2_tid, _B4} =
                                                            protocol:uint16(_B3),
                                                        {V2_self_changes,
                                                         _B10} =
                                                            protocol:array(_B4,
                                                                           fun
                                                                               (_B5) ->
                                                                                   {V3_change_type,
                                                                                    _B6} =
                                                                                       protocol:uint8(_B5),
                                                                                   {V3_change_val,
                                                                                    _B7} =
                                                                                       protocol:int32(_B6),
                                                                                   {V3_other_val,
                                                                                    _B8} =
                                                                                       protocol:string(_B7),
                                                                                   {{V3_change_type,
                                                                                     V3_change_val,
                                                                                     V3_other_val},
                                                                                    _B8}
                                                                           end),
                                                        {{V2_sid,
                                                          V2_tid,
                                                          V2_self_changes},
                                                         _B10}
                                                end),
    {ok, {V1_start_time, V1_fighter_changes}};
unpack(srv, 10731, _B0) ->
    {V1_round, _B1} = protocol:uint8(_B0),
    {ok, {V1_round}};
unpack(cli, 10731, _B0) ->
    {V1_msg, _B1} = protocol:string(_B0),
    {ok, {V1_msg}};
unpack(srv, 10732, _B0) ->
    {V1_skill_id, _B1} = protocol:uint32(_B0),
    {V1_target_id, _B2} = protocol:uint16(_B1),
    {V1_other_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_skill_id, V1_target_id, V1_other_id}};
unpack(cli, 10732, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 10733, _B0) -> {ok, {}};
unpack(cli, 10733, _B0) ->
    {V1_id, _B1} = protocol:uint16(_B0),
    {V1_result, _B2} = protocol:uint8(_B1),
    {V1_target_id, _B3} = protocol:uint16(_B2),
    {V1_skill_id, _B4} = protocol:uint32(_B3),
    {V1_skill_lev, _B5} = protocol:uint8(_B4),
    {ok,
     {V1_id,
      V1_result,
      V1_target_id,
      V1_skill_id,
      V1_skill_lev}};
unpack(srv, 10734, _B0) ->
    {V1_skill_id, _B1} = protocol:uint32(_B0),
    {V1_target_id, _B2} = protocol:uint16(_B1),
    {V1_other_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_skill_id, V1_target_id, V1_other_id}};
unpack(cli, 10734, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 10735, _B0) -> {ok, {}};
unpack(cli, 10735, _B0) ->
    {V1_id, _B1} = protocol:uint16(_B0),
    {V1_result, _B2} = protocol:uint8(_B1),
    {ok, {V1_id, V1_result}};
unpack(srv, 10740, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {ok, {V1_flag}};
unpack(cli, 10740, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_result, _B2} = protocol:uint8(_B1),
    {V1_msg, _B3} = protocol:string(_B2),
    {ok, {V1_flag, V1_result, V1_msg}};
unpack(srv, 10741, _B0) ->
    {V1_target_id, _B1} = protocol:uint16(_B0),
    {V1_preside_type, _B2} = protocol:uint8(_B1),
    {ok, {V1_target_id, V1_preside_type}};
unpack(cli, 10741, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 10742, _B0) -> {ok, {}};
unpack(cli, 10742, _B0) ->
    {V1_self_preside, _B5} = protocol:array(_B0,
                                            fun (_B1) ->
                                                    {V2_flag1, _B2} =
                                                        protocol:uint8(_B1),
                                                    {V2_text2, _B3} =
                                                        protocol:string(_B2),
                                                    {{V2_flag1, V2_text2}, _B3}
                                            end),
    {V1_target_preside, _B10} = protocol:array(_B5,
                                               fun (_B6) ->
                                                       {V2_flag2, _B7} =
                                                           protocol:uint8(_B6),
                                                       {V2_text2, _B8} =
                                                           protocol:string(_B7),
                                                       {{V2_flag2, V2_text2},
                                                        _B8}
                                               end),
    {ok, {V1_self_preside, V1_target_preside}};
unpack(srv, 10743, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_flag, _B2} = protocol:uint8(_B1),
    {V1_text, _B3} = protocol:string(_B2),
    {ok, {V1_type, V1_flag, V1_text}};
unpack(cli, 10743, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 10744, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_rec_id, _B2} = protocol:uint32(_B1),
    {V1_platform, _B3} = protocol:string(_B2),
    {V1_zone_id, _B4} = protocol:uint16(_B3),
    {ok, {V1_type, V1_rec_id, V1_platform, V1_zone_id}};
unpack(cli, 10744, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 10745, _B0) -> {ok, {}};
unpack(cli, 10745, _B0) -> {ok, {}};
unpack(srv, 10746, _B0) -> {ok, {}};
unpack(cli, 10746, _B0) -> {ok, {}};
unpack(srv, 10747, _B0) -> {ok, {}};
unpack(cli, 10747, _B0) ->
    {V1_list, _B19} = protocol:array(_B0,
                                     fun (_B1) ->
                                             {V2_likable, _B2} =
                                                 protocol:uint8(_B1),
                                             {V2_type, _B3} =
                                                 protocol:uint8(_B2),
                                             {V2_unique_id, _B4} =
                                                 protocol:tuple(_B3),
                                             {V2_combat_type, _B5} =
                                                 protocol:uint8(_B4),
                                             {V2_atk_name, _B6} =
                                                 protocol:string(_B5),
                                             {V2_dfd_name, _B7} =
                                                 protocol:string(_B6),
                                             {V2_atk_sex, _B8} =
                                                 protocol:uint8(_B7),
                                             {V2_atk_classes, _B9} =
                                                 protocol:uint8(_B8),
                                             {V2_dfd_sex, _B10} =
                                                 protocol:uint8(_B9),
                                             {V2_dfd_classes, _B11} =
                                                 protocol:uint8(_B10),
                                             {V2_time, _B12} =
                                                 protocol:uint32(_B11),
                                             {V2_liked, _B13} =
                                                 protocol:uint32(_B12),
                                             {V2_replayed, _B14} =
                                                 protocol:uint32(_B13),
                                             {V2_shared, _B15} =
                                                 protocol:uint32(_B14),
                                             {V2_round, _B16} =
                                                 protocol:uint32(_B15),
                                             {V2_avg_lev, _B17} =
                                                 protocol:uint32(_B16),
                                             {{V2_likable,
                                               V2_type,
                                               V2_unique_id,
                                               V2_combat_type,
                                               V2_atk_name,
                                               V2_dfd_name,
                                               V2_atk_sex,
                                               V2_atk_classes,
                                               V2_dfd_sex,
                                               V2_dfd_classes,
                                               V2_time,
                                               V2_liked,
                                               V2_replayed,
                                               V2_shared,
                                               V2_round,
                                               V2_avg_lev},
                                              _B17}
                                     end),
    {ok, {V1_list}};
unpack(srv, 10748, _B0) -> {ok, {}};
unpack(cli, 10748, _B0) ->
    {V1_list, _B19} = protocol:array(_B0,
                                     fun (_B1) ->
                                             {V2_likable, _B2} =
                                                 protocol:uint8(_B1),
                                             {V2_type, _B3} =
                                                 protocol:uint8(_B2),
                                             {V2_unique_id, _B4} =
                                                 protocol:tuple(_B3),
                                             {V2_combat_type, _B5} =
                                                 protocol:uint8(_B4),
                                             {V2_atk_name, _B6} =
                                                 protocol:string(_B5),
                                             {V2_dfd_name, _B7} =
                                                 protocol:string(_B6),
                                             {V2_atk_sex, _B8} =
                                                 protocol:uint8(_B7),
                                             {V2_atk_classes, _B9} =
                                                 protocol:uint8(_B8),
                                             {V2_dfd_sex, _B10} =
                                                 protocol:uint8(_B9),
                                             {V2_dfd_classes, _B11} =
                                                 protocol:uint8(_B10),
                                             {V2_time, _B12} =
                                                 protocol:uint32(_B11),
                                             {V2_liked, _B13} =
                                                 protocol:uint32(_B12),
                                             {V2_replayed, _B14} =
                                                 protocol:uint32(_B13),
                                             {V2_shared, _B15} =
                                                 protocol:uint32(_B14),
                                             {V2_round, _B16} =
                                                 protocol:uint32(_B15),
                                             {V2_avg_lev, _B17} =
                                                 protocol:uint32(_B16),
                                             {{V2_likable,
                                               V2_type,
                                               V2_unique_id,
                                               V2_combat_type,
                                               V2_atk_name,
                                               V2_dfd_name,
                                               V2_atk_sex,
                                               V2_atk_classes,
                                               V2_dfd_sex,
                                               V2_dfd_classes,
                                               V2_time,
                                               V2_liked,
                                               V2_replayed,
                                               V2_shared,
                                               V2_round,
                                               V2_avg_lev},
                                              _B17}
                                     end),
    {ok, {V1_list}};
unpack(srv, 10749, _B0) -> {ok, {}};
unpack(cli, 10749, _B0) ->
    {V1_list, _B19} = protocol:array(_B0,
                                     fun (_B1) ->
                                             {V2_likable, _B2} =
                                                 protocol:uint8(_B1),
                                             {V2_type, _B3} =
                                                 protocol:uint8(_B2),
                                             {V2_unique_id, _B4} =
                                                 protocol:tuple(_B3),
                                             {V2_combat_type, _B5} =
                                                 protocol:uint8(_B4),
                                             {V2_atk_name, _B6} =
                                                 protocol:string(_B5),
                                             {V2_dfd_name, _B7} =
                                                 protocol:string(_B6),
                                             {V2_atk_sex, _B8} =
                                                 protocol:uint8(_B7),
                                             {V2_atk_classes, _B9} =
                                                 protocol:uint8(_B8),
                                             {V2_dfd_sex, _B10} =
                                                 protocol:uint8(_B9),
                                             {V2_dfd_classes, _B11} =
                                                 protocol:uint8(_B10),
                                             {V2_time, _B12} =
                                                 protocol:uint32(_B11),
                                             {V2_liked, _B13} =
                                                 protocol:uint32(_B12),
                                             {V2_replayed, _B14} =
                                                 protocol:uint32(_B13),
                                             {V2_shared, _B15} =
                                                 protocol:uint32(_B14),
                                             {V2_round, _B16} =
                                                 protocol:uint32(_B15),
                                             {V2_avg_lev, _B17} =
                                                 protocol:uint32(_B16),
                                             {{V2_likable,
                                               V2_type,
                                               V2_unique_id,
                                               V2_combat_type,
                                               V2_atk_name,
                                               V2_dfd_name,
                                               V2_atk_sex,
                                               V2_atk_classes,
                                               V2_dfd_sex,
                                               V2_dfd_classes,
                                               V2_time,
                                               V2_liked,
                                               V2_replayed,
                                               V2_shared,
                                               V2_round,
                                               V2_avg_lev},
                                              _B17}
                                     end),
    {ok, {V1_list}};
unpack(srv, 10750, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_id, _B2} = protocol:uint32(_B1),
    {V1_platform, _B3} = protocol:string(_B2),
    {V1_zone_id, _B4} = protocol:uint16(_B3),
    {ok, {V1_type, V1_id, V1_platform, V1_zone_id}};
unpack(cli, 10750, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 10751, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_id, _B2} = protocol:uint32(_B1),
    {V1_platform, _B3} = protocol:string(_B2),
    {V1_zone_id, _B4} = protocol:uint16(_B3),
    {ok, {V1_type, V1_id, V1_platform, V1_zone_id}};
unpack(cli, 10751, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 10752, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_id, _B2} = protocol:uint32(_B1),
    {V1_platform, _B3} = protocol:string(_B2),
    {V1_zone_id, _B4} = protocol:uint16(_B3),
    {ok, {V1_type, V1_id, V1_platform, V1_zone_id}};
unpack(cli, 10752, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 10753, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_id, _B2} = protocol:uint32(_B1),
    {V1_platform, _B3} = protocol:string(_B2),
    {V1_zone_id, _B4} = protocol:uint16(_B3),
    {ok, {V1_type, V1_id, V1_platform, V1_zone_id}};
unpack(cli, 10753, _B0) ->
    {V1_likable, _B1} = protocol:uint8(_B0),
    {V1_type, _B2} = protocol:uint8(_B1),
    {V1_unique_id, _B3} = protocol:tuple(_B2),
    {V1_combat_type, _B4} = protocol:uint8(_B3),
    {V1_atk_name, _B5} = protocol:string(_B4),
    {V1_dfd_name, _B6} = protocol:string(_B5),
    {V1_atk_sex, _B7} = protocol:uint8(_B6),
    {V1_atk_classes, _B8} = protocol:uint8(_B7),
    {V1_dfd_sex, _B9} = protocol:uint8(_B8),
    {V1_dfd_classes, _B10} = protocol:uint8(_B9),
    {V1_time, _B11} = protocol:uint32(_B10),
    {V1_liked, _B12} = protocol:uint32(_B11),
    {V1_replayed, _B13} = protocol:uint32(_B12),
    {V1_shared, _B14} = protocol:uint32(_B13),
    {V1_round, _B15} = protocol:uint32(_B14),
    {V1_avg_lev, _B16} = protocol:uint32(_B15),
    {V1_fighters, _B27} = protocol:array(_B16,
                                         fun (_B17) ->
                                                 {V2_rid, _B18} =
                                                     protocol:uint32(_B17),
                                                 {V2_r_platform, _B19} =
                                                     protocol:string(_B18),
                                                 {V2_r_zone_id, _B20} =
                                                     protocol:uint16(_B19),
                                                 {V2_name, _B21} =
                                                     protocol:string(_B20),
                                                 {V2_sex, _B22} =
                                                     protocol:uint8(_B21),
                                                 {V2_classes, _B23} =
                                                     protocol:uint8(_B22),
                                                 {V2_lev, _B24} =
                                                     protocol:uint16(_B23),
                                                 {V2_group, _B25} =
                                                     protocol:uint8(_B24),
                                                 {{V2_rid,
                                                   V2_r_platform,
                                                   V2_r_zone_id,
                                                   V2_name,
                                                   V2_sex,
                                                   V2_classes,
                                                   V2_lev,
                                                   V2_group},
                                                  _B25}
                                         end),
    {ok,
     {V1_likable,
      V1_type,
      V1_unique_id,
      V1_combat_type,
      V1_atk_name,
      V1_dfd_name,
      V1_atk_sex,
      V1_atk_classes,
      V1_dfd_sex,
      V1_dfd_classes,
      V1_time,
      V1_liked,
      V1_replayed,
      V1_shared,
      V1_round,
      V1_avg_lev,
      V1_fighters}};
unpack(srv, 10754, _B0) ->
    {V1_rank_type, _B1} = protocol:uint8(_B0),
    {ok, {V1_rank_type}};
unpack(cli, 10754, _B0) ->
    {V1_rank_type, _B1} = protocol:uint8(_B0),
    {V1_list, _B20} = protocol:array(_B1,
                                     fun (_B2) ->
                                             {V2_likable, _B3} =
                                                 protocol:uint8(_B2),
                                             {V2_type, _B4} =
                                                 protocol:uint8(_B3),
                                             {V2_unique_id, _B5} =
                                                 protocol:tuple(_B4),
                                             {V2_combat_type, _B6} =
                                                 protocol:uint8(_B5),
                                             {V2_atk_name, _B7} =
                                                 protocol:string(_B6),
                                             {V2_dfd_name, _B8} =
                                                 protocol:string(_B7),
                                             {V2_atk_sex, _B9} =
                                                 protocol:uint8(_B8),
                                             {V2_atk_classes, _B10} =
                                                 protocol:uint8(_B9),
                                             {V2_dfd_sex, _B11} =
                                                 protocol:uint8(_B10),
                                             {V2_dfd_classes, _B12} =
                                                 protocol:uint8(_B11),
                                             {V2_time, _B13} =
                                                 protocol:uint32(_B12),
                                             {V2_liked, _B14} =
                                                 protocol:uint32(_B13),
                                             {V2_replayed, _B15} =
                                                 protocol:uint32(_B14),
                                             {V2_shared, _B16} =
                                                 protocol:uint32(_B15),
                                             {V2_round, _B17} =
                                                 protocol:uint32(_B16),
                                             {V2_avg_lev, _B18} =
                                                 protocol:uint32(_B17),
                                             {{V2_likable,
                                               V2_type,
                                               V2_unique_id,
                                               V2_combat_type,
                                               V2_atk_name,
                                               V2_dfd_name,
                                               V2_atk_sex,
                                               V2_atk_classes,
                                               V2_dfd_sex,
                                               V2_dfd_classes,
                                               V2_time,
                                               V2_liked,
                                               V2_replayed,
                                               V2_shared,
                                               V2_round,
                                               V2_avg_lev},
                                              _B18}
                                     end),
    {ok, {V1_rank_type, V1_list}};
unpack(srv, 10755, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {ok, {V1_type}};
unpack(cli, 10755, _B0) ->
    {V1_list, _B19} = protocol:array(_B0,
                                     fun (_B1) ->
                                             {V2_likable, _B2} =
                                                 protocol:uint8(_B1),
                                             {V2_type, _B3} =
                                                 protocol:uint8(_B2),
                                             {V2_unique_id, _B4} =
                                                 protocol:tuple(_B3),
                                             {V2_combat_type, _B5} =
                                                 protocol:uint8(_B4),
                                             {V2_atk_name, _B6} =
                                                 protocol:string(_B5),
                                             {V2_dfd_name, _B7} =
                                                 protocol:string(_B6),
                                             {V2_atk_sex, _B8} =
                                                 protocol:uint8(_B7),
                                             {V2_atk_classes, _B9} =
                                                 protocol:uint8(_B8),
                                             {V2_dfd_sex, _B10} =
                                                 protocol:uint8(_B9),
                                             {V2_dfd_classes, _B11} =
                                                 protocol:uint8(_B10),
                                             {V2_time, _B12} =
                                                 protocol:uint32(_B11),
                                             {V2_liked, _B13} =
                                                 protocol:uint32(_B12),
                                             {V2_replayed, _B14} =
                                                 protocol:uint32(_B13),
                                             {V2_shared, _B15} =
                                                 protocol:uint32(_B14),
                                             {V2_round, _B16} =
                                                 protocol:uint32(_B15),
                                             {V2_avg_lev, _B17} =
                                                 protocol:uint32(_B16),
                                             {{V2_likable,
                                               V2_type,
                                               V2_unique_id,
                                               V2_combat_type,
                                               V2_atk_name,
                                               V2_dfd_name,
                                               V2_atk_sex,
                                               V2_atk_classes,
                                               V2_dfd_sex,
                                               V2_dfd_classes,
                                               V2_time,
                                               V2_liked,
                                               V2_replayed,
                                               V2_shared,
                                               V2_round,
                                               V2_avg_lev},
                                              _B17}
                                     end),
    {ok, {V1_list}};
unpack(srv, 10756, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_rec_id, _B2} = protocol:uint32(_B1),
    {V1_platform, _B3} = protocol:string(_B2),
    {V1_zone_id, _B4} = protocol:uint16(_B3),
    {ok, {V1_type, V1_rec_id, V1_platform, V1_zone_id}};
unpack(cli, 10756, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 10757, _B0) -> {ok, {}};
unpack(cli, 10757, _B0) ->
    {V1_online, _B1} = protocol:uint32(_B0),
    {V1_liked, _B2} = protocol:uint32(_B1),
    {ok, {V1_online, V1_liked}};
unpack(srv, 10758, _B0) ->
    {V1_combat_type, _B1} = protocol:uint32(_B0),
    {ok, {V1_combat_type}};
unpack(cli, 10758, _B0) ->
    {V1_combat_type, _B1} = protocol:uint32(_B0),
    {V1_list, _B20} = protocol:array(_B1,
                                     fun (_B2) ->
                                             {V2_likable, _B3} =
                                                 protocol:uint8(_B2),
                                             {V2_type, _B4} =
                                                 protocol:uint8(_B3),
                                             {V2_unique_id, _B5} =
                                                 protocol:tuple(_B4),
                                             {V2_combat_type, _B6} =
                                                 protocol:uint32(_B5),
                                             {V2_atk_name, _B7} =
                                                 protocol:string(_B6),
                                             {V2_dfd_name, _B8} =
                                                 protocol:string(_B7),
                                             {V2_atk_sex, _B9} =
                                                 protocol:uint8(_B8),
                                             {V2_atk_classes, _B10} =
                                                 protocol:uint8(_B9),
                                             {V2_dfd_sex, _B11} =
                                                 protocol:uint8(_B10),
                                             {V2_dfd_classes, _B12} =
                                                 protocol:uint8(_B11),
                                             {V2_time, _B13} =
                                                 protocol:uint32(_B12),
                                             {V2_liked, _B14} =
                                                 protocol:uint32(_B13),
                                             {V2_replayed, _B15} =
                                                 protocol:uint32(_B14),
                                             {V2_shared, _B16} =
                                                 protocol:uint32(_B15),
                                             {V2_round, _B17} =
                                                 protocol:uint32(_B16),
                                             {V2_avg_lev, _B18} =
                                                 protocol:uint32(_B17),
                                             {{V2_likable,
                                               V2_type,
                                               V2_unique_id,
                                               V2_combat_type,
                                               V2_atk_name,
                                               V2_dfd_name,
                                               V2_atk_sex,
                                               V2_atk_classes,
                                               V2_dfd_sex,
                                               V2_dfd_classes,
                                               V2_time,
                                               V2_liked,
                                               V2_replayed,
                                               V2_shared,
                                               V2_round,
                                               V2_avg_lev},
                                              _B18}
                                     end),
    {ok, {V1_combat_type, V1_list}};
unpack(srv, 10759, _B0) -> {ok, {}};
unpack(cli, 10759, _B0) ->
    {V1_list, _B5} = protocol:array(_B0,
                                    fun (_B1) ->
                                            {V2_combat_tyeo, _B2} =
                                                protocol:uint32(_B1),
                                            {V2_val, _B3} =
                                                protocol:uint32(_B2),
                                            {{V2_combat_tyeo, V2_val}, _B3}
                                    end),
    {ok, {V1_list}};
unpack(srv, 10760, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {ok, {V1_rid, V1_platform, V1_zone_id}};
unpack(cli, 10760, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 10761, _B0) -> {ok, {}};
unpack(cli, 10761, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {V1_name, _B4} = protocol:string(_B3),
    {V1_type, _B5} = protocol:uint8(_B4),
    {ok,
     {V1_rid, V1_platform, V1_zone_id, V1_name, V1_type}};
unpack(srv, 10762, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {V1_flag, _B4} = protocol:uint8(_B3),
    {V1_type, _B5} = protocol:uint8(_B4),
    {ok,
     {V1_rid, V1_platform, V1_zone_id, V1_flag, V1_type}};
unpack(cli, 10762, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 10763, _B0) -> {ok, {}};
unpack(cli, 10763, _B0) ->
    {V1_valid_plan, _B1} = protocol:uint8(_B0),
    {V1_plan_data, _B11} = protocol:array(_B1,
                                          fun (_B2) ->
                                                  {V2_index, _B3} =
                                                      protocol:uint8(_B2),
                                                  {V2_name, _B4} =
                                                      protocol:string(_B3),
                                                  {V2_skill_plan, _B9} =
                                                      protocol:array(_B4,
                                                                     fun
                                                                         (_B5) ->
                                                                             {V3_skill_index,
                                                                              _B6} =
                                                                                 protocol:uint8(_B5),
                                                                             {V3_skill_id,
                                                                              _B7} =
                                                                                 protocol:uint32(_B6),
                                                                             {{V3_skill_index,
                                                                               V3_skill_id},
                                                                              _B7}
                                                                     end),
                                                  {{V2_index,
                                                    V2_name,
                                                    V2_skill_plan},
                                                   _B9}
                                          end),
    {ok, {V1_valid_plan, V1_plan_data}};
unpack(srv, 10764, _B0) ->
    {V1_index, _B1} = protocol:uint8(_B0),
    {V1_skill_plan, _B6} = protocol:array(_B1,
                                          fun (_B2) ->
                                                  {V2_skill_index, _B3} =
                                                      protocol:uint8(_B2),
                                                  {V2_skill_id, _B4} =
                                                      protocol:uint32(_B3),
                                                  {{V2_skill_index,
                                                    V2_skill_id},
                                                   _B4}
                                          end),
    {ok, {V1_index, V1_skill_plan}};
unpack(cli, 10764, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 10765, _B0) ->
    {V1_skill_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_skill_id}};
unpack(cli, 10765, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 10766, _B0) ->
    {V1_index, _B1} = protocol:uint8(_B0),
    {ok, {V1_index}};
unpack(cli, 10766, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 10767, _B0) -> {ok, {}};
unpack(cli, 10767, _B0) ->
    {V1_skill_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_skill_id}};
unpack(srv, 10768, _B0) ->
    {V1_index, _B1} = protocol:uint8(_B0),
    {V1_name, _B2} = protocol:string(_B1),
    {ok, {V1_index, V1_name}};
unpack(cli, 10768, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 10769, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_rec_id, _B2} = protocol:uint32(_B1),
    {V1_platform, _B3} = protocol:string(_B2),
    {V1_zone_id, _B4} = protocol:uint16(_B3),
    {V1_round, _B5} = protocol:uint32(_B4),
    {V1_msg, _B6} = protocol:string(_B5),
    {ok,
     {V1_type,
      V1_rec_id,
      V1_platform,
      V1_zone_id,
      V1_round,
      V1_msg}};
unpack(cli, 10769, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 10770, _B0) -> {ok, {}};
unpack(cli, 10770, _B0) ->
    {V1_combat_record_chat_mgr, _B12} = protocol:array(_B0,
                                                       fun (_B1) ->
                                                               {V2_rid, _B2} =
                                                                   protocol:uint32(_B1),
                                                               {V2_platform,
                                                                _B3} =
                                                                   protocol:string(_B2),
                                                               {V2_zone_id,
                                                                _B4} =
                                                                   protocol:uint32(_B3),
                                                               {V2_name, _B5} =
                                                                   protocol:string(_B4),
                                                               {V2_classes,
                                                                _B6} =
                                                                   protocol:uint8(_B5),
                                                               {V2_lev, _B7} =
                                                                   protocol:uint16(_B6),
                                                               {V2_sex, _B8} =
                                                                   protocol:uint8(_B7),
                                                               {V2_break_times,
                                                                _B9} =
                                                                   protocol:uint8(_B8),
                                                               {V2_msg, _B10} =
                                                                   protocol:string(_B9),
                                                               {{V2_rid,
                                                                 V2_platform,
                                                                 V2_zone_id,
                                                                 V2_name,
                                                                 V2_classes,
                                                                 V2_lev,
                                                                 V2_sex,
                                                                 V2_break_times,
                                                                 V2_msg},
                                                                _B10}
                                                       end),
    {ok, {V1_combat_record_chat_mgr}};
unpack(srv, 10771, _B0) ->
    {V1_skill_id, _B1} = protocol:uint32(_B0),
    {V1_target_id, _B2} = protocol:uint16(_B1),
    {V1_other_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_skill_id, V1_target_id, V1_other_id}};
unpack(cli, 10771, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 10772, _B0) -> {ok, {}};
unpack(cli, 10772, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 10773, _B0) ->
    {V1_skill_id, _B1} = protocol:uint32(_B0),
    {V1_target_id, _B2} = protocol:uint16(_B1),
    {V1_other_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_skill_id, V1_target_id, V1_other_id}};
unpack(cli, 10773, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 10774, _B0) -> {ok, {}};
unpack(cli, 10774, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 10775, _B0) -> {ok, {}};
unpack(cli, 10775, _B0) ->
    {V1_help_combat_info, _B6} = protocol:array(_B0,
                                                fun (_B1) ->
                                                        {V2_skill_id, _B2} =
                                                            protocol:uint32(_B1),
                                                        {V2_times, _B3} =
                                                            protocol:uint32(_B2),
                                                        {V2_skill_status, _B4} =
                                                            protocol:uint8(_B3),
                                                        {{V2_skill_id,
                                                          V2_times,
                                                          V2_skill_status},
                                                         _B4}
                                                end),
    {V1_round, _B7} = protocol:uint16(_B6),
    {ok, {V1_help_combat_info, V1_round}};
unpack(srv, 10776, _B0) -> {ok, {}};
unpack(cli, 10776, _B0) ->
    {V1_observer_skill_cd, _B5} = protocol:array(_B0,
                                                 fun (_B1) ->
                                                         {V2_skill_id, _B2} =
                                                             protocol:uint32(_B1),
                                                         {V2_skill_status,
                                                          _B3} =
                                                             protocol:uint8(_B2),
                                                         {{V2_skill_id,
                                                           V2_skill_status},
                                                          _B3}
                                                 end),
    {ok, {V1_observer_skill_cd}};
unpack(srv, 10777, _B0) ->
    {V1_skill_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_skill_id}};
unpack(cli, 10777, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 10778, _B0) -> {ok, {}};
unpack(cli, 10778, _B0) ->
    {V1_reward, _B7} = protocol:array(_B0,
                                      fun (_B1) ->
                                              {V2_reward_id, _B2} =
                                                  protocol:uint32(_B1),
                                              {V2_id, _B3} =
                                                  protocol:uint32(_B2),
                                              {V2_type, _B4} =
                                                  protocol:uint32(_B3),
                                              {V2_end_time, _B5} =
                                                  protocol:uint32(_B4),
                                              {{V2_reward_id,
                                                V2_id,
                                                V2_type,
                                                V2_end_time},
                                               _B5}
                                      end),
    {ok, {V1_reward}};
unpack(srv, 10779, _B0) ->
    {V1_combat_type, _B1} = protocol:uint32(_B0),
    {V1_reward_id, _B2} = protocol:uint32(_B1),
    {ok, {V1_combat_type, V1_reward_id}};
unpack(cli, 10779, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 10780, _B0) -> {ok, {}};
unpack(cli, 10780, _B0) ->
    {V1_end_time, _B1} = protocol:uint32(_B0),
    {ok, {V1_end_time}};
unpack(srv, 10789, _B0) -> {ok, {}};
unpack(cli, 10789, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {ok, {V1_result}};
unpack(srv, 10790, _B0) -> {ok, {}};
unpack(cli, 10790, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_gl_list, _B7} = protocol:array(_B2,
                                       fun (_B3) ->
                                               {V2_base_id, _B4} =
                                                   protocol:uint32(_B3),
                                               {V2_val, _B5} =
                                                   protocol:uint32(_B4),
                                               {{V2_base_id, V2_val}, _B5}
                                       end),
    {ok, {V1_result, V1_msg, V1_gl_list}};
unpack(_Type, Code, _Data) ->
    {error, {unknown_unpack_command, Code}}.

