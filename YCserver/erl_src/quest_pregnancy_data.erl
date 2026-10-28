-file("src/data/quest_pregnancy_data.erl", 1).

-module(quest_pregnancy_data).

-export([get_round/1,
         get_lev/1,
         get_ring/1,
         get_patrol/1,
         get_classify/0,
         get_item_list/0,
         get_find_type_quest_id/1,
         get_find_type/1]).

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

-file("src/data/quest_pregnancy_data.erl", 21).

get_round({2, 1}) -> 83130;
get_round({2, 2}) -> 83140;
get_round({2, 3}) -> 83150;
get_round({2, 4}) -> 83160;
get_round({2, 5}) -> 83170;
get_round({1, 1}) -> 83180;
get_round({1, 2}) -> 83190;
get_round({1, 3}) -> 83200;
get_round({1, 4}) -> 83210;
get_round({1, 5}) -> 83220;
get_round(_Id) -> none.

get_lev(_Id) -> none.

get_ring(_Id) -> none.

get_patrol(83150) ->
    [#{id => 83150, map_base_id => 10001,
       unit_list => [{64350, 100}], weight => 100, pcnt => 800,
       min_move_step => 8, max_move_step => 40,
       points =>
           [{1643, 2725},
            {2040, 2428},
            {562, 1229},
            {734, 1780},
            {520, 2430},
            {836, 2803},
            {2587, 2717},
            {2436, 3591},
            {3304, 3100}]}];
get_patrol(83170) ->
    [#{id => 83170, map_base_id => 10003,
       unit_list => [{64360, 100}, {64370, 100}],
       weight => 100, pcnt => 800, min_move_step => 8,
       max_move_step => 40,
       points =>
           [{1751, 860},
            {1304, 1310},
            {2126, 1529},
            {224, 709},
            {827, 241},
            {1984, 322},
            {2579, 458},
            {1757, 816}]}];
get_patrol(83200) ->
    [#{id => 83200, map_base_id => 10001,
       unit_list => [{64350, 100}], weight => 100, pcnt => 800,
       min_move_step => 8, max_move_step => 40,
       points =>
           [{1643, 2725},
            {2040, 2428},
            {562, 1229},
            {734, 1780},
            {520, 2430},
            {836, 2803},
            {2587, 2717},
            {2436, 3591},
            {3304, 3100}]}];
get_patrol(83220) ->
    [#{id => 83220, map_base_id => 10003,
       unit_list => [{64360, 100}, {64370, 100}],
       weight => 100, pcnt => 800, min_move_step => 8,
       max_move_step => 40,
       points =>
           [{1751, 860},
            {1304, 1310},
            {2126, 1529},
            {224, 709},
            {827, 241},
            {1984, 322},
            {2579, 458},
            {1757, 816}]}];
get_patrol(_) -> [].

get_classify() -> [].

get_item_list() -> [].

get_find_type_quest_id(_Type) -> false.

get_find_type(_QuestId) -> false.

