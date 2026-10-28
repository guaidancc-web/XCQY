-file("src/mod/campaign/camp_zillionaire.erl", 1).

-module(camp_zillionaire).

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

-file("src/mod/campaign/camp_zillionaire.erl", 11).

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

-file("src/mod/campaign/camp_zillionaire.erl", 12).

-file("inc/camp_zillionaire.hrl", 1).

-record(m_camp_zillionaire,
        {ver = 1,
         camp_id = 0,
         grid_index = 0,
         times = 0,
         lucky_dice = 0,
         event_id = 0,
         ring_times = 0,
         ring_rewards = [],
         guarantee = []}).

-record(camp_zillionaire_event,
        {name = "", event_id = 0, items = []}).

-file("src/mod/campaign/camp_zillionaire.erl", 13).

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

-file("src/mod/campaign/camp_zillionaire.erl", 14).

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

-file("src/mod/campaign/camp_zillionaire.erl", 15).

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

-file("src/mod/campaign/camp_zillionaire.erl", 16).

-file("inc/quest.hrl", 1).

-file("inc/quest_king.hrl", 1).

-record(quest_king,
        {ver = 1,
         stage = 1,
         finish = [],
         doing = [],
         rf_times = 0}).

-file("inc/quest.hrl", 36).

-record(quest_data,
        {id = 1 :: pos_integer(),
         phase = 1 :: pos_integer(),
         quest_line = 1,
         type = 1 :: pos_integer(),
         sec_type = 1 :: pos_integer(),
         name = "" :: list(),
         mode = 1 :: pos_integer(),
         leader_cond = [] :: [tuple()],
         is_leader_quest = 0 :: 0 | 1,
         can_giveup = 0 :: 0..1,
         lev = 1 :: pos_integer(),
         lev_break_min_times = 0 :: non_neg_integer(),
         lev_break_max_times = 0 :: non_neg_integer(),
         max_lev = 0 :: non_neg_integer(),
         auto_finished_lev = 0 :: non_neg_integer(),
         classes = 0 :: 0..4,
         pre_quest ::
             undefined | non_neg_integer() | [non_neg_integer()],
         check_distance = 0 :: 0..1,
         npc_accept_battle = 0 :: non_neg_integer(),
         npc_accept_id = 0 :: non_neg_integer(),
         npc_accept = 0 :: non_neg_integer(),
         npc_commit_battle = 0 :: non_neg_integer(),
         npc_commit_id = 0 :: non_neg_integer(),
         npc_commit = 0 :: non_neg_integer(),
         start_time = 0 ::
             tuple() | non_neg_integer() | undefined,
         end_time = 0 :: tuple() | non_neg_integer() | undefined,
         condition = [] :: [tuple()],
         progress = [] :: [tuple()],
         rewards_accept = [] :: [tuple()],
         rewards_commit = [] :: [tuple()],
         commit_loss = [] :: [tuple()],
         rewards_vip = [] :: [tuple()],
         action_accept = [] :: [tuple()],
         action_commit = [] :: [tuple()],
         times = 1 :: non_neg_integer(),
         desc = "" :: list(),
         auto_accept = 0 :: 0..1,
         is_auto_finished_gain = 0 :: 0..1,
         weekdays = [] :: [pos_integer()],
         white_list = [] :: list(),
         black_list = [] :: list(),
         notice_msg = "" :: list(),
         val_from_prev = 0 :: 0..1,
         honor = 0 :: non_neg_integer(),
         ach_num = 0 :: non_neg_integer(),
         rewards_badge = 0 :: non_neg_integer(),
         day = 0 :: non_neg_integer(),
         extra = []}).

-record(quest_extra_data,
        {name = 0, classes = 0, val1 = 0, val2 = 0, list = []}).

-record(quest_classes,
        {quest_id = 0,
         first_time = 0,
         ring = 1,
         round = 0,
         total_count = 0,
         done_list = []}).

-record(quest_offer,
        {quest_id = 0,
         day_count = 0,
         leader_count = 0,
         leader_quest_count = 0,
         round = 0,
         total_count = 0,
         team_args = []}).

-record(quest_treasure,
        {quest_id = 0, round = 0, total_count = 0}).

-record(quest_guild,
        {quest_id = 0,
         last_accepted = 0,
         ring = 1,
         round = 0,
         total_count = 0,
         done_list = []}).

-record(quest_chain,
        {quest_id = 0,
         accept_time = 0,
         type = 0,
         ext_data = [],
         round = 0,
         total_count = 0,
         commit_npc}).

-record(quest_marriage,
        {quest_id = 0,
         type = 0,
         sec_type = 0,
         round = 0,
         total_count = 0,
         ext_data = quest_marriage:quest_ext_data()}).

-record(quest_couple,
        {quest_id = 0,
         type = 0,
         sec_type = 0,
         round = 0,
         total_count = 0,
         partner_id,
         ext_data = quest_couple:quest_ext_data()}).

-record(quest_prac,
        {part = 1, chapter = 2, section = 0}).

-record(quest_plant,
        {quest_id = 0,
         last_accepted = 0,
         last_commited = 0,
         round = 0,
         unit_id = 0,
         phase = 0,
         pos = {0, 0, 0},
         done_list = []}).

-record(quest_teacher,
        {quest_id = 0,
         type = 0,
         sec_type = 0,
         partner_id,
         round = 0,
         total_count = 0,
         stats = [],
         ext_data = quest_teacher:quest_ext_data()}).

-record(quest_shipping, {list = []}).

