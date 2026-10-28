-file("src/data/meet_pet_data.erl", 1).

-module(meet_pet_data).

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

-file("src/data/meet_pet_data.erl", 14).

-file("inc/meet_pet.hrl", 1).

-record(meet_pet_camp,
        {ver = 1,
         rid,
         camp_id = 0,
         camp_val = 0,
         status = 1,
         round = 0,
         day_round = 0,
         camp_list = [],
         pet_base_id = 0,
         ext = #{rand_pos => undefined, triggers => []}}).

-record(meet_pet_camp_data,
        {camp_id = 0,
         round = 0,
         weight = 0,
         unit_base_id = 0,
         battle_id = 0,
         map_base_id = 0}).

-record(meet_pet,
        {switch = close,
         ts,
         timeout,
         phase = idle,
         pet_ids = [],
         battle_ids = [],
         ext =
             #{pet_queue => queue:new(), notice_ref => undefined}}).

-record(meet_pet_item_reward,
        {base_id = 0,
         classes = 0,
         weight = 0,
         num = 0,
         is_notice = 0}).

-file("src/data/meet_pet_data.erl", 15).

-file("inc/gain.hrl", 1).

-record(gain,
        {label :: undefined | atom(),
         val :: undefined | term(),
         msg = "" :: list(),
         source = 0 :: non_neg_integer(),
         notice_msg = "" :: list(),
         reason :: undefined | atom(),
         ext = 0 :: term(),
         notice = 0 :: 0..1,
         ext_val = 0}).

-record(loss,
        {label :: undefined | atom(),
         val :: undefined | term(),
         msg = "" :: list(),
         notice_msg = "" :: list(),
         source = 0 :: non_neg_integer(),
         reason :: undefined | atom(),
         ext = 0 :: term(),
         ext_val = 0,
         auto_scene = "" :: list()}).

-record(gain_text_opts,
        {order = loss :: gain | loss,
         gain_tag = "" :: string(),
         loss_tag = "" :: string(),
         split_str = "，" :: string(),
         split_op_str = "，" :: string(),
         merge_type = [] :: list(),
         fly_to_bag = 0 :: non_neg_integer()}).

-file("src/data/meet_pet_data.erl", 16).

-export([pet_list/0,
         look_id/1,
         pet_unit_id/1,
         camp_ratio/1,
         lev_reward/1,
         camp/1,
         camp_list/1,
         combat_rewards/0,
         commit_rewards/0]).

pet_list() ->
    [{10000, 1, 1},
     {10001, 1, 1},
     {10002, 1, 1},
     {10003, 15, 10},
     {10004, 15, 10},
     {10005, 15, 10},
     {10006, 35, 50},
     {10007, 35, 50},
     {10008, 35, 50},
     {10009, 45, 100},
     {10010, 45, 100},
     {10011, 45, 100},
     {10012, 55, 200},
     {10013, 55, 200},
     {10014, 55, 200},
     {10015, 65, 500},
     {10016, 65, 500},
     {10017, 65, 500},
     {10022, 75, 500}].

look_id(10000) -> 11000;
look_id(10001) -> 11001;
look_id(10002) -> 11002;
look_id(10003) -> 11003;
look_id(10004) -> 11004;
look_id(10005) -> 11005;
look_id(10006) -> 11006;
look_id(10007) -> 11007;
look_id(10008) -> 11008;
look_id(10009) -> 11009;
look_id(10010) -> 11010;
look_id(10011) -> 11011;
look_id(10012) -> 11012;
look_id(10013) -> 11013;
look_id(10014) -> 11014;
look_id(10015) -> 11015;
look_id(10016) -> 11016;
look_id(10017) -> 11017;
look_id(10022) -> 11018;
look_id(_PetBaseId) -> false.

pet_unit_id(10000) -> 31700;
pet_unit_id(10001) -> 31701;
pet_unit_id(10002) -> 31702;
pet_unit_id(10003) -> 31703;
pet_unit_id(10004) -> 31704;
pet_unit_id(10005) -> 31705;
pet_unit_id(10006) -> 31706;
pet_unit_id(10007) -> 31707;
pet_unit_id(10008) -> 31708;
pet_unit_id(10009) -> 31709;
pet_unit_id(10010) -> 31710;
pet_unit_id(10011) -> 31711;
pet_unit_id(10012) -> 31712;
pet_unit_id(10013) -> 31713;
pet_unit_id(10014) -> 31714;
pet_unit_id(10015) -> 31715;
pet_unit_id(10016) -> 31716;
pet_unit_id(10017) -> 31717;
pet_unit_id(10022) -> 31718;
pet_unit_id(_PetBaseId) -> false.

camp_ratio(91301) ->
    #{exp => 1000, prac_exp => 1000, pet_exp => 1000};
camp_ratio(91311) ->
    #{exp => 2000, prac_exp => 2000, pet_exp => 2000};
camp_ratio(91321) ->
    #{exp => 3000, prac_exp => 3000, pet_exp => 3000};
camp_ratio(_UnitBaseId) -> false.

lev_reward(1) ->
    #{exp => 100, prac_exp => 10, pet_exp => 1};
lev_reward(2) ->
    #{exp => 200, prac_exp => 20, pet_exp => 2};
lev_reward(3) ->
    #{exp => 300, prac_exp => 30, pet_exp => 3};
lev_reward(4) ->
    #{exp => 400, prac_exp => 40, pet_exp => 4};
lev_reward(5) ->
    #{exp => 500, prac_exp => 50, pet_exp => 5};
lev_reward(6) ->
    #{exp => 600, prac_exp => 60, pet_exp => 6};
lev_reward(7) ->
    #{exp => 700, prac_exp => 70, pet_exp => 7};
lev_reward(8) ->
    #{exp => 800, prac_exp => 80, pet_exp => 8};
lev_reward(9) ->
    #{exp => 900, prac_exp => 90, pet_exp => 9};
lev_reward(10) ->
    #{exp => 1000, prac_exp => 100, pet_exp => 10};
lev_reward(11) ->
    #{exp => 1100, prac_exp => 110, pet_exp => 11};
lev_reward(12) ->
    #{exp => 1200, prac_exp => 120, pet_exp => 12};
lev_reward(13) ->
    #{exp => 1300, prac_exp => 130, pet_exp => 13};
lev_reward(14) ->
    #{exp => 1400, prac_exp => 140, pet_exp => 14};
lev_reward(15) ->
    #{exp => 1500, prac_exp => 150, pet_exp => 15};
lev_reward(16) ->
    #{exp => 1600, prac_exp => 160, pet_exp => 16};
lev_reward(17) ->
    #{exp => 1700, prac_exp => 170, pet_exp => 17};
lev_reward(18) ->
    #{exp => 1800, prac_exp => 180, pet_exp => 18};
lev_reward(19) ->
    #{exp => 1900, prac_exp => 190, pet_exp => 19};
lev_reward(20) ->
    #{exp => 2000, prac_exp => 200, pet_exp => 20};
lev_reward(21) ->
    #{exp => 2100, prac_exp => 210, pet_exp => 21};
lev_reward(22) ->
    #{exp => 2200, prac_exp => 220, pet_exp => 22};
lev_reward(23) ->
    #{exp => 2300, prac_exp => 230, pet_exp => 23};
lev_reward(24) ->
    #{exp => 2400, prac_exp => 240, pet_exp => 24};
lev_reward(25) ->
    #{exp => 2500, prac_exp => 250, pet_exp => 25};
lev_reward(26) ->
    #{exp => 2600, prac_exp => 260, pet_exp => 26};
lev_reward(27) ->
    #{exp => 2700, prac_exp => 270, pet_exp => 27};
lev_reward(28) ->
    #{exp => 2800, prac_exp => 280, pet_exp => 28};
lev_reward(29) ->
    #{exp => 2900, prac_exp => 290, pet_exp => 29};
lev_reward(30) ->
    #{exp => 3000, prac_exp => 300, pet_exp => 30};
lev_reward(31) ->
    #{exp => 3100, prac_exp => 310, pet_exp => 31};
lev_reward(32) ->
    #{exp => 3200, prac_exp => 320, pet_exp => 32};
lev_reward(33) ->
    #{exp => 3300, prac_exp => 330, pet_exp => 33};
lev_reward(34) ->
    #{exp => 3400, prac_exp => 340, pet_exp => 34};
lev_reward(35) ->
    #{exp => 3500, prac_exp => 350, pet_exp => 35};
lev_reward(36) ->
    #{exp => 3600, prac_exp => 360, pet_exp => 36};
lev_reward(37) ->
    #{exp => 3700, prac_exp => 370, pet_exp => 37};
lev_reward(38) ->
    #{exp => 3800, prac_exp => 380, pet_exp => 38};
lev_reward(39) ->
    #{exp => 3900, prac_exp => 390, pet_exp => 39};
lev_reward(40) ->
    #{exp => 4000, prac_exp => 400, pet_exp => 40};
lev_reward(41) ->
    #{exp => 4100, prac_exp => 410, pet_exp => 41};
lev_reward(42) ->
    #{exp => 4200, prac_exp => 420, pet_exp => 42};
lev_reward(43) ->
    #{exp => 4300, prac_exp => 430, pet_exp => 43};
lev_reward(44) ->
    #{exp => 4400, prac_exp => 440, pet_exp => 44};
lev_reward(45) ->
    #{exp => 4500, prac_exp => 450, pet_exp => 45};
lev_reward(46) ->
    #{exp => 4600, prac_exp => 460, pet_exp => 46};
lev_reward(47) ->
    #{exp => 4700, prac_exp => 470, pet_exp => 47};
lev_reward(48) ->
    #{exp => 4800, prac_exp => 480, pet_exp => 48};
lev_reward(49) ->
    #{exp => 4900, prac_exp => 490, pet_exp => 49};
lev_reward(50) ->
    #{exp => 5000, prac_exp => 500, pet_exp => 50};
lev_reward(51) ->
    #{exp => 5100, prac_exp => 510, pet_exp => 51};
lev_reward(52) ->
    #{exp => 5200, prac_exp => 520, pet_exp => 52};
lev_reward(53) ->
    #{exp => 5300, prac_exp => 530, pet_exp => 53};
lev_reward(54) ->
    #{exp => 5400, prac_exp => 540, pet_exp => 54};
lev_reward(55) ->
    #{exp => 5500, prac_exp => 550, pet_exp => 55};
lev_reward(56) ->
    #{exp => 5600, prac_exp => 560, pet_exp => 56};
lev_reward(57) ->
    #{exp => 5700, prac_exp => 570, pet_exp => 57};
lev_reward(58) ->
    #{exp => 5800, prac_exp => 580, pet_exp => 58};
lev_reward(59) ->
    #{exp => 5900, prac_exp => 590, pet_exp => 59};
lev_reward(60) ->
    #{exp => 6000, prac_exp => 600, pet_exp => 60};
lev_reward(61) ->
    #{exp => 6100, prac_exp => 610, pet_exp => 61};
lev_reward(62) ->
    #{exp => 6200, prac_exp => 620, pet_exp => 62};
lev_reward(63) ->
    #{exp => 6300, prac_exp => 630, pet_exp => 63};
lev_reward(64) ->
    #{exp => 6400, prac_exp => 640, pet_exp => 64};
lev_reward(65) ->
    #{exp => 6500, prac_exp => 650, pet_exp => 65};
lev_reward(66) ->
    #{exp => 6600, prac_exp => 660, pet_exp => 66};
lev_reward(67) ->
    #{exp => 6700, prac_exp => 670, pet_exp => 67};
lev_reward(68) ->
    #{exp => 6800, prac_exp => 680, pet_exp => 68};
lev_reward(69) ->
    #{exp => 6900, prac_exp => 690, pet_exp => 69};
lev_reward(70) ->
    #{exp => 7000, prac_exp => 700, pet_exp => 70};
lev_reward(71) ->
    #{exp => 7100, prac_exp => 710, pet_exp => 71};
lev_reward(72) ->
    #{exp => 7200, prac_exp => 720, pet_exp => 72};
lev_reward(73) ->
    #{exp => 7300, prac_exp => 730, pet_exp => 73};
lev_reward(74) ->
    #{exp => 7400, prac_exp => 740, pet_exp => 74};
lev_reward(75) ->
    #{exp => 7500, prac_exp => 750, pet_exp => 75};
lev_reward(76) ->
    #{exp => 7600, prac_exp => 760, pet_exp => 76};
lev_reward(77) ->
    #{exp => 7700, prac_exp => 770, pet_exp => 77};
lev_reward(78) ->
    #{exp => 7800, prac_exp => 780, pet_exp => 78};
lev_reward(79) ->
    #{exp => 7900, prac_exp => 790, pet_exp => 79};
lev_reward(80) ->
    #{exp => 8000, prac_exp => 800, pet_exp => 80};
lev_reward(81) ->
    #{exp => 8100, prac_exp => 810, pet_exp => 81};
lev_reward(82) ->
    #{exp => 8200, prac_exp => 820, pet_exp => 82};
lev_reward(83) ->
    #{exp => 8300, prac_exp => 830, pet_exp => 83};
lev_reward(84) ->
    #{exp => 8400, prac_exp => 840, pet_exp => 84};
lev_reward(85) ->
    #{exp => 8500, prac_exp => 850, pet_exp => 85};
lev_reward(86) ->
    #{exp => 8600, prac_exp => 860, pet_exp => 86};
lev_reward(87) ->
    #{exp => 8700, prac_exp => 870, pet_exp => 87};
lev_reward(88) ->
    #{exp => 8800, prac_exp => 880, pet_exp => 88};
lev_reward(89) ->
    #{exp => 8900, prac_exp => 890, pet_exp => 89};
lev_reward(90) ->
    #{exp => 9000, prac_exp => 900, pet_exp => 90};
lev_reward(91) ->
    #{exp => 9100, prac_exp => 910, pet_exp => 91};
lev_reward(92) ->
    #{exp => 9200, prac_exp => 920, pet_exp => 92};
lev_reward(93) ->
    #{exp => 9300, prac_exp => 930, pet_exp => 93};
lev_reward(94) ->
    #{exp => 9400, prac_exp => 940, pet_exp => 94};
lev_reward(95) ->
    #{exp => 9500, prac_exp => 950, pet_exp => 95};
lev_reward(96) ->
    #{exp => 9600, prac_exp => 960, pet_exp => 96};
lev_reward(97) ->
    #{exp => 9700, prac_exp => 970, pet_exp => 97};
lev_reward(98) ->
    #{exp => 9800, prac_exp => 980, pet_exp => 98};
lev_reward(99) ->
    #{exp => 9900, prac_exp => 990, pet_exp => 99};
lev_reward(100) ->
    #{exp => 10000, prac_exp => 1000, pet_exp => 100};
lev_reward(101) ->
    #{exp => 10100, prac_exp => 1010, pet_exp => 101};
lev_reward(102) ->
    #{exp => 10200, prac_exp => 1020, pet_exp => 102};
lev_reward(103) ->
    #{exp => 10300, prac_exp => 1030, pet_exp => 103};
lev_reward(104) ->
    #{exp => 10400, prac_exp => 1040, pet_exp => 104};
lev_reward(105) ->
    #{exp => 10500, prac_exp => 1050, pet_exp => 105};
lev_reward(106) ->
    #{exp => 10600, prac_exp => 1060, pet_exp => 106};
lev_reward(107) ->
    #{exp => 10700, prac_exp => 1070, pet_exp => 107};
lev_reward(108) ->
    #{exp => 10800, prac_exp => 1080, pet_exp => 108};
lev_reward(109) ->
    #{exp => 10900, prac_exp => 1090, pet_exp => 109};
lev_reward(110) ->
    #{exp => 11000, prac_exp => 1100, pet_exp => 110};
lev_reward(111) ->
    #{exp => 11100, prac_exp => 1110, pet_exp => 111};
lev_reward(112) ->
    #{exp => 11200, prac_exp => 1120, pet_exp => 112};
lev_reward(113) ->
    #{exp => 11300, prac_exp => 1130, pet_exp => 113};
lev_reward(114) ->
    #{exp => 11400, prac_exp => 1140, pet_exp => 114};
lev_reward(115) ->
    #{exp => 11500, prac_exp => 1150, pet_exp => 115};
lev_reward(116) ->
    #{exp => 11600, prac_exp => 1160, pet_exp => 116};
lev_reward(117) ->
    #{exp => 11700, prac_exp => 1170, pet_exp => 117};
lev_reward(118) ->
    #{exp => 11800, prac_exp => 1180, pet_exp => 118};
lev_reward(119) ->
    #{exp => 11900, prac_exp => 1190, pet_exp => 119};
lev_reward(120) ->
    #{exp => 12000, prac_exp => 1200, pet_exp => 120};
lev_reward(121) ->
    #{exp => 12100, prac_exp => 1210, pet_exp => 121};
lev_reward(122) ->
    #{exp => 12200, prac_exp => 1220, pet_exp => 122};
lev_reward(123) ->
    #{exp => 12300, prac_exp => 1230, pet_exp => 123};
lev_reward(124) ->
    #{exp => 12400, prac_exp => 1240, pet_exp => 124};
lev_reward(125) ->
    #{exp => 12500, prac_exp => 1250, pet_exp => 125};
lev_reward(126) ->
    #{exp => 12600, prac_exp => 1260, pet_exp => 126};
lev_reward(127) ->
    #{exp => 12700, prac_exp => 1270, pet_exp => 127};
lev_reward(128) ->
    #{exp => 12800, prac_exp => 1280, pet_exp => 128};
lev_reward(129) ->
    #{exp => 12900, prac_exp => 1290, pet_exp => 129};
lev_reward(130) ->
    #{exp => 13000, prac_exp => 1300, pet_exp => 130};
lev_reward(131) ->
    #{exp => 13100, prac_exp => 1310, pet_exp => 131};
lev_reward(132) ->
    #{exp => 13200, prac_exp => 1320, pet_exp => 132};
lev_reward(133) ->
    #{exp => 13300, prac_exp => 1330, pet_exp => 133};
lev_reward(134) ->
    #{exp => 13400, prac_exp => 1340, pet_exp => 134};
lev_reward(135) ->
    #{exp => 13500, prac_exp => 1350, pet_exp => 135};
lev_reward(136) ->
    #{exp => 13600, prac_exp => 1360, pet_exp => 136};
lev_reward(137) ->
    #{exp => 13700, prac_exp => 1370, pet_exp => 137};
lev_reward(138) ->
    #{exp => 13800, prac_exp => 1380, pet_exp => 138};
lev_reward(139) ->
    #{exp => 13900, prac_exp => 1390, pet_exp => 139};
lev_reward(140) ->
    #{exp => 14000, prac_exp => 1400, pet_exp => 140};
lev_reward(141) ->
    #{exp => 14100, prac_exp => 1410, pet_exp => 141};
lev_reward(142) ->
    #{exp => 14200, prac_exp => 1420, pet_exp => 142};
lev_reward(143) ->
    #{exp => 14300, prac_exp => 1430, pet_exp => 143};
lev_reward(144) ->
    #{exp => 14400, prac_exp => 1440, pet_exp => 144};
lev_reward(145) ->
    #{exp => 14500, prac_exp => 1450, pet_exp => 145};
lev_reward(146) ->
    #{exp => 14600, prac_exp => 1460, pet_exp => 146};
lev_reward(147) ->
    #{exp => 14700, prac_exp => 1470, pet_exp => 147};
lev_reward(148) ->
    #{exp => 14800, prac_exp => 1480, pet_exp => 148};
lev_reward(149) ->
    #{exp => 14900, prac_exp => 1490, pet_exp => 149};
lev_reward(150) ->
    #{exp => 15000, prac_exp => 1500, pet_exp => 150};
lev_reward(151) ->
    #{exp => 15100, prac_exp => 1510, pet_exp => 151};
lev_reward(152) ->
    #{exp => 15200, prac_exp => 1520, pet_exp => 152};
lev_reward(153) ->
    #{exp => 15300, prac_exp => 1530, pet_exp => 153};
lev_reward(154) ->
    #{exp => 15400, prac_exp => 1540, pet_exp => 154};
lev_reward(155) ->
    #{exp => 15500, prac_exp => 1550, pet_exp => 155};
lev_reward(156) ->
    #{exp => 15600, prac_exp => 1560, pet_exp => 156};
lev_reward(157) ->
    #{exp => 15700, prac_exp => 1570, pet_exp => 157};
lev_reward(158) ->
    #{exp => 15800, prac_exp => 1580, pet_exp => 158};
lev_reward(159) ->
    #{exp => 15900, prac_exp => 1590, pet_exp => 159};
lev_reward(160) ->
    #{exp => 16000, prac_exp => 1600, pet_exp => 160};
lev_reward(161) ->
    #{exp => 16100, prac_exp => 1610, pet_exp => 161};
lev_reward(162) ->
    #{exp => 16200, prac_exp => 1620, pet_exp => 162};
lev_reward(163) ->
    #{exp => 16300, prac_exp => 1630, pet_exp => 163};
lev_reward(164) ->
    #{exp => 16400, prac_exp => 1640, pet_exp => 164};
lev_reward(165) ->
    #{exp => 16500, prac_exp => 1650, pet_exp => 165};
lev_reward(166) ->
    #{exp => 16600, prac_exp => 1660, pet_exp => 166};
lev_reward(167) ->
    #{exp => 16700, prac_exp => 1670, pet_exp => 167};
lev_reward(168) ->
    #{exp => 16800, prac_exp => 1680, pet_exp => 168};
lev_reward(169) ->
    #{exp => 16900, prac_exp => 1690, pet_exp => 169};
lev_reward(170) ->
    #{exp => 17000, prac_exp => 1700, pet_exp => 170};
lev_reward(171) ->
    #{exp => 17100, prac_exp => 1710, pet_exp => 171};
lev_reward(172) ->
    #{exp => 17200, prac_exp => 1720, pet_exp => 172};
lev_reward(173) ->
    #{exp => 17300, prac_exp => 1730, pet_exp => 173};
lev_reward(174) ->
    #{exp => 17400, prac_exp => 1740, pet_exp => 174};
lev_reward(175) ->
    #{exp => 17500, prac_exp => 1750, pet_exp => 175};
lev_reward(176) ->
    #{exp => 17600, prac_exp => 1760, pet_exp => 176};
lev_reward(177) ->
    #{exp => 17700, prac_exp => 1770, pet_exp => 177};
lev_reward(178) ->
    #{exp => 17800, prac_exp => 1780, pet_exp => 178};
lev_reward(179) ->
    #{exp => 17900, prac_exp => 1790, pet_exp => 179};
lev_reward(180) ->
    #{exp => 18000, prac_exp => 1800, pet_exp => 180};
lev_reward(181) ->
    #{exp => 18100, prac_exp => 1810, pet_exp => 181};
lev_reward(182) ->
    #{exp => 18200, prac_exp => 1820, pet_exp => 182};
lev_reward(183) ->
    #{exp => 18300, prac_exp => 1830, pet_exp => 183};
lev_reward(184) ->
    #{exp => 18400, prac_exp => 1840, pet_exp => 184};
lev_reward(185) ->
    #{exp => 18500, prac_exp => 1850, pet_exp => 185};
lev_reward(186) ->
    #{exp => 18600, prac_exp => 1860, pet_exp => 186};
lev_reward(187) ->
    #{exp => 18700, prac_exp => 1870, pet_exp => 187};
lev_reward(188) ->
    #{exp => 18800, prac_exp => 1880, pet_exp => 188};
lev_reward(189) ->
    #{exp => 18900, prac_exp => 1890, pet_exp => 189};
lev_reward(190) ->
    #{exp => 19000, prac_exp => 1900, pet_exp => 190};
lev_reward(191) ->
    #{exp => 19100, prac_exp => 1910, pet_exp => 191};
lev_reward(192) ->
    #{exp => 19200, prac_exp => 1920, pet_exp => 192};
lev_reward(193) ->
    #{exp => 19300, prac_exp => 1930, pet_exp => 193};
lev_reward(194) ->
    #{exp => 19400, prac_exp => 1940, pet_exp => 194};
lev_reward(195) ->
    #{exp => 19500, prac_exp => 1950, pet_exp => 195};
lev_reward(196) ->
    #{exp => 19600, prac_exp => 1960, pet_exp => 196};
lev_reward(197) ->
    #{exp => 19700, prac_exp => 1970, pet_exp => 197};
lev_reward(198) ->
    #{exp => 19800, prac_exp => 1980, pet_exp => 198};
lev_reward(199) ->
    #{exp => 19900, prac_exp => 1990, pet_exp => 199};
lev_reward(200) ->
    #{exp => 20000, prac_exp => 2000, pet_exp => 200};
lev_reward(_Lev) -> false.

camp(1) ->
    #meet_pet_camp_data{camp_id = 1, round = 1,
                        weight = 100, unit_base_id = 91301, battle_id = 91001,
                        map_base_id = 10001};
camp(2) ->
    #meet_pet_camp_data{camp_id = 2, round = 2,
                        weight = 100, unit_base_id = 91311, battle_id = 91002,
                        map_base_id = 10002};
camp(3) ->
    #meet_pet_camp_data{camp_id = 3, round = 3,
                        weight = 100, unit_base_id = 91321, battle_id = 91003,
                        map_base_id = 10003};
camp(_CampId) -> false.

camp_list(1) ->
    [#meet_pet_camp_data{camp_id = 1, round = 1,
                         weight = 100, unit_base_id = 91301, battle_id = 91001,
                         map_base_id = 10001}];
