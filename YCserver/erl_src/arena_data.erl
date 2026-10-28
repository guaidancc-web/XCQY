-file("src/data/arena_data.erl", 1).

-module(arena_data).

-export([get_exp/1,
         get_base_cup/1,
         get_reward/1,
         get_item/1,
         get_enemy/0,
         get_soul_reward/0,
         get_soul_assets/1,
         get_graph/0,
         get_graph_end/0,
         get_cast/1]).

-file("inc/arena.hrl", 1).

-record(m_arena,
        {ver = 1,
         cd_time = 0 :: non_neg_integer(),
         acc_num = 0 :: non_neg_integer(),
         cup = 1000 :: non_neg_integer(),
         roll_time = 0,
         roll_id = 0,
         roll_graph = []}).

-record(arena_role,
        {id = {0, "", 0} :: tuple(),
         ver = 6,
         name = "" :: bitstring(),
         win = 0 :: non_neg_integer(),
         acc_num = 0,
         sex = 0 :: 0..1,
         classes = 0 :: 0..4,
         lev = 0 :: non_neg_integer(),
         last_time = 0 :: non_neg_integer(),
         is_robot = 0 :: 0..1,
         cup = 0,
         next_log_id = 1,
         log = [],
         win_list = [],
         win_ratio = 0,
         day_time_flag = 0,
         enemy = [],
         day_win = 0,
         day_lost = 0,
         def_acc_num = 0,
         def_win = 0,
         max_cup = 1000,
         acc_sword_num = 0,
         acc_mage_num = 0,
         acc_archer_num = 0,
         acc_orc_num = 0,
         acc_devine_num = 0,
         acc_moon_num = 0,
         acc_templar_num = 0,
         win_sword = 0,
         win_mage = 0,
         win_archer = 0,
         win_orc = 0,
         win_devine = 0,
         win_moon = 0,
         win_templar = 0,
         init_def = 0,
         formation = 1,
         formation_lev = 1,
         guards = [],
         last_win_role}).

-record(arena_enemy,
        {order = 0,
         role_id = {0, "", 0},
         is_robot = 0,
         classes = 0,
         lev = 0,
         sex = 0,
         cup = 0,
         soul = 1}).

-record(arena_log,
        {log_id = 1,
         s_role_id = {0, "", 0} :: tuple(),
         s_name = "" :: list(),
         result = 0 :: 0..1,
         t_role_id = {0, "", 0} :: tuple(),
         t_name = "" :: list(),
         time = 0 :: non_neg_integer(),
         s_cup = 0,
         t_cup = 0,
         s_cup_change = 0,
         t_cup_change = 0,
         feedback = 0}).

-record(arena_role_index,
        {id = {0, "", 0},
         lev = 0,
         cup = 0,
         time = 0,
         day_time_flag = 0,
         day_win = 0,
         day_lost = 0,
         win_list = [],
         win_ratio = 0}).

-record(arena_robot,
        {id = {0, "robot", 0},
         lev = 0,
         name = "",
         classes = 0,
         sex = 0,
         cup = 0}).

-record(arena_graph,
        {id = 1,
         base_id = 0,
         num = 0,
         status = 0,
         quality = 0}).

-record(arena_graph_base,
        {id = 1,
         base_id = 0,
         num = 0,
         quality = 0,
         name = "",
         sex = 0,
         classes = 0,
         lev_low = 0,
         lev_high = 0,
         ratio = 0,
         times = 1,
         order_list = []}).

-file("src/data/arena_data.erl", 24).

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

-file("src/data/arena_data.erl", 26).

