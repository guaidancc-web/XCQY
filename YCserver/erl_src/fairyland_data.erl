-file("src/data/fairyland_data.erl", 1).

-module(fairyland_data).

-export([list/0,
         get/1,
         get_box_reward/1,
         get_boss_floor/0,
         get_boss_reward/1,
         get_boss_box/1,
         get_sprint_reward/0,
         get_waiting_exp/1,
         get_key_loot/1]).

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

-file("src/data/fairyland_data.erl", 22).

list() ->
    [0, 1, 10, 11, 12, 2, 3, 4, 5, 6, 7, 8, 9, 99].

get(0) ->
    #{id => 0, map => 70012, neutral_unit => [79653],
      neutral_location => [{2043, 1513}]};
get(1) ->
    #{id => 1, map => 70005, neutral_unit => [79650, 79651],
      neutral_location =>
          [{500, 800}, {2750, 315}, {3333, 1600}, {1000, 1600}],
      enemy_unit =>
          [{79600, 100}, {79605, 100}, {79610, 0}, {79624, 0}],
      enemy_num => 35,
      box_unit =>
          [{79640, 100}, {79641, 100}, {79642, 0}, {79643, 0}],
      box_num => 0};
get(2) ->
    #{id => 2, map => 70002, neutral_unit => [79650, 79651],
      neutral_location =>
          [{1600, 500}, {300, 1600}, {1300, 1600}],
      enemy_unit =>
          [{79600, 100}, {79605, 100}, {79610, 0}, {79624, 0}],
      enemy_num => 35,
      box_unit =>
          [{79640, 100}, {79641, 100}, {79642, 0}, {79643, 0}],
      box_num => 0};
get(3) ->
    #{id => 3, map => 70003, neutral_unit => [79650, 79651],
      neutral_location =>
          [{500, 652}, {1620, 564}, {1650, 1460}],
      enemy_unit =>
          [{79600, 100}, {79605, 100}, {79610, 0}, {79624, 0}],
      enemy_num => 35,
      box_unit =>
          [{79640, 100}, {79641, 100}, {79642, 0}, {79643, 0}],
      box_num => 0};
get(4) ->
    #{id => 4, map => 70004, neutral_unit => [79650, 79651],
      neutral_location =>
          [{1500, 400}, {300, 650}, {640, 2100}, {2100, 2100}],
      enemy_unit =>
          [{79600, 100}, {79605, 100}, {79610, 50}, {79624, 0}],
      enemy_num => 35,
      box_unit =>
          [{79640, 100}, {79641, 100}, {79642, 0}, {79643, 0}],
      box_num => 0};
get(5) ->
    #{id => 5, map => 70001, neutral_unit => [79650, 79651],
      neutral_location =>
          [{1500, 370}, {580, 733}, {400, 1746}],
      enemy_unit =>
          [{79600, 100}, {79605, 100}, {79610, 50}, {79624, 0}],
      enemy_num => 35,
      box_unit =>
          [{79640, 100}, {79641, 100}, {79642, 50}, {79643, 0}],
      box_num => 0};
get(6) ->
    #{id => 6, map => 70006,
      neutral_unit => [79650, 79651, 79652],
      neutral_location =>
          [{339, 1621}, {1300, 1853}, {1600, 500}, {385, 369}],
      enemy_unit =>
          [{79600, 100}, {79605, 100}, {79610, 50}, {79624, 0}],
      enemy_num => 35,
      box_unit =>
          [{79640, 100}, {79641, 100}, {79642, 50}, {79643, 0}],
      box_num => 0};
get(7) ->
    #{id => 7, map => 70007,
      neutral_unit => [79650, 79651, 79652],
      neutral_location =>
          [{1661, 3064}, {1058, 2742}, {200, 2411}, {700, 966}],
      enemy_unit =>
          [{79600, 100}, {79605, 100}, {79610, 80}, {79624, 0}],
      enemy_num => 35,
      box_unit =>
          [{79640, 100}, {79641, 100}, {79642, 50}, {79643, 0}],
      box_num => 0};
get(8) ->
    #{id => 8, map => 70008,
      neutral_unit => [79650, 79651, 79652],
      neutral_location =>
          [{950, 600}, {2130, 526}, {2500, 2000}, {700, 1800}],
      enemy_unit =>
          [{79600, 80}, {79605, 100}, {79610, 80}, {79624, 0}],
      enemy_num => 35,
      box_unit =>
          [{79640, 100}, {79641, 90}, {79642, 70}, {79643, 20}],
      box_num => 0};
get(9) ->
    #{id => 9, map => 70009,
      neutral_unit => [79650, 79651, 79652],
      neutral_location =>
          [{700, 350}, {2600, 500}, {630, 2300}, {2900, 2300}],
      enemy_unit =>
          [{79600, 80}, {79605, 100}, {79610, 80}, {79624, 0}],
      enemy_num => 35,
      box_unit =>
          [{79640, 100}, {79641, 90}, {79642, 70}, {79643, 20}],
      box_num => 0};
get(10) ->
    #{id => 10, map => 70010,
      neutral_unit => [79650, 79651, 79652],
      neutral_location =>
          [{600, 1800},
           {1780, 1780},
           {2800, 600},
           {1850, 525},
           {1800, 1060}],
      enemy_unit =>
          [{79600, 80}, {79605, 100}, {79610, 100}, {79624, 30}],
      enemy_num => 35,
      box_unit =>
          [{79640, 100}, {79641, 100}, {79642, 70}, {79643, 20}],
      box_num => 0};
get(11) ->
    #{id => 11, map => 70014,
      neutral_unit => [79650, 79651, 79652],
      neutral_location =>
          [{227, 967},
           {1600, 600},
           {460, 439},
           {487, 1660},
           {1689, 1705}],
      enemy_unit =>
          [{79600, 0}, {79605, 100}, {79610, 100}, {79624, 30}],
      enemy_num => 40,
      box_unit =>
          [{79640, 60}, {79641, 110}, {79642, 80}, {79643, 20}],
      box_num => 0};
get(12) ->
    #{id => 12, map => 70011,
      neutral_unit => [79650, 79651, 79652],
      neutral_location =>
          [{3800, 1750}, {1500, 2950}, {4000, 2800}],
      enemy_unit =>
          [{79600, 0}, {79605, 100}, {79610, 100}, {79624, 30}],
      enemy_num => 50,
      box_unit =>
          [{79640, 60}, {79641, 110}, {79642, 80}, {79643, 20}],
      box_num => 0};
get(99) ->
    #{id => 99, map => 10001, neutral_unit => [79654],
      neutral_location => [{3031, 2313}]};
get(_) -> false.

