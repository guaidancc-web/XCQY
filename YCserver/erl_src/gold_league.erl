-file("src/mod/gold_league/gold_league.erl", 1).

-module(gold_league).

-behaviour(gen_fsm).

-export([start_link/8,
         cast/2,
         call/2,
         combat_over/1,
         apply_enter_field/4,
         apply_exit/2,
         apply_lose/2,
         apply_win/2,
         apply_out_win/2,
         apply_out_lose/2,
         logout_field/2,
         enter_field/2,
         exit_gold_league_field/1,
         out_exit_gold_league_field/1,
         get_field_info/2,
         get_field_role_num/1,
         last_enter_field/2,
         apply_last_enter_field/4,
         die_leave_zone/1,
         request_start_combat/1,
         reply_start_combat/2,
         get_16_role/1,
         get_16_data/4,
         guess/3,
         do_guess/5,
         print_info/1,
         print_self_info/1,
         use_drug/2,
         guard_drug_skill/2,
         get_fight_rival_info/1,
         get_rise_num/1,
         push_combat_over_stats/2,
         m/1,
         stop_combat/0]).

-export([init/1,
         handle_event/3,
         handle_sync_event/4,
         handle_info/3,
         terminate/3,
         code_change/4]).

-export([fight/2, fight_out/2, fight_guess/2]).

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

-file("src/mod/gold_league/gold_league.erl", 63).

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

-file("src/mod/gold_league/gold_league.erl", 64).

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

-file("src/mod/gold_league/gold_league.erl", 65).

-file("inc/gold_league.hrl", 1).

-record(gold_league_ready_zone,
        {cross_id = 0,
         map_id = 0 :: non_neg_integer(),
         map_zone = 0,
         map_plat = "",
         map_pid :: pid() | undefined,
         member_size = 0 :: non_neg_integer(),
         group_id = 0 :: pos_integer(),
         exit_npc,
         combat_mode = 0,
         init_combat_mode = 0}).

-record(gold_league_zone,
        {cross_id = 0,
         id = 0,
         key,
         group_id = 0 :: pos_integer(),
         seq_id = 0,
         pid,
         is_close = 0}).

-record(gold_league_field,
        {id = 0 :: non_neg_integer(),
         key,
         cross_id = 0,
         group_id = 0 :: non_neg_integer(),
         seq_id = 0 :: non_neg_integer(),
         pid :: pid() | undefined,
         map_id = 0,
         map_pid,
         map_plat = "",
         map_zone = 0,
         phase = 0,
         end_time = 0,
         combat_mode = 0,
         now_round = 0,
         max_round = 0}).

-record(gold_league_state,
        {key,
         cross_id = 0,
         group_id = 0 :: non_neg_integer(),
         state_name,
         phase = 0,
         end_time = 0,
         now_round = 0,
         max_round = 0,
         ids = []}).

-record(gold_league_zone_role,
        {id,
         pid,
         name = "",
         sex = 0,
         classes = 0,
         lev = 0 :: non_neg_integer(),
         fc = 0,
         group_id = 0 :: pos_integer(),
         field_id = 0,
         status = 0,
         is_combat = 0,
         combat_pid,
         last_combat_over_time = 0,
         rival_id = undefined,
         rival_pid = undefined,
         rival_name = "",
         ref = undefined,
         win_count = 0,
         combat_count = 0,
         score = 0,
         cross_id = 0,
         match = 0,
         pos = 0,
         match_num = 0,
         match_group_id = 0,
         is_lose = 0,
         lose_round = 0,
         rank = 0,
         is_out = 0,
         is_result = 0}).

-record(gold_league,
        {id ::
             undefined |
             {pos_integer(), bitstring(), non_neg_integer()},
         pid :: pid() | undefined,
         name = "" :: string(),
         sex = 0,
         classes = 0,
         face_id = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         break_times = 0,
         fc = 0 :: non_neg_integer(),
         looks = [] :: list(),
         group_id = 0 :: pos_integer(),
         match = 0 :: pos_integer(),
         combat_count = 0 :: pos_integer(),
         win = 0,
         lose = 0,
         rival_id = {0, "", 0} :: tuple(),
         multi_kill = 0 :: non_neg_integer(),
         win_count = 0,
         score = 0 :: non_neg_integer(),
         rank = 0 :: pos_integer(),
         ready_map_id = 0 :: non_neg_integer(),
         ready_map_pid :: pid() | undefined,
         ready_map_plat = "",
         ready_map_zone = 0,
         seq_id = 0 :: non_neg_integer(),
         field_id = 0 :: non_neg_integer(),
         field_map_id = 0 :: non_neg_integer(),
         field_map_plat = "",
         field_map_zone = 0,
         field_pid :: pid() | undefined,
         field_time = 0,
         reward = [] :: list(),
         status = 0,
         cross_id = 0,
         ref = undefined,
         match_time = 0,
         combat_time = 0,
         camp = 0,
         is_combat = 0,
         combat_mode = 0,
         is_rise = 0,
         pos = 0,
         is_lose = 0,
         lose_round = 0}).

-record(gold_league_group_data,
        {id = 0, name = "", order = 0, members = [], ids = []}).

-record(gold_league_drop_item_data,
        {base_id = 0,
         weight = 0,
         result = 0,
         is_notice = 0,
         num = 0}).

-record(gold_league_combat,
        {pid,
         field_id = 0,
         field_key,
         type = 1,
         ref,
         first_id = {0, "", 0},
         first_name = "",
         first_classes = 0,
         first_sex = 0,
         first_lev = 0,
         second_id = {0, "", 0},
         second_name = "",
         second_classes = 0,
         second_lev = 0,
         second_sex = 0,
         cross_id = 0,
         group_id = 0,
         ids = []}).

-record(gold_league_timer_data,
        {id = 0,
         phase = 0,
         type = 0,
         spec_id = 0,
         buff_id = 0,
         start = 0,
         interval = 0,
         finished = 0,
         num = 0,
         max = 0}).

-record(gold_league_combat_result,
        {field_pid, round = 0}).

-record(gold_league_combat_win,
        {field_pid,
         score = 0,
         round = 0,
         now_round = 0,
         max_round = 0,
         state_name = fight,
         is_lose = 0,
         id,
         name = "",
         time = 0,
         group_id = 0}).

-record(gold_league_combat_lose,
        {field_pid,
         score = 0,
         round = 0,
         now_round = 0,
         max_round = 0,
         state_name = fight,
         is_lose = 0,
         id,
         name = "",
         time = 0,
         group_id = 0}).

-record(gold_league_rank_reward_data,
        {group = 0,
         min = 0,
         max = 0,
         items = [],
         title = "",
         content = ""}).

-record(gold_league_16,
        {cross_id = 0,
         group_id = 0,
         key = {0, 0},
         members = []}).

-record(gold_league_guess,
        {id = 0, name = "", num = 0, amount = 0, members = []}).

-record(gold_league_guess_role,
        {id = 0, members = [], group_id = 0, cross_id = 0}).

-record(gold_league_combat_record,
        {id = 0,
         first_id = {0, "", 0},
         second_id = {0, "", 0}}).

-file("src/mod/gold_league/gold_league.erl", 66).

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

-file("src/mod/gold_league/gold_league.erl", 67).

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

-file("src/mod/gold_league/gold_league.erl", 68).

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

-file("src/mod/gold_league/gold_league.erl", 69).

-file("inc/looks.hrl", 1).

-file("src/mod/gold_league/gold_league.erl", 70).

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

-file("src/mod/gold_league/gold_league.erl", 71).

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

-file("src/mod/gold_league/gold_league.erl", 72).

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

-file("src/mod/gold_league/gold_league.erl", 73).

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

-file("src/mod/gold_league/gold_league.erl", 74).

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

-file("src/mod/gold_league/gold_league.erl", 75).

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

-file("src/mod/gold_league/gold_league.erl", 76).

-file("inc/lev_break.hrl", 1).

-record(m_lev_break,
        {ver = 0,
         trial = 0 :: non_neg_integer(),
         done = 0 :: non_neg_integer(),
         times = 0 :: non_neg_integer(),
         attr_point = 0 :: non_neg_integer()}).

-file("src/mod/gold_league/gold_league.erl", 77).

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

-file("src/mod/gold_league/gold_league.erl", 78).

-record(state,
        {id = 0,
         seq_id = 0,
         pid,
         group_id = 0,
         map_id = 0,
         map_pid,
         map_plat = "",
         map_zone = 0,
         start_time = 0,
         win_camp = 0,
         exit_npc,
         members = [],
         rank,
         event = self,
         ts,
         timeout,
         end_time = 0,
         match_time = 0,
         open_mode = 1,
         cross_id = 0,
         combat_mode = 1,
         combat_pid,
         now_round = 0,
         max_round = 0,
         num = 0,
         ids = []}).

m(#role{id = RoleId}) ->
    case ets:lookup(gold_leagues, RoleId) of
        [#gold_league{field_pid = FieldPid}] ->
            gen_fsm:send_event(FieldPid, timeout);
        _ -> ok
    end.

cast(Pid, Msg) ->
    gen_fsm:send_all_state_event(Pid, Msg).

call(Pid, Msg) ->
    case catch gen_fsm:sync_send_all_state_event(Pid, Msg)
        of
        {'EXIT', {timeout, _}} -> {error, timeout};
        {'EXIT', {noproc, _}} -> {error, noproc};
        {'EXIT', {normal, _}} -> {error, exit};
        {'EXIT', _Call_Err} -> {error, _Call_Err};
        _Call_Return -> _Call_Return
    end.

enter_field(Pid,
            #gold_league{pid = WarPid, field_id = Fid, camp = Camp})
    when is_pid(WarPid) ->
    cast(Pid, {enter, {WarPid, Fid, Camp}});
enter_field(_Pid, _GoldLeague) -> ok.

last_enter_field(Pid, GoldLeague) when is_pid(Pid) ->
    cast(Pid, {last_enter, GoldLeague});
last_enter_field(_Pid, _GoldLeague) -> ok.

apply_enter_field(Role = #role{s_event = 52, id = Rid,
                               name = _Name},
                  FieldPid, OpenMode, {MapPlat, MapZoneId, MapId}) ->
    EventRole = Role#role{s_event = 54,
                          s_event_pid = FieldPid},
    {CrossType, ToPos} = get_field_pos(OpenMode,
                                       {MapPlat,
                                        MapZoneId,
                                        MapId,
                                        53003,
                                        none}),
    case map:role_enter(ToPos,
                        EventRole#role{cross_type = CrossType})
        of
        {ok, NewRole} ->
            Now = date:unixtime(),
            cast(FieldPid, {enter, Rid, Now}),
            Msg = lang:get("开始自动匹配战斗"),
            notice:send(NewRole, 3, Msg),
            role_misc:push_cross(NewRole),
            logger:debug("[~ts]成功进入正式区", [_Name], gold_league, 228),
            {ok, role_trigger:fire(#evt_gold_league{}, NewRole)};
        _Err ->
            logger:error("[~ts]进入正式区失败:~w",
                         [_Name, _Err],
                         gold_league,
                         231),
            ok
    end;
apply_enter_field(Role = #role{s_event = 53,
                               name = _Name},
                  FieldPid, OpenMode, {MapPlat, MapZoneId, MapId}) ->
    EventRole = Role#role{s_event = 54,
                          s_event_pid = FieldPid},
    {CrossType, ToPos} = get_field_pos(OpenMode,
                                       {MapPlat,
                                        MapZoneId,
                                        MapId,
                                        53003,
                                        none}),
    case map:role_enter(ToPos,
                        EventRole#role{cross_type = CrossType})
        of
        {ok, NewRole} ->
            Msg = lang:get("成功返回准备厅地图"),
            notice:send(NewRole, 3, Msg),
            role_misc:push_cross(NewRole),
            {ok, NewRole};
        _Err ->
            logger:error("[~ts]进入正式区失败:~w",
                         [_Name, _Err],
                         gold_league,
                         247),
            ok
    end;
apply_enter_field(Role = #role{s_event = 54,
                               name = _Name},
                  FieldPid, OpenMode,
                  {MapPlat, MapZoneId, MapId, Side}) ->
    EventRole = Role#role{s_event = 53,
                          s_event_pid = FieldPid},
    {CrossType, ToPos} = get_field_pos(OpenMode,
                                       {MapPlat,
                                        MapZoneId,
                                        MapId,
                                        53004,
                                        Side}),
    case map:role_enter(ToPos,
                        EventRole#role{cross_type = CrossType})
        of
        {ok, NewRole} ->
            role_misc:push_cross(NewRole),
            {ok, NewRole};
        _Err ->
            logger:error("[~ts]进入正式区失败:~w",
                         [_Name, _Err],
                         gold_league,
                         263),
            ok
    end;
apply_enter_field(#role{name = _Name, s_event = Event},
                  _FieldPid, _OpenMode, _Pos) ->
    logger:error("[~ts]状态异常[Event:~w]，无法进入正式区",
                 [_Name, Event],
                 gold_league,
                 267),
    ok.

apply_last_enter_field(Role = #role{name = _Name},
                       GoldLeague = #gold_league{field_pid = FieldPid},
                       OpenMode, {MapPlat, MapZoneId, MapId}) ->
    case role_misc:check_event(Role, [2]) of
        {false, Reason} ->
            logger:debug("进入准备区地图~ts", [Reason], gold_league, 276),
            role:link_send(Role, 20001, {0, Reason, 0}),
            ok;
        true ->
            case role_fly:force_landing(Role) of
                {ok, DownRole} ->
                    {CrossType, ToPos} = get_field_pos(OpenMode,
                                                       {MapPlat,
                                                        MapZoneId,
                                                        MapId,
                                                        53002,
                                                        none}),
                    EventRole = DownRole#role{s_event = 54,
                                              s_event_pid = FieldPid},
                    case map:role_enter(ToPos,
                                        EventRole#role{cross_type = CrossType})
                        of
                        {ok, NewRole} ->
                            Now = date:unixtime(),
                            cast(FieldPid, {last_enter, GoldLeague, Now}),
                            logger:debug("[~ts]成功进入正式区",
                                         [_Name],
                                         gold_league,
                                         288),
                            role_misc:push_cross(NewRole),
                            case CrossType of
                                0 -> skip;
                                _ ->
                                    {ok, Ginfo} = role_convert:to(member,
                                                                  NewRole),
                                    cross:cast(role_group,
                                               join,
                                               [center_world, Ginfo])
                            end,
                            {ok,
                             role_trigger:fire(#evt_gold_league{}, NewRole)};
                        _Err ->
                            logger:error("[~ts]进入正式区失败:~w",
                                         [_Name, _Err],
                                         gold_league,
                                         298),
                            ok
                    end;
                _False ->
                    logger:debug("进入准备区地图失败[Err:~w]",
                                 [_False],
                                 gold_league,
                                 302),
                    ok
            end
    end;
apply_last_enter_field(#role{name = _Name,
                             s_event = Event},
                       _GoldLeague, _OpenMode, _Pos) ->
    logger:error("[~ts]状态异常[Event:~w]，无法进入正式区",
                 [_Name, Event],
                 gold_league,
                 307),
    ok.

push_role_num(#state{num = Num, members = Members,
                     group_id = GroupId}) ->
    [role:pack_send(RolePid, 20018, {GroupId, Num})
     || #gold_league_zone_role{pid = RolePid, is_out = IsOut}
            <- Members,
        IsOut =:= 0].

get_fight_rival_info(#role{id = RoleId, pid = Pid,
                           name = _Name}) ->
    case gold_league_mgr:find_role(RoleId) of
        {true, #gold_league{field_pid = FPid}}
            when is_pid(FPid) ->
            cast(FPid, {get_fight_rival_info, RoleId, Pid});
        _R ->
            logger:info("找不到玩家[~ts] 数据 ~w",
                        [_Name, _R],
                        gold_league,
                        319),
            ok
    end.

get_16_role(Role = #role{id = Rid, pid = Pid}) ->
    {CrossId1, GroupId1} = case catch
                                    ets:lookup(gold_leagues, Rid)
                               of
                               [#gold_league{cross_id = CrossId,
                                             group_id = GroupId}] ->
                                   {CrossId, GroupId};
                               _ ->
                                   logger:debug("没有参加比赛", [], gold_league, 328),
                                   gold_league_api:get_cross_group_id(Role)
                           end,
    logger:debug("==================== ~w",
                 [{CrossId1, GroupId1}],
                 gold_league,
                 331),
    Result = case CrossId1 of
                 0 -> get_16_data(Rid, Pid, CrossId1, GroupId1);
                 _ ->
                     cross:call(gold_league,
                                get_16_data,
                                [Rid, Pid, CrossId1, GroupId1])
             end,
    case Result of
        {ok, Data} ->
            Members1 = case ets:lookup(gold_league_guess_role, Rid)
                           of
                           [#gold_league_guess_role{members = Members}] ->
                               Members;
                           _ -> []
                       end,
            role:pack_send(Pid, 20011, {GroupId1, Data, Members1}),
            ok;
        _ -> ok
    end.

get_16_data(_RId, _RPid, CrossId, GroupId) ->
    MatchSpec = [{#gold_league_state{cross_id = '$1',
                                     _ = '_'},
                  [{'=:=', {const, CrossId}, '$1'}],
                  ['$_']}],
    NewGroupId = case ets:select(gold_league_state,
                                 MatchSpec)
                     of
                     List when is_list(List) ->
                         Fun = fun (#gold_league_state{ids = ElemIds,
                                                       group_id = GroupId1},
                                    Acc) ->
                                       logger:debug("================= ~w ~w",
                                                    [length(List), ElemIds],
                                                    gold_league,
                                                    358),
                                       case lists:member(GroupId, ElemIds) of
                                           true -> GroupId1;
                                           _ -> Acc
                                       end
                               end,
                         lists:foldl(Fun, 0, List);
                     _ -> []
                 end,
    logger:debug("跨服id ~w 角色所在分组 ~w 角色实际分组 ~w",
                 [CrossId, GroupId, NewGroupId],
                 gold_league,
                 368),
    case NewGroupId of
        0 -> ok;
        _ ->
            Match = #gold_league{id = '$1', name = '$2', sex = '$3',
                                 classes = '$4', lev = '$5', group_id = '$6',
                                 pos = '$7', is_lose = '$8', lose_round = '$9',
                                 cross_id = '$10', rank = '$11',
                                 is_combat = '$12', _ = '_'},
            RoleList = case catch ets:select(gold_league_16_role,
                                             [{Match,
                                               [{'andalso',
                                                 {'=:=', '$10', CrossId},
                                                 {'=:=', '$6', NewGroupId}}],
                                               ['$$']}])
                           of
                           L when is_list(L) -> L;
                           _R -> []
                       end,
            RoleList1 = [#gold_league{id = RoleId, name = Name,
                                      sex = Sex, classes = Classes, lev = Lev,
                                      group_id = GroupId1, pos = Pos,
                                      is_lose = IsLose, lose_round = LoseRound,
                                      cross_id = CrossId1, rank = Rank,
                                      is_combat = IsCombat}
                         || [RoleId,
                             Name,
                             Sex,
                             Classes,
                             Lev,
                             GroupId1,
                             Pos,
                             IsLose,
                             LoseRound,
                             CrossId1,
                             Rank,
                             IsCombat]
                                <- RoleList],
            {ok, RoleList1}
    end.

push_phase_to_members(#state{members = Members,
                             max_round = MaxRound, now_round = NowRound,
                             end_time = EndTime, ids = Ids},
                      StateName) ->
    Phase = gold_league_utils:phase_left_time(StateName),
    [role:pack_send(Pid,
                    20000,
                    {Phase, EndTime, NowRound, MaxRound, Ids})
     || #gold_league_zone_role{pid = Pid, status = 2}
            <- Members].

get_field_pos(2,
              {MapPlat, MapZoneId, MapId, MapBaseId, Pos}) ->
    {X, Y} = get_pos(MapBaseId, Pos),
    {1, {MapPlat, MapZoneId, MapId, X, Y}};
get_field_pos(_, {_, _, MapId, MapBaseId, Pos}) ->
    {X, Y} = get_pos(MapBaseId, Pos),
    {0, {MapId, X, Y}}.

get_pos(53002, _) ->
    util:rand_list([{2038, 1160},
                    {1560, 1230},
                    {1520, 1520},
                    {1440, 1800},
                    {2640, 1240},
                    {2760, 1520},
                    {2600, 1760}]);
get_pos(53003, _) ->
    util:rand_list([{880, 837},
                    {840, 2000},
                    {3240, 840},
                    {3240, 2000},
                    {1160, 1480},
                    {2920, 1480},
                    {2040, 960},
                    {2040, 1960}]);
