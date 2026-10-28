-file("src/data/quest_guild_data.erl", 1).

-module(quest_guild_data).

-export([list/0,
         get_lev/1,
         get_ring/1,
         get_patrol/1,
         get_classify/0,
         get_item_list/0,
         get_find_type_quest_id/1,
         get_find_type/1,
         get_propagation/1,
         get_plant_pos/0,
         get_plant_reward/1,
         get_irrigate_reward/0]).

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

-file("src/data/quest_guild_data.erl", 25).

list() ->
    [#{id => 80000, weight => 300, type => 7,
       in_round => [3]},
     #{id => 80002, weight => 300, type => 2,
       in_round => [2]},
     #{id => 80004, weight => 300, type => 6,
       in_round => [1, 4]},
     #{id => 80005, weight => 300, type => 6,
       in_round => [1, 4]},
     #{id => 80006, weight => 300, type => 6,
       in_round => [1, 4]},
     #{id => 80007, weight => 300, type => 6,
       in_round => [1, 4]},
     #{id => 80008, weight => 300, type => 6,
       in_round => [1, 4]},
     #{id => 80009, weight => 300, type => 6,
       in_round => [1, 4]},
     #{id => 80011, weight => 300, type => 1,
       in_round => [2]},
     #{id => 80012, weight => 300, type => 1,
       in_round => [2]},
     #{id => 80013, weight => 300, type => 1,
       in_round => [2]},
     #{id => 80014, weight => 300, type => 1,
       in_round => [2]},
     #{id => 80020, weight => 300, type => 3,
       in_round => [3, 4]},
     #{id => 80021, weight => 300, type => 3,
       in_round => [3, 4]},
     #{id => 80022, weight => 300, type => 3,
       in_round => [3, 4]},
     #{id => 80023, weight => 300, type => 3,
       in_round => [3, 4]},
     #{id => 80024, weight => 300, type => 3,
       in_round => [3, 4]},
     #{id => 80025, weight => 300, type => 3,
       in_round => [3, 4]},
     #{id => 80030, weight => 300, type => 4,
       in_round => [1]},
     #{id => 80031, weight => 300, type => 4,
       in_round => [1]},
     #{id => 80032, weight => 300, type => 4,
       in_round => [1]},
     #{id => 80033, weight => 300, type => 4,
       in_round => [1]},
     #{id => 80034, weight => 300, type => 4,
       in_round => [1]},
     #{id => 80035, weight => 300, type => 4,
       in_round => [1]},
     #{id => 80036, weight => 300, type => 4,
       in_round => [1]},
     #{id => 80040, weight => 300, type => 1,
       in_round => [2]},
     #{id => 80041, weight => 300, type => 1,
       in_round => [2]},
     #{id => 80042, weight => 300, type => 1,
       in_round => [2]},
     #{id => 80050, weight => 300, type => 7,
       in_round => [3]},
     #{id => 80051, weight => 300, type => 7,
       in_round => [3]},
     #{id => 80052, weight => 300, type => 7,
       in_round => [3]},
     #{id => 80055, weight => 300, type => 9,
       in_round => [5]},
     #{id => 80060, weight => 300, type => 5,
       in_round => [6]},
     #{id => 80070, weight => 300, type => 8,
       in_round => [6]}].

