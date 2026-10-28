-file("src/data/guild_siege_data.erl", 1).

-module(guild_siege_data).

-export([get_castle/1,
         get_base_reward/1,
         get_rand_reward/1,
         get_guild/1]).

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

-file("src/data/guild_siege_data.erl", 17).

get_castle(1) ->
    #{type => 3, order_ratio => 1200, need_check => []};
get_castle(8) ->
    #{type => 0, order_ratio => 1200, need_check => []};
get_castle(9) ->
    #{type => 0, order_ratio => 1200, need_check => []};
get_castle(10) ->
    #{type => 0, order_ratio => 1200, need_check => []};
get_castle(11) ->
    #{type => 0, order_ratio => 1200, need_check => []};
get_castle(12) ->
    #{type => 0, order_ratio => 1200, need_check => []};
get_castle(13) ->
    #{type => 0, order_ratio => 1200, need_check => [2]};
get_castle(2) ->
    #{type => 2, order_ratio => 1200, need_check => []};
get_castle(14) ->
    #{type => 0, order_ratio => 1200, need_check => [2]};
get_castle(3) ->
    #{type => 1, order_ratio => 1200, need_check => []};
get_castle(15) ->
    #{type => 0, order_ratio => 1150, need_check => []};
get_castle(16) ->
    #{type => 0, order_ratio => 1150, need_check => []};
get_castle(17) ->
    #{type => 0, order_ratio => 1150, need_check => []};
get_castle(18) ->
    #{type => 0, order_ratio => 1150, need_check => []};
get_castle(4) ->
    #{type => 3, order_ratio => 1150, need_check => []};
get_castle(19) ->
    #{type => 0, order_ratio => 1150, need_check => []};
get_castle(20) ->
    #{type => 0, order_ratio => 1150, need_check => []};
get_castle(21) ->
    #{type => 0, order_ratio => 1150, need_check => [5]};
get_castle(5) ->
    #{type => 2, order_ratio => 1150, need_check => []};
get_castle(22) ->
    #{type => 0, order_ratio => 1150, need_check => [5]};
get_castle(23) ->
    #{type => 0, order_ratio => 1100, need_check => []};
get_castle(24) ->
    #{type => 0, order_ratio => 1100, need_check => []};
get_castle(25) ->
    #{type => 0, order_ratio => 1100, need_check => []};
get_castle(26) ->
    #{type => 0, order_ratio => 1100, need_check => []};
get_castle(27) ->
    #{type => 0, order_ratio => 1100, need_check => []};
get_castle(28) ->
    #{type => 0, order_ratio => 1100, need_check => []};
get_castle(29) ->
    #{type => 0, order_ratio => 1100, need_check => []};
get_castle(30) ->
    #{type => 0, order_ratio => 1100, need_check => []};
get_castle(31) ->
    #{type => 0, order_ratio => 1100, need_check => []};
get_castle(32) ->
    #{type => 0, order_ratio => 1100, need_check => []};
get_castle(33) ->
    #{type => 0, order_ratio => 1050, need_check => []};
get_castle(34) ->
    #{type => 0, order_ratio => 1050, need_check => [6]};
get_castle(6) ->
    #{type => 2, order_ratio => 1050, need_check => []};
get_castle(35) ->
    #{type => 0, order_ratio => 1050, need_check => [6]};
get_castle(36) ->
    #{type => 0, order_ratio => 1050, need_check => []};
get_castle(37) ->
    #{type => 0, order_ratio => 1050, need_check => []};
get_castle(38) ->
    #{type => 0, order_ratio => 1050, need_check => []};
get_castle(39) ->
    #{type => 0, order_ratio => 1050, need_check => []};
get_castle(40) ->
    #{type => 0, order_ratio => 1050, need_check => []};
get_castle(41) ->
    #{type => 0, order_ratio => 1050, need_check => []};
get_castle(42) ->
    #{type => 0, order_ratio => 1000, need_check => []};
get_castle(43) ->
    #{type => 0, order_ratio => 1000, need_check => []};
get_castle(44) ->
    #{type => 0, order_ratio => 1000, need_check => []};
get_castle(45) ->
    #{type => 0, order_ratio => 1000, need_check => []};
get_castle(46) ->
    #{type => 0, order_ratio => 1000, need_check => [7]};
get_castle(7) ->
    #{type => 2, order_ratio => 1000, need_check => []};
get_castle(47) ->
    #{type => 0, order_ratio => 1000, need_check => [7]};
get_castle(48) ->
    #{type => 0, order_ratio => 1000, need_check => []};
get_castle(49) ->
    #{type => 0, order_ratio => 1000, need_check => []};
get_castle(50) ->
    #{type => 0, order_ratio => 1000, need_check => []};
