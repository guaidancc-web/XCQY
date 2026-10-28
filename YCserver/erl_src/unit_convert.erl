-file("src/mod/unit/unit_convert.erl", 1).

-module(unit_convert).

-export([to/2,
         dynamic_attr/4,
         init_talk/1,
         rand_talk/2]).

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

-file("src/mod/unit/unit_convert.erl", 17).

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

-file("src/mod/unit/unit_convert.erl", 18).

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

-file("src/mod/unit/unit_convert.erl", 19).

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

-file("src/mod/unit/unit_convert.erl", 20).

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

-file("src/mod/unit/unit_convert.erl", 21).

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

-file("src/mod/unit/unit_convert.erl", 22).

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

-file("src/mod/unit/unit_convert.erl", 23).

-file("inc/lev_break.hrl", 1).

-record(m_lev_break,
        {ver = 0,
         trial = 0 :: non_neg_integer(),
         done = 0 :: non_neg_integer(),
         times = 0 :: non_neg_integer(),
         attr_point = 0 :: non_neg_integer()}).

-file("src/mod/unit/unit_convert.erl", 24).

-spec to(Mode, Unit) -> {ok, tuple()} |
                        {error, {unit_convert_failure, atom()}} when Mode ::
                                                                         atom() |
                                                                         tuple(),
                                                                     Unit ::
                                                                         pos_integer() |
                                                                         #unit_data{} |
                                                                         #unit{}.

to(unit, UnitBaseId) ->
    case unit_data:get(UnitBaseId) of
        UnitData = #unit_data{} ->
            to({unit, {0, 0, 0}, [], ""}, UnitData);
        _ -> {error, {unit_convert_failure, to_unit}}
    end;
to({unit, Pos, Evt, Disabled}, UnitBaseId)
    when is_integer(UnitBaseId) ->
    case unit_data:get(UnitBaseId) of
        UnitData = #unit_data{} ->
            to({unit, Pos, Evt, Disabled}, UnitData);
        _ -> {error, {unit_convert_failure, to_unit}}
    end;
to(unit_base_id_to_fighter, UnitBaseId) ->
    case to(unit, UnitBaseId) of
        {ok, Unit} -> to(fighter, Unit);
        _Err ->
            logger:debug("_Err:~w", [_Err], unit_convert, 50),
            {error, {unit_convert_failure, unit_base_id_to_fighter}}
    end;
to({unit, {MapId, X, Y}, Evt, Disabled},
   #unit_data{id = BaseId, type = Type, fun_type = FunType,
              lev = Lev, status = Status, nature = Nature,
              name = Name, condition = Cond, speed = Speed,
              t_move = Tmove, t_atk = Tatk, range_trace = RangeTrace,
              range_atk = RangeAtk, talk = Talks, looks = Looks,
              data = Data, lock = Lock, def_status = DefStatus,
              activity = Activity, guide_lev = GuideLev,
              slave = Slave, formation = Formation,
              formation_lev = FormationLev, classes = Classes,
              sex = Sex}) ->
    Pos = #pos{map = MapId, x = X, y = Y},
    TmoveM = case Tmove > 1 of
                 true -> util:rand(Tmove * 1000, Tmove * 1000 + 1000);
                 false -> util:rand(3000, 5000)
             end,
    TatkM = case Tatk > 1 of
                true -> Tatk * 1000;
                false -> 3 * 1000
            end,
    {ok,
     #unit{base_id = BaseId, type = Type, fun_type = FunType,
           status = Status, lev = Lev, nature = Nature,
           name = Name, condition = Cond, speed = Speed,
           t_move = TmoveM, t_atk = TatkM,
           range_trace = RangeTrace, range_atk = RangeAtk,
           data = Data, looks = Looks, talk = Talks, lock = Lock,
           pos = Pos, evt = Evt, defxy = {MapId, X, Y},
           disabled = Disabled, def_status = DefStatus,
           activity = Activity, guide_lev = GuideLev,
           slave = Slave, formation = Formation,
           formation_lev = FormationLev, sex = Sex,
           classes = Classes}};
to(map_unit,
   #unit{id = Id, type = Type, status = Status,
         name = Name, base_id = BaseId, speed = Speed,
         pos = #pos{x = X, y = Y}, looks = Looks,
         activity = Activity, guide_lev = GuideLev, sex = Sex,
         classes = Classes, prop = Prop}) ->
    {ok,
     #map_unit{id = Id, type = Type, status = Status,
               name = Name, base_id = BaseId, speed = Speed, x = X,
               y = Y, looks = Looks, activity = Activity,
               guide_lev = GuideLev, sex = Sex, classes = Classes,
               prop = Prop}};
