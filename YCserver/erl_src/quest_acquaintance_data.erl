-file("src/data/quest_acquaintance_data.erl", 1).

-module(quest_acquaintance_data).

-export([list/0,
         get_lev/1,
         get_ring/1,
         get_patrol/1,
         get_classify/0,
         get_item_list/0,
         get_find_type_quest_id/1,
         get_find_type/1,
         get_type/1,
         get_final_reward/0]).

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

-file("src/data/quest_acquaintance_data.erl", 23).

list() ->
    [#{id => 83300, weight => 100, type => 5,
       in_round => [4]},
     #{id => 83301, weight => 100, type => 5,
       in_round => [4]},
     #{id => 83302, weight => 100, type => 5,
       in_round => [4]},
     #{id => 83303, weight => 100, type => 5,
       in_round => [4]},
     #{id => 83310, weight => 100, type => 3,
       in_round => [2]},
     #{id => 83311, weight => 100, type => 3,
       in_round => [2]},
     #{id => 83312, weight => 100, type => 3,
       in_round => [2]},
     #{id => 83313, weight => 100, type => 3,
       in_round => [2]},
     #{id => 83320, weight => 100, type => 4,
       in_round => [1]},
     #{id => 83321, weight => 100, type => 4,
       in_round => [1]},
     #{id => 83322, weight => 100, type => 4,
       in_round => [1]},
     #{id => 83323, weight => 100, type => 4,
       in_round => [1]},
     #{id => 83330, weight => 100, type => 1,
       in_round => [3]},
     #{id => 83331, weight => 100, type => 1,
       in_round => [3]}].

get_lev(30) -> {1235, 1000};
get_lev(31) -> {1254, 1000};
get_lev(32) -> {1273, 1000};
get_lev(33) -> {1293, 1000};
get_lev(34) -> {1316, 1000};
get_lev(35) -> {1335, 1000};
get_lev(36) -> {1354, 1000};
get_lev(37) -> {1373, 1000};
get_lev(38) -> {1397, 1000};
get_lev(39) -> {1416, 1000};
get_lev(40) -> {1475, 1000};
get_lev(41) -> {1499, 1000};
get_lev(42) -> {1518, 1000};
get_lev(43) -> {1542, 1000};
get_lev(44) -> {1561, 1000};
get_lev(45) -> {1580, 1000};
get_lev(46) -> {1603, 1000};
get_lev(47) -> {1622, 1000};
get_lev(48) -> {1646, 1000};
get_lev(49) -> {1666, 1000};
get_lev(50) -> {1690, 1000};
get_lev(51) -> {1708, 1000};
get_lev(52) -> {1732, 1000};
get_lev(53) -> {1756, 1000};
get_lev(54) -> {1775, 1000};
get_lev(55) -> {1839, 1115};
get_lev(56) -> {1858, 1134};
get_lev(57) -> {1881, 1153};
get_lev(58) -> {1905, 1172};
get_lev(59) -> {1924, 1235};
get_lev(60) -> {1988, 1254};
get_lev(61) -> {2012, 1273};
get_lev(62) -> {2035, 1293};
get_lev(63) -> {1910, 1316};
get_lev(64) -> {1932, 1335};
get_lev(65) -> {1954, 1354};
get_lev(66) -> {1977, 1373};
get_lev(67) -> {1999, 1397};
get_lev(68) -> {2064, 1416};
get_lev(69) -> {2083, 1475};
get_lev(70) -> {2108, 1499};
get_lev(71) -> {2108, 1518};
get_lev(72) -> {2108, 1542};
get_lev(73) -> {2219, 1561};
get_lev(74) -> {2219, 1580};
get_lev(75) -> {2219, 1603};
get_lev(76) -> {2242, 1622};
get_lev(77) -> {2263, 1646};
get_lev(78) -> {2171, 1666};
get_lev(79) -> {2193, 1690};
get_lev(80) -> {2358, 1708};
get_lev(81) -> {2383, 1732};
get_lev(82) -> {2405, 1756};
get_lev(83) -> {2503, 1775};
get_lev(84) -> {2525, 1839};
get_lev(85) -> {2548, 1858};
get_lev(86) -> {2569, 1881};
get_lev(87) -> {2597, 1905};
get_lev(88) -> {2672, 1924};
get_lev(89) -> {2695, 1988};
get_lev(90) -> {2717, 2012};
get_lev(91) -> {2745, 2035};
get_lev(92) -> {2768, 1910};
get_lev(93) -> {2706, 1932};
get_lev(94) -> {2732, 1954};
get_lev(95) -> {2754, 1977};
get_lev(96) -> {2777, 1999};
get_lev(97) -> {2802, 2064};
get_lev(98) -> {2912, 2083};
get_lev(99) -> {2935, 2108};
get_lev(100) -> {3023, 2108};
get_lev(101) -> {3023, 2108};
get_lev(102) -> {3023, 2219};
get_lev(103) -> {3023, 2219};
get_lev(104) -> {3023, 2219};
get_lev(105) -> {3177, 2242};
get_lev(106) -> {3177, 2263};
get_lev(107) -> {3177, 2171};
get_lev(108) -> {3177, 2193};
get_lev(109) -> {3177, 2358};
get_lev(110) -> {3339, 2383};
get_lev(111) -> {3339, 2405};
get_lev(112) -> {3339, 2503};
get_lev(113) -> {3339, 2525};
get_lev(114) -> {3339, 2548};
get_lev(115) -> {3509, 2569};
get_lev(116) -> {3509, 2597};
get_lev(117) -> {3509, 2672};
get_lev(118) -> {3509, 2695};
get_lev(119) -> {3509, 2717};
get_lev(120) -> {3509, 2745};
get_lev(121) -> {3509, 2768};
get_lev(122) -> {3509, 2706};
get_lev(123) -> {3509, 2732};
get_lev(124) -> {3509, 2754};
get_lev(125) -> {3509, 2777};
get_lev(126) -> {3509, 2802};
get_lev(127) -> {3509, 2827};
get_lev(128) -> {3509, 2852};
get_lev(129) -> {3509, 2877};
get_lev(130) -> {3509, 2902};
get_lev(131) -> {3509, 2927};
get_lev(132) -> {3509, 2952};
get_lev(133) -> {3509, 2977};
get_lev(134) -> {3509, 3002};
get_lev(135) -> {3509, 3027};
get_lev(136) -> {3509, 3052};
get_lev(_Id) -> none.

