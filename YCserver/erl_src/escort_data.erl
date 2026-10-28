-file("src/data/escort_data.erl", 1).

-module(escort_data).

-export([list/0,
         get_lev/2,
         get_unit/1,
         get_rob/2,
         list_question/0,
         get_answer/1,
         get_reward/0,
         get_finish_reward/3]).

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

-file("src/data/escort_data.erl", 21).

list() ->
    [{32000, 400},
     {32001, 300},
     {32002, 200},
     {32003, 100}].

get_unit(32000) ->
    #{mid_unit_id => [{1, 7}], box_unit_id => [79900],
      box_hp => 10, max_answer => 3};
get_unit(32001) ->
    #{mid_unit_id => [{1, 7}, {1, 13}],
      box_unit_id => [79900], box_hp => 10, max_answer => 3};
get_unit(32002) ->
    #{mid_unit_id => [{1, 7}, {1, 13}],
      box_unit_id => [79901], box_hp => 10, max_answer => 3};
get_unit(32003) ->
    #{mid_unit_id => [{1, 7}, {1, 13}],
      box_unit_id => [79901], box_hp => 10, max_answer => 3};
get_unit(_) -> false.

get_lev(32000, Lev) when Lev >= 0 andalso Lev =< 34 ->
    {15000, [{30705, 100}]};
get_lev(32000, Lev) when Lev >= 35 andalso Lev =< 54 ->
    {22500, [{30705, 100}]};
get_lev(32000, Lev) when Lev >= 55 andalso Lev =< 64 ->
    {45000, [{30705, 100}]};
get_lev(32000, Lev) when Lev >= 65 andalso Lev =< 99 ->
    {75000, [{30705, 100}]};
get_lev(32001, Lev) when Lev >= 0 andalso Lev =< 34 ->
    {45000, [{30710, 100}]};
get_lev(32001, Lev) when Lev >= 35 andalso Lev =< 54 ->
    {75000, [{30710, 100}]};
get_lev(32001, Lev) when Lev >= 55 andalso Lev =< 64 ->
    {150000, [{30710, 100}]};
get_lev(32001, Lev) when Lev >= 65 andalso Lev =< 99 ->
    {225000, [{30710, 100}]};
get_lev(32002, Lev) when Lev >= 0 andalso Lev =< 34 ->
    {150000, [{30712, 100}, {30714, 100}]};
get_lev(32002, Lev) when Lev >= 35 andalso Lev =< 54 ->
    {195000, [{30712, 100}, {30714, 100}]};
get_lev(32002, Lev) when Lev >= 55 andalso Lev =< 64 ->
    {225000, [{30712, 100}, {30714, 100}]};
get_lev(32002, Lev) when Lev >= 65 andalso Lev =< 99 ->
    {450000, [{30712, 100}, {30714, 100}]};
get_lev(32003, Lev) when Lev >= 0 andalso Lev =< 34 ->
    {300000, [{30716, 100}, {30717, 100}]};
get_lev(32003, Lev) when Lev >= 35 andalso Lev =< 54 ->
    {375000, [{30716, 100}, {30717, 100}]};
get_lev(32003, Lev) when Lev >= 55 andalso Lev =< 64 ->
    {450000, [{30716, 100}, {30717, 100}]};
get_lev(32003, Lev) when Lev >= 65 andalso Lev =< 99 ->
    {600000, [{30716, 100}, {30717, 100}]};
get_lev(_, _) -> false.

get_rob(30705, Lev) when Lev >= 0 andalso Lev =< 34 ->
    #{base_id => 30705, min_lev => 0, max_lev => 34,
      units =>
          [{79000, 100},
           {79001, 100},
           {79002, 100},
           {79003, 100},
           {79004, 100},
           {79005, 100}],
      maps => [10001, 10002, 10003, 10004, 10007],
      min_trigger => 1, max_trigger => 2, odds => 5,
      mod_id => 30705,
      mate_mods => [30705, 30705, 30705, 30705]};
get_rob(30705, Lev) when Lev >= 35 andalso Lev =< 44 ->
    #{base_id => 30705, min_lev => 35, max_lev => 44,
      units =>
          [{79000, 100},
           {79001, 100},
           {79002, 100},
           {79003, 100},
           {79004, 100},
           {79005, 100}],
      maps => [10001, 10002, 10003, 10004, 10007],
      min_trigger => 1, max_trigger => 2, odds => 5,
      mod_id => 30705,
      mate_mods => [30705, 30705, 30705, 30705]};
get_rob(30705, Lev) when Lev >= 45 andalso Lev =< 54 ->
    #{base_id => 30705, min_lev => 45, max_lev => 54,
      units =>
          [{79000, 100},
           {79001, 100},
           {79002, 100},
           {79003, 100},
           {79004, 100},
           {79005, 100}],
      maps => [10001, 10002, 10003, 10004, 10007],
      min_trigger => 1, max_trigger => 2, odds => 5,
      mod_id => 30705,
      mate_mods => [30705, 30705, 30705, 30705]};
get_rob(30705, Lev) when Lev >= 55 andalso Lev =< 64 ->
    #{base_id => 30705, min_lev => 55, max_lev => 64,
      units =>
          [{79000, 100},
           {79001, 100},
           {79002, 100},
           {79003, 100},
           {79004, 100},
           {79005, 100}],
      maps => [10001, 10002, 10003, 10004, 10007],
      min_trigger => 1, max_trigger => 2, odds => 5,
      mod_id => 30705,
      mate_mods => [30705, 30705, 30705, 30705]};
