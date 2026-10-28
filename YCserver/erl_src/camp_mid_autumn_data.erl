-file("src/data/camp_mid_autumn_data.erl", 1).

-module(camp_mid_autumn_data).

-export([get_reward/1,
         get_meeting_info/1,
         get_count_rate/1,
         get_wish_exp/1,
         get_fly_reward/1,
         get_wish_reward/1,
         get_ask_exp_ratio/1,
         get_unit_pos/1,
         get_lantern_unit/1,
         get_box/0,
         get_pop/0]).

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

-file("src/data/camp_mid_autumn_data.erl", 23).

-file("inc/var.hrl", 1).

-record(m_var,
        {ver = 1,
         last_reset_time = 0 :: non_neg_integer(),
         last_reset_five_time = 0,
         last_reset_week_five_time = 0,
         day_vars = [] :: [tuple()],
         day_five_vars = [] :: [tuple()],
         week_five_vars = [],
         last_acc_time = 0,
         acc_time = 0,
         acc_vars = [] :: [tuple()],
         other_vars = [] :: [tuple()]}).

-record(role_var,
        {id = {0, "", 0} :: tuple(),
         ver = 1,
         last_reset_time = 0 :: non_neg_integer(),
         day_vars = [] :: [tuple()],
         forever_vars = [] :: [tuple()],
         last_reset_five_time = 0,
         last_reset_week_five_time = 0,
         day_five_vars = [] :: [tuple()],
         week_five_vars = []}).

-file("src/data/camp_mid_autumn_data.erl", 24).

get_reward(1) ->
    #{type => 1, exp_mod => 3333, reward => [],
      drop_id => 74130};
get_reward(2) ->
    #{type => 2, exp_mod => 3333, reward => [],
      drop_id => 74130};
get_reward(_) -> [].

get_meeting_info(1) ->
    #{wave => 1, rf_rate => 1200, wave_drop => 0};
get_meeting_info(2) ->
    #{wave => 2, rf_rate => 850, wave_drop => 0};
get_meeting_info(3) ->
    #{wave => 3, rf_rate => 700, wave_drop => 0};
get_meeting_info(4) ->
    #{wave => 4, rf_rate => 600, wave_drop => 0};
get_meeting_info(5) ->
    #{wave => 5, rf_rate => 600, wave_drop => 0};
get_meeting_info(6) ->
    #{wave => 6, rf_rate => 500, wave_drop => 0};
get_meeting_info(7) ->
    #{wave => 7, rf_rate => 0, wave_drop => 74131};
get_meeting_info(_) -> false.

get_wish_exp(WishVal) when WishVal =< 179 -> 3334;
get_wish_exp(WishVal) when WishVal =< 349 -> 3335;
get_wish_exp(WishVal) when WishVal =< 599 -> 3336;
get_wish_exp(WishVal) when WishVal =< 899 -> 3337;
get_wish_exp(WishVal) when WishVal =< 10000 -> 3338;
get_wish_exp(_) -> false.

get_fly_reward(1) -> {600, [{23592, 0, 1}]};
get_fly_reward(2) -> {1500, [{23593, 0, 1}]};
get_fly_reward(3) -> {2800, [{23595, 0, 1}]};
get_fly_reward(_) -> false.

get_wish_reward(1) -> 74132;
get_wish_reward(2) -> 74133;
get_wish_reward(_) -> false.

get_count_rate(Hour) ->
    case Hour of
        10 -> 400;
        11 -> 400;
        12 -> 500;
        13 -> 500;
        14 -> 400;
        15 -> 400;
        16 -> 400;
        17 -> 500;
        18 -> 500;
        _ -> 400
    end.

get_ask_exp_ratio(JoinTimes) when JoinTimes =< 5 ->
    1000;
get_ask_exp_ratio(JoinTimes) when JoinTimes =< 10 ->
    400;
get_ask_exp_ratio(JoinTimes) when JoinTimes =< 10000 ->
    100.

get_unit_pos(1) ->
    #{next_pos => 2, stay_time => 12500, is_throw => 0,
      effect_id => 20152,
      content_1 => lang:get("皎月兔可是仙兔，来自天上的月宫哦{face_1, 25}"),
      content_2 => "{face_1,25}", content_3 => "{face_1,25}",
      pos_x_1 => 1875, pos_y_1 => 1426, pos_x_2 => 2018,
      pos_y_2 => 1343, pos_x_3 => 1839, pos_y_3 => 1272,
      pos_x_4 => 2080, pos_y_4 => 1179, pos_x_5 => 1900,
      pos_y_5 => 1105};
get_unit_pos(2) ->
    #{next_pos => 3, stay_time => 12500, is_throw => 0,
      effect_id => 0, content_1 => "", content_2 => "",
      content_3 => "", pos_x_1 => 1644, pos_y_1 => 1615,
      pos_x_2 => 1807, pos_y_2 => 1588, pos_x_3 => 1685,
      pos_y_3 => 1448, pos_x_4 => 1934, pos_y_4 => 1473,
      pos_x_5 => 1815, pos_y_5 => 1330};
get_unit_pos(3) ->
    #{next_pos => 4, stay_time => 12500, is_throw => 0,
      effect_id => 30074,
      content_1 => lang:get("每年农历八月十五日，是传统的中秋佳节{face_1, 1}"),
      content_2 => "{face_1,1}", content_3 => "",
      pos_x_1 => 1340, pos_y_1 => 1706, pos_x_2 => 1512,
      pos_y_2 => 1746, pos_x_3 => 1439, pos_y_3 => 1574,
      pos_x_4 => 1682, pos_y_4 => 1689, pos_x_5 => 1621,
      pos_y_5 => 1500};
get_unit_pos(4) ->
    #{next_pos => 5, stay_time => 12500, is_throw => 0,
      effect_id => 0, content_1 => "", content_2 => "",
      content_3 => "", pos_x_1 => 1023, pos_y_1 => 1703,
      pos_x_2 => 1153, pos_y_2 => 1796, pos_x_3 => 1164,
      pos_y_3 => 1609, pos_x_4 => 1335, pos_y_4 => 1811,
      pos_x_5 => 1345, pos_y_5 => 1618};
get_unit_pos(5) ->
    #{next_pos => 6, stay_time => 12500, is_throw => 0,
      effect_id => 0,
      content_1 =>
          lang:get("八月十五的月亮比其他几个月的满月更圆，更明亮{face_1, 7}"),
      content_2 => "", content_3 => "{face_1,7}",
      pos_x_1 => 777, pos_y_1 => 1594, pos_x_2 => 864,
      pos_y_2 => 1723, pos_x_3 => 926, pos_y_3 => 1547,
      pos_x_4 => 1028, pos_y_4 => 1793, pos_x_5 => 1096,
      pos_y_5 => 1615};
get_unit_pos(6) ->
    #{next_pos => 7, stay_time => 12500, is_throw => 0,
      effect_id => 0, content_1 => "", content_2 => "",
      content_3 => "", pos_x_1 => 604, pos_y_1 => 1363,
      pos_x_2 => 611, pos_y_2 => 1530, pos_x_3 => 730,
      pos_y_3 => 1486, pos_x_4 => 708, pos_y_4 => 1671,
      pos_x_5 => 850, pos_y_5 => 1574};
get_unit_pos(7) ->
    #{next_pos => 8, stay_time => 12500, is_throw => 0,
      effect_id => 30074,
      content_1 =>
          lang:get("此夜，人们仰望天空如玉如盘的朗朗明月，自然会期盼家人团聚{face_1, "
                   "34}"),
      content_2 => "{face_1,34}", content_3 => "",
      pos_x_1 => 495, pos_y_1 => 1040, pos_x_2 => 460,
      pos_y_2 => 1207, pos_x_3 => 604, pos_y_3 => 1154,
      pos_x_4 => 531, pos_y_4 => 1369, pos_x_5 => 650,
      pos_y_5 => 1336};
get_unit_pos(8) ->
    #{next_pos => 9, stay_time => 12500, is_throw => 0,
      effect_id => 0, content_1 => "", content_2 => "",
      content_3 => "", pos_x_1 => 466, pos_y_1 => 756,
      pos_x_2 => 372, pos_y_2 => 905, pos_x_3 => 551,
      pos_y_3 => 873, pos_x_4 => 401, pos_y_4 => 1077,
      pos_x_5 => 562, pos_y_5 => 1058};
get_unit_pos(9) ->
    #{next_pos => 10, stay_time => 12500, is_throw => 0,
      effect_id => 0,
      content_1 =>
          lang:get("远在他乡的游子，也借此寄托自己对故乡和亲人的思念之情{face_1, 21}"),
      content_2 => "", content_3 => "{face_1,21}",
      pos_x_1 => 648, pos_y_1 => 480, pos_x_2 => 489,
      pos_y_2 => 544, pos_x_3 => 650, pos_y_3 => 618,
      pos_x_4 => 414, pos_y_4 => 700, pos_x_5 => 560,
      pos_y_5 => 794};
get_unit_pos(10) ->
    #{next_pos => 11, stay_time => 12500, is_throw => 0,
      effect_id => 0, content_1 => "", content_2 => "",
      content_3 => "", pos_x_1 => 928, pos_y_1 => 348,
      pos_x_2 => 773, pos_y_2 => 301, pos_x_3 => 835,
      pos_y_3 => 466, pos_x_4 => 601, pos_y_4 => 354,
      pos_x_5 => 665, pos_y_5 => 542};
get_unit_pos(11) ->
    #{next_pos => 12, stay_time => 12500, is_throw => 0,
      effect_id => 0,
      content_1 => lang:get("所以，中秋又称“团圆节”{face_1, 7}"),
      content_2 => "{face_1,7}", content_3 => "",
      pos_x_1 => 1278, pos_y_1 => 357, pos_x_2 => 1148,
      pos_y_2 => 255, pos_x_3 => 1155, pos_y_3 => 436,
      pos_x_4 => 966, pos_y_4 => 260, pos_x_5 => 970,
      pos_y_5 => 451};
get_unit_pos(12) ->
    #{next_pos => 13, stay_time => 12500, is_throw => 0,
      effect_id => 20152, content_1 => "", content_2 => "",
      content_3 => "", pos_x_1 => 1621, pos_y_1 => 372,
      pos_x_2 => 1502, pos_y_2 => 262, pos_x_3 => 1469,
      pos_y_3 => 448, pos_x_4 => 1317, pos_y_4 => 242,
      pos_x_5 => 1293, pos_y_5 => 422};
