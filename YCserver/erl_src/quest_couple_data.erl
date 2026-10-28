-file("src/data/quest_couple_data.erl", 1).

-module(quest_couple_data).

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

-file("src/data/quest_couple_data.erl", 14).

-file("inc/quest_couple.hrl", 1).

-record(quest_couple_state,
        {question_next_mid = 1,
         reset_timer,
         platform = "",
         zone_id = 0}).

-record(quest_couple_args,
        {quest_id = 0,
         type = 0,
         sec_type = 0,
         round = 0,
         partner_id,
         partner_pid,
         partner_name = "",
         robot_id,
         dyn_ext_data = [],
         rand_pos = []}).

-record(quest_couple_rand_data,
        {round = 0,
         quest_id = 0 :: pos_integer(),
         type = 0,
         sec_type = 0,
         weight :: undefined | non_neg_integer()}).

-record(quest_couple_question,
        {mid = 0,
         ver = 1,
         sid = 0,
         qid = 0,
         start_time = 0,
         male_id,
         male_pid,
         male_info = #{},
         female_id,
         female_pid,
         female_info = #{},
         opts = [],
         answer_list = [],
         agreed = [],
         questions = [],
         ext_data = #{}}).

-record(quest_couple_answer,
        {sid = 0,
         qid = 0,
         opts = [],
         result = 0,
         draw_list = [],
         ext_data = []}).

-record(quest_couple_reward_data,
        {round = 0,
         exp_ratio = 0,
         coin_ratio = 0,
         pet_exp_ratio = 0,
         intimacy = 0,
         love = 0,
         rand_items = [],
         item_pcnt = 0}).

-file("src/data/quest_couple_data.erl", 15).

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

-file("src/data/quest_couple_data.erl", 16).

-export([get_quest_rand_list/1,
         get_reward/1,
         question_reward/1,
         get_lev_ratio/1]).

get_quest_rand_list(1) ->
    [#quest_couple_rand_data{round = 1, quest_id = 34000,
                             type = 2, sec_type = 1, weight = 250},
     #quest_couple_rand_data{round = 1, quest_id = 34100,
                             type = 1, sec_type = 0, weight = 100},
     #quest_couple_rand_data{round = 1, quest_id = 34101,
                             type = 1, sec_type = 0, weight = 100},
     #quest_couple_rand_data{round = 1, quest_id = 34102,
                             type = 1, sec_type = 0, weight = 100},
     #quest_couple_rand_data{round = 1, quest_id = 34103,
                             type = 1, sec_type = 0, weight = 100},
     #quest_couple_rand_data{round = 1, quest_id = 34104,
                             type = 1, sec_type = 0, weight = 100},
     #quest_couple_rand_data{round = 1, quest_id = 34010,
                             type = 2, sec_type = 2, weight = 250}];
get_quest_rand_list(2) ->
    [#quest_couple_rand_data{round = 2, quest_id = 34030,
                             type = 3, sec_type = 0, weight = 500}];
get_quest_rand_list(3) ->
    [#quest_couple_rand_data{round = 3, quest_id = 34001,
                             type = 2, sec_type = 1, weight = 150},
     #quest_couple_rand_data{round = 3, quest_id = 34020,
                             type = 2, sec_type = 3, weight = 350},
     #quest_couple_rand_data{round = 3, quest_id = 34103,
                             type = 1, sec_type = 0, weight = 100},
     #quest_couple_rand_data{round = 3, quest_id = 34104,
                             type = 1, sec_type = 0, weight = 100},
     #quest_couple_rand_data{round = 3, quest_id = 34106,
                             type = 1, sec_type = 0, weight = 100},
     #quest_couple_rand_data{round = 3, quest_id = 34107,
                             type = 1, sec_type = 0, weight = 100},
     #quest_couple_rand_data{round = 3, quest_id = 34109,
                             type = 1, sec_type = 0, weight = 100}];
get_quest_rand_list(4) ->
    [#quest_couple_rand_data{round = 4, quest_id = 34000,
                             type = 2, sec_type = 1, weight = 300},
     #quest_couple_rand_data{round = 4, quest_id = 34010,
                             type = 2, sec_type = 2, weight = 200},
     #quest_couple_rand_data{round = 4, quest_id = 34106,
                             type = 1, sec_type = 0, weight = 125},
     #quest_couple_rand_data{round = 4, quest_id = 34107,
                             type = 1, sec_type = 0, weight = 125},
     #quest_couple_rand_data{round = 4, quest_id = 34108,
                             type = 1, sec_type = 0, weight = 125},
     #quest_couple_rand_data{round = 4, quest_id = 34109,
                             type = 1, sec_type = 0, weight = 125}];