get_rob(30705, Lev) when Lev >= 65 andalso Lev =< 99 ->
    #{base_id => 30705, min_lev => 65, max_lev => 99,
      units =>
          [{79000, 100},
           {79001, 100},
           {79002, 100},
           {79003, 100},
           {79004, 100},
           {79005, 100}],
      maps => [10001, 10002, 10003, 10004, 10007],
      min_trigger => 1, max_trigger => 2, odds => 5,
      mod_id => 30705,
      mate_mods => [30705, 30705, 30705, 30705]};
get_rob(30710, Lev) when Lev >= 0 andalso Lev =< 34 ->
    #{base_id => 30710, min_lev => 0, max_lev => 34,
      units =>
          [{79006, 100},
           {79007, 100},
           {79008, 100},
           {79009, 100},
           {79010, 100},
           {79011, 100}],
      maps => [10001, 10002, 10003, 10004, 10007],
      min_trigger => 1, max_trigger => 2, odds => 5,
      mod_id => 30710,
      mate_mods => [30710, 30710, 30710, 30710]};
get_rob(30710, Lev) when Lev >= 35 andalso Lev =< 44 ->
    #{base_id => 30710, min_lev => 35, max_lev => 44,
      units =>
          [{79006, 100},
           {79007, 100},
           {79008, 100},
           {79009, 100},
           {79010, 100},
           {79011, 100}],
      maps => [10001, 10002, 10003, 10004, 10007],
      min_trigger => 1, max_trigger => 2, odds => 5,
      mod_id => 30710,
      mate_mods => [30710, 30710, 30710, 30710]};
get_rob(30710, Lev) when Lev >= 45 andalso Lev =< 54 ->
    #{base_id => 30710, min_lev => 45, max_lev => 54,
      units =>
          [{79006, 100},
           {79007, 100},
           {79008, 100},
           {79009, 100},
           {79010, 100},
           {79011, 100}],
      maps => [10001, 10002, 10003, 10004, 10007],
      min_trigger => 1, max_trigger => 2, odds => 5,
      mod_id => 30710,
      mate_mods => [30710, 30710, 30710, 30710]};
get_rob(30710, Lev) when Lev >= 55 andalso Lev =< 64 ->
    #{base_id => 30710, min_lev => 55, max_lev => 64,
      units =>
          [{79006, 100},
           {79007, 100},
           {79008, 100},
           {79009, 100},
           {79010, 100},
           {79011, 100}],
      maps => [10001, 10002, 10003, 10004, 10007],
      min_trigger => 1, max_trigger => 2, odds => 5,
      mod_id => 30710,
      mate_mods => [30710, 30710, 30710, 30710]};
get_rob(30710, Lev) when Lev >= 65 andalso Lev =< 99 ->
    #{base_id => 30710, min_lev => 65, max_lev => 99,
      units =>
          [{79006, 100},
           {79007, 100},
           {79008, 100},
           {79009, 100},
           {79010, 100},
           {79011, 100}],
      maps => [10001, 10002, 10003, 10004, 10007],
      min_trigger => 1, max_trigger => 2, odds => 5,
      mod_id => 30710,
      mate_mods => [30710, 30710, 30710, 30710]};
get_rob(30712, Lev) when Lev >= 0 andalso Lev =< 34 ->
    #{base_id => 30712, min_lev => 0, max_lev => 34,
      units =>
          [{79012, 100},
           {79013, 100},
           {79014, 100},
           {79015, 100},
           {79016, 100},
           {79017, 100}],
      maps => [10001, 10002, 10003, 10004, 10007],
      min_trigger => 1, max_trigger => 2, odds => 5,
      mod_id => 30712,
      mate_mods => [30712, 30712, 30712, 30712]};
get_rob(30712, Lev) when Lev >= 35 andalso Lev =< 44 ->
    #{base_id => 30712, min_lev => 35, max_lev => 44,
      units =>
          [{79012, 100},
           {79013, 100},
           {79014, 100},
           {79015, 100},
           {79016, 100},
           {79017, 100}],
      maps => [10001, 10002, 10003, 10004, 10007],
      min_trigger => 1, max_trigger => 2, odds => 5,
      mod_id => 30712,
      mate_mods => [30712, 30712, 30712, 30712]};
get_rob(30712, Lev) when Lev >= 45 andalso Lev =< 54 ->
    #{base_id => 30712, min_lev => 45, max_lev => 54,
      units =>
          [{79012, 100},
           {79013, 100},
           {79014, 100},
           {79015, 100},
           {79016, 100},
           {79017, 100}],
      maps => [10001, 10002, 10003, 10004, 10007],
      min_trigger => 1, max_trigger => 2, odds => 5,
      mod_id => 30712,
      mate_mods => [30712, 30712, 30712, 30712]};
get_rob(30712, Lev) when Lev >= 55 andalso Lev =< 64 ->
    #{base_id => 30712, min_lev => 55, max_lev => 64,
      units =>
          [{79012, 100},
           {79013, 100},
           {79014, 100},
           {79015, 100},
           {79016, 100},
           {79017, 100}],
      maps => [10001, 10002, 10003, 10004, 10007],
      min_trigger => 1, max_trigger => 2, odds => 5,
      mod_id => 30712,
      mate_mods => [30712, 30712, 30712, 30712]};
get_rob(30712, Lev) when Lev >= 65 andalso Lev =< 99 ->
    #{base_id => 30712, min_lev => 65, max_lev => 99,
      units =>
          [{79012, 100},
           {79013, 100},
           {79014, 100},
           {79015, 100},
           {79016, 100},
           {79017, 100}],
      maps => [10001, 10002, 10003, 10004, 10007],
      min_trigger => 1, max_trigger => 2, odds => 5,
      mod_id => 30712,
      mate_mods => [30712, 30712, 30712, 30712]};
