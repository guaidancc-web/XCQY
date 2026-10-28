-file("src/data/sworn_data.erl", 1).

-module(sworn_data).

-export([get_loss/1, list/0]).

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

-file("src/data/sworn_data.erl", 15).

list() -> [1, 2, 3, 4, 5].

get_loss({1}) ->
    #{times => 1, prefix => 500, personal => 1000000};
get_loss({2}) ->
    #{times => 2, prefix => 500, personal => 1000000};
get_loss({3}) ->
    #{times => 3, prefix => 500, personal => 1000000};
get_loss({4}) ->
    #{times => 4, prefix => 500, personal => 1000000};
get_loss({5}) ->
    #{times => 5, prefix => 500, personal => 1000000};
get_loss({_Times}) -> false.

