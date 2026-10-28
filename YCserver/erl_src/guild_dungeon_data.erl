-file("src/data/guild_dungeon_data.erl", 1).

-module(guild_dungeon_data).

-export([list/0,
         list_strongpoint/1,
         get_chapter/1,
         get_monster/1,
         get_award_world_lv/0,
         get_exp_ratio/1]).

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

-file("src/data/guild_dungeon_data.erl", 20).

list() -> [1].

list_strongpoint(1) -> [1, 2, 3, 4, 5, 6];
list_strongpoint(_) -> [].

get_chapter({1, 1}) ->
    #{chapter_id => 1, chapter_name => lang:get("烈焰之心"),
      strongpoint_id => 1,
      strongpoint_name => lang:get("破碎之石"), type => 1,
      monsters => [1, 2, 3, 4, 5, 6],
      strongpoint_reward =>
          [{1, 1, 90036, 15},
           {2, 2, 90036, 12},
           {3, 3, 90036, 10}]};
get_chapter({1, 2}) ->
    #{chapter_id => 1, chapter_name => lang:get("烈焰之心"),
      strongpoint_id => 2,
      strongpoint_name => lang:get("熔火要塞"), type => 2,
      monsters => [7, 8, 9, 10, 11, 12],
      strongpoint_reward =>
          [{1, 1, 90036, 15},
           {2, 2, 90036, 12},
           {3, 3, 90036, 10}]};
get_chapter({1, 3}) ->
    #{chapter_id => 1, chapter_name => lang:get("烈焰之心"),
      strongpoint_id => 3,
      strongpoint_name => lang:get("火焰之门"), type => 3,
      monsters => [13, 14, 15, 16, 17, 18],
      strongpoint_reward =>
          [{1, 1, 90036, 15},
           {2, 2, 90036, 12},
           {3, 3, 90036, 10}]};
get_chapter({1, 4}) ->
    #{chapter_id => 1, chapter_name => lang:get("烈焰之心"),
      strongpoint_id => 4,
      strongpoint_name => lang:get("烈焰熔炉"), type => 4,
      monsters => [19, 20, 21, 22, 23, 24],
      strongpoint_reward =>
          [{1, 1, 90036, 15},
           {2, 2, 90036, 12},
           {3, 3, 90036, 10}]};
get_chapter({1, 5}) ->
    #{chapter_id => 1, chapter_name => lang:get("烈焰之心"),
      strongpoint_id => 5,
      strongpoint_name => lang:get("烈焰堡垒"), type => 5,
      monsters => [25, 26, 27, 28, 29, 30],
      strongpoint_reward =>
          [{1, 1, 90036, 15},
           {2, 2, 90036, 12},
           {3, 3, 90036, 10}]};
get_chapter({1, 6}) ->
    #{chapter_id => 1, chapter_name => lang:get("烈焰之心"),
      strongpoint_id => 6,
      strongpoint_name => lang:get("灭世之劫"), type => 6,
      monsters => [31, 32, 33, 34, 35, 36],
      strongpoint_reward =>
          [{1, 1, 90036, 15},
           {2, 2, 90036, 12},
           {3, 3, 90036, 10}]};
get_chapter(_) -> false.

get_monster({1, 1, 1, 60, 85}) ->
    #{chapter_id => 1, strongpoint_id => 1, unique => 1,
      id => 66000, type => 0, recover_type => 1,
      recover_value => 0, fixed_reward => [{90036, 10}],
      world_lv_min => 60, world_lv_max => 85,
      client_reward => [{21240, 1}, {21241, 1}],
      percent_reward =>
          [{0, [{21240, 1, 900}, {21241, 1, 100}]}],
      exp_id => 1003, exp_ratio => [{3, 2}, {5, 3}, {10, 5}]};
get_monster({1, 1, 2, 60, 85}) ->
    #{chapter_id => 1, strongpoint_id => 1, unique => 2,
      id => 66008, type => 0, recover_type => 1,
      recover_value => 0, fixed_reward => [{90036, 10}],
      world_lv_min => 60, world_lv_max => 85,
      client_reward => [{21240, 1}, {21241, 1}],
      percent_reward =>
          [{0, [{21240, 1, 900}, {21241, 1, 100}]}],
      exp_id => 1003, exp_ratio => [{3, 2}, {5, 3}, {10, 5}]};
get_monster({1, 1, 3, 60, 85}) ->
    #{chapter_id => 1, strongpoint_id => 1, unique => 3,
      id => 66000, type => 0, recover_type => 1,
      recover_value => 0, fixed_reward => [{90036, 10}],
      world_lv_min => 60, world_lv_max => 85,
      client_reward => [{21240, 1}, {21241, 1}],
      percent_reward =>
          [{0, [{21240, 1, 900}, {21241, 1, 100}]}],
      exp_id => 1003, exp_ratio => [{3, 2}, {5, 3}, {10, 5}]};
get_monster({1, 1, 4, 60, 85}) ->
    #{chapter_id => 1, strongpoint_id => 1, unique => 4,
      id => 66008, type => 0, recover_type => 1,
      recover_value => 0, fixed_reward => [{90036, 10}],
      world_lv_min => 60, world_lv_max => 85,
      client_reward => [{21240, 1}, {21241, 1}],
      percent_reward =>
          [{0, [{21240, 1, 900}, {21241, 1, 100}]}],
      exp_id => 1003, exp_ratio => [{3, 2}, {5, 3}, {10, 5}]};
get_monster({1, 1, 5, 60, 85}) ->
    #{chapter_id => 1, strongpoint_id => 1, unique => 5,
      id => 66003, type => 0, recover_type => 1,
      recover_value => 0, fixed_reward => [{90036, 10}],
      world_lv_min => 60, world_lv_max => 85,
      client_reward => [{21240, 1}, {21241, 1}],
      percent_reward =>
          [{0, [{21240, 1, 900}, {21241, 1, 100}]}],
      exp_id => 1003, exp_ratio => [{3, 2}, {5, 3}, {10, 5}]};
