-file("src/data/campaign_card_data.erl", 1).

-module(campaign_card_data).

-export([get_info/1,
         get_card_list/1,
         get_times/1,
         get_times_open/1,
         get_unit/0]).

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

-file("src/data/campaign_card_data.erl", 17).

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

-file("src/data/campaign_card_data.erl", 18).

get_info(0) -> {1479916800, 1480280400};
get_info(1) -> {1479916800, 1480280400};
get_info(_) -> false.

get_card_list(1) ->
    [#{base_id => 20000, bind => 0, num => 1, ratio1 => 100,
       ratio2 => 460, classes => 0, sex => 2, lev_low => 0,
       lev_high => 0, is_cast => 0, min_times => 1,
       max_times => 4},
     #{base_id => 20007, bind => 0, num => 1, ratio1 => 100,
       ratio2 => 460, classes => 0, sex => 2, lev_low => 0,
       lev_high => 0, is_cast => 0, min_times => 1,
       max_times => 4},
     #{base_id => 20087, bind => 0, num => 1, ratio1 => 100,
       ratio2 => 460, classes => 0, sex => 2, lev_low => 0,
       lev_high => 0, is_cast => 1, min_times => 1,
       max_times => 4},
     #{base_id => 20088, bind => 0, num => 1, ratio1 => 100,
       ratio2 => 460, classes => 0, sex => 2, lev_low => 0,
       lev_high => 0, is_cast => 0, min_times => 1,
       max_times => 4},
     #{base_id => 29104, bind => 0, num => 2, ratio1 => 100,
       ratio2 => 460, classes => 0, sex => 2, lev_low => 0,
       lev_high => 0, is_cast => 0, min_times => 1,
       max_times => 4},
     #{base_id => 29103, bind => 0, num => 1, ratio1 => 100,
       ratio2 => 460, classes => 0, sex => 2, lev_low => 0,
       lev_high => 0, is_cast => 0, min_times => 1,
       max_times => 4},
     #{base_id => 23555, bind => 0, num => 1, ratio1 => 100,
       ratio2 => 460, classes => 0, sex => 2, lev_low => 0,
       lev_high => 0, is_cast => 0, min_times => 1,
       max_times => 4},
     #{base_id => 23556, bind => 0, num => 1, ratio1 => 100,
       ratio2 => 460, classes => 0, sex => 2, lev_low => 0,
       lev_high => 0, is_cast => 0, min_times => 1,
       max_times => 4},
     #{base_id => 21098, bind => 0, num => 2, ratio1 => 100,
       ratio2 => 460, classes => 0, sex => 2, lev_low => 0,
       lev_high => 0, is_cast => 0, min_times => 1,
       max_times => 4},
     #{base_id => 90026, bind => 0, num => 60, ratio1 => 100,
       ratio2 => 460, classes => 0, sex => 2, lev_low => 0,
       lev_high => 0, is_cast => 0, min_times => 1,
       max_times => 4},
     #{base_id => 90026, bind => 0, num => 80, ratio1 => 100,
       ratio2 => 460, classes => 0, sex => 2, lev_low => 0,
       lev_high => 0, is_cast => 0, min_times => 1,
       max_times => 4},
     #{base_id => 90026, bind => 0, num => 200, ratio1 => 20,
       ratio2 => 460, classes => 0, sex => 2, lev_low => 0,
       lev_high => 0, is_cast => 1, min_times => 1,
       max_times => 4}];
