-file("src/mod/gods_duel/gods_duel_common.erl", 1).

-module(gods_duel_common).

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

-file("src/mod/gods_duel/gods_duel_common.erl", 8).

-file("inc/gods_duel.hrl", 1).

-record(gods_duel_team,
        {ver = 1 :: pos_integer(),
         id = {0, "", 0},
         name = "",
         lev = 0,
         match_group = 0,
         leader = {0, "", 0},
         member_num = 0,
         members = [],
         fight_capacity = 0,
         applys = [],
         invite_info = [],
         declaration = "",
         win_times = 0,
         loss_times = 0,
         qualification = 0,
         team_group_256 = 0,
         team_group_64 = 0,
         team_group_8 = 0,
         team_group_4 = 0,
         team_seq = 0,
         team_index = 0}).

-record(gods_duel_team_mate,
        {ver = 1,
         id = {0, "", 0},
         name = "",
         classes = 0,
         sex = 0,
         lev = 0,
         break_times = 0,
         position = 0,
         fight_capacity = 0,
         join_time = 0}).

-record(m_gods_duel,
        {ver = 2, team_id = {0, "", 0}, gods_score = 0}).

-record(gods_duel_season_data,
        {ver = 1, serial_id = 0, history_season_info = []}).

-record(gods_duel_season_info,
        {ver = 1,
         id = 0,
         status = 0,
         teams = [],
         group_order = 0,
         season_time_info = []}).

-record(invite_info,
        {id = {0, "", 0},
         name = "",
         lev = 0,
         break_times = 0,
         classes = 0,
         sex = 0,
         total_fc = 0,
         online = 0}).

-record(gods_duel_join_team,
        {id = {0, "", 0},
         team_pid = undefined,
         team_data = undefined,
         fighters = [],
         is_ready = false}).

-record(gods_duel_match,
        {id = {0, 0},
         teams = [],
         combat_pid = undefined :: pid(),
         calc_args = [],
         combat_ref = undefined,
         is_over = 0,
         map_id = 0,
         map_pid = undefined,
         roles = []}).

-record(gods_duel_match_profile,
        {id = 0,
         ver = 1,
         season_id = 0,
         match_type = 0,
         match_round = 0,
         match_id = 0,
         group_id = 0,
         combat_type = 0,
         atk_name,
         dfd_name,
         combat_pid = undefined :: pid(),
         is_over = 0,
         platform = "",
         zone_id = 0,
         time = 0,
         fc_diff = 0,
         round = 0}).

