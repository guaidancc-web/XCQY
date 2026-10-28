-file("src/data/top_compete_data.erl", 1).

-module(top_compete_data).

-export([get_exp/1,
         get_pet_exp/1,
         get_item/1,
         get_box_ratio/1,
         get_normal_exp/1,
         get_box/1,
         get_combat/0,
         get_mail/0]).

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

-file("src/data/top_compete_data.erl", 22).

get_exp(1) -> 0;
get_exp(2) -> 0;
get_exp(3) -> 0;
get_exp(4) -> 0;
get_exp(5) -> 0;
get_exp(6) -> 0;
get_exp(7) -> 0;
get_exp(8) -> 0;
get_exp(9) -> 0;
get_exp(10) -> 0;
get_exp(11) -> 0;
get_exp(12) -> 0;
get_exp(13) -> 0;
get_exp(14) -> 0;
get_exp(15) -> 0;
get_exp(16) -> 0;
get_exp(17) -> 0;
get_exp(18) -> 0;
get_exp(19) -> 0;
get_exp(20) -> 0;
get_exp(21) -> 0;
get_exp(22) -> 0;
get_exp(23) -> 0;
get_exp(24) -> 0;
get_exp(25) -> 0;
get_exp(26) -> 0;
get_exp(27) -> 0;
get_exp(28) -> 0;
get_exp(29) -> 0;
get_exp(30) -> 0;
get_exp(31) -> 0;
get_exp(32) -> 0;
get_exp(33) -> 0;
get_exp(34) -> 0;
get_exp(35) -> 8074;
get_exp(36) -> 8189;
get_exp(37) -> 8304;
get_exp(38) -> 8448;
get_exp(39) -> 8563;
get_exp(40) -> 8918;
get_exp(41) -> 9062;
get_exp(42) -> 9178;
get_exp(43) -> 9322;
get_exp(44) -> 9437;
get_exp(45) -> 9552;
get_exp(46) -> 9696;
get_exp(47) -> 9811;
get_exp(48) -> 9955;
get_exp(49) -> 10070;
get_exp(50) -> 10214;
get_exp(51) -> 10330;
get_exp(52) -> 10474;
get_exp(53) -> 10618;
get_exp(54) -> 10733;
get_exp(55) -> 11117;
get_exp(56) -> 11232;
get_exp(57) -> 11376;
get_exp(58) -> 11520;
get_exp(59) -> 11635;
get_exp(60) -> 12019;
get_exp(61) -> 12163;
get_exp(62) -> 12307;
get_exp(63) -> 12422;
get_exp(64) -> 12566;
get_exp(65) -> 12710;
get_exp(66) -> 12854;
get_exp(67) -> 12998;
get_exp(68) -> 13142;
get_exp(69) -> 13258;
get_exp(70) -> 13402;
get_exp(71) -> 13546;
get_exp(72) -> 13690;
get_exp(73) -> 13834;
get_exp(74) -> 13978;
get_exp(75) -> 14122;
get_exp(76) -> 14266;
get_exp(77) -> 14410;
get_exp(78) -> 14554;
get_exp(79) -> 14698;
get_exp(80) -> 15802;
get_exp(81) -> 15974;
get_exp(82) -> 16118;
get_exp(83) -> 16262;
get_exp(84) -> 16406;
get_exp(85) -> 16550;
get_exp(86) -> 16694;
get_exp(87) -> 16867;
get_exp(88) -> 17011;
get_exp(89) -> 17155;
get_exp(90) -> 17299;
get_exp(91) -> 17472;
get_exp(92) -> 17616;
get_exp(93) -> 17760;
get_exp(94) -> 17933;
get_exp(95) -> 18077;
get_exp(96) -> 18221;
get_exp(97) -> 18394;
get_exp(98) -> 18538;
get_exp(99) -> 18682;
get_exp(100) -> 18868;
get_exp(101) -> 19056;
get_exp(102) -> 19246;
get_exp(103) -> 19438;
get_exp(104) -> 19632;
get_exp(105) -> 19828;
get_exp(106) -> 20026;
get_exp(107) -> 20226;
get_exp(108) -> 20428;
get_exp(109) -> 20632;
get_exp(110) -> 20838;
get_exp(111) -> 21046;
get_exp(112) -> 21256;
get_exp(113) -> 21468;
get_exp(114) -> 21682;
get_exp(115) -> 21898;
get_exp(116) -> 22116;
get_exp(117) -> 22337;
get_exp(118) -> 22560;
get_exp(119) -> 22785;
get_exp(120) -> 23012;
get_exp(121) -> 23242;
get_exp(122) -> 23474;
get_exp(123) -> 23708;
get_exp(124) -> 23945;
get_exp(125) -> 24184;
get_exp(126) -> 24425;
get_exp(127) -> 24669;
get_exp(128) -> 24915;
get_exp(129) -> 25164;
get_exp(130) -> 25415;
get_exp(131) -> 25669;
get_exp(132) -> 25925;
get_exp(133) -> 26184;
get_exp(134) -> 26445;
get_exp(135) -> 26709;
get_exp(136) -> 26976;
get_exp(137) -> 27245;
get_exp(138) -> 27517;
get_exp(139) -> 27792;
get_exp(140) -> 28069;
get_exp(_) -> false.

