-file("src/mod/gods_duel/gods_duel_role.erl", 1).

-module(gods_duel_role).

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

-file("src/mod/gods_duel/gods_duel_role.erl", 10).

-file("inc/link.hrl", 1).

-record(link,
        {socket :: undefined | port(),
         conn_pid :: undefined | pid(),
         ip = {0, 0, 0, 0} :: {0..255, 0..255, 0..255, 0..255},
         port = 0 :: non_neg_integer(),
         lag = 0 :: non_neg_integer()}).

-file("src/mod/gods_duel/gods_duel_role.erl", 11).

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

-file("src/mod/gods_duel/gods_duel_role.erl", 12).

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

-file("src/mod/gods_duel/gods_duel_role.erl", 13).

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

-file("src/mod/gods_duel/gods_duel_role.erl", 14).

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

-file("src/mod/gods_duel/gods_duel_role.erl", 15).

-file("inc/guild.hrl", 1).

-type guild_id() :: {non_neg_integer(),
                     list(),
                     non_neg_integer()}.

-record(guild_apply,
        {id = {0, "", 0},
         name = "",
         classes = 0,
         sex = 0,
         lev = 1,
         time = 0,
         type = 0,
         looks = [],
         cup = 0 :: non_neg_integer(),
         donation = 0 :: non_neg_integer(),
         tag = 0 :: non_neg_integer(),
         msg = "" :: string()}).

-record(guild_envelop,
        {ver = 1,
         title = "" :: string(),
         amount = 0 :: non_neg_integer(),
         remain = 0 :: non_neg_integer(),
         total = 0 :: non_neg_integer(),
         num = 0 :: non_neg_integer(),
         time = 0 :: non_neg_integer(),
         packs = [],
         log = [] :: list()}).

-record(guild_role,
        {id = {1, "", 0} ::
             {pos_integer(), list(), non_neg_integer()},
         pid :: undefined | pid(),
         name = "" :: list(),
         sex = 0 :: 0 | 1,
         classes = 0 :: 0..4,
         lev = 1 :: pos_integer(),
         lev_break_times = 0 :: non_neg_integer(),
         fc = 1 :: pos_integer(),
         synth_fc = 1 :: pos_integer(),
         post = 0 :: 0..5,
         status = 0 :: 0 | 1,
         last_login = 1 :: pos_integer(),
         last_logout = 1 :: pos_integer(),
         enter_time = 0 :: non_neg_integer(),
         signature = "" :: list(),
         value = 0,
         total_value = 0 :: non_neg_integer(),
         cup = 0 :: non_neg_integer(),
         looks = [],
         envelope = #guild_envelop{},
         requirement = [],
         signed = 0 :: non_neg_integer(),
         last_signed = 0 :: non_neg_integer(),
         mails = [],
         active = 0,
         ability = 0,
         chat_num = 0,
         doing = 0,
         chat_num_list = [],
         doing_list = [],
         element_attr = [] :: list(),
         tmp_element_attr = [] :: list()}).

-record(guild_leaver,
        {id = {1, "", 0} ::
             {pos_integer(), list(), non_neg_integer()},
         name = "" :: list(),
         guild_id = {1, "", 0} ::
             {pos_integer(), list(), non_neg_integer()},
         value = 0,
         total_value = 0 :: non_neg_integer(),
         time = 0 :: integer()}).

-record(guild_boss,
        {lev = 1 :: non_neg_integer(),
         step = 1 :: non_neg_integer(),
         unit_id = 0 :: non_neg_integer(),
         name = "",
         hp = 0 :: non_neg_integer(),
         hp_max = 0 :: non_neg_integer(),
         exp = 0 :: non_neg_integer(),
         called = 0 :: integer(),
         log = [] :: list(),
         last_renamed = 0 :: non_neg_integer()}).

-record(guild_mercenary,
        {id = {0, "", 0},
         key :: undefined | tuple(),
         lev = 0 :: non_neg_integer(),
         name = "" :: string(),
         dispatched = 0 :: non_neg_integer(),
         recruited = 0 :: non_neg_integer(),
         score = 0 :: non_neg_integer(),
         gain = [],
         guard :: undefined | tuple()}).

-record(guild_totem,
        {ver = 0 :: non_neg_integer(),
         id = util:rand_list([101, 102, 103, 104, 105]) ::
             non_neg_integer(),
         changeable = 1 :: non_neg_integer(),
         last_changed = 0 :: non_neg_integer()}).

