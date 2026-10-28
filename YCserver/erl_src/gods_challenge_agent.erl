-file("src/mod/gods_duel/gods_challenge_agent.erl", 1).

-module(gods_challenge_agent).

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

-file("src/mod/gods_duel/gods_challenge_agent.erl", 15).

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

-file("src/mod/gods_duel/gods_challenge_agent.erl", 16).

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

-file("src/mod/gods_duel/gods_challenge_agent.erl", 17).

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

-file("src/mod/gods_duel/gods_challenge_agent.erl", 18).

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

-file("src/mod/gods_duel/gods_challenge_agent.erl", 19).

-export([start_link/0,
         info/1,
         call/1,
         send_reward/0,
         send_reward/1,
         handle_17964_data/5,
         push_17964/2,
         push_10780/2,
         repair/1]).

-export([init/1,
         handle_call/3,
         handle_cast/2,
         handle_info/2,
         terminate/2,
         code_change/3]).

-record(state,
        {season_id = 0,
         observers = [],
         observers_num = 0,
         update_observers_num = 0,
         push_observers_num = 0,
         push_observers_num_ref = undefined,
         observers_reward = [],
         result = undefined,
         watch_status = 0,
         wave = 1,
         hp = 1,
         max_hp = 1,
         add_support = [],
         support = [{0, 1}, {1, 1}, {2, 1}],
         ref = undefined,
         box_reward_cd = 0}).

start_link() ->
    gen_server:start_link({local, gods_challenge_agent},
                          gods_challenge_agent,
                          [],
                          []).

info(Msg) -> gods_challenge_agent ! Msg.

call(Msg) ->
    case catch gen_server:call(gods_challenge_agent,
                               Msg,
                               10000)
        of
        {'EXIT', {timeout, _}} -> {error, timeout};
        {'EXIT', {noproc, _}} -> {error, noproc};
        {'EXIT', {normal, _}} -> {error, exit};
        {'EXIT', _Call_Err} -> {error, _Call_Err};
        _Call_Return -> _Call_Return
    end.

send_reward() ->
    case env:get(gods_challenge_team) of
        #gods_challenge_team{members = Members} ->
            send_reward(Members);
        _ -> false
    end.

send_reward([]) -> ok;
send_reward([#gods_challenge_team_mate{id = RoleId}
             | Rest]) ->
    role:apply(async,
               RoleId,
               {gods_challenge_role, apply_send_reward, []}),
    send_reward(Rest).

init([]) ->
    process_flag(trap_exit, true),
    {ok, #state{}}.

handle_call(challenge_watch_info, _From,
            State = #state{watch_status = Status, wave = Wave,
                           hp = Hp, max_hp = MaxHp}) ->
    Reply = {Status,
             round((4 - Wave) * 100 / 3),
             Hp,
             MaxHp},
    {reply, Reply, State};
handle_call({get_reward, RoleId, RewardId}, _From,
            State = #state{observers = Roles,
                           observers_reward = ObserverReward}) ->
    case lists:keyfind(RoleId, #c_observer.role_id, Roles)
        of
        false -> {reply, {false, []}, State};
        _ ->
            case lists:keyfind(RoleId, 1, ObserverReward) of
                {_, Reward} ->
                    case lists:keyfind(RewardId, 1, Reward) of
                        {_, RtnReward} ->
                            NewReward = lists:keydelete(RewardId, 1, Reward),
                            NewObserverReward = lists:keystore(RoleId,
                                                               1,
                                                               ObserverReward,
                                                               {RoleId,
                                                                NewReward}),
                            NewState = State#state{observers_reward =
                                                       NewObserverReward},
                            {reply, {ok, RtnReward}, NewState};
                        _ -> {reply, {false, []}, State}
                    end;
                _ -> {reply, {false, []}, State}
            end
    end;