camp_list(2) ->
    [#meet_pet_camp_data{camp_id = 2, round = 2,
                         weight = 100, unit_base_id = 91311, battle_id = 91002,
                         map_base_id = 10002}];
camp_list(3) ->
    [#meet_pet_camp_data{camp_id = 3, round = 3,
                         weight = 100, unit_base_id = 91321, battle_id = 91003,
                         map_base_id = 10003}];
camp_list(_Round) -> [].

combat_rewards() ->
    [#meet_pet_item_reward{base_id = 20006, classes = 1,
                           num = 10, weight = 100, is_notice = 1},
     #meet_pet_item_reward{base_id = 20052, classes = 2,
                           num = 2, weight = 100, is_notice = 1},
     #meet_pet_item_reward{base_id = 20046, classes = 3,
                           num = 1, weight = 100, is_notice = 1},
     #meet_pet_item_reward{base_id = 20021, classes = 4,
                           num = 1, weight = 100, is_notice = 1},
     #meet_pet_item_reward{base_id = 20022, classes = 5,
                           num = 1, weight = 100, is_notice = 1},
     #meet_pet_item_reward{base_id = 20025, classes = 0,
                           num = 1, weight = 100, is_notice = 0},
     #meet_pet_item_reward{base_id = 20000, classes = 0,
                           num = 1, weight = 100, is_notice = 0},
     #meet_pet_item_reward{base_id = 20087, classes = 0,
                           num = 1, weight = 100, is_notice = 0},
     #meet_pet_item_reward{base_id = 20074, classes = 0,
                           num = 1, weight = 100, is_notice = 0},
     #meet_pet_item_reward{base_id = 21100, classes = 0,
                           num = 1, weight = 100, is_notice = 0},
     #meet_pet_item_reward{base_id = 20095, classes = 0,
                           num = 1, weight = 100, is_notice = 0}].