get_pet_exp(1) -> 1958;
get_pet_exp(2) -> 2001;
get_pet_exp(3) -> 2060;
get_pet_exp(4) -> 2118;
get_pet_exp(5) -> 2162;
get_pet_exp(6) -> 2221;
get_pet_exp(7) -> 2279;
get_pet_exp(8) -> 2323;
get_pet_exp(9) -> 2381;
get_pet_exp(10) -> 2440;
get_pet_exp(11) -> 2498;
get_pet_exp(12) -> 2557;
get_pet_exp(13) -> 2600;
get_pet_exp(14) -> 2659;
get_pet_exp(15) -> 2717;
get_pet_exp(16) -> 2776;
get_pet_exp(17) -> 2834;
get_pet_exp(18) -> 2893;
get_pet_exp(19) -> 2951;
get_pet_exp(20) -> 3009;
get_pet_exp(21) -> 3068;
get_pet_exp(22) -> 3126;
get_pet_exp(23) -> 3185;
get_pet_exp(24) -> 3243;
get_pet_exp(25) -> 3302;
get_pet_exp(26) -> 3360;
get_pet_exp(27) -> 3419;
get_pet_exp(28) -> 3477;
get_pet_exp(29) -> 3535;
get_pet_exp(30) -> 3594;
get_pet_exp(31) -> 3789;
get_pet_exp(32) -> 3847;
get_pet_exp(33) -> 3906;
get_pet_exp(34) -> 3964;
get_pet_exp(35) -> 4037;
get_pet_exp(36) -> 4095;
get_pet_exp(37) -> 4152;
get_pet_exp(38) -> 4224;
get_pet_exp(39) -> 4282;
get_pet_exp(40) -> 4459;
get_pet_exp(41) -> 4531;
get_pet_exp(42) -> 4589;
get_pet_exp(43) -> 4661;
get_pet_exp(44) -> 4719;
get_pet_exp(45) -> 4776;
get_pet_exp(46) -> 4848;
get_pet_exp(47) -> 4906;
get_pet_exp(48) -> 4978;
get_pet_exp(49) -> 5035;
get_pet_exp(50) -> 5107;
get_pet_exp(51) -> 5165;
get_pet_exp(52) -> 5237;
get_pet_exp(53) -> 5309;
get_pet_exp(54) -> 5367;
get_pet_exp(55) -> 5559;
get_pet_exp(56) -> 5616;
get_pet_exp(57) -> 5688;
get_pet_exp(58) -> 5760;
get_pet_exp(59) -> 5818;
get_pet_exp(60) -> 6010;
get_pet_exp(61) -> 6082;
get_pet_exp(62) -> 6154;
get_pet_exp(63) -> 6211;
get_pet_exp(64) -> 6283;
get_pet_exp(65) -> 6355;
get_pet_exp(66) -> 6427;
get_pet_exp(67) -> 6499;
get_pet_exp(68) -> 6571;
get_pet_exp(69) -> 6629;
get_pet_exp(70) -> 6701;
get_pet_exp(71) -> 6773;
get_pet_exp(72) -> 6845;
get_pet_exp(73) -> 6917;
get_pet_exp(74) -> 6989;
get_pet_exp(75) -> 7061;
get_pet_exp(76) -> 7133;
get_pet_exp(77) -> 7205;
get_pet_exp(78) -> 7277;
get_pet_exp(79) -> 7349;
get_pet_exp(80) -> 7901;
get_pet_exp(81) -> 7987;
get_pet_exp(82) -> 8059;
get_pet_exp(83) -> 8131;
get_pet_exp(84) -> 8203;
get_pet_exp(85) -> 8275;
get_pet_exp(86) -> 8347;
get_pet_exp(87) -> 8434;
get_pet_exp(88) -> 8506;
get_pet_exp(89) -> 8578;
get_pet_exp(90) -> 8650;
get_pet_exp(91) -> 8736;
get_pet_exp(92) -> 8808;
get_pet_exp(93) -> 8880;
get_pet_exp(94) -> 8967;
get_pet_exp(95) -> 9039;
get_pet_exp(96) -> 9111;
get_pet_exp(97) -> 9197;
get_pet_exp(98) -> 9269;
get_pet_exp(99) -> 9341;
get_pet_exp(100) -> 9434;
get_pet_exp(101) -> 9528;
get_pet_exp(102) -> 9623;
get_pet_exp(103) -> 9719;
get_pet_exp(104) -> 9816;
get_pet_exp(105) -> 9914;
get_pet_exp(106) -> 10013;
get_pet_exp(107) -> 10113;
get_pet_exp(108) -> 10214;
get_pet_exp(109) -> 10316;
get_pet_exp(110) -> 10419;
get_pet_exp(111) -> 10523;
get_pet_exp(112) -> 10628;
get_pet_exp(113) -> 10734;
get_pet_exp(114) -> 10841;
get_pet_exp(115) -> 10949;
get_pet_exp(116) -> 11058;
get_pet_exp(117) -> 11168;
get_pet_exp(118) -> 11279;
get_pet_exp(119) -> 11391;
get_pet_exp(120) -> 11504;
get_pet_exp(121) -> 11619;
get_pet_exp(122) -> 11735;
get_pet_exp(123) -> 11852;
get_pet_exp(124) -> 11970;
get_pet_exp(125) -> 12089;
get_pet_exp(126) -> 12209;
get_pet_exp(127) -> 12331;
get_pet_exp(128) -> 12454;
get_pet_exp(129) -> 12578;
get_pet_exp(130) -> 12703;
get_pet_exp(131) -> 12830;
get_pet_exp(132) -> 12958;
get_pet_exp(133) -> 13087;
get_pet_exp(134) -> 13217;
get_pet_exp(135) -> 13349;
get_pet_exp(136) -> 13482;
get_pet_exp(137) -> 13616;
get_pet_exp(138) -> 13752;
get_pet_exp(139) -> 13889;
get_pet_exp(140) -> 14027;
get_pet_exp(_) -> false.

