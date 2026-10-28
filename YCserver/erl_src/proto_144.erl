-file("src/proto/proto_144.erl", 1).

-module(proto_144).

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

-file("src/proto/proto_144.erl", 14).

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

-file("src/proto/proto_144.erl", 15).

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

-file("src/proto/proto_144.erl", 16).

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

-file("src/proto/proto_144.erl", 17).

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

-file("src/proto/proto_144.erl", 18).

-spec pack(srv | cli, non_neg_integer(),
           tuple()) -> {ok, binary()} |
                       {error, {unknown_pack_command, non_neg_integer()}}.

pack(cli, 14400, {}) ->
    {ok, <<2:32/little, 14400:16/little>>};
pack(srv, 14400,
     {#m_glory{id = V0_id, title_id = V0_title_id,
               end_time = V0_end_time}}) ->
    D_a_t_a = <<V0_id:8/little, V0_title_id:8/little,
                V0_end_time:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14400:16/little,
       D_a_t_a/binary>>};
pack(cli, 14401, {}) ->
    {ok, <<2:32/little, 14401:16/little>>};
pack(srv, 14401, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14401:16/little,
       D_a_t_a/binary>>};
pack(cli, 14404, {}) ->
    {ok, <<2:32/little, 14404:16/little>>};
pack(srv, 14404, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14404:16/little,
       D_a_t_a/binary>>};
pack(cli, 14405, {V0_id}) ->
    D_a_t_a = <<V0_id:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14405:16/little,
       D_a_t_a/binary>>};
pack(srv, 14405,
     {V0_id,
      {V0_rid, V0_r_platform, V0_r_zone_id},
      V0_first_name,
      V0_first_lev,
      V0_first_classes,
      V0_best_rank,
      V0_recent}) ->
    D_a_t_a = <<V0_id:8/little, V0_rid:32/little,
                (protocol:pack(string, V0_r_platform))/binary,
                V0_r_zone_id:16/little,
                (protocol:pack(string, V0_first_name))/binary,
                V0_first_lev:8/little, V0_first_classes:8/little,
                (length(V0_best_rank)):16/little,
                (list_to_binary([<<V1_rid:32/little,
                                   (protocol:pack(string,
                                                  V1_r_platform))/binary,
                                   V1_r_zone_id:16/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_lev:8/little, V1_classes:8/little,
                                   V1_time:16/little>>
                                 || {{V1_rid, V1_r_platform, V1_r_zone_id},
                                     V1_name,
                                     V1_lev,
                                     V1_classes,
                                     V1_time}
                                        <- V0_best_rank]))/binary,
                (length(V0_recent)):16/little,
                (list_to_binary([<<V1_rid_r:32/little,
                                   (protocol:pack(string,
                                                  V1_platform_r))/binary,
                                   V1_zone_id_r:16/little,
                                   (protocol:pack(string, V1_name_r))/binary,
                                   V1_lev_r:8/little, V1_classes_r:8/little,
                                   V1_time_r:16/little>>
                                 || {{V1_rid_r, V1_platform_r, V1_zone_id_r},
                                     V1_name_r,
                                     V1_lev_r,
                                     V1_classes_r,
                                     V1_time_r}
                                        <- V0_recent]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14405:16/little,
       D_a_t_a/binary>>};
pack(cli, 14406, {}) ->
    {ok, <<2:32/little, 14406:16/little>>};
pack(srv, 14406,
     {V0_id, V0_time, V0_round, V0_title_id}) ->
    D_a_t_a = <<V0_id:8/little, V0_time:16/little,
                V0_round:8/little, V0_title_id:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14406:16/little,
       D_a_t_a/binary>>};
pack(cli, 14407,
     {V0_rid, V0_r_platform, V0_r_zone_id, V0_lev_id}) ->
    D_a_t_a = <<V0_rid:32/little,
                (protocol:pack(string, V0_r_platform))/binary,
                V0_r_zone_id:16/little, V0_lev_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14407:16/little,
       D_a_t_a/binary>>};
