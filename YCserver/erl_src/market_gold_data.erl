-file("src/data/market_gold_data.erl", 1).

-module(market_gold_data).

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

-file("src/data/market_gold_data.erl", 14).

-file("inc/market_gold.hrl", 1).

-record(m_market_gold, {ver = 1, limit_data = []}).

-record(market_gold_item_data,
        {id :: undefined | pos_integer(),
         base_id :: undefined | pos_integer(),
         catalg_1 :: undefined | pos_integer(),
         catalg_2 :: undefined | pos_integer(),
         init_price :: undefined | non_neg_integer(),
         init_stock :: undefined | non_neg_integer(),
         world_lev :: undefined | non_neg_integer(),
         max_price :: undefined | non_neg_integer(),
         min_price :: undefined | non_neg_integer(),
         is_exchange :: undefined | 0 | 1,
         day_limit :: undefined | non_neg_integer(),
         classes :: undefined | non_neg_integer(),
         up_ratio :: undefined | non_neg_integer(),
         down_ratio :: undefined | non_neg_integer()}).

-record(market_gold_item,
        {id :: undefined | pos_integer(),
         base_id = 0 :: pos_integer(),
         stock = 0 :: non_neg_integer(),
         init_stock = 0 :: non_neg_integer(),
         init_price = 0 :: non_neg_integer(),
         def_price = 0 :: non_neg_integer(),
         cur_price = 0 :: non_neg_integer(),
         margin = 1000 :: non_neg_integer(),
         margin_acc = 1000 :: non_neg_integer(),
         day_sold = 0 :: non_neg_integer(),
         day_buy = 0 :: non_neg_integer(),
         ver = 1 :: non_neg_integer()}).

-record(market_gold_change_item,
        {base_id = 0 :: pos_integer(),
         got_list = [] :: list(),
         catalg_1 = 0 :: pos_integer(),
         catalg_2 = 0 :: pos_integer()}).

-record(market_gold_price,
        {base_id = 0,
         margin_type = 0,
         init_price = 0,
         buy_price = 0,
         margin = 0}).

-record(market_gold_limit_data,
        {id = 0,
         min = 0,
         max = 0,
         num = 0,
         is_show = 0,
         type = 0}).

-file("src/data/market_gold_data.erl", 15).

-export([get/1,
         get_all_items/0,
         get_exchange/1,
         get_catalg_world_lev/1,
         get_catalg_items/1,
         get_invisible_price/1,
         get_invisible_world_lev/1,
         get_const_price/1,
         get_const_world_lev/1,
         get_exchange_item/1,
         get_exchange_world_lev/1,
         get_limit/1]).

