-file("src/data/preparation_data.erl", 1).

-module(preparation_data).

-export([list/0, get/1]).

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

-file("src/data/preparation_data.erl", 15).

list() -> [1000].

get(1000) ->
    #{id => 1000, open_lev => 30, team_limit => 2,
      max_num => 4, min_num => 4, subtrahend => 0, mode => 1,
      map => 40000, npc => [{76700, 2045, 1511}]};
get(_) -> false.

