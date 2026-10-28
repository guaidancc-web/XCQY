-file("src/data/parade_data.erl", 1).

-module(parade_data).

-export([list/0, get/1, get_curve/1, get_lev/1]).

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

-file("src/data/parade_data.erl", 17).

list() -> [{10001, 73000}].

get({10001, 73000}) ->
    #{map_id => 10001, unit_id => 73000,
      path =>
          [{1818, 2036},
           {766, 2632},
           {1414, 2983},
           {2612, 2342},
           {2904, 2304},
           {3519, 2759},
           {2303, 3404},
           {1494, 2968},
           {2605, 2237},
           {2116, 1893}]};
get(Id) -> {none, Id}.

get_curve(_) -> none.

get_lev(1) ->
    #{lev => 1, exp => 0, pet_exp => 1025, bobling_exp => 0,
      pet_bobling_exp => 854, final_exp => 0,
      pet_final_exp => 1896, final_item => []};
get_lev(2) ->
    #{lev => 2, exp => 0, pet_exp => 1048, bobling_exp => 0,
      pet_bobling_exp => 874, final_exp => 0,
      pet_final_exp => 1936, final_item => []};
get_lev(3) ->
    #{lev => 3, exp => 0, pet_exp => 1079, bobling_exp => 0,
      pet_bobling_exp => 899, final_exp => 0,
      pet_final_exp => 1992, final_item => []};
get_lev(4) ->
    #{lev => 4, exp => 0, pet_exp => 1110, bobling_exp => 0,
      pet_bobling_exp => 925, final_exp => 0,
      pet_final_exp => 2048, final_item => []};
get_lev(5) ->
    #{lev => 5, exp => 0, pet_exp => 1132, bobling_exp => 0,
      pet_bobling_exp => 944, final_exp => 0,
      pet_final_exp => 2088, final_item => []};
get_lev(6) ->
    #{lev => 6, exp => 0, pet_exp => 1164, bobling_exp => 0,
      pet_bobling_exp => 970, final_exp => 0,
      pet_final_exp => 2148, final_item => []};
get_lev(7) ->
    #{lev => 7, exp => 0, pet_exp => 1194, bobling_exp => 0,
      pet_bobling_exp => 995, final_exp => 0,
      pet_final_exp => 2204, final_item => []};
get_lev(8) ->
    #{lev => 8, exp => 0, pet_exp => 1216, bobling_exp => 0,
      pet_bobling_exp => 1014, final_exp => 0,
      pet_final_exp => 2248, final_item => []};
get_lev(9) ->
    #{lev => 9, exp => 0, pet_exp => 1248, bobling_exp => 0,
      pet_bobling_exp => 1040, final_exp => 0,
      pet_final_exp => 2304, final_item => []};
get_lev(10) ->
    #{lev => 10, exp => 0, pet_exp => 1278,
      bobling_exp => 0, pet_bobling_exp => 1065,
      final_exp => 0, pet_final_exp => 2360,
      final_item => []};
get_lev(11) ->
    #{lev => 11, exp => 0, pet_exp => 1308,
      bobling_exp => 0, pet_bobling_exp => 1090,
      final_exp => 0, pet_final_exp => 2416,
      final_item => []};
get_lev(12) ->
    #{lev => 12, exp => 0, pet_exp => 1340,
      bobling_exp => 0, pet_bobling_exp => 1116,
      final_exp => 0, pet_final_exp => 2472,
      final_item => []};
get_lev(13) ->
    #{lev => 13, exp => 0, pet_exp => 1362,
      bobling_exp => 0, pet_bobling_exp => 1135,
      final_exp => 0, pet_final_exp => 2520,
      final_item => []};
get_lev(14) ->
    #{lev => 14, exp => 0, pet_exp => 1393,
      bobling_exp => 0, pet_bobling_exp => 1161,
      final_exp => 0, pet_final_exp => 2572,
      final_item => []};
get_lev(15) ->
    #{lev => 15, exp => 0, pet_exp => 1424,
      bobling_exp => 0, pet_bobling_exp => 1186,
      final_exp => 0, pet_final_exp => 2628,
      final_item => []};
get_lev(16) ->
    #{lev => 16, exp => 0, pet_exp => 1454,
      bobling_exp => 0, pet_bobling_exp => 1212,
      final_exp => 0, pet_final_exp => 2684,
      final_item => []};
get_lev(17) ->
    #{lev => 17, exp => 0, pet_exp => 1484,
      bobling_exp => 0, pet_bobling_exp => 1237,
      final_exp => 0, pet_final_exp => 2740,
      final_item => []};