get_unit_pos(13) ->
    #{next_pos => 14, stay_time => 12500, is_throw => 0,
      effect_id => 0,
      content_1 =>
          lang:get("很久很久之前，它是一只普通的兔子，和嫦娥在人间快乐的生活着{face_1, 2}"),
      content_2 => "", content_3 => "{face_1,2}",
      pos_x_1 => 1856, pos_y_1 => 559, pos_x_2 => 1822,
      pos_y_2 => 387, pos_x_3 => 1718, pos_y_3 => 527,
      pos_x_4 => 1674, pos_y_4 => 288, pos_x_5 => 1565,
      pos_y_5 => 445};
get_unit_pos(14) ->
    #{next_pos => 15, stay_time => 12500, is_throw => 0,
      effect_id => 0, content_1 => "", content_2 => "",
      content_3 => "", pos_x_1 => 1990, pos_y_1 => 809,
      pos_x_2 => 2023, pos_y_2 => 658, pos_x_3 => 1911,
      pos_y_3 => 756, pos_x_4 => 1921, pos_y_4 => 505,
      pos_x_5 => 1773, pos_y_5 => 577};
get_unit_pos(15) ->
    #{next_pos => 16, stay_time => 25000, is_throw => 0,
      effect_id => 0,
      content_1 =>
          lang:get("直到有一天，有一个坏人要来抢嫦娥和后羿保管的长生不老药{face_1, "
                   "12}"),
      content_2 => "{face_1,12}", content_3 => "",
      pos_x_1 => 1964, pos_y_1 => 1140, pos_x_2 => 2096,
      pos_y_2 => 1038, pos_x_3 => 1949, pos_y_3 => 987,
      pos_x_4 => 2109, pos_y_4 => 856, pos_x_5 => 1964,
      pos_y_5 => 814};
get_unit_pos(16) ->
    #{next_pos => 17, stay_time => 12500, is_throw => 0,
      effect_id => 0,
      content_1 =>
          lang:get("危急之时嫦娥当机立断，吃下了长生不老药抱起皎月兔飞升成仙{face_1, "
                   "41}"),
      content_2 => "", content_3 => "", pos_x_1 => 1875,
      pos_y_1 => 1426, pos_x_2 => 2018, pos_y_2 => 1343,
      pos_x_3 => 1839, pos_y_3 => 1272, pos_x_4 => 2080,
      pos_y_4 => 1179, pos_x_5 => 1900, pos_y_5 => 1105};
get_unit_pos(17) ->
    #{next_pos => 18, stay_time => 12500, is_throw => 0,
      effect_id => 0, content_1 => "", content_2 => "",
      content_3 => "", pos_x_1 => 1644, pos_y_1 => 1615,
      pos_x_2 => 1807, pos_y_2 => 1588, pos_x_3 => 1685,
      pos_y_3 => 1448, pos_x_4 => 1934, pos_y_4 => 1473,
      pos_x_5 => 1815, pos_y_5 => 1330};
get_unit_pos(18) ->
    #{next_pos => 19, stay_time => 12500, is_throw => 0,
      effect_id => 0,
      content_1 =>
          lang:get("但是嫦娥牵挂着丈夫，便飞落到离人间最近的月亮上成了仙{face_1, 3}"),
      content_2 => "{face_1,3}", content_3 => "",
      pos_x_1 => 1340, pos_y_1 => 1706, pos_x_2 => 1512,
      pos_y_2 => 1746, pos_x_3 => 1439, pos_y_3 => 1574,
      pos_x_4 => 1682, pos_y_4 => 1689, pos_x_5 => 1621,
      pos_y_5 => 1500};
get_unit_pos(19) ->
    #{next_pos => 20, stay_time => 12500, is_throw => 0,
      effect_id => 0, content_1 => "", content_2 => "",
      content_3 => "", pos_x_1 => 1023, pos_y_1 => 1703,
      pos_x_2 => 1153, pos_y_2 => 1796, pos_x_3 => 1164,
      pos_y_3 => 1609, pos_x_4 => 1335, pos_y_4 => 1811,
      pos_x_5 => 1345, pos_y_5 => 1618};
get_unit_pos(20) ->
    #{next_pos => 21, stay_time => 12500, is_throw => 0,
      effect_id => 0,
      content_1 =>
          lang:get("皎月兔也飞升成了仙兔，他最喜欢主人和他的月野车{face_1, 34}"),
      content_2 => "", content_3 => "{face_1,25}",
      pos_x_1 => 777, pos_y_1 => 1594, pos_x_2 => 864,
      pos_y_2 => 1723, pos_x_3 => 926, pos_y_3 => 1547,
      pos_x_4 => 1028, pos_y_4 => 1793, pos_x_5 => 1096,
      pos_y_5 => 1615};
get_unit_pos(21) ->
    #{next_pos => 22, stay_time => 12500, is_throw => 0,
      effect_id => 0, content_1 => "", content_2 => "",
      content_3 => "", pos_x_1 => 604, pos_y_1 => 1363,
      pos_x_2 => 611, pos_y_2 => 1530, pos_x_3 => 730,
      pos_y_3 => 1486, pos_x_4 => 708, pos_y_4 => 1671,
      pos_x_5 => 850, pos_y_5 => 1574};
get_unit_pos(22) ->
    #{next_pos => 23, stay_time => 12500, is_throw => 1,
      effect_id => 30075, content_1 => "", content_2 => "",
      content_3 => "{face_1,1}", pos_x_1 => 495,
      pos_y_1 => 1040, pos_x_2 => 460, pos_y_2 => 1207,
      pos_x_3 => 604, pos_y_3 => 1154, pos_x_4 => 531,
      pos_y_4 => 1369, pos_x_5 => 650, pos_y_5 => 1336};
get_unit_pos(23) ->
    #{next_pos => 24, stay_time => 12500, is_throw => 0,
      effect_id => 0, content_1 => "", content_2 => "",
      content_3 => "", pos_x_1 => 466, pos_y_1 => 756,
      pos_x_2 => 372, pos_y_2 => 905, pos_x_3 => 551,
      pos_y_3 => 873, pos_x_4 => 401, pos_y_4 => 1077,
      pos_x_5 => 562, pos_y_5 => 1058};
get_unit_pos(24) ->
    #{next_pos => 25, stay_time => 12500, is_throw => 0,
      effect_id => 0,
      content_1 => lang:get("每年农历八月十五日，是传统的中秋佳节{face_1, 1}"),
      content_2 => "{face_1,7}", content_3 => "",
      pos_x_1 => 648, pos_y_1 => 480, pos_x_2 => 489,
      pos_y_2 => 544, pos_x_3 => 650, pos_y_3 => 618,
      pos_x_4 => 414, pos_y_4 => 700, pos_x_5 => 560,
      pos_y_5 => 794};
get_unit_pos(25) ->
    #{next_pos => 26, stay_time => 12500, is_throw => 0,
      effect_id => 0, content_1 => "", content_2 => "",
      content_3 => "", pos_x_1 => 928, pos_y_1 => 348,
      pos_x_2 => 773, pos_y_2 => 301, pos_x_3 => 835,
      pos_y_3 => 466, pos_x_4 => 601, pos_y_4 => 354,
      pos_x_5 => 665, pos_y_5 => 542};
get_unit_pos(26) ->
    #{next_pos => 27, stay_time => 12500, is_throw => 0,
      effect_id => 0,
      content_1 =>
          lang:get("八月十五的月亮比其他几个月的满月更圆，更明亮{face_1, 7}"),
      content_2 => "{face_1,34}", content_3 => "",
      pos_x_1 => 1278, pos_y_1 => 357, pos_x_2 => 1148,
      pos_y_2 => 255, pos_x_3 => 1155, pos_y_3 => 436,
      pos_x_4 => 966, pos_y_4 => 260, pos_x_5 => 970,
      pos_y_5 => 451};
get_unit_pos(27) ->
    #{next_pos => 28, stay_time => 12500, is_throw => 0,
      effect_id => 0, content_1 => "", content_2 => "",
      content_3 => "", pos_x_1 => 1621, pos_y_1 => 372,
      pos_x_2 => 1502, pos_y_2 => 262, pos_x_3 => 1469,
      pos_y_3 => 448, pos_x_4 => 1317, pos_y_4 => 242,
      pos_x_5 => 1293, pos_y_5 => 422};
get_unit_pos(28) ->
    #{next_pos => 29, stay_time => 12500, is_throw => 0,
      effect_id => 0,
      content_1 =>
          lang:get("此夜，人们仰望天空如玉如盘的朗朗明月，自然会期盼家人团聚{face_1, "
                   "34}"),
      content_2 => "", content_3 => "{face_1,21}",
      pos_x_1 => 1856, pos_y_1 => 559, pos_x_2 => 1822,
      pos_y_2 => 387, pos_x_3 => 1718, pos_y_3 => 527,
      pos_x_4 => 1674, pos_y_4 => 288, pos_x_5 => 1565,
      pos_y_5 => 445};
get_unit_pos(29) ->
    #{next_pos => 30, stay_time => 12500, is_throw => 0,
      effect_id => 0, content_1 => "", content_2 => "",
      content_3 => "", pos_x_1 => 1990, pos_y_1 => 809,
      pos_x_2 => 2023, pos_y_2 => 658, pos_x_3 => 1911,
      pos_y_3 => 756, pos_x_4 => 1921, pos_y_4 => 505,
      pos_x_5 => 1773, pos_y_5 => 577};
get_unit_pos(30) ->
    #{next_pos => 31, stay_time => 25000, is_throw => 0,
      effect_id => 0,
      content_1 =>
          lang:get("远在他乡的游子，也借此寄托自己对故乡和亲人的思念之情{face_1, 21}"),
      content_2 => "", content_3 => "{face_1,7}",
      pos_x_1 => 1964, pos_y_1 => 1140, pos_x_2 => 2096,
      pos_y_2 => 1038, pos_x_3 => 1949, pos_y_3 => 987,
      pos_x_4 => 2109, pos_y_4 => 856, pos_x_5 => 1964,
      pos_y_5 => 814};
