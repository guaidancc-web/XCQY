-file("src/data/camp_exchange_data.erl", 1).

-module(camp_exchange_data).

-export([all/0, get/1]).

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

-file("src/data/camp_exchange_data.erl", 16).

-file("inc/camp_exchange.hrl", 1).

-record(camp_exchange,
        {camp_id = 0, lev = 0, list = [], num = 0}).

-record(camp_exchange_data,
        {id = 0,
         lev = 0,
         item_list = [],
         item_gift_name = "",
         item_gift_id = 0,
         cost = 0,
         max = 0,
         camp_max = 0,
         min_day = 0,
         max_day = 100,
         pre_id = 0,
         pre_num = 0,
         min_lev = 0,
         max_lev = 0,
         sex = 0,
         classes = 0,
         min_lev_break = 0,
         max_lev_break = 0}).

-file("src/data/camp_exchange_data.erl", 17).

all() ->
    [{1, 1},
     {1, 2},
     {1, 3},
     {1, 4},
     {1, 5},
     {1, 6},
     {1, 7},
     {1, 8}].

get({1, 1}) ->
    #camp_exchange_data{lev = 1, id = 1,
                        item_list =
                            [{20782, 0, 1, 0},
                             {22216, 0, 1, 0},
                             {20025, 0, 2, 0}],
                        item_gift_name = lang:get("冒险提升礼包"),
                        item_gift_id = 29609, cost = 520, max = 4, min_day = 0,
                        max_day = 3, camp_max = 4, min_lev = 1, max_lev = 200,
                        sex = 2, classes = 0, min_lev_break = 0,
                        max_lev_break = 1};
get({1, 2}) ->
    #camp_exchange_data{lev = 1, id = 2,
                        item_list =
                            [{20782, 0, 1, 0},
                             {20616, 0, 1, 0},
                             {20545, 0, 1, 0},
                             {20006, 0, 10, 0}],
                        item_gift_name = lang:get("萌宠护符礼包"),
                        item_gift_id = 29605, cost = 1380, max = 3, min_day = 0,
                        max_day = 3, camp_max = 3, min_lev = 1, max_lev = 200,
                        sex = 2, classes = 0, min_lev_break = 0,
                        max_lev_break = 1};
get({1, 3}) ->
    #camp_exchange_data{lev = 1, id = 3,
                        item_list =
                            [{20782, 0, 1, 0},
                             {23740, 0, 1, 0},
                             {22585, 0, 1, 0},
                             {23752, 0, 1, 0}],
                        item_gift_name = lang:get("精灵珍宝礼包"),
                        item_gift_id = 29602, cost = 1780, max = 3, min_day = 0,
                        max_day = 3, camp_max = 3, min_lev = 1, max_lev = 200,
                        sex = 2, classes = 0, min_lev_break = 0,
                        max_lev_break = 1};
get({1, 4}) ->
    #camp_exchange_data{lev = 1, id = 4,
                        item_list =
                            [{22449, 0, 1, 0},
                             {20053, 0, 1, 0},
                             {20755, 0, 1, 0},
                             {20782, 0, 1, 0}],
                        item_gift_name = lang:get("萌兔珍宝礼包"),
                        item_gift_id = 29603, cost = 3280, max = 3, min_day = 0,
                        max_day = 3, camp_max = 3, min_lev = 1, max_lev = 200,
                        sex = 2, classes = 0, min_lev_break = 0,
                        max_lev_break = 1};
get({1, 5}) ->
    #camp_exchange_data{lev = 1, id = 5,
                        item_list =
                            [{20617, 0, 1, 0},
                             {20076, 0, 1, 0},
                             {22617, 0, 1, 0},
                             {20782, 0, 1, 0}],
                        item_gift_name = lang:get("珍品护符礼包"),
                        item_gift_id = 29614, cost = 6580, max = 3, min_day = 0,
                        max_day = 3, camp_max = 3, min_lev = 1, max_lev = 200,
                        sex = 2, classes = 0, min_lev_break = 0,
                        max_lev_break = 1};
get({1, 6}) ->
    #camp_exchange_data{lev = 1, id = 6,
                        item_list =
                            [{21245, 0, 1, 0},
                             {21244, 0, 2, 0},
                             {23733, 0, 20, 0},
                             {20782, 0, 2, 0}],
                        item_gift_name = lang:get("极品宠物礼包"),
                        item_gift_id = 29604, cost = 12800, max = 3,
                        min_day = 0, max_day = 3, camp_max = 3, min_lev = 1,
                        max_lev = 89, sex = 2, classes = 0, min_lev_break = 0,
                        max_lev_break = 1};
get({1, 7}) ->
    #camp_exchange_data{lev = 1, id = 7,
                        item_list =
                            [{21257, 0, 1, 0},
                             {21256, 0, 2, 0},
                             {23733, 0, 20, 0},
                             {20782, 0, 2, 0}],
                        item_gift_name = lang:get("极品宝物礼包"),
                        item_gift_id = 29604, cost = 14800, max = 3,
                        min_day = 0, max_day = 3, camp_max = 3, min_lev = 90,
                        max_lev = 200, sex = 2, classes = 0, min_lev_break = 0,
                        max_lev_break = 1};
get({1, 8}) ->
    #camp_exchange_data{lev = 1, id = 8,
                        item_list =
                            [{20638, 0, 1, 0},
                             {29101, 0, 2, 0},
                             {23119, 0, 1, 0},
                             {20782, 0, 2, 0}],
                        item_gift_name = lang:get("神级宠物礼包"),
                        item_gift_id = 29611, cost = 16800, max = 2,
                        min_day = 0, max_day = 3, camp_max = 2, min_lev = 1,
                        max_lev = 200, sex = 2, classes = 0, min_lev_break = 0,
                        max_lev_break = 1};
get(_) -> false.

