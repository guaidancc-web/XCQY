-file("src/data/gods_challenge_data.erl", 1).

-module(gods_challenge_data).

-export([wave_list/0,
         get_wave_info/1,
         get_reward_info/1]).

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

-file("src/data/gods_challenge_data.erl", 16).

wave_list() -> [1, 2, 3].

get_wave_info(1) -> #{wave => 1, unit_id => 84002};
get_wave_info(2) -> #{wave => 2, unit_id => 84023};
get_wave_info(3) -> #{wave => 3, unit_id => 84001};
get_wave_info(_) -> false.

get_reward_info(1) ->
    #{reward_type => 1, exp_mod => 3323, buff => 21103,
      reward => [{22847, 0, 1}, {22907, 0, 1}]};
get_reward_info(2) ->
    #{reward_type => 2, exp_mod => 3300, buff => 21103,
      reward => [{22908, 0, 1}]};
get_reward_info(_) -> false.

