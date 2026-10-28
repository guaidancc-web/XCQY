-file("src/mod/guild/guild_dragon_mgr.erl", 1).

-module(guild_dragon_mgr).

-author("jia").

-behaviour(gen_fsm).

-export([start_link/0]).

-export([idle/2,
         ready/2,
         notice/2,
         active_1/2,
         active_2/2,
         active_3/2,
         reward/2]).

-export([init/1,
         handle_event/3,
         handle_sync_event/4,
         handle_info/3,
         terminate/3,
         code_change/4]).

-export([cast/1,
         call/1,
         get_state_code/1,
         get_state/0,
         get_person_point_rank/0,
         get_person_point_rank/1,
         get_guild_point_rank/0,
         get_guild_point_rank/1,
         get_dragon_role/1,
         get_dragon_guild/1,
         join_role/1,
         join_guild/1,
         get_local_robot/1,
         combat_over/1,
         get_role_index/1,
         reload/0,
         gm/1]).

-record(state,
        {ts = erlang:now(),
         timeout = 0,
         map_info = [],
         unit_info = [],
         scale = 1,
         ready_info = [],
         timer_ready_reward,
         player_barrage_ref,
         guild_barrage_ref,
         boss_start_time = 0,
         boss_end_time = 0}).

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

-file("src/mod/guild/guild_dragon_mgr.erl", 85).

-file("inc/guild_dragon.hrl", 1).

-author("jia").

-record(guild_dragon_role,
        {ver = 2,
         rid = {0, "", 0},
         map_pid = 0 :: pid(),
         name = "",
         lev = 0,
         sex = 0,
         classes = 0,
         looks = [],
         guild_id = {0, "", 0},
         guild_name = "",
         history = [],
         person_point = 0,
         rewards = [],
         update_time = 0,
         total_person_point = 0,
         challenge_msg_list = [],
         challenge_time = 0,
         loot_status = 0,
         loot_time = 0,
         looted_time = 0,
         max_rank = 0,
         honor_id = 0,
         pre_honor_id = 0,
         sign = 0,
         total_num = 0,
         sys_barrage = 1,
         ply_barrage = 1,
         barrage_time = 0,
         rank_index = 0,
         looted_num = 0,
         is_in_map = 0}).

-record(guild_dragon_history,
        {time = 0, point = 0, rewards = [], rank_index = 0}).

-record(guild_dragon_challenge_msg,
        {target_type = 0,
         target_id = {0, "", 0},
         msg = "",
         add_time = 0}).

-record(guild_dragon_guild,
        {ver = 1,
         guild_id = {0, "", 0},
         guild_name = "",
         lev = 0,
         leader_name = "",
         guild_point = 0,
         update_time = 0,
         rewards = [],
         max_rank = 0,
         history = []}).

-record(guild_dragon_fighter,
        {ver = 1,
         id = {0, "", 0},
         formation = 1,
         formation_lev = 1,
         guards = [],
         first_pet = 0,
         first_pet_base_id = 0}).

-file("src/mod/guild/guild_dragon_mgr.erl", 86).

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

-file("src/mod/guild/guild_dragon_mgr.erl", 87).

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

-file("src/mod/guild/guild_dragon_mgr.erl", 88).

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

-file("src/mod/guild/guild_dragon_mgr.erl", 89).

-file("inc/robot.hrl", 1).

-record(robot_role,
        {ver = 4,
         id = {0, "", 0} :: tuple(),
         name = "" :: list(),
         sex = 0 :: 0..1,
         classes = 0 :: 0..4,
         lev = 0 :: non_neg_integer(),
         fc = 0,
         face = 0,
         ai_id = 0,
         skills = [],
         talents = [],
         pet,
         backup_pets = [],
         guard,
         slave = [],
         attr :: undefined | tuple(),
         looks = [],
         time = 0,
         m_formation,
         pet_fc = 0,
         all_fc = 0,
         cup = 1000,
         m_lev_break}).

-record(robot_role_index,
        {id = {0, "", 0} :: tuple(),
         sex = 0 :: 0..1,
         classes = 0 :: 0..4,
         lev = 0 :: non_neg_integer(),
         fc = 0,
         pet_fc = 0,
         cup = 1000,
         all_fc = 0,
         time = 0}).

-file("src/mod/guild/guild_dragon_mgr.erl", 90).

-file("inc/arena.hrl", 1).

-record(m_arena,
        {ver = 1,
         cd_time = 0 :: non_neg_integer(),
         acc_num = 0 :: non_neg_integer(),
         cup = 1000 :: non_neg_integer(),
         roll_time = 0,
         roll_id = 0,
         roll_graph = []}).

-record(arena_role,
        {id = {0, "", 0} :: tuple(),
         ver = 6,
         name = "" :: bitstring(),
         win = 0 :: non_neg_integer(),
         acc_num = 0,
         sex = 0 :: 0..1,
         classes = 0 :: 0..4,
         lev = 0 :: non_neg_integer(),
         last_time = 0 :: non_neg_integer(),
         is_robot = 0 :: 0..1,
         cup = 0,
         next_log_id = 1,
         log = [],
         win_list = [],
         win_ratio = 0,
         day_time_flag = 0,
         enemy = [],
         day_win = 0,
         day_lost = 0,
         def_acc_num = 0,
         def_win = 0,
         max_cup = 1000,
         acc_sword_num = 0,
         acc_mage_num = 0,
         acc_archer_num = 0,
         acc_orc_num = 0,
         acc_devine_num = 0,
         acc_moon_num = 0,
         acc_templar_num = 0,
         win_sword = 0,
         win_mage = 0,
         win_archer = 0,
         win_orc = 0,
         win_devine = 0,
         win_moon = 0,
         win_templar = 0,
         init_def = 0,
         formation = 1,
         formation_lev = 1,
         guards = [],
         last_win_role}).

-record(arena_enemy,
        {order = 0,
         role_id = {0, "", 0},
         is_robot = 0,
         classes = 0,
         lev = 0,
         sex = 0,
         cup = 0,
         soul = 1}).

-record(arena_log,
        {log_id = 1,
         s_role_id = {0, "", 0} :: tuple(),
         s_name = "" :: list(),
         result = 0 :: 0..1,
         t_role_id = {0, "", 0} :: tuple(),
         t_name = "" :: list(),
         time = 0 :: non_neg_integer(),
         s_cup = 0,
         t_cup = 0,
         s_cup_change = 0,
         t_cup_change = 0,
         feedback = 0}).

-record(arena_role_index,
        {id = {0, "", 0},
         lev = 0,
         cup = 0,
         time = 0,
         day_time_flag = 0,
         day_win = 0,
         day_lost = 0,
         win_list = [],
         win_ratio = 0}).

-record(arena_robot,
        {id = {0, "robot", 0},
         lev = 0,
         name = "",
         classes = 0,
         sex = 0,
         cup = 0}).

-record(arena_graph,
        {id = 1,
         base_id = 0,
         num = 0,
         status = 0,
         quality = 0}).

-record(arena_graph_base,
        {id = 1,
         base_id = 0,
         num = 0,
         quality = 0,
         name = "",
         sex = 0,
         classes = 0,
         lev_low = 0,
         lev_high = 0,
         ratio = 0,
         times = 1,
         order_list = []}).

-file("src/mod/guild/guild_dragon_mgr.erl", 91).

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

-file("src/mod/guild/guild_dragon_mgr.erl", 92).

-file("inc/formation.hrl", 1).

-record(m_formation,
        {id = 1, lev = 1, pos = 1, forms = [], team_form = []}).

-record(formation, {id = 0, lev = 0, exp = 0}).

-record(formation_data,
        {id = 0,
         type = 1,
         lev = 0,
         max_lev = 1,
         name = "",
         pos_desc = [],
         attr_1 = [],
         attr_2 = [],
         attr_3 = [],
         attr_4 = [],
         attr_5 = [],
         pet_attr = [],
         strong_restrain = [],
         weak_restrain = [],
         next_exp = 0,
         need_item = [],
         item_id = 0}).

-file("src/mod/guild/guild_dragon_mgr.erl", 93).

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

-file("src/mod/guild/guild_dragon_mgr.erl", 94).

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

-file("src/mod/guild/guild_dragon_mgr.erl", 95).

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

-file("src/mod/guild/guild_dragon_mgr.erl", 96).

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

-file("src/mod/guild/guild_dragon_mgr.erl", 97).

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

-file("src/mod/guild/guild_dragon_mgr.erl", 98).

-file("/usr/local/lib/erlang/lib/stdlib-2.1/include/"
      "ms_transform.hrl",
      1).

-file("src/mod/guild/guild_dragon_mgr.erl", 99).

-file("inc/looks.hrl", 1).

-file("src/mod/guild/guild_dragon_mgr.erl", 100).

start_link() ->
    gen_fsm:start_link({local, guild_dragon_mgr},
                       guild_dragon_mgr,
                       [],
                       []).