get_rob(30714, Lev) when Lev >= 0 andalso Lev =< 34 ->
    #{base_id => 30714, min_lev => 0, max_lev => 34,
      units =>
          [{79012, 100},
           {79013, 100},
           {79014, 100},
           {79015, 100},
           {79016, 100},
           {79017, 100}],
      maps => [10001, 10002, 10003, 10004, 10007],
      min_trigger => 1, max_trigger => 2, odds => 5,
      mod_id => 30714,
      mate_mods => [30714, 30714, 30714, 30714]};
get_rob(30714, Lev) when Lev >= 35 andalso Lev =< 44 ->
    #{base_id => 30714, min_lev => 35, max_lev => 44,
      units =>
          [{79012, 100},
           {79013, 100},
           {79014, 100},
           {79015, 100},
           {79016, 100},
           {79017, 100}],
      maps => [10001, 10002, 10003, 10004, 10007],
      min_trigger => 1, max_trigger => 2, odds => 5,
      mod_id => 30714,
      mate_mods => [30714, 30714, 30714, 30714]};
get_rob(30714, Lev) when Lev >= 45 andalso Lev =< 54 ->
    #{base_id => 30714, min_lev => 45, max_lev => 54,
      units =>
          [{79012, 100},
           {79013, 100},
           {79014, 100},
           {79015, 100},
           {79016, 100},
           {79017, 100}],
      maps => [10001, 10002, 10003, 10004, 10007],
      min_trigger => 1, max_trigger => 2, odds => 5,
      mod_id => 30714,
      mate_mods => [30714, 30714, 30714, 30714]};
get_rob(30714, Lev) when Lev >= 55 andalso Lev =< 64 ->
    #{base_id => 30714, min_lev => 55, max_lev => 64,
      units =>
          [{79012, 100},
           {79013, 100},
           {79014, 100},
           {79015, 100},
           {79016, 100},
           {79017, 100}],
      maps => [10001, 10002, 10003, 10004, 10007],
      min_trigger => 1, max_trigger => 2, odds => 5,
      mod_id => 30714,
      mate_mods => [30714, 30714, 30714, 30714]};
get_rob(30714, Lev) when Lev >= 65 andalso Lev =< 99 ->
    #{base_id => 30714, min_lev => 65, max_lev => 99,
      units =>
          [{79012, 100},
           {79013, 100},
           {79014, 100},
           {79015, 100},
           {79016, 100},
           {79017, 100}],
      maps => [10001, 10002, 10003, 10004, 10007],
      min_trigger => 1, max_trigger => 2, odds => 5,
      mod_id => 30714,
      mate_mods => [30714, 30714, 30714, 30714]};
get_rob(30716, Lev) when Lev >= 0 andalso Lev =< 34 ->
    #{base_id => 30716, min_lev => 0, max_lev => 34,
      units =>
          [{79018, 100},
           {79019, 100},
           {79020, 100},
           {79021, 100},
           {79022, 100},
           {79023, 100}],
      maps => [10001, 10002, 10003, 10004, 10007],
      min_trigger => 1, max_trigger => 2, odds => 5,
      mod_id => 30716,
      mate_mods => [30716, 30716, 30716, 30716]};
get_rob(30716, Lev) when Lev >= 35 andalso Lev =< 44 ->
    #{base_id => 30716, min_lev => 35, max_lev => 44,
      units =>
          [{79018, 100},
           {79019, 100},
           {79020, 100},
           {79021, 100},
           {79022, 100},
           {79023, 100}],
      maps => [10001, 10002, 10003, 10004, 10007],
      min_trigger => 1, max_trigger => 2, odds => 5,
      mod_id => 30716,
      mate_mods => [30716, 30716, 30716, 30716]};
get_rob(30716, Lev) when Lev >= 45 andalso Lev =< 54 ->
    #{base_id => 30716, min_lev => 45, max_lev => 54,
      units =>
          [{79018, 100},
           {79019, 100},
           {79020, 100},
           {79021, 100},
           {79022, 100},
           {79023, 100}],
      maps => [10001, 10002, 10003, 10004, 10007],
      min_trigger => 1, max_trigger => 2, odds => 5,
      mod_id => 30716,
      mate_mods => [30716, 30716, 30716, 30716]};
get_rob(30716, Lev) when Lev >= 55 andalso Lev =< 64 ->
    #{base_id => 30716, min_lev => 55, max_lev => 64,
      units =>
          [{79018, 100},
           {79019, 100},
           {79020, 100},
           {79021, 100},
           {79022, 100},
           {79023, 100}],
      maps => [10001, 10002, 10003, 10004, 10007],
      min_trigger => 1, max_trigger => 2, odds => 5,
      mod_id => 30716,
      mate_mods => [30716, 30716, 30716, 30716]};
get_rob(30716, Lev) when Lev >= 65 andalso Lev =< 99 ->
    #{base_id => 30716, min_lev => 65, max_lev => 99,
      units =>
          [{79018, 100},
           {79019, 100},
           {79020, 100},
           {79021, 100},
           {79022, 100},
           {79023, 100}],
      maps => [10001, 10002, 10003, 10004, 10007],
      min_trigger => 1, max_trigger => 2, odds => 5,
      mod_id => 30716,
      mate_mods => [30716, 30716, 30716, 30716]};
