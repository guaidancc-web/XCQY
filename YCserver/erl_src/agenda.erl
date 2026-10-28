-file("src/mod/agenda/agenda.erl", 1).

-module(agenda).

-export([init/0,
         login/1,
         gift_for_beta/1,
         delay_login/1,
         reset/2,
         reset_five/2,
         reset_week_five/2,
         list/1,
         double_point_info/1,
         in_double/1,
         add_double/2,
         get_double_point/1,
         freeze_double_point/1,
         double_point_fresh/2,
         combat_loss_double_point/3,
         push/2,
         activity_reward/2,
         apply_evt/2,
         gm/2,
         take_care_junior/1,
         take_care_junior/2,
         take_care_junior/3,
         reward_helper/3,
         helper_apply/2,
         async_reward_helper/2,
         energy_payoff/1,
         extract_reserve_exp/3,
         calc_reserve_exp/2,
         get_state_timeout/2,
         get_duration/1,
         buy_lev_gift/2,
         levup_gift/3,
         apply_fix_double/0,
         do_apply_fix_double/1]).

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

-file("src/mod/agenda/agenda.erl", 46).

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

-file("src/mod/agenda/agenda.erl", 47).

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

-file("src/mod/agenda/agenda.erl", 48).

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

-file("src/mod/agenda/agenda.erl", 49).

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

-file("src/mod/agenda/agenda.erl", 50).

-file("inc/link.hrl", 1).

-record(link,
        {socket :: undefined | port(),
         conn_pid :: undefined | pid(),
         ip = {0, 0, 0, 0} :: {0..255, 0..255, 0..255, 0..255},
         port = 0 :: non_neg_integer(),
         lag = 0 :: non_neg_integer()}).

-file("src/mod/agenda/agenda.erl", 51).

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

-file("src/mod/agenda/agenda.erl", 52).

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

-file("src/mod/agenda/agenda.erl", 53).

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

-file("src/mod/agenda/agenda.erl", 54).

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

-file("src/mod/agenda/agenda.erl", 55).

-file("inc/package.hrl", 1).

-record(package,
        {type = 1 :: integer(),
         next_id = 1 :: pos_integer(),
         volume = 0 :: non_neg_integer(),
         free_cell = [] :: list(),
         items = [] :: [tuple()]}).

-file("src/mod/agenda/agenda.erl", 56).

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

-file("src/mod/agenda/agenda.erl", 57).

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

-file("src/mod/agenda/agenda.erl", 58).

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

-file("src/mod/agenda/agenda.erl", 59).

-file("inc/privilege.hrl", 1).

-record(m_privilege,
        {ver = 2,
         lev = 0,
         list = [],
         new_list = [],
         new_prilist = []}).

-record(privilege_data,
        {lev = 0,
         min = 0,
         max = 0,
         title = "",
         content = "",
         item = []}).

-record(privilege_type_data,
        {lev = 0, type = 0, val = 0, args = [], old_item = []}).

-record(privilege_role,
        {id = {0, "", 0},
         ver = 2,
         lev = 0,
         privilege_lev = 0,
         buy_list = [],
         pri_list = []}).

-record(privilege_item,
        {id = 0,
         item_id = 0,
         is_self = 0,
         bind = 0,
         num = 0,
         weigth = 0,
         is_cast = 0}).

-record(privilege_gift,
        {id = 0,
         need_val = 0,
         reward = [],
         privileges = [],
         title = "",
         content = "",
         client_show = [],
         mail_title = "",
         mail_content = ""}).

-file("src/mod/agenda/agenda.erl", 60).

-file("inc/quest_offer.hrl", 1).

-type offer_notice() :: integer().

-record(quest_offer_ratio_data,
        {exp_ratio = 0, coin_ratio = 0, leader_ratio = 0}).

-record(quest_offer_calc_ratio,
        {count_exp = 0,
         count_coin = 0,
         count_leader = 0,
         lev_exp = 0,
         lev_coin = 0,
         pet_lev_exp = 0,
         name = ""}).

-record(quest_offer_reward_ratio,
        {exp = 0,
         coin = 0,
         pet_exp = 0,
         double_point = 1,
         ring_20_double = 1}).

-record(quest_offer_team_args,
        {round = 0,
         avg_lev = 1,
         member_num = 0,
         double_point = 0}).

-file("src/mod/agenda/agenda.erl", 61).

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

-file("src/mod/agenda/agenda.erl", 62).

-file("inc/mail.hrl", 1).

-record(mail,
        {sess ::
             undefined |
             {pos_integer(), bitstring(), non_neg_integer()},
         to ::
             undefined |
             {pos_integer(), bitstring(), non_neg_integer()},
         from ::
             undefined |
             {non_neg_integer(), bitstring(), non_neg_integer()},
         from_face = 0 :: non_neg_integer(),
         from_name = "" :: bitstring(),
         to_face = 0 :: non_neg_integer(),
         to_name = "" :: bitstring(),
         type = 0 :: 0..1,
         status = 0 :: 0..1,
         del_type = 0 :: 0..1,
         title = "" :: bitstring(),
         content = "" :: bitstring(),
         item_list = [] :: [tuple()],
         source = 0 :: pos_integer(),
         rev_ts = 0 :: pos_integer(),
         ts = 0 :: pos_integer(),
         read_ts = 0 :: non_neg_integer()}).

-file("src/mod/agenda/agenda.erl", 63).

init() -> #m_agenda{}.