-record(quest_pursue,
        {quest_id = 0,
         last_accepted = 0,
         round_started = 0,
         ring = 1,
         round = 0,
         total_count = 0,
         done_list = []}).

-record(quest_child,
        {quest_id = 0,
         last_accepted = 0,
         last_commited = 0,
         round = 0,
         mode = 1,
         unit_id = 0,
         done_list = []}).

-record(quest_pregnancy,
        {quest_id = 0,
         last_accepted = 0,
         last_commited = 0,
         round = 0,
         mode = 1,
         done_list = []}).

-record(quest_acquaintance,
        {quest_id = 0,
         last_accepted = 0,
         last_commited = 0,
         round = 0,
         partner_id = 0,
         partner_name = "",
         done_list = [],
         ring = 0,
         rpc_accepted = 0}).

-record(quest_summer,
        {ver = 1,
         finish = [],
         doing = [],
         score = 0,
         rewarded = []}).

-record(quest_single_dog,
        {ver = 1, finish = [], round = 1, extra = #{}}).

-record(quest_sign_draw, {finish = [], doing = []}).

-record(quest_score_exchange,
        {finish = [], doing = []}).

-record(quest_long_active, {finish = [], doing = []}).

-record(m_quest,
        {ver = 19,
         quest = [] :: list(),
         acceptable = [] :: list(),
         finished = [] :: list(),
         day_finished = [],
         quest_classes = #quest_classes{} :: #quest_classes{},
         quest_offer = #quest_offer{} :: #quest_offer{},
         quest_prac = #quest_prac{} :: #quest_prac{},
         quest_treasure = #quest_treasure{},
         quest_guild = #quest_guild{},
         quest_chain = #quest_chain{},
         quest_marriage = #quest_marriage{},
         quest_couple = #quest_couple{},
         quest_plant = #quest_plant{},
         quest_teacher = #quest_teacher{},
         quest_shipping = #quest_shipping{},
         quest_pursue = #quest_pursue{},
         quest_line = 2,
         quest_child = #quest_child{},
         quest_pregnancy = #quest_pregnancy{},
         quest_acquaintance = #quest_acquaintance{},
         quest_king = #quest_king{},
         quest_summer = #quest_summer{},
         quest_single_dog = #quest_single_dog{},
         quest_sign_draw = #quest_sign_draw{},
         quest_score_exchange = #quest_score_exchange{},
         quest_long_active = #quest_long_active{}}).

-record(quest,
        {id = 1 :: pos_integer(),
         name = "" :: binary(),
         type = 1 :: pos_integer(),
         sec_type = 1 :: pos_integer(),
         finish = 0 :: 0..2,
         quality = 0 :: 0..4,
         progress = [] :: [tuple()],
         accept_time = 0 :: non_neg_integer(),
         end_time = 0 :: non_neg_integer(),
         finish_time = 0 :: non_neg_integer(),
         round = 0 :: non_neg_integer()}).

-record(quest_progress,
        {id = 0 :: non_neg_integer(),
         label :: undefined | atom(),
         target = 0 :: non_neg_integer(),
         param = [] :: list(),
         finish = 0 :: 0..1,
         trigger :: undefined | tuple(),
         target_val = 1 :: pos_integer(),
         value = 0 :: non_neg_integer(),
         msg = "" :: bitstring() | string(),
         ext_data = [] :: [tuple()],
         dyn_ext_data = [] :: [tuple()]}).

-record(quest_rewards,
        {prob = 1000 :: pos_integer(),
         classes = 0 :: 0..4,
         gain :: undefined | tuple(),
         action :: undefined | function()}).

-record(quest_stats,
        {sec_type = 1, stats = [], desc = []}).

-file("src/mod/campaign/camp_zillionaire.erl", 17).

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

-file("src/mod/campaign/camp_zillionaire.erl", 18).

-file("inc/campaign.hrl", 1).

-record(campaign_eggs,
        {ver = 0,
         location = 0 :: non_neg_integer(),
         footprints = [],
         last_moved = 0 :: non_neg_integer(),
         rolled = 0 :: non_neg_integer(),
         rewarded = []}).

-record(camp_login,
        {camp_id = 0,
         m_time = 0,
         num = 0,
         days = [],
         buys = []}).

-record(camp_login_data,
        {day = 0, reward = [], buys = [], cost = []}).

-record(camp_login_buy_data,
        {id = 0, reward = [], cost = [], cd = 0}).

-record(campaign_bags,
        {ver = 0,
         collected = [],
         last_filled = 0 :: non_neg_integer(),
         rewarded = 0}).

-record(campaign_card,
        {ver = 0,
         card_ver = 0,
         init = 0,
         times = 0,
         card_list = []}).

-record(campaign_card_open,
        {ver = 0,
         card_ver = 0,
         times = 0,
         init = 0,
         card_list = []}).

-record(camp_wish_flower,
        {ver = 1,
         floor = 1,
         times = 0,
         all_times = 0,
         camp_id = 0}).

-record(camp_new_flop,
        {ver = 1,
         group = 0,
         times = 0,
         rewarded = [],
         camp_id = 0}).

-record(camp_consume_rebate,
        {ver = 1, limit_item = []}).

-record(camp_new_acc_charge,
        {ver = 1, charge_val = 0, get_reward = []}).

-record(camp_charge_seven_gift,
        {ver = 1, id = 0, buy_time = 0, can_reward = []}).

-record(camp_lucky_tree,
        {id = 0,
         times = 0,
         reward_list = [],
         delay_reward = []}).

-record(camp_long_active,
        {ver = 1,
         id = 0,
         lev = 0,
         token_list = [],
         reward_levs = [],
         week_box = 0,
         last_reset_time = 0}).

-record(m_campaign,
        {ver = 27,
         acc = [] :: list(),
         can_reward = [] :: list(),
         rewarded = [] :: list(),
         eggs = #campaign_eggs{},
         bags = #campaign_bags{},
         first_charge_double = [],
         camp_login = #camp_login{},
         hide_seek,
         login_roll,
         recharge = camp_series_recharge:init(),
         camp_card = #campaign_card{},
         wish_times = 0,
         camp_limit = [],
         camp_card_open = #campaign_card_open{},
         recharge_open = camp_series_recharge_open:init(),
         camp_wish_flower = #camp_wish_flower{},
         camp_doll = camp_doll:init(),
         camp_sign,
         camp_exchange,
         camp_animal_chess,
         camp_new_flop = #camp_new_flop{},
         multiplex_assert = 0,
         camp_consume_rebate = camp_consume_rebate:init(),
         camp_black_white_chess =
             camp_black_white_chess_mgr:init(),
         camp_scratch_card = camp_scratch_card:init(),
         camp_new_acc_charge = camp_new_acc_charge:init(),
         camp_charge_seven_gift = camp_charge_seven_gift:init(),
         camp_lucky_tree = camp_lucky_tree:init(),
         camp_long_active = camp_long_active:init(),
         gift_custom = camp_gift_custom:init()}).

-record(campaign_handle,
        {time = 0 :: non_neg_integer(),
         evt = {evt_rpc} :: tuple(),
         call_from = rpc :: evt | rpc,
         add_can_reward = 0 :: non_neg_integer(),
         camp :: undefined | tuple(),
         camp_info :: undefined | tuple(),
         push_list = [] :: [tuple()],
         push_cli = 0 :: 0..1,
         rpc_reward_num = 1 :: non_neg_integer(),
         return_acc = 0}).

-record(camp_collection,
        {camp_end_time = 0,
         reward_list = [],
         extra_data = [],
         random_index,
         red_dot}).

-record(camp_ico,
        {id = 0 :: non_neg_integer(),
         ico_id = 0 :: non_neg_integer(),
         name = "",
         is_show = 0 :: 0..1,
         start_time = 0 :: non_neg_integer() | tuple(),
         end_time = 0 :: non_neg_integer() | tuple(),
         white_list = [] :: list(),
         black_list = [] :: list(),
         min_open_time = 0 :: non_neg_integer() | tuple(),
         max_open_time = 0 :: non_neg_integer() | tuple()}).

-record(camp_cfg,
        {id = 0 :: non_neg_integer(),
         name = "" :: bitstring(),
         group_id = 0 :: non_neg_integer(),
         start_time = 0 :: non_neg_integer() | tuple(),
         end_time = 0 :: non_neg_integer() | tuple(),
         cli_start_time = 0 :: non_neg_integer() | tuple(),
         cli_end_time = 0 :: non_neg_integer() | tuple(),
         type = 0 :: pos_integer(),
         sec_type = 0 :: non_neg_integer(),
         status = 1 :: 0..1,
         reward_type = 2 :: pos_integer(),
         settlement = 2 :: non_neg_integer(),
         reward_title = "" :: bitstring(),
         reward_content = "" :: bitstring(),
         loss_items = [] :: list(),
         auto_buy = 0,
         reward = [] :: list(),
         camp_cond :: undefined | tuple(),
         reward_max = 1 :: non_neg_integer(),
         white_list = [] :: list(),
         black_list = [] :: list(),
         min_open_time = 0 :: non_neg_integer() | tuple(),
         max_open_time = 0 :: non_neg_integer() | tuple(),
         finish_id = 0 :: non_neg_integer(),
         finish_days = 0 :: non_neg_integer(),
         finish_end_days = 0 :: non_neg_integer(),
         cond_reward = [],
         merge_min = 0,
         merge_max = 0,
         is_keep_time = 0}).

-record(camp_cache,
        {id = 0 :: non_neg_integer(),
         sec_type = 0 :: non_neg_integer(),
         is_srv_open = 0 :: 0..1,
         start_time = 0 :: non_neg_integer(),
         end_time = 0 :: non_neg_integer(),
         cli_start_time = 0 :: non_neg_integer(),
         cli_end_time = 0 :: non_neg_integer()}).

-record(camp_unit,
        {id = {0, 0}, base_id = 0, map_id = 0}).

-record(camp_time,
        {id = 0, start_time = 0, end_time = 0}).

-record(camp_item,
        {item = 0,
         start_time = 0,
         end_time = 0,
         open = 0,
         msg = 0}).

-record(camp_assets_data,
        {type = 0, items = [], max = 0, var_type = day}).

-record(camp_gift_custom,
        {ver = 1,
         camp_id = 0,
         gift = [],
         buy = [],
         extra_reward = 0}).

-file("src/mod/campaign/camp_zillionaire.erl", 19).

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

-file("src/mod/campaign/camp_zillionaire.erl", 20).

-export([init/0,
         login/1,
         reload/0,
         zero_flush/1,
         commit/2,
         apply_handle_event/1,
         gm_set_ring_times/2,
         gm_set_lucky_dics/2]).

-export([rpc_throw_dice/1,
         rpc_throw_lucky_dice/2,
         rpc_get_ring_reward/2,
         rpc_active_event/2,
         push/1,
         push/2]).

init() -> #m_camp_zillionaire{}.

login(Role = #role{m_camp_zillionaire =
                       #m_camp_zillionaire{camp_id = CampId}}) ->
    case get_camp_id() =/= CampId of
        true -> reset(Role);
        _ -> ok
    end.

reload() ->
    role_group:apply(world,
                     {camp_zillionaire, zero_flush, []}).

zero_flush(Role = #role{m_camp_zillionaire =
                            #m_camp_zillionaire{camp_id = CampId}}) ->
    case get_camp_id() =/= CampId of
        true -> reset(Role);
        _ -> {ok, Role}
    end.

commit(Role, _QuestId) -> {ok, Role}.

apply_handle_event(Role = #role{m_camp_zillionaire =
                                    #m_camp_zillionaire{event_id = EventId}})
    when EventId =/= 0 ->
    case handle_throw_event(Role) of
        {ok, NewRole} ->
            push(NewRole),
            {ok, NewRole};
        {false, Reason} ->
            logger:error("大富翁活动激活时间失败:~ts",
                         [Reason],
                         camp_zillionaire,
                         76),
            ok;
        ok -> ok
    end;
apply_handle_event(_Role) -> ok.

reset(Role = #role{m_camp_zillionaire =
                       MCampZll = #m_camp_zillionaire{}}) ->
    CampId = get_camp_id(),
    NewRole = Role#role{m_camp_zillionaire =
                            MCampZll#m_camp_zillionaire{camp_id = CampId,
                                                        grid_index = 0,
                                                        times = 0,
                                                        lucky_dice = 0,
                                                        event_id = 0,
                                                        ring_times = 0,
                                                        ring_rewards = [],
                                                        guarantee = []}},
    {ok, NewRole}.

gm_set_ring_times(Role = #role{m_camp_zillionaire =
                                   MCampZll},
                  Val) ->
    NewRole = Role#role{m_camp_zillionaire =
                            MCampZll#m_camp_zillionaire{ring_times = Val}},
    {ok, NewRole}.

gm_set_lucky_dics(Role = #role{m_camp_zillionaire =
                                   MCampZll},
                  Val) ->
    NewRole = Role#role{m_camp_zillionaire =
                            MCampZll#m_camp_zillionaire{lucky_dice = Val}},
    {ok, NewRole}.

rpc_throw_dice(Role) ->
    Args = #{dics_type => normal},
    case check_throw([reset,
                      combat,
                      limit_times,
                      camp_status,
                      quest,
                      event],
                     Role,
                     Args)
        of
        {ok, CheckRole, _NewArgs} ->
            Cost = camp_zillionaire_data:get_key_val(1),
            Loss = format:val_to_loss(Cost),
            case role_gain:do_notice(Loss, CheckRole) of
                {ok, LossRole} ->
                    case dice_result(LossRole, normal) of
                        {ok, DiceRole} ->
                            Timer = #timer{id = camp_zillionaire_active_event,
                                           timeout = 5000, times = 1,
                                           m = camp_zillionaire,
                                           f = apply_handle_event, a = []},
                            TimerRole = role_timer:add(Timer, DiceRole),
                            NewRole = TimerRole,
                            {ok, NewRole};
                        {false, Reason} -> {false, Reason}
                    end;
                {false, #loss{msg = Msg}} -> {false, Msg};
                _ -> {false, lang:get("资源不足")}
            end;
        {false, Reason} -> {false, Reason};
        {false, Reason, ErrCode} -> {false, Reason, ErrCode}
    end.

rpc_active_event(Role, _Flag) ->
    case check_active_event([cancel_timer, event],
                            Role,
                            #{})
        of
        {ok,
         CheckRole = #role{m_camp_zillionaire =
                               #m_camp_zillionaire{event_id = EventId}},
         _Args} ->
            case handle_throw_event(CheckRole) of
                {ok, EventRole} ->
                    NewRole = case camp_zillionaire_data:get_event(EventId)
                                  of
                                  #{event_type := _EventType} -> EventRole;
                                  _ -> EventRole
                              end,
                    {ok, NewRole, EventId};
                {false, Reason} -> {false, Reason}
            end;
        {false, Reason} -> {false, Reason}
    end.

rpc_throw_lucky_dice(Role, Result) ->
    Args = #{dics_type => lucky_dice},
    case check_throw([reset,
                      combat,
                      camp_status,
                      quest,
                      event,
                      lucky_dice],
                     Role,
                     Args)
        of
        {ok, CheckRole, _NewArgs} ->
            case dice_result(CheckRole, Result) of
                {ok, NewRole = #role{}} ->
                    push(NewRole, 20450),
                    {ok, NewRole};
                {false, Reason} -> {false, Reason}
            end;
        {false, Reason} -> {false, Reason};
        {false, Reason, ErrCode} -> {false, Reason, ErrCode}
    end.

rpc_get_ring_reward(Role = #role{name = RoleName,
                                 m_camp_zillionaire =
                                     MCampZll = #m_camp_zillionaire{ring_rewards
                                                                        =
                                                                        RingRewards}},
                    Ring) ->
    case check_ring_reward([complete, have],
                           Role,
                           #{ring => Ring})
        of
        {ok, CheckRole, _} ->
            case camp_zillionaire_data:get_ring_reward(Ring) of
                RingCfg = #{rewards := Items,
                            is_hearsay := IsHearsay} ->
                    case IsHearsay of
                        1 ->
                            case RingCfg of
                                #{hearsay_msg := HearsayMsg} ->
                                    HearsayItems = [{ItemId, Count}
                                                    || {ItemId, _B, Count, _Eff}
                                                           <- Items],
                                    NoticeMsg = notice:format(HearsayMsg,
                                                              [{role_2,
                                                                RoleName},
                                                               {item_2,
                                                                HearsayItems}]),
                                    notice:cast(all, 5, NoticeMsg),
                                    ok;
                                _ -> ok
                            end;
                        _ -> ok
                    end,
                    NewRingRewards = [Ring | RingRewards],
                    RingRole = Role#role{m_camp_zillionaire =
                                             MCampZll#m_camp_zillionaire{ring_rewards
                                                                             =
                                                                             NewRingRewards}},
                    RewardItems = [{ItemId, Bind, Count}
                                   || {ItemId, Bind, Count, _Eff} <- Items],
                    Gain = format:val_to_gain(RewardItems),
                    case role_gain:do_notice(Gain, RingRole) of
                        {ok, GainRole} ->
                            push(GainRole, 20450),
                            {ok, GainRole};
                        _ ->
                            Title = lang:get("轮回奖励"),
                            Content = lang:get("您领取轮回奖励的时候背包已满,奖励通过邮件发放,请查收"),
                            mail:send(CheckRole, Title, Content, RewardItems),
                            push(RingRole, 20450),
                            {ok, RingRole}
                    end;
                _ -> {false, lang:get("暂无法领取轮回奖励,请稍后")}
            end;
        {false, Reason} -> {false, Reason}
    end.

push(Role = #role{m_camp_zillionaire = M}) ->
    logger:debug("推送20444:======:~w",
                 [M],
                 camp_zillionaire,
                 218),
    role:pack_send(Role, 20444, {M}).

push(Role = #role{m_camp_zillionaire = M},
     _Cmd = 20450) ->
    role:pack_send(Role, 20450, {M});
push(Role, _Cmd = 20449) ->
    case env:get(camp_zillionaire_reward_record) of
        L = [_ | _] -> role:pack_send(Role, 20449, {L});
        _ -> role:pack_send(Role, 20449, {[]})
    end.

check_throw([], Role, _Args) -> {ok, Role, _Args};
check_throw([reset | Rest],
            Role = #role{m_camp_zillionaire =
                             #m_camp_zillionaire{camp_id = CampId}},
            _Args) ->
    case CampId =/= get_camp_id() of
        true ->
            logger:debug("=======:~w",
                         [CampId],
                         camp_zillionaire,
                         240),
            {ok, NewRole} = reset(Role),
            check_throw(Rest, NewRole, _Args);
        false -> check_throw(Rest, Role, _Args)
    end;
check_throw([camp_status | Rest], Role, _Args) ->
    Now = date:unixtime2(),
    case campaign_mgr:get_camp_time(60048) of
        {StartT, EndT} when Now >= StartT andalso Now < EndT ->
            check_throw(Rest, Role, _Args);
        _ -> {false, lang:get("活动还未开始")}
    end;
check_throw([limit_times | Rest],
            Role = #role{m_camp_zillionaire =
                             #m_camp_zillionaire{times = Times}},
            _Args) ->
    case camp_zillionaire_data:get_key_val(4) of
        LimitTimes
            when is_integer(LimitTimes) andalso
                     Times >= LimitTimes ->
            Msg = notice:format(lang:get("每日限制投掷~ts,请明日再来"),
                                [{string_2, 5, LimitTimes}]),
            {false, Msg};
        _ -> check_throw(Rest, Role, _Args)
    end;
check_throw([combat | _Rest],
            #role{m_combat = #m_combat{pid = Pid}}, _Args)
    when is_pid(Pid) ->
    {false, lang:get("战斗中不能投骰子")};
check_throw([event | _Rest],
            #role{m_camp_zillionaire =
                      #m_camp_zillionaire{event_id = EventId}},
            _Args)
    when EventId =/= 0 ->
    ErrCode = 2,
    {false, lang:get("正在移动中,请稍后"), ErrCode};
check_throw([quest | Rest], Role, _Args) ->
    case check_event_quest(Role) of
        {false, Reason} -> {false, Reason};
        _ -> check_throw(Rest, Role, _Args)
    end;
check_throw([lucky_dice | Rest],
            Role = #role{m_camp_zillionaire =
                             MCampZll = #m_camp_zillionaire{lucky_dice =
                                                                LuckyDice}},
            _Args) ->
    logger:debug("==========:~w",
                 [LuckyDice],
                 camp_zillionaire,
                 275),
    case LuckyDice > 0 of
        true ->
            NewRole = Role#role{m_camp_zillionaire =
                                    MCampZll#m_camp_zillionaire{lucky_dice =
                                                                    LuckyDice -
                                                                        1}},
            check_throw(Rest, NewRole, _Args);
        _ -> {false, lang:get("幸运骰子不足,无法投掷")}
    end;