get_monster({1, 1, 6, 60, 85}) ->
    #{chapter_id => 1, strongpoint_id => 1, unique => 6,
      id => 66011, type => 0, recover_type => 1,
      recover_value => 0, fixed_reward => [{90036, 10}],
      world_lv_min => 60, world_lv_max => 85,
      client_reward => [{21240, 1}, {21241, 1}],
      percent_reward =>
          [{0, [{21240, 1, 900}, {21241, 1, 100}]}],
      exp_id => 1003, exp_ratio => [{3, 2}, {5, 3}, {10, 5}]};
get_monster({1, 2, 7, 60, 85}) ->
    #{chapter_id => 1, strongpoint_id => 2, unique => 7,
      id => 66000, type => 0, recover_type => 1,
      recover_value => 0, fixed_reward => [{90036, 10}],
      world_lv_min => 60, world_lv_max => 85,
      client_reward => [{21240, 1}, {21241, 1}],
      percent_reward =>
          [{0, [{21240, 1, 900}, {21241, 1, 100}]}],
      exp_id => 1003, exp_ratio => [{3, 2}, {5, 3}, {10, 5}]};
get_monster({1, 2, 8, 60, 85}) ->
    #{chapter_id => 1, strongpoint_id => 2, unique => 8,
      id => 66008, type => 0, recover_type => 1,
      recover_value => 0, fixed_reward => [{90036, 10}],
      world_lv_min => 60, world_lv_max => 85,
      client_reward => [{21240, 1}, {21241, 1}],
      percent_reward =>
          [{0, [{21240, 1, 900}, {21241, 1, 100}]}],
      exp_id => 1003, exp_ratio => [{3, 2}, {5, 3}, {10, 5}]};
get_monster({1, 2, 9, 60, 85}) ->
    #{chapter_id => 1, strongpoint_id => 2, unique => 9,
      id => 66000, type => 0, recover_type => 1,
      recover_value => 0, fixed_reward => [{90036, 10}],
      world_lv_min => 60, world_lv_max => 85,
      client_reward => [{21240, 1}, {21241, 1}],
      percent_reward =>
          [{0, [{21240, 1, 900}, {21241, 1, 100}]}],
      exp_id => 1003, exp_ratio => [{3, 2}, {5, 3}, {10, 5}]};
get_monster({1, 2, 10, 60, 85}) ->
    #{chapter_id => 1, strongpoint_id => 2, unique => 10,
      id => 66008, type => 0, recover_type => 1,
      recover_value => 0, fixed_reward => [{90036, 10}],
      world_lv_min => 60, world_lv_max => 85,
      client_reward => [{21240, 1}, {21241, 1}],
      percent_reward =>
          [{0, [{21240, 1, 900}, {21241, 1, 100}]}],
      exp_id => 1003, exp_ratio => [{3, 2}, {5, 3}, {10, 5}]};
get_monster({1, 2, 11, 60, 85}) ->
    #{chapter_id => 1, strongpoint_id => 2, unique => 11,
      id => 66003, type => 0, recover_type => 1,
      recover_value => 0, fixed_reward => [{90036, 10}],
      world_lv_min => 60, world_lv_max => 85,
      client_reward => [{21240, 1}, {21241, 1}],
      percent_reward =>
          [{0, [{21240, 1, 900}, {21241, 1, 100}]}],
      exp_id => 1003, exp_ratio => [{3, 2}, {5, 3}, {10, 5}]};
get_monster({1, 2, 12, 60, 85}) ->
    #{chapter_id => 1, strongpoint_id => 2, unique => 12,
      id => 66011, type => 0, recover_type => 1,
      recover_value => 0, fixed_reward => [{90036, 10}],
      world_lv_min => 60, world_lv_max => 85,
      client_reward => [{21240, 1}, {21241, 1}],
      percent_reward =>
          [{0, [{21240, 1, 900}, {21241, 1, 100}]}],
      exp_id => 1003, exp_ratio => [{3, 2}, {5, 3}, {10, 5}]};
get_monster({1, 3, 13, 60, 85}) ->
    #{chapter_id => 1, strongpoint_id => 3, unique => 13,
      id => 66000, type => 0, recover_type => 1,
      recover_value => 0, fixed_reward => [{90036, 10}],
      world_lv_min => 60, world_lv_max => 85,
      client_reward => [{21240, 1}, {21241, 1}],
      percent_reward =>
          [{0, [{21240, 1, 900}, {21241, 1, 100}]}],
      exp_id => 1003, exp_ratio => [{3, 2}, {5, 3}, {10, 5}]};
get_monster({1, 3, 14, 60, 85}) ->
    #{chapter_id => 1, strongpoint_id => 3, unique => 14,
      id => 66008, type => 0, recover_type => 1,
      recover_value => 0, fixed_reward => [{90036, 10}],
      world_lv_min => 60, world_lv_max => 85,
      client_reward => [{21240, 1}, {21241, 1}],
      percent_reward =>
          [{0, [{21240, 1, 900}, {21241, 1, 100}]}],
      exp_id => 1003, exp_ratio => [{3, 2}, {5, 3}, {10, 5}]};
get_monster({1, 3, 15, 60, 85}) ->
    #{chapter_id => 1, strongpoint_id => 3, unique => 15,
      id => 66000, type => 0, recover_type => 1,
      recover_value => 0, fixed_reward => [{90036, 10}],
      world_lv_min => 60, world_lv_max => 85,
      client_reward => [{21240, 1}, {21241, 1}],
      percent_reward =>
          [{0, [{21240, 1, 900}, {21241, 1, 100}]}],
      exp_id => 1003, exp_ratio => [{3, 2}, {5, 3}, {10, 5}]};
get_monster({1, 3, 16, 60, 85}) ->
    #{chapter_id => 1, strongpoint_id => 3, unique => 16,
      id => 66008, type => 0, recover_type => 1,
      recover_value => 0, fixed_reward => [{90036, 10}],
      world_lv_min => 60, world_lv_max => 85,
      client_reward => [{21240, 1}, {21241, 1}],
      percent_reward =>
          [{0, [{21240, 1, 900}, {21241, 1, 100}]}],
      exp_id => 1003, exp_ratio => [{3, 2}, {5, 3}, {10, 5}]};
