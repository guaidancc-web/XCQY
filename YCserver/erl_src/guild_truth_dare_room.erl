-file("src/mod/guild/guild_truth_dare_room.erl", 1).

-module(guild_truth_dare_room).

-author("Suhan").

-behaviour(gen_fsm).

-export([start_link/1,
         call/2,
         cast/2,
         info/2,
         send_envelop/2]).

-export([init/1,
         handle_event/3,
         handle_sync_event/4,
         handle_info/3,
         terminate/3,
         code_change/4]).

-export([idle/2,
         ready/2,
         active/2,
         choose/2,
         quest/2,
         vote/2,
         show/2,
         redpacket/2,
         calc/2]).

-export([role_callback/2, push_19531/2]).

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

-file("src/mod/guild/guild_truth_dare_room.erl", 33).

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

-file("src/mod/guild/guild_truth_dare_room.erl", 34).

-file("inc/guild_truth_dare.hrl", 1).

-author("Suhan").

-record(guild_truth_dare_info,
        {guild_id = {0, "", 0}, next_id = 0, his_info = []}).

-record(guild_truth_dare_his_info,
        {id = 0,
         time = 0,
         lucky_role = {0, "", 0},
         role_name = "",
         sex = 0,
         classes = 0,
         flower = 0,
         egg = 0,
         question_type = 0,
         question = ""}).

-record(guild_truth_dare_question_bank,
        {guild_id = {0, "", 0},
         ver = 0,
         next_id = 1000,
         truth_num = 0,
         dare_num = 0,
         question = []}).

-record(guild_truth_dare_question,
        {question_id = 0,
         type = 0,
         role_id = {0, "", 0},
         role_name = "",
         question = "",
         is_choose = 0}).

-record(guild_truth_dare_room_info,
        {guild_id = {0, "", 0},
         room_pid = undefined,
         num = 0,
         max_num = 0,
         role = []}).

-record(guild_truth_dare_room_log,
        {guild_id = {0, "", 0},
         scene_info = [],
         truth_num = 0,
         dare_num = 0,
         contents = []}).

-file("src/mod/guild/guild_truth_dare_room.erl", 35).

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

-file("src/mod/guild/guild_truth_dare_room.erl", 36).

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

-file("src/mod/guild/guild_truth_dare_room.erl", 37).

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

-file("src/mod/guild/guild_truth_dare_room.erl", 38).

-record(state,
        {guild_id = {0, "", 0},
         ts = 0,
         timeout = infinity,
         room_info = [],
         red_packet = 0,
         round = 0,
         next_answer_pos = 0,
         lucky_num = undefined,
         lucky_role = undefined,
         lucky_question = undefined,
         vote_role = [],
         rank = [],
         round_rank = [],
         first_rank = [],
         add_call = [],
         room_question = [],
         scene = 1,
         log_info = #guild_truth_dare_room_log{},
         skip_lucky = 0}).

start_link(GuildId = {Gid, P, Z}) ->
    Name = list_to_atom(lists:concat([guild_truth_dare_room,
                                      "_",
                                      Gid,
                                      "_",
                                      P,
                                      "_",
                                      Z])),
    gen_fsm:start_link({local, Name},
                       guild_truth_dare_room,
                       [GuildId],
                       []).

call(Pid, Msg) ->
    try gen_fsm:sync_send_all_state_event(Pid, Msg) catch
        _Type:_Reason ->
            logger:debug("Type : ~w Reason : ~w",
                         [_Type, _Reason],
                         guild_truth_dare_room,
                         81),
            {error, timeout}
    end.

cast(Pid, Msg) ->
    gen_fsm:send_all_state_event(Pid, Msg).

info(Pid, Msg) -> Pid ! Msg.

init([GuildId]) ->
    guild:cast(GuildId, 19509, {1, 0}),
    RoomQuestion = case lookup_question_bank(GuildId) of
                       {ok,
                        #guild_truth_dare_question_bank{question =
                                                            QuestionList}} ->
                           [{Id, Type, RoleName, Question}
                            || #guild_truth_dare_question{question_id = Id,
                                                          type = Type,
                                                          role_name = RoleName,
                                                          question = Question,
                                                          is_choose = IsChoose}
                                   <- QuestionList,
                               IsChoose =:= 1];
                       _ ->
                           CfgIdList =
                               guild_truth_dare_data:get_question_list(),
                           get_cfg_question(CfgIdList, [])
                   end,
    LogInfo = #guild_truth_dare_room_log{guild_id =
                                             GuildId},
    {ok,
     idle,
     #state{guild_id = GuildId, ts = date:now2(),
            timeout = infinity, room_info = [{1, []}],
            room_question = RoomQuestion, log_info = LogInfo},
     infinity}.

handle_event(_Event, StateName, State) ->
    continue(StateName, State).

handle_sync_event(get_status, _From, StateName,
                  State = #state{ts = {M, S, _}, timeout = Timeout}) ->
    Status = get_status_order(StateName),
    Time = case Timeout of
               infinity -> 0;
               _ -> M * 1000000 + S + util:floor(Timeout / 1000)
           end,
    continue({ok, Status, Time}, StateName, State);
handle_sync_event(get_status, _From, StateName,
                  State = #state{}) ->
    continue({ok, 1, 0}, StateName, State);
handle_sync_event({join_room,
                   RoleId,
                   RoleName,
                   Classes,
                   Sex,
                   Pos},
                  _From, idle,
                  State = #state{guild_id = GuildId, round = Round}) ->
    Now = {M, S, _} = date:now2(),
    Timeout = guild_truth_dare_data:get_timeout(1),
    [#{loss := [{_, LossNum1}]}] =
        guild_truth_dare_data:get_cfg(),
    LossNum = case Sex of
                  0 -> util:floor(LossNum1 / 2);
                  _ -> LossNum1
              end,
    guild:cast(GuildId,
               19509,
               {2, M * 1000000 + S + Timeout}),
    case Pos =:= 0 of
        true ->
            NewRoomInfo = [{Round + 1,
                            [{1, RoleId, RoleName, Classes, Sex}]}],
            continue(ok,
                     ready,
                     State#state{ts = Now, timeout = Timeout * 1000,
                                 red_packet = LossNum,
                                 room_info = NewRoomInfo});
        _ ->
            NewRoomInfo = [{Round + 1,
                            [{Pos, RoleId, RoleName, Classes, Sex}]}],
            continue(ok,
                     ready,
                     State#state{ts = Now, timeout = Timeout * 1000,
                                 red_packet = LossNum, room_info = NewRoomInfo})
    end;
handle_sync_event({join_room,
                   RoleId,
                   RoleName,
                   Classes,
                   Sex,
                   Pos},
                  _From, StateName,
                  State = #state{guild_id = GuildId, ts = Ts,
                                 timeout = Timeout, red_packet = RedPacket,
                                 room_info = RoomInfo, round = Round}) ->
    Flag = case lists:keyfind(Round + 1, 1, RoomInfo) of
               {_, RoundInfo} ->
                   [#{max_round := CfgMaxRound}] =
                       guild_truth_dare_data:get_cfg(),
                   case Round + 1 > CfgMaxRound of
                       false ->
                           case lists:keyfind(RoleId, 2, RoundInfo) of
                               false ->
                                   case Pos =:= 0 of
                                       true ->
                                           case get_empty_pos(RoundInfo) of
                                               NewPos when is_integer(NewPos) ->
                                                   NewPos;
                                               _ ->
                                                   {false,
                                                    lang:get("活动火爆，暂无座位，请耐心等待下一场吧！{face_1,3}")}
                                           end;
                                       _ ->
                                           case lists:keyfind(Pos, 1, RoundInfo)
                                               of
                                               false -> Pos;
                                               _ ->
                                                   {false,
                                                    lang:get("慢人一步，该座位已有人入座啦！{face_1,3}")}
                                           end
                                   end;
                               _ ->
                                   {false,
                                    lang:get("你已经报名啦，快喊小伙伴一起玩吧！{face_1,3}")}
                           end;
                       _ -> {false, lang:get("请等待下一局开始")}
                   end;
               _ -> {false, lang:get("请等待下一局开始")}
           end,
    case Flag of
        Num when is_integer(Num) ->
            {_, RoundInfo1} = lists:keyfind(Round + 1, 1, RoomInfo),
            NewRoundInfo = [{Num, RoleId, RoleName, Classes, Sex}
                            | RoundInfo1],
            NewRoomInfo = lists:keystore(Round + 1,
                                         1,
                                         RoomInfo,
                                         {Round + 1, NewRoundInfo}),
            [#{min_role_num := MinRoleNum,
               max_role_num := MaxRoleNum, loss := [{_, LossNum1}]}] =
                guild_truth_dare_data:get_cfg(),
            LossNum = case Sex of
                          0 -> util:floor(LossNum1 / 2);
                          _ -> LossNum1
                      end,
            case StateName of
                ready ->
                    case length(NewRoundInfo) =:= MaxRoleNum of
                        true ->
                            case util:time_left(Timeout, Ts) > 10 * 1000 of
                                true ->
                                    Now = {M, S, _} = date:now2(),
                                    Timeout1 = 10,
                                    guild:cast(GuildId,
                                               19509,
                                               {2, M * 1000000 + S + Timeout1}),
                                    continue({ok, Num},
                                             ready,
                                             State#state{ts = Now,
                                                         timeout =
                                                             Timeout1 * 1000,
                                                         red_packet =
                                                             RedPacket +
                                                                 LossNum,
                                                         room_info =
                                                             NewRoomInfo});
                                _ ->
                                    continue({ok, Num},
                                             ready,
                                             State#state{red_packet =
                                                             RedPacket +
                                                                 LossNum,
                                                         room_info =
                                                             NewRoomInfo})
                            end;
                        _ ->
                            continue({ok, Num},
                                     ready,
                                     State#state{red_packet =
                                                     RedPacket + LossNum,
                                                 room_info = NewRoomInfo})
                    end;
                idle ->
                    case length(NewRoundInfo) >= MinRoleNum of
                        true ->
                            Now = {M, S, _} = date:now2(),
                            Timeout2 = guild_truth_dare_data:get_timeout(1),
                            guild:cast(GuildId,
                                       19509,
                                       {2, M * 1000000 + S + Timeout2}),
                            continue({ok, Num},
                                     ready,
                                     State#state{ts = Now,
                                                 timeout = Timeout2 * 1000,
                                                 red_packet =
                                                     RedPacket + LossNum,
                                                 room_info = NewRoomInfo});
                        _ ->
                            continue({ok, Num},
                                     idle,
                                     State#state{red_packet =
                                                     RedPacket + LossNum,
                                                 room_info = NewRoomInfo})
                    end;
                _ ->
                    continue(ok,
                             StateName,
                             State#state{red_packet = RedPacket + LossNum,
                                         room_info = NewRoomInfo})
            end;
        {false, Reason} ->
            continue({false, Reason}, StateName, State)
    end;
handle_sync_event({leave_room, RoleId}, _From,
                  StateName,
                  State = #state{guild_id = GuildId,
                                 red_packet = RedPacket, room_info = RoomInfo,
                                 round = Round}) ->
    case lists:keyfind(Round + 1, 1, RoomInfo) of
        {_, RoundInfo} ->
            case lists:keyfind(RoleId, 2, RoundInfo) of
                false ->
                    continue({false, lang:get("您已退出房间")}, StateName, State);
                {_, _, _, _, Sex} ->
                    [#{loss := [{_, LossNum1}]}] =
                        guild_truth_dare_data:get_cfg(),
                    LossNum = case Sex of
                                  0 -> util:floor(LossNum1 / 2);
                                  _ -> LossNum1
                              end,
                    NewRoundInfo = lists:keydelete(RoleId, 2, RoundInfo),
                    NewRoomInfo = lists:keystore(Round + 1,
                                                 1,
                                                 RoomInfo,
                                                 {Round + 1, NewRoundInfo}),
                    case StateName of
                        ready ->
                            case NewRoundInfo of
                                [] ->
                                    guild:cast(GuildId, 19509, {1, 0}),
                                    continue(ok,
                                             idle,
                                             State#state{ts = date:now2(),
                                                         timeout = infinity,
                                                         red_packet = 0,
                                                         room_info =
                                                             NewRoomInfo});
                                _ ->
                                    continue(ok,
                                             ready,
                                             State#state{red_packet =
                                                             max(0,
                                                                 RedPacket -
                                                                     LossNum),
                                                         room_info =
                                                             NewRoomInfo})
                            end;
                        _ ->
                            continue(ok,
                                     StateName,
                                     State#state{red_packet =
                                                     max(0,
                                                         RedPacket - LossNum),
                                                 room_info = NewRoomInfo})
                    end
            end;
        _ -> continue(ok, StateName, State)
    end;
