-file("src/data/camp_new_discount_data.erl", 1).

-module(camp_new_discount_data).

-export([get_config/0, get_day_shop_data/1]).

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

-file("src/data/camp_new_discount_data.erl", 15).

-file("inc/camp_new_discount.hrl", 1).

-author("Suhan").

-record(camp_new_discount_config,
        {cost, item_id, bind, num, title, content}).

-record(m_camp_new_discount,
        {role_id, camp_id = 0, total_cost = 0, shop_info = []}).

-record(camp_new_discount_data,
        {id, item, price, left_num, total_num, show_effect}).

-record(camp_new_discount_shop_data,
        {day,
         id,
         item,
         cost,
         min_lev,
         max_lev,
         sex,
         classes,
         limit_role_num,
         show_effect}).

-file("src/data/camp_new_discount_data.erl", 16).

get_config() ->
    [#camp_new_discount_config{cost = 1000, item_id = 71385,
                               bind = 0, num = 1, title = lang:get("新春刮刮乐"),
                               content = lang:get("由于您背包已满，奖励通过邮件发放给您，请查收")}].

get_day_shop_data(1) ->
    [#camp_new_discount_shop_data{day = 1, id = 1,
                                  item = {71399, 0, 1}, cost = {90002, 1350},
                                  min_lev = 1, max_lev = 200, sex = 2,
                                  classes = 0, limit_role_num = 5,
                                  show_effect = 1},
     #camp_new_discount_shop_data{day = 1, id = 2,
                                  item = {70208, 0, 1}, cost = {90002, 150},
                                  min_lev = 1, max_lev = 200, sex = 2,
                                  classes = 0, limit_role_num = 5,
                                  show_effect = 0},
     #camp_new_discount_shop_data{day = 1, id = 3,
                                  item = {20617, 0, 1}, cost = {90002, 1000},
                                  min_lev = 1, max_lev = 200, sex = 2,
                                  classes = 0, limit_role_num = 3,
                                  show_effect = 1},
     #camp_new_discount_shop_data{day = 1, id = 4,
                                  item = {20076, 0, 1}, cost = {90002, 320},
                                  min_lev = 1, max_lev = 200, sex = 2,
                                  classes = 0, limit_role_num = 5,
                                  show_effect = 0},
     #camp_new_discount_shop_data{day = 1, id = 5,
                                  item = {20638, 0, 1}, cost = {90002, 3000},
                                  min_lev = 1, max_lev = 200, sex = 2,
                                  classes = 0, limit_role_num = 2,
                                  show_effect = 1},
     #camp_new_discount_shop_data{day = 1, id = 6,
                                  item = {71369, 0, 1}, cost = {90002, 350},
                                  min_lev = 1, max_lev = 200, sex = 2,
                                  classes = 0, limit_role_num = 5,
                                  show_effect = 1}];
get_day_shop_data(2) ->
    [#camp_new_discount_shop_data{day = 2, id = 7,
                                  item = {71399, 0, 1}, cost = {90002, 1350},
                                  min_lev = 1, max_lev = 200, sex = 2,
                                  classes = 0, limit_role_num = 5,
                                  show_effect = 1},
     #camp_new_discount_shop_data{day = 2, id = 8,
                                  item = {22585, 0, 1}, cost = {90002, 120},
                                  min_lev = 1, max_lev = 79, sex = 2,
                                  classes = 0, limit_role_num = 20,
                                  show_effect = 1},
     #camp_new_discount_shop_data{day = 2, id = 9,
                                  item = {21098, 0, 1}, cost = {90002, 40},
                                  min_lev = 80, max_lev = 200, sex = 2,
                                  classes = 0, limit_role_num = 30,
                                  show_effect = 1},
     #camp_new_discount_shop_data{day = 2, id = 10,
                                  item = {22212, 0, 1}, cost = {90002, 120},
                                  min_lev = 1, max_lev = 200, sex = 2,
                                  classes = 0, limit_role_num = 20,
                                  show_effect = 1},
     #camp_new_discount_shop_data{day = 2, id = 11,
                                  item = {71400, 0, 1}, cost = {90002, 2280},
                                  min_lev = 1, max_lev = 200, sex = 2,
                                  classes = 0, limit_role_num = 2,
                                  show_effect = 1},
     #camp_new_discount_shop_data{day = 2, id = 12,
                                  item = {20023, 0, 1}, cost = {90002, 380},
                                  min_lev = 1, max_lev = 74, sex = 2,
                                  classes = 0, limit_role_num = 5,
                                  show_effect = 0},
     #camp_new_discount_shop_data{day = 2, id = 13,
                                  item = {21244, 0, 1}, cost = {90002, 380},
                                  min_lev = 75, max_lev = 89, sex = 2,
                                  classes = 0, limit_role_num = 5,
                                  show_effect = 0},
     #camp_new_discount_shop_data{day = 2, id = 14,
                                  item = {21256, 0, 1}, cost = {90002, 880},
                                  min_lev = 90, max_lev = 200, sex = 2,
                                  classes = 0, limit_role_num = 5,
                                  show_effect = 1},
     #camp_new_discount_shop_data{day = 2, id = 15,
                                  item = {22216, 0, 1}, cost = {90002, 80},
                                  min_lev = 1, max_lev = 200, sex = 2,
                                  classes = 0, limit_role_num = 15,
                                  show_effect = 0}];