get_item({0, 0}) -> 0;
get_item({1, 0}) -> 0;
get_item({2, 0}) -> 0;
get_item({3, 0}) -> 0;
get_item({4, 0}) -> 0;
get_item({5, 0}) -> 0;
get_item({6, 0}) -> 0;
get_item({7, 0}) -> 0;
get_item({8, 0}) -> 0;
get_item({9, 0}) -> 0;
get_item({10, 0}) -> 0;
get_item({0, 1}) -> 0;
get_item({1, 1}) -> 0;
get_item({2, 1}) -> 0;
get_item({3, 1}) -> 0;
get_item({4, 1}) -> 0;
get_item({5, 1}) -> 0;
get_item({6, 1}) -> 0;
get_item({7, 1}) -> 0;
get_item({8, 1}) -> 0;
get_item({9, 1}) -> 0;
get_item({10, 1}) -> 0;
get_item(_) -> false.

get_box_ratio(1) -> 800;
get_box_ratio(2) -> 500;
get_box_ratio(3) -> 600;
get_box_ratio(4) -> 700;
get_box_ratio(5) -> 900;
get_box_ratio(6) -> 1000;
get_box_ratio(7) -> 1100;
get_box_ratio(8) -> 1200;
get_box_ratio(9) -> 1300;
get_box_ratio(10) -> 2000;
get_box_ratio(_) -> 800.