login(Role = #role{m_agenda =
                       Agenda = #m_agenda{progress = Progs,
                                          last_recommended = Recommended,
                                          recommends = Recommends}}) ->
    L = [#trigger{label = evt_commit_quest, a = [],
                  m = agenda, f = apply_evt},
         #trigger{label = evt_tower, a = [], m = agenda,
                  f = apply_evt},
         #trigger{label = evt_kill_npc, a = [], m = agenda,
                  f = apply_evt},
         #trigger{label = evt_arena_fight, a = [], m = agenda,
                  f = apply_evt},
         #trigger{label = evt_trial, a = [], m = agenda,
                  f = apply_evt},
         #trigger{label = evt_quest_treasure, a = [], m = agenda,
                  f = apply_evt},
         #trigger{label = evt_qualifying_combat, a = [],
                  m = agenda, f = apply_evt},
         #trigger{label = evt_levup, a = [], m = agenda,
                  f = apply_evt},
         #trigger{label = evt_shipping_sail, a = [], m = agenda,
                  f = apply_evt},
         #trigger{label = evt_kill_treasure_ghost, a = [],
                  m = agenda, f = apply_evt},
         #trigger{label = evt_treasure, a = [], m = agenda,
                  f = apply_evt},
         #trigger{label = evt_kill_guild_robber, a = [],
                  m = agenda, f = apply_evt},
         #trigger{label = evt_dungeon_kill_unit, a = [],
                  m = agenda, f = apply_evt},
         #trigger{label = evt_dungeon_unit_reward, a = [],
                  m = agenda, f = apply_evt},
         #trigger{label = evt_examination, a = [], m = agenda,
                  f = apply_evt},
         #trigger{label = evt_parade, a = [], m = agenda,
                  f = apply_evt},
         #trigger{label = evt_warrior_fight, a = [], m = agenda,
                  f = apply_evt},
         #trigger{label = evt_constellation, a = [], m = agenda,
                  f = apply_evt},
         #trigger{label = evt_pray, a = [], m = agenda,
                  f = apply_evt},
         #trigger{label = evt_brave_trial_order, a = [],
                  m = agenda, f = apply_evt},
         #trigger{label = evt_guild_hero, a = [], m = agenda,
                  f = apply_evt},
         #trigger{label = evt_hero, a = [], m = agenda,
                  f = apply_evt},
         #trigger{label = evt_dragon_boat, a = [], m = agenda,
                  f = apply_evt},
         #trigger{label = evt_campaign_unit_base, a = [],
                  m = agenda, f = apply_evt},
         #trigger{label = evt_campaign_unit_steal, a = [],
                  m = agenda, f = apply_evt},
         #trigger{label = evt_tournament_combat, a = [],
                  m = agenda, f = apply_evt},
         #trigger{label = evt_elf_combat, a = [], m = agenda,
                  f = apply_evt},
         #trigger{label = evt_hide_seek, a = [], m = agenda,
                  f = apply_evt},
         #trigger{label = evt_enjoy_moon, a = [], m = agenda,
                  f = apply_evt},
         #trigger{label = evt_camp_cake_finish, a = [],
                  m = agenda, f = apply_evt},
         #trigger{label = evt_campaign_bag_fill, a = [],
                  m = agenda, f = apply_evt},
         #trigger{label = evt_kongming_lanterns_answer, a = [],
                  m = agenda, f = apply_evt},
         #trigger{label = evt_mid_pudding_answer, a = [],
                  m = agenda, f = apply_evt},
         #trigger{label = evt_national_wisdom, a = [],
                  m = agenda, f = apply_evt},
         #trigger{label = evt_campaign_unit_card, a = [],
                  m = agenda, f = apply_evt},
         #trigger{label = evt_campaign_unit_card_boss, a = [],
                  m = agenda, f = apply_evt},
         #trigger{label = evt_campaign_snow, a = [], m = agenda,
                  f = apply_evt},
         #trigger{label = evt_camp_halloween, a = [], m = agenda,
                  f = apply_evt},
         #trigger{label = evt_campaign_unit_heap2, a = [],
                  m = agenda, f = apply_evt},
         #trigger{label = evt_maze, a = [], m = agenda,
                  f = apply_evt},
         #trigger{label = evt_guild_siege_combat, a = [],
                  m = agenda, f = apply_evt},
         #trigger{label = evt_rencounter, a = [], m = agenda,
                  f = apply_evt},
         #trigger{label = evt_guild_dungeon, a = [], m = agenda,
                  f = apply_evt},
         #trigger{label = evt_campaign_unit_fox, a = [],
                  m = agenda, f = apply_evt},
         #trigger{label = evt_camp_whiteday, a = [], m = agenda,
                  f = apply_evt},
         #trigger{label = evt_camp_animal_chess, a = [],
                  m = agenda, f = apply_evt},
         #trigger{label = evt_goodvoice, a = [], m = agenda,
                  f = apply_evt},
         #trigger{label = evt_question_match, a = [], m = agenda,
                  f = apply_evt},
         #trigger{label = evt_glory, a = [], m = agenda,
                  f = apply_evt},
         #trigger{label = evt_gold_league_fight, a = [],
                  m = agenda, f = apply_evt},
         #trigger{label = evt_spirit_treasure_general, a = [],
                  m = agenda, f = apply_evt},
         #trigger{label = evt_spirit_treasure_boss, a = [],
                  m = agenda, f = apply_evt},
         #trigger{label = evt_exquisite_shelf_wave, a = [],
                  m = agenda, f = apply_evt},
         #trigger{label = evt_campaign_unit_order, a = [],
                  m = agenda, f = apply_evt},
         #trigger{label = evt_mid_pudding_agenda, a = [],
                  m = agenda, f = apply_evt},
         #trigger{label = evt_guild_dragon, a = [], m = agenda,
                  f = apply_evt},
         #trigger{label = evt_may_day_clean, a = [], m = agenda,
                  f = apply_evt},
         #trigger{label = evt_campaign_unit_match, a = [],
                  m = agenda, f = apply_evt},
         #trigger{label = evt_stars_trial, a = [], m = agenda,
                  f = apply_evt},
         #trigger{label = evt_oracle_treasure_general, a = [],
                  m = agenda, f = apply_evt},
         #trigger{label = evt_oracle_treasure_boss, a = [],
                  m = agenda, f = apply_evt},
         #trigger{label = evt_camp_black_white_chess, a = [],
                  m = agenda, f = apply_evt},
         #trigger{label = evt_canyon_summit_join, a = [],
                  m = agenda, f = apply_evt},
         #trigger{label = evt_star_moon, a = [], m = agenda,
                  f = apply_evt},
         #trigger{label = evt_campaign_unit_order_boss, a = [],
                  m = agenda, f = apply_evt}],
    NewProgs = case Progs of
                   [] ->
                       [#agenda_prog{id = Id} || Id <- agenda_data:list()];
                   _ -> update_progs(agenda_data:list(), Progs)
               end,
    Now = date:unixtime(),
    {NewRecommends, NewRecommended} = case
                                          date:is_same_five_reset(Recommended,
                                                                  Now)
                                          of
                                          true -> {Recommends, Recommended};
                                          _ -> {do_recommend(NewProgs), Now}
                                      end,
    Role1 = Role#role{m_agenda =
                          Agenda#m_agenda{progress = NewProgs,
                                          last_recommended = NewRecommended,
                                          recommends = NewRecommends}},
    {_, NewRole} = role_trigger:add(L, Role1),
    NewRole1 = double_init(NewRole),
    NewRole2 = login_gift(NewRole1),
    {ok, NewRole2}.

delay_login(Role = #role{lev = RoleLev}) ->
    case var:get_var(Role, day, 605, 0) of
        0 ->
            Day = date:day_of_the_week(erlang:date()),
            case agenda_data:get_agenda_mail(Day) of
                #{title := Title, args := Args} ->
                    case do_get_content(RoleLev, Args) of
                        AllContent = [_ | _] ->
                            Len = length(AllContent),
                            Tab = if Len >= 3 -> "\n";
                                     Len >= 2 -> "\n\n\n";
                                     true -> "\n\n\n\n\n"
                                  end,
                            Content = string:join(AllContent, "\n"),
                            NewContent =
                                util:flist(lang:get("亲爱的玩家：\n今日尚有多个活动，丰厚的奖励等你参与。切记不要错过了！\n~ts~ts{p"
                                                    "anel_2, 12002, ~w, 点击前往日程界面查看}"),
                                           [Content, Tab, 5]),
                            Mail = #{title => Title, content => NewContent,
                                     items => []},
                            mail:send(Role, Mail),
                            NewRole = var:set_var(Role, day, 605, 1),
                            {ok, NewRole};
                        _ -> ok
                    end;
                _ -> ok
            end;
        _ -> ok
    end.

do_get_content(RoleLev, Args) ->
    {H, M, S} = erlang:time(),
    Now = H * 3600 + M * 60 + S,
    do_get_content(RoleLev, Args, Now, 1, []).

do_get_content(_, [], _Now, _Flag, Content) ->
    lists:reverse(Content);
do_get_content(RoleLev,
               [{Desc, MinLev, MaxLev, EndTime} | T], Now, Flag,
               Content)
    when RoleLev >= MinLev andalso
             RoleLev =< MaxLev andalso Now =< EndTime ->
    NewDesc = util:flist("~w：~ts", [Flag, Desc]),
    do_get_content(RoleLev,
                   T,
                   Now,
                   Flag + 1,
                   [NewDesc | Content]);
do_get_content(RoleLev, [_ | T], Now, Flag, Content) ->
    do_get_content(RoleLev, T, Now, Flag, Content).

reset(Role = #role{m_agenda =
                       Agenda = #m_agenda{progress = Progs}},
      OldRole) ->
    gift_for_beta(Role),
    NRole = case double_point_fresh(Role, OldRole) of
                ok -> Role;
                {ok, Role1} -> Role1
            end,
    NewRole = NRole#role{m_agenda =
                             Agenda#m_agenda{progress =
                                                 reset_prog(zero, Progs)}},
    push(NewRole, 12000),
    {ok, reset_energy(NewRole)}.

reset_five(Role = #role{m_agenda =
                            Agenda = #m_agenda{progress = Progs,
                                               activity = OldVal}},
           _OldRole) ->
    ActivityRewardsList = [{Id,
                            is_have_activity_reward(Role, Id)}
                           || Id <- agenda_data:list_activity()],
    sned_activity_reward_mail(Role, ActivityRewardsList),
    Now = date:unixtime(),
    Recommends = do_recommend(Progs),
    logger:debug("推荐ids ~w", [Recommends], agenda, 241),
    NewRole = Role#role{m_agenda =
                            Agenda#m_agenda{progress = reset_prog(five, Progs),
                                            activity = 0, rewarded = [],
                                            last_joined = Now,
                                            last_recommended = Now,
                                            recommends = Recommends}},
    push(NewRole, 12000),
    log:activity(NewRole, "重置", OldVal, 0),
    agenda:push(NewRole, 12004),
    agenda:push(NewRole, 12000),
    {ok, NewRole}.

reset_week_five(Role = #role{m_agenda =
                                 Agenda = #m_agenda{progress = Progs}},
                _OldRole) ->
    NewRole = Role#role{m_agenda =
                            Agenda#m_agenda{progress =
                                                reset_prog(week_five, Progs)}},
    {ok, NewRole}.

push(Role = #role{link = #link{conn_pid = ConnPid},
                  m_agenda = #m_agenda{recommends = Recommends}},
     Cmd = 12000) ->
    L = list(Role),
    sys_conn:pack_send(ConnPid, Cmd, {L, Recommends});
push(Role = #role{link = #link{conn_pid = ConnPid},
                  m_agenda =
                      #m_agenda{rewarded = Rewarded, last_rewarded = Last}},
     Cmd = 12004) ->
    Now = date:unixtime(),
    NewRewarded = case date:is_same_five_reset(Now, Last) of
                      true -> Rewarded;
                      _ -> []
                  end,
    Data = {calc_activity(Role), NewRewarded},
    sys_conn:pack_send(ConnPid, Cmd, Data).