get_all_items() ->
    [#market_gold_item_data{id = 6, base_id = 20520,
                            catalg_1 = 1, catalg_2 = 2, init_price = 650,
                            init_stock = 600, world_lev = 35, max_price = 1950,
                            min_price = 325, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 7, base_id = 23520,
                            catalg_1 = 1, catalg_2 = 2, init_price = 455,
                            init_stock = 540, world_lev = 35, max_price = 1365,
                            min_price = 227, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 8, base_id = 20521,
                            catalg_1 = 1, catalg_2 = 2, init_price = 650,
                            init_stock = 600, world_lev = 35, max_price = 1950,
                            min_price = 325, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 9, base_id = 23521,
                            catalg_1 = 1, catalg_2 = 2, init_price = 455,
                            init_stock = 540, world_lev = 35, max_price = 1365,
                            min_price = 227, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 10, base_id = 20522,
                            catalg_1 = 1, catalg_2 = 2, init_price = 650,
                            init_stock = 600, world_lev = 35, max_price = 1950,
                            min_price = 325, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 11, base_id = 23522,
                            catalg_1 = 1, catalg_2 = 2, init_price = 455,
                            init_stock = 540, world_lev = 35, max_price = 1365,
                            min_price = 227, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 12, base_id = 20523,
                            catalg_1 = 1, catalg_2 = 2, init_price = 650,
                            init_stock = 600, world_lev = 35, max_price = 1950,
                            min_price = 325, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 13, base_id = 23523,
                            catalg_1 = 1, catalg_2 = 2, init_price = 455,
                            init_stock = 540, world_lev = 35, max_price = 1365,
                            min_price = 227, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 14, base_id = 20524,
                            catalg_1 = 1, catalg_2 = 2, init_price = 650,
                            init_stock = 600, world_lev = 35, max_price = 1950,
                            min_price = 325, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 15, base_id = 23524,
                            catalg_1 = 1, catalg_2 = 2, init_price = 455,
                            init_stock = 540, world_lev = 35, max_price = 1365,
                            min_price = 227, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 16, base_id = 21850,
                            catalg_1 = 1, catalg_2 = 2, init_price = 650,
                            init_stock = 600, world_lev = 35, max_price = 1950,
                            min_price = 325, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 17, base_id = 21851,
                            catalg_1 = 1, catalg_2 = 2, init_price = 455,
                            init_stock = 540, world_lev = 35, max_price = 1365,
                            min_price = 227, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 18, base_id = 21960,
                            catalg_1 = 1, catalg_2 = 2, init_price = 650,
                            init_stock = 600, world_lev = 35, max_price = 1950,
                            min_price = 325, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 19, base_id = 21961,
                            catalg_1 = 1, catalg_2 = 2, init_price = 455,
                            init_stock = 540, world_lev = 35, max_price = 1365,
                            min_price = 227, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 20, base_id = 20525,
                            catalg_1 = 1, catalg_2 = 3, init_price = 2000,
                            init_stock = 600, world_lev = 45, max_price = 6000,
                            min_price = 1000, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 21, base_id = 23525,
                            catalg_1 = 1, catalg_2 = 3, init_price = 1400,
                            init_stock = 540, world_lev = 45, max_price = 4200,
                            min_price = 700, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 22, base_id = 20526,
                            catalg_1 = 1, catalg_2 = 3, init_price = 2000,
                            init_stock = 600, world_lev = 45, max_price = 6000,
                            min_price = 1000, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 23, base_id = 23526,
                            catalg_1 = 1, catalg_2 = 3, init_price = 1400,
                            init_stock = 540, world_lev = 45, max_price = 4200,
                            min_price = 700, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 24, base_id = 20527,
                            catalg_1 = 1, catalg_2 = 3, init_price = 2000,
                            init_stock = 600, world_lev = 45, max_price = 6000,
                            min_price = 1000, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 25, base_id = 23527,
                            catalg_1 = 1, catalg_2 = 3, init_price = 1400,
                            init_stock = 540, world_lev = 45, max_price = 4200,
                            min_price = 700, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 26, base_id = 20528,
                            catalg_1 = 1, catalg_2 = 3, init_price = 2000,
                            init_stock = 600, world_lev = 45, max_price = 6000,
                            min_price = 1000, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 27, base_id = 23528,
                            catalg_1 = 1, catalg_2 = 3, init_price = 1400,
                            init_stock = 540, world_lev = 45, max_price = 4200,
                            min_price = 700, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 28, base_id = 20529,
                            catalg_1 = 1, catalg_2 = 3, init_price = 2000,
                            init_stock = 600, world_lev = 45, max_price = 6000,
                            min_price = 1000, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 29, base_id = 23529,
                            catalg_1 = 1, catalg_2 = 3, init_price = 1400,
                            init_stock = 540, world_lev = 45, max_price = 4200,
                            min_price = 700, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 30, base_id = 21852,
                            catalg_1 = 1, catalg_2 = 3, init_price = 2000,
                            init_stock = 600, world_lev = 45, max_price = 6000,
                            min_price = 1000, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 31, base_id = 21853,
                            catalg_1 = 1, catalg_2 = 3, init_price = 1400,
                            init_stock = 540, world_lev = 45, max_price = 4200,
                            min_price = 700, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 32, base_id = 21962,
                            catalg_1 = 1, catalg_2 = 3, init_price = 2000,
                            init_stock = 600, world_lev = 45, max_price = 6000,
                            min_price = 1000, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 33, base_id = 21963,
                            catalg_1 = 1, catalg_2 = 3, init_price = 1400,
                            init_stock = 540, world_lev = 45, max_price = 4200,
                            min_price = 700, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 34, base_id = 20530,
                            catalg_1 = 1, catalg_2 = 4, init_price = 6000,
                            init_stock = 600, world_lev = 55, max_price = 12000,
                            min_price = 1800, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 35, base_id = 23530,
                            catalg_1 = 1, catalg_2 = 4, init_price = 4200,
                            init_stock = 540, world_lev = 55, max_price = 8400,
                            min_price = 1260, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 36, base_id = 20531,
                            catalg_1 = 1, catalg_2 = 4, init_price = 6000,
                            init_stock = 600, world_lev = 55, max_price = 12000,
                            min_price = 1800, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 37, base_id = 23531,
                            catalg_1 = 1, catalg_2 = 4, init_price = 4200,
                            init_stock = 540, world_lev = 55, max_price = 8400,
                            min_price = 1260, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 38, base_id = 20532,
                            catalg_1 = 1, catalg_2 = 4, init_price = 6000,
                            init_stock = 600, world_lev = 55, max_price = 12000,
                            min_price = 1800, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 39, base_id = 23532,
                            catalg_1 = 1, catalg_2 = 4, init_price = 4200,
                            init_stock = 540, world_lev = 55, max_price = 8400,
                            min_price = 1260, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 40, base_id = 20533,
                            catalg_1 = 1, catalg_2 = 4, init_price = 6000,
                            init_stock = 600, world_lev = 55, max_price = 12000,
                            min_price = 1800, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 41, base_id = 23533,
                            catalg_1 = 1, catalg_2 = 4, init_price = 4200,
                            init_stock = 540, world_lev = 55, max_price = 8400,
                            min_price = 1260, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 42, base_id = 20534,
                            catalg_1 = 1, catalg_2 = 4, init_price = 6000,
                            init_stock = 600, world_lev = 55, max_price = 12000,
                            min_price = 1800, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 43, base_id = 23534,
                            catalg_1 = 1, catalg_2 = 4, init_price = 4200,
                            init_stock = 540, world_lev = 55, max_price = 8400,
                            min_price = 1260, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 44, base_id = 21854,
                            catalg_1 = 1, catalg_2 = 4, init_price = 6000,
                            init_stock = 600, world_lev = 55, max_price = 12000,
                            min_price = 1800, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 45, base_id = 21855,
                            catalg_1 = 1, catalg_2 = 4, init_price = 4200,
                            init_stock = 540, world_lev = 55, max_price = 8400,
                            min_price = 1260, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 46, base_id = 21964,
                            catalg_1 = 1, catalg_2 = 4, init_price = 6000,
                            init_stock = 600, world_lev = 55, max_price = 12000,
                            min_price = 1800, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 47, base_id = 21965,
                            catalg_1 = 1, catalg_2 = 4, init_price = 4200,
                            init_stock = 540, world_lev = 55, max_price = 8400,
                            min_price = 1260, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 48, base_id = 20535,
                            catalg_1 = 1, catalg_2 = 5, init_price = 13000,
                            init_stock = 400, world_lev = 65, max_price = 26000,
                            min_price = 3900, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 49, base_id = 23535,
                            catalg_1 = 1, catalg_2 = 5, init_price = 9000,
                            init_stock = 360, world_lev = 65, max_price = 18000,
                            min_price = 2700, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 50, base_id = 20536,
                            catalg_1 = 1, catalg_2 = 5, init_price = 13000,
                            init_stock = 400, world_lev = 65, max_price = 26000,
                            min_price = 3900, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 51, base_id = 23536,
                            catalg_1 = 1, catalg_2 = 5, init_price = 9000,
                            init_stock = 360, world_lev = 65, max_price = 18000,
                            min_price = 2700, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 52, base_id = 20537,
                            catalg_1 = 1, catalg_2 = 5, init_price = 13000,
                            init_stock = 400, world_lev = 65, max_price = 26000,
                            min_price = 3900, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 53, base_id = 23537,
                            catalg_1 = 1, catalg_2 = 5, init_price = 9000,
                            init_stock = 360, world_lev = 65, max_price = 18000,
                            min_price = 2700, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 54, base_id = 20538,
                            catalg_1 = 1, catalg_2 = 5, init_price = 13000,
                            init_stock = 400, world_lev = 65, max_price = 26000,
                            min_price = 3900, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 55, base_id = 23538,
                            catalg_1 = 1, catalg_2 = 5, init_price = 9000,
                            init_stock = 360, world_lev = 65, max_price = 18000,
                            min_price = 2700, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 56, base_id = 20539,
                            catalg_1 = 1, catalg_2 = 5, init_price = 13000,
                            init_stock = 400, world_lev = 65, max_price = 26000,
                            min_price = 3900, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 57, base_id = 23539,
                            catalg_1 = 1, catalg_2 = 5, init_price = 9000,
                            init_stock = 360, world_lev = 65, max_price = 18000,
                            min_price = 2700, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 58, base_id = 21856,
                            catalg_1 = 1, catalg_2 = 5, init_price = 13000,
                            init_stock = 400, world_lev = 65, max_price = 26000,
                            min_price = 3900, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 59, base_id = 21857,
                            catalg_1 = 1, catalg_2 = 5, init_price = 9000,
                            init_stock = 360, world_lev = 65, max_price = 18000,
                            min_price = 2700, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 60, base_id = 21966,
                            catalg_1 = 1, catalg_2 = 5, init_price = 13000,
                            init_stock = 400, world_lev = 65, max_price = 26000,
                            min_price = 3900, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 61, base_id = 21967,
                            catalg_1 = 1, catalg_2 = 5, init_price = 9000,
                            init_stock = 360, world_lev = 65, max_price = 18000,
                            min_price = 2700, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 62, base_id = 20540,
                            catalg_1 = 1, catalg_2 = 6, init_price = 22000,
                            init_stock = 300, world_lev = 75, max_price = 44000,
                            min_price = 6600, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 63, base_id = 23540,
                            catalg_1 = 1, catalg_2 = 6, init_price = 16500,
                            init_stock = 270, world_lev = 75, max_price = 33000,
                            min_price = 4950, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 64, base_id = 20541,
                            catalg_1 = 1, catalg_2 = 6, init_price = 22000,
                            init_stock = 300, world_lev = 75, max_price = 44000,
                            min_price = 6600, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 65, base_id = 23541,
                            catalg_1 = 1, catalg_2 = 6, init_price = 16500,
                            init_stock = 270, world_lev = 75, max_price = 33000,
                            min_price = 4950, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 66, base_id = 20542,
                            catalg_1 = 1, catalg_2 = 6, init_price = 22000,
                            init_stock = 300, world_lev = 75, max_price = 44000,
                            min_price = 6600, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 67, base_id = 23542,
                            catalg_1 = 1, catalg_2 = 6, init_price = 16500,
                            init_stock = 270, world_lev = 75, max_price = 33000,
                            min_price = 4950, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 68, base_id = 20543,
                            catalg_1 = 1, catalg_2 = 6, init_price = 22000,
                            init_stock = 300, world_lev = 75, max_price = 44000,
                            min_price = 6600, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 69, base_id = 23543,
                            catalg_1 = 1, catalg_2 = 6, init_price = 16500,
                            init_stock = 270, world_lev = 75, max_price = 33000,
                            min_price = 4950, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 70, base_id = 20544,
                            catalg_1 = 1, catalg_2 = 6, init_price = 22000,
                            init_stock = 300, world_lev = 75, max_price = 44000,
                            min_price = 6600, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 71, base_id = 23544,
                            catalg_1 = 1, catalg_2 = 6, init_price = 16500,
                            init_stock = 270, world_lev = 75, max_price = 33000,
                            min_price = 4950, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 72, base_id = 21858,
                            catalg_1 = 1, catalg_2 = 6, init_price = 22000,
                            init_stock = 300, world_lev = 75, max_price = 44000,
                            min_price = 6600, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 73, base_id = 21859,
                            catalg_1 = 1, catalg_2 = 6, init_price = 16500,
                            init_stock = 270, world_lev = 75, max_price = 33000,
                            min_price = 4950, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 74, base_id = 21968,
                            catalg_1 = 1, catalg_2 = 6, init_price = 22000,
                            init_stock = 300, world_lev = 75, max_price = 44000,
                            min_price = 6600, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 75, base_id = 21969,
                            catalg_1 = 1, catalg_2 = 6, init_price = 16500,
                            init_stock = 270, world_lev = 75, max_price = 33000,
                            min_price = 4950, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 76, base_id = 20555,
                            catalg_1 = 1, catalg_2 = 13, init_price = 27000,
                            init_stock = 300, world_lev = 85, max_price = 54000,
                            min_price = 8100, classes = 0, up_ratio = 1000,
                            down_ratio = 1500},
     #market_gold_item_data{id = 77, base_id = 23545,
                            catalg_1 = 1, catalg_2 = 13, init_price = 23400,
                            init_stock = 270, world_lev = 85, max_price = 46800,
                            min_price = 7020, classes = 0, up_ratio = 1000,
                            down_ratio = 1500},
     #market_gold_item_data{id = 78, base_id = 20556,
                            catalg_1 = 1, catalg_2 = 13, init_price = 27000,
                            init_stock = 300, world_lev = 85, max_price = 54000,
                            min_price = 8100, classes = 0, up_ratio = 1000,
                            down_ratio = 1500},
     #market_gold_item_data{id = 79, base_id = 23546,
                            catalg_1 = 1, catalg_2 = 13, init_price = 23400,
                            init_stock = 270, world_lev = 85, max_price = 46800,
                            min_price = 7020, classes = 0, up_ratio = 1000,
                            down_ratio = 1500},
     #market_gold_item_data{id = 80, base_id = 20557,
                            catalg_1 = 1, catalg_2 = 13, init_price = 27000,
                            init_stock = 300, world_lev = 85, max_price = 54000,
                            min_price = 8100, classes = 0, up_ratio = 1000,
                            down_ratio = 1500},
     #market_gold_item_data{id = 81, base_id = 23547,
                            catalg_1 = 1, catalg_2 = 13, init_price = 23400,
                            init_stock = 270, world_lev = 85, max_price = 46800,
                            min_price = 7020, classes = 0, up_ratio = 1000,
                            down_ratio = 1500},
     #market_gold_item_data{id = 82, base_id = 20558,
                            catalg_1 = 1, catalg_2 = 13, init_price = 27000,
                            init_stock = 300, world_lev = 85, max_price = 54000,
                            min_price = 8100, classes = 0, up_ratio = 1000,
                            down_ratio = 1500},
     #market_gold_item_data{id = 83, base_id = 23548,
                            catalg_1 = 1, catalg_2 = 13, init_price = 23400,
                            init_stock = 270, world_lev = 85, max_price = 46800,
                            min_price = 7020, classes = 0, up_ratio = 1000,
                            down_ratio = 1500},
     #market_gold_item_data{id = 84, base_id = 20559,
                            catalg_1 = 1, catalg_2 = 13, init_price = 27000,
                            init_stock = 300, world_lev = 85, max_price = 54000,
                            min_price = 8100, classes = 0, up_ratio = 1000,
                            down_ratio = 1500},
     #market_gold_item_data{id = 85, base_id = 23549,
                            catalg_1 = 1, catalg_2 = 13, init_price = 23400,
                            init_stock = 270, world_lev = 85, max_price = 46800,
                            min_price = 7020, classes = 0, up_ratio = 1000,
                            down_ratio = 1500},
     #market_gold_item_data{id = 86, base_id = 21860,
                            catalg_1 = 1, catalg_2 = 13, init_price = 27000,
                            init_stock = 300, world_lev = 85, max_price = 54000,
                            min_price = 8100, classes = 0, up_ratio = 1000,
                            down_ratio = 1500},
     #market_gold_item_data{id = 87, base_id = 21861,
                            catalg_1 = 1, catalg_2 = 13, init_price = 23400,
                            init_stock = 270, world_lev = 85, max_price = 46800,
                            min_price = 7020, classes = 0, up_ratio = 1000,
                            down_ratio = 1500},
     #market_gold_item_data{id = 88, base_id = 21970,
                            catalg_1 = 1, catalg_2 = 13, init_price = 27000,
                            init_stock = 300, world_lev = 85, max_price = 54000,
                            min_price = 8100, classes = 0, up_ratio = 1000,
                            down_ratio = 1500},
     #market_gold_item_data{id = 89, base_id = 21971,
                            catalg_1 = 1, catalg_2 = 13, init_price = 23400,
                            init_stock = 270, world_lev = 85, max_price = 46800,
                            min_price = 7020, classes = 0, up_ratio = 1000,
                            down_ratio = 1500},
     #market_gold_item_data{id = 90, base_id = 21801,
                            catalg_1 = 1, catalg_2 = 15, init_price = 30000,
                            init_stock = 600, world_lev = 100,
                            max_price = 60000, min_price = 9000, classes = 0,
                            up_ratio = 1000, down_ratio = 1800},
     #market_gold_item_data{id = 91, base_id = 21806,
                            catalg_1 = 1, catalg_2 = 15, init_price = 27000,
                            init_stock = 540, world_lev = 100,
                            max_price = 54000, min_price = 8100, classes = 0,
                            up_ratio = 1000, down_ratio = 1800},
     #market_gold_item_data{id = 92, base_id = 21802,
                            catalg_1 = 1, catalg_2 = 15, init_price = 30000,
                            init_stock = 600, world_lev = 100,
                            max_price = 60000, min_price = 9000, classes = 0,
                            up_ratio = 1000, down_ratio = 1800},
     #market_gold_item_data{id = 93, base_id = 21807,
                            catalg_1 = 1, catalg_2 = 15, init_price = 27000,
                            init_stock = 540, world_lev = 100,
                            max_price = 54000, min_price = 8100, classes = 0,
                            up_ratio = 1000, down_ratio = 1800},
     #market_gold_item_data{id = 94, base_id = 21803,
                            catalg_1 = 1, catalg_2 = 15, init_price = 30000,
                            init_stock = 600, world_lev = 100,
                            max_price = 60000, min_price = 9000, classes = 0,
                            up_ratio = 1000, down_ratio = 1800},
     #market_gold_item_data{id = 95, base_id = 21808,
                            catalg_1 = 1, catalg_2 = 15, init_price = 27000,
                            init_stock = 540, world_lev = 100,
                            max_price = 54000, min_price = 8100, classes = 0,
                            up_ratio = 1000, down_ratio = 1800},
     #market_gold_item_data{id = 96, base_id = 21804,
                            catalg_1 = 1, catalg_2 = 15, init_price = 30000,
                            init_stock = 600, world_lev = 100,
                            max_price = 60000, min_price = 9000, classes = 0,
                            up_ratio = 1000, down_ratio = 1800},
     #market_gold_item_data{id = 97, base_id = 21809,
                            catalg_1 = 1, catalg_2 = 15, init_price = 27000,
                            init_stock = 540, world_lev = 100,
                            max_price = 54000, min_price = 8100, classes = 0,
                            up_ratio = 1000, down_ratio = 1800},
     #market_gold_item_data{id = 98, base_id = 21805,
                            catalg_1 = 1, catalg_2 = 15, init_price = 30000,
                            init_stock = 600, world_lev = 100,
                            max_price = 60000, min_price = 9000, classes = 0,
                            up_ratio = 1000, down_ratio = 1800},
     #market_gold_item_data{id = 99, base_id = 21810,
                            catalg_1 = 1, catalg_2 = 15, init_price = 27000,
                            init_stock = 540, world_lev = 100,
                            max_price = 54000, min_price = 8100, classes = 0,
                            up_ratio = 1000, down_ratio = 1800},
     #market_gold_item_data{id = 100, base_id = 21862,
                            catalg_1 = 1, catalg_2 = 15, init_price = 30000,
                            init_stock = 600, world_lev = 100,
                            max_price = 60000, min_price = 9000, classes = 0,
                            up_ratio = 1000, down_ratio = 1800},
     #market_gold_item_data{id = 101, base_id = 21863,
                            catalg_1 = 1, catalg_2 = 15, init_price = 27000,
                            init_stock = 540, world_lev = 100,
                            max_price = 54000, min_price = 8100, classes = 0,
                            up_ratio = 1000, down_ratio = 1800},
     #market_gold_item_data{id = 102, base_id = 21972,
                            catalg_1 = 1, catalg_2 = 15, init_price = 30000,
                            init_stock = 600, world_lev = 100,
                            max_price = 60000, min_price = 9000, classes = 0,
                            up_ratio = 1000, down_ratio = 1800},
     #market_gold_item_data{id = 103, base_id = 21973,
                            catalg_1 = 1, catalg_2 = 15, init_price = 27000,
                            init_stock = 540, world_lev = 100,
                            max_price = 54000, min_price = 8100, classes = 0,
                            up_ratio = 1000, down_ratio = 1800},
     #market_gold_item_data{id = 104, base_id = 22010,
                            catalg_1 = 1, catalg_2 = 16, init_price = 36000,
                            init_stock = 600, world_lev = 105,
                            max_price = 72000, min_price = 10000, classes = 0,
                            up_ratio = 1000, down_ratio = 2000},
     #market_gold_item_data{id = 105, base_id = 22011,
                            catalg_1 = 1, catalg_2 = 16, init_price = 36000,
                            init_stock = 600, world_lev = 105,
                            max_price = 72000, min_price = 10000, classes = 0,
                            up_ratio = 1000, down_ratio = 2000},
     #market_gold_item_data{id = 106, base_id = 22012,
                            catalg_1 = 1, catalg_2 = 16, init_price = 36000,
                            init_stock = 600, world_lev = 105,
                            max_price = 72000, min_price = 10000, classes = 0,
                            up_ratio = 1000, down_ratio = 2000},
     #market_gold_item_data{id = 107, base_id = 22013,
                            catalg_1 = 1, catalg_2 = 16, init_price = 36000,
                            init_stock = 600, world_lev = 105,
                            max_price = 72000, min_price = 10000, classes = 0,
                            up_ratio = 1000, down_ratio = 2000},
     #market_gold_item_data{id = 108, base_id = 22014,
                            catalg_1 = 1, catalg_2 = 16, init_price = 36000,
                            init_stock = 600, world_lev = 105,
                            max_price = 72000, min_price = 10000, classes = 0,
                            up_ratio = 1000, down_ratio = 2000},
     #market_gold_item_data{id = 109, base_id = 22015,
                            catalg_1 = 1, catalg_2 = 16, init_price = 36000,
                            init_stock = 600, world_lev = 105,
                            max_price = 72000, min_price = 10000, classes = 0,
                            up_ratio = 1000, down_ratio = 2000},
     #market_gold_item_data{id = 110, base_id = 21974,
                            catalg_1 = 1, catalg_2 = 16, init_price = 36000,
                            init_stock = 600, world_lev = 105,
                            max_price = 72000, min_price = 10000, classes = 0,
                            up_ratio = 1000, down_ratio = 2000},
     #market_gold_item_data{id = 111, base_id = 22016,
                            catalg_1 = 1, catalg_2 = 16, init_price = 32400,
                            init_stock = 540, world_lev = 105,
                            max_price = 64800, min_price = 8500, classes = 0,
                            up_ratio = 1000, down_ratio = 2000},
     #market_gold_item_data{id = 112, base_id = 22017,
                            catalg_1 = 1, catalg_2 = 16, init_price = 32400,
                            init_stock = 540, world_lev = 105,
                            max_price = 64800, min_price = 8500, classes = 0,
                            up_ratio = 1000, down_ratio = 2000},
     #market_gold_item_data{id = 113, base_id = 22018,
                            catalg_1 = 1, catalg_2 = 16, init_price = 32400,
                            init_stock = 540, world_lev = 105,
                            max_price = 64800, min_price = 8500, classes = 0,
                            up_ratio = 1000, down_ratio = 2000},
     #market_gold_item_data{id = 114, base_id = 22019,
                            catalg_1 = 1, catalg_2 = 16, init_price = 32400,
                            init_stock = 540, world_lev = 105,
                            max_price = 64800, min_price = 8500, classes = 0,
                            up_ratio = 1000, down_ratio = 2000},
     #market_gold_item_data{id = 115, base_id = 22020,
                            catalg_1 = 1, catalg_2 = 16, init_price = 32400,
                            init_stock = 540, world_lev = 105,
                            max_price = 64800, min_price = 8500, classes = 0,
                            up_ratio = 1000, down_ratio = 2000},
     #market_gold_item_data{id = 116, base_id = 22021,
                            catalg_1 = 1, catalg_2 = 16, init_price = 32400,
                            init_stock = 540, world_lev = 105,
                            max_price = 64800, min_price = 8500, classes = 0,
                            up_ratio = 1000, down_ratio = 2000},
     #market_gold_item_data{id = 117, base_id = 21975,
                            catalg_1 = 1, catalg_2 = 16, init_price = 32400,
                            init_stock = 540, world_lev = 105,
                            max_price = 64800, min_price = 8500, classes = 0,
                            up_ratio = 1000, down_ratio = 2000},
     #market_gold_item_data{id = 118, base_id = 22030,
                            catalg_1 = 1, catalg_2 = 17, init_price = 43200,
                            init_stock = 600, world_lev = 110,
                            max_price = 86400, min_price = 12000, classes = 0,
                            up_ratio = 1000, down_ratio = 1000},
     #market_gold_item_data{id = 119, base_id = 22031,
                            catalg_1 = 1, catalg_2 = 17, init_price = 43200,
                            init_stock = 600, world_lev = 110,
                            max_price = 86400, min_price = 12000, classes = 0,
                            up_ratio = 1000, down_ratio = 1000},
     #market_gold_item_data{id = 120, base_id = 22032,
                            catalg_1 = 1, catalg_2 = 17, init_price = 43200,
                            init_stock = 600, world_lev = 110,
                            max_price = 86400, min_price = 12000, classes = 0,
                            up_ratio = 1000, down_ratio = 1000},
     #market_gold_item_data{id = 121, base_id = 22033,
                            catalg_1 = 1, catalg_2 = 17, init_price = 43200,
                            init_stock = 600, world_lev = 110,
                            max_price = 86400, min_price = 12000, classes = 0,
                            up_ratio = 1000, down_ratio = 1000},
     #market_gold_item_data{id = 122, base_id = 22034,
                            catalg_1 = 1, catalg_2 = 17, init_price = 43200,
                            init_stock = 600, world_lev = 110,
                            max_price = 86400, min_price = 12000, classes = 0,
                            up_ratio = 1000, down_ratio = 1000},
     #market_gold_item_data{id = 123, base_id = 22035,
                            catalg_1 = 1, catalg_2 = 17, init_price = 43200,
                            init_stock = 600, world_lev = 110,
                            max_price = 86400, min_price = 12000, classes = 0,
                            up_ratio = 1000, down_ratio = 1000},
     #market_gold_item_data{id = 124, base_id = 22036,
                            catalg_1 = 1, catalg_2 = 17, init_price = 43200,
                            init_stock = 600, world_lev = 110,
                            max_price = 86400, min_price = 12000, classes = 0,
                            up_ratio = 1000, down_ratio = 1000},
     #market_gold_item_data{id = 125, base_id = 22037,
                            catalg_1 = 1, catalg_2 = 17, init_price = 38880,
                            init_stock = 540, world_lev = 110,
                            max_price = 77760, min_price = 10000, classes = 0,
                            up_ratio = 1000, down_ratio = 1000},
     #market_gold_item_data{id = 126, base_id = 22038,
                            catalg_1 = 1, catalg_2 = 17, init_price = 38880,
                            init_stock = 540, world_lev = 110,
                            max_price = 77760, min_price = 10000, classes = 0,
                            up_ratio = 1000, down_ratio = 1000},
     #market_gold_item_data{id = 127, base_id = 22039,
                            catalg_1 = 1, catalg_2 = 17, init_price = 38880,
                            init_stock = 540, world_lev = 110,
                            max_price = 77760, min_price = 10000, classes = 0,
                            up_ratio = 1000, down_ratio = 1000},
     #market_gold_item_data{id = 128, base_id = 22040,
                            catalg_1 = 1, catalg_2 = 17, init_price = 38880,
                            init_stock = 540, world_lev = 110,
                            max_price = 77760, min_price = 10000, classes = 0,
                            up_ratio = 1000, down_ratio = 1000},
     #market_gold_item_data{id = 129, base_id = 22041,
                            catalg_1 = 1, catalg_2 = 17, init_price = 38880,
                            init_stock = 540, world_lev = 110,
                            max_price = 77760, min_price = 10000, classes = 0,
                            up_ratio = 1000, down_ratio = 1000},
     #market_gold_item_data{id = 130, base_id = 22042,
                            catalg_1 = 1, catalg_2 = 17, init_price = 38880,
                            init_stock = 540, world_lev = 110,
                            max_price = 77760, min_price = 10000, classes = 0,
                            up_ratio = 1000, down_ratio = 1000},
     #market_gold_item_data{id = 131, base_id = 22043,
                            catalg_1 = 1, catalg_2 = 17, init_price = 38880,
                            init_stock = 540, world_lev = 110,
                            max_price = 77760, min_price = 10000, classes = 0,
                            up_ratio = 1000, down_ratio = 1000},
     #market_gold_item_data{id = 66, base_id = 20800,
                            catalg_1 = 2, catalg_2 = 11, init_price = 900,
                            init_stock = 5000, world_lev = 35, max_price = 1800,
                            min_price = 450, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 67, base_id = 20801,
                            catalg_1 = 2, catalg_2 = 11, init_price = 1200,
                            init_stock = 5000, world_lev = 35, max_price = 2400,
                            min_price = 600, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 68, base_id = 20802,
                            catalg_1 = 2, catalg_2 = 11, init_price = 900,
                            init_stock = 5000, world_lev = 35, max_price = 1800,
                            min_price = 450, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 69, base_id = 20803,
                            catalg_1 = 2, catalg_2 = 11, init_price = 800,
                            init_stock = 5000, world_lev = 35, max_price = 1600,
                            min_price = 400, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 70, base_id = 20804,
                            catalg_1 = 2, catalg_2 = 11, init_price = 800,
                            init_stock = 5000, world_lev = 35, max_price = 1600,
                            min_price = 400, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 71, base_id = 20805,
                            catalg_1 = 2, catalg_2 = 11, init_price = 900,
                            init_stock = 5000, world_lev = 35, max_price = 1800,
                            min_price = 450, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 72, base_id = 20806,
                            catalg_1 = 2, catalg_2 = 11, init_price = 800,
                            init_stock = 5000, world_lev = 35, max_price = 1600,
                            min_price = 400, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 73, base_id = 20807,
                            catalg_1 = 2, catalg_2 = 11, init_price = 1000,
                            init_stock = 5000, world_lev = 35, max_price = 2000,
                            min_price = 500, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 74, base_id = 20093,
                            catalg_1 = 2, catalg_2 = 12, init_price = 3800,
                            init_stock = 100000, world_lev = 40,
                            max_price = 3800, min_price = 3800, classes = 0,
                            up_ratio = 1000, down_ratio = 1000},
     #market_gold_item_data{id = 75, base_id = 20094,
                            catalg_1 = 2, catalg_2 = 12, init_price = 9400,
                            init_stock = 100000, world_lev = 60,
                            max_price = 9400, min_price = 9400, classes = 0,
                            up_ratio = 1000, down_ratio = 1000},
     #market_gold_item_data{id = 76, base_id = 20020,
                            catalg_1 = 2, catalg_2 = 12, init_price = 1000,
                            init_stock = 2000, world_lev = 45, max_price = 1500,
                            min_price = 1000, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 83, base_id = 20400,
                            catalg_1 = 2, catalg_2 = 12, init_price = 2500,
                            init_stock = 1000, world_lev = 85, max_price = 5500,
                            min_price = 2000, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 77, base_id = 20008,
                            catalg_1 = 2, catalg_2 = 12, init_price = 3000,
                            init_stock = 2000, world_lev = 45,
                            max_price = 10800, min_price = 2200, classes = 0,
                            up_ratio = 1000, down_ratio = 1000},
     #market_gold_item_data{id = 84, base_id = 20405,
                            catalg_1 = 2, catalg_2 = 12, init_price = 25000,
                            init_stock = 100, world_lev = 85, max_price = 25000,
                            min_price = 25000, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 86, base_id = 20406,
                            catalg_1 = 2, catalg_2 = 12, init_price = 20000,
                            init_stock = 100, world_lev = 85, max_price = 20000,
                            min_price = 20000, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 78, base_id = 29006,
                            catalg_1 = 2, catalg_2 = 12, init_price = 2500,
                            init_stock = 800, world_lev = 35, max_price = 6000,
                            min_price = 1500, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 79, base_id = 29007,
                            catalg_1 = 2, catalg_2 = 12, init_price = 9000,
                            init_stock = 800, world_lev = 85, max_price = 24000,
                            min_price = 6000, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 80, base_id = 20653,
                            catalg_1 = 2, catalg_2 = 14, init_price = 4500,
                            init_stock = 1000, world_lev = 75, max_price = 5400,
                            min_price = 3150, day_limit = 9, classes = 0,
                            up_ratio = 1000, down_ratio = 1000},
     #market_gold_item_data{id = 81, base_id = 20654,
                            catalg_1 = 2, catalg_2 = 14, init_price = 2250,
                            init_stock = 1000, world_lev = 75, max_price = 2700,
                            min_price = 1575, day_limit = 36, classes = 0,
                            up_ratio = 1000, down_ratio = 1000},
     #market_gold_item_data{id = 82, base_id = 20655,
                            catalg_1 = 2, catalg_2 = 14, init_price = 2250,
                            init_stock = 1000, world_lev = 75, max_price = 2700,
                            min_price = 1575, day_limit = 27, classes = 0,
                            up_ratio = 1000, down_ratio = 1000},
     #market_gold_item_data{id = 85, base_id = 20021,
                            catalg_1 = 2, catalg_2 = 12, init_price = 2000,
                            init_stock = 100000, world_lev = 40,
                            max_price = 2000, min_price = 2000, day_limit = 12,
                            classes = 0, up_ratio = 1000, down_ratio = 1000},
     #market_gold_item_data{id = 1, base_id = 20038,
                            catalg_1 = 3, catalg_2 = 9, init_price = 20000,
                            init_stock = 9999999, world_lev = 35,
                            max_price = 20000, min_price = 20000, classes = 0,
                            up_ratio = 1000, down_ratio = 1000},
     #market_gold_item_data{id = 2, base_id = 20095,
                            catalg_1 = 3, catalg_2 = 9, init_price = 11500,
                            init_stock = 9999999, world_lev = 35,
                            max_price = 11500, min_price = 11500, classes = 0,
                            up_ratio = 1000, down_ratio = 1000},
     #market_gold_item_data{id = 3, base_id = 20004,
                            catalg_1 = 3, catalg_2 = 9, init_price = 900,
                            init_stock = 2000, world_lev = 35, max_price = 2700,
                            min_price = 603, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 4, base_id = 20612,
                            catalg_1 = 3, catalg_2 = 9, init_price = 2500,
                            init_stock = 1500, world_lev = 35, max_price = 4000,
                            min_price = 750, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 5, base_id = 20603,
                            catalg_1 = 3, catalg_2 = 9, init_price = 2500,
                            init_stock = 1500, world_lev = 35, max_price = 4000,
                            min_price = 750, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 6, base_id = 20606,
                            catalg_1 = 3, catalg_2 = 9, init_price = 2500,
                            init_stock = 1500, world_lev = 35, max_price = 4000,
                            min_price = 750, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 7, base_id = 20600,
                            catalg_1 = 3, catalg_2 = 9, init_price = 2500,
                            init_stock = 1500, world_lev = 35, max_price = 4000,
                            min_price = 750, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 8, base_id = 20615,
                            catalg_1 = 3, catalg_2 = 9, init_price = 5000,
                            init_stock = 800, world_lev = 35, max_price = 15000,
                            min_price = 2000, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 10, base_id = 20039,
                            catalg_1 = 3, catalg_2 = 9, init_price = 5000,
                            init_stock = 1000, world_lev = 35,
                            max_price = 10000, min_price = 3000, classes = 0,
                            up_ratio = 1000, down_ratio = 1000},
     #market_gold_item_data{id = 9, base_id = 20040,
                            catalg_1 = 3, catalg_2 = 9, init_price = 15000,
                            init_stock = 1000, world_lev = 60,
                            max_price = 22000, min_price = 5000, classes = 0,
                            up_ratio = 1000, down_ratio = 1000},
     #market_gold_item_data{id = 16, base_id = 20036,
                            catalg_1 = 3, catalg_2 = 9, init_price = 25000,
                            init_stock = 1000, world_lev = 80,
                            max_price = 33000, min_price = 8000, classes = 0,
                            up_ratio = 1000, down_ratio = 1000},
     #market_gold_item_data{id = 11, base_id = 20074,
                            catalg_1 = 3, catalg_2 = 9, init_price = 3000,
                            init_stock = 1000, world_lev = 35, max_price = 6000,
                            min_price = 1500, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 12, base_id = 20075,
                            catalg_1 = 3, catalg_2 = 9, init_price = 12000,
                            init_stock = 1000, world_lev = 45,
                            max_price = 24000, min_price = 6000, classes = 0,
                            up_ratio = 1000, down_ratio = 1000},
     #market_gold_item_data{id = 13, base_id = 20076,
                            catalg_1 = 3, catalg_2 = 9, init_price = 48000,
                            init_stock = 500, world_lev = 55, max_price = 96000,
                            min_price = 24000, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 24, base_id = 20639,
                            catalg_1 = 3, catalg_2 = 9, init_price = 128000,
                            init_stock = 500, world_lev = 75,
                            max_price = 128000, min_price = 128000, classes = 0,
                            up_ratio = 1000, down_ratio = 1000},
     #market_gold_item_data{id = 14, base_id = 20618,
                            catalg_1 = 3, catalg_2 = 9, init_price = 2000,
                            init_stock = 2000, world_lev = 40, max_price = 4000,
                            min_price = 1000, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 15, base_id = 20007,
                            catalg_1 = 3, catalg_2 = 9, init_price = 3000,
                            init_stock = 9999999, world_lev = 35,
                            max_price = 3000, min_price = 3000, classes = 0,
                            up_ratio = 1000, down_ratio = 1000},
     #market_gold_item_data{id = 17, base_id = 21132,
                            catalg_1 = 3, catalg_2 = 9, init_price = 45000,
                            init_stock = 9999999, world_lev = 35,
                            max_price = 45000, min_price = 45000, classes = 0,
                            up_ratio = 1000, down_ratio = 1000},
     #market_gold_item_data{id = 18, base_id = 23760,
                            catalg_1 = 3, catalg_2 = 9, init_price = 15000,
                            init_stock = 9999999, world_lev = 60,
                            max_price = 15000, min_price = 15000, classes = 0,
                            up_ratio = 1000, down_ratio = 1000},
     #market_gold_item_data{id = 19, base_id = 23762,
                            catalg_1 = 3, catalg_2 = 9, init_price = 30000,
                            init_stock = 9999999, world_lev = 70,
                            max_price = 30000, min_price = 30000, classes = 0,
                            up_ratio = 1000, down_ratio = 1000},
     #market_gold_item_data{id = 20, base_id = 23764,
                            catalg_1 = 3, catalg_2 = 9, init_price = 50000,
                            init_stock = 9999999, world_lev = 80,
                            max_price = 50000, min_price = 50000, classes = 0,
                            up_ratio = 1000, down_ratio = 1000},
     #market_gold_item_data{id = 21, base_id = 23766,
                            catalg_1 = 3, catalg_2 = 9, init_price = 75000,
                            init_stock = 9999999, world_lev = 90,
                            max_price = 75000, min_price = 75000, classes = 0,
                            up_ratio = 1000, down_ratio = 1000},
     #market_gold_item_data{id = 22, base_id = 23768,
                            catalg_1 = 3, catalg_2 = 9, init_price = 100000,
                            init_stock = 9999999, world_lev = 95,
                            max_price = 100000, min_price = 100000, classes = 0,
                            up_ratio = 1000, down_ratio = 1000},
     #market_gold_item_data{id = 23, base_id = 23772,
                            catalg_1 = 3, catalg_2 = 9, init_price = 125000,
                            init_stock = 9999999, world_lev = 105,
                            max_price = 125000, min_price = 125000, classes = 0,
                            up_ratio = 1000, down_ratio = 1000},
     #market_gold_item_data{id = 24, base_id = 70211,
                            catalg_1 = 3, catalg_2 = 9, init_price = 20000,
                            init_stock = 9999999, world_lev = 85,
                            max_price = 20000, min_price = 20000, classes = 0,
                            up_ratio = 1000, down_ratio = 1000},
     #market_gold_item_data{id = 11, base_id = 20171,
                            catalg_1 = 3, catalg_2 = 8, init_price = 60000,
                            init_stock = 15, world_lev = 35, max_price = 144000,
                            min_price = 18000, classes = 0, up_ratio = 1000,
                            down_ratio = 500},
     #market_gold_item_data{id = 12, base_id = 20240,
                            catalg_1 = 3, catalg_2 = 8, init_price = 70000,
                            init_stock = 12, world_lev = 35, max_price = 168000,
                            min_price = 21000, classes = 0, up_ratio = 1000,
                            down_ratio = 500},
     #market_gold_item_data{id = 13, base_id = 20242,
                            catalg_1 = 3, catalg_2 = 8, init_price = 70000,
                            init_stock = 12, world_lev = 35, max_price = 168000,
                            min_price = 21000, classes = 0, up_ratio = 1000,
                            down_ratio = 500},
     #market_gold_item_data{id = 14, base_id = 20229,
                            catalg_1 = 3, catalg_2 = 8, init_price = 50000,
                            init_stock = 12, world_lev = 35, max_price = 120000,
                            min_price = 15000, classes = 0, up_ratio = 1000,
                            down_ratio = 500},
     #market_gold_item_data{id = 15, base_id = 20237,
                            catalg_1 = 3, catalg_2 = 8, init_price = 55000,
                            init_stock = 12, world_lev = 35, max_price = 132000,
                            min_price = 16500, classes = 0, up_ratio = 1000,
                            down_ratio = 500},
     #market_gold_item_data{id = 16, base_id = 20241,
                            catalg_1 = 3, catalg_2 = 8, init_price = 45000,
                            init_stock = 12, world_lev = 35, max_price = 108000,
                            min_price = 13500, classes = 0, up_ratio = 1000,
                            down_ratio = 500},
     #market_gold_item_data{id = 17, base_id = 20243,
                            catalg_1 = 3, catalg_2 = 8, init_price = 36000,
                            init_stock = 12, world_lev = 35, max_price = 86400,
                            min_price = 10800, classes = 0, up_ratio = 1000,
                            down_ratio = 500},
     #market_gold_item_data{id = 18, base_id = 20119,
                            catalg_1 = 3, catalg_2 = 8, init_price = 36000,
                            init_stock = 10, world_lev = 35, max_price = 86400,
                            min_price = 10800, classes = 0, up_ratio = 1000,
                            down_ratio = 500},
     #market_gold_item_data{id = 19, base_id = 20203,
                            catalg_1 = 3, catalg_2 = 8, init_price = 36000,
                            init_stock = 12, world_lev = 35, max_price = 86400,
                            min_price = 10800, classes = 0, up_ratio = 1000,
                            down_ratio = 500},
     #market_gold_item_data{id = 20, base_id = 20238,
                            catalg_1 = 3, catalg_2 = 8, init_price = 36000,
                            init_stock = 12, world_lev = 35, max_price = 86400,
                            min_price = 10800, classes = 0, up_ratio = 1000,
                            down_ratio = 500},
     #market_gold_item_data{id = 21, base_id = 20227,
                            catalg_1 = 3, catalg_2 = 8, init_price = 46000,
                            init_stock = 12, world_lev = 35, max_price = 92000,
                            min_price = 23000, classes = 0, up_ratio = 1000,
                            down_ratio = 500},
     #market_gold_item_data{id = 22, base_id = 20236,
                            catalg_1 = 3, catalg_2 = 8, init_price = 46000,
                            init_stock = 12, world_lev = 35, max_price = 110400,
                            min_price = 13800, classes = 0, up_ratio = 1000,
                            down_ratio = 500},
     #market_gold_item_data{id = 23, base_id = 20204,
                            catalg_1 = 3, catalg_2 = 8, init_price = 33000,
                            init_stock = 25, world_lev = 35, max_price = 79200,
                            min_price = 9900, classes = 0, up_ratio = 1000,
                            down_ratio = 500},
     #market_gold_item_data{id = 24, base_id = 20226,
                            catalg_1 = 3, catalg_2 = 8, init_price = 46000,
                            init_stock = 25, world_lev = 35, max_price = 92000,
                            min_price = 23000, classes = 0, up_ratio = 1000,
                            down_ratio = 500},
     #market_gold_item_data{id = 25, base_id = 20239,
                            catalg_1 = 3, catalg_2 = 8, init_price = 33000,
                            init_stock = 25, world_lev = 35, max_price = 79200,
                            min_price = 9900, classes = 0, up_ratio = 1000,
                            down_ratio = 500},
     #market_gold_item_data{id = 26, base_id = 20251,
                            catalg_1 = 3, catalg_2 = 8, init_price = 35000,
                            init_stock = 25, world_lev = 35, max_price = 84000,
                            min_price = 10500, classes = 0, up_ratio = 1000,
                            down_ratio = 500},
     #market_gold_item_data{id = 27, base_id = 20230,
                            catalg_1 = 3, catalg_2 = 8, init_price = 28000,
                            init_stock = 25, world_lev = 35, max_price = 67200,
                            min_price = 8400, classes = 0, up_ratio = 1000,
                            down_ratio = 500},
     #market_gold_item_data{id = 28, base_id = 20116,
                            catalg_1 = 3, catalg_2 = 8, init_price = 20000,
                            init_stock = 25, world_lev = 35, max_price = 48000,
                            min_price = 6000, classes = 0, up_ratio = 1000,
                            down_ratio = 500},
     #market_gold_item_data{id = 29, base_id = 20115,
                            catalg_1 = 3, catalg_2 = 8, init_price = 20000,
                            init_stock = 25, world_lev = 35, max_price = 48000,
                            min_price = 6000, classes = 0, up_ratio = 1000,
                            down_ratio = 500},
     #market_gold_item_data{id = 30, base_id = 20114,
                            catalg_1 = 3, catalg_2 = 8, init_price = 20000,
                            init_stock = 25, world_lev = 35, max_price = 48000,
                            min_price = 6000, classes = 0, up_ratio = 1000,
                            down_ratio = 500},
     #market_gold_item_data{id = 31, base_id = 20202,
                            catalg_1 = 3, catalg_2 = 8, init_price = 15000,
                            init_stock = 25, world_lev = 35, max_price = 36000,
                            min_price = 4500, classes = 0, up_ratio = 1000,
                            down_ratio = 500},
     #market_gold_item_data{id = 32, base_id = 20231,
                            catalg_1 = 3, catalg_2 = 8, init_price = 28000,
                            init_stock = 25, world_lev = 35, max_price = 67200,
                            min_price = 8400, classes = 0, up_ratio = 1000,
                            down_ratio = 500},
     #market_gold_item_data{id = 33, base_id = 20252,
                            catalg_1 = 3, catalg_2 = 8, init_price = 16000,
                            init_stock = 30, world_lev = 35, max_price = 48000,
                            min_price = 4800, classes = 0, up_ratio = 1000,
                            down_ratio = 500},
     #market_gold_item_data{id = 34, base_id = 20249,
                            catalg_1 = 3, catalg_2 = 8, init_price = 15000,
                            init_stock = 30, world_lev = 35, max_price = 30000,
                            min_price = 7500, classes = 0, up_ratio = 1000,
                            down_ratio = 500},
     #market_gold_item_data{id = 35, base_id = 20248,
                            catalg_1 = 3, catalg_2 = 8, init_price = 15000,
                            init_stock = 30, world_lev = 35, max_price = 30000,
                            min_price = 7500, classes = 0, up_ratio = 1000,
                            down_ratio = 500},
     #market_gold_item_data{id = 36, base_id = 20250,
                            catalg_1 = 3, catalg_2 = 8, init_price = 15000,
                            init_stock = 30, world_lev = 35, max_price = 30000,
                            min_price = 7500, classes = 0, up_ratio = 1000,
                            down_ratio = 500},
     #market_gold_item_data{id = 37, base_id = 20233,
                            catalg_1 = 3, catalg_2 = 8, init_price = 6000,
                            init_stock = 25, world_lev = 35, max_price = 18000,
                            min_price = 1800, classes = 0, up_ratio = 1000,
                            down_ratio = 500},
     #market_gold_item_data{id = 38, base_id = 20253,
                            catalg_1 = 3, catalg_2 = 8, init_price = 23000,
                            init_stock = 30, world_lev = 35, max_price = 46000,
                            min_price = 11500, classes = 0, up_ratio = 1000,
                            down_ratio = 500},
     #market_gold_item_data{id = 39, base_id = 20254,
                            catalg_1 = 3, catalg_2 = 8, init_price = 12000,
                            init_stock = 30, world_lev = 35, max_price = 36000,
                            min_price = 3600, classes = 0, up_ratio = 1000,
                            down_ratio = 500},
     #market_gold_item_data{id = 40, base_id = 20247,
                            catalg_1 = 3, catalg_2 = 8, init_price = 6000,
                            init_stock = 50, world_lev = 35, max_price = 18000,
                            min_price = 1800, classes = 0, up_ratio = 1000,
                            down_ratio = 500},
     #market_gold_item_data{id = 41, base_id = 20246,
                            catalg_1 = 3, catalg_2 = 8, init_price = 6000,
                            init_stock = 25, world_lev = 35, max_price = 18000,
                            min_price = 1800, classes = 0, up_ratio = 1000,
                            down_ratio = 500},
     #market_gold_item_data{id = 42, base_id = 20245,
                            catalg_1 = 3, catalg_2 = 8, init_price = 6000,
                            init_stock = 25, world_lev = 35, max_price = 18000,
                            min_price = 1800, classes = 0, up_ratio = 1000,
                            down_ratio = 500},
     #market_gold_item_data{id = 43, base_id = 20255,
                            catalg_1 = 3, catalg_2 = 8, init_price = 6000,
                            init_stock = 50, world_lev = 35, max_price = 18000,
                            min_price = 1800, classes = 0, up_ratio = 1000,
                            down_ratio = 500},
     #market_gold_item_data{id = 44, base_id = 20244,
                            catalg_1 = 3, catalg_2 = 8, init_price = 6000,
                            init_stock = 50, world_lev = 35, max_price = 18000,
                            min_price = 1800, classes = 0, up_ratio = 1000,
                            down_ratio = 500},
     #market_gold_item_data{id = 45, base_id = 20232,
                            catalg_1 = 3, catalg_2 = 8, init_price = 18000,
                            init_stock = 50, world_lev = 35, max_price = 43200,
                            min_price = 5400, classes = 0, up_ratio = 1000,
                            down_ratio = 500},
     #market_gold_item_data{id = 46, base_id = 20235,
                            catalg_1 = 3, catalg_2 = 8, init_price = 18000,
                            init_stock = 50, world_lev = 35, max_price = 43200,
                            min_price = 5400, classes = 0, up_ratio = 1000,
                            down_ratio = 500},
     #market_gold_item_data{id = 47, base_id = 20234,
                            catalg_1 = 3, catalg_2 = 8, init_price = 9000,
                            init_stock = 50, world_lev = 35, max_price = 27000,
                            min_price = 2700, classes = 0, up_ratio = 1000,
                            down_ratio = 500},
     #market_gold_item_data{id = 48, base_id = 20228,
                            catalg_1 = 3, catalg_2 = 8, init_price = 9000,
                            init_stock = 50, world_lev = 35, max_price = 27000,
                            min_price = 2700, classes = 0, up_ratio = 1000,
                            down_ratio = 500},
     #market_gold_item_data{id = 49, base_id = 20206,
                            catalg_1 = 3, catalg_2 = 8, init_price = 40000,
                            init_stock = 50, world_lev = 35, max_price = 80000,
                            min_price = 20000, classes = 0, up_ratio = 1000,
                            down_ratio = 500},
     #market_gold_item_data{id = 50, base_id = 20205,
                            catalg_1 = 3, catalg_2 = 8, init_price = 30000,
                            init_stock = 50, world_lev = 35, max_price = 72000,
                            min_price = 9000, classes = 0, up_ratio = 1000,
                            down_ratio = 500},
     #market_gold_item_data{id = 51, base_id = 20201,
                            catalg_1 = 3, catalg_2 = 8, init_price = 40000,
                            init_stock = 50, world_lev = 35, max_price = 96000,
                            min_price = 12000, classes = 0, up_ratio = 1000,
                            down_ratio = 500},
     #market_gold_item_data{id = 52, base_id = 20256,
                            catalg_1 = 3, catalg_2 = 8, init_price = 12000,
                            init_stock = 50, world_lev = 35, max_price = 36000,
                            min_price = 3600, classes = 0, up_ratio = 1000,
                            down_ratio = 500},
     #market_gold_item_data{id = 53, base_id = 20257,
                            catalg_1 = 3, catalg_2 = 8, init_price = 10000,
                            init_stock = 50, world_lev = 35, max_price = 20000,
                            min_price = 5000, classes = 0, up_ratio = 1000,
                            down_ratio = 500},
     #market_gold_item_data{id = 54, base_id = 20258,
                            catalg_1 = 3, catalg_2 = 8, init_price = 10000,
                            init_stock = 50, world_lev = 35, max_price = 20000,
                            min_price = 5000, classes = 0, up_ratio = 1000,
                            down_ratio = 500},
     #market_gold_item_data{id = 55, base_id = 20259,
                            catalg_1 = 3, catalg_2 = 8, init_price = 26600,
                            init_stock = 50, world_lev = 35, max_price = 63840,
                            min_price = 7980, classes = 0, up_ratio = 1000,
                            down_ratio = 500},
     #market_gold_item_data{id = 56, base_id = 20260,
                            catalg_1 = 3, catalg_2 = 8, init_price = 10000,
                            init_stock = 50, world_lev = 35, max_price = 20000,
                            min_price = 5000, classes = 0, up_ratio = 1000,
                            down_ratio = 500},
     #market_gold_item_data{id = 57, base_id = 20261,
                            catalg_1 = 3, catalg_2 = 8, init_price = 20000,
                            init_stock = 50, world_lev = 35, max_price = 40000,
                            min_price = 10000, classes = 0, up_ratio = 1000,
                            down_ratio = 500},
     #market_gold_item_data{id = 58, base_id = 20262,
                            catalg_1 = 3, catalg_2 = 8, init_price = 20000,
                            init_stock = 50, world_lev = 35, max_price = 40000,
                            min_price = 10000, classes = 0, up_ratio = 1000,
                            down_ratio = 500},
     #market_gold_item_data{id = 59, base_id = 20263,
                            catalg_1 = 3, catalg_2 = 8, init_price = 25000,
                            init_stock = 50, world_lev = 35, max_price = 50000,
                            min_price = 12500, classes = 0, up_ratio = 1000,
                            down_ratio = 500},
     #market_gold_item_data{id = 60, base_id = 20264,
                            catalg_1 = 3, catalg_2 = 8, init_price = 18000,
                            init_stock = 50, world_lev = 35, max_price = 54000,
                            min_price = 5400, classes = 0, up_ratio = 1000,
                            down_ratio = 500},
     #market_gold_item_data{id = 61, base_id = 20265,
                            catalg_1 = 3, catalg_2 = 8, init_price = 35000,
                            init_stock = 50, world_lev = 35, max_price = 90000,
                            min_price = 9000, classes = 0, up_ratio = 1000,
                            down_ratio = 500},
     #market_gold_item_data{id = 162, base_id = 20207,
                            catalg_1 = 3, catalg_2 = 8, init_price = 30000,
                            init_stock = 50, world_lev = 35, max_price = 60000,
                            min_price = 15000, classes = 0, up_ratio = 1000,
                            down_ratio = 500},
     #market_gold_item_data{id = 163, base_id = 20208,
                            catalg_1 = 3, catalg_2 = 8, init_price = 18000,
                            init_stock = 50, world_lev = 35, max_price = 36000,
                            min_price = 9000, classes = 0, up_ratio = 1000,
                            down_ratio = 500},
     #market_gold_item_data{id = 164, base_id = 20209,
                            catalg_1 = 3, catalg_2 = 8, init_price = 30000,
                            init_stock = 50, world_lev = 35, max_price = 60000,
                            min_price = 15000, classes = 0, up_ratio = 1000,
                            down_ratio = 500},
     #market_gold_item_data{id = 165, base_id = 20266,
                            catalg_1 = 3, catalg_2 = 8, init_price = 22000,
                            init_stock = 50, world_lev = 35, max_price = 66000,
                            min_price = 6600, classes = 0, up_ratio = 1000,
                            down_ratio = 500},
     #market_gold_item_data{id = 167, base_id = 20268,
                            catalg_1 = 3, catalg_2 = 8, init_price = 12000,
                            init_stock = 50, world_lev = 35, max_price = 36000,
                            min_price = 3600, classes = 0, up_ratio = 1000,
                            down_ratio = 500},
     #market_gold_item_data{id = 168, base_id = 20269,
                            catalg_1 = 3, catalg_2 = 8, init_price = 15000,
                            init_stock = 50, world_lev = 35, max_price = 45000,
                            min_price = 4500, classes = 0, up_ratio = 1000,
                            down_ratio = 500},
     #market_gold_item_data{id = 169, base_id = 20270,
                            catalg_1 = 3, catalg_2 = 8, init_price = 15000,
                            init_stock = 50, world_lev = 35, max_price = 45000,
                            min_price = 4500, classes = 0, up_ratio = 1000,
                            down_ratio = 500},
     #market_gold_item_data{id = 170, base_id = 20271,
                            catalg_1 = 3, catalg_2 = 8, init_price = 36000,
                            init_stock = 50, world_lev = 35, max_price = 108000,
                            min_price = 10800, classes = 0, up_ratio = 1000,
                            down_ratio = 500},
     #market_gold_item_data{id = 171, base_id = 20272,
                            catalg_1 = 3, catalg_2 = 8, init_price = 36000,
                            init_stock = 50, world_lev = 35, max_price = 108000,
                            min_price = 10800, classes = 0, up_ratio = 1000,
                            down_ratio = 500},
     #market_gold_item_data{id = 172, base_id = 20180,
                            catalg_1 = 3, catalg_2 = 8, init_price = 3600,
                            init_stock = 20, world_lev = 35, max_price = 10800,
                            min_price = 1080, classes = 0, up_ratio = 1000,
                            down_ratio = 500},
     #market_gold_item_data{id = 173, base_id = 20274,
                            catalg_1 = 3, catalg_2 = 8, init_price = 22000,
                            init_stock = 50, world_lev = 35, max_price = 66000,
                            min_price = 6600, classes = 0, up_ratio = 1000,
                            down_ratio = 500},
     #market_gold_item_data{id = 174, base_id = 20275,
                            catalg_1 = 3, catalg_2 = 8, init_price = 30000,
                            init_stock = 50, world_lev = 35, max_price = 90000,
                            min_price = 10000, classes = 0, up_ratio = 1000,
                            down_ratio = 500},
     #market_gold_item_data{id = 61, base_id = 20182,
                            catalg_1 = 3, catalg_2 = 7, init_price = 25000,
                            init_stock = 100, world_lev = 35, max_price = 75000,
                            min_price = 12500, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 62, base_id = 20140,
                            catalg_1 = 3, catalg_2 = 7, init_price = 12000,
                            init_stock = 100, world_lev = 35, max_price = 36000,
                            min_price = 3600, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 63, base_id = 20142,
                            catalg_1 = 3, catalg_2 = 7, init_price = 12000,
                            init_stock = 100, world_lev = 35, max_price = 36000,
                            min_price = 3600, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 64, base_id = 20129,
                            catalg_1 = 3, catalg_2 = 7, init_price = 5000,
                            init_stock = 100, world_lev = 35, max_price = 15000,
                            min_price = 1500, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 65, base_id = 20137,
                            catalg_1 = 3, catalg_2 = 7, init_price = 5500,
                            init_stock = 100, world_lev = 35, max_price = 16500,
                            min_price = 1650, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 66, base_id = 20141,
                            catalg_1 = 3, catalg_2 = 7, init_price = 4500,
                            init_stock = 100, world_lev = 35, max_price = 13500,
                            min_price = 1350, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 67, base_id = 20143,
                            catalg_1 = 3, catalg_2 = 7, init_price = 3600,
                            init_stock = 100, world_lev = 35, max_price = 10800,
                            min_price = 1080, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 68, base_id = 20103,
                            catalg_1 = 3, catalg_2 = 7, init_price = 3600,
                            init_stock = 100, world_lev = 35, max_price = 10800,
                            min_price = 1080, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 69, base_id = 20138,
                            catalg_1 = 3, catalg_2 = 7, init_price = 3600,
                            init_stock = 100, world_lev = 35, max_price = 10800,
                            min_price = 1080, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 70, base_id = 20127,
                            catalg_1 = 3, catalg_2 = 7, init_price = 3600,
                            init_stock = 100, world_lev = 35, max_price = 10800,
                            min_price = 1080, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 71, base_id = 20136,
                            catalg_1 = 3, catalg_2 = 7, init_price = 4600,
                            init_stock = 100, world_lev = 35, max_price = 13800,
                            min_price = 1380, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 72, base_id = 20104,
                            catalg_1 = 3, catalg_2 = 7, init_price = 3300,
                            init_stock = 100, world_lev = 35, max_price = 9900,
                            min_price = 990, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 73, base_id = 20126,
                            catalg_1 = 3, catalg_2 = 7, init_price = 3300,
                            init_stock = 100, world_lev = 35, max_price = 9900,
                            min_price = 990, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 74, base_id = 20139,
                            catalg_1 = 3, catalg_2 = 7, init_price = 3300,
                            init_stock = 100, world_lev = 35, max_price = 9900,
                            min_price = 990, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 75, base_id = 20151,
                            catalg_1 = 3, catalg_2 = 7, init_price = 3500,
                            init_stock = 100, world_lev = 35, max_price = 10500,
                            min_price = 1050, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 76, base_id = 20130,
                            catalg_1 = 3, catalg_2 = 7, init_price = 2800,
                            init_stock = 100, world_lev = 35, max_price = 8400,
                            min_price = 840, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 77, base_id = 20113,
                            catalg_1 = 3, catalg_2 = 7, init_price = 2000,
                            init_stock = 100, world_lev = 35, max_price = 6000,
                            min_price = 600, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 78, base_id = 20112,
                            catalg_1 = 3, catalg_2 = 7, init_price = 2000,
                            init_stock = 100, world_lev = 35, max_price = 6000,
                            min_price = 600, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 79, base_id = 20111,
                            catalg_1 = 3, catalg_2 = 7, init_price = 2000,
                            init_stock = 100, world_lev = 35, max_price = 6000,
                            min_price = 600, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 80, base_id = 20102,
                            catalg_1 = 3, catalg_2 = 7, init_price = 1500,
                            init_stock = 100, world_lev = 35, max_price = 4500,
                            min_price = 450, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 81, base_id = 20131,
                            catalg_1 = 3, catalg_2 = 7, init_price = 2800,
                            init_stock = 100, world_lev = 35, max_price = 8400,
                            min_price = 840, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 82, base_id = 20152,
                            catalg_1 = 3, catalg_2 = 7, init_price = 1600,
                            init_stock = 100, world_lev = 35, max_price = 4800,
                            min_price = 480, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 83, base_id = 20149,
                            catalg_1 = 3, catalg_2 = 7, init_price = 900,
                            init_stock = 100, world_lev = 35, max_price = 2700,
                            min_price = 270, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 84, base_id = 20148,
                            catalg_1 = 3, catalg_2 = 7, init_price = 900,
                            init_stock = 100, world_lev = 35, max_price = 2700,
                            min_price = 270, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 85, base_id = 20150,
                            catalg_1 = 3, catalg_2 = 7, init_price = 900,
                            init_stock = 100, world_lev = 35, max_price = 2700,
                            min_price = 270, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 86, base_id = 20133,
                            catalg_1 = 3, catalg_2 = 7, init_price = 600,
                            init_stock = 100, world_lev = 35, max_price = 1800,
                            min_price = 180, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 87, base_id = 20153,
                            catalg_1 = 3, catalg_2 = 7, init_price = 2500,
                            init_stock = 100, world_lev = 35, max_price = 3900,
                            min_price = 390, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 88, base_id = 20154,
                            catalg_1 = 3, catalg_2 = 7, init_price = 1200,
                            init_stock = 100, world_lev = 35, max_price = 3600,
                            min_price = 360, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 89, base_id = 20147,
                            catalg_1 = 3, catalg_2 = 7, init_price = 600,
                            init_stock = 100, world_lev = 35, max_price = 1800,
                            min_price = 180, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 90, base_id = 20146,
                            catalg_1 = 3, catalg_2 = 7, init_price = 600,
                            init_stock = 100, world_lev = 35, max_price = 1800,
                            min_price = 180, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 91, base_id = 20145,
                            catalg_1 = 3, catalg_2 = 7, init_price = 600,
                            init_stock = 100, world_lev = 35, max_price = 1800,
                            min_price = 180, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 92, base_id = 20155,
                            catalg_1 = 3, catalg_2 = 7, init_price = 600,
                            init_stock = 100, world_lev = 35, max_price = 1800,
                            min_price = 180, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 93, base_id = 20144,
                            catalg_1 = 3, catalg_2 = 7, init_price = 600,
                            init_stock = 100, world_lev = 35, max_price = 1800,
                            min_price = 180, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 94, base_id = 20132,
                            catalg_1 = 3, catalg_2 = 7, init_price = 3000,
                            init_stock = 100, world_lev = 35, max_price = 5400,
                            min_price = 1500, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 95, base_id = 20135,
                            catalg_1 = 3, catalg_2 = 7, init_price = 1800,
                            init_stock = 100, world_lev = 35, max_price = 5400,
                            min_price = 540, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 96, base_id = 20134,
                            catalg_1 = 3, catalg_2 = 7, init_price = 900,
                            init_stock = 100, world_lev = 35, max_price = 2700,
                            min_price = 270, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 97, base_id = 20128,
                            catalg_1 = 3, catalg_2 = 7, init_price = 900,
                            init_stock = 100, world_lev = 35, max_price = 2700,
                            min_price = 270, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 98, base_id = 20106,
                            catalg_1 = 3, catalg_2 = 7, init_price = 3000,
                            init_stock = 100, world_lev = 35, max_price = 9000,
                            min_price = 900, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 99, base_id = 20105,
                            catalg_1 = 3, catalg_2 = 7, init_price = 3000,
                            init_stock = 100, world_lev = 35, max_price = 9000,
                            min_price = 900, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 100, base_id = 20101,
                            catalg_1 = 3, catalg_2 = 7, init_price = 4000,
                            init_stock = 100, world_lev = 35, max_price = 12000,
                            min_price = 1200, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 101, base_id = 20156,
                            catalg_1 = 3, catalg_2 = 7, init_price = 1200,
                            init_stock = 100, world_lev = 35, max_price = 3600,
                            min_price = 360, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 102, base_id = 20157,
                            catalg_1 = 3, catalg_2 = 7, init_price = 1500,
                            init_stock = 100, world_lev = 35, max_price = 1800,
                            min_price = 180, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 103, base_id = 20158,
                            catalg_1 = 3, catalg_2 = 7, init_price = 1500,
                            init_stock = 100, world_lev = 35, max_price = 1800,
                            min_price = 180, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 104, base_id = 20159,
                            catalg_1 = 3, catalg_2 = 7, init_price = 2660,
                            init_stock = 100, world_lev = 35, max_price = 7980,
                            min_price = 798, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 105, base_id = 20160,
                            catalg_1 = 3, catalg_2 = 7, init_price = 600,
                            init_stock = 100, world_lev = 35, max_price = 1800,
                            min_price = 180, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 106, base_id = 20161,
                            catalg_1 = 3, catalg_2 = 7, init_price = 600,
                            init_stock = 100, world_lev = 35, max_price = 1800,
                            min_price = 180, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 107, base_id = 20162,
                            catalg_1 = 3, catalg_2 = 7, init_price = 600,
                            init_stock = 100, world_lev = 35, max_price = 1800,
                            min_price = 180, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 108, base_id = 20163,
                            catalg_1 = 3, catalg_2 = 7, init_price = 600,
                            init_stock = 100, world_lev = 35, max_price = 1800,
                            min_price = 180, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 109, base_id = 20164,
                            catalg_1 = 3, catalg_2 = 7, init_price = 1800,
                            init_stock = 100, world_lev = 35, max_price = 5400,
                            min_price = 540, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 110, base_id = 20172,
                            catalg_1 = 3, catalg_2 = 7, init_price = 6000,
                            init_stock = 100, world_lev = 35, max_price = 18000,
                            min_price = 3000, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 111, base_id = 20107,
                            catalg_1 = 3, catalg_2 = 7, init_price = 3000,
                            init_stock = 100, world_lev = 35, max_price = 4500,
                            min_price = 1500, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 112, base_id = 20108,
                            catalg_1 = 3, catalg_2 = 7, init_price = 3000,
                            init_stock = 100, world_lev = 35, max_price = 4500,
                            min_price = 1500, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 113, base_id = 20109,
                            catalg_1 = 3, catalg_2 = 7, init_price = 3000,
                            init_stock = 100, world_lev = 35, max_price = 4500,
                            min_price = 1500, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 114, base_id = 20174,
                            catalg_1 = 3, catalg_2 = 7, init_price = 3200,
                            init_stock = 100, world_lev = 35, max_price = 9600,
                            min_price = 1000, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 116, base_id = 20176,
                            catalg_1 = 3, catalg_2 = 7, init_price = 1200,
                            init_stock = 100, world_lev = 35, max_price = 3600,
                            min_price = 360, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 117, base_id = 20177,
                            catalg_1 = 3, catalg_2 = 7, init_price = 3600,
                            init_stock = 100, world_lev = 35, max_price = 10800,
                            min_price = 1080, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 118, base_id = 20178,
                            catalg_1 = 3, catalg_2 = 7, init_price = 2400,
                            init_stock = 100, world_lev = 35, max_price = 7200,
                            min_price = 720, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 119, base_id = 20179,
                            catalg_1 = 3, catalg_2 = 7, init_price = 3500,
                            init_stock = 100, world_lev = 35, max_price = 10500,
                            min_price = 1050, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 121, base_id = 20181,
                            catalg_1 = 3, catalg_2 = 7, init_price = 3500,
                            init_stock = 100, world_lev = 35, max_price = 10500,
                            min_price = 1050, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 123, base_id = 20183,
                            catalg_1 = 3, catalg_2 = 7, init_price = 3500,
                            init_stock = 100, world_lev = 35, max_price = 10500,
                            min_price = 1050, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 124, base_id = 20184,
                            catalg_1 = 3, catalg_2 = 7, init_price = 3500,
                            init_stock = 100, world_lev = 35, max_price = 10500,
                            min_price = 1050, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 200, base_id = 23832,
                            catalg_1 = 3, catalg_2 = 16, init_price = 80000,
                            init_stock = 100, world_lev = 60,
                            max_price = 120000, min_price = 48000, classes = 0,
                            up_ratio = 1000, down_ratio = 1000},
     #market_gold_item_data{id = 201, base_id = 23819,
                            catalg_1 = 3, catalg_2 = 16, init_price = 6000,
                            init_stock = 120, world_lev = 60, max_price = 9000,
                            min_price = 4200, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 202, base_id = 23820,
                            catalg_1 = 3, catalg_2 = 16, init_price = 9000,
                            init_stock = 120, world_lev = 60, max_price = 15000,
                            min_price = 6300, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 203, base_id = 23821,
                            catalg_1 = 3, catalg_2 = 16, init_price = 5500,
                            init_stock = 120, world_lev = 60, max_price = 9000,
                            min_price = 3850, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 204, base_id = 23822,
                            catalg_1 = 3, catalg_2 = 16, init_price = 6500,
                            init_stock = 120, world_lev = 60, max_price = 9750,
                            min_price = 4550, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 205, base_id = 23823,
                            catalg_1 = 3, catalg_2 = 16, init_price = 8500,
                            init_stock = 120, world_lev = 60, max_price = 13500,
                            min_price = 5950, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 206, base_id = 23880,
                            catalg_1 = 3, catalg_2 = 16, init_price = 30000,
                            init_stock = 30, world_lev = 60, max_price = 45000,
                            min_price = 21000, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 207, base_id = 23881,
                            catalg_1 = 3, catalg_2 = 16, init_price = 50000,
                            init_stock = 50, world_lev = 60, max_price = 75000,
                            min_price = 35000, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 208, base_id = 23882,
                            catalg_1 = 3, catalg_2 = 16, init_price = 50000,
                            init_stock = 50, world_lev = 60, max_price = 75000,
                            min_price = 35000, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 209, base_id = 23883,
                            catalg_1 = 3, catalg_2 = 16, init_price = 50000,
                            init_stock = 50, world_lev = 60, max_price = 75000,
                            min_price = 35000, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 210, base_id = 23884,
                            catalg_1 = 3, catalg_2 = 16, init_price = 50000,
                            init_stock = 50, world_lev = 60, max_price = 75000,
                            min_price = 35000, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 211, base_id = 23885,
                            catalg_1 = 3, catalg_2 = 16, init_price = 50000,
                            init_stock = 50, world_lev = 60, max_price = 75000,
                            min_price = 35000, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 212, base_id = 23887,
                            catalg_1 = 3, catalg_2 = 16, init_price = 50000,
                            init_stock = 50, world_lev = 60, max_price = 75000,
                            min_price = 35000, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 213, base_id = 23888,
                            catalg_1 = 3, catalg_2 = 16, init_price = 50000,
                            init_stock = 50, world_lev = 60, max_price = 75000,
                            min_price = 35000, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 214, base_id = 23859,
                            catalg_1 = 3, catalg_2 = 16, init_price = 10000,
                            init_stock = 1000, world_lev = 60,
                            max_price = 20000, min_price = 5000, classes = 0,
                            up_ratio = 1000, down_ratio = 1000},
     #market_gold_item_data{id = 215, base_id = 23860,
                            catalg_1 = 3, catalg_2 = 16, init_price = 30000,
                            init_stock = 1000, world_lev = 60,
                            max_price = 60000, min_price = 18000, classes = 0,
                            up_ratio = 1000, down_ratio = 1000},
     #market_gold_item_data{id = 216, base_id = 23861,
                            catalg_1 = 3, catalg_2 = 16, init_price = 56000,
                            init_stock = 500, world_lev = 60,
                            max_price = 112000, min_price = 33600, classes = 0,
                            up_ratio = 1000, down_ratio = 1000},
     #market_gold_item_data{id = 217, base_id = 23830,
                            catalg_1 = 3, catalg_2 = 16, init_price = 2000,
                            init_stock = 1000, world_lev = 60, max_price = 2000,
                            min_price = 2000, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 218, base_id = 23831,
                            catalg_1 = 3, catalg_2 = 16, init_price = 5000,
                            init_stock = 500, world_lev = 60, max_price = 5000,
                            min_price = 5000, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 219, base_id = 70056,
                            catalg_1 = 3, catalg_2 = 16, init_price = 50000,
                            init_stock = 500, world_lev = 60, max_price = 50000,
                            min_price = 50000, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 1, base_id = 23900,
                            catalg_1 = 3, catalg_2 = 19, init_price = 37500,
                            init_stock = 100, world_lev = 80,
                            max_price = 112500, min_price = 18750, classes = 0,
                            up_ratio = 1000, down_ratio = 1000},
     #market_gold_item_data{id = 2, base_id = 23901,
                            catalg_1 = 3, catalg_2 = 19, init_price = 30000,
                            init_stock = 100, world_lev = 80, max_price = 90000,
                            min_price = 15000, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 3, base_id = 23902,
                            catalg_1 = 3, catalg_2 = 19, init_price = 20000,
                            init_stock = 100, world_lev = 80, max_price = 60000,
                            min_price = 10000, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 4, base_id = 23903,
                            catalg_1 = 3, catalg_2 = 19, init_price = 40000,
                            init_stock = 100, world_lev = 80,
                            max_price = 120000, min_price = 20000, classes = 0,
                            up_ratio = 1000, down_ratio = 1000},
     #market_gold_item_data{id = 5, base_id = 23904,
                            catalg_1 = 3, catalg_2 = 19, init_price = 30000,
                            init_stock = 100, world_lev = 80, max_price = 90000,
                            min_price = 15000, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 6, base_id = 23905,
                            catalg_1 = 3, catalg_2 = 19, init_price = 40000,
                            init_stock = 100, world_lev = 80,
                            max_price = 120000, min_price = 20000, classes = 0,
                            up_ratio = 1000, down_ratio = 1000},
     #market_gold_item_data{id = 7, base_id = 23906,
                            catalg_1 = 3, catalg_2 = 19, init_price = 35000,
                            init_stock = 100, world_lev = 80,
                            max_price = 105000, min_price = 17500, classes = 0,
                            up_ratio = 1000, down_ratio = 1000},
     #market_gold_item_data{id = 8, base_id = 23907,
                            catalg_1 = 3, catalg_2 = 19, init_price = 30000,
                            init_stock = 100, world_lev = 80, max_price = 90000,
                            min_price = 15000, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 9, base_id = 23908,
                            catalg_1 = 3, catalg_2 = 19, init_price = 25000,
                            init_stock = 100, world_lev = 80, max_price = 75000,
                            min_price = 12500, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 10, base_id = 23909,
                            catalg_1 = 3, catalg_2 = 19, init_price = 32500,
                            init_stock = 100, world_lev = 80, max_price = 97500,
                            min_price = 16250, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 11, base_id = 23910,
                            catalg_1 = 3, catalg_2 = 19, init_price = 25000,
                            init_stock = 100, world_lev = 80, max_price = 75000,
                            min_price = 12500, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 12, base_id = 23911,
                            catalg_1 = 3, catalg_2 = 19, init_price = 30000,
                            init_stock = 100, world_lev = 80, max_price = 90000,
                            min_price = 15000, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 13, base_id = 23912,
                            catalg_1 = 3, catalg_2 = 19, init_price = 20000,
                            init_stock = 100, world_lev = 80, max_price = 60000,
                            min_price = 10000, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 14, base_id = 23913,
                            catalg_1 = 3, catalg_2 = 19, init_price = 17500,
                            init_stock = 100, world_lev = 80, max_price = 52500,
                            min_price = 8750, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 15, base_id = 23914,
                            catalg_1 = 3, catalg_2 = 19, init_price = 15000,
                            init_stock = 100, world_lev = 80, max_price = 45000,
                            min_price = 7500, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 16, base_id = 23915,
                            catalg_1 = 3, catalg_2 = 19, init_price = 12500,
                            init_stock = 100, world_lev = 80, max_price = 37500,
                            min_price = 6250, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 1, base_id = 23916,
                            catalg_1 = 3, catalg_2 = 18, init_price = 9000,
                            init_stock = 100, world_lev = 80, max_price = 27000,
                            min_price = 4500, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 2, base_id = 23917,
                            catalg_1 = 3, catalg_2 = 18, init_price = 7500,
                            init_stock = 100, world_lev = 80, max_price = 22500,
                            min_price = 3750, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 3, base_id = 23918,
                            catalg_1 = 3, catalg_2 = 18, init_price = 5000,
                            init_stock = 100, world_lev = 80, max_price = 15000,
                            min_price = 2500, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 4, base_id = 23919,
                            catalg_1 = 3, catalg_2 = 18, init_price = 6000,
                            init_stock = 100, world_lev = 80, max_price = 18000,
                            min_price = 3000, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 5, base_id = 23920,
                            catalg_1 = 3, catalg_2 = 18, init_price = 3000,
                            init_stock = 100, world_lev = 80, max_price = 9000,
                            min_price = 1500, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 6, base_id = 23921,
                            catalg_1 = 3, catalg_2 = 18, init_price = 4500,
                            init_stock = 100, world_lev = 80, max_price = 13500,
                            min_price = 2250, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 7, base_id = 23922,
                            catalg_1 = 3, catalg_2 = 18, init_price = 4000,
                            init_stock = 100, world_lev = 80, max_price = 12000,
                            min_price = 2000, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 8, base_id = 23923,
                            catalg_1 = 3, catalg_2 = 18, init_price = 3000,
                            init_stock = 100, world_lev = 80, max_price = 9000,
                            min_price = 1500, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 9, base_id = 23924,
                            catalg_1 = 3, catalg_2 = 18, init_price = 9000,
                            init_stock = 100, world_lev = 80, max_price = 27000,
                            min_price = 4500, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 10, base_id = 23925,
                            catalg_1 = 3, catalg_2 = 18, init_price = 5000,
                            init_stock = 100, world_lev = 80, max_price = 15000,
                            min_price = 2500, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 11, base_id = 23926,
                            catalg_1 = 3, catalg_2 = 18, init_price = 7500,
                            init_stock = 100, world_lev = 80, max_price = 22500,
                            min_price = 3750, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 12, base_id = 23927,
                            catalg_1 = 3, catalg_2 = 18, init_price = 6000,
                            init_stock = 100, world_lev = 80, max_price = 18000,
                            min_price = 3000, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 13, base_id = 23928,
                            catalg_1 = 3, catalg_2 = 18, init_price = 5000,
                            init_stock = 100, world_lev = 80, max_price = 15000,
                            min_price = 2500, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 14, base_id = 23929,
                            catalg_1 = 3, catalg_2 = 18, init_price = 4000,
                            init_stock = 100, world_lev = 80, max_price = 12000,
                            min_price = 2000, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 15, base_id = 23930,
                            catalg_1 = 3, catalg_2 = 18, init_price = 4000,
                            init_stock = 100, world_lev = 80, max_price = 12000,
                            min_price = 2000, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 16, base_id = 23931,
                            catalg_1 = 3, catalg_2 = 18, init_price = 3500,
                            init_stock = 100, world_lev = 80, max_price = 10500,
                            min_price = 1750, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 17, base_id = 23932,
                            catalg_1 = 3, catalg_2 = 18, init_price = 3000,
                            init_stock = 100, world_lev = 80, max_price = 9000,
                            min_price = 1500, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 18, base_id = 23933,
                            catalg_1 = 3, catalg_2 = 18, init_price = 2500,
                            init_stock = 100, world_lev = 80, max_price = 7500,
                            min_price = 1250, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 19, base_id = 23934,
                            catalg_1 = 3, catalg_2 = 18, init_price = 4000,
                            init_stock = 100, world_lev = 80, max_price = 12000,
                            min_price = 2000, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 20, base_id = 23935,
                            catalg_1 = 3, catalg_2 = 18, init_price = 4500,
                            init_stock = 100, world_lev = 80, max_price = 13500,
                            min_price = 2250, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 1, base_id = 20018,
                            catalg_1 = 4, catalg_2 = 1, init_price = 22000,
                            init_stock = 60, world_lev = 70, max_price = 18000,
                            min_price = 15000, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 2, base_id = 20017,
                            catalg_1 = 4, catalg_2 = 1, init_price = 10000,
                            init_stock = 60, world_lev = 55, max_price = 8000,
                            min_price = 6000, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 3, base_id = 23550,
                            catalg_1 = 4, catalg_2 = 1, init_price = 15000,
                            init_stock = 1000, world_lev = 70,
                            max_price = 20000, min_price = 10000, classes = 0,
                            up_ratio = 1000, down_ratio = 1000},
     #market_gold_item_data{id = 4, base_id = 23559,
                            catalg_1 = 4, catalg_2 = 1, init_price = 120000,
                            init_stock = 500, world_lev = 70,
                            max_price = 150000, min_price = 60000, classes = 0,
                            up_ratio = 1000, down_ratio = 1000},
     #market_gold_item_data{id = 5, base_id = 23555,
                            catalg_1 = 4, catalg_2 = 1, init_price = 3000,
                            init_stock = 1000, world_lev = 70, max_price = 3300,
                            min_price = 2400, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 6, base_id = 23556,
                            catalg_1 = 4, catalg_2 = 1, init_price = 4000,
                            init_stock = 1000, world_lev = 80, max_price = 4000,
                            min_price = 4000, day_limit = 10, classes = 0,
                            up_ratio = 1000, down_ratio = 1000},
     #market_gold_item_data{id = 1, base_id = 21201,
                            catalg_1 = 6, catalg_2 = 1, init_price = 1500,
                            init_stock = 300, world_lev = 20, max_price = 4500,
                            min_price = 1203, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 2, base_id = 21203,
                            catalg_1 = 6, catalg_2 = 1, init_price = 1500,
                            init_stock = 300, world_lev = 20, max_price = 4500,
                            min_price = 1203, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 3, base_id = 21204,
                            catalg_1 = 6, catalg_2 = 1, init_price = 1500,
                            init_stock = 300, world_lev = 20, max_price = 4500,
                            min_price = 1203, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 4, base_id = 21200,
                            catalg_1 = 6, catalg_2 = 1, init_price = 1500,
                            init_stock = 300, world_lev = 20, max_price = 4500,
                            min_price = 1203, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 5, base_id = 21202,
                            catalg_1 = 6, catalg_2 = 1, init_price = 3600,
                            init_stock = 300, world_lev = 20, max_price = 10800,
                            min_price = 2802, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 6, base_id = 21205,
                            catalg_1 = 6, catalg_2 = 1, init_price = 3600,
                            init_stock = 300, world_lev = 20, max_price = 10800,
                            min_price = 1803, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 7, base_id = 21206,
                            catalg_1 = 6, catalg_2 = 1, init_price = 3600,
                            init_stock = 300, world_lev = 20, max_price = 10800,
                            min_price = 1803, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 8, base_id = 21207,
                            catalg_1 = 6, catalg_2 = 1, init_price = 5000,
                            init_stock = 500, world_lev = 20, max_price = 6500,
                            min_price = 3000, day_limit = 4, classes = 0,
                            up_ratio = 1000, down_ratio = 1000},
     #market_gold_item_data{id = 2, base_id = 21103,
                            catalg_1 = 7, catalg_2 = 1, init_price = 26000,
                            init_stock = 1500, world_lev = 75,
                            max_price = 26000, min_price = 26000, classes = 0,
                            up_ratio = 1000, down_ratio = 1000},
     #market_gold_item_data{id = 3, base_id = 21102,
                            catalg_1 = 7, catalg_2 = 1, init_price = 21000,
                            init_stock = 2000, world_lev = 55,
                            max_price = 21000, min_price = 21000, classes = 0,
                            up_ratio = 1000, down_ratio = 1000},
     #market_gold_item_data{id = 4, base_id = 21101,
                            catalg_1 = 7, catalg_2 = 1, init_price = 14000,
                            init_stock = 2000, world_lev = 45,
                            max_price = 14000, min_price = 14000, classes = 0,
                            up_ratio = 1000, down_ratio = 1000},
     #market_gold_item_data{id = 5, base_id = 21100,
                            catalg_1 = 7, catalg_2 = 1, init_price = 6000,
                            init_stock = 3000, world_lev = 30, max_price = 6000,
                            min_price = 6000, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 6, base_id = 21130,
                            catalg_1 = 7, catalg_2 = 1, init_price = 6500,
                            init_stock = 5000, world_lev = 65,
                            max_price = 12000, min_price = 4000, classes = 0,
                            up_ratio = 1000, down_ratio = 1000},
     #market_gold_item_data{id = 7, base_id = 21131,
                            catalg_1 = 7, catalg_2 = 1, init_price = 22000,
                            init_stock = 1000, world_lev = 75,
                            max_price = 22000, min_price = 22000, classes = 0,
                            up_ratio = 1000, down_ratio = 1000},
     #market_gold_item_data{id = 8, base_id = 21135,
                            catalg_1 = 7, catalg_2 = 1, init_price = 3000,
                            init_stock = 1000, world_lev = 60, max_price = 3000,
                            min_price = 3000, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 9, base_id = 21136,
                            catalg_1 = 7, catalg_2 = 1, init_price = 5000,
                            init_stock = 1000, world_lev = 35, max_price = 5000,
                            min_price = 5000, day_limit = 10, classes = 0,
                            up_ratio = 1000, down_ratio = 1000},
     #market_gold_item_data{id = 1, base_id = 20045,
                            catalg_1 = 5, catalg_2 = 1, init_price = 1200,
                            init_stock = 100000, world_lev = 20,
                            max_price = 1200, min_price = 1200, classes = 0,
                            up_ratio = 1000, down_ratio = 1000},
     #market_gold_item_data{id = 2, base_id = 20046,
                            catalg_1 = 5, catalg_2 = 1, init_price = 8000,
                            init_stock = 100000, world_lev = 20,
                            max_price = 8000, min_price = 8000, classes = 0,
                            up_ratio = 1000, down_ratio = 1000},
     #market_gold_item_data{id = 3, base_id = 20005,
                            catalg_1 = 5, catalg_2 = 1, init_price = 1200,
                            init_stock = 500, world_lev = 20, max_price = 3600,
                            min_price = 602, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 4, base_id = 20054,
                            catalg_1 = 5, catalg_2 = 1, init_price = 4000,
                            init_stock = 1000, world_lev = 20, max_price = 6000,
                            min_price = 2801, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 5, base_id = 20055,
                            catalg_1 = 5, catalg_2 = 1, init_price = 4000,
                            init_stock = 1000, world_lev = 20, max_price = 6000,
                            min_price = 2803, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 6, base_id = 20056,
                            catalg_1 = 5, catalg_2 = 1, init_price = 4000,
                            init_stock = 1000, world_lev = 20, max_price = 6000,
                            min_price = 2802, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 7, base_id = 20057,
                            catalg_1 = 5, catalg_2 = 1, init_price = 4000,
                            init_stock = 1000, world_lev = 20, max_price = 6000,
                            min_price = 2804, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 8, base_id = 20025,
                            catalg_1 = 5, catalg_2 = 1, init_price = 3000,
                            init_stock = 1000, world_lev = 20, max_price = 9000,
                            min_price = 1500, classes = 0, up_ratio = 1000,
                            down_ratio = 1000},
     #market_gold_item_data{id = 9, base_id = 20044,
                            catalg_1 = 5, catalg_2 = 1, init_price = 19999,
                            init_stock = 100000, world_lev = 20,
                            max_price = 19999, min_price = 19999, classes = 0,
                            up_ratio = 1000, down_ratio = 1000},
     #market_gold_item_data{id = 10, base_id = 29105,
                            catalg_1 = 5, catalg_2 = 1, init_price = 2000,
                            init_stock = 100000, world_lev = 20,
                            max_price = 2000, min_price = 2000, classes = 0,
                            up_ratio = 1000, down_ratio = 1000},
     #market_gold_item_data{id = 11, base_id = 20507,
                            catalg_1 = 5, catalg_2 = 1, init_price = 10000,
                            init_stock = 100000, world_lev = 20,
                            max_price = 10000, min_price = 10000, classes = 0,
                            up_ratio = 1000, down_ratio = 1000}].

