-file("src/data/quest_kill_data.erl", 1).

-module(quest_kill_data).

-export([get_lev_ratio/1,
         get_star_ratio/1,
         get_star_weight/0,
         get_quest_id/1,
         get_item_reward/0]).

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

-file("src/data/quest_kill_data.erl", 19).

get_lev_ratio(30) -> 28344000;
get_lev_ratio(31) -> 29880000;
get_lev_ratio(32) -> 30336000;
get_lev_ratio(33) -> 30792000;
get_lev_ratio(34) -> 31248000;
get_lev_ratio(35) -> 31824000;
get_lev_ratio(36) -> 32304000;
get_lev_ratio(37) -> 32760000;
get_lev_ratio(38) -> 33216000;
get_lev_ratio(39) -> 33792000;
get_lev_ratio(40) -> 34248000;
get_lev_ratio(41) -> 35664000;
get_lev_ratio(42) -> 36240000;
get_lev_ratio(43) -> 36720000;
get_lev_ratio(44) -> 37296000;
get_lev_ratio(45) -> 37752000;
get_lev_ratio(46) -> 38208000;
get_lev_ratio(47) -> 38784000;
get_lev_ratio(48) -> 39240000;
get_lev_ratio(49) -> 39816000;
get_lev_ratio(50) -> 40272000;
get_lev_ratio(51) -> 40848000;
get_lev_ratio(52) -> 41328000;
get_lev_ratio(53) -> 41904000;
get_lev_ratio(54) -> 42480000;
get_lev_ratio(55) -> 42936000;
get_lev_ratio(56) -> 44472000;
get_lev_ratio(57) -> 44928000;
get_lev_ratio(58) -> 45504000;
get_lev_ratio(59) -> 46080000;
get_lev_ratio(60) -> 46536000;
get_lev_ratio(61) -> 48072000;
get_lev_ratio(62) -> 48648000;
get_lev_ratio(63) -> 49224000;
get_lev_ratio(64) -> 49680000;
get_lev_ratio(65) -> 50256000;
get_lev_ratio(66) -> 50832000;
get_lev_ratio(67) -> 51408000;
get_lev_ratio(68) -> 51984000;
get_lev_ratio(69) -> 52560000;
get_lev_ratio(70) -> 53040000;
get_lev_ratio(71) -> 53616000;
get_lev_ratio(72) -> 54192000;
get_lev_ratio(73) -> 54768000;
get_lev_ratio(74) -> 55344000;
get_lev_ratio(75) -> 55920000;
get_lev_ratio(76) -> 56496000;
get_lev_ratio(77) -> 57072000;
get_lev_ratio(78) -> 57648000;
get_lev_ratio(79) -> 58224000;
get_lev_ratio(80) -> 58800000;
get_lev_ratio(81) -> 63216000;
get_lev_ratio(82) -> 63888000;
get_lev_ratio(83) -> 64464000;
get_lev_ratio(84) -> 65040000;
get_lev_ratio(85) -> 65616000;
get_lev_ratio(86) -> 66192000;
get_lev_ratio(87) -> 66768000;
get_lev_ratio(88) -> 67464000;
get_lev_ratio(89) -> 68040000;
get_lev_ratio(90) -> 68616000;
get_lev_ratio(91) -> 69192000;
get_lev_ratio(92) -> 69888000;
get_lev_ratio(93) -> 70464000;
get_lev_ratio(94) -> 71040000;
get_lev_ratio(95) -> 71736000;
get_lev_ratio(96) -> 72312000;
get_lev_ratio(97) -> 72888000;
get_lev_ratio(98) -> 73584000;
get_lev_ratio(99) -> 74160000;
get_lev_ratio(100) -> 74736000;
get_lev_ratio(_Lev) -> 0.

get_star_ratio(0) -> 800;
get_star_ratio(1) -> 1000;
get_star_ratio(2) -> 1150;
get_star_ratio(3) -> 1300;
get_star_ratio(4) -> 1500;
get_star_ratio(5) -> 1650;
get_star_ratio(6) -> 1800;
get_star_ratio(7) -> 2000;
get_star_ratio(8) -> 2150;
get_star_ratio(9) -> 2300;
get_star_ratio(10) -> 2500;
get_star_ratio(_Star) -> 1.

get_star_weight() -> [{1, 800}, {2, 200}].

get_quest_id(Lev) when 40 =< Lev andalso Lev =< 49 ->
    60000;
get_quest_id(Lev) when 50 =< Lev andalso Lev =< 54 ->
    60010;
get_quest_id(Lev) when 55 =< Lev andalso Lev =< 64 ->
    60020;
get_quest_id(Lev) when 65 =< Lev andalso Lev =< 74 ->
    60030;
get_quest_id(Lev) when 75 =< Lev andalso Lev =< 99 ->
    60040;
get_quest_id(_Lev) -> 0.

get_item_reward() ->
    [{200, 20006, 0, 3},
     {160, 20000, 0, 1},
     {160, 20019, 0, 2},
     {160, 20034, 0, 1},
     {160, 20052, 0, 1},
     {160, 20060, 0, 1}].