commit_rewards() ->
    [#meet_pet_item_reward{base_id = 20006, classes = 1,
                           num = 10, weight = 100, is_notice = 1},
     #meet_pet_item_reward{base_id = 20052, classes = 2,
                           num = 2, weight = 100, is_notice = 1},
     #meet_pet_item_reward{base_id = 20046, classes = 3,
                           num = 1, weight = 100, is_notice = 1},
     #meet_pet_item_reward{base_id = 20021, classes = 4,
                           num = 1, weight = 100, is_notice = 1},
     #meet_pet_item_reward{base_id = 20022, classes = 5,
                           num = 1, weight = 100, is_notice = 1},
     #meet_pet_item_reward{base_id = 20025, classes = 0,
                           num = 1, weight = 100, is_notice = 0},
     #meet_pet_item_reward{base_id = 20000, classes = 0,
                           num = 1, weight = 100, is_notice = 0},
     #meet_pet_item_reward{base_id = 20087, classes = 0,
                           num = 1, weight = 100, is_notice = 0},
     #meet_pet_item_reward{base_id = 20074, classes = 0,
                           num = 1, weight = 100, is_notice = 0},
     #meet_pet_item_reward{base_id = 21100, classes = 0,
                           num = 1, weight = 100, is_notice = 0},
     #meet_pet_item_reward{base_id = 20095, classes = 0,
                           num = 1, weight = 100, is_notice = 0}].

