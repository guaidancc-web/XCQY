-file("src/mod/shipping/shipping.erl", 1).

-module(shipping).

-behaviour(gen_server).

-export([start_link/0,
         login/1,
         level_up/1,
         timeout/1,
         start_shipping/1,
         commit/2,
         commit_help/4,
         help_guild/2,
         help_friends/3,
         sail/1,
         get_start_info/1,
         get_ready_info/1,
         get_info/1,
         get_help_cell/4,
         push_friend_help/2,
         push_timeout/2,
         push_status/1,
         push_status/2,
         timeout_reset/1,
         init/0,
         guild_help_notice/4,
         get_exp_mode/3,
         combat_start/2,
         dun_check/2,
         get_box/2,
         is_in_shipping/1,
         shipping_classes_modify/2,
         test/0]).

-export([init/1,
         handle_call/3,
         handle_cast/2,
         handle_info/2,
         terminate/2,
         code_change/3]).

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

-file("src/mod/shipping/shipping.erl", 53).

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

-file("src/mod/shipping/shipping.erl", 54).

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

-file("src/mod/shipping/shipping.erl", 55).

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

-file("src/mod/shipping/shipping.erl", 56).

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

-file("src/mod/shipping/shipping.erl", 57).

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

-file("src/mod/shipping/shipping.erl", 58).

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

-file("src/mod/shipping/shipping.erl", 59).

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

-file("src/mod/shipping/shipping.erl", 60).

-file("inc/package.hrl", 1).

-record(package,
        {type = 1 :: integer(),
         next_id = 1 :: pos_integer(),
         volume = 0 :: non_neg_integer(),
         free_cell = [] :: list(),
         items = [] :: [tuple()]}).

-file("src/mod/shipping/shipping.erl", 61).

-file("inc/market.hrl", 1).

-record(market_price,
        {base_id = 0,
         price = 0,
         assets = 0,
         source = 0,
         val1 = 0,
         val2 = 0,
         val3 = 0,
         val4 = 0}).

-file("src/mod/shipping/shipping.erl", 62).

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

-file("src/mod/shipping/shipping.erl", 63).

-file("inc/shipping.hrl", 1).

-record(m_shipping, {ver = 1, total_num = 0}).

-record(shipping,
        {rid = {1, "", 0},
         world_lev = 0,
         role_lev = 0,
         type = 1,
         status = 0,
         reset_time = 0,
         start_time = 0,
         help = 0,
         show_list = [],
         cells = []}).

-record(shipping_cell,
        {ver = 1,
         id = 0,
         type = 1,
         status = 1,
         help_type = 0,
         pack_type = 0,
         normal_rewards = [],
         rewards = [],
         item_base_id = 0,
         need_num = 0,
         help_friends = [],
         help_guild = {"", 0, ""},
         quest_id = 0}).

-record(shipping_cell_data,
        {id = 0,
         classify = 0,
         classes = 0,
         lev = 0,
         item_base_id = 0,
         need_num = 0,
         weight = 0,
         exp = 0,
         ratio = 0,
         quest_id = 0}).

-record(shipping_classify_data,
        {classify = 0,
         min_num = 0,
         max_num = 0,
         is_show = 0,
         weight = 0}).

-record(shipping_cell_quset_data,
        {id = 0,
         classify = 0,
         quest_id = 0,
         item_base_id = 0,
         ratio = 0,
         week_min = 0,
         week_max = 0}).

-record(quest_shipping_data,
        {id = 0,
         type = 0,
         ring = 0,
         max_ring = 0,
         next_id = 0,
         rewards = [],
         leader_exp_mode = 0,
         leader_ratio = 0,
         exp_mode = 0,
         ratio = 0}).

-record(quest_shipping_reward_data,
        {id = 0,
         min = 0,
         max = 0,
         ratio = 0,
         rewards = [],
         need_num = 0,
         exp_mode = 0,
         mate_rewards = [],
         mate_exp_mode = 0}).

-file("src/mod/shipping/shipping.erl", 64).

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

-file("src/mod/shipping/shipping.erl", 65).

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

-file("src/mod/shipping/shipping.erl", 66).

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

-file("src/mod/shipping/shipping.erl", 67).

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

-file("src/mod/shipping/shipping.erl", 68).

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

-file("src/mod/shipping/shipping.erl", 69).

-file("inc/plot.hrl", 1).

-record(m_plot,
        {ver = 1 :: pos_integer(),
         plot_quest_ver = 1 :: pos_integer(),
         finished = [] :: [pos_integer()],
         play_list = [] :: [pos_integer()],
         do_list = [] :: [tuple()],
         combat_list = [] :: [tuple()],
         fun_icons = [] :: [pos_integer()],
         unit_list = [] :: [tuple()],
         map_list = [] :: [pos_integer()],
         guide_list = [] :: [pos_integer()],
         dun_id = 0 :: non_neg_integer(),
         hide_mode = 0 :: non_neg_integer(),
         scene = [] :: list(),
         dungeon = [] :: list(),
         quest_trace = 0 :: non_neg_integer()}).

-record(plot,
        {id :: undefined | non_neg_integer(),
         num = 0 :: non_neg_integer(),
         act_idx = 0 :: non_neg_integer()}).

-record(plot_trigger,
        {id = 0 :: non_neg_integer(),
         name = "" :: list(),
         lev = 0 :: non_neg_integer(),
         status = 1 :: 0 | 1,
         type = 1 :: 1 | 2,
         off_line = 0 :: 0..2,
         can_skip = 1 :: 0..1,
         hide_layer = 1 :: 0..1,
         res_list = [] :: [bitstring()],
         maps = [] :: [pos_integer()],
         num = 1 :: non_neg_integer(),
         event = [] :: [tuple()],
         vars = [] :: [tuple()],
         cond_logic = 'and' :: atom(),
         condition = [] :: [tuple()],
         action = [] :: [tuple()],
         lev_break_min_times = 0,
         lev_break_max_times = 1}).

-record(plot_act,
        {id = 0 :: non_neg_integer(),
         type = 0 :: non_neg_integer(),
         label :: undefined | atom(),
         time = 0 :: non_neg_integer(),
         mode = 0 :: non_neg_integer(),
         unit_id = 0 :: non_neg_integer(),
         unit_base_id = 0 :: non_neg_integer(),
         looks = [] :: list(),
         ext_info = [] :: [{pos_integer(), bitstring()}],
         battle_id = 0 :: non_neg_integer(),
         mapid = 0 :: non_neg_integer(),
         x = 0 :: non_neg_integer(),
         y = 0 :: non_neg_integer(),
         val = 0 :: non_neg_integer(),
         ext_val = 0 :: non_neg_integer(),
         res_id = 0 :: non_neg_integer(),
         color = "" :: bitstring(),
         msg = "" :: bitstring(),
         ext_msg = "" :: bitstring(),
         gain = [] :: [{pos_integer(), pos_integer()}],
         need_next = 0 :: 0..1,
         timeout = 0 :: non_neg_integer(),
         skip_do = 0 :: 0..1,
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer()}).

-record(plot_quest_revise_data,
        {ver = 0 :: non_neg_integer(),
         min_lev = 0 :: non_neg_integer(),
         max_lev = 0 :: non_neg_integer(),
         min_exp = 0 :: non_neg_integer(),
         pos :: undefined | tuple(),
         finish_quests = [] :: [pos_integer()],
         finish_reward_quests = [] :: [pos_integer()],
         finish_plots = [] :: [pos_integer()],
         open_plots = [] :: [pos_integer()],
         open_sys_list = [] :: [pos_integer()],
         open_map_list = [] :: [pos_integer()],
         skill_list = [] :: [pos_integer()],
         reward_list = [] :: list()}).

-record(plot_quest_unit,
        {label,
         id = 0,
         base_id = 0,
         pos,
         dir,
         act_type,
         is_rand_pos = 0}).

-file("src/mod/shipping/shipping.erl", 70).

-record(state, {reset_timer, timers = []}).

-record(shipping_commit_args,
        {self_id,
         self_name = "",
         pack_type,
         cell_id = 0,
         help_rid,
         guild_id,
         quest_id = 0,
         label = normal,
         args}).

-export([gm_reset_shipping/1]).