get_ring(_Id) -> none.

get_patrol(_) -> [].

get_classify() ->
    [{1, 500, 10},
     {2, 250, 10},
     {3, 150, 20},
     {4, 100, 30}].

get_item_list() -> [].

get_find_type_quest_id(1) -> 83320;
get_find_type_quest_id(2) -> 83321;
get_find_type_quest_id(3) -> 83322;
get_find_type_quest_id(4) -> 83323;
get_find_type_quest_id(_Type) -> false.

get_find_type(83320) -> 1;
get_find_type(83321) -> 2;
get_find_type(83322) -> 3;
get_find_type(83323) -> 4;
get_find_type(_QuestId) -> false.

get_type(83300) -> 5;
get_type(83301) -> 5;
get_type(83302) -> 5;
get_type(83303) -> 5;
get_type(83310) -> 3;
get_type(83311) -> 3;
get_type(83312) -> 3;
get_type(83313) -> 3;
get_type(83320) -> 4;
get_type(83321) -> 4;
get_type(83322) -> 4;
get_type(83323) -> 4;
get_type(83330) -> 1;
get_type(83331) -> 1;
get_type(_QuestId) -> false.

get_final_reward() ->
    [#{item_id => 20000, item_num => 1,
       item_name => lang:get("一袋银币"), item_weight => 105,
       announce => 0},
     #{item_id => 20006, item_num => 20,
       item_name => lang:get("星辰精华"), item_weight => 105,
       announce => 0},
     #{item_id => 20045, item_num => 5,
       item_name => lang:get("月光绒"), item_weight => 105,
       announce => 0},
     #{item_id => 20046, item_num => 1,
       item_name => lang:get("彩虹果"), item_weight => 20,
       announce => 0},
     #{item_id => 20025, item_num => 2,
       item_name => lang:get("冒险笔记"), item_weight => 105,
       announce => 0},
     #{item_id => 22215, item_num => 10,
       item_name => lang:get("冒险丹"), item_weight => 105,
       announce => 0},
     #{item_id => 20017, item_num => 1,
       item_name => lang:get("月亮之魂"), item_weight => 30,
       announce => 0},
     #{item_id => 20018, item_num => 1,
       item_name => lang:get("太阳之魂"), item_weight => 15,
       announce => 1},
     #{item_id => 20089, item_num => 1,
       item_name => lang:get("优秀符石"), item_weight => 20,
       announce => 1},
     #{item_id => 20615, item_num => 1,
       item_name => lang:get("星辰护符"), item_weight => 55,
       announce => 0},
     #{item_id => 20616, item_num => 1,
       item_name => lang:get("月亮护符"), item_weight => 25,
       announce => 1},
     #{item_id => 20617, item_num => 1,
       item_name => lang:get("太阳护符"), item_weight => 5,
       announce => 1},
     #{item_id => 21101, item_num => 1,
       item_name => lang:get("翅膀神羽"), item_weight => 20,
       announce => 0},
     #{item_id => 21102, item_num => 1,
       item_name => lang:get("火凤之羽"), item_weight => 10,
       announce => 1},
     #{item_id => 20038, item_num => 1,
       item_name => lang:get("神兽之魂"), item_weight => 5,
       announce => 1},
     #{item_id => 20095, item_num => 1,
       item_name => lang:get("珍兽之魂"), item_weight => 20,
       announce => 0},
     #{item_id => 20040, item_num => 1,
       item_name => lang:get("高级灵犀"), item_weight => 15,
       announce => 1},
     #{item_id => 20074, item_num => 1,
       item_name => lang:get("星辰重置丹"), item_weight => 85,
       announce => 0},
     #{item_id => 20075, item_num => 1,
       item_name => lang:get("月亮重置丹"), item_weight => 15,
       announce => 1},
     #{item_id => 20076, item_num => 1,
       item_name => lang:get("太阳重置丹"), item_weight => 5,
       announce => 1},
     #{item_id => 20022, item_num => 1,
       item_name => lang:get("优秀幸运石"), item_weight => 40,
       announce => 0},
     #{item_id => 20009, item_num => 1,
       item_name => lang:get("+8强化保护卷"), item_weight => 25,
       announce => 1},
     #{item_id => 20010, item_num => 1,
       item_name => lang:get("+9强化保护卷"), item_weight => 10,
       announce => 1},
     #{item_id => 20011, item_num => 1,
       item_name => lang:get("+10强化保护卷"), item_weight => 5,
       announce => 1},
     #{item_id => 20014, item_num => 1,
       item_name => lang:get("高级兽决"), item_weight => 50,
       announce => 1}].