init([]) ->
    logger:info("公会魔龙挑战开始启动...", [], guild_dragon_mgr, 104),
    process_flag(trap_exit, true),
    dets:open_file(guild_dragon_role,
                   [{file, "./dets/guild_dragon_role.dets"},
                    {keypos, #guild_dragon_role.rid}]),
    ets:new(guild_dragon_role,
            [set,
             named_table,
             public,
             {keypos, #guild_dragon_role.rid}]),
    dets:open_file(guild_dragon_rank,
                   [{file, "./dets/guild_dragon_rank.dets"},
                    {keypos, #guild_dragon_role.rank_index}]),
    ets:new(guild_dragon_rank,
            [set,
             named_table,
             public,
             {keypos, #guild_dragon_role.rank_index}]),
    dets:open_file(guild_dragon_guild,
                   [{file, "./dets/guild_dragon_guild.dets"},
                    {keypos, #guild_dragon_guild.guild_id}]),
    ets:new(guild_dragon_guild,
            [set,
             named_table,
             public,
             {keypos, #guild_dragon_guild.guild_id}]),
    ets:new(guild_dragon_fighter,
            [set,
             named_table,
             public,
             {keypos, #guild_dragon_fighter.id}]),
    load_data(),
    load_fighter(),
    {StateName, Tt, TimeStart} = get_state(),
    Timeout = Tt * 1000,
    State = #state{ts = erlang:now(), timeout = Timeout},
    State1 = case StateName of
                 _ when StateName =/= idle ->
                     {MapInfo, UnitInfo, ReadyInfo} = create_maps(StateName),
                     update_rank_role(),
                     State#state{map_info = MapInfo, unit_info = UnitInfo,
                                 ready_info = ReadyInfo};
                 _ -> State
             end,
    NewState = case StateName of
                   idle ->
                       Scale = 1,
                       State1#state{scale = Scale};
                   ready ->
                       ReadyRef = erlang:send_after(60 * 1000,
                                                    self(),
                                                    ready_reward),
                       Scale = 1,
                       State1#state{timer_ready_reward = ReadyRef,
                                    scale = Scale};
                   notice ->
                       Scale = 1,
                       State1#state{scale = Scale};
                   active_1 ->
                       PlayerRef = erlang:send_after(3 * 60 * 1000,
                                                     self(),
                                                     barrage_play),
                       GuildRef = erlang:send_after(4 * 60 * 1000,
                                                    self(),
                                                    barrage_guild),
                       Scale = 1,
                       EndTime = 8 * 60 + 8 * 60 + 9 * 60,
                       RandomTime = util:rand(EndTime, EndTime + 10 * 60),
                       BossEndTime = TimeStart + RandomTime,
                       State1#state{player_barrage_ref = PlayerRef,
                                    guild_barrage_ref = GuildRef, scale = Scale,
                                    boss_start_time = TimeStart,
                                    boss_end_time = BossEndTime};
                   active_2 ->
                       PlayerRef = erlang:send_after(3 * 60 * 1000,
                                                     self(),
                                                     barrage_play),
                       GuildRef = erlang:send_after(4 * 60 * 1000,
                                                    self(),
                                                    barrage_guild),
                       Scale = 1.5,
                       EndTime = 8 * 60 + 9 * 60,
                       RandomTime = util:rand(EndTime, EndTime + 10 * 60),
                       BossEndTime = TimeStart + RandomTime,
                       State1#state{player_barrage_ref = PlayerRef,
                                    guild_barrage_ref = GuildRef, scale = Scale,
                                    boss_start_time = TimeStart - 8 * 60,
                                    boss_end_time = BossEndTime};
                   active_3 ->
                       PlayerRef = erlang:send_after(3 * 60 * 1000,
                                                     self(),
                                                     barrage_play),
                       GuildRef = erlang:send_after(4 * 60 * 1000,
                                                    self(),
                                                    barrage_guild),
                       Scale = 2,
                       EndTime = 9 * 60,
                       RandomTime = util:rand(EndTime, EndTime + 10 * 60),
                       BossEndTime = TimeStart + RandomTime,
                       State1#state{player_barrage_ref = PlayerRef,
                                    guild_barrage_ref = GuildRef, scale = Scale,
                                    boss_start_time =
                                        TimeStart - 8 * 60 - 8 * 60,
                                    boss_end_time = BossEndTime};
                   reward ->
                       Scale = 1,
                       State1#state{scale = Scale};
                   _ ->
                       Scale = 1,
                       State1#state{scale = Scale}
               end,
    logger:info("公会魔龙挑战启动完成 state_name: ~w, timeout: ~w",
                [StateName, Timeout],
                guild_dragon_mgr,
                174),
    {ok, StateName, NewState, Timeout}.

idle(timeout, State) ->
    {StateName, Tt, _} = get_state(),
    Ref = erlang:send_after(60 * 1000,
                            self(),
                            ready_reward),
    NewState = case StateName of
                   idle ->
                       case 1 of
                           1 ->
                               {MapInfo, UnitInfo, ReadyInfo} =
                                   create_maps(ready),
                               update_rank_role(),
                               init_data(),
                               Msg =
                                   notice:format(lang:get("~ts将在~ts后开始，大家赶紧去报名争夺公会荣耀吧{face_1,1}"),
                                                 [{string_2,
                                                   1,
                                                   lang:get("巨龙宝藏")},
                                                  {string_2,
                                                   1,
                                                   lang:get("5分钟")}]),
                               notice:cast(all, 8, Msg),
                               State#state{timer_ready_reward = Ref,
                                           map_info = MapInfo,
                                           unit_info = UnitInfo,
                                           ts = erlang:now(),
                                           timeout = 5 * 60 * 1000,
                                           ready_info = ReadyInfo};
                           _ ->
                               State#state{ts = erlang:now(),
                                           timeout = Tt * 1000}
                       end;
                   ready ->
                       {MapInfo, UnitInfo, ReadyInfo} = create_maps(ready),
                       update_rank_role(),
                       init_data(),
                       Msg =
                           notice:format(lang:get("~ts将在~ts后开始，大家赶紧去报名争夺公会荣耀吧{face_1,1}"),
                                         [{string_2, 1, lang:get("巨龙宝藏")},
                                          {string_2, 1, lang:get("5分钟")}]),
                       notice:cast(all, 8, Msg),
                       State#state{timer_ready_reward = Ref,
                                   map_info = MapInfo, unit_info = UnitInfo,
                                   ts = erlang:now(), timeout = 5 * 60 * 1000,
                                   ready_info = ReadyInfo};
                   _ -> State#state{ts = erlang:now(), timeout = Tt * 1000}
               end,
    NewStateName = case StateName of
                       ready ->
                           role_group:pack_send(world,
                                                20501,
                                                {get_state_code(ready),
                                                 date:unixtime(),
                                                 date:unixtime() + 5 * 60,
                                                 0,
                                                 0}),
                           ready;
                       _ ->
                           case 1 of
                               1 ->
                                   role_group:pack_send(world,
                                                        20501,
                                                        {get_state_code(ready),
                                                         date:unixtime(),
                                                         date:unixtime() +
                                                             5 * 60,
                                                         0,
                                                         0}),
                                   ready;
                               _ -> idle
                           end
                   end,
    continue(NewStateName, NewState).

ready(timeout,
      State = #state{map_info = MapInfo,
                     timer_ready_reward = Ref}) ->
    stop_timer(Ref),
    Msg =
        notice:format(lang:get("~ts开始啦，大家快去巨龙宝藏夺取宝物{face_1,1}"),
                      [{string_2, 1, lang:get("巨龙宝藏")}]),
    notice:cast(all, 8, Msg),
    role_group:pack_send(world,
                         20501,
                         {get_state_code(notice),
                          date:unixtime(),
                          date:unixtime() + 5,
                          0,
                          0}),
    [{MapId, _} | _] = MapInfo,
    all_enter_map(MapId),
    RefPlayBarrage = erlang:send_after(3 * 60 * 1000,
                                       self(),
                                       barrage_play),
    RefGuildBarrage = erlang:send_after(4 * 60 * 1000,
                                        self(),
                                        barrage_guild),
    NewState = State#state{player_barrage_ref =
                               RefPlayBarrage,
                           guild_barrage_ref = RefGuildBarrage,
                           timer_ready_reward = undefind, ts = erlang:now(),
                           timeout = 5 * 1000, scale = 1},
    continue(notice, NewState).

notice(timeout,
       State = #state{map_info = MapInfo, unit_info = UnitList,
                      ready_info = ReadyInfo}) ->
    [{MapId, _} | _] = MapInfo,
    del_unit(UnitList),
    create_units({54, MapId},
                 [{66021, 838, 1640},
                  {66022, 1300, 1119},
                  {66023, 400, 843}],
                 []),
    UnitInfo = create_units({54, MapId},
                            [{32011, 1432, 414}],
                            []),
    clear_maps(ReadyInfo),
    BossStartTime = date:unixtime(),
    EndTime = 8 * 60 + 8 * 60 + 9 * 60,
    RandomTime = util:rand(EndTime, EndTime + 10 * 60),
    BossEndTime = BossStartTime + RandomTime,
    NewState = State#state{ts = erlang:now(),
                           timeout = 8 * 60 * 1000, unit_info = UnitInfo,
                           boss_start_time = BossStartTime,
                           boss_end_time = BossEndTime, ready_info = []},
    role_group:pack_send(world,
                         20501,
                         {get_state_code(active_1),
                          date:unixtime(),
                          date:unixtime() + 8 * 60,
                          BossStartTime,
                          BossEndTime}),
    continue(active_1, NewState).

active_1(timeout,
         State = #state{unit_info = OldUnitList,
                        map_info = [{MapId, _}],
                        boss_start_time = BossStartTime,
                        boss_end_time = BossEndTime}) ->
    Msg = notice:format(lang:get("巨龙已经到了第二阶段，此时挑战可以获得~ts！"),
                        [{string_2, 1, lang:get("1.5倍龙币")}]),
    notice:cast(all, 8, Msg),
    del_unit(OldUnitList),
    BarrageMsg = util:flist("<color='#FAF0E6'>~ts</color>",
                            [lang:get("号外号外！巨龙变得虚弱了，此时挑战可获得1.5倍龙币")]),
    send_barrage(1, 1, BarrageMsg),
    UnitList = create_units({54, MapId},
                            [{32012, 1432, 414}],
                            []),
    role_group:pack_send(world,
                         20501,
                         {get_state_code(active_2),
                          date:unixtime(),
                          date:unixtime() + 8 * 60,
                          BossStartTime,
                          BossEndTime}),
    NewState = State#state{ts = erlang:now(),
                           timeout = 8 * 60 * 1000, scale = 1.5,
                           unit_info = UnitList},
    continue(active_2, NewState).

active_2(timeout,
         State = #state{unit_info = OldUnitList,
                        map_info = [{MapId, _}],
                        boss_start_time = BossStartTime,
                        boss_end_time = BossEndTime}) ->
    Msg = notice:format(lang:get("巨龙已经到了第三阶段，此时挑战可以获得~ts！"),
                        [{string_2, 1, lang:get("2倍龙币")}]),
    notice:cast(all, 8, Msg),
    role_group:pack_send(world,
                         20501,
                         {get_state_code(active_3),
                          date:unixtime(),
                          date:unixtime() + 9 * 60,
                          BossStartTime,
                          BossEndTime}),
    BarrageMsg = util:flist("<color='#FAF0E6'>~ts</color>",
                            [lang:get("号外号外！巨龙变得虚弱了，此时挑战可获得2倍龙币")]),
    send_barrage(1, 1, BarrageMsg),
    del_unit(OldUnitList),
    UnitList = create_units({54, MapId},
                            [{32013, 1432, 414}],
                            []),
    NewState = State#state{ts = erlang:now(),
                           timeout = 9 * 60 * 1000, scale = 2,
                           unit_info = UnitList},
    continue(active_3, NewState).

active_3(timeout,
         State = #state{unit_info = OldUnitList,
                        player_barrage_ref = PlayRef,
                        guild_barrage_ref = GuildRef}) ->
    stop_timer([PlayRef, GuildRef]),
    stop_fighting(),
    del_unit(OldUnitList),
    role_group:pack_send(world,
                         20501,
                         {get_state_code(reward),
                          date:unixtime(),
                          date:unixtime() + 3,
                          0,
                          0}),
    NewState = State#state{ts = erlang:now(),
                           timeout = 3 * 1000, unit_info = [],
                           player_barrage_ref = undefind,
                           guild_barrage_ref = undefind, boss_start_time = 0,
                           boss_end_time = 0},
    continue(reward, NewState).

reward(timeout, State = #state{map_info = MapInfo}) ->
    {StateName, Tt, TimeStart} = get_state(),
    Timeout = Tt * 1000,
    ets:delete_all_objects(guild_dragon_rank),
    send_reward(),
    all_leave(),
    clear_maps(MapInfo),
    NewState = State#state{ts = erlang:now(),
                           timeout = Timeout, map_info = [], unit_info = [],
                           boss_start_time = 0, boss_end_time = 0},
    role_group:pack_send(world,
                         20501,
                         {get_state_code(StateName),
                          TimeStart,
                          date:unixtime() + Tt,
                          0,
                          0}),
    continue(idle, NewState).

continue(StateName,
         State = #state{timeout = infinity}) ->
    {next_state, StateName, State, infinity};
continue(StateName,
         State = #state{ts = Ts, timeout = TimeOut}) ->
    {next_state,
     StateName,
     State,
     util:time_left(TimeOut, Ts)}.

continue(Reply, StateName,
         State = #state{timeout = infinity}) ->
    {reply, Reply, StateName, State, infinity};
continue(Reply, StateName,
         State = #state{ts = Ts, timeout = TimeOut}) ->
    {reply,
     Reply,
     StateName,
     State,
     util:time_left(TimeOut, Ts)}.

handle_event({join_role, Args = #{is_guild := IsGuild}},
             StateName, State) ->
    join_role(Args),
    case IsGuild of
        1 ->
            #{guild_id := GuildID} = Args,
            join_guild(GuildID);
        _ -> ok
    end,
    continue(StateName, State);
handle_event({role_leave, Rid}, StateName, State) ->
    case get_dragon_role(Rid) of
        {ok, DragonRole = #guild_dragon_role{}} ->
            save_dragon_role(DragonRole#guild_dragon_role{is_in_map
                                                              = 0});
        _ -> ok
    end,
    continue(StateName, State);
handle_event({combat_over, Args = #{type := 1}},
             StateName, State = #state{scale = Scale}) ->
    Now = date:unixtime(),
    #{rid := Rid, total_dmg := TotalDmg, round := Round,
      lev := Lev, sex := Sex, classes := Classes} =
        Args,
    case get_dragon_role(Rid) of
        {ok,
         DragonRole = #guild_dragon_role{person_point = Point,
                                         total_person_point = TotalPoint,
                                         challenge_msg_list = CMsgList,
                                         guild_id = GuildID,
                                         guild_name = GuildName,
                                         name = RoleName, rewards = Rewards}} ->
            AddPoint = round(TotalDmg / 1000 * Scale),
            PersonList = fetch_reward(Lev, Sex, Classes, 1, 1),
            PersonList2 = [{item_type:special_id(BaseID), Bind, Num}
                           || {BaseID, Bind, Num, _} <- PersonList],
            CastList1 = [{item_type:special_id(BaseID), Bind, Num}
                         || {BaseID, Bind, Num, 1} <- PersonList],
            Msg = notice:format(lang:get("~ts获得~ts~ts"),
                                [{string_2, 5, lang:get("挑战巨龙")},
                                 {string_2, 5, AddPoint},
                                 {assets_2, 90054}]),
            CMsg = #guild_dragon_challenge_msg{target_type = 1,
                                               msg = Msg, add_time = Now},
            NewCMsgList = [CMsg | CMsgList],
            NewDragonRole =
                DragonRole#guild_dragon_role{total_person_point =
                                                 TotalPoint + AddPoint,
                                             rewards = Rewards ++ PersonList2,
                                             challenge_msg_list = NewCMsgList,
                                             person_point = Point + AddPoint,
                                             challenge_time = Now + 3 * 60},
            save_dragon_role(NewDragonRole),
            case get_dragon_guild(GuildID) of
                {ok,
                 DG = #guild_dragon_guild{guild_point = GuildPoint,
                                          rewards = GuildRewards}} ->
                    {WorldLev, _} = world_lev:get_world_lev(),
                    GuildList = fetch_reward(WorldLev, Sex, Classes, 2, 1),
                    GuildList2 = [{BaseID, Bind, Num}
                                  || {BaseID, Bind, Num, _} <- GuildList],
                    CastList2 = [{BaseID, Bind, Num}
                                 || {BaseID, Bind, Num, 1} <- GuildList],
                    case CastList2 of
                        [_ | _] -> cast_msg(CastList2, GuildName, 4);
                        _ -> ok
                    end,
                    NewDG = DG#guild_dragon_guild{guild_point =
                                                      GuildPoint + AddPoint,
                                                  update_time = Now,
                                                  rewards =
                                                      GuildRewards ++
                                                          GuildList2},
                    save_dragon_guild(NewDG);
                _ -> ok
            end,
            IsLast = case StateName of
                         active_3 -> 1;
                         _ -> 0
                     end,
            DragonArgs = #{type => 1, is_last => IsLast,
                           total_dmg => TotalDmg, round => Round,
                           add_point => AddPoint, scale => Scale,
                           person_item => PersonList2, guild_items => []},
            role:apply(async,
                       Rid,
                       {guild_dragon_role,
                        callback,
                        [{combat_over, DragonArgs}]}),
            case CastList1 of
                [_ | _] -> cast_msg(CastList1, RoleName, 1);
                _ -> ok
            end,
            case AddPoint >= 1000 of
                true ->
                    CMsg2 =
                        notice:format(lang:get("惊天动地，勇士~ts挑战巨龙竟然获得了~ts龙币{face_1,108}"),
                                      [{role_2, RoleName},
                                       {string_2, 5, AddPoint}]),
                    BarrageMsg =
                        util:flist(lang:get("<color='#FAF0E6'>惊天动地，勇士</color><color='#ffff"
                                            "00'>~ts</color><color='#FAF0E6'>挑战巨龙竟然获得了</co"
                                            "lor><color='#ffff00'>~ts</color><color='#FAF0"
                                            "E6'>龙币</color>"),
                                   [RoleName, integer_to_list(AddPoint)]),
                    send_barrage(1, 1, BarrageMsg),
                    notice:cast(all, 5, CMsg2);
                _ -> ok
            end;
        _ -> ok
    end,
    continue(StateName, State);
handle_event({combat_over, Args = #{type := 2}},
             StateName, State) ->
    Now = date:unixtime(),
    #{type := 2, atk_id := AtkID, def_id := DefID,
      round := Round, result := Result} =
        Args,
    AtkDR = case get_dragon_role(AtkID) of
                {ok, R1 = #guild_dragon_role{}} -> R1;
                _ -> #guild_dragon_role{rid = AtkID}
            end,
    DefDR = case get_dragon_role(DefID) of
                {ok, R2 = #guild_dragon_role{}} -> R2;
                _ -> #guild_dragon_role{rid = DefID}
            end,
    #guild_dragon_role{total_person_point = TotalPoint,
                       rid = AtkID, person_point = AtkPoint,
                       guild_id = AtkGuildID, name = AtkName,
                       challenge_msg_list = AtkCMsgList} =
        AtkDR,
    #guild_dragon_role{rid = DefID, person_point = DefPoint,
                       guild_id = DefGuildID, name = DefName,
                       challenge_msg_list = DefCMsgList} =
        DefDR,
    {AddPoint, AtkWin} = case Result of
                             10 -> {max(0, round(DefPoint * 100 / 1000)), 1};
                             11 -> {max(0, round(DefPoint * 20 / 1000)), 0};
                             _ -> {0, 0}
                         end,
    case get_dragon_guild(AtkGuildID) of
        {ok,
         AtkDG = #guild_dragon_guild{guild_point =
                                         AtkGuildPoint}} ->
            NewAtkGuild = AtkDG#guild_dragon_guild{guild_point =
                                                       AtkGuildPoint + AddPoint,
                                                   update_time = Now},
            save_dragon_guild(NewAtkGuild);
        _ -> ok
    end,
    case get_dragon_guild(DefGuildID) of
        {ok,
         DefDG = #guild_dragon_guild{guild_point =
                                         DefGuildPoint}} ->
            NewDefGuild = DefDG#guild_dragon_guild{guild_point =
                                                       DefGuildPoint -
                                                           AddPoint},
            save_dragon_guild(NewDefGuild);
        _ -> ok
    end,
    AtkMsg = case AtkWin of
                 1 ->
                     notice:format(lang:get("成功抢夺~ts~ts~ts"),
                                   [{role_2, DefName},
                                    {string_2, 5, AddPoint},
                                    {assets_2, 90054}]);
                 _ ->
                     notice:format(lang:get("抢夺~ts失败，获得~ts~ts"),
                                   [{role_2, DefName},
                                    {string_2, 5, AddPoint},
                                    {assets_2, 90054}])
             end,
    AtkCMsg = #guild_dragon_challenge_msg{target_type = 2,
                                          msg = AtkMsg, add_time = Now,
                                          target_id = DefID},
    NewAtkCMsgList = [AtkCMsg | AtkCMsgList],
    {DefMsg, ReducePoint} = case AtkWin of
                                1 ->
                                    {notice:format(lang:get("被~ts掠夺~ts~ts"),
                                                   [{role_2, AtkName},
                                                    {string_2, 5, AddPoint},
                                                    {assets_2, 90054}]),
                                     AddPoint};
                                _ ->
                                    {notice:format(lang:get("您击退了来自~ts的掠夺！"),
                                                   [{role_2, AtkName}]),
                                     0}
                            end,
    DefCMsg = #guild_dragon_challenge_msg{target_type = 3,
                                          msg = DefMsg, add_time = Now,
                                          target_id = AtkID},
    NewDefCMsgList = [DefCMsg | DefCMsgList],
    NewAtkDR = AtkDR#guild_dragon_role{total_person_point =
                                           TotalPoint + AddPoint,
                                       challenge_msg_list = NewAtkCMsgList,
                                       person_point = AtkPoint + AddPoint,
                                       update_time = Now,
                                       loot_time = Now + 2 * 60},
    NewDefDR = DefDR#guild_dragon_role{loot_status = 0,
                                       challenge_msg_list = NewDefCMsgList,
                                       person_point = DefPoint - ReducePoint},
    PersonalList = get_person_point_rank(20),
    PersonalList2 = [ok
                     || {_, #guild_dragon_role{rid = BRid}} <- PersonalList,
                        BRid =:= DefID],
    case length(PersonalList2) > 0 andalso
             AtkWin =:= 1 andalso AddPoint > 50
        of
        true ->
            {BarrageMsg, BarrageMsg2} = case util:rand(1, 3) of
                                            1 ->
                                                M1 =
                                                    util:flist(lang:get("<color='#FAF0E6'>难以置信，</color><color='#ffff00"
                                                                        "'>~ts</color><color='#FAF0E6'>竟然被</color><col"
                                                                        "or='#ffff00'>~ts</color><color='#FAF0E6'>掠夺了<"
                                                                        "/color><color='#ffff00'>~ts</color><color='#F"
                                                                        "AF0E6'>龙币</color>"),
                                                               [DefName,
                                                                AtkName,
                                                                integer_to_list(AddPoint)]),
                                                M2 =
                                                    notice:format(lang:get("难以置信，~ts竟然被~ts掠夺了~ts龙币"),
                                                                  [{role_2,
                                                                    DefName},
                                                                   {role_2,
                                                                    AtkName},
                                                                   {string_2,
                                                                    5,
                                                                    AddPoint}]),
                                                {M1, M2};
                                            2 ->
                                                M1 =
                                                    util:flist(lang:get("<color='#FAF0E6'>偷袭成功，</color><color='#ffff00"
                                                                        "'>~ts</color><color='#FAF0E6'>竟然抢走了</color><c"
                                                                        "olor='#ffff00'>~ts</color><color='#FAF0E6'></"
                                                                        "color><color='#ffff00'>~ts</color><color='#FA"
                                                                        "F0E6'>龙币</color>"),
                                                               [AtkName,
                                                                DefName,
                                                                integer_to_list(AddPoint)]),
                                                M2 =
                                                    notice:format(lang:get("偷袭成功，~ts竟然抢走了~ts~ts龙币"),
                                                                  [{role_2,
                                                                    AtkName},
                                                                   {role_2,
                                                                    DefName},
                                                                   {string_2,
                                                                    5,
                                                                    AddPoint}]),
                                                {M1, M2};
                                            _ ->
                                                M1 =
                                                    util:flist(lang:get("<color='#FAF0E6'>机智的</color><color='#ffff00'>"
                                                                        "~ts</color><color='#FAF0E6'>见缝插针掠夺了</color><c"
                                                                        "olor='#ffff00'>~ts</color><color='#FAF0E6'></"
                                                                        "color><color='#ffff00'>~ts</color><color='#FA"
                                                                        "F0E6'>龙币</color>"),
                                                               [AtkName,
                                                                DefName,
                                                                integer_to_list(AddPoint)]),
                                                M2 =
                                                    notice:format(lang:get("机智的~ts见缝插针掠夺了~ts~ts龙币"),
                                                                  [{role_2,
                                                                    AtkName},
                                                                   {role_2,
                                                                    DefName},
                                                                   {string_2,
                                                                    5,
                                                                    AddPoint}]),
                                                {M1, M2}
                                        end,
            send_barrage(1, 1, BarrageMsg),
            notice:cast(all, 4, BarrageMsg2),
            ok;
        _ -> ok
    end,
    save_dragon_role(NewAtkDR),
    save_dragon_role(NewDefDR),
    DefGuildName = case get_dragon_guild(DefGuildID) of
                       {ok, #guild_dragon_guild{guild_name = DefName}} ->
                           DefName;
                       _ -> lang:get("暂无公会")
                   end,
    AtkArgs = #{type => 2, target_name => DefName,
                target_guild => DefGuildName, is_win => AtkWin,
                round => Round, loot_point => AddPoint},
    role:apply(async,
               AtkID,
               {guild_dragon_role,
                callback,
                [{combat_over, AtkArgs}]}),
    role:apply(async,
               DefID,
               {guild_dragon_role, callback, [push_info]}),
    case AtkWin of
        1 ->
            SendMsg =
                notice:format(lang:get("勇士~ts你发起了掠夺，你损失了~ts~ts{face_1,12}"),
                              [{role_2, AtkName},
                               {string_2, 5, AddPoint},
                               {assets_2, 90054}]),
            notice:send(DefID, 1, SendMsg);
        _ -> ok
    end,
    case AddPoint >= 1000 andalso AtkWin =:= 1 of
        true ->
            Msg =
                notice:format(lang:get("万万没想到，在勇士~ts奋力挑战巨龙时，勇士~ts在他身上掠夺走了~ts~ts{face_"
                                       "1,26}"),
                              [{role_2, DefName},
                               {role_2, AtkName},
                               {string_2, 5, AddPoint},
                               {assets_2, 90054}]),
            notice:cast(all, 4, Msg),
            ok;
        _ -> ok
    end,
    continue(StateName, State);
handle_event(reload, StateName,
             State = #state{guild_barrage_ref = OGuildRef,
                            player_barrage_ref = OPlayRef,
                            timer_ready_reward = ORewardRef}) ->
    logger:info("收到重载公会魔龙挑战消息", [], guild_dragon_mgr, 514),
    stop_timer([OGuildRef, OPlayRef, ORewardRef]),
    {StateName1, TimeOut, TimeStart} = get_state(),
    Scale = case StateName1 of
                active_1 -> 1;
                active_2 -> 1.5;
                active_3 -> 2;
                reward -> 2;
                _ -> 1
            end,
    {MapInfo, UnitInfo, ReadyInfo} = case StateName of
                                         idle when StateName1 =/= idle ->
                                             create_maps(StateName1);
                                         _ ->
                                             case StateName1 of
                                                 idle ->
                                                     #state{map_info =
                                                                OldMapInfo} =
                                                         State,
                                                     all_leave(),
                                                     clear_maps(OldMapInfo),
                                                     {[], [], []};
                                                 _ ->
                                                     {State#state.map_info,
                                                      State#state.unit_info,
                                                      State#state.ready_info}
                                             end
                                     end,
    {RewardRef,
     PlayRef,
     GuildRef,
     BossStartTime,
     BossEndTime} =
        case StateName1 of
            ready -> {60, undefind, undefind, 0, 0};
            active_1 ->
                EndTime = 8 * 60 + 8 * 60 + 9 * 60,
                RandomTime = util:rand(EndTime, EndTime + 10 * 60),
                BossEndTime1 = TimeStart + RandomTime,
                {undefind,
                 erlang:send_after(3 * 60 * 1000, self(), barrage_play),
                 erlang:send_after(4 * 60 * 1000, self(), barrage_guild),
                 TimeStart,
                 BossEndTime1};
            active_2 ->
                EndTime = 8 * 60 + 9 * 60,
                RandomTime = util:rand(EndTime, EndTime + 10 * 60),
                BossEndTime1 = TimeStart + RandomTime,
                {undefind,
                 erlang:send_after(3 * 60 * 1000, self(), barrage_play),
                 erlang:send_after(4 * 60 * 1000, self(), barrage_guild),
                 TimeStart - 8 * 60,
                 BossEndTime1};
            active_3 ->
                EndTime = 9 * 60,
                RandomTime = util:rand(EndTime, EndTime + 10 * 60),
                BossEndTime1 = TimeStart + RandomTime,
                {undefind,
                 erlang:send_after(3 * 60 * 1000, self(), barrage_play),
                 erlang:send_after(4 * 60 * 1000, self(), barrage_guild),
                 TimeStart - 8 * 60 - 8 * 60,
                 BossEndTime1};
            _ -> {undefind, undefind, undefind, 0, 0}
        end,
    role_group:pack_send(world,
                         20501,
                         {get_state_code(StateName1),
                          TimeStart,
                          TimeStart + TimeOut,
                          BossStartTime,
                          BossEndTime}),
    NewState = State#state{player_barrage_ref = PlayRef,
                           guild_barrage_ref = GuildRef,
                           timer_ready_reward = RewardRef, ts = erlang:now(),
                           timeout = TimeOut * 1000, scale = Scale,
                           map_info = MapInfo, unit_info = UnitInfo,
                           ready_info = ReadyInfo,
                           boss_start_time = BossStartTime,
                           boss_end_time = BossEndTime},
    continue(StateName1, NewState);
