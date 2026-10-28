-file("src/mod/guild_siege/c_guild_siege_mgr.erl", 1).

-module(c_guild_siege_mgr).

-behaviour(gen_fsm).

-export([start_link/0,
         call/1,
         cast/1,
         info/1,
         m/1,
         do/1,
         do_guild/1,
         load_data/1]).

-export([init/1,
         handle_event/3,
         handle_sync_event/4,
         handle_info/3,
         terminate/3,
         code_change/4]).

-export([idle/2, notice/2, active/2, ending/2]).

-export([submit/3,
         lookup_role_log/1,
         lookup_match/1,
         lookup_match_guild/1,
         lookup_rank/1,
         insert_match/1,
         insert_match_guild/1,
         sync_insert_match/1,
         local_insert_match/2,
         insert_role_log/3,
         insert_role_log/1,
         combat_start/6,
         init_status/2,
         combat_over/1]).

-record(state,
        {ts, timeout, round = 1, match_id = 1, is_init = 0}).

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

-file("src/mod/guild_siege/c_guild_siege_mgr.erl", 55).

-file("inc/guild.hrl", 1).

-type guild_id() :: {non_neg_integer(),
                     list(),
                     non_neg_integer()}.

-record(guild_apply,
        {id = {0, "", 0},
         name = "",
         classes = 0,
         sex = 0,
         lev = 1,
         time = 0,
         type = 0,
         looks = [],
         cup = 0 :: non_neg_integer(),
         donation = 0 :: non_neg_integer(),
         tag = 0 :: non_neg_integer(),
         msg = "" :: string()}).

-record(guild_envelop,
        {ver = 1,
         title = "" :: string(),
         amount = 0 :: non_neg_integer(),
         remain = 0 :: non_neg_integer(),
         total = 0 :: non_neg_integer(),
         num = 0 :: non_neg_integer(),
         time = 0 :: non_neg_integer(),
         packs = [],
         log = [] :: list()}).

-record(guild_role,
        {id = {1, "", 0} ::
             {pos_integer(), list(), non_neg_integer()},
         pid :: undefined | pid(),
         name = "" :: list(),
         sex = 0 :: 0 | 1,
         classes = 0 :: 0..4,
         lev = 1 :: pos_integer(),
         lev_break_times = 0 :: non_neg_integer(),
         fc = 1 :: pos_integer(),
         synth_fc = 1 :: pos_integer(),
         post = 0 :: 0..5,
         status = 0 :: 0 | 1,
         last_login = 1 :: pos_integer(),
         last_logout = 1 :: pos_integer(),
         enter_time = 0 :: non_neg_integer(),
         signature = "" :: list(),
         value = 0,
         total_value = 0 :: non_neg_integer(),
         cup = 0 :: non_neg_integer(),
         looks = [],
         envelope = #guild_envelop{},
         requirement = [],
         signed = 0 :: non_neg_integer(),
         last_signed = 0 :: non_neg_integer(),
         mails = [],
         active = 0,
         ability = 0,
         chat_num = 0,
         doing = 0,
         chat_num_list = [],
         doing_list = [],
         element_attr = [] :: list(),
         tmp_element_attr = [] :: list()}).

-record(guild_leaver,
        {id = {1, "", 0} ::
             {pos_integer(), list(), non_neg_integer()},
         name = "" :: list(),
         guild_id = {1, "", 0} ::
             {pos_integer(), list(), non_neg_integer()},
         value = 0,
         total_value = 0 :: non_neg_integer(),
         time = 0 :: integer()}).

-record(guild_boss,
        {lev = 1 :: non_neg_integer(),
         step = 1 :: non_neg_integer(),
         unit_id = 0 :: non_neg_integer(),
         name = "",
         hp = 0 :: non_neg_integer(),
         hp_max = 0 :: non_neg_integer(),
         exp = 0 :: non_neg_integer(),
         called = 0 :: integer(),
         log = [] :: list(),
         last_renamed = 0 :: non_neg_integer()}).

-record(guild_mercenary,
        {id = {0, "", 0},
         key :: undefined | tuple(),
         lev = 0 :: non_neg_integer(),
         name = "" :: string(),
         dispatched = 0 :: non_neg_integer(),
         recruited = 0 :: non_neg_integer(),
         score = 0 :: non_neg_integer(),
         gain = [],
         guard :: undefined | tuple()}).

-record(guild_totem,
        {ver = 0 :: non_neg_integer(),
         id = util:rand_list([101, 102, 103, 104, 105]) ::
             non_neg_integer(),
         changeable = 1 :: non_neg_integer(),
         last_changed = 0 :: non_neg_integer()}).

