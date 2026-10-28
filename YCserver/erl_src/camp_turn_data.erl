-file("src/data/camp_turn_data.erl", 1).

-module(camp_turn_data).

-export([get_type/1,
         type_id/1,
         get_item/1,
         get_type_acc/1,
         acc_type/1,
         is_item_cast/1,
         get_ext/1]).

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

-file("src/data/camp_turn_data.erl", 21).

-file("inc/camp_turn.hrl", 1).

-record(m_camp_turn,
        {camp_id = 0, item_list = 0, is_cast = 0, is_log = 0}).

-record(camp_turn_log,
        {id = 0,
         name = "",
         item_id = 0,
         bind = 0,
         num = 0,
         mtime = 0}).

-record(camp_turn_type_data,
        {type,
         name = "",
         is_open = 0,
         day_time = [],
         cast_msg = "",
         cost = [],
         gain = [],
         is_repeat = 0}).

-record(camp_turn_data,
        {id = 0,
         type = 0,
         item_id = 0,
         bind = 0,
         num = 0,
         weigth = 0,
         is_cast = 0,
         is_log = 0,
         lev_min = 0,
         lev_max = 0,
         classes = 0,
         sex = 2,
         must = 0,
         must_no = 0,
         max_num = 0}).

-record(camp_turn_acc_data,
        {type = 0,
         reward_type = 0,
         num = 0,
         item_list = [],
         title = "",
         content = "",
         is_cast = 0,
         cast_msg = ""}).

-file("src/data/camp_turn_data.erl", 22).

get_type(1) ->
    #camp_turn_type_data{type = 1, name = lang:get("幸运大转盘"),
                         is_open = 0, day_time = [{0, 0, 0, 23, 59, 59}],
                         cast_msg =
                             lang:get("运气爆棚！#role#在<color=#00ff00>幸运大转盘</color>中幸运的抽"
                                      "到了#item#{face_1,3}"),
                         cost = [{21703, 1}]};
get_type(2) ->
    #camp_turn_type_data{type = 2, name = lang:get("魔轮随心转"),
                         is_open = 0, day_time = [{0, 0, 0, 23, 59, 59}],
                         cast_msg =
                             lang:get("运气爆棚！#role#在<color=#00ff00>魔轮随心转</color>中幸运的抽"
                                      "到了#item#{face_1,3}")};
get_type(3) ->
    #camp_turn_type_data{type = 3, name = lang:get("甜蜜扭蛋"),
                         is_open = 1, day_time = [{0, 0, 0, 23, 59, 59}],
                         cast_msg =
                             lang:get("运气爆棚！#role#在<color=#00ff00>欢乐扭蛋</color>中幸运的抽到"
                                      "了#item#{face_1,3}"),
                         cost = [{29928, 1}], gain = [{90052, 5}]};
get_type(4) ->
    #camp_turn_type_data{type = 4, name = lang:get("星云宝库"),
                         is_open = 0, day_time = [{0, 0, 0, 23, 59, 59}],
                         cast_msg =
                             lang:get("运气爆棚！#role#在<color=#00ff00>星云宝库</color>中幸运的抽到"
                                      "了#item#{face_1,3}"),
                         cost = [{23226, 1}], is_repeat = 1};
get_type(5) ->
    #camp_turn_type_data{type = 5, name = lang:get("幸运扭蛋"),
                         is_open = 1, day_time = [{0, 0, 0, 23, 59, 60}],
                         cast_msg =
                             lang:get("运气爆棚！#role#在<color=#00ff00>星云宝库</color>中幸运的抽到"
                                      "了#item#{face_1,4}"),
                         cost = [{70935, 1}], gain = [{90067, 5}]};
get_type(_) -> false.

type_id(1) ->
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
     32];
type_id(3) ->
    [33,
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
     64,
     65,
     66,
     67,
     68,
     69,
     70,
     71,
     72,
     73,
     74];
type_id(4) ->
    [75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85];
type_id(5) ->
    [86,
     87,
     88,
     89,
     90,
     91,
     92,
     93,
     94,
     95,
     96,
     97,
     98,
     99,
     100,
     101,
     102,
     103,
     104,
     105,
     106,
     107,
     108,
     109,
     110,
     111,
     112,
     113,
     114,
     115];
type_id(_) -> [].

get_item(1) ->
    #camp_turn_data{id = 1, type = 1, item_id = 20306,
                    bind = 0, num = 1, weigth = 3, is_cast = 1, is_log = 0,
                    lev_min = 1, lev_max = 200, must_no = 100, must = 0,
                    max_num = 1};
get_item(2) ->
    #camp_turn_data{id = 2, type = 1, item_id = 22205,
                    bind = 0, num = 1, weigth = 77, is_cast = 1, is_log = 0,
                    lev_min = 1, lev_max = 200, must_no = 10, must = 0,
                    max_num = 0};
get_item(3) ->
    #camp_turn_data{id = 3, type = 1, item_id = 29360,
                    bind = 0, num = 1, weigth = 40, is_cast = 0, is_log = 0,
                    lev_min = 1, lev_max = 200, must_no = 4, must = 0,
                    max_num = 0};
get_item(4) ->
    #camp_turn_data{id = 4, type = 1, item_id = 29365,
                    bind = 0, num = 1, weigth = 80, is_cast = 0, is_log = 0,
                    lev_min = 1, lev_max = 200, must_no = 0, must = 0,
                    max_num = 0};
