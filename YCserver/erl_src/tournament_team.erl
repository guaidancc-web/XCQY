-file("src/mod/tournament/tournament_team.erl", 1).

-module(tournament_team).

-export([join/1,
         quit/1,
         login/2,
         logout/1,
         match/2,
         fight/2,
         combat_over/1,
         combat_fail/3,
         change_form/3,
         usurp/1,
         vote_usurper/3,
         handover/3,
         change_order/3,
         clear/0,
         chat/3,
         push_mate_info/3,
         test_match/0,
         guard_open/5]).

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

-file("src/mod/tournament/tournament_team.erl", 30).

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

-file("src/mod/tournament/tournament_team.erl", 31).

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

-file("src/mod/tournament/tournament_team.erl", 32).

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

-file("src/mod/tournament/tournament_team.erl", 33).

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

-file("src/mod/tournament/tournament_team.erl", 34).

-file("inc/tournament.hrl", 1).

-record(m_tournament,
        {ver = 3 :: non_neg_integer(),
         triggers = [] :: list(),
         status = 0 :: non_neg_integer(),
         rewarded = [] :: list(),
         pk_type = 0,
         kingbadgenum = 0,
         starlev = 0,
         kingbadge = [] :: list(),
         showbadge = 0}).

-record(tournament_profile,
        {id = {0, "", 0} :: tuple(),
         ver = 11 :: non_neg_integer(),
         name = "" :: string(),
         lev = 0 :: non_neg_integer(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         rank_lev = 1 :: non_neg_integer(),
         rank_point = 0 :: non_neg_integer(),
         liked = 0 :: non_neg_integer(),
         liked_other = 0 :: non_neg_integer(),
         last_matched = 0 :: non_neg_integer(),
         day_matched = 0 :: non_neg_integer(),
         day_win = 0 :: non_neg_integer(),
         day_win_sustained = 0 :: non_neg_integer(),
         season_rank_lev = 1 :: non_neg_integer(),
         season_rank_point = 0 :: non_neg_integer(),
         combat_count = 0 :: non_neg_integer(),
         win_count = 0 :: non_neg_integer(),
         win_sustained = 0 :: non_neg_integer(),
         season_kill = 0 :: non_neg_integer(),
         season_reverse = 0 :: non_neg_integer(),
         season_revive = 0 :: non_neg_integer(),
         season_dmg = 0 :: non_neg_integer(),
         season_bearing_dmg = 0 :: non_neg_integer(),
         season_zero_dmg = 0 :: non_neg_integer(),
         season_pet_revive = 0 :: non_neg_integer(),
         best_rank_point = 0 :: non_neg_integer(),
         best_rank_lev = 1 :: non_neg_integer(),
         best_win_count = 0 :: non_neg_integer(),
         best_win_sustained = 0 :: non_neg_integer(),
         best_partner = [] :: list(),
         week_rank_lev = 1 :: non_neg_integer(),
         week_rank_point = 0 :: non_neg_integer(),
         awesome_kill = 0 :: non_neg_integer(),
         awesome_kill_num = 0 :: non_neg_integer(),
         awesome_dmg = 0 :: non_neg_integer(),
         awesome_heal = 0 :: non_neg_integer(),
         awesome_control = 0 :: non_neg_integer(),
         mvp = 0 :: non_neg_integer(),
         loss_mvp = 0 :: non_neg_integer(),
         season_awesome_kill = 0 :: non_neg_integer(),
         season_awesome_kill_num = 0 :: non_neg_integer(),
         season_awesome_dmg = 0 :: non_neg_integer(),
         season_awesome_heal = 0 :: non_neg_integer(),
         season_awesome_control = 0 :: non_neg_integer(),
         season_mvp = 0 :: non_neg_integer(),
         season_loss_mvp = 0 :: non_neg_integer(),
         consecutive_lost = 0 :: non_neg_integer(),
         reported = 0 :: non_neg_integer(),
         reported_other = 0 :: non_neg_integer(),
         reported_logs = [] :: list(),
         banned_date = 0 :: non_neg_integer(),
         reported_single_match = 0,
         is_auto_combat = 0,
         guards = [],
         historical_high = 0 :: non_neg_integer(),
         show_badge_id = 0 :: non_neg_integer(),
         promotion_win = 0 :: non_neg_integer(),
         upgrade_point = 0 :: non_neg_integer()}).

-record(tournament_role,
        {id = {0, "", 0} :: tuple(),
         status = 0 :: non_neg_integer(),
         name = "" :: string(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         fc = 0 :: non_neg_integer(),
         looks = [] :: list(),
         times = 1 :: non_neg_integer(),
         point = 1 :: non_neg_integer(),
         rank_lev = 1 :: non_neg_integer(),
         rank_point = 0 :: non_neg_integer(),
         pid :: undefined | pid() | 0,
         is_online = 0 :: 0 | 1,
         match_id = 0 :: non_neg_integer(),
         side = 0 :: non_neg_integer(),
         is_leader = 0 :: 0 | 1,
         last_matched = 0 :: non_neg_integer(),
         team_id = [] :: list(),
         formation_id = 1 :: non_neg_integer(),
         formation_lev = 1 :: non_neg_integer(),
         partner = [] :: list(),
         consecutive_lost = 0 :: non_neg_integer(),
         reported = 0 :: non_neg_integer(),
         guards = [],
         show_badge_id = 0 :: non_neg_integer()}).

-record(tournament_team,
        {ids = [] :: list(),
         output_num = 0 :: non_neg_integer(),
         assist_num = {0, 0} ::
             {non_neg_integer(), non_neg_integer()},
         origin_ids = [] :: list(),
         num = 1 :: non_neg_integer(),
         sum_point = 0 :: non_neg_integer(),
         max_point = 0 :: non_neg_integer(),
         min_point = 0 :: non_neg_integer(),
         sum_lev = 0 :: non_neg_integer(),
         max_lev = 0 :: non_neg_integer(),
         min_lev = 0 :: non_neg_integer(),
         tried_match = 0 :: non_neg_integer(),
         match_id = 0 :: non_neg_integer(),
         usurpers = [] :: list(),
         order = [] :: list(),
         classes = [] :: list()}).

-record(tournament_match,
        {id = 0 :: non_neg_integer(),
         teams = [] :: list(),
         time = 0 :: non_neg_integer(),
         combat_pid :: undefined | pid(),
         calc_args = [] :: list()}).

-record(tournament_usurper,
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

-record(tournament_celebrity,
        {id = {0, "", 0} :: tuple(),
         name = "" :: string(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         val1 = 0 :: non_neg_integer(),
         val2 = 0 :: non_neg_integer()}).

-record(tournament_fighter,
        {id = {0, "", 0} :: tuple(),
         name = "" :: string(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         rank_lev = 1 :: non_neg_integer(),
         rank_point = 0 :: non_neg_integer(),
         kill_num = 0,
         dead_num = 0,
         total_heal = 0,
         control_num = 0,
         total_hurt = 0 :: non_neg_integer(),
         total_dmg = 0 :: non_neg_integer(),
         mvp_score = 0 :: non_neg_integer()}).

-record(tournament_season_role,
        {ver = 0,
         id = {0, "", 0} :: tuple(),
         name = "" :: string(),
         reward_lev = 0 :: non_neg_integer(),
         rewarded = 0 :: non_neg_integer()}).

-record(tournament_result,
        {id = {0, "", 0},
         ver = 3,
         is_win = 1,
         mates = [],
         rival = [],
         match_id = 0,
         record_pz = {"", 0} :: tuple(),
         time = 0,
         rank_lev = 0}).

-record(tournament_result_role,
        {id = {0, "", 0},
         ver = 1,
         recent = [],
         last_recent = []}).

-record(king_badge,
        {id = 0,
         status = 0,
         active_effect_type = 3,
         active_attr = [],
         fc = 0}).

-record(tournament_match_report_info,
        {match_id, can_report = [], result}).

-file("src/mod/tournament/tournament_team.erl", 35).

-compile(export_all).

join(TeamMates) ->
    case check_join(TeamMates, 1) of
        ok -> do_join(TeamMates);
        Else -> Else
    end.

do_join(TeamMates) ->
    Ids = lists:sort([Id
                      || #tournament_role{id = Id} <- TeamMates]),
    Classes = [C
               || #tournament_role{classes = C} <- TeamMates],
    SumLev = lists:sum([Lv
                        || #tournament_role{lev = Lv} <- TeamMates]),
    MaxLev = lists:max([Lv
                        || #tournament_role{lev = Lv} <- TeamMates]),
    MinLev = lists:min([Lv
                        || #tournament_role{lev = Lv} <- TeamMates]),
    SumPoint = lists:sum([Rp
                          || #tournament_role{rank_point = Rp} <- TeamMates]),
    MaxPoint = lists:max([Rp
                          || #tournament_role{rank_point = Rp} <- TeamMates]),
    MinPoint = lists:min([Rp
                          || #tournament_role{rank_point = Rp} <- TeamMates]),
    {Output, Assist = {Free, Devine}} =
        calc_classes_num(Classes, 0, {0, 0}),
    Team = #tournament_team{ids = Ids, origin_ids = [Ids],
                            output_num = Output, assist_num = Assist,
                            num = Output + Free + Devine, sum_lev = SumLev,
                            max_lev = MaxLev, sum_point = SumPoint,
                            max_point = MaxPoint, min_lev = MinLev,
                            min_point = MinPoint, classes = Classes},
    Mates1 = [update_profile(M) || M <- TeamMates],
    ets:insert(tournament_team, Team),
    logger:debug("=====", [], tournament_team, 87),
    ets:insert(tournament_role,
               [Mate#tournament_role{team_id = Ids}
                || Mate <- Mates1]),
    ok.

quit(Id) ->
    case ets:lookup(tournament_role, Id) of
        [R = #tournament_role{match_id = 0, team_id = Ids}] ->
            ets:insert(tournament_role,
                       R#tournament_role{is_online = 0, pid = 0,
                                         team_id = []}),
            case ets:lookup(tournament_team, Ids) of
                [#tournament_team{}] ->
                    ets:insert(tournament_role,
                               [Mate#tournament_role{team_id = []}
                                || Mate <- get_mates(Ids)]),
                    multi_apply(Ids -- [Id], quit),
                    ets:delete(tournament_team, Ids);
                _ -> ok
            end,
            ok;
        [#tournament_role{match_id = MatchId}]
            when MatchId =/= 0 ->
            {false, lang:get("已经匹配上对手，请进行完比赛吧")};
        _ -> ok
    end.

login(Id, Pid) ->
    case ets:lookup(tournament_role, Id) of
        [R = #tournament_role{team_id = TeamId}]
            when TeamId =/= [] ->
            ets:insert(tournament_role,
                       R#tournament_role{is_online = 1, pid = Pid}),
            role:apply(async,
                       Pid,
                       {tournament_role, callback, [login]});
        _ -> ok
    end.

logout(Id) ->
    case ets:lookup(tournament_role, Id) of
        [R = #tournament_role{match_id = 0, team_id = Ids}] ->
            ets:insert(tournament_role,
                       R#tournament_role{is_online = 0, pid = 0,
                                         team_id = []}),
            case ets:lookup(tournament_team, Ids) of
                [#tournament_team{}] ->
                    ets:insert(tournament_role,
                               [Mate#tournament_role{team_id = []}
                                || Mate <- get_mates(Ids)]),
                    multi_apply(Ids -- [Id], quit),
                    ets:delete(tournament_team, Ids);
                _ -> ok
            end;
        [R = #tournament_role{}] ->
            ets:insert(tournament_role,
                       R#tournament_role{is_online = 0, pid = 0});
        _ -> ok
    end.

match(NextId, PkType) ->
    L = ets:tab2list(tournament_team),
    Now = date:unixtime(),
    group_match([126,
                 116,
                 111,
                 106,
                 101,
                 95,
                 90,
                 85,
                 80,
                 75],
                #{list => L, next_id => NextId, time => Now,
                  pk_type => PkType}).

fight(MatchId, Args) ->
    case ets:lookup(tournament_match, MatchId) of
        [M = #tournament_match{}] -> do_fight(M, Args);
        _ -> ok
    end.

combat_over(#{pk_type := PkType, winner := Winner,
              loser := Loser, match_id := MatchId, round := Round,
              record_pz := PZ}) ->
    SumDmgW = lists:sum([Dmg1
                         || #fighter{combat_statistics =
                                         #combat_statistics{total_dmg = Dmg1}}
                                <- Winner]),
    AvgDmgW = round(SumDmgW / 5 / Round),
    SumDmgL = lists:sum([Dmg4
                         || #fighter{combat_statistics =
                                         #combat_statistics{total_dmg = Dmg4}}
                                <- Loser]),
    AvgDmgL = round(SumDmgL / 5 / Round),
    WFighters = [to(fighter, F, AvgDmgW) || F <- Winner],
    LFighters = [to(fighter, F, AvgDmgL) || F <- Loser],
    MaxDmg = lists:max([Dmg3
                        || #fighter{combat_statistics =
                                        #combat_statistics{total_dmg = Dmg3}}
                               <- Loser ++ Winner]),
    MaxKill = lists:max([Kill
                         || #fighter{combat_statistics =
                                         #combat_statistics{kill_group_target =
                                                                Kill}}
                                <- Loser ++ Winner]),
    MaxHeal = lists:max([Heal
                         || #fighter{combat_statistics =
                                         #combat_statistics{total_heal = Heal}}
                                <- Loser ++ Winner]),
    MaxControl = lists:max([Control
                            || #fighter{combat_statistics =
                                            #combat_statistics{control_num =
                                                                   Control}}
                                   <- Loser ++ Winner]),
    MvpScore = case Winner of
                   [] ->
                       logger:error("战斗结束没有胜利者 ~w",
                                    [Loser],
                                    tournament_team,
                                    168),
                       0;
                   _ ->
                       lists:max([calc_mvp_score(Stats, AvgDmgW)
                                  || #fighter{combat_statistics = Stats}
                                         <- Winner])
               end,
    LossMvpScore = case Loser of
                       [] ->
                           logger:error("战斗结束没有失败者 ~w",
                                        [Winner],
                                        tournament_team,
                                        174),
                           0;
                       _ ->
                           lists:max([calc_mvp_score(Stats, AvgDmgL)
                                      || #fighter{combat_statistics = Stats}
                                             <- Loser])
                   end,
    StatsArgs = #{max_dmg => MaxDmg, max_kill => MaxKill,
                  max_heal => MaxHeal, max_control => MaxControl,
                  mvp_score => MvpScore, loss_mvp_score => LossMvpScore},
    case ets:lookup(tournament_match, MatchId) of
        [M = #tournament_match{}] ->
            calc_fighters(Winner,
                          M,
                          #{type => win, pk_type => PkType,
                            stats_args => StatsArgs#{avg_dmg => AvgDmgW},
                            mates => WFighters, rival => LFighters,
                            match_id => MatchId, record_pz => PZ}),
            calc_fighters(Loser,
                          M,
                          #{type => lost, pk_type => PkType,
                            stats_args => StatsArgs#{avg_dmg => AvgDmgL},
                            mates => LFighters, rival => WFighters,
                            match_id => MatchId, record_pz => PZ});
        _ ->
            calc_fighters(Winner,
                          #tournament_match{},
                          #{type => win, pk_type => PkType,
                            stats_args => StatsArgs#{avg_dmg => AvgDmgW},
                            mates => WFighters, rival => LFighters,
                            match_id => MatchId, record_pz => PZ}),
            calc_fighters(Loser,
                          #tournament_match{},
                          #{type => lost, pk_type => PkType,
                            stats_args => StatsArgs#{avg_dmg => AvgDmgL},
                            mates => LFighters, rival => WFighters,
                            match_id => MatchId, record_pz => PZ})
    end,
    logger:debug("战斗结果 ~w",
                 [MatchId],
                 tournament_team,
                 187),
    ets:delete(tournament_match, MatchId).

combat_fail(Ids1, Ids2, MatchId) ->
    case ets:lookup(tournament_match, MatchId) of
        [#tournament_match{calc_args = CalcArgs}] ->
            fight_result(combat_error, {Ids1, Ids2}, CalcArgs);
        _ -> fight_result(combat_error, {Ids1, Ids2}, [])
    end,
    logger:debug("战斗结果 ~w",
                 [MatchId],
                 tournament_team,
                 198),
    ets:delete(tournament_match, MatchId).

chat(Id, Cmd, Msg) ->
    case ets:lookup(tournament_role, Id) of
        [#tournament_role{team_id = Ids}] ->
            do_chat(Ids, Cmd, Msg);
        _ -> ok
    end.

push_mate_info(ConnPid, {Cmd, MaxJoin, PkType}, Id) ->
    Profile = case ets:lookup(tournament_profile, Id) of
                  P = #tournament_profile{} -> P;
                  _ -> #tournament_profile{}
              end,
    IsMatching = 1,
    {CMates, NOrder} = case ets:lookup(tournament_role, Id)
                           of
                           [#tournament_role{team_id = Ids, match_id = 0}] ->
                               {get_mates(Ids), []};
                           [#tournament_role{team_id = Ids,
                                             match_id = MatchId}] ->
                               case ets:lookup(tournament_match, MatchId) of
                                   [#tournament_match{teams = Teams}] ->
                                       case lists:keyfind(Ids,
                                                          #tournament_team.ids,
                                                          Teams)
                                           of
                                           #tournament_team{order = Order} ->
                                               {get_mates(Order), Order};
                                           _ -> {get_mates(Ids), []}
                                       end;
                                   _ -> {get_mates(Ids), []}
                               end;
                           _ -> {[], []}
                       end,
    NOrder2 = order_conver(NOrder, []),
    Data = {IsMatching,
            PkType,
            Profile,
            MaxJoin,
            CMates,
            NOrder2},
    logger:debug("=====~w", [Data], tournament_team, 235),
    sys_conn:pack_send(ConnPid, Cmd, Data).

change_form(Id, FormationId, FormationLev) ->
    case ets:lookup(tournament_role, Id) of
        [R = #tournament_role{is_leader = 1, match_id = MatchId,
                              team_id = Ids, name = Name}]
            when MatchId =/= 0 ->
            NewOrder = case ets:lookup(tournament_match, MatchId) of
                           [#tournament_match{teams = Teams}] ->
                               case lists:keyfind(Ids,
                                                  #tournament_team.ids,
                                                  Teams)
                                   of
                                   #tournament_team{order = Order} -> Order;
                                   _ -> []
                               end;
                           _ -> []
                       end,
            LevName = case FormationLev of
                          2 -> "Lv.2";
                          3 -> "Lv.3";
                          4 -> "Lv.4";
                          _ -> "Lv.1"
                      end,
            NewMates = [R#tournament_role{formation_id =
                                              FormationId,
                                          formation_lev = FormationLev}],
            notice(Ids,
                   notice:format(lang:get("队长~ts将阵法切换至~ts~ts"),
                                 [{role_2, Name},
                                  {string_2,
                                   1,
                                   formation:get_name(FormationId)},
                                  {string_1, LevName}])),
            push_conver(Ids, 16413, {NewMates, NewOrder}),
            ets:insert(tournament_role, NewMates),
            ok;
        _ -> {false, lang:get("不能切换阵法")}
    end.

usurp(Id) ->
    case ets:lookup(tournament_role, Id) of
        [R = #tournament_role{match_id = MatchId}] ->
            case ets:lookup(tournament_match, MatchId) of
                [M = #tournament_match{}] -> do_usurp(R, M);
                _ -> {false, lang:get("还没匹配上队伍呢")}
            end;
        _ -> {false, lang:get("找不到报名信息")}
    end.

vote_usurper(Id, Decision, Args) ->
    case ets:lookup(tournament_role, Id) of
        [R = #tournament_role{match_id = MatchId}] ->
            case ets:lookup(tournament_match, MatchId) of
                [M = #tournament_match{}] ->
                    do_vote(R, Decision, M, Args);
                _ -> {false, lang:get("还没匹配上队伍呢")}
            end;
        _ -> {false, lang:get("找不到报名信息")}
    end.

handover(Id, TargetId, Args) ->
    case ets:lookup(tournament_role, Id) of
        [#tournament_role{match_id = 0}] ->
            {false, lang:get("还没匹配成功，不能委任队长")};
        [#tournament_role{is_leader = 0}] ->
            {false, lang:get("你不是队长")};
        [Former = #tournament_role{match_id = MatchId,
                                   team_id = TeamId, is_leader = 1}] ->
            case ets:lookup(tournament_role, TargetId) of
                [Succeed = #tournament_role{match_id = MatchId,
                                            team_id = TeamId,
                                            name = LeaderName}] ->
                    NewMates = [Former#tournament_role{is_leader = 0},
                                Succeed#tournament_role{is_leader = 1}],
                    case ets:lookup(tournament_match, MatchId) of
                        [Match = #tournament_match{teams = Teams}] ->
                            case lists:keyfind(TeamId,
                                               #tournament_team.ids,
                                               Teams)
                                of
                                Team = #tournament_team{order = Order} ->
                                    TOrder1 = team_util:exchange_order(Order,
                                                                       Id,
                                                                       TargetId),
                                    Order1 = order_guard(TOrder1,
                                                         NewMates,
                                                         Args),
                                    notice(TeamId,
                                           notice:format(lang:get("~ts成为新队长"),
                                                         [{role_2,
                                                           LeaderName}])),
                                    push_conver(TeamId,
                                                16413,
                                                {NewMates, Order1}),
                                    NewTeams = lists:keyreplace(TeamId,
                                                                #tournament_team.ids,
                                                                Teams,
                                                                Team#tournament_team{usurpers
                                                                                         =
                                                                                         [],
                                                                                     order
                                                                                         =
                                                                                         Order1}),
                                    ets:insert(tournament_match,
                                               Match#tournament_match{teams =
                                                                          NewTeams});
                                _ ->
                                    logger:debug("找不到队伍 ~w",
                                                 [TeamId],
                                                 tournament_team,
                                                 315),
                                    ok
                            end;
                        _ ->
                            logger:debug("找不到对阵信息 ~w",
                                         [MatchId],
                                         tournament_team,
                                         319),
                            ok
                    end,
                    ets:insert(tournament_role, NewMates),
                    ok;
                [#tournament_role{}] -> {false, lang:get("对方貌似不是你队友")};
                _ -> {false, lang:get("找不到队友")}
            end;
        _ -> {false, lang:get("现在不能委任")}
    end.

guard_open(Id, TargetId, OrderId, Guards, _Args) ->
    case ets:lookup(tournament_role, Id) of
        [#tournament_role{match_id = 0}] ->
            {false, lang:get("还没匹配成功，不能替换")};
        [#tournament_role{is_leader = 0}] ->
            {false, lang:get("你不是队长")};
        [Former = #tournament_role{match_id = MatchId,
                                   team_id = TeamId, is_leader = 1}] ->
            case ets:lookup(tournament_match, MatchId) of
                [Match = #tournament_match{teams = Teams}] ->
                    case lists:keyfind(TeamId, #tournament_team.ids, Teams)
                        of
                        Team = #tournament_team{order = Order} ->
                            case lists:member(TargetId, Order) of
                                false ->
                                    GIds = [IId || {IId, _, _, _} <- Guards],
                                    Order1 = guard_open_order(Order,
                                                              TargetId,
                                                              OrderId,
                                                              1,
                                                              []),
                                    OrderIds1 = [I
                                                 || I <- Order1, is_integer(I)],
                                    GIds2 = OrderIds1 ++
                                                ((GIds ++ Order) -- OrderIds1)
                                                    -- Order,
                                    Guards3 = [{I, 1, 1, Q}
                                               || {I, _, _, Q} <- Guards,
                                                  lists:member(I, GIds2) and
                                                      is_integer(I)],
                                    NewFormer = Former#tournament_role{guards =
                                                                           Guards3},
                                    NewMates = [NewFormer],
                                    update_profile(NewFormer),
                                    push_conver(TeamId,
                                                16413,
                                                {NewMates, Order1}),
                                    NewTeams = lists:keyreplace(TeamId,
                                                                #tournament_team.ids,
                                                                Teams,
                                                                Team#tournament_team{usurpers
                                                                                         =
                                                                                         [],
                                                                                     order
                                                                                         =
                                                                                         Order1}),
                                    ets:insert(tournament_role, NewMates),
                                    ets:insert(tournament_match,
                                               Match#tournament_match{teams =
                                                                          NewTeams}),
                                    ok;
                                _ -> {false, lang:get("守护已经上阵")}
                            end;
                        _ ->
                            logger:debug("找不到队伍 ~w",
                                         [TeamId],
                                         tournament_team,
                                         378),
                            ok
                    end;
                _ ->
                    logger:debug("找不到对阵信息 ~w",
                                 [MatchId],
                                 tournament_team,
                                 382),
                    {false, lang:get("找不到对阵信息")}
            end;
        _ -> {false, lang:get("现在不能委任")}
    end.

change_order(Id, Oid, Tid) ->
    case ets:lookup(tournament_role, Id) of
        [R = #tournament_role{match_id = MatchId}] ->
            case ets:lookup(tournament_match, MatchId) of
                [M = #tournament_match{}] ->
                    do_change_order(R, M, Oid, Tid);
                _ -> {false, lang:get("还没匹配上队伍呢")}
            end;
        _ -> {false, lang:get("找不到报名信息")}
    end.

clear() ->
    [CombatPid ! stop_result
     || [CombatPid]
            <- ets:match(tournament_match,
                         #tournament_match{combat_pid = '$1', _ = '_'}),
        is_pid(CombatPid)],
    ets:delete_all_objects(tournament_role),
    ets:delete_all_objects(tournament_team),
    ets:delete_all_objects(tournament_match).

do_match([], UnMatched, #{next_id := NextId}) ->
    acc_origin_tried(UnMatched),
    NextId;
do_match([Orphan], UnMatched, Args) ->
    do_match([], [Orphan | UnMatched], Args);
do_match([Team1 = #tournament_team{ids = Ids01,
                                   origin_ids = Origins1, max_point = MaxPoint1}
          | T],
         UnMatched,
         Args = #{next_id := NextId, time := Now,
                  pk_type := PkType}) ->
    case match_enemy(T, Team1, Args, []) of
        {ok,
         #tournament_team{ids = Ids02, origin_ids = Origins2,
                          max_point = MaxPoint2},
         Rest} ->
            [ets:delete(tournament_team, DelIds1)
             || DelIds1 <- Origins1],
            [ets:delete(tournament_team, DelIds2)
             || DelIds2 <- Origins2],
            BalanceType = case max(MaxPoint1, MaxPoint2) >= 200 of
                              true -> rank_point;
                              _ -> fc
                          end,
            {Bmates1, Bmates2} = case PkType of
                                     2 ->
                                         balance_arrange_2v2(BalanceType,
                                                             Ids01,
                                                             Ids02);
                                     _ ->
                                         TeamMates1 = get_mates(Ids01),
                                         TeamMates2 = get_mates(Ids02),
                                         balance_exchange(BalanceType,
                                                          TeamMates1,
                                                          TeamMates2,
                                                          1)
                                 end,
            RankPt1 = lists:sum([Pt
                                 || #tournament_role{rank_point = Pt}
                                        <- Bmates1]),
            RankPt2 = lists:sum([Pt
                                 || #tournament_role{rank_point = Pt}
                                        <- Bmates2]),
            case abs(RankPt1 - RankPt2) of
                DecNum when DecNum > 700 andalso PkType == 1 ->
                    logger:info("双方总分差:~w ---->pk_type: ~w; mates1:  "
                                "~w, mates2 : ~w, 原来队伍-> ids1 : ~w, ids2 "
                                ": ~w",
                                [DecNum,
                                 PkType,
                                 Bmates1,
                                 Bmates2,
                                 Ids01,
                                 Ids02],
                                tournament_team,
                                449);
                DecNum when DecNum > 300 andalso PkType == 2 ->
                    logger:info("双方总分差:~w ---->pk_type: ~w; mates1:  "
                                "~w, mates2 : ~w, 原来队伍-> ids1 : ~w, ids2 "
                                ": ~w",
                                [DecNum,
                                 PkType,
                                 Bmates1,
                                 Bmates2,
                                 Ids01,
                                 Ids02],
                                tournament_team,
                                451);
                _ -> ok
            end,
            Ids1 = lists:sort([Id
                               || #tournament_role{id = Id} <- Bmates1]),
            Ids2 = lists:sort([Id
                               || #tournament_role{id = Id} <- Bmates2]),
            Mates1 = update_mates(Bmates1,
                                  #{match_id => NextId, side => 1, time => Now,
                                    ids => Ids1}),
            Mates2 = update_mates(Bmates2,
                                  #{match_id => NextId, side => 2, time => Now,
                                    ids => Ids2}),
            NewMates1 = select_leader(Mates1),
            NewMates2 = select_leader(Mates2),
            TOrder1 = [Oid
                       || #tournament_role{id = Oid} <- NewMates1],
            TOrder2 = [Oid
                       || #tournament_role{id = Oid} <- NewMates2],
            Order1 = case NewMates1 of
                         [#tournament_role{guards = Guards1} | _]
                             when PkType == 2 ->
                             Num1 = 5 - length(TOrder1),
                             NGuardIds1 = [GbaseId
                                           || {GbaseId, _, _, _} <- Guards1],
                             TOrder1 ++ lists:sublist(NGuardIds1, Num1);
                         _ -> TOrder1
                     end,
            Order2 = case NewMates2 of
                         [#tournament_role{guards = Guards2} | _]
                             when PkType == 2 ->
                             Num2 = 5 - length(TOrder2),
                             NGuardIds2 = [GbaseId
                                           || {GbaseId, _, _, _} <- Guards2],
                             TOrder2 ++ lists:sublist(NGuardIds2, Num2);
                         _ -> TOrder2
                     end,
            ets:insert(tournament_role, NewMates1),
            ets:insert(tournament_role, NewMates2),
            NewTeam1 = re_init(#tournament_team{ids = Ids1,
                                                order = Order1},
                               NewMates1),
            Team2 = re_init(#tournament_team{ids = Ids2,
                                             order = Order2},
                            NewMates2),
            Match = #tournament_match{id = NextId,
                                      teams = [NewTeam1, Team2], time = Now},
            ets:insert(tournament_match, Match),
            ClassListA = [CLA1
                          || #tournament_role{classes = CLA1} <- NewMates1],
            ClassListB = [CLA2
                          || #tournament_role{classes = CLA2} <- NewMates2],
            LevListA = [ok
                        || #tournament_role{lev = 89} <- NewMates1],
            LevListB = [ok
                        || #tournament_role{lev = 89} <- NewMates2],
            NumA4 = length([ok || N <- ClassListA, N =:= 4]),
            NumB4 = length([ok || N <- ClassListB, N =:= 4]),
            NumA5 = length([ok || N <- ClassListA, N =:= 5]),
            NumB5 = length([ok || N <- ClassListB, N =:= 5]),
            case (NumA4 + NumA5 =:= 0 orelse
                      NumB4 + NumB5 =:= 0 orelse
                          NumB4 + NumB5 > 2 orelse NumA4 + NumA5 > 2)
                     andalso PkType =/= 2
                of
                true ->
                    logger:error("88888888武道会匹配错误职业：~w",
                                 [{ClassListA, ClassListB}],
                                 tournament_team,
                                 500);
                _ ->
                    logger:debug("88888888匹配职业:~w",
                                 [{ClassListA, ClassListB}],
                                 tournament_team,
                                 502),
                    ok
            end,
            case length(LevListA) =/= length(LevListB) of
                true ->
                    logger:error("错误匹配89级斗友：~w",
                                 [{LevListA, LevListB}],
                                 tournament_team,
                                 507);
                _ -> ok
            end,
            AllMates = NewMates1 ++ NewMates2,
            ParternerNum = erlang:length([ok
                                          || #tournament_role{partner = Ptner}
                                                 <- AllMates,
                                             Ptner =/= []]),
            SingleNum = erlang:length([ok
                                       || #tournament_role{partner = Ptner}
                                              <- AllMates,
                                          Ptner =:= []]),
            _LevList = [Lev
                        || #tournament_role{lev = Lev} <- AllMates],
            _TmpMaxLev = lists:max(_LevList),
            _TmpMinLev = lists:min(_LevList),
            logger:info("双方分差:~w, 双排人数:~w, 单排人数:~w,最高等级:~w, 最低等级:~w",
                        [abs(RankPt1 - RankPt2),
                         ParternerNum,
                         SingleNum,
                         _TmpMaxLev,
                         _TmpMinLev],
                        tournament_team,
                        519),
            logger:debug("匹配成功站位：~w",
                         [{Order1, Order2}],
                         tournament_team,
                         521),
            push_matched({NewMates1, Order1},
                         {NewMates2, Order2},
                         Args,
                         Now),
            tournament:prepare_fight(NextId),
            do_match(Rest, UnMatched, Args#{next_id := NextId + 1});
        _ -> do_match(T, [Team1 | UnMatched], Args)
    end.

re_init(Team = #tournament_team{}, TeamMates) ->
    Classes = [C
               || #tournament_role{classes = C} <- TeamMates],
    SumLev = lists:sum([Lv
                        || #tournament_role{lev = Lv} <- TeamMates]),
    MaxLev = lists:max([Lv
                        || #tournament_role{lev = Lv} <- TeamMates]),
    MinLev = lists:min([Lv
                        || #tournament_role{lev = Lv} <- TeamMates]),
    SumPoint = lists:sum([Rp
                          || #tournament_role{rank_point = Rp} <- TeamMates]),
    MaxPoint = lists:max([Rp
                          || #tournament_role{rank_point = Rp} <- TeamMates]),
    MinPoint = lists:min([Rp
                          || #tournament_role{rank_point = Rp} <- TeamMates]),
    {Output, Assist = {Free, Devine}} =
        calc_classes_num(Classes, 0, {0, 0}),
    Team#tournament_team{output_num = Output,
                         assist_num = Assist, num = Output + Free + Devine,
                         sum_lev = SumLev, max_lev = MaxLev,
                         sum_point = SumPoint, max_point = MaxPoint,
                         min_lev = MinLev, min_point = MinPoint,
                         classes = Classes}.

balance_arrange(rank_point, Ids1, Ids2) ->
    L1 = get_mates(Ids1 ++ Ids2),
    SortFun = fun (#tournament_role{rank_point = Rp1,
                                    classes = C1, rank_lev = Rlv1,
                                    consecutive_lost = Cl1},
                   #tournament_role{rank_point = Rp2, classes = C2,
                                    rank_lev = Rlv2, consecutive_lost = Cl2}) ->
                      Rpm1 = Rp1 - tournament_data:get_decrease(Rlv1, Cl1),
                      Rpm2 = Rp2 - tournament_data:get_decrease(Rlv2, Cl2),
                      case lists:member(C1, [4, 5]) of
                          true ->
                              case lists:member(C2, [4, 5]) of
                                  true -> Rpm1 > Rpm2;
                                  _ -> true
                              end;
                          _ ->
                              case lists:member(C2, [4, 5]) of
                                  true -> false;
                                  _ -> Rpm1 > Rpm2
                              end
                      end
              end,
    L2 = lists:sort(SortFun, L1),
    {Assists, Outputs} = lists:partition(fun
                                             (#tournament_role{classes =
                                                                   Classes}) ->
                                                 lists:member(Classes, [4, 5])
                                         end,
                                         L2),
    FunSingle = fun (#tournament_role{partner = Rptr}) ->
                        Rptr =:= []
                end,
    {TA1, TA2, Candidates} = case
                                 balance_arrange_pairs(lists:partition(FunSingle,
                                                                       Assists))
                                 of
                                 {A1, A2} -> {A1, A2, Outputs};
                                 _ ->
                                     case filter_assist_partner(L2) of
                                         [A1, A2, A3, A4 | Rest] ->
                                             {[A1, A4], [A2, A3], Rest};
                                         [A1, A2 | Rest] -> {[A1], [A2], Rest}
                                     end
                             end,
    {T1, Rest1} = find_partner(TA1, Candidates, []),
    {T2, Rest2} = find_partner(TA2, Rest1, []),
    {Single, Pairs} = lists:partition(fun
                                          (#tournament_role{partner = Rptr}) ->
                                              Rptr =:= []
                                      end,
                                      Rest2),
    SingleSort =
        util:keys_sort([#tournament_role.rank_point], Single),
    PairSort = util:keys_sort([#tournament_role.rank_point],
                              Pairs),
    Rest3 = PairSort ++ SingleSort,
    Fc1 = lists:sum([Fc -
                         tournament_data:get_decrease(Fclv, ConsecutiveLost)
                     || #tournament_role{rank_point = Fc, rank_lev = Fclv,
                                         consecutive_lost = ConsecutiveLost}
                            <- T1]),
    Fc2 = lists:sum([Fc -
                         tournament_data:get_decrease(Fclv, ConsecutiveLost)
                     || #tournament_role{rank_point = Fc, rank_lev = Fclv,
                                         consecutive_lost = ConsecutiveLost}
                            <- T2]),
    do_balance_arrange(rank_point,
                       Rest3,
                       {T1, Fc1, length(T1)},
                       {T2, Fc2, length(T2)});
balance_arrange(BalanceType, Ids1, Ids2) ->
    L1 = get_mates(Ids1 ++ Ids2),
    SortFun = fun (#tournament_role{classes = C1, fc = Fc1},
                   #tournament_role{classes = C2, fc = Fc2}) ->
                      case lists:member(C1, [4, 5]) of
                          true ->
                              case lists:member(C2, [4, 5]) of
                                  true -> Fc1 > Fc2;
                                  _ -> true
                              end;
                          _ ->
                              case lists:member(C2, [4, 5]) of
                                  true -> false;
                                  _ -> Fc1 > Fc2
                              end
                      end
              end,
    L2 = lists:sort(SortFun, L1),
    logger:debug("排序 -----> ~w",
                 [[{C, Name2222}
                   || #tournament_role{classes = C, name = Name2222}
                          <- L2]],
                 tournament_team,
                 657),
    {Assists, Outputs} = lists:partition(fun
                                             (#tournament_role{classes =
                                                                   Classes}) ->
                                                 lists:member(Classes, [4, 5])
                                         end,
                                         L2),
    logger:debug("辅助 ------> ~w",
                 [Assists],
                 tournament_team,
                 662),
    {TA1, TA2, Candidates} = case
                                 balance_arrange_pairs(lists:partition(fun
                                                                           (#tournament_role{partner
                                                                                                 =
                                                                                                 Rptr}) ->
                                                                               Rptr
                                                                                   =:=
                                                                                   []
                                                                       end,
                                                                       Assists))
                                 of
                                 {A1, A2} -> {A1, A2, Outputs};
                                 _ ->
                                     case filter_assist_partner(L2) of
                                         [A1, A2, A3, A4 | Rest] ->
                                             {[A1, A4], [A2, A3], Rest};
                                         [A1, A2 | Rest] -> {[A1], [A2], Rest}
                                     end
                             end,
    {T1, Rest1} = find_partner(TA1, Candidates, []),
    {T2, Rest2} = find_partner(TA2, Rest1, []),
    {Single, Pairs} = lists:partition(fun
                                          (#tournament_role{partner = Rptr}) ->
                                              Rptr =:= []
                                      end,
                                      Rest2),
    SingleSort = util:keys_sort([#tournament_role.fc],
                                Single),
    PairSort = util:keys_sort([#tournament_role.fc], Pairs),
    Rest3 = PairSort ++ SingleSort,
    Fc1 = lists:sum([Fc
                     || #tournament_role{fc = Fc} <- T1]),
    Fc2 = lists:sum([Fc
                     || #tournament_role{fc = Fc} <- T2]),
    do_balance_arrange(BalanceType,
                       Rest3,
                       {T1, Fc1, length(T1)},
                       {T2, Fc2, length(T2)}).

balance_arrange_2v2(BalanceType, Ids1, Ids2) ->
    TL1 = get_mates(Ids1),
    TL2 = get_mates(Ids2),
    L1 = TL1 ++ TL2,
    case [1
          || #tournament_role{partner = TPartner} <- L1,
             length(TPartner) > 0]
        of
        [] ->
            SortFun1 = fun (#tournament_role{rank_point = Rp1,
                                             fc = Fc1, classes = C1,
                                             rank_lev = Rlv1,
                                             consecutive_lost = Cl1},
                            #tournament_role{rank_point = Rp2, fc = Fc2,
                                             classes = C2, rank_lev = Rlv2,
                                             consecutive_lost = Cl2}) ->
                               Rpm1 = Rp1 -
                                          tournament_data:get_decrease(Rlv1,
                                                                       Cl1),
                               Rpm2 = Rp2 -
                                          tournament_data:get_decrease(Rlv2,
                                                                       Cl2),
                               if Rpm1 > Rpm2 -> true;
                                  Rpm1 == Rpm2 andalso Fc1 > Fc2 -> true;
                                  Rpm1 == Rpm2 andalso
                                      Fc1 == Fc2 andalso
                                          (C1 =:= 4 orelse C1 =:= 5) andalso
                                              C2 =:= 6 ->
                                      true;
                                  Rpm1 == Rpm2 andalso
                                      Fc1 == Fc2 andalso
                                          C1 > C2 andalso
                                              (C1 =/= 6 orelse C2 < 4) ->
                                      true;
                                  true -> false
                               end
                       end,
            SortFun2 = fun (#tournament_role{classes = C1,
                                             rank_lev = Rlv1, rank_point = Rp1,
                                             fc = Fc1, consecutive_lost = Cl1},
                            #tournament_role{classes = C2, rank_lev = Rlv2,
                                             rank_point = Rp2, fc = Fc2,
                                             consecutive_lost = Cl2}) ->
                               Rpm1 = Rp1 -
                                          tournament_data:get_decrease(Rlv1,
                                                                       Cl1),
                               Rpm2 = Rp2 -
                                          tournament_data:get_decrease(Rlv2,
                                                                       Cl2),
                               if Fc1 > Fc2 -> true;
                                  Fc1 == Fc2 andalso Rpm1 > Rpm2 -> true;
                                  Rpm1 == Rpm2 andalso
                                      Fc1 == Fc2 andalso
                                          (C1 =:= 4 orelse C1 =:= 5) andalso
                                              C2 =:= 6 ->
                                      true;
                                  Rpm1 == Rpm2 andalso
                                      Fc1 == Fc2 andalso
                                          C1 > C2 andalso
                                              (C1 =/= 6 orelse C2 < 4) ->
                                      true;
                                  true -> false
                               end
                       end,
            SortFun = case BalanceType of
                          rank_point -> SortFun1;
                          _ -> SortFun2
                      end,
            L2 = lists:sort(SortFun, L1),
            logger:debug("排序 -----> ~w",
                         [{BalanceType,
                           [{C, TRpm, TFc, TId}
                            || #tournament_role{classes = C, id = TId,
                                                rank_point = TRpm, fc = TFc}
                                   <- L2]}],
                         tournament_team,
                         718),
            case lists:partition(fun (#tournament_role{classes =
                                                           Classes}) ->
                                         Classes >= 4 andalso Classes =/= 6
                                 end,
                                 L2)
                of
                {[], [Out1, Out2, Out3 | T]} ->
                    {[Out1 | T], [Out2, Out3]};
                {[Assist1 = #tournament_role{rank_point = ARp1}],
                 [Out1 = #tournament_role{fc = OAp1}, Out2 | T]}
                    when BalanceType == rank_point andalso ARp1 >= OAp1 ->
                    {[Assist1 | T], [Out1, Out2]};
                {[Assist1 = #tournament_role{fc = AFc1}],
                 [Out1 = #tournament_role{fc = OFc1}, Out2 | T]}
                    when BalanceType == fc andalso AFc1 >= OFc1 ->
                    {[Assist1 | T], [Out1, Out2]};
                {[Assist1], [Out1, Out2 | T]} ->
                    {[Assist1, Out2], [Out1 | T]};
                {[Assist1, Assist2], [Out1 | T]} ->
                    {[Assist1 | T], [Assist2, Out1]};
                _ -> {TL1, TL2}
            end;
        _ -> {TL1, TL2}
    end.

balance_arrange_pairs({[A1], A2}) ->
    case has_pair(A2, []) of
        {true, Pair, Other} -> {[A1 | Other], Pair};
        _ ->
            case A2 of
                [A3, A4 | A5] -> {[A3 | A5], [A1, A4]};
                [A3 | A4] -> {[A1 | A4], [A3]}
            end
    end;
balance_arrange_pairs({[A1, A2], A3}) ->
    case has_pair(A3, []) of
        {true, Pair, Other} -> {[A1, A2 | Other], Pair};
        _ ->
            case A3 of
                [A4, A5 | A6] -> {[A1, A5], [A2, A4 | A6]};
                [A4 | A5] -> {[A1 | A5], [A2, A4]};
                _ -> {[A1], [A2]}
            end
    end;
balance_arrange_pairs({A1,
                       [A3 = #tournament_role{partner = [{Id4, _}], id = Id3},
                        A4 = #tournament_role{partner = [{Id3, _}],
                                              id = Id4}]}) ->
    logger:debug("一组双排", [], tournament_team, 769),
    {A1, [A3, A4]};
balance_arrange_pairs({A1,
                       [A3 = #tournament_role{partner = [{IdA, _}, {IdB, _}],
                                              id = Id3},
                        A4 = #tournament_role{partner = [{IdC, _}, {IdD, _}],
                                              id = Id4}]})
    when (IdA =:= Id4 orelse IdB =:= Id4) andalso
             (IdC =:= Id3 orelse IdD =:= Id3) ->
    logger:debug("一组双排", [], tournament_team, 773),
    {A1, [A3, A4]};
balance_arrange_pairs({[A1 | A2], [A3, A4]}) ->
    logger:debug("两双排", [], tournament_team, 777),
    {[A1, A4], [A3 | A2]};
balance_arrange_pairs({[], [A3, A4]}) ->
    logger:debug("两双排", [], tournament_team, 780),
    {[A3], [A4]};
balance_arrange_pairs({A1, [A2, A3, A4 | A5]}) ->
    case has_pair([A2, A3, A4 | A5], []) of
        {true, Pair, Other} ->
            logger:debug("多双一组", [], tournament_team, 786),
            {Pair, A1 ++ Other};
        _ ->
            logger:debug("三组没辅助", [], tournament_team, 789),
            {[A3, A4], [A2 | A1 ++ A5]}
    end;
balance_arrange_pairs(_) -> false.

do_balance_arrange(_, [], {T1, _, _}, {T2, _, _}) ->
    {T1, T2};
do_balance_arrange(_, Rest, {T1, _, Num1}, {T2, _, _})
    when Num1 >= 5 ->
    logger:debug("队伍人数1 ~w", [Num1], tournament_team, 798),
    {T1, T2 ++ Rest};
do_balance_arrange(_, Rest, {T1, _, _}, {T2, _, Num2})
    when Num2 >= 5 ->
    logger:debug("队伍人数1 ~w", [Num2], tournament_team, 801),
    {T1 ++ Rest, T2};
do_balance_arrange(_,
                   [H1,
                    H2 = #tournament_role{id = Id2, partner = [{Id3, _}]},
                    H3 = #tournament_role{id = Id3, partner = [{Id2, _}]}],
                   {T1, _Fc1, Num1}, {T2, _Fc2, Num2}) ->
    case Num1 > Num2 of
        true -> {[H1 | T1], [H2, H3 | T2]};
        _ -> {[H2, H3 | T1], [H1 | T2]}
    end;
do_balance_arrange(BalanceType = rank_point,
                   [H = #tournament_role{} | Rest], {T1, Fc1, Num1},
                   {T2, Fc2, Num2}) ->
    {Candi, Rest1} = find_partner([H], Rest, []),
    Fc3 = lists:sum([Fc -
                         tournament_data:get_decrease(Fclv, ConsecutiveLost)
                     || #tournament_role{rank_point = Fc, rank_lev = Fclv,
                                         consecutive_lost = ConsecutiveLost}
                            <- Candi]),
    Num3 = length(Candi),
    case (Fc2 + Fc3 - Fc1 < Fc1 + Fc3 - Fc2 orelse
              Num3 + Num1 > 5)
             andalso Num3 + Num2 =< 5
        of
        true ->
            logger:debug("队伍1 战力 ~w, 人数 ~w, 队伍2 战力 ~w, 人数 ~w",
                         [Fc1, Num1, Fc2, Num2],
                         tournament_team,
                         819),
            do_balance_arrange(BalanceType,
                               Rest1,
                               {T1, Fc1, Num1},
                               {Candi ++ T2, Fc2 + Fc3, Num2 + Num3});
        _ ->
            logger:debug("队伍1 战力 ~w, 人数 ~w, 队伍2 战力 ~w, 人数 ~w",
                         [Fc1, Num1, Fc2, Num2],
                         tournament_team,
                         822),
            do_balance_arrange(BalanceType,
                               Rest1,
                               {Candi ++ T1, Fc1 + Fc3, Num1 + Num3},
                               {T2, Fc2, Num2})
    end;
do_balance_arrange(BalanceType,
                   [H = #tournament_role{} | Rest], {T1, Fc1, Num1},
                   {T2, Fc2, Num2}) ->
    {Candi, Rest1} = find_partner([H], Rest, []),
    Fc3 = lists:sum([Fc
                     || #tournament_role{fc = Fc} <- Candi]),
    Num3 = length(Candi),
    case (Fc1 div Num1 > Fc2 div Num2 orelse
              Num3 + Num1 > 5)
             andalso Num3 + Num2 =< 5
        of
        true ->
            logger:debug("队伍1 战力 ~w, 人数 ~w, 队伍2 战力 ~w, 人数 ~w",
                         [Fc1, Num1, Fc2, Num2],
                         tournament_team,
                         831),
            do_balance_arrange(BalanceType,
                               Rest1,
                               {T1, Fc1, Num1},
                               {Candi ++ T2, Fc2 + Fc3, Num2 + Num3});
        _ ->
            logger:debug("队伍1 战力 ~w, 人数 ~w, 队伍2 战力 ~w, 人数 ~w",
                         [Fc1, Num1, Fc2, Num2],
                         tournament_team,
                         834),
            do_balance_arrange(BalanceType,
                               Rest1,
                               {Candi ++ T1, Fc1 + Fc3, Num1 + Num3},
                               {T2, Fc2, Num2})
    end.

has_pair([], _) -> false;
has_pair([H = #tournament_role{partner = [{Id, _}]}
          | T],
         Other) ->
    case lists:keytake(Id, #tournament_role.id, T) of
        {value, P = #tournament_role{}, T1} ->
            {true, [H, P], T1 ++ Other};
        _ -> has_pair(T, [H | Other])
    end;
has_pair([H = #tournament_role{partner =
                                   [{Id1, _}, {Id2, _}]}
          | T],
         Other) ->
    case lists:keytake(Id1, #tournament_role.id, T) of
        {value, P = #tournament_role{}, T1} ->
            {true, [H, P], T1 ++ Other};
        _ ->
            case lists:keytake(Id2, #tournament_role.id, T) of
                {value, P = #tournament_role{}, T1} ->
                    {true, [H, P], T1 ++ Other};
                _ -> has_pair(T, [H | Other])
            end
    end.

find_partner([], Rest, Found) -> {Found, Rest};
find_partner([H = #tournament_role{partner = [{Id, _}]}
              | T],
             Rest, Found) ->
    case lists:keytake(Id, #tournament_role.id, Rest) of
        {value, P = #tournament_role{}, Rest1} ->
            find_partner(T, Rest1, [H, P | Found]);
        _ -> find_partner(T, Rest, [H | Found])
    end;
find_partner([H = #tournament_role{partner =
                                       [{Id1, _}, {Id2, _}]}
              | T],
             Rest, Found) ->
    case lists:keytake(Id1, #tournament_role.id, Rest) of
        {value, P1 = #tournament_role{}, Rest1} ->
            case lists:keytake(Id2, #tournament_role.id, Rest1) of
                {value, P2 = #tournament_role{}, Rest2} ->
                    find_partner(T, Rest2, [H, P1, P2 | Found]);
                _ -> find_partner(T, Rest1, [H, P1 | Found])
            end;
        _ ->
            case lists:keytake(Id2, #tournament_role.id, Rest) of
                {value, P2 = #tournament_role{}, Rest2} ->
                    find_partner(T, Rest2, [H, P2 | Found]);
                _ -> find_partner(T, Rest, [H | Found])
            end
    end;
find_partner([H = #tournament_role{} | T], Rest,
             Found) ->
    find_partner(T, Rest, [H | Found]).

filter_assist_partner(L = [#tournament_role{partner =
                                                []},
                           #tournament_role{partner = []},
                           #tournament_role{partner = []},
                           #tournament_role{partner = []}
                           | _]) ->
    L;
filter_assist_partner(L) ->
    do_filter_assist_partner(L, 0, []).

do_filter_assist_partner([], _, PL) -> PL;
do_filter_assist_partner(L, Num, PL) when Num >= 4 ->
    L ++ PL;
do_filter_assist_partner([H = #tournament_role{partner =
                                                   []}
                          | T],
                         Num, PL) ->
    [H | do_filter_assist_partner(T, Num + 1, PL)];
do_filter_assist_partner([H = #tournament_role{partner =
                                                   [{Id, _}]}
                          | T],
                         Num, PL) ->
    case lists:keytake(Id, #tournament_role.id, T) of
        {value, P = #tournament_role{}, Rest} ->
            [H | do_filter_assist_partner(Rest, Num + 1, [P | PL])];
        _ -> [H | do_filter_assist_partner(T, Num + 1, PL)]
    end.

match_enemy([], _Team, _, _) -> false;
match_enemy([Candi = #tournament_team{sum_lev = SumLev1,
                                      ids = Ids1, max_lev = MaxLev1,
                                      min_lev = MinLev1, num = Num1,
                                      sum_point = SumPoint1,
                                      max_point = MaxPoint1}
             | T],
            Nomi = #tournament_team{ids = Ids2, max_lev = MaxLev2,
                                    min_lev = MinLev2, num = Num2,
                                    sum_point = SumPoint2,
                                    max_point = MaxPoint2, tried_match = Tried},
            Args = #{pk_type := PkType}, UnMatched) ->
    TeamFc1 = round(SumPoint1 / Num1 * 5.0e-1 +
                        MaxPoint1 * 5.0e-1),
    TeamFc2 = round(SumPoint2 / Num2 * 5.0e-1 +
                        MaxPoint2 * 5.0e-1),
    AllMates = get_mates(Ids1 ++ Ids2),
    _ParterLen = erlang:length([ok
                                || #tournament_role{partner = Partner}
                                       <- AllMates,
                                   Partner =/= []]),
    ParterFlag = case SumLev1 rem Num1 >= 89 of
                     false -> true;
                     _ -> true
                 end,
    logger:debug("总等级:~w, 人数:~w, 双排标志:~w",
                 [SumLev1, Num1, ParterFlag],
                 tournament_team,
                 927),
    Result = MaxLev1 =:= 89 andalso
                 MaxLev2 =:= 89 andalso
                     MinLev1 =:= 89 andalso MinLev2 =:= 89
                 orelse
                 MaxLev1 =/= 89 andalso
                     MaxLev2 =/= 89 andalso
                         MinLev1 =/= 89 andalso MinLev2 =/= 89,
    TriedCompensation = case MaxLev1 =:= 89 andalso
                                 MaxLev2 =:= 89 andalso
                                     MinLev1 =:= 89 andalso MinLev2 =:= 89
                            of
                            true -> get_tried_compensation2(Tried, PkType);
                            _ -> get_tried_compensation(Tried, PkType)
                        end,
    case abs(MaxLev1 - MinLev2) =< 5 andalso
             abs(MaxLev2 - MinLev1) =< 5 andalso
                 abs(TeamFc1 - TeamFc2) =< TriedCompensation andalso
                     Result andalso ParterFlag =:= true
        of
        true -> {ok, Candi, T ++ UnMatched};
        _ -> match_enemy(T, Nomi, Args, [Candi | UnMatched])
    end.

do_fight(M = #tournament_match{teams =
                                   [#tournament_team{ids = Ids1, order = Order1,
                                                     sum_point = SumPoint1,
                                                     num = Num1,
                                                     max_point = MaxPoint1},
                                    #tournament_team{ids = Ids2, order = Order2,
                                                     sum_point = SumPoint2,
                                                     num = Num2,
                                                     max_point = MaxPoint2}],
                               id = MatchId},
         _Args = #{pk_type := 2}) ->
    FOrder1 = [I || I = {_, _, _} <- Order1],
    FOrder2 = [I || I = {_, _, _} <- Order2],
    Wrap1 = get_fighters(FOrder1),
    Wrap2 = get_fighters(FOrder2),
    SucIds1 = [Fid
               || #fighter_wrap{fighter =
                                    #fighter{origin_id = Fid, type = 1}}
                      <- Wrap1],
    SucIds2 = [Fid
               || #fighter_wrap{fighter =
                                    #fighter{origin_id = Fid, type = 1}}
                      <- Wrap2],
    AFailRoleIds = Ids1 -- SucIds1,
    BFailRoleIds = Ids2 -- SucIds2,
    FailRoleIds = AFailRoleIds ++ BFailRoleIds,
    AvgP1 = round(SumPoint1 / Num1),
    AvgP2 = round(SumPoint2 / Num2),
    TeamFc1 = round(MaxPoint1 * 5.0e-1 + AvgP1 * 5.0e-1),
    TeamFc2 = round(MaxPoint2 * 5.0e-1 + AvgP2 * 5.0e-1),
    CalcArgs = [{Ids1,
                 #{team_avg => AvgP1, team_fc => TeamFc1,
                   op_team_fc => TeamFc2}},
                {Ids2,
                 #{team_avg => AvgP2, team_fc => TeamFc2,
                   op_team_fc => TeamFc1}}],
    logger:debug("=========================:~w",
                 [{Order1, Order2}],
                 tournament_team,
                 965),
    case {length(SucIds1), length(SucIds2)} of
        {2, 2} ->
            StartArgs = #combat_start_args{ext_args =
                                               {MatchId, Order1, Order2}},
            case combat_mgr:start_combat(58,
                                         reset_fighers(Wrap1),
                                         reset_fighers(Wrap2),
                                         StartArgs)
                of
                {ok, CombatPid} ->
                    ets:insert(tournament_match,
                               M#tournament_match{combat_pid = CombatPid,
                                                  calc_args = CalcArgs}),
                    case length(FailRoleIds) > 0 of
                        true ->
                            logger:debug("部分发起失败:~w",
                                         [FailRoleIds],
                                         tournament_team,
                                         974),
                            fight_result(not_all, FailRoleIds, CalcArgs);
                        false -> skip
                    end;
                {false, Reason} ->
                    logger:error("发起战斗失败 ids1 ~w , ids2 ~w Reason:~w",
                                 [Ids1, Ids2, Reason],
                                 tournament_team,
                                 979),
                    ets:delete(tournament_match, MatchId),
                    fight_result(combat_error, {Ids1, Ids2}, CalcArgs)
            end;
        _MatchNum ->
            case _MatchNum of
                {_N1, _N2} when _N1 > 5 orelse _N2 > 5 ->
                    _OrderRole1 = [{Oid, Ofc, Oc, OPr}
                                   || #tournament_role{id = Oid, fc = Ofc,
                                                       classes = Oc,
                                                       partner = OPr}
                                          <- get_mates(Order1)],
                    _OrderRole2 = [{Oid, Ofc, Oc, OPr}
                                   || #tournament_role{id = Oid, fc = Ofc,
                                                       classes = Oc,
                                                       partner = OPr}
                                          <- get_mates(Order2)],
                    logger:error("战斗人数是~w, 无法发起 order1：~w, order2：~w",
                                 [_MatchNum, _OrderRole1, _OrderRole2],
                                 tournament_team,
                                 988);
                _ ->
                    logger:error("战斗人数是~w, 无法发起 ids1：~w, ids2：~w, order1：~w, "
                                 "order2：~w",
                                 [_MatchNum, Ids1, Ids2, Order1, Order2],
                                 tournament_team,
                                 990)
            end,
            ets:delete(tournament_match, MatchId),
            fight_result(combat_error, {Ids1, Ids2}, CalcArgs)
    end;
do_fight(M = #tournament_match{teams =
                                   [#tournament_team{ids = Ids1, order = Order1,
                                                     sum_point = SumPoint1,
                                                     num = Num1,
                                                     max_point = MaxPoint1},
                                    #tournament_team{ids = Ids2, order = Order2,
                                                     sum_point = SumPoint2,
                                                     num = Num2,
                                                     max_point = MaxPoint2}],
                               id = MatchId},
         _Args = #{pk_type := _PkType}) ->
    FOrder1 = [I || I = {_, _, _} <- Order1],
    FOrder2 = [I || I = {_, _, _} <- Order2],
    Wrap1 = get_fighters(FOrder1),
    Wrap2 = get_fighters(FOrder2),
    SucIds1 = [Fid
               || #fighter_wrap{fighter =
                                    #fighter{origin_id = Fid, type = 1}}
                      <- Wrap1],
    SucIds2 = [Fid
               || #fighter_wrap{fighter =
                                    #fighter{origin_id = Fid, type = 1}}
                      <- Wrap2],
    AFailRoleIds = Ids1 -- SucIds1,
    BFailRoleIds = Ids2 -- SucIds2,
    FailRoleIds = AFailRoleIds ++ BFailRoleIds,
    AvgP1 = round(SumPoint1 / Num1),
    AvgP2 = round(SumPoint2 / Num2),
    TeamFc1 = round(MaxPoint1 * 5.0e-1 + AvgP1 * 5.0e-1),
    TeamFc2 = round(MaxPoint2 * 5.0e-1 + AvgP2 * 5.0e-1),
    CalcArgs = [{Ids1,
                 #{team_avg => AvgP1, team_fc => TeamFc1,
                   op_team_fc => TeamFc2}},
                {Ids2,
                 #{team_avg => AvgP2, team_fc => TeamFc2,
                   op_team_fc => TeamFc1}}],
    case {length(SucIds1), length(SucIds2)} of
        {5, 5} ->
            StartArgs = #combat_start_args{ext_args = MatchId},
            case combat_mgr:start_combat(40,
                                         reset_fighers(Wrap1),
                                         reset_fighers(Wrap2),
                                         StartArgs)
                of
                {ok, CombatPid} ->
                    ets:insert(tournament_match,
                               M#tournament_match{combat_pid = CombatPid,
                                                  calc_args = CalcArgs}),
                    case length(FailRoleIds) > 0 of
                        true ->
                            logger:debug("部分发起失败:~w",
                                         [FailRoleIds],
                                         tournament_team,
                                         1018),
                            fight_result(not_all, FailRoleIds, CalcArgs);
                        false -> skip
                    end;
                {false, Reason} ->
                    logger:error("发起战斗失败 ids1 ~w , ids2 ~w Reason:~w",
                                 [Ids1, Ids2, Reason],
                                 tournament_team,
                                 1023),
                    ets:delete(tournament_match, MatchId),
                    fight_result(combat_error, {Ids1, Ids2}, CalcArgs)
            end;
        _MatchNum ->
            case _MatchNum of
                {_N1, _N2} when _N1 > 5 orelse _N2 > 5 ->
                    _OrderRole1 = [{Oid, Ofc, Oc, OPr}
                                   || #tournament_role{id = Oid, fc = Ofc,
                                                       classes = Oc,
                                                       partner = OPr}
                                          <- get_mates(Order1)],
                    _OrderRole2 = [{Oid, Ofc, Oc, OPr}
                                   || #tournament_role{id = Oid, fc = Ofc,
                                                       classes = Oc,
                                                       partner = OPr}
                                          <- get_mates(Order2)],
                    logger:error("战斗人数是~w, 无法发起 order1：~w, order2：~w",
                                 [_MatchNum, _OrderRole1, _OrderRole2],
                                 tournament_team,
                                 1032);
                _ ->
                    logger:error("战斗人数是~w, 无法发起 ids1：~w, ids2：~w, order1：~w, "
                                 "order2：~w",
                                 [_MatchNum, Ids1, Ids2, Order1, Order2],
                                 tournament_team,
                                 1034)
            end,
            ets:delete(tournament_match, MatchId),
            fight_result(combat_error, {Ids1, Ids2}, CalcArgs)
    end.

fight_result(not_all, FailRoleIds, CalcArgs) ->
    Now = date:unixtime(),
    do_fight_result(FailRoleIds,
                    #{type => lost, calc_args => CalcArgs, time => Now});
fight_result(combat_error, {Ids1, Ids2}, CalcArgs) ->
    Now = date:unixtime(),
    Args = #{type => lost, calc_args => CalcArgs,
             time => Now},
    do_fight_result(Ids1, Args),
    do_fight_result(Ids2, Args);
fight_result(_, _, _) -> ok.

do_fight_result([], _Args) -> ok;
do_fight_result([Id = {_, Platform, ZoneId} | T],
                Args) ->
    case ets:lookup(tournament_role, Id) of
        [R = #tournament_role{}] ->
            R1 = R#tournament_role{side = 0, match_id = 0,
                                   last_matched = 0, team_id = []},
            ets:insert(tournament_role, R1);
        _ -> ok
    end,
    big_world:cast(Platform,
                   ZoneId,
                   tournament_agent,
                   fight_result,
                   [Id]),
    do_fight_result(T, Args).

get_fighters(RoleIds) ->
    get_fighters([{RoleId, 0} || RoleId <- RoleIds], []).

get_fighters([], Result) -> lists:reverse(Result);
get_fighters([{RoleId = {Rid, Platform, ZoneId}, TryNum}
              | T],
             Result) ->
    case big_world:call(Platform,
                        ZoneId,
                        role_query,
                        rec,
                        [by_id, Rid, Platform, ZoneId, fighter_wrap])
        of
        {ok,
         #fighter_wrap{status = 2, s_event = _Event,
                       combat_type = _CType}} ->
            logger:error("角色[~w]在战斗中~w无法转换",
                         [RoleId, {_Event, _CType}],
                         tournament_team,
                         1077),
            get_fighters(T, Result);
        {ok, Fw = #fighter_wrap{s_event = 25}} ->
            get_fighters(T, [Fw | Result]);
        {ok,
         Fw = #fighter_wrap{s_event = _Event = 24,
                            status = _Status}} ->
            logger:error("角色[~w]在~w中~w转换",
                         [RoleId, _Status, _Event],
                         tournament_team,
                         1082),
            get_fighters(T, [Fw | Result]);
        {ok,
         Fw = #fighter_wrap{s_event = _Event = 0,
                            status = _Status, combat_type = _CType}} ->
            logger:error("角色[~w]在~w中~w转换",
                         [RoleId, _Status, {_Event, _CType}],
                         tournament_team,
                         1085),
            get_fighters(T, [Fw | Result]);
        {ok,
         #fighter_wrap{status = _Status, s_event = _Event}} ->
            logger:error("角色[~w]在~w中~w无法转换",
                         [RoleId, _Status, _Event],
                         tournament_team,
                         1088),
            get_fighters(T, Result);
        {error, timeout} ->
            case TryNum >= 3 of
                false ->
                    logger:debug("角色转换[~w]超时, 正在重试第~w次",
                                 [RoleId, TryNum + 1],
                                 tournament_team,
                                 1093),
                    get_fighters([{RoleId, TryNum + 1} | T], Result);
                true ->
                    logger:error("角色转换[~w]仍然超时,不再尝试",
                                 [RoleId],
                                 tournament_team,
                                 1096),
                    get_fighters(T, Result)
            end;
        {error, not_found} ->
            logger:error("角色掉线[~w], 无法转换",
                         [RoleId],
                         tournament_team,
                         1100),
            get_fighters(T, Result);
        _Err ->
            logger:error("角色转换[~w]错误：~w",
                         [RoleId, _Err],
                         tournament_team,
                         1103),
            get_fighters(T, Result)
    end.

calc_classes_num([], Output, Assist) ->
    {Output, Assist};
calc_classes_num([C | T], Output, {Free, Devine}) ->
    case lists:member(C, [1, 2, 3, 6, 7]) of
        true -> calc_classes_num(T, Output + 1, {Free, Devine});
        _ when C =:= 5 ->
            calc_classes_num(T, Output, {Free, Devine + 1});
        _ -> calc_classes_num(T, Output, {Free + 1, Devine})
    end.

match_mates(L, Args = #{pk_type := PkType}) ->
    Fun = fun (#tournament_team{assist_num =
                                    {Free1, Devine1},
                                sum_point = SumPoint1, num = Num1,
                                tried_match = Tried1},
               #tournament_team{assist_num = {Free2, Devine2},
                                sum_point = SumPoint2, num = Num2,
                                tried_match = Tried2}) ->
                  Point1 = SumPoint1 div Num1,
                  Point2 = SumPoint2 div Num2,
                  if PkType == 2 andalso
                         Free1 + Devine1 > Free2 + Devine2 andalso
                             Tried1 + 10 > Tried2 ->
                         true;
                     PkType == 2 andalso
                         Free1 + Devine1 < Free2 + Devine2 andalso
                             Tried1 > Tried2 + 10 ->
                         true;
                     Tried1 > Tried2 + 10 -> true;
                     Tried1 > Tried2 + 10 -> true;
                     Num1 > Num2 -> true;
                     Num1 =:= Num2 andalso Tried1 > Tried2 -> true;
                     Num1 =:= Num2 andalso
                         Tried1 =:= Tried2 andalso Point1 < Point2 ->
                         true;
                     true -> false
                  end
          end,
    SortL = lists:sort(Fun, L),
    match_mates(SortL, [], [], Args).

match_mates([], Matched, UnMatched, _Args) ->
    Fun = fun (#tournament_team{sum_point = SumPoint1,
                                num = Num1},
               #tournament_team{sum_point = SumPoint2, num = Num2}) ->
                  SumPoint1 div Num1 < SumPoint2 div Num2
          end,
    SortMatched = lists:sort(Fun, Matched),
    {SortMatched, UnMatched};
match_mates([H | T], Matched, UnMatched,
            Args = #{pk_type := _PkType = 2}) ->
    case do_match_mates_2v2(T, H, []) of
        {ok, NewH, Rest} ->
            match_mates(Rest, [NewH | Matched], UnMatched, Args);
        _ -> match_mates(T, Matched, [H | UnMatched], Args)
    end;
match_mates([H | T], Matched, UnMatched, Args) ->
    case do_match_mates(T, H, []) of
        {ok, NewH, Rest} ->
            match_mates(Rest, [NewH | Matched], UnMatched, Args);
        _ -> match_mates(T, Matched, [H | UnMatched], Args)
    end.

do_match_mates([], _, _) -> false;
do_match_mates([Candi = #tournament_team{output_num =
                                             Output1}
                | T],
               Nomi = #tournament_team{output_num = Output2},
               UnMatched)
    when Output1 + Output2 > 4 ->
    do_match_mates(T, Nomi, [Candi | UnMatched]);
do_match_mates([Candi = #tournament_team{assist_num =
                                             {Free1, Devine1}}
                | T],
               Nomi = #tournament_team{assist_num = {Free2, Devine2}},
               UnMatched)
    when Free1 + Free2 + Devine1 + Devine2 > 2 ->
    do_match_mates(T, Nomi, [Candi | UnMatched]);
do_match_mates([Candi = #tournament_team{num = Num1}
                | T],
               Nomi = #tournament_team{num = Num2}, UnMatched)
    when Num1 + Num2 > 5 ->
    do_match_mates(T, Nomi, [Candi | UnMatched]);
do_match_mates([Candi = #tournament_team{max_lev =
                                             MaxLev1,
                                         min_lev = MinLev1}
                | T],
               Nomi = #tournament_team{max_lev = MaxLev2,
                                       min_lev = MinLev2},
               UnMatched)
    when abs(MaxLev1 - MinLev2) > 5 orelse
             abs(MaxLev2 - MinLev1) > 5 ->
    do_match_mates(T, Nomi, [Candi | UnMatched]);
do_match_mates([Candi = #tournament_team{ids = Ids1,
                                         output_num = Output1,
                                         assist_num = {Free1, Devine1},
                                         num = Num1, sum_lev = SumLev1,
                                         max_lev = MaxLev1,
                                         sum_point = SumPoint1,
                                         max_point = MaxPoint1,
                                         min_lev = MinLev1,
                                         min_point = MinPoint1,
                                         classes = Classes1}
                | T],
               Nomi = #tournament_team{ids = Ids2,
                                       output_num = Output2,
                                       assist_num = {Free2, Devine2},
                                       num = Num2, origin_ids = Origins,
                                       sum_lev = SumLev2, max_lev = MaxLev2,
                                       sum_point = SumPoint2,
                                       max_point = MaxPoint2,
                                       tried_match = Tried, min_lev = MinLev2,
                                       min_point = MinPoint2,
                                       classes = Classes2},
               UnMatched) ->
    TeamFc1 = round(SumPoint1 / Num1 * 5.0e-1 +
                        MaxPoint1 * 5.0e-1),
    TeamFc2 = round(SumPoint2 / Num2 * 5.0e-1 +
                        MaxPoint2 * 5.0e-1),
    TriedCompensation = case MaxLev1 =:= 89 andalso
                                 MaxLev2 =:= 89 andalso
                                     MinLev1 =:= 89 andalso MinLev2 =:= 89
                            of
                            true -> get_tried_compensation2(Tried, 1);
                            _ -> get_tried_compensation(Tried, 1)
                        end,
    Classes3 = Classes1 ++ Classes2,
    Result = MaxLev1 =:= 89 andalso
                 MaxLev2 =:= 89 andalso
                     MinLev1 =:= 89 andalso MinLev2 =:= 89
                 orelse
                 MaxLev1 =/= 89 andalso
                     MaxLev2 =/= 89 andalso
                         MinLev1 =/= 89 andalso MinLev2 =/= 89,
    case abs(TeamFc1 - TeamFc2) =< TriedCompensation andalso
             abs(MaxPoint1 - MinPoint2) =< TriedCompensation andalso
                 abs(MaxPoint2 - MinPoint1) =< TriedCompensation andalso
                     check_classes_num(Classes3, []) andalso
                         check_couple(Num1, MaxLev1, Origins) andalso Result
        of
        true ->
            Nomi1 = Nomi#tournament_team{max_lev =
                                             max(MaxLev1, MaxLev2),
                                         min_lev = min(MinLev1, MinLev2),
                                         sum_lev = SumLev1 + SumLev2,
                                         max_point = max(MaxPoint1, MaxPoint2),
                                         min_point = min(MinPoint1, MinPoint2),
                                         sum_point = SumPoint1 + SumPoint2,
                                         output_num = Output1 + Output2,
                                         assist_num =
                                             {Free1 + Free2, Devine1 + Devine2},
                                         origin_ids = [Ids1 | Origins],
                                         num = Num1 + Num2, classes = Classes3},
            case Num1 + Num2 >= 5 of
                true ->
                    {ok,
                     Nomi1#tournament_team{ids = lists:sort(Ids1 ++ Ids2)},
                     UnMatched ++ T};
                _ ->
                    do_match_mates(T,
                                   Nomi1#tournament_team{ids = Ids1 ++ Ids2},
                                   UnMatched)
            end;
        _ -> do_match_mates(T, Nomi, [Candi | UnMatched])
    end.

do_match_mates_2v2(List,
                   Nomi = #tournament_team{ids = Ids = [_, _ | _]},
                   UnMatched) ->
    logger:debug(1111, [], tournament_team, 1240),
    {ok,
     Nomi#tournament_team{ids = lists:sort(Ids)},
     UnMatched ++ List};
do_match_mates_2v2([], _, _) ->
    logger:debug(1111, [], tournament_team, 1243),
    false;
do_match_mates_2v2([Candi = #tournament_team{assist_num
                                                 = {Free1, Devine1}}
                    | T],
                   Nomi = #tournament_team{assist_num = {Free2, Devine2}},
                   UnMatched)
    when Free1 + Free2 + Devine1 + Devine2 >= 2 ->
    do_match_mates_2v2(T, Nomi, [Candi | UnMatched]);
do_match_mates_2v2([Candi = #tournament_team{num = Num1}
                    | T],
                   Nomi = #tournament_team{num = Num2}, UnMatched)
    when Num1 + Num2 > 2 ->
    do_match_mates_2v2(T, Nomi, [Candi | UnMatched]);
do_match_mates_2v2([Candi = #tournament_team{max_lev =
                                                 MaxLev1,
                                             min_lev = MinLev1}
                    | T],
                   Nomi = #tournament_team{max_lev = MaxLev2,
                                           min_lev = MinLev2},
                   UnMatched)
    when abs(MaxLev1 - MinLev2) > 5 orelse
             abs(MaxLev2 - MinLev1) > 5 ->
    do_match_mates_2v2(T, Nomi, [Candi | UnMatched]);
do_match_mates_2v2([Candi = #tournament_team{ids = Ids1,
                                             output_num = Output1,
                                             assist_num = {Free1, Devine1},
                                             num = Num1, sum_lev = SumLev1,
                                             max_lev = MaxLev1,
                                             sum_point = SumPoint1,
                                             max_point = MaxPoint1,
                                             min_lev = MinLev1,
                                             min_point = MinPoint1,
                                             classes = Classes1}
                    | T],
                   Nomi = #tournament_team{ids = Ids2,
                                           output_num = Output2,
                                           assist_num = {Free2, Devine2},
                                           num = Num2, origin_ids = Origins,
                                           sum_lev = SumLev2, max_lev = MaxLev2,
                                           sum_point = SumPoint2,
                                           max_point = MaxPoint2,
                                           tried_match = Tried,
                                           min_lev = MinLev2,
                                           min_point = MinPoint2,
                                           classes = Classes2},
                   UnMatched) ->
    TeamFc1 = round(SumPoint1 / Num1 * 5.0e-1 +
                        MaxPoint1 * 5.0e-1),
    TeamFc2 = round(SumPoint2 / Num2 * 5.0e-1 +
                        MaxPoint2 * 5.0e-1),
    TriedCompensation = case MaxLev1 =:= 89 andalso
                                 MaxLev2 =:= 89 andalso
                                     MinLev1 =:= 89 andalso MinLev2 =:= 89
                            of
                            true -> get_tried_compensation2(Tried, 2);
                            _ -> get_tried_compensation(Tried, 2)
                        end,
    Classes3 = Classes1 ++ Classes2,
    Result = MaxLev1 =:= 89 andalso
                 MaxLev2 =:= 89 andalso
                     MinLev1 =:= 89 andalso MinLev2 =:= 89
                 orelse
                 MaxLev1 =/= 89 andalso
                     MaxLev2 =/= 89 andalso
                         MinLev1 =/= 89 andalso MinLev2 =/= 89,
    case abs(TeamFc1 - TeamFc2) =< TriedCompensation andalso
             abs(MaxPoint1 - MinPoint2) =< TriedCompensation andalso
                 abs(MaxPoint2 - MinPoint1) =< TriedCompensation andalso
                     check_classes_num(Classes3, []) andalso
                         check_couple(Num1, MaxLev1, Origins) andalso Result
        of
        true ->
            Nomi1 = Nomi#tournament_team{max_lev =
                                             max(MaxLev1, MaxLev2),
                                         min_lev = min(MinLev1, MinLev2),
                                         sum_lev = SumLev1 + SumLev2,
                                         max_point = max(MaxPoint1, MaxPoint2),
                                         min_point = min(MinPoint1, MinPoint2),
                                         sum_point = SumPoint1 + SumPoint2,
                                         output_num = Output1 + Output2,
                                         assist_num =
                                             {Free1 + Free2, Devine1 + Devine2},
                                         origin_ids = [Ids1 | Origins],
                                         num = Num1 + Num2, classes = Classes3},
            case Num1 + Num2 >= 2 of
                true ->
                    {ok,
                     Nomi1#tournament_team{ids = lists:sort(Ids1 ++ Ids2)},
                     UnMatched ++ T};
                _ ->
                    do_match_mates_2v2(T,
                                       Nomi1#tournament_team{ids =
                                                                 Ids1 ++ Ids2},
                                       UnMatched)
            end;
        _ -> do_match_mates_2v2(T, Nomi, [Candi | UnMatched])
    end.

do_chat([], _, _) -> ok;
do_chat([Id | T], Cmd, Msg) ->
    case ets:lookup(tournament_role, Id) of
        [#tournament_role{pid = Pid}] when is_pid(Pid) ->
            role:pack_send(Pid, Cmd, Msg);
        _ -> ok
    end,
    do_chat(T, Cmd, Msg).

update_mates([], _) -> [];
update_mates([R = #tournament_role{times = Times,
                                   team_id = Ids}
              | T],
             Args = #{match_id := MatchId, side := Side,
                      time := Time}) ->
    NewIds = case Args of
                 #{ids := Ids1} -> Ids1;
                 _ -> Ids
             end,
    R1 = R#tournament_role{times = Times + 1, side = Side,
                           match_id = MatchId, last_matched = Time,
                           team_id = NewIds},
    [R1 | update_mates(T, Args)].

get_mates([]) -> [];
get_mates([Id | T]) ->
    case ets:lookup(tournament_role, Id) of
        [R = #tournament_role{}] -> [R | get_mates(T)];
        _ -> get_mates(T)
    end.

push_matched({Mates1, TOrder1}, {Mates2, TOrder2},
             #{pk_type := PkType}, Now) ->
    Order1 = order_conver(TOrder1, []),
    Order2 = order_conver(TOrder2, []),
    do_push_matched(Mates1, {Mates1, PkType, Order1, Now}),
    do_push_matched(Mates2, {Mates2, PkType, Order2, Now}).

do_push_matched([], _) -> ok;
do_push_matched([R = #tournament_role{id =
                                          {_, Platform, ZoneId}}
                 | T],
                Data) ->
    logger:debug("匹配成功推送：~w",
                 [{Platform, ZoneId}],
                 tournament_team,
                 1353),
    big_world:cast(Platform,
                   ZoneId,
                   tournament_agent,
                   push_matched,
                   [R, Data]),
    do_push_matched(T, Data).

update_profile(R = #tournament_role{id = Id,
                                    name = Name, classes = Classes, sex = Sex,
                                    lev = Lev, guards = Guards}) ->
    GIds = [GId || {GId, _, _, _} <- Guards],
    case ets:lookup(tournament_profile, Id) of
        [P = #tournament_profile{rank_lev = Rl, rank_point = Rp,
                                 consecutive_lost = ConsecutiveLost,
                                 reported = Reported}] ->
            P1 = P#tournament_profile{id = Id, name = Name,
                                      classes = Classes, sex = Sex, lev = Lev,
                                      guards = GIds},
            ets:insert(tournament_profile, P1),
            dets:insert(tournament_profile, P1),
            R#tournament_role{rank_lev = Rl, rank_point = Rp,
                              consecutive_lost = ConsecutiveLost,
                              reported = Reported};
        _ ->
            P = #tournament_profile{id = Id, name = Name,
                                    classes = Classes, sex = Sex, lev = Lev,
                                    guards = GIds},
            ets:insert(tournament_profile, P),
            dets:insert(tournament_profile, P),
            R
    end.

acc_matched(P = #tournament_profile{last_matched = Last,
                                    day_matched = Matched},
            Now) ->
    case date:is_same_day(Now, Last) of
        true ->
            P#tournament_profile{last_matched = Now,
                                 day_matched = Matched + 1};
        _ ->
            P#tournament_profile{last_matched = Now,
                                 day_matched = 1, day_win = 0,
                                 day_win_sustained = 0}
    end;
acc_matched(P, _) -> P.

calc_fighters([], _, _Type) -> ok;
calc_fighters(Fighters,
              #tournament_match{calc_args = CalcArgs}, Args) ->
    Now = date:unixtime(),
    do_calc_fighters(Fighters,
                     Args#{time => Now, calc_args => CalcArgs}).

do_calc_fighters([], _Args) -> ok;
do_calc_fighters([#fighter{origin_id =
                               Id = {_, Platform, ZoneId},
                           pid = _Pid, name = Name,
                           combat_statistics = CombatStat}
                  | T],
                 Args = #{type := Type = win, calc_args := CalcArgs,
                          time := Now, pk_type := PkType,
                          stats_args := StatsArgs, mates := Mates,
                          rival := Rival, match_id := MatchId,
                          record_pz := PZ}) ->
    {AddPoint, Partner, CalcArgs1} =
        get_point_and_partner(Type, Id, CalcArgs),
    {HonorPoint, HonorName} = get_honor(Type,
                                        CombatStat,
                                        StatsArgs),
    case ets:lookup(tournament_profile, Id) of
        [P = #tournament_profile{season_rank_lev =
                                     SeasonLev}] ->
            {P1, ClientPoint} = update_point(Type,
                                             P,
                                             #{add_point => AddPoint,
                                               time => Now, partner => Partner,
                                               honor_point => HonorPoint}),
            {Best, P2} = calc_combat_statistics(P1,
                                                CombatStat,
                                                CalcArgs1#{type => Type,
                                                           stats_args =>
                                                               StatsArgs}),
            P3 = acc_matched(P2, Now),
            ets:insert(tournament_profile, P3),
            dets:insert(tournament_profile, P3),
            big_world:cast(Platform,
                           ZoneId,
                           tournament_agent,
                           combat_over,
                           [Type,
                            #{profile => P3, season_rank_lev => SeasonLev,
                              best => Best, mates => Mates, rival => Rival,
                              match_id => MatchId, pk_type => PkType,
                              record_pz => PZ, honor_point => HonorPoint,
                              honor_name => HonorName,
                              client_point => ClientPoint}]);
        _ ->
            logger:error("找不到参赛者 ~w, ~ts",
                         [Id, Name],
                         tournament_team,
                         1405),
            ok
    end,
    do_calc_fighters(T, Args);
do_calc_fighters([#fighter{origin_id =
                               Id = {_, Platform, ZoneId},
                           pid = _Pid, name = Name,
                           combat_statistics = CombatStat}
                  | T],
                 Args = #{type := Type = lost, calc_args := CalcArgs,
                          time := Now, pk_type := PkType,
                          stats_args := StatsArgs, mates := Mates,
                          rival := Rival, match_id := MatchId,
                          record_pz := PZ}) ->
    {AddPoint, Partner, CalcArgs1} =
        get_point_and_partner(Type, Id, CalcArgs),
    {HonorPoint, HonorName} = get_honor(Type,
                                        CombatStat,
                                        StatsArgs),
    case ets:lookup(tournament_profile, Id) of
        [P = #tournament_profile{season_rank_lev = SeasonLev,
                                 is_auto_combat = OldIsAutoCombat}] ->
            {P1, ClientPoint} = update_point(Type,
                                             P,
                                             #{add_point => AddPoint,
                                               time => Now, partner => Partner,
                                               honor_point => HonorPoint}),
            {Best, P2} = calc_combat_statistics(P1,
                                                CombatStat,
                                                CalcArgs1#{type => Type,
                                                           stats_args =>
                                                               StatsArgs}),
            P3 = acc_matched(P2, Now),
            IsAutoCombat = is_auto_combat(CombatStat),
            P4 = P3#tournament_profile{is_auto_combat =
                                           max(OldIsAutoCombat, IsAutoCombat)},
            ets:insert(tournament_profile, P4),
            dets:insert(tournament_profile, P4),
            big_world:cast(Platform,
                           ZoneId,
                           tournament_agent,
                           combat_over,
                           [Type,
                            #{profile => P4, season_rank_lev => SeasonLev,
                              best => Best, mates => Mates, rival => Rival,
                              match_id => MatchId, pk_type => PkType,
                              record_pz => PZ, honor_point => HonorPoint,
                              honor_name => HonorName,
                              client_point => ClientPoint}]);
        _ ->
            logger:error("找不到参赛者 ~w, ~ts",
                         [Id, Name],
                         tournament_team,
                         1428),
            ok
    end,
    do_calc_fighters(T, Args);
do_calc_fighters([_ | T], Args) ->
    do_calc_fighters(T, Args).

acc_tried_match([]) -> ok;
acc_tried_match([H = #tournament_team{tried_match =
                                          Tried,
                                      ids = IDS, sum_lev = SumLev,
                                      max_lev = MaxLev, min_lev = MinLev}
                 | T]) ->
    case Tried + 1 of
        100 ->
            TeamMates = lists:foldl(fun (ID, Acc) ->
                                            case ets:lookup(tournament_role, ID)
                                                of
                                                [#tournament_role{is_leader =
                                                                      IsLeader,
                                                                  classes =
                                                                      Classes,
                                                                  lev = Lev,
                                                                  rank_point =
                                                                      RankPoint}] ->
                                                    [{ID,
                                                      IsLeader,
                                                      Classes,
                                                      Lev,
                                                      RankPoint}
                                                     | Acc];
                                                _ -> Acc
                                            end
                                    end,
                                    [],
                                    IDS),
            InfoData = {length(TeamMates),
                        SumLev,
                        MaxLev,
                        MinLev,
                        TeamMates},
            logger:info("超过5分钟没匹配上 ~w",
                        [InfoData],
                        tournament_team,
                        1451);
        _ -> ok
    end,
    ets:insert(tournament_team,
               H#tournament_team{tried_match = Tried + 1}),
    acc_tried_match(T).

acc_origin_tried([]) -> ok;
acc_origin_tried([#tournament_team{origin_ids = Origins}
                  | T]) ->
    do_acc_origin_tried(Origins),
    acc_origin_tried(T).

do_acc_origin_tried([]) -> ok;
do_acc_origin_tried([Ids | T]) ->
    case ets:lookup(tournament_team, Ids) of
        [Team = #tournament_team{tried_match = Tried}] ->
            ets:insert(tournament_team,
                       Team#tournament_team{tried_match = Tried + 1});
        _ -> ok
    end,
    do_acc_origin_tried(T).

get_tried_compensation(Tried, _PkType = 2) ->
    case Tried of
        0 -> 0;
        1 -> 50;
        2 -> 50;
        3 -> 50;
        4 -> 50;
        5 -> 80;
        6 -> 80;
        7 -> 80;
        8 -> 100;
        9 -> 100;
        10 -> 100;
        11 -> 120;
        12 -> 120;
        13 -> 120;
        14 -> 140;
        15 -> 140;
        16 -> 140;
        17 -> 140;
        18 -> 160;
        19 -> 160;
        20 -> 160;
        21 -> 160;
        22 -> 180;
        23 -> 180;
        24 -> 180;
        25 -> 180;
        26 -> 200;
        27 -> 200;
        _ -> 200
    end;
get_tried_compensation(Tried, _) ->
    case Tried of
        0 -> 50;
        1 -> 50;
        2 -> 50;
        3 -> 100;
        4 -> 100;
        5 -> 130;
        6 -> 130;
        7 -> 150;
        8 -> 150;
        9 -> 170;
        10 -> 170;
        11 -> 190;
        12 -> 190;
        13 -> 200;
        14 -> 200;
        15 -> 200;
        16 -> 220;
        17 -> 220;
        18 -> 220;
        19 -> 240;
        20 -> 240;
        21 -> 240;
        22 -> 260;
        23 -> 260;
        24 -> 260;
        25 -> 280;
        26 -> 280;
        27 -> 280;
        28 -> 300;
        29 -> 300;
        30 -> 330;
        31 -> 330;
        32 -> 330;
        _ -> 360
    end.

get_tried_compensation2(Tried, _PkType = 2) ->
    case Tried of
        0 -> 0;
        1 -> 50;
        2 -> 50;
        3 -> 50;
        4 -> 50;
        5 -> 80;
        6 -> 80;
        7 -> 80;
        8 -> 100;
        9 -> 100;
        10 -> 100;
        11 -> 120;
        12 -> 120;
        13 -> 120;
        14 -> 140;
        15 -> 140;
        16 -> 140;
        17 -> 140;
        18 -> 160;
        19 -> 160;
        20 -> 160;
        21 -> 160;
        22 -> 180;
        _ -> 180
    end;
get_tried_compensation2(Tried, _) ->
    case Tried of
        0 -> 50;
        1 -> 50;
        2 -> 50;
        3 -> 100;
        4 -> 100;
        5 -> 130;
        6 -> 130;
        7 -> 150;
        8 -> 150;
        9 -> 170;
        10 -> 170;
        11 -> 190;
        12 -> 190;
        13 -> 200;
        14 -> 200;
        15 -> 200;
        16 -> 220;
        17 -> 220;
        18 -> 220;
        19 -> 240;
        20 -> 240;
        21 -> 240;
        22 -> 250;
        _ -> 250
    end.

get_reward_point(win, RoleRankPoint,
                 #{team_avg := _RwPoint, op_team_fc := Point2}) ->
    Add1 = trunc(math:pow(max(300 + Point2 - RoleRankPoint,
                              0)
                              / 20,
                          1.39999999999999991118)
                     + 22),
    min(100, max(Add1, 16));
get_reward_point(_, RoleRankPoint,
                 #{team_avg := _RwPoint, op_team_fc := Point2}) ->
    Add1 = trunc(math:pow(max(300 + RoleRankPoint - Point2,
                              0)
                              / 20,
                          1.1)
                     + 6),
    -min(100, max(Add1, 6)).

get_point_and_partner(Type, Id, Args) ->
    case ets:lookup(tournament_role, Id) of
        [R = #tournament_role{rank_point = RankPoint,
                              rank_lev = RankLev, team_id = TeamId,
                              partner = Partner, fc = _Fc}] ->
            R1 = R#tournament_role{side = 0, match_id = 0,
                                   last_matched = 0, team_id = []},
            ets:insert(tournament_role, R1),
            Rate = case tournament_data:get(RankLev) of
                       #{calc_rate := CRate} -> CRate;
                       _ ->
                           logger:error("漏掉系数 ~w",
                                        [RankLev],
                                        tournament_team,
                                        1622),
                           0
                   end,
            logger:debug("战力 ~w, 算分系数 ~w",
                         [_Fc, Rate],
                         tournament_team,
                         1625),
            {Point, CalcArgs} = case lists:keyfind(TeamId, 1, Args)
                                    of
                                    {_, Arg = #{}} ->
                                        {round(get_reward_point(Type,
                                                                RankPoint,
                                                                Arg)
                                                   * Rate
                                                   / 1000),
                                         Arg};
                                    _ ->
                                        logger:error("找不到队伍参数 ~w",
                                                     [TeamId],
                                                     tournament_team,
                                                     1630),
                                        {0, #{}}
                                end,
            {Point, Partner, CalcArgs};
        _ ->
            logger:error("找不到参赛者 ~w", [Id], tournament_team, 1635),
            {0, [], #{}}
    end.

get_honor(Type,
          Stats = #combat_statistics{total_dmg = TotalDmg,
                                     kill_group_target = KillNum,
                                     total_heal = TotalHeal,
                                     control_num = ControlNum},
          #{max_dmg := MaxDmg, max_kill := MaxKill,
            max_heal := MaxHeal, max_control := MaxControl,
            mvp_score := MvpScore, avg_dmg := AvgDmg,
            loss_mvp_score := LossMvpScore}) ->
    Score = calc_mvp_score(Stats, AvgDmg),
    AllList1 = [tournament_data:get_honor_point(Id)
                || Id <- tournament_data:get_all_honor()],
    AllList2 = lists:reverse(lists:keysort(3, AllList1)),
    Fun = fun ({Id, Point, _}, Temp) ->
                  case Id of
                      1 ->
                          case KillNum > 8 of
                              true -> {Point, 1};
                              false -> Temp
                          end;
                      4 when Type =:= win ->
                          case MvpScore =:= Score of
                              true -> {Point, 4};
                              false -> Temp
                          end;
                      5 ->
                          case TotalHeal =:= MaxHeal andalso MaxHeal =/= 0 of
                              true -> {Point, 5};
                              false -> Temp
                          end;
                      6 ->
                          case MaxControl =:= ControlNum andalso
                                   MaxControl =/= 0
                              of
                              true -> {Point, 6};
                              false -> Temp
                          end;
                      7 when Type =:= lost ->
                          case LossMvpScore =:= Score of
                              true -> {Point, 7};
                              false -> Temp
                          end;
                      2 ->
                          case TotalDmg =:= MaxDmg of
                              true -> {Point, 2};
                              false -> Temp
                          end;
                      3 ->
                          case KillNum =:= MaxKill of
                              true -> {Point, 3};
                              false -> Temp
                          end;
                      _ -> Temp
                  end;
              (_, Temp) -> Temp
          end,
    lists:foldl(Fun, {0, 0}, AllList2).

select_leader(Mates) ->
    case util:keys_sort([#tournament_role.lev,
                         #tournament_role.is_leader],
                        Mates)
        of
        [H = #tournament_role{} | T] ->
            [H#tournament_role{is_leader = 1}
             | [M#tournament_role{is_leader = 0} || M <- T]];
        _ -> Mates
    end.

do_usurp(#tournament_role{is_leader = 1}, _) ->
    {false, lang:get("你已经是队长")};
do_usurp(#tournament_role{id = Id, team_id = Ids,
                          classes = Classes, sex = Sex, lev = Lev, name = Name},
         M = #tournament_match{teams = Teams}) ->
    case lists:keyfind(Ids, #tournament_team.ids, Teams) of
        #tournament_team{usurpers = [_ | _]} ->
            {false, lang:get("当前有投票在进行中")};
        Team = #tournament_team{} ->
            Now = date:unixtime(),
            U = #tournament_usurper{id = Id, name = Name,
                                    time = Now, sex = Sex, classes = Classes,
                                    lev = Lev, pros = 1, voted_ids = [Id]},
            Msg = notice:format(lang:get("~ts发起顶替队长投票"),
                                [{role_2, Name}]),
            notice(Ids, Msg),
            multi_apply(Ids -- [Id], {usurp, U}),
            NewTeams = lists:keyreplace(Ids,
                                        #tournament_team.ids,
                                        Teams,
                                        Team#tournament_team{usurpers = [U]}),
            ets:insert(tournament_match,
                       M#tournament_match{teams = NewTeams}),
            ok;
        _ -> {false, lang:get("找不到队伍")}
    end.

multi_apply([], _) -> ok;
multi_apply([Id | T], Args) ->
    case ets:lookup(tournament_role, Id) of
        [#tournament_role{pid = Pid}] when is_pid(Pid) ->
            role:apply(async,
                       Pid,
                       {tournament_role, callback, [Args]});
        _ -> ok
    end,
    multi_apply(T, Args).

push_conver(List, Cmd = 16413, {Mates, Order}) ->
    NewOrder = order_conver(Order, []),
    push(List, Cmd, {Mates, NewOrder});
push_conver(List, Cmd, Data) -> push(List, Cmd, Data).

order_conver([], List) -> lists:reverse(List);
order_conver([I = {_, _, _} | T], List) ->
    order_conver(T, [I | List]);
order_conver([I | T], List) ->
    order_conver(T, [{I, "", 0} | List]).

push([], _Cmd, _) -> ok;
push([Id | T], Cmd, Data) ->
    multi_apply([Id], {push, Cmd, Data}),
    push(T, Cmd, Data).

notice([], _) -> ok;
notice([#tournament_role{pid = Pid} | T], Msg) ->
    case is_pid(Pid) of
        true -> notice:send({pid, Pid}, 41, Msg);
        _ -> ok
    end,
    notice(T, Msg);
notice([Id | T], Msg) ->
    case ets:lookup(tournament_role, Id) of
        [#tournament_role{pid = Pid}] when is_pid(Pid) ->
            notice:send({pid, Pid}, 41, Msg);
        _ -> ok
    end,
    notice(T, Msg).

do_vote(#tournament_role{id = Id, team_id = Ids,
                         is_leader = IsLeader, name = Name},
        Decision, M = #tournament_match{teams = Teams}, Args) ->
    case lists:keyfind(Ids, #tournament_team.ids, Teams) of
        #tournament_team{usurpers = []} ->
            {false, lang:get("当前没有有投票在进行中")};
        Team = #tournament_team{usurpers =
                                    [U = #tournament_usurper{voted_ids = Voted,
                                                             pros = Pros,
                                                             cons = Cons,
                                                             id = TargetId,
                                                             name = UName}],
                                order = Order} ->
            case lists:member(Id, Voted) of
                true -> {false, lang:get("你已经投过票了")};
                _ ->
                    Result = case IsLeader of
                                 1 when Decision =:= 1 ->
                                     vote_usurper_check(Team#tournament_team{usurpers
                                                                                 =
                                                                                 [U#tournament_usurper{pros
                                                                                                           =
                                                                                                           5,
                                                                                                       voted_ids
                                                                                                           =
                                                                                                           [Id
                                                                                                            | Voted]}]});
                                 1 ->
                                     vote_usurper_check(Team#tournament_team{usurpers
                                                                                 =
                                                                                 [U#tournament_usurper{leader_objected
                                                                                                           =
                                                                                                           1,
                                                                                                       voted_ids
                                                                                                           =
                                                                                                           [Id
                                                                                                            | Voted]}]});
                                 _ when Decision =:= 1 ->
                                     vote_usurper_check(Team#tournament_team{usurpers
                                                                                 =
                                                                                 [U#tournament_usurper{pros
                                                                                                           =
                                                                                                           Pros
                                                                                                               +
                                                                                                               1,
                                                                                                       voted_ids
                                                                                                           =
                                                                                                           [Id
                                                                                                            | Voted]}]});
                                 _ ->
                                     vote_usurper_check(Team#tournament_team{usurpers
                                                                                 =
                                                                                 [U#tournament_usurper{cons
                                                                                                           =
                                                                                                           Cons
                                                                                                               +
                                                                                                               1,
                                                                                                       voted_ids
                                                                                                           =
                                                                                                           [Id
                                                                                                            | Voted]}]})
                             end,
                    case Result of
                        {ok, NewTeam = #tournament_team{}} ->
                            notice_vote_usurper(Name, Decision, Ids),
                            NewTeams = lists:keyreplace(Ids,
                                                        #tournament_team.ids,
                                                        Teams,
                                                        NewTeam),
                            ets:insert(tournament_match,
                                       M#tournament_match{teams = NewTeams}),
                            ok;
                        handover ->
                            OldMates = get_mates(Ids),
                            Mates = [Mate
                                     || Mate = #tournament_role{is_leader =
                                                                    MisLeader,
                                                                id = Mid}
                                            <- OldMates,
                                        MisLeader =:= 1 orelse
                                            Mid =:= TargetId],
                            NewMates = change_leader(Mates, TargetId),
                            notice(OldMates,
                                   notice:format(lang:get("~ts投票成功，~ts成为新队长"),
                                                 [{role_2, Name},
                                                  {role_2, UName}])),
                            TOrder1 = case lists:keyfind(1,
                                                         #tournament_role.is_leader,
                                                         Mates)
                                          of
                                          #tournament_role{id = OriginId} ->
                                              team_util:exchange_order(Order,
                                                                       OriginId,
                                                                       TargetId);
                                          _ -> [TargetId | Order -- [TargetId]]
                                      end,
                            Order1 = order_guard(TOrder1, NewMates, Args),
                            push_conver(Ids, 16413, {NewMates, Order1}),
                            ets:insert(tournament_role, NewMates),
                            NewTeams = lists:keyreplace(Ids,
                                                        #tournament_team.ids,
                                                        Teams,
                                                        Team#tournament_team{usurpers
                                                                                 =
                                                                                 [],
                                                                             order
                                                                                 =
                                                                                 Order1}),
                            ets:insert(tournament_match,
                                       M#tournament_match{teams = NewTeams}),
                            ok;
                        fail ->
                            OldMates = get_mates(Ids),
                            case lists:keyfind(1,
                                               #tournament_role.is_leader,
                                               OldMates)
                                of
                                #tournament_role{name = LeaderName} ->
                                    notice(OldMates,
                                           notice:format(lang:get("~ts投票失败，队长仍然是~ts"),
                                                         [{role_2, Name},
                                                          {role_2,
                                                           LeaderName}]));
                                _ -> ok
                            end,
                            NewTeams = lists:keyreplace(Ids,
                                                        #tournament_team.ids,
                                                        Teams,
                                                        Team#tournament_team{usurpers
                                                                                 =
                                                                                 []}),
                            ets:insert(tournament_match,
                                       M#tournament_match{teams = NewTeams}),
                            ok;
                        Else -> Else
                    end
            end;
        _ -> {false, lang:get("找不到队伍")}
    end.

notice_vote_usurper(Name, 1, Members) ->
    Msg = notice:format(lang:get("~ts投了同意票"),
                        [{role_2, Name}]),
    notice(Members, Msg);
notice_vote_usurper(Name, _, Members) ->
    Msg = notice:format(lang:get("~ts投了反对票"),
                        [{role_2, Name}]),
    notice(Members, Msg).

vote_usurper_check(#tournament_team{usurpers =
                                        [#tournament_usurper{pros = Pros}]})
    when Pros > 2 ->
    handover;
vote_usurper_check(#tournament_team{usurpers =
                                        [#tournament_usurper{leader_objected =
                                                                 LeaderObject,
                                                             cons = Cons}]})
    when LeaderObject + Cons > 2 ->
    fail;
vote_usurper_check(Team) -> {ok, Team}.

change_leader([], _Id) -> [];
change_leader([H = #tournament_role{id = Id} | T],
              Id) ->
    [H#tournament_role{is_leader = 1} | change_leader(T,
                                                      Id)];
change_leader([H = #tournament_role{} | T], Id) ->
    [H#tournament_role{is_leader = 0} | change_leader(T,
                                                      Id)].

do_change_order(#tournament_role{is_leader = 0}, _, _,
                _) ->
    {false, lang:get("你不是队长")};
do_change_order(#tournament_role{team_id = Ids},
                M = #tournament_match{teams = Teams}, Oid, Tid) ->
    case lists:keyfind(Ids, #tournament_team.ids, Teams) of
        Team = #tournament_team{order = Order} ->
            NewOrder = team_util:exchange_order(Order, Oid, Tid),
            NewTeams = lists:keyreplace(Ids,
                                        #tournament_team.ids,
                                        Teams,
                                        Team#tournament_team{order = NewOrder}),
            push_conver(Ids, 16413, {[], NewOrder}),
            ets:insert(tournament_match,
                       M#tournament_match{teams = NewTeams}),
            ok;
        _ -> {false, lang:get("找不到队伍")}
    end.

reset_fighers([]) -> [];
reset_fighers([H = #fighter_wrap{fighter =
                                     F = #fighter{origin_id = Id}}
               | T]) ->
    case ets:lookup(tournament_role, Id) of
        [#tournament_role{is_leader = IsLeader,
                          formation_id = FormationId,
                          formation_lev = FormationLev}] ->
            NewFw = H#fighter_wrap{fighter =
                                       F#fighter{is_leader = IsLeader,
                                                 formation = FormationId,
                                                 formation_lev = FormationLev}},
            [NewFw | reset_fighers(T)];
        _ -> [H | reset_fighers(T)]
    end.

update_point(win,
             P = #tournament_profile{id = Id, rank_lev = OldRankLev,
                                     name = Name, last_matched = Last,
                                     rank_point = RankPoint,
                                     day_win_sustained = DayWinSustain,
                                     day_win = DayWin, classes = _Classes,
                                     season_rank_lev = SeasonLev,
                                     season_rank_point = SeasonPoint,
                                     best_rank_point = BestPoint,
                                     best_rank_lev = BestLev,
                                     best_partner = BestPartner,
                                     win_sustained = WinSustain,
                                     best_win_sustained = BestSustain,
                                     historical_high = HistoricalHigh,
                                     promotion_win = OPromotionWin,
                                     upgrade_point = OUpgradePoint},
             #{add_point := AddPoint0, time := Now,
               partner := Partner, honor_point := HonorPoint}) ->
    {NewDayWin, NewDayWinSustain} = case
                                        date:is_same_day(Last, Now)
                                        of
                                        true -> {DayWin + 1, DayWinSustain + 1};
                                        _ -> {1, 1}
                                    end,
    RankLev = get_rank_lev(RankPoint, OldRankLev),
    AddPoint = case NewDayWinSustain > 2 andalso RankLev < 6
                   of
                   true -> AddPoint0 * 2;
                   _ -> AddPoint0
               end,
    PromotinPoint = get_promoting_point(min(10, RankLev)),
    NextPromotinPoint = get_promoting_point(RankLev + 1),
    {NPromotionWin,
     NewAddPoint,
     NUpgradePoint,
     ClientPoint} =
        case RankPoint =:= PromotinPoint of
            true ->
                case tournament_data:get_promotion_combat(OldRankLev) of
                    #{need_win := NeedWin, point_win := PointWin} ->
                        case OPromotionWin + 1 < NeedWin of
                            true ->
                                {OPromotionWin + 1,
                                 0,
                                 OUpgradePoint + PointWin + HonorPoint,
                                 PointWin};
                            _ ->
                                {0,
                                 OUpgradePoint + PointWin + HonorPoint,
                                 0,
                                 PointWin}
                        end;
                    _ -> {0, AddPoint + HonorPoint, 0, AddPoint}
                end;
            _ -> {0, AddPoint + HonorPoint, 0, AddPoint}
        end,
    {NewRankLev, NewRankPoint} = case RankPoint >=
                                          PromotinPoint
                                          andalso NPromotionWin =:= 0
                                     of
                                     true when RankLev >= 11 ->
                                         {11, RankPoint + NewAddPoint};
                                     true when RankLev >= 10 ->
                                         {10, RankPoint + NewAddPoint};
                                     true ->
                                         {min(10, RankLev + 1),
                                          min(NextPromotinPoint,
                                              RankPoint + NewAddPoint)};
                                     false when PromotinPoint =:= 1000 ->
                                         {RankLev, RankPoint + NewAddPoint};
                                     _ ->
                                         {RankLev,
                                          min(PromotinPoint,
                                              RankPoint + NewAddPoint)}
                                 end,
    announce(#{season_rank_lev => SeasonLev,
               rank_lev => NewRankLev, id => Id, name => Name,
               day_win_sustained => NewDayWinSustain}),
    case NewAddPoint < 0 of
        true ->
            logger:error("[~ts]出现胜利扣分 ~w",
                         [Name, NewAddPoint],
                         tournament_team,
                         1918);
        _ -> ok
    end,
    logger:debug("[~ts] 职业 ~w 增加段位分 ~w 原段位分 ~w, 原段位 ~w，公式分 ~w",
                 [Name,
                  _Classes,
                  NewAddPoint,
                  RankPoint,
                  OldRankLev,
                  AddPoint0],
                 tournament_team,
                 1921),
    {P#tournament_profile{rank_point = NewRankPoint,
                          rank_lev = NewRankLev, day_win = NewDayWin,
                          day_win_sustained = NewDayWinSustain,
                          win_sustained = WinSustain + 1,
                          season_rank_lev = max(SeasonLev, NewRankLev),
                          season_rank_point = max(SeasonPoint, NewRankPoint),
                          best_rank_point = max(BestPoint, NewRankPoint),
                          best_rank_lev = max(BestLev, NewRankLev),
                          best_win_sustained = max(WinSustain + 1, BestSustain),
                          best_partner =
                              update_partner(BestPartner, Partner, NewRankLev),
                          consecutive_lost = 0,
                          historical_high = max(HistoricalHigh, NewRankLev),
                          promotion_win = NPromotionWin,
                          upgrade_point = NUpgradePoint},
     ClientPoint};
update_point(lost,
             P = #tournament_profile{rank_point = RankPoint,
                                     name = _Name, rank_lev = OldRankLev,
                                     classes = _Classes,
                                     consecutive_lost = ConsecutiveLost,
                                     upgrade_point = OUpgradePoint},
             #{add_point := AddPoint, honor_point := HonorPoint}) ->
    RankLev = get_rank_lev(RankPoint, OldRankLev),
    PromotinPoint = get_promoting_point(min(10, RankLev)),
    {NewAddPoint, NUpgradePoint, ClientPoint} = case
                                                    RankPoint =:= PromotinPoint
                                                    of
                                                    true ->
                                                        case
                                                            tournament_data:get_promotion_combat(OldRankLev)
                                                            of
                                                            #{point_lose :=
                                                                  PointLose} ->
                                                                {0,
                                                                 max(0,
                                                                     OUpgradePoint
                                                                         -
                                                                         PointLose
                                                                         +
                                                                         HonorPoint),
                                                                 0 - PointLose};
                                                            _ ->
                                                                {AddPoint +
                                                                     HonorPoint,
                                                                 0,
                                                                 AddPoint}
                                                        end;
                                                    _ ->
                                                        case RankLev =< 3 of
                                                            true ->
                                                                {HonorPoint,
                                                                 0,
                                                                 0};
                                                            _ ->
                                                                {AddPoint +
                                                                     HonorPoint,
                                                                 0,
                                                                 AddPoint}
                                                        end
                                                end,
    BottlePoint = case RankLev of
                      11 -> get_promoting_point(RankLev - 2);
                      _ -> get_promoting_point(RankLev - 1)
                  end,
    RankPoint1 = max(BottlePoint, RankPoint + NewAddPoint),
    {NewRankLev, NewRankPoint} = case RankLev =< 3 of
                                     true ->
                                         {RankLev,
                                          min(PromotinPoint, RankPoint1)};
                                     _ -> {RankLev, RankPoint1}
                                 end,
    logger:debug("[~ts] 职业 ~w 增加段位分 ~w 原段位分 ~w, 原段位 ~w",
                 [_Name, _Classes, NewAddPoint, RankPoint, OldRankLev],
                 tournament_team,
                 1997),
    {P#tournament_profile{rank_point = NewRankPoint,
                          rank_lev = NewRankLev, day_win_sustained = 0,
                          win_sustained = 0,
                          consecutive_lost = ConsecutiveLost + 1,
                          upgrade_point = NUpgradePoint},
     ClientPoint}.

get_rank_lev(_Point, OldRankLev) -> OldRankLev.

get_promoting_point(Lev) ->
    case tournament_data:get(Lev + 1) of
        #{rank_point := RankPoint} -> RankPoint;
        _ -> 0
    end.

announce(#{season_rank_lev := BSRlev, rank_lev := ARLev,
           name := Name, day_win_sustained := DayWinSustain})
    when ARLev > BSRlev ->
    Msg = case ARLev of
              10 ->
                  notice:format(lang:get("~ts在~ts威震八方，已成功晋级~ts{face_1,43}"),
                                [{role_2, Name},
                                 {string_2, 1, lang:get("天下第一武道会")},
                                 {string_2,
                                  1,
                                  tournament_data:get_name(ARLev)}]);
              11 ->
                  notice:format(lang:get("实力卓群！~ts在~ts中成功晋~ts，获得无上荣耀{face_1,36}"),
                                [{role_2, Name},
                                 {string_2, 1, lang:get("天下第一武道会")},
                                 {string_2,
                                  1,
                                  tournament_data:get_name(ARLev)}]);
              _ -> false
          end,
    case Msg of
        false -> ok;
        _ -> big_world:cast(all, notice, cast, [all, 5, Msg])
    end,
    Msg2 = case DayWinSustain of
               3 ->
                   notice:format(lang:get("~ts越战越勇，在~ts取得~ts连胜！{face_1,25}"),
                                 [{role_2, Name},
                                  {string_2, 1, lang:get("天下第一武道会")},
                                  {string_2, 1, DayWinSustain}]);
               5 ->
                   notice:format(lang:get("~ts技压群雄，竟然在~ts夺得~ts连胜！{face_1,10}"),
                                 [{role_2, Name},
                                  {string_2, 1, lang:get("天下第一武道会")},
                                  {string_2, 1, DayWinSustain}]);
               10 ->
                   notice:format(lang:get("~ts无人能敌，在~ts豪取~ts连胜后，大喝一声还有谁！{face_1,7}"),
                                 [{role_2, Name},
                                  {string_2, 1, lang:get("天下第一武道会")},
                                  {string_2, 1, DayWinSustain}]);
               _ -> false
           end,
    case Msg2 of
        false -> ok;
        _ -> big_world:cast(all, notice, cast, [all, 5, Msg2])
    end;
announce(_) -> ok.

update_partner([{_, _, RankLev}], [{Id, Name}], NewLev)
    when NewLev > RankLev ->
    [{Id, Name, NewLev}];
update_partner([], [{Id, Name}], NewLev) ->
    [{Id, Name, NewLev}];
update_partner(Partner, _, _) -> Partner.

calc_combat_statistics(P =
                           #tournament_profile{combat_count = OldCombatCount,
                                               win_count = WinCount,
                                               best_win_count = BestWinCount,
                                               season_kill = OldSeasonKill,
                                               season_reverse =
                                                   OldSeasonReverse,
                                               season_revive = OldSeasonRevive,
                                               season_dmg = OldSeasonDmg,
                                               season_bearing_dmg =
                                                   OldSeasonBearingDmg,
                                               season_zero_dmg =
                                                   OldSeasonZeroDmg,
                                               season_pet_revive =
                                                   OldSeasonPetRevive,
                                               awesome_kill = AwesomeKill,
                                               awesome_kill_num =
                                                   AwesomeKillNum,
                                               awesome_dmg = AwesomeDmg,
                                               awesome_heal = AwesomeHeal,
                                               awesome_control = AwesomeControl,
                                               mvp = Mvp, loss_mvp = LossMvp,
                                               season_awesome_kill =
                                                   SeasonAwesomeKill,
                                               season_awesome_kill_num =
                                                   SeasonAwesomeKillNum,
                                               season_awesome_dmg =
                                                   SeasonAwesomeDmg,
                                               season_awesome_heal =
                                                   SeasonAwesomeHeal,
                                               season_awesome_control =
                                                   SeasonAwesomeControl,
                                               season_mvp = SeasonMvp,
                                               season_loss_mvp = SeasonLossMvp},
                       Stats = #combat_statistics{total_hurt = TotalHurt,
                                                  total_dmg = TotalDmg,
                                                  revive = Revive,
                                                  pet_revive = PetRevie,
                                                  kill_group_target = KillNum,
                                                  total_heal = TotalHeal,
                                                  control_num = ControlNum},
                       #{team_fc := TeamFc, op_team_fc := OpTeamFc,
                         type := Type,
                         stats_args :=
                             #{max_dmg := MaxDmg, max_kill := MaxKill,
                               max_heal := MaxHeal, max_control := MaxControl,
                               mvp_score := MvpScore,
                               loss_mvp_score := LossMvpScore,
                               avg_dmg := AvgDmg}}) ->
    NewCombatCount = OldCombatCount + 1,
    NewSeasonKill = case Type of
                        win -> OldSeasonKill + 5;
                        _ -> OldSeasonKill
                    end,
    NewSeasonReverse = case TeamFc < OpTeamFc of
                           true -> OldSeasonReverse + 1;
                           false -> OldSeasonReverse
                       end,
    NewSeasonRevive = OldSeasonRevive + Revive,
    NewSeasonDmg = OldSeasonDmg + TotalDmg,
    NewSeasonBearingDmg = OldSeasonBearingDmg + TotalHurt,
    NewSeasonZeroDmg = case TotalDmg =:= 0 of
                           true -> OldSeasonZeroDmg + 1;
                           false -> OldSeasonZeroDmg
                       end,
    NewWinCount = case Type of
                      win -> WinCount + 1;
                      _ -> WinCount
                  end,
    NewBestWinCount = case Type of
                          win -> BestWinCount + 1;
                          _ -> BestWinCount
                      end,
    NewSeasonPetRevive = OldSeasonPetRevive + PetRevie,
    AddAwesomeKill = case KillNum >= 8 of
                         true -> 1;
                         _ -> 0
                     end,
    AddAwesomeKillNum = case KillNum of
                            0 -> 0;
                            MaxKill -> 1;
                            _ -> 0
                        end,
    AddAwesomeDmg = case TotalDmg of
                        0 -> 0;
                        MaxDmg -> 1;
                        _ -> 0
                    end,
    AddAwesomeHeal = case TotalHeal of
                         0 -> 0;
                         MaxHeal -> 1;
                         _ -> 0
                     end,
    AddAwesomeControl = case ControlNum of
                            0 -> 0;
                            MaxControl -> 1;
                            _ -> 0
                        end,
    {AddMvp, AddLossMvp} = case calc_mvp_score(Stats,
                                               AvgDmg)
                               of
                               0 -> {0, 0};
                               MvpScore when Type =:= win -> {1, 0};
                               LossMvpScore when Type =:= lost -> {0, 1};
                               _ -> {0, 0}
                           end,
    Best = if AddAwesomeKill > 0 -> 1;
              AddMvp > 0 -> 4;
              AddAwesomeDmg > 0 -> 2;
              AddAwesomeKillNum > 0 -> 3;
              AddAwesomeHeal > 0 -> 5;
              AddAwesomeControl > 0 -> 6;
              true -> 0
           end,
    NewP = P#tournament_profile{combat_count =
                                    NewCombatCount,
                                win_count = NewWinCount,
                                season_kill = NewSeasonKill,
                                season_reverse = NewSeasonReverse,
                                season_revive = NewSeasonRevive,
                                season_dmg = NewSeasonDmg,
                                season_bearing_dmg = NewSeasonBearingDmg,
                                season_zero_dmg = NewSeasonZeroDmg,
                                season_pet_revive = NewSeasonPetRevive,
                                best_win_count = NewBestWinCount,
                                awesome_kill = AddAwesomeKill + AwesomeKill,
                                awesome_kill_num =
                                    AddAwesomeKillNum + AwesomeKillNum,
                                awesome_dmg = AddAwesomeDmg + AwesomeDmg,
                                awesome_heal = AddAwesomeHeal + AwesomeHeal,
                                awesome_control =
                                    AddAwesomeControl + AwesomeControl,
                                mvp = AddMvp + Mvp,
                                loss_mvp = AddLossMvp + LossMvp,
                                season_awesome_kill =
                                    AddAwesomeKill + SeasonAwesomeKill,
                                season_awesome_kill_num =
                                    AddAwesomeKillNum + SeasonAwesomeKillNum,
                                season_awesome_dmg =
                                    AddAwesomeDmg + SeasonAwesomeDmg,
                                season_awesome_heal =
                                    AddAwesomeHeal + SeasonAwesomeHeal,
                                season_awesome_control =
                                    AddAwesomeControl + SeasonAwesomeControl,
                                season_mvp = AddMvp + SeasonMvp,
                                season_loss_mvp = AddLossMvp + SeasonLossMvp},
    {Best, NewP};
calc_combat_statistics(P, _, _) -> {0, P}.

check_join([], _) -> ok;
check_join([#tournament_role{id = Id,
                             is_leader = IsLeader, name = Name}
            | T],
           N) ->
    case ets:lookup(tournament_role, Id) of
        [#tournament_role{team_id = [_ | _]}] ->
            case IsLeader =:= 1 orelse T =:= [] andalso N =:= 1 of
                true -> {matching, lang:get("你当前已在匹配中，请稍等")};
                _ ->
                    {false,
                     notice:format(lang:get("~ts当前在匹配中，不能再匹配"),
                                   [{role_2, Name}])}
            end;
        _ -> check_join(T, N + 1)
    end.

to(fighter,
   #fighter{origin_id = Id, type = FType, base_id = BaseId,
            sex = Sex, lev = Lev, classes = Classes, name = Name,
            combat_statistics =
                Stats = #combat_statistics{total_hurt = TotalHurt,
                                           total_dmg = TotalDmg,
                                           kill_group_target = KillNum,
                                           killed_group_target = DeadNum,
                                           total_heal = TotalHeal,
                                           control_num = ControlNum}},
   AvgDmg) ->
    MvpScore = calc_mvp_score(Stats, AvgDmg),
    P1 = #tournament_fighter{id = Id, sex = Sex, lev = Lev,
                             classes = Classes, name = Name,
                             total_hurt = TotalHurt, total_dmg = TotalDmg,
                             kill_num = KillNum, dead_num = DeadNum,
                             total_heal = TotalHeal, control_num = ControlNum,
                             mvp_score = MvpScore},
    case ets:lookup(tournament_profile, Id) of
        [#tournament_profile{rank_lev = RankLev,
                             rank_point = RankPoint}] ->
            P1#tournament_fighter{rank_lev = RankLev,
                                  rank_point = RankPoint};
        _ ->
            Id2 = case FType of
                      5 -> {BaseId, "", 0};
                      _ -> Id
                  end,
            P1#tournament_fighter{id = Id2}
    end.

calc_mvp_score(_, 0) -> 0;
calc_mvp_score(#combat_statistics{total_dmg = TotalDmg,
                                  total_heal = TotalHeal,
                                  control_num = ControlNum},
               AvgDmg) ->
    MvpScore = round(TotalDmg / 1000) +
                   round(ControlNum * AvgDmg * 2 / 1000)
                   + round(TotalHeal / 1000),
    logger:debug("mvp计算：总输出~w，总治疗 ~w，控制数 ~w，队伍平均输出 ~w, "
                 "mvp分数 ~w",
                 [TotalDmg, TotalHeal, ControlNum, AvgDmg, MvpScore],
                 tournament_team,
                 2206),
    MvpScore.

check_classes_num([], _) -> true;
check_classes_num([C | T], L) ->
    case lists:keyfind(C, 1, L) of
        {_, V} when V >= 2 -> false;
        {_, V} ->
            L1 = lists:keyreplace(C, 1, L, {C, V + 1}),
            check_classes_num(T, L1);
        _ -> check_classes_num(T, [{C, 1} | L])
    end.

check_couple(1, _, _) -> true;
check_couple(_, MaxLev, _) when MaxLev > 100 -> true;
check_couple(_, _, Origins) ->
    case [1 || L <- Origins, length(L) >= 2] of
        [] -> true;
        _ -> false
    end.

test_match() ->
    Order1 = [{{7273, [109, 105, 120], 1}, 25570, 1, []},
              {{9138, [105, 111, 115], 13}, 25367, 2, []},
              {{2849, [105, 111, 115], 12}, 22497, 5, []},
              {{329, [109, 105, 120], 1}, 23872, 4, []},
              {{24634, [109, 105, 120], 1}, 22761, 6, []},
              {{10417, [105, 111, 115], 13}, 26249, 1, []}],
    Order2 = [{{4237, [105, 111, 115], 11}, 26682, 3, []},
              {{876, [105, 111, 115], 12}, 24607, 2, []},
              {{161, [105, 111, 115], 11}, 25881, 3, []},
              {{4107, [105, 111, 115], 12}, 25381, 3, []}],
    Mates1 = [#tournament_role{id = Oid, fc = Ofc,
                               classes = Oc, partner = OPr}
              || {Oid, Ofc, Oc, OPr} <- Order1],
    Mates2 = [#tournament_role{id = Oid, fc = Ofc,
                               classes = Oc, partner = OPr}
              || {Oid, Ofc, Oc, OPr} <- Order2],
    ets:insert(tournament_role, Mates1),
    ets:insert(tournament_role, Mates2),
    balance_arrange(fc,
                    [Id || #tournament_role{id = Id} <- Mates1],
                    [Id || #tournament_role{id = Id} <- Mates2]).

group_match([],
            #{list := L, next_id := NextId, time := Now,
              pk_type := PkType}) ->
    {Mates, Tried} = match_mates(L, #{pk_type => PkType}),
    acc_tried_match(Tried),
    do_match(Mates,
             [],
             #{next_id => NextId, time => Now, pk_type => PkType});
group_match([H | T],
            Args = #{list := L, next_id := NextId, time := Now,
                     pk_type := PkType}) ->
    {L1, L2} = lists:partition(fun (#tournament_team{sum_lev
                                                         = SumLev,
                                                     num = Num}) ->
                                       SumLev div Num >= H
                               end,
                               L),
    {Mates, Tried} = match_mates(L1, #{pk_type => PkType}),
    acc_tried_match(Tried),
    NextId1 = do_match(Mates,
                       [],
                       #{next_id => NextId, time => Now, pk_type => PkType}),
    group_match(T, Args#{list := L2, next_id := NextId1}).

order_guard(Order = [LeaderId = {_, _, _} | _], Mates,
            #{pk_type := 2}) ->
    case lists:keyfind(LeaderId, #tournament_role.id, Mates)
        of
        #tournament_role{guards = Guards} ->
            order_guard2(Order, Guards, []);
        _ ->
            logger:error("出大事了，没有找到队长：~w, ~w, ~w",
                         [LeaderId, Order, Mates],
                         tournament_team,
                         2269),
            NewOrder = [I || I = {_, _, _} <- Order],
            NewOrder
    end;
order_guard(Order = [LeaderId | _], Mates,
            #{pk_type := 2}) ->
    logger:error("出大事了，队长id不对：~w, ~w, ~w",
                 [LeaderId, Order, Mates],
                 tournament_team,
                 2274),
    NewOrder = [I || I = {_, _, _} <- Order],
    NewOrder;
order_guard(Order, _Mates, _Args) -> Order.

order_guard2([], _Guards, List) -> lists:reverse(List);
order_guard2([I = {_, _, _} | T], Guards, List) ->
    order_guard2(T, Guards, [I | List]);
order_guard2([_ | T], Guards = [], List) ->
    logger:error("守护不足：~w", [List], tournament_team, 2284),
    order_guard2(T, Guards, List);
order_guard2([_ | T], [{GuardId, _, _, _} | GT],
             List) ->
    order_guard2(T, GT, [GuardId | List]).

guard_open_order([], _TargetId, _OrderId, _Num, List) ->
    lists:reverse(List);
guard_open_order([I = {_, _, _} | T], TargetId, Num,
                 Num, List) ->
    guard_open_order(T, TargetId, Num, Num + 1, [I | List]);
guard_open_order([_ | T], TargetId, Num, Num, List) ->
    guard_open_order(T,
                     TargetId,
                     Num,
                     Num + 1,
                     [TargetId | List]);
guard_open_order([I | T], TargetId, OrderId, Num,
                 List) ->
    guard_open_order(T,
                     TargetId,
                     OrderId,
                     Num + 1,
                     [I | List]).

balance_exchange(BalanceType, TeamMates1, TeamMates2,
                 Times)
    when Times =< 10 ->
    TotalSc = calc_balance_sc(BalanceType,
                              TeamMates1 ++ TeamMates2,
                              0),
    AvgSc = TotalSc div 10,
    TotalFc1 = lists:sum([calc_balance_sc(BalanceType,
                                          TR,
                                          AvgSc)
                          || TR = #tournament_role{} <- TeamMates1]),
    TotalFc2 = lists:sum([calc_balance_sc(BalanceType,
                                          TR,
                                          AvgSc)
                          || TR = #tournament_role{} <- TeamMates2]),
    GapFc1to2 = TotalFc1 - TotalFc2,
    logger:debug("第~w次交换队伍总分差为:~w, 平均分:~w",
                 [Times, GapFc1to2, AvgSc],
                 tournament_team,
                 2328),
    SortFun = fun (TurMntRole1 = #tournament_role{},
                   TurMntRole2 = #tournament_role{}) ->
                      Rpm1 = calc_balance_sc(BalanceType, TurMntRole1, AvgSc),
                      Rpm2 = calc_balance_sc(BalanceType, TurMntRole2, AvgSc),
                      Rpm1 < Rpm2
              end,
    SortTeamMates1 = lists:sort(SortFun, TeamMates1),
    SortTeamMates2 = lists:sort(SortFun, TeamMates2),
    logger:debug("第~w次排序列表1:~w",
                 [Times, SortTeamMates1],
                 tournament_team,
                 2337),
    logger:debug("第~w次排序列表2:~w",
                 [Times, SortTeamMates2],
                 tournament_team,
                 2338),
    OptNum1 = erlang:length([ok
                             || #tournament_role{classes = Classes}
                                    <- SortTeamMates1,
                                lists:member(Classes, [1, 2, 3, 6, 7])]),
    OptNum2 = erlang:length([ok
                             || #tournament_role{classes = Classes}
                                    <- SortTeamMates2,
                                lists:member(Classes, [1, 2, 3, 6, 7])]),
    PhysicalNum1 = erlang:length([ok
                                  || #tournament_role{classes = Classes}
                                         <- SortTeamMates1,
                                     Classes =:= 1 orelse
                                         Classes =:= 3 orelse Classes =:= 7]),
    PhysicalNum2 = erlang:length([ok
                                  || #tournament_role{classes = Classes}
                                         <- SortTeamMates2,
                                     Classes =:= 1 orelse
                                         Classes =:= 3 orelse Classes =:= 7]),
    MagicNum1 = erlang:length([ok
                               || #tournament_role{classes = Classes}
                                      <- SortTeamMates1,
                                  Classes =:= 2 orelse Classes =:= 6]),
    MagicNum2 = erlang:length([ok
                               || #tournament_role{classes = Classes}
                                      <- SortTeamMates2,
                                  Classes =:= 2 orelse Classes =:= 6]),
    logger:debug("队伍输出数目:~w, 队伍物理数:~w, 队伍魔法数：~w",
                 [{OptNum1, OptNum2},
                  {PhysicalNum1, PhysicalNum2},
                  {MagicNum1, MagicNum2}],
                 tournament_team,
                 2346),
    case erlang:abs(GapFc1to2) < 450 of
        true ->
            case final_check(OptNum1,
                             OptNum2,
                             PhysicalNum1,
                             PhysicalNum2,
                             MagicNum1,
                             MagicNum2,
                             SortTeamMates1,
                             SortTeamMates2)
                of
                {ok, NTeamMates1, NTeamMates2} ->
                    NTotalFc1 = lists:sum([calc_balance_sc(BalanceType,
                                                           TR,
                                                           AvgSc)
                                           || TR = #tournament_role{}
                                                  <- NTeamMates1]),
                    NTotalFc2 = lists:sum([calc_balance_sc(BalanceType,
                                                           TR,
                                                           AvgSc)
                                           || TR = #tournament_role{}
                                                  <- NTeamMates2]),
                    NGapFc1to2 = NTotalFc1 - NTotalFc2,
                    logger:debug("双方原分差为:~w, 新分差为：~w",
                                 [GapFc1to2, NGapFc1to2],
                                 tournament_team,
                                 2356),
                    case abs(NGapFc1to2) > abs(GapFc1to2 * 1.1) of
                        true ->
                            logger:debug("分差扩大超过10%，交换失败",
                                         [],
                                         tournament_team,
                                         2358),
                            {TeamMates1, TeamMates2};
                        false ->
                            logger:debug("分差扩大不超过10%，交换成功， 新队伍",
                                         [],
                                         tournament_team,
                                         2359),
                            {NTeamMates1, NTeamMates2}
                    end;
                _ ->
                    logger:debug("双方分差为:~w, 停止交换",
                                 [GapFc1to2],
                                 tournament_team,
                                 2362),
                    {TeamMates1, TeamMates2}
            end;
        _ ->
            AssistsNum1 = erlang:length([ok
                                         || #tournament_role{classes = Classes}
                                                <- SortTeamMates1,
                                            lists:member(Classes, [4, 5])]),
            AssistsNum2 = erlang:length([ok
                                         || #tournament_role{classes = Classes}
                                                <- SortTeamMates2,
                                            lists:member(Classes, [4, 5])]),
            DevineNum1 = erlang:length([ok
                                        || #tournament_role{classes = Classes}
                                               <- SortTeamMates1,
                                           Classes =:= 5]),
            DevineNum2 = erlang:length([ok
                                        || #tournament_role{classes = Classes}
                                               <- SortTeamMates2,
                                           Classes =:= 5]),
            logger:debug("队伍辅助数目:~w, 队伍秘言数:~w",
                         [{AssistsNum1, AssistsNum2}, {DevineNum1, DevineNum2}],
                         tournament_team,
                         2373),
            Args = #{gap_fc => GapFc1to2, exchange_list => [],
                     assist_num1 => AssistsNum1, assist_num2 => AssistsNum2,
                     balance_type => BalanceType, devine_num1 => DevineNum1,
                     devine_num2 => DevineNum2, avg_sc => AvgSc},
            case try_balance_exchange_single(SortTeamMates1,
                                             SortTeamMates2,
                                             Args)
                of
                {ok, NewIds1, NewIds2, _Args} ->
                    _Ids1 = [Id || #tournament_role{id = Id} <- NewIds1],
                    _Ids2 = [Id || #tournament_role{id = Id} <- NewIds2],
                    logger:debug("交换成功,交换后: 队1~w, 队2:~w",
                                 [_Ids1, _Ids2],
                                 tournament_team,
                                 2382),
                    balance_exchange(BalanceType,
                                     NewIds1,
                                     NewIds2,
                                     Times + 1);
                {false, Args2} ->
                    logger:debug("单人交换结束,进行双人交换",
                                 [],
                                 tournament_team,
                                 2385),
                    case try_balance_exchange_partner(SortTeamMates1,
                                                      SortTeamMates2,
                                                      Args2#{exchange_list =>
                                                                 []})
                        of
                        {ok, ExchangeParterIds1, ExchangeParterIds2, _} ->
                            balance_exchange(BalanceType,
                                             ExchangeParterIds1,
                                             ExchangeParterIds2,
                                             Times + 1);
                        {false, _Args} ->
                            logger:debug("进行对调", [], tournament_team, 2391),
                            case try_balance_exchange_partner(TeamMates2,
                                                              TeamMates1,
                                                              Args#{gap_fc =>
                                                                        -GapFc1to2,
                                                                    assist_num1
                                                                        =>
                                                                        AssistsNum2,
                                                                    assist_num2
                                                                        =>
                                                                        AssistsNum1,
                                                                    exchange_list
                                                                        => []})
                                of
                                {ok,
                                 SecondExchangeIds2,
                                 SecondExchangeIds1,
                                 _} ->
                                    balance_exchange(BalanceType,
                                                     SecondExchangeIds2,
                                                     SecondExchangeIds1,
                                                     Times + 1);
                                _Else ->
                                    case final_check(OptNum1,
                                                     OptNum2,
                                                     PhysicalNum1,
                                                     PhysicalNum2,
                                                     MagicNum1,
                                                     MagicNum2,
                                                     SortTeamMates1,
                                                     SortTeamMates2)
                                        of
                                        {ok, NNTeamMates1, NNTeamMates2} ->
                                            NNTotalFc1 =
                                                lists:sum([calc_balance_sc(BalanceType,
                                                                           TR,
                                                                           AvgSc)
                                                           || TR =
                                                                  #tournament_role{}
                                                                  <- NNTeamMates1]),
                                            NNTotalFc2 =
                                                lists:sum([calc_balance_sc(BalanceType,
                                                                           TR,
                                                                           AvgSc)
                                                           || TR =
                                                                  #tournament_role{}
                                                                  <- NNTeamMates2]),
                                            NNGapFc1to2 = NNTotalFc1 -
                                                              NNTotalFc2,
                                            logger:debug("双方原分差为:~w, 新分差为：~w",
                                                         [GapFc1to2,
                                                          NNGapFc1to2],
                                                         tournament_team,
                                                         2403),
                                            case abs(NNGapFc1to2) >
                                                     abs(GapFc1to2 * 1.1)
                                                of
                                                true ->
                                                    logger:debug("分差扩大超过10%，交换失败",
                                                                 [],
                                                                 tournament_team,
                                                                 2405),
                                                    {TeamMates1, TeamMates2};
                                                false ->
                                                    logger:debug("分差扩大不超过10%，交换成功， 新队伍",
                                                                 [],
                                                                 tournament_team,
                                                                 2406),
                                                    {NNTeamMates1, NNTeamMates2}
                                            end;
                                        _ ->
                                            logger:debug("双方分差为:~w, 无法继续交换, 队伍信息:~w",
                                                         [GapFc1to2,
                                                          {TeamMates1,
                                                           TeamMates2}],
                                                         tournament_team,
                                                         2409),
                                            {TeamMates1, TeamMates2}
                                    end
                            end
                    end
            end
    end;
balance_exchange(BalanceType, TeamMates1, TeamMates2,
                 _) ->
    TotalFc1 = lists:sum([calc_balance_sc(BalanceType,
                                          TR,
                                          0)
                          || TR = #tournament_role{} <- TeamMates1]),
    TotalFc2 = lists:sum([calc_balance_sc(BalanceType,
                                          TR,
                                          0)
                          || TR = #tournament_role{} <- TeamMates2]),
    GapFc1to2 = TotalFc1 - TotalFc2,
    logger:info("双方分差为:~w, 交换超过10次, 队伍:~w",
                [GapFc1to2, {TeamMates1, TeamMates2}],
                tournament_team,
                2420),
    {TeamMates1, TeamMates2}.

calc_balance_sc(BalanceType, TournamentRoles = [_ | _],
                AvgSc) ->
    calc_balance_sc(BalanceType, TournamentRoles, 0, AvgSc);
calc_balance_sc(rank_point,
                #tournament_role{rank_lev = RankLev}, AvgSc) ->
    Sc = (RankLev - 1) * 100,
    case Sc > AvgSc of
        true when AvgSc =/= 0 -> Sc * 2;
        _ -> Sc
    end;
calc_balance_sc(_BalanceType, #tournament_role{fc = Fc},
                _) ->
    Fc.

calc_balance_sc(_, [], Rtn, _AvgSc) -> Rtn;
calc_balance_sc(BalanceType,
                [TRole = #tournament_role{} | Rest], Rtn, AvgSc) ->
    Sc = calc_balance_sc(BalanceType, TRole, AvgSc),
    calc_balance_sc(BalanceType, Rest, Sc + Rtn, AvgSc).

try_balance_exchange_single(TeamMates1, TeamMates2,
                            Args = #{exchange_list := ExchangeList}) ->
    case get_try_single(TeamMates1, ExchangeList) of
        {Try1 = #tournament_role{id = RoleId1},
         ExchangeList1} ->
            case try_balance_exchange_other_team(Try1,
                                                 TeamMates2,
                                                 Args#{exchange_list => []})
                of
                {ok, Try2 = #tournament_role{id = RoleId2}, NewArgs} ->
                    LeftTeam1 = lists:keydelete(RoleId1,
                                                #tournament_role.id,
                                                TeamMates1),
                    LeftTeam2 = lists:keydelete(RoleId2,
                                                #tournament_role.id,
                                                TeamMates2),
                    NewTeamMates1 = [Try2 | LeftTeam1],
                    NewTeamMates2 = [Try1 | LeftTeam2],
                    {ok, NewTeamMates1, NewTeamMates2, NewArgs};
                {false, _} ->
                    try_balance_exchange_single(TeamMates1,
                                                TeamMates2,
                                                Args#{exchange_list =>
                                                          ExchangeList1});
                _Err ->
                    logger:error("武道交换时错误:~w",
                                 [_Err],
                                 tournament_team,
                                 2456),
                    {false, Args#{exchange_list => ExchangeList1}}
            end;
        {false, ExchangeList1} ->
            NewArgs = Args#{exchange_list => ExchangeList1},
            {false, NewArgs}
    end.

try_balance_exchange_partner(TeamMates1, TeamMates2,
                             Args = #{exchange_list := ExchangeList}) ->
    case get_try_paterner(TeamMates1, ExchangeList) of
        {ok, Partners1, ExchangeList1} ->
            case try_balance_exchange_other_team_partner(Partners1,
                                                         TeamMates2,
                                                         Args#{exchange_list =>
                                                                   []})
                of
                {ok, Partners2, NewArgs} ->
                    logger:debug("交换成功", [], tournament_team, 2469),
                    LeftTeam1 = [TR
                                 || TR = #tournament_role{id = Id}
                                        <- TeamMates1,
                                    not
                                        lists:keymember(Id,
                                                        #tournament_role.id,
                                                        Partners1)],
                    LeftTeam2 = [TR
                                 || TR = #tournament_role{id = Id}
                                        <- TeamMates2,
                                    not
                                        lists:keymember(Id,
                                                        #tournament_role.id,
                                                        Partners2)],
                    NewTeamMates1 = Partners2 ++ LeftTeam1,
                    NewTeamMates2 = Partners1 ++ LeftTeam2,
                    {ok, NewTeamMates1, NewTeamMates2, NewArgs};
                {false, _} ->
                    NewArgs = Args#{exchange_list := ExchangeList1},
                    try_balance_exchange_partner(TeamMates1,
                                                 TeamMates2,
                                                 NewArgs);
                _Err ->
                    logger:error("武道交换时错误:~w",
                                 [_Err],
                                 tournament_team,
                                 2482),
                    {false, Args#{exchange_list => ExchangeList1}}
            end;
        {false, ExchangeList3} ->
            NewArgs = Args#{exchange_list => ExchangeList3},
            {false, NewArgs}
    end.

try_balance_exchange_other_team_partner(TryTRoles1,
                                        TeamMates2,
                                        Args = #{gap_fc := GapFc,
                                                 assist_num1 := AssistsNum1,
                                                 assist_num2 := AssistsNum2,
                                                 exchange_list := ExchangeList,
                                                 balance_type := BalanceType,
                                                 avg_sc := AvgSc,
                                                 devine_num1 := DevineNum1,
                                                 devine_num2 := DevineNum2}) ->
    case get_try_paterner_other(TeamMates2, ExchangeList) of
        {ok, TryTRoles2, ExchangeList1} ->
            TuRoleSc1 = calc_balance_sc(BalanceType,
                                        TryTRoles1,
                                        AvgSc),
            TuRoleSc2 = calc_balance_sc(BalanceType,
                                        TryTRoles2,
                                        AvgSc),
            GapMateFc = TuRoleSc1 - TuRoleSc2,
            AfterExchangeFc = abs(GapFc - 2 * GapMateFc),
            case AfterExchangeFc < abs(GapFc) of
                true ->
                    logger:debug("双人交换后分差:~w, 属于正向交换",
                                 [AfterExchangeFc],
                                 tournament_team,
                                 2503),
                    TryAssistsNum1 = erlang:length([ok
                                                    || #tournament_role{classes
                                                                            =
                                                                            Classes}
                                                           <- TryTRoles1,
                                                       lists:member(Classes,
                                                                    [4, 5])]),
                    TryAssistsNum2 = erlang:length([ok
                                                    || #tournament_role{classes
                                                                            =
                                                                            Classes}
                                                           <- TryTRoles2,
                                                       lists:member(Classes,
                                                                    [4, 5])]),
                    {AssistsNum11, AssistsNum21} = {AssistsNum1 -
                                                        TryAssistsNum1,
                                                    AssistsNum2 +
                                                        TryAssistsNum1},
                    {AssistsNum12, AssistsNum22} = {AssistsNum11 +
                                                        TryAssistsNum2,
                                                    AssistsNum21 -
                                                        TryAssistsNum2},
                    AssistsFlag = (AssistsNum12 >= 1 andalso
                                       AssistsNum12 =< 2)
                                      andalso
                                      AssistsNum22 >= 1 andalso
                                          AssistsNum22 =< 2,
                    DevineFlag = case DevineNum1 + DevineNum2 >= 2 of
                                     true ->
                                         TryDevineNum1 = erlang:length([ok
                                                                        || #tournament_role{classes
                                                                                                =
                                                                                                Classes}
                                                                               <- TryTRoles1,
                                                                           Classes
                                                                               =:=
                                                                               5]),
                                         TryDevineNum2 = erlang:length([ok
                                                                        || #tournament_role{classes
                                                                                                =
                                                                                                Classes}
                                                                               <- TryTRoles2,
                                                                           Classes
                                                                               =:=
                                                                               5]),
                                         {DevineNum11, DevineNum21} =
                                             {DevineNum1 - TryDevineNum1,
                                              DevineNum2 + TryDevineNum1},
                                         {DevineNum12, DevineNum22} =
                                             {DevineNum11 + TryDevineNum2,
                                              DevineNum21 - TryDevineNum2},
                                         (DevineNum12 >= 1 andalso
                                              DevineNum12 =< 2)
                                             andalso
                                             DevineNum22 >= 1 andalso
                                                 DevineNum22 =< 2;
                                     _ -> true
                                 end,
                    case AssistsFlag andalso DevineFlag of
                        true ->
                            logger:debug("双人交换后辅助数目:~w, 属于正向交换",
                                         [{AssistsNum12, AssistsNum22}],
                                         tournament_team,
                                         2528),
                            {ok, TryTRoles2, Args};
                        false ->
                            logger:debug("双人交换后辅助数目:~w, 交换失败",
                                         [{AssistsNum12, AssistsNum22}],
                                         tournament_team,
                                         2532),
                            NewArgs = Args#{exchange_list => ExchangeList1},
                            try_balance_exchange_other_team_partner(TryTRoles1,
                                                                    TeamMates2,
                                                                    NewArgs)
                    end;
                false ->
                    logger:debug("双人交换后分差:~w, 交换失败",
                                 [AfterExchangeFc],
                                 tournament_team,
                                 2538),
                    NewArgs = Args#{exchange_list => ExchangeList1},
                    try_balance_exchange_other_team_partner(TryTRoles1,
                                                            TeamMates2,
                                                            NewArgs)
            end;
        {false, ExchangeList2} ->
            NewArgs = Args#{exchange_list => ExchangeList2},
            {false, NewArgs}
    end.

try_balance_exchange_other_team(TryTRole1 =
                                    #tournament_role{id = _RoleId1,
                                                     classes = Classes1},
                                ExchangeTeamMates,
                                Args = #{gap_fc := GapFc,
                                         exchange_list := ExchangeList,
                                         assist_num1 := AssistsNum1,
                                         assist_num2 := AssistsNum2,
                                         balance_type := BalanceType,
                                         avg_sc := AvgSc,
                                         devine_num1 := DevineNum1,
                                         devine_num2 := DevineNum2}) ->
    case get_try_single(ExchangeTeamMates, ExchangeList) of
        {TryTRole2 = #tournament_role{id = _RoleId2,
                                      classes = Classes2},
         NewExchangeList} ->
            TuRoleSc1 = calc_balance_sc(BalanceType,
                                        TryTRole1,
                                        AvgSc),
            TuRoleSc2 = calc_balance_sc(BalanceType,
                                        TryTRole2,
                                        AvgSc),
            GapMateFc = TuRoleSc1 - TuRoleSc2,
            AfterExchangeFc = abs(GapFc - 2 * GapMateFc),
            logger:debug("队伍分差:~w,队员1(~w)分数~w,队员2(~w)分数~w, 分差:~w, "
                         "交换后队伍分差:~w",
                         [GapFc,
                          _RoleId1,
                          TuRoleSc1,
                          _RoleId2,
                          TuRoleSc2,
                          GapMateFc,
                          AfterExchangeFc],
                         tournament_team,
                         2557),
            case AfterExchangeFc < abs(GapFc) of
                true ->
                    logger:debug("分差属于正向分差,判断辅助数目",
                                 [],
                                 tournament_team,
                                 2561),
                    {AssistsNum11, AssistsNum21} = case
                                                       lists:member(Classes1,
                                                                    [4, 5])
                                                       of
                                                       true ->
                                                           {AssistsNum1 - 1,
                                                            AssistsNum2 + 1};
                                                       _ ->
                                                           {AssistsNum1,
                                                            AssistsNum2}
                                                   end,
                    {AssistsNum12, AssistsNum22} = case
                                                       lists:member(Classes2,
                                                                    [4, 5])
                                                       of
                                                       true ->
                                                           {AssistsNum11 + 1,
                                                            AssistsNum21 - 1};
                                                       _ ->
                                                           {AssistsNum11,
                                                            AssistsNum21}
                                                   end,
                    AssistFlag = (AssistsNum12 > 0 andalso AssistsNum12 < 3)
                                     andalso
                                     AssistsNum22 > 0 andalso AssistsNum22 < 3,
                    DevineFlag = case DevineNum1 + DevineNum2 >= 2 of
                                     true ->
                                         {DevineNum11, DevineNum21} = case
                                                                          Classes1
                                                                              =:=
                                                                              5
                                                                          of
                                                                          true ->
                                                                              {DevineNum1
                                                                                   -
                                                                                   1,
                                                                               DevineNum2
                                                                                   +
                                                                                   1};
                                                                          _ ->
                                                                              {DevineNum1,
                                                                               DevineNum2}
                                                                      end,
                                         {DevineNum12, DevineNum22} = case
                                                                          Classes2
                                                                              =:=
                                                                              5
                                                                          of
                                                                          true ->
                                                                              {DevineNum11
                                                                                   +
                                                                                   1,
                                                                               DevineNum21
                                                                                   -
                                                                                   1};
                                                                          _ ->
                                                                              {DevineNum11,
                                                                               DevineNum21}
                                                                      end,
                                         (DevineNum12 > 0 andalso
                                              DevineNum12 < 3)
                                             andalso
                                             DevineNum22 > 0 andalso
                                                 DevineNum22 < 3;
                                     _ -> true
                                 end,
                    logger:debug("交换后辅助数目:~w",
                                 [{AssistsNum12, AssistsNum22}],
                                 tournament_team,
                                 2587),
                    case AssistFlag andalso DevineFlag of
                        true ->
                            logger:debug("交换成功,A队伍交换队员:~w, B队交换队员:~w",
                                         [_RoleId1, _RoleId2],
                                         tournament_team,
                                         2591),
                            {ok,
                             TryTRole2,
                             Args#{exchange_list => NewExchangeList}};
                        false ->
                            logger:debug("交换后辅助数量超过规则限制",
                                         [],
                                         tournament_team,
                                         2595),
                            NewArgs = Args#{exchange_list := NewExchangeList},
                            try_balance_exchange_other_team(TryTRole1,
                                                            ExchangeTeamMates,
                                                            NewArgs)
                    end;
                false ->
                    NewArgs = Args#{exchange_list := NewExchangeList},
                    try_balance_exchange_other_team(TryTRole1,
                                                    ExchangeTeamMates,
                                                    NewArgs)
            end;
        {false, NewExchangeList} ->
            {false, Args#{exchange_list := NewExchangeList}}
    end.

get_try_single([], ExchangeList) ->
    {false, ExchangeList};
get_try_single([TRole = #tournament_role{id = RoleId,
                                         partner = []}
                | Rest],
               ExchangeList) ->
    case lists:member(RoleId, ExchangeList) of
        true -> get_try_single(Rest, ExchangeList);
        false -> {TRole, [RoleId | ExchangeList]}
    end;
get_try_single([#tournament_role{id = RoleId} | Rest],
               ExchangeList) ->
    get_try_single(Rest, [RoleId | ExchangeList]).

get_try_paterner([], ExchangeList) ->
    {false, ExchangeList};
get_try_paterner([TRole = #tournament_role{id = RoleId,
                                           partner = [{PartnerId, _} | _]}
                  | Rest],
                 ExchangeList) ->
    case lists:member({RoleId, PartnerId}, ExchangeList) of
        true -> get_try_paterner(Rest, ExchangeList);
        false ->
            case lists:keyfind(PartnerId, #tournament_role.id, Rest)
                of
                PartnerRole = #tournament_role{} ->
                    NewExchangeList = [{RoleId, PartnerId} | ExchangeList],
                    {ok, [TRole, PartnerRole], NewExchangeList};
                _ -> {false, ExchangeList}
            end
    end;
get_try_paterner([_ | Rest], ExchangeList) ->
    get_try_paterner(Rest, ExchangeList).

get_try_paterner_other([], ExchangeList) ->
    {false, ExchangeList};
get_try_paterner_other([TRole = #tournament_role{id =
                                                     RoleId,
                                                 partner = Partner}
                        | Rest],
                       ExchangeList) ->
    case Partner of
        [{PartnerId, _} | _] ->
            case lists:keyfind(PartnerId, #tournament_role.id, Rest)
                of
                PartnerRole = #tournament_role{} ->
                    case lists:member({RoleId, PartnerId}, ExchangeList) of
                        false ->
                            NewExchangeList = [{RoleId, PartnerId}
                                               | ExchangeList],
                            {ok, [TRole, PartnerRole], NewExchangeList};
                        _ ->
                            LeftList = lists:keydelete(PartnerId,
                                                       #tournament_role.id,
                                                       Rest),
                            get_try_paterner_other(LeftList, ExchangeList)
                    end;
                _ -> {false, ExchangeList}
            end;
        _ ->
            case [TRole2
                  || TRole2 = #tournament_role{id = RoleId2, partner = []}
                         <- Rest,
                     lists:member({RoleId, RoleId2}, ExchangeList) =:= false]
                of
                [PartnerRole = #tournament_role{id = PartnerId} | _] ->
                    NewExchangeList = [{RoleId, PartnerId} | ExchangeList],
                    {ok, [TRole, PartnerRole], NewExchangeList};
                _ -> get_try_paterner_other(Rest, ExchangeList)
            end
    end;
get_try_paterner_other([_ | Rest], ExchangeList) ->
    get_try_paterner_other(Rest, ExchangeList).

is_auto_combat(#combat_statistics{auto_round =
                                      AutoRound}) ->
    case [ok
          || Round <- [1, 2, 3], lists:member(Round, AutoRound)]
        of
        [_, _, _] -> 1;
        _ -> 0
    end.

final_check(OptNum1, OptNum2, PhysicalNum1,
            PhysicalNum2, MagicNum1, MagicNum2, SortTeamMates1,
            SortTeamMates2) ->
    logger:debug("检查队伍输出是否为同一类型",
                 [],
                 tournament_team,
                 2677),
    case check_all_opt(OptNum1,
                       OptNum2,
                       PhysicalNum1,
                       PhysicalNum2,
                       MagicNum1,
                       MagicNum2)
        of
        {ok, Flag} ->
            logger:debug("输出都为同一类型，尝试交换最高段位分玩家",
                         [],
                         tournament_team,
                         2680),
            case exchange_max(lists:reverse(SortTeamMates1),
                              lists:reverse(SortTeamMates2),
                              Flag)
                of
                {ok, NTeamMates1, NTeamMates2} ->
                    logger:debug("交换最高段位分玩家成功", [], tournament_team, 2683),
                    {ok, NTeamMates1, NTeamMates2};
                _ ->
                    logger:debug("尝试交换最高段位分玩家失败，尝试交换最低段位分玩家",
                                 [],
                                 tournament_team,
                                 2686),
                    case exchange_max(SortTeamMates1, SortTeamMates2, Flag)
                        of
                        {ok, NNTeamMates1, NNTeamMates2} ->
                            logger:debug("尝试交换最低段位分玩家成功",
                                         [],
                                         tournament_team,
                                         2689),
                            {ok, NNTeamMates1, NNTeamMates2};
                        _ -> false
                    end
            end;
        _ -> false
    end.

check_all_opt(OptNum1, _OptNum2, PhysicalNum1,
              _PhysicalNum2, _MagicNum1, MagicNum2)
    when OptNum1 =:= PhysicalNum1 andalso MagicNum2 > 1 ->
    {ok, 1};
check_all_opt(OptNum1, _OptNum2, _PhysicalNum1,
              PhysicalNum2, MagicNum1, _MagicNum2)
    when OptNum1 =:= MagicNum1 andalso PhysicalNum2 > 1 ->
    {ok, 2};
check_all_opt(_OptNum1, OptNum2, _PhysicalNum1,
              PhysicalNum2, MagicNum1, _MagicNum2)
    when OptNum2 =:= PhysicalNum2 andalso MagicNum1 > 1 ->
    {ok, 3};
check_all_opt(_OptNum1, OptNum2, PhysicalNum1,
              _PhysicalNum2, _MagicNum1, MagicNum2)
    when OptNum2 =:= MagicNum2 andalso PhysicalNum1 > 1 ->
    {ok, 4};
check_all_opt(_OptNum1, _OptNum2, _PhysicalNum1,
              _PhysicalNum2, _MagicNum1, _MagicNum2) ->
    false.

exchange_max(Team1, Team2, Flag) ->
    logger:debug("交换最 ~w 段位分玩家",
                 [Flag],
                 tournament_team,
                 2704),
    case Flag of
        3 -> exchange_max(Team2, Team1, Flag - 2);
        4 -> exchange_max(Team2, Team1, Flag - 2);
        1 ->
            case get_first_single(Team1, [], 1) of
                {Try1 = #tournament_role{id = RoleId1}} ->
                    case get_first_single(Team2, [], 2) of
                        {Try2 = #tournament_role{id = RoleId2}} ->
                            LeftTeam1 = lists:keydelete(RoleId1,
                                                        #tournament_role.id,
                                                        Team1),
                            LeftTeam2 = lists:keydelete(RoleId2,
                                                        #tournament_role.id,
                                                        Team2),
                            NewTeamMates1 = [Try2 | LeftTeam1],
                            NewTeamMates2 = [Try1 | LeftTeam2],
                            {ok, NewTeamMates1, NewTeamMates2};
                        _ -> false
                    end;
                _ -> false
            end;
        2 ->
            case get_first_single(Team1, [], 2) of
                {Try1 = #tournament_role{id = RoleId1}} ->
                    case get_first_single(Team2, [], 1) of
                        {Try2 = #tournament_role{id = RoleId2}} ->
                            LeftTeam1 = lists:keydelete(RoleId1,
                                                        #tournament_role.id,
                                                        Team1),
                            LeftTeam2 = lists:keydelete(RoleId2,
                                                        #tournament_role.id,
                                                        Team2),
                            NewTeamMates1 = [Try2 | LeftTeam1],
                            NewTeamMates2 = [Try1 | LeftTeam2],
                            {ok, NewTeamMates1, NewTeamMates2};
                        _ -> false
                    end;
                _ -> false
            end;
        _ ->
            logger:debug("交换最高段位分玩家出错", [], tournament_team, 2736)
    end.

get_first_single([], ExchangeList, _Type) ->
    {false, ExchangeList};
get_first_single([TRole = #tournament_role{id = RoleId,
                                           partner = [], classes = Classes}
                  | Rest],
                 ExchangeList, Type) ->
    ClassesType = case Type of
                      1 -> [2, 6, 5, 4];
                      _ -> [1, 3, 7, 5, 4]
                  end,
    case lists:member(RoleId, ExchangeList) orelse
             lists:member(Classes, ClassesType)
        of
        true -> get_first_single(Rest, ExchangeList, Type);
        false -> {TRole}
    end;
get_first_single([#tournament_role{id = RoleId} | Rest],
                 ExchangeList, Type) ->
    get_first_single(Rest, [RoleId | ExchangeList], Type).