handle_call(get_result, _From,
            State = #state{result = _Result}) ->
    Result = env:get(challenge_result),
    {reply, Result, State};
handle_call(get_season_id, _From,
            State = #state{season_id = SeasonId}) ->
    {reply, SeasonId, State};
handle_call(_Request, _From, State) ->
    {reply, ok, State}.

handle_cast(_Request, State) -> {noreply, State}.

handle_info(push_support,
            State = #state{result = Result,
                           add_support = AddSupport, support = Support,
                           observers = Ob, wave = Wave,
                           push_observers_num = ObserversNum, hp = Hp,
                           max_hp = MaxHp}) ->
    AllSupport = get_now_support(AddSupport, Support),
    case Result of
        undefined ->
            Data = handle_17964_data(AllSupport,
                                     Wave,
                                     ObserversNum,
                                     Hp,
                                     MaxHp),
            push_17964(Ob, Data);
        _ ->
            Data = handle_17964_data(AllSupport,
                                     Wave,
                                     ObserversNum,
                                     Hp,
                                     MaxHp),
            push_17964(Ob, Data)
    end,
    {noreply, State};
handle_info(push_add_support,
            State = #state{add_support = AddSupport,
                           result = Result}) ->
    big_world:cast(gods_challenge_mgr,
                   info,
                   [{add_support, AddSupport}]),
    Ref = case Result of
              undefined ->
                  erlang:send_after(60 * 1000, self(), push_add_support);
              _ -> undefined
          end,
    NewState = State#state{add_support = [], ref = Ref},
    {noreply, NewState};
handle_info({add_support, SupportType},
            State = #state{add_support = Support}) ->
    NewSupport = case lists:keyfind(SupportType, 1, Support)
                     of
                     {_, SupportNum} ->
                         lists:keystore(SupportType,
                                        1,
                                        Support,
                                        {SupportType, SupportNum + 1});
                     _ ->
                         lists:keystore(SupportType,
                                        1,
                                        Support,
                                        {SupportType, 1})
                 end,
    {noreply, State#state{add_support = NewSupport}};
handle_info({update_support_info, NewSupport},
            State = #state{observers = Ob, add_support = AddSupport,
                           wave = Wave, push_observers_num = ObserversNum,
                           hp = Hp, max_hp = MaxHp}) ->
    NewState = State#state{support = NewSupport},
    AllSupport = get_now_support(AddSupport, NewSupport),
    Data = handle_17964_data(AllSupport,
                             Wave,
                             ObserversNum,
                             Hp,
                             MaxHp),
    push_17964(Ob, Data),
    {noreply, NewState};
handle_info({update_challenge_result, Result}, State) ->
    case Result of
        10 ->
            role_group:apply(world,
                             {gods_challenge_role, send_observer_reward, []}),
            ok;
        _ -> ok
    end,
    SeasonId = gods_duel_common:get_season_id(),
    env:save(challenge_result, {SeasonId, Result}),
    NewState = State#state{result = Result},
    {noreply, NewState};
handle_info({update_challenge_info, SeasonId},
            _State) ->
    {noreply, #state{season_id = SeasonId}};
handle_info({observer_enter,
             Ob = #c_observer{role_id = RoleId}},
            State = #state{wave = Wave, observers = ObServers,
                           observers_num = ObserversNum,
                           push_observers_num = PushObserverNum,
                           update_observers_num = UpdateObserversNum,
                           support = Support, add_support = AddSupport, hp = Hp,
                           max_hp = MaxHp, box_reward_cd = Cd}) ->
    NewObservers = lists:keystore(RoleId,
                                  #c_observer.role_id,
                                  ObServers,
                                  Ob),
    NewState = State#state{observers = NewObservers,
                           observers_num = ObserversNum + 1,
                           update_observers_num = UpdateObserversNum + 1},
    AllSupport = get_now_support(AddSupport, Support),
    Data = handle_17964_data(AllSupport,
                             Wave,
                             PushObserverNum,
                             Hp,
                             MaxHp),
    push_17964([Ob], Data),
    push_10780([Ob], {Cd}),
    {noreply, NewState};
handle_info({observer_enter, _Ob}, State) ->
    {noreply, State};
handle_info({observer_leave, RoleId},
            State = #state{observers = Observers,
                           observers_num = ObserversNum,
                           update_observers_num = UpdateObserversNum}) ->
    {NewObservers, NewObserversNum, NewUpdateObserversNum} =
        case lists:keyfind(RoleId,
                           #c_observer.role_id,
                           Observers)
            of
            false -> {Observers, ObserversNum, UpdateObserversNum};
            Ob ->
                {Observers -- [Ob],
                 ObserversNum - 1,
                 UpdateObserversNum - 1}
        end,
    {noreply,
     State#state{observers = NewObservers,
                 observers_num = NewObserversNum,
                 update_observers_num = NewUpdateObserversNum}};