get_lev(1) -> {val_not_exist, 340};
get_lev(2) -> {val_not_exist, 340};
get_lev(3) -> {val_not_exist, 340};
get_lev(4) -> {val_not_exist, 340};
get_lev(5) -> {val_not_exist, 340};
get_lev(6) -> {val_not_exist, 340};
get_lev(7) -> {val_not_exist, 340};
get_lev(8) -> {val_not_exist, 340};
get_lev(9) -> {val_not_exist, 340};
get_lev(10) -> {val_not_exist, 340};
get_lev(11) -> {val_not_exist, 340};
get_lev(12) -> {val_not_exist, 340};
get_lev(13) -> {val_not_exist, 340};
get_lev(14) -> {val_not_exist, 340};
get_lev(15) -> {679, 340};
get_lev(16) -> {679, 340};
get_lev(17) -> {679, 340};
get_lev(18) -> {679, 340};
get_lev(19) -> {679, 340};
get_lev(20) -> {1000, 340};
get_lev(21) -> {1000, 500};
get_lev(22) -> {1000, 500};
get_lev(23) -> {1000, 500};
get_lev(24) -> {1000, 500};
get_lev(25) -> {1093, 547};
get_lev(26) -> {1093, 547};
get_lev(27) -> {1093, 547};
get_lev(28) -> {1093, 547};
get_lev(29) -> {1093, 547};
get_lev(30) -> {1230, 615};
get_lev(31) -> {1230, 615};
get_lev(32) -> {1230, 615};
get_lev(33) -> {1230, 615};
get_lev(34) -> {1230, 615};
get_lev(35) -> {1328, 664};
get_lev(36) -> {1328, 664};
get_lev(37) -> {1328, 664};
get_lev(38) -> {1328, 664};
get_lev(39) -> {1328, 664};
get_lev(40) -> {1470, 735};
get_lev(41) -> {1470, 735};
get_lev(42) -> {1470, 735};
get_lev(43) -> {1470, 735};
get_lev(44) -> {1470, 735};
get_lev(45) -> {1573, 787};
get_lev(46) -> {1573, 787};
get_lev(47) -> {1573, 787};
get_lev(48) -> {1573, 787};
get_lev(49) -> {1573, 787};
get_lev(50) -> {1676, 838};
get_lev(51) -> {1676, 838};
get_lev(52) -> {1676, 838};
get_lev(53) -> {1676, 838};
get_lev(54) -> {1676, 838};
get_lev(55) -> {1822, 911};
get_lev(56) -> {1822, 911};
get_lev(57) -> {1822, 911};
get_lev(58) -> {1822, 911};
get_lev(59) -> {1822, 911};
get_lev(60) -> {1973, 987};
get_lev(61) -> {1973, 987};
get_lev(62) -> {1973, 987};
get_lev(63) -> {1834, 987};
get_lev(64) -> {1834, 987};
get_lev(65) -> {1939, 1043};
get_lev(66) -> {1939, 1043};
get_lev(67) -> {1939, 1043};
get_lev(68) -> {1980, 1043};
get_lev(69) -> {1980, 1043};
get_lev(70) -> {2087, 1099};
get_lev(71) -> {2087, 1099};
get_lev(72) -> {2087, 1099};
get_lev(73) -> {2197, 1099};
get_lev(74) -> {2197, 1099};
get_lev(75) -> {2314, 1157};
get_lev(76) -> {2314, 1157};
get_lev(77) -> {2314, 1157};
get_lev(78) -> {2198, 1157};
get_lev(79) -> {2198, 1157};
get_lev(80) -> {2461, 1296};
get_lev(81) -> {2461, 1296};
get_lev(82) -> {2461, 1296};
get_lev(83) -> {2539, 1296};
get_lev(84) -> {2539, 1296};
get_lev(85) -> {2653, 1354};
get_lev(86) -> {2653, 1354};
get_lev(87) -> {2653, 1354};
get_lev(88) -> {2708, 1354};
get_lev(89) -> {2708, 1354};
get_lev(90) -> {2834, 1417};
get_lev(91) -> {2834, 1417};
get_lev(92) -> {2834, 1417};
get_lev(93) -> {2748, 1417};
get_lev(94) -> {2748, 1417};
get_lev(95) -> {2867, 1478};
get_lev(96) -> {2867, 1478};
get_lev(97) -> {2867, 1478};
get_lev(98) -> {2956, 1478};
get_lev(99) -> {2956, 1478};
get_lev(100) -> {3045, 1522};
get_lev(101) -> {3045, 1522};
get_lev(102) -> {3045, 1522};
get_lev(103) -> {3045, 1522};
get_lev(104) -> {3045, 1522};
get_lev(105) -> {3200, 1599};
get_lev(106) -> {3200, 1599};
get_lev(107) -> {3200, 1599};
get_lev(108) -> {3200, 1599};
get_lev(109) -> {3200, 1599};
get_lev(110) -> {3363, 1680};
get_lev(111) -> {3363, 1680};
get_lev(112) -> {3363, 1680};
get_lev(113) -> {3363, 1680};
get_lev(114) -> {3363, 1680};
get_lev(115) -> {3534, 1765};
get_lev(116) -> {3534, 1765};
get_lev(117) -> {3534, 1765};
get_lev(118) -> {3534, 1765};
get_lev(119) -> {3534, 1765};
get_lev(120) -> {3534, 1765};
get_lev(121) -> {3534, 1765};
get_lev(122) -> {3534, 1765};
get_lev(123) -> {3534, 1765};
get_lev(124) -> {3534, 1765};
get_lev(125) -> {3534, 1765};
get_lev(126) -> {3534, 1765};
get_lev(127) -> {3534, 1765};
get_lev(128) -> {3534, 1765};
get_lev(129) -> {3534, 1765};
get_lev(130) -> {3534, 1765};
get_lev(131) -> {3534, 1765};
get_lev(132) -> {3534, 1765};
get_lev(133) -> {3534, 1765};
get_lev(134) -> {3534, 1765};
get_lev(135) -> {3534, 1765};
get_lev(136) -> {3534, 1765};
get_lev(_Id) -> none.