-record(guild_question_answer,
        {ver = 0,
         id = {0, "", 0},
         name = "" :: string(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         guild_name = "" :: string(),
         option = 0 :: 0..4,
         result = 0 :: 0 | 1,
         score = 0 :: non_neg_integer(),
         answered = 0 :: non_neg_integer(),
         totem_id = 0 :: non_neg_integer(),
         rank = 0 :: non_neg_integer()}).

-record(guild_question,
        {ver = 0,
         id = 0 :: non_neg_integer(),
         answer = 0 :: 0..4,
         asked = 0 :: non_neg_integer(),
         answers = [] :: [#guild_question_answer{}],
         cheat_off = [],
         asked_num = 0 :: non_neg_integer(),
         cheat_nums = []}).

-record(guild_robber,
        {ver = 0 :: non_neg_integer(),
         id :: undefined | tuple(),
         today_generated = 0 :: non_neg_integer(),
         gen_hour = 0 :: non_neg_integer(),
         gen_time = 0 :: non_neg_integer(),
         total_killed = 0 :: non_neg_integer(),
         last_killed = 0 :: non_neg_integer(),
         killed_time = 0 :: non_neg_integer(),
         fighters = [],
         picker = []}).

-record(guild_treasure,
        {ver = 1 :: non_neg_integer(),
         added = 0 :: non_neg_integer(),
         setting_chance = 0 :: non_neg_integer(),
         setting_time = 0 :: non_neg_integer(),
         gen_time = 0 :: non_neg_integer(),
         generated = 0 :: non_neg_integer(),
         unit_num = 0 :: non_neg_integer(),
         total_killed = 0 :: non_neg_integer(),
         last_killed = 0 :: non_neg_integer(),
         killed_time = 0 :: non_neg_integer(),
         can_open = 0 :: 0,
         fighters = [],
         picker = [],
         type = win}).

-record(guild_loot,
        {ver = 0, items = [], log = [], allocated = []}).

-record(guild_usurper,
        {ver = 0,
         id :: undefined | tuple(),
         name = "" :: string(),
         classes = 0,
         sex = 0,
         ctime = 0 :: integer()}).

-record(guild_invitation,
        {ver = 0,
         id :: undefined | tuple(),
         name = "" :: string(),
         classes = 0,
         sex = 0,
         lev = 0,
         ctime = 0 :: integer(),
         guild_id :: undefined | tuple(),
         guild_name = "" :: string()}).

-record(guild_plant_irrigator,
        {id = {0, "", 0} :: tuple(),
         name = "" :: string(),
         classes = 0,
         sex = 0,
         ctime = 0 :: integer()}).

-record(guild_plant,
        {ver = 0,
         pos = {0, 0},
         owner_rid = {0, "", 0},
         owner_name = "",
         irrigations = [],
         phase = 0,
         sowed = 0,
         matured = 0,
         fired = 0 :: 0 | 1,
         unit_id = {0, 0},
         unit_base_id = 0}).

-record(guild_union_apply,
        {ver = 0,
         id = {0, "", 0},
         name = "" :: string(),
         leader_id = {0, "", 0},
         leader_name = "" :: string(),
         ctime = 0 :: integer()}).

-record(guild_campaign,
        {acc = [] :: list(),
         can_reward = [] :: list(),
         rewarded = [] :: list()}).

-record(guild_camp_web,
        {acc = [] :: list(),
         can_reward = [] :: list(),
         rewarded = [] :: list(),
         overdue_time = 0 :: non_neg_integer(),
         end_reward = [] :: list(),
         time_list = [] :: list()}).

-record(element_info,
        {ver = 1, build_type = 0, lev = 1, time = 0}).

-record(guild,
        {id = {0, "", 0} ::
             {non_neg_integer(), list(), non_neg_integer()},
         ver = 21 :: non_neg_integer(),
         name = "" :: list(),
         assets = 5000000,
         max_assets = 5000000,
         upkeep = 0,
         pid :: undefined | pid(),
         leader_name = "" :: list(),
         leader_id = {0, "", 0} ::
             {non_neg_integer(), list(), non_neg_integer()},
         leader_sex = 0 :: 0 | 1,
         leader_classes = 0 :: 0..6,
         leader_lev = 0 :: non_neg_integer(),
         members = [] :: [#guild_role{}],
         mem_num = 0 :: non_neg_integer(),
         fresh_num = 0 :: non_neg_integer(),
         max_mem_num = 90,
         max_fresh_num = 100,
         board = "" :: list(),
         health = 100,
         join_type = 2,
         join_condition = [],
         apply_list = [],
         event_list = [],
         lev = 1 :: pos_integer(),
         lev_time = 0 :: non_neg_integer(),
         academy_lev = 0 :: non_neg_integer(),
         academy_time = 0 :: non_neg_integer(),
         store_lev = 0 :: non_neg_integer(),
         store_time = 0 :: non_neg_integer(),
         exchequer_lev = 0 :: non_neg_integer(),
         exchequer_time = 0 :: non_neg_integer(),
         lev_ref :: undefined | reference(),
         welfare_time = 0,
         welfare_list = [],
         store_tick_time = 0,
         store_list = [],
         create_time = 0,
         flag = 0,
         map_pid = 0,
         map_id = 0,
         boss = #guild_boss{},
         mercenarys = [] :: [#guild_mercenary{}],
         totem = #guild_totem{} :: #guild_totem{},
         question = #guild_question{},
         robber_num = 0 :: non_neg_integer(),
         robber_total_num = 0 :: non_neg_integer(),
         usurpers = [],
         activity = 0,
         plants = [],
         announcement = "" :: string(),
         union_applys = [] :: list(),
         union_applied = [] :: list(),
         today_used_medal = 0 :: integer(),
         last_medal_used = 0 :: integer(),
         today_upgraded_build = 0 :: integer(),
         last_build_upgraded = 0 :: integer(),
         today_destory_build = 0 :: integer(),
         last_build_destory = 0 :: integer(),
         treasure = #guild_treasure{},
         loot = #guild_loot{},
         week_assets = 0 :: integer(),
         formalizing_lev = 35 :: integer(),
         name_used = "" :: string(),
         create_id = {0, "", 0},
         create_name = "",
         guild_camp = #guild_campaign{},
         guild_camp_web = #guild_camp_web{},
         max_chat_num = 0,
         max_doing = 0,
         max_fc = 0,
         max_synth_fc = 0,
         element_info = [],
         uplev_element_times = 0,
         last_uplev_element = 0,
         upgrade_element_time = 0,
         mail_list = [],
         limit_mode = 0,
         is_lock_board = 0,
         board_id = {0, "", 0},
         announce_id = {0, "", 0}}).

-record(guild_element_attr,
        {ver = 1,
         effect_obj = 1,
         attr = [],
         attr_snd = [],
         add_skill_list = [],
         high_attr = [],
         end_time = 0}).

-record(m_guild,
        {ver = 3 :: pos_integer(),
         id = {0, "", 0} ::
             {non_neg_integer(), list(), non_neg_integer()},
         name = "" :: list(),
         pid :: undefined | pid(),
         enter_time = 0,
         guild_lev = 1,
         post = 0 :: non_neg_integer(),
         value = 0,
         total_value = 0 :: non_neg_integer(),
         signature = "" :: list(),
         element_attr = [] :: list(),
         tmp_element_attr = [] :: list(),
         build_speed_num = 0 :: non_neg_integer()}).

-record(guild_emblem,
        {ver = 0, id = 0, type = 0, lev = 0}).

-record(m_guild_emblem,
        {ver = 0 :: non_neg_integer(),
         remain_point = 0 :: non_neg_integer(),
         total_point = 0 :: non_neg_integer(),
         emblems = []}).

-file("src/mod/gods_duel/gods_duel_role.erl", 16).

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

-file("src/mod/gods_duel/gods_duel_role.erl", 17).

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

-file("src/mod/gods_duel/gods_duel_role.erl", 18).

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

-file("src/mod/gods_duel/gods_duel_role.erl", 19).

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

-file("src/mod/gods_duel/gods_duel_role.erl", 20).

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

-file("src/mod/gods_duel/gods_duel_role.erl", 21).

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

-file("src/mod/gods_duel/gods_duel_role.erl", 22).

-file("inc/agenda.hrl", 1).

-record(m_agenda,
        {ver = 1 :: non_neg_integer(),
         progress = [],
         activity = 0 :: non_neg_integer(),
         last_joined = 0 :: non_neg_integer(),
         rewarded = [] :: [non_neg_integer()],
         last_rewarded = 0 :: non_neg_integer(),
         recommends = [] :: list(),
         last_recommended = 0 :: non_neg_integer()}).

-record(agenda_prog,
        {ver = 1,
         id = 0 :: non_neg_integer(),
         joined = 0 :: non_neg_integer(),
         last_joined = 0 :: non_neg_integer()}).

-record(agenda_stat,
        {id = 0 :: non_neg_integer(), joined = 0, finised = 0}).

-record(agenda_stat_role,
        {id = {0, "", 0},
         lev = 0,
         date = {0, 0, 0},
         logs = []}).

-record(m_agenda_week,
        {ver = 1,
         id = 0,
         week_activity = 0 :: non_neg_integer(),
         rewards = [],
         last_add_activity_time = 0}).

-file("src/mod/gods_duel/gods_duel_role.erl", 23).

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

-file("src/mod/gods_duel/gods_duel_role.erl", 24).

-file("inc/chat.hrl", 1).

-record(chat_msg,
        {rid = {0, "", 0} :: non_neg_integer(),
         platform = "" :: binary(),
         zone_id = 0 :: non_neg_integer(),
         channel = 0 :: non_neg_integer(),
         name = "" :: binary(),
         sex = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         msg = "" :: binary(),
         guild_name = "",
         special = [] :: [tuple()]}).

-record(chat_voice,
        {role_id,
         voice = <<>>,
         text = "",
         time = 0,
         channel,
         group_id}).

-record(chat_offline, {id = {0, "", 0}, msgs = []}).

-file("src/mod/gods_duel/gods_duel_role.erl", 25).

-file("inc/lev_break.hrl", 1).

-record(m_lev_break,
        {ver = 0,
         trial = 0 :: non_neg_integer(),
         done = 0 :: non_neg_integer(),
         times = 0 :: non_neg_integer(),
         attr_point = 0 :: non_neg_integer()}).

-file("src/mod/gods_duel/gods_duel_role.erl", 26).

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

-file("src/mod/gods_duel/gods_duel_role.erl", 27).

-export([init/0,
         login/1,
         get_fighters/1,
         apply_evt/2,
         apply_team_mate_enter/3,
         apply_team_mate_leave/3,
         apply_team_mate_leave/1,
         apply_push_17966/1,
         push_17966/2,
         rpc_push_17966/1,
         apply_get_fighters/1,
         get_chat_icon/1,
         remove_chat_icon/1,
         levup/2,
         callback/2,
         gm_add_assets_godswar/2]).

-export([rpc_create_team/2,
         rpc_apply_create_team/2,
         rpc_leave_team/1,
         rpc_invite_team/2,
         rpc_apply_join_team/2,
         rpc_approve_join_team/3,
         rpc_apply_invite_team/2,
         rpc_kick_mate/2,
         rpc_set_declaration/2,
         rpc_modify_team_name/2,
         rpc_exchange_alternate/3,
         rpc_sign/1,
         rpc_enter_match/1,
         rpc_leave_match/1,
         rpc_match_ready/1,
         rpc_match_cancel_ready/1,
         rpc_watch_combat/2,
         rpc_vote_team/3,
         push_team_group/3,
         push_invite_list/2,
         push_can_apply_list/1,
         push_gods_duel_team/1,
         push_enemy_team/1,
         push_team_group_64/3,
         push_match_profile_list/4,
         push_vote_info/1,
         repair_push_all/0,
         push_gods_duel_time/2,
         push_gods_lev_info/1,
         get_vote_num/3,
         rpc_team_rank_info/2]).

init() -> #m_gods_duel{}.

login(Role = #role{s_event = RoleEvent, pos = Pos,
                   id = RoleId, name = Name, lev = Lev, classes = Classes,
                   sex = Sex,
                   m_gods_duel =
                       MGodsDuel = #m_gods_duel{gods_score = OldScore}}) ->
    MapRole = case RoleEvent of
                  41 ->
                      {MapId, X, Y} = util:rand_list([{10001, 306, 3507},
                                                      {10001, 2583, 3848},
                                                      {10001, 4957, 3680},
                                                      {10001, 445, 2565},
                                                      {10001, 4646, 704},
                                                      {10001, 841, 1033},
                                                      {10001, 2098, 1834},
                                                      {10001, 3617, 1816}]),
                      Role#role{s_event = 0,
                                pos = Pos#pos{map = MapId, x = X, y = Y}};
                  71 ->
                      {MapId, X, Y} = util:rand_list([{10001, 306, 3507},
                                                      {10001, 2583, 3848},
                                                      {10001, 4957, 3680},
                                                      {10001, 445, 2565},
                                                      {10001, 4646, 704},
                                                      {10001, 841, 1033},
                                                      {10001, 2098, 1834},
                                                      {10001, 3617, 1816}]),
                      Role#role{s_event = 0,
                                pos = Pos#pos{map = MapId, x = X, y = Y}};
                  _ -> Role
              end,
    L = [#trigger{label = evt_levup, a = [],
                  m = gods_duel_role, f = apply_evt},
         #trigger{label = evt_fc, a = [], m = gods_duel_role,
                  f = apply_evt},
         #trigger{label = evt_activity, a = [],
                  m = gods_duel_role, f = apply_evt},
         #trigger{label = evt_lev_break, a = [],
                  m = gods_duel_role, f = apply_evt}],
    {_, TriggerRole} = role_trigger:add(L, MapRole),
    ChatIconRole = check_chat_icon(TriggerRole),
    {ok, Role1} = case ets:lookup(gods_duel_team_role_ids,
                                  RoleId)
                      of
                      [{_, TeamId}] ->
                          NewRole = ChatIconRole#role{m_gods_duel =
                                                          MGodsDuel#m_gods_duel{team_id
                                                                                    =
                                                                                    TeamId}},
                          Flag = case env:get(gods_season_status) of
                                     1 -> true;
                                     2 -> true;
                                     _ -> true
                                 end,
                          case Flag of
                              true ->
                                  gods_duel_agent:info({update_member_info,
                                                        TeamId,
                                                        RoleId,
                                                        Lev,
                                                        Classes,
                                                        Name,
                                                        Sex});
                              _ -> ok
                          end,
                          {ok, NewRole};
                      _ ->
                          NewRole = ChatIconRole#role{m_gods_duel =
                                                          MGodsDuel#m_gods_duel{team_id
                                                                                    =
                                                                                    {0,
                                                                                     "",
                                                                                     0}}},
                          {ok, NewRole}
                  end,
    case ets:lookup(gods_duel_profile, RoleId) of
        [#gods_duel_profile{gods_duel_score = NScore}] ->
            case NScore > OldScore of
                true ->
                    Role2 = Role1#role{m_gods_duel =
                                           MGodsDuel#m_gods_duel{gods_score =
                                                                     NScore}},
                    Role3 = role_trigger:fire(#evt_gods_duel_score{score =
                                                                       NScore},
                                              Role2),
                    {ok, Role3};
                false -> {ok, Role1}
            end;
        _ -> {ok, Role1}
    end.