get_item(5) ->
    #camp_turn_data{id = 5, type = 1, item_id = 29364,
                    bind = 0, num = 1, weigth = 200, is_cast = 0,
                    is_log = 0, lev_min = 1, lev_max = 200, must_no = 0,
                    must = 0, max_num = 0};
get_item(6) ->
    #camp_turn_data{id = 6, type = 1, item_id = 29363,
                    bind = 0, num = 1, weigth = 260, is_cast = 0,
                    is_log = 0, lev_min = 1, lev_max = 200, must_no = 0,
                    must = 0, max_num = 0};
get_item(7) ->
    #camp_turn_data{id = 7, type = 1, item_id = 20046,
                    bind = 0, num = 1, weigth = 800, is_cast = 0,
                    is_log = 0, lev_min = 1, lev_max = 200, must_no = 0,
                    must = 0, max_num = 0};
get_item(8) ->
    #camp_turn_data{id = 8, type = 1, item_id = 23550,
                    bind = 0, num = 1, weigth = 150, is_cast = 0,
                    is_log = 0, lev_min = 1, lev_max = 200, must_no = 0,
                    must = 0, max_num = 0};
get_item(9) ->
    #camp_turn_data{id = 9, type = 1, item_id = 23554,
                    bind = 0, num = 1, weigth = 300, is_cast = 0,
                    is_log = 0, lev_min = 1, lev_max = 200, must_no = 0,
                    must = 0, max_num = 0};
get_item(10) ->
    #camp_turn_data{id = 10, type = 1, item_id = 23555,
                    bind = 0, num = 1, weigth = 500, is_cast = 0,
                    is_log = 0, lev_min = 1, lev_max = 200, must_no = 0,
                    must = 0, max_num = 0};
get_item(11) ->
    #camp_turn_data{id = 11, type = 1, item_id = 23556,
                    bind = 0, num = 1, weigth = 600, is_cast = 0,
                    is_log = 0, lev_min = 1, lev_max = 200, must_no = 0,
                    must = 0, max_num = 0};
get_item(12) ->
    #camp_turn_data{id = 12, type = 1, item_id = 23575,
                    bind = 0, num = 1, weigth = 10, is_cast = 0, is_log = 0,
                    lev_min = 1, lev_max = 200, must_no = 30, must = 0,
                    max_num = 1};
get_item(13) ->
    #camp_turn_data{id = 13, type = 1, item_id = 23579,
                    bind = 0, num = 1, weigth = 10, is_cast = 0, is_log = 0,
                    lev_min = 1, lev_max = 200, must_no = 30, must = 0,
                    max_num = 1};
get_item(14) ->
    #camp_turn_data{id = 14, type = 1, item_id = 20014,
                    bind = 0, num = 1, weigth = 20, is_cast = 0, is_log = 0,
                    lev_min = 1, lev_max = 200, must_no = 0, must = 0,
                    max_num = 0};
get_item(15) ->
    #camp_turn_data{id = 15, type = 1, item_id = 20072,
                    bind = 0, num = 1, weigth = 800, is_cast = 0,
                    is_log = 0, lev_min = 1, lev_max = 200, must_no = 0,
                    must = 0, max_num = 0};
get_item(16) ->
    #camp_turn_data{id = 16, type = 1, item_id = 20038,
                    bind = 0, num = 1, weigth = 20, is_cast = 0, is_log = 0,
                    lev_min = 1, lev_max = 200, must_no = 0, must = 0,
                    max_num = 0};
get_item(17) ->
    #camp_turn_data{id = 17, type = 1, item_id = 20095,
                    bind = 0, num = 1, weigth = 50, is_cast = 0, is_log = 0,
                    lev_min = 1, lev_max = 200, must_no = 0, must = 0,
                    max_num = 0};
get_item(18) ->
    #camp_turn_data{id = 18, type = 1, item_id = 29101,
                    bind = 0, num = 1, weigth = 50, is_cast = 0, is_log = 0,
                    lev_min = 1, lev_max = 200, must_no = 0, must = 0,
                    max_num = 0};
get_item(19) ->
    #camp_turn_data{id = 19, type = 1, item_id = 29100,
                    bind = 0, num = 1, weigth = 20, is_cast = 0, is_log = 0,
                    lev_min = 1, lev_max = 200, must_no = 0, must = 0,
                    max_num = 0};
get_item(20) ->
    #camp_turn_data{id = 20, type = 1, item_id = 22595,
                    bind = 0, num = 1, weigth = 950, is_cast = 0,
                    is_log = 0, lev_min = 1, lev_max = 200, must_no = 0,
                    must = 0, max_num = 0};
get_item(21) ->
    #camp_turn_data{id = 21, type = 1, item_id = 29103,
                    bind = 0, num = 1, weigth = 500, is_cast = 0,
                    is_log = 0, lev_min = 1, lev_max = 200, must_no = 0,
                    must = 0, max_num = 0};
get_item(22) ->
    #camp_turn_data{id = 22, type = 1, item_id = 29102,
                    bind = 0, num = 1, weigth = 570, is_cast = 0,
                    is_log = 0, lev_min = 1, lev_max = 200, must_no = 0,
                    must = 0, max_num = 0};
get_item(23) ->
    #camp_turn_data{id = 23, type = 1, item_id = 20021,
                    bind = 0, num = 2, weigth = 800, is_cast = 0,
                    is_log = 0, lev_min = 1, lev_max = 200, must_no = 0,
                    must = 0, max_num = 0};