get_lev(18) ->
    #{lev => 18, exp => 0, pet_exp => 1516,
      bobling_exp => 0, pet_bobling_exp => 1263,
      final_exp => 0, pet_final_exp => 2800,
      final_item => []};
get_lev(19) ->
    #{lev => 19, exp => 0, pet_exp => 1546,
      bobling_exp => 0, pet_bobling_exp => 1288,
      final_exp => 0, pet_final_exp => 2856,
      final_item => []};
get_lev(20) ->
    #{lev => 20, exp => 0, pet_exp => 1576,
      bobling_exp => 0, pet_bobling_exp => 1314,
      final_exp => 0, pet_final_exp => 2912,
      final_item => []};
get_lev(21) ->
    #{lev => 21, exp => 0, pet_exp => 1608,
      bobling_exp => 0, pet_bobling_exp => 1340,
      final_exp => 0, pet_final_exp => 2968,
      final_item => []};
get_lev(22) ->
    #{lev => 22, exp => 0, pet_exp => 1638,
      bobling_exp => 0, pet_bobling_exp => 1365,
      final_exp => 0, pet_final_exp => 3024,
      final_item => []};
get_lev(23) ->
    #{lev => 23, exp => 0, pet_exp => 1668,
      bobling_exp => 0, pet_bobling_exp => 1390,
      final_exp => 0, pet_final_exp => 3080,
      final_item => []};
get_lev(24) ->
    #{lev => 24, exp => 0, pet_exp => 1699,
      bobling_exp => 0, pet_bobling_exp => 1416,
      final_exp => 0, pet_final_exp => 3140,
      final_item => []};
get_lev(25) ->
    #{lev => 25, exp => 0, pet_exp => 1730,
      bobling_exp => 0, pet_bobling_exp => 1442,
      final_exp => 0, pet_final_exp => 3192,
      final_item => []};
get_lev(26) ->
    #{lev => 26, exp => 0, pet_exp => 1760,
      bobling_exp => 0, pet_bobling_exp => 1467,
      final_exp => 0, pet_final_exp => 3248,
      final_item => []};
get_lev(27) ->
    #{lev => 27, exp => 0, pet_exp => 1791,
      bobling_exp => 0, pet_bobling_exp => 1492,
      final_exp => 0, pet_final_exp => 3308,
      final_item => []};
get_lev(28) ->
    #{lev => 28, exp => 0, pet_exp => 1821,
      bobling_exp => 0, pet_bobling_exp => 1518,
      final_exp => 0, pet_final_exp => 3364,
      final_item => []};
get_lev(29) ->
    #{lev => 29, exp => 0, pet_exp => 1852,
      bobling_exp => 0, pet_bobling_exp => 1544,
      final_exp => 0, pet_final_exp => 3420,
      final_item => []};
get_lev(30) ->
    #{lev => 30, exp => 2489, pet_exp => 1883,
      bobling_exp => 2074, pet_bobling_exp => 1569,
      final_exp => 4596, pet_final_exp => 3480,
      final_item => [{20052, 1, 200}]};
get_lev(31) ->
    #{lev => 31, exp => 2528, pet_exp => 1900,
      bobling_exp => 2106, pet_bobling_exp => 1584,
      final_exp => 4667, pet_final_exp => 3508,
      final_item => [{20052, 1, 200}]};
get_lev(32) ->
    #{lev => 32, exp => 2566, pet_exp => 1920,
      bobling_exp => 2138, pet_bobling_exp => 1600,
      final_exp => 4738, pet_final_exp => 3544,
      final_item => [{20052, 1, 200}]};
get_lev(33) ->
    #{lev => 33, exp => 2604, pet_exp => 1937,
      bobling_exp => 2170, pet_bobling_exp => 1614,
      final_exp => 4809, pet_final_exp => 3576,
      final_item => [{20052, 1, 200}]};
get_lev(34) ->
    #{lev => 34, exp => 2652, pet_exp => 1963,
      bobling_exp => 2210, pet_bobling_exp => 1636,
      final_exp => 4897, pet_final_exp => 3624,
      final_item => [{20052, 1, 200}]};
get_lev(35) ->
    #{lev => 35, exp => 2691, pet_exp => 1980,
      bobling_exp => 2242, pet_bobling_exp => 1650,
      final_exp => 4968, pet_final_exp => 3656,
      final_item => [{20052, 1, 200}]};
