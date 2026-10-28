-file("src/data/raffle_data.erl", 1).

-module(raffle_data).

-export([get_prize/0, get_cost/1]).

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

-file("src/data/raffle_data.erl", 14).

get_prize() ->
    [#{id => 1, item_id => 20046, item_num => 1,
       item_name => lang:get("彩虹果"), item_weight => 500,
       sex => 2, classes => 0, lev_min => 1, lev_max => 200,
       break_times_min => 0, break_times_max => 99,
       announce => 1},
     #{id => 2, item_id => 20000, item_num => 1,
       item_name => lang:get("银币袋子"), item_weight => 500,
       sex => 2, classes => 0, lev_min => 1, lev_max => 200,
       break_times_min => 0, break_times_max => 99,
       announce => 0},
     #{id => 3, item_id => 20034, item_num => 1,
       item_name => lang:get("宝石包"), item_weight => 1000,
       sex => 2, classes => 0, lev_min => 1, lev_max => 200,
       break_times_min => 0, break_times_max => 99,
       announce => 0},
     #{id => 4, item_id => 20020, item_num => 2,
       item_name => lang:get("强化石"), item_weight => 1000,
       sex => 2, classes => 0, lev_min => 1, lev_max => 200,
       break_times_min => 0, break_times_max => 99,
       announce => 0},
     #{id => 5, item_id => 20076, item_num => 1,
       item_name => lang:get("太阳重置丹"), item_weight => 50,
       sex => 2, classes => 0, lev_min => 1, lev_max => 200,
       break_times_min => 0, break_times_max => 99,
       announce => 1},
     #{id => 6, item_id => 20005, item_num => 2,
       item_name => lang:get("人物经验心得"), item_weight => 1000,
       sex => 2, classes => 0, lev_min => 1, lev_max => 200,
       break_times_min => 0, break_times_max => 99,
       announce => 0},
     #{id => 8, item_id => 20025, item_num => 1,
       item_name => lang:get("冒险笔记"), item_weight => 1000,
       sex => 2, classes => 0, lev_min => 1, lev_max => 200,
       break_times_min => 0, break_times_max => 99,
       announce => 0},
     #{id => 9, item_id => 20075, item_num => 1,
       item_name => lang:get("月亮重置丹"), item_weight => 200,
       sex => 2, classes => 0, lev_min => 1, lev_max => 200,
       break_times_min => 0, break_times_max => 99,
       announce => 0},
     #{id => 10, item_id => 20006, item_num => 5,
       item_name => lang:get("星辰精华"), item_weight => 1000,
       sex => 2, classes => 0, lev_min => 1, lev_max => 200,
       break_times_min => 0, break_times_max => 99,
       announce => 0},
     #{id => 11, item_id => 20087, item_num => 1,
       item_name => lang:get("四宝"), item_weight => 500,
       sex => 2, classes => 0, lev_min => 1, lev_max => 200,
       break_times_min => 0, break_times_max => 99,
       announce => 1},
     #{id => 12, item_id => 90000, item_num => 100000,
       item_name => lang:get("银币"), item_weight => 1000,
       sex => 2, classes => 0, lev_min => 1, lev_max => 200,
       break_times_min => 0, break_times_max => 99,
       announce => 0},
     #{id => 13, item_id => 21101, item_num => 1,
       item_name => lang:get("精灵之羽"), item_weight => 80,
       sex => 2, classes => 0, lev_min => 1, lev_max => 200,
       break_times_min => 0, break_times_max => 99,
       announce => 1},
     #{id => 14, item_id => 20088, item_num => 1,
       item_name => lang:get("初级符石"), item_weight => 600,
       sex => 2, classes => 0, lev_min => 1, lev_max => 200,
       break_times_min => 0, break_times_max => 99,
       announce => 0},
     #{id => 15, item_id => 20095, item_num => 1,
       item_name => lang:get("珍兽之魂"), item_weight => 80,
       sex => 2, classes => 0, lev_min => 1, lev_max => 200,
       break_times_min => 0, break_times_max => 99,
       announce => 1},
     #{id => 16, item_id => 20045, item_num => 1,
       item_name => lang:get("月光绒"), item_weight => 700,
       sex => 2, classes => 0, lev_min => 1, lev_max => 200,
       break_times_min => 0, break_times_max => 99,
       announce => 0},
     #{id => 17, item_id => 20021, item_num => 1,
       item_name => lang:get("幸运石"), item_weight => 778,
       sex => 2, classes => 0, lev_min => 1, lev_max => 200,
       break_times_min => 0, break_times_max => 99,
       announce => 0},
     #{id => 100, item_id => 29011, item_num => 1,
       item_name => lang:get("随机珍兽"), item_weight => 2,
       sex => 2, classes => 0, lev_min => 1, lev_max => 200,
       break_times_min => 0, break_times_max => 99,
       announce => 1},
     #{id => 101, item_id => 23858, item_num => 1,
       item_name => lang:get("太阳项链"), item_weight => 10,
       sex => 2, classes => 0, lev_min => 1, lev_max => 200,
       break_times_min => 0, break_times_max => 99,
       announce => 1}].

get_cost(1) -> #{type => 1, cost => [{90035, 20}]};
get_cost(2) -> #{type => 2, cost => [{90035, 200}]};
get_cost(_) -> false.

