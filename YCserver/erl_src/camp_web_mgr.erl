-file("src/mod/campaign/camp_web_mgr.erl", 1).

-module(camp_web_mgr).

-behaviour(gen_server).

-export([reload/0,
         is_camp_time/1,
         get_camp_time/1,
         get_camp_time/2,
         get_camp_ratio/1,
         get_camp_info/1,
         list_all/0,
         list_all/1,
         list_flat/0,
         list_all_not_finish/0,
         lookup/1,
         lookup/2,
         lookup/3,
         lookup_open/1,
         list_type/1,
         list_type/2,
         get_luck_list/0,
         send_end_reward/2,
         set_pay_single_limit_start_time/1,
         set_pay_single_limit_end_time/1,
         check_timer/1,
         cancel_dic/1]).

-export([info/1, cast/1, call/1, start_link/0]).

-export([init/1,
         handle_call/3,
         handle_cast/2,
         handle_info/2,
         terminate/2,
         code_change/3]).

-record(state, {}).

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

-file("src/mod/campaign/camp_web_mgr.erl", 36).

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

-file("src/mod/campaign/camp_web_mgr.erl", 37).

-file("inc/camp_web.hrl", 1).

-record(m_camp_web,
        {ver = 4 :: non_neg_integer(),
         acc = [] :: list(),
         can_reward = [] :: list(),
         rewarded = [] :: list(),
         overdue_time = 0 :: non_neg_integer(),
         end_reward = [] :: list(),
         time_list = [] :: list(),
         card_info = {0, 0, 0, []} :: tuple()}).

-record(camp_web_ico,
        {id = 0 :: non_neg_integer(),
         name = "" :: bitstring(),
         title = "" :: bitstring(),
         ico = "" :: bitstring(),
         alert = "" :: bitstring(),
         gif = "" :: bitstring(),
         start_time = 0 :: non_neg_integer(),
         end_time = 0 :: non_neg_integer(),
         login_open = 0 :: non_neg_integer(),
         is_show_time = 0 :: 0..1,
         menu_list = [] :: list()}).

-record(camp_web_menu,
        {id = 0 :: non_neg_integer(),
         type = 0 :: non_neg_integer(),
         sec_type = 0 :: non_neg_integer(),
         settlement = 0 :: non_neg_integer(),
         reward_mod = 0 :: non_neg_integer(),
         mail_title = "" :: bitstring(),
         mail_content = "" :: bitstring(),
         title = "" :: bitstring(),
         title2 = "" :: bitstring(),
         ico = "" :: bitstring(),
         title_ico = "" :: bitstring(),
         type_ico = "" :: bitstring(),
         total_ico = 0 :: non_neg_integer(),
         start_time = 0 :: non_neg_integer(),
         end_time = 0 :: non_neg_integer(),
         sort_val = 0 :: non_neg_integer(),
         top_banner = "" :: bitstring(),
         rule_str = "" :: bitstring(),
         time_str = "" :: bitstring(),
         bottom_alert = "" :: bitstring(),
         reward_title = "" :: bitstring(),
         panel_type = "" :: bitstring(),
         cli_reward = "" :: bitstring(),
         button_text = "" :: bitstring(),
         is_button = 0 :: 0..1,
         notice_msg = "" :: bitstring(),
         camp_list = [] :: list(),
         is_tran = 0,
         tran_info = ""}).

-record(camp_web,
        {id = 0 :: non_neg_integer(),
         n = 1 :: pos_integer(),
         key = {0, 0} :: tuple(),
         type = 0 :: non_neg_integer(),
         sec_type = 0 :: non_neg_integer(),
         third_type = 0 :: non_neg_integer(),
         settlement = 0 :: non_neg_integer(),
         reward_num = 1 :: non_neg_integer(),
         reward_can = 0 :: non_neg_integer(),
         value = 0 :: non_neg_integer(),
         tar_val = 0 :: non_neg_integer(),
         ext_val = 0 :: non_neg_integer(),
         status = 0 :: 0..2,
         cond_msg = "" :: bitstring(),
         loss_items = [] :: list(),
         items = [] :: list(),
         val1 = 0 :: non_neg_integer(),
         val2 = 0 :: non_neg_integer(),
         val3 = 0 :: non_neg_integer(),
         val4 = 0 :: non_neg_integer(),
         str1 = "" :: bitstring(),
         str2 = "" :: bitstring(),
         str3 = "" :: bitstring(),
         str4 = "" :: bitstring(),
         extra = [],
         data :: undefined | any(),
         is_desc = 0 :: 0..1}).

-record(camp_handle,
        {time = 0 :: non_neg_integer(),
         evt = {evt_rpc} :: tuple(),
         total_camp :: undefined | #camp_web_ico{},
         menu :: undefined | #camp_web_menu{},
         camp :: undefined | #camp_web{},
         call_form = rpc :: evt | rpc,
         add_can_reward = 0 :: non_neg_integer(),
         rpc_reward_num = 1 :: non_neg_integer(),
         push_cli = 0 :: 0..1,
         push_list = [] :: [tuple()],
         to_id,
         return_acc = 0}).

-file("src/mod/campaign/camp_web_mgr.erl", 38).

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

-file("src/mod/campaign/camp_web_mgr.erl", 39).

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

-file("src/mod/campaign/camp_web_mgr.erl", 40).

-file("inc/campaign.hrl", 1).

-record(campaign_eggs,
        {ver = 0,
         location = 0 :: non_neg_integer(),
         footprints = [],
         last_moved = 0 :: non_neg_integer(),
         rolled = 0 :: non_neg_integer(),
         rewarded = []}).

-record(camp_login,
        {camp_id = 0,
         m_time = 0,
         num = 0,
         days = [],
         buys = []}).

-record(camp_login_data,
        {day = 0, reward = [], buys = [], cost = []}).

-record(camp_login_buy_data,
        {id = 0, reward = [], cost = [], cd = 0}).

-record(campaign_bags,
        {ver = 0,
         collected = [],
         last_filled = 0 :: non_neg_integer(),
         rewarded = 0}).

-record(campaign_card,
        {ver = 0,
         card_ver = 0,
         init = 0,
         times = 0,
         card_list = []}).

-record(campaign_card_open,
        {ver = 0,
         card_ver = 0,
         times = 0,
         init = 0,
         card_list = []}).

-record(camp_wish_flower,
        {ver = 1,
         floor = 1,
         times = 0,
         all_times = 0,
         camp_id = 0}).

-record(camp_new_flop,
        {ver = 1,
         group = 0,
         times = 0,
         rewarded = [],
         camp_id = 0}).

-record(camp_consume_rebate,
        {ver = 1, limit_item = []}).

-record(camp_new_acc_charge,
        {ver = 1, charge_val = 0, get_reward = []}).

-record(camp_charge_seven_gift,
        {ver = 1, id = 0, buy_time = 0, can_reward = []}).

-record(camp_lucky_tree,
        {id = 0,
         times = 0,
         reward_list = [],
         delay_reward = []}).

-record(camp_long_active,
        {ver = 1,
         id = 0,
         lev = 0,
         token_list = [],
         reward_levs = [],
         week_box = 0,
         last_reset_time = 0}).

-record(m_campaign,
        {ver = 27,
         acc = [] :: list(),
         can_reward = [] :: list(),
         rewarded = [] :: list(),
         eggs = #campaign_eggs{},
         bags = #campaign_bags{},
         first_charge_double = [],
         camp_login = #camp_login{},
         hide_seek,
         login_roll,
         recharge = camp_series_recharge:init(),
         camp_card = #campaign_card{},
         wish_times = 0,
         camp_limit = [],
         camp_card_open = #campaign_card_open{},
         recharge_open = camp_series_recharge_open:init(),
         camp_wish_flower = #camp_wish_flower{},
         camp_doll = camp_doll:init(),
         camp_sign,
         camp_exchange,
         camp_animal_chess,
         camp_new_flop = #camp_new_flop{},
         multiplex_assert = 0,
         camp_consume_rebate = camp_consume_rebate:init(),
         camp_black_white_chess =
             camp_black_white_chess_mgr:init(),
         camp_scratch_card = camp_scratch_card:init(),
         camp_new_acc_charge = camp_new_acc_charge:init(),
         camp_charge_seven_gift = camp_charge_seven_gift:init(),
         camp_lucky_tree = camp_lucky_tree:init(),
         camp_long_active = camp_long_active:init(),
         gift_custom = camp_gift_custom:init()}).