get_item(24) ->
    #camp_turn_data{id = 24, type = 1, item_id = 20022,
                    bind = 0, num = 1, weigth = 300, is_cast = 0,
                    is_log = 0, lev_min = 1, lev_max = 200, must_no = 0,
                    must = 0, max_num = 0};
get_item(25) ->
    #camp_turn_data{id = 25, type = 1, item_id = 20404,
                    bind = 0, num = 1, weigth = 30, is_cast = 0, is_log = 0,
                    lev_min = 1, lev_max = 200, must_no = 0, must = 0,
                    max_num = 0};
get_item(26) ->
    #camp_turn_data{id = 26, type = 1, item_id = 22216,
                    bind = 0, num = 1, weigth = 800, is_cast = 0,
                    is_log = 0, lev_min = 1, lev_max = 200, must_no = 0,
                    must = 0, max_num = 0};
get_item(27) ->
    #camp_turn_data{id = 27, type = 1, item_id = 20025,
                    bind = 0, num = 3, weigth = 400, is_cast = 0,
                    is_log = 0, lev_min = 1, lev_max = 200, must_no = 0,
                    must = 0, max_num = 0};
get_item(28) ->
    #camp_turn_data{id = 28, type = 1, item_id = 22585,
                    bind = 0, num = 1, weigth = 2000, is_cast = 0,
                    is_log = 0, lev_min = 1, lev_max = 200, must_no = 0,
                    must = 0, max_num = 0};
get_item(29) ->
    #camp_turn_data{id = 29, type = 1, item_id = 20616,
                    bind = 0, num = 1, weigth = 300, is_cast = 0,
                    is_log = 0, lev_min = 1, lev_max = 200, must_no = 0,
                    must = 0, max_num = 0};
get_item(30) ->
    #camp_turn_data{id = 30, type = 1, item_id = 20617,
                    bind = 0, num = 1, weigth = 30, is_cast = 0, is_log = 0,
                    lev_min = 1, lev_max = 200, must_no = 0, must = 0,
                    max_num = 0};
get_item(31) ->
    #camp_turn_data{id = 31, type = 1, item_id = 20075,
                    bind = 0, num = 1, weigth = 150, is_cast = 0,
                    is_log = 0, lev_min = 1, lev_max = 200, must_no = 0,
                    must = 0, max_num = 0};
get_item(32) ->
    #camp_turn_data{id = 32, type = 1, item_id = 20076,
                    bind = 0, num = 1, weigth = 60, is_cast = 0, is_log = 0,
                    lev_min = 1, lev_max = 200, must_no = 0, must = 0,
                    max_num = 0};
get_item(33) ->
    #camp_turn_data{id = 33, type = 3, item_id = 29934,
                    bind = 0, num = 1, weigth = 5, is_cast = 1, is_log = 0,
                    lev_min = 2, lev_max = 200, must_no = 0, must = 0,
                    max_num = 3};
get_item(34) ->
    #camp_turn_data{id = 34, type = 3, item_id = 29937,
                    bind = 0, num = 1, weigth = 5, is_cast = 1, is_log = 0,
                    lev_min = 3, lev_max = 200, must_no = 0, must = 0,
                    max_num = 3};
get_item(35) ->
    #camp_turn_data{id = 35, type = 3, item_id = 21245,
                    bind = 0, num = 1, weigth = 1, is_cast = 1, is_log = 0,
                    lev_min = 80, lev_max = 94, must_no = 0, must = 0,
                    max_num = 0};
get_item(36) ->
    #camp_turn_data{id = 36, type = 3, item_id = 21174,
                    bind = 0, num = 1, weigth = 2, is_cast = 1, is_log = 0,
                    lev_min = 2, lev_max = 200, must_no = 0, must = 500,
                    max_num = 1};
get_item(37) ->
    #camp_turn_data{id = 37, type = 3, item_id = 22441,
                    bind = 0, num = 1, weigth = 5, is_cast = 1, is_log = 0,
                    lev_min = 1, lev_max = 200, must_no = 10, must = 200,
                    max_num = 0};
get_item(38) ->
    #camp_turn_data{id = 38, type = 3, item_id = 23771,
                    bind = 0, num = 1, weigth = 3, is_cast = 1, is_log = 0,
                    lev_min = 1, lev_max = 200, must_no = 0, must = 0,
                    max_num = 10};
get_item(39) ->
    #camp_turn_data{id = 39, type = 3, item_id = 22205,
                    bind = 0, num = 1, weigth = 7, is_cast = 1, is_log = 0,
                    lev_min = 1, lev_max = 200, must_no = 10, must = 150,
                    max_num = 0};
get_item(40) ->
    #camp_turn_data{id = 40, type = 3, item_id = 29041,
                    bind = 0, num = 1, weigth = 15, is_cast = 1, is_log = 0,
                    lev_min = 1, lev_max = 200, must_no = 0, must = 0,
                    max_num = 0};
get_item(41) ->
    #camp_turn_data{id = 41, type = 3, item_id = 22432,
                    bind = 0, num = 1, weigth = 10, is_cast = 1, is_log = 0,
                    lev_min = 2, lev_max = 200, must_no = 0, must = 0,
                    max_num = 1};
