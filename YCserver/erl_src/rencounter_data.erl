-file("src/data/rencounter_data.erl", 1).

-module(rencounter_data).

-export([get_group_id/2,
         get_total/1,
         get_rewards/1,
         get_rank_star/1,
         get_rank_reward/2]).

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

-file("src/data/rencounter_data.erl", 19).

get_group_id(Lev, BreakTimes)
    when (BreakTimes =:= 0 andalso Lev >= 65 orelse
              BreakTimes > 0)
             andalso
             (BreakTimes =:= 0 andalso Lev =< 69 orelse
                  BreakTimes < 0) ->
    2;
get_group_id(Lev, BreakTimes)
    when (BreakTimes =:= 0 andalso Lev >= 70 orelse
              BreakTimes > 0)
             andalso
             (BreakTimes =:= 0 andalso Lev =< 74 orelse
                  BreakTimes < 0) ->
    3;
get_group_id(Lev, BreakTimes)
    when (BreakTimes =:= 0 andalso Lev >= 75 orelse
              BreakTimes > 0)
             andalso
             (BreakTimes =:= 0 andalso Lev =< 79 orelse
                  BreakTimes < 0) ->
    4;
get_group_id(Lev, BreakTimes)
    when (BreakTimes =:= 0 andalso Lev >= 80 orelse
              BreakTimes > 0)
             andalso
             (BreakTimes =:= 0 andalso Lev =< 84 orelse
                  BreakTimes < 0) ->
    5;
get_group_id(Lev, BreakTimes)
    when (BreakTimes =:= 0 andalso Lev >= 85 orelse
              BreakTimes > 0)
             andalso
             (BreakTimes =:= 0 andalso Lev =< 88 orelse
                  BreakTimes < 0) ->
    6;
get_group_id(Lev, BreakTimes)
    when (BreakTimes =:= 0 andalso Lev >= 89 orelse
              BreakTimes > 0)
             andalso
             (BreakTimes =:= 0 andalso Lev =< 89 orelse
                  BreakTimes < 0) ->
    7;
get_group_id(Lev, BreakTimes)
    when (BreakTimes =:= 0 andalso Lev >= 90 orelse
              BreakTimes > 0)
             andalso
             (BreakTimes =:= 0 andalso Lev =< 94 orelse
                  BreakTimes < 0) ->
    8;
get_group_id(Lev, BreakTimes)
    when (BreakTimes =:= 0 andalso Lev >= 95 orelse
              BreakTimes > 0)
             andalso
             (BreakTimes =:= 0 andalso Lev =< 99 orelse
                  BreakTimes < 0) ->
    9;
get_group_id(Lev, BreakTimes)
    when (BreakTimes =:= 0 andalso Lev >= 100 orelse
              BreakTimes > 0)
             andalso
             (BreakTimes =:= 1 andalso Lev =< 99 orelse
                  BreakTimes < 1) ->
    10;
get_group_id(Lev, BreakTimes)
    when (BreakTimes =:= 1 andalso Lev >= 100 orelse
              BreakTimes > 1)
             andalso
             (BreakTimes =:= 1 andalso Lev =< 104 orelse
                  BreakTimes < 1) ->
    11;
get_group_id(Lev, BreakTimes)
    when (BreakTimes =:= 1 andalso Lev >= 105 orelse
              BreakTimes > 1)
             andalso
             (BreakTimes =:= 1 andalso Lev =< 108 orelse
                  BreakTimes < 1) ->
    12;
get_group_id(Lev, BreakTimes)
    when (BreakTimes =:= 1 andalso Lev >= 109 orelse
              BreakTimes > 1)
             andalso
             (BreakTimes =:= 1 andalso Lev =< 109 orelse
                  BreakTimes < 1) ->
    13;
get_group_id(Lev, BreakTimes)
    when (BreakTimes =:= 1 andalso Lev >= 110 orelse
              BreakTimes > 1)
             andalso
             (BreakTimes =:= 1 andalso Lev =< 119 orelse
                  BreakTimes < 1) ->
    14;
get_group_id(Lev, BreakTimes)
    when (BreakTimes =:= 1 andalso Lev >= 120 orelse
              BreakTimes > 1)
             andalso
             (BreakTimes =:= 1 andalso Lev =< 130 orelse
                  BreakTimes < 1) ->
    15;
get_group_id(_, _) -> 0.

get_total(1) -> 0;
get_total(2) -> 3;
get_total(3) -> 7;
get_total(4) -> 12;
get_total(5) -> 17;
get_total(6) -> 22;
get_total(_) -> 0.

get_rewards({1, 1}) ->
    #{season_item => [{90020, 10}, {20000, 1}],
      win_drop => 74250, lose_drop => 74251, exp_mod => 3323,
      exp_win_rate => 262, exp_loss_rate => 262};
get_rewards({1, 2}) ->
    #{stage_item => [{90020, 8}, {21774, 1}],
      season_item => [{90020, 12}, {20087, 1}],
      win_drop => 74250, lose_drop => 74251, exp_mod => 3323,
      exp_win_rate => 262, exp_loss_rate => 262};