-record(campaign_handle,
        {time = 0 :: non_neg_integer(),
         evt = {evt_rpc} :: tuple(),
         call_from = rpc :: evt | rpc,
         add_can_reward = 0 :: non_neg_integer(),
         camp :: undefined | tuple(),
         camp_info :: undefined | tuple(),
         push_list = [] :: [tuple()],
         push_cli = 0 :: 0..1,
         rpc_reward_num = 1 :: non_neg_integer(),
         return_acc = 0}).

-record(camp_collection,
        {camp_end_time = 0,
         reward_list = [],
         extra_data = [],
         random_index,
         red_dot}).

-record(camp_ico,
        {id = 0 :: non_neg_integer(),
         ico_id = 0 :: non_neg_integer(),
         name = "",
         is_show = 0 :: 0..1,
         start_time = 0 :: non_neg_integer() | tuple(),
         end_time = 0 :: non_neg_integer() | tuple(),
         white_list = [] :: list(),
         black_list = [] :: list(),
         min_open_time = 0 :: non_neg_integer() | tuple(),
         max_open_time = 0 :: non_neg_integer() | tuple()}).

-record(camp_cfg,
        {id = 0 :: non_neg_integer(),
         name = "" :: bitstring(),
         group_id = 0 :: non_neg_integer(),
         start_time = 0 :: non_neg_integer() | tuple(),
         end_time = 0 :: non_neg_integer() | tuple(),
         cli_start_time = 0 :: non_neg_integer() | tuple(),
         cli_end_time = 0 :: non_neg_integer() | tuple(),
         type = 0 :: pos_integer(),
         sec_type = 0 :: non_neg_integer(),
         status = 1 :: 0..1,
         reward_type = 2 :: pos_integer(),
         settlement = 2 :: non_neg_integer(),
         reward_title = "" :: bitstring(),
         reward_content = "" :: bitstring(),
         loss_items = [] :: list(),
         auto_buy = 0,
         reward = [] :: list(),
         camp_cond :: undefined | tuple(),
         reward_max = 1 :: non_neg_integer(),
         white_list = [] :: list(),
         black_list = [] :: list(),
         min_open_time = 0 :: non_neg_integer() | tuple(),
         max_open_time = 0 :: non_neg_integer() | tuple(),
         finish_id = 0 :: non_neg_integer(),
         finish_days = 0 :: non_neg_integer(),
         finish_end_days = 0 :: non_neg_integer(),
         cond_reward = [],
         merge_min = 0,
         merge_max = 0,
         is_keep_time = 0}).

-record(camp_cache,
        {id = 0 :: non_neg_integer(),
         sec_type = 0 :: non_neg_integer(),
         is_srv_open = 0 :: 0..1,
         start_time = 0 :: non_neg_integer(),
         end_time = 0 :: non_neg_integer(),
         cli_start_time = 0 :: non_neg_integer(),
         cli_end_time = 0 :: non_neg_integer()}).

-record(camp_unit,
        {id = {0, 0}, base_id = 0, map_id = 0}).

-record(camp_time,
        {id = 0, start_time = 0, end_time = 0}).

-record(camp_item,
        {item = 0,
         start_time = 0,
         end_time = 0,
         open = 0,
         msg = 0}).

-record(camp_assets_data,
        {type = 0, items = [], max = 0, var_type = day}).

-record(camp_gift_custom,
        {ver = 1,
         camp_id = 0,
         gift = [],
         buy = [],
         extra_reward = 0}).

-file("src/mod/campaign/camp_web_mgr.erl", 41).

-file("inc/sys_ico.hrl", 1).

-record(sys_ico_data,
        {id = 0 :: non_neg_integer(),
         name = "" :: bitstring(),
         type = 1 :: non_neg_integer(),
         prior = 0 :: non_neg_integer(),
         auto_lev = 0 :: non_neg_integer(),
         can_handle = 0 :: 0..1,
         is_plot = 0 :: 0..1,
         only_client = 0 :: 0..1,
         is_show_time = 1 :: 0..1,
         start_time = 0 :: term(),
         end_time = 0 :: term(),
         need_lev = 0 :: non_neg_integer(),
         need_fc = 0 :: non_neg_integer(),
         white_list = [] :: list(),
         black_list = [] :: list()}).

-record(sys_ico,
        {id = 0 :: non_neg_integer(),
         status = 0 :: non_neg_integer(),
         timeout = 0 :: non_neg_integer(),
         num = 0 :: non_neg_integer()}).

-file("src/mod/campaign/camp_web_mgr.erl", 42).

-spec is_camp_time(atom() | pos_integer()) -> true |
                                              false.

is_camp_time({_, Label}) -> is_camp_time(Label);
is_camp_time(Type) when is_integer(Type) ->
    list_type(now, Type) =/= [];
is_camp_time(_Label) -> false.

-spec get_camp_time(atom() |
                    pos_integer()) -> {non_neg_integer(),
                                       non_neg_integer()}.

get_camp_time({_, Label}) -> get_camp_time(Label);
get_camp_time(Type) when is_integer(Type) ->
    case list_type(not_finish, Type) of
        [{_,
          #camp_web_menu{start_time = StartTime,
                         end_time = EndTime}}
         | _] ->
            {StartTime, EndTime};
        _ -> {-1, -1}
    end;
get_camp_time(_) -> {-1, -1}.

get_camp_info(Type) when is_integer(Type) ->
    Now = date:unixtime(),
    case get({get_camp_info, Type}) of
        Data = {_, _, EndTime} when Now < EndTime -> Data;
        _ ->
            case list_type(now, Type) of
                [{_,
                  #camp_web_menu{id = Id, start_time = StartTime,
                                 end_time = EndTime}}
                 | _] ->
                    put({get_camp_info, Type}, {Id, StartTime, EndTime}),
                    {Id, StartTime, EndTime};
                _ -> {0, -1, -1}
            end
    end;
get_camp_info(_) -> {0, -1, -1}.

-spec get_camp_time(atom() | pos_integer(),
                    {non_neg_integer(),
                     non_neg_integer()}) -> {non_neg_integer(),
                                             non_neg_integer()}.

get_camp_time(Type, {ST1, ET1}) ->
    {ST2, ET2} = get_camp_time(Type),
    Now = date:unixtime(),
    if ET1 < Now andalso ET2 < Now -> {ST1, ET1};
       ET1 < Now -> {ST2, ET2};
       ET2 < Now -> {ST1, ET1};
       ST1 < ST2 -> {ST1, ET1};
       true -> {ST2, ET2}
    end.

-spec get_camp_ratio(atom() |
                     pos_integer()) -> non_neg_integer().