pack(srv, 14407, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14407:16/little,
       D_a_t_a/binary>>};
pack(cli, 14408,
     {V0_rid, V0_r_platform, V0_r_zone_id, V0_lev_id}) ->
    D_a_t_a = <<V0_rid:32/little,
                (protocol:pack(string, V0_r_platform))/binary,
                V0_r_zone_id:16/little, V0_lev_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14408:16/little,
       D_a_t_a/binary>>};
pack(srv, 14408, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14408:16/little,
       D_a_t_a/binary>>};
pack(cli, 14420, {}) ->
    {ok, <<2:32/little, 14420:16/little>>};
pack(srv, 14420, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14420:16/little,
       D_a_t_a/binary>>};
pack(cli, 14421, {}) ->
    {ok, <<2:32/little, 14421:16/little>>};
pack(srv, 14421, {V0_wave}) ->
    D_a_t_a = <<V0_wave:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14421:16/little,
       D_a_t_a/binary>>};
pack(cli, 14422, {}) ->
    {ok, <<2:32/little, 14422:16/little>>};
pack(srv, 14422, {V0_wave, V0_reward_info}) ->
    D_a_t_a = <<V0_wave:32/little,
                (length(V0_reward_info)):16/little,
                (list_to_binary([<<V1_assets:32/little,
                                   V1_val:32/little>>
                                 || {V1_assets, V1_val}
                                        <- V0_reward_info]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14422:16/little,
       D_a_t_a/binary>>};
pack(cli, 14423, {}) ->
    {ok, <<2:32/little, 14423:16/little>>};
pack(srv, 14423,
     {V0_result,
      V0_buff_id,
      V0_msg,
      V0_id,
      V0_time,
      V0_round,
      V0_title_id,
      V0_gl_list,
      V0_list,
      V0_is_beyond,
      V0_is_break}) ->
    D_a_t_a = <<V0_result:8/little, V0_buff_id:32/little,
                (protocol:pack(string, V0_msg))/binary, V0_id:8/little,
                V0_time:16/little, V0_round:8/little,
                V0_title_id:8/little, (length(V0_gl_list)):16/little,
                (list_to_binary([<<V1_base_id:32/little,
                                   V1_val:32/little>>
                                 || {V1_base_id, V1_val}
                                        <- V0_gl_list]))/binary,
                (length(V0_list)):16/little,
                (list_to_binary([<<V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:16/little, V1_classes:32/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_sex:32/little, V1_lev:32/little,
                                   V1_new_id:32/little, V1_max_id:32/little,
                                   V1_new_title_id:32/little>>
                                 || #glory_role{id =
                                                    {V1_rid,
                                                     V1_platform,
                                                     V1_zone_id},
                                                classes = V1_classes,
                                                name = V1_name, sex = V1_sex,
                                                lev = V1_lev,
                                                new_id = V1_new_id,
                                                max_id = V1_max_id,
                                                new_title_id = V1_new_title_id}
                                        <- V0_list]))/binary,
                V0_is_beyond:8/little, V0_is_break:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14423:16/little,
       D_a_t_a/binary>>};
pack(cli, 14424, {}) ->
    {ok, <<2:32/little, 14424:16/little>>};
pack(srv, 14424,
     {V0_new_id,
      V0_new_title_id,
      V0_max_id,
      V0_mtime,
      V0_reset_time,
      V0_last_week,
      V0_day_reward,
      V0_day_times,
      V0_total_times,
      V0_lost_times,
      V0_end_time,
      V0_last_week_flag,
      V0_floor_num}) ->
    D_a_t_a = <<V0_new_id:32/little,
                V0_new_title_id:32/little, V0_max_id:32/little,
                V0_mtime:32/little, V0_reset_time:32/little,
                V0_last_week:32/little, V0_day_reward:32/little,
                V0_day_times:32/little, V0_total_times:32/little,
                V0_lost_times:32/little, V0_end_time:32/little,
                V0_last_week_flag:32/little, V0_floor_num:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14424:16/little,
       D_a_t_a/binary>>};
