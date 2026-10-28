-file("src/mod/qualifying/qualifying_match.erl", 1).

-module(qualifying_match).

-behaviour(gen_server).

-export([init/1,
         handle_call/3,
         handle_cast/2,
         handle_info/2,
         terminate/2,
         code_change/3]).

-export([start_link/1, remove_match_role/1]).

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

-file("src/mod/qualifying/qualifying_match.erl", 16).

-file("inc/qualifying.hrl", 1).

-record(m_qualifying,
        {rank_point = 1000,
         season_combat_count = 0,
         season_win_count = 0,
         update_time = 0,
         day_win = 0,
         day_log = [],
         sign_type = 0,
         win_flag = 0,
         win_five_flag = 0}).

-record(qualifying_role_mark,
        {id = {0, "", 0},
         ver = 4,
         name = "",
         rank_lev = 0,
         rank_type = 0,
         rank_point = 1000,
         lev = 0,
         sex = 0,
         classes = 0,
         looks = [],
         thumb_up = 0,
         thumb_up_other = 0,
         day_flag = 0,
         day_win = 0,
         day_win_streak = 0,
         season_max_rank_point = 1000,
         season_combat_count = 0,
         season_win_count = 0,
         season_win_streak = 0,
         season_max_win_streak = 0,
         week_flag = 0,
         week_max_rank_point = 0,
         up_ranklev_reward = []}).

-record(qualifying_role,
        {id = {0, "", 0},
         status = 0,
         name = "",
         sex = 0,
         classes = 0,
         lev = 0,
         fc = 0,
         rank_lev = 1,
         rank_point = 1000,
         looks = [],
         type = 1,
         times = 1,
         point = 1,
         cross_group = 0 :: non_neg_integer()}).

-record(qualifying_team,
        {ids = [],
         origin_team = [],
         rank_point = 1,
         point = 1,
         match_time = 0,
         reward_point = 1,
         cross_group = 0 :: non_neg_integer()}).

-record(qualifying_rank_data,
        {lev = 1,
         max_lev = 1,
         point = 0,
         need_point = 200,
         rank_type = 0,
         lev_name = "",
         gain = [],
         five_gain = [],
         rank_type_name = [],
         uplev_reward = 0}).

-record(qualifying_zone_role,
        {id = {0, "", 0},
         name = "",
         is_online = 1,
         zone_pid,
         pid,
         zone_id = 0}).

-record(qualifying_season_data,
        {ver = 1,
         id = 1 :: pos_integer(),
         end_time = 0,
         count = 0,
         champion_list = []}).

-file("src/mod/qualifying/qualifying_match.erl", 17).

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

-file("src/mod/qualifying/qualifying_match.erl", 18).

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

-file("src/mod/qualifying/qualifying_match.erl", 19).

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

-file("src/mod/qualifying/qualifying_match.erl", 20).

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

-file("src/mod/qualifying/qualifying_match.erl", 21).

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

-file("src/mod/qualifying/qualifying_match.erl", 22).

-record(state, {type, is_start = 0}).

start_link(Type) ->
    gen_server:start_link(qualifying_match, [Type], []).

init([Type]) ->
    logger:info("[~w] 正在启动...",
                [qualifying_match],
                qualifying_match,
                49),
    process_flag(trap_exit, true),
    put(match_teams, []),
    put(teammate_teams, []),
    State = #state{type = Type},
    logger:info("[~w] 启动完成",
                [qualifying_match],
                qualifying_match,
                55),
    {ok, State}.

handle_call(_Request, _From, State) -> {noreply, State}.

