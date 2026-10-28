-file("src/mod/spirit_treasure/spirit_treasure_mgr.erl",
      1).

-module(spirit_treasure_mgr).

-behaviour(gen_fsm).

-export([init/1,
         handle_event/3,
         handle_sync_event/4,
         handle_info/3,
         terminate/3,
         code_change/4]).

-export([info/1,
         cast/1,
         call/1,
         next/0,
         start_link/0,
         lookup_unit/2,
         lookup_unit/1,
         treat_slave_attr/2,
         treat_unit_attr/2,
         combat_over/1,
         conver_offer_mate/2,
         reload/0,
         get_state/2,
         is_same_group/2,
         update_offer/0,
         lost_offer/1,
         replace_unit_team/0,
         check_oracle_offer/1]).

-export([idle/2, ordeal/2, final/2]).

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

-file("src/mod/spirit_treasure/spirit_treasure_mgr.erl",
      37).

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

-file("src/mod/spirit_treasure/spirit_treasure_mgr.erl",
      38).

-file("inc/spirit_treasure.hrl", 1).

-record(m_spirit_treasure,
        {ver = 1,
         is_offer = 0,
         unit_id = 0,
         is_get = 0,
         card_gain_list = [],
         max_wave = 0,
         wave_reward = []}).

-record(spirit_treasure_state,
        {ts,
         timeout = 0,
         state_name,
         cross_type = 0,
         map_info = []}).

-record(spirit_treasure_unit,
        {base_id = {0, 0},
         ver = 1,
         difficulty = 1,
         kill_times = 0,
         offer_teams = [],
         now_star = 1,
         diff_num = 0}).

-record(spirit_treasure_team,
        {leader_id = {0, "", 0},
         all_mate_id = [],
         team_mates = [],
         record_id = {0, {0, "", 0}},
         wave = 0,
         use_time = 0}).

-record(spirit_treasure_offer_mate,
        {id = {0, "", 0},
         name = "",
         lev = 0,
         classes = 0,
         sex = 0,
         fc = 0,
         break_times = 0,
         status = 2,
         looks = []}).

-record(spirit_treasure_rank_rc,
        {id = {0, "", 0},
         name = "",
         lev = 0,
         classes = 0,
         sex = 0,
         fc = 0,
         break_times = 0,
         wave = 0,
         use_time = 0,
         rank = 0}).

-record(spirit_treasure_rank_list,
        {group = 0, min_val = {0, 0}, list = [], len = 0}).

-file("src/mod/spirit_treasure/spirit_treasure_mgr.erl",
      39).

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

-file("src/mod/spirit_treasure/spirit_treasure_mgr.erl",
      40).

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

-file("src/mod/spirit_treasure/spirit_treasure_mgr.erl",
      41).

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

-file("src/mod/spirit_treasure/spirit_treasure_mgr.erl",
      42).

-file("inc/lev_break.hrl", 1).

-record(m_lev_break,
        {ver = 0,
         trial = 0 :: non_neg_integer(),
         done = 0 :: non_neg_integer(),
         times = 0 :: non_neg_integer(),
         attr_point = 0 :: non_neg_integer()}).

-file("src/mod/spirit_treasure/spirit_treasure_mgr.erl",
      43).

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

-file("src/mod/spirit_treasure/spirit_treasure_mgr.erl",
      44).

-file("inc/rank.hrl", 1).

-record(rank,
        {type = 1,
         show_list = [],
         list = [],
         last_val = 0,
         len = 0}).

-record(rank_rc,
        {ver = 3 :: pos_integer(),
         id = {roleid, platform, zoneid} :: term(),
         rank = 1,
         time = 0 :: non_neg_integer(),
         role_id = 0 :: non_neg_integer(),
         platform = "" :: list(),
         zone_id = 0 :: non_neg_integer(),
         name = "" :: list(),
         sex = 0 :: 0..2,
         classes = 0 :: 0..4,
         lev = 0 :: non_neg_integer(),
         val1 = 0 :: non_neg_integer(),
         val2 = 0 :: non_neg_integer(),
         val3 = 0 :: non_neg_integer(),
         val4 = 0 :: non_neg_integer(),
         desc = "",
         pet,
         guard,
         eqm}).

