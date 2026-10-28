-file("src/data/camp_discount_data.erl", 1).

-module(camp_discount_data).

-export([list/0,
         group_count/1,
         get_shop_data/1,
         group_shop_list/1]).

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

-file("src/data/camp_discount_data.erl", 17).

-file("inc/camp_discount.hrl", 1).

-record(camp_discount_config_data,
        {id = 0,
         group_id = 0,
         item_list = [],
         cost1 = 0,
         cost2 = [],
         min_lev = 0,
         max_lev = 0,
         sex = 0,
         classes = 0,
         limit_role_num = 0,
         limit_zone_num = 0,
         weigth = 0,
         show_effect = 0,
         show_item = [],
         show_type = 0}).

-record(m_camp_discount,
        {camp_id = 0,
         refresh_time = 0,
         shop_list = [],
         limit_list = [],
         refresh_num = 0,
         last_group = 0}).

-record(camp_discount_limit, {id, num}).

-file("src/data/camp_discount_data.erl", 18).

list() -> [1, 2, 3].

group_count(1) -> [{2, 1000}];
group_count(2) -> [{2, 500}, {3, 500}];
group_count(3) -> [{3, 500}, {4, 500}];
group_count(_) -> [].

group_shop_list(1) ->
    [#camp_discount_config_data{id = 1, group_id = 1,
                                item_list = [{20638, 0, 1}], cost1 = 5000,
                                cost2 = [{90002, 2500}], min_lev = 1,
                                max_lev = 200, sex = 2, classes = 0,
                                limit_role_num = 0, limit_zone_num = 0,
                                weigth = 100, show_effect = 0, show_type = 1},
     #camp_discount_config_data{id = 2, group_id = 1,
                                item_list = [{21257, 0, 1}], cost1 = 4000,
                                cost2 = [{90002, 2400}], min_lev = 90,
                                max_lev = 200, sex = 2, classes = 0,
                                limit_role_num = 2, limit_zone_num = 0,
                                weigth = 100, show_effect = 0, show_type = 1},
     #camp_discount_config_data{id = 3, group_id = 1,
                                item_list = [{25025, 0, 1}], cost1 = 2150,
                                cost2 = [{90002, 1000}], min_lev = 1,
                                max_lev = 200, sex = 2, classes = 0,
                                limit_role_num = 0, limit_zone_num = 0,
                                weigth = 100, show_effect = 0, show_type = 1},
     #camp_discount_config_data{id = 4, group_id = 1,
                                item_list = [{21245, 0, 1}], cost1 = 2750,
                                cost2 = [{90002, 1650}], min_lev = 1,
                                max_lev = 89, sex = 2, classes = 0,
                                limit_role_num = 2, limit_zone_num = 0,
                                weigth = 100, show_effect = 0, show_type = 1},
     #camp_discount_config_data{id = 5, group_id = 1,
                                item_list = [{20617, 0, 1}], cost1 = 1600,
                                cost2 = [{90002, 800}], min_lev = 1,
                                max_lev = 200, sex = 2, classes = 0,
                                limit_role_num = 0, limit_zone_num = 0,
                                weigth = 100, show_effect = 1, show_type = 1},
     #camp_discount_config_data{id = 6, group_id = 1,
                                item_list = [{22212, 0, 10}], cost1 = 1500,
                                cost2 = [{90002, 750}], min_lev = 1,
                                max_lev = 200, sex = 2, classes = 0,
                                limit_role_num = 0, limit_zone_num = 0,
                                weigth = 100, show_effect = 1, show_type = 1},
     #camp_discount_config_data{id = 7, group_id = 1,
                                item_list = [{29041, 0, 1}], cost1 = 1800,
                                cost2 = [{90002, 1500}], min_lev = 1,
                                max_lev = 200, sex = 2, classes = 0,
                                limit_role_num = 5, limit_zone_num = 0,
                                weigth = 100, show_effect = 0, show_type = 1},
     #camp_discount_config_data{id = 8, group_id = 1,
                                item_list = [{20635, 0, 1}], cost1 = 1600,
                                cost2 = [{90002, 1120}], min_lev = 1,
                                max_lev = 200, sex = 2, classes = 0,
                                limit_role_num = 2, limit_zone_num = 0,
                                weigth = 100, show_effect = 1, show_type = 1},
     #camp_discount_config_data{id = 9, group_id = 1,
                                item_list = [{20704, 0, 1}], cost1 = 5000,
                                cost2 = [{90002, 2500}], min_lev = 1,
                                max_lev = 200, sex = 2, classes = 0,
                                limit_role_num = 5, limit_zone_num = 0,
                                weigth = 100, show_effect = 1, show_type = 1},
     #camp_discount_config_data{id = 10, group_id = 1,
                                item_list = [{29100, 0, 1}], cost1 = 1000,
                                cost2 = [{90002, 500}], min_lev = 1,
                                max_lev = 200, sex = 2, classes = 0,
                                limit_role_num = 0, limit_zone_num = 0,
                                weigth = 100, show_effect = 1, show_type = 1},
     #camp_discount_config_data{id = 11, group_id = 1,
                                item_list = [{20617, 0, 1}], cost1 = 1600,
                                cost2 = [{90002, 800}], min_lev = 1,
                                max_lev = 200, sex = 2, classes = 0,
                                limit_role_num = 15, limit_zone_num = 0,
                                weigth = 100, show_effect = 0, show_type = 1}];
