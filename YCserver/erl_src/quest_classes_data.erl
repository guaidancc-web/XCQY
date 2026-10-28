-file("src/data/quest_classes_data.erl", 1).

-module(quest_classes_data).

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

-file("src/data/quest_classes_data.erl", 14).

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

-file("src/data/quest_classes_data.erl", 15).

-file("inc/quest_classes.hrl", 1).

-record(quest_classes_rand_data,
        {id, type, weight, max, in_round = []}).

-record(quest_classes_patrol_data,
        {id,
         map_base_id,
         unit_list = [],
         weight = 0,
         pcnt = 0,
         min_move_step = 0,
         max_move_step = 0}).

-record(quest_classes_item_data,
        {id = 0, role_lev = 0, weight = 0, type = 0}).

-file("src/data/quest_classes_data.erl", 16).

-export([get_lev_reward_ratio/1,
         get_patrol/1,
         get_task_list/0,
         get_task_seq_ratio/1,
         get_task_stats_reward/2,
         get_classify/0,
         get_item_list/0,
         get_find_type_quest_id/1,
         get_find_type/1,
         get_quest_type/1]).

get_lev_reward_ratio(1) -> {1000, 1100};
get_lev_reward_ratio(2) -> {1000, 1100};
get_lev_reward_ratio(3) -> {1000, 1100};
get_lev_reward_ratio(4) -> {1000, 1100};
get_lev_reward_ratio(5) -> {1000, 1100};
get_lev_reward_ratio(6) -> {1000, 1100};
get_lev_reward_ratio(7) -> {1000, 1100};
get_lev_reward_ratio(8) -> {1000, 1100};
get_lev_reward_ratio(9) -> {1000, 1100};
get_lev_reward_ratio(10) -> {1000, 1100};
get_lev_reward_ratio(11) -> {1000, 1100};
get_lev_reward_ratio(12) -> {1000, 1100};
get_lev_reward_ratio(13) -> {1000, 1100};
get_lev_reward_ratio(14) -> {1000, 1100};
get_lev_reward_ratio(15) -> {1160, 1100};
get_lev_reward_ratio(16) -> {1000, 1100};
get_lev_reward_ratio(17) -> {1000, 1100};
get_lev_reward_ratio(18) -> {1000, 1100};
get_lev_reward_ratio(19) -> {1000, 1100};
get_lev_reward_ratio(20) -> {1000, 1100};
get_lev_reward_ratio(21) -> {1000, 1100};
get_lev_reward_ratio(22) -> {1000, 1100};
get_lev_reward_ratio(23) -> {1000, 1100};
get_lev_reward_ratio(24) -> {1000, 1100};
get_lev_reward_ratio(25) -> {1000, 1100};
get_lev_reward_ratio(26) -> {1000, 1100};
get_lev_reward_ratio(27) -> {1000, 1100};
get_lev_reward_ratio(28) -> {1000, 1100};
get_lev_reward_ratio(29) -> {1000, 1100};
get_lev_reward_ratio(30) -> {1231, 1100};
get_lev_reward_ratio(31) -> {1231, 1100};
get_lev_reward_ratio(32) -> {1231, 1100};
get_lev_reward_ratio(33) -> {1231, 1100};
get_lev_reward_ratio(34) -> {1231, 1100};
get_lev_reward_ratio(35) -> {1329, 1100};
get_lev_reward_ratio(36) -> {1329, 1100};
get_lev_reward_ratio(37) -> {1329, 1100};
get_lev_reward_ratio(38) -> {1329, 1100};
get_lev_reward_ratio(39) -> {1329, 1100};
get_lev_reward_ratio(40) -> {1470, 1100};
get_lev_reward_ratio(41) -> {1470, 1100};
get_lev_reward_ratio(42) -> {1470, 1100};
get_lev_reward_ratio(43) -> {1470, 1100};
get_lev_reward_ratio(44) -> {1470, 1100};
get_lev_reward_ratio(45) -> {1573, 1100};
get_lev_reward_ratio(46) -> {1573, 1100};
get_lev_reward_ratio(47) -> {1573, 1100};
get_lev_reward_ratio(48) -> {1573, 1100};
get_lev_reward_ratio(49) -> {1573, 1100};
get_lev_reward_ratio(50) -> {1676, 1100};
get_lev_reward_ratio(51) -> {1676, 1100};
get_lev_reward_ratio(52) -> {1676, 1100};
get_lev_reward_ratio(53) -> {1676, 1100};
get_lev_reward_ratio(54) -> {1676, 1100};
get_lev_reward_ratio(55) -> {1822, 1100};
get_lev_reward_ratio(56) -> {1822, 1100};
get_lev_reward_ratio(57) -> {1822, 1100};
get_lev_reward_ratio(58) -> {1822, 1100};
get_lev_reward_ratio(59) -> {1822, 1100};
get_lev_reward_ratio(60) -> {1974, 1100};
get_lev_reward_ratio(61) -> {1974, 1100};
get_lev_reward_ratio(62) -> {1974, 1100};
get_lev_reward_ratio(63) -> {1835, 1100};
get_lev_reward_ratio(64) -> {1835, 1100};
get_lev_reward_ratio(65) -> {1939, 1100};
get_lev_reward_ratio(66) -> {1939, 1100};
get_lev_reward_ratio(67) -> {1939, 1100};
get_lev_reward_ratio(68) -> {1981, 1100};
get_lev_reward_ratio(69) -> {1981, 1100};
get_lev_reward_ratio(70) -> {2088, 1100};
get_lev_reward_ratio(71) -> {2088, 1100};
get_lev_reward_ratio(72) -> {2088, 1100};
get_lev_reward_ratio(73) -> {2198, 1100};
get_lev_reward_ratio(74) -> {2198, 1100};
get_lev_reward_ratio(75) -> {2315, 1100};
get_lev_reward_ratio(76) -> {2315, 1100};
get_lev_reward_ratio(77) -> {2315, 1100};
get_lev_reward_ratio(78) -> {2199, 1100};
get_lev_reward_ratio(79) -> {2199, 1100};
get_lev_reward_ratio(80) -> {2462, 1080};
get_lev_reward_ratio(81) -> {2462, 1080};
get_lev_reward_ratio(82) -> {2462, 1080};
get_lev_reward_ratio(83) -> {2540, 1080};
get_lev_reward_ratio(84) -> {2540, 1080};
get_lev_reward_ratio(85) -> {2654, 1080};
get_lev_reward_ratio(86) -> {2654, 1080};
get_lev_reward_ratio(87) -> {2654, 1080};
get_lev_reward_ratio(88) -> {2709, 1080};
get_lev_reward_ratio(89) -> {2709, 1080};
get_lev_reward_ratio(90) -> {2835, 1080};
get_lev_reward_ratio(91) -> {2835, 1080};
get_lev_reward_ratio(92) -> {2835, 1080};
get_lev_reward_ratio(93) -> {2749, 1080};
get_lev_reward_ratio(94) -> {2749, 1080};
get_lev_reward_ratio(95) -> {2867, 1080};
get_lev_reward_ratio(96) -> {2867, 1080};
get_lev_reward_ratio(97) -> {2694, 1080};
get_lev_reward_ratio(98) -> {2956, 1080};
get_lev_reward_ratio(99) -> {2956, 1080};
get_lev_reward_ratio(100) -> {3044, 1080};
get_lev_reward_ratio(101) -> {3044, 1080};
get_lev_reward_ratio(102) -> {3044, 1080};
get_lev_reward_ratio(103) -> {3044, 1080};
get_lev_reward_ratio(104) -> {3044, 1080};
get_lev_reward_ratio(105) -> {3197, 1080};
get_lev_reward_ratio(106) -> {3197, 1080};
get_lev_reward_ratio(107) -> {3197, 1080};
get_lev_reward_ratio(108) -> {3197, 1080};
get_lev_reward_ratio(109) -> {3197, 1080};
get_lev_reward_ratio(110) -> {3357, 1080};
get_lev_reward_ratio(111) -> {3357, 1080};
get_lev_reward_ratio(112) -> {3357, 1080};
get_lev_reward_ratio(113) -> {3357, 1080};
get_lev_reward_ratio(114) -> {3357, 1080};
get_lev_reward_ratio(115) -> {3525, 1080};
get_lev_reward_ratio(116) -> {3525, 1080};
get_lev_reward_ratio(117) -> {3525, 1080};
get_lev_reward_ratio(118) -> {3525, 1080};
get_lev_reward_ratio(119) -> {3525, 1080};
get_lev_reward_ratio(120) -> {3693, 1080};
get_lev_reward_ratio(121) -> {3693, 1080};
get_lev_reward_ratio(122) -> {3693, 1080};
get_lev_reward_ratio(123) -> {3693, 1080};
get_lev_reward_ratio(124) -> {3693, 1080};
get_lev_reward_ratio(125) -> {3861, 1080};
get_lev_reward_ratio(126) -> {3861, 1080};
get_lev_reward_ratio(127) -> {3861, 1080};
get_lev_reward_ratio(128) -> {3861, 1080};
get_lev_reward_ratio(129) -> {3861, 1080};
get_lev_reward_ratio(130) -> {4029, 1080};
get_lev_reward_ratio(131) -> {4029, 1080};
get_lev_reward_ratio(132) -> {4029, 1080};
get_lev_reward_ratio(133) -> {4029, 1080};
get_lev_reward_ratio(134) -> {4029, 1080};
get_lev_reward_ratio(135) -> {4029, 1080};
get_lev_reward_ratio(136) -> {4029, 1080};
get_lev_reward_ratio(_) -> {0, 0}.

get_patrol(20060) ->
    [#quest_classes_patrol_data{id = 20060,
                                map_base_id = 10001, unit_list = [{62000, 500}],
                                weight = 1000, pcnt = 900, min_move_step = 6,
                                max_move_step = 20}];
get_patrol(20061) ->
    [#quest_classes_patrol_data{id = 20061,
                                map_base_id = 10002,
                                unit_list = [{62001, 500}, {62002, 500}],
                                weight = 1000, pcnt = 900, min_move_step = 6,
                                max_move_step = 20}];
get_patrol(20062) ->
    [#quest_classes_patrol_data{id = 20062,
                                map_base_id = 10003,
                                unit_list = [{62002, 500}, {62003, 500}],
                                weight = 1000, pcnt = 900, min_move_step = 6,
                                max_move_step = 20}];