-record(rank_cfg,
        {type = 0 :: non_neg_integer(),
         num = 100 :: non_neg_integer(),
         keys = [#rank_rc.val3, #rank_rc.val2, #rank_rc.val1] ::
             [pos_integer()],
         min_val = 1 :: pos_integer(),
         nologin = 0 :: non_neg_integer(),
         zone = rank_zone_1 :: atom()}).

-file("src/mod/spirit_treasure/spirit_treasure_mgr.erl",
      45).

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

-file("src/mod/spirit_treasure/spirit_treasure_mgr.erl",
      46).

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

-file("src/mod/spirit_treasure/spirit_treasure_mgr.erl",
      47).

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

-file("src/mod/spirit_treasure/spirit_treasure_mgr.erl",
      48).

start_link() ->
    gen_fsm:start_link({local, spirit_treasure_mgr},
                       spirit_treasure_mgr,
                       [],
                       []).

info(Msg) -> spirit_treasure_mgr ! Msg.

cast(Msg) ->
    gen_fsm:send_all_state_event(spirit_treasure_mgr, Msg).

call(Msg) ->
    try
        gen_fsm:sync_send_all_state_event(spirit_treasure_mgr,
                                          Msg)
    catch
        _Type:_Reason -> {error, timeout}
    end.

next() ->
    gen_fsm:send_event(spirit_treasure_mgr, timeout).

lookup_unit(IsCross, BaseId) ->
    case IsCross of
        1 ->
            cross:call(spirit_treasure_mgr, lookup_unit, [BaseId]);
        _ -> lookup_unit(BaseId)
    end.

combat_over(#combat{winner = Winner, loser = _Loser,
                    start_time = _StartTime,
                    start_args = #combat_start_args{ext_args = ExtArgs}}) ->
    logger:debug("结算龙王挑战战斗结算:~w",
                 [ExtArgs],
                 spirit_treasure_mgr,
                 93),
    case [F || F = #fighter{type = 1} <- Winner] of
        WinnerRole = [_ | _] ->
            case lists:keyfind(unit_id, 1, ExtArgs) of
                {_, UnitId} ->
                    OfferMates = conver_offer_mate(WinnerRole, []),
                    logger:debug("结算龙王挑战战斗结算:~w",
                                 [OfferMates],
                                 spirit_treasure_mgr,
                                 100),
                    LeaderId = case lists:keyfind(leader_id, 1, ExtArgs) of
                                   {_, _LeaderId} -> _LeaderId;
                                   _ -> {0, "", 0}
                               end,
                    [role_trigger:async_fire(RoleId,
                                             #evt_spirit_treasure_general{})
                     || #spirit_treasure_offer_mate{id = RoleId}
                            <- OfferMates],
                    cast({combat_over, UnitId, LeaderId, OfferMates});
                _ ->
                    logger:error("结算龙王挑战战斗错误，错误的战斗开始参数:~w",
                                 [ExtArgs],
                                 spirit_treasure_mgr,
                                 109),
                    ignore
            end;
        _ -> ignore
    end;
combat_over(_) -> ok.

conver_offer_mate([], OfferMates) -> OfferMates;
conver_offer_mate([F = #fighter{} | Rest],
                  OfferMates) ->
    OfferMate = conver_offer_mate(F),
    NewOfferMates = [OfferMate | OfferMates],
    conver_offer_mate(Rest, NewOfferMates);
conver_offer_mate([_F | Rest], OfferMates) ->
    conver_offer_mate(Rest, OfferMates).

reload() -> cast(reload).

init([]) ->
    logger:info("spirit_treasure_mgr开始启动...",
                [],
                spirit_treasure_mgr,
                133),
    process_flag(trap_exit, true),
    dets:open_file(ets_spirit_treasure_unit,
                   [{file, "./dets/ets_spirit_treasure_unit.dets"},
                    {keypos, #spirit_treasure_unit.base_id},
                    {type, set}]),
    ets:new(ets_spirit_treasure_unit,
            [set,
             named_table,
             public,
             {keypos, #spirit_treasure_unit.base_id}]),
    dets:open_file(ets_spirit_treasure_statue,
                   [{file, "./dets/ets_spirit_treasure_statue.dets"},
                    {keypos, 1},
                    {type, set}]),
    ets:new(ets_spirit_treasure_statue,
            [set, named_table, public, {keypos, 1}]),
    dets:to_ets(ets_spirit_treasure_statue,
                ets_spirit_treasure_statue),
    dets:open_file(ets_spirit_treasure_rank,
                   [{file, "./dets/ets_spirit_treasure_rank.dets"},
                    {keypos, #spirit_treasure_rank_list.group},
                    {type, set}]),
    ets:new(ets_spirit_treasure_rank,
            [set,
             named_table,
             public,
             {keypos, #spirit_treasure_rank_list.group}]),
    dets:to_ets(ets_spirit_treasure_rank,
                ets_spirit_treasure_rank),
    dets:open_file(ets_spirit_treasure_offer,
                   [{file, "./dets/ets_spirit_treasure_offer.dets"},
                    {keypos, 1},
                    {type, set}]),
    ets:new(ets_spirit_treasure_offer,
            [set, named_table, public, {keypos, 1}]),
    dets:to_ets(ets_spirit_treasure_offer,
                ets_spirit_treasure_offer),
    load_data(),
    {StateName, TimeOut} = get_state(),
    CrossType = case env:get(is_center) of
                    true -> 1;
                    _ -> 0
                end,
    case StateName of
        idle ->
            update_is_cross(),
            ok;
        _ ->
            case env:get(spirit_treasure_is_cross) of
                undefined ->
                    update_is_cross(),
                    ok;
                _ -> ok
            end
    end,
    update_cfg(init, StateName),
    MapInfo = create_map(CrossType),
    create_unit(StateName, MapInfo),
    State = #spirit_treasure_state{ts = now(),
                                   timeout = TimeOut, state_name = StateName,
                                   cross_type = CrossType, map_info = MapInfo},
    NextNoticeTime = next_notice_time(),
    NoticeRef = erlang:send_after(NextNoticeTime * 1000,
                                  self(),
                                  notice_mgr),
    put(notice_ref, NoticeRef),
    ZeroFlushTime = date:now_diff(tomorrow, {0, 0, 1}),
    ZeroFlushRef = erlang:send_after(ZeroFlushTime * 1000,
                                     self(),
                                     zreo_push_bottom_stuff),
    put(zero_push_ref, ZeroFlushRef),
    info(update_today_stuff),
    {ok, StateName, State, TimeOut}.

handle_event({chat_msg, Code, Data}, StateName,
             State = #spirit_treasure_state{cross_type = 0}) ->
    role_group:pack_send(world, Code, Data),
    continue(StateName, State);
handle_event({cast_chat_msg, CrossGroup, Code, Data},
             StateName,
             State = #spirit_treasure_state{cross_type = 1}) ->
    CrossGroupList = get_group_list(CrossGroup),
    Fun = fun ({P, Z}) ->
                  cross:cast(P,
                             Z,
                             spirit_treasure_mgr,
                             cast,
                             [{chat_msg, Code, Data}])
          end,
    lists:foreach(Fun, CrossGroupList),
    continue(StateName, State);
handle_event({gm_set_star,
              RolePid,
              UnitId,
              Star,
              KillTimes},
             StateName, State) ->
    case lookup_unit(UnitId) of
        {ok, Unit = #spirit_treasure_unit{}} ->
            NewUnit = Unit#spirit_treasure_unit{difficulty = Star,
                                                kill_times = KillTimes},
            update_unit(NewUnit),
            cast({query_unit_info, RolePid});
        _ -> ingore
    end,
    continue(StateName, State);
handle_event(reload, StateName,
             State = #spirit_treasure_state{cross_type = CrossType,
                                            map_info = OldMapInfo}) ->
    update_cfg(),
    MapInfo = add_cross_map(CrossType, OldMapInfo),
    NewState = State#spirit_treasure_state{map_info =
                                               MapInfo},
    logger:debug("idle进入下个状态:~w",
                 [NewState],
                 spirit_treasure_mgr,
                 234),
    Msg = notice:format(lang:get("~ts已经可以开始挑战啦{face_1,1}"),
                        [{string_2, 1, lang:get("龙王试炼资格")}]),
    cast_msg3(CrossType, Msg),
    push_status(StateName),
    create_general_unit(StateName, MapInfo),
    continue(StateName, NewState);
handle_event({get_status, _Group, RolePid}, StateName,
             State) ->
    Status = state_name2_status(StateName),
    logger:debug("活动状态:~w",
                 [Status],
                 spirit_treasure_mgr,
                 246),
    role:pack_send(RolePid, 20206, {Status, 1}),
    continue(StateName, State);
handle_event({get_rank, Group, RolePid}, StateName,
             State) ->
    case ets:lookup(ets_spirit_treasure_rank, Group) of
        [#spirit_treasure_rank_list{list = List}] ->
            logger:debug("======:~w",
                         [List],
                         spirit_treasure_mgr,
                         254),
            role:pack_send(RolePid, 20209, {List}),
            ok;
        _ -> ok
    end,
    continue(StateName, State);
handle_event({query_unit_info, Group, RolePid},
             StateName, State) ->
    SpiritTreasureUnitInfo =
        ets:tab2list(ets_spirit_treasure_unit),
    Reply = to_client_reply(SpiritTreasureUnitInfo,
                            Group,
                            []),
    logger:debug("========：~w",
                 [Reply],
                 spirit_treasure_mgr,
                 265),
    role:pack_send(RolePid, 20205, {Reply}),
    continue(StateName, State);
handle_event({kill_npc,
              LeaderId = {_, LeaderPlat, LeaderZoneId},
              UnitId = {Group, BaseId}},
             StateName, State) ->
    logger:debug("挑战龙王:~w",
                 [BaseId],
                 spirit_treasure_mgr,
                 270),
    Result = case lookup_unit(UnitId) of
                 {ok,
                  #spirit_treasure_unit{difficulty = Difficulty,
                                        kill_times = KillTimes,
                                        diff_num = DiffNum}} ->
                     case spirit_treasure_data:get_unit_info({BaseId,
                                                              Difficulty})
                         of
                         #{unit_id := FightUnitId} ->
                             case spirit_treasure_data:get_attr_rate({BaseId,
                                                                      KillTimes})
                                 of
                                 AttrRate when is_integer(AttrRate) ->
                                     NAttrRate = case is_boss_unit_id(BaseId) of
                                                     true -> AttrRate;
                                                     _ -> AttrRate + DiffNum
                                                 end,
                                     ShowStar = case
                                                    spirit_treasure_data:get_show_star(NAttrRate)
                                                    of
                                                    _Star
                                                        when
                                                          is_integer(_Star) ->
                                                        _Star;
                                                    _ -> 1
                                                end,
                                     logger:info("id:~w, 龙王难度原值：~w人，~w增幅；更改后：~w增幅, ~w星",
                                                 [UnitId,
                                                  KillTimes,
                                                  AttrRate,
                                                  NAttrRate,
                                                  ShowStar],
                                                 spirit_treasure_mgr,
                                                 289),
                                     case unit_convert:to(unit, FightUnitId) of
                                         {ok, Unit} ->
                                             CombatType =
                                                 combat_util:unit_to_combat_type(Unit),
                                             case CombatType of
                                                 61 when StateName =/= ordeal ->
                                                     Msg = lang:get("当前阶段不能挑战"),
                                                     {false, Msg};
                                                 62 when StateName =/= final ->
                                                     Msg = lang:get("当前阶段不能挑战"),
                                                     {false, Msg};
                                                 _ ->
                                                     Fighters = case
                                                                    unit_convert:to(fighter,
                                                                                    Unit)
                                                                    of
                                                                    {ok,
                                                                     Fighter =
                                                                         #fighter{slave
                                                                                      =
                                                                                      Slave}} ->
                                                                        NewSlave =
                                                                            [{I,
                                                                              N,
                                                                              O,
                                                                              R,
                                                                              {spirit_treasure_mgr,
                                                                               treat_slave_attr,
                                                                               [NAttrRate]}}
                                                                             || {I,
                                                                                 N,
                                                                                 O,
                                                                                 R}
                                                                                    <- Slave],
                                                                        logger:debug("旧随从:~w新随从:~w",
                                                                                     [Slave,
                                                                                      NewSlave],
                                                                                     spirit_treasure_mgr,
                                                                                     304),
                                                                        [Fighter#fighter{attr
                                                                                             =
                                                                                             {spirit_treasure_mgr,
                                                                                              treat_unit_attr,
                                                                                              [NAttrRate]},
                                                                                         slave
                                                                                             =
                                                                                             NewSlave}];
                                                                    _R ->
                                                                        logger:error("单位转换失败 [~w] ~w",
                                                                                     [BaseId,
                                                                                      _R],
                                                                                     spirit_treasure_mgr,
                                                                                     307),
                                                                        []
                                                                end,
                                                     case cross:call(LeaderPlat,
                                                                     LeaderZoneId,
                                                                     spirit_treasure_role,
                                                                     get_fighters,
                                                                     [LeaderId])
                                                         of
                                                         {ok, RoleFighters} ->
                                                             CombatArgs =
                                                                 #combat_start_args{ext_args
                                                                                        =
                                                                                        [{unit_id,
                                                                                          {Group,
                                                                                           BaseId}},
                                                                                         {leader_id,
                                                                                          LeaderId},
                                                                                         {unit_star,
                                                                                          ShowStar}]},
                                                             combat_mgr:start_combat(CombatType,
                                                                                     RoleFighters,
                                                                                     Fighters,
                                                                                     CombatArgs),
                                                             {ok};
                                                         _ ->
                                                             {false,
                                                              lang:get("队伍成员不足")}
                                                     end
                                             end;
                                         _Err ->
                                             logger:debug("_Err:~w",
                                                          [_Err],
                                                          spirit_treasure_mgr,
                                                          320),
                                             {false, lang:get("龙王宝藏怪物配置错误")}
                                     end;
                                 _ ->
                                     logger:debug("挑战龙王:~w",
                                                  [BaseId],
                                                  spirit_treasure_mgr,
                                                  324),
                                     {false, lang:get("龙王宝藏怪物配置错误")}
                             end;
                         _ ->
                             logger:debug("挑战龙王:~w",
                                          [BaseId],
                                          spirit_treasure_mgr,
                                          328),
                             {false, lang:get("龙王宝藏怪物配置错误")}
                     end;
                 _ -> {false, lang:get("龙王宝藏怪物配置错误")}
             end,
    case Result of
        {false, Reason} ->
            notice:send(LeaderId, 1, Reason),
            ok;
        _ -> ok
    end,
    continue(StateName, State);
handle_event({gm_reset_offer, RoleId}, StateName,
             State) ->
    Fun = fun (Unit = #spirit_treasure_unit{offer_teams =
                                                OfferTeams},
               _) ->
                  case lists:keymember(RoleId,
                                       #spirit_treasure_team.leader_id,
                                       OfferTeams)
                      of
                      true ->
                          NewOfferTeams = lists:keydelete(RoleId,
                                                          #spirit_treasure_team.leader_id,
                                                          OfferTeams),
                          NewUnit = Unit#spirit_treasure_unit{offer_teams =
                                                                  NewOfferTeams},
                          update_unit(NewUnit);
                      _ -> ok
                  end
          end,
    ets:foldl(Fun, ok, ets_spirit_treasure_unit),
    continue(StateName, State);
handle_event({combat_over,
              UnitId = {_Group, BaseId},
              StTeam = #spirit_treasure_team{all_mate_id = AllMateId,
                                             wave = NewMaxWave,
                                             use_time = NewUseTime}},
             StateName, State) ->
    case lookup_unit(UnitId) of
        {ok,
         Unit = #spirit_treasure_unit{offer_teams = OfferTeams,
                                      difficulty = Difficulty}} ->
            OfferNum = case
                           spirit_treasure_data:get_unit_info({BaseId,
                                                               Difficulty})
                           of
                           #{offer := _OfferNum} -> _OfferNum;
                           _ -> 999
                       end,
            InsertOfferTeams = case lists:keyfind(AllMateId,
                                                  #spirit_treasure_team.all_mate_id,
                                                  OfferTeams)
                                   of
                                   #spirit_treasure_team{wave = MaxWave,
                                                         use_time = UseTime} ->
                                       case NewMaxWave > MaxWave of
                                           true ->
                                               lists:keystore(AllMateId,
                                                              #spirit_treasure_team.all_mate_id,
                                                              OfferTeams,
                                                              StTeam);
                                           _
                                               when NewMaxWave =:= MaxWave
                                                        andalso
                                                        NewUseTime < UseTime ->
                                               lists:keystore(AllMateId,
                                                              #spirit_treasure_team.all_mate_id,
                                                              OfferTeams,
                                                              StTeam);
                                           _ -> OfferTeams
                                       end;
                                   _ -> [StTeam | OfferTeams]
                               end,
            SortOfferTeams = util:keys_sort([{asc,
                                              #spirit_treasure_team.use_time},
                                             #spirit_treasure_team.wave],
                                            InsertOfferTeams),
            NewOfferTeams = lists:sublist(SortOfferTeams, OfferNum),
            NewUnit = Unit#spirit_treasure_unit{offer_teams =
                                                    NewOfferTeams},
            update_unit(NewUnit),
            ok;
        _ -> ok
    end,
    continue(StateName, State);
handle_event({combat_over,
              BaseId = {Group, UnitBaseId},
              LeaderId,
              OfferMates},
             ordeal,
             State = #spirit_treasure_state{cross_type =
                                                CrossType}) ->
    case lookup_unit(BaseId) of
        {ok,
         Unit = #spirit_treasure_unit{kill_times = KillTimes,
                                      offer_teams = OfferTeams,
                                      difficulty = Difficulty,
                                      now_star = NowStar,
                                      diff_num = DiffNum}} ->
            OfferNum = case
                           spirit_treasure_data:get_unit_info({UnitBaseId,
                                                               Difficulty})
                           of
                           #{offer := _OfferNum} -> _OfferNum;
                           _ -> 999
                       end,
            NewKillTimes = min(KillTimes + 1, 50),
            NewDifficulty = min(5, NewKillTimes div OfferNum + 1),
            UnitName = case unit_data:get(UnitBaseId) of
                           #unit_data{name = _UnitName} -> _UnitName;
                           _ -> lang:get("")
                       end,
            NAttrRate = case
                            spirit_treasure_data:get_attr_rate({UnitBaseId,
                                                                NewKillTimes})
                            of
                            AttrRate when is_integer(AttrRate) ->
                                case is_boss_unit_id(UnitBaseId) of
                                    true -> AttrRate;
                                    _ -> AttrRate + DiffNum
                                end;
                            _ -> 0
                        end,
            NewStar = case
                          spirit_treasure_data:get_show_star(NAttrRate)
                          of
                          NStar when is_integer(NStar) ->
                              case NStar > NowStar of
                                  true ->
                                      Msg =
                                          notice:format(lang:get("骇人听闻，~ts在被勇士们挑战过后颇有感悟，难度提升了1个星级{face_1,22} "),
                                                        [{role_2, UnitName}]),
                                      cast_msg2(Group, Msg),
                                      NStar;
                                  _ -> NowStar
                              end;
                          _ -> NowStar
                      end,
            DifficultyUnit = Unit#spirit_treasure_unit{difficulty =
                                                           NewDifficulty,
                                                       kill_times =
                                                           NewKillTimes,
                                                       now_star = NewStar},
            StTeam = #spirit_treasure_team{leader_id = LeaderId,
                                           team_mates = OfferMates},
            NewOfferTeams = lists:sublist([StTeam | OfferTeams],
                                          OfferNum),
            NewUnit =
                DifficultyUnit#spirit_treasure_unit{offer_teams =
                                                        NewOfferTeams},
            update_unit(NewUnit),
            NoticeMsg =
                notice:format(lang:get("恭喜你挑战成功，暂时获得挑战~ts资格{face_1,1}"),
                              [{string_2, 1, lang:get("星辰龙王")}]),
            [notice:send(MateId, 3, NoticeMsg)
             || #spirit_treasure_offer_mate{id = MateId}
                    <- OfferMates],
            CurrentOfferTeamNum = erlang:length(NewOfferTeams),
            case CurrentOfferTeamNum >= OfferNum of
                true ->
                    case lists:last(NewOfferTeams) of
                        #spirit_treasure_team{team_mates = LastMates} ->
                            #unit_data{name = UnitName} =
                                unit_data:get(UnitBaseId),
                            WarningFun = fun (#spirit_treasure_offer_mate{id =
                                                                              MateId}) ->
                                                 case check_oracle_offer(MateId)
                                                     of
                                                     0 ->
                                                         Title =
                                                             lang:get("试练资格预警"),
                                                         Content =
                                                             notice:format(lang:get("岌岌可危！您在龙王试练-~ts门徒资格序列排到第~ts了，再有一个队伍挑战该门徒成功资格就"
                                                                                    "会被顶替掉了，请勇士随时注意啊！"),
                                                                           [{string_2,
                                                                             1,
                                                                             UnitName},
                                                                            {string_2,
                                                                             1,
                                                                             8}]),
                                                         mail:send(MateId,
                                                                   Title,
                                                                   Content);
                                                     _ -> ok
                                                 end
                                         end,
                            lists:foreach(WarningFun, LastMates);
                        _ -> ingore
                    end;
                _ -> ingore
            end,
            LostTeams = lists:subtract(OfferTeams, NewOfferTeams),
            logger:debug("=======被淘汰队伍:~w",
                         [LostTeams],
                         spirit_treasure_mgr,
                         477),
            LostOfferMates = case LostTeams of
                                 [#spirit_treasure_team{team_mates =
                                                            LostTeamMates,
                                                        record_id = RecId}
                                  | _] ->
                                     case CrossType of
                                         0 ->
                                             combat_record:info({minus_citeds,
                                                                 [RecId]});
                                         1 ->
                                             case RecId of
                                                 {_, {_, RecP, RecZ}} ->
                                                     cross:call(RecP,
                                                                RecZ,
                                                                combat_record,
                                                                info,
                                                                [{minus_citeds,
                                                                  [RecId]}]);
                                                 _ -> ingore
                                             end
                                     end,
                                     Units =
                                         ets:tab2list(ets_spirit_treasure_unit),
                                     Fun = fun (LostOfferMate =
                                                    #spirit_treasure_offer_mate{id
                                                                                    =
                                                                                    LostRoleId},
                                                Rtn) ->
                                                   case
                                                       check_has_offer(LostRoleId,
                                                                       Units)
                                                       of
                                                       0 ->
                                                           case
                                                               check_oracle_offer(LostRoleId)
                                                               of
                                                               0 ->
                                                                   Title =
                                                                       lang:get("试练资格改变"),
                                                                   Content =
                                                                       notice:format(lang:get("由于有~ts挑战了更高难度的守护，您的资格被顶替了，~ts可以获得资格{face_1,1}"),
                                                                                     [{string_2,
                                                                                       1,
                                                                                       lang:get("8个队伍")},
                                                                                      {string_2,
                                                                                       1,
                                                                                       lang:get("再次挑战")}]),
                                                                   mail:send(LostRoleId,
                                                                             Title,
                                                                             Content);
                                                               _ -> ok
                                                           end,
                                                           role:apply(async,
                                                                      LostRoleId,
                                                                      {spirit_treasure_role,
                                                                       apply_lost_offer,
                                                                       []}),
                                                           [LostOfferMate
                                                            | Rtn];
                                                       _ -> Rtn
                                                   end
                                           end,
                                     lists:foldl(Fun, [], LostTeamMates);
                                 _ -> []
                             end,
            sync_mate_offer(CrossType,
                            Group,
                            OfferMates,
                            LostOfferMates),
            sync_replace_offer(CrossType, Group, OfferMates),
            ok;
        _ -> ok
    end,
    continue(ordeal, State);
