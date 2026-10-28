-file("src/data/stars_trial_data.erl", 1).

-module(stars_trial_data).

-export([get_unit/1,
         lists_unit/0,
         get_formation/1,
         unit_info/1,
         get_pet_slave/1,
         get_rewards/0,
         get_score_base/1,
         get_score_add/2]).

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

-file("src/data/stars_trial_data.erl", 19).

get_unit(3) ->
    [82001, 82002, 82003, 82004, 82005, 82006, 82007];
get_unit(1) ->
    [82008, 82009, 82010, 82011, 82012, 82013, 82014];
get_unit(2) ->
    [82015, 82016, 82017, 82018, 82019, 82020, 82021];
get_unit(6) ->
    [82022, 82023, 82024, 82025, 82026, 82027, 82028];
get_unit(4) ->
    [82029, 82030, 82031, 82032, 82033, 82034, 82035];
get_unit(5) ->
    [82036, 82037, 82038, 82039, 82040, 82041, 82042];
get_unit(7) ->
    [82043, 82044, 82045, 82046, 82047, 82048, 82049];
get_unit(_) -> [].

lists_unit() ->
    [82001,
     82002,
     82003,
     82004,
     82005,
     82006,
     82007,
     82008,
     82009,
     82010,
     82011,
     82012,
     82013,
     82014,
     82015,
     82016,
     82017,
     82018,
     82019,
     82020,
     82021,
     82022,
     82023,
     82024,
     82025,
     82026,
     82027,
     82028,
     82029,
     82030,
     82031,
     82032,
     82033,
     82034,
     82035,
     82036,
     82037,
     82038,
     82039,
     82040,
     82041,
     82042,
     82043,
     82044,
     82045,
     82046,
     82047,
     82048,
     82049].

get_formation(1) -> {5, 4, 0, 0, 0};
get_formation(2) -> {5, 0, 0, 0, 0};
get_formation(3) -> {5, 5, 4, 0, 0};
get_formation(4) -> {5, 4, 4, 0, 0};
get_formation(_) -> false.

unit_info(82001) -> #{unit_id => 82001, classes => 3};
unit_info(82002) -> #{unit_id => 82002, classes => 3};
unit_info(82003) -> #{unit_id => 82003, classes => 3};
unit_info(82004) -> #{unit_id => 82004, classes => 3};
unit_info(82005) -> #{unit_id => 82005, classes => 3};
unit_info(82006) -> #{unit_id => 82006, classes => 3};
unit_info(82007) -> #{unit_id => 82007, classes => 3};
unit_info(82008) -> #{unit_id => 82008, classes => 1};
unit_info(82009) -> #{unit_id => 82009, classes => 1};
unit_info(82010) -> #{unit_id => 82010, classes => 1};
unit_info(82011) -> #{unit_id => 82011, classes => 1};
unit_info(82012) -> #{unit_id => 82012, classes => 1};
unit_info(82013) -> #{unit_id => 82013, classes => 1};
unit_info(82014) -> #{unit_id => 82014, classes => 1};
unit_info(82015) -> #{unit_id => 82015, classes => 2};
unit_info(82016) -> #{unit_id => 82016, classes => 2};
unit_info(82017) -> #{unit_id => 82017, classes => 2};
unit_info(82018) -> #{unit_id => 82018, classes => 2};
unit_info(82019) -> #{unit_id => 82019, classes => 2};
unit_info(82020) -> #{unit_id => 82020, classes => 2};
unit_info(82021) -> #{unit_id => 82021, classes => 2};
unit_info(82022) -> #{unit_id => 82022, classes => 6};
unit_info(82023) -> #{unit_id => 82023, classes => 6};
unit_info(82024) -> #{unit_id => 82024, classes => 6};
unit_info(82025) -> #{unit_id => 82025, classes => 6};
unit_info(82026) -> #{unit_id => 82026, classes => 6};
unit_info(82027) -> #{unit_id => 82027, classes => 6};
unit_info(82028) -> #{unit_id => 82028, classes => 6};
unit_info(82029) -> #{unit_id => 82029, classes => 4};
unit_info(82030) -> #{unit_id => 82030, classes => 4};
unit_info(82031) -> #{unit_id => 82031, classes => 4};
unit_info(82032) -> #{unit_id => 82032, classes => 4};
unit_info(82033) -> #{unit_id => 82033, classes => 4};
unit_info(82034) -> #{unit_id => 82034, classes => 4};
unit_info(82035) -> #{unit_id => 82035, classes => 4};
unit_info(82036) -> #{unit_id => 82036, classes => 5};
unit_info(82037) -> #{unit_id => 82037, classes => 5};
unit_info(82038) -> #{unit_id => 82038, classes => 5};
unit_info(82039) -> #{unit_id => 82039, classes => 5};
unit_info(82040) -> #{unit_id => 82040, classes => 5};
unit_info(82041) -> #{unit_id => 82041, classes => 5};
unit_info(82042) -> #{unit_id => 82042, classes => 5};
unit_info(82043) -> #{unit_id => 82043, classes => 7};
unit_info(82044) -> #{unit_id => 82044, classes => 7};
unit_info(82045) -> #{unit_id => 82045, classes => 7};
unit_info(82046) -> #{unit_id => 82046, classes => 7};
unit_info(82047) -> #{unit_id => 82047, classes => 7};
unit_info(82048) -> #{unit_id => 82048, classes => 7};
unit_info(82049) -> #{unit_id => 82049, classes => 7};
unit_info(_) -> false.