get_patrol(20063) ->
    [#quest_classes_patrol_data{id = 20063,
                                map_base_id = 10004,
                                unit_list = [{62003, 500}, {62004, 500}],
                                weight = 1000, pcnt = 900, min_move_step = 6,
                                max_move_step = 20}];
get_patrol(20064) ->
    [#quest_classes_patrol_data{id = 20064,
                                map_base_id = 10007, unit_list = [{62004, 500}],
                                weight = 1000, pcnt = 900, min_move_step = 6,
                                max_move_step = 20}];
get_patrol(20160) ->
    [#quest_classes_patrol_data{id = 20160,
                                map_base_id = 10001, unit_list = [{62000, 500}],
                                weight = 1000, pcnt = 900, min_move_step = 6,
                                max_move_step = 20}];
get_patrol(20161) ->
    [#quest_classes_patrol_data{id = 20161,
                                map_base_id = 10002,
                                unit_list = [{62001, 500}, {62002, 500}],
                                weight = 1000, pcnt = 900, min_move_step = 6,
                                max_move_step = 20}];
get_patrol(20162) ->
    [#quest_classes_patrol_data{id = 20162,
                                map_base_id = 10003,
                                unit_list = [{62002, 500}, {62003, 500}],
                                weight = 1000, pcnt = 900, min_move_step = 6,
                                max_move_step = 20}];
get_patrol(20163) ->
    [#quest_classes_patrol_data{id = 20163,
                                map_base_id = 10004,
                                unit_list = [{62003, 500}, {62004, 500}],
                                weight = 1000, pcnt = 900, min_move_step = 6,
                                max_move_step = 20}];
get_patrol(20164) ->
    [#quest_classes_patrol_data{id = 20164,
                                map_base_id = 10007, unit_list = [{62004, 500}],
                                weight = 1000, pcnt = 900, min_move_step = 6,
                                max_move_step = 20}];
get_patrol(20260) ->
    [#quest_classes_patrol_data{id = 20260,
                                map_base_id = 10001, unit_list = [{62000, 500}],
                                weight = 1000, pcnt = 900, min_move_step = 6,
                                max_move_step = 20}];
get_patrol(20261) ->
    [#quest_classes_patrol_data{id = 20261,
                                map_base_id = 10002,
                                unit_list = [{62001, 500}, {62002, 500}],
                                weight = 1000, pcnt = 900, min_move_step = 6,
                                max_move_step = 20}];
get_patrol(20262) ->
    [#quest_classes_patrol_data{id = 20262,
                                map_base_id = 10003,
                                unit_list = [{62002, 500}, {62003, 500}],
                                weight = 1000, pcnt = 900, min_move_step = 6,
                                max_move_step = 20}];
get_patrol(20263) ->
    [#quest_classes_patrol_data{id = 20263,
                                map_base_id = 10004,
                                unit_list = [{62003, 500}, {62004, 500}],
                                weight = 1000, pcnt = 900, min_move_step = 6,
                                max_move_step = 20}];
get_patrol(20264) ->
    [#quest_classes_patrol_data{id = 20264,
                                map_base_id = 10007, unit_list = [{62004, 500}],
                                weight = 1000, pcnt = 900, min_move_step = 6,
                                max_move_step = 20}];
get_patrol(20360) ->
    [#quest_classes_patrol_data{id = 20360,
                                map_base_id = 10001, unit_list = [{62000, 500}],
                                weight = 1000, pcnt = 900, min_move_step = 6,
                                max_move_step = 20}];
get_patrol(20361) ->
    [#quest_classes_patrol_data{id = 20361,
                                map_base_id = 10002,
                                unit_list = [{62001, 500}, {62002, 500}],
                                weight = 1000, pcnt = 900, min_move_step = 6,
                                max_move_step = 20}];
get_patrol(20362) ->
    [#quest_classes_patrol_data{id = 20362,
                                map_base_id = 10003,
                                unit_list = [{62002, 500}, {62003, 500}],
                                weight = 1000, pcnt = 900, min_move_step = 6,
                                max_move_step = 20}];
get_patrol(20363) ->
    [#quest_classes_patrol_data{id = 20363,
                                map_base_id = 10004,
                                unit_list = [{62003, 500}, {62004, 500}],
                                weight = 1000, pcnt = 900, min_move_step = 6,
                                max_move_step = 20}];
get_patrol(20364) ->
    [#quest_classes_patrol_data{id = 20364,
                                map_base_id = 10007, unit_list = [{62004, 500}],
                                weight = 1000, pcnt = 900, min_move_step = 6,
                                max_move_step = 20}];
get_patrol(20460) ->
    [#quest_classes_patrol_data{id = 20460,
                                map_base_id = 10001, unit_list = [{62000, 500}],
                                weight = 1000, pcnt = 900, min_move_step = 6,
                                max_move_step = 20}];
get_patrol(20461) ->
    [#quest_classes_patrol_data{id = 20461,
                                map_base_id = 10002,
                                unit_list = [{62001, 500}, {62002, 500}],
                                weight = 1000, pcnt = 900, min_move_step = 6,
                                max_move_step = 20}];
get_patrol(20462) ->
    [#quest_classes_patrol_data{id = 20462,
                                map_base_id = 10003,
                                unit_list = [{62002, 500}, {62003, 500}],
                                weight = 1000, pcnt = 900, min_move_step = 6,
                                max_move_step = 20}];
get_patrol(20463) ->
    [#quest_classes_patrol_data{id = 20463,
                                map_base_id = 10004,
                                unit_list = [{62003, 500}, {62004, 500}],
                                weight = 1000, pcnt = 900, min_move_step = 6,
                                max_move_step = 20}];
get_patrol(20464) ->
    [#quest_classes_patrol_data{id = 20464,
                                map_base_id = 10007, unit_list = [{62004, 500}],
                                weight = 1000, pcnt = 900, min_move_step = 6,
                                max_move_step = 20}];
get_patrol(20560) ->
    [#quest_classes_patrol_data{id = 20560,
                                map_base_id = 10001, unit_list = [{62000, 500}],
                                weight = 1000, pcnt = 900, min_move_step = 6,
                                max_move_step = 20}];
get_patrol(20561) ->
    [#quest_classes_patrol_data{id = 20561,
                                map_base_id = 10002,
                                unit_list = [{62001, 500}, {62002, 500}],
                                weight = 1000, pcnt = 900, min_move_step = 6,
                                max_move_step = 20}];
get_patrol(20562) ->
    [#quest_classes_patrol_data{id = 20562,
                                map_base_id = 10003,
                                unit_list = [{62002, 500}, {62003, 500}],
                                weight = 1000, pcnt = 900, min_move_step = 6,
                                max_move_step = 20}];
get_patrol(20563) ->
    [#quest_classes_patrol_data{id = 20563,
                                map_base_id = 10004,
                                unit_list = [{62003, 500}, {62004, 500}],
                                weight = 1000, pcnt = 900, min_move_step = 6,
                                max_move_step = 20}];
get_patrol(20564) ->
    [#quest_classes_patrol_data{id = 20564,
                                map_base_id = 10007, unit_list = [{62004, 500}],
                                weight = 1000, pcnt = 900, min_move_step = 6,
                                max_move_step = 20}];
get_patrol(20660) ->
    [#quest_classes_patrol_data{id = 20660,
                                map_base_id = 10001, unit_list = [{62000, 500}],
                                weight = 1000, pcnt = 900, min_move_step = 6,
                                max_move_step = 20}];
get_patrol(20661) ->
    [#quest_classes_patrol_data{id = 20661,
                                map_base_id = 10002,
                                unit_list = [{62001, 500}, {62002, 500}],
                                weight = 1000, pcnt = 900, min_move_step = 6,
                                max_move_step = 20}];
get_patrol(20662) ->
    [#quest_classes_patrol_data{id = 20662,
                                map_base_id = 10003,
                                unit_list = [{62002, 500}, {62003, 500}],
                                weight = 1000, pcnt = 900, min_move_step = 6,
                                max_move_step = 20}];
get_patrol(20663) ->
    [#quest_classes_patrol_data{id = 20663,
                                map_base_id = 10004,
                                unit_list = [{62003, 500}, {62004, 500}],
                                weight = 1000, pcnt = 900, min_move_step = 6,
                                max_move_step = 20}];
get_patrol(20664) ->
    [#quest_classes_patrol_data{id = 20664,
                                map_base_id = 10007, unit_list = [{62004, 500}],
                                weight = 1000, pcnt = 900, min_move_step = 6,
                                max_move_step = 20}];
get_patrol(_) -> [].

