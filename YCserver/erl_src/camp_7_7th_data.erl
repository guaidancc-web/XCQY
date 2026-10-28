-file("src/data/camp_7_7th_data.erl", 1).

-module(camp_7_7th_data).

-export([get_reward/0, get_gain_by_times/1]).

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

-file("src/data/camp_7_7th_data.erl", 16).

get_reward() -> [{71007, 0, 1, 1}, {29143, 0, 2, 1}].

get_gain_by_times(1) -> [{71008, 1}];
get_gain_by_times(2) -> [{71009, 1}];
get_gain_by_times(3) -> [{71010, 1}];
get_gain_by_times(_) -> [].

