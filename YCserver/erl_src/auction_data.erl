-file("src/data/auction_data.erl", 1).

-module(auction_data).

-export([list/0, world_lev_data/1, item_data/1]).

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

-file("src/data/auction_data.erl", 14).

list() ->
    [20000,
     20001,
     20002,
     20003,
     20004,
     20005,
     20006,
     20007,
     20008,
     20009,
     20010,
     20011,
     20012,
     20013,
     20014,
     20015,
     20016,
     20017,
     20018,
     20019,
     20020,
     20021,
     20022,
     20023,
     20024,
     20025,
     20026,
     20027,
     20028,
     20029,
     20030].

world_lev_data(50) -> #{min => 10, max => 15};
world_lev_data(51) -> #{min => 11, max => 16};
world_lev_data(52) -> #{min => 12, max => 17};
world_lev_data(53) -> #{min => 13, max => 18};
world_lev_data(54) -> #{min => 14, max => 19};
world_lev_data(55) -> #{min => 15, max => 20};
world_lev_data(56) -> #{min => 16, max => 21};
world_lev_data(57) -> #{min => 17, max => 22};
world_lev_data(58) -> #{min => 18, max => 23};
world_lev_data(59) -> #{min => 19, max => 24};
world_lev_data(60) -> #{min => 20, max => 25};
world_lev_data(61) -> #{min => 21, max => 26};
world_lev_data(62) -> #{min => 22, max => 27};
world_lev_data(63) -> #{min => 23, max => 28};
world_lev_data(64) -> #{min => 24, max => 29};
world_lev_data(65) -> #{min => 25, max => 30};
world_lev_data(66) -> #{min => 26, max => 31};
world_lev_data(67) -> #{min => 27, max => 32};
world_lev_data(68) -> #{min => 28, max => 33};
world_lev_data(69) -> #{min => 29, max => 34};
world_lev_data(70) -> #{min => 30, max => 35};
world_lev_data(71) -> #{min => 31, max => 36};
world_lev_data(72) -> #{min => 32, max => 37};
world_lev_data(73) -> #{min => 33, max => 38};
world_lev_data(74) -> #{min => 34, max => 39};
world_lev_data(75) -> #{min => 35, max => 40};
world_lev_data(76) -> #{min => 36, max => 41};
world_lev_data(77) -> #{min => 37, max => 42};
world_lev_data(78) -> #{min => 38, max => 43};
world_lev_data(79) -> #{min => 39, max => 44};
world_lev_data(80) -> #{min => 40, max => 45};
world_lev_data(81) -> #{min => 41, max => 46};
world_lev_data(82) -> #{min => 42, max => 47};
world_lev_data(83) -> #{min => 43, max => 48};
world_lev_data(84) -> #{min => 44, max => 49};
world_lev_data(85) -> #{min => 45, max => 50};
world_lev_data(86) -> #{min => 46, max => 51};
world_lev_data(87) -> #{min => 47, max => 52};
world_lev_data(88) -> #{min => 48, max => 53};
world_lev_data(89) -> #{min => 49, max => 54};
world_lev_data(90) -> #{min => 50, max => 55};
world_lev_data(91) -> #{min => 51, max => 56};
world_lev_data(92) -> #{min => 52, max => 57};
world_lev_data(93) -> #{min => 53, max => 58};
world_lev_data(94) -> #{min => 54, max => 59};
world_lev_data(95) -> #{min => 55, max => 60};
world_lev_data(96) -> #{min => 56, max => 61};
world_lev_data(_) -> false.

item_data(20000) ->
    #{min => 5, max => 10, world_lev => 50, gold => 3000,
      gold_once => 100, odds => 1};
item_data(20001) ->
    #{min => 5, max => 10, world_lev => 50, gold => 3000,
      gold_once => 200, odds => 2};
item_data(20002) ->
    #{min => 5, max => 10, world_lev => 50, gold => 3000,
      gold_once => 300, odds => 3};