get_lev(36) ->
    #{lev => 36, exp => 2729, pet_exp => 1998,
      bobling_exp => 2274, pet_bobling_exp => 1665,
      final_exp => 5039, pet_final_exp => 3688,
      final_item => [{20052, 1, 200}]};
get_lev(37) ->
    #{lev => 37, exp => 2768, pet_exp => 2014,
      bobling_exp => 2306, pet_bobling_exp => 1678,
      final_exp => 5110, pet_final_exp => 3720,
      final_item => [{20052, 1, 200}]};
get_lev(38) ->
    #{lev => 38, exp => 2816, pet_exp => 2038,
      bobling_exp => 2346, pet_bobling_exp => 1698,
      final_exp => 5199, pet_final_exp => 3764,
      final_item => [{20052, 1, 200}]};
get_lev(39) ->
    #{lev => 39, exp => 2854, pet_exp => 2054,
      bobling_exp => 2378, pet_bobling_exp => 1712,
      final_exp => 5270, pet_final_exp => 3792,
      final_item => [{20052, 1, 200}]};
get_lev(40) ->
    #{lev => 40, exp => 2972, pet_exp => 2128,
      bobling_exp => 2477, pet_bobling_exp => 1773,
      final_exp => 5488, pet_final_exp => 3928,
      final_item => [{20052, 1, 200}]};
get_lev(41) ->
    #{lev => 41, exp => 3020, pet_exp => 2150,
      bobling_exp => 2517, pet_bobling_exp => 1792,
      final_exp => 5577, pet_final_exp => 3968,
      final_item => [{20052, 1, 200}]};
get_lev(42) ->
    #{lev => 42, exp => 3059, pet_exp => 2166,
      bobling_exp => 2549, pet_bobling_exp => 1805,
      final_exp => 5648, pet_final_exp => 4000,
      final_item => [{20052, 1, 200}]};
get_lev(43) ->
    #{lev => 43, exp => 3107, pet_exp => 2188,
      bobling_exp => 2589, pet_bobling_exp => 1824,
      final_exp => 5736, pet_final_exp => 4040,
      final_item => [{20052, 1, 200}]};
get_lev(44) ->
    #{lev => 44, exp => 3145, pet_exp => 2201,
      bobling_exp => 2621, pet_bobling_exp => 1834,
      final_exp => 5807, pet_final_exp => 4064,
      final_item => [{20052, 1, 200}]};
get_lev(45) ->
    #{lev => 45, exp => 3184, pet_exp => 2216,
      bobling_exp => 2653, pet_bobling_exp => 1846,
      final_exp => 5878, pet_final_exp => 4092,
      final_item => [{20052, 1, 200}]};
get_lev(46) ->
    #{lev => 46, exp => 3232, pet_exp => 2236,
      bobling_exp => 2693, pet_bobling_exp => 1864,
      final_exp => 5967, pet_final_exp => 4128,
      final_item => [{20052, 1, 200}]};
get_lev(47) ->
    #{lev => 47, exp => 3270, pet_exp => 2249,
      bobling_exp => 2725, pet_bobling_exp => 1874,
      final_exp => 6038, pet_final_exp => 4152,
      final_item => [{20052, 1, 200}]};
get_lev(48) ->
    #{lev => 48, exp => 3318, pet_exp => 2268,
      bobling_exp => 2765, pet_bobling_exp => 1890,
      final_exp => 6126, pet_final_exp => 4188,
      final_item => [{20052, 1, 200}]};
get_lev(49) ->
    #{lev => 49, exp => 3356, pet_exp => 2281,
      bobling_exp => 2797, pet_bobling_exp => 1901,
      final_exp => 6197, pet_final_exp => 4212,
      final_item => [{20052, 1, 200}]};
get_lev(50) ->
    #{lev => 50, exp => 3404, pet_exp => 2300,
      bobling_exp => 2837, pet_bobling_exp => 1917,
      final_exp => 6286, pet_final_exp => 4248,
      final_item => [{20052, 1, 200}]};
get_lev(51) ->
    #{lev => 51, exp => 3443, pet_exp => 2313,
      bobling_exp => 2869, pet_bobling_exp => 1928,
      final_exp => 6357, pet_final_exp => 4272,
      final_item => [{20052, 1, 200}]};
get_lev(52) ->
    #{lev => 52, exp => 3491, pet_exp => 2332,
      bobling_exp => 2909, pet_bobling_exp => 1944,
      final_exp => 6445, pet_final_exp => 4304,
      final_item => [{20052, 1, 200}]};