handle_event({update_dragon_role, DragonRole},
             StateName, State) ->
    case DragonRole of
        #guild_dragon_role{} -> save_dragon_role(DragonRole);
        _ -> ok
    end,
    continue(StateName, State);
handle_event({update_dragon_guild, DragonGuild},
             StateName, State) ->
    case DragonGuild of
        #guild_dragon_guild{} -> save_dragon_guild(DragonGuild);
        _ -> ok
    end,
    continue(StateName, State);
handle_event({push_state, all}, StateName,
             State = #state{ts = {M, S, _}, timeout = TimeOut,
                            boss_start_time = BossTimeStart,
                            boss_end_time = BossEndTime}) ->
    TimeStart = M * 1000000 + S,
    Data = {get_state_code(StateName),
            TimeStart,
            TimeStart + TimeOut,
            BossTimeStart,
            BossEndTime},
    role_group:pack_send(world, 20501, Data),
    continue(StateName, State);
handle_event({push_state, Rid}, StateName,
             State = #state{ts = {M, S, _}, timeout = TimeOut,
                            boss_start_time = BossStartTime,
                            boss_end_time = BossEndTime})
    when is_tuple(Rid) ->
    TimeStart = M * 1000000 + S,
    Data = {get_state_code(StateName),
            TimeStart,
            TimeStart + round(TimeOut / 1000),
            BossStartTime,
            BossEndTime},
    role:pack_send(Rid, 20501, Data),
    continue(StateName, State);
