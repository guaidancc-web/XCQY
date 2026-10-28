-file("src/data/camp_box_data.erl", 1).

-module(camp_box_data).

-export([get_type/1,
         groups/1,
         get_group/1,
         get_item/1,
         get_cost/1,
         ids/0]).

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

-file("src/data/camp_box_data.erl", 21).

-file("inc/camp_box.hrl", 1).

-record(m_camp_box,
        {camp_id = 0,
         pos_list = [],
         list = [],
         log = [],
         refresh_num = 0,
         auto_refresh_num = 0,
         open_num = 0}).

-record(camp_box_type_data,
        {type = 1,
         name = "",
         is_open = 0,
         day_time = [],
         cast_msg = "",
         cost = [],
         refresh_cost = [],
         gain = [],
         is_repeat = 0,
         auto_num = 0,
         total_num = 0}).

-record(camp_box_group_data,
        {group, type = 1, box_list = []}).

-record(camp_box_item_data,
        {id = 0,
         type = 1,
         group = 0,
         item_id = 0,
         bind = 0,
         num = 0,
         box_weigth = 0,
         weigth = 0,
         must = 0,
         must_no = 0,
         min_box = 0,
         max_box = 0,
         max_num = 0,
         is_cast = 0,
         is_log = 0,
         lev_min = 0,
         lev_max = 0,
         sex = 0,
         classes = 0,
         min_lev_break = 0,
         max_lev_break = 0}).

-file("src/data/camp_box_data.erl", 22).

get_type(1) ->
    #camp_box_type_data{type = 1, name = lang:get("幸运翻翻乐"),
                        is_open = 1, day_time = [{19, 0, 0, 23, 0, 0}],
                        cast_msg =
                            lang:get("风雷涌动，宝物降临。恭喜#role#在翻牌活动中获得至尊奖励#item#"),
                        cost = [{20006, 1}], refresh_cost = [{23250, 2}],
                        is_repeat = 1, auto_num = 8, total_num = 9};
get_type(_) -> false.

ids() ->
    [1,
     2,
     3,
     4,
     5,
     6,
     7,
     8,
     9,
     10,
     11,
     12,
     13,
     14,
     15,
     16,
     17,
     18,
     19,
     20,
     21,
     22,
     23,
     24,
     25,
     26,
     27,
     28,
     29,
     30,
     31,
     32,
     33,
     34,
     35,
     36,
     37,
     38,
     39,
     40,
     41,
     42,
     43,
     44,
     45,
     46,
     47,
     48,
     49,
     50,
     51,
     52,
     53,
     54,
     55,
     56,
     57,
     58,
     59,
     60,
     61,
     62,
     63,
     64].

groups(1) -> [1, 2, 3, 4];
groups(_) -> [].

get_group(1) ->
    #camp_box_group_data{type = 1, group = 1,
                         box_list = [{1, 100}]};
get_group(2) ->
    #camp_box_group_data{type = 1, group = 2,
                         box_list = [{1, 100}]};
get_group(3) ->
    #camp_box_group_data{type = 1, group = 3,
                         box_list = [{3, 100}]};
get_group(4) ->
    #camp_box_group_data{type = 1, group = 4,
                         box_list = [{4, 100}]};
get_group(_) -> false.

get_cost({1, Times})
    when Times >= 1 andalso Times =< 3 ->
    [{23250, 1}];
get_cost({1, Times})
    when Times >= 4 andalso Times =< 4 ->
    [{23250, 2}];
get_cost({1, Times})
    when Times >= 5 andalso Times =< 5 ->
    [{23250, 2}];
get_cost({1, Times})
    when Times >= 6 andalso Times =< 6 ->
    [{23250, 3}];
get_cost({1, Times})
    when Times >= 7 andalso Times =< 7 ->
    [{23250, 5}];
get_cost({1, Times})
    when Times >= 8 andalso Times =< 8 ->
    [{23250, 5}];
get_cost({1, Times})
    when Times >= 9 andalso Times =< 100 ->
    [{23250, 999}];
get_cost(_) -> false.

