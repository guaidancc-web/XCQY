-file("src/data/star_moon_data.erl", 1).

-module(star_moon_data).

-export([lists_unit/0,
         get_rewards/0,
         get_score_base/1,
         get_score_add/1]).

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

-file("src/data/star_moon_data.erl", 15).

lists_unit() ->
    [85001, 85020, 85040, 85060, 85080, 85100].

get_rewards() ->
    [#{item_id => 20000, item_name => lang:get("银币袋子"),
       item_num => 2, lev_min => 1, lev_max => 200,
       break_times_min => 0, break_times_max => 1, bind => 0,
       item_weight => 50, announce => 0},
     #{item_id => 20002, item_name => lang:get("金币袋子"),
       item_num => 2, lev_min => 1, lev_max => 200,
       break_times_min => 0, break_times_max => 1, bind => 0,
       item_weight => 50, announce => 0},
     #{item_id => 20020, item_name => lang:get("强化石"),
       item_num => 3, lev_min => 1, lev_max => 200,
       break_times_min => 0, break_times_max => 1, bind => 0,
       item_weight => 20, announce => 0},
     #{item_id => 20021, item_name => lang:get("幸运石"),
       item_num => 3, lev_min => 1, lev_max => 200,
       break_times_min => 0, break_times_max => 1, bind => 0,
       item_weight => 50, announce => 0},
     #{item_id => 20034, item_name => lang:get("宝石包"),
       item_num => 3, lev_min => 1, lev_max => 200,
       break_times_min => 0, break_times_max => 1, bind => 0,
       item_weight => 20, announce => 0},
     #{item_id => 20025, item_name => lang:get("冒险笔记"),
       item_num => 2, lev_min => 1, lev_max => 200,
       break_times_min => 0, break_times_max => 1, bind => 0,
       item_weight => 30, announce => 0},
     #{item_id => 22585, item_name => lang:get("一大袋宝石"),
       item_num => 1, lev_min => 1, lev_max => 200,
       break_times_min => 0, break_times_max => 1, bind => 0,
       item_weight => 25, announce => 1},
     #{item_id => 20046, item_name => lang:get("彩虹果"),
       item_num => 1, lev_min => 1, lev_max => 200,
       break_times_min => 0, break_times_max => 1, bind => 0,
       item_weight => 20, announce => 1},
     #{item_id => 20087, item_name => lang:get("四宝"),
       item_num => 1, lev_min => 1, lev_max => 200,
       break_times_min => 0, break_times_max => 1, bind => 0,
       item_weight => 20, announce => 0},
     #{item_id => 20040, item_name => lang:get("二品灵犀"),
       item_num => 1, lev_min => 65, lev_max => 200,
       break_times_min => 0, break_times_max => 1, bind => 0,
       item_weight => 16, announce => 1},
     #{item_id => 20036, item_name => lang:get("三品灵犀"),
       item_num => 1, lev_min => 85, lev_max => 200,
       break_times_min => 0, break_times_max => 1, bind => 0,
       item_weight => 13, announce => 1},
     #{item_id => 20014, item_name => lang:get("高级魔兽要诀"),
       item_num => 1, lev_min => 1, lev_max => 200,
       break_times_min => 0, break_times_max => 1, bind => 0,
       item_weight => 20, announce => 1},
     #{item_id => 20075, item_name => lang:get("月亮重置丹"),
       item_num => 1, lev_min => 1, lev_max => 200,
       break_times_min => 0, break_times_max => 1, bind => 0,
       item_weight => 18, announce => 1},
     #{item_id => 20616, item_name => lang:get("月亮护符"),
       item_num => 1, lev_min => 1, lev_max => 200,
       break_times_min => 0, break_times_max => 1, bind => 0,
       item_weight => 12, announce => 1},
     #{item_id => 20076, item_name => lang:get("太阳重置丹"),
       item_num => 1, lev_min => 1, lev_max => 200,
       break_times_min => 0, break_times_max => 1, bind => 0,
       item_weight => 12, announce => 1},
     #{item_id => 20095, item_name => lang:get("珍兽之魂"),
       item_num => 1, lev_min => 1, lev_max => 200,
       break_times_min => 0, break_times_max => 1, bind => 0,
       item_weight => 22, announce => 1},
     #{item_id => 20038, item_name => lang:get("神兽之魂"),
       item_num => 1, lev_min => 1, lev_max => 200,
       break_times_min => 0, break_times_max => 1, bind => 0,
       item_weight => 12, announce => 1},
     #{item_id => 22205, item_name => lang:get("精灵龙魂"),
       item_num => 1, lev_min => 1, lev_max => 200,
       break_times_min => 0, break_times_max => 1, bind => 0,
       item_weight => 1, announce => 1},
     #{item_id => 20617, item_name => lang:get("太阳护符"),
       item_num => 1, lev_min => 1, lev_max => 200,
       break_times_min => 0, break_times_max => 1, bind => 0,
       item_weight => 6, announce => 1},
     #{item_id => 23819, item_name => lang:get("金钟罩"),
       item_num => 1, lev_min => 65, lev_max => 200,
       break_times_min => 0, break_times_max => 1, bind => 0,
       item_weight => 26, announce => 1},
     #{item_id => 23820, item_name => lang:get("羊皮卷"),
       item_num => 1, lev_min => 65, lev_max => 200,
       break_times_min => 0, break_times_max => 1, bind => 0,
       item_weight => 26, announce => 1},
     #{item_id => 23821, item_name => lang:get("千年雪莲"),
       item_num => 1, lev_min => 65, lev_max => 200,
       break_times_min => 0, break_times_max => 1, bind => 0,
       item_weight => 26, announce => 1},
     #{item_id => 23822, item_name => lang:get("闪电手"),
       item_num => 1, lev_min => 65, lev_max => 200,
       break_times_min => 0, break_times_max => 1, bind => 0,
       item_weight => 26, announce => 1},
     #{item_id => 23823, item_name => lang:get("桃木剑"),
       item_num => 1, lev_min => 65, lev_max => 200,
       break_times_min => 0, break_times_max => 1, bind => 0,
       item_weight => 26, announce => 1},
     #{item_id => 23880, item_name => lang:get("闪身之术"),
       item_num => 1, lev_min => 70, lev_max => 200,
       break_times_min => 0, break_times_max => 1, bind => 0,
       item_weight => 3, announce => 1},
     #{item_id => 23881, item_name => lang:get("雷霆之姿"),
       item_num => 1, lev_min => 70, lev_max => 200,
       break_times_min => 0, break_times_max => 1, bind => 0,
       item_weight => 3, announce => 1},
     #{item_id => 23882, item_name => lang:get("雷厉风行"),
       item_num => 1, lev_min => 70, lev_max => 200,
       break_times_min => 0, break_times_max => 1, bind => 0,
       item_weight => 3, announce => 1},
     #{item_id => 23883, item_name => lang:get("风之子"),
       item_num => 1, lev_min => 70, lev_max => 200,
       break_times_min => 0, break_times_max => 1, bind => 0,
       item_weight => 3, announce => 1},
     #{item_id => 23884, item_name => lang:get("神圣治愈"),
       item_num => 1, lev_min => 70, lev_max => 200,
       break_times_min => 0, break_times_max => 1, bind => 0,
       item_weight => 3, announce => 1},
     #{item_id => 23885, item_name => lang:get("楚楚可怜"),
       item_num => 1, lev_min => 70, lev_max => 200,
       break_times_min => 0, break_times_max => 1, bind => 0,
       item_weight => 3, announce => 1},
     #{item_id => 23887, item_name => lang:get("天雷炸弹"),
       item_num => 1, lev_min => 70, lev_max => 200,
       break_times_min => 0, break_times_max => 1, bind => 0,
       item_weight => 3, announce => 1},
     #{item_id => 23888, item_name => lang:get("破甲精通"),
       item_num => 1, lev_min => 70, lev_max => 200,
       break_times_min => 0, break_times_max => 1, bind => 0,
       item_weight => 3, announce => 1},
     #{item_id => 23555, item_name => lang:get("坐骑口粮"),
       item_num => 2, lev_min => 75, lev_max => 200,
       break_times_min => 0, break_times_max => 1, bind => 0,
       item_weight => 30, announce => 0},
     #{item_id => 23556, item_name => lang:get("精灵缰绳"),
       item_num => 3, lev_min => 75, lev_max => 200,
       break_times_min => 0, break_times_max => 1, bind => 0,
       item_weight => 30, announce => 0},
     #{item_id => 23554, item_name => lang:get("唤灵丹"),
       item_num => 1, lev_min => 75, lev_max => 200,
       break_times_min => 0, break_times_max => 1, bind => 0,
       item_weight => 20, announce => 1},
     #{item_id => 23550, item_name => lang:get("驭兽笔记"),
       item_num => 1, lev_min => 75, lev_max => 200,
       break_times_min => 0, break_times_max => 1, bind => 0,
       item_weight => 12, announce => 1},
     #{item_id => 21130, item_name => lang:get("凤鸣石"),
       item_num => 1, lev_min => 1, lev_max => 200,
       break_times_min => 0, break_times_max => 1, bind => 0,
       item_weight => 20, announce => 0},
     #{item_id => 21100, item_name => lang:get("翅膀灵羽"),
       item_num => 1, lev_min => 1, lev_max => 200,
       break_times_min => 0, break_times_max => 1, bind => 0,
       item_weight => 10, announce => 0},
     #{item_id => 21101, item_name => lang:get("精灵之羽"),
       item_num => 1, lev_min => 55, lev_max => 200,
       break_times_min => 0, break_times_max => 1, bind => 0,
       item_weight => 20, announce => 1},
     #{item_id => 21102, item_name => lang:get("火凤之羽"),
       item_num => 1, lev_min => 75, lev_max => 200,
       break_times_min => 0, break_times_max => 1, bind => 0,
       item_weight => 16, announce => 1},
     #{item_id => 21136, item_name => lang:get("灵羽卷轴"),
       item_num => 1, lev_min => 1, lev_max => 200,
       break_times_min => 0, break_times_max => 1, bind => 0,
       item_weight => 30, announce => 0},
     #{item_id => 22306, item_name => lang:get("精良珍珠袋子"),
       item_num => 2, lev_min => 80, lev_max => 200,
       break_times_min => 0, break_times_max => 1, bind => 0,
       item_weight => 30, announce => 0},
     #{item_id => 22307, item_name => lang:get("优秀珍珠袋子"),
       item_num => 1, lev_min => 80, lev_max => 200,
       break_times_min => 0, break_times_max => 1, bind => 0,
       item_weight => 30, announce => 1},
     #{item_id => 23950, item_name => lang:get("普通内丹"),
       item_num => 1, lev_min => 80, lev_max => 200,
       break_times_min => 0, break_times_max => 1, bind => 0,
       item_weight => 30, announce => 0},
     #{item_id => 23951, item_name => lang:get("高级内丹"),
       item_num => 1, lev_min => 80, lev_max => 200,
       break_times_min => 0, break_times_max => 1, bind => 0,
       item_weight => 5, announce => 1},
     #{item_id => 29046, item_name => lang:get("随机图鉴"),
       item_num => 1, lev_min => 1, lev_max => 200,
       break_times_min => 0, break_times_max => 1, bind => 0,
       item_weight => 30, announce => 0},
     #{item_id => 21423, item_name => lang:get("4级图鉴碎片"),
       item_num => 1, lev_min => 65, lev_max => 200,
       break_times_min => 0, break_times_max => 1, bind => 0,
       item_weight => 30, announce => 0},
     #{item_id => 21424, item_name => lang:get("5级图鉴碎片"),
       item_num => 1, lev_min => 75, lev_max => 200,
       break_times_min => 0, break_times_max => 1, bind => 0,
       item_weight => 20, announce => 1},
     #{item_id => 21425, item_name => lang:get("6级图鉴碎片"),
       item_num => 1, lev_min => 85, lev_max => 200,
       break_times_min => 0, break_times_max => 1, bind => 0,
       item_weight => 10, announce => 1},
     #{item_id => 20354, item_name => lang:get("80装备魂"),
       item_num => 1, lev_min => 75, lev_max => 200,
       break_times_min => 0, break_times_max => 1, bind => 0,
       item_weight => 40, announce => 1},
     #{item_id => 20355, item_name => lang:get("90装备魂"),
       item_num => 1, lev_min => 85, lev_max => 200,
       break_times_min => 0, break_times_max => 1, bind => 0,
       item_weight => 33, announce => 1},
     #{item_id => 20356, item_name => lang:get("100装备魂"),
       item_num => 1, lev_min => 95, lev_max => 200,
       break_times_min => 0, break_times_max => 1, bind => 0,
       item_weight => 24, announce => 1},
     #{item_id => 20357, item_name => lang:get("110装备魂"),
       item_num => 1, lev_min => 105, lev_max => 200,
       break_times_min => 0, break_times_max => 1, bind => 0,
       item_weight => 21, announce => 1},
     #{item_id => 20360, item_name => lang:get("120装备魂"),
       item_num => 1, lev_min => 115, lev_max => 200,
       break_times_min => 0, break_times_max => 1, bind => 0,
       item_weight => 19, announce => 1},
     #{item_id => 70352, item_name => lang:get("幻月兔"),
       item_num => 1, lev_min => 1, lev_max => 200,
       break_times_min => 0, break_times_max => 1, bind => 0,
       item_weight => 26, announce => 1}].

