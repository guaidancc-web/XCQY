-file("src/data/lucky_money_data.erl", 1).

-module(lucky_money_data).

-export([get_lucky_money/1,
         get_lucky_money_id/1,
         get_time_list/0]).

get_lucky_money({1, 1}) ->
    #{round_id => 1, day => 1, id => 1,
      assets_type => 90000, assets_value => 200000,
      ratio => 20, limit => 3000000,
      reward => [{90000, 1, 300000}]};
get_lucky_money({1, 2}) ->
    #{round_id => 1, day => 2, id => 2,
      assets_type => 90003, assets_value => 5000, ratio => 10,
      limit => 60000, reward => [{90003, 1, 5000}]};
get_lucky_money({1, 3}) ->
    #{round_id => 1, day => 3, id => 3,
      assets_type => 90000, assets_value => 100000,
      ratio => 20, limit => 3000000,
      reward => [{90000, 1, 500000}]};
get_lucky_money({1, 4}) ->
    #{round_id => 1, day => 4, id => 4,
      assets_type => 90000, assets_value => 200000,
      ratio => 20, limit => 3000000,
      reward => [{90000, 1, 600000}]};
get_lucky_money({1, 5}) ->
    #{round_id => 1, day => 5, id => 5,
      assets_type => 90003, assets_value => 5000, ratio => 10,
      limit => 60000, reward => [{90003, 1, 6000}]};
get_lucky_money({2, 1}) ->
    #{round_id => 2, day => 1, id => 6,
      assets_type => 90000, assets_value => 100000,
      ratio => 20, limit => 3000000,
      reward => [{90000, 1, 200000}]};
get_lucky_money({2, 2}) ->
    #{round_id => 2, day => 2, id => 7,
      assets_type => 90000, assets_value => 200000,
      ratio => 20, limit => 3000000,
      reward => [{90000, 1, 300000}]};
get_lucky_money({2, 3}) ->
    #{round_id => 2, day => 3, id => 8,
      assets_type => 90003, assets_value => 5000, ratio => 10,
      limit => 60000, reward => [{90003, 1, 5000}]};
get_lucky_money({2, 4}) ->
    #{round_id => 2, day => 4, id => 9,
      assets_type => 90000, assets_value => 100000,
      ratio => 20, limit => 3000000,
      reward => [{90000, 1, 500000}]};
get_lucky_money({2, 5}) ->
    #{round_id => 2, day => 5, id => 10,
      assets_type => 90000, assets_value => 200000,
      ratio => 20, limit => 3000000,
      reward => [{90000, 1, 600000}]};
get_lucky_money(_) -> false.

get_lucky_money_id(1) -> #{round_id => 1, day => 1};
get_lucky_money_id(2) -> #{round_id => 1, day => 2};
get_lucky_money_id(3) -> #{round_id => 1, day => 3};
get_lucky_money_id(4) -> #{round_id => 1, day => 4};
get_lucky_money_id(5) -> #{round_id => 1, day => 5};
get_lucky_money_id(6) -> #{round_id => 2, day => 1};
get_lucky_money_id(7) -> #{round_id => 2, day => 2};
get_lucky_money_id(8) -> #{round_id => 2, day => 3};
get_lucky_money_id(9) -> #{round_id => 2, day => 4};
get_lucky_money_id(10) -> #{round_id => 2, day => 5};
get_lucky_money_id(_) -> false.

get_time_list() ->
    [{1, 1579708800, 1580140799},
     {2, 1580140800, 1580572799}].