get_item(1) ->
    #camp_box_item_data{id = 1, group = 1, item_id = 22207,
                        bind = 0, num = 1, weigth = 200, box_weigth = 25,
                        is_cast = 1, is_log = 1, lev_min = 1, lev_max = 200,
                        must_no = 0, must = 4, max_num = 0, min_box = 5,
                        max_box = 8, sex = 2, classes = 0, min_lev_break = 0,
                        max_lev_break = 1};
get_item(2) ->
    #camp_box_item_data{id = 2, group = 1, item_id = 22205,
                        bind = 0, num = 1, weigth = 450, box_weigth = 25,
                        is_cast = 1, is_log = 1, lev_min = 1, lev_max = 79,
                        must_no = 0, must = 3, max_num = 0, min_box = 5,
                        max_box = 8, sex = 2, classes = 0, min_lev_break = 0,
                        max_lev_break = 1};
get_item(3) ->
    #camp_box_item_data{id = 3, group = 1, item_id = 22205,
                        bind = 0, num = 1, weigth = 300, box_weigth = 25,
                        is_cast = 1, is_log = 1, lev_min = 80, lev_max = 200,
                        must_no = 0, must = 8, max_num = 0, min_box = 5,
                        max_box = 8, sex = 2, classes = 0, min_lev_break = 0,
                        max_lev_break = 1};
get_item(4) ->
    #camp_box_item_data{id = 4, group = 1, item_id = 21245,
                        bind = 0, num = 1, weigth = 50, box_weigth = 25,
                        is_cast = 1, is_log = 1, lev_min = 80, lev_max = 200,
                        must_no = 0, must = 8, max_num = 0, min_box = 5,
                        max_box = 8, sex = 2, classes = 0, min_lev_break = 0,
                        max_lev_break = 1};
get_item(5) ->
    #camp_box_item_data{id = 5, group = 1, item_id = 29590,
                        bind = 0, num = 1, weigth = 100, box_weigth = 45,
                        is_cast = 1, is_log = 1, lev_min = 1, lev_max = 200,
                        must_no = 0, must = 0, max_num = 0, min_box = 5,
                        max_box = 8, sex = 0, classes = 0, min_lev_break = 0,
                        max_lev_break = 1};
get_item(6) ->
    #camp_box_item_data{id = 6, group = 1, item_id = 29591,
                        bind = 0, num = 1, weigth = 100, box_weigth = 45,
                        is_cast = 1, is_log = 1, lev_min = 1, lev_max = 200,
                        must_no = 0, must = 0, max_num = 0, min_box = 5,
                        max_box = 8, sex = 1, classes = 0, min_lev_break = 0,
                        max_lev_break = 1};
get_item(7) ->
    #camp_box_item_data{id = 7, group = 1, item_id = 20619,
                        bind = 0, num = 1, weigth = 50, box_weigth = 25,
                        is_cast = 1, is_log = 1, lev_min = 1, lev_max = 200,
                        must_no = 0, must = 0, max_num = 0, min_box = 5,
                        max_box = 8, sex = 2, classes = 0, min_lev_break = 0,
                        max_lev_break = 1};
get_item(8) ->
    #camp_box_item_data{id = 8, group = 1, item_id = 20704,
                        bind = 0, num = 1, weigth = 100, box_weigth = 45,
                        is_cast = 1, is_log = 1, lev_min = 1, lev_max = 200,
                        must_no = 0, must = 0, max_num = 0, min_box = 5,
                        max_box = 8, sex = 2, classes = 0, min_lev_break = 0,
                        max_lev_break = 1};
get_item(9) ->
    #camp_box_item_data{id = 9, group = 1, item_id = 21164,
                        bind = 0, num = 1, weigth = 100, box_weigth = 45,
                        is_cast = 1, is_log = 1, lev_min = 1, lev_max = 200,
                        must_no = 0, must = 0, max_num = 0, min_box = 5,
                        max_box = 8, sex = 2, classes = 0, min_lev_break = 0,
                        max_lev_break = 1};
