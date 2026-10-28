-file("src/data/brave_trial_data.erl", 1).

-module(brave_trial_data).

-export([list/0,
         day_list/0,
         get/1,
         get_round_reward/1,
         get_round_difficult/1,
         get_announce/0]).

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

-file("src/data/brave_trial_data.erl", 19).

list() -> [1, 2, 3, 4, 5].

day_list() ->
    [[{2020, 4, 29}], [{2020, 4, 30}], [{2020, 5, 1}]].

get(1) ->
    #{id => 1, unit_id => 76600,
      location => [{10002, 1602, 431}]};
get(2) ->
    #{id => 2, unit_id => 76601,
      location => [{10004, 2583, 585}]};
get(3) ->
    #{id => 3, unit_id => 76602,
      location => [{10003, 1431, 284}]};
get(4) ->
    #{id => 4, unit_id => 76603,
      location => [{10007, 1116, 1078}]};
get(5) ->
    #{id => 5, unit_id => 76604,
      location => [{10001, 4642, 1178}]};
get(_) -> false.

get_round_reward(1) ->
    #{id => 1, model => 3342,
      reward =>
          [{71568, 1, 300},
           {20006, 5, 300},
           {20075, 1, 20},
           {20000, 1, 30},
           {20002, 1, 30},
           {20013, 1, 50},
           {20025, 1, 50},
           {21220, 1, 50},
           {20087, 1, 30},
           {20060, 1, 45},
           {20020, 2, 50},
           {20021, 1, 45}],
      reward2 => [], odds => 1000};
get_round_reward(2) ->
    #{id => 2, model => 3343,
      reward =>
          [{71568, 1, 300},
           {20006, 5, 300},
           {20075, 1, 20},
           {20000, 1, 30},
           {20002, 1, 30},
           {20013, 1, 50},
           {20025, 1, 50},
           {21220, 1, 50},
           {20087, 1, 30},
           {20060, 1, 45},
           {20020, 2, 50},
           {20021, 1, 45}],
      reward2 => [], odds => 1000};
get_round_reward(3) ->
    #{id => 3, model => 3344,
      reward =>
          [{71568, 1, 300},
           {20006, 5, 300},
           {20075, 1, 20},
           {20000, 1, 30},
           {20002, 1, 30},
           {20013, 1, 50},
           {20025, 1, 50},
           {21220, 1, 50},
           {20087, 1, 30},
           {20060, 1, 45},
           {20020, 2, 50},
           {20021, 1, 45}],
      reward2 => [], odds => 1000};
get_round_reward(4) ->
    #{id => 4, model => 3345,
      reward =>
          [{71568, 1, 300},
           {20006, 5, 300},
           {20075, 1, 20},
           {20000, 1, 30},
           {20002, 1, 30},
           {20013, 1, 50},
           {20025, 1, 50},
           {21220, 1, 50},
           {20087, 1, 30},
           {20060, 1, 45},
           {20020, 2, 50},
           {20021, 1, 45}],
      reward2 => [], odds => 1000};
get_round_reward(5) ->
    #{id => 5, model => 3346,
      reward =>
          [{71568, 1, 300},
           {20006, 5, 300},
           {20075, 1, 20},
           {20000, 1, 30},
           {20002, 1, 30},
           {20013, 1, 50},
           {20025, 1, 50},
           {21220, 1, 50},
           {20087, 1, 30},
           {20060, 1, 45},
           {20020, 2, 50},
           {20021, 1, 45}],
      reward2 =>
          [{71568, 1, 80},
           {20038, 1, 20},
           {20618, 1, 60},
           {20006, 6, 150},
           {20013, 1, 80},
           {20025, 1, 60},
           {20060, 1, 37},
           {20045, 1, 60},
           {20046, 1, 60},
           {21100, 1, 55},
           {20087, 1, 60},
           {20021, 2, 80},
           {20022, 1, 77},
           {20020, 2, 60},
           {20007, 1, 61}],
      odds => 1000};
get_round_reward(_) -> false.

get_round_difficult(1) ->
    #{id => 1, attr => [{51, 100}, {54, 100}, {55, 100}]};
get_round_difficult(2) ->
    #{id => 2, attr => [{51, 100}, {54, 100}, {55, 100}]};
get_round_difficult(3) ->
    #{id => 3, attr => [{51, 100}, {54, 100}, {55, 100}]};
get_round_difficult(4) ->
    #{id => 4, attr => [{51, 100}, {54, 100}, {55, 100}]};
get_round_difficult(5) ->
    #{id => 5, attr => [{51, 100}, {54, 100}, {55, 100}]};
get_round_difficult(_) -> false.

get_announce() -> [20007, 20022, 20038, 20087, 70814].