get_rewards({1, 3}) ->
    #{stage_item => [{90020, 10}, {21775, 1}],
      season_item => [{90020, 15}, {22585, 1}],
      win_drop => 74250, lose_drop => 74251, exp_mod => 3323,
      exp_win_rate => 262, exp_loss_rate => 262};
get_rewards({1, 4}) ->
    #{stage_item => [{90020, 12}, {21776, 1}],
      season_item => [{90020, 18}, {20095, 1}],
      win_drop => 74250, lose_drop => 74251, exp_mod => 3323,
      exp_win_rate => 262, exp_loss_rate => 262};
get_rewards({1, 5}) ->
    #{stage_item => [{90020, 16}, {21777, 1}],
      season_item => [{90020, 20}, {20053, 1}, {21771, 1}],
      win_drop => 74250, lose_drop => 74251, exp_mod => 3323,
      exp_win_rate => 262, exp_loss_rate => 262};
get_rewards({1, 6}) ->
    #{stage_item => [{90020, 20}, {21778, 1}],
      season_item => [{90020, 25}, {20038, 1}, {21772, 1}],
      win_drop => 74250, lose_drop => 74251, exp_mod => 3323,
      exp_win_rate => 262, exp_loss_rate => 262};
get_rewards({2, 1}) ->
    #{season_item => [{90020, 10}, {20000, 1}],
      win_drop => 74250, lose_drop => 74251, exp_mod => 3323,
      exp_win_rate => 262, exp_loss_rate => 262};
get_rewards({2, 2}) ->
    #{stage_item => [{90020, 8}, {21774, 1}],
      season_item => [{90020, 12}, {20087, 1}],
      win_drop => 74250, lose_drop => 74251, exp_mod => 3323,
      exp_win_rate => 262, exp_loss_rate => 262};
get_rewards({2, 3}) ->
    #{stage_item => [{90020, 10}, {21775, 1}],
      season_item => [{90020, 15}, {22585, 1}],
      win_drop => 74250, lose_drop => 74251, exp_mod => 3323,
      exp_win_rate => 262, exp_loss_rate => 262};
get_rewards({2, 4}) ->
    #{stage_item => [{90020, 12}, {21776, 1}],
      season_item => [{90020, 18}, {20095, 1}],
      win_drop => 74250, lose_drop => 74251, exp_mod => 3323,
      exp_win_rate => 262, exp_loss_rate => 262};
get_rewards({2, 5}) ->
    #{stage_item => [{90020, 16}, {21777, 1}],
      season_item => [{90020, 20}, {20053, 1}, {21771, 1}],
      win_drop => 74250, lose_drop => 74251, exp_mod => 3323,
      exp_win_rate => 262, exp_loss_rate => 262};
get_rewards({2, 6}) ->
    #{stage_item => [{90020, 20}, {21778, 1}],
      season_item => [{90020, 25}, {20038, 1}, {21772, 1}],
      win_drop => 74250, lose_drop => 74251, exp_mod => 3323,
      exp_win_rate => 262, exp_loss_rate => 262};
get_rewards({3, 1}) ->
    #{season_item => [{90020, 10}, {20000, 1}],
      win_drop => 74250, lose_drop => 74251, exp_mod => 3323,
      exp_win_rate => 262, exp_loss_rate => 262};
get_rewards({3, 2}) ->
    #{stage_item => [{90020, 8}, {21774, 1}],
      season_item => [{90020, 12}, {20087, 1}],
      win_drop => 74250, lose_drop => 74251, exp_mod => 3323,
      exp_win_rate => 262, exp_loss_rate => 262};
get_rewards({3, 3}) ->
    #{stage_item => [{90020, 10}, {21775, 1}],
      season_item => [{90020, 15}, {22585, 1}],
      win_drop => 74250, lose_drop => 74251, exp_mod => 3323,
      exp_win_rate => 262, exp_loss_rate => 262};
get_rewards({3, 4}) ->
    #{stage_item => [{90020, 12}, {21776, 1}],
      season_item => [{90020, 18}, {20095, 1}],
      win_drop => 74250, lose_drop => 74251, exp_mod => 3323,
      exp_win_rate => 262, exp_loss_rate => 262};
get_rewards({3, 5}) ->
    #{stage_item => [{90020, 16}, {21777, 1}],
      season_item => [{90020, 20}, {20053, 1}, {21771, 1}],
      win_drop => 74250, lose_drop => 74251, exp_mod => 3323,
      exp_win_rate => 262, exp_loss_rate => 262};
get_rewards({3, 6}) ->
    #{stage_item => [{90020, 20}, {21778, 1}],
      season_item => [{90020, 25}, {20038, 1}, {21772, 1}],
      win_drop => 74250, lose_drop => 74251, exp_mod => 3323,
      exp_win_rate => 262, exp_loss_rate => 262};
get_rewards({4, 1}) ->
    #{season_item => [{90020, 10}, {20000, 1}],
      win_drop => 74250, lose_drop => 74251, exp_mod => 3323,
      exp_win_rate => 262, exp_loss_rate => 262};
