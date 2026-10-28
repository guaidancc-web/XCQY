-file("src/data/quest_teacher_data.erl", 1).

-module(quest_teacher_data).

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

-file("src/data/quest_teacher_data.erl", 14).

-file("inc/quest_teacher.hrl", 1).

-record(quest_teacher_args,
        {quest_id = 0,
         type = 0,
         sec_type = 0,
         round = 0,
         partner_id,
         partner_pid,
         partner_name = "",
         ask_id = 0,
         ask_start_time = 0,
         dyn_ext_data = [],
         rand_pos = []}).

-record(quest_teacher_stats,
        {teacher_id,
         student_id,
         quest_id = 0,
         type = 0,
         round = 0,
         ext = []}).

-record(quest_teacher_rand_data,
        {round = 0,
         quest_id = 0 :: pos_integer(),
         type = 0,
         sec_type = 0,
         weight :: undefined | non_neg_integer()}).

-record(quest_teacher_reward_data,
        {round = 0,
         exp_ratio = 0,
         coin_ratio = 0,
         pet_exp_ratio = 0,
         rand_items = [],
         item_pcnt = 0,
         teacher_score = 0}).

-record(quest_teacher_patrol_data,
        {id,
         map_base_id,
         unit_list = [],
         weight = 0,
         pcnt = 0,
         min_move_step = 0,
         max_move_step = 0}).

-file("src/data/quest_teacher_data.erl", 15).

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

-file("src/data/quest_teacher_data.erl", 16).

-export([get_quest_rand_list/1,
         get_patrol/1,
         get_reward/1,
         question_reward/1,
         get_teacher_lev_ratio/1,
         get_student_lev_ratio/1]).

get_quest_rand_list(1) ->
    [#quest_teacher_rand_data{round = 1, quest_id = 73010,
                              type = 2, sec_type = 0, weight = 500},
     #quest_teacher_rand_data{round = 1, quest_id = 73011,
                              type = 2, sec_type = 0, weight = 500}];
get_quest_rand_list(2) ->
    [#quest_teacher_rand_data{round = 2, quest_id = 73030,
                              type = 3, sec_type = 0, weight = 1000}];
get_quest_rand_list(3) ->
    [#quest_teacher_rand_data{round = 3, quest_id = 73012,
                              type = 2, sec_type = 0, weight = 250},
     #quest_teacher_rand_data{round = 3, quest_id = 73013,
                              type = 2, sec_type = 0, weight = 250},
     #quest_teacher_rand_data{round = 3, quest_id = 73020,
                              type = 4, sec_type = 0, weight = 100},
     #quest_teacher_rand_data{round = 3, quest_id = 73021,
                              type = 4, sec_type = 0, weight = 100},
     #quest_teacher_rand_data{round = 3, quest_id = 73022,
                              type = 4, sec_type = 0, weight = 150},
     #quest_teacher_rand_data{round = 3, quest_id = 73023,
                              type = 4, sec_type = 0, weight = 150}];
get_quest_rand_list(4) ->
    [#quest_teacher_rand_data{round = 4, quest_id = 73030,
                              type = 3, sec_type = 0, weight = 1000}];
get_quest_rand_list(5) ->
    [#quest_teacher_rand_data{round = 5, quest_id = 73010,
                              type = 2, sec_type = 0, weight = 50},
     #quest_teacher_rand_data{round = 5, quest_id = 73011,
                              type = 2, sec_type = 0, weight = 50},
     #quest_teacher_rand_data{round = 5, quest_id = 73012,
                              type = 2, sec_type = 0, weight = 50},
     #quest_teacher_rand_data{round = 5, quest_id = 73013,
                              type = 2, sec_type = 0, weight = 50},
     #quest_teacher_rand_data{round = 5, quest_id = 73014,
                              type = 2, sec_type = 0, weight = 50},
     #quest_teacher_rand_data{round = 5, quest_id = 73020,
                              type = 4, sec_type = 0, weight = 150},
     #quest_teacher_rand_data{round = 5, quest_id = 73021,
                              type = 4, sec_type = 0, weight = 150},
     #quest_teacher_rand_data{round = 5, quest_id = 73022,
                              type = 4, sec_type = 0, weight = 100},
     #quest_teacher_rand_data{round = 5, quest_id = 73023,
                              type = 4, sec_type = 0, weight = 200}];
get_quest_rand_list(_Round) -> [].