get_camp_ratio(quest_offer) -> get_camp_ratio(30007);
get_camp_ratio(wedding) -> get_camp_ratio(30008);
get_camp_ratio(Type) when is_integer(Type) ->
    case list_type(now, Type) of
        [{_,
          #camp_web_menu{camp_list =
                             [#camp_web{val1 = Val1} | _]}}
         | _]
            when is_integer(Val1) andalso Val1 > 0 ->
            Val1;
        _ -> 0
    end;
get_camp_ratio(_) -> 0.

get_luck_list() -> [].

-spec list_all() -> [#camp_web_ico{}].

list_all() ->
    case catch ets:tab2list(camp_web_list) of
        L when is_list(L) -> L;
        _ -> []
    end.

-spec list_all(non_neg_integer()) -> [#camp_web_ico{}].

list_all(Now) ->
    L = list_all(),
    list_all(Now, L).

list_all(Now, L) ->
    NewL = [TotalCamp#camp_web_ico{menu_list =
                                       [Camp
                                        || Camp = #camp_web_menu{start_time =
                                                                     STime,
                                                                 end_time =
                                                                     ETime}
                                               <- CampList,
                                           Now >= STime,
                                           Now < ETime orelse ETime =:= 0]}
            || TotalCamp = #camp_web_ico{menu_list = CampList,
                                         start_time = StartTime,
                                         end_time = EndTime}
                   <- L,
               StartTime =< Now, Now < EndTime orelse EndTime =:= 0],
    [TotalCamp1
     || TotalCamp1 = #camp_web_ico{menu_list = CampList1}
            <- NewL,
        CampList1 =/= []].

-spec list_flat() -> [{Key :: tuple(),
                       #camp_web_ico{},
                       #camp_web_menu{},
                       #camp_web{}}].

list_flat() ->
    L = list_all(),
    NewL = [[[{Key,
               Total#camp_web_ico{menu_list = []},
               Menu#camp_web_menu{camp_list = []},
               Camp}
              || Camp = #camp_web{key = Key} <- CampList]
             || Menu = #camp_web_menu{camp_list = CampList}
                    <- MenuList]
            || Total = #camp_web_ico{menu_list = MenuList} <- L],
    lists:flatten(NewL).

-spec list_all_not_finish() -> [#camp_web_ico{}].

list_all_not_finish() ->
    Now = date:unixtime(),
    L = list_all(),
    [Camp#camp_web_ico{menu_list =
                           [Menu
                            || Menu = #camp_web_menu{end_time = ETime}
                                   <- MenuList,
                               Now < ETime orelse ETime =:= 0]}
     || Camp = #camp_web_ico{menu_list = MenuList,
                             end_time = EndTime}
            <- L,
        Now < EndTime orelse EndTime =:= 0].

-spec lookup(non_neg_integer()) -> false |
                                   #camp_web_ico{}.

lookup(Id) ->
    case catch ets:lookup(camp_web_list, Id) of
        [] -> false;
        [H] when is_record(H, camp_web_ico) -> H;
        _Err ->
            logger:error("ETS活动数据异常，[Data:~w]",
                         [_Err],
                         camp_web_mgr,
                         154),
            false
    end.

-spec lookup(non_neg_integer(),
             non_neg_integer()) -> false |
                                   {ok, #camp_web_ico{}, #camp_web_menu{}}.

lookup(TotalID, CampId) ->
    case lookup(TotalID) of
        false -> false;
        TotalCamp = #camp_web_ico{menu_list = CampList} ->
            case lists:keyfind(CampId, #camp_web_menu.id, CampList)
                of
                false -> false;
                Camp -> {ok, TotalCamp, Camp}
            end
    end.

-spec lookup(non_neg_integer(), non_neg_integer(),
             non_neg_integer()) -> false |
                                   {ok,
                                    #camp_web_ico{},
                                    #camp_web_menu{},
                                    #camp_web{}}.

lookup(TotalID, CampId, N) ->
    case lookup(TotalID, CampId) of
        false -> false;
        {ok,
         TotalCamp,
         Camp = #camp_web_menu{camp_list = Conds}} ->
            case lists:keyfind(N, #camp_web.n, Conds) of
                false -> false;
                Cond -> {ok, TotalCamp, Camp, Cond}
            end
    end.

-spec lookup_open(non_neg_integer()) -> false |
                                        #camp_web_ico{}.

lookup_open(TotalID) ->
    Now = date:unixtime(),
    case lookup(TotalID) of
        TotalCamp = #camp_web_ico{start_time = StartTime,
                                  end_time = EndTime, menu_list = CampList}
            when StartTime =< Now andalso
                     (Now < EndTime orelse EndTime =:= 0) ->
            NewCampList = [Camp
                           || Camp = #camp_web_menu{start_time = StartT,
                                                    end_time = EndT}
                                  <- CampList,
                              StartT =< Now, Now < EndT orelse EndT =:= 0],
            TotalCamp#camp_web_ico{menu_list = NewCampList};
        _ -> false
    end.

-spec list_type(pos_integer() |
                atom() |
                [pos_integer()]) -> [{#camp_web_ico{},
                                      #camp_web_menu{}}].

list_type(TypeList) -> list_type(not_finish, TypeList).

list_type(not_finish, TypeList) ->
    L = list_all_not_finish(),
    list_type(TypeList, L);
list_type(all, TypeList) ->
    L = list_all(),
    list_type(TypeList, L);
list_type(now, TypeList) ->
    Now = date:unixtime(),
    L = list_all(Now),
    list_type(TypeList, L);
list_type(TypeList, L) -> do_list_type(TypeList, L, []).

do_list_type(_TypeList, [], L) -> camp_qsort(L);
do_list_type(Type, TotalCampL, L)
    when is_integer(Type) ->
    do_list_type([Type], TotalCampL, L);
do_list_type(TypeList,
             [TotalCamp = #camp_web_ico{menu_list = CampList} | T],
             L) ->
    NewL = do_list_type(TypeList, TotalCamp, CampList, L),
    do_list_type(TypeList, T, NewL).

do_list_type(_TypeList, _TotalCamp, [], L) -> L;
do_list_type(TypeList, TotalCamp,
             [Camp = #camp_web_menu{sec_type = Type} | T], L) ->
    case lists:member(Type, TypeList) of
        true ->
            do_list_type(TypeList,
                         TotalCamp,
                         T,
                         [{TotalCamp#camp_web_ico{menu_list = []}, Camp} | L]);
        false -> do_list_type(TypeList, TotalCamp, T, L)
    end.

camp_qsort([]) -> [];
camp_qsort([I]) -> [I];
camp_qsort([I = {_, #camp_web_menu{start_time = StartT}}
            | T]) ->
    camp_qsort([I1
                || I1 = {_, #camp_web_menu{start_time = StartT1}} <- T,
                   StartT1 =< StartT])
        ++
        [I] ++
            camp_qsort([I2
                        || I2 = {_, #camp_web_menu{start_time = StartT2}} <- T,
                           StartT2 > StartT]).

reload() ->
    info(reload),
    ok.

info(Info) -> camp_web_mgr ! Info.

cast(Info) -> gen_server:cast(camp_web_mgr, Info).

call(Info) ->
    case catch gen_server:call(camp_web_mgr, Info, 10000) of
        {'EXIT', {timeout, _}} -> {error, timeout};
        {'EXIT', {noproc, _}} -> {error, noproc};
        {'EXIT', {normal, _}} -> {error, exit};
        {'EXIT', _Call_Err} -> {error, _Call_Err};
        _Call_Return -> _Call_Return
    end.

start_link() ->
    gen_server:start_link({local, camp_web_mgr},
                          camp_web_mgr,
                          [],
                          []).

init([]) ->
    logger:info("[~w] 正在启动...",
                [camp_web_mgr],
                camp_web_mgr,
                255),
    ets:new(camp_web_list,
            [set,
             named_table,
             protected,
             {keypos, #camp_web_ico.id}]),
    do_reload(),
    State = #state{},
    logger:info("[~w] 启动完成",
                [camp_web_mgr],
                camp_web_mgr,
                259),
    {ok, State}.

handle_call(_Request, _From, State) -> {noreply, State}.

handle_cast(_Msg, State) -> {noreply, State}.

handle_info(reload, State) ->
    logger:info("开始重载活动数据", [], camp_web_mgr, 271),
    OldL = list_all_not_finish(),
    NewL = do_reload(),
    update_camp([10001,
                 10002,
                 10004,
                 20001,
                 30001,
                 30002,
                 30003,
                 30004,
                 30005,
                 30006,
                 40001,
                 40002,
                 40003,
                 50001,
                 50002,
                 50003,
                 60004,
                 60005,
                 60006,
                 60007,
                 5],
                OldL,
                NewL),
    camp_web_rank_mgr:reload(),
    camp_web:push(),
    role_group:apply(world, {camp_web_mgr, cancel_dic, []}),
    logger:info("重载活动数据成功...[原:~p,新:~p]",
                [length(OldL), length(NewL)],
                camp_web_mgr,
                278),
    {noreply, State};
handle_info({reg, Mod, TotalId, CampId}, State) ->
    case lookup(TotalId, CampId) of
        {ok, TotalCamp, Camp} ->
            reg_time_to_reward(Mod,
                               date:unixtime(),
                               TotalCamp,
                               Camp);
        _ -> skip
    end,
    {noreply, State};
handle_info({reward, Mod, TotalId, MenuId}, State) ->
    case lookup(TotalId, MenuId) of
        {ok, TotalCamp, Menu} ->
            reward(Mod, TotalCamp, Menu),
            reg_time_to_reward(Mod,
                               date:unixtime(),
                               TotalCamp,
                               Menu);
        _ ->
            logger:error("发放奖励时出错：mod:~w TotalID:~w MenuId:~w",
                         [Mod, TotalId, MenuId],
                         camp_web_mgr,
                         297),
            skip
    end,
    {noreply, State};
handle_info({end_reward, MenuId}, State) ->
    role_group:apply(world,
                     {camp_web_mgr, send_end_reward, [MenuId]}),
    {noreply, State};
handle_info({reg_refresh_cli, TotalID}, State) ->
    reg_time_refresh_cli(lookup(TotalID), date:unixtime()),
    {noreply, State};
handle_info({reg_refresh_menu_cli, TotalID, MenuId},
            State) ->
    case lookup(TotalID, MenuId) of
        {ok, Total, Menu} ->
            reg_time_refresh_menu_cli(Total, Menu, date:unixtime());
        _ -> skip
    end,
    {noreply, State};
handle_info({end_reward_again, TotalID, MenuId},
            State) ->
    case lookup(TotalID, MenuId) of
        {ok,
         #camp_web_ico{id = CampId, end_time = ET},
         #camp_web_menu{id = MenuId}} ->
            Now = date:unixtime(),
            reset_timer({end_reward, MenuId},
                        ET - Now,
                        {end_reward, MenuId},
                        {end_reward_again, CampId, MenuId});
        _ -> ignore
    end,
    {noreply, State};
handle_info({ico_start, TotalID}, State) ->
    Now = date:unixtime(),
    case lookup(TotalID) of
        Total = #camp_web_ico{start_time = StartT, name = Name}
            when StartT >= Now ->
            logger:info("总活动[~w:~ts]开始，通知客户端显示图标",
                        [TotalID, Name],
                        camp_web_mgr,
                        336),
            update_camp([], [], [Total]),
            camp_web:push(all, TotalID),
            reg_time_refresh_cli(Total, Now);
        _ -> skip
    end,
    {noreply, State};
handle_info({ico_end, TotalID}, State) ->
    Now = date:unixtime(),
    case lookup(TotalID) of
        #camp_web_ico{end_time = EndT, name = Name}
            when EndT >= Now ->
            logger:info("总活动[~w:~ts]结束，通知客户端移除图标",
                        [TotalID, Name],
                        camp_web_mgr,
                        349),
            role_group:pack_send(world, 14751, {TotalID}),
            reset_timer({del_ico, TotalID},
                        86400,
                        {del_id, TotalID},
                        undefined);
        _ -> skip
    end,
    {noreply, State};
handle_info({menu_start, TotalID, MenuId}, State) ->
    Now = date:unixtime(),
    case lookup(TotalID, MenuId) of
        {ok,
         Total = #camp_web_ico{},
         Menu = #camp_web_menu{start_time = StartT,
                               title = Name}}
            when StartT >= Now ->
            camp_menu_update(Total, Menu, menu_start, Now),
            logger:info("活动[~w:~ts]开始",
                        [TotalID, Name],
                        camp_web_mgr,
                        362);
        _ -> skip
    end,
    {noreply, State};
handle_info({menu_end, TotalID, MenuId}, State) ->
    Now = date:unixtime(),
    case lookup(TotalID, MenuId) of
        {ok,
         Total = #camp_web_ico{},
         Menu = #camp_web_menu{end_time = EndT, title = Name}}
            when EndT >= Now ->
            camp_menu_update(Total, Menu, menu_end, Now),
            logger:info("活动[~w:~ts]结束",
                        [TotalID, Name],
                        camp_web_mgr,
                        373);
        _ -> skip
    end,
    {noreply, State};
handle_info({del_id, Id}, State) ->
    logger:info("删除总活动[~w]", [Id], camp_web_mgr, 380),
    ets:delete(camp_web_list, Id),
    {noreply, State};
handle_info(_Info, State) -> {noreply, State}.

terminate(_Reason, _State) -> ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

update_camp([], _OldL, _NewL) -> ok;
update_camp([Type | T], OldL, NewL) ->
    L1 = list_type(Type, OldL),
    L2 = list_type(Type, NewL),
    do_update_camp(Type, L1, L2),
    update_camp(T, OldL, NewL).

do_update_camp(_Type, L, L) -> ok;
do_update_camp(60004, _L1, _L2) ->
    camp_guild_bady:reload();
do_update_camp(60005, _L1, _L2) -> camp_fruit:reload();
do_update_camp(60007, _L1, _L2) ->
    camp_hide_seek:reload();
do_update_camp(_Type, _, _) -> ok.

camp_menu_update(_Total, _Menu, _Label, _Now) -> ok.

set_timer(Role = #role{m_camp_web =
                           #m_camp_web{time_list = TimeList = [_ | _]}}) ->
    Now = date:unixtime(),
    Fun = fun ({_MenuId, _TotalId, StartT, _EndT})
                  when StartT > Now ->
                  StartT - Now;
              ({_MenuId, _TotalId, _StartT, EndT}) when EndT > Now ->
                  EndT - Now;
              (_) -> 864000
          end,
    NextT = lists:min([Fun(I) || I <- TimeList]),
    Timer = #timer{id = camp_web_check_timer,
                   timeout = NextT * 1000, m = camp_web_mgr,
                   f = check_timer, a = [], times = 1},
    role_timer:set(Timer, Role);
set_timer(Role) -> Role.

check_timer(Role = #role{m_camp_web =
                             #m_camp_web{time_list = TimeList}}) ->
    Now = date:unixtime(),
    {ok, NRole} = set_pay_single_limit_end_time(Role),
    Fun = fun ({_MenuId, TotalID, _StartT, EndT})
                  when EndT > 0 andalso
                           Now >= EndT andalso Now - EndT =< 2 ->
                  sys_conn:pack_send(14751, {TotalID});
              ({_MenuId, TotalID, StartT, EndT})
                  when Now >= StartT andalso
                           EndT > Now andalso Now - StartT =< 2 ->
                  camp_web:push(NRole, TotalID);
              (_) -> ok
          end,
    [Fun(I) || I <- TimeList],
    {ok, NRole}.

set_pay_single_limit_end_time(Role = #role{m_camp_web =
                                               #m_camp_web{time_list =
                                                               TimeL}}) ->
    Now = date:unixtime(),
    do_set_pay_single_limit_end_time(TimeL, Now, Role, []).

do_set_pay_single_limit_end_time([], _Now,
                                 Role = #role{m_camp_web = MCampWeb}, L) ->
    Role1 = Role#role{m_camp_web =
                          MCampWeb#m_camp_web{time_list = L}},
    NRole = set_timer(Role1),
    {ok, NRole};
do_set_pay_single_limit_end_time([I | T], Now, Role,
                                 L) ->
    do_set_pay_single_limit_end_time(T, Now, Role, [I | L]).

set_pay_single_limit_start_time(Role) -> {ok, Role}.

reward(rank, TotalCamp,
       Camp = #camp_web_menu{camp_list = List, type = 5,
                             sec_type = SecType}) ->
    reward_rank(rank:list(SecType),
                lists:keysort(#camp_web.val1, List),
                TotalCamp,
                Camp,
                1);
reward(_Mod, _TotalCamp, _Camp) -> ok.

reward_rank([#camp_web{val1 = Min, val2 = Max, n = N,
                       items = Items}
             | List],
            [_Rc | RankList], TotalCamp,
            Camp = #camp_web_menu{id = MenuId, mail_title = Title,
                                  mail_content = Content},
            Idx)
    when Idx >= Min andalso Idx =< Max ->
    case date:unixtime() of
        {guild, _Gid, _GName, RoleId, RName} ->
            logger:info("给角色[~w:~ts]名次~w发放排行活动[MenuId:~w, n:~w]奖励：~ts",
                        [RoleId, RName, Idx, MenuId, N, Title],
                        camp_web_mgr,
                        471),
            mail:send(RoleId,
                      notice:replace_msg([{"#rank#", [{string, Idx}]}],
                                         Title),
                      notice:replace_msg([{"#rank#", [{string, Idx}]}],
                                         Content),
                      Items);
        {ok, RoleId, RName} ->
            logger:info("给角色[~w:~ts]名称~w发放排行活动[MenuId:~w, n:~w]奖励：~ts",
                        [RoleId, RName, Idx, MenuId, N, Title],
                        camp_web_mgr,
                        474),
            mail:send(RoleId,
                      notice:replace_msg([{"#rank#", [{string, Idx}]}],
                                         Title),
                      notice:replace_msg([{"#rank#", [{string, Idx}]}],
                                         Content),
                      Items);
        _ -> skip
    end,
    reward_rank(List, RankList, TotalCamp, Camp, Idx + 1);
reward_rank(List, [_ | RankList], TotalCamp, Camp,
            Idx) ->
    reward_rank(List, RankList, TotalCamp, Camp, Idx);
reward_rank(_List, _RankList, _TotalCamp, _Camp,
            _Idx) ->
    ok.

reg_time_to_reward(_Mod, _Now, []) -> ok;
reg_time_to_reward(Mod, Now,
                   [TotalCamp = #camp_web_ico{menu_list = CampList}
                    | T]) ->
    reg_time_to_reward(Mod, Now, TotalCamp, CampList),
    reg_time_to_reward(Mod, Now, T).

reg_time_to_reward(_Mod, _Now, _TotalCamp, []) -> ok;
reg_time_to_reward(Mod, Now, TotalCamp, [Camp | T]) ->
    reg_time_to_reward(Mod, Now, TotalCamp, Camp),
    reg_time_to_reward(Mod, Now, TotalCamp, T);
reg_time_to_reward(Mod = rank, Now,
                   #camp_web_ico{id = TotalID},
                   #camp_web_menu{id = CampId, start_time = StartTime,
                                  end_time = EndTime, settlement = Settle,
                                  type = 5, sec_type = SecType, title = Title})
    when EndTime > Now + 1 ->
    RewardTime = case Settle of
                     1 -> Now + date:next_diff(86399);
                     3 -> Now + date:next_diff(86399);
                     _ -> EndTime
                 end,
    case RewardTime > Now andalso RewardTime =< EndTime of
        true when RewardTime < StartTime ->
            T = StartTime - Now,
            logger:info("排行榜[~w]奖励活动[~ts]未开始，将在~p秒活动开启后开始注册奖励发放时间",
                        [SecType, Title, T],
                        camp_web_mgr,
                        511),
            reset_timer({reg, Mod, TotalID, CampId},
                        T,
                        {reg, Mod, TotalID, CampId},
                        {reg, Mod, TotalID, CampId});
        true ->
            T = RewardTime - Now,
            logger:info("排行榜[~w]奖励活动[~ts]注册发放时间[~p]",
                        [SecType, Title, T],
                        camp_web_mgr,
                        515),
            reset_timer({reward, Mod, TotalID, CampId},
                        T,
                        {reward, Mod, TotalID, CampId},
                        {reg, Mod, TotalID, CampId});
        _ -> ok
    end;
reg_time_to_reward(_Mod, _Now, _TotalCamp, _Camp) -> ok.

reg_time_refresh_cli([], _Now) -> ok;
reg_time_refresh_cli([I = #camp_web_ico{menu_list =
                                            MenuList}
                      | T],
                     Now) ->
    reg_time_refresh_menu_cli(MenuList, I, Now),
    reg_time_refresh_cli(I, Now),
    reg_time_refresh_cli(T, Now);
reg_time_refresh_cli(#camp_web_ico{id = Id,
                                   start_time = StartT, name = Name},
                     Now)
    when StartT > Now ->
    T = StartT - Now,
    logger:info("~w秒后通知客户端开启活动[~w:~ts]",
                [T, Id, Name],
                camp_web_mgr,
                531),
    reset_timer({reg_refresh_cli, Id},
                T,
                {ico_start, Id},
                {reg_refresh_cli, Id});
reg_time_refresh_cli(#camp_web_ico{id = Id,
                                   end_time = EndT, name = Name},
                     Now)
    when EndT > Now ->
    T = EndT - Now,
    logger:info("~w秒后通知客户端关闭活动[~w:~ts]",
                [T, Id, Name],
                camp_web_mgr,
                535),
    reset_timer({reg_refresh_cli, Id},
                T,
                {ico_end, Id},
                {reg_refresh_cli, Id});
reg_time_refresh_cli(_Ico, _Now) -> ok.

reg_time_refresh_menu_cli([I | T], Ico, Now) ->
    reg_time_refresh_menu_cli(I, Ico, Now),
    reg_time_refresh_menu_cli(T, Ico, Now);
reg_time_refresh_menu_cli(#camp_web_menu{id = Id,
                                         start_time = StartT, title = Name},
                          #camp_web_ico{id = TotalId}, Now)
    when StartT > Now ->
    T = StartT - Now,
    logger:info("~w秒后开启活动[~w:~ts]",
                [T, Id, Name],
                camp_web_mgr,
                544),
    reset_timer({reg_refresh_menu_cli, Id},
                T,
                {menu_start, TotalId, Id},
                {reg_refresh_menu_cli, TotalId, Id});
reg_time_refresh_menu_cli(#camp_web_menu{id = Id,
                                         end_time = EndT, title = Name},
                          #camp_web_ico{id = TotalId}, Now)
    when EndT > Now ->
    T = EndT - Now,
    logger:info("~w秒后关闭活动[~w:~ts]",
                [T, Id, Name],
                camp_web_mgr,
                548),
    reset_timer({reg_refresh_menu_cli, Id},
                T,
                {menu_end, TotalId, Id},
                {reg_refresh_menu_cli, TotalId, Id});
reg_time_refresh_menu_cli(_Menu, _Ico, _Now) -> ok.

reset_timer(_TriKey, T, _Info, ReloadInfo)
    when T >= 864000 ->
    erlang:send_after(86400000, self(), ReloadInfo);
reset_timer(TriKey, T, Info, _ReloadInfo) ->
    del_timer(TriKey),
    Ref = erlang:send_after(T * 1000, self(), Info),
    put({timer, TriKey}, Ref).

del_timer(TriKey) ->
    case get({timer, TriKey}) of
        undefined -> skip;
        Ref -> catch erlang:cancel_timer(Ref)
    end.

do_reload() ->
    [del_timer(TriKey) || {{timer, TriKey}, _} <- get()],
    L = load_all(),
    ets:delete_all_objects(camp_web_list),
    ets:insert(camp_web_list, L),
    Now = date:unixtime(),
    reg_time_to_reward(rank, Now, L),
    reg_time_refresh_cli(L, Now),
    end_reward(L),
    L.

end_reward([]) -> ok;
end_reward([#camp_web_ico{id = CampId,
                          menu_list = CampList, end_time = ET}
            | L]) ->
    case is_end_reward(CampList) of
        false -> ok;
        MenuId ->
            Now = date:unixtime(),
            reset_timer({end_reward, MenuId},
                        ET - Now,
                        {end_reward, MenuId},
                        {end_reward_again, CampId, MenuId})
    end,
    end_reward(L);
end_reward([_ | L]) -> end_reward(L).

is_end_reward([]) -> false;
is_end_reward([#camp_web_menu{id = Id, reward_mod = 4}
               | _L]) ->
    Id;
is_end_reward([_ | L]) -> is_end_reward(L).

cancel_dic(_Role) ->
    List = [20011, 50011, 70016, 70017],
    [put({get_camp_info, Type}, undefined) || Type <- List],
    ok.

send_end_reward(Role = #role{id = RoleId,
                             m_camp_web =
                                 Camp = #m_camp_web{end_reward = Rewards}},
                MenuId) ->
    NewRewards = case lists:keyfind(MenuId, 2, Rewards) of
                     false -> Rewards;
                     {_, MenuId, _, Title, Content, Items} ->
                         mail:send(RoleId, Title, Content, Items),
                         lists:keydelete(MenuId, 2, Rewards);
                     _ -> lists:keydelete(MenuId, 2, Rewards)
                 end,
    {ok,
     Role#role{m_camp_web =
                   Camp#m_camp_web{end_reward = NewRewards}}}.

load_all() ->
    Sql = "select total_id, name, title, ico, alert, "
          "gif, start_time, end_time, open_day, "
          "merge_day, login_open, is_show_time "
          "from camp_web_ico where status = 2 and "
          "(end_time = 0 or end_time > ?)",
    Now = date:unixtime(),
    case db:get_all(Sql, [Now]) of
        {ok, Data} ->
            logger:debug("==========~w", [Data], camp_web_mgr, 627),
            do_format(camp_web_ico, Data, []);
        _ ->
            logger:error("加载总活动数据失败", [], camp_web_mgr, 630),
            []
    end.

load_camp_menu(TotalId) ->
    Now = date:unixtime(),
    Sql = "select camp_id, title, title2, ico, "
          "type_ico, start_time, end_time, sort_val, "
          "type, sec_type, settlement, reward_mod, "
          "reward_num, mail_title, mail_content, "
          "top_banner, rule_str, time_str, bottom_alert, "
          "reward_title, panel_type, reward, cli_reward, "
          "button_text, is_button, title_ico, total_ico, "
          "notice_msg, tran_info from camp_web "
          "where (end_time > ? or end_time = 0) "
          "and total_id = ?",
    case db:get_all(Sql, [Now, TotalId]) of
        {ok, Data} -> do_format(camp_web_menu, Data, []);
        _Err ->
            logger:error("加载总活动[~p]的具体活动数据失败:~w",
                         [TotalId, _Err],
                         camp_web_mgr,
                         642),
            []
    end.

do_format(_Mod, [], L) -> L;
do_format(Mod = camp_web_ico,
          [[Id,
            Name,
            Title,
            Ico,
            Alert,
            Gif,
            StartTime,
            EndTime,
            OpenDay,
            MergeDay,
            LoginOpen,
            IsShowTime]
           | T],
          L) ->
    CanOpenTime1 = case env:get(srv_open_time) of
                       T1 when is_integer(T1) andalso OpenDay > 0 ->
                           date:unixtime({zero, T1}) + OpenDay * 86400;
                       _ -> 0
                   end,
    CanOpenTime2 = case env:get(merge_time) of
                       T2 when is_integer(T2) andalso MergeDay > 0 ->
                           date:unixtime({zero, T2}) + MergeDay * 86400;
                       _ -> 0
                   end,
    case CanOpenTime1 >= EndTime orelse
             CanOpenTime2 >= EndTime
        of
        true ->
            logger:info("总活动[~p:~ts]不符合开启条件:开(合)服时间限制 CanOpenTime:~p(~"
                        "p) > EndTime:~p",
                        [Id, Name, CanOpenTime1, CanOpenTime2, EndTime],
                        camp_web_mgr,
                        661),
            do_format(Mod, T, L);
        false ->
            NewStartTime0 = case CanOpenTime1 > StartTime of
                                true -> CanOpenTime1;
                                false -> StartTime
                            end,
            NewStartTime = case CanOpenTime2 > NewStartTime0 of
                               true -> CanOpenTime2;
                               _ -> NewStartTime0
                           end,
            case load_camp_menu(Id) of
                [] ->
                    logger:info("总活动[~p:~ts]没有配置活动菜单",
                                [Id, Name],
                                camp_web_mgr,
                                674),
                    do_format(Mod, T, L);
                CampL ->
                    logger:info("加载总活动[~p:~ts] 活动菜单数量[~p]",
                                [Id, Name, length(CampL)],
                                camp_web_mgr,
                                677),
                    SortCampL0 = lists:keysort(#camp_web_menu.id, CampL),
                    SortCampL = lists:keysort(#camp_web_menu.sort_val,
                                              SortCampL0),
                    A = #camp_web_ico{id = Id, name = Name, title = Title,
                                      ico = Ico, alert = Alert, gif = Gif,
                                      start_time = NewStartTime,
                                      end_time = EndTime, menu_list = SortCampL,
                                      login_open = LoginOpen,
                                      is_show_time = IsShowTime},
                    do_format(Mod, T, [A | L])
            end
    end;
do_format(Mod = camp_web_menu,
          [[Menu_id,
            Title,
            Title2,
            Ico,
            Type_ico,
            Start_time,
            End_time,
            Sort_val,
            Type,
            Sec_type,
            Settlement,
            Reward_mod,
            Reward_num,
            Mail_title,
            Mail_content,
            Top_banner,
            Rule_str,
            Time_str,
            Bottom_alert,
            Reward_title,
            Panel_type,
            Reward,
            Cli_reward,
            ButtonText,
            IsButton,
            TitleIco,
            TotalIco,
            NoticeMsg,
            TranInfo]
           | T],
          L) ->
    A = #camp_web_menu{id = Menu_id, title = Title,
                       title2 = Title2, ico = Ico, type_ico = Type_ico,
                       start_time = Start_time, end_time = End_time,
                       sort_val = Sort_val, type = Type, sec_type = Sec_type,
                       settlement = Settlement, reward_mod = Reward_mod,
                       mail_title = Mail_title, mail_content = Mail_content,
                       top_banner = Top_banner, rule_str = Rule_str,
                       time_str = Time_str, bottom_alert = Bottom_alert,
                       reward_title = Reward_title, panel_type = Panel_type,
                       cli_reward = Cli_reward, button_text = ButtonText,
                       is_button = IsButton, title_ico = TitleIco,
                       total_ico = TotalIco, notice_msg = NoticeMsg,
                       tran_info = TranInfo},
    case catch load_camp(A,
                         Reward_num,
                         Reward,
                         util:string_to_term2(lists:concat(["[", Reward, "]"])))
        of
        Conds when is_list(Conds) ->
            NewA = A#camp_web_menu{camp_list = Conds},
            logger:info("加载活动[~w]菜单:~ts 规则数量:~w",
                        [Menu_id, Title, length(Conds)],
                        camp_web_mgr,
                        700),
            do_format(Mod, T, [NewA | L]);
        _R ->
            logger:info("活动菜单[~p:~ts, ~w]读取配置条件出错",
                        [Menu_id, Title, _R],
                        camp_web_mgr,
                        703),
            do_format(Mod, T, L)
    end.

load_camp(_Menu, _RewardNum, _Reward,
          {ok, undefined}) ->
    [];
load_camp(Menu, RewardNum, _Reward, {ok, L})
    when is_list(L) ->
    do_load_camp(L, Menu, RewardNum, 1, []);
load_camp(#camp_web_menu{id = Menu_id}, _RewardNum,
          Reward, _Err) ->
    logger:error("活动[~w]解析规则[~ts]失败: ~w",
                 [Menu_id, Reward, _Err],
                 camp_web_mgr,
                 712),
    ok.

do_load_camp([], _Menue, _RewardNum, _N, L) ->
    lists:reverse(L);
do_load_camp([I | T],
             Menu = #camp_web_menu{id = MenuId, type = Type,
                                   sec_type = SecType, settlement = Settle},
             RewardNum, N, L) ->
    Camp = #camp_web{id = N, key = {MenuId, N}, n = N,
                     reward_num = RewardNum, type = Type, sec_type = SecType,
                     settlement = Settle,
                     cond_msg = util:term_to_bitstring(I)},
    case do_load_camp_item(Menu, Camp, I) of
        {ok, D} ->
            do_load_camp(T, Menu, RewardNum, N + 1, [D | L]);
        _ -> do_load_camp(T, Menu, RewardNum, N + 1, L)
    end.

do_load_camp_item(#camp_web_menu{sec_type = 10001,
                                 id = MenuId},
                  Camp, {Min, Max, Items, Msg})
    when is_integer(Min) andalso
             is_integer(Max) andalso is_list(Items) ->
    {ok,
     Camp#camp_web{id = Min, key = {MenuId, Min},
                   items = Items, tar_val = Min, val2 = Max,
                   str1 = util:to_list(Msg)}};
do_load_camp_item(#camp_web_menu{sec_type = 10001,
                                 id = MenuId},
                  Camp, {RewardNum, Min, Max, Items, Msg})
    when is_integer(RewardNum) andalso
             is_integer(Min) andalso
                 is_integer(Max) andalso is_list(Items) ->
    {ok,
     Camp#camp_web{id = Min, key = {MenuId, Min},
                   items = Items, tar_val = Min, val2 = Max,
                   reward_num = RewardNum, str1 = util:to_list(Msg)}};
do_load_camp_item(#camp_web_menu{sec_type = 10002,
                                 id = MenuId},
                  Camp, {Val, Items, Msg})
    when is_integer(Val) andalso is_list(Items) ->
    {ok,
     Camp#camp_web{id = Val, key = {MenuId, Val},
                   items = Items, tar_val = Val,
                   str1 = util:to_list(Msg)}};
do_load_camp_item(#camp_web_menu{sec_type = 10004,
                                 id = MenuId},
                  Camp, {Min, Items, Msg})
    when is_integer(Min) andalso is_list(Items) ->
    {ok,
     Camp#camp_web{id = Min, key = {MenuId, Min},
                   items = Items, tar_val = Min,
                   str1 = util:to_list(Msg)}};
do_load_camp_item(#camp_web_menu{sec_type = 10007},
                  Camp, {Radio, Num, Msg})
    when is_integer(Radio) andalso is_integer(Num) ->
    {ok,
     Camp#camp_web{items = [], val1 = Radio,
                   reward_num = Num, tar_val = 1,
                   str1 = util:to_list(Msg)}};
do_load_camp_item(#camp_web_menu{sec_type = 20001,
                                 id = MenuId},
                  Camp, {Val, Items, Msg})
    when is_integer(Val) andalso is_list(Items) ->
    {ok,
     Camp#camp_web{id = Val, key = {MenuId, Val},
                   items = Items, tar_val = Val,
                   str1 = util:to_list(Msg)}};
do_load_camp_item(#camp_web_menu{sec_type = 10006},
                  Camp, {Acc, TotalMax, Max, ItemList, Msg})
    when is_integer(Acc) andalso
             is_integer(TotalMax) andalso
                 is_integer(Max) andalso is_list(ItemList) ->
    {ok,
     Camp#camp_web{reward_num = Max,
                   str1 = util:to_list(Msg), val1 = Acc, val2 = TotalMax,
                   items = ItemList}};
do_load_camp_item(#camp_web_menu{sec_type = 30001,
                                 id = MenuId},
                  Camp, {Min, Max, Items, Msg})
    when is_integer(Min) andalso
             is_integer(Max) andalso is_list(Items) ->
    {ok,
     Camp#camp_web{id = Min, key = {MenuId, Min},
                   items = Items, tar_val = Min, val2 = Max,
                   str1 = util:to_list(Msg)}};