get_unit_pos(31) ->
    #{next_pos => 32, stay_time => 12500, is_throw => 0,
      effect_id => 20152,
      content_1 => lang:get("所以，中秋又称“团圆节”{face_1, 7}"),
      content_2 => "{face_1,2}", content_3 => "",
      pos_x_1 => 1875, pos_y_1 => 1426, pos_x_2 => 2018,
      pos_y_2 => 1343, pos_x_3 => 1839, pos_y_3 => 1272,
      pos_x_4 => 2080, pos_y_4 => 1179, pos_x_5 => 1900,
      pos_y_5 => 1105};
get_unit_pos(32) ->
    #{next_pos => 33, stay_time => 12500, is_throw => 0,
      effect_id => 0, content_1 => "", content_2 => "",
      content_3 => "", pos_x_1 => 1644, pos_y_1 => 1615,
      pos_x_2 => 1807, pos_y_2 => 1588, pos_x_3 => 1685,
      pos_y_3 => 1448, pos_x_4 => 1934, pos_y_4 => 1473,
      pos_x_5 => 1815, pos_y_5 => 1330};
get_unit_pos(33) ->
    #{next_pos => 34, stay_time => 12500, is_throw => 0,
      effect_id => 0,
      content_1 =>
          lang:get("很久很久之前，它是一只普通的兔子，和嫦娥在人间快乐的生活着{face_1, 2}"),
      content_2 => "{face_1,12}", content_3 => "",
      pos_x_1 => 1340, pos_y_1 => 1706, pos_x_2 => 1512,
      pos_y_2 => 1746, pos_x_3 => 1439, pos_y_3 => 1574,
      pos_x_4 => 1682, pos_y_4 => 1689, pos_x_5 => 1621,
      pos_y_5 => 1500};
get_unit_pos(34) ->
    #{next_pos => 35, stay_time => 12500, is_throw => 0,
      effect_id => 0, content_1 => "", content_2 => "",
      content_3 => "", pos_x_1 => 1023, pos_y_1 => 1703,
      pos_x_2 => 1153, pos_y_2 => 1796, pos_x_3 => 1164,
      pos_y_3 => 1609, pos_x_4 => 1335, pos_y_4 => 1811,
      pos_x_5 => 1345, pos_y_5 => 1618};
get_unit_pos(35) ->
    #{next_pos => 36, stay_time => 12500, is_throw => 0,
      effect_id => 0,
      content_1 =>
          lang:get("直到有一天，有一个坏人要来抢嫦娥和后羿保管的长生不老药{face_1, "
                   "12}"),
      content_2 => "{face_1,41}", content_3 => "",
      pos_x_1 => 777, pos_y_1 => 1594, pos_x_2 => 864,
      pos_y_2 => 1723, pos_x_3 => 926, pos_y_3 => 1547,
      pos_x_4 => 1028, pos_y_4 => 1793, pos_x_5 => 1096,
      pos_y_5 => 1615};
get_unit_pos(36) ->
    #{next_pos => 37, stay_time => 12500, is_throw => 0,
      effect_id => 0, content_1 => "", content_2 => "",
      content_3 => "", pos_x_1 => 604, pos_y_1 => 1363,
      pos_x_2 => 611, pos_y_2 => 1530, pos_x_3 => 730,
      pos_y_3 => 1486, pos_x_4 => 708, pos_y_4 => 1671,
      pos_x_5 => 850, pos_y_5 => 1574};
get_unit_pos(37) ->
    #{next_pos => 38, stay_time => 12500, is_throw => 0,
      effect_id => 0,
      content_1 =>
          lang:get("危急之时嫦娥当机立断，吃下了长生不老药抱起皎月兔飞升成仙{face_1, "
                   "41}"),
      content_2 => "", content_3 => "{face_1,3}",
      pos_x_1 => 495, pos_y_1 => 1040, pos_x_2 => 460,
      pos_y_2 => 1207, pos_x_3 => 604, pos_y_3 => 1154,
      pos_x_4 => 531, pos_y_4 => 1369, pos_x_5 => 650,
      pos_y_5 => 1336};
get_unit_pos(38) ->
    #{next_pos => 39, stay_time => 12500, is_throw => 0,
      effect_id => 0, content_1 => "", content_2 => "",
      content_3 => "", pos_x_1 => 466, pos_y_1 => 756,
      pos_x_2 => 372, pos_y_2 => 905, pos_x_3 => 551,
      pos_y_3 => 873, pos_x_4 => 401, pos_y_4 => 1077,
      pos_x_5 => 562, pos_y_5 => 1058};
get_unit_pos(39) ->
    #{next_pos => 40, stay_time => 12500, is_throw => 0,
      effect_id => 0,
      content_1 =>
          lang:get("但是嫦娥牵挂着丈夫，便飞落到离人间最近的月亮上成了仙{face_1, 3}"),
      content_2 => "", content_3 => "{face_1,25}",
      pos_x_1 => 648, pos_y_1 => 480, pos_x_2 => 489,
      pos_y_2 => 544, pos_x_3 => 650, pos_y_3 => 618,
      pos_x_4 => 414, pos_y_4 => 700, pos_x_5 => 560,
      pos_y_5 => 794};
get_unit_pos(40) ->
    #{next_pos => 41, stay_time => 12500, is_throw => 0,
      effect_id => 0, content_1 => "", content_2 => "",
      content_3 => "", pos_x_1 => 928, pos_y_1 => 348,
      pos_x_2 => 773, pos_y_2 => 301, pos_x_3 => 835,
      pos_y_3 => 466, pos_x_4 => 601, pos_y_4 => 354,
      pos_x_5 => 665, pos_y_5 => 542};
get_unit_pos(41) ->
    #{next_pos => 42, stay_time => 12500, is_throw => 0,
      effect_id => 0,
      content_1 =>
          lang:get("皎月兔也飞升成了仙兔，他最喜欢主人和他的月野车{face_1, 34}"),
      content_2 => "", content_3 => "{face_1,1}",
      pos_x_1 => 1278, pos_y_1 => 357, pos_x_2 => 1148,
      pos_y_2 => 255, pos_x_3 => 1155, pos_y_3 => 436,
      pos_x_4 => 966, pos_y_4 => 260, pos_x_5 => 970,
      pos_y_5 => 451};
get_unit_pos(42) ->
    #{next_pos => 43, stay_time => 12500, is_throw => 0,
      effect_id => 0, content_1 => "", content_2 => "",
      content_3 => "", pos_x_1 => 1621, pos_y_1 => 372,
      pos_x_2 => 1502, pos_y_2 => 262, pos_x_3 => 1469,
      pos_y_3 => 448, pos_x_4 => 1317, pos_y_4 => 242,
      pos_x_5 => 1293, pos_y_5 => 422};
get_unit_pos(43) ->
    #{next_pos => 44, stay_time => 12500, is_throw => 0,
      effect_id => 30075,
      content_1 => lang:get("皎月兔可是仙兔，来自天上的月宫哦{face_1, 25}"),
      content_2 => "{face_1,7}", content_3 => "",
      pos_x_1 => 1856, pos_y_1 => 559, pos_x_2 => 1822,
      pos_y_2 => 387, pos_x_3 => 1718, pos_y_3 => 527,
      pos_x_4 => 1674, pos_y_4 => 288, pos_x_5 => 1565,
      pos_y_5 => 445};
get_unit_pos(44) ->
    #{next_pos => 45, stay_time => 12500, is_throw => 0,
      effect_id => 0, content_1 => "", content_2 => "",
      content_3 => "", pos_x_1 => 1990, pos_y_1 => 809,
      pos_x_2 => 2023, pos_y_2 => 658, pos_x_3 => 1911,
      pos_y_3 => 756, pos_x_4 => 1921, pos_y_4 => 505,
      pos_x_5 => 1773, pos_y_5 => 577};
get_unit_pos(45) ->
    #{next_pos => 46, stay_time => 25000, is_throw => 0,
      effect_id => 0,
      content_1 => lang:get("每年农历八月十五日，是传统的中秋佳节{face_1, 1}"),
      content_2 => "{face_1,34}", content_3 => "",
      pos_x_1 => 1964, pos_y_1 => 1140, pos_x_2 => 2096,
      pos_y_2 => 1038, pos_x_3 => 1949, pos_y_3 => 987,
      pos_x_4 => 2109, pos_y_4 => 856, pos_x_5 => 1964,
      pos_y_5 => 814};
get_unit_pos(46) ->
    #{next_pos => 47, stay_time => 12500, is_throw => 0,
      effect_id => 0,
      content_1 =>
          lang:get("八月十五的月亮比其他几个月的满月更圆，更明亮{face_1, 7}"),
      content_2 => "{face_1,21}", content_3 => "",
      pos_x_1 => 1875, pos_y_1 => 1426, pos_x_2 => 2018,
      pos_y_2 => 1343, pos_x_3 => 1839, pos_y_3 => 1272,
      pos_x_4 => 2080, pos_y_4 => 1179, pos_x_5 => 1900,
      pos_y_5 => 1105};
get_unit_pos(47) ->
    #{next_pos => 48, stay_time => 12500, is_throw => 0,
      effect_id => 0, content_1 => "", content_2 => "",
      content_3 => "", pos_x_1 => 1644, pos_y_1 => 1615,
      pos_x_2 => 1807, pos_y_2 => 1588, pos_x_3 => 1685,
      pos_y_3 => 1448, pos_x_4 => 1934, pos_y_4 => 1473,
      pos_x_5 => 1815, pos_y_5 => 1330};
get_unit_pos(48) ->
    #{next_pos => 49, stay_time => 12500, is_throw => 0,
      effect_id => 0,
      content_1 =>
          lang:get("此夜，人们仰望天空如玉如盘的朗朗明月，自然会期盼家人团聚{face_1, "
                   "34}"),
      content_2 => "", content_3 => "{face_1,7}",
      pos_x_1 => 1340, pos_y_1 => 1706, pos_x_2 => 1512,
      pos_y_2 => 1746, pos_x_3 => 1439, pos_y_3 => 1574,
      pos_x_4 => 1682, pos_y_4 => 1689, pos_x_5 => 1621,
      pos_y_5 => 1500};
get_unit_pos(49) ->
    #{next_pos => 50, stay_time => 12500, is_throw => 0,
      effect_id => 0, content_1 => "", content_2 => "",
      content_3 => "", pos_x_1 => 1023, pos_y_1 => 1703,
      pos_x_2 => 1153, pos_y_2 => 1796, pos_x_3 => 1164,
      pos_y_3 => 1609, pos_x_4 => 1335, pos_y_4 => 1811,
      pos_x_5 => 1345, pos_y_5 => 1618};