handle_event({combat_over,
              _BaseId,
              _LeaderId,
              OfferMates},
             StateName, State) ->
    Msg = notice:format(lang:get("很遗憾，~ts，您此次战斗未能获得资格"),
                        [{string_2, 6, lang:get("资格赛时间已过")}]),
    [notice:send(MateId, 3, Msg)
     || #spirit_treasure_offer_mate{id = MateId}
            <- OfferMates],
    continue(StateName, State);
handle_event(_Event, StateName, State) ->
    logger:error("spirit_treasure_mgr收到未知协议:~w",
                 [_Event],
                 spirit_treasure_mgr,
                 527),
    continue(StateName, State).

handle_sync_event({is_first_kill, UnitId}, _From,
                  StateName, State) ->
    Flag = case lookup_unit(UnitId) of
               {ok, #spirit_treasure_unit{offer_teams = OfferTeams}} ->
                   lists:keymember(5,
                                   #spirit_treasure_team.wave,
                                   OfferTeams);
               _ -> false
           end,
    Reply = {ok, Flag},
    continue(Reply, StateName, State);
handle_sync_event({query_enter_map, CrossGrpup}, _From,
                  StateName,
                  State = #spirit_treasure_state{map_info = MapInfo}) ->
    {TransX, TransY} = case map_data:get(53005) of
                           {ok, #map_data{revive = Revive}} ->
                               case util:rand_list(Revive) of
                                   {X, Y} -> {X, Y};
                                   _ -> {1167, 723}
                               end;
                           _ -> {1167, 723}
                       end,
    Reply = case lists:keyfind(CrossGrpup, 1, MapInfo) of
                {_Group, MapId, _MapPid} -> {ok, MapId, TransX, TransY};
                _ -> {false, lang:get("本服务器无龙王试炼分组信息")}
            end,
    continue(Reply, StateName, State);
handle_sync_event({get_rank, Group}, _From, StateName,
                  State) ->
    Reply = case ets:lookup(ets_spirit_treasure_rank, Group)
                of
                [#spirit_treasure_rank_list{list = List}] -> List;
                _ -> []
            end,
    continue(Reply, StateName, State);
handle_sync_event(_Event, _From, StateName, State) ->
    logger:error("spirit_treasure_mgr收到未处理的协议:~w",
                 [_Event],
                 spirit_treasure_mgr,
                 567),
    Reply = ok,
    continue(Reply, StateName, State).

handle_info({update_offer, RoleId}, StateName, State) ->
    logger:debug("===========update_offer:~w",
                 [RoleId],
                 spirit_treasure_mgr,
                 574),
    update_offer(RoleId),
    continue(StateName, State);
handle_info({lost_offer, RoleId}, StateName, State) ->
    logger:debug("===========lost_offer:~w",
                 [RoleId],
                 spirit_treasure_mgr,
                 580),
    lost_offer(RoleId),
    continue(StateName, State);
handle_info(replace_unit_team, StateName, State) ->
    replace_unit_team(),
    continue(StateName, State);
handle_info(notice_mgr, StateName,
            State = #spirit_treasure_state{cross_type = 0}) ->
    case get(notice_ref) of
        Ref when is_reference(Ref) -> erlang:cancel_timer(Ref);
        _ -> ok
    end,
    NextNoticeTime = next_notice_time(),
    NoticeRef = erlang:send_after(NextNoticeTime * 1000,
                                  self(),
                                  notice_mgr),
    put(notice_ref, NoticeRef),
    Msg =
        notice:format(lang:get("~ts如火如荼，快和小伙伴组队挑战吧{face_1,7}{face_1,7}"),
                      [{string_2, 1, lang:get("龙王试练")}]),
    cast_msg2(0, Msg),
    continue(StateName, State);
handle_info(zreo_push_bottom_stuff, StateName, State) ->
    case get(zero_push_ref) of
        Ref when is_reference(Ref) -> erlang:cancel_timer(Ref);
        _ -> ok
    end,
    ZeroPushTime = date:now_diff(tomorrow, {0, 0, 1}),
    ZeroPushRef = erlang:send_after(ZeroPushTime * 1000,
                                    self(),
                                    zreo_push_bottom_stuff),
    put(zero_push_ref, ZeroPushRef),
    Week = date:day_of_the_week(date:unixtime()),
    case Week =< 5 andalso Week >= 2 of
        true ->
            {BottomStar, BottomValue} = get_bottom_stuff(),
            logger:debug("~w,~w",
                         [BottomStar, BottomValue],
                         spirit_treasure_mgr,
                         610),
            GroupList = case env:get(spirit_treasure_all_group) of
                            _List when is_list(_List) -> _List;
                            _ -> []
                        end,
            AllUnits = case catch
                                spirit_treasure_data:get_all_units()
                           of
                           _List_ when is_list(_List_) -> _List_;
                           _ -> []
                       end,
            NGroupList = case env:get(is_center) of
                             true -> GroupList;
                             _ ->
                                 case env:get(spirit_treasure_is_cross) of
                                     {0, _} -> [0];
                                     _ -> []
                                 end
                         end,
            logger:debug("~w",
                         [NGroupList],
                         spirit_treasure_mgr,
                         630),
            [begin
                 {NameList, ReplyList} = make_new_unit(AllUnits,
                                                       GroupId,
                                                       BottomStar,
                                                       BottomValue,
                                                       [],
                                                       []),
                 logger:info("分组~w:~w",
                             [GroupId, NameList],
                             spirit_treasure_mgr,
                             635),
                 case length(NameList) of
                     0 -> ok;
                     1 ->
                         Msg =
                             notice:format(lang:get("龙王门徒~ts在绯月大陆一番历练过后颇有感悟，难度提升了1个星级{face_1,22}"),
                                           [{unit_1, lists:nth(1, NameList)}]),
                         cast_msg2(GroupId, Msg);
                     2 ->
                         Msg =
                             notice:format(lang:get("龙王门徒~ts、~ts在绯月大陆一番历练过后颇有感悟，难度提升了1个星级{face_1,22}"),
                                           [{unit_1, lists:nth(1, NameList)},
                                            {unit_1, lists:nth(2, NameList)}]),
                         cast_msg2(GroupId, Msg);
                     3 ->
                         Msg =
                             notice:format(lang:get("龙王门徒~ts、~ts、~ts在绯月大陆一番历练过后颇有感悟，难度提升了1个星级{face"
                                                    "_1,22}"),
                                           [{unit_1, lists:nth(1, NameList)},
                                            {unit_1, lists:nth(2, NameList)},
                                            {unit_1, lists:nth(3, NameList)}]),
                         cast_msg2(GroupId, Msg);
                     _ ->
                         Msg =
                             notice:format(lang:get("~ts在绯月大陆一番历练过后颇有感悟，难度提升了1个星级{face_1,22}"),
                                           [{string_2, 1, lang:get("龙王门徒们")}]),
                         cast_msg2(GroupId, Msg)
                 end,
                 send_info(GroupId, 20205, ReplyList)
             end
             || GroupId <- NGroupList];
        _ -> ok
    end,
    continue(StateName, State);
handle_info(update_today_stuff, StateName, State) ->
    Week = date:day_of_the_week(date:unixtime()),
    case Week =< 5 andalso Week >= 2 of
        true ->
            {BottomStar, BottomValue} = get_bottom_stuff(),
            logger:debug("~w",
                         [BottomStar],
                         spirit_treasure_mgr,
                         664),
            GroupList = case env:get(spirit_treasure_all_group) of
                            _List when is_list(_List) -> _List;
                            _ -> []
                        end,
            AllUnits = case catch
                                spirit_treasure_data:get_all_units()
                           of
                           _List_ when is_list(_List_) -> _List_;
                           _ -> []
                       end,
            NGroupList = case env:get(is_center) of
                             true -> GroupList;
                             _ ->
                                 case env:get(spirit_treasure_is_cross) of
                                     {0, _} -> [0];
                                     _ -> []
                                 end
                         end,
            logger:debug("~w",
                         [NGroupList],
                         spirit_treasure_mgr,
                         684),
            [begin
                 {_NameList, ReplyList} = make_new_unit(AllUnits,
                                                        GroupId,
                                                        BottomStar,
                                                        BottomValue,
                                                        [],
                                                        []),
                 logger:info("分组~w:~w",
                             [GroupId, _NameList],
                             spirit_treasure_mgr,
                             687),
                 send_info(GroupId, 20205, ReplyList)
             end
             || GroupId <- NGroupList];
        _ -> ok
    end,
    continue(StateName, State);
handle_info({update_rank, Group, RankList},
            StateName = final, State) ->
    in_rank(RankList, Group),
    continue(StateName, State);
handle_info({update_rank, _Group, RankList}, StateName,
            State) ->
    Msg = notice:format(lang:get("很遗憾，~ts，您此次战斗无法登上排行"),
                        [{string_2, 6, lang:get("龙王挑战时间已过")}]),
    [notice:send(RoleId, 3, Msg)
     || #spirit_treasure_rank_rc{id = RoleId} <- RankList],
    continue(StateName, State);
handle_info(create_unit, StateName,
            State = #spirit_treasure_state{map_info = MapInfo}) ->
    RemoveUnitFun = fun (UnitId) ->
                            case unit_mgr:info(UnitId) of
                                {ok, #unit{pid = Pid}} when is_pid(Pid) ->
                                    logger:info("删除地图单位:=========:~w",
                                                [UnitId],
                                                spirit_treasure_mgr,
                                                707),
                                    unit_mgr:remove(UnitId);
                                _ -> ok
                            end
                    end,
    RemoveFun = fun ({Group, _MapId, _MapPid}) ->
                        RemoveUnitFun({53, Group + 100000 + 32000}),
                        RemoveUnitFun({53, Group + 100000 + 32001}),
                        RemoveUnitFun({53, Group + 100000 + 32002}),
                        RemoveUnitFun({53, Group + 100000 + 32003})
                end,
    lists:foreach(RemoveFun, MapInfo),
    create_general_unit(StateName, MapInfo),
    continue(StateName, State);
handle_info(clear_unit_info, StateName, State) ->
    case get(spirit_treasure_clean_ref) of
        Ref when is_reference(Ref) -> erlang:cancel_timer(Ref);
        _ -> ok
    end,
    logger:info("执行每周更新======:~w",
                [StateName],
                spirit_treasure_mgr,
                727),
    Fun = fun (#spirit_treasure_rank_list{list = List},
               _) ->
                  send_rank_reward(List, 1),
                  ok;
              (_, _) -> ok
          end,
    ets:foldl(Fun, ok, ets_spirit_treasure_rank),
    ets:delete_all_objects(ets_spirit_treasure_unit),
    dets:delete_all_objects(ets_spirit_treasure_unit),
    ets:delete_all_objects(ets_spirit_treasure_offer),
    dets:delete_all_objects(ets_spirit_treasure_offer),
    continue(StateName, State);
handle_info({'EXIT', _Pid, normal}, StateName, State) ->
    continue(StateName, State);
handle_info(update_state, _StateName, State) ->
    {StateName, TimeOut} = get_state(),
    NewState = State#spirit_treasure_state{ts = now(),
                                           timeout = TimeOut},
    continue(StateName, NewState);
handle_info({update_record, ExtArgs, RecId}, StateName,
            State = #spirit_treasure_state{cross_type =
                                               CrossType}) ->
    logger:debug("保存录像:~w",
                 [{ExtArgs, RecId}],
                 spirit_treasure_mgr,
                 758),
    BaseId = case lists:keyfind(unit_id, 1, ExtArgs) of
                 {_, _BaseId} -> _BaseId;
                 _ -> 0
             end,
    LeaderId = case lists:keyfind(leader_id, 1, ExtArgs) of
                   {_, _LeaderId} -> _LeaderId;
                   _ -> 0
               end,
    case lookup_unit(BaseId) of
        {ok,
         StUnit = #spirit_treasure_unit{offer_teams =
                                            OfferTeams}} ->
            case lists:keyfind(LeaderId,
                               #spirit_treasure_team.leader_id,
                               OfferTeams)
                of
                StTeam = #spirit_treasure_team{} ->
                    NewStTeam = StTeam#spirit_treasure_team{record_id =
                                                                RecId},
                    NewOfferTeams = lists:keystore(LeaderId,
                                                   #spirit_treasure_team.leader_id,
                                                   OfferTeams,
                                                   NewStTeam),
                    NewStUnit = StUnit#spirit_treasure_unit{offer_teams =
                                                                NewOfferTeams},
                    update_unit(NewStUnit),
                    case CrossType of
                        0 -> combat_record:info({cite, RecId});
                        1 ->
                            case RecId of
                                {_, {_, RecP, RecZ}} ->
                                    cross:call(RecP,
                                               RecZ,
                                               combat_record,
                                               info,
                                               [{cite, RecId}]);
                                _ -> ingore
                            end
                    end,
                    ok;
                _ -> ignore
            end;
        _ -> ignore
    end,
    continue(StateName, State);
handle_info(_Info, StateName, State) ->
    logger:error("spirit_treasure_mgr收到未处理的协议:~w",
                 [_Info],
                 spirit_treasure_mgr,
                 795),
    continue(StateName, State).

terminate(_Reason, _StateName, _State) -> ok.

code_change(_OldVsn, StateName, State, _Extra) ->
    {ok, StateName, State}.

continue(StateName,
         State = #spirit_treasure_state{timeout = infinity}) ->
    {next_state, StateName, State, infinity};
continue(StateName,
         State = #spirit_treasure_state{ts = Ts,
                                        timeout = Tidle}) ->
    {next_state,
     StateName,
     State,
     util:time_left(Tidle, Ts)}.

continue(Reply, StateName,
         State = #spirit_treasure_state{timeout = infinity}) ->
    {reply, Reply, StateName, State, infinity};
continue(Reply, StateName,
         State = #spirit_treasure_state{ts = Ts,
                                        timeout = Tidle}) ->
    {reply,
     Reply,
     StateName,
     State,
     util:time_left(Tidle, Ts)}.

update_unit(NewUnit) ->
    ets:insert(ets_spirit_treasure_unit, NewUnit),
    dets:insert(ets_spirit_treasure_unit, NewUnit).

lookup_unit(UnitId) ->
    case ets:lookup(ets_spirit_treasure_unit, UnitId) of
        [SpiritUnit = #spirit_treasure_unit{}] ->
            {ok, SpiritUnit};
        _ ->
            SpiritUnit = #spirit_treasure_unit{base_id = UnitId},
            {ok, SpiritUnit}
    end.

update_offer(RoleId) ->
    ets:insert(ets_spirit_treasure_offer, {RoleId, 1}),
    dets:insert(ets_spirit_treasure_offer, {RoleId, 1}),
    ok.

lost_offer(RoleId) ->
    ets:delete(ets_spirit_treasure_offer, RoleId),
    dets:delete(ets_spirit_treasure_offer, RoleId),
    ok.

idle(timeout,
     State = #spirit_treasure_state{cross_type = CrossType,
                                    map_info = OldMapInfo}) ->
    {StateName, TimeOut} = get_next_state(idle),
    update_cfg(),
    MapInfo = add_cross_map(CrossType, OldMapInfo),
    NewState = State#spirit_treasure_state{ts = now(),
                                           timeout = TimeOut,
                                           state_name = StateName,
                                           map_info = MapInfo},
    logger:debug("idle进入下个状态:~w",
                 [NewState],
                 spirit_treasure_mgr,
                 864),
    Msg = notice:format(lang:get("~ts已经可以开始挑战啦{face_1,1}"),
                        [{string_2, 1, lang:get("龙王试炼资格")}]),
    cast_msg3(CrossType, Msg),
    push_status(StateName),
    create_general_unit(StateName, MapInfo),
    case CrossType of
        0 -> honor_mgr:clear(spirit_treasure_honor_general);
        _ -> ignore
    end,
    continue(StateName, NewState).

ordeal(timeout,
       State = #spirit_treasure_state{map_info = MapInfo,
                                      cross_type = CrossType}) ->
    {StateName, TimeOut} = get_next_state(ordeal),
    NewState = State#spirit_treasure_state{ts = now(),
                                           timeout = TimeOut,
                                           state_name = StateName},
    logger:debug("ordeal进入下个状态:~w",
                 [NewState],
                 spirit_treasure_mgr,
                 888),
    ets:delete_all_objects(ets_spirit_treasure_rank),
    dets:delete_all_objects(ets_spirit_treasure_rank),
    case CrossType of
        0 -> honor_mgr:clear(spirit_treasure_honor_boss);
        _ -> ignore
    end,
    remove_general_unit(MapInfo),
    create_boss_unit(StateName, MapInfo),
    push_status(StateName),
    Msg =
        notice:format(lang:get("~ts开始啦，获得资格的勇士可以开始挑战精灵龙王啦{face_1,17}"),
                      [{string_2, 1, lang:get("龙王试炼")}]),
    cast_msg3(CrossType, Msg),
    send_start_mail(),
    continue(StateName, NewState).