group_shop_list(2) ->
    [#camp_discount_config_data{id = 12, group_id = 2,
                                item_list = [{20755, 0, 3}], cost1 = 1200,
                                cost2 = [{90002, 900}], min_lev = 1,
                                max_lev = 200, sex = 2, classes = 0,
                                limit_role_num = 15, limit_zone_num = 0,
                                weigth = 100, show_effect = 0, show_type = 1},
     #camp_discount_config_data{id = 13, group_id = 2,
                                item_list = [{21256, 0, 1}], cost1 = 1000,
                                cost2 = [{90002, 650}], min_lev = 90,
                                max_lev = 200, sex = 2, classes = 0,
                                limit_role_num = 3, limit_zone_num = 0,
                                weigth = 100, show_effect = 0, show_type = 1},
     #camp_discount_config_data{id = 14, group_id = 2,
                                item_list = [{22396, 0, 5}], cost1 = 900,
                                cost2 = [{90002, 675}], min_lev = 1,
                                max_lev = 79, sex = 2, classes = 0,
                                limit_role_num = 35, limit_zone_num = 0,
                                weigth = 100, show_effect = 0, show_type = 1},
     #camp_discount_config_data{id = 15, group_id = 2,
                                item_list = [{21098, 0, 20}], cost1 = 800,
                                cost2 = [{90002, 600}], min_lev = 80,
                                max_lev = 200, sex = 2, classes = 0,
                                limit_role_num = 20, limit_zone_num = 0,
                                weigth = 100, show_effect = 0, show_type = 1},
     #camp_discount_config_data{id = 16, group_id = 2,
                                item_list = [{23594, 0, 1}], cost1 = 800,
                                cost2 = [{90002, 480}], min_lev = 1,
                                max_lev = 200, sex = 2, classes = 0,
                                limit_role_num = 3, limit_zone_num = 0,
                                weigth = 100, show_effect = 1, show_type = 1},
     #camp_discount_config_data{id = 17, group_id = 2,
                                item_list = [{22617, 0, 1}], cost1 = 800,
                                cost2 = [{90002, 480}], min_lev = 1,
                                max_lev = 200, sex = 2, classes = 0,
                                limit_role_num = 3, limit_zone_num = 0,
                                weigth = 100, show_effect = 1, show_type = 1},
     #camp_discount_config_data{id = 18, group_id = 2,
                                item_list = [{70362, 0, 1}], cost1 = 800,
                                cost2 = [{90002, 480}], min_lev = 1,
                                max_lev = 200, sex = 2, classes = 0,
                                limit_role_num = 3, limit_zone_num = 0,
                                weigth = 100, show_effect = 1, show_type = 1},
     #camp_discount_config_data{id = 19, group_id = 2,
                                item_list = [{23740, 0, 1}], cost1 = 900,
                                cost2 = [{90002, 600}], min_lev = 1,
                                max_lev = 200, sex = 2, classes = 0,
                                limit_role_num = 20, limit_zone_num = 0,
                                weigth = 100, show_effect = 0, show_type = 1},
     #camp_discount_config_data{id = 20, group_id = 2,
                                item_list = [{22449, 0, 1}], cost1 = 1100,
                                cost2 = [{90002, 800}], min_lev = 1,
                                max_lev = 200, sex = 2, classes = 0,
                                limit_role_num = 20, limit_zone_num = 0,
                                weigth = 100, show_effect = 0, show_type = 1},
     #camp_discount_config_data{id = 21, group_id = 2,
                                item_list = [{29101, 0, 1}], cost1 = 500,
                                cost2 = [{90002, 300}], min_lev = 1,
                                max_lev = 200, sex = 2, classes = 0,
                                limit_role_num = 10, limit_zone_num = 0,
                                weigth = 100, show_effect = 0, show_type = 1},
     #camp_discount_config_data{id = 22, group_id = 2,
                                item_list = [{21246, 0, 1}], cost1 = 500,
                                cost2 = [{90002, 400}], min_lev = 85,
                                max_lev = 89, sex = 2, classes = 0,
                                limit_role_num = 3, limit_zone_num = 0,
                                weigth = 100, show_effect = 0, show_type = 1}];