get_normal_exp(1) -> {0, 537};
get_normal_exp(2) -> {0, 549};
get_normal_exp(3) -> {0, 565};
get_normal_exp(4) -> {0, 581};
get_normal_exp(5) -> {0, 594};
get_normal_exp(6) -> {0, 610};
get_normal_exp(7) -> {0, 626};
get_normal_exp(8) -> {0, 638};
get_normal_exp(9) -> {0, 654};
get_normal_exp(10) -> {0, 670};
get_normal_exp(11) -> {0, 686};
get_normal_exp(12) -> {0, 702};
get_normal_exp(13) -> {0, 714};
get_normal_exp(14) -> {0, 730};
get_normal_exp(15) -> {0, 746};
get_normal_exp(16) -> {0, 762};
get_normal_exp(17) -> {0, 778};
get_normal_exp(18) -> {0, 794};
get_normal_exp(19) -> {0, 810};
get_normal_exp(20) -> {0, 826};
get_normal_exp(21) -> {0, 842};
get_normal_exp(22) -> {0, 858};
get_normal_exp(23) -> {0, 874};
get_normal_exp(24) -> {0, 891};
get_normal_exp(25) -> {0, 907};
get_normal_exp(26) -> {0, 923};
get_normal_exp(27) -> {0, 939};
get_normal_exp(28) -> {0, 955};
get_normal_exp(29) -> {0, 971};
get_normal_exp(30) -> {1974, 987};
get_normal_exp(31) -> {2093, 1046};
get_normal_exp(32) -> {2151, 1075};
get_normal_exp(33) -> {2159, 1079};
get_normal_exp(34) -> {2234, 1117};
get_normal_exp(35) -> {2281, 1140};
get_normal_exp(36) -> {2278, 1139};
get_normal_exp(37) -> {2304, 1152};
get_normal_exp(38) -> {2363, 1181};
get_normal_exp(39) -> {2401, 1200};
get_normal_exp(40) -> {2441, 1220};
get_normal_exp(41) -> {2533, 1266};
get_normal_exp(42) -> {2581, 1290};
get_normal_exp(43) -> {2617, 1308};
get_normal_exp(44) -> {2647, 1323};
get_normal_exp(45) -> {2690, 1345};
get_normal_exp(46) -> {2717, 1358};
get_normal_exp(47) -> {2759, 1379};
get_normal_exp(48) -> {2784, 1392};
get_normal_exp(49) -> {2830, 1415};
get_normal_exp(50) -> {2869, 1434};
get_normal_exp(51) -> {2902, 1451};
get_normal_exp(52) -> {2937, 1468};
get_normal_exp(53) -> {2982, 1491};
get_normal_exp(54) -> {3022, 1511};
get_normal_exp(55) -> {3056, 1528};
get_normal_exp(56) -> {3160, 1580};
get_normal_exp(57) -> {3195, 1597};
get_normal_exp(58) -> {3241, 1620};
get_normal_exp(59) -> {3277, 1638};
get_normal_exp(60) -> {3313, 1656};
get_normal_exp(61) -> {3423, 1711};
get_normal_exp(62) -> {3463, 1731};
get_normal_exp(63) -> {3502, 1751};
get_normal_exp(64) -> {3537, 1768};
get_normal_exp(65) -> {3577, 1788};
get_normal_exp(66) -> {3616, 1808};
get_normal_exp(67) -> {3658, 1829};
get_normal_exp(68) -> {3700, 1850};
get_normal_exp(69) -> {3739, 1869};
get_normal_exp(70) -> {3773, 1886};
get_normal_exp(71) -> {3814, 1907};
get_normal_exp(72) -> {3855, 1927};
get_normal_exp(73) -> {3896, 1948};
get_normal_exp(74) -> {3936, 1968};
get_normal_exp(75) -> {3977, 1988};
get_normal_exp(76) -> {4019, 2009};
get_normal_exp(77) -> {4060, 2030};
get_normal_exp(78) -> {4101, 2050};
get_normal_exp(79) -> {4142, 2071};
get_normal_exp(80) -> {4182, 2091};
get_normal_exp(81) -> {4497, 2248};
get_normal_exp(82) -> {4546, 2273};
get_normal_exp(83) -> {4587, 2293};
get_normal_exp(84) -> {4628, 2314};
get_normal_exp(85) -> {4670, 2335};
get_normal_exp(86) -> {4710, 2355};
get_normal_exp(87) -> {4751, 2375};
get_normal_exp(88) -> {4800, 2400};
get_normal_exp(89) -> {4841, 2420};
get_normal_exp(90) -> {4882, 2441};
get_normal_exp(91) -> {4923, 2461};
get_normal_exp(92) -> {4972, 2486};
get_normal_exp(93) -> {5013, 2506};
get_normal_exp(94) -> {5054, 2527};
get_normal_exp(95) -> {5104, 2552};
get_normal_exp(96) -> {5144, 2572};
get_normal_exp(97) -> {5185, 2592};
get_normal_exp(98) -> {5235, 2617};
get_normal_exp(99) -> {5276, 2638};
get_normal_exp(100) -> {5317, 2658};
get_normal_exp(101) -> {5317, 2658};
get_normal_exp(102) -> {5317, 2658};
get_normal_exp(103) -> {5317, 2658};
get_normal_exp(104) -> {5317, 2658};
get_normal_exp(105) -> {5317, 2658};
get_normal_exp(106) -> {5317, 2658};
get_normal_exp(107) -> {5317, 2658};
get_normal_exp(108) -> {5317, 2658};
get_normal_exp(109) -> {5317, 2658};
get_normal_exp(110) -> {5317, 2658};
get_normal_exp(111) -> {5317, 2658};
get_normal_exp(112) -> {5317, 2658};
get_normal_exp(113) -> {5317, 2658};
get_normal_exp(114) -> {5317, 2658};
get_normal_exp(115) -> {5317, 2658};
get_normal_exp(116) -> {5317, 2658};
get_normal_exp(117) -> {5317, 2658};
get_normal_exp(118) -> {5317, 2658};
get_normal_exp(119) -> {5317, 2658};
get_normal_exp(120) -> {5317, 2658};
get_normal_exp(121) -> {5317, 2658};
get_normal_exp(122) -> {5317, 2658};
get_normal_exp(123) -> {5317, 2658};
get_normal_exp(124) -> {5317, 2658};
get_normal_exp(125) -> {5317, 2658};
get_normal_exp(126) -> {5317, 2658};
get_normal_exp(127) -> {5317, 2658};
get_normal_exp(128) -> {5317, 2658};
get_normal_exp(129) -> {5317, 2658};
get_normal_exp(130) -> {5317, 2658};
get_normal_exp(131) -> {5317, 2658};
get_normal_exp(132) -> {5317, 2658};
get_normal_exp(133) -> {5317, 2658};
get_normal_exp(134) -> {5317, 2658};
get_normal_exp(135) -> {5317, 2658};
get_normal_exp(136) -> {5317, 2658};
get_normal_exp(137) -> {5317, 2658};
get_normal_exp(138) -> {5317, 2658};
get_normal_exp(139) -> {5317, 2658};
get_normal_exp(140) -> {5317, 2658};
get_normal_exp(_) -> false.

