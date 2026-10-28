-file("src/mod/warrior/warrior.erl", 1).

-module(warrior).

-behaviour(gen_fsm).

-export([start_link/7,
         cast/2,
         call/2,
         combat_over/1,
         apply_enter_field/5,
         apply_exit/2,
         apply_lose/2,
         apply_win/2,
         click/2,
         logout_field/2,
         add_buff_score/2,
         apply_gain_magic_buff/2,
         apply_del_magic_buff/2,
         apply_settlement_reward/2,
         enter_field/2,
         exit_warrior_field/1,
         sync_phase/2,
         get_magic_buff/2,
         get_field_info/2,
         exchange_score/2,
         get_win_box_var/1,
         role_camp_looks/2,
         clean_buff/1,
         last_enter_field/2,
         apply_last_enter_field/4,
         die_leave_zone/1]).

-export([init/1,
         handle_event/3,
         handle_sync_event/4,
         handle_info/3,
         terminate/3,
         code_change/4]).

-export([fight/2, settlement/2, reward/2]).

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

-file("src/mod/warrior/warrior.erl", 52).

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

-file("src/mod/warrior/warrior.erl", 53).

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

-file("src/mod/warrior/warrior.erl", 54).

-file("inc/warrior.hrl", 1).

-record(warrior_ready_zone,
        {cross_id = 0,
         map_id = 0 :: non_neg_integer(),
         map_zone = 0,
         map_plat = "",
         map_pid :: pid() | undefined,
         member_size = 0 :: non_neg_integer(),
         group_id = 0 :: pos_integer(),
         exit_npc,
         combat_mode = 1,
         init_combat_mode = 0}).

-record(warrior_zone,
        {cross_id = 0,
         id = 0,
         key,
         group_id = 0 :: pos_integer(),
         seq_id = 0,
         pid,
         is_close = 0}).

-record(warrior_field,
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
         green_num = 0,
         green_score = 0,
         white_num = 0,
         white_score = 0,
         phase = 0,
         combat_mode = 1}).

-record(warrior_zone_role,
        {id,
         pid,
         name = "",
         sex = 0,
         classes = 0,
         lev = 0 :: non_neg_integer(),
         group_id = 0 :: pos_integer(),
         field_id = 0,
         camp = 0,
         revive = 0,
         status = 0,
         is_combat = 0,
         combat_pid,
         last_combat_over_time = 0,
         last_role_id,
         win_count = 0,
         combat_count = 0,
         score = 0,
         cross_id = 0}).

-record(warrior,
        {id ::
             undefined |
             {pos_integer(), bitstring(), non_neg_integer()},
         pid :: pid() | undefined,
         name = "" :: string(),
         sex = 0,
         classes = 0,
         face_id = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         fc = 0 :: non_neg_integer(),
         group_id = 0 :: pos_integer(),
         kill = 0 :: non_neg_integer(),
         multi_kill = 0 :: non_neg_integer(),
         score = 0 :: non_neg_integer(),
         rank = 0 :: pos_integer(),
         revive = 0 :: non_neg_integer(),
         death = 0 :: non_neg_integer(),
         multi_death = 0 :: non_neg_integer(),
         dead_time = 0 :: non_neg_integer(),
         camp = 0,
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
         magic_buff = [] :: list(),
         status = 0,
         looks = [],
         cross_id = 0,
         combat_mode = 1}).

-record(warrior_group_data,
        {id = 0, name = "", order = 0, members = []}).

-record(warrior_win_item_data,
        {base_id = 0,
         weight = 0,
         max = 0,
         is_notice = 0,
         num = 0}).

-record(warrior_drop_item_data,
        {base_id = 0,
         weight = 0,
         result = 0,
         is_notice = 0,
         num = 0}).

-record(warrior_scene_unit,
        {battle_id = 0,
         type = 0,
         sub_type = 0,
         buff_id = 0,
         spec_id = 0,
         item_base_id = 0,
         unit_base_id = 0,
         field_id = 0}).

-record(warrior_buff_data,
        {buff_id = 0, type = 0, unit_base_id = 0, name = ""}).

-record(warrior_magic_buff,
        {buff_id = 0,
         name = "",
         status = 0,
         type = 0,
         x = 0,
         y = 0,
         time = 0,
         owner_id,
         owner_name = "",
         next_owner_id,
         next_owner_pid,
         camp = 0}).

-record(warrior_combat, {pid, field_id = 0, field_key}).

-record(warrior_timer_data,
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

-record(warrior_combat_result,
        {field_pid,
         lose_buff = 0,
         win_buff = 0,
         takeover = false,
         round = 0}).

-record(warrior_combat_win,
        {field_pid,
         lose_buff = 0,
         win_buff = 0,
         takeover = false,
         score = 0,
         round = 0,
         id,
         name,
         camp = 0,
         wish_buff = 0}).

-record(warrior_combat_lose,
        {field_pid,
         lose_buff = 0,
         win_buff = 0,
         takeover = false,
         score = 0,
         round = 0,
         id,
         name,
         camp = 0,
         revive = 0}).

-record(warrior_embattle,
        {role_id = {0, "", 0}, pets = [], guards = []}).

-record(warrior_rank_reward_data,
        {group = 0,
         min = 0,
         max = 0,
         items = [],
         title = "",
         content = ""}).

-file("src/mod/warrior/warrior.erl", 55).

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

-file("src/mod/warrior/warrior.erl", 56).

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

-file("src/mod/warrior/warrior.erl", 57).

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

-file("src/mod/warrior/warrior.erl", 58).

-file("inc/looks.hrl", 1).

-file("src/mod/warrior/warrior.erl", 59).

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

-file("src/mod/warrior/warrior.erl", 60).

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

-file("src/mod/warrior/warrior.erl", 61).

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

-file("src/mod/warrior/warrior.erl", 62).

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

-file("src/mod/warrior/warrior.erl", 63).

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

-file("src/mod/warrior/warrior.erl", 64).

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

-file("src/mod/warrior/warrior.erl", 65).

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
         magic_buff = [],
         green_camp = [],
         green_num = 0,
         green_score = 0,
         white_camp = [],
         white_num = 0,
         white_score = 0,
         win_box = [],
         unit_ids = [],
         rank,
         event = mgr,
         ts,
         timeout,
         match_time = 0,
         camp_radio = 1,
         open_mode = 1,
         cross_id = 0,
         combat_mode = 1}).

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

camp_name(2) -> lang:get("白虎");
camp_name(1) -> lang:get("青龙");
camp_name(_) -> lang:get("未知阵营").