get_pos(53004, left) -> {440, 1620};
get_pos(53004, right) -> {2930, 370};
get_pos(_, _) ->
    util:rand_list([{2038, 1160},
                    {1560, 1230},
                    {1520, 1520},
                    {1440, 1800},
                    {2640, 1240},
                    {2760, 1520},
                    {2600, 1760}]).

use_drug(Role = #role{id = RoleId}, Id)
    when Id =:= 96105 orelse Id =:= 96110 ->
    case gold_league_mgr:find_role(RoleId) of
        {true,
         #gold_league{field_pid = FieldPid,
                      combat_time = CombatTime}} ->
            {Key1, Max, Key2} = case Id of
                                    96105 -> {2098, 5, 614};
                                    _ -> {2099, 3, 615}
                                end,
            Times1 = var:get_var(Role, other, Key1, 0),
            Times2 = var:get_var(Role, day, Key2, 0),
            Now = date:unixtime(),
            case gold_league_data:get_drug({Id, Times2 + 1}) of
                _ when CombatTime < Now ->
                    {false, lang:get("当前不可使用药丸")};
                _ when Times1 >= Max -> {false, lang:get("没有可使用次数")};
                Cost when is_list(Cost) ->
                    Loss = format:val_to_loss(Cost),
                    case role_gain:do_notice(Loss, Role) of
                        {ok, LossRole} ->
                            case call(FieldPid, {use_drug, RoleId, Id}) of
                                ok ->
                                    VarRole1 = var:set_var(LossRole,
                                                           other,
                                                           Key1,
                                                           Times1 + 1),
                                    VarRole2 = var:set_var(VarRole1,
                                                           day,
                                                           Key2,
                                                           Times2 + 1),
                                    {ok, VarRole2};
                                {false, Msg} -> {false, Msg};
                                _ -> {false, lang:get("当前不可使用")}
                            end;
                        {false, #loss{msg = Msg}} -> {false, Msg}
                    end;
                _ -> {false, lang:get("没有该药丸")}
            end;
        _ -> {false, lang:get("当前不可使用")}
    end;
use_drug(_Role, _Id) -> {false, lang:get("没有该药丸")}.

guard_drug_skill(Role, CGuards) ->
    StrongUse = var:get_var(Role, other, 2098, 0),
    LockyUse = var:get_var(Role, other, 2099, 0),
    StrongGuard = case StrongUse > 0 of
                      true ->
                          StrongSkill = {case StrongUse of
                                             1 -> 96105;
                                             2 -> 96106;
                                             3 -> 96107;
                                             4 -> 96108;
                                             5 -> 96109;
                                             _ -> 96105
                                         end,
                                         1},
                          logger:debug("用药了====================== ~w",
                                       [StrongSkill],
                                       gold_league,
                                       458),
                          [CG#c_guard{skills = [StrongSkill | Skills]}
                           || CG = #c_guard{skills = Skills} <- CGuards];
                      _ -> CGuards
                  end,
    case LockyUse > 0 of
        true ->
            case util:rand_list_n(StrongGuard, LockyUse) of
                RandCGuards = [_ | _] ->
                    logger:debug("用药了======================",
                                 [],
                                 gold_league,
                                 466),
                    LuckySkill = {96110, 1},
                    LuckyGuards = [CG#c_guard{skills =
                                                  [LuckySkill | Skills]}
                                   || CG = #c_guard{skills = Skills}
                                          <- RandCGuards],
                    LeftGuard = StrongGuard -- RandCGuards,
                    LuckyGuards ++ LeftGuard;
                _ -> StrongGuard
            end;
        _ -> StrongGuard
    end.

combat_over(#combat{type = 114, winner = Winner,
                    loser = Loser, pid = Pid, round = Round,
                    start_time = StartTime,
                    start_args =
                        #combat_start_args{common_referee = Referee,
                                           ext_args = ExtArgs}})
    when is_pid(Referee) ->
    case Winner of
        [_ | _] ->
            WinnerLeader = get_fighter_leader(Winner),
            LoserLeader = get_fighter_leader(Loser),
            logger:debug("战斗开始时间 ~w 结束时间  ~w 战斗持续时间 ~w",
                         [StartTime,
                          date:unixtime(),
                          date:unixtime() - StartTime],
                         gold_league,
                         482),
            Record = combat_record:get_buffer(),
            WinRoleId1 = case WinnerLeader of
                             [#fighter{origin_id = WinRoleId} | _] ->
                                 [WinRoleId];
                             _ -> []
                         end,
            LoserRoleId1 = case LoserLeader of
                               [#fighter{origin_id = LoserRoleId} | _] ->
                                   [LoserRoleId];
                               _ -> []
                           end,
            IsMarvel = case Round >= 6 of
                           true -> true;
                           _ -> false
                       end,
            logger:debug("=====================",
                         [],
                         gold_league,
                         496),
            {P, Z} = case WinRoleId1 of
                         [{_, WP, WZ}] -> {WP, WZ};
                         _ ->
                             case LoserRoleId1 of
                                 [{_, LP, LZ}] -> {LP, LZ};
                                 _ -> {env:get(platform), env:get(zone_id)}
                             end
                     end,
            logger:debug("=====================",
                         [],
                         gold_league,
                         505),
            OpenMode1 = case lists:keyfind(open_mode, 1, ExtArgs) of
                            {_, 2} -> cross;
                            _ -> local
                        end,
            StateName1 = case lists:keyfind(state_name, 1, ExtArgs)
                             of
                             {_, StateName} -> StateName;
                             _ -> fight
                         end,
            logger:debug("=====================",
                         [],
                         gold_league,
                         518),
            case {OpenMode1, StateName1} of
                {cross, fight_out} ->
                    cross:cast(P,
                               Z,
                               combat_record,
                               save,
                               [#{combat_type => 114,
                                  ids => WinRoleId1 ++ LoserRoleId1,
                                  record => Record, is_marvel => IsMarvel,
                                  cross => true, args => ExtArgs}]);
                {_, fight_out} ->
                    combat_record:save(#{combat_type => 114,
                                         ids => WinRoleId1 ++ LoserRoleId1,
                                         record => Record,
                                         is_marvel => IsMarvel,
                                         args => ExtArgs});
                _ -> ok
            end,
            Args = [{round, Round + 1},
                    {ext_args, ExtArgs},
                    {time, date:unixtime() - StartTime}],
            logger:debug("=====================",
                         [],
                         gold_league,
                         528),
            cast(Referee,
                 {combat_over, WinnerLeader, LoserLeader, Pid, Args});
        _False -> ok
    end;
combat_over(_Combat) -> ok.

apply_exit(Role = #role{id = Rid}, WinOrLose) ->
    case exit_field(Role) of
        {ok, ExitRole} ->
            case gold_league_mgr:find_role(Rid) of
                {true, #gold_league{field_pid = FPid}}
                    when is_pid(FPid) ->
                    logger:debug("退出战场 ~w", [WinOrLose], gold_league, 541),
                    case WinOrLose of
                        die -> cast(FPid, {exit, die, Rid});
                        _ -> ignore
                    end;
                _ -> ok
            end,
            {ok, ExitRole};
        _False -> ok
    end.

apply_win(Role = #role{name = Name, id = RoleId},
          #gold_league_combat_win{name = LoseName, score = Score,
                                  round = Round, max_round = MaxRound,
                                  now_round = NowRound, time = Time}) ->
    {VictyFmt, VictyArgs} = case Round >= 12 of
                                false ->
                                    case Time >= 4 * 60 of
                                        true ->
                                            {lang:get("战斗已达到时间限制，系统判定~ts获胜"),
                                             [{role_2, Name}]};
                                        _ ->
                                            {lang:get("战斗获胜，你击败了~ts"),
                                             [{role_2, LoseName}]}
                                    end;
                                true ->
                                    {lang:get("战斗已达到最大回合数，系统判定~ts获胜"),
                                     [{role_2, Name}]}
                            end,
    VictyMsg = notice:format(VictyFmt, VictyArgs),
    notice:send(Role, 3, VictyMsg),
    NewRole =
        role_trigger:fire(#evt_gold_league_fight{win_flag = 1},
                          Role),
    Msg = notice:format(lang:get("恭喜获胜赢得~ts积分"),
                        [{string_2, 5, Score}]),
    {Reward, Num} = gold_league_api:get_reward(Role,
                                               fight,
                                               1,
                                               NowRound,
                                               MaxRound,
                                               0),
    gold_league_api:update_reward(RoleId, Num),
    logger:debug("胜利奖励==============~w",
                 [Reward],
                 gold_league,
                 574),
    role:pack_send(Role, 20006, {1, Score, Msg, Reward}),
    DrugRole = gold_league_api:clean_drug(NewRole),
    mail:send(Role,
              lang:get("钻石联赛结算奖励"),
              lang:get("恭喜您在钻石联赛资格赛获胜，请查收奖励"),
              Reward),
    {ok, DrugRole};
apply_win(Role, _Result) ->
    NewRole = gold_league_api:clean_drug(Role),
    {ok, NewRole}.

apply_lose(Role = #role{id = RoleId},
           #gold_league_combat_lose{name = Name, score = Score,
                                    round = Round, now_round = NowRound,
                                    max_round = MaxRound, time = Time}) ->
    {VictyFmt, VictyArgs} = case Round >= 12 of
                                false ->
                                    case Time >= 4 * 60 of
                                        true ->
                                            {lang:get("战斗已达到时间限制，系统判定~ts获胜"),
                                             [{role_2, Name}]};
                                        _ ->
                                            {lang:get("战斗失败，你被~ts击败了"),
                                             [{role_2, Name}]}
                                    end;
                                true ->
                                    {lang:get("战斗已达到最大回合数，系统判定~ts获胜"),
                                     [{role_2, Name}]}
                            end,
    VictyMsg = notice:format(VictyFmt, VictyArgs),
    notice:send(Role, 3, VictyMsg),
    NewRole =
        role_trigger:fire(#evt_gold_league_fight{win_flag = 0},
                          Role),
    Msg = notice:format(lang:get("遗憾战败获得~ts积分"),
                        [{string_2, 5, Score}]),
    {Reward, Num} = gold_league_api:get_reward(Role,
                                               fight,
                                               0,
                                               NowRound,
                                               MaxRound,
                                               0),
    gold_league_api:update_reward(RoleId, Num),
    role:pack_send(Role, 20006, {0, Score, Msg, Reward}),
    DrugRole = gold_league_api:clean_drug(NewRole),
    mail:send(Role,
              lang:get("钻石联赛结算奖励"),
              lang:get("很遗憾您在钻石联赛资格赛战败，请查收奖励"),
              Reward),
    {ok, DrugRole};
apply_lose(Role, _Result) ->
    DrugRole = gold_league_api:clean_drug(Role),
    {ok, DrugRole}.

apply_out_win(Role = #role{id = RoleId, name = _Name},
              #gold_league_combat_win{round = 0, now_round = NowRound,
                                      max_round = MaxRound, is_lose = IsLose,
                                      name = Name, group_id = GroupId}) ->
    push_guild_msg(Role,
                   Name,
                   GroupId,
                   NowRound,
                   MaxRound,
                   IsLose),
    {Reward, Num} = gold_league_api:get_reward(Role,
                                               fight_out,
                                               1,
                                               NowRound,
                                               MaxRound,
                                               IsLose),
    gold_league_api:update_reward(RoleId, Num),
    Fmt = get_mail_msg(MaxRound - NowRound, 3, IsLose),
    Msg = notice:format(Fmt, [{string_2, 5, Name}]),
    logger:info("自动获胜发送奖励 ~w", [_Name], gold_league, 614),
    mail:send(Role, lang:get("钻石联赛结算奖励"), Msg, Reward),
    NewRole =
        role_trigger:fire(#evt_gold_league_fight{win_flag = 1},
                          Role),
    {ok, NewRole};
apply_out_win(Role = #role{id = RoleId, name = Name},
              #gold_league_combat_win{name = LoseName, round = Round,
                                      now_round = NowRound,
                                      max_round = MaxRound, is_lose = IsLose,
                                      time = Time, group_id = GroupId}) ->
    push_guild_msg(Role,
                   LoseName,
                   GroupId,
                   NowRound,
                   MaxRound,
                   IsLose),
    {VictyFmt, VictyArgs} = case Round >= 12 of
                                false ->
                                    case Time >= 7 * 60 of
                                        true ->
                                            {lang:get("战斗已达到时间限制，系统判定~ts获胜"),
                                             [{role_2, Name}]};
                                        _ ->
                                            {lang:get("战斗获胜，你击败了~ts"),
                                             [{role_2, LoseName}]}
                                    end;
                                true ->
                                    {lang:get("战斗已达到最大回合数，系统判定~ts获胜"),
                                     [{role_2, Name}]}
                            end,
    VictyMsg = notice:format(VictyFmt, VictyArgs),
    notice:send(Role, 3, VictyMsg),
    {Reward, Num} = gold_league_api:get_reward(Role,
                                               fight_out,
                                               1,
                                               NowRound,
                                               MaxRound,
                                               IsLose),
    gold_league_api:update_reward(RoleId, Num),
    logger:debug("胜利奖励==============~w",
                 [Reward],
                 gold_league,
                 634),
    Msg = get_msg(MaxRound - NowRound, 1, IsLose),
    logger:debug("胜利提示语============== ~ts",
                 [Msg],
                 gold_league,
                 636),
    role:pack_send(Role, 20006, {1, 0, Msg, Reward}),
    DrugRole = gold_league_api:clean_drug(Role),
    mail:send(Role,
              lang:get("钻石联赛结算奖励"),
              get_mail_msg(MaxRound - NowRound, 1, IsLose),
              Reward),
    NewRole =
        role_trigger:fire(#evt_gold_league_fight{win_flag = 1},
                          DrugRole),
    {ok, NewRole};
apply_out_win(Role, _) ->
    DrugRole = gold_league_api:clean_drug(Role),
    {ok, DrugRole}.

apply_out_lose(Role = #role{id = RoleId},
               #gold_league_combat_lose{name = WinName, round = Round,
                                        now_round = NowRound,
                                        max_round = MaxRound, is_lose = IsLose,
                                        time = Time}) ->
    {VictyFmt, VictyArgs} = case Round >= 12 of
                                false ->
                                    case Time >= 7 * 60 of
                                        true ->
                                            {lang:get("战斗已达到时间限制，系统判定~ts获胜"),
                                             [{role_2, WinName}]};
                                        _ ->
                                            {lang:get("战斗失败，你被~ts击败了"),
                                             [{role_2, WinName}]}
                                    end;
                                true ->
                                    {lang:get("战斗已达到最大回合数，系统判定~ts获胜"),
                                     [{role_2, WinName}]}
                            end,
    VictyMsg = notice:format(VictyFmt, VictyArgs),
    notice:send(Role, 3, VictyMsg),
    {Reward, Num} = gold_league_api:get_reward(Role,
                                               fight_out,
                                               0,
                                               NowRound,
                                               MaxRound,
                                               IsLose),
    gold_league_api:update_reward(RoleId, Num),
    Msg = get_msg(MaxRound - NowRound, 0, IsLose),
    logger:debug("失败提示语============== ~ts",
                 [Msg],
                 gold_league,
                 661),
    role:pack_send(Role, 20006, {0, 0, Msg, Reward}),
    DrugRole = gold_league_api:clean_drug(Role),
    mail:send(Role,
              lang:get("钻石联赛结算奖励"),
              get_mail_msg(MaxRound - NowRound, 0, IsLose),
              Reward),
    NewRole =
        role_trigger:fire(#evt_gold_league_fight{win_flag = 0},
                          DrugRole),
    {ok, NewRole};
apply_out_lose(Role, _) ->
    DrugRole = gold_league_api:clean_drug(Role),
    {ok, DrugRole}.

get_msg(0, 1, 0) -> lang:get("恭喜获得冠军");
get_msg(0, 0, 0) -> lang:get("遗憾战败获得亚军");
get_msg(0, 1, 1) -> lang:get("恭喜获得季军");
get_msg(0, 0, 1) -> lang:get("遗憾战败获得第四名");
get_msg(1, 1, _) -> lang:get("恭喜获胜晋级冠军赛");
get_msg(1, 0, _) -> lang:get("遗憾战败晋级季军赛");
get_msg(2, 1, _) -> lang:get("恭喜获胜晋级4强");
get_msg(2, 0, _) -> lang:get("遗憾战败止步8强");
get_msg(3, 1, _) -> lang:get("恭喜获胜晋级8强");
get_msg(3, 0, _) -> lang:get("遗憾战败止步16强");
get_msg(4, 1, _) -> lang:get("恭喜获胜晋级16强");
get_msg(4, 0, _) -> lang:get("遗憾战败止步32强");
get_msg(5, 1, _) -> lang:get("恭喜获胜晋级32强");
get_msg(5, 0, _) -> lang:get("遗憾战败止步64强");
get_msg(6, 1, _) -> lang:get("恭喜获胜晋级64强");
get_msg(_, _, _) -> lang:get("遗憾战败止步128强").

get_mail_msg(0, 1, 0) -> lang:get("恭喜您在钻石联赛决赛获胜，请查收奖励");
get_mail_msg(0, 0, 0) ->
    lang:get("很遗憾您在钻石联赛决赛战败，请查收奖励");
get_mail_msg(0, 3, 0) ->
    lang:get("由于对手~ts退出比赛、本轮轮空，恭喜您获得决赛胜利，请查收奖励");
get_mail_msg(0, 1, 1) ->
    lang:get("恭喜您在钻石联赛季军赛获胜，请查收奖励");
get_mail_msg(0, 0, 1) ->
    lang:get("很遗憾您在钻石联赛季军赛战败，请查收奖励");
get_mail_msg(0, 3, 1) ->
    lang:get("由于对手~ts退出比赛、本轮轮空，恭喜您获得季军赛胜利，请查收奖励");
get_mail_msg(1, 1, _) ->
    lang:get("恭喜您在钻石联赛淘汰赛半决赛获胜，请查收奖励");
get_mail_msg(1, 0, _) ->
    lang:get("很遗憾您在钻石联赛淘汰赛半决赛战败，请查收奖励");
get_mail_msg(1, 3, _) ->
    lang:get("由于对手~ts退出比赛、本轮轮空，恭喜您获得半决赛胜利，请查收奖励");
get_mail_msg(2, 1, _) ->
    lang:get("恭喜您在钻石联赛淘汰赛8进4获胜，请查收奖励");
get_mail_msg(2, 0, _) ->
    lang:get("很遗憾您在钻石联赛淘汰赛8进4战败，请查收奖励");
get_mail_msg(2, 3, _) ->
    lang:get("由于对手~ts退出比赛、本轮轮空，恭喜您获得8进4胜利，请查收奖励");
get_mail_msg(3, 1, _) ->
    lang:get("恭喜您在钻石联赛淘汰赛16进8获胜，请查收奖励");
get_mail_msg(3, 0, _) ->
    lang:get("很遗憾您在钻石联赛淘汰赛16进8战败，请查收奖励");
get_mail_msg(3, 3, _) ->
    lang:get("由于对手~ts退出比赛、本轮轮空，恭喜您获得16进8胜利，请查收奖励");
get_mail_msg(_, 1, _) ->
    lang:get("恭喜您在钻石联赛淘汰赛预选赛获胜，请查收奖励");
get_mail_msg(_, 0, _) ->
    lang:get("很遗憾您在钻石联赛淘汰赛预选赛战败，请查收奖励");
get_mail_msg(_, _, _) ->
    lang:get("由于对手~ts退出比赛、本轮轮空，恭喜您获得淘汰赛预选赛胜利，请查收奖励").

push_guild_msg(#role{m_guild = MGuild, name = WinName},
               LoseName, GroupId, NowRound, MaxRound, _IsLose)
    when MaxRound - NowRound =:= 4 ->
    Msg1 =
        notice:format(lang:get("恭喜~ts击败强敌~ts晋级~ts~ts16强，大家快去助威吧{face_1,7}"),
                      [{string_2, 5, WinName},
                       {string_2, 5, LoseName},
                       {string_2, 5, lang:get("钻石联赛")},
                       {string_1, gold_league_data:group_name(GroupId)}]),
    Msg2 =
        notice:format(lang:get("~ts骁勇善战，击败~ts后成功晋级~ts~ts16强，可喜可贺{face_1,18}"),
                      [{string_2, 5, WinName},
                       {string_2, 5, LoseName},
                       {string_2, 5, lang:get("钻石联赛")},
                       {string_1, gold_league_data:group_name(GroupId)}]),
    guild:notice(MGuild, util:rand_list([Msg1, Msg2]));
