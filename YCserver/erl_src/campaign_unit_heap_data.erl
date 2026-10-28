-file("src/data/campaign_unit_heap_data.erl", 1).

-module(campaign_unit_heap_data).

-export([get_drop/1]).

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

-file("src/data/campaign_unit_heap_data.erl", 14).

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

-file("src/data/campaign_unit_heap_data.erl", 15).

get_drop(Val) when Val >= 0 andalso Val =< 29 ->
    #{flag => 0, reward_name => lang:get("未完成"),
      exp_mode => 3353, exp_ratio => 1000, reward_list1 => [],
      reward_list2 => [], reward_list3 => [],
      unit_name => lang:get("简陋的雪球")};
get_drop(Val) when Val >= 30 andalso Val =< 79 ->
    #{flag => 1, reward_name => lang:get("优秀"),
      exp_mode => 3353, exp_ratio => 1000,
      reward_list1 =>
          [{20006, 5, 200, 0},
           {20000, 1, 80, 0},
           {20002, 1, 80, 0},
           {20046, 1, 30, 1},
           {20013, 1, 60, 0},
           {20025, 1, 120, 0},
           {20052, 1, 180, 0},
           {20087, 1, 80, 1},
           {20075, 1, 10, 1},
           {20076, 1, 2, 1},
           {20616, 1, 5, 1},
           {21100, 1, 30, 1},
           {20095, 1, 3, 1},
           {20545, 1, 20, 0},
           {22456, 1, 100, 0}],
      reward_list2 => [],
      reward_list3 => [{29120, 1, 500, 0}],
      unit_name => lang:get("萌萌的小雪人")};
get_drop(Val) when Val >= 80 andalso Val =< 99 ->
    #{flag => 1, reward_name => lang:get("完美"),
      exp_mode => 3353, exp_ratio => 2000,
      reward_list1 =>
          [{20006, 5, 200, 0},
           {20000, 1, 80, 0},
           {20002, 1, 80, 0},
           {20046, 1, 30, 1},
           {20013, 1, 60, 0},
           {20025, 1, 120, 0},
           {20052, 1, 180, 0},
           {20087, 1, 80, 1},
           {20075, 1, 10, 1},
           {20076, 1, 2, 1},
           {20616, 1, 5, 1},
           {21100, 1, 30, 1},
           {20095, 1, 3, 1},
           {20545, 1, 20, 0},
           {22456, 1, 100, 0}],
      reward_list2 => [],
      reward_list3 => [{29120, 1, 500, 0}],
      unit_name => lang:get("漂亮的大雪人")};
get_drop(Val) when Val >= 100 andalso Val =< 9999 ->
    #{flag => 1, reward_name => lang:get("超神"),
      exp_mode => 3353, exp_ratio => 3000,
      reward_list1 =>
          [{20006, 5, 200, 0},
           {20000, 1, 80, 0},
           {20002, 1, 80, 0},
           {20046, 1, 30, 1},
           {20013, 1, 60, 0},
           {20025, 1, 120, 0},
           {20052, 1, 180, 0},
           {20087, 1, 80, 1},
           {20075, 1, 10, 1},
           {20076, 1, 2, 1},
           {20616, 1, 5, 1},
           {21100, 1, 30, 1},
           {20095, 1, 3, 1},
           {20545, 1, 20, 0},
           {22456, 1, 100, 0}],
      reward_list2 => [],
      reward_list3 => [{29120, 1, 500, 0}],
      unit_name => lang:get("完美雪人")};
get_drop(_) -> false.