to(fighter,
   #unit{id = Id = {Rid, _}, pid = Pid, base_id = BaseId,
         name = Name, type = Type, lev = Lev, fun_type = FunType,
         looks = Looks, attr = Attr, ai_id = AiId, sex = Sex,
         classes = Classes}) ->
    PassiveSkillList = unit_data:get_skills(BaseId),
    logger:debug("单位被动技能=======~w====~ts==========：~w",
                 [BaseId, Name, PassiveSkillList],
                 unit_convert,
                 73),
    {Formation, FormationLev, Slave} = case
                                           unit_data:get(BaseId)
                                           of
                                           #unit_data{formation = ForId,
                                                      formation_lev = ForLev,
                                                      slave = Slave1} ->
                                               {ForId, ForLev, Slave1};
                                           _ -> {1, 1, []}
                                       end,
    NewAiId = case unit_data:get(BaseId) of
                  AiId1 when is_integer(AiId1) -> AiId1;
                  _ -> AiId
              end,
    PassiveSkillList1 = [{PassiveSkill, 1}
                         || PassiveSkill <- PassiveSkillList],
    Minit = #m_combat_init{skills = PassiveSkillList1},
    CombatTalk = init_talk(BaseId),
    {ok,
     #fighter{pid = Pid, rid = Rid, origin_id = Id,
              lev = Lev, sex = Sex, classes = Classes,
              base_id = BaseId, type = 2, unit_type = Type,
              unit_fun_type = FunType, name = Name, looks = Looks,
              attr = Attr, ai_id = NewAiId, slave = Slave,
              formation = Formation, formation_lev = FormationLev,
              m_init = Minit, combat_talk = CombatTalk,
              max_catch_num = 2}};
to(Type, Val) ->
    logger:error("转换失败:~w:~w",
                 [Type, Val],
                 unit_convert,
                 91),
    {error, {unit_convert_failure, Type}}.

init_talk(BaseId) ->
    case unit_data:unit_talk(BaseId) of
        #{show := Show, atk := Atk, dfd := Dfd, dead := Dead,
          escape := Escape} ->
            Show1 = case Show =:= "" of
                        true -> [];
                        false -> [{1, Show}]
                    end,
            Atk1 = case Atk =:= "" of
                       true -> [];
                       false -> [{2, Atk}]
                   end,
            Dfd1 = case Dfd =:= "" of
                       true -> [];
                       false -> [{3, Dfd}]
                   end,
            Dead1 = case Dead =:= "" of
                        true -> [];
                        false -> [{4, Dead}]
                    end,
            Escape1 = case Escape =:= "" of
                          true -> [];
                          false -> [{7, Escape}]
                      end,
            Show1 ++ Atk1 ++ Dfd1 ++ Dead1 ++ Escape1;
        _ -> []
    end.

rand_talk(BaseId, Type) ->
    case unit_data:unit_talk(BaseId) of
        #{show_rate := ShowRate, atk_rate := AtkRate,
          dfd_rate := DfdRate, dead_rate := DeadRate,
          escape_rate := EscapeRate} ->
            Rate = case Type of
                       1 -> ShowRate;
                       2 -> AtkRate;
                       3 -> DfdRate;
                       4 -> DeadRate;
                       7 -> EscapeRate;
                       _ -> 0
                   end,
            util:rand(1, 100) =< Rate;
        _Err -> false
    end.

dynamic_attr(CombatType,
             Fighter = #fighter{base_id = BaseId}, Both,
             CombatStartArgs) ->
    DynamicRatio = get_dynamic_ratio(CombatType,
                                     Fighter,
                                     Both,
                                     CombatStartArgs),
    LastRatio = check_ratio_range(CombatType,
                                  BaseId,
                                  DynamicRatio,
                                  CombatStartArgs),
    {SklAtk, SklPdef, SklMdef} = get_dynamic_skl(CombatType,
                                                 Fighter,
                                                 Both),
    {UnitSklAtk, UnitSklPdef, UnitSklMdef} =
        calc_unit_skl(BaseId, SklAtk, SklPdef, SklMdef),
    case unit_data:get_attr(BaseId, LastRatio) of
        {AttrList} when is_list(AttrList) ->
            Attr1 = do_dynamic_attr(LastRatio, AttrList),
            TAttr1 = do_dynamic_attr2(CombatType,
                                      Fighter,
                                      Both,
                                      CombatStartArgs,
                                      Attr1),
            Attr2 = calc_skl_attr(TAttr1,
                                  {UnitSklAtk, UnitSklPdef, UnitSklMdef}),
            {LastRatio, Attr2};
        _Err -> {0, #attr{}}
    end.

do_dynamic_attr2(60, _Fighter, _Both,
                 _CombatStartArgs = #combat_start_args{ext_args =
                                                           [_, _, FcFlag | _]},
                 Attr = #attr{hp_max = HpMax, phy_dmg = PhyDmg,
                              magic_dmg = MagicDmg}) ->
    logger:debug("===========爵位削弱：~w",
                 [FcFlag],
                 unit_convert,
                 163),
    Attr#attr{hp_max = round(HpMax * FcFlag / 100),
              phy_dmg = round(PhyDmg * FcFlag / 100),
              magic_dmg = round(MagicDmg * FcFlag / 100)};