get_lev(53) ->
    #{lev => 53, exp => 3539, pet_exp => 2350,
      bobling_exp => 2949, pet_bobling_exp => 1958,
      final_exp => 6534, pet_final_exp => 4340,
      final_item => [{20052, 1, 200}]};
get_lev(54) ->
    #{lev => 54, exp => 3577, pet_exp => 2361,
      bobling_exp => 2981, pet_bobling_exp => 1968,
      final_exp => 6605, pet_final_exp => 4360,
      final_item => [{20052, 1, 200}]};
get_lev(55) ->
    #{lev => 55, exp => 3705, pet_exp => 2430,
      bobling_exp => 3088, pet_bobling_exp => 2025,
      final_exp => 6841, pet_final_exp => 4488,
      final_item => [{20052, 1, 200}]};
get_lev(56) ->
    #{lev => 56, exp => 3744, pet_exp => 2441,
      bobling_exp => 3120, pet_bobling_exp => 2034,
      final_exp => 6912, pet_final_exp => 4508,
      final_item => [{20052, 1, 200}]};
get_lev(57) ->
    #{lev => 57, exp => 3792, pet_exp => 2457,
      bobling_exp => 3160, pet_bobling_exp => 2048,
      final_exp => 7001, pet_final_exp => 4536,
      final_item => [{20052, 1, 200}]};
get_lev(58) ->
    #{lev => 58, exp => 3840, pet_exp => 2473,
      bobling_exp => 3200, pet_bobling_exp => 2061,
      final_exp => 7089, pet_final_exp => 4568,
      final_item => [{20052, 1, 200}]};
get_lev(59) ->
    #{lev => 59, exp => 3878, pet_exp => 2481,
      bobling_exp => 3232, pet_bobling_exp => 2068,
      final_exp => 7160, pet_final_exp => 4584,
      final_item => [{20052, 1, 200}]};
get_lev(60) ->
    #{lev => 60, exp => 4006, pet_exp => 2547,
      bobling_exp => 3338, pet_bobling_exp => 2122,
      final_exp => 7396, pet_final_exp => 4704,
      final_item => [{20052, 1, 200}]};
get_lev(61) ->
    #{lev => 61, exp => 4054, pet_exp => 2561,
      bobling_exp => 3378, pet_bobling_exp => 2134,
      final_exp => 7485, pet_final_exp => 4728,
      final_item => [{20052, 1, 200}]};
get_lev(62) ->
    #{lev => 62, exp => 4102, pet_exp => 2576,
      bobling_exp => 3418, pet_bobling_exp => 2146,
      final_exp => 7574, pet_final_exp => 4756,
      final_item => [{20052, 1, 200}]};
get_lev(63) ->
    #{lev => 63, exp => 4140, pet_exp => 2584,
      bobling_exp => 3450, pet_bobling_exp => 2153,
      final_exp => 7645, pet_final_exp => 4772,
      final_item => [{20052, 1, 200}]};
get_lev(64) ->
    #{lev => 64, exp => 4188, pet_exp => 2596,
      bobling_exp => 3490, pet_bobling_exp => 2164,
      final_exp => 7733, pet_final_exp => 4792,
      final_item => [{20052, 1, 200}]};
get_lev(65) ->
    #{lev => 65, exp => 4236, pet_exp => 2609,
      bobling_exp => 3530, pet_bobling_exp => 2174,
      final_exp => 7822, pet_final_exp => 4820,
      final_item => [{20052, 1, 200}]};
get_lev(66) ->
    #{lev => 66, exp => 4284, pet_exp => 2622,
      bobling_exp => 3570, pet_bobling_exp => 2185,
      final_exp => 7910, pet_final_exp => 4840,
      final_item => [{20052, 1, 200}]};
get_lev(67) ->
    #{lev => 67, exp => 4332, pet_exp => 2633,
      bobling_exp => 3610, pet_bobling_exp => 2194,
      final_exp => 7999, pet_final_exp => 4864,
      final_item => [{20052, 1, 200}]};
get_lev(68) ->
    #{lev => 68, exp => 4380, pet_exp => 2644,
      bobling_exp => 3650, pet_bobling_exp => 2204,
      final_exp => 8088, pet_final_exp => 4880,
      final_item => [{20052, 1, 200}]};
get_lev(69) ->
    #{lev => 69, exp => 4419, pet_exp => 2652,
      bobling_exp => 3682, pet_bobling_exp => 2210,
      final_exp => 8159, pet_final_exp => 4896,
      final_item => [{20052, 1, 200}]};