push_guild_msg(#role{m_guild = MGuild, name = WinName},
               LoseName, GroupId, NowRound, MaxRound, _IsLose)
    when MaxRound - NowRound =:= 3 ->
    Msg1 =
        notice:format(lang:get("恭喜~ts击败强敌~ts晋级~ts~ts8强，大家快去助威吧{face_1,7}"),
                      [{string_2, 5, WinName},
                       {string_2, 5, LoseName},
                       {string_2, 5, lang:get("钻石联赛")},
                       {string_1, gold_league_data:group_name(GroupId)}]),
    Msg2 =
        notice:format(lang:get("~ts骁勇善战，击败~ts后成功晋级~ts~ts8强，可喜可贺{face_1,18}"),
                      [{string_2, 5, WinName},
                       {string_2, 5, LoseName},
                       {string_2, 5, lang:get("钻石联赛")},
                       {string_1, gold_league_data:group_name(GroupId)}]),
    guild:notice(MGuild, util:rand_list([Msg1, Msg2]));
push_guild_msg(#role{m_guild = MGuild, name = WinName},
               LoseName, GroupId, NowRound, MaxRound, _IsLose)
    when MaxRound - NowRound =:= 2 ->
    Msg1 =
        notice:format(lang:get("恭喜~ts击败强敌~ts晋级~ts~ts4强，大家快去助威吧{face_1,7}"),
                      [{string_2, 5, WinName},
                       {string_2, 5, LoseName},
                       {string_2, 5, lang:get("钻石联赛")},
                       {string_1, gold_league_data:group_name(GroupId)}]),
    Msg2 =
        notice:format(lang:get("~ts骁勇善战，击败~ts后成功晋级~ts~ts4强，可喜可贺{face_1,18}"),
                      [{string_2, 5, WinName},
                       {string_2, 5, LoseName},
                       {string_2, 5, lang:get("钻石联赛")},
                       {string_1, gold_league_data:group_name(GroupId)}]),
    guild:notice(MGuild, util:rand_list([Msg1, Msg2]));
push_guild_msg(#role{m_guild = MGuild, name = WinName},
               LoseName, GroupId, NowRound, MaxRound, _IsLose)
    when MaxRound - NowRound =:= 1 ->
    Msg1 =
        notice:format(lang:get("恭喜~ts击败强敌~ts晋级~ts~ts决赛，大家快去助威吧{face_1,7}"),
                      [{string_2, 5, WinName},
                       {string_2, 5, LoseName},
                       {string_2, 5, lang:get("钻石联赛")},
                       {string_1, gold_league_data:group_name(GroupId)}]),
    Msg2 =
        notice:format(lang:get("~ts骁勇善战，击败~ts后成功晋级~ts~ts决赛，可喜可贺{face_1,18}"),
                      [{string_2, 5, WinName},
                       {string_2, 5, LoseName},
                       {string_2, 5, lang:get("钻石联赛")},
                       {string_1, gold_league_data:group_name(GroupId)}]),
    guild:notice(MGuild, util:rand_list([Msg1, Msg2]));
push_guild_msg(_, _, _, _, _, _) -> ok.

exit_field(Role = #role{s_event = Event, hp_max = HpMax,
                        mp_max = MpMax})
    when Event =:= 54 orelse Event =:= 53 ->
    EventRole = Role#role{s_event = 0,
                          s_event_pid = undefined, s_action = 0, hp = HpMax,
                          mp = MpMax},
    case gold_league_mgr:exit_map(EventRole) of
        {ok, NewRole} ->
            map:role_update(NewRole),
            {ok, NewRole};
        _Err -> ok
    end;
exit_field(_Role) -> ok.