-record(guild_question_answer,
        {ver = 0,
         id = {0, "", 0},
         name = "" :: string(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         guild_name = "" :: string(),
         option = 0 :: 0..4,
         result = 0 :: 0 | 1,
         score = 0 :: non_neg_integer(),
         answered = 0 :: non_neg_integer(),
         totem_id = 0 :: non_neg_integer(),
         rank = 0 :: non_neg_integer()}).

-record(guild_question,
        {ver = 0,
         id = 0 :: non_neg_integer(),
         answer = 0 :: 0..4,
         asked = 0 :: non_neg_integer(),
         answers = [] :: [#guild_question_answer{}],
         cheat_off = [],
         asked_num = 0 :: non_neg_integer(),
         cheat_nums = []}).

-record(guild_robber,
        {ver = 0 :: non_neg_integer(),
         id :: undefined | tuple(),
         today_generated = 0 :: non_neg_integer(),
         gen_hour = 0 :: non_neg_integer(),
         gen_time = 0 :: non_neg_integer(),
         total_killed = 0 :: non_neg_integer(),
         last_killed = 0 :: non_neg_integer(),
         killed_time = 0 :: non_neg_integer(),
         fighters = [],
         picker = []}).

-record(guild_treasure,
        {ver = 1 :: non_neg_integer(),
         added = 0 :: non_neg_integer(),
         setting_chance = 0 :: non_neg_integer(),
         setting_time = 0 :: non_neg_integer(),
         gen_time = 0 :: non_neg_integer(),
         generated = 0 :: non_neg_integer(),
         unit_num = 0 :: non_neg_integer(),
         total_killed = 0 :: non_neg_integer(),
         last_killed = 0 :: non_neg_integer(),
         killed_time = 0 :: non_neg_integer(),
         can_open = 0 :: 0,
         fighters = [],
         picker = [],
         type = win}).

-record(guild_loot,
        {ver = 0, items = [], log = [], allocated = []}).

-record(guild_usurper,
        {ver = 0,
         id :: undefined | tuple(),
         name = "" :: string(),
         classes = 0,
         sex = 0,
         ctime = 0 :: integer()}).

-record(guild_invitation,
        {ver = 0,
         id :: undefined | tuple(),
         name = "" :: string(),
         classes = 0,
         sex = 0,
         lev = 0,
         ctime = 0 :: integer(),
         guild_id :: undefined | tuple(),
         guild_name = "" :: string()}).

-record(guild_plant_irrigator,
        {id = {0, "", 0} :: tuple(),
         name = "" :: string(),
         classes = 0,
         sex = 0,
         ctime = 0 :: integer()}).

-record(guild_plant,
        {ver = 0,
         pos = {0, 0},
         owner_rid = {0, "", 0},
         owner_name = "",
         irrigations = [],
         phase = 0,
         sowed = 0,
         matured = 0,
         fired = 0 :: 0 | 1,
         unit_id = {0, 0},
         unit_base_id = 0}).

-record(guild_union_apply,
        {ver = 0,
         id = {0, "", 0},
         name = "" :: string(),
         leader_id = {0, "", 0},
         leader_name = "" :: string(),
         ctime = 0 :: integer()}).

-record(guild_campaign,
        {acc = [] :: list(),
         can_reward = [] :: list(),
         rewarded = [] :: list()}).

-record(guild_camp_web,
        {acc = [] :: list(),
         can_reward = [] :: list(),
         rewarded = [] :: list(),
         overdue_time = 0 :: non_neg_integer(),
         end_reward = [] :: list(),
         time_list = [] :: list()}).

-record(element_info,
        {ver = 1, build_type = 0, lev = 1, time = 0}).

-record(guild,
        {id = {0, "", 0} ::
             {non_neg_integer(), list(), non_neg_integer()},
         ver = 21 :: non_neg_integer(),
         name = "" :: list(),
         assets = 5000000,
         max_assets = 5000000,
         upkeep = 0,
         pid :: undefined | pid(),
         leader_name = "" :: list(),
         leader_id = {0, "", 0} ::
             {non_neg_integer(), list(), non_neg_integer()},
         leader_sex = 0 :: 0 | 1,
         leader_classes = 0 :: 0..6,
         leader_lev = 0 :: non_neg_integer(),
         members = [] :: [#guild_role{}],
         mem_num = 0 :: non_neg_integer(),
         fresh_num = 0 :: non_neg_integer(),
         max_mem_num = 90,
         max_fresh_num = 100,
         board = "" :: list(),
         health = 100,
         join_type = 2,
         join_condition = [],
         apply_list = [],
         event_list = [],
         lev = 1 :: pos_integer(),
         lev_time = 0 :: non_neg_integer(),
         academy_lev = 0 :: non_neg_integer(),
         academy_time = 0 :: non_neg_integer(),
         store_lev = 0 :: non_neg_integer(),
         store_time = 0 :: non_neg_integer(),
         exchequer_lev = 0 :: non_neg_integer(),
         exchequer_time = 0 :: non_neg_integer(),
         lev_ref :: undefined | reference(),
         welfare_time = 0,
         welfare_list = [],
         store_tick_time = 0,
         store_list = [],
         create_time = 0,
         flag = 0,
         map_pid = 0,
         map_id = 0,
         boss = #guild_boss{},
         mercenarys = [] :: [#guild_mercenary{}],
         totem = #guild_totem{} :: #guild_totem{},
         question = #guild_question{},
         robber_num = 0 :: non_neg_integer(),
         robber_total_num = 0 :: non_neg_integer(),
         usurpers = [],
         activity = 0,
         plants = [],
         announcement = "" :: string(),
         union_applys = [] :: list(),
         union_applied = [] :: list(),
         today_used_medal = 0 :: integer(),
         last_medal_used = 0 :: integer(),
         today_upgraded_build = 0 :: integer(),
         last_build_upgraded = 0 :: integer(),
         today_destory_build = 0 :: integer(),
         last_build_destory = 0 :: integer(),
         treasure = #guild_treasure{},
         loot = #guild_loot{},
         week_assets = 0 :: integer(),
         formalizing_lev = 35 :: integer(),
         name_used = "" :: string(),
         create_id = {0, "", 0},
         create_name = "",
         guild_camp = #guild_campaign{},
         guild_camp_web = #guild_camp_web{},
         max_chat_num = 0,
         max_doing = 0,
         max_fc = 0,
         max_synth_fc = 0,
         element_info = [],
         uplev_element_times = 0,
         last_uplev_element = 0,
         upgrade_element_time = 0,
         mail_list = [],
         limit_mode = 0,
         is_lock_board = 0,
         board_id = {0, "", 0},
         announce_id = {0, "", 0}}).

-record(guild_element_attr,
        {ver = 1,
         effect_obj = 1,
         attr = [],
         attr_snd = [],
         add_skill_list = [],
         high_attr = [],
         end_time = 0}).

-record(m_guild,
        {ver = 3 :: pos_integer(),
         id = {0, "", 0} ::
             {non_neg_integer(), list(), non_neg_integer()},
         name = "" :: list(),
         pid :: undefined | pid(),
         enter_time = 0,
         guild_lev = 1,
         post = 0 :: non_neg_integer(),
         value = 0,
         total_value = 0 :: non_neg_integer(),
         signature = "" :: list(),
         element_attr = [] :: list(),
         tmp_element_attr = [] :: list(),
         build_speed_num = 0 :: non_neg_integer()}).

-record(guild_emblem,
        {ver = 0, id = 0, type = 0, lev = 0}).

-record(m_guild_emblem,
        {ver = 0 :: non_neg_integer(),
         remain_point = 0 :: non_neg_integer(),
         total_point = 0 :: non_neg_integer(),
         emblems = []}).

-file("src/mod/guild_siege/c_guild_siege_mgr.erl", 56).

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

-file("src/mod/guild_siege/c_guild_siege_mgr.erl", 57).

-file("inc/guild_siege.hrl", 1).

-record(guild_siege_match,
        {ver = 1,
         round = 1,
         match_id = 1,
         lev_group = 0,
         guild_ids = [],
         guild_match_list = [],
         has_result = 0,
         win_guild_id = {0, "", 0}}).

-record(guild_siege_match_guild,
        {ver = 1,
         guild_id = {0, "", 0},
         guild_name = "",
         guild_lev = 0,
         round = 1,
         match_id = 1,
         score = 0,
         score_time = 0,
         score_log = [],
         win_star_3 = 0,
         win_star_2 = 0,
         win_star_1 = 0,
         atk_times = 0,
         win_times = 0,
         castle_num = 0,
         best_atk_id = {0, "", 0},
         best_atk_name = "",
         best_atk_data = {0, 0, 0},
         best_atk_combat_replay = {0, "", 0},
         best_def_id = {0, "", 0},
         best_def_name = "",
         best_def_data = {0, 0},
         best_def_combat_replay = {0, "", 0},
         castle_list = [],
         logs = []}).

-record(guild_siege_match_combat_log,
        {ver = 2,
         time = 0,
         star = 1,
         guild_id_1 = {0, "", 0},
         guild_name_1 = "",
         role_id_1 = {0, "", 0},
         role_name_1 = "",
         role_order_1 = 1,
         guild_id_2 = {0, "", 0},
         guild_name_2 = "",
         role_id_2 = {0, "", 0},
         role_name_2 = "",
         role_order_2 = 1,
         is_win = 0,
         combat_replay_id = {0, "", 0},
         role_lev_1 = 0,
         role_lev_2 = 0}).

-record(guild_siege_castle,
        {ver = 1,
         id = {0, "", 0},
         order = 0,
         castle_type = 0,
         name = "",
         lev = 0,
         lev_break_times = 0,
         sex = 0,
         classes = 0,
         loss_star = 0,
         def_win_times = 0,
         def_win_min_order = 0,
         def_times = 0,
         atk_times = 0,
         atk_win_times = 0,
         castle_log = [],
         can_look = 0,
         formation = 1,
         formation_lev = 1,
         guards = [],
         is_combat = 0,
         combat_pid,
         combat_id = {0, "", 0},
         combat_name = ""}).

-record(guild_siege_role,
        {ver = 1,
         id = {0, "", 0},
         name = "",
         lev = 0,
         lev_break_times = 0,
         sex = 0,
         classes = 0,
         formation = 1,
         formation_lev = 1,
         guards = [],
         first_pet = 0,
         first_pet_base_id = 0,
         robot_role}).

-record(guild_siege_role_log,
        {ver = 1,
         id = {0, "", 0},
         name = "",
         atk_num = 0,
         atk_log = []}).

-record(guild_siege_guild_rank,
        {ver = 2,
         guild_id = {0, "", 0},
         score = 0,
         logs = [],
         win_times = 0,
         all_times = 0,
         last_guild_id = {0, "", 0},
         punish_time = 0}).

-file("src/mod/guild_siege/c_guild_siege_mgr.erl", 58).

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

-file("src/mod/guild_siege/c_guild_siege_mgr.erl", 59).

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

-file("src/mod/guild_siege/c_guild_siege_mgr.erl", 60).

start_link() ->
    gen_fsm:start_link({local, c_guild_siege_mgr},
                       c_guild_siege_mgr,
                       [],
                       []).

call(Msg) ->
    case catch
             gen_fsm:sync_send_all_state_event(c_guild_siege_mgr,
                                               Msg)
        of
        {'EXIT', {timeout, _}} -> {error, timeout};
        {'EXIT', {noproc, _}} -> {error, noproc};
        {'EXIT', {normal, _}} -> {error, exit};
        {'EXIT', _Call_Err} -> {error, _Call_Err};
        _Call_Return -> _Call_Return
    end.

cast(Msg) ->
    gen_fsm:send_all_state_event(c_guild_siege_mgr, Msg).

info(Msg) -> c_guild_siege_mgr ! Msg.

m(Event) ->
    gen_fsm:send_event(c_guild_siege_mgr, Event).

submit(Plat, ZoneId, GuildSiegeList) ->
    cast({submit, Plat, ZoneId, GuildSiegeList}).

init_status(P, Z) -> cast({init_status, P, Z}).

lookup_role_log(RoleId) ->
    case catch ets:lookup(guild_siege_role_log, RoleId) of
        [Log = #guild_siege_role_log{}] -> {true, Log};
        [] -> null;
        _Err ->
            logger:error("无法查询到角色的攻击记录:~w",
                         [_Err],
                         c_guild_siege_mgr,
                         113),
            false
    end.

lookup_match(MatchId) ->
    case catch ets:lookup(guild_siege_match, MatchId) of
        [SiegeMatch = #guild_siege_match{}] ->
            {true, SiegeMatch};
        [] -> null;
        _Err ->
            logger:error("无法查询到匹配记录:~w",
                         [_Err],
                         c_guild_siege_mgr,
                         123),
            false
    end.

lookup_match(by_guild_id, GuildId) ->
    case catch ets:lookup_element(guild_siege_match_guild,
                                  GuildId,
                                  #guild_siege_match_guild.match_id)
        of
        MatchId when is_integer(MatchId) ->
            lookup_match(MatchId);
        _ -> false
    end.

lookup_match_guild(GuildId) ->
    case catch ets:lookup(guild_siege_match_guild, GuildId)
        of
        [Guild = #guild_siege_match_guild{}] -> {true, Guild};
        [] -> null;
        _Err ->
            logger:error("无法查询到公会匹配记录:~w",
                         [_Err],
                         c_guild_siege_mgr,
                         142),
            false
    end.

lookup_rank(GuildId) ->
    case catch ets:lookup(guild_siege_guild_rank, GuildId)
        of
        [Rank = #guild_siege_guild_rank{}] -> {true, Rank};
        [] -> null;
        _Err ->
            logger:error("无法查询到角色的攻击记录:~w",
                         [_Err],
                         c_guild_siege_mgr,
                         152),
            false
    end.

combat_start(RolePid, GuildId, RoleId, RoleName,
             OtherOrder, Star) ->
    cast({combat_start,
          RolePid,
          GuildId,
          RoleId,
          RoleName,
          OtherOrder,
          Star}).

combat_over(#combat{type = 112, winner = []}) ->
    logger:debug("战斗被终止,没有获胜方", [], c_guild_siege_mgr, 162),
    ok;
combat_over(#combat{type = 112, winner = Winner,
                    loser = Loser,
                    start_args = #combat_start_args{ext_args = ExtArgs}}) ->
    IsWin = case [F || F = #fighter{group = 0} <- Winner] of
                [_ | _] -> 1;
                _ -> 0
            end,
    StartData = case lists:keyfind(guild_siege_args,
                                   1,
                                   ExtArgs)
                    of
                    {_,
                     {MatchId,
                      Sorder,
                      Torder,
                      Star,
                      Sgid,
                      Sgname,
                      Tgid,
                      Tgname}} ->
                        {true,
                         MatchId,
                         Sorder,
                         Torder,
                         Star,
                         Sgid,
                         Sgname,
                         Tgid,
                         Tgname};
                    _ -> false
                end,
    OverResult = case IsWin of
                     1 ->
                         case combat_util:filter_fighter(Winner, [1]) of
                             [#fighter{pid = Spid, origin_id = SRoleId,
                                       name = SName, lev = SLev}] ->
                                 case combat_util:filter_fighter(Loser, [4]) of
                                     [#fighter{origin_id = TRoleId,
                                               name = TName, lev = TLev}] ->
                                         {true,
                                          Spid,
                                          SRoleId,
                                          SName,
                                          SLev,
                                          TRoleId,
                                          TName,
                                          TLev};
                                     _ -> false
                                 end;
                             _ -> false
                         end;
                     0 ->
                         case combat_util:filter_fighter(Winner, [4]) of
                             [#fighter{origin_id = TRoleId, name = TName,
                                       lev = TLev}] ->
                                 case combat_util:filter_fighter(Loser, [1]) of
                                     [#fighter{pid = Spid, origin_id = SRoleId,
                                               name = SName, lev = SLev}] ->
                                         {true,
                                          Spid,
                                          SRoleId,
                                          SName,
                                          SLev,
                                          TRoleId,
                                          TName,
                                          TLev};
                                     _ -> false
                                 end;
                             _ -> false
                         end
                 end,
    case OverResult of
        {true,
         GetSpid,
         GetSRoleId,
         GetSName,
         GetSLev,
         GetTRoleId,
         GetTName,
         GetTLev} ->
            case StartData of
                {true,
                 GetMatchId,
                 GetSOrder,
                 GetTOrder,
                 GetStar,
                 GetSGid,
                 GetSGname,
                 GetTGid,
                 GetTGname} ->
                    CombatRecord = combat_record:get_buffer(),
                    cast({combat_over,
                          GetSpid,
                          GetSGid,
                          GetSGname,
                          GetSRoleId,
                          GetSName,
                          GetSLev,
                          GetSOrder,
                          GetTGid,
                          GetTGname,
                          GetTRoleId,
                          GetTName,
                          GetTLev,
                          GetTOrder,
                          GetMatchId,
                          IsWin,
                          GetStar,
                          CombatRecord});
                _ ->
                    logger:error("无法获取发起战斗参数:~w",
                                 [ExtArgs],
                                 c_guild_siege_mgr,
                                 209),
                    ok
            end;
        _Err ->
            logger:error("战斗结束时无法找到参数:~w",
                         [_Err],
                         c_guild_siege_mgr,
                         213),
            ok
    end;
combat_over(_) -> ok.

init([]) ->
    logger:info("[~w] 正在启动...",
                [c_guild_siege_mgr],
                c_guild_siege_mgr,
                222),
    ets:new(guild_siege_match,
            [set,
             named_table,
             public,
             {keypos, #guild_siege_match.match_id}]),
    dets:open_file(guild_siege_match,
                   [{file, "./dets/guild_siege_match.dets"},
                    {keypos, #guild_siege_match.match_id},
                    {type, set}]),
    ets:new(guild_siege_match_guild,
            [set,
             named_table,
             public,
             {keypos, #guild_siege_match_guild.guild_id}]),
    dets:open_file(guild_siege_match_guild,
                   [{file, "./dets/guild_siege_match_guild.dets"},
                    {keypos, #guild_siege_match_guild.guild_id},
                    {type, set}]),
    ets:new(guild_siege_role_log,
            [set,
             named_table,
             public,
             {keypos, #guild_siege_role_log.id}]),
    dets:open_file(guild_siege_role_log,
                   [{file, "./dets/guild_siege_role_log.dets"},
                    {keypos, #guild_siege_role_log.id},
                    {type, set}]),
    ets:new(guild_siege_guild_rank,
            [set,
             named_table,
             public,
             {keypos, #guild_siege_guild_rank.guild_id}]),
    dets:open_file(guild_siege_guild_rank,
                   [{file, "./dets/guild_siege_guild_rank.dets"},
                    {keypos, #guild_siege_guild_rank.guild_id},
                    {type, set}]),
    State = #state{},
    case load_data(center) of
        [] ->
            case env:get(guild_siege_combat_record_id) of
                RecId when is_integer(RecId) -> ok;
                _ -> env:set(guild_siege_combat_record_id, 1)
            end,
            Round = case env:get(guild_siege_round) of
                        R when is_integer(R) -> R;
                        _ -> 1
                    end,
            env:save(guild_siege_round, Round),
            Ref = erlang:send_after(date:next_diff(0, 0, 30) * 1000,
                                    self(),
                                    reset),
            put(zero_reset_time, Ref),
            erlang:send_after(5000, self(), init),
            logger:info("[~w] 启动完成",
                        [c_guild_siege_mgr],
                        c_guild_siege_mgr,
                        251),
            {ok,
             idle,
             State#state{ts = erlang:now(), timeout = undefined,
                         round = Round},
             infinity};
        _Err ->
            logger:error("公会攻城战数据文件载入失败:~w",
                         [_Err],
                         c_guild_siege_mgr,
                         254),
            {stop, data_load_err}
    end.

handle_sync_event(_Event, _From, StateName, State) ->
    Reply = ok,
    continue(StateName, Reply, State).

handle_event({combat_start,
              RolePid,
              GuildId,
              RoleId,
              RoleName,
              OtherOrder,
              Star},
             active, State) ->
    case lookup_match(by_guild_id, GuildId) of
        {true, #guild_siege_match{has_result = 1}} ->
            role:pack_send(RolePid,
                           19103,
                           {0, lang:get("已经产生结果无法再次攻击")}),
            ok;
        {true, SiegeMatch} ->
            case do_combat_start(SiegeMatch,
                                 GuildId,
                                 RoleId,
                                 RoleName,
                                 OtherOrder,
                                 Star)
                of
                true ->
                    role:pack_send(RolePid, 19103, {1, lang:get("发起成功")}),
                    ok;
                {false, Reason} ->
                    role:pack_send(RolePid, 19103, {0, Reason}),
                    ok
            end;
        _ ->
            role:pack_send(RolePid,
                           19103,
                           {0, lang:get("当前公会没有参与活动")}),
            ok
    end,
    continue(active, State);
handle_event({combat_start,
              RolePid,
              _GuildId,
              _RoleId,
              _RoleName,
              _OtherOrder,
              _Star},
             notice, State) ->
    role:pack_send(RolePid,
                   19103,
                   {0, lang:get("活动还在公示期，无法发起战斗")}),
    continue(notice, State);
handle_event({combat_start,
              RolePid,
              _GuildId,
              _RoleId,
              _RoleName,
              _OtherOrder,
              _Star},
             StateName, State) ->
    role:pack_send(RolePid,
                   19103,
                   {0, lang:get("活动还未开启，无法发起战斗")}),
    continue(StateName, State);
handle_event({combat_over,
              Spid,
              SGid = {_, P, Z},
              SGname,
              SRoleId,
              SName,
              SLev,
              SOrder,
              TGid,
              TGname,
              TRoleId,
              TName,
              TLev,
              TOrder,
              MatchId,
              IsWin,
              Star,
              CombatRecord},
             StateName, State) ->
    Now = date:unixtime(),
    CombatRecordId =
        {env:save_counter(guild_siege_combat_record_id, 1),
         P,
         Z},
    AtkLog = #guild_siege_match_combat_log{time = Now,
                                           star = Star, guild_id_1 = SGid,
                                           guild_name_1 = SGname,
                                           role_id_1 = SRoleId,
                                           role_name_1 = SName,
                                           role_order_1 = SOrder,
                                           guild_id_2 = TGid,
                                           guild_name_2 = TGname,
                                           role_id_2 = TRoleId,
                                           role_name_2 = TName,
                                           role_order_2 = TOrder,
                                           is_win = IsWin,
                                           combat_replay_id = CombatRecordId,
                                           role_lev_1 = SLev,
                                           role_lev_2 = TLev},
    insert_role_log(SRoleId, SName, AtkLog),
    case update_atk(MatchId,
                    SGid,
                    SRoleId,
                    SName,
                    SOrder,
                    TGid,
                    TRoleId,
                    TName,
                    TOrder,
                    IsWin,
                    Star,
                    AtkLog)
        of
        {ok, NewSiegeMatch} ->
            role:apply(async,
                       Spid,
                       {guild_siege,
                        combat_gain,
                        [SOrder, TOrder, TName, Star, IsWin, NewSiegeMatch]});
        _ -> ok
    end,
    big_world:cast(P,
                   Z,
                   combat_record,
                   save,
                   [17, CombatRecordId, CombatRecord]),
    continue(StateName, State);
handle_event({submit, Plat, ZoneId, GuildSiegeList},
             notice, State = #state{round = Round}) ->
    AllGuildList = get(guild_siege_list),
    logger:info("收到[~ts][~w]提交[~w]个参赛公会",
                [Plat, ZoneId, length(GuildSiegeList)],
                c_guild_siege_mgr,
                309),
    {PunishList, NewAllGuildList} = set_guild_score(Round,
                                                    GuildSiegeList,
                                                    AllGuildList,
                                                    []),
    put(guild_siege_list, NewAllGuildList),
    AllPunishList = get(guild_siege_punish_list),
    put(guild_siege_punish_list,
        PunishList ++ AllPunishList),
    continue(notice, State);
handle_event({init_status, P, Z}, StateName,
             State = #state{is_init = 1}) ->
    big_world:cast(P,
                   Z,
                   guild_siege_mgr,
                   cast,
                   [{init_status, calc_status(StateName, State)}]),
    continue(StateName, State);
handle_event({init_status, _, _}, StateName, State) ->
    continue(StateName, State);
handle_event({update_setting,
              MatchId,
              GuildId,
              RoleId,
              FormId,
              FormLev,
              GuardIds},
             StateName, State)
    when StateName =:= notice orelse StateName =:= active ->
    case lookup_match(MatchId) of
        {true,
         SiegeMatch = #guild_siege_match{guild_match_list =
                                             GuildMatchList}} ->
            case lists:keyfind(GuildId,
                               #guild_siege_match_guild.guild_id,
                               GuildMatchList)
                of
                SiegeGuild = #guild_siege_match_guild{castle_list =
                                                          CastleList} ->
                    case lists:keyfind(RoleId,
                                       #guild_siege_castle.id,
                                       CastleList)
                        of
                        Castle = #guild_siege_castle{} ->
                            NewCastle = Castle#guild_siege_castle{formation =
                                                                      FormId,
                                                                  formation_lev
                                                                      = FormLev,
                                                                  guards =
                                                                      GuardIds},
                            NewCastleList = lists:keystore(RoleId,
                                                           #guild_siege_castle.id,
                                                           CastleList,
                                                           NewCastle),
                            NewSiegeGuild =
                                SiegeGuild#guild_siege_match_guild{castle_list =
                                                                       NewCastleList},
                            NewGuildMatchList = lists:keystore(GuildId,
                                                               #guild_siege_match_guild.guild_id,
                                                               GuildMatchList,
                                                               NewSiegeGuild),
                            NewSiegeMatch =
                                SiegeMatch#guild_siege_match{guild_match_list =
                                                                 NewGuildMatchList},
                            sync_insert_match(NewSiegeMatch),
                            true;
                        _ -> skip
                    end;
                _ -> skip
            end;
        _ -> skip
    end,
    continue(StateName, State);
handle_event({update_setting,
              _MatchId,
              _GuildId,
              _RoleId,
              _FormId,
              _FormLev,
              _GuildIds},
             StateName, State) ->
    continue(StateName, State);
handle_event(_Event, StateName, State) ->
    logger:error("公会攻城战管理进程收到未处理的消息:~w",
                 [_Event],
                 c_guild_siege_mgr,
                 354),
    continue(StateName, State).

handle_info(timeout_submit, notice,
            State = #state{round = Round, match_id = MatchId}) ->
    AllGuildSiegeList = get(guild_siege_list),
    PunishList = get(guild_siege_punish_list),
    {NewMatchId, MatchList, NotMatch} = match(Round,
                                              MatchId,
                                              AllGuildSiegeList,
                                              [],
                                              []),
    check_result_not_match(NotMatch),
    check_result_punish(PunishList),
    split_match(MatchList, NotMatch),
    big_world:cast(all,
                   guild_siege_mgr,
                   info,
                   [{status_update, calc_status(notice, State)}]),
    logger:info("匹配结束，进入公示阶段", [], c_guild_siege_mgr, 370),
    erase(guild_siege_list),
    erase(guild_siege_punish_list),
    continue(notice, State#state{match_id = NewMatchId});
handle_info(timeout_submit, StateName, State) ->
    logger:error("非notice阶段匹配结果",
                 [],
                 c_guild_siege_mgr,
                 375),
    continue(StateName, State);
handle_info(init, _StateName, State) ->
    Now = date:unixtime(),
    case env:get(guild_siege_status) of
        {idle, _} ->
            IdleTime = get_idle_time(),
            Timeout = case IdleTime of
                          undefined -> undefined;
                          _ -> IdleTime * 1000
                      end,
            logger:info("上次关机时空闲状态，重新计算超时时间[~w]",
                        [Timeout],
                        c_guild_siege_mgr,
                        389),
            save_state(idle, 0),
            continue(idle,
                     State#state{ts = erlang:now(), timeout = Timeout,
                                 is_init = 1});
        {notice, EndTime} ->
            Timeout = max(2000, (EndTime - Now) * 1000),
            logger:info("上次关机时公告状态，重新计算超时时间[~w][~w]",
                        [EndTime, Timeout],
                        c_guild_siege_mgr,
                        394),
            save_state(notice, round(Timeout / 1000)),
            continue(notice,
                     State#state{ts = erlang:now(), timeout = Timeout,
                                 is_init = 1});
        {active, EndTime} ->
            Timeout = max(2000, (EndTime - Now) * 1000),
            logger:info("上次关机时活动状态，重新计算超时时间[~w][~w]",
                        [EndTime, Timeout],
                        c_guild_siege_mgr,
                        399),
            save_state(active, round(Timeout / 1000)),
            continue(active,
                     State#state{ts = erlang:now(), timeout = Timeout,
                                 is_init = 1});
        {ending, EndTime} ->
            Timeout = max(2000, (EndTime - Now) * 1000),
            logger:info("上次关机时结算状态，重新计算超时时间[~w][~w]",
                        [EndTime, Timeout],
                        c_guild_siege_mgr,
                        404),
            save_state(ending, round(Timeout / 1000)),
            continue(ending,
                     State#state{ts = erlang:now(), timeout = Timeout,
                                 is_init = 1});
        _ ->
            IdleTime = get_idle_time(),
            Timeout = case IdleTime of
                          undefined -> undefined;
                          _ -> IdleTime * 1000
                      end,
            logger:info("上次关机时无状态，重新计算超时时间[~w]",
                        [Timeout],
                        c_guild_siege_mgr,
                        413),
            save_state(idle, 0),
            continue(idle,
                     State#state{ts = erlang:now(), timeout = Timeout,
                                 is_init = 1})
    end;
handle_info(reset, idle, State = #state{}) ->
    case get(zero_reset_time) of
        OldRef when is_reference(OldRef) ->
            erlang:cancel_timer(OldRef);
        _ -> skip
    end,
    IdleTime = get_idle_time(),
    Timeout = case IdleTime of
                  undefined -> undefined;
                  _ -> IdleTime * 1000
              end,
    logger:info("凌晨检测公会攻城战,重新计算超时时间[~w]",
                [Timeout],
                c_guild_siege_mgr,
                429),
    save_state(idle, 0),
    Ref = erlang:send_after(date:next_diff(0, 0, 30) * 1000,
                            self(),
                            reset),
    put(zero_reset_time, Ref),
    continue(idle,
             State#state{ts = erlang:now(), timeout = Timeout});
handle_info({notice_round, Flag}, active, State) ->
    Fun = fun (#guild_siege_match{guild_match_list =
                                      GuildMatchList},
               _) ->
                  case GuildMatchList of
                      [#guild_siege_match_guild{guild_id = Gid1 = {_, P1, Z1},
                                                guild_name = Gname1,
                                                score = Score1},
                       #guild_siege_match_guild{guild_id = Gid2 = {_, P2, Z2},
                                                guild_name = Gname2,
                                                score = Score2}] ->
                          {Msg1, Msg2} = if Score1 > Score2 ->
                                                {notice:format(lang:get("攻城略地如火如荼，我方公会正在对抗~ts，总星数~ts-~ts暂时领先，大家继续加油啊{f"
                                                                        "ace_1,7}"),
                                                               [{string_2,
                                                                 2,
                                                                 Gname2},
                                                                {string_2,
                                                                 1,
                                                                 Score1},
                                                                {string_2,
                                                                 1,
                                                                 Score2}]),
                                                 notice:format(lang:get("攻城略地如火如荼，我方公会正在对抗~ts，总星数~ts-~ts暂时落后，大家继续加油啊{f"
                                                                        "ace_1,7}"),
                                                               [{string_2,
                                                                 2,
                                                                 Gname1},
                                                                {string_2,
                                                                 1,
                                                                 Score2},
                                                                {string_2,
                                                                 1,
                                                                 Score1}])};
                                            Score2 > Score1 ->
                                                {notice:format(lang:get("攻城略地如火如荼，我方公会正在对抗~ts，总星数~ts-~ts暂时落后，大家继续加油啊{f"
                                                                        "ace_1,7}"),
                                                               [{string_2,
                                                                 2,
                                                                 Gname2},
                                                                {string_2,
                                                                 1,
                                                                 Score1},
                                                                {string_2,
                                                                 1,
                                                                 Score2}]),
                                                 notice:format(lang:get("攻城略地如火如荼，我方公会正在对抗~ts，总星数~ts-~ts暂时领先，大家继续加油啊{f"
                                                                        "ace_1,7}"),
                                                               [{string_2,
                                                                 2,
                                                                 Gname1},
                                                                {string_2,
                                                                 1,
                                                                 Score2},
                                                                {string_2,
                                                                 1,
                                                                 Score1}])};
                                            true ->
                                                {notice:format(lang:get("攻城略地如火如荼，我方公会正在对抗~ts，总星数~ts-~ts暂时持平，大家继续加油啊{f"
                                                                        "ace_1,7}"),
                                                               [{string_2,
                                                                 2,
                                                                 Gname2},
                                                                {string_2,
                                                                 1,
                                                                 Score1},
                                                                {string_2,
                                                                 1,
                                                                 Score2}]),
                                                 notice:format(lang:get("攻城略地如火如荼，我方公会正在对抗~ts，总星数~ts-~ts暂时持平，大家继续加油啊{f"
                                                                        "ace_1,7}"),
                                                               [{string_2,
                                                                 2,
                                                                 Gname1},
                                                                {string_2,
                                                                 1,
                                                                 Score2},
                                                                {string_2,
                                                                 1,
                                                                 Score1}])}
                                         end,
                          big_world:cast(P1, Z1, guild, notice, [Gid1, Msg1]),
                          big_world:cast(P2, Z2, guild, notice, [Gid2, Msg2]),
                          ok;
                      _ -> ok
                  end
          end,
    ets:foldl(Fun, 1, guild_siege_match),
    case get(notice_ref) of
        OldNoticeRef when is_reference(OldNoticeRef) ->
            erlang:cancel_timer(OldNoticeRef);
        _ -> skip
    end,
    NoticeRef = erlang:send_after(3600 * 1000,
                                  self(),
                                  {notice_round, Flag + 1}),
    put(notice_ref, NoticeRef),
    continue(active, State);
handle_info({notice_round, _}, StateName, State) ->
    continue(StateName, State);
handle_info({set_round, Round}, StateName,
            State = #state{round = OldRound}) ->
    NewState = State#state{round = Round},
    logger:info("当前从[~w]轮跳转至[~w]轮",
                [OldRound, Round],
                c_guild_siege_mgr,
                479),
    env:save(guild_siege_round, Round),
    continue(StateName, NewState);
handle_info(gm_reset, _StateName,
            State = #state{round = Round}) ->
    put(guild_siege_list, []),
    big_world:cast(all,
                   guild_siege_mgr,
                   info,
                   [{cast_submit, Round}]),
    case get(match_timeout_ref) of
        OldRef when is_reference(OldRef) ->
            erlang:cancel_timer(OldRef);
        _ -> skip
    end,
    case get(notice_ref) of
        OldNoticeRef when is_reference(OldNoticeRef) ->
            erlang:cancel_timer(OldNoticeRef);
        _ -> skip
    end,
    Ref = erlang:send_after(5 * 1000,
                            self(),
                            timeout_submit),
    put(match_timeout_ref, Ref),
    NeedTime = 300,
    Timeout = NeedTime * 1000,
    NewState = State#state{ts = erlang:now(),
                           timeout = Timeout},
    logger:info("发起公会战攻城战匹配,持续[~w]秒",
                [NeedTime],
                c_guild_siege_mgr,
                501),
    save_state(notice, NeedTime),
    continue(notice, NewState);
handle_info(calc_time, active, State) ->
    Now = date:unixtime(),
    EndLine = date:unixtime(zero) + 84600,
    NeedTime = EndLine - Now,
    Timeout = NeedTime * 1000,
    logger:info("跨服攻城战重算活动进入战斗阶段, 持续[~w]秒",
                [NeedTime],
                c_guild_siege_mgr,
                512),
    NewState = State#state{ts = erlang:now(),
                           timeout = Timeout},
    big_world:cast(all,
                   guild_siege_mgr,
                   cast,
                   [{init_status, calc_status(active, NewState)}]),
    continue(active, NewState);
handle_info(_Info, StateName, State) ->
    logger:error("公会攻城战管理进程收到未处理的消息:~w",
                 [_Info],
                 c_guild_siege_mgr,
                 519),
    continue(StateName, State).

terminate(_Reason, _StateName, _State) ->
    logger:info("[~w] 正在关闭...",
                [c_guild_siege_mgr],
                c_guild_siege_mgr,
                523),
    logger:info("[~w] 关闭完成",
                [c_guild_siege_mgr],
                c_guild_siege_mgr,
                524),
    ok.

code_change(_OldVsn, StateName, State, _Extra) ->
    {ok, StateName, State}.

save_state(StateName, NeedTime) ->
    Now = date:unixtime(),
    env:save(guild_siege_status,
             {StateName, Now + NeedTime}).

idle(timeout, State = #state{round = Round}) ->
    clean(Round),
    put(guild_siege_list, []),
    put(guild_siege_punish_list, []),
    big_world:cast(all,
                   guild_siege_mgr,
                   info,
                   [{cast_submit, Round}]),
    case get(match_timeout_ref) of
        OldRef when is_reference(OldRef) ->
            erlang:cancel_timer(OldRef);
        _ -> skip
    end,
    Ref = erlang:send_after(5 * 1000,
                            self(),
                            timeout_submit),
    put(match_timeout_ref, Ref),
    NeedTime = 300,
    Timeout = NeedTime * 1000,
    NewState = State#state{ts = erlang:now(),
                           timeout = Timeout},
    logger:info("发起公会战攻城战匹配,持续[~w]秒",
                [NeedTime],
                c_guild_siege_mgr,
                553),
    save_state(notice, NeedTime),
    continue(notice, NewState);
idle(_Any, State) -> continue(idle, State).

notice(timeout, State) ->
    Now = date:unixtime(),
    Base = Now + (8 * 3600 + 1800),
    EndLine = date:unixtime(zero) + 84600,
    NeedTime = case Now >= EndLine of
                   true -> 5 * 60;
                   false -> min(Base, EndLine) - Now
               end,
    Timeout = NeedTime * 1000,
    logger:info("跨服攻城战活动进入战斗阶段, 持续[~w]秒",
                [NeedTime],
                c_guild_siege_mgr,
                571),
    NewState = State#state{ts = erlang:now(),
                           timeout = Timeout},
    big_world:cast(all,
                   guild_siege_mgr,
                   info,
                   [{status_update, calc_status(active, NewState)}]),
    save_state(active, NeedTime),
    case get(notice_ref) of
        OldNoticeRef when is_reference(OldNoticeRef) ->
            erlang:cancel_timer(OldNoticeRef);
        _ -> skip
    end,
    NoticeRef = erlang:send_after(3600 * 1000,
                                  self(),
                                  {notice_round, 1}),
    put(notice_ref, NoticeRef),
    continue(active, NewState);
notice(_Any, State) -> continue(notice, State).

active(timeout, State) ->
    NeedTime = 60,
    Timeout = NeedTime * 1000,
    logger:info("跨服攻城战活动进入结算, 持续[~w]秒",
                [NeedTime],
                c_guild_siege_mgr,
                590),
    NewState = State#state{ts = erlang:now(),
                           timeout = Timeout},
    stop_combat(),
    big_world:cast(all,
                   guild_siege_mgr,
                   info,
                   [{status_update, calc_status(ending, NewState)}]),
    save_state(ending, NeedTime),
    continue(ending, NewState);
active(_Any, State) -> continue(active, State).

ending(timeout, State = #state{round = Round}) ->
    IdleTime = get_idle_time(),
    Timeout = case IdleTime of
                  undefined -> undefined;
                  _ -> IdleTime * 1000
              end,
    NewState = State#state{ts = erlang:now(),
                           timeout = Timeout},
    calc_ending(),
    save_state(idle, 0),
    NewRound = case Round + 1 > 20 of
                   true -> 1;
                   _ -> Round + 1
               end,
    env:save(guild_siege_round, NewRound),
    logger:info("跨服攻城战[~w]轮下次开启时间:~w",
                [NewRound, Timeout],
                c_guild_siege_mgr,
                616),
    continue(idle, NewState#state{round = NewRound});
ending(_Any, State) -> continue(ending, State).

calc_status(StateName,
            #state{ts = Ts, timeout = Timeout, round = Round}) ->
    Now = date:unixtime(),
    Fun = fun (idle) -> {0, 0, Round};
              (notice) ->
                  {1, Now + util:time_left(Timeout, Ts) div 1000, Round};
              (active) ->
                  {2, Now + util:time_left(Timeout, Ts) div 1000, Round};
              (ending) -> {0, 0, Round}
          end,
    Fun(StateName).

get_idle_time() ->
    Today = date:day_of_the_week(date()),
    Now = date:unixtime(),
    case Today =:= 1 orelse Today =:= 5 of
        true ->
            StartTime = date:unixtime(zero) + (15 * 3600 + 3300),
            case Now > StartTime of
                true -> undefined;
                false -> max(1, StartTime - Now)
            end;
        false -> undefined
    end.

clean(Round) ->
    ets:delete_all_objects(guild_siege_match),
    dets:delete_all_objects(guild_siege_match),
    ets:delete_all_objects(guild_siege_match_guild),
    dets:delete_all_objects(guild_siege_match_guild),
    ets:delete_all_objects(guild_siege_role_log),
    dets:delete_all_objects(guild_siege_role_log),
    case Round =:= 1 of
        true ->
            ets:delete_all_objects(guild_siege_guild_rank),
            dets:delete_all_objects(guild_siege_guild_rank);
        _ -> ok
    end,
    ok.

update_castle(SiegeGuild =
                  #guild_siege_match_guild{castle_list = CastleList},
              NewCastle = #guild_siege_castle{id = CastleId}) ->
    NewCastleList = lists:keystore(CastleId,
                                   #guild_siege_castle.id,
                                   CastleList,
                                   NewCastle),
    SiegeGuild#guild_siege_match_guild{castle_list =
                                           NewCastleList}.

update_match_guild(SiegeMatch =
                       #guild_siege_match{guild_match_list = GuildList},
                   Guild = #guild_siege_match_guild{guild_id = GuildId}) ->
    case GuildList of
        [#guild_siege_match_guild{guild_id = GuildId}, _] ->
            NewGuildList = lists:keystore(GuildId,
                                          #guild_siege_match_guild.guild_id,
                                          GuildList,
                                          Guild),
            SiegeMatch#guild_siege_match{guild_match_list =
                                             NewGuildList};
        [_, #guild_siege_match_guild{guild_id = GuildId}] ->
            NewGuildList = lists:keystore(GuildId,
                                          #guild_siege_match_guild.guild_id,
                                          GuildList,
                                          Guild),
            SiegeMatch#guild_siege_match{guild_match_list =
                                             NewGuildList};
        _ -> SiegeMatch
    end.

do_combat_start(SiegeMatch = #guild_siege_match{match_id
                                                    = MatchId,
                                                guild_match_list = GuildList},
                GuildId, RoleId, RoleName, OtherOrder, Star) ->
    Flag = case GuildList of
               [Self = #guild_siege_match_guild{guild_id = GuildId},
                Other = #guild_siege_match_guild{}] ->
                   {true, Self, Other};
               [Other = #guild_siege_match_guild{},
                Self = #guild_siege_match_guild{guild_id = GuildId}] ->
                   {true, Self, Other};
               _ -> {false, lang:get("找不到公会匹配记录")}
           end,
    case Flag of
        {true,
         _GetSelf = #guild_siege_match_guild{guild_id = Sgid,
                                             guild_name = Sgname,
                                             castle_list = SelfCastleList,
                                             score = SelfScore},
         GetOther = #guild_siege_match_guild{guild_id = Tgid,
                                             guild_name = Tgname}} ->
            case check_other_castle(GetOther,
                                    OtherOrder,
                                    Star,
                                    SelfScore)
                of
                {false, Reason} -> {false, Reason};
                {true, Castle} ->
                    SOrder = case lists:keyfind(RoleId,
                                                #guild_siege_castle.id,
                                                SelfCastleList)
                                 of
                                 #guild_siege_castle{order = So} -> So;
                                 _ -> 0
                             end,
                    case start_combat(RoleId,
                                      RoleName,
                                      SOrder,
                                      Castle,
                                      MatchId,
                                      {Sgid, Sgname},
                                      {Tgid, Tgname},
                                      Star)
                        of
                        {true, NewCastle} ->
                            NewGetOther = update_castle(GetOther, NewCastle),
                            NewSiegeMatch = update_match_guild(SiegeMatch,
                                                               NewGetOther),
                            sync_insert_match(NewSiegeMatch, push),
                            true;
                        {false, Reason} -> {false, Reason}
                    end
            end;
        {false, Reason} -> {false, Reason}
    end.

check_other_castle(#guild_siege_match_guild{castle_list
                                                = CastleList},
                   OtherOrder, Star, SelfScore) ->
    case lists:keyfind(OtherOrder,
                       #guild_siege_castle.order,
                       CastleList)
        of
        #guild_siege_castle{is_combat = 1,
                            combat_name = CombatName} ->
            {false,
             notice:format(lang:get("当前城堡正在被~ts攻击，无法攻击"),
                           [{role_2, CombatName}])};
        Castle = #guild_siege_castle{order = Order,
                                     loss_star = LossStar} ->
            CheckFlag = case LossStar >= 3 of
                            true ->
                                case SelfScore >= 100 of
                                    true -> true;
                                    false ->
                                        {false, lang:get("当前城堡已经被击破三星，无法攻击")}
                                end;
                            false ->
                                case Star > LossStar of
                                    true -> true;
                                    _ ->
                                        {false,
                                         util:flist(lang:get("当前城堡只能选择大于~w星，无法攻击"),
                                                    [LossStar])}
                                end
                        end,
            case CheckFlag of
                true ->
                    case guild_siege_data:get_castle(Order) of
                        #{need_check := NeedCheck} ->
                            Result = guild_siege:do_check_combat(CastleList,
                                                                 NeedCheck),
                            case Result of
                                true -> {true, Castle};
                                {false, Reason} -> {false, Reason}
                            end;
                        _ -> {false, lang:get("不存在该城堡序号")}
                    end;
                {false, Reason} -> {false, Reason}
            end;
        _Err -> {false, lang:get("找不到目标")}
    end.

start_combat(Sid = {Rid1, Plat1, ZoneId1}, Sname,
             SOrder,
             Castle = #guild_siege_castle{id =
                                              {Rid2, Plat2, ZoneId2},
                                          order = TOrder},
             MatchId, {Sgid, Sgname}, {Tgid, Tgname}, Star) ->
    case big_world:call(Plat1,
                        ZoneId1,
                        role_query,
                        rec,
                        [by_id, Rid1, Plat1, ZoneId1, fighter_wrap])
        of
        {ok, #fighter_wrap{status = 2, s_event = _Event}} ->
            {false, lang:get("战斗中无法发起战斗")};
        {ok,
         #fighter_wrap{m_team =
                           #m_team{pid = Pid, status = Status}}}
            when is_pid(Pid) andalso Status =:= 1 ->
            {false, lang:get("暂离队员和无队伍才能发起战斗")};
        {ok, Fw = #fighter_wrap{s_event = Event}}
            when Event =:= 0 orelse Event =:= 2 ->
            case guild_siege:get_robot({Rid2, Plat2, ZoneId2}, Star)
                of
                {true, Robot} ->
                    StartArgs = #combat_start_args{ext_args =
                                                       [{guild_siege_args,
                                                         {MatchId,
                                                          SOrder,
                                                          TOrder,
                                                          Star,
                                                          Sgid,
                                                          Sgname,
                                                          Tgid,
                                                          Tgname}}]},
                    case combat_mgr:start_combat(112,
                                                 Fw,
                                                 [Robot],
                                                 StartArgs)
                        of
                        {ok, CombatPid} ->
                            NewCastle = Castle#guild_siege_castle{is_combat = 1,
                                                                  combat_pid =
                                                                      CombatPid,
                                                                  combat_id =
                                                                      Sid,
                                                                  combat_name =
                                                                      Sname},
                            {true, NewCastle};
                        _ -> {false, lang:get("发起战斗失败")}
                    end;
                {false, Reason} -> {false, Reason}
            end;
        _ -> {false, lang:get("当前状态无法发起战斗")}
    end.

set_guild_score(_Round, [], AllGuildList, PunishList) ->
    {PunishList, AllGuildList};
set_guild_score(Round,
                [{LevGroup,
                  G = #guild_siege_match_guild{guild_id = GuildId}}
                 | T],
                AllGuildList, PunishList) ->
    {IsPunish, Score, LastGuildId} = get_score(Round,
                                               GuildId),
    case IsPunish of
        1 ->
            set_guild_score(Round,
                            T,
                            AllGuildList,
                            [GuildId | PunishList]);
        _ ->
            NewG = G#guild_siege_match_guild{round = Round},
            NewAllGuildList = case lists:keyfind(LevGroup,
                                                 1,
                                                 AllGuildList)
                                  of
                                  {_, OldGuildSiegeList} ->
                                      NewGuildSiegeList = [{GuildId,
                                                            Score,
                                                            LastGuildId,
                                                            NewG}
                                                           | OldGuildSiegeList],
                                      lists:keystore(LevGroup,
                                                     1,
                                                     AllGuildList,
                                                     {LevGroup,
                                                      NewGuildSiegeList});
                                  _ ->
                                      NewGuildSiegeList = [{GuildId,
                                                            Score,
                                                            LastGuildId,
                                                            NewG}],
                                      lists:keystore(LevGroup,
                                                     1,
                                                     AllGuildList,
                                                     {LevGroup,
                                                      NewGuildSiegeList})
                              end,
            set_guild_score(Round, T, NewAllGuildList, PunishList)
    end;
set_guild_score(Round, [_ | T], AllGuildList,
                PunishList) ->
    set_guild_score(Round, T, AllGuildList, PunishList).

calc_ending() ->
    SiegeMatchList = ets:tab2list(guild_siege_match),
    lists:foreach(fun (SiegeMatch) ->
                          check_result(SiegeMatch)
                  end,
                  SiegeMatchList),
    ok.

stop_combat() ->
    SiegeMatchList = ets:tab2list(guild_siege_match),
    lists:foreach(fun (SiegeMatch =
                           #guild_siege_match{guild_match_list =
                                                  GuildMatchList}) ->
                          case GuildMatchList of
                              [SiegeGuild1 =
                                   #guild_siege_match_guild{castle_list =
                                                                CastleList1},
                               SiegeGuild2 =
                                   #guild_siege_match_guild{castle_list =
                                                                CastleList2}] ->
                                  CastleList = CastleList1 ++ CastleList2,
                                  lists:foreach(fun
                                                    (#guild_siege_castle{is_combat
                                                                             =
                                                                             1,
                                                                         combat_pid
                                                                             =
                                                                             CombatPid})
                                                        when
                                                          is_pid(CombatPid) ->
                                                        CombatPid ! stop;
                                                    (_) -> ok
                                                end,
                                                CastleList),
                                  NewCastleList1 =
                                      [Castle#guild_siege_castle{is_combat = 0,
                                                                 combat_pid =
                                                                     undefined,
                                                                 combat_id =
                                                                     {0, "", 0},
                                                                 combat_name =
                                                                     ""}
                                       || Castle <- CastleList1],
                                  NewCastleList2 =
                                      [Castle#guild_siege_castle{is_combat = 0,
                                                                 combat_pid =
                                                                     undefined,
                                                                 combat_id =
                                                                     {0, "", 0},
                                                                 combat_name =
                                                                     ""}
                                       || Castle <- CastleList2],
                                  NewSiegeGuild1 =
                                      SiegeGuild1#guild_siege_match_guild{castle_list
                                                                              =
                                                                              NewCastleList1},
                                  NewSiegeGuild2 =
                                      SiegeGuild2#guild_siege_match_guild{castle_list
                                                                              =
                                                                              NewCastleList2},
                                  NewSiegeMatch =
                                      SiegeMatch#guild_siege_match{guild_match_list
                                                                       =
                                                                       [NewSiegeGuild1,
                                                                        NewSiegeGuild2]},
                                  sync_insert_match(NewSiegeMatch, push),
                                  ok;
                              _ -> ok
                          end
                  end,
                  SiegeMatchList),
    ok.

check_result(SiegeMatch = #guild_siege_match{match_id =
                                                 MatchId,
                                             guild_match_list =
                                                 GuildMatchList}) ->
    case GuildMatchList of
        [#guild_siege_match_guild{guild_id = Gid1,
                                  guild_name = Gname1, score = Score1,
                                  score_time = Time1, atk_times = AtkTimes1},
         #guild_siege_match_guild{guild_id = Gid2,
                                  guild_name = Gname2, score = Score2,
                                  score_time = Time2, atk_times = AtkTimes2}] ->
            {WinGid, ResultData} = if Score1 > Score2 ->
                                          {Gid1,
                                           {{Gid1, Gname1, Score1, AtkTimes1},
                                            {Gid2, Gname2, Score2, AtkTimes2}}};
                                      Score2 > Score1 ->
                                          {Gid2,
                                           {{Gid2, Gname2, Score2, AtkTimes2},
                                            {Gid1, Gname1, Score1, AtkTimes1}}};
                                      true ->
                                          case Time1 =< Time2 of
                                              true ->
                                                  {Gid1,
                                                   {{Gid1,
                                                     Gname1,
                                                     Score1,
                                                     AtkTimes1},
                                                    {Gid2,
                                                     Gname2,
                                                     Score2,
                                                     AtkTimes2}}};
                                              _ ->
                                                  {Gid2,
                                                   {{Gid2,
                                                     Gname2,
                                                     Score2,
                                                     AtkTimes2},
                                                    {Gid1,
                                                     Gname1,
                                                     Score1,
                                                     AtkTimes1}}}
                                          end
                                   end,
            NewSiegeMatch = SiegeMatch#guild_siege_match{has_result
                                                             = 1,
                                                         win_guild_id = WinGid},
            cast_result(ResultData),
            sync_insert_match(NewSiegeMatch, push),
            ok;
        _ ->
            logger:error("无法判定胜负:~w",
                         [MatchId],
                         c_guild_siege_mgr,
                         878)
    end.

check_result_not_match([]) -> ok;
check_result_not_match([{Gid, _} | T]) ->
    logger:info("[~w]公会轮空", [Gid], c_guild_siege_mgr, 883),
    Log = {1, Gid, 0, {0, "", 0}, 0},
    NewRank = case lookup_rank(Gid) of
                  {true,
                   Rank = #guild_siege_guild_rank{score = OldAllScore,
                                                  all_times = OldAllTimes,
                                                  logs = OldLogs}} ->
                      NewAllScore = OldAllScore + 120,
                      NewAllTimes = OldAllTimes + 1,
                      NewLogs = [Log | OldLogs],
                      Rank#guild_siege_guild_rank{score = NewAllScore,
                                                  all_times = NewAllTimes,
                                                  last_guild_id = {0, "", 0},
                                                  logs = NewLogs};
                  _ ->
                      #guild_siege_guild_rank{guild_id = Gid, score = 120,
                                              all_times = 1,
                                              last_guild_id = {0, "", 0},
                                              logs = [Log]}
              end,
    insert_rank(NewRank),
    check_result_not_match(T).