get_box_reward(79640) ->
    [#{box_id => 79640, item_id => 20006, item_num => 5,
       item_name => lang:get("星辰精华"), item_weight => 60,
       show_odds => 10, sex => 2, classes => 0, lev_min => 20,
       lev_max => 200, announce => 0, key_type => 1, id => 1},
     #{box_id => 79640, item_id => 20025, item_num => 1,
       item_name => lang:get("冒险笔记"), item_weight => 50,
       show_odds => 10, sex => 2, classes => 0, lev_min => 20,
       lev_max => 200, announce => 0, key_type => 1, id => 2},
     #{box_id => 79640, item_id => 20000, item_num => 1,
       item_name => lang:get("一袋银币"), item_weight => 70,
       show_odds => 10, sex => 2, classes => 0, lev_min => 20,
       lev_max => 200, announce => 0, key_type => 1, id => 3},
     #{box_id => 79640, item_id => 20005, item_num => 1,
       item_name => lang:get("人物经验心得"), item_weight => 50,
       show_odds => 10, sex => 2, classes => 0, lev_min => 20,
       lev_max => 200, announce => 0, key_type => 1, id => 4},
     #{box_id => 79640, item_id => 21220, item_num => 1,
       item_name => lang:get("秘宝锤"), item_weight => 80,
       show_odds => 10, sex => 2, classes => 0, lev_min => 20,
       lev_max => 200, announce => 0, key_type => 1, id => 5},
     #{box_id => 79640, item_id => 20074, item_num => 1,
       item_name => lang:get("星辰重置丹"), item_weight => 50,
       show_odds => 10, sex => 2, classes => 0, lev_min => 20,
       lev_max => 200, announce => 0, key_type => 1, id => 6},
     #{box_id => 79640, item_id => 20034, item_num => 1,
       item_name => lang:get("宝石包"), item_weight => 80,
       show_odds => 10, sex => 2, classes => 0, lev_min => 20,
       lev_max => 200, announce => 0, key_type => 1, id => 7},
     #{box_id => 79640, item_id => 20615, item_num => 1,
       item_name => lang:get("星辰护符"), item_weight => 20,
       show_odds => 10, sex => 2, classes => 0, lev_min => 20,
       lev_max => 200, announce => 0, key_type => 1, id => 8},
     #{box_id => 79640, item_id => 20013, item_num => 1,
       item_name => lang:get("魔兽要诀"), item_weight => 50,
       show_odds => 10, sex => 2, classes => 0, lev_min => 20,
       lev_max => 200, announce => 0, key_type => 1, id => 9},
     #{box_id => 79640, item_id => 20087, item_num => 1,
       item_name => lang:get("四宝"), item_weight => 120,
       show_odds => 10, sex => 2, classes => 0, lev_min => 20,
       lev_max => 200, announce => 0, key_type => 1, id => 10},
     #{box_id => 79640, item_id => 20088, item_num => 1,
       item_name => lang:get("宠物符石"), item_weight => 80,
       show_odds => 10, sex => 2, classes => 0, lev_min => 20,
       lev_max => 200, announce => 0, key_type => 1, id => 11},
     #{box_id => 79640, item_id => 20350, item_num => 1,
       item_name => lang:get("40装备魂"), item_weight => 30,
       show_odds => 10, sex => 2, classes => 0, lev_min => 20,
       lev_max => 200, announce => 0, key_type => 1, id => 12},
     #{box_id => 79640, item_id => 20045, item_num => 1,
       item_name => lang:get("月光绒"), item_weight => 60,
       show_odds => 10, sex => 2, classes => 0, lev_min => 20,
       lev_max => 200, announce => 0, key_type => 1, id => 13},
     #{box_id => 79640, item_id => 20004, item_num => 1,
       item_name => lang:get("宠物经验心得"), item_weight => 27,
       show_odds => 10, sex => 2, classes => 0, lev_min => 20,
       lev_max => 200, announce => 0, key_type => 1, id => 14},
     #{box_id => 79640, item_id => 90000, item_num => 15000,
       item_name => lang:get("银币"), item_weight => 100,
       show_odds => 10, sex => 2, classes => 0, lev_min => 20,
       lev_max => 200, announce => 0, key_type => 1, id => 15},
     #{box_id => 79640, item_id => 20020, item_num => 1,
       item_name => lang:get("强化石"), item_weight => 60,
       show_odds => 10, sex => 2, classes => 0, lev_min => 20,
       lev_max => 200, announce => 0, key_type => 1, id => 16},
     #{box_id => 79640, item_id => 20351, item_num => 1,
       item_name => lang:get("50装备魂"), item_weight => 10,
       show_odds => 10, sex => 2, classes => 0, lev_min => 20,
       lev_max => 200, announce => 0, key_type => 1,
       id => 200},
     #{box_id => 79640, item_id => 20352, item_num => 1,
       item_name => lang:get("60装备魂"), item_weight => 3,
       show_odds => 10, sex => 2, classes => 0, lev_min => 20,
       lev_max => 200, announce => 0, key_type => 1,
       id => 201}];
