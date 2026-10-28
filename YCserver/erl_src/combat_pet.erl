-file("src/mod/combat/combat_pet.erl", 1).

-module(combat_pet).

-export([convert/2,
         convert/3,
         to_fighter/1,
         protect_master/3,
         protect_master/4,
         revive_master/1,
         pre_action/1,
         add_pet/3,
         switch_pet/3,
         flash_pet/1,
         flash_pet/2,
         round_calc/1,
         init_war/1,
         enter_war/1,
         pet_talk/2,
         auto_escape/1,
         calc_revive_ratio/2,
         calc_stun_ratio/2,
         calc_mag_ratio/2,
         calc_stone_ratio/2,
         calc_agi_ratio/2,
         init_pet_effect/2,
         dispel_pet/3,
         dispel_pet/4,
         formation_effect/3,
         action_end_pet_status/1]).

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

-file("src/mod/combat/combat_pet.erl", 39).

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

-file("src/mod/combat/combat_pet.erl", 40).

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

-file("src/mod/combat/combat_pet.erl", 41).

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

-file("src/mod/combat/combat_pet.erl", 42).

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

-file("src/mod/combat/combat_pet.erl", 43).

convert(Mpet, ConvertType) ->
    convert(Mpet, ConvertType, []).

convert(#m_pet{pets = Pets}, ConvertType,
        TalismanSkill) ->
    BackUpPets = [to_c_pet(Pet, ConvertType)
                  || Pet = #pet{genre = Genre, spirit_attached_id = 0,
                                spirit_child_flag = 0}
                         <- Pets,
                     Genre =/= 3],
    BackUpPets1 = [C#c_pet{skills = Skills ++ TalismanSkill}
                   || C = #c_pet{skills = Skills} <- BackUpPets],
    case lists:keyfind(1, #c_pet.status, BackUpPets1) of
        false -> {undefined, BackUpPets1};
        CPet = #c_pet{id = PetId, skills = ActiveSkills} ->
            {CPet#c_pet{can_summon = 0,
                        skills = ActiveSkills ++ TalismanSkill},
             lists:keydelete(PetId, #c_pet.id, BackUpPets1)}
    end.

dispel_pet(ClearBuff, Self, Target) ->
    dispel_pet(ClearBuff, #c_skill{}, Self, Target).

dispel_pet(ClearBuff, Skill, Self,
           Target = #fighter{type = SummonType})
    when SummonType =:= 3 orelse SummonType =:= 6 ->
    case lists:keyfind(control, #c_buff.sec_type, ClearBuff)
        of
        #c_buff{} ->
            combat_script_skill_calc:passive_activate(dispel,
                                                      Target,
                                                      Self,
                                                      combat_script_skill_calc:check_skill_act(Skill));
        _Err -> ok
    end;
dispel_pet(_, _, _, _) -> ok.

init_pet_effect({ActiveSkills, PassiveSkills}, []) ->
    {ActiveSkills, PassiveSkills};
init_pet_effect({ActiveSkills, PassiveSkills},
                [{1,
                  ClashSkill,
                  HasSkill,
                  UpdateArgs,
                  AddSkillId,
                  AddSkillArgs}
                 | T]) ->
    case has_skill(PassiveSkills, ClashSkill) of
        false ->
            Flag = case has_skill(PassiveSkills, HasSkill) of
                       {true,
                        Cskill = #c_skill{skill =
                                              S = #skill{script_args =
                                                             Args}}} ->
                           NewArgs = merge_list_val(Args, UpdateArgs),
                           NewS = S#skill{script_args = NewArgs},
                           {true, Cskill#c_skill{skill = NewS}};
                       _ ->
                           case combat_script_skill:to_combat_skill({AddSkillId,
                                                                     1})
                               of
                               AddCskill = #c_skill{skill = S} ->
                                   NewS = S#skill{script_args = AddSkillArgs},
                                   {true, AddCskill#c_skill{skill = NewS}};
                               _Err ->
                                   logger:error("宠物天赋增加技能时:~w,~w",
                                                [AddSkillId, _Err],
                                                combat_pet,
                                                99),
                                   false
                           end
                   end,
            case Flag of
                {true, NewCskill = #c_skill{id = SkillId}} ->
                    NewPassiveSkills = lists:keystore(SkillId,
                                                      #c_skill.id,
                                                      PassiveSkills,
                                                      NewCskill),
                    init_pet_effect({ActiveSkills, NewPassiveSkills}, T);
                _ -> init_pet_effect({ActiveSkills, PassiveSkills}, T)
            end;
        _ -> init_pet_effect({ActiveSkills, PassiveSkills}, T)
    end;
init_pet_effect({ActiveSkills, PassiveSkills},
                [_ | T]) ->
    init_pet_effect({ActiveSkills, PassiveSkills}, T).

has_skill([], _List) -> false;
has_skill([Skill = #c_skill{id = SkillId} | T], List) ->
    case lists:member(SkillId, List) of
        true -> {true, Skill};
        false -> has_skill(T, List)
    end.

merge_list_val(L1, L2) when length(L1) =:= length(L2) ->
    L = lists:seq(1, length(L1)),
    Fun = fun (Idx, La, Lb) ->
                  A = lists:nth(Idx, La),
                  B = lists:nth(Idx, Lb),
                  if is_integer(A) andalso is_integer(B) -> A + B;
                     is_list(A) andalso is_list(B) -> B;
                     is_tuple(A) andalso is_tuple(B) -> B;
                     true -> A
                  end
          end,
    [Fun(Idx, L1, L2) || Idx <- L];
merge_list_val(L1, L2) ->
    logger:error("2个列表数量不一样，无法合并数值:~w, ~w",
                 [L1, L2],
                 combat_pet,
                 140),
    L1.

to_c_pet(Pet = #pet{id = Id, base_id = BaseId,
                    is_first = IsFirst, hp = Hp, mp = Mp, grade = Grade,
                    attr = Attr, lev = Lev, name = Name, looks = Looks,
                    status = Status, combat_talk = CombatTalk,
                    talent = Talent,
                    pet_attr =
                        #pet_attr{p_str = Pstr, p_con = Pcon, p_mag = Pmag,
                                  p_agi = Pagi, p_end = Pend}},
         robot_role) ->
    {BaseSkills,
     StoneSkills,
     MountSkills,
     SpiritSkills,
     UnRealSkill,
     RuneSkill} =
        pet_skill:all_skill(Pet),
    Skills = BaseSkills ++
                 StoneSkills ++
                     MountSkills ++
                         SpiritSkills ++ get_special_skill(BaseId) ++ RuneSkill,
    SkinLooks = pet:get_look(Pet),
    AllLooks = Looks ++ SkinLooks,
    CPetAttr = {Pstr, Pcon, Pmag, Pagi, Pend},
    #c_pet{id = Id, base_id = BaseId, status = Status,
           name = Name, lev = Lev, looks = AllLooks, hp = Hp,
           mp = Mp, attr = Attr, skills = Skills ++ UnRealSkill,
           combat_talk = CombatTalk, talent = Talent,
           pet_attr = CPetAttr, grade = Grade, is_first = IsFirst};
to_c_pet(Pet = #pet{id = Id, base_id = BaseId,
                    is_first = IsFirst, hp = Hp, mp = Mp, grade = Grade,
                    attr = Attr, lev = Lev, name = Name, looks = Looks,
                    status = Status, combat_talk = CombatTalk,
                    talent = Talent,
                    pet_attr =
                        #pet_attr{p_str = Pstr, p_con = Pcon, p_mag = Pmag,
                                  p_agi = Pagi, p_end = Pend},
                    ai_skillid = AiSkillId},
         _ConverType) ->
    {BaseSkills,
     StoneSkills,
     MountSkills,
     SpiritSkills,
     UnRealSkill,
     RuneSkill} =
        pet_skill:all_skill(Pet),
    Skills = BaseSkills ++
                 StoneSkills ++
                     MountSkills ++
                         SpiritSkills ++ get_special_skill(BaseId) ++ RuneSkill,
    SkinLooks = pet:get_look(Pet),
    AllLooks = Looks ++ SkinLooks,
    CPetAttr = {Pstr, Pcon, Pmag, Pagi, Pend},
    SkillPlan = case AiSkillId =/= 0 of
                    true -> [{1, AiSkillId}];
                    false -> []
                end,
    logger:debug("~w", [Skills], combat_pet, 166),
    #c_pet{id = Id, base_id = BaseId, status = Status,
           name = Name, lev = Lev, looks = AllLooks, hp = Hp,
           mp = Mp, attr = Attr, skills = Skills ++ UnRealSkill,
           combat_talk = CombatTalk, talent = Talent,
           pet_attr = CPetAttr, grade = Grade,
           skill_plan = SkillPlan, is_first = IsFirst}.

get_special_skill(PetBaseId) ->
    case pet_data:get_special_skills(PetBaseId) of
        Skills = [_ | _] -> Skills;
        _ -> []
    end.

to_fighter(#c_pet{id = Id, base_id = BaseId, hp = Hp,
                  mp = Mp, attr = Attr, lev = Lev, name = Name,
                  looks = Looks, skills = Skills,
                  combat_talk = CombatTalk, pet_attr = PetAttr,
                  grade = Grade, skill_plan = SkillPlan}) ->
    NewAttr1 = case attr_ver:do(Attr) of
                   {ok, NewAttr} -> NewAttr;
                   _ -> #attr{}
               end,
    #attr{hp_max = HpMax, mp_max = MpMax} = NewAttr1,
    Minit = #m_combat_init{skills = Skills},
    CombatStat = #combat_statistics{},
    AiId = 80000,
    ResId = case pet_data:get_base(BaseId) of
                #pet_base{model_id = Model0} when Grade =:= 0 -> Model0;
                #pet_base{model_id1 = Model1} when Grade =:= 1 ->
                    Model1;
                #pet_base{model_id2 = Model2} when Grade =:= 2 ->
                    Model2;
                #pet_base{model_id3 = Model3} when Grade =:= 3 ->
                    Model3;
                #pet_base{model_id = Model0} -> Model0;
                _ -> 0
            end,
    #fighter{rid = Id, origin_id = Id, res_id = ResId,
             face_id = BaseId, base_id = BaseId, type = 3,
             name = Name, lev = Lev, attr = NewAttr1, hp = Hp,
             hp_max = HpMax, mp = Mp, mp_max = MpMax, m_init = Minit,
             looks = Looks, combat_statistics = CombatStat,
             ai_id = AiId, combat_talk = CombatTalk,
             pet_attr = PetAttr, skill_plan = SkillPlan};
to_fighter(_) -> undefined.

calc_revive_ratio({Pstr, Pcon, Pmag, Pagi, Pend},
                  [Rate1, Rate2, Rate3, Rate4]) ->
    AllPoint = Pstr + Pcon + Pmag + Pagi + Pend,
    PconRatio = Pcon / AllPoint * 100,
    if PconRatio >= 46 -> Rate1;
       PconRatio >= 36 -> Rate2;
       PconRatio >= 22 -> Rate3;
       true -> Rate4
    end.

calc_stun_ratio({Pstr, Pcon, Pmag, Pagi, Pend},
                [Rate1, Rate2, Rate3, Rate4]) ->
    AllPoint = Pstr + Pcon + Pmag + Pagi + Pend,
    PstrRatio = Pstr / AllPoint * 100,
    if PstrRatio >= 50 -> Rate1;
       PstrRatio >= 40 -> Rate2;
       PstrRatio >= 30 -> Rate3;
       true -> Rate4
    end.

calc_mag_ratio({Pstr, Pcon, Pmag, Pagi, Pend},
               [Rate1, Rate2, Rate3, Rate4]) ->
    AllPoint = Pstr + Pcon + Pmag + Pagi + Pend,
    PmagRatio = Pmag / AllPoint * 100,
    if PmagRatio >= 45 -> Rate1;
       PmagRatio >= 35 -> Rate2;
       PmagRatio >= 20 -> Rate3;
       true -> Rate4
    end.

calc_stone_ratio({Pstr, Pcon, Pmag, Pagi, Pend},
                 [Rate1, Rate2, Rate3, Rate4]) ->
    AllPoint = Pstr + Pcon + Pmag + Pagi + Pend,
    PmagRatio = Pmag / AllPoint * 100,
    if PmagRatio >= 44 -> Rate1;
       PmagRatio >= 35 -> Rate2;
       PmagRatio >= 20 -> Rate3;
       true -> Rate4
    end.

calc_agi_ratio({Pstr, Pcon, Pmag, Pagi, Pend},
               [Rate1, Rate2, Rate3, Rate4]) ->
    AllPoint = Pstr + Pcon + Pmag + Pagi + Pend,
    PagiRatio = Pagi / AllPoint * 100,
    if PagiRatio >= 44 -> Rate1;
       PagiRatio >= 35 -> Rate2;
       PagiRatio >= 20 -> Rate3;
       true -> Rate4
    end.

round_calc([]) -> ok;
round_calc([Fid | T]) ->
    case combat_cache:f(by_id, Fid) of
        Master = #fighter{type = 1, is_die = 0,
                          is_escape = 0} ->
            combat_pet:pre_action(Master),
            combat_child:pre_action(Master),
            combat_mount:pre_action(Master);
        Master = #fighter{type = 4, is_die = 0,
                          is_escape = 0} ->
            combat_pet:pre_action(Master),
            combat_child:pre_action(Master),
            combat_mount:pre_action(Master);
        #fighter{} -> skip;
        _ ->
            logger:error("无法找到参战者:~w", [Fid], combat_pet, 285),
            skip
    end,
    round_calc(T).

