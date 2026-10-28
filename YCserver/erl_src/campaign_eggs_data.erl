-file("src/data/campaign_eggs_data.erl", 1).

-module(campaign_eggs_data).

-export([get_eggs/0, get_rolled/1]).

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

-file("src/data/campaign_eggs_data.erl", 15).

get_eggs() ->
    [#{location => 1, item_id => 20005, item_num => 1,
       item_name => lang:get("人物经验书"), item_weight => 200,
       announce => 0},
     #{location => 2, item_id => 20006, item_num => 5,
       item_name => lang:get("星辰精华"), item_weight => 200,
       announce => 0},
     #{location => 3, item_id => 20045, item_num => 1,
       item_name => lang:get("月光绒"), item_weight => 200,
       announce => 0},
     #{location => 4, item_id => 20054, item_num => 1,
       item_name => lang:get("凤羽"), item_weight => 200,
       announce => 0},
     #{location => 5, item_id => 29160, item_num => 1,
       item_name => lang:get("守护的祝福"), item_weight => 200,
       announce => 0},
     #{location => 6, item_id => 20052, item_num => 1,
       item_name => lang:get("藏宝图"), item_weight => 200,
       announce => 0},
     #{location => 7, item_id => 29233, item_num => 1,
       item_name => lang:get("萌萌猫耳礼盒"), item_weight => 200,
       announce => 1},
     #{location => 8, item_id => 20021, item_num => 1,
       item_name => lang:get("幸运石"), item_weight => 200,
       announce => 0},
     #{location => 9, item_id => 20055, item_num => 1,
       item_name => lang:get("龙鳞"), item_weight => 200,
       announce => 0},
     #{location => 10, item_id => 29160, item_num => 1,
       item_name => lang:get("守护的祝福"), item_weight => 200,
       announce => 0},
     #{location => 11, item_id => 20005, item_num => 1,
       item_name => lang:get("人物经验书"), item_weight => 200,
       announce => 0},
     #{location => 12, item_id => 20004, item_num => 1,
       item_name => lang:get("宠物经验书"), item_weight => 200,
       announce => 0},
     #{location => 13, item_id => 29234, item_num => 1,
       item_name => lang:get("小恶魔礼盒"), item_weight => 200,
       announce => 1},
     #{location => 14, item_id => 29143, item_num => 1,
       item_name => lang:get("同心宝藏"), item_weight => 200,
       announce => 0},
     #{location => 15, item_id => 20057, item_num => 1,
       item_name => lang:get("蛇牙"), item_weight => 200,
       announce => 0},
     #{location => 16, item_id => 20004, item_num => 1,
       item_name => lang:get("宠物经验书"), item_weight => 200,
       announce => 0},
     #{location => 17, item_id => 29160, item_num => 1,
       item_name => lang:get("守护的祝福"), item_weight => 200,
       announce => 0},
     #{location => 18, item_id => 20616, item_num => 1,
       item_name => lang:get("月亮护符"), item_weight => 200,
       announce => 1},
     #{location => 19, item_id => 29220, item_num => 1,
       item_name => lang:get("棒棒糖"), item_weight => 200,
       announce => 0},
     #{location => 20, item_id => 20056, item_num => 1,
       item_name => lang:get("虎爪"), item_weight => 200,
       announce => 0},
     #{location => 21, item_id => 20005, item_num => 1,
       item_name => lang:get("人物经验书"), item_weight => 200,
       announce => 0},
     #{location => 22, item_id => 29160, item_num => 1,
       item_name => lang:get("守护的祝福"), item_weight => 200,
       announce => 0},
     #{location => 23, item_id => 20039, item_num => 1,
       item_name => lang:get("灵犀"), item_weight => 200,
       announce => 0},
     #{location => 24, item_id => 20021, item_num => 1,
       item_name => lang:get("幸运石"), item_weight => 200,
       announce => 0},
     #{location => 25, item_id => 20004, item_num => 1,
       item_name => lang:get("宠物经验书"), item_weight => 200,
       announce => 0},
     #{location => 26, item_id => 29160, item_num => 1,
       item_name => lang:get("守护的祝福"), item_weight => 200,
       announce => 0},
     #{location => 27, item_id => 29231, item_num => 1,
       item_name => lang:get("夏日情花礼盒"), item_weight => 200,
       announce => 1},
     #{location => 28, item_id => 23039, item_num => 1,
       item_name => lang:get("神秘彩蛋"), item_weight => 200,
       announce => 1}].

get_rolled(1) ->
    #{id => 1, need => 10, item_id => 29220, item_num => 1,
      item_name => lang:get("棒棒糖")};
get_rolled(2) ->
    #{id => 2, need => 50, item_id => 20053, item_num => 1,
      item_name => lang:get("远古藏宝图")};
get_rolled(3) ->
    #{id => 3, need => 100, item_id => 29235, item_num => 1,
      item_name => lang:get("小兔子礼盒")};
get_rolled(_) -> false.