check_throw([_ | Rest], Role, Args) ->
    check_throw(Rest, Role, Args).

check_event_quest(Role) ->
    case quest:get_id_by_sectype(Role, quest, 33) of
        0 -> true;
        _ -> {false, lang:get("请先完成任务后再投掷")}
    end.

dice_result(Role = #role{m_camp_zillionaire =
                             MCampZll = #m_camp_zillionaire{grid_index =
                                                                GridIndex,
                                                            ring_times =
                                                                RingTimes,
                                                            times = Times}},
            DiceType) ->
    {RandList, GuaranteeIndex, GuaranteeInfo1} =
        get_rand_list(Role, DiceType),
    logger:debug("==========:~w",
                 [{RandList, GuaranteeIndex}],
                 camp_zillionaire,
                 297),
    case util:rand_list(RandList, ratio) of
        #{event := Events, index := Index} ->
            EventId = case util:rand_list(Events, 2) of
                          {_EventId, _} -> _EventId;
                          _ -> 1
                      end,
            NewGuaranteeInfo = case Index =:= GuaranteeIndex of
                                   true ->
                                       update_guarantee(GuaranteeInfo1, Index);
                                   false -> GuaranteeInfo1
                               end,
            NewRingTimes = case Index < GridIndex of
                               true when DiceType =/= backwards ->
                                   RingTimes + 1;
                               _ -> RingTimes
                           end,
            NewRole = Role#role{m_camp_zillionaire =
                                    MCampZll#m_camp_zillionaire{guarantee =
                                                                    NewGuaranteeInfo,
                                                                event_id =
                                                                    EventId,
                                                                grid_index =
                                                                    Index,
                                                                ring_times =
                                                                    NewRingTimes,
                                                                times =
                                                                    Times + 1}},
            push(NewRole),
            logger:debug("原点:~w,目标点:~w",
                         [GridIndex, Index],
                         camp_zillionaire,
                         319),
            {ok, NewRole};
        _Err ->
            logger:error("错误的奖励库:~w",
                         [_Err],
                         camp_zillionaire,
                         322),
            {false, lang:get("当前无法投掷")}
    end.