get_box_reward(79641) ->
    [#{box_id => 79641, item_id => 20006, item_num => 5,
       item_name => lang:get("星辰精华"), item_weight => 50,
       show_odds => 10, sex => 2, classes => 0, lev_min => 20,
       lev_max => 200, announce => 0, key_type => 2, id => 17},
     #{box_id => 79641, item_id => 20025, item_num => 1,
       item_name => lang:get("冒险笔记"), item_weight => 60,
       show_odds => 10, sex => 2, classes => 0, lev_min => 20,
       lev_max => 200, announce => 0, key_type => 2, id => 18},
     #{box_id => 79641, item_id => 20000, item_num => 1,
       item_name => lang:get("一袋银币"), item_weight => 50,
       show_odds => 10, sex => 2, classes => 0, lev_min => 20,
       lev_max => 200, announce => 0, key_type => 2, id => 19},
     #{box_id => 79641, item_id => 20005, item_num => 1,
       item_name => lang:get("人物经验心得"), item_weight => 30,
       show_odds => 10, sex => 2, classes => 0, lev_min => 20,
       lev_max => 200, announce => 0, key_type => 2, id => 20},
     #{box_id => 79641, item_id => 21220, item_num => 1,
       item_name => lang:get("秘宝锤"), item_weight => 50,
       show_odds => 10, sex => 2, classes => 0, lev_min => 20,
       lev_max => 200, announce => 0, key_type => 2, id => 21},
     #{box_id => 79641, item_id => 20074, item_num => 1,
       item_name => lang:get("星辰重置丹"), item_weight => 45,
       show_odds => 10, sex => 2, classes => 0, lev_min => 20,
       lev_max => 200, announce => 0, key_type => 2, id => 22},
     #{box_id => 79641, item_id => 20075, item_num => 1,
       item_name => lang:get("月亮重置丹"), item_weight => 10,
       show_odds => 10, sex => 2, classes => 0, lev_min => 20,
       lev_max => 200, announce => 1, key_type => 2, id => 23},
     #{box_id => 79641, item_id => 20034, item_num => 1,
       item_name => lang:get("宝石包"), item_weight => 40,
       show_odds => 10, sex => 2, classes => 0, lev_min => 20,
       lev_max => 200, announce => 0, key_type => 2, id => 24},
     #{box_id => 79641, item_id => 20615, item_num => 1,
       item_name => lang:get("星辰护符"), item_weight => 30,
       show_odds => 10, sex => 2, classes => 0, lev_min => 20,
       lev_max => 200, announce => 0, key_type => 2, id => 25},
     #{box_id => 79641, item_id => 20616, item_num => 1,
       item_name => lang:get("月亮护符"), item_weight => 5,
       show_odds => 10, sex => 2, classes => 0, lev_min => 20,
       lev_max => 200, announce => 0, key_type => 2, id => 26},
     #{box_id => 79641, item_id => 20013, item_num => 1,
       item_name => lang:get("魔兽要诀"), item_weight => 50,
       show_odds => 10, sex => 2, classes => 0, lev_min => 20,
       lev_max => 200, announce => 0, key_type => 2, id => 27},
     #{box_id => 79641, item_id => 20087, item_num => 1,
       item_name => lang:get("四宝"), item_weight => 160,
       show_odds => 10, sex => 2, classes => 0, lev_min => 20,
       lev_max => 200, announce => 0, key_type => 2, id => 28},
     #{box_id => 79641, item_id => 21100, item_num => 1,
       item_name => lang:get("翅膀灵羽"), item_weight => 30,
       show_odds => 10, sex => 2, classes => 0, lev_min => 20,
       lev_max => 200, announce => 0, key_type => 2, id => 29},
     #{box_id => 79641, item_id => 20088, item_num => 1,
       item_name => lang:get("宠物符石"), item_weight => 30,
       show_odds => 10, sex => 2, classes => 0, lev_min => 20,
       lev_max => 200, announce => 0, key_type => 2, id => 30},
     #{box_id => 79641, item_id => 20031, item_num => 1,
       item_name => lang:get("蝴蝶花"), item_weight => 2,
       show_odds => 10, sex => 2, classes => 0, lev_min => 20,
       lev_max => 200, announce => 0, key_type => 2, id => 31},
     #{box_id => 79641, item_id => 20353, item_num => 1,
       item_name => lang:get("70装备魂"), item_weight => 50,
       show_odds => 10, sex => 2, classes => 0, lev_min => 65,
       lev_max => 200, announce => 1, key_type => 2, id => 32},
     #{box_id => 79641, item_id => 20045, item_num => 1,
       item_name => lang:get("月光绒"), item_weight => 50,
       show_odds => 10, sex => 2, classes => 0, lev_min => 20,
       lev_max => 200, announce => 0, key_type => 2, id => 33},
     #{box_id => 79641, item_id => 20046, item_num => 1,
       item_name => lang:get("彩虹果"), item_weight => 30,
       show_odds => 10, sex => 2, classes => 0, lev_min => 20,
       lev_max => 200, announce => 0, key_type => 2, id => 34},
     #{box_id => 79641, item_id => 20021, item_num => 1,
       item_name => lang:get("幸运石"), item_weight => 20,
       show_odds => 10, sex => 2, classes => 0, lev_min => 20,
       lev_max => 200, announce => 0, key_type => 2, id => 35},
     #{box_id => 79641, item_id => 20004, item_num => 2,
       item_name => lang:get("宠物经验心得"), item_weight => 30,
       show_odds => 10, sex => 2, classes => 0, lev_min => 20,
       lev_max => 200, announce => 0, key_type => 2, id => 36},
     #{box_id => 79641, item_id => 90000, item_num => 25000,
       item_name => lang:get("银币"), item_weight => 50,
       show_odds => 10, sex => 2, classes => 0, lev_min => 20,
       lev_max => 200, announce => 1, key_type => 2, id => 37},
     #{box_id => 79641, item_id => 20020, item_num => 2,
       item_name => lang:get("强化石"), item_weight => 40,
       show_odds => 10, sex => 2, classes => 0, lev_min => 20,
       lev_max => 200, announce => 0, key_type => 2, id => 38},
     #{box_id => 79641, item_id => 20039, item_num => 1,
       item_name => lang:get("灵犀"), item_weight => 33,
       show_odds => 10, sex => 2, classes => 0, lev_min => 20,
       lev_max => 200, announce => 0, key_type => 2, id => 39},
     #{box_id => 79641, item_id => 20354, item_num => 1,
       item_name => lang:get("80装备魂"), item_weight => 30,
       show_odds => 10, sex => 2, classes => 0, lev_min => 75,
       lev_max => 200, announce => 1, key_type => 2,
       id => 300},
     #{box_id => 79641, item_id => 20355, item_num => 1,
       item_name => lang:get("90装备魂"), item_weight => 25,
       show_odds => 10, sex => 2, classes => 0, lev_min => 85,
       lev_max => 200, announce => 1, key_type => 2,
       id => 301}];