handle_event({send_barrage, Rid, Msg}, StateName, State)
    when is_tuple(Rid) ->
    case get_dragon_role(Rid) of
        {ok, DR = #guild_dragon_role{}} ->
            role:apply(async,
                       Rid,
                       {guild_dragon_role, callback, [push_info]}),
            save_dragon_role(DR#guild_dragon_role{barrage_time =
                                                      date:unixtime() + 30});
        _ -> ok
    end,
    send_barrage(2, Rid, Msg),
    continue(StateName, State);
handle_event(_Event, StateName, State) ->
    logger:error("公会魔龙挑战未知事件~w",
                 [_Event],
                 guild_dragon_mgr,
                 613),
    continue(StateName, State).

handle_sync_event(enter_map, _From, StateName,
                  State = #state{map_info = MapInfo,
                                 ready_info = ReadyInfo}) ->
    Reply = case StateName of
                ready ->
                    {ReadyTransX, ReadyTransY} = case map_data:get(53010) of
                                                     {ok,
                                                      #map_data{revive =
                                                                    Revive}} ->
                                                         case
                                                             util:rand_list(Revive)
                                                             of
                                                             {X, Y} -> {X, Y};
                                                             _ -> {1786, 1501}
                                                         end;
                                                     _ -> {1786, 1501}
                                                 end,
                    case ReadyInfo of
                        [{ReadyMapID, _} | _] ->
                            {ok, {ReadyMapID, ReadyTransX, ReadyTransY}};
                        _EE -> {false, lang:get("找不到地图")}
                    end;
                _ when StateName =/= idle ->
                    {TransX, TransY} = case map_data:get(53009) of
                                           {ok, #map_data{revive = _Revive}} ->
                                               Rx = util:rand(280, 1080),
                                               Ry = util:rand(1480, 1760),
                                               {Rx, Ry};
                                           _ -> {280, 1480}
                                       end,
                    case MapInfo of
                        [{MapID, _} | _] -> {ok, {MapID, TransX, TransY}};
                        _EE -> {false, lang:get("找不到地图")}
                    end;
                _ -> {false, lang:get("巨龙宝藏活动尚未开启")}
            end,
    continue(Reply, StateName, State);
handle_sync_event(get_state, _From, StateName, State) ->
    Reply = {ok, StateName},
    continue(Reply, StateName, State);
handle_sync_event(_Event, _From, StateName, State) ->
    logger:info("收到未知同步消息~w",
                [_Event],
                guild_dragon_mgr,
                664),
    Reply = ok,
    continue(Reply, StateName, State).

handle_info(ready_reward, StateName,
            State = #state{timer_ready_reward = Ref}) ->
    stop_timer(Ref),
    MatchSpec = [{{guild_dragon_role,
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '$1',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '$2'},
                  [{'andalso', {'=:=', '$1', 1}, {'=:=', '$2', 1}}],
                  ['$_']}],
    RoleList1 = ets:select(guild_dragon_role, MatchSpec),
    lists:foreach(fun (#guild_dragon_role{rid = Rid}) ->
                          role:apply(async,
                                     Rid,
                                     {guild_dragon_role,
                                      callback,
                                      [ready_reward]});
                      (_) -> ok
                  end,
                  RoleList1),
    NewRef = case StateName of
                 ready ->
                     erlang:send_after(60 * 1000, self(), ready_reward);
                 _ -> undefind
             end,
    continue(StateName,
             State#state{timer_ready_reward = NewRef});
handle_info(barrage_play, StateName,
            State = #state{player_barrage_ref = Ref}) ->
    stop_timer(Ref),
    PersonLists = get_person_point_rank(3),
    PersonLists2 = lists:foldl(fun ({_,
                                     #guild_dragon_role{name = RoleName,
                                                        rid = Rid}},
                                    Acc) ->
                                       [{Rid, RoleName} | Acc];
                                   (_, Acc) -> Acc
                               end,
                               [],
                               PersonLists),
    {Msg, Msg2} = case PersonLists2 of
                      [{_Rid1, RoleName1}] ->
                          M1 =
                              util:flist(lang:get("<color='#ffff00'>~ts</color><color='#FAF0E6'>"
                                                  "争抢激烈，当前</color><color='#ffff00'>~ts</color><c"
                                                  "olor='#FAF0E6'>排名第一，其他勇士要加油啦！</color>"),
                                         [lang:get("巨龙宝藏"), RoleName1]),
                          M2 =
                              notice:format(lang:get("~ts争抢激烈，当前~ts排名第一，其他勇士要加油啦！"),
                                            [{string_2, 1, lang:get("巨龙宝藏")},
                                             {string_2, 1, RoleName1}]),
                          {M1, M2};
                      [{_Rid1, RoleName1}, {_Rid2, RoleName2}] ->
                          M1 =
                              util:flist(lang:get("<color='#ffff00'>~ts</color><color='#FAF0E6'>"
                                                  "争抢激烈，当前</color><color='#ffff00'>~ts</color><c"
                                                  "olor='#FAF0E6'>排名第一，</color><color='#ffff00'>"
                                                  "~ts</color><color='#FAF0E6'>紧随其后，其他勇士要加油啦！</c"
                                                  "olor>"),
                                         [lang:get("巨龙宝藏"),
                                          RoleName1,
                                          RoleName2]),
                          M2 =
                              notice:format(lang:get("~ts争抢激烈，当前~ts排名第一，~ts紧随其后，其他勇士要加油啦！"),
                                            [{string_2, 1, lang:get("巨龙宝藏")},
                                             {string_2, 1, RoleName1},
                                             {string_2, 1, RoleName2}]),
                          {M1, M2};
                      [{_Rid1, RoleName1},
                       {_Rid2, RoleName2},
                       {_Rid3, RoleName3}] ->
                          M1 =
                              util:flist(lang:get("<color='#ffff00'>~ts</color><color='#FAF0E6'>"
                                                  "争抢激烈，当前</color><color='#ffff00'>~ts</color><c"
                                                  "olor='#FAF0E6'>排名第一，</color><color='#ffff00'>"
                                                  "~ts</color>和<color='#ffff00'>~ts</color><colo"
                                                  "r='#FAF0E6'>紧随其后，其他勇士要加油啦！</color>"),
                                         [lang:get("巨龙宝藏"),
                                          RoleName1,
                                          RoleName2,
                                          RoleName3]),
                          M2 =
                              notice:format(lang:get("~ts争抢激烈，当前~ts排名第一，~ts、~ts紧随其后，其他勇士要加油啦！"),
                                            [{string_2, 1, lang:get("巨龙宝藏")},
                                             {string_2, 1, RoleName1},
                                             {string_2, 1, RoleName2},
                                             {string_2, 1, RoleName3}]),
                          {M1, M2};
                      _ ->
                          M1 =
                              util:flist(lang:get("<color='#ffff00'>~ts</color><color='#FAF0E6'>"
                                                  "争抢激烈，勇士们要加油啦！</color>"),
                                         [lang:get("巨龙宝藏")]),
                          M2 = notice:format(lang:get("~ts争抢激烈，勇士们要加油啦！"),
                                             [{string_2, 1, lang:get("巨龙宝藏")}]),
                          {M1, M2}
                  end,
    send_barrage(1, 1, Msg),
    notice:cast(all, 8, Msg2),
    NewRef = case StateName of
                 active_1 ->
                     erlang:send_after(3 * 60 * 1000, self(), barrage_play);
                 active_2 ->
                     erlang:send_after(3 * 60 * 1000, self(), barrage_play);
                 active_3 ->
                     erlang:send_after(3 * 60 * 1000, self(), barrage_play);
                 _ -> undefind
             end,
    continue(StateName,
             State#state{timer_ready_reward = NewRef});
handle_info(barrage_guild, StateName,
            State = #state{guild_barrage_ref = Ref}) ->
    stop_timer(Ref),
    GuildLists = get_guild_point_rank(1),
    GuildLists2 = lists:foldl(fun ({_,
                                    #guild_dragon_guild{guild_name = GuildName,
                                                        guild_id = Gid}},
                                   Acc) ->
                                      [{Gid, GuildName} | Acc];
                                  (_, Acc) -> Acc
                              end,
                              [],
                              GuildLists),
    {Msg, Msg2} = case GuildLists2 of
                      [{_Gid1, GuildName} | _] ->
                          M1 =
                              util:flist(lang:get("<color='#FFFF00'>~ts</color><color='#FAF0E6'>"
                                                  "如火如荼，当前</color><color='#ffff00'>~ts</color><c"
                                                  "olor='#FAF0E6'>排名第一，其他公会要加油啦！</color>"),
                                         [lang:get("巨龙宝藏"), GuildName]),
                          M2 =
                              notice:format(lang:get("~ts如火如荼，当前~ts排名第一，其他公会要加油啦！"),
                                            [{string_2, 1, lang:get("巨龙宝藏")},
                                             {string_2, 1, GuildName}]),
                          {M1, M2};
                      _ ->
                          M1 =
                              util:flist(lang:get("<color='#FFFF00'>~ts</color><color='#FAF0E6'>"
                                                  "如火如荼，各个公会要加油啦！</color>"),
                                         [lang:get("巨龙宝藏")]),
                          M2 = notice:format(lang:get("~ts如火如荼，各个公会要加油啦！"),
                                             [{string_2, 1, lang:get("巨龙宝藏")}]),
                          {M1, M2}
                  end,
    send_barrage(1, 1, Msg),
    notice:cast(all, 8, Msg2),
    NewRef = case StateName of
                 active_1 ->
                     erlang:send_after(4 * 60 * 1000, self(), barrage_guild);
                 active_2 ->
                     erlang:send_after(4 * 60 * 1000, self(), barrage_guild);
                 active_3 ->
                     erlang:send_after(4 * 60 * 1000, self(), barrage_guild);
                 _ -> undefind
             end,
    continue(StateName,
             State#state{guild_barrage_ref = NewRef});
handle_info({_, Pid, normal}, StateName, State) ->
    logger:info("进程~w关闭", [Pid], guild_dragon_mgr, 773),
    continue(StateName, State);
handle_info(_Info, StateName, State) ->
    logger:info("收到未知消息~w", [_Info], guild_dragon_mgr, 777),
    continue(StateName, State).

terminate(_Reason, _StateName, _State) ->
    logger:info("收到停止消息~w",
                [_Reason],
                guild_dragon_mgr,
                781),
    ok.

code_change(_OldVsn, StateName, State, _Extra) ->
    continue(StateName, State).

get_state() ->
    Zero = date:unixtime(zero),
    case check_open() of
        1 ->
            Now = date:unixtime(),
            PrepareSec = 5 * 60,
            NoticeSec = PrepareSec + 5,
            Active1Sec = 8 * 60 + NoticeSec,
            Active2Sec = 8 * 60 + Active1Sec,
            Active3Sec = 9 * 60 + Active2Sec,
            RewardSec = 3 + Active3Sec,
            case agenda_data:get(2065) of
                Cfg = #{starttime := Start, endtime := _End} ->
                    IsToday = case Cfg of
                                  #{args := WeekDays1} ->
                                      lists:member(date:day_of_the_week(Now),
                                                   WeekDays1);
                                  _ -> true
                              end,
                    if IsToday andalso Now < Zero + Start ->
                           {idle, Zero + Start - Now, Zero};
                       IsToday andalso
                           Now < Zero + Start + PrepareSec andalso
                               Now >= Zero + Start ->
                           {ready,
                            Zero + Start + PrepareSec - Now,
                            Zero + Start};
                       IsToday andalso
                           Now < Zero + Start + NoticeSec andalso
                               Now >= Zero + Start + PrepareSec ->
                           {notice,
                            Zero + Start + NoticeSec - Now,
                            Zero + Start + PrepareSec};
                       IsToday andalso
                           Now >= Zero + Start + NoticeSec andalso
                               Now < Zero + Start + Active1Sec ->
                           {active_1,
                            Zero + Start + Active1Sec - Now,
                            Zero + Start + NoticeSec};
                       IsToday andalso
                           Now >= Start + Zero + Active1Sec andalso
                               Now < Zero + Start + Active2Sec ->
                           {active_2,
                            Zero + Start + Active2Sec - Now,
                            Zero + Start + Active1Sec};
                       IsToday andalso
                           Now >= Start + Zero + Active2Sec andalso
                               Now < Zero + Start + Active3Sec ->
                           {active_3,
                            Zero + Start + Active3Sec - Now,
                            Zero + Start + Active2Sec};
                       IsToday andalso
                           Now >= Zero + Start + Active3Sec andalso
                               Now < Zero + Start + RewardSec ->
                           {reward,
                            Zero + Start + RewardSec - Now,
                            Zero + Start + Active3Sec};
                       true ->
                           case Cfg of
                               #{args := WeekDays} ->
                                   {idle,
                                    date:week_next_diff(WeekDays, Now, Start),
                                    Now};
                               _ -> {idle, date:next_diff(Start, Now), Zero}
                           end
                    end;
                _ -> {idle, date:next_diff(0), Zero}
            end;
        _ -> {idle, date:next_diff(0), Zero}
    end.

cast(Msg) ->
    gen_fsm:send_all_state_event(guild_dragon_mgr, Msg).

call(Msg) ->
    try gen_fsm:sync_send_all_state_event(guild_dragon_mgr,
                                          Msg)
    catch
        _Type:_Reason -> {error, timeout}
    end.

get_person_point_rank() ->
    MatchSpec = [{{guild_dragon_role,
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '$1',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_'},
                  [{'>', '$1', 0}],
                  ['$_']}],
    RoleList1 = ets:select(guild_dragon_role, MatchSpec),
    RoleList2 = util:keys_sort([{asc,
                                 #guild_dragon_role.update_time},
                                #guild_dragon_role.person_point],
                               RoleList1),
    {_, RoleList3} = lists:foldl(fun (RoleInfo,
                                      {RankIndex, Acc}) ->
                                         case RoleInfo of
                                             #guild_dragon_role{} ->
                                                 {RankIndex + 1,
                                                  [{RankIndex, RoleInfo}
                                                   | Acc]};
                                             _ -> {RankIndex, Acc}
                                         end
                                 end,
                                 {1, []},
                                 RoleList2),
    RoleList3.

get_person_point_rank(RankNum) ->
    MatchSpec = [{{guild_dragon_role,
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '$1',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_'},
                  [{'>', '$1', 0}],
                  ['$_']}],
    RoleList1 = ets:select(guild_dragon_role, MatchSpec),
    RoleList2 = util:keys_sort([{asc,
                                 #guild_dragon_role.update_time},
                                #guild_dragon_role.person_point],
                               RoleList1),
    RoleList3 = lists:sublist(RoleList2, RankNum),
    {_, RoleList4} = lists:foldl(fun (RoleInfo,
                                      {RankIndex, Acc}) ->
                                         case RoleInfo of
                                             #guild_dragon_role{} ->
                                                 {RankIndex + 1,
                                                  [{RankIndex, RoleInfo}
                                                   | Acc]};
                                             _ -> {RankIndex, Acc}
                                         end
                                 end,
                                 {1, []},
                                 RoleList3),
    RoleList4.

get_guild_point_rank() -> get_guild_point_rank(100).

get_guild_point_rank(RankNum) ->
    MatchSpec = [{{guild_dragon_guild,
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '$1',
                   '_',
                   '_',
                   '_',
                   '_'},
                  [{'>', '$1', 0}],
                  ['$_']}],
    GuildList1 = ets:select(guild_dragon_guild, MatchSpec),
    GuildList2 = util:keys_sort([{asc,
                                  #guild_dragon_guild.update_time},
                                 #guild_dragon_guild.guild_point],
                                GuildList1),
    GuildList3 = lists:sublist(GuildList2, RankNum),
    {_, GuildList4} = lists:foldl(fun (GuildInfo,
                                       {RankIndex, Acc}) ->
                                          case GuildInfo of
                                              #guild_dragon_guild{} ->
                                                  {RankIndex + 1,
                                                   [{RankIndex, GuildInfo}
                                                    | Acc]};
                                              _ -> {RankIndex, Acc}
                                          end
                                  end,
                                  {1, []},
                                  GuildList3),
    GuildList4.

get_role_index(Rid) ->
    RankList = guild_dragon_mgr:get_person_point_rank(),
    RankIndex = lists:foldl(fun (RankInfo, Index) ->
                                    case RankInfo of
                                        {Rank1,
                                         #guild_dragon_role{rid = Rid}} ->
                                            Rank1;
                                        _ -> Index
                                    end
                            end,
                            0,
                            RankList),
    RankIndex.

get_state_code(StateName) ->
    case StateName of
        idle -> 1;
        ready -> 2;
        active_1 -> 4;
        active_2 -> 5;
        active_3 -> 6;
        reward -> 7;
        notice -> 3;
        _ -> 1
    end.

load_data() ->
    case dets:first(guild_dragon_role) of
        '$end_of_table' ->
            logger:info("没有数据需要加载", [], guild_dragon_mgr, 944),
            [];
        _ ->
            dets:traverse(guild_dragon_role,
                          fun (DR) ->
                                  case guild_dragon_ver:do_dragon_role(DR) of
                                      {false, Reason} ->
                                          logger:error("魔龙挑战版本数据转换出错:~w",
                                                       [Reason],
                                                       guild_dragon_mgr,
                                                       951),
                                          {done, false};
                                      {ok, NDR = #guild_dragon_role{}} ->
                                          ets:insert(guild_dragon_role, NDR),
                                          dets:insert(guild_dragon_role, NDR),
                                          continue;
                                      _ ->
                                          logger:error("魔龙挑战版本数据转换出错",
                                                       [],
                                                       guild_dragon_mgr,
                                                       958),
                                          {done, false}
                                  end
                          end)
    end,
    case dets:first(guild_dragon_rank) of
        '$end_of_table' ->
            logger:info("没有数据需要加载", [], guild_dragon_mgr, 967),
            [];
        _ ->
            dets:traverse(guild_dragon_rank,
                          fun (DR) ->
                                  case guild_dragon_ver:do_dragon_role(DR) of
                                      {false, Reason} ->
                                          logger:error("魔龙挑战上届排行榜版本数据转换出错:~w",
                                                       [Reason],
                                                       guild_dragon_mgr,
                                                       974),
                                          {done, false};
                                      {ok, NDR = #guild_dragon_role{}} ->
                                          ets:insert(guild_dragon_rank, NDR),
                                          dets:insert(guild_dragon_rank, NDR),
                                          continue;
                                      _ ->
                                          logger:error("魔龙挑战上届排行榜版本数据转换出错",
                                                       [],
                                                       guild_dragon_mgr,
                                                       981),
                                          {done, false}
                                  end
                          end)
    end,
    dets:to_ets(guild_dragon_guild, guild_dragon_guild).

create_maps(StateName) ->
    case map_mgr:create(53009) of
        {ok, MapPid, MapId} ->
            case map_mgr:create(53010) of
                {ok, ReadyMapPid, ReadyMapId} ->
                    UnitInfo = case StateName of
                                   active_1 ->
                                       create_units({54, MapId},
                                                    [{66021, 838, 1640},
                                                     {66022, 1300, 1119},
                                                     {66023, 400, 843}],
                                                    []),
                                       create_units({54, MapId},
                                                    [{32011, 1432, 414}],
                                                    []);
                                   active_2 ->
                                       create_units({54, MapId},
                                                    [{66021, 838, 1640},
                                                     {66022, 1300, 1119},
                                                     {66023, 400, 843}],
                                                    []),
                                       create_units({54, MapId},
                                                    [{32012, 1432, 414}],
                                                    []);
                                   active_3 ->
                                       create_units({54, MapId},
                                                    [{66021, 838, 1640},
                                                     {66022, 1300, 1119},
                                                     {66023, 400, 843}],
                                                    []),
                                       create_units({54, MapId},
                                                    [{32013, 1432, 414}],
                                                    []);
                                   ready ->
                                       create_units({54, MapId},
                                                    [{66020, 1241, 1560}],
                                                    []);
                                   notice ->
                                       create_units({54, MapId},
                                                    [{66020, 1241, 1560}],
                                                    []);
                                   reward ->
                                       create_units({54, MapId},
                                                    [{66021, 838, 1640},
                                                     {66022, 1300, 1119},
                                                     {66023, 400, 843}],
                                                    []);
                                   idle -> [];
                                   _ -> []
                               end,
                    create_units({54, MapId}, [{66017, 640, 720}], []),
                    create_units({54, MapId},
                                 [{43079, 936, 403},
                                  {43080, 420, 723},
                                  {43081, 1679, 1173}],
                                 []),
                    {[{MapId, MapPid}],
                     UnitInfo,
                     [{ReadyMapId, ReadyMapPid}]};
                _Err ->
                    logger:error("创建魔龙挑战准备地图失败: ~w",
                                 [_Err],
                                 guild_dragon_mgr,
                                 1023),
                    {[], [], []}
            end;
        _Err ->
            logger:error("创建魔龙挑战地图失败: ~w",
                         [_Err],
                         guild_dragon_mgr,
                         1027),
            {[], [], []}
    end.

create_units(_Where, [], Acc) -> Acc;
create_units(Where = {GuildBattleId, MapId},
             [{BaseId, X, Y} | T], Acc) ->
    NewAcc = case unit_mgr:create({GuildBattleId, BaseId},
                                  BaseId,
                                  {MapId, X, Y})
                 of
                 {ok, #unit{id = UID}} -> [UID | Acc];
                 _ -> Acc
             end,
    create_units(Where, T, NewAcc).

clear_maps(MapInfo) when is_list(MapInfo) ->
    do_clear_maps(MapInfo).

do_clear_maps([]) -> ok;
do_clear_maps([{_MapId, Pid} | T]) ->
    clear_units(Pid),
    map:stop(Pid),
    do_clear_maps(T).

clear_units(MapPid) ->
    case map:unit_list(MapPid) of
        {ok, L} ->
            lists:foreach(fun (#map_unit{id = Uid, type = 2}) ->
                                  unit_mgr:remove(Uid);
                              (_) -> ok
                          end,
                          L);
        _R -> ok
    end.

init_data() ->
    DragonRoles1 = ets:foldl(fun (DragonRole, AccRole) ->
                                     case DragonRole of
                                         #guild_dragon_role{person_point =
                                                                Point,
                                                            rewards = Rewards,
                                                            history =
                                                                HistoryList,
                                                            rank_index =
                                                                RankIndex}
                                             when Point > 0 ->
                                             History =
                                                 #guild_dragon_history{point =
                                                                           Point,
                                                                       rewards =
                                                                           Rewards,
                                                                       rank_index
                                                                           =
                                                                           RankIndex},
                                             NewHistoryList =
                                                 lists:sublist([History
                                                                | HistoryList],
                                                               20),
                                             NewDragonRole =
                                                 DragonRole#guild_dragon_role{sign
                                                                                  =
                                                                                  0,
                                                                              history
                                                                                  =
                                                                                  NewHistoryList,
                                                                              challenge_msg_list
                                                                                  =
                                                                                  [],
                                                                              person_point
                                                                                  =
                                                                                  0,
                                                                              update_time
                                                                                  =
                                                                                  date:unixtime(),
                                                                              rewards
                                                                                  =
                                                                                  [],
                                                                              sys_barrage
                                                                                  =
                                                                                  1,
                                                                              ply_barrage
                                                                                  =
                                                                                  1,
                                                                              challenge_time
                                                                                  =
                                                                                  0,
                                                                              loot_time
                                                                                  =
                                                                                  0,
                                                                              looted_time
                                                                                  =
                                                                                  0,
                                                                              looted_num
                                                                                  =
                                                                                  0,
                                                                              is_in_map
                                                                                  =
                                                                                  0},
                                             [NewDragonRole | AccRole];
                                         _ -> AccRole
                                     end
                             end,
                             [],
                             guild_dragon_role),
    save_dragon_role(DragonRoles1),
    DragonGuild1 = ets:foldl(fun (DragonGuild, AccGuild) ->
                                     case DragonGuild of
                                         #guild_dragon_guild{guild_point =
                                                                 Point,
                                                             rewards = Rewards,
                                                             history =
                                                                 HistoryList}
                                             when Point > 0 ->
                                             History =
                                                 #guild_dragon_history{point =
                                                                           Point,
                                                                       rewards =
                                                                           Rewards},
                                             NewHistoryList =
                                                 lists:sublist([History
                                                                | HistoryList],
                                                               20),
                                             NewDragonGuild =
                                                 DragonGuild#guild_dragon_guild{history
                                                                                    =
                                                                                    NewHistoryList,
                                                                                guild_point
                                                                                    =
                                                                                    0,
                                                                                update_time
                                                                                    =
                                                                                    date:unixtime(),
                                                                                rewards
                                                                                    =
                                                                                    []},
                                             [NewDragonGuild | AccGuild];
                                         _ -> AccGuild
                                     end
                             end,
                             [],
                             guild_dragon_guild),
    save_dragon_guild(DragonGuild1),
    ets:delete_all_objects(guild_dragon_fighter),
    ok.

load_fighter() ->
    DragonFighter = ets:foldl(fun (DragonRole,
                                   AccFighter) ->
                                      case DragonRole of
                                          #guild_dragon_role{rid = Rid} ->
                                              case to_guild_dragon_fighter(Rid)
                                                  of
                                                  {true,
                                                   F =
                                                       #guild_dragon_fighter{}} ->
                                                      [F | AccFighter];
                                                  _ -> AccFighter
                                              end;
                                          _ -> AccFighter
                                      end
                              end,
                              [],
                              guild_dragon_role),
    save_dragon_fighter(DragonFighter).

to_guild_dragon_fighter(RoleId) ->
    case robot_mgr:get_role(RoleId) of
        {ok,
         #robot_role{pet = OldPet, backup_pets = OldBackPets}} ->
            {GetForm, GetFormLev, GetGuards} = case
                                                   arena_mgr:get_role(RoleId)
                                                   of
                                                   {ok,
                                                    #arena_role{formation =
                                                                    Form,
                                                                formation_lev =
                                                                    FormLev,
                                                                guards =
                                                                    Guards}} ->
                                                       {Form, FormLev, Guards};
                                                   _ -> {1, 1, []}
                                               end,
            NewPetList = case OldPet of
                             #c_pet{} -> [OldPet | OldBackPets];
                             _ -> OldBackPets
                         end,
            {FirstPet, FirstPetBaseId} = case lists:keyfind(1,
                                                            #c_pet.is_first,
                                                            NewPetList)
                                             of
                                             #c_pet{id = PetId,
                                                    base_id = PetBaseId} ->
                                                 {PetId, PetBaseId};
                                             _ ->
                                                 case OldPet of
                                                     #c_pet{id = PetId,
                                                            base_id =
                                                                PetBaseId} ->
                                                         {PetId, PetBaseId};
                                                     _ -> {0, 0}
                                                 end
                                         end,
            DragonFighter = #guild_dragon_fighter{id = RoleId,
                                                  formation = GetForm,
                                                  formation_lev = GetFormLev,
                                                  guards = GetGuards,
                                                  first_pet = FirstPet,
                                                  first_pet_base_id =
                                                      FirstPetBaseId},
            {true, DragonFighter};
        _ -> false
    end.

join_role(#{id := Rid, name := Name, lev := Lev,
            sex := Sex, classes := Classes, s_looks := Looks,
            guild_id := GuildID, guild_name := GuildName,
            honor_id := HonorID, pre_honor_id := PreID}) ->
    DragonRole = case get_dragon_role(Rid) of
                     {ok,
                      DR = #guild_dragon_role{total_num = TotalNum,
                                              sign = Sign}} ->
                         NewTotalNum = case Sign of
                                           0 ->
                                               role:apply(async,
                                                          Rid,
                                                          {guild_dragon_role,
                                                           callback,
                                                           [{fire_times,
                                                             TotalNum + 1}]}),
                                               TotalNum + 1;
                                           _ -> TotalNum
                                       end,
                         DR#guild_dragon_role{total_num = NewTotalNum, sign = 1,
                                              name = Name, lev = Lev, sex = Sex,
                                              classes = Classes,
                                              guild_id = GuildID,
                                              guild_name = GuildName,
                                              looks = Looks, honor_id = HonorID,
                                              pre_honor_id = PreID,
                                              is_in_map = 1};
                     _ ->
                         role:apply(async,
                                    Rid,
                                    {guild_dragon_role,
                                     callback,
                                     [{fire_times, 1}]}),
                         #guild_dragon_role{total_num = 1, sign = 1, rid = Rid,
                                            name = Name, lev = Lev, sex = Sex,
                                            classes = Classes,
                                            guild_id = GuildID,
                                            guild_name = GuildName,
                                            looks = Looks, honor_id = HonorID,
                                            pre_honor_id = PreID, is_in_map = 1}
                 end,
    save_dragon_role(DragonRole),
    case to_guild_dragon_fighter(Rid) of
        {true, DragonFighter = #guild_dragon_fighter{}} ->
            save_dragon_fighter(DragonFighter),
            ok;
        _ -> ok
    end.

join_guild(GuildID) ->
    DragonGuild = case get_dragon_guild(GuildID) of
                      {ok, DG = #guild_dragon_guild{}} -> DG;
                      _ -> #guild_dragon_guild{guild_id = GuildID}
                  end,
    NewDragonGuild = case guild_mgr:info(by_id, GuildID) of
                         {ok,
                          #guild{leader_name = LeaderName, name = GuildName,
                                 lev = GuildLev}} ->
                             DragonGuild#guild_dragon_guild{guild_name =
                                                                GuildName,
                                                            leader_name =
                                                                LeaderName,
                                                            lev = GuildLev};
                         _ -> DragonGuild
                     end,
    save_dragon_guild(NewDragonGuild),
    ok.

get_dragon_role(#role{id = Rid}) ->
    get_dragon_role(Rid);
get_dragon_role(Rid) when is_tuple(Rid) ->
    case catch ets:lookup(guild_dragon_role, Rid) of
        [DragonRole = #guild_dragon_role{} | _] ->
            {ok, DragonRole};
        _ -> false
    end.

get_dragon_guild(GuildID) ->
    case catch ets:lookup(guild_dragon_guild, GuildID) of
        [DragonGuild = #guild_dragon_guild{} | _] ->
            {ok, DragonGuild};
        _ -> false
    end.

save_dragon_rank(Data) ->
    save_data(guild_dragon_rank, Data).

save_dragon_role(Data) ->
    save_data(guild_dragon_role, Data).

save_dragon_guild(Data) ->
    save_data(guild_dragon_guild, Data).

save_dragon_fighter(Data) ->
    ets:insert(guild_dragon_fighter, Data).

save_data(DataName, Data) ->
    ets:insert(DataName, Data),
    dets:insert(DataName, Data),
    ok.

get_local_robot(Rid) ->
    case catch ets:lookup(guild_dragon_fighter, Rid) of
        [#guild_dragon_fighter{formation = Formation,
                               formation_lev = FormationLev,
                               first_pet = FirstPet, guards = Guards}
         | _] ->
            case robot_mgr:get_role(Rid) of
                {ok, RobotRole} ->
                    Args = #{formation => Formation,
                             formation_lev => FormationLev, guards => Guards,
                             first_pet => FirstPet},
                    NewRobot = def_combat(RobotRole, Args),
                    {ok, NewRobot};
                _ -> false
            end;
        _ -> false
    end.

def_combat(RobotRole = #robot_role{m_formation =
                                       Mfor = #m_formation{},
                                   guard = OldGuards, pet = OldPet,
                                   backup_pets = OldBackPet},
           Args) ->
    Formation = maps:get(formation, Args, undefined),
    FormationLev = maps:get(formation_lev, Args, undefined),
    Guards = maps:get(guards, Args, undefined),
    FirstPet = maps:get(first_pet, Args, undefined),
    case {Formation, FormationLev, Guards, FirstPet} of
        {Id, Lev, GidList, PetId}
            when is_integer(Id) andalso
                     is_integer(Lev) andalso
                         is_list(GidList) andalso is_integer(FirstPet) ->
            NewMfor = Mfor#m_formation{id = Id, lev = Lev},
            NewGuards = find_def_guard(OldGuards, GidList),
            {NewPet, NewBackPet} = find_def_pet(PetId,
                                                OldPet,
                                                OldBackPet),
            RobotRole#robot_role{m_formation = NewMfor,
                                 guard = NewGuards, pet = NewPet,
                                 backup_pets = NewBackPet};
        _ -> RobotRole
    end.

find_def_pet(PetId, OldPet, OldBackPet) ->
    NewPetList = case OldPet of
                     #c_pet{} -> [OldPet | OldBackPet];
                     _ -> OldBackPet
                 end,
    case lists:keyfind(PetId, #c_pet.id, NewPetList) of
        NewPet = #c_pet{} ->
            NewBackPet = [Pet#c_pet{can_summon = 1}
                          || Pet = #c_pet{id = GetPetId} <- NewPetList,
                             GetPetId =/= PetId],
            {NewPet#c_pet{can_summon = 0}, NewBackPet};
        _ -> {OldPet, OldBackPet}
    end.

find_def_guard(OldGuards, GidList) ->
    find_def_guard(OldGuards, GidList, []).

find_def_guard(_OldGuards, [], Guards) -> Guards;
find_def_guard(OldGuards, [{GuardId, Pos} | T],
               Guards) ->
    case lists:keyfind(GuardId, #c_guard.base_id, OldGuards)
        of
        CGuard = #c_guard{} ->
            find_def_guard(OldGuards,
                           T,
                           [CGuard#c_guard{war_id = Pos} | Guards]);
        _ -> find_def_guard(OldGuards, T, Guards)
    end.

all_leave() ->
    all_leave(ets:tab2list(guild_dragon_role)).

all_leave([]) -> ok;
all_leave([#guild_dragon_role{rid = Rid, is_in_map = 1}
           | T]) ->
    role:apply(async,
               Rid,
               {guild_dragon_role, callback, [leave]}),
    all_leave(T);
all_leave([_ | T]) -> all_leave(T).

stop_fighting() ->
    L = ets:tab2list(guild_dragon_role),
    stop_fighting(L).

stop_fighting([]) -> ok;
stop_fighting([#guild_dragon_role{rid = Rid,
                                  is_in_map = 1}
               | T]) ->
    role:apply(async,
               Rid,
               {guild_dragon_role, callback, [stop_fighting]}),
    stop_fighting(T);
stop_fighting([_ | T]) -> stop_fighting(T).

combat_over(#combat{type = 65, loser = Loser,
                    round = Round, result = Result,
                    start_args = #combat_start_args{ext_args = ExtArgs}}) ->
    case lists:keyfind(challenge_id, 1, ExtArgs) of
        {challenge_id, Rid} ->
            TotalDmg = get_total_dmg(Loser),
            Lev = case lists:keyfind(lev, 1, ExtArgs) of
                      {lev, FLev} -> FLev;
                      _ -> 0
                  end,
            Sex = case lists:keyfind(sex, 1, ExtArgs) of
                      {sex, FSex} -> FSex;
                      _ -> 2
                  end,
            Classes = case lists:keyfind(classes, 1, ExtArgs) of
                          {classes, FClasses} -> FClasses;
                          _ -> 0
                      end,
            Args = #{type => 1, rid => Rid, total_dmg => TotalDmg,
                     round => Round, result => Result, lev => Lev,
                     sex => Sex, classes => Classes},
            cast({combat_over, Args}),
            ok;
        _ERR ->
            logger:error("魔龙挑战战斗结束报错~w",
                         [Loser],
                         guild_dragon_mgr,
                         1344),
            ok
    end;
combat_over(#combat{type = 66, round = Round,
                    result = Result,
                    start_args = #combat_start_args{ext_args = ExtArgs}}) ->
    AtkID = case lists:keyfind(loot_id, 1, ExtArgs) of
                {loot_id, Rid1} -> Rid1;
                _ -> 0
            end,
    DefID = case lists:keyfind(looted_id, 1, ExtArgs) of
                {looted_id, Rid2} -> Rid2;
                _ -> 0
            end,
    Args = #{type => 2, atk_id => AtkID, def_id => DefID,
             round => Round, result => Result},
    cast({combat_over, Args}),
    ok.

get_total_dmg(Loser) ->
    lists:foldl(fun (Fighter, TotalDmg) ->
                        case Fighter of
                            #fighter{combat_statistics =
                                         #combat_statistics{total_dmg = Dmg}} ->
                                Dmg + TotalDmg;
                            _ -> TotalDmg
                        end
                end,
                0,
                Loser).

send_reward() ->
    PersonLists = get_person_point_rank(),
    PersonRanks = lists:foldl(fun (Person, Acc) ->
                                      case Person of
                                          {RankIndex,
                                           #guild_dragon_role{lev = Lev,
                                                              sex = Sex,
                                                              classes = Classes,
                                                              name = RoleName,
                                                              rid = Rid,
                                                              guild_id =
                                                                  GuildID,
                                                              person_point =
                                                                  Point}} ->
                                              {RewardItems, RandomNum} = case
                                                                             guild_dragon_data:get_person_rank_reward(RankIndex)
                                                                             of
                                                                             #{items
                                                                                   :=
                                                                                   Items =
                                                                                       [_
                                                                                        | _],
                                                                               random_num
                                                                                   :=
                                                                                   RdNum}
                                                                                 when
                                                                                   RdNum
                                                                                       >
                                                                                       0 ->
                                                                                 {Items,
                                                                                  RdNum};
                                                                             _ ->
                                                                                 {[],
                                                                                  0}
                                                                         end,
                                              RandomRewards = fetch_reward(Lev,
                                                                           Sex,
                                                                           Classes,
                                                                           3,
                                                                           RandomNum),
                                              RandomRewards1 =
                                                  [{item_type:special_id(BaseID),
                                                    Bind,
                                                    Num}
                                                   || {BaseID, Bind, Num, _}
                                                          <- RandomRewards],
                                              RandomRewards2 =
                                                  [{item_type:special_id(BaseID),
                                                    Bind,
                                                    Num}
                                                   || {BaseID, Bind, Num, 1}
                                                          <- RandomRewards],
                                              RandomRewards2 =
                                                  [{item_type:special_id(BaseID),
                                                    Bind,
                                                    Num}
                                                   || {BaseID, Bind, Num, 1}
                                                          <- RandomRewards],
                                              cast_msg(RandomRewards2,
                                                       RoleName,
                                                       2),
                                              TotalReward = RewardItems ++
                                                                RandomRewards1,
                                              case get_dragon_role(Rid) of
                                                  {ok,
                                                   DR =
                                                       #guild_dragon_role{max_rank
                                                                              =
                                                                              MaxRand,
                                                                          rewards
                                                                              =
                                                                              OldRewards}} ->
                                                      NewMaxRank = case
                                                                       RankIndex
                                                                           <
                                                                           MaxRand
                                                                       of
                                                                       true ->
                                                                           RankIndex;
                                                                       _ ->
                                                                           MaxRand
                                                                   end,
                                                      NewRewards = OldRewards ++
                                                                       TotalReward,
                                                      NDR =
                                                          DR#guild_dragon_role{max_rank
                                                                                   =
                                                                                   NewMaxRank,
                                                                               rewards
                                                                                   =
                                                                                   NewRewards,
                                                                               rank_index
                                                                                   =
                                                                                   RankIndex},
                                                      save_dragon_rank(NDR),
                                                      save_dragon_role(NDR);
                                                  _ -> ok
                                              end,
                                              Title = lang:get("巨龙宝藏奖励"),
                                              Content =
                                                  notice:format(lang:get("亲爱的勇士，恭喜你在巨龙宝藏中获得~ts龙币，夺得~ts名，您的龙币将转化为以下奖励！"),
                                                                [{string_2,
                                                                  5,
                                                                  Point},
                                                                 {string_2,
                                                                  5,
                                                                  RankIndex}]),
                                              mail:send(Rid,
                                                        Title,
                                                        Content,
                                                        TotalReward),
                                              case RankIndex of
                                                  _ when RankIndex < 4 ->
                                                      GuildMsg =
                                                          notice:format(lang:get("强大无比！公会英雄~ts在巨龙宝藏中大展神威，抢到~ts龙币，获得第~ts名{face_1,3}"),
                                                                        [{role_2,
                                                                          RoleName},
                                                                         {string_2,
                                                                          5,
                                                                          Point},
                                                                         {string_2,
                                                                          5,
                                                                          RankIndex}]),
                                                      guild:notice(GuildID,
                                                                   GuildMsg),
                                                      role:apply(async,
                                                                 Rid,
                                                                 {guild_dragon_role,
                                                                  callback,
                                                                  [{fire_rank,
                                                                    RankIndex}]});
                                                  _ when RankIndex < 11 ->
                                                      GuildMsg =
                                                          notice:format(lang:get("强大无比！公会英雄~ts在巨龙宝藏中大展神威，抢到~ts龙币，获得第~ts名{face_1,3}"),
                                                                        [{role_2,
                                                                          RoleName},
                                                                         {string_2,
                                                                          5,
                                                                          Point},
                                                                         {string_2,
                                                                          5,
                                                                          RankIndex}]),
                                                      guild:notice(GuildID,
                                                                   GuildMsg);
                                                  _ -> ok
                                              end,
                                              [{Rid,
                                                RoleName,
                                                RankIndex,
                                                TotalReward}
                                               | Acc];
                                          _ -> Acc
                                      end
                              end,
                              [],
                              PersonLists),
    CastPerson = [{Rid, RoleName}
                  || {Rid, RoleName, RankIndex, _} <- PersonRanks,
                     RankIndex < 4],
    Msg =
        notice:format(lang:get("~ts结束啦，恭喜勇士~ts排名前三获得了~ts称号"),
                      [{string_2, 1, lang:get("巨龙宝藏")},
                       {role_1, CastPerson},
                       {string_2, 1, lang:get("屠龙者")}]),
    notice:cast(all, 5, Msg),
    PersonHonor = [{Rid, 11129} || {Rid, _} <- CastPerson],
    honor_mgr:add(guild_dragon_role_honor,
                  PersonHonor,
                  3 * 24 * 60 * 60 + date:unixtime()),
    GuildRankLists = get_guild_point_rank(),
    lists:foreach(fun (Guild) ->
                          case Guild of
                              {RankIndex,
                               #guild_dragon_guild{guild_id = GuildID,
                                                   guild_name = GuildName}} ->
                                  case
                                      guild_dragon_data:get_guild_rank_reward(RankIndex)
                                      of
                                      #{rewards := RankReward = [_ | _]} ->
                                          GuildRewards = lists:foldl(fun (R,
                                                                          AccReward) ->
                                                                             case
                                                                                 R
                                                                                 of
                                                                                 {GroupID,
                                                                                  Num} ->
                                                                                     case
                                                                                         guild_dragon_data:get_guild_group_item(GroupID)
                                                                                         of
                                                                                         List =
                                                                                             [_
                                                                                              | _] ->
                                                                                             {WorldLev,
                                                                                              _} =
                                                                                                 world_lev:get_world_lev(),
                                                                                             List2 =
                                                                                                 [{BaseID,
                                                                                                   0,
                                                                                                   Num1,
                                                                                                   Weight,
                                                                                                   IsCast}
                                                                                                  || #{is_cast
                                                                                                           :=
                                                                                                           IsCast,
                                                                                                       item_id
                                                                                                           :=
                                                                                                           BaseID,
                                                                                                       item_num
                                                                                                           :=
                                                                                                           Num1,
                                                                                                       lev_low
                                                                                                           :=
                                                                                                           LvLow,
                                                                                                       ratio
                                                                                                           :=
                                                                                                           Weight,
                                                                                                       lev_high
                                                                                                           :=
                                                                                                           LvHigh}
                                                                                                         <- List,
                                                                                                     WorldLev
                                                                                                         >=
                                                                                                         LvLow
                                                                                                         andalso
                                                                                                         WorldLev
                                                                                                             =<
                                                                                                             LvHigh
                                                                                                         orelse
                                                                                                         LvLow
                                                                                                             =:=
                                                                                                             0
                                                                                                             andalso
                                                                                                             LvHigh
                                                                                                                 =:=
                                                                                                                 0],
                                                                                             case
                                                                                                 util:rand_list_n(List2,
                                                                                                                  4,
                                                                                                                  Num)
                                                                                                 of
                                                                                                 List3 =
                                                                                                     [_
                                                                                                      | _] ->
                                                                                                     [{BaseID,
                                                                                                       Bind,
                                                                                                       Num2,
                                                                                                       IsCast2}
                                                                                                      || {BaseID,
                                                                                                          Bind,
                                                                                                          Num2,
                                                                                                          _,
                                                                                                          IsCast2}
                                                                                                             <- List3,
                                                                                                         BaseID
                                                                                                             >
                                                                                                             0]
                                                                                                         ++
                                                                                                         AccReward;
                                                                                                 _ ->
                                                                                                     AccReward
                                                                                             end;
                                                                                         _ ->
                                                                                             AccReward
                                                                                     end;
                                                                                 _ ->
                                                                                     AccReward
                                                                             end
                                                                     end,
                                                                     [],
                                                                     RankReward),
                                          {ItemIDList,
                                           CastGuildRewards,
                                           SaveRewardsList} =
                                              lists:foldl(fun (Auction,
                                                               {Items,
                                                                CastList,
                                                                SaveRewards}) ->
                                                                  case Auction
                                                                      of
                                                                      {ItemID,
                                                                       Bind,
                                                                       Num,
                                                                       IsCast2} ->
                                                                          NewCastList =
                                                                              case
                                                                                  IsCast2
                                                                                  of
                                                                                  1 ->
                                                                                      [{ItemID,
                                                                                        Bind,
                                                                                        Num}
                                                                                       | CastList];
                                                                                  _ ->
                                                                                      CastList
                                                                              end,
                                                                          NewSaveRewards =
                                                                              [{ItemID,
                                                                                Bind,
                                                                                Num}
                                                                               | SaveRewards],
                                                                          NewItems =
                                                                              [item_type:special_id(ItemID)
                                                                               || _X
                                                                                      <- lists:seq(1,
                                                                                                   Num)]
                                                                                  ++
                                                                                  Items,
                                                                          {NewItems,
                                                                           NewCastList,
                                                                           NewSaveRewards};
                                                                      _ ->
                                                                          {Items,
                                                                           CastList,
                                                                           SaveRewards}
                                                                  end
                                                          end,
                                                          {[], [], []},
                                                          GuildRewards),
                                          guild_auction:add_list(GuildID,
                                                                 ItemIDList),
                                          case get_dragon_guild(GuildID) of
                                              {ok,
                                               DG = #guild_dragon_guild{max_rank
                                                                            =
                                                                            MaxRand,
                                                                        rewards
                                                                            =
                                                                            OldGRewards}} ->
                                                  NewRank = case RankIndex <
                                                                     MaxRand
                                                                of
                                                                true ->
                                                                    RankIndex;
                                                                _ -> MaxRand
                                                            end,
                                                  NewGRewards = OldGRewards ++
                                                                    SaveRewardsList,
                                                  NDG =
                                                      DG#guild_dragon_guild{max_rank
                                                                                =
                                                                                NewRank,
                                                                            rewards
                                                                                =
                                                                                NewGRewards},
                                                  save_dragon_guild(NDG);
                                              _ -> ok
                                          end,
                                          case CastGuildRewards of
                                              [_ | _] ->
                                                  cast_msg(CastGuildRewards,
                                                           GuildName,
                                                           3);
                                              _ -> ok
                                          end,
                                          GuildMsg =
                                              notice:format(lang:get("经过公会成员艰苦奋斗，在巨龙宝藏中获得了~ts奖励，大家快去拍卖吧{face_1,1}"),
                                                            [{item_2,
                                                              SaveRewardsList}]),
                                          guild:notice(GuildID, GuildMsg),
                                          ok;
                                      _ -> ok
                                  end;
                              _ -> ok
                          end
                  end,
                  GuildRankLists),
    RankList = lists:foldl(fun (DragonRole, Acc) ->
                                   case DragonRole of
                                       {RankIndex,
                                        #guild_dragon_role{name = RoleName,
                                                           rid = TargetID,
                                                           lev = Lev, sex = Sex,
                                                           classes = Classes,
                                                           person_point = Point,
                                                           guild_name =
                                                               GuildName}} ->
                                           RankInfo1 = {TargetID,
                                                        RankIndex,
                                                        RoleName,
                                                        GuildName,
                                                        Point,
                                                        Classes,
                                                        Sex,
                                                        Lev},
                                           [RankInfo1 | Acc];
                                       _ -> Acc
                                   end
                           end,
                           [],
                           PersonLists),
    MatchSpec = [{{guild_dragon_role,
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '$2',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '$1',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_'},
                  [{'andalso', {'=:=', '$1', 1}, {'>', '$2', 0}}],
                  ['$_']}],
    ShowRoleList = ets:select(guild_dragon_role, MatchSpec),
    lists:foreach(fun (#guild_dragon_role{rid = Rid,
                                          person_point = Point}) ->
                          NewRewards = case lists:keyfind(Rid, 1, PersonRanks)
                                           of
                                           {Rid, _, _, Rewards} -> Rewards;
                                           _ -> []
                                       end,
                          role:apply(async,
                                     Rid,
                                     {guild_dragon_role,
                                      callback,
                                      [{show_rank,
                                        RankList,
                                        Point,
                                        NewRewards}]});
                      (_) -> ok
                  end,
                  ShowRoleList).

cast_msg(Items = [_ | _], RoleName, 1) ->
    Msg =
        notice:format(lang:get("勇士~ts在巨龙宝藏中英勇奋斗夺到了~ts{face_1,10}"),
                      [{role_2, RoleName}, {item_2, Items}]),
    case [I || {I, _, _} <- Items, item_type:is_good_pet(I)]
        of
        [] -> notice:cast(all, 5, Msg);
        _ -> notice:cast(all, 10, Msg)
    end,
    ok;
cast_msg(Items = [_ | _], RoleName, 2) ->
    Msg =
        notice:format(lang:get("勇士~ts在巨龙宝藏中夺得名次惊喜的被巨龙奖励了~ts{face_1,11}"),
                      [{role_2, RoleName}, {item_2, Items}]),
    case [I || {I, _, _} <- Items, item_type:is_good_pet(I)]
        of
        [] -> notice:cast(all, 5, Msg);
        _ -> notice:cast(all, 10, Msg)
    end,
    ok;
cast_msg(Items = [_ | _], GuildName, 3) ->
    Msg =
        notice:format(lang:get("经过艰苦战斗~ts公会在巨龙宝藏中获得了~ts奖励{face_1,10}"),
                      [{role_2, GuildName}, {item_2, Items}]),
    case [I || {I, _, _} <- Items, item_type:is_good_pet(I)]
        of
        [] -> notice:cast(all, 5, Msg);
        _ -> notice:cast(all, 10, Msg)
    end,
    ok;
cast_msg(_, _, _) -> ok.

fetch_reward(Lv, Sex, Classes, Type, Num) ->
    case Num > 0 of
        true ->
            case guild_dragon_data:get_combat_reward(Type) of
                List1 = [_ | _] ->
                    List2 = [{BaseID, Bind, Num1, Weight, IsCast}
                             || #{is_cast := IsCast, item_id := BaseID,
                                  num := Num1, lev_low := LvLow,
                                  ratio := Weight, bind := Bind,
                                  lev_high := LvHigh, sex := SexT,
                                  classes := ClassesT}
                                    <- List1,
                                (Lv >= LvLow andalso Lv =< LvHigh orelse
                                     LvLow =:= 0 andalso LvHigh =:= 0)
                                    andalso
                                    (Sex =:= SexT orelse SexT =:= 2) andalso
                                        (ClassesT =:= Classes orelse
                                             ClassesT =:= 0)],
                    case util:rand_list_n(List2, 4, Num) of
                        List3 = [_ | _] ->
                            [{BaseID, Bind, Num2, IsCast2}
                             || {BaseID, Bind, Num2, _, IsCast2} <- List3,
                                BaseID > 0];
                        _ -> []
                    end;
                _ -> []
            end;
        _ -> []
    end.