get_item(42) ->
    #camp_turn_data{id = 42, type = 3, item_id = 22433,
                    bind = 0, num = 1, weigth = 20, is_cast = 1, is_log = 0,
                    lev_min = 2, lev_max = 200, must_no = 0, must = 0,
                    max_num = 3};
get_item(43) ->
    #camp_turn_data{id = 43, type = 3, item_id = 21173,
                    bind = 0, num = 1, weigth = 5, is_cast = 1, is_log = 0,
                    lev_min = 2, lev_max = 200, must_no = 0, must = 0,
                    max_num = 3};
get_item(44) ->
    #camp_turn_data{id = 44, type = 3, item_id = 20638,
                    bind = 0, num = 1, weigth = 3, is_cast = 1, is_log = 0,
                    lev_min = 1, lev_max = 79, must_no = 0, must = 0,
                    max_num = 0};
get_item(45) ->
    #camp_turn_data{id = 45, type = 3, item_id = 20638,
                    bind = 0, num = 1, weigth = 2, is_cast = 1, is_log = 0,
                    lev_min = 80, lev_max = 200, must_no = 0, must = 0,
                    max_num = 0};
get_item(46) ->
    #camp_turn_data{id = 46, type = 3, item_id = 21257,
                    bind = 0, num = 1, weigth = 1, is_cast = 1, is_log = 0,
                    lev_min = 95, lev_max = 200, must_no = 0, must = 0,
                    max_num = 0};
get_item(47) ->
    #camp_turn_data{id = 47, type = 3, item_id = 20617,
                    bind = 0, num = 1, weigth = 5, is_cast = 1, is_log = 0,
                    lev_min = 1, lev_max = 200, must_no = 0, must = 0,
                    max_num = 0};
get_item(48) ->
    #camp_turn_data{id = 48, type = 3, item_id = 22617,
                    bind = 0, num = 1, weigth = 10, is_cast = 1, is_log = 0,
                    lev_min = 1, lev_max = 200, must_no = 0, must = 0,
                    max_num = 0};
get_item(49) ->
    #camp_turn_data{id = 49, type = 3, item_id = 29101,
                    bind = 0, num = 1, weigth = 3, is_cast = 1, is_log = 0,
                    lev_min = 1, lev_max = 200, must_no = 0, must = 0,
                    max_num = 0};
get_item(50) ->
    #camp_turn_data{id = 50, type = 3, item_id = 90026,
                    bind = 0, num = 500, weigth = 35, is_cast = 0,
                    is_log = 0, lev_min = 1, lev_max = 200, must_no = 0,
                    must = 0, max_num = 0};
get_item(51) ->
    #camp_turn_data{id = 51, type = 3, item_id = 29314,
                    bind = 0, num = 1, weigth = 30, is_cast = 1, is_log = 0,
                    lev_min = 1, lev_max = 200, must_no = 0, must = 0,
                    max_num = 0};
get_item(52) ->
    #camp_turn_data{id = 52, type = 3, item_id = 20616,
                    bind = 0, num = 1, weigth = 10, is_cast = 0, is_log = 0,
                    lev_min = 1, lev_max = 200, must_no = 0, must = 0,
                    max_num = 0};
get_item(53) ->
    #camp_turn_data{id = 53, type = 3, item_id = 20075,
                    bind = 0, num = 1, weigth = 20, is_cast = 0, is_log = 0,
                    lev_min = 1, lev_max = 200, must_no = 0, must = 0,
                    max_num = 0};
get_item(54) ->
    #camp_turn_data{id = 54, type = 3, item_id = 20076,
                    bind = 0, num = 1, weigth = 8, is_cast = 1, is_log = 0,
                    lev_min = 1, lev_max = 200, must_no = 0, must = 0,
                    max_num = 0};
get_item(55) ->
    #camp_turn_data{id = 55, type = 3, item_id = 23740,
                    bind = 0, num = 1, weigth = 50, is_cast = 1, is_log = 0,
                    lev_min = 1, lev_max = 200, must_no = 0, must = 0,
                    max_num = 0};
get_item(56) ->
    #camp_turn_data{id = 56, type = 3, item_id = 29882,
                    bind = 0, num = 1, weigth = 50, is_cast = 1, is_log = 0,
                    lev_min = 1, lev_max = 200, must_no = 0, must = 0,
                    max_num = 0};
get_item(57) ->
    #camp_turn_data{id = 57, type = 3, item_id = 20014,
                    bind = 0, num = 1, weigth = 8, is_cast = 1, is_log = 0,
                    lev_min = 1, lev_max = 200, must_no = 0, must = 0,
                    max_num = 0};
get_item(58) ->
    #camp_turn_data{id = 58, type = 3, item_id = 29933,
                    bind = 0, num = 1, weigth = 10, is_cast = 0, is_log = 0,
                    lev_min = 1, lev_max = 200, must_no = 0, must = 0,
                    max_num = 0};
get_item(59) ->
    #camp_turn_data{id = 59, type = 3, item_id = 29936,
                    bind = 0, num = 1, weigth = 15, is_cast = 0, is_log = 0,
                    lev_min = 1, lev_max = 200, must_no = 0, must = 0,
                    max_num = 0};
get_item(60) ->
    #camp_turn_data{id = 60, type = 3, item_id = 20046,
                    bind = 0, num = 1, weigth = 80, is_cast = 0, is_log = 0,
                    lev_min = 1, lev_max = 200, must_no = 0, must = 0,
                    max_num = 0};