get_castle(_) -> false.

get_base_reward(0) ->
    #{mod_id => 3300, exp_ratio => 500,
      pet_exp_ratio => 500,
      base_reward => [{90036, 7}, {90011, 5}]};
get_base_reward(1) ->
    #{mod_id => 3300, exp_ratio => 800,
      pet_exp_ratio => 800,
      base_reward => [{90036, 10}, {90011, 10}]};
get_base_reward(2) ->
    #{mod_id => 3300, exp_ratio => 800,
      pet_exp_ratio => 800,
      base_reward => [{90036, 12}, {90011, 10}]};
get_base_reward(3) ->
    #{mod_id => 3300, exp_ratio => 800,
      pet_exp_ratio => 800,
      base_reward => [{90036, 15}, {90011, 10}]};
get_base_reward(4) ->
    #{mod_id => 3300, exp_ratio => 3000,
      pet_exp_ratio => 3000,
      base_reward => [{90036, 60}, {90011, 20}]};
get_base_reward(5) ->
    #{mod_id => 3300, exp_ratio => 1000,
      pet_exp_ratio => 1000,
      base_reward => [{90036, 30}, {90011, 10}]};
get_base_reward(_) -> false.

get_rand_reward(0) ->
    [#{item_id => 20006, num => 3, lev_low => 1,
       lev_high => 200, ratio => 151, bind => 0, is_cast => 0},
     #{item_id => 21220, num => 1, lev_low => 1,
       lev_high => 200, ratio => 120, bind => 0, is_cast => 0},
     #{item_id => 20005, num => 1, lev_low => 1,
       lev_high => 200, ratio => 66, bind => 0, is_cast => 0},
     #{item_id => 23555, num => 1, lev_low => 1,
       lev_high => 200, ratio => 150, bind => 0, is_cast => 0},
     #{item_id => 20004, num => 1, lev_low => 1,
       lev_high => 200, ratio => 106, bind => 0, is_cast => 0},
     #{item_id => 20025, num => 1, lev_low => 1,
       lev_high => 200, ratio => 135, bind => 0, is_cast => 0},
     #{item_id => 20000, num => 1, lev_low => 1,
       lev_high => 200, ratio => 120, bind => 0, is_cast => 0},
     #{item_id => 20087, num => 1, lev_low => 1,
       lev_high => 200, ratio => 104, bind => 0, is_cast => 1},
     #{item_id => 20074, num => 1, lev_low => 1,
       lev_high => 200, ratio => 33, bind => 0, is_cast => 0},
     #{item_id => 21420, num => 1, lev_low => 1,
       lev_high => 200, ratio => 15, bind => 0, is_cast => 0}];
get_rand_reward(1) ->
    [#{item_id => 20006, num => 3, lev_low => 1,
       lev_high => 200, ratio => 150, bind => 0, is_cast => 0},
     #{item_id => 21220, num => 1, lev_low => 1,
       lev_high => 200, ratio => 120, bind => 0, is_cast => 0},
     #{item_id => 20046, num => 1, lev_low => 1,
       lev_high => 200, ratio => 3, bind => 0, is_cast => 1},
     #{item_id => 23555, num => 1, lev_low => 1,
       lev_high => 200, ratio => 80, bind => 0, is_cast => 0},
     #{item_id => 21421, num => 1, lev_low => 1,
       lev_high => 200, ratio => 6, bind => 0, is_cast => 0},
     #{item_id => 20025, num => 1, lev_low => 1,
       lev_high => 200, ratio => 163, bind => 0, is_cast => 0},
     #{item_id => 20000, num => 1, lev_low => 1,
       lev_high => 200, ratio => 155, bind => 0, is_cast => 0},
     #{item_id => 20087, num => 1, lev_low => 1,
       lev_high => 200, ratio => 104, bind => 0, is_cast => 1},
     #{item_id => 20074, num => 1, lev_low => 1,
       lev_high => 200, ratio => 33, bind => 0, is_cast => 0},
     #{item_id => 21422, num => 1, lev_low => 1,
       lev_high => 200, ratio => 26, bind => 0, is_cast => 0},
     #{item_id => 20095, num => 1, lev_low => 1,
       lev_high => 200, ratio => 1, bind => 0, is_cast => 1},
     #{item_id => 20004, num => 1, lev_low => 1,
       lev_high => 200, ratio => 83, bind => 0, is_cast => 0},
     #{item_id => 21420, num => 1, lev_low => 1,
       lev_high => 200, ratio => 15, bind => 0, is_cast => 0},
     #{item_id => 20005, num => 1, lev_low => 1,
       lev_high => 200, ratio => 60, bind => 0, is_cast => 0},
     #{item_id => 20616, num => 1, lev_low => 1,
       lev_high => 200, ratio => 1, bind => 0, is_cast => 1}];