get_guarantee(RandList) ->
    case [Index
          || #{index := Index, is_guarantee := IsGuarantee}
                 <- RandList,
             IsGuarantee =:= 1]
        of
        [Index | _] -> Index;
        _ -> 0
    end.

update_guarantee(GuaranteeInfo, Index) ->
    case lists:keyfind(Index, 1, GuaranteeInfo) of
        {_, Times} ->
            lists:keystore(Index,
                           1,
                           GuaranteeInfo,
                           {Index, Times + 1});
        _ -> [{Index, 1} | GuaranteeInfo]
    end.

handle_throw_event(Role = #role{name = RoleName,
                                m_camp_zillionaire =
                                    MCampZll = #m_camp_zillionaire{grid_index =
                                                                       LastIndex,
                                                                   lucky_dice =
                                                                       LuckyDice,
                                                                   event_id =
                                                                       EventId}})
    when EventId =/= 0 ->
    case camp_zillionaire_data:get_event(EventId) of
        EventCfg = #{event_type := npc_talk,
                     args := [_NpcId, Items, _Content],
                     is_hearsay := IsHearsay} ->
            Items1 = item_type:special_id(Items),
            case IsHearsay of
                1 ->
                    HearsayItems = [{ItemId, Count}
                                    || {ItemId, 0, Count} <- Items1],
                    EventRec = #camp_zillionaire_event{name = RoleName,
                                                       event_id = EventId,
                                                       items = HearsayItems},
                    update_record_list(EventRec),
                    #{hearsay_msg := HearsayContent} = EventCfg,
                    NoticeMsg = notice:format(HearsayContent,
                                              [{role_2, RoleName},
                                               {item_2, Items1}]),
                    notice:cast(all, 5, NoticeMsg);
                _ -> ok
            end,
            Gain = format:val_to_gain(Items1),
            case role_gain:do_notice(Gain, Role) of
                {ok, GainRole} ->
                    NewRole = GainRole#role{m_camp_zillionaire =
                                                MCampZll#m_camp_zillionaire{event_id
                                                                                =
                                                                                0}},
                    {ok, NewRole};
                _ ->
                    Title = lang:get("欢乐寻宝奖励"),
                    Content = lang:get("由于您获得奖励时背包已满，奖励通过邮件发放给您，请查收"),
                    mail:send(Role, Title, Content, Items),
                    NewRole = Role#role{m_camp_zillionaire =
                                            MCampZll#m_camp_zillionaire{event_id
                                                                            =
                                                                            0}},
                    {ok, NewRole}
            end;
        #{event_type := quest, args := [QuestId]} ->
            logger:debug("接受任务:~w",
                         [QuestId],
                         camp_zillionaire,
                         370),
            CampRole = Role#role{m_camp_zillionaire =
                                     MCampZll#m_camp_zillionaire{event_id = 0}},
            case do_accept(CampRole, QuestId) of
                {ok, QuestRole} -> {ok, QuestRole};
                {error, Reason} ->
                    logger:error("接受任务失败:~w",
                                 [Reason],
                                 camp_zillionaire,
                                 377),
                    {false, Reason};
                {false, Reason} -> {false, Reason}
            end;
        #{event_type := lucky_dice} ->
            NewRole = Role#role{m_camp_zillionaire =
                                    MCampZll#m_camp_zillionaire{lucky_dice =
                                                                    LuckyDice +
                                                                        1,
                                                                event_id = 0}},
            Msg =
                notice:format(lang:get("恭喜你获得~ts, 使用~ts可以自选任意前进步数~ts格"),
                              [{string_2, 1, lang:get("幸运骰子")},
                               {string_2, 1, lang:get("幸运骰子")},
                               {string_2, 1, lang:get("1-6")}]),
            notice:return(Msg),
            push(NewRole, 20450),
            {ok, NewRole};
        #{event_type := ahead} ->
            DiceRole = Role#role{m_camp_zillionaire =
                                     MCampZll#m_camp_zillionaire{event_id = 0}},
            case dice_result(DiceRole, ahead) of
                {ok,
                 ResultRole = #role{m_camp_zillionaire =
                                        #m_camp_zillionaire{grid_index =
                                                                NowIndex}}} ->
                    Result = NowIndex - LastIndex,
                    Msg =
                        notice:format(lang:get("陷入移动魔力，将再前进~ts步哟{face_1,59}"),
                                      [{string_2, 1, Result}]),
                    notice:return(Msg),
                    Timer = #timer{id = camp_zillionaire_active_event,
                                   timeout = 5000, times = 1,
                                   m = camp_zillionaire, f = apply_handle_event,
                                   a = []},
                    TimerRole = role_timer:add(Timer, ResultRole),
                    NewRole = TimerRole,
                    push(NewRole),
                    {ok, NewRole};
                {false, Reason} -> {false, Reason}
            end;
        #{event_type := backwards} ->
            DiceRole = Role#role{m_camp_zillionaire =
                                     MCampZll#m_camp_zillionaire{event_id = 0}},
            case dice_result(DiceRole, backwards) of
                {ok,
                 ResultRole = #role{m_camp_zillionaire =
                                        #m_camp_zillionaire{grid_index =
                                                                NowIndex}}} ->
                    Result = LastIndex - NowIndex,
                    Msg =
                        notice:format(lang:get("陷入移动魔力，将后退~ts步哟{face_1,59}"),
                                      [{string_2, 1, Result}]),
                    notice:return(Msg),
                    Timer = #timer{id = camp_zillionaire_active_event,
                                   timeout = 5000, times = 1,
                                   m = camp_zillionaire, f = apply_handle_event,
                                   a = []},
                    TimerRole = role_timer:add(Timer, ResultRole),
                    NewRole = TimerRole,
                    push(NewRole),
                    {ok, NewRole};
                {false, Reason} -> {false, Reason}
            end;
        EventCfg = #{event_type := item, args := Items,
                     is_hearsay := IsHearsay} ->
            Items1 = item_type:special_id(Items),
            logger:debug("=======================:~w",
                         [IsHearsay],
                         camp_zillionaire,
                         428),
            Gain = format:val_to_gain(Items1),
            case IsHearsay of
                1 ->
                    HearsayItems = [{ItemId, Count}
                                    || {ItemId, 0, Count} <- Items1],
                    EventRec = #camp_zillionaire_event{name = RoleName,
                                                       event_id = EventId,
                                                       items = HearsayItems},
                    update_record_list(EventRec),
                    #{hearsay_msg := HearsayContent} = EventCfg,
                    NoticeMsg = notice:format(HearsayContent,
                                              [{role_2, RoleName},
                                               {item_2, Items1}]),
                    notice:cast(all, 5, NoticeMsg);
                _ -> ok
            end,
            case role_gain:do_notice(Gain, Role) of
                {ok, GainRole} ->
                    NewRole = GainRole#role{m_camp_zillionaire =
                                                MCampZll#m_camp_zillionaire{event_id
                                                                                =
                                                                                0}},
                    {ok, NewRole};
                _ ->
                    Title = lang:get("欢乐寻宝奖励"),
                    MailContent = lang:get("由于您获得奖励时背包已满，奖励通过邮件发放给您，请查收"),
                    mail:send(Role, Title, MailContent, Items1),
                    NewRole = Role#role{m_camp_zillionaire =
                                            MCampZll#m_camp_zillionaire{event_id
                                                                            =
                                                                            0}},
                    {ok, NewRole}
            end;
        _ -> {false, lang:get("领取奖励出错")}
    end;