get_item(61) ->
    #camp_turn_data{id = 61, type = 3, item_id = 20095,
                    bind = 0, num = 1, weigth = 20, is_cast = 0, is_log = 0,
                    lev_min = 1, lev_max = 200, must_no = 0, must = 0,
                    max_num = 0};
get_item(62) ->
    #camp_turn_data{id = 62, type = 3, item_id = 20038,
                    bind = 0, num = 1, weigth = 10, is_cast = 0, is_log = 0,
                    lev_min = 1, lev_max = 200, must_no = 0, must = 0,
                    max_num = 0};
get_item(63) ->
    #camp_turn_data{id = 63, type = 3, item_id = 21322,
                    bind = 0, num = 1, weigth = 50, is_cast = 0, is_log = 0,
                    lev_min = 1, lev_max = 200, must_no = 0, must = 0,
                    max_num = 0};
get_item(64) ->
    #camp_turn_data{id = 64, type = 3, item_id = 29103,
                    bind = 0, num = 1, weigth = 30, is_cast = 0, is_log = 0,
                    lev_min = 1, lev_max = 200, must_no = 0, must = 0,
                    max_num = 0};
get_item(65) ->
    #camp_turn_data{id = 65, type = 3, item_id = 20006,
                    bind = 0, num = 20, weigth = 60, is_cast = 0,
                    is_log = 0, lev_min = 1, lev_max = 200, must_no = 0,
                    must = 0, max_num = 0};
get_item(66) ->
    #camp_turn_data{id = 66, type = 3, item_id = 20087,
                    bind = 0, num = 1, weigth = 100, is_cast = 0,
                    is_log = 0, lev_min = 1, lev_max = 200, must_no = 0,
                    must = 0, max_num = 0};
get_item(67) ->
    #camp_turn_data{id = 67, type = 3, item_id = 90026,
                    bind = 0, num = 100, weigth = 60, is_cast = 0,
                    is_log = 0, lev_min = 1, lev_max = 200, must_no = 0,
                    must = 0, max_num = 0};
get_item(68) ->
    #camp_turn_data{id = 68, type = 3, item_id = 20755,
                    bind = 0, num = 1, weigth = 10, is_cast = 1, is_log = 0,
                    lev_min = 1, lev_max = 200, must_no = 0, must = 0,
                    max_num = 0};
get_item(69) ->
    #camp_turn_data{id = 69, type = 3, item_id = 22216,
                    bind = 0, num = 1, weigth = 80, is_cast = 0, is_log = 0,
                    lev_min = 1, lev_max = 200, must_no = 0, must = 0,
                    max_num = 0};
get_item(70) ->
    #camp_turn_data{id = 70, type = 3, item_id = 22396,
                    bind = 0, num = 1, weigth = 80, is_cast = 0, is_log = 0,
                    lev_min = 1, lev_max = 79, must_no = 0, must = 0,
                    max_num = 0};
get_item(71) ->
    #camp_turn_data{id = 71, type = 3, item_id = 21098,
                    bind = 0, num = 3, weigth = 80, is_cast = 0, is_log = 0,
                    lev_min = 80, lev_max = 200, must_no = 0, must = 0,
                    max_num = 0};
get_item(72) ->
    #camp_turn_data{id = 72, type = 3, item_id = 20022,
                    bind = 0, num = 1, weigth = 100, is_cast = 0,
                    is_log = 0, lev_min = 1, lev_max = 79, must_no = 0,
                    must = 0, max_num = 0};
get_item(73) ->
    #camp_turn_data{id = 73, type = 3, item_id = 22307,
                    bind = 0, num = 1, weigth = 100, is_cast = 0,
                    is_log = 0, lev_min = 80, lev_max = 200, must_no = 0,
                    must = 0, max_num = 0};
get_item(74) ->
    #camp_turn_data{id = 74, type = 3, item_id = 20089,
                    bind = 0, num = 1, weigth = 80, is_cast = 0, is_log = 0,
                    lev_min = 1, lev_max = 200, must_no = 0, must = 0,
                    max_num = 0};
get_item(75) ->
    #camp_turn_data{id = 75, type = 4, item_id = 29426,
                    bind = 0, num = 1, weigth = 200, is_cast = 0,
                    is_log = 0, lev_min = 1, lev_max = 200, must_no = 0,
                    must = 0, max_num = 0};
get_item(76) ->
    #camp_turn_data{id = 76, type = 4, item_id = 20053,
                    bind = 0, num = 1, weigth = 200, is_cast = 0,
                    is_log = 0, lev_min = 1, lev_max = 200, must_no = 0,
                    must = 0, max_num = 0};
get_item(77) ->
    #camp_turn_data{id = 77, type = 4, item_id = 22216,
                    bind = 0, num = 1, weigth = 200, is_cast = 0,
                    is_log = 0, lev_min = 1, lev_max = 200, must_no = 0,
                    must = 0, max_num = 0};
get_item(78) ->
    #camp_turn_data{id = 78, type = 4, item_id = 29314,
                    bind = 0, num = 2, weigth = 100, is_cast = 0,
                    is_log = 0, lev_min = 1, lev_max = 200, must_no = 4,
                    must = 0, max_num = 0};
get_item(79) ->
    #camp_turn_data{id = 79, type = 4, item_id = 22300,
                    bind = 0, num = 1, weigth = 100, is_cast = 0,
                    is_log = 0, lev_min = 1, lev_max = 200, must_no = 0,
                    must = 0, max_num = 0};