get_box(79660) ->
    [#{item_id => 20019, num => 3, ratio => 60,
       show_ratio => 100, is_cast => 0},
     #{item_id => 20025, num => 1, ratio => 80,
       show_ratio => 100, is_cast => 0},
     #{item_id => 20087, num => 1, ratio => 80,
       show_ratio => 100, is_cast => 1},
     #{item_id => 21100, num => 1, ratio => 55,
       show_ratio => 100, is_cast => 1},
     #{item_id => 21101, num => 1, ratio => 25,
       show_ratio => 100, is_cast => 1},
     #{item_id => 21102, num => 1, ratio => 10,
       show_ratio => 100, is_cast => 1},
     #{item_id => 21104, num => 1, ratio => 2,
       show_ratio => 100, is_cast => 1},
     #{item_id => 22210, num => 1, ratio => 80,
       show_ratio => 100, is_cast => 0},
     #{item_id => 22211, num => 1, ratio => 20,
       show_ratio => 100, is_cast => 1},
     #{item_id => 21312, num => 1, ratio => 100,
       show_ratio => 100, is_cast => 0},
     #{item_id => 20045, num => 2, ratio => 70,
       show_ratio => 100, is_cast => 0},
     #{item_id => 20046, num => 1, ratio => 31,
       show_ratio => 100, is_cast => 1},
     #{item_id => 21200, num => 2, ratio => 20,
       show_ratio => 100, is_cast => 0},
     #{item_id => 21201, num => 2, ratio => 20,
       show_ratio => 100, is_cast => 0},
     #{item_id => 21202, num => 1, ratio => 20,
       show_ratio => 100, is_cast => 0},
     #{item_id => 21203, num => 2, ratio => 20,
       show_ratio => 100, is_cast => 0},
     #{item_id => 21204, num => 2, ratio => 20,
       show_ratio => 100, is_cast => 0},
     #{item_id => 20006, num => 6, ratio => 240,
       show_ratio => 100, is_cast => 0},
     #{item_id => 20017, num => 1, ratio => 5,
       show_ratio => 100, is_cast => 1},
     #{item_id => 20018, num => 1, ratio => 2,
       show_ratio => 100, is_cast => 1},
     #{item_id => 29103, num => 1, ratio => 40,
       show_ratio => 100, is_cast => 0}];