get_item(10) ->
    #camp_box_item_data{id = 10, group = 2, item_id = 22208,
                        bind = 0, num = 1, weigth = 200, box_weigth = 100,
                        is_cast = 1, is_log = 1, lev_min = 1, lev_max = 200,
                        must_no = 0, must = 0, max_num = 0, min_box = 4,
                        max_box = 8, sex = 2, classes = 0, min_lev_break = 0,
                        max_lev_break = 1};
get_item(11) ->
    #camp_box_item_data{id = 11, group = 2, item_id = 20635,
                        bind = 0, num = 1, weigth = 20, box_weigth = 100,
                        is_cast = 1, is_log = 1, lev_min = 1, lev_max = 200,
                        must_no = 0, must = 0, max_num = 0, min_box = 4,
                        max_box = 8, sex = 2, classes = 0, min_lev_break = 0,
                        max_lev_break = 1};
get_item(12) ->
    #camp_box_item_data{id = 12, group = 2, item_id = 20636,
                        bind = 0, num = 1, weigth = 30, box_weigth = 100,
                        is_cast = 1, is_log = 1, lev_min = 1, lev_max = 200,
                        must_no = 0, must = 0, max_num = 0, min_box = 4,
                        max_box = 8, sex = 2, classes = 0, min_lev_break = 0,
                        max_lev_break = 1};
get_item(13) ->
    #camp_box_item_data{id = 13, group = 2, item_id = 20637,
                        bind = 0, num = 1, weigth = 30, box_weigth = 100,
                        is_cast = 1, is_log = 1, lev_min = 1, lev_max = 200,
                        must_no = 0, must = 0, max_num = 0, min_box = 4,
                        max_box = 8, sex = 2, classes = 0, min_lev_break = 0,
                        max_lev_break = 1};
get_item(14) ->
    #camp_box_item_data{id = 14, group = 2, item_id = 20024,
                        bind = 0, num = 1, weigth = 60, box_weigth = 100,
                        is_cast = 1, is_log = 1, lev_min = 1, lev_max = 94,
                        must_no = 0, must = 0, max_num = 0, min_box = 4,
                        max_box = 8, sex = 2, classes = 0, min_lev_break = 0,
                        max_lev_break = 1};
get_item(15) ->
    #camp_box_item_data{id = 15, group = 2, item_id = 23858,
                        bind = 0, num = 1, weigth = 60, box_weigth = 100,
                        is_cast = 1, is_log = 1, lev_min = 95, lev_max = 200,
                        must_no = 0, must = 0, max_num = 0, min_box = 4,
                        max_box = 8, sex = 2, classes = 0, min_lev_break = 0,
                        max_lev_break = 1};
get_item(16) ->
    #camp_box_item_data{id = 16, group = 2, item_id = 29593,
                        bind = 0, num = 1, weigth = 50, box_weigth = 100,
                        is_cast = 1, is_log = 1, lev_min = 1, lev_max = 200,
                        must_no = 0, must = 0, max_num = 0, min_box = 4,
                        max_box = 8, sex = 2, classes = 0, min_lev_break = 0,
                        max_lev_break = 1};
get_item(17) ->
    #camp_box_item_data{id = 17, group = 2, item_id = 23119,
                        bind = 0, num = 1, weigth = 80, box_weigth = 100,
                        is_cast = 1, is_log = 1, lev_min = 1, lev_max = 200,
                        must_no = 0, must = 0, max_num = 0, min_box = 4,
                        max_box = 8, sex = 2, classes = 0, min_lev_break = 0,
                        max_lev_break = 1};
get_item(18) ->
    #camp_box_item_data{id = 18, group = 2, item_id = 29100,
                        bind = 0, num = 1, weigth = 80, box_weigth = 100,
                        is_cast = 1, is_log = 1, lev_min = 1, lev_max = 200,
                        must_no = 0, must = 0, max_num = 0, min_box = 4,
                        max_box = 8, sex = 2, classes = 0, min_lev_break = 0,
                        max_lev_break = 1};