activity_reward(Role = #role{m_agenda =
                                 Agenda = #m_agenda{rewarded = Rewarded,
                                                    last_rewarded = Last},
                             pid = Pid},
                Id) ->
    case agenda_data:get_activity(Id) of
        none -> {false, lang:get("没有该奖励")};
        {Need, _Num, ItemList} ->
            Now = date:unixtime(),
            Rewarded1 = case date:is_same_five_reset(Now, Last) of
                            true -> Rewarded;
                            _ -> []
                        end,
            case lists:member(Id, Rewarded1) of
                true -> {false, lang:get("你今天已经领取过该奖励了")};
                _ ->
                    case calc_activity(Role) >= Need of
                        true ->
                            ItemList1 = case Id =:= 22538 andalso
                                                 Now >= 1471622400 andalso
                                                     Now =< 1471874400
                                            of
                                            true -> [{21703, 1} | ItemList];
                                            _ -> ItemList
                                        end,
                            G = format:val_to_gain([{I, 0, N}
                                                    || {I, N} <- ItemList1]),
                            case role_gain:do_notice(G, Role) of
                                {ok, Role1} ->
                                    NewRole = Role1#role{m_agenda =
                                                             Agenda#m_agenda{rewarded
                                                                                 =
                                                                                 [Id
                                                                                  | Rewarded1],
                                                                             last_rewarded
                                                                                 =
                                                                                 Now}},
                                    push(NewRole, 12004),
                                    notice:gain_item(Pid, 1, G),
                                    {ok, NewRole};
                                {false, #gain{msg = Msg}} -> {false, Msg}
                            end;
                        _ -> {false, util:flist(lang:get("需要~w活跃度哦"), [Need])}
                    end
            end
    end.

-spec get_state_timeout(Id :: non_neg_integer(),
                        PrepareSec :: non_neg_integer()) -> false |
                                                            {idle |
                                                             notice |
                                                             active,
                                                             non_neg_integer()}.

get_state_timeout(Id, PrepareSec) ->
    Now = date:unixtime(),
    Zero = date:unixtime(zero),
    case agenda_data:get(Id) of
        Cfg = #{starttime := Start, endtime := End} ->
            IsToday = case Cfg of
                          #{args := WeekDays1} ->
                              lists:member(date:day_of_the_week(Now),
                                           WeekDays1);
                          _ -> true
                      end,
            logger:debug("IsToday:~w, Zero: ~w Start: ~w PrepareSec: "
                         "~w, Now: ~w",
                         [IsToday, Zero, Start, PrepareSec, Now],
                         agenda,
                         329),
            if IsToday andalso Now < Zero + Start - PrepareSec ->
                   {idle, Zero + Start - PrepareSec - Now};
               IsToday andalso
                   Now >= Zero + Start - PrepareSec andalso
                       Now < Zero + Start ->
                   {notice, Zero + Start - Now};
               IsToday andalso
                   Now >= Start + Zero andalso Now < Zero + End - 600 ->
                   {active, Zero + End - Now};
               true ->
                   case Cfg of
                       #{args := []} ->
                           {idle, date:next_diff(Start - PrepareSec, Now)};
                       #{args := WeekDays} ->
                           {idle,
                            date:week_next_diff(WeekDays,
                                                Now,
                                                Start - PrepareSec)};
                       _ -> {idle, date:next_diff(Start - PrepareSec, Now)}
                   end
            end;
        _ -> false
    end.

get_duration(Id) ->
    case agenda_data:get(Id) of
        #{starttime := Start, endtime := End} ->
            min(date:next_diff({23, 59, 0}), End - Start);
        _ -> 0
    end.

gm(Role = #role{m_agenda = A}, {set_activity, Val}) ->
    Role1 = Role#role{m_agenda =
                          A#m_agenda{activity = Val,
                                     last_rewarded = date:unixtime()}},
    push(Role1, 12004),
    {ok, Role1};
gm(Role = #role{m_agenda =
                    A = #m_agenda{activity = OldVal}},
   {add_activity, Val}) ->
    NewVal = OldVal + Val,
    Role1 = Role#role{m_agenda =
                          A#m_agenda{activity = NewVal,
                                     last_rewarded = date:unixtime()}},
    push(Role1, 12004),
    Role2 = var:add_var(Role1, day, 631, Val, 0),
    Role3 = role_trigger:fire(#evt_activity{val = Val},
                              Role2),
    {ok, Role3};
gm(Role = #role{m_agenda = A}, clear_reward) ->
    Role1 = Role#role{m_agenda = A#m_agenda{rewarded = []}},
    push(Role1, 12004),
    {ok, Role1}.

extract_reserve_exp(Role, _Exp, 7) -> {Role, 0};
extract_reserve_exp(Role = #role{assets =
                                     Assets = #assets{reserve_exp =
                                                          ReserveExp}},
                    Exp, _Source)
    when Exp > 0 andalso ReserveExp > 0 ->
    {NewReserveExp, AddExp} = case ReserveExp >= Exp of
                                  true -> {ReserveExp - Exp, Exp};
                                  false -> {0, ReserveExp}
                              end,
    NewAssets = Assets#assets{reserve_exp = NewReserveExp},
    {Role#role{assets = NewAssets}, AddExp};
extract_reserve_exp(Role, _Exp, _Source) -> {Role, 0}.

calc_reserve_exp(Role = #role{lev = Lev,
                              m_var =
                                  #m_var{day_vars = DayVars,
                                         day_five_vars = DayFiveVars},
                              assets =
                                  Assets = #assets{reserve_exp = ReserveExp}},
                 {ResetFlag, ResetTime, ResetMode}) ->
    Now = date:unixtime(),
    Result = case ResetFlag of
                 zero -> agenda_data:get_reserve_type(1);
                 five -> agenda_data:get_reserve_type(2);
                 _ -> false
             end,
    {_, ExpRatio, _CoinRatio} = world_lev:calc_exp(Role),
    case Result of
        CalcList = [_ | _] ->
            CheckVars = case ResetFlag of
                            zero ->
                                Reset1 = date:unixtime({zero, ResetTime}),
                                Reset2 = date:unixtime(zero) - 86400,
                                case Reset1 =:= Reset2 of
                                    true -> DayVars;
                                    false -> []
                                end;
                            five ->
                                Reset1 = date:get_five_reset(ResetTime),
                                Reset2 = date:get_five_reset(Now) - 86400,
                                case Reset1 =:= Reset2 of
                                    true -> DayFiveVars;
                                    false -> []
                                end
                        end,
            Privilege = privilege:get_val(Role, 106),
            PrivilegeReserveExp = case ResetFlag of
                                      zero when Privilege > 0 ->
                                          privilege_data:get_save_exp(Lev);
                                      _ -> 0
                                  end,
            AddExp = do_calc_reserve_exp(Role,
                                         CheckVars,
                                         CalcList,
                                         0),
            AddExp1 = round((AddExp + PrivilegeReserveExp) *
                                ExpRatio
                                / 1000),
            case agenda_data:get_max_reserve_exp(Lev) of
                MaxReserveExp when is_integer(MaxReserveExp) ->
                    NewReserveExp = min(MaxReserveExp,
                                        ReserveExp + AddExp1),
                    NewAssets = Assets#assets{reserve_exp = NewReserveExp},
                    NewRole = Role#role{assets = NewAssets},
                    case NewReserveExp =/= ReserveExp andalso
                             ResetMode =/= login
                        of
                        true -> role_gain:push_exp(NewRole);
                        false -> skip
                    end,
                    NewRole;
                _ ->
                    logger:error("无法获取~w级的最大储备经验", [Lev], agenda, 456),
                    Role
            end;
        _ -> Role
    end.