group_shop_list(3) ->
    [#camp_discount_config_data{id = 23, group_id = 3,
                                item_list = [{20014, 0, 1}], cost1 = 23950,
                                cost2 = [{90003, 11250}], min_lev = 1,
                                max_lev = 200, sex = 2, classes = 0,
                                limit_role_num = 0, limit_zone_num = 0,
                                weigth = 100, show_effect = 0, show_type = 1},
     #camp_discount_config_data{id = 24, group_id = 3,
                                item_list = [{22306, 0, 10}], cost1 = 50000,
                                cost2 = [{90003, 25000}], min_lev = 80,
                                max_lev = 200, sex = 2, classes = 0,
                                limit_role_num = 0, limit_zone_num = 0,
                                weigth = 100, show_effect = 0, show_type = 1},
     #camp_discount_config_data{id = 25, group_id = 3,
                                item_list = [{23733, 0, 10}], cost1 = 30000,
                                cost2 = [{90003, 15000}], min_lev = 85,
                                max_lev = 200, sex = 2, classes = 0,
                                limit_role_num = 30, limit_zone_num = 0,
                                weigth = 100, show_effect = 0, show_type = 1},
     #camp_discount_config_data{id = 26, group_id = 3,
                                item_list = [{21255, 0, 3}], cost1 = 450,
                                cost2 = [{90002, 300}], min_lev = 90,
                                max_lev = 200, sex = 2, classes = 0,
                                limit_role_num = 0, limit_zone_num = 0,
                                weigth = 100, show_effect = 0, show_type = 1},
     #camp_discount_config_data{id = 27, group_id = 3,
                                item_list = [{20545, 0, 3}], cost1 = 450,
                                cost2 = [{90002, 225}], min_lev = 1,
                                max_lev = 200, sex = 2, classes = 0,
                                limit_role_num = 0, limit_zone_num = 0,
                                weigth = 100, show_effect = 1, show_type = 1},
     #camp_discount_config_data{id = 28, group_id = 3,
                                item_list = [{22216, 0, 3}], cost1 = 22500,
                                cost2 = [{90003, 13500}], min_lev = 1,
                                max_lev = 79, sex = 2, classes = 0,
                                limit_role_num = 0, limit_zone_num = 0,
                                weigth = 100, show_effect = 1, show_type = 1},
     #camp_discount_config_data{id = 29, group_id = 3,
                                item_list = [{20616, 0, 1}], cost1 = 20000,
                                cost2 = [{90003, 10000}], min_lev = 1,
                                max_lev = 200, sex = 2, classes = 0,
                                limit_role_num = 0, limit_zone_num = 0,
                                weigth = 100, show_effect = 1, show_type = 1},
     #camp_discount_config_data{id = 30, group_id = 3,
                                item_list = [{29102, 0, 3}], cost1 = 360,
                                cost2 = [{90002, 288}], min_lev = 1,
                                max_lev = 200, sex = 2, classes = 0,
                                limit_role_num = 0, limit_zone_num = 0,
                                weigth = 100, show_effect = 0, show_type = 1},
     #camp_discount_config_data{id = 31, group_id = 3,
                                item_list = [{20022, 0, 3}], cost1 = 360,
                                cost2 = [{90002, 200}], min_lev = 1,
                                max_lev = 200, sex = 2, classes = 0,
                                limit_role_num = 0, limit_zone_num = 0,
                                weigth = 100, show_effect = 0, show_type = 1},
     #camp_discount_config_data{id = 32, group_id = 3,
                                item_list = [{20009, 0, 2}], cost1 = 200,
                                cost2 = [{90002, 100}], min_lev = 1,
                                max_lev = 200, sex = 2, classes = 0,
                                limit_role_num = 0, limit_zone_num = 0,
                                weigth = 100, show_effect = 0, show_type = 1},
     #camp_discount_config_data{id = 33, group_id = 3,
                                item_list = [{20010, 0, 1}], cost1 = 200,
                                cost2 = [{90002, 120}], min_lev = 1,
                                max_lev = 200, sex = 2, classes = 0,
                                limit_role_num = 0, limit_zone_num = 0,
                                weigth = 100, show_effect = 1, show_type = 1},
     #camp_discount_config_data{id = 34, group_id = 3,
                                item_list = [{20006, 0, 50}], cost1 = 12500,
                                cost2 = [{90003, 5000}], min_lev = 1,
                                max_lev = 200, sex = 2, classes = 0,
                                limit_role_num = 0, limit_zone_num = 0,
                                weigth = 100, show_effect = 1, show_type = 1},
     #camp_discount_config_data{id = 35, group_id = 3,
                                item_list = [{20021, 0, 10}], cost1 = 15000,
                                cost2 = [{90003, 7500}], min_lev = 1,
                                max_lev = 200, sex = 2, classes = 0,
                                limit_role_num = 0, limit_zone_num = 0,
                                weigth = 100, show_effect = 1, show_type = 1},
     #camp_discount_config_data{id = 36, group_id = 3,
                                item_list = [{20087, 0, 1}], cost1 = 80,
                                cost2 = [{90002, 40}], min_lev = 1,
                                max_lev = 200, sex = 2, classes = 0,
                                limit_role_num = 0, limit_zone_num = 0,
                                weigth = 100, show_effect = 0, show_type = 1}];