get_box(79661) ->
    [#{item_id => 20020, num => 2, ratio => 150,
       show_ratio => 100, is_cast => 0},
     #{item_id => 20020, num => 5, ratio => 70,
       show_ratio => 100, is_cast => 0},
     #{item_id => 20020, num => 10, ratio => 30,
       show_ratio => 100, is_cast => 1},
     #{item_id => 20021, num => 1, ratio => 90,
       show_ratio => 100, is_cast => 0},
     #{item_id => 20022, num => 1, ratio => 80,
       show_ratio => 100, is_cast => 1},
     #{item_id => 20008, num => 1, ratio => 80,
       show_ratio => 100, is_cast => 0},
     #{item_id => 20009, num => 1, ratio => 50,
       show_ratio => 100, is_cast => 1},
     #{item_id => 20010, num => 1, ratio => 10,
       show_ratio => 100, is_cast => 1},
     #{item_id => 20011, num => 1, ratio => 5,
       show_ratio => 100, is_cast => 1},
     #{item_id => 20093, num => 1, ratio => 50,
       show_ratio => 100, is_cast => 1},
     #{item_id => 20094, num => 1, ratio => 10,
       show_ratio => 100, is_cast => 1},
     #{item_id => 20510, num => 3, ratio => 100,
       show_ratio => 100, is_cast => 0},
     #{item_id => 20511, num => 1, ratio => 50,
       show_ratio => 100, is_cast => 0},
     #{item_id => 20512, num => 1, ratio => 25,
       show_ratio => 100, is_cast => 1},
     #{item_id => 20800, num => 2, ratio => 25,
       show_ratio => 100, is_cast => 0},
     #{item_id => 20801, num => 2, ratio => 25,
       show_ratio => 100, is_cast => 0},
     #{item_id => 20802, num => 2, ratio => 25,
       show_ratio => 100, is_cast => 0},
     #{item_id => 20803, num => 2, ratio => 25,
       show_ratio => 100, is_cast => 0},
     #{item_id => 20804, num => 2, ratio => 25,
       show_ratio => 100, is_cast => 0},
     #{item_id => 20805, num => 2, ratio => 25,
       show_ratio => 100, is_cast => 0},
     #{item_id => 20806, num => 2, ratio => 25,
       show_ratio => 100, is_cast => 0},
     #{item_id => 20807, num => 2, ratio => 25,
       show_ratio => 100, is_cast => 0}];