get_monster({1, 3, 17, 60, 85}) ->
    #{chapter_id => 1, strongpoint_id => 3, unique => 17,
      id => 66003, type => 0, recover_type => 1,
      recover_value => 0, fixed_reward => [{90036, 10}],
      world_lv_min => 60, world_lv_max => 85,
      client_reward => [{21240, 1}, {21241, 1}],
      percent_reward =>
          [{0, [{21240, 1, 900}, {21241, 1, 100}]}],
      exp_id => 1003, exp_ratio => [{3, 2}, {5, 3}, {10, 5}]};
get_monster({1, 3, 18, 60, 85}) ->
    #{chapter_id => 1, strongpoint_id => 3, unique => 18,
      id => 66011, type => 0, recover_type => 1,
      recover_value => 0, fixed_reward => [{90036, 10}],
      world_lv_min => 60, world_lv_max => 85,
      client_reward => [{21240, 1}, {21241, 1}],
      percent_reward =>
          [{0, [{21240, 1, 900}, {21241, 1, 100}]}],
      exp_id => 1003, exp_ratio => [{3, 2}, {5, 3}, {10, 5}]};
get_monster({1, 4, 19, 60, 85}) ->
    #{chapter_id => 1, strongpoint_id => 4, unique => 19,
      id => 66000, type => 0, recover_type => 1,
      recover_value => 0, fixed_reward => [{90036, 10}],
      world_lv_min => 60, world_lv_max => 85,
      client_reward => [{21240, 1}, {21241, 1}],
      percent_reward =>
          [{0, [{21240, 1, 900}, {21241, 1, 100}]}],
      exp_id => 1003, exp_ratio => [{3, 2}, {5, 3}, {10, 5}]};
get_monster({1, 4, 20, 60, 85}) ->
    #{chapter_id => 1, strongpoint_id => 4, unique => 20,
      id => 66008, type => 0, recover_type => 1,
      recover_value => 0, fixed_reward => [{90036, 10}],
      world_lv_min => 60, world_lv_max => 85,
      client_reward => [{21240, 1}, {21241, 1}],
      percent_reward =>
          [{0, [{21240, 1, 900}, {21241, 1, 100}]}],
      exp_id => 1003, exp_ratio => [{3, 2}, {5, 3}, {10, 5}]};
get_monster({1, 4, 21, 60, 85}) ->
    #{chapter_id => 1, strongpoint_id => 4, unique => 21,
      id => 66000, type => 0, recover_type => 1,
      recover_value => 0, fixed_reward => [{90036, 10}],
      world_lv_min => 60, world_lv_max => 85,
      client_reward => [{21240, 1}, {21241, 1}],
      percent_reward =>
          [{0, [{21240, 1, 900}, {21241, 1, 100}]}],
      exp_id => 1003, exp_ratio => [{3, 2}, {5, 3}, {10, 5}]};
get_monster({1, 4, 22, 60, 85}) ->
    #{chapter_id => 1, strongpoint_id => 4, unique => 22,
      id => 66008, type => 0, recover_type => 1,
      recover_value => 0, fixed_reward => [{90036, 10}],
      world_lv_min => 60, world_lv_max => 85,
      client_reward => [{21240, 1}, {21241, 1}],
      percent_reward =>
          [{0, [{21240, 1, 900}, {21241, 1, 100}]}],
      exp_id => 1003, exp_ratio => [{3, 2}, {5, 3}, {10, 5}]};
get_monster({1, 4, 23, 60, 85}) ->
    #{chapter_id => 1, strongpoint_id => 4, unique => 23,
      id => 66003, type => 0, recover_type => 1,
      recover_value => 0, fixed_reward => [{90036, 10}],
      world_lv_min => 60, world_lv_max => 85,
      client_reward => [{21240, 1}, {21241, 1}],
      percent_reward =>
          [{0, [{21240, 1, 900}, {21241, 1, 100}]}],
      exp_id => 1003, exp_ratio => [{3, 2}, {5, 3}, {10, 5}]};
get_monster({1, 4, 24, 60, 85}) ->
    #{chapter_id => 1, strongpoint_id => 4, unique => 24,
      id => 66011, type => 0, recover_type => 1,
      recover_value => 0, fixed_reward => [{90036, 10}],
      world_lv_min => 60, world_lv_max => 85,
      client_reward => [{21240, 1}, {21241, 1}],
      percent_reward =>
          [{0, [{21240, 1, 900}, {21241, 1, 100}]}],
      exp_id => 1003, exp_ratio => [{3, 2}, {5, 3}, {10, 5}]};
get_monster({1, 5, 25, 60, 85}) ->
    #{chapter_id => 1, strongpoint_id => 5, unique => 25,
      id => 66000, type => 0, recover_type => 1,
      recover_value => 0, fixed_reward => [{90036, 10}],
      world_lv_min => 60, world_lv_max => 85,
      client_reward => [{21240, 1}, {21241, 1}],
      percent_reward =>
          [{0, [{21240, 1, 900}, {21241, 1, 100}]}],
      exp_id => 1003, exp_ratio => [{3, 2}, {5, 3}, {10, 5}]};
get_monster({1, 5, 26, 60, 85}) ->
    #{chapter_id => 1, strongpoint_id => 5, unique => 26,
      id => 66008, type => 0, recover_type => 1,
      recover_value => 0, fixed_reward => [{90036, 10}],
      world_lv_min => 60, world_lv_max => 85,
      client_reward => [{21240, 1}, {21241, 1}],
      percent_reward =>
          [{0, [{21240, 1, 900}, {21241, 1, 100}]}],
      exp_id => 1003, exp_ratio => [{3, 2}, {5, 3}, {10, 5}]};
