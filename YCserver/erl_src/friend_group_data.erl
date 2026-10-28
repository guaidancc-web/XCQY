-file("src/data/friend_group_data.erl", 1).

-module(friend_group_data).

-export([get/1]).

get(1) ->
    #{num => 1, lev => 60, cost => [{90000, 2000000}]};
get(2) ->
    #{num => 2, lev => 60, cost => [{90002, 300}]};
get(_) -> false.