do_load_camp_item(#camp_web_menu{sec_type = 30002,
                                 id = MenuId},
                  Camp, {Val, Items, Msg})
    when is_integer(Val) andalso is_list(Items) ->
    {ok,
     Camp#camp_web{id = Val, key = {MenuId, Val},
                   items = Items, tar_val = Val,
                   str1 = util:to_list(Msg)}};
do_load_camp_item(#camp_web_menu{sec_type =
                                     SecType = 30003},
                  Camp, {Lev, Num, TypeList, Items, Msg})
    when is_integer(Lev) andalso
             is_integer(Num) andalso
                 is_list(TypeList) andalso is_list(Items) ->
    Extra = camp_memu_extra(SecType, TypeList, []),
    {ok,
     Camp#camp_web{items = Items, val1 = Lev, val2 = Num,
                   extra = Extra, str1 = util:to_list(Msg)}};
do_load_camp_item(#camp_web_menu{sec_type = 30004},
                  Camp, {PetType, Num, Items, Msg})
    when is_integer(PetType) andalso
             is_integer(Num) andalso is_list(Items) ->
    {ok,
     Camp#camp_web{items = Items, val1 = PetType, val2 = Num,
                   str1 = util:to_list(Msg)}};
do_load_camp_item(#camp_web_menu{sec_type = 30005,
                                 id = MenuId},
                  Camp, {Val, Items, Msg})
    when is_integer(Val) andalso is_list(Items) ->
    {ok,
     Camp#camp_web{id = Val, key = {MenuId, Val},
                   items = Items, tar_val = Val,
                   str1 = util:to_list(Msg)}};