get_unit_pos(50) ->
    #{next_pos => 51, stay_time => 12500, is_throw => 0,
      effect_id => 30074,
      content_1 =>
          lang:get("远在他乡的游子，也借此寄托自己对故乡和亲人的思念之情{face_1, 21}"),
      content_2 => "", content_3 => "{face_1,2}",
      pos_x_1 => 777, pos_y_1 => 1594, pos_x_2 => 864,
      pos_y_2 => 1723, pos_x_3 => 926, pos_y_3 => 1547,
      pos_x_4 => 1028, pos_y_4 => 1793, pos_x_5 => 1096,
      pos_y_5 => 1615};
get_unit_pos(51) ->
    #{next_pos => 52, stay_time => 12500, is_throw => 0,
      effect_id => 0, content_1 => "", content_2 => "",
      content_3 => "", pos_x_1 => 604, pos_y_1 => 1363,
      pos_x_2 => 611, pos_y_2 => 1530, pos_x_3 => 730,
      pos_y_3 => 1486, pos_x_4 => 708, pos_y_4 => 1671,
      pos_x_5 => 850, pos_y_5 => 1574};
get_unit_pos(52) ->
    #{next_pos => 53, stay_time => 12500, is_throw => 0,
      effect_id => 0,
      content_1 => lang:get("所以，中秋又称“团圆节”{face_1, 7}"),
      content_2 => "", content_3 => "{face_1,12}",
      pos_x_1 => 495, pos_y_1 => 1040, pos_x_2 => 460,
      pos_y_2 => 1207, pos_x_3 => 604, pos_y_3 => 1154,
      pos_x_4 => 531, pos_y_4 => 1369, pos_x_5 => 650,
      pos_y_5 => 1336};
get_unit_pos(53) ->
    #{next_pos => 54, stay_time => 12500, is_throw => 0,
      effect_id => 0, content_1 => "", content_2 => "",
      content_3 => "", pos_x_1 => 466, pos_y_1 => 756,
      pos_x_2 => 372, pos_y_2 => 905, pos_x_3 => 551,
      pos_y_3 => 873, pos_x_4 => 401, pos_y_4 => 1077,
      pos_x_5 => 562, pos_y_5 => 1058};
get_unit_pos(54) ->
    #{next_pos => 55, stay_time => 12500, is_throw => 0,
      effect_id => 0,
      content_1 =>
          lang:get("很久很久之前，它是一只普通的兔子，和嫦娥在人间快乐的生活着{face_1, 2}"),
      content_2 => "{face_1,41}", content_3 => "",
      pos_x_1 => 648, pos_y_1 => 480, pos_x_2 => 489,
      pos_y_2 => 544, pos_x_3 => 650, pos_y_3 => 618,
      pos_x_4 => 414, pos_y_4 => 700, pos_x_5 => 560,
      pos_y_5 => 794};
get_unit_pos(55) ->
    #{next_pos => 56, stay_time => 12500, is_throw => 0,
      effect_id => 0, content_1 => "", content_2 => "",
      content_3 => "", pos_x_1 => 928, pos_y_1 => 348,
      pos_x_2 => 773, pos_y_2 => 301, pos_x_3 => 835,
      pos_y_3 => 466, pos_x_4 => 601, pos_y_4 => 354,
      pos_x_5 => 665, pos_y_5 => 542};
get_unit_pos(56) ->
    #{next_pos => 57, stay_time => 12500, is_throw => 0,
      effect_id => 0,
      content_1 =>
          lang:get("直到有一天，有一个坏人要来抢嫦娥和后羿保管的长生不老药{face_1, "
                   "12}"),
      content_2 => "{face_1,3}", content_3 => "",
      pos_x_1 => 1278, pos_y_1 => 357, pos_x_2 => 1148,
      pos_y_2 => 255, pos_x_3 => 1155, pos_y_3 => 436,
      pos_x_4 => 966, pos_y_4 => 260, pos_x_5 => 970,
      pos_y_5 => 451};
get_unit_pos(57) ->
    #{next_pos => 58, stay_time => 12500, is_throw => 0,
      effect_id => 0, content_1 => "", content_2 => "",
      content_3 => "", pos_x_1 => 1621, pos_y_1 => 372,
      pos_x_2 => 1502, pos_y_2 => 262, pos_x_3 => 1469,
      pos_y_3 => 448, pos_x_4 => 1317, pos_y_4 => 242,
      pos_x_5 => 1293, pos_y_5 => 422};
get_unit_pos(58) ->
    #{next_pos => 59, stay_time => 12500, is_throw => 0,
      effect_id => 20152,
      content_1 =>
          lang:get("危急之时嫦娥当机立断，吃下了长生不老药抱起皎月兔飞升成仙{face_1, "
                   "41}"),
      content_2 => "{face_1,25}", content_3 => "",
      pos_x_1 => 1856, pos_y_1 => 559, pos_x_2 => 1822,
      pos_y_2 => 387, pos_x_3 => 1718, pos_y_3 => 527,
      pos_x_4 => 1674, pos_y_4 => 288, pos_x_5 => 1565,
      pos_y_5 => 445};
get_unit_pos(59) ->
    #{next_pos => 60, stay_time => 12500, is_throw => 0,
      effect_id => 0, content_1 => "", content_2 => "",
      content_3 => "", pos_x_1 => 1990, pos_y_1 => 809,
      pos_x_2 => 2023, pos_y_2 => 658, pos_x_3 => 1911,
      pos_y_3 => 756, pos_x_4 => 1921, pos_y_4 => 505,
      pos_x_5 => 1773, pos_y_5 => 577};
get_unit_pos(60) ->
    #{next_pos => 61, stay_time => 25000, is_throw => 0,
      effect_id => 0,
      content_1 =>
          lang:get("但是嫦娥牵挂着丈夫，便飞落到离人间最近的月亮上成了仙{face_1, 3}"),
      content_2 => "{face_1,1}", content_3 => "",
      pos_x_1 => 1964, pos_y_1 => 1140, pos_x_2 => 2096,
      pos_y_2 => 1038, pos_x_3 => 1949, pos_y_3 => 987,
      pos_x_4 => 2109, pos_y_4 => 856, pos_x_5 => 1964,
      pos_y_5 => 814};
get_unit_pos(61) ->
    #{next_pos => 62, stay_time => 12500, is_throw => 0,
      effect_id => 0,
      content_1 =>
          lang:get("皎月兔也飞升成了仙兔，他最喜欢主人和他的月野车{face_1, 34}"),
      content_2 => "", content_3 => "{face_1,7}",
      pos_x_1 => 1875, pos_y_1 => 1426, pos_x_2 => 2018,
      pos_y_2 => 1343, pos_x_3 => 1839, pos_y_3 => 1272,
      pos_x_4 => 2080, pos_y_4 => 1179, pos_x_5 => 1900,
      pos_y_5 => 1105};
get_unit_pos(62) ->
    #{next_pos => 63, stay_time => 12500, is_throw => 0,
      effect_id => 0, content_1 => "", content_2 => "",
      content_3 => "", pos_x_1 => 1644, pos_y_1 => 1615,
      pos_x_2 => 1807, pos_y_2 => 1588, pos_x_3 => 1685,
      pos_y_3 => 1448, pos_x_4 => 1934, pos_y_4 => 1473,
      pos_x_5 => 1815, pos_y_5 => 1330};
get_unit_pos(63) ->
    #{next_pos => 64, stay_time => 12500, is_throw => 0,
      effect_id => 0,
      content_1 => lang:get("每年农历八月十五日，是传统的中秋佳节{face_1, 1}"),
      content_2 => "", content_3 => "{face_1,34}",
      pos_x_1 => 1340, pos_y_1 => 1706, pos_x_2 => 1512,
      pos_y_2 => 1746, pos_x_3 => 1439, pos_y_3 => 1574,
      pos_x_4 => 1682, pos_y_4 => 1689, pos_x_5 => 1621,
      pos_y_5 => 1500};
get_unit_pos(64) ->
    #{next_pos => 65, stay_time => 12500, is_throw => 0,
      effect_id => 0, content_1 => "", content_2 => "",
      content_3 => "", pos_x_1 => 1023, pos_y_1 => 1703,
      pos_x_2 => 1153, pos_y_2 => 1796, pos_x_3 => 1164,
      pos_y_3 => 1609, pos_x_4 => 1335, pos_y_4 => 1811,
      pos_x_5 => 1345, pos_y_5 => 1618};
get_unit_pos(65) ->
    #{next_pos => 66, stay_time => 12500, is_throw => 0,
      effect_id => 0,
      content_1 =>
          lang:get("八月十五的月亮比其他几个月的满月更圆，更明亮{face_1, 7}"),
      content_2 => "", content_3 => "{face_1,21}",
      pos_x_1 => 777, pos_y_1 => 1594, pos_x_2 => 864,
      pos_y_2 => 1723, pos_x_3 => 926, pos_y_3 => 1547,
      pos_x_4 => 1028, pos_y_4 => 1793, pos_x_5 => 1096,
      pos_y_5 => 1615};
get_unit_pos(66) ->
    #{next_pos => 67, stay_time => 12500, is_throw => 0,
      effect_id => 0, content_1 => "", content_2 => "",
      content_3 => "", pos_x_1 => 604, pos_y_1 => 1363,
      pos_x_2 => 611, pos_y_2 => 1530, pos_x_3 => 730,
      pos_y_3 => 1486, pos_x_4 => 708, pos_y_4 => 1671,
      pos_x_5 => 850, pos_y_5 => 1574};
get_unit_pos(67) ->
    #{next_pos => 68, stay_time => 12500, is_throw => 1,
      effect_id => 30075, content_1 => "",
      content_2 => "{face_1,7}", content_3 => "",
      pos_x_1 => 495, pos_y_1 => 1040, pos_x_2 => 460,
      pos_y_2 => 1207, pos_x_3 => 604, pos_y_3 => 1154,
      pos_x_4 => 531, pos_y_4 => 1369, pos_x_5 => 650,
      pos_y_5 => 1336};
get_unit_pos(68) ->
    #{next_pos => 69, stay_time => 12500, is_throw => 0,
      effect_id => 0, content_1 => "", content_2 => "",
      content_3 => "", pos_x_1 => 466, pos_y_1 => 756,
      pos_x_2 => 372, pos_y_2 => 905, pos_x_3 => 551,
      pos_y_3 => 873, pos_x_4 => 401, pos_y_4 => 1077,
      pos_x_5 => 562, pos_y_5 => 1058};
