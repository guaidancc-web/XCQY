-file("src/data/sing_data.erl", 1).

-module(sing_data).

-export([get/1, get_odds/1, get_reward/0]).

get({0, 1, Rank}) when Rank >= 1 andalso Rank =< 1 ->
    [{23631, 1},
     {23633, 1},
     {22586, 1},
     {20617, 1},
     {29314, 2},
     {22758, 1}];
get({0, 1, Rank}) when Rank >= 2 andalso Rank =< 2 ->
    [{23631, 1},
     {23633, 1},
     {22586, 1},
     {29314, 1},
     {22759, 1}];
get({0, 1, Rank}) when Rank >= 3 andalso Rank =< 3 ->
    [{23631, 1}, {23633, 1}, {29314, 1}, {22760, 1}];
get({0, 1, Rank}) when Rank >= 4 andalso Rank =< 10 ->
    [{23633, 1}, {22216, 2}, {20000, 2}, {22761, 1}];
get({0, 1, Rank}) when Rank >= 11 andalso Rank =< 20 ->
    [{22216, 1}, {20000, 1}];
get({0, 1, Rank})
    when Rank >= 21 andalso Rank =< 9999999 ->
    [{20000, 1}];
get({1, 2, Rank}) when Rank >= 1 andalso Rank =< 1 ->
    [{22774, 1},
     {23634, 1},
     {29594, 1},
     {23151, 1},
     {29314, 3}];
get({1, 2, Rank}) when Rank >= 2 andalso Rank =< 2 ->
    [{22775, 1},
     {23634, 1},
     {29594, 1},
     {23151, 1},
     {29314, 3}];
get({1, 2, Rank}) when Rank >= 3 andalso Rank =< 3 ->
    [{22776, 1},
     {23634, 1},
     {29594, 1},
     {29314, 3},
     {22586, 2}];
get({1, 2, Rank}) when Rank >= 4 andalso Rank =< 10 ->
    [{22777, 1}, {23634, 1}, {29153, 1}, {22586, 1}];
get({1, 2, Rank}) when Rank >= 11 andalso Rank =< 20 ->
    [{23643, 1}, {29153, 1}, {22586, 1}];
get({1, 2, Rank}) when Rank >= 21 andalso Rank =< 50 ->
    [{23644, 1}, {29153, 1}, {29314, 1}];
get({1, 2, Rank})
    when Rank >= 51 andalso Rank =< 9999999 ->
    [{29153, 1}];
get({2, 2, Rank}) when Rank >= 1 andalso Rank =< 1 ->
    [{22778, 1},
     {23634, 1},
     {29594, 1},
     {23632, 1},
     {29314, 1}];
get({2, 2, Rank}) when Rank >= 2 andalso Rank =< 2 ->
    [{22779, 1},
     {23634, 1},
     {29595, 1},
     {23632, 1},
     {29314, 1}];
get({2, 2, Rank}) when Rank >= 3 andalso Rank =< 3 ->
    [{22780, 1},
     {23634, 1},
     {29596, 1},
     {29314, 1},
     {23632, 2}];
get({2, 2, Rank}) when Rank >= 4 andalso Rank =< 10 ->
    [{22781, 1}, {23643, 1}, {29153, 1}, {29314, 1}];
get({2, 2, Rank}) when Rank >= 11 andalso Rank =< 20 ->
    [{23643, 1}, {29153, 1}, {29314, 1}];
get({2, 2, Rank}) when Rank >= 21 andalso Rank =< 50 ->
    [{23644, 1}, {29153, 1}, {29314, 1}];
get({2, 2, Rank})
    when Rank >= 51 andalso Rank =< 9999999 ->
    [{29153, 1}];
get(_) -> [].

get_odds(1) -> 2000;
get_odds(2) -> 0;
get_odds(3) -> 0;
get_odds(4) -> 0;
get_odds(5) -> 0;
get_odds(6) -> 0;
get_odds(_) -> false.

get_reward() ->
    [{20004, 1, 0, 30},
     {20005, 1, 0, 20},
     {20006, 1, 0, 250},
     {20019, 1, 0, 250},
     {20020, 1, 0, 20},
     {20025, 1, 0, 10},
     {20052, 1, 0, 20},
     {20060, 1, 0, 70},
     {90000, 12000, 0, 330}].