get_monster({1, 5, 27, 60, 85}) ->
    #{chapter_id => 1, strongpoint_id => 5, unique => 27,
      id => 66000, type => 0, recover_type => 1,
      recover_value => 0, fixed_reward => [{90036, 10}],
      world_lv_min => 60, world_lv_max => 85,
      client_reward => [{21240, 1}, {21241, 1}],
      percent_reward =>
          [{0, [{21240, 1, 900}, {21241, 1, 100}]}],
      exp_id => 1003, exp_ratio => [{3, 2}, {5, 3}, {10, 5}]};
get_monster({1, 5, 28, 60, 85}) ->
    #{chapter_id => 1, strongpoint_id => 5, unique => 28,
      id => 66008, type => 0, recover_type => 1,
      recover_value => 0, fixed_reward => [{90036, 10}],
      world_lv_min => 60, world_lv_max => 85,
      client_reward => [{21240, 1}, {21241, 1}],
      percent_reward =>
          [{0, [{21240, 1, 900}, {21241, 1, 100}]}],
      exp_id => 1003, exp_ratio => [{3, 2}, {5, 3}, {10, 5}]};
get_monster({1, 5, 29, 60, 85}) ->
    #{chapter_id => 1, strongpoint_id => 5, unique => 29,
      id => 66003, type => 0, recover_type => 1,
      recover_value => 0, fixed_reward => [{90036, 10}],
      world_lv_min => 60, world_lv_max => 85,
      client_reward => [{21240, 1}, {21241, 1}],
      percent_reward =>
          [{0, [{21240, 1, 900}, {21241, 1, 100}]}],
      exp_id => 1003, exp_ratio => [{3, 2}, {5, 3}, {10, 5}]};
get_monster({1, 5, 30, 60, 85}) ->
    #{chapter_id => 1, strongpoint_id => 5, unique => 30,
      id => 66011, type => 0, recover_type => 1,
      recover_value => 0, fixed_reward => [{90036, 10}],
      world_lv_min => 60, world_lv_max => 85,
      client_reward => [{21240, 1}, {21241, 1}],
      percent_reward =>
          [{0, [{21240, 1, 900}, {21241, 1, 100}]}],
      exp_id => 1003, exp_ratio => [{3, 2}, {5, 3}, {10, 5}]};
get_monster({1, 6, 31, 60, 85}) ->
    #{chapter_id => 1, strongpoint_id => 6, unique => 31,
      id => 66000, type => 0, recover_type => 1,
      recover_value => 0, fixed_reward => [{90036, 10}],
      world_lv_min => 60, world_lv_max => 85,
      client_reward => [{21240, 1}, {21241, 1}],
      percent_reward =>
          [{0, [{21240, 1, 900}, {21241, 1, 100}]}],
      exp_id => 1003, exp_ratio => [{3, 2}, {5, 3}, {10, 5}]};
get_monster({1, 6, 32, 60, 85}) ->
    #{chapter_id => 1, strongpoint_id => 6, unique => 32,
      id => 66008, type => 0, recover_type => 1,
      recover_value => 0, fixed_reward => [{90036, 10}],
      world_lv_min => 60, world_lv_max => 85,
      client_reward => [{21240, 1}, {21241, 1}],
      percent_reward =>
          [{0, [{21240, 1, 900}, {21241, 1, 100}]}],
      exp_id => 1003, exp_ratio => [{3, 2}, {5, 3}, {10, 5}]};
get_monster({1, 6, 33, 60, 85}) ->
    #{chapter_id => 1, strongpoint_id => 6, unique => 33,
      id => 66000, type => 0, recover_type => 1,
      recover_value => 0, fixed_reward => [{90036, 10}],
      world_lv_min => 60, world_lv_max => 85,
      client_reward => [{21240, 1}, {21241, 1}],
      percent_reward =>
          [{0, [{21240, 1, 900}, {21241, 1, 100}]}],
      exp_id => 1003, exp_ratio => [{3, 2}, {5, 3}, {10, 5}]};
get_monster({1, 6, 34, 60, 85}) ->
    #{chapter_id => 1, strongpoint_id => 6, unique => 34,
      id => 66008, type => 0, recover_type => 1,
      recover_value => 0, fixed_reward => [{90036, 10}],
      world_lv_min => 60, world_lv_max => 85,
      client_reward => [{21240, 1}, {21241, 1}],
      percent_reward =>
          [{0, [{21240, 1, 900}, {21241, 1, 100}]}],
      exp_id => 1003, exp_ratio => [{3, 2}, {5, 3}, {10, 5}]};
get_monster({1, 6, 35, 60, 85}) ->
    #{chapter_id => 1, strongpoint_id => 6, unique => 35,
      id => 66003, type => 0, recover_type => 1,
      recover_value => 0, fixed_reward => [{90036, 10}],
      world_lv_min => 60, world_lv_max => 85,
      client_reward => [{21240, 1}, {21241, 1}],
      percent_reward =>
          [{0, [{21240, 1, 900}, {21241, 1, 100}]}],
      exp_id => 1003, exp_ratio => [{3, 2}, {5, 3}, {10, 5}]};
get_monster({1, 6, 36, 60, 85}) ->
    #{chapter_id => 1, strongpoint_id => 6, unique => 36,
      id => 66011, type => 0, recover_type => 1,
      recover_value => 0, fixed_reward => [{90036, 10}],
      world_lv_min => 60, world_lv_max => 85,
      client_reward => [{21240, 1}, {21241, 1}],
      percent_reward =>
          [{0, [{21240, 1, 900}, {21241, 1, 100}]}],
      exp_id => 1003, exp_ratio => [{3, 2}, {5, 3}, {10, 5}]};
get_monster({1, 1, 1, 90, 200}) ->
    #{chapter_id => 1, strongpoint_id => 1, unique => 1,
      id => 66000, type => 0, recover_type => 1,
      recover_value => 0, fixed_reward => [{90036, 10}],
      world_lv_min => 90, world_lv_max => 200,
      client_reward => [{21240, 1}, {21241, 1}],
      percent_reward =>
          [{0,
            [{21240, 1, 900}, {21241, 1, 80}, {21259, 1, 20}]}],
      exp_id => 1003, exp_ratio => [{3, 2}, {5, 3}, {10, 5}]};
