-file("src/data/camp_doll_data.erl", 1).

-module(camp_doll_data).

-export([get_list/1,
         get_data/1,
         get_odds/1,
         get_config/0,
         get_lucky/0,
         get_reward/1,
         get_limit/0]).

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

-file("src/data/camp_doll_data.erl", 22).

-file("inc/camp_misc.hrl", 1).

-record(camp_doll,
        {ver = 3,
         camp_id = 0,
         free_times = 0,
         lucky = 0,
         dolls = [],
         open_times = 0,
         logs = [],
         type1_times = 0,
         type2_times = 0,
         guarantee = []}).

-record(camp_doll_data,
        {pos = 0, open = 0, type = 0, reward = []}).

-record(camp_doll_item_data,
        {id = 1,
         type = 0,
         item_id = 20306,
         bind = 0,
         num = 1,
         odds = 100,
         is_cast = 1,
         lev_min = 1,
         lev_max = 100,
         sex = 0,
         classes = 0,
         min_lev_break = 0,
         max_lev_break = 0,
         min_times = 0,
         max_times = 0,
         ring_times = 0}).

-file("src/data/camp_doll_data.erl", 23).

get_list(2) ->
    [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14];
get_list(1) ->
    [30,
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
     55,
     56,
     43,
     44,
     45,
     46,
     47,
     48,
     49,
     50,
     51];
get_list(_) -> [].

get_data(1) ->
    #camp_doll_item_data{id = 1, type = 2, item_id = 22205,
                         bind = 0, num = 1, odds = 30, is_cast = 1, lev_min = 1,
                         lev_max = 200, min_times = 1, max_times = 2,
                         ring_times = 35, sex = 2, classes = 0,
                         min_lev_break = 0, max_lev_break = 1};
get_data(2) ->
    #camp_doll_item_data{id = 2, type = 2, item_id = 22444,
                         bind = 0, num = 1, odds = 30, is_cast = 1, lev_min = 1,
                         lev_max = 200, min_times = 1, max_times = 2,
                         ring_times = 35, sex = 2, classes = 0,
                         min_lev_break = 0, max_lev_break = 1};
get_data(3) ->
    #camp_doll_item_data{id = 3, type = 2, item_id = 23771,
                         bind = 0, num = 1, odds = 2, is_cast = 1, lev_min = 1,
                         lev_max = 200, sex = 2, classes = 0, min_lev_break = 0,
                         max_lev_break = 1};
get_data(4) ->
    #camp_doll_item_data{id = 4, type = 2, item_id = 20638,
                         bind = 0, num = 1, odds = 5, is_cast = 1, lev_min = 1,
                         lev_max = 200, sex = 2, classes = 0, min_lev_break = 0,
                         max_lev_break = 1};
get_data(5) ->
    #camp_doll_item_data{id = 5, type = 2, item_id = 20639,
                         bind = 0, num = 1, odds = 5, is_cast = 1, lev_min = 1,
                         lev_max = 200, sex = 2, classes = 0, min_lev_break = 0,
                         max_lev_break = 1};
get_data(6) ->
    #camp_doll_item_data{id = 6, type = 2, item_id = 70656,
                         bind = 0, num = 1, odds = 5, is_cast = 1, lev_min = 1,
                         lev_max = 200, sex = 0, classes = 0, min_lev_break = 0,
                         max_lev_break = 1};
get_data(7) ->
    #camp_doll_item_data{id = 7, type = 2, item_id = 70660,
                         bind = 0, num = 1, odds = 5, is_cast = 1, lev_min = 1,
                         lev_max = 200, sex = 1, classes = 0, min_lev_break = 0,
                         max_lev_break = 1};
get_data(8) ->
    #camp_doll_item_data{id = 8, type = 2, item_id = 20617,
                         bind = 0, num = 1, odds = 30, is_cast = 1, lev_min = 1,
                         lev_max = 200, sex = 2, classes = 0, min_lev_break = 0,
                         max_lev_break = 1};
get_data(9) ->
    #camp_doll_item_data{id = 9, type = 2, item_id = 29041,
                         bind = 0, num = 1, odds = 45, is_cast = 1, lev_min = 1,
                         lev_max = 200, sex = 2, classes = 0, min_lev_break = 0,
                         max_lev_break = 1};
get_data(10) ->
    #camp_doll_item_data{id = 10, type = 2, item_id = 70362,
                         bind = 0, num = 1, odds = 80, is_cast = 1, lev_min = 1,
                         lev_max = 89, sex = 2, classes = 0, min_lev_break = 0,
                         max_lev_break = 1};
get_data(11) ->
    #camp_doll_item_data{id = 11, type = 2, item_id = 21256,
                         bind = 0, num = 1, odds = 80, is_cast = 1,
                         lev_min = 90, lev_max = 200, sex = 2, classes = 0,
                         min_lev_break = 0, max_lev_break = 1};
get_data(12) ->
    #camp_doll_item_data{id = 12, type = 2, item_id = 70673,
                         bind = 0, num = 1, odds = 300, is_cast = 1,
                         lev_min = 1, lev_max = 200, sex = 2, classes = 0,
                         min_lev_break = 0, max_lev_break = 1};
