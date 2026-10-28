-file("src/mod/hero/hero.erl", 1).

-module(hero).

-behaviour(gen_fsm).

-export([start_link/1,
         cast/2,
         call/2,
         check_status/1,
         get_team_mem/1,
         push_role/1]).

-export([fight/2, reward/2, box/2, over/2]).

-export([init/1,
         handle_event/3,
         handle_sync_event/4,
         handle_info/3,
         terminate/3,
         code_change/4]).

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

-file("src/mod/hero/hero.erl", 31).

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

-file("src/mod/hero/hero.erl", 32).

-file("inc/hero.hrl", 1).

-record(hero_ready_zone,
        {map_id = 0 :: non_neg_integer(),
         map_pid :: pid() | undefined,
         member_size = 0 :: non_neg_integer(),
         group_id = 0 :: pos_integer(),
         exit_npc}).

-record(hero_zone,
        {id = 0 :: non_neg_integer(),
         pid :: pid() | undefined,
         series = 0,
         flag = 0}).

-record(hero_group,
        {id = 0,
         score = 0,
         num = 0,
         offline_num = 0,
         all_num = 0,
         ave_fc = 0,
         sum_fc = 0}).

-record(hero_group_team,
        {group = 0, num = 0, fight = 0, match = 0}).

-record(hero_series,
        {group = 0,
         num = 0,
         ave_fc = 0,
         sum_fc = 0,
         map_id = 0 :: non_neg_integer(),
         map_pid :: pid() | undefined,
         members = []}).

-record(hero_series_ready,
        {tiger = #hero_series{},
         dragon = #hero_series{},
         series = 0,
         ave_fc = 0,
         num = 0}).

-record(hero_series_data,
        {min = 0, max = 0, series = 0, name = ""}).

-record(hero_role,
        {id = {0, "", 0},
         pid,
         status = 0,
         name = "",
         sex = 0,
         classes = 0,
         lev = 0,
         win = 0,
         win_streak = 0,
         times = 0,
         die = 4,
         rank_point = 0,
         score = 0,
         is_combat = 0,
         last_combat_over_time = 0,
         last_role_id,
         zone_id = 0,
         zone_pid,
         team_status = 0,
         team_lev = 40,
         team_len = 1,
         match = 0,
         exp = 0,
         has_enter = 0,
         looks = [],
         has_mail = 0,
         group = 1,
         box = 0,
         series = 0,
         fc = 0,
         m_time = 0}).

-record(hero_reward_data,
        {min = 0,
         max = 0,
         flag = 0,
         item_list = [],
         exp_mode = 0,
         pet_exp_mode = 0}).

-record(hero_win_data,
        {min = 0,
         max = 0,
         flag = 0,
         item_list = [],
         exp = 0,
         pet_exp = 0}).

-file("src/mod/hero/hero.erl", 33).

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

-file("src/mod/hero/hero.erl", 34).

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

-file("src/mod/hero/hero.erl", 35).

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

-file("src/mod/hero/hero.erl", 36).

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

-file("src/mod/hero/hero.erl", 37).

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

-file("src/mod/hero/hero.erl", 38).

-record(state,
        {id = 0,
         series = 0,
         match_time = 0,
         map_id = 0,
         tiger,
         dragon,
         rank = [],
         map_pid,
         combat_pid = [],
         succ_group = 0,
         ts,
         ids = [],
         timeout,
         m_time = 0,
         start_time = 0,
         ave_fc = 0}).

start_link(Args) ->
    gen_fsm:start_link(hero, [Args], []).

cast(Pid, Event) ->
    gen_fsm:send_all_state_event(Pid, Event).

call(Pid, Event) ->
    try gen_fsm:sync_send_all_state_event(Pid, Event) catch
        _Type:_Reason ->
            logger:debug("Type: ~w  Reason: ~w",
                         [_Type, _Reason],
                         hero,
                         74),
            {error, timeout}
    end.

