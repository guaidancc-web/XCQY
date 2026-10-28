-file("src/data/red_packet_data.erl", 1).

-module(red_packet_data).

-export([get_red_packet/1]).

get_red_packet({1, 1}) ->
    #{type => 1, lev => 1, assets => 90000, val => 300000,
      cost => [{90002, 68}], min => 5, max => 10,
      is_soul => 0};
get_red_packet({1, 2}) ->
    #{type => 1, lev => 2, assets => 90000, val => 750000,
      cost => [{90002, 168}], min => 5, max => 12,
      is_soul => 0};
get_red_packet({1, 3}) ->
    #{type => 1, lev => 3, assets => 90000, val => 1300000,
      cost => [{90002, 288}], min => 10, max => 18,
      is_soul => 0};
get_red_packet({1, 4}) ->
    #{type => 1, lev => 4, assets => 90000, val => 2650000,
      cost => [{90002, 588}], min => 15, max => 20,
      is_soul => 1};
get_red_packet({1, 5}) ->
    #{type => 1, lev => 5, assets => 90000, val => 3990000,
      cost => [{90002, 888}], min => 20, max => 30,
      is_soul => 1};
get_red_packet({1, 6}) ->
    #{type => 1, lev => 6, assets => 90000, val => 7600000,
      cost => [{90002, 1688}], min => 25, max => 35,
      is_soul => 1};
get_red_packet({2, 1}) ->
    #{type => 2, lev => 1, assets => 90000, val => 1300000,
      cost => [{90002, 288}], min => 10, max => 18,
      is_soul => 0};
get_red_packet({2, 2}) ->
    #{type => 2, lev => 2, assets => 90000, val => 2650000,
      cost => [{90002, 588}], min => 15, max => 20,
      is_soul => 1};
get_red_packet({2, 3}) ->
    #{type => 2, lev => 3, assets => 90000, val => 3990000,
      cost => [{90002, 888}], min => 20, max => 30,
      is_soul => 1};
get_red_packet({2, 4}) ->
    #{type => 2, lev => 4, assets => 90000, val => 7600000,
      cost => [{90002, 1688}], min => 25, max => 35,
      is_soul => 1};
get_red_packet({2, 5}) ->
    #{type => 2, lev => 5, assets => 90003, val => 68000,
      cost => [{90002, 1688}], min => 25, max => 35,
      is_soul => 1};
get_red_packet({2, 6}) ->
    #{type => 2, lev => 6, assets => 90003, val => 138000,
      cost => [{90002, 2988}], min => 30, max => 40,
      is_soul => 1};
get_red_packet({3, 1}) ->
    #{type => 3, lev => 1, assets => 90000, val => 3990000,
      cost => [{90002, 888}], min => 20, max => 30,
      is_soul => 0};
get_red_packet({3, 2}) ->
    #{type => 3, lev => 2, assets => 90000, val => 7600000,
      cost => [{90002, 1688}], min => 25, max => 35,
      is_soul => 0};
get_red_packet({3, 3}) ->
    #{type => 3, lev => 3, assets => 90000, val => 13800000,
      cost => [{90002, 2988}], min => 30, max => 40,
      is_soul => 0};
get_red_packet(_) -> false.