get_lev(70) ->
    #{lev => 70, exp => 4467, pet_exp => 2662,
      bobling_exp => 3722, pet_bobling_exp => 2218,
      final_exp => 8247, pet_final_exp => 4916,
      final_item => [{20052, 1, 200}]};
get_lev(71) ->
    #{lev => 71, exp => 4515, pet_exp => 2673,
      bobling_exp => 3762, pet_bobling_exp => 2228,
      final_exp => 8336, pet_final_exp => 4936,
      final_item => [{20052, 1, 200}]};
get_lev(72) ->
    #{lev => 72, exp => 4563, pet_exp => 2683,
      bobling_exp => 3802, pet_bobling_exp => 2236,
      final_exp => 8424, pet_final_exp => 4956,
      final_item => [{20052, 1, 200}]};
get_lev(73) ->
    #{lev => 73, exp => 4611, pet_exp => 2692,
      bobling_exp => 3842, pet_bobling_exp => 2244,
      final_exp => 8513, pet_final_exp => 4968,
      final_item => [{20052, 1, 200}]};
get_lev(74) ->
    #{lev => 74, exp => 4659, pet_exp => 2702,
      bobling_exp => 3882, pet_bobling_exp => 2252,
      final_exp => 8602, pet_final_exp => 4988,
      final_item => [{20052, 1, 200}]};
get_lev(75) ->
    #{lev => 75, exp => 4707, pet_exp => 2712,
      bobling_exp => 3922, pet_bobling_exp => 2260,
      final_exp => 8690, pet_final_exp => 5008,
      final_item => [{20052, 1, 200}]};
get_lev(76) ->
    #{lev => 76, exp => 4755, pet_exp => 2720,
      bobling_exp => 3962, pet_bobling_exp => 2266,
      final_exp => 8779, pet_final_exp => 5020,
      final_item => [{20052, 1, 200}]};
get_lev(77) ->
    #{lev => 77, exp => 4803, pet_exp => 2728,
      bobling_exp => 4002, pet_bobling_exp => 2273,
      final_exp => 8867, pet_final_exp => 5036,
      final_item => [{20052, 1, 200}]};
get_lev(78) ->
    #{lev => 78, exp => 4851, pet_exp => 2736,
      bobling_exp => 4042, pet_bobling_exp => 2280,
      final_exp => 8956, pet_final_exp => 5052,
      final_item => [{20052, 1, 200}]};
get_lev(79) ->
    #{lev => 79, exp => 4899, pet_exp => 2744,
      bobling_exp => 4082, pet_bobling_exp => 2286,
      final_exp => 9045, pet_final_exp => 5064,
      final_item => [{20052, 1, 200}]};
get_lev(80) ->
    #{lev => 80, exp => 5267, pet_exp => 2950,
      bobling_exp => 4389, pet_bobling_exp => 2458,
      final_exp => 9724, pet_final_exp => 5448,
      final_item => [{20052, 1, 200}]};
get_lev(81) ->
    #{lev => 81, exp => 5324, pet_exp => 2980,
      bobling_exp => 4437, pet_bobling_exp => 2484,
      final_exp => 9830, pet_final_exp => 5500,
      final_item => [{20052, 1, 200}]};
get_lev(82) ->
    #{lev => 82, exp => 5372, pet_exp => 3008,
      bobling_exp => 4477, pet_bobling_exp => 2506,
      final_exp => 9919, pet_final_exp => 5552,
      final_item => [{20052, 1, 200}]};
get_lev(83) ->
    #{lev => 83, exp => 5420, pet_exp => 3035,
      bobling_exp => 4517, pet_bobling_exp => 2529,
      final_exp => 10008, pet_final_exp => 5604,
      final_item => [{20052, 1, 200}]};
get_lev(84) ->
    #{lev => 84, exp => 5468, pet_exp => 3062,
      bobling_exp => 4557, pet_bobling_exp => 2552,
      final_exp => 10096, pet_final_exp => 5652,
      final_item => [{20052, 1, 200}]};
get_lev(85) ->
    #{lev => 85, exp => 5516, pet_exp => 3089,
      bobling_exp => 4597, pet_bobling_exp => 2574,
      final_exp => 10185, pet_final_exp => 5704,
      final_item => [{20052, 1, 200}]};
get_lev(86) ->
    #{lev => 86, exp => 5564, pet_exp => 3115,
      bobling_exp => 4637, pet_bobling_exp => 2596,
      final_exp => 10273, pet_final_exp => 5752,
      final_item => [{20052, 1, 200}]};