handle_throw_event(Role) -> {ok, Role}.

get_rand_list(#role{m_camp_zillionaire =
                        #m_camp_zillionaire{grid_index = GridIndex,
                                            ring_times = RingTimes,
                                            guarantee = GuaranteeInfo}},
              normal) ->
    {MaxRing, Min, Max} =
        camp_zillionaire_data:get_key_val(2),
    GridCount = camp_zillionaire_data:get_key_val(3),
    RandList = [camp_zillionaire_data:get_grid((GridIndex +
                                                    I)
                                                   rem GridCount)
                || I <- lists:seq(1, 6)],
    GuaranteeIndex = get_guarantee(RandList),
    LeftTimes = MaxRing - RingTimes rem MaxRing,
    GuaranteeInfo1 = case RingTimes rem MaxRing =:= 0 of
                         true ->
                             lists:keydelete(GuaranteeIndex, 1, GuaranteeInfo);
                         _ -> GuaranteeInfo
                     end,
    DoneTimes = case lists:keyfind(GuaranteeIndex,
                                   1,
                                   GuaranteeInfo1)
                    of
                    {_GuaranteeEvent, _DoneTimes} -> _DoneTimes;
                    false -> 0
                end,
    MinGuaranteeTimes = max(Min - DoneTimes, 0),
    RandList1 = case LeftTimes =< MinGuaranteeTimes of
                    true when GuaranteeIndex =/= 0 ->
                        logger:debug("触发保底机制:~w",
                                     [{RandList, GuaranteeIndex}],
                                     camp_zillionaire,
                                     487),
                        [R
                         || R = #{index := Index} <- RandList,
                            Index =:= GuaranteeIndex];
                    _ ->
                        case DoneTimes >= Max of
                            true ->
                                logger:debug("触发保底上限机制",
                                             [],
                                             camp_zillionaire,
                                             494),
                                case [R
                                      || R = #{index := Index} <- RandList,
                                         Index =/= GuaranteeIndex]
                                    of
                                    [] -> RandList;
                                    _L -> _L
                                end;
                            _ -> RandList
                        end
                end,
    {RandList1, GuaranteeIndex, GuaranteeInfo1};
