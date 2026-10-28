-file("src/mod/campaign/camp_slot_machine.erl", 1).

-module(camp_slot_machine).

-author(hugh).

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

-file("src/mod/campaign/camp_slot_machine.erl", 10).

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

-file("src/mod/campaign/camp_slot_machine.erl", 11).

-file("inc/camp_slot_machine.hrl", 1).

-record(m_camp_slot_machine,
        {ver = 1,
         camp_id = 0,
         guarantee = [],
         reward_times = 0,
         items = []}).

-record(camp_slot_machine_role,
        {id = {0, "", 0},
         name = "",
         items = [],
         time = 0,
         type = 0}).

-file("src/mod/campaign/camp_slot_machine.erl", 12).

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

-file("src/mod/campaign/camp_slot_machine.erl", 13).

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

-file("src/mod/campaign/camp_slot_machine.erl", 14).

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

-file("src/mod/campaign/camp_slot_machine.erl", 15).

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

-file("src/mod/campaign/camp_slot_machine.erl", 16).

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

-file("src/mod/campaign/camp_slot_machine.erl", 17).

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

-file("src/mod/campaign/camp_slot_machine.erl", 18).

-export([init/0, login/1, reset/1, apply_get_reward/1]).

-export([rpc_turn_rand/2,
         rpc_get_reward/1,
         rpc_world_reward_role/1]).

init() -> #m_camp_slot_machine{}.

login(_Role) -> ok.

reset(Role = #role{m_camp_slot_machine =
                       MCampSlotMachine}) ->
    CampId = get_camp_id(),
    NewRole = Role#role{m_camp_slot_machine =
                            MCampSlotMachine#m_camp_slot_machine{reward_times =
                                                                     0,
                                                                 items = [],
                                                                 camp_id =
                                                                     CampId}},
    {ok, NewRole}.

