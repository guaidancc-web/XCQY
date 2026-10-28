-file("src/mod/ai/ai_rule.erl", 1).

-module(ai_rule).

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

-file("src/mod/ai/ai_rule.erl", 8).

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

-file("src/mod/ai/ai_rule.erl", 9).

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

-file("src/mod/ai/ai_rule.erl", 10).

-file("inc/link.hrl", 1).

-record(link,
        {socket :: undefined | port(),
         conn_pid :: undefined | pid(),
         ip = {0, 0, 0, 0} :: {0..255, 0..255, 0..255, 0..255},
         port = 0 :: non_neg_integer(),
         lag = 0 :: non_neg_integer()}).

-file("src/mod/ai/ai_rule.erl", 11).

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

-file("src/mod/ai/ai_rule.erl", 12).

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

-file("src/mod/ai/ai_rule.erl", 13).

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

-file("src/mod/ai/ai_rule.erl", 14).

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

-file("src/mod/ai/ai_rule.erl", 15).

-file("inc/ai.hrl", 1).

-record(ai_rule,
        {id :: undefined | non_neg_integer(),
         lev :: undefined | non_neg_integer(),
         type = 0 :: non_neg_integer(),
         repeat = 0,
         prob,
         condition = [],
         action = []}).

-file("src/mod/ai/ai_rule.erl", 16).

-file("inc/combat_hook_setting.hrl", 1).

-record(m_hook_setting,
        {ver = 2,
         valid_index = 0 :: non_neg_integer(),
         plan_data = [] :: list()}).

-record(hook_setting,
        {index = 1 :: pos_integer(),
         name = [] :: pos_integer(),
         skill_plan = [] :: list()}).

-file("src/mod/ai/ai_rule.erl", 17).

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

-file("src/mod/ai/ai_rule.erl", 18).

-export([handle_con_target/4,
         handle_con_rela/4,
         handle_con_key/2,
         handle_con_key/3,
         handle_con_compare/3,
         handle_con_count/3,
         handle_action_target/4,
         handle_action_type/6,
         handle_type/3,
         pre_process/2,
         default_action/2,
         replace/3,
         can_action/1,
         can_verity/2,
         match_skill_plan/2]).

-spec handle_con_target(TargetKey, SuitTar, Npc,
                        Context) -> #fighter{} when TargetKey :: atom(),
                                                    SuitTar :: list(),
                                                    Npc :: #fighter{},
                                                    Context ::
                                                        #combat_context{}.

handle_con_target(self, _SuitTar, Npc, Context)
    when is_record(Npc, fighter) andalso
             is_record(Context, combat_context) ->
    [Npc];
handle_con_target(combat, _SuitTar, Npc, Context)
    when is_record(Npc, fighter) andalso
             is_record(Context, combat_context) ->
    [Context];