del_unit([]) -> ok;
del_unit([Id | T]) ->
    case unit_mgr:info(Id) of
        {ok, #unit{}} -> unit_mgr:remove(Id);
        _ -> ignore
    end,
    del_unit(T).

all_enter_map(MapID) ->
    MatchSpec = [{{guild_dragon_role,
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '$1',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '$2'},
                  [{'andalso', {'=:=', '$1', 1}, {'=:=', '$2', 1}}],
                  ['$_']}],
    RoleList1 = ets:select(guild_dragon_role, MatchSpec),
    lists:foreach(fun (#guild_dragon_role{rid = Rid}) ->
                          {TransX, TransY} = case map_data:get(53009) of
                                                 {ok,
                                                  #map_data{revive =
                                                                _Revive}} ->
                                                     Rx = util:rand(280, 1080),
                                                     Ry = util:rand(1480, 1760),
                                                     {Rx, Ry};
                                                 _ -> {280, 1480}
                                             end,
                          ToPos = {MapID, TransX, TransY},
                          role:apply(async,
                                     Rid,
                                     {guild_dragon_role,
                                      callback,
                                      [{ready_enter_map, ToPos}]});
                      (_) -> ok
                  end,
                  RoleList1),
    ok.

send_barrage(1, _SendRid, Msg) ->
    ets:foldl(fun (#guild_dragon_role{rid = Rid,
                                      is_in_map = 1, sys_barrage = 1},
                   _Acc) ->
                      notice:send(Rid, 13, Msg),
                      ok;
                  (_, _) -> ok
              end,
              ok,
              guild_dragon_role);