check_result_punish([]) -> ok;
check_result_punish([GuildId = {_, P, Z} | T]) ->
    logger:info("公会~w惩罚，不参与匹配",
                [GuildId],
                c_guild_siege_mgr,
                899),
    Msg = lang:get("公会攻城战:上次比赛公会进攻0次，本次比赛停赛一次"),
    big_world:cast(P,
                   Z,
                   guild_mgr,
                   apply,
                   [async,
                    GuildId,
                    {guild_common,
                     sync_send_mail,
                     [#{content => Msg, from_name => lang:get("公会战议事厅")}]}]),
    case lookup_rank(GuildId) of
        {true, Rank} ->
            NewRank = Rank#guild_siege_guild_rank{punish_time = 0},
            insert_rank(NewRank);
        _ -> ok
    end,
    check_result_punish(T).

cast_result({{WinGid = {_, Wp, Wz},
              WinName,
              WinScore,
              WinAtkTimes},
             {LoseGid = {_, Lp, Lz},
              LoseName,
              LoseScore,
              LoseAtkTimes}}) ->
    WinLog = {1, WinGid, WinScore, LoseGid, LoseScore},
    LoseLog = {0, WinGid, WinScore, LoseGid, LoseScore},
    WinPunish = case WinAtkTimes of
                    0 ->
                        logger:info("公会[~w]被惩罚一次",
                                    [WinGid],
                                    c_guild_siege_mgr,
                                    919),
                        1;
                    _ -> 0
                end,
    LosePunish = case LoseAtkTimes of
                     0 ->
                         logger:info("公会[~w]被惩罚一次",
                                     [LoseGid],
                                     c_guild_siege_mgr,
                                     925),
                         1;
                     _ -> 0
                 end,
    logger:info("[~ts][~w]公会胜[~ts][~w]公会,比分[~w:~w]",
                [WinName,
                 WinGid,
                 LoseName,
                 LoseGid,
                 WinScore,
                 LoseScore],
                c_guild_siege_mgr,
                929),
    NewWinRank = case lookup_rank(WinGid) of
                     {true,
                      Rank1 = #guild_siege_guild_rank{score = OldWinAllScore,
                                                      logs = OldWinLog,
                                                      all_times =
                                                          OldWinAllTimes}} ->
                         NewWinAllScore = OldWinAllScore + 120,
                         NewWinLogs = [WinLog | OldWinLog],
                         NewWinAllTimes = OldWinAllTimes + 1,
                         Rank1#guild_siege_guild_rank{score = NewWinAllScore,
                                                      logs = NewWinLogs,
                                                      all_times =
                                                          NewWinAllTimes,
                                                      last_guild_id = LoseGid,
                                                      punish_time = WinPunish};
                     _ ->
                         #guild_siege_guild_rank{guild_id = WinGid, score = 120,
                                                 logs = [WinLog], all_times = 1,
                                                 last_guild_id = LoseGid,
                                                 punish_time = WinPunish}
                 end,
    NewLoseRank = case lookup_rank(LoseGid) of
                      {true,
                       Rank2 = #guild_siege_guild_rank{score = OldLoseAllScore,
                                                       logs = OldLoseLog,
                                                       all_times =
                                                           OldLoseAllTimes}} ->
                          NewLoseAllScore = OldLoseAllScore + 20,
                          NewLoseLogs = [LoseLog | OldLoseLog],
                          NewLoseAllTimes = OldLoseAllTimes + 1,
                          Rank2#guild_siege_guild_rank{score = NewLoseAllScore,
                                                       logs = NewLoseLogs,
                                                       all_times =
                                                           NewLoseAllTimes,
                                                       last_guild_id = WinGid,
                                                       punish_time =
                                                           LosePunish};
                      _ ->
                          #guild_siege_guild_rank{guild_id = LoseGid,
                                                  score = 20, logs = [LoseLog],
                                                  all_times = 1,
                                                  last_guild_id = WinGid,
                                                  punish_time = LosePunish}
                  end,
    insert_rank(NewWinRank),
    insert_rank(NewLoseRank),
    {WinItems1, WinAssets1} = case
                                  guild_siege_data:get_guild(1)
                                  of
                                  #{assets := WinAssets, base_id := WinBaseId,
                                    num := WinNum} ->
                                      {[{WinBaseId, WinNum}], WinAssets};
                                  _ -> {[], 0}
                              end,
    {LoseItems1, LoseAssets1} = case
                                    guild_siege_data:get_guild(0)
                                    of
                                    #{assets := LoseAssets,
                                      base_id := LoseBaseId, num := LoseNum} ->
                                        {[{LoseBaseId, LoseNum}], LoseAssets};
                                    _ -> {[], 0}
                                end,
    WinContent = case WinScore =:= LoseScore of
                     true ->
                         notice:format(lang:get("本次公会攻城战活动正式结束，双方总星数比分为~ts-~ts，由于~ts优先获得该星数，系统"
                                                "自动判定~ts获胜，获得~ts公会资金和~ts奖励"),
                                       [{string_2, 1, WinScore},
                                        {string_2, 1, LoseScore},
                                        {string_2, 2, WinName},
                                        {string_2, 2, WinName},
                                        {string_2, 1, WinAssets1},
                                        {item_2, WinItems1}]);
                     _ ->
                         notice:format(lang:get("本次公会攻城战活动正式结束，我方公会以~ts-~ts战胜~ts获得胜利，获得~ts公会资金"
                                                "和~ts奖励，这份荣耀属于~ts的每一个人"),
                                       [{string_2, 1, WinScore},
                                        {string_2, 1, LoseScore},
                                        {string_2, 2, LoseName},
                                        {string_2, 1, WinAssets1},
                                        {item_2, WinItems1},
                                        {string_2, 2, WinName}])
                 end,
    big_world:cast(Wp,
                   Wz,
                   guild_mgr,
                   apply,
                   [async,
                    WinGid,
                    {guild_common,
                     sync_send_mail,
                     [#{content => WinContent,
                        from_name => lang:get("公会战议事厅")}]}]),
    big_world:cast(Wp,
                   Wz,
                   guild_loot,
                   add,
                   [WinGid, WinItems1, lang:get("公会攻城战胜利")]),
    big_world:cast(Wp,
                   Wz,
                   guild_common,
                   add_assets,
                   [WinGid, {not_weekly, WinAssets1}]),
    big_world:cast(Wp,
                   Wz,
                   guild,
                   notice,
                   [WinGid, WinContent]),
    MailTitle = lang:get("公会攻城战结算"),
    MailContent =
        notice:format(lang:get("恭喜本公会~ts在本次公会攻城战中以~ts-~ts战胜敌方公会~ts，感谢您的英勇作战，请"
                               "查收奖励:"),
                      [{string_2, 2, WinName},
                       {string_2, 1, WinScore},
                       {string_2, 1, LoseScore},
                       {string_2, 2, LoseName}]),
    big_world:cast(Wp,
                   Wz,
                   guild_mgr,
                   apply,
                   [async,
                    WinGid,
                    {guild_siege_mgr,
                     send_result_mail,
                     [#{reward_type => 4, title => MailTitle,
                        content => MailContent, is_not_match => 0}]}]),
    LoseContent = case WinScore =:= LoseScore of
                      true ->
                          notice:format(lang:get("本次公会攻城战活动正式结束，双方总星数比分为~ts-~ts，由于~ts优先获得该星数，系统"
                                                 "自动判定~ts获胜，获得~ts公会资金和~ts奖励"),
                                        [{string_2, 1, WinScore},
                                         {string_2, 1, LoseScore},
                                         {string_2, 2, WinName},
                                         {string_2, 2, WinName},
                                         {string_2, 1, LoseAssets1},
                                         {item_2, LoseItems1}]);
                      _ ->
                          notice:format(lang:get("本次公会攻城战活动正式结束，我方公会以~ts-~ts遗憾战败于~ts，获得~ts公会资金和"
                                                 "~ts奖励，大家纷纷表示发愤图强，力争下次胜利"),
                                        [{string_2, 1, LoseScore},
                                         {string_2, 1, WinScore},
                                         {string_2, 2, WinName},
                                         {string_2, 1, LoseAssets1},
                                         {item_2, LoseItems1}])
                  end,
    big_world:cast(Lp,
                   Lz,
                   guild_mgr,
                   apply,
                   [async,
                    LoseGid,
                    {guild_common,
                     sync_send_mail,
                     [#{content => LoseContent,
                        from_name => lang:get("公会战议事厅")}]}]),
    big_world:cast(Lp,
                   Lz,
                   guild_loot,
                   add,
                   [LoseGid, LoseItems1, lang:get("公会攻城战失败")]),
    big_world:cast(Lp,
                   Lz,
                   guild_common,
                   add_assets,
                   [LoseGid, {not_weekly, LoseAssets1}]),
    big_world:cast(Lp,
                   Lz,
                   guild,
                   notice,
                   [LoseGid, LoseContent]),
    MailTitle2 = lang:get("公会攻城战结算"),
    MailContent2 =
        notice:format(lang:get("本公会~ts在本次公会攻城战中以~ts-~ts惜败敌方公会~ts，您的顽强作战给大家留下深"
                               "刻印象，请查收奖励:"),
                      [{string_2, 2, LoseName},
                       {string_2, 1, LoseScore},
                       {string_2, 1, WinScore},
                       {string_2, 2, WinName}]),
    big_world:cast(Lp,
                   Lz,
                   guild_mgr,
                   apply,
                   [async,
                    LoseGid,
                    {guild_siege_mgr,
                     send_result_mail,
                     [#{reward_type => 5, title => MailTitle2,
                        content => MailContent2, is_not_match => 0}]}]),
    ok.