check_chat_icon(Role = #role{id = RoleId}) ->
    logger:debug("登录检查诸神聊天前缀:...", [], gods_duel_role, 154),
    case var:get_var(Role, other, 2076, undefined) of
        {Rank, EndTime} ->
            case gods_duel_team:check_has_team(RoleId) of
                true ->
                    logger:debug("删除聊天前缀:~w",
                                 [{Rank, EndTime}],
                                 gods_duel_role,
                                 159),
                    NewRole = var:del_var(Role, other, 2076),
                    NewRole;
                false ->
                    logger:debug("登录检查诸神聊天前缀，到期时间:~w",
                                 [{Rank, EndTime}],
                                 gods_duel_role,
                                 163),
                    Now = date:unixtime(),
                    case EndTime >= Now + 86400 * 30 of
                        true ->
                            NewEndTime = Now + 86400 * 30,
                            NewRole = var:set_var(Role,
                                                  other,
                                                  2076,
                                                  {Rank, NewEndTime}),
                            NewRole;
                        false ->
                            case Now >= EndTime of
                                true ->
                                    logger:debug("诸神聊天前缀到期了:~w",
                                                 [{Rank, Now, EndTime}],
                                                 gods_duel_role,
                                                 173),
                                    NewRole = var:del_var(Role, other, 2076),
                                    NewRole;
                                _ -> Role
                            end
                    end
            end;
        _ -> Role
    end.

remove_chat_icon(Role) ->
    logger:debug("删除诸神聊天前缀", [], gods_duel_role, 184),
    var:del_var(Role, other, 2076).

get_fighters(LeaderId) ->
    role:apply(sync,
               LeaderId,
               {gods_duel_role, apply_get_fighters, []}).

get_chat_icon(Role) ->
    case var:get_var(Role, other, 2076, undefined) of
        {Rank, _EndTime} -> [{8, Rank}];
        _ -> []
    end.

rpc_create_team(#role{m_combat = #m_combat{pid = Pid}},
                _)
    when is_pid(Pid) ->
    {false, lang:get("您正在战斗中，无法创建战队")};
rpc_create_team(Role, TeamName) ->
    gods_duel_team:create_team(Role, TeamName).

rpc_apply_create_team(Role, Flag) ->
    gods_duel_team:confirm_create_team(Role, Flag).

rpc_apply_invite_team(Role, Flag) ->
    gods_duel_team:confirm_invite_team(Role, Flag).

rpc_kick_mate(Role, MateId) ->
    gods_duel_team:kick_mate(Role, MateId).

rpc_leave_team(Role = #role{id = RoleId,
                            m_gods_duel = #m_gods_duel{team_id = RoleId}}) ->
    gods_duel_team:dismiss_team(Role);
rpc_leave_team(Role) -> gods_duel_team:leave_team(Role).

rpc_invite_team(Role, InviteId) ->
    gods_duel_team:invite_team(Role, InviteId).

rpc_apply_join_team(Role, TeamId) ->
    gods_duel_team:apply_join_team(Role, TeamId).

rpc_approve_join_team(Role, ApplyId, Flag) ->
    gods_duel_team:approve_join_team(Role, ApplyId, Flag).

rpc_set_declaration(Role, Declaration) ->
    gods_duel_team:set_declaration(Role, Declaration).

rpc_modify_team_name(Role, TeamName) ->
    gods_duel_team:modify_team_name(Role, TeamName).

rpc_exchange_alternate(Role, Id1, Id2) ->
    gods_duel_team:exchange_alternate(Role, Id1, Id2).

rpc_sign(#role{id = TeamId,
               m_gods_duel = #m_gods_duel{team_id = TeamId}}) ->
    case env:get(gods_season_status) of
        2 ->
            case gods_duel_team:lookup(TeamId) of
                {ok, #gods_duel_team{member_num = Num}} when Num < 5 ->
                    Msg = notice:format(lang:get("战队成员不足~ts人，无法进行报名"),
                                        [{string_2, 1, 5}]),
                    {false, Msg};
                {ok, #gods_duel_team{qualification = Qua}}
                    when Qua >= 1 ->
                    {false, lang:get("您的战队已经报名了，无需重复报名")};
                {ok, #gods_duel_team{}} ->
                    gods_duel_agent:info({team_sign, TeamId}),
                    ok;
                _ -> {false, lang:get("您还没有战队呢，赶快去创建属于自己的战队吧")}
            end;
        _ -> {false, lang:get("当前不是报名时间，不能进行报名")}
    end;
rpc_sign(_) -> {false, lang:get("您不是队长，无法操作")}.

rpc_enter_match(#role{s_event = 41}) -> ok;
rpc_enter_match(#role{m_team =
                          #m_team{pid = Pid, status = 2}})
    when is_pid(Pid) ->
    {false, lang:get("您正在跟随队伍，不能操作")};
rpc_enter_match(Role = #role{name = _Name}) ->
    case check_enter_match([combat,
                            lev,
                            has_team,
                            qualification,
                            season_status,
                            match_map,
                            team_member],
                           Role,
                           #{})
        of
        {false, Reason} -> {false, Reason};
        {true,
         Args = #{team_data := GodsTeamInfo,
                  mate_ids := MateIds}} ->
            EventRole = Role#role{s_event = 41},
            ToPos = get_pos(Args),
            MateEvent = make_team_evt(EventRole),
            logger:debug("进入参数:~w, 位置：~w ",
                         [MateEvent, ToPos],
                         gods_duel_role,
                         283),
            case map:role_enter(ToPos, MateEvent, EventRole) of
                {error, Reason} ->
                    logger:error("[~w]进入诸神之战失败:~w, 进入坐标:~w",
                                 [_Name, Reason, ToPos],
                                 gods_duel_role,
                                 286),
                    {false, lang:get("进入诸神战场失败")};
                {ok, EnterRole} ->
                    case role_convert:to(fighter_wrap, Role) of
                        {ok, FighterWarp} ->
                            case team:get_fighters(FighterWarp) of
                                {ok, Fighters} ->
                                    big_world:cast(gods_duel_match,
                                                   info,
                                                   [{enter_match,
                                                     GodsTeamInfo,
                                                     Fighters,
                                                     MateIds}]),
                                    ok;
                                _Erle ->
                                    logger:error("转变战斗信息错误:~w",
                                                 [_Erle],
                                                 gods_duel_role,
                                                 298),
                                    ok
                            end;
                        _Err ->
                            logger:error("转换失败:~w",
                                         [_Err],
                                         gods_duel_role,
                                         302),
                            ok
                    end,
                    NewRole = case get(gods_team_triggle) of
                                  undefined ->
                                      TriggerList = [#trigger{label =
                                                                  evt_team_leave,
                                                              a = [],
                                                              m =
                                                                  gods_duel_role,
                                                              f = apply_evt},
                                                     #trigger{label =
                                                                  evt_team_away,
                                                              a = [],
                                                              m =
                                                                  gods_duel_role,
                                                              f = apply_evt},
                                                     #trigger{label =
                                                                  evt_team_join,
                                                              a = [],
                                                              m =
                                                                  gods_duel_role,
                                                              f = apply_evt},
                                                     #trigger{label =
                                                                  evt_team_appoint,
                                                              a = [],
                                                              m =
                                                                  gods_duel_role,
                                                              f = apply_evt},
                                                     #trigger{label =
                                                                  evt_team_follow,
                                                              a = [],
                                                              m =
                                                                  gods_duel_role,
                                                              f = apply_evt}],
                                      {TL, TriggerRole} =
                                          role_trigger:add(TriggerList,
                                                           EnterRole),
                                      logger:debug("存储的事件列表为:~w",
                                                   [TL],
                                                   gods_duel_role,
                                                   318),
                                      put(gods_team_triggle, TL),
                                      TriggerRole;
                                  [_ | _] -> EnterRole
                              end,
                    {ok, NewRole}
            end
    end.

rpc_leave_match(#role{m_team =
                          #m_team{pid = Pid, status = 2}})
    when is_pid(Pid) ->
    {false, lang:get("您正在跟随队伍，不能操作")};
rpc_leave_match(Role = #role{id = RoleId,
                             m_gods_duel = #m_gods_duel{team_id = TeamId},
                             s_event = 41}) ->
    ToPos = util:rand_list([{10001, 306, 3507},
                            {10001, 2583, 3848},
                            {10001, 4957, 3680},
                            {10001, 445, 2565},
                            {10001, 4646, 704},
                            {10001, 841, 1033},
                            {10001, 2098, 1834},
                            {10001, 3617, 1816}]),
    LeaveRole = Role#role{s_event = 0, cross_type = 0},
    LeaveEvt = make_team_evt(LeaveRole),
    logger:debug("=========:~w",
                 [LeaveEvt],
                 gods_duel_role,
                 336),
    case map:role_enter(ToPos, LeaveEvt, LeaveRole) of
        {ok, NewRole} ->
            logger:debug("==========", [], gods_duel_role, 340),
            big_world:cast(gods_duel_match,
                           info,
                           [{match_leave, TeamId, RoleId}]),
            {ok, NewRole};
        _Err -> {false, lang:get("退出战区失败")}
    end;
rpc_leave_match(_) -> ok.

rpc_match_ready(Role = #role{m_gods_duel =
                                 #m_gods_duel{team_id = GodsTeamId},
                             m_team = #m_team{}}) ->
    case check_enter_match([combat,
                            has_team,
                            qualification,
                            season_status,
                            is_leader,
                            lev,
                            team_member_ready],
                           Role,
                           #{})
        of
        {true, _Args = #{fighters := Fighters}} ->
            logger:debug("准备就绪成功:~w", [_Args], gods_duel_role, 353),
            big_world:cast(gods_duel_match,
                           info,
                           [{team_ready, GodsTeamId, Fighters}]),
            ok;
        {false, Reason} ->
            logger:debug("准备就绪失败:~ts",
                         [Reason],
                         gods_duel_role,
                         358),
            {false, Reason}
    end.

rpc_match_cancel_ready(Role = #role{s_event = 41,
                                    m_gods_duel =
                                        #m_gods_duel{team_id = TeamId}}) ->
    case check_enter_match([has_team, season_status],
                           Role,
                           #{})
        of
        {true, _} ->
            big_world:cast(gods_duel_match,
                           info,
                           [{team_ready, TeamId}]),
            Msg = lang:get("您取消了准备，双方准备就绪后比赛开始"),
            {ok, Msg};
        {false, Reason} -> {false, Reason};
        _ -> {false, lang:get("取消准备失败")}
    end;
rpc_match_cancel_ready(_) -> ok.

rpc_watch_combat(#role{m_combat = #m_combat{pid = Pid}},
                 _)
    when is_pid(Pid) ->
    {false, lang:get("正在战斗中不能观看录像")};
rpc_watch_combat(Role = #role{link =
                                  #link{conn_pid = ConnPid}},
                 CombatRecordId) ->
    case
        gods_duel_agent:lookup_match_profile(CombatRecordId)
        of
        {ok,
         #gods_duel_match_profile{is_over = 1,
                                  platform = Platform, zone_id = ZoneId}} ->
            case big_world:call(Platform,
                                ZoneId,
                                combat_record,
                                fetch,
                                [{13, {CombatRecordId, Platform, ZoneId}}])
                of
                Record = #combat_record{} ->
                    combat_record:replay(ConnPid, Record),
                    ok;
                _ -> {false, lang:get("录像已经过期")}
            end;
        {ok, #gods_duel_match_profile{combat_pid = CombatPid}}
            when is_pid(CombatPid) ->
            {ok, Ob} = role_convert:to(c_observer, Role),
            CombatPid ! {observer_enter, Ob, #{}},
            combat_util:member_enter_ob(Role, CombatPid, false),
            ok;
        _ ->
            logger:debug("不存在的赛况数据", [], gods_duel_role, 395),
            {false, lang:get("不存在的赛况数据")}
    end.

rpc_vote_team(Role = #role{id = Id, name = Name,
                           lev = Lev, sex = Sex, classes = Classes},
              ZoneId, TeamIds) ->
    case check_vote([has_done],
                    Role,
                    #{team_ids => TeamIds})
        of
        true ->
            Loss = format:val_to_loss([{21719, 1}]),
            case role_gain:do_notice(Loss, Role) of
                {ok, NewRole} ->
                    VoteArgs = #{id => Id, match_zone => ZoneId,
                                 name => Name, lev => Lev, sex => Sex,
                                 classes => Classes, team_ids => TeamIds},
                    case gods_duel_agent:call({vote, VoteArgs}) of
                        true -> {ok, NewRole};
                        {false, Reason} -> {false, Reason}
                    end;
                {false, #loss{msg = Msg}} -> {false, Msg};
                _ -> {false, lang:get("您没有选票，不能进行投票")}
            end;
        {false, Reason} -> {false, Reason}
    end.

push_can_apply_list(#role{lev = Lev}) when Lev < 80 ->
    ok;
push_can_apply_list(Role = #role{lev = Lev}) ->
    TeamList = gods_duel_team:get_can_apply_list(Lev),
    role:link_send(Role, 17906, {TeamList}),
    ok.

push_invite_list(Role, Type) ->
    case Type of
        1 ->
            FriendList = friend:list_role(Role),
            InviteList = gods_duel_team:get_invite_list(FriendList,
                                                        []),
            role:link_send(Role, 17910, {Type, InviteList}),
            ok;
        2 ->
            case Role of
                #role{m_guild = #m_guild{id = Gid}} ->
                    case guild_mgr:members(Gid) of
                        {ok, Members} ->
                            InviteList = gods_duel_team:get_invite_list(Members,
                                                                        []),
                            role:link_send(Role, 17910, {Type, InviteList}),
                            ok;
                        _ ->
                            role:link_send(Role, 17910, {Type, []}),
                            ok
                    end;
                _ ->
                    role:link_send(Role, 17910, {Type, []}),
                    ok
            end;
        _ -> ok
    end.

push_gods_duel_team(Role = #role{id = RoleId,
                                 m_gods_duel =
                                     #m_gods_duel{team_id = TeamId}}) ->
    case gods_duel_team:check_has_team(RoleId) of
        true ->
            TeamInfo = case gods_duel_team:lookup(TeamId) of
                           {ok, _TeamInfo} -> _TeamInfo;
                           _ -> #gods_duel_team{}
                       end,
            role:link_send(Role, 17900, {TeamInfo}),
            ok;
        false ->
            role:link_send(Role, 17900, {#gods_duel_team{}}),
            ok
    end.

push_team_group(Role, ZoneId, Index) ->
    case ets:lookup(gods_duel_group_team, ZoneId) of
        [{_, GroupTeamList}] ->
            TeamList = get_group_team_list(GroupTeamList,
                                           Index,
                                           []),
            role:link_send(Role, 17917, {ZoneId, Index, TeamList}),
            ok;
        _ ->
            case gods_duel_agent:call({gods_duel_group_team,
                                       ZoneId})
                of
                {ok, GroupTeamList} ->
                    logger:debug("GroupTeamList:~w",
                                 [GroupTeamList],
                                 gods_duel_role,
                                 481),
                    TeamList = get_group_team_list(GroupTeamList,
                                                   Index,
                                                   []),
                    role:link_send(Role, 17917, {ZoneId, Index, TeamList}),
                    ok;
                _ -> ok
            end
    end.

push_team_group_64(Role, ZoneId, SeasonId) ->
    Fun = fun (GTeam = #gods_duel_team{qualification = Qua},
               Rtn)
                  when Qua >= 3 ->
                  [GTeam | Rtn];
              (_, Rtn) -> Rtn
          end,
    case ets:lookup(gods_duel_season_data,
                    gods_duel_season_data)
        of
        [#gods_duel_season_data{history_season_info =
                                    HistorySeasonInfo}] ->
            case 0 =:= SeasonId of
                true ->
                    case ets:lookup(gods_duel_group_team, ZoneId) of
                        [{_, GroupTeamList}] ->
                            Qua64TeamList = lists:foldl(Fun, [], GroupTeamList),
                            role:link_send(Role,
                                           17925,
                                           {ZoneId, Qua64TeamList});
                        _ -> ok
                    end;
                false ->
                    case lists:keyfind(SeasonId,
                                       #gods_duel_season_info.id,
                                       HistorySeasonInfo)
                        of
                        #gods_duel_season_info{teams = Teams} ->
                            case lists:keyfind(ZoneId, 1, Teams) of
                                {_, TeamList} ->
                                    Qua64TeamList = lists:foldl(Fun,
                                                                [],
                                                                TeamList),
                                    role:link_send(Role,
                                                   17932,
                                                   {ZoneId,
                                                    SeasonId,
                                                    Qua64TeamList});
                                _ ->
                                    role:link_send(Role,
                                                   17932,
                                                   {ZoneId, SeasonId, []})
                            end;
                        _ -> role:link_send(Role, 17932, {ZoneId, SeasonId, []})
                    end
            end;
        _ -> ok
    end.

push_enemy_team(Role) ->
    SeasonStatus = gods_duel_common:get_season_status(),
    Reply = case
                gods_duel_common:get_match_index(SeasonStatus)
                of
                {1, _} -> get_group_match_enemy(Role);
                {2, MatchRound} ->
                    get_final_match_enemy(Role, MatchRound);
                _ -> get_final_match_enemy(Role, 0)
            end,
    logger:debug("查询我的对战数据:~w",
                 [Reply],
                 gods_duel_role,
                 535),
    role:link_send(Role, 17918, Reply).

push_match_profile_list(Role, SeasonId, GroupId,
                        WatchType) ->
    Reply =
        gods_duel_common:get_match_profile_list(SeasonId,
                                                GroupId,
                                                WatchType),
    Platform = env:get(platform),
    ZoneId = env:get(zone_id),
    logger:debug("比赛信息:~w",
                 [{Reply, Platform, ZoneId}],
                 gods_duel_role,
                 543),
    role:link_send(Role, 17928, {Reply, Platform, ZoneId}),
    ok.

push_vote_info(Role = #role{id = RoleId}) ->
    Reply = gods_duel_agent:get_role_vote(RoleId),
    logger:debug("投票信息:~w", [Reply], gods_duel_role, 550),
    role:link_send(Role, 17930, Reply),
    ok.

apply_evt(#evt_levup{},
          #role{id = RoleId, lev = Lev,
                m_gods_duel = #m_gods_duel{team_id = TeamId}})
    when TeamId =/= {0, "", 0} ->
    Flag = case env:get(gods_season_status) of
               1 -> true;
               2 -> true;
               _ -> false
           end,
    case Flag of
        true ->
            gods_duel_agent:info({update_member_lev,
                                  TeamId,
                                  RoleId,
                                  Lev}),
            ok;
        false -> ok
    end,
    ok;
apply_evt(#evt_lev_break{},
          #role{id = RoleId, lev = Lev,
                m_lev_break = #m_lev_break{times = BreakTimes},
                m_gods_duel = #m_gods_duel{team_id = TeamId}})
    when TeamId =/= {0, "", 0} ->
    Flag = case env:get(gods_season_status) of
               1 -> true;
               2 -> true;
               _ -> false
           end,
    case Flag of
        true ->
            gods_duel_agent:info({update_member_break_times,
                                  TeamId,
                                  RoleId,
                                  Lev,
                                  BreakTimes}),
            ok;
        _ -> ok
    end;
apply_evt(#evt_fc{},
          Role = #role{id = RoleId,
                       m_gods_duel = #m_gods_duel{team_id = TeamId},
                       attr = #attr{fc = Fc}})
    when TeamId =/= {0, "", 0} ->
    Flag = case env:get(gods_season_status) of
               1 -> true;
               2 -> true;
               _ -> false
           end,
    case Flag of
        true ->
            PetFc = pet_attr:calc_fc(Role),
            TotalFc = Fc + PetFc,
            gods_duel_agent:info({update_member_fc,
                                  TeamId,
                                  RoleId,
                                  TotalFc}),
            ok;
        false -> ok
    end,
    ok;
apply_evt(#evt_team_leave{},
          #role{s_event = 41, id = RoleId,
                m_gods_duel = #m_gods_duel{team_id = GodsTeamId}}) ->
    logger:debug("检查到队员[~w]离队",
                 [RoleId],
                 gods_duel_role,
                 598),
    big_world:cast(gods_duel_match,
                   info,
                   [{team_fighter_leave, GodsTeamId, RoleId}]),
    ok;
apply_evt(#evt_team_away{},
          #role{s_event = 41, id = RoleId,
                m_gods_duel = #m_gods_duel{team_id = GodsTeamId}}) ->
    logger:debug("检查到队员[~w]暂离",
                 [RoleId],
                 gods_duel_role,
                 609),
    big_world:cast(gods_duel_match,
                   info,
                   [{team_fighter_leave, GodsTeamId, RoleId}]),
    ok;
apply_evt(#evt_team_follow{},
          Role = #role{s_event = 41, name = _Name,
                       m_gods_duel = #m_gods_duel{team_id = GodsTeamId},
                       m_team = #m_team{status = 1}}) ->
    logger:debug("队长[~ts]检查到跟随",
                 [_Name],
                 gods_duel_role,
                 620),
    case role_convert:to(fighter_wrap, Role) of
        {ok, FighterWarp} ->
            case team:get_fighters(FighterWarp) of
                {ok, Fighters} ->
                    big_world:cast(gods_duel_match,
                                   info,
                                   [{team_fighter_update,
                                     GodsTeamId,
                                     Fighters}]),
                    ok;
                _Erle -> ok
            end;
        _ -> ok
    end,
    ok;
apply_evt(#evt_team_join{},
          Role = #role{s_event = 41, name = _Name,
                       m_gods_duel = #m_gods_duel{team_id = GodsTeamId},
                       m_team = #m_team{status = 1}}) ->
    logger:debug("队长[~ts]检查到加入",
                 [_Name],
                 gods_duel_role,
                 637),
    case role_convert:to(fighter_wrap, Role) of
        {ok, FighterWarp} ->
            case team:get_fighters(FighterWarp) of
                {ok, Fighters} ->
                    big_world:cast(gods_duel_match,
                                   info,
                                   [{team_fighter_update,
                                     GodsTeamId,
                                     Fighters}]),
                    ok;
                _Erle -> ok
            end;
        _ -> ok
    end,
    ok;
apply_evt(_E = #evt_team_appoint{leader_id = RoleId},
          Role = #role{s_event = 41, id = RoleId, name = _Name,
                       m_team = #m_team{status = 1},
                       m_gods_duel = #m_gods_duel{team_id = GodsTeamId}}) ->
    logger:debug("队长[~ts]检查到队长变更, 事件:~w",
                 [_Name, _E],
                 gods_duel_role,
                 655),
    case role_convert:to(fighter_wrap, Role) of
        {ok, FighterWarp} ->
            case team:get_fighters(FighterWarp) of
                {ok, Fighters} ->
                    big_world:cast(gods_duel_match,
                                   info,
                                   [{team_fighter_update,
                                     GodsTeamId,
                                     Fighters}]),
                    ok;
                _Erle -> ok
            end;
        _ -> ok
    end,
    ok;
apply_evt(#evt_activity{},
          Role = #role{m_agenda = #m_agenda{activity = Activity},
                       lev = Lev})
    when Lev >= 70 andalso Activity >= 75 ->
    SeasonStatus = gods_duel_common:get_season_status(),
    case SeasonStatus of
        _ when SeasonStatus > 4 ->
            SeasonId = gods_duel_common:get_season_id(),
            case var:get_var(Role, other, 2060, {SeasonId, 24}) of
                {SeasonId, VoteRound} ->
                    Rounds = [R || R <- [25, 27, 29, 31], R > VoteRound],
                    case length(Rounds) > 0 of
                        true ->
                            Title = lang:get("诸神之战投票券"),
                            case get_vote_num(SeasonId, Rounds, {0, 0}) of
                                {MaxRound, Num} when Num > 0 ->
                                    Role1 = var:set_var(Role,
                                                        other,
                                                        2060,
                                                        {SeasonId, MaxRound}),
                                    VoteItems = [{21719, Num}],
                                    Content =
                                        notice:format(lang:get("恭喜你达成本轮诸神之战投票资格，特赠予~ts，使用~ts可以在~ts界面投票下轮的获胜战队"
                                                               "。诸神之战~ts之后任意一天活跃度达到~ts点领取活跃度奖励时，即可获得本轮的投票的~ts"
                                                               ""),
                                                      [{item_2, VoteItems},
                                                       {item_2, VoteItems},
                                                       {panel_2,
                                                        17902,
                                                        2,
                                                        lang:get("诸神之战-投票")},
                                                       {string_2,
                                                        1,
                                                        lang:get("8强赛")},
                                                       {string_2, 1, 75},
                                                       {item_2, VoteItems}]),
                                    mail:send(Role1,
                                              #{title => Title,
                                                content => Content,
                                                items => VoteItems}),
                                    {ok, Role1};
                                _ -> ok
                            end;
                        _ -> ok
                    end;
                _ -> ok
            end;
        _ -> ok
    end;
apply_evt(_, _) -> ok.

get_vote_num(_SeasonID, [], {MaxRound, Num}) ->
    {MaxRound, Num};
get_vote_num(SeasonID, [StateCode | T],
             {MaxRound, Num}) ->
    {NewMaxRound, NewNum} = case
                                gods_duel_common:get_state_get_time_config(SeasonID,
                                                                           StateCode)
                                of
                                {StartTime, EndTime} ->
                                    Now = date:unixtime(),
                                    case StartTime > Now andalso
                                             EndTime <
                                                 Now + date:next_diff(0) +
                                                     24 * 60 * 60
                                        of
                                        true ->
                                            {max(MaxRound, StateCode), Num + 1};
                                        _ -> {MaxRound, Num}
                                    end;
                                _ -> {MaxRound, Num}
                            end,
    get_vote_num(SeasonID, T, {NewMaxRound, NewNum}).

apply_get_fighters(Role) ->
    case role_convert:to(fighter_wrap, Role) of
        {ok, FighterWarp} ->
            case team:get_fighters(FighterWarp) of
                {ok, Fighters} -> {ok, {ok, Fighters}};
                _Else -> {ok, false}
            end;
        _ -> {ok, false}
    end.

apply_team_mate_enter(_,
                      Role = #role{name = _Name, s_event = 41}, _) ->
    logger:debug("监控事件变化:~ts",
                 [_Name],
                 gods_duel_role,
                 740),
    TriggerList = [#trigger{label = evt_team_leave, a = [],
                            m = gods_duel_role, f = apply_evt},
                   #trigger{label = evt_team_away, a = [],
                            m = gods_duel_role, f = apply_evt},
                   #trigger{label = evt_team_join, a = [],
                            m = gods_duel_role, f = apply_evt},
                   #trigger{label = evt_team_appoint, a = [],
                            m = gods_duel_role, f = apply_evt},
                   #trigger{label = evt_team_follow, a = [],
                            m = gods_duel_role, f = apply_evt}],
    {TL, NewRole} = role_trigger:add(TriggerList, Role),
    logger:debug("存储的事件列表为:~w", [TL], gods_duel_role, 750),
    put(gods_team_triggle, TL),
    {ok, NewRole};
apply_team_mate_enter(_, _, _) -> ok.

apply_team_mate_leave(RolePid) ->
    role:apply(async,
               RolePid,
               {gods_duel_role, rpc_leave_match, []}),
    ok.

apply_team_mate_leave(_,
                      Role = #role{id = RoleId,
                                   m_gods_duel =
                                       #m_gods_duel{team_id = GodsTeamId}},
                      _) ->
    NewRole = case get(gods_team_triggle) of
                  TL = [_ | _] ->
                      logger:debug("删除事件列表:~w", [TL], gods_duel_role, 763),
                      role_trigger:del(TL, Role);
                  _ -> Role
              end,
    put(gods_team_triggle, undefined),
    big_world:cast(gods_duel_match,
                   info,
                   [{match_leave, GodsTeamId, RoleId}]),
    {ok, NewRole};
apply_team_mate_leave(_, _, _) -> ok.

push_17966(#role{link = Link}, EndTime) ->
    logger:debug("角色处理2协议17966：：：~w,",
                 [EndTime],
                 gods_duel_role,
                 775),
    role:link_send(Link, 17966, {EndTime}),
    ok.

apply_push_17966({RolePid, EndTime}) ->
    logger:debug("角色处理3协议17966：：~w",
                 [EndTime],
                 gods_duel_role,
                 780),
    role:apply(async,
               RolePid,
               {gods_duel_role, push_17966, [EndTime]}),
    ok.

rpc_push_17966(#role{link = Link}) ->
    logger:debug("处理1协议17966", [], gods_duel_role, 784),
    big_world:cast(gods_duel_match,
                   info,
                   [{push_17966, Link}]).

get_group_team_list([], _Index, TeamList) -> TeamList;
get_group_team_list([TeamInfo =
                         #gods_duel_team{team_group_256 = TeamRank}
                     | Rest],
                    Index, TeamList) ->
    {RangeMin, RangeMax} = case Index of
                               1 -> {1, 8};
                               2 -> {9, 16};
                               3 -> {17, 24};
                               4 -> {25, 32};
                               _ -> {1, 8}
                           end,
    TeamGroup = (TeamRank - 1) rem 32 + 1,
    case TeamGroup >= RangeMin andalso TeamGroup =< RangeMax
        of
        true ->
            get_group_team_list(Rest, Index, [TeamInfo | TeamList]);
        false -> get_group_team_list(Rest, Index, TeamList)
    end.

check_enter_match([], _Role, Args) -> {true, Args};
check_enter_match([Type | Rest], Role, Args) ->
    case check_enter_match(Type, Role, Args) of
        true -> check_enter_match(Rest, Role, Args);
        {true, NewArgs} ->
            check_enter_match(Rest, Role, NewArgs);
        {false, Reason} -> {false, Reason}
    end;
check_enter_match(combat,
                  #role{m_combat = #m_combat{pid = Pid}}, _Args)
    when is_pid(Pid) ->
    {false, lang:get("您正在战斗中，无法操作")};
check_enter_match(lev,
                  #role{lev = Lev, name = RoleName,
                        m_lev_break = #m_lev_break{times = BreakTimes},
                        m_gods_duel = #m_gods_duel{team_id = TeamId}},
                  _Args) ->
    case gods_duel_team:lookup(TeamId) of
        {ok, #gods_duel_team{lev = Group}} ->
            IsGroup = gods_duel_data:get_group_num(Lev, BreakTimes),
            case IsGroup =< Group of
                true -> true;
                _ ->
                    GroupName = gods_duel_team:get_group_name(Group),
                    Msg =
                        notice:format(lang:get("~ts已超出诸神~ts等级上限，请更换符合条件的队员{face_1,2}"),
                                      [{role_2, RoleName},
                                       {string_2, 1, GroupName}]),
                    {false, Msg}
            end;
        _ -> {false, lang:get("您还没有战队呢，等待下一赛季的到来吧")}
    end;
check_enter_match(has_team, #role{id = RoleId}, Args) ->
    case gods_duel_team:get_team_id(RoleId) of
        {true, TeamId} ->
            case gods_duel_team:lookup(TeamId) of
                {ok, TeamInfo} ->
                    {true,
                     Args#{team_data =>
                               TeamInfo#gods_duel_team{applys = [],
                                                       invite_info = []}}};
                _ -> {false, lang:get("您还没有战队呢，等待下一赛季的到来吧")}
            end;
        false -> {false, lang:get("您还没有战队呢，等待下一赛季的到来吧")}
    end;
check_enter_match(qualification,
                  #role{m_gods_duel = #m_gods_duel{team_id = TeamId}},
                  Args) ->
    case gods_duel_team:lookup(TeamId) of
        {ok,
         #gods_duel_team{lev = ZoneId, win_times = WinTimes,
                         loss_times = LossTimes, team_group_256 = SelfRank,
                         qualification = Qua}} ->
            case gods_duel_common:get_match_index() of
                {1, Value} ->
                    case WinTimes + LossTimes >= Value of
                        true -> {false, lang:get("您已经完成了本轮对战")};
                        false ->
                            SeasonStatus = gods_duel_common:get_season_status(),
                            TargetRank =
                                gods_duel_team:get_target_rank(SeasonStatus,
                                                               SelfRank),
                            MatchId = min(SelfRank, TargetRank),
                            {true,
                             Args#{match_id => MatchId, zone_id => ZoneId}}
                    end;
                {2, MatchRound} ->
                    NeedQua =
                        gods_duel_common:get_final_match_qua(MatchRound),
                    case Qua of
                        _ when Qua < NeedQua ->
                            {false, lang:get("您的战队今日没赛事，请查看战队比赛状态")};
                        _ when Qua =:= NeedQua -> true;
                        _ -> {false, lang:get("您的战队已经完成了本轮对战")}
                    end;
                _ -> {false, lang:get("现在不是入场时间，请等待比赛开始吧")}
            end;
        _ -> {false, lang:get("您还没有战队呢，等待下一赛季的到来吧")}
    end;
check_enter_match(season_status, #role{}, _Args) ->
    case env:get(gods_season_status) of
        5 -> true;
        7 -> true;
        9 -> true;
        11 -> true;
        13 -> true;
        15 -> true;
        17 -> true;
        19 -> true;
        21 -> true;
        23 -> true;
        25 -> true;
        27 -> true;
        29 -> true;
        31 -> true;
        _ -> {false, lang:get("现在不是入场时间，请等待比赛开始吧")}
    end;
check_enter_match(match_map,
                  #role{m_gods_duel = #m_gods_duel{team_id = TeamId}},
                  Args) ->
    case big_world:call(gods_duel_match,
                        call,
                        [{match_map_info, TeamId}])
        of
        {ok,
         #{platform := Platform, zone_id := ZoneId,
           map_id := MapId}} ->
            {true,
             Args#{platform => Platform, map_zone_id => ZoneId,
                   map_id => MapId}};
        {false, Reason} -> {false, Reason};
        _ -> {false, lang:get("现在不是入场时间，请等待比赛开始吧")}
    end;
check_enter_match(team_member,
                  Role = #role{id = RoleId, pid = RolePid,
                               m_gods_duel = #m_gods_duel{team_id = TeamId}},
                  Args) ->
    case team:get_members(Role) of
        [] -> {true, Args#{mate_ids => [{RoleId, RolePid}]}};
        Members ->
            case check_member(Members, TeamId) of
                {false, Reason} -> {false, Reason};
                _ ->
                    MateIds1 = [{MateId, MatePid}
                                || #team_mate{id = MateId, pid = MatePid}
                                       <- Members],
                    MateIds2 = [{RoleId, RolePid} | MateIds1],
                    {true, Args#{mate_ids => MateIds2}}
            end
    end;
check_enter_match(is_leader,
                  #role{m_team = #m_team{status = Status}}, _Args)
    when Status =/= 1 ->
    {false, lang:get("您不是队长，无法操作")};
check_enter_match(team_member_ready,
                  Role = #role{m_gods_duel =
                                   #m_gods_duel{team_id = TeamId}},
                  Args) ->
    case team:get_members(Role) of
        [] -> true;
        Members ->
            case check_member(Members, TeamId) of
                {false, Reason} -> {false, Reason};
                _ ->
                    PartitionFun = fun (#team_mate{status = 2}) -> true;
                                       (_) -> false
                                   end,
                    {FollowMates, OtherMates} =
                        lists:partition(PartitionFun, Members),
                    case length(FollowMates) < 3 of
                        true ->
                            Msg =
                                notice:format(lang:get("您的队伍归队人数少于~ts人，开赛后将失去比赛资格，请补充队员。"),
                                              [{string_2, 1, 4}]),
                            {false, Msg};
                        false ->
                            case [MateName
                                  || #team_mate{name = MateName} <- OtherMates]
                                of
                                [Name | _] ->
                                    Msg =
                                        notice:format(lang:get("您队伍中的~ts未归队，比赛开始后队伍ta将~ts。"),
                                                      [{role_2, Name},
                                                       {string_2,
                                                        6,
                                                        lang:get("无法参赛")}]),
                                    {false, Msg};
                                _ ->
                                    case role_convert:to(fighter_wrap, Role) of
                                        {ok, FighterWarp} ->
                                            case team:get_fighters(FighterWarp)
                                                of
                                                {ok, Fighters} ->
                                                    {true,
                                                     Args#{fighters =>
                                                               Fighters}};
                                                _Else ->
                                                    {false,
                                                     lang:get("获取参赛队员信息失败")}
                                            end;
                                        _ -> {false, lang:get("获取参赛队员信息失败")}
                                    end
                            end
                    end
            end
    end;
check_enter_match(_, _, _) -> true.

check_member(Members, TeamID) ->
    check_member([team_mate, member_lev],
                 Members,
                 Members,
                 TeamID).

check_member([], _Members, _AllMembers, _TeamId) ->
    true;
check_member([team_mate | ConList], [Mate | Rest],
             AllMembers, TeamId) ->
    case Mate of
        #team_mate{id = MateId, name = Name, status = 2} ->
            case gods_duel_team:get_team_id(MateId) of
                {true, MateTeamId} when MateTeamId =/= TeamId ->
                    Msg =
                        notice:format(lang:get("您队伍中的~ts并非的战队成员，参与比赛的队伍只能由战队成员组成哦"),
                                      [{role_2, Name}]),
                    {false, Msg};
                {true, TeamId} ->
                    case Rest of
                        [] ->
                            check_member(ConList,
                                         AllMembers,
                                         AllMembers,
                                         TeamId);
                        _ ->
                            check_member([team_mate | ConList],
                                         Rest,
                                         AllMembers,
                                         TeamId)
                    end;
                _ ->
                    Msg =
                        notice:format(lang:get("您队伍中的~ts并非的战队成员，参与比赛的队伍只能由战队成员组成哦"),
                                      [{role_2, Name}]),
                    {false, Msg}
            end;
        _ ->
            case Rest of
                [] ->
                    check_member(ConList, AllMembers, AllMembers, TeamId);
                _ ->
                    check_member([team_mate | ConList],
                                 Rest,
                                 AllMembers,
                                 TeamId)
            end
    end;
check_member([member_lev | ConList], [Mate | Rest],
             AllMembers, TeamId) ->
    case Mate of
        #team_mate{lev = Lev, name = Name, status = 2,
                   lev_break_times = BreakTimes} ->
            case gods_duel_team:lookup(TeamId) of
                {ok, #gods_duel_team{lev = Group}} ->
                    IsGroup = gods_duel_data:get_group_num(Lev, BreakTimes),
                    case IsGroup =< Group of
                        false ->
                            GroupName = gods_duel_team:get_group_name(Group),
                            Msg =
                                notice:format(lang:get("~ts已超出诸神~ts等级上限，请更换符合条件的队员{face_1,2}"),
                                              [{role_2, Name},
                                               {string_2, 1, GroupName}]),
                            {false, Msg};
                        _ ->
                            case Rest of
                                [] ->
                                    check_member(ConList,
                                                 AllMembers,
                                                 AllMembers,
                                                 TeamId);
                                _ ->
                                    check_member([member_lev | ConList],
                                                 Rest,
                                                 AllMembers,
                                                 TeamId)
                            end
                    end;
                _ ->
                    case Rest of
                        [] ->
                            check_member(ConList,
                                         AllMembers,
                                         AllMembers,
                                         TeamId);
                        _ ->
                            check_member([member_lev | ConList],
                                         Rest,
                                         AllMembers,
                                         TeamId)
                    end
            end;
        _ ->
            case Rest of
                [] ->
                    check_member(ConList, AllMembers, AllMembers, TeamId);
                _ ->
                    check_member([member_lev | ConList],
                                 Rest,
                                 AllMembers,
                                 TeamId)
            end
    end.

make_team_evt(Role = #role{s_event = Event}) ->
    case check_team(Role) of
        [] -> self;
        MateIds when Event =:= 41 ->
            FollowMateIds = [Id || Id <- MateIds],
            #{label => enter_event, event => Event,
              role_ids => FollowMateIds,
              mfa => {gods_duel_role, apply_team_mate_enter, []}};
        MateIds ->
            #{label => exit_event, event => Event,
              role_ids => MateIds,
              mfa => {gods_duel_role, apply_team_mate_leave, []}}
    end.

check_team(Role = #role{m_team =
                            #m_team{pid = Pid, status = 1}})
    when is_pid(Pid) ->
    case team:get_members(Role) of
        TeamList = [_ | _] ->
            [Id || #team_mate{id = Id, status = 2} <- TeamList];
        _ -> []
    end;
check_team(_) -> [].

get_pos(#{platform := Platform, map_zone_id := ZoneId,
          map_id := MapId}) ->
    {X, Y} = util:rand_list([{3200, 1960},
                             {3480, 1400},
                             {3240, 800},
                             {2047, 1803}]),
    {Platform, ZoneId, MapId, X, Y}.

get_group_match_enemy(#role{m_gods_duel =
                                #m_gods_duel{team_id = TeamId}}) ->
    case gods_duel_team:check_has_team(TeamId) of
        true ->
            case gods_duel_team:lookup(TeamId) of
                {ok,
                 #gods_duel_team{lev = ZoneId, team_group_256 = TeamRank,
                                 qualification = 2}} ->
                    case ets:lookup(gods_duel_group_team, ZoneId) of
                        [{_, GroupTeamList}] ->
                            case gods_duel_common:get_match_index() of
                                {1, Value} ->
                                    SelfIndex = (TeamRank - 1) div 32 + 1,
                                    GroupNum = (TeamRank - 1) rem 32 + 1,
                                    case lists:keyfind(Value,
                                                       1,
                                                       [{1,
                                                         [{1, 2},
                                                          {2, 1},
                                                          {3, 4},
                                                          {4, 3}]},
                                                        {2,
                                                         [{1, 3},
                                                          {3, 1},
                                                          {2, 4},
                                                          {4, 2}]},
                                                        {3,
                                                         [{1, 4},
                                                          {4, 1},
                                                          {2, 3},
                                                          {3, 2}]}])
                                        of
                                        {_, MatchTable} ->
                                            case lists:keyfind(SelfIndex,
                                                               1,
                                                               MatchTable)
                                                of
                                                {_, TargetIndex} ->
                                                    logger:debug("自身排序:~w",
                                                                 [{SelfIndex,
                                                                   GroupNum,
                                                                   TargetIndex}],
                                                                 gods_duel_role,
                                                                 1062),
                                                    TargetRank = (TargetIndex -
                                                                      1)
                                                                     * 32
                                                                     + GroupNum,
                                                    Fun = fun (Itr =
                                                                   #gods_duel_team{team_group_256
                                                                                       =
                                                                                       Rank},
                                                               _Rtn)
                                                                  when Rank =:=
                                                                           TargetRank ->
                                                                  Itr;
                                                              (_, Rtn) -> Rtn
                                                          end,
                                                    case lists:foldl(Fun,
                                                                     false,
                                                                     GroupTeamList)
                                                        of
                                                        false ->
                                                            {2,
                                                             #gods_duel_team{}};
                                                        TeamInfo =
                                                            #gods_duel_team{} ->
                                                            {1, TeamInfo};
                                                        _ ->
                                                            {1,
                                                             #gods_duel_team{}}
                                                    end;
                                                _ -> {1, #gods_duel_team{}}
                                            end;
                                        _ -> {1, #gods_duel_team{}}
                                    end;
                                {2, _Value} -> todo;
                                _ -> {1, #gods_duel_team{}}
                            end;
                        _ -> {1, #gods_duel_team{}}
                    end;
                _ -> {1, #gods_duel_team{}}
            end;
        false -> {1, #gods_duel_team{}}
    end.

get_final_match_enemy(#role{id = RoleId,
                            m_gods_duel = #m_gods_duel{team_id = TeamId}},
                      MatchRound) ->
    case gods_duel_team:check_has_team(RoleId) of
        true ->
            case gods_duel_team:lookup(TeamId) of
                {ok, #gods_duel_team{lev = ZoneId}} ->
                    MatchTableList =
                        gods_duel_common:get_gods_duel_match_list(MatchRound),
                    case catch ets:lookup(gods_duel_group_team, ZoneId) of
                        [{_, GroupTeamList}] ->
                            MatchQua =
                                gods_duel_common:get_final_match_qua(MatchRound),
                            case lists:keyfind(TeamId,
                                               #gods_duel_team.id,
                                               GroupTeamList)
                                of
                                #gods_duel_team{team_group_64 = SelfRank} ->
                                    case lists:filter(fun ({_, TeamRankList}) ->
                                                              lists:member(SelfRank,
                                                                           TeamRankList)
                                                      end,
                                                      MatchTableList)
                                        of
                                        [{_, TeamRankList}] ->
                                            MatchTeams = lists:filter(fun
                                                                          (#gods_duel_team{qualification
                                                                                               =
                                                                                               Qua,
                                                                                           id
                                                                                               =
                                                                                               Id,
                                                                                           team_group_64
                                                                                               =
                                                                                               Rank}) ->
                                                                              case
                                                                                  MatchRound
                                                                                  of
                                                                                  6 ->
                                                                                      (Qua
                                                                                           =:=
                                                                                           8
                                                                                           orelse
                                                                                           Qua
                                                                                               =:=
                                                                                               9
                                                                                               orelse
                                                                                               Qua
                                                                                                   =:=
                                                                                                   10)
                                                                                          andalso
                                                                                          lists:member(Rank,
                                                                                                       TeamRankList)
                                                                                              andalso
                                                                                              Id
                                                                                                  =/=
                                                                                                  TeamId;
                                                                                  7 ->
                                                                                      (Qua
                                                                                           =:=
                                                                                           11
                                                                                           orelse
                                                                                           Qua
                                                                                               =:=
                                                                                               12
                                                                                               orelse
                                                                                               Qua
                                                                                                   =:=
                                                                                                   13)
                                                                                          andalso
                                                                                          lists:member(Rank,
                                                                                                       TeamRankList)
                                                                                              andalso
                                                                                              Id
                                                                                                  =/=
                                                                                                  TeamId;
                                                                                  _ ->
                                                                                      Qua
                                                                                          >=
                                                                                          MatchQua
                                                                                          andalso
                                                                                          lists:member(Rank,
                                                                                                       TeamRankList)
                                                                                              andalso
                                                                                              Id
                                                                                                  =/=
                                                                                                  TeamId
                                                                              end
                                                                      end,
                                                                      GroupTeamList),
                                            case MatchTeams of
                                                [TeamInfo =
                                                     #gods_duel_team{}] ->
                                                    {1, TeamInfo};
                                                _ -> {2, #gods_duel_team{}}
                                            end;
                                        _Err -> {1, #gods_duel_team{}}
                                    end;
                                _ -> {1, #gods_duel_team{}}
                            end;
                        _ -> {1, #gods_duel_team{}}
                    end;
                _ -> {1, #gods_duel_team{}}
            end;
        _ -> {1, #gods_duel_team{}}
    end;
get_final_match_enemy(_, _) -> {1, #gods_duel_team{}}.

check_vote([], _Role, _Args) -> true;
check_vote([Type | Rest], Role, Args) ->
    case check_vote(Type, Role, Args) of
        true -> check_vote(Rest, Role, Args);
        {true, NewArgs} -> check_vote(Rest, Role, NewArgs);
        {false, Reason} -> {false, Reason}
    end;
check_vote(has_done, #role{id = RoleId}, _Args) ->
    SeasonId = gods_duel_common:get_season_id(),
    SeasonStatus = gods_duel_common:get_season_status(),
    MatchRound = case
                     gods_duel_common:get_match_index(SeasonStatus)
                     of
                     {_, _MatchRound} -> _MatchRound;
                     _ -> 0
                 end,
    case SeasonStatus =:= 24 orelse
             SeasonStatus =:= 26 orelse
                 SeasonStatus =:= 28 orelse SeasonStatus =:= 30
        of
        true ->
            case ets:lookup(gods_duel_vote, RoleId) of
                [#gods_duel_vote{season = SeasonId,
                                 choices = [_ | _] = Choices}] ->
                    case [true
                          || #gods_duel_vote_choice{match_round =
                                                        VoteMatchRound}
                                 <- Choices,
                             VoteMatchRound =:= MatchRound]
                        of
                        [_ | _] -> {false, lang:get("您已经进行过投票了")};
                        _ -> true
                    end;
                _ -> true
            end;
        false -> {false, lang:get("当前时间不能进行投票")}
    end.

repair_push_all() ->
    Fun = fun (GTeam = #gods_duel_team{qualification = Qua},
               Rtn)
                  when Qua >= 3 ->
                  [GTeam | Rtn];
              (_, Rtn) -> Rtn
          end,
    lists:foreach(fun (ZoneId) ->
                          case ets:lookup(gods_duel_group_team, ZoneId) of
                              [{_, GroupTeamList}] ->
                                  Qua64TeamList = lists:foldl(Fun,
                                                              [],
                                                              GroupTeamList),
                                  role_group:pack_send(world,
                                                       17925,
                                                       {ZoneId, Qua64TeamList});
                              _ -> ok
                          end
                  end,
                  [1, 2, 3, 4, 5, 6]).

levup(Role = #role{id = RoleId, name = RoleName,
                   m_lev_break = #m_lev_break{times = BreakTimes}},
      Lev) ->
    case ets:lookup(gods_duel_team_role_ids, RoleId) of
        [{_, TeamId}] ->
            case env:get(gods_season_status) >= 3 of
                true ->
                    case gods_duel_team:lookup(TeamId) of
                        {ok,
                         #gods_duel_team{lev = Group, name = TeamName,
                                         members = Members}} ->
                            LevMax = gods_duel_common:get_group_lev_max(Group,
                                                                        BreakTimes),
                            Title = lang:get("诸神之战等级提醒"),
                            GroupName = gods_duel_team:get_group_name(Group),
                            Content =
                                notice:format(lang:get("亲爱的~ts参赛者，您正在参与的是诸神之战~ts），若比赛期间等级超出~ts级，将失去参赛"
                                                       "资格，敬请留意，祝您在诸神比赛中旗开得胜！"),
                                              [{string_2, 1, lang:get("诸神之战")},
                                               {string_2, 1, GroupName},
                                               {string_2, 5, LevMax}]),
                            mail:send(RoleId, Title, Content),
                            case Lev > LevMax of
                                true ->
                                    Args = #{team_name => TeamName,
                                             group_name => GroupName,
                                             role_name => RoleName},
                                    NMembers = lists:keydelete(RoleId,
                                                               #team_mate.id,
                                                               Members),
                                    gods_duel_team:send_mail(teammate_levup,
                                                             NMembers,
                                                             Args);
                                _ -> ignort
                            end;
                        _ -> ignort
                    end;
                _ -> ignort
            end;
        _ -> ignort
    end,
    Role.

push_gods_duel_time(Role, SeasonID) ->
    TimeCfg =
        gods_duel_common:get_client_time_config(SeasonID,
                                                1,
                                                34,
                                                []),
    role:link_send(Role, 17933, {SeasonID, TimeCfg}).

push_gods_lev_info(Role) ->
    LevList = gods_duel_data:get_all_lev(),
    Lev_Info = [begin
                    #{lev_id := LevId, lev_name := LevName,
                      star_num := StarNum, need_score := NeedScore,
                      item_list := RewardList, badge_id := BadgeId} =
                        gods_duel_data:get_gods_lev(LevId),
                    {LevId,
                     LevName,
                     StarNum,
                     NeedScore,
                     RewardList,
                     BadgeId}
                end
                || LevId <- LevList],
    role:link_send(Role, 17934, {Lev_Info}).

callback(Role = #role{m_gods_duel =
                          MGodsDuel = #m_gods_duel{}},
         {caculate_gods_duel_score, NewGodsScore}) ->
    NMGodsDuel = MGodsDuel#m_gods_duel{gods_score =
                                           NewGodsScore},
    NRole = Role#role{m_gods_duel = NMGodsDuel},
    NRole2 = role_trigger:fire(#evt_gods_duel_score{score =
                                                        NewGodsScore},
                               NRole),
    {ok, NRole2};
callback(_, _Info) ->
    logger:error("未知回调 ~w", [_Info], gods_duel_role, 1248),
    ok.

rpc_team_rank_info(TeamId, GroupId) ->
    case catch ets:lookup(gods_duel_team_rank,
                          gods_duel_team_rank)
        of
        [#gods_duel_team_rank{serial_id = SeasonId,
                              history_season_info = HisInfo}] ->
            case lists:keyfind(SeasonId, 1, HisInfo) of
                {_, TeamList} ->
                    case lists:keyfind(GroupId, 1, TeamList) of
                        false -> false;
                        {GroupId, GroupTeam} ->
                            case lists:keyfind(TeamId,
                                               #gods_duel_team_rank_data.id,
                                               GroupTeam)
                                of
                                #gods_duel_team_rank_data{name = Name,
                                                          members = Members} ->
                                    {ok, Name, Members};
                                _ -> false
                            end
                    end;
                _ -> false
            end;
        _ -> false
    end.

gm_add_assets_godswar(Role = #role{assets =
                                       Assets = #assets{godswar = GodsWar}},
                      Num) ->
    NAssets = Assets#assets{godswar = GodsWar + Num},
    Role#role{assets = NAssets}.