exit_gold_league_field(Role = #role{id = Rid}) ->
    case exit_field(Role) of
        {ok, ExitRole} ->
            case gold_league_mgr:find_role(Rid) of
                {true, #gold_league{field_pid = FPid}}
                    when is_pid(FPid) ->
                    cast(FPid, {exit, leave, Rid});
                _ -> ok
            end,
            {ok, ExitRole};
        _ -> {false, lang:get("无法退出战场")}
    end.

out_exit_gold_league_field(Role = #role{id = Rid}) ->
    EventRole = Role#role{s_event = 0,
                          s_event_pid = undefined, s_action = 0},
    case gold_league_mgr:exit_map(EventRole) of
        {ok, NewRole} ->
            case gold_league_mgr:find_role(Rid) of
                {true, #gold_league{field_pid = FPid}}
                    when is_pid(FPid) ->
                    cast(FPid, {exit, leave, Rid});
                _ -> ok
            end,
            map:role_update(NewRole),
            {ok, NewRole};
        _Err -> ok
    end.

logout_field(#gold_league{field_pid = FPid},
             Role = #role{id = Rid}) ->
    case is_pid(FPid) of
        true -> cast(FPid, {exit, logout, Rid});
        false -> ok
    end,
    {ok, Role#role{s_event_pid = undefined}}.

get_field_info(#gold_league{field_pid = FPid},
               #role{pid = Pid})
    when is_pid(FPid) ->
    cast(FPid, {get_field_info, Pid}),
    ok;
get_field_info(_GoldLeague, _Role) -> ok.

get_field_role_num(#role{id = Rid, pid = RPid,
                         s_event = Event})
    when Event =:= 53 orelse
             Event =:= 55 orelse Event =:= 54 ->
    logger:debug("============获取战场剩余人数==================",
                 [],
                 gold_league,
                 791),
    case gold_league_mgr:find_role(Rid) of
        {true, #gold_league{field_pid = FPid}}
            when is_pid(FPid) ->
            cast(FPid, {get_field_role_num, RPid});
        _ -> ok
    end;
get_field_role_num(_) -> ok.

guess(Role = #role{id = RoleId = {_, _P, _Z}}, ToRoleId,
      Grade) ->
    case gold_league_data:get_guess(Grade) of
        #{gold := Amount, type := CostType} ->
            Loss = case CostType of
                       90026 ->
                           [#loss{label = star_gold_or_gold, val = Amount,
                                  msg = lang:get("红钻不足, 无法操作")}];
                       _ -> format:val_to_loss([{CostType, Amount}])
                   end,
            logger:debug("消耗 ~w",
                         [{Grade, Amount, CostType, Loss}],
                         gold_league,
                         810),
            case role_gain:do(Loss, Role) of
                {ok, NewRole} ->
                    Members = case ets:lookup(gold_league_guess_role,
                                              RoleId)
                                  of
                                  [#gold_league_guess_role{members =
                                                               Members0}] ->
                                      Members0;
                                  _ -> []
                              end,
                    case lists:member(ToRoleId, Members) of
                        false ->
                            CrossId = gold_league_api:get_cross_id(),
                            GroupId = gold_league_api:get_group_id(Role),
                            Result = case CrossId of
                                         0 ->
                                             do_guess(RoleId,
                                                      ToRoleId,
                                                      Grade,
                                                      Amount,
                                                      Members);
                                         _ ->
                                             cross:call(gold_league,
                                                        do_guess,
                                                        [RoleId,
                                                         ToRoleId,
                                                         Grade,
                                                         Amount,
                                                         Members])
                                     end,
                            case Result of
                                ok ->
                                    Msg = notice:format(lang:get("下注成功，消耗~ts"),
                                                        [{assets_1,
                                                          CostType,
                                                          Amount}]),
                                    ets:insert(gold_league_guess_role,
                                               #gold_league_guess_role{id =
                                                                           RoleId,
                                                                       members =
                                                                           [ToRoleId
                                                                            | Members],
                                                                       cross_id
                                                                           =
                                                                           CrossId,
                                                                       group_id
                                                                           =
                                                                           GroupId}),
                                    {ok, NewRole, Msg};
                                {false, Msg} -> {false, Msg};
                                _R ->
                                    logger:error("玩家下注出错了 ~w",
                                                 [_R],
                                                 gold_league,
                                                 835),
                                    {false, lang:get("系统繁忙")}
                            end;
                        _ -> {false, lang:get("已下注，不能修改哦{face_1,2}")}
                    end;
                {false, #loss{msg = Msg}} -> {false, Msg}
            end;
        _ -> {false, lang:get("数据错误")}
    end.

do_guess(RoleId, ToRoleId, Grade, Amount, MyMembers) ->
    case gold_league_mgr:find_role(ToRoleId) of
        {true, #gold_league{field_pid = FieldPid}}
            when is_pid(FieldPid) ->
            call(FieldPid,
                 {guess, RoleId, ToRoleId, Grade, Amount, MyMembers});
        _ -> {false, lang:get("找不到该玩家")}
    end.

print_info(Role) ->
    case gold_league_api:get_info(Role) of
        {ok, #gold_league{field_pid = Pid}} ->
            cast(Pid, print_info);
        _ -> logger:info("没有该玩家参赛信息", [], gold_league, 863)
    end,
    ok.

print_self_info(Role = #role{id = RoleId}) ->
    case gold_league_api:get_info(Role) of
        {ok, #gold_league{field_pid = Pid}} ->
            cast(Pid, {print_self_info, RoleId});
        _ -> logger:info("没有该玩家参赛信息", [], gold_league, 872)
    end,
    ok.

start_link(Fid, SeqId, GroupId, Len, OpenMode, CrossId,
           CombatMode, Ids) ->
    gen_fsm:start_link(gold_league,
                       [Fid,
                        SeqId,
                        GroupId,
                        Len,
                        OpenMode,
                        CrossId,
                        CombatMode,
                        Ids],
                       []).

init([Fid,
      SeqId,
      GroupId,
      Len,
      OpenMode,
      CrossId,
      CombatMode,
      Ids]) ->
    case map_mgr:create(53003) of
        {ok, MapPid, MapId} ->
            case create_npc(MapId) of
                {ok, BattleId} ->
                    State = init(Fid,
                                 SeqId,
                                 GroupId,
                                 Len,
                                 MapPid,
                                 MapId,
                                 BattleId,
                                 CrossId,
                                 CombatMode,
                                 Ids),
                    MatchRef = erlang:send_after(13 * 1000, self(), match),
                    put(match_ref, MatchRef),
                    StopRef = erlang:send_after((60 * 14 - 1 - 30) * 1000,
                                                self(),
                                                stop_combat),
                    put(stop_ref, StopRef),
                    RankRef = erlang:send_after(20 * 1000, self(), rank),
                    put(rank_ref, RankRef),
                    {ok,
                     fight,
                     State#state{match_time = date:unixtime() + 13,
                                 open_mode = OpenMode, cross_id = CrossId,
                                 combat_mode = CombatMode, ids = Ids}};
                _ -> {stop, abnormal, #state{}}
            end;
        _False ->
            logger:error("创建战场地图失败[Fid:~w][GroupId:~w][Err:~w]",
                         [Fid, GroupId, _False],
                         gold_league,
                         901),
            {stop, abnormal, #state{}}
    end.

init(Fid, SeqId, GroupId, Len, MapPid, MapId, BattleId,
     CrossId, _CombatMode, Ids) ->
    GroupName = gold_league_data:group_name(GroupId),
    logger:info("开启钻石联赛战场[~w][~ts]第[~w]战区， 战场编号：~w， 指派人数：~w",
                [CrossId, GroupName, SeqId, Fid, Len],
                gold_league,
                907),
    Self = self(),
    Plat = env:get(platform),
    ZoneId = env:get(zone_id),
    Field = #gold_league_field{id = Fid, pid = Self,
                               seq_id = SeqId, group_id = GroupId,
                               map_id = MapId, map_pid = MapPid,
                               map_plat = Plat, map_zone = ZoneId,
                               cross_id = CrossId, key = {CrossId, Fid}},
    Rank = gold_league_rank:init(),
    gold_league_mgr:update_field(Field),
    gold_league_mgr:update_state(#gold_league_state{ids =
                                                        Ids,
                                                    key = {CrossId, GroupId},
                                                    cross_id = CrossId,
                                                    group_id = GroupId,
                                                    state_name = fight,
                                                    end_time =
                                                        date:unixtime() +
                                                            60 * 14
                                                            - 1,
                                                    phase =
                                                        gold_league_mgr:phase_enum(fight)}),
    State = #state{id = Fid, group_id = GroupId,
                   map_id = MapId, seq_id = SeqId, map_pid = MapPid,
                   start_time = erlang:now(), pid = Self,
                   ts = erlang:now(), rank = Rank, exit_npc = BattleId,
                   end_time = date:unixtime() + 60 * 14 - 1,
                   timeout = 60 * 14 - 1},
    State.

create_npc(MapId) ->
    case unit_mgr:fetch_ids(1) of
        {ok, [Id]} ->
            BattleId = {52, Id},
            Pos = {MapId, 2040, 1200},
            case unit_mgr:create(BattleId, 79548, Pos) of
                {ok, _} -> {ok, BattleId};
                _ -> false
            end;
        _ -> false
    end.

create_1v1_block(MapId) ->
    case unit_mgr:fetch_ids(2) of
        {ok, [Id5, Id6]} ->
            BattleId5 = {52, Id5},
            BattleId6 = {52, Id6},
            Pos5 = {MapId, 667, 1534},
            Pos6 = {MapId, 2727, 510},
            unit_mgr:create(BattleId5, 79581, Pos5),
            unit_mgr:create(BattleId6, 79581, Pos6),
            {ok, [BattleId5, BattleId6]};
        _ -> false
    end.

create_1v1_effects(MapId) ->
    case unit_mgr:fetch_ids(4) of
        {ok, [Id1, Id2, Id3, Id4]} ->
            BattleId1 = {52, Id1},
            BattleId2 = {52, Id2},
            BattleId3 = {52, Id3},
            BattleId4 = {52, Id4},
            Pos1 = {MapId, 880, 1470},
            Pos2 = {MapId, 1280, 1160},
            Pos3 = {MapId, 2640, 580},
            Pos4 = {MapId, 2160, 740},
            unit_mgr:create(BattleId1, 79546, Pos1),
            unit_mgr:create(BattleId2, 79546, Pos2),
            unit_mgr:create(BattleId3, 79547, Pos3),
            unit_mgr:create(BattleId4, 79547, Pos4),
            {ok, [BattleId1, BattleId2, BattleId3, BattleId4]};
        _ -> false
    end.

async_apply(Ids, F, A) ->
    async_apply(Ids, gold_league, F, A).

async_apply([], _M, _F, _A) -> ok;
async_apply([#gold_league_zone_role{id = Wid} | Rest],
            M, F, A) ->
    case gold_league_mgr:find_role(Wid) of
        {true, GoldLeague} ->
            send_async_apply(M, F, A, GoldLeague),
            async_apply(Rest, M, F, A);
        _False -> async_apply(Rest, M, F, A)
    end;
async_apply([Wid | Rest], M, F, A) ->
    case gold_league_mgr:find_role(Wid) of
        {true, GoldLeague} ->
            send_async_apply(M, F, A, GoldLeague),
            async_apply(Rest, M, F, A);
        _False -> async_apply(Rest, M, F, A)
    end.

request_start_combat(Role = #role{id = RoleId,
                                  s_event = 53}) ->
    Now = date:unixtime(),
    case gold_league_api:get_info(Role) of
        {ok,
         #gold_league{field_pid = Pid, combat_time = CombatTime}}
            when CombatTime - Now =< 15 ->
            cast(Pid, {request_start_combat, RoleId});
        _ -> {false, lang:get("当前状态不能发起战斗")}
    end;
request_start_combat(_Role) ->
    {false, lang:get("当前状态不能发起战斗")}.

reply_start_combat(Role = #role{id = RoleId,
                                s_event = 53},
                   Flag) ->
    case gold_league_api:get_info(Role) of
        {ok, #gold_league{field_pid = Pid}} ->
            cast(Pid, {reply_start_combat, RoleId, Flag});
        _ -> {false, lang:get("当前状态不能发起战斗")}
    end;
reply_start_combat(_Role, _Flag) ->
    {false, lang:get("当前状态不能回应")}.

handle_event({enter, {Pid, _Fid, _Camp}}, fight,
             State = #state{open_mode = OpenMode, map_id = MapId,
                            map_plat = MapPlat, map_zone = MapZoneId}) ->
    Self = self(),
    role:apply(async,
               Pid,
               {gold_league,
                apply_enter_field,
                [Self, OpenMode, {MapPlat, MapZoneId, MapId}]}),
    continue(fight, State);
handle_event({enter, Rid, Time}, fight,
             State = #state{start_time = _Ts,
                            open_mode = OpenMode}) ->
    case gold_league_mgr:find_role(Rid) of
        {true, GoldLeague = #gold_league{pid = _Pid}} ->
            NewGoldLeague = GoldLeague#gold_league{field_time =
                                                       Time,
                                                   status = 2},
            gold_league_mgr:update_role(NewGoldLeague, OpenMode),
            NewState = add_members(State, NewGoldLeague),
            push_gold_league_info(NewGoldLeague),
            continue(fight, NewState);
        _False -> continue(fight, State)
    end;
handle_event({last_enter,
              GoldLeague = #gold_league{pid = Pid, id = Rid}},
             fight,
             State = #state{map_id = MapId, map_plat = MapPlat,
                            map_zone = MapZoneId, open_mode = OpenMode}) ->
    case gold_league_mgr:find_role(Rid) of
        {true, #gold_league{}} ->
            Data = {0, lang:get("你已经退出，不能再进入了"), 0},
            role:pack_send(Pid, 20001, Data);
        _ ->
            role:apply(async,
                       Pid,
                       {gold_league,
                        apply_last_enter_field,
                        [GoldLeague, OpenMode, {MapPlat, MapZoneId, MapId}]})
    end,
    continue(fight, State);
handle_event({last_enter,
              GoldLeague = #gold_league{pid = _Pid},
              Time},
             fight, State = #state{open_mode = OpenMode}) ->
    NewGoldLeague = GoldLeague#gold_league{field_time =
                                               Time,
                                           status = 2},
    gold_league_mgr:update_role(NewGoldLeague, OpenMode),
    NewState = add_members(State, NewGoldLeague),
    push_gold_league_info(NewGoldLeague),
    continue(fight, NewState);
handle_event({auto_win,
              #gold_league_zone_role{id = RoleId, name = Name,
                                     is_lose = IsLose}},
             fight_out,
             State = #state{now_round = NowRound,
                            max_round = MaxRound, group_id = GroupId}) ->
    logger:info("淘汰赛阶段 找不到对手  玩家 [~ts] 自动获胜 ",
                [Name],
                gold_league,
                1052),
    case gold_league_mgr:find_role(RoleId) of
        {true, GoldLeague} ->
            role:apply(async,
                       RoleId,
                       {gold_league,
                        apply_out_win,
                        [#gold_league_combat_win{state_name = fight_out,
                                                 round = 0,
                                                 now_round = NowRound,
                                                 max_round = MaxRound, time = 0,
                                                 is_lose = IsLose,
                                                 name = lang:get("神秘人"),
                                                 group_id = GroupId}]}),
            UpdateGoldLeague = [{GoldLeague, combat_out_win}],
            NewState1 = update_state(date:unixtime(),
                                     UpdateGoldLeague,
                                     State),
            continue(fight_out, NewState1);
        _ ->
            logger:info("淘汰赛 自动获胜找不到玩家数据 [~ts]",
                        [Name],
                        gold_league,
                        1061),
            continue(fight_out, State)
    end;
handle_event({auto_win,
              #gold_league_zone_role{id = WinId, pid = WinPid,
                                     name = WinName, is_lose = IsLose},
              #gold_league_zone_role{id = LoserId, name = LoserName}},
             fight_out,
             State = #state{max_round = MaxRound,
                            now_round = NowRound, group_id = GroupId}) ->
    logger:info("淘汰赛阶段 对手不在线或已退出匹配厅  玩家 [~ts] 自动获胜 玩家 "
                "[~ts] 自动失败",
                [WinName, LoserName],
                gold_league,
                1066),
    case gold_league_mgr:find_role(WinId) of
        {true, WGoldLeague} ->
            case gold_league_mgr:find_role(LoserId) of
                {true, LGoldLeague} ->
                    role:apply(async,
                               WinPid,
                               {gold_league,
                                apply_out_win,
                                [#gold_league_combat_win{state_name = fight_out,
                                                         round = 0,
                                                         now_round = NowRound,
                                                         max_round = MaxRound,
                                                         time = 0,
                                                         is_lose = IsLose,
                                                         group_id = GroupId,
                                                         name = LoserName}]}),
                    guess_return(WGoldLeague,
                                 LGoldLeague,
                                 MaxRound - NowRound,
                                 LoserName),
                    UpdateGoldLeague = [{WGoldLeague, combat_out_win},
                                        {LGoldLeague, combat_out_lose}],
                    NewState1 = update_state(date:unixtime(),
                                             UpdateGoldLeague,
                                             State),
                    continue(fight_out, NewState1);
                _ ->
                    logger:info("淘汰赛 自动获胜找不到玩家数据 [~ts]",
                                [LoserName],
                                gold_league,
                                1079),
                    continue(fight_out, State)
            end;
        _ ->
            logger:info("淘汰赛 自动获胜找不到玩家数据 ~ts",
                        [WinName],
                        gold_league,
                        1083),
            continue(fight_out, State)
    end;
handle_event({combat_over,
              Winner,
              Loser,
              CombatPid,
              Args},
             fight, State) ->
    logger:debug("资格赛战斗结束结算", [], gold_league, 1089),
    StatsState = combat_over_stats(Winner,
                                   Loser,
                                   Args,
                                   State,
                                   fight),
    gold_league_mgr:del_combat(CombatPid),
    continue(fight, StatsState);
handle_event({combat_over,
              Winner,
              Loser,
              CombatPid,
              Args},
             fight_out, State) ->
    logger:debug("淘汰赛战斗结束", [], gold_league, 1096),
    StatsState = combat_over_stats(Winner,
                                   Loser,
                                   Args,
                                   State,
                                   fight_out),
    gold_league_mgr:del_combat(CombatPid),
    continue(fight_out, StatsState);
handle_event({combat_over,
              Winner,
              Loser,
              CombatPid,
              Args},
             fight_guess, State) ->
    logger:info("竞猜阶段  错误的结算信息", [], gold_league, 1102),
    logger:debug("淘汰赛战斗结束", [], gold_league, 1103),
    StatsState = combat_over_stats(Winner,
                                   Loser,
                                   Args,
                                   State,
                                   fight_out),
    gold_league_mgr:del_combat(CombatPid),
    continue(fight_guess, StatsState);
handle_event({get_field_role_num, RolePid}, StateName,
             State = #state{group_id = GroupId, num = Num}) ->
    logger:debug("剩余玩家数量 ~w", [Num], gold_league, 1118),
    role:pack_send(RolePid, 20018, {GroupId, Num}),
    continue(StateName, State);
handle_event({get_fight_rival_info, RoleId, Pid},
             StateName, State = #state{members = Members}) ->
    case lists:keyfind(RoleId,
                       #gold_league_zone_role.id,
                       Members)
        of
        #gold_league_zone_role{rival_id = RivalId} ->
            case gold_league_mgr:find_role(RivalId) of
                {true, B} ->
                    logger:debug("对手信息", [], gold_league, 1127),
                    role:pack_send(Pid, 20019, {B});
                _ -> ok
            end;
        _ -> ok
    end,
    continue(StateName, State);
handle_event({update_reward, RoleId, Num}, StateName,
             State = #state{open_mode = OpenMode}) ->
    case gold_league_mgr:find_role(RoleId) of
        {true, GoldLeague = #gold_league{reward = Reward}} ->
            OldNum1 = case lists:keyfind(90026, 1, Reward) of
                          {_, OldNum} -> OldNum;
                          _ -> 0
                      end,
            Reward1 = lists:keystore(90026,
                                     1,
                                     Reward,
                                     {90026, OldNum1 + Num}),
            NewGoldLeague = GoldLeague#gold_league{reward =
                                                       Reward1},
            gold_league_mgr:update_role(NewGoldLeague, OpenMode);
        _ -> skip
    end,
    logger:debug("更新奖励 ~w",
                 [{StateName, RoleId, Num}],
                 gold_league,
                 1155),
    continue(StateName, State);
handle_event(print_info, StateName, State) ->
    logger:info("战场信息 ~w",
                [{StateName, State}],
                gold_league,
                1160),
    continue(StateName, State);
handle_event({print_self_info, RoleId}, StateName,
             State = #state{members = Members}) ->
    ZoneRole = lists:keyfind(RoleId,
                             #gold_league_zone_role.id,
                             Members),
    logger:info("战场个人信息 ~w",
                [{StateName, ZoneRole}],
                gold_league,
                1165),
    continue(StateName, State);
handle_event({get_field_info, _Pid}, fight, State) ->
    continue(fight, State);
handle_event({get_field_info, _}, StateName, State) ->
    continue(StateName, State);
handle_event({get_phase, Pid}, StateName,
             State = #state{end_time = EndTime, now_round = NowRound,
                            max_round = MaxRound, ids = Ids}) ->
    Phase = gold_league_utils:phase_left_time(StateName),
    role:pack_send(Pid,
                   20000,
                   {Phase, EndTime, NowRound, MaxRound, Ids}),
    continue(StateName, State);
handle_event({exit, Label, Rid}, fight,
             State = #state{map_id = _MapId, open_mode = OpenMode})
    when Label =:= logout orelse
             Label =:= leave orelse Label =:= die ->
    NewState = State,
    case gold_league_mgr:find_role(Rid) of
        {true, GoldLeague} ->
            {Status, UpdateLabel} = case Label of
                                        logout -> {4, logout};
                                        _ -> {3, leave}
                                    end,
            NewGoldLeague = GoldLeague#gold_league{status = Status},
            gold_league_mgr:update_role(NewGoldLeague, OpenMode),
            UpdateGoldLeague = [{NewGoldLeague, UpdateLabel}],
            NewState1 = update_state(date:unixtime(),
                                     UpdateGoldLeague,
                                     NewState),
            continue(fight, NewState1);
        _ -> continue(fight, NewState)
    end;
handle_event({exit, Label, Rid}, Phase,
             State = #state{open_mode = OpenMode})
    when Label =:= logout orelse
             Label =:= leave orelse Label =:= die ->
    case gold_league_mgr:find_role(Rid) of
        {true, GoldLeague} ->
            {Status, UpdateLabel} = case Label of
                                        logout -> {4, logout};
                                        _ -> {3, leave}
                                    end,
            NewGoldLeague = GoldLeague#gold_league{status = Status},
            gold_league_mgr:update_role(NewGoldLeague, OpenMode),
            UpdateGoldLeague = [{NewGoldLeague, UpdateLabel}],
            NewState = update_state(date:unixtime(),
                                    UpdateGoldLeague,
                                    State),
            continue(Phase, NewState);
        _ -> continue(Phase, State)
    end;
handle_event({exit, _Lable, _Rid}, Phase,
             State = #state{map_id = _MapId}) ->
    continue(Phase, State);
handle_event({request_start_combat, Rid}, StateName,
             State = #state{members = Members})
    when StateName =:= fight orelse
             StateName =:= fight_out ->
    case lists:keyfind(Rid,
                       #gold_league_zone_role.id,
                       Members)
        of
        #gold_league_zone_role{pid = SelfPid,
                               rival_id = RivalId, name = SelfName,
                               combat_pid = undefined, ref = Ref} =
            ARole
            when is_reference(Ref) ->
            case lists:keyfind(RivalId,
                               #gold_league_zone_role.id,
                               Members)
                of
                #gold_league_zone_role{pid = RivalPid,
                                       name = RivalName} =
                    BRole ->
                    case erlang:is_reference(Ref) of
                        true -> erlang:cancel_timer(Ref);
                        _ -> skip
                    end,
                    self() ! {combat, ARole, BRole},
                    role:pack_send(SelfPid,
                                   20003,
                                   {1,
                                    notice:format(lang:get("已主动向~ts发起进攻{face_1,13}"),
                                                  [{string_2, 5, RivalName}])}),
                    role:pack_send(RivalPid,
                                   20003,
                                   {1,
                                    notice:format(lang:get("遭到~ts的突然袭击{face_1,12}"),
                                                  [{string_2, 5, SelfName}])}),
                    Members1 = lists:keystore(Rid,
                                              #gold_league_zone_role.id,
                                              Members,
                                              ARole#gold_league_zone_role{ref =
                                                                              undefined}),
                    Members2 = lists:keystore(RivalId,
                                              #gold_league_zone_role.id,
                                              Members1,
                                              BRole#gold_league_zone_role{ref =
                                                                              undefined}),
                    continue(StateName, State#state{members = Members2});
                _ -> continue(StateName, State)
            end;
        #gold_league_zone_role{ref = undefined, pid = SelfPid,
                               rival_id = _RivalId} ->
            logger:info("已经在战斗,不需要主动发起战斗 ~w ~w",
                        [Rid, _RivalId],
                        gold_league,
                        1245),
            role:pack_send(SelfPid,
                           20003,
                           {0, lang:get("已经在战斗中,无需主动发起战斗")}),
            continue(StateName, State);
        _ ->
            logger:info("找不到玩家数据, 手动发起战斗失败", [], gold_league, 1249),
            continue(StateName, State)
    end;
handle_event(_Event, Phase, State) ->
    logger:debug("收到不匹配的事件[~w]",
                 [{_Event, Phase}],
                 gold_league,
                 1254),
    continue(Phase, State).

handle_sync_event({login, RoleId, Pid}, _From, Phase,
                  State = #state{open_mode = OpenMode}) ->
    case gold_league_mgr:find_role(RoleId) of
        {true, GoldLeague = #gold_league{}} ->
            NewStatus = 2,
            NewGoldLeague = GoldLeague#gold_league{pid = Pid,
                                                   status = NewStatus},
            gold_league_mgr:update_role(NewGoldLeague, OpenMode),
            Reply = {ok, Phase, NewGoldLeague},
            UpdateGoldLeague = [{NewGoldLeague, {login, Pid}}],
            NewState = update_state(date:unixtime(),
                                    UpdateGoldLeague,
                                    State),
            continue(Phase, Reply, NewState);
        _ -> continue(Phase, false, State)
    end;
handle_sync_event({guess,
                   RoleId,
                   ToRoleId,
                   Grade,
                   Amount,
                   MyMembers},
                  _From, Phase, State = #state{members = Members})
    when Phase =:= fight_guess ->
    Reply = case lists:keyfind(ToRoleId,
                               #gold_league_zone_role.id,
                               Members)
                of
                #gold_league_zone_role{is_out = 0, name = Name} =
                    ZoneRole ->
                    case gold_league_api:get_rival_info(Members, ZoneRole)
                        of
                        {ok, #gold_league_zone_role{id = RivalId}} ->
                            case lists:member(RivalId, MyMembers) of
                                false ->
                                    Guess = #gold_league_guess{num = OldNum,
                                                               members =
                                                                   GMembers,
                                                               amount =
                                                                   OldAmount} =
                                                case
                                                    ets:lookup(gold_league_guess,
                                                               ToRoleId)
                                                    of
                                                    [#gold_league_guess{} =
                                                         Guess0] ->
                                                        Guess0;
                                                    _ ->
                                                        #gold_league_guess{id =
                                                                               ToRoleId,
                                                                           name
                                                                               =
                                                                               Name}
                                                end,
                                    GMembers1 = lists:keystore(RoleId,
                                                               1,
                                                               GMembers,
                                                               {RoleId,
                                                                Grade,
                                                                Amount}),
                                    ets:insert(gold_league_guess,
                                               Guess#gold_league_guess{num =
                                                                           OldNum
                                                                               +
                                                                               1,
                                                                       members =
                                                                           GMembers1,
                                                                       amount =
                                                                           OldAmount
                                                                               +
                                                                               Amount}),
                                    dets:insert(gold_league_guess,
                                                Guess#gold_league_guess{num =
                                                                            OldNum
                                                                                +
                                                                                1,
                                                                        members
                                                                            =
                                                                            GMembers1,
                                                                        amount =
                                                                            OldAmount
                                                                                +
                                                                                Amount}),
                                    ok;
                                _ -> {false, lang:get("已下注，不能修改哦{face_1,2}")}
                            end;
                        _ -> {false, lang:get("找不到该玩家数据")}
                    end;
                #gold_league_zone_role{is_out = 1} ->
                    {false, lang:get("该玩家已被淘汰,不可下注")};
                _ -> {false, lang:get("不存在该玩家")}
            end,
    continue(Phase, Reply, State);
handle_sync_event({guess, _, _, _, _, _}, _From, Phase,
                  State) ->
    logger:debug("当前阶段 ~w", [Phase], gold_league, 1301),
    Reply = {false, lang:get("该阶段不可竞猜")},
    continue(Phase, Reply, State);
handle_sync_event({use_drug, RoleId, Id}, _From, Phase,
                  State = #state{members = Members})
    when Phase =:= fight ->
    Reply = case lists:keyfind(RoleId,
                               #gold_league_zone_role.id,
                               Members)
                of
                #gold_league_zone_role{rival_pid = RivalPid,
                                       name = Name} ->
                    Msg = case Id of
                              96105 ->
                                  notice:format(lang:get("对手~ts使用~ts，全体守护~ts获得提升{face_1,13}"),
                                                [{string_2, 1, Name},
                                                 {string_2, 6, lang:get("大力丸")},
                                                 {string_2,
                                                  5,
                                                  lang:get("攻击力")}]);
                              _ ->
                                  notice:format(lang:get("对手~ts使用~ts，守护获得1次~ts技能{face_1,36}"),
                                                [{string_2, 1, Name},
                                                 {string_2, 6, lang:get("幸运丸")},
                                                 {string_2, 5, lang:get("保命")}])
                          end,
                    notice:send({pid, RivalPid}, 1, Msg),
                    ok;
                _ -> {false, lang:get("不可使用药丸")}
            end,
    continue(Phase, Reply, State);
handle_sync_event({use_drug, RoleId, Id}, _From, Phase,
                  State = #state{members = Members})
    when Phase =:= fight_out ->
    Reply = case lists:keyfind(RoleId,
                               #gold_league_zone_role.id,
                               Members)
                of
                #gold_league_zone_role{name = Name} = ZoneRole ->
                    case gold_league_api:get_rival_info(Members, ZoneRole)
                        of
                        {ok,
                         #gold_league_zone_role{name = _Name,
                                                pid = RivelPid}} ->
                            Msg = case Id of
                                      96105 ->
                                          notice:format(lang:get("对手~ts使用~ts，全体守护~ts获得提升{face_1,13}"),
                                                        [{string_2, 1, Name},
                                                         {string_2,
                                                          6,
                                                          lang:get("大力丸")},
                                                         {string_2,
                                                          5,
                                                          lang:get("攻击力")}]);
                                      _ ->
                                          notice:format(lang:get("对手~ts使用~ts，守护获得1次~ts技能{face_1,36}"),
                                                        [{string_2, 1, Name},
                                                         {string_2,
                                                          6,
                                                          lang:get("幸运丸")},
                                                         {string_2,
                                                          5,
                                                          lang:get("保命")}])
                                  end,
                            notice:send({pid, RivelPid}, 1, Msg),
                            ok;
                        _ -> ok
                    end;
                _ -> {false, lang:get("不可使用药丸")}
            end,
    continue(Phase, Reply, State);
handle_sync_event(_Event, _From, Phase, State) ->
    Reply = false,
    continue(Phase, Reply, State).

handle_info(round_over, StateName, State)
    when StateName =:= fight_out ->
    logger:debug("提前结束该轮次", [], gold_league, 1357),
    continue(StateName, State#state{timeout = 0});
handle_info(round_over, StateName, State) ->
    logger:info("提前结束该轮次错误 ~w",
                [StateName],
                gold_league,
                1360),
    continue(StateName, State#state{timeout = 0});
handle_info({remove_unit, BattleIds, MapId}, StateName,
            State) ->
    [unit_mgr:remove(BattleId) || BattleId <- BattleIds],
    case create_1v1_effects(MapId) of
        {ok, NewBattleIds} ->
            erlang:send_after(30 * 1000,
                              self(),
                              {remove_unit, NewBattleIds}),
            ok;
        _R -> skip
    end,
    continue(StateName, State);
handle_info({remove_unit, BattleIds}, StateName,
            State) ->
    [unit_mgr:remove(BattleId) || BattleId <- BattleIds],
    continue(StateName, State);
handle_info({combat,
             RoleA = #gold_league_zone_role{id = IdA, ref = Ref},
             RoleB = #gold_league_zone_role{id = IdB}},
            StateName,
            State = #state{cross_id = CrossId,
                           members = Members}) ->
    case combat(RoleA, RoleB, CrossId, StateName, State) of
        {true, NRoleA, NRoleB} ->
            case erlang:is_reference(Ref) of
                true -> erlang:cancel_timer(Ref);
                _ -> ok
            end,
            Members1 = lists:keystore(IdA,
                                      #gold_league_zone_role.id,
                                      Members,
                                      NRoleA),
            Members2 = lists:keystore(IdB,
                                      #gold_league_zone_role.id,
                                      Members1,
                                      NRoleB),
            continue(StateName, State#state{members = Members2});
        _ -> continue(StateName, State)
    end;
handle_info({enter_back, APid, BPid}, StateName,
            State = #state{map_zone = MapZoneId, map_plat = MapPlat,
                           open_mode = OpenMode, map_id = MapId}) ->
    Self = self(),
    role:apply(async,
               APid,
               {gold_league,
                apply_enter_field,
                [Self, OpenMode, {MapPlat, MapZoneId, MapId}]}),
    role:apply(async,
               BPid,
               {gold_league,
                apply_enter_field,
                [Self, OpenMode, {MapPlat, MapZoneId, MapId}]}),
    continue(StateName, State);
handle_info({enter_back, WinPid}, StateName,
            State = #state{map_zone = MapZoneId, map_plat = MapPlat,
                           open_mode = OpenMode, map_id = MapId}) ->
    Self = self(),
    role:apply(async,
               WinPid,
               {gold_league,
                apply_enter_field,
                [Self, OpenMode, {MapPlat, MapZoneId, MapId}]}),
    continue(StateName, State);
handle_info({out_exit, LosePid}, StateName,
            State = #state{}) ->
    role:apply(async,
               LosePid,
               {gold_league, out_exit_gold_league_field, []}),
    continue(StateName, State);
handle_info(match, fight,
            State = #state{end_time = EndTime}) ->
    case EndTime - date:unixtime() > 2 * 60 of
        true ->
            NewState = match(State),
            case get(match_ref) of
                Ref when is_reference(Ref) -> erlang:cancel_timer(Ref);
                _ -> ok
            end,
            NewRef = erlang:send_after(9 * 1000, self(), match),
            put(match_ref, NewRef),
            continue(fight, NewState);
        _ ->
            logger:info("时间小于两分钟不再匹配", [], gold_league, 1421),
            continue(fight, State)
    end;
handle_info(match, StateName, State) ->
    continue(StateName, State);
handle_info(rank, fight,
            State = #state{members = Members,
                           open_mode = OpenMode}) ->
    Members1 =
        lists:reverse(lists:keysort(#gold_league_zone_role.score,
                                    lists:keysort(#gold_league_zone_role.fc,
                                                  Members))),
    Fun = fun (GlZoneRole = #gold_league_zone_role{id =
                                                       RoleId,
                                                   score = Score},
               {MembersAcc, Acc}) ->
                  case gold_league_mgr:find_role(RoleId) of
                      {true, GoldLeague} when Score > 0 ->
                          gold_league_mgr:update_role(GoldLeague#gold_league{rank
                                                                                 =
                                                                                 Acc},
                                                      OpenMode),
                          {[GlZoneRole#gold_league_zone_role{rank = Acc}
                            | MembersAcc],
                           Acc + 1};
                      _ -> {[GlZoneRole | MembersAcc], Acc}
                  end
          end,
    {NewMembers, _LastRank} = lists:foldl(Fun,
                                          {[], 1},
                                          Members1),
    case get(rank_ref) of
        Ref when is_reference(Ref) -> erlang:cancel_timer(Ref);
        _ -> ok
    end,
    NewRef = erlang:send_after(13 * 1000, self(), rank),
    put(rank_ref, NewRef),
    continue(fight, State#state{members = NewMembers});
handle_info(rank, StateName, State) ->
    logger:debug("===========排行榜停止刷新===========",
                 [],
                 gold_league,
                 1447),
    continue(StateName, State);
handle_info(stop_combat, StateName, State) ->
    logger:info("匹配战斗时间到,结束所有战斗", [], gold_league, 1451),
    case get(match_ref) of
        Ref when is_reference(Ref) -> erlang:cancel_timer(Ref);
        _ -> skip
    end,
    case get(stop_ref) of
        StopRef when is_reference(StopRef) ->
            erlang:cancel_timer(StopRef);
        _ -> skip
    end,
    do_stop_combat(),
    continue(StateName, State);
handle_info({timer_tick, Msg}, Phase, State) ->
    NewState = case tick(Phase, Msg, State) of
                   {ok, {set, Timer}, RtnState} ->
                       server_timer:set(Timer),
                       RtnState;
                   {ok, {set, Timer}} ->
                       server_timer:set(Timer),
                       State;
                   {ok, remove, RtnState} ->
                       server_timer:timer(remove),
                       RtnState;
                   remove ->
                       server_timer:timer(remove),
                       State;
                   _False ->
                       logger:debug("[Msg:~w]定时器返回值:~w",
                                    [Msg, _False],
                                    gold_league,
                                    1479),
                       server_timer:timer(remove),
                       State
               end,
    continue(Phase, NewState);
handle_info(_Info, Phase, State) ->
    logger:debug("[Phase:~w]未知的消息[Info:~w]",
                 [Phase, _Info],
                 gold_league,
                 1487),
    continue(Phase, State).

terminate(Reason, Phase,
          #state{id = Fid, group_id = GroupId, map_pid = MapPid,
                 exit_npc = BattleId}) ->
    case Reason of
        abnormal ->
            logger:info("钻石联赛战场活动进程正在退出[Reason:~w][phase:~w][Fid:~w][G"
                        "roupId:~w]",
                        [Reason, Phase, Fid, GroupId],
                        gold_league,
                        1495),
            ok;
        _ ->
            logger:debug("钻石联赛战场活动进程正在退出[Reason:~w][phase:~w][Fid:~w][G"
                         "roupId:~w]",
                         [Reason, Phase, Fid, GroupId],
                         gold_league,
                         1500),
            ok
    end,
    unit_mgr:remove(BattleId),
    map:stop(MapPid),
    server_timer:clean(),
    ok.

code_change(_OldVsn, StateName, State, _Extra) ->
    {ok, StateName, State}.

tick(Phase, Msg, _State) ->
    logger:error("阶段[Phase:~w]收到未知的定时消息[Msg:~w]",
                 [Phase, Msg],
                 gold_league,
                 1515),
    remove.

add_members(State = #state{members = Members},
            GoldLeague = #gold_league{id = RoleId}) ->
    GoldLeagueZone = to_gold_league_zone_role(GoldLeague),
    NewMembers = lists:keystore(RoleId,
                                #gold_league_zone_role.id,
                                Members,
                                GoldLeagueZone),
    State#state{members = NewMembers}.

to_gold_league_zone_role(#gold_league{id = RoleId,
                                      pid = RolePid, name = Name, sex = Sex,
                                      classes = Classes, lev = Lev,
                                      group_id = GroupId, status = Status,
                                      field_id = FieldId, cross_id = CrossId,
                                      fc = Fc}) ->
    #gold_league_zone_role{id = RoleId, pid = RolePid,
                           name = Name, sex = Sex, classes = Classes, lev = Lev,
                           group_id = GroupId, status = Status,
                           field_id = FieldId, cross_id = CrossId, fc = Fc}.

to_gole_league_role(#gold_league_zone_role{id = RoleId,
                                           pid = RolePid, name = Name,
                                           sex = Sex, classes = Classes,
                                           lev = Lev, group_id = GroupId,
                                           status = Status, field_id = FieldId,
                                           cross_id = CrossId, is_lose = IsLose,
                                           lose_round = LoseRound, pos = Pos,
                                           rank = Rank,
                                           is_combat = IsCombat}) ->
    Looks1 = case gold_league_mgr:find_role(RoleId) of
                 {true, #gold_league{looks = Looks}} -> Looks;
                 _ -> []
             end,
    #gold_league{looks = Looks1, id = RoleId, pid = RolePid,
                 name = Name, sex = Sex, classes = Classes, lev = Lev,
                 group_id = GroupId, status = Status, field_id = FieldId,
                 cross_id = CrossId, is_lose = IsLose,
                 lose_round = LoseRound, pos = Pos, rank = Rank,
                 is_combat = IsCombat}.

send_async_apply(gold_league, F = apply_exit, Args,
                 #gold_league{id = RoleId, pid = Pid, name = _Name,
                              status = 2, combat_count = CombatCount})
    when is_pid(Pid) ->
    case Args of
        fight_lose when CombatCount =:= 2 ->
            Reward = case CombatCount of
                         2 -> [{90026, 50}];
                         _ -> [{90026, 100}]
                     end,
            logger:info("资格赛结束，匹配未满三场 ~ts  ~w",
                        [_Name, CombatCount],
                        gold_league,
                        1541),
            mail:send(RoleId,
                      lang:get("钻石联赛"),
                      lang:get("资格赛结束，匹配未满三场"),
                      Reward);
        _ -> ok
    end,
    role:apply(async, Pid, {gold_league, F, [Args]}),
    ok;