pet_talk(#fighter{type = 1, pid = MasterPid}, 5) ->
    case combat_cache:f(by_master_pid, MasterPid) of
        Pet = #fighter{type = 3, is_escape = 0, is_die = 0} ->
            pet_talk(Pet, 5);
        _ -> ok
    end;
pet_talk(Self = #fighter{id = Sid, type = 3,
                         combat_talk = CombatTalk, base_id = BaseId},
         Type) ->
    case lists:keyfind(Type, 1, CombatTalk) of
        {_, TalkMsg} when TalkMsg =/= "" ->
            case pet_effect:rand_talk(BaseId, Type) of
                true ->
                    NewCombatTalk = lists:keydelete(Type, 1, CombatTalk),
                    combat_cache:u(Sid, [{combat_talk, 0, NewCombatTalk}]),
                    combat_play:add_sub_play(combat_play:gen_sub_skill_play(pet_talk,
                                                                            {Self,
                                                                             TalkMsg})),
                    ok;
                _ -> ok
            end;
        _ -> ok
    end;
pet_talk(_, _) -> ok.

switch_pet(Self = #fighter{id = Fid, group = Group},
           Cpet = #c_pet{}, NeedReduce) ->
    Pet = combat_cache:f(by_master_id, Fid),
    case Pet of
        #fighter{} -> combat_fighter:remove_fighter(Pet);
        _ -> skip
    end,
    Idx = case Group of
              0 -> #combat_context.origin_atk;
              _ -> #combat_context.origin_dfd
          end,
    [CombatType, OriginList] =
        combat_cache:get_context_elem([#combat_context.type,
                                       Idx]),
    PetList = combat_fighter:fighter_init_pet(Group,
                                              role,
                                              CombatType,
                                              {[], []},
                                              Self#fighter{active_pet = Cpet}),
    ReducePetList = case NeedReduce of
                        1 ->
                            [Pf1#fighter{hp = round(PetLev * 150)}
                             || Pf1 = #fighter{lev = PetLev} <- PetList];
                        _ -> PetList
                    end,
    NowGroupList = combat_cache:all(Group) ++ ReducePetList,
    put(Group, NowGroupList),
    combat_cache:save_context([{Idx,
                                ReducePetList ++ OriginList}]),
    combat_buff:buff_init(ReducePetList),
    PetList1 = formation_effect(ReducePetList, Group, []),
    PetList2 = combat:append_infos(PetList1),
    [combat_cache:u(Pet2) || Pet2 = #fighter{} <- PetList2],
    lists:foreach(fun (Pf = #fighter{}) ->
                          combat_fighter:update_sort_action(Pf)
                  end,
                  PetList2),
    lists:foreach(fun (Pf) -> pet_talk(Pf, 1) end,
                  PetList2),
    PetList3 = [combat_cache:f(by_id, PetId)
                || #fighter{id = PetId} <- PetList2],
    PetList3.

formation_effect([], _Group, FList) ->
    lists:reverse(FList);
formation_effect([#fighter{id = Sid} | T], Group,
                 FList) ->
    case combat_cache:f(by_id, Sid) of
        F = #fighter{} ->
            case get({formation_effect, Group}) of
                {PetAttr, IsRestrain} ->
                    GetAttr = case IsRestrain of
                                  strong -> [{24, 100}];
                                  weak -> [{23, 50}];
                                  _ -> []
                              end,
                    GetAttr1 = PetAttr ++ GetAttr,
                    NewF = combat_fighter:calc_formation(F, GetAttr1, []),
                    formation_effect(T, Group, [NewF | FList]);
                _ -> formation_effect(T, Group, [F | FList])
            end;
        _ -> formation_effect(T, Group, FList)
    end.

flash_pet(MasterPid) -> flash_pet(MasterPid, false).

flash_pet(MasterPid, IsRushRadiance) ->
    case combat_cache:f(by_pid, MasterPid) of
        Master = #fighter{type = Type, is_escape = 0,
                          has_summon_pet = HasSummonPet}
            when Type =:= 1 orelse Type =:= 4 ->
            case HasSummonPet >= 4 of
                true -> ok;
                false -> do_flash_pet(Master, IsRushRadiance)
            end;
        _ -> ok
    end.

do_flash_pet(Self = #fighter{active_skills =
                                 ActiveSkills,
                             lev = Lev, id = Fid, active_pet = ActivePet,
                             backup_pets = BackUpPets,
                             active_child = ActiveChild,
                             backup_childs = BackUpChilds,
                             special_attr =
                                 #special_attr{flush_pet_times =
                                                   FlushPetTimes}},
             IsRushRadiance) ->
    case check_flash(Lev,
                     Fid,
                     FlushPetTimes,
                     {ActivePet, ActiveChild},
                     BackUpPets,
                     BackUpChilds,
                     IsRushRadiance)
        of
        {true, _, CChild = #c_child{id = ChildId}, SkillId} ->
            case combat_cache:f(by_script_id, ActiveSkills, 10009)
                of
                FlashChildSkill = #c_skill{} ->
                    logger:debug("闪现后将召唤技能冷却", [], combat_pet, 399),
                    combat_skill:add_skill_cooldown(Fid, FlashChildSkill);
                _ -> skip
            end,
            BackUpChilds1 = lists:keydelete(ChildId,
                                            #c_child.id,
                                            BackUpChilds),
            NewBackUpChilds = case ActiveChild of
                                  #c_child{} ->
                                      [ActiveChild#c_child{can_summon = 0}
                                       | BackUpChilds1];
                                  _ -> BackUpChilds1
                              end,
            NewBackUpPets = case ActivePet of
                                #c_pet{} ->
                                    [ActivePet#c_pet{can_summon = 0}
                                     | BackUpPets];
                                _ -> BackUpPets
                            end,
            combat_cache:u(Fid,
                           [{active_pet, 0, undefined},
                            {active_child, 0, CChild},
                            {backup_pets, 0, NewBackUpPets},
                            {backup_childs, 0, NewBackUpChilds},
                            {has_summon_pet, 1, 1},
                            {flush_pet_times, 1, 1}]),
            case combat_child:switch_child(Self, CChild, 0) of
                [Summon = #fighter{id = ChildFid}] ->
                    Skill = combat_script_skill:to_combat_skill({2000, 1}),
                    ShowPassiveSkill = [{ChildFid, SkillId, 1}],
                    SkillPlay = combat_play:gen_sub_skill_play(attack,
                                                               {Summon,
                                                                Summon,
                                                                Skill,
                                                                [],
                                                                [],
                                                                1,
                                                                0,
                                                                0,
                                                                0,
                                                                ShowPassiveSkill}),
                    combat_play:add_sub_play(SkillPlay),
                    NowSubOrder = combat_play:get_sub_order(),
                    {Summons, SubFlag} = combat_child:enter_war([Summon]),
                    combat_play:put_sub_order(NowSubOrder),
                    ChildWarPlay = combat_play:gen_sub_summon_play(0,
                                                                   Self,
                                                                   Summons),
                    combat_play:add_sub_play(ChildWarPlay),
                    case SubFlag of
                        1 -> combat_play:commit_sub_play();
                        _ -> skip
                    end,
                    combat_play:commit_play();
                _ -> skip
            end;
        {true, _, CPet = #c_pet{id = PetId}, SkillId} ->
            BackUpPets1 = lists:keydelete(PetId,
                                          #c_pet.id,
                                          BackUpPets),
            NewBackUpPets = case ActivePet of
                                #c_pet{} ->
                                    [ActivePet#c_pet{can_summon = 0}
                                     | BackUpPets1];
                                _ -> BackUpPets1
                            end,
            NewBackUpChilds = case ActiveChild of
                                  #c_child{} ->
                                      [ActiveChild#c_child{can_summon = 0}
                                       | BackUpChilds];
                                  _ -> BackUpChilds
                              end,
            combat_cache:u(Fid,
                           [{active_pet, 0, CPet},
                            {active_child, 0, undefined},
                            {backup_childs, 0, NewBackUpChilds},
                            {backup_pets, 0, NewBackUpPets},
                            {has_summon_pet, 1, 1},
                            {flush_pet_times, 1, 1}]),
            case switch_pet(Self, CPet, 0) of
                [Summon = #fighter{id = PetFid}] ->
                    Skill = combat_script_skill:to_combat_skill({2000, 1}),
                    ShowPassiveSkill = [{PetFid, SkillId, 1}],
                    SkillPlay = combat_play:gen_sub_skill_play(attack,
                                                               {Summon,
                                                                Summon,
                                                                Skill,
                                                                [],
                                                                [],
                                                                1,
                                                                0,
                                                                0,
                                                                0,
                                                                ShowPassiveSkill}),
                    combat_play:add_sub_play(SkillPlay),
                    NowSubOrder = combat_play:get_sub_order(),
                    {Summons, SubFlag} = combat_pet:enter_war([Summon]),
                    combat_play:put_sub_order(NowSubOrder),
                    PetWarPlay = combat_play:gen_sub_summon_play(0,
                                                                 Self,
                                                                 Summons),
                    combat_play:add_sub_play(PetWarPlay),
                    case SubFlag of
                        1 -> combat_play:commit_sub_play();
                        _ -> skip
                    end,
                    combat_play:commit_play();
                _ -> skip
            end;
        _Err -> skip
    end.

check_flash(MasterLev, Fid, FlushPetTimes,
            {ActivePet, ActiveChild}, BackUpPets, BackUpChilds,
            IsRushRadiance)
    when is_record(ActivePet, c_pet) orelse
             is_record(ActiveChild, c_child) ->
    case combat_cache:f(by_master_id, Fid) of
        #fighter{id = FlashFid, is_die = 1,
                 passive_skills = PassiveSkills}
            when IsRushRadiance =:= false ->
            case put({flash_flag, Fid}, 1) of
                undefined ->
                    AddRatio = case find_skill(15, PassiveSkills) of
                                   [#c_skill{skill =
                                                 #skill{script_args =
                                                            [EnhanceRatio]}}] ->
                                       EnhanceRatio;
                                   _ -> 0
                               end,
                    NewBackUpChilds =
                        lists:reverse(lists:keysort(#c_child.lev,
                                                    BackUpChilds)),
                    NewBackUpPets = lists:reverse(lists:keysort(#c_pet.lev,
                                                                BackUpPets)),
                    NewFlashList = case
                                       combat_skill:is_skill_in_cooldown(Fid,
                                                                         1009)
                                       of
                                       true -> NewBackUpPets;
                                       _ -> NewBackUpChilds ++ NewBackUpPets
                                   end,
                    NewFlashList1 = do_sort_flash(NewFlashList,
                                                  MasterLev,
                                                  [],
                                                  []),
                    case do_check_flash(NewFlashList1,
                                        #{add_ratio => AddRatio,
                                          flush_pet_times => FlushPetTimes})
                        of
                        {true, Flash, SkillId} ->
                            {true, FlashFid, Flash, SkillId};
                        false -> false
                    end;
                _ -> false
            end;
        #fighter{id = FlashFid, is_radiance = IsRadiance,
                 is_die = IsDie, passive_skills = PassiveSkills}
            when IsRushRadiance =:= true andalso
                     (IsRadiance =:= 1 orelse IsDie =:= 1) ->
            case put({flash_flag, Fid}, 1) of
                undefined ->
                    AddRatio = case find_skill(15, PassiveSkills) of
                                   [#c_skill{skill =
                                                 #skill{script_args =
                                                            [EnhanceRatio]}}] ->
                                       EnhanceRatio;
                                   _ -> 0
                               end,
                    NewBackUpChilds =
                        lists:reverse(lists:keysort(#c_child.lev,
                                                    BackUpChilds)),
                    NewBackUpPets = lists:reverse(lists:keysort(#c_pet.lev,
                                                                BackUpPets)),
                    NewFlashList = case
                                       combat_skill:is_skill_in_cooldown(Fid,
                                                                         1009)
                                       of
                                       true -> NewBackUpPets;
                                       _ -> NewBackUpChilds ++ NewBackUpPets
                                   end,
                    NewFlashList1 = do_sort_flash(NewFlashList,
                                                  MasterLev,
                                                  [],
                                                  []),
                    case do_check_flash(NewFlashList1,
                                        #{add_ratio => AddRatio,
                                          flush_pet_times => FlushPetTimes})
                        of
                        {true, Flash, SkillId} ->
                            {true, FlashFid, Flash, SkillId};
                        false -> false
                    end;
                _ -> false
            end;
        #fighter{is_die = 0, is_radiance = 0} ->
            erase({flash_flag, Fid}),
            false;
        _ -> false
    end;