get_rewards({4, 2}) ->
    #{stage_item => [{90020, 8}, {21774, 1}],
      season_item => [{90020, 12}, {20087, 1}],
      win_drop => 74250, lose_drop => 74251, exp_mod => 3323,
      exp_win_rate => 262, exp_loss_rate => 262};
get_rewards({4, 3}) ->
    #{stage_item => [{90020, 10}, {21775, 1}],
      season_item => [{90020, 15}, {22585, 1}],
      win_drop => 74250, lose_drop => 74251, exp_mod => 3323,
      exp_win_rate => 262, exp_loss_rate => 262};
get_rewards({4, 4}) ->
    #{stage_item => [{90020, 12}, {21776, 1}],
      season_item => [{90020, 18}, {20095, 1}],
      win_drop => 74250, lose_drop => 74251, exp_mod => 3323,
      exp_win_rate => 262, exp_loss_rate => 262};
get_rewards({4, 5}) ->
    #{stage_item => [{90020, 16}, {21777, 1}],
      season_item => [{90020, 20}, {20053, 1}, {21771, 1}],
      win_drop => 74250, lose_drop => 74251, exp_mod => 3323,
      exp_win_rate => 262, exp_loss_rate => 262};
get_rewards({4, 6}) ->
    #{stage_item => [{90020, 20}, {21778, 1}],
      season_item => [{90020, 25}, {20038, 1}, {21772, 1}],
      win_drop => 74250, lose_drop => 74251, exp_mod => 3323,
      exp_win_rate => 262, exp_loss_rate => 262};
get_rewards({5, 1}) ->
    #{season_item => [{90020, 10}, {20000, 1}],
      win_drop => 74250, lose_drop => 74251, exp_mod => 3323,
      exp_win_rate => 262, exp_loss_rate => 262};
get_rewards({5, 2}) ->
    #{stage_item => [{90020, 8}, {21774, 1}],
      season_item => [{90020, 12}, {20087, 1}],
      win_drop => 74250, lose_drop => 74251, exp_mod => 3323,
      exp_win_rate => 262, exp_loss_rate => 262};
get_rewards({5, 3}) ->
    #{stage_item => [{90020, 10}, {21775, 1}],
      season_item => [{90020, 15}, {22585, 1}],
      win_drop => 74250, lose_drop => 74251, exp_mod => 3323,
      exp_win_rate => 262, exp_loss_rate => 262};
get_rewards({5, 4}) ->
    #{stage_item => [{90020, 12}, {21776, 1}],
      season_item => [{90020, 18}, {20095, 1}],
      win_drop => 74250, lose_drop => 74251, exp_mod => 3323,
      exp_win_rate => 262, exp_loss_rate => 262};
get_rewards({5, 5}) ->
    #{stage_item => [{90020, 16}, {21777, 1}],
      season_item => [{90020, 20}, {20053, 1}, {21771, 1}],
      win_drop => 74250, lose_drop => 74251, exp_mod => 3323,
      exp_win_rate => 262, exp_loss_rate => 262};
get_rewards({5, 6}) ->
    #{stage_item => [{90020, 20}, {21778, 1}],
      season_item => [{90020, 25}, {20038, 1}, {21772, 1}],
      win_drop => 74250, lose_drop => 74251, exp_mod => 3323,
      exp_win_rate => 262, exp_loss_rate => 262};
get_rewards({6, 1}) ->
    #{season_item => [{90020, 10}, {20000, 1}],
      win_drop => 74250, lose_drop => 74251, exp_mod => 3323,
      exp_win_rate => 262, exp_loss_rate => 262};
get_rewards({6, 2}) ->
    #{stage_item => [{90020, 8}, {21774, 1}],
      season_item => [{90020, 12}, {20087, 1}],
      win_drop => 74250, lose_drop => 74251, exp_mod => 3323,
      exp_win_rate => 262, exp_loss_rate => 262};
get_rewards({6, 3}) ->
    #{stage_item => [{90020, 10}, {21775, 1}],
      season_item => [{90020, 15}, {22585, 1}],
      win_drop => 74250, lose_drop => 74251, exp_mod => 3323,
      exp_win_rate => 262, exp_loss_rate => 262};
get_rewards({6, 4}) ->
    #{stage_item => [{90020, 12}, {21776, 1}],
      season_item => [{90020, 18}, {20095, 1}],
      win_drop => 74250, lose_drop => 74251, exp_mod => 3323,
      exp_win_rate => 262, exp_loss_rate => 262};
get_rewards({6, 5}) ->
    #{stage_item => [{90020, 16}, {21777, 1}],
      season_item => [{90020, 20}, {20053, 1}, {21771, 1}],
      win_drop => 74250, lose_drop => 74251, exp_mod => 3323,
      exp_win_rate => 262, exp_loss_rate => 262};
get_rewards({6, 6}) ->
    #{stage_item => [{90020, 20}, {21778, 1}],
      season_item => [{90020, 25}, {20038, 1}, {21772, 1}],
      win_drop => 74250, lose_drop => 74251, exp_mod => 3323,
      exp_win_rate => 262, exp_loss_rate => 262};