click(_BattleId, #role{s_action = 5}) ->
    {false, lang:get("死亡状态下，无法进行采集")};
click(_BattleId, #role{m_combat = #m_combat{pid = Pid}})
    when is_pid(Pid) ->
    {false, lang:get("战斗中，无法采集")};
click(BattleId, Role = #role{id = Rid}) ->
    case warrior_mgr:find_role(Rid) of
        {true, Warrior = #warrior{cross_id = CrossId}} ->
            case warrior_mgr:find_unit(CrossId, BattleId) of
                {true, Unit = #warrior_scene_unit{type = 2}} ->
                    click_buff(Unit, Warrior, Role);
                {true, Unit = #warrior_scene_unit{type = 3}} ->
                    click_win_box(Unit, Warrior, Role);
                {true, Unit = #warrior_scene_unit{type = 1}} ->
                    click_spec_effect(Unit, Warrior, Role);
                _ -> {false, lang:get("很遗憾，被人抢先一步")}
            end;
        _ -> {false, lang:get("很遗憾，被人抢先一步")}
    end.

click_spec_effect(#warrior_scene_unit{type = Type,
                                      sub_type = SubType, battle_id = BattleId},
                  #warrior{field_pid = FieldPid},
                  Role = #role{id = Rid}) ->
    case call(FieldPid,
              {click, BattleId, Type, SubType, Rid})
        of
        ok -> spec_effect(SubType, Role);
        _False -> {false, lang:get("被人抢先一步")}
    end.

spec_effect(1, Role = #role{hp_max = HpMax, hp = Hp}) ->
    case Hp =/= HpMax of
        true ->
            Rand = util:rand(10, 40),
            AddHp = util:floor(HpMax * Rand / 100),
            NewHp = erlang:min(AddHp + Hp, HpMax),
            NoticeHp = erlang:min(AddHp, HpMax - Hp),
            HPRole = Role#role{hp = NewHp},
            Msg = notice:format(lang:get("拾取成功，恢复血量~ts"),
                                [{string_2, 6, NoticeHp}]),
            {ok, {1, Msg}, attr:calc_and_push(HPRole)};
        _ ->
            Msg = lang:get("当前血量已满"),
            {ok, {1, Msg}, Role}
    end;
spec_effect(2, #role{}) ->
    Msg = lang:get("采集成功，复活次数+1"),
    {ok, {1, Msg}};
spec_effect(_, _Role) ->
    {false, lang:get("很遗憾，被人抢先一步")}.

click_buff(#warrior_scene_unit{buff_id = BuffId,
                               battle_id = BattleId, type = Type,
                               sub_type = SubType},
           Warrior = #warrior{magic_buff = MagicBuffs}, Role)
    when SubType =:= 2 orelse SubType =:= 3 ->
    case MagicBuffs of
        [] ->
            role:send_buff_begin(),
            case buff:add(Role, BuffId) of
                {ok, BuffRole} ->
                    case use_magic_buff(BuffRole,
                                        Warrior,
                                        BuffId,
                                        BattleId,
                                        Type)
                        of
                        {ok, MagicRole} ->
                            role:send_buff_flush(),
                            LooksRole = calc_looks(MagicRole, Warrior),
                            looks:update_looks(Role, LooksRole),
                            {ok, LooksRole};
                        False ->
                            role:send_buff_clean(),
                            False
                    end;
                _ ->
                    role:send_buff_clean(),
                    {false, lang:get("无法采集")}
            end;
        [OwnBuffId] ->
            OwnBuffName = warrior_data:buff_name(OwnBuffId),
            Msg = notice:format(lang:get("当前已拥有~ts，无法采集"),
                                [{string_2, 1, OwnBuffName}]),
            {false, Msg};
        _ -> {false, lang:get("无法采集")}
    end;
click_buff(#warrior_scene_unit{buff_id = BuffId,
                               battle_id = BattleId, type = Type,
                               sub_type = SubType},
           #warrior{field_pid = FieldPid},
           Role = #role{id = Rid}) ->
    role:send_buff_begin(),
    case buff:add(Role, BuffId) of
        {ok, BuffRole} ->
            case call(FieldPid,
                      {click, BattleId, Type, SubType, Rid})
                of
                ok ->
                    role:send_buff_flush(),
                    {ok,
                     {1, lang:get("采集成功")},
                     attr:calc_and_push(BuffRole)};
                _ ->
                    role:send_buff_clean(),
                    {false, lang:get("无法使用buff")}
            end;
        {false, Msg} ->
            role:send_buff_clean(),
            {false, Msg};
        _ ->
            role:send_buff_clean(),
            {false, lang:get("无法采集")}
    end.

use_magic_buff(Role = #role{id = Rid, name = Name},
               #warrior{field_pid = FieldPid}, BuffId, BattleId,
               _Type) ->
    case call(FieldPid,
              {click_magic_buff, Rid, Name, BuffId, BattleId})
        of
        ok ->
            Timer = #timer{id = warrior_buff_score,
                           timeout = 30 * 1000, m = warrior, f = add_buff_score,
                           a = [BuffId]},
            TimerRole = role_timer:set(Timer, Role),
            {ok, TimerRole};
        False -> False
    end.

add_buff_score(Role = #role{id = Rid, name = _Name},
               BuffId) ->
    case warrior_data:get_magic_buff(BuffId) of
        {BuffName, Score} ->
            case warrior_mgr:find_role(Rid) of
                {true, #warrior{field_pid = Pid}} ->
                    Fmt = lang:get("获得~ts加成~ts功勋"),
                    Args = [{string_2, 1, BuffName}, {string_2, 5, Score}],
                    Msg = notice:format(Fmt, Args),
                    notice:send(Role, 7, Msg),
                    cast(Pid, {add_buff_score, Rid, Score}),
                    ok;
                _False -> ok
            end;
        _False -> ok
    end,
    keep.

click_win_box(#warrior_scene_unit{battle_id = BattleId,
                                  item_base_id = ItemBaseId, type = Type,
                                  sub_type = SubType},
              #warrior{field_pid = FieldPid},
              Role = #role{s_event = 11, id = Rid, name = _Name}) ->
    case warrior_data:win_item(ItemBaseId) of
        Data = #warrior_win_item_data{} ->
            role:send_buff_begin(),
            case pick_win_box(Data, Role) of
                {ok, Reply, BoxRole} ->
                    case call(FieldPid,
                              {click, BattleId, Type, SubType, Rid})
                        of
                        ok ->
                            role:send_buff_flush(),
                            case apply_exit(BoxRole, win) of
                                ok ->
                                    logger:error("[~ts]拾取宝箱成功，但退出失败",
                                                 [_Name],
                                                 warrior,
                                                 358),
                                    {ok, {1, Reply}, BoxRole};
                                {ok, NewRole} -> {ok, {1, Reply}, NewRole}
                            end;
                        _ ->
                            role:send_buff_clean(),
                            {false, lang:get("被人抢先一步")}
                    end;
                False ->
                    role:send_buff_clean(),
                    False
            end;
        _False -> {false, lang:get("无法拾取宝箱")}
    end;
click_win_box(_BattleId, _Warrior, _Role) ->
    {false, lang:get("无法拾取宝箱")}.

get_win_box_var(Role) ->
    {ok, var:get_var(Role, other, 2001, 0)}.

pick_win_box(#warrior_win_item_data{base_id = BaseId,
                                    is_notice = IsNotice, num = Num},
             Role = #role{name = Name}) ->
    NewBaseId = item_type:special_id(BaseId),
    Gain = [#gain{label = item_base_id,
                  val = [{NewBaseId, 0, Num}]}],
    case role_gain:do(Gain, Role) of
        {ok, GainRole} ->
            GainFmt = lang:get("获得~ts，恭喜你获得本次战场胜利"),
            GainArgs = [{item_2, NewBaseId, Num}],
            case IsNotice of
                1 ->
                    Fmt = lang:get("~ts打开勇士战场宝箱，惊喜地获得一个~ts~ts"),
                    Args = [{role_2, Name},
                            {item_2, NewBaseId},
                            {face_1, 18}],
                    Msg = notice:format(Fmt, Args),
                    role_group:pack_send(world, 9902, {4, Msg, []}),
                    ok;
                0 -> ok
            end,
            Reply = notice:format(GainFmt, GainArgs),
            {ok, Reply, GainRole};
        _ -> {false, lang:get("背包已满，请先整理背包")}
    end.

enter_field(Pid,
            #warrior{pid = WarPid, field_id = Fid, camp = Camp})
    when is_pid(WarPid) ->
    cast(Pid, {enter, {WarPid, Fid, Camp}});
enter_field(_Pid, _Warrior) -> ok.

last_enter_field(Pid, Warrior) when is_pid(Pid) ->
    cast(Pid, {last_enter, Warrior});
last_enter_field(_Pid, _Warrior) -> ok.

apply_enter_field(Role = #role{s_event = 10, id = Rid,
                               name = _Name},
                  FieldPid, Camp, OpenMode,
                  {MapPlat, MapZoneId, MapId}) ->
    EventRole = Role#role{s_event = 11,
                          s_event_pid = FieldPid},
    CampRole = role_camp_looks(Camp, EventRole),
    {CrossType, ToPos} = get_field_pos(OpenMode,
                                       {MapPlat, MapZoneId, MapId},
                                       Camp),
    case map:role_enter(ToPos,
                        CampRole#role{cross_type = CrossType})
        of
        {ok, NewRole} ->
            Now = date:unixtime(),
            cast(FieldPid, {enter, Rid, Now}),
            CampName = camp_name(Camp),
            Fmt = lang:get("战斗开始，您被分配至 ~ts阵营，10秒后将开始自动匹配敌对阵营战斗"),
            Args = [{string_2, 5, CampName}],
            Msg = notice:format(Fmt, Args),
            notice:send(NewRole, 3, Msg),
            role_misc:push_cross(NewRole),
            logger:debug("[~ts]成功进入正式区", [_Name], warrior, 434),
            {ok, role_trigger:fire(#evt_warrior{}, NewRole)};
        _Err ->
            logger:error("[~ts]进入正式区失败:~w",
                         [_Name, _Err],
                         warrior,
                         437),
            ok
    end;
apply_enter_field(#role{name = _Name, s_event = Event},
                  _FieldPid, _Camp, _OpenMode, _Pos) ->
    logger:error("[~ts]状态异常[Event:~w]，无法进入正式区",
                 [_Name, Event],
                 warrior,
                 441),
    ok.

apply_last_enter_field(Role = #role{name = _Name},
                       Warrior = #warrior{camp = Camp, field_pid = FieldPid},
                       OpenMode, {MapPlat, MapZoneId, MapId}) ->
    case role_misc:check_event(Role, [2]) of
        {false, Reason} ->
            logger:debug("进入准备区地图~ts", [Reason], warrior, 449),
            role:link_send(Role, 14201, {0, Reason, 0}),
            ok;
        true ->
            case role_fly:force_landing(Role) of
                {ok, DownRole} ->
                    {CrossType, ToPos} = get_field_pos(OpenMode,
                                                       {MapPlat,
                                                        MapZoneId,
                                                        MapId},
                                                       Camp),
                    EventRole = DownRole#role{s_event = 11,
                                              s_event_pid = FieldPid},
                    CampRole = role_camp_looks(Camp, EventRole),
                    case map:role_enter(ToPos,
                                        CampRole#role{cross_type = CrossType})
                        of
                        {ok, NewRole} ->
                            Now = date:unixtime(),
                            cast(FieldPid, {last_enter, Warrior, Now}),
                            logger:debug("[~ts]成功进入正式区", [_Name], warrior, 462),
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
                            {ok, role_trigger:fire(#evt_warrior{}, NewRole)};
                        _Err ->
                            logger:error("[~ts]进入正式区失败:~w",
                                         [_Name, _Err],
                                         warrior,
                                         472),
                            ok
                    end;
                _False ->
                    logger:debug("进入准备区地图失败[Err:~w]",
                                 [_False],
                                 warrior,
                                 476),
                    ok
            end
    end;
apply_last_enter_field(#role{name = _Name,
                             s_event = Event},
                       _Warrior, _OpenMode, _Pos) ->
    logger:error("[~ts]状态异常[Event:~w]，无法进入正式区",
                 [_Name, Event],
                 warrior,
                 481),
    ok.

get_field_pos(2, {MapPlat, MapZoneId, MapId}, Camp) ->
    {X, Y} = case Camp of
                 2 ->
                     util:rand_list([{3200, 1960},
                                     {3480, 1400},
                                     {3240, 800},
                                     {2047, 1803}]);
                 1 ->
                     util:rand_list([{919, 839},
                                     {640, 1400},
                                     {880, 2000},
                                     {2047, 947}])
             end,
    {1, {MapPlat, MapZoneId, MapId, X, Y}};
get_field_pos(_, {_, _, MapId}, Camp) ->
    {X, Y} = case Camp of
                 2 ->
                     util:rand_list([{3200, 1960},
                                     {3480, 1400},
                                     {3240, 800},
                                     {2047, 1803}]);
                 1 ->
                     util:rand_list([{919, 839},
                                     {640, 1400},
                                     {880, 2000},
                                     {2047, 947}])
             end,
    {0, {MapId, X, Y}}.

combat_over(#combat{type = 103, winner = Winner,
                    loser = Loser, pid = Pid, round = Round,
                    start_args =
                        #combat_start_args{common_referee = Referee,
                                           ext_args = ExtArgs}})
    when is_pid(Referee) ->
    case Winner of
        [_ | _] ->
            WinnerLeader = get_fighter_leader(Winner),
            LoserLeader = get_fighter_leader(Loser),
            Args = [{round, Round + 1}, {ext_args, ExtArgs}],
            cast(Referee,
                 {combat_over, WinnerLeader, LoserLeader, Pid, Args});
        _False -> ok
    end;
combat_over(_Combat) -> ok.

apply_exit(Role = #role{id = Rid}, WinOrLose) ->
    case exit_field(Role) of
        {ok, ExitRole} ->
            case warrior_mgr:find_role(Rid) of
                {true, #warrior{field_pid = FPid, camp = Camp}}
                    when is_pid(FPid) ->
                    case WinOrLose of
                        die ->
                            notice:pop(Role,
                                       0,
                                       notice:format(lang:get("复活次数已用完，但你的英勇为~ts赢得了荣耀，奖励将通过~ts发放，请注意查收！"),
                                                     [{string_2,
                                                       5,
                                                       camp_name(Camp)},
                                                      {string_2,
                                                       5,
                                                       lang:get("邮件")}])),
                            cast(FPid, {exit, die, Rid});
                        _ -> ignore
                    end;
                _ -> ok
            end,
            {ok, ExitRole};
        _False -> ok
    end.

apply_settlement_reward(Role = #role{name = _Name,
                                     lev = Lev},
                        {WinOrLose, Camp, Score, VictoryScore}) ->
    case exchange_score(Score, Role) of
        {ok, GainMap} ->
            ExpVal = maps:get(exp, GainMap, 0),
            StarVal = maps:get(star, GainMap, 0),
            PetExpVal = maps:get(pet_exp, GainMap, 0),
            BlueSoul = maps:get(blue_soul, GainMap, 0),
            Assets = [{90010, ExpVal},
                      {90012, StarVal},
                      {22400, BlueSoul},
                      {90005, PetExpVal}],
            Gains = format:val_to_gain(Assets),
            case role_gain:do(Gains, Role) of
                {ok, NewRole} ->
                    Data = {WinOrLose, Camp, Score, VictoryScore, Assets},
                    role:link_send(NewRole, 14212, Data),
                    GainTag = lang:get("获得勇士战场结算奖励"),
                    Msg = format:gain_text(Gains,
                                           #gain_text_opts{gain_tag = GainTag},
                                           NewRole),
                    notice:send(NewRole, 3, Msg),
                    {ok,
                     role_trigger:fire(#evt_warrior_reward{win_flag =
                                                               WinOrLose,
                                                           score = Score},
                                       NewRole)};
                {false, #gain{reason = bag_full}} ->
                    Data = {WinOrLose, Camp, Score, VictoryScore, Assets},
                    role:link_send(Role, 14212, Data),
                    Title = lang:get("勇士战场结算奖励"),
                    Content = lang:get("勇士战场结算时背包已满"),
                    MailItems = Assets,
                    mail:send(Role,
                              #{title => Title, content => Content,
                                items => MailItems}),
                    {ok,
                     role_trigger:fire(#evt_warrior_reward{win_flag =
                                                               WinOrLose,
                                                           score = Score},
                                       Role)};
                _ -> ok
            end;
        _False ->
            logger:error("[Name:~ts]无法获得勇士战场奖励[Score:~w][Lev:~w][~w]",
                         [_Name, Score, Lev, _False],
                         warrior,
                         557),
            ok
    end;
apply_settlement_reward(#role{name = _Name}, _Args) ->
    logger:error("[name:~ts]收到未知的参数:~w",
                 [_Name, _Args],
                 warrior,
                 561),
    ok.

fight_drop(Result, Role = #role{name = Name}) ->
    StarRole = fight_star(Result, Role),
    Rand = util:rand(1, 100),
    case Rand =< 20 of
        true ->
            Items = warrior_data:drop_item(Result),
            case util:rand_list(Items,
                                #warrior_drop_item_data.weight)
                of
                #warrior_drop_item_data{base_id = BaseId, num = Num,
                                        is_notice = IsNotice} ->
                    NewBaseId = item_type:special_id(BaseId),
                    Gain = [#gain{label = item_base_id,
                                  val = [{NewBaseId, 0, Num}]}],
                    case role_gain:do_notice(Gain, StarRole) of
                        {ok, GainRole} ->
                            case IsNotice of
                                1 ->
                                    {Fmt, Args} = case Result of
                                                      1 ->
                                                          WinFmt =
                                                              lang:get("~ts在~ts中一拳将对手放倒时，惊喜地获得一个~ts~ts"),
                                                          WinArgs = [{role_2,
                                                                      Name},
                                                                     {string_2,
                                                                      1,
                                                                      lang:get("勇士战场")},
                                                                     {item_2,
                                                                      NewBaseId},
                                                                     {face_1,
                                                                      38}],
                                                          {WinFmt, WinArgs};
                                                      _ ->
                                                          LoseFmt =
                                                              lang:get("~ts在~ts中被对手放倒时，从地上捡到一个~ts~ts"),
                                                          LoseArgs = [{role_2,
                                                                       Name},
                                                                      {string_2,
                                                                       1,
                                                                       lang:get("勇士战场")},
                                                                      {item_2,
                                                                       NewBaseId},
                                                                      {face_1,
                                                                       22}],
                                                          {LoseFmt, LoseArgs}
                                                  end,
                                    Msg = notice:format(Fmt, Args),
                                    role_group:pack_send(world,
                                                         9902,
                                                         {4, Msg, []}),
                                    ok;
                                _ -> ok
                            end,
                            NewRole = GainRole,
                            NewRole;
                        _ -> StarRole
                    end;
                _ -> StarRole
            end;
        _ -> StarRole
    end.

fight_star(Result, Role) ->
    Var = var:get_var(Role, other, 2002, 0),
    case Var =< 10 of
        true ->
            Star = case Result of
                       1 ->
                           if Var < 3 -> 10;
                              Var < 7 -> 5;
                              true -> 0
                           end;
                       _ ->
                           if Var < 3 -> 5;
                              Var < 7 -> 3;
                              true -> 0
                           end
                   end,
            case Star of
                0 -> Role;
                _ ->
                    Gain = [#gain{label = stars_score, val = Star}],
                    case role_gain:do_notice(Gain, Role) of
                        {ok, GainRole} ->
                            NewRole = var:add_var(GainRole, other, 2002, 1),
                            NewRole;
                        _ -> Role
                    end
            end;
        _ -> Role
    end.

apply_win(Role = #role{name = Name},
          #warrior_combat_win{name = LoseName,
                              wish_buff = WishFlag, takeover = Takeover,
                              lose_buff = LoseBuff, win_buff = WinBuff,
                              camp = Camp, score = Score, round = Round}) ->
    {ok, LookRole} = case WishFlag of
                         true ->
                             {ok, DelRole} = buff:del(Role, 21005),
                             CalcRole = calc_looks(DelRole, Camp),
                             buff:pack_list(CalcRole),
                             map:role_update(CalcRole),
                             {ok, attr:calc_and_push(CalcRole)};
                         _ -> {ok, Role}
                     end,
    {VictyFmt, VictyArgs} = case Round >= 10 of
                                false ->
                                    {lang:get("战斗获胜，你击败了~ts"),
                                     [{role_2, LoseName}]};
                                true ->
                                    {lang:get("战斗回合数已达到限制，系统判定~ts胜出"),
                                     [{role_2, Name}]}
                            end,
    VictyMsg = notice:format(VictyFmt, VictyArgs),
    notice:send(LookRole, 3, VictyMsg),
    case Takeover of
        failed ->
            failed_notice(LookRole, win, WinBuff, LoseBuff);
        _ -> ok
    end,
    DropRole = fight_drop(1, LookRole),
    NewRole = role_trigger:fire(#evt_warrior_fight{win_flag
                                                       = 1},
                                DropRole),
    ScoreMsg = notice:format(lang:get("获得~ts功勋"),
                             [{string_2, 5, Score}]),
    notice:send(NewRole, 3, ScoreMsg),
    {ok, NewRole};
apply_win(_Role, _Result) -> ok.

apply_lose(Role,
           #warrior_combat_lose{revive = 0, field_pid = FPid,
                                camp = Camp, name = Name, score = Score,
                                round = Round}) ->
    SceneIds = warrior_data:buff_ids(),
    FilterIds = util:remove_duplicate([21005 | SceneIds]),
    BuffRole = del_buff(FilterIds, Role, FPid),
    buff:pack_list(BuffRole),
    CalcLookRole = calc_looks(BuffRole, Camp),
    LookRole = looks:add({56, 0, 1, ""}, CalcLookRole),
    MapRole = LookRole#role{s_action = 5},
    {ok, TransRole} = transmit_revive_pos(MapRole, Camp),
    FireRole = role_trigger:fire(#evt_warrior_fight{win_flag
                                                        = 0},
                                 TransRole),
    DropRole = fight_drop(0, FireRole),
    NewRole = DropRole,
    {Fmt, Args} = case Round >= 10 of
                      false ->
                          {lang:get("被~ts击败，复活次数已用完，注意查收邮件奖励{face_1,18}"),
                           [{role_2, Name}]};
                      true ->
                          {lang:get("战斗回合数已达到限制，复活次数已用完，注意查收邮件奖励{face_1,18}"),
                           []}
                  end,
    Msg = notice:format(Fmt, Args),
    notice:send(NewRole, 3, Msg),
    ScoreMsg = notice:format(lang:get("获得~ts功勋"),
                             [{string_2, 5, Score}]),
    notice:send(NewRole, 3, ScoreMsg),
    {ok, attr:calc_and_push(NewRole)};
apply_lose(Role,
           #warrior_combat_lose{field_pid = FPid, camp = Camp,
                                takeover = Takeover, lose_buff = LoseBuff,
                                win_buff = WinBuff, name = Name,
                                revive = Revive, score = Score,
                                round = Round}) ->
    BuffRole = case buff:add(Role, 21005) of
                   {ok, AddBuffRole} -> AddBuffRole;
                   {false, _Err} -> Role
               end,
    MagicRole = case Takeover of
                    true ->
                        DelRole = del_buff([LoseBuff], BuffRole, FPid),
                        BuffName = warrior_data:buff_name(LoseBuff),
                        DelFmt = lang:get("战斗失败，你的~ts被~ts抢夺"),
                        DelArgs = [{string_2, 1, BuffName}, {role_2, Name}],
                        DelMsg = notice:format(DelFmt, DelArgs),
                        notice:send(DelRole, 1, DelMsg),
                        CalcRole = calc_looks(DelRole, Camp),
                        buff:pack_list(CalcRole),
                        map:role_update(CalcRole),
                        CalcRole;
                    failed ->
                        failed_notice(BuffRole, lose, WinBuff, LoseBuff),
                        BuffRole;
                    _False -> BuffRole
                end,
    {ok, MapRole} = transmit_revive_pos(MagicRole, Camp),
    FireRole = role_trigger:fire(#evt_warrior_fight{win_flag
                                                        = 0},
                                 MapRole),
    DropRole = fight_drop(0, FireRole),
    NewRole = DropRole,
    {Fmt, Args} = case Round >= 10 of
                      false ->
                          {lang:get("被~ts击败，复活次数剩余~ts"),
                           [{role_2, Name}, {string_2, 5, max(Revive - 1, 0)}]};
                      true ->
                          {lang:get("战斗回合数已达到限制，系统判定~ts胜出， 复活次数剩余~ts"),
                           [{role_2, Name}, {string_2, 5, max(Revive - 1, 0)}]}
                  end,
    Msg = notice:format(Fmt, Args),
    notice:send(NewRole, 3, Msg),
    ScoreMsg = notice:format(lang:get("获得~ts功勋"),
                             [{string_2, 5, Score}]),
    notice:send(NewRole, 3, ScoreMsg),
    {ok, attr:calc_and_push(NewRole)};
apply_lose(_Role, _Result) -> ok.

failed_notice(Role, Label, WinBuff, LoseBuff) ->
    WinBuffName = warrior_data:buff_name(WinBuff),
    LoseBuffName = warrior_data:buff_name(LoseBuff),
    {Fmt, Args} = case Label of
                      win ->
                          WinFmt = lang:get("你已获得~ts，无法抢夺对方的~ts"),
                          WinArgs = [{string_2, 1, WinBuffName},
                                     {string_2, 1, LoseBuffName}],
                          {WinFmt, WinArgs};
                      _ ->
                          LoseFmt = lang:get("战斗失败，由于对方已持有~ts，你的~ts无法被抢夺"),
                          LoseArgs = [{string_2, 1, WinBuffName},
                                      {string_2, 1, LoseBuffName}],
                          {LoseFmt, LoseArgs}
                  end,
    Msg = notice:format(Fmt, Args),
    notice:send(Role, 3, Msg),
    ok.

exit_field(Role = #role{s_event = 11, hp_max = HpMax,
                        mp_max = MpMax}) ->
    PreRole = looks:add({54, 0, 1, ""}, Role, replace),
    LooksRole = case looks:find(56, PreRole) of
                    {true, _Look} ->
                        looks:add({56, 0, 0, ""}, PreRole, replace);
                    _ -> PreRole
                end,
    EventRole = LooksRole#role{s_event = 0,
                               s_event_pid = undefined, s_action = 0,
                               hp = HpMax, mp = MpMax},
    TimerRole = clean_magic_buff_timer(EventRole),
    SceneIds = warrior_data:buff_ids(),
    BuffRole = del_buff([21005 | SceneIds], TimerRole),
    CampRole = looks:del(59, BuffRole),
    HonorRole = honor:reset(CampRole),
    case warrior_mgr:exit_map(HonorRole) of
        {ok, ExitRole} ->
            DelRole = looks:del([54, 56], ExitRole),
            buff:pack_list(DelRole),
            CalcRole = looks:calc(DelRole),
            AttrRole = attr:calc_and_push(CalcRole),
            VarRole = var:del_var(AttrRole, other, 2002),
            NewRole = VarRole,
            map:role_update(NewRole),
            {ok, NewRole};
        _Err -> ok
    end;
exit_field(_Role) -> ok.

exit_warrior_field(Role = #role{id = Rid}) ->
    case exit_field(Role) of
        {ok, ExitRole} ->
            case warrior_mgr:find_role(Rid) of
                {true, #warrior{field_pid = FPid}} when is_pid(FPid) ->
                    cast(FPid, {exit, leave, Rid});
                _ -> ok
            end,
            {ok, ExitRole};
        _ -> {false, lang:get("无法退出勇士战场")}
    end.

apply_gain_magic_buff(Role = #role{id = Rid,
                                   name = Name},
                      {BuffId, Pid, OwnerName}) ->
    role:send_buff_begin(),
    case buff:add(Role, BuffId) of
        {ok, BuffRole} ->
            case call(Pid, {gain_magic_buff, Rid, Name, BuffId}) of
                ok ->
                    role:send_buff_flush(),
                    LooksRole = calc_looks(BuffRole),
                    looks:update_looks(Role, LooksRole),
                    Timer = #timer{id = warrior_buff_score,
                                   timeout = 30 * 1000, m = warrior,
                                   f = add_buff_score, a = [BuffId]},
                    TimerRole = role_timer:set(Timer, LooksRole),
                    NewRole = TimerRole,
                    BuffName = warrior_data:buff_name(BuffId),
                    Fmt = lang:get("战斗获胜，已夺得~ts的~ts"),
                    Args = [{role_2, OwnerName}, {string_2, 1, BuffName}],
                    Msg = notice:format(Fmt, Args),
                    notice:send(NewRole, 1, Msg),
                    {ok, attr:calc_and_push(NewRole)};
                _ ->
                    role:send_buff_clean(),
                    ok
            end;
        _ ->
            role:send_buff_clean(),
            ok
    end.

async_gain_magic_buff(#warrior_magic_buff{next_owner_pid
                                              = Pid,
                                          buff_id = Id, owner_name = Name},
                      FieldPid)
    when is_pid(Pid) ->
    role:apply(async,
               Pid,
               {warrior,
                apply_gain_magic_buff,
                [{Id, FieldPid, Name}]}),
    ok;
async_gain_magic_buff(#warrior_magic_buff{next_owner_id
                                              = NextOwnerId,
                                          buff_id = Id, name = Name},
                      FieldPid) ->
    case warrior_mgr:find_role(NextOwnerId) of
        {true, #warrior{pid = Pid}} when is_pid(Pid) ->
            role:apply(async,
                       Pid,
                       {warrior,
                        apply_gain_magic_buff,
                        [{Id, FieldPid, Name}]});
        _ -> ok
    end,
    ok;
async_gain_magic_buff(_, _) -> ok.

sync_phase(#warrior_field{pid = FieldPid}, Phase) ->
    cast(FieldPid, {sync_phase, Phase}),
    ok;
sync_phase(Field, Phase) ->
    logger:error("同步勇士战场阶段错误[Field:~w][Phase:~w]",
                 [Field, Phase],
                 warrior,
                 859),
    ok.

logout_field(#warrior{field_pid = FPid},
             Role = #role{id = Rid}) ->
    case is_pid(FPid) of
        true -> cast(FPid, {exit, logout, Rid});
        false -> ok
    end,
    {ok, Role#role{s_event_pid = undefined}}.

clean_buff(Role) ->
    SceneIds = warrior_data:buff_ids(),
    del_buff([21005 | SceneIds], Role).

get_magic_buff(#warrior{field_pid = FPid},
               #role{pid = Pid})
    when is_pid(FPid) ->
    cast(FPid, {get_magic_buff, Pid}),
    ok;
get_magic_buff(_Warrior, _Role) -> ok.

get_field_info(#warrior{field_pid = FPid},
               #role{pid = Pid})
    when is_pid(FPid) ->
    cast(FPid, {get_field_info, Pid}),
    ok;
get_field_info(_Warrior, _Role) -> ok.

start_link(Fid, SeqId, GroupId, Len, OpenMode, CrossId,
           CombatMode) ->
    gen_fsm:start_link(warrior,
                       [Fid,
                        SeqId,
                        GroupId,
                        Len,
                        OpenMode,
                        CrossId,
                        CombatMode],
                       []).

init([Fid,
      SeqId,
      GroupId,
      Len,
      OpenMode,
      CrossId,
      CombatMode]) ->
    case map_mgr:create(51001) of
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
                                 CombatMode),
                    erlang:send_after(13 * 1000, self(), match),
                    CampRadio = case campaign_time:check({camp, 116}) of
                                    true -> 2;
                                    _ -> 1
                                end,
                    {ok,
                     fight,
                     State#state{match_time = date:unixtime() + 13,
                                 camp_radio = CampRadio, open_mode = OpenMode,
                                 cross_id = CrossId, combat_mode = CombatMode}};
                _ -> {stop, abnormal, #state{}}
            end;
        _False ->
            logger:error("创建战场地图失败[Fid:~w][GroupId:~w][Err:~w]",
                         [Fid, GroupId, _False],
                         warrior,
                         911),
            {stop, abnormal, #state{}}
    end.

init(Fid, SeqId, GroupId, Len, MapPid, MapId, BattleId,
     CrossId, CombatMode) ->
    GroupName = warrior_data:group_name(GroupId),
    logger:info("开启勇士战场[~w][~ts]第[~w]战区， 战场编号：~w， 指派人数：~w",
                [CrossId, GroupName, SeqId, Fid, Len],
                warrior,
                917),
    Self = self(),
    Now = date:unixtime(),
    Plat = env:get(platform),
    ZoneId = env:get(zone_id),
    Field = #warrior_field{id = Fid, pid = Self,
                           seq_id = SeqId, group_id = GroupId, map_id = MapId,
                           map_pid = MapPid, map_plat = Plat, map_zone = ZoneId,
                           cross_id = CrossId, key = {CrossId, Fid}},
    Rank = warrior_rank:init(),
    TimersCfg = warrior_data:phase_timer(4),
    AddMagicBuffList = case CombatMode of
                           1 -> [2];
                           _ -> []
                       end,
    MagicBuff = init_magic_buff(AddMagicBuffList,
                                Now,
                                TimersCfg,
                                []),
    warrior_mgr:update_field(Field),
    State = #state{id = Fid, group_id = GroupId,
                   map_id = MapId, seq_id = SeqId, map_pid = MapPid,
                   start_time = erlang:now(), pid = Self, rank = Rank,
                   magic_buff = MagicBuff, exit_npc = BattleId,
                   timeout = 35 * 60 - 1},
    init_phase_timer(State, TimersCfg),
    State.

create_npc(MapId) ->
    case unit_mgr:fetch_ids(1) of
        {ok, [Id]} ->
            BattleId = {13, Id},
            Pos = {MapId, 2040, 1200},
            case unit_mgr:create(BattleId, 79554, Pos) of
                {ok, _} -> {ok, BattleId};
                _ -> false
            end;
        _ -> false
    end.

async_apply(Ids, F, A) ->
    async_apply(Ids, warrior, F, A).

async_apply([], _M, _F, _A) -> ok;
async_apply([#warrior_zone_role{id = Wid} | Rest], M, F,
            A) ->
    case warrior_mgr:find_role(Wid) of
        {true, Warrior} ->
            send_async_apply(M, F, A, Warrior),
            async_apply(Rest, M, F, A);
        _False -> async_apply(Rest, M, F, A)
    end;
async_apply([Wid | Rest], M, F, A) ->
    case warrior_mgr:find_role(Wid) of
        {true, Warrior} ->
            send_async_apply(M, F, A, Warrior),
            async_apply(Rest, M, F, A);
        _False -> async_apply(Rest, M, F, A)
    end.

handle_event({enter, {Pid, _Fid, Camp}}, fight,
             State = #state{open_mode = OpenMode, map_id = MapId,
                            map_plat = MapPlat, map_zone = MapZoneId}) ->
    Self = self(),
    role:apply(async,
               Pid,
               {warrior,
                apply_enter_field,
                [Self, Camp, OpenMode, {MapPlat, MapZoneId, MapId}]}),
    continue(fight, State);
handle_event({enter, Rid, Time}, fight,
             State = #state{start_time = _Ts, magic_buff = Buffs,
                            open_mode = OpenMode}) ->
    case warrior_mgr:find_role(Rid) of
        {true, Warrior = #warrior{camp = Camp, pid = Pid}} ->
            ReviveNum = 5,
            NewWarrior = Warrior#warrior{field_time = Time,
                                         status = 2, revive = ReviveNum},
            warrior_mgr:update_role(NewWarrior, OpenMode),
            NewState = join_camp(Camp, State, NewWarrior),
            Field = state_2_field(NewState),
            push_warrior_info(NewWarrior),
            role:pack_send(Pid, 14205, {Buffs}),
            role:pack_send(Pid, 14206, {Field}),
            continue(fight, NewState);
        _False -> continue(fight, State)
    end;
handle_event({last_enter,
              Warrior = #warrior{pid = Pid, id = Rid}},
             fight,
             State = #state{green_num = GreenNum,
                            white_num = WhiteNum, green_score = GreenScore,
                            white_score = WhiteScore, map_id = MapId,
                            map_plat = MapPlat, map_zone = MapZoneId,
                            open_mode = OpenMode}) ->
    case warrior_mgr:find_role(Rid) of
        {true, #warrior{}} ->
            Data = {0, lang:get("你已经退出，不能再进入了"), 0},
            role:pack_send(Pid, 14201, Data);
        _ ->
            Camp = case GreenNum > WhiteNum of
                       true -> 2;
                       false when GreenNum =:= GreenNum ->
                           case GreenScore > WhiteScore of
                               true -> 2;
                               _ -> 1
                           end;
                       _ -> 1
                   end,
            role:apply(async,
                       Pid,
                       {warrior,
                        apply_last_enter_field,
                        [Warrior#warrior{camp = Camp},
                         OpenMode,
                         {MapPlat, MapZoneId, MapId}]})
    end,
    continue(fight, State);
handle_event({last_enter,
              Warrior = #warrior{camp = Camp, pid = Pid},
              Time},
             fight,
             State = #state{start_time = Ts, magic_buff = Buffs,
                            open_mode = OpenMode}) ->
    StartTime =
        date:datetime_to_seconds(calendar:now_to_local_time(Ts)),
    LossRevive = warrior_data:late_revive(Time - StartTime),
    ReviveNum = 5 - LossRevive,
    NewWarrior = Warrior#warrior{field_time = Time,
                                 status = 2, revive = ReviveNum},
    warrior_mgr:update_role(NewWarrior, OpenMode),
    NewState = join_camp(Camp, State, NewWarrior),
    Field = state_2_field(NewState),
    push_warrior_info(NewWarrior),
    role:pack_send(Pid, 14205, {Buffs}),
    role:pack_send(Pid, 14206, {Field}),
    notice:send({pid, Pid},
                3,
                notice:format(lang:get("抵达战场，剩余~ts次复活次数"),
                              [{string_2, 5, ReviveNum}])),
    continue(fight, NewState);
handle_event({combat_over,
              Winner,
              Loser,
              CombatPid,
              Args},
             fight, State) ->
    StatsState = combat_over_stats(Winner,
                                   Loser,
                                   Args,
                                   State),
    {NewPhase, FieldState} = check_field_status(fight,
                                                StatsState),
    NewState = case NewPhase of
                   settlement ->
                       SwitchState = switch_settlement(FieldState),
                       SwitchState#state{ts = erlang:now(), timeout = 120,
                                         event = self};
                   _ -> FieldState
               end,
    warrior_mgr:del_combat(CombatPid),
    continue(NewPhase, NewState);
handle_event({add_buff_score, Rid, TAddScore}, fight,
             State = #state{green_score = GScore,
                            white_score = WScore, rank = Rank,
                            camp_radio = CampRadio, open_mode = OpenMode}) ->
    NewState = case warrior_mgr:find_role(Rid) of
                   {true,
                    Warrior = #warrior{camp = Camp, score = Score}} ->
                       AddScore = util:ceil(TAddScore * CampRadio),
                       NewScore = Score + AddScore,
                       NewRank = warrior_rank:update(Rid,
                                                     Score,
                                                     NewScore,
                                                     Rank),
                       RankNum = warrior_rank:lookup_rank(Rid,
                                                          NewScore,
                                                          NewRank),
                       NewWarrior = Warrior#warrior{score = NewScore,
                                                    rank = RankNum},
                       warrior_mgr:update_role(NewWarrior, OpenMode),
                       ChangeState = case Camp of
                                         2 ->
                                             State#state{white_score =
                                                             WScore + AddScore};
                                         1 ->
                                             State#state{green_score =
                                                             GScore + AddScore}
                                     end,
                       push_field_info(ChangeState),
                       push_warrior_info(Warrior),
                       RankState = ChangeState#state{rank = NewRank},
                       push_mini_rank([NewWarrior], RankState, []),
                       RankState;
                   _False -> State
               end,
    continue(fight, NewState);
