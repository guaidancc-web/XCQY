-file("src/data/camp_zero_buy_data.erl", 1).

-module(camp_zero_buy_data).

-export([list/0, get_gift/1, get_reward/1]).

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

-file("src/data/camp_zero_buy_data.erl", 17).

get_gift(1) ->
    #{id => 1, name => lang:get("可爱萌宠"), lev => 40,
      between => 5, start_time => {open_time, 0, 0},
      end_time => {open_time, 13, 86399}};
get_gift(2) ->
    #{id => 2, name => lang:get("限定背饰"), lev => 0,
      between => 15, start_time => {open_time, 0, 0},
      end_time => {open_time, 13, 86399}};
get_gift(3) ->
    #{id => 3, name => lang:get("绝版时装"), lev => 0,
      between => 25, start_time => {open_time, 0, 0},
      end_time => {open_time, 13, 86399}};
get_gift(_) -> false.

get_reward({1, 1, 2, 0}) ->
    #{loss => [],
      reward =>
          [{20067, 0, 1, 1},
           {21100, 0, 1, 1},
           {20025, 1, 1, 0},
           {20005, 1, 2, 0},
           {21220, 0, 2, 0},
           {20006, 0, 10, 0},
           {19001, 0, 1, 0}]};
get_reward({2, 1, 2, 0}) ->
    #{loss => [{90002, 888}],
      reward =>
          [{29460, 1, 1, 1},
           {20053, 1, 1, 1},
           {20031, 1, 1, 1},
           {20020, 1, 3, 1},
           {20000, 0, 2, 0},
           {20006, 0, 20, 0},
           {19002, 0, 1, 0}]};
get_reward({3, 1, 1, 0}) ->
    #{loss => [{90002, 1888}],
      reward =>
          [{29161, 1, 1, 1},
           {29314, 0, 1, 1},
           {20032, 0, 1, 1},
           {22396, 0, 1, 1},
           {21322, 1, 1, 1},
           {20006, 0, 50, 0},
           {19003, 0, 1, 0}]};
get_reward({3, 1, 0, 0}) ->
    #{loss => [{90002, 1888}],
      reward =>
          [{29161, 1, 1, 1},
           {29314, 0, 1, 1},
           {20032, 0, 1, 1},
           {22396, 0, 1, 1},
           {21322, 1, 1, 1},
           {20006, 0, 50, 0},
           {19003, 0, 1, 0}]};
get_reward(_) -> false.

list() -> [1, 2, 3].