group_shop_list(_) -> [].

get_shop_data(1) ->
    #camp_discount_config_data{id = 1, group_id = 1,
                               item_list = [{20638, 0, 1}], cost1 = 5000,
                               cost2 = [{90002, 2500}], min_lev = 1,
                               max_lev = 200, sex = 2, classes = 0,
                               limit_role_num = 0, limit_zone_num = 0,
                               weigth = 100, show_effect = 0, show_type = 1};
get_shop_data(2) ->
    #camp_discount_config_data{id = 2, group_id = 1,
                               item_list = [{21257, 0, 1}], cost1 = 4000,
                               cost2 = [{90002, 2400}], min_lev = 90,
                               max_lev = 200, sex = 2, classes = 0,
                               limit_role_num = 2, limit_zone_num = 0,
                               weigth = 100, show_effect = 0, show_type = 1};
get_shop_data(3) ->
    #camp_discount_config_data{id = 3, group_id = 1,
                               item_list = [{25025, 0, 1}], cost1 = 2150,
                               cost2 = [{90002, 1000}], min_lev = 1,
                               max_lev = 200, sex = 2, classes = 0,
                               limit_role_num = 0, limit_zone_num = 0,
                               weigth = 100, show_effect = 0, show_type = 1};
get_shop_data(4) ->
    #camp_discount_config_data{id = 4, group_id = 1,
                               item_list = [{21245, 0, 1}], cost1 = 2750,
                               cost2 = [{90002, 1650}], min_lev = 1,
                               max_lev = 89, sex = 2, classes = 0,
                               limit_role_num = 2, limit_zone_num = 0,
                               weigth = 100, show_effect = 0, show_type = 1};
get_shop_data(5) ->
    #camp_discount_config_data{id = 5, group_id = 1,
                               item_list = [{20617, 0, 1}], cost1 = 1600,
                               cost2 = [{90002, 800}], min_lev = 1,
                               max_lev = 200, sex = 2, classes = 0,
                               limit_role_num = 0, limit_zone_num = 0,
                               weigth = 100, show_effect = 1, show_type = 1};