handle_info({observer_reward,
             Reward = #{reward_type := _RewardType}},
            State = #state{observers = Observers,
                           observers_reward = ObserversReward}) ->
    Now = date:unixtime2(),
    NewObserversReward = handle_observer_reward(Observers,
                                                Reward,
                                                Now,
                                                ObserversReward),
    {noreply,
     State#state{observers_reward = NewObserversReward}};
handle_info({set_reward_cd, Cd},
            State = #state{observers = Observers,
                           observers_reward = ObserversReward}) ->
    Now = date:unixtime2(),
    NewObserverReward = case
                            combat_observer_data:get_reward_info({71, 4})
                            of
                            #{reward_list := [RewardId | _]} ->
                                case
                                    combat_observer_data:get_box_reward(RewardId)
                                    of
                                    #{exp_mod := ExpMod, gift_id := GiftId,
                                      send_probability := SendProbability,
                                      get_probability := GetProbability} ->
                                        RewardInfo = #{id => 1,
                                                       reward_type => 4,
                                                       exp_mod => ExpMod,
                                                       gift_id => GiftId,
                                                       send_probability =>
                                                           SendProbability,
                                                       get_probability =>
                                                           GetProbability},
                                        handle_observer_reward(Observers,
                                                               RewardInfo,
                                                               Now,
                                                               ObserversReward);
                                    _ ->
                                        logger:error("观战宝箱奖励配置错误",
                                                     [],
                                                     gods_challenge_agent,
                                                     236),
                                        ObserversReward
                                end;
                            _ ->
                                logger:error("观战宝箱奖励配置错误",
                                             [],
                                             gods_challenge_agent,
                                             240),
                                ObserversReward
                        end,
    push_10780(Observers, {Cd}),
    {noreply,
     State#state{box_reward_cd = Cd,
                 observers_reward = NewObserverReward}};
handle_info({reward_timeout, RoleId, RewardId},
            State = #state{observers_reward = ObserverReward}) ->
    NewObserverReward = case lists:keyfind(RoleId,
                                           1,
                                           ObserverReward)
                            of
                            {_, Reward} ->
                                NewReward = lists:keydelete(RewardId,
                                                            1,
                                                            Reward),
                                lists:keystore(RoleId,
                                               1,
                                               ObserverReward,
                                               {RoleId, NewReward});
                            _ -> ObserverReward
                        end,
    {noreply,
     State#state{observers_reward = NewObserverReward}};
handle_info({challenge_watch_info, Wave, Hp, MaxHp},
            State) ->
    NewState = State#state{wave = Wave, hp = Hp,
                           max_hp = MaxHp},
    {noreply, NewState};
handle_info({challenge_watch_info, Status},
            State = #state{ref = Ref1,
                           push_observers_num_ref = Ref2}) ->
    NewState = case Status of
                   1 ->
                       SupportRef = erlang:send_after(60000,
                                                      self(),
                                                      push_add_support),
                       ObserversRef = erlang:send_after(10000,
                                                        self(),
                                                        push_update_observers_num),
                       State#state{watch_status = Status, ref = SupportRef,
                                   push_observers_num_ref = ObserversRef};
                   0 -> State#state{watch_status = Status};
                   _ ->
                       case Ref1 of
                           undefined -> ok;
                           OldRef1 when is_reference(OldRef1) ->
                               erlang:cancel_timer(OldRef1);
                           _ -> ok
                       end,
                       case Ref2 of
                           undefined -> ok;
                           OldRef2 when is_reference(OldRef2) ->
                               erlang:cancel_timer(OldRef2);
                           _ -> ok
                       end,
                       State#state{watch_status = Status, ref = undefined,
                                   push_observers_num_ref = undefined}
               end,
    role_group:pack_send(world, 17956, {Status}),
    {noreply, NewState};