get_unit_pos(69) ->
    #{next_pos => 70, stay_time => 12500, is_throw => 0,
      effect_id => 0,
      content_1 =>
          lang:get("此夜，人们仰望天空如玉如盘的朗朗明月，自然会期盼家人团聚{face_1, "
                   "34}"),
      content_2 => "{face_1,2}", content_3 => "",
      pos_x_1 => 648, pos_y_1 => 480, pos_x_2 => 489,
      pos_y_2 => 544, pos_x_3 => 650, pos_y_3 => 618,
      pos_x_4 => 414, pos_y_4 => 700, pos_x_5 => 560,
      pos_y_5 => 794};
get_unit_pos(70) ->
    #{next_pos => 71, stay_time => 12500, is_throw => 0,
      effect_id => 0, content_1 => "", content_2 => "",
      content_3 => "", pos_x_1 => 928, pos_y_1 => 348,
      pos_x_2 => 773, pos_y_2 => 301, pos_x_3 => 835,
      pos_y_3 => 466, pos_x_4 => 601, pos_y_4 => 354,
      pos_x_5 => 665, pos_y_5 => 542};
get_unit_pos(71) ->
    #{next_pos => 72, stay_time => 12500, is_throw => 0,
      effect_id => 0,
      content_1 =>
          lang:get("远在他乡的游子，也借此寄托自己对故乡和亲人的思念之情{face_1, 21}"),
      content_2 => "{face_1,12}", content_3 => "",
      pos_x_1 => 1278, pos_y_1 => 357, pos_x_2 => 1148,
      pos_y_2 => 255, pos_x_3 => 1155, pos_y_3 => 436,
      pos_x_4 => 966, pos_y_4 => 260, pos_x_5 => 970,
      pos_y_5 => 451};
get_unit_pos(72) ->
    #{next_pos => 73, stay_time => 12500, is_throw => 0,
      effect_id => 0, content_1 => "", content_2 => "",
      content_3 => "", pos_x_1 => 1621, pos_y_1 => 372,
      pos_x_2 => 1502, pos_y_2 => 262, pos_x_3 => 1469,
      pos_y_3 => 448, pos_x_4 => 1317, pos_y_4 => 242,
      pos_x_5 => 1293, pos_y_5 => 422};
get_unit_pos(73) ->
    #{next_pos => 74, stay_time => 12500, is_throw => 0,
      effect_id => 0,
      content_1 => lang:get("所以，中秋又称“团圆节”{face_1, 7}"),
      content_2 => "", content_3 => "{face_1,41}",
      pos_x_1 => 1856, pos_y_1 => 559, pos_x_2 => 1822,
      pos_y_2 => 387, pos_x_3 => 1718, pos_y_3 => 527,
      pos_x_4 => 1674, pos_y_4 => 288, pos_x_5 => 1565,
      pos_y_5 => 445};
get_unit_pos(74) ->
    #{next_pos => 75, stay_time => 12500, is_throw => 0,
      effect_id => 0, content_1 => "", content_2 => "",
      content_3 => "", pos_x_1 => 1990, pos_y_1 => 809,
      pos_x_2 => 2023, pos_y_2 => 658, pos_x_3 => 1911,
      pos_y_3 => 756, pos_x_4 => 1921, pos_y_4 => 505,
      pos_x_5 => 1773, pos_y_5 => 577};
get_unit_pos(75) ->
    #{next_pos => 76, stay_time => 25000, is_throw => 0,
      effect_id => 0,
      content_1 =>
          lang:get("很久很久之前，它是一只普通的兔子，和嫦娥在人间快乐的生活着{face_1, 2}"),
      content_2 => "", content_3 => "{face_1,3}",
      pos_x_1 => 1964, pos_y_1 => 1140, pos_x_2 => 2096,
      pos_y_2 => 1038, pos_x_3 => 1949, pos_y_3 => 987,
      pos_x_4 => 2109, pos_y_4 => 856, pos_x_5 => 1964,
      pos_y_5 => 814};
get_unit_pos(76) ->
    #{next_pos => 77, stay_time => 12500, is_throw => 0,
      effect_id => 30075,
      content_1 =>
          lang:get("直到有一天，有一个坏人要来抢嫦娥和后羿保管的长生不老药{face_1, "
                   "12}"),
      content_2 => "", content_3 => "{face_1,25}",
      pos_x_1 => 1875, pos_y_1 => 1426, pos_x_2 => 2018,
      pos_y_2 => 1343, pos_x_3 => 1839, pos_y_3 => 1272,
      pos_x_4 => 2080, pos_y_4 => 1179, pos_x_5 => 1900,
      pos_y_5 => 1105};
get_unit_pos(77) ->
    #{next_pos => 78, stay_time => 12500, is_throw => 0,
      effect_id => 0, content_1 => "", content_2 => "",
      content_3 => "", pos_x_1 => 1644, pos_y_1 => 1615,
      pos_x_2 => 1807, pos_y_2 => 1588, pos_x_3 => 1685,
      pos_y_3 => 1448, pos_x_4 => 1934, pos_y_4 => 1473,
      pos_x_5 => 1815, pos_y_5 => 1330};
get_unit_pos(78) ->
    #{next_pos => 79, stay_time => 12500, is_throw => 0,
      effect_id => 0,
      content_1 =>
          lang:get("危急之时嫦娥当机立断，吃下了长生不老药抱起皎月兔飞升成仙{face_1, "
                   "41}"),
      content_2 => "{face_1,1}", content_3 => "",
      pos_x_1 => 1340, pos_y_1 => 1706, pos_x_2 => 1512,
      pos_y_2 => 1746, pos_x_3 => 1439, pos_y_3 => 1574,
      pos_x_4 => 1682, pos_y_4 => 1689, pos_x_5 => 1621,
      pos_y_5 => 1500};
get_unit_pos(79) ->
    #{next_pos => 80, stay_time => 12500, is_throw => 0,
      effect_id => 0, content_1 => "", content_2 => "",
      content_3 => "", pos_x_1 => 1023, pos_y_1 => 1703,
      pos_x_2 => 1153, pos_y_2 => 1796, pos_x_3 => 1164,
      pos_y_3 => 1609, pos_x_4 => 1335, pos_y_4 => 1811,
      pos_x_5 => 1345, pos_y_5 => 1618};
get_unit_pos(80) ->
    #{next_pos => 81, stay_time => 12500, is_throw => 0,
      effect_id => 0,
      content_1 =>
          lang:get("但是嫦娥牵挂着丈夫，便飞落到离人间最近的月亮上成了仙{face_1, 3}"),
      content_2 => "{face_1,7}", content_3 => "",
      pos_x_1 => 777, pos_y_1 => 1594, pos_x_2 => 864,
      pos_y_2 => 1723, pos_x_3 => 926, pos_y_3 => 1547,
      pos_x_4 => 1028, pos_y_4 => 1793, pos_x_5 => 1096,
      pos_y_5 => 1615};
get_unit_pos(81) ->
    #{next_pos => 82, stay_time => 12500, is_throw => 0,
      effect_id => 0, content_1 => "", content_2 => "",
      content_3 => "", pos_x_1 => 604, pos_y_1 => 1363,
      pos_x_2 => 611, pos_y_2 => 1530, pos_x_3 => 730,
      pos_y_3 => 1486, pos_x_4 => 708, pos_y_4 => 1671,
      pos_x_5 => 850, pos_y_5 => 1574};
get_unit_pos(82) ->
    #{next_pos => 83, stay_time => 12500, is_throw => 0,
      effect_id => 0,
      content_1 =>
          lang:get("皎月兔也飞升成了仙兔，他最喜欢主人和他的月野车{face_1, 34}"),
      content_2 => "", content_3 => "{face_1,34}",
      pos_x_1 => 495, pos_y_1 => 1040, pos_x_2 => 460,
      pos_y_2 => 1207, pos_x_3 => 604, pos_y_3 => 1154,
      pos_x_4 => 531, pos_y_4 => 1369, pos_x_5 => 650,
      pos_y_5 => 1336};
get_unit_pos(83) ->
    #{next_pos => 84, stay_time => 12500, is_throw => 0,
      effect_id => 0, content_1 => "", content_2 => "",
      content_3 => "", pos_x_1 => 466, pos_y_1 => 756,
      pos_x_2 => 372, pos_y_2 => 905, pos_x_3 => 551,
      pos_y_3 => 873, pos_x_4 => 401, pos_y_4 => 1077,
      pos_x_5 => 562, pos_y_5 => 1058};
get_unit_pos(84) ->
    #{next_pos => 85, stay_time => 12500, is_throw => 0,
      effect_id => 30074,
      content_1 => lang:get("皎月兔可是仙兔，来自天上的月宫哦{face_1, 25}"),
      content_2 => "", content_3 => "{face_1,21}",
      pos_x_1 => 648, pos_y_1 => 480, pos_x_2 => 489,
      pos_y_2 => 544, pos_x_3 => 650, pos_y_3 => 618,
      pos_x_4 => 414, pos_y_4 => 700, pos_x_5 => 560,
      pos_y_5 => 794};
get_unit_pos(85) ->
    #{next_pos => 86, stay_time => 12500, is_throw => 0,
      effect_id => 0, content_1 => "", content_2 => "",
      content_3 => "", pos_x_1 => 928, pos_y_1 => 348,
      pos_x_2 => 773, pos_y_2 => 301, pos_x_3 => 835,
      pos_y_3 => 466, pos_x_4 => 601, pos_y_4 => 354,
      pos_x_5 => 665, pos_y_5 => 542};
get_unit_pos(86) ->
    #{next_pos => 87, stay_time => 12500, is_throw => 0,
      effect_id => 0,
      content_1 => lang:get("每年农历八月十五日，是传统的中秋佳节{face_1, 1}"),
      content_2 => "", content_3 => "{face_1,7}",
      pos_x_1 => 1278, pos_y_1 => 357, pos_x_2 => 1148,
      pos_y_2 => 255, pos_x_3 => 1155, pos_y_3 => 436,
      pos_x_4 => 966, pos_y_4 => 260, pos_x_5 => 970,
      pos_y_5 => 451};