handle_sync_event({transposition, RoleId, Pos}, _From,
                  StateName,
                  State = #state{room_info = RoomInfo, round = Round}) ->
    case lists:keyfind(Round + 1, 1, RoomInfo) of
        {_, RoundInfo} ->
            case lists:keyfind(RoleId, 2, RoundInfo) of
                {OldPos, _, RoleName, Classes, Sex} ->
                    case lists:keyfind(Pos, 1, RoundInfo) of
                        false ->
                            NewRoundInfo1 = lists:keydelete(OldPos,
                                                            1,
                                                            RoundInfo),
                            NewRoundInfo2 = [{Pos,
                                              RoleId,
                                              RoleName,
                                              Classes,
                                              Sex}
                                             | NewRoundInfo1],
                            NewRoomInfo = lists:keystore(Round + 1,
                                                         1,
                                                         RoomInfo,
                                                         {Round + 1,
                                                          NewRoundInfo2}),
                            continue(ok,
                                     StateName,
                                     State#state{room_info = NewRoomInfo});
                        _ ->
                            continue({false,
                                      lang:get("已有玩家抢先一步，请换个座位试试吧！{face_1,3}")},
                                     StateName,
                                     State)
                    end;
                _ ->
                    continue({false, lang:get("请先加入房间")}, StateName, State)
            end;
        _ ->
            continue({false, lang:get("当前状态不能更换座位")},
                     StateName,
                     State)
    end;
handle_sync_event({guess_num, RoleId, Num}, _From,
                  active,
                  State = #state{guild_id = GuildId,
                                 next_answer_pos = AnswerPos,
                                 lucky_num = {MinNum, LuckyNum, MaxNum},
                                 room_info = RoomInfo, round = Round,
                                 round_rank = RoundRank}) ->
    case lists:keyfind(Round, 1, RoomInfo) of
        {_, RoundInfo} ->
            case lists:keyfind(Round + 1, 1, RoomInfo) of
                {_, NextRoundInfo} ->
                    case lists:keyfind(RoleId, 2, NextRoundInfo) of
                        false ->
                            continue({false, lang:get("您已退出房间")},
                                     active,
                                     State);
                        _ ->
                            case lists:keyfind(AnswerPos, 1, RoundInfo) of
                                {_, RoleId, RoleName, Classes, Sex} ->
                                    case MinNum =< Num andalso Num =< MaxNum of
                                        true ->
                                            cancel_atom_timer(guess_num_ref),
                                            put(last_choose,
                                                {RoleId,
                                                 RoleName,
                                                 Classes,
                                                 Sex,
                                                 Num}),
                                            NextAnswerPos =
                                                get_next_answer_pos(AnswerPos,
                                                                    RoundInfo),
                                            case Num =:= LuckyNum of
                                                true ->
                                                    one_shot_achievement_trigger(MinNum,
                                                                                 MaxNum,
                                                                                 RoleId),
                                                    guild:cast(GuildId,
                                                               19528,
                                                               {RoleId,
                                                                RoleName,
                                                                Num,
                                                                Num,
                                                                Num}),
                                                    Now = {M, S, _} =
                                                              date:now2(),
                                                    Timeout =
                                                        guild_truth_dare_data:get_timeout(3),
                                                    LuckyRole = {RoleId,
                                                                 RoleName,
                                                                 Sex,
                                                                 Classes},
                                                    LuckyNotice =
                                                        notice:format(lang:get("砰地一声，~ts成为本轮幸运儿，幸运数字为<color='#ffff00'>~ts</co"
                                                                               "lor>"),
                                                                      [{role_2,
                                                                        RoleName},
                                                                       {string_1,
                                                                        Num}]),
                                                    guild:notice(GuildId,
                                                                 LuckyNotice),
                                                    guild:cast(GuildId,
                                                               19521,
                                                               LuckyRole),
                                                    guild:cast(GuildId,
                                                               19509,
                                                               {4,
                                                                M * 1000000 + S
                                                                    + Timeout}),
                                                    ChooseNotice =
                                                        notice:format(lang:get("~ts正在选择，<color='#ffff00'>【真心话】</color>还是<colo"
                                                                               "r='#ffff00'>【大冒险】</color>令ta左右为难"),
                                                                      [{role_2,
                                                                        RoleName}]),
                                                    guild:notice(GuildId,
                                                                 ChooseNotice),
                                                    role:apply(async,
                                                               RoleId,
                                                               {guild_truth_dare_room,
                                                                role_callback,
                                                                [#evt_truth_dare_lucky{}]}),
                                                    continue(ok,
                                                             choose,
                                                             State#state{ts =
                                                                             Now,
                                                                         timeout
                                                                             =
                                                                             Timeout
                                                                                 *
                                                                                 1000,
                                                                         lucky_num
                                                                             =
                                                                             {LuckyNum,
                                                                              LuckyNum,
                                                                              LuckyNum},
                                                                         lucky_role
                                                                             =
                                                                             LuckyRole});
                                                _ ->
                                                    Timeout =
                                                        guild_truth_dare_data:get_timeout(2),
                                                    Ref =
                                                        erlang:send_after(Timeout
                                                                              *
                                                                              1000,
                                                                          self(),
                                                                          {guess_num_timeout,
                                                                           NextAnswerPos}),
                                                    put(guess_num_ref, Ref),
                                                    {M1, S1, _} = date:now2(),
                                                    {_,
                                                     RoleId1,
                                                     RoleName1,
                                                     Classes1,
                                                     Sex1} =
                                                        lists:keyfind(NextAnswerPos,
                                                                      1,
                                                                      RoundInfo),
                                                    put(guess_end_time,
                                                        M1 * 1000000 + S1 +
                                                            Timeout),
                                                    case Num < LuckyNum of
                                                        true ->
                                                            guild:cast(GuildId,
                                                                       19528,
                                                                       {RoleId,
                                                                        RoleName,
                                                                        Num,
                                                                        Num + 1,
                                                                        MaxNum}),
                                                            AddFlower =
                                                                guild_truth_dare_data:get_diff_add_flower(Num
                                                                                                              -
                                                                                                              MinNum),
                                                            RoleRoundRank = case
                                                                                lists:keyfind(RoleId,
                                                                                              1,
                                                                                              RoundRank)
                                                                                of
                                                                                {_,
                                                                                 _,
                                                                                 _,
                                                                                 _,
                                                                                 Flower,
                                                                                 Egg,
                                                                                 Call} ->
                                                                                    {RoleId,
                                                                                     RoleName,
                                                                                     Classes,
                                                                                     Sex,
                                                                                     Flower
                                                                                         +
                                                                                         AddFlower,
                                                                                     Egg,
                                                                                     Call};
                                                                                _ ->
                                                                                    {RoleId,
                                                                                     RoleName,
                                                                                     Classes,
                                                                                     Sex,
                                                                                     AddFlower,
                                                                                     0,
                                                                                     0}
                                                                            end,
                                                            NewRoundRank =
                                                                lists:keystore(RoleId,
                                                                               1,
                                                                               RoundRank,
                                                                               RoleRoundRank),
                                                            guild:cast(GuildId,
                                                                       19517,
                                                                       {Num + 1,
                                                                        MaxNum,
                                                                        M1 *
                                                                            1000000
                                                                            + S1
                                                                            +
                                                                            Timeout,
                                                                        RoleId1,
                                                                        RoleName1,
                                                                        Sex1,
                                                                        Classes1}),
                                                            Notice2 =
                                                                notice:format(lang:get("~ts小心翼翼的输入了<color='#ffff00'>~ts</color>，安全过关,"
                                                                                       "爆炸范围变更为<color='#ffff00'>~ts</color>-<color='#"
                                                                                       "ffff00'>~ts</color>{face_1,7}"),
                                                                              [{role_2,
                                                                                RoleName},
                                                                               {string_1,
                                                                                Num},
                                                                               {string_1,
                                                                                Num
                                                                                    +
                                                                                    1},
                                                                               {string_1,
                                                                                MaxNum}]),
                                                            guild:notice(GuildId,
                                                                         Notice2),
                                                            continue(ok,
                                                                     active,
                                                                     State#state{next_answer_pos
                                                                                     =
                                                                                     NextAnswerPos,
                                                                                 lucky_num
                                                                                     =
                                                                                     {Num
                                                                                          +
                                                                                          1,
                                                                                      LuckyNum,
                                                                                      MaxNum},
                                                                                 round_rank
                                                                                     =
                                                                                     NewRoundRank});
                                                        _ ->
                                                            guild:cast(GuildId,
                                                                       19528,
                                                                       {RoleId,
                                                                        RoleName,
                                                                        Num,
                                                                        MinNum,
                                                                        Num -
                                                                            1}),
                                                            AddFlower =
                                                                guild_truth_dare_data:get_diff_add_flower(MaxNum
                                                                                                              -
                                                                                                              Num),
                                                            RoleRoundRank = case
                                                                                lists:keyfind(RoleId,
                                                                                              1,
                                                                                              RoundRank)
                                                                                of
                                                                                {_,
                                                                                 _,
                                                                                 _,
                                                                                 _,
                                                                                 Flower,
                                                                                 Egg,
                                                                                 Call} ->
                                                                                    {RoleId,
                                                                                     RoleName,
                                                                                     Classes,
                                                                                     Sex,
                                                                                     Flower
                                                                                         +
                                                                                         AddFlower,
                                                                                     Egg,
                                                                                     Call};
                                                                                _ ->
                                                                                    {RoleId,
                                                                                     RoleName,
                                                                                     Classes,
                                                                                     Sex,
                                                                                     AddFlower,
                                                                                     0,
                                                                                     0}
                                                                            end,
                                                            NewRoundRank =
                                                                lists:keystore(RoleId,
                                                                               1,
                                                                               RoundRank,
                                                                               RoleRoundRank),
                                                            guild:cast(GuildId,
                                                                       19517,
                                                                       {MinNum,
                                                                        Num - 1,
                                                                        M1 *
                                                                            1000000
                                                                            + S1
                                                                            +
                                                                            Timeout,
                                                                        RoleId1,
                                                                        RoleName1,
                                                                        Sex1,
                                                                        Classes1}),
                                                            Notice3 =
                                                                notice:format(lang:get("~ts小心翼翼的输入了<color='#ffff00'>~ts</color>，安全过关,"
                                                                                       "爆炸范围变更为<color='#ffff00'>~ts</color>-<color='#"
                                                                                       "ffff00'>~ts</color>{face_1,7}"),
                                                                              [{role_2,
                                                                                RoleName},
                                                                               {string_1,
                                                                                Num},
                                                                               {string_1,
                                                                                MinNum},
                                                                               {string_1,
                                                                                Num
                                                                                    -
                                                                                    1}]),
                                                            guild:notice(GuildId,
                                                                         Notice3),
                                                            continue(ok,
                                                                     active,
                                                                     State#state{next_answer_pos
                                                                                     =
                                                                                     NextAnswerPos,
                                                                                 lucky_num
                                                                                     =
                                                                                     {MinNum,
                                                                                      LuckyNum,
                                                                                      Num
                                                                                          -
                                                                                          1},
                                                                                 round_rank
                                                                                     =
                                                                                     NewRoundRank})
                                                    end
                                            end;
                                        _ ->
                                            ReturnMsg =
                                                notice:format(lang:get("请输入<color='#ffff00'>~ts</color>至<color='#ffff"
                                                                       "00'>~ts</color>中的一个数字吧！{face_1,11}"),
                                                              [{string_1,
                                                                MinNum},
                                                               {string_2,
                                                                MaxNum}]),
                                            continue({false, ReturnMsg},
                                                     active,
                                                     State)
                                    end;
                                {_, _, AnswerRoleName, _, _} ->
                                    ReturnMsg2 =
                                        notice:format(lang:get("~ts正在拆弹，给ta出点好主意吧{face_1,15}"),
                                                      [{role_2,
                                                        AnswerRoleName}]),
                                    continue({false, ReturnMsg2},
                                             active,
                                             State);
                                _ ->
                                    continue({false, lang:get("当前不是你的回答时间")},
                                             active,
                                             State)
                            end
                    end;
                _ -> continue({false, lang:get("系统出错")}, active, State)
            end;
        _ -> continue({false, lang:get("系统出错")}, active, State)
    end;
handle_sync_event({guess_num, _RoleId, _Num}, _From,
                  StateName, State) ->
    continue({false, lang:get("当前不是回答阶段")},
             StateName,
             State);
handle_sync_event({choose_type, RoleId, Type}, _From,
                  choose,
                  State = #state{guild_id = GuildId,
                                 lucky_role = {LuckyRoleId, _, _, _},
                                 round = Round, room_info = RoomInfo,
                                 room_question = RoomQuestion,
                                 log_info =
                                     LogInfo =
                                         #guild_truth_dare_room_log{truth_num =
                                                                        TruthNum,
                                                                    dare_num =
                                                                        DareNum,
                                                                    contents =
                                                                        Contents}}) ->
    case RoleId =:= LuckyRoleId of
        true ->
            case lists:keyfind(Round + 1, 1, RoomInfo) of
                {_, NextRoundInfo} ->
                    case lists:keyfind(RoleId, 2, NextRoundInfo) of
                        {_, _, RoleName, _, _} ->
                            TypeList = [{Id1, Type1, RoleName1, Question1}
                                        || {Id1, Type1, RoleName1, Question1}
                                               <- RoomQuestion,
                                           Type1 =:= Type],
                            {Id, Type, RoleName2, OriginalQuestion} =
                                util:rand_list(TypeList),
                            RoundInfo = lists:keyfind(Round, 1, RoomInfo),
                            Question = question_change(OriginalQuestion,
                                                       LuckyRoleId,
                                                       RoundInfo,
                                                       GuildId),
                            ChooseNotice = case Type of
                                               2 ->
                                                   role:apply(async,
                                                              RoleId,
                                                              {guild_truth_dare_room,
                                                               role_callback,
                                                               [#evt_truth_dare_lucky_choose{type
                                                                                                 =
                                                                                                 2}]}),
                                                   notice:format(lang:get("~ts选择了<color='#ffff00'>【大冒险】</color>，快一起来看看有什"
                                                                          "么劲爆的展开吧！{face_1,15}"),
                                                                 [{role_2,
                                                                   RoleName}]);
                                               1 ->
                                                   role:apply(async,
                                                              RoleId,
                                                              {guild_truth_dare_room,
                                                               role_callback,
                                                               [#evt_truth_dare_lucky_choose{type
                                                                                                 =
                                                                                                 1}]}),
                                                   notice:format(lang:get("~ts选择了<color='#ffff00'>【真心话】</color>，等一个引爆场面的"
                                                                          "答案！{face_1,15}"),
                                                                 [{role_2,
                                                                   RoleName}])
                                           end,
                            guild:notice(GuildId, ChooseNotice),
                            Timeout = guild_truth_dare_data:get_timeout(4),
                            Now = {M, S, _} = date:now2(),
                            guild:cast(GuildId,
                                       19509,
                                       {5, M * 1000000 + S + Timeout}),
                            VoteRound = 1,
                            guild:cast(GuildId,
                                       19520,
                                       {Type, RoleName2, Question, VoteRound}),
                            NewLogInfo = case Id >= 1000 of
                                             true ->
                                                 case Type of
                                                     2 ->
                                                         LogInfo#guild_truth_dare_room_log{dare_num
                                                                                               =
                                                                                               DareNum
                                                                                                   +
                                                                                                   1,
                                                                                           contents
                                                                                               =
                                                                                               [Contents,
                                                                                                {Type,
                                                                                                 Question}]};
                                                     1 ->
                                                         LogInfo#guild_truth_dare_room_log{truth_num
                                                                                               =
                                                                                               TruthNum
                                                                                                   +
                                                                                                   1,
                                                                                           contents
                                                                                               =
                                                                                               [Contents,
                                                                                                {Type,
                                                                                                 Question}]}
                                                 end;
                                             _ ->
                                                 case Type of
                                                     2 ->
                                                         LogInfo#guild_truth_dare_room_log{dare_num
                                                                                               =
                                                                                               DareNum
                                                                                                   +
                                                                                                   1};
                                                     1 ->
                                                         LogInfo#guild_truth_dare_room_log{truth_num
                                                                                               =
                                                                                               TruthNum
                                                                                                   +
                                                                                                   1}
                                                 end
                                         end,
                            continue(ok,
                                     quest,
                                     State#state{ts = Now,
                                                 timeout = Timeout * 1000,
                                                 lucky_question =
                                                     {VoteRound,
                                                      Type,
                                                      Id,
                                                      Question,
                                                      0,
                                                      0,
                                                      0},
                                                 log_info = NewLogInfo});
                        _ ->
                            continue({false, lang:get("您已退出房间")}, choose, State)
                    end;
                _ -> continue({false, lang:get("系统出错")}, choose, State)
            end;
        _ ->
            continue({false, lang:get("您不是幸运儿")}, choose, State)
    end;