handle_event({loss_magic_buff, Rid, BuffId}, fight,
             State = #state{magic_buff = Buffs, pid = FieldPid,
                            open_mode = OpenMode}) ->
    case warrior_mgr:find_role(Rid) of
        {true, Warrior} ->
            NewWarrior = Warrior#warrior{magic_buff = []},
            warrior_mgr:update_role(NewWarrior, OpenMode);
        _ -> ok
    end,
    case lists:keyfind(BuffId,
                       #warrior_magic_buff.buff_id,
                       Buffs)
        of
        Buff = #warrior_magic_buff{status = 3,
                                   owner_id = Rid} ->
            async_gain_magic_buff(Buff, FieldPid);
        _ -> ok
    end,
    continue(fight, State);
handle_event({get_rank, RolePid}, StateName,
             State = #state{rank = Rank}) ->
    GetRank = case warrior_rank:get_rank(100, Rank) of
                  Cast = [_ | _] -> Cast;
                  _ -> []
              end,
    role:pack_send(RolePid, 14208, {GetRank}),
    continue(StateName, State);
handle_event({sync_phase, 5}, fight,
             State = #state{id = Fid, group_id = GroupId,
                            cross_id = CrossId}) ->
    logger:info("Fid:~w, CrossId:~w Gid:~w 切换至settlement",
                [Fid, CrossId, GroupId],
                warrior,
                1099),
    {_, FieldState} = check_field_status(reward, State),
    NewState = switch_settlement(FieldState),
    broadcast_group(NewState, 14200, {5, 120}),
    {next_state,
     settlement,
     NewState#state{start_time = erlang:now()}};
handle_event({sync_phase, 6}, settlement,
             State = #state{win_camp = WinCamp,
                            white_camp = WhiteCamp, green_camp = GreenCamp,
                            id = Fid, group_id = GroupId,
                            cross_id = CrossId}) ->
    logger:info("Fid:~w, CrossId:~w Gid:~w 切换至reward",
                [Fid, CrossId, GroupId],
                warrior,
                1107),
    {Winners, Losers} = case WinCamp of
                            2 -> {WhiteCamp, GreenCamp};
                            _ -> {GreenCamp, WhiteCamp}
                        end,
    async_apply(Losers, apply_exit, lose),
    broadcast_group(Winners, 14200, {6, 8 * 60}),
    NewState = State#state{start_time = erlang:now()},
    TimersCfg = warrior_data:phase_timer(6),
    init_phase_timer(NewState, TimersCfg),
    {next_state, reward, NewState};
handle_event({sync_phase, 7}, reward,
             State = #state{win_camp = WinCamp, green_camp = GCamp,
                            white_camp = WCamp, unit_ids = UnitIds, id = Fid,
                            group_id = GroupId, cross_id = CrossId}) ->
    logger:info("Fid:~w, CrossId:~w Gid:~w 战场结束",
                [Fid, CrossId, GroupId],
                warrior,
                1122),
    WinnerCamp = case WinCamp of
                     2 -> WCamp;
                     1 -> GCamp
                 end,
    server_timer:clean(),
    NewState = clean_scene_unit(UnitIds, State),
    async_apply(WinnerCamp, apply_exit, win),
    {stop, normal, NewState};
handle_event({sync_phase, _}, StateName, State) ->
    continue(StateName, State);
handle_event({get_field_info, Pid}, fight, State) ->
    Field = state_2_field(State),
    role:pack_send(Pid, 14206, {Field}),
    continue(fight, State);
handle_event({get_field_info, _}, StateName, State) ->
    continue(StateName, State);
handle_event({get_phase, Pid}, Phase,
             State = #state{event = Event, ts = Ts,
                            start_time = StartTime, timeout = Timeout}) ->
    TsNow = case Event of
                self -> Ts;
                _ -> StartTime
            end,
    LeftTime = warrior_utils:phase_left_time(Phase,
                                             TsNow,
                                             Timeout),
    role:pack_send(Pid, 14200, LeftTime),
    continue(Phase, State);
