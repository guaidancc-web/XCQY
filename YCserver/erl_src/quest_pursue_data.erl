-file("src/data/quest_pursue_data.erl", 1).

-module(quest_pursue_data).

-export([list/0,
         get_lev/1,
         get_ring/1,
         get_patrol/1,
         get_classify/0,
         get_item_list/0,
         get_find_type_quest_id/1,
         get_find_type/1,
         get_cost/1]).

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

-file("src/data/quest_pursue_data.erl", 22).

list() ->
    [#{id => 35000, weight => 100, type => 1,
       in_round => [1, 4, 6, 9]},
     #{id => 35010, weight => 100, type => 1,
       in_round => [2, 5, 7, 10]},
     #{id => 35020, weight => 100, type => 1,
       in_round => [1, 3, 6, 8]},
     #{id => 35030, weight => 100, type => 1,
       in_round => [2, 4, 7, 9]},
     #{id => 35040, weight => 100, type => 1,
       in_round => [3, 5, 8, 10]}].

get_lev(65) -> {300000, 0};
get_lev(66) -> {300000, 0};
get_lev(67) -> {300000, 0};
get_lev(68) -> {300000, 0};
get_lev(69) -> {300000, 0};
get_lev(70) -> {500000, 0};
get_lev(71) -> {500000, 0};
get_lev(72) -> {500000, 0};
get_lev(73) -> {500000, 0};
get_lev(74) -> {500000, 0};
get_lev(75) -> {500000, 0};
get_lev(76) -> {500000, 0};
get_lev(77) -> {500000, 0};
get_lev(78) -> {500000, 0};
get_lev(79) -> {500000, 0};
get_lev(80) -> {800000, 0};
get_lev(81) -> {800000, 0};
get_lev(82) -> {800000, 0};
get_lev(83) -> {800000, 0};
get_lev(84) -> {800000, 0};
get_lev(85) -> {800000, 0};
get_lev(86) -> {800000, 0};
get_lev(87) -> {800000, 0};
get_lev(88) -> {800000, 0};
get_lev(89) -> {800000, 0};
get_lev(90) -> {1500000, 0};
get_lev(91) -> {1500000, 0};
get_lev(92) -> {1500000, 0};
get_lev(93) -> {1500000, 0};
get_lev(94) -> {1500000, 0};
get_lev(95) -> {1500000, 0};
get_lev(96) -> {1500000, 0};
get_lev(97) -> {1500000, 0};
get_lev(98) -> {1500000, 0};
get_lev(99) -> {1500000, 0};
get_lev(100) -> {1500000, 0};
get_lev(101) -> {1500000, 0};
get_lev(102) -> {1500000, 0};
get_lev(103) -> {1500000, 0};
get_lev(104) -> {1500000, 0};
get_lev(105) -> {2000000, 0};
get_lev(106) -> {2000000, 0};
get_lev(107) -> {2000000, 0};
get_lev(108) -> {2000000, 0};
get_lev(109) -> {2000000, 0};
get_lev(110) -> {2000000, 0};
get_lev(111) -> {2000000, 0};
get_lev(112) -> {2000000, 0};
get_lev(113) -> {2000000, 0};
get_lev(114) -> {2000000, 0};
get_lev(115) -> {2500000, 0};
get_lev(116) -> {2500000, 0};
get_lev(117) -> {2500000, 0};
get_lev(118) -> {2500000, 0};
get_lev(119) -> {2500000, 0};
get_lev(120) -> {2500000, 0};
get_lev(121) -> {2500000, 0};
get_lev(122) -> {2500000, 0};
get_lev(123) -> {2500000, 0};
get_lev(124) -> {2500000, 0};
get_lev(125) -> {3000000, 0};
get_lev(126) -> {3000000, 0};
get_lev(127) -> {3000000, 0};
get_lev(128) -> {3000000, 0};
get_lev(129) -> {3000000, 0};
get_lev(130) -> {3000000, 0};
get_lev(131) -> {3000000, 0};
get_lev(132) -> {3000000, 0};
get_lev(133) -> {3000000, 0};
get_lev(134) -> {3000000, 0};
get_lev(135) -> {3000000, 0};
get_lev(136) -> {3000000, 0};
get_lev(_Id) -> none.

get_ring(1) -> #{round => 1, exp_ratio => 1000};
get_ring(2) -> #{round => 2, exp_ratio => 1000};
get_ring(3) -> #{round => 3, exp_ratio => 1000};
get_ring(4) -> #{round => 4, exp_ratio => 1000};
get_ring(5) -> #{round => 5, exp_ratio => 1000};
get_ring(6) -> #{round => 6, exp_ratio => 1000};
get_ring(7) -> #{round => 7, exp_ratio => 1000};
get_ring(8) -> #{round => 8, exp_ratio => 1000};
get_ring(9) -> #{round => 9, exp_ratio => 1000};
get_ring(10) -> #{round => 10, exp_ratio => 1000};
get_ring(_Id) -> none.