get_monster({1, 1, 2, 90, 200}) ->
    #{chapter_id => 1, strongpoint_id => 1, unique => 2,
      id => 66008, type => 0, recover_type => 1,
      recover_value => 0, fixed_reward => [{90036, 10}],
      world_lv_min => 90, world_lv_max => 200,
      client_reward => [{21240, 1}, {21241, 1}],
      percent_reward =>
          [{0,
            [{21240, 1, 900}, {21241, 1, 80}, {21259, 1, 20}]}],
      exp_id => 1003, exp_ratio => [{3, 2}, {5, 3}, {10, 5}]};
get_monster({1, 1, 3, 90, 200}) ->
    #{chapter_id => 1, strongpoint_id => 1, unique => 3,
      id => 66000, type => 0, recover_type => 1,
      recover_value => 0, fixed_reward => [{90036, 10}],
      world_lv_min => 90, world_lv_max => 200,
      client_reward => [{21240, 1}, {21241, 1}],
      percent_reward =>
          [{0,
            [{21240, 1, 900}, {21241, 1, 80}, {21259, 1, 20}]}],
      exp_id => 1003, exp_ratio => [{3, 2}, {5, 3}, {10, 5}]};
get_monster({1, 1, 4, 90, 200}) ->
    #{chapter_id => 1, strongpoint_id => 1, unique => 4,
      id => 66008, type => 0, recover_type => 1,
      recover_value => 0, fixed_reward => [{90036, 10}],
      world_lv_min => 90, world_lv_max => 200,
      client_reward => [{21240, 1}, {21241, 1}],
      percent_reward =>
          [{0,
            [{21240, 1, 900}, {21241, 1, 80}, {21259, 1, 20}]}],
      exp_id => 1003, exp_ratio => [{3, 2}, {5, 3}, {10, 5}]};
get_monster({1, 1, 5, 90, 200}) ->
    #{chapter_id => 1, strongpoint_id => 1, unique => 5,
      id => 66003, type => 0, recover_type => 1,
      recover_value => 0, fixed_reward => [{90036, 10}],
      world_lv_min => 90, world_lv_max => 200,
      client_reward => [{21240, 1}, {21241, 1}],
      percent_reward =>
          [{0,
            [{21240, 1, 900}, {21241, 1, 80}, {21259, 1, 20}]}],
      exp_id => 1003, exp_ratio => [{3, 2}, {5, 3}, {10, 5}]};
get_monster({1, 1, 6, 90, 200}) ->
    #{chapter_id => 1, strongpoint_id => 1, unique => 6,
      id => 66011, type => 0, recover_type => 1,
      recover_value => 0, fixed_reward => [{90036, 10}],
      world_lv_min => 90, world_lv_max => 200,
      client_reward => [{21240, 1}, {21241, 1}],
      percent_reward =>
          [{0,
            [{21240, 1, 900}, {21241, 1, 80}, {21259, 1, 20}]}],
      exp_id => 1003, exp_ratio => [{3, 2}, {5, 3}, {10, 5}]};
get_monster({1, 2, 7, 90, 200}) ->
    #{chapter_id => 1, strongpoint_id => 2, unique => 7,
      id => 66000, type => 0, recover_type => 1,
      recover_value => 0, fixed_reward => [{90036, 10}],
      world_lv_min => 90, world_lv_max => 200,
      client_reward => [{21240, 1}, {21241, 1}],
      percent_reward =>
          [{0,
            [{21240, 1, 900}, {21241, 1, 80}, {21259, 1, 20}]}],
      exp_id => 1003, exp_ratio => [{3, 2}, {5, 3}, {10, 5}]};
get_monster({1, 2, 8, 90, 200}) ->
    #{chapter_id => 1, strongpoint_id => 2, unique => 8,
      id => 66008, type => 0, recover_type => 1,
      recover_value => 0, fixed_reward => [{90036, 10}],
      world_lv_min => 90, world_lv_max => 200,
      client_reward => [{21240, 1}, {21241, 1}],
      percent_reward =>
          [{0,
            [{21240, 1, 900}, {21241, 1, 80}, {21259, 1, 20}]}],
      exp_id => 1003, exp_ratio => [{3, 2}, {5, 3}, {10, 5}]};
get_monster({1, 2, 9, 90, 200}) ->
    #{chapter_id => 1, strongpoint_id => 2, unique => 9,
      id => 66000, type => 0, recover_type => 1,
      recover_value => 0, fixed_reward => [{90036, 10}],
      world_lv_min => 90, world_lv_max => 200,
      client_reward => [{21240, 1}, {21241, 1}],
      percent_reward =>
          [{0,
            [{21240, 1, 900}, {21241, 1, 80}, {21259, 1, 20}]}],
      exp_id => 1003, exp_ratio => [{3, 2}, {5, 3}, {10, 5}]};
get_monster({1, 2, 10, 90, 200}) ->
    #{chapter_id => 1, strongpoint_id => 2, unique => 10,
      id => 66008, type => 0, recover_type => 1,
      recover_value => 0, fixed_reward => [{90036, 10}],
      world_lv_min => 90, world_lv_max => 200,
      client_reward => [{21240, 1}, {21241, 1}],
      percent_reward =>
          [{0,
            [{21240, 1, 900}, {21241, 1, 80}, {21259, 1, 20}]}],
      exp_id => 1003, exp_ratio => [{3, 2}, {5, 3}, {10, 5}]};
get_monster({1, 2, 11, 90, 200}) ->
    #{chapter_id => 1, strongpoint_id => 2, unique => 11,
      id => 66003, type => 0, recover_type => 1,
      recover_value => 0, fixed_reward => [{90036, 10}],
      world_lv_min => 90, world_lv_max => 200,
      client_reward => [{21240, 1}, {21241, 1}],
      percent_reward =>
          [{0,
            [{21240, 1, 900}, {21241, 1, 80}, {21259, 1, 20}]}],
      exp_id => 1003, exp_ratio => [{3, 2}, {5, 3}, {10, 5}]};