get_rewards({7, 1}) ->
    #{season_item => [{90020, 10}, {20000, 1}],
      win_drop => 74250, lose_drop => 74251, exp_mod => 3323,
      exp_win_rate => 262, exp_loss_rate => 262};
get_rewards({7, 2}) ->
    #{stage_item => [{90020, 8}, {21774, 1}],
      season_item => [{90020, 12}, {20087, 1}],
      win_drop => 74250, lose_drop => 74251, exp_mod => 3323,
      exp_win_rate => 262, exp_loss_rate => 262};
get_rewards({7, 3}) ->
    #{stage_item => [{90020, 10}, {21775, 1}],
      season_item => [{90020, 15}, {22585, 1}],
      win_drop => 74250, lose_drop => 74251, exp_mod => 3323,
      exp_win_rate => 262, exp_loss_rate => 262};
get_rewards({7, 4}) ->
    #{stage_item => [{90020, 12}, {21776, 1}],
      season_item => [{90020, 18}, {20095, 1}],
      win_drop => 74250, lose_drop => 74251, exp_mod => 3323,
      exp_win_rate => 262, exp_loss_rate => 262};
get_rewards({7, 5}) ->
    #{stage_item => [{90020, 16}, {21777, 1}],
      season_item => [{90020, 20}, {20053, 1}, {21771, 1}],
      win_drop => 74250, lose_drop => 74251, exp_mod => 3323,
      exp_win_rate => 262, exp_loss_rate => 262};
get_rewards({7, 6}) ->
    #{stage_item => [{90020, 20}, {21778, 1}],
      season_item => [{90020, 25}, {20038, 1}, {21772, 1}],
      win_drop => 74250, lose_drop => 74251, exp_mod => 3323,
      exp_win_rate => 262, exp_loss_rate => 262};
get_rewards({8, 1}) ->
    #{season_item => [{90020, 10}, {20000, 1}],
      win_drop => 74250, lose_drop => 74251, exp_mod => 3323,
      exp_win_rate => 262, exp_loss_rate => 262};
get_rewards({8, 2}) ->
    #{stage_item => [{90020, 8}, {21774, 1}],
      season_item => [{90020, 12}, {20087, 1}],
      win_drop => 74250, lose_drop => 74251, exp_mod => 3323,
      exp_win_rate => 262, exp_loss_rate => 262};
get_rewards({8, 3}) ->
    #{stage_item => [{90020, 10}, {21775, 1}],
      season_item => [{90020, 15}, {22585, 1}],
      win_drop => 74250, lose_drop => 74251, exp_mod => 3323,
      exp_win_rate => 262, exp_loss_rate => 262};
get_rewards({8, 4}) ->
    #{stage_item => [{90020, 12}, {21776, 1}],
      season_item => [{90020, 18}, {20095, 1}],
      win_drop => 74250, lose_drop => 74251, exp_mod => 3323,
      exp_win_rate => 262, exp_loss_rate => 262};
get_rewards({8, 5}) ->
    #{stage_item => [{90020, 16}, {21777, 1}],
      season_item => [{90020, 20}, {20053, 1}, {21771, 1}],
      win_drop => 74250, lose_drop => 74251, exp_mod => 3323,
      exp_win_rate => 262, exp_loss_rate => 262};
get_rewards({8, 6}) ->
    #{stage_item => [{90020, 20}, {21778, 1}],
      season_item => [{90020, 25}, {20038, 1}, {21772, 1}],
      win_drop => 74250, lose_drop => 74251, exp_mod => 3323,
      exp_win_rate => 262, exp_loss_rate => 262};
get_rewards({9, 1}) ->
    #{season_item => [{90020, 10}, {20000, 1}],
      win_drop => 74250, lose_drop => 74251, exp_mod => 3323,
      exp_win_rate => 262, exp_loss_rate => 262};
get_rewards({9, 2}) ->
    #{stage_item => [{90020, 8}, {21774, 1}],
      season_item => [{90020, 12}, {20087, 1}],
      win_drop => 74250, lose_drop => 74251, exp_mod => 3323,
      exp_win_rate => 262, exp_loss_rate => 262};
get_rewards({9, 3}) ->
    #{stage_item => [{90020, 10}, {21775, 1}],
      season_item => [{90020, 15}, {22585, 1}],
      win_drop => 74250, lose_drop => 74251, exp_mod => 3323,
      exp_win_rate => 262, exp_loss_rate => 262};
get_rewards({9, 4}) ->
    #{stage_item => [{90020, 12}, {21776, 1}],
      season_item => [{90020, 18}, {20095, 1}],
      win_drop => 74250, lose_drop => 74251, exp_mod => 3323,
      exp_win_rate => 262, exp_loss_rate => 262};
get_rewards({9, 5}) ->
    #{stage_item => [{90020, 16}, {21777, 1}],
      season_item => [{90020, 20}, {20053, 1}, {21771, 1}],
      win_drop => 74250, lose_drop => 74251, exp_mod => 3323,
      exp_win_rate => 262, exp_loss_rate => 262};