do_load_camp_item(#camp_web_menu{sec_type = 30006,
                                 id = MenuId},
                  Camp, {Val, Items, Msg})
    when is_integer(Val) andalso is_list(Items) ->
    {ok,
     Camp#camp_web{id = Val, key = {MenuId, Val},
                   items = Items, tar_val = Val,
                   str1 = util:to_list(Msg)}};
do_load_camp_item(#camp_web_menu{sec_type = 40001,
                                 id = MenuId},
                  Camp, {Val, Items, Msg})
    when is_integer(Val) andalso is_list(Items) ->
    {ok,
     Camp#camp_web{id = Val, key = {MenuId, Val},
                   items = Items, str1 = util:to_list(Msg),
                   tar_val = Val}};
do_load_camp_item(#camp_web_menu{sec_type = 40002,
                                 id = MenuId},
                  Camp, {Val, Items, Msg})
    when is_integer(Val) andalso is_list(Items) ->
    {ok,
     Camp#camp_web{id = Val, key = {MenuId, Val},
                   items = Items, tar_val = Val,
                   str1 = util:to_list(Msg)}};
do_load_camp_item(#camp_web_menu{sec_type = 40003,
                                 id = MenuId},
                  Camp, {Val, Items, Msg})
    when is_integer(Val) andalso is_list(Items) ->
    {ok,
     Camp#camp_web{id = Val, key = {MenuId, Val},
                   items = Items, tar_val = Val,
                   str1 = util:to_list(Msg)}};