handle_event({get_magic_buff, Pid}, fight,
             State = #state{magic_buff = Buffs})
    when is_pid(Pid) ->
    role:pack_send(Pid, 14205, {Buffs}),
    {next_state, fight, State};
handle_event({exit, Label, Rid}, fight,
             State = #state{magic_buff = Buffs, map_id = MapId,
                            open_mode = OpenMode})
    when Label =:= logout orelse
             Label =:= leave orelse Label =:= die ->
    {NewBuffs, DropBuffs} = recycle_magic_buff(Buffs,
                                               Rid,
                                               [],
                                               [],
                                               State),
    UnitState = case DropBuffs of
                    [_ | _] ->
                        Len = length(DropBuffs),
                        case unit_mgr:fetch_ids(Len) of
                            {ok, Ids} ->
                                map:pack_send_to_all(MapId, 14205, {NewBuffs}),
                                drop_magic_buff(DropBuffs, Ids, State);
                            _ -> State
                        end;
                    _ -> State
                end,
    NewState = UnitState#state{magic_buff = NewBuffs},
    case warrior_mgr:find_role(Rid) of
        {true, Warrior} ->
            {Status, UpdateLabel} = case Label of
                                        logout -> {4, logout};
                                        _ -> {3, leave}
                                    end,
            NewWarrior = Warrior#warrior{status = Status,
                                         magic_buff = []},
            warrior_mgr:update_role(NewWarrior, OpenMode),
            UpdateWarrior = [{NewWarrior, UpdateLabel}],
            NewState1 = update_state(date:unixtime(),
                                     UpdateWarrior,
                                     NewState),
            case Label of
                leave -> leave_mail_reward(NewWarrior, Label);
                die -> leave_mail_reward(NewWarrior, Label);
                _ -> ignore
            end,
            continue(fight, NewState1);
        _ -> continue(fight, NewState)
    end;
handle_event({exit, Label, Rid}, Phase,
             State = #state{open_mode = OpenMode}) ->
    case warrior_mgr:find_role(Rid) of
        {true, Warrior} ->
            {Status, UpdateLabel} = case Label of
                                        logout -> {4, logout};
                                        _ -> {3, leave}
                                    end,
            NewWarrior = Warrior#warrior{status = Status},
            warrior_mgr:update_role(NewWarrior, OpenMode),
            UpdateWarrior = [{NewWarrior, UpdateLabel}],
            NewState = update_state(date:unixtime(),
                                    UpdateWarrior,
                                    State),
            continue(Phase, NewState);
        _ -> continue(Phase, State)
    end;
handle_event(progress_notice, fight,
             State = #state{rank = Rank, group_id = GroupId,
                            seq_id = SeqId}) ->
    GroupName = warrior_data:group_name(GroupId),
    case catch warrior_rank:get_rank(3, Rank) of
        [#warrior{name = Name, score = Score}] ->
            Fmt =
                lang:get("赛程过半，~ts第~ts战区的~ts技压群雄，以~ts功勋领先，大家加油啊！"),
            Args = [{string_1, GroupName},
                    {string_2, 5, SeqId},
                    {role_2, Name},
                    {string_2, 5, Score}],
            Msg = notice:format(Fmt, Args),
            broadcast_group(State, 9902, {4, Msg, []});
        [#warrior{name = Name, score = Score} | Rest] ->
            Fmt =
                lang:get("赛程过半，~ts第~ts战区的~ts技压群雄，以~ts功勋领先，~ts紧随其后，大家加油啊！"),
            NameList = [notice:format("~ts", [{role_2, TmpName}])
                        || #warrior{name = TmpName} <- Rest],
            NameStr = string:join(NameList, "，"),
            Args = [{string_1, GroupName},
                    {string_2, 5, SeqId},
                    {role_2, Name},
                    {string_2, 5, Score},
                    {string_1, NameStr}],
            Msg = notice:format(Fmt, Args),
            broadcast_group(State, 9902, {4, Msg, []});
        _False ->
            logger:debug("[~w]进度提示[~w]",
                         [{GroupId, SeqId}, _False],
                         warrior,
                         1232),
            ok
    end,
    continue(fight, State);
handle_event(_Event, Phase, State) ->
    logger:debug("收到不匹配的事件[~w]",
                 [{_Event, Phase}],
                 warrior,
                 1238),
    continue(Phase, State).

handle_sync_event({click_magic_buff,
                   Rid,
                   Name,
                   BuffId,
                   BattleId},
                  _From, fight,
                  State = #state{magic_buff = Buffs, map_id = MapId,
                                 unit_ids = UnitIds, open_mode = OpenMode}) ->
    {Reply, NewState} = case lists:keyfind(BuffId,
                                           #warrior_magic_buff.buff_id,
                                           Buffs)
                            of
                            Buff = #warrior_magic_buff{status = 1, type = Type,
                                                       name = BuffName} ->
                                NewStatus = 2,
                                case warrior_mgr:find_role(Rid) of
                                    {true,
                                     Warrior = #warrior{magic_buff = [],
                                                        camp = Camp}} ->
                                        NewBuffIds = [BuffId],
                                        NewWarrior = Warrior#warrior{magic_buff
                                                                         =
                                                                         NewBuffIds},
                                        warrior_mgr:update_role(NewWarrior,
                                                                OpenMode),
                                        NewBuff = Buff#warrior_magic_buff{status
                                                                              =
                                                                              NewStatus,
                                                                          owner_name
                                                                              =
                                                                              Name,
                                                                          owner_id
                                                                              =
                                                                              Rid,
                                                                          camp =
                                                                              Camp},
                                        NewBuffs = lists:keystore(BuffId,
                                                                  #warrior_magic_buff.buff_id,
                                                                  Buffs,
                                                                  NewBuff),
                                        {Fmt, Args} = case Type of
                                                          2 ->
                                                              {lang:get("古神附体，~ts获得了神器~ts，攻击力得到大幅提升，并获得功勋加成！"),
                                                               [{role_2, Name},
                                                                {string_2,
                                                                 1,
                                                                 BuffName}]};
                                                          _ ->
                                                              {lang:get("如有神助，~ts获得了神器~ts，防御力得到大幅提升，并获得功勋加成！"),
                                                               [{role_2, Name},
                                                                {string_2,
                                                                 1,
                                                                 BuffName}]}
                                                      end,
                                        warrior_mgr:del_unit(BattleId),
                                        unit_mgr:remove(BattleId),
                                        Msg = notice:format(Fmt, Args),
                                        map:pack_send_to_all(MapId,
                                                             9902,
                                                             {5, Msg, []}),
                                        map:pack_send_to_all(MapId,
                                                             14205,
                                                             {NewBuffs}),
                                        NewUnitIds = lists:keydelete(BattleId,
                                                                     1,
                                                                     UnitIds),
                                        {ok,
                                         State#state{magic_buff = NewBuffs,
                                                     unit_ids = NewUnitIds}};
                                    _False -> {false, State}
                                end;
                            _False -> {false, State}
                        end,
    continue(fight, Reply, NewState);
handle_sync_event({gain_magic_buff, Rid, Name, BuffId},
                  _From, fight,
                  State = #state{magic_buff = Buffs, map_id = MapId,
                                 open_mode = OpenMode}) ->
    {Reply, NewBuffs} = case lists:keyfind(BuffId,
                                           #warrior_magic_buff.buff_id,
                                           Buffs)
                            of
                            Buff = #warrior_magic_buff{status = 3,
                                                       next_owner_id = Rid,
                                                       owner_name = OwnerName,
                                                       name = BuffName} ->
                                case warrior_mgr:find_role(Rid) of
                                    {true,
                                     Warrior = #warrior{magic_buff = BuffIds,
                                                        camp = Camp}} ->
                                        NewBuffIds = [BuffId | BuffIds],
                                        NewWarrior = Warrior#warrior{magic_buff
                                                                         =
                                                                         NewBuffIds},
                                        warrior_mgr:update_role(NewWarrior,
                                                                OpenMode),
                                        NewBuff = Buff#warrior_magic_buff{status
                                                                              =
                                                                              2,
                                                                          next_owner_id
                                                                              =
                                                                              undefined,
                                                                          next_owner_pid
                                                                              =
                                                                              undefined,
                                                                          owner_id
                                                                              =
                                                                              Rid,
                                                                          owner_name
                                                                              =
                                                                              Name,
                                                                          camp =
                                                                              Camp},
                                        Fmt =
                                            lang:get("技惊四座，~ts竟然战胜了拥有~ts的~ts，成为了~ts的新主人。"),
                                        Args = [{role_2, Name},
                                                {string_2, 5, BuffName},
                                                {role_2, OwnerName},
                                                {string_2, 5, BuffName}],
                                        Msg = notice:format(Fmt, Args),
                                        broadcast_group(State,
                                                        9902,
                                                        {5, Msg, []}),
                                        RtnBuffs = lists:keystore(BuffId,
                                                                  #warrior_magic_buff.buff_id,
                                                                  Buffs,
                                                                  NewBuff),
                                        map:pack_send_to_all(MapId,
                                                             14205,
                                                             {RtnBuffs}),
                                        {ok, RtnBuffs};
                                    _ -> {false, Buffs}
                                end;
                            _ -> {false, Buffs}
                        end,
    NewState = State#state{magic_buff = NewBuffs},
    continue(fight, Reply, NewState);
handle_sync_event({click, BattleId, Type, SubType, Rid},
                  _From, Phase, State = #state{unit_ids = UnitIds}) ->
    {Reply, NewState} = case lists:keyfind(BattleId,
                                           1,
                                           UnitIds)
                            of
                            {_, _} ->
                                case server_click(Phase,
                                                  Type,
                                                  SubType,
                                                  Rid,
                                                  State)
                                    of
                                    ok ->
                                        NewUnitIds = lists:keydelete(BattleId,
                                                                     1,
                                                                     UnitIds),
                                        UnitState = State#state{unit_ids =
                                                                    NewUnitIds},
                                        unit_mgr:remove(BattleId),
                                        warrior_mgr:del_unit(BattleId),
                                        {ok, UnitState};
                                    _False -> {false, State}
                                end;
                            _False -> {false, State}
                        end,
    continue(Phase, Reply, NewState);
handle_sync_event({login, RoleId, Pid}, _From, Phase,
                  State = #state{win_camp = WinCamp,
                                 open_mode = OpenMode}) ->
    case warrior_mgr:find_role(RoleId) of
        {true, Warrior = #warrior{}} ->
            NewStatus = 2,
            NewWarrior = Warrior#warrior{pid = Pid,
                                         status = NewStatus},
            warrior_mgr:update_role(NewWarrior, OpenMode),
            Reply = {ok, Phase, {WinCamp, NewWarrior}},
            UpdateWarrior = [{NewWarrior, {login, Pid}}],
            NewState = update_state(date:unixtime(),
                                    UpdateWarrior,
                                    State),
            continue(Phase, Reply, NewState);
        _ -> continue(Phase, false, State)
    end;
handle_sync_event(_Event, _From, Phase, State) ->
    Reply = false,
    continue(Phase, Reply, State).

server_click(fight, 1, 2, Rid,
             _State = #state{open_mode = OpenMode}) ->
    case warrior_mgr:find_role(Rid) of
        {true,
         Warrior = #warrior{revive = Revive, pid = Pid}} ->
            NewWarrior = Warrior#warrior{revive = Revive + 1},
            role:pack_send(Pid, 14207, {NewWarrior}),
            warrior_mgr:update_role(NewWarrior, OpenMode),
            ok;
        _ -> false
    end;
server_click(reward, 3, _SubType, Rid,
             #state{win_camp = WinCamp, green_camp = GreenCamp,
                    white_camp = WhiteCamp}) ->
    Winners = case WinCamp of
                  2 -> WhiteCamp;
                  _ -> GreenCamp
              end,
    case lists:keymember(Rid,
                         #warrior_zone_role.id,
                         Winners)
        of
        true -> ok;
        _ -> false
    end;
server_click(fight, _Type, _SubType, _Rid, _State) ->
    ok;
server_click(_Phase, _Type, _SubType, _Rid, _State) ->
    false.

handle_info(match, fight, State) ->
    NewState = match(State),
    erlang:send_after(9 * 1000, self(), match),
    continue(fight, NewState);
handle_info(match, StateName, State) ->
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
                                    warrior,
                                    1403),
                       server_timer:timer(remove),
                       State
               end,
    continue(Phase, NewState);
handle_info(settlement_reward, Phase = settlement,
            State) ->
    push_settlement_reward(State),
    continue(Phase, State);
handle_info(_Info, Phase, State) ->
    logger:debug("[Phase:~w]未知的消息[Info:~w]",
                 [Phase, _Info],
                 warrior,
                 1412),
    continue(Phase, State).

terminate(Reason, Phase,
          #state{id = Fid, group_id = GroupId, map_pid = MapPid,
                 exit_npc = BattleId}) ->
    case Reason of
        abnormal ->
            logger:info("勇士战场活动进程正在退出[Reason:~w][phase:~w][Fid:~w][Gro"
                        "upId:~w]",
                        [Reason, Phase, Fid, GroupId],
                        warrior,
                        1420),
            ok;
        _ ->
            logger:debug("勇士战场活动进程正在退出[Reason:~w][phase:~w][Fid:~w][Gro"
                         "upId:~w]",
                         [Reason, Phase, Fid, GroupId],
                         warrior,
                         1425),
            ok
    end,
    unit_mgr:remove(BattleId),
    map:stop(MapPid),
    server_timer:clean(),
    ok.

code_change(_OldVsn, StateName, State, _Extra) ->
    {ok, StateName, State}.

init_magic_buff([], _Now, _TimersCfg, Acc) -> Acc;
init_magic_buff([Type | Rest], Now, TimersCfg, Acc) ->
    case warrior_data:get_buff_by_type(Type) of
        [#warrior_buff_data{buff_id = BuffId, name = Name}] ->
            case lists:keyfind(BuffId,
                               #warrior_timer_data.buff_id,
                               TimersCfg)
                of
                #warrior_timer_data{start = Start} ->
                    Buff = #warrior_magic_buff{buff_id = BuffId,
                                               type = Type, status = 0,
                                               name = Name, time = Now + Start},
                    init_magic_buff(Rest, Now, TimersCfg, [Buff | Acc]);
                _ -> init_magic_buff(Rest, Now, TimersCfg, Acc)
            end;
        _ -> init_magic_buff(Rest, Now, TimersCfg, Acc)
    end.

tick(fight, {gen_scene_unit, Id}, State) ->
    case warrior_data:timer(Id) of
        TimerCfg = #warrior_timer_data{type = 1,
                                       spec_id = SpecId} ->
            case gen_scene_unit(SpecId, TimerCfg, State) of
                {ok, NewState} ->
                    case check_tick_timer(TimerCfg, State) of
                        {ok, Timer} -> {ok, {set, Timer}, NewState};
                        _False ->
                            logger:debug("定时器超时~w", [_False], warrior, 1465),
                            {ok, remove, NewState}
                    end;
                _False ->
                    logger:error("定时器配置错误~w", [_False], warrior, 1469),
                    remove
            end;
        TimerCfg = #warrior_timer_data{type = 2,
                                       buff_id = BuffId} ->
            case gen_buff_unit(BuffId, TimerCfg, State) of
                {ok, keep, NewState} ->
                    case check_tick_timer(TimerCfg, State) of
                        {ok, Timer} -> {ok, {set, Timer}, NewState};
                        _False ->
                            logger:debug("定时器超时~w", [_False], warrior, 1479),
                            {ok, remove, NewState}
                    end;
                {ok, NewState} -> {ok, remove, NewState};
                _False ->
                    logger:error("定时器配置错误~w", [_False], warrior, 1485),
                    remove
            end;
        _False ->
            logger:error("定时器配置错误~w,~w",
                         [Id, _False],
                         warrior,
                         1489),
            remove
    end;
tick(reward, {gen_scene_unit, Id}, State) ->
    case warrior_data:timer(Id) of
        TimerCfg = #warrior_timer_data{type = 3} ->
            NewState = create_win_box(State, TimerCfg),
            case check_tick_timer(TimerCfg, NewState) of
                {ok, Timer} -> {ok, {set, Timer}, NewState};
                _ -> {ok, remove, NewState}
            end;
        _False ->
            logger:error("定时器配置错误~w", [_False], warrior, 1502),
            remove
    end;
tick(Phase, Msg, _State) ->
    logger:error("阶段[Phase:~w]收到未知的定时消息[Msg:~w]",
                 [Phase, Msg],
                 warrior,
                 1506),
    remove.

join_camp(1, State = #state{green_camp = GreenCamp},
          Warrior = #warrior{id = RoleId}) ->
    WarriorZone = to_warrior_zone_role(Warrior),
    NewGreenCamp = lists:keystore(RoleId,
                                  #warrior_zone_role.id,
                                  GreenCamp,
                                  WarriorZone),
    NewGreenNum = length(NewGreenCamp),
    State#state{green_camp = NewGreenCamp,
                green_num = NewGreenNum};