get_quest_rand_list(5) ->
    [#quest_couple_rand_data{round = 5, quest_id = 34030,
                             type = 3, sec_type = 0, weight = 1000}];
get_quest_rand_list(6) ->
    [#quest_couple_rand_data{round = 6, quest_id = 34001,
                             type = 2, sec_type = 1, weight = 200},
     #quest_couple_rand_data{round = 6, quest_id = 34010,
                             type = 2, sec_type = 2, weight = 300},
     #quest_couple_rand_data{round = 6, quest_id = 34106,
                             type = 1, sec_type = 0, weight = 125},
     #quest_couple_rand_data{round = 6, quest_id = 34107,
                             type = 1, sec_type = 0, weight = 125},
     #quest_couple_rand_data{round = 6, quest_id = 34109,
                             type = 1, sec_type = 0, weight = 125},
     #quest_couple_rand_data{round = 6, quest_id = 34110,
                             type = 1, sec_type = 0, weight = 125}];
get_quest_rand_list(7) ->
    [#quest_couple_rand_data{round = 7, quest_id = 34030,
                             type = 3, sec_type = 0, weight = 500},
     #quest_couple_rand_data{round = 7, quest_id = 34100,
                             type = 1, sec_type = 0, weight = 100},
     #quest_couple_rand_data{round = 7, quest_id = 34103,
                             type = 1, sec_type = 0, weight = 100},
     #quest_couple_rand_data{round = 7, quest_id = 34104,
                             type = 1, sec_type = 0, weight = 100},
     #quest_couple_rand_data{round = 7, quest_id = 34105,
                             type = 1, sec_type = 0, weight = 100},
     #quest_couple_rand_data{round = 7, quest_id = 34108,
                             type = 1, sec_type = 0, weight = 100}];
get_quest_rand_list(8) ->
    [#quest_couple_rand_data{round = 8, quest_id = 34000,
                             type = 2, sec_type = 1, weight = 250},
     #quest_couple_rand_data{round = 8, quest_id = 34001,
                             type = 2, sec_type = 1, weight = 250},
     #quest_couple_rand_data{round = 8, quest_id = 34010,
                             type = 2, sec_type = 2, weight = 250},
     #quest_couple_rand_data{round = 8, quest_id = 34020,
                             type = 2, sec_type = 3, weight = 250}];
get_quest_rand_list(9) ->
    [#quest_couple_rand_data{round = 9, quest_id = 34030,
                             type = 3, sec_type = 0, weight = 1000}];
get_quest_rand_list(10) ->
    [#quest_couple_rand_data{round = 10, quest_id = 34010,
                             type = 2, sec_type = 2, weight = 350},
     #quest_couple_rand_data{round = 10, quest_id = 34020,
                             type = 2, sec_type = 3, weight = 350},
     #quest_couple_rand_data{round = 10, quest_id = 34107,
                             type = 1, sec_type = 0, weight = 100},
     #quest_couple_rand_data{round = 10, quest_id = 34108,
                             type = 1, sec_type = 0, weight = 100},
     #quest_couple_rand_data{round = 10, quest_id = 34109,
                             type = 1, sec_type = 0, weight = 100}];
get_quest_rand_list(_Round) -> [].

get_reward(1) ->
    #quest_couple_reward_data{round = 1, exp_ratio = 1000,
                              coin_ratio = 1000, pet_exp_ratio = 1000,
                              intimacy = 2};
get_reward(2) ->
    #quest_couple_reward_data{round = 2, exp_ratio = 1200,
                              coin_ratio = 1050, pet_exp_ratio = 1200,
                              intimacy = 2};
get_reward(3) ->
    #quest_couple_reward_data{round = 3, exp_ratio = 1300,
                              coin_ratio = 1100, pet_exp_ratio = 1300,
                              intimacy = 2};
get_reward(4) ->
    #quest_couple_reward_data{round = 4, exp_ratio = 1400,
                              coin_ratio = 1150, pet_exp_ratio = 1400,
                              intimacy = 2};
get_reward(5) ->
    #quest_couple_reward_data{round = 5, exp_ratio = 1500,
                              coin_ratio = 1200, pet_exp_ratio = 1500,
                              intimacy = 3};
get_reward(6) ->
    #quest_couple_reward_data{round = 6, exp_ratio = 1700,
                              coin_ratio = 1250, pet_exp_ratio = 1700,
                              intimacy = 3};
get_reward(7) ->
    #quest_couple_reward_data{round = 7, exp_ratio = 1850,
                              coin_ratio = 1300, pet_exp_ratio = 1850,
                              intimacy = 3};
get_reward(8) ->
    #quest_couple_reward_data{round = 8, exp_ratio = 2000,
                              coin_ratio = 1350, pet_exp_ratio = 2000,
                              intimacy = 3};