get_lev(87) ->
    #{lev => 87, exp => 5622, pet_exp => 3148,
      bobling_exp => 4685, pet_bobling_exp => 2624,
      final_exp => 10380, pet_final_exp => 5812,
      final_item => [{20052, 1, 200}]};
get_lev(88) ->
    #{lev => 88, exp => 5670, pet_exp => 3176,
      bobling_exp => 4725, pet_bobling_exp => 2646,
      final_exp => 10468, pet_final_exp => 5864,
      final_item => [{20052, 1, 200}]};
get_lev(89) ->
    #{lev => 89, exp => 5718, pet_exp => 3201,
      bobling_exp => 4765, pet_bobling_exp => 2668,
      final_exp => 10557, pet_final_exp => 5912,
      final_item => [{20052, 1, 200}]};
get_lev(90) ->
    #{lev => 90, exp => 5766, pet_exp => 3228,
      bobling_exp => 4805, pet_bobling_exp => 2690,
      final_exp => 10646, pet_final_exp => 5960,
      final_item => [{20052, 1, 200}]};
get_lev(91) ->
    #{lev => 91, exp => 5824, pet_exp => 3260,
      bobling_exp => 4853, pet_bobling_exp => 2717,
      final_exp => 10752, pet_final_exp => 6020,
      final_item => [{20052, 1, 200}]};
get_lev(92) ->
    #{lev => 92, exp => 5872, pet_exp => 3288,
      bobling_exp => 4893, pet_bobling_exp => 2740,
      final_exp => 10841, pet_final_exp => 6072,
      final_item => [{20052, 1, 200}]};
get_lev(93) ->
    #{lev => 93, exp => 5920, pet_exp => 3315,
      bobling_exp => 4933, pet_bobling_exp => 2762,
      final_exp => 10929, pet_final_exp => 6120,
      final_item => [{20052, 1, 200}]};
get_lev(94) ->
    #{lev => 94, exp => 5977, pet_exp => 3347,
      bobling_exp => 4981, pet_bobling_exp => 2789,
      final_exp => 11036, pet_final_exp => 6180,
      final_item => [{20052, 1, 200}]};
get_lev(95) ->
    #{lev => 95, exp => 6025, pet_exp => 3374,
      bobling_exp => 5021, pet_bobling_exp => 2812,
      final_exp => 11124, pet_final_exp => 6228,
      final_item => [{20052, 1, 200}]};
get_lev(96) ->
    #{lev => 96, exp => 6073, pet_exp => 3401,
      bobling_exp => 5061, pet_bobling_exp => 2834,
      final_exp => 11213, pet_final_exp => 6280,
      final_item => [{20052, 1, 200}]};
get_lev(97) ->
    #{lev => 97, exp => 6131, pet_exp => 3433,
      bobling_exp => 5109, pet_bobling_exp => 2861,
      final_exp => 11319, pet_final_exp => 6340,
      final_item => [{20052, 1, 200}]};
get_lev(98) ->
    #{lev => 98, exp => 6179, pet_exp => 3460,
      bobling_exp => 5149, pet_bobling_exp => 2884,
      final_exp => 11408, pet_final_exp => 6388,
      final_item => [{20052, 1, 200}]};
get_lev(99) ->
    #{lev => 99, exp => 6227, pet_exp => 3488,
      bobling_exp => 5189, pet_bobling_exp => 2906,
      final_exp => 11496, pet_final_exp => 6440,
      final_item => [{20052, 1, 200}]};
get_lev(100) ->
    #{lev => 100, exp => 6289, pet_exp => 3522,
      bobling_exp => 5240, pet_bobling_exp => 2935,
      final_exp => 11610, pet_final_exp => 6504,
      final_item => [{20052, 1, 200}]};
get_lev(101) ->
    #{lev => 101, exp => 6351, pet_exp => 3557,
      bobling_exp => 5292, pet_bobling_exp => 2964,
      final_exp => 11726, pet_final_exp => 6569,
      final_item => [{20052, 1, 200}]};
get_lev(102) ->
    #{lev => 102, exp => 6414, pet_exp => 3592,
      bobling_exp => 5344, pet_bobling_exp => 2993,
      final_exp => 11843, pet_final_exp => 6634,
      final_item => [{20052, 1, 200}]};