get_monster({1, 2, 12, 90, 200}) ->
    #{chapter_id => 1, strongpoint_id => 2, unique => 12,
      id => 66011, type => 0, recover_type => 1,
      recover_value => 0, fixed_reward => [{90036, 10}],
      world_lv_min => 90, world_lv_max => 200,
      client_reward => [{21240, 1}, {21241, 1}],
      percent_reward =>
          [{0,
            [{21240, 1, 900}, {21241, 1, 80}, {21259, 1, 20}]}],
      exp_id => 1003, exp_ratio => [{3, 2}, {5, 3}, {10, 5}]};
get_monster({1, 3, 13, 90, 200}) ->
    #{chapter_id => 1, strongpoint_id => 3, unique => 13,
      id => 66000, type => 0, recover_type => 1,
      recover_value => 0, fixed_reward => [{90036, 10}],
      world_lv_min => 90, world_lv_max => 200,
      client_reward => [{21240, 1}, {21241, 1}],
      percent_reward =>
          [{0,
            [{21240, 1, 900}, {21241, 1, 80}, {21259, 1, 20}]}],
      exp_id => 1003, exp_ratio => [{3, 2}, {5, 3}, {10, 5}]};
get_monster({1, 3, 14, 90, 200}) ->
    #{chapter_id => 1, strongpoint_id => 3, unique => 14,
      id => 66008, type => 0, recover_type => 1,
      recover_value => 0, fixed_reward => [{90036, 10}],
      world_lv_min => 90, world_lv_max => 200,
      client_reward => [{21240, 1}, {21241, 1}],
      percent_reward =>
          [{0,
            [{21240, 1, 900}, {21241, 1, 80}, {21259, 1, 20}]}],
      exp_id => 1003, exp_ratio => [{3, 2}, {5, 3}, {10, 5}]};
get_monster({1, 3, 15, 90, 200}) ->
    #{chapter_id => 1, strongpoint_id => 3, unique => 15,
      id => 66000, type => 0, recover_type => 1,
      recover_value => 0, fixed_reward => [{90036, 10}],
      world_lv_min => 90, world_lv_max => 200,
      client_reward => [{21240, 1}, {21241, 1}],
      percent_reward =>
          [{0,
            [{21240, 1, 900}, {21241, 1, 80}, {21259, 1, 20}]}],
      exp_id => 1003, exp_ratio => [{3, 2}, {5, 3}, {10, 5}]};
get_monster({1, 3, 16, 90, 200}) ->
    #{chapter_id => 1, strongpoint_id => 3, unique => 16,
      id => 66008, type => 0, recover_type => 1,
      recover_value => 0, fixed_reward => [{90036, 10}],
      world_lv_min => 90, world_lv_max => 200,
      client_reward => [{21240, 1}, {21241, 1}],
      percent_reward =>
          [{0,
            [{21240, 1, 900}, {21241, 1, 80}, {21259, 1, 20}]}],
      exp_id => 1003, exp_ratio => [{3, 2}, {5, 3}, {10, 5}]};
get_monster({1, 3, 17, 90, 200}) ->
    #{chapter_id => 1, strongpoint_id => 3, unique => 17,
      id => 66003, type => 0, recover_type => 1,
      recover_value => 0, fixed_reward => [{90036, 10}],
      world_lv_min => 90, world_lv_max => 200,
      client_reward => [{21240, 1}, {21241, 1}],
      percent_reward =>
          [{0,
            [{21240, 1, 900}, {21241, 1, 80}, {21259, 1, 20}]}],
      exp_id => 1003, exp_ratio => [{3, 2}, {5, 3}, {10, 5}]};
get_monster({1, 3, 18, 90, 200}) ->
    #{chapter_id => 1, strongpoint_id => 3, unique => 18,
      id => 66011, type => 0, recover_type => 1,
      recover_value => 0, fixed_reward => [{90036, 10}],
      world_lv_min => 90, world_lv_max => 200,
      client_reward => [{21240, 1}, {21241, 1}],
      percent_reward =>
          [{0,
            [{21240, 1, 900}, {21241, 1, 80}, {21259, 1, 20}]}],
      exp_id => 1003, exp_ratio => [{3, 2}, {5, 3}, {10, 5}]};
get_monster({1, 4, 19, 90, 200}) ->
    #{chapter_id => 1, strongpoint_id => 4, unique => 19,
      id => 66000, type => 0, recover_type => 1,
      recover_value => 0, fixed_reward => [{90036, 10}],
      world_lv_min => 90, world_lv_max => 200,
      client_reward => [{21240, 1}, {21241, 1}],
      percent_reward =>
          [{0,
            [{21240, 1, 900}, {21241, 1, 80}, {21259, 1, 20}]}],
      exp_id => 1003, exp_ratio => [{3, 2}, {5, 3}, {10, 5}]};
get_monster({1, 4, 20, 90, 200}) ->
    #{chapter_id => 1, strongpoint_id => 4, unique => 20,
      id => 66008, type => 0, recover_type => 1,
      recover_value => 0, fixed_reward => [{90036, 10}],
      world_lv_min => 90, world_lv_max => 200,
      client_reward => [{21240, 1}, {21241, 1}],
      percent_reward =>
          [{0,
            [{21240, 1, 900}, {21241, 1, 80}, {21259, 1, 20}]}],
      exp_id => 1003, exp_ratio => [{3, 2}, {5, 3}, {10, 5}]};
get_monster({1, 4, 21, 90, 200}) ->
    #{chapter_id => 1, strongpoint_id => 4, unique => 21,
      id => 66000, type => 0, recover_type => 1,
      recover_value => 0, fixed_reward => [{90036, 10}],
      world_lv_min => 90, world_lv_max => 200,
      client_reward => [{21240, 1}, {21241, 1}],
      percent_reward =>
          [{0,
            [{21240, 1, 900}, {21241, 1, 80}, {21259, 1, 20}]}],
      exp_id => 1003, exp_ratio => [{3, 2}, {5, 3}, {10, 5}]};
