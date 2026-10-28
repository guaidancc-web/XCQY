-file("src/data/world_lev_data.erl", 1).

-module(world_lev_data).

-export([get/1, get_ratio/1, get_keep_by_lev/1]).

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

-file("src/data/world_lev_data.erl", 16).

get(1) -> #{lev => 35, keep => 1, flag => 0};
get(2) -> #{lev => 40, keep => 1, flag => 0};
get(3) -> #{lev => 45, keep => 2, flag => 0};
get(4) -> #{lev => 50, keep => 3, flag => 0};
get(5) -> #{lev => 55, keep => 4, flag => 0};
get(6) -> #{lev => 60, keep => 6, flag => 0};
get(7) -> #{lev => 65, keep => 9, flag => 0};
get(8) -> #{lev => 70, keep => 13, flag => 0};
get(9) -> #{lev => 75, keep => 18, flag => 0};
get(10) -> #{lev => 80, keep => 24, flag => 0};
get(11) -> #{lev => 85, keep => 30, flag => 0};
get(12) -> #{lev => 90, keep => 37, flag => 0};
get(13) -> #{lev => 95, keep => 999, flag => 1};
get(14) -> #{lev => 100, keep => 100, flag => 0};
get(15) -> #{lev => 105, keep => 100, flag => 0};
get(16) -> #{lev => 110, keep => 120, flag => 0};
get(17) -> #{lev => 115, keep => 150, flag => 0};
get(18) -> #{lev => 120, keep => 180, flag => 0};
get(19) -> #{lev => 125, keep => 999, flag => 1};
get(_) -> false.

get_ratio(Day) when Day >= -100 andalso Day =< -20 ->
    {2000, 0};
get_ratio(Day) when Day >= -19 andalso Day =< -19 ->
    {1950, 0};
get_ratio(Day) when Day >= -18 andalso Day =< -18 ->
    {1900, 0};
get_ratio(Day) when Day >= -17 andalso Day =< -17 ->
    {1850, 0};
get_ratio(Day) when Day >= -16 andalso Day =< -16 ->
    {1800, 0};
get_ratio(Day) when Day >= -15 andalso Day =< -15 ->
    {1750, 0};
get_ratio(Day) when Day >= -14 andalso Day =< -14 ->
    {1700, 0};
get_ratio(Day) when Day >= -13 andalso Day =< -13 ->
    {1650, 0};
get_ratio(Day) when Day >= -12 andalso Day =< -12 ->
    {1600, 0};
get_ratio(Day) when Day >= -11 andalso Day =< -11 ->
    {1550, 0};
get_ratio(Day) when Day >= -10 andalso Day =< -10 ->
    {1500, 0};
get_ratio(Day) when Day >= -9 andalso Day =< -9 ->
    {1450, 0};
get_ratio(Day) when Day >= -8 andalso Day =< -8 ->
    {1400, 0};
get_ratio(Day) when Day >= -7 andalso Day =< -7 ->
    {1350, 0};
get_ratio(Day) when Day >= -6 andalso Day =< -6 ->
    {1300, 0};
get_ratio(Day) when Day >= -5 andalso Day =< -5 ->
    {1250, 0};
get_ratio(Day) when Day >= -4 andalso Day =< -4 ->
    {1200, 0};
get_ratio(Day) when Day >= -3 andalso Day =< -3 ->
    {1150, 0};
get_ratio(Day) when Day >= -2 andalso Day =< -2 ->
    {1100, 0};
get_ratio(Day) when Day >= -1 andalso Day =< -1 ->
    {1050, 0};
get_ratio(Day) when Day >= 0 andalso Day =< 1 ->
    {920, 0};
get_ratio(Day) when Day >= 2 andalso Day =< 2 ->
    {820, 0};
get_ratio(Day) when Day >= 3 andalso Day =< 3 ->
    {720, 0};
get_ratio(Day) when Day >= 4 andalso Day =< 4 ->
    {630, 0};
get_ratio(Day) when Day >= 5 andalso Day =< 5 ->
    {540, 0};
get_ratio(Day) when Day >= 6 andalso Day =< 6 ->
    {430, 0};
get_ratio(Day) when Day >= 7 andalso Day =< 7 ->
    {370, 0};
get_ratio(Day) when Day >= 8 andalso Day =< 200 ->
    {0, 500};
get_ratio(_) -> {0, 0}.

get_keep_by_lev(35) -> 1;
get_keep_by_lev(40) -> 1;
get_keep_by_lev(45) -> 2;
get_keep_by_lev(50) -> 3;
get_keep_by_lev(55) -> 4;
get_keep_by_lev(60) -> 6;
get_keep_by_lev(65) -> 9;
get_keep_by_lev(70) -> 13;
get_keep_by_lev(75) -> 18;
get_keep_by_lev(80) -> 24;
get_keep_by_lev(85) -> 30;
get_keep_by_lev(90) -> 37;
get_keep_by_lev(95) -> 999;
get_keep_by_lev(100) -> 100;
get_keep_by_lev(105) -> 100;
get_keep_by_lev(110) -> 120;
get_keep_by_lev(115) -> 150;
get_keep_by_lev(120) -> 180;
get_keep_by_lev(125) -> 999;
get_keep_by_lev(_Lev) -> false.