get_box(79662) ->
    [#{item_id => 20013, num => 1, ratio => 120,
       show_ratio => 100, is_cast => 0},
     #{item_id => 20014, num => 1, ratio => 6,
       show_ratio => 100, is_cast => 1},
     #{item_id => 20074, num => 1, ratio => 100,
       show_ratio => 100, is_cast => 0},
     #{item_id => 20075, num => 1, ratio => 8,
       show_ratio => 100, is_cast => 1},
     #{item_id => 20076, num => 1, ratio => 1,
       show_ratio => 100, is_cast => 1},
     #{item_id => 20088, num => 1, ratio => 150,
       show_ratio => 100, is_cast => 0},
     #{item_id => 20089, num => 1, ratio => 30,
       show_ratio => 100, is_cast => 1},
     #{item_id => 20090, num => 1, ratio => 2,
       show_ratio => 100, is_cast => 1},
     #{item_id => 20615, num => 1, ratio => 70,
       show_ratio => 100, is_cast => 0},
     #{item_id => 20616, num => 1, ratio => 15,
       show_ratio => 100, is_cast => 1},
     #{item_id => 20617, num => 1, ratio => 2,
       show_ratio => 100, is_cast => 1},
     #{item_id => 20039, num => 1, ratio => 30,
       show_ratio => 100, is_cast => 1},
     #{item_id => 20040, num => 1, ratio => 3,
       show_ratio => 100, is_cast => 1},
     #{item_id => 20006, num => 10, ratio => 230,
       show_ratio => 100, is_cast => 0},
     #{item_id => 29103, num => 1, ratio => 30,
       show_ratio => 100, is_cast => 0},
     #{item_id => 29102, num => 1, ratio => 3,
       show_ratio => 100, is_cast => 1},
     #{item_id => 21312, num => 1, ratio => 200,
       show_ratio => 100, is_cast => 0},
     #{item_id => 20007, num => 1, ratio => 30,
       show_ratio => 100, is_cast => 0}];
get_box(79663) ->
    [#{item_id => 90000, num => 60000, ratio => 190,
       show_ratio => 100, is_cast => 0},
     #{item_id => 90000, num => 150000, ratio => 80,
       show_ratio => 100, is_cast => 0},
     #{item_id => 90000, num => 500000, ratio => 25,
       show_ratio => 100, is_cast => 0},
     #{item_id => 90000, num => 2000000, ratio => 12,
       show_ratio => 100, is_cast => 1},
     #{item_id => 90003, num => 3000, ratio => 173,
       show_ratio => 100, is_cast => 0},
     #{item_id => 90003, num => 6000, ratio => 50,
       show_ratio => 100, is_cast => 0},
     #{item_id => 90003, num => 20000, ratio => 10,
       show_ratio => 100, is_cast => 1},
     #{item_id => 90012, num => 100, ratio => 170,
       show_ratio => 100, is_cast => 0},
     #{item_id => 90012, num => 200, ratio => 50,
       show_ratio => 100, is_cast => 0},
     #{item_id => 90012, num => 800, ratio => 10,
       show_ratio => 100, is_cast => 1},
     #{item_id => 90011, num => 50, ratio => 170,
       show_ratio => 100, is_cast => 0},
     #{item_id => 90011, num => 150, ratio => 50,
       show_ratio => 100, is_cast => 0},
     #{item_id => 90011, num => 500, ratio => 10,
       show_ratio => 100, is_cast => 1}];
get_box(_) -> [].

get_combat() ->
    [#{item_id => 20006, num => 5, ratio => 50,
       is_cast => 0},
     #{item_id => 21220, num => 1, ratio => 30,
       is_cast => 0},
     #{item_id => 20046, num => 1, ratio => 8, is_cast => 1},
     #{item_id => 20020, num => 1, ratio => 15,
       is_cast => 0},
     #{item_id => 20025, num => 1, ratio => 21,
       is_cast => 0},
     #{item_id => 20054, num => 1, ratio => 15,
       is_cast => 1},
     #{item_id => 21100, num => 1, ratio => 5, is_cast => 1},
     #{item_id => 20095, num => 1, ratio => 1, is_cast => 1},
     #{item_id => 20075, num => 1, ratio => 1, is_cast => 1},
     #{item_id => 20616, num => 1, ratio => 2, is_cast => 1},
     #{item_id => 20617, num => 1, ratio => 1, is_cast => 1},
     #{item_id => 20021, num => 1, ratio => 5, is_cast => 0},
     #{item_id => 20088, num => 1, ratio => 6, is_cast => 0},
     #{item_id => 20045, num => 1, ratio => 10,
       is_cast => 0},
     #{item_id => 22450, num => 1, ratio => 10,
       is_cast => 1},
     #{item_id => 0, num => 1, ratio => 820, is_cast => 0}].