get_monster({1, 4, 22, 90, 200}) ->
    #{chapter_id => 1, strongpoint_id => 4, unique => 22,
      id => 66008, type => 0, recover_type => 1,
      recover_value => 0, fixed_reward => [{90036, 10}],
      world_lv_min => 90, world_lv_max => 200,
      client_reward => [{21240, 1}, {21241, 1}],
      percent_reward =>
          [{0,
            [{21240, 1, 900}, {21241, 1, 80}, {21259, 1, 20}]}],
      exp_id => 1003, exp_ratio => [{3, 2}, {5, 3}, {10, 5}]};
get_monster({1, 4, 23, 90, 200}) ->
    #{chapter_id => 1, strongpoint_id => 4, unique => 23,
      id => 66003, type => 0, recover_type => 1,
      recover_value => 0, fixed_reward => [{90036, 10}],
      world_lv_min => 90, world_lv_max => 200,
      client_reward => [{21240, 1}, {21241, 1}],
      percent_reward =>
          [{0,
            [{21240, 1, 900}, {21241, 1, 80}, {21259, 1, 20}]}],
      exp_id => 1003, exp_ratio => [{3, 2}, {5, 3}, {10, 5}]};
get_monster({1, 4, 24, 90, 200}) ->
    #{chapter_id => 1, strongpoint_id => 4, unique => 24,
      id => 66011, type => 0, recover_type => 1,
      recover_value => 0, fixed_reward => [{90036, 10}],
      world_lv_min => 90, world_lv_max => 200,
      client_reward => [{21240, 1}, {21241, 1}],
      percent_reward =>
          [{0,
            [{21240, 1, 900}, {21241, 1, 80}, {21259, 1, 20}]}],
      exp_id => 1003, exp_ratio => [{3, 2}, {5, 3}, {10, 5}]};
get_monster({1, 5, 25, 90, 200}) ->
    #{chapter_id => 1, strongpoint_id => 5, unique => 25,
      id => 66000, type => 0, recover_type => 1,
      recover_value => 0, fixed_reward => [{90036, 10}],
      world_lv_min => 90, world_lv_max => 200,
      client_reward => [{21240, 1}, {21241, 1}],
      percent_reward =>
          [{0,
            [{21240, 1, 900}, {21241, 1, 80}, {21259, 1, 20}]}],
      exp_id => 1003, exp_ratio => [{3, 2}, {5, 3}, {10, 5}]};
get_monster({1, 5, 26, 90, 200}) ->
    #{chapter_id => 1, strongpoint_id => 5, unique => 26,
      id => 66008, type => 0, recover_type => 1,
      recover_value => 0, fixed_reward => [{90036, 10}],
      world_lv_min => 90, world_lv_max => 200,
      client_reward => [{21240, 1}, {21241, 1}],
      percent_reward =>
          [{0,
            [{21240, 1, 900}, {21241, 1, 80}, {21259, 1, 20}]}],
      exp_id => 1003, exp_ratio => [{3, 2}, {5, 3}, {10, 5}]};
get_monster({1, 5, 27, 90, 200}) ->
    #{chapter_id => 1, strongpoint_id => 5, unique => 27,
      id => 66000, type => 0, recover_type => 1,
      recover_value => 0, fixed_reward => [{90036, 10}],
      world_lv_min => 90, world_lv_max => 200,
      client_reward => [{21240, 1}, {21241, 1}],
      percent_reward =>
          [{0,
            [{21240, 1, 900}, {21241, 1, 80}, {21259, 1, 20}]}],
      exp_id => 1003, exp_ratio => [{3, 2}, {5, 3}, {10, 5}]};
get_monster({1, 5, 28, 90, 200}) ->
    #{chapter_id => 1, strongpoint_id => 5, unique => 28,
      id => 66008, type => 0, recover_type => 1,
      recover_value => 0, fixed_reward => [{90036, 10}],
      world_lv_min => 90, world_lv_max => 200,
      client_reward => [{21240, 1}, {21241, 1}],
      percent_reward =>
          [{0,
            [{21240, 1, 900}, {21241, 1, 80}, {21259, 1, 20}]}],
      exp_id => 1003, exp_ratio => [{3, 2}, {5, 3}, {10, 5}]};
get_monster({1, 5, 29, 90, 200}) ->
    #{chapter_id => 1, strongpoint_id => 5, unique => 29,
      id => 66003, type => 0, recover_type => 1,
      recover_value => 0, fixed_reward => [{90036, 10}],
      world_lv_min => 90, world_lv_max => 200,
      client_reward => [{21240, 1}, {21241, 1}],
      percent_reward =>
          [{0,
            [{21240, 1, 900}, {21241, 1, 80}, {21259, 1, 20}]}],
      exp_id => 1003, exp_ratio => [{3, 2}, {5, 3}, {10, 5}]};
get_monster({1, 5, 30, 90, 200}) ->
    #{chapter_id => 1, strongpoint_id => 5, unique => 30,
      id => 66011, type => 0, recover_type => 1,
      recover_value => 0, fixed_reward => [{90036, 10}],
      world_lv_min => 90, world_lv_max => 200,
      client_reward => [{21240, 1}, {21241, 1}],
      percent_reward =>
          [{0,
            [{21240, 1, 900}, {21241, 1, 80}, {21259, 1, 20}]}],
      exp_id => 1003, exp_ratio => [{3, 2}, {5, 3}, {10, 5}]};
get_monster({1, 6, 31, 90, 200}) ->
    #{chapter_id => 1, strongpoint_id => 6, unique => 31,
      id => 66000, type => 0, recover_type => 1,
      recover_value => 0, fixed_reward => [{90036, 10}],
      world_lv_min => 90, world_lv_max => 200,
      client_reward => [{21240, 1}, {21241, 1}],
      percent_reward =>
          [{0,
            [{21240, 1, 900}, {21241, 1, 80}, {21259, 1, 20}]}],
      exp_id => 1003, exp_ratio => [{3, 2}, {5, 3}, {10, 5}]};