get_item(19) ->
    #camp_box_item_data{id = 19, group = 2, item_id = 20617,
                        bind = 0, num = 1, weigth = 100, box_weigth = 100,
                        is_cast = 1, is_log = 1, lev_min = 1, lev_max = 79,
                        must_no = 0, must = 0, max_num = 0, min_box = 4,
                        max_box = 8, sex = 2, classes = 0, min_lev_break = 0,
                        max_lev_break = 1};
get_item(20) ->
    #camp_box_item_data{id = 20, group = 2, item_id = 23674,
                        bind = 0, num = 1, weigth = 70, box_weigth = 100,
                        is_cast = 1, is_log = 1, lev_min = 80, lev_max = 200,
                        must_no = 0, must = 0, max_num = 0, min_box = 4,
                        max_box = 8, sex = 2, classes = 0, min_lev_break = 0,
                        max_lev_break = 1};
get_item(21) ->
    #camp_box_item_data{id = 21, group = 2, item_id = 23671,
                        bind = 0, num = 1, weigth = 30, box_weigth = 100,
                        is_cast = 1, is_log = 1, lev_min = 80, lev_max = 200,
                        must_no = 0, must = 0, max_num = 0, min_box = 4,
                        max_box = 8, sex = 2, classes = 0, min_lev_break = 0,
                        max_lev_break = 1};
get_item(22) ->
    #camp_box_item_data{id = 22, group = 2, item_id = 20038,
                        bind = 0, num = 3, weigth = 80, box_weigth = 100,
                        is_cast = 0, is_log = 0, lev_min = 1, lev_max = 200,
                        must_no = 0, must = 0, max_num = 0, min_box = 4,
                        max_box = 8, sex = 2, classes = 0, min_lev_break = 0,
                        max_lev_break = 1};
get_item(23) ->
    #camp_box_item_data{id = 23, group = 2, item_id = 21426,
                        bind = 0, num = 1, weigth = 50, box_weigth = 100,
                        is_cast = 0, is_log = 0, lev_min = 1, lev_max = 200,
                        must_no = 0, must = 0, max_num = 0, min_box = 4,
                        max_box = 8, sex = 2, classes = 0, min_lev_break = 0,
                        max_lev_break = 1};
get_item(24) ->
    #camp_box_item_data{id = 24, group = 2, item_id = 20076,
                        bind = 0, num = 2, weigth = 100, box_weigth = 100,
                        is_cast = 0, is_log = 0, lev_min = 1, lev_max = 200,
                        must_no = 0, must = 0, max_num = 0, min_box = 4,
                        max_box = 8, sex = 2, classes = 0, min_lev_break = 0,
                        max_lev_break = 1};
get_item(25) ->
    #camp_box_item_data{id = 25, group = 2, item_id = 22617,
                        bind = 0, num = 1, weigth = 120, box_weigth = 100,
                        is_cast = 0, is_log = 0, lev_min = 1, lev_max = 74,
                        must_no = 0, must = 0, max_num = 0, min_box = 4,
                        max_box = 8, sex = 2, classes = 0, min_lev_break = 0,
                        max_lev_break = 1};
get_item(26) ->
    #camp_box_item_data{id = 26, group = 2, item_id = 24188,
                        bind = 0, num = 1, weigth = 120, box_weigth = 100,
                        is_cast = 1, is_log = 1, lev_min = 75, lev_max = 79,
                        must_no = 0, must = 0, max_num = 0, min_box = 4,
                        max_box = 8, sex = 2, classes = 0, min_lev_break = 0,
                        max_lev_break = 1};
get_item(27) ->
    #camp_box_item_data{id = 27, group = 2, item_id = 24189,
                        bind = 0, num = 1, weigth = 120, box_weigth = 100,
                        is_cast = 1, is_log = 1, lev_min = 80, lev_max = 89,
                        must_no = 0, must = 0, max_num = 0, min_box = 4,
                        max_box = 8, sex = 2, classes = 0, min_lev_break = 0,
                        max_lev_break = 1};