get_rewards({9, 6}) ->
    #{stage_item => [{90020, 20}, {21778, 1}],
      season_item => [{90020, 25}, {20038, 1}, {21772, 1}],
      win_drop => 74250, lose_drop => 74251, exp_mod => 3323,
      exp_win_rate => 262, exp_loss_rate => 262};
get_rewards({10, 1}) ->
    #{season_item => [{90020, 10}, {20000, 1}],
      win_drop => 74250, lose_drop => 74251, exp_mod => 3323,
      exp_win_rate => 262, exp_loss_rate => 262};
get_rewards({10, 2}) ->
    #{stage_item => [{90020, 8}, {21774, 1}],
      season_item => [{90020, 12}, {20087, 1}],
      win_drop => 74250, lose_drop => 74251, exp_mod => 3323,
      exp_win_rate => 262, exp_loss_rate => 262};
get_rewards({10, 3}) ->
    #{stage_item => [{90020, 10}, {21775, 1}],
      season_item => [{90020, 15}, {22585, 1}],
      win_drop => 74250, lose_drop => 74251, exp_mod => 3323,
      exp_win_rate => 262, exp_loss_rate => 262};
get_rewards({10, 4}) ->
    #{stage_item => [{90020, 12}, {21776, 1}],
      season_item => [{90020, 18}, {20095, 1}],
      win_drop => 74250, lose_drop => 74251, exp_mod => 3323,
      exp_win_rate => 262, exp_loss_rate => 262};
get_rewards({10, 5}) ->
    #{stage_item => [{90020, 16}, {21777, 1}],
      season_item => [{90020, 20}, {20053, 1}, {21771, 1}],
      win_drop => 74250, lose_drop => 74251, exp_mod => 3323,
      exp_win_rate => 262, exp_loss_rate => 262};
get_rewards({10, 6}) ->
    #{stage_item => [{90020, 20}, {21778, 1}],
      season_item => [{90020, 25}, {20038, 1}, {21772, 1}],
      win_drop => 74250, lose_drop => 74251, exp_mod => 3323,
      exp_win_rate => 262, exp_loss_rate => 262};
get_rewards({11, 1}) ->
    #{season_item => [{90020, 10}, {20000, 1}],
      win_drop => 74250, lose_drop => 74251, exp_mod => 3323,
      exp_win_rate => 262, exp_loss_rate => 262};
get_rewards({11, 2}) ->
    #{stage_item => [{90020, 8}, {21774, 1}],
      season_item => [{90020, 12}, {20087, 1}],
      win_drop => 74250, lose_drop => 74251, exp_mod => 3323,
      exp_win_rate => 262, exp_loss_rate => 262};
get_rewards({11, 3}) ->
    #{stage_item => [{90020, 10}, {21775, 1}],
      season_item => [{90020, 15}, {22585, 1}],
      win_drop => 74250, lose_drop => 74251, exp_mod => 3323,
      exp_win_rate => 262, exp_loss_rate => 262};
get_rewards({11, 4}) ->
    #{stage_item => [{90020, 12}, {21776, 1}],
      season_item => [{90020, 18}, {20095, 1}],
      win_drop => 74250, lose_drop => 74251, exp_mod => 3323,
      exp_win_rate => 262, exp_loss_rate => 262};
get_rewards({11, 5}) ->
    #{stage_item => [{90020, 16}, {21777, 1}],
      season_item => [{90020, 20}, {20053, 1}, {21771, 1}],
      win_drop => 74250, lose_drop => 74251, exp_mod => 3323,
      exp_win_rate => 262, exp_loss_rate => 262};
get_rewards({11, 6}) ->
    #{stage_item => [{90020, 20}, {21778, 1}],
      season_item => [{90020, 25}, {20038, 1}, {21772, 1}],
      win_drop => 74250, lose_drop => 74251, exp_mod => 3323,
      exp_win_rate => 262, exp_loss_rate => 262};
get_rewards({12, 1}) ->
    #{season_item => [{90020, 10}, {20000, 1}],
      win_drop => 74250, lose_drop => 74251, exp_mod => 3323,
      exp_win_rate => 262, exp_loss_rate => 262};
get_rewards({12, 2}) ->
    #{stage_item => [{90020, 8}, {21774, 1}],
      season_item => [{90020, 12}, {20087, 1}],
      win_drop => 74250, lose_drop => 74251, exp_mod => 3323,
      exp_win_rate => 262, exp_loss_rate => 262};
get_rewards({12, 3}) ->
    #{stage_item => [{90020, 10}, {21775, 1}],
      season_item => [{90020, 15}, {22585, 1}],
      win_drop => 74250, lose_drop => 74251, exp_mod => 3323,
      exp_win_rate => 262, exp_loss_rate => 262};
get_rewards({12, 4}) ->
    #{stage_item => [{90020, 12}, {21776, 1}],
      season_item => [{90020, 18}, {20095, 1}],
      win_drop => 74250, lose_drop => 74251, exp_mod => 3323,
      exp_win_rate => 262, exp_loss_rate => 262};