handle_sync_event({choose_type, _RoleId, _Type}, _From,
                  StateName, State) ->
    continue({false, lang:get("当前阶段不能选择真心话大冒险")},
             StateName,
             State);
handle_sync_event({finish_quest, RoleId}, _From, quest,
                  State = #state{guild_id = GuildId,
                                 lucky_role = {LuckyRoleId, _, _, _}}) ->
    case RoleId =:= LuckyRoleId of
        true ->
            Now = {M, S, _} = date:now2(),
            Timeout = guild_truth_dare_data:get_timeout(5),
            guild:cast(GuildId,
                       19509,
                       {6, M * 1000000 + S + Timeout}),
            continue(ok,
                     vote,
                     State#state{ts = Now, timeout = Timeout * 1000});
        _ -> continue({false, lang:get("您不是幸运儿")}, quest, State)
    end;
handle_sync_event({finish_quest, _}, _From, StateName,
                  State) ->
    continue({false, lang:get("当前阶段不能发起投票")},
             StateName,
             State);
handle_sync_event({vote,
                   Type,
                   RoleId,
                   RoleName,
                   Classes,
                   Sex},
                  _From, vote,
                  State = #state{guild_id = GuildId, room_info = RoomInfo,
                                 round = Round, vote_role = VoteRole,
                                 lucky_role =
                                     {LuckyRoleId, LuckyRoleName, _, _},
                                 lucky_question =
                                     {VoteRound,
                                      QuestionType,
                                      QId,
                                      Question,
                                      Flower,
                                      Egg,
                                      Call}}) ->
    case lists:keyfind(RoleId, 1, VoteRole) of
        false ->
            {_, RoundInfo} = lists:keyfind(Round, 1, RoomInfo),
            case Type of
                1 ->
                    Msg1 = notice:format(lang:get("~ts投给你一朵鲜花！"),
                                         [{role_2, RoleName}]),
                    notice:send(LuckyRoleId, 1, Msg1),
                    Msg2 = notice:format(lang:get("你给~ts投出了一朵鲜花！"),
                                         [{role_2, LuckyRoleName}]),
                    notice:send(RoleId, 1, Msg2),
                    GuildNotice1 =
                        notice:format(lang:get("~ts被~ts折服，献上了自己的鲜花{face_1,6}"),
                                      [{role_2, RoleName},
                                       {role_2, LuckyRoleName}]),
                    guild:notice(GuildId, GuildNotice1);
                2 ->
                    Msg3 = notice:format(lang:get("~ts向你扔来了一个鸡蛋，被你巧妙避开！"),
                                         [{role_2, RoleName}]),
                    notice:send(LuckyRoleId, 1, Msg3),
                    Msg4 = notice:format(lang:get("你假装一个不小心，对~ts扔了个鸡蛋！"),
                                         [{role_2, LuckyRoleName}]),
                    notice:send(RoleId, 1, Msg4),
                    GuildNotice2 =
                        notice:format(lang:get("~ts觉得~ts的表演还不够精彩，一个手滑把手里的鸡蛋给扔了出去{face_1,26}"),
                                      [{role_2, RoleName},
                                       {role_2, LuckyRoleName}]),
                    guild:notice(GuildId, GuildNotice2);
                _ -> ok
            end,
            case lists:keyfind(RoleId, 2, RoundInfo) of
                false ->
                    #{lucky_reward_type := LuckyRewardType,
                      lucky_reward_num := LuckyRewardNum,
                      action_reward_type := ActionRewardType,
                      action_reward_num := ActionRewardNum} =
                        guild_truth_dare_data:get_vote_reward({3, Type}),
                    NewVoteRole = [{RoleId,
                                    RoleName,
                                    Classes,
                                    Sex,
                                    ActionRewardType,
                                    ActionRewardNum,
                                    3,
                                    Type}
                                   | VoteRole],
                    {NewFlower, NewEgg, NewCall} =
                        add_flower({LuckyRewardType, LuckyRewardNum},
                                   Flower,
                                   Egg,
                                   Call),
                    NewLuckyQuestion = {VoteRound,
                                        QuestionType,
                                        QId,
                                        Question,
                                        NewFlower,
                                        NewEgg,
                                        NewCall},
                    continue(ok,
                             vote,
                             State#state{vote_role = NewVoteRole,
                                         lucky_question = NewLuckyQuestion});
                _ ->
                    case RoleId =:= LuckyRoleId of
                        true ->
                            #{lucky_reward_type := LuckyRewardType2,
                              lucky_reward_num := LuckyRewardNum2,
                              action_reward_type := ActionRewardType2,
                              action_reward_num := ActionRewardNum2} =
                                guild_truth_dare_data:get_vote_reward({1,
                                                                       Type}),
                            NewVoteRole2 = [{RoleId,
                                             RoleName,
                                             Classes,
                                             Sex,
                                             ActionRewardType2,
                                             ActionRewardNum2,
                                             1,
                                             Type}
                                            | VoteRole],
                            {NewFlower2, NewEgg2, NewCall2} =
                                add_flower({LuckyRewardType2, LuckyRewardNum2},
                                           Flower,
                                           Egg,
                                           Call),
                            NewLuckyQuestion1 = {VoteRound,
                                                 QuestionType,
                                                 QId,
                                                 Question,
                                                 NewFlower2,
                                                 NewEgg2,
                                                 NewCall2},
                            continue(ok,
                                     vote,
                                     State#state{vote_role = NewVoteRole2,
                                                 lucky_question =
                                                     NewLuckyQuestion1});
                        _ ->
                            #{lucky_reward_type := LuckyRewardType1,
                              lucky_reward_num := LuckyRewardNum1,
                              action_reward_type := ActionRewardType1,
                              action_reward_num := ActionRewardNum1} =
                                guild_truth_dare_data:get_vote_reward({2,
                                                                       Type}),
                            NewVoteRole1 = [{RoleId,
                                             RoleName,
                                             Classes,
                                             Sex,
                                             ActionRewardType1,
                                             ActionRewardNum1,
                                             2,
                                             Type}
                                            | VoteRole],
                            {NewFlower1, NewEgg1, NewCall1} =
                                add_flower({LuckyRewardType1, LuckyRewardNum1},
                                           Flower,
                                           Egg,
                                           Call),
                            NewLuckyQuestion1 = {VoteRound,
                                                 QuestionType,
                                                 QId,
                                                 Question,
                                                 NewFlower1,
                                                 NewEgg1,
                                                 NewCall1},
                            continue(ok,
                                     vote,
                                     State#state{vote_role = NewVoteRole1,
                                                 lucky_question =
                                                     NewLuckyQuestion1})
                    end
            end;
        _ -> continue({false, lang:get("您已经投过票了")}, vote, State)
    end;
handle_sync_event({vote,
                   _Type,
                   _RoleId,
                   _RoleName,
                   _Classes,
                   _Sex},
                  _Form, StateName, State) ->
    continue({false, lang:get("当前阶段不能投票")},
             StateName,
             State);
handle_sync_event({add_first_call,
                   RoleId,
                   CallRoleName,
                   Type},
                  _From, StateName,
                  State = #state{first_rank = FirstRank,
                                 add_call = AddCall})
    when StateName =:= calc orelse
             StateName =:= redpacket ->
    case lists:keyfind(Type, 1, FirstRank) of
        {_, Fid, RoleName, Classes, Sex, Praise} ->
            Msg1 = notice:format(lang:get("你给~ts点了个赞!"),
                                 [{role_2, RoleName}]),
            Msg2 = notice:format(lang:get("~ts给你点了个赞哦{face_1,3}"),
                                 [{role_2, CallRoleName}]),
            case lists:keyfind(RoleId, 1, AddCall) of
                {_, HaveCall} ->
                    case lists:member(Type, HaveCall) of
                        true ->
                            continue({false, lang:get("您已经为他点过赞了")},
                                     StateName,
                                     State);
                        _ ->
                            notice:send(RoleId, 1, Msg1),
                            notice:send(Fid, 1, Msg2),
                            NewFirstRank = lists:keystore(Type,
                                                          1,
                                                          FirstRank,
                                                          {Type,
                                                           Fid,
                                                           RoleName,
                                                           Classes,
                                                           Sex,
                                                           Praise + 1}),
                            NewAddCall = lists:keystore(RoleId,
                                                        1,
                                                        AddCall,
                                                        {RoleId,
                                                         [Type | HaveCall]}),
                            continue(ok,
                                     StateName,
                                     State#state{first_rank = NewFirstRank,
                                                 add_call = NewAddCall})
                    end;
                _ ->
                    notice:send(RoleId, 1, Msg1),
                    notice:send(Fid, 1, Msg2),
                    NewFirstRank1 = lists:keystore(Type,
                                                   1,
                                                   FirstRank,
                                                   {Type,
                                                    Fid,
                                                    RoleName,
                                                    Classes,
                                                    Sex,
                                                    Praise + 1}),
                    continue(ok,
                             StateName,
                             State#state{first_rank = NewFirstRank1,
                                         add_call =
                                             [{RoleId, [Type]} | AddCall]})
            end;
        _Err ->
            continue({false, lang:get("点赞类型出错")}, StateName, State)
    end;
handle_sync_event({add_first_call,
                   _RoleId,
                   _CallRoleName,
                   _Type},
                  _From, StateName, State) ->
    continue({false, lang:get("当前阶段不能点赞")},
             StateName,
             State);
handle_sync_event(_Event, _From, StateName, State) ->
    Reply = ok,
    continue(Reply, StateName, State).