get_exp(1) -> {0, 3774};
get_exp(2) -> {0, 3858};
get_exp(3) -> {0, 3970};
get_exp(4) -> {0, 4084};
get_exp(5) -> {0, 4168};
get_exp(6) -> {0, 4280};
get_exp(7) -> {0, 4392};
get_exp(8) -> {0, 4478};
get_exp(9) -> {0, 4590};
get_exp(10) -> {0, 4702};
get_exp(11) -> {0, 4816};
get_exp(12) -> {0, 4928};
get_exp(13) -> {0, 5012};
get_exp(14) -> {0, 5126};
get_exp(15) -> {0, 5238};
get_exp(16) -> {0, 5350};
get_exp(17) -> {0, 5462};
get_exp(18) -> {0, 5576};
get_exp(19) -> {0, 5688};
get_exp(20) -> {0, 5800};
get_exp(21) -> {0, 5914};
get_exp(22) -> {0, 6026};
get_exp(23) -> {10723, 6138};
get_exp(24) -> {10724, 6252};
get_exp(25) -> {10726, 6364};
get_exp(26) -> {10728, 6476};
get_exp(27) -> {10729, 6590};
get_exp(28) -> {10729, 6702};
get_exp(29) -> {10899, 6812};
get_exp(30) -> {11491, 7182};
get_exp(31) -> {11667, 7292};
get_exp(32) -> {11844, 7404};
get_exp(33) -> {12022, 7514};
get_exp(34) -> {12243, 7652};
get_exp(35) -> {12420, 7764};
get_exp(36) -> {12598, 7874};
get_exp(37) -> {12776, 7986};
get_exp(38) -> {12996, 8124};
get_exp(39) -> {13174, 8234};
get_exp(40) -> {13720, 8576};
get_exp(41) -> {13942, 8714};
get_exp(42) -> {14120, 8826};
get_exp(43) -> {14340, 8964};
get_exp(44) -> {14518, 9074};
get_exp(45) -> {14696, 9186};
get_exp(46) -> {14916, 9324};
get_exp(47) -> {15094, 9434};
get_exp(48) -> {15315, 9572};
get_exp(49) -> {15492, 9684};
get_exp(50) -> {15715, 9822};
get_exp(51) -> {15891, 9932};
get_exp(52) -> {16113, 10072};
get_exp(53) -> {16334, 10210};
get_exp(54) -> {16512, 10320};
get_exp(55) -> {17102, 10690};
get_exp(56) -> {17280, 10800};
get_exp(57) -> {17500, 10938};
get_exp(58) -> {17723, 11078};
get_exp(59) -> {17900, 11188};
get_exp(60) -> {18491, 11558};
get_exp(61) -> {18712, 11696};
get_exp(62) -> {18934, 11834};
get_exp(63) -> {19112, 11946};
get_exp(64) -> {19332, 12084};
get_exp(65) -> {19555, 12222};
get_exp(66) -> {19776, 12360};
get_exp(67) -> {19996, 12498};
get_exp(68) -> {20219, 12638};
get_exp(69) -> {20396, 12748};
get_exp(70) -> {20617, 12886};
get_exp(71) -> {20840, 13026};
get_exp(72) -> {21060, 13164};
get_exp(73) -> {21283, 13302};
get_exp(74) -> {21504, 13440};
get_exp(75) -> {21724, 13578};
get_exp(76) -> {21947, 13718};
get_exp(77) -> {22168, 13856};
get_exp(78) -> {22390, 13994};
get_exp(79) -> {22611, 14132};
get_exp(80) -> {24310, 15194};
get_exp(81) -> {24576, 15360};
get_exp(82) -> {24796, 15498};
get_exp(83) -> {25019, 15638};
get_exp(84) -> {25240, 15776};
get_exp(85) -> {25462, 15914};
get_exp(86) -> {25683, 16052};
get_exp(87) -> {25948, 16218};
get_exp(88) -> {26171, 16358};
get_exp(89) -> {26392, 16496};
get_exp(90) -> {26614, 16634};
get_exp(91) -> {26880, 16800};
get_exp(92) -> {27100, 16938};
get_exp(93) -> {27323, 17078};
get_exp(94) -> {27588, 17244};
get_exp(95) -> {27811, 17382};
get_exp(96) -> {28032, 17520};
get_exp(97) -> {28297, 17686};
get_exp(98) -> {28520, 17826};
get_exp(99) -> {28740, 17964};
get_exp(100) -> {28740, 17964};
get_exp(101) -> {28740, 17964};
get_exp(102) -> {28740, 17964};
get_exp(103) -> {28740, 17964};
get_exp(104) -> {28740, 17964};
get_exp(105) -> {28740, 17964};
get_exp(106) -> {28740, 17964};
get_exp(107) -> {28740, 17964};
get_exp(108) -> {28740, 17964};
get_exp(109) -> {28740, 17964};
get_exp(110) -> {28740, 17964};
get_exp(111) -> {28740, 17964};
get_exp(112) -> {28740, 17964};
get_exp(113) -> {28740, 17964};
get_exp(114) -> {28740, 17964};
get_exp(115) -> {28740, 17964};
get_exp(116) -> {28740, 17964};
get_exp(117) -> {28740, 17964};
get_exp(118) -> {28740, 17964};
get_exp(119) -> {28740, 17964};
get_exp(120) -> {28740, 17964};
get_exp(121) -> {28740, 17964};
get_exp(122) -> {28740, 17964};
get_exp(123) -> {28740, 17964};
get_exp(124) -> {28740, 17964};
get_exp(125) -> {28740, 17964};
get_exp(126) -> {28740, 17964};
get_exp(127) -> {28740, 17964};
get_exp(128) -> {28740, 17964};
get_exp(129) -> {28740, 17964};
get_exp(130) -> {28740, 17964};
get_exp(_) -> false.

get_base_cup(WorldLev)
    when WorldLev >= 35 andalso WorldLev =< 35 ->
    1100;
get_base_cup(WorldLev)
    when WorldLev >= 40 andalso WorldLev =< 40 ->
    1250;
get_base_cup(WorldLev)
    when WorldLev >= 45 andalso WorldLev =< 45 ->
    1400;
get_base_cup(WorldLev)
    when WorldLev >= 50 andalso WorldLev =< 50 ->
    1550;
get_base_cup(WorldLev)
    when WorldLev >= 55 andalso WorldLev =< 55 ->
    1700;
get_base_cup(WorldLev)
    when WorldLev >= 60 andalso WorldLev =< 60 ->
    1850;
get_base_cup(WorldLev)
    when WorldLev >= 65 andalso WorldLev =< 65 ->
    2000;
get_base_cup(WorldLev)
    when WorldLev >= 70 andalso WorldLev =< 70 ->
    2150;