get_rob(30717, Lev) when Lev >= 0 andalso Lev =< 34 ->
    #{base_id => 30717, min_lev => 0, max_lev => 34,
      units =>
          [{79018, 100},
           {79019, 100},
           {79020, 100},
           {79021, 100},
           {79022, 100},
           {79023, 100}],
      maps => [10001, 10002, 10003, 10004, 10007],
      min_trigger => 1, max_trigger => 2, odds => 5,
      mod_id => 30717,
      mate_mods => [30717, 30717, 30717, 30717]};
get_rob(30717, Lev) when Lev >= 35 andalso Lev =< 44 ->
    #{base_id => 30717, min_lev => 35, max_lev => 44,
      units =>
          [{79018, 100},
           {79019, 100},
           {79020, 100},
           {79021, 100},
           {79022, 100},
           {79023, 100}],
      maps => [10001, 10002, 10003, 10004, 10007],
      min_trigger => 1, max_trigger => 2, odds => 5,
      mod_id => 30717,
      mate_mods => [30717, 30717, 30717, 30717]};
get_rob(30717, Lev) when Lev >= 45 andalso Lev =< 54 ->
    #{base_id => 30717, min_lev => 45, max_lev => 54,
      units =>
          [{79018, 100},
           {79019, 100},
           {79020, 100},
           {79021, 100},
           {79022, 100},
           {79023, 100}],
      maps => [10001, 10002, 10003, 10004, 10007],
      min_trigger => 1, max_trigger => 2, odds => 5,
      mod_id => 30717,
      mate_mods => [30717, 30717, 30717, 30717]};
get_rob(30717, Lev) when Lev >= 55 andalso Lev =< 64 ->
    #{base_id => 30717, min_lev => 55, max_lev => 64,
      units =>
          [{79018, 100},
           {79019, 100},
           {79020, 100},
           {79021, 100},
           {79022, 100},
           {79023, 100}],
      maps => [10001, 10002, 10003, 10004, 10007],
      min_trigger => 1, max_trigger => 2, odds => 5,
      mod_id => 30717,
      mate_mods => [30717, 30717, 30717, 30717]};
get_rob(30717, Lev) when Lev >= 65 andalso Lev =< 99 ->
    #{base_id => 30717, min_lev => 65, max_lev => 99,
      units =>
          [{79018, 100},
           {79019, 100},
           {79020, 100},
           {79021, 100},
           {79022, 100},
           {79023, 100}],
      maps => [10001, 10002, 10003, 10004, 10007],
      min_trigger => 1, max_trigger => 2, odds => 5,
      mod_id => 30717,
      mate_mods => [30717, 30717, 30717, 30717]};
get_rob(_, _) -> false.

list_question() ->
    [1,
     10,
     11,
     12,
     13,
     14,
     15,
     16,
     17,
     18,
     19,
     2,
     20,
     21,
     22,
     23,
     24,
     25,
     26,
     27,
     28,
     29,
     3,
     30,
     31,
     32,
     33,
     34,
     35,
     36,
     37,
     38,
     39,
     4,
     40,
     41,
     42,
     43,
     44,
     45,
     5,
     6,
     7,
     8,
     9].

get_answer(1) -> 3;
get_answer(2) -> 4;
get_answer(3) -> 4;
get_answer(4) -> 4;
get_answer(5) -> 3;
get_answer(6) -> 2;
get_answer(7) -> 3;
get_answer(8) -> 3;
get_answer(9) -> 2;
get_answer(10) -> 3;
get_answer(11) -> 3;
get_answer(12) -> 3;
get_answer(13) -> 2;
get_answer(14) -> 2;
get_answer(15) -> 1;
get_answer(16) -> 3;
get_answer(17) -> 4;
get_answer(18) -> 2;
get_answer(19) -> 1;
get_answer(20) -> 3;
get_answer(21) -> 2;
get_answer(22) -> 3;
get_answer(23) -> 2;
get_answer(24) -> 1;
get_answer(25) -> 1;
get_answer(26) -> 2;
get_answer(27) -> 1;
get_answer(28) -> 4;
get_answer(29) -> 3;
get_answer(30) -> 2;
get_answer(31) -> 4;
get_answer(32) -> 2;
get_answer(33) -> 1;
get_answer(34) -> 3;
get_answer(35) -> 4;
get_answer(36) -> 1;
get_answer(37) -> 3;
get_answer(38) -> 1;
get_answer(39) -> 2;
get_answer(40) -> 2;
get_answer(41) -> 2;
get_answer(42) -> 2;
get_answer(43) -> 2;
get_answer(44) -> 4;
get_answer(45) -> 2;
get_answer(_) -> none.

get_reward() ->
    [{1, 20020, 3000},
     {1, 20021, 1500},
     {2, 22504, 1500},
     {2, 22505, 1000},
     {3, 2, 3000},
     {3, 4, 1000}].

get_finish_reward(32000, 1, Lev)
    when Lev >= 0 andalso Lev =< 34 ->
    [{90000, 1650, 100}];
get_finish_reward(32000, 1, Lev)
    when Lev >= 35 andalso Lev =< 54 ->
    [{90000, 2400, 100}];
get_finish_reward(32000, 1, Lev)
    when Lev >= 55 andalso Lev =< 64 ->
    [{90000, 2850, 100}];
get_finish_reward(32000, 1, Lev)
    when Lev >= 65 andalso Lev =< 99 ->
    [{90000, 4200, 100}];
get_finish_reward(32000, 2, Lev)
    when Lev >= 0 andalso Lev =< 34 ->
    [{90000, 1950, 100}];
get_finish_reward(32000, 2, Lev)
    when Lev >= 35 andalso Lev =< 54 ->
    [{90000, 2700, 100}];