get_task_list() ->
    [#quest_classes_rand_data{id = 20000, type = 6,
                              weight = 100, in_round = [2, 4, 6, 8, 9, 10]},
     #quest_classes_rand_data{id = 20001, type = 6,
                              weight = 100, in_round = [2, 4, 6, 8, 9, 10]},
     #quest_classes_rand_data{id = 20003, type = 6,
                              weight = 100, in_round = [2, 4, 6, 8, 9, 10]},
     #quest_classes_rand_data{id = 20004, type = 6,
                              weight = 100, in_round = [2, 4, 6, 8, 9, 10]},
     #quest_classes_rand_data{id = 20005, type = 6,
                              weight = 100, in_round = [2, 4, 6, 8, 9, 10]},
     #quest_classes_rand_data{id = 20006, type = 6,
                              weight = 100, in_round = [2, 4, 6, 8, 9, 10]},
     #quest_classes_rand_data{id = 20007, type = 6,
                              weight = 100, in_round = [2, 4, 6, 8, 9, 10]},
     #quest_classes_rand_data{id = 20008, type = 6,
                              weight = 100, in_round = [2, 4, 6, 8, 9, 10]},
     #quest_classes_rand_data{id = 20021, type = 4,
                              weight = 100, in_round = [1, 5]},
     #quest_classes_rand_data{id = 20022, type = 4,
                              weight = 100, in_round = [1, 5]},
     #quest_classes_rand_data{id = 20023, type = 4,
                              weight = 100, in_round = [1, 5]},
     #quest_classes_rand_data{id = 20024, type = 4,
                              weight = 100, in_round = [1, 5]},
     #quest_classes_rand_data{id = 20025, type = 4,
                              weight = 100, in_round = [1, 5]},
     #quest_classes_rand_data{id = 20026, type = 4,
                              weight = 100, in_round = [1, 5]},
     #quest_classes_rand_data{id = 20027, type = 4,
                              weight = 100, in_round = [1, 5]},
     #quest_classes_rand_data{id = 20028, type = 4,
                              weight = 100, in_round = [1, 5]},
     #quest_classes_rand_data{id = 20029, type = 4,
                              weight = 100, in_round = [1, 5]},
     #quest_classes_rand_data{id = 20030, type = 4,
                              weight = 100, in_round = [1, 5]},
     #quest_classes_rand_data{id = 20031, type = 4,
                              weight = 100, in_round = [1, 5]},
     #quest_classes_rand_data{id = 20050, type = 7,
                              weight = 100, in_round = [2, 4]},
     #quest_classes_rand_data{id = 20051, type = 7,
                              weight = 100, in_round = [2, 4]},
     #quest_classes_rand_data{id = 20052, type = 7,
                              weight = 100, in_round = [2, 4]},
     #quest_classes_rand_data{id = 20053, type = 7,
                              weight = 100, in_round = [2, 4]},
     #quest_classes_rand_data{id = 20054, type = 7,
                              weight = 100, in_round = [2, 4]},
     #quest_classes_rand_data{id = 20055, type = 7,
                              weight = 100, in_round = [2, 4]},
     #quest_classes_rand_data{id = 20060, type = 3,
                              weight = 100, in_round = [3, 5, 9]},
     #quest_classes_rand_data{id = 20061, type = 3,
                              weight = 100, in_round = [3, 5, 9]},
     #quest_classes_rand_data{id = 20062, type = 3,
                              weight = 100, in_round = [3, 5, 9]},
     #quest_classes_rand_data{id = 20063, type = 3,
                              weight = 100, in_round = [3, 5, 9]},
     #quest_classes_rand_data{id = 20064, type = 3,
                              weight = 100, in_round = [3, 5, 9]},
     #quest_classes_rand_data{id = 20070, type = 1,
                              weight = 100, in_round = [3, 5]},
     #quest_classes_rand_data{id = 20071, type = 1,
                              weight = 100, in_round = [3, 5]},
     #quest_classes_rand_data{id = 20072, type = 1,
                              weight = 100, in_round = [3, 5]},
     #quest_classes_rand_data{id = 20073, type = 1,
                              weight = 100, in_round = [3, 5]},
     #quest_classes_rand_data{id = 20074, type = 1,
                              weight = 100, in_round = [3, 5]},
     #quest_classes_rand_data{id = 20075, type = 1,
                              weight = 100, in_round = [3, 5]},
     #quest_classes_rand_data{id = 20076, type = 1,
                              weight = 100, in_round = [3, 5]},
     #quest_classes_rand_data{id = 20080, type = 2,
                              weight = 100, in_round = [2, 4, 7, 9]},
     #quest_classes_rand_data{id = 20081, type = 1,
                              weight = 100, in_round = [1, 7]},
     #quest_classes_rand_data{id = 20082, type = 1,
                              weight = 100, in_round = [1, 7]},
     #quest_classes_rand_data{id = 20083, type = 1,
                              weight = 100, in_round = [1, 7]},
     #quest_classes_rand_data{id = 20084, type = 2,
                              weight = 100, in_round = [2, 4, 7, 9]},
     #quest_classes_rand_data{id = 20085, type = 2,
                              weight = 100, in_round = [2, 4, 7, 9]},
     #quest_classes_rand_data{id = 20090, type = 9,
                              weight = 100, in_round = [1, 7, 9]},
     #quest_classes_rand_data{id = 20091, type = 9,
                              weight = 100, in_round = [1, 7, 9]},
     #quest_classes_rand_data{id = 20092, type = 9,
                              weight = 100, in_round = [1, 7, 9]},
     #quest_classes_rand_data{id = 20093, type = 9,
                              weight = 100, in_round = [1, 7, 9]},
     #quest_classes_rand_data{id = 20100, type = 6,
                              weight = 100, in_round = [2, 4, 6, 8, 9, 10]},
     #quest_classes_rand_data{id = 20101, type = 6,
                              weight = 100, in_round = [2, 4, 6, 8, 9, 10]},
     #quest_classes_rand_data{id = 20103, type = 6,
                              weight = 100, in_round = [2, 4, 6, 8, 9, 10]},
     #quest_classes_rand_data{id = 20104, type = 6,
                              weight = 100, in_round = [2, 4, 6, 8, 9, 10]},
     #quest_classes_rand_data{id = 20105, type = 6,
                              weight = 100, in_round = [2, 4, 6, 8, 9, 10]},
     #quest_classes_rand_data{id = 20106, type = 6,
                              weight = 100, in_round = [2, 4, 6, 8, 9, 10]},
     #quest_classes_rand_data{id = 20107, type = 6,
                              weight = 100, in_round = [2, 4, 6, 8, 9, 10]},
     #quest_classes_rand_data{id = 20108, type = 6,
                              weight = 100, in_round = [2, 4, 6, 8, 9, 10]},
     #quest_classes_rand_data{id = 20121, type = 4,
                              weight = 100, in_round = [1, 5]},
     #quest_classes_rand_data{id = 20122, type = 4,
                              weight = 100, in_round = [1, 5]},
     #quest_classes_rand_data{id = 20123, type = 4,
                              weight = 100, in_round = [1, 5]},
     #quest_classes_rand_data{id = 20124, type = 4,
                              weight = 100, in_round = [1, 5]},
     #quest_classes_rand_data{id = 20125, type = 4,
                              weight = 100, in_round = [1, 5]},
     #quest_classes_rand_data{id = 20126, type = 4,
                              weight = 100, in_round = [1, 5]},
     #quest_classes_rand_data{id = 20127, type = 4,
                              weight = 100, in_round = [1, 5]},
     #quest_classes_rand_data{id = 20128, type = 4,
                              weight = 100, in_round = [1, 5]},
     #quest_classes_rand_data{id = 20129, type = 4,
                              weight = 100, in_round = [1, 5]},
     #quest_classes_rand_data{id = 20130, type = 4,
                              weight = 100, in_round = [1, 5]},
     #quest_classes_rand_data{id = 20131, type = 4,
                              weight = 100, in_round = [1, 5]},
     #quest_classes_rand_data{id = 20150, type = 7,
                              weight = 100, in_round = [2, 4]},
     #quest_classes_rand_data{id = 20151, type = 7,
                              weight = 100, in_round = [2, 4]},
     #quest_classes_rand_data{id = 20152, type = 7,
                              weight = 100, in_round = [2, 4]},
     #quest_classes_rand_data{id = 20153, type = 7,
                              weight = 100, in_round = [2, 4]},
     #quest_classes_rand_data{id = 20154, type = 7,
                              weight = 100, in_round = [2, 4]},
     #quest_classes_rand_data{id = 20155, type = 7,
                              weight = 100, in_round = [2, 4]},
     #quest_classes_rand_data{id = 20160, type = 3,
                              weight = 100, in_round = [3, 5, 9]},
     #quest_classes_rand_data{id = 20161, type = 3,
                              weight = 100, in_round = [3, 5, 9]},
     #quest_classes_rand_data{id = 20162, type = 3,
                              weight = 100, in_round = [3, 5, 9]},
     #quest_classes_rand_data{id = 20163, type = 3,
                              weight = 100, in_round = [3, 5, 9]},
     #quest_classes_rand_data{id = 20164, type = 3,
                              weight = 100, in_round = [3, 5, 9]},
     #quest_classes_rand_data{id = 20170, type = 1,
                              weight = 100, in_round = [3, 5]},
     #quest_classes_rand_data{id = 20171, type = 1,
                              weight = 100, in_round = [3, 5]},
     #quest_classes_rand_data{id = 20172, type = 1,
                              weight = 100, in_round = [3, 5]},
     #quest_classes_rand_data{id = 20173, type = 1,
                              weight = 100, in_round = [3, 5]},
     #quest_classes_rand_data{id = 20174, type = 1,
                              weight = 100, in_round = [3, 5]},
     #quest_classes_rand_data{id = 20175, type = 1,
                              weight = 100, in_round = [3, 5]},
     #quest_classes_rand_data{id = 20176, type = 1,
                              weight = 100, in_round = [3, 5]},
     #quest_classes_rand_data{id = 20180, type = 2,
                              weight = 100, in_round = [2, 4, 7, 9]},
     #quest_classes_rand_data{id = 20181, type = 1,
                              weight = 100, in_round = [1, 7]},
     #quest_classes_rand_data{id = 20182, type = 1,
                              weight = 100, in_round = [1, 7]},
     #quest_classes_rand_data{id = 20183, type = 1,
                              weight = 100, in_round = [1, 7]},
     #quest_classes_rand_data{id = 20184, type = 2,
                              weight = 100, in_round = [2, 4, 7, 9]},
     #quest_classes_rand_data{id = 20185, type = 2,
                              weight = 100, in_round = [2, 4, 7, 9]},
     #quest_classes_rand_data{id = 20190, type = 9,
                              weight = 100, in_round = [1, 7, 9]},
     #quest_classes_rand_data{id = 20191, type = 9,
                              weight = 100, in_round = [1, 7, 9]},
     #quest_classes_rand_data{id = 20192, type = 9,
                              weight = 100, in_round = [1, 7, 9]},
     #quest_classes_rand_data{id = 20193, type = 9,
                              weight = 100, in_round = [1, 7, 9]},
     #quest_classes_rand_data{id = 20200, type = 6,
                              weight = 100, in_round = [2, 4, 6, 8, 9, 10]},
     #quest_classes_rand_data{id = 20201, type = 6,
                              weight = 100, in_round = [2, 4, 6, 8, 9, 10]},
     #quest_classes_rand_data{id = 20203, type = 6,
                              weight = 100, in_round = [2, 4, 6, 8, 9, 10]},
     #quest_classes_rand_data{id = 20204, type = 6,
                              weight = 100, in_round = [2, 4, 6, 8, 9, 10]},
     #quest_classes_rand_data{id = 20205, type = 6,
                              weight = 100, in_round = [2, 4, 6, 8, 9, 10]},
     #quest_classes_rand_data{id = 20206, type = 6,
                              weight = 100, in_round = [2, 4, 6, 8, 9, 10]},
     #quest_classes_rand_data{id = 20207, type = 6,
                              weight = 100, in_round = [2, 4, 6, 8, 9, 10]},
     #quest_classes_rand_data{id = 20208, type = 6,
                              weight = 100, in_round = [2, 4, 6, 8, 9, 10]},
     #quest_classes_rand_data{id = 20221, type = 4,
                              weight = 100, in_round = [1, 5]},
     #quest_classes_rand_data{id = 20222, type = 4,
                              weight = 100, in_round = [1, 5]},
     #quest_classes_rand_data{id = 20223, type = 4,
                              weight = 100, in_round = [1, 5]},
     #quest_classes_rand_data{id = 20224, type = 4,
                              weight = 100, in_round = [1, 5]},
     #quest_classes_rand_data{id = 20225, type = 4,
                              weight = 100, in_round = [1, 5]},
     #quest_classes_rand_data{id = 20226, type = 4,
                              weight = 100, in_round = [1, 5]},
     #quest_classes_rand_data{id = 20227, type = 4,
                              weight = 100, in_round = [1, 5]},
     #quest_classes_rand_data{id = 20228, type = 4,
                              weight = 100, in_round = [1, 5]},
     #quest_classes_rand_data{id = 20229, type = 4,
                              weight = 100, in_round = [1, 5]},
     #quest_classes_rand_data{id = 20230, type = 4,
                              weight = 100, in_round = [1, 5]},
     #quest_classes_rand_data{id = 20231, type = 4,
                              weight = 100, in_round = [1, 5]},
     #quest_classes_rand_data{id = 20250, type = 7,
                              weight = 100, in_round = [2, 4]},
     #quest_classes_rand_data{id = 20251, type = 7,
                              weight = 100, in_round = [2, 4]},
     #quest_classes_rand_data{id = 20252, type = 7,
                              weight = 100, in_round = [2, 4]},
     #quest_classes_rand_data{id = 20253, type = 7,
                              weight = 100, in_round = [2, 4]},
     #quest_classes_rand_data{id = 20254, type = 7,
                              weight = 100, in_round = [2, 4]},
     #quest_classes_rand_data{id = 20255, type = 7,
                              weight = 100, in_round = [2, 4]},
     #quest_classes_rand_data{id = 20260, type = 3,
                              weight = 100, in_round = [3, 5, 9]},
     #quest_classes_rand_data{id = 20261, type = 3,
                              weight = 100, in_round = [3, 5, 9]},
     #quest_classes_rand_data{id = 20262, type = 3,
                              weight = 100, in_round = [3, 5, 9]},
     #quest_classes_rand_data{id = 20263, type = 3,
                              weight = 100, in_round = [3, 5, 9]},
     #quest_classes_rand_data{id = 20264, type = 3,
                              weight = 100, in_round = [3, 5, 9]},
     #quest_classes_rand_data{id = 20270, type = 1,
                              weight = 100, in_round = [3, 5]},
     #quest_classes_rand_data{id = 20271, type = 1,
                              weight = 100, in_round = [3, 5]},
     #quest_classes_rand_data{id = 20272, type = 1,
                              weight = 100, in_round = [3, 5]},
     #quest_classes_rand_data{id = 20273, type = 1,
                              weight = 100, in_round = [3, 5]},
     #quest_classes_rand_data{id = 20274, type = 1,
                              weight = 100, in_round = [3, 5]},
     #quest_classes_rand_data{id = 20275, type = 1,
                              weight = 100, in_round = [3, 5]},
     #quest_classes_rand_data{id = 20276, type = 1,
                              weight = 100, in_round = [3, 5]},
     #quest_classes_rand_data{id = 20280, type = 2,
                              weight = 100, in_round = [2, 4, 7, 9]},
     #quest_classes_rand_data{id = 20281, type = 1,
                              weight = 100, in_round = [1, 7]},
     #quest_classes_rand_data{id = 20282, type = 1,
                              weight = 100, in_round = [1, 7]},
     #quest_classes_rand_data{id = 20283, type = 1,
                              weight = 100, in_round = [1, 7]},
     #quest_classes_rand_data{id = 20284, type = 2,
                              weight = 100, in_round = [2, 4, 7, 9]},
     #quest_classes_rand_data{id = 20285, type = 2,
                              weight = 100, in_round = [2, 4, 7, 9]},
     #quest_classes_rand_data{id = 20290, type = 9,
                              weight = 100, in_round = [1, 7, 9]},
     #quest_classes_rand_data{id = 20291, type = 9,
                              weight = 100, in_round = [1, 7, 9]},
     #quest_classes_rand_data{id = 20292, type = 9,
                              weight = 100, in_round = [1, 7, 9]},
     #quest_classes_rand_data{id = 20293, type = 9,
                              weight = 100, in_round = [1, 7, 9]},
     #quest_classes_rand_data{id = 20300, type = 6,
                              weight = 100, in_round = [2, 4, 6, 8, 9, 10]},
     #quest_classes_rand_data{id = 20301, type = 6,
                              weight = 100, in_round = [2, 4, 6, 8, 9, 10]},
     #quest_classes_rand_data{id = 20303, type = 6,
                              weight = 100, in_round = [2, 4, 6, 8, 9, 10]},
     #quest_classes_rand_data{id = 20304, type = 6,
                              weight = 100, in_round = [2, 4, 6, 8, 9, 10]},
     #quest_classes_rand_data{id = 20305, type = 6,
                              weight = 100, in_round = [2, 4, 6, 8, 9, 10]},
     #quest_classes_rand_data{id = 20306, type = 6,
                              weight = 100, in_round = [2, 4, 6, 8, 9, 10]},
     #quest_classes_rand_data{id = 20307, type = 6,
                              weight = 100, in_round = [2, 4, 6, 8, 9, 10]},
     #quest_classes_rand_data{id = 20308, type = 6,
                              weight = 100, in_round = [2, 4, 6, 8, 9, 10]},
     #quest_classes_rand_data{id = 20321, type = 4,
                              weight = 100, in_round = [1, 5]},
     #quest_classes_rand_data{id = 20322, type = 4,
                              weight = 100, in_round = [1, 5]},
     #quest_classes_rand_data{id = 20323, type = 4,
                              weight = 100, in_round = [1, 5]},
     #quest_classes_rand_data{id = 20324, type = 4,
                              weight = 100, in_round = [1, 5]},
     #quest_classes_rand_data{id = 20325, type = 4,
                              weight = 100, in_round = [1, 5]},
     #quest_classes_rand_data{id = 20326, type = 4,
                              weight = 100, in_round = [1, 5]},
     #quest_classes_rand_data{id = 20327, type = 4,
                              weight = 100, in_round = [1, 5]},
     #quest_classes_rand_data{id = 20328, type = 4,
                              weight = 100, in_round = [1, 5]},
     #quest_classes_rand_data{id = 20329, type = 4,
                              weight = 100, in_round = [1, 5]},
     #quest_classes_rand_data{id = 20330, type = 4,
                              weight = 100, in_round = [1, 5]},
     #quest_classes_rand_data{id = 20331, type = 4,
                              weight = 100, in_round = [1, 5]},
     #quest_classes_rand_data{id = 20350, type = 7,
                              weight = 100, in_round = [2, 4]},
     #quest_classes_rand_data{id = 20351, type = 7,
                              weight = 100, in_round = [2, 4]},
     #quest_classes_rand_data{id = 20352, type = 7,
                              weight = 100, in_round = [2, 4]},
     #quest_classes_rand_data{id = 20353, type = 7,
                              weight = 100, in_round = [2, 4]},
     #quest_classes_rand_data{id = 20354, type = 7,
                              weight = 100, in_round = [2, 4]},
     #quest_classes_rand_data{id = 20355, type = 7,
                              weight = 100, in_round = [2, 4]},
     #quest_classes_rand_data{id = 20360, type = 3,
                              weight = 100, in_round = [3, 5, 9]},
     #quest_classes_rand_data{id = 20361, type = 3,
                              weight = 100, in_round = [3, 5, 9]},
     #quest_classes_rand_data{id = 20362, type = 3,
                              weight = 100, in_round = [3, 5, 9]},
     #quest_classes_rand_data{id = 20363, type = 3,
                              weight = 100, in_round = [3, 5, 9]},
     #quest_classes_rand_data{id = 20364, type = 3,
                              weight = 100, in_round = [3, 5, 9]},
     #quest_classes_rand_data{id = 20370, type = 1,
                              weight = 100, in_round = [3, 5]},
     #quest_classes_rand_data{id = 20371, type = 1,
                              weight = 100, in_round = [3, 5]},
     #quest_classes_rand_data{id = 20372, type = 1,
                              weight = 100, in_round = [3, 5]},
     #quest_classes_rand_data{id = 20373, type = 1,
                              weight = 100, in_round = [3, 5]},
     #quest_classes_rand_data{id = 20374, type = 1,
                              weight = 100, in_round = [3, 5]},
     #quest_classes_rand_data{id = 20375, type = 1,
                              weight = 100, in_round = [3, 5]},
     #quest_classes_rand_data{id = 20376, type = 1,
                              weight = 100, in_round = [3, 5]},
     #quest_classes_rand_data{id = 20380, type = 2,
                              weight = 100, in_round = [2, 4, 7, 9]},
     #quest_classes_rand_data{id = 20381, type = 1,
                              weight = 100, in_round = [1, 7]},
     #quest_classes_rand_data{id = 20382, type = 1,
                              weight = 100, in_round = [1, 7]},
     #quest_classes_rand_data{id = 20383, type = 1,
                              weight = 100, in_round = [1, 7]},
     #quest_classes_rand_data{id = 20384, type = 2,
                              weight = 100, in_round = [2, 4, 7, 9]},
     #quest_classes_rand_data{id = 20385, type = 2,
                              weight = 100, in_round = [2, 4, 7, 9]},
     #quest_classes_rand_data{id = 20390, type = 9,
                              weight = 100, in_round = [1, 7, 9]},
     #quest_classes_rand_data{id = 20391, type = 9,
                              weight = 100, in_round = [1, 7, 9]},
     #quest_classes_rand_data{id = 20392, type = 9,
                              weight = 100, in_round = [1, 7, 9]},
     #quest_classes_rand_data{id = 20393, type = 9,
                              weight = 100, in_round = [1, 7, 9]},
     #quest_classes_rand_data{id = 20400, type = 6,
                              weight = 100, in_round = [2, 4, 6, 8, 9, 10]},
     #quest_classes_rand_data{id = 20401, type = 6,
                              weight = 100, in_round = [2, 4, 6, 8, 9, 10]},
     #quest_classes_rand_data{id = 20403, type = 6,
                              weight = 100, in_round = [2, 4, 6, 8, 9, 10]},
     #quest_classes_rand_data{id = 20404, type = 6,
                              weight = 100, in_round = [2, 4, 6, 8, 9, 10]},
     #quest_classes_rand_data{id = 20405, type = 6,
                              weight = 100, in_round = [2, 4, 6, 8, 9, 10]},
     #quest_classes_rand_data{id = 20406, type = 6,
                              weight = 100, in_round = [2, 4, 6, 8, 9, 10]},
     #quest_classes_rand_data{id = 20407, type = 6,
                              weight = 100, in_round = [2, 4, 6, 8, 9, 10]},
     #quest_classes_rand_data{id = 20408, type = 6,
                              weight = 100, in_round = [2, 4, 6, 8, 9, 10]},
     #quest_classes_rand_data{id = 20421, type = 4,
                              weight = 100, in_round = [1, 5]},
     #quest_classes_rand_data{id = 20422, type = 4,
                              weight = 100, in_round = [1, 5]},
     #quest_classes_rand_data{id = 20423, type = 4,
                              weight = 100, in_round = [1, 5]},
     #quest_classes_rand_data{id = 20424, type = 4,
                              weight = 100, in_round = [1, 5]},
     #quest_classes_rand_data{id = 20425, type = 4,
                              weight = 100, in_round = [1, 5]},
     #quest_classes_rand_data{id = 20426, type = 4,
                              weight = 100, in_round = [1, 5]},
     #quest_classes_rand_data{id = 20427, type = 4,
                              weight = 100, in_round = [1, 5]},
     #quest_classes_rand_data{id = 20428, type = 4,
                              weight = 100, in_round = [1, 5]},
     #quest_classes_rand_data{id = 20429, type = 4,
                              weight = 100, in_round = [1, 5]},
     #quest_classes_rand_data{id = 20430, type = 4,
                              weight = 100, in_round = [1, 5]},
     #quest_classes_rand_data{id = 20431, type = 4,
                              weight = 100, in_round = [1, 5]},
     #quest_classes_rand_data{id = 20450, type = 7,
                              weight = 100, in_round = [2, 4]},
     #quest_classes_rand_data{id = 20451, type = 7,
                              weight = 100, in_round = [2, 4]},
     #quest_classes_rand_data{id = 20452, type = 7,
                              weight = 100, in_round = [2, 4]},
     #quest_classes_rand_data{id = 20453, type = 7,
                              weight = 100, in_round = [2, 4]},
     #quest_classes_rand_data{id = 20454, type = 7,
                              weight = 100, in_round = [2, 4]},
     #quest_classes_rand_data{id = 20455, type = 7,
                              weight = 100, in_round = [2, 4]},
     #quest_classes_rand_data{id = 20460, type = 3,
                              weight = 100, in_round = [3, 5, 9]},
     #quest_classes_rand_data{id = 20461, type = 3,
                              weight = 100, in_round = [3, 5, 9]},
     #quest_classes_rand_data{id = 20462, type = 3,
                              weight = 100, in_round = [3, 5, 9]},
     #quest_classes_rand_data{id = 20463, type = 3,
                              weight = 100, in_round = [3, 5, 9]},
     #quest_classes_rand_data{id = 20464, type = 3,
                              weight = 100, in_round = [3, 5, 9]},
     #quest_classes_rand_data{id = 20470, type = 1,
                              weight = 100, in_round = [3, 5]},
     #quest_classes_rand_data{id = 20471, type = 1,
                              weight = 100, in_round = [3, 5]},
     #quest_classes_rand_data{id = 20472, type = 1,
                              weight = 100, in_round = [3, 5]},
     #quest_classes_rand_data{id = 20473, type = 1,
                              weight = 100, in_round = [3, 5]},
     #quest_classes_rand_data{id = 20474, type = 1,
                              weight = 100, in_round = [3, 5]},
     #quest_classes_rand_data{id = 20475, type = 1,
                              weight = 100, in_round = [3, 5]},
     #quest_classes_rand_data{id = 20476, type = 1,
                              weight = 100, in_round = [3, 5]},
     #quest_classes_rand_data{id = 20480, type = 2,
                              weight = 100, in_round = [2, 4, 7, 9]},
     #quest_classes_rand_data{id = 20481, type = 1,
                              weight = 100, in_round = [1, 7]},
     #quest_classes_rand_data{id = 20482, type = 1,
                              weight = 100, in_round = [1, 7]},
     #quest_classes_rand_data{id = 20483, type = 1,
                              weight = 100, in_round = [1, 7]},
     #quest_classes_rand_data{id = 20484, type = 2,
                              weight = 100, in_round = [2, 4, 7, 9]},
     #quest_classes_rand_data{id = 20485, type = 2,
                              weight = 100, in_round = [2, 4, 7, 9]},
     #quest_classes_rand_data{id = 20490, type = 9,
                              weight = 100, in_round = [1, 7, 9]},
     #quest_classes_rand_data{id = 20491, type = 9,
                              weight = 100, in_round = [1, 7, 9]},
     #quest_classes_rand_data{id = 20492, type = 9,
                              weight = 100, in_round = [1, 7, 9]},
     #quest_classes_rand_data{id = 20493, type = 9,
                              weight = 100, in_round = [1, 7, 9]},
     #quest_classes_rand_data{id = 20500, type = 6,
                              weight = 100, in_round = [2, 4, 6, 8, 9, 10]},
     #quest_classes_rand_data{id = 20501, type = 6,
                              weight = 100, in_round = [2, 4, 6, 8, 9, 10]},
     #quest_classes_rand_data{id = 20503, type = 6,
                              weight = 100, in_round = [2, 4, 6, 8, 9, 10]},
     #quest_classes_rand_data{id = 20504, type = 6,
                              weight = 100, in_round = [2, 4, 6, 8, 9, 10]},
     #quest_classes_rand_data{id = 20505, type = 6,
                              weight = 100, in_round = [2, 4, 6, 8, 9, 10]},
     #quest_classes_rand_data{id = 20506, type = 6,
                              weight = 100, in_round = [2, 4, 6, 8, 9, 10]},
     #quest_classes_rand_data{id = 20507, type = 6,
                              weight = 100, in_round = [2, 4, 6, 8, 9, 10]},
     #quest_classes_rand_data{id = 20508, type = 6,
                              weight = 100, in_round = [2, 4, 6, 8, 9, 10]},
     #quest_classes_rand_data{id = 20521, type = 4,
                              weight = 100, in_round = [1, 5]},
     #quest_classes_rand_data{id = 20522, type = 4,
                              weight = 100, in_round = [1, 5]},
     #quest_classes_rand_data{id = 20523, type = 4,
                              weight = 100, in_round = [1, 5]},
     #quest_classes_rand_data{id = 20524, type = 4,
                              weight = 100, in_round = [1, 5]},
     #quest_classes_rand_data{id = 20525, type = 4,
                              weight = 100, in_round = [1, 5]},
     #quest_classes_rand_data{id = 20526, type = 4,
                              weight = 100, in_round = [1, 5]},
     #quest_classes_rand_data{id = 20527, type = 4,
                              weight = 100, in_round = [1, 5]},
     #quest_classes_rand_data{id = 20528, type = 4,
                              weight = 100, in_round = [1, 5]},
     #quest_classes_rand_data{id = 20529, type = 4,
                              weight = 100, in_round = [1, 5]},
     #quest_classes_rand_data{id = 20530, type = 4,
                              weight = 100, in_round = [1, 5]},
     #quest_classes_rand_data{id = 20531, type = 4,
                              weight = 100, in_round = [1, 5]},
     #quest_classes_rand_data{id = 20550, type = 7,
                              weight = 100, in_round = [2, 4]},
     #quest_classes_rand_data{id = 20551, type = 7,
                              weight = 100, in_round = [2, 4]},
     #quest_classes_rand_data{id = 20552, type = 7,
                              weight = 100, in_round = [2, 4]},
     #quest_classes_rand_data{id = 20553, type = 7,
                              weight = 100, in_round = [2, 4]},
     #quest_classes_rand_data{id = 20554, type = 7,
                              weight = 100, in_round = [2, 4]},
     #quest_classes_rand_data{id = 20555, type = 7,
                              weight = 100, in_round = [2, 4]},
     #quest_classes_rand_data{id = 20560, type = 3,
                              weight = 100, in_round = [3, 5, 9]},
     #quest_classes_rand_data{id = 20561, type = 3,
                              weight = 100, in_round = [3, 5, 9]},
     #quest_classes_rand_data{id = 20562, type = 3,
                              weight = 100, in_round = [3, 5, 9]},
     #quest_classes_rand_data{id = 20563, type = 3,
                              weight = 100, in_round = [3, 5, 9]},
     #quest_classes_rand_data{id = 20564, type = 3,
                              weight = 100, in_round = [3, 5, 9]},
     #quest_classes_rand_data{id = 20570, type = 1,
                              weight = 100, in_round = [3, 5]},
     #quest_classes_rand_data{id = 20571, type = 1,
                              weight = 100, in_round = [3, 5]},
     #quest_classes_rand_data{id = 20572, type = 1,
                              weight = 100, in_round = [3, 5]},
     #quest_classes_rand_data{id = 20573, type = 1,
                              weight = 100, in_round = [3, 5]},
     #quest_classes_rand_data{id = 20574, type = 1,
                              weight = 100, in_round = [3, 5]},
     #quest_classes_rand_data{id = 20575, type = 1,
                              weight = 100, in_round = [3, 5]},
     #quest_classes_rand_data{id = 20576, type = 1,
                              weight = 100, in_round = [3, 5]},
     #quest_classes_rand_data{id = 20580, type = 2,
                              weight = 100, in_round = [2, 4, 7, 9]},
     #quest_classes_rand_data{id = 20581, type = 1,
                              weight = 100, in_round = [1, 7]},
     #quest_classes_rand_data{id = 20582, type = 1,
                              weight = 100, in_round = [1, 7]},
     #quest_classes_rand_data{id = 20583, type = 1,
                              weight = 100, in_round = [1, 7]},
     #quest_classes_rand_data{id = 20584, type = 2,
                              weight = 100, in_round = [2, 4, 7, 9]},
     #quest_classes_rand_data{id = 20585, type = 2,
                              weight = 100, in_round = [2, 4, 7, 9]},
     #quest_classes_rand_data{id = 20590, type = 9,
                              weight = 100, in_round = [1, 7, 9]},
     #quest_classes_rand_data{id = 20591, type = 9,
                              weight = 100, in_round = [1, 7, 9]},
     #quest_classes_rand_data{id = 20592, type = 9,
                              weight = 100, in_round = [1, 7, 9]},
     #quest_classes_rand_data{id = 20593, type = 9,
                              weight = 100, in_round = [1, 7, 9]},
     #quest_classes_rand_data{id = 20600, type = 6,
                              weight = 100, in_round = [2, 4, 6, 8, 9, 10]},
     #quest_classes_rand_data{id = 20601, type = 6,
                              weight = 100, in_round = [2, 4, 6, 8, 9, 10]},
     #quest_classes_rand_data{id = 20603, type = 6,
                              weight = 100, in_round = [2, 4, 6, 8, 9, 10]},
     #quest_classes_rand_data{id = 20604, type = 6,
                              weight = 100, in_round = [2, 4, 6, 8, 9, 10]},
     #quest_classes_rand_data{id = 20605, type = 6,
                              weight = 100, in_round = [2, 4, 6, 8, 9, 10]},
     #quest_classes_rand_data{id = 20606, type = 6,
                              weight = 100, in_round = [2, 4, 6, 8, 9, 10]},
     #quest_classes_rand_data{id = 20607, type = 6,
                              weight = 100, in_round = [2, 4, 6, 8, 9, 10]},
     #quest_classes_rand_data{id = 20608, type = 6,
                              weight = 100, in_round = [2, 4, 6, 8, 9, 10]},
     #quest_classes_rand_data{id = 20621, type = 4,
                              weight = 100, in_round = [1, 5]},
     #quest_classes_rand_data{id = 20622, type = 4,
                              weight = 100, in_round = [1, 5]},
     #quest_classes_rand_data{id = 20623, type = 4,
                              weight = 100, in_round = [1, 5]},
     #quest_classes_rand_data{id = 20624, type = 4,
                              weight = 100, in_round = [1, 5]},
     #quest_classes_rand_data{id = 20625, type = 4,
                              weight = 100, in_round = [1, 5]},
     #quest_classes_rand_data{id = 20626, type = 4,
                              weight = 100, in_round = [1, 5]},
     #quest_classes_rand_data{id = 20627, type = 4,
                              weight = 100, in_round = [1, 5]},
     #quest_classes_rand_data{id = 20628, type = 4,
                              weight = 100, in_round = [1, 5]},
     #quest_classes_rand_data{id = 20629, type = 4,
                              weight = 100, in_round = [1, 5]},
     #quest_classes_rand_data{id = 20630, type = 4,
                              weight = 100, in_round = [1, 5]},
     #quest_classes_rand_data{id = 20631, type = 4,
                              weight = 100, in_round = [1, 5]},
     #quest_classes_rand_data{id = 20650, type = 7,
                              weight = 100, in_round = [2, 4]},
     #quest_classes_rand_data{id = 20651, type = 7,
                              weight = 100, in_round = [2, 4]},
     #quest_classes_rand_data{id = 20652, type = 7,
                              weight = 100, in_round = [2, 4]},
     #quest_classes_rand_data{id = 20653, type = 7,
                              weight = 100, in_round = [2, 4]},
     #quest_classes_rand_data{id = 20654, type = 7,
                              weight = 100, in_round = [2, 4]},
     #quest_classes_rand_data{id = 20655, type = 7,
                              weight = 100, in_round = [2, 4]},
     #quest_classes_rand_data{id = 20660, type = 3,
                              weight = 100, in_round = [3, 5, 9]},
     #quest_classes_rand_data{id = 20661, type = 3,
                              weight = 100, in_round = [3, 5, 9]},
     #quest_classes_rand_data{id = 20662, type = 3,
                              weight = 100, in_round = [3, 5, 9]},
     #quest_classes_rand_data{id = 20663, type = 3,
                              weight = 100, in_round = [3, 5, 9]},
     #quest_classes_rand_data{id = 20664, type = 3,
                              weight = 100, in_round = [3, 5, 9]},
     #quest_classes_rand_data{id = 20670, type = 1,
                              weight = 100, in_round = [3, 5]},
     #quest_classes_rand_data{id = 20671, type = 1,
                              weight = 100, in_round = [3, 5]},
     #quest_classes_rand_data{id = 20672, type = 1,
                              weight = 100, in_round = [3, 5]},
     #quest_classes_rand_data{id = 20673, type = 1,
                              weight = 100, in_round = [3, 5]},
     #quest_classes_rand_data{id = 20674, type = 1,
                              weight = 100, in_round = [3, 5]},
     #quest_classes_rand_data{id = 20675, type = 1,
                              weight = 100, in_round = [3, 5]},
     #quest_classes_rand_data{id = 20676, type = 1,
                              weight = 100, in_round = [3, 5]},
     #quest_classes_rand_data{id = 20680, type = 2,
                              weight = 100, in_round = [2, 4, 7, 9]},
     #quest_classes_rand_data{id = 20681, type = 1,
                              weight = 100, in_round = [1, 7]},
     #quest_classes_rand_data{id = 20682, type = 1,
                              weight = 100, in_round = [1, 7]},
     #quest_classes_rand_data{id = 20683, type = 1,
                              weight = 100, in_round = [1, 7]},
     #quest_classes_rand_data{id = 20684, type = 2,
                              weight = 100, in_round = [2, 4, 7, 9]},
     #quest_classes_rand_data{id = 20685, type = 2,
                              weight = 100, in_round = [2, 4, 7, 9]},
     #quest_classes_rand_data{id = 20690, type = 9,
                              weight = 100, in_round = [1, 7, 9]},
     #quest_classes_rand_data{id = 20691, type = 9,
                              weight = 100, in_round = [1, 7, 9]},
     #quest_classes_rand_data{id = 20692, type = 9,
                              weight = 100, in_round = [1, 7, 9]},
     #quest_classes_rand_data{id = 20693, type = 9,
                              weight = 100, in_round = [1, 7, 9]}].