get_base_cup(WorldLev)
    when WorldLev >= 75 andalso WorldLev =< 75 ->
    2300;
get_base_cup(WorldLev)
    when WorldLev >= 80 andalso WorldLev =< 80 ->
    2450;
get_base_cup(WorldLev)
    when WorldLev >= 85 andalso WorldLev =< 85 ->
    2600;
get_base_cup(WorldLev)
    when WorldLev >= 90 andalso WorldLev =< 90 ->
    2750;
get_base_cup(WorldLev)
    when WorldLev >= 95 andalso WorldLev =< 95 ->
    2900;
get_base_cup(WorldLev)
    when WorldLev >= 100 andalso WorldLev =< 100 ->
    3050;
get_base_cup(WorldLev)
    when WorldLev >= 105 andalso WorldLev =< 105 ->
    3200;
get_base_cup(WorldLev)
    when WorldLev >= 110 andalso WorldLev =< 110 ->
    3350;
get_base_cup(WorldLev)
    when WorldLev >= 115 andalso WorldLev =< 115 ->
    3500;
get_base_cup(WorldLev)
    when WorldLev >= 120 andalso WorldLev =< 120 ->
    3650;
get_base_cup(WorldLev)
    when WorldLev >= 125 andalso WorldLev =< 125 ->
    3800;
get_base_cup(WorldLev)
    when WorldLev >= 130 andalso WorldLev =< 130 ->
    3950;
get_base_cup(_) -> 1000.

get_reward(Rank) when Rank >= 1 andalso Rank =< 10 ->
    55;
get_reward(Rank) when Rank >= 11 andalso Rank =< 20 ->
    45;
get_reward(Rank) when Rank >= 21 andalso Rank =< 30 ->
    40;
get_reward(Rank) when Rank >= 31 andalso Rank =< 50 ->
    36;
get_reward(Rank) when Rank >= 51 andalso Rank =< 60 ->
    32;
get_reward(Rank) when Rank >= 61 andalso Rank =< 100 ->
    24;
get_reward(Rank)
    when Rank >= 101 andalso Rank =< 10000 ->
    20;
get_reward(_) -> 0.

get_item(Rank) when Rank >= 1 andalso Rank =< 10 -> 3;
get_item(Rank) when Rank >= 11 andalso Rank =< 20 -> 3;
get_item(Rank) when Rank >= 21 andalso Rank =< 30 -> 2;
get_item(Rank) when Rank >= 31 andalso Rank =< 50 -> 2;
get_item(Rank) when Rank >= 51 andalso Rank =< 60 -> 1;
get_item(Rank) when Rank >= 61 andalso Rank =< 100 -> 1;
get_item(Rank) when Rank >= 101 andalso Rank =< 10000 ->
    0;
get_item(_) -> 0.

get_enemy() ->
    [{-100, 30, -100, 0, -2, 1},
     {-100, 40, -100, 40, -1, 1},
     {-100, 40, -100, 60, -1, 1},
     {-40, 60, -100, 80, -1, 1},
     {-30, 80, -50, 100, -1, 2}].

get_soul_reward() ->
    [#{base_id => 20087, num => 1, ratio => 136, lev => 0,
       is_cast => 1},
     #{base_id => 29006, num => 1, ratio => 40, lev => 0,
       is_cast => 1},
     #{base_id => 20075, num => 1, ratio => 6, lev => 0,
       is_cast => 1},
     #{base_id => 20076, num => 1, ratio => 3, lev => 0,
       is_cast => 1},
     #{base_id => 20008, num => 1, ratio => 27, lev => 0,
       is_cast => 0},
     #{base_id => 20009, num => 1, ratio => 15, lev => 0,
       is_cast => 0},
     #{base_id => 20010, num => 1, ratio => 3, lev => 0,
       is_cast => 1},
     #{base_id => 20021, num => 1, ratio => 50, lev => 0,
       is_cast => 1},
     #{base_id => 20020, num => 3, ratio => 50, lev => 0,
       is_cast => 0},
     #{base_id => 20045, num => 2, ratio => 50, lev => 0,
       is_cast => 0},
     #{base_id => 20616, num => 1, ratio => 4, lev => 0,
       is_cast => 1},
     #{base_id => 20617, num => 1, ratio => 1, lev => 0,
       is_cast => 1},
     #{base_id => 20039, num => 1, ratio => 30, lev => 0,
       is_cast => 1},
     #{base_id => 20046, num => 1, ratio => 15, lev => 0,
       is_cast => 1},
     #{base_id => 29104, num => 2, ratio => 120, lev => 0,
       is_cast => 0},
     #{base_id => 20007, num => 2, ratio => 120, lev => 0,
       is_cast => 0},
     #{base_id => 90012, num => 30, ratio => 30, lev => 0,
       is_cast => 0},
     #{base_id => 20038, num => 1, ratio => 1, lev => 0,
       is_cast => 1},
     #{base_id => 20095, num => 1, ratio => 2, lev => 0,
       is_cast => 1},
     #{base_id => 20014, num => 1, ratio => 2, lev => 0,
       is_cast => 1},
     #{base_id => 22400, num => 4, ratio => 95, lev => 60,
       is_cast => 0},
     #{base_id => 22400, num => 6, ratio => 100, lev => 60,
       is_cast => 0},
     #{base_id => 22400, num => 9, ratio => 100, lev => 60,
       is_cast => 1}].