get_finish_reward(32000, 2, Lev)
    when Lev >= 55 andalso Lev =< 64 ->
    [{90000, 3000, 100}];
get_finish_reward(32000, 2, Lev)
    when Lev >= 65 andalso Lev =< 99 ->
    [{90000, 4350, 100}];
get_finish_reward(32000, 3, Lev)
    when Lev >= 0 andalso Lev =< 34 ->
    [{90000, 2250, 100}];
get_finish_reward(32000, 3, Lev)
    when Lev >= 35 andalso Lev =< 54 ->
    [{90000, 3000, 100}];
get_finish_reward(32000, 3, Lev)
    when Lev >= 55 andalso Lev =< 64 ->
    [{90000, 3450, 100}];
get_finish_reward(32000, 3, Lev)
    when Lev >= 65 andalso Lev =< 99 ->
    [{90000, 4800, 100}];
get_finish_reward(32000, 4, Lev)
    when Lev >= 0 andalso Lev =< 34 ->
    [{90000, 2850, 100}];
get_finish_reward(32000, 4, Lev)
    when Lev >= 35 andalso Lev =< 54 ->
    [{90000, 3600, 100}];
get_finish_reward(32000, 4, Lev)
    when Lev >= 55 andalso Lev =< 64 ->
    [{90000, 3900, 100}];
get_finish_reward(32000, 4, Lev)
    when Lev >= 65 andalso Lev =< 99 ->
    [{90000, 5250, 100}];
get_finish_reward(32000, 5, Lev)
    when Lev >= 0 andalso Lev =< 34 ->
    [{90000, 3450, 100}];
get_finish_reward(32000, 5, Lev)
    when Lev >= 35 andalso Lev =< 54 ->
    [{90000, 4200, 100}];
get_finish_reward(32000, 5, Lev)
    when Lev >= 55 andalso Lev =< 64 ->
    [{90000, 4650, 100}];
get_finish_reward(32000, 5, Lev)
    when Lev >= 65 andalso Lev =< 99 ->
    [{90000, 6000, 100}];
get_finish_reward(32000, 6, Lev)
    when Lev >= 0 andalso Lev =< 34 ->
    [{90000, 4350, 100}];
get_finish_reward(32000, 6, Lev)
    when Lev >= 35 andalso Lev =< 54 ->
    [{90000, 5100, 100}];
get_finish_reward(32000, 6, Lev)
    when Lev >= 55 andalso Lev =< 64 ->
    [{90000, 5400, 100}];
get_finish_reward(32000, 6, Lev)
    when Lev >= 65 andalso Lev =< 99 ->
    [{90000, 6750, 100}];
get_finish_reward(32000, 7, Lev)
    when Lev >= 0 andalso Lev =< 34 ->
    [{90000, 5250, 100}];
get_finish_reward(32000, 7, Lev)
    when Lev >= 35 andalso Lev =< 54 ->
    [{90000, 6000, 100}];
get_finish_reward(32000, 7, Lev)
    when Lev >= 55 andalso Lev =< 64 ->
    [{90000, 6450, 100}];
get_finish_reward(32000, 7, Lev)
    when Lev >= 65 andalso Lev =< 99 ->
    [{90000, 7800, 100}];
get_finish_reward(32000, 8, Lev)
    when Lev >= 0 andalso Lev =< 34 ->
    [{90000, 6450, 100}];
get_finish_reward(32000, 8, Lev)
    when Lev >= 35 andalso Lev =< 54 ->
    [{90000, 7200, 100}];
get_finish_reward(32000, 8, Lev)
    when Lev >= 55 andalso Lev =< 64 ->
    [{90000, 7500, 100}];
get_finish_reward(32000, 8, Lev)
    when Lev >= 65 andalso Lev =< 99 ->
    [{90000, 8850, 100}];
get_finish_reward(32000, 9, Lev)
    when Lev >= 0 andalso Lev =< 34 ->
    [{90000, 7650, 100}];
get_finish_reward(32000, 9, Lev)
    when Lev >= 35 andalso Lev =< 54 ->
    [{90000, 8400, 100}];
get_finish_reward(32000, 9, Lev)
    when Lev >= 55 andalso Lev =< 64 ->
    [{90000, 8850, 100}];
get_finish_reward(32000, 9, Lev)
    when Lev >= 65 andalso Lev =< 99 ->
    [{90000, 10200, 100}];
get_finish_reward(32000, 10, Lev)
    when Lev >= 0 andalso Lev =< 34 ->
    [{90000, 9150, 100}];
get_finish_reward(32000, 10, Lev)
    when Lev >= 35 andalso Lev =< 54 ->
    [{90000, 9900, 100}];
get_finish_reward(32000, 10, Lev)
    when Lev >= 55 andalso Lev =< 64 ->
    [{90000, 10200, 100}];
get_finish_reward(32000, 10, Lev)
    when Lev >= 65 andalso Lev =< 99 ->
    [{90000, 11550, 100}];
get_finish_reward(32001, 1, Lev)
    when Lev >= 0 andalso Lev =< 34 ->
    [{90000, 2100, 100}];
get_finish_reward(32001, 1, Lev)
    when Lev >= 35 andalso Lev =< 54 ->
    [{90000, 2850, 100}];
get_finish_reward(32001, 1, Lev)
    when Lev >= 55 andalso Lev =< 64 ->
    [{90000, 3300, 100}];
get_finish_reward(32001, 1, Lev)
    when Lev >= 65 andalso Lev =< 99 ->
    [{90000, 4650, 100}];
get_finish_reward(32001, 2, Lev)
    when Lev >= 0 andalso Lev =< 34 ->
    [{90000, 2400, 100}];
