-file("src/mod/pet/pet.erl", 1).

-module(pet).

-export([login/1,
         delay_login/1,
         create/2,
         war/2,
         rest/2,
         init/0,
         add_exp/2,
         calc_pet_exp/1,
         loss_happy/4,
         rand_aptitude/3,
         addpoint/3,
         setpoint/3,
         rename_pet/3,
         free/2,
         can_catch/2,
         add_pet_nums/1,
         get_look/1,
         get_war_pet/1,
         check_nums/1,
         del_pet/3,
         level_up_pet/2,
         exchange/2,
         exchange_spec/2,
         genre_ratio/1,
         find_pet/2,
         find_pet_by_base_id/2,
         exchange/3,
         refining/3,
         push_10502/2,
         push_10503/2,
         push_10504/2,
         push_10511/2,
         push_10512/2,
         push_10525/2,
         push_10555/2,
         push_10566/3,
         get_fresh/1,
         levup/3,
         max_talent_pet/1,
         max_fc_pet/1,
         learn_normal_skill/1,
         reset_point/2,
         gm_set_pet_lev/2,
         push_aptitude/1,
         rpc_save_tmp_aptitude/2,
         apply_evt/2,
         calc_point_ratio/2,
         unreal/3,
         unreal_down/3,
         timer_tick/2,
         adm_show/1,
         push_month_card_washing_times/1,
         send_gold_pet_mail/0,
         change_unreal_loooks/3,
         check_exchange_skill/1,
         all_login/0,
         repaire_fresh/1]).

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

-file("src/mod/pet/pet.erl", 84).

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

-file("src/mod/pet/pet.erl", 85).

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

-file("src/mod/pet/pet.erl", 86).

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

-file("src/mod/pet/pet.erl", 87).

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

-file("src/mod/pet/pet.erl", 88).

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

-file("src/mod/pet/pet.erl", 89).

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

-file("src/mod/pet/pet.erl", 90).

-file("inc/looks.hrl", 1).

-file("src/mod/pet/pet.erl", 91).

-file("inc/link.hrl", 1).

-record(link,
        {socket :: undefined | port(),
         conn_pid :: undefined | pid(),
         ip = {0, 0, 0, 0} :: {0..255, 0..255, 0..255, 0..255},
         port = 0 :: non_neg_integer(),
         lag = 0 :: non_neg_integer()}).

-file("src/mod/pet/pet.erl", 92).

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

-file("src/mod/pet/pet.erl", 93).

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

-file("src/mod/pet/pet.erl", 94).

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

-file("src/mod/pet/pet.erl", 95).

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

-file("src/mod/pet/pet.erl", 96).

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

-file("src/mod/pet/pet.erl", 97).

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

-file("src/mod/pet/pet.erl", 98).

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

-file("src/mod/pet/pet.erl", 99).

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

-file("src/mod/pet/pet.erl", 100).

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

-file("src/mod/pet/pet.erl", 101).

-file("inc/timer.hrl", 1).

-record(timer,
        {id :: undefined | term(),
         timeout = 1000 :: pos_integer(),
         m :: undefined | atom(),
         f :: undefined | function() | atom(),
         a = [] :: [term()],
         times = 1 :: integer(),
         next_tick = 0 :: non_neg_integer(),
         set_time = 1 :: pos_integer()}).

