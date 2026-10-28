-file("src/mod/dungeon/dungeon.erl", 1).

-module(dungeon).

-export([role_enter/4,
         role_exit/2,
         role_exit_apply/2,
         init/0,
         exit_evt/2,
         exit_buff/1,
         to_login_evt/2,
         logout_evt/2,
         start_dungeon/2,
         async_enter_dungeon/4,
         async_enter_dungeon/2,
         async_exit_dungeon/4,
         async_exit_dungeon/2,
         exit_dungeon/1,
         exit_dungeon/4,
         to_battle/3,
         do_check_enter/4,
         login/1,
         floor_list/2,
         apply_floor_list/2,
         apply_evt/2,
         fix_event/1]).

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

-file("src/mod/dungeon/dungeon.erl", 36).

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

-file("src/mod/dungeon/dungeon.erl", 37).

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

-file("src/mod/dungeon/dungeon.erl", 38).

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

-file("src/mod/dungeon/dungeon.erl", 39).

-file("inc/condition.hrl", 1).

-record(condition,
        {label :: undefined | atom(),
         op = eq ::
             ue | eq | lt | gt | le | ge | range | include,
         val :: undefined | term(),
         msg = "" :: list()}).

-file("src/mod/dungeon/dungeon.erl", 40).

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

-file("src/mod/dungeon/dungeon.erl", 41).

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

-file("src/mod/dungeon/dungeon.erl", 42).

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

-file("src/mod/dungeon/dungeon.erl", 43).

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

-file("src/mod/dungeon/dungeon.erl", 44).

-file("inc/link.hrl", 1).

-record(link,
        {socket :: undefined | port(),
         conn_pid :: undefined | pid(),
         ip = {0, 0, 0, 0} :: {0..255, 0..255, 0..255, 0..255},
         port = 0 :: non_neg_integer(),
         lag = 0 :: non_neg_integer()}).

-file("src/mod/dungeon/dungeon.erl", 45).

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

-file("src/mod/dungeon/dungeon.erl", 46).

-file("inc/shipping.hrl", 1).

-record(m_shipping, {ver = 1, total_num = 0}).

-record(shipping,
        {rid = {1, "", 0},
         world_lev = 0,
         role_lev = 0,
         type = 1,
         status = 0,
         reset_time = 0,
         start_time = 0,
         help = 0,
         show_list = [],
         cells = []}).

-record(shipping_cell,
        {ver = 1,
         id = 0,
         type = 1,
         status = 1,
         help_type = 0,
         pack_type = 0,
         normal_rewards = [],
         rewards = [],
         item_base_id = 0,
         need_num = 0,
         help_friends = [],
         help_guild = {"", 0, ""},
         quest_id = 0}).

-record(shipping_cell_data,
        {id = 0,
         classify = 0,
         classes = 0,
         lev = 0,
         item_base_id = 0,
         need_num = 0,
         weight = 0,
         exp = 0,
         ratio = 0,
         quest_id = 0}).

-record(shipping_classify_data,
        {classify = 0,
         min_num = 0,
         max_num = 0,
         is_show = 0,
         weight = 0}).

-record(shipping_cell_quset_data,
        {id = 0,
         classify = 0,
         quest_id = 0,
         item_base_id = 0,
         ratio = 0,
         week_min = 0,
         week_max = 0}).

-record(quest_shipping_data,
        {id = 0,
         type = 0,
         ring = 0,
         max_ring = 0,
         next_id = 0,
         rewards = [],
         leader_exp_mode = 0,
         leader_ratio = 0,
         exp_mode = 0,
         ratio = 0}).

-record(quest_shipping_reward_data,
        {id = 0,
         min = 0,
         max = 0,
         ratio = 0,
         rewards = [],
         need_num = 0,
         exp_mode = 0,
         mate_rewards = [],
         mate_exp_mode = 0}).

-file("src/mod/dungeon/dungeon.erl", 47).

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

-file("src/mod/dungeon/dungeon.erl", 48).

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

-file("src/mod/dungeon/dungeon.erl", 49).

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

-file("src/mod/dungeon/dungeon.erl", 50).

-file("inc/help.hrl", 1).

-record(m_help,
        {ver = 1,
         next_id = 1,
         free_ids = [],
         send_msg = [],
         recv_msg = [],
         ext = []}).

-record(help_state,
        {next_record_id = 1, free_record_ids = []}).

-record(help_msg,
        {id = 0,
         help_rid,
         help_id = 0,
         record_id = 0,
         time = 0,
         digit_array = [],
         str_array = [],
         ext = []}).

-record(help_record, {record_id = 0, rid}).

-record(help_data,
        {id = 0 :: pos_integer(),
         title = "",
         fun_type = 0,
         type = 0,
         help_args :: undefined | term()}).

-file("src/mod/dungeon/dungeon.erl", 51).

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

-file("src/mod/dungeon/dungeon.erl", 52).

-spec init() -> #m_dungeon{}.

init() -> #m_dungeon{}.

login(Role) ->
    L = [#trigger{label = evt_levup, a = [], m = dungeon,
                  f = apply_evt}],
    {_, NRole} = role_trigger:add(L, Role),
    {ok, NRole}.