get_rand_list(Role, ahead) ->
    get_rand_list(Role, normal);
get_rand_list(#role{m_camp_zillionaire =
                        #m_camp_zillionaire{grid_index = GridIndex,
                                            ring_times = RingTimes,
                                            guarantee = GuaranteeInfo}},
              backwards) ->
    {MaxRing, Min, Max} =
        camp_zillionaire_data:get_key_val(2),
    GridCount = camp_zillionaire_data:get_key_val(3),
    RandList = [camp_zillionaire_data:get_grid((GridIndex -
                                                    I)
                                                   rem GridCount)
                || I <- lists:seq(1, 3)],
    GuaranteeIndex = get_guarantee(RandList),
    GuaranteeInfo1 = case RingTimes rem MaxRing =:= 0 of
                         true ->
                             lists:keydelete(GuaranteeIndex, 1, GuaranteeInfo);
                         _ -> GuaranteeInfo
                     end,
    DoneTimes = case lists:keyfind(GuaranteeIndex,
                                   1,
                                   GuaranteeInfo1)
                    of
                    {_GuaranteeIndex, _DoneTimes} -> _DoneTimes;
                    false -> 0
                end,
    MinGuaranteeTimes = max(Min - DoneTimes, 0),
    LeftTimes = MaxRing - RingTimes rem MaxRing,
    RandList1 = case LeftTimes =< MinGuaranteeTimes of
                    true when GuaranteeIndex =/= 0 ->
                        logger:debug("触发保底机制", [], camp_zillionaire, 533),
                        [R
                         || R = #{event := Event} <- RandList,
                            Event =:= GuaranteeIndex];
                    _ ->
                        case DoneTimes >= Max of
                            true ->
                                logger:debug("触发保底上限机制",
                                             [],
                                             camp_zillionaire,
                                             540),
                                case [R
                                      || R = #{index := Index} <- RandList,
                                         Index =/= GuaranteeIndex]
                                    of
                                    [] -> RandList;
                                    _L -> _L
                                end;
                            _ -> RandList
                        end
                end,
    {RandList1, GuaranteeIndex, GuaranteeInfo1};
