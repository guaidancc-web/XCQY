-file("src/data/cross_arena_data.erl", 1).

-module(cross_arena_data).

-export([get/1, get_gain/1, get_gift/1]).

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

-file("src/data/cross_arena_data.erl", 16).

get(1) ->
    {{79584, 1},
     [#{name_item => lang:get("星辰精华"), item_id => 20006,
        sex => 2, classes => 0, lev_low => 30, lev_high => 200,
        ratio => 150, num => 3, bind => 0, is_cast => 0},
      #{name_item => lang:get("藏宝图"), item_id => 20052,
        sex => 2, classes => 0, lev_low => 30, lev_high => 200,
        ratio => 150, num => 1, bind => 0, is_cast => 0},
      #{name_item => lang:get("人物经验心得"), item_id => 20005,
        sex => 2, classes => 0, lev_low => 30, lev_high => 200,
        ratio => 98, num => 1, bind => 0, is_cast => 0},
      #{name_item => lang:get("宠物经验心得"), item_id => 20004,
        sex => 2, classes => 0, lev_low => 30, lev_high => 200,
        ratio => 100, num => 1, bind => 0, is_cast => 0},
      #{name_item => lang:get("宝石包"), item_id => 20034,
        sex => 2, classes => 0, lev_low => 30, lev_high => 200,
        ratio => 100, num => 1, bind => 0, is_cast => 0},
      #{name_item => lang:get("月光绒"), item_id => 20045,
        sex => 2, classes => 0, lev_low => 30, lev_high => 200,
        ratio => 100, num => 1, bind => 0, is_cast => 0},
      #{name_item => lang:get("魔兽要诀"), item_id => 20013,
        sex => 2, classes => 0, lev_low => 30, lev_high => 200,
        ratio => 80, num => 1, bind => 0, is_cast => 0},
      #{name_item => lang:get("冒险笔记"), item_id => 20025,
        sex => 2, classes => 0, lev_low => 30, lev_high => 200,
        ratio => 80, num => 1, bind => 0, is_cast => 0},
      #{name_item => lang:get("四宝"), item_id => 20087,
        sex => 2, classes => 0, lev_low => 30, lev_high => 200,
        ratio => 50, num => 1, bind => 0, is_cast => 1},
      #{name_item => lang:get("星辰重置丹"), item_id => 20074,
        sex => 2, classes => 0, lev_low => 30, lev_high => 200,
        ratio => 60, num => 1, bind => 0, is_cast => 0},
      #{name_item => lang:get("翅膀灵羽"), item_id => 21100,
        sex => 2, classes => 0, lev_low => 30, lev_high => 200,
        ratio => 15, num => 1, bind => 0, is_cast => 1},
      #{name_item => lang:get("珍兽之魂"), item_id => 20095,
        sex => 2, classes => 0, lev_low => 30, lev_high => 200,
        ratio => 5, num => 1, bind => 0, is_cast => 1},
      #{name_item => lang:get("月亮重置丹"), item_id => 20075,
        sex => 2, classes => 0, lev_low => 30, lev_high => 200,
        ratio => 10, num => 1, bind => 0, is_cast => 1},
      #{name_item => lang:get("神兽之魂"), item_id => 20038,
        sex => 2, classes => 0, lev_low => 30, lev_high => 200,
        ratio => 2, num => 1, bind => 0, is_cast => 1}]};
get(2) ->
    {{79585, 1},
     [#{name_item => lang:get("银币"), item_id => 90000,
        sex => 2, classes => 0, lev_low => 30, lev_high => 200,
        ratio => 50, num => 55555, bind => 0, is_cast => 0},
      #{name_item => lang:get("银币"), item_id => 90000,
        sex => 2, classes => 0, lev_low => 30, lev_high => 200,
        ratio => 100, num => 66666, bind => 0, is_cast => 0},
      #{name_item => lang:get("银币"), item_id => 90000,
        sex => 2, classes => 0, lev_low => 30, lev_high => 200,
        ratio => 100, num => 88888, bind => 0, is_cast => 0},
      #{name_item => lang:get("银币"), item_id => 90000,
        sex => 2, classes => 0, lev_low => 30, lev_high => 200,
        ratio => 100, num => 111111, bind => 0, is_cast => 0},
      #{name_item => lang:get("银币"), item_id => 90000,
        sex => 2, classes => 0, lev_low => 30, lev_high => 200,
        ratio => 100, num => 150000, bind => 0, is_cast => 0},
      #{name_item => lang:get("银币"), item_id => 90000,
        sex => 2, classes => 0, lev_low => 30, lev_high => 200,
        ratio => 100, num => 166666, bind => 0, is_cast => 0},
      #{name_item => lang:get("银币"), item_id => 90000,
        sex => 2, classes => 0, lev_low => 30, lev_high => 200,
        ratio => 100, num => 188888, bind => 0, is_cast => 0},
      #{name_item => lang:get("银币"), item_id => 90000,
        sex => 2, classes => 0, lev_low => 30, lev_high => 200,
        ratio => 100, num => 222222, bind => 0, is_cast => 0},
      #{name_item => lang:get("银币"), item_id => 90000,
        sex => 2, classes => 0, lev_low => 30, lev_high => 200,
        ratio => 100, num => 288888, bind => 0, is_cast => 0},
      #{name_item => lang:get("银币"), item_id => 90000,
        sex => 2, classes => 0, lev_low => 30, lev_high => 200,
        ratio => 100, num => 388888, bind => 0, is_cast => 0},
      #{name_item => lang:get("银币"), item_id => 90000,
        sex => 2, classes => 0, lev_low => 30, lev_high => 200,
        ratio => 50, num => 588888, bind => 0, is_cast => 0}]};