get_box_reward(79642) ->
    [#{box_id => 79642, item_id => 20006, item_num => 5,
       item_name => lang:get("星辰精华"), item_weight => 500,
       show_odds => 10, sex => 2, classes => 0, lev_min => 20,
       lev_max => 200, announce => 0, key_type => 3, id => 40},
     #{box_id => 79642, item_id => 20025, item_num => 1,
       item_name => lang:get("冒险笔记"), item_weight => 400,
       show_odds => 10, sex => 2, classes => 0, lev_min => 20,
       lev_max => 200, announce => 0, key_type => 3, id => 41},
     #{box_id => 79642, item_id => 20000, item_num => 1,
       item_name => lang:get("一袋银币"), item_weight => 500,
       show_odds => 10, sex => 2, classes => 0, lev_min => 20,
       lev_max => 200, announce => 0, key_type => 3, id => 42},
     #{box_id => 79642, item_id => 20005, item_num => 1,
       item_name => lang:get("人物经验心得"), item_weight => 200,
       show_odds => 10, sex => 2, classes => 0, lev_min => 20,
       lev_max => 200, announce => 0, key_type => 3, id => 43},
     #{box_id => 79642, item_id => 21220, item_num => 1,
       item_name => lang:get("秘宝锤"), item_weight => 500,
       show_odds => 10, sex => 2, classes => 0, lev_min => 20,
       lev_max => 200, announce => 0, key_type => 3, id => 44},
     #{box_id => 79642, item_id => 20074, item_num => 1,
       item_name => lang:get("星辰重置丹"), item_weight => 400,
       show_odds => 10, sex => 2, classes => 0, lev_min => 20,
       lev_max => 200, announce => 0, key_type => 3, id => 45},
     #{box_id => 79642, item_id => 20075, item_num => 1,
       item_name => lang:get("月亮重置丹"), item_weight => 180,
       show_odds => 10, sex => 2, classes => 0, lev_min => 20,
       lev_max => 200, announce => 1, key_type => 3, id => 46},
     #{box_id => 79642, item_id => 20075, item_num => 1,
       item_name => lang:get("太阳重置丹"), item_weight => 20,
       show_odds => 10, sex => 2, classes => 0, lev_min => 20,
       lev_max => 200, announce => 1, key_type => 3, id => 47},
     #{box_id => 79642, item_id => 20034, item_num => 1,
       item_name => lang:get("宝石包"), item_weight => 400,
       show_odds => 10, sex => 2, classes => 0, lev_min => 20,
       lev_max => 200, announce => 0, key_type => 3, id => 48},
     #{box_id => 79642, item_id => 20616, item_num => 1,
       item_name => lang:get("月亮护符"), item_weight => 200,
       show_odds => 10, sex => 2, classes => 0, lev_min => 20,
       lev_max => 200, announce => 0, key_type => 3, id => 49},
     #{box_id => 79642, item_id => 20617, item_num => 1,
       item_name => lang:get("太阳护符"), item_weight => 60,
       show_odds => 10, sex => 2, classes => 0, lev_min => 20,
       lev_max => 200, announce => 1, key_type => 3, id => 50},
     #{box_id => 79642, item_id => 20013, item_num => 1,
       item_name => lang:get("魔兽要诀"), item_weight => 300,
       show_odds => 10, sex => 2, classes => 0, lev_min => 20,
       lev_max => 200, announce => 0, key_type => 3, id => 51},
     #{box_id => 79642, item_id => 20014, item_num => 1,
       item_name => lang:get("高级魔兽要诀"), item_weight => 50,
       show_odds => 10, sex => 2, classes => 0, lev_min => 20,
       lev_max => 200, announce => 1, key_type => 3, id => 52},
     #{box_id => 79642, item_id => 20087, item_num => 1,
       item_name => lang:get("四宝"), item_weight => 2000,
       show_odds => 10, sex => 2, classes => 0, lev_min => 20,
       lev_max => 200, announce => 1, key_type => 3, id => 53},
     #{box_id => 79642, item_id => 21100, item_num => 1,
       item_name => lang:get("翅膀灵羽"), item_weight => 300,
       show_odds => 10, sex => 2, classes => 0, lev_min => 20,
       lev_max => 200, announce => 1, key_type => 3, id => 54},
     #{box_id => 79642, item_id => 20038, item_num => 1,
       item_name => lang:get("神兽之魂"), item_weight => 30,
       show_odds => 10, sex => 2, classes => 0, lev_min => 20,
       lev_max => 200, announce => 1, key_type => 3, id => 55},
     #{box_id => 79642, item_id => 20095, item_num => 1,
       item_name => lang:get("珍兽之魂"), item_weight => 60,
       show_odds => 10, sex => 2, classes => 0, lev_min => 20,
       lev_max => 200, announce => 1, key_type => 3, id => 56},
     #{box_id => 79642, item_id => 20031, item_num => 1,
       item_name => lang:get("蝴蝶花"), item_weight => 50,
       show_odds => 10, sex => 2, classes => 0, lev_min => 20,
       lev_max => 200, announce => 1, key_type => 3, id => 57},
     #{box_id => 79642, item_id => 20354, item_num => 1,
       item_name => lang:get("80装备魂"), item_weight => 500,
       show_odds => 10, sex => 2, classes => 0, lev_min => 75,
       lev_max => 200, announce => 1, key_type => 3, id => 58},
     #{box_id => 79642, item_id => 20046, item_num => 1,
       item_name => lang:get("彩虹果"), item_weight => 300,
       show_odds => 10, sex => 2, classes => 0, lev_min => 20,
       lev_max => 200, announce => 1, key_type => 3, id => 59},
     #{box_id => 79642, item_id => 20020, item_num => 3,
       item_name => lang:get("幸运石"), item_weight => 500,
       show_odds => 10, sex => 2, classes => 0, lev_min => 20,
       lev_max => 200, announce => 0, key_type => 3, id => 60},
     #{box_id => 79642, item_id => 20022, item_num => 1,
       item_name => lang:get("优秀幸运石"), item_weight => 260,
       show_odds => 10, sex => 2, classes => 0, lev_min => 20,
       lev_max => 200, announce => 1, key_type => 3, id => 61},
     #{box_id => 79642, item_id => 20004, item_num => 1,
       item_name => lang:get("宠物经验心得"), item_weight => 300,
       show_odds => 10, sex => 2, classes => 0, lev_min => 20,
       lev_max => 99, announce => 0, key_type => 3, id => 62},
     #{box_id => 79642, item_id => 90000, item_num => 40000,
       item_name => lang:get("银币"), item_weight => 500,
       show_odds => 10, sex => 2, classes => 0, lev_min => 20,
       lev_max => 99, announce => 0, key_type => 3, id => 63},
     #{box_id => 79642, item_id => 20039, item_num => 1,
       item_name => lang:get("灵犀"), item_weight => 610,
       show_odds => 10, sex => 2, classes => 0, lev_min => 20,
       lev_max => 99, announce => 0, key_type => 3, id => 64},
     #{box_id => 79642, item_id => 21136, item_num => 1,
       item_name => lang:get("灵羽卷轴"), item_weight => 200,
       show_odds => 10, sex => 2, classes => 0, lev_min => 20,
       lev_max => 79, announce => 1, key_type => 3, id => 101},
     #{box_id => 79642, item_id => 21137, item_num => 1,
       item_name => lang:get("神羽卷轴"), item_weight => 200,
       show_odds => 10, sex => 2, classes => 0, lev_min => 80,
       lev_max => 200, announce => 1, key_type => 3,
       id => 102},
     #{box_id => 79642, item_id => 20355, item_num => 1,
       item_name => lang:get("90装备魂"), item_weight => 400,
       show_odds => 10, sex => 2, classes => 0, lev_min => 85,
       lev_max => 200, announce => 1, key_type => 3,
       id => 103},
     #{box_id => 79642, item_id => 20356, item_num => 1,
       item_name => lang:get("100装备魂"), item_weight => 280,
       show_odds => 10, sex => 2, classes => 0, lev_min => 95,
       lev_max => 200, announce => 1, key_type => 3,
       id => 104}];
