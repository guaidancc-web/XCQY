-file("src/data/camp_login_roll_data.erl", 1).

-module(camp_login_roll_data).

-export([get/1, get_reward/1]).

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

-file("src/data/camp_login_roll_data.erl", 16).

get(1) ->
    #{id => 1, reward => [{20545, 0, 1}], is_cast => 1,
      odds => 35};
get(2) ->
    #{id => 2, reward => [{20006, 0, 5}], is_cast => 0,
      odds => 100};
get(3) ->
    #{id => 3, reward => [{20045, 0, 1}], is_cast => 0,
      odds => 100};
get(4) ->
    #{id => 4, reward => [{23555, 0, 1}], is_cast => 0,
      odds => 100};
get(5) ->
    #{id => 5, reward => [{20005, 0, 2}], is_cast => 0,
      odds => 100};
get(6) ->
    #{id => 6, reward => [{20095, 0, 1}], is_cast => 1,
      odds => 35};
get(7) ->
    #{id => 7, reward => [{20006, 0, 5}], is_cast => 0,
      odds => 100};
get(8) ->
    #{id => 8, reward => [{20034, 0, 1}], is_cast => 0,
      odds => 100};
get(9) ->
    #{id => 9, reward => [{20057, 0, 1}], is_cast => 1,
      odds => 100};
get(10) ->
    #{id => 10, reward => [{20025, 0, 1}], is_cast => 0,
      odds => 100};
get(11) ->
    #{id => 11, reward => [{29393, 1, 1}], is_cast => 1,
      odds => 15};
get(12) ->
    #{id => 12, reward => [{21207, 0, 1}], is_cast => 1,
      odds => 100};
get(13) ->
    #{id => 13, reward => [{22306, 0, 1}], is_cast => 0,
      odds => 100};
get(14) ->
    #{id => 14, reward => [{21433, 1, 1}], is_cast => 1,
      odds => 100};
get(15) ->
    #{id => 15, reward => [{20056, 0, 1}], is_cast => 1,
      odds => 100};
get(16) ->
    #{id => 16, reward => [{28607, 1, 1}], is_cast => 1,
      odds => 35};
get(17) ->
    #{id => 17, reward => [{22306, 0, 1}], is_cast => 0,
      odds => 100};
get(18) ->
    #{id => 18, reward => [{22585, 0, 1}], is_cast => 1,
      odds => 100};
get(19) ->
    #{id => 19, reward => [{20005, 0, 2}], is_cast => 0,
      odds => 100};
get(20) ->
    #{id => 20, reward => [{29103, 0, 1}], is_cast => 1,
      odds => 100};
get(21) ->
    #{id => 21, reward => [{20617, 0, 1}], is_cast => 1,
      odds => 35};
get(22) ->
    #{id => 22, reward => [{22216, 0, 1}], is_cast => 1,
      odds => 100};
get(23) ->
    #{id => 23, reward => [{29006, 0, 1}], is_cast => 0,
      odds => 100};
get(24) ->
    #{id => 24, reward => [{20052, 0, 2}], is_cast => 0,
      odds => 100};
get(25) ->
    #{id => 25, reward => [{20000, 0, 1}], is_cast => 0,
      odds => 100};
get(26) ->
    #{id => 26, reward => [{20046, 0, 1}], is_cast => 1,
      odds => 100};
get(_) -> false.

get_reward(1) ->
    #{id => 1, reward => [{22585, 0, 1}], day => 3};
get_reward(2) ->
    #{id => 2, reward => [{20616, 0, 1}], day => 7};
get_reward(3) ->
    #{id => 3, reward => [{28607, 0, 1}], day => 15};
get_reward(_) -> false.