get_task_seq_ratio({1, 1}) -> {2600, 2000};
get_task_seq_ratio({1, 2}) -> {2808, 2300};
get_task_seq_ratio({1, 3}) -> {3016, 2600};
get_task_seq_ratio({1, 4}) -> {3224, 2900};
get_task_seq_ratio({1, 5}) -> {3432, 3200};
get_task_seq_ratio({1, 6}) -> {3640, 3500};
get_task_seq_ratio({1, 7}) -> {3848, 3800};
get_task_seq_ratio({1, 8}) -> {4056, 4200};
get_task_seq_ratio({1, 9}) -> {4264, 4600};
get_task_seq_ratio({1, 10}) -> {5460, 5000};
get_task_seq_ratio({2, 1}) -> {1950, 1000};
get_task_seq_ratio({2, 2}) -> {2106, 1150};
get_task_seq_ratio({2, 3}) -> {2262, 1300};
get_task_seq_ratio({2, 4}) -> {2418, 1450};
get_task_seq_ratio({2, 5}) -> {2574, 1600};
get_task_seq_ratio({2, 6}) -> {2730, 1750};
get_task_seq_ratio({2, 7}) -> {2886, 1900};
get_task_seq_ratio({2, 8}) -> {3042, 2100};
get_task_seq_ratio({2, 9}) -> {3198, 2300};
get_task_seq_ratio({2, 10}) -> {4680, 2500};
get_task_seq_ratio(_) -> {0, 0}.