item_data(20003) ->
    #{min => 5, max => 10, world_lev => 50, gold => 3000,
      gold_once => 400, odds => 4};
item_data(20004) ->
    #{min => 5, max => 10, world_lev => 50, gold => 3000,
      gold_once => 500, odds => 5};
item_data(20005) ->
    #{min => 5, max => 10, world_lev => 50, gold => 3000,
      gold_once => 600, odds => 6};
item_data(20006) ->
    #{min => 5, max => 10, world_lev => 50, gold => 3000,
      gold_once => 700, odds => 7};
item_data(20007) ->
    #{min => 5, max => 10, world_lev => 50, gold => 5000,
      gold_once => 800, odds => 8};
item_data(20008) ->
    #{min => 5, max => 10, world_lev => 50, gold => 5000,
      gold_once => 900, odds => 9};
item_data(20009) ->
    #{min => 5, max => 10, world_lev => 50, gold => 5000,
      gold_once => 1000, odds => 10};
item_data(20010) ->
    #{min => 5, max => 10, world_lev => 50, gold => 5000,
      gold_once => 1000, odds => 11};
item_data(20011) ->
    #{min => 5, max => 10, world_lev => 50, gold => 5000,
      gold_once => 1000, odds => 12};
item_data(20012) ->
    #{min => 5, max => 10, world_lev => 50, gold => 5000,
      gold_once => 1000, odds => 13};
item_data(20013) ->
    #{min => 5, max => 10, world_lev => 50, gold => 5000,
      gold_once => 1000, odds => 14};
item_data(20014) ->
    #{min => 5, max => 10, world_lev => 50, gold => 5000,
      gold_once => 200, odds => 15};
item_data(20015) ->
    #{min => 5, max => 10, world_lev => 80, gold => 5000,
      gold_once => 300, odds => 16};
item_data(20016) ->
    #{min => 5, max => 10, world_lev => 81, gold => 6000,
      gold_once => 400, odds => 17};
item_data(20017) ->
    #{min => 5, max => 10, world_lev => 82, gold => 6000,
      gold_once => 500, odds => 18};
item_data(20018) ->
    #{min => 5, max => 10, world_lev => 83, gold => 6000,
      gold_once => 600, odds => 19};
item_data(20019) ->
    #{min => 5, max => 10, world_lev => 84, gold => 6000,
      gold_once => 700, odds => 20};
item_data(20020) ->
    #{min => 5, max => 10, world_lev => 85, gold => 6000,
      gold_once => 800, odds => 21};
item_data(20021) ->
    #{min => 5, max => 10, world_lev => 86, gold => 6000,
      gold_once => 900, odds => 22};
item_data(20022) ->
    #{min => 5, max => 10, world_lev => 87, gold => 6000,
      gold_once => 1000, odds => 23};
item_data(20023) ->
    #{min => 5, max => 10, world_lev => 88, gold => 6000,
      gold_once => 1000, odds => 24};
item_data(20024) ->
    #{min => 5, max => 10, world_lev => 89, gold => 6000,
      gold_once => 1000, odds => 25};
item_data(20025) ->
    #{min => 5, max => 10, world_lev => 90, gold => 6000,
      gold_once => 1000, odds => 26};
item_data(20026) ->
    #{min => 5, max => 10, world_lev => 91, gold => 6000,
      gold_once => 1000, odds => 27};
item_data(20027) ->
    #{min => 5, max => 10, world_lev => 92, gold => 6000,
      gold_once => 1000, odds => 28};
item_data(20028) ->
    #{min => 5, max => 10, world_lev => 93, gold => 6000,
      gold_once => 1000, odds => 29};
item_data(20029) ->
    #{min => 5, max => 10, world_lev => 94, gold => 6000,
      gold_once => 1000, odds => 30};
item_data(20030) ->
    #{min => 5, max => 10, world_lev => 95, gold => 6000,
      gold_once => 1000, odds => 31};
item_data(_) -> false.

