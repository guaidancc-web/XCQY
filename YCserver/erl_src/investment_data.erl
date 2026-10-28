-file("src/data/investment_data.erl", 1).

-module(investment_data).

-export([get_revenue/1, get_revenue2/1]).

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

-file("src/data/investment_data.erl", 15).

get_revenue({1, 1}) -> [{90002, 880}];
get_revenue({2, 1}) -> [{90002, 300}];
get_revenue({3, 1}) -> [{90002, 300}];
get_revenue({4, 1}) -> [{90002, 300}];
get_revenue({5, 1}) -> [{90002, 300}];
get_revenue({6, 1}) -> [{90002, 300}];
get_revenue({7, 1}) -> [{90002, 500}];
get_revenue({1, 2}) -> [{90002, 680}];
get_revenue({2, 2}) -> [{90002, 200}];
get_revenue({3, 2}) -> [{90002, 200}];
get_revenue({4, 2}) -> [{90002, 200}];
get_revenue({5, 2}) -> [{90002, 200}];
get_revenue({6, 2}) -> [{90002, 200}];
get_revenue({7, 2}) -> [{90002, 300}];
get_revenue(_Id) -> none.

get_revenue2(1) -> [{90002, 1180}, {90003, 10000}];
get_revenue2(2) -> [{90002, 400}, {90003, 3000}];
get_revenue2(3) -> [{90002, 400}, {90003, 3000}];
get_revenue2(4) -> [{90002, 400}, {90003, 3000}];
get_revenue2(5) -> [{90002, 400}, {90003, 3000}];
get_revenue2(6) -> [{90002, 400}, {90003, 3000}];
get_revenue2(7) -> [{90002, 500}, {90003, 5000}];
get_revenue2(_Id) -> none.