get_catalg_world_lev({1, 10}) -> 9999;
get_catalg_world_lev({1, 2}) -> 35;
get_catalg_world_lev({1, 3}) -> 45;
get_catalg_world_lev({1, 4}) -> 55;
get_catalg_world_lev({1, 5}) -> 65;
get_catalg_world_lev({1, 6}) -> 75;
get_catalg_world_lev({1, 13}) -> 85;
get_catalg_world_lev({1, 15}) -> 100;
get_catalg_world_lev({1, 16}) -> 105;
get_catalg_world_lev({1, 17}) -> 115;
get_catalg_world_lev({2, 11}) -> 35;
get_catalg_world_lev({2, 12}) -> 40;
get_catalg_world_lev({2, 14}) -> 75;
get_catalg_world_lev({3, 7}) -> 30;
get_catalg_world_lev({3, 8}) -> 30;
get_catalg_world_lev({3, 18}) -> 85;
get_catalg_world_lev({3, 19}) -> 85;
get_catalg_world_lev({3, 9}) -> 30;
get_catalg_world_lev({3, 16}) -> 60;
get_catalg_world_lev({4, 1}) -> 30;
get_catalg_world_lev({6, 1}) -> 30;
get_catalg_world_lev({7, 1}) -> 30;
get_catalg_world_lev({5, 1}) -> 30;
get_catalg_world_lev(_) -> none.