handle_info({update_challenge_status, Status}, State) ->
    env:save(gods_challenge_status, Status),
    {noreply, State};
handle_info({set_push_observers_num, PushObserversNum},
            State = #state{observers = Ob, add_support = AddSupport,
                           support = Support, wave = Wave, hp = Hp,
                           max_hp = MaxHp}) ->
    AllSupport = get_now_support(AddSupport, Support),
    Data = handle_17964_data(AllSupport,
                             Wave,
                             PushObserversNum,
                             Hp,
                             MaxHp),
    push_17964(Ob, Data),
    {noreply,
     State#state{push_observers_num = PushObserversNum}};
handle_info(push_update_observers_num,
            State = #state{update_observers_num =
                               UpdateObserversNum}) ->
    big_world:cast(gods_challenge_mgr,
                   info,
                   [{add_observers_num, UpdateObserversNum}]),
    Ref = erlang:send_after(10000,
                            self(),
                            push_update_observers_num),
    {noreply,
     State#state{update_observers_num = 0,
                 push_observers_num_ref = Ref}};
handle_info(_Info, State) ->
    logger:debug("~w", [_Info], gods_challenge_agent, 317),
    {noreply, State}.

terminate(_Reason, _State) -> ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

get_now_support([], Support) -> Support;
get_now_support([{SupportType, SupportNum} | Rest],
                Support) ->
    NewSupport = case lists:keyfind(SupportType, 1, Support)
                     of
                     {_, SupportNum1} ->
                         lists:keystore(SupportType,
                                        1,
                                        Support,
                                        {SupportType,
                                         SupportNum + SupportNum1});
                     _ ->
                         lists:keystore(SupportType,
                                        1,
                                        Support,
                                        {SupportType, SupportNum})
                 end,
    get_now_support(Rest, NewSupport).

handle_observer_reward([], _Reward, _Now,
                       ObserversReward) ->
    ObserversReward;
handle_observer_reward([#c_observer{role_id = RoleId,
                                    pid = Pid}
                        | Rest],
                       RewardInfo = #{id := Id, reward_type := _RewardType,
                                      exp_mod := ExpMod, gift_id := GiftId,
                                      send_probability := SendProbability,
                                      get_probability := GetProbability},
                       Now, ObserversReward) ->
    RandNum = util:rand(1, 1000),
    NewObserversReward = case SendProbability >= RandNum of
                             true ->
                                 RoleReward = case lists:keyfind(RoleId,
                                                                 1,
                                                                 ObserversReward)
                                                  of
                                                  {_, _RoleReward} ->
                                                      _RoleReward;
                                                  _ -> []
                                              end,
                                 MaxId = case lists:keyfind(max_id,
                                                            1,
                                                            RoleReward)
                                             of
                                             {_, _MaxId} -> _MaxId;
                                             _ -> 1
                                         end,
                                 CoinReward = [{coin, ExpMod}],
                                 ExpReward = [{exp, ExpMod}],
                                 GiftReward = [{gift, GiftId, GetProbability}],
                                 {MaxId1, RoleReward1} =
                                     handle_observer_reward(MaxId,
                                                            CoinReward,
                                                            RoleReward),
                                 {MaxId2, RoleReward2} =
                                     handle_observer_reward(MaxId1,
                                                            ExpReward,
                                                            RoleReward1),
                                 {MaxId3, RoleReward3} =
                                     handle_observer_reward(MaxId2,
                                                            GiftReward,
                                                            RoleReward2),
                                 RoleReward4 = lists:keystore(max_id,
                                                              1,
                                                              RoleReward3,
                                                              {max_id, MaxId3}),
                                 ObserversReward1 = lists:keystore(RoleId,
                                                                   1,
                                                                   ObserversReward,
                                                                   {RoleId,
                                                                    RoleReward4}),
                                 Data1 = handle_send_data({MaxId,
                                                           Id,
                                                           1,
                                                           Now + 10},
                                                          CoinReward,
                                                          []),
                                 Data2 = handle_send_data({MaxId1,
                                                           Id,
                                                           2,
                                                           Now + 10},
                                                          ExpReward,
                                                          Data1),
                                 Data3 = handle_send_data({MaxId2,
                                                           Id,
                                                           3,
                                                           Now + 10},
                                                          GiftReward,
                                                          Data2),
                                 role:pack_send(Pid, 10778, {Data3}),
                                 erlang:send_after((10 + 2) * 1000,
                                                   self(),
                                                   {reward_timeout,
                                                    RoleId,
                                                    MaxId}),
                                 erlang:send_after((10 + 2) * 1000,
                                                   self(),
                                                   {reward_timeout,
                                                    RoleId,
                                                    MaxId1}),
                                 erlang:send_after((10 + 2) * 1000,
                                                   self(),
                                                   {reward_timeout,
                                                    RoleId,
                                                    MaxId2}),
                                 ObserversReward1;
                             _ -> ObserversReward
                         end,
    handle_observer_reward(Rest,
                           RewardInfo,
                           Now,
                           NewObserversReward).