get_ring(1) ->
    #{round => 1, exp_ratio => 1350, assets => 6404,
      donation => 3, coin => 10026};
get_ring(2) ->
    #{round => 2, exp_ratio => 1950, assets => 7646,
      donation => 5, coin => 11569};
get_ring(3) ->
    #{round => 3, exp_ratio => 2550, assets => 8924,
      donation => 7, coin => 13111};
get_ring(4) ->
    #{round => 4, exp_ratio => 3200, assets => 10210,
      donation => 9, coin => 14654};
get_ring(5) ->
    #{round => 5, exp_ratio => 4000, assets => 11816,
      donation => 10, coin => 16582};
get_ring(6) ->
    #{round => 6, exp_ratio => 4800, assets => 15422,
      donation => 15, coin => 18510};
get_ring(7) ->
    #{round => 7, exp_ratio => 1375, assets => 4823,
      donation => 3, coin => 5784};
get_ring(8) ->
    #{round => 8, exp_ratio => 1675, assets => 5462,
      donation => 5, coin => 6555};
get_ring(9) ->
    #{round => 9, exp_ratio => 2000, assets => 6105,
      donation => 6, coin => 7327};
get_ring(10) ->
    #{round => 10, exp_ratio => 2400, assets => 6908,
      donation => 9, coin => 8291};
get_ring(_Id) -> none.

get_patrol(80020) ->
    [#{id => 80020, map_base_id => 30001,
       unit_list => [{73400, 100}], weight => 200, pcnt => 90,
       min_move_step => 6, max_move_step => 20}];
get_patrol(80021) ->
    [#{id => 80021, map_base_id => 10001,
       unit_list => [{73402, 100}], weight => 100, pcnt => 90,
       min_move_step => 6, max_move_step => 20}];
get_patrol(80022) ->
    [#{id => 80022, map_base_id => 10002,
       unit_list => [{73404, 100}], weight => 100, pcnt => 90,
       min_move_step => 6, max_move_step => 20}];
get_patrol(80023) ->
    [#{id => 80023, map_base_id => 10003,
       unit_list => [{73406, 100}], weight => 100, pcnt => 90,
       min_move_step => 6, max_move_step => 20}];
get_patrol(80024) ->
    [#{id => 80024, map_base_id => 10004,
       unit_list => [{73408, 100}], weight => 100, pcnt => 90,
       min_move_step => 6, max_move_step => 20}];
get_patrol(80025) ->
    [#{id => 80025, map_base_id => 10007,
       unit_list => [{73410, 100}], weight => 100, pcnt => 90,
       min_move_step => 6, max_move_step => 20}];
get_patrol(_) -> [].

get_classify() ->
    [{1, 500, 10},
     {2, 250, 10},
     {3, 150, 20},
     {4, 100, 30},
     {5, 734, 40},
     {6, 734, 40}].

get_item_list() ->
    [#{id => 21401, type => 6, role_lev => 45,
       weight => 100},
     #{id => 21402, type => 6, role_lev => 10,
       weight => 100},
     #{id => 21403, type => 6, role_lev => 10,
       weight => 100},
     #{id => 21404, type => 6, role_lev => 10,
       weight => 100},
     #{id => 21406, type => 6, role_lev => 10,
       weight => 100},
     #{id => 21405, type => 6, role_lev => 10,
       weight => 100},
     #{id => 21407, type => 6, role_lev => 55,
       weight => 100},
     #{id => 21408, type => 6, role_lev => 50,
       weight => 100},
     #{id => 21300, type => 5, role_lev => 15,
       weight => 100},
     #{id => 21301, type => 5, role_lev => 15,
       weight => 150},
     #{id => 21303, type => 5, role_lev => 20, weight => 45},
     #{id => 21302, type => 5, role_lev => 30, weight => 50},
     #{id => 21313, type => 5, role_lev => 40, weight => 45},
     #{id => 21305, type => 5, role_lev => 50, weight => 40},
     #{id => 21304, type => 5, role_lev => 55, weight => 50},
     #{id => 21307, type => 5, role_lev => 60, weight => 30},
     #{id => 21409, type => 5, role_lev => 65, weight => 40},
     #{id => 21309, type => 5, role_lev => 70, weight => 15},
     #{id => 21308, type => 5, role_lev => 75, weight => 35},
     #{id => 21311, type => 5, role_lev => 80, weight => 5},
     #{id => 21314, type => 5, role_lev => 85, weight => 2}].