get_catalg_items({1, 2}) ->
    [{20520, 35, 0},
     {23520, 35, 0},
     {20521, 35, 0},
     {23521, 35, 0},
     {20522, 35, 0},
     {23522, 35, 0},
     {20523, 35, 0},
     {23523, 35, 0},
     {20524, 35, 0},
     {23524, 35, 0},
     {21850, 35, 0},
     {21851, 35, 0},
     {21960, 35, 0},
     {21961, 35, 0}];
get_catalg_items({1, 3}) ->
    [{20525, 45, 0},
     {23525, 45, 0},
     {20526, 45, 0},
     {23526, 45, 0},
     {20527, 45, 0},
     {23527, 45, 0},
     {20528, 45, 0},
     {23528, 45, 0},
     {20529, 45, 0},
     {23529, 45, 0},
     {21852, 45, 0},
     {21853, 45, 0},
     {21962, 45, 0},
     {21963, 45, 0}];
get_catalg_items({1, 4}) ->
    [{20530, 55, 0},
     {23530, 55, 0},
     {20531, 55, 0},
     {23531, 55, 0},
     {20532, 55, 0},
     {23532, 55, 0},
     {20533, 55, 0},
     {23533, 55, 0},
     {20534, 55, 0},
     {23534, 55, 0},
     {21854, 55, 0},
     {21855, 55, 0},
     {21964, 55, 0},
     {21965, 55, 0}];
get_catalg_items({1, 5}) ->
    [{20535, 65, 0},
     {23535, 65, 0},
     {20536, 65, 0},
     {23536, 65, 0},
     {20537, 65, 0},
     {23537, 65, 0},
     {20538, 65, 0},
     {23538, 65, 0},
     {20539, 65, 0},
     {23539, 65, 0},
     {21856, 65, 0},
     {21857, 65, 0},
     {21966, 65, 0},
     {21967, 65, 0}];
get_catalg_items({1, 6}) ->
    [{20540, 75, 0},
     {23540, 75, 0},
     {20541, 75, 0},
     {23541, 75, 0},
     {20542, 75, 0},
     {23542, 75, 0},
     {20543, 75, 0},
     {23543, 75, 0},
     {20544, 75, 0},
     {23544, 75, 0},
     {21858, 75, 0},
     {21859, 75, 0},
     {21968, 75, 0},
     {21969, 75, 0}];
get_catalg_items({1, 13}) ->
    [{20555, 85, 0},
     {23545, 85, 0},
     {20556, 85, 0},
     {23546, 85, 0},
     {20557, 85, 0},
     {23547, 85, 0},
     {20558, 85, 0},
     {23548, 85, 0},
     {20559, 85, 0},
     {23549, 85, 0},
     {21860, 85, 0},
     {21861, 85, 0},
     {21970, 85, 0},
     {21971, 85, 0}];
get_catalg_items({1, 15}) ->
    [{21801, 100, 0},
     {21806, 100, 0},
     {21802, 100, 0},
     {21807, 100, 0},
     {21803, 100, 0},
     {21808, 100, 0},
     {21804, 100, 0},
     {21809, 100, 0},
     {21805, 100, 0},
     {21810, 100, 0},
     {21862, 100, 0},
     {21863, 100, 0},
     {21972, 100, 0},
     {21973, 100, 0}];
get_catalg_items({1, 16}) ->
    [{22010, 105, 0},
     {22011, 105, 0},
     {22012, 105, 0},
     {22013, 105, 0},
     {22014, 105, 0},
     {22015, 105, 0},
     {21974, 105, 0},
     {22016, 105, 0},
     {22017, 105, 0},
     {22018, 105, 0},
     {22019, 105, 0},
     {22020, 105, 0},
     {22021, 105, 0},
     {21975, 105, 0}];
get_catalg_items({1, 17}) ->
    [{22030, 110, 0},
     {22031, 110, 0},
     {22032, 110, 0},
     {22033, 110, 0},
     {22034, 110, 0},
     {22035, 110, 0},
     {22036, 110, 0},
     {22037, 110, 0},
     {22038, 110, 0},
     {22039, 110, 0},
     {22040, 110, 0},
     {22041, 110, 0},
     {22042, 110, 0},
     {22043, 110, 0}];
get_catalg_items({2, 11}) ->
    [{20800, 35, 0},
     {20801, 35, 0},
     {20802, 35, 0},
     {20803, 35, 0},
     {20804, 35, 0},
     {20805, 35, 0},
     {20806, 35, 0},
     {20807, 35, 0}];
get_catalg_items({2, 12}) ->
    [{20093, 40, 0},
     {20094, 60, 0},
     {20020, 45, 0},
     {20400, 85, 0},
     {20008, 45, 0},
     {20405, 85, 0},
     {20406, 85, 0},
     {29006, 35, 0},
     {29007, 85, 0},
     {20021, 40, 0}];
get_catalg_items({2, 14}) ->
    [{20653, 75, 0}, {20654, 75, 0}, {20655, 75, 0}];
get_catalg_items({3, 9}) ->
    [{20038, 35, 0},
     {20095, 35, 0},
     {20004, 35, 0},
     {20612, 35, 0},
     {20603, 35, 0},
     {20606, 35, 0},
     {20600, 35, 0},
     {20615, 35, 0},
     {20039, 35, 0},
     {20040, 60, 0},
     {20036, 80, 0},
     {20074, 35, 0},
     {20075, 45, 0},
     {20076, 55, 0},
     {20639, 75, 0},
     {20618, 40, 0},
     {20007, 35, 0},
     {21132, 35, 0},
     {23760, 60, 0},
     {23762, 70, 0},
     {23764, 80, 0},
     {23766, 90, 0},
     {23768, 95, 0},
     {23772, 105, 0},
     {70211, 85, 0}];
get_catalg_items({3, 8}) ->
    [{20171, 35, 0},
     {20240, 35, 0},
     {20242, 35, 0},
     {20229, 35, 0},
     {20237, 35, 0},
     {20241, 35, 0},
     {20243, 35, 0},
     {20119, 35, 0},
     {20203, 35, 0},
     {20238, 35, 0},
     {20227, 35, 0},
     {20236, 35, 0},
     {20204, 35, 0},
     {20226, 35, 0},
     {20239, 35, 0},
     {20251, 35, 0},
     {20230, 35, 0},
     {20116, 35, 0},
     {20115, 35, 0},
     {20114, 35, 0},
     {20202, 35, 0},
     {20231, 35, 0},
     {20252, 35, 0},
     {20249, 35, 0},
     {20248, 35, 0},
     {20250, 35, 0},
     {20233, 35, 0},
     {20253, 35, 0},
     {20254, 35, 0},
     {20247, 35, 0},
     {20246, 35, 0},
     {20245, 35, 0},
     {20255, 35, 0},
     {20244, 35, 0},
     {20232, 35, 0},
     {20235, 35, 0},
     {20234, 35, 0},
     {20228, 35, 0},
     {20206, 35, 0},
     {20205, 35, 0},
     {20201, 35, 0},
     {20256, 35, 0},
     {20257, 35, 0},
     {20258, 35, 0},
     {20259, 35, 0},
     {20260, 35, 0},
     {20261, 35, 0},
     {20262, 35, 0},
     {20263, 35, 0},
     {20264, 35, 0},
     {20265, 35, 0},
     {20207, 35, 0},
     {20208, 35, 0},
     {20209, 35, 0},
     {20266, 35, 0},
     {20268, 35, 0},
     {20269, 35, 0},
     {20270, 35, 0},
     {20271, 35, 0},
     {20272, 35, 0},
     {20180, 35, 0},
     {20274, 35, 0},
     {20275, 35, 0}];
get_catalg_items({3, 7}) ->
    [{20182, 35, 0},
     {20140, 35, 0},
     {20142, 35, 0},
     {20129, 35, 0},
     {20137, 35, 0},
     {20141, 35, 0},
     {20143, 35, 0},
     {20103, 35, 0},
     {20138, 35, 0},
     {20127, 35, 0},
     {20136, 35, 0},
     {20104, 35, 0},
     {20126, 35, 0},
     {20139, 35, 0},
     {20151, 35, 0},
     {20130, 35, 0},
     {20113, 35, 0},
     {20112, 35, 0},
     {20111, 35, 0},
     {20102, 35, 0},
     {20131, 35, 0},
     {20152, 35, 0},
     {20149, 35, 0},
     {20148, 35, 0},
     {20150, 35, 0},
     {20133, 35, 0},
     {20153, 35, 0},
     {20154, 35, 0},
     {20147, 35, 0},
     {20146, 35, 0},
     {20145, 35, 0},
     {20155, 35, 0},
     {20144, 35, 0},
     {20132, 35, 0},
     {20135, 35, 0},
     {20134, 35, 0},
     {20128, 35, 0},
     {20106, 35, 0},
     {20105, 35, 0},
     {20101, 35, 0},
     {20156, 35, 0},
     {20157, 35, 0},
     {20158, 35, 0},
     {20159, 35, 0},
     {20160, 35, 0},
     {20161, 35, 0},
     {20162, 35, 0},
     {20163, 35, 0},
     {20164, 35, 0},
     {20172, 35, 0},
     {20107, 35, 0},
     {20108, 35, 0},
     {20109, 35, 0},
     {20174, 35, 0},
     {20176, 35, 0},
     {20177, 35, 0},
     {20178, 35, 0},
     {20179, 35, 0},
     {20181, 35, 0},
     {20183, 35, 0},
     {20184, 35, 0}];
get_catalg_items({3, 16}) ->
    [{23832, 60, 0},
     {23819, 60, 0},
     {23820, 60, 0},
     {23821, 60, 0},
     {23822, 60, 0},
     {23823, 60, 0},
     {23880, 60, 0},
     {23881, 60, 0},
     {23882, 60, 0},
     {23883, 60, 0},
     {23884, 60, 0},
     {23885, 60, 0},
     {23887, 60, 0},
     {23888, 60, 0},
     {23859, 60, 0},
     {23860, 60, 0},
     {23861, 60, 0},
     {23830, 60, 0},
     {23831, 60, 0},
     {70056, 60, 0}];
get_catalg_items({3, 19}) ->
    [{23900, 80, 0},
     {23901, 80, 0},
     {23902, 80, 0},
     {23903, 80, 0},
     {23904, 80, 0},
     {23905, 80, 0},
     {23906, 80, 0},
     {23907, 80, 0},
     {23908, 80, 0},
     {23909, 80, 0},
     {23910, 80, 0},
     {23911, 80, 0},
     {23912, 80, 0},
     {23913, 80, 0},
     {23914, 80, 0},
     {23915, 80, 0}];
get_catalg_items({3, 18}) ->
    [{23916, 80, 0},
     {23917, 80, 0},
     {23918, 80, 0},
     {23919, 80, 0},
     {23920, 80, 0},
     {23921, 80, 0},
     {23922, 80, 0},
     {23923, 80, 0},
     {23924, 80, 0},
     {23925, 80, 0},
     {23926, 80, 0},
     {23927, 80, 0},
     {23928, 80, 0},
     {23929, 80, 0},
     {23930, 80, 0},
     {23931, 80, 0},
     {23932, 80, 0},
     {23933, 80, 0},
     {23934, 80, 0},
     {23935, 80, 0}];
get_catalg_items({4, 1}) ->
    [{20018, 70, 0},
     {20017, 55, 0},
     {23550, 70, 0},
     {23559, 70, 0},
     {23555, 70, 0},
     {23556, 80, 0}];
get_catalg_items({6, 1}) ->
    [{21201, 20, 0},
     {21203, 20, 0},
     {21204, 20, 0},
     {21200, 20, 0},
     {21202, 20, 0},
     {21205, 20, 0},
     {21206, 20, 0},
     {21207, 20, 0}];
get_catalg_items({7, 1}) ->
    [{21103, 75, 0},
     {21102, 55, 0},
     {21101, 45, 0},
     {21100, 30, 0},
     {21130, 65, 0},
     {21131, 75, 0},
     {21135, 60, 0},
     {21136, 35, 0}];
get_catalg_items({5, 1}) ->
    [{20045, 20, 0},
     {20046, 20, 0},
     {20005, 20, 0},
     {20054, 20, 0},
     {20055, 20, 0},
     {20056, 20, 0},
     {20057, 20, 0},
     {20025, 20, 0},
     {20044, 20, 0},
     {29105, 20, 0},
     {20507, 20, 0}];
get_catalg_items(_) -> [].