get_item(28) ->
    #camp_box_item_data{id = 28, group = 2, item_id = 24190,
                        bind = 0, num = 1, weigth = 120, box_weigth = 100,
                        is_cast = 1, is_log = 1, lev_min = 90, lev_max = 99,
                        must_no = 0, must = 0, max_num = 0, min_box = 4,
                        max_box = 8, sex = 2, classes = 0, min_lev_break = 0,
                        max_lev_break = 1};
get_item(29) ->
    #camp_box_item_data{id = 29, group = 2, item_id = 21246,
                        bind = 0, num = 1, weigth = 120, box_weigth = 100,
                        is_cast = 1, is_log = 1, lev_min = 100, lev_max = 200,
                        must_no = 0, must = 0, max_num = 0, min_box = 4,
                        max_box = 8, sex = 2, classes = 0, min_lev_break = 0,
                        max_lev_break = 1};
get_item(30) ->
    #camp_box_item_data{id = 30, group = 3, item_id = 90026,
                        bind = 0, num = 500, weigth = 120, box_weigth = 200,
                        is_cast = 1, is_log = 1, lev_min = 1, lev_max = 200,
                        must_no = 0, must = 0, max_num = 0, min_box = 0,
                        max_box = 0, sex = 2, classes = 0, min_lev_break = 0,
                        max_lev_break = 1};
get_item(31) ->
    #camp_box_item_data{id = 31, group = 3, item_id = 29101,
                        bind = 0, num = 1, weigth = 10, box_weigth = 200,
                        is_cast = 1, is_log = 1, lev_min = 1, lev_max = 200,
                        must_no = 0, must = 0, max_num = 0, min_box = 0,
                        max_box = 0, sex = 2, classes = 0, min_lev_break = 0,
                        max_lev_break = 1};
get_item(32) ->
    #camp_box_item_data{id = 32, group = 3, item_id = 20076,
                        bind = 0, num = 1, weigth = 30, box_weigth = 200,
                        is_cast = 1, is_log = 1, lev_min = 1, lev_max = 200,
                        must_no = 0, must = 0, max_num = 0, min_box = 0,
                        max_box = 0, sex = 2, classes = 0, min_lev_break = 0,
                        max_lev_break = 1};
get_item(33) ->
    #camp_box_item_data{id = 33, group = 3, item_id = 20616,
                        bind = 0, num = 1, weigth = 100, box_weigth = 200,
                        is_cast = 0, is_log = 0, lev_min = 1, lev_max = 200,
                        must_no = 0, must = 0, max_num = 0, min_box = 0,
                        max_box = 0, sex = 2, classes = 0, min_lev_break = 0,
                        max_lev_break = 1};
get_item(34) ->
    #camp_box_item_data{id = 34, group = 3, item_id = 29314,
                        bind = 0, num = 1, weigth = 100, box_weigth = 200,
                        is_cast = 0, is_log = 0, lev_min = 1, lev_max = 200,
                        must_no = 0, must = 0, max_num = 0, min_box = 0,
                        max_box = 0, sex = 2, classes = 0, min_lev_break = 0,
                        max_lev_break = 1};
get_item(35) ->
    #camp_box_item_data{id = 35, group = 3, item_id = 20038,
                        bind = 0, num = 1, weigth = 100, box_weigth = 200,
                        is_cast = 0, is_log = 0, lev_min = 1, lev_max = 200,
                        must_no = 0, must = 0, max_num = 0, min_box = 0,
                        max_box = 0, sex = 2, classes = 0, min_lev_break = 0,
                        max_lev_break = 1};
get_item(36) ->
    #camp_box_item_data{id = 36, group = 3, item_id = 20014,
                        bind = 0, num = 1, weigth = 60, box_weigth = 200,
                        is_cast = 1, is_log = 1, lev_min = 1, lev_max = 200,
                        must_no = 0, must = 0, max_num = 0, min_box = 0,
                        max_box = 0, sex = 2, classes = 0, min_lev_break = 0,
                        max_lev_break = 1};
get_item(37) ->
    #camp_box_item_data{id = 37, group = 3, item_id = 20053,
                        bind = 0, num = 1, weigth = 100, box_weigth = 200,
                        is_cast = 0, is_log = 0, lev_min = 1, lev_max = 200,
                        must_no = 0, must = 0, max_num = 0, min_box = 0,
                        max_box = 0, sex = 2, classes = 0, min_lev_break = 0,
                        max_lev_break = 1};