get_box_reward(79643) ->
    [#{box_id => 79643, item_id => 20046, item_num => 1,
       item_name => lang:get("彩虹果"), item_weight => 1678,
       show_odds => 10, sex => 2, classes => 0, lev_min => 20,
       lev_max => 200, announce => 1, key_type => 3, id => 65},
     #{box_id => 79643, item_id => 20087, item_num => 1,
       item_name => lang:get("四宝"), item_weight => 2000,
       show_odds => 10, sex => 2, classes => 0, lev_min => 20,
       lev_max => 200, announce => 1, key_type => 3, id => 66},
     #{box_id => 79643, item_id => 20000, item_num => 1,
       item_name => lang:get("一袋银币"), item_weight => 940,
       show_odds => 10, sex => 2, classes => 0, lev_min => 20,
       lev_max => 200, announce => 0, key_type => 3, id => 67},
     #{box_id => 79643, item_id => 20075, item_num => 1,
       item_name => lang:get("月亮重置丹"), item_weight => 600,
       show_odds => 10, sex => 2, classes => 0, lev_min => 20,
       lev_max => 200, announce => 1, key_type => 3, id => 68},
     #{box_id => 79643, item_id => 20075, item_num => 1,
       item_name => lang:get("太阳重置丹"), item_weight => 200,
       show_odds => 10, sex => 2, classes => 0, lev_min => 20,
       lev_max => 200, announce => 1, key_type => 3, id => 69},
     #{box_id => 79643, item_id => 20616, item_num => 1,
       item_name => lang:get("月亮护符"), item_weight => 200,
       show_odds => 10, sex => 2, classes => 0, lev_min => 20,
       lev_max => 200, announce => 0, key_type => 3, id => 70},
     #{box_id => 79643, item_id => 20617, item_num => 1,
       item_name => lang:get("太阳护符"), item_weight => 100,
       show_odds => 10, sex => 2, classes => 0, lev_min => 20,
       lev_max => 200, announce => 1, key_type => 3, id => 71},
     #{box_id => 79643, item_id => 20014, item_num => 1,
       item_name => lang:get("高级魔兽要诀"), item_weight => 200,
       show_odds => 10, sex => 2, classes => 0, lev_min => 20,
       lev_max => 200, announce => 1, key_type => 3, id => 72},
     #{box_id => 79643, item_id => 90000, item_num => 60000,
       item_name => lang:get("银币"), item_weight => 1600,
       show_odds => 10, sex => 2, classes => 0, lev_min => 20,
       lev_max => 200, announce => 0, key_type => 3, id => 73},
     #{box_id => 79643, item_id => 21101, item_num => 1,
       item_name => lang:get("精灵之羽"), item_weight => 100,
       show_odds => 10, sex => 2, classes => 0, lev_min => 20,
       lev_max => 200, announce => 1, key_type => 3, id => 74},
     #{box_id => 79643, item_id => 20038, item_num => 1,
       item_name => lang:get("神兽之魂"), item_weight => 60,
       show_odds => 10, sex => 2, classes => 0, lev_min => 20,
       lev_max => 200, announce => 1, key_type => 3, id => 75},
     #{box_id => 79643, item_id => 20095, item_num => 1,
       item_name => lang:get("珍兽之魂"), item_weight => 100,
       show_odds => 10, sex => 2, classes => 0, lev_min => 20,
       lev_max => 200, announce => 1, key_type => 3, id => 76},
     #{box_id => 79643, item_id => 20355, item_num => 1,
       item_name => lang:get("90装备魂"), item_weight => 100,
       show_odds => 10, sex => 2, classes => 0, lev_min => 85,
       lev_max => 200, announce => 1, key_type => 3, id => 77},
     #{box_id => 79643, item_id => 20356, item_num => 1,
       item_name => lang:get("100装备魂"), item_weight => 70,
       show_odds => 10, sex => 2, classes => 0, lev_min => 95,
       lev_max => 200, announce => 1, key_type => 3, id => 78},
     #{box_id => 79643, item_id => 20022, item_num => 1,
       item_name => lang:get("优秀幸运石"), item_weight => 420,
       show_odds => 10, sex => 2, classes => 0, lev_min => 20,
       lev_max => 200, announce => 1, key_type => 3, id => 79},
     #{box_id => 79643, item_id => 29275, item_num => 1,
       item_name => lang:get("竹蜻蜓"), item_weight => 80,
       show_odds => 10, sex => 2, classes => 0, lev_min => 20,
       lev_max => 200, announce => 1, key_type => 3, id => 86},
     #{box_id => 79643, item_id => 1, item_num => 20,
       item_name => lang:get("饱食度-20"), item_weight => 500,
       show_odds => 10, sex => 2, classes => 0, lev_min => 20,
       lev_max => 200, announce => 1, key_type => 3, id => 80},
     #{box_id => 79643, item_id => 3, item_num => 3,
       item_name => lang:get("倒退3层"), item_weight => 500,
       show_odds => 10, sex => 2, classes => 0, lev_min => 20,
       lev_max => 200, announce => 1, key_type => 3, id => 81},
     #{box_id => 79643, item_id => 2, item_num => 3,
       item_name => lang:get("回到第3层"), item_weight => 1,
       show_odds => 10, sex => 2, classes => 0, lev_min => 20,
       lev_max => 200, announce => 1, key_type => 3, id => 82},
     #{box_id => 79643, item_id => 2, item_num => 6,
       item_name => lang:get("回到第6层"), item_weight => 1,
       show_odds => 10, sex => 2, classes => 0, lev_min => 20,
       lev_max => 200, announce => 1, key_type => 3, id => 83},
     #{box_id => 79643, item_id => 20040, item_num => 1,
       item_name => lang:get("二品灵犀"), item_weight => 120,
       show_odds => 10, sex => 2, classes => 0, lev_min => 20,
       lev_max => 200, announce => 1, key_type => 3, id => 84},
     #{box_id => 79643, item_id => 20036, item_num => 1,
       item_name => lang:get("三品灵犀"), item_weight => 80,
       show_odds => 10, sex => 2, classes => 0, lev_min => 20,
       lev_max => 200, announce => 1, key_type => 3, id => 85},
     #{box_id => 79643, item_id => 20291, item_num => 1,
       item_name => lang:get("获得珍兽"), item_weight => 10,
       show_odds => 5, sex => 2, classes => 0, lev_min => 20,
       lev_max => 200, announce => 1, key_type => 3, id => 86},
     #{box_id => 79643, item_id => 22428, item_num => 1,
       item_name => lang:get("彩虹·30天"), item_weight => 200,
       show_odds => 10, sex => 2, classes => 0, lev_min => 20,
       lev_max => 200, announce => 1, key_type => 3, id => 87},
     #{box_id => 79643, item_id => 21136, item_num => 1,
       item_name => lang:get("灵羽卷轴"), item_weight => 500,
       show_odds => 10, sex => 2, classes => 0, lev_min => 20,
       lev_max => 79, announce => 1, key_type => 3, id => 88},
     #{box_id => 79643, item_id => 21137, item_num => 1,
       item_name => lang:get("神羽卷轴"), item_weight => 500,
       show_odds => 10, sex => 2, classes => 0, lev_min => 80,
       lev_max => 200, announce => 1, key_type => 3, id => 89},
     #{box_id => 79643, item_id => 20357, item_num => 1,
       item_name => lang:get("110装备魂"), item_weight => 59,
       show_odds => 10, sex => 2, classes => 0, lev_min => 105,
       lev_max => 200, announce => 1, key_type => 3, id => 90},
     #{box_id => 79643, item_id => 20360, item_num => 1,
       item_name => lang:get("120装备魂"), item_weight => 54,
       show_odds => 10, sex => 2, classes => 0, lev_min => 115,
       lev_max => 200, announce => 1, key_type => 3,
       id => 91}];
get_box_reward(_) -> false.

get_boss_floor() ->
    [{7, 100},
     {8, 100},
     {9, 100},
     {10, 100},
     {11, 100},
     {12, 100}].