do_load_camp_item(#camp_web_menu{sec_type = 50001},
                  Camp, {Items, Msg, Msg2})
    when is_list(Items) ->
    {ok,
     Camp#camp_web{items = Items, str1 = util:to_list(Msg),
                   str2 = util:to_list(Msg2), is_desc = 1}};
do_load_camp_item(#camp_web_menu{sec_type = 50002},
                  Camp, {Max, Key, LossItems, Items, Msg})
    when is_integer(Max) andalso
             is_integer(Key) andalso
                 is_list(LossItems) andalso is_list(Items) ->
    {ok,
     Camp#camp_web{items = Items, loss_items = LossItems,
                   reward_num = Max, val1 = Key,
                   str1 = util:to_list(Msg)}};
do_load_camp_item(#camp_web_menu{sec_type = 50003},
                  Camp, {Gold, OldGold, Max, V1, V2, Items, Msg})
    when is_integer(Gold) andalso
             is_integer(Max) andalso
                 is_list(Items) andalso
                     is_integer(V1) andalso is_integer(V2) ->
    {ok,
     Camp#camp_web{reward_num = Max, val1 = Gold,
                   val2 = OldGold, val3 = V1, val4 = V2,
                   loss_items = [{90002, Gold}], items = Items,
                   str1 = util:to_list(Msg)}};