get_item(38) ->
    #camp_box_item_data{id = 38, group = 3, item_id = 28607,
                        bind = 0, num = 1, weigth = 80, box_weigth = 200,
                        is_cast = 1, is_log = 1, lev_min = 1, lev_max = 89,
                        must_no = 0, must = 0, max_num = 0, min_box = 0,
                        max_box = 0, sex = 2, classes = 0, min_lev_break = 0,
                        max_lev_break = 1};
get_item(39) ->
    #camp_box_item_data{id = 39, group = 3, item_id = 20545,
                        bind = 0, num = 3, weigth = 60, box_weigth = 200,
                        is_cast = 0, is_log = 0, lev_min = 1, lev_max = 74,
                        must_no = 0, must = 0, max_num = 0, min_box = 0,
                        max_box = 0, sex = 2, classes = 0, min_lev_break = 0,
                        max_lev_break = 1};
get_item(40) ->
    #camp_box_item_data{id = 40, group = 3, item_id = 21244,
                        bind = 0, num = 1, weigth = 60, box_weigth = 200,
                        is_cast = 0, is_log = 0, lev_min = 75, lev_max = 200,
                        must_no = 0, must = 0, max_num = 0, min_box = 0,
                        max_box = 0, sex = 2, classes = 0, min_lev_break = 0,
                        max_lev_break = 1};
get_item(41) ->
    #camp_box_item_data{id = 41, group = 3, item_id = 23660,
                        bind = 0, num = 1, weigth = 80, box_weigth = 200,
                        is_cast = 0, is_log = 0, lev_min = 90, lev_max = 200,
                        must_no = 0, must = 0, max_num = 0, min_box = 0,
                        max_box = 0, sex = 2, classes = 0, min_lev_break = 0,
                        max_lev_break = 1};
get_item(42) ->
    #camp_box_item_data{id = 42, group = 3, item_id = 21322,
                        bind = 0, num = 1, weigth = 120, box_weigth = 200,
                        is_cast = 0, is_log = 0, lev_min = 1, lev_max = 200,
                        must_no = 0, must = 0, max_num = 0, min_box = 0,
                        max_box = 0, sex = 2, classes = 0, min_lev_break = 0,
                        max_lev_break = 1};
get_item(43) ->
    #camp_box_item_data{id = 43, group = 3, item_id = 20075,
                        bind = 0, num = 1, weigth = 120, box_weigth = 200,
                        is_cast = 0, is_log = 0, lev_min = 1, lev_max = 200,
                        must_no = 0, must = 0, max_num = 0, min_box = 0,
                        max_box = 0, sex = 2, classes = 0, min_lev_break = 0,
                        max_lev_break = 1};
get_item(44) ->
    #camp_box_item_data{id = 44, group = 4, item_id = 90026,
                        bind = 0, num = 150, weigth = 100, box_weigth = 450,
                        is_cast = 0, is_log = 0, lev_min = 1, lev_max = 200,
                        must_no = 0, must = 0, max_num = 0, min_box = 0,
                        max_box = 0, sex = 2, classes = 0, min_lev_break = 0,
                        max_lev_break = 1};
get_item(45) ->
    #camp_box_item_data{id = 45, group = 4, item_id = 20002,
                        bind = 0, num = 2, weigth = 80, box_weigth = 450,
                        is_cast = 0, is_log = 0, lev_min = 1, lev_max = 200,
                        must_no = 0, must = 0, max_num = 0, min_box = 0,
                        max_box = 0, sex = 2, classes = 0, min_lev_break = 0,
                        max_lev_break = 1};
get_item(46) ->
    #camp_box_item_data{id = 46, group = 4, item_id = 20000,
                        bind = 0, num = 2, weigth = 80, box_weigth = 450,
                        is_cast = 0, is_log = 0, lev_min = 1, lev_max = 200,
                        must_no = 0, must = 0, max_num = 0, min_box = 0,
                        max_box = 0, sex = 2, classes = 0, min_lev_break = 0,
                        max_lev_break = 1};