get_task_stats_reward(1, Lev)
    when Lev =< 84 andalso Lev >= 16 ->
    {[#gain{label = gold_bind, val = 3000},
      #gain{label = item_base_id, val = [{20019, 1, 2}]}],
     [],
     []};
get_task_stats_reward(1, Lev)
    when Lev =< 104 andalso Lev >= 85 ->
    {[#gain{label = gold_bind, val = 3000},
      #gain{label = item_base_id, val = [{20019, 1, 2}]}],
     [{21236, 1, 50}, {0, 1, 950}],
     [{23824, 1, 1, 300, 1},
      {23825, 1, 1, 300, 2},
      {23826, 1, 1, 300, 3},
      {23827, 1, 1, 300, 4},
      {23828, 1, 1, 300, 5},
      {23835, 1, 1, 300, 6},
      {23829, 1, 1, 300, 7},
      {0, 0, 1, 700, 0}]};
get_task_stats_reward(1, Lev)
    when Lev =< 108 andalso Lev >= 105 ->
    {[#gain{label = gold_bind, val = 3000},
      #gain{label = item_base_id, val = [{20019, 1, 2}]}],
     [{21230, 1, 100}, {21231, 1, 100}],
     [{23824, 1, 1, 300, 1},
      {23825, 1, 1, 300, 2},
      {23826, 1, 1, 300, 3},
      {23827, 1, 1, 300, 4},
      {23828, 1, 1, 300, 5},
      {23835, 1, 1, 300, 6},
      {23829, 1, 1, 300, 7},
      {0, 0, 1, 700, 0}]};
get_task_stats_reward(1, Lev)
    when Lev =< 118 andalso Lev >= 109 ->
    {[#gain{label = gold_bind, val = 3000},
      #gain{label = item_base_id, val = [{20019, 1, 2}]}],
     [{21232, 1, 100}, {21233, 1, 100}, {0, 1, 200}],
     [{23824, 1, 1, 300, 1},
      {23825, 1, 1, 300, 2},
      {23826, 1, 1, 300, 3},
      {23827, 1, 1, 300, 4},
      {23828, 1, 1, 300, 5},
      {23835, 1, 1, 300, 6},
      {23829, 1, 1, 300, 7},
      {0, 0, 1, 700, 0}]};
get_task_stats_reward(1, Lev)
    when Lev =< 128 andalso Lev >= 119 ->
    {[#gain{label = gold_bind, val = 3000},
      #gain{label = item_base_id, val = [{20019, 1, 2}]}],
     [{21234, 1, 100}, {21235, 1, 100}, {0, 1, 200}],
     [{23824, 1, 1, 300, 1},
      {23825, 1, 1, 300, 2},
      {23826, 1, 1, 300, 3},
      {23827, 1, 1, 300, 4},
      {23828, 1, 1, 300, 5},
      {23835, 1, 1, 300, 6},
      {23829, 1, 1, 300, 7},
      {0, 0, 1, 700, 0}]};
get_task_stats_reward(1, Lev)
    when Lev =< 200 andalso Lev >= 129 ->
    {[#gain{label = gold_bind, val = 3000},
      #gain{label = item_base_id, val = [{20019, 1, 2}]}],
     [{21234, 1, 100}, {21235, 1, 100}, {0, 1, 200}],
     [{23824, 1, 1, 300, 1},
      {23825, 1, 1, 300, 2},
      {23826, 1, 1, 300, 3},
      {23827, 1, 1, 300, 4},
      {23828, 1, 1, 300, 5},
      {23835, 1, 1, 300, 6},
      {23829, 1, 1, 300, 7},
      {0, 0, 1, 700, 0}]};
get_task_stats_reward(_Type, _Lev) -> {[], [], []}.

get_classify() ->
    [{1, 500, 10},
     {2, 250, 10},
     {3, 150, 20},
     {4, 100, 30},
     {5, 1500, 30},
     {6, 1500, 30}].

get_item_list() ->
    [#quest_classes_item_data{id = 21401, type = 6,
                              role_lev = 45, weight = 100},
     #quest_classes_item_data{id = 21402, type = 6,
                              role_lev = 10, weight = 100},
     #quest_classes_item_data{id = 21403, type = 6,
                              role_lev = 10, weight = 100},
     #quest_classes_item_data{id = 21404, type = 6,
                              role_lev = 10, weight = 100},
     #quest_classes_item_data{id = 21405, type = 6,
                              role_lev = 10, weight = 100},
     #quest_classes_item_data{id = 21406, type = 6,
                              role_lev = 10, weight = 100},
     #quest_classes_item_data{id = 21407, type = 6,
                              role_lev = 35, weight = 100},
     #quest_classes_item_data{id = 21408, type = 6,
                              role_lev = 40, weight = 100},
     #quest_classes_item_data{id = 21300, type = 5,
                              role_lev = 15, weight = 100},
     #quest_classes_item_data{id = 21301, type = 5,
                              role_lev = 15, weight = 150},
     #quest_classes_item_data{id = 21303, type = 5,
                              role_lev = 20, weight = 45},
     #quest_classes_item_data{id = 21302, type = 5,
                              role_lev = 30, weight = 50},
     #quest_classes_item_data{id = 21313, type = 5,
                              role_lev = 40, weight = 45},
     #quest_classes_item_data{id = 21305, type = 5,
                              role_lev = 50, weight = 40},
     #quest_classes_item_data{id = 21304, type = 5,
                              role_lev = 55, weight = 50},
     #quest_classes_item_data{id = 21307, type = 5,
                              role_lev = 60, weight = 30},
     #quest_classes_item_data{id = 21409, type = 5,
                              role_lev = 65, weight = 40},
     #quest_classes_item_data{id = 21309, type = 5,
                              role_lev = 70, weight = 15},
     #quest_classes_item_data{id = 21308, type = 5,
                              role_lev = 75, weight = 35},
     #quest_classes_item_data{id = 21311, type = 5,
                              role_lev = 80, weight = 5},
     #quest_classes_item_data{id = 21314, type = 5,
                              role_lev = 85, weight = 2}].