get_patrol(73020) ->
    [#quest_teacher_patrol_data{id = 73020,
                                map_base_id = 10002,
                                unit_list = [{64150, 500}, {64160, 500}],
                                weight = 1000, pcnt = 900, min_move_step = 6,
                                max_move_step = 20}];
get_patrol(73021) ->
    [#quest_teacher_patrol_data{id = 73021,
                                map_base_id = 10003,
                                unit_list = [{64160, 500}, {64170, 500}],
                                weight = 1000, pcnt = 900, min_move_step = 6,
                                max_move_step = 20}];
get_patrol(73022) ->
    [#quest_teacher_patrol_data{id = 73022,
                                map_base_id = 10004,
                                unit_list = [{64170, 500}, {64180, 500}],
                                weight = 1000, pcnt = 900, min_move_step = 6,
                                max_move_step = 20}];
get_patrol(73023) ->
    [#quest_teacher_patrol_data{id = 73023,
                                map_base_id = 10007,
                                unit_list = [{64150, 500}, {64180, 500}],
                                weight = 1000, pcnt = 900, min_move_step = 6,
                                max_move_step = 20}];
get_patrol(_QuestId) -> [].

question_reward(1) ->
    {1,
     [#gain{label = coin, val = 8000},
      #gain{label = stars_score, val = 1}],
     [#gain{label = coin, val = 3000}],
     [#gain{label = coin, val = 8000},
      #gain{label = teacher_score, val = 1}],
     [#gain{label = coin, val = 3000}]};
question_reward(2) ->
    {2,
     [#gain{label = coin, val = 8000},
      #gain{label = stars_score, val = 1}],
     [#gain{label = coin, val = 3000}],
     [#gain{label = coin, val = 8000},
      #gain{label = teacher_score, val = 1}],
     [#gain{label = coin, val = 3000}]};
question_reward(3) ->
    {3,
     [#gain{label = coin, val = 8000},
      #gain{label = stars_score, val = 1}],
     [#gain{label = coin, val = 3000}],
     [#gain{label = coin, val = 8000},
      #gain{label = teacher_score, val = 1}],
     [#gain{label = coin, val = 3000}]};
question_reward(_Sid) -> false.

get_teacher_lev_ratio(1) -> {1000, 880, 800};
get_teacher_lev_ratio(2) -> {1000, 880, 800};
get_teacher_lev_ratio(3) -> {1000, 881, 800};
get_teacher_lev_ratio(4) -> {1000, 881, 800};
get_teacher_lev_ratio(5) -> {1000, 882, 800};
get_teacher_lev_ratio(6) -> {1000, 882, 800};
get_teacher_lev_ratio(7) -> {1000, 882, 800};
get_teacher_lev_ratio(8) -> {1000, 883, 800};
get_teacher_lev_ratio(9) -> {1000, 883, 800};
get_teacher_lev_ratio(10) -> {1000, 884, 800};
get_teacher_lev_ratio(11) -> {1000, 884, 800};
get_teacher_lev_ratio(12) -> {1000, 884, 800};
get_teacher_lev_ratio(13) -> {1000, 885, 800};
get_teacher_lev_ratio(14) -> {1000, 885, 800};
get_teacher_lev_ratio(15) -> {1000, 886, 800};
get_teacher_lev_ratio(16) -> {1000, 886, 800};
get_teacher_lev_ratio(17) -> {1000, 886, 800};
get_teacher_lev_ratio(18) -> {1000, 887, 800};
get_teacher_lev_ratio(19) -> {1000, 887, 800};
get_teacher_lev_ratio(20) -> {1000, 888, 800};
get_teacher_lev_ratio(21) -> {1000, 888, 800};
get_teacher_lev_ratio(22) -> {1000, 888, 800};
get_teacher_lev_ratio(23) -> {1000, 889, 800};
get_teacher_lev_ratio(24) -> {1000, 889, 800};
get_teacher_lev_ratio(25) -> {1093, 890, 874};
get_teacher_lev_ratio(26) -> {1093, 890, 874};
get_teacher_lev_ratio(27) -> {1093, 890, 874};
get_teacher_lev_ratio(28) -> {1093, 891, 874};
get_teacher_lev_ratio(29) -> {1093, 891, 874};
get_teacher_lev_ratio(30) -> {1231, 892, 984};
get_teacher_lev_ratio(31) -> {1231, 892, 984};
get_teacher_lev_ratio(32) -> {1231, 892, 984};
get_teacher_lev_ratio(33) -> {1231, 893, 984};
get_teacher_lev_ratio(34) -> {1231, 893, 984};
get_teacher_lev_ratio(35) -> {1329, 894, 1063};
get_teacher_lev_ratio(36) -> {1329, 894, 1063};
get_teacher_lev_ratio(37) -> {1329, 894, 1063};
get_teacher_lev_ratio(38) -> {1329, 895, 1063};
get_teacher_lev_ratio(39) -> {1329, 895, 1063};
get_teacher_lev_ratio(40) -> {1470, 896, 1176};
get_teacher_lev_ratio(41) -> {1470, 896, 1176};
get_teacher_lev_ratio(42) -> {1470, 896, 1176};
get_teacher_lev_ratio(43) -> {1470, 897, 1176};
get_teacher_lev_ratio(44) -> {1470, 897, 1176};
get_teacher_lev_ratio(45) -> {1573, 898, 1258};
get_teacher_lev_ratio(46) -> {1573, 898, 1258};
get_teacher_lev_ratio(47) -> {1573, 898, 1258};
get_teacher_lev_ratio(48) -> {1573, 899, 1258};
get_teacher_lev_ratio(49) -> {1573, 899, 1258};
get_teacher_lev_ratio(50) -> {1676, 900, 1340};
get_teacher_lev_ratio(51) -> {1676, 900, 1340};
get_teacher_lev_ratio(52) -> {1676, 900, 1340};
get_teacher_lev_ratio(53) -> {1676, 901, 1340};
get_teacher_lev_ratio(54) -> {1676, 901, 1340};
get_teacher_lev_ratio(55) -> {1822, 902, 1457};
get_teacher_lev_ratio(56) -> {1822, 902, 1457};
get_teacher_lev_ratio(57) -> {1822, 902, 1457};
get_teacher_lev_ratio(58) -> {1822, 903, 1457};
get_teacher_lev_ratio(59) -> {1822, 903, 1457};
get_teacher_lev_ratio(60) -> {1974, 904, 1579};
get_teacher_lev_ratio(61) -> {1974, 904, 1579};
get_teacher_lev_ratio(62) -> {1974, 904, 1579};
get_teacher_lev_ratio(63) -> {1974, 905, 1579};
get_teacher_lev_ratio(64) -> {1974, 905, 1579};
get_teacher_lev_ratio(65) -> {2086, 906, 1668};
get_teacher_lev_ratio(66) -> {2086, 906, 1668};
get_teacher_lev_ratio(67) -> {2086, 906, 1668};
get_teacher_lev_ratio(68) -> {2086, 907, 1668};
get_teacher_lev_ratio(69) -> {2086, 907, 1668};
get_teacher_lev_ratio(70) -> {2198, 908, 1758};
get_teacher_lev_ratio(71) -> {2198, 908, 1758};
get_teacher_lev_ratio(72) -> {2198, 908, 1758};
get_teacher_lev_ratio(73) -> {2198, 909, 1758};
get_teacher_lev_ratio(74) -> {2198, 909, 1758};
get_teacher_lev_ratio(75) -> {2315, 910, 1852};
get_teacher_lev_ratio(76) -> {2315, 910, 1852};
get_teacher_lev_ratio(77) -> {2315, 910, 1852};
get_teacher_lev_ratio(78) -> {2315, 911, 1852};
get_teacher_lev_ratio(79) -> {2315, 911, 1852};
get_teacher_lev_ratio(80) -> {2592, 912, 2073};
get_teacher_lev_ratio(81) -> {2592, 912, 2073};
get_teacher_lev_ratio(82) -> {2592, 912, 2073};
get_teacher_lev_ratio(83) -> {2592, 913, 2073};
get_teacher_lev_ratio(84) -> {2592, 913, 2073};
get_teacher_lev_ratio(85) -> {2709, 914, 2167};
get_teacher_lev_ratio(86) -> {2709, 914, 2167};
get_teacher_lev_ratio(87) -> {2709, 914, 2167};
get_teacher_lev_ratio(88) -> {2709, 915, 2167};
get_teacher_lev_ratio(89) -> {2709, 915, 2167};
get_teacher_lev_ratio(90) -> {2835, 916, 2268};
get_teacher_lev_ratio(91) -> {2835, 916, 2268};
get_teacher_lev_ratio(92) -> {2835, 916, 2268};
get_teacher_lev_ratio(93) -> {2835, 917, 2268};
get_teacher_lev_ratio(94) -> {2835, 917, 2268};
get_teacher_lev_ratio(95) -> {2956, 918, 2364};
get_teacher_lev_ratio(96) -> {2956, 918, 2364};
get_teacher_lev_ratio(97) -> {2956, 918, 2364};
get_teacher_lev_ratio(98) -> {2956, 919, 2364};
get_teacher_lev_ratio(99) -> {2956, 919, 2364};
get_teacher_lev_ratio(100) -> {2985, 919, 2387};
get_teacher_lev_ratio(101) -> {3014, 919, 2410};
get_teacher_lev_ratio(102) -> {3044, 919, 2434};
get_teacher_lev_ratio(103) -> {3074, 919, 2458};
get_teacher_lev_ratio(104) -> {3104, 919, 2482};
get_teacher_lev_ratio(105) -> {3135, 919, 2506};
get_teacher_lev_ratio(106) -> {3166, 919, 2531};
get_teacher_lev_ratio(107) -> {3197, 919, 2556};
get_teacher_lev_ratio(108) -> {3228, 919, 2581};
get_teacher_lev_ratio(109) -> {3260, 919, 2606};
get_teacher_lev_ratio(110) -> {3292, 919, 2632};
get_teacher_lev_ratio(111) -> {3324, 919, 2658};
get_teacher_lev_ratio(112) -> {3357, 919, 2684};
get_teacher_lev_ratio(113) -> {3390, 919, 2710};
get_teacher_lev_ratio(114) -> {3423, 919, 2737};
get_teacher_lev_ratio(115) -> {3457, 919, 2764};
get_teacher_lev_ratio(116) -> {3491, 919, 2791};
get_teacher_lev_ratio(117) -> {3525, 919, 2818};
get_teacher_lev_ratio(118) -> {3560, 919, 2846};
get_teacher_lev_ratio(119) -> {3595, 919, 2874};
get_teacher_lev_ratio(120) -> {3630, 919, 2902};
get_teacher_lev_ratio(121) -> {3666, 919, 2931};
get_teacher_lev_ratio(122) -> {3702, 919, 2960};
get_teacher_lev_ratio(123) -> {3739, 919, 2989};
get_teacher_lev_ratio(124) -> {3776, 919, 3018};
get_teacher_lev_ratio(125) -> {3813, 919, 3048};
get_teacher_lev_ratio(126) -> {3851, 919, 3078};
get_teacher_lev_ratio(127) -> {3889, 919, 3108};
get_teacher_lev_ratio(128) -> {3927, 919, 3139};
get_teacher_lev_ratio(129) -> {3966, 919, 3170};
get_teacher_lev_ratio(130) -> {4005, 919, 3201};
get_teacher_lev_ratio(131) -> {4045, 919, 3233};
get_teacher_lev_ratio(132) -> {4085, 919, 3265};
get_teacher_lev_ratio(133) -> {4125, 919, 3297};
get_teacher_lev_ratio(134) -> {4166, 919, 3329};
get_teacher_lev_ratio(135) -> {4207, 919, 3362};
get_teacher_lev_ratio(136) -> {4249, 919, 3395};
get_teacher_lev_ratio(_Lev) -> false.

get_student_lev_ratio(1) -> {2000, 880, 1600};
get_student_lev_ratio(2) -> {2000, 880, 1600};
get_student_lev_ratio(3) -> {2000, 881, 1600};
get_student_lev_ratio(4) -> {2000, 881, 1600};
get_student_lev_ratio(5) -> {2000, 882, 1600};
get_student_lev_ratio(6) -> {2000, 882, 1600};
get_student_lev_ratio(7) -> {2000, 882, 1600};
get_student_lev_ratio(8) -> {2000, 883, 1600};
get_student_lev_ratio(9) -> {2000, 883, 1600};
get_student_lev_ratio(10) -> {2000, 884, 1600};
get_student_lev_ratio(11) -> {2000, 884, 1600};
get_student_lev_ratio(12) -> {2000, 884, 1600};
get_student_lev_ratio(13) -> {2000, 885, 1600};
get_student_lev_ratio(14) -> {2000, 885, 1600};
get_student_lev_ratio(15) -> {2000, 886, 1600};
get_student_lev_ratio(16) -> {2000, 886, 1600};
get_student_lev_ratio(17) -> {2000, 886, 1600};
get_student_lev_ratio(18) -> {2000, 887, 1600};
get_student_lev_ratio(19) -> {2000, 887, 1600};
get_student_lev_ratio(20) -> {2000, 888, 1600};
get_student_lev_ratio(21) -> {2000, 888, 1600};
get_student_lev_ratio(22) -> {2000, 888, 1600};
get_student_lev_ratio(23) -> {2000, 889, 1600};
get_student_lev_ratio(24) -> {2000, 889, 1600};
get_student_lev_ratio(25) -> {2186, 890, 1748};
get_student_lev_ratio(26) -> {2186, 890, 1748};
get_student_lev_ratio(27) -> {2186, 890, 1748};
get_student_lev_ratio(28) -> {2186, 891, 1748};
get_student_lev_ratio(29) -> {2186, 891, 1748};
get_student_lev_ratio(30) -> {2462, 892, 1968};
get_student_lev_ratio(31) -> {2462, 892, 1968};
get_student_lev_ratio(32) -> {2462, 892, 1968};
get_student_lev_ratio(33) -> {2462, 893, 1968};
get_student_lev_ratio(34) -> {2462, 893, 1968};
get_student_lev_ratio(35) -> {2658, 894, 2126};
get_student_lev_ratio(36) -> {2658, 894, 2126};
get_student_lev_ratio(37) -> {2658, 894, 2126};
get_student_lev_ratio(38) -> {2658, 895, 2126};
get_student_lev_ratio(39) -> {2658, 895, 2126};
get_student_lev_ratio(40) -> {2940, 896, 2352};
get_student_lev_ratio(41) -> {2940, 896, 2352};
get_student_lev_ratio(42) -> {2940, 896, 2352};
get_student_lev_ratio(43) -> {2940, 897, 2352};
get_student_lev_ratio(44) -> {2940, 897, 2352};
get_student_lev_ratio(45) -> {3146, 898, 2516};
get_student_lev_ratio(46) -> {3146, 898, 2516};
get_student_lev_ratio(47) -> {3146, 898, 2516};
get_student_lev_ratio(48) -> {3146, 899, 2516};
get_student_lev_ratio(49) -> {3146, 899, 2516};
get_student_lev_ratio(50) -> {3352, 900, 2680};
get_student_lev_ratio(51) -> {3352, 900, 2680};
get_student_lev_ratio(52) -> {3352, 900, 2680};
get_student_lev_ratio(53) -> {3352, 901, 2680};
get_student_lev_ratio(54) -> {3352, 901, 2680};
get_student_lev_ratio(55) -> {3644, 902, 2914};
get_student_lev_ratio(56) -> {3644, 902, 2914};
get_student_lev_ratio(57) -> {3644, 902, 2914};
get_student_lev_ratio(58) -> {3644, 903, 2914};
get_student_lev_ratio(59) -> {3644, 903, 2914};
get_student_lev_ratio(60) -> {3948, 904, 3158};
get_student_lev_ratio(61) -> {3948, 904, 3158};
get_student_lev_ratio(62) -> {3948, 904, 3158};
get_student_lev_ratio(63) -> {3948, 905, 3158};
get_student_lev_ratio(64) -> {3948, 905, 3158};
get_student_lev_ratio(65) -> {4172, 906, 3336};
get_student_lev_ratio(66) -> {4172, 906, 3336};
get_student_lev_ratio(67) -> {4172, 906, 3336};
get_student_lev_ratio(68) -> {4172, 907, 3336};
get_student_lev_ratio(69) -> {4172, 907, 3336};
get_student_lev_ratio(70) -> {4396, 908, 3516};
get_student_lev_ratio(71) -> {4396, 908, 3516};
get_student_lev_ratio(72) -> {4396, 908, 3516};
get_student_lev_ratio(73) -> {4396, 909, 3516};
get_student_lev_ratio(74) -> {4396, 909, 3516};
get_student_lev_ratio(75) -> {4630, 910, 3704};
get_student_lev_ratio(76) -> {4630, 910, 3704};
get_student_lev_ratio(77) -> {4630, 910, 3704};
get_student_lev_ratio(78) -> {4630, 911, 3704};
get_student_lev_ratio(79) -> {4630, 911, 3704};
get_student_lev_ratio(80) -> {5184, 912, 4146};
get_student_lev_ratio(81) -> {5184, 912, 4146};
get_student_lev_ratio(82) -> {5184, 912, 4146};
get_student_lev_ratio(83) -> {5184, 913, 4146};
get_student_lev_ratio(84) -> {5184, 913, 4146};
get_student_lev_ratio(85) -> {5418, 914, 4334};
get_student_lev_ratio(86) -> {5418, 914, 4334};
get_student_lev_ratio(87) -> {5418, 914, 4334};
get_student_lev_ratio(88) -> {5418, 915, 4334};
get_student_lev_ratio(89) -> {5418, 915, 4334};
get_student_lev_ratio(90) -> {5670, 916, 4536};
get_student_lev_ratio(91) -> {5670, 916, 4536};
get_student_lev_ratio(92) -> {5670, 916, 4536};
get_student_lev_ratio(93) -> {5670, 917, 4536};
get_student_lev_ratio(94) -> {5670, 917, 4536};
get_student_lev_ratio(95) -> {5912, 918, 4728};
get_student_lev_ratio(96) -> {5912, 918, 4728};
get_student_lev_ratio(97) -> {5912, 918, 4728};
get_student_lev_ratio(98) -> {5912, 919, 4728};
get_student_lev_ratio(99) -> {5912, 919, 4728};
get_student_lev_ratio(100) -> {5971, 919, 4775};
get_student_lev_ratio(101) -> {6030, 919, 4822};
get_student_lev_ratio(102) -> {6090, 919, 4870};
get_student_lev_ratio(103) -> {6150, 919, 4918};
get_student_lev_ratio(104) -> {6211, 919, 4967};
get_student_lev_ratio(105) -> {6273, 919, 5016};
get_student_lev_ratio(106) -> {6335, 919, 5066};
get_student_lev_ratio(107) -> {6398, 919, 5116};
get_student_lev_ratio(108) -> {6461, 919, 5167};
get_student_lev_ratio(109) -> {6525, 919, 5218};
get_student_lev_ratio(110) -> {6590, 919, 5270};
get_student_lev_ratio(111) -> {6655, 919, 5322};
get_student_lev_ratio(112) -> {6721, 919, 5375};
get_student_lev_ratio(113) -> {6788, 919, 5428};
get_student_lev_ratio(114) -> {6855, 919, 5482};
get_student_lev_ratio(115) -> {6923, 919, 5536};
get_student_lev_ratio(116) -> {6992, 919, 5591};
get_student_lev_ratio(117) -> {7061, 919, 5646};
get_student_lev_ratio(118) -> {7131, 919, 5702};
get_student_lev_ratio(119) -> {7202, 919, 5759};
get_student_lev_ratio(120) -> {7274, 919, 5816};
get_student_lev_ratio(121) -> {7346, 919, 5873};
get_student_lev_ratio(122) -> {7418, 919, 5930};
get_student_lev_ratio(123) -> {7490, 919, 5987};
get_student_lev_ratio(124) -> {7562, 919, 6044};
get_student_lev_ratio(125) -> {7634, 919, 6101};
get_student_lev_ratio(126) -> {7706, 919, 6158};
get_student_lev_ratio(127) -> {7778, 919, 6215};
get_student_lev_ratio(128) -> {7850, 919, 6272};
get_student_lev_ratio(129) -> {7922, 919, 6329};
get_student_lev_ratio(130) -> {7994, 919, 6386};
get_student_lev_ratio(_Lev) -> false.

get_reward(1) ->
    #quest_teacher_reward_data{round = 1, exp_ratio = 1200,
                               coin_ratio = 1050, pet_exp_ratio = 1200,
                               teacher_score = 2};
get_reward(2) ->
    #quest_teacher_reward_data{round = 2, exp_ratio = 1400,
                               coin_ratio = 1150, pet_exp_ratio = 1400,
                               teacher_score = 2};
get_reward(3) ->
    #quest_teacher_reward_data{round = 3, exp_ratio = 1700,
                               coin_ratio = 1250, pet_exp_ratio = 1700,
                               teacher_score = 2};
get_reward(4) ->
    #quest_teacher_reward_data{round = 4, exp_ratio = 2000,
                               coin_ratio = 1350, pet_exp_ratio = 2000,
                               teacher_score = 2};
get_reward(5) ->
    #quest_teacher_reward_data{round = 5, exp_ratio = 2300,
                               coin_ratio = 1450, pet_exp_ratio = 2300,
                               rand_items = [{22588, 1, 1000}], item_pcnt = 100,
                               teacher_score = 5};
get_reward(_QuestId) -> false.