init([#{id := Id, series := Series}]) ->
    process_flag(trap_exit, true),
    case map_mgr:create(30011) of
        {ok, MapPid, MapId} ->
            Now = date:unixtime(),
            Timeout = 55 * 60,
            erlang:send_after(13 * 1000, self(), match),
            Tiger = #hero_group{id = 1},
            Dragon = #hero_group{id = 2},
            State = #state{id = Id, match_time = Now + 5,
                           series = Series, m_time = Now + 55 * 60,
                           map_id = MapId, map_pid = MapPid, tiger = Tiger,
                           dragon = Dragon, ts = date:now2(),
                           timeout = Timeout * 1000, start_time = Now},
            erlang:send_after(util:rand(3000, 6000),
                              self(),
                              start_match),
            put(win, 0),
            put({group_team, 1}, #hero_group_team{group = 1}),
            put({group_team, 2}, #hero_group_team{group = 2}),
            {ok, fight, State};
        _False ->
            logger:error("创建战场地图失败[Fid:~w][Err:~w]",
                         [Id, _False],
                         hero,
                         98),
            {stop, normal, #state{}}
    end.

handle_event({gain_box, RoleId}, StateName, State) ->
    case hero_mgr:lookup(RoleId) of
        R = #hero_role{box = Box} ->
            hero_mgr:update_data(R#hero_role{box = Box + 1});
        _ -> ignore
    end,
    continue(StateName, State);
handle_event({push_role, #{pid := Pid, id := RoleId}},
             StateName, State) ->
    case hero_mgr:lookup(RoleId) of
        R = #hero_role{} -> push_role(R#hero_role{pid = Pid});
        _ -> ignore
    end,
    continue(StateName, State);
handle_event({push_rank, #{pid := Pid}}, StateName,
             State = #state{rank = RankList}) ->
    role:pack_send(Pid, 16305, {RankList}),
    continue(StateName, State);
handle_event({leave, #{id := RoleId, pid := Pid}},
             StateName, State) ->
    case hero_mgr:lookup(RoleId) of
        #hero_role{} ->
            role:apply(async,
                       Pid,
                       {hero_role, apply_leave_zone, [self()]});
        _ -> ignore
    end,
    continue(StateName, State);
handle_event({leave_succ, RoleId}, StateName,
             State = #state{tiger =
                                Tiger = #hero_group{num = TigerNum},
                            dragon = Dragon = #hero_group{num = DragonNum}}) ->
    NewState = case hero_mgr:lookup(RoleId) of
                   HeroRole = #hero_role{group = 1} ->
                       hero_mgr:update_data(HeroRole#hero_role{status = 2}),
                       NewTiger = Tiger#hero_group{num = max(TigerNum - 1, 0)},
                       State#state{tiger = NewTiger};
                   HeroRole = #hero_role{} ->
                       hero_mgr:update_data(HeroRole#hero_role{status = 2}),
                       NewDragon = Dragon#hero_group{num =
                                                         max(DragonNum - 1, 0)},
                       State#state{dragon = NewDragon};
                   _ -> State
               end,
    push_zone(NewState),
    continue(StateName, NewState);
handle_event({update_team_status,
              TeamLev,
              TeamLen,
              ChangeList},
             StateName, State) ->
    Fun = fun ({Flag, RoleId}) ->
                  case hero_mgr:lookup(RoleId) of
                      Tc = #hero_role{name = _RoleName, lev = RoleLev} ->
                          NewTc = case Flag of
                                      leader ->
                                          Tc#hero_role{team_status = 1,
                                                       team_lev = TeamLev,
                                                       team_len = TeamLen,
                                                       match = util:rand(1, 3)};
                                      away ->
                                          Tc#hero_role{team_status = 3,
                                                       team_lev = RoleLev,
                                                       team_len = 1, match = 0};
                                      none ->
                                          Tc#hero_role{team_status = 0,
                                                       team_lev = RoleLev,
                                                       team_len = 1, match = 0};
                                      follow ->
                                          Tc#hero_role{team_status = 2,
                                                       team_lev = RoleLev,
                                                       team_len = 1, match = 0};
                                      _ -> Tc
                                  end,
                          push_role(NewTc),
                          hero_mgr:update_data(NewTc);
                      _ -> skip
                  end;
              (_) -> skip
          end,
    lists:foreach(Fun, ChangeList),
    continue(StateName, State);
handle_event({combat_fail, CombatPid, LoseMate},
             StateName,
             State = #state{combat_pid = CombatPidList}) ->
    Now = date:unixtime(),
    RandTime = util:rand(0, 1),
    LoseNum = length(LoseMate),
    State1 = deal_combat_result(fail,
                                LoseMate,
                                RandTime,
                                Now,
                                LoseNum,
                                0,
                                State),
    NewCombatPidList = lists:delete(CombatPid,
                                    CombatPidList),
    NewState = State1#state{combat_pid = NewCombatPidList},
    push_zone(NewState),
    continue(StateName, NewState);
handle_event({combat_over,
              CombatPid,
              WinMate,
              LoseMate},
             StateName = fight,
             State = #state{combat_pid = CombatPidList}) ->
    Now = date:unixtime(),
    RandTime1 = util:rand(0, 1),
    RandTime2 = util:rand(0, 1),
    WinNum = length(WinMate),
    LoseNum = length(LoseMate),
    State1 = deal_combat_result(win,
                                WinMate,
                                RandTime1,
                                Now,
                                WinNum,
                                LoseNum,
                                State),
    State2 = deal_combat_result(lose,
                                LoseMate,
                                RandTime2,
                                Now,
                                LoseNum,
                                WinNum,
                                State1),
    NewCombatPidList = lists:delete(CombatPid,
                                    CombatPidList),
    NewState = State2#state{combat_pid = NewCombatPidList},
    push_zone(NewState),
    continue(StateName, NewState);
handle_event({combat_over,
              CombatPid,
              WinMate,
              LoseMate},
             StateName,
             State = #state{combat_pid = CombatPidList}) ->
    Now = date:unixtime(),
    RandTime1 = util:rand(0, 1),
    RandTime2 = util:rand(0, 1),
    WinNum = length(WinMate),
    LoseNum = length(LoseMate),
    State1 = deal_combat_result(fail,
                                WinMate,
                                RandTime1,
                                Now,
                                WinNum,
                                LoseNum,
                                State),
    State2 = deal_combat_result(fail,
                                LoseMate,
                                RandTime2,
                                Now,
                                LoseNum,
                                WinNum,
                                State1),
    NewCombatPidList = lists:delete(CombatPid,
                                    CombatPidList),
    NewState = State2#state{combat_pid = NewCombatPidList},
    push_zone(NewState),
    continue(StateName, NewState);
handle_event({enter, Pid, Group}, StateName,
             State = #state{map_id = MapId}) ->
    role:apply(async,
               Pid,
               {hero_role,
                apply_enter_zone,
                [#{map_id => MapId, zone_pid => self(),
                   group => Group}]}),
    continue(StateName, State);
handle_event({enter_zone, RoleId}, StateName,
             State = #state{id = ZoneId, ids = Ids, series = Series,
                            tiger =
                                Tiger = #hero_group{num = TigerNum,
                                                    all_num = TAllNum,
                                                    sum_fc = TSumFc},
                            dragon =
                                Dragon = #hero_group{num = DragonNum,
                                                     all_num = DAllNum,
                                                     sum_fc = DSumFc}}) ->
    case lists:member(RoleId, Ids) of
        false ->
            NewState = case hero_mgr:lookup(RoleId) of
                           HeroRole = #hero_role{name = _Name,
                                                 group = _Group = 1, fc = Fc} ->
                               logger:debug("武道进入正式区成功~ts, series:~w, group:~w",
                                            [_Name, Series, _Group],
                                            hero,
                                            243),
                               NewR = HeroRole#hero_role{zone_id = ZoneId,
                                                         zone_pid = self(),
                                                         series = Series},
                               push_role(NewR),
                               hero_mgr:update_data(NewR),
                               NewTSumFc = TSumFc + Fc,
                               NewTAllNum = TAllNum + 1,
                               NewTAveFc = NewTSumFc / NewTAllNum,
                               NewAveFc = (NewTSumFc + DSumFc) /
                                              (NewTAllNum + DAllNum),
                               NewTiger = Tiger#hero_group{num = TigerNum + 1,
                                                           all_num = NewTAllNum,
                                                           ave_fc = NewTAveFc,
                                                           sum_fc = NewTSumFc},
                               State#state{tiger = NewTiger, ave_fc = NewAveFc};
                           HeroRole = #hero_role{name = _Name, group = _Group,
                                                 fc = Fc} ->
                               logger:debug("武道进入正式区成功~ts, series:~w, group:~w",
                                            [_Name, Series, _Group],
                                            hero,
                                            254),
                               NewR = HeroRole#hero_role{zone_id = ZoneId,
                                                         zone_pid = self(),
                                                         series = Series},
                               push_role(NewR),
                               hero_mgr:update_data(NewR),
                               NewDSumFc = DSumFc + Fc,
                               NewDAllNum = DAllNum + 1,
                               NewDAveFc = NewDSumFc / NewDAllNum,
                               NewAveFc = (TSumFc + NewDSumFc) /
                                              (TAllNum + NewDAllNum),
                               NewDragon = Dragon#hero_group{num =
                                                                 DragonNum + 1,
                                                             all_num =
                                                                 NewDAllNum,
                                                             ave_fc = NewDAveFc,
                                                             sum_fc =
                                                                 NewDSumFc},
                               State#state{dragon = NewDragon,
                                           ave_fc = NewAveFc};
                           _ -> State
                       end,
            push_zone(NewState),
            continue(StateName,
                     NewState#state{ids = [RoleId | Ids]});
        _ -> continue(StateName, State)
    end;
handle_event({logout, RoleId}, StateName,
             State = #state{tiger =
                                Tiger = #hero_group{num = TigerNum},
                            dragon = Dragon = #hero_group{num = DragonNum}}) ->
    NewState = case hero_mgr:lookup(RoleId) of
                   HeroRole = #hero_role{group = 1} ->
                       hero_mgr:update_data(HeroRole#hero_role{status = 2}),
                       NewTiger = Tiger#hero_group{num = max(TigerNum - 1, 0)},
                       State#state{tiger = NewTiger};
                   HeroRole = #hero_role{} ->
                       hero_mgr:update_data(HeroRole#hero_role{status = 2}),
                       NewDragon = Dragon#hero_group{num =
                                                         max(DragonNum - 1, 0)},
                       State#state{dragon = NewDragon};
                   _ -> State
               end,
    push_zone(NewState),
    continue(StateName, NewState);
handle_event(end_fight, fight, State) ->
    fight(timeout, State);
handle_event(end_fight, StateName, State) ->
    push_state(StateName, State),
    continue(StateName, State);
handle_event(end_reward, reward, State) ->
    reward(timeout, State);
handle_event(end_reward, StateName, State) ->
    push_state(StateName, State),
    continue(StateName, State);
handle_event(over, box, State) -> box(timeout, State);
handle_event(over, StateName, State) ->
    push_state(StateName, State),
    continue(StateName, State);
handle_event(stop, over, State) -> over(timeout, State);
handle_event(stop, StateName, State) ->
    push_state(StateName, State),
    continue(StateName, State);
handle_event({push, #{pid := Pid}}, StateName, State) ->
    push_state(Pid, StateName, State),
    continue(StateName, State);
handle_event({push_zone, #{pid := Pid}}, StateName,
             State) ->
    push_zone(Pid, State),
    continue(StateName, State);
handle_event({sign,
              #{id := RoleId, pid := Pid, group := Group,
                team_lev := TeamLev, team_len := TeamLen,
                series := Series}},
             StateName = fight, State = #state{map_id = MapId}) ->
    case hero_mgr:lookup(RoleId) of
        #hero_role{} ->
            notice:npc_talk({pid, Pid},
                            20064,
                            lang:get("你已经自己退出，不能再参加了"));
        _ ->
            role:apply(async,
                       Pid,
                       {hero_role,
                        apply_enter_ready,
                        [#{map_id => MapId, group => Group, team_lev => TeamLev,
                           team_len => TeamLen, series => Series,
                           hero_pid => self(), state_name => StateName}]})
    end,
    continue(StateName, State);
handle_event({sign_succ,
              R = #hero_role{id = RoleId, name = _Name, group = 1,
                             fc = Fc}},
             StateName,
             State = #state{tiger =
                                Data = #hero_group{num = Num, all_num = AllNum,
                                                   sum_fc = SumFc},
                            dragon =
                                #hero_group{all_num = OAllNum, sum_fc = OSumFc},
                            ids = Ids}) ->
    case lists:member(RoleId, Ids) of
        true -> continue(StateName, State);
        _ ->
            NewAllNum = AllNum + 1,
            NewSumFc = SumFc + Fc,
            NewAveFc = NewSumFc / NewAllNum,
            NewAllAveFc = (NewSumFc + OSumFc) /
                              (NewAllNum + OAllNum),
            NewData = Data#hero_group{num = Num + 1,
                                      all_num = NewAllNum, ave_fc = NewAveFc,
                                      sum_fc = NewSumFc},
            NewState = State#state{tiger = NewData,
                                   ids = [RoleId | Ids], ave_fc = NewAllAveFc},
            push_zone(NewState),
            Now = date:unixtime(),
            hero_mgr:update_data(R#hero_role{m_time = Now}),
            continue(StateName, NewState)
    end;
handle_event({sign_succ,
              R = #hero_role{id = RoleId, name = _Name, fc = Fc}},
             StateName,
             State = #state{dragon =
                                Data = #hero_group{num = Num, all_num = AllNum,
                                                   sum_fc = SumFc},
                            tiger =
                                #hero_group{all_num = OAllNum, sum_fc = OSumFc},
                            ids = Ids}) ->
    case lists:member(RoleId, Ids) of
        true -> continue(StateName, State);
        _ ->
            NewAllNum = AllNum + 1,
            NewSumFc = SumFc + Fc,
            NewAveFc = NewSumFc / NewAllNum,
            NewAllAveFc = (NewSumFc + OSumFc) /
                              (NewAllNum + OAllNum),
            NewData = Data#hero_group{num = Num + 1,
                                      all_num = NewAllNum, ave_fc = NewAveFc,
                                      sum_fc = NewSumFc},
            NewState = State#state{dragon = NewData,
                                   ids = [RoleId | Ids], ave_fc = NewAllAveFc},
            push_zone(NewState),
            Now = date:unixtime(),
            hero_mgr:update_data(R#hero_role{m_time = Now}),
            continue(StateName, NewState)
    end;
handle_event({gm_update_role,
              {RoleId, Score, Win, WinStreak}},
             StateName, State) ->
    case hero_mgr:lookup(RoleId) of
        R = #hero_role{} ->
            NR = R#hero_role{score = Score, win = Win,
                             win_streak = WinStreak},
            NState = update_rank(NR, State),
            hero_mgr:update_data(NR),
            push_role(NR),
            continue(StateName, NState);
        _ -> continue(StateName, State)
    end;