get(20520) ->
    #market_gold_item_data{id = 6, base_id = 20520,
                           catalg_1 = 1, catalg_2 = 2, init_price = 650,
                           init_stock = 600, world_lev = 35, max_price = 1950,
                           min_price = 325, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(23520) ->
    #market_gold_item_data{id = 7, base_id = 23520,
                           catalg_1 = 1, catalg_2 = 2, init_price = 455,
                           init_stock = 540, world_lev = 35, max_price = 1365,
                           min_price = 227, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(20521) ->
    #market_gold_item_data{id = 8, base_id = 20521,
                           catalg_1 = 1, catalg_2 = 2, init_price = 650,
                           init_stock = 600, world_lev = 35, max_price = 1950,
                           min_price = 325, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(23521) ->
    #market_gold_item_data{id = 9, base_id = 23521,
                           catalg_1 = 1, catalg_2 = 2, init_price = 455,
                           init_stock = 540, world_lev = 35, max_price = 1365,
                           min_price = 227, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(20522) ->
    #market_gold_item_data{id = 10, base_id = 20522,
                           catalg_1 = 1, catalg_2 = 2, init_price = 650,
                           init_stock = 600, world_lev = 35, max_price = 1950,
                           min_price = 325, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(23522) ->
    #market_gold_item_data{id = 11, base_id = 23522,
                           catalg_1 = 1, catalg_2 = 2, init_price = 455,
                           init_stock = 540, world_lev = 35, max_price = 1365,
                           min_price = 227, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(20523) ->
    #market_gold_item_data{id = 12, base_id = 20523,
                           catalg_1 = 1, catalg_2 = 2, init_price = 650,
                           init_stock = 600, world_lev = 35, max_price = 1950,
                           min_price = 325, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(23523) ->
    #market_gold_item_data{id = 13, base_id = 23523,
                           catalg_1 = 1, catalg_2 = 2, init_price = 455,
                           init_stock = 540, world_lev = 35, max_price = 1365,
                           min_price = 227, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(20524) ->
    #market_gold_item_data{id = 14, base_id = 20524,
                           catalg_1 = 1, catalg_2 = 2, init_price = 650,
                           init_stock = 600, world_lev = 35, max_price = 1950,
                           min_price = 325, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(23524) ->
    #market_gold_item_data{id = 15, base_id = 23524,
                           catalg_1 = 1, catalg_2 = 2, init_price = 455,
                           init_stock = 540, world_lev = 35, max_price = 1365,
                           min_price = 227, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(21850) ->
    #market_gold_item_data{id = 16, base_id = 21850,
                           catalg_1 = 1, catalg_2 = 2, init_price = 650,
                           init_stock = 600, world_lev = 35, max_price = 1950,
                           min_price = 325, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(21851) ->
    #market_gold_item_data{id = 17, base_id = 21851,
                           catalg_1 = 1, catalg_2 = 2, init_price = 455,
                           init_stock = 540, world_lev = 35, max_price = 1365,
                           min_price = 227, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(21960) ->
    #market_gold_item_data{id = 18, base_id = 21960,
                           catalg_1 = 1, catalg_2 = 2, init_price = 650,
                           init_stock = 600, world_lev = 35, max_price = 1950,
                           min_price = 325, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(21961) ->
    #market_gold_item_data{id = 19, base_id = 21961,
                           catalg_1 = 1, catalg_2 = 2, init_price = 455,
                           init_stock = 540, world_lev = 35, max_price = 1365,
                           min_price = 227, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(20525) ->
    #market_gold_item_data{id = 20, base_id = 20525,
                           catalg_1 = 1, catalg_2 = 3, init_price = 2000,
                           init_stock = 600, world_lev = 45, max_price = 6000,
                           min_price = 1000, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(23525) ->
    #market_gold_item_data{id = 21, base_id = 23525,
                           catalg_1 = 1, catalg_2 = 3, init_price = 1400,
                           init_stock = 540, world_lev = 45, max_price = 4200,
                           min_price = 700, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(20526) ->
    #market_gold_item_data{id = 22, base_id = 20526,
                           catalg_1 = 1, catalg_2 = 3, init_price = 2000,
                           init_stock = 600, world_lev = 45, max_price = 6000,
                           min_price = 1000, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(23526) ->
    #market_gold_item_data{id = 23, base_id = 23526,
                           catalg_1 = 1, catalg_2 = 3, init_price = 1400,
                           init_stock = 540, world_lev = 45, max_price = 4200,
                           min_price = 700, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(20527) ->
    #market_gold_item_data{id = 24, base_id = 20527,
                           catalg_1 = 1, catalg_2 = 3, init_price = 2000,
                           init_stock = 600, world_lev = 45, max_price = 6000,
                           min_price = 1000, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(23527) ->
    #market_gold_item_data{id = 25, base_id = 23527,
                           catalg_1 = 1, catalg_2 = 3, init_price = 1400,
                           init_stock = 540, world_lev = 45, max_price = 4200,
                           min_price = 700, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(20528) ->
    #market_gold_item_data{id = 26, base_id = 20528,
                           catalg_1 = 1, catalg_2 = 3, init_price = 2000,
                           init_stock = 600, world_lev = 45, max_price = 6000,
                           min_price = 1000, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(23528) ->
    #market_gold_item_data{id = 27, base_id = 23528,
                           catalg_1 = 1, catalg_2 = 3, init_price = 1400,
                           init_stock = 540, world_lev = 45, max_price = 4200,
                           min_price = 700, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(20529) ->
    #market_gold_item_data{id = 28, base_id = 20529,
                           catalg_1 = 1, catalg_2 = 3, init_price = 2000,
                           init_stock = 600, world_lev = 45, max_price = 6000,
                           min_price = 1000, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(23529) ->
    #market_gold_item_data{id = 29, base_id = 23529,
                           catalg_1 = 1, catalg_2 = 3, init_price = 1400,
                           init_stock = 540, world_lev = 45, max_price = 4200,
                           min_price = 700, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(21852) ->
    #market_gold_item_data{id = 30, base_id = 21852,
                           catalg_1 = 1, catalg_2 = 3, init_price = 2000,
                           init_stock = 600, world_lev = 45, max_price = 6000,
                           min_price = 1000, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(21853) ->
    #market_gold_item_data{id = 31, base_id = 21853,
                           catalg_1 = 1, catalg_2 = 3, init_price = 1400,
                           init_stock = 540, world_lev = 45, max_price = 4200,
                           min_price = 700, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(21962) ->
    #market_gold_item_data{id = 32, base_id = 21962,
                           catalg_1 = 1, catalg_2 = 3, init_price = 2000,
                           init_stock = 600, world_lev = 45, max_price = 6000,
                           min_price = 1000, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(21963) ->
    #market_gold_item_data{id = 33, base_id = 21963,
                           catalg_1 = 1, catalg_2 = 3, init_price = 1400,
                           init_stock = 540, world_lev = 45, max_price = 4200,
                           min_price = 700, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(20530) ->
    #market_gold_item_data{id = 34, base_id = 20530,
                           catalg_1 = 1, catalg_2 = 4, init_price = 6000,
                           init_stock = 600, world_lev = 55, max_price = 12000,
                           min_price = 1800, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(23530) ->
    #market_gold_item_data{id = 35, base_id = 23530,
                           catalg_1 = 1, catalg_2 = 4, init_price = 4200,
                           init_stock = 540, world_lev = 55, max_price = 8400,
                           min_price = 1260, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(20531) ->
    #market_gold_item_data{id = 36, base_id = 20531,
                           catalg_1 = 1, catalg_2 = 4, init_price = 6000,
                           init_stock = 600, world_lev = 55, max_price = 12000,
                           min_price = 1800, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(23531) ->
    #market_gold_item_data{id = 37, base_id = 23531,
                           catalg_1 = 1, catalg_2 = 4, init_price = 4200,
                           init_stock = 540, world_lev = 55, max_price = 8400,
                           min_price = 1260, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(20532) ->
    #market_gold_item_data{id = 38, base_id = 20532,
                           catalg_1 = 1, catalg_2 = 4, init_price = 6000,
                           init_stock = 600, world_lev = 55, max_price = 12000,
                           min_price = 1800, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(23532) ->
    #market_gold_item_data{id = 39, base_id = 23532,
                           catalg_1 = 1, catalg_2 = 4, init_price = 4200,
                           init_stock = 540, world_lev = 55, max_price = 8400,
                           min_price = 1260, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(20533) ->
    #market_gold_item_data{id = 40, base_id = 20533,
                           catalg_1 = 1, catalg_2 = 4, init_price = 6000,
                           init_stock = 600, world_lev = 55, max_price = 12000,
                           min_price = 1800, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(23533) ->
    #market_gold_item_data{id = 41, base_id = 23533,
                           catalg_1 = 1, catalg_2 = 4, init_price = 4200,
                           init_stock = 540, world_lev = 55, max_price = 8400,
                           min_price = 1260, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(20534) ->
    #market_gold_item_data{id = 42, base_id = 20534,
                           catalg_1 = 1, catalg_2 = 4, init_price = 6000,
                           init_stock = 600, world_lev = 55, max_price = 12000,
                           min_price = 1800, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(23534) ->
    #market_gold_item_data{id = 43, base_id = 23534,
                           catalg_1 = 1, catalg_2 = 4, init_price = 4200,
                           init_stock = 540, world_lev = 55, max_price = 8400,
                           min_price = 1260, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(21854) ->
    #market_gold_item_data{id = 44, base_id = 21854,
                           catalg_1 = 1, catalg_2 = 4, init_price = 6000,
                           init_stock = 600, world_lev = 55, max_price = 12000,
                           min_price = 1800, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(21855) ->
    #market_gold_item_data{id = 45, base_id = 21855,
                           catalg_1 = 1, catalg_2 = 4, init_price = 4200,
                           init_stock = 540, world_lev = 55, max_price = 8400,
                           min_price = 1260, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(21964) ->
    #market_gold_item_data{id = 46, base_id = 21964,
                           catalg_1 = 1, catalg_2 = 4, init_price = 6000,
                           init_stock = 600, world_lev = 55, max_price = 12000,
                           min_price = 1800, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(21965) ->
    #market_gold_item_data{id = 47, base_id = 21965,
                           catalg_1 = 1, catalg_2 = 4, init_price = 4200,
                           init_stock = 540, world_lev = 55, max_price = 8400,
                           min_price = 1260, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(20535) ->
    #market_gold_item_data{id = 48, base_id = 20535,
                           catalg_1 = 1, catalg_2 = 5, init_price = 13000,
                           init_stock = 400, world_lev = 65, max_price = 26000,
                           min_price = 3900, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(23535) ->
    #market_gold_item_data{id = 49, base_id = 23535,
                           catalg_1 = 1, catalg_2 = 5, init_price = 9000,
                           init_stock = 360, world_lev = 65, max_price = 18000,
                           min_price = 2700, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(20536) ->
    #market_gold_item_data{id = 50, base_id = 20536,
                           catalg_1 = 1, catalg_2 = 5, init_price = 13000,
                           init_stock = 400, world_lev = 65, max_price = 26000,
                           min_price = 3900, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(23536) ->
    #market_gold_item_data{id = 51, base_id = 23536,
                           catalg_1 = 1, catalg_2 = 5, init_price = 9000,
                           init_stock = 360, world_lev = 65, max_price = 18000,
                           min_price = 2700, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(20537) ->
    #market_gold_item_data{id = 52, base_id = 20537,
                           catalg_1 = 1, catalg_2 = 5, init_price = 13000,
                           init_stock = 400, world_lev = 65, max_price = 26000,
                           min_price = 3900, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(23537) ->
    #market_gold_item_data{id = 53, base_id = 23537,
                           catalg_1 = 1, catalg_2 = 5, init_price = 9000,
                           init_stock = 360, world_lev = 65, max_price = 18000,
                           min_price = 2700, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(20538) ->
    #market_gold_item_data{id = 54, base_id = 20538,
                           catalg_1 = 1, catalg_2 = 5, init_price = 13000,
                           init_stock = 400, world_lev = 65, max_price = 26000,
                           min_price = 3900, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(23538) ->
    #market_gold_item_data{id = 55, base_id = 23538,
                           catalg_1 = 1, catalg_2 = 5, init_price = 9000,
                           init_stock = 360, world_lev = 65, max_price = 18000,
                           min_price = 2700, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(20539) ->
    #market_gold_item_data{id = 56, base_id = 20539,
                           catalg_1 = 1, catalg_2 = 5, init_price = 13000,
                           init_stock = 400, world_lev = 65, max_price = 26000,
                           min_price = 3900, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(23539) ->
    #market_gold_item_data{id = 57, base_id = 23539,
                           catalg_1 = 1, catalg_2 = 5, init_price = 9000,
                           init_stock = 360, world_lev = 65, max_price = 18000,
                           min_price = 2700, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(21856) ->
    #market_gold_item_data{id = 58, base_id = 21856,
                           catalg_1 = 1, catalg_2 = 5, init_price = 13000,
                           init_stock = 400, world_lev = 65, max_price = 26000,
                           min_price = 3900, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(21857) ->
    #market_gold_item_data{id = 59, base_id = 21857,
                           catalg_1 = 1, catalg_2 = 5, init_price = 9000,
                           init_stock = 360, world_lev = 65, max_price = 18000,
                           min_price = 2700, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(21966) ->
    #market_gold_item_data{id = 60, base_id = 21966,
                           catalg_1 = 1, catalg_2 = 5, init_price = 13000,
                           init_stock = 400, world_lev = 65, max_price = 26000,
                           min_price = 3900, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(21967) ->
    #market_gold_item_data{id = 61, base_id = 21967,
                           catalg_1 = 1, catalg_2 = 5, init_price = 9000,
                           init_stock = 360, world_lev = 65, max_price = 18000,
                           min_price = 2700, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(20540) ->
    #market_gold_item_data{id = 62, base_id = 20540,
                           catalg_1 = 1, catalg_2 = 6, init_price = 22000,
                           init_stock = 300, world_lev = 75, max_price = 44000,
                           min_price = 6600, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(23540) ->
    #market_gold_item_data{id = 63, base_id = 23540,
                           catalg_1 = 1, catalg_2 = 6, init_price = 16500,
                           init_stock = 270, world_lev = 75, max_price = 33000,
                           min_price = 4950, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(20541) ->
    #market_gold_item_data{id = 64, base_id = 20541,
                           catalg_1 = 1, catalg_2 = 6, init_price = 22000,
                           init_stock = 300, world_lev = 75, max_price = 44000,
                           min_price = 6600, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(23541) ->
    #market_gold_item_data{id = 65, base_id = 23541,
                           catalg_1 = 1, catalg_2 = 6, init_price = 16500,
                           init_stock = 270, world_lev = 75, max_price = 33000,
                           min_price = 4950, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(20542) ->
    #market_gold_item_data{id = 66, base_id = 20542,
                           catalg_1 = 1, catalg_2 = 6, init_price = 22000,
                           init_stock = 300, world_lev = 75, max_price = 44000,
                           min_price = 6600, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(23542) ->
    #market_gold_item_data{id = 67, base_id = 23542,
                           catalg_1 = 1, catalg_2 = 6, init_price = 16500,
                           init_stock = 270, world_lev = 75, max_price = 33000,
                           min_price = 4950, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(20543) ->
    #market_gold_item_data{id = 68, base_id = 20543,
                           catalg_1 = 1, catalg_2 = 6, init_price = 22000,
                           init_stock = 300, world_lev = 75, max_price = 44000,
                           min_price = 6600, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(23543) ->
    #market_gold_item_data{id = 69, base_id = 23543,
                           catalg_1 = 1, catalg_2 = 6, init_price = 16500,
                           init_stock = 270, world_lev = 75, max_price = 33000,
                           min_price = 4950, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(20544) ->
    #market_gold_item_data{id = 70, base_id = 20544,
                           catalg_1 = 1, catalg_2 = 6, init_price = 22000,
                           init_stock = 300, world_lev = 75, max_price = 44000,
                           min_price = 6600, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(23544) ->
    #market_gold_item_data{id = 71, base_id = 23544,
                           catalg_1 = 1, catalg_2 = 6, init_price = 16500,
                           init_stock = 270, world_lev = 75, max_price = 33000,
                           min_price = 4950, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(21858) ->
    #market_gold_item_data{id = 72, base_id = 21858,
                           catalg_1 = 1, catalg_2 = 6, init_price = 22000,
                           init_stock = 300, world_lev = 75, max_price = 44000,
                           min_price = 6600, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(21859) ->
    #market_gold_item_data{id = 73, base_id = 21859,
                           catalg_1 = 1, catalg_2 = 6, init_price = 16500,
                           init_stock = 270, world_lev = 75, max_price = 33000,
                           min_price = 4950, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(21968) ->
    #market_gold_item_data{id = 74, base_id = 21968,
                           catalg_1 = 1, catalg_2 = 6, init_price = 22000,
                           init_stock = 300, world_lev = 75, max_price = 44000,
                           min_price = 6600, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(21969) ->
    #market_gold_item_data{id = 75, base_id = 21969,
                           catalg_1 = 1, catalg_2 = 6, init_price = 16500,
                           init_stock = 270, world_lev = 75, max_price = 33000,
                           min_price = 4950, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(20555) ->
    #market_gold_item_data{id = 76, base_id = 20555,
                           catalg_1 = 1, catalg_2 = 13, init_price = 27000,
                           init_stock = 300, world_lev = 85, max_price = 54000,
                           min_price = 8100, classes = 0, up_ratio = 1000,
                           down_ratio = 1500};
get(23545) ->
    #market_gold_item_data{id = 77, base_id = 23545,
                           catalg_1 = 1, catalg_2 = 13, init_price = 23400,
                           init_stock = 270, world_lev = 85, max_price = 46800,
                           min_price = 7020, classes = 0, up_ratio = 1000,
                           down_ratio = 1500};
get(20556) ->
    #market_gold_item_data{id = 78, base_id = 20556,
                           catalg_1 = 1, catalg_2 = 13, init_price = 27000,
                           init_stock = 300, world_lev = 85, max_price = 54000,
                           min_price = 8100, classes = 0, up_ratio = 1000,
                           down_ratio = 1500};
get(23546) ->
    #market_gold_item_data{id = 79, base_id = 23546,
                           catalg_1 = 1, catalg_2 = 13, init_price = 23400,
                           init_stock = 270, world_lev = 85, max_price = 46800,
                           min_price = 7020, classes = 0, up_ratio = 1000,
                           down_ratio = 1500};
get(20557) ->
    #market_gold_item_data{id = 80, base_id = 20557,
                           catalg_1 = 1, catalg_2 = 13, init_price = 27000,
                           init_stock = 300, world_lev = 85, max_price = 54000,
                           min_price = 8100, classes = 0, up_ratio = 1000,
                           down_ratio = 1500};
get(23547) ->
    #market_gold_item_data{id = 81, base_id = 23547,
                           catalg_1 = 1, catalg_2 = 13, init_price = 23400,
                           init_stock = 270, world_lev = 85, max_price = 46800,
                           min_price = 7020, classes = 0, up_ratio = 1000,
                           down_ratio = 1500};
get(20558) ->
    #market_gold_item_data{id = 82, base_id = 20558,
                           catalg_1 = 1, catalg_2 = 13, init_price = 27000,
                           init_stock = 300, world_lev = 85, max_price = 54000,
                           min_price = 8100, classes = 0, up_ratio = 1000,
                           down_ratio = 1500};
get(23548) ->
    #market_gold_item_data{id = 83, base_id = 23548,
                           catalg_1 = 1, catalg_2 = 13, init_price = 23400,
                           init_stock = 270, world_lev = 85, max_price = 46800,
                           min_price = 7020, classes = 0, up_ratio = 1000,
                           down_ratio = 1500};
get(20559) ->
    #market_gold_item_data{id = 84, base_id = 20559,
                           catalg_1 = 1, catalg_2 = 13, init_price = 27000,
                           init_stock = 300, world_lev = 85, max_price = 54000,
                           min_price = 8100, classes = 0, up_ratio = 1000,
                           down_ratio = 1500};
get(23549) ->
    #market_gold_item_data{id = 85, base_id = 23549,
                           catalg_1 = 1, catalg_2 = 13, init_price = 23400,
                           init_stock = 270, world_lev = 85, max_price = 46800,
                           min_price = 7020, classes = 0, up_ratio = 1000,
                           down_ratio = 1500};
get(21860) ->
    #market_gold_item_data{id = 86, base_id = 21860,
                           catalg_1 = 1, catalg_2 = 13, init_price = 27000,
                           init_stock = 300, world_lev = 85, max_price = 54000,
                           min_price = 8100, classes = 0, up_ratio = 1000,
                           down_ratio = 1500};
get(21861) ->
    #market_gold_item_data{id = 87, base_id = 21861,
                           catalg_1 = 1, catalg_2 = 13, init_price = 23400,
                           init_stock = 270, world_lev = 85, max_price = 46800,
                           min_price = 7020, classes = 0, up_ratio = 1000,
                           down_ratio = 1500};
get(21970) ->
    #market_gold_item_data{id = 88, base_id = 21970,
                           catalg_1 = 1, catalg_2 = 13, init_price = 27000,
                           init_stock = 300, world_lev = 85, max_price = 54000,
                           min_price = 8100, classes = 0, up_ratio = 1000,
                           down_ratio = 1500};
get(21971) ->
    #market_gold_item_data{id = 89, base_id = 21971,
                           catalg_1 = 1, catalg_2 = 13, init_price = 23400,
                           init_stock = 270, world_lev = 85, max_price = 46800,
                           min_price = 7020, classes = 0, up_ratio = 1000,
                           down_ratio = 1500};
get(21801) ->
    #market_gold_item_data{id = 90, base_id = 21801,
                           catalg_1 = 1, catalg_2 = 15, init_price = 30000,
                           init_stock = 600, world_lev = 100, max_price = 60000,
                           min_price = 9000, classes = 0, up_ratio = 1000,
                           down_ratio = 1800};
get(21806) ->
    #market_gold_item_data{id = 91, base_id = 21806,
                           catalg_1 = 1, catalg_2 = 15, init_price = 27000,
                           init_stock = 540, world_lev = 100, max_price = 54000,
                           min_price = 8100, classes = 0, up_ratio = 1000,
                           down_ratio = 1800};
get(21802) ->
    #market_gold_item_data{id = 92, base_id = 21802,
                           catalg_1 = 1, catalg_2 = 15, init_price = 30000,
                           init_stock = 600, world_lev = 100, max_price = 60000,
                           min_price = 9000, classes = 0, up_ratio = 1000,
                           down_ratio = 1800};
get(21807) ->
    #market_gold_item_data{id = 93, base_id = 21807,
                           catalg_1 = 1, catalg_2 = 15, init_price = 27000,
                           init_stock = 540, world_lev = 100, max_price = 54000,
                           min_price = 8100, classes = 0, up_ratio = 1000,
                           down_ratio = 1800};
get(21803) ->
    #market_gold_item_data{id = 94, base_id = 21803,
                           catalg_1 = 1, catalg_2 = 15, init_price = 30000,
                           init_stock = 600, world_lev = 100, max_price = 60000,
                           min_price = 9000, classes = 0, up_ratio = 1000,
                           down_ratio = 1800};
get(21808) ->
    #market_gold_item_data{id = 95, base_id = 21808,
                           catalg_1 = 1, catalg_2 = 15, init_price = 27000,
                           init_stock = 540, world_lev = 100, max_price = 54000,
                           min_price = 8100, classes = 0, up_ratio = 1000,
                           down_ratio = 1800};
get(21804) ->
    #market_gold_item_data{id = 96, base_id = 21804,
                           catalg_1 = 1, catalg_2 = 15, init_price = 30000,
                           init_stock = 600, world_lev = 100, max_price = 60000,
                           min_price = 9000, classes = 0, up_ratio = 1000,
                           down_ratio = 1800};
get(21809) ->
    #market_gold_item_data{id = 97, base_id = 21809,
                           catalg_1 = 1, catalg_2 = 15, init_price = 27000,
                           init_stock = 540, world_lev = 100, max_price = 54000,
                           min_price = 8100, classes = 0, up_ratio = 1000,
                           down_ratio = 1800};
get(21805) ->
    #market_gold_item_data{id = 98, base_id = 21805,
                           catalg_1 = 1, catalg_2 = 15, init_price = 30000,
                           init_stock = 600, world_lev = 100, max_price = 60000,
                           min_price = 9000, classes = 0, up_ratio = 1000,
                           down_ratio = 1800};
get(21810) ->
    #market_gold_item_data{id = 99, base_id = 21810,
                           catalg_1 = 1, catalg_2 = 15, init_price = 27000,
                           init_stock = 540, world_lev = 100, max_price = 54000,
                           min_price = 8100, classes = 0, up_ratio = 1000,
                           down_ratio = 1800};
get(21862) ->
    #market_gold_item_data{id = 100, base_id = 21862,
                           catalg_1 = 1, catalg_2 = 15, init_price = 30000,
                           init_stock = 600, world_lev = 100, max_price = 60000,
                           min_price = 9000, classes = 0, up_ratio = 1000,
                           down_ratio = 1800};
get(21863) ->
    #market_gold_item_data{id = 101, base_id = 21863,
                           catalg_1 = 1, catalg_2 = 15, init_price = 27000,
                           init_stock = 540, world_lev = 100, max_price = 54000,
                           min_price = 8100, classes = 0, up_ratio = 1000,
                           down_ratio = 1800};
get(21972) ->
    #market_gold_item_data{id = 102, base_id = 21972,
                           catalg_1 = 1, catalg_2 = 15, init_price = 30000,
                           init_stock = 600, world_lev = 100, max_price = 60000,
                           min_price = 9000, classes = 0, up_ratio = 1000,
                           down_ratio = 1800};
get(21973) ->
    #market_gold_item_data{id = 103, base_id = 21973,
                           catalg_1 = 1, catalg_2 = 15, init_price = 27000,
                           init_stock = 540, world_lev = 100, max_price = 54000,
                           min_price = 8100, classes = 0, up_ratio = 1000,
                           down_ratio = 1800};
get(22010) ->
    #market_gold_item_data{id = 104, base_id = 22010,
                           catalg_1 = 1, catalg_2 = 16, init_price = 36000,
                           init_stock = 600, world_lev = 105, max_price = 72000,
                           min_price = 10000, classes = 0, up_ratio = 1000,
                           down_ratio = 2000};
get(22011) ->
    #market_gold_item_data{id = 105, base_id = 22011,
                           catalg_1 = 1, catalg_2 = 16, init_price = 36000,
                           init_stock = 600, world_lev = 105, max_price = 72000,
                           min_price = 10000, classes = 0, up_ratio = 1000,
                           down_ratio = 2000};
get(22012) ->
    #market_gold_item_data{id = 106, base_id = 22012,
                           catalg_1 = 1, catalg_2 = 16, init_price = 36000,
                           init_stock = 600, world_lev = 105, max_price = 72000,
                           min_price = 10000, classes = 0, up_ratio = 1000,
                           down_ratio = 2000};
get(22013) ->
    #market_gold_item_data{id = 107, base_id = 22013,
                           catalg_1 = 1, catalg_2 = 16, init_price = 36000,
                           init_stock = 600, world_lev = 105, max_price = 72000,
                           min_price = 10000, classes = 0, up_ratio = 1000,
                           down_ratio = 2000};
get(22014) ->
    #market_gold_item_data{id = 108, base_id = 22014,
                           catalg_1 = 1, catalg_2 = 16, init_price = 36000,
                           init_stock = 600, world_lev = 105, max_price = 72000,
                           min_price = 10000, classes = 0, up_ratio = 1000,
                           down_ratio = 2000};
get(22015) ->
    #market_gold_item_data{id = 109, base_id = 22015,
                           catalg_1 = 1, catalg_2 = 16, init_price = 36000,
                           init_stock = 600, world_lev = 105, max_price = 72000,
                           min_price = 10000, classes = 0, up_ratio = 1000,
                           down_ratio = 2000};
get(21974) ->
    #market_gold_item_data{id = 110, base_id = 21974,
                           catalg_1 = 1, catalg_2 = 16, init_price = 36000,
                           init_stock = 600, world_lev = 105, max_price = 72000,
                           min_price = 10000, classes = 0, up_ratio = 1000,
                           down_ratio = 2000};
get(22016) ->
    #market_gold_item_data{id = 111, base_id = 22016,
                           catalg_1 = 1, catalg_2 = 16, init_price = 32400,
                           init_stock = 540, world_lev = 105, max_price = 64800,
                           min_price = 8500, classes = 0, up_ratio = 1000,
                           down_ratio = 2000};
get(22017) ->
    #market_gold_item_data{id = 112, base_id = 22017,
                           catalg_1 = 1, catalg_2 = 16, init_price = 32400,
                           init_stock = 540, world_lev = 105, max_price = 64800,
                           min_price = 8500, classes = 0, up_ratio = 1000,
                           down_ratio = 2000};
get(22018) ->
    #market_gold_item_data{id = 113, base_id = 22018,
                           catalg_1 = 1, catalg_2 = 16, init_price = 32400,
                           init_stock = 540, world_lev = 105, max_price = 64800,
                           min_price = 8500, classes = 0, up_ratio = 1000,
                           down_ratio = 2000};
get(22019) ->
    #market_gold_item_data{id = 114, base_id = 22019,
                           catalg_1 = 1, catalg_2 = 16, init_price = 32400,
                           init_stock = 540, world_lev = 105, max_price = 64800,
                           min_price = 8500, classes = 0, up_ratio = 1000,
                           down_ratio = 2000};
get(22020) ->
    #market_gold_item_data{id = 115, base_id = 22020,
                           catalg_1 = 1, catalg_2 = 16, init_price = 32400,
                           init_stock = 540, world_lev = 105, max_price = 64800,
                           min_price = 8500, classes = 0, up_ratio = 1000,
                           down_ratio = 2000};
get(22021) ->
    #market_gold_item_data{id = 116, base_id = 22021,
                           catalg_1 = 1, catalg_2 = 16, init_price = 32400,
                           init_stock = 540, world_lev = 105, max_price = 64800,
                           min_price = 8500, classes = 0, up_ratio = 1000,
                           down_ratio = 2000};
get(21975) ->
    #market_gold_item_data{id = 117, base_id = 21975,
                           catalg_1 = 1, catalg_2 = 16, init_price = 32400,
                           init_stock = 540, world_lev = 105, max_price = 64800,
                           min_price = 8500, classes = 0, up_ratio = 1000,
                           down_ratio = 2000};
get(22030) ->
    #market_gold_item_data{id = 118, base_id = 22030,
                           catalg_1 = 1, catalg_2 = 17, init_price = 43200,
                           init_stock = 600, world_lev = 110, max_price = 86400,
                           min_price = 12000, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(22031) ->
    #market_gold_item_data{id = 119, base_id = 22031,
                           catalg_1 = 1, catalg_2 = 17, init_price = 43200,
                           init_stock = 600, world_lev = 110, max_price = 86400,
                           min_price = 12000, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(22032) ->
    #market_gold_item_data{id = 120, base_id = 22032,
                           catalg_1 = 1, catalg_2 = 17, init_price = 43200,
                           init_stock = 600, world_lev = 110, max_price = 86400,
                           min_price = 12000, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(22033) ->
    #market_gold_item_data{id = 121, base_id = 22033,
                           catalg_1 = 1, catalg_2 = 17, init_price = 43200,
                           init_stock = 600, world_lev = 110, max_price = 86400,
                           min_price = 12000, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(22034) ->
    #market_gold_item_data{id = 122, base_id = 22034,
                           catalg_1 = 1, catalg_2 = 17, init_price = 43200,
                           init_stock = 600, world_lev = 110, max_price = 86400,
                           min_price = 12000, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(22035) ->
    #market_gold_item_data{id = 123, base_id = 22035,
                           catalg_1 = 1, catalg_2 = 17, init_price = 43200,
                           init_stock = 600, world_lev = 110, max_price = 86400,
                           min_price = 12000, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(22036) ->
    #market_gold_item_data{id = 124, base_id = 22036,
                           catalg_1 = 1, catalg_2 = 17, init_price = 43200,
                           init_stock = 600, world_lev = 110, max_price = 86400,
                           min_price = 12000, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(22037) ->
    #market_gold_item_data{id = 125, base_id = 22037,
                           catalg_1 = 1, catalg_2 = 17, init_price = 38880,
                           init_stock = 540, world_lev = 110, max_price = 77760,
                           min_price = 10000, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(22038) ->
    #market_gold_item_data{id = 126, base_id = 22038,
                           catalg_1 = 1, catalg_2 = 17, init_price = 38880,
                           init_stock = 540, world_lev = 110, max_price = 77760,
                           min_price = 10000, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(22039) ->
    #market_gold_item_data{id = 127, base_id = 22039,
                           catalg_1 = 1, catalg_2 = 17, init_price = 38880,
                           init_stock = 540, world_lev = 110, max_price = 77760,
                           min_price = 10000, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(22040) ->
    #market_gold_item_data{id = 128, base_id = 22040,
                           catalg_1 = 1, catalg_2 = 17, init_price = 38880,
                           init_stock = 540, world_lev = 110, max_price = 77760,
                           min_price = 10000, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(22041) ->
    #market_gold_item_data{id = 129, base_id = 22041,
                           catalg_1 = 1, catalg_2 = 17, init_price = 38880,
                           init_stock = 540, world_lev = 110, max_price = 77760,
                           min_price = 10000, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(22042) ->
    #market_gold_item_data{id = 130, base_id = 22042,
                           catalg_1 = 1, catalg_2 = 17, init_price = 38880,
                           init_stock = 540, world_lev = 110, max_price = 77760,
                           min_price = 10000, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(22043) ->
    #market_gold_item_data{id = 131, base_id = 22043,
                           catalg_1 = 1, catalg_2 = 17, init_price = 38880,
                           init_stock = 540, world_lev = 110, max_price = 77760,
                           min_price = 10000, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(20800) ->
    #market_gold_item_data{id = 66, base_id = 20800,
                           catalg_1 = 2, catalg_2 = 11, init_price = 900,
                           init_stock = 5000, world_lev = 35, max_price = 1800,
                           min_price = 450, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(20801) ->
    #market_gold_item_data{id = 67, base_id = 20801,
                           catalg_1 = 2, catalg_2 = 11, init_price = 1200,
                           init_stock = 5000, world_lev = 35, max_price = 2400,
                           min_price = 600, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(20802) ->
    #market_gold_item_data{id = 68, base_id = 20802,
                           catalg_1 = 2, catalg_2 = 11, init_price = 900,
                           init_stock = 5000, world_lev = 35, max_price = 1800,
                           min_price = 450, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(20803) ->
    #market_gold_item_data{id = 69, base_id = 20803,
                           catalg_1 = 2, catalg_2 = 11, init_price = 800,
                           init_stock = 5000, world_lev = 35, max_price = 1600,
                           min_price = 400, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(20804) ->
    #market_gold_item_data{id = 70, base_id = 20804,
                           catalg_1 = 2, catalg_2 = 11, init_price = 800,
                           init_stock = 5000, world_lev = 35, max_price = 1600,
                           min_price = 400, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(20805) ->
    #market_gold_item_data{id = 71, base_id = 20805,
                           catalg_1 = 2, catalg_2 = 11, init_price = 900,
                           init_stock = 5000, world_lev = 35, max_price = 1800,
                           min_price = 450, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(20806) ->
    #market_gold_item_data{id = 72, base_id = 20806,
                           catalg_1 = 2, catalg_2 = 11, init_price = 800,
                           init_stock = 5000, world_lev = 35, max_price = 1600,
                           min_price = 400, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(20807) ->
    #market_gold_item_data{id = 73, base_id = 20807,
                           catalg_1 = 2, catalg_2 = 11, init_price = 1000,
                           init_stock = 5000, world_lev = 35, max_price = 2000,
                           min_price = 500, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(20093) ->
    #market_gold_item_data{id = 74, base_id = 20093,
                           catalg_1 = 2, catalg_2 = 12, init_price = 3800,
                           init_stock = 100000, world_lev = 40,
                           max_price = 3800, min_price = 3800, classes = 0,
                           up_ratio = 1000, down_ratio = 1000};
get(20094) ->
    #market_gold_item_data{id = 75, base_id = 20094,
                           catalg_1 = 2, catalg_2 = 12, init_price = 9400,
                           init_stock = 100000, world_lev = 60,
                           max_price = 9400, min_price = 9400, classes = 0,
                           up_ratio = 1000, down_ratio = 1000};