join_camp(2, State = #state{white_camp = WhiteCamp},
          Warrior = #warrior{id = RoleId}) ->
    WarriorZone = to_warrior_zone_role(Warrior),
    NewWhiteCamp = lists:keystore(RoleId,
                                  #warrior_zone_role.id,
                                  WhiteCamp,
                                  WarriorZone),
    NewWhiteNum = length(NewWhiteCamp),
    State#state{white_camp = NewWhiteCamp,
                white_num = NewWhiteNum}.

to_warrior_zone_role(#warrior{id = RoleId,
                              pid = RolePid, name = Name, sex = Sex,
                              classes = Classes, lev = Lev, group_id = GroupId,
                              camp = Camp, status = Status, field_id = FieldId,
                              revive = Revive, cross_id = CrossId}) ->
    #warrior_zone_role{id = RoleId, pid = RolePid,
                       name = Name, sex = Sex, classes = Classes, lev = Lev,
                       group_id = GroupId, camp = Camp, status = Status,
                       field_id = FieldId, revive = Revive,
                       cross_id = CrossId}.

result_notice(#state{win_camp = WinCamp, map_id = MapId,
                     group_id = GroupId}) ->
    GroupName = warrior_data:group_name(GroupId),
    CampName = camp_name(WinCamp),
    Fmt = lang:get("恭喜~ts~ts阵营获得最终胜利，~ts秒后幸存的勇士可获得胜利宝箱！"),
    Args = [{string_2, 5, GroupName},
            {string_1, CampName},
            {string_1, 120}],
    Msg = notice:format(Fmt, Args),
    notice:cast({map, MapId}, 4, Msg, []),
    ok.

send_async_apply(warrior, F = apply_exit, Args,
                 #warrior{pid = Pid, status = 2})
    when is_pid(Pid) ->
    role:apply(async, Pid, {warrior, F, [Args]}),
    ok;
send_async_apply(warrior, F = apply_settlement_reward,
                 Args,
                 Warrior = #warrior{status = 2, pid = Pid, score = Score,
                                    camp = Camp})
    when is_pid(Pid) ->
    ApplyArgs = case Args of
                    {win, OpenMode} ->
                        NewScore = Score + 0,
                        NewWarrior = Warrior#warrior{score = NewScore},
                        warrior_mgr:update_role(NewWarrior, OpenMode),
                        {1, Camp, NewScore, 0};
                    _ -> {0, Camp, Score, 0}
                end,
    role:apply(async, Pid, {warrior, F, [ApplyArgs]}),
    ok;
send_async_apply(_M, _F, _Args,
                 _Warrior = #warrior{name = _Name, status = _Status,
                                     pid = _Pid}) ->
    logger:debug("[~ts]异步回调~w, Warrior:~w",
                 [_Name, {_M, _F, _Args}, {_Status, _Pid}],
                 warrior,
                 1549),
    ok.

check_field_status(fight,
                   State = #state{green_num = 0}) ->
    NewState = determination(State),
    {settlement, NewState};
check_field_status(fight,
                   State = #state{white_num = 0}) ->
    NewState = determination(State),
    {settlement, NewState};
check_field_status(reward, State) ->
    NewState = determination(State),
    {settlement, NewState};
check_field_status(Status, State) -> {Status, State}.

determination(State = #state{green_score = GScore,
                             white_score = WScore, green_num = GNum,
                             white_num = WNum, rank = Rank}) ->
    WinCamp = if GScore > WScore -> 1;
                 WScore > GScore -> 2;
                 true ->
                     if GNum > WNum -> 1;
                        WNum > GNum -> 2;
                        true ->
                            case warrior_rank:first(Rank) of
                                {ok, Wid} ->
                                    case warrior_mgr:find_role(Wid) of
                                        {true, #warrior{camp = Camp}} -> Camp;
                                        _ -> 2
                                    end;
                                _ -> 2
                            end
                     end
              end,
    State#state{win_camp = WinCamp}.

combat_over_calc_winner(Warrior = #warrior{multi_kill =
                                               MultiKill,
                                           kill = Kill, score = Score,
                                           camp = Camp, classes = Classes,
                                           id = WinRid},
                        LoseWarrior = #warrior{multi_kill = EnemyMKill}, _Args,
                        Result,
                        State = #state{white_score = WhiteScore,
                                       green_score = GreenScore, rank = Rank,
                                       camp_radio = CampRadio}) ->
    NewMultiKill = MultiKill + 1,
    NewKill = Kill + 1,
    PreventRatio =
        warrior_data:prevent_kill_ratio(EnemyMKill),
    TotalRatio = PreventRatio / 100,
    ClassesRatio = case Classes of
                       4 -> 1.1;
                       5 -> 1.1;
                       _ -> 1
                   end,
    Add = util:floor(30 * TotalRatio * CampRadio *
                         ClassesRatio),
    NewScore = Score + Add,
    CampState = case Camp of
                    1 -> State#state{green_score = GreenScore + Add};
                    2 -> State#state{white_score = WhiteScore + Add}
                end,
    NewRank = warrior_rank:update(WinRid,
                                  Score,
                                  NewScore,
                                  Rank),
    RankNum = warrior_rank:lookup_rank(WinRid,
                                       NewScore,
                                       NewRank),
    NewWarrior = Warrior#warrior{kill = NewKill,
                                 score = NewScore, multi_kill = NewMultiKill,
                                 multi_death = 0, rank = RankNum},
    catch kill_notice(NewWarrior, LoseWarrior, State),
    NewState = CampState#state{rank = NewRank},
    {NewWarrior, Result, NewState}.

combat_over_calc_loser(_WinWar,
                       Warrior = #warrior{id = LoserId, pid = Pid,
                                          multi_death = MDeath, death = Death,
                                          classes = Classes, score = Score,
                                          camp = Camp, revive = Revive},
                       _Args, Result,
                       State = #state{green_num = GreenNum,
                                      white_num = WhiteNum,
                                      green_score = GreenScore,
                                      white_score = WhiteScore, rank = Rank}) ->
    Now = date:unixtime(),
    ClassesRatio = case Classes of
                       4 -> 1.3;
                       5 -> 1.3;
                       _ -> 1
                   end,
    Add = util:floor(15 * ClassesRatio),
    NewScore = Score + Add,
    NewRevive = erlang:max(Revive - 1, 0),
    NewDeath = Death + 1,
    CampState = case {Camp, 0 < NewRevive} of
                    {1, true} -> State#state{green_score = GreenScore + 15};
                    {2, true} -> State#state{white_score = WhiteScore + 15};
                    {1, false} ->
                        CampScore = GreenScore + 15,
                        NewNum = erlang:max(GreenNum - 1, 0),
                        State#state{green_score = CampScore,
                                    green_num = NewNum};
                    {2, false} ->
                        CampScore = WhiteScore + 15,
                        NewNum = erlang:max(WhiteNum - 1, 0),
                        State#state{white_score = CampScore, white_num = NewNum}
                end,
    NewRank = warrior_rank:update(LoserId,
                                  Score,
                                  NewScore,
                                  Rank),
    RankNum = warrior_rank:lookup_rank(LoserId,
                                       NewScore,
                                       NewRank),
    NewWarrior = Warrior#warrior{death = NewDeath,
                                 dead_time = Now, multi_kill = 0,
                                 multi_death = MDeath + 1, score = NewScore,
                                 revive = NewRevive, rank = RankNum},
    case NewRevive =< 0 of
        true ->
            role:apply(async, Pid, {warrior, die_leave_zone, []});
        _ -> ignore
    end,
    NewState = CampState#state{rank = NewRank},
    {NewWarrior, Result, NewState}.

die_leave_zone(Role = #role{name = _Name}) ->
    Timer = #timer{id = warrior_leave, timeout = 3 * 1000,
                   m = warrior, f = apply_exit, a = [die]},
    Role1 = role_timer:set(Timer, Role),
    {ok, Role1}.

check_takeover_magic_buff(Buffs, Loser, Winner) ->
    case check_magic_buff(Buffs, lose, Loser) of
        {true, LoseBuffId} ->
            case check_magic_buff(Buffs, win, Winner) of
                {true, WinBuffId} -> {false, LoseBuffId, WinBuffId};
                false -> true
            end;
        false -> false
    end.

check_magic_buff(#warrior_magic_buff{status = 2,
                                     owner_id = Wid, buff_id = BuffId},
                 _Label, #warrior{id = Wid}) ->
    {true, BuffId};
check_magic_buff(#warrior_magic_buff{status = 3,
                                     next_owner_id = Wid, buff_id = BuffId},
                 _Label, #warrior{id = Wid}) ->
    {true, BuffId};
check_magic_buff([], _Label, _Wid) -> false;
check_magic_buff([Buff | Rest], Label, Wid) ->
    case check_magic_buff(Buff, Label, Wid) of
        {true, BuffId} -> {true, BuffId};
        false -> check_magic_buff(Rest, Label, Wid)
    end;
check_magic_buff(_Buff, _Label, _Wid) -> false.

takeover_magic_buff(Buff = #warrior_magic_buff{status =
                                                   2,
                                               owner_id = LoserId},
                    #warrior{id = LoserId},
                    #warrior{id = WinnerId, pid = WinPid}) ->
    NewBuff = Buff#warrior_magic_buff{status = 3,
                                      next_owner_id = WinnerId,
                                      next_owner_pid = WinPid},
    {true, NewBuff};
takeover_magic_buff([], _Loser, _WinWarrior) -> false;
takeover_magic_buff([Buff | Rest], Loser, WinWarrior) ->
    case takeover_magic_buff(Buff, Loser, WinWarrior) of
        {true, NewBuff} -> {true, NewBuff};
        _ -> takeover_magic_buff(Rest, Loser, WinWarrior)
    end;
takeover_magic_buff(_Buff, _Loser, _WinWarrior) ->
    false.

combat_over_calc(WinWar, LoseWar, Args,
                 State = #state{pid = Pid, open_mode = OpenMode}) ->
    Result = #warrior_combat_result{field_pid = Pid},
    {BuffResult, BuffState} = combat_over_buff(State,
                                               LoseWar,
                                               WinWar,
                                               Result),
    {NewWinWar = #warrior{pid = WinPid},
     WinnerResult,
     WinState} =
        combat_over_calc_winner(WinWar,
                                LoseWar,
                                Args,
                                BuffResult,
                                BuffState),
    {NewLoseWar = #warrior{pid = LosePid},
     LoserResult,
     LoseState} =
        combat_over_calc_loser(WinWar,
                               LoseWar,
                               Args,
                               WinnerResult,
                               WinState),
    NewWarriors = [NewWinWar, NewLoseWar],
    Round = case lists:keyfind(round, 1, Args) of
                {_, CombatRound} -> CombatRound;
                _ -> 0
            end,
    NewResult = LoserResult#warrior_combat_result{round =
                                                      Round},
    {WinResult, LoseReult} = combat_over_result(WinWar,
                                                NewWinWar,
                                                LoseWar,
                                                NewLoseWar,
                                                NewResult),
    role:apply(async,
               WinPid,
               {warrior, apply_win, [WinResult]}),
    role:apply(async,
               LosePid,
               {warrior, apply_lose, [LoseReult]}),
    warrior_mgr:update_role(NewWarriors, OpenMode),
    NewState = #state{white_score = _WhiteScore,
                      green_score = _GreenScore} =
                   LoseState,
    UpdateWarrior = [{NewWinWar, combat_win},
                     {NewLoseWar, combat_lose}],
    NewState1 = update_state(date:unixtime(),
                             UpdateWarrior,
                             NewState),
    push_combat_over_stats(NewWarriors, NewState1),
    NewState1.

combat_over_result(#warrior{id = WinId, name = WinName,
                            camp = WinCamp, multi_death = OldMDeath,
                            score = WinOldScore},
                   #warrior{multi_death = NewMDeath, score = WinScore},
                   #warrior{id = LoseId, name = LoseName, camp = LoseCamp,
                            score = LoseOldScore},
                   #warrior{revive = NewRevive, score = LoseScore},
                   #warrior_combat_result{field_pid = FPid,
                                          lose_buff = LoseBuff,
                                          win_buff = WinBuff,
                                          takeover = Takeover,
                                          round = Round}) ->
    WinDiffScore = erlang:max(WinScore - WinOldScore, 0),
    LoseDiffScore = erlang:max(LoseScore - LoseOldScore, 0),
    WishFlag = OldMDeath > 0 andalso NewMDeath =:= 0,
    WinResult = #warrior_combat_win{field_pid = FPid,
                                    lose_buff = LoseBuff, win_buff = WinBuff,
                                    takeover = Takeover, id = LoseId,
                                    name = LoseName, score = WinDiffScore,
                                    camp = WinCamp, wish_buff = WishFlag,
                                    round = Round},
    LoseResult = #warrior_combat_lose{field_pid = FPid,
                                      lose_buff = LoseBuff, win_buff = WinBuff,
                                      takeover = Takeover, id = WinId,
                                      name = WinName, score = LoseDiffScore,
                                      camp = LoseCamp, revive = NewRevive,
                                      round = Round},
    {WinResult, LoseResult}.

combat_over_buff(State = #state{magic_buff = Buffs},
                 LoseWar, WinWar, Result) ->
    case check_takeover_magic_buff(Buffs, LoseWar, WinWar)
        of
        true ->
            case takeover_magic_buff(Buffs, LoseWar, WinWar) of
                {true,
                 NewBuff = #warrior_magic_buff{buff_id = BuffId}} ->
                    NewBuffs = lists:keystore(BuffId,
                                              #warrior_magic_buff.buff_id,
                                              Buffs,
                                              NewBuff),
                    NewResult = Result#warrior_combat_result{takeover =
                                                                 true,
                                                             lose_buff =
                                                                 BuffId},
                    NewState = State#state{magic_buff = NewBuffs},
                    {NewResult, NewState};
                _False -> {Result, State}
            end;
        {false, LoseBuffId, WinBuffId} ->
            NewResult = Result#warrior_combat_result{takeover =
                                                         failed,
                                                     lose_buff = LoseBuffId,
                                                     win_buff = WinBuffId},
            {NewResult, State};
        false -> {Result, State}
    end.