get_rewards({12, 5}) ->
    #{stage_item => [{90020, 16}, {21777, 1}],
      season_item => [{90020, 20}, {20053, 1}, {21771, 1}],
      win_drop => 74250, lose_drop => 74251, exp_mod => 3323,
      exp_win_rate => 262, exp_loss_rate => 262};
get_rewards({12, 6}) ->
    #{stage_item => [{90020, 20}, {21778, 1}],
      season_item => [{90020, 25}, {20038, 1}, {21772, 1}],
      win_drop => 74250, lose_drop => 74251, exp_mod => 3323,
      exp_win_rate => 262, exp_loss_rate => 262};
get_rewards({13, 1}) ->
    #{season_item => [{90020, 10}, {20000, 1}],
      win_drop => 74250, lose_drop => 74251, exp_mod => 3323,
      exp_win_rate => 262, exp_loss_rate => 262};
get_rewards({13, 2}) ->
    #{stage_item => [{90020, 8}, {21774, 1}],
      season_item => [{90020, 12}, {20087, 1}],
      win_drop => 74250, lose_drop => 74251, exp_mod => 3323,
      exp_win_rate => 262, exp_loss_rate => 262};
get_rewards({13, 3}) ->
    #{stage_item => [{90020, 10}, {21775, 1}],
      season_item => [{90020, 15}, {22585, 1}],
      win_drop => 74250, lose_drop => 74251, exp_mod => 3323,
      exp_win_rate => 262, exp_loss_rate => 262};
get_rewards({13, 4}) ->
    #{stage_item => [{90020, 12}, {21776, 1}],
      season_item => [{90020, 18}, {20095, 1}],
      win_drop => 74250, lose_drop => 74251, exp_mod => 3323,
      exp_win_rate => 262, exp_loss_rate => 262};
get_rewards({13, 5}) ->
    #{stage_item => [{90020, 16}, {21777, 1}],
      season_item => [{90020, 20}, {20053, 1}, {21771, 1}],
      win_drop => 74250, lose_drop => 74251, exp_mod => 3323,
      exp_win_rate => 262, exp_loss_rate => 262};
get_rewards({13, 6}) ->
    #{stage_item => [{90020, 20}, {21778, 1}],
      season_item => [{90020, 25}, {20038, 1}, {21772, 1}],
      win_drop => 74250, lose_drop => 74251, exp_mod => 3323,
      exp_win_rate => 262, exp_loss_rate => 262};
get_rewards({14, 1}) ->
    #{season_item => [{90020, 10}, {20000, 1}],
      win_drop => 74250, lose_drop => 74251, exp_mod => 3323,
      exp_win_rate => 262, exp_loss_rate => 262};
get_rewards({14, 2}) ->
    #{stage_item => [{90020, 8}, {21774, 1}],
      season_item => [{90020, 12}, {20087, 1}],
      win_drop => 74250, lose_drop => 74251, exp_mod => 3323,
      exp_win_rate => 262, exp_loss_rate => 262};
get_rewards({14, 3}) ->
    #{stage_item => [{90020, 10}, {21775, 1}],
      season_item => [{90020, 15}, {22585, 1}],
      win_drop => 74250, lose_drop => 74251, exp_mod => 3323,
      exp_win_rate => 262, exp_loss_rate => 262};
get_rewards({14, 4}) ->
    #{stage_item => [{90020, 12}, {21776, 1}],
      season_item => [{90020, 18}, {20095, 1}],
      win_drop => 74250, lose_drop => 74251, exp_mod => 3323,
      exp_win_rate => 262, exp_loss_rate => 262};
get_rewards({14, 5}) ->
    #{stage_item => [{90020, 16}, {21777, 1}],
      season_item => [{90020, 20}, {20053, 1}, {21771, 1}],
      win_drop => 74250, lose_drop => 74251, exp_mod => 3323,
      exp_win_rate => 262, exp_loss_rate => 262};
get_rewards({14, 6}) ->
    #{stage_item => [{90020, 20}, {21778, 1}],
      season_item => [{90020, 25}, {20038, 1}, {21772, 1}],
      win_drop => 74250, lose_drop => 74251, exp_mod => 3323,
      exp_win_rate => 262, exp_loss_rate => 262};
get_rewards({15, 1}) ->
    #{season_item => [{90020, 10}, {20000, 1}],
      win_drop => 74250, lose_drop => 74251, exp_mod => 3323,
      exp_win_rate => 262, exp_loss_rate => 262};
get_rewards({15, 2}) ->
    #{stage_item => [{90020, 8}, {21774, 1}],
      season_item => [{90020, 12}, {20087, 1}],
      win_drop => 74250, lose_drop => 74251, exp_mod => 3323,
      exp_win_rate => 262, exp_loss_rate => 262};
get_rewards({15, 3}) ->
    #{stage_item => [{90020, 10}, {21775, 1}],
      season_item => [{90020, 15}, {22585, 1}],
      win_drop => 74250, lose_drop => 74251, exp_mod => 3323,
      exp_win_rate => 262, exp_loss_rate => 262};
get_rewards({15, 4}) ->
    #{stage_item => [{90020, 12}, {21776, 1}],
      season_item => [{90020, 18}, {20095, 1}],
      win_drop => 74250, lose_drop => 74251, exp_mod => 3323,
      exp_win_rate => 262, exp_loss_rate => 262};