get_soul_assets(28) -> [{90010, 75103}, {90012, 10}];
get_soul_assets(29) -> [{90010, 76293}, {90012, 10}];
get_soul_assets(30) -> [{90010, 80437}, {90012, 10}];
get_soul_assets(31) -> [{90010, 81669}, {90012, 10}];
get_soul_assets(32) -> [{90010, 82908}, {90012, 10}];
get_soul_assets(33) -> [{90010, 84154}, {90012, 10}];
get_soul_assets(34) -> [{90010, 85701}, {90012, 10}];
get_soul_assets(35) -> [{90010, 86940}, {90012, 10}];
get_soul_assets(36) -> [{90010, 88186}, {90012, 10}];
get_soul_assets(37) -> [{90010, 89432}, {90012, 10}];
get_soul_assets(38) -> [{90010, 90972}, {90012, 10}];
get_soul_assets(39) -> [{90010, 92218}, {90012, 10}];
get_soul_assets(40) -> [{90010, 96040}, {90012, 10}];
get_soul_assets(41) -> [{90010, 97594}, {90012, 10}];
get_soul_assets(42) -> [{90010, 98840}, {90012, 10}];
get_soul_assets(43) -> [{90010, 100380}, {90012, 10}];
get_soul_assets(44) -> [{90010, 101626}, {90012, 10}];
get_soul_assets(45) -> [{90010, 102872}, {90012, 10}];
get_soul_assets(46) -> [{90010, 104412}, {90012, 10}];
get_soul_assets(47) -> [{90010, 105658}, {90012, 10}];
get_soul_assets(48) -> [{90010, 107205}, {90012, 10}];
get_soul_assets(49) -> [{90010, 108444}, {90012, 10}];
get_soul_assets(50) -> [{90010, 110005}, {90012, 10}];
get_soul_assets(51) -> [{90010, 111237}, {90012, 10}];
get_soul_assets(52) -> [{90010, 112791}, {90012, 10}];
get_soul_assets(53) -> [{90010, 114338}, {90012, 10}];
get_soul_assets(54) -> [{90010, 115584}, {90012, 10}];
get_soul_assets(55) -> [{90010, 119714}, {90012, 10}];
get_soul_assets(56) -> [{90010, 120960}, {90012, 10}];
get_soul_assets(57) -> [{90010, 122500}, {90012, 10}];
get_soul_assets(58) -> [{90010, 124061}, {90012, 10}];
get_soul_assets(59) -> [{90010, 125180}, {90012, 10}];
get_soul_assets(60) ->
    [{90010, 129437}, {90012, 5}, {22400, 1}];
get_soul_assets(61) ->
    [{90010, 118984}, {90012, 5}, {22400, 1}];
get_soul_assets(62) ->
    [{90010, 132538}, {90012, 5}, {22400, 1}];
get_soul_assets(63) ->
    [{90010, 133784}, {90012, 5}, {22400, 1}];
get_soul_assets(64) ->
    [{90010, 135324}, {90012, 5}, {22400, 1}];
get_soul_assets(65) ->
    [{90010, 136885}, {90012, 5}, {22400, 1}];
get_soul_assets(66) ->
    [{90010, 138432}, {90012, 5}, {22400, 1}];
get_soul_assets(67) ->
    [{90010, 139972}, {90012, 5}, {22400, 1}];
get_soul_assets(68) ->
    [{90010, 141533}, {90012, 5}, {22400, 1}];
get_soul_assets(69) ->
    [{90010, 142772}, {90012, 5}, {22400, 1}];
get_soul_assets(70) ->
    [{90010, 144319}, {90012, 5}, {22400, 1}];
get_soul_assets(71) ->
    [{90010, 145880}, {90012, 5}, {22400, 1}];
get_soul_assets(72) ->
    [{90010, 147420}, {90012, 5}, {22400, 1}];
get_soul_assets(73) ->
    [{90010, 148981}, {90012, 5}, {22400, 1}];
get_soul_assets(74) ->
    [{90010, 150528}, {90012, 5}, {22400, 1}];
get_soul_assets(75) ->
    [{90010, 152068}, {90012, 5}, {22400, 1}];
get_soul_assets(76) ->
    [{90010, 153629}, {90012, 5}, {22400, 1}];
get_soul_assets(77) ->
    [{90010, 155176}, {90012, 5}, {22400, 1}];
get_soul_assets(78) ->
    [{90010, 156718}, {90012, 5}, {22400, 1}];
get_soul_assets(79) ->
    [{90010, 158277}, {90012, 5}, {22400, 1}];
get_soul_assets(80) ->
    [{90010, 170170}, {90012, 5}, {22400, 1}];
get_soul_assets(81) ->
    [{90010, 172032}, {90012, 5}, {22400, 1}];
get_soul_assets(82) ->
    [{90010, 173572}, {90012, 5}, {22400, 1}];