get_shop_data(6) ->
    #camp_discount_config_data{id = 6, group_id = 1,
                               item_list = [{22212, 0, 10}], cost1 = 1500,
                               cost2 = [{90002, 750}], min_lev = 1,
                               max_lev = 200, sex = 2, classes = 0,
                               limit_role_num = 0, limit_zone_num = 0,
                               weigth = 100, show_effect = 1, show_type = 1};
get_shop_data(7) ->
    #camp_discount_config_data{id = 7, group_id = 1,
                               item_list = [{29041, 0, 1}], cost1 = 1800,
                               cost2 = [{90002, 1500}], min_lev = 1,
                               max_lev = 200, sex = 2, classes = 0,
                               limit_role_num = 5, limit_zone_num = 0,
                               weigth = 100, show_effect = 0, show_type = 1};
get_shop_data(8) ->
    #camp_discount_config_data{id = 8, group_id = 1,
                               item_list = [{20635, 0, 1}], cost1 = 1600,
                               cost2 = [{90002, 1120}], min_lev = 1,
                               max_lev = 200, sex = 2, classes = 0,
                               limit_role_num = 2, limit_zone_num = 0,
                               weigth = 100, show_effect = 1, show_type = 1};
get_shop_data(9) ->
    #camp_discount_config_data{id = 9, group_id = 1,
                               item_list = [{20704, 0, 1}], cost1 = 5000,
                               cost2 = [{90002, 2500}], min_lev = 1,
                               max_lev = 200, sex = 2, classes = 0,
                               limit_role_num = 5, limit_zone_num = 0,
                               weigth = 100, show_effect = 1, show_type = 1};
get_shop_data(10) ->
    #camp_discount_config_data{id = 10, group_id = 1,
                               item_list = [{29100, 0, 1}], cost1 = 1000,
                               cost2 = [{90002, 500}], min_lev = 1,
                               max_lev = 200, sex = 2, classes = 0,
                               limit_role_num = 0, limit_zone_num = 0,
                               weigth = 100, show_effect = 1, show_type = 1};
get_shop_data(11) ->
    #camp_discount_config_data{id = 11, group_id = 1,
                               item_list = [{20617, 0, 1}], cost1 = 1600,
                               cost2 = [{90002, 800}], min_lev = 1,
                               max_lev = 200, sex = 2, classes = 0,
                               limit_role_num = 15, limit_zone_num = 0,
                               weigth = 100, show_effect = 0, show_type = 1};
get_shop_data(12) ->
    #camp_discount_config_data{id = 12, group_id = 2,
                               item_list = [{20755, 0, 3}], cost1 = 1200,
                               cost2 = [{90002, 900}], min_lev = 1,
                               max_lev = 200, sex = 2, classes = 0,
                               limit_role_num = 15, limit_zone_num = 0,
                               weigth = 100, show_effect = 0, show_type = 1};
get_shop_data(13) ->
    #camp_discount_config_data{id = 13, group_id = 2,
                               item_list = [{21256, 0, 1}], cost1 = 1000,
                               cost2 = [{90002, 650}], min_lev = 90,
                               max_lev = 200, sex = 2, classes = 0,
                               limit_role_num = 3, limit_zone_num = 0,
                               weigth = 100, show_effect = 0, show_type = 1};
get_shop_data(14) ->
    #camp_discount_config_data{id = 14, group_id = 2,
                               item_list = [{22396, 0, 5}], cost1 = 900,
                               cost2 = [{90002, 675}], min_lev = 1,
                               max_lev = 79, sex = 2, classes = 0,
                               limit_role_num = 35, limit_zone_num = 0,
                               weigth = 100, show_effect = 0, show_type = 1};
get_shop_data(15) ->
    #camp_discount_config_data{id = 15, group_id = 2,
                               item_list = [{21098, 0, 20}], cost1 = 800,
                               cost2 = [{90002, 600}], min_lev = 80,
                               max_lev = 200, sex = 2, classes = 0,
                               limit_role_num = 20, limit_zone_num = 0,
                               weigth = 100, show_effect = 0, show_type = 1};