get_item(80) ->
    #camp_turn_data{id = 80, type = 4, item_id = 20617,
                    bind = 0, num = 1, weigth = 100, is_cast = 0,
                    is_log = 0, lev_min = 1, lev_max = 200, must_no = 0,
                    must = 0, max_num = 0};
get_item(81) ->
    #camp_turn_data{id = 81, type = 4, item_id = 29041,
                    bind = 0, num = 1, weigth = 60, is_cast = 1, is_log = 1,
                    lev_min = 1, lev_max = 64, must_no = 0, must = 0,
                    max_num = 0};
get_item(82) ->
    #camp_turn_data{id = 82, type = 4, item_id = 21244,
                    bind = 0, num = 2, weigth = 60, is_cast = 1, is_log = 1,
                    lev_min = 65, lev_max = 200, must_no = 3, must = 0,
                    max_num = 0};
get_item(83) ->
    #camp_turn_data{id = 83, type = 4, item_id = 29547,
                    bind = 0, num = 1, weigth = 60, is_cast = 1, is_log = 1,
                    lev_min = 1, lev_max = 200, must_no = 5, must = 0,
                    max_num = 0};
get_item(84) ->
    #camp_turn_data{id = 84, type = 4, item_id = 21245,
                    bind = 0, num = 1, weigth = 15, is_cast = 1, is_log = 1,
                    lev_min = 65, lev_max = 200, must_no = 7, must = 0,
                    max_num = 0};
get_item(85) ->
    #camp_turn_data{id = 85, type = 4, item_id = 22205,
                    bind = 0, num = 1, weigth = 15, is_cast = 1, is_log = 1,
                    lev_min = 1, lev_max = 64, must_no = 7, must = 0,
                    max_num = 0};
get_item(86) ->
    #camp_turn_data{id = 86, type = 5, item_id = 20704,
                    bind = 0, num = 1, weigth = 3, is_cast = 1, is_log = 0,
                    lev_min = 1, lev_max = 200, classes = 0, sex = 2,
                    must_no = 10, must = 0, max_num = 0};
get_item(87) ->
    #camp_turn_data{id = 87, type = 5, item_id = 29041,
                    bind = 0, num = 1, weigth = 5, is_cast = 1, is_log = 0,
                    lev_min = 1, lev_max = 200, classes = 0, sex = 2,
                    must_no = 10, must = 0, max_num = 0};
get_item(88) ->
    #camp_turn_data{id = 88, type = 5, item_id = 29558,
                    bind = 0, num = 1, weigth = 3, is_cast = 1, is_log = 0,
                    lev_min = 1, lev_max = 200, classes = 0, sex = 0,
                    must_no = 10, must = 300, max_num = 0};
get_item(89) ->
    #camp_turn_data{id = 89, type = 5, item_id = 29559,
                    bind = 0, num = 1, weigth = 3, is_cast = 1, is_log = 0,
                    lev_min = 1, lev_max = 200, classes = 0, sex = 1,
                    must_no = 10, must = 300, max_num = 0};
get_item(90) ->
    #camp_turn_data{id = 90, type = 5, item_id = 21173,
                    bind = 0, num = 1, weigth = 10, is_cast = 1, is_log = 0,
                    lev_min = 1, lev_max = 200, classes = 0, sex = 2,
                    must_no = 0, must = 0, max_num = 0};
get_item(91) ->
    #camp_turn_data{id = 91, type = 5, item_id = 71162,
                    bind = 0, num = 1, weigth = 10, is_cast = 1, is_log = 0,
                    lev_min = 1, lev_max = 200, classes = 0, sex = 2,
                    must_no = 0, must = 0, max_num = 0};
get_item(92) ->
    #camp_turn_data{id = 92, type = 5, item_id = 22429,
                    bind = 0, num = 1, weigth = 10, is_cast = 1, is_log = 0,
                    lev_min = 1, lev_max = 200, classes = 0, sex = 2,
                    must_no = 0, must = 0, max_num = 0};
get_item(93) ->
    #camp_turn_data{id = 93, type = 5, item_id = 20617,
                    bind = 0, num = 1, weigth = 5, is_cast = 1, is_log = 0,
                    lev_min = 1, lev_max = 200, classes = 0, sex = 2,
                    must_no = 0, must = 0, max_num = 5};
get_item(94) ->
    #camp_turn_data{id = 94, type = 5, item_id = 22617,
                    bind = 0, num = 1, weigth = 10, is_cast = 1, is_log = 0,
                    lev_min = 1, lev_max = 200, classes = 0, sex = 2,
                    must_no = 0, must = 0, max_num = 0};
get_item(95) ->
    #camp_turn_data{id = 95, type = 5, item_id = 29101,
                    bind = 0, num = 1, weigth = 10, is_cast = 1, is_log = 0,
                    lev_min = 1, lev_max = 200, classes = 0, sex = 2,
                    must_no = 0, must = 0, max_num = 0};
get_item(96) ->
    #camp_turn_data{id = 96, type = 5, item_id = 90026,
                    bind = 0, num = 200, weigth = 50, is_cast = 1,
                    is_log = 0, lev_min = 1, lev_max = 200, classes = 0,
                    sex = 2, must_no = 0, must = 0, max_num = 0};