do_dynamic_attr2(_, _, _, _, Attr) -> Attr.

calc_unit_skl(_BaseId, 0, 0, 0) -> {0, 0, 0};
calc_unit_skl(BaseId, SklAtk, SklPdef, SklMdef) ->
    case unit_data:get_skl(BaseId) of
        {SklAtkRatio, SklPdefRatio, SklMdefRatio} ->
            UnitSklAtk = round(SklPdef * SklAtkRatio / 200 +
                                   SklMdef * SklAtkRatio / 200),
            UnitSklPdef = round(SklAtk * SklPdefRatio / 100),
            UnitSklMdef = round(SklAtk * SklMdefRatio / 100),
            UnitSklAtk1 = util:check_range(UnitSklAtk, 0, 25),
            UnitSklPdef1 = util:check_range(UnitSklPdef, 0, 25),
            UnitSklMdef1 = util:check_range(UnitSklMdef, 0, 25),
            {UnitSklAtk1, UnitSklPdef1, UnitSklMdef1};
        _ -> {0, 0, 0}
    end.

calc_skl_attr(Attr, {0, 0, 0}) -> Attr;
calc_skl_attr(Attr = #attr{phy_dmg = PhyDmg,
                           magic_dmg = MagicDmg, phy_def = PhyDef,
                           magic_def = MagicDef, dmg_ratio = DmgRatio,
                           phy_def_ratio = PhyDefRatio,
                           magic_def_ratio = MagicDefRatio},
              {UnitSklAtk, UnitSklPdef, UnitSklMdef}) ->
    NewPhyDmg = PhyDmg + 15 * UnitSklAtk,
    NewMagicDmg = MagicDmg + 15 * UnitSklAtk,
    NewDmgRatio = DmgRatio + 30 * UnitSklAtk,
    NewPhyDef = PhyDef + 15 * UnitSklPdef,
    NewPhyDefRatio = PhyDefRatio + 30 * UnitSklPdef,
    NewMagicDef = MagicDef + 15 * UnitSklMdef,
    NewMagicDefRatio = MagicDefRatio + 30 * UnitSklMdef,
    Attr#attr{phy_dmg = NewPhyDmg, magic_dmg = NewMagicDmg,
              phy_def = NewPhyDef, magic_def = NewMagicDef,
              dmg_ratio = NewDmgRatio, phy_def_ratio = NewPhyDefRatio,
              magic_def_ratio = NewMagicDefRatio};
calc_skl_attr(Attr, _) -> Attr.

get_dynamic_ratio(3, _, {_Friend, Enemy},
                  _CombatStartArgs) ->
    AllLev = [Lev + 5 * Times
              || #fighter{lev = Lev,
                          m_lev_break = #m_lev_break{times = Times}}
                     <- Enemy],
    AvgLev = util:list_avg(AllLev),
    AvgLev;
get_dynamic_ratio(17, _, {_Friend, Enemy},
                  _CombatStartArgs) ->
    AllLev = [Lev + 5 * Times
              || #fighter{lev = Lev,
                          m_lev_break = #m_lev_break{times = Times}}
                     <- Enemy],
    case AllLev of
        [_ | _] ->
            AvgLev = util:list_avg(AllLev),
            Max = lists:max(AllLev),
            Val = round(AvgLev * 2.0e-1 + Max * 8.0e-1),
            Val;
        _ -> 30
    end;
get_dynamic_ratio(36, _, {_Friend, Enemy},
                  _CombatStartArgs) ->
    AllLev = [Lev + 5 * Times
              || #fighter{lev = Lev,
                          m_lev_break = #m_lev_break{times = Times}}
                     <- Enemy],
    case AllLev of
        [_ | _] -> util:list_avg(AllLev);
        _ -> 30
    end;