get_rand_list(#role{m_camp_zillionaire =
                        #m_camp_zillionaire{grid_index = GridIndex,
                                            guarantee = GuaranteeInfo}},
              Result) ->
    MaxRing = camp_zillionaire_data:get_key_val(3),
    RandList = [camp_zillionaire_data:get_grid((GridIndex +
                                                    Result)
                                                   rem MaxRing)],
    {RandList, 0, GuaranteeInfo}.

check_active_event([], Role, Args) -> {ok, Role, Args};
check_active_event([event | _Rest],
                   #role{m_camp_zillionaire =
                             #m_camp_zillionaire{event_id = 0}},
                   _Args) ->
    {false, lang:get("您已经领取过奖励了")};
check_active_event([cancel_timer | _Rest], Role,
                   _Args) ->
    TimerRole =
        role_timer:del(camp_zillionaire_active_event, Role),
    check_active_event(_Rest, TimerRole, _Args);
check_active_event([_ | Rest], Role, Args) ->
    check_active_event(Rest, Role, Args).

get_camp_id() -> campaign_mgr:get_camp_id(60048).

check_ring_reward([], Role, _Args) -> {ok, Role, _Args};
check_ring_reward([complete | _Rest],
                  #role{m_camp_zillionaire =
                            #m_camp_zillionaire{ring_times = RingTimes}},
                  _Args = #{ring := Ring})
    when Ring > RingTimes ->
    {false, lang:get("您还没有达到该轮回次数")};
check_ring_reward([have | Rest],
                  Role = #role{m_camp_zillionaire =
                                   #m_camp_zillionaire{ring_rewards =
                                                           RingRewards}},
                  Args = #{ring := Ring}) ->
    case lists:member(Ring, RingRewards) of
        true -> {false, lang:get("您已经领取过该轮回奖励")};
        _ -> check_ring_reward(Rest, Role, Args)
    end;
