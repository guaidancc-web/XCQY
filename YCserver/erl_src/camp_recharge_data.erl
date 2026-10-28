-file("src/data/camp_recharge_data.erl", 1).

-module(camp_recharge_data).

-export([get_group_list/1,
         get_show_group_list/1,
         get_box_reward/1,
         get_random_cost/1,
         get_box_list/1,
         get_weight/2]).

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

-file("src/data/camp_recharge_data.erl", 19).

get_group_list(1) ->
    [{90026, 0, 100, 1000, 1, 1, 200, 2, 0},
     {70925, 0, 2, 500, 2, 1, 200, 2, 1},
     {22396, 0, 1, 1000, 3, 1, 79, 2, 0},
     {21098, 0, 5, 1000, 3, 80, 200, 2, 0},
     {20755, 0, 1, 100, 4, 1, 200, 2, 0},
     {20032, 0, 1, 100, 5, 1, 200, 2, 0},
     {23740, 0, 1, 50, 6, 1, 200, 2, 1},
     {70931, 0, 1, 1, 7, 1, 200, 2, 1},
     {70238, 0, 1, 10, 8, 1, 200, 2, 1}];
get_group_list(2) ->
    [{22216, 0, 2, 1000, 1, 1, 200, 2, 0},
     {70930, 0, 1, 1000, 2, 1, 200, 2, 1},
     {20053, 0, 1, 500, 3, 1, 200, 2, 0},
     {70896, 0, 1, 100, 4, 1, 200, 2, 0},
     {23740, 0, 1, 100, 5, 1, 200, 2, 1},
     {20617, 0, 1, 1, 6, 1, 200, 2, 1},
     {29153, 0, 1, 50, 7, 1, 200, 2, 1},
     {22617, 0, 1, 10, 8, 1, 200, 2, 1}];
get_group_list(3) ->
    [{70932, 0, 3, 1000, 1, 1, 200, 2, 0},
     {70925, 0, 2, 500, 2, 1, 200, 2, 1},
     {20606, 0, 1, 500, 3, 1, 200, 2, 0},
     {29101, 0, 1, 100, 4, 1, 200, 2, 0},
     {29314, 0, 1, 100, 5, 1, 200, 2, 1},
     {24022, 0, 1, 10, 6, 1, 200, 2, 1},
     {29041, 0, 1, 1, 7, 1, 200, 2, 1},
     {70896, 0, 1, 500, 8, 1, 200, 2, 1}];
get_group_list(_) -> [].

get_show_group_list(1) -> [1];
get_show_group_list(2) -> [2];
get_show_group_list(3) -> [3];
get_show_group_list(_) -> [].

get_box_list(1) -> [1, 2, 3, 4, 5];
get_box_list(2) -> [6, 7, 8, 9, 10];
get_box_list(3) -> [11, 12, 13, 14, 15];
get_box_list(_) -> [].

get_random_cost(1) -> [{70927, 1}];
get_random_cost(2) -> [{70928, 1}];
get_random_cost(3) -> [{70929, 1}];
get_random_cost(_) -> false.

get_box_reward(1) ->
    {1,
     60,
     [{70927, 0, 1, 1, 200, 1}, {20005, 0, 2, 1, 200, 0}]};
get_box_reward(2) ->
    {2,
     300,
     [{70927, 0, 1, 1, 200, 1}, {70930, 0, 1, 1, 200, 0}]};
get_box_reward(3) ->
    {3,
     1000,
     [{70927, 0, 1, 1, 200, 1}, {20025, 0, 2, 1, 200, 0}]};
get_box_reward(4) ->
    {4,
     2000,
     [{70927, 0, 2, 1, 200, 1},
      {20000, 0, 1, 1, 200, 0},
      {20034, 0, 2, 1, 200, 0}]};
get_box_reward(5) ->
    {5,
     3000,
     [{70927, 0, 3, 1, 200, 1},
      {20002, 0, 1, 1, 200, 0},
      {20545, 0, 1, 1, 200, 1}]};
get_box_reward(6) ->
    {6,
     60,
     [{70928, 0, 1, 1, 200, 1}, {20005, 0, 2, 1, 200, 0}]};
get_box_reward(7) ->
    {7,
     300,
     [{70928, 0, 1, 1, 200, 1}, {70930, 0, 1, 1, 200, 0}]};
get_box_reward(8) ->
    {8,
     1000,
     [{70928, 0, 1, 1, 200, 1}, {20025, 0, 2, 1, 200, 0}]};
get_box_reward(9) ->
    {9,
     2000,
     [{70928, 0, 2, 1, 200, 1},
      {20000, 0, 1, 1, 200, 0},
      {20034, 0, 2, 1, 200, 0}]};
get_box_reward(10) ->
    {10,
     3000,
     [{70928, 0, 3, 1, 200, 1},
      {20002, 0, 1, 1, 200, 0},
      {20545, 0, 1, 1, 200, 1}]};
get_box_reward(11) ->
    {11,
     60,
     [{70929, 0, 1, 1, 200, 1}, {20005, 0, 2, 1, 200, 0}]};
get_box_reward(12) ->
    {12,
     300,
     [{70929, 0, 1, 1, 200, 1}, {70930, 0, 1, 1, 200, 0}]};
get_box_reward(13) ->
    {13,
     1000,
     [{70929, 0, 1, 1, 200, 1}, {20025, 0, 2, 1, 200, 0}]};
get_box_reward(14) ->
    {14,
     2000,
     [{70929, 0, 2, 1, 200, 1},
      {20000, 0, 1, 1, 200, 0},
      {20034, 0, 2, 1, 200, 0}]};
get_box_reward(15) ->
    {15,
     3000,
     [{70929, 0, 3, 1, 200, 1},
      {20002, 0, 1, 1, 200, 0},
      {20545, 0, 1, 1, 200, 1}]};
get_box_reward(_) -> false.

get_weight(GroupID, Times)
    when GroupID =:= 1 andalso
             Times =< 8 andalso Times >= 0 ->
    100;
get_weight(GroupID, Times)
    when GroupID =:= 2 andalso
             Times =< 8 andalso Times >= 0 ->
    100;
get_weight(GroupID, Times)
    when GroupID =:= 3 andalso
             Times =< 8 andalso Times >= 0 ->
    100;
get_weight(_, _) -> 0.