do_load_camp_item(#camp_web_menu{sec_type = 60004},
                  Camp, {Msg}) ->
    {ok,
     Camp#camp_web{str1 = util:to_list(Msg), is_desc = 1}};
do_load_camp_item(#camp_web_menu{sec_type = 60005},
                  Camp, {Msg}) ->
    {ok,
     Camp#camp_web{str1 = util:to_list(Msg), is_desc = 1}};
do_load_camp_item(#camp_web_menu{sec_type = 60006},
                  Camp, {Msg}) ->
    {ok,
     Camp#camp_web{str1 = util:to_list(Msg), is_desc = 1}};
do_load_camp_item(#camp_web_menu{sec_type = 60007},
                  Camp, {Msg}) ->
    {ok,
     Camp#camp_web{str1 = util:to_list(Msg), is_desc = 1}};
do_load_camp_item(#camp_web_menu{sec_type = 50004},
                  Camp, {Max, Key, LossScore, ScoreRadio, Items, Msg})
    when is_integer(Max) andalso
             is_integer(Key) andalso
                 is_integer(LossScore) andalso
                     is_integer(ScoreRadio) andalso is_list(Items) ->
    {ok,
     Camp#camp_web{items = Items, reward_num = Max,
                   val1 = Key, val2 = LossScore, val3 = ScoreRadio,
                   str1 = util:to_list(Msg)}};
do_load_camp_item(#camp_web_menu{sec_type = 10005},
                  Camp, {Min, Key, Items, Msg})
    when is_integer(Min) andalso
             is_integer(Key) andalso is_list(Items) ->
    {ok,
     Camp#camp_web{items = Items, val1 = Min, val2 = Key,
                   str1 = util:to_list(Msg)}};
do_load_camp_item(#camp_web_menu{sec_type = 40004},
                  Camp, {Min, Flag, Items, Msg})
    when is_integer(Min) andalso
             is_integer(Flag) andalso is_list(Items) ->
    {ok,
     Camp#camp_web{items = Items, val1 = Flag, tar_val = Min,
                   str1 = util:to_list(Msg)}};
do_load_camp_item(#camp_web_menu{sec_type = 40005},
                  Camp, {Min, Flag, Items, Msg})
    when is_integer(Min) andalso
             is_integer(Flag) andalso is_list(Items) ->
    {ok,
     Camp#camp_web{items = Items, val1 = Flag, tar_val = Min,
                   str1 = util:to_list(Msg)}};