get_item(97) ->
    #camp_turn_data{id = 97, type = 5, item_id = 29314,
                    bind = 0, num = 1, weigth = 26, is_cast = 1, is_log = 0,
                    lev_min = 1, lev_max = 200, classes = 0, sex = 2,
                    must_no = 0, must = 0, max_num = 0};
get_item(98) ->
    #camp_turn_data{id = 98, type = 5, item_id = 20616,
                    bind = 0, num = 1, weigth = 10, is_cast = 1, is_log = 0,
                    lev_min = 1, lev_max = 200, classes = 0, sex = 2,
                    must_no = 0, must = 0, max_num = 0};
get_item(99) ->
    #camp_turn_data{id = 99, type = 5, item_id = 20075,
                    bind = 0, num = 1, weigth = 30, is_cast = 1, is_log = 0,
                    lev_min = 1, lev_max = 200, classes = 0, sex = 2,
                    must_no = 0, must = 0, max_num = 0};
get_item(100) ->
    #camp_turn_data{id = 100, type = 5, item_id = 20076,
                    bind = 0, num = 1, weigth = 10, is_cast = 1, is_log = 0,
                    lev_min = 1, lev_max = 200, classes = 0, sex = 2,
                    must_no = 0, must = 0, max_num = 0};
get_item(101) ->
    #camp_turn_data{id = 101, type = 5, item_id = 23740,
                    bind = 0, num = 1, weigth = 20, is_cast = 1, is_log = 0,
                    lev_min = 1, lev_max = 200, classes = 0, sex = 2,
                    must_no = 0, must = 0, max_num = 0};
get_item(102) ->
    #camp_turn_data{id = 102, type = 5, item_id = 20014,
                    bind = 0, num = 1, weigth = 10, is_cast = 0, is_log = 0,
                    lev_min = 1, lev_max = 200, classes = 0, sex = 2,
                    must_no = 0, must = 0, max_num = 0};
get_item(103) ->
    #camp_turn_data{id = 103, type = 5, item_id = 20046,
                    bind = 0, num = 1, weigth = 70, is_cast = 1, is_log = 0,
                    lev_min = 1, lev_max = 200, classes = 0, sex = 2,
                    must_no = 0, must = 0, max_num = 0};
get_item(104) ->
    #camp_turn_data{id = 104, type = 5, item_id = 20095,
                    bind = 0, num = 1, weigth = 20, is_cast = 1, is_log = 0,
                    lev_min = 1, lev_max = 200, classes = 0, sex = 2,
                    must_no = 0, must = 0, max_num = 0};
get_item(105) ->
    #camp_turn_data{id = 105, type = 5, item_id = 20038,
                    bind = 0, num = 1, weigth = 10, is_cast = 1, is_log = 0,
                    lev_min = 1, lev_max = 200, classes = 0, sex = 2,
                    must_no = 0, must = 0, max_num = 0};
get_item(106) ->
    #camp_turn_data{id = 106, type = 5, item_id = 21322,
                    bind = 0, num = 1, weigth = 50, is_cast = 1, is_log = 0,
                    lev_min = 1, lev_max = 200, classes = 0, sex = 2,
                    must_no = 0, must = 0, max_num = 0};
get_item(107) ->
    #camp_turn_data{id = 107, type = 5, item_id = 29103,
                    bind = 0, num = 1, weigth = 50, is_cast = 0, is_log = 0,
                    lev_min = 1, lev_max = 200, classes = 0, sex = 2,
                    must_no = 0, must = 0, max_num = 0};
get_item(108) ->
    #camp_turn_data{id = 108, type = 5, item_id = 20006,
                    bind = 0, num = 20, weigth = 60, is_cast = 0,
                    is_log = 0, lev_min = 1, lev_max = 200, classes = 0,
                    sex = 2, must_no = 0, must = 0, max_num = 0};
get_item(109) ->
    #camp_turn_data{id = 109, type = 5, item_id = 20087,
                    bind = 0, num = 1, weigth = 50, is_cast = 0, is_log = 0,
                    lev_min = 1, lev_max = 200, classes = 0, sex = 2,
                    must_no = 0, must = 0, max_num = 0};
get_item(110) ->
    #camp_turn_data{id = 110, type = 5, item_id = 20020,
                    bind = 0, num = 1, weigth = 60, is_cast = 1, is_log = 0,
                    lev_min = 1, lev_max = 200, classes = 0, sex = 2,
                    must_no = 0, must = 0, max_num = 0};
get_item(111) ->
    #camp_turn_data{id = 111, type = 5, item_id = 20755,
                    bind = 0, num = 1, weigth = 10, is_cast = 1, is_log = 0,
                    lev_min = 1, lev_max = 200, classes = 0, sex = 2,
                    must_no = 0, must = 0, max_num = 0};
get_item(112) ->
    #camp_turn_data{id = 112, type = 5, item_id = 22216,
                    bind = 0, num = 1, weigth = 80, is_cast = 0, is_log = 0,
                    lev_min = 1, lev_max = 200, classes = 0, sex = 2,
                    must_no = 0, must = 0, max_num = 0};
get_item(113) ->
    #camp_turn_data{id = 113, type = 5, item_id = 20034,
                    bind = 0, num = 1, weigth = 100, is_cast = 0,
                    is_log = 0, lev_min = 1, lev_max = 200, classes = 0,
                    sex = 2, must_no = 0, must = 0, max_num = 0};