get_find_type_quest_id(1) -> 80004;
get_find_type_quest_id(2) -> 80005;
get_find_type_quest_id(3) -> 80006;
get_find_type_quest_id(4) -> 80007;
get_find_type_quest_id(5) -> 80008;
get_find_type_quest_id(6) -> 80009;
get_find_type_quest_id(_Type) -> false.

get_find_type(80004) -> 1;
get_find_type(80005) -> 2;
get_find_type(80006) -> 3;
get_find_type(80007) -> 4;
get_find_type(80008) -> 5;
get_find_type(80009) -> 6;
get_find_type(_QuestId) -> false.

get_propagation(1) -> #{order => 1, pcnt => 0};
get_propagation(2) ->
    #{order => 2,
      unit_list => [{73420, 200}, {73430, 200}, {73440, 200}],
      pcnt => 700};
get_propagation(_QuestId) -> false.

get_plant_pos() ->
    [{225, 776},
     {511, 768},
     {802, 762},
     {924, 760},
     {242, 906},
     {500, 906},
     {790, 906},
     {399, 1488},
     {549, 1662},
     {477, 1792},
     {886, 1605},
     {1049, 1579},
     {1002, 1655},
     {1108, 1642},
     {1457, 1215},
     {1585, 1215},
     {1726, 1215},
     {1848, 1195},
     {1457, 1378},
     {1585, 1378},
     {1726, 1378},
     {1848, 1378},
     {1938, 1133},
     {1936, 1251},
     {2248, 1519},
     {2162, 1557},
     {2432, 1542},
     {2541, 1570},
     {2642, 1543},
     {2348, 1614},
     {2619, 1626},
     {1885, 1705},
     {2187, 1681},
     {2361, 787},
     {2469, 860},
     {2500, 740},
     {2592, 806},
     {2687, 761},
     {2768, 831},
     {2880, 811},
     {2591, 609},
     {2599, 702},
     {300, 773},
     {400, 773},
     {600, 773},
     {700, 773},
     {300, 906},
     {400, 906},
     {600, 906},
     {700, 906},
     {2418, 1331},
     {2485, 1344},
     {2563, 1347},
     {2650, 1336},
     {2716, 1318},
     {2779, 1265},
     {2800, 1168},
     {2345, 1306},
     {2250, 1264},
     {2273, 1147},
     {2474, 1623},
     {2075, 1631},
     {959, 1245},
     {1007, 1368},
     {919, 1367},
     {844, 1357},
     {638, 1299},
     {684, 1373},
     {756, 1433},
     {1255, 1743},
     {613, 1709},
     {506, 1591},
     {439, 1536},
     {435, 1430},
     {2999, 1587},
     {3126, 1656},
     {3247, 1712},
     {3367, 1783},
     {3500, 1851},
     {3310, 1436},
     {3433, 1496},
     {2656, 314},
     {2815, 310},
     {3096, 410},
     {3260, 456}].

get_plant_reward(0) ->
    #{irrigation => 0,
      reward =>
          [{90010, 2500}, {90005, 2500}, {90000, 8677}]};
get_plant_reward(1) ->
    #{irrigation => 1,
      reward =>
          [{90010, 5000},
           {90005, 5000},
           {90000, 17354},
           {90011, 15}]};
get_plant_reward(2) ->
    #{irrigation => 2,
      reward =>
          [{90010, 10000},
           {90005, 10000},
           {90000, 34708},
           {90011, 15}]};
get_plant_reward(3) ->
    #{irrigation => 3,
      reward =>
          [{90010, 15000},
           {90005, 15000},
           {90000, 52062},
           {90011, 15}]};
get_plant_reward(4) ->
    #{irrigation => 4,
      reward =>
          [{90010, 20000},
           {90005, 20000},
           {90000, 69416},
           {90011, 15}]};
get_plant_reward(5) ->
    #{irrigation => 5,
      reward =>
          [{90010, 30000},
           {90005, 30000},
           {90000, 104124},
           {90011, 15}]};
get_plant_reward(_Irrigation) -> false.

get_irrigate_reward() ->
    [#{item_id => 20006, item_num => 5, item_weight => 500,
       announce => 0},
     #{item_id => 20004, item_num => 1, item_weight => 110,
       announce => 0},
     #{item_id => 21100, item_num => 1, item_weight => 30,
       announce => 1},
     #{item_id => 20095, item_num => 1, item_weight => 2,
       announce => 1},
     #{item_id => 20046, item_num => 1, item_weight => 8,
       announce => 1},
     #{item_id => 20060, item_num => 1, item_weight => 110,
       announce => 0},
     #{item_id => 20019, item_num => 1, item_weight => 240,
       announce => 0}].