get(_) -> false.

get_gain(79584) ->
    [#{name_item => lang:get("星辰精华"), item_id => 20006,
       sex => 2, classes => 0, lev_low => 30, lev_high => 200,
       ratio => 150, num => 3, bind => 0, is_cast => 0},
     #{name_item => lang:get("藏宝图"), item_id => 20052,
       sex => 2, classes => 0, lev_low => 30, lev_high => 200,
       ratio => 150, num => 1, bind => 0, is_cast => 0},
     #{name_item => lang:get("人物经验心得"), item_id => 20005,
       sex => 2, classes => 0, lev_low => 30, lev_high => 200,
       ratio => 98, num => 1, bind => 0, is_cast => 0},
     #{name_item => lang:get("宠物经验心得"), item_id => 20004,
       sex => 2, classes => 0, lev_low => 30, lev_high => 200,
       ratio => 100, num => 1, bind => 0, is_cast => 0},
     #{name_item => lang:get("宝石包"), item_id => 20034,
       sex => 2, classes => 0, lev_low => 30, lev_high => 200,
       ratio => 100, num => 1, bind => 0, is_cast => 0},
     #{name_item => lang:get("月光绒"), item_id => 20045,
       sex => 2, classes => 0, lev_low => 30, lev_high => 200,
       ratio => 100, num => 1, bind => 0, is_cast => 0},
     #{name_item => lang:get("魔兽要诀"), item_id => 20013,
       sex => 2, classes => 0, lev_low => 30, lev_high => 200,
       ratio => 80, num => 1, bind => 0, is_cast => 0},
     #{name_item => lang:get("冒险笔记"), item_id => 20025,
       sex => 2, classes => 0, lev_low => 30, lev_high => 200,
       ratio => 80, num => 1, bind => 0, is_cast => 0},
     #{name_item => lang:get("四宝"), item_id => 20087,
       sex => 2, classes => 0, lev_low => 30, lev_high => 200,
       ratio => 50, num => 1, bind => 0, is_cast => 1},
     #{name_item => lang:get("星辰重置丹"), item_id => 20074,
       sex => 2, classes => 0, lev_low => 30, lev_high => 200,
       ratio => 60, num => 1, bind => 0, is_cast => 0},
     #{name_item => lang:get("翅膀灵羽"), item_id => 21100,
       sex => 2, classes => 0, lev_low => 30, lev_high => 200,
       ratio => 15, num => 1, bind => 0, is_cast => 1},
     #{name_item => lang:get("珍兽之魂"), item_id => 20095,
       sex => 2, classes => 0, lev_low => 30, lev_high => 200,
       ratio => 5, num => 1, bind => 0, is_cast => 1},
     #{name_item => lang:get("月亮重置丹"), item_id => 20075,
       sex => 2, classes => 0, lev_low => 30, lev_high => 200,
       ratio => 10, num => 1, bind => 0, is_cast => 1},
     #{name_item => lang:get("神兽之魂"), item_id => 20038,
       sex => 2, classes => 0, lev_low => 30, lev_high => 200,
       ratio => 2, num => 1, bind => 0, is_cast => 1}];
get_gain(79585) ->
    [#{name_item => lang:get("银币"), item_id => 90000,
       sex => 2, classes => 0, lev_low => 30, lev_high => 200,
       ratio => 50, num => 55555, bind => 0, is_cast => 0},
     #{name_item => lang:get("银币"), item_id => 90000,
       sex => 2, classes => 0, lev_low => 30, lev_high => 200,
       ratio => 100, num => 66666, bind => 0, is_cast => 0},
     #{name_item => lang:get("银币"), item_id => 90000,
       sex => 2, classes => 0, lev_low => 30, lev_high => 200,
       ratio => 100, num => 88888, bind => 0, is_cast => 0},
     #{name_item => lang:get("银币"), item_id => 90000,
       sex => 2, classes => 0, lev_low => 30, lev_high => 200,
       ratio => 100, num => 111111, bind => 0, is_cast => 0},
     #{name_item => lang:get("银币"), item_id => 90000,
       sex => 2, classes => 0, lev_low => 30, lev_high => 200,
       ratio => 100, num => 150000, bind => 0, is_cast => 0},
     #{name_item => lang:get("银币"), item_id => 90000,
       sex => 2, classes => 0, lev_low => 30, lev_high => 200,
       ratio => 100, num => 166666, bind => 0, is_cast => 0},
     #{name_item => lang:get("银币"), item_id => 90000,
       sex => 2, classes => 0, lev_low => 30, lev_high => 200,
       ratio => 100, num => 188888, bind => 0, is_cast => 0},
     #{name_item => lang:get("银币"), item_id => 90000,
       sex => 2, classes => 0, lev_low => 30, lev_high => 200,
       ratio => 100, num => 222222, bind => 0, is_cast => 0},
     #{name_item => lang:get("银币"), item_id => 90000,
       sex => 2, classes => 0, lev_low => 30, lev_high => 200,
       ratio => 100, num => 288888, bind => 0, is_cast => 0},
     #{name_item => lang:get("银币"), item_id => 90000,
       sex => 2, classes => 0, lev_low => 30, lev_high => 200,
       ratio => 100, num => 388888, bind => 0, is_cast => 0},
     #{name_item => lang:get("银币"), item_id => 90000,
       sex => 2, classes => 0, lev_low => 30, lev_high => 200,
       ratio => 50, num => 588888, bind => 0, is_cast => 0}];
get_gain(_) -> false.

get_gift(1) -> {24046, 0, 1};
get_gift(2) -> {70152, 0, 1};
get_gift(3) -> {70153, 0, 1};
get_gift(_) -> false.