get_pet_slave(65) -> [82501, 82502, 82503];
get_pet_slave(75) -> [82504, 82505, 82506];
get_pet_slave(85) -> [82507, 82508, 82509];
get_pet_slave(95) -> [82510, 82511, 82512];
get_pet_slave(100) -> [82513, 82514];
get_pet_slave(105) -> [82515, 82516];
get_pet_slave(110) -> [82517, 82518];
get_pet_slave(120) -> [82517, 82518];
get_pet_slave(130) -> [82517, 82518];
get_pet_slave(140) -> [82517, 82518];
get_pet_slave(_) -> [].

get_rewards() ->
    [#{item_id => 20000, item_num => 1, lev_min => 1,
       lev_max => 200, break_times_min => 0,
       break_times_max => 1, bind => 0, item_weight => 50,
       announce => 0},
     #{item_id => 20002, item_num => 1, lev_min => 1,
       lev_max => 200, break_times_min => 0,
       break_times_max => 1, bind => 0, item_weight => 50,
       announce => 0},
     #{item_id => 20020, item_num => 3, lev_min => 1,
       lev_max => 200, break_times_min => 0,
       break_times_max => 1, bind => 0, item_weight => 50,
       announce => 0},
     #{item_id => 20021, item_num => 3, lev_min => 1,
       lev_max => 200, break_times_min => 0,
       break_times_max => 1, bind => 0, item_weight => 50,
       announce => 0},
     #{item_id => 20034, item_num => 3, lev_min => 1,
       lev_max => 200, break_times_min => 0,
       break_times_max => 1, bind => 0, item_weight => 50,
       announce => 0},
     #{item_id => 20025, item_num => 2, lev_min => 1,
       lev_max => 200, break_times_min => 0,
       break_times_max => 1, bind => 0, item_weight => 50,
       announce => 0},
     #{item_id => 22585, item_num => 1, lev_min => 1,
       lev_max => 200, break_times_min => 0,
       break_times_max => 1, bind => 0, item_weight => 27,
       announce => 1},
     #{item_id => 20046, item_num => 1, lev_min => 1,
       lev_max => 200, break_times_min => 0,
       break_times_max => 1, bind => 0, item_weight => 27,
       announce => 1},
     #{item_id => 20087, item_num => 1, lev_min => 1,
       lev_max => 200, break_times_min => 0,
       break_times_max => 1, bind => 0, item_weight => 50,
       announce => 0},
     #{item_id => 20039, item_num => 1, lev_min => 1,
       lev_max => 200, break_times_min => 0,
       break_times_max => 1, bind => 0, item_weight => 30,
       announce => 0},
     #{item_id => 20040, item_num => 1, lev_min => 65,
       lev_max => 200, break_times_min => 0,
       break_times_max => 1, bind => 0, item_weight => 10,
       announce => 1},
     #{item_id => 20036, item_num => 1, lev_min => 85,
       lev_max => 200, break_times_min => 0,
       break_times_max => 1, bind => 0, item_weight => 8,
       announce => 1},
     #{item_id => 20014, item_num => 1, lev_min => 1,
       lev_max => 200, break_times_min => 0,
       break_times_max => 1, bind => 0, item_weight => 5,
       announce => 1},
     #{item_id => 20075, item_num => 1, lev_min => 1,
       lev_max => 200, break_times_min => 0,
       break_times_max => 1, bind => 0, item_weight => 10,
       announce => 1},
     #{item_id => 20616, item_num => 1, lev_min => 1,
       lev_max => 200, break_times_min => 0,
       break_times_max => 1, bind => 0, item_weight => 5,
       announce => 1},
     #{item_id => 20076, item_num => 1, lev_min => 1,
       lev_max => 200, break_times_min => 0,
       break_times_max => 1, bind => 0, item_weight => 5,
       announce => 1},
     #{item_id => 20095, item_num => 1, lev_min => 1,
       lev_max => 200, break_times_min => 0,
       break_times_max => 1, bind => 0, item_weight => 10,
       announce => 1},
     #{item_id => 20038, item_num => 1, lev_min => 1,
       lev_max => 200, break_times_min => 0,
       break_times_max => 1, bind => 0, item_weight => 5,
       announce => 1},
     #{item_id => 22205, item_num => 1, lev_min => 1,
       lev_max => 200, break_times_min => 0,
       break_times_max => 1, bind => 0, item_weight => 1,
       announce => 1},
     #{item_id => 20617, item_num => 1, lev_min => 1,
       lev_max => 200, break_times_min => 0,
       break_times_max => 1, bind => 0, item_weight => 6,
       announce => 1},
     #{item_id => 23831, item_num => 1, lev_min => 65,
       lev_max => 200, break_times_min => 0,
       break_times_max => 1, bind => 0, item_weight => 30,
       announce => 0},
     #{item_id => 23819, item_num => 1, lev_min => 65,
       lev_max => 200, break_times_min => 0,
       break_times_max => 1, bind => 0, item_weight => 20,
       announce => 1},
     #{item_id => 23820, item_num => 1, lev_min => 65,
       lev_max => 200, break_times_min => 0,
       break_times_max => 1, bind => 0, item_weight => 20,
       announce => 1},
     #{item_id => 23821, item_num => 1, lev_min => 65,
       lev_max => 200, break_times_min => 0,
       break_times_max => 1, bind => 0, item_weight => 20,
       announce => 1},
     #{item_id => 23822, item_num => 1, lev_min => 65,
       lev_max => 200, break_times_min => 0,
       break_times_max => 1, bind => 0, item_weight => 20,
       announce => 1},
     #{item_id => 23823, item_num => 1, lev_min => 65,
       lev_max => 200, break_times_min => 0,
       break_times_max => 1, bind => 0, item_weight => 20,
       announce => 1},
     #{item_id => 23880, item_num => 1, lev_min => 70,
       lev_max => 200, break_times_min => 0,
       break_times_max => 1, bind => 0, item_weight => 2,
       announce => 1},
     #{item_id => 23881, item_num => 1, lev_min => 70,
       lev_max => 200, break_times_min => 0,
       break_times_max => 1, bind => 0, item_weight => 2,
       announce => 1},
     #{item_id => 23882, item_num => 1, lev_min => 70,
       lev_max => 200, break_times_min => 0,
       break_times_max => 1, bind => 0, item_weight => 2,
       announce => 1},
     #{item_id => 23883, item_num => 1, lev_min => 70,
       lev_max => 200, break_times_min => 0,
       break_times_max => 1, bind => 0, item_weight => 2,
       announce => 1},
     #{item_id => 23884, item_num => 1, lev_min => 70,
       lev_max => 200, break_times_min => 0,
       break_times_max => 1, bind => 0, item_weight => 2,
       announce => 1},
     #{item_id => 23885, item_num => 1, lev_min => 70,
       lev_max => 200, break_times_min => 0,
       break_times_max => 1, bind => 0, item_weight => 2,
       announce => 1},
     #{item_id => 23887, item_num => 1, lev_min => 70,
       lev_max => 200, break_times_min => 0,
       break_times_max => 1, bind => 0, item_weight => 2,
       announce => 1},
     #{item_id => 23888, item_num => 1, lev_min => 70,
       lev_max => 200, break_times_min => 0,
       break_times_max => 1, bind => 0, item_weight => 2,
       announce => 1},
     #{item_id => 23555, item_num => 2, lev_min => 75,
       lev_max => 200, break_times_min => 0,
       break_times_max => 1, bind => 0, item_weight => 30,
       announce => 0},
     #{item_id => 23556, item_num => 2, lev_min => 75,
       lev_max => 200, break_times_min => 0,
       break_times_max => 1, bind => 0, item_weight => 30,
       announce => 0},
     #{item_id => 23554, item_num => 1, lev_min => 75,
       lev_max => 200, break_times_min => 0,
       break_times_max => 1, bind => 0, item_weight => 20,
       announce => 1},
     #{item_id => 23550, item_num => 1, lev_min => 75,
       lev_max => 200, break_times_min => 0,
       break_times_max => 1, bind => 0, item_weight => 5,
       announce => 1},
     #{item_id => 21130, item_num => 1, lev_min => 1,
       lev_max => 200, break_times_min => 0,
       break_times_max => 1, bind => 0, item_weight => 20,
       announce => 0},
     #{item_id => 21100, item_num => 1, lev_min => 1,
       lev_max => 200, break_times_min => 0,
       break_times_max => 1, bind => 0, item_weight => 20,
       announce => 0},
     #{item_id => 21101, item_num => 1, lev_min => 55,
       lev_max => 200, break_times_min => 0,
       break_times_max => 1, bind => 0, item_weight => 15,
       announce => 1},
     #{item_id => 21102, item_num => 1, lev_min => 75,
       lev_max => 200, break_times_min => 0,
       break_times_max => 1, bind => 0, item_weight => 5,
       announce => 1},
     #{item_id => 21136, item_num => 1, lev_min => 1,
       lev_max => 200, break_times_min => 0,
       break_times_max => 1, bind => 0, item_weight => 30,
       announce => 0},
     #{item_id => 22306, item_num => 1, lev_min => 80,
       lev_max => 200, break_times_min => 0,
       break_times_max => 1, bind => 0, item_weight => 30,
       announce => 0},
     #{item_id => 22307, item_num => 1, lev_min => 80,
       lev_max => 200, break_times_min => 0,
       break_times_max => 1, bind => 0, item_weight => 20,
       announce => 1},
     #{item_id => 23950, item_num => 1, lev_min => 80,
       lev_max => 200, break_times_min => 0,
       break_times_max => 1, bind => 0, item_weight => 30,
       announce => 0},
     #{item_id => 23951, item_num => 1, lev_min => 80,
       lev_max => 200, break_times_min => 0,
       break_times_max => 1, bind => 0, item_weight => 5,
       announce => 1},
     #{item_id => 29046, item_num => 1, lev_min => 1,
       lev_max => 200, break_times_min => 0,
       break_times_max => 1, bind => 0, item_weight => 20,
       announce => 0},
     #{item_id => 21423, item_num => 1, lev_min => 65,
       lev_max => 200, break_times_min => 0,
       break_times_max => 1, bind => 0, item_weight => 20,
       announce => 0},
     #{item_id => 21424, item_num => 1, lev_min => 75,
       lev_max => 200, break_times_min => 0,
       break_times_max => 1, bind => 0, item_weight => 20,
       announce => 1},
     #{item_id => 21425, item_num => 1, lev_min => 85,
       lev_max => 200, break_times_min => 0,
       break_times_max => 1, bind => 0, item_weight => 10,
       announce => 1},
     #{item_id => 20354, item_num => 1, lev_min => 75,
       lev_max => 200, break_times_min => 0,
       break_times_max => 1, bind => 0, item_weight => 40,
       announce => 1},
     #{item_id => 20355, item_num => 1, lev_min => 85,
       lev_max => 200, break_times_min => 0,
       break_times_max => 1, bind => 0, item_weight => 33,
       announce => 1},
     #{item_id => 20356, item_num => 1, lev_min => 95,
       lev_max => 200, break_times_min => 0,
       break_times_max => 1, bind => 0, item_weight => 24,
       announce => 1},
     #{item_id => 20357, item_num => 1, lev_min => 105,
       lev_max => 200, break_times_min => 0,
       break_times_max => 1, bind => 0, item_weight => 21,
       announce => 1},
     #{item_id => 20360, item_num => 1, lev_min => 115,
       lev_max => 200, break_times_min => 0,
       break_times_max => 1, bind => 0, item_weight => 19,
       announce => 1}].

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
get_score_base(89) -> 15500;
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