check_ring_reward([_ | Rest], Role, _Args) ->
    check_ring_reward(Rest, Role, _Args).

do_accept(Role = #role{m_quest =
                           Mquest = #m_quest{quest = Quests}},
          QuestId) ->
    case quest_data:get(QuestId) of
        #quest_data{id = QuestId, type = Type,
                    sec_type = SecType, progress = Progress} ->
            Now = date:unixtime(),
            Progress0 = quest_prog_init:do(Role, Progress, QuestId),
            {NewProgress, LoadRole} = quest:load_progress(Progress0,
                                                          quest,
                                                          QuestId,
                                                          [],
                                                          Role),
            UnitRole = plot_quest:create_task_unit(LoadRole,
                                                   QuestId,
                                                   NewProgress),
            Finish = case lists:keyfind(0,
                                        #quest_progress.finish,
                                        NewProgress)
                         of
                         false -> 1;
                         _ -> 0
                     end,
            NQuest = #quest{id = QuestId, finish = Finish,
                            type = Type, sec_type = SecType,
                            progress = NewProgress, accept_time = Now},
            NewQuests = [NQuest | Quests],
            NewMquest = Mquest#m_quest{quest = NewQuests},
            NewRole = UnitRole#role{m_quest = NewMquest},
            role:link_send(NewRole, 10203, {[NQuest]}),
            logger:debug("任务推送========:~w",
                         [NQuest],
                         camp_zillionaire,
                         602),
            {ok, NewRole};
        _ ->
            logger:error("接受任务出错:~w",
                         [QuestId],
                         camp_zillionaire,
                         605),
            {false, lang:get("接受任务出错")}
    end.

update_record_list(Record) ->
    RecordList = env:get(camp_zillionaire_reward_record),
    case RecordList of
        [_ | _] ->
            NewRecordList = lists:sublist([Record | RecordList],
                                          20),
            env:set(camp_zillionaire_reward_record, NewRecordList);
        _ -> env:set(camp_zillionaire_reward_record, [Record])
    end.