get_score(1, _GuildId) -> {0, 0, {0, "", 0}};
get_score(_Round, GuildId) ->
    case lookup_rank(GuildId) of
        {true,
         #guild_siege_guild_rank{score = Score,
                                 last_guild_id = LastGuildId,
                                 punish_time = PunishTime}} ->
            case PunishTime > 0 of
                true -> {1, Score, LastGuildId};
                _ -> {0, Score, LastGuildId}
            end;
        _ -> {0, 0, {0, "", 0}}
    end.

split_match(MatchList, NotMatch) ->
    split_match(MatchList, NotMatch, []).

split_match([], [], SplitData) -> cast_match(SplitData);
split_match([], [{Gid = {_, Plat, Zone}, _} | T],
            SplitData) ->
    Dest = c_big_world:get_zone_mapping(Plat, Zone),
    SplitData1 = case lists:keyfind(Dest, 1, SplitData) of
                     {_, Gs, Not} ->
                         lists:keystore(Dest,
                                        1,
                                        SplitData,
                                        {Dest, Gs, [Gid | Not]});
                     _ ->
                         lists:keystore(Dest, 1, SplitData, {Dest, [], [Gid]})
                 end,
    split_match([], T, SplitData1);
split_match([{{_, Plat1, Zone1}, {_, Plat2, Zone2}, Gs}
             | T],
            NotMatch, SplitData) ->
    Dest1 = c_big_world:get_zone_mapping(Plat1, Zone1),
    SplitData1 = case lists:keyfind(Dest1, 1, SplitData) of
                     {_, Gs1, Not1} ->
                         NewGs1 = [Gs | Gs1],
                         lists:keystore(Dest1,
                                        1,
                                        SplitData,
                                        {Dest1, NewGs1, Not1});
                     _ ->
                         NewGs1 = [Gs],
                         lists:keystore(Dest1,
                                        1,
                                        SplitData,
                                        {Dest1, NewGs1, []})
                 end,
    Dest2 = c_big_world:get_zone_mapping(Plat2, Zone2),
    SplitData2 = case Dest1 =:= Dest2 of
                     true -> SplitData1;
                     _ ->
                         case lists:keyfind(Dest2, 1, SplitData1) of
                             {_, Gs2, Not2} ->
                                 NewGs2 = [Gs | Gs2],
                                 lists:keystore(Dest2,
                                                1,
                                                SplitData1,
                                                {Dest2, NewGs2, Not2});
                             _ ->
                                 NewGs2 = [Gs],
                                 lists:keystore(Dest2,
                                                1,
                                                SplitData1,
                                                {Dest2, NewGs2, []})
                         end
                 end,
    split_match(T, NotMatch, SplitData2).