get_soul_assets(83) ->
    [{90010, 175133}, {90012, 5}, {22400, 1}];
get_soul_assets(84) ->
    [{90010, 176680}, {90012, 5}, {22400, 1}];
get_soul_assets(85) ->
    [{90010, 178234}, {90012, 5}, {22400, 1}];
get_soul_assets(86) ->
    [{90010, 179781}, {90012, 5}, {22400, 1}];
get_soul_assets(87) ->
    [{90010, 181636}, {90012, 5}, {22400, 1}];
get_soul_assets(88) ->
    [{90010, 183197}, {90012, 5}, {22400, 1}];
get_soul_assets(89) ->
    [{90010, 184744}, {90012, 5}, {22400, 1}];
get_soul_assets(90) ->
    [{90010, 186298}, {90012, 5}, {22400, 1}];
get_soul_assets(91) ->
    [{90010, 188160}, {90012, 5}, {22400, 1}];
get_soul_assets(92) ->
    [{90010, 189700}, {90012, 5}, {22400, 1}];
get_soul_assets(93) ->
    [{90010, 191261}, {90012, 5}, {22400, 1}];
get_soul_assets(94) ->
    [{90010, 193116}, {90012, 5}, {22400, 1}];
get_soul_assets(95) ->
    [{90010, 194677}, {90012, 5}, {22400, 1}];
get_soul_assets(96) ->
    [{90010, 196224}, {90012, 5}, {22400, 1}];
get_soul_assets(97) ->
    [{90010, 198079}, {90012, 5}, {22400, 1}];
get_soul_assets(98) ->
    [{90010, 199640}, {90012, 5}, {22400, 1}];
get_soul_assets(99) ->
    [{90010, 201180}, {90012, 5}, {22400, 1}];
get_soul_assets(100) ->
    [{90010, 201180}, {90012, 5}, {22400, 1}];
get_soul_assets(101) ->
    [{90010, 201180}, {90012, 5}, {22400, 1}];
get_soul_assets(102) ->
    [{90010, 201180}, {90012, 5}, {22400, 1}];
get_soul_assets(103) ->
    [{90010, 201180}, {90012, 5}, {22400, 1}];
get_soul_assets(104) ->
    [{90010, 201180}, {90012, 5}, {22400, 1}];
get_soul_assets(105) ->
    [{90010, 201180}, {90012, 5}, {22400, 1}];
get_soul_assets(106) ->
    [{90010, 201180}, {90012, 5}, {22400, 1}];
get_soul_assets(107) ->
    [{90010, 201180}, {90012, 5}, {22400, 1}];
get_soul_assets(108) ->
    [{90010, 201180}, {90012, 5}, {22400, 1}];
get_soul_assets(109) ->
    [{90010, 201180}, {90012, 5}, {22400, 1}];
get_soul_assets(110) ->
    [{90010, 201180}, {90012, 5}, {22400, 1}];
get_soul_assets(111) ->
    [{90010, 201180}, {90012, 5}, {22400, 1}];
get_soul_assets(112) ->
    [{90010, 201180}, {90012, 5}, {22400, 1}];
get_soul_assets(113) ->
    [{90010, 201180}, {90012, 5}, {22400, 1}];
get_soul_assets(114) ->
    [{90010, 201180}, {90012, 5}, {22400, 1}];
get_soul_assets(115) ->
    [{90010, 201180}, {90012, 5}, {22400, 1}];
get_soul_assets(116) ->
    [{90010, 201180}, {90012, 5}, {22400, 1}];
get_soul_assets(117) ->
    [{90010, 201180}, {90012, 5}, {22400, 1}];
get_soul_assets(118) ->
    [{90010, 201180}, {90012, 5}, {22400, 1}];
get_soul_assets(119) ->
    [{90010, 201180}, {90012, 5}, {22400, 1}];
get_soul_assets(120) ->
    [{90010, 201180}, {90012, 5}, {22400, 1}];
get_soul_assets(121) ->
    [{90010, 201180}, {90012, 5}, {22400, 1}];
get_soul_assets(122) ->
    [{90010, 201180}, {90012, 5}, {22400, 1}];
get_soul_assets(123) ->
    [{90010, 201180}, {90012, 5}, {22400, 1}];
get_soul_assets(124) ->
    [{90010, 201180}, {90012, 5}, {22400, 1}];
get_soul_assets(125) ->
    [{90010, 201180}, {90012, 5}, {22400, 1}];
get_soul_assets(126) ->
    [{90010, 201180}, {90012, 5}, {22400, 1}];
get_soul_assets(127) ->
    [{90010, 201180}, {90012, 5}, {22400, 1}];
get_soul_assets(128) ->
    [{90010, 201180}, {90012, 5}, {22400, 1}];
get_soul_assets(129) ->
    [{90010, 201180}, {90012, 5}, {22400, 1}];
get_soul_assets(130) ->
    [{90010, 201180}, {90012, 5}, {22400, 1}];
get_soul_assets(_) -> [].