get_finish_reward(32001, 2, Lev)
    when Lev >= 35 andalso Lev =< 54 ->
    [{90000, 3150, 100}];
get_finish_reward(32001, 2, Lev)
    when Lev >= 55 andalso Lev =< 64 ->
    [{90000, 3600, 100}];
get_finish_reward(32001, 2, Lev)
    when Lev >= 65 andalso Lev =< 99 ->
    [{90000, 4950, 100}];
get_finish_reward(32001, 3, Lev)
    when Lev >= 0 andalso Lev =< 34 ->
    [{90000, 3000, 100}];
get_finish_reward(32001, 3, Lev)
    when Lev >= 35 andalso Lev =< 54 ->
    [{90000, 3750, 100}];
get_finish_reward(32001, 3, Lev)
    when Lev >= 55 andalso Lev =< 64 ->
    [{90000, 4200, 100}];
get_finish_reward(32001, 3, Lev)
    when Lev >= 65 andalso Lev =< 99 ->
    [{90000, 5550, 100}];
get_finish_reward(32001, 4, Lev)
    when Lev >= 0 andalso Lev =< 34 ->
    [{90000, 3900, 100}];
get_finish_reward(32001, 4, Lev)
    when Lev >= 35 andalso Lev =< 54 ->
    [{90000, 4650, 100}];
get_finish_reward(32001, 4, Lev)
    when Lev >= 55 andalso Lev =< 64 ->
    [{90000, 5100, 100}];
get_finish_reward(32001, 4, Lev)
    when Lev >= 65 andalso Lev =< 99 ->
    [{90000, 6300, 100}];
get_finish_reward(32001, 5, Lev)
    when Lev >= 0 andalso Lev =< 34 ->
    [{90000, 5100, 100}];
get_finish_reward(32001, 5, Lev)
    when Lev >= 35 andalso Lev =< 54 ->
    [{90000, 5850, 100}];
get_finish_reward(32001, 5, Lev)
    when Lev >= 55 andalso Lev =< 64 ->
    [{90000, 6300, 100}];
get_finish_reward(32001, 5, Lev)
    when Lev >= 65 andalso Lev =< 99 ->
    [{90000, 7650, 100}];
get_finish_reward(32001, 6, Lev)
    when Lev >= 0 andalso Lev =< 34 ->
    [{90000, 6750, 100}];
get_finish_reward(32001, 6, Lev)
    when Lev >= 35 andalso Lev =< 54 ->
    [{90000, 7500, 100}];
get_finish_reward(32001, 6, Lev)
    when Lev >= 55 andalso Lev =< 64 ->
    [{90000, 7800, 100}];
get_finish_reward(32001, 6, Lev)
    when Lev >= 65 andalso Lev =< 99 ->
    [{90000, 9150, 100}];
get_finish_reward(32001, 7, Lev)
    when Lev >= 0 andalso Lev =< 34 ->
    [{90000, 8700, 100}];
get_finish_reward(32001, 7, Lev)
    when Lev >= 35 andalso Lev =< 54 ->
    [{90000, 9450, 100}];
get_finish_reward(32001, 7, Lev)
    when Lev >= 55 andalso Lev =< 64 ->
    [{90000, 9750, 100}];
get_finish_reward(32001, 7, Lev)
    when Lev >= 65 andalso Lev =< 99 ->
    [{90000, 11100, 100}];
get_finish_reward(32001, 8, Lev)
    when Lev >= 0 andalso Lev =< 34 ->
    [{90000, 11100, 100}];
get_finish_reward(32001, 8, Lev)
    when Lev >= 35 andalso Lev =< 54 ->
    [{90000, 11850, 100}];
get_finish_reward(32001, 8, Lev)
    when Lev >= 55 andalso Lev =< 64 ->
    [{90000, 12150, 100}];
get_finish_reward(32001, 8, Lev)
    when Lev >= 65 andalso Lev =< 99 ->
    [{90000, 13500, 100}];
get_finish_reward(32001, 9, Lev)
    when Lev >= 0 andalso Lev =< 34 ->
    [{90000, 13800, 100}];
get_finish_reward(32001, 9, Lev)
    when Lev >= 35 andalso Lev =< 54 ->
    [{90000, 14550, 100}];
get_finish_reward(32001, 9, Lev)
    when Lev >= 55 andalso Lev =< 64 ->
    [{90000, 15000, 100}];
get_finish_reward(32001, 9, Lev)
    when Lev >= 65 andalso Lev =< 99 ->
    [{90000, 16350, 100}];
get_finish_reward(32001, 10, Lev)
    when Lev >= 0 andalso Lev =< 34 ->
    [{90000, 17100, 100}];
get_finish_reward(32001, 10, Lev)
    when Lev >= 35 andalso Lev =< 54 ->
    [{90000, 17850, 100}];
get_finish_reward(32001, 10, Lev)
    when Lev >= 55 andalso Lev =< 64 ->
    [{90000, 18150, 100}];
get_finish_reward(32001, 10, Lev)
    when Lev >= 65 andalso Lev =< 99 ->
    [{90000, 19500, 100}];
get_finish_reward(32002, 1, Lev)
    when Lev >= 0 andalso Lev =< 34 ->
    [{90000, 2550, 100}];
get_finish_reward(32002, 1, Lev)
    when Lev >= 35 andalso Lev =< 54 ->
    [{90000, 3300, 100}];
get_finish_reward(32002, 1, Lev)
    when Lev >= 55 andalso Lev =< 64 ->
    [{90000, 3750, 100}];