get_score_add(Lev, Score)
    when Lev >= 60 andalso
             Lev =< 88 andalso Score >= 0 andalso Score =< 1050 ->
    0;
get_score_add(Lev, Score)
    when Lev >= 60 andalso
             Lev =< 88 andalso Score >= 1050 andalso Score =< 1100 ->
    20;
get_score_add(Lev, Score)
    when Lev >= 60 andalso
             Lev =< 88 andalso Score >= 1100 andalso Score =< 1150 ->
    30;
get_score_add(Lev, Score)
    when Lev >= 60 andalso
             Lev =< 88 andalso Score >= 1150 andalso Score =< 1200 ->
    50;
get_score_add(Lev, Score)
    when Lev >= 60 andalso
             Lev =< 88 andalso Score >= 1200 andalso Score =< 1250 ->
    80;
get_score_add(Lev, Score)
    when Lev >= 60 andalso
             Lev =< 88 andalso Score >= 1250 andalso Score =< 1300 ->
    100;
get_score_add(Lev, Score)
    when Lev >= 60 andalso
             Lev =< 88 andalso
                 Score >= 1300 andalso Score =< 10000 ->
    150;
get_score_add(Lev, Score)
    when Lev >= 89 andalso
             Lev =< 89 andalso Score >= 0 andalso Score =< 1050 ->
    0;