get_shop_data(16) ->
    #camp_discount_config_data{id = 16, group_id = 2,
                               item_list = [{23594, 0, 1}], cost1 = 800,
                               cost2 = [{90002, 480}], min_lev = 1,
                               max_lev = 200, sex = 2, classes = 0,
                               limit_role_num = 3, limit_zone_num = 0,
                               weigth = 100, show_effect = 1, show_type = 1};
get_shop_data(17) ->
    #camp_discount_config_data{id = 17, group_id = 2,
                               item_list = [{22617, 0, 1}], cost1 = 800,
                               cost2 = [{90002, 480}], min_lev = 1,
                               max_lev = 200, sex = 2, classes = 0,
                               limit_role_num = 3, limit_zone_num = 0,
                               weigth = 100, show_effect = 1, show_type = 1};
get_shop_data(18) ->
    #camp_discount_config_data{id = 18, group_id = 2,
                               item_list = [{70362, 0, 1}], cost1 = 800,
                               cost2 = [{90002, 480}], min_lev = 1,
                               max_lev = 200, sex = 2, classes = 0,
                               limit_role_num = 3, limit_zone_num = 0,
                               weigth = 100, show_effect = 1, show_type = 1};
get_shop_data(19) ->
    #camp_discount_config_data{id = 19, group_id = 2,
                               item_list = [{23740, 0, 1}], cost1 = 900,
                               cost2 = [{90002, 600}], min_lev = 1,
                               max_lev = 200, sex = 2, classes = 0,
                               limit_role_num = 20, limit_zone_num = 0,
                               weigth = 100, show_effect = 0, show_type = 1};
get_shop_data(20) ->
    #camp_discount_config_data{id = 20, group_id = 2,
                               item_list = [{22449, 0, 1}], cost1 = 1100,
                               cost2 = [{90002, 800}], min_lev = 1,
                               max_lev = 200, sex = 2, classes = 0,
                               limit_role_num = 20, limit_zone_num = 0,
                               weigth = 100, show_effect = 0, show_type = 1};
get_shop_data(21) ->
    #camp_discount_config_data{id = 21, group_id = 2,
                               item_list = [{29101, 0, 1}], cost1 = 500,
                               cost2 = [{90002, 300}], min_lev = 1,
                               max_lev = 200, sex = 2, classes = 0,
                               limit_role_num = 10, limit_zone_num = 0,
                               weigth = 100, show_effect = 0, show_type = 1};
get_shop_data(22) ->
    #camp_discount_config_data{id = 22, group_id = 2,
                               item_list = [{21246, 0, 1}], cost1 = 500,
                               cost2 = [{90002, 400}], min_lev = 85,
                               max_lev = 89, sex = 2, classes = 0,
                               limit_role_num = 3, limit_zone_num = 0,
                               weigth = 100, show_effect = 0, show_type = 1};
get_shop_data(23) ->
    #camp_discount_config_data{id = 23, group_id = 3,
                               item_list = [{20014, 0, 1}], cost1 = 23950,
                               cost2 = [{90003, 11250}], min_lev = 1,
                               max_lev = 200, sex = 2, classes = 0,
                               limit_role_num = 0, limit_zone_num = 0,
                               weigth = 100, show_effect = 0, show_type = 1};
get_shop_data(24) ->
    #camp_discount_config_data{id = 24, group_id = 3,
                               item_list = [{22306, 0, 10}], cost1 = 50000,
                               cost2 = [{90003, 25000}], min_lev = 80,
                               max_lev = 200, sex = 2, classes = 0,
                               limit_role_num = 0, limit_zone_num = 0,
                               weigth = 100, show_effect = 0, show_type = 1};
get_shop_data(25) ->
    #camp_discount_config_data{id = 25, group_id = 3,
                               item_list = [{23733, 0, 10}], cost1 = 30000,
                               cost2 = [{90003, 15000}], min_lev = 85,
                               max_lev = 200, sex = 2, classes = 0,
                               limit_role_num = 30, limit_zone_num = 0,
                               weigth = 100, show_effect = 0, show_type = 1};
get_shop_data(26) ->
    #camp_discount_config_data{id = 26, group_id = 3,
                               item_list = [{21255, 0, 3}], cost1 = 450,
                               cost2 = [{90002, 300}], min_lev = 90,
                               max_lev = 200, sex = 2, classes = 0,
                               limit_role_num = 0, limit_zone_num = 0,
                               weigth = 100, show_effect = 0, show_type = 1};