apply_get_reward(Role = #role{id = RoleId,
                              name = RoleName,
                              m_camp_slot_machine =
                                  MCampSlotMachine = #m_camp_slot_machine{items
                                                                              =
                                                                              TurnResult}}) ->
    Fun = fun (_Item = {_, Items},
               {RtnHearsayItems,
                RtnItems,
                GroupReward,
                RtnGroupHSItems}) ->
                  FoldlHSItems = lists:foldl(fun ({Index, ItemId, Num},
                                                  Rtn) ->
                                                     case
                                                         camp_slot_machine_data:get_guarantee({Index,
                                                                                               ItemId})
                                                         of
                                                         #{is_hearsay := 1} ->
                                                             [{ItemId, Num}
                                                              | Rtn];
                                                         _ -> Rtn
                                                     end
                                             end,
                                             [],
                                             Items),
                  FoldlItems = lists:map(fun ({_Index, ItemId, Num}) ->
                                                 NewItemId =
                                                     item_type:special_id(ItemId),
                                                 case NewItemId =:= 90061 of
                                                     true -> {NewItemId, Num};
                                                     _ -> {NewItemId, 0, Num}
                                                 end
                                         end,
                                         Items),
                  SortItems = lists:keysort(1, Items),
                  Itemlist = [ItemId || {_, ItemId, _} <- SortItems],
                  {GroupTupleItem, IsHearsay} =
                      camp_slot_machine_data:get_group_reward(erlang:list_to_tuple(Itemlist)),
                  FoldlGroupHSItems = case IsHearsay of
                                          1 -> GroupTupleItem;
                                          _ -> []
                                      end,
                  ScReward = [{90061, 3}],
                  {format:merge_val(FoldlHSItems, RtnHearsayItems),
                   format:merge_val(ScReward ++ FoldlItems, RtnItems),
                   format:merge_val(GroupTupleItem, GroupReward),
                   format:merge_val(FoldlGroupHSItems, RtnGroupHSItems)}
          end,
    {HearsayItems, Items, GroupReward, GroupHearsayItems} =
        lists:foldl(Fun, {[], [], [], []}, TurnResult),
    Now = date:unixtime2(),
    WorldHearsayFun = fun ({ItemId, Num}) ->
                              #camp_slot_machine_role{id = RoleId,
                                                      name = RoleName,
                                                      items = [{ItemId, Num}],
                                                      time = Now, type = 0}
                      end,
    WorldHearsayData = lists:map(WorldHearsayFun,
                                 HearsayItems),
    WorldHearsayGroupFun = fun ({ItemId, Num}) ->
                                   #camp_slot_machine_role{id = RoleId,
                                                           name = RoleName,
                                                           items =
                                                               [{ItemId, Num}],
                                                           time = Now, type = 1}
                           end,
    WorldHearsayGroupData = lists:map(WorldHearsayGroupFun,
                                      GroupHearsayItems),
    inset_world_reward_role(WorldHearsayData ++
                                WorldHearsayGroupData),
    CampRole = Role#role{m_camp_slot_machine =
                             MCampSlotMachine#m_camp_slot_machine{items = []}},
    UnbindGroupTupleItem = [{ItemId, 0, Num}
                            || {ItemId, Num} <- GroupReward],
    GroupMailTitle = lang:get("摇摇乐额外奖励"),
    GroupMailContent =
        lang:get("恭喜您摇到稀有奖励组合！以下为获得的额外奖励，请查收"),
    Gain = format:val_to_gain(Items),
    logger:debug("发放奖励:~w",
                 [{Items, Gain}],
                 camp_slot_machine,
                 102),
    case role_gain:do_notice(Gain, CampRole) of
        {ok, GainRole} ->
            case HearsayItems of
                [_ | _] ->
                    HearsayMsg =
                        notice:format(lang:get("幸运降临，恭喜~ts在夏日摇摇乐活动中获得了~ts，好运连连快来参与吧{face_1,38}"),
                                      [{role_2, RoleName},
                                       {item_2, HearsayItems}]),
                    notice:cast(all, 5, HearsayMsg);
                _ -> ok
            end,
            case GroupHearsayItems of
                [_ | _] ->
                    GroupHearsayMsg =
                        notice:format(lang:get("运气爆棚，恭喜~ts在夏日摇摇乐活动中摇到稀有奖励组合，额外获得~ts小伙伴们纷纷投来羡慕"
                                               "的眼光{face_1,36}"),
                                      [{role_2, RoleName},
                                       {item_2, GroupHearsayItems}]),
                    notice:cast(all, 5, GroupHearsayMsg);
                _ -> ok
            end,
            case UnbindGroupTupleItem of
                [_ | _] ->
                    mail:send(Role,
                              GroupMailTitle,
                              GroupMailContent,
                              UnbindGroupTupleItem);
                _ -> ok
            end,
            {ok, GainRole};
        {false, #gain{reason = bag_full}} ->
            case UnbindGroupTupleItem of
                [_ | _] ->
                    mail:send(Role,
                              GroupMailTitle,
                              GroupMailContent,
                              UnbindGroupTupleItem);
                _ -> ok
            end,
            Title = lang:get("夏日摇摇乐"),
            Content = lang:get("背包已满，摇摇乐奖励已通过邮件发放给您，请查收:"),
            mail:send(Role, Title, Content, Items),
            {ok, CampRole};
        _Err ->
            logger:error("领取奖励错误:~w",
                         [_Err],
                         camp_slot_machine,
                         140),
            {false, lang:get("暂时无法领取奖励")}
    end.

rpc_turn_rand(Role = #role{m_camp_slot_machine =
                               #m_camp_slot_machine{camp_id = CampId}},
              Num)
    when Num =:= 1 orelse Num =:= 10 ->
    case check_turn([camp_reset, camp_time, open_turn],
                    Role,
                    #{})
        of
        {ok, CheckRole, _Args} ->
            Cost = case camp_slot_machine_data:get_cost(CampId) of
                       {CampId, LossId, LossNum} -> [{LossId, LossNum * Num}];
                       _ -> [{70192, Num}]
                   end,
            Loss = format:val_to_loss(Cost),
            case role_gain:do_notice(Loss, CheckRole) of
                {ok, LossRole} ->
                    case do_turn(LossRole, 1, Num) of
                        {ok,
                         TurnRole = #role{m_camp_slot_machine =
                                              #m_camp_slot_machine{items =
                                                                       Result}}} ->
                            Timer = #timer{id = camp_slot_machine_reward,
                                           timeout = 10000, times = 1,
                                           m = camp_slot_machine,
                                           f = apply_get_reward, a = []},
                            TimerRole = role_timer:add(Timer, TurnRole),
                            NewRole = TimerRole,
                            {ok, NewRole, Result};
                        {false, Reason} -> {false, Reason};
                        _ErrResult ->
                            logger:error("未知的抽奖结果:~w",
                                         [_ErrResult],
                                         camp_slot_machine,
                                         176),
                            {false, lang:get("未知的抽奖结果")}
                    end;
                {false, #loss{msg = Msg}} -> {false, Msg};
                _Err ->
                    logger:error("扣除道具失败:~w",
                                 [_Err],
                                 camp_slot_machine,
                                 182),
                    {false, lang:get("资源不足")}
            end;
        {false, Reason} -> {false, Reason};
        _Err ->
            logger:error("老虎机抽奖错误", [], camp_slot_machine, 187),
            {false, lang:get("抽取奖励失败")}
    end;
rpc_turn_rand(_, _) -> {false, lang:get("抽奖错误")}.

rpc_get_reward(#role{m_camp_slot_machine =
                         #m_camp_slot_machine{items = []}}) ->
    {false, lang:get("没有可领取的奖励")};
rpc_get_reward(Role) ->
    TimerRole = role_timer:del(camp_slot_machine_reward,
                               Role),
    apply_get_reward(TimerRole).

rpc_world_reward_role(_Role) ->
    case get_world_reward_role() of
        List when is_list(List) -> List;
        _ -> []
    end.

check_turn([], Role, Args) -> {ok, Role, Args};
check_turn([camp_reset | Rest],
           Role = #role{m_camp_slot_machine =
                            #m_camp_slot_machine{camp_id = CampId}},
           Args) ->
    case CampId =/= get_camp_id() of
        true ->
            {ok, NewRole} = reset(Role),
            check_turn(Rest, NewRole, Args);
        false -> check_turn(Rest, Role, Args)
    end;
check_turn([camp_time | Rest], Role, Args) ->
    Now = date:unixtime2(),
    case campaign_mgr:get_camp_time(60045) of
        {StartT, EndT} when Now >= StartT andalso Now < EndT ->
            check_turn(Rest, Role, Args);
        _ -> {false, lang:get("活动还未开始")}
    end;
check_turn([open_turn | Rest], Role, Args) ->
    Sec = date:seconds_of_the_day(),
    case Sec >= 0 andalso Sec =< 86400 of
        true -> check_turn(Rest, Role, Args);
        _ -> {false, lang:get("活动开启时间为19：00~23:00，记得准时来看哦")}
    end;
check_turn([_ | Rest], Role, Args) ->
    check_turn(Rest, Role, Args).

do_turn(Role, Times, Num) when Times > Num ->
    {ok, Role};
do_turn(Role, Times, Num) ->
    CountRatioList =
        camp_slot_machine_data:get_count_ratio(),
    GroupShowCount = case util:rand_list(CountRatioList, 2)
                         of
                         {Count, _Ratio} -> Count;
                         _ -> 0
                     end,
    logger:debug("展示道具数量:~w",
                 [GroupShowCount],
                 camp_slot_machine,
                 250),
    Index1 = 1,
    {ok, Role1, Items1} = rand_index_item(Role,
                                          0,
                                          Index1,
                                          Index1 =< GroupShowCount),
    [{_, FistItemId, _} | _] = Items1,
    logger:debug("第一个道具id:~w",
                 [Items1],
                 camp_slot_machine,
                 256),
    Index2 = 2,
    {ok, Role2, Items2} = rand_index_item(Role1,
                                          FistItemId,
                                          Index2,
                                          Index2 =< GroupShowCount),
    logger:debug("第2个道具id:~w",
                 [Items2],
                 camp_slot_machine,
                 260),
    Index3 = 3,
    {ok,
     Role3 = #role{m_camp_slot_machine =
                       MCampSlotMachine = #m_camp_slot_machine{reward_times =
                                                                   RewardTimes,
                                                               items = Result}},
     Items3} =
        rand_index_item(Role2,
                        FistItemId,
                        Index3,
                        Index3 =< GroupShowCount),
    logger:debug("第3个道具id:~w",
                 [Items3],
                 camp_slot_machine,
                 265),
    SheffleItems = util:shuffle(Items1 ++ Items2 ++ Items3),
    {ResortItems, _} = lists:foldl(fun ({_, RItemId, RNum},
                                        {Rtn, Index}) ->
                                           {[{Index, RItemId, RNum} | Rtn],
                                            Index + 1}
                                   end,
                                   {[], 1},
                                   SheffleItems),
    TurnResult = {Times, ResortItems},
    NewResut = [TurnResult | Result],
    NewRole = Role3#role{m_camp_slot_machine =
                             MCampSlotMachine#m_camp_slot_machine{reward_times =
                                                                      RewardTimes
                                                                          + 1,
                                                                  items =
                                                                      NewResut}},
    do_turn(NewRole, Times + 1, Num).