get_score_add(Lev, Score)
    when Lev >= 89 andalso
             Lev =< 89 andalso Score >= 1050 andalso Score =< 1100 ->
    20;
get_score_add(Lev, Score)
    when Lev >= 89 andalso
             Lev =< 89 andalso Score >= 1100 andalso Score =< 1150 ->
    30;
get_score_add(Lev, Score)
    when Lev >= 89 andalso
             Lev =< 89 andalso Score >= 1150 andalso Score =< 1200 ->
    50;
get_score_add(Lev, Score)
    when Lev >= 89 andalso
             Lev =< 89 andalso Score >= 1200 andalso Score =< 1250 ->
    70;
get_score_add(Lev, Score)
    when Lev >= 89 andalso
             Lev =< 89 andalso Score >= 1250 andalso Score =< 1300 ->
    100;
get_score_add(Lev, Score)
    when Lev >= 89 andalso
             Lev =< 89 andalso Score >= 1300 andalso Score =< 1350 ->
    130;
get_score_add(Lev, Score)
    when Lev >= 89 andalso
             Lev =< 89 andalso Score >= 1350 andalso Score =< 1400 ->
    150;
get_score_add(Lev, Score)
    when Lev >= 89 andalso
             Lev =< 89 andalso
                 Score >= 1400 andalso Score =< 10000 ->
    200;
get_score_add(Lev, Score)
    when Lev >= 90 andalso
             Lev =< 140 andalso Score >= 0 andalso Score =< 1050 ->
    0;
get_score_add(Lev, Score)
    when Lev >= 90 andalso
             Lev =< 140 andalso
                 Score >= 1050 andalso Score =< 1100 ->
    20;
get_score_add(Lev, Score)
    when Lev >= 90 andalso
             Lev =< 140 andalso
                 Score >= 1100 andalso Score =< 1150 ->
    30;
get_score_add(Lev, Score)
    when Lev >= 90 andalso
             Lev =< 140 andalso
                 Score >= 1150 andalso Score =< 1200 ->
    50;
get_score_add(Lev, Score)
    when Lev >= 90 andalso
             Lev =< 140 andalso
                 Score >= 1200 andalso Score =< 1250 ->
    80;
get_score_add(Lev, Score)
    when Lev >= 90 andalso
             Lev =< 140 andalso
                 Score >= 1250 andalso Score =< 1300 ->
    100;
get_score_add(Lev, Score)
    when Lev >= 90 andalso
             Lev =< 140 andalso
                 Score >= 1300 andalso Score =< 10000 ->
    150;
get_score_add(_, _) -> 0.