final(timeout,
      State = #spirit_treasure_state{cross_type = CrossType,
                                     map_info = MapInfo}) ->
    {StateName, TimeOut} = get_next_state(final),
    NewState = State#spirit_treasure_state{ts = now(),
                                           timeout = TimeOut,
                                           state_name = StateName},
    logger:debug("final进入下个状态:~w",
                 [NewState],
                 spirit_treasure_mgr,
                 925),
    remove_boss_unit(MapInfo),
    case CrossType of
        0 -> push_status(StateName);
        _ -> ok
    end,
    cast_final_end_notice(CrossType),
    update_statue(),
    RefTimeOut = date:next_diff(5, 0, 1),
    CleanRef = erlang:send_after(RefTimeOut * 1000,
                                 self(),
                                 clear_unit_info),
    put(spirit_treasure_clean_ref, CleanRef),
    update_cfg(),
    continue(StateName, NewState).

get_next_state(idle) ->
    TimeOut = date:week_next_diff([5], 43200),
    {ordeal, TimeOut * 1000};
get_next_state(ordeal) ->
    TimeOut = date:week_next_diff([1], 5),
    {final, TimeOut * 1000};
get_next_state(final) ->
    TimeOut = date:week_next_diff([1], 36000),
    {idle, TimeOut * 1000}.

