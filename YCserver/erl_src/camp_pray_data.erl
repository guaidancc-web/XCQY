-file("src/data/camp_pray_data.erl", 1).

-module(camp_pray_data).

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

-file("src/data/camp_pray_data.erl", 12).

-export([pool_info/0,
         get/1,
         get_key_value_1/1,
         get_key_value_2/1]).

pool_info() -> [{1, 1}, {2, 1}, {3, 2}, {4, 3}, {5, 3}].

get(1) ->
    #{id => 1, pool_id => 1, item_id => 22205, count => 1,
      bind => 0, min_lev => 1, max_lev => 200, sex => 2,
      classes => 0, ratio => 10, must_no => 10,
      must_do => 150, is_cast => 1};
get(2) ->
    #{id => 2, pool_id => 1, item_id => 22448, count => 1,
      bind => 0, min_lev => 1, max_lev => 200, sex => 2,
      classes => 0, ratio => 10, must_no => 10,
      must_do => 150, is_cast => 1};
get(3) ->
    #{id => 3, pool_id => 1, item_id => 20638, count => 1,
      bind => 0, min_lev => 1, max_lev => 200, sex => 2,
      classes => 0, ratio => 10, must_no => 10,
      must_do => 150, is_cast => 1};
get(4) ->
    #{id => 4, pool_id => 1, item_id => 20704, count => 1,
      bind => 0, min_lev => 1, max_lev => 200, sex => 2,
      classes => 0, ratio => 10, must_no => 10,
      must_do => 150, is_cast => 1};
get(5) ->
    #{id => 5, pool_id => 1, item_id => 21245, count => 1,
      bind => 0, min_lev => 1, max_lev => 89, sex => 2,
      classes => 0, ratio => 10, must_no => 10,
      must_do => 150, is_cast => 1};
get(6) ->
    #{id => 6, pool_id => 1, item_id => 21257, count => 1,
      bind => 0, min_lev => 90, max_lev => 200, sex => 2,
      classes => 0, ratio => 10, must_no => 10,
      must_do => 150, is_cast => 1};
get(7) ->
    #{id => 7, pool_id => 2, item_id => 70386, count => 1,
      bind => 0, min_lev => 1, max_lev => 200, sex => 2,
      classes => 1, ratio => 30, must_no => 5, must_do => 0,
      is_cast => 1};
get(8) ->
    #{id => 8, pool_id => 2, item_id => 70387, count => 1,
      bind => 0, min_lev => 1, max_lev => 200, sex => 2,
      classes => 2, ratio => 30, must_no => 5, must_do => 0,
      is_cast => 1};
get(9) ->
    #{id => 9, pool_id => 2, item_id => 70388, count => 1,
      bind => 0, min_lev => 1, max_lev => 200, sex => 2,
      classes => 3, ratio => 30, must_no => 5, must_do => 0,
      is_cast => 1};
get(10) ->
    #{id => 10, pool_id => 2, item_id => 70389, count => 1,
      bind => 0, min_lev => 1, max_lev => 200, sex => 2,
      classes => 4, ratio => 30, must_no => 5, must_do => 0,
      is_cast => 1};
get(11) ->
    #{id => 11, pool_id => 2, item_id => 70390, count => 1,
      bind => 0, min_lev => 1, max_lev => 200, sex => 2,
      classes => 5, ratio => 30, must_no => 5, must_do => 0,
      is_cast => 1};
get(12) ->
    #{id => 12, pool_id => 2, item_id => 70391, count => 1,
      bind => 0, min_lev => 1, max_lev => 200, sex => 2,
      classes => 6, ratio => 30, must_no => 5, must_do => 0,
      is_cast => 1};
get(13) ->
    #{id => 13, pool_id => 2, item_id => 70392, count => 1,
      bind => 0, min_lev => 1, max_lev => 200, sex => 2,
      classes => 7, ratio => 30, must_no => 5, must_do => 0,
      is_cast => 1};
get(14) ->
    #{id => 14, pool_id => 2, item_id => 70787, count => 1,
      bind => 0, min_lev => 1, max_lev => 200, sex => 2,
      classes => 1, ratio => 30, must_no => 5, must_do => 0,
      is_cast => 1};