get_graph() ->
    [#arena_graph_base{id = 1, base_id = 90012, num = 3,
                       name = lang:get("星辰积分"), quality = 1, sex = 2,
                       classes = 0, lev_low = 0, lev_high = 0, ratio = 200,
                       times = 1, order_list = [1, 2, 3, 4]},
     #arena_graph_base{id = 2, base_id = 90012, num = 4,
                       name = lang:get("星辰积分"), quality = 1, sex = 2,
                       classes = 0, lev_low = 0, lev_high = 0, ratio = 200,
                       times = 1, order_list = [1, 2, 3, 4]},
     #arena_graph_base{id = 3, base_id = 90012, num = 5,
                       name = lang:get("星辰积分"), quality = 1, sex = 2,
                       classes = 0, lev_low = 0, lev_high = 0, ratio = 200,
                       times = 1, order_list = [1, 2, 3, 4]},
     #arena_graph_base{id = 4, base_id = 90012, num = 6,
                       name = lang:get("星辰积分"), quality = 1, sex = 2,
                       classes = 0, lev_low = 0, lev_high = 59, ratio = 200,
                       times = 1, order_list = [1, 2, 3, 4]},
     #arena_graph_base{id = 4, base_id = 22400, num = 1,
                       name = lang:get("蓝魂"), quality = 1, sex = 2,
                       classes = 0, lev_low = 60, lev_high = 200, ratio = 200,
                       times = 1, order_list = [1, 2, 3, 4]},
     #arena_graph_base{id = 6, base_id = 21220, num = 1,
                       name = lang:get("秘宝锤"), quality = 1, sex = 2,
                       classes = 0, lev_low = 0, lev_high = 0, ratio = 100,
                       times = 1, order_list = [1, 2, 3, 4]},
     #arena_graph_base{id = 7, base_id = 20006, num = 3,
                       name = lang:get("星辰精华"), quality = 1, sex = 2,
                       classes = 0, lev_low = 0, lev_high = 0, ratio = 100,
                       times = 1, order_list = [1, 2, 3, 4]},
     #arena_graph_base{id = 8, base_id = 90012, num = 5,
                       name = lang:get("星辰积分"), quality = 2, sex = 2,
                       classes = 0, lev_low = 0, lev_high = 0, ratio = 210,
                       times = 1, order_list = [5, 6, 7, 8]},
     #arena_graph_base{id = 10, base_id = 90012, num = 6,
                       name = lang:get("星辰积分"), quality = 2, sex = 2,
                       classes = 0, lev_low = 0, lev_high = 59, ratio = 210,
                       times = 1, order_list = [5, 6, 7, 8]},
     #arena_graph_base{id = 11, base_id = 90012, num = 7,
                       name = lang:get("星辰积分"), quality = 2, sex = 2,
                       classes = 0, lev_low = 0, lev_high = 59, ratio = 210,
                       times = 1, order_list = [5, 6, 7, 8]},
     #arena_graph_base{id = 12, base_id = 90012, num = 7,
                       name = lang:get("星辰积分"), quality = 2, sex = 2,
                       classes = 0, lev_low = 0, lev_high = 59, ratio = 220,
                       times = 1, order_list = [5, 6, 7, 8]},
     #arena_graph_base{id = 10, base_id = 22400, num = 1,
                       name = lang:get("蓝魂"), quality = 2, sex = 2,
                       classes = 0, lev_low = 60, lev_high = 200, ratio = 210,
                       times = 1, order_list = [5, 6, 7, 8]},
     #arena_graph_base{id = 11, base_id = 22400, num = 1,
                       name = lang:get("蓝魂"), quality = 2, sex = 2,
                       classes = 0, lev_low = 60, lev_high = 200, ratio = 210,
                       times = 1, order_list = [5, 6, 7, 8]},
     #arena_graph_base{id = 12, base_id = 22400, num = 1,
                       name = lang:get("蓝魂"), quality = 2, sex = 2,
                       classes = 0, lev_low = 60, lev_high = 200, ratio = 220,
                       times = 1, order_list = [5, 6, 7, 8]},
     #arena_graph_base{id = 14, base_id = 20020, num = 1,
                       name = lang:get("强化石"), quality = 2, sex = 2,
                       classes = 0, lev_low = 0, lev_high = 0, ratio = 30,
                       times = 1, order_list = [5, 6, 7, 8]},
     #arena_graph_base{id = 15, base_id = 20021, num = 1,
                       name = lang:get("幸运石"), quality = 2, sex = 2,
                       classes = 0, lev_low = 0, lev_high = 0, ratio = 30,
                       times = 1, order_list = [5, 6, 7, 8]},
     #arena_graph_base{id = 16, base_id = 22215, num = 2,
                       name = lang:get("冒险丹"), quality = 2, sex = 2,
                       classes = 0, lev_low = 0, lev_high = 0, ratio = 30,
                       times = 1, order_list = [5, 6, 7, 8]},
     #arena_graph_base{id = 17, base_id = 20034, num = 1,
                       name = lang:get("宝石包"), quality = 2, sex = 2,
                       classes = 0, lev_low = 0, lev_high = 0, ratio = 30,
                       times = 1, order_list = [5, 6, 7, 8]},
     #arena_graph_base{id = 18, base_id = 20045, num = 1,
                       name = lang:get("月光绒"), quality = 2, sex = 2,
                       classes = 0, lev_low = 0, lev_high = 0, ratio = 30,
                       times = 1, order_list = [5, 6, 7, 8]},
     #arena_graph_base{id = 19, base_id = 22400, num = 1,
                       name = lang:get("蓝魂"), quality = 3, sex = 2,
                       classes = 0, lev_low = 60, lev_high = 0, ratio = 210,
                       times = 1, order_list = [9, 10, 11, 12]},
     #arena_graph_base{id = 21, base_id = 22400, num = 1,
                       name = lang:get("蓝魂"), quality = 3, sex = 2,
                       classes = 0, lev_low = 60, lev_high = 0, ratio = 210,
                       times = 1, order_list = [9, 10, 11, 12]},
     #arena_graph_base{id = 22, base_id = 22400, num = 1,
                       name = lang:get("蓝魂"), quality = 3, sex = 2,
                       classes = 0, lev_low = 60, lev_high = 0, ratio = 210,
                       times = 1, order_list = [9, 10, 11, 12]},
     #arena_graph_base{id = 19, base_id = 90012, num = 6,
                       name = lang:get("星辰积分"), quality = 3, sex = 2,
                       classes = 0, lev_low = 0, lev_high = 59, ratio = 210,
                       times = 1, order_list = [9, 10, 11, 12]},
     #arena_graph_base{id = 21, base_id = 90012, num = 7,
                       name = lang:get("星辰积分"), quality = 3, sex = 2,
                       classes = 0, lev_low = 0, lev_high = 59, ratio = 210,
                       times = 1, order_list = [9, 10, 11, 12]},
     #arena_graph_base{id = 22, base_id = 90012, num = 8,
                       name = lang:get("星辰积分"), quality = 3, sex = 2,
                       classes = 0, lev_low = 0, lev_high = 59, ratio = 210,
                       times = 1, order_list = [9, 10, 11, 12]},
     #arena_graph_base{id = 23, base_id = 90012, num = 8,
                       name = lang:get("星辰积分"), quality = 3, sex = 2,
                       classes = 0, lev_low = 0, lev_high = 0, ratio = 220,
                       times = 1, order_list = [9, 10, 11, 12]},
     #arena_graph_base{id = 25, base_id = 20007, num = 1,
                       name = lang:get("资质丸"), quality = 3, sex = 2,
                       classes = 0, lev_low = 0, lev_high = 0, ratio = 30,
                       times = 1, order_list = [9, 10, 11, 12]},
     #arena_graph_base{id = 26, base_id = 20025, num = 1,
                       name = lang:get("冒险笔记"), quality = 3, sex = 2,
                       classes = 0, lev_low = 0, lev_high = 0, ratio = 30,
                       times = 1, order_list = [9, 10, 11, 12]},
     #arena_graph_base{id = 27, base_id = 20013, num = 1,
                       name = lang:get("魔兽要诀"), quality = 3, sex = 2,
                       classes = 0, lev_low = 0, lev_high = 0, ratio = 30,
                       times = 1, order_list = [9, 10, 11, 12]},
     #arena_graph_base{id = 28, base_id = 29104, num = 1,
                       name = lang:get("生命精华"), quality = 3, sex = 2,
                       classes = 0, lev_low = 0, lev_high = 0, ratio = 30,
                       times = 1, order_list = [9, 10, 11, 12]},
     #arena_graph_base{id = 29, base_id = 20088, num = 1,
                       name = lang:get("初级符石"), quality = 3, sex = 2,
                       classes = 0, lev_low = 0, lev_high = 0, ratio = 30,
                       times = 1, order_list = [9, 10, 11, 12]},
     #arena_graph_base{id = 30, base_id = 90012, num = 7,
                       name = lang:get("星辰积分"), quality = 4, sex = 2,
                       classes = 0, lev_low = 0, lev_high = 0, ratio = 220,
                       times = 1, order_list = [13, 14, 15, 16]},
     #arena_graph_base{id = 31, base_id = 90012, num = 8,
                       name = lang:get("星辰积分"), quality = 4, sex = 2,
                       classes = 0, lev_low = 0, lev_high = 59, ratio = 220,
                       times = 1, order_list = [13, 14, 15, 16]},
     #arena_graph_base{id = 33, base_id = 90012, num = 9,
                       name = lang:get("星辰积分"), quality = 4, sex = 2,
                       classes = 0, lev_low = 0, lev_high = 59, ratio = 220,
                       times = 1, order_list = [13, 14, 15, 16]},
     #arena_graph_base{id = 34, base_id = 90012, num = 9,
                       name = lang:get("星辰积分"), quality = 4, sex = 2,
                       classes = 0, lev_low = 0, lev_high = 59, ratio = 220,
                       times = 1, order_list = [13, 14, 15, 16]},
     #arena_graph_base{id = 31, base_id = 22400, num = 1,
                       name = lang:get("蓝魂"), quality = 4, sex = 2,
                       classes = 0, lev_low = 60, lev_high = 0, ratio = 270,
                       times = 1, order_list = [13, 14, 15, 16]},
     #arena_graph_base{id = 33, base_id = 22400, num = 1,
                       name = lang:get("蓝魂"), quality = 4, sex = 2,
                       classes = 0, lev_low = 60, lev_high = 0, ratio = 270,
                       times = 1, order_list = [13, 14, 15, 16]},
     #arena_graph_base{id = 34, base_id = 22400, num = 2,
                       name = lang:get("蓝魂"), quality = 4, sex = 2,
                       classes = 0, lev_low = 60, lev_high = 0, ratio = 120,
                       times = 1, order_list = [13, 14, 15, 16]},
     #arena_graph_base{id = 36, base_id = 20087, num = 1,
                       name = lang:get("四宝"), quality = 4, sex = 2,
                       classes = 0, lev_low = 0, lev_high = 0, ratio = 30,
                       times = 1, order_list = [13, 14, 15, 16]},
     #arena_graph_base{id = 37, base_id = 29006, num = 1,
                       name = lang:get("先知水晶"), quality = 4, sex = 2,
                       classes = 0, lev_low = 0, lev_high = 0, ratio = 30,
                       times = 1, order_list = [13, 14, 15, 16]},
     #arena_graph_base{id = 38, base_id = 20007, num = 1,
                       name = lang:get("资质丸"), quality = 4, sex = 2,
                       classes = 0, lev_low = 0, lev_high = 0, ratio = 30,
                       times = 1, order_list = [13, 14, 15, 16]},
     #arena_graph_base{id = 39, base_id = 29104, num = 1,
                       name = lang:get("生命精华"), quality = 4, sex = 2,
                       classes = 0, lev_low = 0, lev_high = 0, ratio = 30,
                       times = 1, order_list = [13, 14, 15, 16]},
     #arena_graph_base{id = 40, base_id = 21232, num = 1,
                       name = lang:get("绝地武士元神"), quality = 4, sex = 2,
                       classes = 0, lev_low = 109, lev_high = 118, ratio = 50,
                       times = 1, order_list = [13, 14, 15, 16]},
     #arena_graph_base{id = 41, base_id = 21233, num = 1,
                       name = lang:get("奇幻精灵元神"), quality = 4, sex = 2,
                       classes = 0, lev_low = 109, lev_high = 118, ratio = 50,
                       times = 1, order_list = [13, 14, 15, 16]},
     #arena_graph_base{id = 42, base_id = 21234, num = 1,
                       name = lang:get("幽冥行者元神"), quality = 4, sex = 2,
                       classes = 0, lev_low = 119, lev_high = 200, ratio = 50,
                       times = 1, order_list = [13, 14, 15, 16]},
     #arena_graph_base{id = 43, base_id = 21235, num = 1,
                       name = lang:get("冰晶女王元神"), quality = 4, sex = 2,
                       classes = 0, lev_low = 119, lev_high = 200, ratio = 50,
                       times = 1, order_list = [13, 14, 15, 16]},
     #arena_graph_base{id = 44, base_id = 21236, num = 1,
                       name = lang:get("镜仙元神"), quality = 4, sex = 2,
                       classes = 0, lev_low = 85, lev_high = 95, ratio = 50,
                       times = 1, order_list = [13, 14, 15, 16]}].