rand_index_item(Role = #role{name = _RoleName,
                             sex = Sex,
                             m_camp_slot_machine =
                                 MCampSlotMachine =
                                     #m_camp_slot_machine{guarantee = Guarantee,
                                                          reward_times =
                                                              RewardTimes}},
                FistItemId, Index, IsShowItem) ->
    RewardList =
        camp_slot_machine_data:get_reward_list(Index),
    {GuaranteeItemId, GuaranteeTimes} = case
                                            lists:keyfind(Index, 1, Guarantee)
                                            of
                                            {_, ItemId, Times} ->
                                                #{guarantee_ring :=
                                                      GuaranteeRing} =
                                                    camp_slot_machine_data:get_guarantee({Index,
                                                                                          ItemId}),
                                                case GuaranteeRing =/= 0 andalso
                                                         RewardTimes rem
                                                             GuaranteeRing
                                                             =:= 0
                                                    of
                                                    true -> {ItemId, 0};
                                                    _ -> {ItemId, Times}
                                                end;
                                            _ ->
                                                case [ItemId
                                                      || #{item_id := ItemId,
                                                           guarantee_ring :=
                                                               GuaranteeRing,
                                                           sex := CfgSex}
                                                             <- RewardList,
                                                         GuaranteeRing =/= 0,
                                                         Sex =:= CfgSex orelse
                                                             CfgSex =:= 2]
                                                    of
                                                    [_ItemId | _] ->
                                                        {_ItemId, 0};
                                                    _ -> {0, 0}
                                                end
                                        end,
    logger:debug("保底奖励道具,保底次数:~w",
                 [{GuaranteeItemId, GuaranteeTimes}],
                 camp_slot_machine,
                 302),
    {IsGuarantee, RewardList1} = case
                                     camp_slot_machine_data:get_guarantee({Index,
                                                                           GuaranteeItemId})
                                     of
                                     #{guarantee_ring := GtRing,
                                       min_times := MinTimes,
                                       max_times := MaxTimes} ->
                                         RingTurnTimes = RewardTimes rem GtRing,
                                         LeftTimes = GtRing - RingTurnTimes,
                                         LeftGuaranteeTimes = MinTimes -
                                                                  GuaranteeTimes,
                                         case LeftGuaranteeTimes > 0 andalso
                                                  LeftTimes =<
                                                      LeftGuaranteeTimes
                                             of
                                             true ->
                                                 logger:debug("触发保底, 奖励修改为保底道具:~w",
                                                              [GuaranteeItemId],
                                                              camp_slot_machine,
                                                              313),
                                                 {true,
                                                  [_R
                                                   || _R = #{item_id := ItemId}
                                                          <- RewardList,
                                                      ItemId =:=
                                                          GuaranteeItemId]};
                                             _ ->
                                                 case GuaranteeTimes > MaxTimes
                                                     of
                                                     true ->
                                                         logger:debug("触发保底上限:~w",
                                                                      [{GuaranteeTimes,
                                                                        MaxTimes}],
                                                                      camp_slot_machine,
                                                                      319),
                                                         {false,
                                                          [_R
                                                           || _R = #{item_id :=
                                                                         RItemId}
                                                                  <- RewardList,
                                                              RItemId =/=
                                                                  GuaranteeItemId]};
                                                     _ ->
                                                         logger:debug("正常奖励:",
                                                                      [],
                                                                      camp_slot_machine,
                                                                      322),
                                                         {false, RewardList}
                                                 end
                                         end;
                                     _ ->
                                         logger:debug("没有保底信息:",
                                                      [],
                                                      camp_slot_machine,
                                                      328),
                                         {false, RewardList}
                                 end,
    logger:debug("=========:~w",
                 [{IsGuarantee, IsShowItem}],
                 camp_slot_machine,
                 332),
    RewardList3 = case IsGuarantee =:= false andalso
                           IsShowItem =:= true
                      of
                      true ->
                          logger:debug("展示道具=========:~w",
                                       [camp_slot_machine_data:get_group_item()],
                                       camp_slot_machine,
                                       335),
                          camp_slot_machine_data:get_group_item();
                      _ ->
                          RewardList2 = case Index =/= 1 of
                                            true ->
                                                case
                                                    camp_slot_machine_data:get_guarantee({Index,
                                                                                          FistItemId})
                                                    of
                                                    #{ratio_ch := RatioCh} ->
                                                        lists:map(fun (_R =
                                                                           #{item_id
                                                                                 :=
                                                                                 RItemId,
                                                                             ratio
                                                                                 :=
                                                                                 Ratio}) ->
                                                                          case
                                                                              RItemId
                                                                                  =:=
                                                                                  FistItemId
                                                                              of
                                                                              true ->
                                                                                  _R#{ratio
                                                                                          =>
                                                                                          round(Ratio
                                                                                                    *
                                                                                                    RatioCh
                                                                                                    /
                                                                                                    1000)};
                                                                              _ ->
                                                                                  _R
                                                                          end
                                                                  end,
                                                                  RewardList1);
                                                    _ -> RewardList1
                                                end;
                                            _ -> RewardList1
                                        end,
                          filter_sex_classes_lev(Role, RewardList2, [])
                  end,
    case util:rand_list(RewardList3, ratio) of
        #{item_id := RewardItemId, num := Num} ->
            Items = [{Index, RewardItemId, Num}],
            case lists:keyfind(Index, 1, Guarantee) of
                {Index, _GItemId, _GTimes}
                    when GuaranteeItemId =:= RewardItemId ->
                    NewGuarantee = lists:keystore(Index,
                                                  1,
                                                  Guarantee,
                                                  {Index,
                                                   GuaranteeItemId,
                                                   GuaranteeTimes + 1}),
                    NewRole = Role#role{m_camp_slot_machine =
                                            MCampSlotMachine#m_camp_slot_machine{guarantee
                                                                                     =
                                                                                     NewGuarantee}},
                    {ok, NewRole, Items};
                {Index, _GItemId, _GTimes} ->
                    NewGuarantee = lists:keystore(Index,
                                                  1,
                                                  Guarantee,
                                                  {Index,
                                                   GuaranteeItemId,
                                                   GuaranteeTimes}),
                    NewRole = Role#role{m_camp_slot_machine =
                                            MCampSlotMachine#m_camp_slot_machine{guarantee
                                                                                     =
                                                                                     NewGuarantee}},
                    {ok, NewRole, Items};
                _ when GuaranteeItemId =:= RewardItemId ->
                    NewGuarantee = [{Index, GuaranteeItemId, 1}
                                    | Guarantee],
                    NewRole = Role#role{m_camp_slot_machine =
                                            MCampSlotMachine#m_camp_slot_machine{guarantee
                                                                                     =
                                                                                     NewGuarantee}},
                    {ok, NewRole, Items};
                _ -> {ok, Role, Items}
            end;
        _Err ->
            logger:error("~w进行抽奖错误:~w, 奖励库:~w",
                         [_RoleName, _Err, RewardList3],
                         camp_slot_machine,
                         381),
            false
    end.

