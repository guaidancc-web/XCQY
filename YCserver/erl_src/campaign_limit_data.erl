-file("src/data/campaign_limit_data.erl", 1).

-module(campaign_limit_data).

-export([get_rewards/1, get_gift/1, list_all_type/0]).

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

-file("src/data/campaign_limit_data.erl", 15).

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

-file("src/data/campaign_limit_data.erl", 16).

get_rewards(1) -> {[{24012, 1, 0, 49}], [{90002, 198}]};
get_rewards(2) ->
    {[{24013, 1, 50, 80}], [{90002, 220}]};
get_rewards(3) -> {[{24014, 1, 0, 80}], [{90002, 320}]};
get_rewards(4) -> {[{24015, 1, 0, 59}], [{90002, 480}]};
get_rewards(5) -> {[{24016, 1, 0, 80}], [{90002, 920}]};
get_rewards(6) -> {[{24017, 1, 0, 80}], [{90002, 99}]};
get_rewards(_) -> false.

get_gift({1, 1}) ->
    #{day => 1, groupid => 1, origin_val => 580,
      need_val => 280, times => 1,
      reward =>
          [{29103, 0, 5, 1, 200, 2, 0, 1},
           {20005, 0, 10, 1, 200, 2, 0, 0},
           {20004, 0, 20, 1, 200, 2, 0, 0}],
      title => lang:get("经验飞升补给")};
get_gift({1, 2}) ->
    #{day => 1, groupid => 2, origin_val => 1980,
      need_val => 880, times => 1,
      reward =>
          [{20022, 0, 10, 1, 200, 2, 0, 1},
           {20020, 0, 20, 1, 200, 2, 0, 1},
           {20009, 0, 2, 1, 200, 2, 0, 1}],
      title => lang:get("装备强化补给")};
get_gift({1, 3}) ->
    #{day => 1, groupid => 3, origin_val => 3980,
      need_val => 1880, times => 1,
      reward =>
          [{20755, 0, 5, 1, 200, 2, 0, 1},
           {20545, 0, 10, 1, 200, 2, 0, 1},
           {29102, 0, 10, 1, 200, 2, 0, 1},
           {90026, 0, 100, 1, 200, 2, 0, 1}],
      title => lang:get("宠物培养补给")};
get_gift({2, 1}) ->
    #{day => 2, groupid => 1, origin_val => 580,
      need_val => 280, times => 1,
      reward =>
          [{21101, 0, 2, 1, 200, 2, 0, 1},
           {20002, 0, 1, 1, 200, 2, 0, 0}],
      title => lang:get("极品翅膀补给")};
get_gift({2, 2}) ->
    #{day => 2, groupid => 2, origin_val => 1980,
      need_val => 880, times => 1,
      reward =>
          [{22585, 0, 5, 1, 200, 2, 0, 1},
           {20034, 0, 20, 1, 200, 2, 0, 1},
           {23752, 0, 2, 1, 200, 2, 0, 1}],
      title => lang:get("装备宝石补给")};
get_gift({2, 3}) ->
    #{day => 2, groupid => 3, origin_val => 3980,
      need_val => 1880, times => 1,
      reward =>
          [{20617, 0, 1, 1, 200, 2, 0, 1},
           {20076, 0, 2, 1, 200, 2, 0, 1},
           {20616, 0, 1, 1, 200, 2, 0, 1},
           {20075, 0, 2, 1, 200, 2, 0, 1}],
      title => lang:get("宠物飞升补给")};
get_gift({3, 1}) ->
    #{day => 3, groupid => 1, origin_val => 580,
      need_val => 280, times => 1,
      reward =>
          [{20025, 0, 10, 1, 200, 2, 0, 1},
           {22216, 0, 2, 1, 200, 2, 0, 1}],
      title => lang:get("冒险经验补给")};
get_gift({3, 2}) ->
    #{day => 3, groupid => 2, origin_val => 1980,
      need_val => 880, times => 1,
      reward =>
          [{21433, 0, 5, 1, 200, 2, 0, 1},
           {22595, 0, 3, 1, 200, 2, 0, 1},
           {90026, 0, 300, 1, 200, 2, 0, 1}],
      title => lang:get("能力提升补给")};
get_gift({3, 3}) ->
    #{day => 3, groupid => 3, origin_val => 3980,
      need_val => 1880, times => 1,
      reward =>
          [{29100, 0, 1, 1, 200, 2, 0, 1},
           {29101, 0, 5, 1, 200, 2, 0, 1},
           {20006, 0, 100, 1, 200, 2, 0, 1}],
      title => lang:get("宠物洗髓补给")};