get_card_list(2) ->
    [#{base_id => 21100, bind => 0, num => 1, ratio1 => 100,
       ratio2 => 460, classes => 0, sex => 2, lev_low => 0,
       lev_high => 0, is_cast => 1, min_times => 1,
       max_times => 4},
     #{base_id => 20040, bind => 0, num => 1, ratio1 => 100,
       ratio2 => 460, classes => 0, sex => 2, lev_low => 0,
       lev_high => 0, is_cast => 1, min_times => 1,
       max_times => 4},
     #{base_id => 20046, bind => 0, num => 1, ratio1 => 100,
       ratio2 => 460, classes => 0, sex => 2, lev_low => 0,
       lev_high => 0, is_cast => 1, min_times => 1,
       max_times => 4},
     #{base_id => 22585, bind => 0, num => 1, ratio1 => 100,
       ratio2 => 460, classes => 0, sex => 2, lev_low => 0,
       lev_high => 0, is_cast => 0, min_times => 1,
       max_times => 4},
     #{base_id => 21130, bind => 0, num => 1, ratio1 => 100,
       ratio2 => 460, classes => 0, sex => 2, lev_low => 0,
       lev_high => 0, is_cast => 1, min_times => 1,
       max_times => 4},
     #{base_id => 22216, bind => 0, num => 1, ratio1 => 100,
       ratio2 => 460, classes => 0, sex => 2, lev_low => 0,
       lev_high => 0, is_cast => 0, min_times => 1,
       max_times => 4},
     #{base_id => 23554, bind => 0, num => 1, ratio1 => 100,
       ratio2 => 460, classes => 0, sex => 2, lev_low => 0,
       lev_high => 0, is_cast => 1, min_times => 1,
       max_times => 4},
     #{base_id => 90026, bind => 0, num => 100,
       ratio1 => 100, ratio2 => 460, classes => 0, sex => 2,
       lev_low => 0, lev_high => 0, is_cast => 1,
       min_times => 1, max_times => 4},
     #{base_id => 90026, bind => 0, num => 300, ratio1 => 20,
       ratio2 => 460, classes => 0, sex => 2, lev_low => 0,
       lev_high => 0, is_cast => 1, min_times => 1,
       max_times => 4}];
get_card_list(3) ->
    [#{base_id => 20014, bind => 0, num => 1, ratio1 => 50,
       ratio2 => 45, classes => 0, sex => 2, lev_low => 0,
       lev_high => 0, is_cast => 1, min_times => 2,
       max_times => 4},
     #{base_id => 21102, bind => 0, num => 1, ratio1 => 100,
       ratio2 => 45, classes => 0, sex => 2, lev_low => 0,
       lev_high => 0, is_cast => 1, min_times => 2,
       max_times => 4},
     #{base_id => 20040, bind => 0, num => 1, ratio1 => 100,
       ratio2 => 45, classes => 0, sex => 2, lev_low => 0,
       lev_high => 0, is_cast => 1, min_times => 2,
       max_times => 4},
     #{base_id => 22300, bind => 0, num => 1, ratio1 => 100,
       ratio2 => 45, classes => 0, sex => 2, lev_low => 0,
       lev_high => 0, is_cast => 1, min_times => 2,
       max_times => 4},
     #{base_id => 22574, bind => 0, num => 1, ratio1 => 100,
       ratio2 => 45, classes => 0, sex => 2, lev_low => 0,
       lev_high => 0, is_cast => 1, min_times => 2,
       max_times => 4},
     #{base_id => 29100, bind => 0, num => 1, ratio1 => 50,
       ratio2 => 45, classes => 0, sex => 2, lev_low => 0,
       lev_high => 0, is_cast => 1, min_times => 2,
       max_times => 4},
     #{base_id => 22307, bind => 0, num => 2, ratio1 => 100,
       ratio2 => 45, classes => 0, sex => 2, lev_low => 0,
       lev_high => 0, is_cast => 1, min_times => 2,
       max_times => 4},
     #{base_id => 21322, bind => 0, num => 1, ratio1 => 100,
       ratio2 => 45, classes => 0, sex => 2, lev_low => 0,
       lev_high => 0, is_cast => 1, min_times => 2,
       max_times => 4},
     #{base_id => 90026, bind => 0, num => 300,
       ratio1 => 100, ratio2 => 45, classes => 0, sex => 2,
       lev_low => 0, lev_high => 0, is_cast => 1,
       min_times => 2, max_times => 4},
     #{base_id => 90026, bind => 0, num => 500, ratio1 => 10,
       ratio2 => 45, classes => 0, sex => 2, lev_low => 0,
       lev_high => 0, is_cast => 1, min_times => 2,
       max_times => 4}];