get_lev(103) ->
    #{lev => 103, exp => 6478, pet_exp => 3627,
      bobling_exp => 5397, pet_bobling_exp => 3022,
      final_exp => 11961, pet_final_exp => 6700,
      final_item => [{20052, 1, 200}]};
get_lev(104) ->
    #{lev => 104, exp => 6542, pet_exp => 3663,
      bobling_exp => 5450, pet_bobling_exp => 3052,
      final_exp => 12080, pet_final_exp => 6767,
      final_item => [{20052, 1, 200}]};
get_lev(105) ->
    #{lev => 105, exp => 6607, pet_exp => 3699,
      bobling_exp => 5504, pet_bobling_exp => 3082,
      final_exp => 12200, pet_final_exp => 6834,
      final_item => [{20052, 1, 200}]};
get_lev(106) ->
    #{lev => 106, exp => 6673, pet_exp => 3735,
      bobling_exp => 5559, pet_bobling_exp => 3112,
      final_exp => 12322, pet_final_exp => 6902,
      final_item => [{20052, 1, 200}]};
get_lev(107) ->
    #{lev => 107, exp => 6739, pet_exp => 3772,
      bobling_exp => 5614, pet_bobling_exp => 3143,
      final_exp => 12445, pet_final_exp => 6971,
      final_item => [{20052, 1, 200}]};
get_lev(108) ->
    #{lev => 108, exp => 6806, pet_exp => 3809,
      bobling_exp => 5670, pet_bobling_exp => 3174,
      final_exp => 12569, pet_final_exp => 7040,
      final_item => [{20052, 1, 200}]};
get_lev(109) ->
    #{lev => 109, exp => 6874, pet_exp => 3847,
      bobling_exp => 5726, pet_bobling_exp => 3205,
      final_exp => 12694, pet_final_exp => 7110,
      final_item => [{20052, 1, 200}]};
get_lev(110) ->
    #{lev => 110, exp => 6942, pet_exp => 3885,
      bobling_exp => 5783, pet_bobling_exp => 3237,
      final_exp => 12820, pet_final_exp => 7181,
      final_item => [{20052, 1, 200}]};
get_lev(111) ->
    #{lev => 111, exp => 7011, pet_exp => 3923,
      bobling_exp => 5840, pet_bobling_exp => 3269,
      final_exp => 12948, pet_final_exp => 7252,
      final_item => [{20052, 1, 200}]};
get_lev(112) ->
    #{lev => 112, exp => 7081, pet_exp => 3962,
      bobling_exp => 5898, pet_bobling_exp => 3301,
      final_exp => 13077, pet_final_exp => 7324,
      final_item => [{20052, 1, 200}]};
get_lev(113) ->
    #{lev => 113, exp => 7151, pet_exp => 4001,
      bobling_exp => 5956, pet_bobling_exp => 3334,
      final_exp => 13207, pet_final_exp => 7397,
      final_item => [{20052, 1, 200}]};
get_lev(114) ->
    #{lev => 114, exp => 7222, pet_exp => 4041,
      bobling_exp => 6015, pet_bobling_exp => 3367,
      final_exp => 13339, pet_final_exp => 7470,
      final_item => [{20052, 1, 200}]};
get_lev(115) ->
    #{lev => 115, exp => 7294, pet_exp => 4081,
      bobling_exp => 6075, pet_bobling_exp => 3400,
      final_exp => 13472, pet_final_exp => 7544,
      final_item => [{20052, 1, 200}]};
get_lev(116) ->
    #{lev => 116, exp => 7366, pet_exp => 4121,
      bobling_exp => 6135, pet_bobling_exp => 3434,
      final_exp => 13606, pet_final_exp => 7619,
      final_item => [{20052, 1, 200}]};
get_lev(117) ->
    #{lev => 117, exp => 7439, pet_exp => 4162,
      bobling_exp => 6196, pet_bobling_exp => 3468,
      final_exp => 13742, pet_final_exp => 7695,
      final_item => [{20052, 1, 200}]};
get_lev(118) ->
    #{lev => 118, exp => 7513, pet_exp => 4203,
      bobling_exp => 6257, pet_bobling_exp => 3502,
      final_exp => 13879, pet_final_exp => 7771,
      final_item => [{20052, 1, 200}]};
get_lev(119) ->
    #{lev => 119, exp => 7588, pet_exp => 4245,
      bobling_exp => 6319, pet_bobling_exp => 3537,
      final_exp => 14017, pet_final_exp => 7848,
      final_item => [{20052, 1, 200}]};
