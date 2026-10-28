-file("src/data/camp_acc_charge_data.erl", 1).

-module(camp_acc_charge_data).

-export([get_data/2, all_gift/0, get_gift/1]).

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

-file("src/data/camp_acc_charge_data.erl", 17).

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

-file("src/data/camp_acc_charge_data.erl", 18).

get_data(Charge, 1)
    when Charge >= 199 andalso Charge =< 199 ->
    #{min => 199, max => 199, day => 1, rebate => 20};
get_data(Charge, 2)
    when Charge >= 199 andalso Charge =< 199 ->
    #{min => 199, max => 199, day => 2, rebate => 20};
get_data(Charge, 3)
    when Charge >= 199 andalso Charge =< 199 ->
    #{min => 199, max => 199, day => 3, rebate => 20};
get_data(Charge, 4)
    when Charge >= 199 andalso Charge =< 199 ->
    #{min => 199, max => 199, day => 4, rebate => 20};
get_data(Charge, 5)
    when Charge >= 199 andalso Charge =< 199 ->
    #{min => 199, max => 199, day => 5, rebate => 20};
get_data(Charge, 1)
    when Charge >= 299 andalso Charge =< 299 ->
    #{min => 299, max => 299, day => 1, rebate => 20};
get_data(Charge, 2)
    when Charge >= 299 andalso Charge =< 299 ->
    #{min => 299, max => 299, day => 2, rebate => 20};
get_data(Charge, 3)
    when Charge >= 299 andalso Charge =< 299 ->
    #{min => 299, max => 299, day => 3, rebate => 20};
get_data(Charge, 4)
    when Charge >= 299 andalso Charge =< 299 ->
    #{min => 299, max => 299, day => 4, rebate => 20};
get_data(Charge, 5)
    when Charge >= 299 andalso Charge =< 299 ->
    #{min => 299, max => 299, day => 5, rebate => 20};
get_data(Charge, 6)
    when Charge >= 299 andalso Charge =< 299 ->
    #{min => 299, max => 299, day => 6, rebate => 20};
get_data(Charge, 7)
    when Charge >= 299 andalso Charge =< 299 ->
    #{min => 299, max => 299, day => 7, rebate => 20};
get_data(Charge, 1)
    when Charge >= 399 andalso Charge =< 399 ->
    #{min => 399, max => 399, day => 1, rebate => 20};
get_data(Charge, 2)
    when Charge >= 399 andalso Charge =< 399 ->
    #{min => 399, max => 399, day => 2, rebate => 20};
get_data(Charge, 3)
    when Charge >= 399 andalso Charge =< 399 ->
    #{min => 399, max => 399, day => 3, rebate => 20};
get_data(Charge, 4)
    when Charge >= 399 andalso Charge =< 399 ->
    #{min => 399, max => 399, day => 4, rebate => 20};
get_data(Charge, 5)
    when Charge >= 399 andalso Charge =< 399 ->
    #{min => 399, max => 399, day => 5, rebate => 20};
get_data(Charge, 6)
    when Charge >= 399 andalso Charge =< 399 ->
    #{min => 399, max => 399, day => 6, rebate => 20};
get_data(Charge, 7)
    when Charge >= 399 andalso Charge =< 399 ->
    #{min => 399, max => 399, day => 7, rebate => 20};
get_data(Charge, 8)
    when Charge >= 399 andalso Charge =< 399 ->
    #{min => 399, max => 399, day => 8, rebate => 20};
get_data(_, _) -> false.

all_gift() -> [1, 10, 2, 3, 4, 5, 6, 7, 8, 9].

get_gift(1) ->
    #{id => 1, val => 500,
      reward =>
          [{90000, 0, 300000, 1, 200, 2, 0, 1},
           {20005, 0, 10, 1, 200, 2, 0, 0}],
      icon => [{90000, 1, 200, 2, 0, 1}]};
get_gift(2) ->
    #{id => 2, val => 1280,
      reward =>
          [{20616, 0, 1, 1, 200, 2, 0, 1},
           {20025, 0, 3, 1, 200, 2, 0, 1},
           {20006, 0, 10, 1, 200, 2, 0, 0}],
      icon => [{20616, 1, 200, 2, 0, 1}]};