cast_match([]) -> ok;
cast_match([{{Plat, Zone}, GsList, NotList} | T]) ->
    big_world:cast(Plat,
                   Zone,
                   guild_siege_mgr,
                   match_result,
                   [GsList, NotList]),
    cast_match(T).

match(_Round, MatchId, [], MatchList, Back) ->
    {MatchId, MatchList, Back};
match(Round, MatchId, [{LevGroup, GuildList} | T],
      MatchList, Back) ->
    SortGuildList = util:keys_sort([2], GuildList),
    {NewMatchId, AddMatch, AddBack} = do_match(Round,
                                               LevGroup,
                                               MatchId,
                                               SortGuildList,
                                               [],
                                               []),
    match(Round,
          NewMatchId,
          T,
          AddMatch ++ MatchList,
          AddBack ++ Back).

do_match(_Round, _LevGroup, MatchId, [], MatchList,
         BackList) ->
    {MatchId, MatchList, BackList};
do_match(_Round, _LevGroup, MatchId, [{Gid, _, _, Gs}],
         MatchList, BackList) ->
    {MatchId, MatchList, [{Gid, Gs} | BackList]};
do_match(Round, LevGroup, MatchId,
         [{Gid1, Score1, ConflictId, Gs1} | GuildList],
         MatchList, BackList) ->
    case Round of
        1 ->
            {Gid2, _, _, Gs2} = util:rand_list(GuildList),
            NewGuildList = lists:keydelete(Gid2, 1, GuildList),
            SiegeMatch = set_match(Round,
                                   MatchId,
                                   LevGroup,
                                   Gs1#guild_siege_match_guild{match_id =
                                                                   MatchId},
                                   Gs2#guild_siege_match_guild{match_id =
                                                                   MatchId}),
            do_match(Round,
                     LevGroup,
                     MatchId + 1,
                     NewGuildList,
                     [{Gid1, Gid2, SiegeMatch} | MatchList],
                     BackList);
        _ ->
            ChooseList = lists:keydelete(ConflictId, 1, GuildList),
            ChooseList1 = case ChooseList of
                              [] -> GuildList;
                              _ -> ChooseList
                          end,
            case calc_match({Gid1, Score1}, ChooseList1) of
                {true,
                 Gs2 = #guild_siege_match_guild{guild_id = Gid2}} ->
                    NewGuildList = lists:keydelete(Gid2, 1, GuildList),
                    SiegeMatch = set_match(Round,
                                           MatchId,
                                           LevGroup,
                                           Gs1#guild_siege_match_guild{match_id
                                                                           =
                                                                           MatchId},
                                           Gs2#guild_siege_match_guild{match_id
                                                                           =
                                                                           MatchId}),
                    do_match(Round,
                             LevGroup,
                             MatchId + 1,
                             NewGuildList,
                             [{Gid1, Gid2, SiegeMatch} | MatchList],
                             BackList);
                _ ->
                    logger:error("[~w][~w][~w]无法找到对手",
                                 [Gid1, Score1, ConflictId],
                                 c_guild_siege_mgr,
                                 1097),
                    do_match(Round,
                             LevGroup,
                             MatchId + 1,
                             GuildList,
                             MatchList,
                             BackList)
            end
    end.