-record(rtimer,
        {ref :: undefined | reference(),
         key :: undefined | reference(),
         timers = [] :: [#timer{}]}).

-record(s_timer,
        {ref :: undefined | reference(),
         timers = [] :: [#timer{}]}).

-file("src/mod/pet/pet.erl", 102).

-file("inc/camp_pet_egg.hrl", 1).

-author("Lith").

-file("src/mod/pet/pet.erl", 103).

-file("inc/package.hrl", 1).

-record(package,
        {type = 1 :: integer(),
         next_id = 1 :: pos_integer(),
         volume = 0 :: non_neg_integer(),
         free_cell = [] :: list(),
         items = [] :: [tuple()]}).

-file("src/mod/pet/pet.erl", 104).

init() -> #m_pet{}.

login(Role) ->
    PetMaxExpRole = #role{m_pet = #m_pet{pets = Pets},
                          m_pet_store = #m_pet_store{pets = Pets1}} =
                        update_max_exp(Role),
    NRole = pet_attr:batch_calc(Pets, PetMaxExpRole),
    NRole1 = pet_attr:batch_calc_store(Pets1, NRole),
    {ok, TNRole1} = timer_tick(NRole1, pet_unreal),
    {_, NRole2} = role_trigger:add([#trigger{label =
                                                 evt_mount_attr,
                                             a = [], m = pet, f = apply_evt}],
                                   TNRole1),
    NRole3 = pet_rune:login(NRole2),
    {ok, NRole3}.

delay_login(Role = #role{lev = Lev,
                         m_pet = #m_pet{pets = Pets}}) ->
    {ok, Role1} = case var:get_var(Role, other, 2105, 0) of
                      1 -> {ok, Role};
                      _ ->
                          VarRole = var:set_var(Role, other, 2105, 1),
                          case lists:keymember(20007, #pet.base_id, Pets) of
                              true ->
                                  Title = lang:get("天马相随礼"),
                                  Content =
                                      lang:get("神兽家族要加入新成员啦，感谢主人这一路陪伴着小马一起成长，一起见证星辰世界的美好。下面是小"
                                               "马精心准备的小礼物，希望主人喜欢"),
                                  mail:send(VarRole,
                                            Title,
                                            Content,
                                            [{29890, 3}]),
                                  {ok, VarRole};
                              _ ->
                                  VarRole = var:set_var(Role, other, 2105, 1),
                                  {ok, VarRole}
                          end
                  end,
    case var:get_var(Role1, other, 2136, 0) of
        1 -> ok;
        0 when Lev >= 70 andalso Lev =< 79 ->
            VarRole2 = var:set_var(Role1, other, 2136, 1),
            case check_lev70_gift_item(VarRole2) of
                true -> {ok, VarRole2};
                _ ->
                    Title2 = lang:get("70级礼包雷暴道具补发"),
                    Content2 =
                        lang:get("亲爱的玩家：\n本次版本更新后，70级等级大礼包新增了珍稀6技能<color='#ffff"
                                 "00'>变异·雷暴</color>，等级到达后即可领取；由于你近期已领取了70级大礼包，现"
                                 "补偿你<color='#ffff00'>变异·雷暴</color>，请查收{face_1,"
                                 "6}"),
                    mail:send(VarRole2, Title2, Content2, [{20185, 1}]),
                    {ok, VarRole2}
            end;
        _ ->
            VarRole3 = var:set_var(Role1, other, 2136, 1),
            {ok, VarRole3}
    end.

create(Role, CreateArgs) ->
    create(Role, CreateArgs, []).

create(Role = #role{m_pet =
                        Mpet = #m_pet{pets = Pets, next_id = NextId}},
       CreateArgs, ExtraList) ->
    case check_can_create(Role, CreateArgs) of
        true ->
            case do_create(CreateArgs) of
                {ok, TPet = #pet{}} ->
                    {ok,
                     Pet = #pet{base_id = BaseId, genre = Genre, lev = Lev,
                                status = Status, talent = Talent,
                                skills = Skills, stones = Stones}} =
                        do_create_extra(TPet, ExtraList),
                    NewSkills = pet_stone:calc_stone_skill(Skills, Stones),
                    Pet1 = Pet#pet{id = NextId, skills = NewSkills},
                    ToLev = max(1, maps:get(lev, CreateArgs, 1)),
                    Pet2 = pet_auto_levup(Role, Pet1, ToLev),
                    {ok, NewPet, Role1} = pet_attr:calc(Pet2, Role),
                    {ok, NewPet1, Role2} = auto_add_point(NewPet,
                                                          Role1,
                                                          CreateArgs),
                    NewMpet = Mpet#m_pet{pets = [NewPet1 | Pets],
                                         next_id = NextId + 1},
                    NewRole = Role2#role{m_pet = NewMpet},
                    push_10504(NewRole, NewPet1),
                    log:pet(NewRole, "获得宠物", [], NewPet1),
                    CreateArgs1 = case BaseId of
                                      10000 -> CreateArgs#{auto_war => 1};
                                      _ -> CreateArgs
                                  end,
                    NewRole1 = auto_war(NextId, NewRole, CreateArgs1),
                    IsCatched = case CreateArgs of
                                    #{is_catched := IsC} -> IsC;
                                    _ -> false
                                end,
                    Evts = [#evt_get_pet{base_id = BaseId, genre = Genre,
                                         lev = Lev, status = Status,
                                         is_catched = IsCatched,
                                         talent = Talent},
                            #evt_pet{}],
                    log:pet_create(NewRole1, Role, NewPet1, CreateArgs),
                    {ok, role_trigger:fire(Evts, NewRole1)};
                {false, Reason} -> {false, Reason}
            end;
        {false, Reason} -> {false, Reason}
    end.

do_create_extra(Pet, []) -> {ok, Pet};
do_create_extra(Pet, [{lev, Val} | T]) ->
    do_create_extra(Pet#pet{lev = Val}, T);
do_create_extra(Pet, [{exp, Val} | T]) ->
    do_create_extra(Pet#pet{exp = Val}, T);
do_create_extra(Pet, [{max_exp, Val} | T]) ->
    do_create_extra(Pet#pet{max_exp = Val}, T);
do_create_extra(Pet = #pet{pet_attr = Attr},
                [{point, Val} | T]) ->
    do_create_extra(Pet#pet{pet_attr =
                                Attr#pet_attr{point = Val}},
                    T);
do_create_extra(Pet = #pet{pet_attr = Attr},
                [{p_str, Val} | T]) ->
    do_create_extra(Pet#pet{pet_attr =
                                Attr#pet_attr{p_str = Val}},
                    T);
do_create_extra(Pet = #pet{pet_attr = Attr},
                [{p_con, Val} | T]) ->
    do_create_extra(Pet#pet{pet_attr =
                                Attr#pet_attr{p_con = Val}},
                    T);
do_create_extra(Pet = #pet{pet_attr = Attr},
                [{p_mag, Val} | T]) ->
    do_create_extra(Pet#pet{pet_attr =
                                Attr#pet_attr{p_mag = Val}},
                    T);
do_create_extra(Pet = #pet{pet_attr = Attr},
                [{p_agi, Val} | T]) ->
    do_create_extra(Pet#pet{pet_attr =
                                Attr#pet_attr{p_agi = Val}},
                    T);
do_create_extra(Pet = #pet{pet_attr = Attr},
                [{p_end, Val} | T]) ->
    do_create_extra(Pet#pet{pet_attr =
                                Attr#pet_attr{p_end = Val}},
                    T);
do_create_extra(Pet, [{stone, Stones} | T]) ->
    do_create_extra(Pet#pet{stones = Stones}, T).

war(Role = #role{m_pet = Mpet = #m_pet{pets = Pets}},
    Id) ->
    case lists:keyfind(Id, #pet.id, Pets) of
        #pet{happy = Happy} when Happy < 50 ->
            {false, lang:get("宠物寿命不足50, 无法出战")};
        #pet{spirit_attached_id = SpiritAttachedId,
             spirit_child_flag = SpiritChildFlag}
            when SpiritAttachedId =/= 0 orelse
                     SpiritChildFlag =/= 0 ->
            {false, lang:get("附灵宠物不能出战")};
        #pet{genre = 3} ->
            Msg = notice:format(lang:get("野生宠物不能出战, 可先将其~ts成宝宝"),
                                [{string_2, 5, lang:get("洗髓")}]),
            {false, Msg};
        Pet = #pet{status = 0, base_id = BaseId, grade = Grade,
                   spirit_attached = SpiritAttached} ->
            case SpiritAttached of
                1 ->
                    case lists:keyfind(Id, #pet.spirit_attached_id, Pets) of
                        #pet{talent = SpiritPetTalent,
                             base_id = SpiritBaseId} ->
                            case pet_data:get_attach_ratio(SpiritBaseId,
                                                           SpiritPetTalent)
                                of
                                {0, _} ->
                                    NoticeMsg =
                                        notice:format(lang:get("附灵宠物评分不足，~ts{face_1,2}"),
                                                      [{string_2,
                                                        5,
                                                        lang:get("附灵失效")}]),
                                    notice:return(NoticeMsg),
                                    ok;
                                _ -> ok
                            end;
                        _ -> ok
                    end;
                _ -> ok
            end,
            NewPet = Pet#pet{status = 1},
            Pets1 = reset(Role, Pets, 1, 0),
            Pets2 = [NewPet | lists:keydelete(Id, #pet.id, Pets1)],
            NewMpet = Mpet#m_pet{pets = Pets2},
            NewRole = Role#role{m_pet = NewMpet},
            push_10502(NewRole, NewPet),
            combat_hook_setting:push_10767(NewRole),
            Msg = case BaseId =:= 20013 andalso Grade >= 1 of
                      true ->
                          notice:format(lang:get("~ts出战啦^.^"),
                                        [{pet_2, 20014}]);
                      _ ->
                          notice:format(lang:get("~ts出战啦^.^"),
                                        [{pet_2, BaseId}])
                  end,
            {ok,
             role_trigger:fire(#evt_pet_war{base_id = BaseId},
                               NewRole),
             Msg};
        #pet{status = 1} -> {false, lang:get("宠物已经出战, 无需再次出战")};
        _ -> {false, lang:get("不存在的宠物")}
    end.

get_fresh(Role = #role{m_pet =
                           Mpet = #m_pet{fresh_id = FreshId, time = GetTime},
                       lev = RoleLev}) ->
    Now = date:unixtime(),
    case GetTime =:= 0 orelse Now >= GetTime of
        true ->
            case pet_data:get_fresh(FreshId) of
                #{need_lev := NeedLev} when NeedLev > RoleLev ->
                    {false,
                     util:flist(lang:get("角色等级不足~w级，无法领取"), [NeedLev])};
                CreateArgs = #{next_id := NextId, type := 1} ->
                    case create(Role,
                                CreateArgs#{auto_add_point => {4, 0, 0, 0, 1},
                                            from => "领取新手宠物"})
                        of
                        {ok, NewRole = #role{m_pet = NewMpet}} ->
                            Time = time_get(NextId, RoleLev),
                            NewMpet1 = NewMpet#m_pet{fresh_id = NextId,
                                                     time = Time},
                            NewRole1 = NewRole#role{m_pet = NewMpet1},
                            combat_hook_setting:push_10767(NewRole1),
                            {ok, NewRole1, NextId, Time};
                        {false, Reason} -> {false, Reason}
                    end;
                #{base_id := BaseId, next_id := NextId, type := 2} ->
                    Gain = format:val_to_gain([{BaseId, 1}]),
                    case role_gain:do_notice(Gain, Role) of
                        {ok, NewRole} ->
                            Time = time_get(NextId, RoleLev),
                            NewPet = Mpet#m_pet{fresh_id = NextId, time = Time},
                            NewRole1 = NewRole#role{m_pet = NewPet},
                            {ok, NewRole1, NextId, Time};
                        {false, _} -> {false, lang:get("背包已满")}
                    end;
                _R ->
                    logger:debug("新手宠物 ~w ~w", [_R, FreshId], pet, 299),
                    {false, lang:get("没有可领取的宠物")}
            end;
        _ -> {false, lang:get("当前时间不可领取")}
    end.

get_war_pet(#role{m_pet = #m_pet{pets = Pets}}) ->
    case lists:keyfind(1, #pet.status, Pets) of
        Pet = #pet{} -> {ok, Pet};
        false -> false
    end.

rest(Role = #role{m_pet = Mpet = #m_pet{pets = Pets}},
     Id) ->
    case lists:keyfind(Id, #pet.id, Pets) of
        Pet = #pet{status = 1, base_id = BaseId} ->
            NewPet = Pet#pet{status = 0},
            Pets1 = lists:keyreplace(Id, #pet.id, Pets, NewPet),
            NewMpet = Mpet#m_pet{pets = Pets1},
            RestRole = Role#role{m_pet = NewMpet},
            push_10502(RestRole, NewPet),
            NewRole = role_trigger:fire(#evt_pet_rest{base_id =
                                                          BaseId},
                                        RestRole),
            {ok, NewRole};
        #pet{status = 0} -> {false, lang:get("宠物处于休息中, 无需休息")};
        _ -> {false, lang:get("不存在的宠物, 无法操作")}
    end.

reset(Role, Pets, FlagA, FlagB) ->
    case lists:keyfind(FlagA, #pet.status, Pets) of
        Pet = #pet{id = Id} ->
            NewPet = Pet#pet{status = FlagB},
            push_10502(Role, NewPet),
            lists:keyreplace(Id, #pet.id, Pets, NewPet);
        _ -> Pets
    end.

add_exp(Role = #role{m_pet = #m_pet{pets = Pets},
                     lev = RoleLev},
        Args = #{mode := PetMode, val := Val}) ->
    Result = case PetMode of
                 1 ->
                     case lists:keyfind(1, #pet.status, Pets) of
                         Pet = #pet{} -> {true, Pet};
                         _ -> {false, lang:get("当前没有出战宠物, 无法使用")}
                     end;
                 Pet = #pet{} -> {true, Pet};
                 _ -> {false, lang:get("找不到目标宠物, 无法使用")}
             end,
    Limit = maps:get(limit, Args, 0),
    MaxLev = RoleLev + 5 + Limit,
    case Result of
        {true, #pet{lev = Lev}} when Lev >= MaxLev ->
            notice:send(Role,
                        3,
                        util:flist(lang:get("宠物已超过人物等级~w级，无法获得经验"),
                                   [Limit + 5])),
            {ok, Role};
        {true,
         GetPet = #pet{attr = #attr{exp_ratio = ExpRatio}}} ->
            NewVal = round(Val * (1000 + ExpRatio) / 1000),
            do_add_exp(Role, GetPet, NewVal, Limit);
        {false, Reason} -> {false, Reason}
    end.

do_add_exp(Role = #role{m_pet =
                            Mpet = #m_pet{pets = Pets}},
           Pet = #pet{id = Id, lev = Lev, base_id = BaseId,
                      exp = Exp, name = Name},
           Val, Limit) ->
    case pet_data:get_exp(Lev) of
        MaxExp when MaxExp > 0 ->
            Pet1 = Pet#pet{exp = Exp + Val, max_exp = MaxExp},
            Msg = notice:format(lang:get("~ts获得了~ts"),
                                [{string_2, 5, Name}, {assets_1, 90005, Val}]),
            notice:send(Role, 3, Msg),
            case Exp + Val >= MaxExp of
                true ->
                    Pet2 = pet_attr:levup(Pet1, Role, Limit),
                    NewRole = role_trigger:fire(#evt_levup_pet{pet_id = Id,
                                                               base_id = BaseId,
                                                               lev = Lev + 1},
                                                Role),
                    lev_trigger(NewRole, Pet1, Pet2),
                    log:pet(NewRole, "宠物升级", Pet1, Pet2),
                    do_level_up_pet(Pet2, NewRole);
                false ->
                    NewPets = lists:keyreplace(Id, #pet.id, Pets, Pet1),
                    NewRole = Role#role{m_pet = Mpet#m_pet{pets = NewPets}},
                    push_10502(NewRole, Pet1),
                    {ok, NewRole}
            end;
        _ -> {false, lang:get("当前宠物已经满级, 无法使用")}
    end.

level_up_pet(Pet = #pet{lev = Lev, exp = Exp}, Role) ->
    ExpCfg = pet_data:get_exp(Lev),
    case ExpCfg =< Exp of
        true -> do_level_up_pet(Pet, Role);
        false -> false
    end.

do_level_up_pet(Pet = #pet{id = Id},
                Role = #role{m_pet = Mpet = #m_pet{pets = Pets}}) ->
    {ok, NewPet, Role1} = pet_attr:calc(Pet, Role),
    {Flag, NewPet1 = #pet{lev = NewLev}, Role2} = case
                                                      pet_skill:comprehend(levup,
                                                                           NewPet)
                                                      of
                                                      {true,
                                                       ComprehendPet,
                                                       Msg} ->
                                                          {ok, Npet, Nrole} =
                                                              pet_attr:calc(ComprehendPet,
                                                                            Role1),
                                                          notice:pop(Nrole,
                                                                     1,
                                                                     Msg),
                                                          log:pet(Nrole,
                                                                  "宠物领悟(升级)",
                                                                  NewPet,
                                                                  Npet),
                                                          {true, Npet, Nrole};
                                                      _ ->
                                                          {false, NewPet, Role1}
                                                  end,
    NewPets = lists:keyreplace(Id, #pet.id, Pets, NewPet1),
    NewRole = Role2#role{m_pet =
                             Mpet#m_pet{pets = NewPets}},
    push_10502(NewRole, NewPet1),
    push_10503(NewRole, NewPet1),
    case Flag of
        true -> push_10511(NewRole, NewPet1);
        false -> skip
    end,
    {ok,
     role_trigger:fire([#evt_pet_skill{},
                        #evt_pet_lev{old_lev = NewLev - 1, lev = NewLev}],
                       NewRole)}.

lev_trigger(Role,
            _OldPet = #pet{lev = Lev, name = Name},
            _NewPet = #pet{lev = NewLev})
    when NewLev > Lev ->
    send_pet_lv_up_notice(Role, Name, NewLev),
    pet_egg:hook_lv_up(Role, _NewPet),
    ok;
lev_trigger(_, _, _) -> ok.

send_pet_lv_up_notice(Role, Name, NewLev) ->
    Msg = notice:format(lang:get("~ts升到了~ts级"),
                        [{string_2, 5, Name}, {string_2, 5, NewLev}]),
    notice:send(Role, 3, Msg).

loss_happy(CombatType,
           Role = #role{m_dungeon = #m_dungeon{dun_id = DunId}},
           Fid, PetFighter) ->
    NormalFlag = case lists:member(CombatType,
                                   [114,
                                    56,
                                    6,
                                    100,
                                    102,
                                    104,
                                    107,
                                    103,
                                    41,
                                    21,
                                    4,
                                    105,
                                    106,
                                    36,
                                    40,
                                    58,
                                    43,
                                    108,
                                    47,
                                    48,
                                    110,
                                    111,
                                    113,
                                    60,
                                    65,
                                    66,
                                    115,
                                    116])
                     of
                     true -> 1;
                     _ ->
                         case CombatType of
                             11 ->
                                 case dungeon_data:get(DunId) of
                                     #dungeon_base{type = 5} -> 1;
                                     _ -> 0
                                 end;
                             _ -> 0
                         end
                 end,
    loss_happy_list(Role, Fid, PetFighter, NormalFlag);
loss_happy(_, Role, _, _) -> Role.

loss_happy_list(Role = #role{m_pet =
                                 Mpet = #m_pet{pets = Pets}},
                Fid, PetFighter, NormalFlag) ->
    NewPets = do_loss_happy(Role,
                            Fid,
                            Pets,
                            PetFighter,
                            NormalFlag),
    NewRole = Role#role{m_pet = Mpet#m_pet{pets = NewPets}},
    NewRole.

do_loss_happy(_Role, _Fid, Pets, [], _) -> Pets;
do_loss_happy(Role, Fid, Pets,
              [#fighter{origin_id = Id, master_fid = Fid,
                        is_die = IsDie}
               | T],
              NormalFlag) ->
    case lists:keyfind(Id, #pet.id, Pets) of
        Pet = #pet{happy = Happy, genre = GenreType,
                   base_id = PetBaseId, status = Status,
                   mount_skills = MountSkill}
            when GenreType =/= 2 andalso
                     GenreType =/= 6 andalso GenreType =/= 4 ->
            LossHappy = case NormalFlag of
                            1 -> 1;
                            _ ->
                                case IsDie of
                                    1 ->
                                        case lists:keyfind(85180,
                                                           #mount_skill.skill_id,
                                                           MountSkill)
                                            of
                                            #mount_skill{} -> 25;
                                            _ -> 50
                                        end;
                                    0 -> 1
                                end
                        end,
            NewHappy = max(0, Happy - LossHappy),
            IsReset = case Status =:= 1 of
                          true -> NewHappy < 50;
                          false -> false
                      end,
            NewPet = case IsReset of
                         true -> Pet#pet{happy = NewHappy, status = 0};
                         false -> Pet#pet{happy = NewHappy}
                     end,
            case IsDie of
                1 ->
                    case IsReset of
                        true ->
                            Msg =
                                notice:format(lang:get("~ts死亡扣除~ts点寿命，寿命低于~ts，无法继续出战"),
                                              [{pet_2, PetBaseId},
                                               {string_1, LossHappy},
                                               {string_2, 6, lang:get("50点")}]),
                            notice:send(Role, 7, Msg);
                        _ ->
                            Msg = notice:format(lang:get("~ts死亡扣除~ts点寿命"),
                                                [{pet_2, PetBaseId},
                                                 {string_1, LossHappy}]),
                            notice:send(Role, 7, Msg)
                    end;
                _ ->
                    case IsReset of
                        true ->
                            Msg = notice:format(lang:get("~ts寿命低于~ts，无法继续出战"),
                                                [{pet_2, PetBaseId},
                                                 {string_2,
                                                  6,
                                                  lang:get("50点")}]),
                            notice:send(Role, 7, Msg);
                        false -> skip
                    end
            end,
            NewPets = lists:keystore(Id, #pet.id, Pets, NewPet),
            push_10502(Role, NewPet),
            do_loss_happy(Role, Fid, NewPets, T, NormalFlag);
        _ -> do_loss_happy(Role, Fid, Pets, T, NormalFlag)
    end;
do_loss_happy(Role, Fid, Pets, [_ | T], NormalFlag) ->
    do_loss_happy(Role, Fid, Pets, T, NormalFlag).

max_talent_pet(#role{m_pet = #m_pet{pets = []},
                     m_pet_store = #m_pet_store{pets = []}}) ->
    undefined;
max_talent_pet(#role{m_pet = #m_pet{pets = Pets},
                     m_pet_store = #m_pet_store{pets = Pets1}}) ->
    case util:keys_sort([#pet.talent], Pets ++ Pets1) of
        [Pet | _] -> Pet;
        _ -> undefined
    end.

max_fc_pet(#role{m_pet = #m_pet{pets = []},
                 m_pet_store = #m_pet_store{pets = []}}) ->
    0;
max_fc_pet(#role{m_pet = #m_pet{pets = Pets},
                 m_pet_store = #m_pet_store{pets = Pets1}}) ->
    case util:keys_sort([#pet.talent], Pets ++ Pets1) of
        [#pet{talent = Talent} | _] -> Talent;
        _ -> 0
    end.

unreal(Role = #role{m_pet = MPet = #m_pet{pets = Pets}},
       PetId,
       _Item = #item{id = ItemId, base_id = ItemBase,
                     expire_type = ExpireType, expire_time = ExpireTime}) ->
    Now = date:unixtime(),
    Black = pet_data:get_unreal_black(),
    logger:debug("使用变身：~w",
                 [{ItemBase, ExpireType, ExpireTime, Now}],
                 pet,
                 541),
    case lists:keyfind(PetId, #pet.id, Pets) of
        _
            when (ExpireType == 2 orelse ExpireType == 1) andalso
                     ExpireTime =< Now ->
            {false, lang:get("该道具已经过期")};
        #pet{genre = 6} -> {false, lang:get("宠物蛋无法幻化")};
        Pet = #pet{unreal = UnReal, base_id = PetBase} ->
            IsBlack = lists:member(PetBase, Black),
            case pet_data:get_base(PetBase) of
                #pet_base{} when IsBlack == true ->
                    {false, lang:get("该宠物不能提升")};
                #pet_base{manual_level = _ManualLevel} ->
                    Gain = case UnReal of
                               [] -> [];
                               [#pet_unreal{item_id = OldItemId,
                                            timeout = OldTimeOut}] ->
                                   OldItem = item:make(OldItemId, 1, 1),
                                   OldItem2 = case OldTimeOut of
                                                  0 ->
                                                      OldItem#item{expire_type =
                                                                       0,
                                                                   expire_time =
                                                                       0};
                                                  _ ->
                                                      OldItem#item{expire_type =
                                                                       1,
                                                                   expire_time =
                                                                       OldTimeOut}
                                              end,
                                   [#gain{label = items, val = [OldItem2]}]
                           end,
                    TimeOut = case ExpireType of
                                  2 -> ExpireTime;
                                  1 -> ExpireTime;
                                  _ -> 0
                              end,
                    Loss = [#loss{label = item_id, val = [{ItemId, 1}]}],
                    case role_gain:do_notice(Loss ++ Gain, Role) of
                        {ok, NRole} ->
                            NewUnReal = [#pet_unreal{item_id = ItemBase,
                                                     timeout = TimeOut}],
                            NPet = Pet#pet{unreal = NewUnReal},
                            {ok, Npet1, NRole2} = pet_attr:calc(NPet, NRole),
                            log:pet(NRole, "幻化", Npet1, Pet),
                            NewPets = lists:keyreplace(PetId,
                                                       #pet.id,
                                                       Pets,
                                                       Npet1),
                            NRole3 = NRole2#role{m_pet =
                                                     MPet#m_pet{pets =
                                                                    NewPets}},
                            NewRole = unreal_timer(NRole3, Now),
                            push_10502(NewRole, Npet1),
                            push_10503(NewRole, Npet1),
                            {ok, NewRole};
                        #loss{msg = Msg} -> {false, Msg};
                        #gain{msg = Msg} -> {false, Msg}
                    end;
                _ -> {false, lang:get("宠物没有配置")}
            end;
        _ -> {false, lang:get("不存在的宠物, 无法操作")}
    end.

unreal_down(Role = #role{m_pet =
                             MPet = #m_pet{pets = Pets}},
            PetId, ItemId) ->
    case lists:keyfind(PetId, #pet.id, Pets) of
        Pet = #pet{unreal = UnReal} ->
            case lists:keyfind(ItemId, #pet_unreal.item_id, UnReal)
                of
                #pet_unreal{timeout = OldTimeOut} ->
                    {ok, [OldItem | _]} = item:make(ItemId, 1, 1),
                    OldItem2 = case OldTimeOut of
                                   0 ->
                                       OldItem#item{expire_type = 0,
                                                    expire_time = 0};
                                   _ ->
                                       OldItem#item{expire_type = 1,
                                                    expire_time = OldTimeOut}
                               end,
                    Gain = [#gain{label = items, val = [OldItem2]}],
                    NewUnReal = lists:keydelete(ItemId,
                                                #pet_unreal.item_id,
                                                UnReal),
                    case role_gain:do_notice(Gain, Role) of
                        {ok, NRole} ->
                            NewUnReal = NewUnReal,
                            NPet = Pet#pet{unreal = NewUnReal},
                            {ok, Npet1, NRole2} = pet_attr:calc(NPet, NRole),
                            log:pet(NRole, "脱下幻化", Npet1, Pet),
                            NewPets = lists:keyreplace(PetId,
                                                       #pet.id,
                                                       Pets,
                                                       Npet1),
                            NRole3 = NRole2#role{m_pet =
                                                     MPet#m_pet{pets =
                                                                    NewPets}},
                            NewRole = unreal_timer(NRole3, date:unixtime()),
                            push_10502(NewRole, Npet1),
                            push_10503(NewRole, Npet1),
                            {ok, NewRole};
                        {false, #loss{msg = Msg}} -> {false, Msg};
                        {false, #gain{msg = Msg}} -> {false, Msg}
                    end;
                _ -> {false, lang:get("该道具没有找到")}
            end;
        _ -> {false, lang:get("不存在的宠物, 无法操作")}
    end.

unreal_timer(Role = #role{m_pet = #m_pet{pets = Pets}},
             Now) ->
    AllUnReal = lists:append([UnReal
                              || #pet{unreal = UnReal} <- Pets]),
    case lists:sort([TTimeOut
                     || #pet_unreal{timeout = TTimeOut} <- AllUnReal,
                        TTimeOut > 0])
        of
        [] -> Role;
        [MinTime | _] ->
            Timer = #timer{id = pet_unreal,
                           timeout = max(MinTime - Now, 1) * 1000, times = 1,
                           m = pet, f = timer_tick, a = [pet_unreal]},
            role_timer:set(Timer, Role)
    end.

timer_tick(Role = #role{m_pet = #m_pet{pets = Pets}},
           pet_unreal) ->
    Now = date:unixtime(),
    NewPets = pet_unreal_timer(Role, Pets, Now, []),
    NRole = pet_attr:batch_calc(NewPets, Role),
    NewRole = unreal_timer(NRole, Now),
    pet_util:push_client_pets(NewRole),
    {ok, NewRole};
timer_tick(Role, _Label) -> {ok, Role}.

pet_unreal_timer(_Role, [], _, List) ->
    lists:reverse(List);
pet_unreal_timer(Role,
                 [Pet = #pet{unreal = UnReal} | T], Now, List) ->
    DelUnReal = [I
                 || I = #pet_unreal{timeout = TimeOut} <- UnReal,
                    TimeOut > 0 andalso TimeOut =< Now + 3],
    NewUnReal = UnReal -- DelUnReal,
    NewPet = Pet#pet{unreal = NewUnReal},
    pet_unreal_timer(Role, T, Now, [NewPet | List]).

adm_show(_Role = #role{m_pet = #m_pet{pets = Pets},
                       m_pet_store = #m_pet_store{pets = SPets}}) ->
    List = adm_show(Pets, []),
    List2 = adm_show(SPets, []),
    {ok, List ++ List2}.

adm_show([], List) -> List;
adm_show([Pet = #pet{id = Id, base_id = BaseId,
                     name = Name, status = Status, talent = Talent,
                     growth = Growth, use_growth = UseGrowth,
                     feed_point = FeedPoint,
                     pet_skin = #pet_skin{has_skin = HasSkin},
                     pet_attr =
                         #pet_attr{max_hp_apt_used = MaxHpAptUsed,
                                   max_phy_apt_used = MaxPhyAptUsed,
                                   max_pdef_apt_used = MaxPdefAptUsed,
                                   max_aspd_apt_used = MaxAspdAptUsed}}
          | T],
         List) ->
    StatusName = case Status of
                     0 -> "否";
                     _ -> "是"
                 end,
    {Skills,
     StoneSkills,
     MountSkills,
     SpiritSkills,
     UnRealSkill,
     RuneSkill} =
        pet_skill:all_skill(Pet),
    ShowSkills = adm_show(skill,
                          Skills,
                          #{type => 1, type_name => "普通技能"},
                          []),
    ShowStoneSkills = adm_show(skill,
                               StoneSkills,
                               #{type => 2, type_name => "护符技能"},
                               []),
    ShowMountSkills = adm_show(skill,
                               MountSkills,
                               #{type => 3, type_name => "坐骑技能"},
                               []),
    ShowSpiritSkills = adm_show(skill,
                                SpiritSkills,
                                #{type => 4, type_name => "附灵技能"},
                                []),
    ShowUnRealSkill = adm_show(skill,
                               UnRealSkill,
                               #{type => 5, type_name => "变身技能"},
                               []),
    ShowRuneSkill = adm_show(skill,
                             RuneSkill,
                             #{type => 6, type_name => "内丹技能"},
                             []),
    ShowSkin = adm_show(skin, HasSkin, #{}, []),
    AllSkills = ShowSkills ++
                    ShowStoneSkills ++
                        ShowMountSkills ++
                            ShowSpiritSkills ++
                                ShowUnRealSkill ++ ShowRuneSkill,
    Add = [{id, Id},
           {base_id, BaseId},
           {name, Name},
           {status, StatusName},
           {fc, Talent},
           {growth, Growth},
           {skill, AllSkills},
           {hp_item, MaxHpAptUsed},
           {phy_item, MaxPhyAptUsed},
           {pdef_item, MaxPdefAptUsed},
           {aspd_item, MaxAspdAptUsed},
           {use_growth, UseGrowth},
           {skin, ShowSkin},
           {feed_point, FeedPoint}],
    adm_show(T, [Add | List]).

adm_show(_Label, [], _, List) -> List;
adm_show(Label = skill, [{SkillId, Lev} | T],
         Args = #{type := Type, type_name := TypeName}, List) ->
    Add = [{skill_id, SkillId},
           {skill_name, pet_skill:skill_name(SkillId)},
           {lev, Lev},
           {type, Type},
           {type_name, TypeName}],
    adm_show(Label, T, Args, [Add | List]);
adm_show(Label = skin, [Skin | T], Args, List) ->
    case pet_data:get_skin(Skin) of
        #{skin_name := SkinName} ->
            Add = [{skin, Skin}, {skin_name, SkinName}],
            adm_show(Label, T, Args, [Add | List]);
        _ ->
            Add = [{skin, Skin}, {skin_name, ""}],
            adm_show(Label, T, Args, [Add | List])
    end;
adm_show(Label, [_ | T], Args, List) ->
    adm_show(Label, T, Args, List).

rand_aptitude(Role = #role{m_pet =
                               Mpet = #m_pet{pets = Pets},
                           charge = _Charge},
              Id, OldItemFlag) ->
    RandItem = var:get_var(Role, day, 1011, 0),
    case lists:keyfind(Id, #pet.id, Pets) of
        #pet{lock = 1} -> {false, lang:get("宠物处于锁定状态，请先解除锁定")};
        #pet{status = 1} -> {false, lang:get("出战宠物不能洗髓")};
        #pet{genre = 6} -> {false, lang:get("宠物蛋不用进行洗髓")};
        #pet{genre = 2} -> {false, lang:get("神兽不用进行洗髓")};
        #pet{genre = 4} -> {false, lang:get("珍兽不用进行洗髓")};
        #pet{grade = Grade} when Grade > 0 ->
            {false, lang:get("进阶过的宠物不能进行洗髓")};
        Pet = #pet{base_id = BaseId, pet_attr = OldPetAttr,
                   genre = OldGenreType, skills = OldPetSkills,
                   wash_time = WashTime, talent = Talent,
                   pet_tmp_aptitude =
                       #pet_tmp_aptitude{is_valid = IsValid,
                                         tmp_pet_attr = TmpPetAttr,
                                         tmp_genre = TmpGenreType,
                                         tmp_skills = TmpSkills}} ->
            {PetAttr, GenreType, OldSkills} = case IsValid of
                                                  1 ->
                                                      {TmpPetAttr,
                                                       TmpGenreType,
                                                       TmpSkills};
                                                  0 ->
                                                      {OldPetAttr,
                                                       OldGenreType,
                                                       OldPetSkills}
                                              end,
            case pet_data:get_base(BaseId) of
                PetBase = #pet_base{base_skills = BaseSkills,
                                    cost = Cost, vari_skills = VariSkill,
                                    growth_blue = GrowthBlue,
                                    growth_purple = GrowthPurple,
                                    growth_orange = GrowthOrange,
                                    growth_red = GrowthRed,
                                    base_happy = BaseHappy,
                                    min_happy_ratio = MinHappyRatio,
                                    max_happy_ratio = MaxHappyRatio,
                                    min_happy_genre_ratio = MinHappyGenreRatio,
                                    max_happy_genre_ratio = MaxHappyGenreRatio,
                                    max_wash_time = MaxWashTime} ->
                    {NeedUpdate, RandArgs} = calc_first_rand_apt(Role, Pet),
                    ItemFlag = case NeedUpdate of
                                   1 -> 0;
                                   _ -> OldItemFlag
                               end,
                    LossGoldNum = var:get_var(Role, day, 48, 0),
                    Loss = format:val_to_loss(Cost,
                                              #{item_base_id_auto_buy => 1,
                                                auto_scene =>
                                                    lang:get("宠物洗髓")}),
                    AddLoss = case ItemFlag of
                                  1
                                      when GenreType == 0 orelse
                                               GenreType == 3 orelse
                                                   GenreType == 5 ->
                                      [#loss{label = item_base_id,
                                             val = [{29100, 1}],
                                             msg = lang:get("材料不足, 无法操作")}];
                                  1 when GenreType == 1 ->
                                      [#loss{label = item_base_id,
                                             val = [{29101, 1}],
                                             msg = lang:get("材料不足, 无法操作")}];
                                  _ -> []
                              end,
                    logger:debug("洗宠消耗:~w",
                                 [{AddLoss, ItemFlag}],
                                 pet,
                                 767),
                    MonthCardWashingTimes = month_card:get_privilege(Role,
                                                                     washing_times),
                    {NewLoss, VarRole} = case MonthCardWashingTimes > 0 of
                                             true ->
                                                 VarRole1 = var:set_var(Role,
                                                                        other,
                                                                        2115,
                                                                        3 -
                                                                            MonthCardWashingTimes
                                                                            +
                                                                            1),
                                                 {AddLoss, VarRole1};
                                             _ -> {Loss ++ AddLoss, Role}
                                         end,
                    case role_gain:do(NewLoss, VarRole) of
                        {false, #loss{label = item_base_id, msg = LossMsg}} ->
                            {false, LossMsg};
                        {false, _Err} -> {false, lang:get("钻石不足, 无法洗髓")};
                        {ok, TLossRole} ->
                            NTLossRole = do_aptitude_acc(TLossRole, BaseId),
                            LossRole = case do_loss(gold, VarRole, NTLossRole)
                                           of
                                           {true, ""} ->
                                               var:set_var(NTLossRole,
                                                           day,
                                                           48,
                                                           LossGoldNum + 1);
                                           {true, UpMsg} ->
                                               notice:send(NTLossRole,
                                                           3,
                                                           UpMsg),
                                               var:set_var(NTLossRole,
                                                           day,
                                                           48,
                                                           LossGoldNum + 1);
                                           _ -> NTLossRole
                                       end,
                            GrowthList = [{2, GrowthBlue},
                                          {3, GrowthPurple},
                                          {4, GrowthOrange},
                                          {5, GrowthRed}],
                            RandGrowthType = maps:get(growth_type,
                                                      RandArgs,
                                                      undefined),
                            {GrowthType, Growth} = case
                                                       lists:keyfind(RandGrowthType,
                                                                     1,
                                                                     GrowthList)
                                                       of
                                                       {FindGrowthType,
                                                        FindGrowth} ->
                                                           {FindGrowthType,
                                                            FindGrowth};
                                                       _ ->
                                                           rand_growth({GrowthBlue,
                                                                        GrowthPurple,
                                                                        GrowthOrange,
                                                                        GrowthRed})
                                                   end,
                            VaritionRateAdd = case
                                                  buff:is_special_effect_exists_one_param(VarRole,
                                                                                          30)
                                                  of
                                                  {true, _RateAdd} -> _RateAdd;
                                                  _ -> 0
                                              end,
                            logger:debug("有洗髓buff，增加编译几率:~w",
                                         [VaritionRateAdd],
                                         pet,
                                         807),
                            GenreType1 = rand_genre(VaritionRateAdd,
                                                    PetBase,
                                                    GenreType,
                                                    ItemFlag),
                            NewGenreType = maps:get(genre,
                                                    RandArgs,
                                                    GenreType1),
                            RandApt = maps:get(aptitude, RandArgs, undefined),
                            NewPetAttr = rand_apt(PetAttr,
                                                  PetBase,
                                                  BaseId,
                                                  NewGenreType,
                                                  RandApt),
                            {NewWashTime, AptSkills} = case maps:get(skills,
                                                                     RandArgs,
                                                                     undefined)
                                                           of
                                                           RandSkills = [_
                                                                         | _] ->
                                                               {WashTime,
                                                                learn_normal_skill(RandSkills)};
                                                           _ ->
                                                               rand_skills(NewGenreType,
                                                                           BaseSkills,
                                                                           VariSkill,
                                                                           OldSkills,
                                                                           WashTime,
                                                                           MaxWashTime)
                                                       end,
                            ExchangeSkill = get_exchange_skill(BaseId),
                            NewSkills = ExchangeSkill ++ AptSkills,
                            NewHappy = rand_happy(BaseHappy,
                                                  NewGenreType,
                                                  MinHappyRatio,
                                                  MaxHappyRatio,
                                                  MinHappyGenreRatio,
                                                  MaxHappyGenreRatio),
                            CalcPet = Pet#pet{genre = NewGenreType,
                                              pet_attr = NewPetAttr,
                                              skills = NewSkills,
                                              growth = Growth,
                                              growth_type = GrowthType,
                                              happy = NewHappy,
                                              wash_time = NewWashTime},
                            {ok, #pet{talent = NewTalent}, Role1} =
                                pet_attr:calc(CalcPet, LossRole),
                            TmpAptitude = #pet_tmp_aptitude{is_valid = 1,
                                                            tmp_genre =
                                                                NewGenreType,
                                                            tmp_pet_attr =
                                                                NewPetAttr,
                                                            tmp_skills =
                                                                NewSkills,
                                                            tmp_growth = Growth,
                                                            tmp_growth_type =
                                                                GrowthType,
                                                            talent = NewTalent,
                                                            tmp_happy =
                                                                NewHappy},
                            NewPet = Pet#pet{pet_tmp_aptitude = TmpAptitude,
                                             wash_time = NewWashTime},
                            NewMpet = Mpet#m_pet{pets =
                                                     lists:keyreplace(Id,
                                                                      #pet.id,
                                                                      Pets,
                                                                      NewPet)},
                            PetRole = Role1#role{m_pet = NewMpet},
                            NewRole =
                                role_trigger:fire([#evt_aptitude_pet{base_id =
                                                                         BaseId,
                                                                     genre =
                                                                         NewGenreType}],
                                                  PetRole),
                            push_10555(NewRole, NewPet),
                            ReturnMsg = "",
                            UpdateRole = case NeedUpdate of
                                             1 ->
                                                 var:set_var(NewRole,
                                                             other,
                                                             2010,
                                                             1);
                                             _ -> NewRole
                                         end,
                            UpdateRole2 = case MonthCardWashingTimes > 0 of
                                              true -> UpdateRole;
                                              _ ->
                                                  case lists:keyfind(20006,
                                                                     1,
                                                                     Cost)
                                                      of
                                                      {_, RandItemAdd} ->
                                                          NewRandItem = RandItem
                                                                            +
                                                                            RandItemAdd,
                                                          case RandItem div 850
                                                                   <
                                                                   NewRandItem
                                                                       div 850
                                                              of
                                                              true ->
                                                                  mail:send(UpdateRole,
                                                                            lang:get("洗髓奖励"),
                                                                            notice:format(lang:get("星辰学院得知您当天消耗了较大数量的星辰精华，特为您送来一张~ts，希望能助您一臂之力{fa"
                                                                                                   "ce_1,18}"),
                                                                                          [{string_2,
                                                                                            1,
                                                                                            lang:get("仙灵卷轴")}]),
                                                                            [{29101,
                                                                              1}]);
                                                              _ -> ignore
                                                          end,
                                                          var:set_var(UpdateRole,
                                                                      day,
                                                                      1011,
                                                                      NewRandItem);
                                                      _ -> UpdateRole
                                                  end
                                          end,
                            UpdateRole3 = case NewTalent < Talent of
                                              true ->
                                                  AptitudeReimburse =
                                                      pet_data:get_aptitude_reimburse(BaseId),
                                                  AptitudeReimburseGain =
                                                      format:val_to_gain(AptitudeReimburse),
                                                  case
                                                      role_gain:do(AptitudeReimburseGain,
                                                                   UpdateRole2)
                                                      of
                                                      {ok, TUpdateRole2} ->
                                                          TUpdateRole2;
                                                      _ -> UpdateRole2
                                                  end;
                                              _ -> UpdateRole2
                                          end,
                            push_aptitude(UpdateRole3),
                            log:pet(NewRole, "宠物洗髓", Pet, NewPet),
                            case MonthCardWashingTimes > 0 of
                                true ->
                                    Msg = case MonthCardWashingTimes > 1 of
                                              true ->
                                                  notice:format(lang:get("~ts每天免费洗髓3次，剩余~ts次{face_1,9}"),
                                                                [{string_2,
                                                                  5,
                                                                  lang:get("月卡特权：")},
                                                                 {string_2,
                                                                  5,
                                                                  MonthCardWashingTimes
                                                                      - 1}]);
                                              _ ->
                                                  notice:format(lang:get("~ts免费洗髓3次，今日已用完{face_1,9}"),
                                                                [{string_2,
                                                                  5,
                                                                  lang:get("月卡特权：")}])
                                          end,
                                    notice:send(Role, 3, Msg),
                                    ok;
                                _ -> ok
                            end,
                            {ok,
                             UpdateRole3,
                             NewGenreType,
                             NewWashTime,
                             ReturnMsg}
                    end;
                _ -> {false, lang:get("不存在该宠物的数据, 无法洗髓")}
            end;
        _ -> {false, ""}
    end.

push_aptitude(Role) ->
    LossGoldNum = var:get_var(Role, day, 48, 0),
    role:link_send(Role, 10543, {LossGoldNum}),
    ok.

push_month_card_washing_times(Role) ->
    {Day, _} = month_card:state_get(Role),
    Data = case Day > 0 of
               true ->
                   WashingTimes = month_card:get_privilege(Role,
                                                           washing_times),
                   {1, WashingTimes};
               _ -> {0, 0}
           end,
    role:link_send(Role, 10572, Data),
    ok.

rpc_save_tmp_aptitude(Role = #role{m_pet =
                                       MPet = #m_pet{pets = Pets}},
                      PetId) ->
    case lists:keyfind(PetId, #pet.id, Pets) of
        #pet{grade = Grade} when Grade =/= 0 ->
            {false, lang:get("您的宠物已经进阶，无法保存洗髓")};
        #pet{pet_tmp_aptitude =
                 #pet_tmp_aptitude{is_valid = 0}} ->
            {false, lang:get("您还没有进行洗髓呢")};
        Pet = #pet{base_id = _BaseId, pet_attr = OldPetAttr,
                   skills = OldSkills,
                   pet_tmp_aptitude =
                       #pet_tmp_aptitude{tmp_genre = TmpGenre,
                                         tmp_pet_attr = TmpPetAttr,
                                         tmp_skills = TmpSkills,
                                         tmp_growth = TmpGrowth,
                                         tmp_growth_type = TmpGrowthType,
                                         tmp_happy = TmpHappy,
                                         talent = TmpTalent, is_valid = 1}} ->
            OldBaseSkill = [S
                            || S = #pet_skill{source = Source} <- OldSkills,
                               lists:member(Source,
                                            [2, pet_skill_source_lev_break])
                                   =:= true],
            Skills = TmpSkills ++ OldBaseSkill,
            #pet_attr{hp_aptitude = HpAPt, phy_aptitude = PhyApt,
                      pdef_aptitude = PdefApt, magic_aptitude = MagicApt,
                      aspd_aptitude = AspdApt, max_hp_aptitude = MaxHpApt,
                      max_phy_aptitude = MaxPhyApt,
                      max_pdef_aptitude = MaxPdefApt,
                      max_magic_aptitude = MaxMagicApt,
                      max_aspd_aptitude = MaxAspdApt} =
                TmpPetAttr,
            NewPetAttr = OldPetAttr#pet_attr{hp_aptitude = HpAPt,
                                             phy_aptitude = PhyApt,
                                             pdef_aptitude = PdefApt,
                                             magic_aptitude = MagicApt,
                                             aspd_aptitude = AspdApt,
                                             max_hp_aptitude = MaxHpApt,
                                             max_phy_aptitude = MaxPhyApt,
                                             max_pdef_aptitude = MaxPdefApt,
                                             max_magic_aptitude = MaxMagicApt,
                                             max_aspd_aptitude = MaxAspdApt,
                                             max_hp_apt_used = 0,
                                             max_phy_apt_used = 0,
                                             max_pdef_apt_used = 0,
                                             max_magic_apt_used = 0,
                                             max_aspd_apt_used = 0},
            NewPet1 = Pet#pet{genre = TmpGenre, use_growth = 0,
                              pet_attr = NewPetAttr, skills = Skills,
                              growth = TmpGrowth, growth_type = TmpGrowthType,
                              happy = TmpHappy, talent = TmpTalent,
                              pet_tmp_aptitude =
                                  #pet_tmp_aptitude{is_valid = 0}},
            {ok, NewPet, NewRole1} = pet_attr:calc(NewPet1, Role),
            NewPets = lists:keyreplace(PetId,
                                       #pet.id,
                                       Pets,
                                       NewPet),
            PetRole = NewRole1#role{m_pet =
                                        MPet#m_pet{pets = NewPets}},
            NewRole = role_trigger:fire([#evt_pet{}], PetRole),
            push_10503(NewRole, NewPet),
            push_10502(NewRole, NewPet),
            push_10511(NewRole, NewPet),
            log:pet(NewRole, "宠物保存洗髓", Pet, NewPet),
            {ok, NewRole, lang:get("保存洗髓成功")};
        _ -> {false, lang:get("不存在该宠物的数据")}
    end.

calc_first_rand_apt(Role, #pet{base_id = 10003}) ->
    Times = var:get_var(Role, other, 2010, 0),
    case Times =:= 0 of
        true ->
            case pet_data:get_egg(13) of
                #{base_id := 10003, genre := Genre, aptitude := Apt,
                  skills := Skills, growth_type := GrowthType} ->
                    {1,
                     #{growth_type => GrowthType, genre => Genre,
                       aptitude => Apt, skills => Skills}};
                _ -> {0, #{}}
            end;
        false -> {0, #{}}
    end;
calc_first_rand_apt(_Role, #pet{base_id = 10037}) ->
    {0, #{growth_type => 5}};
calc_first_rand_apt(_, _) -> {0, #{}}.

rand_happy(BaseHappy, 2, _, _, _, _) -> BaseHappy;
rand_happy(BaseHappy, 4, _, _, _, _) -> BaseHappy;
rand_happy(BaseHappy, 6, _, _, _, _) -> BaseHappy;
rand_happy(BaseHappy, 1, _, _, MinRatio, MaxRatio) ->
    MinBase = round(BaseHappy * MinRatio / 1000),
    MaxBase = round(BaseHappy * MaxRatio / 1000),
    util:rand(MinBase, MaxBase);
rand_happy(BaseHappy, _, MinRatio, MaxRatio, _, _) ->
    MinBase = round(BaseHappy * MinRatio / 1000),
    MaxBase = round(BaseHappy * MaxRatio / 1000),
    util:rand(MinBase, MaxBase).

rand_growth({GrowthBlue,
             GrowthPurple,
             GrowthOrange,
             GrowthRed}) ->
    GrowthList = [{2, GrowthBlue, 100},
                  {3, GrowthPurple, 250},
                  {4, GrowthOrange, 340},
                  {5, GrowthRed, 310}],
    {GrowthType, GrowthVal, _} = util:rand_list(GrowthList,
                                                3),
    {GrowthType, GrowthVal}.

rand_skills(NewGenreType, BaseSkills, VariSkill,
            _OldSkills, WashTime, MaxWashTime) ->
    BaseSkills1 = [{BaseSkillId, Ratio}
                   || {BaseSkillId, Ratio} <- BaseSkills],
    {NewWashTime, Skills1} = case MaxWashTime > 0 of
                                 true ->
                                     case NewGenreType of
                                         1 ->
                                             {WashTime,
                                              util:rand_all(BaseSkills1, 2)};
                                         _ ->
                                             case WashTime >= MaxWashTime of
                                                 true -> {0, BaseSkills1};
                                                 false ->
                                                     {WashTime + 1,
                                                      util:rand_all(BaseSkills1,
                                                                    2)}
                                             end
                                     end;
                                 false -> {0, util:rand_all(BaseSkills1, 2)}
                             end,
    Skills2 = case NewGenreType of
                  1 ->
                      NewVariSkill = [SkillId
                                      || SkillId <- VariSkill,
                                         lists:keymember(SkillId, 1, Skills1)
                                             =:= false],
                      [util:rand_list(NewVariSkill)];
                  _ -> []
              end,
    Skills = [Sk || {Sk, _} <- Skills1] ++ Skills2,
    {NewWashTime, learn_normal_skill(Skills)}.

rand_genre(_, _, 1, 1) -> 1;
rand_genre(RateAdd, #pet_base{genre = Genre}, 1, _) ->
    case util:rand(1, 1000) =< 600 - RateAdd of
        true -> Genre;
        false -> 1
    end;
rand_genre(_, _, 0, 1) -> 1;
rand_genre(RateAdd, _, 0, _) ->
    case util:rand(1, 1000) =< 40 + RateAdd of
        true -> 1;
        false -> 0
    end;
rand_genre(_, _, 5, 1) -> 1;
rand_genre(RateAdd, _, 5, _) ->
    case util:rand(1, 1000) =< 40 + RateAdd of
        true -> 1;
        false -> 5
    end;
rand_genre(_, _, 2, _) -> 2;
rand_genre(_, _, 6, _) -> 6;
rand_genre(_, _, 4, _) -> 4;
rand_genre(_, _, 3, 1) -> 1;
rand_genre(RateAdd, #pet_base{genre = Genre}, 3, _) ->
    case util:rand(1, 1000) =< 40 + RateAdd of
        true -> 1;
        false -> Genre
    end.

rand_apt(PetAttr,
         #pet_base{hp_aptitude = HpApt, phy_aptitude = PhyApt,
                   pdef_aptitude = PdefApt, magic_aptitude = MagicApt,
                   aspd_aptitude = AspdApt},
         _BaseId, _GenreType,
         {HpRatio,
          PhyRatio,
          PdefRatio,
          MagicRatio,
          AspdRatio}) ->
    HpApt1 = round(HpApt * HpRatio / 1000),
    PhyApt1 = round(PhyApt * PhyRatio / 1000),
    PdefApt1 = round(PdefApt * PdefRatio / 1000),
    MagicApt1 = round(MagicApt * MagicRatio / 1000),
    AspdApt1 = round(AspdApt * AspdRatio / 1000),
    PetAttr#pet_attr{hp_aptitude = HpApt1,
                     phy_aptitude = PhyApt1, pdef_aptitude = PdefApt1,
                     magic_aptitude = MagicApt1, aspd_aptitude = AspdApt1,
                     max_hp_aptitude = HpApt1, max_phy_aptitude = PhyApt1,
                     max_pdef_aptitude = PdefApt1,
                     max_magic_aptitude = MagicApt1,
                     max_aspd_aptitude = AspdApt1, max_hp_apt_used = 0,
                     max_phy_apt_used = 0, max_pdef_apt_used = 0,
                     max_magic_apt_used = 0, max_aspd_apt_used = 0};
rand_apt(PetAttr,
         #pet_base{hp_aptitude = HpApt, phy_aptitude = PhyApt,
                   pdef_aptitude = PdefApt, magic_aptitude = MagicApt,
                   aspd_aptitude = AspdApt},
         _BaseId, GenreType, _Aptitude)
    when GenreType =:= 2 orelse
             GenreType =:= 4 orelse GenreType =:= 6 ->
    PetAttr#pet_attr{hp_aptitude = HpApt,
                     phy_aptitude = PhyApt, pdef_aptitude = PdefApt,
                     magic_aptitude = MagicApt, aspd_aptitude = AspdApt,
                     max_hp_aptitude = HpApt, max_phy_aptitude = PhyApt,
                     max_pdef_aptitude = PdefApt,
                     max_magic_aptitude = MagicApt,
                     max_aspd_aptitude = AspdApt};
rand_apt(PetAttr,
         #pet_base{hp_aptitude = HpApt, phy_aptitude = PhyApt,
                   pdef_aptitude = PdefApt, magic_aptitude = MagicApt,
                   aspd_aptitude = AspdApt},
         _BaseId, GenreType, _Aptitude)
    when GenreType =:= 3 ->
    BaseHpApt = round(HpApt * 81 / 100),
    BasePhyApt = round(PhyApt * 81 / 100),
    BasePdefApt = round(PdefApt * 81 / 100),
    BaseMagicApt = round(MagicApt * 81 / 100),
    BaseAspdApt = round(AspdApt * 81 / 100),
    MaxHpApt = round(HpApt * 82 / 100),
    MaxPhyApt = round(PhyApt * 82 / 100),
    MaxPdefApt = round(PdefApt * 82 / 100),
    MaxMagicApt = round(MagicApt * 82 / 100),
    MaxAspdApt = round(AspdApt * 82 / 100),
    PetAttr#pet_attr{hp_aptitude = BaseHpApt,
                     phy_aptitude = BasePhyApt, pdef_aptitude = BasePdefApt,
                     magic_aptitude = BaseMagicApt,
                     aspd_aptitude = BaseAspdApt, max_hp_aptitude = MaxHpApt,
                     max_phy_aptitude = MaxPhyApt,
                     max_pdef_aptitude = MaxPdefApt,
                     max_magic_aptitude = MaxMagicApt,
                     max_aspd_aptitude = MaxAspdApt};
rand_apt(PetAttr,
         #pet_base{hp_aptitude = HpApt, phy_aptitude = PhyApt,
                   pdef_aptitude = PdefApt, magic_aptitude = MagicApt,
                   aspd_aptitude = AspdApt},
         BaseId, GenreType, _Aptitude) ->
    GenreRatio = genre_ratio(GenreType),
    case pet_data:get_rand_apt(BaseId) of
        {HpList,
         PhyList,
         PdefList,
         MagicList,
         AspdList,
         HpList1,
         PhyList1,
         PdefList1,
         MagicList1,
         AspdList1}
            when length(HpList) =:= 12 andalso
                     length(PhyList) =:= 12 andalso
                         length(PdefList) =:= 12 andalso
                             length(MagicList) =:= 12 andalso
                                 length(AspdList) =:= 12 andalso
                                     length(HpList1) =:= 12 andalso
                                         length(PhyList1) =:= 12 andalso
                                             length(PdefList1) =:= 12 andalso
                                                 length(MagicList1) =:= 12
                                                     andalso
                                                     length(AspdList1) =:= 12 ->
            Base = lists:seq(1, 12),
            {HpRandList,
             PhyRandList,
             PdefRandList,
             MagicRandList,
             AspdRandList} =
                make_advance(GenreType,
                             [HpList, PhyList, PdefList, MagicList, AspdList]),
            {AddHpMax, _} = util:rand_list(HpRandList, 2),
            {AddPhyMax, _} = util:rand_list(PhyRandList, 2),
            {AddPdefMax, _} = util:rand_list(PdefRandList, 2),
            {AddMagicMax, _} = util:rand_list(MagicRandList, 2),
            {AddAspdMax, _} = util:rand_list(AspdRandList, 2),
            HpRandList1 = lists:zip(Base, HpList1),
            PhyRandList1 = lists:zip(Base, PhyList1),
            PdefRandList1 = lists:zip(Base, PhyList1),
            MagicRandList1 = lists:zip(Base, MagicList1),
            AspdRandList1 = lists:zip(Base, AspdList1),
            {AddHpMin, _} = util:rand_list(HpRandList1, 2),
            {AddPhyMin, _} = util:rand_list(PhyRandList1, 2),
            {AddPdefMin, _} = util:rand_list(PdefRandList1, 2),
            {AddMagicMin, _} = util:rand_list(MagicRandList1, 2),
            {AddAspdMin, _} = util:rand_list(AspdRandList1, 2),
            NewAddHpMin = min(AddHpMin, AddHpMax),
            NewAddPhyMin = min(AddPhyMin, AddPhyMax),
            NewAddPdefMin = min(AddPdefMin, AddPdefMax),
            NewAddMagicMin = min(AddMagicMin, AddMagicMax),
            NewAddAspdMin = min(AddAspdMin, AddAspdMax),
            BaseHpApt = round(HpApt * (80 + NewAddHpMin * 20 / 12) /
                                  100
                                  * GenreRatio),
            BasePhyApt = round(PhyApt *
                                   (80 + NewAddPhyMin * 20 / 12)
                                   / 100
                                   * GenreRatio),
            BasePdefApt = round(PdefApt *
                                    (80 + NewAddPdefMin * 20 / 12)
                                    / 100
                                    * GenreRatio),
            BaseMagicApt = round(MagicApt *
                                     (80 + NewAddMagicMin * 20 / 12)
                                     / 100
                                     * GenreRatio),
            BaseAspdApt = round(AspdApt *
                                    (80 + NewAddAspdMin * 20 / 12)
                                    / 100
                                    * GenreRatio),
            MaxHpApt = round(HpApt * (80 + AddHpMax * 20 / 12) / 100
                                 * GenreRatio),
            MaxPhyApt = round(PhyApt * (80 + AddPhyMax * 20 / 12) /
                                  100
                                  * GenreRatio),
            MaxPdefApt = round(PdefApt * (80 + AddPdefMax * 20 / 12)
                                   / 100
                                   * GenreRatio),
            MaxMagicApt = round(MagicApt *
                                    (80 + AddMagicMax * 20 / 12)
                                    / 100
                                    * GenreRatio),
            MaxAspdApt = round(AspdApt * (80 + AddAspdMax * 20 / 12)
                                   / 100
                                   * GenreRatio),
            PetAttr#pet_attr{hp_aptitude = BaseHpApt,
                             phy_aptitude = BasePhyApt,
                             pdef_aptitude = BasePdefApt,
                             magic_aptitude = BaseMagicApt,
                             aspd_aptitude = BaseAspdApt,
                             max_hp_aptitude = MaxHpApt,
                             max_phy_aptitude = MaxPhyApt,
                             max_pdef_aptitude = MaxPdefApt,
                             max_magic_aptitude = MaxMagicApt,
                             max_aspd_aptitude = MaxAspdApt};
        _ ->
            logger:error("无法获取[~w]的洗髓分配列表", [BaseId], pet, 1205),
            BaseHpApt = round(HpApt * 80 / 100 * GenreRatio),
            BasePhyApt = round(PhyApt * 80 / 100 * GenreRatio),
            BasePdefApt = round(PdefApt * 80 / 100 * GenreRatio),
            BaseMagicApt = round(MagicApt * 80 / 100 * GenreRatio),
            BaseAspdApt = round(AspdApt * 80 / 100 * GenreRatio),
            MaxHpApt = round(HpApt * 80 / 100 * GenreRatio),
            MaxPhyApt = round(PhyApt * 80 / 100 * GenreRatio),
            MaxPdefApt = round(PdefApt * 80 / 100 * GenreRatio),
            MaxMagicApt = round(MagicApt * 80 / 100 * GenreRatio),
            MaxAspdApt = round(AspdApt * 80 / 100 * GenreRatio),
            PetAttr#pet_attr{hp_aptitude = BaseHpApt,
                             phy_aptitude = BasePhyApt,
                             pdef_aptitude = BasePdefApt,
                             magic_aptitude = BaseMagicApt,
                             aspd_aptitude = BaseAspdApt,
                             max_hp_aptitude = MaxHpApt,
                             max_phy_aptitude = MaxPhyApt,
                             max_pdef_aptitude = MaxPdefApt,
                             max_magic_aptitude = MaxMagicApt,
                             max_aspd_aptitude = MaxAspdApt}
    end.

genre_ratio(1) -> 1.02;
genre_ratio(_) -> 1.

make_advance(1, List) ->
    X = util:rand(1, 5),
    list_to_tuple(do_make(X, List, []));
make_advance(_, List) ->
    list_to_tuple(do_make(0, List, [])).

do_make(1, [H | T], Rtn) ->
    NH = lists:zip([11, 12], lists:nthtail(10, H)),
    do_make(0, T, [NH | Rtn]);
do_make(_, [], Rtn) -> lists:reverse(Rtn);
do_make(Num, [H | T], Rtn) ->
    Base = lists:seq(1, 12),
    NH = lists:zip(Base, H),
    do_make(Num - 1, T, [NH | Rtn]).

rename_pet(PetId, Name,
           Role = #role{m_pet = Mpet = #m_pet{pets = Pets}}) ->
    case lists:keytake(PetId, #pet.id, Pets) of
        {value, Pet = #pet{}, RestPets} ->
            NewPet = Pet#pet{name = Name},
            NewPets = [NewPet | RestPets],
            NewMpet = Mpet#m_pet{pets = NewPets},
            NewRole = Role#role{m_pet = NewMpet},
            {ok, NewRole};
        false -> {false, lang:get("宠物不存在, 无法改名")}
    end.

reset_point(Role = #role{m_pet =
                             Mpet = #m_pet{pets = Pets}},
            PetId) ->
    case lists:keytake(PetId, #pet.id, Pets) of
        {value, #pet{lock = 1}, _} ->
            {false, lang:get("宠物处于锁定状态，请先解除锁定")};
        {value,
         Pet = #pet{lev = Lev, free_reset_flag = FreeResetFlag,
                    pet_attr =
                        PetAttr = #pet_attr{p_str = Pstr, p_con = Pcon,
                                            p_mag = Pmag, p_agi = Pagi,
                                            p_end = Pend},
                    feed_point = FeedPoint},
         RestPets}
            when Lev > 1 ->
            Base = Lev,
            Gold = util:floor((max(0, Pstr - Base) +
                                   max(0, Pcon - Base)
                                   + max(0, Pmag - Base)
                                   + max(0, Pagi - Base)
                                   + max(0, Pend - Base))
                                  * 1000),
            {PayFlag, Loss} = case Lev < 40 of
                                  true when FreeResetFlag == 0 -> {free, []};
                                  _ ->
                                      {pay,
                                       [#loss{label = coin, val = Gold,
                                              msg = lang:get("银币不足, 无法洗点")}]}
                              end,
            case role_gain:do_notice(Loss, Role) of
                {false, #loss{msg = Msg}} -> {false, Msg};
                {ok, Role1} ->
                    NewPetAttr = PetAttr#pet_attr{point =
                                                      Base * 5 + FeedPoint,
                                                  p_str = Base, p_con = Base,
                                                  p_mag = Base, p_agi = Base,
                                                  p_end = Base},
                    {ok, NewPet, Role2} = pet_attr:calc(Pet#pet{pet_attr =
                                                                    NewPetAttr,
                                                                free_reset_flag
                                                                    = 1},
                                                        Role1),
                    NewPets = [NewPet | RestPets],
                    NewMpet = Mpet#m_pet{pets = NewPets},
                    NewRole = Role2#role{m_pet = NewMpet},
                    push_10503(NewRole, NewPet),
                    {ok, PayFlag, NewRole}
            end;
        {_, _, _} -> {false, lang:get("宠物等级太低, 无法洗点")};
        _ -> {false, lang:get("宠物不存在, 无法洗点")}
    end.

addpoint(PetId, {Str, Con, Mag, Agi, End},
         Role = #role{m_pet = Mpet = #m_pet{pets = Pets}}) ->
    All = Str + Con + Mag + Agi + End,
    case lists:keyfind(PetId, #pet.id, Pets) of
        Pet = #pet{base_id = BaseId, name = PetName,
                   pet_attr =
                       PetAttr = #pet_attr{point = Point, p_str = OldStr,
                                           p_con = OldCon, p_mag = OldMag,
                                           p_agi = OldAgi, p_end = OldEnd}}
            when All =< Point ->
            NewPoint = Point - All,
            NewStr = OldStr + Str,
            NewCon = OldCon + Con,
            NewMag = OldMag + Mag,
            NewAgi = OldAgi + Agi,
            NewEnd = OldEnd + End,
            NewPetAttr = PetAttr#pet_attr{point = NewPoint,
                                          p_str = NewStr, p_con = NewCon,
                                          p_mag = NewMag, p_agi = NewAgi,
                                          p_end = NewEnd},
            {ok, NewPet, Role1} = pet_attr:calc(Pet#pet{pet_attr =
                                                            NewPetAttr},
                                                Role),
            NewPets = lists:keystore(PetId, #pet.id, Pets, NewPet),
            NewMpet = Mpet#m_pet{pets = NewPets},
            NewRole = Role1#role{m_pet = NewMpet},
            push_10503(NewRole, NewPet),
            PointMsg = point_msg([{101, Str},
                                  {102, Con},
                                  {103, Mag},
                                  {104, Agi},
                                  {105, End}],
                                 ""),
            Msg = notice:format(lang:get("~ts加点成功，分配~ts"),
                                [{string_2, 5, PetName}, {string_1, PointMsg}]),
            notice:send(NewRole, 3, Msg),
            log:pet(NewRole, "宠物加点", Pet, NewPet),
            {ok,
             role_trigger:fire(#evt_pet_add_point{pet_id = PetId,
                                                  base_id = BaseId},
                               NewRole)};
        #pet{} -> {false, lang:get("没有足够的潜能点进行分配")};
        _ -> {false, lang:get("没有找到宠物")}
    end.

point_msg([], Msg) -> Msg;
point_msg([{_, 0} | T], Msg) -> point_msg(T, Msg);
point_msg([{AttrName, Val} | T], Msg) ->
    ValMsg = format:to_point_msg(AttrName, Val),
    NewMsg = case Msg of
                 "" -> util:flist("~ts", [ValMsg]);
                 _ -> util:flist("~ts，~ts", [Msg, ValMsg])
             end,
    point_msg(T, NewMsg).

setpoint(PetId, {Str, Con, Mag, Agi, End},
         Role = #role{m_pet = Mpet = #m_pet{pets = Pets}})
    when Str + Con + Mag + Agi + End =:= 5 orelse
             Str + Con + Mag + Agi + End =:= 0 ->
    case lists:keyfind(PetId, #pet.id, Pets) of
        Pet = #pet{pet_attr = PetAttr, base_id = _BaseId} ->
            NewPetAttr = PetAttr#pet_attr{pre_str = Str,
                                          pre_con = Con, pre_mag = Mag,
                                          pre_agi = Agi, pre_end = End},
            NewPet = Pet#pet{pet_attr = NewPetAttr},
            NewPets = lists:keyreplace(PetId,
                                       #pet.id,
                                       Pets,
                                       NewPet),
            NewMpet = Mpet#m_pet{pets = NewPets},
            NewRole = Role#role{m_pet = NewMpet},
            Msg = case Str + Con + Mag + Agi + End of
                      0 -> lang:get("取消宠物自动加点成功");
                      _ -> lang:get("更改宠物自动加点成功, 宠物升级将按照方案自动加点")
                  end,
            log:pet(NewRole, "宠物设置加点", Pet, NewPet),
            {ok, NewRole, NewPetAttr, Msg};
        _ -> {false, lang:get("找不到宠物")}
    end;
setpoint(_PetId, _, _) ->
    {false, lang:get("5项属性分配满5点或0点才可保存方案")}.

can_catch(F = #fighter{lev = Lev},
          #fighter{type = 2, base_id = BaseId}) ->
    case check_nums(F) of
        true ->
            LevBreakTimes = lev_break:get_times(F),
            case pet_data:get_catch(BaseId) of
                #{need_lev_break := NeedLevBreak}
                    when LevBreakTimes < NeedLevBreak ->
                    {false, lang:get("还没突破, 无法捕捉")};
                #{lev := NeedLev} when Lev < NeedLev ->
                    {false, lang:get("等级不足, 无法捕捉")};
                #{pet_id := PetBaseId, genre := Genre,
                  ratio := Ratio} ->
                    {true, {PetBaseId, Genre, Ratio}};
                _ -> {false, lang:get("该单位不可捕捉")}
            end;
        {false, Reason} -> {false, Reason}
    end;
can_catch(_, _) -> {false, lang:get("该单位不可捕捉")}.

free(PetId,
     Role = #role{m_pet = #m_pet{pets = Pets}}) ->
    case lists:keyfind(PetId, #pet.id, Pets) of
        Pet = #pet{base_id = BaseId, grade = Grade,
                   stones = Stones, name = SubPetName} ->
            case pet_util:check_free(Pet, Role) of
                true ->
                    MountRole = mount:free_pet(Role, PetId),
                    NewRole = del_pet(Pet, MountRole),
                    log:pet(NewRole, "扣除宠物(Id)", Pet, [], true),
                    case pet_data:get_grade({BaseId, Grade + 1}) of
                        {_AddAptitude, _HoleNum} ->
                            MailItems = [Item || Item = #item{} <- Stones],
                            case MailItems of
                                [] -> ok;
                                _ ->
                                    Title = lang:get("宠物放生返还"),
                                    Content =
                                        notice:format(lang:get("由于您放生的宠物~ts身上携带有~ts的护符/符石，现已返还，请查收哦:"),
                                                      [{string_2,
                                                        2,
                                                        SubPetName},
                                                       {string_2,
                                                        1,
                                                        lang:get("可拆卸")}]),
                                    mail:send(Role, Title, Content, MailItems),
                                    ok
                            end;
                        _ -> ok
                    end,
                    {ok, NewRole};
                {false, Reason} -> {false, Reason}
            end;
        _ -> {false, lang:get("无法找到宠物")}
    end.

del_pet(by_base_id, BaseId,
        Role = #role{m_pet = #m_pet{pets = Pets}}) ->
    case [Pet
          || Pet = #pet{genre = 3, lev = 1, status = 0,
                        base_id = PetBaseId}
                 <- Pets,
             PetBaseId =:= BaseId]
        of
        [] -> {false, lang:get("没有可删除的宠物")};
        [Head = #pet{id = PetId} | _] ->
            NewRole = del_pet(Head, Role),
            role:link_send(NewRole, 10522, {PetId, 1, ""}),
            log:pet(NewRole, "扣除宠物(BaseId)", Head, [], true),
            {ok, NewRole}
    end;
del_pet(by_id, PetId,
        Role = #role{m_pet = #m_pet{pets = Pets}}) ->
    case lists:keyfind(PetId, #pet.id, Pets) of
        #pet{status = 1} -> {false, lang:get("宠物出战中, 无法删除")};
        Pet = #pet{id = PetId} ->
            NewRole = del_pet(Pet, Role),
            role:link_send(Role, 10522, {PetId, 1, ""}),
            log:pet(NewRole, "扣除宠物(Id)", Pet, [], true),
            {ok, NewRole};
        _ -> {false, lang:get("无法找到宠物")}
    end.

del_pet(#pet{id = PetId, base_id = BaseId},
        Role = #role{m_pet = Mpet = #m_pet{pets = Pets}}) ->
    NewPets = lists:keydelete(PetId, #pet.id, Pets),
    NewMpet = Mpet#m_pet{pets = NewPets},
    NewRole = Role#role{m_pet = NewMpet},
    case max_talent_pet(NewRole) of
        MaxPet = #pet{} ->
            rank_listener:handle(pet, NewRole, MaxPet);
        _ -> skip
    end,
    role_trigger:fire(#evt_del_pet{base_id = BaseId,
                                   num = 1},
                      NewRole).

add_pet_nums(Role = #role{m_pet =
                              Mpet = #m_pet{pet_nums = PetNums}}) ->
    case pet_data:add_pet_nums(PetNums) of
        false -> {false, PetNums, lang:get("当前已达上限, 无法继续开启")};
        NeedItem ->
            Loss = format:val_to_loss(NeedItem),
            case role_gain:do(Loss, Role) of
                {false, #loss{msg = Msg}} -> {false, PetNums, Msg};
                {ok, NewRole} ->
                    NewMpet = Mpet#m_pet{pet_nums = PetNums + 1},
                    Nr = NewRole#role{m_pet = NewMpet},
                    {ok, PetNums + 1, Nr}
            end
    end.

exchange(Role = #role{id = RoleId, name = RoleName},
         Genre) ->
    Result = case pet_data:get_all_exchange(Genre) of
                 PetList = [_ | _] ->
                     PetBaseId = util:rand_list(PetList),
                     pet_data:get_exchange(PetBaseId);
                 _ -> {false, lang:get("当前没有该宠物可以兑换")}
             end,
    case Result of
        #{base_id := BaseId, cost := Cost,
          genre := GenreType} ->
            Loss = format:val_to_loss(Cost,
                                      #{item_base_id_auto_buy => 1,
                                        auto_scene => lang:get("宠物兑换")}),
            case role_gain:do_notice(Loss, Role) of
                {ok, Role1} ->
                    case create(Role1,
                                #{base_id => BaseId, genre => GenreType,
                                  from => "兑换神兽"})
                        of
                        {ok, NewRole} ->
                            case pet_data:get_base(BaseId) of
                                #pet_base{name = PetName} ->
                                    NewPetName = util:flist(lang:get("[~ts]"),
                                                            [PetName]),
                                    Msg =
                                        notice:format(lang:get("天地轰鸣，~ts收集了~ts在神兽使者处获得一只~ts{face_1, "
                                                               "36}"),
                                                      [{role_1,
                                                        RoleId,
                                                        RoleName},
                                                       {item_2, Cost},
                                                       {string_2,
                                                        4,
                                                        NewPetName}]),
                                    notice:cast(all, 5, Msg);
                                _ -> ok
                            end,
                            {ok, NewRole, BaseId};
                        {false, Reason} -> {false, Reason}
                    end;
                {false, #loss{msg = Msg}} -> {false, Msg}
            end;
        {false, Reason} -> {false, Reason};
        _ -> {false, lang:get("没有宠物可以兑换")}
    end.

exchange(Role = #role{id = RoleId, name = RoleName,
                      m_pet = #m_pet{pets = Pets}},
         Id, PetBaseId) ->
    case pet_data:get_exchange(PetBaseId) of
        #{change_cost := []} -> {false, lang:get("该宠物不能兑换")};
        #{base_id := BaseId, change_cost := Cost,
          genre := GenreType} ->
            case lists:keyfind(Id, #pet.id, Pets) of
                #pet{status = 1} -> {false, lang:get("宠物出战中, 无法不能兑换")};
                #pet{grade = Grade} when Grade > 0 ->
                    {false, lang:get("该神兽已经进阶过，无法进行更换")};
                #pet{genre = Genre} when GenreType =/= Genre ->
                    {false, lang:get("不同宠物类型不能进行转换")};
                #pet{spirit_attached_id = SpiritAttachedId,
                     spirit_child_flag = SpiritChildFlag}
                    when SpiritAttachedId =/= 0 orelse
                             SpiritChildFlag =/= 0 ->
                    {false, lang:get("宠物附灵中不能进行转换")};
                #pet{spirit_attached = SpiritAttached}
                    when SpiritAttached =/= 0 ->
                    {false, lang:get("宠物附灵中不能进行转换")};
                #pet{base_id = BaseId} ->
                    {false, lang:get("相同神兽之间不能进行转换")};
                Pet = #pet{id = PetId, stones = Stones, lev = Lev,
                           exp = Exp, name = OldPetName, max_exp = MaxExp} ->
                    NRole = del_pet(Pet, Role),
                    role:link_send(Role, 10522, {PetId, 1, ""}),
                    Loss = format:val_to_loss(Cost,
                                              #{item_base_id_auto_buy => 1,
                                                auto_scene =>
                                                    lang:get("宠物转换")}),
                    case role_gain:do_notice(Loss, NRole) of
                        {ok, Role1} ->
                            PointList = case Lev > 1 of
                                            true ->
                                                [{point, Lev * 5},
                                                 {p_str, Lev},
                                                 {p_con, Lev},
                                                 {p_mag, Lev},
                                                 {p_agi, Lev},
                                                 {p_end, Lev}];
                                            _ -> []
                                        end,
                            MountRole = mount:free_pet(Role1, PetId),
                            case create(MountRole,
                                        #{base_id => BaseId, genre => GenreType,
                                          from => "兑换神兽"},
                                        [{stone, Stones},
                                         {lev, Lev},
                                         {exp, Exp},
                                         {max_exp, MaxExp}]
                                            ++ PointList)
                                of
                                {ok, NewRole} ->
                                    case pet_data:get_base(BaseId) of
                                        #pet_base{name = PetName} ->
                                            NewPetName =
                                                util:flist(lang:get("[~ts]"),
                                                           [PetName]),
                                            Msg =
                                                notice:format(lang:get("电闪雷鸣，~ts使用了~ts将自己的~ts转换成了~ts{face_1,29}"),
                                                              [{role_1,
                                                                RoleId,
                                                                RoleName},
                                                               {item_2, Cost},
                                                               {string_2,
                                                                4,
                                                                OldPetName},
                                                               {string_2,
                                                                4,
                                                                NewPetName}]),
                                            notice:cast(all, 5, Msg);
                                        _ -> ok
                                    end,
                                    {ok, NewRole};
                                {false, Reason} -> {false, Reason}
                            end;
                        {false, #loss{msg = Msg}} -> {false, Msg}
                    end;
                _ -> {false, lang:get("无法找到宠物")}
            end;
        _ -> {false, lang:get("没有宠物可以兑换")}
    end.

exchange_spec(Role = #role{id = RoleId,
                           name = RoleName},
              PetBaseId) ->
    case pet_data:get_exchange_spec(PetBaseId) of
        #{base_id := BaseId, cost := Cost,
          genre := GenreType} ->
            Loss = format:val_to_loss(Cost,
                                      #{item_base_id_auto_buy => 1,
                                        auto_scene => lang:get("兑换指定宠物")}),
            case role_gain:do_notice(Loss, Role) of
                {ok, Role1} ->
                    case create(Role1,
                                #{base_id => BaseId, genre => GenreType,
                                  from => "兑换神兽"})
                        of
                        {ok, NewRole} ->
                            case pet_data:get_base(BaseId) of
                                #pet_base{name = PetName} ->
                                    NewPetName = util:flist(lang:get("[~ts]"),
                                                            [PetName]),
                                    Msg =
                                        notice:format(lang:get("天地轰鸣，~ts收集了~ts在神兽使者处获得一只~ts{face_1, "
                                                               "36}"),
                                                      [{role_1,
                                                        RoleId,
                                                        RoleName},
                                                       {item_2, Cost},
                                                       {string_2,
                                                        4,
                                                        NewPetName}]),
                                    notice:cast(all, 5, Msg);
                                _ -> ok
                            end,
                            {ok, NewRole, BaseId};
                        {false, Reason} -> {false, Reason}
                    end;
                {false, #loss{msg = Msg}} -> {false, Msg}
            end;
        _ -> {false, lang:get("没有宠物可以兑换")}
    end.

get_refining(Role, PetId, PetIdSub) ->
    case pet_util:check_refining_sub(PetIdSub, Role) of
        {true, PetSub = #pet{}} ->
            case pet_util:check_refining(PetId, Role) of
                {true, Pet = #pet{}} ->
                    case refining_data_get([apt],
                                           Pet,
                                           PetSub,
                                           #{id => PetId})
                        of
                        {ok, #{apt_list := AptList}} ->
                            case pet_aptitude:refining_get_aptitude(Role,
                                                                    Pet,
                                                                    AptList,
                                                                    [])
                                of
                                {ok, List} ->
                                    logger:debug("============ ~w",
                                                 [List],
                                                 pet,
                                                 1605),
                                    {ok, List};
                                _ -> ok
                            end;
                        _ -> ok
                    end;
                _ -> ok
            end;
        _ -> ok
    end.

refining(_Role, PetId, PetId) ->
    {false, lang:get("主副宠不能为同一只")};
refining(Role, PetId, PetIdSub) ->
    case pet_util:check_refining_sub(PetIdSub, Role) of
        {true, PetSub = #pet{name = SubPetName}} ->
            case pet_util:check_refining(PetId, Role) of
                {true, Pet = #pet{name = Name}} ->
                    case refining_data_get([exp, happy, apt, stone],
                                           Pet,
                                           PetSub,
                                           #{})
                        of
                        {ok, Args} ->
                            logger:debug("==============：~w",
                                         [Args],
                                         pet,
                                         1629),
                            case Args of
                                #{mail_stone := MailItems = [_ | _]} ->
                                    Title = lang:get("宠物炼化返还"),
                                    Content =
                                        notice:format(lang:get("由于您炼化的宠物~ts身上携带有~ts的护符/符石，现已返还，请查收哦:"),
                                                      [{string_2,
                                                        2,
                                                        SubPetName},
                                                       {string_2,
                                                        1,
                                                        lang:get("可拆卸")}]),
                                    mail:send(Role, Title, Content, MailItems),
                                    ok;
                                _ -> ok
                            end,
                            role:link_send(Role,
                                           10548,
                                           {1,
                                            notice:format(lang:get("炼化成功，~ts变得更加强大了"),
                                                          [{string_2,
                                                            5,
                                                            Name}])}),
                            Role1 = refining_do([exp, happy, apt],
                                                Role,
                                                Args#{id => PetId}),
                            Role2 = del_pet(PetSub, Role1),
                            Role3 = mount:free_pet(Role2, PetIdSub),
                            role:link_send(Role3, 10522, {PetIdSub, 1, ""}),
                            #role{m_pet = #m_pet{pets = NewPets}} = Role3,
                            case lists:keyfind(PetId, #pet.id, NewPets) of
                                NewPet when is_record(NewPet, pet) ->
                                    log:pet(Role3, "宠物炼化", Pet, NewPet, true),
                                    push_10502(Role3, NewPet),
                                    push_10503(Role3, NewPet);
                                _ -> ok
                            end,
                            log:pet(Role3, "宠物被炼化", PetSub, [], true),
                            NewRole = attr:calc_and_push(Role3),
                            {ok, NewRole};
                        {false, Reason} -> {false, Reason}
                    end;
                {false, Reason} -> {false, Reason}
            end;
        {false, Reason} -> {false, Reason}
    end.

refining_do([], Role, _Args) -> Role;
refining_do([exp | Tail],
            Role = #role{m_pet = #m_pet{pets = Pets}},
            Args = #{id := Id, exp := Exp}) ->
    case lists:keyfind(Id, #pet.id, Pets) of
        Pet = #pet{} ->
            case add_exp(Role, #{mode => Pet, val => Exp}) of
                {ok, NewRole} -> refining_do(Tail, NewRole, Args);
                _ -> refining_do(Tail, Role, Args)
            end;
        _ -> refining_do(Tail, Role, Args)
    end;
refining_do([happy | Tail],
            Role = #role{m_pet = MPet = #m_pet{pets = Pets}},
            Args = #{id := Id, happy := HappyAdd}) ->
    case lists:keyfind(Id, #pet.id, Pets) of
        #pet{genre = Genre} when Genre =:= 4 ->
            refining_do(Tail, Role, Args);
        #pet{genre = Genre} when Genre =:= 2 ->
            refining_do(Tail, Role, Args);
        Pet = #pet{happy = Happy, name = Name} ->
            NewPet = Pet#pet{happy = Happy + HappyAdd},
            Msg = notice:format(lang:get("~ts寿命+~ts点"),
                                [{string_2, 5, Name}, {string_2, 5, HappyAdd}]),
            notice:send(Role, 7, Msg),
            Pets1 = lists:keyreplace(Id, #pet.id, Pets, NewPet),
            refining_do(Tail,
                        Role#role{m_pet = MPet#m_pet{pets = Pets1}},
                        Args);
        _ -> refining_do(Tail, Role, Args)
    end;
refining_do([apt | Tail],
            Role = #role{m_pet = #m_pet{pets = Pets}},
            Args = #{id := Id, apt_list := AptList}) ->
    case lists:keyfind(Id, #pet.id, Pets) of
        Pet = #pet{} ->
            case pet_aptitude:refining_add_aptitude(Role,
                                                    Pet,
                                                    AptList,
                                                    0)
                of
                {ok, NewRole} -> refining_do(Tail, NewRole, Args);
                _ -> refining_do(Tail, Role, Args)
            end;
        _ -> refining_do(Tail, Role, Args)
    end.

refining_data_get([], _Pet, _PetSub, Args) ->
    {ok, Args};
refining_data_get([exp | Tail], #pet{lev = Lev} = Pet,
                  #pet{lev = LevSub} = PetSub, Args) ->
    case pet_data:get_refining_exp_sub(LevSub) of
        Exp when is_integer(Exp) ->
            case pet_data:get_refining_exp(Lev) of
                ExpRadio when is_integer(ExpRadio) ->
                    ExpAdd = round(Exp * (ExpRadio / 1000)),
                    refining_data_get(Tail,
                                      Pet,
                                      PetSub,
                                      Args#{exp => ExpAdd});
                _ -> {false, lang:get("经验转换系数配置错误")}
            end;
        _ -> {false, lang:get("副宠经验转换系数配置错误")}
    end;
refining_data_get([happy | Tail], Pet,
                  #pet{talent = TalentSub} = PetSub, Args) ->
    HappyAdd = min(round(4.0e-1 * max(TalentSub - 2500, 0) +
                             100),
                   1000),
    refining_data_get(Tail,
                      Pet,
                      PetSub,
                      Args#{happy => HappyAdd});
refining_data_get([apt | Tail],
                  Pet = #pet{pet_attr = PetAttr},
                  PetSub = #pet{lev = LevSub, pet_attr = PetAttrSub},
                  Args) ->
    case pet_data:get_refining_lev(LevSub) of
        #{args := ArgsA} ->
            case apt_add_list([1, 2, 3, 4, 5],
                              PetAttr,
                              PetAttrSub,
                              ArgsA,
                              [])
                of
                {ok, List} ->
                    refining_data_get(Tail,
                                      Pet,
                                      PetSub,
                                      Args#{apt_list => List});
                {false, Reason} -> {false, Reason}
            end;
        _ -> {false, lang:get("资质系数表配置错误")}
    end;
refining_data_get([stone | Tail], Pet,
                  PetSub = #pet{base_id = BaseId, grade = Grade,
                                stones = Stones},
                  Args) ->
    case pet_data:get_grade({BaseId, Grade + 1}) of
        {_AddAptitude, _HoleNum} ->
            MailItems = [Item || Item = #item{} <- Stones],
            refining_data_get(Tail,
                              Pet,
                              PetSub,
                              Args#{mail_stone => MailItems});
        _ -> refining_data_get(Tail, Pet, PetSub, Args)
    end.

apt_add_list([], _PetAttr, _PetAttrSub, _ArgsA, List) ->
    {ok, List};
apt_add_list([1 | Tail],
             PetAttr = #pet_attr{hp_aptitude = Apt},
             PetAttrSub = #pet_attr{hp_aptitude = AptSub}, ArgsA,
             List) ->
    Val = round(AptSub / Apt * 1000),
    case pet_data:get_refining_apt(Val) of
        #{args := ArgsB} ->
            apt_add_list(Tail,
                         PetAttr,
                         PetAttrSub,
                         ArgsA,
                         [{1, ArgsA * ArgsB / (1000 * 1000)} | List]);
        _ -> {false, lang:get("资质系数表配置错误")}
    end;
apt_add_list([2 | Tail],
             PetAttr = #pet_attr{phy_aptitude = Apt},
             PetAttrSub = #pet_attr{phy_aptitude = AptSub}, ArgsA,
             List) ->
    Val = round(AptSub / Apt * 1000),
    case pet_data:get_refining_apt(Val) of
        #{args := ArgsB} ->
            apt_add_list(Tail,
                         PetAttr,
                         PetAttrSub,
                         ArgsA,
                         [{2, ArgsA * ArgsB / (1000 * 1000)} | List]);
        _ -> {false, lang:get("资质系数表配置错误")}
    end;
apt_add_list([3 | Tail],
             PetAttr = #pet_attr{pdef_aptitude = Apt},
             PetAttrSub = #pet_attr{pdef_aptitude = AptSub}, ArgsA,
             List) ->
    Val = round(AptSub / Apt * 1000),
    case pet_data:get_refining_apt(Val) of
        #{args := ArgsB} ->
            apt_add_list(Tail,
                         PetAttr,
                         PetAttrSub,
                         ArgsA,
                         [{3, ArgsA * ArgsB / (1000 * 1000)} | List]);
        _ -> {false, lang:get("资质系数表配置错误")}
    end;
apt_add_list([4 | Tail],
             PetAttr = #pet_attr{magic_aptitude = Apt},
             PetAttrSub = #pet_attr{magic_aptitude = AptSub}, ArgsA,
             List) ->
    Val = round(AptSub / Apt * 1000),
    case pet_data:get_refining_apt(Val) of
        #{args := ArgsB} ->
            apt_add_list(Tail,
                         PetAttr,
                         PetAttrSub,
                         ArgsA,
                         [{4, ArgsA * ArgsB / (1000 * 1000)} | List]);
        _ -> {false, lang:get("资质系数表配置错误")}
    end;
apt_add_list([5 | Tail],
             PetAttr = #pet_attr{aspd_aptitude = Apt},
             PetAttrSub = #pet_attr{aspd_aptitude = AptSub}, ArgsA,
             List) ->
    Val = round(AptSub / Apt * 1000),
    case pet_data:get_refining_apt(Val) of
        #{args := ArgsB} ->
            apt_add_list(Tail,
                         PetAttr,
                         PetAttrSub,
                         ArgsA,
                         [{5, ArgsA * ArgsB / (1000 * 1000)} | List]);
        _ -> {false, lang:get("资质系数表配置错误")}
    end.

push_10502(Role,
           #pet{id = Id, name = Name, exp = Exp, max_exp = MaxExp,
                lev = Lev, happy = Happy, status = Status}) ->
    role:link_send(Role,
                   10502,
                   {Id, Name, Exp, MaxExp, Lev, Happy, Status}),
    ok.

push_10503(Role,
           Pet = #pet{id = Id, pet_attr = PetAttr, attr = Attr,
                      hp = Hp, mp = Mp, talent = Talent,
                      feed_point = FeedPoint, free_reset_flag = FreeResetFlag,
                      grade_attr = GradeAttr, genre = Genre,
                      growth_type = GrowthType, growth = Growth,
                      use_growth = UseGrowth, break_times = BreakTimes,
                      handbook_attr = HandBookAttr,
                      handbook_num = HandbookNum,
                      star_handbook_num = StarHandBookNum,
                      spirit_attached = SpiritAttached,
                      spirit_attached_id = SpiritAttachedId, unreal = UnReal,
                      spirit_child_flag = SpiritChildFlag,
                      spirit_child_id = SpiritChildId,
                      unreal_looks_flag = UnrealLooks}) ->
    rank_listener:handle(pet, Role, Pet),
    role:link_send(Role,
                   10503,
                   {Id,
                    Talent,
                    Genre,
                    Growth,
                    GrowthType,
                    Hp,
                    Mp,
                    FeedPoint,
                    FreeResetFlag,
                    UseGrowth,
                    Attr,
                    PetAttr,
                    GradeAttr,
                    BreakTimes,
                    HandBookAttr,
                    HandbookNum,
                    StarHandBookNum,
                    SpiritAttached,
                    SpiritAttachedId,
                    UnReal,
                    SpiritChildFlag,
                    SpiritChildId,
                    UnrealLooks}),
    ok.

push_10504(Role, Pet) ->
    rank_listener:handle(pet, Role, Pet),
    role:link_send(Role, 10504, {[Pet]}),
    ok.

push_10525(Role,
           #pet{id = PetId, hp = Hp, mp = Mp, hp_max = HpMax,
                mp_max = MpMax}) ->
    role:link_send(Role,
                   10525,
                   {PetId, Hp, Mp, HpMax, MpMax}),
    ok.

push_10511(Role, #pet{id = Id, skills = Skills}) ->
    role:link_send(Role, 10511, {Id, Skills}),
    ok.

push_10512(Role,
           #pet{id = Id, stones = Stones, grade = Grade}) ->
    role:link_send(Role, 10512, {Id, Grade, Stones}),
    ok.

push_10555(Role,
           #pet{id = PetId, pet_tmp_aptitude = TmpAptitude}) ->
    logger:debug("宠物洗髓数据g更新:~w", [TmpAptitude], pet, 1833),
    role:link_send(Role, 10555, {PetId, TmpAptitude}),
    ok;
push_10555(Role = #role{m_pet = #m_pet{pets = Pets}},
           PetId) ->
    case lists:keyfind(PetId, #pet.id, Pets) of
        #pet{pet_tmp_aptitude = TmpAptitude} ->
            role:link_send(Role, 10555, {PetId, TmpAptitude}),
            ok;
        _ -> ok
    end.

push_10566(Role, PetId, PetIdSub) ->
    case get_refining(Role, PetId, PetIdSub) of
        {ok, List} -> role:link_send(Role, 10566, {List});
        _ -> ok
    end,
    ok.

get_look(Pet = #pet{base_id = BaseId, genre = Genre,
                    grade = Grade,
                    pet_skin = #pet_skin{use_skin = UseSkin}})
    when Genre =:= 1 ->
    {Model, Skin} = case pet_data:get_base(BaseId) of
                        #pet_base{skin_id_s0 = SkinIdS0, model_id = ModelId0}
                            when Grade =:= 0 ->
                            {ModelId0, SkinIdS0};
                        #pet_base{skin_id_s1 = SkinIdS1, model_id1 = ModelId1}
                            when Grade =:= 1 ->
                            {ModelId1, SkinIdS1};
                        #pet_base{skin_id_s2 = SkinIdS2, model_id2 = ModelId2}
                            when Grade =:= 2 ->
                            {ModelId2, SkinIdS2};
                        #pet_base{skin_id_s3 = SkinIdS3, model_id3 = ModelId3}
                            when Grade =:= 3 ->
                            {ModelId3, SkinIdS3};
                        _ -> {0, 0}
                    end,
    NewSkin = case UseSkin =:= 0 of
                  true -> Skin;
                  _ -> UseSkin
              end,
    NewModel = case UseSkin =:= 0 of
                   true -> Model;
                   _ ->
                       case pet_data:get_skin({BaseId, NewSkin}) of
                           #{model_id := ModelId} -> ModelId;
                           _ -> Model
                       end
               end,
    Looks = [{51, NewModel, NewSkin, ""}],
    unreal_look(Pet, Looks);
get_look(Pet = #pet{base_id = BaseId, genre = Genre,
                    grade = Grade,
                    pet_skin = #pet_skin{use_skin = UseSkin}})
    when Genre =:= 2 orelse Genre =:= 4 ->
    {Model, Skin} = case pet_data:get_base(BaseId) of
                        #pet_base{skin_id_0 = SkinId0, model_id = ModelId0}
                            when Grade =:= 0 ->
                            {ModelId0, SkinId0};
                        #pet_base{skin_id_1 = SkinId1, model_id1 = ModelId1}
                            when Grade =:= 1 ->
                            {ModelId1, SkinId1};
                        #pet_base{skin_id_2 = SkinId2, model_id2 = ModelId2}
                            when Grade =:= 2 ->
                            {ModelId2, SkinId2};
                        #pet_base{skin_id_3 = SkinId3, model_id3 = ModelId3}
                            when Grade =:= 3 ->
                            {ModelId3, SkinId3};
                        _ -> {0, 0}
                    end,
    NewSkin = case UseSkin =:= 0 of
                  true -> Skin;
                  _ -> UseSkin
              end,
    NewModel = case UseSkin =:= 0 of
                   true -> Model;
                   _ ->
                       case pet_data:get_skin({BaseId, NewSkin}) of
                           #{model_id := ModelId} -> ModelId;
                           _ -> Model
                       end
               end,
    Looks = [{51, NewModel, NewSkin, ""}],
    unreal_look(Pet, Looks);
get_look(Pet = #pet{base_id = BaseId, grade = Grade}) ->
    {Model, Skin} = case pet_data:get_base(BaseId) of
                        #pet_base{skin_id_1 = SkinId1, model_id1 = Model1}
                            when BaseId =:= 20013 andalso Grade >= 1 ->
                            {Model1, SkinId1};
                        #pet_base{skin_id_0 = SkinId0, model_id = Model0}
                            when Grade =:= 0 ->
                            {Model0, SkinId0};
                        #pet_base{skin_id_1 = SkinId1, model_id1 = Model1}
                            when Grade =:= 1 ->
                            {Model1, SkinId1};
                        #pet_base{skin_id_2 = SkinId2, model_id2 = Model2}
                            when Grade =:= 2 ->
                            {Model2, SkinId2};
                        #pet_base{skin_id_3 = SkinId3, model_id3 = Model3}
                            when Grade =:= 3 ->
                            {Model3, SkinId3};
                        _ -> {0, 0}
                    end,
    Looks = [{51, Model, Skin, ""}],
    unreal_look(Pet, Looks).

unreal_look(#pet{unreal = []}, Looks) -> Looks;
unreal_look(#pet{base_id = _BaseId,
                 unreal = [#pet_unreal{item_id = ItemId} | _],
                 unreal_looks_flag = LooksFlag},
            Looks) ->
    case pet_data:get_unreal(ItemId) of
        #pet_unreal_data{skin_id = TransformId} ->
            case transform_data:get_hard_show(TransformId) of
                #{res := TModelId, skin := TSkin}
                    when LooksFlag =:= 0 ->
                    Looks ++
                        [{79, TModelId, TSkin, ""}] ++
                            [{75, 0, TransformId, ""}] ++
                                [{78, 0, TransformId, ""}];
                #{res := _TModelId, skin := _TSkin}
                    when LooksFlag =:= 1 ->
                    Looks ++ [{78, 0, TransformId, ""}];
                _ -> Looks
            end;
        _ -> Looks
    end;
unreal_look(_, Looks) -> Looks.

learn_normal_skill(Skills) ->
    learn_normal_skill(Skills, []).

learn_normal_skill([], Skills) -> Skills;
learn_normal_skill([S | T], Skills) ->
    case skill_data:get_pet({S, 1}) of
        #pet_base_skill{type = Type, step = Step} ->
            Skill = #pet_skill{id = S, type = Type, source = 1,
                               step = Step},
            learn_normal_skill(T, [Skill | Skills]);
        _ -> learn_normal_skill(T, Skills)
    end.

do_create(CreateArgs) ->
    BaseId = maps:get(base_id, CreateArgs, 0),
    case pet_data:get_base(BaseId) of
        PetBase = #pet_base{name = Name, type = Type,
                            base_skills = BaseSkills, genre = Genre,
                            growth_blue = GrowthBlue,
                            growth_purple = GrowthPurple,
                            growth_orange = GrowthOrange,
                            growth_red = GrowthRed, base_happy = BaseHappy,
                            min_happy_ratio = MinHappyRatio,
                            max_happy_ratio = MaxHappyRatio,
                            min_happy_genre_ratio = MinHappyGenreRatio,
                            max_happy_genre_ratio = MaxHappyGenreRatio} ->
            Genre1 = maps:get(genre, CreateArgs, Genre),
            Lev = max(1, maps:get(lev, CreateArgs, 1)),
            Exp = calc_pet_exp(Lev),
            CreateApt = maps:get(aptitude, CreateArgs, undefined),
            PetAttr = #pet_attr{},
            PetAttr1 = rand_apt(PetAttr,
                                PetBase,
                                BaseId,
                                Genre1,
                                CreateApt),
            NewPetAttr = create_point(PetAttr1, BaseId),
            PetBaseSkills = case maps:get(skills,
                                          CreateArgs,
                                          undefined)
                                of
                                CreateSkill = [_ | _] ->
                                    learn_normal_skill(CreateSkill);
                                _ when Genre1 =:= 3 -> [];
                                _ ->
                                    Skills = util:rand_all(BaseSkills, 2),
                                    learn_normal_skill([S || {S, _} <- Skills])
                            end,
            ExchangeSkill = get_exchange_skill(BaseId),
            NewSkills = ExchangeSkill ++ PetBaseSkills,
            GrowthList = [{2, GrowthBlue},
                          {3, GrowthPurple},
                          {4, GrowthOrange},
                          {5, GrowthRed}],
            {GrowthType, Growth} = case Genre1 of
                                       2 -> {5, GrowthRed};
                                       4 -> {5, GrowthRed};
                                       6 -> {5, GrowthRed};
                                       _ when BaseId =:= 10037 ->
                                           {5, GrowthRed};
                                       _ ->
                                           CreateGrowthType =
                                               maps:get(growth_type,
                                                        CreateArgs,
                                                        undefined),
                                           case lists:keyfind(CreateGrowthType,
                                                              1,
                                                              GrowthList)
                                               of
                                               {FindGrowthType, FindGrowth} ->
                                                   {FindGrowthType, FindGrowth};
                                               _ ->
                                                   rand_growth({GrowthBlue,
                                                                GrowthPurple,
                                                                GrowthOrange,
                                                                GrowthRed})
                                           end
                                   end,
            logger:debug("====={GrowthType, Growth}====:~w",
                         [{GrowthType, Growth, Genre1, BaseId, CreateArgs}],
                         pet,
                         1984),
            NewHappy = rand_happy(BaseHappy,
                                  Genre1,
                                  MinHappyRatio,
                                  MaxHappyRatio,
                                  MinHappyGenreRatio,
                                  MaxHappyGenreRatio),
            CombatTalk = pet_effect:init_talk(BaseId),
            RuneList = pet_rune:make_rune(BaseId),
            Pet = #pet{type = Type, lev = 1, name = Name,
                       genre = Genre1, base_id = BaseId, pet_attr = NewPetAttr,
                       exp = Exp, max_exp = pet_data:get_exp(1),
                       skills = NewSkills, growth_type = GrowthType,
                       growth = Growth, happy = NewHappy,
                       combat_talk = CombatTalk, pet_rune = RuneList},
            {ok, Pet};
        _ ->
            logger:error("错误的宠物基础数据:~w", [BaseId], pet, 1991),
            {false, lang:get("无法获得宠物数据")}
    end.

create_point(PetAttr, _BaseId) ->
    PetAttr#pet_attr{p_str = 2, p_con = 2, p_mag = 2,
                     p_agi = 2, p_end = 2, pre_str = 0, pre_con = 0,
                     pre_mag = 0, pre_agi = 0, pre_end = 0}.

calc_pet_exp(Lev) when Lev =< 1 -> 0;
calc_pet_exp(Lev) -> calc_pet_exp(Lev, 1, 0).

calc_pet_exp(Lev, NowLev, Exp) when NowLev >= Lev ->
    Exp;
calc_pet_exp(Lev, NowLev, Exp) ->
    case pet_data:get_exp(NowLev) of
        MaxExp when MaxExp > 0 ->
            calc_pet_exp(Lev, NowLev + 1, Exp + MaxExp);
        _ -> Exp
    end.

auto_add_point(Pet = #pet{pet_attr =
                              PetAttr = #pet_attr{point = Point, p_str = Pstr,
                                                  p_con = Pcon, p_mag = Pmag,
                                                  p_agi = Pagi, p_end = Pend}},
               Role, CreateArgs)
    when Point >= 5 ->
    case maps:get(auto_add_point, CreateArgs, undefined) of
        {AddStr, AddCon, AddMag, AddAgi, AddEnd}
            when AddStr + AddCon + AddMag + AddAgi + AddEnd =:= 5 ->
            LastPoint = Point rem 5,
            Ratio = Point div 5,
            Pstr1 = Pstr + Ratio * AddStr,
            Pcon1 = Pcon + Ratio * AddCon,
            Pmag1 = Pmag + Ratio * AddMag,
            Pagi1 = Pagi + Ratio * AddAgi,
            Pend1 = Pend + Ratio * AddEnd,
            PetAttr1 = PetAttr#pet_attr{point = LastPoint,
                                        p_str = Pstr1, p_con = Pcon1,
                                        p_mag = Pmag1, p_agi = Pagi1,
                                        p_end = Pend1},
            Pet1 = Pet#pet{pet_attr = PetAttr1},
            pet_attr:calc(Pet1, Role);
        _ -> {ok, Pet, Role}
    end;
auto_add_point(Pet, Role, _) -> {ok, Pet, Role}.

calc_point_ratio(#pet{pet_attr =
                          #pet_attr{p_str = Pstr, p_con = Pcon, p_mag = Pmag,
                                    p_agi = Pagi, p_end = Pend}},
                 Type) ->
    ToTalPoint = Pstr + Pcon + Pmag + Pagi + Pend + 1,
    case Type of
        101 -> round(Pstr / ToTalPoint * 100 - 10);
        102 -> round(Pcon / ToTalPoint * 100 - 10);
        103 -> round(Pmag / ToTalPoint * 100 - 10);
        104 -> round(Pagi / ToTalPoint * 100 - 10);
        105 -> round(Pend / ToTalPoint * 100 - 10);
        _ -> round(Pstr / ToTalPoint * 100 - 10)
    end.

auto_war(PetId, Role, CreateArgs) ->
    case maps:get(auto_war, CreateArgs, 0) of
        1 ->
            case war(Role, PetId) of
                {ok, NewRole, Msg} ->
                    notice:return(Msg),
                    NewRole;
                _ -> Role
            end;
        0 -> Role
    end.

check_can_create(Role, CreateArgs) ->
    case check_nums(Role) of
        true ->
            LevBreakTimes = lev_break:get_times(Role),
            BaseId = maps:get(base_id, CreateArgs, 0),
            case pet_data:get_base(BaseId) of
                #pet_base{need_lev_break = NeedLevBreak}
                    when LevBreakTimes >= NeedLevBreak ->
                    true;
                #pet_base{} -> {false, lang:get("你还未突破，无法获得该宠物")};
                _ ->
                    logger:error("错误的宠物基础数据:~w", [BaseId], pet, 2083),
                    {false, lang:get("无法获得宠物数据")}
            end;
        {false, Reason} -> {false, Reason}
    end.

check_nums(#role{m_pet =
                     #m_pet{pets = Pets, pet_nums = PetsNum}}) ->
    case length([P
                 || P = #pet{spirit_attached_id = 0,
                             spirit_child_flag = 0}
                        <- Pets])
             >= PetsNum
        of
        true -> {false, lang:get("当前宠物栏已满, 无法增加宠物")};
        _ -> true
    end;
check_nums(#fighter{max_catch_num = CatchNum,
                    catched = Catched})
    when length(Catched) >= CatchNum ->
    {false, lang:get("当前宠物栏已满, 无法捕捉宠物")};
check_nums(_) -> true.

find_pet(PetId, #role{m_pet = #m_pet{pets = Pets}}) ->
    case lists:keyfind(PetId, #pet.id, Pets) of
        Pet = #pet{} -> {ok, Pet};
        false -> false
    end.

find_pet_by_base_id(BaseID,
                    #role{m_pet = #m_pet{pets = Pets}}) ->
    case lists:keyfind(BaseID, #pet.base_id, Pets) of
        Pet = #pet{} -> {ok, Pet};
        false -> false
    end.

pet_auto_levup(_Role, Pet = #pet{lev = Lev}, ToLev)
    when Lev >= ToLev ->
    Pet;
pet_auto_levup(Role, Pet = #pet{lev = Lev}, ToLev)
    when Lev < ToLev ->
    NewPet = #pet{lev = NewLev} = pet_attr:levup(Pet, Role),
    case NewLev > Lev of
        true -> pet_auto_levup(Role, NewPet, ToLev);
        _ -> NewPet
    end;
pet_auto_levup(_, Pet, _) ->
    logger:error("宠物升级匹配错误", [], pet, 2132),
    Pet.

time_get(NextId, Lev) ->
    case pet_data:get_fresh(NextId) of
        #{time := 0} -> 0;
        #{time := _Time, need_lev := NeedLev}
            when Lev >= NeedLev ->
            date:unixtime(zero) + 86400;
        _ -> 0
    end.

levup(Role = #role{m_pet = #m_pet{fresh_id = 0}}, _,
      _) ->
    Role;
levup(Role = #role{m_pet = #m_pet{time = Time}}, _, _)
    when Time =/= 0 ->
    Role;
levup(Role = #role{m_pet =
                       MPet = #m_pet{fresh_id = FreshId}},
      _Lev, NewLev) ->
    case pet_data:get_fresh(FreshId) of
        #{time := 0} -> Role;
        #{time := _NeedTime, need_lev := NeedLev}
            when NewLev >= NeedLev ->
            NextTime = date:unixtime(zero) + 86400,
            NewMPet = MPet#m_pet{time = NextTime},
            NewRole = Role#role{m_pet = NewMPet},
            pet_util:push_client_pets(NewRole),
            NewRole;
        _ -> Role
    end.

apply_evt(#evt_mount_attr{},
          Role = #role{m_pet = #m_pet{pets = Pets}}) ->
    logger:debug("坐骑属性变化 --->>>> 宠物属性变化", [], pet, 2160),
    NRole = pet_attr:batch_calc(Pets, Role),
    pet_util:push_client_pets(NRole),
    {ok, NRole};
apply_evt(_, _Role) -> ok.

gm_set_pet_lev(Role, Lev) ->
    logger:debug("设置宠物等级[Lev]:~w", [Lev], pet, 2170),
    gm_set_pet_lev(Role, 1, Lev).

gm_set_pet_lev(Role, Lev, TargetLev)
    when Lev >= TargetLev ->
    logger:debug("设置宠物等级[TargetLev]:~w",
                 [TargetLev],
                 pet,
                 2173),
    Exp = pet_data:get_exp(TargetLev),
    case role_gain:do([#gain{label = pet_exp, val = Exp}],
                      Role)
        of
        {false, G} -> {reply, G#gain.msg};
        {ok, NewRole} -> {ok, NewRole}
    end;
gm_set_pet_lev(Role, Lev, TargetLev) ->
    logger:debug("设置宠物等级[Lev, TargetLev]:~w,~w",
                 [Lev, TargetLev],
                 pet,
                 2181),
    Exp = pet_data:get_exp(Lev),
    case role_gain:do([#gain{label = pet_exp, val = Exp}],
                      Role)
        of
        {false, G} -> {reply, G#gain.msg};
        {ok, NewRole} ->
            gm_set_pet_lev(NewRole, Lev + 1, TargetLev)
    end.

do_loss(gold,
        #role{assets =
                  #assets{gold = OldVal, star_gold = OldVal1}},
        #role{assets =
                  #assets{gold = NewVal, star_gold = NewVal1}})
    when OldVal > NewVal orelse OldVal1 > NewVal1 ->
    LossGold = OldVal - NewVal,
    LossStarGold = OldVal1 - NewVal1,
    Msg = case {LossStarGold, LossGold} of
              {V1, V2} when V1 > 0 andalso V2 > 0 ->
                  notice:format(lang:get("消耗~ts~ts"),
                                [{assets_1, 90026, V1}, {assets_1, 90002, V2}]);
              {V1, _} when V1 > 0 ->
                  notice:format(lang:get("消耗~ts"),
                                [{assets_1, 90026, V1}]);
              {_, V2} when V2 > 0 ->
                  notice:format(lang:get("消耗~ts"),
                                [{assets_1, 90002, V2}]);
              _ -> ""
          end,
    {true, Msg};
do_loss(gold, _, _) -> false.

update_max_exp(Role = #role{m_pet =
                                MPet = #m_pet{pets = Pets},
                            m_pet_store =
                                MPetStore = #m_pet_store{pets = Pets1}}) ->
    NewPets = update_max_exp(Pets, []),
    NewStorePets = update_max_exp(Pets1, []),
    Role#role{m_pet = MPet#m_pet{pets = NewPets},
              m_pet_store =
                  MPetStore#m_pet_store{pets = NewStorePets}}.

update_max_exp([], NewPets) -> NewPets;
update_max_exp([Pet = #pet{lev = Lev} | Rest],
               NewPets) ->
    NewMaxExp = pet_data:get_exp(Lev),
    NewPet = Pet#pet{max_exp = NewMaxExp},
    update_max_exp(Rest, [NewPet | NewPets]);
update_max_exp([_Pet | Rest], NewPets) ->
    update_max_exp(Rest, [_Pet | NewPets]).

send_gold_pet_mail() ->
    send_panda_mail(),
    send_horse_mail().

send_panda_mail() ->
    Roles = get_panda_roles(),
    Title = lang:get("熊猫大侠兑换调整 "),
    Content =
        lang:get("您在4月1日至5月24日期间兑换了熊猫大侠，由于兑换消耗有所调整，现返还以下奖励，请查收"),
    Items = [{22443, 0, 8}, {23740, 0, 8}],
    [begin
         case role_misc:is_local_role(RoleId) of
             true -> mail:send(RoleId, Title, Content, Items);
             _ -> ok
         end
     end
     || RoleId <- Roles].

send_horse_mail() ->
    Roles = get_horse_roles(),
    Title = lang:get("神马浮云兑换调整"),
    Content =
        lang:get("您在4月1日至5月24日期间兑换了神马浮云，由于兑换消耗有所调整，现返还以下奖励，请查收"),
    Items = [{22205, 0, 2}],
    [begin
         case role_misc:is_local_role(RoleId) of
             true -> mail:send(RoleId, Title, Content, Items);
             _ -> ok
         end
     end
     || RoleId <- Roles].

get_panda_roles() -> [].

get_horse_roles() -> [].

get_exchange_skill(BaseId) ->
    case pet_data:get_exchange_skill_info(BaseId) of
        #{skill_id := SkillId} ->
            case skill_data:get_pet({SkillId, 1}) of
                #pet_base_skill{type = Type, step = Step} ->
                    [#pet_skill{id = SkillId, type = Type, source = 5,
                                step = Step}];
                _ -> []
            end;
        _ -> []
    end.

change_unreal_loooks(Role = #role{m_pet =
                                      MPet = #m_pet{pets = Pets}},
                     PetId, Flag) ->
    NPets = case lists:keyfind(PetId, #pet.id, Pets) of
                Pet = #pet{name = PName, unreal_looks_flag = OFlag} ->
                    case OFlag of
                        1 ->
                            notice:send(Role,
                                        1,
                                        notice:format(lang:get("~ts将<color='#ffff00'>显示幻化外观</color>"),
                                                      [{role_2, PName}]));
                        _ ->
                            notice:send(Role,
                                        1,
                                        notice:format(lang:get("~ts幻化显示<color='#ffff00'>原外观</color>"),
                                                      [{role_2, PName}]))
                    end,
                    NPet = Pet#pet{unreal_looks_flag = Flag},
                    push_10503(Role, NPet),
                    lists:keyreplace(PetId, #pet.id, Pets, NPet);
                _ -> Pets
            end,
    NRole = Role#role{m_pet = MPet#m_pet{pets = NPets}},
    {ok, NRole}.

all_login() ->
    role_group:apply(world, {pet, login, []}).

check_exchange_skill(Role = #role{m_pet =
                                      MPet = #m_pet{pets = Pets}}) ->
    NewPets = check_exchange_skill(Pets, []),
    [push_10511(Role, Pet) || Pet = #pet{} <- NewPets],
    NewRole = Role#role{m_pet = MPet#m_pet{pets = NewPets}},
    {ok, NewRole}.

check_exchange_skill([], NewPets) ->
    lists:reverse(NewPets);
check_exchange_skill([Pet = #pet{base_id =
                                     BaseId = 10037,
                                 skills = Skills}
                      | Rest],
                     NewPets) ->
    NewSkills = case lists:keyfind(5,
                                   #pet_skill.source,
                                   Skills)
                    of
                    false ->
                        ExchangeSkill = get_exchange_skill(BaseId),
                        ExchangeSkill ++ Skills;
                    _ -> Skills
                end,
    NewPet = Pet#pet{skills = NewSkills},
    check_exchange_skill(Rest, [NewPet | NewPets]);
check_exchange_skill([_Pet | Rest], NewPets) ->
    check_exchange_skill(Rest, [_Pet | NewPets]).

do_aptitude_acc(Role, Id) ->
    logger:debug("=====~w", [Id], pet, 2317),
    case lists:member(Id, [10019, 10021, 10022]) of
        true ->
            Flag = var:get_var(Role, other, 2135, 0),
            case Flag =:= 0 of
                true ->
                    case do_bags_fresh(Role) of
                        Role ->
                            case do_store_fresh(Role) of
                                Role ->
                                    case do_family_fresh(Role) of
                                        Role -> Role;
                                        Role1 -> Role1
                                    end;
                                Role2 -> Role2
                            end;
                        Role3 -> Role3
                    end;
                _ -> Role
            end;
        _ -> Role
    end.

do_bags_fresh(Role = #role{p_bag =
                               Bags = #package{items = Items}}) ->
    logger:debug("======~w", [Items], pet, 2340),
    case lists:keyfind(20185, #item.base_id, Items) of
        Item = #item{extra = ExtraList} ->
            logger:debug("====", [], pet, 2343),
            NewAcc = case lists:keyfind(31, 1, ExtraList) of
                         {31, OldAcc, ""} -> OldAcc + 18;
                         _ -> 18
                     end,
            NewExtra = lists:keystore(31,
                                      1,
                                      ExtraList,
                                      {31, NewAcc, ""}),
            NewItem = Item#item{extra = NewExtra},
            logger:debug("======~w", [NewItem], pet, 2350),
            {ok, NewPbag, _} = package:fresh_item(Item,
                                                  NewItem,
                                                  Bags,
                                                  Role),
            logger:debug("======~w", [NewPbag], pet, 2352),
            Role#role{p_bag = NewPbag};
        _ -> Role
    end.

do_store_fresh(Role = #role{p_store =
                                Stores = #package{items = Items}}) ->
    case lists:keyfind(20185, #item.base_id, Items) of
        Item = #item{extra = ExtraList} ->
            NewAcc = case lists:keyfind(31, 1, ExtraList) of
                         {31, OldAcc, ""} -> OldAcc + 18;
                         _ -> 18
                     end,
            NewExtra = lists:keystore(31,
                                      1,
                                      ExtraList,
                                      {31, NewAcc, ""}),
            NewItem = Item#item{extra = NewExtra},
            {ok, NewStores, _} = package:fresh_item(Item,
                                                    NewItem,
                                                    Stores,
                                                    Role),
            Role#role{p_store = NewStores};
        _ -> Role
    end.

do_family_fresh(Role = #role{p_family_store =
                                 FamilyStore = #package{items = Items}}) ->
    case lists:keyfind(20185, #item.base_id, Items) of
        Item = #item{extra = ExtraList} ->
            NewAcc = case lists:keyfind(31, 1, ExtraList) of
                         {31, OldAcc, ""} -> OldAcc + 18;
                         _ -> 18
                     end,
            NewExtra = lists:keystore(31,
                                      1,
                                      ExtraList,
                                      {31, NewAcc, ""}),
            NewItem = Item#item{extra = NewExtra},
            {ok, NewFamilyStore, _} = package:fresh_item(Item,
                                                         NewItem,
                                                         FamilyStore,
                                                         Role),
            Role#role{p_family_store = NewFamilyStore};
        _ -> Role
    end.

check_lev70_gift_item(#role{p_bag =
                                #package{items = Items1},
                            p_store = #package{items = Items2},
                            p_family_store = #package{items = Items3}}) ->
    Items = Items1 ++ Items2 ++ Items3,
    Ids = [Id || #item{base_id = Id} <- Items],
    logger:debug("~w", [Ids], pet, 2388),
    case [22516, 22515, 22514, 22513, 22512, 22511] -- Ids
        of
        [22516, 22515, 22514, 22513, 22512, 22511] -> false;
        _ -> true
    end.

repaire_fresh(RoleId = {_, _, _}) ->
    case role_misc:is_local_role(RoleId) of
        true ->
            role:apply(async, RoleId, {pet, repaire_fresh, []});
        _ -> {error, lang:get("角色平台出错")}
    end;
repaire_fresh(Role = #role{m_pet = Mpet = #m_pet{}}) ->
    NMpet = Mpet#m_pet{fresh_id = 1, time = 0},
    NRole = Role#role{m_pet = NMpet},
    {ok, NRole}.