get_reward(9) ->
    #quest_couple_reward_data{round = 9, exp_ratio = 2150,
                              coin_ratio = 1400, pet_exp_ratio = 2150,
                              intimacy = 3};
get_reward(10) ->
    #quest_couple_reward_data{round = 10, exp_ratio = 2300,
                              coin_ratio = 1450, pet_exp_ratio = 2300,
                              intimacy = 10, rand_items = [{22545, 1, 400}],
                              item_pcnt = 100};
get_reward(_QuestId) -> false.

question_reward(1) ->
    {1,
     [#gain{label = coin, val = 8000}],
     [#gain{label = coin, val = 3000}],
     5};
question_reward(2) ->
    {2,
     [#gain{label = coin, val = 8000}],
     [#gain{label = coin, val = 3000}],
     5};
question_reward(3) ->
    {3,
     [#gain{label = coin, val = 8000}],
     [#gain{label = coin, val = 3000}],
     5};
question_reward(_Sid) -> false.

get_lev_ratio(1) -> {1000, 880, 800};
get_lev_ratio(2) -> {1000, 880, 800};
get_lev_ratio(3) -> {1000, 881, 800};
get_lev_ratio(4) -> {1000, 881, 800};
get_lev_ratio(5) -> {1000, 882, 800};
get_lev_ratio(6) -> {1000, 882, 800};
get_lev_ratio(7) -> {1000, 882, 800};
get_lev_ratio(8) -> {1000, 883, 800};
get_lev_ratio(9) -> {1000, 883, 800};
get_lev_ratio(10) -> {1000, 884, 800};
get_lev_ratio(11) -> {1000, 884, 800};
get_lev_ratio(12) -> {1000, 884, 800};
get_lev_ratio(13) -> {1000, 885, 800};
get_lev_ratio(14) -> {1000, 885, 800};
get_lev_ratio(15) -> {1000, 886, 800};
get_lev_ratio(16) -> {1000, 886, 800};
get_lev_ratio(17) -> {1000, 886, 800};
get_lev_ratio(18) -> {1000, 887, 800};
get_lev_ratio(19) -> {1000, 887, 800};
get_lev_ratio(20) -> {1000, 888, 800};
get_lev_ratio(21) -> {1000, 888, 800};
get_lev_ratio(22) -> {1000, 888, 800};
get_lev_ratio(23) -> {1000, 889, 800};
get_lev_ratio(24) -> {1000, 889, 800};
get_lev_ratio(25) -> {1093, 890, 874};
get_lev_ratio(26) -> {1093, 890, 874};
get_lev_ratio(27) -> {1093, 890, 874};
get_lev_ratio(28) -> {1093, 891, 874};
get_lev_ratio(29) -> {1093, 891, 874};
get_lev_ratio(30) -> {1231, 892, 984};
get_lev_ratio(31) -> {1231, 892, 984};
get_lev_ratio(32) -> {1231, 892, 984};
get_lev_ratio(33) -> {1231, 893, 984};
get_lev_ratio(34) -> {1231, 893, 984};
get_lev_ratio(35) -> {1329, 894, 1063};
get_lev_ratio(36) -> {1329, 894, 1063};
get_lev_ratio(37) -> {1329, 894, 1063};
get_lev_ratio(38) -> {1329, 895, 1063};
get_lev_ratio(39) -> {1329, 895, 1063};
get_lev_ratio(40) -> {1470, 896, 1176};
get_lev_ratio(41) -> {1470, 896, 1176};
get_lev_ratio(42) -> {1470, 896, 1176};
get_lev_ratio(43) -> {1470, 897, 1176};
get_lev_ratio(44) -> {1470, 897, 1176};
get_lev_ratio(45) -> {1573, 898, 1258};
get_lev_ratio(46) -> {1573, 898, 1258};
get_lev_ratio(47) -> {1573, 898, 1258};
get_lev_ratio(48) -> {1573, 899, 1258};
get_lev_ratio(49) -> {1573, 899, 1258};
get_lev_ratio(50) -> {1676, 900, 1340};
get_lev_ratio(51) -> {1676, 900, 1340};
get_lev_ratio(52) -> {1676, 900, 1340};
get_lev_ratio(53) -> {1676, 901, 1340};
get_lev_ratio(54) -> {1676, 901, 1340};
get_lev_ratio(55) -> {1822, 902, 1457};
get_lev_ratio(56) -> {1822, 902, 1457};
get_lev_ratio(57) -> {1822, 902, 1457};
get_lev_ratio(58) -> {1822, 903, 1457};
get_lev_ratio(59) -> {1822, 903, 1457};
get_lev_ratio(60) -> {1974, 904, 1579};
get_lev_ratio(61) -> {1974, 904, 1579};
get_lev_ratio(62) -> {1974, 904, 1579};
get_lev_ratio(63) -> {1974, 905, 1579};
get_lev_ratio(64) -> {1974, 905, 1579};
get_lev_ratio(65) -> {2086, 906, 1668};
get_lev_ratio(66) -> {2086, 906, 1668};
get_lev_ratio(67) -> {2086, 906, 1668};
get_lev_ratio(68) -> {2086, 907, 1668};
get_lev_ratio(69) -> {2086, 907, 1668};
get_lev_ratio(70) -> {2198, 908, 1758};
get_lev_ratio(71) -> {2198, 908, 1758};
get_lev_ratio(72) -> {2198, 908, 1758};
get_lev_ratio(73) -> {2198, 909, 1758};
get_lev_ratio(74) -> {2198, 909, 1758};
get_lev_ratio(75) -> {2315, 910, 1852};
get_lev_ratio(76) -> {2315, 910, 1852};
get_lev_ratio(77) -> {2315, 910, 1852};
get_lev_ratio(78) -> {2315, 911, 1852};
get_lev_ratio(79) -> {2315, 911, 1852};
get_lev_ratio(80) -> {2592, 912, 2073};
get_lev_ratio(81) -> {2592, 912, 2073};
get_lev_ratio(82) -> {2592, 912, 2073};
get_lev_ratio(83) -> {2592, 913, 2073};
get_lev_ratio(84) -> {2592, 913, 2073};
get_lev_ratio(85) -> {2709, 914, 2167};
get_lev_ratio(86) -> {2709, 914, 2167};
get_lev_ratio(87) -> {2709, 914, 2167};
get_lev_ratio(88) -> {2709, 915, 2167};
get_lev_ratio(89) -> {2709, 915, 2167};
get_lev_ratio(90) -> {2835, 916, 2268};
get_lev_ratio(91) -> {2835, 916, 2268};
get_lev_ratio(92) -> {2835, 916, 2268};
get_lev_ratio(93) -> {2835, 917, 2268};
get_lev_ratio(94) -> {2835, 917, 2268};
get_lev_ratio(95) -> {2956, 918, 2364};
get_lev_ratio(96) -> {2956, 918, 2364};
get_lev_ratio(97) -> {2956, 918, 2364};
get_lev_ratio(98) -> {2956, 919, 2364};
get_lev_ratio(99) -> {2956, 919, 2364};
get_lev_ratio(100) -> {3045, 919, 2435};
get_lev_ratio(101) -> {3045, 919, 2435};
get_lev_ratio(102) -> {3045, 919, 2435};
get_lev_ratio(103) -> {3045, 919, 2435};
get_lev_ratio(104) -> {3045, 919, 2435};
get_lev_ratio(105) -> {3200, 919, 2559};
get_lev_ratio(106) -> {3200, 919, 2559};
get_lev_ratio(107) -> {3200, 919, 2559};
get_lev_ratio(108) -> {3200, 919, 2559};
get_lev_ratio(109) -> {3200, 919, 2559};
get_lev_ratio(110) -> {3363, 919, 2689};
get_lev_ratio(111) -> {3363, 919, 2689};
get_lev_ratio(112) -> {3363, 919, 2689};
get_lev_ratio(113) -> {3363, 919, 2689};
get_lev_ratio(114) -> {3363, 919, 2689};
get_lev_ratio(115) -> {3534, 919, 2826};
get_lev_ratio(116) -> {3534, 919, 2826};
get_lev_ratio(117) -> {3534, 919, 2826};
get_lev_ratio(118) -> {3534, 919, 2826};
get_lev_ratio(119) -> {3534, 919, 2826};
get_lev_ratio(120) -> {3534, 919, 2826};
get_lev_ratio(121) -> {3534, 919, 2826};
get_lev_ratio(122) -> {3534, 919, 2826};
get_lev_ratio(123) -> {3534, 919, 2826};
get_lev_ratio(124) -> {3534, 919, 2826};
get_lev_ratio(125) -> {3534, 919, 2826};
get_lev_ratio(126) -> {3534, 919, 2826};
get_lev_ratio(127) -> {3534, 919, 2826};
get_lev_ratio(128) -> {3534, 919, 2826};
get_lev_ratio(129) -> {3534, 919, 2826};
get_lev_ratio(130) -> {3534, 919, 2826};
get_lev_ratio(131) -> {3534, 919, 2826};
get_lev_ratio(132) -> {3534, 919, 2826};
get_lev_ratio(133) -> {3534, 919, 2826};
get_lev_ratio(134) -> {3534, 919, 2826};
get_lev_ratio(135) -> {3534, 919, 2826};
get_lev_ratio(136) -> {3534, 919, 2826};
get_lev_ratio(_Lev) -> false.