send_async_apply(_M, _F, _Args,
                 _GoldLeague = #gold_league{name = _Name,
                                            status = _Status, pid = _Pid}) ->
    logger:debug("[~ts]异步回调~w, GoldLeague:~w",
                 [_Name, {_M, _F, _Args}, {_Status, _Pid}],
                 gold_league,
                 1549),
    ok.

combat_over_calc_winner(GoldLeague =
                            #gold_league{multi_kill = MultiKill, score = Score,
                                         combat_count = CombatCount,
                                         id = WinRid, win = Win,
                                         win_count = WinCount},
                        #gold_league{multi_kill = EnemyMKill}, _Args,
                        State = #state{rank = Rank}) ->
    NewMultiKill = MultiKill + 1,
    NewCombatCount = CombatCount + 1,
    Add = case NewMultiKill of
              2 -> util:floor(10 * 1.19999999999999995559);
              3 -> util:floor(10 * 1.6);
              _ when EnemyMKill =:= 2 -> util:floor(10 * 1.3);
              _ -> 10
          end,
    NewScore = Score + Add,
    NewRank = gold_league_rank:update(WinRid,
                                      Score,
                                      NewScore,
                                      Rank),
    RankNum = gold_league_rank:lookup_rank(WinRid,
                                           NewScore,
                                           NewRank),
    NewGoldLeague = GoldLeague#gold_league{score = NewScore,
                                           combat_count = NewCombatCount,
                                           win_count = WinCount + 1,
                                           multi_kill = NewMultiKill,
                                           rank = RankNum, win = Win + 1},
    NewState = State#state{rank = NewRank},
    {NewGoldLeague, NewState}.

combat_over_calc_loser(_WinWar,
                       GoldLeague = #gold_league{id = LoserId, score = Score,
                                                 lose = Lose},
                       _Args, State = #state{rank = Rank}) ->
    Add = 5,
    NewScore = Score + Add,
    NewRank = gold_league_rank:update(LoserId,
                                      Score,
                                      NewScore,
                                      Rank),
    RankNum = gold_league_rank:lookup_rank(LoserId,
                                           NewScore,
                                           NewRank),
    NewGoldLeague = GoldLeague#gold_league{multi_kill = 0,
                                           score = NewScore, rank = RankNum,
                                           lose = Lose + 1},
    NewState = State#state{rank = NewRank},
    {NewGoldLeague, NewState}.

die_leave_zone(Role = #role{name = _Name}) ->
    Timer = #timer{id = gold_league_leave,
                   timeout = 3 * 1000, m = gold_league, f = apply_exit,
                   a = [die]},
    Role1 = role_timer:set(Timer, Role),
    {ok, Role1}.

combat_over_calc(WinWar, LoseWar, Args,
                 State = #state{open_mode = OpenMode}, StateName)
    when StateName =:= fight ->
    Time = case lists:keyfind(time, 1, Args) of
               {_, Time0} -> Time0;
               _ -> 0
           end,
    Round = case lists:keyfind(round, 1, Args) of
                {_, Round0} -> Round0;
                _ -> 1
            end,
    {NewWinWar = #gold_league{pid = WinPid}, WinState} =
        combat_over_calc_winner(WinWar, LoseWar, Args, State),
    {NewLoseWar = #gold_league{pid = LosePid}, LoseState} =
        combat_over_calc_loser(WinWar, LoseWar, Args, WinState),
    NewGoldLeagues = [NewWinWar, NewLoseWar],
    {WinResult, LoseReult} = combat_over_result(WinWar,
                                                NewWinWar,
                                                LoseWar,
                                                NewLoseWar),
    role:apply(async,
               WinPid,
               {gold_league,
                apply_win,
                [WinResult#gold_league_combat_win{state_name =
                                                      StateName,
                                                  time = Time,
                                                  round = Round}]}),
    role:apply(async,
               LosePid,
               {gold_league,
                apply_lose,
                [LoseReult#gold_league_combat_lose{state_name =
                                                       StateName,
                                                   time = Time,
                                                   round = Round}]}),
    gold_league_mgr:update_role(NewGoldLeagues, OpenMode),
    NewState = LoseState,
    UpdateGoldLeague = [{NewWinWar, combat_win},
                        {NewLoseWar, combat_lose}],
    NewState1 = update_state(date:unixtime(),
                             UpdateGoldLeague,
                             NewState),
    NewState1;
combat_over_calc(WinWar = #gold_league{pid = WinPid,
                                       id = WinRoleId},
                 LoseWar = #gold_league{pid = LosePid, id = LoseRoleId},
                 Args,
                 State = #state{open_mode = OpenMode,
                                now_round = NowRound, max_round = MaxRound,
                                members = Members, group_id = GroupId},
                 StateName)
    when StateName =:= fight_out ->
    Time = case lists:keyfind(time, 1, Args) of
               {_, Time0} -> Time0;
               _ -> 0
           end,
    Round = case lists:keyfind(round, 1, Args) of
                {_, Round0} -> Round0;
                _ -> 1
            end,
    NewGoldLeagues = [WinWar, LoseWar],
    {WinResult, LoseReult} =
        combat_over_result(lists:keyfind(WinRoleId,
                                         #gold_league_zone_role.id,
                                         Members),
                           lists:keyfind(LoseRoleId,
                                         #gold_league_zone_role.id,
                                         Members)),
    role:apply(async,
               WinPid,
               {gold_league,
                apply_out_win,
                [WinResult#gold_league_combat_win{state_name =
                                                      fight_out,
                                                  now_round = NowRound,
                                                  max_round = MaxRound,
                                                  time = Time,
                                                  group_id = GroupId,
                                                  round = Round}]}),
    role:apply(async,
               LosePid,
               {gold_league,
                apply_out_lose,
                [LoseReult#gold_league_combat_lose{state_name =
                                                       fight_out,
                                                   now_round = NowRound,
                                                   max_round = MaxRound,
                                                   time = Time,
                                                   round = Round}]}),
    gold_league_mgr:update_role(NewGoldLeagues, OpenMode),
    guess_calc(WinWar, LoseWar, MaxRound - NowRound),
    UpdateGoldLeague = [{WinWar, combat_out_win},
                        {LoseWar, combat_out_lose}],
    NewState1 = update_state(date:unixtime(),
                             UpdateGoldLeague,
                             State),
    NewState1;
combat_over_calc(_, _, _Args, State, _StateName) ->
    logger:info("战斗解散 错误的战斗状态 ~w",
                [_StateName],
                gold_league,
                1647),
    State.

combat_over_result(#gold_league{id = WinId,
                                name = WinName, score = WinOldScore},
                   #gold_league{score = WinScore},
                   #gold_league{id = LoseId, name = LoseName,
                                score = LoseOldScore},
                   #gold_league{score = LoseScore}) ->
    WinDiffScore = erlang:max(WinScore - WinOldScore, 0),
    LoseDiffScore = erlang:max(LoseScore - LoseOldScore, 0),
    WinResult = #gold_league_combat_win{id = LoseId,
                                        name = LoseName, score = WinDiffScore},
    LoseResult = #gold_league_combat_lose{id = WinId,
                                          name = WinName,
                                          score = LoseDiffScore},
    {WinResult, LoseResult}.

combat_over_result(#gold_league_zone_role{id = WinId,
                                          name = WinName, is_lose = WinIsLose},
                   #gold_league_zone_role{id = LoseId, name = LoseName,
                                          is_lose = LoseIsLose}) ->
    WinResult = #gold_league_combat_win{id = LoseId,
                                        name = LoseName, is_lose = WinIsLose},
    LoseResult = #gold_league_combat_lose{id = WinId,
                                          name = WinName, is_lose = LoseIsLose},
    {WinResult, LoseResult};
combat_over_result(_, _) ->
    {#gold_league_combat_win{}, #gold_league_combat_lose{}}.

combat_over_stats([], [], _Args, State, _StateName) ->
    State;
combat_over_stats([#fighter{origin_id = WinWid,
                            pid = WinPid}],
                  [#fighter{origin_id = LoseWid, pid = LosePid}], Args,
                  State = #state{max_round = MaxRound,
                                 now_round = NowRound},
                  StateName) ->
    case StateName of
        fight ->
            erlang:send_after(3 * 1000,
                              self(),
                              {enter_back, WinPid, LosePid});
        _ ->
            if MaxRound - NowRound =:= 0 ->
                   logger:info("决赛  退出战场", [], gold_league, 1682),
                   erlang:send_after(3 * 1000, self(), {out_exit, WinPid}),
                   erlang:send_after(3 * 1000,
                                     self(),
                                     {out_exit, LosePid});
               MaxRound - NowRound =:= 1 ->
                   logger:info("淘汰赛4强 返回准备区", [], gold_league, 1686),
                   erlang:send_after(3 * 1000,
                                     self(),
                                     {enter_back, WinPid}),
                   erlang:send_after(3 * 1000,
                                     self(),
                                     {enter_back, LosePid});
               true ->
                   erlang:send_after(3 * 1000,
                                     self(),
                                     {enter_back, WinPid}),
                   erlang:send_after(3 * 1000, self(), {out_exit, LosePid})
            end
    end,
    case gold_league_mgr:find_role(WinWid) of
        {true, WinWar} ->
            case gold_league_mgr:find_role(LoseWid) of
                {true, LoseWar} ->
                    combat_over_calc(WinWar,
                                     LoseWar,
                                     Args,
                                     State,
                                     StateName);
                _False -> State
            end;
        _False -> State
    end;
combat_over_stats([_WinF], [_LoseF], _Args, State,
                  _StateName) ->
    logger:debug("玩家对战结束:Win:~w Lose:~w",
                 [_WinF, _LoseF],
                 gold_league,
                 1704),
    State.