handle_info({skip_lucky_role}, StateName, State)
    when StateName =:= quest orelse StateName =:= vote ->
    logger:debug("跳过幸运儿回合", [], guild_truth_dare_room, 523),
    Now = {_M, _S, _} = date:now2(),
    continue(show,
             State#state{ts = Now, timeout = 0, skip_lucky = 1});
handle_info({skip_lucky_role}, StateName, State) ->
    continue(StateName, State);
handle_info({skip_lucky_role, RoleId}, _StateName,
            State = #state{lucky_role = {RoleId, _, _, _}}) ->
    logger:debug("跳过幸运儿回合", [], guild_truth_dare_room, 529),
    Now = {_M, _S, _} = date:now2(),
    continue(show,
             State#state{ts = Now, timeout = 0, skip_lucky = 1});
handle_info({skip_lucky_role, _}, StateName, State) ->
    continue(StateName, State);
handle_info({cancel_skip_lucky_ref,
             Atom,
             LuckyRoleId,
             Flag},
            StateName,
            State = #state{round = Round, room_info = RoomInfo,
                           lucky_role =
                               {LuckyRoleId, RoleName, _Sex, _Classes}}) ->
    logger:debug("准备删除定时器：~w",
                 [Atom],
                 guild_truth_dare_room,
                 536),
    cancel_atom_timer(Atom),
    put(Atom, undefined),
    Msg = case Flag of
              1 ->
                  notice:format(lang:get("投票成功，跳过~ts的回合{face_1,117}"),
                                [{role_2, RoleName}]);
              _ ->
                  notice:format(lang:get("投票失败，~ts正在作答哦{face_1,22}"),
                                [{role_2, RoleName}])
          end,
    {_, RoundInfo} = lists:keyfind(Round, 1, RoomInfo),
    lists:foldl(fun ({_, RoleId, _, _, _}, _Acc) ->
                        notice:send(RoleId, 1, Msg)
                end,
                [],
                RoundInfo),
    continue(StateName, State);
handle_info({cancel_skip_lucky_ref,
             _Atom,
             _RoleId,
             _Flag},
            StateName, State) ->
    continue(StateName, State);
handle_info({get_room_info, Role}, StateName, State) ->
    Data = get_push_room_info(StateName, State),
    role:link_send(Role, 19515, Data),
    continue(StateName, State);
handle_info(push_room_info, StateName,
            State = #state{guild_id = GuildId}) ->
    Data = get_push_room_info(StateName, State),
    guild:cast(GuildId, 19515, Data),
    continue(StateName, State);
handle_info({get_guess_num_info, Role}, active,
            State = #state{lucky_num = {MinNum, _, MaxNum},
                           next_answer_pos = NextAnswerPos,
                           room_info = RoomInfo, round = Round}) ->
    Time = get(guess_end_time),
    {_, RoundInfo} = lists:keyfind(Round, 1, RoomInfo),
    {_, RoleId, RoleName, Classes, Sex} =
        lists:keyfind(NextAnswerPos, 1, RoundInfo),
    role:link_send(Role,
                   19517,
                   {MinNum, MaxNum, Time, RoleId, RoleName, Sex, Classes}),
    continue(active, State);
handle_info({get_guess_num_info, _Role}, StateName,
            State) ->
    continue(StateName, State);
handle_info({get_lucky_question, Role}, StateName,
            State = #state{lucky_question =
                               {VoteRound, Type, Qid, Question, _, _, _},
                           room_question = RoomQuestion})
    when StateName =:= quest orelse
             StateName =:= vote orelse StateName =:= show ->
    RoleName = case lists:keyfind(Qid, 1, RoomQuestion) of
                   {_, _, RoleName1, _} -> RoleName1;
                   _ -> ""
               end,
    role:link_send(Role,
                   19520,
                   {Type, RoleName, Question, VoteRound}),
    continue(StateName, State);
handle_info({get_lucky_question, _Role}, StateName,
            State) ->
    continue(StateName, State);
handle_info({get_lucky_role, Role}, StateName,
            State = #state{lucky_role = LuckyRole})
    when StateName =:= choose orelse
             StateName =:= quest orelse
                 StateName =:= vote orelse StateName =:= show ->
    role:link_send(Role, 19521, LuckyRole),
    continue(StateName, State);
handle_info({get_lucky_role, _Role}, StateName,
            State) ->
    continue(StateName, State);
handle_info({push_skip_lucky_role, VoteRoleId, Ref},
            StateName,
            State = #state{lucky_role =
                               _LuckyRole = {RoleId, LuckyRoleName, _, _},
                           round = Round, room_info = RoomInfo})
    when StateName =:= quest ->
    logger:debug("推送19531", [], guild_truth_dare_room, 595),
    {_, RoundInfo1} = lists:keyfind(Round, 1, RoomInfo),
    RoleName = case lists:keyfind(VoteRoleId, 2, RoundInfo1)
                   of
                   {_, _, TempName, _, _} -> TempName;
                   _ -> lang:get("")
               end,
    case get(skip_lucky_ref) of
        Ref1 when is_reference(Ref1) ->
            erlang:cancel_timer(Ref),
            logger:debug("进程中的数据：~w",
                         [get()],
                         guild_truth_dare_room,
                         607),
            case RoleName of
                undefined ->
                    logger:error("在真心话大冒险游戏中找不到[~w]玩家的信息",
                                 [VoteRoleId],
                                 guild_truth_dare_room,
                                 610),
                    ok;
                _ ->
                    Msg =
                        lang:get("目前已有<color='#ffff00'>跳过</color>的投票在进行，稍后再试试吧{"
                                 "face_1,22}"),
                    notice:send(VoteRoleId, 1, Msg)
            end;
        _ ->
            role:apply(async,
                       RoleId,
                       {guild_truth_dare_room, push_19531, [RoleName]}),
            put(skip_lucky_ref, Ref),
            logger:debug("保存定时器", [], guild_truth_dare_room, 619),
            {_, RoundInfo} = lists:keyfind(Round, 1, RoomInfo),
            lists:foldl(fun ({_, TempRoleId, _, _, _}, _Acc) ->
                                Msg =
                                    notice:format(lang:get("~ts发起了跳过~ts回合的投票"),
                                                  [{role_2, RoleName},
                                                   {role_2, LuckyRoleName}]),
                                notice:send(TempRoleId, 1, Msg)
                        end,
                        [],
                        RoundInfo)
    end,
    continue(StateName, State);
handle_info({push_skip_lucky_role, _RoleName, Ref},
            StateName, State) ->
    erlang:cancel_timer(Ref),
    continue(StateName, State);
handle_info({get_vote_info, Role}, StateName,
            State = #state{round = Round, room_info = RoomInfo,
                           lucky_question = {_, _, _, _, Flower, Egg, Call},
                           vote_role = VoteRole})
    when StateName =:= vote orelse StateName =:= show ->
    FlowerList = [{RoleId, RoleName, Sex, Classes}
                  || {RoleId,
                      RoleName,
                      Classes,
                      Sex,
                      _Type,
                      _,
                      VoteRoleType,
                      VoteType}
                         <- VoteRole,
                     VoteType =:= 1 andalso VoteRoleType =/= 3],
    EggList = [{RoleId, RoleName, Sex, Classes}
               || {RoleId,
                   RoleName,
                   Classes,
                   Sex,
                   _Type,
                   _,
                   VoteRoleType,
                   VoteType}
                      <- VoteRole,
                  VoteType =:= 2 andalso VoteRoleType =/= 3],
    CallList = [{RoleId, RoleName, Sex, Classes}
                || {RoleId,
                    RoleName,
                    Classes,
                    Sex,
                    _Type,
                    _,
                    VoteRoleType,
                    _VoteType}
                       <- VoteRole,
                   VoteRoleType =:= 3],
    IsPass = case StateName of
                 vote -> 0;
                 _ ->
                     {_, RoundInfo} = lists:keyfind(Round, 1, RoomInfo),
                     Num = erlang:length(RoundInfo),
                     PassNum =
                         guild_truth_dare_data:get_pass_flower_num(Num),
                     case Flower >= PassNum of
                         true -> 1;
                         _ -> 0
                     end
             end,
    role:link_send(Role,
                   19524,
                   {IsPass,
                    Flower,
                    Egg,
                    Call,
                    FlowerList,
                    EggList,
                    CallList}),
    continue(StateName, State);
handle_info({get_vote_info, _Role}, StateName, State) ->
    continue(StateName, State);
handle_info(get_vote_info, StateName,
            State = #state{guild_id = GuildId, round = Round,
                           room_info = RoomInfo,
                           lucky_question = {_, _, _, _, Flower, Egg, Call},
                           vote_role = VoteRole})
    when StateName =:= vote orelse StateName =:= show ->
    FlowerList = [{RoleId, RoleName, Sex, Classes}
                  || {RoleId,
                      RoleName,
                      Classes,
                      Sex,
                      _Type,
                      _,
                      VoteRoleType,
                      VoteType}
                         <- VoteRole,
                     VoteType =:= 1 andalso VoteRoleType =/= 3],
    EggList = [{RoleId, RoleName, Sex, Classes}
               || {RoleId,
                   RoleName,
                   Classes,
                   Sex,
                   _Type,
                   _,
                   VoteRoleType,
                   VoteType}
                      <- VoteRole,
                  VoteType =:= 2 andalso VoteRoleType =/= 3],
    CallList = [{RoleId, RoleName, Sex, Classes}
                || {RoleId,
                    RoleName,
                    Classes,
                    Sex,
                    _Type,
                    _,
                    VoteRoleType,
                    _VoteType}
                       <- VoteRole,
                   VoteRoleType =:= 3],
    IsPass = case StateName of
                 vote -> 0;
                 _ ->
                     {_, RoundInfo} = lists:keyfind(Round, 1, RoomInfo),
                     Num = erlang:length(RoundInfo),
                     PassNum =
                         guild_truth_dare_data:get_pass_flower_num(Num),
                     case Flower >= PassNum of
                         true -> 1;
                         _ -> 0
                     end
             end,
    guild:cast(GuildId,
               19524,
               {IsPass,
                Flower,
                Egg,
                Call,
                FlowerList,
                EggList,
                CallList}),
    continue(StateName, State);
handle_info(get_vote_info, StateName, State) ->
    continue(StateName, State);