get_monster({1, 6, 32, 90, 200}) ->
    #{chapter_id => 1, strongpoint_id => 6, unique => 32,
      id => 66008, type => 0, recover_type => 1,
      recover_value => 0, fixed_reward => [{90036, 10}],
      world_lv_min => 90, world_lv_max => 200,
      client_reward => [{21240, 1}, {21241, 1}],
      percent_reward =>
          [{0,
            [{21240, 1, 900}, {21241, 1, 80}, {21259, 1, 20}]}],
      exp_id => 1003, exp_ratio => [{3, 2}, {5, 3}, {10, 5}]};
get_monster({1, 6, 33, 90, 200}) ->
    #{chapter_id => 1, strongpoint_id => 6, unique => 33,
      id => 66000, type => 0, recover_type => 1,
      recover_value => 0, fixed_reward => [{90036, 10}],
      world_lv_min => 90, world_lv_max => 200,
      client_reward => [{21240, 1}, {21241, 1}],
      percent_reward =>
          [{0,
            [{21240, 1, 900}, {21241, 1, 80}, {21259, 1, 20}]}],
      exp_id => 1003, exp_ratio => [{3, 2}, {5, 3}, {10, 5}]};
get_monster({1, 6, 34, 90, 200}) ->
    #{chapter_id => 1, strongpoint_id => 6, unique => 34,
      id => 66008, type => 0, recover_type => 1,
      recover_value => 0, fixed_reward => [{90036, 10}],
      world_lv_min => 90, world_lv_max => 200,
      client_reward => [{21240, 1}, {21241, 1}],
      percent_reward =>
          [{0,
            [{21240, 1, 900}, {21241, 1, 80}, {21259, 1, 20}]}],
      exp_id => 1003, exp_ratio => [{3, 2}, {5, 3}, {10, 5}]};
get_monster({1, 6, 35, 90, 200}) ->
    #{chapter_id => 1, strongpoint_id => 6, unique => 35,
      id => 66003, type => 0, recover_type => 1,
      recover_value => 0, fixed_reward => [{90036, 10}],
      world_lv_min => 90, world_lv_max => 200,
      client_reward => [{21240, 1}, {21241, 1}],
      percent_reward =>
          [{0,
            [{21240, 1, 900}, {21241, 1, 80}, {21259, 1, 20}]}],
      exp_id => 1003, exp_ratio => [{3, 2}, {5, 3}, {10, 5}]};
get_monster({1, 6, 36, 90, 200}) ->
    #{chapter_id => 1, strongpoint_id => 6, unique => 36,
      id => 66011, type => 0, recover_type => 1,
      recover_value => 0, fixed_reward => [{90036, 10}],
      world_lv_min => 90, world_lv_max => 200,
      client_reward => [{21240, 1}, {21241, 1}],
      percent_reward =>
          [{0,
            [{21240, 1, 900}, {21241, 1, 80}, {21259, 1, 20}]}],
      exp_id => 1003, exp_ratio => [{3, 2}, {5, 3}, {10, 5}]};
get_monster(_) -> false.

get_award_world_lv() ->
    [{1, 1, 1, 60, 85},
     {1, 1, 2, 60, 85},
     {1, 1, 3, 60, 85},
     {1, 1, 4, 60, 85},
     {1, 1, 5, 60, 85},
     {1, 1, 6, 60, 85},
     {1, 2, 7, 60, 85},
     {1, 2, 8, 60, 85},
     {1, 2, 9, 60, 85},
     {1, 2, 10, 60, 85},
     {1, 2, 11, 60, 85},
     {1, 2, 12, 60, 85},
     {1, 3, 13, 60, 85},
     {1, 3, 14, 60, 85},
     {1, 3, 15, 60, 85},
     {1, 3, 16, 60, 85},
     {1, 3, 17, 60, 85},
     {1, 3, 18, 60, 85},
     {1, 4, 19, 60, 85},
     {1, 4, 20, 60, 85},
     {1, 4, 21, 60, 85},
     {1, 4, 22, 60, 85},
     {1, 4, 23, 60, 85},
     {1, 4, 24, 60, 85},
     {1, 5, 25, 60, 85},
     {1, 5, 26, 60, 85},
     {1, 5, 27, 60, 85},
     {1, 5, 28, 60, 85},
     {1, 5, 29, 60, 85},
     {1, 5, 30, 60, 85},
     {1, 6, 31, 60, 85},
     {1, 6, 32, 60, 85},
     {1, 6, 33, 60, 85},
     {1, 6, 34, 60, 85},
     {1, 6, 35, 60, 85},
     {1, 6, 36, 60, 85},
     {1, 1, 1, 90, 200},
     {1, 1, 2, 90, 200},
     {1, 1, 3, 90, 200},
     {1, 1, 4, 90, 200},
     {1, 1, 5, 90, 200},
     {1, 1, 6, 90, 200},
     {1, 2, 7, 90, 200},
     {1, 2, 8, 90, 200},
     {1, 2, 9, 90, 200},
     {1, 2, 10, 90, 200},
     {1, 2, 11, 90, 200},
     {1, 2, 12, 90, 200},
     {1, 3, 13, 90, 200},
     {1, 3, 14, 90, 200},
     {1, 3, 15, 90, 200},
     {1, 3, 16, 90, 200},
     {1, 3, 17, 90, 200},
     {1, 3, 18, 90, 200},
     {1, 4, 19, 90, 200},
     {1, 4, 20, 90, 200},
     {1, 4, 21, 90, 200},
     {1, 4, 22, 90, 200},
     {1, 4, 23, 90, 200},
     {1, 4, 24, 90, 200},
     {1, 5, 25, 90, 200},
     {1, 5, 26, 90, 200},
     {1, 5, 27, 90, 200},
     {1, 5, 28, 90, 200},
     {1, 5, 29, 90, 200},
     {1, 5, 30, 90, 200},
     {1, 6, 31, 90, 200},
     {1, 6, 32, 90, 200},
     {1, 6, 33, 90, 200},
     {1, 6, 34, 90, 200},
     {1, 6, 35, 90, 200},
     {1, 6, 36, 90, 200}].

get_exp_ratio(_) -> false.