combat_over_stats([], [], _Args, State) -> State;
combat_over_stats([#fighter{origin_id = WinWid}],
                  [#fighter{origin_id = LoseWid}], Args, State) ->
    case warrior_mgr:find_role(WinWid) of
        {true, WinWar} ->
            case warrior_mgr:find_role(LoseWid) of
                {true, LoseWar} ->
                    combat_over_calc(WinWar, LoseWar, Args, State);
                _False -> State
            end;
        _False -> State
    end;
combat_over_stats([_WinF], [_LoseF], _Args, State) ->
    logger:debug("玩家对战结束:Win:~w\tLose:~w",
                 [_WinF, _LoseF],
                 warrior,
                 1823),
    State.

get_fighter_leader([]) -> [];
get_fighter_leader([F = #fighter{is_leader = 1,
                                 type = Type}
                    | _Rest])
    when Type =:= 1 orelse Type =:= 4 ->
    [F];
get_fighter_leader([_F | Rest]) ->
    get_fighter_leader(Rest).

del_buff([], Role) -> Role;
del_buff([BuffId | Rest], Role) ->
    {ok, NewRole} = buff:del(Role, BuffId),
    del_buff(Rest, NewRole).

del_buff([], Role, _FieldPid) -> Role;
del_buff([BuffId | Rest],
         Role = #role{id = Rid, name = _Name}, FieldPid) ->
    case warrior_data:get_buff(BuffId) of
        #warrior_buff_data{type = Type}
            when Type =:= 2 orelse Type =:= 3 ->
            {ok, DelRole} = buff:del(Role, BuffId),
            TimerRole = clean_magic_buff_timer(DelRole),
            cast(FieldPid, {loss_magic_buff, Rid, BuffId}),
            del_buff(Rest, TimerRole, FieldPid);
        #warrior_buff_data{} ->
            {ok, DelRole} = buff:del(Role, BuffId),
            del_buff(Rest, DelRole, FieldPid);
        _ -> del_buff(Rest, Role, FieldPid)
    end.

apply_del_magic_buff(Role, BuffId) ->
    {ok, DelRole} = buff:del(Role, BuffId),
    LooksRole = calc_looks(DelRole),
    looks:update_looks(Role, LooksRole),
    TimerRole = clean_magic_buff_timer(DelRole),
    {ok, TimerRole}.

transmit_revive_pos(Role = #role{s_event = 11,
                                 name = _Name},
                    Camp) ->
    {X, Y} = case Camp of
                 2 ->
                     util:rand_list([{3200, 1960},
                                     {3480, 1400},
                                     {3240, 800},
                                     {2047, 1803}]);
                 1 ->
                     util:rand_list([{919, 839},
                                     {640, 1400},
                                     {880, 2000},
                                     {2047, 947}])
             end,
    NewRole = #role{s_action = _Saction} =
                  map:role_transmit(4, 1, X, Y, Role),
    logger:debug("[name:~ts]传送回复活点:~w",
                 [_Name, _Saction],
                 warrior,
                 1867),
    map:role_update(NewRole),
    {ok, NewRole};
transmit_revive_pos(Role, _Type) -> {ok, Role}.

exchange_score(Score, Role = #role{lev = Lev}) ->
    case warrior_data:exchange_score(Lev) of
        Star when is_integer(Star) ->
            AssetsList = lists:keysort(1,
                                       warrior_data:score_ratio()),
            AssetsScore = calc_exchange_score(AssetsList,
                                              Score,
                                              0,
                                              0),
            StarVal = util:floor(AssetsScore * Star / 1000),
            Gain0 = case Lev < 60 of
                        true -> #{star => StarVal};
                        _ ->
                            StarVal1 = util:floor(StarVal / 2),
                            BlueSoul = max(util:floor(StarVal / 10), 1),
                            #{star => StarVal1, blue_soul => BlueSoul}
                    end,
            case warrior_data:exp_score_ratio(Score) of
                ExpRatio when is_integer(ExpRatio) ->
                    case warrior_data:exp(Lev) of
                        Exp when is_integer(Exp) ->
                            ExpVal = util:floor(ExpRatio * Exp / 1000),
                            Gain1 = Gain0#{exp => ExpVal},
                            case pet:get_war_pet(Role) of
                                {ok, #pet{lev = PetLev}} ->
                                    case warrior_data:pet_exp(PetLev) of
                                        PetExp when is_integer(PetExp) ->
                                            PetExpVal = util:floor(ExpRatio *
                                                                       PetExp
                                                                       / 1000),
                                            Gain2 = Gain1#{pet_exp =>
                                                               PetExpVal},
                                            {ok, Gain2};
                                        _ -> {ok, Gain1}
                                    end;
                                _ -> {ok, Gain1}
                            end;
                        _ -> {ok, Gain0}
                    end;
                _ -> {ok, Gain0}
            end;
        _False -> false
    end;
exchange_score(Score, Lev) when is_integer(Lev) ->
    case warrior_data:exchange_score(Lev) of
        Star when is_integer(Star) ->
            AssetsList = lists:keysort(1,
                                       warrior_data:score_ratio()),
            AssetsScore = calc_exchange_score(AssetsList,
                                              Score,
                                              0,
                                              0),
            StarVal = util:floor(AssetsScore * Star / 1000),
            Gain0 = case Lev < 60 of
                        true -> #{star => StarVal};
                        _ ->
                            StarVal1 = util:floor(StarVal / 2),
                            BlueSoul = max(util:floor(StarVal / 10), 1),
                            #{star => StarVal1, blue_soul => BlueSoul}
                    end,
            case warrior_data:exp_score_ratio(Score) of
                ExpRatio when is_integer(ExpRatio) ->
                    case warrior_data:exp(Lev) of
                        Exp when is_integer(Exp) ->
                            ExpVal = util:floor(ExpRatio * Exp / 1000),
                            Gain1 = Gain0#{exp => ExpVal},
                            {ok, Gain1};
                        _ -> {ok, Gain0}
                    end;
                _ -> {ok, Gain0}
            end;
        _False -> false
    end.

calc_exchange_score([], _Score, _Stage, Acc) -> Acc;
calc_exchange_score([{NextStage, Ratio} | T], Score,
                    Stage, Acc) ->
    case Score =< NextStage of
        true -> Acc + (Score - Stage) * Ratio / 1000;
        false ->
            NewAcc = Acc + (NextStage - Stage) * Ratio / 1000,
            calc_exchange_score(T, Score, NextStage, NewAcc)
    end.

create_win_box(State = #state{win_camp = WinCamp,
                              white_camp = WhiteCamp, green_camp = GreenCamp,
                              map_id = MapId},
               _Warrior) ->
    Victory = case WinCamp of
                  2 -> WhiteCamp;
                  1 -> GreenCamp
              end,
    SurviveNum = survive(Victory, 0),
    CountLabel = warrior_box_count,
    Count = get(CountLabel),
    {Ratio, NewCount} = case Count of
                            undefined -> {5.0e-1, 1};
                            1 -> {4.0e-1, 2};
                            2 -> {2.99999999999999988898e-1, 3};
                            _ -> {0, 0}
                        end,
    BoxNum = util:ceil(SurviveNum * Ratio),
    NewState = create_win_box(BoxNum, MapId, State),
    put(CountLabel, NewCount),
    case NewCount of
        3 ->
            Msg = lang:get("胜利宝箱已经降临，打开后将自动退出战场"),
            broadcast_group(NewState, 9902, {4, Msg, []});
        0 -> ok;
        _ ->
            Msg = lang:get("胜利宝箱已经降临，打开后将自动退出战场（下次宝箱将于1分钟后降临）"),
            broadcast_group(NewState, 9902, {4, Msg, []})
    end,
    NewState.

survive([], Acc) -> Acc;
survive([#warrior_zone_role{id = Wid} | T], Acc) ->
    case warrior_mgr:find_role(Wid) of
        {true, #warrior{status = 2, revive = Revive}}
            when Revive > 0 ->
            survive(T, Acc + 1);
        _ -> survive(T, Acc)
    end;
survive([_ | T], Acc) -> survive(T, Acc).

create_win_box(0, _MapId, State) -> State;
create_win_box(BoxNum, MapId, State) ->
    case unit_mgr:fetch_ids(BoxNum) of
        {ok, Ids} -> create_win_box_unit(Ids, MapId, State);
        _False ->
            logger:error("勇士战场无法获得胜利宝箱的单位编号", [], warrior, 2000),
            State
    end.

create_win_box_unit(Ids, MapId, State) ->
    WinItems = warrior_data:all_win_items(),
    make_win_box_unit(Ids, MapId, State, WinItems).

make_win_box_unit([], _MapId, State, _WinItems) ->
    State;
make_win_box_unit([Id | Rest], MapId,
                  State = #state{id = Fid, unit_ids = UnitIds},
                  WinItems) ->
    case util:rand_list(WinItems,
                        #warrior_win_item_data.weight)
        of
        #warrior_win_item_data{base_id = BaseId} ->
            BattleId = {13, Id},
            {X, Y} = case map:rand_pos(51001) of
                         {DefineX, DefineY} -> {DefineX, DefineY};
                         _ ->
                             util:rand_list([{3200, 1960},
                                             {3480, 1400},
                                             {3240, 800},
                                             {2047, 1803}]
                                                ++
                                                [{919, 839},
                                                 {640, 1400},
                                                 {880, 2000},
                                                 {2047, 947}])
                     end,
            Pos = {MapId, X, Y},
            case unit_mgr:create(BattleId, 79552, Pos) of
                {ok, _} ->
                    NewUnit = #warrior_scene_unit{battle_id = BattleId,
                                                  type = 3,
                                                  item_base_id = BaseId,
                                                  field_id = Fid},
                    warrior_mgr:update_unit(NewUnit),
                    NewUnitIds = [{BattleId, 79552} | UnitIds],
                    NewState = State#state{unit_ids = NewUnitIds},
                    make_win_box_unit(Rest, MapId, NewState, WinItems);
                _False ->
                    make_win_box_unit(Rest, MapId, State, WinItems)
            end;
        _ -> make_win_box_unit(Rest, MapId, State, WinItems)
    end.

create_unit(Args, State) ->
    case unit_mgr:fetch_ids(1) of
        {ok, [Id]} -> create_unit(Id, Args, State);
        _ -> false
    end.

create_batch_unit(Num, Args, State)
    when is_integer(Num) ->
    case unit_mgr:fetch_ids(Num) of
        {ok, Ids} -> create_batch_unit(Ids, Args, [], State);
        _ -> []
    end;
create_batch_unit(_Num, _Args, _State) -> [].

create_batch_unit([], _Args, Acc, _State) -> Acc;
create_batch_unit([Id | Rest], Args, Acc, State) ->
    case create_unit(Id, Args, State) of
        {ok, Unit} ->
            create_batch_unit(Rest, Args, [Unit | Acc], State);
        _ -> create_batch_unit(Rest, Args, Acc, State)
    end.

create_unit(Id,
            #warrior_buff_data{buff_id = BuffId,
                               unit_base_id = UnitBaseId, type = Type},
            State) ->
    Unit = #warrior_scene_unit{unit_base_id = UnitBaseId,
                               type = 2, sub_type = Type, buff_id = BuffId},
    case create_unit(Id, Unit, State) of
        {ok, NewUnit} -> {ok, NewUnit};
        _False ->
            logger:error("无法创建神器单位[BuffId:~w][Err:~w]",
                         [BuffId, _False],
                         warrior,
                         2064),
            false
    end;
create_unit(Id,
            SceneUnit = #warrior_scene_unit{unit_base_id =
                                                UnitBaseId,
                                            type = Type, sub_type = SubType},
            #state{map_id = MapId, id = FId}) ->
    {X, Y} = case {Type, SubType} of
                 {2, 2} -> {2044, 1510};
                 {2, 3} -> {2044, 1510};
                 _ ->
                     case map:rand_pos(51001) of
                         {DefineX, DefineY} -> {DefineX, DefineY};
                         _ ->
                             util:rand_list([{3200, 1960},
                                             {3480, 1400},
                                             {3240, 800},
                                             {2047, 1803}]
                                                ++
                                                [{919, 839},
                                                 {640, 1400},
                                                 {880, 2000},
                                                 {2047, 947}])
                     end
             end,
    Pos = {MapId, X, Y},
    BattleId = {13, Id},
    case unit_mgr:create(BattleId, UnitBaseId, Pos) of
        {ok, _Unit} ->
            NewScene = SceneUnit#warrior_scene_unit{battle_id =
                                                        BattleId,
                                                    field_id = FId},
            warrior_mgr:update_unit(NewScene),
            {ok, NewScene};
        _False -> false
    end.

drop_magic_buff([], _Ids, State) -> State;
drop_magic_buff(_, [], State) -> State;
drop_magic_buff([#warrior_magic_buff{buff_id = BuffId,
                                     name = Name}
                 | Rest],
                [Id | RestIds], State = #state{unit_ids = UnitIds}) ->
    NewState = case create_magic_buff_unit(BuffId,
                                           Id,
                                           State)
                   of
                   {ok,
                    #warrior_scene_unit{battle_id = BattleId,
                                        unit_base_id = UnitBaseId}} ->
                       Fmt = lang:get("石破天惊，~ts降临战场，双方勇士竞相争夺。"),
                       Args = [{string_2, 5, Name}],
                       Msg = notice:format(Fmt, Args),
                       broadcast_group(State, 9902, {5, Msg, []}),
                       State#state{unit_ids =
                                       [{BattleId, UnitBaseId} | UnitIds]};
                   _ -> State
               end,
    drop_magic_buff(Rest, RestIds, NewState).

create_magic_buff_unit(BuffId, Id, State) ->
    case warrior_data:get_buff(BuffId) of
        Data = #warrior_buff_data{} ->
            create_unit(Id, Data, State);
        _ -> false
    end.

recycle_magic_buff([], _Rid, Buffs, DropBuffs,
                   _State) ->
    {Buffs, DropBuffs};
recycle_magic_buff([H | Rest], Rid, Buffs, DropBuffs,
                   State = #state{pid = FieldPid}) ->
    case recycle_magic_buff(H, Rid, FieldPid) of
        {ok, NewBuff} ->
            recycle_magic_buff(Rest,
                               Rid,
                               [NewBuff | Buffs],
                               [NewBuff | DropBuffs],
                               State);
        _ ->
            recycle_magic_buff(Rest,
                               Rid,
                               [H | Buffs],
                               DropBuffs,
                               State)
    end.

recycle_magic_buff(Buff = #warrior_magic_buff{status =
                                                  2,
                                              owner_id = Rid},
                   Rid, _FieldPid) ->
    NewBuff = Buff#warrior_magic_buff{status = 1,
                                      owner_id = undefined},
    {ok, NewBuff};
recycle_magic_buff(Buff = #warrior_magic_buff{status =
                                                  3,
                                              owner_id = Rid},
                   Rid, FieldPid) ->
    async_gain_magic_buff(Buff, FieldPid),
    ok;
recycle_magic_buff(Buff = #warrior_magic_buff{status =
                                                  3,
                                              next_owner_id = Rid},
                   Rid, _FieldPid) ->
    NewBuff = Buff#warrior_magic_buff{status = 1,
                                      next_owner_id = undefined,
                                      next_owner_pid = undefined},
    {ok, NewBuff};
recycle_magic_buff(_Buff, _Rid, _FieldPid) -> ok.

gen_scene_unit(Id,
               #warrior_timer_data{num = Num, max = Max},
               State = #state{white_num = WNum, green_num = GNum,
                              unit_ids = UnitIds}) ->
    case warrior_data:get_spec_unit(Id) of
        {SpecId, UnitBaseId, Type} ->
            ExistNum = count_scene_unit(UnitIds, UnitBaseId, 0),
            case ExistNum < Max of
                true ->
                    Total = erlang:min(util:ceil((WNum + GNum) / 100 * Num),
                                       Max - ExistNum),
                    SceneUnit = #warrior_scene_unit{type = 1,
                                                    spec_id = SpecId,
                                                    unit_base_id = UnitBaseId,
                                                    sub_type = Type},
                    NewUnits = create_batch_unit(Total, SceneUnit, State),
                    NewIds = [{BattleId, UnitBaseId}
                              || #warrior_scene_unit{battle_id = BattleId}
                                     <- NewUnits],
                    NewState = State#state{unit_ids = NewIds ++ UnitIds},
                    case Type of
                        2 ->
                            Msg = lang:get("战场神迹，复活BUFF已刷新，拾取后复活次数增加1次！"),
                            broadcast_group(NewState, 9902, {4, Msg, []});
                        _ -> ok
                    end,
                    {ok, NewState};
                _ -> {ok, State}
            end;
        _ -> false
    end.

gen_buff_unit(BuffId,
              #warrior_timer_data{num = Num, max = Max},
              State = #state{white_num = WNum, green_num = GNum,
                             unit_ids = UnitIds}) ->
    case warrior_data:get_buff(BuffId) of
        #warrior_buff_data{type = Type = 1,
                           unit_base_id = UnitBaseId} ->
            ExistNum = count_scene_unit(UnitIds, UnitBaseId, 0),
            case ExistNum < Max of
                true ->
                    Total = erlang:min(util:ceil((WNum + GNum) / 100 * Num),
                                       Max - ExistNum),
                    SceneUnit = #warrior_scene_unit{unit_base_id =
                                                        UnitBaseId,
                                                    type = 2, sub_type = Type,
                                                    buff_id = BuffId},
                    NewUnits = create_batch_unit(Total, SceneUnit, State),
                    NewIds = [{BattleId, UnitBaseId}
                              || #warrior_scene_unit{battle_id = BattleId}
                                     <- NewUnits],
                    NewState = State#state{unit_ids = NewIds ++ UnitIds},
                    {ok, keep, NewState};
                _ -> {ok, State}
            end;
        Data = #warrior_buff_data{type = Type}
            when Type =:= 2 orelse Type =:= 3 ->
            gen_magic_buff(Data, State);
        _ -> false
    end.

gen_magic_buff(#warrior_buff_data{buff_id = BuffId,
                                  unit_base_id = UnitBaseId},
               State = #state{magic_buff = Buffs, unit_ids = UnitIds,
                              combat_mode = 1}) ->
    case lists:keyfind(BuffId,
                       #warrior_magic_buff.buff_id,
                       Buffs)
        of
        Buff = #warrior_magic_buff{status = 0, name = BuffName,
                                   type = Type} ->
            SceneUnit = #warrior_scene_unit{unit_base_id =
                                                UnitBaseId,
                                            type = 2, sub_type = Type,
                                            buff_id = BuffId},
            case create_unit(SceneUnit, State) of
                {ok, #warrior_scene_unit{battle_id = BattleId}} ->
                    Fmt = lang:get("石破天惊，~ts降临战场，双方勇士竞相争夺。"),
                    Args = [{string_2, 5, BuffName}],
                    Msg = notice:format(Fmt, Args),
                    broadcast_group(State, 9902, {5, Msg, []}),
                    MagicBuff = Buff#warrior_magic_buff{status = 1},
                    NewMagicBuffs = lists:keystore(BuffId,
                                                   #warrior_magic_buff.buff_id,
                                                   Buffs,
                                                   MagicBuff),
                    NewUnitIds = [{BattleId, UnitBaseId} | UnitIds],
                    NewState = State#state{magic_buff = NewMagicBuffs,
                                           unit_ids = NewUnitIds},
                    {ok, NewState};
                _False ->
                    logger:error("无法创建神器单位[BuffId:~w][Err:~w]",
                                 [BuffId, _False],
                                 warrior,
                                 2205),
                    false
            end;
        _False ->
            logger:error("无法创建神器单位[BuffId:~w][Err:~w]",
                         [BuffId, _False],
                         warrior,
                         2209),
            false
    end;