handle_observer_reward(MaxId, Reward, RoleReward) ->
    NewObserversReward = lists:keystore(MaxId,
                                        1,
                                        RoleReward,
                                        {MaxId, Reward}),
    {MaxId + 1, NewObserversReward}.

handle_send_data(_NewData, [], Data) -> Data;
handle_send_data(NewData, _Reward, Data) ->
    [NewData | Data].

handle_17964_data(AllSupport, Wave, ObserverNum, Hp,
                  MaxHp) ->
    SupportNum = case lists:keyfind(0, 1, AllSupport) of
                     {_, SupportNum1} -> SupportNum1;
                     _ -> 0
                 end,
    UnSupportNum = case lists:keyfind(1, 1, AllSupport) of
                       {_, UnSupportNum1} -> UnSupportNum1;
                       _ -> 0
                   end,
    UnKnowNum = case lists:keyfind(2, 1, AllSupport) of
                    {_, UnKnowNum1} -> UnKnowNum1;
                    _ -> 0
                end,
    BossId = case gods_challenge_data:wave_list() of
                 [] -> 84001;
                 List when is_list(List) ->
                     case gods_challenge_data:get_wave_info(lists:max(List))
                         of
                         #{uint_id := UnitId} -> UnitId;
                         _ -> 84001
                     end;
                 _ -> 84001
             end,
    BossHpPercent = max(0,
                        round((4 - Wave) * 1000 / 3) -
                            round((MaxHp - Hp) * 1000 / (MaxHp * 3))),
    {SupportNum,
     UnSupportNum,
     UnKnowNum,
     ObserverNum,
     Wave,
     BossId,
     BossHpPercent}.

push_17964([], _Data) -> ok;
push_17964([#c_observer{pid = RolePid} | Rest], Data) ->
    role:apply(async,
               RolePid,
               {gods_challenge_role, apply_push_17964, [Data]}),
    push_17964(Rest, Data);
push_17964(RoleId = {_, _, _}, Data) ->
    role:apply(async,
               RoleId,
               {gods_challenge_role, apply_push_17964, [Data]}),
    ok.

push_10780([], _Data) -> ok;
push_10780([#c_observer{pid = RolePid} | Rest], Data) ->
    role:apply(async,
               RolePid,
               {gods_challenge_role, apply_push_10780, [Data]}),
    push_10780(Rest, Data).

repair(SeasonId) ->
    case ets:lookup(gods_duel_season_data,
                    gods_duel_season_data)
        of
        [SeasonData = #gods_duel_season_data{history_season_info
                                                 = HisInfo}] ->
            NewHisInfo = repair(SeasonId, HisInfo),
            NewSeasonData =
                SeasonData#gods_duel_season_data{history_season_info =
                                                     NewHisInfo},
            ets:insert(gods_duel_season_data, NewSeasonData),
            dets:insert(gods_duel_season_data, NewSeasonData);
        _ -> ok
    end.

repair(SeasonId, HisInfo) ->
    case lists:keyfind(SeasonId,
                       #gods_duel_season_info.id,
                       HisInfo)
        of
        #gods_duel_season_info{} ->
            NewHisInfo = lists:keydelete(SeasonId,
                                         #gods_duel_season_info.id,
                                         HisInfo),
            repair(SeasonId, NewHisInfo);
        _ -> HisInfo
    end.