get_state() ->
    case {env:get(platform), env:get(zone_id)} of
        {"beta", 1} -> get_normal_state();
        _ ->
            Now = date:unixtime(),
            case Now < 1500861600 of
                true ->
                    case 1 =:= 1 of
                        true -> get_normal_state();
                        _ ->
                            TimeOut = 1500861600 - Now,
                            {idle, TimeOut * 1000}
                    end;
                _ -> get_normal_state()
            end
    end.

get_normal_state() ->
    {{Year, Month, Day}, {Hour, Min, Sec}} =
        calendar:local_time(),
    Week = date:day_of_the_week(Year, Month, Day),
    DaySec = date:seconds_of_the_day({Hour, Min, Sec}),
    get_state(Week, DaySec).

get_state(1, DaySec) when DaySec < 36000 ->
    TimeOut = date:next_diff(10, 0, 0),
    {idle, TimeOut * 1000};
get_state(Day, _DaySec) when Day < 5 ->
    TimeOut = date:week_next_diff([5], 43200),
    {ordeal, TimeOut * 1000};
get_state(Day, DaySec)
    when Day =:= 5 andalso DaySec < 43200 ->
    TimeOut = date:week_next_diff([5], 43200),
    {ordeal, TimeOut * 1000};
get_state(_, _DaySec) ->
    TimeOut = date:week_next_diff([1], 0),
    {final, TimeOut * 1000}.

treat_slave_attr(Fighter, AttrRate) ->
    Fighter#fighter{attr =
                        {spirit_treasure_mgr, treat_unit_attr, [AttrRate]}}.

treat_unit_attr(Attr = #attr{hp_max = HpMax,
                             phy_dmg = PhyDmg, magic_dmg = MagicDmg,
                             atk_speed = AtkSpeed, phy_def = PhyDef,
                             magic_def = MagicDef},
                AttrRate) ->
    logger:debug("随从怪属性特殊处理----> ~w",
                 [AttrRate],
                 spirit_treasure_mgr,
                 1015),
    NewHpMax = round(HpMax * AttrRate / 1000),
    NewPhyDmg = round(PhyDmg * AttrRate / 1000),
    NewMagicDmg = round(MagicDmg * AttrRate / 1000),
    NewAtkSpeed = round(AtkSpeed * AttrRate / 1000),
    NewPhyDef = round(PhyDef * AttrRate / 1000),
    NewMagicDef = round(MagicDef * AttrRate / 1000),
    logger:debug("增强后的属性:~w",
                 [{NewHpMax,
                   NewPhyDmg,
                   NewMagicDmg,
                   NewAtkSpeed,
                   NewPhyDef,
                   NewMagicDef}],
                 spirit_treasure_mgr,
                 1022),
    Attr#attr{hp_max = NewHpMax, phy_dmg = NewPhyDmg,
              magic_dmg = NewMagicDmg, atk_speed = NewAtkSpeed,
              phy_def = NewPhyDef, magic_def = NewMagicDef}.

conver_offer_mate(#fighter{origin_id = OriginId,
                           lev = Lev, name = Name, classes = Classes, sex = Sex,
                           attr = #attr{fc = Fc},
                           m_lev_break = #m_lev_break{times = BreakTimes},
                           looks = Looks}) ->
    #spirit_treasure_offer_mate{id = OriginId, name = Name,
                                lev = Lev, classes = Classes, sex = Sex,
                                fc = Fc, break_times = BreakTimes,
                                looks = Looks}.

state_name2_status(idle) -> 1;
state_name2_status(ordeal) -> 2;
state_name2_status(final) -> 3;
state_name2_status(_) -> 1.