get_unit_pos(87) ->
    #{next_pos => 88, stay_time => 12500, is_throw => 0,
      effect_id => 0, content_1 => "", content_2 => "",
      content_3 => "", pos_x_1 => 1621, pos_y_1 => 372,
      pos_x_2 => 1502, pos_y_2 => 262, pos_x_3 => 1469,
      pos_y_3 => 448, pos_x_4 => 1317, pos_y_4 => 242,
      pos_x_5 => 1293, pos_y_5 => 422};
get_unit_pos(88) ->
    #{next_pos => 89, stay_time => 12500, is_throw => 0,
      effect_id => 0,
      content_1 =>
          lang:get("八月十五的月亮比其他几个月的满月更圆，更明亮{face_1, 7}"),
      content_2 => "{face_1,2}", content_3 => "",
      pos_x_1 => 1856, pos_y_1 => 559, pos_x_2 => 1822,
      pos_y_2 => 387, pos_x_3 => 1718, pos_y_3 => 527,
      pos_x_4 => 1674, pos_y_4 => 288, pos_x_5 => 1565,
      pos_y_5 => 445};
get_unit_pos(89) ->
    #{next_pos => 90, stay_time => 12500, is_throw => 0,
      effect_id => 0, content_1 => "", content_2 => "",
      content_3 => "", pos_x_1 => 1990, pos_y_1 => 809,
      pos_x_2 => 2023, pos_y_2 => 658, pos_x_3 => 1911,
      pos_y_3 => 756, pos_x_4 => 1921, pos_y_4 => 505,
      pos_x_5 => 1773, pos_y_5 => 577};
get_unit_pos(90) ->
    #{next_pos => 91, stay_time => 25000, is_throw => 0,
      effect_id => 0,
      content_1 =>
          lang:get("此夜，人们仰望天空如玉如盘的朗朗明月，自然会期盼家人团聚{face_1, "
                   "34}"),
      content_2 => "{face_1,12}", content_3 => "",
      pos_x_1 => 1964, pos_y_1 => 1140, pos_x_2 => 2096,
      pos_y_2 => 1038, pos_x_3 => 1949, pos_y_3 => 987,
      pos_x_4 => 2109, pos_y_4 => 856, pos_x_5 => 1964,
      pos_y_5 => 814};
get_unit_pos(91) ->
    #{next_pos => 92, stay_time => 12500, is_throw => 0,
      effect_id => 0,
      content_1 =>
          lang:get("远在他乡的游子，也借此寄托自己对故乡和亲人的思念之情{face_1, 21}"),
      content_2 => "{face_1,41}", content_3 => "",
      pos_x_1 => 1875, pos_y_1 => 1426, pos_x_2 => 2018,
      pos_y_2 => 1343, pos_x_3 => 1839, pos_y_3 => 1272,
      pos_x_4 => 2080, pos_y_4 => 1179, pos_x_5 => 1900,
      pos_y_5 => 1105};
get_unit_pos(92) ->
    #{next_pos => 93, stay_time => 12500, is_throw => 0,
      effect_id => 20152, content_1 => "", content_2 => "",
      content_3 => "", pos_x_1 => 1644, pos_y_1 => 1615,
      pos_x_2 => 1807, pos_y_2 => 1588, pos_x_3 => 1685,
      pos_y_3 => 1448, pos_x_4 => 1934, pos_y_4 => 1473,
      pos_x_5 => 1815, pos_y_5 => 1330};
get_unit_pos(93) ->
    #{next_pos => 94, stay_time => 12500, is_throw => 0,
      effect_id => 0,
      content_1 => lang:get("所以，中秋又称“团圆节”{face_1, 7}"),
      content_2 => "", content_3 => "{face_1,3}",
      pos_x_1 => 1340, pos_y_1 => 1706, pos_x_2 => 1512,
      pos_y_2 => 1746, pos_x_3 => 1439, pos_y_3 => 1574,
      pos_x_4 => 1682, pos_y_4 => 1689, pos_x_5 => 1621,
      pos_y_5 => 1500};
get_unit_pos(94) ->
    #{next_pos => 95, stay_time => 12500, is_throw => 0,
      effect_id => 0, content_1 => "", content_2 => "",
      content_3 => "", pos_x_1 => 1023, pos_y_1 => 1703,
      pos_x_2 => 1153, pos_y_2 => 1796, pos_x_3 => 1164,
      pos_y_3 => 1609, pos_x_4 => 1335, pos_y_4 => 1811,
      pos_x_5 => 1345, pos_y_5 => 1618};
get_unit_pos(95) ->
    #{next_pos => 96, stay_time => 12500, is_throw => 0,
      effect_id => 0,
      content_1 =>
          lang:get("很久很久之前，它是一只普通的兔子，和嫦娥在人间快乐的生活着{face_1, 2}"),
      content_2 => "", content_3 => "{face_1,25}",
      pos_x_1 => 777, pos_y_1 => 1594, pos_x_2 => 864,
      pos_y_2 => 1723, pos_x_3 => 926, pos_y_3 => 1547,
      pos_x_4 => 1028, pos_y_4 => 1793, pos_x_5 => 1096,
      pos_y_5 => 1615};
get_unit_pos(96) ->
    #{next_pos => 97, stay_time => 12500, is_throw => 0,
      effect_id => 0, content_1 => "", content_2 => "",
      content_3 => "", pos_x_1 => 604, pos_y_1 => 1363,
      pos_x_2 => 611, pos_y_2 => 1530, pos_x_3 => 730,
      pos_y_3 => 1486, pos_x_4 => 708, pos_y_4 => 1671,
      pos_x_5 => 850, pos_y_5 => 1574};
get_unit_pos(97) ->
    #{next_pos => 98, stay_time => 12500, is_throw => 0,
      effect_id => 0,
      content_1 =>
          lang:get("直到有一天，有一个坏人要来抢嫦娥和后羿保管的长生不老药{face_1, "
                   "12}"),
      content_2 => "{face_1,1}", content_3 => "",
      pos_x_1 => 495, pos_y_1 => 1040, pos_x_2 => 460,
      pos_y_2 => 1207, pos_x_3 => 604, pos_y_3 => 1154,
      pos_x_4 => 531, pos_y_4 => 1369, pos_x_5 => 650,
      pos_y_5 => 1336};
get_unit_pos(98) ->
    #{next_pos => 99, stay_time => 12500, is_throw => 0,
      effect_id => 0, content_1 => "", content_2 => "",
      content_3 => "", pos_x_1 => 466, pos_y_1 => 756,
      pos_x_2 => 372, pos_y_2 => 905, pos_x_3 => 551,
      pos_y_3 => 873, pos_x_4 => 401, pos_y_4 => 1077,
      pos_x_5 => 562, pos_y_5 => 1058};
get_unit_pos(99) ->
    #{next_pos => 100, stay_time => 12500, is_throw => 0,
      effect_id => 0,
      content_1 =>
          lang:get("危急之时嫦娥当机立断，吃下了长生不老药抱起皎月兔飞升成仙{face_1, "
                   "41}"),
      content_2 => "{face_1,7}", content_3 => "",
      pos_x_1 => 648, pos_y_1 => 480, pos_x_2 => 489,
      pos_y_2 => 544, pos_x_3 => 650, pos_y_3 => 618,
      pos_x_4 => 414, pos_y_4 => 700, pos_x_5 => 560,
      pos_y_5 => 794};
get_unit_pos(100) ->
    #{next_pos => 101, stay_time => 12500, is_throw => 0,
      effect_id => 0, content_1 => "", content_2 => "",
      content_3 => "", pos_x_1 => 928, pos_y_1 => 348,
      pos_x_2 => 773, pos_y_2 => 301, pos_x_3 => 835,
      pos_y_3 => 466, pos_x_4 => 601, pos_y_4 => 354,
      pos_x_5 => 665, pos_y_5 => 542};
get_unit_pos(101) ->
    #{next_pos => 102, stay_time => 12500, is_throw => 0,
      effect_id => 30075,
      content_1 =>
          lang:get("但是嫦娥牵挂着丈夫，便飞落到离人间最近的月亮上成了仙{face_1, 3}"),
      content_2 => "", content_3 => "{face_1,34}",
      pos_x_1 => 1278, pos_y_1 => 357, pos_x_2 => 1148,
      pos_y_2 => 255, pos_x_3 => 1155, pos_y_3 => 436,
      pos_x_4 => 966, pos_y_4 => 260, pos_x_5 => 970,
      pos_y_5 => 451};
get_unit_pos(102) ->
    #{next_pos => 103, stay_time => 12500, is_throw => 0,
      effect_id => 0, content_1 => "", content_2 => "",
      content_3 => "", pos_x_1 => 1621, pos_y_1 => 372,
      pos_x_2 => 1502, pos_y_2 => 262, pos_x_3 => 1469,
      pos_y_3 => 448, pos_x_4 => 1317, pos_y_4 => 242,
      pos_x_5 => 1293, pos_y_5 => 422};
get_unit_pos(103) ->
    #{next_pos => 104, stay_time => 12500, is_throw => 0,
      effect_id => 0,
      content_1 =>
          lang:get("皎月兔也飞升成了仙兔，他最喜欢主人和他的月野车{face_1, 34}"),
      content_2 => "", content_3 => "{face_1,21}",
      pos_x_1 => 1856, pos_y_1 => 559, pos_x_2 => 1822,
      pos_y_2 => 387, pos_x_3 => 1718, pos_y_3 => 527,
      pos_x_4 => 1674, pos_y_4 => 288, pos_x_5 => 1565,
      pos_y_5 => 445};
get_unit_pos(104) ->
    #{next_pos => 105, stay_time => 12500, is_throw => 0,
      effect_id => 0, content_1 => "", content_2 => "",
      content_3 => "", pos_x_1 => 1990, pos_y_1 => 809,
      pos_x_2 => 2023, pos_y_2 => 658, pos_x_3 => 1911,
      pos_y_3 => 756, pos_x_4 => 1921, pos_y_4 => 505,
      pos_x_5 => 1773, pos_y_5 => 577};
get_unit_pos(105) ->
    #{next_pos => 106, stay_time => 25000, is_throw => 0,
      effect_id => 0,
      content_1 => lang:get("每年农历八月十五日，是传统的中秋佳节{face_1, 1}"),
      content_2 => "{face_1,7}", content_3 => "{face_1,7}",
      pos_x_1 => 1964, pos_y_1 => 1140, pos_x_2 => 2096,
      pos_y_2 => 1038, pos_x_3 => 1949, pos_y_3 => 987,
      pos_x_4 => 2109, pos_y_4 => 856, pos_x_5 => 1964,
      pos_y_5 => 814};