get_boss_reward(79619) ->
    [#{unit_id => 79619, item_id => 20006, item_num => 5,
       item_name => lang:get("星辰精华"), item_weight => 140,
       announce => 0},
     #{unit_id => 79619, item_id => 20025, item_num => 1,
       item_name => lang:get("冒险笔记"), item_weight => 115,
       announce => 0},
     #{unit_id => 79619, item_id => 20000, item_num => 1,
       item_name => lang:get("一袋银币"), item_weight => 120,
       announce => 0},
     #{unit_id => 79619, item_id => 20005, item_num => 1,
       item_name => lang:get("人物经验心得"), item_weight => 50,
       announce => 0},
     #{unit_id => 79619, item_id => 20074, item_num => 1,
       item_name => lang:get("星辰重置丹"), item_weight => 60,
       announce => 0},
     #{unit_id => 79619, item_id => 20075, item_num => 1,
       item_name => lang:get("月亮重置丹"), item_weight => 20,
       announce => 1},
     #{unit_id => 79619, item_id => 20034, item_num => 1,
       item_name => lang:get("宝石包"), item_weight => 80,
       announce => 0},
     #{unit_id => 79619, item_id => 20616, item_num => 1,
       item_name => lang:get("月亮护符"), item_weight => 5,
       announce => 1},
     #{unit_id => 79619, item_id => 20617, item_num => 1,
       item_name => lang:get("太阳护符"), item_weight => 1,
       announce => 1},
     #{unit_id => 79619, item_id => 20013, item_num => 1,
       item_name => lang:get("魔兽要诀"), item_weight => 40,
       announce => 0},
     #{unit_id => 79619, item_id => 20087, item_num => 1,
       item_name => lang:get("四宝"), item_weight => 80,
       announce => 1},
     #{unit_id => 79619, item_id => 21100, item_num => 1,
       item_name => lang:get("翅膀灵羽"), item_weight => 5,
       announce => 1},
     #{unit_id => 79619, item_id => 20038, item_num => 1,
       item_name => lang:get("神兽之魂"), item_weight => 1,
       announce => 1},
     #{unit_id => 79619, item_id => 20095, item_num => 1,
       item_name => lang:get("珍兽之魂"), item_weight => 2,
       announce => 1},
     #{unit_id => 79619, item_id => 20046, item_num => 1,
       item_name => lang:get("彩虹果"), item_weight => 10,
       announce => 1},
     #{unit_id => 79619, item_id => 20021, item_num => 1,
       item_name => lang:get("幸运石"), item_weight => 60,
       announce => 0},
     #{unit_id => 79619, item_id => 20088, item_num => 1,
       item_name => lang:get("初级符石"), item_weight => 80,
       announce => 0},
     #{unit_id => 79619, item_id => 20092, item_num => 1,
       item_name => lang:get("阵法"), item_weight => 60,
       announce => 0},
     #{unit_id => 79619, item_id => 20615, item_num => 1,
       item_name => lang:get("星辰护符"), item_weight => 31,
       announce => 1},
     #{unit_id => 79619, item_id => 20039, item_num => 1,
       item_name => lang:get("灵犀"), item_weight => 20,
       announce => 1},
     #{unit_id => 79619, item_id => 22428, item_num => 1,
       item_name => lang:get("彩虹·30天"), item_weight => 20,
       announce => 1}];
get_boss_reward(79630) ->
    [#{unit_id => 79630, item_id => 20006, item_num => 5,
       item_name => lang:get("星辰精华"), item_weight => 140,
       announce => 0},
     #{unit_id => 79630, item_id => 20025, item_num => 1,
       item_name => lang:get("冒险笔记"), item_weight => 115,
       announce => 0},
     #{unit_id => 79630, item_id => 20000, item_num => 1,
       item_name => lang:get("一袋银币"), item_weight => 120,
       announce => 0},
     #{unit_id => 79630, item_id => 20005, item_num => 1,
       item_name => lang:get("人物经验心得"), item_weight => 50,
       announce => 0},
     #{unit_id => 79630, item_id => 20074, item_num => 1,
       item_name => lang:get("星辰重置丹"), item_weight => 60,
       announce => 0},
     #{unit_id => 79630, item_id => 20075, item_num => 1,
       item_name => lang:get("月亮重置丹"), item_weight => 20,
       announce => 1},
     #{unit_id => 79630, item_id => 20034, item_num => 1,
       item_name => lang:get("宝石包"), item_weight => 80,
       announce => 0},
     #{unit_id => 79630, item_id => 20616, item_num => 1,
       item_name => lang:get("月亮护符"), item_weight => 5,
       announce => 1},
     #{unit_id => 79630, item_id => 20617, item_num => 1,
       item_name => lang:get("太阳护符"), item_weight => 1,
       announce => 1},
     #{unit_id => 79630, item_id => 20013, item_num => 1,
       item_name => lang:get("魔兽要诀"), item_weight => 40,
       announce => 0},
     #{unit_id => 79630, item_id => 20087, item_num => 1,
       item_name => lang:get("四宝"), item_weight => 80,
       announce => 1},
     #{unit_id => 79630, item_id => 21100, item_num => 1,
       item_name => lang:get("翅膀灵羽"), item_weight => 5,
       announce => 1},
     #{unit_id => 79630, item_id => 20038, item_num => 1,
       item_name => lang:get("神兽之魂"), item_weight => 1,
       announce => 1},
     #{unit_id => 79630, item_id => 20095, item_num => 1,
       item_name => lang:get("珍兽之魂"), item_weight => 2,
       announce => 1},
     #{unit_id => 79630, item_id => 20046, item_num => 1,
       item_name => lang:get("彩虹果"), item_weight => 10,
       announce => 1},
     #{unit_id => 79630, item_id => 20021, item_num => 1,
       item_name => lang:get("幸运石"), item_weight => 60,
       announce => 0},
     #{unit_id => 79630, item_id => 20088, item_num => 1,
       item_name => lang:get("初级符石"), item_weight => 80,
       announce => 0},
     #{unit_id => 79630, item_id => 20092, item_num => 1,
       item_name => lang:get("阵法"), item_weight => 60,
       announce => 0},
     #{unit_id => 79630, item_id => 20615, item_num => 1,
       item_name => lang:get("星辰护符"), item_weight => 31,
       announce => 1},
     #{unit_id => 79630, item_id => 20039, item_num => 1,
       item_name => lang:get("灵犀"), item_weight => 20,
       announce => 1},
     #{unit_id => 79630, item_id => 22428, item_num => 1,
       item_name => lang:get("彩虹·30天"), item_weight => 20,
       announce => 1}];
get_boss_reward(_) -> false.

get_boss_box(7) ->
    #{id => 7,
      box_unit =>
          [{79640, 80}, {79641, 60}, {79642, 50}, {79643, 30}],
      box_num => 15};
get_boss_box(8) ->
    #{id => 8,
      box_unit =>
          [{79640, 80}, {79641, 60}, {79642, 50}, {79643, 30}],
      box_num => 15};
get_boss_box(9) ->
    #{id => 9,
      box_unit =>
          [{79640, 80}, {79641, 60}, {79642, 50}, {79643, 30}],
      box_num => 15};
get_boss_box(10) ->
    #{id => 10,
      box_unit =>
          [{79640, 80}, {79641, 60}, {79642, 50}, {79643, 30}],
      box_num => 15};
get_boss_box(11) ->
    #{id => 11,
      box_unit =>
          [{79640, 100}, {79641, 40}, {79642, 20}, {79643, 30}],
      box_num => 15};
get_boss_box(12) ->
    #{id => 12,
      box_unit =>
          [{79640, 100}, {79641, 60}, {79642, 30}, {79643, 10}],
      box_num => 15};
get_boss_box(_) -> false.

get_sprint_reward() ->
    [#{item_id => 23011, item_num => 1,
       item_name => lang:get("彩虹冒险冲刺礼包"), item_weight => 1000,
       announce => 1}].

get_waiting_exp(1) ->
    #{lev => 1, exp => 0, pet_exp => 0};
get_waiting_exp(2) ->
    #{lev => 2, exp => 0, pet_exp => 0};
get_waiting_exp(3) ->
    #{lev => 3, exp => 0, pet_exp => 0};
get_waiting_exp(4) ->
    #{lev => 4, exp => 0, pet_exp => 0};
get_waiting_exp(5) ->
    #{lev => 5, exp => 0, pet_exp => 0};
get_waiting_exp(6) ->
    #{lev => 6, exp => 0, pet_exp => 0};
get_waiting_exp(7) ->
    #{lev => 7, exp => 0, pet_exp => 0};
get_waiting_exp(8) ->
    #{lev => 8, exp => 0, pet_exp => 0};
get_waiting_exp(9) ->
    #{lev => 9, exp => 0, pet_exp => 0};
