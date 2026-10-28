-file("src/mod/gods_duel/gods_challenge_mgr.erl", 1).

-module(gods_challenge_mgr).

-author("Suhan").

-behaviour(gen_server).

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

-file("src/mod/gods_duel/gods_challenge_mgr.erl", 15).

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

-file("src/mod/gods_duel/gods_challenge_mgr.erl", 16).

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

-file("src/mod/gods_duel/gods_challenge_mgr.erl", 17).

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

-file("src/mod/gods_duel/gods_challenge_mgr.erl", 18).

-file("inc/gods_place.hrl", 1).

-record(gods_place_team_statue,
        {ver = 1,
         team_id = 0,
         id = {0, "", 0},
         name = "",
         lev = 0,
         members = [],
         qualification = 0,
         serial_id = 0,
         team_leader = {0, "", 0}}).

-record(gods_place_team_mate_statue,
        {ver = 1,
         id = {0, "", 0},
         name = "",
         lev = 0,
         classes = 0,
         sex = 0,
         break_times = 0,
         looks = []}).

-record(m_gods_place,
        {ver = 3,
         group_id = 0,
         zone_id = 0,
         zone_pid = 0,
         pick_chest = 0,
         worship_times = 0,
         total_num = 0,
         sys_barrage = 1,
         ply_barrage = 1,
         barrage_time = 0,
         efficiency_flag = 0,
         pick_flag = 0}).

-file("src/mod/gods_duel/gods_challenge_mgr.erl", 19).

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

-file("src/mod/gods_duel/gods_challenge_mgr.erl", 20).

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

-file("src/mod/gods_duel/gods_challenge_mgr.erl", 21).

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

-file("src/mod/gods_duel/gods_challenge_mgr.erl", 22).

-export([start_link/0,
         info/1,
         cast/1,
         call/1,
         start_combat/0,
         start_combat/2,
         combat_over/1,
         cast_watch_info/1,
         get_challenger_role_id/2,
         send_mail/3]).

-export([init/1,
         handle_call/3,
         handle_cast/2,
         handle_info/2,
         terminate/2,
         code_change/3]).

-record(state,
        {season_id = 0,
         ref = undefined,
         watch_status = 0,
         support = [{0, 1}, {1, 1}, {2, 1}],
         wave = 1,
         hp = 1,
         hp_max = 1,
         box_reward_cd = 0,
         box_reward_ref = undefined,
         observers_num = 0,
         push_observers_num = 0,
         update_observers_num = 0,
         push_observers_num_ref = undefined,
         fighter_role_id = []}).

start_link() ->
    gen_server:start_link({local, gods_challenge_mgr},
                          gods_challenge_mgr,
                          [],
                          []).

info(Msg) -> gods_challenge_mgr ! Msg.

cast(Msg) -> gen_server:cast(gods_challenge_mgr, Msg).

call(Msg) ->
    case catch gen_server:call(gods_challenge_mgr,
                               Msg,
                               10000)
        of
        {'EXIT', {timeout, _}} -> {error, timeout};
        {'EXIT', {noproc, _}} -> {error, noproc};
        {'EXIT', {normal, _}} -> {error, exit};
        {'EXIT', _Call_Err} -> {error, _Call_Err};
        _Call_Return -> _Call_Return
    end.

