-file("src/data/camp_lucky_tree_data.erl", 1).

-module(camp_lucky_tree_data).

-export([get/1, get_reward/1, get_all/0, get_cost/1]).

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

-file("src/data/camp_lucky_tree_data.erl", 18).

get(3163) ->
    {3163,
     71341,
     [{90002, 20}],
     lang:get("恭喜~ts在幸运摇一摇活动中获得~ts，幸运坚果，好运不停")};
get(_) -> false.

get_reward(1) ->
    #{id => 1, site => 1, classes => 0, sex => 2,
      min_lev => 1, max_lev => 200, min_break => 0,
      max_break => 999, reward => [{23752, 0, 1}],
      width => 1000, limit_num => 0, effect => 0, cast => 0};
get_reward(2) ->
    #{id => 2, site => 2, classes => 0, sex => 2,
      min_lev => 1, max_lev => 200, min_break => 0,
      max_break => 999, reward => [{22249, 0, 1}],
      width => 1000, limit_num => 8, effect => 0, cast => 0};
get_reward(3) ->
    #{id => 3, site => 3, classes => 0, sex => 2,
      min_lev => 1, max_lev => 200, min_break => 0,
      max_break => 999, reward => [{22248, 0, 1}],
      width => 800, limit_num => 0, effect => 0, cast => 1};
get_reward(4) ->
    #{id => 4, site => 4, classes => 0, sex => 2,
      min_lev => 1, max_lev => 200, min_break => 0,
      max_break => 999, reward => [{20616, 0, 1}],
      width => 500, limit_num => 9, effect => 0, cast => 0};
get_reward(5) ->
    #{id => 5, site => 5, classes => 0, sex => 2,
      min_lev => 1, max_lev => 200, min_break => 0,
      max_break => 999, reward => [{22300, 0, 1}],
      width => 500, limit_num => 0, effect => 0, cast => 0};
get_reward(6) ->
    #{id => 6, site => 6, classes => 0, sex => 2,
      min_lev => 1, max_lev => 200, min_break => 0,
      max_break => 999, reward => [{71439, 0, 2}],
      width => 100, limit_num => 0, effect => 1, cast => 1};
get_reward(7) ->
    #{id => 7, site => 7, classes => 0, sex => 2,
      min_lev => 1, max_lev => 200, min_break => 0,
      max_break => 999, reward => [{23740, 0, 2}],
      width => 100, limit_num => 0, effect => 0, cast => 0};
get_reward(8) ->
    #{id => 8, site => 8, classes => 0, sex => 2,
      min_lev => 1, max_lev => 200, min_break => 0,
      max_break => 999, reward => [{29041, 0, 1}],
      width => 50, limit_num => 0, effect => 1, cast => 1};
get_reward(9) ->
    #{id => 9, site => 9, classes => 0, sex => 2,
      min_lev => 1, max_lev => 200, min_break => 0,
      max_break => 999, reward => [{20617, 0, 1}],
      width => 50, limit_num => 0, effect => 1, cast => 1};
get_reward(10) ->
    #{id => 10, site => 10, classes => 0, sex => 2,
      min_lev => 1, max_lev => 200, min_break => 0,
      max_break => 999, reward => [{20638, 0, 1}], width => 5,
      limit_num => 0, effect => 1, cast => 1};
get_reward(11) ->
    #{id => 11, site => 11, classes => 1, sex => 2,
      min_lev => 1, max_lev => 200, min_break => 0,
      max_break => 999, reward => [{70682, 0, 1}], width => 5,
      limit_num => 7, effect => 1, cast => 1};
get_reward(12) ->
    #{id => 12, site => 11, classes => 2, sex => 2,
      min_lev => 1, max_lev => 200, min_break => 0,
      max_break => 999, reward => [{70683, 0, 1}], width => 5,
      limit_num => 7, effect => 1, cast => 1};
get_reward(13) ->
    #{id => 13, site => 11, classes => 3, sex => 2,
      min_lev => 1, max_lev => 200, min_break => 0,
      max_break => 999, reward => [{70684, 0, 1}], width => 5,
      limit_num => 7, effect => 1, cast => 1};
get_reward(14) ->
    #{id => 14, site => 11, classes => 4, sex => 2,
      min_lev => 1, max_lev => 200, min_break => 0,
      max_break => 999, reward => [{70685, 0, 1}], width => 5,
      limit_num => 7, effect => 1, cast => 1};
get_reward(15) ->
    #{id => 15, site => 11, classes => 5, sex => 2,
      min_lev => 1, max_lev => 200, min_break => 0,
      max_break => 999, reward => [{70686, 0, 1}], width => 5,
      limit_num => 7, effect => 1, cast => 1};
get_reward(16) ->
    #{id => 16, site => 11, classes => 6, sex => 2,
      min_lev => 1, max_lev => 200, min_break => 0,
      max_break => 999, reward => [{70687, 0, 1}], width => 5,
      limit_num => 7, effect => 1, cast => 1};
get_reward(17) ->
    #{id => 17, site => 11, classes => 7, sex => 2,
      min_lev => 1, max_lev => 200, min_break => 0,
      max_break => 999, reward => [{70688, 0, 1}], width => 5,
      limit_num => 7, effect => 1, cast => 1};
get_reward(18) ->
    #{id => 18, site => 12, classes => 0, sex => 2,
      min_lev => 1, max_lev => 200, min_break => 0,
      max_break => 999, reward => [{22448, 0, 1}], width => 5,
      limit_num => 0, effect => 1, cast => 1};
get_reward(_) -> false.

get_all() ->
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
     2,
     3,
     4,
     5,
     6,
     7,
     8,
     9].

get_cost(1) -> 1;
get_cost(2) -> 2;
get_cost(3) -> 5;
get_cost(4) -> 10;
get_cost(5) -> 20;
get_cost(6) -> 25;
get_cost(7) -> 30;
get_cost(8) -> 45;
get_cost(9) -> 60;
get_cost(10) -> 80;
get_cost(11) -> 120;
get_cost(12) -> 150;
get_cost(_) -> false.