get(20020) ->
    #market_gold_item_data{id = 76, base_id = 20020,
                           catalg_1 = 2, catalg_2 = 12, init_price = 1000,
                           init_stock = 2000, world_lev = 45, max_price = 1500,
                           min_price = 1000, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(20400) ->
    #market_gold_item_data{id = 83, base_id = 20400,
                           catalg_1 = 2, catalg_2 = 12, init_price = 2500,
                           init_stock = 1000, world_lev = 85, max_price = 5500,
                           min_price = 2000, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(20008) ->
    #market_gold_item_data{id = 77, base_id = 20008,
                           catalg_1 = 2, catalg_2 = 12, init_price = 3000,
                           init_stock = 2000, world_lev = 45, max_price = 10800,
                           min_price = 2200, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(20405) ->
    #market_gold_item_data{id = 84, base_id = 20405,
                           catalg_1 = 2, catalg_2 = 12, init_price = 25000,
                           init_stock = 100, world_lev = 85, max_price = 25000,
                           min_price = 25000, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(20406) ->
    #market_gold_item_data{id = 86, base_id = 20406,
                           catalg_1 = 2, catalg_2 = 12, init_price = 20000,
                           init_stock = 100, world_lev = 85, max_price = 20000,
                           min_price = 20000, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(29006) ->
    #market_gold_item_data{id = 78, base_id = 29006,
                           catalg_1 = 2, catalg_2 = 12, init_price = 2500,
                           init_stock = 800, world_lev = 35, max_price = 6000,
                           min_price = 1500, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(29007) ->
    #market_gold_item_data{id = 79, base_id = 29007,
                           catalg_1 = 2, catalg_2 = 12, init_price = 9000,
                           init_stock = 800, world_lev = 85, max_price = 24000,
                           min_price = 6000, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(20653) ->
    #market_gold_item_data{id = 80, base_id = 20653,
                           catalg_1 = 2, catalg_2 = 14, init_price = 4500,
                           init_stock = 1000, world_lev = 75, max_price = 5400,
                           min_price = 3150, day_limit = 9, classes = 0,
                           up_ratio = 1000, down_ratio = 1000};
get(20654) ->
    #market_gold_item_data{id = 81, base_id = 20654,
                           catalg_1 = 2, catalg_2 = 14, init_price = 2250,
                           init_stock = 1000, world_lev = 75, max_price = 2700,
                           min_price = 1575, day_limit = 36, classes = 0,
                           up_ratio = 1000, down_ratio = 1000};
get(20655) ->
    #market_gold_item_data{id = 82, base_id = 20655,
                           catalg_1 = 2, catalg_2 = 14, init_price = 2250,
                           init_stock = 1000, world_lev = 75, max_price = 2700,
                           min_price = 1575, day_limit = 27, classes = 0,
                           up_ratio = 1000, down_ratio = 1000};
get(20021) ->
    #market_gold_item_data{id = 85, base_id = 20021,
                           catalg_1 = 2, catalg_2 = 12, init_price = 2000,
                           init_stock = 100000, world_lev = 40,
                           max_price = 2000, min_price = 2000, day_limit = 12,
                           classes = 0, up_ratio = 1000, down_ratio = 1000};
get(20038) ->
    #market_gold_item_data{id = 1, base_id = 20038,
                           catalg_1 = 3, catalg_2 = 9, init_price = 20000,
                           init_stock = 9999999, world_lev = 35,
                           max_price = 20000, min_price = 20000, classes = 0,
                           up_ratio = 1000, down_ratio = 1000};
get(20095) ->
    #market_gold_item_data{id = 2, base_id = 20095,
                           catalg_1 = 3, catalg_2 = 9, init_price = 11500,
                           init_stock = 9999999, world_lev = 35,
                           max_price = 11500, min_price = 11500, classes = 0,
                           up_ratio = 1000, down_ratio = 1000};
get(20004) ->
    #market_gold_item_data{id = 3, base_id = 20004,
                           catalg_1 = 3, catalg_2 = 9, init_price = 900,
                           init_stock = 2000, world_lev = 35, max_price = 2700,
                           min_price = 603, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(20612) ->
    #market_gold_item_data{id = 4, base_id = 20612,
                           catalg_1 = 3, catalg_2 = 9, init_price = 2500,
                           init_stock = 1500, world_lev = 35, max_price = 4000,
                           min_price = 750, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(20603) ->
    #market_gold_item_data{id = 5, base_id = 20603,
                           catalg_1 = 3, catalg_2 = 9, init_price = 2500,
                           init_stock = 1500, world_lev = 35, max_price = 4000,
                           min_price = 750, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(20606) ->
    #market_gold_item_data{id = 6, base_id = 20606,
                           catalg_1 = 3, catalg_2 = 9, init_price = 2500,
                           init_stock = 1500, world_lev = 35, max_price = 4000,
                           min_price = 750, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(20600) ->
    #market_gold_item_data{id = 7, base_id = 20600,
                           catalg_1 = 3, catalg_2 = 9, init_price = 2500,
                           init_stock = 1500, world_lev = 35, max_price = 4000,
                           min_price = 750, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(20615) ->
    #market_gold_item_data{id = 8, base_id = 20615,
                           catalg_1 = 3, catalg_2 = 9, init_price = 5000,
                           init_stock = 800, world_lev = 35, max_price = 15000,
                           min_price = 2000, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(20039) ->
    #market_gold_item_data{id = 10, base_id = 20039,
                           catalg_1 = 3, catalg_2 = 9, init_price = 5000,
                           init_stock = 1000, world_lev = 35, max_price = 10000,
                           min_price = 3000, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(20040) ->
    #market_gold_item_data{id = 9, base_id = 20040,
                           catalg_1 = 3, catalg_2 = 9, init_price = 15000,
                           init_stock = 1000, world_lev = 60, max_price = 22000,
                           min_price = 5000, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(20036) ->
    #market_gold_item_data{id = 16, base_id = 20036,
                           catalg_1 = 3, catalg_2 = 9, init_price = 25000,
                           init_stock = 1000, world_lev = 80, max_price = 33000,
                           min_price = 8000, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(20074) ->
    #market_gold_item_data{id = 11, base_id = 20074,
                           catalg_1 = 3, catalg_2 = 9, init_price = 3000,
                           init_stock = 1000, world_lev = 35, max_price = 6000,
                           min_price = 1500, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(20075) ->
    #market_gold_item_data{id = 12, base_id = 20075,
                           catalg_1 = 3, catalg_2 = 9, init_price = 12000,
                           init_stock = 1000, world_lev = 45, max_price = 24000,
                           min_price = 6000, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(20076) ->
    #market_gold_item_data{id = 13, base_id = 20076,
                           catalg_1 = 3, catalg_2 = 9, init_price = 48000,
                           init_stock = 500, world_lev = 55, max_price = 96000,
                           min_price = 24000, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(20639) ->
    #market_gold_item_data{id = 24, base_id = 20639,
                           catalg_1 = 3, catalg_2 = 9, init_price = 128000,
                           init_stock = 500, world_lev = 75, max_price = 128000,
                           min_price = 128000, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(20618) ->
    #market_gold_item_data{id = 14, base_id = 20618,
                           catalg_1 = 3, catalg_2 = 9, init_price = 2000,
                           init_stock = 2000, world_lev = 40, max_price = 4000,
                           min_price = 1000, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(20007) ->
    #market_gold_item_data{id = 15, base_id = 20007,
                           catalg_1 = 3, catalg_2 = 9, init_price = 3000,
                           init_stock = 9999999, world_lev = 35,
                           max_price = 3000, min_price = 3000, classes = 0,
                           up_ratio = 1000, down_ratio = 1000};
get(21132) ->
    #market_gold_item_data{id = 17, base_id = 21132,
                           catalg_1 = 3, catalg_2 = 9, init_price = 45000,
                           init_stock = 9999999, world_lev = 35,
                           max_price = 45000, min_price = 45000, classes = 0,
                           up_ratio = 1000, down_ratio = 1000};
get(23760) ->
    #market_gold_item_data{id = 18, base_id = 23760,
                           catalg_1 = 3, catalg_2 = 9, init_price = 15000,
                           init_stock = 9999999, world_lev = 60,
                           max_price = 15000, min_price = 15000, classes = 0,
                           up_ratio = 1000, down_ratio = 1000};
get(23762) ->
    #market_gold_item_data{id = 19, base_id = 23762,
                           catalg_1 = 3, catalg_2 = 9, init_price = 30000,
                           init_stock = 9999999, world_lev = 70,
                           max_price = 30000, min_price = 30000, classes = 0,
                           up_ratio = 1000, down_ratio = 1000};
get(23764) ->
    #market_gold_item_data{id = 20, base_id = 23764,
                           catalg_1 = 3, catalg_2 = 9, init_price = 50000,
                           init_stock = 9999999, world_lev = 80,
                           max_price = 50000, min_price = 50000, classes = 0,
                           up_ratio = 1000, down_ratio = 1000};
get(23766) ->
    #market_gold_item_data{id = 21, base_id = 23766,
                           catalg_1 = 3, catalg_2 = 9, init_price = 75000,
                           init_stock = 9999999, world_lev = 90,
                           max_price = 75000, min_price = 75000, classes = 0,
                           up_ratio = 1000, down_ratio = 1000};
get(23768) ->
    #market_gold_item_data{id = 22, base_id = 23768,
                           catalg_1 = 3, catalg_2 = 9, init_price = 100000,
                           init_stock = 9999999, world_lev = 95,
                           max_price = 100000, min_price = 100000, classes = 0,
                           up_ratio = 1000, down_ratio = 1000};
get(23772) ->
    #market_gold_item_data{id = 23, base_id = 23772,
                           catalg_1 = 3, catalg_2 = 9, init_price = 125000,
                           init_stock = 9999999, world_lev = 105,
                           max_price = 125000, min_price = 125000, classes = 0,
                           up_ratio = 1000, down_ratio = 1000};
get(70211) ->
    #market_gold_item_data{id = 24, base_id = 70211,
                           catalg_1 = 3, catalg_2 = 9, init_price = 20000,
                           init_stock = 9999999, world_lev = 85,
                           max_price = 20000, min_price = 20000, classes = 0,
                           up_ratio = 1000, down_ratio = 1000};
get(20171) ->
    #market_gold_item_data{id = 11, base_id = 20171,
                           catalg_1 = 3, catalg_2 = 8, init_price = 60000,
                           init_stock = 15, world_lev = 35, max_price = 144000,
                           min_price = 18000, classes = 0, up_ratio = 1000,
                           down_ratio = 500};
get(20240) ->
    #market_gold_item_data{id = 12, base_id = 20240,
                           catalg_1 = 3, catalg_2 = 8, init_price = 70000,
                           init_stock = 12, world_lev = 35, max_price = 168000,
                           min_price = 21000, classes = 0, up_ratio = 1000,
                           down_ratio = 500};
get(20242) ->
    #market_gold_item_data{id = 13, base_id = 20242,
                           catalg_1 = 3, catalg_2 = 8, init_price = 70000,
                           init_stock = 12, world_lev = 35, max_price = 168000,
                           min_price = 21000, classes = 0, up_ratio = 1000,
                           down_ratio = 500};
get(20229) ->
    #market_gold_item_data{id = 14, base_id = 20229,
                           catalg_1 = 3, catalg_2 = 8, init_price = 50000,
                           init_stock = 12, world_lev = 35, max_price = 120000,
                           min_price = 15000, classes = 0, up_ratio = 1000,
                           down_ratio = 500};
get(20237) ->
    #market_gold_item_data{id = 15, base_id = 20237,
                           catalg_1 = 3, catalg_2 = 8, init_price = 55000,
                           init_stock = 12, world_lev = 35, max_price = 132000,
                           min_price = 16500, classes = 0, up_ratio = 1000,
                           down_ratio = 500};
get(20241) ->
    #market_gold_item_data{id = 16, base_id = 20241,
                           catalg_1 = 3, catalg_2 = 8, init_price = 45000,
                           init_stock = 12, world_lev = 35, max_price = 108000,
                           min_price = 13500, classes = 0, up_ratio = 1000,
                           down_ratio = 500};
get(20243) ->
    #market_gold_item_data{id = 17, base_id = 20243,
                           catalg_1 = 3, catalg_2 = 8, init_price = 36000,
                           init_stock = 12, world_lev = 35, max_price = 86400,
                           min_price = 10800, classes = 0, up_ratio = 1000,
                           down_ratio = 500};
get(20119) ->
    #market_gold_item_data{id = 18, base_id = 20119,
                           catalg_1 = 3, catalg_2 = 8, init_price = 36000,
                           init_stock = 10, world_lev = 35, max_price = 86400,
                           min_price = 10800, classes = 0, up_ratio = 1000,
                           down_ratio = 500};
get(20203) ->
    #market_gold_item_data{id = 19, base_id = 20203,
                           catalg_1 = 3, catalg_2 = 8, init_price = 36000,
                           init_stock = 12, world_lev = 35, max_price = 86400,
                           min_price = 10800, classes = 0, up_ratio = 1000,
                           down_ratio = 500};
get(20238) ->
    #market_gold_item_data{id = 20, base_id = 20238,
                           catalg_1 = 3, catalg_2 = 8, init_price = 36000,
                           init_stock = 12, world_lev = 35, max_price = 86400,
                           min_price = 10800, classes = 0, up_ratio = 1000,
                           down_ratio = 500};
get(20227) ->
    #market_gold_item_data{id = 21, base_id = 20227,
                           catalg_1 = 3, catalg_2 = 8, init_price = 46000,
                           init_stock = 12, world_lev = 35, max_price = 92000,
                           min_price = 23000, classes = 0, up_ratio = 1000,
                           down_ratio = 500};
get(20236) ->
    #market_gold_item_data{id = 22, base_id = 20236,
                           catalg_1 = 3, catalg_2 = 8, init_price = 46000,
                           init_stock = 12, world_lev = 35, max_price = 110400,
                           min_price = 13800, classes = 0, up_ratio = 1000,
                           down_ratio = 500};
get(20204) ->
    #market_gold_item_data{id = 23, base_id = 20204,
                           catalg_1 = 3, catalg_2 = 8, init_price = 33000,
                           init_stock = 25, world_lev = 35, max_price = 79200,
                           min_price = 9900, classes = 0, up_ratio = 1000,
                           down_ratio = 500};
get(20226) ->
    #market_gold_item_data{id = 24, base_id = 20226,
                           catalg_1 = 3, catalg_2 = 8, init_price = 46000,
                           init_stock = 25, world_lev = 35, max_price = 92000,
                           min_price = 23000, classes = 0, up_ratio = 1000,
                           down_ratio = 500};
get(20239) ->
    #market_gold_item_data{id = 25, base_id = 20239,
                           catalg_1 = 3, catalg_2 = 8, init_price = 33000,
                           init_stock = 25, world_lev = 35, max_price = 79200,
                           min_price = 9900, classes = 0, up_ratio = 1000,
                           down_ratio = 500};
get(20251) ->
    #market_gold_item_data{id = 26, base_id = 20251,
                           catalg_1 = 3, catalg_2 = 8, init_price = 35000,
                           init_stock = 25, world_lev = 35, max_price = 84000,
                           min_price = 10500, classes = 0, up_ratio = 1000,
                           down_ratio = 500};
get(20230) ->
    #market_gold_item_data{id = 27, base_id = 20230,
                           catalg_1 = 3, catalg_2 = 8, init_price = 28000,
                           init_stock = 25, world_lev = 35, max_price = 67200,
                           min_price = 8400, classes = 0, up_ratio = 1000,
                           down_ratio = 500};
get(20116) ->
    #market_gold_item_data{id = 28, base_id = 20116,
                           catalg_1 = 3, catalg_2 = 8, init_price = 20000,
                           init_stock = 25, world_lev = 35, max_price = 48000,
                           min_price = 6000, classes = 0, up_ratio = 1000,
                           down_ratio = 500};
get(20115) ->
    #market_gold_item_data{id = 29, base_id = 20115,
                           catalg_1 = 3, catalg_2 = 8, init_price = 20000,
                           init_stock = 25, world_lev = 35, max_price = 48000,
                           min_price = 6000, classes = 0, up_ratio = 1000,
                           down_ratio = 500};
get(20114) ->
    #market_gold_item_data{id = 30, base_id = 20114,
                           catalg_1 = 3, catalg_2 = 8, init_price = 20000,
                           init_stock = 25, world_lev = 35, max_price = 48000,
                           min_price = 6000, classes = 0, up_ratio = 1000,
                           down_ratio = 500};
get(20202) ->
    #market_gold_item_data{id = 31, base_id = 20202,
                           catalg_1 = 3, catalg_2 = 8, init_price = 15000,
                           init_stock = 25, world_lev = 35, max_price = 36000,
                           min_price = 4500, classes = 0, up_ratio = 1000,
                           down_ratio = 500};
get(20231) ->
    #market_gold_item_data{id = 32, base_id = 20231,
                           catalg_1 = 3, catalg_2 = 8, init_price = 28000,
                           init_stock = 25, world_lev = 35, max_price = 67200,
                           min_price = 8400, classes = 0, up_ratio = 1000,
                           down_ratio = 500};
get(20252) ->
    #market_gold_item_data{id = 33, base_id = 20252,
                           catalg_1 = 3, catalg_2 = 8, init_price = 16000,
                           init_stock = 30, world_lev = 35, max_price = 48000,
                           min_price = 4800, classes = 0, up_ratio = 1000,
                           down_ratio = 500};
get(20249) ->
    #market_gold_item_data{id = 34, base_id = 20249,
                           catalg_1 = 3, catalg_2 = 8, init_price = 15000,
                           init_stock = 30, world_lev = 35, max_price = 30000,
                           min_price = 7500, classes = 0, up_ratio = 1000,
                           down_ratio = 500};
get(20248) ->
    #market_gold_item_data{id = 35, base_id = 20248,
                           catalg_1 = 3, catalg_2 = 8, init_price = 15000,
                           init_stock = 30, world_lev = 35, max_price = 30000,
                           min_price = 7500, classes = 0, up_ratio = 1000,
                           down_ratio = 500};
get(20250) ->
    #market_gold_item_data{id = 36, base_id = 20250,
                           catalg_1 = 3, catalg_2 = 8, init_price = 15000,
                           init_stock = 30, world_lev = 35, max_price = 30000,
                           min_price = 7500, classes = 0, up_ratio = 1000,
                           down_ratio = 500};
get(20233) ->
    #market_gold_item_data{id = 37, base_id = 20233,
                           catalg_1 = 3, catalg_2 = 8, init_price = 6000,
                           init_stock = 25, world_lev = 35, max_price = 18000,
                           min_price = 1800, classes = 0, up_ratio = 1000,
                           down_ratio = 500};
get(20253) ->
    #market_gold_item_data{id = 38, base_id = 20253,
                           catalg_1 = 3, catalg_2 = 8, init_price = 23000,
                           init_stock = 30, world_lev = 35, max_price = 46000,
                           min_price = 11500, classes = 0, up_ratio = 1000,
                           down_ratio = 500};
get(20254) ->
    #market_gold_item_data{id = 39, base_id = 20254,
                           catalg_1 = 3, catalg_2 = 8, init_price = 12000,
                           init_stock = 30, world_lev = 35, max_price = 36000,
                           min_price = 3600, classes = 0, up_ratio = 1000,
                           down_ratio = 500};
get(20247) ->
    #market_gold_item_data{id = 40, base_id = 20247,
                           catalg_1 = 3, catalg_2 = 8, init_price = 6000,
                           init_stock = 50, world_lev = 35, max_price = 18000,
                           min_price = 1800, classes = 0, up_ratio = 1000,
                           down_ratio = 500};
get(20246) ->
    #market_gold_item_data{id = 41, base_id = 20246,
                           catalg_1 = 3, catalg_2 = 8, init_price = 6000,
                           init_stock = 25, world_lev = 35, max_price = 18000,
                           min_price = 1800, classes = 0, up_ratio = 1000,
                           down_ratio = 500};
get(20245) ->
    #market_gold_item_data{id = 42, base_id = 20245,
                           catalg_1 = 3, catalg_2 = 8, init_price = 6000,
                           init_stock = 25, world_lev = 35, max_price = 18000,
                           min_price = 1800, classes = 0, up_ratio = 1000,
                           down_ratio = 500};
get(20255) ->
    #market_gold_item_data{id = 43, base_id = 20255,
                           catalg_1 = 3, catalg_2 = 8, init_price = 6000,
                           init_stock = 50, world_lev = 35, max_price = 18000,
                           min_price = 1800, classes = 0, up_ratio = 1000,
                           down_ratio = 500};
get(20244) ->
    #market_gold_item_data{id = 44, base_id = 20244,
                           catalg_1 = 3, catalg_2 = 8, init_price = 6000,
                           init_stock = 50, world_lev = 35, max_price = 18000,
                           min_price = 1800, classes = 0, up_ratio = 1000,
                           down_ratio = 500};
get(20232) ->
    #market_gold_item_data{id = 45, base_id = 20232,
                           catalg_1 = 3, catalg_2 = 8, init_price = 18000,
                           init_stock = 50, world_lev = 35, max_price = 43200,
                           min_price = 5400, classes = 0, up_ratio = 1000,
                           down_ratio = 500};
get(20235) ->
    #market_gold_item_data{id = 46, base_id = 20235,
                           catalg_1 = 3, catalg_2 = 8, init_price = 18000,
                           init_stock = 50, world_lev = 35, max_price = 43200,
                           min_price = 5400, classes = 0, up_ratio = 1000,
                           down_ratio = 500};
get(20234) ->
    #market_gold_item_data{id = 47, base_id = 20234,
                           catalg_1 = 3, catalg_2 = 8, init_price = 9000,
                           init_stock = 50, world_lev = 35, max_price = 27000,
                           min_price = 2700, classes = 0, up_ratio = 1000,
                           down_ratio = 500};
get(20228) ->
    #market_gold_item_data{id = 48, base_id = 20228,
                           catalg_1 = 3, catalg_2 = 8, init_price = 9000,
                           init_stock = 50, world_lev = 35, max_price = 27000,
                           min_price = 2700, classes = 0, up_ratio = 1000,
                           down_ratio = 500};
get(20206) ->
    #market_gold_item_data{id = 49, base_id = 20206,
                           catalg_1 = 3, catalg_2 = 8, init_price = 40000,
                           init_stock = 50, world_lev = 35, max_price = 80000,
                           min_price = 20000, classes = 0, up_ratio = 1000,
                           down_ratio = 500};
get(20205) ->
    #market_gold_item_data{id = 50, base_id = 20205,
                           catalg_1 = 3, catalg_2 = 8, init_price = 30000,
                           init_stock = 50, world_lev = 35, max_price = 72000,
                           min_price = 9000, classes = 0, up_ratio = 1000,
                           down_ratio = 500};
get(20201) ->
    #market_gold_item_data{id = 51, base_id = 20201,
                           catalg_1 = 3, catalg_2 = 8, init_price = 40000,
                           init_stock = 50, world_lev = 35, max_price = 96000,
                           min_price = 12000, classes = 0, up_ratio = 1000,
                           down_ratio = 500};
get(20256) ->
    #market_gold_item_data{id = 52, base_id = 20256,
                           catalg_1 = 3, catalg_2 = 8, init_price = 12000,
                           init_stock = 50, world_lev = 35, max_price = 36000,
                           min_price = 3600, classes = 0, up_ratio = 1000,
                           down_ratio = 500};
get(20257) ->
    #market_gold_item_data{id = 53, base_id = 20257,
                           catalg_1 = 3, catalg_2 = 8, init_price = 10000,
                           init_stock = 50, world_lev = 35, max_price = 20000,
                           min_price = 5000, classes = 0, up_ratio = 1000,
                           down_ratio = 500};
get(20258) ->
    #market_gold_item_data{id = 54, base_id = 20258,
                           catalg_1 = 3, catalg_2 = 8, init_price = 10000,
                           init_stock = 50, world_lev = 35, max_price = 20000,
                           min_price = 5000, classes = 0, up_ratio = 1000,
                           down_ratio = 500};
get(20259) ->
    #market_gold_item_data{id = 55, base_id = 20259,
                           catalg_1 = 3, catalg_2 = 8, init_price = 26600,
                           init_stock = 50, world_lev = 35, max_price = 63840,
                           min_price = 7980, classes = 0, up_ratio = 1000,
                           down_ratio = 500};
get(20260) ->
    #market_gold_item_data{id = 56, base_id = 20260,
                           catalg_1 = 3, catalg_2 = 8, init_price = 10000,
                           init_stock = 50, world_lev = 35, max_price = 20000,
                           min_price = 5000, classes = 0, up_ratio = 1000,
                           down_ratio = 500};
get(20261) ->
    #market_gold_item_data{id = 57, base_id = 20261,
                           catalg_1 = 3, catalg_2 = 8, init_price = 20000,
                           init_stock = 50, world_lev = 35, max_price = 40000,
                           min_price = 10000, classes = 0, up_ratio = 1000,
                           down_ratio = 500};
get(20262) ->
    #market_gold_item_data{id = 58, base_id = 20262,
                           catalg_1 = 3, catalg_2 = 8, init_price = 20000,
                           init_stock = 50, world_lev = 35, max_price = 40000,
                           min_price = 10000, classes = 0, up_ratio = 1000,
                           down_ratio = 500};
get(20263) ->
    #market_gold_item_data{id = 59, base_id = 20263,
                           catalg_1 = 3, catalg_2 = 8, init_price = 25000,
                           init_stock = 50, world_lev = 35, max_price = 50000,
                           min_price = 12500, classes = 0, up_ratio = 1000,
                           down_ratio = 500};
get(20264) ->
    #market_gold_item_data{id = 60, base_id = 20264,
                           catalg_1 = 3, catalg_2 = 8, init_price = 18000,
                           init_stock = 50, world_lev = 35, max_price = 54000,
                           min_price = 5400, classes = 0, up_ratio = 1000,
                           down_ratio = 500};
get(20265) ->
    #market_gold_item_data{id = 61, base_id = 20265,
                           catalg_1 = 3, catalg_2 = 8, init_price = 35000,
                           init_stock = 50, world_lev = 35, max_price = 90000,
                           min_price = 9000, classes = 0, up_ratio = 1000,
                           down_ratio = 500};
get(20207) ->
    #market_gold_item_data{id = 162, base_id = 20207,
                           catalg_1 = 3, catalg_2 = 8, init_price = 30000,
                           init_stock = 50, world_lev = 35, max_price = 60000,
                           min_price = 15000, classes = 0, up_ratio = 1000,
                           down_ratio = 500};
get(20208) ->
    #market_gold_item_data{id = 163, base_id = 20208,
                           catalg_1 = 3, catalg_2 = 8, init_price = 18000,
                           init_stock = 50, world_lev = 35, max_price = 36000,
                           min_price = 9000, classes = 0, up_ratio = 1000,
                           down_ratio = 500};
get(20209) ->
    #market_gold_item_data{id = 164, base_id = 20209,
                           catalg_1 = 3, catalg_2 = 8, init_price = 30000,
                           init_stock = 50, world_lev = 35, max_price = 60000,
                           min_price = 15000, classes = 0, up_ratio = 1000,
                           down_ratio = 500};
get(20266) ->
    #market_gold_item_data{id = 165, base_id = 20266,
                           catalg_1 = 3, catalg_2 = 8, init_price = 22000,
                           init_stock = 50, world_lev = 35, max_price = 66000,
                           min_price = 6600, classes = 0, up_ratio = 1000,
                           down_ratio = 500};
get(20268) ->
    #market_gold_item_data{id = 167, base_id = 20268,
                           catalg_1 = 3, catalg_2 = 8, init_price = 12000,
                           init_stock = 50, world_lev = 35, max_price = 36000,
                           min_price = 3600, classes = 0, up_ratio = 1000,
                           down_ratio = 500};
get(20269) ->
    #market_gold_item_data{id = 168, base_id = 20269,
                           catalg_1 = 3, catalg_2 = 8, init_price = 15000,
                           init_stock = 50, world_lev = 35, max_price = 45000,
                           min_price = 4500, classes = 0, up_ratio = 1000,
                           down_ratio = 500};
get(20270) ->
    #market_gold_item_data{id = 169, base_id = 20270,
                           catalg_1 = 3, catalg_2 = 8, init_price = 15000,
                           init_stock = 50, world_lev = 35, max_price = 45000,
                           min_price = 4500, classes = 0, up_ratio = 1000,
                           down_ratio = 500};
get(20271) ->
    #market_gold_item_data{id = 170, base_id = 20271,
                           catalg_1 = 3, catalg_2 = 8, init_price = 36000,
                           init_stock = 50, world_lev = 35, max_price = 108000,
                           min_price = 10800, classes = 0, up_ratio = 1000,
                           down_ratio = 500};
get(20272) ->
    #market_gold_item_data{id = 171, base_id = 20272,
                           catalg_1 = 3, catalg_2 = 8, init_price = 36000,
                           init_stock = 50, world_lev = 35, max_price = 108000,
                           min_price = 10800, classes = 0, up_ratio = 1000,
                           down_ratio = 500};
get(20180) ->
    #market_gold_item_data{id = 172, base_id = 20180,
                           catalg_1 = 3, catalg_2 = 8, init_price = 3600,
                           init_stock = 20, world_lev = 35, max_price = 10800,
                           min_price = 1080, classes = 0, up_ratio = 1000,
                           down_ratio = 500};
get(20274) ->
    #market_gold_item_data{id = 173, base_id = 20274,
                           catalg_1 = 3, catalg_2 = 8, init_price = 22000,
                           init_stock = 50, world_lev = 35, max_price = 66000,
                           min_price = 6600, classes = 0, up_ratio = 1000,
                           down_ratio = 500};
get(20275) ->
    #market_gold_item_data{id = 174, base_id = 20275,
                           catalg_1 = 3, catalg_2 = 8, init_price = 30000,
                           init_stock = 50, world_lev = 35, max_price = 90000,
                           min_price = 10000, classes = 0, up_ratio = 1000,
                           down_ratio = 500};