guess_return(A = #gold_league{id = WinId,
                              name = _WinName},
             B = #gold_league{id = LoseId, name = _LoseName}, Round,
             QuitName) ->
    AMembers = case ets:lookup(gold_league_guess, WinId) of
                   [#gold_league_guess{members = Members1}] -> Members1;
                   _ -> []
               end,
    BMembers = case ets:lookup(gold_league_guess, LoseId) of
                   [#gold_league_guess{members = Members2}] -> Members2;
                   _ -> []
               end,
    Title = lang:get("钻石联赛竞猜返还"),
    Msg = case Round of
              0 -> lang:get("钻石联赛决赛比赛：~tsvs~ts，由于~ts弃权，原额返还下注资金，请查收");
              1 ->
                  lang:get("钻石联赛4进2比赛：~tsvs~ts，由于~ts弃权，原额返还下注资金，请查收");
              2 ->
                  lang:get("钻石联赛8进4比赛：~tsvs~ts，由于~ts弃权，原额返还下注资金，请查收");
              _ ->
                  lang:get("钻石联赛16进8比赛：~tsvs~ts，由于~ts弃权，原额返还下注资金，请查收")
          end,
    [#gold_league{name = FirstName},
     #gold_league{name = SecondName}] =
        lists:keysort(#gold_league.pos, [A, B]),
    Content = notice:format(Msg,
                            [{string_2, 5, FirstName},
                             {string_2, 5, SecondName},
                             {string_2, 5, QuitName}]),
    logger:debug("========== ~w",
                 [length(AMembers ++ BMembers)],
                 gold_league,
                 1730),
    Fun = fun ({RoleId, Grade, Amount}) ->
                  case gold_league_data:get_guess(Grade) of
                      #{type := AssetsType} ->
                          logger:debug("返还金额 ~w",
                                       [{Grade, Amount}],
                                       gold_league,
                                       1734),
                          mail:send(RoleId,
                                    Title,
                                    Content,
                                    [{AssetsType, Amount}]);
                      _ -> ok
                  end
          end,
    lists:foreach(Fun, AMembers ++ BMembers),
    ets:delete(gold_league_guess, WinId),
    dets:delete(gold_league_guess, WinId),
    ets:delete(gold_league_guess, LoseId),
    dets:delete(gold_league_guess, LoseId).

guess_calc(A = #gold_league{id = WinId, name = WinName},
           B = #gold_league{id = LoseId, name = LoseName},
           Round) ->
    {WinMembers, WinAmount} = case
                                  ets:lookup(gold_league_guess, WinId)
                                  of
                                  [#gold_league_guess{members = Members1,
                                                      amount = Amount1}] ->
                                      {Members1, Amount1};
                                  _ -> {[], 0}
                              end,
    {LoseMembers, LoseAmount} = case
                                    ets:lookup(gold_league_guess, LoseId)
                                    of
                                    [#gold_league_guess{members = Members2,
                                                        amount = Amount2}] ->
                                        {Members2, Amount2};
                                    _ -> {[], 0}
                                end,
    Title = lang:get("钻石联赛竞猜结果"),
    {WinMsg, LoseMsg} = case Round of
                            0 ->
                                {lang:get("钻石联赛活动决赛赛事已结束，您的竞猜情况如下：\n ~tsvs~ts\n您下注支持~ts~"
                                          "ts，恭喜猜中，获得~ts "),
                                 lang:get("钻石联赛活动决赛赛事已结束，您的竞猜情况如下：\n~tsvs~ts\n您下注支持~ts~t"
                                          "s，遗憾猜错，返还~ts")};
                            1 ->
                                {lang:get("钻石联赛活动4进2赛事已结束，您的竞猜情况如下：\n ~tsvs~ts\n您下注支持~ts"
                                          "~ts，恭喜猜中，获得~ts"),
                                 lang:get("钻石联赛活动4进2赛事已结束，您的竞猜情况如下：\n~tsvs~ts\n您下注支持~ts~"
                                          "ts，遗憾猜错，返还~ts")};
                            2 ->
                                {lang:get("钻石联赛活动8进4赛事已结束，您的竞猜情况如下：\n~tsvs~ts\n您下注支持~ts~"
                                          "ts，恭喜猜中，获得~ts"),
                                 lang:get("钻石联赛活动8进4赛事已结束，您的竞猜情况如下：\n~tsvs~ts\n您下注支持~ts~"
                                          "ts，遗憾猜错，返还~ts")};
                            _ ->
                                {lang:get("钻石联赛活动16进8赛事已结束，您的竞猜情况如下：\n~tsvs~ts\n您下注支持~ts"
                                          "~ts，恭喜猜中，获得~ts"),
                                 lang:get("钻石联赛活动16进8赛事已结束，您的竞猜情况如下：\n~tsvs~ts\n您下注支持~ts"
                                          "~ts，遗憾猜错，返还~ts")}
                        end,
    [#gold_league{name = FirstName},
     #gold_league{name = SecondName}] =
        lists:keysort(#gold_league.pos, [A, B]),
    logger:debug("竞猜======== ~w",
                 [{WinAmount, LoseAmount}],
                 gold_league,
                 1776),
    guess_calc_loser(LoseMembers,
                     FirstName,
                     SecondName,
                     LoseName,
                     Title,
                     LoseMsg),
    case WinAmount > 0 of
        true ->
            Ratio = min(8.0e-1,
                        max(2.0e-1, WinAmount / (WinAmount + LoseAmount))),
            guess_calc_winner(WinMembers,
                              FirstName,
                              LoseName,
                              WinName,
                              Ratio,
                              Title,
                              WinMsg),
            ok;
        _ -> ok
    end,
    ets:delete(gold_league_guess, WinId),
    dets:delete(gold_league_guess, WinId),
    ets:delete(gold_league_guess, LoseId),
    dets:delete(gold_league_guess, LoseId).

guess_calc_winner([], _, _, _, _, _, _) -> ok;
guess_calc_winner([{RoleId, Grade, Amount} | T],
                  FirstName, SecondName, WinName, Ratio, Title, Msg) ->
    case gold_league_data:get_guess(Grade) of
        #{type := AssetsType1, cacl_type := AssetsType2,
          max_gold := MaxGold} ->
            GetAmount = min(round(Amount * (1 / Ratio)), MaxGold),
            Content = notice:format(Msg,
                                    [{string_2, 5, FirstName},
                                     {string_2, 5, SecondName},
                                     {string_2, 5, WinName},
                                     {assets_1, AssetsType1, Amount},
                                     {assets_1, AssetsType2, GetAmount}]),
            mail:send(RoleId,
                      Title,
                      Content,
                      [{AssetsType2, GetAmount}]),
            guess_calc_winner(T,
                              FirstName,
                              SecondName,
                              WinName,
                              Ratio,
                              Title,
                              Msg);
        _ ->
            guess_calc_winner(T,
                              FirstName,
                              SecondName,
                              WinName,
                              Ratio,
                              Title,
                              Msg)
    end.

guess_calc_loser([], _, _, _, _, _) -> ok;
guess_calc_loser([{RoleId, Grade, Amount} | T],
                 FirstName, SecondName, LoseName, Title, Msg) ->
    case gold_league_data:get_guess(Grade) of
        #{type := AssetsType1, cacl_type := AssetsType2} ->
            GetAmount = round(Amount * 5.0e-1),
            Content = notice:format(Msg,
                                    [{string_2, 5, FirstName},
                                     {string_2, 5, SecondName},
                                     {string_2, 5, LoseName},
                                     {assets_1, AssetsType1, Amount},
                                     {assets_1, AssetsType2, GetAmount}]),
            mail:send(RoleId,
                      Title,
                      Content,
                      [{AssetsType2, GetAmount}]),
            guess_calc_loser(T,
                             FirstName,
                             SecondName,
                             LoseName,
                             Title,
                             Msg);
        _ ->
            guess_calc_loser(T,
                             FirstName,
                             SecondName,
                             LoseName,
                             Title,
                             Msg)
    end.

get_fighter_leader([]) -> [];
get_fighter_leader([F = #fighter{is_leader = 1,
                                 type = Type}
                    | _Rest])
    when Type =:= 1 orelse Type =:= 4 ->
    [F];
get_fighter_leader([_F | Rest]) ->
    get_fighter_leader(Rest).

broadcast_group([], _Code, _Data) -> ok;
broadcast_group([#gold_league_zone_role{id = Rid}
                 | Rest],
                Code, Data) ->
    case gold_league_mgr:find_role(Rid) of
        {true, #gold_league{pid = Pid}} when is_pid(Pid) ->
            role:pack_send(Pid, Code, Data),
            broadcast_group(Rest, Code, Data);
        _False -> broadcast_group(Rest, Code, Data)
    end;
broadcast_group([Rid | Rest], Code, Data) ->
    case gold_league_mgr:find_role(Rid) of
        {true, #gold_league{pid = Pid}} when is_pid(Pid) ->
            role:pack_send(Pid, Code, Data),
            broadcast_group(Rest, Code, Data);
        _False -> broadcast_group(Rest, Code, Data)
    end;
broadcast_group(#state{map_id = MapId}, Code, Data) ->
    map:pack_send_to_all(MapId, Code, Data),
    ok.

push_combat_over_stats(GoldLeagues, State) ->
    [push_gold_league_info(GoldLeague)
     || GoldLeague <- GoldLeagues],
    push_mini_rank(GoldLeagues, State, []),
    push_field_info(State).

push_gold_league_info(GoldLeague = #gold_league{pid =
                                                    Pid}) ->
    role:pack_send(Pid, 20007, {GoldLeague}),
    ok;
push_gold_league_info(_) -> ok.

push_mini_rank([], State, Acc) ->
    broadcast_group(State, 20008, {Acc});
push_mini_rank([War = #gold_league{rank = Rank} | Rest],
               State, Acc)
    when Rank =< 3 ->
    push_mini_rank(Rest, State, [War | Acc]);
push_mini_rank([_ | Rest], State, Acc) ->
    push_mini_rank(Rest, State, Acc).

push_field_info(_State) -> ok.

match(State = #state{members = L}) ->
    L1 =
        lists:reverse(lists:keysort(#gold_league_zone_role.fc,
                                    L)),
    MatchPair = do_match(L1, L, []),
    NewL = enter_1v1_map(MatchPair, State),
    State#state{members = NewL}.

do_match([], _, MatchPair) -> MatchPair;
do_match([ARole | T], Other, MatchPair) ->
    Now = date:unixtime(),
    case match_role(ARole, Other, Now) of
        {true,
         BRole = #gold_league_zone_role{name = _OtherName}} ->
            do_match(T -- [ARole, BRole],
                     Other -- [ARole, BRole],
                     [{ARole, BRole} | MatchPair]);
        {false, _Reason} ->
            do_match(T, Other -- [ARole], MatchPair)
    end.

match_role(_ARole, [], _Now) -> {false, null};
match_role(ARole, [ARole | T], Now) ->
    match_role(ARole, T, Now);
match_role(#gold_league_zone_role{status = Status}, _,
           _Now)
    when Status =/= 2 ->
    {false, status};
match_role(#gold_league_zone_role{is_combat = IsCombat,
                                  name = _Name},
           _, _Now)
    when IsCombat >= 1 ->
    {false, combat};
match_role(#gold_league_zone_role{last_combat_over_time
                                      = Time,
                                  name = _Name},
           _, Now)
    when Time > Now ->
    {false, time};
match_role(#gold_league_zone_role{combat_count =
                                      CombatCount,
                                  name = _Name},
           _, _Now)
    when CombatCount >= 3 ->
    {false, three};
match_role(ARole,
           [#gold_league_zone_role{status = Status} | T], Now)
    when Status =/= 2 ->
    logger:debug("-================ ~w",
                 [Status],
                 gold_league,
                 1920),
    match_role(ARole, T, Now);
match_role(ARole,
           [#gold_league_zone_role{combat_count = CombatCount,
                                   name = _Name}
            | T],
           Now)
    when CombatCount >= 3 ->
    match_role(ARole, T, Now);
match_role(ARole,
           [#gold_league_zone_role{is_combat = IsCombat,
                                   name = _Name}
            | T],
           Now)
    when IsCombat >= 1 ->
    match_role(ARole, T, Now);
match_role(ARole,
           [#gold_league_zone_role{last_combat_over_time = Time}
            | T],
           Now)
    when Time > Now ->
    match_role(ARole, T, Now);
match_role(ARole = #gold_league_zone_role{id = Id},
           [#gold_league_zone_role{id = RoleId} | T], Now)
    when Id =:= RoleId ->
    logger:debug("上次匹配过的", [], gold_league, 1929),
    match_role(ARole, T, Now);
match_role(#gold_league_zone_role{last_combat_over_time
                                      = _Time,
                                  match = _Match, name = _AName,
                                  combat_count = _CombatCount,
                                  is_combat = _AIsCombat},
           [BRole = #gold_league_zone_role{name = _BName,
                                           is_combat = _BIsCombat}
            | _T],
           _Now) ->
    {true, BRole}.

fight_out_match(State = #state{members = _Members,
                               now_round = NowRound, max_round = MaxRound})
    when MaxRound - NowRound >= 4 ->
    NewState = match_2(State),
    logger:debug("资格赛匹配对手完成", [], gold_league, 1944),
    NewState;
fight_out_match(State = #state{members = _Members,
                               now_round = NowRound, max_round = MaxRound})
    when NowRound < MaxRound ->
    logger:debug("16强赛匹配对手开始 ~w",
                 [length(_Members)],
                 gold_league,
                 1948),
    NewState = match_2(State),
    logger:debug("16强赛匹配对手完成", [], gold_league, 1950),
    NewState;
fight_out_match(State = #state{members = _Members,
                               now_round = NowRound, max_round = MaxRound})
    when NowRound =:= MaxRound ->
    logger:debug("决出冠亚军和季军对手开始 ~w",
                 [length(_Members)],
                 gold_league,
                 1954),
    NewState = match_3(State),
    logger:debug("决出冠亚军和季军配对手完成", [], gold_league, 1956),
    NewState.

match_2(State = #state{members = L,
                       now_round = _NowRound, max_round = _MaxRound}) ->
    logger:debug("淘汰赛匹配 ", [], gold_league, 1961),
    MatchPair = match_2(L),
    NewL = enter_1v1_map(MatchPair, State),
    State#state{members = NewL};
match_2(Members0) ->
    Members = [Role0
               || Role0 = #gold_league_zone_role{is_out = 0}
                      <- Members0],
    logger:debug("=============== ~w",
                 [Members],
                 gold_league,
                 1968),
    logger:debug("剩余可匹配人数 ~w",
                 [length(Members)],
                 gold_league,
                 1969),
    Fun = fun (#gold_league_zone_role{id = RoleId,
                                      match_group_id = GroupId} =
                   Role,
               Acc) ->
                  case lists:keyfind(GroupId, 1, Acc) of
                      {GroupId, GroupMembers} ->
                          GroupMembers1 = lists:keystore(RoleId,
                                                         #gold_league_zone_role.id,
                                                         GroupMembers,
                                                         Role),
                          lists:keystore(GroupId,
                                         1,
                                         Acc,
                                         {GroupId, GroupMembers1});
                      _ -> [{GroupId, [Role]} | Acc]
                  end
          end,
    Members1 = lists:foldl(Fun, [], Members),
    Fun1 = fun ({_GroupId, GroupMembers}, Acc) ->
                   NewMem = do_match_2([{1, 2},
                                        {3, 4},
                                        {5, 6},
                                        {7, 8},
                                        {9, 10},
                                        {11, 12},
                                        {13, 14},
                                        {15, 16},
                                        {17, 18},
                                        {19, 20},
                                        {21, 22},
                                        {23, 24},
                                        {25, 26},
                                        {27, 28},
                                        {29, 30},
                                        {31, 32}],
                                       GroupMembers,
                                       []),
                   NewMem ++ Acc
           end,
    lists:foldl(Fun1, [], Members1).