get_finish_reward(32002, 1, Lev)
    when Lev >= 65 andalso Lev =< 99 ->
    [{90000, 5100, 100}];
get_finish_reward(32002, 2, Lev)
    when Lev >= 0 andalso Lev =< 34 ->
    [{90000, 3000, 100}];
get_finish_reward(32002, 2, Lev)
    when Lev >= 35 andalso Lev =< 54 ->
    [{90000, 3750, 100}];
get_finish_reward(32002, 2, Lev)
    when Lev >= 55 andalso Lev =< 64 ->
    [{90000, 4050, 100}];
get_finish_reward(32002, 2, Lev)
    when Lev >= 65 andalso Lev =< 99 ->
    [{90000, 5400, 100}];
get_finish_reward(32002, 3, Lev)
    when Lev >= 0 andalso Lev =< 34 ->
    [{90000, 3750, 100}];
get_finish_reward(32002, 3, Lev)
    when Lev >= 35 andalso Lev =< 54 ->
    [{90000, 4500, 100}];
get_finish_reward(32002, 3, Lev)
    when Lev >= 55 andalso Lev =< 64 ->
    [{90000, 4800, 100}];
get_finish_reward(32002, 3, Lev)
    when Lev >= 65 andalso Lev =< 99 ->
    [{90000, 6150, 100}];
get_finish_reward(32002, 4, Lev)
    when Lev >= 0 andalso Lev =< 34 ->
    [{90000, 4950, 100}];
get_finish_reward(32002, 4, Lev)
    when Lev >= 35 andalso Lev =< 54 ->
    [{90000, 5700, 100}];
get_finish_reward(32002, 4, Lev)
    when Lev >= 55 andalso Lev =< 64 ->
    [{90000, 6000, 100}];
get_finish_reward(32002, 4, Lev)
    when Lev >= 65 andalso Lev =< 99 ->
    [{90000, 7350, 100}];
get_finish_reward(32002, 5, Lev)
    when Lev >= 0 andalso Lev =< 34 ->
    [{90000, 6750, 100}];
get_finish_reward(32002, 5, Lev)
    when Lev >= 35 andalso Lev =< 54 ->
    [{90000, 7500, 100}];
get_finish_reward(32002, 5, Lev)
    when Lev >= 55 andalso Lev =< 64 ->
    [{90000, 7800, 100}];
get_finish_reward(32002, 5, Lev)
    when Lev >= 65 andalso Lev =< 99 ->
    [{90000, 9150, 100}];
get_finish_reward(32002, 6, Lev)
    when Lev >= 0 andalso Lev =< 34 ->
    [{90000, 9150, 100}];
get_finish_reward(32002, 6, Lev)
    when Lev >= 35 andalso Lev =< 54 ->
    [{90000, 9900, 100}];
get_finish_reward(32002, 6, Lev)
    when Lev >= 55 andalso Lev =< 64 ->
    [{90000, 10350, 100}];
get_finish_reward(32002, 6, Lev)
    when Lev >= 65 andalso Lev =< 99 ->
    [{90000, 11550, 100}];
get_finish_reward(32002, 7, Lev)
    when Lev >= 0 andalso Lev =< 34 ->
    [{90000, 12300, 100}];
get_finish_reward(32002, 7, Lev)
    when Lev >= 35 andalso Lev =< 54 ->
    [{90000, 13050, 100}];
get_finish_reward(32002, 7, Lev)
    when Lev >= 55 andalso Lev =< 64 ->
    [{90000, 13350, 100}];
get_finish_reward(32002, 7, Lev)
    when Lev >= 65 andalso Lev =< 99 ->
    [{90000, 14700, 100}];
get_finish_reward(32002, 8, Lev)
    when Lev >= 0 andalso Lev =< 34 ->
    [{90000, 16200, 100}];
get_finish_reward(32002, 8, Lev)
    when Lev >= 35 andalso Lev =< 54 ->
    [{90000, 16950, 100}];
get_finish_reward(32002, 8, Lev)
    when Lev >= 55 andalso Lev =< 64 ->
    [{90000, 17250, 100}];
get_finish_reward(32002, 8, Lev)
    when Lev >= 65 andalso Lev =< 99 ->
    [{90000, 18600, 100}];
get_finish_reward(32002, 9, Lev)
    when Lev >= 0 andalso Lev =< 34 ->
    [{90000, 20700, 100}];
get_finish_reward(32002, 9, Lev)
    when Lev >= 35 andalso Lev =< 54 ->
    [{90000, 21450, 100}];
get_finish_reward(32002, 9, Lev)
    when Lev >= 55 andalso Lev =< 64 ->
    [{90000, 21900, 100}];
get_finish_reward(32002, 9, Lev)
    when Lev >= 65 andalso Lev =< 99 ->
    [{90000, 23250, 100}];
get_finish_reward(32002, 10, Lev)
    when Lev >= 0 andalso Lev =< 34 ->
    [{90000, 26250, 100}];
get_finish_reward(32002, 10, Lev)
    when Lev >= 35 andalso Lev =< 54 ->
    [{90000, 27000, 100}];
get_finish_reward(32002, 10, Lev)
    when Lev >= 55 andalso Lev =< 64 ->
    [{90000, 27450, 100}];
get_finish_reward(32002, 10, Lev)
    when Lev >= 65 andalso Lev =< 99 ->
    [{90000, 28650, 100}];
get_finish_reward(32003, 1, Lev)
    when Lev >= 0 andalso Lev =< 34 ->
    [{90000, 2850, 100}];
get_finish_reward(32003, 1, Lev)
    when Lev >= 35 andalso Lev =< 54 ->
    [{90000, 3600, 100}];