push_status(StateName) ->
    Status = state_name2_status(StateName),
    {_, _CrossGroup} =
        spirit_treasure_role:cross_group_info(),
    Reply = {Status, 1},
    role_group:pack_send(world, 20206, Reply),
    ok.

create_unit(StateName, MapInfo) ->
    create_statue_unit(StateName, MapInfo),
    create_general_unit(StateName, MapInfo),
    create_boss_unit(StateName, MapInfo),
    load_statue(),
    ok.

create_statue_unit(_, MapInfo) ->
    Fun = fun ({Group, MapId, _MapPid}) ->
                  unit_mgr:create({53, get_unit_id(Group, 43074)},
                                  43074,
                                  {MapId, 1509, 491}),
                  unit_mgr:create({53, get_unit_id(Group, 43075)},
                                  43074,
                                  {MapId, 1159, 515}),
                  unit_mgr:create({53, get_unit_id(Group, 43076)},
                                  43076,
                                  {MapId, 957, 758}),
                  unit_mgr:create({53, get_unit_id(Group, 43077)},
                                  43077,
                                  {MapId, 1383, 913}),
                  unit_mgr:create({53, get_unit_id(Group, 43078)},
                                  43078,
                                  {MapId, 1760, 661})
          end,
    lists:foreach(Fun, MapInfo).

create_general_unit(ordeal, MapInfo) ->
    Fun = fun ({Group, MapId, _MapPid}) ->
                  unit_mgr:create({53, get_unit_id(Group, 32000)},
                                  32000,
                                  {MapId, 2120, 280}),
                  unit_mgr:create({53, get_unit_id(Group, 32001)},
                                  32001,
                                  {MapId, 502, 1078}),
                  unit_mgr:create({53, get_unit_id(Group, 32002)},
                                  32002,
                                  {MapId, 567, 268}),
                  unit_mgr:create({53, get_unit_id(Group, 32003)},
                                  32003,
                                  {MapId, 2298, 1027})
          end,
    lists:foreach(Fun, MapInfo);
create_general_unit(_, _MapInfo) -> ok.

remove_general_unit(MapInfo) ->
    Fun = fun ({Group, _MapId, _MapPid}) ->
                  logger:debug("删除地图单位:=========:~w",
                               [Group],
                               spirit_treasure_mgr,
                               1086),
                  unit_mgr:remove({53, get_unit_id(Group, 32000)}),
                  unit_mgr:remove({53, get_unit_id(Group, 32001)}),
                  unit_mgr:remove({53, get_unit_id(Group, 32002)}),
                  unit_mgr:remove({53, get_unit_id(Group, 32003)})
          end,
    lists:foreach(Fun, MapInfo).

create_boss_unit(final, MapInfo) ->
    Fun = fun ({Group, MapId, _MapPid}) ->
                  unit_mgr:create({53, get_unit_id(Group, 32004)},
                                  32004,
                                  {MapId, 1360, 686})
          end,
    lists:foreach(Fun, MapInfo),
    ok;
create_boss_unit(_, _MapInfo) -> ok.

remove_boss_unit(MapInfo) ->
    Fun = fun ({Group, _MapId, _MapPid}) ->
                  unit_mgr:remove({53, get_unit_id(Group, 32004)})
          end,
    lists:foreach(Fun, MapInfo),
    ok.

load_statue() ->
    Fun = fun ({Group, TeamMates}, _) ->
                  update_statue(TeamMates, Group, 1)
          end,
    ets:foldl(Fun, ok, ets_spirit_treasure_statue).