do_load_camp_item(#camp_web_menu{sec_type = 40006},
                  Camp, {Min, Items, Msg})
    when is_integer(Min) andalso is_list(Items) ->
    {ok,
     Camp#camp_web{items = Items, tar_val = Min,
                   str1 = util:to_list(Msg)}};
do_load_camp_item(#camp_web_menu{sec_type = 40007},
                  Camp, {ThirdType, Min, Flag, Items, Msg})
    when is_integer(ThirdType) andalso
             is_integer(Min) andalso
                 is_integer(Flag) andalso is_list(Items) ->
    {ok,
     Camp#camp_web{third_type = ThirdType, items = Items,
                   val1 = Flag, tar_val = Min, str1 = util:to_list(Msg)}};
do_load_camp_item(#camp_web_menu{sec_type = 30007},
                  Camp, {Min, Msg})
    when is_integer(Min) ->
    {ok,
     Camp#camp_web{val1 = Min, tar_val = Min,
                   str1 = util:to_list(Msg)}};
do_load_camp_item(#camp_web_menu{sec_type = 30008},
                  Camp, {Coin, Gold, Msg})
    when is_integer(Coin) andalso is_integer(Gold) ->
    {ok,
     Camp#camp_web{third_type = 1, val1 = Coin, val2 = Gold,
                   str1 = util:to_list(Msg)}};
do_load_camp_item(#camp_web_menu{sec_type = 30008},
                  Camp, {Gold, OldGold, Max, Items, Msg})
    when is_integer(Gold) andalso
             is_integer(Max) andalso is_list(Items) ->
    {ok,
     Camp#camp_web{third_type = 2, reward_num = Max,
                   val1 = Gold, val2 = OldGold,
                   loss_items = [{90002, Gold}], items = Items,
                   str1 = util:to_list(Msg)}};
do_load_camp_item(#camp_web_menu{sec_type = 20002},
                  Camp, {Min, ItemList, Msg})
    when is_integer(Min) andalso is_list(ItemList) ->
    {ok,
     Camp#camp_web{val1 = Min, tar_val = Min,
                   str1 = util:to_list(Msg), items = ItemList}};
do_load_camp_item(#camp_web_menu{sec_type = 30009},
                  Camp, {Min, Day, Flag, ItemList, Msg})
    when is_integer(Min) andalso is_list(ItemList) ->
    {ok,
     Camp#camp_web{val1 = Day, val2 = Flag, tar_val = Min,
                   str1 = util:to_list(Msg), items = ItemList}};
do_load_camp_item(#camp_web_menu{sec_type = 30010},
                  Camp, {Min, Day, Flag, ItemList, Msg})
    when is_integer(Min) andalso is_list(ItemList) ->
    {ok,
     Camp#camp_web{val1 = Day, val2 = Flag, tar_val = Min,
                   str1 = util:to_list(Msg), items = ItemList}};
do_load_camp_item(#camp_web_menu{sec_type = 30011},
                  Camp, {ThirdType, Min, Day, Flag, ItemList, Msg})
    when is_integer(Min) andalso
             is_list(ItemList) andalso is_integer(ThirdType) ->
    {ok,
     Camp#camp_web{third_type = ThirdType, val1 = Day,
                   val2 = Flag, tar_val = Min, str1 = util:to_list(Msg),
                   items = ItemList}};
do_load_camp_item(#camp_web_menu{sec_type = 70001},
                  Camp, {ItemList, Msg})
    when is_list(ItemList) ->
    {ok,
     Camp#camp_web{str1 = util:to_list(Msg),
                   items = ItemList}};
do_load_camp_item(#camp_web_menu{sec_type = 70002},
                  Camp, {ItemList, Msg})
    when is_list(ItemList) ->
    {ok,
     Camp#camp_web{str1 = util:to_list(Msg),
                   items = ItemList}};
do_load_camp_item(#camp_web_menu{type = Type,
                                 sec_type = SecType, id = MenuId},
                  #camp_web{id = N}, D) ->
    logger:error("活动[~w]类型[~w:~w]匹配第~w条数据失败[~w]",
                 [MenuId, Type, SecType, N, D],
                 camp_web_mgr,
                 824).

camp_memu_extra(_Type, [], List) -> lists:reverse(List);
camp_memu_extra(Type = 30003, [I | T], List)
    when is_integer(I) ->
    camp_memu_extra(Type, T, [{I, 0, ""} | List]);
camp_memu_extra(Type, [_ | T], List) ->
    camp_memu_extra(Type, T, List).