get(15) ->
    #{id => 15, pool_id => 2, item_id => 70788, count => 1,
      bind => 0, min_lev => 1, max_lev => 200, sex => 2,
      classes => 2, ratio => 30, must_no => 5, must_do => 0,
      is_cast => 1};
get(16) ->
    #{id => 16, pool_id => 2, item_id => 70789, count => 1,
      bind => 0, min_lev => 1, max_lev => 200, sex => 2,
      classes => 3, ratio => 30, must_no => 5, must_do => 0,
      is_cast => 1};
get(17) ->
    #{id => 17, pool_id => 2, item_id => 70790, count => 1,
      bind => 0, min_lev => 1, max_lev => 200, sex => 2,
      classes => 4, ratio => 30, must_no => 5, must_do => 0,
      is_cast => 1};
get(18) ->
    #{id => 18, pool_id => 2, item_id => 70791, count => 1,
      bind => 0, min_lev => 1, max_lev => 200, sex => 2,
      classes => 5, ratio => 30, must_no => 5, must_do => 0,
      is_cast => 1};
get(19) ->
    #{id => 19, pool_id => 2, item_id => 70792, count => 1,
      bind => 0, min_lev => 1, max_lev => 200, sex => 2,
      classes => 6, ratio => 30, must_no => 5, must_do => 0,
      is_cast => 1};
get(20) ->
    #{id => 20, pool_id => 2, item_id => 70793, count => 1,
      bind => 0, min_lev => 1, max_lev => 200, sex => 2,
      classes => 7, ratio => 30, must_no => 5, must_do => 0,
      is_cast => 1};
get(21) ->
    #{id => 21, pool_id => 2, item_id => 70422, count => 1,
      bind => 0, min_lev => 1, max_lev => 200, sex => 0,
      classes => 0, ratio => 30, must_no => 5, must_do => 0,
      is_cast => 1};
get(22) ->
    #{id => 22, pool_id => 2, item_id => 70426, count => 1,
      bind => 0, min_lev => 1, max_lev => 200, sex => 1,
      classes => 0, ratio => 30, must_no => 5, must_do => 0,
      is_cast => 1};
get(23) ->
    #{id => 23, pool_id => 2, item_id => 26003, count => 1,
      bind => 0, min_lev => 1, max_lev => 200, sex => 0,
      classes => 0, ratio => 30, must_no => 5, must_do => 0,
      is_cast => 1};
get(24) ->
    #{id => 24, pool_id => 2, item_id => 26006, count => 1,
      bind => 0, min_lev => 1, max_lev => 200, sex => 1,
      classes => 0, ratio => 30, must_no => 5, must_do => 0,
      is_cast => 1};
get(25) ->
    #{id => 25, pool_id => 2, item_id => 21217, count => 1,
      bind => 0, min_lev => 1, max_lev => 200, sex => 2,
      classes => 0, ratio => 30, must_no => 5, must_do => 0,
      is_cast => 1};
get(26) ->
    #{id => 26, pool_id => 2, item_id => 21190, count => 1,
      bind => 0, min_lev => 1, max_lev => 200, sex => 2,
      classes => 0, ratio => 30, must_no => 5, must_do => 0,
      is_cast => 1};
get(27) ->
    #{id => 27, pool_id => 3, item_id => 29527, count => 1,
      bind => 0, min_lev => 1, max_lev => 200, sex => 2,
      classes => 0, ratio => 60, must_no => 5, must_do => 0,
      max_times => 5, is_cast => 1};
get(28) ->
    #{id => 28, pool_id => 3, item_id => 29650, count => 1,
      bind => 0, min_lev => 1, max_lev => 200, sex => 2,
      classes => 0, ratio => 60, must_no => 5, must_do => 0,
      max_times => 5, is_cast => 1};
get(29) ->
    #{id => 29, pool_id => 3, item_id => 20617, count => 1,
      bind => 0, min_lev => 1, max_lev => 200, sex => 2,
      classes => 0, ratio => 60, must_no => 0, must_do => 0,
      is_cast => 1};
get(30) ->
    #{id => 30, pool_id => 3, item_id => 23119, count => 1,
      bind => 0, min_lev => 1, max_lev => 200, sex => 2,
      classes => 0, ratio => 60, must_no => 0, must_do => 0,
      is_cast => 1};
get(31) ->
    #{id => 31, pool_id => 3, item_id => 29041, count => 1,
      bind => 0, min_lev => 1, max_lev => 200, sex => 2,
      classes => 0, ratio => 60, must_no => 0, must_do => 0,
      is_cast => 0};