get_dynamic_ratio(26, _, {_Friend, Enemy},
                  _CombatStartArgs) ->
    AllLev = [Lev + 5 * Times
              || #fighter{lev = Lev,
                          m_lev_break = #m_lev_break{times = Times}}
                     <- Enemy],
    case AllLev of
        [_ | _] ->
            AvgLev = util:list_avg(AllLev),
            Max = lists:max(AllLev),
            Val = round(AvgLev * 5.0e-1 + Max * 5.0e-1),
            Val;
        _ -> 30
    end;
get_dynamic_ratio(_, #fighter{unit_fun_type = 11},
                  {_Friend, Enemy}, _CombatStartArgs) ->
    AllLev = [Lev + 5 * Times
              || #fighter{lev = Lev,
                          m_lev_break = #m_lev_break{times = Times}}
                     <- Enemy],
    case AllLev of
        [_ | _] ->
            AvgLev = util:list_avg(AllLev),
            Min = lists:min(AllLev),
            Val = round(AvgLev * 8.0e-1 + Min * 2.0e-1),
            Val;
        _ -> 30
    end;
get_dynamic_ratio(_, #fighter{unit_fun_type = 3},
                  {_Friend, Enemy}, _CombatStartArgs) ->
    AllLev = [Lev + 5 * Times
              || #fighter{lev = Lev,
                          m_lev_break = #m_lev_break{times = Times}}
                     <- Enemy],
    case AllLev of
        [_ | _] ->
            AvgLev = util:list_avg(AllLev),
            Max = lists:max(AllLev),
            Val = round(AvgLev * 6.99999999999999955591e-1 +
                            Max * 2.99999999999999988898e-1),
            Val;
        _ -> 30
    end;
get_dynamic_ratio(18, _, {_Friend, Enemy},
                  _CombatStartArgs) ->
    AllLev = [Lev + 5 * Times
              || #fighter{lev = Lev,
                          m_lev_break = #m_lev_break{times = Times}}
                     <- Enemy],
    case AllLev of
        [_ | _] ->
            AvgLev = util:list_avg(AllLev),
            Max = lists:max(AllLev),
            Val = round(AvgLev * 4.0e-1 +
                            Max * 5.99999999999999977796e-1),
            Val;
        _ -> 30
    end;