get_data(13) ->
    #camp_doll_item_data{id = 13, type = 2, item_id = 23740,
                         bind = 0, num = 1, odds = 250, is_cast = 0,
                         lev_min = 1, lev_max = 200, sex = 2, classes = 0,
                         min_lev_break = 0, max_lev_break = 1};
get_data(14) ->
    #camp_doll_item_data{id = 14, type = 2, item_id = 22445,
                         bind = 0, num = 1, odds = 250, is_cast = 0,
                         lev_min = 1, lev_max = 200, sex = 2, classes = 0,
                         min_lev_break = 0, max_lev_break = 1};
get_data(30) ->
    #camp_doll_item_data{id = 30, type = 1, item_id = 22205,
                         bind = 0, num = 1, odds = 6, is_cast = 1, lev_min = 1,
                         lev_max = 200, min_times = 1, max_times = 3,
                         ring_times = 140, sex = 2, classes = 0,
                         min_lev_break = 0, max_lev_break = 1};
get_data(31) ->
    #camp_doll_item_data{id = 31, type = 1, item_id = 22444,
                         bind = 0, num = 1, odds = 6, is_cast = 1, lev_min = 1,
                         lev_max = 200, min_times = 1, max_times = 2,
                         ring_times = 160, sex = 2, classes = 0,
                         min_lev_break = 0, max_lev_break = 1};
get_data(32) ->
    #camp_doll_item_data{id = 32, type = 1, item_id = 70656,
                         bind = 0, num = 1, odds = 4, is_cast = 1, lev_min = 1,
                         lev_max = 200, sex = 0, classes = 0, min_lev_break = 0,
                         max_lev_break = 1};
get_data(33) ->
    #camp_doll_item_data{id = 33, type = 1, item_id = 70660,
                         bind = 0, num = 1, odds = 4, is_cast = 1, lev_min = 1,
                         lev_max = 200, sex = 1, classes = 0, min_lev_break = 0,
                         max_lev_break = 1};
get_data(34) ->
    #camp_doll_item_data{id = 34, type = 1, item_id = 29101,
                         bind = 0, num = 1, odds = 10, is_cast = 0, lev_min = 1,
                         lev_max = 200, sex = 2, classes = 0, min_lev_break = 0,
                         max_lev_break = 1};
get_data(35) ->
    #camp_doll_item_data{id = 35, type = 1, item_id = 20616,
                         bind = 0, num = 1, odds = 12, is_cast = 0, lev_min = 1,
                         lev_max = 200, sex = 2, classes = 0, min_lev_break = 0,
                         max_lev_break = 1};
get_data(36) ->
    #camp_doll_item_data{id = 36, type = 1, item_id = 20075,
                         bind = 0, num = 1, odds = 20, is_cast = 0, lev_min = 1,
                         lev_max = 200, sex = 2, classes = 0, min_lev_break = 0,
                         max_lev_break = 1};
get_data(37) ->
    #camp_doll_item_data{id = 37, type = 1, item_id = 20076,
                         bind = 0, num = 1, odds = 15, is_cast = 1, lev_min = 1,
                         lev_max = 200, sex = 2, classes = 0, min_lev_break = 0,
                         max_lev_break = 1};
get_data(38) ->
    #camp_doll_item_data{id = 38, type = 1, item_id = 23740,
                         bind = 0, num = 1, odds = 80, is_cast = 1, lev_min = 1,
                         lev_max = 200, sex = 2, classes = 0, min_lev_break = 0,
                         max_lev_break = 1};
get_data(39) ->
    #camp_doll_item_data{id = 39, type = 1, item_id = 22445,
                         bind = 0, num = 1, odds = 80, is_cast = 1, lev_min = 1,
                         lev_max = 200, sex = 2, classes = 0, min_lev_break = 0,
                         max_lev_break = 1};
get_data(40) ->
    #camp_doll_item_data{id = 40, type = 1, item_id = 20014,
                         bind = 0, num = 1, odds = 20, is_cast = 1, lev_min = 1,
                         lev_max = 200, sex = 2, classes = 0, min_lev_break = 0,
                         max_lev_break = 1};
get_data(41) ->
    #camp_doll_item_data{id = 41, type = 1, item_id = 70673,
                         bind = 0, num = 1, odds = 130, is_cast = 0,
                         lev_min = 1, lev_max = 200, sex = 2, classes = 0,
                         min_lev_break = 0, max_lev_break = 1};
get_data(42) ->
    #camp_doll_item_data{id = 42, type = 1, item_id = 20087,
                         bind = 0, num = 1, odds = 60, is_cast = 0, lev_min = 1,
                         lev_max = 200, sex = 2, classes = 0, min_lev_break = 0,
                         max_lev_break = 1};
get_data(55) ->
    #camp_doll_item_data{id = 55, type = 1, item_id = 20046,
                         bind = 0, num = 1, odds = 75, is_cast = 0, lev_min = 1,
                         lev_max = 200, sex = 2, classes = 0, min_lev_break = 0,
                         max_lev_break = 1};
