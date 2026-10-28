-file("src/data/campaign_steal_coin_data.erl", 1).

-module(campaign_steal_coin_data).

-export([get_steal/1,
         get_steal_coin/1,
         get_steal_item/1]).

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

-file("src/data/campaign_steal_coin_data.erl", 16).

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

-file("src/data/campaign_steal_coin_data.erl", 17).

get_steal(Coin)
    when Coin >= 500 andalso Coin =< 999999 ->
    1001;
get_steal(_) -> 0.

get_steal_coin(Round)
    when Round >= 1 andalso Round =< 1 ->
    [{1, 499, 0},
     {500, 999, 1000},
     {1000, 1499, 0},
     {1500, 2999, 0},
     {3000, 3999, 0},
     {4000, 4999, 0},
     {5000, 7999, 0},
     {8000, 9999, 0},
     {10000, 14999, 0},
     {15000, 19999, 0}];
get_steal_coin(Round)
    when Round >= 2 andalso Round =< 2 ->
    [{1, 499, 0},
     {500, 999, 1000},
     {1000, 1499, 500},
     {1500, 2999, 0},
     {3000, 3999, 0},
     {4000, 4999, 0},
     {5000, 7999, 0},
     {8000, 9999, 0},
     {10000, 14999, 0},
     {15000, 19999, 0}];
get_steal_coin(Round)
    when Round >= 3 andalso Round =< 3 ->
    [{1, 499, 0},
     {500, 999, 500},
     {1000, 1499, 1000},
     {1500, 2999, 300},
     {3000, 3999, 0},
     {4000, 4999, 0},
     {5000, 7999, 0},
     {8000, 9999, 0},
     {10000, 14999, 0},
     {15000, 19999, 0}];
get_steal_coin(Round)
    when Round >= 4 andalso Round =< 4 ->
    [{101, 499, 0},
     {500, 999, 1000},
     {1000, 1499, 1000},
     {1500, 2999, 1000},
     {3000, 3999, 500},
     {4000, 4999, 250},
     {5000, 7999, 200},
     {8000, 9999, 100},
     {10000, 14999, 60},
     {15000, 19999, 40}];
get_steal_coin(Round)
    when Round >= 5 andalso Round =< 6 ->
    [{101, 499, 0},
     {500, 999, 1000},
     {1000, 1499, 1000},
     {1500, 2999, 1000},
     {3000, 3999, 500},
     {4000, 4999, 250},
     {5000, 7999, 200},
     {8000, 9999, 100},
     {10000, 14999, 60},
     {15000, 19999, 40}];
get_steal_coin(Round)
    when Round >= 7 andalso Round =< 8 ->
    [{101, 499, 0},
     {500, 999, 1000},
     {1000, 1499, 1000},
     {1500, 2999, 1000},
     {3000, 3999, 500},
     {4000, 4999, 250},
     {5000, 7999, 200},
     {8000, 9999, 100},
     {10000, 14999, 60},
     {15000, 19999, 40}];
get_steal_coin(Round)
    when Round >= 9 andalso Round =< 999 ->
    [{101, 499, 0},
     {500, 999, 1000},
     {1000, 1499, 1000},
     {1500, 2999, 1000},
     {3000, 3999, 500},
     {4000, 4999, 250},
     {5000, 7999, 200},
     {8000, 9999, 100},
     {10000, 14999, 60},
     {15000, 19999, 40}];
get_steal_coin(_) -> [].

get_steal_item(1001) ->
    [#{base_id => 20006, num => 5, name => lang:get("星辰精华"),
       sex => 2, classes => 0, lev_low => 1, lev_high => 200,
       ratio => 210, is_cast => 0},
     #{base_id => 20000, num => 1, name => lang:get("一袋银币"),
       sex => 2, classes => 0, lev_low => 1, lev_high => 200,
       ratio => 70, is_cast => 0},
     #{base_id => 20002, num => 1, name => lang:get("一袋金币"),
       sex => 2, classes => 0, lev_low => 1, lev_high => 200,
       ratio => 70, is_cast => 0},
     #{base_id => 20046, num => 1, name => lang:get("彩虹果"),
       sex => 2, classes => 0, lev_low => 1, lev_high => 200,
       ratio => 50, is_cast => 1},
     #{base_id => 20025, num => 1, name => lang:get("冒险笔记"),
       sex => 2, classes => 0, lev_low => 1, lev_high => 200,
       ratio => 130, is_cast => 0},
     #{base_id => 20054, num => 1, name => lang:get("四宝"),
       sex => 2, classes => 0, lev_low => 1, lev_high => 200,
       ratio => 80, is_cast => 1},
     #{base_id => 20075, num => 1, name => lang:get("月亮重置丹"),
       sex => 2, classes => 0, lev_low => 1, lev_high => 200,
       ratio => 10, is_cast => 1},
     #{base_id => 20076, num => 1, name => lang:get("太阳重置丹"),
       sex => 2, classes => 0, lev_low => 1, lev_high => 200,
       ratio => 5, is_cast => 1},
     #{base_id => 21100, num => 1, name => lang:get("翅膀灵羽"),
       sex => 2, classes => 0, lev_low => 1, lev_high => 200,
       ratio => 30, is_cast => 1},
     #{base_id => 20095, num => 1, name => lang:get("珍兽之魂"),
       sex => 2, classes => 0, lev_low => 1, lev_high => 200,
       ratio => 5, is_cast => 1},
     #{base_id => 20005, num => 2,
       name => lang:get("人物经验心得"), sex => 2, classes => 0,
       lev_low => 1, lev_high => 200, ratio => 110,
       is_cast => 0},
     #{base_id => 20020, num => 2, name => lang:get("强化石"),
       sex => 2, classes => 0, lev_low => 1, lev_high => 200,
       ratio => 60, is_cast => 0},
     #{base_id => 20021, num => 1, name => lang:get("幸运石"),
       sex => 2, classes => 0, lev_low => 1, lev_high => 200,
       ratio => 60, is_cast => 0},
     #{base_id => 22306, num => 1,
       name => lang:get("精良珍珠袋子"), sex => 2, classes => 0,
       lev_low => 1, lev_high => 200, ratio => 110,
       is_cast => 0}];
get_steal_item(_) -> [].