get_unit_pos(106) ->
    #{next_pos => 107, stay_time => 12500, is_throw => 0,
      effect_id => 0,
      content_1 =>
          lang:get("八月十五的月亮比其他几个月的满月更圆，更明亮{face_1, 7}"),
      content_2 => "{face_1,2}", content_3 => "{face_1,2}",
      pos_x_1 => 1875, pos_y_1 => 1426, pos_x_2 => 2018,
      pos_y_2 => 1343, pos_x_3 => 1839, pos_y_3 => 1272,
      pos_x_4 => 2080, pos_y_4 => 1179, pos_x_5 => 1900,
      pos_y_5 => 1105};
get_unit_pos(107) ->
    #{next_pos => 108, stay_time => 12500, is_throw => 0,
      effect_id => 0, content_1 => "", content_2 => "",
      content_3 => "", pos_x_1 => 1644, pos_y_1 => 1615,
      pos_x_2 => 1807, pos_y_2 => 1588, pos_x_3 => 1685,
      pos_y_3 => 1448, pos_x_4 => 1934, pos_y_4 => 1473,
      pos_x_5 => 1815, pos_y_5 => 1330};
get_unit_pos(108) ->
    #{next_pos => 109, stay_time => 12500, is_throw => 0,
      effect_id => 0,
      content_1 =>
          lang:get("此夜，人们仰望天空如玉如盘的朗朗明月，自然会期盼家人团聚{face_1, "
                   "34}"),
      content_2 => "", content_3 => "", pos_x_1 => 1340,
      pos_y_1 => 1706, pos_x_2 => 1512, pos_y_2 => 1746,
      pos_x_3 => 1439, pos_y_3 => 1574, pos_x_4 => 1682,
      pos_y_4 => 1689, pos_x_5 => 1621, pos_y_5 => 1500};
get_unit_pos(109) ->
    #{next_pos => 110, stay_time => 12500, is_throw => 0,
      effect_id => 0, content_1 => "", content_2 => "",
      content_3 => "", pos_x_1 => 1023, pos_y_1 => 1703,
      pos_x_2 => 1153, pos_y_2 => 1796, pos_x_3 => 1164,
      pos_y_3 => 1609, pos_x_4 => 1335, pos_y_4 => 1811,
      pos_x_5 => 1345, pos_y_5 => 1618};
get_unit_pos(110) ->
    #{next_pos => 111, stay_time => 12500, is_throw => 0,
      effect_id => 0,
      content_1 =>
          lang:get("远在他乡的游子，也借此寄托自己对故乡和亲人的思念之情{face_1, 21}"),
      content_2 => "", content_3 => "", pos_x_1 => 777,
      pos_y_1 => 1594, pos_x_2 => 864, pos_y_2 => 1723,
      pos_x_3 => 926, pos_y_3 => 1547, pos_x_4 => 1028,
      pos_y_4 => 1793, pos_x_5 => 1096, pos_y_5 => 1615};
get_unit_pos(111) ->
    #{next_pos => 112, stay_time => 12500, is_throw => 0,
      effect_id => 0, content_1 => "", content_2 => "",
      content_3 => "", pos_x_1 => 604, pos_y_1 => 1363,
      pos_x_2 => 611, pos_y_2 => 1530, pos_x_3 => 730,
      pos_y_3 => 1486, pos_x_4 => 708, pos_y_4 => 1671,
      pos_x_5 => 850, pos_y_5 => 1574};
get_unit_pos(112) ->
    #{next_pos => 113, stay_time => 12500, is_throw => 1,
      effect_id => 30075, content_1 => "",
      content_2 => "{face_1,3}", content_3 => "",
      pos_x_1 => 495, pos_y_1 => 1040, pos_x_2 => 460,
      pos_y_2 => 1207, pos_x_3 => 604, pos_y_3 => 1154,
      pos_x_4 => 531, pos_y_4 => 1369, pos_x_5 => 650,
      pos_y_5 => 1336};
get_unit_pos(113) ->
    #{next_pos => 114, stay_time => 12500, is_throw => 0,
      effect_id => 0, content_1 => "", content_2 => "",
      content_3 => "", pos_x_1 => 466, pos_y_1 => 756,
      pos_x_2 => 372, pos_y_2 => 905, pos_x_3 => 551,
      pos_y_3 => 873, pos_x_4 => 401, pos_y_4 => 1077,
      pos_x_5 => 562, pos_y_5 => 1058};
get_unit_pos(114) ->
    #{next_pos => 115, stay_time => 12500, is_throw => 0,
      effect_id => 0,
      content_1 => lang:get("所以，中秋又称“团圆节”{face_1, 7}"),
      content_2 => "{face_1,25}", content_3 => "",
      pos_x_1 => 648, pos_y_1 => 480, pos_x_2 => 489,
      pos_y_2 => 544, pos_x_3 => 650, pos_y_3 => 618,
      pos_x_4 => 414, pos_y_4 => 700, pos_x_5 => 560,
      pos_y_5 => 794};
get_unit_pos(115) ->
    #{next_pos => 116, stay_time => 12500, is_throw => 0,
      effect_id => 0, content_1 => "", content_2 => "",
      content_3 => "", pos_x_1 => 928, pos_y_1 => 348,
      pos_x_2 => 773, pos_y_2 => 301, pos_x_3 => 835,
      pos_y_3 => 466, pos_x_4 => 601, pos_y_4 => 354,
      pos_x_5 => 665, pos_y_5 => 542};
get_unit_pos(116) ->
    #{next_pos => 117, stay_time => 12500, is_throw => 0,
      effect_id => 0,
      content_1 =>
          lang:get("很久很久之前，它是一只普通的兔子，和嫦娥在人间快乐的生活着{face_1, 2}"),
      content_2 => "", content_3 => "{face_1,1}",
      pos_x_1 => 1278, pos_y_1 => 357, pos_x_2 => 1148,
      pos_y_2 => 255, pos_x_3 => 1155, pos_y_3 => 436,
      pos_x_4 => 966, pos_y_4 => 260, pos_x_5 => 970,
      pos_y_5 => 451};
get_unit_pos(117) ->
    #{next_pos => 118, stay_time => 12500, is_throw => 0,
      effect_id => 0, content_1 => "", content_2 => "",
      content_3 => "", pos_x_1 => 1621, pos_y_1 => 372,
      pos_x_2 => 1502, pos_y_2 => 262, pos_x_3 => 1469,
      pos_y_3 => 448, pos_x_4 => 1317, pos_y_4 => 242,
      pos_x_5 => 1293, pos_y_5 => 422};
get_unit_pos(118) ->
    #{next_pos => 119, stay_time => 12500, is_throw => 0,
      effect_id => 0,
      content_1 =>
          lang:get("直到有一天，有一个坏人要来抢嫦娥和后羿保管的长生不老药{face_1, "
                   "12}"),
      content_2 => "", content_3 => "{face_1,7}",
      pos_x_1 => 1856, pos_y_1 => 559, pos_x_2 => 1822,
      pos_y_2 => 387, pos_x_3 => 1718, pos_y_3 => 527,
      pos_x_4 => 1674, pos_y_4 => 288, pos_x_5 => 1565,
      pos_y_5 => 445};
get_unit_pos(119) ->
    #{next_pos => 120, stay_time => 12500, is_throw => 0,
      effect_id => 0, content_1 => "", content_2 => "",
      content_3 => "", pos_x_1 => 1990, pos_y_1 => 809,
      pos_x_2 => 2023, pos_y_2 => 658, pos_x_3 => 1911,
      pos_y_3 => 756, pos_x_4 => 1921, pos_y_4 => 505,
      pos_x_5 => 1773, pos_y_5 => 577};
get_unit_pos(120) ->
    #{next_pos => 121, stay_time => 25000, is_throw => 0,
      effect_id => 0,
      content_1 =>
          lang:get("危急之时嫦娥当机立断，吃下了长生不老药抱起皎月兔飞升成仙{face_1, "
                   "41}"),
      content_2 => "{face_1,34}", content_3 => "",
      pos_x_1 => 1964, pos_y_1 => 1140, pos_x_2 => 2096,
      pos_y_2 => 1038, pos_x_3 => 1949, pos_y_3 => 987,
      pos_x_4 => 2109, pos_y_4 => 856, pos_x_5 => 1964,
      pos_y_5 => 814};
get_unit_pos(121) ->
    #{next_pos => 122, stay_time => 12500, is_throw => 0,
      effect_id => 20152,
      content_1 =>
          lang:get("但是嫦娥牵挂着丈夫，便飞落到离人间最近的月亮上成了仙{face_1, 3}"),
      content_2 => "{face_1,21}", content_3 => "",
      pos_x_1 => 1875, pos_y_1 => 1426, pos_x_2 => 2018,
      pos_y_2 => 1343, pos_x_3 => 1839, pos_y_3 => 1272,
      pos_x_4 => 2080, pos_y_4 => 1179, pos_x_5 => 1900,
      pos_y_5 => 1105};
get_unit_pos(122) ->
    #{next_pos => 123, stay_time => 12500, is_throw => 0,
      effect_id => 0, content_1 => "", content_2 => "",
      content_3 => "", pos_x_1 => 1644, pos_y_1 => 1615,
      pos_x_2 => 1807, pos_y_2 => 1588, pos_x_3 => 1685,
      pos_y_3 => 1448, pos_x_4 => 1934, pos_y_4 => 1473,
      pos_x_5 => 1815, pos_y_5 => 1330};
get_unit_pos(123) ->
    #{next_pos => 124, stay_time => 12500, is_throw => 0,
      effect_id => 0,
      content_1 =>
          lang:get("皎月兔也飞升成了仙兔，他最喜欢主人和他的月野车{face_1, 34}"),
      content_2 => "{face_1,7}", content_3 => "",
      pos_x_1 => 1340, pos_y_1 => 1706, pos_x_2 => 1512,
      pos_y_2 => 1746, pos_x_3 => 1439, pos_y_3 => 1574,
      pos_x_4 => 1682, pos_y_4 => 1689, pos_x_5 => 1621,
      pos_y_5 => 1500};
get_unit_pos(124) ->
    #{next_pos => 125, stay_time => 12500, is_throw => 0,
      effect_id => 0, content_1 => "", content_2 => "",
      content_3 => "", pos_x_1 => 1023, pos_y_1 => 1703,
      pos_x_2 => 1153, pos_y_2 => 1796, pos_x_3 => 1164,
      pos_y_3 => 1609, pos_x_4 => 1335, pos_y_4 => 1811,
      pos_x_5 => 1345, pos_y_5 => 1618};