get_data(56) ->
    #camp_doll_item_data{id = 56, type = 1, item_id = 20002,
                         bind = 0, num = 1, odds = 70, is_cast = 0, lev_min = 1,
                         lev_max = 200, sex = 2, classes = 0, min_lev_break = 0,
                         max_lev_break = 1};
get_data(43) ->
    #camp_doll_item_data{id = 43, type = 1, item_id = 20000,
                         bind = 0, num = 1, odds = 80, is_cast = 0, lev_min = 1,
                         lev_max = 200, sex = 2, classes = 0, min_lev_break = 0,
                         max_lev_break = 1};
get_data(44) ->
    #camp_doll_item_data{id = 44, type = 1, item_id = 20006,
                         bind = 0, num = 20, odds = 80, is_cast = 0,
                         lev_min = 1, lev_max = 200, sex = 2, classes = 0,
                         min_lev_break = 0, max_lev_break = 1};
get_data(45) ->
    #camp_doll_item_data{id = 45, type = 1, item_id = 22595,
                         bind = 0, num = 1, odds = 52, is_cast = 0, lev_min = 1,
                         lev_max = 200, sex = 2, classes = 0, min_lev_break = 0,
                         max_lev_break = 1};
get_data(46) ->
    #camp_doll_item_data{id = 46, type = 1, item_id = 21322,
                         bind = 0, num = 1, odds = 25, is_cast = 0, lev_min = 1,
                         lev_max = 200, sex = 2, classes = 0, min_lev_break = 0,
                         max_lev_break = 1};
get_data(47) ->
    #camp_doll_item_data{id = 47, type = 1, item_id = 22396,
                         bind = 0, num = 1, odds = 80, is_cast = 0, lev_min = 1,
                         lev_max = 79, sex = 2, classes = 0, min_lev_break = 0,
                         max_lev_break = 1};
get_data(48) ->
    #camp_doll_item_data{id = 48, type = 1, item_id = 21098,
                         bind = 0, num = 3, odds = 80, is_cast = 0,
                         lev_min = 80, lev_max = 200, sex = 2, classes = 0,
                         min_lev_break = 0, max_lev_break = 1};
get_data(49) ->
    #camp_doll_item_data{id = 49, type = 1, item_id = 29046,
                         bind = 0, num = 1, odds = 30, is_cast = 0, lev_min = 1,
                         lev_max = 200, sex = 2, classes = 0, min_lev_break = 0,
                         max_lev_break = 1};
get_data(50) ->
    #camp_doll_item_data{id = 50, type = 1, item_id = 20022,
                         bind = 0, num = 1, odds = 65, is_cast = 0, lev_min = 1,
                         lev_max = 79, sex = 2, classes = 0, min_lev_break = 0,
                         max_lev_break = 1};
get_data(51) ->
    #camp_doll_item_data{id = 51, type = 1, item_id = 22307,
                         bind = 0, num = 1, odds = 65, is_cast = 0,
                         lev_min = 80, lev_max = 200, sex = 2, classes = 0,
                         min_lev_break = 0, max_lev_break = 1};
get_data(_) -> false.

get_odds(Lucky) when Lucky >= 0 andalso Lucky =< 0 -> 0;
get_odds(Lucky) when Lucky >= 1 andalso Lucky =< 34 ->
    50;
get_odds(Lucky) when Lucky >= 35 andalso Lucky =< 69 ->
    200;
get_odds(Lucky) when Lucky >= 70 andalso Lucky =< 99 ->
    500;
get_odds(Lucky)
    when Lucky >= 100 andalso Lucky =< 999 ->
    1000;
get_odds(_) -> false.

get_config() ->
    #{open => 1, time => [{19, 0, 0, 23, 0, 0}],
      broadcast =>
          lang:get("运气爆棚！#role#在<color='#13FC60'>欢乐派对砸蛋</color>中幸"
                   "运的抽到了#item#{face_1,3}"),
      title => lang:get("欢乐派对砸蛋"),
      content =>
          lang:get("感谢您参与了<color=#ffff00>欢乐派对砸蛋</color>活动，以下是您获得的"
                   "奖励请查收！"),
      drop_list => [{90052, 5}], cost_list => [{70652, 1}],
      times_title => lang:get("欢乐金蛋"),
      times_content =>
          lang:get("恭喜您累计抽取到一定次数，以下将相应奖励发放给您，请查收~")}.

get_lucky() -> [{5, 600}, {6, 300}, {10, 100}].

get_reward(10) -> [{20616, 0, 1, 0}, {23752, 0, 1, 0}];
get_reward(30) -> [{29101, 0, 2, 0}, {20053, 0, 1, 0}];
get_reward(60) -> [{20617, 0, 1, 0}, {20076, 0, 1, 0}];
get_reward(100) -> [{22205, 0, 1, 0}, {20014, 0, 1, 0}];
get_reward(150) -> [{20638, 0, 1, 0}, {29314, 0, 1, 0}];
get_reward(250) -> [{22444, 0, 1, 0}, {20755, 0, 1, 0}];
get_reward(_) -> [].

get_limit() -> [10, 30, 60, 100, 150, 250].