-record(gods_duel_fighter,
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

-record(gods_duel_vote,
        {ver = 0 :: non_neg_integer(),
         id = {0, "", 0} :: tuple(),
         name = "" :: bitstring(),
         sex = 0 :: 0..1,
         classes = 0 :: 0..4,
         lev = 0 :: non_neg_integer(),
         season = 0 :: non_neg_integer(),
         choices = [] :: list(),
         time = 0 :: non_neg_integer()}).

-record(gods_duel_vote_choice,
        {id = {0, "", 0} :: tuple(),
         match_round = 0 :: non_neg_integer(),
         match_zone = 0,
         is_right = 0 :: 0..2}).

-record(gods_duel_poll,
        {id = {0, "", 0} :: tuple(),
         match_round = 0 :: non_neg_integer(),
         voted_cnt = 0 :: non_neg_integer()}).

-record(gods_duel_profile,
        {id = {0, "", 0} :: tuple(),
         ver = 1 :: non_neg_integer(),
         name = "" :: string(),
         lev = 0 :: non_neg_integer(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         rank_lev = 1 :: non_neg_integer(),
         gods_duel_score = 0 :: non_neg_integer()}).

-record(gods_challenge_info,
        {id, combat_pid, is_over = 0}).

-record(gods_duel_team_rank,
        {ver = 1, serial_id = 0, history_season_info = []}).

-record(gods_duel_team_rank_data,
        {ver = 1,
         id = {0, "", 0},
         name = "",
         leader = {0, "", 0},
         member_num = 0,
         members = [],
         fight_capacity = 0,
         win_times = 0,
         qualification = 0,
         rank = 0}).

-record(gods_duel_team_rank_mate,
        {ver = 1,
         id = {0, "", 0},
         name = "",
         classes = 0,
         sex = 2,
         lev = 0,
         break_times = 0,
         position = 2,
         fight_capacity = 0,
         looks = []}).

-record(gods_challenge_team,
        {season_id = 0,
         team_name = "",
         member_num = 0,
         members = []}).

-record(gods_challenge_team_mate,
        {id = {0, "", 0}, name = ""}).

-file("src/mod/gods_duel/gods_duel_common.erl", 9).

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

-file("src/mod/gods_duel/gods_duel_common.erl", 10).

-compile(export_all).

get_final_match_name(MatchIndex) ->
    case MatchIndex of
        1 -> lang:get("64进32战");
        2 -> lang:get("32进16战");
        3 -> lang:get("16进8战");
        4 -> lang:get("8进4战");
        5 -> lang:get("半决赛");
        6 -> lang:get("季军赛");
        7 -> lang:get("决赛");
        _ -> lang:get("")
    end.

get_final_match_qua(MatchIndex) ->
    case MatchIndex of
        1 -> 3;
        2 -> 4;
        3 -> 5;
        4 -> 6;
        5 -> 7;
        6 -> 8;
        7 -> 11;
        _ -> 13
    end.

get_final_match_combat_qua(MatchIndex) ->
    case MatchIndex of
        1 -> {3, 4};
        2 -> {4, 5};
        3 -> {5, 6};
        4 -> {6, 7};
        5 -> {8, 11};
        6 -> {8, 10};
        7 -> {11, 13};
        _ -> {13, 13}
    end.

get_gods_duel_match_list(MatchRound) ->
    case MatchRound of
        1 ->
            [{1, [1, 37]},
             {2, [17, 53]},
             {3, [9, 45]},
             {4, [25, 61]},
             {5, [5, 41]},
             {6, [21, 57]},
             {7, [13, 49]},
             {8, [29, 33]},
             {9, [3, 39]},
             {10, [19, 35]},
             {11, [11, 47]},
             {12, [27, 63]},
             {13, [7, 43]},
             {14, [23, 59]},
             {15, [15, 51]},
             {16, [31, 55]},
             {17, [2, 38]},
             {18, [18, 54]},
             {19, [10, 46]},
             {20, [26, 62]},
             {21, [6, 42]},
             {22, [22, 58]},
             {23, [14, 50]},
             {24, [30, 34]},
             {25, [4, 40]},
             {26, [20, 56]},
             {27, [12, 48]},
             {28, [28, 64]},
             {29, [8, 44]},
             {30, [24, 60]},
             {31, [16, 52]},
             {32, [32, 36]}];
        _ when MatchRound >= 2 andalso MatchRound =< 5 ->
            RoundBatch = round(math:pow(2, MatchRound - 1)),
            MatchCount = round(32 / RoundBatch),
            cut_match_list(1, MatchCount, RoundBatch, []);
        6 -> [{1, lists:seq(1, 2 * 32)}];
        7 -> [{1, lists:seq(1, 2 * 32)}];
        _ -> [{1, lists:seq(1, 2 * 32)}]
    end.

cut_match_list(Beg, End, _Batch, Result)
    when Beg > End ->
    Result;
cut_match_list(Beg, End, Batch, Result) ->
    case lists:keyfind(Beg, 1, Result) of
        {Beg, BegList} ->
            Min = (Beg - 1) * Batch,
            Max = Beg * Batch,
            NewBegList = lists:foldl(fun ({MatchIndex, L}, Rtn)
                                             when MatchIndex >= Min andalso
                                                      MatchIndex =< Max ->
                                             L ++ Rtn;
                                         (_, Rtn) -> Rtn
                                     end,
                                     BegList,
                                     [{1, [1, 37]},
                                      {2, [17, 53]},
                                      {3, [9, 45]},
                                      {4, [25, 61]},
                                      {5, [5, 41]},
                                      {6, [21, 57]},
                                      {7, [13, 49]},
                                      {8, [29, 33]},
                                      {9, [3, 39]},
                                      {10, [19, 35]},
                                      {11, [11, 47]},
                                      {12, [27, 63]},
                                      {13, [7, 43]},
                                      {14, [23, 59]},
                                      {15, [15, 51]},
                                      {16, [31, 55]},
                                      {17, [2, 38]},
                                      {18, [18, 54]},
                                      {19, [10, 46]},
                                      {20, [26, 62]},
                                      {21, [6, 42]},
                                      {22, [22, 58]},
                                      {23, [14, 50]},
                                      {24, [30, 34]},
                                      {25, [4, 40]},
                                      {26, [20, 56]},
                                      {27, [12, 48]},
                                      {28, [28, 64]},
                                      {29, [8, 44]},
                                      {30, [24, 60]},
                                      {31, [16, 52]},
                                      {32, [32, 36]}]),
            NewResult = lists:keystore(Beg,
                                       1,
                                       Result,
                                       {Beg, NewBegList}),
            cut_match_list(Beg + 1, End, Batch, NewResult);
        _ ->
            Min = (Beg - 1) * Batch,
            Max = Beg * Batch,
            NewBegList = lists:foldl(fun ({MatchIndex, L}, Rtn)
                                             when MatchIndex > Min andalso
                                                      MatchIndex =< Max ->
                                             L ++ Rtn;
                                         (_, Rtn) -> Rtn
                                     end,
                                     [],
                                     [{1, [1, 37]},
                                      {2, [17, 53]},
                                      {3, [9, 45]},
                                      {4, [25, 61]},
                                      {5, [5, 41]},
                                      {6, [21, 57]},
                                      {7, [13, 49]},
                                      {8, [29, 33]},
                                      {9, [3, 39]},
                                      {10, [19, 35]},
                                      {11, [11, 47]},
                                      {12, [27, 63]},
                                      {13, [7, 43]},
                                      {14, [23, 59]},
                                      {15, [15, 51]},
                                      {16, [31, 55]},
                                      {17, [2, 38]},
                                      {18, [18, 54]},
                                      {19, [10, 46]},
                                      {20, [26, 62]},
                                      {21, [6, 42]},
                                      {22, [22, 58]},
                                      {23, [14, 50]},
                                      {24, [30, 34]},
                                      {25, [4, 40]},
                                      {26, [20, 56]},
                                      {27, [12, 48]},
                                      {28, [28, 64]},
                                      {29, [8, 44]},
                                      {30, [24, 60]},
                                      {31, [16, 52]},
                                      {32, [32, 36]}]),
            NewResult = lists:keystore(Beg,
                                       1,
                                       Result,
                                       {Beg, NewBegList}),
            cut_match_list(Beg + 1, End, Batch, NewResult)
    end.

get_match_profile_list(SeasonId, GroupId, WatchType) ->
    Fun = fun (Profile = #gods_duel_match_profile{season_id
                                                      = MSId,
                                                  group_id = MGId,
                                                  combat_type = CombatType,
                                                  is_over = IsOver},
               Rtn)
                  when MSId =:= SeasonId andalso GroupId =:= MGId orelse
                           MSId =:= SeasonId andalso CombatType =:= 71 ->
                  case WatchType of
                      1 when IsOver =:= 1 -> [Profile | Rtn];
                      2 when IsOver =:= 0 -> [Profile | Rtn];
                      _ -> Rtn
                  end;
              (_, Rtn) -> Rtn
          end,
    ets:foldl(Fun, [], gods_duel_match_profile).

get_season_status() ->
    case env:get(gods_season_status) of
        undefined -> 0;
        Status -> Status
    end.

get_match_index() ->
    Status = get_season_status(),
    get_match_index(Status).

get_match_index(Status) ->
    case Status of
        3 -> {1, 1};
        4 -> {1, 1};
        5 -> {1, 1};
        6 -> {1, 2};
        7 -> {1, 2};
        8 -> {1, 3};
        9 -> {1, 3};
        10 -> {1, 4};
        11 -> {1, 4};
        12 -> {1, 5};
        13 -> {1, 5};
        14 -> {1, 6};
        15 -> {1, 6};
        16 -> {1, 7};
        17 -> {1, 7};
        18 -> {2, 1};
        19 -> {2, 1};
        20 -> {2, 2};
        21 -> {2, 2};
        22 -> {2, 3};
        23 -> {2, 3};
        24 -> {2, 4};
        25 -> {2, 4};
        26 -> {2, 5};
        27 -> {2, 5};
        28 -> {2, 6};
        29 -> {2, 6};
        30 -> {2, 7};
        31 -> {2, 7};
        _ -> false
    end.

get_next_match_status(MatchType, MatchIndex,
                      WinOrLoss) ->
    case MatchType of
        1 ->
            case MatchIndex of
                1 -> 7;
                2 -> 9;
                3 -> 11;
                4 -> 13;
                5 -> 15;
                6 -> 17;
                _ -> 0
            end;
        2 ->
            case MatchIndex of
                1 -> 21;
                2 -> 23;
                3 -> 25;
                4 -> 27;
                5 when WinOrLoss =:= win -> 31;
                5 -> 29;
                _ -> 0
            end;
        _ -> 0
    end.

get_season_name() ->
    case get_season_id() of
        0 -> lang:get("诸神之战");
        SeasonId -> util:flist(lang:get("诸神之战S~w"), [SeasonId])
    end.

get_season_id() ->
    case catch ets:lookup_element(gods_duel_season_data,
                                  gods_duel_season_data,
                                  #gods_duel_season_data.serial_id)
        of
        SeasonId when is_integer(SeasonId) -> SeasonId;
        _ -> 0
    end.

get_state_order(StateName) ->
    case StateName of
        idle -> 0;
        prepare -> 1;
        sign -> 2;
        notice -> 3;
        match_256_idle_1 -> 4;
        match_256_1 -> 5;
        match_256_idle_2 -> 6;
        match_256_2 -> 7;
        match_256_idle_3 -> 8;
        match_256_3 -> 9;
        match_256_idle_4 -> 10;
        match_256_4 -> 11;
        match_256_idle_5 -> 12;
        match_256_5 -> 13;
        match_256_idle_6 -> 14;
        match_256_6 -> 15;
        match_256_idle_7 -> 16;
        match_256_7 -> 17;
        match_idle_32 -> 18;
        match_32 -> 19;
        match_idle_16 -> 20;
        match_16 -> 21;
        match_idle_8 -> 22;
        match_8 -> 23;
        match_idle_4 -> 24;
        match_4 -> 25;
        match_idle_half -> 26;
        match_half -> 27;
        match_idle_third -> 28;
        match_third -> 29;
        match_idle_champion -> 30;
        match_champion -> 31;
        ending -> 32;
        challenge_idle -> 33;
        challenge -> 34;
        _ -> 0
    end.

get_line_num(Rank) -> (Rank - 1) rem 32 + 1.

is_vote_match(MatchRound) ->
    MatchRound =:= 4 orelse
        MatchRound =:= 5 orelse
            MatchRound =:= 6 orelse MatchRound =:= 7.

get_match_team_count(MatchRound) ->
    case MatchRound of
        1 -> 32;
        2 -> 16;
        3 -> 8;
        4 -> 4;
        5 -> 2;
        6 -> 1;
        7 -> 1;
        _ -> 0
    end.

get_group_lev_max(Group, BreakTimes) ->
    case gods_duel_data:get_lev_by_group({Group,
                                          BreakTimes})
        of
        {_, LevMax1} -> LevMax1;
        _ -> 130
    end.

get_time_config(Begin, End, TimeCfg) ->
    SeasonId = get_season_id(),
    get_time_config(SeasonId, Begin, End, TimeCfg).

get_time_config(_SeasonId, Begin, End, TimeCfg)
    when Begin > End ->
    TimeCfg;
get_time_config(SeasonId, Begin, End, TimeCfg) ->
    case get_state_get_time_config(SeasonId, Begin) of
        {StartTime, EndTime} ->
            get_time_config(SeasonId,
                            Begin + 1,
                            End,
                            [{Begin, StartTime, EndTime} | TimeCfg]);
        _ -> get_time_config(SeasonId, Begin + 1, End, TimeCfg)
    end.

get_state_get_time_config(SeasonID, StateCode) ->
    case gods_duel_data:get_season_info(SeasonID) of
        {SecondID, _, _} ->
            case gods_duel_data:get_season_date({SeasonID,
                                                 StateCode})
                of
                {[{SYear, SMonth, SDay}], [{EYear, EMonth, EDay}]} ->
                    case gods_duel_data:get_season_second({SecondID,
                                                           StateCode})
                        of
                        {[{SHour, SMinute, SSecond}],
                         [{EHour, EMinute, ESecond}]} ->
                            StartTime = {SYear,
                                         SMonth,
                                         SDay,
                                         SHour,
                                         SMinute,
                                         SSecond},
                            EndTime = {EYear,
                                       EMonth,
                                       EDay,
                                       EHour,
                                       EMinute,
                                       ESecond},
                            {date:datetime_to_seconds(StartTime),
                             date:datetime_to_seconds(EndTime)};
                        _ -> false
                    end;
                _ERR -> false
            end;
        _ -> false
    end.

get_client_time_config(Begin, End, TimeCfg) ->
    SeasonId = get_season_id(),
    get_client_time_config(SeasonId, Begin, End, TimeCfg).

get_client_time_config(_SeasonId, Begin, End, TimeCfg)
    when Begin > End ->
    TimeCfg;
get_client_time_config(SeasonId, Begin, End, TimeCfg) ->
    case get_state_get_time_config(SeasonId, Begin, client)
        of
        {StartTime, EndTime} ->
            get_client_time_config(SeasonId,
                                   Begin + 1,
                                   End,
                                   [{Begin, StartTime, EndTime} | TimeCfg]);
        _ ->
            get_client_time_config(SeasonId,
                                   Begin + 1,
                                   End,
                                   TimeCfg)
    end.

get_state_get_time_config(SeasonID, StateCode,
                          client) ->
    case gods_duel_data:get_season_info(SeasonID) of
        {SecondID, _, _} ->
            case gods_duel_data:get_season_date({SeasonID,
                                                 StateCode})
                of
                {[{SYear, SMonth, SDay}], [{EYear, EMonth, EDay}]} ->
                    case gods_duel_data:get_client_season_date({SecondID,
                                                                StateCode})
                        of
                        {[{SHour, SMinute, SSecond}],
                         [{EHour, EMinute, ESecond}]} ->
                            StartTime = {SYear,
                                         SMonth,
                                         SDay,
                                         SHour,
                                         SMinute,
                                         SSecond},
                            EndTime = {EYear,
                                       EMonth,
                                       EDay,
                                       EHour,
                                       EMinute,
                                       ESecond},
                            {date:datetime_to_seconds(StartTime),
                             date:datetime_to_seconds(EndTime)};
                        _ -> false
                    end;
                _ERR -> false
            end;
        _ -> false
    end.

get_new_season_id() ->
    get_new_season_id(get_season_id()).

get_new_season_id(OldSeasonID) ->
    Seasons = gods_duel_data:season_list(),
    get_new_season_id(Seasons, OldSeasonID).

get_new_season_id([], SeasonID) ->
    SeasonsList = gods_duel_data:season_list(),
    case SeasonsList of
        [] -> SeasonID;
        _ ->
            NewSeasonID = get_pre_now_season_id(SeasonsList,
                                                SeasonID + 1),
            min(lists:max(SeasonsList) + 1, NewSeasonID)
    end;
get_new_season_id([S1 | T], SeasonID) ->
    Now = date:unixtime(),
    case gods_duel_data:get_season_info(S1) of
        {_, StartTime, EndTime}
            when EndTime >= Now andalso StartTime =< Now ->
            S1;
        _ -> get_new_season_id(T, SeasonID)
    end.

get_pre_now_season_id([], SeasonID) -> SeasonID;
get_pre_now_season_id([S1 | T], SeasonID) ->
    Now = date:unixtime2(),
    case gods_duel_data:get_season_info(S1) of
        {_, StartTime, _} when StartTime >= Now ->
            get_pre_now_season_id(T, min(SeasonID, S1));
        _ -> get_pre_now_season_id(T, SeasonID)
    end.