get_lev(120) ->
    #{lev => 120, exp => 7663, pet_exp => 4287,
      bobling_exp => 6382, pet_bobling_exp => 3572,
      final_exp => 14157, pet_final_exp => 7926,
      final_item => [{20052, 1, 200}]};
get_lev(121) ->
    #{lev => 121, exp => 7739, pet_exp => 4329,
      bobling_exp => 6445, pet_bobling_exp => 3607,
      final_exp => 14298, pet_final_exp => 8005,
      final_item => [{20052, 1, 200}]};
get_lev(122) ->
    #{lev => 122, exp => 7816, pet_exp => 4372,
      bobling_exp => 6509, pet_bobling_exp => 3643,
      final_exp => 14440, pet_final_exp => 8085,
      final_item => [{20052, 1, 200}]};
get_lev(123) ->
    #{lev => 123, exp => 7894, pet_exp => 4415,
      bobling_exp => 6574, pet_bobling_exp => 3679,
      final_exp => 14584, pet_final_exp => 8165,
      final_item => [{20052, 1, 200}]};
get_lev(124) ->
    #{lev => 124, exp => 7972, pet_exp => 4459,
      bobling_exp => 6639, pet_bobling_exp => 3715,
      final_exp => 14729, pet_final_exp => 8246,
      final_item => [{20052, 1, 200}]};
get_lev(125) ->
    #{lev => 125, exp => 8051, pet_exp => 4503,
      bobling_exp => 6705, pet_bobling_exp => 3752,
      final_exp => 14876, pet_final_exp => 8328,
      final_item => [{20052, 1, 200}]};
get_lev(126) ->
    #{lev => 126, exp => 8131, pet_exp => 4548,
      bobling_exp => 6772, pet_bobling_exp => 3789,
      final_exp => 15024, pet_final_exp => 8411,
      final_item => [{20052, 1, 200}]};
get_lev(127) ->
    #{lev => 127, exp => 8212, pet_exp => 4593,
      bobling_exp => 6839, pet_bobling_exp => 3826,
      final_exp => 15174, pet_final_exp => 8495,
      final_item => [{20052, 1, 200}]};
get_lev(128) ->
    #{lev => 128, exp => 8294, pet_exp => 4638,
      bobling_exp => 6907, pet_bobling_exp => 3864,
      final_exp => 15325, pet_final_exp => 8579,
      final_item => [{20052, 1, 200}]};
get_lev(129) ->
    #{lev => 129, exp => 8376, pet_exp => 4684,
      bobling_exp => 6976, pet_bobling_exp => 3902,
      final_exp => 15478, pet_final_exp => 8664,
      final_item => [{20052, 1, 200}]};
get_lev(130) ->
    #{lev => 130, exp => 8459, pet_exp => 4730,
      bobling_exp => 7045, pet_bobling_exp => 3941,
      final_exp => 15632, pet_final_exp => 8750,
      final_item => [{20052, 1, 200}]};
get_lev(131) ->
    #{lev => 131, exp => 8543, pet_exp => 4777,
      bobling_exp => 7115, pet_bobling_exp => 3980,
      final_exp => 15788, pet_final_exp => 8837,
      final_item => [{20052, 1, 200}]};
get_lev(132) ->
    #{lev => 132, exp => 8628, pet_exp => 4824,
      bobling_exp => 7186, pet_bobling_exp => 4019,
      final_exp => 15945, pet_final_exp => 8925,
      final_item => [{20052, 1, 200}]};
get_lev(133) ->
    #{lev => 133, exp => 8714, pet_exp => 4872,
      bobling_exp => 7257, pet_bobling_exp => 4059,
      final_exp => 16104, pet_final_exp => 9014,
      final_item => [{20052, 1, 200}]};
get_lev(134) ->
    #{lev => 134, exp => 8801, pet_exp => 4920,
      bobling_exp => 7329, pet_bobling_exp => 4099,
      final_exp => 16265, pet_final_exp => 9104,
      final_item => [{20052, 1, 200}]};
get_lev(135) ->
    #{lev => 135, exp => 8889, pet_exp => 4969,
      bobling_exp => 7402, pet_bobling_exp => 4139,
      final_exp => 16427, pet_final_exp => 9195,
      final_item => [{20052, 1, 200}]};
get_lev(136) ->
    #{lev => 136, exp => 8977, pet_exp => 5018,
      bobling_exp => 7476, pet_bobling_exp => 4180,
      final_exp => 16591, pet_final_exp => 9286,
      final_item => [{20052, 1, 200}]};
get_lev(_) -> none.