get_finish_reward(32003, 1, Lev)
    when Lev >= 55 andalso Lev =< 64 ->
    [{90000, 4050, 100}];
get_finish_reward(32003, 1, Lev)
    when Lev >= 65 andalso Lev =< 99 ->
    [{90000, 5400, 100}];
get_finish_reward(32003, 2, Lev)
    when Lev >= 0 andalso Lev =< 34 ->
    [{90000, 3300, 100}];
get_finish_reward(32003, 2, Lev)
    when Lev >= 35 andalso Lev =< 54 ->
    [{90000, 4050, 100}];
get_finish_reward(32003, 2, Lev)
    when Lev >= 55 andalso Lev =< 64 ->
    [{90000, 4350, 100}];
get_finish_reward(32003, 2, Lev)
    when Lev >= 65 andalso Lev =< 99 ->
    [{90000, 5700, 100}];
get_finish_reward(32003, 3, Lev)
    when Lev >= 0 andalso Lev =< 34 ->
    [{90000, 4050, 100}];
get_finish_reward(32003, 3, Lev)
    when Lev >= 35 andalso Lev =< 54 ->
    [{90000, 4800, 100}];
get_finish_reward(32003, 3, Lev)
    when Lev >= 55 andalso Lev =< 64 ->
    [{90000, 5100, 100}];
get_finish_reward(32003, 3, Lev)
    when Lev >= 65 andalso Lev =< 99 ->
    [{90000, 6450, 100}];
get_finish_reward(32003, 4, Lev)
    when Lev >= 0 andalso Lev =< 34 ->
    [{90000, 5250, 100}];
get_finish_reward(32003, 4, Lev)
    when Lev >= 35 andalso Lev =< 54 ->
    [{90000, 6000, 100}];
get_finish_reward(32003, 4, Lev)
    when Lev >= 55 andalso Lev =< 64 ->
    [{90000, 6300, 100}];
get_finish_reward(32003, 4, Lev)
    when Lev >= 65 andalso Lev =< 99 ->
    [{90000, 7650, 100}];
get_finish_reward(32003, 5, Lev)
    when Lev >= 0 andalso Lev =< 34 ->
    [{90000, 7050, 100}];
get_finish_reward(32003, 5, Lev)
    when Lev >= 35 andalso Lev =< 54 ->
    [{90000, 7800, 100}];
get_finish_reward(32003, 5, Lev)
    when Lev >= 55 andalso Lev =< 64 ->
    [{90000, 8100, 100}];
get_finish_reward(32003, 5, Lev)
    when Lev >= 65 andalso Lev =< 99 ->
    [{90000, 9450, 100}];
get_finish_reward(32003, 6, Lev)
    when Lev >= 0 andalso Lev =< 34 ->
    [{90000, 9450, 100}];
get_finish_reward(32003, 6, Lev)
    when Lev >= 35 andalso Lev =< 54 ->
    [{90000, 10200, 100}];
get_finish_reward(32003, 6, Lev)
    when Lev >= 55 andalso Lev =< 64 ->
    [{90000, 10650, 100}];
get_finish_reward(32003, 6, Lev)
    when Lev >= 65 andalso Lev =< 99 ->
    [{90000, 11850, 100}];
get_finish_reward(32003, 7, Lev)
    when Lev >= 0 andalso Lev =< 34 ->
    [{90000, 12600, 100}];
get_finish_reward(32003, 7, Lev)
    when Lev >= 35 andalso Lev =< 54 ->
    [{90000, 13350, 100}];
get_finish_reward(32003, 7, Lev)
    when Lev >= 55 andalso Lev =< 64 ->
    [{90000, 13650, 100}];
get_finish_reward(32003, 7, Lev)
    when Lev >= 65 andalso Lev =< 99 ->
    [{90000, 15000, 100}];
get_finish_reward(32003, 8, Lev)
    when Lev >= 0 andalso Lev =< 34 ->
    [{90000, 16500, 100}];
get_finish_reward(32003, 8, Lev)
    when Lev >= 35 andalso Lev =< 54 ->
    [{90000, 17250, 100}];
get_finish_reward(32003, 8, Lev)
    when Lev >= 55 andalso Lev =< 64 ->
    [{90000, 17550, 100}];
get_finish_reward(32003, 8, Lev)
    when Lev >= 65 andalso Lev =< 99 ->
    [{90000, 18900, 100}];
get_finish_reward(32003, 9, Lev)
    when Lev >= 0 andalso Lev =< 34 ->
    [{90000, 21000, 100}];
get_finish_reward(32003, 9, Lev)
    when Lev >= 35 andalso Lev =< 54 ->
    [{90000, 21750, 100}];
get_finish_reward(32003, 9, Lev)
    when Lev >= 55 andalso Lev =< 64 ->
    [{90000, 22200, 100}];
get_finish_reward(32003, 9, Lev)
    when Lev >= 65 andalso Lev =< 99 ->
    [{90000, 23550, 100}];
get_finish_reward(32003, 10, Lev)
    when Lev >= 0 andalso Lev =< 34 ->
    [{90000, 26550, 100}];
get_finish_reward(32003, 10, Lev)
    when Lev >= 35 andalso Lev =< 54 ->
    [{90000, 27300, 100}];
get_finish_reward(32003, 10, Lev)
    when Lev >= 55 andalso Lev =< 64 ->
    [{90000, 27750, 100}];
get_finish_reward(32003, 10, Lev)
    when Lev >= 65 andalso Lev =< 99 ->
    [{90000, 28950, 100}];
get_finish_reward(_, _, _) -> false.