get_unit_pos(125) ->
    #{next_pos => 126, stay_time => 12500, is_throw => 0,
      effect_id => 0,
      content_1 =>
          lang:get("很久很久之前，它是一只普通的兔子，和嫦娥在人间快乐的生活着{face_1, 2}"),
      content_2 => "", content_3 => "{face_1,2}",
      pos_x_1 => 777, pos_y_1 => 1594, pos_x_2 => 864,
      pos_y_2 => 1723, pos_x_3 => 926, pos_y_3 => 1547,
      pos_x_4 => 1028, pos_y_4 => 1793, pos_x_5 => 1096,
      pos_y_5 => 1615};
get_unit_pos(126) ->
    #{next_pos => 127, stay_time => 12500, is_throw => 0,
      effect_id => 0, content_1 => "", content_2 => "",
      content_3 => "", pos_x_1 => 604, pos_y_1 => 1363,
      pos_x_2 => 611, pos_y_2 => 1530, pos_x_3 => 730,
      pos_y_3 => 1486, pos_x_4 => 708, pos_y_4 => 1671,
      pos_x_5 => 850, pos_y_5 => 1574};
get_unit_pos(127) ->
    #{next_pos => 128, stay_time => 12500, is_throw => 0,
      effect_id => 0,
      content_1 =>
          lang:get("直到有一天，有一个坏人要来抢嫦娥和后羿保管的长生不老药{face_1, "
                   "12}"),
      content_2 => "", content_3 => "{face_1,12}",
      pos_x_1 => 495, pos_y_1 => 1040, pos_x_2 => 460,
      pos_y_2 => 1207, pos_x_3 => 604, pos_y_3 => 1154,
      pos_x_4 => 531, pos_y_4 => 1369, pos_x_5 => 650,
      pos_y_5 => 1336};
get_unit_pos(128) ->
    #{next_pos => 129, stay_time => 12500, is_throw => 0,
      effect_id => 0, content_1 => "", content_2 => "",
      content_3 => "", pos_x_1 => 466, pos_y_1 => 756,
      pos_x_2 => 372, pos_y_2 => 905, pos_x_3 => 551,
      pos_y_3 => 873, pos_x_4 => 401, pos_y_4 => 1077,
      pos_x_5 => 562, pos_y_5 => 1058};
get_unit_pos(129) ->
    #{next_pos => 130, stay_time => 12500, is_throw => 0,
      effect_id => 30075,
      content_1 =>
          lang:get("危急之时嫦娥当机立断，吃下了长生不老药抱起皎月兔飞升成仙{face_1, "
                   "41}"),
      content_2 => "{face_1,41}", content_3 => "",
      pos_x_1 => 648, pos_y_1 => 480, pos_x_2 => 489,
      pos_y_2 => 544, pos_x_3 => 650, pos_y_3 => 618,
      pos_x_4 => 414, pos_y_4 => 700, pos_x_5 => 560,
      pos_y_5 => 794};
get_unit_pos(130) ->
    #{next_pos => 131, stay_time => 12500, is_throw => 0,
      effect_id => 0, content_1 => "", content_2 => "",
      content_3 => "", pos_x_1 => 928, pos_y_1 => 348,
      pos_x_2 => 773, pos_y_2 => 301, pos_x_3 => 835,
      pos_y_3 => 466, pos_x_4 => 601, pos_y_4 => 354,
      pos_x_5 => 665, pos_y_5 => 542};
get_unit_pos(131) ->
    #{next_pos => 132, stay_time => 12500, is_throw => 0,
      effect_id => 0,
      content_1 =>
          lang:get("但是嫦娥牵挂着丈夫，便飞落到离人间最近的月亮上成了仙{face_1, 3}"),
      content_2 => "{face_1,3}", content_3 => "",
      pos_x_1 => 1278, pos_y_1 => 357, pos_x_2 => 1148,
      pos_y_2 => 255, pos_x_3 => 1155, pos_y_3 => 436,
      pos_x_4 => 966, pos_y_4 => 260, pos_x_5 => 970,
      pos_y_5 => 451};
get_unit_pos(132) ->
    #{next_pos => 133, stay_time => 12500, is_throw => 0,
      effect_id => 0, content_1 => "", content_2 => "",
      content_3 => "", pos_x_1 => 1621, pos_y_1 => 372,
      pos_x_2 => 1502, pos_y_2 => 262, pos_x_3 => 1469,
      pos_y_3 => 448, pos_x_4 => 1317, pos_y_4 => 242,
      pos_x_5 => 1293, pos_y_5 => 422};
get_unit_pos(133) ->
    #{next_pos => 134, stay_time => 12500, is_throw => 0,
      effect_id => 0,
      content_1 =>
          lang:get("皎月兔也飞升成了仙兔，他最喜欢主人和他的月野车{face_1, 34}"),
      content_2 => "", content_3 => "{face_1,25}",
      pos_x_1 => 1856, pos_y_1 => 559, pos_x_2 => 1822,
      pos_y_2 => 387, pos_x_3 => 1718, pos_y_3 => 527,
      pos_x_4 => 1674, pos_y_4 => 288, pos_x_5 => 1565,
      pos_y_5 => 445};
get_unit_pos(134) ->
    #{next_pos => 135, stay_time => 12500, is_throw => 0,
      effect_id => 0, content_1 => "", content_2 => "",
      content_3 => "", pos_x_1 => 1990, pos_y_1 => 809,
      pos_x_2 => 2023, pos_y_2 => 658, pos_x_3 => 1911,
      pos_y_3 => 756, pos_x_4 => 1921, pos_y_4 => 505,
      pos_x_5 => 1773, pos_y_5 => 577};
get_unit_pos(135) ->
    #{next_pos => 1, stay_time => 25000, is_throw => 0,
      effect_id => 30075,
      content_1 =>
          lang:get("此夜，人们仰望天空如玉如盘的朗朗明月，自然会期盼家人团聚{face_1, "
                   "34}"),
      content_2 => "{face_1,1}", content_3 => "{face_1,1}",
      pos_x_1 => 1964, pos_y_1 => 1140, pos_x_2 => 2096,
      pos_y_2 => 1038, pos_x_3 => 1949, pos_y_3 => 987,
      pos_x_4 => 2109, pos_y_4 => 856, pos_x_5 => 1964,
      pos_y_5 => 814};
get_unit_pos(_) -> false.

get_lantern_unit(1) -> 74132;
get_lantern_unit(2) -> 74136;
get_lantern_unit(3) -> 74137;
get_lantern_unit(_) -> 74132.

get_box() ->
    [#{base_id => 90025, num => 18, ratio => 100,
       is_cast => 0},
     #{base_id => 90025, num => 22, ratio => 100,
       is_cast => 0},
     #{base_id => 90025, num => 100, ratio => 100,
       is_cast => 1},
     #{base_id => 23556, num => 1, ratio => 80,
       is_cast => 0},
     #{base_id => 20034, num => 2, ratio => 40,
       is_cast => 0},
     #{base_id => 21098, num => 2, ratio => 70,
       is_cast => 0},
     #{base_id => 20006, num => 4, ratio => 100,
       is_cast => 0},
     #{base_id => 90000, num => 200000, ratio => 60,
       is_cast => 0},
     #{base_id => 90003, num => 2000, ratio => 60,
       is_cast => 0},
     #{base_id => 20004, num => 2, ratio => 40,
       is_cast => 0},
     #{base_id => 20005, num => 2, ratio => 40,
       is_cast => 0},
     #{base_id => 20020, num => 2, ratio => 70,
       is_cast => 0},
     #{base_id => 20025, num => 1, ratio => 70,
       is_cast => 0},
     #{base_id => 20052, num => 2, ratio => 70,
       is_cast => 0},
     #{base_id => 23594, num => 1, ratio => 5, is_cast => 1},
     #{base_id => 23597, num => 1, ratio => 30,
       is_cast => 0},
     #{base_id => 20046, num => 1, ratio => 10,
       is_cast => 1},
     #{base_id => 20075, num => 1, ratio => 10,
       is_cast => 1},
     #{base_id => 20076, num => 1, ratio => 5,
       is_cast => 1}].

get_pop() ->
    [lang:get("中秋佳节，祝您人逢喜事精神爽，人团家圆事业成{face_1,3}"),
     lang:get("中秋到了，祝您全家团圆，幸福快乐{face_1,3}"),
     lang:get("中秋团圆，祝愿幸福吉祥{face_1,3}"),
     lang:get("中秋月，寄相思，路途远，心相连，愿欢聚，共团圆{face_1,18}"),
     lang:get("中秋祝福到，愿前途无量处处看好，中秋快乐{face_1,3}"),
     lang:get("举杯邀明月，低头乐开怀。祝福随风至，好运踏月来{face_1,18}"),
     lang:get("合家尽安康，幸福绕身旁，愿您中秋快乐{face_1,3}"),
     lang:get("愿君花好月圆人安宁，美满日子永放睛{face_1,2}"),
     lang:get("愿您日日花好月圆，中秋更是幸福团圆{face_1,6}"),
     lang:get("愿您福满满，此刻甜蜜蜜，中秋乐悠悠{face_1,16}"),
     lang:get("成功陪您向上游，幸福与您长相守{face_1,18}"),
     lang:get("月亮挂在天上，拜嫦娥祈福降，中秋团圆快乐{face_1,18}"),
     lang:get("欢欢喜喜到中秋，快快乐乐庆佳节，开开心心每一天{face_1,3}"),
     lang:get("欢聚一堂庆团圆，福寿安康乐无边；星辰奇缘祝福您，中秋快乐乐逍遥{face_1,3}"),
     lang:get("祝您中秋到，月儿圆，事业财运共升腾！{face_1,6}"),
     lang:get("祝您中秋节快乐，阖家欢乐万事兴{face_1,18}"),
     lang:get("祝您爱情如明月圆满，事业如星光灿烂{face_1,3}"),
     lang:get("祝您美梦总香甜，开开心心每一天{face_1,18}"),
     lang:get("花好月圆中秋到，举杯邀月庆佳节，祝您幸福一家亲{face_1,3}"),
     lang:get("花好月圆，团圆美好。秋色怡人，好运福罩。佳节快乐，步步登高{face_1,18}")].