get_waiting_exp(10) ->
    #{lev => 10, exp => 0, pet_exp => 0};
get_waiting_exp(11) ->
    #{lev => 11, exp => 0, pet_exp => 0};
get_waiting_exp(12) ->
    #{lev => 12, exp => 0, pet_exp => 0};
get_waiting_exp(13) ->
    #{lev => 13, exp => 0, pet_exp => 0};
get_waiting_exp(14) ->
    #{lev => 14, exp => 0, pet_exp => 0};
get_waiting_exp(15) ->
    #{lev => 15, exp => 0, pet_exp => 0};
get_waiting_exp(16) ->
    #{lev => 16, exp => 0, pet_exp => 0};
get_waiting_exp(17) ->
    #{lev => 17, exp => 0, pet_exp => 0};
get_waiting_exp(18) ->
    #{lev => 18, exp => 0, pet_exp => 0};
get_waiting_exp(19) ->
    #{lev => 19, exp => 0, pet_exp => 0};
get_waiting_exp(20) ->
    #{lev => 20, exp => 0, pet_exp => 0};
get_waiting_exp(21) ->
    #{lev => 21, exp => 0, pet_exp => 0};
get_waiting_exp(22) ->
    #{lev => 22, exp => 0, pet_exp => 0};
get_waiting_exp(23) ->
    #{lev => 23, exp => 0, pet_exp => 0};
get_waiting_exp(24) ->
    #{lev => 24, exp => 0, pet_exp => 0};
get_waiting_exp(25) ->
    #{lev => 25, exp => 0, pet_exp => 0};
get_waiting_exp(26) ->
    #{lev => 26, exp => 0, pet_exp => 0};
get_waiting_exp(27) ->
    #{lev => 27, exp => 0, pet_exp => 0};
get_waiting_exp(28) ->
    #{lev => 28, exp => 0, pet_exp => 0};
get_waiting_exp(29) ->
    #{lev => 29, exp => 0, pet_exp => 0};
get_waiting_exp(30) ->
    #{lev => 30, exp => 1711, pet_exp => 0};
get_waiting_exp(31) ->
    #{lev => 31, exp => 1814, pet_exp => 0};
get_waiting_exp(32) ->
    #{lev => 32, exp => 1864, pet_exp => 0};
get_waiting_exp(33) ->
    #{lev => 33, exp => 1872, pet_exp => 0};
get_waiting_exp(34) ->
    #{lev => 34, exp => 1937, pet_exp => 0};
get_waiting_exp(35) ->
    #{lev => 35, exp => 1978, pet_exp => 0};
get_waiting_exp(36) ->
    #{lev => 36, exp => 1975, pet_exp => 0};
get_waiting_exp(37) ->
    #{lev => 37, exp => 1997, pet_exp => 0};
get_waiting_exp(38) ->
    #{lev => 38, exp => 2048, pet_exp => 0};
get_waiting_exp(39) ->
    #{lev => 39, exp => 2082, pet_exp => 0};
get_waiting_exp(40) ->
    #{lev => 40, exp => 2116, pet_exp => 0};
get_waiting_exp(41) ->
    #{lev => 41, exp => 2196, pet_exp => 0};
get_waiting_exp(42) ->
    #{lev => 42, exp => 2237, pet_exp => 0};
get_waiting_exp(43) ->
    #{lev => 43, exp => 2268, pet_exp => 0};
get_waiting_exp(44) ->
    #{lev => 44, exp => 2295, pet_exp => 0};
get_waiting_exp(45) ->
    #{lev => 45, exp => 2332, pet_exp => 0};
get_waiting_exp(46) ->
    #{lev => 46, exp => 2355, pet_exp => 0};
get_waiting_exp(47) ->
    #{lev => 47, exp => 2391, pet_exp => 0};
get_waiting_exp(48) ->
    #{lev => 48, exp => 2413, pet_exp => 0};
get_waiting_exp(49) ->
    #{lev => 49, exp => 2454, pet_exp => 0};
get_waiting_exp(50) ->
    #{lev => 50, exp => 2486, pet_exp => 0};
get_waiting_exp(51) ->
    #{lev => 51, exp => 2516, pet_exp => 0};
get_waiting_exp(52) ->
    #{lev => 52, exp => 2546, pet_exp => 0};
get_waiting_exp(53) ->
    #{lev => 53, exp => 2585, pet_exp => 0};
get_waiting_exp(54) ->
    #{lev => 54, exp => 2619, pet_exp => 0};
get_waiting_exp(55) ->
    #{lev => 55, exp => 2649, pet_exp => 0};
get_waiting_exp(56) ->
    #{lev => 56, exp => 2739, pet_exp => 0};
get_waiting_exp(57) ->
    #{lev => 57, exp => 2770, pet_exp => 0};
get_waiting_exp(58) ->
    #{lev => 58, exp => 2810, pet_exp => 0};
get_waiting_exp(59) ->
    #{lev => 59, exp => 2841, pet_exp => 0};
get_waiting_exp(60) ->
    #{lev => 60, exp => 2871, pet_exp => 0};
get_waiting_exp(61) ->
    #{lev => 61, exp => 2967, pet_exp => 0};
get_waiting_exp(62) ->
    #{lev => 62, exp => 3002, pet_exp => 0};
get_waiting_exp(63) ->
    #{lev => 63, exp => 3036, pet_exp => 0};
get_waiting_exp(64) ->
    #{lev => 64, exp => 3066, pet_exp => 0};
get_waiting_exp(65) ->
    #{lev => 65, exp => 3100, pet_exp => 0};
get_waiting_exp(66) ->
    #{lev => 66, exp => 3134, pet_exp => 0};
get_waiting_exp(67) ->
    #{lev => 67, exp => 3170, pet_exp => 0};
get_waiting_exp(68) ->
    #{lev => 68, exp => 3207, pet_exp => 0};
get_waiting_exp(69) ->
    #{lev => 69, exp => 3241, pet_exp => 0};
get_waiting_exp(70) ->
    #{lev => 70, exp => 3271, pet_exp => 0};
get_waiting_exp(71) ->
    #{lev => 71, exp => 3306, pet_exp => 0};
get_waiting_exp(72) ->
    #{lev => 72, exp => 3341, pet_exp => 0};
get_waiting_exp(73) ->
    #{lev => 73, exp => 3377, pet_exp => 0};
get_waiting_exp(74) ->
    #{lev => 74, exp => 3412, pet_exp => 0};
get_waiting_exp(75) ->
    #{lev => 75, exp => 3447, pet_exp => 0};
get_waiting_exp(76) ->
    #{lev => 76, exp => 3483, pet_exp => 0};
get_waiting_exp(77) ->
    #{lev => 77, exp => 3519, pet_exp => 0};
get_waiting_exp(78) ->
    #{lev => 78, exp => 3555, pet_exp => 0};
get_waiting_exp(79) ->
    #{lev => 79, exp => 3590, pet_exp => 0};
get_waiting_exp(80) ->
    #{lev => 80, exp => 3625, pet_exp => 0};
get_waiting_exp(81) ->
    #{lev => 81, exp => 3898, pet_exp => 0};
get_waiting_exp(82) ->
    #{lev => 82, exp => 3940, pet_exp => 0};