handle_con_target(self_side, _SuitTar, Npc,
                  #combat_context{self_side = SelfSide})
    when is_record(Npc, fighter) ->
    SelfSide;
handle_con_target(op_side, _SuitTar, Npc,
                  #combat_context{op_side = OpSide})
    when is_record(Npc, fighter) ->
    OpSide;
handle_con_target(suit_tar, SuitTar, Npc,
                  #combat_context{})
    when is_record(Npc, fighter) ->
    SuitTar;
handle_con_target(_ConTarget, _SuitTar, _Npc, Scene) ->
    [Scene].

-spec handle_con_rela(Targets, Key, Rela,
                      Value) -> list() when Targets :: [#fighter{}],
                                            Key :: atom(), Rela :: bitstring(),
                                            Value :: term().

handle_con_rela(Targets, Key, Rela, Value) ->
    handle_con_rela(Targets, Key, Rela, Value, []).

handle_con_rela(_Targets = [], _Key, _Rela, _Value,
                Back) ->
    Back;
handle_con_rela(_Targets = [F | T], Key, Rela, Value,
                Back) ->
    case handle_con_compare(Rela,
                            handle_con_key(Key, F),
                            handle_con_key(Key, F, Value))
        of
        true ->
            handle_con_rela(T, Key, Rela, Value, [F | Back]);
        false -> handle_con_rela(T, Key, Rela, Value, Back)
    end.

-spec handle_con_compare(Rela, Left, Right) -> true |
                                               false when Rela :: bitstring(),
                                                          Left :: term(),
                                                          Right :: term().

handle_con_compare(lt, Left, Right) -> Left < Right;
handle_con_compare(eq, Left, Right) -> Left == Right;
handle_con_compare(ue, Left, Right) -> Left =/= Right;
handle_con_compare(gt, Left, Right) -> Left > Right;
handle_con_compare(ge, Left, Right) -> Left >= Right;
handle_con_compare(le, Left, Right) -> Left =< Right;
handle_con_compare(include, Left, Right)
    when is_list(Left) ->
    lists:member(Right, Left);
handle_con_compare(not_include, Left, Right)
    when is_list(Left) ->
    not lists:member(Right, Left);
handle_con_compare(list, Left, Right)
    when is_list(Right) ->
    lists:member(Left, Right);
handle_con_compare(not_list, Left, Right)
    when is_list(Right) ->
    not lists:member(Left, Right);
handle_con_compare(mod2, Left, Right) ->
    Left rem 2 =:= Right;
handle_con_compare(mod3, Left, Right) ->
    Left rem 3 =:= Right;
handle_con_compare(mod4, Left, Right) ->
    Left rem 4 =:= Right;
handle_con_compare(mod5, Left, Right) ->
    Left rem 5 =:= Right;
handle_con_compare(mod6, Left, Right) ->
    Left rem 6 =:= Right;
handle_con_compare(mod7, Left, Right) ->
    Left rem 7 =:= Right;
handle_con_compare(mod8, Left, Right) ->
    Left rem 8 =:= Right;
handle_con_compare(mod9, Left, Right) ->
    Left rem 9 =:= Right;
handle_con_compare(mod10, Left, Right) ->
    Left rem 10 =:= Right;
handle_con_compare(mod11, Left, Right) ->
    Left rem 11 =:= Right;
handle_con_compare(mod12, Left, Right) ->
    Left rem 12 =:= Right;
handle_con_compare(mod13, Left, Right) ->
    Left rem 13 =:= Right;
handle_con_compare(mod14, Left, Right) ->
    Left rem 14 =:= Right;
handle_con_compare(mod15, Left, Right) ->
    Left rem 15 =:= Right;
handle_con_compare(mod16, Left, Right) ->
    Left rem 16 =:= Right;
handle_con_compare(mod17, Left, Right) ->
    Left rem 17 =:= Right;
handle_con_compare(mod18, Left, Right) ->
    Left rem 18 =:= Right;
handle_con_compare(mod19, Left, Right) ->
    Left rem 19 =:= Right;
handle_con_compare(mod20, Left, Right) ->
    Left rem 20 =:= Right;
handle_con_compare(range, Left, {Min, Max}) ->
    logger:debug("区间检测:~w",
                 [{Left, Min, Max}],
                 ai_rule,
                 126),
    Min1 = min(Min, Max),
    Max1 = max(Min, Max),
    Left >= Min1 andalso Left =< Max1;
handle_con_compare(_Rela, _Left, _Right) -> false.

-spec handle_con_key(Key, Target) -> term() when Key ::
                                                     atom(),
                                                 Target :: #fighter{} |
                                                           #combat_context{}.

handle_con_key(hp,
               _Target = #fighter{hp = Hp, is_escape = 0}) ->
    Hp;
handle_con_key(hp_ratio,
               _Target = #fighter{hp = Hp, hp_max = HpMax}) ->
    erlang:round(Hp / HpMax * 100);
handle_con_key(mp, _Target = #fighter{mp = Mp}) -> Mp;
handle_con_key(classes,
               _Target = #fighter{classes = Classes}) ->
    Classes;
handle_con_key(sex, _Target = #fighter{sex = Sex}) ->
    Sex;
handle_con_key(model,
               _Target = #fighter{special_attr =
                                      #special_attr{model_id = ModelId}}) ->
    ModelId;
handle_con_key(id, _Target = #fighter{base_id = Id}) ->
    Id;
handle_con_key(phy_dmg,
               _Target = #fighter{attr = Attr}) ->
    Attr#attr.phy_dmg;
handle_con_key(magic_dmg,
               _Target = #fighter{attr = Attr}) ->
    Attr#attr.magic_dmg;
handle_con_key(holy_dmg,
               _Target = #fighter{attr = Attr}) ->
    Attr#attr.holy_dmg;
handle_con_key(buff,
               _Target = #fighter{buffs = Buffs}) ->
    [Id || #c_buff{id = Id} <- Buffs];
handle_con_key(control_buff,
               _Target = #fighter{buffs = Buffs}) ->
    case [1
          || #c_buff{sec_type = SecType} <- Buffs,
             SecType =:= control]
        of
        [] -> 0;
        _ -> 1
    end;
handle_con_key(strong_control,
               _Target = #fighter{buffs = Buffs}) ->
    case [1
          || #c_buff{sec_type = SecType, script_id = ScriptId}
                 <- Buffs,
             SecType =:= control, ScriptId =/= 221000,
             ScriptId =/= 221001]
        of
        [] -> 0;
        _ -> 1
    end;
handle_con_key(control_buff_duration,
               _Target = #fighter{buffs = Buffs}) ->
    case [1
          || #c_buff{sec_type = SecType, duration = Duration,
                     duration_left = DurationLeft}
                 <- Buffs,
             SecType =:= control andalso
                 DurationLeft =< Duration - 1]
        of
        [] -> 0;
        _ -> 1
    end;
handle_con_key(strong_control_duration,
               _Target = #fighter{buffs = Buffs}) ->
    case [1
          || #c_buff{sec_type = SecType, script_id = ScriptId,
                     duration = Duration, duration_left = DurationLeft}
                 <- Buffs,
             SecType =:= control andalso
                 DurationLeft =< Duration - 1 andalso
                     ScriptId =/= 221000 andalso ScriptId =/= 221001]
        of
        [] -> 0;
        _ -> 1
    end;
handle_con_key(buff_type,
               _Target = #fighter{buffs = Buffs}) ->
    [to_combat_buff_type(Type)
     || #c_buff{eff_type = Type, can_dispel = 1} <- Buffs];
handle_con_key(fighter_type,
               _Target = #fighter{type = FighterType}) ->
    FighterType;
handle_con_key(lev, _Targe = #fighter{lev = Lev}) ->
    Lev;
handle_con_key(is_escape,
               _Target = #fighter{is_escape = IsEscape}) ->
    IsEscape;
handle_con_key(is_die,
               _Target = #fighter{is_die = IsDie}) ->
    IsDie;
handle_con_key(active_skills,
               Target = #fighter{active_skills = ActiveSkills}) ->
    NewActiveSkills = active_skills(Target, ActiveSkills),
    [SkillId || #c_skill{id = SkillId} <- NewActiveSkills];
handle_con_key(skill_cooldown,
               #fighter{skill_cooldown = SkillCds}) ->
    cooldown_skill(SkillCds);
handle_con_key(can_revive, Target) ->
    combat_skill:can_revive(Target);
handle_con_key(can_revive_next_round,
               Target = #fighter{id = Id}) ->
    case
        combat_cache:get_context_elem([#combat_context.round_die])
        of
        [RoundDieList] ->
            case lists:member(Id, RoundDieList) of
                true -> 0;
                _ -> combat_skill:can_revive(Target)
            end;
        _ -> combat_skill:can_revive(Target)
    end;
handle_con_key(action,
               _Target = #fighter{action = Action}) ->
    case Action of
        {#c_skill{id = SkillId}, _} -> SkillId;
        _ -> 0
    end;
handle_con_key(action_num,
               #fighter{action_num = ActionNum, name = _Name}) ->
    ActionNum;
handle_con_key(round, #combat_context{round = Round}) ->
    Round;
handle_con_key(has_new,
               #combat_context{op_side = OpSide}) ->
    LevList = [Lev
               || #fighter{lev = Lev, type = 1} <- OpSide],
    case LevList of
        [_ | _] ->
            Max = lists:max(LevList),
            Min = lists:min(LevList),
            case Min =< 80 of
                true ->
                    case Max >= Min + 10 of
                        true -> 1;
                        _ -> 0
                    end;
                _ -> 0
            end;
        _ -> 0
    end;
handle_con_key(order_die,
               #combat_context{self_side = Side}) ->
    SelfList = [{BaseId, IsDie, IsEscape}
                || #fighter{type = 2, is_die = IsDie,
                            is_escape = IsEscape, base_id = BaseId}
                       <- Side],
    SelfList1 = lists:keysort(1, SelfList),
    do_check_order_die(SelfList1, undefined);
handle_con_key(pet_num,
               _Npc = #fighter{pos = MasterPos, type = 2,
                               group = Group}) ->
    logger:debug("单位宠物统计:~w", [Group], ai_rule, 242),
    GroupFighter = combat_cache:all(Group),
    PetPos = PetPos = if MasterPos =:= 1 -> 8;
                         MasterPos =:= 2 -> 7;
                         MasterPos =:= 3 -> 9;
                         MasterPos =:= 4 -> 6;
                         true -> 10
                      end,
    case lists:keyfind(PetPos, #fighter.pos, GroupFighter)
        of
        PetUnit = #fighter{id = Id} ->
            case can_action(PetUnit) of
                true -> 0;
                _ ->
                    case
                        combat_cache:get_context_elem([#combat_context.round_die])
                        of
                        [RoundDieList] ->
                            case lists:member(Id, RoundDieList) of
                                true ->
                                    logger:debug("宠物本回合死亡", [], ai_rule, 263),
                                    0;
                                _ -> 1
                            end;
                        _ -> 1
                    end
            end;
        _ ->
            logger:debug("宠物宠物不存在:", [], ai_rule, 272),
            1
    end;
handle_con_key(pet_num, Npc = #fighter{id = Fid}) ->
    IsCanAction = case combat_cache:f(by_master_id, Fid) of
                      false -> false;
                      Pet = #fighter{name = _Name} -> can_action(Pet)
                  end,
    case combat_script_skill_calc:find_can_summon_pet(Npc)
        of
        {false, _R} -> 0;
        {true, _} ->
            case IsCanAction of
                true -> 0;
                false -> 1
            end
    end;
handle_con_key(pos, #fighter{pos = Pos}) -> Pos;
handle_con_key(_key, _Target) -> 0.

handle_con_key(hp, _Target = #fighter{hp_max = HpMax},
               Value)
    when is_integer(Value) ->
    round(HpMax / 100 * Value);
handle_con_key(_Key, _Fighter, Value) -> Value.

cooldown_skill(SkillCds) ->
    [SkillId
     || {SkillId, TimeLeft} <- SkillCds, TimeLeft > 0].

active_skills(F, ActiveSkills) ->
    active_skills(F, ActiveSkills, []).

active_skills(_F, [], ActiveSkills) -> ActiveSkills;
active_skills(F, [Skill | T], ActiveSkills) ->
    case combat_skill:skill_check(Skill, F) of
        {true, _} ->
            active_skills(F, T, [Skill | ActiveSkills]);
        _Err -> active_skills(F, T, ActiveSkills)
    end.

handle_con_count(Targets, Rela, Num) ->
    Len = length(Targets),
    case Rela of
        eq -> Len =:= Num;
        gt -> Len > Num;
        ge -> Len >= Num;
        lt -> Len < Num;
        le -> Len =< Num;
        ue -> Len =/= Num;
        _ -> false
    end.

-spec handle_action_target(Atype, Npc, SuitTar,
                           Scene) -> list() when Atype :: atom(),
                                                 Npc :: #fighter{},
                                                 SuitTar :: list(),
                                                 Scene :: #combat_context{}.

handle_action_target(self, Npc, _SuitTar, Scene)
    when is_record(Npc, fighter) andalso
             is_record(Scene, combat_context) ->
    [Npc];
handle_action_target(self_side, Npc, _SuitTar,
                     #combat_context{self_side = SelfSide})
    when is_record(Npc, fighter) ->
    SelfSide;
handle_action_target(op_side, Npc, _SuitTar,
                     #combat_context{op_side = OpSide})
    when is_record(Npc, fighter) ->
    OpSide;
handle_action_target(suit_tar, Npc, SuitTar, Scene)
    when is_record(Npc, fighter) andalso
             is_record(Scene, combat_context) ->
    SuitTar;
handle_action_target(top_lev, Npc, _SuitTar,
                     #combat_context{op_side = OpSide})
    when is_record(Npc, fighter) ->
    get_top_level(OpSide, true);
handle_action_target(low_lev, Npc, _SuitTar,
                     #combat_context{op_side = OpSide})
    when is_record(Npc, fighter) ->
    get_top_level(OpSide, false);
handle_action_target(_Atype, Npc, _SuitTar, _Context) ->
    [Npc].

-spec handle_action_type(Atype, Aval, Targets, Rule,
                         Npc, Scene) -> #fighter{} when Atype :: atom(),
                                                        Aval :: term(),
                                                        Targets :: list(),
                                                        Rule :: #ai_rule{},
                                                        Npc :: #fighter{},
                                                        Scene ::
                                                            #combat_context{}.

handle_action_type(talk, Aval, Targets, _Rule,
                   Npc = #fighter{}, #combat_context{}) ->
    case combat_util:get_not_die(undefined,
                                 Targets,
                                 [],
                                 [{is_stealth, 0}])
        of
        undefined -> Npc;
        Fighter ->
            Npc#fighter{talk = replace(Aval, Npc, Fighter)}
    end;
handle_action_type(skill, Aval, Targets, Rule,
                   Npc = #fighter{}, CombatContext) ->
    Act = case combat_util:get_target(undefined,
                                      Targets,
                                      [],
                                      [])
              of
              undefined -> false;
              #fighter{id = Fid} ->
                  get_skill(Aval, Fid, Npc, CombatContext)
          end,
    case Act of
        false -> Npc;
        _ ->
            {Vlist, His} = Npc#fighter.ai,
            NewHis = [Rule#ai_rule.id | His],
            Npc#fighter{action = Act, ai = {Vlist, NewHis}}
    end;
handle_action_type(ai_level, Aval, _Targets, _Rule,
                   Npc = #fighter{ai = {_, AiHis}},
                   Scene = #combat_context{}) ->
    Count = case get(npc_ai_level_count) of
                C when is_integer(C) andalso C > 0 ->
                    put(npc_ai_level_count, C + 1);
                _ ->
                    put(npc_ai_level_count, 1),
                    1
            end,
    case Count < 10 of
        true ->
            AiList = get_ai_config(Npc#fighter.ai_id, Aval),
            ai:act(Npc#fighter{ai = {AiList, AiHis}}, Scene);
        false ->
            AiList = get_ai_config(Npc#fighter.ai_id, Aval),
            Npc#fighter{ai = {AiList, AiHis}}
    end;
handle_action_type(_Type, _Aval, _Targets, _Rule, Npc,
                   _Scene) ->
    Npc.

-spec handle_type(Type, #ai_rule{},
                  Data) -> term() when Type :: atom(), Data :: term().

handle_type(scene, _Rule = #ai_rule{type = 1},
            Context = #combat_context{op_side = OpSide}) ->
    Context#combat_context{op_side =
                               [F
                                || F = #fighter{type = Type} <- OpSide,
                                   Type =/= 3]};
handle_type(_, _Rule, Data) -> Data.

pre_process(F = #fighter{type = 1, skill_plan = SP},
            #combat_context{type = CombatType}) ->
    case lists:member(CombatType, [52]) of
        true -> get_ai_pre_process(F);
        _ ->
            MaxIndex = calc_max_skill_plan_index(SP),
            case 0 =/= MaxIndex of
                true -> true;
                false -> get_ai_pre_process(F)
            end
    end;
pre_process(F = #fighter{type = 3, skill_plan = SP},
            _) ->
    MaxIndex = calc_max_skill_plan_index(SP),
    case 0 =/= MaxIndex of
        true -> true;
        false -> get_ai_pre_process(F)
    end;
pre_process(F = #fighter{ai = {_AiList, _AiHis}}, _) ->
    get_ai_pre_process(F);
pre_process(F, _) -> {false, F}.

get_ai_pre_process(F = #fighter{type = Type,
                                classes = Classes, ai_id = AiId,
                                ai = {AiList, AiHis}}) ->
    case AiList of
        [_ | _] -> {AiList, F};
        _ ->
            case get_ai_config(Type, Classes, AiId, 1) of
                [] -> {false, F};
                Al -> {Al, F#fighter{ai = {Al, AiHis}}}
            end
    end.

-spec default_action(Npc,
                     Scene) -> #fighter{} when Npc :: #fighter{},
                                               Scene :: #combat_context{}.

default_action(F, Context)
    when is_record(F, fighter) and
             is_record(Context, combat_context) ->
    F#fighter{action = get_default_attack(F, Context)};
default_action(F, _) -> F.

-spec replace(Sen, Self,
              Target) -> bitstring() when Sen :: bitstring(),
                                          Self :: #fighter{} | #unit{},
                                          Target :: #fighter{} | #role{}.

replace(Sen, Self, Target) ->
    replace(Sen, Self, Target, [name]).

replace(Sen, _Self, _Target, []) -> Sen;
replace(Sen, Self, Target, _Keywords = [H | T]) ->
    NewSen = do_replace(H, Sen, Self, Target),
    replace(NewSen, Self, Target, T).

do_replace(self, Sen, Self, _Target)
    when is_record(Self, unit) ->
    re:replace(Sen,
               "#self#",
               Self#unit.name,
               [{return, list}, unicode]);
do_replace(self, Sen, Self, _Target)
    when is_record(Self, fighter) ->
    re:replace(Sen,
               "#self#",
               Self#fighter.name,
               [{return, list}, unicode]);
do_replace(name, Sen, _Self, Target)
    when is_record(Target, map_role) ->
    re:replace(Sen,
               "#name#",
               Target#map_role.name,
               [{return, list}, unicode]);
do_replace(name, Sen, _Self, Target)
    when is_record(Target, fighter) ->
    re:replace(Sen,
               "#name#",
               Target#fighter.name,
               [{return, list}, unicode]);
do_replace(_Key, Sen, _Self, _Target) -> Sen.

-spec can_verity(Rule, Npc) -> true | false when Rule ::
                                                     #ai_rule{},
                                                 Npc :: #fighter{}.

can_verity(_Rule = #ai_rule{id = Id, repeat = Repeat},
           _Npc = #fighter{ai = {_AiList, AiHis}}) ->
    case (Repeat == 0) and lists:member(Id, AiHis) of
        true -> false;
        false -> true
    end.

-spec can_action(Npc) -> true | false when Npc ::
                                               #fighter{}.

can_action(#fighter{is_escape = 1}) -> false;
can_action(#fighter{is_die = 1, type = 1}) -> true;
can_action(#fighter{is_die = 1, type = 4}) -> true;
can_action(#fighter{is_die = 1}) -> false;
can_action(_) -> true.

to_combat_buff_type(debuff) -> 0;
to_combat_buff_type(buff) -> 1.

get_default_attack(Npc,
                   #combat_context{op_side = OpSide}) ->
    case combat_util:get_not_die(undefined,
                                 OpSide,
                                 [],
                                 [{is_stealth, 0}])
        of
        undefined -> undefined;
        #fighter{id = Fid} -> {get_default_skill(Npc), Fid}
    end.

get_default_attack(#combat_context{op_side = OpSide}) ->
    case combat_util:get_not_die(undefined,
                                 OpSide,
                                 [],
                                 [{is_stealth, 0}])
        of
        undefined -> undefined;
        #fighter{id = Fid} -> {get_default_skill(), Fid}
    end.

get_default_skill(F = #fighter{}) ->
    combat_skill:get_default_skill(F).

get_default_skill() ->
    combat_script_skill:to_combat_skill({1000, 1}).

get_skill(SkillId, Fid,
          #fighter{type = 2, active_skills = ActiveSkills},
          Context) ->
    case lists:keyfind(SkillId, #c_skill.id, ActiveSkills)
        of
        Skill = #c_skill{} -> {Skill, Fid};
        _ ->
            case combat_script_skill:to_combat_skill({SkillId, 1})
                of
                undefined ->
                    logger:error("AI 选择的技能不存在:~w", [SkillId], ai_rule, 545),
                    get_default_attack(Context);
                Skill -> {Skill, Fid}
            end
    end;
get_skill(SkillId, Fid,
          #fighter{active_skills = ActiveSkills}, Context) ->
    case lists:keyfind(SkillId, #c_skill.id, ActiveSkills)
        of
        false ->
            logger:error("AI 选择的技能不存在:~w", [SkillId], ai_rule, 554),
            get_default_attack(Context);
        Skill -> {Skill, Fid}
    end.

get_top_level(_Targets = [], _Flag) -> [];
get_top_level(_Targets = [H = #fighter{is_die = 0} | T],
              Flag) ->
    get_top_level(T, [H], Flag);
get_top_level(_Targets = [_H = #fighter{is_die = 1}
                          | T],
              Flag) ->
    get_top_level(T, Flag).

get_top_level(_Targets = [], Fighter, _Flag) -> Fighter;
get_top_level(_Targets = [H = #fighter{is_die = 0} | T],
              Fighter = [F | _], false) ->
    case H#fighter.lev - F#fighter.lev of
        R1 when R1 >= 0 -> get_top_level(T, Fighter, false);
        _ -> get_top_level(T, [H], false)
    end;
get_top_level(_Targets = [H = #fighter{is_die = 0} | T],
              Fighter = [F | _], Flag) ->
    case H#fighter.lev - F#fighter.lev of
        R1 when R1 > 0 -> get_top_level(T, [H], Flag);
        _ -> get_top_level(T, Fighter, Flag)
    end;
get_top_level(_Targets = [_H = #fighter{is_die = 1}
                          | T],
              Fighter, Flag) ->
    get_top_level(T, Fighter, Flag).

get_ai_config(_Type, _ClassesId, AiId, AiLev)
    when AiId > 0 ->
    get_ai_config(AiId, AiLev);
get_ai_config(_Type, 1, 0, AiLev) ->
    get_ai_config(70001, AiLev);
get_ai_config(_Type, 2, 0, AiLev) ->
    get_ai_config(70002, AiLev);
get_ai_config(_Type, 3, 0, AiLev) ->
    get_ai_config(70003, AiLev);
get_ai_config(_Type, 4, 0, AiLev) ->
    get_ai_config(70004, AiLev);
get_ai_config(_Type, 5, 0, AiLev) ->
    get_ai_config(70005, AiLev);
get_ai_config(_Type, 6, 0, AiLev) ->
    get_ai_config(70006, AiLev);
get_ai_config(_Type, 7, 0, AiLev) ->
    get_ai_config(70007, AiLev);
get_ai_config(_, _, _, _) -> [].

get_ai_config(AiId, AiLev) ->
    case ai_data:get_ai(AiId) of
        AiRules = [_ | _] ->
            [Ai
             || Ai = #ai_rule{lev = Lev} <- AiRules, Lev =:= AiLev];
        _ -> []
    end.

do_check_order_die([], _) -> 1;
do_check_order_die([{_, _, 1} | _T], _Flag) -> 0;
do_check_order_die([{_, 1, _} | T], undefined) ->
    do_check_order_die(T, undefined);
do_check_order_die([{_, 1, _} | _T], live) -> 0;
do_check_order_die([{_, 0, _} | T], undefined) ->
    do_check_order_die(T, live);
do_check_order_die([{_, 0, _} | T], live) ->
    do_check_order_die(T, live).

match_skill_plan(Self = #fighter{hook_index = Index},
                 CombatContext)
    when Index > 15 ->
    match_skill_plan(Self#fighter{hook_index = 1},
                     CombatContext);
match_skill_plan(Self = #fighter{skill_plan = SkillPlan,
                                 hook_index = Index,
                                 active_skills = ActiveSkills},
                 CombatContext) ->
    case lists:keyfind(Index, 1, SkillPlan) of
        false ->
            match_skill_plan(Self#fighter{hook_index = Index + 1},
                             CombatContext);
        {_, SkillId} ->
            case lists:keyfind(SkillId, #c_skill.id, ActiveSkills)
                of
                Skill = #c_skill{} ->
                    case is_have_auto_target(Skill, Self, CombatContext) of
                        {true, Dfd = #fighter{id = TargetId}} ->
                            case combat_skill:skill_check(SkillId,
                                                          Self,
                                                          Dfd,
                                                          TargetId)
                                of
                                {false, _Reason} ->
                                    MaxIndex =
                                        calc_max_skill_plan_index(SkillPlan),
                                    case Index =:= MaxIndex of
                                        true ->
                                            default_action(Self, CombatContext);
                                        false ->
                                            match_skill_plan(Self#fighter{hook_index
                                                                              =
                                                                              Index
                                                                                  +
                                                                                  1},
                                                             CombatContext)
                                    end;
                                {true, Skill = #c_skill{}} ->
                                    Self#fighter{hook_index = Index + 1,
                                                 action = {Skill, TargetId}}
                            end;
                        false ->
                            case combat_skill:get_target_by_skill(Self, Skill)
                                of
                                Dfd = #fighter{id = TargetId} ->
                                    case combat_skill:skill_check(SkillId,
                                                                  Self,
                                                                  Dfd,
                                                                  TargetId)
                                        of
                                        {false, _Reason} ->
                                            MaxIndex =
                                                calc_max_skill_plan_index(SkillPlan),
                                            case Index =:= MaxIndex of
                                                true ->
                                                    default_action(Self,
                                                                   CombatContext);
                                                false ->
                                                    match_skill_plan(Self#fighter{hook_index
                                                                                      =
                                                                                      Index
                                                                                          +
                                                                                          1},
                                                                     CombatContext)
                                            end;
                                        {true, Skill = #c_skill{}} ->
                                            Self#fighter{hook_index = Index + 1,
                                                         action =
                                                             {Skill, TargetId}}
                                    end;
                                undefined ->
                                    match_skill_plan(Self#fighter{hook_index =
                                                                      Index +
                                                                          1},
                                                     CombatContext)
                            end
                    end;
                false ->
                    match_skill_plan(Self#fighter{hook_index = Index + 1},
                                     CombatContext)
            end
    end.

calc_max_skill_plan_index(SkillPlan) ->
    case lists:sort(fun ({I1, _}, {I2, _}) -> I1 > I2;
                        (_, _) -> true
                    end,
                    SkillPlan)
        of
        [{MaxI, _} | _] -> MaxI;
        [] -> 0
    end.

is_have_auto_target(#c_skill{skill =
                                 #skill{target_type = TargetType}},
                    #fighter{classes = Classes},
                    #combat_context{type = CombatType, op_side = OpSide}) ->
    case TargetType of
        1 ->
            case Classes =:= 4 orelse Classes =:= 5 of
                true ->
                    case CombatType of
                        8 ->
                            case lists:keyfind(61006, #fighter.base_id, OpSide)
                                of
                                F = #fighter{} -> {true, F};
                                false -> false
                            end;
                        17 ->
                            case lists:keyfind(80235, #fighter.base_id, OpSide)
                                of
                                F = #fighter{} -> {true, F};
                                false -> false
                            end;
                        18 ->
                            case lists:keyfind(61006, #fighter.base_id, OpSide)
                                of
                                F = #fighter{} -> {true, F};
                                false -> false
                            end;
                        _ -> false
                    end;
                false -> false
            end;
        _ -> false
    end.