handle_info({get_last_choose_num, Role}, StateName,
            State = #state{lucky_num = {MinVal, _, MaxVal}}) ->
    {RoleId, RoleName, _Classes, _Sex, Num} =
        get(last_choose),
    role:link_send(Role,
                   19528,
                   {RoleId, RoleName, Num, MinVal, MaxVal}),
    continue(StateName, State);
handle_info({get_room_board, Role = #role{id = RoleId}},
            StateName,
            State = #state{rank = Rank, first_rank = FirstRank})
    when StateName =:= calc orelse
             StateName =:= redpacket ->
    SelfRank = case lists:keyfind(RoleId, 2, Rank) of
                   {_SelfRank, _, _, _, _, _, _, _} -> _SelfRank;
                   _ -> 0
               end,
    role:link_send(Role,
                   19526,
                   {FirstRank, Rank, SelfRank}),
    continue(StateName, State);
handle_info({get_room_board, _RoleId}, StateName,
            State) ->
    continue(StateName, State);
handle_info({del_question, Id}, StateName,
            State = #state{room_question = RoomQuestion})
    when StateName =:= idle orelse StateName =:= ready ->
    NewRoomQuestion = case lists:keyfind(Id,
                                         1,
                                         RoomQuestion)
                          of
                          {_, _, _, _} -> lists:keydelete(Id, 1, RoomQuestion);
                          _ -> RoomQuestion
                      end,
    continue(StateName,
             State#state{room_question = NewRoomQuestion});
handle_info({del_question, _Id}, StateName, State) ->
    continue(StateName, State);
handle_info({add_question,
             Id,
             RoleName,
             Type,
             Question},
            StateName, State = #state{room_question = RoomQuestion})
    when StateName =:= idle orelse StateName =:= ready ->
    NewRoomQuestion = case lists:keyfind(Id,
                                         1,
                                         RoomQuestion)
                          of
                          {_, _, _, _} -> RoomQuestion;
                          _ -> [{Id, RoleName, Type, Question} | RoomQuestion]
                      end,
    continue(StateName,
             State#state{room_question = NewRoomQuestion});
handle_info({add_question,
             _Id,
             _RoleName,
             _Type,
             _Question},
            StateName, State) ->
    continue(StateName, State);
handle_info({guess_num_timeout, Pos}, active,
            State = #state{guild_id = GuildId,
                           next_answer_pos = AnswerPos, room_info = RoomInfo,
                           round = Round,
                           lucky_num = {MinNum, LuckyNum, MaxNum},
                           round_rank = RoundRank}) ->
    cancel_atom_timer(guess_num_ref),
    case Pos =:= AnswerPos of
        true ->
            {_, RoundInfo} = lists:keyfind(Round, 1, RoomInfo),
            {_, RoleId, RoleName, Classes, Sex} = lists:keyfind(Pos,
                                                                1,
                                                                RoundInfo),
            Num = util:rand(MinNum, MaxNum),
            put(last_choose, {RoleId, RoleName, Classes, Sex, Num}),
            NextAnswerPos = get_next_answer_pos(AnswerPos,
                                                RoundInfo),
            Now = {M, S, _} = date:now2(),
            case Num =:= LuckyNum of
                true ->
                    one_shot_achievement_trigger(MinNum, MaxNum, RoleId),
                    guild:cast(GuildId,
                               19528,
                               {RoleId, RoleName, Num, LuckyNum, LuckyNum}),
                    Timeout = guild_truth_dare_data:get_timeout(3),
                    LuckyRole = {RoleId, RoleName, Sex, Classes},
                    LuckyNotice =
                        notice:format(lang:get("砰地一声，~ts成为本轮幸运儿，幸运数字为<color='#ffff00'>~ts</co"
                                               "lor>{face_1,11}"),
                                      [{role_2, RoleName}, {string_1, Num}]),
                    guild:notice(GuildId, LuckyNotice),
                    guild:cast(GuildId, 19521, LuckyRole),
                    guild:cast(GuildId,
                               19509,
                               {4, M * 1000000 + S + Timeout}),
                    ChooseNotice =
                        notice:format(lang:get("~ts正在选择，<color='#ffff00'>【真心话】</color>还是<colo"
                                               "r='#ffff00'>【大冒险】</color>令ta左右为难"),
                                      [{role_2, RoleName}]),
                    guild:notice(GuildId, ChooseNotice),
                    role:apply(async,
                               RoleId,
                               {guild_truth_dare_room,
                                role_callback,
                                [#evt_truth_dare_lucky{}]}),
                    continue(choose,
                             State#state{ts = Now, timeout = Timeout * 1000,
                                         lucky_num =
                                             {LuckyNum, LuckyNum, LuckyNum},
                                         lucky_role = LuckyRole});
                _ ->
                    Timeout = guild_truth_dare_data:get_timeout(2),
                    Ref = erlang:send_after(Timeout * 1000,
                                            self(),
                                            {guess_num_timeout, NextAnswerPos}),
                    put(guess_num_ref, Ref),
                    put(guess_end_time, M * 1000000 + S + Timeout),
                    {_, RoleId1, RoleName1, Classes1, Sex1} =
                        lists:keyfind(NextAnswerPos, 1, RoundInfo),
                    case Num < LuckyNum of
                        true ->
                            guild:cast(GuildId,
                                       19528,
                                       {RoleId,
                                        RoleName,
                                        Num,
                                        Num + 1,
                                        MaxNum}),
                            AddFlower =
                                guild_truth_dare_data:get_diff_add_flower(Num -
                                                                              MinNum),
                            RoleRoundRank = case lists:keyfind(RoleId,
                                                               1,
                                                               RoundRank)
                                                of
                                                {_,
                                                 _,
                                                 _,
                                                 _,
                                                 Flower,
                                                 Egg,
                                                 Call} ->
                                                    {RoleId,
                                                     RoleName,
                                                     Classes,
                                                     Sex,
                                                     Flower + AddFlower,
                                                     Egg,
                                                     Call};
                                                _ ->
                                                    {RoleId,
                                                     RoleName,
                                                     Classes,
                                                     Sex,
                                                     AddFlower,
                                                     0,
                                                     0}
                                            end,
                            NewRoundRank = lists:keystore(RoleId,
                                                          1,
                                                          RoundRank,
                                                          RoleRoundRank),
                            Notice2 =
                                notice:format(lang:get("~ts瑟瑟发抖，没能在规定时间作答，系统自动输入<color='#ffff00'>~ts<"
                                                       "/color>,爆炸范围变更为<color='#ffff00'>~ts</color>-<"
                                                       "color='#ffff00'>~ts</color>{face_1,7}"),
                                              [{role_2, RoleName},
                                               {string_1, Num},
                                               {string_1, Num + 1},
                                               {string_1, MaxNum}]),
                            guild:notice(GuildId, Notice2),
                            guild:cast(GuildId,
                                       19517,
                                       {Num + 1,
                                        MaxNum,
                                        M * 1000000 + S + Timeout,
                                        RoleId1,
                                        RoleName1,
                                        Sex1,
                                        Classes1}),
                            continue(active,
                                     State#state{next_answer_pos =
                                                     NextAnswerPos,
                                                 lucky_num =
                                                     {Num + 1,
                                                      LuckyNum,
                                                      MaxNum},
                                                 round_rank = NewRoundRank});
                        _ ->
                            guild:cast(GuildId,
                                       19528,
                                       {RoleId,
                                        RoleName,
                                        Num,
                                        MinNum,
                                        Num - 1}),
                            AddFlower =
                                guild_truth_dare_data:get_diff_add_flower(MaxNum
                                                                              -
                                                                              Num),
                            RoleRoundRank = case lists:keyfind(RoleId,
                                                               1,
                                                               RoundRank)
                                                of
                                                {_,
                                                 _,
                                                 _,
                                                 _,
                                                 Flower,
                                                 Egg,
                                                 Call} ->
                                                    {RoleId,
                                                     RoleName,
                                                     Classes,
                                                     Sex,
                                                     Flower + AddFlower,
                                                     Egg,
                                                     Call};
                                                _ ->
                                                    {RoleId,
                                                     RoleName,
                                                     Classes,
                                                     Sex,
                                                     AddFlower,
                                                     0,
                                                     0}
                                            end,
                            NewRoundRank = lists:keystore(RoleId,
                                                          1,
                                                          RoundRank,
                                                          RoleRoundRank),
                            Notice3 =
                                notice:format(lang:get("~ts瑟瑟发抖，没能在规定时间作答，系统自动输入<color='#ffff00'>~ts<"
                                                       "/color>,爆炸范围变更为<color='#ffff00'>~ts</color>-<"
                                                       "color='#ffff00'>~ts</color>{face_1,7}"),
                                              [{role_2, RoleName},
                                               {string_1, Num},
                                               {string_1, MinNum},
                                               {string_1, Num - 1}]),
                            guild:notice(GuildId, Notice3),
                            guild:cast(GuildId,
                                       19517,
                                       {MinNum,
                                        Num - 1,
                                        M * 1000000 + S + Timeout,
                                        RoleId1,
                                        RoleName1,
                                        Sex1,
                                        Classes1}),
                            continue(active,
                                     State#state{next_answer_pos =
                                                     NextAnswerPos,
                                                 lucky_num =
                                                     {MinNum,
                                                      LuckyNum,
                                                      Num - 1},
                                                 round_rank = NewRoundRank})
                    end
            end;
        _ -> continue(active, State)
    end;
handle_info({guess_num_timeout, _Pos}, StateName,
            State) ->
    cancel_atom_timer(guess_num_ref),
    continue(StateName, State);
handle_info(stop_room, _StateName,
            State = #state{guild_id = GuildId, room_info = RoomInfo,
                           log_info =
                               LogInfo = #guild_truth_dare_room_log{scene_info =
                                                                        SceneInfo,
                                                                    contents =
                                                                        Contents}}) ->
    {_, RoundInfo} = lists:keyfind(1, 1, RoomInfo),
    stop_room_send(RoundInfo),
    guild:notice(GuildId,
                 lang:get("真心话大冒险到这里就结束啦，今晚你成为幸运儿了吗？下期继续哈皮吧{face_1,15}")),
    NewSceneInfo = lists:foldl(fun ({S, Info}, Acc) ->
                                       [[{S, lists:flatten(Info)}] | Acc]
                               end,
                               [],
                               lists:flatten(SceneInfo)),
    NewLogInfo =
        LogInfo#guild_truth_dare_room_log{scene_info =
                                              lists:flatten(NewSceneInfo),
                                          contents = lists:flatten(Contents)},
    guild_mgr:insert_truth_dare_log(NewLogInfo),
    log:guild_truth_dare(),
    {stop, normal, State};
handle_info(_Info, StateName, State) ->
    continue(StateName, State).

terminate(_Reason, _StateName, _State) -> ok.

code_change(_OldVsn, StateName, State, _Extra) ->
    {ok, StateName, State}.

idle(timeout, State = #state{guild_id = GuildId}) ->
    guild:cast(GuildId, 19509, {2, 0}),
    continue(idle, State).

ready(timeout,
      State = #state{guild_id = GuildId, room_info = RoomInfo,
                     round = Round, scene = Scene,
                     log_info =
                         LogInfo = #guild_truth_dare_room_log{scene_info =
                                                                  SceneInfo}}) ->
    {_, RoundInfo} = lists:keyfind(Round + 1, 1, RoomInfo),
    Len = erlang:length(RoundInfo),
    [#{min_role_num := MinRoleNum}] =
        guild_truth_dare_data:get_cfg(),
    case Len >= MinRoleNum of
        true ->
            Now = {M, S, _} = date:now2(),
            guild:cast(GuildId, 19509, {3, 0}),
            [#{min_val := MinNum, max_val := MaxNum}] =
                guild_truth_dare_data:get_cfg(),
            LuckyNum = util:rand(MinNum, MaxNum),
            FirstPos = get_first_pos(RoundInfo),
            {_, RoleId, RoleName, Classes, Sex} =
                lists:keyfind(FirstPos, 1, RoundInfo),
            achievement_trigger(RoundInfo),
            cancel_atom_timer(guess_num_ref),
            Timeout = guild_truth_dare_data:get_timeout(2),
            Ref = erlang:send_after(Timeout * 1000,
                                    self(),
                                    {guess_num_timeout, FirstPos}),
            put(guess_num_ref, Ref),
            NewLogInfo =
                LogInfo#guild_truth_dare_room_log{scene_info =
                                                      [SceneInfo,
                                                       {Scene,
                                                        [{Round + 1, Len}]}]},
            NewRoomInfo = [{2, RoundInfo} | RoomInfo],
            put(guess_end_time, M * 1000000 + S + Timeout),
            Data = get_push_room_info(active,
                                      State#state{round = Round + 1,
                                                  room_info = NewRoomInfo}),
            guild:cast(GuildId, 19515, Data),
            guild:cast(GuildId,
                       19517,
                       {MinNum,
                        MaxNum,
                        M * 1000000 + S + Timeout,
                        RoleId,
                        RoleName,
                        Sex,
                        Classes}),
            RoomQuestion = case lookup_question_bank(GuildId) of
                               {ok,
                                #guild_truth_dare_question_bank{question =
                                                                    QuestionList}} ->
                                   [{Id, Type, RoleName1, Question}
                                    || #guild_truth_dare_question{question_id =
                                                                      Id,
                                                                  type = Type,
                                                                  role_name =
                                                                      RoleName1,
                                                                  question =
                                                                      Question,
                                                                  is_choose =
                                                                      IsChoose}
                                           <- QuestionList,
                                       IsChoose =:= 1];
                               _ ->
                                   CfgIdList =
                                       guild_truth_dare_data:get_question_list(),
                                   get_cfg_question(CfgIdList, [])
                           end,
            continue(active,
                     State#state{ts = Now, timeout = infinity,
                                 round = Round + 1, room_info = NewRoomInfo,
                                 next_answer_pos = FirstPos,
                                 lucky_num = {MinNum, LuckyNum, MaxNum},
                                 room_question = RoomQuestion,
                                 log_info = NewLogInfo});
        _ ->
            Now1 = {M1, S1, _} = date:now2(),
            Timeout = 2 * 60,
            guild:cast(GuildId,
                       19509,
                       {2, M1 * 1000000 + S1 + Timeout}),
            continue(ready,
                     State#state{ts = Now1, timeout = Timeout * 1000,
                                 scene = Scene - 1})
    end.

active(timeout, State) ->
    continue(active,
             State#state{ts = date:now2(), timeout = infinity}).

choose(timeout,
       State = #state{guild_id = GuildId,
                      lucky_role = {LuckyRoleId, RoleName, _, _},
                      room_question = RoomQuestion, round = Round,
                      room_info = RoomInfo,
                      log_info =
                          LogInfo = #guild_truth_dare_room_log{dare_num =
                                                                   DareNum,
                                                               truth_num =
                                                                   TruthNum,
                                                               contents =
                                                                   Contents}}) ->
    Now = {M, S, _} = date:now2(),
    Timeout = guild_truth_dare_data:get_timeout(4),
    guild:cast(GuildId,
               19509,
               {5, M * 1000000 + S + Timeout}),
    Type = util:rand_list([2, 1]),
    ChooseNotice = case Type of
                       2 ->
                           role:apply(async,
                                      LuckyRoleId,
                                      {guild_truth_dare_room,
                                       role_callback,
                                       [#evt_truth_dare_lucky_choose{type =
                                                                         2}]}),
                           notice:format(lang:get("~ts选择了<color='#ffff00'>【大冒险】</color>，快一起来看看有什"
                                                  "么劲爆的展开吧！{face_1,15}"),
                                         [{role_2, RoleName}]);
                       1 ->
                           role:apply(async,
                                      LuckyRoleId,
                                      {guild_truth_dare_room,
                                       role_callback,
                                       [#evt_truth_dare_lucky_choose{type =
                                                                         1}]}),
                           notice:format(lang:get("~ts选择了<color='#ffff00'>【真心话】</color>，等一个引爆场面的"
                                                  "答案！{face_1,15}"),
                                         [{role_2, RoleName}])
                   end,
    guild:notice(GuildId, ChooseNotice),
    QuestionTypeList = [{Id1, Type1, RoleName1, Question1}
                        || {Id1, Type1, RoleName1, Question1} <- RoomQuestion,
                           Type =:= Type1],
    {Id, _, RoleName2, OriginalQuestion} =
        util:rand_list(QuestionTypeList),
    RoundInfo = lists:keyfind(Round, 1, RoomInfo),
    Question = question_change(OriginalQuestion,
                               LuckyRoleId,
                               RoundInfo,
                               GuildId),
    VoteRound = 1,
    guild:cast(GuildId,
               19520,
               {Type, RoleName2, Question, VoteRound}),
    NewLogInfo = case Id >= 1000 of
                     true ->
                         case Type of
                             2 ->
                                 LogInfo#guild_truth_dare_room_log{dare_num =
                                                                       DareNum +
                                                                           1,
                                                                   contents =
                                                                       [Contents,
                                                                        {Type,
                                                                         Question}]};
                             1 ->
                                 LogInfo#guild_truth_dare_room_log{truth_num =
                                                                       TruthNum
                                                                           + 1,
                                                                   contents =
                                                                       [Contents,
                                                                        {Type,
                                                                         Question}]}
                         end;
                     _ ->
                         case Type of
                             2 ->
                                 LogInfo#guild_truth_dare_room_log{dare_num =
                                                                       DareNum +
                                                                           1};
                             1 ->
                                 LogInfo#guild_truth_dare_room_log{truth_num =
                                                                       TruthNum
                                                                           + 1}
                         end
                 end,
    continue(quest,
             State#state{ts = Now, timeout = Timeout * 1000,
                         lucky_question =
                             {VoteRound, Type, Id, Question, 0, 0, 0},
                         log_info = NewLogInfo}).