get_waiting_exp(83) ->
    #{lev => 83, exp => 3976, pet_exp => 0};
get_waiting_exp(84) ->
    #{lev => 84, exp => 4012, pet_exp => 0};
get_waiting_exp(85) ->
    #{lev => 85, exp => 4047, pet_exp => 0};
get_waiting_exp(86) ->
    #{lev => 86, exp => 4082, pet_exp => 0};
get_waiting_exp(87) ->
    #{lev => 87, exp => 4118, pet_exp => 0};
get_waiting_exp(88) ->
    #{lev => 88, exp => 4161, pet_exp => 0};
get_waiting_exp(89) ->
    #{lev => 89, exp => 4196, pet_exp => 0};
get_waiting_exp(90) ->
    #{lev => 90, exp => 4231, pet_exp => 0};
get_waiting_exp(91) ->
    #{lev => 91, exp => 4267, pet_exp => 0};
get_waiting_exp(92) ->
    #{lev => 92, exp => 4310, pet_exp => 0};
get_waiting_exp(93) ->
    #{lev => 93, exp => 4345, pet_exp => 0};
get_waiting_exp(94) ->
    #{lev => 94, exp => 4381, pet_exp => 0};
get_waiting_exp(95) ->
    #{lev => 95, exp => 4424, pet_exp => 0};
get_waiting_exp(96) ->
    #{lev => 96, exp => 4459, pet_exp => 0};
get_waiting_exp(97) ->
    #{lev => 97, exp => 4494, pet_exp => 0};
get_waiting_exp(98) ->
    #{lev => 98, exp => 4537, pet_exp => 0};
get_waiting_exp(99) ->
    #{lev => 99, exp => 4573, pet_exp => 0};
get_waiting_exp(100) ->
    #{lev => 100, exp => 4608, pet_exp => 0};
get_waiting_exp(101) ->
    #{lev => 101, exp => 4608, pet_exp => 0};
get_waiting_exp(102) ->
    #{lev => 102, exp => 4608, pet_exp => 0};
get_waiting_exp(103) ->
    #{lev => 103, exp => 4608, pet_exp => 0};
get_waiting_exp(104) ->
    #{lev => 104, exp => 4608, pet_exp => 0};
get_waiting_exp(105) ->
    #{lev => 105, exp => 4608, pet_exp => 0};
get_waiting_exp(106) ->
    #{lev => 106, exp => 4608, pet_exp => 0};
get_waiting_exp(107) ->
    #{lev => 107, exp => 4608, pet_exp => 0};
get_waiting_exp(108) ->
    #{lev => 108, exp => 4608, pet_exp => 0};
get_waiting_exp(109) ->
    #{lev => 109, exp => 4608, pet_exp => 0};
get_waiting_exp(110) ->
    #{lev => 110, exp => 4608, pet_exp => 0};
get_waiting_exp(111) ->
    #{lev => 111, exp => 4608, pet_exp => 0};
get_waiting_exp(112) ->
    #{lev => 112, exp => 4608, pet_exp => 0};
get_waiting_exp(113) ->
    #{lev => 113, exp => 4608, pet_exp => 0};
get_waiting_exp(114) ->
    #{lev => 114, exp => 4608, pet_exp => 0};
get_waiting_exp(115) ->
    #{lev => 115, exp => 4608, pet_exp => 0};
get_waiting_exp(116) ->
    #{lev => 116, exp => 4608, pet_exp => 0};
get_waiting_exp(117) ->
    #{lev => 117, exp => 4608, pet_exp => 0};
get_waiting_exp(118) ->
    #{lev => 118, exp => 4608, pet_exp => 0};
get_waiting_exp(119) ->
    #{lev => 119, exp => 4608, pet_exp => 0};
get_waiting_exp(120) ->
    #{lev => 120, exp => 4608, pet_exp => 0};
get_waiting_exp(121) ->
    #{lev => 121, exp => 4608, pet_exp => 0};
get_waiting_exp(122) ->
    #{lev => 122, exp => 4608, pet_exp => 0};
get_waiting_exp(123) ->
    #{lev => 123, exp => 4608, pet_exp => 0};
get_waiting_exp(124) ->
    #{lev => 124, exp => 4608, pet_exp => 0};
get_waiting_exp(125) ->
    #{lev => 125, exp => 4608, pet_exp => 0};
get_waiting_exp(126) ->
    #{lev => 126, exp => 4608, pet_exp => 0};
get_waiting_exp(127) ->
    #{lev => 127, exp => 4608, pet_exp => 0};
get_waiting_exp(128) ->
    #{lev => 128, exp => 4608, pet_exp => 0};
get_waiting_exp(129) ->
    #{lev => 129, exp => 4608, pet_exp => 0};
get_waiting_exp(130) ->
    #{lev => 130, exp => 4608, pet_exp => 0};
get_waiting_exp(131) ->
    #{lev => 131, exp => 4608, pet_exp => 0};
get_waiting_exp(132) ->
    #{lev => 132, exp => 4608, pet_exp => 0};
get_waiting_exp(133) ->
    #{lev => 133, exp => 4608, pet_exp => 0};
get_waiting_exp(134) ->
    #{lev => 134, exp => 4608, pet_exp => 0};
get_waiting_exp(135) ->
    #{lev => 135, exp => 4608, pet_exp => 0};
get_waiting_exp(136) ->
    #{lev => 136, exp => 4608, pet_exp => 0};
get_waiting_exp(137) ->
    #{lev => 137, exp => 4608, pet_exp => 0};
get_waiting_exp(138) ->
    #{lev => 138, exp => 4608, pet_exp => 0};
get_waiting_exp(139) ->
    #{lev => 139, exp => 4608, pet_exp => 0};
get_waiting_exp(140) ->
    #{lev => 140, exp => 4608, pet_exp => 0};
get_waiting_exp(141) ->
    #{lev => 141, exp => 4608, pet_exp => 0};
get_waiting_exp(142) ->
    #{lev => 142, exp => 4608, pet_exp => 0};
get_waiting_exp(143) ->
    #{lev => 143, exp => 4608, pet_exp => 0};
get_waiting_exp(144) ->
    #{lev => 144, exp => 4608, pet_exp => 0};
get_waiting_exp(145) ->
    #{lev => 145, exp => 4608, pet_exp => 0};
get_waiting_exp(146) ->
    #{lev => 146, exp => 4608, pet_exp => 0};
get_waiting_exp(147) ->
    #{lev => 147, exp => 4608, pet_exp => 0};
get_waiting_exp(148) ->
    #{lev => 148, exp => 4608, pet_exp => 0};
get_waiting_exp(149) ->
    #{lev => 149, exp => 4608, pet_exp => 0};
get_waiting_exp(150) ->
    #{lev => 150, exp => 4608, pet_exp => 0};
get_waiting_exp(_) -> false.

get_key_loot(79600) ->
    [{0, 35}, {1, 20}, {2, 25}, {3, 20}];
get_key_loot(79605) ->
    [{0, 35}, {1, 15}, {2, 25}, {3, 25}];
get_key_loot(79610) ->
    [{0, 35}, {1, 8}, {2, 22}, {3, 35}];
get_key_loot(79624) ->
    [{0, 35}, {1, 5}, {2, 10}, {3, 50}];
get_key_loot(_) -> [].

