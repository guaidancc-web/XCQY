-file("src/data/quest_child_data.erl", 1).

-module(quest_child_data).

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

-file("src/data/quest_child_data.erl", 21).

get_round({2, 1}) -> 83000;
get_round({2, 2}) -> 83010;
get_round({2, 3}) -> 83020;
get_round({2, 4}) -> 83026;
get_round({2, 5}) -> 83028;
get_round({2, 6}) -> 83030;
get_round({1, 1}) -> 83100;
get_round({1, 2}) -> 83110;
get_round({1, 3}) -> 83120;
get_round(_Id) -> none.

get_lev(_Id) -> none.

get_ring(_Id) -> none.

get_patrol(83010) ->
    [#{id => 83010, map_base_id => 10004,
       unit_list => [{64310, 100}, {64320, 100}],
       weight => 100, pcnt => 800, min_move_step => 8,
       max_move_step => 40,
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