get_score_base(60) -> 9000;
get_score_base(61) -> 9500;
get_score_base(62) -> 9500;
get_score_base(63) -> 9500;
get_score_base(64) -> 9500;
get_score_base(65) -> 9500;
get_score_base(66) -> 10000;
get_score_base(67) -> 10000;
get_score_base(68) -> 10000;
get_score_base(69) -> 10000;
get_score_base(70) -> 10000;
get_score_base(71) -> 10500;
get_score_base(72) -> 10500;
get_score_base(73) -> 10500;
get_score_base(74) -> 10500;
get_score_base(75) -> 11000;
get_score_base(76) -> 11500;
get_score_base(77) -> 11500;
get_score_base(78) -> 11500;
get_score_base(79) -> 12000;
get_score_base(80) -> 13000;
get_score_base(81) -> 14000;
get_score_base(82) -> 14500;
get_score_base(83) -> 14000;
get_score_base(84) -> 14500;
get_score_base(85) -> 14500;
get_score_base(86) -> 15000;
get_score_base(87) -> 15500;
get_score_base(88) -> 15500;
get_score_base(89) -> 17000;
get_score_base(90) -> 15500;
get_score_base(91) -> 16000;
get_score_base(92) -> 16500;
get_score_base(93) -> 16000;
get_score_base(94) -> 17500;
get_score_base(95) -> 18500;
get_score_base(96) -> 19000;
get_score_base(97) -> 19000;
get_score_base(98) -> 20000;
get_score_base(99) -> 21000;
get_score_base(100) -> 20000;
get_score_base(101) -> 22500;
get_score_base(102) -> 23500;
get_score_base(103) -> 24000;
get_score_base(104) -> 24000;
get_score_base(105) -> 23000;
get_score_base(106) -> 24000;
get_score_base(107) -> 24000;
get_score_base(108) -> 24500;
get_score_base(109) -> 26500;
get_score_base(110) -> 19500;
get_score_base(111) -> 24000;
get_score_base(112) -> 25000;
get_score_base(113) -> 25000;
get_score_base(114) -> 25000;
get_score_base(115) -> 25500;
get_score_base(116) -> 27000;
get_score_base(117) -> 27500;
get_score_base(118) -> 28500;
get_score_base(119) -> 29000;
get_score_base(120) -> 30500;
get_score_base(121) -> 29500;
get_score_base(122) -> 30000;
get_score_base(123) -> 30500;
get_score_base(124) -> 31000;
get_score_base(125) -> 31500;
get_score_base(126) -> 32000;
get_score_base(127) -> 32500;
get_score_base(128) -> 33000;
get_score_base(129) -> 33500;
get_score_base(130) -> 34000;
get_score_base(131) -> 34500;
get_score_base(132) -> 35000;
get_score_base(133) -> 35500;
get_score_base(134) -> 36000;
get_score_base(135) -> 36500;
get_score_base(136) -> 37000;
get_score_base(137) -> 37500;
get_score_base(138) -> 38000;
get_score_base(139) -> 38500;
get_score_base(140) -> 39000;
get_score_base(_) -> 0.

get_score_add(Score)
    when Score >= 0 andalso Score =< 1050 ->
    0;
get_score_add(Score)
    when Score >= 1050 andalso Score =< 1100 ->
    20;
get_score_add(Score)
    when Score >= 1100 andalso Score =< 1150 ->
    30;
get_score_add(Score)
    when Score >= 1150 andalso Score =< 1200 ->
    50;
get_score_add(Score)
    when Score >= 1200 andalso Score =< 1250 ->
    80;
get_score_add(Score)
    when Score >= 1250 andalso Score =< 1300 ->
    100;
get_score_add(Score)
    when Score >= 1300 andalso Score =< 10000 ->
    150;
get_score_add(_) -> 0.