get_gift({4, 1}) ->
    #{day => 4, groupid => 1, origin_val => 580,
      need_val => 280, times => 1,
      reward =>
          [{29103, 0, 5, 1, 200, 2, 0, 1},
           {20005, 0, 10, 1, 200, 2, 0, 0},
           {20004, 0, 20, 1, 200, 2, 0, 0}],
      title => lang:get("经验飞升补给")};
get_gift({4, 2}) ->
    #{day => 4, groupid => 2, origin_val => 1980,
      need_val => 880, times => 1,
      reward =>
          [{20022, 0, 10, 1, 200, 2, 0, 1},
           {20020, 0, 20, 1, 200, 2, 0, 1},
           {20009, 0, 2, 1, 200, 2, 0, 1}],
      title => lang:get("装备强化补给")};
get_gift({4, 3}) ->
    #{day => 4, groupid => 3, origin_val => 3980,
      need_val => 1880, times => 1,
      reward =>
          [{20755, 0, 5, 1, 200, 2, 0, 1},
           {20545, 0, 10, 1, 200, 2, 0, 1},
           {29102, 0, 10, 1, 200, 2, 0, 1},
           {90026, 0, 100, 1, 200, 2, 0, 1}],
      title => lang:get("宠物培养补给")};
get_gift({5, 1}) ->
    #{day => 5, groupid => 1, origin_val => 580,
      need_val => 280, times => 1,
      reward =>
          [{21101, 0, 2, 1, 200, 2, 0, 1},
           {20002, 0, 1, 1, 200, 2, 0, 0}],
      title => lang:get("极品翅膀补给")};
get_gift({5, 2}) ->
    #{day => 5, groupid => 2, origin_val => 1980,
      need_val => 880, times => 1,
      reward =>
          [{22585, 0, 5, 1, 200, 2, 0, 1},
           {20034, 0, 20, 1, 200, 2, 0, 1},
           {23752, 0, 2, 1, 200, 2, 0, 1}],
      title => lang:get("装备宝石补给")};
get_gift({5, 3}) ->
    #{day => 5, groupid => 3, origin_val => 3980,
      need_val => 1880, times => 1,
      reward =>
          [{20617, 0, 1, 1, 200, 2, 0, 1},
           {20076, 0, 2, 1, 200, 2, 0, 1},
           {20616, 0, 1, 1, 200, 2, 0, 1},
           {20075, 0, 2, 1, 200, 2, 0, 1}],
      title => lang:get("宠物飞升补给")};
get_gift({6, 1}) ->
    #{day => 6, groupid => 1, origin_val => 580,
      need_val => 280, times => 1,
      reward =>
          [{20025, 0, 10, 1, 200, 2, 0, 1},
           {22216, 0, 2, 1, 200, 2, 0, 1}],
      title => lang:get("冒险经验补给")};
get_gift({6, 2}) ->
    #{day => 6, groupid => 2, origin_val => 1980,
      need_val => 880, times => 1,
      reward =>
          [{21433, 0, 5, 1, 200, 2, 0, 1},
           {22595, 0, 4, 1, 200, 2, 0, 1},
           {90026, 0, 300, 1, 200, 2, 0, 1}],
      title => lang:get("能力提升补给")};
get_gift({6, 3}) ->
    #{day => 6, groupid => 3, origin_val => 3980,
      need_val => 1880, times => 1,
      reward =>
          [{29100, 0, 1, 1, 200, 2, 0, 1},
           {29101, 0, 5, 1, 200, 2, 0, 1},
           {20006, 0, 100, 1, 200, 2, 0, 1}],
      title => lang:get("宠物洗髓补给")};
get_gift({7, 1}) ->
    #{day => 7, groupid => 1, origin_val => 580,
      need_val => 280, times => 1,
      reward =>
          [{22249, 0, 1, 1, 200, 2, 0, 1},
           {20022, 0, 4, 1, 200, 2, 0, 1}],
      title => lang:get("幸运钥匙补给")};
get_gift({7, 2}) ->
    #{day => 7, groupid => 2, origin_val => 1980,
      need_val => 880, times => 1,
      reward =>
          [{28607, 0, 2, 1, 200, 2, 0, 1},
           {20076, 0, 1, 1, 200, 2, 0, 1},
           {21322, 0, 2, 1, 200, 2, 0, 1}],
      title => lang:get("百变幻化补给")};
get_gift({7, 3}) ->
    #{day => 7, groupid => 3, origin_val => 3980,
      need_val => 1880, times => 1,
      reward =>
          [{22617, 0, 1, 1, 200, 2, 0, 1},
           {22301, 0, 2, 1, 200, 2, 0, 1},
           {22300, 0, 2, 1, 200, 2, 0, 1}],
      title => lang:get("能力飞升补给")};
get_gift(_) -> false.

list_all_type() -> [2, 3, 1].