get_item(47) ->
    #camp_box_item_data{id = 47, group = 4, item_id = 20034,
                        bind = 0, num = 3, weigth = 60, box_weigth = 450,
                        is_cast = 0, is_log = 0, lev_min = 1, lev_max = 79,
                        must_no = 0, must = 0, max_num = 0, min_box = 0,
                        max_box = 0, sex = 2, classes = 0, min_lev_break = 0,
                        max_lev_break = 1};
get_item(48) ->
    #camp_box_item_data{id = 48, group = 4, item_id = 21098,
                        bind = 0, num = 3, weigth = 60, box_weigth = 450,
                        is_cast = 0, is_log = 0, lev_min = 80, lev_max = 200,
                        must_no = 0, must = 0, max_num = 0, min_box = 0,
                        max_box = 0, sex = 2, classes = 0, min_lev_break = 0,
                        max_lev_break = 1};
get_item(49) ->
    #camp_box_item_data{id = 49, group = 4, item_id = 20095,
                        bind = 0, num = 1, weigth = 70, box_weigth = 450,
                        is_cast = 0, is_log = 0, lev_min = 1, lev_max = 200,
                        must_no = 0, must = 0, max_num = 0, min_box = 0,
                        max_box = 0, sex = 2, classes = 0, min_lev_break = 0,
                        max_lev_break = 1};
get_item(50) ->
    #camp_box_item_data{id = 50, group = 4, item_id = 22216,
                        bind = 0, num = 1, weigth = 50, box_weigth = 450,
                        is_cast = 0, is_log = 0, lev_min = 1, lev_max = 200,
                        must_no = 0, must = 0, max_num = 0, min_box = 0,
                        max_box = 0, sex = 2, classes = 0, min_lev_break = 0,
                        max_lev_break = 1};
get_item(51) ->
    #camp_box_item_data{id = 51, group = 4, item_id = 20046,
                        bind = 0, num = 1, weigth = 80, box_weigth = 450,
                        is_cast = 0, is_log = 0, lev_min = 1, lev_max = 200,
                        must_no = 0, must = 0, max_num = 0, min_box = 0,
                        max_box = 0, sex = 2, classes = 0, min_lev_break = 0,
                        max_lev_break = 1};
get_item(52) ->
    #camp_box_item_data{id = 52, group = 4, item_id = 29046,
                        bind = 0, num = 1, weigth = 60, box_weigth = 450,
                        is_cast = 0, is_log = 0, lev_min = 1, lev_max = 79,
                        must_no = 0, must = 0, max_num = 0, min_box = 0,
                        max_box = 0, sex = 2, classes = 0, min_lev_break = 0,
                        max_lev_break = 1};
get_item(53) ->
    #camp_box_item_data{id = 53, group = 4, item_id = 22307,
                        bind = 0, num = 1, weigth = 60, box_weigth = 450,
                        is_cast = 0, is_log = 0, lev_min = 80, lev_max = 200,
                        must_no = 0, must = 0, max_num = 0, min_box = 0,
                        max_box = 0, sex = 2, classes = 0, min_lev_break = 0,
                        max_lev_break = 1};
get_item(54) ->
    #camp_box_item_data{id = 54, group = 4, item_id = 22585,
                        bind = 0, num = 1, weigth = 30, box_weigth = 450,
                        is_cast = 0, is_log = 0, lev_min = 1, lev_max = 200,
                        must_no = 0, must = 0, max_num = 0, min_box = 0,
                        max_box = 0, sex = 2, classes = 0, min_lev_break = 0,
                        max_lev_break = 1};
get_item(55) ->
    #camp_box_item_data{id = 55, group = 4, item_id = 20545,
                        bind = 0, num = 1, weigth = 50, box_weigth = 450,
                        is_cast = 0, is_log = 0, lev_min = 1, lev_max = 79,
                        must_no = 0, must = 0, max_num = 0, min_box = 0,
                        max_box = 0, sex = 2, classes = 0, min_lev_break = 0,
                        max_lev_break = 1};