start_combat() ->
    SeasonId = gods_duel_common:get_season_id(),
    case lookup_challenge(SeasonId) of
        {ok, #gods_challenge_info{combat_pid = Pid}}
            when is_pid(Pid) ->
            false;
        {ok, #gods_challenge_info{is_over = 1}} -> false;
        _ ->
            ChallengeList = case env:get(challengelist) of
                                undefined -> [];
                                _ChallengeList -> _ChallengeList
                            end,
            case get_challenger_role_id(ChallengeList,
                                        ChallengeList)
                of
                {ok, Role} ->
                    case start_combat(Role, not_push) of
                        {ok, ok} -> true;
                        _Err -> false
                    end;
                _Err ->
                    TeamName = case env:get(challengename) of
                                   undefined -> lang:get("神秘战队");
                                   _TeamName -> _TeamName
                               end,
                    Msg =
                        notice:format(lang:get("<color='#00ff00'>~ts</color>队伍在绯月大陆中不知所踪，未能发起"
                                               "<color='#00ff00'>诸神挑战</color>；请战队成员们抓紧时间，在<co"
                                               "lor='#00ff00'>21:25</color>前发起挑战"),
                                      [{string_1, TeamName}]),
                    big_world:cast(all, notice, cast, [all, 4, Msg]),
                    big_world:cast(all, notice, cast, [all, 11, Msg]),
                    Title = lang:get("诸神挑战"),
                    Content =
                        lang:get("你的队伍未能准时对<color='#00ff00'>诸神</color>发起挑战，请在21"
                                 "：25前完成组队，到诸神殿堂中的活动使者处发起挑战"),
                    send_mail(ChallengeList, Title, Content),
                    false
            end
    end.

start_combat(Role = #role{}, Push) ->
    case team:get_fighters(Role) of
        {ok, Fighters} ->
            Name = case env:get(challengename) of
                       undefined -> lang:get("神秘战队");
                       _TeamName -> _TeamName
                   end,
            Msg =
                notice:format(lang:get("<color='#00ff00'>~ts</color>队伍对诸神发起了挑战，强者们能战胜"
                                       "强大的神祇吗？点击活动分页发起观战{face_1, 20}"),
                              [{string_1, Name}]),
            big_world:cast(all, notice, cast, [all, 5, Msg]),
            big_world:cast(all, notice, cast, [all, 11, Msg]),
            CombatRecordId =
                env:update_counter(gods_duel_combat_record_id, 1),
            ExtArgs = [{combat_record_id, CombatRecordId},
                       {team_name, Name}],
            StartArgs = #combat_start_args{ext_args = ExtArgs},
            big_world:cast(gods_challenge_mgr,
                           info,
                           [{start_combat, Fighters, StartArgs, Push}]),
            {ok, ok};
        _Err -> {ok, false}
    end.

combat_over(#combat{type = CombatType, winner = Winner,
                    loser = Loser, result = Result, start_time = StartTime,
                    start_args = #combat_start_args{ext_args = ExtArgs}}) ->
    TeamName = case lists:keyfind(team_name, 1, ExtArgs) of
                   {_, TeamName1} -> TeamName1;
                   _ -> lang:get("神秘战队")
               end,
    CombatTime = max(1, date:unixtime2() - StartTime),
    case Result of
        10 ->
            WinnerFighter = [F || F = #fighter{type = 1} <- Winner],
            combat_over_calc(WinnerFighter, CombatTime, 1),
            WinMsg =
                notice:format(lang:get("<color='#ffff00'>~ts</color>队伍强大无匹，在全服玩家的见证下，"
                                       "以雷霆之势完成了诸神挑战！诸神的荣耀再次映照着绯月大地{face_1,18}"),
                              [{string_1, TeamName}]),
            big_world:cast(all, notice, cast, [all, 11, WinMsg]),
            big_world:cast(all, notice, cast, [all, 5, WinMsg]),
            big_world:cast(all, notice, effect, [all, 30231]),
            send_reward(WinnerFighter);
        _ ->
            LoserFighter = [F || F = #fighter{type = 1} <- Loser],
            LossMsg =
                notice:format(lang:get("~ts队伍与诸神们大战三百回合，最终因体力不支，不幸落败，真是可惜啊！"),
                              [{string_2, 1, TeamName}]),
            big_world:cast(all, notice, cast, [all, 5, LossMsg]),
            big_world:cast(all, notice, cast, [all, 11, LossMsg]),
            combat_over_calc(LoserFighter, CombatTime, 0)
    end,
    CombatRecordId = case lists:keyfind(combat_record_id,
                                        1,
                                        ExtArgs)
                         of
                         {combat_record_id, _RecordId} -> _RecordId;
                         _ -> 0
                     end,
    cast_record(#{combat_type => CombatType,
                  record => combat_record:get_buffer(),
                  match_id => CombatRecordId, winner => Winner,
                  loser => Loser}),
    info({combat_over,
          #{combat_record_id => CombatRecordId, winner => Winner,
            loser => Loser, result => Result}}),
    ok.

cast_watch_info(Status) ->
    big_world:cast(all,
                   gods_challenge_agent,
                   info,
                   [{challenge_watch_info, Status}]).

get_challenger_role_id([], _) -> false;
get_challenger_role_id([RoleId = {_, P, Z} | Rest],
                       ChallengeList) ->
    case big_world:call(P,
                        Z,
                        role,
                        apply,
                        [sync,
                         RoleId,
                         {gods_challenge_role,
                          check_team_have_qualification,
                          [ChallengeList]}])
        of
        {ok, Role} -> {ok, Role};
        _Err ->
            logger:info("~w", [_Err], gods_challenge_mgr, 182),
            get_challenger_role_id(Rest, ChallengeList)
    end.

send_mail([], _, _) -> ok;
send_mail(ChallengeList = [{_, P, Z} | _Rest], Title,
          Content) ->
    big_world:cast(P,
                   Z,
                   gods_challenge_role,
                   send_mail,
                   [ChallengeList, Title, Content]).

init([]) ->
    process_flag(trap_exit, true),
    ets:new(gods_challenge_info,
            [set,
             named_table,
             public,
             {keypos, #gods_challenge_info.id}]),
    {ok, #state{}}.

handle_call(_Request, _From, State) ->
    {reply, ok, State}.

handle_cast(_Request, State) -> {noreply, State}.

handle_info({update_season_id, SeasonId}, State) ->
    {noreply, State#state{season_id = SeasonId}};
handle_info({update_watch_status, Status}, State) ->
    cast_watch_info(Status),
    big_world:cast(all,
                   gods_challenge_agent,
                   info,
                   [{challenge_watch_info, 1, 1, 1}]),
    {noreply,
     State#state{watch_status = Status, wave = 1, hp = 1,
                 hp_max = 1}};
handle_info({start_combat,
             AtkFighters,
             StartArgs = #combat_start_args{ext_args = ExtArgs},
             Push},
            State = #state{ref = Ref,
                           push_observers_num_ref = PushObserversNumRef,
                           watch_status = WatchStatus,
                           fighter_role_id = OldFighterRoleId}) ->
    SeasonId = gods_duel_common:get_season_id(),
    Support = [{0, 1}, {1, 1}, {2, 1}],
    {NewRef,
     NewPushObserversNumRef,
     NewWatchStatus,
     FighterRoleId} =
        case lookup_challenge(SeasonId) of
            {ok, #gods_challenge_info{is_over = 1}} ->
                {Ref,
                 PushObserversNumRef,
                 WatchStatus,
                 OldFighterRoleId};
            {ok, #gods_challenge_info{combat_pid = Pid}}
                when is_pid(Pid) ->
                {Ref,
                 PushObserversNumRef,
                 WatchStatus,
                 OldFighterRoleId};
            _ ->
                BossBaseId = case gods_challenge_data:get_wave_info(1)
                                 of
                                 #{unit_id := UnitId} -> UnitId;
                                 _ ->
                                     logger:error("找不到配置波数",
                                                  [],
                                                  gods_challenge_mgr,
                                                  227),
                                     84002
                             end,
                DfdFighters = {unit_baseid, BossBaseId},
                case combat_mgr:start_combat(71,
                                             AtkFighters,
                                             DfdFighters,
                                             StartArgs)
                    of
                    {ok, CombatPid} ->
                        case Push of
                            push -> gods_place_mgr:info(start_combat);
                            _ -> ok
                        end,
                        NewChallengeInfo = #gods_challenge_info{id = SeasonId,
                                                                combat_pid =
                                                                    CombatPid,
                                                                is_over = 0},
                        update_challenge(NewChallengeInfo),
                        {_, AtkName} = lists:keyfind(team_name, 1, ExtArgs),
                        DfdName = lang:get("诸神挑战"),
                        {_, CombatRecordId} = lists:keyfind(combat_record_id,
                                                            1,
                                                            ExtArgs),
                        ChallengeProfile = #gods_duel_match_profile{id =
                                                                        CombatRecordId,
                                                                    season_id =
                                                                        SeasonId,
                                                                    match_type =
                                                                        3,
                                                                    match_round
                                                                        = 9,
                                                                    match_id =
                                                                        0,
                                                                    group_id =
                                                                        5,
                                                                    combat_type
                                                                        = 71,
                                                                    atk_name =
                                                                        AtkName,
                                                                    dfd_name =
                                                                        DfdName,
                                                                    combat_pid =
                                                                        CombatPid,
                                                                    is_over = 0,
                                                                    time =
                                                                        date:unixtime()},
                        big_world:cast(all,
                                       gods_duel_agent,
                                       info,
                                       [{update_match_profile,
                                         ChallengeProfile}]),
                        big_world:cast(all,
                                       gods_challenge_agent,
                                       info,
                                       [{update_challenge_info, SeasonId}]),
                        gods_duel_match:update_match_profile(ChallengeProfile),
                        cast_watch_info(1),
                        Ref1 = erlang:send_after(10000, self(), get_boss_hp),
                        Ref2 = erlang:send_after(10000,
                                                 self(),
                                                 {observer_num_guarantee, 10}),
                        FighterRoleId1 = case AtkFighters of
                                             [{leader, #role{id = RoleId1}, _}
                                              | Mates] ->
                                                 FighterRoleId2 = [RoleId
                                                                   || #team_mate{id
                                                                                     =
                                                                                     RoleId}
                                                                          <- Mates],
                                                 [RoleId1 | FighterRoleId2];
                                             _ -> []
                                         end,
                        Data = gods_challenge_agent:handle_17964_data(Support,
                                                                      1,
                                                                      0,
                                                                      1,
                                                                      1),
                        push_17964(FighterRoleId1, Data),
                        {Ref1, Ref2, 1, FighterRoleId1};
                    {false, Reason} ->
                        logger:error("~w", [Reason], gods_challenge_mgr, 275),
                        Args = #{},
                        info({combat_over, Args}),
                        {Ref, PushObserversNumRef, 0, OldFighterRoleId}
                end
        end,
    BoxRewardCd = case
                      combat_observer_data:get_reward_info({71, 4})
                      of
                      #{reward_list := [RewardId | _]} ->
                          case combat_observer_data:get_box_reward(RewardId) of
                              #{cd_seconds := CdSeconds} -> CdSeconds;
                              _ -> 5 * 60
                          end;
                      _ -> 5 * 60
                  end,
    NextTime = date:unixtime2() + BoxRewardCd,
    BoxRewardRef = erlang:send_after(BoxRewardCd * 1000,
                                     self(),
                                     send_box_reward),
    big_world:cast(all,
                   gods_challenge_agent,
                   info,
                   [{set_reward_cd, NextTime}]),
    NewState = State#state{season_id = SeasonId,
                           ref = NewRef, watch_status = NewWatchStatus,
                           wave = 1, support = Support,
                           box_reward_cd = NextTime,
                           box_reward_ref = BoxRewardRef,
                           push_observers_num_ref = NewPushObserversNumRef,
                           fighter_role_id = FighterRoleId, hp = 1, hp_max = 1},
    {noreply, NewState};
handle_info({combat_over,
             #{combat_record_id := CombatRecordId,
               result := Result}},
            State = #state{season_id = SeasonId, ref = Ref,
                           box_reward_ref = BoxRewardRef,
                           push_observers_num_ref = PushObserversNumRef}) ->
    case gods_place_mgr:call({get_status}) of
        {7, _Ts, _Timeout} -> gods_place_mgr:next();
        _ -> ok
    end,
    case
        gods_duel_match:lookup_match_profile(CombatRecordId)
        of
        {ok, ChallengeProfile} ->
            NewChallengeProfile =
                ChallengeProfile#gods_duel_match_profile{is_over = 1,
                                                         combat_pid =
                                                             undefined},
            gods_duel_match:update_match_profile(NewChallengeProfile),
            big_world:cast(all,
                           gods_duel_agent,
                           info,
                           [{update_match_profile, NewChallengeProfile}]);
        _ -> ok
    end,
    case lookup_challenge(SeasonId) of
        {ok, ChallengeInfo = #gods_challenge_info{}} ->
            NewChallengeInfo =
                ChallengeInfo#gods_challenge_info{combat_pid =
                                                      undefined,
                                                  is_over = 1},
            update_challenge(NewChallengeInfo);
        _ -> ok
    end,
    case Ref of
        undefined -> ok;
        OldRef1 when is_reference(OldRef1) ->
            erlang:cancel_timer(OldRef1);
        _ -> ok
    end,
    case BoxRewardRef of
        undefined -> ok;
        BoxRewardRef1 when is_reference(BoxRewardRef1) ->
            erlang:cancel_timer(BoxRewardRef1);
        _ -> ok
    end,
    case PushObserversNumRef of
        undefined -> ok;
        OldRef2 when is_reference(OldRef2) ->
            erlang:cancel_timer(OldRef2);
        _ -> ok
    end,
    NewWatchStatus = case Result of
                         10 -> 2;
                         _ -> 3
                     end,
    cast_watch_info(NewWatchStatus),
    big_world:cast(all,
                   gods_challenge_agent,
                   info,
                   [{update_challenge_result, Result}]),
    NewState = State#state{ref = undefined,
                           watch_status = NewWatchStatus,
                           push_observers_num_ref = undefined},
    {noreply, NewState};
handle_info(challenge_timeout,
            State = #state{season_id = SeasonId}) ->
    case lookup_challenge(SeasonId) of
        {ok, #gods_challenge_info{combat_pid = CombatPid}}
            when is_pid(CombatPid) ->
            CombatPid ! stop_result;
        _ -> ok
    end,
    {noreply, State};
handle_info(get_boss_hp,
            State = #state{season_id = SeasonId, wave = Wave}) ->
    NewRef = case lookup_challenge(SeasonId) of
                 {ok, #gods_challenge_info{combat_pid = CombatPid}}
                     when is_pid(CombatPid) ->
                     BossBaseId = case
                                      gods_challenge_data:get_wave_info(Wave)
                                      of
                                      #{unit_id := UnitId} -> UnitId;
                                      _ -> 84002
                                  end,
                     CombatPid ! {get_base_id_hp, 71, BossBaseId},
                     erlang:send_after(10000, self(), get_boss_hp);
                 _ -> ok
             end,
    {noreply, State#state{ref = NewRef}};
handle_info({update_boss_hp, Hp, MaxHp},
            State = #state{wave = Wave}) ->
    big_world:cast(all,
                   gods_challenge_agent,
                   info,
                   [{challenge_watch_info, Wave, Hp, MaxHp}]),
    {noreply, State#state{hp = Hp, hp_max = MaxHp}};
handle_info({add_support, AddSupport},
            State = #state{support = Support}) ->
    NewSupport = add_support(AddSupport, Support),
    NewState = State#state{support = NewSupport},
    big_world:cast(all,
                   gods_challenge_agent,
                   info,
                   [{update_support_info, NewSupport}]),
    {noreply, NewState};
handle_info({update_challenge_wave, NewWave}, State) ->
    NewState = State#state{wave = NewWave, hp = 1,
                           hp_max = 1},
    {noreply, NewState};
handle_info({observer_num_guarantee, Time},
            State = #state{observers_num = ObserversNum,
                           support = Support, wave = Wave, hp = Hp,
                           hp_max = MaxHp, fighter_role_id = FighterRole}) ->
    {PushObserversNum, Ref} = case Time < 300 of
                                  true ->
                                      Ref1 = erlang:send_after(10000,
                                                               self(),
                                                               {observer_num_guarantee,
                                                                Time + 10}),
                                      case ObserversNum < 20 + Time of
                                          true ->
                                              {20 * Time + util:rand(1, 100),
                                               Ref1};
                                          _ -> {ObserversNum, Ref1}
                                      end;
                                  _ ->
                                      Ref2 = erlang:send_after(10000,
                                                               self(),
                                                               push_observers_num),
                                      case Time =:= 300 of
                                          true ->
                                              case ObserversNum < 6000 of
                                                  true ->
                                                      {6000 + util:rand(1, 100),
                                                       Ref2};
                                                  _ -> {ObserversNum, Ref2}
                                              end;
                                          _ -> {ObserversNum, Ref2}
                                      end
                              end,
    big_world:cast(all,
                   gods_challenge_agent,
                   info,
                   [{set_push_observers_num, PushObserversNum}]),
    Data = gods_challenge_agent:handle_17964_data(Support,
                                                  Wave,
                                                  PushObserversNum,
                                                  Hp,
                                                  MaxHp),
    push_17964(FighterRole, Data),
    {noreply,
     State#state{push_observers_num = PushObserversNum,
                 push_observers_num_ref = Ref,
                 update_observers_num = 0}};
handle_info({add_observers_num, Num},
            State = #state{observers_num = ObserversNum,
                           update_observers_num = UpdateObserversNum}) ->
    NewObserversNum = max(0, ObserversNum + Num),
    NewUpdateObserversNum = UpdateObserversNum + Num,
    {noreply,
     State#state{observers_num = NewObserversNum,
                 update_observers_num = NewUpdateObserversNum}};
handle_info(push_observers_num,
            State = #state{support = Support,
                           push_observers_num = ObserversNum,
                           update_observers_num = UpdateObserversNum,
                           fighter_role_id = FighterRole, wave = Wave, hp = Hp,
                           hp_max = MaxHp}) ->
    NewPushObserversNum = ObserversNum + UpdateObserversNum,
    big_world:cast(all,
                   gods_challenge_agent,
                   info,
                   [{set_push_observers_num, ObserversNum}]),
    Ref = erlang:send_after(10000,
                            self(),
                            push_observers_num),
    Data = gods_challenge_agent:handle_17964_data(Support,
                                                  Wave,
                                                  NewPushObserversNum,
                                                  Hp,
                                                  MaxHp),
    push_17964(FighterRole, Data),
    {noreply,
     State#state{push_observers_num = NewPushObserversNum,
                 update_observers_num = 0,
                 push_observers_num_ref = Ref}};
handle_info(send_box_reward,
            State = #state{watch_status = 1}) ->
    BoxRewardCd = case
                      combat_observer_data:get_reward_info({71, 4})
                      of
                      #{reward_list := [RewardId | _]} ->
                          case combat_observer_data:get_box_reward(RewardId) of
                              #{cd_seconds := CdSeconds} -> CdSeconds;
                              _ -> 5 * 60
                          end;
                      _ -> 5 * 60
                  end,
    BoxRewardRef = erlang:send_after(BoxRewardCd * 1000,
                                     self(),
                                     send_box_reward),
    NextBoxRewardTime = date:unixtime2() + BoxRewardCd,
    big_world:cast(all,
                   gods_challenge_agent,
                   info,
                   [{set_reward_cd, NextBoxRewardTime}]),
    {noreply,
     State#state{box_reward_ref = BoxRewardRef,
                 box_reward_cd = NextBoxRewardTime}};
handle_info(update_challenge_info, State) ->
    SeasonId = gods_duel_common:get_season_id(),
    update_challenge(#gods_challenge_info{id = SeasonId}),
    {noreply, State};
handle_info(_Info, State) -> {noreply, State}.

terminate(_Reason, _State) -> ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

lookup_challenge(SeasonId) ->
    case catch ets:lookup(gods_challenge_info, SeasonId) of
        [Challenge = #gods_challenge_info{} | _] ->
            {ok, Challenge};
        _ -> false
    end.

update_challenge(ChallengeInfo) ->
    ets:insert(gods_challenge_info, ChallengeInfo).

cast_record(CastM = #{winner := Winner, loser := Loser,
                      match_id := MatchId,
                      record := #combat_record{round = Round}}) ->
    Ids = [Id
           || #fighter{origin_id = Id} <- Winner ++ Loser],
    NewCastM = CastM#{is_marvel => true},
    case get_pz(Ids) of
        {Platform, ZoneId} ->
            case ets:lookup(gods_duel_match_profile, MatchId) of
                [ChallengeProfile = #gods_duel_match_profile{}] ->
                    NewChallengeProfile =
                        ChallengeProfile#gods_duel_match_profile{platform =
                                                                     Platform,
                                                                 zone_id =
                                                                     ZoneId,
                                                                 round = Round},
                    gods_duel_match:update_match_profile(NewChallengeProfile),
                    big_world:cast(all,
                                   gods_duel_agent,
                                   info,
                                   [{update_match_profile,
                                     NewChallengeProfile}]),
                    ok;
                _ -> ok
            end,
            big_world:cast(all,
                           combat_record,
                           save,
                           [NewCastM#{ids => Ids, cross => true,
                                      pz => {Platform, ZoneId}}]);
        _ -> ok
    end.

get_pz([]) -> false;
get_pz([{_, Platform, ZoneId} | _Rest]) ->
    {Platform, ZoneId};
get_pz([_ | Rest]) -> get_pz(Rest).

combat_over_calc(Fighter, CombatTime, Result) ->
    MatesList = [{RoleId,
                  Name,
                  Sex,
                  Classes,
                  Lev,
                  TotalDmg,
                  TotalHeal}
                 || #fighter{origin_id = RoleId, sex = Sex, lev = Lev,
                             classes = Classes, name = Name,
                             combat_statistics =
                                 #combat_statistics{total_dmg = TotalDmg,
                                                    total_heal = TotalHeal}}
                        <- Fighter],
    [role:pack_send(Pid,
                    17958,
                    {Result, CombatTime, MatesList})
     || #fighter{pid = Pid} <- Fighter],
    ok.

send_reward([#fighter{platform = Platform,
                      zone_id = ZoneId}
             | _]) ->
    big_world:cast(Platform,
                   ZoneId,
                   gods_challenge_agent,
                   send_reward,
                   []),
    ok.

add_support([], Support) -> Support;
add_support([{SupportType, SupportNum} | Rest],
            Support) ->
    NewSupport = case lists:keyfind(SupportType, 1, Support)
                     of
                     {_, SupportNum1} ->
                         lists:keystore(SupportType,
                                        1,
                                        Support,
                                        {SupportType,
                                         SupportNum1 + SupportNum});
                     _ -> Support
                 end,
    add_support(Rest, NewSupport).

push_17964([], _Data) -> ok;
push_17964([RoleId = {_, P, Z} | Rest], Data) ->
    big_world:cast(P,
                   Z,
                   gods_challenge_agent,
                   push_17964,
                   [RoleId, Data]),
    push_17964(Rest, Data).