calc_match({_G1, _}, [{_, _, _, Gs2}]) -> {true, Gs2};
calc_match({_G1, Score},
           [{_, Score, _, Gs2},
            {_, Score, _, Gs3},
            {_, Score, _, Gs4},
            {_, Score, _, Gs5}
            | _]) ->
    {true, util:rand_list([Gs2, Gs3, Gs4, Gs5])};
calc_match({_G1, Score},
           [{_, Score, _, Gs2},
            {_, Score, _, Gs3},
            {_, Score, _, Gs4}
            | _]) ->
    {true, util:rand_list([Gs2, Gs3, Gs4])};
calc_match({_G1, Score},
           [{_, Score, _, Gs2}, {_, Score, _, Gs3} | _]) ->
    {true, util:rand_list([Gs2, Gs3])};
calc_match({_G1, _}, [{_, _, _, Gs2} | _T]) ->
    {true, Gs2};
calc_match(_, List) ->
    logger:error("公会攻城战无法匹配:~w",
                 [List],
                 c_guild_siege_mgr,
                 1113),
    false.

set_match(Round, MatchId, LevGroup,
          Gs1 = #guild_siege_match_guild{guild_id = Gid1},
          Gs2 = #guild_siege_match_guild{guild_id = Gid2}) ->
    GuildIds = [Gid1, Gid2],
    SiegeMatch = #guild_siege_match{round = Round,
                                    match_id = MatchId, lev_group = LevGroup,
                                    guild_ids = GuildIds,
                                    guild_match_list = [Gs1, Gs2]},
    insert_match(SiegeMatch),
    SiegeMatch.