get_item(56) ->
    #camp_box_item_data{id = 56, group = 4, item_id = 22306,
                        bind = 0, num = 2, weigth = 50, box_weigth = 450,
                        is_cast = 0, is_log = 0, lev_min = 80, lev_max = 200,
                        must_no = 0, must = 0, max_num = 0, min_box = 0,
                        max_box = 0, sex = 2, classes = 0, min_lev_break = 0,
                        max_lev_break = 1};
get_item(57) ->
    #camp_box_item_data{id = 57, group = 4, item_id = 20006,
                        bind = 0, num = 30, weigth = 50, box_weigth = 450,
                        is_cast = 0, is_log = 0, lev_min = 1, lev_max = 200,
                        must_no = 0, must = 0, max_num = 0, min_box = 0,
                        max_box = 0, sex = 2, classes = 0, min_lev_break = 0,
                        max_lev_break = 1};
get_item(58) ->
    #camp_box_item_data{id = 58, group = 4, item_id = 20039,
                        bind = 0, num = 1, weigth = 80, box_weigth = 450,
                        is_cast = 0, is_log = 0, lev_min = 1, lev_max = 200,
                        must_no = 0, must = 0, max_num = 0, min_box = 0,
                        max_box = 0, sex = 2, classes = 0, min_lev_break = 0,
                        max_lev_break = 1};
get_item(59) ->
    #camp_box_item_data{id = 59, group = 4, item_id = 20087,
                        bind = 0, num = 1, weigth = 80, box_weigth = 450,
                        is_cast = 0, is_log = 0, lev_min = 1, lev_max = 200,
                        must_no = 0, must = 0, max_num = 0, min_box = 0,
                        max_box = 0, sex = 2, classes = 0, min_lev_break = 0,
                        max_lev_break = 1};
get_item(60) ->
    #camp_box_item_data{id = 60, group = 4, item_id = 21130,
                        bind = 0, num = 1, weigth = 30, box_weigth = 450,
                        is_cast = 0, is_log = 0, lev_min = 1, lev_max = 200,
                        must_no = 0, must = 0, max_num = 0, min_box = 0,
                        max_box = 0, sex = 2, classes = 0, min_lev_break = 0,
                        max_lev_break = 1};
get_item(61) ->
    #camp_box_item_data{id = 61, group = 4, item_id = 29102,
                        bind = 0, num = 1, weigth = 50, box_weigth = 450,
                        is_cast = 0, is_log = 0, lev_min = 1, lev_max = 79,
                        must_no = 0, must = 0, max_num = 0, min_box = 0,
                        max_box = 0, sex = 2, classes = 0, min_lev_break = 0,
                        max_lev_break = 1};
get_item(62) ->
    #camp_box_item_data{id = 62, group = 4, item_id = 23556,
                        bind = 0, num = 2, weigth = 50, box_weigth = 450,
                        is_cast = 0, is_log = 0, lev_min = 80, lev_max = 200,
                        must_no = 0, must = 0, max_num = 0, min_box = 0,
                        max_box = 0, sex = 2, classes = 0, min_lev_break = 0,
                        max_lev_break = 1};
get_item(63) ->
    #camp_box_item_data{id = 63, group = 4, item_id = 20022,
                        bind = 0, num = 1, weigth = 50, box_weigth = 450,
                        is_cast = 0, is_log = 0, lev_min = 1, lev_max = 74,
                        must_no = 0, must = 0, max_num = 0, min_box = 0,
                        max_box = 0, sex = 2, classes = 0, min_lev_break = 0,
                        max_lev_break = 1};
get_item(64) ->
    #camp_box_item_data{id = 64, group = 4, item_id = 23733,
                        bind = 0, num = 3, weigth = 50, box_weigth = 450,
                        is_cast = 0, is_log = 0, lev_min = 75, lev_max = 200,
                        must_no = 0, must = 0, max_num = 0, min_box = 0,
                        max_box = 0, sex = 2, classes = 0, min_lev_break = 0,
                        max_lev_break = 1};
get_item(_) -> false.