handle_event(_Event, StateName, State) ->
    continue(StateName, State).

handle_sync_event({check_box, RoleId}, _From,
                  StateName = box, State) ->
    Reply = case hero_mgr:lookup(RoleId) of
                #hero_role{box = 0} -> {ok, true};
                #hero_role{} -> {false, lang:get("你已经采集过了")};
                _ -> {false, lang:get("没有找到自己信息")}
            end,
    continue(StateName, Reply, State);
handle_sync_event({check_box, _RoleId}, _From,
                  StateName, State) ->
    continue(StateName, {false, lang:get("现在不能采集")}, State);
handle_sync_event({get_ready_num, #{series := _Series}},
                  _From, StateName = fight,
                  State = #state{tiger = #hero_group{num = 0}}) ->
    continue(StateName,
             {false, lang:get("胜负已定了，不用在参加了")},
             State);
handle_sync_event({get_ready_num, #{series := _Series}},
                  _From, StateName = fight,
                  State = #state{dragon = #hero_group{num = 0}}) ->
    continue(StateName,
             {false, lang:get("胜负已定了，不用在参加了")},
             State);
handle_sync_event({get_ready_num, #{series := Series}},
                  _From, StateName = fight,
                  State = #state{series = Series1})
    when Series =/= Series1 ->
    continue(StateName, {false, lang:get("分组不对")}, State);
handle_sync_event({get_ready_num, #{series := _Series}},
                  _From, StateName = fight,
                  State = #state{tiger = #hero_group{all_num = TNum},
                                 dragon = #hero_group{all_num = DNum}})
    when TNum > DNum ->
    continue(StateName, {ok, 2}, State);
handle_sync_event({get_ready_num, #{series := _Series}},
                  _From, StateName = fight,
                  State = #state{tiger = #hero_group{all_num = TNum},
                                 dragon = #hero_group{all_num = DNum}})
    when TNum < DNum ->
    continue(StateName, {ok, 1}, State);
handle_sync_event({get_ready_num,
                   #{series := _Series, fc := Fc}},
                  _From, StateName = fight,
                  State = #state{tiger =
                                     #hero_group{all_num = Num,
                                                 ave_fc = TAveFc},
                                 dragon =
                                     #hero_group{all_num = Num,
                                                 ave_fc = DAveFc},
                                 ave_fc = AveFc})
    when Fc > AveFc ->
    Reply = case util:rand(0, 1) of
                0 ->
                    case TAveFc > DAveFc of
                        true -> {ok, 2};
                        _ -> {ok, 1}
                    end;
                _ ->
                    case DAveFc > TAveFc of
                        true -> {ok, 1};
                        _ -> {ok, 2}
                    end
            end,
    continue(StateName, Reply, State);
handle_sync_event({get_ready_num, #{series := _Series}},
                  _From, StateName = fight,
                  State = #state{tiger =
                                     #hero_group{all_num = Num,
                                                 ave_fc = TAveFc},
                                 dragon =
                                     #hero_group{all_num = Num,
                                                 ave_fc = DAveFc}}) ->
    Reply = case util:rand(0, 1) of
                0 ->
                    case TAveFc > DAveFc of
                        true -> {ok, 1};
                        _ -> {ok, 2}
                    end;
                _ ->
                    case DAveFc > TAveFc of
                        true -> {ok, 2};
                        _ -> {ok, 1}
                    end
            end,
    continue(StateName, Reply, State);
handle_sync_event({get_ready_num, #{series := _Series}},
                  _From, StateName = fight, State) ->
    continue(StateName, {ok, 1}, State);
handle_sync_event({get_ready_num, #{series := _Series}},
                  _From, StateName, State) ->
    continue(StateName,
             {false, lang:get("活动到了奖励阶段，不能参加了")},
             State);
handle_sync_event(_Event, _From, StateName, State) ->
    Reply = ok,
    continue(StateName, Reply, State).

handle_info(start_match, StateName = fight,
            State = #state{map_id = MapId}) ->
    Msg = notice:format(lang:get("~ts正式开始"),
                        [{string_2, 1, lang:get("荣耀战场")}]),
    notice:cast({map, MapId}, 1, Msg),
    NewState = match(State),
    erlang:send_after(5000, self(), match),
    continue(StateName, NewState#state{});
handle_info(match, StateName = fight, State) ->
    case match(State) of
        NState = #state{tiger = #hero_group{num = 0}} ->
            fight(timeout, NState);
        NState = #state{dragon = #hero_group{num = 0}} ->
            fight(timeout, NState);
        NewState ->
            erlang:send_after(5000, self(), match),
            continue(StateName, NewState)
    end;
handle_info(_Info, StateName, State) ->
    continue(StateName, State).

terminate(_Reason, _StateName,
          _State = #state{id = Id, map_pid = MapPid,
                          map_id = MapId, ids = Ids}) ->
    logger:info("荣耀战场结束：~w", [Id], hero, 483),
    List = get_roles(Ids, []),
    [role:apply(async,
                Pid,
                {hero_role, apply_leave_zone, [undefined]})
     || #hero_role{pid = Pid} <- List],
    hero_mgr:cast({close_zone, Id}),
    unit_mgr:remove_map_all(MapId),
    map:stop(MapPid),
    ok.

code_change(_OldVsn, StateName, State, _Extra) ->
    {ok, StateName, State}.

fight(timeout,
      State = #state{combat_pid = CombatList, series = Series,
                     tiger = Tiger, dragon = Dragon, ave_fc = AveFc}) ->
    Now = date:unixtime(),
    lists:foreach(fun (CombatPid) when is_pid(CombatPid) ->
                          CombatPid ! stop;
                      (_) -> skip
                  end,
                  CombatList),
    {SuccGroup, FailGroup} = get_suncc_group(Tiger,
                                             Dragon,
                                             State),
    List = ets:tab2list(hero_role),
    NList = [R
             || R = #hero_role{series = RSeries} <- List,
                RSeries == Series],
    {NewList, NState = #state{rank = RankList}} =
        update_score(NList, State, SuccGroup, FailGroup, []),
    HonorRoleList = honor_rank(RankList, 1, []),
    logger:info("武道大会称号：~w,~w",
                [Series, HonorRoleList],
                hero,
                509),
    logger:info("武道大会胜负：平台:{~ts, ~w}; 分组:~w; 平均战力:~w; "
                "胜利:~w,失败:~w,T:~w,D:~w",
                [env:get(platform),
                 env:get(zone_id),
                 Series,
                 AveFc,
                 SuccGroup,
                 FailGroup,
                 Tiger,
                 Dragon],
                hero,
                510),
    honor_mgr:replace(list_to_atom(lists:concat(["hero_honor_",
                                                 Series])),
                      HonorRoleList,
                      0),
    push_reward(NewList, NState, SuccGroup, FailGroup),
    NewState = NState#state{ts = date:now2(),
                            m_time = Now + 60, succ_group = SuccGroup,
                            timeout = 60 * 1000},
    RankRc = to_rank_rc(lists:reverse(RankList), 1, []),
    case get_rank_type(Series) of
        0 -> ignore;
        RankType ->
            rank_zone:cast(RankType,
                           {replace, RankType, RankRc, #{reward => 1}})
    end,
    GroupName = hero_mgr:group_name(SuccGroup),
    Msg =
        notice:format(lang:get("日月争辉，~ts更胜一筹，取得了~ts的胜利！{face_1, 18}"),
                      [{string_2, 1, GroupName},
                       {string_2, 1, lang:get("荣耀战场")}]),
    notice:cast(all, 5, Msg),
    push_state(reward, NState),
    push_team(State,
              [#hero_group_team{group = 1},
               #hero_group_team{group = 2}]),
    continue(reward, NewState);
fight(_Event, State) -> continue(fight, State).

reward(timeout, State = #state{}) ->
    Now = date:unixtime(),
    create_box(State),
    NewState = State#state{ts = date:now2(),
                           m_time = Now + 5 * 60, timeout = 5 * 60 * 1000},
    notice:cast(all,
                5,
                notice:format(lang:get("胜利的光芒降临~ts，地上出现了一堆金灿灿的宝箱！"),
                              [{string_2, 1, lang:get("荣耀战场")}])),
    push_state(box, State),
    continue(box, NewState);
reward(_Event, State) -> continue(reward, State).

box(timeout, State = #state{id = Id, ids = Ids}) ->
    Now = date:unixtime(),
    logger:info("宝箱时间结束：~w", [Id], hero, 545),
    push_state(idle, State),
    NewState = State#state{ts = date:now2(),
                           m_time = Now + 10, timeout = 10 * 1000},
    List = get_roles(Ids, []),
    [role:apply(async,
                Pid,
                {hero_role, apply_leave_zone, [self()]})
     || #hero_role{pid = Pid} <- List],
    continue(over, NewState);
box(_Event, State) -> continue(box, State).

over(timeout, State) -> {stop, normal, State};
over(_Event, State) -> continue(over, State).

create_box(#state{map_id = MapId,
                  tiger = #hero_group{num = Num}, succ_group = 1}) ->
    AllNum = max(Num + 10, 10),
    logger:info("宝箱数量：~w", [AllNum], hero, 566),
    case unit_mgr:fetch_ids(AllNum) of
        {ok, Ids} -> do_create_box(Ids, MapId);
        _ -> ignore
    end;
create_box(#state{map_id = MapId,
                  dragon = #hero_group{num = Num}}) ->
    AllNum = max(Num + 10, 10),
    logger:info("宝箱数量：~w", [AllNum], hero, 575),
    case unit_mgr:fetch_ids(AllNum) of
        {ok, Ids} -> do_create_box(Ids, MapId);
        _ -> ignore
    end.

do_create_box([], _) -> ok;
do_create_box([Id | T], MapId) ->
    case map:rand_pos(30011) of
        {PosX, PosY} ->
            unit_mgr:create({24, Id}, 79560, {MapId, PosX, PosY});
        _ -> false
    end,
    do_create_box(T, MapId).

get_suncc_group(#hero_group{num = 0}, _, _State) ->
    {2, 1};
get_suncc_group(_, #hero_group{num = 0}, _) -> {1, 2};
get_suncc_group(#hero_group{score = TScore},
                #hero_group{score = DScore}, _)
    when TScore > DScore ->
    {1, 2};
get_suncc_group(#hero_group{score = TScore},
                #hero_group{score = DScore}, _)
    when TScore < DScore ->
    {2, 1};
get_suncc_group(#hero_group{score = Score, num = TNum},
                #hero_group{score = Score, num = DNum}, _)
    when TNum > DNum ->
    {1, 2};
get_suncc_group(#hero_group{score = Score, num = TNum},
                #hero_group{score = Score, num = DNum}, _)
    when TNum < DNum ->
    {2, 1};
get_suncc_group(#hero_group{score = Score, num = Num,
                            offline_num = TOffline},
                #hero_group{score = Score, num = Num,
                            offline_num = DOffline},
                _)
    when TOffline > DOffline ->
    {1, 2};
get_suncc_group(#hero_group{score = Score, num = Num,
                            offline_num = TOffline},
                #hero_group{score = Score, num = Num,
                            offline_num = DOffline},
                _)
    when TOffline < DOffline ->
    {2, 1};
get_suncc_group(#hero_group{score = Score, num = Num,
                            offline_num = Offline},
                #hero_group{score = Score, num = Num,
                            offline_num = Offline},
                #state{rank = [#hero_role{group = 1} | _]}) ->
    {1, 2};
get_suncc_group(_, _, _) -> {2, 1}.

push_reward([], _State, _SuccGroup, _FailGroup) -> ok;
push_reward([R = #hero_role{status = 1, pid = Pid,
                            group = SuccGroup}
             | T],
            State = #state{series = Series, tiger = Tiger,
                           dragon = Dragon, rank = RankList},
            SuccGroup, FailGroup) ->
    role:pack_send(Pid,
                   16306,
                   {Series,
                    SuccGroup,
                    FailGroup,
                    [Tiger, Dragon],
                    [R],
                    RankList}),
    role:apply(async, Pid, {hero_role, async_over, [1, R]}),
    push_reward(T, State, SuccGroup, FailGroup);
push_reward([R = #hero_role{status = 1, pid = Pid,
                            group = FailGroup}
             | T],
            State = #state{series = Series, tiger = Tiger,
                           dragon = Dragon, rank = RankList},
            SuccGroup, FailGroup) ->
    role:pack_send(Pid,
                   16306,
                   {Series,
                    SuccGroup,
                    FailGroup,
                    [Tiger, Dragon],
                    [R],
                    RankList}),
    role:apply(async, Pid, {hero_role, async_over, [0, R]}),
    push_reward(T, State, SuccGroup, FailGroup);
push_reward([R = #hero_role{status = 3, pid = Pid,
                            group = SuccGroup}
             | T],
            State, SuccGroup, FailGroup) ->
    role:apply(async, Pid, {hero_role, send_mail, [1, R]}),
    push_reward(T, State, SuccGroup, FailGroup);
push_reward([R = #hero_role{status = 3, pid = Pid,
                            group = FailGroup}
             | T],
            State, SuccGroup, FailGroup) ->
    role:apply(async, Pid, {hero_role, send_mail, [0, R]}),
    role:apply(async, Pid, {hero_role, leave_zone, []}),
    push_reward(T, State, SuccGroup, FailGroup);
push_reward([#hero_role{group = FailGroup, pid = Pid}
             | T],
            State, SuccGroup, FailGroup) ->
    role:apply(async, Pid, {hero_role, leave_zone, []}),
    push_reward(T, State, SuccGroup, FailGroup);
push_reward([_ | T], State, SuccGroup, FailGroup) ->
    push_reward(T, State, SuccGroup, FailGroup).

match(State = #state{combat_pid = CombatList,
                     series = _Series, ids = Ids}) ->
    L = get_roles(Ids, []),
    L1 = lists:keysort(#hero_role.match, L),
    L2 = lists:reverse(L1),
    {Tiger, Dragon, MatchPair} = do_match(L2,
                                          L2,
                                          #hero_group_team{group = 1},
                                          #hero_group_team{group = 2},
                                          []),
    put({group_team, 1}, Tiger),
    put({group_team, 2}, Dragon),
    push_team(State, [Tiger, Dragon]),
    Referee = self(),
    {CombatList1, UpdateIds, ResetIds} = combat(MatchPair,
                                                Referee,
                                                [],
                                                [],
                                                []),
    update_combat(L2, UpdateIds, ResetIds),
    State#state{combat_pid = CombatList ++ CombatList1}.

do_match([], _, Tiger, Dragon, MatchPair) ->
    {Tiger, Dragon, MatchPair};
do_match([ARole = #hero_role{} | T], Other, Tiger,
         Dragon, MatchPair) ->
    case match_role(ARole, Other) of
        {true, BRole = #hero_role{name = _OtherName}} ->
            {NewTiger, NewDragon} = match_group(combat_start,
                                                ARole,
                                                Tiger,
                                                Dragon),
            do_match(T -- [ARole, BRole],
                     Other -- [ARole, BRole],
                     NewTiger,
                     NewDragon,
                     [{ARole, BRole} | MatchPair]);
        {false, Reason} ->
            {NewTiger, NewDragon} = match_group(Reason,
                                                ARole,
                                                Tiger,
                                                Dragon),
            do_match(T,
                     Other -- [ARole],
                     NewTiger,
                     NewDragon,
                     MatchPair)
    end.

match_role(_ARole, []) -> {false, null};
match_role(ARole, [ARole | T]) -> match_role(ARole, T);
match_role(#hero_role{is_combat = 1, name = _Name},
           _) ->
    {false, combat};
match_role(#hero_role{status = 2, name = _Name}, _) ->
    {false, leave};
match_role(#hero_role{die = Die, name = _Name}, _)
    when Die =< 0 ->
    {false, die};
match_role(#hero_role{status = 3, name = _Name}, _) ->
    {false, offline};
match_role(#hero_role{team_status = 2, name = _Name},
           _) ->
    {false, follow};
match_role(#hero_role{team_status = 3, name = _Name},
           _) ->
    {false, away};
match_role(#hero_role{match = Match, name = _Name}, _)
    when Match =< 6 ->
    {false, six};
match_role(ARole,
           [#hero_role{is_combat = 1, name = _Name} | T]) ->
    match_role(ARole, T);
match_role(ARole,
           [#hero_role{die = Die, name = _Name} | T])
    when Die =< 0 ->
    match_role(ARole, T);
match_role(ARole,
           [#hero_role{status = 2, name = _Name} | T]) ->
    match_role(ARole, T);
match_role(ARole,
           [#hero_role{status = 3, name = _Name} | T]) ->
    match_role(ARole, T);
match_role(ARole,
           [#hero_role{team_status = 2, name = _Name} | T]) ->
    match_role(ARole, T);
match_role(ARole,
           [#hero_role{team_status = 3, name = _Name} | T]) ->
    match_role(ARole, T);
match_role(ARole,
           [#hero_role{match = Match, name = _Name} | T])
    when Match =< 6 ->
    match_role(ARole, T);
match_role(ARole = #hero_role{id = Aid,
                              last_role_id = Bid, match = Match, name = _Name1},
           [#hero_role{id = Bid, last_role_id = Aid, name = _Name2}
            | T])
    when Match =< 21 ->
    match_role(ARole, T);
match_role(ARole = #hero_role{group = Group,
                              name = _Name},
           [#hero_role{group = Group} | T]) ->
    match_role(ARole, T);
match_role(ARole = #hero_role{match = Match,
                              name = AName},
           [BRole = #hero_role{name = BName} | T]) ->
    case {get_info(ARole), get_info(BRole)} of
        {{ALev, ALen}, {BLev, BLen}} ->
            {LevRange, LenRange} = case Match of
                                       0 -> {0, 1};
                                       1 -> {0, 2};
                                       2 -> {0, 4};
                                       3 -> {1, 4};
                                       4 -> {1, 4};
                                       5 -> {2, 4};
                                       6 -> {3, 4};
                                       7 -> {4, 4};
                                       8 -> {5, 4};
                                       9 -> {10, 4};
                                       _ -> {100, 10}
                                   end,
            MinLev = ALev - LevRange,
            MaxLev = ALev + LevRange,
            MinLen = ALen - LenRange,
            MaxLen = ALen + LenRange,
            case BLev >= MinLev andalso
                     BLev =< MaxLev andalso
                         BLen >= MinLen andalso BLen =< MaxLen
                of
                true -> {true, BRole};
                false ->
                    case Match > 10 of
                        true ->
                            logger:info("[~ts]匹配大于10次也无法匹配到[~ts][~w][~w][~w][~w]~w",
                                        [AName,
                                         BName,
                                         MinLev,
                                         MaxLev,
                                         MinLen,
                                         MaxLen,
                                         {ALev, BLev, ALen, BLen}],
                                        hero,
                                        778);
                        _ -> skip
                    end,
                    match_role(ARole, T)
            end;
        _Err ->
            logger:error("无法获取[~ts]和[~ts]对应状态,原因:~w",
                         [AName, BName, _Err],
                         hero,
                         784),
            match_role(ARole, T)
    end.

get_info(#hero_role{team_status = 3, lev = Lev}) ->
    {Lev, 1};
get_info(#hero_role{team_status = 0, lev = Lev}) ->
    {Lev, 1};
get_info(#hero_role{team_status = 1, team_lev = TeamLev,
                    team_len = TeamLen}) ->
    {TeamLev, TeamLen};
get_info(_Err) ->
    logger:error("无法获取个人信息:~w", [_Err], hero, 796),
    false.

update_combat([], _, _) -> ok;
update_combat([Tc = #hero_role{id = RoleId, status = 1,
                               is_combat = 0, match = Match}
               | T],
              IdList, ResetIds) ->
    NewTc = case lists:keyfind(RoleId, 2, IdList) of
                {LastRoleId, _} ->
                    Tc#hero_role{is_combat = 1, match = 0,
                                 last_role_id = LastRoleId};
                false ->
                    case lists:member(RoleId, ResetIds) of
                        true -> Tc#hero_role{match = 0};
                        _ -> Tc#hero_role{match = Match + 1}
                    end
            end,
    hero_mgr:update_data(NewTc),
    push_role(NewTc),
    update_combat(T, IdList, ResetIds);
update_combat([_ | T], IdList, ResetIds) ->
    update_combat(T, IdList, ResetIds).

combat([], _, CombatPids, UpdateIds, ResetIds) ->
    {CombatPids, UpdateIds, ResetIds};
combat([{A = #hero_role{name = AName},
         B = #hero_role{name = BName}}
        | T],
       Referee, CombatPids, UpdateIds, ResetIds) ->
    case do_combat(A, B, Referee, UpdateIds) of
        {true, CombatPid, AddUpdateIds} ->
            combat(T,
                   Referee,
                   [CombatPid | CombatPids],
                   AddUpdateIds ++ UpdateIds,
                   ResetIds);
        {false, AddResetIds} ->
            logger:error("[~ts]和[~ts]匹配却发起战斗失败",
                         [AName, BName],
                         hero,
                         829),
            combat(T,
                   Referee,
                   CombatPids,
                   UpdateIds,
                   AddResetIds ++ ResetIds)
    end.

do_combat(#hero_role{id = Aid, pid = APid, name = AName,
                     group = GroupA},
          #hero_role{id = Bid, pid = BPid, name = BName,
                     group = GroupB},
          Referee, UpdateIds) ->
    ObserverArgs = {observer_args,
                    [{0, GroupA}, {1, GroupB}]},
    Args = #combat_start_args{common_referee = Referee,
                              ext_args = [ObserverArgs]},
    case get_mem(APid, UpdateIds) of
        {true, ATeamPid, ATeam, IdList1, FailNames1} ->
            case get_mem(BPid, UpdateIds ++ IdList1) of
                {true, BTeamPid, BTeam, IdList2, FailNames2} ->
                    case combat_mgr:start_combat(107, ATeam, BTeam, Args) of
                        {ok, CombatPid} ->
                            NewIdList1 = [{Bid, Rid} || Rid <- IdList1],
                            NewIdList2 = [{Aid, Rid} || Rid <- IdList2],
                            combat_fail(ATeamPid, FailNames1),
                            combat_fail(BTeamPid, FailNames2),
                            {true, CombatPid, NewIdList1 ++ NewIdList2};
                        {false, _Reason} ->
                            logger:error("[~ts]和[~ts]发起战斗失败[~w]",
                                         [AName, BName, _Reason],
                                         hero,
                                         860),
                            {false, [Aid, Bid]}
                    end;
                false -> {false, [Bid]}
            end;
        false -> {false, [Aid]}
    end.

combat_fail(TeamPid, FailNames = [_ | _])
    when is_pid(TeamPid) ->
    NameArgs = string:join(FailNames, "、"),
    Msg = notice:format(lang:get("~ts不在活动中，请退出后重新进入活动"),
                        [{string_2, 2, NameArgs}]),
    team:notice_up(TeamPid, Msg);
combat_fail(_, _) -> ok.

check_id([], _UpdateIds, IdList) -> {true, IdList};
check_id([{leader, RoleId, _} | T], UpdateIds,
         IdList) ->
    case lists:keymember(RoleId, 2, UpdateIds) of
        false -> check_id(T, UpdateIds, [RoleId | IdList]);
        _Err ->
            logger:error("[~w]已经存在匹配列表[~w]",
                         [RoleId, _Err],
                         hero,
                         883),
            false
    end;
check_id([#team_mate{id = RoleId} | T], UpdateIds,
         IdList) ->
    case lists:keymember(RoleId, 2, UpdateIds) of
        false -> check_id(T, UpdateIds, [RoleId | IdList]);
        _Err ->
            logger:error("[~w]已经存在匹配列表[~w]",
                         [RoleId, _Err],
                         hero,
                         890),
            false
    end;
check_id([RoleId = {_, _, _} | T], UpdateIds, IdList) ->
    case lists:keymember(RoleId, 2, UpdateIds) of
        false -> check_id(T, UpdateIds, [RoleId | IdList]);
        _Err ->
            logger:error("[~w]已经存在匹配列表[~w]",
                         [RoleId, _Err],
                         hero,
                         897),
            false
    end;
check_id([_Err | _T], _UpdateIds, _IdList) ->
    logger:error("未知成员列表[~w]", [_Err], hero, 901),
    false.

get_mem(RolePid, IdList) ->
    case role:apply(sync, RolePid, {hero, get_team_mem, []})
        of
        {true, TeamPid, TeamMate, FailNames} ->
            case check_id(TeamMate, IdList, []) of
                {true, List1} ->
                    {true, TeamPid, TeamMate, List1, FailNames};
                false -> false
            end;
        false -> false;
        _Err ->
            logger:error("获取角色状态失败:~w", [_Err], hero, 914),
            false
    end.

get_team_mem(Role = #role{name = RoleName,
                          m_team = #m_team{pid = TeamPid}}) ->
    case check_status(Role) of
        {ok, true} ->
            case team:get_fighters(Role) of
                {ok, TeamMate} ->
                    NewTeamMate = case TeamMate of
                                      [{leader, #role{id = RoleId}, GuardPos}
                                       | T] ->
                                          [{leader, RoleId, GuardPos} | T];
                                      [#role{id = RoleId} | T] -> [RoleId | T];
                                      _ -> TeamMate
                                  end,
                    {FailMate, FailNames} = check_mate(NewTeamMate,
                                                       {[], []}),
                    NewTeamMate1 = NewTeamMate -- FailMate,
                    case NewTeamMate1 of
                        [] -> {ok, false};
                        _ -> {ok, {true, TeamPid, NewTeamMate1, FailNames}}
                    end;
                _Err ->
                    logger:error("无法获取[~ts]的队伍信息[~w]",
                                 [RoleName, _Err],
                                 hero,
                                 940),
                    {ok, false}
            end;
        _ -> {ok, false}
    end.

check_mate([], {FailMate, FailNames}) ->
    {FailMate, FailNames};
check_mate([Mate = #team_mate{pid = Pid, name = Name}
            | T],
           {FailMate, FailNames}) ->
    case role:apply(sync, Pid, {hero, check_status, []}) of
        true -> check_mate(T, {FailMate, FailNames});
        false ->
            check_mate(T, {[Mate | FailMate], [Name | FailNames]});
        _Err ->
            logger:error("请求队员状态失败[~w]", [_Err], hero, 956),
            check_mate(T, {[Mate | FailMate], [Name | FailNames]})
    end;
check_mate([{_, _, _} | T], {FailMate, FailNames}) ->
    check_mate(T, {FailMate, FailNames});
check_mate([_Err | T], {FailMate, FailNames}) ->
    logger:error("未知队员无法检测[~w]", [_Err], hero, 962),
    check_mate(T, {FailMate, FailNames}).

check_status(#role{name = Name, status = 2}) ->
    logger:error("[~ts]战斗中，无法进入战斗", [Name], hero, 967),
    {ok, false};
check_status(#role{name = Name,
                   m_combat = #m_combat{pid = Pid}})
    when is_pid(Pid) ->
    logger:error("[~ts]战斗中，无法进入战斗", [Name], hero, 970),
    {ok, false};
check_status(#role{s_event = 21}) -> {ok, true};
check_status(#role{id = Id, name = Name,
                   s_event = Event = 0}) ->
    logger:error("[~ts]状态异常[~w]，无法进入战斗",
                 [Name, {Id, Event}],
                 hero,
                 975),
    {ok, false};
check_status(#role{id = Id, name = Name,
                   s_event = Event}) ->
    logger:error("[~ts]状态异常[~w]，无法进入战斗",
                 [Name, {Id, Event}],
                 hero,
                 979),
    {ok, false};
check_status(_) -> {ok, false}.

deal_combat_result(_Flag, [], _, _, _, _, State) ->
    State;
deal_combat_result(Flag = win,
                   [#{id := RoleId, pid := Pid, is_leader := IsLeader}
                    | T],
                   RandTime, LastTime, MateNum, OtherNum,
                   State = #state{map_id = MapId}) ->
    AddScore = 10 * OtherNum,
    case hero_mgr:lookup(RoleId) of
        #hero_role{die = Die} when Die =< 0 ->
            role:apply(async, Pid, {hero_role, die_leave_zone, []}),
            deal_combat_result(Flag,
                               T,
                               RandTime,
                               LastTime,
                               MateNum,
                               OtherNum,
                               State);
        Tz = #hero_role{name = Name, score = Score, win = Win,
                        times = Times, win_streak = WinStreak, group = Group} ->
            NewTimes = Times + 1,
            NewWin = Win + 1,
            NewWinStreak = WinStreak + 1,
            NewScore = calc_score(win, NewTimes, AddScore, Score),
            NewTz = Tz#hero_role{score = NewScore, win = NewWin,
                                 times = NewTimes, is_combat = 0,
                                 last_combat_over_time = LastTime,
                                 match = RandTime, win_streak = NewWinStreak},
            hero_mgr:update_data(NewTz),
            push_role(NewTz),
            role_notice(NewTz, win),
            role_notice(NewTz, win_streak),
            role:apply(async,
                       Pid,
                       {hero_role,
                        async_combat_over,
                        [1, AddScore, NewTz, false]}),
            NState = update_group_score(Tz, AddScore, State),
            NewState = update_rank(NewTz, NState),
            case IsLeader of
                1 -> cast_win_streak(NewTz);
                _ -> ok
            end,
            case get(win) of
                0 ->
                    GroupName = hero_mgr:group_name(Group),
                    Msg =
                        notice:format(lang:get("~ts阵营的~ts率先带领队伍战胜对手，打响阵营胜利的第一枪！{face_1, "
                                               "18}"),
                                      [{string_2, 1, GroupName},
                                       {role_2, Name}]),
                    notice:cast({map, MapId}, 5, Msg),
                    put(win, 1);
                _ -> ignore
            end,
            deal_combat_result(Flag,
                               T,
                               RandTime,
                               LastTime,
                               MateNum,
                               OtherNum,
                               NewState);
        _ ->
            deal_combat_result(Flag,
                               T,
                               RandTime,
                               LastTime,
                               MateNum,
                               OtherNum,
                               State)
    end;
deal_combat_result(Flag = lose,
                   [#{id := RoleId, pid := Pid, is_leader := _IsLeader}
                    | T],
                   RandTime, LastTime, MateNum, OtherNum, State) ->
    AddScore = 3 * OtherNum,
    case hero_mgr:lookup(RoleId) of
        #hero_role{die = Die} when Die =< 0 ->
            role:apply(async, Pid, {hero_role, die_leave_zone, []}),
            deal_combat_result(Flag,
                               T,
                               RandTime,
                               LastTime,
                               MateNum,
                               OtherNum,
                               State);
        Tz = #hero_role{score = Score, times = Times, die = Die,
                        has_mail = OldHasMail} ->
            NewTimes = Times + 1,
            NewDie = max(Die - 1, 0),
            NewScore = calc_score(lose, NewTimes, AddScore, Score),
            {SendMail, NewHasMail} = case OldHasMail of
                                         1 -> {false, OldHasMail};
                                         _ ->
                                             case NewDie =< 0 of
                                                 true -> {true, 1};
                                                 _ -> {false, 0}
                                             end
                                     end,
            NewTz = Tz#hero_role{score = NewScore, times = NewTimes,
                                 is_combat = 0,
                                 last_combat_over_time = LastTime, die = NewDie,
                                 match = RandTime, has_mail = NewHasMail,
                                 win_streak = 0},
            hero_mgr:update_data(NewTz),
            push_role(NewTz),
            role_notice(NewTz, lose),
            role:apply(async,
                       Pid,
                       {hero_role,
                        async_combat_over,
                        [0, AddScore, NewTz, SendMail]}),
            NState = update_group_score(Tz, AddScore, State),
            NewState = update_rank(NewTz, NState),
            deal_combat_result(Flag,
                               T,
                               RandTime,
                               LastTime,
                               MateNum,
                               OtherNum,
                               NewState);
        _ ->
            deal_combat_result(Flag,
                               T,
                               RandTime,
                               LastTime,
                               MateNum,
                               OtherNum,
                               State)
    end;
deal_combat_result(Flag = fail, [#{id := RoleId} | T],
                   RandTime, LastTime, MateNum, OtherNum, State) ->
    case hero_mgr:lookup(RoleId) of
        Tz = #hero_role{} ->
            NewTz = Tz#hero_role{is_combat = 0},
            push_role(NewTz),
            hero_mgr:update_data(NewTz);
        _ -> skip
    end,
    deal_combat_result(Flag,
                       T,
                       RandTime,
                       LastTime,
                       MateNum,
                       OtherNum,
                       State);
deal_combat_result(Flag, [_ | T], RandTime, LastTime,
                   MateNum, OtherNum, State) ->
    deal_combat_result(Flag,
                       T,
                       RandTime,
                       LastTime,
                       MateNum,
                       OtherNum,
                       State).

update_rank(HeroRole = #hero_role{id = RoleId},
            State = #state{rank = RankList}) ->
    NRankList = lists:keystore(RoleId,
                               #hero_role.id,
                               RankList,
                               HeroRole),
    NRankList1 = util:keys_sort([#hero_role.lev,
                                 #hero_role.win_streak,
                                 #hero_role.win,
                                 #hero_role.score],
                                NRankList),
    State#state{rank = lists:sublist(NRankList1, 100)}.

calc_score(win, _Time, AddScore, Score) ->
    Score + AddScore;
calc_score(lose, _Times, AddScore, Score) ->
    Score + AddScore.

cast_win_streak(#hero_role{name = RoleName,
                           win_streak = WinStreak, group = Group})
    when WinStreak =:= 5 ->
    Msg =
        notice:format(lang:get("~ts ~ts带领的队伍在~ts中连挫强敌，获得5连胜{face_1,18}"),
                      [{string_2, 1, hero_mgr:group_name(Group)},
                       {role_2, RoleName},
                       {string_2, 1, lang:get("荣耀战场")}]),
    notice:cast(all, 5, Msg);
cast_win_streak(#hero_role{name = RoleName,
                           win_streak = WinStreak, group = Group})
    when WinStreak =:= 8 ->
    Msg =
        notice:format(lang:get("~ts ~ts带领的队伍在~ts中表现突出，获得8连胜{face_1,18}"),
                      [{string_2, 1, hero_mgr:group_name(Group)},
                       {role_2, RoleName},
                       {string_2, 1, lang:get("荣耀战场")}]),
    notice:cast(all, 5, Msg);
cast_win_streak(#hero_role{name = RoleName,
                           win_streak = WinStreak, group = Group})
    when WinStreak =:= 10 ->
    Msg =
        notice:format(lang:get("惊天动地，~ts ~ts带领的队伍在~ts中表现突出，获得10连胜{face_1,7}"),
                      [{string_2, 1, hero_mgr:group_name(Group)},
                       {role_2, RoleName},
                       {string_2, 1, lang:get("荣耀战场")}]),
    notice:cast(all, 5, Msg);
cast_win_streak(_) -> ok.

update_group_score(#hero_role{group = 1,
                              team_status = 1},
                   AddScore,
                   State = #state{tiger =
                                      Group = #hero_group{score =
                                                              GroupScore}}) ->
    NewGroup = Group#hero_group{score =
                                    GroupScore + AddScore},
    State#state{tiger = NewGroup};
update_group_score(#hero_role{group = 2,
                              team_status = 1},
                   AddScore,
                   State = #state{dragon =
                                      Group = #hero_group{score =
                                                              GroupScore}}) ->
    NewGroup = Group#hero_group{score =
                                    GroupScore + AddScore},
    State#state{dragon = NewGroup};
update_group_score(#hero_role{group = 1,
                              team_status = 0},
                   AddScore,
                   State = #state{tiger =
                                      Group = #hero_group{score =
                                                              GroupScore}}) ->
    NewGroup = Group#hero_group{score =
                                    GroupScore + AddScore},
    State#state{tiger = NewGroup};
update_group_score(#hero_role{group = 2,
                              team_status = 0},
                   AddScore,
                   State = #state{dragon =
                                      Group = #hero_group{score =
                                                              GroupScore}}) ->
    NewGroup = Group#hero_group{score =
                                    GroupScore + AddScore},
    State#state{dragon = NewGroup};
update_group_score(_, _AddScore, State) -> State.

update_score([], State, _SuccGroup, _FailGroup, List) ->
    {List, State};
update_score([R = #hero_role{group = SuccGroup,
                             score = Score, pid = Pid}
              | T],
             State, SuccGroup, FailGroup, List) ->
    Add = 200,
    NR = R#hero_role{score = Score + Add},
    NState = update_rank(NR, State),
    hero_mgr:update_data(NR),
    push_role(NR),
    notice:send({pid, Pid},
                3,
                notice:format(lang:get("最终胜利，额外获得~ts积分！"),
                              [{string_2, 5, Add}])),
    update_score(T,
                 NState,
                 SuccGroup,
                 FailGroup,
                 [NR | List]);
update_score([R | T], State, SuccGroup, FailGroup,
             List) ->
    update_score(T,
                 State,
                 SuccGroup,
                 FailGroup,
                 [R | List]).

push_state(Pid, notice, #state{m_time = MTime}) ->
    role:pack_send(Pid, 16300, {1, MTime});
push_state(Pid, prepare, #state{m_time = MTime}) ->
    role:pack_send(Pid, 16300, {2, MTime});
push_state(Pid, fight, #state{m_time = MTime}) ->
    role:pack_send(Pid, 16300, {3, MTime});
push_state(Pid, reward, #state{m_time = MTime}) ->
    role:pack_send(Pid, 16300, {4, MTime});
push_state(Pid, box, #state{m_time = MTime}) ->
    role:pack_send(Pid, 16300, {5, MTime});
push_state(Pid, _StateName, _State) ->
    role:pack_send(Pid, 16300, {0, 0}).

push_state(notice,
           #state{map_id = MapId, m_time = MTime}) ->
    map:pack_send_to_all(MapId, 16300, {1, MTime});
push_state(prepare,
           #state{map_id = MapId, m_time = MTime}) ->
    map:pack_send_to_all(MapId, 16300, {2, MTime});
push_state(fight,
           #state{map_id = MapId, m_time = MTime}) ->
    map:pack_send_to_all(MapId, 16300, {3, MTime});
push_state(reward,
           #state{map_id = MapId, m_time = MTime}) ->
    map:pack_send_to_all(MapId, 16300, {4, MTime});
push_state(box,
           #state{map_id = MapId, m_time = MTime}) ->
    map:pack_send_to_all(MapId, 16300, {5, MTime});
push_state(_, #state{map_id = MapId}) ->
    map:pack_send_to_all(MapId, 16300, {0, 0}).

push_zone(Pid,
          #state{series = Series, tiger = Tiger,
                 dragon = Dragon}) ->
    role:pack_send(Pid, 16303, {Series, [Tiger, Dragon]}).

push_zone(#state{map_id = MapId, series = Series,
                 tiger = Tiger, dragon = Dragon}) ->
    map:pack_send_to_all(MapId,
                         16303,
                         {Series, [Tiger, Dragon]}).

push_team(#state{map_id = MapId}, List) ->
    map:pack_send_to_all(MapId, 16309, {List}).

push_role(R = #hero_role{pid = Pid}) ->
    role:pack_send(Pid, 16304, {[R]}).

get_roles([], List) -> List;
get_roles([Id | T], List) ->
    case hero_mgr:lookup(Id) of
        R = #hero_role{} -> get_roles(T, [R | List]);
        _ -> get_roles(T, List)
    end.

role_notice(#hero_role{pid = Pid,
                       win_streak = WinStreak},
            win_streak)
    when WinStreak >= 2 ->
    notice:send({pid, Pid},
                3,
                notice:format(lang:get("战斗胜利，获得~ts连胜！"),
                              [{string_2, 4, WinStreak}]));
role_notice(#hero_role{pid = Pid}, win) ->
    notice:send({pid, Pid},
                3,
                lang:get("战斗胜利，向着阵营胜利又迈进一步！"));
role_notice(#hero_role{pid = Pid}, lose) ->
    notice:send({pid, Pid}, 3, lang:get("战斗失败，复活次数-1"));
role_notice(_, _) -> ok.

to_rank_rc([], _, Acc) -> Acc;
to_rank_rc([Warrior | Rest], Rank, Acc) ->
    #hero_role{id = Id = {RId, Plat, ZoneId}, name = Name,
               sex = Sex, classes = Classes, lev = Lev, score = Score,
               group = Group} =
        Warrior,
    RankRc = #rank_rc{id = Id, rank = Rank, role_id = RId,
                      platform = Plat, zone_id = ZoneId, name = Name,
                      sex = Sex, classes = Classes, lev = Lev, val1 = Score,
                      val2 = Group},
    to_rank_rc(Rest, Rank + 1, [RankRc | Acc]).

get_rank_type(1) -> 42;
get_rank_type(2) -> 43;
get_rank_type(3) -> 44;
get_rank_type(4) -> 45;
get_rank_type(_) -> 0.

honor_rank([], _, List) -> List;
honor_rank([#hero_role{id = RoleId, series = Series,
                       score = Score}
            | T],
           Num, List) ->
    case hero_data:get_honor({Series, Num}) of
        0 -> honor_rank(T, Num + 1, List);
        Honor ->
            N = lists:sublist([I
                               || I = #hero_role{score = TScore} <- T,
                                  TScore == Score],
                              4),
            NT = T -- N,
            Add = [{TRoleId, Honor}
                   || #hero_role{id = TRoleId} <- N],
            Add2 = [{RoleId, Honor} | Add],
            honor_rank(NT, Num + 1, Add2 ++ List)
    end.

match_group(null, #hero_role{status = 2}, Tiger,
            Dragon) ->
    {Tiger, Dragon};
match_group(null, #hero_role{status = 3}, Tiger,
            Dragon) ->
    {Tiger, Dragon};
match_group(null,
            #hero_role{status = 1, team_status = 1, is_combat = 1,
                       group = 1},
            Tiger = #hero_group_team{fight = Fight}, Dragon) ->
    {Tiger#hero_group_team{fight = Fight + 1}, Dragon};
match_group(null,
            #hero_role{status = 1, team_status = 1, group = 1},
            Tiger = #hero_group_team{match = Match}, Dragon) ->
    {Tiger#hero_group_team{match = Match + 1}, Dragon};
match_group(null,
            #hero_role{status = 1, team_status = 3, is_combat = 1,
                       group = 1},
            Tiger = #hero_group_team{fight = Fight}, Dragon) ->
    {Tiger#hero_group_team{fight = Fight + 1}, Dragon};
match_group(null,
            #hero_role{status = 1, team_status = 3, group = 1},
            Tiger = #hero_group_team{match = Match}, Dragon) ->
    {Tiger#hero_group_team{match = Match + 1}, Dragon};
match_group(null,
            #hero_role{status = 1, team_status = 0, is_combat = 1,
                       group = 1},
            Tiger = #hero_group_team{fight = Fight}, Dragon) ->
    {Tiger#hero_group_team{fight = Fight + 1}, Dragon};
match_group(null,
            #hero_role{status = 1, team_status = 0, group = 1},
            Tiger = #hero_group_team{match = Match}, Dragon) ->
    {Tiger#hero_group_team{match = Match + 1}, Dragon};
match_group(null,
            #hero_role{status = 1, team_status = 1, is_combat = 1,
                       group = 2},
            Tiger, Dragon = #hero_group_team{fight = Fight}) ->
    {Tiger, Dragon#hero_group_team{fight = Fight + 1}};
match_group(null,
            #hero_role{status = 1, team_status = 1, group = 2},
            Tiger, Dragon = #hero_group_team{match = Match}) ->
    {Tiger, Dragon#hero_group_team{match = Match + 1}};
match_group(null,
            #hero_role{status = 1, team_status = 3, is_combat = 1,
                       group = 2},
            Tiger, Dragon = #hero_group_team{fight = Fight}) ->
    {Tiger, Dragon#hero_group_team{fight = Fight + 1}};
match_group(null,
            #hero_role{status = 1, team_status = 3, group = 2},
            Tiger, Dragon = #hero_group_team{match = Match}) ->
    {Tiger, Dragon#hero_group_team{match = Match + 1}};
match_group(null,
            #hero_role{status = 1, team_status = 0, is_combat = 1,
                       group = 2},
            Tiger, Dragon = #hero_group_team{fight = Fight}) ->
    {Tiger, Dragon#hero_group_team{fight = Fight + 1}};
match_group(null,
            #hero_role{status = 1, team_status = 0, group = 2},
            Tiger, Dragon = #hero_group_team{match = Val}) ->
    {Tiger, Dragon#hero_group_team{match = Val + 1}};
match_group(combat,
            #hero_role{status = 1, team_status = 3, group = 2},
            Tiger, Dragon = #hero_group_team{fight = Val}) ->
    {Tiger, Dragon#hero_group_team{fight = Val + 1}};
match_group(combat,
            #hero_role{status = 1, team_status = 0, group = 2},
            Tiger, Dragon = #hero_group_team{fight = Val}) ->
    {Tiger, Dragon#hero_group_team{fight = Val + 1}};
match_group(combat,
            #hero_role{status = 1, team_status = 1, group = 2},
            Tiger, Dragon = #hero_group_team{fight = Val}) ->
    {Tiger, Dragon#hero_group_team{fight = Val + 1}};
match_group(combat,
            #hero_role{status = 1, team_status = 3, group = 1},
            Tiger = #hero_group_team{fight = Val}, Dragon) ->
    {Tiger#hero_group_team{fight = Val + 1}, Dragon};
match_group(combat,
            #hero_role{status = 1, team_status = 0, group = 1},
            Tiger = #hero_group_team{fight = Val}, Dragon) ->
    {Tiger#hero_group_team{fight = Val + 1}, Dragon};
match_group(combat,
            #hero_role{status = 1, team_status = 1, group = 1},
            Tiger = #hero_group_team{fight = Val}, Dragon) ->
    {Tiger#hero_group_team{fight = Val + 1}, Dragon};
match_group(away,
            #hero_role{status = 1, team_status = 3, group = 2},
            Tiger, Dragon = #hero_group_team{match = Val}) ->
    {Tiger, Dragon#hero_group_team{match = Val + 1}};
match_group(away,
            #hero_role{status = 1, team_status = 0, group = 2},
            Tiger, Dragon = #hero_group_team{match = Val}) ->
    {Tiger, Dragon#hero_group_team{match = Val + 1}};
match_group(away,
            #hero_role{status = 1, team_status = 1, group = 2},
            Tiger, Dragon = #hero_group_team{match = Val}) ->
    {Tiger, Dragon#hero_group_team{match = Val + 1}};
match_group(away,
            #hero_role{status = 1, team_status = 3, group = 1},
            Tiger = #hero_group_team{match = Val}, Dragon) ->
    {Tiger#hero_group_team{match = Val + 1}, Dragon};
match_group(away,
            #hero_role{status = 1, team_status = 0, group = 1},
            Tiger = #hero_group_team{match = Val}, Dragon) ->
    {Tiger#hero_group_team{match = Val + 1}, Dragon};
match_group(away,
            #hero_role{status = 1, team_status = 1, group = 1},
            Tiger = #hero_group_team{match = Val}, Dragon) ->
    {Tiger#hero_group_team{match = Val + 1}, Dragon};
match_group(six,
            #hero_role{status = 1, team_status = 3, group = 2},
            Tiger, Dragon = #hero_group_team{match = Val}) ->
    {Tiger, Dragon#hero_group_team{match = Val + 1}};
match_group(six,
            #hero_role{status = 1, team_status = 0, group = 2},
            Tiger, Dragon = #hero_group_team{match = Val}) ->
    {Tiger, Dragon#hero_group_team{match = Val + 1}};
match_group(six,
            #hero_role{status = 1, team_status = 1, group = 2},
            Tiger, Dragon = #hero_group_team{match = Val}) ->
    {Tiger, Dragon#hero_group_team{match = Val + 1}};
match_group(six,
            #hero_role{status = 1, team_status = 3, group = 1},
            Tiger = #hero_group_team{match = Val}, Dragon) ->
    {Tiger#hero_group_team{match = Val + 1}, Dragon};
match_group(six,
            #hero_role{status = 1, team_status = 0, group = 1},
            Tiger = #hero_group_team{match = Val}, Dragon) ->
    {Tiger#hero_group_team{match = Val + 1}, Dragon};
match_group(six,
            #hero_role{status = 1, team_status = 1, group = 1},
            Tiger = #hero_group_team{match = Val}, Dragon) ->
    {Tiger#hero_group_team{match = Val + 1}, Dragon};
match_group(same_group,
            #hero_role{status = 1, team_status = 3, group = 2},
            Tiger, Dragon = #hero_group_team{match = Val}) ->
    {Tiger, Dragon#hero_group_team{match = Val + 1}};
match_group(same_group,
            #hero_role{status = 1, team_status = 0, group = 2},
            Tiger, Dragon = #hero_group_team{match = Val}) ->
    {Tiger, Dragon#hero_group_team{match = Val + 1}};
match_group(same_group,
            #hero_role{status = 1, team_status = 1, group = 2},
            Tiger, Dragon = #hero_group_team{match = Val}) ->
    {Tiger, Dragon#hero_group_team{match = Val + 1}};
match_group(same_group,
            #hero_role{status = 1, team_status = 3, group = 1},
            Tiger = #hero_group_team{match = Val}, Dragon) ->
    {Tiger#hero_group_team{match = Val + 1}, Dragon};
match_group(same_group,
            #hero_role{status = 1, team_status = 0, group = 1},
            Tiger = #hero_group_team{match = Val}, Dragon) ->
    {Tiger#hero_group_team{match = Val + 1}, Dragon};
match_group(same_group,
            #hero_role{status = 1, team_status = 1, group = 1},
            Tiger = #hero_group_team{match = Val}, Dragon) ->
    {Tiger#hero_group_team{match = Val + 1}, Dragon};
match_group(combat_start, _,
            Tiger = #hero_group_team{fight = Val},
            Dragon = #hero_group_team{fight = Val1}) ->
    {Tiger#hero_group_team{fight = Val + 1},
     Dragon#hero_group_team{fight = Val1 + 1}};
match_group(_, _, Tiger, Dragon) -> {Tiger, Dragon}.

continue(StateName,
         State = #state{ts = Ts, timeout = Tidle}) ->
    {next_state,
     StateName,
     State,
     util:time_left(Tidle, Ts)}.

continue(StateName, Reply,
         State = #state{ts = Ts, timeout = Tidle}) ->
    {reply,
     Reply,
     StateName,
     State,
     util:time_left(Tidle, Ts)}.