get_dynamic_ratio(11, _, {_Friend, Enemy},
                  _CombatStartArgs) ->
    AllLev = [Lev + 5 * Times
              || #fighter{lev = Lev,
                          m_lev_break = #m_lev_break{times = Times}}
                     <- Enemy],
    case AllLev of
        [_ | _] ->
            AvgLev = util:list_avg(AllLev),
            Min = lists:min(AllLev),
            Max = lists:max(AllLev),
            case [F || F = #fighter{type = 1} <- Enemy] of
                [#fighter{m_dungeon = #m_dungeon{dun_id = DunId}}
                 | _] ->
                    case dungeon_data:get(DunId) of
                        #dungeon_base{type = 5} ->
                            round(AvgLev * 5.0e-1 + Max * 5.0e-1);
                        _ -> round(AvgLev * 5.0e-1 + Min * 5.0e-1)
                    end;
                _ -> round(AvgLev * 5.0e-1 + Min * 5.0e-1)
            end;
        _ -> 30
    end;
get_dynamic_ratio(24, _, {_Friend, Enemy},
                  _CombatStartArgs) ->
    AllLev = [Lev + 5 * Times
              || #fighter{lev = Lev,
                          m_lev_break = #m_lev_break{times = Times}}
                     <- Enemy],
    case AllLev of
        [_ | _] ->
            AvgLev = util:list_avg(AllLev),
            Max = lists:max(AllLev),
            Val = round(AvgLev * 4.0e-1 +
                            Max * 5.99999999999999977796e-1),
            Val;
        _ -> 30
    end;
get_dynamic_ratio(39, _, {_Friend, Enemy},
                  _CombatStartArgs) ->
    AllLev = [Lev + 5 * Times
              || #fighter{lev = Lev,
                          m_lev_break = #m_lev_break{times = Times}}
                     <- Enemy],
    case AllLev of
        [_ | _] ->
            AvgLev = util:list_avg(AllLev),
            Max = lists:max(AllLev),
            Val = round(AvgLev * 5.99999999999999977796e-1 +
                            Max * 4.0e-1),
            Val;
        _ -> 30
    end;
get_dynamic_ratio(32, _, {_Friend, Enemy},
                  _CombatStartArgs) ->
    AllLev = [Lev + 5 * Times
              || #fighter{lev = Lev,
                          m_lev_break = #m_lev_break{times = Times}}
                     <- Enemy],
    case AllLev of
        [_ | _] ->
            AvgLev = util:list_avg(AllLev),
            Max = lists:max(AllLev),
            Val = round(AvgLev * 4.0e-1 +
                            Max * 5.99999999999999977796e-1),
            Val;
        _ -> 30
    end;
get_dynamic_ratio(22, _, {_Friend, AllLev},
                  _CombatStartArgs) ->
    AllLev;
get_dynamic_ratio(33, _, {_Friend, Enemy},
                  _CombatStartArgs) ->
    AllLev = [Lev + 5 * Times
              || #fighter{lev = Lev,
                          m_lev_break = #m_lev_break{times = Times}}
                     <- Enemy],
    MaxLev = lists:max(AllLev),
    erlang:max(30, MaxLev - 5);
get_dynamic_ratio(61, _, {_Friend, Enemy},
                  _CombatStartArgs) ->
    AllLev = [Lev + 5 * Times
              || #fighter{lev = Lev,
                          m_lev_break = #m_lev_break{times = Times}}
                     <- Enemy],
    case AllLev of
        [_ | _] ->
            AvgLev = util:list_avg(AllLev),
            Max = lists:max(AllLev),
            Val = round(AvgLev * 2.99999999999999988898e-1 +
                            Max * 6.99999999999999955591e-1),
            Val;
        _ -> 30
    end;
get_dynamic_ratio(62, _, {_Friend, Enemy},
                  _CombatStartArgs) ->
    AllLev = [Lev + 5 * Times
              || #fighter{lev = Lev,
                          m_lev_break = #m_lev_break{times = Times}}
                     <- Enemy],
    case AllLev of
        [_ | _] ->
            AvgLev = util:list_avg(AllLev),
            Max = lists:max(AllLev),
            Val = round(AvgLev * 2.99999999999999988898e-1 +
                            Max * 6.99999999999999955591e-1),
            Val;
        _ -> 30
    end;
get_dynamic_ratio(69, _, {_Friend, Enemy},
                  _CombatStartArgs) ->
    AllLev = [Lev + 5 * Times
              || #fighter{lev = Lev,
                          m_lev_break = #m_lev_break{times = Times}}
                     <- Enemy],
    case AllLev of
        [_ | _] ->
            AvgLev = util:list_avg(AllLev),
            Max = lists:max(AllLev),
            Val = round(AvgLev * 2.99999999999999988898e-1 +
                            Max * 6.99999999999999955591e-1),
            Val;
        _ -> 30
    end;
get_dynamic_ratio(70, _, {_Friend, Enemy},
                  _CombatStartArgs) ->
    AllLev = [Lev + 5 * Times
              || #fighter{lev = Lev,
                          m_lev_break = #m_lev_break{times = Times}}
                     <- Enemy],
    case AllLev of
        [_ | _] ->
            AvgLev = util:list_avg(AllLev),
            Max = lists:max(AllLev),
            Val = round(AvgLev * 2.99999999999999988898e-1 +
                            Max * 6.99999999999999955591e-1),
            Val;
        _ -> 30
    end;
get_dynamic_ratio(CombatType, _, {_Friend, _AllLev},
                  #combat_start_args{ext_args = ExtArgs})
    when CombatType =:= 15 orelse CombatType =:= 25 ->
    case lists:keyfind(leader_lev, 1, ExtArgs) of
        {_, LeaderLev} -> LeaderLev;
        _ -> 30
    end;
get_dynamic_ratio(CombatType, _, {_Friend, Enemy},
                  _CombatStartArgs)
    when CombatType =:= 43 ->
    AllLev = [Lev + 5 * Times
              || #fighter{lev = Lev,
                          m_lev_break = #m_lev_break{times = Times}}
                     <- Enemy],
    case AllLev of
        [_ | _] ->
            AvgLev = util:list_avg(AllLev),
            Min = lists:min(AllLev),
            Max = lists:max(AllLev),
            case [F || F = #fighter{type = 1} <- Enemy] of
                [#fighter{m_dungeon = #m_dungeon{dun_id = DunId}}
                 | _] ->
                    case dungeon_data:get(DunId) of
                        #dungeon_base{type = 5} ->
                            round(AvgLev * 5.0e-1 + Max * 5.0e-1);
                        _ -> round(AvgLev * 5.0e-1 + Min * 5.0e-1)
                    end;
                _ -> round(AvgLev * 5.0e-1 + Min * 5.0e-1)
            end;
        _ -> 30
    end;
get_dynamic_ratio(63, _, {_Friend, Enemy},
                  _CombatStartArgs) ->
    AllLev = [Lev + 5 * Times
              || #fighter{lev = Lev,
                          m_lev_break = #m_lev_break{times = Times}}
                     <- Enemy],
    case AllLev of
        [_ | _] ->
            AvgLev = util:list_avg(AllLev),
            Max = lists:max(AllLev),
            Val = round(AvgLev * 2.99999999999999988898e-1 +
                            Max * 6.99999999999999955591e-1),
            Val;
        _ -> 30
    end;
get_dynamic_ratio(68, _, {_Friend, Enemy},
                  _CombatStartArgs) ->
    AllLev = [Lev + 5 * Times
              || #fighter{lev = Lev,
                          m_lev_break = #m_lev_break{times = Times}}
                     <- Enemy],
    case AllLev of
        [_ | _] -> lists:max(AllLev);
        _ -> 65
    end;
get_dynamic_ratio(72, _, {_Friend, Enemy},
                  _CombatStartArgs) ->
    AllLev = [Lev + 5 * Times
              || #fighter{lev = Lev,
                          m_lev_break = #m_lev_break{times = Times}}
                     <- Enemy],
    case AllLev of
        [_ | _] -> lists:max(AllLev);
        _ -> 65
    end;
get_dynamic_ratio(_CombatType, _Fighter,
                  {_Friend, Enemy}, _CombatStartArgs) ->
    AllLev = [Lev + 5 * Times
              || #fighter{lev = Lev,
                          m_lev_break = #m_lev_break{times = Times}}
                     <- Enemy],
    AvgLev = util:list_avg(AllLev),
    AvgLev.

get_dynamic_skl(CombatType, _Fighter, {_Friend, Enemy})
    when CombatType =:= 17 orelse
             CombatType =:= 39 orelse
                 CombatType =:= 5 orelse
                     CombatType =:= 3 orelse
                         CombatType =:= 9 orelse
                             CombatType =:= 16 orelse
                                 CombatType =:= 26 orelse
                                     CombatType =:= 13 orelse
                                         CombatType =:= 21 orelse
                                             CombatType =:= 11 orelse
                                                 CombatType =:= 43 orelse
                                                     CombatType =:= 36 orelse
                                                         CombatType =:= 2 orelse
                                                             CombatType =:= 15
                                                                 orelse
                                                                 CombatType =:=
                                                                     45
                                                                     orelse
                                                                     CombatType
                                                                         =:= 48
                                                                         orelse
                                                                         CombatType
                                                                             =:=
                                                                             47
                                                                             orelse
                                                                             CombatType
                                                                                 =:=
                                                                                 56
                                                                                 orelse
                                                                                 CombatType
                                                                                     =:=
                                                                                     57
                                                                                     orelse
                                                                                     CombatType
                                                                                         =:=
                                                                                         1
                                                                                         orelse
                                                                                         CombatType
                                                                                             =:=
                                                                                             60
                                                                                             orelse
                                                                                             CombatType
                                                                                                 =:=
                                                                                                 61
                                                                                                 orelse
                                                                                                 CombatType
                                                                                                     =:=
                                                                                                     62
                                                                                                     orelse
                                                                                                     CombatType
                                                                                                         =:=
                                                                                                         65
                                                                                                         orelse
                                                                                                         CombatType
                                                                                                             =:=
                                                                                                             66
                                                                                                             orelse
                                                                                                             CombatType
                                                                                                                 =:=
                                                                                                                 63
                                                                                                                 orelse
                                                                                                                 CombatType
                                                                                                                     =:=
                                                                                                                     67
                                                                                                                     orelse
                                                                                                                     CombatType
                                                                                                                         =:=
                                                                                                                         68
                                                                                                                         orelse
                                                                                                                         CombatType
                                                                                                                             =:=
                                                                                                                             69
                                                                                                                             orelse
                                                                                                                             CombatType
                                                                                                                                 =:=
                                                                                                                                 70
                                                                                                                                 orelse
                                                                                                                                 CombatType
                                                                                                                                     =:=
                                                                                                                                     71
                                                                                                                                     orelse
                                                                                                                                     CombatType
                                                                                                                                         =:=
                                                                                                                                         72 ->
    AllSklAtk = [Lev
                 || #fighter{skill_prac_atk = Lev} <- Enemy],
    AllSklPdef = [Lev
                  || #fighter{skill_prac_phy_def = Lev} <- Enemy],
    AllSklMdef = [Lev
                  || #fighter{skill_prac_magic_def = Lev} <- Enemy],
    SklAtk = case AllSklAtk of
                 [_ | _] ->
                     AvgAtkLev = util:list_avg(AllSklAtk),
                     AtkMax = lists:max(AllSklAtk),
                     Val1 = round(AvgAtkLev * 6.99999999999999955591e-1 +
                                      AtkMax * 2.99999999999999988898e-1),
                     Val1;
                 _ -> 0
             end,
    SklPdef = case AllSklPdef of
                  [_ | _] ->
                      AvgPdefLev = util:list_avg(AllSklPdef),
                      PdefMax = lists:max(AllSklPdef),
                      Val2 = round(AvgPdefLev * 6.99999999999999955591e-1 +
                                       PdefMax * 2.99999999999999988898e-1),
                      Val2;
                  _ -> 0
              end,
    SklMdef = case AllSklMdef of
                  [_ | _] ->
                      AvgMdefLev = util:list_avg(AllSklMdef),
                      MdefMax = lists:max(AllSklMdef),
                      Val3 = round(AvgMdefLev * 6.99999999999999955591e-1 +
                                       MdefMax * 2.99999999999999988898e-1),
                      Val3;
                  _ -> 0
              end,
    {SklAtk, SklPdef, SklMdef};
get_dynamic_skl(_CombatType, _Fighter,
                {_Friend, _Enemy}) ->
    {0, 0, 0}.

check_ratio_range(26, BaseId, DynamicRatio,
                  #combat_start_args{ext_args = {_, NeedLev}}) ->
    case constellation_data:get_unit({NeedLev, BaseId}) of
        #{min_attr_ratio := 0, max_attr_ratio := 0} ->
            DynamicRatio;
        #{min_attr_ratio := MinRatio,
          max_attr_ratio := MaxRatio} ->
            util:check_range(DynamicRatio, MinRatio, MaxRatio);
        _ -> DynamicRatio
    end;
check_ratio_range(_CombatType, BaseId, DynamicRatio,
                  _) ->
    case unit_data:get_attr_ratio(BaseId) of
        {0, 0} -> DynamicRatio;
        {MinRatio, MaxRatio} ->
            util:check_range(DynamicRatio, MinRatio, MaxRatio);
        _ -> DynamicRatio
    end.

do_dynamic_attr(DynamicRatio, AttrList) ->
    do_dynamic_attr(DynamicRatio, AttrList, #attr{}).

do_dynamic_attr(_DynamicRatio, [], Attr) -> Attr;
do_dynamic_attr(DynamicRatio, [{_, 0, _Ra, _Rb} | T],
                Attr) ->
    do_dynamic_attr(DynamicRatio, T, Attr);
do_dynamic_attr(DynamicRatio, [{1, Val, Ra, Rb} | T],
                Attr) ->
    HpMax = round(Ra / 10 * DynamicRatio * DynamicRatio +
                      Rb / 10 * DynamicRatio
                      + Val),
    do_dynamic_attr(DynamicRatio,
                    T,
                    Attr#attr{hp_max = HpMax});
do_dynamic_attr(DynamicRatio, [{2, Val, Ra, Rb} | T],
                Attr) ->
    MpMax = round(Ra / 10 * DynamicRatio * DynamicRatio +
                      Rb / 10 * DynamicRatio
                      + Val),
    do_dynamic_attr(DynamicRatio,
                    T,
                    Attr#attr{mp_max = MpMax});
do_dynamic_attr(DynamicRatio, [{3, Val, Ra, Rb} | T],
                Attr) ->
    AtkSpeed = round(Ra / 10 * DynamicRatio * DynamicRatio +
                         Rb / 10 * DynamicRatio
                         + Val),
    do_dynamic_attr(DynamicRatio,
                    T,
                    Attr#attr{atk_speed = AtkSpeed});
do_dynamic_attr(DynamicRatio, [{4, Val, Ra, Rb} | T],
                Attr) ->
    PhyDmg = round(Ra / 10 * DynamicRatio * DynamicRatio +
                       Rb / 10 * DynamicRatio
                       + Val),
    do_dynamic_attr(DynamicRatio,
                    T,
                    Attr#attr{phy_dmg = PhyDmg});
do_dynamic_attr(DynamicRatio, [{5, Val, Ra, Rb} | T],
                Attr) ->
    MagicDmg = round(Ra / 10 * DynamicRatio * DynamicRatio +
                         Rb / 10 * DynamicRatio
                         + Val),
    do_dynamic_attr(DynamicRatio,
                    T,
                    Attr#attr{magic_dmg = MagicDmg});
do_dynamic_attr(DynamicRatio, [{6, Val, Ra, Rb} | T],
                Attr) ->
    PhyDef = round(Ra / 10 * DynamicRatio * DynamicRatio +
                       Rb / 10 * DynamicRatio
                       + Val),
    do_dynamic_attr(DynamicRatio,
                    T,
                    Attr#attr{phy_def = PhyDef});
do_dynamic_attr(DynamicRatio, [{7, Val, Ra, Rb} | T],
                Attr) ->
    MagicDef = round(Ra / 10 * DynamicRatio * DynamicRatio +
                         Rb / 10 * DynamicRatio
                         + Val),
    do_dynamic_attr(DynamicRatio,
                    T,
                    Attr#attr{magic_def = MagicDef});
do_dynamic_attr(DynamicRatio, [{8, Val, Ra, Rb} | T],
                Attr) ->
    Crit = round(Ra / 10 * DynamicRatio * DynamicRatio +
                     Rb / 10 * DynamicRatio
                     + Val),
    do_dynamic_attr(DynamicRatio,
                    T,
                    Attr#attr{crit = Crit});
do_dynamic_attr(DynamicRatio, [{9, Val, Ra, Rb} | T],
                Attr) ->
    Tenacity = round(Ra / 10 * DynamicRatio * DynamicRatio +
                         Rb / 10 * DynamicRatio
                         + Val),
    do_dynamic_attr(DynamicRatio,
                    T,
                    Attr#attr{tenacity = Tenacity});
do_dynamic_attr(DynamicRatio, [{10, Val, Ra, Rb} | T],
                Attr) ->
    Accuracy = round(Ra / 10 * DynamicRatio * DynamicRatio +
                         Rb / 10 * DynamicRatio
                         + Val),
    do_dynamic_attr(DynamicRatio,
                    T,
                    Attr#attr{accuracy = Accuracy});
do_dynamic_attr(DynamicRatio, [{11, Val, Ra, Rb} | T],
                Attr) ->
    Evasion = round(Ra / 10 * DynamicRatio * DynamicRatio +
                        Rb / 10 * DynamicRatio
                        + Val),
    do_dynamic_attr(DynamicRatio,
                    T,
                    Attr#attr{evasion = Evasion});
do_dynamic_attr(DynamicRatio, [{21, Val, Ra, Rb} | T],
                Attr) ->
    HolyDmg = round(Ra / 10 * DynamicRatio * DynamicRatio +
                        Rb / 10 * DynamicRatio
                        + Val),
    do_dynamic_attr(DynamicRatio,
                    T,
                    Attr#attr{holy_dmg = HolyDmg});
do_dynamic_attr(DynamicRatio, [{23, Val, Ra, Rb} | T],
                Attr) ->
    DmgRatio = round(Ra / 10 * DynamicRatio * DynamicRatio +
                         Rb / 10 * DynamicRatio
                         + Val),
    do_dynamic_attr(DynamicRatio,
                    T,
                    Attr#attr{dmg_ratio = DmgRatio});
do_dynamic_attr(DynamicRatio, [{24, Val, Ra, Rb} | T],
                Attr) ->
    DefRatio = round(Ra / 10 * DynamicRatio * DynamicRatio +
                         Rb / 10 * DynamicRatio
                         + Val),
    do_dynamic_attr(DynamicRatio,
                    T,
                    Attr#attr{def_ratio = DefRatio});
do_dynamic_attr(DynamicRatio, [{25, Val, Ra, Rb} | T],
                Attr) ->
    EnhanceControl = round(Ra / 10 * DynamicRatio *
                               DynamicRatio
                               + Rb / 10 * DynamicRatio
                               + Val),
    do_dynamic_attr(DynamicRatio,
                    T,
                    Attr#attr{enhance_control = EnhanceControl});
do_dynamic_attr(DynamicRatio, [{26, Val, Ra, Rb} | T],
                Attr) ->
    AntiControl = round(Ra / 10 * DynamicRatio *
                            DynamicRatio
                            + Rb / 10 * DynamicRatio
                            + Val),
    do_dynamic_attr(DynamicRatio,
                    T,
                    Attr#attr{anti_control = AntiControl});
do_dynamic_attr(DynamicRatio, [A | T], Attr) ->
    logger:error("无法解析的单位属性:~w", [A], unit_convert, 585),
    do_dynamic_attr(DynamicRatio, T, Attr).