do_match_2([], _, NewMembers) -> NewMembers;
do_match_2([{Pos1, Pos2} | T], Members, NewMembers) ->
    Role1 = lists:keyfind(Pos1,
                          #gold_league_zone_role.match_num,
                          Members),
    Role2 = lists:keyfind(Pos2,
                          #gold_league_zone_role.match_num,
                          Members),
    case {Role1, Role2} of
        {false, false} -> do_match_2(T, Members, NewMembers);
        {#gold_league_zone_role{status = 2},
         #gold_league_zone_role{status = 2}} ->
            do_match_2(T, Members, [{Role1, Role2} | NewMembers]);
        {#gold_league_zone_role{} = A,
         #gold_league_zone_role{status = 2} = B} ->
            logger:info("对手状态不正常 ~w",
                        [{Pos1, Pos2}],
                        gold_league,
                        1997),
            cast(self(), {auto_win, B, A}),
            do_match_2(T, Members, NewMembers);
        {#gold_league_zone_role{status = 2} = A,
         #gold_league_zone_role{} = B} ->
            logger:info("对手状态不正常 ~w",
                        [{Pos1, Pos2}],
                        gold_league,
                        2001),
            cast(self(), {auto_win, A, B}),
            do_match_2(T, Members, NewMembers);
        {#gold_league_zone_role{} = A, _} ->
            logger:info("找不到对手 ~w",
                        [{Pos1, Pos2}],
                        gold_league,
                        2005),
            cast(self(), {auto_win, A}),
            do_match_2(T, Members, NewMembers);
        {_, #gold_league_zone_role{} = B} ->
            logger:info("找不到对手 ~w",
                        [{Pos1, Pos2}],
                        gold_league,
                        2009),
            cast(self(), {auto_win, B}),
            do_match_2(T, Members, NewMembers);
        _ -> do_match_2(T, Members, NewMembers)
    end.

match_3(State = #state{members = Members}) ->
    Role1 = lists:keyfind(1,
                          #gold_league_zone_role.match_num,
                          Members),
    Role2 = lists:keyfind(2,
                          #gold_league_zone_role.match_num,
                          Members),
    Pair1 = case {Role1, Role2} of
                {false, false} ->
                    logger:info("决赛第一二个位置玩家不存在", [], gold_league, 2022),
                    [];
                {#gold_league_zone_role{status = 2},
                 #gold_league_zone_role{status = 2}} ->
                    [{Role1, Role2}];
                {#gold_league_zone_role{},
                 #gold_league_zone_role{status = 2}} ->
                    logger:info("冠军赛   位置一的状态不正常", [], gold_league, 2026),
                    cast(self(), {auto_win, Role2, Role1}),
                    [];
                {#gold_league_zone_role{status = 2},
                 #gold_league_zone_role{}} ->
                    logger:info("冠军赛   位置二的状态不正常", [], gold_league, 2029),
                    cast(self(), {auto_win, Role1, Role2}),
                    [];
                {#gold_league_zone_role{}, #gold_league_zone_role{}} ->
                    logger:info("冠军赛   一二名状态都不正常", [], gold_league, 2033),
                    cast(self(), {auto_win, Role1, Role2}),
                    [];
                {#gold_league_zone_role{}, _} ->
                    logger:info("冠军赛 自动获胜", [], gold_league, 2037),
                    cast(self(), {auto_win, Role1}),
                    [];
                {_, #gold_league_zone_role{}} ->
                    logger:info("冠军赛 自动获胜", [], gold_league, 2041),
                    cast(self(), {auto_win, Role2}),
                    [];
                _R ->
                    logger:info("决赛第一二个位置玩家不存在 ~w",
                                [_R],
                                gold_league,
                                2045),
                    []
            end,
    Role3 = lists:keyfind(3,
                          #gold_league_zone_role.match_num,
                          Members),
    Role4 = lists:keyfind(4,
                          #gold_league_zone_role.match_num,
                          Members),
    Pair2 = case {Role3, Role4} of
                {false, false} ->
                    logger:info("决赛第三四个位置玩家不存在", [], gold_league, 2051),
                    [];
                {#gold_league_zone_role{status = 2},
                 #gold_league_zone_role{status = 2}} ->
                    [{Role3, Role4}];
                {#gold_league_zone_role{},
                 #gold_league_zone_role{status = 2}} ->
                    logger:info("决赛第三名个位置玩家不存在", [], gold_league, 2055),
                    cast(self(), {auto_win, Role4, Role3}),
                    [];
                {#gold_league_zone_role{status = 2},
                 #gold_league_zone_role{}} ->
                    logger:info("决赛第四个位置玩家不存在", [], gold_league, 2058),
                    cast(self(), {auto_win, Role3, Role4}),
                    [];
                {#gold_league_zone_role{name = _AName,
                                        status = _AStatus},
                 #gold_league_zone_role{name = _BName,
                                        status = _BStatus}} ->
                    logger:info("决赛  三四名的状态都不正常 系统自动判定第三名获胜 ~ts ~w  ~ts "
                                " ~w",
                                [_AName, _AStatus, _BName, _BStatus],
                                gold_league,
                                2062),
                    cast(self(), {auto_win, Role3, Role4}),
                    [];
                {#gold_league_zone_role{}, _} ->
                    logger:info("季军赛 自动获胜", [], gold_league, 2066),
                    cast(self(), {auto_win, Role3}),
                    [];
                {_, #gold_league_zone_role{}} ->
                    logger:info("季军赛 自动获胜", [], gold_league, 2070),
                    cast(self(), {auto_win, Role4}),
                    [];
                _R1 ->
                    logger:info("决赛第三四个位置玩家不存在 ~w",
                                [_R1],
                                gold_league,
                                2074),
                    []
            end,
    MatchPair = Pair1 ++ Pair2,
    NewL = enter_1v1_map(MatchPair, State),
    State#state{members = NewL}.

enter_1v1_map(MatchPair, State = #state{members = L}) ->
    logger:debug("匹配上玩家对数  ~w",
                 [length(MatchPair)],
                 gold_league,
                 2083),
    Fun = fun ({RoleA, RoleB}, Acc) ->
                  case enter_1v1_map(RoleA, RoleB, State) of
                      {true, NRoleA, NRoleB} ->
                          Acc1 = Acc -- [RoleA, RoleB],
                          [NRoleA, NRoleB | Acc1];
                      _ -> Acc
                  end
          end,
    lists:foldl(Fun, L, MatchPair).

enter_1v1_map(A = #gold_league_zone_role{id = ARoleId,
                                         name = AName, pid = APid},
              B = #gold_league_zone_role{id = BRoleId, name = BName,
                                         pid = BPid},
              #state{map_zone = MapZoneId, map_plat = MapPlat,
                     open_mode = OpenMode, now_round = NowRound,
                     max_round = MaxRound}) ->
    logger:debug("钻石联赛战场对阵双方进入1v1比赛地图  15秒准备时间 ~w",
                 [{ARoleId, BRoleId}],
                 gold_league,
                 2099),
    case map_mgr:create(53004) of
        {ok, _MapPid, MapId} ->
            case create_1v1_block(MapId) of
                {ok, BattleIds} ->
                    erlang:send_after(5 * 1000,
                                      self(),
                                      {remove_unit, BattleIds, MapId}),
                    ok;
                _R -> skip
            end,
            Ref = erlang:send_after(20 * 1000,
                                    self(),
                                    {combat, A, B}),
            MsgA = notice:format(lang:get("你匹配到~ts, 20秒后自动进入战斗"),
                                 [{role_2, BName}]),
            MsgB = notice:format(lang:get("你匹配到~ts, 20秒后自动进入战斗"),
                                 [{role_2, AName}]),
            notice:send({pid, APid}, 1, MsgA),
            notice:send({pid, BPid}, 1, MsgB),
            Self = self(),
            role:apply(async,
                       APid,
                       {gold_league,
                        apply_enter_field,
                        [Self, OpenMode, {MapPlat, MapZoneId, MapId, left}]}),
            role:apply(async,
                       BPid,
                       {gold_league,
                        apply_enter_field,
                        [Self, OpenMode, {MapPlat, MapZoneId, MapId, right}]}),
            update_combat_time(A,
                               B,
                               date:unixtime() + 20,
                               OpenMode),
            NewA = A#gold_league_zone_role{is_combat = 1,
                                           rival_id = BRoleId, rival_pid = BPid,
                                           ref = Ref},
            NewB = B#gold_league_zone_role{is_combat = 1,
                                           rival_id = ARoleId, rival_pid = APid,
                                           ref = Ref},
            case MaxRound > 0 andalso MaxRound - NowRound =< 3 of
                true ->
                    case ets:lookup(gold_league_16_role, ARoleId) of
                        [A16Role = #gold_league{}] ->
                            gold_league_mgr:update_16_role(A16Role#gold_league{is_combat
                                                                                   =
                                                                                   1},
                                                           OpenMode);
                        _ -> ok
                    end,
                    case ets:lookup(gold_league_16_role, BRoleId) of
                        [B16Role = #gold_league{}] ->
                            gold_league_mgr:update_16_role(B16Role#gold_league{is_combat
                                                                                   =
                                                                                   1},
                                                           OpenMode);
                        _ -> ok
                    end;
                _ -> skip
            end,
            {true, NewA, NewB};
        _ -> ok
    end.

update_combat_time(#gold_league_zone_role{pid = APid,
                                          id = ARoleId},
                   #gold_league_zone_role{pid = BPid, id = BRoleId}, Time,
                   OpenMode) ->
    case gold_league_mgr:find_role(ARoleId) of
        {true, A} ->
            case gold_league_mgr:find_role(BRoleId) of
                {true, B} ->
                    logger:debug("============================",
                                 [],
                                 gold_league,
                                 2148),
                    A1 = A#gold_league{combat_time = Time},
                    B1 = B#gold_league{combat_time = Time},
                    gold_league_mgr:update_role(A1, OpenMode),
                    gold_league_mgr:update_role(B1, OpenMode),
                    role:pack_send(APid, 20019, {B1}),
                    role:pack_send(BPid, 20019, {A1}),
                    ok;
                _ -> ok
            end;
        _ -> ok
    end;
update_combat_time(_, _, _, _) -> ok.

combat(A = #gold_league_zone_role{id = ARoleId,
                                  name = AName, sex = ASex, classes = AClasses,
                                  lev = ALev, pid = APid, field_id = FieldId},
       B = #gold_league_zone_role{id = BRoleId, name = BName,
                                  sex = BSex, classes = BClasses, lev = BLev,
                                  pid = BPid},
       CrossId, StateName,
       #state{now_round = NowRound, max_round = MaxRound,
              ids = Ids, group_id = GroupId, cross_id = CrossId,
              open_mode = OpenMode}) ->
    Args = #combat_start_args{common_referee = self(),
                              ext_args =
                                  [{state_name, StateName},
                                   {role_ids, [ARoleId, BRoleId]},
                                   {open_mode, OpenMode}]},
    case {get_fighter({ARoleId, 3}),
          get_fighter({BRoleId, 3})}
        of
        {#fighter_wrap{} = _AFighterWrap,
         #fighter_wrap{} = _BFighterWarp} ->
            case combat_mgr:start_combat(114,
                                         [_AFighterWrap],
                                         [_BFighterWarp],
                                         Args)
                of
                {ok, CombatPid} ->
                    logger:debug("开始战斗 pid ~w",
                                 [CombatPid],
                                 gold_league,
                                 2178),
                    MsgA = notice:format(lang:get("你匹配到~ts, 进入战斗"),
                                         [{role_2, BName}]),
                    MsgB = notice:format(lang:get("你匹配到~ts, 进入战斗"),
                                         [{role_2, AName}]),
                    notice:send({pid, APid}, 1, MsgA),
                    notice:send({pid, BPid}, 1, MsgB),
                    CombatTime = case StateName of
                                     fight -> 4 * 60;
                                     _ -> 7 * 60
                                 end,
                    update_combat_time(A,
                                       B,
                                       date:unixtime() + CombatTime,
                                       OpenMode),
                    Ref = erlang:send_after(CombatTime * 1000,
                                            CombatPid,
                                            stop_result),
                    WarCombat = #gold_league_combat{pid = CombatPid,
                                                    field_id = FieldId,
                                                    field_key =
                                                        {CrossId, FieldId},
                                                    ref = Ref,
                                                    first_id = ARoleId,
                                                    first_name = AName,
                                                    first_classes = AClasses,
                                                    first_sex = ASex,
                                                    first_lev = ALev,
                                                    second_id = BRoleId,
                                                    second_name = BName,
                                                    second_lev = BLev,
                                                    second_sex = BSex,
                                                    second_classes = BClasses,
                                                    cross_id = CrossId,
                                                    group_id = GroupId,
                                                    ids = Ids},
                    gold_league_mgr:update_combat(WarCombat),
                    NewA = A#gold_league_zone_role{is_combat = 2,
                                                   combat_pid = CombatPid},
                    NewB = B#gold_league_zone_role{is_combat = 2,
                                                   combat_pid = CombatPid},
                    case StateName of
                        fight_out when MaxRound - NowRound =< 3 ->
                            case ets:lookup(gold_league_16_role, ARoleId) of
                                [A16Role = #gold_league{}] ->
                                    gold_league_mgr:update_16_role(A16Role#gold_league{is_combat
                                                                                           =
                                                                                           2},
                                                                   OpenMode);
                                _ -> ok
                            end,
                            case ets:lookup(gold_league_16_role, BRoleId) of
                                [B16Role = #gold_league{}] ->
                                    gold_league_mgr:update_16_role(B16Role#gold_league{is_combat
                                                                                           =
                                                                                           2},
                                                                   OpenMode);
                                _ -> ok
                            end,
                            gold_league_api:push_combat_notice(ARoleId,
                                                               BRoleId,
                                                               MaxRound -
                                                                   NowRound),
                            gold_league_api:push_combat_notice(BRoleId,
                                                               ARoleId,
                                                               MaxRound -
                                                                   NowRound);
                        _ -> ok
                    end,
                    {true, NewA, NewB};
                _Err ->
                    logger:error("钻石联赛战场发起战斗失败[~w]",
                                 [_Err],
                                 gold_league,
                                 2217),
                    false
            end;
        {false, false} when StateName =:= fight ->
            logger:info("玩家 [~ts] 玩家 [~ts] 进入战斗失败 状态 ~w ~w",
                        [AName,
                         BName,
                         A#gold_league_zone_role.status,
                         A#gold_league_zone_role.is_combat],
                        gold_league,
                        2221),
            {true, A, B};
        {false, _} when StateName =:= fight ->
            logger:info("玩家 [~ts] 进入战斗失败",
                        [AName],
                        gold_league,
                        2226),
            logger:info("玩家 [~ts] 返回准备厅重新匹配",
                        [BName],
                        gold_league,
                        2227),
            NewA = A#gold_league_zone_role{status = 5},
            NewB = B#gold_league_zone_role{is_combat = 0,
                                           combat_pid = undefined,
                                           last_combat_over_time =
                                               date:unixtime() +
                                                   util:rand(25, 40)},
            MsgB = notice:format(lang:get("对手不在线,三秒后返回匹配厅重新匹配"),
                                 []),
            notice:send({pid, BPid}, 1, MsgB),
            erlang:send_after(3 * 1000, self(), {enter_back, BPid}),
            {true, NewA, NewB};
        {_, false} when StateName =:= fight ->
            logger:info("玩家 [~ts] 进入战斗失败",
                        [BName],
                        gold_league,
                        2235),
            logger:info("玩家 [~ts] 返回准备厅重新匹配",
                        [AName],
                        gold_league,
                        2236),
            NewA = A#gold_league_zone_role{is_combat = 0,
                                           combat_pid = undefined,
                                           last_combat_over_time =
                                               date:unixtime() +
                                                   util:rand(25, 40)},
            NewB = B#gold_league_zone_role{status = 5},
            MsgA = notice:format(lang:get("对手不在线,三秒后返回匹配厅重新匹配"),
                                 []),
            notice:send({pid, APid}, 1, MsgA),
            erlang:send_after(3 * 1000, self(), {enter_back, APid}),
            {true, NewA, NewB};
        {false, false} ->
            logger:info("淘汰赛阶段, [~ts] [~ts] 都不在线 ",
                        [AName, BName],
                        gold_league,
                        2244),
            case ALev > BLev of
                true ->
                    cast(self(),
                         {combat_over,
                          [#fighter{origin_id = ARoleId, pid = undefined}],
                          [#fighter{origin_id = BRoleId, pid = undefined}],
                          undefined,
                          []});
                _ ->
                    cast(self(),
                         {combat_over,
                          [#fighter{origin_id = BRoleId, pid = undefined}],
                          [#fighter{origin_id = ARoleId, pid = undefined}],
                          undefined,
                          []})
            end,
            NewA = A#gold_league_zone_role{status = 5},
            NewB = B#gold_league_zone_role{status = 5},
            {true, NewA, NewB};
        {false, _} ->
            logger:info("淘汰赛阶段, [~ts] 不在线 ",
                        [AName],
                        gold_league,
                        2253),
            cast(self(),
                 {combat_over,
                  [#fighter{origin_id = BRoleId, pid = BPid}],
                  [#fighter{origin_id = ARoleId, pid = undefined}],
                  undefined,
                  []}),
            NewA = A#gold_league_zone_role{status = 5},
            NewB = B#gold_league_zone_role{},
            {true, NewA, NewB};
        {_, false} ->
            logger:info("淘汰赛阶段, [~ts] 不在线 ",
                        [BName],
                        gold_league,
                        2259),
            cast(self(),
                 {combat_over,
                  [#fighter{origin_id = ARoleId, pid = undefined}],
                  [#fighter{origin_id = BRoleId, pid = BPid}],
                  undefined,
                  []}),
            NewA = A#gold_league_zone_role{},
            NewB = B#gold_league_zone_role{status = 5},
            {true, NewA, NewB};
        _ ->
            logger:info("到这里是什么鬼 ~w",
                        [StateName],
                        gold_league,
                        2265),
            false
    end.

update_state(_Now, [], State) -> State;
update_state(Now,
             [{#gold_league{id = RoleId, score = Score}, Flag} | T],
             State = #state{members = Members, now_round = NowRound,
                            max_round = MaxRound, open_mode = OpenMode,
                            num = OldNum, ids = Ids, cross_id = CrossId}) ->
    case lists:keyfind(RoleId,
                       #gold_league_zone_role.id,
                       Members)
        of
        GoldLeague = #gold_league_zone_role{win_count =
                                                WinCount,
                                            combat_count = CombatCount,
                                            match_num = MatchNum,
                                            match_group_id = MatchGroupId,
                                            name = _Name} ->
            NewGoldLeague = case Flag of
                                combat_win ->
                                    GoldLeague#gold_league_zone_role{is_combat =
                                                                         0,
                                                                     combat_pid
                                                                         =
                                                                         undefined,
                                                                     last_combat_over_time
                                                                         =
                                                                         Now +
                                                                             util:rand(25,
                                                                                       40),
                                                                     status = 2,
                                                                     win_count =
                                                                         WinCount
                                                                             +
                                                                             1,
                                                                     combat_count
                                                                         =
                                                                         CombatCount
                                                                             +
                                                                             1,
                                                                     score =
                                                                         Score};
                                combat_lose ->
                                    GoldLeague#gold_league_zone_role{is_combat =
                                                                         0,
                                                                     combat_pid
                                                                         =
                                                                         undefined,
                                                                     last_combat_over_time
                                                                         =
                                                                         Now +
                                                                             util:rand(25,
                                                                                       40),
                                                                     status = 2,
                                                                     combat_count
                                                                         =
                                                                         CombatCount
                                                                             +
                                                                             1,
                                                                     score =
                                                                         Score};
                                combat_out_win ->
                                    if MaxRound - NowRound =:= 0 andalso
                                           (MatchNum =:= 1 orelse
                                                MatchNum =:= 2) ->
                                           GoldLeague#gold_league_zone_role{is_combat
                                                                                =
                                                                                0,
                                                                            combat_pid
                                                                                =
                                                                                undefined,
                                                                            match_num
                                                                                =
                                                                                round(MatchNum
                                                                                          /
                                                                                          2),
                                                                            rank
                                                                                =
                                                                                1,
                                                                            win_count
                                                                                =
                                                                                WinCount
                                                                                    +
                                                                                    1,
                                                                            combat_count
                                                                                =
                                                                                CombatCount
                                                                                    +
                                                                                    1};
                                       MaxRound - NowRound =:= 0 andalso
                                           (MatchNum =:= 3 orelse
                                                MatchNum =:= 4) ->
                                           GoldLeague#gold_league_zone_role{is_combat
                                                                                =
                                                                                0,
                                                                            combat_pid
                                                                                =
                                                                                undefined,
                                                                            match_num
                                                                                =
                                                                                round(MatchNum
                                                                                          /
                                                                                          2),
                                                                            rank
                                                                                =
                                                                                3,
                                                                            win_count
                                                                                =
                                                                                WinCount
                                                                                    +
                                                                                    1,
                                                                            combat_count
                                                                                =
                                                                                CombatCount
                                                                                    +
                                                                                    1};
                                       MaxRound - NowRound =:= 4 ->
                                           logger:debug("胜利进入16强 ~ts ~w",
                                                        [_Name, MatchGroupId],
                                                        gold_league,
                                                        2325),
                                           GoldLeague#gold_league_zone_role{is_combat
                                                                                =
                                                                                0,
                                                                            combat_pid
                                                                                =
                                                                                undefined,
                                                                            match_num
                                                                                =
                                                                                MatchGroupId,
                                                                            pos
                                                                                =
                                                                                MatchGroupId,
                                                                            match_group_id
                                                                                =
                                                                                0,
                                                                            win_count
                                                                                =
                                                                                WinCount
                                                                                    +
                                                                                    1,
                                                                            combat_count
                                                                                =
                                                                                CombatCount
                                                                                    +
                                                                                    1};
                                       true ->
                                           logger:debug("胜利进入下一轮 ~w",
                                                        [{MaxRound,
                                                          NowRound,
                                                          MatchNum,
                                                          round(MatchNum / 2)}],
                                                        gold_league,
                                                        2331),
                                           GoldLeague#gold_league_zone_role{is_combat
                                                                                =
                                                                                0,
                                                                            combat_pid
                                                                                =
                                                                                undefined,
                                                                            match_num
                                                                                =
                                                                                round(MatchNum
                                                                                          /
                                                                                          2),
                                                                            win_count
                                                                                =
                                                                                WinCount
                                                                                    +
                                                                                    1,
                                                                            combat_count
                                                                                =
                                                                                CombatCount
                                                                                    +
                                                                                    1}
                                    end;
                                combat_out_lose ->
                                    if MaxRound - NowRound =:= 0 andalso
                                           (MatchNum =:= 1 orelse
                                                MatchNum =:= 2) ->
                                           logger:info("失败 获得第二名 ~ts ~w",
                                                       [_Name, MatchNum],
                                                       gold_league,
                                                       2340),
                                           GoldLeague#gold_league_zone_role{is_combat
                                                                                =
                                                                                0,
                                                                            combat_pid
                                                                                =
                                                                                undefined,
                                                                            rank
                                                                                =
                                                                                2,
                                                                            is_lose
                                                                                =
                                                                                1,
                                                                            lose_round
                                                                                =
                                                                                NowRound,
                                                                            win_count
                                                                                =
                                                                                WinCount
                                                                                    +
                                                                                    1,
                                                                            combat_count
                                                                                =
                                                                                CombatCount
                                                                                    +
                                                                                    1,
                                                                            is_out
                                                                                =
                                                                                1};
                                       MaxRound - NowRound =:= 0 andalso
                                           (MatchNum =:= 3 orelse
                                                MatchNum =:= 4) ->
                                           logger:info("失败 获得第四名 ~ts ~w",
                                                       [_Name, MatchNum],
                                                       gold_league,
                                                       2346),
                                           GoldLeague#gold_league_zone_role{is_combat
                                                                                =
                                                                                0,
                                                                            combat_pid
                                                                                =
                                                                                undefined,
                                                                            rank
                                                                                =
                                                                                4,
                                                                            is_lose
                                                                                =
                                                                                1,
                                                                            win_count
                                                                                =
                                                                                WinCount
                                                                                    +
                                                                                    1,
                                                                            combat_count
                                                                                =
                                                                                CombatCount
                                                                                    +
                                                                                    1,
                                                                            is_out
                                                                                =
                                                                                1};
                                       MaxRound - NowRound =:= 1 andalso
                                           (MatchNum =:= 1 orelse
                                                MatchNum =:= 2) ->
                                           logger:info("失败 获得三四名争夺资格 ~ts ~w",
                                                       [_Name, MatchNum],
                                                       gold_league,
                                                       2352),
                                           GoldLeague#gold_league_zone_role{is_combat
                                                                                =
                                                                                0,
                                                                            combat_pid
                                                                                =
                                                                                undefined,
                                                                            match_num
                                                                                =
                                                                                round(MatchNum
                                                                                          /
                                                                                          2)
                                                                                    +
                                                                                    2,
                                                                            is_lose
                                                                                =
                                                                                1,
                                                                            lose_round
                                                                                =
                                                                                NowRound,
                                                                            win_count
                                                                                =
                                                                                WinCount
                                                                                    +
                                                                                    1,
                                                                            combat_count
                                                                                =
                                                                                CombatCount
                                                                                    +
                                                                                    1};
                                       MaxRound - NowRound =:= 1 andalso
                                           (MatchNum =:= 3 orelse
                                                MatchNum =:= 4) ->
                                           logger:info("失败 获得三四名争夺资格 ~ts ~w",
                                                       [_Name, MatchNum],
                                                       gold_league,
                                                       2358),
                                           GoldLeague#gold_league_zone_role{is_combat
                                                                                =
                                                                                0,
                                                                            combat_pid
                                                                                =
                                                                                undefined,
                                                                            is_lose
                                                                                =
                                                                                1,
                                                                            lose_round
                                                                                =
                                                                                NowRound,
                                                                            match_num
                                                                                =
                                                                                round(MatchNum
                                                                                          /
                                                                                          2)
                                                                                    +
                                                                                    2,
                                                                            win_count
                                                                                =
                                                                                WinCount
                                                                                    +
                                                                                    1,
                                                                            combat_count
                                                                                =
                                                                                CombatCount
                                                                                    +
                                                                                    1};
                                       true ->
                                           Rank = if MaxRound - NowRound =:=
                                                         2 ->
                                                         5;
                                                     MaxRound - NowRound =:=
                                                         3 ->
                                                         6;
                                                     MaxRound - NowRound =:=
                                                         4 ->
                                                         7;
                                                     MaxRound - NowRound =:=
                                                         5 ->
                                                         8;
                                                     true -> 9
                                                  end,
                                           logger:debug("失败 被淘汰 ~w",
                                                        [{MaxRound,
                                                          NowRound,
                                                          MatchNum}],
                                                        gold_league,
                                                        2371),
                                           GoldLeague#gold_league_zone_role{is_combat
                                                                                =
                                                                                0,
                                                                            combat_pid
                                                                                =
                                                                                undefined,
                                                                            is_lose
                                                                                =
                                                                                1,
                                                                            lose_round
                                                                                =
                                                                                NowRound,
                                                                            match_num
                                                                                =
                                                                                0,
                                                                            rank
                                                                                =
                                                                                Rank,
                                                                            win_count
                                                                                =
                                                                                WinCount
                                                                                    +
                                                                                    1,
                                                                            combat_count
                                                                                =
                                                                                CombatCount
                                                                                    +
                                                                                    1,
                                                                            is_out
                                                                                =
                                                                                1}
                                    end;
                                {login, Pid} ->
                                    logger:error("钻石联赛玩家重登录 ~ts",
                                                 [_Name],
                                                 gold_league,
                                                 2378),
                                    GoldLeague#gold_league_zone_role{status = 2,
                                                                     pid = Pid};
                                logout ->
                                    logger:error("钻石联赛玩家下线 ~ts",
                                                 [_Name],
                                                 gold_league,
                                                 2381),
                                    GoldLeague#gold_league_zone_role{status = 4,
                                                                     pid =
                                                                         undefined};
                                leave ->
                                    GoldLeague#gold_league_zone_role{status = 3,
                                                                     pid =
                                                                         undefined};
                                _ ->
                                    GoldLeague#gold_league_zone_role{is_combat =
                                                                         0,
                                                                     combat_pid
                                                                         =
                                                                         undefined,
                                                                     last_combat_over_time
                                                                         =
                                                                         Now +
                                                                             util:rand(25,
                                                                                       40)}
                            end,
            NewMembers = lists:keystore(RoleId,
                                        #gold_league_zone_role.id,
                                        Members,
                                        NewGoldLeague),
            check_round_over(NewMembers, Flag),
            case Flag =:= combat_out_win andalso
                     MaxRound - NowRound =< 4
                     orelse
                     Flag =:= combat_out_lose andalso MaxRound - NowRound < 4
                of
                true ->
                    GoldLeagueRole = to_gole_league_role(NewGoldLeague),
                    gold_league_mgr:update_16_role(GoldLeagueRole,
                                                   OpenMode);
                _ -> ok
            end,
            NewNum = case Flag =:= combat_out_lose andalso
                              MaxRound - NowRound =/= 1
                         of
                         true -> max(OldNum - 1, 0);
                         _ -> OldNum
                     end,
            NewState = State#state{members = NewMembers,
                                   num = NewNum},
            case NewNum =/= OldNum of
                true -> push_role_num(NewState);
                _ -> ok
            end,
            case Flag =:= combat_out_win andalso
                     MaxRound - NowRound =:= 0 andalso
                         (MatchNum =:= 1 orelse MatchNum =:= 2)
                of
                true ->
                    logger:info("推送冠军展示 ~w", [Ids], gold_league, 2411),
                    case gold_league_mgr:find_role(RoleId) of
                        {true, ChampGoldLeague} ->
                            logger:info("推送冠军展示 ~w",
                                        [{CrossId, Ids}],
                                        gold_league,
                                        2414),
                            case CrossId of
                                0 ->
                                    role_group:pack_send(world,
                                                         20023,
                                                         {[ChampGoldLeague],
                                                          Ids});
                                _ ->
                                    gold_league_utils:run_mfa({cross_id,
                                                               CrossId},
                                                              role_group,
                                                              pack_send,
                                                              [world,
                                                               20023,
                                                               {[ChampGoldLeague],
                                                                Ids}])
                            end;
                        _ -> ok
                    end;
                _ -> ok
            end,
            logger:debug("战斗结算flag ~w 剩余轮次 ~w 剩余人数 ~w, ",
                         [Flag, MaxRound - NowRound, NewNum],
                         gold_league,
                         2425),
            update_state(Now, T, NewState);
        _ -> update_state(Now, T, State)
    end;
update_state(Now, [_ | T], State) ->
    update_state(Now, T, State).

check_round_over(Members, Flag)
    when Flag =:= combat_out_win orelse
             Flag =:= combat_out_lose ->
    Roles = [Role
             || Role = #gold_league_zone_role{is_combat = IsCombat}
                    <- Members,
                IsCombat > 0],
    case Roles of
        [] -> erlang:send_after(10 * 1000, self(), round_over);
        _ -> skip
    end;
check_round_over(_, _) -> skip.

get_next_state(#state{now_round = NowRound,
                      max_round = MaxRound}) ->
    case NowRound >= MaxRound of
        true -> {active_over, 0};
        _ ->
            case MaxRound - NowRound =< 4 of
                true -> {fight_guess, 60 * 2};
                _ -> {fight_out, 60 * 8}
            end
    end.