check_flash(_, _, _, _, _, _, _) -> false.

action_end_pet_status(Fid) ->
    case combat_cache:f(by_id, Fid) of
        #fighter{type = Type, is_escape = 0,
                 has_summon_pet = HasSummonPet, active_pet = ActivePet,
                 active_child = ActiveChild}
            when (Type =:= 1 orelse Type =:= 4) andalso
                     (is_record(ActivePet, c_pet) orelse
                          is_record(ActiveChild, c_child)) ->
            case HasSummonPet >= 4 of
                true -> ok;
                false ->
                    case combat_cache:f(by_master_id, Fid) of
                        #fighter{is_die = 1} ->
                            put({flash_flag, Fid}, 1),
                            ok;
                        #fighter{is_die = 0} ->
                            erase({flash_flag, Fid}),
                            ok;
                        _ -> ok
                    end
            end;
        _ -> ok
    end.

do_sort_flash([], _MasterLev, High, Low) ->
    util:shuffle(High) ++ Low;
do_sort_flash([Child = #c_child{lev = Lev} | T],
              MasterLev, High, Low) ->
    case Lev >= MasterLev of
        true ->
            do_sort_flash(T, MasterLev, [Child | High], Low);
        _ -> do_sort_flash(T, MasterLev, High, [Child | Low])
    end;
do_sort_flash([Pet = #c_pet{lev = Lev} | T], MasterLev,
              High, Low) ->
    case Lev >= MasterLev of
        true -> do_sort_flash(T, MasterLev, [Pet | High], Low);
        _ -> do_sort_flash(T, MasterLev, High, [Pet | Low])
    end;
do_sort_flash([H | T], MasterLev, High, Low) ->
    do_sort_flash(T, MasterLev, High, [H | Low]).

do_check_flash([], _) -> false;
do_check_flash([#c_pet{can_summon = 0} | T], Args) ->
    do_check_flash(T, Args);
do_check_flash([#c_child{can_summon = 0} | T], Args) ->
    do_check_flash(T, Args);
do_check_flash([CPet = #c_pet{skills = Skills,
                              pet_attr = PetAttr}
                | T],
               Args = #{add_ratio := AddRatio,
                        flush_pet_times := FlushPetTimes}) ->
    DescRatio = calc_ratio_desc(FlushPetTimes),
    {_, PassiveSkills, _} =
        combat_script_skill:convert_skill(Skills),
    case find_skill(14, PassiveSkills) of
        [CSkill = #c_skill{id = SkillId, action = {Mod, Act},
                           skill =
                               Skill = #skill{script_args = [BaseRatio]}}] ->
            NewSkill = Skill#skill{script_args =
                                       [round(BaseRatio * DescRatio / 1000) +
                                            AddRatio]},
            NewCSkill = CSkill#c_skill{skill = NewSkill},
            case Mod:Act(NewCSkill,
                         #fighter{pet_attr = PetAttr},
                         #fighter{},
                         #c_skill_addt_arg{})
                of
                #passive_effect{flag = 1} -> {true, CPet, SkillId};
                _ -> false
            end;
        _ -> do_check_flash(T, Args)
    end;
do_check_flash([CChild = #c_child{skills = Skills} | T],
               Args = #{add_ratio := AddRatio,
                        flush_pet_times := FlushPetTimes}) ->
    {_, PassiveSkills, _} =
        combat_script_skill:convert_skill(Skills),
    DescRatio = calc_ratio_desc(FlushPetTimes),
    case find_skill(17, PassiveSkills) of
        [CSkill = #c_skill{id = SkillId, action = {Mod, Act},
                           skill =
                               Skill = #skill{script_args = [BaseRatio]}}] ->
            NewSkill = Skill#skill{script_args =
                                       [round(BaseRatio * DescRatio / 1000) +
                                            AddRatio]},
            NewCSkill = CSkill#c_skill{skill = NewSkill},
            case Mod:Act(NewCSkill,
                         #fighter{},
                         #fighter{},
                         #c_skill_addt_arg{})
                of
                #passive_effect{flag = 1} -> {true, CChild, SkillId};
                _ -> false
            end;
        _ -> do_check_flash(T, Args)
    end.

calc_ratio_desc(0) -> 1000;
calc_ratio_desc(_) -> 1000.

auto_escape(#fighter{special_attr =
                         #special_attr{has_fearless = 1}}) ->
    false;
auto_escape(F = #fighter{id = Sid, hp = _Hp,
                         hp_max = _HpMax}) ->
    Result = false,
    case Result of
        false -> false;
        true ->
            NewSkill = combat_script_skill:to_combat_skill({1002,
                                                            1}),
            Action = {NewSkill, Sid},
            {true, F#fighter{action = Action}}
    end;
auto_escape(_) -> false.

init_war(Pet = #fighter{master_fid = MasterFid}) ->
    case combat_cache:f(by_id, MasterFid) of
        Master = #fighter{} ->
            #passive_effect{buff_self_to_target =
                                BuffSelfToTarget} =
                combat_script_skill_calc:passive_activate(pet_init,
                                                          Master,
                                                          Pet),
            lists:foreach(fun (Buff) ->
                                  combat_buff:buff_add(Buff, Master, Pet, false)
                          end,
                          BuffSelfToTarget),
            ok;
        _ -> ok
    end.

has_double_role(AtkList, DfdList) ->
    case do_find_double_role(AtkList, false) of
        {true, IsDouble, DoubleLev} ->
            {atk, IsDouble, DoubleLev};
        false ->
            case do_find_double_role(DfdList, false) of
                {true, IsDouble, DoubleLev} ->
                    {dfd, IsDouble, DoubleLev};
                false -> false
            end
    end.

do_find_double_role([], Result) -> Result;
do_find_double_role([#fighter{type = 1, lev = Lev,
                              is_double_point = IsDouble}
                     | T],
                    false) ->
    case IsDouble of
        1 -> do_find_double_role(T, {true, 1, Lev});
        0 -> do_find_double_role(T, {true, 0, Lev})
    end;
do_find_double_role([#fighter{type = 1, lev = Lev,
                              is_double_point = IsDouble}
                     | T],
                    {true, 1, MaxLev}) ->
    case IsDouble of
        1 ->
            NewMaxLev = max(Lev, MaxLev),
            do_find_double_role(T, {true, 1, NewMaxLev});
        0 -> do_find_double_role(T, {true, 1, MaxLev})
    end;
do_find_double_role([#fighter{type = 1, lev = Lev,
                              is_double_point = IsDouble}
                     | T],
                    {true, 0, _}) ->
    case IsDouble of
        1 -> do_find_double_role(T, {true, 1, Lev});
        0 -> do_find_double_role(T, {true, 0, Lev})
    end;
do_find_double_role([_ | T], Result) ->
    do_find_double_role(T, Result).

add_pet(3, AtkList, DfdList) ->
    case has_double_role(AtkList, DfdList) of
        {_, 0, _} -> {AtkList, DfdList};
        {atk, 1, DoubleLev} ->
            case lists:keyfind(1, #fighter.is_leader, DfdList) of
                #fighter{type = 2, base_id = UnitBase} ->
                    case pet_combat_data:get({3, UnitBase}) of
                        {NeedLev, PetList} when DoubleLev >= NeedLev ->
                            case rand_add_pet(PetList) of
                                {true, AddPet} ->
                                    {AtkList, DfdList ++ [AddPet]};
                                false -> {AtkList, DfdList}
                            end;
                        _ -> {AtkList, DfdList}
                    end;
                _ ->
                    ok,
                    {AtkList, DfdList}
            end;
        {dfd, 1, DoubleLev} ->
            case lists:keyfind(1, #fighter.is_leader, AtkList) of
                #fighter{type = 2, base_id = UnitBase} ->
                    case pet_combat_data:get({3, UnitBase}) of
                        {NeedLev, PetList} when DoubleLev >= NeedLev ->
                            case rand_add_pet(PetList) of
                                {true, AddPet} ->
                                    {AtkList ++ [AddPet], DfdList};
                                false -> {AtkList, DfdList}
                            end;
                        _ -> {AtkList, DfdList}
                    end;
                _ -> {AtkList, DfdList}
            end;
        _ -> {AtkList, DfdList}
    end;
add_pet(_CombatType, AtkList, DfdList) ->
    {AtkList, DfdList}.

rand_add_pet(PetList) ->
    Seed = util:rand(1, 10000),
    NewPetList = [{PetUnitId, round(Ratio * 200 / 100)}
                  || {PetUnitId, Ratio} <- PetList],
    do_rand_add_pet(NewPetList, Seed).

do_rand_add_pet([], _) -> false;
do_rand_add_pet([{PetUnitId, Ratio} | _T], Seed)
    when Seed =< Ratio ->
    case unit_convert:to(unit_base_id_to_fighter, PetUnitId)
        of
        {ok, AddPetF} -> {true, AddPetF};
        _ -> false
    end;
do_rand_add_pet([{_, Ratio} | T], Seed) ->
    do_rand_add_pet(T, Seed - Ratio).

pre_action(Master = #fighter{id = MasterId}) ->
    Pet = combat_cache:f(by_master_id, MasterId),
    case Pet of
        #fighter{id = PetId, type = 3, is_escape = 0,
                 is_die = 0,
                 special_status =
                     #special_status{is_weakness = 0, is_seal = 0,
                                     is_silent = 0, is_rest = 0, is_taunt = 0,
                                     is_stun = 0, is_sleep = 0,
                                     is_stone = 0}} ->
            #passive_effect{self_val_changed = Svc1,
                            self_changed = Sc1, target_val_changed = Tvc1,
                            target_changed = Tc1, buff_self_to_self = BuffS2S1,
                            buff_self_to_target = BuffS2T1,
                            show_passive_skills = ShowPassiveSkills1,
                            flag = Flag1} =
                combat_script_skill_calc:passive_activate(pre_action,
                                                          Pet,
                                                          Master),
            case Flag1 > 0 of
                true ->
                    Skill = combat_script_skill:to_combat_skill({2000, 1}),
                    combat_cache:u(PetId, Svc1),
                    combat_cache:u(MasterId, Tvc1),
                    lists:foreach(fun (Buff) ->
                                          combat_buff:buff_add(Buff, Pet, Pet)
                                  end,
                                  BuffS2S1),
                    lists:foreach(fun (Buff) ->
                                          combat_buff:buff_add(Buff,
                                                               Pet,
                                                               Master)
                                  end,
                                  BuffS2T1),
                    DoneTarget = case BuffS2T1 of
                                     [] -> Pet;
                                     _ -> Master
                                 end,
                    combat_play:add_sub_play(combat_play:gen_sub_skill_play(attack,
                                                                            {Pet,
                                                                             DoneTarget,
                                                                             Skill,
                                                                             Sc1,
                                                                             Tc1,
                                                                             1,
                                                                             0,
                                                                             0,
                                                                             0,
                                                                             ShowPassiveSkills1})),
                    combat_play:commit_play();
                false -> skip
            end;
        _ -> skip
    end.

find_skill(PassiveType, PassiveSkills) ->
    find_skill(PassiveType, PassiveSkills, []).

find_skill(_PassiveType, [], Skills) -> Skills;
find_skill(PassiveType,
           [Skill = #c_skill{passive_type = PassiveTypeList} | T],
           Skills) ->
    case lists:member(PassiveType, PassiveTypeList) of
        true -> find_skill(PassiveType, T, [Skill | Skills]);
        false -> find_skill(PassiveType, T, Skills)
    end;
find_skill(PassiveType, [_ | T], Skills) ->
    find_skill(PassiveType, T, Skills).

protect_master(T, Dmg, DmgHoly) ->
    protect_master(#fighter{}, T, Dmg, DmgHoly).

protect_master(#fighter{},
               Master = #fighter{type = Type, id = MasterId}, Dmg,
               DmgHoly)
    when Type =:= 1 orelse Type =:= 4 ->
    case combat_cache:f(by_master_id, MasterId) of
        Summon = #fighter{type = SummonType, is_defence = 0,
                          is_escape = 0, is_die = 0,
                          special_status =
                              #special_status{is_weakness = 0, is_seal = 0,
                                              is_silent = 0, is_rest = 0,
                                              is_taunt = 0},
                          passive_skills = PassiveSkills}
            when SummonType =:= 3 orelse SummonType =:= 6 ->
            case find_skill(7, PassiveSkills) of
                [CSkill = #c_skill{action = {Mod, Act}}] ->
                    SkillAddtArg = #c_skill_addt_arg{ext_args =
                                                         [Dmg, DmgHoly]},
                    case Mod:Act(CSkill, Summon, Master, SkillAddtArg) of
                        {true, NewDmg, NewDmgHoly, PetDmg, PetDmgHoly} ->
                            {true, NewDmg, NewDmgHoly, PetDmg, PetDmgHoly};
                        _ -> {false, Dmg, DmgHoly, 0, 0}
                    end;
                _ -> {false, Dmg, DmgHoly, 0, 0}
            end;
        _ -> {false, Dmg, DmgHoly, 0, 0}
    end;
protect_master(_S, _T, Dmg, DmgHoly) ->
    {false, Dmg, DmgHoly, 0, 0}.

revive_master(MasterPid) ->
    case combat_cache:f(by_pid, MasterPid) of
        Master = #fighter{type = Type, is_escape = 0,
                          is_die = 1,
                          special_status = #special_status{cannot_revive = 0}}
            when Type =:= 1 orelse Type =:= 4 ->
            case put({pet_master_die, MasterPid}, 1) of
                undefined ->
                    case combat_cache:f(by_master_pid, MasterPid) of
                        Summon = #fighter{type = SummonType, is_escape = 0,
                                          is_die = 0,
                                          special_status =
                                              #special_status{is_weakness = 0,
                                                              is_seal = 0,
                                                              is_stun = 0,
                                                              is_silent = 0,
                                                              is_sleep = 0,
                                                              is_stone = 0,
                                                              is_rest = 0,
                                                              is_taunt = 0},
                                          passive_skills = PassiveSkills}
                            when SummonType =:= 6 orelse SummonType =:= 3 ->
                            case find_skill(6, PassiveSkills) of
                                [CSkill = #c_skill{action = {Mod, Act}}] ->
                                    SkillAddtArg = #c_skill_addt_arg{},
                                    case Mod:Act(CSkill,
                                                 Summon,
                                                 Master,
                                                 SkillAddtArg)
                                        of
                                        true -> combat_play:commit_play();
                                        false -> ok
                                    end;
                                _ -> ok
                            end;
                        _ -> ok
                    end;
                _ -> ok
            end;
        _ ->
            erase({pet_master_die, MasterPid}),
            ok
    end.

enter_war(PetList) ->
    Fun = fun (#fighter{id = PetFid, name = _Name},
               {NewPetList, Flag}) ->
                  NewPet = combat_cache:f(by_id, PetFid),
                  Flag1 = do_enter_war(NewPet, Flag),
                  {[NewPet | NewPetList], Flag1}
          end,
    lists:foldl(Fun, {[], 0}, PetList).

do_enter_war(Self = #fighter{type = 3,
                             passive_skills = PassiveSkills,
                             master_pid = MasterPid},
             Flag) ->
    case find_skill(12, PassiveSkills) of
        CSkillList = [_ | _] ->
            case combat_cache:f(by_pid, MasterPid) of
                Master = #fighter{} ->
                    do_enter_war(CSkillList, Self, Master, Flag);
                _ -> Flag
            end;
        _ -> Flag
    end;
do_enter_war(_Self, Flag) -> Flag.

do_enter_war([], _Pet, _Master, Flag) -> Flag;
do_enter_war([CSkill = #c_skill{action = {Mod, Act}}
              | T],
             Pet, Master, Flag) ->
    SkillAddtArg = #c_skill_addt_arg{},
    case Mod:Act(CSkill, Pet, Master, SkillAddtArg) of
        true -> do_enter_war(T, Pet, Master, 1);
        false -> do_enter_war(T, Pet, Master, Flag)
    end.