insert_match(SiegeMatch =
                 #guild_siege_match{guild_match_list = GsList}) ->
    ets:insert(guild_siege_match, SiegeMatch),
    dets:insert(guild_siege_match, SiegeMatch),
    insert_match_guild(GsList),
    ok;
insert_match(_) -> ok.

insert_rank(Rank = #guild_siege_guild_rank{}) ->
    ets:insert(guild_siege_guild_rank, Rank),
    dets:insert(guild_siege_guild_rank, Rank),
    ok;
insert_rank(_) -> ok.

insert_match_guild([]) -> ok;
insert_match_guild([G = #guild_siege_match_guild{}
                    | T]) ->
    ets:insert(guild_siege_match_guild, G),
    dets:insert(guild_siege_match_guild, G),
    insert_match_guild(T);
insert_match_guild([_ | T]) -> insert_match_guild(T).

sync_insert_match(SiegeMatch) ->
    sync_insert_match(SiegeMatch, not_push).

sync_insert_match(SiegeMatch =
                      #guild_siege_match{guild_match_list = GsList},
                  PushFlag) ->
    insert_match(SiegeMatch),
    DestList = get_match_dest(GsList),
    lists:foreach(fun ({P, Z}) ->
                          big_world:cast(P,
                                         Z,
                                         c_guild_siege_mgr,
                                         local_insert_match,
                                         [SiegeMatch, PushFlag])
                  end,
                  DestList),
    ok.

local_insert_match(SiegeMatch =
                       #guild_siege_match{guild_ids = GuildIds},
                   PushFlag) ->
    case PushFlag of
        push ->
            [guild:pack_cast(GuildId, 19110, {1})
             || GuildId <- GuildIds];
        _ -> skip
    end,
    insert_match(SiegeMatch),
    ok.

get_match_dest(GsList) -> get_match_dest(GsList, []).

get_match_dest([], DestList) -> DestList;
get_match_dest([#guild_siege_match_guild{guild_id =
                                             {_, P, Z}}
                | T],
               DestList) ->
    Dest = c_big_world:get_zone_mapping(P, Z),
    case lists:member(Dest, DestList) of
        true -> get_match_dest(T, DestList);
        false -> get_match_dest(T, [Dest | DestList])
    end.

insert_role_log(RoleId = {_, P, Z}, RoleName, AtkLog) ->
    case lookup_role_log(RoleId) of
        {true,
         Log = #guild_siege_role_log{atk_num = AtkNum,
                                     atk_log = AtkLogs}} ->
            NewAtkLogs = [AtkLog | AtkLogs],
            NewAtkNum = AtkNum + 1,
            NewLog = Log#guild_siege_role_log{atk_num = NewAtkNum,
                                              atk_log = NewAtkLogs},
            insert_role_log(NewLog),
            big_world:cast(P,
                           Z,
                           c_guild_siege_mgr,
                           insert_role_log,
                           [NewLog]),
            ok;
        null ->
            NewLog = #guild_siege_role_log{id = RoleId,
                                           name = RoleName, atk_num = 1,
                                           atk_log = [AtkLog]},
            insert_role_log(NewLog),
            big_world:cast(P,
                           Z,
                           c_guild_siege_mgr,
                           insert_role_log,
                           [NewLog]),
            ok;
        _Err ->
            logger:error("无法查询角色攻击记录:~w",
                         [_Err],
                         c_guild_siege_mgr,
                         1201),
            ok
    end.

insert_role_log(Log = #guild_siege_role_log{}) ->
    ets:insert(guild_siege_role_log, Log),
    dets:insert(guild_siege_role_log, Log),
    ok;
insert_role_log(_) -> ok.

update_atk(MatchId, SGid, SRoleId, SName, SOrder, TGid,
           TRoleId, TName, TOrder, IsWin, Star, AtkLog) ->
    case lookup_match(MatchId) of
        {true,
         SiegeMatch = #guild_siege_match{guild_match_list =
                                             GuildMatchList}} ->
            NewGuildMatchList = do_update_atk(MatchId,
                                              GuildMatchList,
                                              SGid,
                                              SRoleId,
                                              SName,
                                              SOrder,
                                              TGid,
                                              TRoleId,
                                              TName,
                                              TOrder,
                                              IsWin,
                                              Star,
                                              AtkLog),
            NewSiegeMatch =
                SiegeMatch#guild_siege_match{guild_match_list =
                                                 NewGuildMatchList},
            sync_insert_match(NewSiegeMatch, push),
            {ok, NewSiegeMatch};
        _ ->
            logger:error("无法找到[~w]匹配的战斗[~w][~w][~w][~w]",
                         [MatchId, SGid, SRoleId, TGid, TRoleId],
                         c_guild_siege_mgr,
                         1222),
            ok
    end.

do_update_atk(MatchId, GuildMatchList, SGid, SRoleId,
              SName, SOrder, TGid, TRoleId, TName, TOrder, IsWin,
              Star,
              AtkLog = #guild_siege_match_combat_log{combat_replay_id
                                                         = CombatReplayId}) ->
    GuildMatchList1 = case lists:keyfind(SGid,
                                         #guild_siege_match_guild.guild_id,
                                         GuildMatchList)
                          of
                          SSiegeGuild1 = #guild_siege_match_guild{castle_list =
                                                                      CastleList1,
                                                                  win_star_3 =
                                                                      WinStar3,
                                                                  win_star_2 =
                                                                      WinStar2,
                                                                  win_star_1 =
                                                                      WinStar1,
                                                                  atk_times =
                                                                      AtkTimes,
                                                                  win_times =
                                                                      WinTimes,
                                                                  score =
                                                                      OldScore,
                                                                  score_time =
                                                                      OldScoreTime,
                                                                  score_log =
                                                                      ScoreLog,
                                                                  logs = Logs,
                                                                  best_atk_data
                                                                      =
                                                                      BestAtkData,
                                                                  best_atk_id =
                                                                      BestAtkId,
                                                                  best_atk_name
                                                                      =
                                                                      BestAtkName,
                                                                  best_atk_combat_replay
                                                                      =
                                                                      BestAtkCombatReplay} ->
                              {NewWinStar3,
                               NewWinStar2,
                               NewWinStar1,
                               NewWinTimes} =
                                  case IsWin of
                                      1 ->
                                          case Star of
                                              3 ->
                                                  {WinStar3 + 1,
                                                   WinStar2,
                                                   WinStar1,
                                                   WinTimes + 1};
                                              2 ->
                                                  {WinStar3,
                                                   WinStar2 + 1,
                                                   WinStar1,
                                                   WinTimes + 1};
                                              _ ->
                                                  {WinStar3,
                                                   WinStar2,
                                                   WinStar1 + 1,
                                                   WinTimes + 1}
                                          end;
                                      _ ->
                                          {WinStar3,
                                           WinStar2,
                                           WinStar1,
                                           WinTimes}
                                  end,
                              NewScoreLog = case IsWin of
                                                1 ->
                                                    case
                                                        guild_siege_data:get_castle(TOrder)
                                                        of
                                                        #{type := 3} ->
                                                            NewStar = case
                                                                          lists:keyfind(TOrder,
                                                                                        1,
                                                                                        ScoreLog)
                                                                          of
                                                                          {_,
                                                                           OldStar} ->
                                                                              max(OldStar,
                                                                                  Star
                                                                                      *
                                                                                      2);
                                                                          _ ->
                                                                              Star
                                                                                  *
                                                                                  2
                                                                      end,
                                                            lists:keystore(TOrder,
                                                                           1,
                                                                           ScoreLog,
                                                                           {TOrder,
                                                                            NewStar});
                                                        _ ->
                                                            NewStar = case
                                                                          lists:keyfind(TOrder,
                                                                                        1,
                                                                                        ScoreLog)
                                                                          of
                                                                          {_,
                                                                           OldStar} ->
                                                                              max(OldStar,
                                                                                  Star);
                                                                          _ ->
                                                                              Star
                                                                      end,
                                                            lists:keystore(TOrder,
                                                                           1,
                                                                           ScoreLog,
                                                                           {TOrder,
                                                                            NewStar})
                                                    end;
                                                _ -> ScoreLog
                                            end,
                              NewScore = lists:sum([So
                                                    || {_, So} <- NewScoreLog]),
                              NewScoreTime = case NewScore =/= OldScore of
                                                 true -> date:unixtime();
                                                 _ -> OldScoreTime
                                             end,
                              {NewBestAtkData,
                               NewBestAtkId,
                               NewBestAtkName,
                               NewBestAtkCombatReplay} =
                                  case check_best_atk(IsWin,
                                                      BestAtkData,
                                                      Star,
                                                      SOrder,
                                                      TOrder)
                                      of
                                      {true, BestAtkData1} ->
                                          {BestAtkData1,
                                           SRoleId,
                                           SName,
                                           CombatReplayId};
                                      _ ->
                                          {BestAtkData,
                                           BestAtkId,
                                           BestAtkName,
                                           BestAtkCombatReplay}
                                  end,
                              SSiegeGuild2 =
                                  SSiegeGuild1#guild_siege_match_guild{win_star_3
                                                                           =
                                                                           NewWinStar3,
                                                                       win_star_2
                                                                           =
                                                                           NewWinStar2,
                                                                       win_star_1
                                                                           =
                                                                           NewWinStar1,
                                                                       atk_times
                                                                           =
                                                                           AtkTimes
                                                                               +
                                                                               1,
                                                                       win_times
                                                                           =
                                                                           NewWinTimes,
                                                                       score =
                                                                           NewScore,
                                                                       score_time
                                                                           =
                                                                           NewScoreTime,
                                                                       score_log
                                                                           =
                                                                           NewScoreLog,
                                                                       best_atk_data
                                                                           =
                                                                           NewBestAtkData,
                                                                       best_atk_id
                                                                           =
                                                                           NewBestAtkId,
                                                                       best_atk_name
                                                                           =
                                                                           NewBestAtkName,
                                                                       logs =
                                                                           [AtkLog
                                                                            | Logs],
                                                                       best_atk_combat_replay
                                                                           =
                                                                           NewBestAtkCombatReplay},
                              NewSSiegeGuild = case lists:keyfind(SRoleId,
                                                                  #guild_siege_castle.id,
                                                                  CastleList1)
                                                   of
                                                   false -> SSiegeGuild2;
                                                   Castle1 ->
                                                       NewCastle1 =
                                                           update_castle(atk,
                                                                         Castle1,
                                                                         IsWin,
                                                                         Star,
                                                                         AtkLog,
                                                                         SOrder),
                                                       NewCastleList1 =
                                                           lists:keystore(SRoleId,
                                                                          #guild_siege_castle.id,
                                                                          CastleList1,
                                                                          NewCastle1),
                                                       SSiegeGuild2#guild_siege_match_guild{castle_list
                                                                                                =
                                                                                                NewCastleList1}
                                               end,
                              lists:keystore(SGid,
                                             #guild_siege_match_guild.guild_id,
                                             GuildMatchList,
                                             NewSSiegeGuild);
                          _ -> GuildMatchList
                      end,
    GuildMatchList2 = case lists:keyfind(TGid,
                                         #guild_siege_match_guild.guild_id,
                                         GuildMatchList1)
                          of
                          SiegeGuild2 = #guild_siege_match_guild{castle_list =
                                                                     CastleList2,
                                                                 best_def_id =
                                                                     BestDefId,
                                                                 best_def_name =
                                                                     BestDefName,
                                                                 best_def_data =
                                                                     BestDefData,
                                                                 best_def_combat_replay
                                                                     =
                                                                     BestDefCombatReply} ->
                              case lists:keyfind(TRoleId,
                                                 #guild_siege_castle.id,
                                                 CastleList2)
                                  of
                                  false ->
                                      logger:error("找不到被攻击方城堡:~w,~w,~w",
                                                   [MatchId, SRoleId, TRoleId],
                                                   c_guild_siege_mgr,
                                                   1293),
                                      GuildMatchList1;
                                  Castle2 ->
                                      NewCastle2 = update_castle(def,
                                                                 Castle2,
                                                                 IsWin,
                                                                 Star,
                                                                 AtkLog,
                                                                 SOrder),
                                      {NewBestDefData,
                                       NewBestDefId,
                                       NewBestDefName,
                                       NewBestDefCombatReply} =
                                          case check_best_def(IsWin,
                                                              BestDefData,
                                                              NewCastle2)
                                              of
                                              {true, BestDefData1} ->
                                                  case
                                                      calc_best_def_play(NewCastle2)
                                                      of
                                                      {true,
                                                       CalcBestDefCombatReply} ->
                                                          {BestDefData1,
                                                           TRoleId,
                                                           TName,
                                                           CalcBestDefCombatReply};
                                                      _ ->
                                                          {BestDefData1,
                                                           TRoleId,
                                                           TName,
                                                           CombatReplayId}
                                                  end;
                                              _ ->
                                                  {BestDefData,
                                                   BestDefId,
                                                   BestDefName,
                                                   BestDefCombatReply}
                                          end,
                                      NewCastleList2 = lists:keystore(TRoleId,
                                                                      #guild_siege_castle.id,
                                                                      CastleList2,
                                                                      NewCastle2),
                                      NewCastleList3 = case
                                                           guild_siege_data:get_castle(TOrder)
                                                           of
                                                           #{type := 1} ->
                                                               [C#guild_siege_castle{can_look
                                                                                         =
                                                                                         1}
                                                                || C
                                                                       <- NewCastleList2];
                                                           _ -> NewCastleList2
                                                       end,
                                      NewSiegeGuild2 =
                                          SiegeGuild2#guild_siege_match_guild{castle_list
                                                                                  =
                                                                                  NewCastleList3,
                                                                              best_def_id
                                                                                  =
                                                                                  NewBestDefId,
                                                                              best_def_name
                                                                                  =
                                                                                  NewBestDefName,
                                                                              best_def_data
                                                                                  =
                                                                                  NewBestDefData,
                                                                              best_def_combat_replay
                                                                                  =
                                                                                  NewBestDefCombatReply},
                                      lists:keystore(TGid,
                                                     #guild_siege_match_guild.guild_id,
                                                     GuildMatchList1,
                                                     NewSiegeGuild2)
                              end;
                          _ ->
                              logger:error("找不到被攻击方城堡:~w,~w,~w",
                                           [MatchId, SRoleId, TRoleId],
                                           c_guild_siege_mgr,
                                           1320),
                              GuildMatchList1
                      end,
    GuildMatchList2.

