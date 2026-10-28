-file("src/data/camp_charge_seven_gift_data.erl", 1).

-module(camp_charge_seven_gift_data).

-export([get/1, get_reward/1, get_all/0]).

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

-file("src/data/camp_charge_seven_gift_data.erl", 16).

get(3184) ->
    {3184,
     980,
     lang:get("超值好礼"),
     lang:get("亲爱的玩家，以下为在超值好礼活动中您购买后尚未领取的礼包，请查收")};
get(_) -> false.

get_reward(1) -> {1, [{71452, 0, 1}], 0};
get_reward(2) -> {2, [{71453, 0, 1}], 0};
get_reward(3) -> {3, [{71454, 0, 1}], 0};
get_reward(4) -> {4, [{71431, 0, 1}], 0};
get_reward(5) -> {5, [{71432, 0, 1}], 0};
get_reward(6) -> {6, [{71433, 0, 1}], 0};
get_reward(7) -> {7, [{71434, 0, 1}], 0};
get_reward(_) -> false.

get_all() -> [1, 2, 3, 4, 5, 6, 7].