get_rewards({15, 5}) ->
    #{stage_item => [{90020, 16}, {21777, 1}],
      season_item => [{90020, 20}, {20053, 1}, {21771, 1}],
      win_drop => 74250, lose_drop => 74251, exp_mod => 3323,
      exp_win_rate => 262, exp_loss_rate => 262};
get_rewards({15, 6}) ->
    #{stage_item => [{90020, 20}, {21778, 1}],
      season_item => [{90020, 25}, {20038, 1}, {21772, 1}],
      win_drop => 74250, lose_drop => 74251, exp_mod => 3323,
      exp_win_rate => 262, exp_loss_rate => 262};
get_rewards(_) -> false.

get_rank_star(1) ->
    #{index => 1, rencounter => lang:get("飞瀑村"), star => 4,
      title => lang:get("新秀"), total_star => 0};
get_rank_star(2) ->
    #{index => 2, rencounter => lang:get("精灵之森"), star => 5,
      title => lang:get("勇士"), total_star => 3};
get_rank_star(3) ->
    #{index => 3, rencounter => lang:get("月痕海岸"), star => 6,
      title => lang:get("高手"), total_star => 7};
get_rank_star(4) ->
    #{index => 4, rencounter => lang:get("极北之域"), star => 6,
      title => lang:get("豪杰"), total_star => 12};
get_rank_star(5) ->
    #{index => 5, rencounter => lang:get("圣心城"), star => 6,
      title => lang:get("宗师"), total_star => 17};
get_rank_star(6) ->
    #{index => 6, rencounter => lang:get("失落神殿"),
      star => 999, title => lang:get("战神"), total_star => 22};
get_rank_star(_) -> false.

get_rank_reward(1, Rank) when Rank =< 1 ->
    [{90020, 50}];
get_rank_reward(1, Rank) when Rank =< 2 ->
    [{90020, 45}];
get_rank_reward(1, Rank) when Rank =< 3 ->
    [{90020, 40}];
get_rank_reward(1, Rank) when Rank =< 10 ->
    [{90020, 30}];
get_rank_reward(1, Rank) when Rank =< 50 ->
    [{90020, 25}];
get_rank_reward(1, Rank) when Rank =< 100 ->
    [{90020, 20}];
get_rank_reward(2, Rank) when Rank =< 1 ->
    [{90020, 50}];
get_rank_reward(2, Rank) when Rank =< 2 ->
    [{90020, 45}];
get_rank_reward(2, Rank) when Rank =< 3 ->
    [{90020, 40}];
get_rank_reward(2, Rank) when Rank =< 10 ->
    [{90020, 30}];
get_rank_reward(2, Rank) when Rank =< 50 ->
    [{90020, 25}];
get_rank_reward(2, Rank) when Rank =< 100 ->
    [{90020, 20}];
get_rank_reward(3, Rank) when Rank =< 1 ->
    [{90020, 50}];
get_rank_reward(3, Rank) when Rank =< 2 ->
    [{90020, 45}];
get_rank_reward(3, Rank) when Rank =< 3 ->
    [{90020, 40}];
get_rank_reward(3, Rank) when Rank =< 10 ->
    [{90020, 30}];
get_rank_reward(3, Rank) when Rank =< 50 ->
    [{90020, 25}];
get_rank_reward(3, Rank) when Rank =< 100 ->
    [{90020, 20}];
get_rank_reward(4, Rank) when Rank =< 1 ->
    [{90020, 50}];
get_rank_reward(4, Rank) when Rank =< 2 ->
    [{90020, 45}];
get_rank_reward(4, Rank) when Rank =< 3 ->
    [{90020, 40}];
get_rank_reward(4, Rank) when Rank =< 10 ->
    [{90020, 30}];
get_rank_reward(4, Rank) when Rank =< 50 ->
    [{90020, 25}];
get_rank_reward(4, Rank) when Rank =< 100 ->
    [{90020, 20}];
get_rank_reward(5, Rank) when Rank =< 1 ->
    [{90020, 50}];
get_rank_reward(5, Rank) when Rank =< 2 ->
    [{90020, 45}];
get_rank_reward(5, Rank) when Rank =< 3 ->
    [{90020, 40}];
get_rank_reward(5, Rank) when Rank =< 10 ->
    [{90020, 30}];
get_rank_reward(5, Rank) when Rank =< 50 ->
    [{90020, 25}];
get_rank_reward(5, Rank) when Rank =< 100 ->
    [{90020, 20}];
get_rank_reward(6, Rank) when Rank =< 1 ->
    [{90020, 50}];
get_rank_reward(6, Rank) when Rank =< 2 ->
    [{90020, 45}];
get_rank_reward(6, Rank) when Rank =< 3 ->
    [{90020, 40}];
get_rank_reward(6, Rank) when Rank =< 10 ->
    [{90020, 30}];
get_rank_reward(6, Rank) when Rank =< 50 ->
    [{90020, 25}];
get_rank_reward(6, Rank) when Rank =< 100 ->
    [{90020, 20}];