send_barrage(2, _SendRid, Msg) ->
    ets:foldl(fun (#guild_dragon_role{rid = Rid,
                                      is_in_map = 1, ply_barrage = 1},
                   _Acc) ->
                      notice:send(Rid, 13, Msg),
                      ok;
                  (_, _) -> ok
              end,
              ok,
              guild_dragon_role).

stop_timer(Ref) when is_reference(Ref) ->
    catch erlang:cancel_timer(Ref);
stop_timer([]) -> ok;
stop_timer([H | T]) ->
    stop_timer(H),
    stop_timer(T);
stop_timer(_) -> ok.

gm(Mod) -> cast(Mod).

reload() -> cast(reload).

update_rank_role() ->
    MatchSpec = [{{guild_dragon_role,
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '$1',
                   '_',
                   '_'},
                  [{'andalso', {'<', '$1', 4}, {'>', '$1', 0}}],
                  ['$_']}],
    RankRoles = ets:select(guild_dragon_rank, MatchSpec),
    case RankRoles of
        [] -> ok;
        L = [#guild_dragon_role{}] -> update_rank_role(L);
        L = [#guild_dragon_role{}, #guild_dragon_role{}] ->
            update_rank_role(L);
        L = [#guild_dragon_role{},
             #guild_dragon_role{},
             #guild_dragon_role{}] ->
            update_rank_role(L);
        [DR1 = #guild_dragon_role{},
         DR2 = #guild_dragon_role{},
         DR3 = #guild_dragon_role{}
         | _] ->
            update_rank_role([DR1, DR2, DR3]);
        _ -> ok
    end.

update_rank_role([]) -> ok;
update_rank_role([#guild_dragon_role{name = Name,
                                     lev = Lev, classes = Classes, sex = Sex,
                                     looks = Looks, rank_index = RankIndex}
                  | Rest]) ->
    UnitId = get_rank_role_unit_id(RankIndex),
    case unit_mgr:info(UnitId) of
        {ok, #unit{}} ->
            NewLooks = [{Type, Mod, Val, Str}
                        || {Type, Mod, Val, Str} <- Looks, Type =/= 20,
                           Type =/= 21, Type =/= 22],
            ElemPos = [{#unit.name, Name},
                       {#unit.lev, Lev},
                       {#unit.classes, Classes},
                       {#unit.sex, Sex},
                       {#unit.looks, NewLooks}],
            unit_mgr:set_element(UnitId, ElemPos),
            ok;
        _ -> ingore
    end,
    update_rank_role(Rest).

get_rank_role_unit_id(RankIndex) ->
    case RankIndex of
        1 -> {54, 43079};
        2 -> {54, 43080};
        3 -> {54, 43081};
        _ -> 0
    end.

check_open() -> 1.