get_gift(3) ->
    #{id => 3, val => 2280,
      reward =>
          [{29170, 0, 2, 1, 200, 2, 0, 1},
           {29220, 0, 1, 1, 200, 2, 0, 1},
           {20006, 0, 30, 1, 200, 2, 0, 0}],
      icon => [{29008, 1, 200, 2, 0, 1}]};
get_gift(4) ->
    #{id => 4, val => 3500,
      reward =>
          [{20053, 0, 2, 1, 200, 2, 0, 1},
           {29102, 0, 3, 1, 200, 2, 0, 1},
           {20020, 0, 5, 1, 200, 2, 0, 1}],
      icon => [{20053, 1, 200, 2, 0, 1}]};
get_gift(5) ->
    #{id => 5, val => 5000,
      reward =>
          [{29012, 0, 1, 1, 200, 2, 0, 1},
           {20545, 0, 2, 1, 200, 2, 0, 1},
           {20006, 0, 30, 1, 200, 2, 0, 0}],
      icon => [{29012, 1, 200, 2, 0, 1}]};
get_gift(6) ->
    #{id => 6, val => 8000,
      reward =>
          [{22300, 0, 1, 1, 200, 2, 0, 1},
           {29220, 0, 2, 1, 200, 2, 0, 1},
           {20006, 0, 50, 1, 200, 2, 0, 0}],
      icon => [{23082, 1, 200, 2, 0, 1}]};
get_gift(7) ->
    #{id => 7, val => 15000,
      reward =>
          [{20273, 0, 1, 1, 200, 2, 0, 1},
           {29101, 0, 2, 1, 200, 2, 0, 1},
           {20021, 0, 20, 1, 200, 2, 0, 1},
           {21136, 0, 2, 1, 200, 2, 0, 1}],
      icon => [{20273, 1, 200, 2, 0, 1}]};
get_gift(8) ->
    #{id => 8, val => 20000,
      reward =>
          [{29264, 0, 1, 1, 200, 2, 0, 1},
           {22585, 0, 3, 1, 200, 2, 0, 1},
           {20075, 0, 1, 1, 200, 2, 0, 1},
           {90000, 0, 2000000, 1, 200, 2, 0, 0}],
      icon => [{52002, 1, 200, 2, 0, 1}]};
get_gift(9) ->
    #{id => 9, val => 50000,
      reward =>
          [{29263, 0, 1, 1, 200, 0, 0, 1},
           {29262, 0, 1, 1, 200, 1, 0, 1},
           {20617, 0, 1, 1, 200, 2, 0, 1},
           {20076, 0, 1, 1, 200, 2, 0, 1},
           {90026, 0, 200, 1, 200, 2, 0, 1},
           {20006, 0, 100, 1, 200, 2, 0, 0}],
      icon =>
          [{51039, 1, 200, 0, 0, 1}, {51038, 1, 200, 1, 0, 1}]};
get_gift(10) ->
    #{id => 10, val => 100000,
      reward =>
          [{29770, 0, 1, 1, 200, 2, 1, 1},
           {29771, 0, 1, 1, 200, 2, 2, 1},
           {29772, 0, 1, 1, 200, 2, 3, 1},
           {29773, 0, 1, 1, 200, 2, 4, 1},
           {29774, 0, 1, 1, 200, 2, 5, 1},
           {29775, 0, 1, 1, 200, 2, 6, 1},
           {29782, 0, 1, 1, 200, 2, 7, 1},
           {23119, 0, 1, 1, 200, 2, 0, 1},
           {22216, 0, 5, 1, 200, 2, 0, 1},
           {20023, 0, 2, 1, 200, 2, 0, 1},
           {22248, 0, 2, 1, 200, 2, 0, 1}],
      icon =>
          [{12070, 1, 200, 2, 1, 1},
           {12071, 1, 200, 2, 2, 1},
           {12072, 1, 200, 2, 3, 1},
           {12073, 1, 200, 2, 4, 1},
           {12074, 1, 200, 2, 5, 1},
           {12075, 1, 200, 2, 6, 1},
           {12080, 1, 200, 2, 7, 1}]};
get_gift(_) -> false.