apply_evt(#evt_levup{}, Role = #role{lev = 80}) ->
    mail:send(Role,
              lang:get("夺宝奇兵邀请函"),
              lang:get("恭喜您升至80级！是时候接受真正的挑战了！\n学院注意到你的飞速成长，现邀请你加入<col"
                       "or='#ffff00'>夺宝奇兵</color>的行列，进入深海，探寻珍贵的精炼材料。\n"
                       "请注意：<color='#00ff00'>80</color>级之后，每周<color='"
                       "#00ff00'>二、四、六</color>可挑战<color='#ffff00'>夺宝奇"
                       "兵</color>，周<color='#00ff00'>一、三、五、日</color>可挑"
                       "战<color='#ffff00'>玲珑宝阁</color>。"),
              [{22306, 1}]),
    ok;
apply_evt(_, _Role) -> ok.

role_enter(Role, TeamList, DunId, BattleFlag) ->
    case dungeon_data:get(DunId) of
        DunBase = #dungeon_base{need_num = NeedNum} ->
            Len = length(TeamList) + 1,
            case Len >= NeedNum of
                true ->
                    case do_role_enter(Role, TeamList, DunBase, BattleFlag)
                        of
                        {false, Reason} -> {false, Reason};
                        {ok, NewRole} -> {true, NewRole}
                    end;
                false ->
                    {false,
                     util:flist(lang:get("队伍人数不足~w人, 无法进入副本"), [NeedNum])}
            end;
        _ -> {false, lang:get("不存在该副本")}
    end.

do_role_enter(Role = #role{id = RoleId, cross_type = 1},
              TeamList,
              DunBase = #dungeon_base{id = DunId,
                                      cross_cond_enter = CondEnter},
              BattleFlag) ->
    TeamList1 = lists:keydelete(RoleId,
                                #team_mate.id,
                                TeamList),
    Floor = var:get_list_var(Role, day_five, 131, DunId, 0),
    case role_enter_check(Role,
                          [Role | TeamList1],
                          CondEnter,
                          DunBase,
                          #{min_floor => Floor})
        of
        {false, Reason} -> {false, Reason};
        {true, MinFloor} ->
            start_dungeon(Role,
                          TeamList1,
                          DunBase,
                          BattleFlag,
                          MinFloor)
    end;
do_role_enter(Role = #role{id = RoleId}, TeamList,
              DunBase = #dungeon_base{id = DunId,
                                      cond_enter = CondEnter},
              BattleFlag) ->
    TeamList1 = lists:keydelete(RoleId,
                                #team_mate.id,
                                TeamList),
    Floor = var:get_list_var(Role, day_five, 131, DunId, 0),
    case role_enter_check(Role,
                          [Role | TeamList1],
                          CondEnter,
                          DunBase,
                          #{min_floor => Floor})
        of
        {false, Reason} -> {false, Reason};
        {true, MinFloor} ->
            start_dungeon(Role,
                          TeamList1,
                          DunBase,
                          BattleFlag,
                          MinFloor)
    end;
do_role_enter(_, _, _, _) ->
    {false, lang:get("不支持的副本进入类型")}.

role_exit_apply(Role, Msg) ->
    case dungeon_util:team_check(exit, Role) of
        false -> ok;
        {true, Status} ->
            role:send_buff_begin(),
            case dungeon:role_exit(Status, Role) of
                {false, _Reason} ->
                    role:send_buff_clean(),
                    ok;
                {ok, NewRole} ->
                    role:send_buff_flush(),
                    notice:send(Role, 3, Msg),
                    {ok, NewRole}
            end
    end.

role_exit(Flag,
          Role = #role{m_dungeon = #m_dungeon{dun_id = DunId},
                       s_event_pid = BattlePid})
    when Flag =:= member orelse Flag =:= null ->
    case check_role_exit(Role) of
        {false, Reason} -> {false, Reason};
        true ->
            case dungeon_data:get(DunId) of
                DunBase = #dungeon_base{type = Type}
                    when Type =:= 3 orelse
                             Type =:= 2 orelse Type =:= 5 orelse Type =:= 4 ->
                    case exit_dungeon(Role, [], BattlePid, DunBase) of
                        {ok, NewRole} -> {ok, NewRole};
                        {false, Reason} -> {false, Reason}
                    end;
                _ -> {false, lang:get("副本数据不存在")}
            end
    end;
role_exit(leader,
          Role = #role{m_dungeon = #m_dungeon{dun_id = DunId},
                       s_event_pid = BattlePid}) ->
    case team:get_members(Role) of
        TeamList when is_list(TeamList) ->
            case check_role_exit(Role) of
                {false, Reason} -> {false, Reason};
                true ->
                    case dungeon_data:get(DunId) of
                        DunBase = #dungeon_base{type = Type}
                            when Type =:= 3 orelse
                                     Type =:= 2 orelse
                                         Type =:= 5 orelse Type =:= 4 ->
                            case exit_dungeon(Role,
                                              TeamList,
                                              BattlePid,
                                              DunBase)
                                of
                                {ok, NewRole} -> {ok, NewRole};
                                {false, Reason} -> {false, Reason}
                            end;
                        _ -> {false, lang:get("副本数据不存在")}
                    end
            end;
        _ -> {false, lang:get("无法获取队伍信息")}
    end;
role_exit(_Flag, _Role) ->
    {false, lang:get("错误的参数, 无法退出")}.

start_dungeon(Role = #role{cross_type = CrossType},
              TeamList,
              DunBase = #dungeon_base{id = SubId, type = SubType},
              BattleFlag, MinFloor) ->
    case to_battle(DunBase, BattleFlag, MinFloor) of
        {true, Battle} ->
            case start(Battle, SubId, SubType, CrossType) of
                {false, Reason} -> {false, Reason};
                {ok, Platform, ZoneId, BattleId, BattlePid} ->
                    case enter_dungeon(Role,
                                       {Platform, ZoneId, BattleId, BattlePid},
                                       DunBase,
                                       TeamList)
                        of
                        {false, Reason} ->
                            battle:stop(BattlePid),
                            {false, Reason};
                        {ok, NewRole} -> {ok, NewRole}
                    end
            end;
        {false, Reason} -> {false, Reason}
    end.

start_dungeon(Role = #role{cross_type = OldCrossType},
              #dungeon_team{dun_id = SubId, members = TeamList,
                            member_num = Num}) ->
    case dungeon_data:get(SubId) of
        #dungeon_base{need_num = NeedNum} when NeedNum > Num ->
            {false,
             util:flist(lang:get("队伍人数不足~w人, 无法进入副本"), [NeedNum])};
        DunBase = #dungeon_base{type = SubType} ->
            case to_battle(DunBase, 1, 0) of
                {true, Battle} ->
                    CrossType = case [Mid
                                      || #dungeon_mate{id = Mid} <- TeamList,
                                         role_misc:is_local_role(Mid) =:= false]
                                    of
                                    [_ | _] -> 2;
                                    _ -> OldCrossType
                                end,
                    case start(Battle, SubId, SubType, CrossType) of
                        {false, Reason} -> {false, Reason};
                        {ok, Platform, ZoneId, BattleId, BattlePid} ->
                            case enter_dungeon(Role,
                                               {Platform,
                                                ZoneId,
                                                BattleId,
                                                BattlePid},
                                               DunBase,
                                               TeamList)
                                of
                                {false, Reason} ->
                                    battle:stop(BattlePid),
                                    {false, Reason};
                                {ok, NewRole} -> {ok, NewRole}
                            end
                    end;
                {false, Reason} -> {false, Reason}
            end;
        _ -> {false, lang:get("无法启动副本")}
    end.

to_login_evt(#role{pid = Pid,
                   link = #link{conn_pid = ConnPid},
                   id = {Rid, PlatForm, ZoneId}, name = Name,
                   pos = #pos{map = EnterMapId, x = X, y = Y}},
             {LastMapId, LastX, LastY}) ->
    Event = #evt_battle_role_login{id = Rid,
                                   platform = PlatForm, zone_id = ZoneId,
                                   name = Name,
                                   last_pos = {LastMapId, LastX, LastY},
                                   enter_pos = {EnterMapId, X, Y}, pid = Pid,
                                   conn_pid = ConnPid},
    Event.

logout_evt(BattlePid,
           #role{id = {Rid, PlatForm, ZoneId}, name = Name,
                 m_dungeon = #m_dungeon{dun_id = DunId}}) ->
    Event = #evt_battle_role_logout{id = Rid,
                                    platform = PlatForm, zone_id = ZoneId,
                                    name = Name, ext_id = DunId},
    battle_mgr:evt(BattlePid, Event).