filter_sex_classes_lev(_Role, [], FilterList) ->
    FilterList;
filter_sex_classes_lev(Role = #role{sex = Sex,
                                    classes = Classes, lev = Lev},
                       [R = #{sex := CfgSex, classes := CfgClasses,
                              min_lev := MinLev, max_lev := MaxLev}
                        | Rest],
                       FilterList)
    when (Classes =:= CfgClasses orelse CfgClasses =:= 0)
             andalso
             (Sex =:= CfgSex orelse CfgSex =:= 2) andalso
                 Lev >= MinLev andalso Lev =< MaxLev ->
    filter_sex_classes_lev(Role, Rest, [R | FilterList]);
filter_sex_classes_lev(Role, [_ | Rest], FilterList) ->
    filter_sex_classes_lev(Role, Rest, FilterList).

get_camp_id() -> campaign_mgr:get_camp_id(60045).

inset_world_reward_role([]) -> ok;
inset_world_reward_role([Data | Rest]) ->
    inset_world_reward_role(Data),
    inset_world_reward_role(Rest);
inset_world_reward_role(Data =
                            #camp_slot_machine_role{}) ->
    case env:get(camp_slot_machine_reward_role) of
        List when is_list(List) ->
            NewList = [Data | List],
            NewL =
                lists:sublist(lists:reverse(lists:keysort(#camp_slot_machine_role.time,
                                                          NewList)),
                              20),
            env:set(camp_slot_machine_reward_role, NewL);
        _ -> env:set(camp_slot_machine_reward_role, [Data])
    end;
inset_world_reward_role(_) -> ok.

get_world_reward_role() ->
    env:get(camp_slot_machine_reward_role).