get_graph_end() ->
    [#{base_id => 20087, num => 1, ratio => 35, lev => 0,
       is_cast => 1},
     #{base_id => 29006, num => 1, ratio => 15, lev => 0,
       is_cast => 1},
     #{base_id => 20007, num => 1, ratio => 20, lev => 0,
       is_cast => 0},
     #{base_id => 29104, num => 1, ratio => 30, lev => 0,
       is_cast => 0},
     #{base_id => 20075, num => 1, ratio => 3, lev => 0,
       is_cast => 1},
     #{base_id => 20008, num => 1, ratio => 20, lev => 0,
       is_cast => 0},
     #{base_id => 20009, num => 1, ratio => 8, lev => 0,
       is_cast => 1},
     #{base_id => 20021, num => 1, ratio => 60, lev => 0,
       is_cast => 1},
     #{base_id => 20034, num => 1, ratio => 60, lev => 0,
       is_cast => 0},
     #{base_id => 20045, num => 1, ratio => 90, lev => 0,
       is_cast => 0},
     #{base_id => 20616, num => 1, ratio => 2, lev => 0,
       is_cast => 1},
     #{base_id => 20039, num => 1, ratio => 20, lev => 0,
       is_cast => 1},
     #{base_id => 20046, num => 1, ratio => 10, lev => 0,
       is_cast => 1},
     #{base_id => 29104, num => 1, ratio => 147, lev => 0,
       is_cast => 0},
     #{base_id => 20007, num => 1, ratio => 80, lev => 0,
       is_cast => 0},
     #{base_id => 90012, num => 15, ratio => 400, lev => 0,
       is_cast => 0},
     #{base_id => 22400, num => 6, ratio => 430, lev => 60,
       is_cast => 0}].

get_cast(20087) -> 1;
get_cast(29006) -> 1;
get_cast(20075) -> 1;
get_cast(20009) -> 1;
get_cast(20021) -> 1;
get_cast(20616) -> 1;
get_cast(20039) -> 1;
get_cast(20046) -> 1;
get_cast(29104) -> 1;
get_cast(_) -> 0.