get_patrol(35030) ->
    [#{id => 35030, map_base_id => 10004,
       unit_list => [{44030, 100}], weight => 100, pcnt => 800,
       min_move_step => 8, max_move_step => 30,
       points =>
           [{1203, 742},
            {1908, 432},
            {2682, 678},
            {2836, 2035},
            {1564, 2349},
            {909, 2017}]}];
get_patrol(_) -> [].

get_classify() -> [].

get_item_list() -> [].

get_find_type_quest_id(_Type) -> false.

get_find_type(_QuestId) -> false.

get_cost(60) -> [{90000, 3000000}];
get_cost(61) -> [{90000, 3000000}];
get_cost(62) -> [{90000, 3000000}];
get_cost(63) -> [{90000, 3000000}];
get_cost(64) -> [{90000, 3000000}];
get_cost(65) -> [{90000, 3000000}];
get_cost(66) -> [{90000, 3000000}];
get_cost(67) -> [{90000, 3000000}];
get_cost(68) -> [{90000, 3000000}];
get_cost(69) -> [{90000, 3000000}];
get_cost(70) -> [{90000, 7000000}];
get_cost(71) -> [{90000, 7000000}];
get_cost(72) -> [{90000, 7000000}];
get_cost(73) -> [{90000, 7000000}];
get_cost(74) -> [{90000, 7000000}];
get_cost(75) -> [{90000, 7000000}];
get_cost(76) -> [{90000, 7000000}];
get_cost(77) -> [{90000, 7000000}];
get_cost(78) -> [{90000, 7000000}];
get_cost(79) -> [{90000, 7000000}];
get_cost(80) -> [{90000, 10000000}];
get_cost(81) -> [{90000, 10000000}];
get_cost(82) -> [{90000, 10000000}];
get_cost(83) -> [{90000, 10000000}];
get_cost(84) -> [{90000, 10000000}];
get_cost(85) -> [{90000, 10000000}];
get_cost(86) -> [{90000, 10000000}];
get_cost(87) -> [{90000, 10000000}];
get_cost(88) -> [{90000, 10000000}];
get_cost(89) -> [{90000, 10000000}];
get_cost(90) -> [{90000, 15000000}];
get_cost(91) -> [{90000, 15000000}];
get_cost(92) -> [{90000, 15000000}];
get_cost(93) -> [{90000, 15000000}];
get_cost(94) -> [{90000, 15000000}];
get_cost(95) -> [{90000, 15000000}];
get_cost(96) -> [{90000, 15000000}];
get_cost(97) -> [{90000, 15000000}];
get_cost(98) -> [{90000, 15000000}];
get_cost(99) -> [{90000, 15000000}];
get_cost(100) -> [{90000, 15000000}];
get_cost(101) -> [{90000, 15000000}];
get_cost(102) -> [{90000, 15000000}];
get_cost(103) -> [{90000, 15000000}];
get_cost(104) -> [{90000, 15000000}];
get_cost(105) -> [{90000, 15000000}];
get_cost(106) -> [{90000, 15000000}];
get_cost(107) -> [{90000, 15000000}];
get_cost(108) -> [{90000, 15000000}];
get_cost(109) -> [{90000, 15000000}];
get_cost(110) -> [{90000, 15000000}];
get_cost(111) -> [{90000, 15000000}];
get_cost(112) -> [{90000, 15000000}];
get_cost(113) -> [{90000, 15000000}];
get_cost(114) -> [{90000, 15000000}];
get_cost(115) -> [{90000, 15000000}];
get_cost(116) -> [{90000, 15000000}];
get_cost(117) -> [{90000, 15000000}];
get_cost(118) -> [{90000, 15000000}];
get_cost(119) -> [{90000, 15000000}];
get_cost(120) -> [{90000, 15000000}];
get_cost(121) -> [{90000, 15000000}];
get_cost(122) -> [{90000, 15000000}];
get_cost(123) -> [{90000, 15000000}];
get_cost(124) -> [{90000, 15000000}];
get_cost(125) -> [{90000, 15000000}];
get_cost(126) -> [{90000, 15000000}];
get_cost(127) -> [{90000, 15000000}];
get_cost(128) -> [{90000, 15000000}];
get_cost(129) -> [{90000, 15000000}];
get_cost(130) -> [{90000, 15000000}];
get_cost(131) -> [{90000, 15000000}];
get_cost(132) -> [{90000, 15000000}];
get_cost(133) -> [{90000, 15000000}];
get_cost(134) -> [{90000, 15000000}];
get_cost(135) -> [{90000, 15000000}];
get_cost(136) -> [{90000, 15000000}];
get_cost(_Lev) -> [].