get(20182) ->
    #market_gold_item_data{id = 61, base_id = 20182,
                           catalg_1 = 3, catalg_2 = 7, init_price = 25000,
                           init_stock = 100, world_lev = 35, max_price = 75000,
                           min_price = 12500, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(20140) ->
    #market_gold_item_data{id = 62, base_id = 20140,
                           catalg_1 = 3, catalg_2 = 7, init_price = 12000,
                           init_stock = 100, world_lev = 35, max_price = 36000,
                           min_price = 3600, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(20142) ->
    #market_gold_item_data{id = 63, base_id = 20142,
                           catalg_1 = 3, catalg_2 = 7, init_price = 12000,
                           init_stock = 100, world_lev = 35, max_price = 36000,
                           min_price = 3600, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(20129) ->
    #market_gold_item_data{id = 64, base_id = 20129,
                           catalg_1 = 3, catalg_2 = 7, init_price = 5000,
                           init_stock = 100, world_lev = 35, max_price = 15000,
                           min_price = 1500, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(20137) ->
    #market_gold_item_data{id = 65, base_id = 20137,
                           catalg_1 = 3, catalg_2 = 7, init_price = 5500,
                           init_stock = 100, world_lev = 35, max_price = 16500,
                           min_price = 1650, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(20141) ->
    #market_gold_item_data{id = 66, base_id = 20141,
                           catalg_1 = 3, catalg_2 = 7, init_price = 4500,
                           init_stock = 100, world_lev = 35, max_price = 13500,
                           min_price = 1350, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(20143) ->
    #market_gold_item_data{id = 67, base_id = 20143,
                           catalg_1 = 3, catalg_2 = 7, init_price = 3600,
                           init_stock = 100, world_lev = 35, max_price = 10800,
                           min_price = 1080, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(20103) ->
    #market_gold_item_data{id = 68, base_id = 20103,
                           catalg_1 = 3, catalg_2 = 7, init_price = 3600,
                           init_stock = 100, world_lev = 35, max_price = 10800,
                           min_price = 1080, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(20138) ->
    #market_gold_item_data{id = 69, base_id = 20138,
                           catalg_1 = 3, catalg_2 = 7, init_price = 3600,
                           init_stock = 100, world_lev = 35, max_price = 10800,
                           min_price = 1080, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(20127) ->
    #market_gold_item_data{id = 70, base_id = 20127,
                           catalg_1 = 3, catalg_2 = 7, init_price = 3600,
                           init_stock = 100, world_lev = 35, max_price = 10800,
                           min_price = 1080, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(20136) ->
    #market_gold_item_data{id = 71, base_id = 20136,
                           catalg_1 = 3, catalg_2 = 7, init_price = 4600,
                           init_stock = 100, world_lev = 35, max_price = 13800,
                           min_price = 1380, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(20104) ->
    #market_gold_item_data{id = 72, base_id = 20104,
                           catalg_1 = 3, catalg_2 = 7, init_price = 3300,
                           init_stock = 100, world_lev = 35, max_price = 9900,
                           min_price = 990, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(20126) ->
    #market_gold_item_data{id = 73, base_id = 20126,
                           catalg_1 = 3, catalg_2 = 7, init_price = 3300,
                           init_stock = 100, world_lev = 35, max_price = 9900,
                           min_price = 990, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(20139) ->
    #market_gold_item_data{id = 74, base_id = 20139,
                           catalg_1 = 3, catalg_2 = 7, init_price = 3300,
                           init_stock = 100, world_lev = 35, max_price = 9900,
                           min_price = 990, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(20151) ->
    #market_gold_item_data{id = 75, base_id = 20151,
                           catalg_1 = 3, catalg_2 = 7, init_price = 3500,
                           init_stock = 100, world_lev = 35, max_price = 10500,
                           min_price = 1050, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(20130) ->
    #market_gold_item_data{id = 76, base_id = 20130,
                           catalg_1 = 3, catalg_2 = 7, init_price = 2800,
                           init_stock = 100, world_lev = 35, max_price = 8400,
                           min_price = 840, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(20113) ->
    #market_gold_item_data{id = 77, base_id = 20113,
                           catalg_1 = 3, catalg_2 = 7, init_price = 2000,
                           init_stock = 100, world_lev = 35, max_price = 6000,
                           min_price = 600, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(20112) ->
    #market_gold_item_data{id = 78, base_id = 20112,
                           catalg_1 = 3, catalg_2 = 7, init_price = 2000,
                           init_stock = 100, world_lev = 35, max_price = 6000,
                           min_price = 600, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(20111) ->
    #market_gold_item_data{id = 79, base_id = 20111,
                           catalg_1 = 3, catalg_2 = 7, init_price = 2000,
                           init_stock = 100, world_lev = 35, max_price = 6000,
                           min_price = 600, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(20102) ->
    #market_gold_item_data{id = 80, base_id = 20102,
                           catalg_1 = 3, catalg_2 = 7, init_price = 1500,
                           init_stock = 100, world_lev = 35, max_price = 4500,
                           min_price = 450, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(20131) ->
    #market_gold_item_data{id = 81, base_id = 20131,
                           catalg_1 = 3, catalg_2 = 7, init_price = 2800,
                           init_stock = 100, world_lev = 35, max_price = 8400,
                           min_price = 840, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(20152) ->
    #market_gold_item_data{id = 82, base_id = 20152,
                           catalg_1 = 3, catalg_2 = 7, init_price = 1600,
                           init_stock = 100, world_lev = 35, max_price = 4800,
                           min_price = 480, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(20149) ->
    #market_gold_item_data{id = 83, base_id = 20149,
                           catalg_1 = 3, catalg_2 = 7, init_price = 900,
                           init_stock = 100, world_lev = 35, max_price = 2700,
                           min_price = 270, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(20148) ->
    #market_gold_item_data{id = 84, base_id = 20148,
                           catalg_1 = 3, catalg_2 = 7, init_price = 900,
                           init_stock = 100, world_lev = 35, max_price = 2700,
                           min_price = 270, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(20150) ->
    #market_gold_item_data{id = 85, base_id = 20150,
                           catalg_1 = 3, catalg_2 = 7, init_price = 900,
                           init_stock = 100, world_lev = 35, max_price = 2700,
                           min_price = 270, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(20133) ->
    #market_gold_item_data{id = 86, base_id = 20133,
                           catalg_1 = 3, catalg_2 = 7, init_price = 600,
                           init_stock = 100, world_lev = 35, max_price = 1800,
                           min_price = 180, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(20153) ->
    #market_gold_item_data{id = 87, base_id = 20153,
                           catalg_1 = 3, catalg_2 = 7, init_price = 2500,
                           init_stock = 100, world_lev = 35, max_price = 3900,
                           min_price = 390, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(20154) ->
    #market_gold_item_data{id = 88, base_id = 20154,
                           catalg_1 = 3, catalg_2 = 7, init_price = 1200,
                           init_stock = 100, world_lev = 35, max_price = 3600,
                           min_price = 360, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(20147) ->
    #market_gold_item_data{id = 89, base_id = 20147,
                           catalg_1 = 3, catalg_2 = 7, init_price = 600,
                           init_stock = 100, world_lev = 35, max_price = 1800,
                           min_price = 180, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(20146) ->
    #market_gold_item_data{id = 90, base_id = 20146,
                           catalg_1 = 3, catalg_2 = 7, init_price = 600,
                           init_stock = 100, world_lev = 35, max_price = 1800,
                           min_price = 180, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(20145) ->
    #market_gold_item_data{id = 91, base_id = 20145,
                           catalg_1 = 3, catalg_2 = 7, init_price = 600,
                           init_stock = 100, world_lev = 35, max_price = 1800,
                           min_price = 180, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(20155) ->
    #market_gold_item_data{id = 92, base_id = 20155,
                           catalg_1 = 3, catalg_2 = 7, init_price = 600,
                           init_stock = 100, world_lev = 35, max_price = 1800,
                           min_price = 180, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(20144) ->
    #market_gold_item_data{id = 93, base_id = 20144,
                           catalg_1 = 3, catalg_2 = 7, init_price = 600,
                           init_stock = 100, world_lev = 35, max_price = 1800,
                           min_price = 180, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(20132) ->
    #market_gold_item_data{id = 94, base_id = 20132,
                           catalg_1 = 3, catalg_2 = 7, init_price = 3000,
                           init_stock = 100, world_lev = 35, max_price = 5400,
                           min_price = 1500, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(20135) ->
    #market_gold_item_data{id = 95, base_id = 20135,
                           catalg_1 = 3, catalg_2 = 7, init_price = 1800,
                           init_stock = 100, world_lev = 35, max_price = 5400,
                           min_price = 540, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(20134) ->
    #market_gold_item_data{id = 96, base_id = 20134,
                           catalg_1 = 3, catalg_2 = 7, init_price = 900,
                           init_stock = 100, world_lev = 35, max_price = 2700,
                           min_price = 270, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(20128) ->
    #market_gold_item_data{id = 97, base_id = 20128,
                           catalg_1 = 3, catalg_2 = 7, init_price = 900,
                           init_stock = 100, world_lev = 35, max_price = 2700,
                           min_price = 270, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(20106) ->
    #market_gold_item_data{id = 98, base_id = 20106,
                           catalg_1 = 3, catalg_2 = 7, init_price = 3000,
                           init_stock = 100, world_lev = 35, max_price = 9000,
                           min_price = 900, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(20105) ->
    #market_gold_item_data{id = 99, base_id = 20105,
                           catalg_1 = 3, catalg_2 = 7, init_price = 3000,
                           init_stock = 100, world_lev = 35, max_price = 9000,
                           min_price = 900, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(20101) ->
    #market_gold_item_data{id = 100, base_id = 20101,
                           catalg_1 = 3, catalg_2 = 7, init_price = 4000,
                           init_stock = 100, world_lev = 35, max_price = 12000,
                           min_price = 1200, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(20156) ->
    #market_gold_item_data{id = 101, base_id = 20156,
                           catalg_1 = 3, catalg_2 = 7, init_price = 1200,
                           init_stock = 100, world_lev = 35, max_price = 3600,
                           min_price = 360, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(20157) ->
    #market_gold_item_data{id = 102, base_id = 20157,
                           catalg_1 = 3, catalg_2 = 7, init_price = 1500,
                           init_stock = 100, world_lev = 35, max_price = 1800,
                           min_price = 180, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(20158) ->
    #market_gold_item_data{id = 103, base_id = 20158,
                           catalg_1 = 3, catalg_2 = 7, init_price = 1500,
                           init_stock = 100, world_lev = 35, max_price = 1800,
                           min_price = 180, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(20159) ->
    #market_gold_item_data{id = 104, base_id = 20159,
                           catalg_1 = 3, catalg_2 = 7, init_price = 2660,
                           init_stock = 100, world_lev = 35, max_price = 7980,
                           min_price = 798, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(20160) ->
    #market_gold_item_data{id = 105, base_id = 20160,
                           catalg_1 = 3, catalg_2 = 7, init_price = 600,
                           init_stock = 100, world_lev = 35, max_price = 1800,
                           min_price = 180, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(20161) ->
    #market_gold_item_data{id = 106, base_id = 20161,
                           catalg_1 = 3, catalg_2 = 7, init_price = 600,
                           init_stock = 100, world_lev = 35, max_price = 1800,
                           min_price = 180, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(20162) ->
    #market_gold_item_data{id = 107, base_id = 20162,
                           catalg_1 = 3, catalg_2 = 7, init_price = 600,
                           init_stock = 100, world_lev = 35, max_price = 1800,
                           min_price = 180, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(20163) ->
    #market_gold_item_data{id = 108, base_id = 20163,
                           catalg_1 = 3, catalg_2 = 7, init_price = 600,
                           init_stock = 100, world_lev = 35, max_price = 1800,
                           min_price = 180, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(20164) ->
    #market_gold_item_data{id = 109, base_id = 20164,
                           catalg_1 = 3, catalg_2 = 7, init_price = 1800,
                           init_stock = 100, world_lev = 35, max_price = 5400,
                           min_price = 540, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(20172) ->
    #market_gold_item_data{id = 110, base_id = 20172,
                           catalg_1 = 3, catalg_2 = 7, init_price = 6000,
                           init_stock = 100, world_lev = 35, max_price = 18000,
                           min_price = 3000, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(20107) ->
    #market_gold_item_data{id = 111, base_id = 20107,
                           catalg_1 = 3, catalg_2 = 7, init_price = 3000,
                           init_stock = 100, world_lev = 35, max_price = 4500,
                           min_price = 1500, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(20108) ->
    #market_gold_item_data{id = 112, base_id = 20108,
                           catalg_1 = 3, catalg_2 = 7, init_price = 3000,
                           init_stock = 100, world_lev = 35, max_price = 4500,
                           min_price = 1500, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(20109) ->
    #market_gold_item_data{id = 113, base_id = 20109,
                           catalg_1 = 3, catalg_2 = 7, init_price = 3000,
                           init_stock = 100, world_lev = 35, max_price = 4500,
                           min_price = 1500, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(20174) ->
    #market_gold_item_data{id = 114, base_id = 20174,
                           catalg_1 = 3, catalg_2 = 7, init_price = 3200,
                           init_stock = 100, world_lev = 35, max_price = 9600,
                           min_price = 1000, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(20176) ->
    #market_gold_item_data{id = 116, base_id = 20176,
                           catalg_1 = 3, catalg_2 = 7, init_price = 1200,
                           init_stock = 100, world_lev = 35, max_price = 3600,
                           min_price = 360, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(20177) ->
    #market_gold_item_data{id = 117, base_id = 20177,
                           catalg_1 = 3, catalg_2 = 7, init_price = 3600,
                           init_stock = 100, world_lev = 35, max_price = 10800,
                           min_price = 1080, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(20178) ->
    #market_gold_item_data{id = 118, base_id = 20178,
                           catalg_1 = 3, catalg_2 = 7, init_price = 2400,
                           init_stock = 100, world_lev = 35, max_price = 7200,
                           min_price = 720, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(20179) ->
    #market_gold_item_data{id = 119, base_id = 20179,
                           catalg_1 = 3, catalg_2 = 7, init_price = 3500,
                           init_stock = 100, world_lev = 35, max_price = 10500,
                           min_price = 1050, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(20181) ->
    #market_gold_item_data{id = 121, base_id = 20181,
                           catalg_1 = 3, catalg_2 = 7, init_price = 3500,
                           init_stock = 100, world_lev = 35, max_price = 10500,
                           min_price = 1050, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(20183) ->
    #market_gold_item_data{id = 123, base_id = 20183,
                           catalg_1 = 3, catalg_2 = 7, init_price = 3500,
                           init_stock = 100, world_lev = 35, max_price = 10500,
                           min_price = 1050, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(20184) ->
    #market_gold_item_data{id = 124, base_id = 20184,
                           catalg_1 = 3, catalg_2 = 7, init_price = 3500,
                           init_stock = 100, world_lev = 35, max_price = 10500,
                           min_price = 1050, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(23832) ->
    #market_gold_item_data{id = 200, base_id = 23832,
                           catalg_1 = 3, catalg_2 = 16, init_price = 80000,
                           init_stock = 100, world_lev = 60, max_price = 120000,
                           min_price = 48000, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(23819) ->
    #market_gold_item_data{id = 201, base_id = 23819,
                           catalg_1 = 3, catalg_2 = 16, init_price = 6000,
                           init_stock = 120, world_lev = 60, max_price = 9000,
                           min_price = 4200, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(23820) ->
    #market_gold_item_data{id = 202, base_id = 23820,
                           catalg_1 = 3, catalg_2 = 16, init_price = 9000,
                           init_stock = 120, world_lev = 60, max_price = 15000,
                           min_price = 6300, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(23821) ->
    #market_gold_item_data{id = 203, base_id = 23821,
                           catalg_1 = 3, catalg_2 = 16, init_price = 5500,
                           init_stock = 120, world_lev = 60, max_price = 9000,
                           min_price = 3850, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(23822) ->
    #market_gold_item_data{id = 204, base_id = 23822,
                           catalg_1 = 3, catalg_2 = 16, init_price = 6500,
                           init_stock = 120, world_lev = 60, max_price = 9750,
                           min_price = 4550, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(23823) ->
    #market_gold_item_data{id = 205, base_id = 23823,
                           catalg_1 = 3, catalg_2 = 16, init_price = 8500,
                           init_stock = 120, world_lev = 60, max_price = 13500,
                           min_price = 5950, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(23880) ->
    #market_gold_item_data{id = 206, base_id = 23880,
                           catalg_1 = 3, catalg_2 = 16, init_price = 30000,
                           init_stock = 30, world_lev = 60, max_price = 45000,
                           min_price = 21000, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(23881) ->
    #market_gold_item_data{id = 207, base_id = 23881,
                           catalg_1 = 3, catalg_2 = 16, init_price = 50000,
                           init_stock = 50, world_lev = 60, max_price = 75000,
                           min_price = 35000, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(23882) ->
    #market_gold_item_data{id = 208, base_id = 23882,
                           catalg_1 = 3, catalg_2 = 16, init_price = 50000,
                           init_stock = 50, world_lev = 60, max_price = 75000,
                           min_price = 35000, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(23883) ->
    #market_gold_item_data{id = 209, base_id = 23883,
                           catalg_1 = 3, catalg_2 = 16, init_price = 50000,
                           init_stock = 50, world_lev = 60, max_price = 75000,
                           min_price = 35000, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(23884) ->
    #market_gold_item_data{id = 210, base_id = 23884,
                           catalg_1 = 3, catalg_2 = 16, init_price = 50000,
                           init_stock = 50, world_lev = 60, max_price = 75000,
                           min_price = 35000, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(23885) ->
    #market_gold_item_data{id = 211, base_id = 23885,
                           catalg_1 = 3, catalg_2 = 16, init_price = 50000,
                           init_stock = 50, world_lev = 60, max_price = 75000,
                           min_price = 35000, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(23887) ->
    #market_gold_item_data{id = 212, base_id = 23887,
                           catalg_1 = 3, catalg_2 = 16, init_price = 50000,
                           init_stock = 50, world_lev = 60, max_price = 75000,
                           min_price = 35000, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(23888) ->
    #market_gold_item_data{id = 213, base_id = 23888,
                           catalg_1 = 3, catalg_2 = 16, init_price = 50000,
                           init_stock = 50, world_lev = 60, max_price = 75000,
                           min_price = 35000, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(23859) ->
    #market_gold_item_data{id = 214, base_id = 23859,
                           catalg_1 = 3, catalg_2 = 16, init_price = 10000,
                           init_stock = 1000, world_lev = 60, max_price = 20000,
                           min_price = 5000, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(23860) ->
    #market_gold_item_data{id = 215, base_id = 23860,
                           catalg_1 = 3, catalg_2 = 16, init_price = 30000,
                           init_stock = 1000, world_lev = 60, max_price = 60000,
                           min_price = 18000, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(23861) ->
    #market_gold_item_data{id = 216, base_id = 23861,
                           catalg_1 = 3, catalg_2 = 16, init_price = 56000,
                           init_stock = 500, world_lev = 60, max_price = 112000,
                           min_price = 33600, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(23830) ->
    #market_gold_item_data{id = 217, base_id = 23830,
                           catalg_1 = 3, catalg_2 = 16, init_price = 2000,
                           init_stock = 1000, world_lev = 60, max_price = 2000,
                           min_price = 2000, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(23831) ->
    #market_gold_item_data{id = 218, base_id = 23831,
                           catalg_1 = 3, catalg_2 = 16, init_price = 5000,
                           init_stock = 500, world_lev = 60, max_price = 5000,
                           min_price = 5000, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(70056) ->
    #market_gold_item_data{id = 219, base_id = 70056,
                           catalg_1 = 3, catalg_2 = 16, init_price = 50000,
                           init_stock = 500, world_lev = 60, max_price = 50000,
                           min_price = 50000, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(23900) ->
    #market_gold_item_data{id = 1, base_id = 23900,
                           catalg_1 = 3, catalg_2 = 19, init_price = 37500,
                           init_stock = 100, world_lev = 80, max_price = 112500,
                           min_price = 18750, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(23901) ->
    #market_gold_item_data{id = 2, base_id = 23901,
                           catalg_1 = 3, catalg_2 = 19, init_price = 30000,
                           init_stock = 100, world_lev = 80, max_price = 90000,
                           min_price = 15000, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(23902) ->
    #market_gold_item_data{id = 3, base_id = 23902,
                           catalg_1 = 3, catalg_2 = 19, init_price = 20000,
                           init_stock = 100, world_lev = 80, max_price = 60000,
                           min_price = 10000, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(23903) ->
    #market_gold_item_data{id = 4, base_id = 23903,
                           catalg_1 = 3, catalg_2 = 19, init_price = 40000,
                           init_stock = 100, world_lev = 80, max_price = 120000,
                           min_price = 20000, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(23904) ->
    #market_gold_item_data{id = 5, base_id = 23904,
                           catalg_1 = 3, catalg_2 = 19, init_price = 30000,
                           init_stock = 100, world_lev = 80, max_price = 90000,
                           min_price = 15000, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(23905) ->
    #market_gold_item_data{id = 6, base_id = 23905,
                           catalg_1 = 3, catalg_2 = 19, init_price = 40000,
                           init_stock = 100, world_lev = 80, max_price = 120000,
                           min_price = 20000, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(23906) ->
    #market_gold_item_data{id = 7, base_id = 23906,
                           catalg_1 = 3, catalg_2 = 19, init_price = 35000,
                           init_stock = 100, world_lev = 80, max_price = 105000,
                           min_price = 17500, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(23907) ->
    #market_gold_item_data{id = 8, base_id = 23907,
                           catalg_1 = 3, catalg_2 = 19, init_price = 30000,
                           init_stock = 100, world_lev = 80, max_price = 90000,
                           min_price = 15000, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(23908) ->
    #market_gold_item_data{id = 9, base_id = 23908,
                           catalg_1 = 3, catalg_2 = 19, init_price = 25000,
                           init_stock = 100, world_lev = 80, max_price = 75000,
                           min_price = 12500, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(23909) ->
    #market_gold_item_data{id = 10, base_id = 23909,
                           catalg_1 = 3, catalg_2 = 19, init_price = 32500,
                           init_stock = 100, world_lev = 80, max_price = 97500,
                           min_price = 16250, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(23910) ->
    #market_gold_item_data{id = 11, base_id = 23910,
                           catalg_1 = 3, catalg_2 = 19, init_price = 25000,
                           init_stock = 100, world_lev = 80, max_price = 75000,
                           min_price = 12500, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(23911) ->
    #market_gold_item_data{id = 12, base_id = 23911,
                           catalg_1 = 3, catalg_2 = 19, init_price = 30000,
                           init_stock = 100, world_lev = 80, max_price = 90000,
                           min_price = 15000, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(23912) ->
    #market_gold_item_data{id = 13, base_id = 23912,
                           catalg_1 = 3, catalg_2 = 19, init_price = 20000,
                           init_stock = 100, world_lev = 80, max_price = 60000,
                           min_price = 10000, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(23913) ->
    #market_gold_item_data{id = 14, base_id = 23913,
                           catalg_1 = 3, catalg_2 = 19, init_price = 17500,
                           init_stock = 100, world_lev = 80, max_price = 52500,
                           min_price = 8750, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(23914) ->
    #market_gold_item_data{id = 15, base_id = 23914,
                           catalg_1 = 3, catalg_2 = 19, init_price = 15000,
                           init_stock = 100, world_lev = 80, max_price = 45000,
                           min_price = 7500, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(23915) ->
    #market_gold_item_data{id = 16, base_id = 23915,
                           catalg_1 = 3, catalg_2 = 19, init_price = 12500,
                           init_stock = 100, world_lev = 80, max_price = 37500,
                           min_price = 6250, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(23916) ->
    #market_gold_item_data{id = 1, base_id = 23916,
                           catalg_1 = 3, catalg_2 = 18, init_price = 9000,
                           init_stock = 100, world_lev = 80, max_price = 27000,
                           min_price = 4500, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(23917) ->
    #market_gold_item_data{id = 2, base_id = 23917,
                           catalg_1 = 3, catalg_2 = 18, init_price = 7500,
                           init_stock = 100, world_lev = 80, max_price = 22500,
                           min_price = 3750, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(23918) ->
    #market_gold_item_data{id = 3, base_id = 23918,
                           catalg_1 = 3, catalg_2 = 18, init_price = 5000,
                           init_stock = 100, world_lev = 80, max_price = 15000,
                           min_price = 2500, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(23919) ->
    #market_gold_item_data{id = 4, base_id = 23919,
                           catalg_1 = 3, catalg_2 = 18, init_price = 6000,
                           init_stock = 100, world_lev = 80, max_price = 18000,
                           min_price = 3000, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(23920) ->
    #market_gold_item_data{id = 5, base_id = 23920,
                           catalg_1 = 3, catalg_2 = 18, init_price = 3000,
                           init_stock = 100, world_lev = 80, max_price = 9000,
                           min_price = 1500, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(23921) ->
    #market_gold_item_data{id = 6, base_id = 23921,
                           catalg_1 = 3, catalg_2 = 18, init_price = 4500,
                           init_stock = 100, world_lev = 80, max_price = 13500,
                           min_price = 2250, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(23922) ->
    #market_gold_item_data{id = 7, base_id = 23922,
                           catalg_1 = 3, catalg_2 = 18, init_price = 4000,
                           init_stock = 100, world_lev = 80, max_price = 12000,
                           min_price = 2000, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(23923) ->
    #market_gold_item_data{id = 8, base_id = 23923,
                           catalg_1 = 3, catalg_2 = 18, init_price = 3000,
                           init_stock = 100, world_lev = 80, max_price = 9000,
                           min_price = 1500, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(23924) ->
    #market_gold_item_data{id = 9, base_id = 23924,
                           catalg_1 = 3, catalg_2 = 18, init_price = 9000,
                           init_stock = 100, world_lev = 80, max_price = 27000,
                           min_price = 4500, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(23925) ->
    #market_gold_item_data{id = 10, base_id = 23925,
                           catalg_1 = 3, catalg_2 = 18, init_price = 5000,
                           init_stock = 100, world_lev = 80, max_price = 15000,
                           min_price = 2500, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(23926) ->
    #market_gold_item_data{id = 11, base_id = 23926,
                           catalg_1 = 3, catalg_2 = 18, init_price = 7500,
                           init_stock = 100, world_lev = 80, max_price = 22500,
                           min_price = 3750, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(23927) ->
    #market_gold_item_data{id = 12, base_id = 23927,
                           catalg_1 = 3, catalg_2 = 18, init_price = 6000,
                           init_stock = 100, world_lev = 80, max_price = 18000,
                           min_price = 3000, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(23928) ->
    #market_gold_item_data{id = 13, base_id = 23928,
                           catalg_1 = 3, catalg_2 = 18, init_price = 5000,
                           init_stock = 100, world_lev = 80, max_price = 15000,
                           min_price = 2500, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(23929) ->
    #market_gold_item_data{id = 14, base_id = 23929,
                           catalg_1 = 3, catalg_2 = 18, init_price = 4000,
                           init_stock = 100, world_lev = 80, max_price = 12000,
                           min_price = 2000, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(23930) ->
    #market_gold_item_data{id = 15, base_id = 23930,
                           catalg_1 = 3, catalg_2 = 18, init_price = 4000,
                           init_stock = 100, world_lev = 80, max_price = 12000,
                           min_price = 2000, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(23931) ->
    #market_gold_item_data{id = 16, base_id = 23931,
                           catalg_1 = 3, catalg_2 = 18, init_price = 3500,
                           init_stock = 100, world_lev = 80, max_price = 10500,
                           min_price = 1750, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(23932) ->
    #market_gold_item_data{id = 17, base_id = 23932,
                           catalg_1 = 3, catalg_2 = 18, init_price = 3000,
                           init_stock = 100, world_lev = 80, max_price = 9000,
                           min_price = 1500, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(23933) ->
    #market_gold_item_data{id = 18, base_id = 23933,
                           catalg_1 = 3, catalg_2 = 18, init_price = 2500,
                           init_stock = 100, world_lev = 80, max_price = 7500,
                           min_price = 1250, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(23934) ->
    #market_gold_item_data{id = 19, base_id = 23934,
                           catalg_1 = 3, catalg_2 = 18, init_price = 4000,
                           init_stock = 100, world_lev = 80, max_price = 12000,
                           min_price = 2000, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(23935) ->
    #market_gold_item_data{id = 20, base_id = 23935,
                           catalg_1 = 3, catalg_2 = 18, init_price = 4500,
                           init_stock = 100, world_lev = 80, max_price = 13500,
                           min_price = 2250, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(20018) ->
    #market_gold_item_data{id = 1, base_id = 20018,
                           catalg_1 = 4, catalg_2 = 1, init_price = 22000,
                           init_stock = 60, world_lev = 70, max_price = 18000,
                           min_price = 15000, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(20017) ->
    #market_gold_item_data{id = 2, base_id = 20017,
                           catalg_1 = 4, catalg_2 = 1, init_price = 10000,
                           init_stock = 60, world_lev = 55, max_price = 8000,
                           min_price = 6000, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(23550) ->
    #market_gold_item_data{id = 3, base_id = 23550,
                           catalg_1 = 4, catalg_2 = 1, init_price = 15000,
                           init_stock = 1000, world_lev = 70, max_price = 20000,
                           min_price = 10000, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(23559) ->
    #market_gold_item_data{id = 4, base_id = 23559,
                           catalg_1 = 4, catalg_2 = 1, init_price = 120000,
                           init_stock = 500, world_lev = 70, max_price = 150000,
                           min_price = 60000, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(23555) ->
    #market_gold_item_data{id = 5, base_id = 23555,
                           catalg_1 = 4, catalg_2 = 1, init_price = 3000,
                           init_stock = 1000, world_lev = 70, max_price = 3300,
                           min_price = 2400, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(23556) ->
    #market_gold_item_data{id = 6, base_id = 23556,
                           catalg_1 = 4, catalg_2 = 1, init_price = 4000,
                           init_stock = 1000, world_lev = 80, max_price = 4000,
                           min_price = 4000, day_limit = 10, classes = 0,
                           up_ratio = 1000, down_ratio = 1000};