get_day_shop_data(3) ->
    [#camp_new_discount_shop_data{day = 3, id = 16,
                                  item = {71399, 0, 1}, cost = {90002, 1350},
                                  min_lev = 1, max_lev = 200, sex = 2,
                                  classes = 0, limit_role_num = 5,
                                  show_effect = 1},
     #camp_new_discount_shop_data{day = 3, id = 17,
                                  item = {23556, 0, 1}, cost = {90002, 40},
                                  min_lev = 1, max_lev = 200, sex = 2,
                                  classes = 0, limit_role_num = 20,
                                  show_effect = 1},
     #camp_new_discount_shop_data{day = 3, id = 18,
                                  item = {23554, 0, 1}, cost = {90002, 88},
                                  min_lev = 1, max_lev = 200, sex = 2,
                                  classes = 0, limit_role_num = 10,
                                  show_effect = 0},
     #camp_new_discount_shop_data{day = 3, id = 19,
                                  item = {29314, 0, 1}, cost = {90002, 500},
                                  min_lev = 1, max_lev = 200, sex = 2,
                                  classes = 0, limit_role_num = 3,
                                  show_effect = 0},
     #camp_new_discount_shop_data{day = 3, id = 20,
                                  item = {29101, 0, 1}, cost = {90002, 350},
                                  min_lev = 1, max_lev = 200, sex = 2,
                                  classes = 0, limit_role_num = 5,
                                  show_effect = 1},
     #camp_new_discount_shop_data{day = 3, id = 21,
                                  item = {22449, 0, 1}, cost = {90002, 650},
                                  min_lev = 1, max_lev = 200, sex = 2,
                                  classes = 0, limit_role_num = 15,
                                  show_effect = 0}];
get_day_shop_data(4) ->
    [#camp_new_discount_shop_data{day = 4, id = 22,
                                  item = {71399, 0, 1}, cost = {90002, 1350},
                                  min_lev = 1, max_lev = 200, sex = 2,
                                  classes = 0, limit_role_num = 5,
                                  show_effect = 1},
     #camp_new_discount_shop_data{day = 4, id = 23,
                                  item = {23594, 0, 1}, cost = {90002, 600},
                                  min_lev = 1, max_lev = 200, sex = 2,
                                  classes = 0, limit_role_num = 2,
                                  show_effect = 1},
     #camp_new_discount_shop_data{day = 4, id = 24,
                                  item = {22617, 0, 1}, cost = {90002, 600},
                                  min_lev = 1, max_lev = 200, sex = 2,
                                  classes = 0, limit_role_num = 2,
                                  show_effect = 1},
     #camp_new_discount_shop_data{day = 4, id = 25,
                                  item = {70362, 0, 1}, cost = {90002, 600},
                                  min_lev = 1, max_lev = 200, sex = 2,
                                  classes = 0, limit_role_num = 2,
                                  show_effect = 1},
     #camp_new_discount_shop_data{day = 4, id = 26,
                                  item = {23740, 0, 1}, cost = {90002, 550},
                                  min_lev = 1, max_lev = 200, sex = 2,
                                  classes = 0, limit_role_num = 15,
                                  show_effect = 1},
     #camp_new_discount_shop_data{day = 4, id = 27,
                                  item = {23733, 0, 1}, cost = {90002, 20},
                                  min_lev = 1, max_lev = 200, sex = 2,
                                  classes = 0, limit_role_num = 30,
                                  show_effect = 0}];
get_day_shop_data(_) -> [].