calc_best_def_play(#guild_siege_castle{id = RoleId,
                                       castle_log = Logs}) ->
    DefLog = [{Star, SOrder - TOrder, Log}
              || Log = #guild_siege_match_combat_log{role_order_1 =
                                                         SOrder,
                                                     role_id_2 = RoleId2,
                                                     is_win = 0,
                                                     role_order_2 = TOrder,
                                                     star = Star}
                     <- Logs,
                 RoleId2 =:= RoleId],
    SortLog = util:keys_sort([2, 1], DefLog),
    case SortLog of
        [{_,
          _,
          #guild_siege_match_combat_log{combat_replay_id =
                                            CombatReplayId}}
         | _] ->
            {true, CombatReplayId};
        _ -> false
    end.

check_best_def(_IsWin = 0,
               {MaxDefWinTimes, DefMinOrder},
               #guild_siege_castle{def_win_times = DefWinTimes,
                                   def_win_min_order = DefWinMinOrder}) ->
    if DefWinTimes > MaxDefWinTimes ->
           {true, {DefWinTimes, DefWinMinOrder}};
       DefWinTimes =:= MaxDefWinTimes ->
           if DefMinOrder =:= 0 ->
                  {true, {DefWinTimes, DefWinMinOrder}};
              DefWinMinOrder =:= 0 -> false;
              DefMinOrder =:= DefWinMinOrder -> false;
              DefMinOrder > DefWinMinOrder ->
                  {true, {DefWinTimes, DefWinMinOrder}};
              true -> false
           end;
       true -> false
    end;
check_best_def(_, _, _) -> false.

check_best_atk(_Iswin = 1,
               {MaxStar, MaxRange, MaxOrder}, Star, SOrder, TOrder) ->
    Range = SOrder - TOrder,
    if Star > MaxStar -> {true, {Star, Range, SOrder}};
       Star =:= MaxStar ->
           if Range > MaxRange -> {true, {Star, Range, SOrder}};
              Range =:= MaxRange ->
                  case SOrder < MaxOrder of
                      true -> {true, {Star, Range, SOrder}};
                      _ -> false
                  end;
              true -> false
           end;
       true -> false
    end;
check_best_atk(_, _, _, _, _) -> false.

update_castle(atk,
              Castle = #guild_siege_castle{atk_times = AtkTimes,
                                           atk_win_times = AtkWinTimes,
                                           castle_log = CastleLog},
              IsWin, _Star, AtkLog, _SOrder) ->
    NewAtkTimes = AtkTimes + 1,
    NewAtkWinTimes = case IsWin of
                         1 -> AtkWinTimes + 1;
                         _ -> AtkWinTimes
                     end,
    NewCastleLog = [AtkLog | CastleLog],
    Castle#guild_siege_castle{atk_times = NewAtkTimes,
                              atk_win_times = NewAtkWinTimes,
                              castle_log = NewCastleLog};
update_castle(def,
              Castle = #guild_siege_castle{def_times = DefTimes,
                                           def_win_times = DefWinTimes,
                                           loss_star = LossStar,
                                           castle_log = CastleLog,
                                           def_win_min_order = DefWinMinOrder},
              IsWin, Star, AtkLog, SOrder) ->
    NewDefTimes = DefTimes + 1,
    NewCastle = case IsWin of
                    1 ->
                        NewLossStar = max(LossStar, Star),
                        NewCastleLog = [AtkLog | CastleLog],
                        Castle#guild_siege_castle{def_times = NewDefTimes,
                                                  loss_star = NewLossStar,
                                                  castle_log = NewCastleLog,
                                                  is_combat = 0,
                                                  combat_pid = undefined,
                                                  combat_id = {0, "", 0},
                                                  combat_name = "",
                                                  can_look = 1};
                    _ ->
                        NewDefWinTimes = DefWinTimes + 1,
                        NewCastleLog = [AtkLog | CastleLog],
                        NewDefWinOrder = case SOrder =/= 0 of
                                             true ->
                                                 case DefWinMinOrder =:= 0 of
                                                     true -> SOrder;
                                                     false ->
                                                         min(SOrder,
                                                             DefWinMinOrder)
                                                 end;
                                             false -> DefWinMinOrder
                                         end,
                        Castle#guild_siege_castle{def_times = NewDefTimes,
                                                  def_win_times =
                                                      NewDefWinTimes,
                                                  castle_log = NewCastleLog,
                                                  is_combat = 0,
                                                  combat_pid = undefined,
                                                  combat_id = {0, "", 0},
                                                  combat_name = "",
                                                  def_win_min_order =
                                                      NewDefWinOrder,
                                                  can_look = 1}
                end,
    NewCastle.

continue(StateName,
         #state{timeout = undefined} = State) ->
    {next_state, StateName, State, infinity};
continue(StateName,
         #state{ts = Ts, timeout = Timeout} = State) ->
    {next_state,
     StateName,
     State,
     util:time_left(Timeout, Ts)}.

continue(StateName, Reply,
         #state{timeout = undefined} = State) ->
    {reply, Reply, StateName, State, infinity};
continue(StateName, Reply,
         #state{ts = Ts, timeout = Timeout} = State) ->
    {reply,
     Reply,
     StateName,
     State,
     util:time_left(Timeout, Ts)}.

load_data(Mod) ->
    Fun1 = fun (Data1) ->
                   case do(Data1) of
                       {ok, NewData1} ->
                           ets:insert(guild_siege_match, NewData1),
                           continue;
                       _ -> {done, false}
                   end
           end,
    Flag1 = case dets:first(guild_siege_match) of
                '$end_of_table' ->
                    logger:info("没有公会战攻城战匹配数据需要加载",
                                [],
                                c_guild_siege_mgr,
                                1450),
                    [];
                _ -> dets:traverse(guild_siege_match, Fun1)
            end,
    Fun2 = fun (Data2) ->
                   case do_guild(Data2) of
                       {ok, NewData2} ->
                           ets:insert(guild_siege_match_guild, NewData2),
                           continue;
                       _ -> {done, false}
                   end
           end,
    Flag2 = case dets:first(guild_siege_match_guild) of
                '$end_of_table' ->
                    logger:info("没有公会战攻城战公会数据需要加载",
                                [],
                                c_guild_siege_mgr,
                                1466),
                    [];
                _ -> dets:traverse(guild_siege_match_guild, Fun2)
            end,
    Flag3 = case Mod of
                center ->
                    Fun3 = fun (Data3) ->
                                   case do_rank(Data3) of
                                       {ok, NewData3} ->
                                           ets:insert(guild_siege_guild_rank,
                                                      NewData3),
                                           continue;
                                       _ -> {done, false}
                                   end
                           end,
                    case dets:first(guild_siege_guild_rank) of
                        '$end_of_table' ->
                            logger:info("没有公会战攻城战排行数据需要加载",
                                        [],
                                        c_guild_siege_mgr,
                                        1484),
                            [];
                        _ -> dets:traverse(guild_siege_guild_rank, Fun3)
                    end;
                _ -> []
            end,
    Fun4 = fun (Data4) ->
                   case do_role_log(Data4) of
                       {ok, NewData4} ->
                           ets:insert(guild_siege_role_log, NewData4),
                           continue;
                       _ -> {done, false}
                   end
           end,
    Flag4 = case dets:first(guild_siege_role_log) of
                '$end_of_table' ->
                    logger:info("没有公会战攻城战个人数据需要加载",
                                [],
                                c_guild_siege_mgr,
                                1503),
                    [];
                _ -> dets:traverse(guild_siege_role_log, Fun4)
            end,
    case Flag1 =:= [] andalso
             Flag2 =:= [] andalso Flag3 =:= [] andalso Flag4 =:= []
        of
        true -> [];
        _ -> {false, load_err}
    end.

do_rank({guild_siege_guild_rank,
         Ver = 1,
         GuildId,
         Score,
         Logs,
         WinTimes,
         AllTimes,
         LastGuildId}) ->
    PunishTime = 0,
    do_rank({guild_siege_guild_rank,
             Ver + 1,
             GuildId,
             Score,
             Logs,
             WinTimes,
             AllTimes,
             LastGuildId,
             PunishTime});
do_rank(GuildRank = #guild_siege_guild_rank{ver = 2}) ->
    {ok, GuildRank};
do_rank(_Err) ->
    logger:error("无法转换排行数据:~w",
                 [_Err],
                 c_guild_siege_mgr,
                 1520),
    false.

do(SiegeMatch = #guild_siege_match{ver = 1,
                                   guild_match_list = GuildMatchList}) ->
    case do_guild_list(GuildMatchList, []) of
        {true, NewGuildMatchList} ->
            {ok,
             SiegeMatch#guild_siege_match{guild_match_list =
                                              NewGuildMatchList}};
        _ -> false
    end;
do(_Err) ->
    logger:error("无法转换匹配数据:~w",
                 [_Err],
                 c_guild_siege_mgr,
                 1532),
    false.

do_guild_list([], List) -> {true, List};
do_guild_list([H | T], List) ->
    case do_guild(H) of
        {ok, NewH} -> do_guild_list(T, [NewH | List]);
        _ -> false
    end.

do_guild(SiegeGuild = #guild_siege_match_guild{ver = 1,
                                               castle_list = CastleList,
                                               logs = LogList}) ->
    case do_castle_list(CastleList, []) of
        {true, NewCastleList} ->
            case do_log_list(LogList, []) of
                {true, NewLogList} ->
                    {ok,
                     SiegeGuild#guild_siege_match_guild{castle_list =
                                                            NewCastleList,
                                                        logs = NewLogList}};
                _ -> false
            end;
        _ -> false
    end;
do_guild(_Err) ->
    logger:error("无法转换匹配公会数据:~w",
                 [_Err],
                 c_guild_siege_mgr,
                 1557),
    false.

do_castle_list([], List) -> {true, List};
do_castle_list([H | T], List) ->
    case do_castle(H) of
        {ok, NewH} -> do_castle_list(T, [NewH | List]);
        _ -> false
    end.

do_castle(Castle = #guild_siege_castle{ver = 1,
                                       is_combat = _IsCombat,
                                       castle_log = LogList}) ->
    case do_log_list(LogList, []) of
        {true, NewLogList} ->
            NewCastle = Castle#guild_siege_castle{is_combat = 0,
                                                  combat_pid = undefined,
                                                  combat_id = {0, "", 0},
                                                  combat_name = "",
                                                  castle_log = NewLogList},
            {ok, NewCastle};
        _ -> false
    end;
do_castle(_Err) ->
    logger:error("无法转换城堡数据:~w",
                 [_Err],
                 c_guild_siege_mgr,
                 1578),
    false.

do_role_log(RoleLog = #guild_siege_role_log{ver = 1,
                                            atk_log = AtkLog}) ->
    case do_log_list(AtkLog, []) of
        {true, NewAtkLog} ->
            NewRoleLog = RoleLog#guild_siege_role_log{atk_log =
                                                          NewAtkLog},
            {ok, NewRoleLog};
        _ -> false
    end;
do_role_log(_Err) ->
    logger:error("无法转换角色参与数据:~w",
                 [_Err],
                 c_guild_siege_mgr,
                 1591),
    false.

do_log_list([], List) -> {true, List};
do_log_list([H | T], List) ->
    case do_log(H) of
        {ok, NewH} -> do_log_list(T, [NewH | List]);
        _ -> false
    end.

do_log({guild_siege_match_combat_log,
        Ver = 1,
        Time,
        Star,
        GuildId1,
        GuildName1,
        RoleId1,
        RoleName1,
        RoleOrder1,
        GuildId2,
        GuildName2,
        RoleId2,
        RoleName2,
        RoleOrder2,
        IsWin,
        CombatReplayId}) ->
    NewVer = Ver + 1,
    RoleLev1 = 0,
    RoleLev2 = 0,
    do_log({guild_siege_match_combat_log,
            NewVer,
            Time,
            Star,
            GuildId1,
            GuildName1,
            RoleId1,
            RoleName1,
            RoleOrder1,
            GuildId2,
            GuildName2,
            RoleId2,
            RoleName2,
            RoleOrder2,
            IsWin,
            CombatReplayId,
            RoleLev1,
            RoleLev2});
do_log(CombatLog = #guild_siege_match_combat_log{ver =
                                                     2}) ->
    {ok, CombatLog};
do_log(_Err) ->
    logger:error("无法转换日志数据:~w",
                 [_Err],
                 c_guild_siege_mgr,
                 1612),
    false.