gm_reset_shipping(Role = #role{id = Rid}) ->
    VarRole1 = var:del_var(Role, day_five, 116),
    VarRole = var:del_var(VarRole1, other, 201),
    NRole = clean(VarRole),
    case catch ets:delete(shipping_tab, Rid) of
        true -> ok;
        _ -> false
    end,
    case catch dets:delete(shipping_tab, Rid) of
        ok -> ok;
        _ -> false
    end,
    case refresh(NRole) of
        {ok, _Shipping, NewRole} -> {ok, NewRole};
        false -> {ok, Role}
    end.

init() -> #m_shipping{}.

login(Role = #role{id = Rid, lev = Lev})
    when Lev >= 30 ->
    case case catch ets:lookup(shipping_tab, Rid) of
             [Obj] -> Obj;
             [] -> none;
             _ -> false
         end
        of
        none ->
            case refresh(Role) of
                {ok, _Shipping, NewRole} -> {ok, NewRole};
                false -> {ok, Role}
            end;
        Shipping = #shipping{} ->
            case check_abandon_item(Shipping) of
                true ->
                    case refresh(Role) of
                        {ok, _Shipping, NRole} ->
                            DayRole = var:set_var(NRole, day_five, 116, 0),
                            NewRole = var:set_var(DayRole, week, 201, 0),
                            {ok, NewRole};
                        false -> {ok, Role}
                    end;
                false ->
                    case revise(Shipping, Role) of
                        {ok, NewRole} -> {ok, NewRole};
                        {ok, _Shipping, NewRole} -> {ok, NewRole};
                        _False -> {ok, Role}
                    end
            end;
        _ -> {ok, Role}
    end;
login(_) -> ok.

level_up(Role = #role{id = Rid, lev = Lev})
    when Lev >= 30 ->
    case case catch ets:lookup(shipping_tab, Rid) of
             [Obj] -> Obj;
             [] -> none;
             _ -> false
         end
        of
        none ->
            case refresh(Role) of
                {ok, _Shipping, NewRole} -> NewRole;
                false -> Role
            end;
        Shipping = #shipping{} ->
            case revise(Shipping, Role) of
                {ok, NewRole} -> NewRole;
                {ok, _Shipping, NewRole} -> NewRole;
                _False -> Role
            end;
        _ -> Role
    end;
level_up(Role) -> Role.

-spec timeout(#role{}) -> ok.

timeout(#role{id = Rid, pid = Pid}) ->
    gen_server:cast(shipping, {timeout, Rid, Pid}),
    ok.

-spec timeout_reset(#role{}) -> ok | {ok, #role{}}.

timeout_reset(Role) ->
    case refresh(Role) of
        {ok, _Shipping, NewRole} ->
            push_timeout(NewRole, 2),
            {ok, NewRole};
        _False -> ok
    end.

emergency_mail(Role) ->
    Title = lang:get("紧急起航！"),
    Fmt =
        lang:get("物价飞涨，趁早起航肯定能大赚一笔！~ts小时内完成我的订单，给你额外报酬！\n（额外获得一"
                 "本~ts）\n—— 远航商人·菲菲"),
    Args = [{string_2, 5, 1}, {item_2, 20025}],
    Content = notice:format(Fmt, Args),
    mail:send(Role, Title, Content),
    ok.

-spec start_shipping(#role{}) -> {ok, #role{}} |
                                 false |
                                 {false, string()}.

start_shipping(Role = #role{id = Rid, lev = Lev})
    when Lev >= 32 ->
    case case catch ets:lookup(shipping_tab, Rid) of
             [Obj] -> Obj;
             [] -> none;
             _ -> false
         end
        of
        #shipping{status = 3, type = Type} ->
            DayCount = var:get_var(Role, day_five, 116, 0),
            case DayCount < 1 of
                true ->
                    case case catch gen_server:call(shipping,
                                                    {start_shipping, Rid},
                                                    10000)
                             of
                             {'EXIT', {timeout, _}} -> {error, timeout};
                             {'EXIT', {noproc, _}} -> {error, noproc};
                             {'EXIT', {normal, _}} -> {error, exit};
                             {'EXIT', _Call_Err} -> {error, _Call_Err};
                             _Call_Return -> _Call_Return
                         end
                        of
                        {ok, NewShipping = #shipping{cells = Cells}} ->
                            case Type of
                                2 -> emergency_mail(Role);
                                _ -> ok
                            end,
                            push_progress(Role, NewShipping),
                            VarRole = var:add_var(Role, day_five, 116, 1, 0),
                            NRole = revise_timer(VarRole, NewShipping),
                            NewRole = accept_quest(NRole, Cells),
                            {ok, NewRole};
                        _False -> false
                    end;
                false -> {false, lang:get("您今天已经做过远航任务了哟")}
            end;
        _False -> false
    end;
start_shipping(Role = #role{id = Rid}) ->
    case case catch ets:lookup(shipping_tab, Rid) of
             [Obj] -> Obj;
             [] -> none;
             _ -> false
         end
        of
        Shipping = #shipping{status = 3} ->
            push_progress(Role, Shipping),
            Fmt = lang:get("等级不足~ts级，无法接受任务"),
            Args = [{string_1, 32}],
            {false, notice:format(Fmt, Args)};
        _False -> false
    end.

combat_start(Role = #role{id = Rid}, CellId) ->
    case case catch ets:lookup(shipping_tab, Rid) of
             [Obj] -> Obj;
             [] -> none;
             _ -> false
         end
        of
        Shipping = #shipping{status = 1, type = 2,
                             start_time = Time} ->
            Now = date:unixtime(),
            case 3600 + Time > Now of
                true ->
                    shipping_combat:combat_start(CellId, Shipping, Role);
                false ->
                    case Time + 10 * 3600 > Now of
                        true ->
                            shipping_combat:combat_start(CellId,
                                                         Shipping,
                                                         Role);
                        false -> {false, lang:get("任务超时，无法战斗")}
                    end
            end;
        Shipping = #shipping{status = 1, start_time = Time} ->
            Now = date:unixtime(),
            case Time + 10 * 3600 > Now of
                true ->
                    shipping_combat:combat_start(CellId, Shipping, Role);
                false -> {false, lang:get("任务超时，无法战斗呀")}
            end;
        _Other -> {false, lang:get("未开始任务")}
    end.

dun_check(Role = #role{id = Rid}, CellId) ->
    case case catch ets:lookup(shipping_tab, Rid) of
             [Obj] -> Obj;
             [] -> none;
             _ -> false
         end
        of
        Shipping = #shipping{status = 1, type = 2,
                             start_time = Time} ->
            Now = date:unixtime(),
            case 3600 + Time > Now of
                true -> do_dun_check(CellId, Shipping, Role);
                false ->
                    case Time + 10 * 3600 > Now of
                        true -> do_dun_check(CellId, Shipping, Role);
                        false -> {false, lang:get("任务超时，无法开启副本")}
                    end
            end;
        Shipping = #shipping{status = 1, start_time = Time} ->
            Now = date:unixtime(),
            case Time + 10 * 3600 > Now of
                true -> do_dun_check(CellId, Shipping, Role);
                false -> {false, lang:get("任务超时，无法开启副本呀")}
            end;
        _Other -> {false, lang:get("未开始任务")}
    end.

do_dun_check({dun, Id}, #shipping{cells = Cells},
             _Role) ->
    case lists:keyfind(Id, #shipping_cell.quest_id, Cells)
        of
        #shipping_cell{type = 4, status = 1} -> true;
        #shipping_cell{type = 4} ->
            {false, lang:get("副本已经开启过了")};
        #shipping_cell{} -> {false, lang:get("非副本宝箱，不能发起")};
        _False -> {false, lang:get("没有找到宝箱")}
    end.

commit(CellId, Role = #role{id = Rid}) ->
    case case catch ets:lookup(shipping_tab, Rid) of
             [Obj] -> Obj;
             [] -> none;
             _ -> false
         end
        of
        Shipping = #shipping{status = 1, type = 2,
                             start_time = Time} ->
            Now = date:unixtime(),
            case 3600 + Time > Now of
                true -> do_commit(CellId, Shipping, Role);
                false ->
                    case Time + 10 * 3600 > Now of
                        true -> do_commit(CellId, Shipping, Role);
                        false -> {false, lang:get("任务超时，无法提交")}
                    end
            end;
        Shipping = #shipping{status = 1, start_time = Time} ->
            Now = date:unixtime(),
            case Time + 10 * 3600 > Now of
                true -> do_commit(CellId, Shipping, Role);
                false -> {false, lang:get("任务超时，无法提交")}
            end;
        _Other -> {false, lang:get("未开始任务")}
    end.

commit_help(Tag, HelpRid, CellId, Role) ->
    CommitVar = var:get_var(Role, day_five, 115, 0),
    case CommitVar < 3 of
        true ->
            case case catch ets:lookup(shipping_tab, HelpRid) of
                     [Obj] -> Obj;
                     [] -> none;
                     _ -> false
                 end
                of
                Shipping = #shipping{status = 1, cells = Cells,
                                     help = HelpNum}
                    when HelpNum < 2 ->
                    case lists:keyfind(CellId, #shipping_cell.id, Cells) of
                        Cell = #shipping_cell{status = 3} ->
                            Args = #shipping_commit_args{},
                            case check_commit_help(Tag,
                                                   Cell,
                                                   HelpRid,
                                                   Args,
                                                   Role)
                                of
                                {true, NewArgs} ->
                                    check_commit_time(Shipping,
                                                      NewArgs,
                                                      HelpRid,
                                                      CellId,
                                                      Role);
                                false -> {false, lang:get("已获得他人帮助，下次要早点喔！")}
                            end;
                        _False -> {false, lang:get("已获得他人帮助，下次要早点喔！")}
                    end;
                _False -> {false, lang:get("已获得他人帮助，下次要早点喔！")}
            end;
        false ->
            {false,
             util:flist(lang:get("每天只能帮助提交~w次喔{face_1,3}"), [3])}
    end.

check_commit_help(guild,
                  #shipping_cell{help_guild = GuildId}, _HelpRid, Args,
                  #role{m_guild = #m_guild{id = GuildId}}) ->
    PackType = 1,
    NewArgs = Args#shipping_commit_args{pack_type =
                                            PackType,
                                        guild_id = GuildId},
    {true, NewArgs};
check_commit_help(guild, _Cell, HelpRid, Args,
                  #role{m_guild = #m_guild{id = GuildId}}) ->
    case guild_role:find_role(HelpRid) of
        {ok, GuildId} ->
            PackType = 1,
            NewArgs = Args#shipping_commit_args{pack_type =
                                                    PackType,
                                                guild_id = GuildId},
            {true, NewArgs};
        _ -> false
    end;
check_commit_help(friend,
                  #shipping_cell{help_friends = HelpList}, _HelpRid, Args,
                  #role{id = Id}) ->
    case lists:keyfind(Id, 1, HelpList) of
        {Id, _} ->
            NewArgs = Args#shipping_commit_args{pack_type = 2},
            {true, NewArgs};
        _ -> false
    end;
check_commit_help(_Unkown, _Cell, _HelpRid, _Args,
                  _Role) ->
    false.

check_commit_time(Shipping = #shipping{status = 1,
                                       type = 2, start_time = Time},
                  Args, HelpRid, CellId, Role) ->
    Now = date:unixtime(),
    case 3600 + Time > Now of
        true ->
            do_commit_help(Args, HelpRid, CellId, Shipping, Role);
        false ->
            case Time + 10 * 3600 > Now of
                true ->
                    do_commit_help(Args, HelpRid, CellId, Shipping, Role);
                false -> {false, lang:get("任务超时，无法提交")}
            end
    end;
check_commit_time(Shipping = #shipping{status = 1,
                                       start_time = Time},
                  Args, HelpRid, CellId, Role) ->
    Now = date:unixtime(),
    case Time + 10 * 3600 > Now of
        true ->
            do_commit_help(Args, HelpRid, CellId, Shipping, Role);
        false -> {false, lang:get("任务超时，无法提交")}
    end;
check_commit_time(_Shipping, _Args, _HelpRid, _CellId,
                  _Role) ->
    {false, lang:get("任务已过期")}.

del_server_timer(Rid) ->
    gen_server:cast(shipping, {del_timer, Rid}),
    ok.

sail(Role = #role{id = Rid}) ->
    BuffAddValue = case
                       buff:is_special_effect_exists_one_param(Role, 19)
                       of
                       {true, Value} ->
                           case buff:get_info_by_special_effect(Role, 19) of
                               {true, _Id, BuffName} ->
                                   BuffAddMsg =
                                       notice:format(lang:get("在~ts作用下，额外获得1本~ts"),
                                                     [{string_2,
                                                       5,
                                                       util:flist("[~ts]",
                                                                  [BuffName])},
                                                      {item_2, 20025}]),
                                   notice:send(Role, 3, BuffAddMsg),
                                   Value;
                               _ -> ok
                           end,
                           Value;
                       _ -> 0
                   end,
    RecallBuffGain = case
                         buff:is_special_effect_exists_one_param(Role, 32)
                         of
                         {true, Value1} ->
                             case buff:get_info_by_special_effect(Role, 32) of
                                 {true, _Id1, BuffName1} ->
                                     BuffAddMsg1 =
                                         notice:format(lang:get("在~ts作用下，额外获得1本~ts"),
                                                       [{string_2,
                                                         5,
                                                         util:flist("[~ts]",
                                                                    [BuffName1])},
                                                        {item_2, 22216}]),
                                     notice:send(Role, 3, BuffAddMsg1),
                                     [{22216, 0, Value1}];
                                 _ -> []
                             end;
                         _ -> []
                     end,
    case case catch ets:lookup(shipping_tab, Rid) of
             [Obj] -> Obj;
             [] -> none;
             _ -> false
         end
        of
        #shipping{status = 2, start_time = Time,
                  type = ShippingType} ->
            Now = date:unixtime(),
            case Time + 10 * 3600 > Now of
                true ->
                    Gains = case ShippingType of
                                2 ->
                                    ItemRewards = [{20025, 1, 3 + BuffAddValue}]
                                                      ++ RecallBuffGain,
                                    [#gain{label = item_base_id,
                                           val = ItemRewards}];
                                _ ->
                                    ItemRewards = RecallBuffGain ++
                                                      [{20025,
                                                        1,
                                                        2 + BuffAddValue}],
                                    [#gain{label = item_base_id,
                                           val = ItemRewards}]
                            end,
                    case role_gain:do_notice(Gains, Role) of
                        {ok, GainRole} ->
                            del_server_timer(Rid),
                            notice_commit_reward(Gains, GainRole),
                            case refresh(GainRole) of
                                {ok,
                                 _Shipping,
                                 NRole = #role{m_shipping =
                                                   MShipping =
                                                       #m_shipping{total_num =
                                                                       TotalNum}}} ->
                                    NewRole =
                                        role_trigger:fire(#evt_shipping_sail{type
                                                                                 =
                                                                                 ShippingType},
                                                          NRole#role{m_shipping
                                                                         =
                                                                         MShipping#m_shipping{total_num
                                                                                                  =
                                                                                                  TotalNum
                                                                                                      +
                                                                                                      1}}),
                                    {ok, NewRole};
                                _False -> false
                            end;
                        {false, #gain{msg = Msg}} -> {false, Msg};
                        _False -> {false, lang:get("获得起航奖励失败")}
                    end;
                false -> {false, lang:get("任务已超时，无法起航")}
            end;
        _False -> {false, lang:get("您当前还有尚未装满的货物，不能起航哦！")}
    end.

help_guild(_CellId,
           _Role = #role{m_guild = undefined}) ->
    {false, lang:get("求助失败，请加入或创建一个公会")};
help_guild(CellId,
           Role = #role{id = Rid, name = Name,
                        m_guild = #m_guild{id = GuildId, pid = Pid}})
    when is_pid(Pid) ->
    case case catch ets:lookup(shipping_tab, Rid) of
             [Obj] -> Obj;
             [] -> none;
             _ -> false
         end
        of
        Shipping = #shipping{} ->
            case check_help_cond(guild, CellId, Shipping) of
                {true,
                 #shipping_cell{item_base_id = ItemBaseId,
                                need_num = Num}} ->
                    gen_server:cast(shipping,
                                    {help_guild, Rid, {CellId, GuildId}}),
                    case guild_common:help_shipping(CellId, Role) of
                        ok ->
                            Fmt = lang:get("~ts发起求助：远航商人-~ts，快~ts帮助TA吧"),
                            Args = [{role_1, Rid, Name},
                                    {item_2, ItemBaseId, Num},
                                    {ship_1, Rid, Name, CellId}],
                            Msg = notice:format(Fmt, Args),
                            guild:cast(Pid, 9902, {32, Msg, []}),
                            ok;
                        Rtn -> Rtn
                    end;
                Rtn = {false, _Msg} -> Rtn;
                _ -> false
            end;
        _False -> false
    end;
help_guild(_CellId, _Role) -> false.

help_friends(Friends, CellId,
             Role = #role{id = Rid, name = Name}) ->
    case case catch ets:lookup(shipping_tab, Rid) of
             [Obj] -> Obj;
             [] -> none;
             _ -> false
         end
        of
        Shipping = #shipping{} ->
            case check_help_cond(friend, CellId, Shipping) of
                {true,
                 #shipping_cell{item_base_id = ItemBaseId,
                                need_num = Num, help_friends = HelpFrds}} ->
                    case check_friends(Friends, HelpFrds, Role, []) of
                        NewFriends = [_ | _] ->
                            gen_server:cast(shipping,
                                            {help_friends,
                                             Rid,
                                             {CellId, NewFriends}}),
                            Fmt = lang:get("~ts需要你的帮助：远航商人-~ts，快~ts帮助TA吧"),
                            Args = [{role_1, Rid, Name},
                                    {item_2, ItemBaseId, Num},
                                    {ship_1, Rid, Name, CellId}],
                            Msg = notice:format(Fmt, Args),
                            send_help_friends(NewFriends, Role, Msg),
                            ok;
                        Rtn = {false, _Msg} -> Rtn;
                        _ -> {false, lang:get("真遗憾，没有好友可以求助")}
                    end;
                Rtn = {false, _Msg} -> Rtn;
                _False -> false
            end;
        _ -> {false, lang:get("很遗憾，来晚一步，已被Ta人提交")}
    end.

send_help_friends([], _, _Msg) -> ok;
send_help_friends([Rid | Rest], Role, Msg) ->
    case role_query:pid(by_id, Rid) of
        {ok, Pid} ->
            ChatMsg = chat:sns_msg(Role, Rid, Msg),
            role:apply(async,
                       Pid,
                       {shipping, push_friend_help, [ChatMsg]}),
            send_help_friends(Rest, Role, Msg);
        _False -> send_help_friends(Rest, Role, Msg)
    end.

check_friends([], _HelpFrds, _Role, Acc) -> Acc;
check_friends([Rid = {_, _, _} | Rest], HelpFrds, Role,
              Acc) ->
    case role_misc:is_local_role(Rid) of
        true ->
            case lists:keyfind(Rid, 1, HelpFrds) of
                {_, HelpNum} ->
                    case HelpNum < 3 of
                        true ->
                            case friend:is_friend(Role, Rid) of
                                true ->
                                    check_friends(Rest,
                                                  HelpFrds,
                                                  Role,
                                                  [Rid | Acc]);
                                false ->
                                    check_friends(Rest, HelpFrds, Role, Acc)
                            end;
                        false ->
                            Fmt = lang:get("每个好友最多可以求助~w次哟"),
                            Args = [{string_1, 3}],
                            Msg = notice:format(Fmt, Args),
                            {false, Msg}
                    end;
                _ ->
                    case friend:is_friend(Role, Rid) of
                        true ->
                            check_friends(Rest, HelpFrds, Role, [Rid | Acc]);
                        false -> check_friends(Rest, HelpFrds, Role, Acc)
                    end
            end;
        _ -> check_friends(Rest, HelpFrds, Role, Acc)
    end;
check_friends([_ | Rest], HelpFrds, Role, Acc) ->
    check_friends(Rest, HelpFrds, Role, Acc).

check_help_cond(Tag, CellId,
                #shipping{status = 1, cells = Cells, help = Help})
    when Help < 2 ->
    Flags = [1 || #shipping_cell{status = 2} <- Cells],
    case length(Flags) >= 5 of
        true ->
            case lists:keyfind(CellId, #shipping_cell.id, Cells) of
                #shipping_cell{type = Type}
                    when Type == 3 orelse Type == 4 orelse Type == 5 ->
                    {false, lang:get("任务箱子不能求助")};
                Cell = #shipping_cell{status = 1} -> {true, Cell};
                Cell = #shipping_cell{status = 3,
                                      help_type = HelpType} ->
                    case {Tag, HelpType} of
                        {guild, 2} -> {true, Cell};
                        {friend, 1} -> {true, Cell};
                        {guild, 1} -> {false, lang:get("该箱子已进行公会求助，无需重复求助")};
                        {friend, 2} -> {true, Cell};
                        {friend, 3} -> {true, Cell};
                        _False -> false
                    end;
                _False -> false
            end;
        false -> {false, lang:get("完成5次提交，才能使用求助")}
    end;
check_help_cond(_Tag, _CellId, #shipping{status = 1}) ->
    {false, lang:get("求助次数已用完")};
check_help_cond(_Tag, _CellId, _Shipping) -> false.

do_commit({quest, QuestId},
          Shipping = #shipping{cells = Cells},
          Role = #role{id = Rid}) ->
    case lists:keyfind(QuestId,
                       #shipping_cell.quest_id,
                       Cells)
        of
        Cell = #shipping_cell{id = CellId} ->
            case trans_commit(Cell, Shipping, Role) of
                {ok, wait} ->
                    Member = team:get_members(Role),
                    Num = length(Member) + 1,
                    RewardData = #quest_shipping_reward_data{need_num =
                                                                 NeedNum} =
                                     shipping_data:get_quest_reward({QuestId,
                                                                     Num}),
                    Reward = [{90013, 80 * NeedNum}],
                    Args = #shipping_commit_args{self_id = Rid,
                                                 cell_id = CellId,
                                                 label = quest_finish,
                                                 args =
                                                     RewardData#quest_shipping_reward_data{rewards
                                                                                               =
                                                                                               Reward}},
                    case case catch gen_server:call(shipping,
                                                    {commit, Args},
                                                    10000)
                             of
                             {'EXIT', {timeout, _}} -> {error, timeout};
                             {'EXIT', {noproc, _}} -> {error, noproc};
                             {'EXIT', {normal, _}} -> {error, exit};
                             {'EXIT', _Call_Err} -> {error, _Call_Err};
                             _Call_Return -> _Call_Return
                         end
                        of
                        ok -> ok;
                        {false, 4} -> {false, lang:get("任务超时，无法提交任务")};
                        Rtn = {false, _Msg} -> Rtn;
                        _ -> false
                    end;
                {ok, NextId} ->
                    Args = #shipping_commit_args{self_id = Rid,
                                                 cell_id = CellId,
                                                 quest_id = NextId},
                    case case catch gen_server:call(shipping,
                                                    {commit, Args},
                                                    10000)
                             of
                             {'EXIT', {timeout, _}} -> {error, timeout};
                             {'EXIT', {noproc, _}} -> {error, noproc};
                             {'EXIT', {normal, _}} -> {error, exit};
                             {'EXIT', _Call_Err} -> {error, _Call_Err};
                             _Call_Return -> _Call_Return
                         end
                        of
                        ok -> {ok, NextId};
                        {false, 4} -> {false, lang:get("任务超时，无法提交任务")};
                        Rtn = {false, _Msg} -> Rtn;
                        _ -> false
                    end;
                {ok, TransRole, Gains, Loss, TransTag} ->
                    Args = #shipping_commit_args{self_id = Rid,
                                                 cell_id = CellId,
                                                 pack_type = 0},
                    case case catch gen_server:call(shipping,
                                                    {commit, Args},
                                                    10000)
                             of
                             {'EXIT', {timeout, _}} -> {error, timeout};
                             {'EXIT', {noproc, _}} -> {error, noproc};
                             {'EXIT', {normal, _}} -> {error, exit};
                             {'EXIT', _Call_Err} -> {error, _Call_Err};
                             _Call_Return -> _Call_Return
                         end
                        of
                        ok ->
                            NewCell = Cell#shipping_cell{status = 2},
                            commit_reward_notice(TransTag,
                                                 NewCell,
                                                 Gains,
                                                 Loss,
                                                 TransRole),
                            {ok, NewCell, TransRole};
                        {false, 4} -> {false, lang:get("任务超时，无法装货")};
                        Rtn = {false, _Msg} -> Rtn;
                        _ -> false
                    end;
                {false, #gain{msg = Msg}} -> {false, Msg};
                {false, Msg} when is_list(Msg) -> {false, Msg};
                _ -> {false, lang:get("无法进行装货")}
            end;
        _False -> false
    end;
do_commit({dun, DunId, Score},
          Shipping = #shipping{cells = Cells},
          Role = #role{id = Rid}) ->
    case lists:keyfind(DunId,
                       #shipping_cell.quest_id,
                       Cells)
        of
        Cell = #shipping_cell{type = 4, status = 1,
                              id = CellId} ->
            case trans_commit(Cell, Shipping, Role) of
                {ok, wait} ->
                    RewardData = #quest_shipping_reward_data{} =
                                     shipping_data:get_quest_reward({DunId,
                                                                     Score}),
                    Reward = [{90013, 18 * Score}],
                    Args = #shipping_commit_args{self_id = Rid,
                                                 cell_id = CellId,
                                                 label = quest_finish,
                                                 args =
                                                     RewardData#quest_shipping_reward_data{need_num
                                                                                               =
                                                                                               Score,
                                                                                           rewards
                                                                                               =
                                                                                               Reward}},
                    case case catch gen_server:call(shipping,
                                                    {commit, Args},
                                                    10000)
                             of
                             {'EXIT', {timeout, _}} -> {error, timeout};
                             {'EXIT', {noproc, _}} -> {error, noproc};
                             {'EXIT', {normal, _}} -> {error, exit};
                             {'EXIT', _Call_Err} -> {error, _Call_Err};
                             _Call_Return -> _Call_Return
                         end
                        of
                        ok -> ok;
                        {false, 4} -> {false, lang:get("任务超时，无法提交任务")};
                        Rtn = {false, _Msg} -> Rtn;
                        _ -> false
                    end;
                {false, Msg} when is_list(Msg) -> {false, Msg};
                _ -> {false, lang:get("无法进行装货")}
            end;
        #shipping_cell{type = 4} ->
            {false, lang:get("玩家提早出来了")};
        _Cell = #shipping_cell{} ->
            logger:error("很严重存在重复的任务id:~w", [_Cell], shipping, 693),
            {false, lang:get("存在重复的任务id")};
        _False -> false
    end;
do_commit({kill_unit, DunId, Score},
          Shipping = #shipping{cells = Cells},
          Role = #role{id = Rid}) ->
    case lists:keyfind(DunId,
                       #shipping_cell.quest_id,
                       Cells)
        of
        Cell = #shipping_cell{type = 5, status = 1,
                              id = CellId} ->
            case trans_commit(Cell, Shipping, Role) of
                {ok, wait} ->
                    RewardData = #quest_shipping_reward_data{} =
                                     shipping_data:get_quest_reward({DunId,
                                                                     Score}),
                    Args = #shipping_commit_args{self_id = Rid,
                                                 cell_id = CellId,
                                                 label = quest_finish,
                                                 args =
                                                     RewardData#quest_shipping_reward_data{need_num
                                                                                               =
                                                                                               Score}},
                    case case catch gen_server:call(shipping,
                                                    {commit, Args},
                                                    10000)
                             of
                             {'EXIT', {timeout, _}} -> {error, timeout};
                             {'EXIT', {noproc, _}} -> {error, noproc};
                             {'EXIT', {normal, _}} -> {error, exit};
                             {'EXIT', _Call_Err} -> {error, _Call_Err};
                             _Call_Return -> _Call_Return
                         end
                        of
                        ok -> ok;
                        {false, 4} -> {false, lang:get("任务超时，无法提交任务")};
                        Rtn = {false, _Msg} -> Rtn;
                        _ -> false
                    end;
                {false, Msg} when is_list(Msg) -> {false, Msg};
                _ -> {false, lang:get("无法进行装货")}
            end;
        #shipping_cell{type = 5} ->
            {false, lang:get("玩家提早出来了")};
        _Cell = #shipping_cell{} ->
            logger:error("很严重存在重复的任务id:~w", [_Cell], shipping, 723),
            {false, lang:get("存在重复的任务id")};
        _False -> false
    end;
do_commit(CellId, Shipping = #shipping{cells = Cells},
          Role = #role{id = Rid}) ->
    case lists:keyfind(CellId, #shipping_cell.id, Cells) of
        Cell = #shipping_cell{} ->
            case trans_commit(Cell, Shipping, Role) of
                {ok, TransRole, Gains, Loss, TransTag} ->
                    Args = #shipping_commit_args{self_id = Rid,
                                                 cell_id = CellId,
                                                 pack_type = 0},
                    case case catch gen_server:call(shipping,
                                                    {commit, Args},
                                                    10000)
                             of
                             {'EXIT', {timeout, _}} -> {error, timeout};
                             {'EXIT', {noproc, _}} -> {error, noproc};
                             {'EXIT', {normal, _}} -> {error, exit};
                             {'EXIT', _Call_Err} -> {error, _Call_Err};
                             _Call_Return -> _Call_Return
                         end
                        of
                        ok ->
                            NewCell = Cell#shipping_cell{status = 2},
                            commit_reward_notice(TransTag,
                                                 NewCell,
                                                 Gains,
                                                 Loss,
                                                 TransRole),
                            {ok, NewCell, TransRole};
                        {false, 4} -> {false, lang:get("任务超时，无法装货")};
                        Rtn = {false, _Msg} -> Rtn;
                        _ -> false
                    end;
                {false, #gain{msg = Msg}} -> {false, Msg};
                {false, Msg} when is_list(Msg) -> {false, Msg};
                _ -> {false, lang:get("无法进行装货")}
            end;
        _False -> false
    end.

do_commit_help(Args = #shipping_commit_args{pack_type =
                                                PackType},
               HelpRid, CellId, Shipping = #shipping{cells = Cells},
               Role = #role{id = Rid, name = Name,
                            m_guild = MGuild}) ->
    case lists:keyfind(CellId, #shipping_cell.id, Cells) of
        #shipping_cell{status = 2} ->
            {false, lang:get("已获得他人帮助，下次要早点喔！")};
        Cell = #shipping_cell{item_base_id = ItemBaseId,
                              need_num = NeedNum} ->
            case trans_commit(Cell,
                              Shipping,
                              Role,
                              #{label => help, help_id => HelpRid})
                of
                {ok, TransRole, Gains, Loss, TransTag} ->
                    NewArgs = Args#shipping_commit_args{self_id = Rid,
                                                        self_name = Name,
                                                        cell_id = CellId,
                                                        help_rid = HelpRid},
                    case case catch gen_server:call(shipping,
                                                    {commit, NewArgs},
                                                    10000)
                             of
                             {'EXIT', {timeout, _}} -> {error, timeout};
                             {'EXIT', {noproc, _}} -> {error, noproc};
                             {'EXIT', {normal, _}} -> {error, exit};
                             {'EXIT', _Call_Err} -> {error, _Call_Err};
                             _Call_Return -> _Call_Return
                         end
                        of
                        ok ->
                            case {PackType, MGuild} of
                                {1, #m_guild{pid = GuildPid}}
                                    when is_pid(GuildPid) ->
                                    GuildNotice = [HelpRid,
                                                   Rid,
                                                   {item_2,
                                                    ItemBaseId,
                                                    NeedNum}],
                                    guild:apply(async,
                                                GuildPid,
                                                {shipping,
                                                 guild_help_notice,
                                                 GuildNotice}),
                                    ok;
                                _ -> ok
                            end,
                            FireRole = role_trigger:fire(#evt_shipping_help{},
                                                         TransRole),
                            VarRole = var:add_var(FireRole,
                                                  day_five,
                                                  115,
                                                  1,
                                                  0),
                            NewRole = VarRole,
                            NewCell = Cell#shipping_cell{status = 2},
                            commit_reward_notice(TransTag,
                                                 NewCell,
                                                 Gains,
                                                 Loss,
                                                 NewRole),
                            {ok, NewCell, NewRole};
                        {false, 4} -> {false, lang:get("帮助装货失败，任务已超时")};
                        Rtn = {false, _Msg} -> Rtn;
                        _ -> false
                    end;
                {false, Msg} -> {false, Msg};
                _ -> {false, lang:get("帮助装货失败")}
            end;
        _False -> {false, lang:get("已获得他人帮助，下次要早点喔！")}
    end.

trans_commit(Cell, Shipping, Role) ->
    trans_commit(Cell, Shipping, Role, normal).

trans_commit(#shipping_cell{item_base_id = _ItemBaseId,
                            need_num = _NeedNum, rewards = Rewards,
                            type = CellType, id = _CellId, status = 4},
             #shipping{type = _ShippingType}, Role, _)
    when CellType == 3 orelse
             CellType == 4 orelse CellType == 5 ->
    ValueAdd = case
                   buff:is_special_effect_exists_one_param(Role, 6)
                   of
                   {true, Value} -> Value;
                   _ -> 0
               end,
    NewRewards = calc_buff_add_prac_exp(Rewards, ValueAdd),
    logger:debug("buff add prac exp: [~w%, before: ~w, "
                 "after: ~w ]",
                 [ValueAdd div 10, Rewards, NewRewards],
                 shipping,
                 803),
    Gains = format:val_to_gain(NewRewards),
    NewGains = mark_source(Gains, []),
    case role_gain:do(NewGains, Role) of
        {ok, GainRole} -> {ok, GainRole, Gains, [], normal};
        {false, #gain{label = prac_exp, msg = Msg}} ->
            {ok, Role, NewGains, [], {false, Msg}};
        {false, #gain{msg = Msg}} -> {false, Msg};
        {false, Msg} -> {false, Msg};
        _ -> false
    end;
trans_commit(#shipping_cell{item_base_id = _ItemBaseId,
                            need_num = _NeedNum, type = _CellType = 3,
                            id = _CellId, quest_id = QuestId},
             #shipping{type = _ShippingType}, _Role, _) ->
    case shipping_data:get_quest(QuestId) of
        #quest_shipping_data{next_id = 0} -> {ok, wait};
        #quest_shipping_data{next_id = NextId} -> {ok, NextId};
        _ -> {ok, wait}
    end;
trans_commit(#shipping_cell{item_base_id = _ItemBaseId,
                            need_num = _NeedNum, type = _CellType = 4,
                            id = _CellId, quest_id = _QuestId},
             #shipping{type = _ShippingType}, _Role, _) ->
    {ok, wait};
trans_commit(#shipping_cell{item_base_id = _ItemBaseId,
                            need_num = _NeedNum, type = _CellType = 5,
                            id = _CellId, quest_id = _QuestId},
             #shipping{type = _ShippingType}, _Role, _) ->
    {ok, wait};
trans_commit(#shipping_cell{item_base_id = ItemBaseId,
                            need_num = NeedNum, type = CellType, id = CellId},
             #shipping{type = ShippingType}, Role,
             #{label := help, help_id := HelpRid}) ->
    Loss = [#loss{label = item_base_id,
                  val = [{ItemBaseId, NeedNum}]}],
    case role_gain:do(Loss, Role) of
        {ok, LossRole} ->
            Rewards = calc_cell_reward(ShippingType,
                                       CellType,
                                       CellId,
                                       ItemBaseId,
                                       NeedNum,
                                       LossRole),
            ValueAdd = case
                           buff:is_special_effect_exists_one_param(Role, 6)
                           of
                           {true, Value} -> Value;
                           _ -> 0
                       end,
            {NReward, ReturnReward} = case CellType of
                                          2 ->
                                              case lists:keyfind(90013,
                                                                 1,
                                                                 Rewards)
                                                  of
                                                  {_, PracExp} ->
                                                      Add = [{90013,
                                                              util:ceil(PracExp
                                                                            /
                                                                            2)}],
                                                      {lists:keydelete(90013,
                                                                       1,
                                                                       Rewards)
                                                           ++ Add,
                                                       Add};
                                                  _ -> {Rewards, []}
                                              end;
                                          _ -> {Rewards, []}
                                      end,
            NewRewards = calc_buff_add_prac_exp(NReward, ValueAdd),
            logger:debug("buff add prac exp: [~w%, before: ~w, "
                         "after: ~w ]",
                         [ValueAdd div 10, Rewards, NewRewards],
                         shipping,
                         867),
            Gains = format:val_to_gain(NewRewards),
            NewGains = mark_source(Gains, []),
            case role_gain:do_notice(NewGains,
                                     LossRole,
                                     lang:get("提交成功，"))
                of
                {ok, GainRole} ->
                    case ReturnReward of
                        [] -> ignore;
                        _ ->
                            mail:send(HelpRid,
                                      lang:get("远航求助成功"),
                                      notice:format(lang:get("~ts完成了您的金箱子-~ts求助，您分得一半奖励~ts"),
                                                    [{role_2, Role},
                                                     {item_2, ItemBaseId},
                                                     {item_2, ReturnReward}]),
                                      ReturnReward)
                    end,
                    {ok, GainRole, Gains, Loss, normal};
                {false, #gain{label = prac_exp, msg = Msg}} ->
                    {ok, LossRole, NewGains, Loss, {false, Msg}};
                {false, #gain{msg = Msg}} -> {false, Msg};
                {false, Msg} -> {false, Msg};
                _ -> false
            end;
        {false, _} ->
            ItemMsg = notice:format(lang:get("~ts不足~ts个"),
                                    [{item_2, ItemBaseId},
                                     {string_1, NeedNum}]),
            {false, ItemMsg}
    end;
trans_commit(#shipping_cell{item_base_id = ItemBaseId,
                            need_num = NeedNum, type = CellType, id = CellId},
             #shipping{type = ShippingType}, Role, _) ->
    Loss = [#loss{label = item_base_id,
                  val = [{ItemBaseId, NeedNum}]}],
    case role_gain:do(Loss, Role) of
        {ok, LossRole} ->
            Rewards = calc_cell_reward(ShippingType,
                                       CellType,
                                       CellId,
                                       ItemBaseId,
                                       NeedNum,
                                       LossRole),
            ValueAdd = case
                           buff:is_special_effect_exists_one_param(Role, 6)
                           of
                           {true, Value} -> Value;
                           _ -> 0
                       end,
            NewRewards = calc_buff_add_prac_exp(Rewards, ValueAdd),
            logger:debug("buff add prac exp: [~w%, before: ~w, "
                         "after: ~w ]",
                         [ValueAdd div 10, Rewards, NewRewards],
                         shipping,
                         903),
            Gains = format:val_to_gain(NewRewards),
            NewGains = mark_source(Gains, []),
            case role_gain:do(NewGains, LossRole) of
                {ok, GainRole} -> {ok, GainRole, Gains, Loss, normal};
                {false, #gain{label = prac_exp, msg = Msg}} ->
                    {ok, LossRole, NewGains, Loss, {false, Msg}};
                {false, #gain{msg = Msg}} -> {false, Msg};
                {false, Msg} -> {false, Msg};
                _ -> false
            end;
        {false, _} ->
            ItemMsg = notice:format(lang:get("~ts不足~ts个"),
                                    [{item_2, ItemBaseId},
                                     {string_1, NeedNum}]),
            {false, ItemMsg}
    end.

mark_source([], Gains) -> Gains;
mark_source([G | Rest], Gains) ->
    NewG = case G of
               #gain{label = prac_exp} -> G#gain{source = 10};
               _ -> G
           end,
    mark_source(Rest, [NewG | Gains]).

guild_help_notice(#guild{members = Members}, HelpRid,
                  Rid, Item) ->
    HelpName = case lists:keyfind(HelpRid,
                                  #guild_role.id,
                                  Members)
                   of
                   #guild_role{name = TmpHelpName} -> TmpHelpName;
                   _ -> ""
               end,
    case lists:keytake(Rid, #guild_role.id, Members) of
        {value, #guild_role{name = Name}, RestMembers} ->
            GuildFmt = lang:get("~ts发起的远航求助~ts，已被~ts完成"),
            GuildArgs = [{role_2, HelpName}, Item, {role_2, Name}],
            GuildMsg = notice:format(GuildFmt, GuildArgs),
            guild:pack_cast(RestMembers, 9902, {32, GuildMsg, []});
        _ -> skip
    end,
    ok.

commit_reward_notice(TransTag,
                     #shipping_cell{type = CellType}, Gains, _Loss, Role) ->
    case TransTag of
        {false, Msg} ->
            notice:send(Role, 1, Msg),
            ok;
        _ ->
            notice_commit_reward(Gains, Role),
            case CellType of
                2 ->
                    case lists:keyfind(prac_exp, #gain.label, Gains) of
                        #gain{val = Exp} ->
                            Fmt = lang:get("（其中包含金箱子额外奖励~ts）"),
                            Args = [{assets_1, 90013, Exp div 2}],
                            Msg = notice:format(Fmt, Args),
                            notice:send(Role, 1, Msg),
                            ok;
                        _ -> skip
                    end;
                _ -> skip
            end
    end.

calc_cell_reward(1, 1, CellId, ItemBaseId, NeedNum,
                 Role) ->
    case get_commit_reward_factor(CellId, ItemBaseId, Role)
        of
        {BaseExp, Price, Ratio} ->
            Exp = util:floor((BaseExp / 10 + Price * 2.5) * NeedNum
                                 * Ratio
                                 / 1000),
            [{90013, Exp}];
        _False -> []
    end;
calc_cell_reward(1, 2, CellId, ItemBaseId, NeedNum,
                 Role) ->
    case get_commit_reward_factor(CellId, ItemBaseId, Role)
        of
        {BaseExp, Price, Ratio} ->
            Exp = util:floor((BaseExp / 10 + Price * 2.5) * NeedNum
                                 * 2
                                 * Ratio
                                 / 1000),
            [{90013, Exp}];
        _False -> []
    end;
calc_cell_reward(2, Type, CellId, ItemBaseId, NeedNum,
                 Role) ->
    case calc_cell_reward(1,
                          Type,
                          CellId,
                          ItemBaseId,
                          NeedNum,
                          Role)
        of
        false -> [];
        Gains -> Gains
    end;
calc_cell_reward(3, _Type, CellId, ItemBaseId, NeedNum,
                 Role) ->
    calc_cell_reward(1,
                     2,
                     CellId,
                     ItemBaseId,
                     NeedNum,
                     Role);
calc_cell_reward(_ShippingType, _Type, _CellId,
                 _ItemBaseId, _NeedNum, _Role) ->
    [].

calc_buff_add_prac_exp(Rewards, ValueAdd) ->
    calc_buff_add_prac_exp(Rewards, [], ValueAdd).

calc_buff_add_prac_exp([], NewRewards, _) -> NewRewards;
calc_buff_add_prac_exp([{90013, Exp} | T], NewRewards,
                       ValueAdd) ->
    AddExp = util:ceil(Exp * (1000 + ValueAdd) / 1000),
    calc_buff_add_prac_exp(T,
                           [{90013, AddExp} | NewRewards],
                           ValueAdd);
calc_buff_add_prac_exp([Reward | T], NewRewards,
                       ValueAdd) ->
    calc_buff_add_prac_exp(T,
                           [Reward | NewRewards],
                           ValueAdd).

get_commit_reward_factor(CellId, ItemBaseId, Role) ->
    case shipping_data:get_cell(CellId) of
        #shipping_cell_data{exp = BaseExp, ratio = Ratio} ->
            case market:query_all_price([{ItemBaseId}], Role) of
                {ok,
                 [#market_price{assets = 90000, price = CoinPrice}]} ->
                    case market_silver:exchange_gold(CoinPrice, Role) of
                        {ok, Price} -> {BaseExp, Price, Ratio};
                        _False ->
                            logger:error("没有物品数据~w", [_False], shipping, 1021),
                            {false, lang:get("没有该物品价格")}
                    end;
                {ok,
                 [#market_price{assets = 90003, price = BindPrice}]} ->
                    case market_gold:exchange_gold(BindPrice, Role) of
                        {ok, Price} -> {BaseExp, Price, Ratio};
                        _False ->
                            logger:error("没有物品数据~w", [_False], shipping, 1029),
                            {false, lang:get("没有该物品价格")}
                    end;
                {ok, [#market_price{assets = 90002, price = Price}]} ->
                    {BaseExp, Price, Ratio};
                _False ->
                    logger:error("没有物品数据ItemBaseId:~w Reason:~w",
                                 [ItemBaseId, _False],
                                 shipping,
                                 1035),
                    {false, lang:get("没有该物品价格")}
            end;
        _False -> false
    end.

get_info(Role = #role{id = Rid}) ->
    case case catch ets:lookup(shipping_tab, Rid) of
             [Obj] -> Obj;
             [] -> none;
             _ -> false
         end
        of
        Shipping = #shipping{status = Status}
            when Status =:= 1 orelse Status =:= 2 ->
            push_progress(Role, Shipping),
            ok;
        Shipping = #shipping{status = 3} ->
            push_progress(Role, Shipping),
            ok;
        _False -> false
    end.

get_start_info(Role = #role{id =
                                Rid = {RoleId, Platform, ZoneId}}) ->
    case case catch ets:lookup(shipping_tab, Rid) of
             [Obj] -> Obj;
             [] -> none;
             _ -> false
         end
        of
        #shipping{status = Status, type = Type,
                  start_time = StartTime, help = HelpNum, cells = Cells}
            when Status =:= 1 orelse Status =:= 2 ->
            CellsData = client_cells_data(Cells, Type, Role, []),
            {reply,
             {[{RoleId,
                Platform,
                ZoneId,
                Type,
                Status,
                StartTime,
                HelpNum,
                CellsData}]}};
        _False -> false
    end.

client_cells_data(List, ShippingType, Role, Acc) ->
    client_cells_data(List,
                      ShippingType,
                      Role,
                      Acc,
                      #{label => normal}).

client_cells_data([], _ShippingType, _Role, Acc, _) ->
    Acc;
client_cells_data([#shipping_cell{id = Id,
                                  type = Type = 3, status = Status,
                                  help_type = HelpType,
                                  item_base_id = ItemBaseId, quest_id = QuestId,
                                  need_num = NeedNum, rewards = Rewards}
                   | Rest],
                  ShippingType, Role, Acc, Args) ->
    Data = {Id,
            Type,
            Status,
            HelpType,
            ItemBaseId,
            QuestId,
            NeedNum,
            Rewards},
    client_cells_data(Rest,
                      ShippingType,
                      Role,
                      [Data | Acc],
                      Args);
client_cells_data([#shipping_cell{id = Id,
                                  type = Type = 4, status = Status,
                                  help_type = HelpType,
                                  item_base_id = ItemBaseId, quest_id = QuestId,
                                  need_num = NeedNum, rewards = Rewards}
                   | Rest],
                  ShippingType, Role, Acc, Args) ->
    Data = {Id,
            Type,
            Status,
            HelpType,
            ItemBaseId,
            QuestId,
            NeedNum,
            Rewards},
    client_cells_data(Rest,
                      ShippingType,
                      Role,
                      [Data | Acc],
                      Args);
client_cells_data([#shipping_cell{id = Id, type = Type,
                                  status = Status, help_type = HelpType,
                                  item_base_id = ItemBaseId, quest_id = QuestId,
                                  need_num = NeedNum}
                   | Rest],
                  ShippingType, Role, Acc, Args = #{label := Label}) ->
    Gains = calc_cell_reward(ShippingType,
                             Type,
                             Id,
                             ItemBaseId,
                             NeedNum,
                             Role),
    NewGains = case lists:keytake(90013, 1, Gains) of
                   {value, {_, TVal}, RestGains} ->
                       Val = case Type of
                                 2 when Label == help -> util:ceil(TVal / 2);
                                 _ -> TVal
                             end,
                       case skill_prac:calc_cycle_exp(Role, 1, Val) of
                           {ok, AddExp} -> [{90013, AddExp} | RestGains];
                           _False -> Gains
                       end;
                   _False -> Gains
               end,
    Data = {Id,
            Type,
            Status,
            HelpType,
            ItemBaseId,
            QuestId,
            NeedNum,
            NewGains},
    client_cells_data(Rest,
                      ShippingType,
                      Role,
                      [Data | Acc],
                      Args).

get_ready_info(Rid) ->
    case case catch ets:lookup(shipping_tab, Rid) of
             [Obj] -> Obj;
             [] -> none;
             _ -> false
         end
        of
        #shipping{status = 3, show_list = ShowList} ->
            {reply, {ShowList}};
        _False -> false
    end.

get_help_cell(Tag, HelpRid, CellId, Role) ->
    CommitVar = var:get_var(Role, day_five, 115, 0),
    case CommitVar < 3 of
        true -> help_cell(Tag, HelpRid, CellId, Role);
        false ->
            {false,
             util:flist(lang:get("每天只能帮助提交~w次喔{face_1,3}"), [3])}
    end.

help_cell(guild, _HelpRid, _CellId,
          #role{m_guild = undefined}) ->
    {false, lang:get("不在同一个公会")};
help_cell(guild, HelpRid, CellId,
          Role = #role{m_guild = #m_guild{id = GuildId}}) ->
    case case catch ets:lookup(shipping_tab, HelpRid) of
             [Obj] -> Obj;
             [] -> none;
             _ -> false
         end
        of
        #shipping{status = 1, cells = Cells,
                  type = ShippingType} ->
            case lists:keyfind(CellId, #shipping_cell.id, Cells) of
                Cell = #shipping_cell{status = 3,
                                      help_guild = GuildId} ->
                    CellData = client_cells_data([Cell],
                                                 ShippingType,
                                                 Role,
                                                 [],
                                                 #{label => help}),
                    {ok, {1, CellData}};
                Cell = #shipping_cell{status = 3} ->
                    case guild_role:find_role(HelpRid) of
                        {ok, GuildId} ->
                            CellData = client_cells_data([Cell],
                                                         ShippingType,
                                                         Role,
                                                         [],
                                                         #{label => help}),
                            {ok, {1, CellData}};
                        _False -> {false, lang:get("来晚一步，求助已完成{face_1, 21}")}
                    end;
                _False -> {false, lang:get("来晚一步，求助已完成{face_1, 21}")}
            end;
        _False -> {false, lang:get("来晚一步，求助已完成{face_1, 21}")}
    end;
help_cell(friend, HelpRid, CellId,
          Role = #role{id = Rid}) ->
    case friend:is_friend(Role, HelpRid) of
        true ->
            case case catch ets:lookup(shipping_tab, HelpRid) of
                     [Obj] -> Obj;
                     [] -> none;
                     _ -> false
                 end
                of
                #shipping{status = 1, cells = Cells,
                          type = ShippingType} ->
                    case lists:keyfind(CellId, #shipping_cell.id, Cells) of
                        Cell = #shipping_cell{status = 3,
                                              help_friends = Friends} ->
                            case lists:keyfind(Rid, 1, Friends) of
                                {Rid, _} ->
                                    CellData = client_cells_data([Cell],
                                                                 ShippingType,
                                                                 Role,
                                                                 [],
                                                                 #{label =>
                                                                       help}),
                                    {ok, {1, CellData}};
                                _ -> {false, lang:get("来晚一步，求助已完成{face_1, 21}")}
                            end;
                        _False -> {false, lang:get("来晚一步，求助已完成{face_1, 21}")}
                    end;
                _False -> {false, lang:get("来晚一步，求助已完成{face_1, 21}")}
            end;
        false -> {false, lang:get("来晚一步，求助已完成{face_1, 21}")}
    end.

push_friend_help(Role, Msg) ->
    chat:send_sns_msg(Role, Msg),
    ok.

get_box(Role = #role{s_event_pid = BattlePid,
                     pos =
                         #pos{platform = P, zone_id = Z, map = MapId, x = _X,
                              y = _Y},
                     id = RoleId, pid = Pid},
        UnitId = {BattleId, UId}) ->
    case unit_mgr:info(P, Z, UnitId) of
        {ok, #unit{pos = #pos{map = Map}}} when Map =/= MapId ->
            {false, lang:get("您所在地图无法操作当前该单位")};
        {ok, Unit = #unit{fun_type = 35, base_id = BaseId}} ->
            BoxTimes = var:get_list_var(Role,
                                        day_five,
                                        20,
                                        BaseId,
                                        0),
            case BoxTimes >= 20 of
                true -> {false, lang:get("今日已达到上限，明天再来{face_1,9}")};
                _ ->
                    case shipping_data:get_box(BaseId) of
                        [] -> {false, lang:get("该单位无法执行此操作哦")};
                        List ->
                            Loss = format:val_to_loss([{90000, 15000}]),
                            #{item_id := ItemId, num := Num, bind := Bind,
                              id := Id, is_cast := IsCast} =
                                util:rand_list(List, weight),
                            ItemList = [{ItemId, Bind, Num}],
                            Gains = format:val_to_gain(ItemList),
                            case role_gain:do_notice(Loss ++ Gains, Role) of
                                {false, #loss{}} -> {false, lang:get("银币不足")};
                                {false, #gain{}} -> {false, lang:get("背包空间不足")};
                                {ok, NRole} ->
                                    case cross:call(P,
                                                    Z,
                                                    unit_mgr,
                                                    sync_remove,
                                                    [Unit])
                                        of
                                        ok ->
                                            NewBoxTimes = BoxTimes + 1,
                                            NewRole = var:set_list_var(NRole,
                                                                       day_five,
                                                                       20,
                                                                       BaseId,
                                                                       NewBoxTimes),
                                            notice:send(NewRole,
                                                        3,
                                                        notice:format(lang:get("获得~ts，今日还可以开启~ts个"),
                                                                      [{item_2,
                                                                        ItemList},
                                                                       {string_2,
                                                                        5,
                                                                        20 -
                                                                            NewBoxTimes}])),
                                            sys_conn:pack_send(13716,
                                                               {BattleId,
                                                                UId,
                                                                Id,
                                                                20 -
                                                                    NewBoxTimes,
                                                                []}),
                                            battle_mgr:apply(async,
                                                             BattlePid,
                                                             {dungeon_shipping,
                                                              get_box,
                                                              [RoleId, Pid]}),
                                            case IsCast of
                                                1 ->
                                                    notice:cast(all,
                                                                4,
                                                                lang:get("天降鸿福，~ts在开启~ts宝箱时，获得了~ts冒险经验{face_1, "
                                                                         "20}"),
                                                                [{role_2, Role},
                                                                 {string_2,
                                                                  5,
                                                                  lang:get("远航秘境")},
                                                                 {string_2,
                                                                  5,
                                                                  Num}]);
                                                _ -> ignore
                                            end,
                                            {ok, NewRole};
                                        _Err ->
                                            logger:debug("移除单位出错, ~w",
                                                         [_Err],
                                                         shipping,
                                                         1198),
                                            {false, lang:get("移除单位出错")}
                                    end
                            end
                    end
            end;
        {ok, _Unit} -> {false, lang:get("该单位无法执行此操作")};
        _ ->
            logger:debug("不存在的单位, 单位ID:~w",
                         [UnitId],
                         shipping,
                         1207),
            {false, lang:get("无法找到该单位")}
    end.

is_in_shipping(#role{id = RoleId}) ->
    case ets:lookup(shipping_tab, RoleId) of
        [#shipping{status = 1}] -> true;
        _ -> false
    end.

shipping_classes_modify(Role = #role{classes =
                                         OldClasses},
                        TargetClasses) ->
    case refresh(Role#role{classes = TargetClasses}) of
        {ok, _Shipping, NewRole} ->
            NewRole#role{classes = OldClasses};
        false -> Role
    end.

start_link() ->
    gen_server:start_link({local, shipping},
                          shipping,
                          [],
                          []).

init([]) ->
    logger:info("远航商人正在启动:[~w]",
                [shipping],
                shipping,
                1240),
    process_flag(trap_exit, true),
    case catch load_data() of
        ok ->
            logger:info("远航商人启动完成:[~w]",
                        [shipping],
                        shipping,
                        1244),
            InitState = #state{},
            NewState = init_shipping(InitState),
            test(),
            {ok, NewState};
        {error, LoadErr} ->
            logger:error("远航商人启动失败:[~w][Err:~w]",
                         [shipping, LoadErr],
                         shipping,
                         1250),
            {stop, abnormal};
        Exit ->
            logger:error("远航商人启动失败:[~w][Err:~w]",
                         [shipping, Exit],
                         shipping,
                         1253),
            {stop, abnormal}
    end.

handle_call({start_shipping, Rid}, _From, State) ->
    {Reply, NewState} = case case catch
                                      ets:lookup(shipping_tab, Rid)
                                 of
                                 [Obj] -> Obj;
                                 [] -> none;
                                 _ -> false
                             end
                            of
                            Shipping = #shipping{status = 3,
                                                 start_time = Time} ->
                                case date:is_today(Time) of
                                    false ->
                                        Now = date:unixtime(),
                                        NewShipping = Shipping#shipping{status =
                                                                            1,
                                                                        start_time
                                                                            =
                                                                            Now},
                                        case storage(shipping_tab, NewShipping)
                                            of
                                            ok ->
                                                AddState =
                                                    add_server_shipping_timer(NewShipping,
                                                                              State),
                                                {{ok, NewShipping}, AddState};
                                            false -> {false, State}
                                        end;
                                    true -> {false, State}
                                end;
                            _False -> {false, State}
                        end,
    {reply, Reply, NewState};
handle_call({commit,
             Args = #shipping_commit_args{label = quest_finish}},
            _From, State) ->
    Reply = server_commit(Args),
    {reply, Reply, State};
handle_call({commit,
             Args = #shipping_commit_args{quest_id = QuestId}},
            _From, State)
    when QuestId > 0 ->
    Reply = server_commit(Args),
    {reply, Reply, State};
handle_call({commit,
             Args = #shipping_commit_args{pack_type = PackType}},
            _From, State)
    when PackType =:= 0 orelse
             PackType =:= 1 orelse PackType =:= 2 ->
    Reply = server_commit(Args),
    {reply, Reply, State};
handle_call(_Request, _From, State) ->
    logger:error("[~w]收到未知的消息:[~w]",
                 [shipping, _Request],
                 shipping,
                 1289),
    Reply = false,
    {reply, Reply, State}.

handle_cast({timeout, Rid, Pid}, State) ->
    case case catch ets:lookup(shipping_tab, Rid) of
             [Obj] -> Obj;
             [] -> none;
             _ -> false
         end
        of
        Shipping = #shipping{status = 1, type = OldType} ->
            case change_shipping_status(Shipping) of
                #shipping{status = 1, type = OldType} -> skip;
                NewShipping = #shipping{status = 1} ->
                    storage(shipping_tab, NewShipping),
                    role:apply(async, Pid, {shipping, push_timeout, [1]}),
                    ok;
                NewShipping = #shipping{status = 4} ->
                    role:apply(async, Pid, {shipping, timeout_reset, []}),
                    storage(shipping_tab, NewShipping);
                _ -> skip
            end;
        _Other -> skip
    end,
    {noreply, State};
handle_cast({help_guild, Rid, {CellId, GuildId}},
            State) ->
    case case catch ets:lookup(shipping_tab, Rid) of
             [Obj] -> Obj;
             [] -> none;
             _ -> false
         end
        of
        Shipping = #shipping{status = 1, start_time = Time,
                             cells = Cells} ->
            Now = date:unixtime(),
            case Time + 10 * 3600 > Now of
                true ->
                    case lists:keyfind(CellId, #shipping_cell.id, Cells) of
                        Cell = #shipping_cell{status = 1} ->
                            NewCell = Cell#shipping_cell{help_guild = GuildId,
                                                         status = 3,
                                                         help_type = 1},
                            NewCells = lists:keystore(CellId,
                                                      #shipping_cell.id,
                                                      Cells,
                                                      NewCell),
                            storage(shipping_tab,
                                    Shipping#shipping{cells = NewCells});
                        #shipping_cell{status = 3, help_type = 1} -> false;
                        Cell = #shipping_cell{status = 3} ->
                            NewCell = Cell#shipping_cell{help_guild = GuildId,
                                                         help_type = 3},
                            NewCells = lists:keystore(CellId,
                                                      #shipping_cell.id,
                                                      Cells,
                                                      NewCell),
                            storage(shipping_tab,
                                    Shipping#shipping{cells = NewCells});
                        _False -> skip
                    end;
                false ->
                    storage(shipping_tab, Shipping#shipping{status = 4})
            end;
        _Other -> skip
    end,
    {noreply, State};
handle_cast({help_friends, Rid, {CellId, Friends}},
            State) ->
    case case catch ets:lookup(shipping_tab, Rid) of
             [Obj] -> Obj;
             [] -> none;
             _ -> false
         end
        of
        Shipping = #shipping{status = 1, start_time = Time,
                             cells = Cells} ->
            Now = date:unixtime(),
            case Time + 10 * 3600 > Now of
                true ->
                    case lists:keyfind(CellId, #shipping_cell.id, Cells) of
                        Cell = #shipping_cell{status = 1,
                                              help_friends = HelpFrds} ->
                            NewFriends = acc_help_friends(Friends, HelpFrds),
                            NewCell = Cell#shipping_cell{status = 3,
                                                         help_type = 2,
                                                         help_friends =
                                                             NewFriends},
                            NewCells = lists:keystore(CellId,
                                                      #shipping_cell.id,
                                                      Cells,
                                                      NewCell),
                            storage(shipping_tab,
                                    Shipping#shipping{cells = NewCells});
                        Cell = #shipping_cell{status = 3,
                                              help_friends = HelpFrds} ->
                            NewFriends = acc_help_friends(Friends, HelpFrds),
                            NewCell = Cell#shipping_cell{help_friends =
                                                             NewFriends,
                                                         help_type = 3},
                            NewCells = lists:keystore(CellId,
                                                      #shipping_cell.id,
                                                      Cells,
                                                      NewCell),
                            storage(shipping_tab,
                                    Shipping#shipping{cells = NewCells});
                        _False -> skip
                    end;
                false ->
                    storage(shipping_tab, Shipping#shipping{status = 4})
            end;
        _Other -> skip
    end,
    {noreply, State};
handle_cast({del_timer, Rid},
            State = #state{timers = Timers}) ->
    DelTimers = lists:keydelete(Rid, 1, Timers),
    DelState = State#state{timers = DelTimers},
    NewState = next_timeout_timers(DelState),
    {noreply, NewState};
handle_cast(Info, State) ->
    logger:error("[~w]收到未知的消息:[~w]",
                 [shipping, Info],
                 shipping,
                 1371),
    {noreply, State}.

handle_info({shipping_timeout, Rid},
            State = #state{timers = Timers}) ->
    case case catch ets:lookup(shipping_tab, Rid) of
             [Obj] -> Obj;
             [] -> none;
             _ -> false
         end
        of
        Shipping = #shipping{status = 1} ->
            server_cancel_help(Shipping),
            ok;
        _ -> ok
    end,
    DelTimers = lists:keydelete(Rid, 1, Timers),
    DelState = State#state{timers = DelTimers},
    NewState = next_timeout_timers(DelState),
    {noreply, NewState};
handle_info(Info, State) ->
    logger:error("[~w]收到未知的消息:[~w]",
                 [shipping, Info],
                 shipping,
                 1387),
    {noreply, State}.

terminate(_Reason, _State) ->
    util:close_dets(shipping_tab),
    ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

load_data() ->
    shipping_tab = ets:new(shipping_tab,
                           [set, named_table, public, {keypos, #shipping.rid}]),
    {ok, shipping_tab} = dets:open_file(shipping_tab,
                                        [{file, "dets/shipping.dets"},
                                         {keypos, #shipping.rid},
                                         {type, set}]),
    case dets:first(shipping_tab) of
        '$end_of_table' ->
            logger:info("没有数据需要加载", [], shipping, 1407),
            [];
        _ ->
            dets:traverse(shipping_tab,
                          fun (G) ->
                                  case shipping_ver:do(G) of
                                      {false, Reason} ->
                                          logger:error("*******出大事了********远航数据转换失败:~w",
                                                       [Reason],
                                                       shipping,
                                                       1414),
                                          {done, false};
                                      {ok, NG} ->
                                          dets:insert(shipping_tab, NG),
                                          ets:insert(shipping_tab, NG),
                                          continue
                                  end
                          end)
    end,
    ok.

is_beginner(_Role) -> false.

storage(Tab, Data) ->
    case case catch ets:insert(Tab, Data) of
             true -> ok;
             _ -> false
         end
        of
        ok ->
            case case catch dets:insert(Tab, Data) of
                     ok -> ok;
                     _ -> false
                 end
                of
                ok -> ok;
                false ->
                    logger:error("持久化数据出错", [], shipping, 1450),
                    false
            end;
        false ->
            logger:error("持久化数据出错", [], shipping, 1454),
            false
    end.

revise_timer(Role = #role{name = _Name},
             Shipping = #shipping{start_time = StartTime}) ->
    Now = date:unixtime(),
    Five = date:unixtime({five, StartTime}),
    NextFive = Five + 86400,
    Timeout = case StartTime >= Five andalso
                       StartTime =< NextFive
                  of
                  true ->
                      Time1 = NextFive - Now,
                      erlang:min(Time1, StartTime + 10 * 3600);
                  false -> erlang:min(Five - StartTime, Five - Now)
              end,
    LeftTime = erlang:max(Timeout, 1),
    logger:debug("[name:~ts]远航任务重置时间:~w",
                 [_Name, Timeout],
                 shipping,
                 1472),
    Timer = #timer{id = shipping_reset,
                   timeout = LeftTime * 1000, m = shipping,
                   f = timeout_reset, a = []},
    TimeRole = role_timer:set(Timer, Role),
    role:apply(async,
               self(),
               {shipping, push_status, [Shipping]}),
    TimeRole.

revise(Shipping = #shipping{type = 2, status = 1,
                            start_time = Time},
       Role = #role{id = Rid}) ->
    Now = date:unixtime(),
    EmergEndTime = Time + 3600,
    case EmergEndTime > Now of
        true ->
            TimeRole = revise_timer(Role, Shipping),
            {ok, TimeRole};
        false ->
            EndTime = Time + 10 * 3600,
            case EndTime > Now of
                true ->
                    TimeRole = revise_timer(Role, Shipping),
                    {ok, TimeRole};
                false ->
                    del_server_timer(Rid),
                    refresh(Role)
            end
    end;
revise(Shipping = #shipping{status = 1,
                            start_time = Time},
       Role = #role{id = Rid}) ->
    Now = date:unixtime(),
    EndTime = Time + 10 * 3600,
    case EndTime > Now of
        true ->
            TimeRole = revise_timer(Role, Shipping),
            {ok, TimeRole};
        false ->
            del_server_timer(Rid),
            refresh(Role)
    end;
revise(#shipping{status = 3, reset_time = Time},
       Role) ->
    Now = date:unixtime(),
    case Time + 86400 > Now of
        true -> {ok, Role};
        false -> refresh(Role)
    end;
revise(#shipping{status = 4}, Role) -> refresh(Role);
revise(Shipping = #shipping{status = 2,
                            start_time = Time},
       Role = #role{id = Rid}) ->
    Now = date:unixtime(),
    EndTime = Time + 10 * 3600,
    case EndTime > Now of
        true ->
            TimeRole = revise_timer(Role, Shipping),
            {ok, TimeRole};
        false ->
            del_server_timer(Rid),
            refresh(Role)
    end;
revise(_Shipping, _Role) -> ok.

clean(Role = #role{m_quest =
                       #m_quest{quest_shipping =
                                    #quest_shipping{list = List}}}) ->
    clean_help(Role),
    NRole = clean_quest(Role, List),
    NewRole = plot_quest:remove_plot_unit(76510, NRole),
    NewRole.

clean_help(#role{id = Rid}) ->
    case case catch ets:lookup(shipping_tab, Rid) of
             [Obj] -> Obj;
             [] -> none;
             _ -> false
         end
        of
        Shipping = #shipping{} ->
            server_cancel_help(Shipping),
            ok;
        _False -> ok
    end;
clean_help(_Role) -> ok.

refresh(TmpRole) ->
    Role = clean(TmpRole),
    QuestCell = quest_cell(Role,
                           shipping_data:quest_cells(),
                           []),
    TmpClassifyList = shipping_data:get_classify(),
    ClassifyList = case QuestCell of
                       [] -> TmpClassifyList;
                       _ ->
                           lists:keydelete(4,
                                           #shipping_classify_data.classify,
                                           TmpClassifyList)
                   end,
    Must = [{Classify, MinNum, IsShow}
            || #shipping_classify_data{classify = Classify,
                                       min_num = MinNum, is_show = IsShow}
                   <- ClassifyList,
               MinNum > 0],
    {MustShowCells, MustCells, ExcludeCells} =
        do_refresh(Must, Role, [], [], []),
    Len = 8 - length(MustCells ++ QuestCell),
    NewClassifyList = filter_classify(ClassifyList,
                                      MustCells,
                                      ClassifyList),
    {ShowCells, Cells} = do_rand_refresh(Len,
                                         NewClassifyList,
                                         Role,
                                         MustShowCells,
                                         MustCells ++ QuestCell,
                                         ExcludeCells),
    ShuffleCells = shuffle(Cells),
    ShowLen = length(ShowCells),
    NewShowCells = if ShowLen =:= 3 -> ShowCells;
                      ShowLen < 3 ->
                          DiffLen = 3 - ShowLen,
                          case util:rand_list_n(ShuffleCells, DiffLen) of
                              TmpShow when is_list(TmpShow) ->
                                  TmpShow ++ ShowCells;
                              _Undef -> ShowCells
                          end;
                      true -> lists:sublist(ShowCells, 3)
                   end,
    case make_order(Role, NewShowCells, ShuffleCells) of
        {ok, NewShipping, NewRole} ->
            push_progress(NewRole, NewShipping),
            {ok, NewShipping, NewRole};
        Rtn -> Rtn
    end.

do_rand_refresh(0, _ClassifyList, _Role, ShowCells,
                Cells, _ExcludeCells) ->
    {ShowCells, Cells};
do_rand_refresh(Num, ClassifyList, Role, ShowCells,
                Cells, ExcludeCells)
    when Num > 0 ->
    case util:rand_list(ClassifyList,
                        #shipping_classify_data.weight)
        of
        #shipping_classify_data{classify = Classify,
                                max_num = MaxNum, is_show = IsShow} ->
            ClassifyLen = length([1
                                  || #shipping_cell_data{classify = TmpClassify}
                                         <- Cells,
                                     Classify =:= TmpClassify]),
            NewNum = ClassifyLen + 1,
            if NewNum < MaxNum ->
                   {NewShowCells, NewCells, NewExcludeCells} =
                       do_refresh([{Classify, 1, IsShow}],
                                  Role,
                                  ShowCells,
                                  Cells,
                                  ExcludeCells),
                   do_rand_refresh(Num - 1,
                                   ClassifyList,
                                   Role,
                                   NewShowCells,
                                   NewCells,
                                   NewExcludeCells);
               NewNum =:= MaxNum ->
                   {NewShowCells, NewCells, NewExcludeCells} =
                       do_refresh([{Classify, 1, IsShow}],
                                  Role,
                                  ShowCells,
                                  Cells,
                                  ExcludeCells),
                   NewClassifyList = lists:keydelete(Classify,
                                                     #shipping_classify_data.classify,
                                                     ClassifyList),
                   do_rand_refresh(Num - 1,
                                   NewClassifyList,
                                   Role,
                                   NewShowCells,
                                   NewCells,
                                   NewExcludeCells);
               true ->
                   do_rand_refresh(Num - 1,
                                   ClassifyList,
                                   Role,
                                   ShowCells,
                                   Cells,
                                   ExcludeCells)
            end;
        _Undef ->
            do_rand_refresh(Num - 1,
                            ClassifyList,
                            Role,
                            ShowCells,
                            Cells,
                            ExcludeCells)
    end;
do_rand_refresh(_Num, _ClassifyList, _Role, ShowCells,
                Cells, _ExcludeCells) ->
    {ShowCells, Cells}.

make_order(Role = #role{id = Rid}, ShowCells, Cells) ->
    Now = date:unixtime(),
    NewTypes = filter_types(Role),
    case util:rand_list(NewTypes, 2) of
        undefined -> false;
        {2, _Weight} ->
            NCells = to_cell(Cells, []),
            NewCells = rand_gold_cell(NCells, []),
            NewShowCells = [ShowItemBaseId
                            || #shipping_cell_data{item_base_id =
                                                       ShowItemBaseId}
                                   <- ShowCells],
            Shipping = #shipping{rid = Rid, reset_time = Now,
                                 status = 3, type = 2, show_list = NewShowCells,
                                 cells = NewCells},
            case storage(shipping_tab, Shipping) of
                ok -> {ok, Shipping, Role};
                false -> false
            end;
        {3, _Weight} ->
            NewCells = to_cell(Cells, []),
            NewShowCells = [ShowItemBaseId
                            || #shipping_cell_data{item_base_id =
                                                       ShowItemBaseId}
                                   <- ShowCells],
            Shipping = #shipping{rid = Rid, reset_time = Now,
                                 status = 3, type = 3, show_list = NewShowCells,
                                 cells = NewCells},
            case storage(shipping_tab, Shipping) of
                ok ->
                    NewRole = var:add_var(Role, week, 201, 1, 0),
                    {ok, Shipping, NewRole};
                false -> false
            end;
        _Normal ->
            NCells = to_cell(Cells, []),
            NewCells = rand_gold_cell(NCells, []),
            NewShowCells = [ShowItemBaseId
                            || #shipping_cell_data{item_base_id =
                                                       ShowItemBaseId}
                                   <- ShowCells],
            Shipping = #shipping{rid = Rid, reset_time = Now,
                                 status = 3, show_list = NewShowCells,
                                 cells = NewCells},
            case storage(shipping_tab, Shipping) of
                ok -> {ok, Shipping, Role};
                false -> false
            end
    end.

filter_types(Role = #role{lev = Lev}) ->
    Types = shipping_data:get_types(),
    case Lev < 50 of
        false ->
            SuperCount = var:get_var(Role, week, 201, 0),
            case is_beginner(Role) of
                false ->
                    case SuperCount < 1 of
                        false ->
                            case lists:keytake(3, 1, Types) of
                                {value, _Type, Rest} -> Rest;
                                false -> Types
                            end;
                        true -> Types
                    end;
                true -> lists:keydelete(3, 1, Types)
            end;
        true ->
            Types1 = lists:keydelete(3, 1, Types),
            lists:keydelete(2, 1, Types1)
    end.

filter_classify([], _MustCells, ClassifyList) ->
    ClassifyList;
filter_classify([#shipping_classify_data{classify =
                                             Classify,
                                         max_num = MaxNum}
                 | Rest],
                MustCells, ClassifyList) ->
    ClassifyLen = length([1
                          || #shipping_cell_data{classify = TmpClassify}
                                 <- MustCells,
                             Classify =:= TmpClassify]),
    case ClassifyLen >= MaxNum of
        true ->
            NewClassifyList = lists:keydelete(Classify,
                                              #shipping_classify_data.classify,
                                              ClassifyList),
            filter_classify(Rest, MustCells, NewClassifyList);
        false -> filter_classify(Rest, MustCells, ClassifyList)
    end.

do_refresh([], _Role, ShowCells, Cells, ExcludeCells) ->
    {ShowCells, Cells, ExcludeCells};
do_refresh([{Classify, Num, IsShow} | Rest],
           Role = #role{classes = Classes}, ShowCells, Cells,
           ExcludeCells) ->
    {ClassifyCells, RestExcludeCells} = case
                                            lists:keytake(Classify,
                                                          1,
                                                          ExcludeCells)
                                            of
                                            {value,
                                             {Classify, TmpClassifyCells},
                                             TmpRestExcludeCells} ->
                                                {TmpClassifyCells,
                                                 TmpRestExcludeCells};
                                            _False ->
                                                TmpClassifyCells1 =
                                                    shipping_data:get_classify_cells({Classify,
                                                                                      Classes}),
                                                TmpClassifyCells2 =
                                                    shipping_data:get_classify_cells({Classify,
                                                                                      0}),
                                                TmpClassifyCells =
                                                    lists:flatten([TmpClassifyCells1,
                                                                   TmpClassifyCells2]),
                                                {TmpClassifyCells, ExcludeCells}
                                        end,
    FilterCells = filter_cells(ClassifyCells, Role, []),
    RandCells = case util:rand_list_n(FilterCells,
                                      #shipping_cell_data.weight,
                                      Num)
                    of
                    undefined -> [];
                    TmpRandCells -> TmpRandCells
                end,
    NewShowCells = case IsShow of
                       1 -> lists:flatten([RandCells, ShowCells]);
                       0 -> ShowCells
                   end,
    RestClassifyCells = exclude_rand_cell(RandCells,
                                          ClassifyCells),
    do_refresh(Rest,
               Role,
               NewShowCells,
               lists:flatten([RandCells, Cells]),
               [{Classify, RestClassifyCells} | RestExcludeCells]).

exclude_rand_cell([], ClassifyCells) -> ClassifyCells;
exclude_rand_cell([#shipping_cell_data{id = Id} | Rest],
                  ClassifyCells) ->
    NewClassifyCells = lists:keydelete(Id,
                                       #shipping_cell_data.id,
                                       ClassifyCells),
    exclude_rand_cell(Rest, NewClassifyCells).

filter_cells([], _Role, Acc) -> Acc;
filter_cells([Data = #shipping_cell_data{lev = LevCond}
              | Rest],
             Role = #role{lev = Lev}, Acc)
    when Lev >= LevCond ->
    filter_cells(Rest, Role, [Data | Acc]);
filter_cells([_H | Rest], Role, Acc) ->
    filter_cells(Rest, Role, Acc).

rand_gold_cell([], Acc) -> Acc;
rand_gold_cell([Cell = #shipping_cell{type = 3} | Rest],
               Acc) ->
    rand_gold_cell(Rest, [Cell | Acc]);
rand_gold_cell([Cell = #shipping_cell{type = 4} | Rest],
               Acc) ->
    rand_gold_cell(Rest, [Cell | Acc]);
rand_gold_cell([Cell = #shipping_cell{type = 5} | Rest],
               Acc) ->
    rand_gold_cell(Rest, [Cell | Acc]);
rand_gold_cell([Cell = #shipping_cell{item_base_id =
                                          20042}
                | Rest],
               Acc) ->
    rand_gold_cell(Rest, [Cell | Acc]);
rand_gold_cell([Cell | Rest], Acc) ->
    Rand = util:rand(1, 10),
    case Rand > 1 of
        false ->
            rand_gold_cell(Rest,
                           [Cell#shipping_cell{type = 2} | Acc]);
        true -> rand_gold_cell(Rest, [Cell | Acc])
    end.

push_progress(Role,
              #shipping{status = 3, show_list = ShowList}) ->
    DayCount = var:get_var(Role, day_five, 116, 0),
    IsStart = case DayCount < 1 of
                  true -> 1;
                  false -> 0
              end,
    role:link_send(Role, 13701, {IsStart, ShowList}),
    ok;
push_progress(Role,
              #shipping{rid = {Rid, Platform, ZoneId}, type = Type,
                        status = Status, start_time = StartTime, help = HelpNum,
                        cells = Cells}) ->
    CellsData = client_cells_data(Cells, Type, Role, []),
    Data = {[{Rid,
              Platform,
              ZoneId,
              Type,
              Status,
              StartTime,
              HelpNum,
              CellsData}]},
    role:link_send(Role, 13700, Data),
    ok;
push_progress(_, _) -> ok.

push_status(Role = #role{id = Rid}) ->
    case case catch ets:lookup(shipping_tab, Rid) of
             [Obj] -> Obj;
             [] -> none;
             _ -> false
         end
        of
        Shipping = #shipping{} -> push_status(Role, Shipping);
        _False -> ok
    end.

push_status(Role,
            #shipping{status = Status, start_time = StartTime}) ->
    Data = {Status, StartTime},
    role:link_send(Role, 13709, Data),
    ok.

push_timeout(Role, OpCode) ->
    role:link_send(Role, 13712, {OpCode}),
    ok.

notice_commit_reward([], _Role) -> ok;
notice_commit_reward([#gain{label = item_base_id,
                            val = List}
                      | Rest],
                     Role) ->
    NoticeList = [{BaseId, Num}
                  || {BaseId, _Bind, Num} <- List],
    notice:gain_item(Role, 1, NoticeList),
    notice_commit_reward(Rest, Role);
notice_commit_reward([_H | Rest], Role) ->
    notice_commit_reward(Rest, Role).

shuffle(L) ->
    List1 = [{random:uniform(), X} || X <- L],
    List2 = lists:keysort(1, List1),
    [E || {_, E} <- List2].

check_abandon_item(#shipping{cells = Cells}) ->
    check_abandon_item(Cells);
check_abandon_item([]) -> false;
check_abandon_item([#shipping_cell{type = 5} | Rest]) ->
    check_abandon_item(Rest);
check_abandon_item([#shipping_cell{type = 4} | Rest]) ->
    check_abandon_item(Rest);
check_abandon_item([#shipping_cell{type = 3} | Rest]) ->
    check_abandon_item(Rest);
check_abandon_item([#shipping_cell{item_base_id =
                                       ItemBaseId}
                    | Rest]) ->
    case shipping_data:get_item(ItemBaseId) of
        #shipping_cell_data{} -> check_abandon_item(Rest);
        _False -> true
    end.

server_commit(Args = #shipping_commit_args{self_id =
                                               Who,
                                           label = quest_finish}) ->
    case case catch ets:lookup(shipping_tab, Who) of
             [Obj] -> Obj;
             [] -> none;
             _ -> false
         end
        of
        Shipping = #shipping{status = 1, type = OldType} ->
            case change_shipping_status(Shipping) of
                #shipping{status = 4} -> {false, 4};
                StatusShipping = #shipping{} ->
                    server_commit(OldType, StatusShipping, Args)
            end;
        _False -> false
    end;
server_commit(Args = #shipping_commit_args{self_id =
                                               Who,
                                           quest_id = QuestId})
    when QuestId > 0 ->
    case case catch ets:lookup(shipping_tab, Who) of
             [Obj] -> Obj;
             [] -> none;
             _ -> false
         end
        of
        Shipping = #shipping{status = 1, type = OldType} ->
            case change_shipping_status(Shipping) of
                #shipping{status = 4} -> {false, 4};
                StatusShipping = #shipping{} ->
                    server_commit(OldType, StatusShipping, Args)
            end;
        _False -> false
    end;
server_commit(Args = #shipping_commit_args{pack_type =
                                               PackType,
                                           self_id = SelfId,
                                           help_rid = HelpRid}) ->
    Who = case PackType of
              0 -> SelfId;
              _ -> HelpRid
          end,
    case case catch ets:lookup(shipping_tab, Who) of
             [Obj] -> Obj;
             [] -> none;
             _ -> false
         end
        of
        Shipping = #shipping{status = 1, type = OldType} ->
            case change_shipping_status(Shipping) of
                #shipping{status = 4} -> {false, 4};
                StatusShipping = #shipping{} ->
                    server_commit(OldType, StatusShipping, Args)
            end;
        _False -> false
    end;
server_commit(_) -> false.

server_commit(OldType,
              Shipping = #shipping{type = NewType},
              _Args = #shipping_commit_args{cell_id = CellId,
                                            label = quest_finish,
                                            args = Rewards}) ->
    case check_cell_pack_status(CellId, Shipping) of
        {ok, Cell, RestCells} ->
            case server_commit_cell(OldType,
                                    NewType,
                                    1,
                                    Cell,
                                    RestCells,
                                    {quest_finish, Rewards})
                of
                {ok, #shipping_cell{}, NewCells} ->
                    NewStatus = check_status(NewCells),
                    NewShipping = Shipping#shipping{cells = NewCells,
                                                    type = NewType,
                                                    status = NewStatus},
                    storage(shipping_tab, NewShipping);
                _False -> {false, lang:get("箱子提交失败")}
            end;
        Rtn -> Rtn
    end;
server_commit(OldType,
              Shipping = #shipping{type = NewType},
              _Args = #shipping_commit_args{cell_id = CellId,
                                            quest_id = QuestId})
    when QuestId > 0 ->
    case check_cell_pack_status(CellId, Shipping) of
        {ok, Cell, RestCells} ->
            case server_commit_cell(OldType,
                                    NewType,
                                    1,
                                    Cell,
                                    RestCells,
                                    {quest, QuestId})
                of
                {ok, #shipping_cell{}, NewCells} ->
                    NewStatus = check_status(NewCells),
                    NewShipping = Shipping#shipping{cells = NewCells,
                                                    type = NewType,
                                                    status = NewStatus},
                    storage(shipping_tab, NewShipping);
                _False -> {false, lang:get("箱子提交失败")}
            end;
        Rtn -> Rtn
    end;
server_commit(OldType,
              Shipping = #shipping{type = NewType, help = Help},
              Args = #shipping_commit_args{cell_id = CellId,
                                           pack_type = PackType,
                                           self_id = _SelfId,
                                           help_rid = HelpRid}) ->
    case check_cell_pack_status(CellId, Shipping) of
        {ok, Cell, RestCells} ->
            case server_commit_cell(OldType,
                                    NewType,
                                    PackType,
                                    Cell,
                                    RestCells,
                                    commit)
                of
                {ok, #shipping_cell{help_type = 0}, NewCells} ->
                    NewStatus = check_status(NewCells),
                    NewShipping = Shipping#shipping{cells = NewCells,
                                                    type = NewType,
                                                    status = NewStatus},
                    storage(shipping_tab, NewShipping);
                {ok, _NewCell, NewCells} ->
                    NewStatus = check_status(NewCells),
                    NewHelp = case PackType of
                                  0 -> Help;
                                  _ -> Help + 1
                              end,
                    NewShipping = Shipping#shipping{cells = NewCells,
                                                    type = NewType,
                                                    status = NewStatus,
                                                    help = NewHelp},
                    case cancel_guild_help_shipping(NewShipping, Cell, Args)
                        of
                        ok ->
                            case HelpRid of
                                undefined -> ok;
                                _ ->
                                    role_trigger:async_fire(HelpRid,
                                                            [#evt_shipping_commit{type
                                                                                      =
                                                                                      NewType,
                                                                                  pack_type
                                                                                      =
                                                                                      PackType}])
                            end,
                            storage(shipping_tab, NewShipping);
                        Rtn -> Rtn
                    end;
                _False -> {false, lang:get("箱子提交失败")}
            end;
        Rtn -> Rtn
    end.

-spec cancel_guild_help_shipping(Shipping, Cell,
                                 Args) -> ok | {false, Msg} when Shipping ::
                                                                     #shipping{},
                                                                 Cell ::
                                                                     #shipping_cell{},
                                                                 Args ::
                                                                     #shipping_commit_args{},
                                                                 Msg ::
                                                                     string().

cancel_guild_help_shipping(#shipping{help = Help,
                                     rid = Rid},
                           #shipping_cell{item_base_id = ItemBaseId,
                                          id = CellId, help_type = HelpType},
                           #shipping_commit_args{self_name = Name,
                                                 self_id = SelfId,
                                                 pack_type = PackType})
    when HelpType =:= 1 orelse HelpType =:= 3 ->
    Cancel = case Help < 2 of
                 true -> CellId;
                 false -> all
             end,
    case guild_role:find_role(Rid) of
        {ok, GuildId} ->
            case catch guild_common:cancel_help_shipping(Cancel,
                                                         Rid,
                                                         GuildId)
                of
                ok ->
                    case Rid =:= SelfId of
                        false ->
                            Title = lang:get("远航求助成功"),
                            Fmt =
                                lang:get("您的远航公会求助-~ts被~ts完成，已自动提交。如果货物都提交了，就赶紧起航吧。"),
                            Args = [{item_2, ItemBaseId}, {role_2, Name}],
                            Msg = notice:format(Fmt, Args),
                            mail:send(Rid, Title, Msg);
                        true -> skip
                    end,
                    ok;
                {false, Msg} -> {false, Msg};
                _Rtn -> ok
            end;
        _ ->
            case PackType of
                2 -> ok;
                0 -> ok;
                _ -> {false, lang:get("提交公会需求失败")}
            end
    end;
cancel_guild_help_shipping(_Shipping, _Cell, _Args) ->
    ok.

cancel_guild_help_shipping(Rid) ->
    case guild_role:find_role(Rid) of
        {ok, GuildId} ->
            guild_common:cancel_help_shipping(all, Rid, GuildId),
            ok;
        _ -> ok
    end.

check_cell_pack_status(CellId,
                       #shipping{cells = Cells}) ->
    case lists:keytake(CellId, #shipping_cell.id, Cells) of
        {value,
         Cell = #shipping_cell{status = Status},
         RestCells}
            when Status =:= 1 orelse
                     Status =:= 4 orelse Status =:= 3 ->
            {ok, Cell, RestCells};
        {value,
         #shipping_cell{status = 2, pack_type = 1},
         _RestCells} ->
            {false, lang:get("此箱子已被求助的公会成员打包")};
        {value,
         #shipping_cell{status = 2, pack_type = 2},
         _RestCells} ->
            {false, lang:get("此箱子已被求助的好友打包")};
        {value, #shipping_cell{status = 2}, _RestCells} ->
            {false, lang:get("此箱子已被打包")};
        _False -> false
    end.

check_status([]) -> 2;
check_status([#shipping_cell{status = 4} | _Rest]) -> 1;
check_status([#shipping_cell{status = 1} | _Rest]) -> 1;
check_status([#shipping_cell{status = 3} | _Rest]) -> 1;
check_status([_H | Rest]) -> check_status(Rest).

server_commit_cell(Type, Type, _PackType, Cell,
                   RestCells,
                   {quest_finish,
                    #quest_shipping_reward_data{need_num = NeedNum,
                                                rewards = Rewards}}) ->
    NewCell = Cell#shipping_cell{quest_id = 0,
                                 need_num = NeedNum, rewards = Rewards,
                                 status = 4},
    {ok, NewCell, [NewCell | RestCells]};
server_commit_cell(Type, Type, _PackType, Cell,
                   RestCells, {quest, QuestId}) ->
    NewCell = Cell#shipping_cell{quest_id = QuestId},
    {ok, NewCell, [NewCell | RestCells]};
server_commit_cell(2, 1, PackType, Cell, RestCells,
                   _) ->
    NewCell = Cell#shipping_cell{status = 2,
                                 pack_type = PackType},
    {ok, NewCell, [NewCell | RestCells]};
server_commit_cell(Type, Type, PackType, Cell,
                   RestCells, _) ->
    NewCell = Cell#shipping_cell{status = 2,
                                 pack_type = PackType},
    {ok, NewCell, [NewCell | RestCells]};
server_commit_cell(_OldType, _NewType, _PackType, _Cell,
                   _RestCells, _) ->
    false.

change_shipping_status(Shipping = #shipping{type = 2,
                                            start_time = Time}) ->
    Now = date:unixtime(),
    case Time + 3600 > Now of
        true -> Shipping;
        false ->
            case Time + 10 * 3600 > Now of
                true -> Shipping#shipping{type = 1};
                false -> Shipping#shipping{status = 4}
            end
    end;
change_shipping_status(Shipping = #shipping{type = Type,
                                            start_time = Time})
    when Type =:= 1 orelse Type =:= 3 ->
    Now = date:unixtime(),
    case Time + 10 * 3600 > Now of
        true -> Shipping;
        false -> Shipping#shipping{status = 4}
    end;
change_shipping_status(Shipping) -> Shipping.

add_server_shipping_timer(#shipping{rid = Rid,
                                    start_time = StartTime},
                          State = #state{timers = Timers}) ->
    NewTimers = [{Rid, StartTime} | Timers],
    TimerState = State#state{timers = NewTimers},
    next_timeout_timers(TimerState).

init_shipping(State) ->
    F = fun (Shipping = #shipping{status = 1},
             {Timer, Timeout}) ->
                case change_shipping_status(Shipping) of
                    NewShipping = #shipping{status = 4} ->
                        {Timer, [NewShipping | Timeout]};
                    _ -> {[Shipping | Timer], Timeout}
                end;
            (_Shipping, Acc) -> Acc
        end,
    {TimerAcc, TimeoutAcc} = ets:foldl(F,
                                       {[], []},
                                       shipping_tab),
    [server_cancel_help(Shipping)
     || Shipping <- TimeoutAcc],
    reload_server_shipping_timer(State, TimerAcc).

reload_server_shipping_timer(State = #state{timers =
                                                Timers},
                             Shippings) ->
    AddTimers = [{Rid, Time}
                 || #shipping{status = 1, start_time = Time, rid = Rid}
                        <- Shippings],
    TimerState = State#state{timers = Timers ++ AddTimers},
    next_timeout_timers(TimerState).

next_timeout_timers(State = #state{timers = Timers,
                                   reset_timer = Ref}) ->
    case is_reference(Ref) of
        true -> erlang:cancel_timer(Ref);
        _ -> ok
    end,
    NewTimers = lists:keysort(2, Timers),
    case NewTimers of
        [{Rid, StartTime} | _] ->
            Now = date:unixtime(),
            Five = date:unixtime({five, StartTime}),
            NextFive = Five + 86400,
            Timeout = case StartTime >= Five andalso
                               StartTime =< NextFive
                          of
                          true ->
                              Time1 = NextFive - Now,
                              erlang:min(Time1, StartTime + 10 * 3600);
                          false -> erlang:min(Five - StartTime, Five - Now)
                      end,
            LeftTime = erlang:max(Timeout, 1),
            NewRef = erlang:send_after(LeftTime * 1000,
                                       self(),
                                       {shipping_timeout, Rid}),
            State#state{timers = NewTimers, reset_timer = NewRef};
        _ -> State#state{reset_timer = undefined}
    end.

server_cancel_help(#shipping{cells = Cells,
                             rid = Rid}) ->
    HelpList = [GuildId
                || #shipping_cell{status = Status, help_type = HelpType,
                                  help_guild = GuildId}
                       <- Cells,
                   Status =:= 3, HelpType =:= 1 orelse HelpType =:= 3],
    case HelpList of
        [_ | _] ->
            cancel_guild_help_shipping(Rid),
            ok;
        _False ->
            cancel_guild_help_shipping(Rid),
            ok
    end.

acc_help_friends([], Acc) -> Acc;
acc_help_friends([Rid | Rest], Acc) ->
    NewAcc = case lists:keyfind(Rid, 1, Acc) of
                 {Rid, Num} ->
                     NewNum = Num + 1,
                     lists:keystore(Rid, 1, Acc, {Rid, NewNum});
                 _ -> [{Rid, 1} | Acc]
             end,
    acc_help_friends(Rest, NewAcc).

quest_cell(_Role = #role{lev = Lev}, _, _List)
    when Lev < 60 ->
    [];
quest_cell(_Role, [], List) ->
    [#shipping_cell_data{id = Id, classify = Classify,
                         item_base_id = ItemBaseId, need_num = 0,
                         quest_id = QuestId}
     || #shipping_cell_quset_data{id = Id,
                                  item_base_id = ItemBaseId, quest_id = QuestId,
                                  classify = Classify}
            <- List];
quest_cell(Role,
           [I = #shipping_cell_quset_data{id = Id, ratio = Ratio,
                                          week_max = WeekMax,
                                          week_min = WeekMin}
            | T],
           List) ->
    Week = calendar:day_of_the_week(erlang:date()),
    case var:get_list_var(Role, week_five, 209, Id, 0) of
        WeekVar when WeekMax =< WeekVar ->
            quest_cell(Role, T, List);
        WeekVar when Week == 7 andalso WeekMin > WeekVar ->
            quest_cell(Role, [], [I | List]);
        _ ->
            case util:rand(1, 1000) of
                Val when Val < Ratio ->
                    quest_cell(Role, [], [I | List]);
                _ -> quest_cell(Role, T, List)
            end
    end.

to_cell([], List) -> List;
to_cell([#shipping_cell_data{id = Id, classify = 7,
                             item_base_id = ItemBaseId, need_num = NeedNum,
                             quest_id = QuestId}
         | T],
        List) ->
    to_cell(T,
            [#shipping_cell{id = Id, type = 3,
                            item_base_id = ItemBaseId, need_num = NeedNum,
                            quest_id = QuestId}
             | List]);
to_cell([#shipping_cell_data{id = Id, classify = 8,
                             item_base_id = ItemBaseId, need_num = NeedNum,
                             quest_id = QuestId}
         | T],
        List) ->
    to_cell(T,
            [#shipping_cell{id = Id, type = 4,
                            item_base_id = ItemBaseId, need_num = NeedNum,
                            quest_id = QuestId}
             | List]);
to_cell([#shipping_cell_data{id = Id, classify = 9,
                             item_base_id = ItemBaseId, need_num = NeedNum,
                             quest_id = QuestId}
         | T],
        List) ->
    to_cell(T,
            [#shipping_cell{id = Id, type = 5,
                            item_base_id = ItemBaseId, need_num = NeedNum,
                            quest_id = QuestId}
             | List]);
to_cell([#shipping_cell_data{id = Id,
                             item_base_id = ItemBaseId, need_num = NeedNum}
         | T],
        List) ->
    to_cell(T,
            [#shipping_cell{id = Id, item_base_id = ItemBaseId,
                            need_num = NeedNum}
             | List]).

accept_quest(Role, []) -> Role;
accept_quest(Role,
             [#shipping_cell{id = Id, type = 3, quest_id = QuestId}
              | T]) ->
    case quest:callback_accept(Role,
                               QuestId,
                               [condition, loss, accept, fire])
        of
        {ok, NRole} ->
            Num = var:get_list_var(NRole, week_five, 209, Id, 0),
            NewNum = Num + 1,
            NewRole = var:set_list_var(NRole,
                                       week_five,
                                       209,
                                       Id,
                                       NewNum),
            accept_quest(NewRole, T);
        ok ->
            logger:error("接受远航任务出错：~ts", ["为什么"], shipping, 2148),
            accept_quest(Role, T)
    end;
accept_quest(Role,
             [#shipping_cell{id = Id, type = 4} | T]) ->
    {ok, NRole} = create_dun_plot_unit(Role),
    Num = var:get_list_var(NRole, week_five, 209, Id, 0),
    NewNum = Num + 1,
    NewRole = var:set_list_var(NRole,
                               week_five,
                               209,
                               Id,
                               NewNum),
    accept_quest(NewRole, T);
accept_quest(Role, [_ | T]) -> accept_quest(Role, T).

clean_quest(Role, []) -> Role;
clean_quest(Role, [Id | T]) ->
    NRole = quest:del_quest(Id, Role),
    clean_quest(NRole, T).

get_exp_mode(Role, Mode, Radio) ->
    get_exp_mode(Role,
                 Mode,
                 Radio,
                 [exp, pet_exp, coin],
                 []).

get_exp_mode(_Role, _Mode, _Radio, [], List) -> List;
get_exp_mode(Role, Mode, Radio, [H | T], List) ->
    Add = get_exp_mode(Role, Mode, Radio, H),
    get_exp_mode(Role, Mode, Radio, T, List ++ Add).

get_exp_mode(_Role = #role{lev = Lev}, Mode, Radio,
             exp) ->
    case levup_data:get_exp({Mode, Lev}) of
        #{exp := 0} -> [];
        #{exp := Exp} -> [{90010, util:ceil(Exp * Radio)}];
        _ -> []
    end;
get_exp_mode(Role, Mode, Radio, pet_exp) ->
    case pet:get_war_pet(Role) of
        {ok, #pet{lev = Lev}} ->
            case levup_data:get_exp({Mode, Lev}) of
                #{pet_exp := 0} -> [];
                #{pet_exp := Exp} -> [{90005, util:ceil(Exp * Radio)}];
                _ -> []
            end;
        _ -> []
    end;
get_exp_mode(_Role = #role{lev = Lev}, Mode, Radio,
             coin) ->
    case levup_data:get_exp({Mode, Lev}) of
        #{coin := 0} -> [];
        #{coin := Exp} -> [{90000, util:ceil(Exp * Radio)}];
        _ -> []
    end.

create_dun_plot_unit(Role = #role{m_plot =
                                      MPlot = #m_plot{unit_list = UnitList}}) ->
    Pos = #{map => 10002, x => 1640, y => 1640},
    case plot_quest:make_plot_unit(76510,
                                   76510,
                                   Pos,
                                   Role,
                                   [])
        of
        {ok, PlotUnit} ->
            NewUnitList = lists:keystore(76510,
                                         #plot_unit.id,
                                         UnitList,
                                         PlotUnit),
            NRole = Role#role{m_plot =
                                  MPlot#m_plot{unit_list = NewUnitList}},
            plot_quest:send_unit_plot_act(NRole, [PlotUnit]),
            {ok, NRole};
        _ -> {ok, Role}
    end.

test() ->
    logger:info("~w",
                [ets:info(shipping_tab)],
                shipping,
                2221),
    logger:info("~w",
                [dets:info(shipping_tab)],
                shipping,
                2222),
    dets:delete_all_objects(shipping_tab),
    List = ets:tab2list(shipping_tab),
    Now = date:unixtime(),
    test(List, Now - 30 * 86400),
    ets:to_dets(shipping_tab, shipping_tab),
    logger:info("~w",
                [ets:info(shipping_tab)],
                shipping,
                2228),
    logger:info("~w",
                [dets:info(shipping_tab)],
                shipping,
                2229).

test([], _) -> ok;
test([#shipping{rid = Id, reset_time = RT} | T], Time)
    when RT =< Time ->
    ets:delete(shipping_tab, Id),
    test(T, Time);
test([_ | T], Time) -> test(T, Time).