enter_dungeon(Role = #role{s_event = Levent = 43,
                           m_dungeon = Mdun, pos = OldPos},
              {_Platform, _ZoneId = 9999, BattleId, BattlePid},
              DunBase = #dungeon_base{id = DunId}, TeamList) ->
    case big_world:call(battle_mgr,
                        find_info,
                        [map, BattleId])
        of
        {false, Reason} -> {false, Reason};
        {ok, {P, Z, MapId, X, Y}} ->
            #pos{platform = Lp, zone_id = Lz, map = LMapId, x = Lx,
                 y = Ly} =
                OldPos,
            NewMdun = Mdun#m_dungeon{dun_id = DunId,
                                     battle_id = BattleId, unit_rewards = []},
            Role1 = Role#role{s_event = 1, s_event_pid = BattlePid,
                              m_dungeon = NewMdun, cross_type = 2},
            case map:role_enter({P, Z, MapId, X, Y}, self, Role1) of
                {error, Reason} -> {false, Reason};
                {ok, Role2 = #role{pos = Pos}} ->
                    enter_evt(BattlePid, Role2, DunId, {MapId, X, Y}),
                    NewPos = case Levent of
                                 1 -> Pos;
                                 _ ->
                                     Pos#pos{last =
                                                 #pos_history{platform = Lp,
                                                              zone_id = Lz,
                                                              map = LMapId,
                                                              x = Lx, y = Ly}}
                             end,
                    Role3 = Role2#role{pos = NewPos, s_event = 1,
                                       s_event_pid = BattlePid},
                    NRole = #role{m_team = MTeam} = case
                                                        team:async_leave(Role3,
                                                                         "")
                                                        of
                                                        {ok, Role4} ->
                                                            case
                                                                team_mgr:create(Role4)
                                                                of
                                                                {ok, Role5} ->
                                                                    Role5;
                                                                Else ->
                                                                    logger:error("创建队伍失败 ~w",
                                                                                 [Else],
                                                                                 dungeon,
                                                                                 262),
                                                                    Role4
                                                            end;
                                                        _LeaveFalse -> Role3
                                                    end,
                    LossRole = loss_enter(NRole, DunBase),
                    HelpRole = case help:del_help_info_by_fun_type(LossRole,
                                                                   8)
                                   of
                                   {ok, TRole} -> TRole;
                                   _ -> LossRole
                               end,
                    NewRole = HelpRole,
                    dungeon_util:pop_finished(NewRole, DunId),
                    battle_dungeon:set_dungeon_master(NewRole),
                    TeamPid = case MTeam of
                                  #m_team{pid = Tpid} when is_pid(Tpid) -> Tpid;
                                  _ -> 0
                              end,
                    [role:apply(async,
                                MPid,
                                {dungeon,
                                 async_enter_dungeon,
                                 [#{battle_id => BattleId,
                                    battle_pid => BattlePid,
                                    pos => {P, Z, MapId, X, Y}, dun => DunBase,
                                    team_pid => TeamPid}]})
                     || #dungeon_mate{pid = MPid} <- TeamList, is_pid(MPid)],
                    team:enter_dungeon(LossRole, DunId),
                    {ok,
                     role_trigger:fire(#evt_dungeon_enter{id = DunId},
                                       NewRole)}
            end;
        {error, center_not_ready} ->
            {false, lang:get("还未与跨服时空连接，请稍后尝试")}
    end;
enter_dungeon(Role = #role{s_event = Levent = 43,
                           m_dungeon = Mdun, pos = OldPos, cross_type = 1},
              {Platform, ZoneId, BattleId, BattlePid},
              DunBase = #dungeon_base{id = DunId}, TeamList) ->
    case cross:call(Platform,
                    ZoneId,
                    battle_mgr,
                    find_info,
                    [map, BattleId])
        of
        {false, Reason} -> {false, Reason};
        {ok, {P, Z, MapId, X, Y}} ->
            #pos{platform = Lp, zone_id = Lz, map = LMapId, x = Lx,
                 y = Ly} =
                OldPos,
            NewMdun = Mdun#m_dungeon{dun_id = DunId,
                                     battle_id = BattleId, unit_rewards = []},
            Role1 = Role#role{s_event = 1, s_event_pid = BattlePid,
                              m_dungeon = NewMdun},
            case map:role_enter({P, Z, MapId, X, Y}, self, Role1) of
                {error, Reason} -> {false, Reason};
                {ok, NewRole = #role{pos = Pos, m_team = MTeam}} ->
                    enter_evt(BattlePid, NewRole, DunId, {MapId, X, Y}),
                    NewPos = case Levent of
                                 1 -> Pos;
                                 _ ->
                                     Pos#pos{last =
                                                 #pos_history{platform = Lp,
                                                              zone_id = Lz,
                                                              map = LMapId,
                                                              x = Lx, y = Ly}}
                             end,
                    NRole = NewRole#role{pos = NewPos, s_event = 1,
                                         s_event_pid = BattlePid},
                    LossRole = loss_enter(NRole, DunBase),
                    HelpRole = case help:del_help_info_by_fun_type(LossRole,
                                                                   8)
                                   of
                                   {ok, TRole} -> TRole;
                                   _ -> LossRole
                               end,
                    PassRole = HelpRole,
                    dungeon_util:pop_finished(PassRole, DunId),
                    battle_dungeon:set_dungeon_master(PassRole),
                    TeamPid = case MTeam of
                                  #m_team{pid = Tpid} when is_pid(Tpid) -> Tpid;
                                  _ -> 0
                              end,
                    [role:apply(async,
                                MPid,
                                {dungeon,
                                 async_enter_dungeon,
                                 [#{battle_id => BattleId,
                                    battle_pid => BattlePid,
                                    pos => {P, Z, MapId, X, Y}, dun => DunBase,
                                    team_pid => TeamPid}]})
                     || #dungeon_mate{pid = MPid} <- TeamList, is_pid(MPid)],
                    team:enter_dungeon(LossRole, DunId),
                    {ok,
                     role_trigger:fire(#evt_dungeon_enter{id = DunId},
                                       PassRole)}
            end;
        {error, center_not_ready} ->
            {false, lang:get("还未与跨服时空连接，请稍后尝试")}
    end;
enter_dungeon(Role = #role{s_event = Levent = 43,
                           m_dungeon = Mdun, pos = OldPos},
              {Platform, ZoneId, BattleId, BattlePid},
              DunBase = #dungeon_base{id = DunId}, TeamList) ->
    case big_world:call(Platform,
                        ZoneId,
                        battle_mgr,
                        find_info,
                        [map, BattleId])
        of
        {false, Reason} -> {false, Reason};
        {ok, {P, Z, MapId, X, Y}} ->
            #pos{platform = Lp, zone_id = Lz, map = LMapId, x = Lx,
                 y = Ly} =
                OldPos,
            NewMdun = Mdun#m_dungeon{dun_id = DunId,
                                     battle_id = BattleId, unit_rewards = []},
            Role1 = Role#role{s_event = 1, s_event_pid = BattlePid,
                              m_dungeon = NewMdun},
            case map:role_enter({P, Z, MapId, X, Y}, self, Role1) of
                {error, Reason} -> {false, Reason};
                {ok, NewRole = #role{pos = Pos, m_team = MTeam}} ->
                    enter_evt(BattlePid, NewRole, DunId, {MapId, X, Y}),
                    NewPos = case Levent of
                                 1 -> Pos;
                                 _ ->
                                     Pos#pos{last =
                                                 #pos_history{platform = Lp,
                                                              zone_id = Lz,
                                                              map = LMapId,
                                                              x = Lx, y = Ly}}
                             end,
                    NRole = NewRole#role{pos = NewPos, s_event = 1,
                                         s_event_pid = BattlePid},
                    LossRole = loss_enter(NRole, DunBase),
                    HelpRole = case help:del_help_info_by_fun_type(LossRole,
                                                                   8)
                                   of
                                   {ok, TRole} -> TRole;
                                   _ -> LossRole
                               end,
                    PassRole = HelpRole,
                    dungeon_util:pop_finished(PassRole, DunId),
                    battle_dungeon:set_dungeon_master(PassRole),
                    TeamPid = case MTeam of
                                  #m_team{pid = Tpid} when is_pid(Tpid) -> Tpid;
                                  _ -> 0
                              end,
                    [role:apply(async,
                                MPid,
                                {dungeon,
                                 async_enter_dungeon,
                                 [#{battle_id => BattleId,
                                    battle_pid => BattlePid,
                                    pos => {P, Z, MapId, X, Y}, dun => DunBase,
                                    team_pid => TeamPid}]})
                     || #dungeon_mate{pid = MPid} <- TeamList, is_pid(MPid)],
                    team:enter_dungeon(LossRole, DunId),
                    {ok,
                     role_trigger:fire(#evt_dungeon_enter{id = DunId},
                                       PassRole)}
            end;
        {error, center_not_ready} ->
            {false, lang:get("还未与跨服时空连接，请稍后尝试")}
    end;