quest(timeout, State = #state{guild_id = GuildId}) ->
    Now = {M, S, _} = date:now2(),
    Timeout = guild_truth_dare_data:get_timeout(5),
    guild:cast(GuildId,
               19509,
               {6, M * 1000000 + S + Timeout}),
    continue(vote,
             State#state{ts = Now, timeout = Timeout * 1000}).

vote(timeout,
     State = #state{guild_id = GuildId,
                    lucky_role = {LuckyRoleId, _, _, _}}) ->
    Now = {M, S, _} = date:now2(),
    Timeout = guild_truth_dare_data:get_timeout(6),
    Data = get_vote_info(show, State),
    guild:cast(GuildId, 19524, Data),
    guild:cast(GuildId,
               19509,
               {7, M * 1000000 + S + Timeout}),
    role:apply(sync,
               LuckyRoleId,
               {guild_truth_dare_role, apply, []}),
    continue(show,
             State#state{ts = Now, timeout = Timeout * 1000}).

show(timeout,
     State = #state{guild_id = GuildId, room_info = RoomInfo,
                    lucky_question =
                        {VoteRound, Type, Qid, Question, Flower, Egg, Call},
                    next_answer_pos = NextAnswerPos, round = Round,
                    lucky_role = {LuckyRoleId, RoleName, Sex, Classes},
                    vote_role = VoteRole, rank = Rank,
                    round_rank = RoundRank, room_question = RoomQuestion,
                    scene = Scene,
                    log_info =
                        LogInfo = #guild_truth_dare_room_log{scene_info =
                                                                 SceneInfo},
                    skip_lucky = SkipLucky}) ->
    cancel_atom_timer(skip_lucky_ref),
    [#{max_round := MaxRound,
       max_vote_round := MaxVoteRound, min_val := MinNum,
       max_val := MaxNum}] =
        guild_truth_dare_data:get_cfg(),
    Now = {M, S, _} = date:now2(),
    {_, RoundInfo} = lists:keyfind(Round, 1, RoomInfo),
    Num = erlang:length(RoundInfo),
    put(last_round_num, Num),
    PassNum =
        guild_truth_dare_data:get_pass_flower_num(Num),
    IsShowEnd = case SkipLucky =:= 1 of
                    true ->
                        logger:debug("跳过幸运儿回合，不判断是第几轮答题",
                                     [],
                                     guild_truth_dare_room,
                                     939),
                        1;
                    _ ->
                        case Flower >= PassNum of
                            true -> 1;
                            _ ->
                                case VoteRound =:= MaxVoteRound of
                                    true ->
                                        role:apply(async,
                                                   LuckyRoleId,
                                                   {guild_truth_dare_room,
                                                    role_callback,
                                                    [#evt_truth_dare_two_fail{}]}),
                                        1;
                                    _ -> 0
                                end
                        end
                end,
    case IsShowEnd of
        1 ->
            case lookup_his_info(GuildId) of
                {ok,
                 GuildTruthDareInfo = #guild_truth_dare_info{next_id =
                                                                 NextId,
                                                             his_info =
                                                                 HisInfo}} ->
                    NewHisInfo = case SkipLucky =:= 1 of
                                     true ->
                                         logger:debug("跳过幸运儿回合，投票结果清0",
                                                      [],
                                                      guild_truth_dare_room,
                                                      962),
                                         [#guild_truth_dare_his_info{id =
                                                                         NextId
                                                                             +
                                                                             1,
                                                                     time = Now,
                                                                     lucky_role
                                                                         =
                                                                         LuckyRoleId,
                                                                     role_name =
                                                                         RoleName,
                                                                     classes =
                                                                         Classes,
                                                                     sex = Sex,
                                                                     flower = 0,
                                                                     egg = 0,
                                                                     question_type
                                                                         = Type,
                                                                     question =
                                                                         Question}
                                          | HisInfo];
                                     _ ->
                                         [#guild_truth_dare_his_info{id =
                                                                         NextId
                                                                             +
                                                                             1,
                                                                     time = Now,
                                                                     lucky_role
                                                                         =
                                                                         LuckyRoleId,
                                                                     role_name =
                                                                         RoleName,
                                                                     classes =
                                                                         Classes,
                                                                     sex = Sex,
                                                                     flower =
                                                                         Flower,
                                                                     egg = Egg,
                                                                     question_type
                                                                         = Type,
                                                                     question =
                                                                         Question}
                                          | HisInfo]
                                 end,
                    NewGuildTruthDareInfo =
                        GuildTruthDareInfo#guild_truth_dare_info{next_id =
                                                                     NextId + 1,
                                                                 his_info =
                                                                     NewHisInfo},
                    update_his_info(NewGuildTruthDareInfo);
                _ ->
                    NewHisInfo1 = [#guild_truth_dare_his_info{id = 1,
                                                              time = Now,
                                                              lucky_role =
                                                                  LuckyRoleId,
                                                              role_name =
                                                                  RoleName,
                                                              classes = Classes,
                                                              sex = Sex,
                                                              flower = Flower,
                                                              egg = Egg,
                                                              question_type =
                                                                  Type,
                                                              question =
                                                                  Question}],
                    NewGuildTruthDareInfo = #guild_truth_dare_info{guild_id
                                                                       =
                                                                       GuildId,
                                                                   next_id = 1,
                                                                   his_info =
                                                                       NewHisInfo1},
                    update_his_info(NewGuildTruthDareInfo)
            end,
            NewRank1 = add_rank([{LuckyRoleId,
                                  RoleName,
                                  Classes,
                                  Sex,
                                  Flower,
                                  Egg,
                                  Call}],
                                Rank),
            NewRank2 = add_rank(RoundRank, NewRank1),
            VoteRank = vote_role_to_rank(VoteRole, []),
            NewRank3 = add_rank(VoteRank, NewRank2),
            NewRank4 = util:keys_sort([8, 7, 6], NewRank3),
            SortRank = sort_rank(NewRank4, 1, []),
            case Round + 1 =< MaxRound of
                true ->
                    {_, NextRoundInfo1} = lists:keyfind(Round + 1,
                                                        1,
                                                        RoomInfo),
                    RoleNum = erlang:length(NextRoundInfo1),
                    [#{min_role_num := MinRoleNum}] =
                        guild_truth_dare_data:get_cfg(),
                    case RoleNum >= MinRoleNum of
                        true ->
                            Notice1 =
                                notice:format("<color='#ffff00'>幸运儿</color>~ts<color='#ffff0"
                                              "0'>获得了~ts朵花，~ts个鸡蛋。即将开始下一轮！</color>",
                                              [{role_2, RoleName},
                                               {string_1, Flower},
                                               {string_1, Egg}]),
                            guild:notice(GuildId, Notice1),
                            NextRoundInfo = case RoleNum - 1 >= MinRoleNum of
                                                true ->
                                                    case SkipLucky of
                                                        0 -> NextRoundInfo1;
                                                        _ ->
                                                            logger:debug("踢出玩家:~w",
                                                                         [RoleName],
                                                                         guild_truth_dare_room,
                                                                         1002),
                                                            lists:keydelete(LuckyRoleId,
                                                                            2,
                                                                            NextRoundInfo1)
                                                    end;
                                                _ -> NextRoundInfo1
                                            end,
                            ReplacedRoomInfo = lists:keyreplace(Round + 1,
                                                                1,
                                                                RoomInfo,
                                                                {Round + 1,
                                                                 NextRoundInfo}),
                            LuckyNum = util:rand(MinNum, MaxNum),
                            NextRoundAnswerPos =
                                get_next_answer_pos(NextAnswerPos,
                                                    NextRoundInfo),
                            {_, RoleId1, RoleName1, Classes1, Sex1} =
                                lists:keyfind(NextRoundAnswerPos,
                                              1,
                                              NextRoundInfo),
                            NewRoomInfo2 = [{Round + 2, NextRoundInfo}
                                            | ReplacedRoomInfo],
                            achievement_trigger(NextRoundInfo),
                            {_, OldRoundInfo} = lists:keyfind(Scene,
                                                              1,
                                                              SceneInfo),
                            NewSceneInfo = lists:keystore(Scene,
                                                          1,
                                                          SceneInfo,
                                                          {Scene,
                                                           [OldRoundInfo,
                                                            {Round + 1,
                                                             RoleNum}]}),
                            NewLogInfo =
                                LogInfo#guild_truth_dare_room_log{scene_info =
                                                                      NewSceneInfo},
                            cancel_atom_timer(guess_num_ref),
                            Timeout = guild_truth_dare_data:get_timeout(2),
                            Ref = erlang:send_after(Timeout * 1000,
                                                    self(),
                                                    {guess_num_timeout,
                                                     NextRoundAnswerPos}),
                            put(guess_num_ref, Ref),
                            put(guess_end_time, M * 1000000 + S + Timeout),
                            guild:cast(GuildId, 19509, {3, 0}),
                            Data = get_push_room_info(active,
                                                      State#state{round =
                                                                      Round + 1,
                                                                  room_info =
                                                                      NewRoomInfo2}),
                            guild:cast(GuildId, 19515, Data),
                            guild:cast(GuildId,
                                       19517,
                                       {MinNum,
                                        MaxNum,
                                        M * 1000000 + S + Timeout,
                                        RoleId1,
                                        RoleName1,
                                        Sex1,
                                        Classes1}),
                            continue(active,
                                     State#state{ts = Now, timeout = infinity,
                                                 round = Round + 1,
                                                 room_info = NewRoomInfo2,
                                                 next_answer_pos =
                                                     NextRoundAnswerPos,
                                                 lucky_num =
                                                     {MinNum, LuckyNum, MaxNum},
                                                 lucky_role = undefined,
                                                 lucky_question = undefined,
                                                 vote_role = [],
                                                 rank = SortRank,
                                                 round_rank = [],
                                                 log_info = NewLogInfo,
                                                 skip_lucky = 0});
                        _ ->
                            guild:notice(GuildId,
                                         lang:get("<color='#ffff00'>本局真心话大冒险结束啦，即将开始下一局，快喊小伙伴一起来"
                                                  "玩吧</color>{face_1,7}")),
                            FirstRank = get_first_rank(SortRank, RoomInfo),
                            Timeout2 = guild_truth_dare_data:get_timeout(7),
                            guild:cast(GuildId,
                                       19509,
                                       {8, M * 1000000 + S + Timeout2}),
                            continue(redpacket,
                                     State#state{ts = Now,
                                                 timeout = Timeout2 * 1000,
                                                 rank = SortRank,
                                                 round_rank = [],
                                                 first_rank = FirstRank,
                                                 skip_lucky = 0})
                    end;
                _ ->
                    FirstRank = get_first_rank(SortRank, RoomInfo),
                    send_first_rank_reward(FirstRank),
                    FlowerName = case lists:keyfind(1, 1, FirstRank) of
                                     {_, FlowerRoleId, _FlowerName, _, _, _} ->
                                         role:apply(async,
                                                    FlowerRoleId,
                                                    {guild_truth_dare_room,
                                                     role_callback,
                                                     [#evt_truth_dare_end{type =
                                                                              1}]}),
                                         _FlowerName;
                                     _ -> ""
                                 end,
                    EggName = case lists:keyfind(2, 1, FirstRank) of
                                  {_, EggRoleId, _EggName, _, _, _} ->
                                      role:apply(async,
                                                 EggRoleId,
                                                 {guild_truth_dare_room,
                                                  role_callback,
                                                  [#evt_truth_dare_end{type =
                                                                           2}]}),
                                      _EggName;
                                  _ -> ""
                              end,
                    WatchName = case lists:keyfind(3, 1, FirstRank) of
                                    {_, WatchRoleId, _WatchName, _, _, _} ->
                                        role:apply(async,
                                                   WatchRoleId,
                                                   {guild_truth_dare_room,
                                                    role_callback,
                                                    [#evt_truth_dare_end{type =
                                                                             3}]}),
                                        _WatchName;
                                    _ -> ""
                                end,
                    Notice2 =
                        notice:format(lang:get("本局真心话大冒险结束，恭喜~ts成为了<color='#ffff00'>公会小花</col"
                                               "or>，~ts获得了<color='#ffff00'>“蛋碎一地”</color>的美称，"
                                               "~ts成为了<color='#ffff00'>幸运观众</color>，即将开始下一轮，这"
                                               "次又是谁会上榜呢？{face_1,25}"),
                                      [{role_2, FlowerName},
                                       {role_2, EggName},
                                       {role_2, WatchName}]),
                    guild:notice(GuildId, Notice2),
                    Timeout1 = guild_truth_dare_data:get_timeout(7),
                    guild:cast(GuildId,
                               19509,
                               {8, M * 1000000 + S + Timeout1}),
                    continue(redpacket,
                             State#state{ts = Now, timeout = Timeout1 * 1000,
                                         rank = SortRank, round_rank = [],
                                         first_rank = FirstRank,
                                         skip_lucky = 0})
            end;
        _ ->
            Timeout = guild_truth_dare_data:get_timeout(4),
            QuestionRoleName = case lists:keyfind(Qid,
                                                  1,
                                                  RoomQuestion)
                                   of
                                   {_, _, RoleName1, _} -> RoleName1;
                                   _ -> ""
                               end,
            guild:cast(GuildId,
                       19509,
                       {5, M * 1000000 + S + Timeout}),
            guild:cast(GuildId,
                       19520,
                       {Type, QuestionRoleName, Question, VoteRound + 1}),
            continue(quest,
                     State#state{ts = Now, timeout = Timeout * 1000,
                                 lucky_question =
                                     {VoteRound + 1,
                                      Type,
                                      Qid,
                                      Question,
                                      0,
                                      0,
                                      0},
                                 vote_role = [], skip_lucky = 0})
    end.