handle_cast({combat_over, Win, Lose, Ext},
            State = #state{type = QualifyingType}) ->
    do_combat_over(QualifyingType, Win, Lose, Ext),
    {noreply, State};
handle_cast(_Msg, State) -> {noreply, State}.

handle_info(start, State = #state{is_start = 0}) ->
    put(match_teams, []),
    put(teammate_teams, []),
    erlang:send_after(4000, self(), match_teams),
    {noreply, State#state{is_start = 1}};
handle_info(stop, State = #state{is_start = 1}) ->
    lists:foreach(fun (#qualifying_team{ids = Ids}) ->
                          self() ! {cancel_match, Ids, stop}
                  end,
                  get(match_teams)),
    lists:foreach(fun (#qualifying_team{ids = Ids}) ->
                          self() ! {cancel_match, Ids, stop}
                  end,
                  get(teammate_teams)),
    erlang:send_after(600 * 1000, self(), clean),
    {noreply, State#state{is_start = 0}};
handle_info(clean, State = #state{is_start = 0}) ->
    put(match_teams, []),
    put(teammate_teams, []),
    {noreply, State};
handle_info(clean, State) -> {noreply, State};
handle_info(match_teams,
            State = #state{type = QualifyingType, is_start = 1}) ->
    match_teammate(QualifyingType),
    {NotMatch, Match} = match_teams(QualifyingType),
    put(match_teams, NotMatch),
    notify_prepare_combat(Match, QualifyingType),
    erlang:send_after(4000, self(), match_teams),
    {noreply, State};
handle_info(match_teams, State) -> {noreply, State};
handle_info({start_combat,
             TeamA = #qualifying_team{ids = Aids},
             TeamB = #qualifying_team{ids = Bids}},
            State = #state{type = QualifyingType}) ->
    Alen = length(Aids),
    Blen = length(Bids),
    IsNumMatched = case QualifyingType of
                       1 -> Alen =:= 3 andalso Blen =:= 3
                   end,
    case IsNumMatched of
        true -> skip;
        false ->
            logger:error("段位赛[Type=~w]的战斗人数不匹配:Alen = ~w, Blen "
                         "= ~w",
                         [QualifyingType, Alen, Blen],
                         qualifying_match,
                         117)
    end,
    QualifyingPid = self(),
    change_sign_up_role_status(Aids ++ Bids, 1),
    spawn(fun () ->
                  start_combat(QualifyingType,
                               TeamA,
                               TeamB,
                               QualifyingPid)
          end),
    {noreply, State};
handle_info({sign_up, QualifyingRoles},
            State = #state{type = QualifyingType}) ->
    RoleIds = [RoleId
               || #qualifying_role{id = RoleId} <- QualifyingRoles],
    case can_sign_up(QualifyingRoles) of
        true ->
            case need_match_teammate(QualifyingType,
                                     QualifyingRoles)
                of
                true ->
                    NewQualifyingRoles = append_rank_info(QualifyingType,
                                                          QualifyingRoles),
                    add_team_to_teammate_queue(QualifyingType,
                                               NewQualifyingRoles);
                false ->
                    NewQualifyingRoles = append_rank_info(QualifyingType,
                                                          QualifyingRoles),
                    add_team_to_match_queue(QualifyingType,
                                            NewQualifyingRoles)
            end,
            qualifying_mgr:sign_up_result(local,
                                          true,
                                          RoleIds,
                                          QualifyingType);
        {false, Reason} ->
            qualifying_mgr:sign_up_result(local,
                                          {false, Reason},
                                          RoleIds,
                                          QualifyingType)
    end,
    qualifying_mgr:remove_signing_up_roles(RoleIds),
    {noreply, State};
handle_info({cancel_match,
             RoleIds = [RoleId = {_, _, _} | _],
             CancelFlag},
            State = #state{type = QualifyingType}) ->
    case get_sign_up_team(RoleId) of
        {true,
         #qualifying_team{ids = RoleIds1,
                          origin_team = OriginTeam}} ->
            case can_cancel_match(RoleIds1) of
                true ->
                    remove_team_from_match_team(RoleIds1),
                    remove_team_from_teammate_team(RoleIds1),
                    {CancelRoleIds, RejoinRoles} = case CancelFlag of
                                                       stop -> {RoleIds1, []};
                                                       _ ->
                                                           split_to_origin_team(RoleId,
                                                                                OriginTeam)
                                                   end,
                    case RejoinRoles of
                        [_ | _] ->
                            add_team_to_teammate_queue(QualifyingType,
                                                       RejoinRoles);
                        _ -> skip
                    end,
                    change_sign_up_role_status(CancelRoleIds, 1),
                    qualifying_mgr:cancel_match_result(CancelRoleIds, true);
                {false, Reason} ->
                    qualifying_mgr:cancel_match_result(RoleIds1,
                                                       {false, Reason})
            end;
        false ->
            case can_cancel_match(RoleIds) of
                true ->
                    change_sign_up_role_status(RoleIds, 1),
                    qualifying_mgr:cancel_match_result(RoleIds, true);
                {false, Reason} ->
                    qualifying_mgr:cancel_match_result(RoleIds,
                                                       {false, Reason})
            end
    end,
    {noreply, State};
handle_info({start_combat_result, not_all, FailRoleIds},
            State = #state{type = Type}) ->
    lists:foreach(fun (RoleId) ->
                          qualifying_mgr:start_combat_result(RoleId,
                                                             {false, fail})
                  end,
                  FailRoleIds),
    deal_other_result(Type, 3, FailRoleIds, []),
    {noreply, State};
handle_info({start_combat_result,
             combat_error,
             Reason,
             Aids,
             Bids},
            State = #state{type = Type}) ->
    logger:error("[~w]和[~w]发起战斗失败:~w",
                 [Aids, Bids, Reason],
                 qualifying_match,
                 195),
    RoleIds = Aids ++ Bids,
    lists:foreach(fun (RoleId) ->
                          qualifying_mgr:start_combat_result(RoleId,
                                                             {false, fail})
                  end,
                  RoleIds),
    deal_other_result(Type, 0, Aids, []),
    deal_other_result(Type, 0, Bids, []),
    {noreply, State};
handle_info({start_combat_result,
             convert_error,
             ASucRoleIds,
             BSucRoleIds,
             Aids,
             Bids},
            State = #state{type = Type}) ->
    RoleIds = Aids ++ Bids,
    {ResultA, ResultB} = if length(ASucRoleIds) > 0 andalso
                                length(BSucRoleIds) =< 0 ->
                                lists:foreach(fun (RoleId) ->
                                                      qualifying_mgr:start_combat_result(RoleId,
                                                                                         {false,
                                                                                          op_leave})
                                              end,
                                              Aids),
                                lists:foreach(fun (RoleId) ->
                                                      qualifying_mgr:start_combat_result(RoleId,
                                                                                         {false,
                                                                                          fail})
                                              end,
                                              Bids),
                                {1, 3};
                            length(ASucRoleIds) =< 0 andalso
                                length(BSucRoleIds) > 0 ->
                                lists:foreach(fun (RoleId) ->
                                                      qualifying_mgr:start_combat_result(RoleId,
                                                                                         {false,
                                                                                          fail})
                                              end,
                                              Aids),
                                lists:foreach(fun (RoleId) ->
                                                      qualifying_mgr:start_combat_result(RoleId,
                                                                                         {false,
                                                                                          op_leave})
                                              end,
                                              Bids),
                                {3, 1};
                            true ->
                                lists:foreach(fun (RoleId) ->
                                                      qualifying_mgr:start_combat_result(RoleId,
                                                                                         {false,
                                                                                          fail})
                                              end,
                                              RoleIds),
                                {3, 3}
                         end,
    deal_other_result(Type, ResultA, Aids, []),
    deal_other_result(Type, ResultB, Bids, []),
    {noreply, State};
handle_info(print, State = #state{type = Type}) ->
    Teams = get(match_teams),
    logger:info("~n", [], qualifying_match, 239),
    logger:info("------匹配进程[Type:~w]------",
                [Type],
                qualifying_match,
                240),
    logger:info("-------匹配队伍列表----------",
                [],
                qualifying_match,
                241),
    lists:foreach(fun (#qualifying_team{ids = Ids,
                                        rank_point = RankPoint, point = Point,
                                        match_time = MatchTime,
                                        reward_point = RwPoint}) ->
                          logger:info("Id列表为:~w", [Ids], qualifying_match, 243),
                          logger:info("段位分:~w, 平均分:~w 得分:~w",
                                      [RankPoint, RwPoint, Point],
                                      qualifying_match,
                                      244),
                          logger:info("已匹配次数:~w",
                                      [MatchTime],
                                      qualifying_match,
                                      245)
                  end,
                  Teams),
    MateTeams = get(teammate_teams),
    logger:info("-------匹配队员列表----------",
                [],
                qualifying_match,
                248),
    lists:foreach(fun (#qualifying_team{ids = Ids,
                                        rank_point = RankPoint, point = Point,
                                        reward_point = RwPoint,
                                        match_time = MatchTime}) ->
                          logger:info("Id列表为:~w", [Ids], qualifying_match, 250),
                          logger:info("段位分:~w, 平均分:~w 得分:~w",
                                      [RankPoint, RwPoint, Point],
                                      qualifying_match,
                                      251),
                          logger:info("已匹配次数:~w",
                                      [MatchTime],
                                      qualifying_match,
                                      252),
                          logger:info("-----------------------------",
                                      [],
                                      qualifying_match,
                                      253)
                  end,
                  MateTeams),
    {noreply, State};
handle_info(_Info, State) ->
    logger:error("收到未知消息: ~w",
                 [_Info],
                 qualifying_match,
                 258),
    {noreply, State}.

terminate(_Reason, _State) ->
    logger:info("[~w] 正在关闭...",
                [qualifying_match],
                qualifying_match,
                262),
    logger:info("[~w] 关闭完成",
                [qualifying_match],
                qualifying_match,
                263),
    ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

get_sign_up_team(RoleId) ->
    case is_in_match_team(RoleId) of
        {true, Team} -> {true, Team};
        false ->
            case is_in_teammate_team(RoleId) of
                {true, Team} -> {true, Team};
                false -> false
            end
    end.

is_in_match_team(RoleId) ->
    Teams = get(match_teams),
    do_is_in_match_team(Teams, RoleId).

do_is_in_match_team([], _RoleId) -> false;
do_is_in_match_team([Team = #qualifying_team{ids = Ids}
                     | T],
                    RoleId) ->
    case lists:member(RoleId, Ids) of
        true -> {true, Team};
        false -> do_is_in_match_team(T, RoleId)
    end.

is_in_teammate_team(RoleId) ->
    Teams = get(teammate_teams),
    do_is_in_teammate_team(Teams, RoleId).

do_is_in_teammate_team([], _RoleId) -> false;
do_is_in_teammate_team([Team = #qualifying_team{ids =
                                                    Ids}
                        | T],
                       RoleId) ->
    case lists:member(RoleId, Ids) of
        true -> {true, Team};
        false -> do_is_in_teammate_team(T, RoleId)
    end.

split_to_origin_team(RoleId, []) -> {[RoleId], []};
split_to_origin_team(RoleId, OriginTeam) ->
    split_to_origin_team(RoleId, OriginTeam, []).

split_to_origin_team(RoleId, [], Rejoin) ->
    case gen_rejoin_team(Rejoin) of
        {ok, RejoinRoles} -> {[RoleId], RejoinRoles};
        false -> {[RoleId | Rejoin], []}
    end;
split_to_origin_team(RoleId, [List | T], Rejoin) ->
    case lists:member(RoleId, List) of
        true ->
            NewT = lists:flatten(T),
            case gen_rejoin_team(NewT ++ Rejoin) of
                {ok, RejoinRoles} -> {List, RejoinRoles};
                false -> {List ++ NewT ++ Rejoin, []}
            end;
        false -> split_to_origin_team(RoleId, T, List ++ Rejoin)
    end.

gen_rejoin_team(RoleIds) ->
    gen_rejoin_team(RoleIds, []).

gen_rejoin_team([], RejoinRoles) -> {ok, RejoinRoles};
gen_rejoin_team([RoleId | T], RejoinRoles) ->
    case catch ets:lookup(qualifying_role_match, RoleId) of
        [QualifyingRole = #qualifying_role{}] ->
            gen_rejoin_team(T, [QualifyingRole | RejoinRoles]);
        _Err ->
            logger:error("根据[~w]无法获得报名角色信息, 无法重组进行报名",
                         [RoleId],
                         qualifying_match,
                         333),
            false
    end.

can_cancel_match([]) -> true;
can_cancel_match([RoleId | T]) ->
    case catch ets:lookup(qualifying_role_match, RoleId) of
        [#qualifying_role{status = 3}] -> {false, matched};
        _ -> can_cancel_match(T)
    end.

remove_team_from_match_team(RoleIds)
    when is_list(RoleIds) ->
    lists:foreach(fun (RoleId) ->
                          remove_team_from_match_team(RoleId)
                  end,
                  RoleIds);
remove_team_from_match_team(RoleId) ->
    Teams = get(match_teams),
    Result = do_remove_team_from_match_team(RoleId,
                                            Teams,
                                            []),
    put(match_teams, Result).

do_remove_team_from_match_team(_, [], Result) -> Result;
do_remove_team_from_match_team(RoleId,
                               [Team = #qualifying_team{ids = RoleIds} | T],
                               Result) ->
    case lists:member(RoleId, RoleIds) of
        true -> Result ++ T;
        false ->
            do_remove_team_from_match_team(RoleId,
                                           T,
                                           [Team | Result])
    end.

remove_team_from_teammate_team(RoleIds)
    when is_list(RoleIds) ->
    lists:foreach(fun (RoleId) ->
                          remove_team_from_teammate_team(RoleId)
                  end,
                  RoleIds);
remove_team_from_teammate_team(RoleId) ->
    Teams = get(teammate_teams),
    Result = do_remove_team_from_teammate_team(RoleId,
                                               Teams,
                                               []),
    put(teammate_teams, Result).

do_remove_team_from_teammate_team(_, [], Result) ->
    Result;
do_remove_team_from_teammate_team(RoleId,
                                  [Team = #qualifying_team{ids = RoleIds} | T],
                                  Result) ->
    case lists:member(RoleId, RoleIds) of
        true -> Result ++ T;
        false ->
            do_remove_team_from_teammate_team(RoleId,
                                              T,
                                              [Team | Result])
    end.

remove_match_role(RoleId = {_, _, _}) ->
    ets:delete(qualifying_role_match, RoleId);
remove_match_role([]) -> ok;
remove_match_role([RoleId | T]) ->
    remove_match_role(RoleId),
    remove_match_role(T).

need_match_teammate(QualifyingType, QualifyingRoles) ->
    Len = length(QualifyingRoles),
    case QualifyingType of 1 -> Len < 3 end.

add_team_to_match_queue(QualifyingType,
                        [#qualifying_role{cross_group = GroupId} | _] =
                            QualifyingRoles) ->
    {TeamPoint, TeamRankPoint, RwPoint} =
        calc_team_rank_info(QualifyingType, QualifyingRoles),
    RoleIds = [RoleId
               || #qualifying_role{id = RoleId} <- QualifyingRoles],
    NewTeam = #qualifying_team{ids = RoleIds,
                               origin_team = [RoleIds], point = TeamPoint,
                               rank_point = TeamRankPoint,
                               reward_point = RwPoint, cross_group = GroupId},
    Teams = get(match_teams),
    NewTeams = Teams ++ [NewTeam],
    put(match_teams, NewTeams),
    lists:foreach(fun (QualifyingRole) ->
                          ets:insert(qualifying_role_match,
                                     QualifyingRole#qualifying_role{status = 2})
                  end,
                  QualifyingRoles),
    ok.

add_team_to_teammate_queue(QualifyingType,
                           [#qualifying_role{cross_group = GroupId} | _] =
                               QualifyingRoles) ->
    {TeamPoint, TeamRankPoint, RwPoint} =
        calc_team_rank_info(QualifyingType, QualifyingRoles),
    RoleIds = [RoleId
               || #qualifying_role{id = RoleId} <- QualifyingRoles],
    NewTeam = #qualifying_team{ids = RoleIds,
                               origin_team = [RoleIds], point = TeamPoint,
                               rank_point = TeamRankPoint,
                               reward_point = RwPoint, cross_group = GroupId},
    Teams = get(teammate_teams),
    NewTeams = Teams ++ [NewTeam],
    put(teammate_teams, NewTeams),
    lists:foreach(fun (QualifyingRole) ->
                          ets:insert(qualifying_role_match,
                                     QualifyingRole#qualifying_role{status = 2})
                  end,
                  QualifyingRoles),
    ok.

change_sign_up_role_status(RoleIds, Status)
    when is_list(RoleIds) ->
    lists:foreach(fun (RoleId) ->
                          change_sign_up_role_status(RoleId, Status)
                  end,
                  RoleIds);
change_sign_up_role_status(RoleId, Status) ->
    case catch ets:lookup(qualifying_role_match, RoleId) of
        [QualifyingRole = #qualifying_role{}] ->
            ets:insert(qualifying_role_match,
                       QualifyingRole#qualifying_role{status = Status});
        _Err ->
            logger:error("无法查找[~w]的报名信息, 无法修改状态为:~w, 原因:~w",
                         [RoleId, Status, _Err],
                         qualifying_match,
                         428)
    end.

calc_team_rank_info(QualifyingType, QualifyingRoles) ->
    RankPoints = [P
                  || #qualifying_role{rank_point = P} <- QualifyingRoles],
    Points = [P
              || #qualifying_role{point = P} <- QualifyingRoles],
    do_calc_team_rank_info(QualifyingType,
                           Points,
                           RankPoints).

do_calc_team_rank_info(1, [Point], [RankPoint]) ->
    NewPoint = round(10 * (Point + RankPoint * 3.0e-3)),
    {NewPoint, RankPoint, RankPoint};
do_calc_team_rank_info(1, [Point1, Point2],
                       [RankPoint1, RankPoint2]) ->
    MaxP = max(Point1, Point2),
    TeamPoint = round(MaxP * 5.0e-1 +
                          (Point1 + Point2) / 2 * 5.0e-1),
    MaxRp = max(RankPoint1, RankPoint2),
    MinRp = min(RankPoint1, RankPoint2),
    TeamRankPoint = round(MaxRp * 5.0e-1 +
                              (MaxRp + MinRp) / 2 * 5.0e-1),
    TeamRwPoint = round((MaxRp + MinRp) / 2),
    NewTeamPoint = round(10 *
                             (TeamPoint + 3.0e-3 * TeamRankPoint)),
    {NewTeamPoint, TeamRankPoint, TeamRwPoint};
do_calc_team_rank_info(1, [Point1, Point2, Point3],
                       [RankPoint1, RankPoint2, RankPoint3]) ->
    [_, _, MaxP] = lists:sort([Point1, Point2, Point3]),
    TeamPoint = round(MaxP * 5.0e-1 +
                          (Point1 + Point2 + Point3) / 3 * 5.0e-1),
    [MinRp, MidRp, MaxRp] = lists:sort([RankPoint1,
                                        RankPoint2,
                                        RankPoint3]),
    TeamRankPoint = round(MaxRp * 5.0e-1 +
                              (MinRp + MidRp + MaxRp) / 3 * 5.0e-1),
    TeamRwPoint = round((MinRp + MidRp + MaxRp) / 3),
    NewTeamPoint = round(10 *
                             (TeamPoint + 3.0e-3 * TeamRankPoint)),
    {NewTeamPoint, TeamRankPoint, TeamRwPoint}.

can_sign_up([]) -> true;
can_sign_up([#qualifying_role{id = RoleId} | T]) ->
    case ets:lookup(qualifying_role_match, RoleId) of
        [#qualifying_role{status = 2}] ->
            {false, lang:get("正在段位赛匹配中, 请稍后")};
        [#qualifying_role{status = 3}] ->
            {false, lang:get("已经匹配上对手, 请稍后")};
        [#qualifying_role{status = 1}] -> can_sign_up(T);
        [] -> can_sign_up(T);
        _ -> {false, lang:get("系统繁忙, 请稍后报名")}
    end.

append_rank_info(QualifyingType, QualifyingRoles) ->
    append_rank_info(QualifyingType, QualifyingRoles, []).

append_rank_info(_, [], NewQualifyingRoles) ->
    lists:reverse(NewQualifyingRoles);
append_rank_info(QualifyingType,
                 [QualifyingRole = #qualifying_role{id = RoleId,
                                                    lev = RoleLev}
                  | T],
                 NewQualifyingRoles) ->
    {RankLev, RankPoint} = case
                               qualifying_mgr:find_role(RoleId)
                               of
                               {ok,
                                #qualifying_role_mark{rank_lev = Rl,
                                                      rank_point = Rp}} ->
                                   {Rl, Rp};
                               false -> {0, 1000};
                               _ -> {0, 1000}
                           end,
    NewQualifyingRole = QualifyingRole#qualifying_role{type
                                                           = QualifyingType,
                                                       rank_lev = RankLev,
                                                       rank_point = RankPoint,
                                                       point = RoleLev},
    append_rank_info(QualifyingType,
                     T,
                     [NewQualifyingRole | NewQualifyingRoles]).

do_combat_over(QualifyingType, Winer, Loser, _Ext) ->
    WinFlag = calc_win_combat_result(Winer),
    LoseFlag = op_combat_result(WinFlag),
    WinMate = [#{id => {Rid, Platform, ZoneId},
                 name => Name, sex => Sex, classes => Classes,
                 lev => Lev}
               || #fighter{rid = Rid, platform = Platform,
                           zone_id = ZoneId, name = Name, sex = Sex,
                           classes = Classes, lev = Lev, type = 1}
                      <- Winer],
    LoseMate = [#{id => {Rid, Platform, ZoneId},
                  name => Name, sex => Sex, classes => Classes,
                  lev => Lev}
                || #fighter{rid = Rid, platform = Platform,
                            zone_id = ZoneId, name = Name, sex = Sex,
                            classes = Classes, lev = Lev, type = 1}
                       <- Loser],
    deal_combat_result(QualifyingType,
                       WinFlag,
                       Winer,
                       WinMate),
    deal_combat_result(QualifyingType,
                       LoseFlag,
                       Loser,
                       LoseMate),
    ok.

start_combat(QualifyingType,
             _TeamA = #qualifying_team{ids = Aids},
             _TeamB = #qualifying_team{ids = Bids}, QualifyingPid) ->
    {Awrap, _FailsA} = role_to_fighter_wrap(QualifyingType,
                                            Aids),
    {Bwrap, _FailsB} = role_to_fighter_wrap(QualifyingType,
                                            Bids),
    ASucRoleIds = [{Rid, Platform, ZoneId}
                   || #fighter_wrap{fighter =
                                        #fighter{rid = Rid, platform = Platform,
                                                 zone_id = ZoneId, type = 1}}
                          <- Awrap],
    BSucRoleIds = [{Rid, Platform, ZoneId}
                   || #fighter_wrap{fighter =
                                        #fighter{rid = Rid, platform = Platform,
                                                 zone_id = ZoneId, type = 1}}
                          <- Bwrap],
    AFailRoleIds = Aids -- ASucRoleIds,
    BFailRoleIds = Bids -- BSucRoleIds,
    FailRoleIds = AFailRoleIds ++ BFailRoleIds,
    case length(Awrap) > 0 andalso length(Bwrap) > 0 of
        true ->
            StartArgs = #combat_start_args{common_referee =
                                               QualifyingPid},
            case combat_mgr:start_combat(102,
                                         Awrap,
                                         Bwrap,
                                         StartArgs)
                of
                {ok, _CombatPid} ->
                    case length(FailRoleIds) > 0 of
                        true ->
                            logger:debug("部分发起失败:~w",
                                         [FailRoleIds],
                                         qualifying_match,
                                         517),
                            QualifyingPid !
                                {start_combat_result, not_all, FailRoleIds};
                        false -> skip
                    end;
                {false, Reason} ->
                    logger:debug("Reason:~w",
                                 [Reason],
                                 qualifying_match,
                                 522),
                    QualifyingPid !
                        {start_combat_result, combat_error, Reason, Aids, Bids}
            end;
        false ->
            logger:debug("战斗人数为0, 无法发起", [], qualifying_match, 526),
            QualifyingPid !
                {start_combat_result,
                 convert_error,
                 ASucRoleIds,
                 BSucRoleIds,
                 Aids,
                 Bids}
    end.

calc_win_combat_result(Win = [_ | _]) ->
    calc_win_combat_result(Win, 1);
calc_win_combat_result(_) -> 0.

calc_win_combat_result([], Result) -> Result;
calc_win_combat_result([#fighter{is_die = IsDie,
                                 type = 1}
                        | T],
                       Result) ->
    case IsDie of
        1 -> 2;
        _ -> calc_win_combat_result(T, Result)
    end;
calc_win_combat_result([_ | T], Result) ->
    calc_win_combat_result(T, Result).

op_combat_result(1) -> 3;
op_combat_result(2) -> 4;
op_combat_result(3) -> 1;
op_combat_result(4) -> 2;
op_combat_result(0) -> 0.

deal_combat_result(_Type, _Result, [], _) -> ok;
deal_combat_result(Type, Result,
                   [#fighter{rid = Rid, platform = Plat, zone_id = Zone,
                             name = Name, type = 1,
                             combat_statistics = CombatStatistics}
                    | T],
                   Mate) ->
    RoleId = {Rid, Plat, Zone},
    case get_sign_up_info(RoleId) of
        false ->
            logger:error("段位赛无法查找[~ts]的报名信息",
                         [Name],
                         qualifying_match,
                         555),
            qualifying_mgr:combat_time_over(RoleId),
            deal_combat_result(Type, Result, T, Mate);
        {ok,
         Qrole = #qualifying_role{lev = RoleLev,
                                  times = Times}} ->
            {PointChange, Rewards} =
                qualifying_util:calc_combat_over_reward(Type,
                                                        Result,
                                                        {RoleId, RoleLev}),
            GetMate = [Gm
                       || Gm = #{id := Gid} <- Mate, Gid =/= RoleId],
            CombatInfo = #{type => Type, role_id => RoleId,
                           result => Result, combat => CombatStatistics,
                           role => Qrole, point_change => PointChange,
                           rewards => Rewards, mate => GetMate, times => Times},
            qualifying_mgr:combat_over(local, CombatInfo),
            deal_combat_result(Type, Result, T, Mate)
    end;
deal_combat_result(Type, Result, [_ | T], Mate) ->
    deal_combat_result(Type, Result, T, Mate).

deal_other_result(_Type, _Result, [], _) -> ok;
deal_other_result(Type, Result, [RoleId | T], Mate) ->
    case get_sign_up_info(RoleId) of
        false -> deal_other_result(Type, Result, T, Mate);
        {ok,
         Qrole = #qualifying_role{lev = RoleLev,
                                  times = Times}} ->
            {PointChange, Rewards} =
                qualifying_util:calc_combat_over_reward(Type,
                                                        Result,
                                                        {RoleId, RoleLev}),
            CombatStatistics = #combat_statistics{},
            CombatInfo = #{type => Type, role_id => RoleId,
                           result => Result, combat => CombatStatistics,
                           role => Qrole, point_change => PointChange,
                           rewards => Rewards, mate => Mate, times => Times},
            qualifying_mgr:combat_over(local, CombatInfo),
            deal_other_result(Type, Result, T, Mate)
    end.

role_to_fighter_wrap(QualifyingType, RoleIds) ->
    role_to_fighter_wrap(QualifyingType,
                         [{RoleId, 0} || RoleId <- RoleIds],
                         [],
                         []).

role_to_fighter_wrap(_QualifyingType, [], Result,
                     Fail) ->
    {Result, Fail};
role_to_fighter_wrap(QualifyingType,
                     [{RoleId = {Rid, Platform, ZoneId}, TryNum} | T],
                     Result, Fail) ->
    case role_query:rec(by_id,
                        Rid,
                        Platform,
                        ZoneId,
                        fighter_wrap)
        of
        {ok, Fw = #fighter_wrap{s_event = 5}}
            when QualifyingType =:= 1 ->
            role_to_fighter_wrap(QualifyingType,
                                 T,
                                 [Fw | Result],
                                 Fail);
        {ok, #fighter_wrap{}} ->
            role_to_fighter_wrap(QualifyingType,
                                 T,
                                 Result,
                                 [{RoleId, event} | Fail]);
        {error, timeout} ->
            case TryNum >= 3 of
                false ->
                    logger:debug("角色转换[~w]超时, 正在重试第~w次",
                                 [RoleId, TryNum + 1],
                                 qualifying_match,
                                 596),
                    role_to_fighter_wrap(QualifyingType,
                                         [{RoleId, TryNum + 1} | T],
                                         Result,
                                         Fail);
                true ->
                    logger:debug("角色转换[~w]仍然超时,不再尝试",
                                 [RoleId],
                                 qualifying_match,
                                 599),
                    role_to_fighter_wrap(QualifyingType,
                                         T,
                                         Result,
                                         [{RoleId, timeout} | Fail])
            end;
        {error, not_found} ->
            logger:debug("角色掉线[~w], 无法转换",
                         [RoleId],
                         qualifying_match,
                         603),
            role_to_fighter_wrap(QualifyingType,
                                 T,
                                 Result,
                                 [{RoleId, offline} | Fail]);
        _Err ->
            role_to_fighter_wrap(QualifyingType,
                                 T,
                                 Result,
                                 [{RoleId, _Err} | Fail])
    end.

match_teams(Type = 1) ->
    Teams = get(match_teams),
    Groups = group_team(Teams, []),
    group_match_teams(Groups, Type, [], []);
match_teams(_) ->
    Teams = get(match_teams),
    {Teams, []}.

group_match_teams([], _, NotMatch, MatchPair) ->
    {NotMatch, MatchPair};
group_match_teams([{_, Teams} | T], Type, NotMatch,
                  MatchPair) ->
    SortTeams =
        lists:reverse(lists:keysort(#qualifying_team.point,
                                    Teams)),
    {NewMatchPair, NewNotMatch} = do_match_team(Type,
                                                SortTeams,
                                                MatchPair,
                                                NotMatch),
    group_match_teams(T, Type, NewNotMatch, NewMatchPair).

do_match_team(_, [], MatchPair, NotMatch) ->
    {MatchPair, NotMatch};
do_match_team(QualifyingType,
              [TeamA = #qualifying_team{match_time = MatchTime} | T],
              MatchPair, NotMatch) ->
    Dir = case util:rand(1, 100) =< 50 of
              true -> high;
              false -> low
          end,
    case match_team_by_dir(QualifyingType, TeamA, T, Dir) of
        {true, TeamB} ->
            WaitMatchTeam = T -- [TeamB],
            do_match_team(QualifyingType,
                          WaitMatchTeam,
                          [{TeamA, TeamB} | MatchPair],
                          NotMatch);
        false ->
            do_match_team(QualifyingType,
                          T,
                          MatchPair,
                          [TeamA#qualifying_team{match_time = MatchTime + 1}
                           | NotMatch])
    end.

match_team_by_dir(_, _TeamA, [], _Dir) -> false;
match_team_by_dir(QualifyingType, TeamA, [TeamA | T],
                  Dir) ->
    match_team_by_dir(QualifyingType, TeamA, T, Dir);
match_team_by_dir(QualifyingType,
                  TeamA = #qualifying_team{ids = _Aids, point = PointA,
                                           match_time = MatchTimeA},
                  [TeamB = #qualifying_team{ids = _Bids, point = PointB}
                   | T],
                  Dir) ->
    Result = case QualifyingType of
                 1 ->
                     Latitude = case MatchTimeA of
                                    0 -> 0;
                                    1 -> 0;
                                    2 -> 10;
                                    3 -> 20;
                                    4 -> 30;
                                    5 -> 40;
                                    6 -> 50;
                                    7 -> 80;
                                    8 -> 100;
                                    9 -> 110;
                                    10 -> 150;
                                    11 -> 160;
                                    12 -> 170;
                                    13 -> 180;
                                    14 -> 190;
                                    15 -> 250;
                                    16 -> 260;
                                    17 -> 270;
                                    18 -> 280;
                                    19 -> 290;
                                    20 -> 300;
                                    21 -> 310;
                                    22 -> 320;
                                    23 -> 330;
                                    24 -> 340;
                                    25 -> 350;
                                    26 -> 360;
                                    27 -> 370;
                                    28 -> 380;
                                    29 -> 390;
                                    30 -> 400;
                                    31 -> 400;
                                    32 -> 400;
                                    _ -> 450
                                end,
                     if PointA - Latitude > PointB orelse
                            PointA + Latitude < PointB ->
                            false;
                        true -> match
                     end
             end,
    case Result of
        match -> {true, TeamB};
        _ -> match_team_by_dir(QualifyingType, TeamA, T, Dir)
    end;
match_team_by_dir(QualifyingType, TeamA, [_ | T],
                  Dir) ->
    match_team_by_dir(QualifyingType, TeamA, T, Dir).

get_pre_time(1) -> 8000.

notify_prepare_combat([], _QualifyingType) -> ok;
notify_prepare_combat([{PreTeamA, PreTeamB} | T],
                      QualifyingType) ->
    {ClassiseTeamA, ClassiseTeamB} =
        exchange_assist_classes(PreTeamA, PreTeamB),
    {TeamA = #qualifying_team{ids = Aids},
     TeamB = #qualifying_team{ids = Bids}} =
        calc_balance(QualifyingType,
                     ClassiseTeamA,
                     ClassiseTeamB),
    logger:debug("战力交换后队伍:~w",
                 [{TeamA, TeamB}],
                 qualifying_match,
                 706),
    PrepareTime = get_pre_time(QualifyingType),
    Aroles = get_team_info(TeamA),
    Broles = get_team_info(TeamB),
    lists:foreach(fun calc_role_combat_score/1,
                  [{Id, TeamA, TeamB, QualifyingType} || Id <- Aids]),
    lists:foreach(fun calc_role_combat_score/1,
                  [{Id, TeamB, TeamA, QualifyingType} || Id <- Bids]),
    change_sign_up_role_status(Aids ++ Bids, 3),
    Ainfos = [{Id,
               Name,
               Sex,
               Classes,
               Lev,
               RankLev,
               RankPoint,
               Looks}
              || #qualifying_role{id = Id, name = Name, sex = Sex,
                                  classes = Classes, lev = Lev,
                                  rank_lev = RankLev, rank_point = RankPoint,
                                  looks = Looks}
                     <- Aroles],
    Binfos = [{Id,
               Name,
               Sex,
               Classes,
               Lev,
               RankLev,
               RankPoint,
               Looks}
              || #qualifying_role{id = Id, name = Name, sex = Sex,
                                  classes = Classes, lev = Lev,
                                  rank_lev = RankLev, rank_point = RankPoint,
                                  looks = Looks}
                     <- Broles],
    ARoleIds = [RoleId
                || #qualifying_role{id = RoleId} <- Aroles],
    BRoleIds = [RoleId
                || #qualifying_role{id = RoleId} <- Broles],
    qualifying_mgr:match_result(ARoleIds,
                                QualifyingType,
                                Ainfos,
                                Binfos),
    qualifying_mgr:match_result(BRoleIds,
                                QualifyingType,
                                Binfos,
                                Ainfos),
    erlang:send_after(PrepareTime,
                      self(),
                      {start_combat, TeamA, TeamB}),
    notify_prepare_combat(T, QualifyingType);
notify_prepare_combat([_ | T], QualifyingType) ->
    notify_prepare_combat(T, QualifyingType).

calc_role_combat_score({Rid,
                        TeamA,
                        TeamB,
                        QualifyingType}) ->
    RoleRankPoint = case get_sign_up_info(Rid) of
                        {ok, #qualifying_role{rank_point = QuaRoleRankPoint}} ->
                            QuaRoleRankPoint;
                        _ -> 1000
                    end,
    PreRankPoint =
        qualifying_util:get_pre_rank_point(RoleRankPoint,
                                           TeamA,
                                           TeamB,
                                           QualifyingType),
    logger:debug("Rid：~w,  分:~w, 结果分~w",
                 [Rid, RoleRankPoint, PreRankPoint],
                 qualifying_match,
                 731),
    put({gain_rank_point, Rid}, PreRankPoint).

get_sign_up_roles(RoleIds) ->
    get_sign_up_roles(RoleIds, []).

get_sign_up_roles([], QualifyingRoles) ->
    QualifyingRoles;
get_sign_up_roles([RoleId | Rest], QualifyingRoles) ->
    case get_sign_up_info(RoleId) of
        {ok, QualifyingRole} ->
            get_sign_up_roles(Rest,
                              [QualifyingRole | QualifyingRoles]);
        false -> get_sign_up_roles(Rest, [QualifyingRoles])
    end.

get_sign_up_info(RoleId) ->
    case catch ets:lookup(qualifying_role_match, RoleId) of
        [QualifyingRole = #qualifying_role{}] ->
            {ok, QualifyingRole};
        _ -> false
    end.

get_team_info(#qualifying_team{ids = Ids}) ->
    get_team_info(Ids, []).

get_team_info([], Result) -> Result;
get_team_info([RoleId | T], Result) ->
    case catch ets:lookup(qualifying_role_match, RoleId) of
        [QualifyingRole = #qualifying_role{}] ->
            get_team_info(T, [QualifyingRole | Result]);
        _ -> get_team_info(T, Result)
    end.

group_team([], Groups) -> Groups;
group_team([G = #qualifying_team{cross_group = GroupId}
            | T],
           Groups) ->
    case lists:keyfind(GroupId, 1, Groups) of
        {_, L} ->
            group_team(T,
                       lists:keyreplace(GroupId,
                                        1,
                                        Groups,
                                        {GroupId, [G | L]}));
        _ -> group_team(T, [{GroupId, [G]} | Groups])
    end.

match_teammate(QualifyingType) ->
    Teams = get(teammate_teams),
    Groups = group_team(Teams, []),
    Match = get(match_teams),
    group_match_teammate(Groups, QualifyingType, Match, []).

group_match_teammate([], _, Match, NotMatch) ->
    put(match_teams, Match),
    put(teammate_teams, NotMatch),
    ok;
group_match_teammate([{_, Teams} | T], QualifyingType,
                     Match, NotMatch) ->
    SortTeams =
        lists:reverse(lists:keysort(#qualifying_team.point,
                                    Teams)),
    {NewMatch, NewNotMatch} =
        do_match_teammate(QualifyingType,
                          SortTeams,
                          SortTeams,
                          Match,
                          NotMatch),
    group_match_teammate(T,
                         QualifyingType,
                         NewMatch,
                         NewNotMatch).

do_match_teammate(_, [], _, Match, NotMatch) ->
    {Match, NotMatch};
do_match_teammate(1,
                  [Team1 = #qualifying_team{match_time = MatchTimeOld}
                   | T],
                  Ops, Match, NotMatch) ->
    case make_matched_teammate(1, Team1, Ops, [Team1]) of
        Teams when is_list(Teams) ->
            NewTeam = combine_teams(Teams),
            do_match_teammate(1,
                              T -- Teams,
                              Ops -- Teams,
                              [NewTeam | Match],
                              NotMatch);
        _ ->
            do_match_teammate(1,
                              T,
                              Ops -- [Team1],
                              Match,
                              [Team1#qualifying_team{match_time =
                                                         MatchTimeOld + 1}
                               | NotMatch])
    end.

make_matched_teammate(1, _Team1, [], _) -> false;
make_matched_teammate(1, Team1, [Team1 | T], Result) ->
    make_matched_teammate(1, Team1, T, Result);
make_matched_teammate(1,
                      Team1 = #qualifying_team{ids = RoleIds1, point = Point1,
                                               match_time = MatchTime1},
                      [Team2 = #qualifying_team{ids = RoleIds2,
                                                point = Point2}
                       | T],
                      Result)
    when length(RoleIds1) + length(RoleIds2) =< 3 ->
    Latitude = case MatchTime1 of
                   0 -> 0;
                   1 -> 0;
                   2 -> 10;
                   3 -> 20;
                   4 -> 30;
                   5 -> 40;
                   6 -> 50;
                   7 -> 80;
                   8 -> 100;
                   9 -> 110;
                   10 -> 150;
                   11 -> 160;
                   12 -> 170;
                   13 -> 180;
                   14 -> 190;
                   15 -> 250;
                   16 -> 260;
                   17 -> 270;
                   18 -> 280;
                   19 -> 290;
                   20 -> 300;
                   21 -> 310;
                   22 -> 320;
                   23 -> 330;
                   24 -> 340;
                   25 -> 350;
                   26 -> 360;
                   27 -> 370;
                   28 -> 380;
                   29 -> 390;
                   30 -> 400;
                   31 -> 400;
                   32 -> 400;
                   _ -> 450
               end,
    if Point1 - Latitude > Point2 ->
           make_matched_teammate(1, Team1, T, Result);
       Point1 + Latitude < Point2 ->
           make_matched_teammate(1, Team1, T, Result);
       true ->
           case length(RoleIds1) + length(RoleIds2) =:= 3 of
               true ->
                   case calc_all_assist_num(RoleIds1 ++ RoleIds2) of
                       3 -> make_matched_teammate(1, Team1, T, Result);
                       2 when MatchTime1 < 6 ->
                           case calc_all_assist_num(RoleIds1) of
                               1 -> make_matched_teammate(1, Team1, T, Result);
                               _ -> [Team2 | Result]
                           end;
                       _ -> [Team2 | Result]
                   end;
               false ->
                   case calc_all_assist_num(RoleIds1 ++ RoleIds2) =:= 2 of
                       true when MatchTime1 < 6 ->
                           make_matched_teammate(1, Team1, T, Result);
                       _ ->
                           NewTeam = combine_teams([Team1, Team2]),
                           NewTeam1 = NewTeam#qualifying_team{match_time =
                                                                  MatchTime1},
                           make_matched_teammate(1,
                                                 NewTeam1,
                                                 T,
                                                 [Team2 | Result])
                   end
           end
    end;
make_matched_teammate(Type, Team1, [_ | T], Result) ->
    make_matched_teammate(Type, Team1, T, Result).

combine_teams(Teams) ->
    {RoleIds, OriginTeam, RankPoint, Point, RwPoint} =
        do_combine_team(Teams),
    [#qualifying_team{cross_group = GroupId} | _] = Teams,
    #qualifying_team{ids = RoleIds,
                     origin_team = OriginTeam, point = Point,
                     rank_point = RankPoint, reward_point = RwPoint,
                     cross_group = GroupId}.

do_combine_team(Teams) ->
    do_combine_team(Teams, [], [], [], []).

do_combine_team([], RoleIds, OriginTeam, RankPoints,
                Points) ->
    case length(Points) of
        Num when Num =< 2 ->
            MaxRp = lists:max(RankPoints),
            MinRp = lists:min(RankPoints),
            RankP = round(MaxRp * 5.0e-1 +
                              (MaxRp + MinRp) / 2 * 5.0e-1),
            MaxP = lists:max(Points),
            AvgP = util:list_avg(Points),
            Point = round(MaxP * 5.0e-1 + AvgP * 5.0e-1),
            RwPoint = round((MaxRp + MinRp) / 2),
            {RoleIds, OriginTeam, RankP, Point, RwPoint};
        3 ->
            [MinRp, MidRp, MaxRp] = lists:sort(RankPoints),
            RankP = round(MaxRp * 5.0e-1 +
                              (MinRp + MidRp + MaxRp) / 3 * 5.0e-1),
            [MinP, MidP, MaxP] = lists:sort(Points),
            Point = round(MaxP * 5.0e-1 +
                              (MinP + MidP + MaxP) / 3 * 5.0e-1),
            RwPoint = round((MinRp + MidRp + MaxRp) / 3),
            {RoleIds, OriginTeam, RankP, Point, RwPoint}
    end;
do_combine_team([#qualifying_team{ids = Ids,
                                  origin_team = OriTeam, point = Pt,
                                  rank_point = RankPoint}
                 | T],
                RoleIds, OriginTeam, RankPoints, Points) ->
    do_combine_team(T,
                    Ids ++ RoleIds,
                    OriTeam ++ OriginTeam,
                    [RankPoint | RankPoints],
                    [Pt | Points]).

exchange_assist_classes(TeamA, TeamB) ->
    case check_need_exchange(TeamA, TeamB) of
        {true, AssistTeam, DpsTeam, AssistRoleId, DpsRoleId} ->
            #qualifying_team{origin_team = AssitsOriIds} =
                AssistTeam,
            #qualifying_team{origin_team = DpsOriIds} = DpsTeam,
            {SplitAssistRoleIds, AnoAssistRoles} =
                split_to_origin_team(AssistRoleId, AssitsOriIds),
            {SplitDpsRoleIds, AnoDpsRoles} =
                split_to_origin_team(DpsRoleId, DpsOriIds),
            SplitAssistRoles =
                get_sign_up_roles(SplitAssistRoleIds),
            SplitDpsRoles = get_sign_up_roles(SplitDpsRoleIds),
            SplitAssistTeam =
                make_qualifying_team(SplitAssistRoles),
            AnoAssistTeam = make_qualifying_team(AnoAssistRoles),
            SplitDpsTeam = make_qualifying_team(SplitDpsRoles),
            AnoDpsTeam = make_qualifying_team(AnoDpsRoles),
            NewTeamA = combine_teams([SplitAssistTeam, AnoDpsTeam]),
            NewTeamB = combine_teams([SplitDpsTeam, AnoAssistTeam]),
            {NewTeamA, NewTeamB};
        false -> {TeamA, TeamB}
    end.

check_need_exchange(TeamA = #qualifying_team{origin_team
                                                 = AOriginTeam},
                    TeamB = #qualifying_team{origin_team = BOriginTeam}) ->
    {AssistNumA, AAssistQuaRole, ADpsQuaRole} =
        calc_assist_num(AOriginTeam),
    {AssistNumB, BAssistQuaRole, BDpsQuaRole} =
        calc_assist_num(BOriginTeam),
    if AssistNumA - AssistNumB >= 2 ->
           {true, TeamA, TeamB, AAssistQuaRole, BDpsQuaRole};
       AssistNumA - AssistNumB =< -2 ->
           {true, TeamB, TeamA, BAssistQuaRole, ADpsQuaRole};
       true -> false
    end.

calc_assist_num(RoleIds) ->
    calc_assist_num(RoleIds,
                    0,
                    assist_roleid_undef,
                    dps_roleid_undef).

calc_assist_num([], Num, AssistQuaRoleId,
                DpsQuaRoleId) ->
    {Num, AssistQuaRoleId, DpsQuaRoleId};
calc_assist_num([TeamRids | Rest], Num, AssistQuaRoleId,
                DpsQuaRoleId) ->
    TeamMemCount = length(TeamRids),
    case is_have_assist(TeamRids) of
        {true, RoleId} ->
            case TeamMemCount =:= 2 of
                true ->
                    calc_assist_num(Rest,
                                    Num + 1,
                                    AssistQuaRoleId,
                                    DpsQuaRoleId);
                false ->
                    calc_assist_num(Rest, Num + 1, RoleId, DpsQuaRoleId)
            end;
        {false, RoleId} ->
            case TeamMemCount =:= 2 of
                true ->
                    calc_assist_num(Rest,
                                    Num,
                                    AssistQuaRoleId,
                                    DpsQuaRoleId);
                false ->
                    calc_assist_num(Rest, Num, AssistQuaRoleId, RoleId)
            end
    end.

is_have_assist(TeamRids) ->
    is_have_assist(TeamRids, undef).

is_have_assist([], Result) -> {false, Result};
is_have_assist([Rid | Rest], Result) ->
    case get_sign_up_info(Rid) of
        {ok,
         #qualifying_role{id = AssistRoleId, classes = Classes}}
            when Classes =:= 4 orelse Classes =:= 5 ->
            {true, AssistRoleId};
        {ok, #qualifying_role{id = DpsRoleId}} ->
            is_have_assist(Rest, DpsRoleId);
        _ -> is_have_assist(Rest, Result)
    end.

make_qualifying_team(Roles) ->
    {TeamPoint, TeamRankPoint, TeamRwPoint} =
        calc_team_rank_info(1, Roles),
    RoleIds = [Rid || #qualifying_role{id = Rid} <- Roles],
    #qualifying_team{ids = RoleIds, origin_team = [RoleIds],
                     point = TeamPoint, rank_point = TeamRankPoint,
                     reward_point = TeamRwPoint}.

calc_all_assist_num(RoldIds) ->
    calc_all_assist_num(RoldIds, 0).

calc_all_assist_num([], Num) -> Num;
calc_all_assist_num([RoleId | Rest], Num) ->
    case get_sign_up_info(RoleId) of
        {ok, #qualifying_role{classes = Classes}}
            when Classes =:= 4 orelse Classes =:= 5 ->
            calc_all_assist_num(Rest, Num + 1);
        _ -> calc_all_assist_num(Rest, Num)
    end.

calc_balance(1,
             PreTeamA = #qualifying_team{point = APoint},
             PreTeamB = #qualifying_team{point = BPoint}) ->
    {MaxTeam, MinTeam} = case max(APoint, BPoint) of
                             APoint -> {PreTeamA, PreTeamB};
                             BPoint -> {PreTeamB, PreTeamA}
                         end,
    MaxExchangerList = get_exchanger(MaxTeam, 1),
    MinExchanger = get_exchanger(MinTeam, 2),
    case MaxExchangerList of
        _L when is_list(_L) ->
            do_exchange(MaxTeam,
                        MinTeam,
                        MaxExchangerList,
                        MinExchanger);
        _ ->
            do_try_exchange(MaxTeam,
                            MinTeam,
                            MaxExchangerList,
                            MinExchanger)
    end.

get_best_team_match(TeamMatchList) ->
    PointMap = lists:map(fun calc_point_precent/1,
                         TeamMatchList),
    [{_, MatchTeam} | _] = lists:sort(fun ({E1, _},
                                           {E2, _}) ->
                                              E1 < E2
                                      end,
                                      PointMap),
    MatchTeam.

calc_point_precent({TeamA = #qualifying_team{point =
                                                 PointA},
                    TeamB = #qualifying_team{point = PointB}}) ->
    {abs(1 - PointA / PointB), {TeamA, TeamB}}.

do_exchange(PreTeamA, PreTeamB, MaxExchangerList,
            MinExchanger) ->
    do_exchange(PreTeamA,
                PreTeamB,
                MaxExchangerList,
                MinExchanger,
                []).

do_exchange(PreTeamA, PreTeamB, [], _MinExchanger,
            ExchangePlan) ->
    case ExchangePlan of
        [] -> {PreTeamA, PreTeamB};
        Oth = [_ | _] ->
            get_best_team_match([{PreTeamA, PreTeamB} | Oth])
    end;
do_exchange(PreTeamA, PreTeamB, [MaxExchanger | Rest],
            MinExchanger, ExchangePlan) ->
    case do_try_exchange(PreTeamA,
                         PreTeamB,
                         MaxExchanger,
                         MinExchanger)
        of
        {PreTeamA, PreTeamB} ->
            do_exchange(PreTeamA,
                        PreTeamB,
                        Rest,
                        MinExchanger,
                        ExchangePlan);
        {OtherTeamA, OtherTeamB} ->
            do_exchange(PreTeamA,
                        PreTeamB,
                        Rest,
                        MinExchanger,
                        [{OtherTeamA, OtherTeamB} | ExchangePlan])
    end.

do_try_exchange(PreTeamA = #qualifying_team{origin_team
                                                = MaxOriIds},
                PreTeamB = #qualifying_team{origin_team = MinOriIds},
                MaxExchanger, MinExchanger) ->
    MaxScore = calc_role_qualifying_score(MaxExchanger),
    MinScore = calc_role_qualifying_score(MinExchanger),
    case MaxScore > MinScore of
        true ->
            {SplitStrongRoleIds, AnoStrongRoles} =
                split_to_origin_team(MaxExchanger, MaxOriIds),
            {SplitWeakRoleIds, AnoWeakRoles} =
                split_to_origin_team(MinExchanger, MinOriIds),
            SplitStrongRoles =
                get_sign_up_roles(SplitStrongRoleIds),
            SplitWeakRoles = get_sign_up_roles(SplitWeakRoleIds),
            SplitStrongTeam =
                make_qualifying_team(SplitStrongRoles),
            AnoStrongTeam = make_qualifying_team(AnoStrongRoles),
            SplitWeakTeam = make_qualifying_team(SplitWeakRoles),
            AnoWeakTeam = make_qualifying_team(AnoWeakRoles),
            CbTeamA = combine_teams([SplitStrongTeam, AnoWeakTeam]),
            CbTeamB = combine_teams([SplitWeakTeam, AnoStrongTeam]),
            NewTeamA = recalc_team_point(CbTeamA),
            NewTeamB = recalc_team_point(CbTeamB),
            {NewPointPrecent, _} = calc_point_precent({NewTeamA,
                                                       NewTeamB}),
            {OldPointPrecent, _} = calc_point_precent({PreTeamA,
                                                       PreTeamB}),
            case NewPointPrecent < OldPointPrecent of
                true -> {NewTeamA, NewTeamB};
                false -> {PreTeamA, PreTeamB}
            end;
        false -> {PreTeamA, PreTeamB}
    end.

get_exchanger(#qualifying_team{ids = Ids,
                               origin_team = OrgIds},
              StrongOrWeak) ->
    case length(OrgIds) of
        2 ->
            {LId, _} = lists:partition(fun (Elm) ->
                                               is_list(Elm) andalso
                                                   length(Elm) =:= 1
                                       end,
                                       OrgIds),
            case LId of
                [[RoleId]] -> RoleId;
                _ -> false
            end;
        3 ->
            case StrongOrWeak of
                1 ->
                    lists:reverse(lists:sort(fun sort_team_balance/2, Ids));
                2 ->
                    [RoleId | _] = lists:sort(fun sort_team_balance/2, Ids),
                    RoleId
            end;
        _ -> false
    end.

sort_team_balance(AId, BId) ->
    AScore = calc_role_qualifying_score(AId),
    BScore = calc_role_qualifying_score(BId),
    AScore < BScore.

calc_role_qualifying_score(RoleId) ->
    case get_sign_up_info(RoleId) of
        {ok,
         #qualifying_role{rank_point = RankPoint,
                          point = Point}} ->
            round(Point + RankPoint * 3.0e-3);
        _ -> 0
    end.

recalc_team_point(QTeam = #qualifying_team{ids =
                                               Ids}) ->
    QuaRoles = get_sign_up_roles(Ids),
    Fun = fun (#qualifying_role{rank_point = Rp,
                                point = P}) ->
                  {Rp, P}
          end,
    RPList = lists:map(Fun, QuaRoles),
    RankPointList = [Rp || {Rp, _} <- RPList],
    PointList = [P || {_, P} <- RPList],
    MaxRp = lists:max(RankPointList),
    AvgRp = lists:sum(RankPointList) /
                length(RankPointList),
    RankPoint = MaxRp * 5.0e-1 + AvgRp * 5.0e-1,
    MaxP = lists:max(PointList),
    AvgP = lists:sum(PointList) / length(PointList),
    Point = MaxP * 5.0e-1 + AvgP * 5.0e-1,
    NewPoint = round(10 * (Point + RankPoint * 3.0e-3)),
    logger:debug("重新计算队伍积分:~w",
                 [{NewPoint, Ids}],
                 qualifying_match,
                 1166),
    QTeam#qualifying_team{point = NewPoint}.