enter_dungeon(Role = #role{s_event = Levent,
                           m_dungeon = Mdun, pos = OldPos},
              {Platform, ZoneId, BattleId, BattlePid},
              DunBase = #dungeon_base{id = DunId}, TeamList) ->
    case cross:call(Platform,
                    ZoneId,
                    battle_mgr,
                    find_info,
                    [map, BattleId])
        of
        {false, Reason} -> {false, Reason};
        {ok, {P, Z, MapId, X, Y}} ->
            #pos{platform = Lp, zone_id = Lz, map = LMapId, x = Lx,
                 y = Ly} =
                OldPos,
            NewMdun = Mdun#m_dungeon{dun_id = DunId,
                                     battle_id = BattleId, unit_rewards = []},
            Role1 = Role#role{s_event = 1, s_event_pid = BattlePid,
                              m_dungeon = NewMdun},
            TeamEvt = make_team_enter_evt(TeamList,
                                          {BattleId, BattlePid, DunBase}),
            case map:role_enter({P, Z, MapId, X, Y}, TeamEvt, Role1)
                of
                {error, Reason} -> {false, Reason};
                {ok, NewRole = #role{pos = Pos}} ->
                    enter_evt(BattlePid, NewRole, DunId, {MapId, X, Y}),
                    NewPos = case Levent of
                                 1 -> Pos;
                                 _ ->
                                     Pos#pos{last =
                                                 #pos_history{platform = Lp,
                                                              zone_id = Lz,
                                                              map = LMapId,
                                                              x = Lx, y = Ly}}
                             end,
                    NRole = NewRole#role{pos = NewPos, s_event = 1,
                                         s_event_pid = BattlePid},
                    LossRole = loss_enter(NRole, DunBase),
                    HelpRole = case help:del_help_info_by_fun_type(LossRole,
                                                                   8)
                                   of
                                   {ok, TRole} -> TRole;
                                   _ -> LossRole
                               end,
                    PassRole = HelpRole,
                    dungeon_util:pop_finished(PassRole, DunId),
                    battle_dungeon:set_dungeon_master(PassRole),
                    team:enter_dungeon(LossRole, DunId),
                    {ok,
                     role_trigger:fire(#evt_dungeon_enter{id = DunId},
                                       PassRole)}
            end;
        {error, center_not_ready} ->
            {false, lang:get("还未与跨服时空连接，请稍后尝试")}
    end.

async_enter_dungeon(_OldRole = #role{s_event = Levent,
                                     m_dungeon = Mdun, pos = OldPos},
                    Role = #role{pos = Pos}, _EnterPos,
                    #{battle_id := BattleId, battle_pid := BattlePid,
                      dun := DunBase}) ->
    #dungeon_base{id = DunId} = DunBase,
    #pos{platform = Lp, zone_id = Lz, map = LMapId, x = Lx,
         y = Ly} =
        OldPos,
    #pos{map = MapId, x = X, y = Y} = Pos,
    NewMdun = Mdun#m_dungeon{dun_id = DunId,
                             battle_id = BattleId, unit_rewards = []},
    Role1 = Role#role{s_event = 1, s_event_pid = BattlePid,
                      m_dungeon = NewMdun},
    enter_evt(BattlePid, Role1, DunId, {MapId, X, Y}),
    NewPos = case Levent of
                 1 -> Pos;
                 _ ->
                     Pos#pos{last =
                                 #pos_history{platform = Lp, zone_id = Lz,
                                              map = LMapId, x = Lx, y = Ly}}
             end,
    NewRole = Role1#role{pos = NewPos, s_event = 1,
                         s_event_pid = BattlePid},
    LossRole = loss_enter(NewRole, DunBase),
    HelpRole = case help:del_help_info_by_fun_type(LossRole,
                                                   8)
                   of
                   {ok, TRole} -> TRole;
                   _ -> LossRole
               end,
    PassRole = HelpRole,
    dungeon_util:pop_finished(PassRole, DunId),
    {ok,
     role_trigger:fire(#evt_dungeon_enter{id = DunId},
                       PassRole)};
async_enter_dungeon(_, _, _, _) ->
    {false, lang:get("队员进入副本参数错误")}.

