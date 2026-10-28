-file("src/data/reward_back_data.erl", 1).

-module(reward_back_data).

-export([get_active_id/1, get_active_data/1]).

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

-file("src/data/reward_back_data.erl", 14).

-file("inc/reward_back.hrl", 1).

-record(m_reward_back,
        {ver = 3,
         next_id = 1,
         list = [],
         zero_time = 0,
         five_time = 0,
         world_lev = 40,
         last_lev = 1}).

-record(reward_back_data,
        {ver = 1,
         id = 0,
         active_id = 0,
         finish = 0,
         all = 0,
         back = 0,
         reward = [],
         time = 0}).

-file("src/data/reward_back_data.erl", 15).

get_active_id(0) -> [1000, 1001];
get_active_id(5) ->
    [1002, 1013, 1014, 2013, 1007, 1028];
get_active_id(_Reset) -> [].

get_active_data(1000) ->
    #{lev => 50, lev_max => 200, day => 2, coin => 8000,
      total => 30, normal_exp => 60, normal_gift => [],
      item => [{23732, 10}], perfect_exp => 100,
      perfect_gift => []};
get_active_data(1001) ->
    #{lev => 50, lev_max => 200, day => 2, coin => 15000,
      total => 10, normal_exp => 60, normal_gift => [],
      item => [{23732, 10}], perfect_exp => 100,
      perfect_gift => []};
get_active_data(1002) ->
    #{lev => 50, lev_max => 200, day => 2, coin => 20000,
      total => 5, normal_exp => 60,
      normal_gift => [{22324, 1, 1, 200}],
      item => [{23732, 5}], perfect_exp => 100,
      perfect_gift => [{22323, 1, 1, 200}]};
get_active_data(1013) ->
    #{lev => 50, lev_max => 200, day => 2, coin => 10000,
      total => 5, normal_exp => 60, normal_gift => [],
      item => [{23732, 5}], perfect_exp => 100,
      perfect_gift => []};
get_active_data(1014) ->
    #{lev => 50, lev_max => 200, day => 2, coin => 10000,
      total => 10, normal_exp => 60,
      normal_gift =>
          [{22335, 1, 25, 34},
           {22336, 1, 35, 44},
           {22337, 1, 45, 54},
           {22338, 1, 55, 64},
           {22339, 1, 65, 74},
           {22340, 1, 75, 200}],
      item => [{23732, 3}], perfect_exp => 100,
      perfect_gift =>
          [{22341, 1, 25, 34},
           {22342, 1, 35, 44},
           {22343, 1, 45, 54},
           {22344, 1, 55, 64},
           {22345, 1, 65, 74},
           {22346, 1, 75, 200}]};
get_active_data(2013) ->
    #{lev => 50, lev_max => 200, day => 2, coin => 100000,
      total => 3, normal_exp => 60,
      normal_gift => [{22327, 1, 1, 200}],
      item => [{23732, 1}], perfect_exp => 100,
      perfect_gift => [{22328, 1, 1, 200}]};
get_active_data(1007) ->
    #{lev => 50, lev_max => 200, day => 2, coin => 80000,
      total => 2, normal_exp => 60,
      normal_gift => [{22325, 1, 1, 200}],
      item => [{23732, 1}], perfect_exp => 100,
      perfect_gift => [{22326, 1, 1, 200}]};
get_active_data(1028) ->
    #{lev => 50, lev_max => 200, day => 2, coin => 60000,
      total => 5, normal_exp => 60,
      normal_gift => [{22348, 1, 1, 79}, {22349, 1, 80, 200}],
      item => [{23732, 1}], perfect_exp => 100,
      perfect_gift =>
          [{22351, 1, 1, 79}, {22352, 1, 80, 200}]};
get_active_data(_) -> false.