redpacket(timeout,
          State = #state{guild_id = GuildId,
                         red_packet = RedPacket, rank = Rank}) ->
    Num = get(last_round_num),
    [#{loss := [{_, LossNum}],
       max_role_num := MaxRoleNum}] =
        guild_truth_dare_data:get_cfg(),
    NewRedPacket = max(0,
                       min(RedPacket, LossNum * MaxRoleNum)),
    NewState = State#state{red_packet = NewRedPacket},
    send_envelop(Rank, GuildId, NewRedPacket, Num),
    Now = {M, S, _} = date:now2(),
    Timeout = guild_truth_dare_data:get_timeout(8),
    guild:cast(GuildId,
               19509,
               {9, M * 1000000 + S + Timeout}),
    continue(calc,
             NewState#state{ts = Now, timeout = Timeout * 1000}).

calc(timeout,
     _State = #state{guild_id = GuildId,
                     room_question = RoomQuestion, scene = Scene,
                     log_info = LogInfo}) ->
    case guild_truth_dare_mgr:call(get_status) of
        {ok, 1} ->
            NewState = #state{guild_id = GuildId,
                              room_info = [{1, []}],
                              room_question = RoomQuestion, scene = Scene + 1,
                              log_info = LogInfo},
            Data = get_push_room_info(idle, NewState),
            guild:cast(GuildId, 19515, Data),
            guild:cast(GuildId, 19509, {1, 0}),
            continue(idle, NewState);
        _ ->
            guild:notice(GuildId,
                         lang:get("真心话大冒险到这里就结束啦，今晚你成为幸运儿了吗？下期继续哈皮吧{face_1,15}")),
            guild_truth_dare_mgr:info({stop_room, GuildId}),
            {stop, normal, _State}
    end.