-spec list(#role{}) -> [tuple()].

list(#role{m_agenda = #m_agenda{progress = Progs}}) ->
    calc_list(Progs).

calc_list([]) -> [];
calc_list([#agenda_prog{id = Id, joined = Joined}
           | T]) ->
    case agenda_data:get(Id) of
        #{max_try := Max} -> [{Id, Joined, Max} | calc_list(T)];
        _ -> calc_list(T)
    end.

take_care_junior(Role) ->
    take_care_junior(Role, normal).

take_care_junior(Role = #role{lev = LeadLev}, Label)
    when is_atom(Label) ->
    case team:get_members(Role) of
        [H | T] ->
            Mul = reward_senior_mul(Label),
            Num = length([M
                          || M = #team_mate{lev = Lev, status = 2} <- [H | T],
                             LeadLev - Lev >= 10]),
            Num1 = min(2, Num) * Mul,
            reward_senior(Role, Num1);
        _ -> Role
    end;
take_care_junior(Role, Fighters) ->
    take_care_junior(Role, Fighters, normal).

take_care_junior(Role = #role{lev = LeadLev}, Fighters,
                 Label) ->
    Mul = reward_senior_mul(Label),
    Num = length([M
                  || M = #fighter{lev = Lev, type = 1} <- Fighters,
                     LeadLev - Lev >= 10]),
    Num1 = min(2, Num) * Mul,
    reward_senior(Role, Num1).

helper_apply(Pid, Type) when is_pid(Pid) ->
    role:apply(async,
               Pid,
               {agenda, async_reward_helper, [Type]});
helper_apply(_Pid, _Type) -> ok.

async_reward_helper(Role = #role{m_dungeon =
                                     #m_dungeon{dun_id = DunId},
                                 lev = Lev},
                    dungeon) ->
    Num = 3,
    DungeonPass = dungeon_util:get_pass(Role),
    Total = lists:sum([min(3, Done)
                       || {_, Done} <- DungeonPass, is_integer(Done)]),
    TotalLimit = dungeon_data:get_day_limit(Lev),
    case lists:keyfind(DunId, 1, DungeonPass) of
        _ when Total > TotalLimit ->
            {ok, reward_helper(Role, Num, lang:get("协助他人完成副本"))};
        {_, N} when N >= 3 ->
            {ok, reward_helper(Role, Num, lang:get("协助他人完成副本"))};
        _ -> ok
    end;
async_reward_helper(_Role, _Type) -> ok.

reward_helper(Role, Num, Msg) ->
    Gain = [#gain{label = character, val = Num,
                  notice_msg = Msg}],
    case role_gain:do(Gain, Role) of
        {ok, Role1} -> Role1;
        _ -> Role
    end.

calc_activity(#role{m_agenda =
                        #m_agenda{last_joined = Last, activity = Activity}}) ->
    case date:is_same_five_reset(date:unixtime(), Last) of
        true -> Activity;
        _ -> 0
    end.

apply_evt(#evt_commit_quest{id = Id}, Role) ->
    case quest_data:get(Id) of
        #quest_data{sec_type = 3, is_leader_quest = 0} ->
            acc_prog(Role, 1000);
        #quest_data{sec_type = 4} -> acc_prog(Role, 1001);
        #quest_data{sec_type = 10} -> acc_prog(Role, 1010);
        #quest_data{sec_type = 12} -> acc_prog(Role, 1013);
        #quest_data{sec_type = 14} ->
            case quest_chain:check_agenda_prog(Role) of
                true -> acc_prog(Role, 1010);
                _ -> ok
            end;
        #quest_data{sec_type = 15} -> acc_prog(Role, 1018);
        #quest_data{sec_type = 16} -> acc_prog(Role, 1018);
        #quest_data{sec_type = 17} -> acc_prog(Role, 2017);
        #quest_data{sec_type = 18} -> acc_prog(Role, 1020);
        #quest_data{sec_type = 21} -> acc_prog(Role, 1023);
        _ -> ok
    end;
apply_evt(#evt_arena_fight{}, Role) ->
    acc_prog(Role, 1002);
apply_evt(#evt_tower{}, Role) ->
    acc_prog(Role, [1004, 1022]);
apply_evt(#evt_trial{}, Role) -> acc_prog(Role, 1006);
apply_evt(#evt_guild_siege_combat{}, Role) ->
    acc_prog(Role, 2036);
apply_evt(#evt_kill_npc{base_id = BaseId}, Role) ->
    case world_boss_data:get(BaseId) of
        #{id := BaseId} -> acc_prog(Role, 1007);
        _ -> ok
    end;
apply_evt(#evt_parade{}, Role) -> acc_prog(Role, 1008);
apply_evt(#evt_shipping_sail{}, Role) ->
    acc_prog(Role, 1009);
apply_evt(#evt_quest_treasure{}, Role) ->
    acc_prog(Role, 1011);
apply_evt(#evt_kill_treasure_ghost{}, Role) ->
    acc_prog(Role, 1014);
apply_evt(#evt_pray{}, Role) -> acc_prog(Role, 1019);
apply_evt(#evt_escort{}, Role) -> acc_prog(Role, 2001);
apply_evt(#evt_qualifying_combat{}, Role) ->
    acc_prog(Role, 2002);
apply_evt(#evt_examination{type = 1}, Role) ->
    acc_prog(Role, 2007);
apply_evt(#evt_examination{type = 2}, Role) ->
    acc_prog(Role, 2008);
apply_evt(#evt_examination{}, Role) ->
    acc_prog(Role, 2009);
apply_evt(#evt_kill_guild_robber{}, Role) ->
    acc_prog(Role, [2004]);
apply_evt(#evt_constellation{}, Role) ->
    acc_prog(Role, [2013]);
apply_evt(#evt_guild_hero{}, Role) ->
    acc_prog(Role, [2020]);
apply_evt(#evt_brave_trial_order{}, Role) ->
    acc_prog(Role,
             [2022, 2035, 2050, 2071, 2087, 2091, 2102]);
apply_evt(#evt_campaign_unit_fox{}, Role) ->
    acc_prog(Role, [2051]);
apply_evt(#evt_campaign_unit_kill_boss{}, Role) ->
    acc_prog(Role, [2024]);
apply_evt(#evt_dragon_boat{}, Role) ->
    acc_prog(Role, [2079, 2092]);
apply_evt(#evt_campaign_unit_base{}, Role) ->
    acc_prog(Role, [2108]);
apply_evt(#evt_campaign_unit_steal{}, Role) ->
    acc_prog(Role, [2093]);
apply_evt(#evt_tournament_combat{}, Role) ->
    Week = date:day_of_the_week(date:unixtime()),
    case Week =:= 2 of
        true -> acc_prog(Role, 2049);
        _ -> acc_prog(Role, 2028)
    end;
apply_evt(#evt_elf_combat{}, Role) ->
    acc_prog(Role, 2027);
apply_evt(#evt_hide_seek{}, Role) ->
    acc_prog(Role, 2031);
apply_evt(#evt_hero{}, Role) ->
    acc_prog(Role, [2019, 2023]);
apply_evt(#evt_kongming_lanterns_answer{}, Role) ->
    logger:debug("收到孔明灯============", [], agenda, 629),
    acc_prog(Role, [2109, 2033, 2045]);
apply_evt(#evt_mid_pudding_answer{}, Role) ->
    acc_prog(Role, [2109, 2033, 2045]);
apply_evt(#evt_mid_pudding_agenda{}, Role) ->
    logger:debug("aaaaaaaaaaaaaaaaaa灯会啦aaaaaaaaaaaaaaaaa",
                 [],
                 agenda,
                 634),
    acc_prog(Role, [2109, 2063, 2096]);
apply_evt(#evt_campaign_unit_order{}, Role) ->
    logger:debug("aaaaaaaaaaaaaaaaaa赏诗啦aaaaaaaaaaaaaaaaa",
                 [],
                 agenda,
                 637),
    acc_prog(Role, [2103]);
apply_evt(#evt_campaign_unit_order_boss{}, Role) ->
    acc_prog(Role, [2099]);
apply_evt(#evt_enjoy_moon{}, Role) ->
    acc_prog(Role, [2034]);
apply_evt(#evt_camp_halloween{}, Role) ->
    acc_prog(Role, [2084]);
apply_evt(#evt_camp_cake_finish{}, Role) ->
    acc_prog(Role, [2039]);
apply_evt(#evt_campaign_bag_fill{}, Role) ->
    acc_prog(Role, [2040]);
apply_evt(#evt_campaign_unit_card{}, Role) ->
    acc_prog(Role, [2041, 2085]);
apply_evt(#evt_campaign_unit_card_boss{}, Role) ->
    acc_prog(Role, [2043, 2086]);
apply_evt(#evt_campaign_unit_heap2{}, Role) ->
    acc_prog(Role, [2090, 2095]);
apply_evt(#evt_campaign_snow{}, Role) ->
    acc_prog(Role, [2101]);
apply_evt(#evt_spirit_treasure_general{}, Role) ->
    acc_prog(Role, [2057, 2060]);
apply_evt(#evt_spirit_treasure_boss{}, Role) ->
    acc_prog(Role, [2058, 2059]);
apply_evt(#evt_oracle_treasure_general{}, Role) ->
    acc_prog(Role, [2075, 2076]);
apply_evt(#evt_oracle_treasure_boss{}, Role) ->
    acc_prog(Role, [2073, 2074]);
apply_evt(#evt_may_day_clean{}, Role) ->
    acc_prog(Role, [2067, 2094]);
apply_evt(#evt_dungeon_unit_reward{id = DunId},
          Role = #role{lev = Lev}) ->
    case dungeon_data:get(DunId) of
        #dungeon_base{lev_max = LevMax}
            when LevMax > 0 andalso Lev > LevMax ->
            ok;
        #dungeon_base{type = 2} ->
            DungeonPass = dungeon_util:get_pass(Role),
            case lists:keyfind(DunId, 1, DungeonPass) of
                {_, N} when N > 3 -> ok;
                _ -> acc_prog(Role, [1026, 1028])
            end;
        _ -> ok
    end;
apply_evt(#evt_dungeon_kill_unit{dun_id = DunId,
                                 unit_id = BaseId},
          Role) ->
    case DunId of
        10035 -> acc_prog(Role, 3000);
        10055 -> acc_prog(Role, 3001);
        10036 -> acc_prog(Role, 3002);
        10056 -> acc_prog(Role, 3003);
        10075 -> acc_prog(Role, 3004);
        10076 -> acc_prog(Role, 3005);
        10085 ->
            case unit_data:get(BaseId) of
                #unit_data{type = 3} -> acc_prog(Role, 1021);
                _ -> ok
            end;
        _ -> ok
    end;
apply_evt(#evt_warrior_fight{}, Role) ->
    acc_prog(Role, 2010);
apply_evt(#evt_national_wisdom{}, Role) ->
    acc_prog(Role, 2038);
apply_evt(#evt_maze{}, Role) -> acc_prog(Role, 1027);
apply_evt(#evt_rencounter{}, Role) ->
    acc_prog(Role, 1029);
apply_evt(#evt_guild_dungeon{}, Role) ->
    acc_prog(Role, 1030);
apply_evt(#evt_camp_whiteday{}, Role) ->
    acc_prog(Role, 2052);
apply_evt(#evt_goodvoice{}, Role) ->
    logger:debug("aaaaaaaaaaaaaaaaaa点赞啦aaaaaaaaaaaaaaaaa",
                 [],
                 agenda,
                 711),
    acc_prog(Role, 2055);
apply_evt(#evt_camp_animal_chess{}, Role) ->
    acc_prog(Role, 2104);
apply_evt(#evt_question_match{}, Role) ->
    logger:debug("智慧对决 ：", [], agenda, 716),
    acc_prog(Role, 2054);
apply_evt(#evt_glory{}, Role) ->
    logger:debug("智慧对决 ：", [], agenda, 719),
    acc_prog(Role, 1024);
apply_evt(#evt_gold_league_fight{}, Role) ->
    logger:debug("钻石联赛 ：", [], agenda, 722),
    acc_prog(Role, 2056);
apply_evt(#evt_guild_dragon{}, Role) ->
    logger:debug("魔龙挑战 ：", [], agenda, 725),
    acc_prog(Role, 2065);
apply_evt(#evt_exquisite_shelf_wave{}, Role) ->
    logger:debug("玲珑宝阁 ：", [], agenda, 728),
    ShelfAgendaId =
        exquisite_shelf_role:get_agenda_id(Role),
    acc_prog(Role, ShelfAgendaId);
apply_evt(#evt_campaign_unit_match{}, Role) ->
    acc_prog(Role, 2070);
apply_evt(#evt_stars_trial{}, Role) ->
    acc_prog(Role, [2072, 2082]);
apply_evt(#evt_star_moon{}, Role) ->
    acc_prog(Role, [2072, 2082]);
apply_evt(#evt_camp_black_white_chess{}, Role) ->
    acc_prog(Role, 2105);
apply_evt(#evt_canyon_summit_join{}, Role) ->
    logger:debug("峡谷之巅", [], agenda, 740),
    acc_prog(Role, 2106);
apply_evt(_, _Role) -> ok.

acc_prog(Role, []) -> {ok, Role};
acc_prog(Role, [Id | T]) ->
    case acc_prog(Role, Id) of
        ok -> acc_prog(Role, T);
        {ok, NewRole} -> acc_prog(NewRole, T)
    end;
acc_prog(Role = #role{lev = TowerLev}, Id = 1004) ->
    case agenda_data:get(Id) of
        Cfg = #{open_leve := OpenLeve, max_leve := 0}
            when TowerLev >= OpenLeve ->
            acc_prog2(Role, Cfg, Id);
        Cfg = #{open_leve := OpenLeve, max_leve := MaxLeve}
            when TowerLev >= OpenLeve andalso TowerLev =< MaxLeve ->
            acc_prog2(Role, Cfg, Id);
        _ -> ok
    end;
acc_prog(Role = #role{lev = TowerLev}, Id = 1022) ->
    case agenda_data:get(Id) of
        Cfg = #{open_leve := OpenLeve, max_leve := 0}
            when TowerLev >= OpenLeve ->
            acc_prog2(Role, Cfg, Id);
        Cfg = #{open_leve := OpenLeve, max_leve := MaxLeve}
            when TowerLev >= OpenLeve andalso TowerLev =< MaxLeve ->
            acc_prog2(Role, Cfg, Id);
        _ -> ok
    end;
acc_prog(Role = #role{lev = Lev}, Id) ->
    case agenda_data:get(Id) of
        Cfg = #{open_leve := OpenLeve, max_leve := 0}
            when Lev >= OpenLeve ->
            acc_prog2(Role, Cfg, Id);
        Cfg = #{open_leve := OpenLeve, max_leve := MaxLeve}
            when Lev >= OpenLeve andalso Lev =< MaxLeve ->
            acc_prog2(Role, Cfg, Id);
        _ -> ok
    end.

acc_prog2(Role = #role{id = RoleId, name = RoleName,
                       m_agenda = Agenda = #m_agenda{activity = OldVal}},
          Cfg = #{args := Args, reset_time := ResetTime}, _Id) ->
    Now = date:unixtime(),
    WeekDay = date:day_of_the_week(Now),
    WeekDayFive = date:day_of_the_week(Now - 5 * 3600),
    Flag = case Args of
               [] -> true;
               _ when ResetTime == 1 -> lists:member(WeekDay, Args);
               _ -> lists:member(WeekDayFive, Args)
           end,
    case do_acc_prog(Cfg#{now => Now, role_id => RoleId,
                          role_name => RoleName},
                     Agenda)
        of
        {ok, P, NewAgenda = #m_agenda{activity = NewVal}}
            when Flag == true ->
            Role1 = add_energy(Cfg,
                               P,
                               Role#role{m_agenda = NewAgenda}),
            log:activity(Role1, Cfg, OldVal, NewVal),
            log:agenda(Role1, Cfg),
            agenda_stat:log(Role1, Cfg),
            push(Role1, 12000),
            NRole1 = var:add_var(Role1,
                                 day,
                                 631,
                                 NewVal - OldVal,
                                 0),
            Role2 = role_trigger:fire(#evt_activity{val =
                                                        NewVal - OldVal},
                                      NRole1),
            Role3 = agenda_week:add_activity(Role2,
                                             NewVal - OldVal),
            {ok, Role3};
        _ -> ok
    end.

do_acc_prog(#{id := Id, activity := Add0,
              max_try := Max, max_activity := MaxAdd0, now := Now,
              reset_time := ResetTime},
            Agenda = #m_agenda{progress = Progs,
                               activity = Activity, recommends = Recommends,
                               last_recommended = Recommended}) ->
    case lists:keyfind(Id, #agenda_prog.id, Progs) of
        P = #agenda_prog{joined = Joined, last_joined = Last} ->
            Flag = case ResetTime of
                       1 -> date:is_same_day(Last, Now);
                       2 -> date:is_same_five_reset(Last, Now);
                       3 -> date:is_same_week(Last, Now, 18000)
                   end,
            {Add, MaxAdd} = case
                                date:is_same_five_reset(Recommended, Now)
                                    andalso lists:member(Id, Recommends)
                                of
                                true -> {Add0 * 2, MaxAdd0 * 2};
                                _ -> {Add0, MaxAdd0}
                            end,
            case Flag of
                true
                    when (Max =:= 0 orelse Joined < Max) andalso
                             MaxAdd > Add * Joined ->
                    NewAgenda = Agenda#m_agenda{activity = Activity + Add,
                                                last_joined = Now,
                                                progress =
                                                    lists:keyreplace(Id,
                                                                     #agenda_prog.id,
                                                                     Progs,
                                                                     P#agenda_prog{joined
                                                                                       =
                                                                                       Joined
                                                                                           +
                                                                                           1,
                                                                                   last_joined
                                                                                       =
                                                                                       Now})},
                    {ok, P, NewAgenda};
                true when Max =:= 0 orelse Joined < Max ->
                    NewAgenda = Agenda#m_agenda{last_joined = Now,
                                                progress =
                                                    lists:keyreplace(Id,
                                                                     #agenda_prog.id,
                                                                     Progs,
                                                                     P#agenda_prog{joined
                                                                                       =
                                                                                       Joined
                                                                                           +
                                                                                           1,
                                                                                   last_joined
                                                                                       =
                                                                                       Now})},
                    {ok, P, NewAgenda};
                false ->
                    NewAgenda = Agenda#m_agenda{activity = Activity + Add,
                                                last_joined = Now,
                                                progress =
                                                    lists:keyreplace(Id,
                                                                     #agenda_prog.id,
                                                                     Progs,
                                                                     P#agenda_prog{joined
                                                                                       =
                                                                                       1,
                                                                                   last_joined
                                                                                       =
                                                                                       Now})},
                    {ok, P, NewAgenda};
                _ -> ok
            end;
        _ -> ok
    end;
do_acc_prog(_, _) -> ok.

add_energy(#{energy := Add, max_energy := MaxAdd,
             achieve_energy := Achive},
           #agenda_prog{joined = Joined},
           Role = #role{lev = Lev, assets = Assets})
    when Add * Joined < MaxAdd ->
    case agenda_data:get_energy_max(Lev) of
        0 -> Role;
        Limit when Limit * 2 =< Assets#assets.energy -> Role;
        Limit ->
            Val0 = case Add * (Joined + 1) of
                       MaxAdd -> Add + Achive;
                       _ -> Add
                   end,
            Val = min(Val0, Limit * 2 - Assets#assets.energy),
            case role_gain:do([#gain{label = energy, val = Val}],
                              Role)
                of
                {ok, NewRole} ->
                    var:add_var(NewRole, day, energy_added, Val);
                _ -> Role
            end
    end;
add_energy(_, _, Role) -> Role.

reset_energy(Role = #role{lev = Lev,
                          assets = #assets{energy = Energy}}) ->
    AddLimit = month_card:get_privilege(Role, energy_limit),
    case agenda_data:get_energy_max(Lev) of
        0 -> Role;
        Limit when Limit + AddLimit >= Energy -> Role;
        Limit ->
            Val = max(0, Energy - (Limit + AddLimit)),
            case role_gain:do([#loss{label = energy, val = Val}],
                              Role)
                of
                {ok, Role2} -> Role2;
                _ -> Role
            end
    end.

energy_payoff(Role) ->
    Loss = format:val_to_loss([{90006, 25}]),
    Gain = format:val_to_gain([{90000, 4800}]),
    case role_gain:do(Loss ++ Gain, Role) of
        {ok, NewRole} ->
            Msg = notice:format(lang:get("通过打工消耗了~ts点活力值，获得了~ts"),
                                [{string_2, 5, 25}, {assets_1, 90000, 4800}]),
            {ok, Msg, NewRole};
        {false, #loss{msg = Msg}} -> {false, Msg}
    end.

gift_for_beta(Role = #role{lev = Lev,
                           platform = Platform, zone_id = ZoneId}) ->
    PlatZone = c_mirror:get_zone_mapping(Platform, ZoneId),
    case lists:member(PlatZone, [{"beta", 1}, {"dev", 1}])
        of
        true when Lev >= 50 ->
            case date:day_of_the_week(date:unixtime()) of
                1 ->
                    Title = lang:get("测试服每周奖励"),
                    Content =
                        lang:get("感谢您一直以来对测试服的贡献和支持，若游戏体验过程有任何问题、意见或建议，欢迎点击【设置-"
                                 "联系客服】进行反馈。这是本周的专属奖励，请查收"),
                    mail:send(Role,
                              #{title => Title, content => Content,
                                items => [{70556, 1}], del_type => 3}),
                    ok;
                _ -> ok
            end;
        _ -> ok
    end;
gift_for_beta(_Role) -> ok.

login_gift(Role = #role{lev = Lev}) ->
    BuyList = var:get_var(Role, other, 2005, []),
    Now = date:unixtime(),
    List = agenda_data:list_lev_gift(),
    case do_calc_levup_gift(Role,
                            List,
                            Now,
                            Lev,
                            BuyList,
                            0)
        of
        {true, NewRole, _NewBuyList} -> NewRole;
        _ -> Role
    end;
login_gift(Role) -> Role.

levup_gift(Role, Lev, NewLev) when NewLev > Lev ->
    BuyList = var:get_var(Role, other, 2005, []),
    Now = date:unixtime(),
    List = agenda_data:list_lev_gift(),
    case do_calc_levup_gift(Role,
                            List,
                            Now,
                            NewLev,
                            BuyList,
                            0)
        of
        {true, NewRole, NewBuyList} ->
            role:link_send(NewRole, 12008, {NewBuyList}),
            NewRole;
        _ -> Role
    end;
levup_gift(Role, _, _) -> Role.

do_calc_levup_gift(Role, [], _Now, _NewLev, BuyList,
                   1) ->
    Role1 = var:set_var(Role, other, 2005, BuyList),
    {true, Role1, BuyList};
do_calc_levup_gift(_Role, [], _Now, _NewLev, _BuyList,
                   0) ->
    false;
do_calc_levup_gift(Role = #role{classes = Classes},
                   [Idx | T], Now, NewLev, BuyList, Flag) ->
    case lists:keymember(Idx, 1, BuyList) of
        true ->
            do_calc_levup_gift(Role, T, Now, NewLev, BuyList, Flag);
        false ->
            DataList = agenda_data:get_lev_gift(Idx),
            case [Data
                  || Data = #{classes := Classes1} <- DataList,
                     Classes1 =:= 0 orelse Classes =:= Classes1]
                of
                [#{time := Time, lev := NeedLev}]
                    when NewLev >= NeedLev ->
                    EndTime = Now + Time,
                    Data = {Idx, NeedLev, EndTime, 0},
                    do_calc_levup_gift(Role,
                                       T,
                                       Now,
                                       NewLev,
                                       [Data | BuyList],
                                       1);
                _ ->
                    do_calc_levup_gift(Role, T, Now, NewLev, BuyList, Flag)
            end
    end.

buy_lev_gift(Idx, Role) ->
    BuyList = var:get_var(Role, other, 2005, []),
    Now = date:unixtime(),
    case lists:keyfind(Idx, 1, BuyList) of
        {_, _, _, 1} -> {false, lang:get("已经过该等级礼包")};
        {_, _, EndTime, _} when Now > EndTime ->
            {false, lang:get("已经超时了，无法购买等级礼包")};
        {Idx, Lev, EndTime, IsBuy} ->
            do_buy_lev_gift(Role,
                            {Idx, Lev, EndTime, IsBuy},
                            BuyList);
        _ -> {false, lang:get("等级已过，无法购买此等级礼包")}
    end.

do_buy_lev_gift(Role = #role{classes = Classes},
                {Idx, Lev, EndTime, _IsBuy}, BuyList) ->
    DataList = agenda_data:get_lev_gift(Idx),
    case [Data
          || Data = #{classes := Classes1} <- DataList,
             Classes1 =:= 0 orelse Classes =:= Classes1]
        of
        [#{loss := Loss, item_list := ItemList}] ->
            Result = case format:val_to_loss(Loss) of
                         LossList = [_ | _] ->
                             ItemList1 = [{ItemId, 0, ItemNum}
                                          || {ItemId, ItemNum} <- ItemList],
                             case format:val_to_gain(ItemList1) of
                                 GainList = [_ | _] ->
                                     {true, LossList, GainList};
                                 _ -> {false, lang:get("不存在礼包数据，无法购买")}
                             end;
                         _ -> {false, lang:get("不存在礼包数值，无法购买")}
                     end,
            case Result of
                {true, NeedLoss, NeedGain} ->
                    case role_gain:do_notice(NeedLoss, Role) of
                        {false, #loss{msg = Msg}} -> {false, Msg};
                        {ok, NewRole} ->
                            case role_gain:do_notice(NeedGain, NewRole) of
                                {false, #gain{reason = bag_full}} ->
                                    Title = lang:get("购买等级礼包"),
                                    Content = lang:get("购买等级礼包时，背包已满"),
                                    mail:send(NewRole,
                                              #{title => Title,
                                                content => Content,
                                                items => ItemList}),
                                    NewBuyList = lists:keyreplace(Idx,
                                                                  1,
                                                                  BuyList,
                                                                  {Idx,
                                                                   Lev,
                                                                   EndTime,
                                                                   1}),
                                    NewRole1 = var:set_var(NewRole,
                                                           other,
                                                           2005,
                                                           NewBuyList),
                                    role:link_send(NewRole1,
                                                   12008,
                                                   {NewBuyList}),
                                    {ok, NewRole1, lang:get("背包已满，道具发送到邮件")};
                                {ok, NewRole1} ->
                                    NewBuyList = lists:keyreplace(Idx,
                                                                  1,
                                                                  BuyList,
                                                                  {Idx,
                                                                   Lev,
                                                                   EndTime,
                                                                   1}),
                                    NewRole2 = var:set_var(NewRole1,
                                                           other,
                                                           2005,
                                                           NewBuyList),
                                    role:link_send(NewRole2,
                                                   12008,
                                                   {NewBuyList}),
                                    {ok, NewRole2, ""};
                                _ -> {false, lang:get("道具错误，无法增加")}
                            end
                    end;
                {false, Reason} -> {false, Reason}
            end;
        _ -> {false, lang:get("不存在的等级礼包")}
    end.

fix_double(Role) ->
    case var:get_var(Role, other, 2071, undefined) of
        undefined ->
            AllPoint = var:get_var(Role, acc, 1001, 150),
            NewAllPoint = AllPoint + 10,
            Role1 = var:set_var(Role, acc, 1001, NewAllPoint),
            Role2 = var:set_var(Role1, other, 2071, 1),
            Role2;
        _ -> Role
    end.

apply_fix_double() ->
    role_group:apply(world,
                     {agenda, do_apply_fix_double, []}).

do_apply_fix_double(Role) ->
    Role1 = fix_double(Role),
    {Point, AllPoint} = double_point_info(Role1),
    role:link_send(Role1, 12001, {Point, AllPoint}),
    {ok, Role1}.

in_double(Role) ->
    Point = var:get_var(Role, acc, 1000, 0),
    case Point > 0 of
        true -> 1;
        false -> 0
    end.

add_double(Role, Val) ->
    {Point, AllPoint} = double_point_info(Role),
    CanAdd = 420 - AllPoint,
    case CanAdd >= Val of
        true ->
            NewAllPoint = AllPoint + Val,
            Role1 = var:set_var(Role, acc, 1001, NewAllPoint),
            role:link_send(Role, 12001, {Point, NewAllPoint}),
            {ok, Role1};
        false -> {false, lang:get("当前可用双倍点数过多，无需使用此道具")}
    end.

double_init(Role = #role{name = _Name}) ->
    case var:get_var(Role, acc, 1001, undefined) of
        undefined ->
            {WorldLev, _} = world_lev:get_world_lev(),
            OpenTime = env:srv_open_time(),
            Now = date:unixtime(),
            BaseDouble = case date:is_same_week(OpenTime, Now) of
                             true ->
                                 case date:day_of_the_week(date()) of
                                     1 -> 140;
                                     2 -> 140;
                                     3 -> 120;
                                     4 -> 100;
                                     5 -> 80;
                                     6 -> 60;
                                     _ -> 40
                                 end;
                             false -> 140
                         end,
            ExtDouble = agenda_data:get_ext_double(WorldLev),
            InitDouble = BaseDouble + ExtDouble,
            Role1 = var:set_var(Role, acc, 1001, InitDouble),
            Role1;
        _ -> Role
    end.

double_point_info(Role) ->
    Point = var:get_var(Role, acc, 1000, 0),
    AllPoint = var:get_var(Role, acc, 1001, 150),
    {Point, AllPoint}.

get_double_point(Role = #role{id = RoleId,
                              name = RoleName}) ->
    {Point, AllPoint} = double_point_info(Role),
    case AllPoint > 0 of
        true ->
            Limit = min(60 - Point, 30),
            case Limit =< 0 of
                true ->
                    Msg = util:flist(lang:get("当前领取点数已达~w点, 无法继续领取"), [60]),
                    {false, Msg};
                false ->
                    {GetPoint, NewAllPoint} = case AllPoint >= Limit of
                                                  true ->
                                                      {Limit, AllPoint - Limit};
                                                  false -> {AllPoint, 0}
                                              end,
                    NewPoint = Point + GetPoint,
                    Role1 = var:set_var(Role, acc, 1000, NewPoint),
                    Role2 = var:set_var(Role1, acc, 1001, NewAllPoint),
                    role:link_send(Role2, 12001, {NewPoint, NewAllPoint}),
                    Msg = util:flist(lang:get("成功领取~w点双倍点数, 本周剩余~w点双倍点数"),
                                     [GetPoint, NewAllPoint]),
                    Msg2 = notice:format(lang:get("~ts领取了~ts点双倍点数"),
                                         [{role_1, RoleId, RoleName},
                                          {string_2, 5, GetPoint}]),
                    team:notice(Role, Msg2),
                    {ok, Role2, Msg}
            end;
        false -> {false, lang:get("双倍点数不足, 无法领取")}
    end.

freeze_double_point(Role) ->
    {Point, AllPoint} = double_point_info(Role),
    case Point > 1 of
        true ->
            AddPoint = Point - 1,
            NewPoint = 0,
            NewAllPoint = AllPoint + AddPoint,
            Role1 = var:set_var(Role, acc, 1000, NewPoint),
            Role2 = var:set_var(Role1, acc, 1001, NewAllPoint),
            role:link_send(Role2, 12001, {NewPoint, NewAllPoint}),
            {ok,
             Role2,
             util:flist(lang:get("冻结损耗1点双倍点数, 成功冻结~w点双倍点数"),
                        [AddPoint])};
        false -> {false, lang:get("领取的双倍点数大于1点时,才可以冻结")}
    end.

double_point_fresh(Role,
                   #role{m_var = #m_var{last_reset_time = LastT}}) ->
    Now = date:unixtime(),
    case date:is_same_week(LastT, Now) of
        true -> ok;
        false ->
            {Point, AllPoint} = double_point_info(Role),
            NewAllPoint = min(420, 150 + AllPoint),
            Role1 = var:set_var(Role, acc, 1001, NewAllPoint),
            role:link_send(Role, 12001, {Point, NewAllPoint}),
            {ok, Role1}
    end.

combat_loss_double_point(_, 3, Role) ->
    {Point, AllPoint} = double_point_info(Role),
    case Point > 0 of
        true ->
            case util:rand(1, 1000) > 500 of
                true ->
                    NewPoint = Point - 1,
                    Role1 = var:set_var(Role, acc, 1000, NewPoint),
                    role:link_send(Role, 12001, {NewPoint, AllPoint}),
                    {true, Role1};
                false -> {true, Role}
            end;
        false -> {false, Role}
    end;
combat_loss_double_point(_, 8,
                         Role = #role{m_quest =
                                          #m_quest{quest_offer =
                                                       #quest_offer{day_count =
                                                                        DayCount}}}) ->
    {Point, AllPoint} = double_point_info(Role),
    case Point > 0 of
        true ->
            case DayCount < 30 of
                true ->
                    NewPoint = Point - 1,
                    Role1 = var:set_var(Role, acc, 1000, NewPoint),
                    role:link_send(Role, 12001, {NewPoint, AllPoint}),
                    {true, Role1};
                false -> {false, Role}
            end;
        false -> {false, Role}
    end;
combat_loss_double_point(_, _CombatType, Role) ->
    {false, Role}.

reward_senior(Role, Add) when Add =< 0 -> Role;
reward_senior(Role, Add) ->
    Gain = [#gain{label = character, val = Add,
                  notice_msg = lang:get("由于你队伍中有新人")}],
    case role_gain:do(Gain, Role) of
        {ok, NewRole} -> NewRole;
        _ -> Role
    end.

reward_senior_mul(tower_boss) -> 5;
reward_senior_mul(dungeon) -> 6;
reward_senior_mul(quest_offer) -> 3;
reward_senior_mul(_) -> 1.

update_progs([], Progs) -> Progs;
update_progs([Id | T], Progs) ->
    case lists:keyfind(Id, #agenda_prog.id, Progs) of
        #agenda_prog{} -> update_progs(T, Progs);
        _ -> update_progs(T, [#agenda_prog{id = Id} | Progs])
    end.

reset_prog(_, []) -> [];
reset_prog(Type,
           [P = #agenda_prog{id = Id, last_joined = Last} | T]) ->
    case agenda_data:get(Id) of
        #{id := 1023} ->
            case date:day_diff(date:unixtime(), Last) >= 3 andalso
                     Type =:= zero
                of
                true -> [#agenda_prog{id = Id} | reset_prog(Type, T)];
                _ -> [P | reset_prog(Type, T)]
            end;
        #{reset_time := 1} when Type =:= zero ->
            [#agenda_prog{id = Id} | reset_prog(Type, T)];
        #{reset_time := 2} when Type =:= five ->
            [#agenda_prog{id = Id} | reset_prog(Type, T)];
        #{reset_time := 3} when Type =:= week_five ->
            [#agenda_prog{id = Id} | reset_prog(Type, T)];
        _ -> [P | reset_prog(Type, T)]
    end.

do_recommend(Progs) ->
    Fun = fun (Id) ->
                  case agenda_data:get(Id) of
                      #{recommend := 1} -> true;
                      _ -> false
                  end
          end,
    case [I || #agenda_prog{id = I} <- Progs, Fun(I)] of
        [] -> [];
        L -> util:rand_list_n(L, 1)
    end.

do_do_calc_reserve_exp(_TypeExp, _TypeExpRatio, Time,
                       _Lev)
    when Time =< 0 ->
    0;
do_do_calc_reserve_exp(TypeExp, TypeExpRatio, Time,
                       Lev) ->
    case levup_data:get_exp({TypeExp, Lev}) of
        #{exp := BaseExp} ->
            round(Time * BaseExp * TypeExpRatio / 1000);
        _ -> 0
    end.

do_calc_reserve_exp(_Role, _CheckVars, [], Exp) -> Exp;
do_calc_reserve_exp(Role = #role{lev = Lev}, CheckVars,
                    [#{need_lev := NeedLev} | T], Exp)
    when Lev < NeedLev ->
    do_calc_reserve_exp(Role, CheckVars, T, Exp);
do_calc_reserve_exp(Role = #role{lev = Lev}, CheckVars,
                    [#{type := 1, max_time := MaxTime, type_exp := TypeExp,
                       type_exp_ratio := TypeExpRatio}
                     | T],
                    Exp) ->
    HasTime = case lists:keyfind(102, 1, CheckVars) of
                  {_, Times} -> Times;
                  _ -> 0
              end,
    Time = max(0, MaxTime - HasTime),
    AddExp = do_do_calc_reserve_exp(TypeExp,
                                    TypeExpRatio,
                                    Time,
                                    Lev),
    do_calc_reserve_exp(Role, CheckVars, T, Exp + AddExp);
do_calc_reserve_exp(Role = #role{lev = Lev}, CheckVars,
                    [#{type := 2, type_exp := TypeExp,
                       type_exp_ratio := TypeExpRatio, args1 := DunId,
                       args2 := 0}
                     | T],
                    Exp) ->
    HasTime = case lists:keyfind(104, 1, CheckVars) of
                  {_, DunPass} ->
                      Total = lists:sum([min(3, Done)
                                         || {_, Done} <- DunPass,
                                            is_integer(Done)]),
                      TotalLimit = dungeon_data:get_day_limit(Lev),
                      case lists:keyfind(DunId, 1, DunPass) of
                          _ when Total >= TotalLimit -> 3;
                          {_, N} -> min(3, N);
                          _ -> 0
                      end;
                  _ -> 0
              end,
    Time = max(0, 3 - HasTime),
    AddExp = do_do_calc_reserve_exp(TypeExp,
                                    TypeExpRatio,
                                    Time,
                                    Lev),
    do_calc_reserve_exp(Role, CheckVars, T, Exp + AddExp);
do_calc_reserve_exp(Role = #role{lev = Lev}, CheckVars,
                    [#{type := 2, max_time := MaxTime, type_exp := TypeExp,
                       type_exp_ratio := TypeExpRatio, args1 := DunId,
                       args2 := UnitId}
                     | T],
                    Exp) ->
    HasTime = case lists:keyfind(100, 1, CheckVars) of
                  {_, DunLog} ->
                      case lists:keyfind(DunId, 1, DunLog) of
                          {_, Log} ->
                              case lists:keyfind(UnitId, 1, Log) of
                                  {_, Times} -> Times;
                                  _ -> 0
                              end;
                          _ -> 0
                      end;
                  _ -> 0
              end,
    Time = max(0, MaxTime - HasTime),
    AddExp = do_do_calc_reserve_exp(TypeExp,
                                    TypeExpRatio,
                                    Time,
                                    Lev),
    do_calc_reserve_exp(Role, CheckVars, T, Exp + AddExp);
do_calc_reserve_exp(Role = #role{lev = Lev}, CheckVars,
                    [#{type := 3, max_time := MaxTime, type_exp := TypeExp,
                       type_exp_ratio := TypeExpRatio}
                     | T],
                    Exp) ->
    HasTime = case lists:keyfind(13, 1, CheckVars) of
                  {_, Times} -> Times;
                  _ -> 0
              end,
    Time = max(0, MaxTime - HasTime),
    AddExp = do_do_calc_reserve_exp(TypeExp,
                                    TypeExpRatio,
                                    Time,
                                    Lev),
    do_calc_reserve_exp(Role, CheckVars, T, Exp + AddExp);
do_calc_reserve_exp(Role = #role{lev = Lev}, CheckVars,
                    [#{type := 5, max_time := MaxTime, type_exp := TypeExp,
                       type_exp_ratio := TypeExpRatio}
                     | T],
                    Exp) ->
    HasTime = case lists:keyfind(14, 1, CheckVars) of
                  {_, Times} -> Times;
                  _ -> 0
              end,
    Time = max(0, MaxTime - HasTime),
    AddExp = do_do_calc_reserve_exp(TypeExp,
                                    TypeExpRatio,
                                    Time,
                                    Lev),
    do_calc_reserve_exp(Role, CheckVars, T, Exp + AddExp);
do_calc_reserve_exp(Role = #role{lev = Lev}, CheckVars,
                    [#{type := 6, max_time := MaxTime, type_exp := TypeExp,
                       type_exp_ratio := TypeExpRatio}
                     | T],
                    Exp) ->
    HasTime = case lists:keyfind(110, 1, CheckVars) of
                  {_, Times} -> Times;
                  _ -> 0
              end,
    Time = max(0, MaxTime - HasTime),
    AddExp = do_do_calc_reserve_exp(TypeExp,
                                    TypeExpRatio,
                                    Time,
                                    Lev),
    do_calc_reserve_exp(Role, CheckVars, T, Exp + AddExp);
do_calc_reserve_exp(Role, CheckVars, [_ | T], Exp) ->
    do_calc_reserve_exp(Role, CheckVars, T, Exp).

is_have_activity_reward(Role = #role{m_agenda =
                                         #m_agenda{rewarded = Rewarded,
                                                   last_rewarded = Last}},
                        Id) ->
    case agenda_data:get_activity(Id) of
        none -> false;
        {Need, _Num, ItemList} ->
            Now = date:unixtime(),
            Rewarded1 = case date:is_same_five_reset(Now, Last) of
                            true -> Rewarded;
                            _ -> []
                        end,
            case lists:member(Id, Rewarded1) of
                true -> false;
                _ ->
                    case calc_activity(Role) >= Need of
                        true -> {true, [{I, 0, N} || {I, N} <- ItemList]};
                        false -> false
                    end
            end
    end.

sned_activity_reward_mail(Role, AchiveRewardList) ->
    case calc_activity_reward_list(Role,
                                   AchiveRewardList,
                                   [])
        of
        [] -> ok;
        RewardList ->
            logger:debug("未领取的活跃度奖励列表：~w",
                         [RewardList],
                         agenda,
                         1415),
            MailTile = lang:get("活跃度奖励"),
            MailContent =
                lang:get("由于您未领取昨日的活跃度礼盒奖励，特通过此邮件补发道具奖励:"),
            mail:send(Role, MailTile, MailContent, RewardList)
    end.

calc_activity_reward_list(_Role, [], RewardList) ->
    distinct_overlop_reward(RewardList, []);
calc_activity_reward_list(Role,
                          [{Id, {true, GainList}} | Rest], RewardList) ->
    extension:activity(Role, Id),
    NewGainList = [{I, 0, N}
                   || {I, 0, N} <- GainList, I =/= 90006],
    calc_activity_reward_list(Role,
                              Rest,
                              NewGainList ++ RewardList);
calc_activity_reward_list(Role, [_Other | Rest],
                          RewardList) ->
    calc_activity_reward_list(Role, Rest, RewardList).

distinct_overlop_reward([], NewRewardList) ->
    NewRewardList;
distinct_overlop_reward([{I, 0, N} | Rest],
                        NewRewardList) ->
    case lists:keyfind(I, 1, NewRewardList) of
        {BaseId, _, Num} ->
            NG = lists:keyreplace(I,
                                  1,
                                  NewRewardList,
                                  {BaseId, 0, Num + N}),
            distinct_overlop_reward(Rest, NG);
        false ->
            NG1 = [{I, 0, N} | NewRewardList],
            distinct_overlop_reward(Rest, NG1)
    end;
distinct_overlop_reward([_Other | Rest],
                        NewRewardList) ->
    distinct_overlop_reward(Rest, NewRewardList).