get_find_type_quest_id({1, 1}) -> [20000, 20003, 20006];
get_find_type_quest_id({2, 1}) -> [20001];
get_find_type_quest_id({3, 1}) -> [20004];
get_find_type_quest_id({5, 1}) -> [20005];
get_find_type_quest_id({4, 1}) -> [20007];
get_find_type_quest_id({6, 1}) -> [20008];
get_find_type_quest_id({1, 2}) -> [20100, 20103, 20106];
get_find_type_quest_id({2, 2}) -> [20101];
get_find_type_quest_id({3, 2}) -> [20104];
get_find_type_quest_id({5, 2}) -> [20105];
get_find_type_quest_id({4, 2}) -> [20107];
get_find_type_quest_id({6, 2}) -> [20108];
get_find_type_quest_id({1, 3}) -> [20200, 20203, 20206];
get_find_type_quest_id({2, 3}) -> [20201];
get_find_type_quest_id({3, 3}) -> [20204];
get_find_type_quest_id({5, 3}) -> [20205];
get_find_type_quest_id({4, 3}) -> [20207];
get_find_type_quest_id({6, 3}) -> [20208];
get_find_type_quest_id({1, 4}) -> [20300, 20303, 20306];
get_find_type_quest_id({2, 4}) -> [20301];
get_find_type_quest_id({3, 4}) -> [20304];
get_find_type_quest_id({5, 4}) -> [20305];
get_find_type_quest_id({4, 4}) -> [20307];
get_find_type_quest_id({6, 4}) -> [20308];
get_find_type_quest_id({1, 5}) -> [20400, 20403, 20406];
get_find_type_quest_id({2, 5}) -> [20401];
get_find_type_quest_id({3, 5}) -> [20404];
get_find_type_quest_id({5, 5}) -> [20405];
get_find_type_quest_id({4, 5}) -> [20407];
get_find_type_quest_id({6, 5}) -> [20408];
get_find_type_quest_id({1, 6}) -> [20500, 20503, 20506];
get_find_type_quest_id({2, 6}) -> [20501];
get_find_type_quest_id({3, 6}) -> [20504];
get_find_type_quest_id({5, 6}) -> [20505];
get_find_type_quest_id({4, 6}) -> [20507];
get_find_type_quest_id({6, 6}) -> [20508];
get_find_type_quest_id({1, 7}) -> [20600, 20603, 20606];
get_find_type_quest_id({2, 7}) -> [20601];
get_find_type_quest_id({3, 7}) -> [20604];
get_find_type_quest_id({5, 7}) -> [20605];
get_find_type_quest_id({4, 7}) -> [20607];
get_find_type_quest_id({6, 7}) -> [20608];
get_find_type_quest_id(_Type) -> [].