continue(StateName,
         State = #state{timeout = infinity}) ->
    {next_state, StateName, State, infinity};
continue(StateName,
         State = #state{ts = Ts, timeout = Timeout}) ->
    {next_state,
     StateName,
     State,
     util:time_left(Timeout, Ts)}.

continue(Reply, StateName,
         State = #state{timeout = infinity}) ->
    {reply, Reply, StateName, State, infinity};
continue(Reply, StateName,
         State = #state{ts = Ts, timeout = Timeout}) ->
    {reply,
     Reply,
     StateName,
     State,
     util:time_left(Timeout, Ts)}.

cancel_atom_timer(Atom) ->
    case get(Atom) of
        Ref when is_reference(Ref) ->
            logger:debug("删除定时器：~w",
                         [Atom],
                         guild_truth_dare_room,
                         1132),
            erlang:cancel_timer(Ref);
        _ -> ok
    end.

lookup_question_bank(GuildId) ->
    case catch ets:lookup(guild_truth_dare_question_bank,
                          GuildId)
        of
        [GuildTruthDareQuestionBank =
             #guild_truth_dare_question_bank{}] ->
            {ok, GuildTruthDareQuestionBank};
        _ -> false
    end.

lookup_his_info(GuildId) ->
    case catch ets:lookup(guild_truth_dare_his, GuildId) of
        [GuildTruthDareInfo = #guild_truth_dare_info{}] ->
            {ok, GuildTruthDareInfo};
        _ -> false
    end.

update_his_info(NewInfo) ->
    ets:insert(guild_truth_dare_his, NewInfo),
    dets:insert(guild_truth_dare_his, NewInfo),
    ok.

get_empty_pos(RoomInfo) ->
    [#{max_role_num := MaxRoleNum}] =
        guild_truth_dare_data:get_cfg(),
    get_empty_pos(1, MaxRoleNum, RoomInfo).

get_empty_pos(Num, Num, RoomInfo) ->
    case lists:keyfind(Num, 1, RoomInfo) of
        false -> Num;
        _ -> false
    end;
get_empty_pos(Num, MaxNum, RoomInfo) ->
    case lists:keyfind(Num, 1, RoomInfo) of
        false -> Num;
        _ -> get_empty_pos(Num + 1, MaxNum, RoomInfo)
    end.

get_first_pos(RoundInfo) ->
    [#{max_role_num := MaxRoleNum}] =
        guild_truth_dare_data:get_cfg(),
    get_first_pos(RoundInfo, MaxRoleNum).

get_first_pos([], FirstPos) -> FirstPos;
get_first_pos([{Pos, _, _, _, _} | Rest], FirstPos) ->
    case Pos < FirstPos of
        true -> get_first_pos(Rest, Pos);
        _ -> get_first_pos(Rest, FirstPos)
    end.

get_next_answer_pos(AnswerPos, RoomInfo) ->
    get_next_answer_pos(AnswerPos,
                        lists:sort(RoomInfo),
                        get_first_pos(RoomInfo)).

get_next_answer_pos(_AnswerPos, [], FirstPos) ->
    FirstPos;
get_next_answer_pos(AnswerPos,
                    [{Pos, _, _, _, _} | Rest], FirstPos) ->
    case Pos =< AnswerPos of
        true -> get_next_answer_pos(AnswerPos, Rest, FirstPos);
        _ -> Pos
    end.

one_shot_achievement_trigger(MinNum, MaxNum, RoleId) ->
    [#{min_val := CfgMinNum, max_val := CfgMaxNum}] =
        guild_truth_dare_data:get_cfg(),
    case CfgMinNum =:= MinNum andalso CfgMaxNum =:= MaxNum
        of
        true ->
            role:apply(async,
                       RoleId,
                       {guild_truth_dare_room,
                        role_callback,
                        [#evt_truth_dare_one_shot{}]});
        _ -> ok
    end.

achievement_trigger([]) -> ok;
achievement_trigger([{_Pos,
                      RoleId,
                      _RoleName,
                      _Classes,
                      _Sex}
                     | T]) ->
    role:apply(async,
               RoleId,
               {guild_truth_dare_room,
                role_callback,
                [#evt_truth_dare_join{}]}),
    achievement_trigger(T).

role_callback(Role, Evt) ->
    logger:debug("触发真心话大冒险成就：[evt]:~w",
                 [Evt],
                 guild_truth_dare_room,
                 1218),
    NewRole = role_trigger:fire(Evt, Role),
    {ok, NewRole}.

push_19531(Role, RoleName) ->
    role:link_send(Role, 19531, {RoleName, 20}),
    ok.

question_change(Question, RoleId, RoomInfo, GuildId) ->
    question_change(Question,
                    RoleId,
                    RoomInfo,
                    GuildId,
                    []).

question_change([], _RoleId, _RoomInfo, _GuildId,
                NewQuestion) ->
    lists:flatten(NewQuestion);
question_change([H | T], RoleId, RoomInfo, GuildId,
                NewQuestion) ->
    case H =:= $@ of
        true ->
            case T of
                [] ->
                    question_change(T,
                                    RoleId,
                                    RoomInfo,
                                    GuildId,
                                    [NewQuestion, H]);
                [H1 | T1] ->
                    RoleName = get_role_name(H1, RoleId, RoomInfo, GuildId),
                    case RoleName of
                        undefined ->
                            question_change(T1,
                                            RoleId,
                                            RoomInfo,
                                            GuildId,
                                            [NewQuestion, [H], H1]);
                        _ ->
                            NewRoleName = "<color='#225ee7'>" ++
                                              RoleName ++ "</color>",
                            question_change(T1,
                                            RoleId,
                                            RoomInfo,
                                            GuildId,
                                            [NewQuestion | NewRoleName])
                    end
            end;
        _ ->
            question_change(T,
                            RoleId,
                            RoomInfo,
                            GuildId,
                            [NewQuestion, H])
    end.

get_role_name(Type, LuckyRoleId,
              _RoomInfo = {_Round, Participants}, GuildId) ->
    ParticipantRole = [RoleName
                       || {_Pos, RoleId, RoleName, _Classes, _Sex}
                              <- Participants,
                          RoleId =/= LuckyRoleId],
    Result = util:rand_list(ParticipantRole),
    case Type of
        49 -> Result;
        _ ->
            GuildMembers = case guild_mgr:members(GuildId) of
                               {ok, Members} -> Members;
                               _ -> []
                           end,
            GuildOnlineMembers = [GuildRole
                                  || GuildRole = #guild_role{id = Id, pid = Pid}
                                         <- GuildMembers,
                                     is_pid(Pid), Id =/= LuckyRoleId],
            case Type of
                50 ->
                    NameList1 = [Name
                                 || #guild_role{name = Name, post = Post}
                                        <- GuildOnlineMembers,
                                    Post =:= 25],
                    case util:rand_list(NameList1) of
                        undefined -> Result;
                        Result1 -> Result1
                    end;
                51 ->
                    NameList2 = [Name
                                 || #guild_role{name = Name, post = Post}
                                        <- GuildOnlineMembers,
                                    Post =:= 60 orelse Post =:= 50],
                    case util:rand_list(NameList2) of
                        undefined -> Result;
                        Result2 -> Result2
                    end;
                52 ->
                    NameList3 = [Name
                                 || #guild_role{name = Name, post = Post}
                                        <- GuildOnlineMembers,
                                    Post =:= 40],
                    case util:rand_list(NameList3) of
                        undefined -> Result;
                        Result3 -> Result3
                    end;
                53 ->
                    NameList4 = [Name
                                 || #guild_role{name = Name, post = Post}
                                        <- GuildOnlineMembers,
                                    Post =:= 30 orelse Post =:= 20],
                    case util:rand_list(NameList4) of
                        undefined -> Result;
                        Result4 -> Result4
                    end;
                54 ->
                    NameList5 = [Name
                                 || #guild_role{name = Name, sex = Sex}
                                        <- GuildOnlineMembers,
                                    Sex =:= 0],
                    case util:rand_list(NameList5) of
                        undefined -> Result;
                        Result5 -> Result5
                    end;
                55 ->
                    NameList6 = [Name
                                 || #guild_role{name = Name, sex = Sex}
                                        <- GuildOnlineMembers,
                                    Sex =:= 1],
                    case util:rand_list(NameList6) of
                        undefined -> Result;
                        Result6 -> Result6
                    end;
                _ -> undefined
            end
    end.

get_cfg_question([], CfgQuestionList) ->
    CfgQuestionList;
get_cfg_question([Id | Rest], CfgQuestionList) ->
    case guild_truth_dare_data:get_question(Id) of
        #{id := Id, type := Type, question := Question} ->
            get_cfg_question(Rest,
                             [{Id, Type, "", Question} | CfgQuestionList]);
        _ -> get_cfg_question(Rest, CfgQuestionList)
    end.

get_push_room_info(idle,
                   #state{round = Round, room_info = RoomInfo}) ->
    {_, RoundInfo} = lists:keyfind(Round + 1, 1, RoomInfo),
    [#{max_round := MaxRound, max_role_num := MaxNum}] =
        guild_truth_dare_data:get_cfg(),
    Num = erlang:length(RoundInfo),
    PosInfo = [{Rid, Name, Sex, Classes, Pos}
               || {Pos, Rid, Name, Classes, Sex} <- RoundInfo],
    [#{max_round := MaxRound, max_role_num := MaxNum}] =
        guild_truth_dare_data:get_cfg(),
    {max(0, MaxNum - Num), 0, Round, MaxRound, [], PosInfo};
get_push_room_info(ready,
                   #state{ts = {M, S, _}, timeout = Timeout,
                          room_info = RoomInfo, round = Round}) ->
    {_, RoundInfo} = lists:keyfind(Round + 1, 1, RoomInfo),
    [#{max_round := MaxRound, max_role_num := MaxNum}] =
        guild_truth_dare_data:get_cfg(),
    Num = erlang:length(RoundInfo),
    PosInfo = [{Rid, Name, Sex, Classes, Pos}
               || {Pos, Rid, Name, Classes, Sex} <- RoundInfo],
    {max(0, MaxNum - Num),
     M * 1000000 + S + util:floor(Timeout / 1000),
     Round,
     MaxRound,
     [],
     PosInfo};
get_push_room_info(active,
                   #state{room_info = RoomInfo, round = Round}) ->
    {_, RoundInfo} = lists:keyfind(Round, 1, RoomInfo),
    [#{max_round := MaxRound, max_role_num := MaxNum}] =
        guild_truth_dare_data:get_cfg(),
    {Num, NextRoundInfo} = case lists:keyfind(Round + 1,
                                              1,
                                              RoomInfo)
                               of
                               {_, _NextRoundInfo} ->
                                   _Num = erlang:length(_NextRoundInfo),
                                   {_Num, _NextRoundInfo};
                               _ -> {MaxNum, []}
                           end,
    PosInfo = [{Rid, Name, Sex, Classes, Pos}
               || {Pos, Rid, Name, Classes, Sex} <- RoundInfo],
    NextPosInfo = [{Rid, Name, Sex, Classes, Pos}
                   || {Pos, Rid, Name, Classes, Sex} <- NextRoundInfo],
    {max(0, MaxNum - Num),
     0,
     Round,
     MaxRound,
     PosInfo,
     NextPosInfo};
get_push_room_info(_StateName,
                   #state{ts = {M, S, _}, timeout = Timeout,
                          room_info = RoomInfo, round = Round}) ->
    {_, RoundInfo} = lists:keyfind(Round, 1, RoomInfo),
    [#{max_round := MaxRound, max_role_num := MaxNum}] =
        guild_truth_dare_data:get_cfg(),
    {Num, NextRoundInfo} = case lists:keyfind(Round + 1,
                                              1,
                                              RoomInfo)
                               of
                               {_, _NextRoundInfo} ->
                                   _Num = erlang:length(_NextRoundInfo),
                                   {_Num, _NextRoundInfo};
                               _ -> {MaxNum, []}
                           end,
    PosInfo = [{Rid, Name, Sex, Classes, Pos}
               || {Pos, Rid, Name, Classes, Sex} <- RoundInfo],
    NextPosInfo = [{Rid, Name, Sex, Classes, Pos}
                   || {Pos, Rid, Name, Classes, Sex} <- NextRoundInfo],
    {max(0, MaxNum - Num),
     M * 1000000 + S + util:floor(Timeout / 1000),
     Round,
     MaxRound,
     PosInfo,
     NextPosInfo}.

add_flower({LuckyRewardType, LuckyRewardNum}, Flower,
           Egg, Call)
    when LuckyRewardType =:= 1 ->
    {Flower + LuckyRewardNum, Egg, Call};
add_flower({LuckyRewardType, LuckyRewardNum}, Flower,
           Egg, Call)
    when LuckyRewardType =:= 2 ->
    {Flower, Egg + LuckyRewardNum, Call};
add_flower({LuckyRewardType, LuckyRewardNum}, Flower,
           Egg, Call)
    when LuckyRewardType =:= 3 ->
    {Flower, Egg, Call + LuckyRewardNum};
add_flower(_, Flower, Egg, Call) -> {Flower, Egg, Call}.

add_rank([], Rank) -> Rank;
add_rank([{LuckyRoleId,
           RoleName,
           Classes,
           Sex,
           Flower,
           Egg,
           Call}
          | Rest],
         Rank) ->
    NewRank = case lists:keyfind(LuckyRoleId, 2, Rank) of
                  {_, _, _, _, _, OldFlower, OldEgg, OldCall} ->
                      lists:keystore(LuckyRoleId,
                                     2,
                                     Rank,
                                     {0,
                                      LuckyRoleId,
                                      RoleName,
                                      Classes,
                                      Sex,
                                      Flower + OldFlower,
                                      Egg + OldEgg,
                                      Call + OldCall});
                  _ ->
                      [{0,
                        LuckyRoleId,
                        RoleName,
                        Classes,
                        Sex,
                        Flower,
                        Egg,
                        Call}
                       | Rank]
              end,
    add_rank(Rest, NewRank).

sort_rank([], _RankNo, SortRank) ->
    lists:reverse(SortRank);
sort_rank([{_,
            LuckyRoleId,
            RoleName,
            Classes,
            Sex,
            Flower,
            Egg,
            Call}
           | Rest],
          RankNo, SortRank) ->
    sort_rank(Rest,
              RankNo + 1,
              [{RankNo,
                LuckyRoleId,
                RoleName,
                Classes,
                Sex,
                Flower,
                Egg,
                Call}
               | SortRank]).

get_first_rank(Rank, RoomInfo) ->
    {FirstRank1, Rank1} = case lists:keyfind(1, 1, Rank) of
                              {_, RoleId, RoleName, Classes, Sex, _, _, _} ->
                                  {[{1, RoleId, RoleName, Classes, Sex, 0}],
                                   lists:keydelete(1, 1, Rank)};
                              _ -> {[], []}
                          end,
    Rank2 = util:keys_sort([8, 6, 7], Rank1),
    {FirstRank2, Rank3} = case Rank2 of
                              [] -> {[], []};
                              [{_, RoleId2, RoleName2, Classes2, Sex2, _, _, _}
                               | Rest] ->
                                  {[{2, RoleId2, RoleName2, Classes2, Sex2, 0}
                                    | FirstRank1],
                                   Rest}
                          end,
    Rank4 = del_participant(RoomInfo, Rank3),
    FirstRank = case util:rand_list(Rank4) of
                    {_, RoleId3, RoleName3, Classes3, Sex3, _, _, _} ->
                        [{3, RoleId3, RoleName3, Classes3, Sex3, 0}
                         | FirstRank2];
                    _ ->
                        case util:rand_list(Rank3) of
                            {_, RoleId4, RoleName4, Classes4, Sex4, _, _, _} ->
                                [{3, RoleId4, RoleName4, Classes4, Sex4, 0}
                                 | FirstRank2];
                            _ -> FirstRank2
                        end
                end,
    lists:reverse(FirstRank).

send_first_rank_reward([]) -> ok;
send_first_rank_reward([{Type, Fid, _, _, _, _}
                        | Rest]) ->
    case guild_truth_dare_data:get_reward(Type) of
        #{title := Title, content := Content,
          reward := Reward} ->
            mail:send(Fid, Title, Content, Reward);
        _ -> ok
    end,
    send_first_rank_reward(Rest).

del_participant([], Rank) -> Rank;
del_participant([{_, RoundInfo} | Rest], Rank) ->
    NewRank = del_participant1(RoundInfo, Rank),
    del_participant(Rest, NewRank).

del_participant1([], Rank) -> Rank;
del_participant1([{_, RoleId, _, _, _} | Rest], Rank) ->
    case lists:keyfind(RoleId, 2, Rank) of
        false -> del_participant1(Rest, Rank);
        _ ->
            NewRank = lists:keydelete(RoleId, 2, Rank),
            del_participant1(Rest, NewRank)
    end.

vote_role_to_rank([], VoteRank) -> VoteRank;
vote_role_to_rank([{RoleId,
                    RoleName,
                    Classes,
                    Sex,
                    Type,
                    Num,
                    _VoteRoleType,
                    _VoteType}
                   | Rest],
                  VoteRank)
    when Type =:= 1 ->
    vote_role_to_rank(Rest,
                      [{RoleId, RoleName, Classes, Sex, Num, 0, 0}
                       | VoteRank]);
vote_role_to_rank([{RoleId,
                    RoleName,
                    Classes,
                    Sex,
                    Type,
                    Num,
                    _VoteRoleType,
                    _VoteType}
                   | Rest],
                  VoteRank)
    when Type =:= 2 ->
    vote_role_to_rank(Rest,
                      [{RoleId, RoleName, Classes, Sex, 0, Num, 0}
                       | VoteRank]);
vote_role_to_rank([{RoleId,
                    RoleName,
                    Classes,
                    Sex,
                    Type,
                    Num,
                    _VoteRoleType,
                    _VoteType}
                   | Rest],
                  VoteRank)
    when Type =:= 3 ->
    vote_role_to_rank(Rest,
                      [{RoleId, RoleName, Classes, Sex, 0, 0, Num}
                       | VoteRank]);
vote_role_to_rank([_ | Rest], VoteRank) ->
    vote_role_to_rank(Rest, VoteRank).

send_envelop(Rank, GuildId, RedPacket, Num) ->
    case guild_mgr:list() of
        {ok, GuildList} ->
            case lists:keyfind(GuildId, #guild.id, GuildList) of
                #guild{members = Members} ->
                    case get_send_envelop_role(Rank, Members) of
                        #guild_role{id = RoleId} ->
                            TitleList =
                                guild_truth_dare_data:get_red_packet_list(),
                            Title = util:rand_list(TitleList),
                            role:apply(async,
                                       RoleId,
                                       {guild_truth_dare_room,
                                        send_envelop,
                                        [#{guild_id => GuildId, num => Num,
                                           title => Title,
                                           amount => RedPacket}]});
                        _ -> ok
                    end;
                _ -> ok
            end;
        _ -> ok
    end.

send_envelop(#role{lev = Lev, sex = Sex,
                   classes = Classes, name = Name,
                   m_guild = #m_guild{id = GuildId, pid = Pid}, id = Id},
             #{guild_id := GuildId, num := Num, title := Title,
               amount := Amount})
    when is_pid(Pid) ->
    case guild:apply(sync,
                     Pid,
                     {fun sync_send_envelop/2,
                      [#{id => Id, name => Name, classes => Classes,
                         sex => Sex, lev => Lev, title => Title,
                         amount => Amount, num => Num}]})
        of
        ok -> ok;
        {false, Reason} ->
            logger:error("公会~w真心话大冒险发放红包失败 amount:~w num:~w",
                         [GuildId, Amount, Num],
                         guild_truth_dare_room,
                         1492),
            {false, Reason};
        _Err ->
            logger:error("公会~w真心话大冒险发放红包失败 amount:~w num:~w",
                         [GuildId, Amount, Num],
                         guild_truth_dare_room,
                         1495),
            ok
    end;
send_envelop(_Role, _Args) -> ok.

sync_send_envelop(State = #guild{members = Members},
                  Args = #{id := Id, name := Name, classes := Classes,
                           sex := Sex, lev := Lev, title := Title}) ->
    Res = case lists:keyfind(Id, #guild_role.id, Members) of
              R = #guild_role{name = Name} ->
                  {Rid, Plat, Zone} = Id,
                  Nr = make_envelop(Args, R),
                  NewMb = lists:keyreplace(Id,
                                           #guild_role.id,
                                           Members,
                                           Nr),
                  NewState = State#guild{members = NewMb, flag = 1},
                  guild:cast(NewMb, 11110, {1, Nr}),
                  guild:cast(NewMb,
                             11131,
                             {Title, Rid, Plat, Zone, Name, Sex, Classes, Lev}),
                  guild_build:push_11113(NewState),
                  guild:sync_cache(NewState),
                  {ok, NewState};
              _R ->
                  logger:debug("未知结构 ~w",
                               [_R],
                               guild_truth_dare_room,
                               1515),
                  {false, lang:get("不是该公会的会员，不能发送红包")}
          end,
    case Res of
        {ok, NewG = #guild{}} -> {ok, ok, NewG};
        {false, Reason} -> {ok, {false, Reason}}
    end.

make_envelop(#{title := Title, amount := Amount,
               num := Num},
             M = #guild_role{envelope = E = #guild_envelop{}}) ->
    NewNum = Num,
    Ave = max(1, Amount div NewNum div 3),
    L = [Ave || _I <- lists:duplicate(NewNum, 1)],
    Pks = gen_packets(Amount - lists:sum(L), L),
    NewE = E#guild_envelop{amount = Amount, title = Title,
                           num = NewNum, total = NewNum, remain = Amount,
                           packs = Pks, log = []},
    M#guild_role{envelope = NewE}.

gen_packets(Amount, L) when Amount < 1 -> L;
gen_packets(Amount, L) ->
    O = util:rand_list(L),
    R = util:rand(1, max(1, Amount div 3)),
    NL = L -- [O],
    gen_packets(Amount - R, [O + R | NL]).

get_send_envelop_role([], _Members) -> ok;
get_send_envelop_role([{_, RoleId, _, _, _, _, _, _}
                       | Rest],
                      Members) ->
    case lists:keyfind(RoleId, #guild_role.id, Members) of
        GuildRole = #guild_role{pid = Pid} when is_pid(Pid) ->
            GuildRole;
        _ -> get_send_envelop_role(Rest, Members)
    end.

get_vote_info(StateName,
              _State = #state{round = Round, room_info = RoomInfo,
                              lucky_question = {_, _, _, _, Flower, Egg, Call},
                              vote_role = VoteRole}) ->
    FlowerList = [{RoleId, RoleName, Sex, Classes}
                  || {RoleId,
                      RoleName,
                      Classes,
                      Sex,
                      _Type,
                      _,
                      VoteRoleType,
                      VoteType}
                         <- VoteRole,
                     VoteType =:= 1 andalso VoteRoleType =/= 3],
    EggList = [{RoleId, RoleName, Sex, Classes}
               || {RoleId,
                   RoleName,
                   Classes,
                   Sex,
                   _Type,
                   _,
                   VoteRoleType,
                   VoteType}
                      <- VoteRole,
                  VoteType =:= 2 andalso VoteRoleType =/= 3],
    CallList = [{RoleId, RoleName, Sex, Classes}
                || {RoleId,
                    RoleName,
                    Classes,
                    Sex,
                    _Type,
                    _,
                    VoteRoleType,
                    _VoteType}
                       <- VoteRole,
                   VoteRoleType =:= 3],
    IsPass = case StateName of
                 vote -> 0;
                 _ ->
                     {_, RoundInfo} = lists:keyfind(Round, 1, RoomInfo),
                     Num = erlang:length(RoundInfo),
                     PassNum =
                         guild_truth_dare_data:get_pass_flower_num(Num),
                     case Flower >= PassNum of
                         true -> 1;
                         _ -> 0
                     end
             end,
    {IsPass,
     Flower,
     Egg,
     Call,
     FlowerList,
     EggList,
     CallList}.

get_status_order(StateName) ->
    case StateName of
        idle -> 1;
        ready -> 2;
        active -> 3;
        choose -> 4;
        quest -> 5;
        vote -> 6;
        show -> 7;
        calc -> 9;
        _ -> 1
    end.

stop_room_send([]) -> ok;
stop_room_send([{_, RoleId, _, _, _} | Rest]) ->
    role:apply(sync,
               RoleId,
               {guild_truth_dare_role, apply_send, []}),
    stop_room_send(Rest).