update_statue() ->
    Fun = fun (#spirit_treasure_unit{base_id =
                                         {Group, UnitId},
                                     offer_teams = OfferTeams},
               _) ->
                  case is_boss_unit_id(UnitId) of
                      true ->
                          SortOfferTeams = util:keys_sort([{asc,
                                                            #spirit_treasure_team.use_time},
                                                           #spirit_treasure_team.wave],
                                                          OfferTeams),
                          case SortOfferTeams of
                              [#spirit_treasure_team{team_mates = TeamMates}
                               | _] ->
                                  StatueList = {Group, TeamMates},
                                  update_statue(TeamMates, Group, 1),
                                  ets:insert(ets_spirit_treasure_statue,
                                             StatueList),
                                  dets:insert(ets_spirit_treasure_statue,
                                              StatueList),
                                  ok;
                              _ -> ok
                          end;
                      _ -> ok
                  end;
              (_, _) -> ok
          end,
    ets:foldl(Fun, ok, ets_spirit_treasure_unit).

update_statue([], _Group, _Order) -> ok;
update_statue([#spirit_treasure_offer_mate{name = Name,
                                           lev = Lev, classes = Classes,
                                           sex = Sex, looks = Looks}
               | Rest],
              Group, Order) ->
    StatueId = get_statue_id(Order, Group),
    UnitId = {53, StatueId},
    case unit_mgr:info(UnitId) of
        {ok, #unit{}} ->
            ElemPos = [{#unit.name, Name},
                       {#unit.lev, Lev},
                       {#unit.classes, Classes},
                       {#unit.sex, Sex},
                       {#unit.looks, Looks}],
            unit_mgr:set_element(UnitId, ElemPos),
            ok;
        _ -> ingore
    end,
    update_statue(Rest, Group, Order + 1).

get_statue_id(Order, Group) ->
    case Order of
        1 -> get_unit_id(Group, 43074);
        2 -> get_unit_id(Group, 43075);
        3 -> get_unit_id(Group, 43076);
        4 -> get_unit_id(Group, 43077);
        5 -> get_unit_id(Group, 43078);
        _ -> get_unit_id(Group, 43074)
    end.

update_cfg(init, StateName) ->
    case StateName of
        idle ->
            update_cfg(),
            ok;
        _ ->
            case env:get(spirit_treasure_is_cross) of
                undefined ->
                    update_cfg(),
                    ok;
                _ -> ok
            end
    end.

update_cfg() ->
    logger:debug("更新配置信息", [], spirit_treasure_mgr, 1182),
    update_is_cross(),
    update_group_cross().

update_is_cross() ->
    PZ = {env:get(platform), env:get(zone_id)},
    {IsCross, CrossGrpup} = case
                                spirit_treasure_data:get_cross_group(PZ)
                                of
                                0 -> {0, 0};
                                CfgCrossGrpup -> {1, CfgCrossGrpup}
                            end,
    env:save(spirit_treasure_is_cross,
             {IsCross, CrossGrpup}).

update_group_cross() ->
    logger:debug("更新配置信息update_group_cross",
                 [],
                 spirit_treasure_mgr,
                 1197),
    case env:get(is_center) of
        true ->
            logger:debug("更新配置信息update_group_cross",
                         [],
                         spirit_treasure_mgr,
                         1200),
            PZ = {env:get(platform), env:get(zone_id)},
            CrossList = spirit_treasure_data:get_cross_list(PZ),
            Fun = fun (#{group := Group}, Rtn) ->
                          GroupList = spirit_treasure_data:get_group_list({PZ,
                                                                           Group}),
                          case lists:keymember(Group, 1, Rtn) of
                              true -> Rtn;
                              _ -> [{Group, GroupList} | Rtn]
                          end
                  end,
            GroupList = lists:foldl(Fun, [], CrossList),
            env:save(spirit_treasure_cross_group,
                     {GroupList, CrossList}),
            env:save(spirit_treasure_all_group,
                     spirit_treasure_data:get_all_group());
        _ -> ok
    end.

get_group_list(Group) ->
    PZ = {env:get(platform), env:get(zone_id)},
    case env:get(spirit_treasure_cross_group) of
        {BatchGroupList, _CrossList} ->
            case lists:keyfind(Group, 1, BatchGroupList) of
                {_, GroupList} -> GroupList;
                _ -> spirit_treasure_data:get_group_list({PZ, Group})
            end;
        _ -> spirit_treasure_data:get_group_list({PZ, Group})
    end.

get_cross_list() ->
    case env:get(spirit_treasure_cross_group) of
        {_BatchGroupList, CrossList} -> CrossList;
        _ ->
            PZ = {env:get(platform), env:get(zone_id)},
            spirit_treasure_data:get_cross_list(PZ)
    end.

get_all_group() ->
    case env:get(spirit_treasure_cross_group) of
        {BatchGroupList, _CrossList} ->
            lists:flatten([L || {_Group, L} <- BatchGroupList]);
        _ -> []
    end.

send_rank_reward([], _Rank) -> ok;
send_rank_reward([#spirit_treasure_rank_rc{id = RoleId}
                  | Rest],
                 Rank) ->
    case spirit_treasure_data:get_rank_reward(Rank) of
        RankRewards = [_ | _] ->
            Title = lang:get("挑战龙王排行奖励"),
            Content = lang:get("恭喜您在龙王试练中表现突出，把龙王按倒在地，获得以下丰厚奖励："),
            RankItems = [{Assets, 0, Val}
                         || {Assets, Val} <- RankRewards],
            mail:send(RoleId, Title, Content, RankItems);
        _ -> ok
    end,
    send_rank_reward(Rest, Rank + 1).

add_cross_map(0, OldMapInfo) -> OldMapInfo;
add_cross_map(1, OldMapInfo) ->
    CrossList = get_cross_list(),
    CreateMapCrossList = [CrossInfo
                          || CrossInfo = #{group := Group} <- CrossList,
                             lists:keymember(Group, 1, OldMapInfo) =:= false],
    NewMapInfo = create_map(CreateMapCrossList, []),
    NewMapInfo ++ OldMapInfo.

create_map(0) ->
    case map_mgr:create(53005) of
        {ok, MapPid, MapId} -> [{0, MapId, MapPid}];
        _ -> []
    end;
create_map(1) ->
    CrossList = get_cross_list(),
    create_map(CrossList, []).

create_map([], MapInfo) -> MapInfo;
create_map([#{group := Group} | Rest], MapInfo) ->
    NewMapInfo = case lists:keymember(Group, 1, MapInfo) of
                     true -> MapInfo;
                     _ ->
                         case map_mgr:create(53005) of
                             {ok, MapPid, MapId} ->
                                 [{Group, MapId, MapPid} | MapInfo];
                             _ -> MapInfo
                         end
                 end,
    create_map(Rest, NewMapInfo).

cast_final_end_notice(CrossType) ->
    Fun = fun (#spirit_treasure_unit{base_id =
                                         {Group, UnitId},
                                     offer_teams = OfferTeams},
               _) ->
                  case is_boss_unit_id(UnitId) of
                      true ->
                          case OfferTeams of
                              [#spirit_treasure_team{leader_id = LeaderId,
                                                     team_mates = TeamMates}
                               | _] ->
                                  ChampionName = case lists:keyfind(LeaderId,
                                                                    #spirit_treasure_offer_mate.id,
                                                                    TeamMates)
                                                     of
                                                     #spirit_treasure_offer_mate{name
                                                                                     =
                                                                                     _Name} ->
                                                         _Name;
                                                     _ -> lang:get("")
                                                 end,
                                  Msg =
                                      notice:format(lang:get("~ts到此结束，恭喜~ts带领的队伍获得排名第一{face_1,3}"),
                                                    [{string_2,
                                                      1,
                                                      lang:get("龙王试炼")},
                                                     {role_2, ChampionName}]),
                                  case CrossType of
                                      1 ->
                                          CrossGroupList =
                                              get_group_list(Group),
                                          [cross:call(CastP,
                                                      CastZ,
                                                      notice,
                                                      cast,
                                                      [all, 5, Msg])
                                           || {CastP, CastZ} <- CrossGroupList];
                                      _ -> notice:cast(all, 5, Msg)
                                  end;
                              _ -> ok
                          end;
                      _ -> ok
                  end;
              (_, _) -> ok
          end,
    ets:foldl(Fun, ok, ets_spirit_treasure_unit).

get_unit_id(GroupId, BaseId) ->
    GroupId * 100000 + BaseId.

is_boss_unit_id(UnitId) -> UnitId rem 100000 =:= 32004.

to_client_reply([], _Group, Reply) -> Reply;
to_client_reply([Unit = #spirit_treasure_unit{base_id =
                                                  UnitId}
                 | Rest],
                Group, Reply) ->
    case UnitId of
        {Group, BaseId} ->
            ReplyUnit = Unit#spirit_treasure_unit{base_id = BaseId},
            NewReply = [ReplyUnit | Reply],
            to_client_reply(Rest, Group, NewReply);
        _ -> to_client_reply(Rest, Group, Reply)
    end;
to_client_reply([_ | Rest], Group, Reply) ->
    to_client_reply(Rest, Group, Reply).

cast_msg(Group, Msg) ->
    CrossGroupList = get_group_list(Group),
    [cross:call(CastP, CastZ, notice, cast, [all, 5, Msg])
     || {CastP, CastZ} <- CrossGroupList].

cast_msg2(0, Msg) ->
    case world_lev:get_world_lev() of
        {WorldLev, _} when WorldLev >= 60 ->
            notice:cast(all, 5, Msg);
        _ -> ok
    end;
cast_msg2(Group, Msg) -> cast_msg(Group, Msg).

cast_msg3(CrossType, Msg) ->
    case CrossType of
        1 ->
            CrossGroupList = get_all_group(),
            [cross:call(CastP, CastZ, notice, cast, [all, 5, Msg])
             || {CastP, CastZ} <- CrossGroupList];
        _ -> cast_msg2(0, Msg)
    end.

send_info(0, Proto, Info) ->
    role_group:pack_send(world, Proto, {Info});
send_info(Group, Proto, Info) ->
    CrossGroupList = get_group_list(Group),
    [cross:call(CastP,
                CastZ,
                role_group,
                pack_send,
                [world, Proto, {Info}])
     || {CastP, CastZ} <- CrossGroupList].

send_start_mail() ->
    OfferList = case ets:tab2list(ets_spirit_treasure_offer)
                    of
                    _OfferList when is_list(_OfferList) -> _OfferList;
                    _ -> []
                end,
    Fun = fun (#spirit_treasure_unit{base_id =
                                         {Group, BaseId},
                                     offer_teams = OfferTeams},
               RtnSendMailRoleIds) ->
                  case is_boss_unit_id(BaseId) of
                      false ->
                          TeamFun = fun (#spirit_treasure_team{team_mates =
                                                                   OfferMates},
                                         RtnTeamMateIds) ->
                                            MateFun = fun
                                                          (#spirit_treasure_offer_mate{id
                                                                                           =
                                                                                           MateId =
                                                                                               {_,
                                                                                                MP,
                                                                                                MZ}},
                                                           RtnMateIds) ->
                                                              case
                                                                  lists:member(MateId,
                                                                               RtnTeamMateIds
                                                                                   ++
                                                                                   RtnSendMailRoleIds)
                                                                  of
                                                                  true ->
                                                                      RtnMateIds;
                                                                  _ ->
                                                                      case
                                                                          lists:member({MateId,
                                                                                        1},
                                                                                       OfferList)
                                                                          of
                                                                          true ->
                                                                              MPZ =
                                                                                  c_big_world:get_zone_mapping(MP,
                                                                                                               MZ),
                                                                              GroupList =
                                                                                  get_group_list(Group),
                                                                              case
                                                                                  lists:member(MPZ,
                                                                                               GroupList)
                                                                                  of
                                                                                  true ->
                                                                                      [MateId
                                                                                       | RtnMateIds];
                                                                                  _
                                                                                      when
                                                                                        GroupList
                                                                                            =:=
                                                                                            [] ->
                                                                                      [MateId
                                                                                       | RtnMateIds];
                                                                                  _ ->
                                                                                      RtnMateIds
                                                                              end;
                                                                          _ ->
                                                                              RtnMateIds
                                                                      end
                                                              end
                                                      end,
                                            MateIds = lists:foldl(MateFun,
                                                                  [],
                                                                  OfferMates),
                                            MateIds ++ RtnTeamMateIds
                                    end,
                          TeamMateIds = lists:foldl(TeamFun, [], OfferTeams),
                          TeamMateIds ++ RtnSendMailRoleIds;
                      _ -> RtnSendMailRoleIds
                  end
          end,
    SendMailRoleIds = ets:foldl(Fun,
                                [],
                                ets_spirit_treasure_unit),
    Title = lang:get("龙王试练开始了"),
    Content =
        lang:get("恭喜您在龙王试练中获得挑战资格，现在龙王已经降临了，可进行挑战，精灵珍魂在等着您{face"
                 "_1,7}"),
    MateMailFun = fun (MateId) ->
                          mail:send(MateId, Title, Content)
                  end,
    lists:foreach(MateMailFun, SendMailRoleIds).

is_same_group({_, LP, LZ}, {_, RP, RZ}) ->
    case env:get(spirit_treasure_cross_group) of
        {GroupList, _} ->
            Fun = fun ({_, Gl}, false) ->
                          lists:member({LP, LZ}, Gl) andalso
                              lists:member({RP, RZ}, Gl);
                      (_, true) -> true
                  end,
            lists:foldl(Fun, false, GroupList);
        _ ->
            LPZ = c_big_world:get_zone_mapping(LP, LZ),
            RPZ = c_big_world:get_zone_mapping(RP, RZ),
            LGroup = spirit_treasure_data:get_cross_group(LPZ),
            RGroup = spirit_treasure_data:get_cross_group(RPZ),
            logger:debug("=======:~w",
                         [{LGroup, RGroup}],
                         spirit_treasure_mgr,
                         1430),
            LGroup =:= RGroup
    end.

rank_keys() ->
    [#spirit_treasure_rank_rc.fc,
     {asc, #spirit_treasure_rank_rc.use_time},
     #spirit_treasure_rank_rc.wave].

in_rank([], _Group) -> ok;
in_rank([RankRc = #spirit_treasure_rank_rc{} | Rest],
        Group) ->
    in_rank(RankRc, Group),
    in_rank(Rest, Group);
in_rank(RankRc = #spirit_treasure_rank_rc{wave = Wave,
                                          use_time = UseTime},
        Group) ->
    case ets:lookup(ets_spirit_treasure_rank, Group) of
        [RankList = #spirit_treasure_rank_list{len = Len}]
            when Len < 100 ->
            update_rank(RankList, RankRc),
            ok;
        [RankList = #spirit_treasure_rank_list{min_val =
                                                   {MinWave, MinUseTime}}]
            when Wave > MinWave orelse
                     Wave =:= MinWave andalso UseTime < MinUseTime ->
            update_rank(RankList, RankRc),
            ok;
        [] ->
            NewRankList = #spirit_treasure_rank_list{group = Group},
            update_rank(NewRankList, RankRc);
        _ -> ok
    end.

update_rank(EtsRankListInfo =
                #spirit_treasure_rank_list{list = List},
            RankRc = #spirit_treasure_rank_rc{id = Id, wave = Wave,
                                              use_time = UseTime}) ->
    NewList = case lists:keyfind(Id,
                                 #spirit_treasure_rank_rc.id,
                                 List)
                  of
                  #spirit_treasure_rank_rc{wave = OldWave,
                                           use_time = OldUseTime}
                      when Wave > OldWave orelse
                               Wave =:= OldWave andalso UseTime < OldUseTime ->
                      List1 = lists:keystore(Id,
                                             #spirit_treasure_rank_rc.id,
                                             List,
                                             RankRc),
                      util:keys_sort(rank_keys(), List1);
                  #spirit_treasure_rank_rc{} -> List;
                  _ ->
                      List1 = [RankRc | List],
                      util:keys_sort(rank_keys(), List1)
              end,
    #spirit_treasure_rank_rc{wave = NewMinWave,
                             use_time = NewMinUseTime} =
        lists:last(NewList),
    NewEtsRankListInfo =
        EtsRankListInfo#spirit_treasure_rank_list{list =
                                                      NewList,
                                                  min_val =
                                                      {NewMinWave,
                                                       NewMinUseTime},
                                                  len = length(NewList)},
    ets:insert(ets_spirit_treasure_rank,
               NewEtsRankListInfo),
    dets:insert(ets_spirit_treasure_rank,
                NewEtsRankListInfo),
    ok.

next_notice_time() ->
    case date:day_of_the_week(date:unixtime()) of
        Week when Week < 4 -> date:next_diff(12, 0, 0);
        Week when Week >= 4 ->
            case date:hour() of
                Hour when Hour < 12 andalso Week =:= 4 ->
                    date:next_diff(12, 0, 0);
                _ -> date:week_next_diff([1], 12 * 3600)
            end
    end.

sync_mate_offer(CrossType, Group, OfferTeams,
                LostOfferMates) ->
    GroupList = get_group_list(Group),
    case CrossType of
        1 ->
            [begin
                 [cross:cast(P,
                             Z,
                             spirit_treasure_mgr,
                             info,
                             [{update_offer, RoleId}])
                  || {P, Z} <- GroupList],
                 update_offer(RoleId)
             end
             || #spirit_treasure_offer_mate{id = RoleId}
                    <- OfferTeams],
            [begin
                 [cross:cast(P,
                             Z,
                             spirit_treasure_mgr,
                             info,
                             [{lost_offer, RoleId}])
                  || {P, Z} <- GroupList],
                 lost_offer(RoleId)
             end
             || #spirit_treasure_offer_mate{id = RoleId}
                    <- LostOfferMates],
            ok;
        _ ->
            [update_offer(RoleId)
             || #spirit_treasure_offer_mate{id = RoleId}
                    <- OfferTeams],
            [lost_offer(RoleId)
             || #spirit_treasure_offer_mate{id = RoleId}
                    <- LostOfferMates],
            ok
    end.

check_has_offer(_RoleId, []) -> 0;
check_has_offer(RoleId,
                [Unit = #spirit_treasure_unit{} | Rest]) ->
    case check_has_offer(RoleId, Unit) of
        true -> 1;
        _ -> check_has_offer(RoleId, Rest)
    end;
check_has_offer(RoleId, [_ | Rest]) ->
    check_has_offer(RoleId, Rest);
check_has_offer(RoleId,
                #spirit_treasure_unit{offer_teams = OfferTeams}) ->
    Fun = fun (#spirit_treasure_team{team_mates = Mates},
               Rtn) ->
                  Mates ++ Rtn
          end,
    FlattenOfferTeams = lists:foldl(Fun, [], OfferTeams),
    lists:keymember(RoleId,
                    #spirit_treasure_offer_mate.id,
                    FlattenOfferTeams).

update_offer() ->
    Fun = fun (#spirit_treasure_unit{base_id = {Group, _},
                                     offer_teams = OfferTeams},
               ok) ->
                  GroupList = get_group_list(Group),
                  [begin
                       [begin
                            [cross:cast(P,
                                        Z,
                                        spirit_treasure_mgr,
                                        info,
                                        [{update_offer, MateId}])
                             || {P, Z} <- GroupList],
                            update_offer(MateId)
                        end
                        || #spirit_treasure_offer_mate{id = MateId} <- Mates]
                   end
                   || #spirit_treasure_team{team_mates = Mates}
                          <- OfferTeams],
                  ok
          end,
    ets:foldl(Fun, ok, ets_spirit_treasure_unit).

check_oracle_offer(RoleId) ->
    case ets:lookup(ets_oracle_treasure_offer, RoleId) of
        [{_, 1}] -> 1;
        _ -> 0
    end.

sync_replace_offer(CrossType, Group, OfferTeams) ->
    GroupList = get_group_list(Group),
    logger:debug("=====~w",
                 [OfferTeams],
                 spirit_treasure_mgr,
                 1559),
    case [OT
          || OT = #spirit_treasure_offer_mate{id = RoleId}
                 <- OfferTeams,
             check_oracle_offer(RoleId) =:= 1]
        of
        [] -> ok;
        NewOfferTeams when is_list(NewOfferTeams) ->
            logger:debug("~w",
                         [NewOfferTeams],
                         spirit_treasure_mgr,
                         1563),
            case CrossType of
                1 ->
                    [begin
                         [cross:cast(P,
                                     Z,
                                     oracle_treasure_mgr,
                                     info,
                                     [{lost_offer, RoleId}])
                          || {P, Z} <- GroupList],
                         role:apply(async,
                                    RoleId,
                                    {oracle_treasure_role,
                                     apply_replace_offer,
                                     []}),
                         oracle_treasure_mgr:lost_offer(RoleId)
                     end
                     || #spirit_treasure_offer_mate{id = RoleId}
                            <- NewOfferTeams],
                    ok;
                _ ->
                    [begin
                         oracle_treasure_mgr:lost_offer(RoleId),
                         role:apply(async,
                                    RoleId,
                                    {oracle_treasure_role,
                                     apply_replace_offer,
                                     []})
                     end
                     || #spirit_treasure_offer_mate{id = RoleId}
                            <- NewOfferTeams],
                    ok
            end,
            oracle_treasure_mgr:replace_unit_team()
    end.

replace_unit_team() ->
    OfferList = case ets:tab2list(ets_spirit_treasure_offer)
                    of
                    _OfferList when is_list(_OfferList) -> _OfferList;
                    _ -> []
                end,
    logger:debug("~w",
                 [OfferList],
                 spirit_treasure_mgr,
                 1592),
    Fun = fun (OTU = #spirit_treasure_unit{offer_teams =
                                               OfferTeams},
               _) ->
                  TeamFun = fun (ST = #spirit_treasure_team{team_mates =
                                                                OfferMates},
                                 Temp) ->
                                    MateFun = fun
                                                  (#spirit_treasure_offer_mate{id
                                                                                   =
                                                                                   MateId},
                                                   Rtn) ->
                                                      case lists:member({MateId,
                                                                         1},
                                                                        OfferList)
                                                          of
                                                          true -> true;
                                                          _ -> Rtn
                                                      end
                                              end,
                                    case lists:foldl(MateFun, false, OfferMates)
                                        of
                                        false -> [ST | Temp];
                                        true -> Temp
                                    end
                            end,
                  case lists:foldl(TeamFun, [], OfferTeams) of
                      [] ->
                          logger:debug("====", [], spirit_treasure_mgr, 1608),
                          OfferTeams;
                      DelList ->
                          logger:debug("~w",
                                       [DelList],
                                       spirit_treasure_mgr,
                                       1611),
                          NOfferTeams = OfferTeams -- DelList,
                          NOTU = OTU#spirit_treasure_unit{offer_teams =
                                                              NOfferTeams},
                          update_unit(NOTU)
                  end
          end,
    ets:foldl(Fun, ok, ets_spirit_treasure_unit).

get_bottom_stuff() ->
    Week = date:day_of_the_week(date:unixtime()),
    BottomValue = case Week of
                      1 -> 1000;
                      2 -> 1100;
                      3 -> 1200;
                      4 -> 1300;
                      _ -> 1300
                  end,
    BottomStar = case
                     spirit_treasure_data:get_show_star(BottomValue)
                     of
                     Val when is_integer(Val) -> Val;
                     _ -> 1
                 end,
    {BottomStar, BottomValue}.

make_new_unit([UnitId | T], GroupId, BottomStar,
              BottomValue, List, ReplyList) ->
    {NList, NReplyList} = case is_boss_unit_id(UnitId) of
                              true -> {List, ReplyList};
                              _ ->
                                  case lookup_unit({GroupId, UnitId}) of
                                      {ok,
                                       StUnit = #spirit_treasure_unit{now_star =
                                                                          NowStar,
                                                                      kill_times
                                                                          =
                                                                          Times,
                                                                      diff_num =
                                                                          DiffNum}} ->
                                          case
                                              spirit_treasure_data:get_attr_rate({UnitId,
                                                                                  Times})
                                              of
                                              Num
                                                  when is_integer(Num) andalso
                                                           (NowStar < BottomStar
                                                                orelse
                                                                Num + DiffNum <
                                                                    BottomValue
                                                                    orelse
                                                                    Times =:=
                                                                        0) ->
                                                  NewDiff = max(0,
                                                                BottomValue -
                                                                    Num),
                                                  NewStar = max(NowStar,
                                                                BottomStar),
                                                  NStUnit =
                                                      StUnit#spirit_treasure_unit{now_star
                                                                                      =
                                                                                      NewStar,
                                                                                  diff_num
                                                                                      =
                                                                                      NewDiff},
                                                  update_unit(NStUnit),
                                                  ReplyUnit =
                                                      NStUnit#spirit_treasure_unit{base_id
                                                                                       =
                                                                                       UnitId},
                                                  {[UnitId | List],
                                                   [ReplyUnit | ReplyList]};
                                              _ ->
                                                  update_unit(StUnit),
                                                  ReplyUnit =
                                                      StUnit#spirit_treasure_unit{base_id
                                                                                      =
                                                                                      UnitId},
                                                  {List,
                                                   [ReplyUnit | ReplyList]}
                                          end;
                                      _ -> {List, ReplyList}
                                  end
                          end,
    make_new_unit(T,
                  GroupId,
                  BottomStar,
                  BottomValue,
                  NList,
                  NReplyList);
make_new_unit([], _, _, _, List, ReplyList) ->
    {List, ReplyList}.

load_data() ->
    case dets:first(ets_spirit_treasure_unit) of
        '$end_of_table' ->
            logger:info("没有数据需要加载", [], spirit_treasure_mgr, 1710),
            [];
        _ ->
            dets:traverse(ets_spirit_treasure_unit,
                          fun (U) ->
                                  case spirit_treasure_ver:do_unit(U) of
                                      {false, Reason} ->
                                          logger:error("龙王单位转换失败:~w",
                                                       [Reason],
                                                       spirit_treasure_mgr,
                                                       1717),
                                          {done, false};
                                      {ok, U1 = #spirit_treasure_unit{}} ->
                                          ets:insert(ets_spirit_treasure_unit,
                                                     U1),
                                          dets:insert(ets_spirit_treasure_unit,
                                                      U1),
                                          continue
                                  end
                          end)
    end,
    dets:to_ets(ets_spirit_treasure_unit,
                ets_spirit_treasure_unit).