get_find_type(20000) -> 1;
get_find_type(20001) -> 2;
get_find_type(20003) -> 1;
get_find_type(20004) -> 3;
get_find_type(20005) -> 5;
get_find_type(20006) -> 1;
get_find_type(20007) -> 4;
get_find_type(20008) -> 6;
get_find_type(20100) -> 1;
get_find_type(20101) -> 2;
get_find_type(20103) -> 1;
get_find_type(20104) -> 3;
get_find_type(20105) -> 5;
get_find_type(20106) -> 1;
get_find_type(20107) -> 4;
get_find_type(20108) -> 6;
get_find_type(20200) -> 1;
get_find_type(20201) -> 2;
get_find_type(20203) -> 1;
get_find_type(20204) -> 3;
get_find_type(20205) -> 5;
get_find_type(20206) -> 1;
get_find_type(20207) -> 4;
get_find_type(20208) -> 6;
get_find_type(20300) -> 1;
get_find_type(20301) -> 2;
get_find_type(20303) -> 1;
get_find_type(20304) -> 3;
get_find_type(20305) -> 5;
get_find_type(20306) -> 1;
get_find_type(20307) -> 4;
get_find_type(20308) -> 6;
get_find_type(20400) -> 1;
get_find_type(20401) -> 2;
get_find_type(20403) -> 1;
get_find_type(20404) -> 3;
get_find_type(20405) -> 5;
get_find_type(20406) -> 1;
get_find_type(20407) -> 4;
get_find_type(20408) -> 6;
get_find_type(20500) -> 1;
get_find_type(20501) -> 2;
get_find_type(20503) -> 1;
get_find_type(20504) -> 3;
get_find_type(20505) -> 5;
get_find_type(20506) -> 1;
get_find_type(20507) -> 4;
get_find_type(20508) -> 6;
get_find_type(20600) -> 1;
get_find_type(20601) -> 2;
get_find_type(20603) -> 1;
get_find_type(20604) -> 3;
get_find_type(20605) -> 5;
get_find_type(20606) -> 1;
get_find_type(20607) -> 4;
get_find_type(20608) -> 6;
get_find_type(_QuestId) -> false.

