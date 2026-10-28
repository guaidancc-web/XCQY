-file("src/data/growth_fund_data.erl", 1).

-module(growth_fund_data).

-export([get_reward/1]).

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

-file("src/data/growth_fund_data.erl", 14).

get_reward({1980, 1}) ->
    #{gold => 1980, id => 1, reward => [{90002, 1980}],
      lev => 1};
get_reward({1980, 2}) ->
    #{gold => 1980, id => 2, reward => [{90026, 1000}],
      lev => 40};
get_reward({1980, 3}) ->
    #{gold => 1980, id => 3, reward => [{90026, 1500}],
      lev => 50};
get_reward({1980, 4}) ->
    #{gold => 1980, id => 4, reward => [{90026, 2000}],
      lev => 60};
get_reward({1980, 5}) ->
    #{gold => 1980, id => 5, reward => [{90026, 2500}],
      lev => 70};
get_reward({1980, 6}) ->
    #{gold => 1980, id => 6, reward => [{90026, 3000}],
      lev => 80};
get_reward({1980, 7}) ->
    #{gold => 1980, id => 7, reward => [{90026, 3500}],
      lev => 90};
get_reward({1980, 8}) ->
    #{gold => 1980, id => 8, reward => [{90026, 4000}],
      lev => 99};
get_reward({980, 1}) ->
    #{gold => 980, id => 1, reward => [{90002, 980}],
      lev => 1};
get_reward({980, 2}) ->
    #{gold => 980, id => 2, reward => [{90026, 500}],
      lev => 40};
get_reward({980, 3}) ->
    #{gold => 980, id => 3, reward => [{90026, 800}],
      lev => 50};
get_reward({980, 4}) ->
    #{gold => 980, id => 4, reward => [{90026, 1000}],
      lev => 60};
get_reward({980, 5}) ->
    #{gold => 980, id => 5, reward => [{90026, 1000}],
      lev => 70};
get_reward({980, 6}) ->
    #{gold => 980, id => 6, reward => [{90026, 1000}],
      lev => 80};
get_reward({980, 7}) ->
    #{gold => 980, id => 7, reward => [{90026, 1500}],
      lev => 90};
get_reward({980, 8}) ->
    #{gold => 980, id => 8, reward => [{90026, 2000}],
      lev => 99};
get_reward(_Lv) -> false.