get_rand_reward(2) ->
    [#{item_id => 20006, num => 5, lev_low => 1,
       lev_high => 200, ratio => 150, bind => 0, is_cast => 0},
     #{item_id => 21220, num => 1, lev_low => 1,
       lev_high => 200, ratio => 120, bind => 0, is_cast => 0},
     #{item_id => 20046, num => 1, lev_low => 1,
       lev_high => 200, ratio => 3, bind => 0, is_cast => 1},
     #{item_id => 23555, num => 1, lev_low => 1,
       lev_high => 200, ratio => 80, bind => 0, is_cast => 0},
     #{item_id => 21421, num => 1, lev_low => 1,
       lev_high => 200, ratio => 6, bind => 0, is_cast => 0},
     #{item_id => 20025, num => 1, lev_low => 1,
       lev_high => 200, ratio => 163, bind => 0, is_cast => 0},
     #{item_id => 20000, num => 1, lev_low => 1,
       lev_high => 200, ratio => 155, bind => 0, is_cast => 0},
     #{item_id => 20087, num => 1, lev_low => 1,
       lev_high => 200, ratio => 104, bind => 0, is_cast => 1},
     #{item_id => 20074, num => 1, lev_low => 1,
       lev_high => 200, ratio => 33, bind => 0, is_cast => 0},
     #{item_id => 21422, num => 1, lev_low => 1,
       lev_high => 200, ratio => 26, bind => 0, is_cast => 0},
     #{item_id => 20095, num => 1, lev_low => 1,
       lev_high => 200, ratio => 1, bind => 0, is_cast => 1},
     #{item_id => 20004, num => 1, lev_low => 1,
       lev_high => 200, ratio => 83, bind => 0, is_cast => 0},
     #{item_id => 21420, num => 1, lev_low => 1,
       lev_high => 200, ratio => 15, bind => 0, is_cast => 0},
     #{item_id => 20005, num => 1, lev_low => 1,
       lev_high => 200, ratio => 60, bind => 0, is_cast => 0},
     #{item_id => 20616, num => 1, lev_low => 1,
       lev_high => 200, ratio => 1, bind => 0, is_cast => 1}];
get_rand_reward(3) ->
    [#{item_id => 20006, num => 5, lev_low => 1,
       lev_high => 200, ratio => 150, bind => 0, is_cast => 0},
     #{item_id => 21220, num => 1, lev_low => 1,
       lev_high => 200, ratio => 120, bind => 0, is_cast => 0},
     #{item_id => 20046, num => 1, lev_low => 1,
       lev_high => 200, ratio => 3, bind => 0, is_cast => 1},
     #{item_id => 23555, num => 1, lev_low => 1,
       lev_high => 200, ratio => 80, bind => 0, is_cast => 0},
     #{item_id => 21421, num => 1, lev_low => 1,
       lev_high => 200, ratio => 6, bind => 0, is_cast => 0},
     #{item_id => 20025, num => 1, lev_low => 1,
       lev_high => 200, ratio => 163, bind => 0, is_cast => 0},
     #{item_id => 20000, num => 1, lev_low => 1,
       lev_high => 200, ratio => 155, bind => 0, is_cast => 0},
     #{item_id => 20087, num => 1, lev_low => 1,
       lev_high => 200, ratio => 104, bind => 0, is_cast => 1},
     #{item_id => 20074, num => 1, lev_low => 1,
       lev_high => 200, ratio => 33, bind => 0, is_cast => 0},
     #{item_id => 21422, num => 1, lev_low => 1,
       lev_high => 200, ratio => 26, bind => 0, is_cast => 1},
     #{item_id => 20095, num => 1, lev_low => 1,
       lev_high => 200, ratio => 1, bind => 0, is_cast => 1},
     #{item_id => 20004, num => 1, lev_low => 1,
       lev_high => 200, ratio => 83, bind => 0, is_cast => 0},
     #{item_id => 21420, num => 1, lev_low => 1,
       lev_high => 200, ratio => 15, bind => 0, is_cast => 0},
     #{item_id => 20005, num => 1, lev_low => 1,
       lev_high => 200, ratio => 60, bind => 0, is_cast => 0},
     #{item_id => 20616, num => 1, lev_low => 1,
       lev_high => 200, ratio => 1, bind => 0, is_cast => 1}];
get_rand_reward(_) -> [].

get_guild(1) ->
    #{assets => 1800000, base_id => 23014, num => 3};
get_guild(0) ->
    #{assets => 800000, base_id => 23014, num => 1};
get_guild(_) -> false.