get_quest_type(20000) -> 6;
get_quest_type(20001) -> 6;
get_quest_type(20003) -> 6;
get_quest_type(20004) -> 6;
get_quest_type(20005) -> 6;
get_quest_type(20006) -> 6;
get_quest_type(20007) -> 6;
get_quest_type(20008) -> 6;
get_quest_type(20021) -> 4;
get_quest_type(20022) -> 4;
get_quest_type(20023) -> 4;
get_quest_type(20024) -> 4;
get_quest_type(20025) -> 4;
get_quest_type(20026) -> 4;
get_quest_type(20027) -> 4;
get_quest_type(20028) -> 4;
get_quest_type(20029) -> 4;
get_quest_type(20030) -> 4;
get_quest_type(20031) -> 4;
get_quest_type(20050) -> 7;
get_quest_type(20051) -> 7;
get_quest_type(20052) -> 7;
get_quest_type(20053) -> 7;
get_quest_type(20054) -> 7;
get_quest_type(20055) -> 7;
get_quest_type(20060) -> 3;
get_quest_type(20061) -> 3;
get_quest_type(20062) -> 3;
get_quest_type(20063) -> 3;
get_quest_type(20064) -> 3;
get_quest_type(20070) -> 1;
get_quest_type(20071) -> 1;
get_quest_type(20072) -> 1;
get_quest_type(20073) -> 1;
get_quest_type(20074) -> 1;
get_quest_type(20075) -> 1;
get_quest_type(20076) -> 1;
get_quest_type(20080) -> 2;
get_quest_type(20081) -> 1;
get_quest_type(20082) -> 1;
get_quest_type(20083) -> 1;
get_quest_type(20084) -> 2;
get_quest_type(20085) -> 2;
get_quest_type(20090) -> 9;
get_quest_type(20091) -> 9;
get_quest_type(20092) -> 9;
get_quest_type(20093) -> 9;
get_quest_type(20100) -> 6;
get_quest_type(20101) -> 6;
get_quest_type(20103) -> 6;
get_quest_type(20104) -> 6;
get_quest_type(20105) -> 6;
get_quest_type(20106) -> 6;
get_quest_type(20107) -> 6;
get_quest_type(20108) -> 6;
get_quest_type(20121) -> 4;
get_quest_type(20122) -> 4;
get_quest_type(20123) -> 4;
get_quest_type(20124) -> 4;
get_quest_type(20125) -> 4;
get_quest_type(20126) -> 4;
get_quest_type(20127) -> 4;
get_quest_type(20128) -> 4;
get_quest_type(20129) -> 4;
get_quest_type(20130) -> 4;
get_quest_type(20131) -> 4;
get_quest_type(20150) -> 7;
get_quest_type(20151) -> 7;
get_quest_type(20152) -> 7;
get_quest_type(20153) -> 7;
get_quest_type(20154) -> 7;
get_quest_type(20155) -> 7;
get_quest_type(20160) -> 3;
get_quest_type(20161) -> 3;
get_quest_type(20162) -> 3;
get_quest_type(20163) -> 3;
get_quest_type(20164) -> 3;
get_quest_type(20170) -> 1;
get_quest_type(20171) -> 1;
get_quest_type(20172) -> 1;
get_quest_type(20173) -> 1;
get_quest_type(20174) -> 1;
get_quest_type(20175) -> 1;
get_quest_type(20176) -> 1;
get_quest_type(20180) -> 2;
get_quest_type(20181) -> 1;
get_quest_type(20182) -> 1;
get_quest_type(20183) -> 1;
get_quest_type(20184) -> 2;
get_quest_type(20185) -> 2;
get_quest_type(20190) -> 9;
get_quest_type(20191) -> 9;
get_quest_type(20192) -> 9;
get_quest_type(20193) -> 9;
get_quest_type(20200) -> 6;
get_quest_type(20201) -> 6;
get_quest_type(20203) -> 6;
get_quest_type(20204) -> 6;
get_quest_type(20205) -> 6;
get_quest_type(20206) -> 6;
get_quest_type(20207) -> 6;
get_quest_type(20208) -> 6;
get_quest_type(20221) -> 4;
get_quest_type(20222) -> 4;
get_quest_type(20223) -> 4;
get_quest_type(20224) -> 4;
get_quest_type(20225) -> 4;
get_quest_type(20226) -> 4;
get_quest_type(20227) -> 4;
get_quest_type(20228) -> 4;
get_quest_type(20229) -> 4;
get_quest_type(20230) -> 4;
get_quest_type(20231) -> 4;
get_quest_type(20250) -> 7;
get_quest_type(20251) -> 7;
get_quest_type(20252) -> 7;
get_quest_type(20253) -> 7;
get_quest_type(20254) -> 7;
get_quest_type(20255) -> 7;
get_quest_type(20260) -> 3;
get_quest_type(20261) -> 3;
get_quest_type(20262) -> 3;
get_quest_type(20263) -> 3;
get_quest_type(20264) -> 3;
get_quest_type(20270) -> 1;
get_quest_type(20271) -> 1;
get_quest_type(20272) -> 1;
get_quest_type(20273) -> 1;
get_quest_type(20274) -> 1;
get_quest_type(20275) -> 1;
get_quest_type(20276) -> 1;
get_quest_type(20280) -> 2;
get_quest_type(20281) -> 1;
get_quest_type(20282) -> 1;
get_quest_type(20283) -> 1;
get_quest_type(20284) -> 2;
get_quest_type(20285) -> 2;
get_quest_type(20290) -> 9;
get_quest_type(20291) -> 9;
get_quest_type(20292) -> 9;
get_quest_type(20293) -> 9;
get_quest_type(20300) -> 6;
get_quest_type(20301) -> 6;
get_quest_type(20303) -> 6;
get_quest_type(20304) -> 6;
get_quest_type(20305) -> 6;
get_quest_type(20306) -> 6;
get_quest_type(20307) -> 6;
get_quest_type(20308) -> 6;
get_quest_type(20321) -> 4;
get_quest_type(20322) -> 4;
get_quest_type(20323) -> 4;
get_quest_type(20324) -> 4;
get_quest_type(20325) -> 4;
get_quest_type(20326) -> 4;
get_quest_type(20327) -> 4;
get_quest_type(20328) -> 4;
get_quest_type(20329) -> 4;
get_quest_type(20330) -> 4;
get_quest_type(20331) -> 4;
get_quest_type(20350) -> 7;
get_quest_type(20351) -> 7;
get_quest_type(20352) -> 7;
get_quest_type(20353) -> 7;
get_quest_type(20354) -> 7;
get_quest_type(20355) -> 7;
get_quest_type(20360) -> 3;
get_quest_type(20361) -> 3;
get_quest_type(20362) -> 3;
get_quest_type(20363) -> 3;
get_quest_type(20364) -> 3;
get_quest_type(20370) -> 1;
get_quest_type(20371) -> 1;
get_quest_type(20372) -> 1;
get_quest_type(20373) -> 1;
get_quest_type(20374) -> 1;
get_quest_type(20375) -> 1;
get_quest_type(20376) -> 1;
get_quest_type(20380) -> 2;
get_quest_type(20381) -> 1;
get_quest_type(20382) -> 1;
get_quest_type(20383) -> 1;
get_quest_type(20384) -> 2;
get_quest_type(20385) -> 2;
get_quest_type(20390) -> 9;
get_quest_type(20391) -> 9;
get_quest_type(20392) -> 9;
get_quest_type(20393) -> 9;
get_quest_type(20400) -> 6;
get_quest_type(20401) -> 6;
get_quest_type(20403) -> 6;
get_quest_type(20404) -> 6;
get_quest_type(20405) -> 6;
get_quest_type(20406) -> 6;
get_quest_type(20407) -> 6;
get_quest_type(20408) -> 6;
get_quest_type(20421) -> 4;
get_quest_type(20422) -> 4;
get_quest_type(20423) -> 4;
get_quest_type(20424) -> 4;
get_quest_type(20425) -> 4;
get_quest_type(20426) -> 4;
get_quest_type(20427) -> 4;
get_quest_type(20428) -> 4;
get_quest_type(20429) -> 4;
get_quest_type(20430) -> 4;
get_quest_type(20431) -> 4;
get_quest_type(20450) -> 7;
get_quest_type(20451) -> 7;
get_quest_type(20452) -> 7;
get_quest_type(20453) -> 7;
get_quest_type(20454) -> 7;
get_quest_type(20455) -> 7;
get_quest_type(20460) -> 3;
get_quest_type(20461) -> 3;
get_quest_type(20462) -> 3;
get_quest_type(20463) -> 3;
get_quest_type(20464) -> 3;
get_quest_type(20470) -> 1;
get_quest_type(20471) -> 1;
get_quest_type(20472) -> 1;
get_quest_type(20473) -> 1;
get_quest_type(20474) -> 1;
get_quest_type(20475) -> 1;
get_quest_type(20476) -> 1;
get_quest_type(20480) -> 2;
get_quest_type(20481) -> 1;
get_quest_type(20482) -> 1;
get_quest_type(20483) -> 1;
get_quest_type(20484) -> 2;
get_quest_type(20485) -> 2;
get_quest_type(20490) -> 9;
get_quest_type(20491) -> 9;
get_quest_type(20492) -> 9;
get_quest_type(20493) -> 9;
get_quest_type(20500) -> 6;
get_quest_type(20501) -> 6;
get_quest_type(20503) -> 6;
get_quest_type(20504) -> 6;
get_quest_type(20505) -> 6;
get_quest_type(20506) -> 6;
get_quest_type(20507) -> 6;
get_quest_type(20508) -> 6;
get_quest_type(20521) -> 4;
get_quest_type(20522) -> 4;
get_quest_type(20523) -> 4;
get_quest_type(20524) -> 4;
get_quest_type(20525) -> 4;
get_quest_type(20526) -> 4;
get_quest_type(20527) -> 4;
get_quest_type(20528) -> 4;
get_quest_type(20529) -> 4;
get_quest_type(20530) -> 4;
get_quest_type(20531) -> 4;
get_quest_type(20550) -> 7;
get_quest_type(20551) -> 7;
get_quest_type(20552) -> 7;
get_quest_type(20553) -> 7;
get_quest_type(20554) -> 7;
get_quest_type(20555) -> 7;
get_quest_type(20560) -> 3;
get_quest_type(20561) -> 3;
get_quest_type(20562) -> 3;
get_quest_type(20563) -> 3;
get_quest_type(20564) -> 3;
get_quest_type(20570) -> 1;
get_quest_type(20571) -> 1;
get_quest_type(20572) -> 1;
get_quest_type(20573) -> 1;
get_quest_type(20574) -> 1;
get_quest_type(20575) -> 1;
get_quest_type(20576) -> 1;
get_quest_type(20580) -> 2;
get_quest_type(20581) -> 1;
get_quest_type(20582) -> 1;
get_quest_type(20583) -> 1;
get_quest_type(20584) -> 2;
get_quest_type(20585) -> 2;
get_quest_type(20590) -> 9;
get_quest_type(20591) -> 9;
get_quest_type(20592) -> 9;
get_quest_type(20593) -> 9;
get_quest_type(20600) -> 6;
get_quest_type(20601) -> 6;
get_quest_type(20603) -> 6;
get_quest_type(20604) -> 6;
get_quest_type(20605) -> 6;
get_quest_type(20606) -> 6;
get_quest_type(20607) -> 6;
get_quest_type(20608) -> 6;
get_quest_type(20621) -> 4;
get_quest_type(20622) -> 4;
get_quest_type(20623) -> 4;
get_quest_type(20624) -> 4;
get_quest_type(20625) -> 4;
get_quest_type(20626) -> 4;
get_quest_type(20627) -> 4;
get_quest_type(20628) -> 4;
get_quest_type(20629) -> 4;
get_quest_type(20630) -> 4;
get_quest_type(20631) -> 4;
get_quest_type(20650) -> 7;
get_quest_type(20651) -> 7;
get_quest_type(20652) -> 7;
get_quest_type(20653) -> 7;
get_quest_type(20654) -> 7;
get_quest_type(20655) -> 7;
get_quest_type(20660) -> 3;
get_quest_type(20661) -> 3;
get_quest_type(20662) -> 3;
get_quest_type(20663) -> 3;
get_quest_type(20664) -> 3;
get_quest_type(20670) -> 1;
get_quest_type(20671) -> 1;
get_quest_type(20672) -> 1;
get_quest_type(20673) -> 1;
get_quest_type(20674) -> 1;
get_quest_type(20675) -> 1;
get_quest_type(20676) -> 1;
get_quest_type(20680) -> 2;
get_quest_type(20681) -> 1;
get_quest_type(20682) -> 1;
get_quest_type(20683) -> 1;
get_quest_type(20684) -> 2;
get_quest_type(20685) -> 2;
get_quest_type(20690) -> 9;
get_quest_type(20691) -> 9;
get_quest_type(20692) -> 9;
get_quest_type(20693) -> 9;
get_quest_type(_QuestId) -> false.