get(32) ->
    #{id => 32, pool_id => 3, item_id => 29101, count => 3,
      bind => 0, min_lev => 1, max_lev => 200, sex => 2,
      classes => 0, ratio => 60, must_no => 0, must_do => 0,
      is_cast => 0};
get(33) ->
    #{id => 33, pool_id => 4, item_id => 22449, count => 1,
      bind => 0, min_lev => 1, max_lev => 200, sex => 2,
      classes => 0, ratio => 200, must_no => 0, must_do => 0,
      is_cast => 0};
get(34) ->
    #{id => 34, pool_id => 4, item_id => 23740, count => 1,
      bind => 0, min_lev => 1, max_lev => 200, sex => 2,
      classes => 0, ratio => 200, must_no => 0, must_do => 0,
      is_cast => 0};
get(35) ->
    #{id => 35, pool_id => 4, item_id => 20076, count => 1,
      bind => 0, min_lev => 1, max_lev => 200, sex => 2,
      classes => 0, ratio => 200, must_no => 0, must_do => 0,
      is_cast => 0};
get(36) ->
    #{id => 36, pool_id => 4, item_id => 22300, count => 1,
      bind => 0, min_lev => 1, max_lev => 200, sex => 2,
      classes => 0, ratio => 200, must_no => 0, must_do => 0,
      is_cast => 0};
get(37) ->
    #{id => 37, pool_id => 4, item_id => 20755, count => 1,
      bind => 0, min_lev => 1, max_lev => 200, sex => 2,
      classes => 0, ratio => 200, must_no => 0, must_do => 0,
      is_cast => 0};
get(38) ->
    #{id => 38, pool_id => 4, item_id => 29314, count => 1,
      bind => 0, min_lev => 1, max_lev => 200, sex => 2,
      classes => 0, ratio => 200, must_no => 0, must_do => 0,
      is_cast => 0};
get(39) ->
    #{id => 39, pool_id => 5, item_id => 20006, count => 40,
      bind => 0, min_lev => 1, max_lev => 200, sex => 2,
      classes => 0, ratio => 700, must_no => 0, must_do => 0,
      is_cast => 0};
get(40) ->
    #{id => 40, pool_id => 5, item_id => 22585, count => 1,
      bind => 0, min_lev => 1, max_lev => 200, sex => 2,
      classes => 0, ratio => 700, must_no => 0, must_do => 0,
      is_cast => 0};
get(41) ->
    #{id => 41, pool_id => 5, item_id => 20025, count => 6,
      bind => 0, min_lev => 1, max_lev => 200, sex => 2,
      classes => 0, ratio => 700, must_no => 0, must_do => 0,
      is_cast => 0};
get(42) ->
    #{id => 42, pool_id => 5, item_id => 90026,
      count => 180, bind => 0, min_lev => 1, max_lev => 200,
      sex => 2, classes => 0, ratio => 700, must_no => 0,
      must_do => 0, is_cast => 0};
get(43) ->
    #{id => 43, pool_id => 5, item_id => 20087, count => 2,
      bind => 0, min_lev => 1, max_lev => 200, sex => 2,
      classes => 0, ratio => 700, must_no => 0, must_do => 0,
      is_cast => 0};
get(44) ->
    #{id => 44, pool_id => 5, item_id => 20020, count => 8,
      bind => 0, min_lev => 1, max_lev => 200, sex => 2,
      classes => 0, ratio => 700, must_no => 0, must_do => 0,
      is_cast => 0};
get(_Id) -> false.

get_key_value_1(1) -> 3;
get_key_value_1(2) -> 71530;
get_key_value_1(3) -> [{90002, 120}];
get_key_value_1(9) -> [{90002, 1200}];
get_key_value_1(4) -> [{90002, 240}];
get_key_value_1(5) -> [{90071, 5}];
get_key_value_1(10) -> 100;
get_key_value_1(_) -> false.

get_key_value_2(6) -> lang:get("祈愿福阁");
get_key_value_2(7) -> lang:get("背包已满,奖励已通过邮件发放,请查收:");
get_key_value_2(8) ->
    lang:get("~ts在祈愿福阁中许下愿望,竟然获得了~ts");
get_key_value_2(_) -> false.