get_mail() ->
    [#{item_id => 20046, num => 1, ratio => 60, is_die => 1,
       is_cast => 0},
     #{item_id => 20025, num => 1, ratio => 100, is_die => 1,
       is_cast => 0},
     #{item_id => 20087, num => 1, ratio => 100, is_die => 1,
       is_cast => 0},
     #{item_id => 20075, num => 1, ratio => 80, is_die => 1,
       is_cast => 1},
     #{item_id => 20616, num => 1, ratio => 40, is_die => 1,
       is_cast => 1},
     #{item_id => 20617, num => 1, ratio => 10, is_die => 1,
       is_cast => 1},
     #{item_id => 21100, num => 1, ratio => 30, is_die => 1,
       is_cast => 0},
     #{item_id => 20038, num => 1, ratio => 1, is_die => 1,
       is_cast => 1},
     #{item_id => 20021, num => 1, ratio => 49, is_die => 1,
       is_cast => 0},
     #{item_id => 20095, num => 1, ratio => 2, is_die => 1,
       is_cast => 1},
     #{item_id => 20045, num => 3, ratio => 50, is_die => 1,
       is_cast => 0},
     #{item_id => 20002, num => 1, ratio => 130, is_die => 1,
       is_cast => 0},
     #{item_id => 20009, num => 1, ratio => 30, is_die => 1,
       is_cast => 1},
     #{item_id => 20020, num => 3, ratio => 80, is_die => 1,
       is_cast => 0},
     #{item_id => 20039, num => 1, ratio => 60, is_die => 1,
       is_cast => 0},
     #{item_id => 20040, num => 1, ratio => 15, is_die => 1,
       is_cast => 1},
     #{item_id => 20006, num => 8, ratio => 113, is_die => 1,
       is_cast => 0},
     #{item_id => 22450, num => 1, ratio => 50, is_die => 1,
       is_cast => 1},
     #{item_id => 20046, num => 1, ratio => 60, is_die => 0,
       is_cast => 1},
     #{item_id => 20025, num => 1, ratio => 100, is_die => 0,
       is_cast => 0},
     #{item_id => 20087, num => 1, ratio => 100, is_die => 0,
       is_cast => 1},
     #{item_id => 20075, num => 1, ratio => 80, is_die => 0,
       is_cast => 1},
     #{item_id => 20616, num => 1, ratio => 30, is_die => 0,
       is_cast => 1},
     #{item_id => 21100, num => 1, ratio => 20, is_die => 0,
       is_cast => 1},
     #{item_id => 20038, num => 1, ratio => 1, is_die => 0,
       is_cast => 1},
     #{item_id => 20021, num => 1, ratio => 40, is_die => 0,
       is_cast => 1},
     #{item_id => 20095, num => 1, ratio => 2, is_die => 0,
       is_cast => 1},
     #{item_id => 20045, num => 1, ratio => 40, is_die => 0,
       is_cast => 0},
     #{item_id => 20002, num => 1, ratio => 189, is_die => 0,
       is_cast => 0},
     #{item_id => 20009, num => 1, ratio => 30, is_die => 0,
       is_cast => 1},
     #{item_id => 20020, num => 2, ratio => 80, is_die => 0,
       is_cast => 0},
     #{item_id => 20039, num => 1, ratio => 70, is_die => 0,
       is_cast => 1},
     #{item_id => 20040, num => 1, ratio => 5, is_die => 0,
       is_cast => 1},
     #{item_id => 20006, num => 5, ratio => 103, is_die => 0,
       is_cast => 0},
     #{item_id => 22450, num => 1, ratio => 50, is_die => 0,
       is_cast => 1}].