get_card_list(4) ->
    [#{base_id => 22301, bind => 0, num => 1, ratio1 => 100,
       ratio2 => 15, classes => 0, sex => 2, lev_low => 0,
       lev_high => 0, is_cast => 1, min_times => 3,
       max_times => 4},
     #{base_id => 29314, bind => 0, num => 1, ratio1 => 100,
       ratio2 => 15, classes => 0, sex => 2, lev_low => 0,
       lev_high => 0, is_cast => 1, min_times => 3,
       max_times => 4},
     #{base_id => 22617, bind => 0, num => 1, ratio1 => 100,
       ratio2 => 15, classes => 0, sex => 2, lev_low => 0,
       lev_high => 0, is_cast => 1, min_times => 3,
       max_times => 4},
     #{base_id => 20022, bind => 0, num => 5, ratio1 => 100,
       ratio2 => 15, classes => 0, sex => 2, lev_low => 0,
       lev_high => 0, is_cast => 1, min_times => 3,
       max_times => 4},
     #{base_id => 22307, bind => 0, num => 5, ratio1 => 100,
       ratio2 => 15, classes => 0, sex => 2, lev_low => 0,
       lev_high => 0, is_cast => 1, min_times => 3,
       max_times => 4},
     #{base_id => 23660, bind => 0, num => 1, ratio1 => 100,
       ratio2 => 15, classes => 0, sex => 2, lev_low => 0,
       lev_high => 0, is_cast => 1, min_times => 3,
       max_times => 4},
     #{base_id => 28607, bind => 0, num => 1, ratio1 => 100,
       ratio2 => 15, classes => 0, sex => 2, lev_low => 0,
       lev_high => 0, is_cast => 1, min_times => 3,
       max_times => 4},
     #{base_id => 21426, bind => 0, num => 1, ratio1 => 100,
       ratio2 => 15, classes => 0, sex => 2, lev_low => 0,
       lev_high => 0, is_cast => 1, min_times => 3,
       max_times => 4},
     #{base_id => 23594, bind => 0, num => 1, ratio1 => 100,
       ratio2 => 15, classes => 0, sex => 2, lev_low => 0,
       lev_high => 0, is_cast => 1, min_times => 3,
       max_times => 4},
     #{base_id => 29438, bind => 0, num => 1, ratio1 => 100,
       ratio2 => 15, classes => 0, sex => 2, lev_low => 0,
       lev_high => 0, is_cast => 1, min_times => 3,
       max_times => 4},
     #{base_id => 90026, bind => 0, num => 600,
       ratio1 => 100, ratio2 => 15, classes => 0, sex => 2,
       lev_low => 0, lev_high => 0, is_cast => 1,
       min_times => 3, max_times => 4},
     #{base_id => 90026, bind => 0, num => 1200,
       ratio1 => 10, ratio2 => 15, classes => 0, sex => 2,
       lev_low => 0, lev_high => 0, is_cast => 1,
       min_times => 3, max_times => 4}];
get_card_list(_) -> [].

get_times(1) -> {0, [], 0};
get_times(2) -> {50, [], 0};
get_times(3) -> {80, [], 0};
get_times(4) -> {0, [{90002, 30}], 0};
get_times(5) -> {0, [{90002, 80}], 0};
get_times(6) -> {0, [{90002, 150}], 0};
get_times(7) -> {0, [{90002, 300}], 0};
get_times(8) -> {0, [{90002, 500}], 0};
get_times(_) -> false.

get_times_open(1) -> {40, 0, [], [{20000, 0, 1}]};
get_times_open(2) -> {0, 50, [], [{90026, 0, 30}]};
get_times_open(3) -> {0, 80, [], [{90026, 0, 50}]};
get_times_open(4) ->
    {0, 0, [{90002, 30}], [{20505, 0, 1}]};
get_times_open(5) ->
    {0, 0, [{90002, 80}], [{21100, 0, 1}]};
get_times_open(6) ->
    {0, 0, [{90002, 150}], [{20038, 0, 1}]};
get_times_open(7) ->
    {0, 0, [{90002, 300}], [{22300, 0, 1}]};
get_times_open(8) ->
    {0, 0, [{90002, 500}], [{20617, 0, 1}]};
get_times_open(_) -> false.

get_unit() ->
    [{76910, 100},
     {76911, 100},
     {76912, 100},
     {76913, 100},
     {76910, 100},
     {76911, 100},
     {76912, 100},
     {76913, 100},
     {76910, 100},
     {76911, 100},
     {76912, 100},
     {76913, 100},
     {76910, 100},
     {76911, 100},
     {76912, 100},
     {76913, 100},
     {76910, 100},
     {76911, 100},
     {76912, 100},
     {76913, 100},
     {76910, 100},
     {76911, 100},
     {76912, 100},
     {76913, 100},
     {76910, 100},
     {76911, 100},
     {76912, 100},
     {76913, 100},
     {76910, 100},
     {76911, 100}].