gen_magic_buff(_, State) -> {ok, State}.

broadcast_group([], _Code, _Data) -> ok;
broadcast_group([#warrior_zone_role{id = Rid} | Rest],
                Code, Data) ->
    case warrior_mgr:find_role(Rid) of
        {true, #warrior{pid = Pid}} when is_pid(Pid) ->
            role:pack_send(Pid, Code, Data),
            broadcast_group(Rest, Code, Data);
        _False -> broadcast_group(Rest, Code, Data)
    end;
broadcast_group([Rid | Rest], Code, Data) ->
    case warrior_mgr:find_role(Rid) of
        {true, #warrior{pid = Pid}} when is_pid(Pid) ->
            role:pack_send(Pid, Code, Data),
            broadcast_group(Rest, Code, Data);
        _False -> broadcast_group(Rest, Code, Data)
    end;
broadcast_group(#state{map_id = MapId}, Code, Data) ->
    map:pack_send_to_all(MapId, Code, Data),
    ok.

kill_notice(#warrior{multi_kill = MKill, name = Name},
            #warrior{name = LoseName, multi_kill = LoseMKill},
            State = #state{white_score = Score, group_id = GroupId,
                           seq_id = SeqId}) ->
    GroupName = {string_1,
                 warrior_data:group_name(GroupId)},
    EventName = {string_2, 1, lang:get("勇士战场")},
    SeqIdStr = {string_2, 5, SeqId},
    {WinFmt, WinArgs} = case MKill of
                            5 ->
                                {lang:get("~ts~ts第~ts战区~ts已经连续击败了5人，他正在大杀特杀!"),
                                 [EventName,
                                  GroupName,
                                  SeqIdStr,
                                  {role_2, Name}]};
                            10 ->
                                {lang:get("~ts~ts第~ts战区~ts已经连续击败了10人，看来只有神才能阻止他了!"),
                                 [EventName,
                                  GroupName,
                                  SeqIdStr,
                                  {role_2, Name}]};
                            15 ->
                                {lang:get("~ts~ts第~ts战区~ts已经连续击败了15人，暴走的~ts如同神一般，拜托谁去击败他吧!"),
                                 [EventName,
                                  GroupName,
                                  SeqIdStr,
                                  {role_2, Name},
                                  {role_2, Name}]};
                            20 ->
                                {lang:get("~ts~ts第~ts战区~ts已经连续击败了20人，超神的~ts如入无人之境，正在疯狂屠戳！"),
                                 [EventName,
                                  GroupName,
                                  SeqIdStr,
                                  {role_2, Name},
                                  {role_2, Name}]};
                            25 ->
                                {lang:get("~ts~ts第~ts战区~ts已经连续击败了25人，~ts的大名将成为所有人的噩梦!"),
                                 [EventName,
                                  GroupName,
                                  SeqIdStr,
                                  {role_2, Name},
                                  {role_2, Name}]};
                            _ -> {[], []}
                        end,
    {LoseFmt, LoseArgs} = if LoseMKill >= 5 ->
                                 {lang:get("强势崛起，~ts终结了~ts的~ts连杀，获得额外功勋奖励！"),
                                  [{role_2, Name},
                                   {role_2, LoseName},
                                   {string_2, 5, LoseMKill}]};
                             true -> {[], []}
                          end,
    {FirstFmt, FirstArgs} = if Score =:= 0 ->
                                   {lang:get("刀光剑影，~ts击杀了~ts夺得勇士战场的第一滴血！"),
                                    [{role_2, Name}, {role_2, LoseName}]};
                               true -> {[], []}
                            end,
    case WinFmt of
        [_ | _] ->
            WinMsg = notice:format(WinFmt, WinArgs),
            role_group:pack_send(world, 9902, {5, WinMsg, []});
        _ -> ok
    end,
    case LoseFmt of
        [_ | _] ->
            LoseMsg = notice:format(LoseFmt, LoseArgs),
            role_group:pack_send(world, 9902, {4, LoseMsg, []});
        _ -> ok
    end,
    case FirstFmt of
        [_ | _] ->
            FirstMsg = notice:format(FirstFmt, FirstArgs),
            broadcast_group(State, 9902, {4, FirstMsg, []});
        _ -> ok
    end,
    ok.

push_combat_over_stats(Warriors, State) ->
    [push_warrior_info(Warrior) || Warrior <- Warriors],
    push_mini_rank(Warriors, State, []),
    push_field_info(State).

push_warrior_info(Warrior = #warrior{pid = Pid}) ->
    role:pack_send(Pid, 14207, {Warrior}),
    ok;
push_warrior_info(_) -> ok.

push_mini_rank([], State, Acc) ->
    broadcast_group(State, 14208, {Acc});
push_mini_rank([War = #warrior{rank = Rank} | Rest],
               State, Acc)
    when Rank =< 3 ->
    push_mini_rank(Rest, State, [War | Acc]);
push_mini_rank([_ | Rest], State, Acc) ->
    push_mini_rank(Rest, State, Acc).

push_field_info(State) ->
    Field = state_2_field(State),
    broadcast_group(State, 14206, {Field}).

state_2_field(#state{green_score = GScore,
                     white_score = WScore, green_num = GNum,
                     white_num = WNum, group_id = GroupId, seq_id = SeqId,
                     combat_mode = CombatMode}) ->
    #warrior_field{id = SeqId, group_id = GroupId,
                   green_score = GScore, white_score = WScore,
                   green_num = GNum, white_num = WNum,
                   combat_mode = CombatMode}.

role_camp_looks(Camp,
                Role = #role{s_action = Action}) ->
    {Look, CampLook, HonorId} = case Camp of
                                    2 ->
                                        {{54, 0, 6, ""},
                                         {59, 0, Camp, ""},
                                         30017};
                                    _ ->
                                        {{54, 0, 2, ""},
                                         {59, 0, Camp, ""},
                                         30016}
                                end,
    Role1 = looks:add(Look, Role, replace),
    Role2 = looks:add(CampLook, Role1, replace),
    Role3 = case Action of
                5 -> looks:add({56, 0, 1, ""}, Role2, replace);
                _ -> Role2
            end,
    NewRole = case honor:add_and_use(Role3,
                                     {HonorId, 0},
                                     push)
                  of
                  {ok, Role4} -> Role4;
                  _ -> Role3
              end,
    NewRole.

init_phase_timer(#state{event = Event, ts = Ts,
                        start_time = Time},
                 TimersCfg) ->
    TsNow = case Event of
                self -> Ts;
                _ -> Time
            end,
    StartTime =
        date:datetime_to_seconds(calendar:now_to_local_time(TsNow)),
    Now = date:unixtime(),
    Timers = make_timer(TimersCfg,
                        start,
                        StartTime,
                        Now,
                        []),
    [server_timer:add(Timer) || Timer <- Timers],
    ok.

check_tick_timer(TimerCfg = #warrior_timer_data{finished
                                                    = Finished},
                 #state{event = Event, ts = Ts, start_time = EvtTime}) ->
    TsNow = case Event of
                self -> Ts;
                _ -> EvtTime
            end,
    StartTime =
        date:datetime_to_seconds(calendar:now_to_local_time(TsNow)),
    Now = date:unixtime(),
    case Finished + StartTime > Now of
        true ->
            case make_timer(TimerCfg, interval, StartTime, Now) of
                {ok, Timer} -> {ok, Timer};
                _ -> false
            end;
        _ -> false
    end;
check_tick_timer(_TimerCfg, _State) -> false.

make_timer([], _Label, _StartTime, _Now, Timers) ->
    Timers;
make_timer([Cfg = #warrior_timer_data{finished =
                                          Finished}
            | Rest],
           Label, StartTime, Now, Timers) ->
    Flag = case Finished =:= 0 of
               true -> true;
               _ -> StartTime + Finished > Now
           end,
    case Flag of
        true ->
            case make_timer(Cfg, Label, StartTime, Now) of
                {ok, Timer} ->
                    make_timer(Rest,
                               Label,
                               StartTime,
                               Now,
                               [Timer | Timers]);
                _False ->
                    make_timer(Rest, Label, StartTime, Now, Timers)
            end;
        _False ->
            make_timer(Rest, Label, StartTime, Now, Timers)
    end;
make_timer([_Cfg | Rest], Label, StartTime, Now,
           Timers) ->
    make_timer(Rest, Label, StartTime, Now, Timers).

make_timer(#warrior_timer_data{start = undefined,
                               id = _Id},
           _Label, _StartTime, _Now) ->
    logger:error("错误的定时配置[id:~w]", [_Id], warrior, 2415),
    false;
make_timer(#warrior_timer_data{type = 1, id = Id,
                               start = Start, interval = Interval},
           Label, StartTime, Now) ->
    Time = case Label of
               start -> erlang:max(StartTime + Start - Now, 1);
               _ -> Interval
           end,
    {ok,
     #timer{id = {gen_scene_unit, Id},
            timeout = Time * 1000}};
make_timer(#warrior_timer_data{type = 2, id = Id,
                               start = Start, interval = Interval},
           Label, StartTime, Now) ->
    case Label of
        start ->
            Time = erlang:max(StartTime + Start - Now, 1),
            {ok,
             #timer{id = {gen_scene_unit, Id},
                    timeout = Time * 1000}};
        _ ->
            if is_integer(Interval) ->
                   {ok,
                    #timer{id = {gen_scene_unit, Id},
                           timeout = Interval * 1000}};
               true -> false
            end
    end;
make_timer(#warrior_timer_data{type = 3, id = Id,
                               start = Start, interval = Interval},
           Label, StartTime, Now) ->
    case Label of
        start ->
            Time = erlang:max(StartTime + Start - Now, 1),
            {ok,
             #timer{id = {gen_scene_unit, Id},
                    timeout = Time * 1000}};
        _ ->
            if is_integer(Interval) ->
                   {ok,
                    #timer{id = {gen_scene_unit, Id},
                           timeout = Interval * 1000}};
               true -> false
            end
    end;
make_timer(_TimerData, _Label, _StartTime, _Now) ->
    logger:error("未知的定时器数据:~w",
                 [{_TimerData, _Label}],
                 warrior,
                 2449),
    false.

clean_scene_unit([], State) ->
    State#state{unit_ids = []};
clean_scene_unit([{BattleId, _} | Rest], State) ->
    unit_mgr:remove(BattleId),
    clean_scene_unit(Rest, State).

count_scene_unit([], _UnitBaseId, Num) -> Num;
count_scene_unit([{_, UnitBaseId} | Rest], UnitBaseId,
                 Num) ->
    count_scene_unit(Rest, UnitBaseId, Num + 1);
count_scene_unit([_ | Rest], UnitBaseId, Num) ->
    count_scene_unit(Rest, UnitBaseId, Num).

push_settlement_reward(#state{win_camp = WinCamp,
                              id = Id, open_mode = OpenMode,
                              cross_id = CrossId1}) ->
    Fun = fun (Warrior = #warrior{status = 4,
                                  field_id = Fid, cross_id = CrossId2},
               Ok)
                  when Fid =:= Id andalso CrossId1 =:= CrossId2 ->
                  mail_reward(Warrior, WinCamp, OpenMode),
                  Ok;
              (#warrior{status = 3}, Ok) -> Ok;
              (Warrior = #warrior{field_id = Fid, camp = Camp,
                                  cross_id = CrossId2},
               Ok)
                  when Fid =:= Id andalso CrossId1 =:= CrossId2 ->
                  case Camp =:= WinCamp of
                      true ->
                          send_async_apply(warrior,
                                           apply_settlement_reward,
                                           {win, OpenMode},
                                           Warrior);
                      false ->
                          send_async_apply(warrior,
                                           apply_settlement_reward,
                                           lose,
                                           Warrior)
                  end,
                  Ok;
              (_Warrior, Ok) -> Ok
          end,
    ets:foldl(Fun, ok, warriors),
    ok.

switch_settlement(State = #state{id = Fid, pid = Self,
                                 magic_buff = Buffs, unit_ids = UnitIds,
                                 group_id = GroupId, cross_id = CrossId}) ->
    warrior_combat:stop_all_combat({CrossId, Fid}),
    async_clean_magic_buff(Buffs),
    result_notice(State),
    erlang:send_after(3 * 1000, Self, settlement_reward),
    server_timer:clean(),
    NewState = clean_scene_unit(UnitIds, State),
    broadcast_group(State, 14200, {5, 120}),
    logger:info("Fid:~w, CrossId:~w, Gid:~w 切换结算状态",
                [Fid, CrossId, GroupId],
                warrior,
                2495),
    NewState.