async_enter_dungeon(Role = #role{s_event = 43,
                                 m_dungeon = Mdun, cross_type = OldCrossType,
                                 pos = OldPos},
                    #{battle_id := BattleId, battle_pid := BattlePid,
                      dun := DunBase, pos := Pos = {_P, Z, MapId, X, Y},
                      team_pid := TeamPid}) ->
    #dungeon_base{id = DunId} = DunBase,
    CrossType = case Z of
                    9999 -> 2;
                    _ when Z >= 9000 andalso Z < 9999 -> 1;
                    _ -> OldCrossType
                end,
    #pos{platform = Lp, zone_id = Lz, map = LMapId, x = Lx,
         y = Ly} =
        OldPos,
    NewMdun = Mdun#m_dungeon{dun_id = DunId,
                             battle_id = BattleId, unit_rewards = []},
    Role1 = Role#role{s_event = 1, s_event_pid = BattlePid,
                      m_dungeon = NewMdun, cross_type = CrossType},
    case map:role_enter(Pos, self, Role1) of
        {error, Reason} -> {false, Reason};
        {ok, Role2 = #role{pos = AfPos}} ->
            NewRole = case team:async_leave(Role2) of
                          {ok, Role3} -> Role3;
                          _Else -> Role2
                      end,
            enter_evt(BattlePid, NewRole, DunId, {MapId, X, Y}),
            NewPos = AfPos#pos{last =
                                   #pos_history{platform = Lp, zone_id = Lz,
                                                map = LMapId, x = Lx, y = Ly}},
            NRole = NewRole#role{s_event = 1,
                                 s_event_pid = BattlePid, pos = NewPos},
            LossRole = loss_enter(NRole, DunBase),
            battle_dungeon:set_dungeon_master(LossRole),
            {ok, Mate} = role_convert:to(team_mate, LossRole),
            NMate = Mate#team_mate{join_sub_type = 4},
            TeamRole = case team:join(TeamPid, NMate, LossRole) of
                           ok -> LossRole#role{m_team = #m_team{pid = TeamPid}};
                           {ok, NRole1} ->
                               NRole1#role{m_team = #m_team{pid = TeamPid}};
                           _ -> LossRole
                       end,
            team:follow(TeamRole),
            dungeon_team:push(TeamRole, {12139, {1, ""}}),
            HelpRole = case help:del_help_info_by_fun_type(TeamRole,
                                                           8)
                           of
                           {ok, TRole} -> TRole;
                           _ -> TeamRole
                       end,
            PassRole = HelpRole,
            dungeon_util:pop_finished(PassRole, DunId),
            role_misc:push_cross(PassRole),
            case CrossType of
                OldCrossType -> ok;
                1 ->
                    {ok, Ginfo} = role_convert:to(member, PassRole),
                    cross:cast(role_group, join, [center_world, Ginfo]),
                    team_recruit:reg(PassRole);
                _ when OldCrossType =:= 1 ->
                    cross:cast(role_group,
                               leave,
                               [center_world, Role#role.pid]),
                    team_recruit:cancel_reg(PassRole);
                _ -> ok
            end,
            {ok,
             role_trigger:fire(#evt_dungeon_enter{id = DunId},
                               PassRole)}
    end;
async_enter_dungeon(#role{name = _Name,
                          s_event = _Event},
                    _) ->
    logger:debug("~ts状态不对 ~w",
                 [_Name, _Event],
                 dungeon,
                 516),
    ok.

role_enter_check(_Role, [], _CondEnter, _DunBase,
                 #{min_floor := MinFloor}) ->
    {true, MinFloor};
role_enter_check(#role{cross_type = 1}, _, _,
                 #dungeon_base{type = 4}, _) ->
    {false, lang:get("跨服状态不能开启")};
role_enter_check(Role = #role{id = RoleId, lev = Lev},
                 [#role{id = RoleId} | T], CondEnter,
                 DunBase = #dungeon_base{type = 4, id = DunId}, Args) ->
    case shipping:dun_check(Role, {dun, DunId}) of
        true ->
            case do_check_enter(Role,
                                CondEnter,
                                DunBase,
                                Args#{leader_lev => Lev})
                of
                {ok, {false, Reason}} -> {false, Reason};
                {ok, {true, MinFloor}} ->
                    role_enter_check(Role,
                                     T,
                                     CondEnter,
                                     DunBase,
                                     Args#{min_floor := MinFloor})
            end;
        {false, Reason} -> {false, Reason}
    end;
role_enter_check(Role = #role{id = RoleId, lev = Lev},
                 [#role{id = RoleId} | T], CondEnter, DunBase, Args) ->
    case do_check_enter(Role,
                        CondEnter,
                        DunBase,
                        Args#{leader_lev => Lev})
        of
        {ok, {false, Reason}} -> {false, Reason};
        {ok, {true, MinFloor}} ->
            role_enter_check(Role,
                             T,
                             CondEnter,
                             DunBase,
                             Args#{min_floor := MinFloor})
    end;
role_enter_check(Role = #role{lev = Lev},
                 [#team_mate{pid = RolePid} | T], CondEnter, DunBase,
                 Args) ->
    case role:apply(sync,
                    RolePid,
                    {dungeon,
                     do_check_enter,
                     [CondEnter, DunBase, Args#{leader_lev => Lev}]})
        of
        {false, Reason} -> {false, Reason};
        {true, MinFloor} ->
            role_enter_check(Role,
                             T,
                             CondEnter,
                             DunBase,
                             Args#{min_floor := MinFloor});
        _Err ->
            logger:error("组队进入副本时发生异常:~w", [_Err], dungeon, 545),
            {false, lang:get("系统繁忙, 请稍后尝试")}
    end.

floor_list(Role = #role{id = RoleId}, DunId) ->
    case dungeon_util:team_check(floor, Role) of
        {true, MateList} ->
            Floor = var:get_list_var(Role, day_five, 131, DunId, 0),
            floor_list(Role,
                       DunId,
                       lists:keydelete(RoleId, #team_mate.id, MateList),
                       [Floor]);
        _ -> [0]
    end;
floor_list(_Role, _DunId) -> [0].

floor_list(_Role, _DunId, [], List) -> List;
floor_list(Role, DunId, [#team_mate{pid = RolePid} | T],
           List) ->
    case role:apply(sync,
                    RolePid,
                    {dungeon, apply_floor_list, [DunId]})
        of
        {true, Floor} ->
            floor_list(Role, DunId, T, [Floor | List]);
        _Err -> floor_list(Role, DunId, T, List)
    end.

apply_floor_list(Role, DunId) ->
    Floor = var:get_list_var(Role, day_five, 131, DunId, 0),
    {ok, {true, Floor}}.

do_check_enter(Role = #role{name = RoleName, lev = Lev,
                            cross_type = CrossType},
               CondEnter,
               DunBase = #dungeon_base{id = DunId,
                                       lev_interval = LevInterval},
               #{leader_lev := LeaderLev, min_floor := OldFloor}) ->
    case role_misc:check_event(Role, [43]) of
        {false, Reason} ->
            {ok,
             {false,
              util:flist(lang:get("~ts~ts"), [RoleName, Reason])}};
        true ->
            LevFlag = case LevInterval of
                          0 -> true;
                          _ when CrossType == 0 -> true;
                          _ ->
                              case abs(Lev - LeaderLev) =< LevInterval of
                                  true -> true;
                                  _ -> false
                              end
                      end,
            NewCondEnter = make_enter_cond(DunBase, CondEnter),
            case role_cond:check(NewCondEnter, Role) of
                {false, #condition{label = week_day, msg = Msg}} ->
                    {ok, {false, util:flist(lang:get("~ts"), [Msg])}};
                {false, #condition{msg = Msg}} ->
                    {ok,
                     {false,
                      util:flist(lang:get("~ts~ts"), [RoleName, Msg])}};
                true when LevFlag == true ->
                    Floor = var:get_list_var(Role, day_five, 131, DunId, 0),
                    MinFloor = min(Floor, OldFloor),
                    {ok, {true, MinFloor}};
                true ->
                    {ok,
                     {false,
                      util:flist(lang:get("~ts~ts"),
                                 [RoleName,
                                  notice:format(lang:get("与队长等级相差超过~ts级"),
                                                [{string_2,
                                                  5,
                                                  LevInterval}])])}}
            end
    end.

make_enter_cond(_, CondEnter) -> CondEnter.

check_role_exit(#role{s_event = Event, m_team = _MTeam,
                      cross_type = _CrossType, m_dungeon = _Mdun,
                      pos = Pos = #pos{map_base_id = 30001}})
    when Event =/= 1 ->
    logger:error("副本退不出~w, ~w, ~w, ~w, ~w",
                 [Event, _MTeam, _CrossType, _Mdun, Pos],
                 dungeon,
                 615),
    {false, lang:get("当前状态下不能退出副本")};
check_role_exit(#role{s_event = Event})
    when Event =/= 1 ->
    {false, lang:get("当前状态下不能退出副本")};
check_role_exit(#role{m_combat =
                          #m_combat{pid = CombatPid}})
    when is_pid(CombatPid) ->
    {false, lang:get("战斗中不能退出副本")};
check_role_exit(#role{s_event = _Event, m_team = _MTeam,
                      cross_type = _CrossType, pos = Pos, m_dungeon = _Mdun,
                      status = Status})
    when Status =/= 0 ->
    logger:error("副本退不出~w, ~w, ~w, ~w, ~w, ~w",
                 [_Event, _MTeam, _CrossType, _Mdun, Status, Pos],
                 dungeon,
                 622),
    {false, lang:get("当前状态下不能退出副本")};
check_role_exit(_) -> true.

start(BattleName, SubId, SubType, 1) ->
    case catch cross:call(battle,
                          create,
                          [BattleName, {SubId, SubType}])
        of
        {ok, Platform, ZoneId, BattleId, Pid} ->
            cross:cast(dungeon_mgr, start_dun, [BattleId, Pid]),
            {ok, Platform, ZoneId, BattleId, Pid};
        _Err ->
            logger:error("副本无法启动[~w]", [_Err], dungeon, 634),
            {false, lang:get("战场启动失败")}
    end;
start(BattleName, SubId, SubType, 2) ->
    case catch big_world:call(battle,
                              create,
                              [BattleName, {SubId, SubType}])
        of
        {ok, Platform, ZoneId, BattleId, Pid} ->
            big_world:cast(dungeon_mgr, start_dun, [BattleId, Pid]),
            {ok, Platform, ZoneId, BattleId, Pid};
        _Err ->
            logger:error("副本无法启动[~w]", [_Err], dungeon, 644),
            {false, lang:get("战场启动失败")}
    end;
start(BattleName, SubId, SubType, _CrossType) ->
    case catch battle:create(BattleName, {SubId, SubType})
        of
        {ok, Platform, ZoneId, BattleId, Pid} ->
            dungeon_mgr:start_dun(BattleId, Pid),
            {ok, Platform, ZoneId, BattleId, Pid};
        _Err ->
            logger:error("副本无法启动[~w]", [_Err], dungeon, 656),
            {false, lang:get("战场启动失败")}
    end.

loss_enter(Role, DunBase = #dungeon_base{}) ->
    NewCondLoss = make_loss_enter(Role, DunBase),
    case NewCondLoss of
        [] -> Role;
        _ ->
            case role_gain:do(NewCondLoss, Role) of
                {false, #loss{label = Label, val = Val}} ->
                    logger:error("进入副本扣除损益失败:~w,~w",
                                 [Label, Val],
                                 dungeon,
                                 670),
                    Role;
                {ok, NewRole} -> NewRole
            end
    end.

make_loss_enter(#role{cross_type = 1},
                #dungeon_base{cross_cond_loss = CondLoss}) ->
    CondLoss;
make_loss_enter(#role{},
                #dungeon_base{cond_loss = CondLoss}) ->
    CondLoss.

exit_dungeon(Role = #role{m_dungeon =
                              #m_dungeon{dun_id = DunId}}) ->
    case dungeon_data:get(DunId) of
        DunBase = #dungeon_base{} ->
            exit_dungeon(Role, [], undefined, DunBase);
        _ -> ok
    end.

exit_dungeon(Role = #role{id = RoleId = {_, P, Z},
                          m_dungeon = Mdun = #m_dungeon{dun_id = DunId},
                          cross_type = 2, pos = OldPos},
             TeamList, BattlePid,
             #dungeon_base{exit_pos = ExitPos}) ->
    {MapId, X, Y} = util:rand_list([{10001, 306, 3507},
                                    {10001, 2583, 3848},
                                    {10001, 4957, 3680},
                                    {10001, 445, 2565},
                                    {10001, 4646, 704},
                                    {10001, 841, 1033},
                                    {10001, 2098, 1834},
                                    {10001, 3617, 1816}]),
    HomePos = {P, Z, MapId, X, Y},
    EnterPos = case {ExitPos, OldPos} of
                   {last,
                    #pos{last =
                             #pos_history{platform = Lp, zone_id = Lz,
                                          map = LmapId, x = Lx, y = Ly}}} ->
                       {Lp, Lz, LmapId, Lx, Ly};
                   _ -> HomePos
               end,
    {NewEnterPos, CrossType} = case EnterPos of
                                   {LP, LZ, LMapId, Nx, Ny} ->
                                       case map_mgr:info(LP, LZ, LMapId) of
                                           {ok, #map{width = W, height = H}}
                                               when Nx > 0 andalso
                                                        Ny > 0 andalso
                                                            Nx < W andalso
                                                                Ny < H andalso
                                                                    LZ >= 9000
                                                                        andalso
                                                                        LZ <
                                                                            9999 ->
                                               {EnterPos, 1};
                                           _ -> {HomePos, 0}
                                       end;
                                   _ -> {HomePos, 0}
                               end,
    Role1 = Role#role{s_event = 0, s_event_pid = 0,
                      m_dungeon = dungeon_util:reset(Mdun),
                      cross_type = CrossType},
    case map:role_enter(NewEnterPos, self, Role1) of
        {error, Reason} -> {false, Reason};
        {ok, Role2} ->
            IsLeader = case team:get_status(Role2) of
                           {true, 1} -> true;
                           false ->
                               dungeon_team:leave_handover(RoleId),
                               false;
                           _ -> false
                       end,
            NewRole = #role{m_team = MTeam} = case
                                                  team:async_leave(Role2)
                                                  of
                                                  {ok, Role3} when IsLeader ->
                                                      case
                                                          team_mgr:create(Role3)
                                                          of
                                                          {ok, Role4} -> Role4;
                                                          Else ->
                                                              logger:error("创建队伍失败 ~w",
                                                                           [Else],
                                                                           dungeon,
                                                                           725),
                                                              Role3
                                                      end;
                                                  {ok, Role3} -> Role3;
                                                  _LeaveFalse -> Role2
                                              end,
            TeamPid = case MTeam of
                          #m_team{pid = Tpid} when is_pid(Tpid) -> Tpid;
                          _ -> 0
                      end,
            EventRole = dungeon_team:set_event(NewRole,
                                               TeamList,
                                               DunId),
            team:leader_async(Role,
                              {dungeon,
                               async_exit_dungeon,
                               [#{dun_id => DunId, battle_pid => BattlePid,
                                  pos => EnterPos, team_pid => TeamPid,
                                  leader => RoleId, cross_type => CrossType}]}),
            exit_evt(BattlePid, EventRole),
            exit_buff(EventRole),
            role_misc:push_cross(EventRole),
            case CrossType of
                1 ->
                    {ok, Ginfo} = role_convert:to(member, EventRole),
                    cross:cast(role_group, join, [center_world, Ginfo]),
                    team_recruit:reg(EventRole);
                _ -> ok
            end,
            team:enter_dungeon(Role, 0),
            {ok,
             role_trigger:fire(#evt_dungeon_exit{id = DunId},
                               EventRole)}
    end;
exit_dungeon(Role = #role{id = RoleId = {_, P, Z},
                          m_dungeon = Mdun = #m_dungeon{dun_id = DunId},
                          pos = OldPos, cross_type = OldCrossType},
             TeamList, BattlePid,
             #dungeon_base{exit_pos = ExitPos}) ->
    {MapId, X, Y} = util:rand_list([{10001, 306, 3507},
                                    {10001, 2583, 3848},
                                    {10001, 4957, 3680},
                                    {10001, 445, 2565},
                                    {10001, 4646, 704},
                                    {10001, 841, 1033},
                                    {10001, 2098, 1834},
                                    {10001, 3617, 1816}]),
    HomePos = {P, Z, MapId, X, Y},
    EnterPos = case {ExitPos, OldPos} of
                   {last,
                    #pos{platform = Lp, zone_id = Lz,
                         last = #pos_history{map = LmapId, x = Lx, y = Ly}}} ->
                       {Lp, Lz, LmapId, Lx, Ly};
                   _ -> HomePos
               end,
    {NewEnterPos, CrossType} = case EnterPos of
                                   {LP, LZ, LMapId, Nx, Ny} ->
                                       case map_mgr:info(LP, LZ, LMapId) of
                                           {ok, #map{width = W, height = H}}
                                               when Nx > 0 andalso
                                                        Ny > 0 andalso
                                                            Nx < W andalso
                                                                Ny < H andalso
                                                                    LZ >= 9000
                                                                        andalso
                                                                        LZ <
                                                                            9999 ->
                                               {EnterPos, 1};
                                           _ -> {HomePos, 0}
                                       end;
                                   _ -> {HomePos, 0}
                               end,
    Role1 = Role#role{s_event = 0, s_event_pid = 0,
                      m_dungeon = dungeon_util:reset(Mdun),
                      cross_type = CrossType},
    TeamEvt = make_team_exit_evt(TeamList,
                                 {BattlePid,
                                  ExitPos,
                                  DunId,
                                  RoleId,
                                  NewEnterPos}),
    case map:role_enter(NewEnterPos, TeamEvt, Role1) of
        {error, Reason} -> {false, Reason};
        {ok, Role2} ->
            case team:get_status(Role2) of
                {true, 1} -> true;
                false ->
                    dungeon_team:leave_handover(RoleId),
                    false;
                _ -> false
            end,
            NewRole = dungeon_team:set_event(Role2,
                                             TeamList,
                                             DunId),
            exit_evt(BattlePid, NewRole),
            exit_buff(NewRole),
            role_misc:push_cross(NewRole),
            case CrossType of
                OldCrossType -> ok;
                _ when OldCrossType =:= 1 ->
                    cross:cast(role_group,
                               leave,
                               [center_world, Role#role.pid]),
                    team_recruit:cancel_reg(NewRole);
                _ -> ok
            end,
            team:enter_dungeon(Role, 0),
            {ok,
             role_trigger:fire(#evt_dungeon_exit{id = DunId},
                               NewRole)}
    end.

async_exit_dungeon(_OldRole = #role{},
                   Role = #role{m_dungeon = Mdun,
                                cross_type = OldCrossType},
                   EnterPos,
                   #{battle_pid := BattlePid, dun_id := DunId,
                     leader := LeaderId, leader_pos := LeaderEnterPos}) ->
    CrossType = case LeaderEnterPos of
                    {_, Z, _, _, _} when Z >= 9000 andalso Z < 9999 -> 1;
                    _ -> 0
                end,
    Role1 = dungeon_team:set_event(Role#role{s_event = 0,
                                             s_event_pid = 0,
                                             m_dungeon =
                                                 dungeon_util:reset(Mdun),
                                             cross_type = CrossType}),
    case check_leader_pos(LeaderId,
                          LeaderEnterPos,
                          EnterPos)
        of
        normal -> skip;
        afk -> afk
    end,
    exit_evt(BattlePid, Role1),
    exit_buff(Role1),
    role_misc:push_cross(Role1),
    case CrossType of
        OldCrossType -> ok;
        _ when OldCrossType =:= 1 ->
            cross:cast(role_group,
                       leave,
                       [center_world, Role#role.pid]),
            team_recruit:cancel_reg(Role1);
        _ -> ok
    end,
    {ok,
     role_trigger:fire(#evt_dungeon_exit{id = DunId},
                       Role1)}.

async_exit_dungeon(Role = #role{id = {_, P, Z},
                                m_dungeon = Mdun, cross_type = 2, pos = OldPos},
                   #{battle_pid := BattlePid, dun_id := DunId,
                     leader := LeaderId, pos := EnterPos,
                     team_pid := TeamPid, cross_type := CrossType}) ->
    NRole = case team:async_leave(Role, "") of
                {ok, Role1} -> Role1;
                _Reason ->
                    logger:debug("离开队伍失败 ~w", [_Reason], dungeon, 831),
                    Role
            end,
    case role_misc:is_local_role(LeaderId) of
        true ->
            case map:role_enter(EnterPos, self, NRole) of
                {error, Reason} -> {false, Reason};
                {ok, NRole1} ->
                    NRole2 = dungeon_team:set_event(NRole1#role{s_event = 0,
                                                                s_event_pid = 0,
                                                                m_dungeon =
                                                                    dungeon_util:reset(Mdun),
                                                                cross_type =
                                                                    CrossType}),
                    {ok, Mate} = role_convert:to(team_mate, NRole2),
                    TeamRole = case team:join(TeamPid, Mate, NRole2) of
                                   ok ->
                                       NRole2#role{m_team =
                                                       #m_team{pid = TeamPid}};
                                   {ok, NRole3} ->
                                       NRole3#role{m_team =
                                                       #m_team{pid = TeamPid}};
                                   _ -> NRole2
                               end,
                    team:follow(TeamRole),
                    exit_evt(BattlePid, TeamRole),
                    exit_buff(TeamRole),
                    role_misc:push_cross(TeamRole),
                    case CrossType of
                        1 ->
                            {ok, Ginfo} = role_convert:to(member, TeamRole),
                            cross:cast(role_group, join, [center_world, Ginfo]),
                            team_recruit:reg(TeamRole);
                        _ -> ok
                    end,
                    {ok,
                     role_trigger:fire(#evt_dungeon_exit{id = DunId},
                                       TeamRole)}
            end;
        _ ->
            case CrossType =:= 1 andalso
                     role_misc:is_cross_role(LeaderId)
                of
                true ->
                    case map:role_enter(EnterPos, self, NRole) of
                        {error, Reason} -> {false, Reason};
                        {ok, NRole1} ->
                            NRole2 = dungeon_team:set_event(NRole1#role{s_event
                                                                            = 0,
                                                                        s_event_pid
                                                                            = 0,
                                                                        m_dungeon
                                                                            =
                                                                            dungeon_util:reset(Mdun),
                                                                        cross_type
                                                                            =
                                                                            CrossType}),
                            {ok, Mate} = role_convert:to(team_mate, NRole2),
                            TeamRole = case team:join(TeamPid, Mate, NRole2) of
                                           ok ->
                                               NRole2#role{m_team =
                                                               #m_team{pid =
                                                                           TeamPid}};
                                           {ok, NRole3} ->
                                               NRole3#role{m_team =
                                                               #m_team{pid =
                                                                           TeamPid}};
                                           _ -> NRole2
                                       end,
                            team:follow(TeamRole),
                            exit_evt(BattlePid, TeamRole),
                            exit_buff(TeamRole),
                            role_misc:push_cross(TeamRole),
                            case CrossType of
                                1 ->
                                    {ok, Ginfo} = role_convert:to(member,
                                                                  TeamRole),
                                    cross:cast(role_group,
                                               join,
                                               [center_world, Ginfo]),
                                    team_recruit:reg(TeamRole);
                                _ -> ok
                            end,
                            {ok,
                             role_trigger:fire(#evt_dungeon_exit{id = DunId},
                                               TeamRole)}
                    end;
                _ ->
                    {MapId, X, Y} = util:rand_list([{10001, 306, 3507},
                                                    {10001, 2583, 3848},
                                                    {10001, 4957, 3680},
                                                    {10001, 445, 2565},
                                                    {10001, 4646, 704},
                                                    {10001, 841, 1033},
                                                    {10001, 2098, 1834},
                                                    {10001, 3617, 1816}]),
                    LocalPos = {P, Z, MapId, X, Y},
                    case map:role_enter(LocalPos, self, NRole) of
                        {error, Reason} -> {false, Reason};
                        {ok, NRole1} ->
                            TeamRole =
                                dungeon_team:set_event(NRole1#role{s_event = 0,
                                                                   s_event_pid =
                                                                       0,
                                                                   m_dungeon =
                                                                       dungeon_util:reset(Mdun),
                                                                   cross_type =
                                                                       0}),
                            exit_evt(BattlePid, TeamRole),
                            exit_buff(TeamRole),
                            role_misc:push_cross(TeamRole),
                            case OldPos of
                                #pos{last = #pos_history{zone_id = Lz}}
                                    when Lz >= 9000 andalso Lz < 9999 ->
                                    cross:cast(role_group,
                                               leave,
                                               [center_world, Role#role.pid]),
                                    team_recruit:cancel_reg(TeamRole);
                                _ -> ok
                            end,
                            {ok,
                             role_trigger:fire(#evt_dungeon_exit{id = DunId},
                                               TeamRole)}
                    end
            end
    end;
async_exit_dungeon(_, _Args) ->
    logger:debug("无效回调 ~w", [_Args], dungeon, 920),
    ok.

check_leader_pos(_LeaderId, {MapId, _, _},
                 {MapId, _, _}) ->
    normal;
check_leader_pos(_LeaderId, {_, _, _}, {_, _, _}) ->
    afk;
check_leader_pos(_LeaderId, {P, Z, MapId, _, _},
                 {P, Z, MapId, _, _}) ->
    normal;
check_leader_pos(_LeaderId, {_, _, _, _, _},
                 {_, _, _, _, _}) ->
    afk;
check_leader_pos(_, _, _) -> afk.

to_battle(#dungeon_base{battle_name_list =
                            BattleNameList},
          BattleFlag, 0) ->
    case length(BattleNameList) >= BattleFlag of
        true -> {true, lists:nth(BattleFlag, BattleNameList)};
        false -> {false, lang:get("战场序号选择错误, 无法进入")}
    end;
to_battle(#dungeon_base{type = 5,
                        battle_name_list = BattleNameList},
          BattleFlag = 1, _MinFloor) ->
    case length(BattleNameList) >= BattleFlag of
        true -> {true, lists:nth(BattleFlag, BattleNameList)};
        false -> {false, lang:get("战场序号选择错误, 无法进入")}
    end;
to_battle(#dungeon_base{type = 5,
                        battle_name_list = BattleNameList},
          _, MinFloor) ->
    Floor = max(1, MinFloor + 1),
    case length(BattleNameList) >= Floor of
        true -> {true, lists:nth(Floor, BattleNameList)};
        false -> {false, lang:get("战场序号选择错误, 无法进入")}
    end;
to_battle(#dungeon_base{battle_name_list =
                            BattleNameList},
          BattleFlag, _MinFloor) ->
    case length(BattleNameList) >= BattleFlag of
        true -> {true, lists:nth(BattleFlag, BattleNameList)};
        false -> {false, lang:get("战场序号选择错误, 无法进入")}
    end.

enter_evt(BattlePid,
          Role = #role{pid = Pid,
                       link = #link{conn_pid = ConnPid},
                       id = {Rid, PlatForm, ZoneId}, name = Name,
                       pos = #pos{map = OldMapId, x = X, y = Y}},
          DunId, {DestMapId, DestX, DestY}) ->
    {ok, DunR} = role_convert:to(battle_role, Role),
    Event = #evt_battle_role_enter{id = Rid,
                                   platform = PlatForm, zone_id = ZoneId,
                                   name = Name, last_pos = {OldMapId, X, Y},
                                   enter_pos = {DestMapId, DestX, DestY},
                                   dun_id = DunId, pid = Pid,
                                   conn_pid = ConnPid, dun_role = DunR},
    battle_mgr:evt(BattlePid, Event).

exit_evt(BattlePid,
         #role{id = {Rid, PlatForm, ZoneId}, name = Name})
    when is_pid(BattlePid) ->
    Event = #evt_battle_role_exit{id = Rid,
                                  platform = PlatForm, zone_id = ZoneId,
                                  name = Name},
    battle_mgr:evt(BattlePid, Event);
exit_evt(_, _) -> ok.

exit_buff(#role{pid = RolePid,
                m_buff = #m_buff{r_list = BuffList}}) ->
    DunBuffList = get_dun_buff(BuffList, []),
    role:apply(async, RolePid, {buff, del, [DunBuffList]}),
    ok.

make_team_enter_evt([], _) -> self;
make_team_enter_evt(TeamList,
                    {BattleId, BattlePid, DunBase}) ->
    RoleIds = [Id
               || #team_mate{id = Id, status = 2} <- TeamList],
    #{label => enter_dun, role_ids => RoleIds,
      mfa =>
          {dungeon,
           async_enter_dungeon,
           [#{battle_id => BattleId, battle_pid => BattlePid,
              dun => DunBase}]}}.

make_team_exit_evt([], _) -> self;
make_team_exit_evt(TeamList,
                   {BattlePid,
                    ExitPos,
                    DunId,
                    LeaderId,
                    LeaderEnterPos}) ->
    RoleIds = [Id
               || #team_mate{id = Id, status = 2} <- TeamList],
    Args = [#{battle_pid => BattlePid, dun_id => DunId,
              leader => LeaderId, leader_pos => LeaderEnterPos}],
    #{label => exit_dun, role_ids => RoleIds,
      mfa => {dungeon, async_exit_dungeon, Args},
      ext => [ExitPos]}.

get_dun_buff([], List) -> List;
get_dun_buff([#buff{id = Id} | T], List) ->
    case buff_data:get(Id) of
        #buff_base{sub_type = 2} ->
            get_dun_buff(T, [Id | List]);
        _ -> get_dun_buff(T, List)
    end.

fix_event(Role = #role{s_event = 0,
                       pos = #pos{map_base_id = MapBaseId}, id = {_, P, Z}}) ->
    L = [20004, 20005, 20006, 20007, 20008, 20009],
    case lists:member(MapBaseId, L) of
        true ->
            {MapId, X, Y} = util:rand_list([{10001, 306, 3507},
                                            {10001, 2583, 3848},
                                            {10001, 4957, 3680},
                                            {10001, 445, 2565},
                                            {10001, 4646, 704},
                                            {10001, 841, 1033},
                                            {10001, 2098, 1834},
                                            {10001, 3617, 1816}]),
            EnterPos = {P, Z, MapId, X, Y},
            case map:role_enter(EnterPos, self, Role) of
                {ok, NRole} -> {ok, NRole};
                _ -> ok
            end;
        _ -> ok
    end;
fix_event(_) -> ok.