get_rank_reward(7, Rank) when Rank =< 1 ->
    [{90020, 50}];
get_rank_reward(7, Rank) when Rank =< 2 ->
    [{90020, 45}];
get_rank_reward(7, Rank) when Rank =< 3 ->
    [{90020, 40}];
get_rank_reward(7, Rank) when Rank =< 10 ->
    [{90020, 30}];
get_rank_reward(7, Rank) when Rank =< 50 ->
    [{90020, 25}];
get_rank_reward(7, Rank) when Rank =< 100 ->
    [{90020, 20}];
get_rank_reward(8, Rank) when Rank =< 1 ->
    [{90020, 50}];
get_rank_reward(8, Rank) when Rank =< 2 ->
    [{90020, 45}];
get_rank_reward(8, Rank) when Rank =< 3 ->
    [{90020, 40}];
get_rank_reward(8, Rank) when Rank =< 10 ->
    [{90020, 30}];
get_rank_reward(8, Rank) when Rank =< 50 ->
    [{90020, 25}];
get_rank_reward(8, Rank) when Rank =< 100 ->
    [{90020, 20}];
get_rank_reward(9, Rank) when Rank =< 1 ->
    [{90020, 50}];
get_rank_reward(9, Rank) when Rank =< 2 ->
    [{90020, 45}];
get_rank_reward(9, Rank) when Rank =< 3 ->
    [{90020, 40}];
get_rank_reward(9, Rank) when Rank =< 10 ->
    [{90020, 30}];
get_rank_reward(9, Rank) when Rank =< 50 ->
    [{90020, 25}];
get_rank_reward(9, Rank) when Rank =< 100 ->
    [{90020, 20}];
get_rank_reward(10, Rank) when Rank =< 1 ->
    [{90020, 50}];
get_rank_reward(10, Rank) when Rank =< 2 ->
    [{90020, 45}];
get_rank_reward(10, Rank) when Rank =< 3 ->
    [{90020, 40}];
get_rank_reward(10, Rank) when Rank =< 10 ->
    [{90020, 30}];
get_rank_reward(10, Rank) when Rank =< 50 ->
    [{90020, 25}];
get_rank_reward(10, Rank) when Rank =< 100 ->
    [{90020, 20}];
get_rank_reward(11, Rank) when Rank =< 1 ->
    [{90020, 50}];
get_rank_reward(11, Rank) when Rank =< 2 ->
    [{90020, 45}];
get_rank_reward(11, Rank) when Rank =< 3 ->
    [{90020, 40}];
get_rank_reward(11, Rank) when Rank =< 10 ->
    [{90020, 30}];
get_rank_reward(11, Rank) when Rank =< 50 ->
    [{90020, 25}];
get_rank_reward(11, Rank) when Rank =< 100 ->
    [{90020, 20}];
get_rank_reward(12, Rank) when Rank =< 1 ->
    [{90020, 50}];
get_rank_reward(12, Rank) when Rank =< 2 ->
    [{90020, 45}];
get_rank_reward(12, Rank) when Rank =< 3 ->
    [{90020, 40}];
get_rank_reward(12, Rank) when Rank =< 10 ->
    [{90020, 30}];
get_rank_reward(12, Rank) when Rank =< 50 ->
    [{90020, 25}];
get_rank_reward(12, Rank) when Rank =< 100 ->
    [{90020, 20}];
get_rank_reward(13, Rank) when Rank =< 1 ->
    [{90020, 50}];
get_rank_reward(13, Rank) when Rank =< 2 ->
    [{90020, 45}];
get_rank_reward(13, Rank) when Rank =< 3 ->
    [{90020, 40}];
get_rank_reward(13, Rank) when Rank =< 10 ->
    [{90020, 30}];
get_rank_reward(13, Rank) when Rank =< 50 ->
    [{90020, 25}];
get_rank_reward(13, Rank) when Rank =< 100 ->
    [{90020, 20}];
get_rank_reward(14, Rank) when Rank =< 1 ->
    [{90020, 50}];
get_rank_reward(14, Rank) when Rank =< 2 ->
    [{90020, 45}];
get_rank_reward(14, Rank) when Rank =< 3 ->
    [{90020, 40}];
get_rank_reward(14, Rank) when Rank =< 10 ->
    [{90020, 30}];
get_rank_reward(14, Rank) when Rank =< 50 ->
    [{90020, 25}];
get_rank_reward(14, Rank) when Rank =< 100 ->
    [{90020, 20}];
get_rank_reward(15, Rank) when Rank =< 1 ->
    [{90020, 50}];
get_rank_reward(15, Rank) when Rank =< 2 ->
    [{90020, 45}];
get_rank_reward(15, Rank) when Rank =< 3 ->
    [{90020, 40}];
get_rank_reward(15, Rank) when Rank =< 10 ->
    [{90020, 30}];
get_rank_reward(15, Rank) when Rank =< 50 ->
    [{90020, 25}];
get_rank_reward(15, Rank) when Rank =< 100 ->
    [{90020, 20}];
get_rank_reward(_, _) -> [].