get_item(114) ->
    #camp_turn_data{id = 114, type = 5, item_id = 20021,
                    bind = 0, num = 1, weigth = 115, is_cast = 0,
                    is_log = 0, lev_min = 1, lev_max = 200, classes = 0,
                    sex = 2, must_no = 0, must = 0, max_num = 0};
get_item(115) ->
    #camp_turn_data{id = 115, type = 5, item_id = 20007,
                    bind = 0, num = 1, weigth = 100, is_cast = 0,
                    is_log = 0, lev_min = 1, lev_max = 200, classes = 0,
                    sex = 2, must_no = 0, must = 0, max_num = 0};
get_item(_) -> false.

acc_type({1, 1}) -> [10];
acc_type({1, 2}) -> [50];
acc_type({3, 3}) -> [10];
acc_type(_) -> [].

get_type_acc({1, 1, 10}) ->
    #camp_turn_acc_data{type = 1, reward_type = 1, num = 10,
                        item_list = [{20273, 0, 1, 0, 0}],
                        title = lang:get("大转盘10次奖励"),
                        content =
                            lang:get("由于您参与了<color=#ffff00>幸运大转盘</color>进行了<color=#"
                                     "00ff00>10次</color>，为感谢您的积极参与，特赠送以下奖励"),
                        is_cast = 0};
get_type_acc({1, 2, 50}) ->
    #camp_turn_acc_data{type = 1, reward_type = 2, num = 50,
                        item_list = [{22205, 0, 1, 0, 0}, {29102, 0, 1, 0, 0}],
                        title = lang:get("大转盘50次奖励"),
                        content =
                            lang:get("由于您参与了<color=#ffff00>幸运大转盘</color>进行了<color=#"
                                     "00ff00>50次</color>，为感谢您的积极参与，特赠送以下奖励"),
                        is_cast = 0};
get_type_acc({3, 3, 10}) ->
    #camp_turn_acc_data{type = 3, reward_type = 3, num = 10,
                        item_list =
                            [{23740, 0, 1, 1, 200},
                             {29915, 0, 1, 0, 0},
                             {29314, 0, 1, 0, 0}],
                        title = lang:get("欢乐扭蛋10次奖励"),
                        content =
                            lang:get("活动期间，每天前<color='#00ff00'>10</color>次参与<color="
                                     "#ffff00>欢乐扭蛋</color>活动，可获得以下奖励，请查收！"),
                        is_cast = 0};
get_type_acc(_) -> false.

is_item_cast(20306) -> 1;
is_item_cast(22205) -> 1;
is_item_cast(29360) -> 0;
is_item_cast(29365) -> 0;
is_item_cast(29364) -> 0;
is_item_cast(29363) -> 0;
is_item_cast(20046) -> 0;
is_item_cast(23550) -> 0;
is_item_cast(23554) -> 0;
is_item_cast(23555) -> 0;
is_item_cast(23556) -> 0;
is_item_cast(23575) -> 0;
is_item_cast(23579) -> 0;
is_item_cast(20014) -> 0;
is_item_cast(20072) -> 0;
is_item_cast(20038) -> 0;
is_item_cast(20095) -> 0;
is_item_cast(29101) -> 0;
is_item_cast(29100) -> 0;
is_item_cast(22595) -> 0;
is_item_cast(29103) -> 0;
is_item_cast(29102) -> 0;
is_item_cast(20021) -> 0;
is_item_cast(20022) -> 0;
is_item_cast(20404) -> 0;
is_item_cast(22216) -> 0;
is_item_cast(20025) -> 0;
is_item_cast(22585) -> 0;
is_item_cast(20616) -> 0;
is_item_cast(20617) -> 0;
is_item_cast(20075) -> 0;
is_item_cast(20076) -> 0;
is_item_cast(29934) -> 1;
is_item_cast(29937) -> 1;
is_item_cast(21245) -> 1;
is_item_cast(21174) -> 1;
is_item_cast(22441) -> 1;
is_item_cast(23771) -> 1;
is_item_cast(29041) -> 1;
is_item_cast(22432) -> 1;
is_item_cast(22433) -> 1;
is_item_cast(21173) -> 1;
is_item_cast(20638) -> 1;
is_item_cast(21257) -> 1;
is_item_cast(22617) -> 1;
is_item_cast(90026) -> 0;
is_item_cast(29314) -> 1;
is_item_cast(23740) -> 1;
is_item_cast(29882) -> 1;
is_item_cast(29933) -> 0;
is_item_cast(29936) -> 0;
is_item_cast(21322) -> 0;
is_item_cast(20006) -> 0;
is_item_cast(20087) -> 0;
is_item_cast(20755) -> 1;
is_item_cast(22396) -> 0;
is_item_cast(21098) -> 0;
is_item_cast(22307) -> 0;
is_item_cast(20089) -> 0;
is_item_cast(29426) -> 0;
is_item_cast(20053) -> 0;
is_item_cast(22300) -> 0;
is_item_cast(21244) -> 1;
is_item_cast(29547) -> 1;
is_item_cast(20704) -> 1;
is_item_cast(29558) -> 1;
is_item_cast(29559) -> 1;
is_item_cast(71162) -> 1;
is_item_cast(22429) -> 1;
is_item_cast(20020) -> 1;
is_item_cast(20034) -> 0;
is_item_cast(20007) -> 0;
is_item_cast(_) -> 0.

get_ext(5) -> {1015, 5, 100, 900, 80, 50};
get_ext(_) -> false.

