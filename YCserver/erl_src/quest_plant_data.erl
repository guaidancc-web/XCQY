-file("src/data/quest_plant_data.erl", 1).

-module(quest_plant_data).

-export([get_rand_reward/0, get_fruit_reward/0]).

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

-file("src/data/quest_plant_data.erl", 14).

get_rand_reward() ->
    [#{item_id => 71469, item_num => 1,
       item_name => lang:get("祈愿币"), item_weight => 30,
       announce => 1},
     #{item_id => 20025, item_num => 1,
       item_name => lang:get("冒险笔记"), item_weight => 200,
       announce => 0},
     #{item_id => 20046, item_num => 1,
       item_name => lang:get("彩虹果"), item_weight => 50,
       announce => 0},
     #{item_id => 20087, item_num => 1,
       item_name => lang:get("四宝"), item_weight => 60,
       announce => 1},
     #{item_id => 20074, item_num => 1,
       item_name => lang:get("星辰重置丹"), item_weight => 130,
       announce => 0},
     #{item_id => 20002, item_num => 1,
       item_name => lang:get("金币袋子"), item_weight => 150,
       announce => 0},
     #{item_id => 20000, item_num => 1,
       item_name => lang:get("银币袋子"), item_weight => 150,
       announce => 0},
     #{item_id => 20075, item_num => 1,
       item_name => lang:get("月亮重置丹"), item_weight => 20,
       announce => 1},
     #{item_id => 20095, item_num => 1,
       item_name => lang:get("珍兽之魂"), item_weight => 10,
       announce => 1},
     #{item_id => 20021, item_num => 2,
       item_name => lang:get("幸运石"), item_weight => 150,
       announce => 0},
     #{item_id => 20616, item_num => 1,
       item_name => lang:get("月亮护符"), item_weight => 3,
       announce => 1},
     #{item_id => 20076, item_num => 1,
       item_name => lang:get("太阳重置丹"), item_weight => 2,
       announce => 1},
     #{item_id => 20545, item_num => 1,
       item_name => lang:get("天资上限礼盒"), item_weight => 15,
       announce => 1},
     #{item_id => 21322, item_num => 1,
       item_name => lang:get("神兽百幻果"), item_weight => 30,
       announce => 1}].

get_fruit_reward() ->
    [#{item_id => 29984, item_num => 1,
       item_name => lang:get("生命之种"), item_weight => 500,
       announce => 0},
     #{item_id => 29985, item_num => 1,
       item_name => lang:get("梦境之种"), item_weight => 500,
       announce => 0}].