get(21201) ->
    #market_gold_item_data{id = 1, base_id = 21201,
                           catalg_1 = 6, catalg_2 = 1, init_price = 1500,
                           init_stock = 300, world_lev = 20, max_price = 4500,
                           min_price = 1203, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(21203) ->
    #market_gold_item_data{id = 2, base_id = 21203,
                           catalg_1 = 6, catalg_2 = 1, init_price = 1500,
                           init_stock = 300, world_lev = 20, max_price = 4500,
                           min_price = 1203, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(21204) ->
    #market_gold_item_data{id = 3, base_id = 21204,
                           catalg_1 = 6, catalg_2 = 1, init_price = 1500,
                           init_stock = 300, world_lev = 20, max_price = 4500,
                           min_price = 1203, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(21200) ->
    #market_gold_item_data{id = 4, base_id = 21200,
                           catalg_1 = 6, catalg_2 = 1, init_price = 1500,
                           init_stock = 300, world_lev = 20, max_price = 4500,
                           min_price = 1203, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(21202) ->
    #market_gold_item_data{id = 5, base_id = 21202,
                           catalg_1 = 6, catalg_2 = 1, init_price = 3600,
                           init_stock = 300, world_lev = 20, max_price = 10800,
                           min_price = 2802, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(21205) ->
    #market_gold_item_data{id = 6, base_id = 21205,
                           catalg_1 = 6, catalg_2 = 1, init_price = 3600,
                           init_stock = 300, world_lev = 20, max_price = 10800,
                           min_price = 1803, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(21206) ->
    #market_gold_item_data{id = 7, base_id = 21206,
                           catalg_1 = 6, catalg_2 = 1, init_price = 3600,
                           init_stock = 300, world_lev = 20, max_price = 10800,
                           min_price = 1803, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(21207) ->
    #market_gold_item_data{id = 8, base_id = 21207,
                           catalg_1 = 6, catalg_2 = 1, init_price = 5000,
                           init_stock = 500, world_lev = 20, max_price = 6500,
                           min_price = 3000, day_limit = 4, classes = 0,
                           up_ratio = 1000, down_ratio = 1000};
get(21103) ->
    #market_gold_item_data{id = 2, base_id = 21103,
                           catalg_1 = 7, catalg_2 = 1, init_price = 26000,
                           init_stock = 1500, world_lev = 75, max_price = 26000,
                           min_price = 26000, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(21102) ->
    #market_gold_item_data{id = 3, base_id = 21102,
                           catalg_1 = 7, catalg_2 = 1, init_price = 21000,
                           init_stock = 2000, world_lev = 55, max_price = 21000,
                           min_price = 21000, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(21101) ->
    #market_gold_item_data{id = 4, base_id = 21101,
                           catalg_1 = 7, catalg_2 = 1, init_price = 14000,
                           init_stock = 2000, world_lev = 45, max_price = 14000,
                           min_price = 14000, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(21100) ->
    #market_gold_item_data{id = 5, base_id = 21100,
                           catalg_1 = 7, catalg_2 = 1, init_price = 6000,
                           init_stock = 3000, world_lev = 30, max_price = 6000,
                           min_price = 6000, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(21130) ->
    #market_gold_item_data{id = 6, base_id = 21130,
                           catalg_1 = 7, catalg_2 = 1, init_price = 6500,
                           init_stock = 5000, world_lev = 65, max_price = 12000,
                           min_price = 4000, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(21131) ->
    #market_gold_item_data{id = 7, base_id = 21131,
                           catalg_1 = 7, catalg_2 = 1, init_price = 22000,
                           init_stock = 1000, world_lev = 75, max_price = 22000,
                           min_price = 22000, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(21135) ->
    #market_gold_item_data{id = 8, base_id = 21135,
                           catalg_1 = 7, catalg_2 = 1, init_price = 3000,
                           init_stock = 1000, world_lev = 60, max_price = 3000,
                           min_price = 3000, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(21136) ->
    #market_gold_item_data{id = 9, base_id = 21136,
                           catalg_1 = 7, catalg_2 = 1, init_price = 5000,
                           init_stock = 1000, world_lev = 35, max_price = 5000,
                           min_price = 5000, day_limit = 10, classes = 0,
                           up_ratio = 1000, down_ratio = 1000};
get(20045) ->
    #market_gold_item_data{id = 1, base_id = 20045,
                           catalg_1 = 5, catalg_2 = 1, init_price = 1200,
                           init_stock = 100000, world_lev = 20,
                           max_price = 1200, min_price = 1200, classes = 0,
                           up_ratio = 1000, down_ratio = 1000};
get(20046) ->
    #market_gold_item_data{id = 2, base_id = 20046,
                           catalg_1 = 5, catalg_2 = 1, init_price = 8000,
                           init_stock = 100000, world_lev = 20,
                           max_price = 8000, min_price = 8000, classes = 0,
                           up_ratio = 1000, down_ratio = 1000};
get(20005) ->
    #market_gold_item_data{id = 3, base_id = 20005,
                           catalg_1 = 5, catalg_2 = 1, init_price = 1200,
                           init_stock = 500, world_lev = 20, max_price = 3600,
                           min_price = 602, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(20054) ->
    #market_gold_item_data{id = 4, base_id = 20054,
                           catalg_1 = 5, catalg_2 = 1, init_price = 4000,
                           init_stock = 1000, world_lev = 20, max_price = 6000,
                           min_price = 2801, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(20055) ->
    #market_gold_item_data{id = 5, base_id = 20055,
                           catalg_1 = 5, catalg_2 = 1, init_price = 4000,
                           init_stock = 1000, world_lev = 20, max_price = 6000,
                           min_price = 2803, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(20056) ->
    #market_gold_item_data{id = 6, base_id = 20056,
                           catalg_1 = 5, catalg_2 = 1, init_price = 4000,
                           init_stock = 1000, world_lev = 20, max_price = 6000,
                           min_price = 2802, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(20057) ->
    #market_gold_item_data{id = 7, base_id = 20057,
                           catalg_1 = 5, catalg_2 = 1, init_price = 4000,
                           init_stock = 1000, world_lev = 20, max_price = 6000,
                           min_price = 2804, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(20025) ->
    #market_gold_item_data{id = 8, base_id = 20025,
                           catalg_1 = 5, catalg_2 = 1, init_price = 3000,
                           init_stock = 1000, world_lev = 20, max_price = 9000,
                           min_price = 1500, classes = 0, up_ratio = 1000,
                           down_ratio = 1000};
get(20044) ->
    #market_gold_item_data{id = 9, base_id = 20044,
                           catalg_1 = 5, catalg_2 = 1, init_price = 19999,
                           init_stock = 100000, world_lev = 20,
                           max_price = 19999, min_price = 19999, classes = 0,
                           up_ratio = 1000, down_ratio = 1000};
get(29105) ->
    #market_gold_item_data{id = 10, base_id = 29105,
                           catalg_1 = 5, catalg_2 = 1, init_price = 2000,
                           init_stock = 100000, world_lev = 20,
                           max_price = 2000, min_price = 2000, classes = 0,
                           up_ratio = 1000, down_ratio = 1000};
get(20507) ->
    #market_gold_item_data{id = 11, base_id = 20507,
                           catalg_1 = 5, catalg_2 = 1, init_price = 10000,
                           init_stock = 100000, world_lev = 20,
                           max_price = 10000, min_price = 10000, classes = 0,
                           up_ratio = 1000, down_ratio = 1000};
get(_) -> none.

get_exchange(35) -> 50;
get_exchange(40) -> 50;
get_exchange(45) -> 50;
get_exchange(50) -> 50;
get_exchange(55) -> 50;
get_exchange(60) -> 50;
get_exchange(65) -> 50;
get_exchange(70) -> 50;
get_exchange(75) -> 50;
get_exchange(80) -> 50;
get_exchange(85) -> 50;
get_exchange(90) -> 50;
get_exchange(95) -> 50;
get_exchange(100) -> 50;
get_exchange(105) -> 50;
get_exchange(110) -> 50;
get_exchange(115) -> 50;
get_exchange(120) -> 50;
get_exchange(125) -> 50;
get_exchange(130) -> 50;
get_exchange(135) -> 50;
get_exchange(140) -> 50;
get_exchange(145) -> 50;
get_exchange(150) -> 50;
get_exchange(155) -> 50;
get_exchange(160) -> 50;
get_exchange(165) -> 50;
get_exchange(170) -> 50;
get_exchange(175) -> 50;
get_exchange(180) -> 50;
get_exchange(185) -> 50;
get_exchange(190) -> 50;
get_exchange(195) -> 50;
get_exchange(200) -> 50;
get_exchange(_WorldLev) -> none.

get_invisible_price(20060) -> 675;
get_invisible_price(20009) -> 4000;
get_invisible_price(20010) -> 15000;
get_invisible_price(20011) -> 20000;
get_invisible_price(29104) -> 3000;
get_invisible_price(20175) -> 2000;
get_invisible_price(20619) -> 10000;
get_invisible_price(20620) -> 6000;
get_invisible_price(20621) -> 10000;
get_invisible_price(20622) -> 10000;
get_invisible_price(20623) -> 10000;
get_invisible_price(20624) -> 6000;
get_invisible_price(20625) -> 6000;
get_invisible_price(20626) -> 10000;
get_invisible_price(20627) -> 6000;
get_invisible_price(20628) -> 6000;
get_invisible_price(20629) -> 6000;
get_invisible_price(20630) -> 6000;
get_invisible_price(20631) -> 6000;
get_invisible_price(20632) -> 6000;
get_invisible_price(20633) -> 6000;
get_invisible_price(20634) -> 6000;
get_invisible_price(20635) -> 6000;
get_invisible_price(20636) -> 6000;
get_invisible_price(20637) -> 6000;
get_invisible_price(22205) -> 150000;
get_invisible_price(22207) -> 150000;
get_invisible_price(22441) -> 150000;
get_invisible_price(22442) -> 150000;
get_invisible_price(22444) -> 150000;
get_invisible_price(22446) -> 150000;
get_invisible_price(22448) -> 150000;
get_invisible_price(21104) -> 50000;
get_invisible_price(22208) -> 30000;
get_invisible_price(23674) -> 50000;
get_invisible_price(23671) -> 50000;
get_invisible_price(24100) -> 5200;
get_invisible_price(24101) -> 5200;
get_invisible_price(24102) -> 5200;
get_invisible_price(24103) -> 5200;
get_invisible_price(24104) -> 5200;
get_invisible_price(24105) -> 5200;
get_invisible_price(24106) -> 16000;
get_invisible_price(24107) -> 16000;
get_invisible_price(24108) -> 16000;
get_invisible_price(24109) -> 16000;
get_invisible_price(24110) -> 16000;
get_invisible_price(24111) -> 16000;
get_invisible_price(24112) -> 24000;
get_invisible_price(24113) -> 24000;
get_invisible_price(24114) -> 24000;
get_invisible_price(24115) -> 24000;
get_invisible_price(24116) -> 24000;
get_invisible_price(24117) -> 24000;
get_invisible_price(24118) -> 48000;
get_invisible_price(24119) -> 48000;
get_invisible_price(24120) -> 48000;
get_invisible_price(24121) -> 48000;
get_invisible_price(24122) -> 48000;
get_invisible_price(24123) -> 48000;
get_invisible_price(24124) -> 48000;
get_invisible_price(24125) -> 48000;
get_invisible_price(24126) -> 48000;
get_invisible_price(24127) -> 48000;
get_invisible_price(24128) -> 48000;
get_invisible_price(24129) -> 48000;
get_invisible_price(24130) -> 5200;
get_invisible_price(24131) -> 5200;
get_invisible_price(24132) -> 5200;
get_invisible_price(24133) -> 5200;
get_invisible_price(24134) -> 5200;
get_invisible_price(24135) -> 5200;
get_invisible_price(24136) -> 64000;
get_invisible_price(24137) -> 64000;
get_invisible_price(24138) -> 64000;
get_invisible_price(24139) -> 64000;
get_invisible_price(24140) -> 64000;
get_invisible_price(24141) -> 64000;
get_invisible_price(24142) -> 64000;
get_invisible_price(24143) -> 64000;
get_invisible_price(24144) -> 64000;
get_invisible_price(24145) -> 64000;
get_invisible_price(24146) -> 64000;
get_invisible_price(24147) -> 64000;
get_invisible_price(24148) -> 64000;
get_invisible_price(21232) -> 5000;
get_invisible_price(21233) -> 5000;
get_invisible_price(23554) -> 4500;
get_invisible_price(21137) -> 15000;
get_invisible_price(23665) -> 15000;
get_invisible_price(23666) -> 35000;
get_invisible_price(23667) -> 15000;
get_invisible_price(23668) -> 35000;
get_invisible_price(23670) -> 35000;
get_invisible_price(22791) -> 15000;
get_invisible_price(22792) -> 15000;
get_invisible_price(22793) -> 15000;
get_invisible_price(22794) -> 15000;
get_invisible_price(22795) -> 15000;
get_invisible_price(22796) -> 15000;
get_invisible_price(22797) -> 15000;
get_invisible_price(22798) -> 15000;
get_invisible_price(22799) -> 15000;
get_invisible_price(22800) -> 15000;
get_invisible_price(22801) -> 15000;
get_invisible_price(22802) -> 15000;
get_invisible_price(22803) -> 15000;
get_invisible_price(22804) -> 15000;
get_invisible_price(22819) -> 15000;
get_invisible_price(22820) -> 15000;
get_invisible_price(22821) -> 15000;
get_invisible_price(22822) -> 15000;
get_invisible_price(22823) -> 15000;
get_invisible_price(22824) -> 15000;
get_invisible_price(22825) -> 15000;
get_invisible_price(22826) -> 15000;
get_invisible_price(22827) -> 15000;
get_invisible_price(22831) -> 15000;
get_invisible_price(22832) -> 15000;
get_invisible_price(22833) -> 15000;
get_invisible_price(21234) -> 6000;
get_invisible_price(21235) -> 6000;
get_invisible_price(21236) -> 6000;
get_invisible_price(20022) -> 4500;
get_invisible_price(21237) -> 5000;
get_invisible_price(21238) -> 6000;
get_invisible_price(_BaseId) -> false.

get_invisible_world_lev(20060) -> 35;
get_invisible_world_lev(20009) -> 35;
get_invisible_world_lev(20010) -> 35;
get_invisible_world_lev(20011) -> 35;
get_invisible_world_lev(29104) -> 20;
get_invisible_world_lev(20175) -> 20;
get_invisible_world_lev(20619) -> 20;
get_invisible_world_lev(20620) -> 20;
get_invisible_world_lev(20621) -> 20;
get_invisible_world_lev(20622) -> 20;
get_invisible_world_lev(20623) -> 20;
get_invisible_world_lev(20624) -> 20;
get_invisible_world_lev(20625) -> 20;
get_invisible_world_lev(20626) -> 20;
get_invisible_world_lev(20627) -> 20;
get_invisible_world_lev(20628) -> 20;
get_invisible_world_lev(20629) -> 20;
get_invisible_world_lev(20630) -> 20;
get_invisible_world_lev(20631) -> 20;
get_invisible_world_lev(20632) -> 20;
get_invisible_world_lev(20633) -> 20;
get_invisible_world_lev(20634) -> 20;
get_invisible_world_lev(20635) -> 20;
get_invisible_world_lev(20636) -> 20;
get_invisible_world_lev(20637) -> 20;
get_invisible_world_lev(22205) -> 35;
get_invisible_world_lev(22207) -> 35;
get_invisible_world_lev(22441) -> 35;
get_invisible_world_lev(22442) -> 35;
get_invisible_world_lev(22444) -> 35;
get_invisible_world_lev(22446) -> 35;
get_invisible_world_lev(22448) -> 35;
get_invisible_world_lev(21104) -> 75;
get_invisible_world_lev(22208) -> 20;
get_invisible_world_lev(23674) -> 80;
get_invisible_world_lev(23671) -> 80;
get_invisible_world_lev(24100) -> 35;
get_invisible_world_lev(24101) -> 35;
get_invisible_world_lev(24102) -> 35;
get_invisible_world_lev(24103) -> 35;
get_invisible_world_lev(24104) -> 35;
get_invisible_world_lev(24105) -> 35;
get_invisible_world_lev(24106) -> 45;
get_invisible_world_lev(24107) -> 45;
get_invisible_world_lev(24108) -> 45;
get_invisible_world_lev(24109) -> 45;
get_invisible_world_lev(24110) -> 45;
get_invisible_world_lev(24111) -> 45;
get_invisible_world_lev(24112) -> 55;
get_invisible_world_lev(24113) -> 55;
get_invisible_world_lev(24114) -> 55;
get_invisible_world_lev(24115) -> 55;
get_invisible_world_lev(24116) -> 55;
get_invisible_world_lev(24117) -> 55;
get_invisible_world_lev(24118) -> 65;
get_invisible_world_lev(24119) -> 65;
get_invisible_world_lev(24120) -> 65;
get_invisible_world_lev(24121) -> 65;
get_invisible_world_lev(24122) -> 65;
get_invisible_world_lev(24123) -> 65;
get_invisible_world_lev(24124) -> 65;
get_invisible_world_lev(24125) -> 65;
get_invisible_world_lev(24126) -> 65;
get_invisible_world_lev(24127) -> 65;
get_invisible_world_lev(24128) -> 65;
get_invisible_world_lev(24129) -> 65;
get_invisible_world_lev(24130) -> 35;
get_invisible_world_lev(24131) -> 35;
get_invisible_world_lev(24132) -> 35;
get_invisible_world_lev(24133) -> 35;
get_invisible_world_lev(24134) -> 35;
get_invisible_world_lev(24135) -> 35;
get_invisible_world_lev(24136) -> 75;
get_invisible_world_lev(24137) -> 75;
get_invisible_world_lev(24138) -> 75;
get_invisible_world_lev(24139) -> 75;
get_invisible_world_lev(24140) -> 75;
get_invisible_world_lev(24141) -> 75;
get_invisible_world_lev(24142) -> 75;
get_invisible_world_lev(24143) -> 75;
get_invisible_world_lev(24144) -> 75;
get_invisible_world_lev(24145) -> 75;
get_invisible_world_lev(24146) -> 75;
get_invisible_world_lev(24147) -> 75;
get_invisible_world_lev(24148) -> 75;
get_invisible_world_lev(21232) -> 105;
get_invisible_world_lev(21233) -> 105;
get_invisible_world_lev(23554) -> 80;
get_invisible_world_lev(21137) -> 80;
get_invisible_world_lev(23665) -> 80;
get_invisible_world_lev(23666) -> 80;
get_invisible_world_lev(23667) -> 80;
get_invisible_world_lev(23668) -> 80;
get_invisible_world_lev(23670) -> 80;
get_invisible_world_lev(22791) -> 50;
get_invisible_world_lev(22792) -> 50;
get_invisible_world_lev(22793) -> 50;
get_invisible_world_lev(22794) -> 50;
get_invisible_world_lev(22795) -> 50;
get_invisible_world_lev(22796) -> 50;
get_invisible_world_lev(22797) -> 50;
get_invisible_world_lev(22798) -> 50;
get_invisible_world_lev(22799) -> 50;
get_invisible_world_lev(22800) -> 50;
get_invisible_world_lev(22801) -> 50;
get_invisible_world_lev(22802) -> 50;
get_invisible_world_lev(22803) -> 50;
get_invisible_world_lev(22804) -> 50;
get_invisible_world_lev(22819) -> 50;
get_invisible_world_lev(22820) -> 50;
get_invisible_world_lev(22821) -> 50;
get_invisible_world_lev(22822) -> 50;
get_invisible_world_lev(22823) -> 50;
get_invisible_world_lev(22824) -> 50;
get_invisible_world_lev(22825) -> 50;
get_invisible_world_lev(22826) -> 50;
get_invisible_world_lev(22827) -> 50;
get_invisible_world_lev(22831) -> 50;
get_invisible_world_lev(22832) -> 50;
get_invisible_world_lev(22833) -> 50;
get_invisible_world_lev(21234) -> 120;
get_invisible_world_lev(21235) -> 120;
get_invisible_world_lev(21236) -> 85;
get_invisible_world_lev(20022) -> 40;
get_invisible_world_lev(21237) -> 85;
get_invisible_world_lev(21238) -> 115;
get_invisible_world_lev(_BaseId) -> false.

get_const_price(20615) -> 800;
get_const_price(20653) -> 600;
get_const_price(20654) -> 600;
get_const_price(20655) -> 600;
get_const_price(23556) -> 600;
get_const_price(23830) -> 600;
get_const_price(23831) -> 600;
get_const_price(20021) -> 600;
get_const_price(_BaseId) -> false.

get_const_world_lev(20615) -> 35;
get_const_world_lev(20653) -> 75;
get_const_world_lev(20654) -> 75;
get_const_world_lev(20655) -> 75;
get_const_world_lev(23556) -> 80;
get_const_world_lev(23830) -> 60;
get_const_world_lev(23831) -> 60;
get_const_world_lev(20021) -> 40;
get_const_world_lev(_BaseId) -> false.

get_exchange_item(20601) -> {20600, 4};
get_exchange_item(20602) -> {20600, 16};
get_exchange_item(20604) -> {20603, 4};
get_exchange_item(20605) -> {20603, 16};
get_exchange_item(20607) -> {20606, 4};
get_exchange_item(20608) -> {20606, 16};
get_exchange_item(20613) -> {20612, 4};
get_exchange_item(20614) -> {20612, 16};
get_exchange_item(20656) -> {20653, 3};
get_exchange_item(20657) -> {20654, 3};
get_exchange_item(20658) -> {20655, 3};
get_exchange_item(20659) -> {20653, 9};
get_exchange_item(20660) -> {20654, 9};
get_exchange_item(20661) -> {20655, 9};
get_exchange_item(20662) -> {20653, 27};
get_exchange_item(20663) -> {20654, 27};
get_exchange_item(20664) -> {20655, 27};
get_exchange_item(_BaseId) -> false.

get_exchange_world_lev(20601) -> 35;
get_exchange_world_lev(20602) -> 35;
get_exchange_world_lev(20604) -> 35;
get_exchange_world_lev(20605) -> 35;
get_exchange_world_lev(20607) -> 35;
get_exchange_world_lev(20608) -> 35;
get_exchange_world_lev(20613) -> 35;
get_exchange_world_lev(20614) -> 35;
get_exchange_world_lev(20656) -> 75;
get_exchange_world_lev(20657) -> 75;
get_exchange_world_lev(20658) -> 75;
get_exchange_world_lev(20659) -> 80;
get_exchange_world_lev(20660) -> 80;
get_exchange_world_lev(20661) -> 80;
get_exchange_world_lev(20662) -> 90;
get_exchange_world_lev(20663) -> 90;
get_exchange_world_lev(20664) -> 90;
get_exchange_world_lev(_BaseId) -> false.

get_limit({20021, Val})
    when Val >= 1 andalso Val =< 49 ->
    #market_gold_limit_data{id = 20021, min = 1, max = 49,
                            is_show = 1, num = 1};
get_limit({20021, Val})
    when Val >= 50 andalso Val =< 69 ->
    #market_gold_limit_data{id = 20021, min = 50, max = 69,
                            is_show = 1, num = 5};
get_limit({20021, Val})
    when Val >= 70 andalso Val =< 89 ->
    #market_gold_limit_data{id = 20021, min = 70, max = 89,
                            is_show = 1, num = 8};
get_limit({20021, Val})
    when Val >= 90 andalso Val =< 200 ->
    #market_gold_limit_data{id = 20021, min = 90, max = 200,
                            is_show = 1, num = 12};
get_limit({21207, Val})
    when Val >= 1 andalso Val =< 69 ->
    #market_gold_limit_data{id = 21207, min = 1, max = 69,
                            is_show = 1, num = 1};
get_limit({21207, Val})
    when Val >= 70 andalso Val =< 200 ->
    #market_gold_limit_data{id = 21207, min = 70, max = 200,
                            is_show = 1, num = 4};
get_limit({20653, Val})
    when Val >= 1 andalso Val =< 79 ->
    #market_gold_limit_data{id = 20653, min = 1, max = 79,
                            is_show = 0, num = 0};
get_limit({20653, Val})
    when Val >= 80 andalso Val =< 89 ->
    #market_gold_limit_data{id = 20653, min = 80, max = 89,
                            is_show = 1, num = 9};
get_limit({20653, Val})
    when Val >= 90 andalso Val =< 94 ->
    #market_gold_limit_data{id = 20653, min = 90, max = 94,
                            is_show = 1, num = 18};
get_limit({20653, Val})
    when Val >= 95 andalso Val =< 100 ->
    #market_gold_limit_data{id = 20653, min = 95, max = 100,
                            is_show = 1, num = 27};
get_limit({20653, Val})
    when Val >= 101 andalso Val =< 102 ->
    #market_gold_limit_data{id = 20653, min = 101,
                            max = 102, is_show = 1, num = 45};
get_limit({20653, Val})
    when Val >= 103 andalso Val =< 105 ->
    #market_gold_limit_data{id = 20653, min = 103,
                            max = 105, is_show = 1, num = 60};
get_limit({20653, Val})
    when Val >= 106 andalso Val =< 108 ->
    #market_gold_limit_data{id = 20653, min = 106,
                            max = 108, is_show = 1, num = 81};
get_limit({20653, Val})
    when Val >= 109 andalso Val =< 200 ->
    #market_gold_limit_data{id = 20653, min = 109,
                            max = 200, is_show = 1, num = 108};
get_limit({20654, Val})
    when Val >= 1 andalso Val =< 79 ->
    #market_gold_limit_data{id = 20654, min = 1, max = 79,
                            is_show = 0, num = 0};
get_limit({20654, Val})
    when Val >= 80 andalso Val =< 89 ->
    #market_gold_limit_data{id = 20654, min = 80, max = 89,
                            is_show = 1, num = 36};
get_limit({20654, Val})
    when Val >= 90 andalso Val =< 94 ->
    #market_gold_limit_data{id = 20654, min = 90, max = 94,
                            is_show = 1, num = 72};
get_limit({20654, Val})
    when Val >= 95 andalso Val =< 100 ->
    #market_gold_limit_data{id = 20654, min = 95, max = 100,
                            is_show = 1, num = 108};
get_limit({20654, Val})
    when Val >= 101 andalso Val =< 200 ->
    #market_gold_limit_data{id = 20654, min = 101,
                            max = 200, is_show = 1, num = 144};
get_limit({20655, Val})
    when Val >= 1 andalso Val =< 79 ->
    #market_gold_limit_data{id = 20655, min = 1, max = 79,
                            is_show = 0, num = 0};
get_limit({20655, Val})
    when Val >= 80 andalso Val =< 89 ->
    #market_gold_limit_data{id = 20655, min = 80, max = 89,
                            is_show = 1, num = 27};
get_limit({20655, Val})
    when Val >= 90 andalso Val =< 94 ->
    #market_gold_limit_data{id = 20655, min = 90, max = 94,
                            is_show = 1, num = 54};
get_limit({20655, Val})
    when Val >= 95 andalso Val =< 100 ->
    #market_gold_limit_data{id = 20655, min = 95, max = 100,
                            is_show = 1, num = 81};
get_limit({20655, Val})
    when Val >= 101 andalso Val =< 200 ->
    #market_gold_limit_data{id = 20655, min = 101,
                            max = 200, is_show = 1, num = 108};
get_limit({23556, Val})
    when Val >= 1 andalso Val =< 79 ->
    #market_gold_limit_data{id = 23556, min = 1, max = 79,
                            is_show = 0, num = 0};
get_limit({23556, Val})
    when Val >= 80 andalso Val =< 85 ->
    #market_gold_limit_data{id = 23556, min = 80, max = 85,
                            is_show = 1, num = 10};
get_limit({23556, Val})
    when Val >= 86 andalso Val =< 99 ->
    #market_gold_limit_data{id = 23556, min = 86, max = 99,
                            is_show = 1, num = 15};
get_limit({23556, Val})
    when Val >= 100 andalso Val =< 200 ->
    #market_gold_limit_data{id = 23556, min = 100,
                            max = 200, is_show = 1, num = 20};
get_limit({21136, Val})
    when Val >= 1 andalso Val =< 29 ->
    #market_gold_limit_data{id = 21136, min = 1, max = 29,
                            is_show = 0, num = 0};
get_limit({21136, Val})
    when Val >= 30 andalso Val =< 200 ->
    #market_gold_limit_data{id = 21136, min = 30, max = 200,
                            is_show = 1, num = 10};
get_limit(_) -> false.