async_clean_magic_buff([]) -> ok;
async_clean_magic_buff([#warrior_magic_buff{status = 2,
                                            owner_id = OwnerId,
                                            buff_id = BuffId}
                        | Rest]) ->
    case warrior_mgr:find_role(OwnerId) of
        {true, #warrior{pid = Pid}} when is_pid(Pid) ->
            role:apply(async,
                       Pid,
                       {warrior, apply_del_magic_buff, [BuffId]});
        _ -> ok
    end,
    async_clean_magic_buff(Rest);
async_clean_magic_buff([_ | Rest]) ->
    async_clean_magic_buff(Rest).

clean_magic_buff_timer(Role) ->
    role_timer:del(warrior_buff_score, Role).

calc_looks(Role = #role{id = Rid}) ->
    case warrior_mgr:find_role(Rid) of
        {true, Warrior} -> calc_looks(Role, Warrior);
        _ -> Role
    end.

calc_looks(Role, #warrior{camp = Camp}) ->
    CalcRole = looks:calc(Role),
    role_camp_looks(Camp, CalcRole);
calc_looks(Role, Camp) ->
    CalcRole = looks:calc(Role),
    role_camp_looks(Camp, CalcRole).

mail_reward(Warrior = #warrior{status = 4,
                               score = Score, camp = Camp},
            WinCamp, OpenMode) ->
    NewWarrior = case WinCamp =:= Camp of
                     true ->
                         VicScore = Score + 0,
                         UpdateWarrior = Warrior#warrior{score = VicScore},
                         warrior_mgr:update_role(UpdateWarrior, OpenMode),
                         UpdateWarrior;
                     false -> Warrior
                 end,
    #warrior{lev = Lev, score = NewScore, id = Rid} =
        NewWarrior,
    case exchange_score(NewScore, Lev) of
        {ok, #{exp := 0, star := 0}} ->
            logger:debug("中途离场玩家[~ts]，发送邮件奖励",
                         [Warrior#warrior.name],
                         warrior,
                         2540),
            ok;
        {ok, GainMap} when is_map(GainMap) ->
            logger:debug("中途离场玩家[~ts]，发送邮件奖励",
                         [Warrior#warrior.name],
                         warrior,
                         2543),
            ExpVal = maps:get(exp, GainMap, 0),
            StarVal = maps:get(star, GainMap, 0),
            BlueSoul = maps:get(blue_soul, GainMap, 0),
            Title = lang:get("勇士战场奖励"),
            Fmt =
                lang:get("您在本次勇士战场活动中提前退出，~ts功勋转换为~ts经验、~ts星辰积分，感谢参与！"),
            Args = [{string_2, 5, Score},
                    {assets_1, 90010, ExpVal},
                    {assets_1, 90012, StarVal}],
            Content = notice:format(Fmt, Args),
            Items = case BlueSoul > 0 of
                        true ->
                            [{90010, ExpVal},
                             {90012, StarVal},
                             {22400, BlueSoul}];
                        _ -> [{90010, ExpVal}, {90012, StarVal}]
                    end,
            mail:send(Rid, Title, Content, Items),
            ok;
        _ ->
            logger:debug("中途离场玩家[~ts]，发送邮件奖励",
                         [Warrior#warrior.name],
                         warrior,
                         2558),
            ok
    end;
mail_reward(_Warrior, _WinCamp, _OpenMode) -> ok.

leave_mail_reward(Warrior = #warrior{status = 3,
                                     score = Score},
                  Label) ->
    NewWarrior = Warrior,
    #warrior{lev = Lev, score = NewScore, id = Rid} =
        NewWarrior,
    case exchange_score(NewScore, Lev) of
        {ok, #{exp := 0, star := 0}} ->
            logger:debug("中途离场玩家[~ts]，发送邮件奖励",
                         [Warrior#warrior.name],
                         warrior,
                         2568),
            ok;
        {ok, GainMap} when is_map(GainMap) ->
            logger:debug("中途离场玩家[~ts]，发送邮件奖励",
                         [Warrior#warrior.name],
                         warrior,
                         2571),
            ExpVal = maps:get(exp, GainMap, 0),
            StarVal = maps:get(star, GainMap, 0),
            BlueSoul = max(maps:get(blue_soul, GainMap, 0), 1),
            Title = lang:get("勇士战场奖励"),
            Fmt = case Label of
                      leave ->
                          lang:get("您在本次勇士战场活动中提前退出，~ts功勋转换为~ts经验、~ts星辰积分，感谢参与！");
                      _ ->
                          lang:get("您在本次勇士战场活动中顽强拼搏，~ts功勋转换为~ts经验、~ts星辰积分，感谢参与！")
                  end,
            Args = [{string_2, 5, Score},
                    {assets_1, 90010, ExpVal},
                    {assets_1, 90012, StarVal}],
            Content = notice:format(Fmt, Args),
            Items = [{90010, ExpVal},
                     {90012, StarVal},
                     {22400, BlueSoul}],
            mail:send(Rid, Title, Content, Items),
            ok;
        _ ->
            logger:debug("中途离场玩家[~ts]，发送邮件奖励",
                         [Warrior#warrior.name],
                         warrior,
                         2586),
            ok
    end;
leave_mail_reward(_Warrior, _Label) -> ok.

match(State = #state{green_camp = GreenCamp,
                     white_camp = WhiteCamp, match_time = MatchTime,
                     cross_id = CrossId, combat_mode = CombatMode}) ->
    Now = date:unixtime(),
    MatchType = case Now >= MatchTime + 15 * 60 of
                    true -> special;
                    _ -> normal
                end,
    GreenCamp1 =
        lists:keysort(#warrior_zone_role.last_combat_over_time,
                      GreenCamp),
    WhiteCamp1 =
        lists:keysort(#warrior_zone_role.last_combat_over_time,
                      WhiteCamp),
    {ChangeA, ChangeB} = do_match({CrossId, CombatMode},
                                  GreenCamp1,
                                  WhiteCamp1,
                                  MatchType,
                                  1,
                                  [],
                                  Now,
                                  [],
                                  []),
    Fun = fun (W = #warrior_zone_role{id = RoleId}, Camp) ->
                  lists:keystore(RoleId, #warrior_zone_role.id, Camp, W)
          end,
    NewGreenCamp = lists:foldl(Fun, GreenCamp, ChangeA),
    NewWhiteCamp = lists:foldl(Fun, WhiteCamp, ChangeB),
    State#state{green_camp = NewGreenCamp,
                white_camp = NewWhiteCamp}.

do_match({_CrossId, _CombatMode}, _Green, _White,
         _MatchType, Flag, _, _Now, ChangeGreen, ChangeWhite)
    when Flag >= 11 ->
    {ChangeGreen, ChangeWhite};
do_match({_CrossId, _CombatMode}, _Green, [],
         _MatchType, _Flag, _Last, _Now, ChangeGreen,
         ChangeWhite) ->
    {ChangeGreen, ChangeWhite};
do_match({_CrossId, _CombatMode}, [], _WhiteCamp,
         _MatchType, _Flag, [], _Now, ChangeGreen,
         ChangeWhite) ->
    {ChangeGreen, ChangeWhite};
do_match({CrossId, CombatMode}, [], WhiteCamp,
         MatchType, Flag, GreenCamp, Now, ChangeGreen,
         ChangeWhite) ->
    do_match({CrossId, CombatMode},
             GreenCamp,
             WhiteCamp,
             MatchType,
             Flag + 1,
             [],
             Now + 1,
             ChangeGreen,
             ChangeWhite);
do_match({CrossId, CombatMode}, [A | GreenCamp],
         WhiteCamp, MatchType, Flag, Last, Now, ChangeGreen,
         ChangeWhite) ->
    MatchRange = time_range(MatchType, Flag),
    case matching(A, WhiteCamp, MatchRange, Now, []) of
        {true, B = #warrior_zone_role{}, NewWhiteCamp} ->
            {NewChangeGreen, NewChangeWhite} = case combat(A,
                                                           B,
                                                           CrossId,
                                                           CombatMode)
                                                   of
                                                   {true, NewA, NewB} ->
                                                       {[NewA | ChangeGreen],
                                                        [NewB | ChangeWhite]};
                                                   _ ->
                                                       {ChangeGreen,
                                                        ChangeWhite}
                                               end,
            do_match({CrossId, CombatMode},
                     GreenCamp,
                     NewWhiteCamp,
                     MatchType,
                     Flag,
                     Last,
                     Now,
                     NewChangeGreen,
                     NewChangeWhite);
        not_match ->
            do_match({CrossId, CombatMode},
                     GreenCamp,
                     WhiteCamp,
                     MatchType,
                     Flag,
                     [A | Last],
                     Now,
                     ChangeGreen,
                     ChangeWhite);
        skip ->
            do_match({CrossId, CombatMode},
                     GreenCamp,
                     WhiteCamp,
                     MatchType,
                     Flag,
                     Last,
                     Now,
                     ChangeGreen,
                     ChangeWhite)
    end.

matching(#warrior_zone_role{is_combat = 1}, _, _, _,
         _WhiteCamp) ->
    skip;
matching(#warrior_zone_role{status = Status}, _, _, _,
         _WhiteCamp)
    when Status =/= 2 ->
    skip;
matching(#warrior_zone_role{revive = Revive}, _, _, _,
         _WhiteCamp)
    when Revive =< 0 ->
    skip;
matching(#warrior_zone_role{last_combat_over_time =
                                LastCombatOverTime},
         _, _, Now, _WhiteCamp)
    when Now < LastCombatOverTime ->
    skip;
matching(_A, [], _, _, _WhiteCamp) -> not_match;
matching(A, [B = #warrior_zone_role{is_combat = 1} | T],
         Range, Now, WhiteCamp) ->
    matching(A, T, Range, Now, [B | WhiteCamp]);
matching(A,
         [B = #warrior_zone_role{status = Status} | T], Range,
         Now, WhiteCamp)
    when Status =/= 2 ->
    matching(A, T, Range, Now, [B | WhiteCamp]);
matching(A,
         [B = #warrior_zone_role{revive = Revive} | T], Range,
         Now, WhiteCamp)
    when Revive =< 0 ->
    matching(A, T, Range, Now, [B | WhiteCamp]);
matching(A,
         [B = #warrior_zone_role{last_combat_over_time =
                                     LastCombatOverTime}
          | T],
         Range, Now, WhiteCamp)
    when Now < LastCombatOverTime ->
    matching(A, T, Range, Now, [B | WhiteCamp]);
matching(A = #warrior_zone_role{last_role_id =
                                    LastRoleId,
                                last_combat_over_time = LastCombatOverTime},
         [B = #warrior_zone_role{id = LastRoleId} | T], Range,
         Now, WhiteCamp)
    when Now < LastCombatOverTime + 150 ->
    matching(A, T, Range, Now, [B | WhiteCamp]);
matching(A = #warrior_zone_role{lev = ALev,
                                score = Score1},
         [B = #warrior_zone_role{lev = BLev, score = Score2}
          | T],
         Range, Now, WhiteCamp) ->
    case Range of
        {special, ScoreRange, LevRange} ->
            Range1 = abs(ALev - BLev),
            Range2 = abs(Score1 - Score2),
            case Range1 =< LevRange andalso Range2 =< ScoreRange of
                true ->
                    NewWhiteCamp = lists:reverse(WhiteCamp) ++ T,
                    {true, B, NewWhiteCamp};
                false -> matching(A, T, Range, Now, [B | WhiteCamp])
            end;
        {normal, LevRange} ->
            Range1 = abs(ALev - BLev),
            case Range1 =< LevRange of
                true ->
                    NewWhiteCamp = lists:reverse(WhiteCamp) ++ T,
                    {true, B, NewWhiteCamp};
                false -> matching(A, T, Range, Now, [B | WhiteCamp])
            end
    end.

time_range(normal, 1) -> {normal, 0};
time_range(normal, 2) -> {normal, 0};
time_range(normal, 3) -> {normal, 1};
time_range(normal, 4) -> {normal, 2};
time_range(normal, 5) -> {normal, 3};
time_range(normal, 6) -> {normal, 5};
time_range(normal, 7) -> {normal, 6};
time_range(normal, 8) -> {normal, 7};
time_range(normal, 9) -> {normal, 8};
time_range(normal, _) -> {normal, 100};
time_range(special, 1) -> {special, 10, 4};
time_range(special, 2) -> {special, 30, 6};
time_range(special, 3) -> {special, 50, 8};
time_range(special, 4) -> {special, 70, 6};
time_range(special, 5) -> {special, 90, 8};
time_range(special, 6) -> {special, 110, 10};
time_range(special, 7) -> {special, 130, 10};
time_range(special, 8) -> {special, 150, 10};
time_range(special, 9) -> {special, 300, 10};
time_range(special, _) -> {special, 2000, 100};
time_range(_, _) -> {normal, 100}.

combat(A = #warrior_zone_role{id = ARoleId,
                              name = AName, pid = APid, field_id = FieldId,
                              camp = CampA},
       B = #warrior_zone_role{id = BRoleId, name = BName,
                              pid = BPid, camp = CampB},
       CrossId, CombatMode) ->
    ObserverArgs = {observer_args,
                    [{0, {CampA, FieldId}}, {1, {CampB, FieldId}}]},
    CombatModeArgs = {warrior_combat_mode, CombatMode},
    CombatEmbattleArgs = {warrior_combat_embattle,
                          [{0, warrior_mgr:get_embattle_args(ARoleId)},
                           {1, warrior_mgr:get_embattle_args(BRoleId)}]},
    logger:debug("勇士战场开始战斗参数 ~w",
                 [{ARoleId, BRoleId, CombatEmbattleArgs}],
                 warrior,
                 2727),
    MaxGuard = case CombatMode of
                   4 -> 2;
                   _ -> 4
               end,
    Args = #combat_start_args{common_referee = self(),
                              ext_args =
                                  [ObserverArgs,
                                   CombatModeArgs,
                                   CombatEmbattleArgs],
                              max_guard = MaxGuard},
    case combat_mgr:start_combat(103,
                                 [ARoleId],
                                 [BRoleId],
                                 Args)
        of
        {ok, CombatPid} ->
            MsgA = notice:format(lang:get("你匹配到~ts"),
                                 [{role_2, BName}]),
            MsgB = notice:format(lang:get("你匹配到~ts"),
                                 [{role_2, AName}]),
            notice:send({pid, APid}, 1, MsgA),
            notice:send({pid, BPid}, 1, MsgB),
            WarCombat = #warrior_combat{pid = CombatPid,
                                        field_id = FieldId,
                                        field_key = {CrossId, FieldId}},
            warrior_mgr:update_combat(WarCombat),
            NewA = A#warrior_zone_role{is_combat = 1,
                                       combat_pid = CombatPid,
                                       last_role_id = BRoleId},
            NewB = B#warrior_zone_role{is_combat = 1,
                                       combat_pid = CombatPid,
                                       last_role_id = ARoleId},
            {true, NewA, NewB};
        _Err ->
            logger:error("勇士战场发起战斗失败[~w]", [_Err], warrior, 2745),
            false
    end.

update_state(_Now, [], State) -> State;
update_state(Now,
             [{#warrior{id = RoleId, camp = 1, revive = Revive,
                        score = Score},
               Flag}
              | T],
             State = #state{green_camp = GreenCamp}) ->
    case lists:keyfind(RoleId,
                       #warrior_zone_role.id,
                       GreenCamp)
        of
        Warrior = #warrior_zone_role{win_count = WinCount,
                                     combat_count = CombatCount} ->
            NewWarrior = case Flag of
                             combat_win ->
                                 Warrior#warrior_zone_role{is_combat = 0,
                                                           combat_pid =
                                                               undefined,
                                                           last_combat_over_time
                                                               =
                                                               Now +
                                                                   util:rand(25,
                                                                             40),
                                                           revive = Revive,
                                                           win_count =
                                                               WinCount + 1,
                                                           combat_count =
                                                               CombatCount + 1,
                                                           score = Score};
                             combat_lose ->
                                 Warrior#warrior_zone_role{is_combat = 0,
                                                           combat_pid =
                                                               undefined,
                                                           last_combat_over_time
                                                               =
                                                               Now +
                                                                   util:rand(25,
                                                                             40),
                                                           revive = Revive,
                                                           combat_count =
                                                               CombatCount + 1,
                                                           score = Score};
                             {login, Pid} ->
                                 Warrior#warrior_zone_role{status = 2,
                                                           pid = Pid};
                             logout ->
                                 Warrior#warrior_zone_role{status = 4,
                                                           pid = undefined};
                             leave ->
                                 Warrior#warrior_zone_role{status = 3,
                                                           pid = undefined};
                             _ ->
                                 Warrior#warrior_zone_role{is_combat = 0,
                                                           combat_pid =
                                                               undefined,
                                                           last_combat_over_time
                                                               =
                                                               Now +
                                                                   util:rand(25,
                                                                             40),
                                                           revive = Revive}
                         end,
            NewGreenCamp = lists:keystore(RoleId,
                                          #warrior_zone_role.id,
                                          GreenCamp,
                                          NewWarrior),
            update_state(Now,
                         T,
                         State#state{green_camp = NewGreenCamp});
        _ -> update_state(Now, T, State)
    end;
update_state(Now,
             [{#warrior{id = RoleId, camp = 2, revive = Revive,
                        score = Score},
               Flag}
              | T],
             State = #state{white_camp = WhiteCamp}) ->
    case lists:keyfind(RoleId,
                       #warrior_zone_role.id,
                       WhiteCamp)
        of
        Warrior = #warrior_zone_role{win_count = WinCount,
                                     combat_count = CombatCount} ->
            NewWarrior = case Flag of
                             combat_win ->
                                 Warrior#warrior_zone_role{is_combat = 0,
                                                           combat_pid =
                                                               undefined,
                                                           last_combat_over_time
                                                               =
                                                               Now +
                                                                   util:rand(25,
                                                                             40),
                                                           revive = Revive,
                                                           win_count =
                                                               WinCount + 1,
                                                           combat_count =
                                                               CombatCount + 1,
                                                           score = Score};
                             combat_lose ->
                                 Warrior#warrior_zone_role{is_combat = 0,
                                                           combat_pid =
                                                               undefined,
                                                           last_combat_over_time
                                                               =
                                                               Now +
                                                                   util:rand(25,
                                                                             40),
                                                           revive = Revive,
                                                           combat_count =
                                                               CombatCount + 1,
                                                           score = Score};
                             {login, Pid} ->
                                 Warrior#warrior_zone_role{status = 2,
                                                           pid = Pid};
                             logout ->
                                 Warrior#warrior_zone_role{status = 4,
                                                           pid = undefined};
                             leave ->
                                 Warrior#warrior_zone_role{status = 3,
                                                           pid = undefined};
                             _ ->
                                 Warrior#warrior_zone_role{is_combat = 0,
                                                           combat_pid =
                                                               undefined,
                                                           last_combat_over_time
                                                               =
                                                               Now +
                                                                   util:rand(25,
                                                                             40),
                                                           revive = Revive}
                         end,
            NewWhiteCamp = lists:keystore(RoleId,
                                          #warrior_zone_role.id,
                                          WhiteCamp,
                                          NewWarrior),
            update_state(Now,
                         T,
                         State#state{white_camp = NewWhiteCamp});
        _ -> update_state(Now, T, State)
    end;
update_state(Now, [_ | T], State) ->
    update_state(Now, T, State).

fight(_Event, State) -> continue(fight, State).

settlement(timeout,
           State = #state{win_camp = WinCamp,
                          green_camp = GreenCamp, white_camp = WhiteCamp,
                          id = Fid, group_id = GroupId, cross_id = CrossId}) ->
    logger:info("Fid:~w, CrossId:~w, Gid:~w 切换状态至reward",
                [Fid, CrossId, GroupId],
                warrior,
                2834),
    {Winners, Losers} = case WinCamp of
                            2 -> {WhiteCamp, GreenCamp};
                            _ -> {GreenCamp, WhiteCamp}
                        end,
    async_apply(Losers, apply_exit, lose),
    broadcast_group(Winners, 14200, {6, 8 * 60}),
    NewState = State#state{ts = erlang:now(),
                           timeout = 8 * 60},
    TimersCfg = warrior_data:phase_timer(6),
    init_phase_timer(NewState, TimersCfg),
    continue(reward, NewState);
settlement(_Event, State) ->
    continue(settlement, State).

reward(timeout,
       State = #state{win_camp = WinCamp, green_camp = GCamp,
                      white_camp = WCamp, id = Fid, group_id = GroupId,
                      cross_id = CrossId}) ->
    logger:info("Fid:~w, CrossId:~w, Gid:~w 战场结束",
                [Fid, CrossId, GroupId],
                warrior,
                2850),
    WinnerCamp = case WinCamp of
                     2 -> WCamp;
                     1 -> GCamp
                 end,
    async_apply(WinnerCamp, apply_exit, win),
    {stop, normal, State};
reward(_Event, State) -> continue(reward, State).

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