fight(timeout,
      #state{members = Members, cross_id = CrossId,
             group_id = GroupId, ids = Ids} =
          State) ->
    NormalMembers = [ZoneRole
                     || ZoneRole = #gold_league_zone_role{status = 2}
                            <- Members],
    logger:info("钻石联赛 cross_id ~w  group_id ~w组资格赛结束",
                [CrossId, GroupId],
                gold_league,
                2472),
    RiseNum = get_rise_num(Members),
    Members1 =
        lists:reverse(lists:keysort(#gold_league_zone_role.score,
                                    lists:keysort(#gold_league_zone_role.fc,
                                                  NormalMembers))),
    Members2 = lists:sublist(Members1, RiseNum),
    async_apply(Members -- Members2,
                apply_exit,
                fight_lose),
    GroupNum = get_group_num(RiseNum),
    NewMembers = sort_group(Members2, GroupNum),
    MaxRound = get_max_round(RiseNum),
    NowRound = 1,
    State1 = State#state{max_round = MaxRound,
                         now_round = NowRound, members = NewMembers},
    State2 = fight_out_match(State1),
    case CrossId of
        0 ->
            notice:cast(all,
                        7,
                        notice:format(lang:get("~ts资格赛阶段正式结束，恭喜晋级淘汰赛的选手，冠军花落谁家我们拭目以待{face_1,29}"),
                                      [{string_2, 1, lang:get("钻石联赛")}]));
        _ ->
            gold_league_utils:run_mfa({cross_id, CrossId},
                                      notice,
                                      cast,
                                      [all,
                                       7,
                                       notice:format(lang:get("~ts资格赛阶段正式结束，恭喜晋级淘汰赛的选手，冠军花落谁家我们拭目以待{face_1,29}"),
                                                     [{string_2,
                                                       1,
                                                       lang:get("钻石联赛")}])])
    end,
    gold_league_mgr:update_state(#gold_league_state{ids =
                                                        Ids,
                                                    key = {CrossId, GroupId},
                                                    cross_id = CrossId,
                                                    group_id = GroupId,
                                                    state_name = fight_out,
                                                    end_time =
                                                        date:unixtime() +
                                                            60 * 8,
                                                    phase =
                                                        gold_league_mgr:phase_enum(fight_out),
                                                    now_round = NowRound,
                                                    max_round = MaxRound}),
    continue(fight_out,
             State2#state{ts = erlang:now(), timeout = 60 * 8,
                          end_time = date:unixtime() + 60 * 8,
                          num = length(NewMembers)});
fight(_Event, State) -> continue(fight, State).

fight_out(timeout,
          State = #state{members = Members, now_round = NowRound,
                         max_round = MaxRound, group_id = GroupId,
                         cross_id = CrossId, ids = Ids}) ->
    Result = get_next_state(State),
    logger:info("=======下个阶段=====~w",
                [{NowRound, MaxRound, Result, Ids}],
                gold_league,
                2501),
    case Result of
        {fight_guess, Time} ->
            gold_league_api:clean_guess_role(CrossId, Ids),
            notice_cast(NowRound, MaxRound, CrossId, Ids),
            NewState = State#state{ts = erlang:now(),
                                   timeout = Time, now_round = NowRound + 1,
                                   end_time = date:unixtime() + Time},
            gold_league_mgr:update_state(#gold_league_state{ids =
                                                                Ids,
                                                            key =
                                                                {CrossId,
                                                                 GroupId},
                                                            cross_id = CrossId,
                                                            group_id = GroupId,
                                                            state_name =
                                                                fight_guess,
                                                            end_time =
                                                                date:unixtime()
                                                                    + Time,
                                                            phase =
                                                                gold_league_mgr:phase_enum(fight_guess),
                                                            now_round =
                                                                NowRound + 1,
                                                            max_round =
                                                                MaxRound}),
            continue(fight_guess, NewState);
        {fight_out, Time} ->
            NewState = fight_out_match(State),
            NewState1 = NewState#state{ts = erlang:now(),
                                       timeout = Time, now_round = NowRound + 1,
                                       end_time = date:unixtime() + Time},
            gold_league_mgr:update_state(#gold_league_state{ids =
                                                                Ids,
                                                            key =
                                                                {CrossId,
                                                                 GroupId},
                                                            cross_id = CrossId,
                                                            group_id = GroupId,
                                                            state_name =
                                                                fight_out,
                                                            end_time =
                                                                date:unixtime()
                                                                    + Time,
                                                            phase =
                                                                gold_league_mgr:phase_enum(fight_out),
                                                            now_round =
                                                                NowRound + 1,
                                                            max_round =
                                                                MaxRound}),
            continue(fight_out, NewState1);
        {active_over, _} ->
            gold_league_mgr:update_state(#gold_league_state{ids =
                                                                Ids,
                                                            key =
                                                                {CrossId,
                                                                 GroupId},
                                                            cross_id = CrossId,
                                                            group_id = GroupId,
                                                            state_name = show,
                                                            end_time =
                                                                date:unixtime(),
                                                            phase =
                                                                gold_league_mgr:phase_enum(show),
                                                            max_round =
                                                                MaxRound,
                                                            now_round =
                                                                MaxRound}),
            case CrossId of
                0 ->
                    notice:cast(all,
                                7,
                                notice:format(lang:get("~ts已正式结束，恭喜~ts夺得~ts冠亚季军，掌声雷动{face_1,18}"),
                                              [{string_2, 1, lang:get("钻石联赛")},
                                               {string_1,
                                                gold_league_utils:get_top_three_name(Members)},
                                               {string_2,
                                                1,
                                                gold_league_data:group_name(GroupId)}]));
                _ ->
                    gold_league_utils:run_mfa({cross_id, CrossId},
                                              notice,
                                              cast,
                                              [all,
                                               7,
                                               notice:format(lang:get("~ts已正式结束，恭喜~ts夺得~ts冠亚季军，掌声雷动{face_1,18}"),
                                                             [{string_2,
                                                               1,
                                                               lang:get("钻石联赛")},
                                                              {string_1,
                                                               gold_league_utils:get_top_three_name(Members)},
                                                              {string_2,
                                                               1,
                                                               gold_league_data:group_name(GroupId)}])])
            end,
            gold_league_api:send_honor(Members, CrossId, GroupId),
            {stop, normal, State}
    end;
fight_out(_Event, State) ->
    logger:debug("淘汰赛", [], gold_league, 2531),
    continue(fight_out, State).

fight_guess(timeout,
            State = #state{now_round = NowRound,
                           max_round = MaxRound, cross_id = CrossId,
                           group_id = GroupId, ids = Ids}) ->
    logger:debug("竞猜结束  进入战斗 ~w",
                 [{NowRound, MaxRound}],
                 gold_league,
                 2536),
    NewState = fight_out_match(State),
    NewState1 = NewState#state{end_time =
                                   date:unixtime() + 60 * 8},
    push_phase_to_members(NewState1, fight_out),
    gold_league_mgr:update_state(#gold_league_state{ids =
                                                        Ids,
                                                    key = {CrossId, GroupId},
                                                    cross_id = CrossId,
                                                    group_id = GroupId,
                                                    state_name = fight_out,
                                                    end_time =
                                                        date:unixtime() +
                                                            60 * 8,
                                                    phase =
                                                        gold_league_mgr:phase_enum(fight_out),
                                                    max_round = MaxRound,
                                                    now_round = NowRound}),
    continue(fight_out,
             NewState#state{ts = erlang:now(), timeout = 60 * 8});
fight_guess(_Event, State) ->
    continue(fight_guess, State).

continue(StateName,
         #state{timeout = undefined} = State) ->
    {next_state, StateName, State, infinity};
continue(StateName,
         #state{event = self, ts = Ts, timeout = Timeout} =
             State) ->
    {next_state,
     StateName,
     State,
     util:time_left(Timeout * 1000, Ts)};
continue(StateName, State) ->
    {next_state, StateName, State, infinity}.

continue(StateName, Reply,
         #state{timeout = undefined} = State) ->
    {reply, Reply, StateName, State, infinity};
continue(StateName, Reply,
         #state{event = self, ts = Ts, timeout = Timeout} =
             State) ->
    {reply,
     Reply,
     StateName,
     State,
     util:time_left(Timeout * 1000, Ts)};
continue(StateName, Reply, State) ->
    {reply, Reply, StateName, State, infinity}.

notice_cast(NowRound, MaxRound, CrossId, Ids)
    when CrossId =:= 0 ->
    if MaxRound - NowRound =:= 4 ->
           role_group:pack_send(world,
                                20026,
                                {notice:format(lang:get("~ts已进入16强阶段，是否前往~ts？"),
                                               [{string_2, 5, lang:get("钻石联赛")},
                                                {string_2, 5, lang:get("下注")}]),
                                 Ids}),
           notice:cast(all,
                       7,
                       notice:format(lang:get("~ts淘汰赛16进8即将开始，投票支持16强选手，猜中即可获得大量钻石喔{face_1,36}"),
                                     [{string_2, 1, lang:get("钻石联赛")}]));
       MaxRound - NowRound =:= 3 ->
           role_group:pack_send(world,
                                20026,
                                {notice:format(lang:get("~ts已进入8强阶段，是否前往~ts？"),
                                               [{string_2, 5, lang:get("钻石联赛")},
                                                {string_2, 5, lang:get("下注")}]),
                                 Ids}),
           notice:cast(all,
                       7,
                       notice:format(lang:get("~ts淘汰赛8进4即将开始，投票支持8强选手，猜中即可获得大量钻石喔{face_1,36}"),
                                     [{string_2, 1, lang:get("钻石联赛")}]));
       MaxRound - NowRound =:= 2 ->
           role_group:pack_send(world,
                                20026,
                                {notice:format(lang:get("~ts已进入半决赛阶段，是否前往~ts？"),
                                               [{string_2, 5, lang:get("钻石联赛")},
                                                {string_2, 5, lang:get("下注")}]),
                                 Ids}),
           notice:cast(all,
                       7,
                       notice:format(lang:get("~ts淘汰赛半决赛即将开始，投票支持4强选手，猜中即可获得大量钻石喔{face_1,36}"),
                                     [{string_2, 1, lang:get("钻石联赛")}]));
       MaxRound - NowRound =:= 1 ->
           role_group:pack_send(world,
                                20026,
                                {notice:format(lang:get("~ts已进入决赛阶段，是否前往~ts？"),
                                               [{string_2, 5, lang:get("钻石联赛")},
                                                {string_2, 5, lang:get("下注")}]),
                                 Ids}),
           notice:cast(all,
                       7,
                       notice:format(lang:get("~ts淘汰赛决赛即将开始，冠军花落谁家，猜中即可获得大量钻石喔{face_1,36}"),
                                     [{string_2, 1, lang:get("钻石联赛")}]));
       true -> skip
    end;
notice_cast(NowRound, MaxRound, CrossId, Ids) ->
    if MaxRound - NowRound =:= 4 ->
           gold_league_utils:run_mfa({cross_id, CrossId},
                                     role_group,
                                     pack_send,
                                     [world,
                                      20026,
                                      {notice:format(lang:get("~ts已进入16强阶段，是否前往~ts？"),
                                                     [{string_2,
                                                       5,
                                                       lang:get("钻石联赛")},
                                                      {string_2,
                                                       5,
                                                       lang:get("下注")}]),
                                       Ids}]),
           gold_league_utils:run_mfa({cross_id, CrossId},
                                     notice,
                                     cast,
                                     [all,
                                      7,
                                      notice:format(lang:get("~ts淘汰赛16进8即将开始，投票支持8强选手，猜中即可获得大量钻石喔{face_1,36}"),
                                                    [{string_2,
                                                      1,
                                                      lang:get("钻石联赛")}])]);
       MaxRound - NowRound =:= 3 ->
           gold_league_utils:run_mfa({cross_id, CrossId},
                                     role_group,
                                     pack_send,
                                     [world,
                                      20026,
                                      {notice:format(lang:get("~ts已进入8强阶段，是否前往~ts？"),
                                                     [{string_2,
                                                       5,
                                                       lang:get("钻石联赛")},
                                                      {string_2,
                                                       5,
                                                       lang:get("下注")}]),
                                       Ids}]),
           gold_league_utils:run_mfa({cross_id, CrossId},
                                     notice,
                                     cast,
                                     [all,
                                      7,
                                      notice:format(lang:get("~ts淘汰赛8进4即将开始，投票支持8强选手，猜中即可获得大量钻石喔{face_1,36}"),
                                                    [{string_2,
                                                      1,
                                                      lang:get("钻石联赛")}])]);
       MaxRound - NowRound =:= 2 ->
           gold_league_utils:run_mfa({cross_id, CrossId},
                                     role_group,
                                     pack_send,
                                     [world,
                                      20026,
                                      {notice:format(lang:get("~ts已进入半决赛阶段，是否前往~ts？"),
                                                     [{string_2,
                                                       5,
                                                       lang:get("钻石联赛")},
                                                      {string_2,
                                                       5,
                                                       lang:get("下注")}]),
                                       Ids}]),
           gold_league_utils:run_mfa({cross_id, CrossId},
                                     notice,
                                     cast,
                                     [all,
                                      7,
                                      notice:format(lang:get("~ts淘汰赛半决赛即将开始，投票支持4强选手，猜中即可获得大量钻石喔{face_1,36}"),
                                                    [{string_2,
                                                      1,
                                                      lang:get("钻石联赛")}])]);
       MaxRound - NowRound =:= 1 ->
           gold_league_utils:run_mfa({cross_id, CrossId},
                                     role_group,
                                     pack_send,
                                     [world,
                                      20026,
                                      {notice:format(lang:get("~ts已进入决赛阶段，是否前往~ts？"),
                                                     [{string_2,
                                                       5,
                                                       lang:get("钻石联赛")},
                                                      {string_2,
                                                       5,
                                                       lang:get("下注")}]),
                                       Ids}]),
           gold_league_utils:run_mfa({cross_id, CrossId},
                                     notice,
                                     cast,
                                     [all,
                                      7,
                                      notice:format(lang:get("~ts淘汰赛决赛即将开始，冠军花落谁家，猜中即可获得大量钻石喔{face_1,36}"),
                                                    [{string_2,
                                                      1,
                                                      lang:get("钻石联赛")}])]);
       true -> skip
    end.

get_rise_num(Members) ->
    Num = length(Members),
    if Num >= 1024 -> 256;
       Num >= 512 -> 256;
       Num >= 256 -> 128;
       Num >= 128 -> 64;
       Num >= 64 -> 32;
       Num >= 32 -> 32;
       true -> 32
    end.

get_max_round(Num) ->
    if Num =:= 256 -> 8;
       Num =:= 128 -> 7;
       Num =:= 64 -> 6;
       Num =:= 32 -> 5;
       true ->
           logger:info("错误的人数 ~w", [Num], gold_league, 2623),
           5
    end.

get_group_num(256) -> 16;
get_group_num(128) -> 8;
get_group_num(64) -> 4;
get_group_num(32) -> 2.

sort_group(Members, GroupMaxNum) ->
    sort_group(Members, 1, GroupMaxNum, 1, []).

sort_group([], _, _, _, NewMembers) -> NewMembers;
sort_group([Role = #gold_league_zone_role{name = _Name,
                                          fc = _Fc, score = _Score}
            | T],
           NowGroupId, GroupMaxNum, GroupNum, Members)
    when NowGroupId =:= 16 ->
    MatchNum = case catch erlang:element(GroupNum,
                                         case GroupMaxNum of
                                             16 ->
                                                 {1,
                                                  9,
                                                  13,
                                                  5,
                                                  7,
                                                  15,
                                                  11,
                                                  3,
                                                  4,
                                                  12,
                                                  16,
                                                  8,
                                                  6,
                                                  14,
                                                  10,
                                                  2};
                                             8 -> {1, 8, 4, 5, 2, 7, 3, 6};
                                             4 -> {1, 4, 2, 3};
                                             2 -> {1, 2}
                                         end)
                   of
                   MatchNum0 when is_integer(MatchNum0) -> MatchNum0;
                   _ ->
                       logger:info("卧槽, 分组出错了 要死要死 ~w",
                                   [NowGroupId, GroupMaxNum, GroupNum],
                                   gold_league,
                                   2644),
                       0
               end,
    MatchGroupId = erlang:element(NowGroupId,
                                  {1,
                                   9,
                                   13,
                                   5,
                                   7,
                                   15,
                                   11,
                                   3,
                                   4,
                                   12,
                                   16,
                                   8,
                                   6,
                                   14,
                                   10,
                                   2}),
    logger:debug("玩家名字 ~ts 评分 ~w 积分 ~w 组别 ~w 位置 ~w",
                 [_Name, _Fc, _Score, MatchGroupId, GroupNum],
                 gold_league,
                 2648),
    sort_group(T,
               1,
               GroupMaxNum,
               GroupNum + 1,
               [Role#gold_league_zone_role{match_num = MatchNum,
                                           match_group_id = MatchGroupId,
                                           pos = MatchNum, rank = 0}
                | Members]);
sort_group([Role = #gold_league_zone_role{name = _Name,
                                          fc = _Fc, score = _Score}
            | T],
           NowGroupId, GroupMaxNum, GroupNum, Members) ->
    MatchNum = case catch erlang:element(GroupNum,
                                         case GroupMaxNum of
                                             16 ->
                                                 {1,
                                                  9,
                                                  13,
                                                  5,
                                                  7,
                                                  15,
                                                  11,
                                                  3,
                                                  4,
                                                  12,
                                                  16,
                                                  8,
                                                  6,
                                                  14,
                                                  10,
                                                  2};
                                             8 -> {1, 8, 4, 5, 2, 7, 3, 6};
                                             4 -> {1, 4, 2, 3};
                                             2 -> {1, 2}
                                         end)
                   of
                   MatchNum0 when is_integer(MatchNum0) -> MatchNum0;
                   _ ->
                       logger:info("卧槽, 分组出错了 要死要死 ~w",
                                   [NowGroupId, GroupMaxNum, GroupNum],
                                   gold_league,
                                   2655),
                       0
               end,
    MatchGroupId = erlang:element(NowGroupId,
                                  {1,
                                   9,
                                   13,
                                   5,
                                   7,
                                   15,
                                   11,
                                   3,
                                   4,
                                   12,
                                   16,
                                   8,
                                   6,
                                   14,
                                   10,
                                   2}),
    logger:debug("玩家名字 ~ts 评分 ~w 积分 ~w 组别 ~w 位置 ~w",
                 [_Name, _Fc, _Score, MatchGroupId, GroupNum],
                 gold_league,
                 2659),
    sort_group(T,
               NowGroupId + 1,
               GroupMaxNum,
               GroupNum,
               [Role#gold_league_zone_role{match_num = MatchNum,
                                           match_group_id = MatchGroupId,
                                           pos = MatchNum, rank = 0}
                | Members]).

stop_combat() ->
    List = ets:tab2list(gold_league_fields),
    [Pid ! stop_combat
     || #gold_league_field{pid = Pid} <- List].

do_stop_combat() ->
    List = ets:tab2list(gold_league_combat),
    [Pid ! stop_result
     || #gold_league_combat{pid = Pid} <- List],
    ets:delete_all_objects(gold_league_combat).

get_fighter({RoleId = {Rid, Platform, ZoneId},
             TryNum}) ->
    case cross:call(Platform,
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
                         gold_league,
                         2679),
            false;
        {ok, Fw = #fighter_wrap{s_event = 53}} -> Fw;
        {ok,
         Fw = #fighter_wrap{s_event = _Event = 54,
                            status = _Status}} ->
            logger:error("角色[~w]在~w中~w转换",
                         [RoleId, _Status, _Event],
                         gold_league,
                         2684),
            Fw;
        {ok,
         Fw = #fighter_wrap{s_event = _Event = 52,
                            status = _Status, combat_type = _CType}} ->
            logger:error("角色[~w]在~w中~w转换",
                         [RoleId, _Status, {_Event, _CType}],
                         gold_league,
                         2687),
            Fw;
        {ok,
         #fighter_wrap{status = _Status, s_event = _Event}} ->
            logger:error("角色[~w]在~w中~w无法转换",
                         [RoleId, _Status, _Event],
                         gold_league,
                         2690),
            false;
        {error, timeout} ->
            case TryNum >= 3 of
                false ->
                    logger:debug("角色转换[~w]超时, 正在重试第~w次",
                                 [RoleId, TryNum + 1],
                                 gold_league,
                                 2695),
                    get_fighter({RoleId, TryNum + 1});
                true ->
                    logger:error("角色转换[~w]仍然超时,不再尝试",
                                 [RoleId],
                                 gold_league,
                                 2698),
                    false
            end;
        {error, not_found} ->
            logger:error("角色掉线[~w], 无法转换",
                         [RoleId],
                         gold_league,
                         2702),
            false;
        _Err ->
            logger:error("角色转换[~w]错误：~w",
                         [RoleId, _Err],
                         gold_league,
                         2705),
            false
    end;
get_fighter(_Args) ->
    logger:error("角色转换错误参数：~w", [_Args], gold_league, 2709),
    false.