pack(cli, 14425, {}) ->
    {ok, <<2:32/little, 14425:16/little>>};
pack(srv, 14425, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14425:16/little,
       D_a_t_a/binary>>};
pack(cli, 14426, {}) ->
    {ok, <<2:32/little, 14426:16/little>>};
pack(srv, 14426, {V0_list}) ->
    D_a_t_a = <<(length(V0_list)):16/little,
                (list_to_binary([<<V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:16/little, V1_classes:32/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_sex:32/little, V1_lev:32/little,
                                   V1_new_id:32/little, V1_max_id:32/little,
                                   V1_new_title_id:32/little,
                                   V1_mtime:32/little>>
                                 || #glory_role{id =
                                                    {V1_rid,
                                                     V1_platform,
                                                     V1_zone_id},
                                                classes = V1_classes,
                                                name = V1_name, sex = V1_sex,
                                                lev = V1_lev,
                                                new_id = V1_new_id,
                                                max_id = V1_max_id,
                                                new_title_id = V1_new_title_id,
                                                mtime = V1_mtime}
                                        <- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14426:16/little,
       D_a_t_a/binary>>};
pack(cli, 14427, {}) ->
    {ok, <<2:32/little, 14427:16/little>>};
pack(srv, 14427, {V0_list}) ->
    D_a_t_a = <<(length(V0_list)):16/little,
                (list_to_binary([<<V1_floor:32/little,
                                   (length(V1_role_list)):16/little,
                                   (list_to_binary([<<V2_rid:32/little,
                                                      (protocol:pack(string,
                                                                     V2_platform))/binary,
                                                      V2_zone_id:16/little>>
                                                    || {V2_rid,
                                                        V2_platform,
                                                        V2_zone_id}
                                                           <- V1_role_list]))/binary>>
                                 || #glory_floor{floor = V1_floor,
                                                 role_list = V1_role_list}
                                        <- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14427:16/little,
       D_a_t_a/binary>>};
pack(cli, 14428, {V0_floor}) ->
    D_a_t_a = <<V0_floor:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14428:16/little,
       D_a_t_a/binary>>};
pack(srv, 14428, {V0_floor, V0_list}) ->
    D_a_t_a = <<V0_floor:32/little,
                (length(V0_list)):16/little,
                (list_to_binary([<<V1_type:8/little,
                                   V1_rec_id:32/little,
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
                                 || #combat_record{id =
                                                       {V1_type,
                                                        {V1_rec_id,
                                                         V1_platform,
                                                         V1_zone_id}},
                                                   combat_type = V1_combat_type,
                                                   atk_name = V1_atk_name,
                                                   dfd_name = V1_dfd_name,
                                                   atk_sex = V1_atk_sex,
                                                   atk_classes = V1_atk_classes,
                                                   dfd_sex = V1_dfd_sex,
                                                   dfd_classes = V1_dfd_classes,
                                                   time = V1_time,
                                                   liked = V1_liked,
                                                   replayed = V1_replayed,
                                                   shared = V1_shared,
                                                   round = V1_round,
                                                   avg_lev = V1_avg_lev}
                                        <- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14428:16/little,
       D_a_t_a/binary>>};
pack(cli, 14429, {}) ->
    {ok, <<2:32/little, 14429:16/little>>};
pack(srv, 14429, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14429:16/little,
       D_a_t_a/binary>>};
pack(_Type, Code, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
             binary()) -> {ok, tuple()} |
                          {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(srv, 14400, _B0) -> {ok, {}};
unpack(cli, 14400, _B0) ->
    {V1_id, _B1} = protocol:uint8(_B0),
    {V1_title_id, _B2} = protocol:uint8(_B1),
    {V1_end_time, _B3} = protocol:uint32(_B2),
    {ok, {V1_id, V1_title_id, V1_end_time}};
unpack(srv, 14401, _B0) -> {ok, {}};
unpack(cli, 14401, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 14404, _B0) -> {ok, {}};
unpack(cli, 14404, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 14405, _B0) ->
    {V1_id, _B1} = protocol:uint8(_B0),
    {ok, {V1_id}};
unpack(cli, 14405, _B0) ->
    {V1_id, _B1} = protocol:uint8(_B0),
    {V1_rid, _B2} = protocol:uint32(_B1),
    {V1_r_platform, _B3} = protocol:string(_B2),
    {V1_r_zone_id, _B4} = protocol:uint16(_B3),
    {V1_first_name, _B5} = protocol:string(_B4),
    {V1_first_lev, _B6} = protocol:uint8(_B5),
    {V1_first_classes, _B7} = protocol:uint8(_B6),
    {V1_best_rank, _B17} = protocol:array(_B7,
                                          fun (_B8) ->
                                                  {V2_rid, _B9} =
                                                      protocol:uint32(_B8),
                                                  {V2_r_platform, _B10} =
                                                      protocol:string(_B9),
                                                  {V2_r_zone_id, _B11} =
                                                      protocol:uint16(_B10),
                                                  {V2_name, _B12} =
                                                      protocol:string(_B11),
                                                  {V2_lev, _B13} =
                                                      protocol:uint8(_B12),
                                                  {V2_classes, _B14} =
                                                      protocol:uint8(_B13),
                                                  {V2_time, _B15} =
                                                      protocol:uint16(_B14),
                                                  {{V2_rid,
                                                    V2_r_platform,
                                                    V2_r_zone_id,
                                                    V2_name,
                                                    V2_lev,
                                                    V2_classes,
                                                    V2_time},
                                                   _B15}
                                          end),
    {V1_recent, _B27} = protocol:array(_B17,
                                       fun (_B18) ->
                                               {V2_rid_r, _B19} =
                                                   protocol:uint32(_B18),
                                               {V2_platform_r, _B20} =
                                                   protocol:string(_B19),
                                               {V2_zone_id_r, _B21} =
                                                   protocol:uint16(_B20),
                                               {V2_name_r, _B22} =
                                                   protocol:string(_B21),
                                               {V2_lev_r, _B23} =
                                                   protocol:uint8(_B22),
                                               {V2_classes_r, _B24} =
                                                   protocol:uint8(_B23),
                                               {V2_time_r, _B25} =
                                                   protocol:uint16(_B24),
                                               {{V2_rid_r,
                                                 V2_platform_r,
                                                 V2_zone_id_r,
                                                 V2_name_r,
                                                 V2_lev_r,
                                                 V2_classes_r,
                                                 V2_time_r},
                                                _B25}
                                       end),
    {ok,
     {V1_id,
      V1_rid,
      V1_r_platform,
      V1_r_zone_id,
      V1_first_name,
      V1_first_lev,
      V1_first_classes,
      V1_best_rank,
      V1_recent}};
unpack(srv, 14406, _B0) -> {ok, {}};
unpack(cli, 14406, _B0) ->
    {V1_id, _B1} = protocol:uint8(_B0),
    {V1_time, _B2} = protocol:uint16(_B1),
    {V1_round, _B3} = protocol:uint8(_B2),
    {V1_title_id, _B4} = protocol:uint8(_B3),
    {ok, {V1_id, V1_time, V1_round, V1_title_id}};
unpack(srv, 14407, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_r_platform, _B2} = protocol:string(_B1),
    {V1_r_zone_id, _B3} = protocol:uint16(_B2),
    {V1_lev_id, _B4} = protocol:uint32(_B3),
    {ok, {V1_rid, V1_r_platform, V1_r_zone_id, V1_lev_id}};
unpack(cli, 14407, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 14408, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_r_platform, _B2} = protocol:string(_B1),
    {V1_r_zone_id, _B3} = protocol:uint16(_B2),
    {V1_lev_id, _B4} = protocol:uint32(_B3),
    {ok, {V1_rid, V1_r_platform, V1_r_zone_id, V1_lev_id}};
unpack(cli, 14408, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 14420, _B0) -> {ok, {}};
unpack(cli, 14420, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 14421, _B0) -> {ok, {}};
unpack(cli, 14421, _B0) ->
    {V1_wave, _B1} = protocol:uint32(_B0),
    {ok, {V1_wave}};
unpack(srv, 14422, _B0) -> {ok, {}};
unpack(cli, 14422, _B0) ->
    {V1_wave, _B1} = protocol:uint32(_B0),
    {V1_reward_info, _B6} = protocol:array(_B1,
                                           fun (_B2) ->
                                                   {V2_assets, _B3} =
                                                       protocol:uint32(_B2),
                                                   {V2_val, _B4} =
                                                       protocol:uint32(_B3),
                                                   {{V2_assets, V2_val}, _B4}
                                           end),
    {ok, {V1_wave, V1_reward_info}};
unpack(srv, 14423, _B0) -> {ok, {}};
unpack(cli, 14423, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_buff_id, _B2} = protocol:uint32(_B1),
    {V1_msg, _B3} = protocol:string(_B2),
    {V1_id, _B4} = protocol:uint8(_B3),
    {V1_time, _B5} = protocol:uint16(_B4),
    {V1_round, _B6} = protocol:uint8(_B5),
    {V1_title_id, _B7} = protocol:uint8(_B6),
    {V1_gl_list, _B12} = protocol:array(_B7,
                                        fun (_B8) ->
                                                {V2_base_id, _B9} =
                                                    protocol:uint32(_B8),
                                                {V2_val, _B10} =
                                                    protocol:uint32(_B9),
                                                {{V2_base_id, V2_val}, _B10}
                                        end),
    {V1_list, _B25} = protocol:array(_B12,
                                     fun (_B13) ->
                                             {V2_rid, _B14} =
                                                 protocol:uint32(_B13),
                                             {V2_platform, _B15} =
                                                 protocol:string(_B14),
                                             {V2_zone_id, _B16} =
                                                 protocol:uint16(_B15),
                                             {V2_classes, _B17} =
                                                 protocol:uint32(_B16),
                                             {V2_name, _B18} =
                                                 protocol:string(_B17),
                                             {V2_sex, _B19} =
                                                 protocol:uint32(_B18),
                                             {V2_lev, _B20} =
                                                 protocol:uint32(_B19),
                                             {V2_new_id, _B21} =
                                                 protocol:uint32(_B20),
                                             {V2_max_id, _B22} =
                                                 protocol:uint32(_B21),
                                             {V2_new_title_id, _B23} =
                                                 protocol:uint32(_B22),
                                             {{V2_rid,
                                               V2_platform,
                                               V2_zone_id,
                                               V2_classes,
                                               V2_name,
                                               V2_sex,
                                               V2_lev,
                                               V2_new_id,
                                               V2_max_id,
                                               V2_new_title_id},
                                              _B23}
                                     end),
    {V1_is_beyond, _B26} = protocol:uint8(_B25),
    {V1_is_break, _B27} = protocol:uint8(_B26),
    {ok,
     {V1_result,
      V1_buff_id,
      V1_msg,
      V1_id,
      V1_time,
      V1_round,
      V1_title_id,
      V1_gl_list,
      V1_list,
      V1_is_beyond,
      V1_is_break}};
unpack(srv, 14424, _B0) -> {ok, {}};
unpack(cli, 14424, _B0) ->
    {V1_new_id, _B1} = protocol:uint32(_B0),
    {V1_new_title_id, _B2} = protocol:uint32(_B1),
    {V1_max_id, _B3} = protocol:uint32(_B2),
    {V1_mtime, _B4} = protocol:uint32(_B3),
    {V1_reset_time, _B5} = protocol:uint32(_B4),
    {V1_last_week, _B6} = protocol:uint32(_B5),
    {V1_day_reward, _B7} = protocol:uint32(_B6),
    {V1_day_times, _B8} = protocol:uint32(_B7),
    {V1_total_times, _B9} = protocol:uint32(_B8),
    {V1_lost_times, _B10} = protocol:uint32(_B9),
    {V1_end_time, _B11} = protocol:uint32(_B10),
    {V1_last_week_flag, _B12} = protocol:uint32(_B11),
    {V1_floor_num, _B13} = protocol:uint32(_B12),
    {ok,
     {V1_new_id,
      V1_new_title_id,
      V1_max_id,
      V1_mtime,
      V1_reset_time,
      V1_last_week,
      V1_day_reward,
      V1_day_times,
      V1_total_times,
      V1_lost_times,
      V1_end_time,
      V1_last_week_flag,
      V1_floor_num}};
unpack(srv, 14425, _B0) -> {ok, {}};
unpack(cli, 14425, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 14426, _B0) -> {ok, {}};
unpack(cli, 14426, _B0) ->
    {V1_list, _B14} = protocol:array(_B0,
                                     fun (_B1) ->
                                             {V2_rid, _B2} =
                                                 protocol:uint32(_B1),
                                             {V2_platform, _B3} =
                                                 protocol:string(_B2),
                                             {V2_zone_id, _B4} =
                                                 protocol:uint16(_B3),
                                             {V2_classes, _B5} =
                                                 protocol:uint32(_B4),
                                             {V2_name, _B6} =
                                                 protocol:string(_B5),
                                             {V2_sex, _B7} =
                                                 protocol:uint32(_B6),
                                             {V2_lev, _B8} =
                                                 protocol:uint32(_B7),
                                             {V2_new_id, _B9} =
                                                 protocol:uint32(_B8),
                                             {V2_max_id, _B10} =
                                                 protocol:uint32(_B9),
                                             {V2_new_title_id, _B11} =
                                                 protocol:uint32(_B10),
                                             {V2_mtime, _B12} =
                                                 protocol:uint32(_B11),
                                             {{V2_rid,
                                               V2_platform,
                                               V2_zone_id,
                                               V2_classes,
                                               V2_name,
                                               V2_sex,
                                               V2_lev,
                                               V2_new_id,
                                               V2_max_id,
                                               V2_new_title_id,
                                               V2_mtime},
                                              _B12}
                                     end),
    {ok, {V1_list}};
unpack(srv, 14427, _B0) -> {ok, {}};
unpack(cli, 14427, _B0) ->
    {V1_list, _B10} = protocol:array(_B0,
                                     fun (_B1) ->
                                             {V2_floor, _B2} =
                                                 protocol:uint32(_B1),
                                             {V2_role_list, _B8} =
                                                 protocol:array(_B2,
                                                                fun (_B3) ->
                                                                        {V3_rid,
                                                                         _B4} =
                                                                            protocol:uint32(_B3),
                                                                        {V3_platform,
                                                                         _B5} =
                                                                            protocol:string(_B4),
                                                                        {V3_zone_id,
                                                                         _B6} =
                                                                            protocol:uint16(_B5),
                                                                        {{V3_rid,
                                                                          V3_platform,
                                                                          V3_zone_id},
                                                                         _B6}
                                                                end),
                                             {{V2_floor, V2_role_list}, _B8}
                                     end),
    {ok, {V1_list}};
unpack(srv, 14428, _B0) ->
    {V1_floor, _B1} = protocol:uint32(_B0),
    {ok, {V1_floor}};
unpack(cli, 14428, _B0) ->
    {V1_floor, _B1} = protocol:uint32(_B0),
    {V1_list, _B19} = protocol:array(_B1,
                                     fun (_B2) ->
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
                                             {{V2_type,
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
    {ok, {V1_floor, V1_list}};
unpack(srv, 14429, _B0) -> {ok, {}};
unpack(cli, 14429, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(_Type, Code, _Data) ->
    {error, {unknown_unpack_command, Code}}.