get_shop_data(27) ->
    #camp_discount_config_data{id = 27, group_id = 3,
                               item_list = [{20545, 0, 3}], cost1 = 450,
                               cost2 = [{90002, 225}], min_lev = 1,
                               max_lev = 200, sex = 2, classes = 0,
                               limit_role_num = 0, limit_zone_num = 0,
                               weigth = 100, show_effect = 1, show_type = 1};
get_shop_data(28) ->
    #camp_discount_config_data{id = 28, group_id = 3,
                               item_list = [{22216, 0, 3}], cost1 = 22500,
                               cost2 = [{90003, 13500}], min_lev = 1,
                               max_lev = 79, sex = 2, classes = 0,
                               limit_role_num = 0, limit_zone_num = 0,
                               weigth = 100, show_effect = 1, show_type = 1};
get_shop_data(29) ->
    #camp_discount_config_data{id = 29, group_id = 3,
                               item_list = [{20616, 0, 1}], cost1 = 20000,
                               cost2 = [{90003, 10000}], min_lev = 1,
                               max_lev = 200, sex = 2, classes = 0,
                               limit_role_num = 0, limit_zone_num = 0,
                               weigth = 100, show_effect = 1, show_type = 1};
get_shop_data(30) ->
    #camp_discount_config_data{id = 30, group_id = 3,
                               item_list = [{29102, 0, 3}], cost1 = 360,
                               cost2 = [{90002, 288}], min_lev = 1,
                               max_lev = 200, sex = 2, classes = 0,
                               limit_role_num = 0, limit_zone_num = 0,
                               weigth = 100, show_effect = 0, show_type = 1};
get_shop_data(31) ->
    #camp_discount_config_data{id = 31, group_id = 3,
                               item_list = [{20022, 0, 3}], cost1 = 360,
                               cost2 = [{90002, 200}], min_lev = 1,
                               max_lev = 200, sex = 2, classes = 0,
                               limit_role_num = 0, limit_zone_num = 0,
                               weigth = 100, show_effect = 0, show_type = 1};
get_shop_data(32) ->
    #camp_discount_config_data{id = 32, group_id = 3,
                               item_list = [{20009, 0, 2}], cost1 = 200,
                               cost2 = [{90002, 100}], min_lev = 1,
                               max_lev = 200, sex = 2, classes = 0,
                               limit_role_num = 0, limit_zone_num = 0,
                               weigth = 100, show_effect = 0, show_type = 1};
get_shop_data(33) ->
    #camp_discount_config_data{id = 33, group_id = 3,
                               item_list = [{20010, 0, 1}], cost1 = 200,
                               cost2 = [{90002, 120}], min_lev = 1,
                               max_lev = 200, sex = 2, classes = 0,
                               limit_role_num = 0, limit_zone_num = 0,
                               weigth = 100, show_effect = 1, show_type = 1};
get_shop_data(34) ->
    #camp_discount_config_data{id = 34, group_id = 3,
                               item_list = [{20006, 0, 50}], cost1 = 12500,
                               cost2 = [{90003, 5000}], min_lev = 1,
                               max_lev = 200, sex = 2, classes = 0,
                               limit_role_num = 0, limit_zone_num = 0,
                               weigth = 100, show_effect = 1, show_type = 1};
get_shop_data(35) ->
    #camp_discount_config_data{id = 35, group_id = 3,
                               item_list = [{20021, 0, 10}], cost1 = 15000,
                               cost2 = [{90003, 7500}], min_lev = 1,
                               max_lev = 200, sex = 2, classes = 0,
                               limit_role_num = 0, limit_zone_num = 0,
                               weigth = 100, show_effect = 1, show_type = 1};
get_shop_data(36) ->
    #camp_discount_config_data{id = 36, group_id = 3,
                               item_list = [{20087, 0, 1}], cost1 = 80,
                               cost2 = [{90002, 40}], min_lev = 1,
                               max_lev = 200, sex = 2, classes = 0,
                               limit_role_num = 0, limit_zone_num = 0,
                               weigth = 100, show_effect = 0, show_type = 1};
get_shop_data(_) -> [].

