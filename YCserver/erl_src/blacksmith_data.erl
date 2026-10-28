-file("src/data/blacksmith_data.erl", 1).

-module(blacksmith_data).

-export([get_forge/1,
         get_reset/1,
         get_enchant/1,
         get_growth/1,
         growth_add/1,
         item_to_luck/1,
         get_halo_id/1,
         get_stone/1,
         get_embed/1,
         get_hero_embed/1,
         stone_val/1,
         hero_stone_val/1,
         hero_stone_cost/1,
         remove_stone/1,
         remove_hero_stone/1,
         stone_degrade/1,
         get_transform/1,
         get_skill_transform/1,
         get_reset_reward/0,
         get_comprehend/1,
         get_comprehend_looks/1,
         enchant_fail_reward/1,
         get_break_enchant/1,
         get_decompose/1,
         get_stone_classes_modify/1,
         get_target_stone_id/1,
         get_comprehend_discount/1,
         get_target_skill_trans/1]).

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

-file("src/data/blacksmith_data.erl", 40).

-file("inc/blacksmith.hrl", 1).

-record(enchant_fail_reward,
        {val = 0,
         item_list = [],
         title = "",
         msg = "",
         is_break = 0}).

-file("src/data/blacksmith_data.erl", 41).

get_forge({10031, 1, 1}) ->
    #{next_id => 10041, need_lev => 40, next_lev => 40,
      need_coin => 0,
      need_item => [{20520, 1}, {20310, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{20520, 1}, {20310, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10032, 1, 1}) ->
    #{next_id => 10042, need_lev => 40, next_lev => 40,
      need_coin => 0,
      need_item => [{20520, 1}, {20320, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{20520, 1}, {20320, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10033, 1, 1}) ->
    #{next_id => 10043, need_lev => 40, next_lev => 40,
      need_coin => 0,
      need_item => [{20520, 1}, {20320, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{20520, 1}, {20320, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10034, 1, 1}) ->
    #{next_id => 10044, need_lev => 40, next_lev => 40,
      need_coin => 0,
      need_item => [{20520, 1}, {20320, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{20520, 1}, {20320, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10036, 1, 1}) ->
    #{next_id => 10046, need_lev => 40, next_lev => 40,
      need_coin => 0,
      need_item => [{20520, 1}, {20320, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{20520, 1}, {20320, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10531, 1, 1}) ->
    #{next_id => 10541, need_lev => 40, next_lev => 40,
      need_coin => 0,
      need_item => [{20520, 1}, {20310, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{20520, 1}, {20310, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10532, 1, 1}) ->
    #{next_id => 10542, need_lev => 40, next_lev => 40,
      need_coin => 0,
      need_item => [{20520, 1}, {20310, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{20520, 1}, {20310, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10534, 1, 1}) ->
    #{next_id => 10544, need_lev => 40, next_lev => 40,
      need_coin => 0,
      need_item => [{20520, 1}, {20310, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{20520, 1}, {20310, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10041, 1, 1}) ->
    #{next_id => 10051, need_lev => 50, next_lev => 50,
      need_coin => 0,
      need_item => [{20525, 1}, {20311, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{20525, 1}, {20311, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10042, 1, 1}) ->
    #{next_id => 10052, need_lev => 50, next_lev => 50,
      need_coin => 0,
      need_item => [{20525, 1}, {20321, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{20525, 1}, {20321, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10043, 1, 1}) ->
    #{next_id => 10053, need_lev => 50, next_lev => 50,
      need_coin => 0,
      need_item => [{20525, 1}, {20321, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{20525, 1}, {20321, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10044, 1, 1}) ->
    #{next_id => 10054, need_lev => 50, next_lev => 50,
      need_coin => 0,
      need_item => [{20525, 1}, {20321, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{20525, 1}, {20321, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10046, 1, 1}) ->
    #{next_id => 10056, need_lev => 50, next_lev => 50,
      need_coin => 0,
      need_item => [{20525, 1}, {20321, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{20525, 1}, {20321, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10541, 1, 1}) ->
    #{next_id => 10551, need_lev => 50, next_lev => 50,
      need_coin => 0,
      need_item => [{20525, 1}, {20311, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{20525, 1}, {20311, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10542, 1, 1}) ->
    #{next_id => 10552, need_lev => 50, next_lev => 50,
      need_coin => 0,
      need_item => [{20525, 1}, {20311, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{20525, 1}, {20311, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10544, 1, 1}) ->
    #{next_id => 10554, need_lev => 50, next_lev => 50,
      need_coin => 0,
      need_item => [{20525, 1}, {20311, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{20525, 1}, {20311, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10051, 1, 1}) ->
    #{next_id => 10061, need_lev => 60, next_lev => 60,
      need_coin => 0,
      need_item => [{20530, 1}, {20312, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{20530, 1}, {20312, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10052, 1, 1}) ->
    #{next_id => 10062, need_lev => 60, next_lev => 60,
      need_coin => 0,
      need_item => [{20530, 1}, {20322, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{20530, 1}, {20322, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10053, 1, 1}) ->
    #{next_id => 10063, need_lev => 60, next_lev => 60,
      need_coin => 0,
      need_item => [{20530, 1}, {20322, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{20530, 1}, {20322, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10054, 1, 1}) ->
    #{next_id => 10064, need_lev => 60, next_lev => 60,
      need_coin => 0,
      need_item => [{20530, 1}, {20322, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{20530, 1}, {20322, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10056, 1, 1}) ->
    #{next_id => 10066, need_lev => 60, next_lev => 60,
      need_coin => 0,
      need_item => [{20530, 1}, {20322, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{20530, 1}, {20322, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10551, 1, 1}) ->
    #{next_id => 10561, need_lev => 60, next_lev => 60,
      need_coin => 0,
      need_item => [{20530, 1}, {20312, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{20530, 1}, {20312, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10552, 1, 1}) ->
    #{next_id => 10562, need_lev => 60, next_lev => 60,
      need_coin => 0,
      need_item => [{20530, 1}, {20312, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{20530, 1}, {20312, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10554, 1, 1}) ->
    #{next_id => 10564, need_lev => 60, next_lev => 60,
      need_coin => 0,
      need_item => [{20530, 1}, {20312, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{20530, 1}, {20312, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10061, 1, 1}) ->
    #{next_id => 10071, need_lev => 70, next_lev => 70,
      need_coin => 0,
      need_item => [{20535, 1}, {20313, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{20535, 1}, {20313, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10062, 1, 1}) ->
    #{next_id => 10072, need_lev => 70, next_lev => 70,
      need_coin => 0,
      need_item => [{20535, 1}, {20323, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{20535, 1}, {20323, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10063, 1, 1}) ->
    #{next_id => 10073, need_lev => 70, next_lev => 70,
      need_coin => 0,
      need_item => [{20535, 1}, {20323, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{20535, 1}, {20323, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10064, 1, 1}) ->
    #{next_id => 10074, need_lev => 70, next_lev => 70,
      need_coin => 0,
      need_item => [{20535, 1}, {20323, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{20535, 1}, {20323, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10066, 1, 1}) ->
    #{next_id => 10076, need_lev => 70, next_lev => 70,
      need_coin => 0,
      need_item => [{20535, 1}, {20323, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{20535, 1}, {20323, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10561, 1, 1}) ->
    #{next_id => 10571, need_lev => 70, next_lev => 70,
      need_coin => 0,
      need_item => [{20535, 1}, {20313, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{20535, 1}, {20313, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10562, 1, 1}) ->
    #{next_id => 10572, need_lev => 70, next_lev => 70,
      need_coin => 0,
      need_item => [{20535, 1}, {20313, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{20535, 1}, {20313, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10564, 1, 1}) ->
    #{next_id => 10574, need_lev => 70, next_lev => 70,
      need_coin => 0,
      need_item => [{20535, 1}, {20313, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{20535, 1}, {20313, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10071, 1, 1}) ->
    #{next_id => 10081, need_lev => 80, next_lev => 80,
      need_coin => 0,
      need_item => [{20540, 1}, {20314, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{20540, 1}, {20314, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10072, 1, 1}) ->
    #{next_id => 10082, need_lev => 80, next_lev => 80,
      need_coin => 0,
      need_item => [{20540, 1}, {20324, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{20540, 1}, {20324, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10073, 1, 1}) ->
    #{next_id => 10083, need_lev => 80, next_lev => 80,
      need_coin => 0,
      need_item => [{20540, 1}, {20324, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{20540, 1}, {20324, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10074, 1, 1}) ->
    #{next_id => 10084, need_lev => 80, next_lev => 80,
      need_coin => 0,
      need_item => [{20540, 1}, {20324, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{20540, 1}, {20324, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10076, 1, 1}) ->
    #{next_id => 10086, need_lev => 80, next_lev => 80,
      need_coin => 0,
      need_item => [{20540, 1}, {20324, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{20540, 1}, {20324, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10571, 1, 1}) ->
    #{next_id => 10581, need_lev => 80, next_lev => 80,
      need_coin => 0,
      need_item => [{20540, 1}, {20314, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{20540, 1}, {20314, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10572, 1, 1}) ->
    #{next_id => 10582, need_lev => 80, next_lev => 80,
      need_coin => 0,
      need_item => [{20540, 1}, {20314, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{20540, 1}, {20314, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10574, 1, 1}) ->
    #{next_id => 10584, need_lev => 80, next_lev => 80,
      need_coin => 0,
      need_item => [{20540, 1}, {20314, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{20540, 1}, {20314, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10081, 1, 1}) ->
    #{next_id => 10091, need_lev => 90, next_lev => 90,
      need_coin => 0,
      need_item => [{20555, 1}, {20315, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{20555, 1}, {20315, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10082, 1, 1}) ->
    #{next_id => 10092, need_lev => 90, next_lev => 90,
      need_coin => 0,
      need_item => [{20555, 1}, {20325, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{20555, 1}, {20325, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10083, 1, 1}) ->
    #{next_id => 10093, need_lev => 90, next_lev => 90,
      need_coin => 0,
      need_item => [{20555, 1}, {20325, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{20555, 1}, {20325, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10084, 1, 1}) ->
    #{next_id => 10094, need_lev => 90, next_lev => 90,
      need_coin => 0,
      need_item => [{20555, 1}, {20325, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{20555, 1}, {20325, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10086, 1, 1}) ->
    #{next_id => 10096, need_lev => 90, next_lev => 90,
      need_coin => 0,
      need_item => [{20555, 1}, {20325, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{20555, 1}, {20325, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10581, 1, 1}) ->
    #{next_id => 10591, need_lev => 90, next_lev => 90,
      need_coin => 0,
      need_item => [{20555, 1}, {20315, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{20555, 1}, {20315, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10582, 1, 1}) ->
    #{next_id => 10592, need_lev => 90, next_lev => 90,
      need_coin => 0,
      need_item => [{20555, 1}, {20315, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{20555, 1}, {20315, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10584, 1, 1}) ->
    #{next_id => 10594, need_lev => 90, next_lev => 90,
      need_coin => 0,
      need_item => [{20555, 1}, {20315, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{20555, 1}, {20315, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10131, 1, 2}) ->
    #{next_id => 10141, need_lev => 40, next_lev => 40,
      need_coin => 0,
      need_item => [{20521, 1}, {20310, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{20521, 1}, {20310, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10132, 1, 2}) ->
    #{next_id => 10142, need_lev => 40, next_lev => 40,
      need_coin => 0,
      need_item => [{20521, 1}, {20320, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{20521, 1}, {20320, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10133, 1, 2}) ->
    #{next_id => 10143, need_lev => 40, next_lev => 40,
      need_coin => 0,
      need_item => [{20521, 1}, {20320, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{20521, 1}, {20320, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10134, 1, 2}) ->
    #{next_id => 10144, need_lev => 40, next_lev => 40,
      need_coin => 0,
      need_item => [{20521, 1}, {20320, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{20521, 1}, {20320, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10136, 1, 2}) ->
    #{next_id => 10146, need_lev => 40, next_lev => 40,
      need_coin => 0,
      need_item => [{20521, 1}, {20320, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{20521, 1}, {20320, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10531, 1, 2}) ->
    #{next_id => 10541, need_lev => 40, next_lev => 40,
      need_coin => 0,
      need_item => [{20521, 1}, {20310, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{20521, 1}, {20310, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10532, 1, 2}) ->
    #{next_id => 10542, need_lev => 40, next_lev => 40,
      need_coin => 0,
      need_item => [{20521, 1}, {20310, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{20521, 1}, {20310, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10534, 1, 2}) ->
    #{next_id => 10544, need_lev => 40, next_lev => 40,
      need_coin => 0,
      need_item => [{20521, 1}, {20310, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{20521, 1}, {20310, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10141, 1, 2}) ->
    #{next_id => 10151, need_lev => 50, next_lev => 50,
      need_coin => 0,
      need_item => [{20526, 1}, {20311, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{20526, 1}, {20311, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10142, 1, 2}) ->
    #{next_id => 10152, need_lev => 50, next_lev => 50,
      need_coin => 0,
      need_item => [{20526, 1}, {20321, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{20526, 1}, {20321, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10143, 1, 2}) ->
    #{next_id => 10153, need_lev => 50, next_lev => 50,
      need_coin => 0,
      need_item => [{20526, 1}, {20321, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{20526, 1}, {20321, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10144, 1, 2}) ->
    #{next_id => 10154, need_lev => 50, next_lev => 50,
      need_coin => 0,
      need_item => [{20526, 1}, {20321, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{20526, 1}, {20321, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10146, 1, 2}) ->
    #{next_id => 10156, need_lev => 50, next_lev => 50,
      need_coin => 0,
      need_item => [{20526, 1}, {20321, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{20526, 1}, {20321, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10541, 1, 2}) ->
    #{next_id => 10551, need_lev => 50, next_lev => 50,
      need_coin => 0,
      need_item => [{20526, 1}, {20311, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{20526, 1}, {20311, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10542, 1, 2}) ->
    #{next_id => 10552, need_lev => 50, next_lev => 50,
      need_coin => 0,
      need_item => [{20526, 1}, {20311, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{20526, 1}, {20311, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10544, 1, 2}) ->
    #{next_id => 10554, need_lev => 50, next_lev => 50,
      need_coin => 0,
      need_item => [{20526, 1}, {20311, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{20526, 1}, {20311, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10151, 1, 2}) ->
    #{next_id => 10161, need_lev => 60, next_lev => 60,
      need_coin => 0,
      need_item => [{20531, 1}, {20312, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{20531, 1}, {20312, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10152, 1, 2}) ->
    #{next_id => 10162, need_lev => 60, next_lev => 60,
      need_coin => 0,
      need_item => [{20531, 1}, {20322, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{20531, 1}, {20322, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10153, 1, 2}) ->
    #{next_id => 10163, need_lev => 60, next_lev => 60,
      need_coin => 0,
      need_item => [{20531, 1}, {20322, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{20531, 1}, {20322, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10154, 1, 2}) ->
    #{next_id => 10164, need_lev => 60, next_lev => 60,
      need_coin => 0,
      need_item => [{20531, 1}, {20322, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{20531, 1}, {20322, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10156, 1, 2}) ->
    #{next_id => 10166, need_lev => 60, next_lev => 60,
      need_coin => 0,
      need_item => [{20531, 1}, {20322, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{20531, 1}, {20322, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10551, 1, 2}) ->
    #{next_id => 10561, need_lev => 60, next_lev => 60,
      need_coin => 0,
      need_item => [{20531, 1}, {20312, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{20531, 1}, {20312, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10552, 1, 2}) ->
    #{next_id => 10562, need_lev => 60, next_lev => 60,
      need_coin => 0,
      need_item => [{20531, 1}, {20312, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{20531, 1}, {20312, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10554, 1, 2}) ->
    #{next_id => 10564, need_lev => 60, next_lev => 60,
      need_coin => 0,
      need_item => [{20531, 1}, {20312, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{20531, 1}, {20312, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10161, 1, 2}) ->
    #{next_id => 10171, need_lev => 70, next_lev => 70,
      need_coin => 0,
      need_item => [{20536, 1}, {20313, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{20536, 1}, {20313, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10162, 1, 2}) ->
    #{next_id => 10172, need_lev => 70, next_lev => 70,
      need_coin => 0,
      need_item => [{20536, 1}, {20323, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{20536, 1}, {20323, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10163, 1, 2}) ->
    #{next_id => 10173, need_lev => 70, next_lev => 70,
      need_coin => 0,
      need_item => [{20536, 1}, {20323, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{20536, 1}, {20323, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10164, 1, 2}) ->
    #{next_id => 10174, need_lev => 70, next_lev => 70,
      need_coin => 0,
      need_item => [{20536, 1}, {20323, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{20536, 1}, {20323, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10166, 1, 2}) ->
    #{next_id => 10176, need_lev => 70, next_lev => 70,
      need_coin => 0,
      need_item => [{20536, 1}, {20323, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{20536, 1}, {20323, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10561, 1, 2}) ->
    #{next_id => 10571, need_lev => 70, next_lev => 70,
      need_coin => 0,
      need_item => [{20536, 1}, {20313, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{20536, 1}, {20313, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10562, 1, 2}) ->
    #{next_id => 10572, need_lev => 70, next_lev => 70,
      need_coin => 0,
      need_item => [{20536, 1}, {20313, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{20536, 1}, {20313, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10564, 1, 2}) ->
    #{next_id => 10574, need_lev => 70, next_lev => 70,
      need_coin => 0,
      need_item => [{20536, 1}, {20313, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{20536, 1}, {20313, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10171, 1, 2}) ->
    #{next_id => 10181, need_lev => 80, next_lev => 80,
      need_coin => 0,
      need_item => [{20541, 1}, {20314, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{20541, 1}, {20314, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10172, 1, 2}) ->
    #{next_id => 10182, need_lev => 80, next_lev => 80,
      need_coin => 0,
      need_item => [{20541, 1}, {20324, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{20541, 1}, {20324, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10173, 1, 2}) ->
    #{next_id => 10183, need_lev => 80, next_lev => 80,
      need_coin => 0,
      need_item => [{20541, 1}, {20324, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{20541, 1}, {20324, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10174, 1, 2}) ->
    #{next_id => 10184, need_lev => 80, next_lev => 80,
      need_coin => 0,
      need_item => [{20541, 1}, {20324, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{20541, 1}, {20324, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10176, 1, 2}) ->
    #{next_id => 10186, need_lev => 80, next_lev => 80,
      need_coin => 0,
      need_item => [{20541, 1}, {20324, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{20541, 1}, {20324, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10571, 1, 2}) ->
    #{next_id => 10581, need_lev => 80, next_lev => 80,
      need_coin => 0,
      need_item => [{20541, 1}, {20314, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{20541, 1}, {20314, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10572, 1, 2}) ->
    #{next_id => 10582, need_lev => 80, next_lev => 80,
      need_coin => 0,
      need_item => [{20541, 1}, {20314, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{20541, 1}, {20314, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10574, 1, 2}) ->
    #{next_id => 10584, need_lev => 80, next_lev => 80,
      need_coin => 0,
      need_item => [{20541, 1}, {20314, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{20541, 1}, {20314, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10181, 1, 2}) ->
    #{next_id => 10191, need_lev => 90, next_lev => 90,
      need_coin => 0,
      need_item => [{20556, 1}, {20315, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{20556, 1}, {20315, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10182, 1, 2}) ->
    #{next_id => 10192, need_lev => 90, next_lev => 90,
      need_coin => 0,
      need_item => [{20556, 1}, {20325, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{20556, 1}, {20325, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10183, 1, 2}) ->
    #{next_id => 10193, need_lev => 90, next_lev => 90,
      need_coin => 0,
      need_item => [{20556, 1}, {20325, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{20556, 1}, {20325, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10184, 1, 2}) ->
    #{next_id => 10194, need_lev => 90, next_lev => 90,
      need_coin => 0,
      need_item => [{20556, 1}, {20325, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{20556, 1}, {20325, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10186, 1, 2}) ->
    #{next_id => 10196, need_lev => 90, next_lev => 90,
      need_coin => 0,
      need_item => [{20556, 1}, {20325, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{20556, 1}, {20325, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10581, 1, 2}) ->
    #{next_id => 10591, need_lev => 90, next_lev => 90,
      need_coin => 0,
      need_item => [{20556, 1}, {20315, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{20556, 1}, {20315, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10582, 1, 2}) ->
    #{next_id => 10592, need_lev => 90, next_lev => 90,
      need_coin => 0,
      need_item => [{20556, 1}, {20315, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{20556, 1}, {20315, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10584, 1, 2}) ->
    #{next_id => 10594, need_lev => 90, next_lev => 90,
      need_coin => 0,
      need_item => [{20556, 1}, {20315, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{20556, 1}, {20315, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10231, 1, 3}) ->
    #{next_id => 10241, need_lev => 40, next_lev => 40,
      need_coin => 0,
      need_item => [{20522, 1}, {20310, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{20522, 1}, {20310, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10232, 1, 3}) ->
    #{next_id => 10242, need_lev => 40, next_lev => 40,
      need_coin => 0,
      need_item => [{20522, 1}, {20320, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{20522, 1}, {20320, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10233, 1, 3}) ->
    #{next_id => 10243, need_lev => 40, next_lev => 40,
      need_coin => 0,
      need_item => [{20522, 1}, {20320, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{20522, 1}, {20320, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10234, 1, 3}) ->
    #{next_id => 10244, need_lev => 40, next_lev => 40,
      need_coin => 0,
      need_item => [{20522, 1}, {20320, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{20522, 1}, {20320, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10236, 1, 3}) ->
    #{next_id => 10246, need_lev => 40, next_lev => 40,
      need_coin => 0,
      need_item => [{20522, 1}, {20320, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{20522, 1}, {20320, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10531, 1, 3}) ->
    #{next_id => 10541, need_lev => 40, next_lev => 40,
      need_coin => 0,
      need_item => [{20522, 1}, {20310, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{20522, 1}, {20310, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10532, 1, 3}) ->
    #{next_id => 10542, need_lev => 40, next_lev => 40,
      need_coin => 0,
      need_item => [{20522, 1}, {20310, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{20522, 1}, {20310, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10534, 1, 3}) ->
    #{next_id => 10544, need_lev => 40, next_lev => 40,
      need_coin => 0,
      need_item => [{20522, 1}, {20310, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{20522, 1}, {20310, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10241, 1, 3}) ->
    #{next_id => 10251, need_lev => 50, next_lev => 50,
      need_coin => 0,
      need_item => [{20527, 1}, {20311, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{20527, 1}, {20311, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10242, 1, 3}) ->
    #{next_id => 10252, need_lev => 50, next_lev => 50,
      need_coin => 0,
      need_item => [{20527, 1}, {20321, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{20527, 1}, {20321, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10243, 1, 3}) ->
    #{next_id => 10253, need_lev => 50, next_lev => 50,
      need_coin => 0,
      need_item => [{20527, 1}, {20321, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{20527, 1}, {20321, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10244, 1, 3}) ->
    #{next_id => 10254, need_lev => 50, next_lev => 50,
      need_coin => 0,
      need_item => [{20527, 1}, {20321, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{20527, 1}, {20321, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10246, 1, 3}) ->
    #{next_id => 10256, need_lev => 50, next_lev => 50,
      need_coin => 0,
      need_item => [{20527, 1}, {20321, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{20527, 1}, {20321, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10541, 1, 3}) ->
    #{next_id => 10551, need_lev => 50, next_lev => 50,
      need_coin => 0,
      need_item => [{20527, 1}, {20311, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{20527, 1}, {20311, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10542, 1, 3}) ->
    #{next_id => 10552, need_lev => 50, next_lev => 50,
      need_coin => 0,
      need_item => [{20527, 1}, {20311, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{20527, 1}, {20311, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10544, 1, 3}) ->
    #{next_id => 10554, need_lev => 50, next_lev => 50,
      need_coin => 0,
      need_item => [{20527, 1}, {20311, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{20527, 1}, {20311, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10251, 1, 3}) ->
    #{next_id => 10261, need_lev => 60, next_lev => 60,
      need_coin => 0,
      need_item => [{20532, 1}, {20312, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{20532, 1}, {20312, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10252, 1, 3}) ->
    #{next_id => 10262, need_lev => 60, next_lev => 60,
      need_coin => 0,
      need_item => [{20532, 1}, {20322, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{20532, 1}, {20322, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10253, 1, 3}) ->
    #{next_id => 10263, need_lev => 60, next_lev => 60,
      need_coin => 0,
      need_item => [{20532, 1}, {20322, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{20532, 1}, {20322, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10254, 1, 3}) ->
    #{next_id => 10264, need_lev => 60, next_lev => 60,
      need_coin => 0,
      need_item => [{20532, 1}, {20322, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{20532, 1}, {20322, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10256, 1, 3}) ->
    #{next_id => 10266, need_lev => 60, next_lev => 60,
      need_coin => 0,
      need_item => [{20532, 1}, {20322, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{20532, 1}, {20322, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10551, 1, 3}) ->
    #{next_id => 10561, need_lev => 60, next_lev => 60,
      need_coin => 0,
      need_item => [{20532, 1}, {20312, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{20532, 1}, {20312, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10552, 1, 3}) ->
    #{next_id => 10562, need_lev => 60, next_lev => 60,
      need_coin => 0,
      need_item => [{20532, 1}, {20312, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{20532, 1}, {20312, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10554, 1, 3}) ->
    #{next_id => 10564, need_lev => 60, next_lev => 60,
      need_coin => 0,
      need_item => [{20532, 1}, {20312, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{20532, 1}, {20312, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10261, 1, 3}) ->
    #{next_id => 10271, need_lev => 70, next_lev => 70,
      need_coin => 0,
      need_item => [{20537, 1}, {20313, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{20537, 1}, {20313, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10262, 1, 3}) ->
    #{next_id => 10272, need_lev => 70, next_lev => 70,
      need_coin => 0,
      need_item => [{20537, 1}, {20323, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{20537, 1}, {20323, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10263, 1, 3}) ->
    #{next_id => 10273, need_lev => 70, next_lev => 70,
      need_coin => 0,
      need_item => [{20537, 1}, {20323, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{20537, 1}, {20323, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10264, 1, 3}) ->
    #{next_id => 10274, need_lev => 70, next_lev => 70,
      need_coin => 0,
      need_item => [{20537, 1}, {20323, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{20537, 1}, {20323, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10266, 1, 3}) ->
    #{next_id => 10276, need_lev => 70, next_lev => 70,
      need_coin => 0,
      need_item => [{20537, 1}, {20323, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{20537, 1}, {20323, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10561, 1, 3}) ->
    #{next_id => 10571, need_lev => 70, next_lev => 70,
      need_coin => 0,
      need_item => [{20537, 1}, {20313, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{20537, 1}, {20313, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10562, 1, 3}) ->
    #{next_id => 10572, need_lev => 70, next_lev => 70,
      need_coin => 0,
      need_item => [{20537, 1}, {20313, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{20537, 1}, {20313, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10564, 1, 3}) ->
    #{next_id => 10574, need_lev => 70, next_lev => 70,
      need_coin => 0,
      need_item => [{20537, 1}, {20313, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{20537, 1}, {20313, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10271, 1, 3}) ->
    #{next_id => 10281, need_lev => 80, next_lev => 80,
      need_coin => 0,
      need_item => [{20542, 1}, {20314, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{20542, 1}, {20314, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10272, 1, 3}) ->
    #{next_id => 10282, need_lev => 80, next_lev => 80,
      need_coin => 0,
      need_item => [{20542, 1}, {20324, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{20542, 1}, {20324, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10273, 1, 3}) ->
    #{next_id => 10283, need_lev => 80, next_lev => 80,
      need_coin => 0,
      need_item => [{20542, 1}, {20324, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{20542, 1}, {20324, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10274, 1, 3}) ->
    #{next_id => 10284, need_lev => 80, next_lev => 80,
      need_coin => 0,
      need_item => [{20542, 1}, {20324, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{20542, 1}, {20324, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10276, 1, 3}) ->
    #{next_id => 10286, need_lev => 80, next_lev => 80,
      need_coin => 0,
      need_item => [{20542, 1}, {20324, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{20542, 1}, {20324, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10571, 1, 3}) ->
    #{next_id => 10581, need_lev => 80, next_lev => 80,
      need_coin => 0,
      need_item => [{20542, 1}, {20314, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{20542, 1}, {20314, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10572, 1, 3}) ->
    #{next_id => 10582, need_lev => 80, next_lev => 80,
      need_coin => 0,
      need_item => [{20542, 1}, {20314, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{20542, 1}, {20314, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10574, 1, 3}) ->
    #{next_id => 10584, need_lev => 80, next_lev => 80,
      need_coin => 0,
      need_item => [{20542, 1}, {20314, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{20542, 1}, {20314, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10281, 1, 3}) ->
    #{next_id => 10291, need_lev => 90, next_lev => 90,
      need_coin => 0,
      need_item => [{20557, 1}, {20315, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{20557, 1}, {20315, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10282, 1, 3}) ->
    #{next_id => 10292, need_lev => 90, next_lev => 90,
      need_coin => 0,
      need_item => [{20557, 1}, {20325, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{20557, 1}, {20325, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10283, 1, 3}) ->
    #{next_id => 10293, need_lev => 90, next_lev => 90,
      need_coin => 0,
      need_item => [{20557, 1}, {20325, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{20557, 1}, {20325, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10284, 1, 3}) ->
    #{next_id => 10294, need_lev => 90, next_lev => 90,
      need_coin => 0,
      need_item => [{20557, 1}, {20325, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{20557, 1}, {20325, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10286, 1, 3}) ->
    #{next_id => 10296, need_lev => 90, next_lev => 90,
      need_coin => 0,
      need_item => [{20557, 1}, {20325, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{20557, 1}, {20325, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10581, 1, 3}) ->
    #{next_id => 10591, need_lev => 90, next_lev => 90,
      need_coin => 0,
      need_item => [{20557, 1}, {20315, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{20557, 1}, {20315, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10582, 1, 3}) ->
    #{next_id => 10592, need_lev => 90, next_lev => 90,
      need_coin => 0,
      need_item => [{20557, 1}, {20315, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{20557, 1}, {20315, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10584, 1, 3}) ->
    #{next_id => 10594, need_lev => 90, next_lev => 90,
      need_coin => 0,
      need_item => [{20557, 1}, {20315, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{20557, 1}, {20315, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10331, 1, 4}) ->
    #{next_id => 10341, need_lev => 40, next_lev => 40,
      need_coin => 0,
      need_item => [{20523, 1}, {20310, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{20523, 1}, {20310, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10332, 1, 4}) ->
    #{next_id => 10342, need_lev => 40, next_lev => 40,
      need_coin => 0,
      need_item => [{20523, 1}, {20320, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{20523, 1}, {20320, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10333, 1, 4}) ->
    #{next_id => 10343, need_lev => 40, next_lev => 40,
      need_coin => 0,
      need_item => [{20523, 1}, {20320, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{20523, 1}, {20320, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10334, 1, 4}) ->
    #{next_id => 10344, need_lev => 40, next_lev => 40,
      need_coin => 0,
      need_item => [{20523, 1}, {20320, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{20523, 1}, {20320, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10336, 1, 4}) ->
    #{next_id => 10346, need_lev => 40, next_lev => 40,
      need_coin => 0,
      need_item => [{20523, 1}, {20320, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{20523, 1}, {20320, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10531, 1, 4}) ->
    #{next_id => 10541, need_lev => 40, next_lev => 40,
      need_coin => 0,
      need_item => [{20523, 1}, {20310, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{20523, 1}, {20310, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10532, 1, 4}) ->
    #{next_id => 10542, need_lev => 40, next_lev => 40,
      need_coin => 0,
      need_item => [{20523, 1}, {20310, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{20523, 1}, {20310, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10534, 1, 4}) ->
    #{next_id => 10544, need_lev => 40, next_lev => 40,
      need_coin => 0,
      need_item => [{20523, 1}, {20310, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{20523, 1}, {20310, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10341, 1, 4}) ->
    #{next_id => 10351, need_lev => 50, next_lev => 50,
      need_coin => 0,
      need_item => [{20528, 1}, {20311, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{20528, 1}, {20311, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10342, 1, 4}) ->
    #{next_id => 10352, need_lev => 50, next_lev => 50,
      need_coin => 0,
      need_item => [{20528, 1}, {20321, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{20528, 1}, {20321, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10343, 1, 4}) ->
    #{next_id => 10353, need_lev => 50, next_lev => 50,
      need_coin => 0,
      need_item => [{20528, 1}, {20321, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{20528, 1}, {20321, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10344, 1, 4}) ->
    #{next_id => 10354, need_lev => 50, next_lev => 50,
      need_coin => 0,
      need_item => [{20528, 1}, {20321, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{20528, 1}, {20321, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10346, 1, 4}) ->
    #{next_id => 10356, need_lev => 50, next_lev => 50,
      need_coin => 0,
      need_item => [{20528, 1}, {20321, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{20528, 1}, {20321, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10541, 1, 4}) ->
    #{next_id => 10551, need_lev => 50, next_lev => 50,
      need_coin => 0,
      need_item => [{20528, 1}, {20311, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{20528, 1}, {20311, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10542, 1, 4}) ->
    #{next_id => 10552, need_lev => 50, next_lev => 50,
      need_coin => 0,
      need_item => [{20528, 1}, {20311, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{20528, 1}, {20311, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10544, 1, 4}) ->
    #{next_id => 10554, need_lev => 50, next_lev => 50,
      need_coin => 0,
      need_item => [{20528, 1}, {20311, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{20528, 1}, {20311, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10351, 1, 4}) ->
    #{next_id => 10361, need_lev => 60, next_lev => 60,
      need_coin => 0,
      need_item => [{20533, 1}, {20312, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{20533, 1}, {20312, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10352, 1, 4}) ->
    #{next_id => 10362, need_lev => 60, next_lev => 60,
      need_coin => 0,
      need_item => [{20533, 1}, {20322, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{20533, 1}, {20322, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10353, 1, 4}) ->
    #{next_id => 10363, need_lev => 60, next_lev => 60,
      need_coin => 0,
      need_item => [{20533, 1}, {20322, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{20533, 1}, {20322, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10354, 1, 4}) ->
    #{next_id => 10364, need_lev => 60, next_lev => 60,
      need_coin => 0,
      need_item => [{20533, 1}, {20322, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{20533, 1}, {20322, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10356, 1, 4}) ->
    #{next_id => 10366, need_lev => 60, next_lev => 60,
      need_coin => 0,
      need_item => [{20533, 1}, {20322, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{20533, 1}, {20322, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10551, 1, 4}) ->
    #{next_id => 10561, need_lev => 60, next_lev => 60,
      need_coin => 0,
      need_item => [{20533, 1}, {20312, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{20533, 1}, {20312, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10552, 1, 4}) ->
    #{next_id => 10562, need_lev => 60, next_lev => 60,
      need_coin => 0,
      need_item => [{20533, 1}, {20312, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{20533, 1}, {20312, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10554, 1, 4}) ->
    #{next_id => 10564, need_lev => 60, next_lev => 60,
      need_coin => 0,
      need_item => [{20533, 1}, {20312, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{20533, 1}, {20312, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10361, 1, 4}) ->
    #{next_id => 10371, need_lev => 70, next_lev => 70,
      need_coin => 0,
      need_item => [{20538, 1}, {20313, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{20538, 1}, {20313, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10362, 1, 4}) ->
    #{next_id => 10372, need_lev => 70, next_lev => 70,
      need_coin => 0,
      need_item => [{20538, 1}, {20323, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{20538, 1}, {20323, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10363, 1, 4}) ->
    #{next_id => 10373, need_lev => 70, next_lev => 70,
      need_coin => 0,
      need_item => [{20538, 1}, {20323, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{20538, 1}, {20323, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10364, 1, 4}) ->
    #{next_id => 10374, need_lev => 70, next_lev => 70,
      need_coin => 0,
      need_item => [{20538, 1}, {20323, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{20538, 1}, {20323, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10366, 1, 4}) ->
    #{next_id => 10376, need_lev => 70, next_lev => 70,
      need_coin => 0,
      need_item => [{20538, 1}, {20323, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{20538, 1}, {20323, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10561, 1, 4}) ->
    #{next_id => 10571, need_lev => 70, next_lev => 70,
      need_coin => 0,
      need_item => [{20538, 1}, {20313, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{20538, 1}, {20313, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10562, 1, 4}) ->
    #{next_id => 10572, need_lev => 70, next_lev => 70,
      need_coin => 0,
      need_item => [{20538, 1}, {20313, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{20538, 1}, {20313, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10564, 1, 4}) ->
    #{next_id => 10574, need_lev => 70, next_lev => 70,
      need_coin => 0,
      need_item => [{20538, 1}, {20313, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{20538, 1}, {20313, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10371, 1, 4}) ->
    #{next_id => 10381, need_lev => 80, next_lev => 80,
      need_coin => 0,
      need_item => [{20543, 1}, {20314, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{20543, 1}, {20314, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10372, 1, 4}) ->
    #{next_id => 10382, need_lev => 80, next_lev => 80,
      need_coin => 0,
      need_item => [{20543, 1}, {20324, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{20543, 1}, {20324, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10373, 1, 4}) ->
    #{next_id => 10383, need_lev => 80, next_lev => 80,
      need_coin => 0,
      need_item => [{20543, 1}, {20324, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{20543, 1}, {20324, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10374, 1, 4}) ->
    #{next_id => 10384, need_lev => 80, next_lev => 80,
      need_coin => 0,
      need_item => [{20543, 1}, {20324, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{20543, 1}, {20324, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10376, 1, 4}) ->
    #{next_id => 10386, need_lev => 80, next_lev => 80,
      need_coin => 0,
      need_item => [{20543, 1}, {20324, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{20543, 1}, {20324, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10571, 1, 4}) ->
    #{next_id => 10581, need_lev => 80, next_lev => 80,
      need_coin => 0,
      need_item => [{20543, 1}, {20314, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{20543, 1}, {20314, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10572, 1, 4}) ->
    #{next_id => 10582, need_lev => 80, next_lev => 80,
      need_coin => 0,
      need_item => [{20543, 1}, {20314, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{20543, 1}, {20314, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10574, 1, 4}) ->
    #{next_id => 10584, need_lev => 80, next_lev => 80,
      need_coin => 0,
      need_item => [{20543, 1}, {20314, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{20543, 1}, {20314, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10381, 1, 4}) ->
    #{next_id => 10391, need_lev => 90, next_lev => 90,
      need_coin => 0,
      need_item => [{20558, 1}, {20315, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{20558, 1}, {20315, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10382, 1, 4}) ->
    #{next_id => 10392, need_lev => 90, next_lev => 90,
      need_coin => 0,
      need_item => [{20558, 1}, {20325, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{20558, 1}, {20325, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10383, 1, 4}) ->
    #{next_id => 10393, need_lev => 90, next_lev => 90,
      need_coin => 0,
      need_item => [{20558, 1}, {20325, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{20558, 1}, {20325, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10384, 1, 4}) ->
    #{next_id => 10394, need_lev => 90, next_lev => 90,
      need_coin => 0,
      need_item => [{20558, 1}, {20325, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{20558, 1}, {20325, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10386, 1, 4}) ->
    #{next_id => 10396, need_lev => 90, next_lev => 90,
      need_coin => 0,
      need_item => [{20558, 1}, {20325, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{20558, 1}, {20325, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10581, 1, 4}) ->
    #{next_id => 10591, need_lev => 90, next_lev => 90,
      need_coin => 0,
      need_item => [{20558, 1}, {20315, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{20558, 1}, {20315, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10582, 1, 4}) ->
    #{next_id => 10592, need_lev => 90, next_lev => 90,
      need_coin => 0,
      need_item => [{20558, 1}, {20315, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{20558, 1}, {20315, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10584, 1, 4}) ->
    #{next_id => 10594, need_lev => 90, next_lev => 90,
      need_coin => 0,
      need_item => [{20558, 1}, {20315, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{20558, 1}, {20315, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10431, 1, 5}) ->
    #{next_id => 10441, need_lev => 40, next_lev => 40,
      need_coin => 0,
      need_item => [{20524, 1}, {20310, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{20524, 1}, {20310, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10432, 1, 5}) ->
    #{next_id => 10442, need_lev => 40, next_lev => 40,
      need_coin => 0,
      need_item => [{20524, 1}, {20320, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{20524, 1}, {20320, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10433, 1, 5}) ->
    #{next_id => 10443, need_lev => 40, next_lev => 40,
      need_coin => 0,
      need_item => [{20524, 1}, {20320, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{20524, 1}, {20320, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10434, 1, 5}) ->
    #{next_id => 10444, need_lev => 40, next_lev => 40,
      need_coin => 0,
      need_item => [{20524, 1}, {20320, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{20524, 1}, {20320, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10436, 1, 5}) ->
    #{next_id => 10446, need_lev => 40, next_lev => 40,
      need_coin => 0,
      need_item => [{20524, 1}, {20320, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{20524, 1}, {20320, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10531, 1, 5}) ->
    #{next_id => 10541, need_lev => 40, next_lev => 40,
      need_coin => 0,
      need_item => [{20524, 1}, {20310, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{20524, 1}, {20310, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10532, 1, 5}) ->
    #{next_id => 10542, need_lev => 40, next_lev => 40,
      need_coin => 0,
      need_item => [{20524, 1}, {20310, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{20524, 1}, {20310, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10534, 1, 5}) ->
    #{next_id => 10544, need_lev => 40, next_lev => 40,
      need_coin => 0,
      need_item => [{20524, 1}, {20310, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{20524, 1}, {20310, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10441, 1, 5}) ->
    #{next_id => 10451, need_lev => 50, next_lev => 50,
      need_coin => 0,
      need_item => [{20529, 1}, {20311, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{20529, 1}, {20311, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10442, 1, 5}) ->
    #{next_id => 10452, need_lev => 50, next_lev => 50,
      need_coin => 0,
      need_item => [{20529, 1}, {20321, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{20529, 1}, {20321, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10443, 1, 5}) ->
    #{next_id => 10453, need_lev => 50, next_lev => 50,
      need_coin => 0,
      need_item => [{20529, 1}, {20321, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{20529, 1}, {20321, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10444, 1, 5}) ->
    #{next_id => 10454, need_lev => 50, next_lev => 50,
      need_coin => 0,
      need_item => [{20529, 1}, {20321, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{20529, 1}, {20321, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10446, 1, 5}) ->
    #{next_id => 10456, need_lev => 50, next_lev => 50,
      need_coin => 0,
      need_item => [{20529, 1}, {20321, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{20529, 1}, {20321, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10541, 1, 5}) ->
    #{next_id => 10551, need_lev => 50, next_lev => 50,
      need_coin => 0,
      need_item => [{20529, 1}, {20311, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{20529, 1}, {20311, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10542, 1, 5}) ->
    #{next_id => 10552, need_lev => 50, next_lev => 50,
      need_coin => 0,
      need_item => [{20529, 1}, {20311, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{20529, 1}, {20311, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10544, 1, 5}) ->
    #{next_id => 10554, need_lev => 50, next_lev => 50,
      need_coin => 0,
      need_item => [{20529, 1}, {20311, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{20529, 1}, {20311, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10451, 1, 5}) ->
    #{next_id => 10461, need_lev => 60, next_lev => 60,
      need_coin => 0,
      need_item => [{20534, 1}, {20312, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{20534, 1}, {20312, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10452, 1, 5}) ->
    #{next_id => 10462, need_lev => 60, next_lev => 60,
      need_coin => 0,
      need_item => [{20534, 1}, {20322, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{20534, 1}, {20322, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10453, 1, 5}) ->
    #{next_id => 10463, need_lev => 60, next_lev => 60,
      need_coin => 0,
      need_item => [{20534, 1}, {20322, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{20534, 1}, {20322, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10454, 1, 5}) ->
    #{next_id => 10464, need_lev => 60, next_lev => 60,
      need_coin => 0,
      need_item => [{20534, 1}, {20322, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{20534, 1}, {20322, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10456, 1, 5}) ->
    #{next_id => 10466, need_lev => 60, next_lev => 60,
      need_coin => 0,
      need_item => [{20534, 1}, {20322, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{20534, 1}, {20322, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10551, 1, 5}) ->
    #{next_id => 10561, need_lev => 60, next_lev => 60,
      need_coin => 0,
      need_item => [{20534, 1}, {20312, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{20534, 1}, {20312, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10552, 1, 5}) ->
    #{next_id => 10562, need_lev => 60, next_lev => 60,
      need_coin => 0,
      need_item => [{20534, 1}, {20312, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{20534, 1}, {20312, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10554, 1, 5}) ->
    #{next_id => 10564, need_lev => 60, next_lev => 60,
      need_coin => 0,
      need_item => [{20534, 1}, {20312, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{20534, 1}, {20312, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10461, 1, 5}) ->
    #{next_id => 10471, need_lev => 70, next_lev => 70,
      need_coin => 0,
      need_item => [{20539, 1}, {20313, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{20539, 1}, {20313, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10462, 1, 5}) ->
    #{next_id => 10472, need_lev => 70, next_lev => 70,
      need_coin => 0,
      need_item => [{20539, 1}, {20323, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{20539, 1}, {20323, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10463, 1, 5}) ->
    #{next_id => 10473, need_lev => 70, next_lev => 70,
      need_coin => 0,
      need_item => [{20539, 1}, {20323, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{20539, 1}, {20323, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10464, 1, 5}) ->
    #{next_id => 10474, need_lev => 70, next_lev => 70,
      need_coin => 0,
      need_item => [{20539, 1}, {20323, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{20539, 1}, {20323, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10466, 1, 5}) ->
    #{next_id => 10476, need_lev => 70, next_lev => 70,
      need_coin => 0,
      need_item => [{20539, 1}, {20323, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{20539, 1}, {20323, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10561, 1, 5}) ->
    #{next_id => 10571, need_lev => 70, next_lev => 70,
      need_coin => 0,
      need_item => [{20539, 1}, {20313, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{20539, 1}, {20313, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10562, 1, 5}) ->
    #{next_id => 10572, need_lev => 70, next_lev => 70,
      need_coin => 0,
      need_item => [{20539, 1}, {20313, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{20539, 1}, {20313, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10564, 1, 5}) ->
    #{next_id => 10574, need_lev => 70, next_lev => 70,
      need_coin => 0,
      need_item => [{20539, 1}, {20313, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{20539, 1}, {20313, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10471, 1, 5}) ->
    #{next_id => 10481, need_lev => 80, next_lev => 80,
      need_coin => 0,
      need_item => [{20544, 1}, {20314, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{20544, 1}, {20314, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10472, 1, 5}) ->
    #{next_id => 10482, need_lev => 80, next_lev => 80,
      need_coin => 0,
      need_item => [{20544, 1}, {20324, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{20544, 1}, {20324, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10473, 1, 5}) ->
    #{next_id => 10483, need_lev => 80, next_lev => 80,
      need_coin => 0,
      need_item => [{20544, 1}, {20324, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{20544, 1}, {20324, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10474, 1, 5}) ->
    #{next_id => 10484, need_lev => 80, next_lev => 80,
      need_coin => 0,
      need_item => [{20544, 1}, {20324, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{20544, 1}, {20324, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10476, 1, 5}) ->
    #{next_id => 10486, need_lev => 80, next_lev => 80,
      need_coin => 0,
      need_item => [{20544, 1}, {20324, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{20544, 1}, {20324, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10571, 1, 5}) ->
    #{next_id => 10581, need_lev => 80, next_lev => 80,
      need_coin => 0,
      need_item => [{20544, 1}, {20314, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{20544, 1}, {20314, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10572, 1, 5}) ->
    #{next_id => 10582, need_lev => 80, next_lev => 80,
      need_coin => 0,
      need_item => [{20544, 1}, {20314, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{20544, 1}, {20314, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10574, 1, 5}) ->
    #{next_id => 10584, need_lev => 80, next_lev => 80,
      need_coin => 0,
      need_item => [{20544, 1}, {20314, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{20544, 1}, {20314, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10481, 1, 5}) ->
    #{next_id => 10491, need_lev => 90, next_lev => 90,
      need_coin => 0,
      need_item => [{20559, 1}, {20315, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{20559, 1}, {20315, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10482, 1, 5}) ->
    #{next_id => 10492, need_lev => 90, next_lev => 90,
      need_coin => 0,
      need_item => [{20559, 1}, {20325, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{20559, 1}, {20325, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10483, 1, 5}) ->
    #{next_id => 10493, need_lev => 90, next_lev => 90,
      need_coin => 0,
      need_item => [{20559, 1}, {20325, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{20559, 1}, {20325, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10484, 1, 5}) ->
    #{next_id => 10494, need_lev => 90, next_lev => 90,
      need_coin => 0,
      need_item => [{20559, 1}, {20325, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{20559, 1}, {20325, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10486, 1, 5}) ->
    #{next_id => 10496, need_lev => 90, next_lev => 90,
      need_coin => 0,
      need_item => [{20559, 1}, {20325, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{20559, 1}, {20325, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10581, 1, 5}) ->
    #{next_id => 10591, need_lev => 90, next_lev => 90,
      need_coin => 0,
      need_item => [{20559, 1}, {20315, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{20559, 1}, {20315, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10582, 1, 5}) ->
    #{next_id => 10592, need_lev => 90, next_lev => 90,
      need_coin => 0,
      need_item => [{20559, 1}, {20315, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{20559, 1}, {20315, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10584, 1, 5}) ->
    #{next_id => 10594, need_lev => 90, next_lev => 90,
      need_coin => 0,
      need_item => [{20559, 1}, {20315, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{20559, 1}, {20315, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10031, 0, 1}) ->
    #{next_id => 10041, need_lev => 40, next_lev => 40,
      need_coin => 0,
      need_item => [{23520, 1}, {20310, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{23520, 1}, {20310, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10032, 0, 1}) ->
    #{next_id => 10042, need_lev => 40, next_lev => 40,
      need_coin => 0,
      need_item => [{23520, 1}, {20320, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{23520, 1}, {20320, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10033, 0, 1}) ->
    #{next_id => 10043, need_lev => 40, next_lev => 40,
      need_coin => 0,
      need_item => [{23520, 1}, {20320, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{23520, 1}, {20320, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10034, 0, 1}) ->
    #{next_id => 10044, need_lev => 40, next_lev => 40,
      need_coin => 0,
      need_item => [{23520, 1}, {20320, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{23520, 1}, {20320, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10036, 0, 1}) ->
    #{next_id => 10046, need_lev => 40, next_lev => 40,
      need_coin => 0,
      need_item => [{23520, 1}, {20320, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{23520, 1}, {20320, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10531, 0, 1}) ->
    #{next_id => 10541, need_lev => 40, next_lev => 40,
      need_coin => 0,
      need_item => [{23520, 1}, {20310, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{23520, 1}, {20310, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10532, 0, 1}) ->
    #{next_id => 10542, need_lev => 40, next_lev => 40,
      need_coin => 0,
      need_item => [{23520, 1}, {20310, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{23520, 1}, {20310, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10534, 0, 1}) ->
    #{next_id => 10544, need_lev => 40, next_lev => 40,
      need_coin => 0,
      need_item => [{23520, 1}, {20310, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{23520, 1}, {20310, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10041, 0, 1}) ->
    #{next_id => 10051, need_lev => 50, next_lev => 50,
      need_coin => 0,
      need_item => [{23525, 1}, {20311, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{23525, 1}, {20311, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10042, 0, 1}) ->
    #{next_id => 10052, need_lev => 50, next_lev => 50,
      need_coin => 0,
      need_item => [{23525, 1}, {20321, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{23525, 1}, {20321, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10043, 0, 1}) ->
    #{next_id => 10053, need_lev => 50, next_lev => 50,
      need_coin => 0,
      need_item => [{23525, 1}, {20321, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{23525, 1}, {20321, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10044, 0, 1}) ->
    #{next_id => 10054, need_lev => 50, next_lev => 50,
      need_coin => 0,
      need_item => [{23525, 1}, {20321, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{23525, 1}, {20321, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10046, 0, 1}) ->
    #{next_id => 10056, need_lev => 50, next_lev => 50,
      need_coin => 0,
      need_item => [{23525, 1}, {20321, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{23525, 1}, {20321, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10541, 0, 1}) ->
    #{next_id => 10551, need_lev => 50, next_lev => 50,
      need_coin => 0,
      need_item => [{23525, 1}, {20311, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{23525, 1}, {20311, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10542, 0, 1}) ->
    #{next_id => 10552, need_lev => 50, next_lev => 50,
      need_coin => 0,
      need_item => [{23525, 1}, {20311, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{23525, 1}, {20311, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10544, 0, 1}) ->
    #{next_id => 10554, need_lev => 50, next_lev => 50,
      need_coin => 0,
      need_item => [{23525, 1}, {20311, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{23525, 1}, {20311, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10051, 0, 1}) ->
    #{next_id => 10061, need_lev => 60, next_lev => 60,
      need_coin => 0,
      need_item => [{23530, 1}, {20312, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{23530, 1}, {20312, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10052, 0, 1}) ->
    #{next_id => 10062, need_lev => 60, next_lev => 60,
      need_coin => 0,
      need_item => [{23530, 1}, {20322, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{23530, 1}, {20322, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10053, 0, 1}) ->
    #{next_id => 10063, need_lev => 60, next_lev => 60,
      need_coin => 0,
      need_item => [{23530, 1}, {20322, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{23530, 1}, {20322, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10054, 0, 1}) ->
    #{next_id => 10064, need_lev => 60, next_lev => 60,
      need_coin => 0,
      need_item => [{23530, 1}, {20322, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{23530, 1}, {20322, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10056, 0, 1}) ->
    #{next_id => 10066, need_lev => 60, next_lev => 60,
      need_coin => 0,
      need_item => [{23530, 1}, {20322, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{23530, 1}, {20322, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10551, 0, 1}) ->
    #{next_id => 10561, need_lev => 60, next_lev => 60,
      need_coin => 0,
      need_item => [{23530, 1}, {20312, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{23530, 1}, {20312, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10552, 0, 1}) ->
    #{next_id => 10562, need_lev => 60, next_lev => 60,
      need_coin => 0,
      need_item => [{23530, 1}, {20312, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{23530, 1}, {20312, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10554, 0, 1}) ->
    #{next_id => 10564, need_lev => 60, next_lev => 60,
      need_coin => 0,
      need_item => [{23530, 1}, {20312, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{23530, 1}, {20312, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10061, 0, 1}) ->
    #{next_id => 10071, need_lev => 70, next_lev => 70,
      need_coin => 0,
      need_item => [{23535, 1}, {20313, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{23535, 1}, {20313, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10062, 0, 1}) ->
    #{next_id => 10072, need_lev => 70, next_lev => 70,
      need_coin => 0,
      need_item => [{23535, 1}, {20323, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{23535, 1}, {20323, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10063, 0, 1}) ->
    #{next_id => 10073, need_lev => 70, next_lev => 70,
      need_coin => 0,
      need_item => [{23535, 1}, {20323, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{23535, 1}, {20323, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10064, 0, 1}) ->
    #{next_id => 10074, need_lev => 70, next_lev => 70,
      need_coin => 0,
      need_item => [{23535, 1}, {20323, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{23535, 1}, {20323, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10066, 0, 1}) ->
    #{next_id => 10076, need_lev => 70, next_lev => 70,
      need_coin => 0,
      need_item => [{23535, 1}, {20323, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{23535, 1}, {20323, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10561, 0, 1}) ->
    #{next_id => 10571, need_lev => 70, next_lev => 70,
      need_coin => 0,
      need_item => [{23535, 1}, {20313, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{23535, 1}, {20313, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10562, 0, 1}) ->
    #{next_id => 10572, need_lev => 70, next_lev => 70,
      need_coin => 0,
      need_item => [{23535, 1}, {20313, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{23535, 1}, {20313, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10564, 0, 1}) ->
    #{next_id => 10574, need_lev => 70, next_lev => 70,
      need_coin => 0,
      need_item => [{23535, 1}, {20313, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{23535, 1}, {20313, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10071, 0, 1}) ->
    #{next_id => 10081, need_lev => 80, next_lev => 80,
      need_coin => 0,
      need_item => [{23540, 1}, {20314, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{23540, 1}, {20314, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10072, 0, 1}) ->
    #{next_id => 10082, need_lev => 80, next_lev => 80,
      need_coin => 0,
      need_item => [{23540, 1}, {20324, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{23540, 1}, {20324, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10073, 0, 1}) ->
    #{next_id => 10083, need_lev => 80, next_lev => 80,
      need_coin => 0,
      need_item => [{23540, 1}, {20324, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{23540, 1}, {20324, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10074, 0, 1}) ->
    #{next_id => 10084, need_lev => 80, next_lev => 80,
      need_coin => 0,
      need_item => [{23540, 1}, {20324, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{23540, 1}, {20324, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10076, 0, 1}) ->
    #{next_id => 10086, need_lev => 80, next_lev => 80,
      need_coin => 0,
      need_item => [{23540, 1}, {20324, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{23540, 1}, {20324, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10571, 0, 1}) ->
    #{next_id => 10581, need_lev => 80, next_lev => 80,
      need_coin => 0,
      need_item => [{23540, 1}, {20314, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{23540, 1}, {20314, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10572, 0, 1}) ->
    #{next_id => 10582, need_lev => 80, next_lev => 80,
      need_coin => 0,
      need_item => [{23540, 1}, {20314, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{23540, 1}, {20314, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10574, 0, 1}) ->
    #{next_id => 10584, need_lev => 80, next_lev => 80,
      need_coin => 0,
      need_item => [{23540, 1}, {20314, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{23540, 1}, {20314, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10081, 0, 1}) ->
    #{next_id => 10091, need_lev => 90, next_lev => 90,
      need_coin => 0,
      need_item => [{23545, 1}, {20315, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{23545, 1}, {20315, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10082, 0, 1}) ->
    #{next_id => 10092, need_lev => 90, next_lev => 90,
      need_coin => 0,
      need_item => [{23545, 1}, {20325, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{23545, 1}, {20325, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10083, 0, 1}) ->
    #{next_id => 10093, need_lev => 90, next_lev => 90,
      need_coin => 0,
      need_item => [{23545, 1}, {20325, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{23545, 1}, {20325, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10084, 0, 1}) ->
    #{next_id => 10094, need_lev => 90, next_lev => 90,
      need_coin => 0,
      need_item => [{23545, 1}, {20325, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{23545, 1}, {20325, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10086, 0, 1}) ->
    #{next_id => 10096, need_lev => 90, next_lev => 90,
      need_coin => 0,
      need_item => [{23545, 1}, {20325, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{23545, 1}, {20325, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10581, 0, 1}) ->
    #{next_id => 10591, need_lev => 90, next_lev => 90,
      need_coin => 0,
      need_item => [{23545, 1}, {20315, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{23545, 1}, {20315, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10582, 0, 1}) ->
    #{next_id => 10592, need_lev => 90, next_lev => 90,
      need_coin => 0,
      need_item => [{23545, 1}, {20315, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{23545, 1}, {20315, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10584, 0, 1}) ->
    #{next_id => 10594, need_lev => 90, next_lev => 90,
      need_coin => 0,
      need_item => [{23545, 1}, {20315, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{23545, 1}, {20315, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10131, 0, 2}) ->
    #{next_id => 10141, need_lev => 40, next_lev => 40,
      need_coin => 0,
      need_item => [{23521, 1}, {20310, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{23521, 1}, {20310, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10132, 0, 2}) ->
    #{next_id => 10142, need_lev => 40, next_lev => 40,
      need_coin => 0,
      need_item => [{23521, 1}, {20320, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{23521, 1}, {20320, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10133, 0, 2}) ->
    #{next_id => 10143, need_lev => 40, next_lev => 40,
      need_coin => 0,
      need_item => [{23521, 1}, {20320, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{23521, 1}, {20320, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10134, 0, 2}) ->
    #{next_id => 10144, need_lev => 40, next_lev => 40,
      need_coin => 0,
      need_item => [{23521, 1}, {20320, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{23521, 1}, {20320, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10136, 0, 2}) ->
    #{next_id => 10146, need_lev => 40, next_lev => 40,
      need_coin => 0,
      need_item => [{23521, 1}, {20320, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{23521, 1}, {20320, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10531, 0, 2}) ->
    #{next_id => 10541, need_lev => 40, next_lev => 40,
      need_coin => 0,
      need_item => [{23521, 1}, {20310, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{23521, 1}, {20310, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10532, 0, 2}) ->
    #{next_id => 10542, need_lev => 40, next_lev => 40,
      need_coin => 0,
      need_item => [{23521, 1}, {20310, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{23521, 1}, {20310, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10534, 0, 2}) ->
    #{next_id => 10544, need_lev => 40, next_lev => 40,
      need_coin => 0,
      need_item => [{23521, 1}, {20310, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{23521, 1}, {20310, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10141, 0, 2}) ->
    #{next_id => 10151, need_lev => 50, next_lev => 50,
      need_coin => 0,
      need_item => [{23526, 1}, {20311, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{23526, 1}, {20311, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10142, 0, 2}) ->
    #{next_id => 10152, need_lev => 50, next_lev => 50,
      need_coin => 0,
      need_item => [{23526, 1}, {20321, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{23526, 1}, {20321, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10143, 0, 2}) ->
    #{next_id => 10153, need_lev => 50, next_lev => 50,
      need_coin => 0,
      need_item => [{23526, 1}, {20321, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{23526, 1}, {20321, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10144, 0, 2}) ->
    #{next_id => 10154, need_lev => 50, next_lev => 50,
      need_coin => 0,
      need_item => [{23526, 1}, {20321, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{23526, 1}, {20321, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10146, 0, 2}) ->
    #{next_id => 10156, need_lev => 50, next_lev => 50,
      need_coin => 0,
      need_item => [{23526, 1}, {20321, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{23526, 1}, {20321, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10541, 0, 2}) ->
    #{next_id => 10551, need_lev => 50, next_lev => 50,
      need_coin => 0,
      need_item => [{23526, 1}, {20311, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{23526, 1}, {20311, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10542, 0, 2}) ->
    #{next_id => 10552, need_lev => 50, next_lev => 50,
      need_coin => 0,
      need_item => [{23526, 1}, {20311, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{23526, 1}, {20311, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10544, 0, 2}) ->
    #{next_id => 10554, need_lev => 50, next_lev => 50,
      need_coin => 0,
      need_item => [{23526, 1}, {20311, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{23526, 1}, {20311, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10151, 0, 2}) ->
    #{next_id => 10161, need_lev => 60, next_lev => 60,
      need_coin => 0,
      need_item => [{23531, 1}, {20312, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{23531, 1}, {20312, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10152, 0, 2}) ->
    #{next_id => 10162, need_lev => 60, next_lev => 60,
      need_coin => 0,
      need_item => [{23531, 1}, {20322, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{23531, 1}, {20322, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10153, 0, 2}) ->
    #{next_id => 10163, need_lev => 60, next_lev => 60,
      need_coin => 0,
      need_item => [{23531, 1}, {20322, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{23531, 1}, {20322, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10154, 0, 2}) ->
    #{next_id => 10164, need_lev => 60, next_lev => 60,
      need_coin => 0,
      need_item => [{23531, 1}, {20322, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{23531, 1}, {20322, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10156, 0, 2}) ->
    #{next_id => 10166, need_lev => 60, next_lev => 60,
      need_coin => 0,
      need_item => [{23531, 1}, {20322, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{23531, 1}, {20322, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10551, 0, 2}) ->
    #{next_id => 10561, need_lev => 60, next_lev => 60,
      need_coin => 0,
      need_item => [{23531, 1}, {20312, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{23531, 1}, {20312, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10552, 0, 2}) ->
    #{next_id => 10562, need_lev => 60, next_lev => 60,
      need_coin => 0,
      need_item => [{23531, 1}, {20312, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{23531, 1}, {20312, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10554, 0, 2}) ->
    #{next_id => 10564, need_lev => 60, next_lev => 60,
      need_coin => 0,
      need_item => [{23531, 1}, {20312, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{23531, 1}, {20312, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10161, 0, 2}) ->
    #{next_id => 10171, need_lev => 70, next_lev => 70,
      need_coin => 0,
      need_item => [{23536, 1}, {20313, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{23536, 1}, {20313, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10162, 0, 2}) ->
    #{next_id => 10172, need_lev => 70, next_lev => 70,
      need_coin => 0,
      need_item => [{23536, 1}, {20323, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{23536, 1}, {20323, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10163, 0, 2}) ->
    #{next_id => 10173, need_lev => 70, next_lev => 70,
      need_coin => 0,
      need_item => [{23536, 1}, {20323, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{23536, 1}, {20323, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10164, 0, 2}) ->
    #{next_id => 10174, need_lev => 70, next_lev => 70,
      need_coin => 0,
      need_item => [{23536, 1}, {20323, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{23536, 1}, {20323, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10166, 0, 2}) ->
    #{next_id => 10176, need_lev => 70, next_lev => 70,
      need_coin => 0,
      need_item => [{23536, 1}, {20323, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{23536, 1}, {20323, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10561, 0, 2}) ->
    #{next_id => 10571, need_lev => 70, next_lev => 70,
      need_coin => 0,
      need_item => [{23536, 1}, {20313, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{23536, 1}, {20313, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10562, 0, 2}) ->
    #{next_id => 10572, need_lev => 70, next_lev => 70,
      need_coin => 0,
      need_item => [{23536, 1}, {20313, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{23536, 1}, {20313, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10564, 0, 2}) ->
    #{next_id => 10574, need_lev => 70, next_lev => 70,
      need_coin => 0,
      need_item => [{23536, 1}, {20313, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{23536, 1}, {20313, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10171, 0, 2}) ->
    #{next_id => 10181, need_lev => 80, next_lev => 80,
      need_coin => 0,
      need_item => [{23541, 1}, {20314, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{23541, 1}, {20314, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10172, 0, 2}) ->
    #{next_id => 10182, need_lev => 80, next_lev => 80,
      need_coin => 0,
      need_item => [{23541, 1}, {20324, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{23541, 1}, {20324, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10173, 0, 2}) ->
    #{next_id => 10183, need_lev => 80, next_lev => 80,
      need_coin => 0,
      need_item => [{23541, 1}, {20324, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{23541, 1}, {20324, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10174, 0, 2}) ->
    #{next_id => 10184, need_lev => 80, next_lev => 80,
      need_coin => 0,
      need_item => [{23541, 1}, {20324, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{23541, 1}, {20324, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10176, 0, 2}) ->
    #{next_id => 10186, need_lev => 80, next_lev => 80,
      need_coin => 0,
      need_item => [{23541, 1}, {20324, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{23541, 1}, {20324, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10571, 0, 2}) ->
    #{next_id => 10581, need_lev => 80, next_lev => 80,
      need_coin => 0,
      need_item => [{23541, 1}, {20314, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{23541, 1}, {20314, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10572, 0, 2}) ->
    #{next_id => 10582, need_lev => 80, next_lev => 80,
      need_coin => 0,
      need_item => [{23541, 1}, {20314, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{23541, 1}, {20314, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10574, 0, 2}) ->
    #{next_id => 10584, need_lev => 80, next_lev => 80,
      need_coin => 0,
      need_item => [{23541, 1}, {20314, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{23541, 1}, {20314, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10181, 0, 2}) ->
    #{next_id => 10191, need_lev => 90, next_lev => 90,
      need_coin => 0,
      need_item => [{23546, 1}, {20315, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{23546, 1}, {20315, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10182, 0, 2}) ->
    #{next_id => 10192, need_lev => 90, next_lev => 90,
      need_coin => 0,
      need_item => [{23546, 1}, {20325, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{23546, 1}, {20325, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10183, 0, 2}) ->
    #{next_id => 10193, need_lev => 90, next_lev => 90,
      need_coin => 0,
      need_item => [{23546, 1}, {20325, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{23546, 1}, {20325, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10184, 0, 2}) ->
    #{next_id => 10194, need_lev => 90, next_lev => 90,
      need_coin => 0,
      need_item => [{23546, 1}, {20325, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{23546, 1}, {20325, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10186, 0, 2}) ->
    #{next_id => 10196, need_lev => 90, next_lev => 90,
      need_coin => 0,
      need_item => [{23546, 1}, {20325, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{23546, 1}, {20325, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10581, 0, 2}) ->
    #{next_id => 10591, need_lev => 90, next_lev => 90,
      need_coin => 0,
      need_item => [{23546, 1}, {20315, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{23546, 1}, {20315, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10582, 0, 2}) ->
    #{next_id => 10592, need_lev => 90, next_lev => 90,
      need_coin => 0,
      need_item => [{23546, 1}, {20315, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{23546, 1}, {20315, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10584, 0, 2}) ->
    #{next_id => 10594, need_lev => 90, next_lev => 90,
      need_coin => 0,
      need_item => [{23546, 1}, {20315, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{23546, 1}, {20315, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10231, 0, 3}) ->
    #{next_id => 10241, need_lev => 40, next_lev => 40,
      need_coin => 0,
      need_item => [{23522, 1}, {20310, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{23522, 1}, {20310, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10232, 0, 3}) ->
    #{next_id => 10242, need_lev => 40, next_lev => 40,
      need_coin => 0,
      need_item => [{23522, 1}, {20320, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{23522, 1}, {20320, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10233, 0, 3}) ->
    #{next_id => 10243, need_lev => 40, next_lev => 40,
      need_coin => 0,
      need_item => [{23522, 1}, {20320, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{23522, 1}, {20320, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10234, 0, 3}) ->
    #{next_id => 10244, need_lev => 40, next_lev => 40,
      need_coin => 0,
      need_item => [{23522, 1}, {20320, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{23522, 1}, {20320, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10236, 0, 3}) ->
    #{next_id => 10246, need_lev => 40, next_lev => 40,
      need_coin => 0,
      need_item => [{23522, 1}, {20320, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{23522, 1}, {20320, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10531, 0, 3}) ->
    #{next_id => 10541, need_lev => 40, next_lev => 40,
      need_coin => 0,
      need_item => [{23522, 1}, {20310, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{23522, 1}, {20310, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10532, 0, 3}) ->
    #{next_id => 10542, need_lev => 40, next_lev => 40,
      need_coin => 0,
      need_item => [{23522, 1}, {20310, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{23522, 1}, {20310, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10534, 0, 3}) ->
    #{next_id => 10544, need_lev => 40, next_lev => 40,
      need_coin => 0,
      need_item => [{23522, 1}, {20310, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{23522, 1}, {20310, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10241, 0, 3}) ->
    #{next_id => 10251, need_lev => 50, next_lev => 50,
      need_coin => 0,
      need_item => [{23527, 1}, {20311, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{23527, 1}, {20311, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10242, 0, 3}) ->
    #{next_id => 10252, need_lev => 50, next_lev => 50,
      need_coin => 0,
      need_item => [{23527, 1}, {20321, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{23527, 1}, {20321, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10243, 0, 3}) ->
    #{next_id => 10253, need_lev => 50, next_lev => 50,
      need_coin => 0,
      need_item => [{23527, 1}, {20321, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{23527, 1}, {20321, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10244, 0, 3}) ->
    #{next_id => 10254, need_lev => 50, next_lev => 50,
      need_coin => 0,
      need_item => [{23527, 1}, {20321, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{23527, 1}, {20321, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10246, 0, 3}) ->
    #{next_id => 10256, need_lev => 50, next_lev => 50,
      need_coin => 0,
      need_item => [{23527, 1}, {20321, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{23527, 1}, {20321, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10541, 0, 3}) ->
    #{next_id => 10551, need_lev => 50, next_lev => 50,
      need_coin => 0,
      need_item => [{23527, 1}, {20311, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{23527, 1}, {20311, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10542, 0, 3}) ->
    #{next_id => 10552, need_lev => 50, next_lev => 50,
      need_coin => 0,
      need_item => [{23527, 1}, {20311, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{23527, 1}, {20311, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10544, 0, 3}) ->
    #{next_id => 10554, need_lev => 50, next_lev => 50,
      need_coin => 0,
      need_item => [{23527, 1}, {20311, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{23527, 1}, {20311, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10251, 0, 3}) ->
    #{next_id => 10261, need_lev => 60, next_lev => 60,
      need_coin => 0,
      need_item => [{23532, 1}, {20312, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{23532, 1}, {20312, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10252, 0, 3}) ->
    #{next_id => 10262, need_lev => 60, next_lev => 60,
      need_coin => 0,
      need_item => [{23532, 1}, {20322, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{23532, 1}, {20322, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10253, 0, 3}) ->
    #{next_id => 10263, need_lev => 60, next_lev => 60,
      need_coin => 0,
      need_item => [{23532, 1}, {20322, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{23532, 1}, {20322, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10254, 0, 3}) ->
    #{next_id => 10264, need_lev => 60, next_lev => 60,
      need_coin => 0,
      need_item => [{23532, 1}, {20322, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{23532, 1}, {20322, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10256, 0, 3}) ->
    #{next_id => 10266, need_lev => 60, next_lev => 60,
      need_coin => 0,
      need_item => [{23532, 1}, {20322, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{23532, 1}, {20322, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10551, 0, 3}) ->
    #{next_id => 10561, need_lev => 60, next_lev => 60,
      need_coin => 0,
      need_item => [{23532, 1}, {20312, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{23532, 1}, {20312, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10552, 0, 3}) ->
    #{next_id => 10562, need_lev => 60, next_lev => 60,
      need_coin => 0,
      need_item => [{23532, 1}, {20312, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{23532, 1}, {20312, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10554, 0, 3}) ->
    #{next_id => 10564, need_lev => 60, next_lev => 60,
      need_coin => 0,
      need_item => [{23532, 1}, {20312, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{23532, 1}, {20312, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10261, 0, 3}) ->
    #{next_id => 10271, need_lev => 70, next_lev => 70,
      need_coin => 0,
      need_item => [{23537, 1}, {20313, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{23537, 1}, {20313, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10262, 0, 3}) ->
    #{next_id => 10272, need_lev => 70, next_lev => 70,
      need_coin => 0,
      need_item => [{23537, 1}, {20323, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{23537, 1}, {20323, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10263, 0, 3}) ->
    #{next_id => 10273, need_lev => 70, next_lev => 70,
      need_coin => 0,
      need_item => [{23537, 1}, {20323, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{23537, 1}, {20323, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10264, 0, 3}) ->
    #{next_id => 10274, need_lev => 70, next_lev => 70,
      need_coin => 0,
      need_item => [{23537, 1}, {20323, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{23537, 1}, {20323, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10266, 0, 3}) ->
    #{next_id => 10276, need_lev => 70, next_lev => 70,
      need_coin => 0,
      need_item => [{23537, 1}, {20323, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{23537, 1}, {20323, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10561, 0, 3}) ->
    #{next_id => 10571, need_lev => 70, next_lev => 70,
      need_coin => 0,
      need_item => [{23537, 1}, {20313, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{23537, 1}, {20313, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10562, 0, 3}) ->
    #{next_id => 10572, need_lev => 70, next_lev => 70,
      need_coin => 0,
      need_item => [{23537, 1}, {20313, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{23537, 1}, {20313, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10564, 0, 3}) ->
    #{next_id => 10574, need_lev => 70, next_lev => 70,
      need_coin => 0,
      need_item => [{23537, 1}, {20313, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{23537, 1}, {20313, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10271, 0, 3}) ->
    #{next_id => 10281, need_lev => 80, next_lev => 80,
      need_coin => 0,
      need_item => [{23542, 1}, {20314, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{23542, 1}, {20314, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10272, 0, 3}) ->
    #{next_id => 10282, need_lev => 80, next_lev => 80,
      need_coin => 0,
      need_item => [{23542, 1}, {20324, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{23542, 1}, {20324, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10273, 0, 3}) ->
    #{next_id => 10283, need_lev => 80, next_lev => 80,
      need_coin => 0,
      need_item => [{23542, 1}, {20324, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{23542, 1}, {20324, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10274, 0, 3}) ->
    #{next_id => 10284, need_lev => 80, next_lev => 80,
      need_coin => 0,
      need_item => [{23542, 1}, {20324, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{23542, 1}, {20324, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10276, 0, 3}) ->
    #{next_id => 10286, need_lev => 80, next_lev => 80,
      need_coin => 0,
      need_item => [{23542, 1}, {20324, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{23542, 1}, {20324, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10571, 0, 3}) ->
    #{next_id => 10581, need_lev => 80, next_lev => 80,
      need_coin => 0,
      need_item => [{23542, 1}, {20314, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{23542, 1}, {20314, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10572, 0, 3}) ->
    #{next_id => 10582, need_lev => 80, next_lev => 80,
      need_coin => 0,
      need_item => [{23542, 1}, {20314, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{23542, 1}, {20314, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10574, 0, 3}) ->
    #{next_id => 10584, need_lev => 80, next_lev => 80,
      need_coin => 0,
      need_item => [{23542, 1}, {20314, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{23542, 1}, {20314, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10281, 0, 3}) ->
    #{next_id => 10291, need_lev => 90, next_lev => 90,
      need_coin => 0,
      need_item => [{23547, 1}, {20315, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{23547, 1}, {20315, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10282, 0, 3}) ->
    #{next_id => 10292, need_lev => 90, next_lev => 90,
      need_coin => 0,
      need_item => [{23547, 1}, {20325, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{23547, 1}, {20325, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10283, 0, 3}) ->
    #{next_id => 10293, need_lev => 90, next_lev => 90,
      need_coin => 0,
      need_item => [{23547, 1}, {20325, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{23547, 1}, {20325, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10284, 0, 3}) ->
    #{next_id => 10294, need_lev => 90, next_lev => 90,
      need_coin => 0,
      need_item => [{23547, 1}, {20325, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{23547, 1}, {20325, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10286, 0, 3}) ->
    #{next_id => 10296, need_lev => 90, next_lev => 90,
      need_coin => 0,
      need_item => [{23547, 1}, {20325, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{23547, 1}, {20325, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10581, 0, 3}) ->
    #{next_id => 10591, need_lev => 90, next_lev => 90,
      need_coin => 0,
      need_item => [{23547, 1}, {20315, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{23547, 1}, {20315, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10582, 0, 3}) ->
    #{next_id => 10592, need_lev => 90, next_lev => 90,
      need_coin => 0,
      need_item => [{23547, 1}, {20315, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{23547, 1}, {20315, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10584, 0, 3}) ->
    #{next_id => 10594, need_lev => 90, next_lev => 90,
      need_coin => 0,
      need_item => [{23547, 1}, {20315, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{23547, 1}, {20315, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10331, 0, 4}) ->
    #{next_id => 10341, need_lev => 40, next_lev => 40,
      need_coin => 0,
      need_item => [{23523, 1}, {20310, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{23523, 1}, {20310, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10332, 0, 4}) ->
    #{next_id => 10342, need_lev => 40, next_lev => 40,
      need_coin => 0,
      need_item => [{23523, 1}, {20320, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{23523, 1}, {20320, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10333, 0, 4}) ->
    #{next_id => 10343, need_lev => 40, next_lev => 40,
      need_coin => 0,
      need_item => [{23523, 1}, {20320, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{23523, 1}, {20320, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10334, 0, 4}) ->
    #{next_id => 10344, need_lev => 40, next_lev => 40,
      need_coin => 0,
      need_item => [{23523, 1}, {20320, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{23523, 1}, {20320, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10336, 0, 4}) ->
    #{next_id => 10346, need_lev => 40, next_lev => 40,
      need_coin => 0,
      need_item => [{23523, 1}, {20320, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{23523, 1}, {20320, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10531, 0, 4}) ->
    #{next_id => 10541, need_lev => 40, next_lev => 40,
      need_coin => 0,
      need_item => [{23523, 1}, {20310, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{23523, 1}, {20310, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10532, 0, 4}) ->
    #{next_id => 10542, need_lev => 40, next_lev => 40,
      need_coin => 0,
      need_item => [{23523, 1}, {20310, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{23523, 1}, {20310, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10534, 0, 4}) ->
    #{next_id => 10544, need_lev => 40, next_lev => 40,
      need_coin => 0,
      need_item => [{23523, 1}, {20310, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{23523, 1}, {20310, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10341, 0, 4}) ->
    #{next_id => 10351, need_lev => 50, next_lev => 50,
      need_coin => 0,
      need_item => [{23528, 1}, {20311, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{23528, 1}, {20311, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10342, 0, 4}) ->
    #{next_id => 10352, need_lev => 50, next_lev => 50,
      need_coin => 0,
      need_item => [{23528, 1}, {20321, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{23528, 1}, {20321, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10343, 0, 4}) ->
    #{next_id => 10353, need_lev => 50, next_lev => 50,
      need_coin => 0,
      need_item => [{23528, 1}, {20321, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{23528, 1}, {20321, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10344, 0, 4}) ->
    #{next_id => 10354, need_lev => 50, next_lev => 50,
      need_coin => 0,
      need_item => [{23528, 1}, {20321, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{23528, 1}, {20321, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10346, 0, 4}) ->
    #{next_id => 10356, need_lev => 50, next_lev => 50,
      need_coin => 0,
      need_item => [{23528, 1}, {20321, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{23528, 1}, {20321, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10541, 0, 4}) ->
    #{next_id => 10551, need_lev => 50, next_lev => 50,
      need_coin => 0,
      need_item => [{23528, 1}, {20311, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{23528, 1}, {20311, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10542, 0, 4}) ->
    #{next_id => 10552, need_lev => 50, next_lev => 50,
      need_coin => 0,
      need_item => [{23528, 1}, {20311, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{23528, 1}, {20311, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10544, 0, 4}) ->
    #{next_id => 10554, need_lev => 50, next_lev => 50,
      need_coin => 0,
      need_item => [{23528, 1}, {20311, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{23528, 1}, {20311, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10351, 0, 4}) ->
    #{next_id => 10361, need_lev => 60, next_lev => 60,
      need_coin => 0,
      need_item => [{23533, 1}, {20312, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{23533, 1}, {20312, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10352, 0, 4}) ->
    #{next_id => 10362, need_lev => 60, next_lev => 60,
      need_coin => 0,
      need_item => [{23533, 1}, {20322, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{23533, 1}, {20322, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10353, 0, 4}) ->
    #{next_id => 10363, need_lev => 60, next_lev => 60,
      need_coin => 0,
      need_item => [{23533, 1}, {20322, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{23533, 1}, {20322, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10354, 0, 4}) ->
    #{next_id => 10364, need_lev => 60, next_lev => 60,
      need_coin => 0,
      need_item => [{23533, 1}, {20322, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{23533, 1}, {20322, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10356, 0, 4}) ->
    #{next_id => 10366, need_lev => 60, next_lev => 60,
      need_coin => 0,
      need_item => [{23533, 1}, {20322, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{23533, 1}, {20322, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10551, 0, 4}) ->
    #{next_id => 10561, need_lev => 60, next_lev => 60,
      need_coin => 0,
      need_item => [{23533, 1}, {20312, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{23533, 1}, {20312, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10552, 0, 4}) ->
    #{next_id => 10562, need_lev => 60, next_lev => 60,
      need_coin => 0,
      need_item => [{23533, 1}, {20312, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{23533, 1}, {20312, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10554, 0, 4}) ->
    #{next_id => 10564, need_lev => 60, next_lev => 60,
      need_coin => 0,
      need_item => [{23533, 1}, {20312, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{23533, 1}, {20312, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10361, 0, 4}) ->
    #{next_id => 10371, need_lev => 70, next_lev => 70,
      need_coin => 0,
      need_item => [{23538, 1}, {20313, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{23538, 1}, {20313, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10362, 0, 4}) ->
    #{next_id => 10372, need_lev => 70, next_lev => 70,
      need_coin => 0,
      need_item => [{23538, 1}, {20323, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{23538, 1}, {20323, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10363, 0, 4}) ->
    #{next_id => 10373, need_lev => 70, next_lev => 70,
      need_coin => 0,
      need_item => [{23538, 1}, {20323, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{23538, 1}, {20323, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10364, 0, 4}) ->
    #{next_id => 10374, need_lev => 70, next_lev => 70,
      need_coin => 0,
      need_item => [{23538, 1}, {20323, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{23538, 1}, {20323, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10366, 0, 4}) ->
    #{next_id => 10376, need_lev => 70, next_lev => 70,
      need_coin => 0,
      need_item => [{23538, 1}, {20323, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{23538, 1}, {20323, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10561, 0, 4}) ->
    #{next_id => 10571, need_lev => 70, next_lev => 70,
      need_coin => 0,
      need_item => [{23538, 1}, {20313, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{23538, 1}, {20313, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10562, 0, 4}) ->
    #{next_id => 10572, need_lev => 70, next_lev => 70,
      need_coin => 0,
      need_item => [{23538, 1}, {20313, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{23538, 1}, {20313, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10564, 0, 4}) ->
    #{next_id => 10574, need_lev => 70, next_lev => 70,
      need_coin => 0,
      need_item => [{23538, 1}, {20313, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{23538, 1}, {20313, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10371, 0, 4}) ->
    #{next_id => 10381, need_lev => 80, next_lev => 80,
      need_coin => 0,
      need_item => [{23543, 1}, {20314, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{23543, 1}, {20314, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10372, 0, 4}) ->
    #{next_id => 10382, need_lev => 80, next_lev => 80,
      need_coin => 0,
      need_item => [{23543, 1}, {20324, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{23543, 1}, {20324, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10373, 0, 4}) ->
    #{next_id => 10383, need_lev => 80, next_lev => 80,
      need_coin => 0,
      need_item => [{23543, 1}, {20324, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{23543, 1}, {20324, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10374, 0, 4}) ->
    #{next_id => 10384, need_lev => 80, next_lev => 80,
      need_coin => 0,
      need_item => [{23543, 1}, {20324, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{23543, 1}, {20324, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10376, 0, 4}) ->
    #{next_id => 10386, need_lev => 80, next_lev => 80,
      need_coin => 0,
      need_item => [{23543, 1}, {20324, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{23543, 1}, {20324, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10571, 0, 4}) ->
    #{next_id => 10581, need_lev => 80, next_lev => 80,
      need_coin => 0,
      need_item => [{23543, 1}, {20314, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{23543, 1}, {20314, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10572, 0, 4}) ->
    #{next_id => 10582, need_lev => 80, next_lev => 80,
      need_coin => 0,
      need_item => [{23543, 1}, {20314, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{23543, 1}, {20314, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10574, 0, 4}) ->
    #{next_id => 10584, need_lev => 80, next_lev => 80,
      need_coin => 0,
      need_item => [{23543, 1}, {20314, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{23543, 1}, {20314, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10381, 0, 4}) ->
    #{next_id => 10391, need_lev => 90, next_lev => 90,
      need_coin => 0,
      need_item => [{23548, 1}, {20315, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{23548, 1}, {20315, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10382, 0, 4}) ->
    #{next_id => 10392, need_lev => 90, next_lev => 90,
      need_coin => 0,
      need_item => [{23548, 1}, {20325, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{23548, 1}, {20325, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10383, 0, 4}) ->
    #{next_id => 10393, need_lev => 90, next_lev => 90,
      need_coin => 0,
      need_item => [{23548, 1}, {20325, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{23548, 1}, {20325, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10384, 0, 4}) ->
    #{next_id => 10394, need_lev => 90, next_lev => 90,
      need_coin => 0,
      need_item => [{23548, 1}, {20325, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{23548, 1}, {20325, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10386, 0, 4}) ->
    #{next_id => 10396, need_lev => 90, next_lev => 90,
      need_coin => 0,
      need_item => [{23548, 1}, {20325, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{23548, 1}, {20325, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10581, 0, 4}) ->
    #{next_id => 10591, need_lev => 90, next_lev => 90,
      need_coin => 0,
      need_item => [{23548, 1}, {20315, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{23548, 1}, {20315, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10582, 0, 4}) ->
    #{next_id => 10592, need_lev => 90, next_lev => 90,
      need_coin => 0,
      need_item => [{23548, 1}, {20315, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{23548, 1}, {20315, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10584, 0, 4}) ->
    #{next_id => 10594, need_lev => 90, next_lev => 90,
      need_coin => 0,
      need_item => [{23548, 1}, {20315, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{23548, 1}, {20315, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10431, 0, 5}) ->
    #{next_id => 10441, need_lev => 40, next_lev => 40,
      need_coin => 0,
      need_item => [{23524, 1}, {20310, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{23524, 1}, {20310, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10432, 0, 5}) ->
    #{next_id => 10442, need_lev => 40, next_lev => 40,
      need_coin => 0,
      need_item => [{23524, 1}, {20320, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{23524, 1}, {20320, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10433, 0, 5}) ->
    #{next_id => 10443, need_lev => 40, next_lev => 40,
      need_coin => 0,
      need_item => [{23524, 1}, {20320, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{23524, 1}, {20320, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10434, 0, 5}) ->
    #{next_id => 10444, need_lev => 40, next_lev => 40,
      need_coin => 0,
      need_item => [{23524, 1}, {20320, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{23524, 1}, {20320, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10436, 0, 5}) ->
    #{next_id => 10446, need_lev => 40, next_lev => 40,
      need_coin => 0,
      need_item => [{23524, 1}, {20320, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{23524, 1}, {20320, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10531, 0, 5}) ->
    #{next_id => 10541, need_lev => 40, next_lev => 40,
      need_coin => 0,
      need_item => [{23524, 1}, {20310, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{23524, 1}, {20310, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10532, 0, 5}) ->
    #{next_id => 10542, need_lev => 40, next_lev => 40,
      need_coin => 0,
      need_item => [{23524, 1}, {20310, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{23524, 1}, {20310, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10534, 0, 5}) ->
    #{next_id => 10544, need_lev => 40, next_lev => 40,
      need_coin => 0,
      need_item => [{23524, 1}, {20310, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{23524, 1}, {20310, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10441, 0, 5}) ->
    #{next_id => 10451, need_lev => 50, next_lev => 50,
      need_coin => 0,
      need_item => [{23529, 1}, {20311, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{23529, 1}, {20311, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10442, 0, 5}) ->
    #{next_id => 10452, need_lev => 50, next_lev => 50,
      need_coin => 0,
      need_item => [{23529, 1}, {20321, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{23529, 1}, {20321, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10443, 0, 5}) ->
    #{next_id => 10453, need_lev => 50, next_lev => 50,
      need_coin => 0,
      need_item => [{23529, 1}, {20321, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{23529, 1}, {20321, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10444, 0, 5}) ->
    #{next_id => 10454, need_lev => 50, next_lev => 50,
      need_coin => 0,
      need_item => [{23529, 1}, {20321, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{23529, 1}, {20321, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10446, 0, 5}) ->
    #{next_id => 10456, need_lev => 50, next_lev => 50,
      need_coin => 0,
      need_item => [{23529, 1}, {20321, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{23529, 1}, {20321, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10541, 0, 5}) ->
    #{next_id => 10551, need_lev => 50, next_lev => 50,
      need_coin => 0,
      need_item => [{23529, 1}, {20311, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{23529, 1}, {20311, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10542, 0, 5}) ->
    #{next_id => 10552, need_lev => 50, next_lev => 50,
      need_coin => 0,
      need_item => [{23529, 1}, {20311, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{23529, 1}, {20311, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10544, 0, 5}) ->
    #{next_id => 10554, need_lev => 50, next_lev => 50,
      need_coin => 0,
      need_item => [{23529, 1}, {20311, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{23529, 1}, {20311, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10451, 0, 5}) ->
    #{next_id => 10461, need_lev => 60, next_lev => 60,
      need_coin => 0,
      need_item => [{23534, 1}, {20312, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{23534, 1}, {20312, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10452, 0, 5}) ->
    #{next_id => 10462, need_lev => 60, next_lev => 60,
      need_coin => 0,
      need_item => [{23534, 1}, {20322, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{23534, 1}, {20322, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10453, 0, 5}) ->
    #{next_id => 10463, need_lev => 60, next_lev => 60,
      need_coin => 0,
      need_item => [{23534, 1}, {20322, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{23534, 1}, {20322, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10454, 0, 5}) ->
    #{next_id => 10464, need_lev => 60, next_lev => 60,
      need_coin => 0,
      need_item => [{23534, 1}, {20322, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{23534, 1}, {20322, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10456, 0, 5}) ->
    #{next_id => 10466, need_lev => 60, next_lev => 60,
      need_coin => 0,
      need_item => [{23534, 1}, {20322, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{23534, 1}, {20322, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10551, 0, 5}) ->
    #{next_id => 10561, need_lev => 60, next_lev => 60,
      need_coin => 0,
      need_item => [{23534, 1}, {20312, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{23534, 1}, {20312, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10552, 0, 5}) ->
    #{next_id => 10562, need_lev => 60, next_lev => 60,
      need_coin => 0,
      need_item => [{23534, 1}, {20312, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{23534, 1}, {20312, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10554, 0, 5}) ->
    #{next_id => 10564, need_lev => 60, next_lev => 60,
      need_coin => 0,
      need_item => [{23534, 1}, {20312, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{23534, 1}, {20312, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10461, 0, 5}) ->
    #{next_id => 10471, need_lev => 70, next_lev => 70,
      need_coin => 0,
      need_item => [{23539, 1}, {20313, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{23539, 1}, {20313, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10462, 0, 5}) ->
    #{next_id => 10472, need_lev => 70, next_lev => 70,
      need_coin => 0,
      need_item => [{23539, 1}, {20323, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{23539, 1}, {20323, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10463, 0, 5}) ->
    #{next_id => 10473, need_lev => 70, next_lev => 70,
      need_coin => 0,
      need_item => [{23539, 1}, {20323, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{23539, 1}, {20323, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10464, 0, 5}) ->
    #{next_id => 10474, need_lev => 70, next_lev => 70,
      need_coin => 0,
      need_item => [{23539, 1}, {20323, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{23539, 1}, {20323, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10466, 0, 5}) ->
    #{next_id => 10476, need_lev => 70, next_lev => 70,
      need_coin => 0,
      need_item => [{23539, 1}, {20323, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{23539, 1}, {20323, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10561, 0, 5}) ->
    #{next_id => 10571, need_lev => 70, next_lev => 70,
      need_coin => 0,
      need_item => [{23539, 1}, {20313, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{23539, 1}, {20313, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10562, 0, 5}) ->
    #{next_id => 10572, need_lev => 70, next_lev => 70,
      need_coin => 0,
      need_item => [{23539, 1}, {20313, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{23539, 1}, {20313, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10564, 0, 5}) ->
    #{next_id => 10574, need_lev => 70, next_lev => 70,
      need_coin => 0,
      need_item => [{23539, 1}, {20313, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{23539, 1}, {20313, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10471, 0, 5}) ->
    #{next_id => 10481, need_lev => 80, next_lev => 80,
      need_coin => 0,
      need_item => [{23544, 1}, {20314, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{23544, 1}, {20314, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10472, 0, 5}) ->
    #{next_id => 10482, need_lev => 80, next_lev => 80,
      need_coin => 0,
      need_item => [{23544, 1}, {20324, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{23544, 1}, {20324, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10473, 0, 5}) ->
    #{next_id => 10483, need_lev => 80, next_lev => 80,
      need_coin => 0,
      need_item => [{23544, 1}, {20324, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{23544, 1}, {20324, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10474, 0, 5}) ->
    #{next_id => 10484, need_lev => 80, next_lev => 80,
      need_coin => 0,
      need_item => [{23544, 1}, {20324, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{23544, 1}, {20324, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10476, 0, 5}) ->
    #{next_id => 10486, need_lev => 80, next_lev => 80,
      need_coin => 0,
      need_item => [{23544, 1}, {20324, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{23544, 1}, {20324, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10571, 0, 5}) ->
    #{next_id => 10581, need_lev => 80, next_lev => 80,
      need_coin => 0,
      need_item => [{23544, 1}, {20314, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{23544, 1}, {20314, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10572, 0, 5}) ->
    #{next_id => 10582, need_lev => 80, next_lev => 80,
      need_coin => 0,
      need_item => [{23544, 1}, {20314, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{23544, 1}, {20314, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10574, 0, 5}) ->
    #{next_id => 10584, need_lev => 80, next_lev => 80,
      need_coin => 0,
      need_item => [{23544, 1}, {20314, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{23544, 1}, {20314, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10481, 0, 5}) ->
    #{next_id => 10491, need_lev => 90, next_lev => 90,
      need_coin => 0,
      need_item => [{23549, 1}, {20315, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{23549, 1}, {20315, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10482, 0, 5}) ->
    #{next_id => 10492, need_lev => 90, next_lev => 90,
      need_coin => 0,
      need_item => [{23549, 1}, {20325, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{23549, 1}, {20325, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10483, 0, 5}) ->
    #{next_id => 10493, need_lev => 90, next_lev => 90,
      need_coin => 0,
      need_item => [{23549, 1}, {20325, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{23549, 1}, {20325, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10484, 0, 5}) ->
    #{next_id => 10494, need_lev => 90, next_lev => 90,
      need_coin => 0,
      need_item => [{23549, 1}, {20325, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{23549, 1}, {20325, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10486, 0, 5}) ->
    #{next_id => 10496, need_lev => 90, next_lev => 90,
      need_coin => 0,
      need_item => [{23549, 1}, {20325, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{23549, 1}, {20325, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10581, 0, 5}) ->
    #{next_id => 10591, need_lev => 90, next_lev => 90,
      need_coin => 0,
      need_item => [{23549, 1}, {20315, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{23549, 1}, {20315, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10582, 0, 5}) ->
    #{next_id => 10592, need_lev => 90, next_lev => 90,
      need_coin => 0,
      need_item => [{23549, 1}, {20315, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{23549, 1}, {20315, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10584, 0, 5}) ->
    #{next_id => 10594, need_lev => 90, next_lev => 90,
      need_coin => 0,
      need_item => [{23549, 1}, {20315, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{23549, 1}, {20315, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10631, 1, 6}) ->
    #{next_id => 10641, need_lev => 40, next_lev => 40,
      need_coin => 0,
      need_item => [{21850, 1}, {20310, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{21850, 1}, {20310, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10632, 1, 6}) ->
    #{next_id => 10642, need_lev => 40, next_lev => 40,
      need_coin => 0,
      need_item => [{21850, 1}, {20320, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{21850, 1}, {20320, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10633, 1, 6}) ->
    #{next_id => 10643, need_lev => 40, next_lev => 40,
      need_coin => 0,
      need_item => [{21850, 1}, {20320, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{21850, 1}, {20320, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10634, 1, 6}) ->
    #{next_id => 10644, need_lev => 40, next_lev => 40,
      need_coin => 0,
      need_item => [{21850, 1}, {20320, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{21850, 1}, {20320, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10636, 1, 6}) ->
    #{next_id => 10646, need_lev => 40, next_lev => 40,
      need_coin => 0,
      need_item => [{21850, 1}, {20320, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{21850, 1}, {20320, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10531, 1, 6}) ->
    #{next_id => 10541, need_lev => 40, next_lev => 40,
      need_coin => 0,
      need_item => [{21850, 1}, {20310, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{21850, 1}, {20310, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10532, 1, 6}) ->
    #{next_id => 10542, need_lev => 40, next_lev => 40,
      need_coin => 0,
      need_item => [{21850, 1}, {20310, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{21850, 1}, {20310, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10534, 1, 6}) ->
    #{next_id => 10544, need_lev => 40, next_lev => 40,
      need_coin => 0,
      need_item => [{21850, 1}, {20310, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{21850, 1}, {20310, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10641, 1, 6}) ->
    #{next_id => 10651, need_lev => 50, next_lev => 50,
      need_coin => 0,
      need_item => [{21852, 1}, {20311, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{21852, 1}, {20311, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10642, 1, 6}) ->
    #{next_id => 10652, need_lev => 50, next_lev => 50,
      need_coin => 0,
      need_item => [{21852, 1}, {20321, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{21852, 1}, {20321, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10643, 1, 6}) ->
    #{next_id => 10653, need_lev => 50, next_lev => 50,
      need_coin => 0,
      need_item => [{21852, 1}, {20321, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{21852, 1}, {20321, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10644, 1, 6}) ->
    #{next_id => 10654, need_lev => 50, next_lev => 50,
      need_coin => 0,
      need_item => [{21852, 1}, {20321, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{21852, 1}, {20321, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10646, 1, 6}) ->
    #{next_id => 10656, need_lev => 50, next_lev => 50,
      need_coin => 0,
      need_item => [{21852, 1}, {20321, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{21852, 1}, {20321, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10541, 1, 6}) ->
    #{next_id => 10551, need_lev => 50, next_lev => 50,
      need_coin => 0,
      need_item => [{21852, 1}, {20311, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{21852, 1}, {20311, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10542, 1, 6}) ->
    #{next_id => 10552, need_lev => 50, next_lev => 50,
      need_coin => 0,
      need_item => [{21852, 1}, {20311, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{21852, 1}, {20311, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10544, 1, 6}) ->
    #{next_id => 10554, need_lev => 50, next_lev => 50,
      need_coin => 0,
      need_item => [{21852, 1}, {20311, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{21852, 1}, {20311, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10651, 1, 6}) ->
    #{next_id => 10661, need_lev => 60, next_lev => 60,
      need_coin => 0,
      need_item => [{21854, 1}, {20312, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{21854, 1}, {20312, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10652, 1, 6}) ->
    #{next_id => 10662, need_lev => 60, next_lev => 60,
      need_coin => 0,
      need_item => [{21854, 1}, {20322, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{21854, 1}, {20322, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10653, 1, 6}) ->
    #{next_id => 10663, need_lev => 60, next_lev => 60,
      need_coin => 0,
      need_item => [{21854, 1}, {20322, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{21854, 1}, {20322, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10654, 1, 6}) ->
    #{next_id => 10664, need_lev => 60, next_lev => 60,
      need_coin => 0,
      need_item => [{21854, 1}, {20322, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{21854, 1}, {20322, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10656, 1, 6}) ->
    #{next_id => 10666, need_lev => 60, next_lev => 60,
      need_coin => 0,
      need_item => [{21854, 1}, {20322, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{21854, 1}, {20322, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10551, 1, 6}) ->
    #{next_id => 10561, need_lev => 60, next_lev => 60,
      need_coin => 0,
      need_item => [{21854, 1}, {20312, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{21854, 1}, {20312, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10552, 1, 6}) ->
    #{next_id => 10562, need_lev => 60, next_lev => 60,
      need_coin => 0,
      need_item => [{21854, 1}, {20312, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{21854, 1}, {20312, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10554, 1, 6}) ->
    #{next_id => 10564, need_lev => 60, next_lev => 60,
      need_coin => 0,
      need_item => [{21854, 1}, {20312, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{21854, 1}, {20312, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10661, 1, 6}) ->
    #{next_id => 10671, need_lev => 70, next_lev => 70,
      need_coin => 0,
      need_item => [{21856, 1}, {20313, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21856, 1}, {20313, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10662, 1, 6}) ->
    #{next_id => 10672, need_lev => 70, next_lev => 70,
      need_coin => 0,
      need_item => [{21856, 1}, {20323, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21856, 1}, {20323, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10663, 1, 6}) ->
    #{next_id => 10673, need_lev => 70, next_lev => 70,
      need_coin => 0,
      need_item => [{21856, 1}, {20323, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21856, 1}, {20323, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10664, 1, 6}) ->
    #{next_id => 10674, need_lev => 70, next_lev => 70,
      need_coin => 0,
      need_item => [{21856, 1}, {20323, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21856, 1}, {20323, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10666, 1, 6}) ->
    #{next_id => 10676, need_lev => 70, next_lev => 70,
      need_coin => 0,
      need_item => [{21856, 1}, {20323, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21856, 1}, {20323, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10561, 1, 6}) ->
    #{next_id => 10571, need_lev => 70, next_lev => 70,
      need_coin => 0,
      need_item => [{21856, 1}, {20313, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21856, 1}, {20313, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10562, 1, 6}) ->
    #{next_id => 10572, need_lev => 70, next_lev => 70,
      need_coin => 0,
      need_item => [{21856, 1}, {20313, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21856, 1}, {20313, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10564, 1, 6}) ->
    #{next_id => 10574, need_lev => 70, next_lev => 70,
      need_coin => 0,
      need_item => [{21856, 1}, {20313, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21856, 1}, {20313, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10671, 1, 6}) ->
    #{next_id => 10681, need_lev => 80, next_lev => 80,
      need_coin => 0,
      need_item => [{21858, 1}, {20314, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21858, 1}, {20314, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10672, 1, 6}) ->
    #{next_id => 10682, need_lev => 80, next_lev => 80,
      need_coin => 0,
      need_item => [{21858, 1}, {20324, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21858, 1}, {20324, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10673, 1, 6}) ->
    #{next_id => 10683, need_lev => 80, next_lev => 80,
      need_coin => 0,
      need_item => [{21858, 1}, {20324, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21858, 1}, {20324, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10674, 1, 6}) ->
    #{next_id => 10684, need_lev => 80, next_lev => 80,
      need_coin => 0,
      need_item => [{21858, 1}, {20324, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21858, 1}, {20324, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10676, 1, 6}) ->
    #{next_id => 10686, need_lev => 80, next_lev => 80,
      need_coin => 0,
      need_item => [{21858, 1}, {20324, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21858, 1}, {20324, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10571, 1, 6}) ->
    #{next_id => 10581, need_lev => 80, next_lev => 80,
      need_coin => 0,
      need_item => [{21858, 1}, {20314, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21858, 1}, {20314, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10572, 1, 6}) ->
    #{next_id => 10582, need_lev => 80, next_lev => 80,
      need_coin => 0,
      need_item => [{21858, 1}, {20314, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21858, 1}, {20314, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10574, 1, 6}) ->
    #{next_id => 10584, need_lev => 80, next_lev => 80,
      need_coin => 0,
      need_item => [{21858, 1}, {20314, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21858, 1}, {20314, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10681, 1, 6}) ->
    #{next_id => 10691, need_lev => 90, next_lev => 90,
      need_coin => 0,
      need_item => [{21860, 1}, {20315, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21860, 1}, {20315, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10682, 1, 6}) ->
    #{next_id => 10692, need_lev => 90, next_lev => 90,
      need_coin => 0,
      need_item => [{21860, 1}, {20325, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21860, 1}, {20325, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10683, 1, 6}) ->
    #{next_id => 10693, need_lev => 90, next_lev => 90,
      need_coin => 0,
      need_item => [{21860, 1}, {20325, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21860, 1}, {20325, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10684, 1, 6}) ->
    #{next_id => 10694, need_lev => 90, next_lev => 90,
      need_coin => 0,
      need_item => [{21860, 1}, {20325, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21860, 1}, {20325, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10686, 1, 6}) ->
    #{next_id => 10696, need_lev => 90, next_lev => 90,
      need_coin => 0,
      need_item => [{21860, 1}, {20325, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21860, 1}, {20325, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10581, 1, 6}) ->
    #{next_id => 10591, need_lev => 90, next_lev => 90,
      need_coin => 0,
      need_item => [{21860, 1}, {20315, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21860, 1}, {20315, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10582, 1, 6}) ->
    #{next_id => 10592, need_lev => 90, next_lev => 90,
      need_coin => 0,
      need_item => [{21860, 1}, {20315, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21860, 1}, {20315, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10584, 1, 6}) ->
    #{next_id => 10594, need_lev => 90, next_lev => 90,
      need_coin => 0,
      need_item => [{21860, 1}, {20315, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21860, 1}, {20315, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10691, 1, 6}) ->
    #{next_id => 12013, need_lev => 100, next_lev => 100,
      need_coin => 0,
      need_item => [{21862, 1}, {20316, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21862, 1}, {20316, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({10692, 1, 6}) ->
    #{next_id => 12006, need_lev => 95, next_lev => 100,
      need_coin => 0,
      need_item => [{21862, 1}, {20326, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21862, 1}, {20326, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({10693, 1, 6}) ->
    #{next_id => 12007, need_lev => 95, next_lev => 100,
      need_coin => 0,
      need_item => [{21862, 1}, {20326, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21862, 1}, {20326, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({10694, 1, 6}) ->
    #{next_id => 12008, need_lev => 95, next_lev => 100,
      need_coin => 0,
      need_item => [{21862, 1}, {20326, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21862, 1}, {20326, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({10696, 1, 6}) ->
    #{next_id => 12009, need_lev => 95, next_lev => 100,
      need_coin => 0,
      need_item => [{21862, 1}, {20326, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21862, 1}, {20326, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({10591, 1, 6}) ->
    #{next_id => 12012, need_lev => 100, next_lev => 100,
      need_coin => 0,
      need_item => [{21862, 1}, {20316, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21862, 1}, {20316, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({10592, 1, 6}) ->
    #{next_id => 12010, need_lev => 100, next_lev => 100,
      need_coin => 0,
      need_item => [{21862, 1}, {20316, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21862, 1}, {20316, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({10594, 1, 6}) ->
    #{next_id => 12011, need_lev => 100, next_lev => 100,
      need_coin => 0,
      need_item => [{21862, 1}, {20316, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21862, 1}, {20316, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({10631, 0, 6}) ->
    #{next_id => 10641, need_lev => 40, next_lev => 40,
      need_coin => 0,
      need_item => [{21851, 1}, {20310, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{21851, 1}, {20310, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10632, 0, 6}) ->
    #{next_id => 10642, need_lev => 40, next_lev => 40,
      need_coin => 0,
      need_item => [{21851, 1}, {20320, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{21851, 1}, {20320, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10633, 0, 6}) ->
    #{next_id => 10643, need_lev => 40, next_lev => 40,
      need_coin => 0,
      need_item => [{21851, 1}, {20320, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{21851, 1}, {20320, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10634, 0, 6}) ->
    #{next_id => 10644, need_lev => 40, next_lev => 40,
      need_coin => 0,
      need_item => [{21851, 1}, {20320, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{21851, 1}, {20320, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10636, 0, 6}) ->
    #{next_id => 10646, need_lev => 40, next_lev => 40,
      need_coin => 0,
      need_item => [{21851, 1}, {20320, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{21851, 1}, {20320, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10531, 0, 6}) ->
    #{next_id => 10541, need_lev => 40, next_lev => 40,
      need_coin => 0,
      need_item => [{21851, 1}, {20310, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{21851, 1}, {20310, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10532, 0, 6}) ->
    #{next_id => 10542, need_lev => 40, next_lev => 40,
      need_coin => 0,
      need_item => [{21851, 1}, {20310, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{21851, 1}, {20310, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10534, 0, 6}) ->
    #{next_id => 10544, need_lev => 40, next_lev => 40,
      need_coin => 0,
      need_item => [{21851, 1}, {20310, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{21851, 1}, {20310, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10641, 0, 6}) ->
    #{next_id => 10651, need_lev => 50, next_lev => 50,
      need_coin => 0,
      need_item => [{21853, 1}, {20311, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{21853, 1}, {20311, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10642, 0, 6}) ->
    #{next_id => 10652, need_lev => 50, next_lev => 50,
      need_coin => 0,
      need_item => [{21853, 1}, {20321, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{21853, 1}, {20321, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10643, 0, 6}) ->
    #{next_id => 10653, need_lev => 50, next_lev => 50,
      need_coin => 0,
      need_item => [{21853, 1}, {20321, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{21853, 1}, {20321, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10644, 0, 6}) ->
    #{next_id => 10654, need_lev => 50, next_lev => 50,
      need_coin => 0,
      need_item => [{21853, 1}, {20321, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{21853, 1}, {20321, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10646, 0, 6}) ->
    #{next_id => 10656, need_lev => 50, next_lev => 50,
      need_coin => 0,
      need_item => [{21853, 1}, {20321, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{21853, 1}, {20321, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10541, 0, 6}) ->
    #{next_id => 10551, need_lev => 50, next_lev => 50,
      need_coin => 0,
      need_item => [{21853, 1}, {20311, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{21853, 1}, {20311, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10542, 0, 6}) ->
    #{next_id => 10552, need_lev => 50, next_lev => 50,
      need_coin => 0,
      need_item => [{21853, 1}, {20311, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{21853, 1}, {20311, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10544, 0, 6}) ->
    #{next_id => 10554, need_lev => 50, next_lev => 50,
      need_coin => 0,
      need_item => [{21853, 1}, {20311, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{21853, 1}, {20311, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10651, 0, 6}) ->
    #{next_id => 10661, need_lev => 60, next_lev => 60,
      need_coin => 0,
      need_item => [{21855, 1}, {20312, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{21855, 1}, {20312, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10652, 0, 6}) ->
    #{next_id => 10662, need_lev => 60, next_lev => 60,
      need_coin => 0,
      need_item => [{21855, 1}, {20322, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{21855, 1}, {20322, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10653, 0, 6}) ->
    #{next_id => 10663, need_lev => 60, next_lev => 60,
      need_coin => 0,
      need_item => [{21855, 1}, {20322, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{21855, 1}, {20322, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10654, 0, 6}) ->
    #{next_id => 10664, need_lev => 60, next_lev => 60,
      need_coin => 0,
      need_item => [{21855, 1}, {20322, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{21855, 1}, {20322, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10656, 0, 6}) ->
    #{next_id => 10666, need_lev => 60, next_lev => 60,
      need_coin => 0,
      need_item => [{21855, 1}, {20322, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{21855, 1}, {20322, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10551, 0, 6}) ->
    #{next_id => 10561, need_lev => 60, next_lev => 60,
      need_coin => 0,
      need_item => [{21855, 1}, {20312, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{21855, 1}, {20312, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10552, 0, 6}) ->
    #{next_id => 10562, need_lev => 60, next_lev => 60,
      need_coin => 0,
      need_item => [{21855, 1}, {20312, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{21855, 1}, {20312, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10554, 0, 6}) ->
    #{next_id => 10564, need_lev => 60, next_lev => 60,
      need_coin => 0,
      need_item => [{21855, 1}, {20312, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{21855, 1}, {20312, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10661, 0, 6}) ->
    #{next_id => 10671, need_lev => 70, next_lev => 70,
      need_coin => 0,
      need_item => [{21857, 1}, {20313, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21857, 1}, {20313, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10662, 0, 6}) ->
    #{next_id => 10672, need_lev => 70, next_lev => 70,
      need_coin => 0,
      need_item => [{21857, 1}, {20323, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21857, 1}, {20323, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10663, 0, 6}) ->
    #{next_id => 10673, need_lev => 70, next_lev => 70,
      need_coin => 0,
      need_item => [{21857, 1}, {20323, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21857, 1}, {20323, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10664, 0, 6}) ->
    #{next_id => 10674, need_lev => 70, next_lev => 70,
      need_coin => 0,
      need_item => [{21857, 1}, {20323, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21857, 1}, {20323, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10666, 0, 6}) ->
    #{next_id => 10676, need_lev => 70, next_lev => 70,
      need_coin => 0,
      need_item => [{21857, 1}, {20323, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21857, 1}, {20323, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10561, 0, 6}) ->
    #{next_id => 10571, need_lev => 70, next_lev => 70,
      need_coin => 0,
      need_item => [{21857, 1}, {20313, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21857, 1}, {20313, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10562, 0, 6}) ->
    #{next_id => 10572, need_lev => 70, next_lev => 70,
      need_coin => 0,
      need_item => [{21857, 1}, {20313, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21857, 1}, {20313, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10564, 0, 6}) ->
    #{next_id => 10574, need_lev => 70, next_lev => 70,
      need_coin => 0,
      need_item => [{21857, 1}, {20313, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21857, 1}, {20313, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10671, 0, 6}) ->
    #{next_id => 10681, need_lev => 80, next_lev => 80,
      need_coin => 0,
      need_item => [{21859, 1}, {20314, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21859, 1}, {20314, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10672, 0, 6}) ->
    #{next_id => 10682, need_lev => 80, next_lev => 80,
      need_coin => 0,
      need_item => [{21859, 1}, {20324, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21859, 1}, {20324, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10673, 0, 6}) ->
    #{next_id => 10683, need_lev => 80, next_lev => 80,
      need_coin => 0,
      need_item => [{21859, 1}, {20324, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21859, 1}, {20324, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10674, 0, 6}) ->
    #{next_id => 10684, need_lev => 80, next_lev => 80,
      need_coin => 0,
      need_item => [{21859, 1}, {20324, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21859, 1}, {20324, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10676, 0, 6}) ->
    #{next_id => 10686, need_lev => 80, next_lev => 80,
      need_coin => 0,
      need_item => [{21859, 1}, {20324, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21859, 1}, {20324, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10571, 0, 6}) ->
    #{next_id => 10581, need_lev => 80, next_lev => 80,
      need_coin => 0,
      need_item => [{21859, 1}, {20314, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21859, 1}, {20314, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10572, 0, 6}) ->
    #{next_id => 10582, need_lev => 80, next_lev => 80,
      need_coin => 0,
      need_item => [{21859, 1}, {20314, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21859, 1}, {20314, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10574, 0, 6}) ->
    #{next_id => 10584, need_lev => 80, next_lev => 80,
      need_coin => 0,
      need_item => [{21859, 1}, {20314, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21859, 1}, {20314, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10681, 0, 6}) ->
    #{next_id => 10691, need_lev => 90, next_lev => 90,
      need_coin => 0,
      need_item => [{21861, 1}, {20315, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21861, 1}, {20315, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10682, 0, 6}) ->
    #{next_id => 10692, need_lev => 90, next_lev => 90,
      need_coin => 0,
      need_item => [{21861, 1}, {20325, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21861, 1}, {20325, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10683, 0, 6}) ->
    #{next_id => 10693, need_lev => 90, next_lev => 90,
      need_coin => 0,
      need_item => [{21861, 1}, {20325, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21861, 1}, {20325, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10684, 0, 6}) ->
    #{next_id => 10694, need_lev => 90, next_lev => 90,
      need_coin => 0,
      need_item => [{21861, 1}, {20325, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21861, 1}, {20325, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10686, 0, 6}) ->
    #{next_id => 10696, need_lev => 90, next_lev => 90,
      need_coin => 0,
      need_item => [{21861, 1}, {20325, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21861, 1}, {20325, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10581, 0, 6}) ->
    #{next_id => 10591, need_lev => 90, next_lev => 90,
      need_coin => 0,
      need_item => [{21861, 1}, {20315, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21861, 1}, {20315, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10582, 0, 6}) ->
    #{next_id => 10592, need_lev => 90, next_lev => 90,
      need_coin => 0,
      need_item => [{21861, 1}, {20315, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21861, 1}, {20315, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10584, 0, 6}) ->
    #{next_id => 10594, need_lev => 90, next_lev => 90,
      need_coin => 0,
      need_item => [{21861, 1}, {20315, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21861, 1}, {20315, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10691, 0, 6}) ->
    #{next_id => 12013, need_lev => 100, next_lev => 100,
      need_coin => 0,
      need_item => [{21863, 1}, {20316, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21863, 1}, {20316, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({10692, 0, 6}) ->
    #{next_id => 12006, need_lev => 95, next_lev => 100,
      need_coin => 0,
      need_item => [{21863, 1}, {20326, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21863, 1}, {20326, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({10693, 0, 6}) ->
    #{next_id => 12007, need_lev => 95, next_lev => 100,
      need_coin => 0,
      need_item => [{21863, 1}, {20326, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21863, 1}, {20326, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({10694, 0, 6}) ->
    #{next_id => 12008, need_lev => 95, next_lev => 100,
      need_coin => 0,
      need_item => [{21863, 1}, {20326, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21863, 1}, {20326, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({10696, 0, 6}) ->
    #{next_id => 12009, need_lev => 95, next_lev => 100,
      need_coin => 0,
      need_item => [{21863, 1}, {20326, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21863, 1}, {20326, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({10591, 0, 6}) ->
    #{next_id => 12012, need_lev => 100, next_lev => 100,
      need_coin => 0,
      need_item => [{21863, 1}, {20316, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21863, 1}, {20316, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({10592, 0, 6}) ->
    #{next_id => 12010, need_lev => 100, next_lev => 100,
      need_coin => 0,
      need_item => [{21863, 1}, {20316, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21863, 1}, {20316, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({10594, 0, 6}) ->
    #{next_id => 12011, need_lev => 100, next_lev => 100,
      need_coin => 0,
      need_item => [{21863, 1}, {20316, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21863, 1}, {20316, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({10731, 1, 7}) ->
    #{next_id => 10741, need_lev => 40, next_lev => 40,
      need_coin => 0,
      need_item => [{21960, 1}, {20310, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{21960, 1}, {20310, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10732, 1, 7}) ->
    #{next_id => 10742, need_lev => 40, next_lev => 40,
      need_coin => 0,
      need_item => [{21960, 1}, {20320, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{21960, 1}, {20320, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10733, 1, 7}) ->
    #{next_id => 10743, need_lev => 40, next_lev => 40,
      need_coin => 0,
      need_item => [{21960, 1}, {20320, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{21960, 1}, {20320, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10734, 1, 7}) ->
    #{next_id => 10744, need_lev => 40, next_lev => 40,
      need_coin => 0,
      need_item => [{21960, 1}, {20320, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{21960, 1}, {20320, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10736, 1, 7}) ->
    #{next_id => 10746, need_lev => 40, next_lev => 40,
      need_coin => 0,
      need_item => [{21960, 1}, {20320, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{21960, 1}, {20320, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10531, 1, 7}) ->
    #{next_id => 10541, need_lev => 40, next_lev => 40,
      need_coin => 0,
      need_item => [{21960, 1}, {20310, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{21960, 1}, {20310, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10532, 1, 7}) ->
    #{next_id => 10542, need_lev => 40, next_lev => 40,
      need_coin => 0,
      need_item => [{21960, 1}, {20310, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{21960, 1}, {20310, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10534, 1, 7}) ->
    #{next_id => 10544, need_lev => 40, next_lev => 40,
      need_coin => 0,
      need_item => [{21960, 1}, {20310, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{21960, 1}, {20310, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10741, 1, 7}) ->
    #{next_id => 10751, need_lev => 50, next_lev => 50,
      need_coin => 0,
      need_item => [{21962, 1}, {20311, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{21962, 1}, {20311, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10742, 1, 7}) ->
    #{next_id => 10752, need_lev => 50, next_lev => 50,
      need_coin => 0,
      need_item => [{21962, 1}, {20321, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{21962, 1}, {20321, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10743, 1, 7}) ->
    #{next_id => 10753, need_lev => 50, next_lev => 50,
      need_coin => 0,
      need_item => [{21962, 1}, {20321, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{21962, 1}, {20321, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10744, 1, 7}) ->
    #{next_id => 10754, need_lev => 50, next_lev => 50,
      need_coin => 0,
      need_item => [{21962, 1}, {20321, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{21962, 1}, {20321, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10746, 1, 7}) ->
    #{next_id => 10756, need_lev => 50, next_lev => 50,
      need_coin => 0,
      need_item => [{21962, 1}, {20321, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{21962, 1}, {20321, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10541, 1, 7}) ->
    #{next_id => 10551, need_lev => 50, next_lev => 50,
      need_coin => 0,
      need_item => [{21962, 1}, {20311, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{21962, 1}, {20311, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10542, 1, 7}) ->
    #{next_id => 10552, need_lev => 50, next_lev => 50,
      need_coin => 0,
      need_item => [{21962, 1}, {20311, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{21962, 1}, {20311, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10544, 1, 7}) ->
    #{next_id => 10554, need_lev => 50, next_lev => 50,
      need_coin => 0,
      need_item => [{21962, 1}, {20311, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{21962, 1}, {20311, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10751, 1, 7}) ->
    #{next_id => 10761, need_lev => 60, next_lev => 60,
      need_coin => 0,
      need_item => [{21964, 1}, {20312, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{21964, 1}, {20312, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10752, 1, 7}) ->
    #{next_id => 10762, need_lev => 60, next_lev => 60,
      need_coin => 0,
      need_item => [{21964, 1}, {20322, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{21964, 1}, {20322, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10753, 1, 7}) ->
    #{next_id => 10763, need_lev => 60, next_lev => 60,
      need_coin => 0,
      need_item => [{21964, 1}, {20322, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{21964, 1}, {20322, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10754, 1, 7}) ->
    #{next_id => 10764, need_lev => 60, next_lev => 60,
      need_coin => 0,
      need_item => [{21964, 1}, {20322, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{21964, 1}, {20322, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10756, 1, 7}) ->
    #{next_id => 10766, need_lev => 60, next_lev => 60,
      need_coin => 0,
      need_item => [{21964, 1}, {20322, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{21964, 1}, {20322, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10551, 1, 7}) ->
    #{next_id => 10561, need_lev => 60, next_lev => 60,
      need_coin => 0,
      need_item => [{21964, 1}, {20312, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{21964, 1}, {20312, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10552, 1, 7}) ->
    #{next_id => 10562, need_lev => 60, next_lev => 60,
      need_coin => 0,
      need_item => [{21964, 1}, {20312, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{21964, 1}, {20312, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10554, 1, 7}) ->
    #{next_id => 10564, need_lev => 60, next_lev => 60,
      need_coin => 0,
      need_item => [{21964, 1}, {20312, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{21964, 1}, {20312, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10761, 1, 7}) ->
    #{next_id => 10771, need_lev => 70, next_lev => 70,
      need_coin => 0,
      need_item => [{21966, 1}, {20313, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21966, 1}, {20313, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10762, 1, 7}) ->
    #{next_id => 10772, need_lev => 70, next_lev => 70,
      need_coin => 0,
      need_item => [{21966, 1}, {20323, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21966, 1}, {20323, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10763, 1, 7}) ->
    #{next_id => 10773, need_lev => 70, next_lev => 70,
      need_coin => 0,
      need_item => [{21966, 1}, {20323, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21966, 1}, {20323, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10764, 1, 7}) ->
    #{next_id => 10774, need_lev => 70, next_lev => 70,
      need_coin => 0,
      need_item => [{21966, 1}, {20323, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21966, 1}, {20323, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10766, 1, 7}) ->
    #{next_id => 10776, need_lev => 70, next_lev => 70,
      need_coin => 0,
      need_item => [{21966, 1}, {20323, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21966, 1}, {20323, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10561, 1, 7}) ->
    #{next_id => 10571, need_lev => 70, next_lev => 70,
      need_coin => 0,
      need_item => [{21966, 1}, {20313, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21966, 1}, {20313, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10562, 1, 7}) ->
    #{next_id => 10572, need_lev => 70, next_lev => 70,
      need_coin => 0,
      need_item => [{21966, 1}, {20313, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21966, 1}, {20313, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10564, 1, 7}) ->
    #{next_id => 10574, need_lev => 70, next_lev => 70,
      need_coin => 0,
      need_item => [{21966, 1}, {20313, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21966, 1}, {20313, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10771, 1, 7}) ->
    #{next_id => 10781, need_lev => 80, next_lev => 80,
      need_coin => 0,
      need_item => [{21968, 1}, {20314, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21968, 1}, {20314, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10772, 1, 7}) ->
    #{next_id => 10782, need_lev => 80, next_lev => 80,
      need_coin => 0,
      need_item => [{21968, 1}, {20324, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21968, 1}, {20324, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10773, 1, 7}) ->
    #{next_id => 10783, need_lev => 80, next_lev => 80,
      need_coin => 0,
      need_item => [{21968, 1}, {20324, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21968, 1}, {20324, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10774, 1, 7}) ->
    #{next_id => 10784, need_lev => 80, next_lev => 80,
      need_coin => 0,
      need_item => [{21968, 1}, {20324, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21968, 1}, {20324, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10776, 1, 7}) ->
    #{next_id => 10786, need_lev => 80, next_lev => 80,
      need_coin => 0,
      need_item => [{21968, 1}, {20324, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21968, 1}, {20324, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10571, 1, 7}) ->
    #{next_id => 10581, need_lev => 80, next_lev => 80,
      need_coin => 0,
      need_item => [{21968, 1}, {20314, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21968, 1}, {20314, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10572, 1, 7}) ->
    #{next_id => 10582, need_lev => 80, next_lev => 80,
      need_coin => 0,
      need_item => [{21968, 1}, {20314, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21968, 1}, {20314, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10574, 1, 7}) ->
    #{next_id => 10584, need_lev => 80, next_lev => 80,
      need_coin => 0,
      need_item => [{21968, 1}, {20314, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21968, 1}, {20314, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10781, 1, 7}) ->
    #{next_id => 10791, need_lev => 90, next_lev => 90,
      need_coin => 0,
      need_item => [{21970, 1}, {20315, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21970, 1}, {20315, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10782, 1, 7}) ->
    #{next_id => 10792, need_lev => 90, next_lev => 90,
      need_coin => 0,
      need_item => [{21970, 1}, {20325, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21970, 1}, {20325, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10783, 1, 7}) ->
    #{next_id => 10793, need_lev => 90, next_lev => 90,
      need_coin => 0,
      need_item => [{21970, 1}, {20325, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21970, 1}, {20325, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10784, 1, 7}) ->
    #{next_id => 10794, need_lev => 90, next_lev => 90,
      need_coin => 0,
      need_item => [{21970, 1}, {20325, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21970, 1}, {20325, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10786, 1, 7}) ->
    #{next_id => 10796, need_lev => 90, next_lev => 90,
      need_coin => 0,
      need_item => [{21970, 1}, {20325, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21970, 1}, {20325, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10581, 1, 7}) ->
    #{next_id => 10591, need_lev => 90, next_lev => 90,
      need_coin => 0,
      need_item => [{21970, 1}, {20315, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21970, 1}, {20315, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10582, 1, 7}) ->
    #{next_id => 10592, need_lev => 90, next_lev => 90,
      need_coin => 0,
      need_item => [{21970, 1}, {20315, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21970, 1}, {20315, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10584, 1, 7}) ->
    #{next_id => 10594, need_lev => 90, next_lev => 90,
      need_coin => 0,
      need_item => [{21970, 1}, {20315, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21970, 1}, {20315, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10791, 1, 7}) ->
    #{next_id => 12014, need_lev => 100, next_lev => 100,
      need_coin => 0,
      need_item => [{21972, 1}, {20316, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21972, 1}, {20316, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({10792, 1, 7}) ->
    #{next_id => 12006, need_lev => 95, next_lev => 100,
      need_coin => 0,
      need_item => [{21972, 1}, {20326, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21972, 1}, {20326, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({10793, 1, 7}) ->
    #{next_id => 12007, need_lev => 95, next_lev => 100,
      need_coin => 0,
      need_item => [{21972, 1}, {20326, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21972, 1}, {20326, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({10794, 1, 7}) ->
    #{next_id => 12008, need_lev => 95, next_lev => 100,
      need_coin => 0,
      need_item => [{21972, 1}, {20326, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21972, 1}, {20326, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({10796, 1, 7}) ->
    #{next_id => 12009, need_lev => 95, next_lev => 100,
      need_coin => 0,
      need_item => [{21972, 1}, {20326, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21972, 1}, {20326, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({10591, 1, 7}) ->
    #{next_id => 12012, need_lev => 100, next_lev => 100,
      need_coin => 0,
      need_item => [{21972, 1}, {20316, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21972, 1}, {20316, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({10592, 1, 7}) ->
    #{next_id => 12010, need_lev => 100, next_lev => 100,
      need_coin => 0,
      need_item => [{21972, 1}, {20316, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21972, 1}, {20316, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({10594, 1, 7}) ->
    #{next_id => 12011, need_lev => 100, next_lev => 100,
      need_coin => 0,
      need_item => [{21972, 1}, {20316, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21972, 1}, {20316, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({10731, 0, 7}) ->
    #{next_id => 10741, need_lev => 40, next_lev => 40,
      need_coin => 0,
      need_item => [{21961, 1}, {20310, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{21961, 1}, {20310, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10732, 0, 7}) ->
    #{next_id => 10742, need_lev => 40, next_lev => 40,
      need_coin => 0,
      need_item => [{21961, 1}, {20320, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{21961, 1}, {20320, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10733, 0, 7}) ->
    #{next_id => 10743, need_lev => 40, next_lev => 40,
      need_coin => 0,
      need_item => [{21961, 1}, {20320, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{21961, 1}, {20320, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10734, 0, 7}) ->
    #{next_id => 10744, need_lev => 40, next_lev => 40,
      need_coin => 0,
      need_item => [{21961, 1}, {20320, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{21961, 1}, {20320, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10736, 0, 7}) ->
    #{next_id => 10746, need_lev => 40, next_lev => 40,
      need_coin => 0,
      need_item => [{21961, 1}, {20320, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{21961, 1}, {20320, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10531, 0, 7}) ->
    #{next_id => 10541, need_lev => 40, next_lev => 40,
      need_coin => 0,
      need_item => [{21961, 1}, {20310, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{21961, 1}, {20310, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10532, 0, 7}) ->
    #{next_id => 10542, need_lev => 40, next_lev => 40,
      need_coin => 0,
      need_item => [{21961, 1}, {20310, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{21961, 1}, {20310, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10534, 0, 7}) ->
    #{next_id => 10544, need_lev => 40, next_lev => 40,
      need_coin => 0,
      need_item => [{21961, 1}, {20310, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{21961, 1}, {20310, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10741, 0, 7}) ->
    #{next_id => 10751, need_lev => 50, next_lev => 50,
      need_coin => 0,
      need_item => [{21963, 1}, {20311, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{21963, 1}, {20311, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10742, 0, 7}) ->
    #{next_id => 10752, need_lev => 50, next_lev => 50,
      need_coin => 0,
      need_item => [{21963, 1}, {20321, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{21963, 1}, {20321, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10743, 0, 7}) ->
    #{next_id => 10753, need_lev => 50, next_lev => 50,
      need_coin => 0,
      need_item => [{21963, 1}, {20321, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{21963, 1}, {20321, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10744, 0, 7}) ->
    #{next_id => 10754, need_lev => 50, next_lev => 50,
      need_coin => 0,
      need_item => [{21963, 1}, {20321, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{21963, 1}, {20321, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10746, 0, 7}) ->
    #{next_id => 10756, need_lev => 50, next_lev => 50,
      need_coin => 0,
      need_item => [{21963, 1}, {20321, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{21963, 1}, {20321, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10541, 0, 7}) ->
    #{next_id => 10551, need_lev => 50, next_lev => 50,
      need_coin => 0,
      need_item => [{21963, 1}, {20311, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{21963, 1}, {20311, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10542, 0, 7}) ->
    #{next_id => 10552, need_lev => 50, next_lev => 50,
      need_coin => 0,
      need_item => [{21963, 1}, {20311, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{21963, 1}, {20311, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10544, 0, 7}) ->
    #{next_id => 10554, need_lev => 50, next_lev => 50,
      need_coin => 0,
      need_item => [{21963, 1}, {20311, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{21963, 1}, {20311, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10751, 0, 7}) ->
    #{next_id => 10761, need_lev => 60, next_lev => 60,
      need_coin => 0,
      need_item => [{21965, 1}, {20312, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{21965, 1}, {20312, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10752, 0, 7}) ->
    #{next_id => 10762, need_lev => 60, next_lev => 60,
      need_coin => 0,
      need_item => [{21965, 1}, {20322, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{21965, 1}, {20322, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10753, 0, 7}) ->
    #{next_id => 10763, need_lev => 60, next_lev => 60,
      need_coin => 0,
      need_item => [{21965, 1}, {20322, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{21965, 1}, {20322, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10754, 0, 7}) ->
    #{next_id => 10764, need_lev => 60, next_lev => 60,
      need_coin => 0,
      need_item => [{21965, 1}, {20322, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{21965, 1}, {20322, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10756, 0, 7}) ->
    #{next_id => 10766, need_lev => 60, next_lev => 60,
      need_coin => 0,
      need_item => [{21965, 1}, {20322, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{21965, 1}, {20322, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10551, 0, 7}) ->
    #{next_id => 10561, need_lev => 60, next_lev => 60,
      need_coin => 0,
      need_item => [{21965, 1}, {20312, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{21965, 1}, {20312, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10552, 0, 7}) ->
    #{next_id => 10562, need_lev => 60, next_lev => 60,
      need_coin => 0,
      need_item => [{21965, 1}, {20312, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{21965, 1}, {20312, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10554, 0, 7}) ->
    #{next_id => 10564, need_lev => 60, next_lev => 60,
      need_coin => 0,
      need_item => [{21965, 1}, {20312, 1}, {20310, 0}],
      perfect_item => [{20093, 1}], make_up => [],
      low_lev_cost => [{21965, 1}, {20312, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10761, 0, 7}) ->
    #{next_id => 10771, need_lev => 70, next_lev => 70,
      need_coin => 0,
      need_item => [{21967, 1}, {20313, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21967, 1}, {20313, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10762, 0, 7}) ->
    #{next_id => 10772, need_lev => 70, next_lev => 70,
      need_coin => 0,
      need_item => [{21967, 1}, {20323, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21967, 1}, {20323, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10763, 0, 7}) ->
    #{next_id => 10773, need_lev => 70, next_lev => 70,
      need_coin => 0,
      need_item => [{21967, 1}, {20323, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21967, 1}, {20323, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10764, 0, 7}) ->
    #{next_id => 10774, need_lev => 70, next_lev => 70,
      need_coin => 0,
      need_item => [{21967, 1}, {20323, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21967, 1}, {20323, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10766, 0, 7}) ->
    #{next_id => 10776, need_lev => 70, next_lev => 70,
      need_coin => 0,
      need_item => [{21967, 1}, {20323, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21967, 1}, {20323, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10561, 0, 7}) ->
    #{next_id => 10571, need_lev => 70, next_lev => 70,
      need_coin => 0,
      need_item => [{21967, 1}, {20313, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21967, 1}, {20313, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10562, 0, 7}) ->
    #{next_id => 10572, need_lev => 70, next_lev => 70,
      need_coin => 0,
      need_item => [{21967, 1}, {20313, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21967, 1}, {20313, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10564, 0, 7}) ->
    #{next_id => 10574, need_lev => 70, next_lev => 70,
      need_coin => 0,
      need_item => [{21967, 1}, {20313, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21967, 1}, {20313, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10771, 0, 7}) ->
    #{next_id => 10781, need_lev => 80, next_lev => 80,
      need_coin => 0,
      need_item => [{21969, 1}, {20314, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21969, 1}, {20314, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10772, 0, 7}) ->
    #{next_id => 10782, need_lev => 80, next_lev => 80,
      need_coin => 0,
      need_item => [{21969, 1}, {20324, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21969, 1}, {20324, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10773, 0, 7}) ->
    #{next_id => 10783, need_lev => 80, next_lev => 80,
      need_coin => 0,
      need_item => [{21969, 1}, {20324, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21969, 1}, {20324, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10774, 0, 7}) ->
    #{next_id => 10784, need_lev => 80, next_lev => 80,
      need_coin => 0,
      need_item => [{21969, 1}, {20324, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21969, 1}, {20324, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10776, 0, 7}) ->
    #{next_id => 10786, need_lev => 80, next_lev => 80,
      need_coin => 0,
      need_item => [{21969, 1}, {20324, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21969, 1}, {20324, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10571, 0, 7}) ->
    #{next_id => 10581, need_lev => 80, next_lev => 80,
      need_coin => 0,
      need_item => [{21969, 1}, {20314, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21969, 1}, {20314, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10572, 0, 7}) ->
    #{next_id => 10582, need_lev => 80, next_lev => 80,
      need_coin => 0,
      need_item => [{21969, 1}, {20314, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21969, 1}, {20314, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10574, 0, 7}) ->
    #{next_id => 10584, need_lev => 80, next_lev => 80,
      need_coin => 0,
      need_item => [{21969, 1}, {20314, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21969, 1}, {20314, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10781, 0, 7}) ->
    #{next_id => 10791, need_lev => 90, next_lev => 90,
      need_coin => 0,
      need_item => [{21971, 1}, {20315, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21971, 1}, {20315, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10782, 0, 7}) ->
    #{next_id => 10792, need_lev => 90, next_lev => 90,
      need_coin => 0,
      need_item => [{21971, 1}, {20325, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21971, 1}, {20325, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10783, 0, 7}) ->
    #{next_id => 10793, need_lev => 90, next_lev => 90,
      need_coin => 0,
      need_item => [{21971, 1}, {20325, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21971, 1}, {20325, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10784, 0, 7}) ->
    #{next_id => 10794, need_lev => 90, next_lev => 90,
      need_coin => 0,
      need_item => [{21971, 1}, {20325, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21971, 1}, {20325, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10786, 0, 7}) ->
    #{next_id => 10796, need_lev => 90, next_lev => 90,
      need_coin => 0,
      need_item => [{21971, 1}, {20325, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21971, 1}, {20325, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10581, 0, 7}) ->
    #{next_id => 10591, need_lev => 90, next_lev => 90,
      need_coin => 0,
      need_item => [{21971, 1}, {20315, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21971, 1}, {20315, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10582, 0, 7}) ->
    #{next_id => 10592, need_lev => 90, next_lev => 90,
      need_coin => 0,
      need_item => [{21971, 1}, {20315, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21971, 1}, {20315, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10584, 0, 7}) ->
    #{next_id => 10594, need_lev => 90, next_lev => 90,
      need_coin => 0,
      need_item => [{21971, 1}, {20315, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21971, 1}, {20315, 1}, {20310, 0}],
      need_break_times => 0};
get_forge({10791, 0, 7}) ->
    #{next_id => 12014, need_lev => 100, next_lev => 100,
      need_coin => 0,
      need_item => [{21973, 1}, {20316, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21973, 1}, {20316, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({10792, 0, 7}) ->
    #{next_id => 12006, need_lev => 95, next_lev => 100,
      need_coin => 0,
      need_item => [{21973, 1}, {20326, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21973, 1}, {20326, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({10793, 0, 7}) ->
    #{next_id => 12007, need_lev => 95, next_lev => 100,
      need_coin => 0,
      need_item => [{21973, 1}, {20326, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21973, 1}, {20326, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({10794, 0, 7}) ->
    #{next_id => 12008, need_lev => 95, next_lev => 100,
      need_coin => 0,
      need_item => [{21973, 1}, {20326, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21973, 1}, {20326, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({10796, 0, 7}) ->
    #{next_id => 12009, need_lev => 95, next_lev => 100,
      need_coin => 0,
      need_item => [{21973, 1}, {20326, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21973, 1}, {20326, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({10591, 0, 7}) ->
    #{next_id => 12012, need_lev => 100, next_lev => 100,
      need_coin => 0,
      need_item => [{21973, 1}, {20316, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21973, 1}, {20316, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({10592, 0, 7}) ->
    #{next_id => 12010, need_lev => 100, next_lev => 100,
      need_coin => 0,
      need_item => [{21973, 1}, {20316, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21973, 1}, {20316, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({10594, 0, 7}) ->
    #{next_id => 12011, need_lev => 100, next_lev => 100,
      need_coin => 0,
      need_item => [{21973, 1}, {20316, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21973, 1}, {20316, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({10091, 1, 1}) ->
    #{next_id => 12001, need_lev => 100, next_lev => 100,
      need_coin => 0,
      need_item => [{21801, 1}, {20316, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21801, 1}, {20316, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({10092, 1, 1}) ->
    #{next_id => 12006, need_lev => 95, next_lev => 100,
      need_coin => 0,
      need_item => [{21801, 1}, {20326, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21801, 1}, {20326, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({10093, 1, 1}) ->
    #{next_id => 12007, need_lev => 95, next_lev => 100,
      need_coin => 0,
      need_item => [{21801, 1}, {20326, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21801, 1}, {20326, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({10094, 1, 1}) ->
    #{next_id => 12008, need_lev => 95, next_lev => 100,
      need_coin => 0,
      need_item => [{21801, 1}, {20326, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21801, 1}, {20326, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({10096, 1, 1}) ->
    #{next_id => 12009, need_lev => 95, next_lev => 100,
      need_coin => 0,
      need_item => [{21801, 1}, {20326, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21801, 1}, {20326, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({10591, 1, 1}) ->
    #{next_id => 12012, need_lev => 100, next_lev => 100,
      need_coin => 0,
      need_item => [{21801, 1}, {20316, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21801, 1}, {20316, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({10592, 1, 1}) ->
    #{next_id => 12010, need_lev => 100, next_lev => 100,
      need_coin => 0,
      need_item => [{21801, 1}, {20316, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21801, 1}, {20316, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({10594, 1, 1}) ->
    #{next_id => 12011, need_lev => 100, next_lev => 100,
      need_coin => 0,
      need_item => [{21801, 1}, {20316, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21801, 1}, {20316, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({10191, 1, 2}) ->
    #{next_id => 12002, need_lev => 100, next_lev => 100,
      need_coin => 0,
      need_item => [{21802, 1}, {20316, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21802, 1}, {20316, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({10192, 1, 2}) ->
    #{next_id => 12006, need_lev => 95, next_lev => 100,
      need_coin => 0,
      need_item => [{21802, 1}, {20326, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21802, 1}, {20326, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({10193, 1, 2}) ->
    #{next_id => 12007, need_lev => 95, next_lev => 100,
      need_coin => 0,
      need_item => [{21802, 1}, {20326, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21802, 1}, {20326, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({10194, 1, 2}) ->
    #{next_id => 12008, need_lev => 95, next_lev => 100,
      need_coin => 0,
      need_item => [{21802, 1}, {20326, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21802, 1}, {20326, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({10196, 1, 2}) ->
    #{next_id => 12009, need_lev => 95, next_lev => 100,
      need_coin => 0,
      need_item => [{21802, 1}, {20326, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21802, 1}, {20326, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({10591, 1, 2}) ->
    #{next_id => 12012, need_lev => 100, next_lev => 100,
      need_coin => 0,
      need_item => [{21802, 1}, {20316, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21802, 1}, {20316, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({10592, 1, 2}) ->
    #{next_id => 12010, need_lev => 100, next_lev => 100,
      need_coin => 0,
      need_item => [{21802, 1}, {20316, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21802, 1}, {20316, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({10594, 1, 2}) ->
    #{next_id => 12011, need_lev => 100, next_lev => 100,
      need_coin => 0,
      need_item => [{21802, 1}, {20316, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21802, 1}, {20316, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({10291, 1, 3}) ->
    #{next_id => 12003, need_lev => 100, next_lev => 100,
      need_coin => 0,
      need_item => [{21803, 1}, {20316, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21803, 1}, {20316, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({10292, 1, 3}) ->
    #{next_id => 12006, need_lev => 95, next_lev => 100,
      need_coin => 0,
      need_item => [{21803, 1}, {20326, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21803, 1}, {20326, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({10293, 1, 3}) ->
    #{next_id => 12007, need_lev => 95, next_lev => 100,
      need_coin => 0,
      need_item => [{21803, 1}, {20326, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21803, 1}, {20326, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({10294, 1, 3}) ->
    #{next_id => 12008, need_lev => 95, next_lev => 100,
      need_coin => 0,
      need_item => [{21803, 1}, {20326, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21803, 1}, {20326, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({10296, 1, 3}) ->
    #{next_id => 12009, need_lev => 95, next_lev => 100,
      need_coin => 0,
      need_item => [{21803, 1}, {20326, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21803, 1}, {20326, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({10591, 1, 3}) ->
    #{next_id => 12012, need_lev => 100, next_lev => 100,
      need_coin => 0,
      need_item => [{21803, 1}, {20316, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21803, 1}, {20316, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({10592, 1, 3}) ->
    #{next_id => 12010, need_lev => 100, next_lev => 100,
      need_coin => 0,
      need_item => [{21803, 1}, {20316, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21803, 1}, {20316, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({10594, 1, 3}) ->
    #{next_id => 12011, need_lev => 100, next_lev => 100,
      need_coin => 0,
      need_item => [{21803, 1}, {20316, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21803, 1}, {20316, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({10391, 1, 4}) ->
    #{next_id => 12004, need_lev => 100, next_lev => 100,
      need_coin => 0,
      need_item => [{21804, 1}, {20316, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21804, 1}, {20316, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({10392, 1, 4}) ->
    #{next_id => 12006, need_lev => 95, next_lev => 100,
      need_coin => 0,
      need_item => [{21804, 1}, {20326, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21804, 1}, {20326, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({10393, 1, 4}) ->
    #{next_id => 12007, need_lev => 95, next_lev => 100,
      need_coin => 0,
      need_item => [{21804, 1}, {20326, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21804, 1}, {20326, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({10394, 1, 4}) ->
    #{next_id => 12008, need_lev => 95, next_lev => 100,
      need_coin => 0,
      need_item => [{21804, 1}, {20326, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21804, 1}, {20326, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({10396, 1, 4}) ->
    #{next_id => 12009, need_lev => 95, next_lev => 100,
      need_coin => 0,
      need_item => [{21804, 1}, {20326, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21804, 1}, {20326, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({10591, 1, 4}) ->
    #{next_id => 12012, need_lev => 100, next_lev => 100,
      need_coin => 0,
      need_item => [{21804, 1}, {20316, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21804, 1}, {20316, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({10592, 1, 4}) ->
    #{next_id => 12010, need_lev => 100, next_lev => 100,
      need_coin => 0,
      need_item => [{21804, 1}, {20316, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21804, 1}, {20316, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({10594, 1, 4}) ->
    #{next_id => 12011, need_lev => 100, next_lev => 100,
      need_coin => 0,
      need_item => [{21804, 1}, {20316, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21804, 1}, {20316, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({10491, 1, 5}) ->
    #{next_id => 12005, need_lev => 100, next_lev => 100,
      need_coin => 0,
      need_item => [{21805, 1}, {20316, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21805, 1}, {20316, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({10492, 1, 5}) ->
    #{next_id => 12006, need_lev => 95, next_lev => 100,
      need_coin => 0,
      need_item => [{21805, 1}, {20326, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21805, 1}, {20326, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({10493, 1, 5}) ->
    #{next_id => 12007, need_lev => 95, next_lev => 100,
      need_coin => 0,
      need_item => [{21805, 1}, {20326, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21805, 1}, {20326, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({10494, 1, 5}) ->
    #{next_id => 12008, need_lev => 95, next_lev => 100,
      need_coin => 0,
      need_item => [{21805, 1}, {20326, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21805, 1}, {20326, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({10496, 1, 5}) ->
    #{next_id => 12009, need_lev => 95, next_lev => 100,
      need_coin => 0,
      need_item => [{21805, 1}, {20326, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21805, 1}, {20326, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({10591, 1, 5}) ->
    #{next_id => 12012, need_lev => 100, next_lev => 100,
      need_coin => 0,
      need_item => [{21805, 1}, {20316, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21805, 1}, {20316, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({10592, 1, 5}) ->
    #{next_id => 12010, need_lev => 100, next_lev => 100,
      need_coin => 0,
      need_item => [{21805, 1}, {20316, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21805, 1}, {20316, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({10594, 1, 5}) ->
    #{next_id => 12011, need_lev => 100, next_lev => 100,
      need_coin => 0,
      need_item => [{21805, 1}, {20316, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21805, 1}, {20316, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({10091, 0, 1}) ->
    #{next_id => 12001, need_lev => 100, next_lev => 100,
      need_coin => 0,
      need_item => [{21806, 1}, {20316, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21806, 1}, {20316, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({10092, 0, 1}) ->
    #{next_id => 12006, need_lev => 95, next_lev => 100,
      need_coin => 0,
      need_item => [{21806, 1}, {20326, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21806, 1}, {20326, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({10093, 0, 1}) ->
    #{next_id => 12007, need_lev => 95, next_lev => 100,
      need_coin => 0,
      need_item => [{21806, 1}, {20326, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21806, 1}, {20326, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({10094, 0, 1}) ->
    #{next_id => 12008, need_lev => 95, next_lev => 100,
      need_coin => 0,
      need_item => [{21806, 1}, {20326, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21806, 1}, {20326, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({10096, 0, 1}) ->
    #{next_id => 12009, need_lev => 95, next_lev => 100,
      need_coin => 0,
      need_item => [{21806, 1}, {20326, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21806, 1}, {20326, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({10591, 0, 1}) ->
    #{next_id => 12012, need_lev => 100, next_lev => 100,
      need_coin => 0,
      need_item => [{21806, 1}, {20316, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21806, 1}, {20316, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({10592, 0, 1}) ->
    #{next_id => 12010, need_lev => 100, next_lev => 100,
      need_coin => 0,
      need_item => [{21806, 1}, {20316, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21806, 1}, {20316, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({10594, 0, 1}) ->
    #{next_id => 12011, need_lev => 100, next_lev => 100,
      need_coin => 0,
      need_item => [{21806, 1}, {20316, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21806, 1}, {20316, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({10191, 0, 2}) ->
    #{next_id => 12002, need_lev => 100, next_lev => 100,
      need_coin => 0,
      need_item => [{21807, 1}, {20316, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21807, 1}, {20316, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({10192, 0, 2}) ->
    #{next_id => 12006, need_lev => 95, next_lev => 100,
      need_coin => 0,
      need_item => [{21807, 1}, {20326, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21807, 1}, {20326, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({10193, 0, 2}) ->
    #{next_id => 12007, need_lev => 95, next_lev => 100,
      need_coin => 0,
      need_item => [{21807, 1}, {20326, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21807, 1}, {20326, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({10194, 0, 2}) ->
    #{next_id => 12008, need_lev => 95, next_lev => 100,
      need_coin => 0,
      need_item => [{21807, 1}, {20326, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21807, 1}, {20326, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({10196, 0, 2}) ->
    #{next_id => 12009, need_lev => 95, next_lev => 100,
      need_coin => 0,
      need_item => [{21807, 1}, {20326, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21807, 1}, {20326, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({10591, 0, 2}) ->
    #{next_id => 12012, need_lev => 100, next_lev => 100,
      need_coin => 0,
      need_item => [{21807, 1}, {20316, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21807, 1}, {20316, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({10592, 0, 2}) ->
    #{next_id => 12010, need_lev => 100, next_lev => 100,
      need_coin => 0,
      need_item => [{21807, 1}, {20316, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21807, 1}, {20316, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({10594, 0, 2}) ->
    #{next_id => 12011, need_lev => 100, next_lev => 100,
      need_coin => 0,
      need_item => [{21807, 1}, {20316, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21807, 1}, {20316, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({10291, 0, 3}) ->
    #{next_id => 12003, need_lev => 100, next_lev => 100,
      need_coin => 0,
      need_item => [{21808, 1}, {20316, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21808, 1}, {20316, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({10292, 0, 3}) ->
    #{next_id => 12006, need_lev => 95, next_lev => 100,
      need_coin => 0,
      need_item => [{21808, 1}, {20326, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21808, 1}, {20326, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({10293, 0, 3}) ->
    #{next_id => 12007, need_lev => 95, next_lev => 100,
      need_coin => 0,
      need_item => [{21808, 1}, {20326, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21808, 1}, {20326, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({10294, 0, 3}) ->
    #{next_id => 12008, need_lev => 95, next_lev => 100,
      need_coin => 0,
      need_item => [{21808, 1}, {20326, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21808, 1}, {20326, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({10296, 0, 3}) ->
    #{next_id => 12009, need_lev => 95, next_lev => 100,
      need_coin => 0,
      need_item => [{21808, 1}, {20326, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21808, 1}, {20326, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({10591, 0, 3}) ->
    #{next_id => 12012, need_lev => 100, next_lev => 100,
      need_coin => 0,
      need_item => [{21808, 1}, {20316, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21808, 1}, {20316, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({10592, 0, 3}) ->
    #{next_id => 12010, need_lev => 100, next_lev => 100,
      need_coin => 0,
      need_item => [{21808, 1}, {20316, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21808, 1}, {20316, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({10594, 0, 3}) ->
    #{next_id => 12011, need_lev => 100, next_lev => 100,
      need_coin => 0,
      need_item => [{21808, 1}, {20316, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21808, 1}, {20316, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({10391, 0, 4}) ->
    #{next_id => 12004, need_lev => 100, next_lev => 100,
      need_coin => 0,
      need_item => [{21809, 1}, {20316, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21809, 1}, {20316, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({10392, 0, 4}) ->
    #{next_id => 12006, need_lev => 95, next_lev => 100,
      need_coin => 0,
      need_item => [{21809, 1}, {20326, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21809, 1}, {20326, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({10393, 0, 4}) ->
    #{next_id => 12007, need_lev => 95, next_lev => 100,
      need_coin => 0,
      need_item => [{21809, 1}, {20326, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21809, 1}, {20326, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({10394, 0, 4}) ->
    #{next_id => 12008, need_lev => 95, next_lev => 100,
      need_coin => 0,
      need_item => [{21809, 1}, {20326, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21809, 1}, {20326, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({10396, 0, 4}) ->
    #{next_id => 12009, need_lev => 95, next_lev => 100,
      need_coin => 0,
      need_item => [{21809, 1}, {20326, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21809, 1}, {20326, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({10591, 0, 4}) ->
    #{next_id => 12012, need_lev => 100, next_lev => 100,
      need_coin => 0,
      need_item => [{21809, 1}, {20316, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21809, 1}, {20316, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({10592, 0, 4}) ->
    #{next_id => 12010, need_lev => 100, next_lev => 100,
      need_coin => 0,
      need_item => [{21809, 1}, {20316, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21809, 1}, {20316, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({10594, 0, 4}) ->
    #{next_id => 12011, need_lev => 100, next_lev => 100,
      need_coin => 0,
      need_item => [{21809, 1}, {20316, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21809, 1}, {20316, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({10491, 0, 5}) ->
    #{next_id => 12005, need_lev => 100, next_lev => 100,
      need_coin => 0,
      need_item => [{21810, 1}, {20316, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21810, 1}, {20316, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({10492, 0, 5}) ->
    #{next_id => 12006, need_lev => 95, next_lev => 100,
      need_coin => 0,
      need_item => [{21810, 1}, {20326, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21810, 1}, {20326, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({10493, 0, 5}) ->
    #{next_id => 12007, need_lev => 95, next_lev => 100,
      need_coin => 0,
      need_item => [{21810, 1}, {20326, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21810, 1}, {20326, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({10494, 0, 5}) ->
    #{next_id => 12008, need_lev => 95, next_lev => 100,
      need_coin => 0,
      need_item => [{21810, 1}, {20326, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21810, 1}, {20326, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({10496, 0, 5}) ->
    #{next_id => 12009, need_lev => 95, next_lev => 100,
      need_coin => 0,
      need_item => [{21810, 1}, {20326, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21810, 1}, {20326, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({10591, 0, 5}) ->
    #{next_id => 12012, need_lev => 100, next_lev => 100,
      need_coin => 0,
      need_item => [{21810, 1}, {20316, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21810, 1}, {20316, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({10592, 0, 5}) ->
    #{next_id => 12010, need_lev => 100, next_lev => 100,
      need_coin => 0,
      need_item => [{21810, 1}, {20316, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21810, 1}, {20316, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({10594, 0, 5}) ->
    #{next_id => 12011, need_lev => 100, next_lev => 100,
      need_coin => 0,
      need_item => [{21810, 1}, {20316, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21810, 1}, {20316, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12014, 1, 7}) ->
    #{next_id => 12020, need_lev => 115, next_lev => 110,
      need_coin => 0,
      need_item => [{21974, 1}, {20317, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21974, 1}, {20317, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12006, 1, 7}) ->
    #{next_id => 12027, need_lev => 110, next_lev => 110,
      need_coin => 0,
      need_item => [{21974, 1}, {20327, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21974, 1}, {20327, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12007, 1, 7}) ->
    #{next_id => 12028, need_lev => 110, next_lev => 110,
      need_coin => 0,
      need_item => [{21974, 1}, {20327, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21974, 1}, {20327, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12008, 1, 7}) ->
    #{next_id => 12029, need_lev => 110, next_lev => 110,
      need_coin => 0,
      need_item => [{21974, 1}, {20327, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21974, 1}, {20327, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12009, 1, 7}) ->
    #{next_id => 12030, need_lev => 110, next_lev => 110,
      need_coin => 0,
      need_item => [{21974, 1}, {20327, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21974, 1}, {20327, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12012, 1, 7}) ->
    #{next_id => 12033, need_lev => 115, next_lev => 110,
      need_coin => 0,
      need_item => [{21974, 1}, {20317, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21974, 1}, {20317, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12010, 1, 7}) ->
    #{next_id => 12031, need_lev => 115, next_lev => 110,
      need_coin => 0,
      need_item => [{21974, 1}, {20317, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21974, 1}, {20317, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12011, 1, 7}) ->
    #{next_id => 12032, need_lev => 115, next_lev => 110,
      need_coin => 0,
      need_item => [{21974, 1}, {20317, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21974, 1}, {20317, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12013, 1, 6}) ->
    #{next_id => 12026, need_lev => 115, next_lev => 110,
      need_coin => 0,
      need_item => [{22015, 1}, {20317, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22015, 1}, {20317, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12006, 1, 6}) ->
    #{next_id => 12027, need_lev => 110, next_lev => 110,
      need_coin => 0,
      need_item => [{22015, 1}, {20327, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22015, 1}, {20327, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12007, 1, 6}) ->
    #{next_id => 12028, need_lev => 110, next_lev => 110,
      need_coin => 0,
      need_item => [{22015, 1}, {20327, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22015, 1}, {20327, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12008, 1, 6}) ->
    #{next_id => 12029, need_lev => 110, next_lev => 110,
      need_coin => 0,
      need_item => [{22015, 1}, {20327, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22015, 1}, {20327, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12009, 1, 6}) ->
    #{next_id => 12030, need_lev => 110, next_lev => 110,
      need_coin => 0,
      need_item => [{22015, 1}, {20327, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22015, 1}, {20327, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12012, 1, 6}) ->
    #{next_id => 12033, need_lev => 115, next_lev => 110,
      need_coin => 0,
      need_item => [{22015, 1}, {20317, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22015, 1}, {20317, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12010, 1, 6}) ->
    #{next_id => 12031, need_lev => 115, next_lev => 110,
      need_coin => 0,
      need_item => [{22015, 1}, {20317, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22015, 1}, {20317, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12011, 1, 6}) ->
    #{next_id => 12032, need_lev => 115, next_lev => 110,
      need_coin => 0,
      need_item => [{22015, 1}, {20317, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22015, 1}, {20317, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12001, 1, 1}) ->
    #{next_id => 12021, need_lev => 115, next_lev => 110,
      need_coin => 0,
      need_item => [{22010, 1}, {20317, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22010, 1}, {20317, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12006, 1, 1}) ->
    #{next_id => 12027, need_lev => 110, next_lev => 110,
      need_coin => 0,
      need_item => [{22010, 1}, {20327, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22010, 1}, {20327, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12007, 1, 1}) ->
    #{next_id => 12028, need_lev => 110, next_lev => 110,
      need_coin => 0,
      need_item => [{22010, 1}, {20327, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22010, 1}, {20327, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12008, 1, 1}) ->
    #{next_id => 12029, need_lev => 110, next_lev => 110,
      need_coin => 0,
      need_item => [{22010, 1}, {20327, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22010, 1}, {20327, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12009, 1, 1}) ->
    #{next_id => 12030, need_lev => 110, next_lev => 110,
      need_coin => 0,
      need_item => [{22010, 1}, {20327, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22010, 1}, {20327, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12012, 1, 1}) ->
    #{next_id => 12033, need_lev => 115, next_lev => 110,
      need_coin => 0,
      need_item => [{22010, 1}, {20317, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22010, 1}, {20317, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12010, 1, 1}) ->
    #{next_id => 12031, need_lev => 115, next_lev => 110,
      need_coin => 0,
      need_item => [{22010, 1}, {20317, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22010, 1}, {20317, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12011, 1, 1}) ->
    #{next_id => 12032, need_lev => 115, next_lev => 110,
      need_coin => 0,
      need_item => [{22010, 1}, {20317, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22010, 1}, {20317, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12002, 1, 2}) ->
    #{next_id => 12022, need_lev => 115, next_lev => 110,
      need_coin => 0,
      need_item => [{22011, 1}, {20317, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22011, 1}, {20317, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12006, 1, 2}) ->
    #{next_id => 12027, need_lev => 110, next_lev => 110,
      need_coin => 0,
      need_item => [{22011, 1}, {20327, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22011, 1}, {20327, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12007, 1, 2}) ->
    #{next_id => 12028, need_lev => 110, next_lev => 110,
      need_coin => 0,
      need_item => [{22011, 1}, {20327, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22011, 1}, {20327, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12008, 1, 2}) ->
    #{next_id => 12029, need_lev => 110, next_lev => 110,
      need_coin => 0,
      need_item => [{22011, 1}, {20327, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22011, 1}, {20327, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12009, 1, 2}) ->
    #{next_id => 12030, need_lev => 110, next_lev => 110,
      need_coin => 0,
      need_item => [{22011, 1}, {20327, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22011, 1}, {20327, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12012, 1, 2}) ->
    #{next_id => 12033, need_lev => 115, next_lev => 110,
      need_coin => 0,
      need_item => [{22011, 1}, {20317, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22011, 1}, {20317, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12010, 1, 2}) ->
    #{next_id => 12031, need_lev => 115, next_lev => 110,
      need_coin => 0,
      need_item => [{22011, 1}, {20317, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22011, 1}, {20317, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12011, 1, 2}) ->
    #{next_id => 12032, need_lev => 115, next_lev => 110,
      need_coin => 0,
      need_item => [{22011, 1}, {20317, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22011, 1}, {20317, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12003, 1, 3}) ->
    #{next_id => 12023, need_lev => 115, next_lev => 110,
      need_coin => 0,
      need_item => [{22012, 1}, {20317, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22012, 1}, {20317, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12006, 1, 3}) ->
    #{next_id => 12027, need_lev => 110, next_lev => 110,
      need_coin => 0,
      need_item => [{22012, 1}, {20327, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22012, 1}, {20327, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12007, 1, 3}) ->
    #{next_id => 12028, need_lev => 110, next_lev => 110,
      need_coin => 0,
      need_item => [{22012, 1}, {20327, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22012, 1}, {20327, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12008, 1, 3}) ->
    #{next_id => 12029, need_lev => 110, next_lev => 110,
      need_coin => 0,
      need_item => [{22012, 1}, {20327, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22012, 1}, {20327, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12009, 1, 3}) ->
    #{next_id => 12030, need_lev => 110, next_lev => 110,
      need_coin => 0,
      need_item => [{22012, 1}, {20327, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22012, 1}, {20327, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12012, 1, 3}) ->
    #{next_id => 12033, need_lev => 115, next_lev => 110,
      need_coin => 0,
      need_item => [{22012, 1}, {20317, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22012, 1}, {20317, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12010, 1, 3}) ->
    #{next_id => 12031, need_lev => 115, next_lev => 110,
      need_coin => 0,
      need_item => [{22012, 1}, {20317, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22012, 1}, {20317, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12011, 1, 3}) ->
    #{next_id => 12032, need_lev => 115, next_lev => 110,
      need_coin => 0,
      need_item => [{22012, 1}, {20317, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22012, 1}, {20317, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12004, 1, 4}) ->
    #{next_id => 12024, need_lev => 115, next_lev => 110,
      need_coin => 0,
      need_item => [{22013, 1}, {20317, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22013, 1}, {20317, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12006, 1, 4}) ->
    #{next_id => 12027, need_lev => 110, next_lev => 110,
      need_coin => 0,
      need_item => [{22013, 1}, {20327, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22013, 1}, {20327, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12007, 1, 4}) ->
    #{next_id => 12028, need_lev => 110, next_lev => 110,
      need_coin => 0,
      need_item => [{22013, 1}, {20327, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22013, 1}, {20327, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12008, 1, 4}) ->
    #{next_id => 12029, need_lev => 110, next_lev => 110,
      need_coin => 0,
      need_item => [{22013, 1}, {20327, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22013, 1}, {20327, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12009, 1, 4}) ->
    #{next_id => 12030, need_lev => 110, next_lev => 110,
      need_coin => 0,
      need_item => [{22013, 1}, {20327, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22013, 1}, {20327, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12012, 1, 4}) ->
    #{next_id => 12033, need_lev => 115, next_lev => 110,
      need_coin => 0,
      need_item => [{22013, 1}, {20317, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22013, 1}, {20317, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12010, 1, 4}) ->
    #{next_id => 12031, need_lev => 115, next_lev => 110,
      need_coin => 0,
      need_item => [{22013, 1}, {20317, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22013, 1}, {20317, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12011, 1, 4}) ->
    #{next_id => 12032, need_lev => 115, next_lev => 110,
      need_coin => 0,
      need_item => [{22013, 1}, {20317, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22013, 1}, {20317, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12005, 1, 5}) ->
    #{next_id => 12025, need_lev => 115, next_lev => 110,
      need_coin => 0,
      need_item => [{22014, 1}, {20317, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22014, 1}, {20317, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12006, 1, 5}) ->
    #{next_id => 12027, need_lev => 110, next_lev => 110,
      need_coin => 0,
      need_item => [{22014, 1}, {20327, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22014, 1}, {20327, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12007, 1, 5}) ->
    #{next_id => 12028, need_lev => 110, next_lev => 110,
      need_coin => 0,
      need_item => [{22014, 1}, {20327, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22014, 1}, {20327, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12008, 1, 5}) ->
    #{next_id => 12029, need_lev => 110, next_lev => 110,
      need_coin => 0,
      need_item => [{22014, 1}, {20327, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22014, 1}, {20327, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12009, 1, 5}) ->
    #{next_id => 12030, need_lev => 110, next_lev => 110,
      need_coin => 0,
      need_item => [{22014, 1}, {20327, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22014, 1}, {20327, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12012, 1, 5}) ->
    #{next_id => 12033, need_lev => 115, next_lev => 110,
      need_coin => 0,
      need_item => [{22014, 1}, {20317, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22014, 1}, {20317, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12010, 1, 5}) ->
    #{next_id => 12031, need_lev => 115, next_lev => 110,
      need_coin => 0,
      need_item => [{22014, 1}, {20317, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22014, 1}, {20317, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12011, 1, 5}) ->
    #{next_id => 12032, need_lev => 115, next_lev => 110,
      need_coin => 0,
      need_item => [{22014, 1}, {20317, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22014, 1}, {20317, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12014, 0, 7}) ->
    #{next_id => 12020, need_lev => 115, next_lev => 110,
      need_coin => 0,
      need_item => [{21975, 1}, {20317, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21975, 1}, {20317, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12006, 0, 7}) ->
    #{next_id => 12027, need_lev => 110, next_lev => 110,
      need_coin => 0,
      need_item => [{21975, 1}, {20327, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21975, 1}, {20327, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12007, 0, 7}) ->
    #{next_id => 12028, need_lev => 110, next_lev => 110,
      need_coin => 0,
      need_item => [{21975, 1}, {20327, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21975, 1}, {20327, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12008, 0, 7}) ->
    #{next_id => 12029, need_lev => 110, next_lev => 110,
      need_coin => 0,
      need_item => [{21975, 1}, {20327, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21975, 1}, {20327, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12009, 0, 7}) ->
    #{next_id => 12030, need_lev => 110, next_lev => 110,
      need_coin => 0,
      need_item => [{21975, 1}, {20327, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21975, 1}, {20327, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12012, 0, 7}) ->
    #{next_id => 12033, need_lev => 115, next_lev => 110,
      need_coin => 0,
      need_item => [{21975, 1}, {20317, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21975, 1}, {20317, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12010, 0, 7}) ->
    #{next_id => 12031, need_lev => 115, next_lev => 110,
      need_coin => 0,
      need_item => [{21975, 1}, {20317, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21975, 1}, {20317, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12011, 0, 7}) ->
    #{next_id => 12032, need_lev => 115, next_lev => 110,
      need_coin => 0,
      need_item => [{21975, 1}, {20317, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{21975, 1}, {20317, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12013, 0, 6}) ->
    #{next_id => 12026, need_lev => 115, next_lev => 110,
      need_coin => 0,
      need_item => [{22021, 1}, {20317, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22021, 1}, {20317, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12006, 0, 6}) ->
    #{next_id => 12027, need_lev => 110, next_lev => 110,
      need_coin => 0,
      need_item => [{22021, 1}, {20327, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22021, 1}, {20327, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12007, 0, 6}) ->
    #{next_id => 12028, need_lev => 110, next_lev => 110,
      need_coin => 0,
      need_item => [{22021, 1}, {20327, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22021, 1}, {20327, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12008, 0, 6}) ->
    #{next_id => 12029, need_lev => 110, next_lev => 110,
      need_coin => 0,
      need_item => [{22021, 1}, {20327, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22021, 1}, {20327, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12009, 0, 6}) ->
    #{next_id => 12030, need_lev => 110, next_lev => 110,
      need_coin => 0,
      need_item => [{22021, 1}, {20327, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22021, 1}, {20327, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12012, 0, 6}) ->
    #{next_id => 12033, need_lev => 115, next_lev => 110,
      need_coin => 0,
      need_item => [{22021, 1}, {20317, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22021, 1}, {20317, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12010, 0, 6}) ->
    #{next_id => 12031, need_lev => 115, next_lev => 110,
      need_coin => 0,
      need_item => [{22021, 1}, {20317, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22021, 1}, {20317, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12011, 0, 6}) ->
    #{next_id => 12032, need_lev => 115, next_lev => 110,
      need_coin => 0,
      need_item => [{22021, 1}, {20317, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22021, 1}, {20317, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12001, 0, 1}) ->
    #{next_id => 12021, need_lev => 115, next_lev => 110,
      need_coin => 0,
      need_item => [{22016, 1}, {20317, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22016, 1}, {20317, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12006, 0, 1}) ->
    #{next_id => 12027, need_lev => 110, next_lev => 110,
      need_coin => 0,
      need_item => [{22016, 1}, {20327, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22016, 1}, {20327, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12007, 0, 1}) ->
    #{next_id => 12028, need_lev => 110, next_lev => 110,
      need_coin => 0,
      need_item => [{22016, 1}, {20327, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22016, 1}, {20327, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12008, 0, 1}) ->
    #{next_id => 12029, need_lev => 110, next_lev => 110,
      need_coin => 0,
      need_item => [{22016, 1}, {20327, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22016, 1}, {20327, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12009, 0, 1}) ->
    #{next_id => 12030, need_lev => 110, next_lev => 110,
      need_coin => 0,
      need_item => [{22016, 1}, {20327, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22016, 1}, {20327, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12012, 0, 1}) ->
    #{next_id => 12033, need_lev => 115, next_lev => 110,
      need_coin => 0,
      need_item => [{22016, 1}, {20317, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22016, 1}, {20317, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12010, 0, 1}) ->
    #{next_id => 12031, need_lev => 115, next_lev => 110,
      need_coin => 0,
      need_item => [{22016, 1}, {20317, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22016, 1}, {20317, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12011, 0, 1}) ->
    #{next_id => 12032, need_lev => 115, next_lev => 110,
      need_coin => 0,
      need_item => [{22016, 1}, {20317, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22016, 1}, {20317, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12002, 0, 2}) ->
    #{next_id => 12022, need_lev => 115, next_lev => 110,
      need_coin => 0,
      need_item => [{22017, 1}, {20317, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22017, 1}, {20317, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12006, 0, 2}) ->
    #{next_id => 12027, need_lev => 110, next_lev => 110,
      need_coin => 0,
      need_item => [{22017, 1}, {20327, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22017, 1}, {20327, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12007, 0, 2}) ->
    #{next_id => 12028, need_lev => 110, next_lev => 110,
      need_coin => 0,
      need_item => [{22017, 1}, {20327, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22017, 1}, {20327, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12008, 0, 2}) ->
    #{next_id => 12029, need_lev => 110, next_lev => 110,
      need_coin => 0,
      need_item => [{22017, 1}, {20327, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22017, 1}, {20327, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12009, 0, 2}) ->
    #{next_id => 12030, need_lev => 110, next_lev => 110,
      need_coin => 0,
      need_item => [{22017, 1}, {20327, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22017, 1}, {20327, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12012, 0, 2}) ->
    #{next_id => 12033, need_lev => 115, next_lev => 110,
      need_coin => 0,
      need_item => [{22017, 1}, {20317, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22017, 1}, {20317, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12010, 0, 2}) ->
    #{next_id => 12031, need_lev => 115, next_lev => 110,
      need_coin => 0,
      need_item => [{22017, 1}, {20317, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22017, 1}, {20317, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12011, 0, 2}) ->
    #{next_id => 12032, need_lev => 115, next_lev => 110,
      need_coin => 0,
      need_item => [{22017, 1}, {20317, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22017, 1}, {20317, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12003, 0, 3}) ->
    #{next_id => 12023, need_lev => 115, next_lev => 110,
      need_coin => 0,
      need_item => [{22018, 1}, {20317, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22018, 1}, {20317, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12006, 0, 3}) ->
    #{next_id => 12027, need_lev => 110, next_lev => 110,
      need_coin => 0,
      need_item => [{22018, 1}, {20327, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22018, 1}, {20327, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12007, 0, 3}) ->
    #{next_id => 12028, need_lev => 110, next_lev => 110,
      need_coin => 0,
      need_item => [{22018, 1}, {20327, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22018, 1}, {20327, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12008, 0, 3}) ->
    #{next_id => 12029, need_lev => 110, next_lev => 110,
      need_coin => 0,
      need_item => [{22018, 1}, {20327, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22018, 1}, {20327, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12009, 0, 3}) ->
    #{next_id => 12030, need_lev => 110, next_lev => 110,
      need_coin => 0,
      need_item => [{22018, 1}, {20327, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22018, 1}, {20327, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12012, 0, 3}) ->
    #{next_id => 12033, need_lev => 115, next_lev => 110,
      need_coin => 0,
      need_item => [{22018, 1}, {20317, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22018, 1}, {20317, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12010, 0, 3}) ->
    #{next_id => 12031, need_lev => 115, next_lev => 110,
      need_coin => 0,
      need_item => [{22018, 1}, {20317, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22018, 1}, {20317, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12011, 0, 3}) ->
    #{next_id => 12032, need_lev => 115, next_lev => 110,
      need_coin => 0,
      need_item => [{22018, 1}, {20317, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22018, 1}, {20317, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12004, 0, 4}) ->
    #{next_id => 12024, need_lev => 115, next_lev => 110,
      need_coin => 0,
      need_item => [{22019, 1}, {20317, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22019, 1}, {20317, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12006, 0, 4}) ->
    #{next_id => 12027, need_lev => 110, next_lev => 110,
      need_coin => 0,
      need_item => [{22019, 1}, {20327, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22019, 1}, {20327, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12007, 0, 4}) ->
    #{next_id => 12028, need_lev => 110, next_lev => 110,
      need_coin => 0,
      need_item => [{22019, 1}, {20327, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22019, 1}, {20327, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12008, 0, 4}) ->
    #{next_id => 12029, need_lev => 110, next_lev => 110,
      need_coin => 0,
      need_item => [{22019, 1}, {20327, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22019, 1}, {20327, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12009, 0, 4}) ->
    #{next_id => 12030, need_lev => 110, next_lev => 110,
      need_coin => 0,
      need_item => [{22019, 1}, {20327, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22019, 1}, {20327, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12012, 0, 4}) ->
    #{next_id => 12033, need_lev => 115, next_lev => 110,
      need_coin => 0,
      need_item => [{22019, 1}, {20317, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22019, 1}, {20317, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12010, 0, 4}) ->
    #{next_id => 12031, need_lev => 115, next_lev => 110,
      need_coin => 0,
      need_item => [{22019, 1}, {20317, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22019, 1}, {20317, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12011, 0, 4}) ->
    #{next_id => 12032, need_lev => 115, next_lev => 110,
      need_coin => 0,
      need_item => [{22019, 1}, {20317, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22019, 1}, {20317, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12005, 0, 5}) ->
    #{next_id => 12025, need_lev => 115, next_lev => 110,
      need_coin => 0,
      need_item => [{22020, 1}, {20317, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22020, 1}, {20317, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12006, 0, 5}) ->
    #{next_id => 12027, need_lev => 110, next_lev => 110,
      need_coin => 0,
      need_item => [{22020, 1}, {20327, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22020, 1}, {20327, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12007, 0, 5}) ->
    #{next_id => 12028, need_lev => 110, next_lev => 110,
      need_coin => 0,
      need_item => [{22020, 1}, {20327, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22020, 1}, {20327, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12008, 0, 5}) ->
    #{next_id => 12029, need_lev => 110, next_lev => 110,
      need_coin => 0,
      need_item => [{22020, 1}, {20327, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22020, 1}, {20327, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12009, 0, 5}) ->
    #{next_id => 12030, need_lev => 110, next_lev => 110,
      need_coin => 0,
      need_item => [{22020, 1}, {20327, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22020, 1}, {20327, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12012, 0, 5}) ->
    #{next_id => 12033, need_lev => 115, next_lev => 110,
      need_coin => 0,
      need_item => [{22020, 1}, {20317, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22020, 1}, {20317, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12010, 0, 5}) ->
    #{next_id => 12031, need_lev => 115, next_lev => 110,
      need_coin => 0,
      need_item => [{22020, 1}, {20317, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22020, 1}, {20317, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12011, 0, 5}) ->
    #{next_id => 12032, need_lev => 115, next_lev => 110,
      need_coin => 0,
      need_item => [{22020, 1}, {20317, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22020, 1}, {20317, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12020, 1, 7}) ->
    #{next_id => 12106, need_lev => 125, next_lev => 120,
      need_coin => 0,
      need_item => [{22036, 1}, {20318, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22036, 1}, {20318, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12027, 1, 7}) ->
    #{next_id => 12107, need_lev => 120, next_lev => 120,
      need_coin => 0,
      need_item => [{22036, 1}, {20328, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22036, 1}, {20328, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12028, 1, 7}) ->
    #{next_id => 12108, need_lev => 120, next_lev => 120,
      need_coin => 0,
      need_item => [{22036, 1}, {20328, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22036, 1}, {20328, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12029, 1, 7}) ->
    #{next_id => 12109, need_lev => 120, next_lev => 120,
      need_coin => 0,
      need_item => [{22036, 1}, {20328, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22036, 1}, {20328, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12030, 1, 7}) ->
    #{next_id => 12110, need_lev => 120, next_lev => 120,
      need_coin => 0,
      need_item => [{22036, 1}, {20328, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22036, 1}, {20328, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12033, 1, 7}) ->
    #{next_id => 12113, need_lev => 125, next_lev => 120,
      need_coin => 0,
      need_item => [{22036, 1}, {20318, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22036, 1}, {20318, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12031, 1, 7}) ->
    #{next_id => 12111, need_lev => 125, next_lev => 120,
      need_coin => 0,
      need_item => [{22036, 1}, {20318, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22036, 1}, {20318, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12032, 1, 7}) ->
    #{next_id => 12112, need_lev => 125, next_lev => 120,
      need_coin => 0,
      need_item => [{22036, 1}, {20318, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22036, 1}, {20318, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12026, 1, 6}) ->
    #{next_id => 12105, need_lev => 125, next_lev => 120,
      need_coin => 0,
      need_item => [{22035, 1}, {20318, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22035, 1}, {20318, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12027, 1, 6}) ->
    #{next_id => 12107, need_lev => 120, next_lev => 120,
      need_coin => 0,
      need_item => [{22035, 1}, {20328, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22035, 1}, {20328, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12028, 1, 6}) ->
    #{next_id => 12108, need_lev => 120, next_lev => 120,
      need_coin => 0,
      need_item => [{22035, 1}, {20328, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22035, 1}, {20328, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12029, 1, 6}) ->
    #{next_id => 12109, need_lev => 120, next_lev => 120,
      need_coin => 0,
      need_item => [{22035, 1}, {20328, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22035, 1}, {20328, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12030, 1, 6}) ->
    #{next_id => 12110, need_lev => 120, next_lev => 120,
      need_coin => 0,
      need_item => [{22035, 1}, {20328, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22035, 1}, {20328, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12033, 1, 6}) ->
    #{next_id => 12113, need_lev => 125, next_lev => 120,
      need_coin => 0,
      need_item => [{22035, 1}, {20318, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22035, 1}, {20318, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12031, 1, 6}) ->
    #{next_id => 12111, need_lev => 125, next_lev => 120,
      need_coin => 0,
      need_item => [{22035, 1}, {20318, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22035, 1}, {20318, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12032, 1, 6}) ->
    #{next_id => 12112, need_lev => 125, next_lev => 120,
      need_coin => 0,
      need_item => [{22035, 1}, {20318, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22035, 1}, {20318, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12021, 1, 1}) ->
    #{next_id => 12100, need_lev => 125, next_lev => 120,
      need_coin => 0,
      need_item => [{22030, 1}, {20318, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22030, 1}, {20318, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12027, 1, 1}) ->
    #{next_id => 12107, need_lev => 120, next_lev => 120,
      need_coin => 0,
      need_item => [{22030, 1}, {20328, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22030, 1}, {20328, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12028, 1, 1}) ->
    #{next_id => 12108, need_lev => 120, next_lev => 120,
      need_coin => 0,
      need_item => [{22030, 1}, {20328, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22030, 1}, {20328, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12029, 1, 1}) ->
    #{next_id => 12109, need_lev => 120, next_lev => 120,
      need_coin => 0,
      need_item => [{22030, 1}, {20328, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22030, 1}, {20328, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12030, 1, 1}) ->
    #{next_id => 12110, need_lev => 120, next_lev => 120,
      need_coin => 0,
      need_item => [{22030, 1}, {20328, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22030, 1}, {20328, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12033, 1, 1}) ->
    #{next_id => 12113, need_lev => 125, next_lev => 120,
      need_coin => 0,
      need_item => [{22030, 1}, {20318, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22030, 1}, {20318, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12031, 1, 1}) ->
    #{next_id => 12111, need_lev => 125, next_lev => 120,
      need_coin => 0,
      need_item => [{22030, 1}, {20318, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22030, 1}, {20318, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12032, 1, 1}) ->
    #{next_id => 12112, need_lev => 125, next_lev => 120,
      need_coin => 0,
      need_item => [{22030, 1}, {20318, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22030, 1}, {20318, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12022, 1, 2}) ->
    #{next_id => 12101, need_lev => 125, next_lev => 120,
      need_coin => 0,
      need_item => [{22031, 1}, {20318, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22031, 1}, {20318, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12027, 1, 2}) ->
    #{next_id => 12107, need_lev => 120, next_lev => 120,
      need_coin => 0,
      need_item => [{22031, 1}, {20328, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22031, 1}, {20328, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12028, 1, 2}) ->
    #{next_id => 12108, need_lev => 120, next_lev => 120,
      need_coin => 0,
      need_item => [{22031, 1}, {20328, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22031, 1}, {20328, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12029, 1, 2}) ->
    #{next_id => 12109, need_lev => 120, next_lev => 120,
      need_coin => 0,
      need_item => [{22031, 1}, {20328, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22031, 1}, {20328, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12030, 1, 2}) ->
    #{next_id => 12110, need_lev => 120, next_lev => 120,
      need_coin => 0,
      need_item => [{22031, 1}, {20328, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22031, 1}, {20328, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12033, 1, 2}) ->
    #{next_id => 12113, need_lev => 125, next_lev => 120,
      need_coin => 0,
      need_item => [{22031, 1}, {20318, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22031, 1}, {20318, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12031, 1, 2}) ->
    #{next_id => 12111, need_lev => 125, next_lev => 120,
      need_coin => 0,
      need_item => [{22031, 1}, {20318, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22031, 1}, {20318, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12032, 1, 2}) ->
    #{next_id => 12112, need_lev => 125, next_lev => 120,
      need_coin => 0,
      need_item => [{22031, 1}, {20318, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22031, 1}, {20318, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12023, 1, 3}) ->
    #{next_id => 12102, need_lev => 125, next_lev => 120,
      need_coin => 0,
      need_item => [{22032, 1}, {20318, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22032, 1}, {20318, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12027, 1, 3}) ->
    #{next_id => 12107, need_lev => 120, next_lev => 120,
      need_coin => 0,
      need_item => [{22032, 1}, {20328, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22032, 1}, {20328, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12028, 1, 3}) ->
    #{next_id => 12108, need_lev => 120, next_lev => 120,
      need_coin => 0,
      need_item => [{22032, 1}, {20328, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22032, 1}, {20328, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12029, 1, 3}) ->
    #{next_id => 12109, need_lev => 120, next_lev => 120,
      need_coin => 0,
      need_item => [{22032, 1}, {20328, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22032, 1}, {20328, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12030, 1, 3}) ->
    #{next_id => 12110, need_lev => 120, next_lev => 120,
      need_coin => 0,
      need_item => [{22032, 1}, {20328, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22032, 1}, {20328, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12033, 1, 3}) ->
    #{next_id => 12113, need_lev => 125, next_lev => 120,
      need_coin => 0,
      need_item => [{22032, 1}, {20318, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22032, 1}, {20318, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12031, 1, 3}) ->
    #{next_id => 12111, need_lev => 125, next_lev => 120,
      need_coin => 0,
      need_item => [{22032, 1}, {20318, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22032, 1}, {20318, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12032, 1, 3}) ->
    #{next_id => 12112, need_lev => 125, next_lev => 120,
      need_coin => 0,
      need_item => [{22032, 1}, {20318, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22032, 1}, {20318, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12024, 1, 4}) ->
    #{next_id => 12103, need_lev => 125, next_lev => 120,
      need_coin => 0,
      need_item => [{22033, 1}, {20318, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22033, 1}, {20318, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12027, 1, 4}) ->
    #{next_id => 12107, need_lev => 120, next_lev => 120,
      need_coin => 0,
      need_item => [{22033, 1}, {20328, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22033, 1}, {20328, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12028, 1, 4}) ->
    #{next_id => 12108, need_lev => 120, next_lev => 120,
      need_coin => 0,
      need_item => [{22033, 1}, {20328, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22033, 1}, {20328, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12029, 1, 4}) ->
    #{next_id => 12109, need_lev => 120, next_lev => 120,
      need_coin => 0,
      need_item => [{22033, 1}, {20328, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22033, 1}, {20328, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12030, 1, 4}) ->
    #{next_id => 12110, need_lev => 120, next_lev => 120,
      need_coin => 0,
      need_item => [{22033, 1}, {20328, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22033, 1}, {20328, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12033, 1, 4}) ->
    #{next_id => 12113, need_lev => 125, next_lev => 120,
      need_coin => 0,
      need_item => [{22033, 1}, {20318, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22033, 1}, {20318, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12031, 1, 4}) ->
    #{next_id => 12111, need_lev => 125, next_lev => 120,
      need_coin => 0,
      need_item => [{22033, 1}, {20318, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22033, 1}, {20318, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12032, 1, 4}) ->
    #{next_id => 12112, need_lev => 125, next_lev => 120,
      need_coin => 0,
      need_item => [{22033, 1}, {20318, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22033, 1}, {20318, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12025, 1, 5}) ->
    #{next_id => 12104, need_lev => 125, next_lev => 120,
      need_coin => 0,
      need_item => [{22034, 1}, {20318, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22034, 1}, {20318, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12027, 1, 5}) ->
    #{next_id => 12107, need_lev => 120, next_lev => 120,
      need_coin => 0,
      need_item => [{22034, 1}, {20328, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22034, 1}, {20328, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12028, 1, 5}) ->
    #{next_id => 12108, need_lev => 120, next_lev => 120,
      need_coin => 0,
      need_item => [{22034, 1}, {20328, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22034, 1}, {20328, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12029, 1, 5}) ->
    #{next_id => 12109, need_lev => 120, next_lev => 120,
      need_coin => 0,
      need_item => [{22034, 1}, {20328, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22034, 1}, {20328, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12030, 1, 5}) ->
    #{next_id => 12110, need_lev => 120, next_lev => 120,
      need_coin => 0,
      need_item => [{22034, 1}, {20328, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22034, 1}, {20328, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12033, 1, 5}) ->
    #{next_id => 12113, need_lev => 125, next_lev => 120,
      need_coin => 0,
      need_item => [{22034, 1}, {20318, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22034, 1}, {20318, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12031, 1, 5}) ->
    #{next_id => 12111, need_lev => 125, next_lev => 120,
      need_coin => 0,
      need_item => [{22034, 1}, {20318, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22034, 1}, {20318, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12032, 1, 5}) ->
    #{next_id => 12112, need_lev => 125, next_lev => 120,
      need_coin => 0,
      need_item => [{22034, 1}, {20318, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22034, 1}, {20318, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12020, 0, 7}) ->
    #{next_id => 12106, need_lev => 125, next_lev => 120,
      need_coin => 0,
      need_item => [{22043, 1}, {20318, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22043, 1}, {20318, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12027, 0, 7}) ->
    #{next_id => 12107, need_lev => 120, next_lev => 120,
      need_coin => 0,
      need_item => [{22043, 1}, {20328, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22043, 1}, {20328, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12028, 0, 7}) ->
    #{next_id => 12108, need_lev => 120, next_lev => 120,
      need_coin => 0,
      need_item => [{22043, 1}, {20328, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22043, 1}, {20328, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12029, 0, 7}) ->
    #{next_id => 12109, need_lev => 120, next_lev => 120,
      need_coin => 0,
      need_item => [{22043, 1}, {20328, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22043, 1}, {20328, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12030, 0, 7}) ->
    #{next_id => 12110, need_lev => 120, next_lev => 120,
      need_coin => 0,
      need_item => [{22043, 1}, {20328, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22043, 1}, {20328, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12033, 0, 7}) ->
    #{next_id => 12113, need_lev => 125, next_lev => 120,
      need_coin => 0,
      need_item => [{22043, 1}, {20318, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22043, 1}, {20318, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12031, 0, 7}) ->
    #{next_id => 12111, need_lev => 125, next_lev => 120,
      need_coin => 0,
      need_item => [{22043, 1}, {20318, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22043, 1}, {20318, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12032, 0, 7}) ->
    #{next_id => 12112, need_lev => 125, next_lev => 120,
      need_coin => 0,
      need_item => [{22043, 1}, {20318, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22043, 1}, {20318, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12026, 0, 6}) ->
    #{next_id => 12105, need_lev => 125, next_lev => 120,
      need_coin => 0,
      need_item => [{22042, 1}, {20318, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22042, 1}, {20318, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12027, 0, 6}) ->
    #{next_id => 12107, need_lev => 120, next_lev => 120,
      need_coin => 0,
      need_item => [{22042, 1}, {20328, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22042, 1}, {20328, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12028, 0, 6}) ->
    #{next_id => 12108, need_lev => 120, next_lev => 120,
      need_coin => 0,
      need_item => [{22042, 1}, {20328, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22042, 1}, {20328, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12029, 0, 6}) ->
    #{next_id => 12109, need_lev => 120, next_lev => 120,
      need_coin => 0,
      need_item => [{22042, 1}, {20328, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22042, 1}, {20328, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12030, 0, 6}) ->
    #{next_id => 12110, need_lev => 120, next_lev => 120,
      need_coin => 0,
      need_item => [{22042, 1}, {20328, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22042, 1}, {20328, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12033, 0, 6}) ->
    #{next_id => 12113, need_lev => 125, next_lev => 120,
      need_coin => 0,
      need_item => [{22042, 1}, {20318, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22042, 1}, {20318, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12031, 0, 6}) ->
    #{next_id => 12111, need_lev => 125, next_lev => 120,
      need_coin => 0,
      need_item => [{22042, 1}, {20318, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22042, 1}, {20318, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12032, 0, 6}) ->
    #{next_id => 12112, need_lev => 125, next_lev => 120,
      need_coin => 0,
      need_item => [{22042, 1}, {20318, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22042, 1}, {20318, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12021, 0, 1}) ->
    #{next_id => 12100, need_lev => 125, next_lev => 120,
      need_coin => 0,
      need_item => [{22037, 1}, {20318, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22037, 1}, {20318, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12027, 0, 1}) ->
    #{next_id => 12107, need_lev => 120, next_lev => 120,
      need_coin => 0,
      need_item => [{22037, 1}, {20328, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22037, 1}, {20328, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12028, 0, 1}) ->
    #{next_id => 12108, need_lev => 120, next_lev => 120,
      need_coin => 0,
      need_item => [{22037, 1}, {20328, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22037, 1}, {20328, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12029, 0, 1}) ->
    #{next_id => 12109, need_lev => 120, next_lev => 120,
      need_coin => 0,
      need_item => [{22037, 1}, {20328, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22037, 1}, {20328, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12030, 0, 1}) ->
    #{next_id => 12110, need_lev => 120, next_lev => 120,
      need_coin => 0,
      need_item => [{22037, 1}, {20328, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22037, 1}, {20328, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12033, 0, 1}) ->
    #{next_id => 12113, need_lev => 125, next_lev => 120,
      need_coin => 0,
      need_item => [{22037, 1}, {20318, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22037, 1}, {20318, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12031, 0, 1}) ->
    #{next_id => 12111, need_lev => 125, next_lev => 120,
      need_coin => 0,
      need_item => [{22037, 1}, {20318, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22037, 1}, {20318, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12032, 0, 1}) ->
    #{next_id => 12112, need_lev => 125, next_lev => 120,
      need_coin => 0,
      need_item => [{22037, 1}, {20318, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22037, 1}, {20318, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12022, 0, 2}) ->
    #{next_id => 12101, need_lev => 125, next_lev => 120,
      need_coin => 0,
      need_item => [{22038, 1}, {20318, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22038, 1}, {20318, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12027, 0, 2}) ->
    #{next_id => 12107, need_lev => 120, next_lev => 120,
      need_coin => 0,
      need_item => [{22038, 1}, {20328, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22038, 1}, {20328, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12028, 0, 2}) ->
    #{next_id => 12108, need_lev => 120, next_lev => 120,
      need_coin => 0,
      need_item => [{22038, 1}, {20328, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22038, 1}, {20328, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12029, 0, 2}) ->
    #{next_id => 12109, need_lev => 120, next_lev => 120,
      need_coin => 0,
      need_item => [{22038, 1}, {20328, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22038, 1}, {20328, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12030, 0, 2}) ->
    #{next_id => 12110, need_lev => 120, next_lev => 120,
      need_coin => 0,
      need_item => [{22038, 1}, {20328, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22038, 1}, {20328, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12033, 0, 2}) ->
    #{next_id => 12113, need_lev => 125, next_lev => 120,
      need_coin => 0,
      need_item => [{22038, 1}, {20318, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22038, 1}, {20318, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12031, 0, 2}) ->
    #{next_id => 12111, need_lev => 125, next_lev => 120,
      need_coin => 0,
      need_item => [{22038, 1}, {20318, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22038, 1}, {20318, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12032, 0, 2}) ->
    #{next_id => 12112, need_lev => 125, next_lev => 120,
      need_coin => 0,
      need_item => [{22038, 1}, {20318, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22038, 1}, {20318, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12023, 0, 3}) ->
    #{next_id => 12102, need_lev => 125, next_lev => 120,
      need_coin => 0,
      need_item => [{22039, 1}, {20318, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22039, 1}, {20318, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12027, 0, 3}) ->
    #{next_id => 12107, need_lev => 120, next_lev => 120,
      need_coin => 0,
      need_item => [{22039, 1}, {20328, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22039, 1}, {20328, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12028, 0, 3}) ->
    #{next_id => 12108, need_lev => 120, next_lev => 120,
      need_coin => 0,
      need_item => [{22039, 1}, {20328, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22039, 1}, {20328, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12029, 0, 3}) ->
    #{next_id => 12109, need_lev => 120, next_lev => 120,
      need_coin => 0,
      need_item => [{22039, 1}, {20328, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22039, 1}, {20328, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12030, 0, 3}) ->
    #{next_id => 12110, need_lev => 120, next_lev => 120,
      need_coin => 0,
      need_item => [{22039, 1}, {20328, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22039, 1}, {20328, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12033, 0, 3}) ->
    #{next_id => 12113, need_lev => 125, next_lev => 120,
      need_coin => 0,
      need_item => [{22039, 1}, {20318, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22039, 1}, {20318, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12031, 0, 3}) ->
    #{next_id => 12111, need_lev => 125, next_lev => 120,
      need_coin => 0,
      need_item => [{22039, 1}, {20318, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22039, 1}, {20318, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12032, 0, 3}) ->
    #{next_id => 12112, need_lev => 125, next_lev => 120,
      need_coin => 0,
      need_item => [{22039, 1}, {20318, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22039, 1}, {20318, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12024, 0, 4}) ->
    #{next_id => 12103, need_lev => 125, next_lev => 120,
      need_coin => 0,
      need_item => [{22040, 1}, {20318, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22040, 1}, {20318, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12027, 0, 4}) ->
    #{next_id => 12107, need_lev => 120, next_lev => 120,
      need_coin => 0,
      need_item => [{22040, 1}, {20328, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22040, 1}, {20328, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12028, 0, 4}) ->
    #{next_id => 12108, need_lev => 120, next_lev => 120,
      need_coin => 0,
      need_item => [{22040, 1}, {20328, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22040, 1}, {20328, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12029, 0, 4}) ->
    #{next_id => 12109, need_lev => 120, next_lev => 120,
      need_coin => 0,
      need_item => [{22040, 1}, {20328, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22040, 1}, {20328, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12030, 0, 4}) ->
    #{next_id => 12110, need_lev => 120, next_lev => 120,
      need_coin => 0,
      need_item => [{22040, 1}, {20328, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22040, 1}, {20328, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12033, 0, 4}) ->
    #{next_id => 12113, need_lev => 125, next_lev => 120,
      need_coin => 0,
      need_item => [{22040, 1}, {20318, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22040, 1}, {20318, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12031, 0, 4}) ->
    #{next_id => 12111, need_lev => 125, next_lev => 120,
      need_coin => 0,
      need_item => [{22040, 1}, {20318, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22040, 1}, {20318, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12032, 0, 4}) ->
    #{next_id => 12112, need_lev => 125, next_lev => 120,
      need_coin => 0,
      need_item => [{22040, 1}, {20318, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22040, 1}, {20318, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12025, 0, 5}) ->
    #{next_id => 12104, need_lev => 125, next_lev => 120,
      need_coin => 0,
      need_item => [{22041, 1}, {20318, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22041, 1}, {20318, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12027, 0, 5}) ->
    #{next_id => 12107, need_lev => 120, next_lev => 120,
      need_coin => 0,
      need_item => [{22041, 1}, {20328, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22041, 1}, {20328, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12028, 0, 5}) ->
    #{next_id => 12108, need_lev => 120, next_lev => 120,
      need_coin => 0,
      need_item => [{22041, 1}, {20328, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22041, 1}, {20328, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12029, 0, 5}) ->
    #{next_id => 12109, need_lev => 120, next_lev => 120,
      need_coin => 0,
      need_item => [{22041, 1}, {20328, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22041, 1}, {20328, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12030, 0, 5}) ->
    #{next_id => 12110, need_lev => 120, next_lev => 120,
      need_coin => 0,
      need_item => [{22041, 1}, {20328, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22041, 1}, {20328, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12033, 0, 5}) ->
    #{next_id => 12113, need_lev => 125, next_lev => 120,
      need_coin => 0,
      need_item => [{22041, 1}, {20318, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22041, 1}, {20318, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12031, 0, 5}) ->
    #{next_id => 12111, need_lev => 125, next_lev => 120,
      need_coin => 0,
      need_item => [{22041, 1}, {20318, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22041, 1}, {20318, 1}, {20310, 0}],
      need_break_times => 1};
get_forge({12032, 0, 5}) ->
    #{next_id => 12112, need_lev => 125, next_lev => 120,
      need_coin => 0,
      need_item => [{22041, 1}, {20318, 1}, {20310, 0}],
      perfect_item => [{20094, 1}], make_up => [],
      low_lev_cost => [{22041, 1}, {20318, 1}, {20310, 0}],
      need_break_times => 1};
get_forge(_) -> false.

get_reset({1, 1, 40, 1}) ->
    #{loss_coin => 0, loss_item => [{20520, 1}, {20310, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({1, 1, 50, 1}) ->
    #{loss_coin => 0, loss_item => [{20525, 1}, {20311, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({1, 1, 60, 1}) ->
    #{loss_coin => 0, loss_item => [{20530, 1}, {20312, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({1, 1, 70, 1}) ->
    #{loss_coin => 0, loss_item => [{20535, 1}, {20313, 1}],
      eqm_reset_val => 6, lucky_val => 150};
get_reset({1, 1, 80, 1}) ->
    #{loss_coin => 0, loss_item => [{20540, 1}, {20314, 1}],
      eqm_reset_val => 10, lucky_val => 130};
get_reset({1, 1, 90, 1}) ->
    #{loss_coin => 0, loss_item => [{20555, 1}, {20315, 1}],
      eqm_reset_val => 12, lucky_val => 130};
get_reset({1, 6, 40, 1}) ->
    #{loss_coin => 0, loss_item => [{20520, 1}, {20310, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({1, 6, 50, 1}) ->
    #{loss_coin => 0, loss_item => [{20525, 1}, {20311, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({1, 6, 60, 1}) ->
    #{loss_coin => 0, loss_item => [{20530, 1}, {20312, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({1, 6, 70, 1}) ->
    #{loss_coin => 0, loss_item => [{20535, 1}, {20313, 1}],
      eqm_reset_val => 6, lucky_val => 150};
get_reset({1, 6, 80, 1}) ->
    #{loss_coin => 0, loss_item => [{20540, 1}, {20314, 1}],
      eqm_reset_val => 10, lucky_val => 130};
get_reset({1, 6, 90, 1}) ->
    #{loss_coin => 0, loss_item => [{20555, 1}, {20315, 1}],
      eqm_reset_val => 12, lucky_val => 130};
get_reset({1, 7, 40, 1}) ->
    #{loss_coin => 0, loss_item => [{20520, 1}, {20310, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({1, 7, 50, 1}) ->
    #{loss_coin => 0, loss_item => [{20525, 1}, {20311, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({1, 7, 60, 1}) ->
    #{loss_coin => 0, loss_item => [{20530, 1}, {20312, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({1, 7, 70, 1}) ->
    #{loss_coin => 0, loss_item => [{20535, 1}, {20313, 1}],
      eqm_reset_val => 6, lucky_val => 150};
get_reset({1, 7, 80, 1}) ->
    #{loss_coin => 0, loss_item => [{20540, 1}, {20314, 1}],
      eqm_reset_val => 10, lucky_val => 130};
get_reset({1, 7, 90, 1}) ->
    #{loss_coin => 0, loss_item => [{20555, 1}, {20315, 1}],
      eqm_reset_val => 12, lucky_val => 130};
get_reset({1, 9, 40, 1}) ->
    #{loss_coin => 0, loss_item => [{20520, 1}, {20310, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({1, 9, 50, 1}) ->
    #{loss_coin => 0, loss_item => [{20525, 1}, {20311, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({1, 9, 60, 1}) ->
    #{loss_coin => 0, loss_item => [{20530, 1}, {20312, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({1, 9, 70, 1}) ->
    #{loss_coin => 0, loss_item => [{20535, 1}, {20313, 1}],
      eqm_reset_val => 6, lucky_val => 150};
get_reset({1, 9, 80, 1}) ->
    #{loss_coin => 0, loss_item => [{20540, 1}, {20314, 1}],
      eqm_reset_val => 10, lucky_val => 130};
get_reset({1, 9, 90, 1}) ->
    #{loss_coin => 0, loss_item => [{20555, 1}, {20315, 1}],
      eqm_reset_val => 12, lucky_val => 130};
get_reset({1, 10, 40, 1}) ->
    #{loss_coin => 0, loss_item => [{20520, 1}, {20320, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({1, 10, 50, 1}) ->
    #{loss_coin => 0, loss_item => [{20525, 1}, {20321, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({1, 10, 60, 1}) ->
    #{loss_coin => 0, loss_item => [{20530, 1}, {20322, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({1, 10, 70, 1}) ->
    #{loss_coin => 0, loss_item => [{20535, 1}, {20323, 1}],
      eqm_reset_val => 6, lucky_val => 150};
get_reset({1, 10, 80, 1}) ->
    #{loss_coin => 0, loss_item => [{20540, 1}, {20324, 1}],
      eqm_reset_val => 10, lucky_val => 130};
get_reset({1, 10, 90, 1}) ->
    #{loss_coin => 0, loss_item => [{20555, 1}, {20325, 1}],
      eqm_reset_val => 12, lucky_val => 130};
get_reset({1, 11, 40, 1}) ->
    #{loss_coin => 0, loss_item => [{20520, 1}, {20320, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({1, 11, 50, 1}) ->
    #{loss_coin => 0, loss_item => [{20525, 1}, {20321, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({1, 11, 60, 1}) ->
    #{loss_coin => 0, loss_item => [{20530, 1}, {20322, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({1, 11, 70, 1}) ->
    #{loss_coin => 0, loss_item => [{20535, 1}, {20323, 1}],
      eqm_reset_val => 6, lucky_val => 150};
get_reset({1, 11, 80, 1}) ->
    #{loss_coin => 0, loss_item => [{20540, 1}, {20324, 1}],
      eqm_reset_val => 10, lucky_val => 130};
get_reset({1, 11, 90, 1}) ->
    #{loss_coin => 0, loss_item => [{20555, 1}, {20325, 1}],
      eqm_reset_val => 12, lucky_val => 130};
get_reset({1, 12, 40, 1}) ->
    #{loss_coin => 0, loss_item => [{20520, 1}, {20320, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({1, 12, 50, 1}) ->
    #{loss_coin => 0, loss_item => [{20525, 1}, {20321, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({1, 12, 60, 1}) ->
    #{loss_coin => 0, loss_item => [{20530, 1}, {20322, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({1, 12, 70, 1}) ->
    #{loss_coin => 0, loss_item => [{20535, 1}, {20323, 1}],
      eqm_reset_val => 6, lucky_val => 150};
get_reset({1, 12, 80, 1}) ->
    #{loss_coin => 0, loss_item => [{20540, 1}, {20324, 1}],
      eqm_reset_val => 10, lucky_val => 130};
get_reset({1, 12, 90, 1}) ->
    #{loss_coin => 0, loss_item => [{20555, 1}, {20325, 1}],
      eqm_reset_val => 12, lucky_val => 130};
get_reset({1, 14, 40, 1}) ->
    #{loss_coin => 0, loss_item => [{20520, 1}, {20320, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({1, 14, 50, 1}) ->
    #{loss_coin => 0, loss_item => [{20525, 1}, {20321, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({1, 14, 60, 1}) ->
    #{loss_coin => 0, loss_item => [{20530, 1}, {20322, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({1, 14, 70, 1}) ->
    #{loss_coin => 0, loss_item => [{20535, 1}, {20323, 1}],
      eqm_reset_val => 6, lucky_val => 150};
get_reset({1, 14, 80, 1}) ->
    #{loss_coin => 0, loss_item => [{20540, 1}, {20324, 1}],
      eqm_reset_val => 10, lucky_val => 130};
get_reset({1, 14, 90, 1}) ->
    #{loss_coin => 0, loss_item => [{20555, 1}, {20325, 1}],
      eqm_reset_val => 12, lucky_val => 130};
get_reset({2, 2, 40, 1}) ->
    #{loss_coin => 0, loss_item => [{20521, 1}, {20310, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({2, 2, 50, 1}) ->
    #{loss_coin => 0, loss_item => [{20526, 1}, {20311, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({2, 2, 60, 1}) ->
    #{loss_coin => 0, loss_item => [{20531, 1}, {20312, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({2, 2, 70, 1}) ->
    #{loss_coin => 0, loss_item => [{20536, 1}, {20313, 1}],
      eqm_reset_val => 6, lucky_val => 150};
get_reset({2, 2, 80, 1}) ->
    #{loss_coin => 0, loss_item => [{20541, 1}, {20314, 1}],
      eqm_reset_val => 10, lucky_val => 130};
get_reset({2, 2, 90, 1}) ->
    #{loss_coin => 0, loss_item => [{20556, 1}, {20315, 1}],
      eqm_reset_val => 12, lucky_val => 130};
get_reset({2, 6, 40, 1}) ->
    #{loss_coin => 0, loss_item => [{20521, 1}, {20310, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({2, 6, 50, 1}) ->
    #{loss_coin => 0, loss_item => [{20526, 1}, {20311, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({2, 6, 60, 1}) ->
    #{loss_coin => 0, loss_item => [{20531, 1}, {20312, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({2, 6, 70, 1}) ->
    #{loss_coin => 0, loss_item => [{20536, 1}, {20313, 1}],
      eqm_reset_val => 6, lucky_val => 150};
get_reset({2, 6, 80, 1}) ->
    #{loss_coin => 0, loss_item => [{20541, 1}, {20314, 1}],
      eqm_reset_val => 10, lucky_val => 130};
get_reset({2, 6, 90, 1}) ->
    #{loss_coin => 0, loss_item => [{20556, 1}, {20315, 1}],
      eqm_reset_val => 12, lucky_val => 130};
get_reset({2, 7, 40, 1}) ->
    #{loss_coin => 0, loss_item => [{20521, 1}, {20310, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({2, 7, 50, 1}) ->
    #{loss_coin => 0, loss_item => [{20526, 1}, {20311, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({2, 7, 60, 1}) ->
    #{loss_coin => 0, loss_item => [{20531, 1}, {20312, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({2, 7, 70, 1}) ->
    #{loss_coin => 0, loss_item => [{20536, 1}, {20313, 1}],
      eqm_reset_val => 6, lucky_val => 150};
get_reset({2, 7, 80, 1}) ->
    #{loss_coin => 0, loss_item => [{20541, 1}, {20314, 1}],
      eqm_reset_val => 10, lucky_val => 130};
get_reset({2, 7, 90, 1}) ->
    #{loss_coin => 0, loss_item => [{20556, 1}, {20315, 1}],
      eqm_reset_val => 12, lucky_val => 130};
get_reset({2, 9, 40, 1}) ->
    #{loss_coin => 0, loss_item => [{20521, 1}, {20310, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({2, 9, 50, 1}) ->
    #{loss_coin => 0, loss_item => [{20526, 1}, {20311, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({2, 9, 60, 1}) ->
    #{loss_coin => 0, loss_item => [{20531, 1}, {20312, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({2, 9, 70, 1}) ->
    #{loss_coin => 0, loss_item => [{20536, 1}, {20313, 1}],
      eqm_reset_val => 6, lucky_val => 150};
get_reset({2, 9, 80, 1}) ->
    #{loss_coin => 0, loss_item => [{20541, 1}, {20314, 1}],
      eqm_reset_val => 10, lucky_val => 130};
get_reset({2, 9, 90, 1}) ->
    #{loss_coin => 0, loss_item => [{20556, 1}, {20315, 1}],
      eqm_reset_val => 12, lucky_val => 130};
get_reset({2, 10, 40, 1}) ->
    #{loss_coin => 0, loss_item => [{20521, 1}, {20320, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({2, 10, 50, 1}) ->
    #{loss_coin => 0, loss_item => [{20526, 1}, {20321, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({2, 10, 60, 1}) ->
    #{loss_coin => 0, loss_item => [{20531, 1}, {20322, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({2, 10, 70, 1}) ->
    #{loss_coin => 0, loss_item => [{20536, 1}, {20323, 1}],
      eqm_reset_val => 6, lucky_val => 150};
get_reset({2, 10, 80, 1}) ->
    #{loss_coin => 0, loss_item => [{20541, 1}, {20324, 1}],
      eqm_reset_val => 10, lucky_val => 130};
get_reset({2, 10, 90, 1}) ->
    #{loss_coin => 0, loss_item => [{20556, 1}, {20325, 1}],
      eqm_reset_val => 12, lucky_val => 130};
get_reset({2, 11, 40, 1}) ->
    #{loss_coin => 0, loss_item => [{20521, 1}, {20320, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({2, 11, 50, 1}) ->
    #{loss_coin => 0, loss_item => [{20526, 1}, {20321, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({2, 11, 60, 1}) ->
    #{loss_coin => 0, loss_item => [{20531, 1}, {20322, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({2, 11, 70, 1}) ->
    #{loss_coin => 0, loss_item => [{20536, 1}, {20323, 1}],
      eqm_reset_val => 6, lucky_val => 150};
get_reset({2, 11, 80, 1}) ->
    #{loss_coin => 0, loss_item => [{20541, 1}, {20324, 1}],
      eqm_reset_val => 10, lucky_val => 130};
get_reset({2, 11, 90, 1}) ->
    #{loss_coin => 0, loss_item => [{20556, 1}, {20325, 1}],
      eqm_reset_val => 12, lucky_val => 130};
get_reset({2, 12, 40, 1}) ->
    #{loss_coin => 0, loss_item => [{20521, 1}, {20320, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({2, 12, 50, 1}) ->
    #{loss_coin => 0, loss_item => [{20526, 1}, {20321, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({2, 12, 60, 1}) ->
    #{loss_coin => 0, loss_item => [{20531, 1}, {20322, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({2, 12, 70, 1}) ->
    #{loss_coin => 0, loss_item => [{20536, 1}, {20323, 1}],
      eqm_reset_val => 6, lucky_val => 150};
get_reset({2, 12, 80, 1}) ->
    #{loss_coin => 0, loss_item => [{20541, 1}, {20324, 1}],
      eqm_reset_val => 10, lucky_val => 130};
get_reset({2, 12, 90, 1}) ->
    #{loss_coin => 0, loss_item => [{20556, 1}, {20325, 1}],
      eqm_reset_val => 12, lucky_val => 130};
get_reset({2, 14, 40, 1}) ->
    #{loss_coin => 0, loss_item => [{20521, 1}, {20320, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({2, 14, 50, 1}) ->
    #{loss_coin => 0, loss_item => [{20526, 1}, {20321, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({2, 14, 60, 1}) ->
    #{loss_coin => 0, loss_item => [{20531, 1}, {20322, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({2, 14, 70, 1}) ->
    #{loss_coin => 0, loss_item => [{20536, 1}, {20323, 1}],
      eqm_reset_val => 6, lucky_val => 150};
get_reset({2, 14, 80, 1}) ->
    #{loss_coin => 0, loss_item => [{20541, 1}, {20324, 1}],
      eqm_reset_val => 10, lucky_val => 130};
get_reset({2, 14, 90, 1}) ->
    #{loss_coin => 0, loss_item => [{20556, 1}, {20325, 1}],
      eqm_reset_val => 12, lucky_val => 130};
get_reset({3, 3, 40, 1}) ->
    #{loss_coin => 0, loss_item => [{20522, 1}, {20310, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({3, 3, 50, 1}) ->
    #{loss_coin => 0, loss_item => [{20527, 1}, {20311, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({3, 3, 60, 1}) ->
    #{loss_coin => 0, loss_item => [{20532, 1}, {20312, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({3, 3, 70, 1}) ->
    #{loss_coin => 0, loss_item => [{20537, 1}, {20313, 1}],
      eqm_reset_val => 6, lucky_val => 150};
get_reset({3, 3, 80, 1}) ->
    #{loss_coin => 0, loss_item => [{20542, 1}, {20314, 1}],
      eqm_reset_val => 10, lucky_val => 130};
get_reset({3, 3, 90, 1}) ->
    #{loss_coin => 0, loss_item => [{20557, 1}, {20315, 1}],
      eqm_reset_val => 12, lucky_val => 130};
get_reset({3, 6, 40, 1}) ->
    #{loss_coin => 0, loss_item => [{20522, 1}, {20310, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({3, 6, 50, 1}) ->
    #{loss_coin => 0, loss_item => [{20527, 1}, {20311, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({3, 6, 60, 1}) ->
    #{loss_coin => 0, loss_item => [{20532, 1}, {20312, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({3, 6, 70, 1}) ->
    #{loss_coin => 0, loss_item => [{20537, 1}, {20313, 1}],
      eqm_reset_val => 6, lucky_val => 150};
get_reset({3, 6, 80, 1}) ->
    #{loss_coin => 0, loss_item => [{20542, 1}, {20314, 1}],
      eqm_reset_val => 10, lucky_val => 130};
get_reset({3, 6, 90, 1}) ->
    #{loss_coin => 0, loss_item => [{20557, 1}, {20315, 1}],
      eqm_reset_val => 12, lucky_val => 130};
get_reset({3, 7, 40, 1}) ->
    #{loss_coin => 0, loss_item => [{20522, 1}, {20310, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({3, 7, 50, 1}) ->
    #{loss_coin => 0, loss_item => [{20527, 1}, {20311, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({3, 7, 60, 1}) ->
    #{loss_coin => 0, loss_item => [{20532, 1}, {20312, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({3, 7, 70, 1}) ->
    #{loss_coin => 0, loss_item => [{20537, 1}, {20313, 1}],
      eqm_reset_val => 6, lucky_val => 150};
get_reset({3, 7, 80, 1}) ->
    #{loss_coin => 0, loss_item => [{20542, 1}, {20314, 1}],
      eqm_reset_val => 10, lucky_val => 130};
get_reset({3, 7, 90, 1}) ->
    #{loss_coin => 0, loss_item => [{20557, 1}, {20315, 1}],
      eqm_reset_val => 12, lucky_val => 130};
get_reset({3, 9, 40, 1}) ->
    #{loss_coin => 0, loss_item => [{20522, 1}, {20310, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({3, 9, 50, 1}) ->
    #{loss_coin => 0, loss_item => [{20527, 1}, {20311, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({3, 9, 60, 1}) ->
    #{loss_coin => 0, loss_item => [{20532, 1}, {20312, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({3, 9, 70, 1}) ->
    #{loss_coin => 0, loss_item => [{20537, 1}, {20313, 1}],
      eqm_reset_val => 6, lucky_val => 150};
get_reset({3, 9, 80, 1}) ->
    #{loss_coin => 0, loss_item => [{20542, 1}, {20314, 1}],
      eqm_reset_val => 10, lucky_val => 130};
get_reset({3, 9, 90, 1}) ->
    #{loss_coin => 0, loss_item => [{20557, 1}, {20315, 1}],
      eqm_reset_val => 12, lucky_val => 130};
get_reset({3, 10, 40, 1}) ->
    #{loss_coin => 0, loss_item => [{20522, 1}, {20320, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({3, 10, 50, 1}) ->
    #{loss_coin => 0, loss_item => [{20527, 1}, {20321, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({3, 10, 60, 1}) ->
    #{loss_coin => 0, loss_item => [{20532, 1}, {20322, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({3, 10, 70, 1}) ->
    #{loss_coin => 0, loss_item => [{20537, 1}, {20323, 1}],
      eqm_reset_val => 6, lucky_val => 150};
get_reset({3, 10, 80, 1}) ->
    #{loss_coin => 0, loss_item => [{20542, 1}, {20324, 1}],
      eqm_reset_val => 10, lucky_val => 130};
get_reset({3, 10, 90, 1}) ->
    #{loss_coin => 0, loss_item => [{20557, 1}, {20325, 1}],
      eqm_reset_val => 12, lucky_val => 130};
get_reset({3, 11, 40, 1}) ->
    #{loss_coin => 0, loss_item => [{20522, 1}, {20320, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({3, 11, 50, 1}) ->
    #{loss_coin => 0, loss_item => [{20527, 1}, {20321, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({3, 11, 60, 1}) ->
    #{loss_coin => 0, loss_item => [{20532, 1}, {20322, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({3, 11, 70, 1}) ->
    #{loss_coin => 0, loss_item => [{20537, 1}, {20323, 1}],
      eqm_reset_val => 6, lucky_val => 150};
get_reset({3, 11, 80, 1}) ->
    #{loss_coin => 0, loss_item => [{20542, 1}, {20324, 1}],
      eqm_reset_val => 10, lucky_val => 130};
get_reset({3, 11, 90, 1}) ->
    #{loss_coin => 0, loss_item => [{20557, 1}, {20325, 1}],
      eqm_reset_val => 12, lucky_val => 130};
get_reset({3, 12, 40, 1}) ->
    #{loss_coin => 0, loss_item => [{20522, 1}, {20320, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({3, 12, 50, 1}) ->
    #{loss_coin => 0, loss_item => [{20527, 1}, {20321, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({3, 12, 60, 1}) ->
    #{loss_coin => 0, loss_item => [{20532, 1}, {20322, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({3, 12, 70, 1}) ->
    #{loss_coin => 0, loss_item => [{20537, 1}, {20323, 1}],
      eqm_reset_val => 6, lucky_val => 150};
get_reset({3, 12, 80, 1}) ->
    #{loss_coin => 0, loss_item => [{20542, 1}, {20324, 1}],
      eqm_reset_val => 10, lucky_val => 130};
get_reset({3, 12, 90, 1}) ->
    #{loss_coin => 0, loss_item => [{20557, 1}, {20325, 1}],
      eqm_reset_val => 12, lucky_val => 130};
get_reset({3, 14, 40, 1}) ->
    #{loss_coin => 0, loss_item => [{20522, 1}, {20320, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({3, 14, 50, 1}) ->
    #{loss_coin => 0, loss_item => [{20527, 1}, {20321, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({3, 14, 60, 1}) ->
    #{loss_coin => 0, loss_item => [{20532, 1}, {20322, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({3, 14, 70, 1}) ->
    #{loss_coin => 0, loss_item => [{20537, 1}, {20323, 1}],
      eqm_reset_val => 6, lucky_val => 150};
get_reset({3, 14, 80, 1}) ->
    #{loss_coin => 0, loss_item => [{20542, 1}, {20324, 1}],
      eqm_reset_val => 10, lucky_val => 130};
get_reset({3, 14, 90, 1}) ->
    #{loss_coin => 0, loss_item => [{20557, 1}, {20325, 1}],
      eqm_reset_val => 12, lucky_val => 130};
get_reset({4, 4, 40, 1}) ->
    #{loss_coin => 0, loss_item => [{20523, 1}, {20310, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({4, 4, 50, 1}) ->
    #{loss_coin => 0, loss_item => [{20528, 1}, {20311, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({4, 4, 60, 1}) ->
    #{loss_coin => 0, loss_item => [{20533, 1}, {20312, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({4, 4, 70, 1}) ->
    #{loss_coin => 0, loss_item => [{20538, 1}, {20313, 1}],
      eqm_reset_val => 6, lucky_val => 150};
get_reset({4, 4, 80, 1}) ->
    #{loss_coin => 0, loss_item => [{20543, 1}, {20314, 1}],
      eqm_reset_val => 10, lucky_val => 130};
get_reset({4, 4, 90, 1}) ->
    #{loss_coin => 0, loss_item => [{20558, 1}, {20315, 1}],
      eqm_reset_val => 12, lucky_val => 130};
get_reset({4, 6, 40, 1}) ->
    #{loss_coin => 0, loss_item => [{20523, 1}, {20310, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({4, 6, 50, 1}) ->
    #{loss_coin => 0, loss_item => [{20528, 1}, {20311, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({4, 6, 60, 1}) ->
    #{loss_coin => 0, loss_item => [{20533, 1}, {20312, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({4, 6, 70, 1}) ->
    #{loss_coin => 0, loss_item => [{20538, 1}, {20313, 1}],
      eqm_reset_val => 6, lucky_val => 150};
get_reset({4, 6, 80, 1}) ->
    #{loss_coin => 0, loss_item => [{20543, 1}, {20314, 1}],
      eqm_reset_val => 10, lucky_val => 130};
get_reset({4, 6, 90, 1}) ->
    #{loss_coin => 0, loss_item => [{20558, 1}, {20315, 1}],
      eqm_reset_val => 12, lucky_val => 130};
get_reset({4, 7, 40, 1}) ->
    #{loss_coin => 0, loss_item => [{20523, 1}, {20310, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({4, 7, 50, 1}) ->
    #{loss_coin => 0, loss_item => [{20528, 1}, {20311, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({4, 7, 60, 1}) ->
    #{loss_coin => 0, loss_item => [{20533, 1}, {20312, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({4, 7, 70, 1}) ->
    #{loss_coin => 0, loss_item => [{20538, 1}, {20313, 1}],
      eqm_reset_val => 6, lucky_val => 150};
get_reset({4, 7, 80, 1}) ->
    #{loss_coin => 0, loss_item => [{20543, 1}, {20314, 1}],
      eqm_reset_val => 10, lucky_val => 130};
get_reset({4, 7, 90, 1}) ->
    #{loss_coin => 0, loss_item => [{20558, 1}, {20315, 1}],
      eqm_reset_val => 12, lucky_val => 130};
get_reset({4, 9, 40, 1}) ->
    #{loss_coin => 0, loss_item => [{20523, 1}, {20310, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({4, 9, 50, 1}) ->
    #{loss_coin => 0, loss_item => [{20528, 1}, {20311, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({4, 9, 60, 1}) ->
    #{loss_coin => 0, loss_item => [{20533, 1}, {20312, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({4, 9, 70, 1}) ->
    #{loss_coin => 0, loss_item => [{20538, 1}, {20313, 1}],
      eqm_reset_val => 6, lucky_val => 150};
get_reset({4, 9, 80, 1}) ->
    #{loss_coin => 0, loss_item => [{20543, 1}, {20314, 1}],
      eqm_reset_val => 10, lucky_val => 130};
get_reset({4, 9, 90, 1}) ->
    #{loss_coin => 0, loss_item => [{20558, 1}, {20315, 1}],
      eqm_reset_val => 12, lucky_val => 130};
get_reset({4, 10, 40, 1}) ->
    #{loss_coin => 0, loss_item => [{20523, 1}, {20320, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({4, 10, 50, 1}) ->
    #{loss_coin => 0, loss_item => [{20528, 1}, {20321, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({4, 10, 60, 1}) ->
    #{loss_coin => 0, loss_item => [{20533, 1}, {20322, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({4, 10, 70, 1}) ->
    #{loss_coin => 0, loss_item => [{20538, 1}, {20323, 1}],
      eqm_reset_val => 6, lucky_val => 150};
get_reset({4, 10, 80, 1}) ->
    #{loss_coin => 0, loss_item => [{20543, 1}, {20324, 1}],
      eqm_reset_val => 10, lucky_val => 130};
get_reset({4, 10, 90, 1}) ->
    #{loss_coin => 0, loss_item => [{20558, 1}, {20325, 1}],
      eqm_reset_val => 12, lucky_val => 130};
get_reset({4, 11, 40, 1}) ->
    #{loss_coin => 0, loss_item => [{20523, 1}, {20320, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({4, 11, 50, 1}) ->
    #{loss_coin => 0, loss_item => [{20528, 1}, {20321, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({4, 11, 60, 1}) ->
    #{loss_coin => 0, loss_item => [{20533, 1}, {20322, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({4, 11, 70, 1}) ->
    #{loss_coin => 0, loss_item => [{20538, 1}, {20323, 1}],
      eqm_reset_val => 6, lucky_val => 150};
get_reset({4, 11, 80, 1}) ->
    #{loss_coin => 0, loss_item => [{20543, 1}, {20324, 1}],
      eqm_reset_val => 10, lucky_val => 130};
get_reset({4, 11, 90, 1}) ->
    #{loss_coin => 0, loss_item => [{20558, 1}, {20325, 1}],
      eqm_reset_val => 12, lucky_val => 130};
get_reset({4, 12, 40, 1}) ->
    #{loss_coin => 0, loss_item => [{20523, 1}, {20320, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({4, 12, 50, 1}) ->
    #{loss_coin => 0, loss_item => [{20528, 1}, {20321, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({4, 12, 60, 1}) ->
    #{loss_coin => 0, loss_item => [{20533, 1}, {20322, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({4, 12, 70, 1}) ->
    #{loss_coin => 0, loss_item => [{20538, 1}, {20323, 1}],
      eqm_reset_val => 6, lucky_val => 150};
get_reset({4, 12, 80, 1}) ->
    #{loss_coin => 0, loss_item => [{20543, 1}, {20324, 1}],
      eqm_reset_val => 10, lucky_val => 130};
get_reset({4, 12, 90, 1}) ->
    #{loss_coin => 0, loss_item => [{20558, 1}, {20325, 1}],
      eqm_reset_val => 12, lucky_val => 130};
get_reset({4, 14, 40, 1}) ->
    #{loss_coin => 0, loss_item => [{20523, 1}, {20320, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({4, 14, 50, 1}) ->
    #{loss_coin => 0, loss_item => [{20528, 1}, {20321, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({4, 14, 60, 1}) ->
    #{loss_coin => 0, loss_item => [{20533, 1}, {20322, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({4, 14, 70, 1}) ->
    #{loss_coin => 0, loss_item => [{20538, 1}, {20323, 1}],
      eqm_reset_val => 6, lucky_val => 150};
get_reset({4, 14, 80, 1}) ->
    #{loss_coin => 0, loss_item => [{20543, 1}, {20324, 1}],
      eqm_reset_val => 10, lucky_val => 130};
get_reset({4, 14, 90, 1}) ->
    #{loss_coin => 0, loss_item => [{20558, 1}, {20325, 1}],
      eqm_reset_val => 12, lucky_val => 130};
get_reset({5, 5, 40, 1}) ->
    #{loss_coin => 0, loss_item => [{20524, 1}, {20310, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({5, 5, 50, 1}) ->
    #{loss_coin => 0, loss_item => [{20529, 1}, {20311, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({5, 5, 60, 1}) ->
    #{loss_coin => 0, loss_item => [{20534, 1}, {20312, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({5, 5, 70, 1}) ->
    #{loss_coin => 0, loss_item => [{20539, 1}, {20313, 1}],
      eqm_reset_val => 6, lucky_val => 150};
get_reset({5, 5, 80, 1}) ->
    #{loss_coin => 0, loss_item => [{20544, 1}, {20314, 1}],
      eqm_reset_val => 10, lucky_val => 130};
get_reset({5, 5, 90, 1}) ->
    #{loss_coin => 0, loss_item => [{20559, 1}, {20315, 1}],
      eqm_reset_val => 12, lucky_val => 130};
get_reset({5, 6, 40, 1}) ->
    #{loss_coin => 0, loss_item => [{20524, 1}, {20310, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({5, 6, 50, 1}) ->
    #{loss_coin => 0, loss_item => [{20529, 1}, {20311, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({5, 6, 60, 1}) ->
    #{loss_coin => 0, loss_item => [{20534, 1}, {20312, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({5, 6, 70, 1}) ->
    #{loss_coin => 0, loss_item => [{20539, 1}, {20313, 1}],
      eqm_reset_val => 6, lucky_val => 150};
get_reset({5, 6, 80, 1}) ->
    #{loss_coin => 0, loss_item => [{20544, 1}, {20314, 1}],
      eqm_reset_val => 10, lucky_val => 130};
get_reset({5, 6, 90, 1}) ->
    #{loss_coin => 0, loss_item => [{20559, 1}, {20315, 1}],
      eqm_reset_val => 12, lucky_val => 130};
get_reset({5, 7, 40, 1}) ->
    #{loss_coin => 0, loss_item => [{20524, 1}, {20310, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({5, 7, 50, 1}) ->
    #{loss_coin => 0, loss_item => [{20529, 1}, {20311, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({5, 7, 60, 1}) ->
    #{loss_coin => 0, loss_item => [{20534, 1}, {20312, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({5, 7, 70, 1}) ->
    #{loss_coin => 0, loss_item => [{20539, 1}, {20313, 1}],
      eqm_reset_val => 6, lucky_val => 150};
get_reset({5, 7, 80, 1}) ->
    #{loss_coin => 0, loss_item => [{20544, 1}, {20314, 1}],
      eqm_reset_val => 10, lucky_val => 130};
get_reset({5, 7, 90, 1}) ->
    #{loss_coin => 0, loss_item => [{20559, 1}, {20315, 1}],
      eqm_reset_val => 12, lucky_val => 130};
get_reset({5, 9, 40, 1}) ->
    #{loss_coin => 0, loss_item => [{20524, 1}, {20310, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({5, 9, 50, 1}) ->
    #{loss_coin => 0, loss_item => [{20529, 1}, {20311, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({5, 9, 60, 1}) ->
    #{loss_coin => 0, loss_item => [{20534, 1}, {20312, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({5, 9, 70, 1}) ->
    #{loss_coin => 0, loss_item => [{20539, 1}, {20313, 1}],
      eqm_reset_val => 6, lucky_val => 150};
get_reset({5, 9, 80, 1}) ->
    #{loss_coin => 0, loss_item => [{20544, 1}, {20314, 1}],
      eqm_reset_val => 10, lucky_val => 130};
get_reset({5, 9, 90, 1}) ->
    #{loss_coin => 0, loss_item => [{20559, 1}, {20315, 1}],
      eqm_reset_val => 12, lucky_val => 130};
get_reset({5, 10, 40, 1}) ->
    #{loss_coin => 0, loss_item => [{20524, 1}, {20320, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({5, 10, 50, 1}) ->
    #{loss_coin => 0, loss_item => [{20529, 1}, {20321, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({5, 10, 60, 1}) ->
    #{loss_coin => 0, loss_item => [{20534, 1}, {20322, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({5, 10, 70, 1}) ->
    #{loss_coin => 0, loss_item => [{20539, 1}, {20323, 1}],
      eqm_reset_val => 6, lucky_val => 150};
get_reset({5, 10, 80, 1}) ->
    #{loss_coin => 0, loss_item => [{20544, 1}, {20324, 1}],
      eqm_reset_val => 10, lucky_val => 130};
get_reset({5, 10, 90, 1}) ->
    #{loss_coin => 0, loss_item => [{20559, 1}, {20325, 1}],
      eqm_reset_val => 12, lucky_val => 130};
get_reset({5, 11, 40, 1}) ->
    #{loss_coin => 0, loss_item => [{20524, 1}, {20320, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({5, 11, 50, 1}) ->
    #{loss_coin => 0, loss_item => [{20529, 1}, {20321, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({5, 11, 60, 1}) ->
    #{loss_coin => 0, loss_item => [{20534, 1}, {20322, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({5, 11, 70, 1}) ->
    #{loss_coin => 0, loss_item => [{20539, 1}, {20323, 1}],
      eqm_reset_val => 6, lucky_val => 150};
get_reset({5, 11, 80, 1}) ->
    #{loss_coin => 0, loss_item => [{20544, 1}, {20324, 1}],
      eqm_reset_val => 10, lucky_val => 130};
get_reset({5, 11, 90, 1}) ->
    #{loss_coin => 0, loss_item => [{20559, 1}, {20325, 1}],
      eqm_reset_val => 12, lucky_val => 130};
get_reset({5, 12, 40, 1}) ->
    #{loss_coin => 0, loss_item => [{20524, 1}, {20320, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({5, 12, 50, 1}) ->
    #{loss_coin => 0, loss_item => [{20529, 1}, {20321, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({5, 12, 60, 1}) ->
    #{loss_coin => 0, loss_item => [{20534, 1}, {20322, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({5, 12, 70, 1}) ->
    #{loss_coin => 0, loss_item => [{20539, 1}, {20323, 1}],
      eqm_reset_val => 6, lucky_val => 150};
get_reset({5, 12, 80, 1}) ->
    #{loss_coin => 0, loss_item => [{20544, 1}, {20324, 1}],
      eqm_reset_val => 10, lucky_val => 130};
get_reset({5, 12, 90, 1}) ->
    #{loss_coin => 0, loss_item => [{20559, 1}, {20325, 1}],
      eqm_reset_val => 12, lucky_val => 130};
get_reset({5, 14, 40, 1}) ->
    #{loss_coin => 0, loss_item => [{20524, 1}, {20320, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({5, 14, 50, 1}) ->
    #{loss_coin => 0, loss_item => [{20529, 1}, {20321, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({5, 14, 60, 1}) ->
    #{loss_coin => 0, loss_item => [{20534, 1}, {20322, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({5, 14, 70, 1}) ->
    #{loss_coin => 0, loss_item => [{20539, 1}, {20323, 1}],
      eqm_reset_val => 6, lucky_val => 150};
get_reset({5, 14, 80, 1}) ->
    #{loss_coin => 0, loss_item => [{20544, 1}, {20324, 1}],
      eqm_reset_val => 10, lucky_val => 130};
get_reset({5, 14, 90, 1}) ->
    #{loss_coin => 0, loss_item => [{20559, 1}, {20325, 1}],
      eqm_reset_val => 12, lucky_val => 130};
get_reset({1, 1, 40, 0}) ->
    #{loss_coin => 0, loss_item => [{23520, 1}, {20310, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({1, 1, 50, 0}) ->
    #{loss_coin => 0, loss_item => [{23525, 1}, {20311, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({1, 1, 60, 0}) ->
    #{loss_coin => 0, loss_item => [{23530, 1}, {20312, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({1, 1, 70, 0}) ->
    #{loss_coin => 0, loss_item => [{23535, 1}, {20313, 1}],
      eqm_reset_val => 6, lucky_val => 150};
get_reset({1, 1, 80, 0}) ->
    #{loss_coin => 0, loss_item => [{23540, 1}, {20314, 1}],
      eqm_reset_val => 10, lucky_val => 130};
get_reset({1, 1, 90, 0}) ->
    #{loss_coin => 0, loss_item => [{23545, 1}, {20315, 1}],
      eqm_reset_val => 12, lucky_val => 130};
get_reset({1, 6, 40, 0}) ->
    #{loss_coin => 0, loss_item => [{23520, 1}, {20310, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({1, 6, 50, 0}) ->
    #{loss_coin => 0, loss_item => [{23525, 1}, {20311, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({1, 6, 60, 0}) ->
    #{loss_coin => 0, loss_item => [{23530, 1}, {20312, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({1, 6, 70, 0}) ->
    #{loss_coin => 0, loss_item => [{23535, 1}, {20313, 1}],
      eqm_reset_val => 6, lucky_val => 150};
get_reset({1, 6, 80, 0}) ->
    #{loss_coin => 0, loss_item => [{23540, 1}, {20314, 1}],
      eqm_reset_val => 10, lucky_val => 130};
get_reset({1, 6, 90, 0}) ->
    #{loss_coin => 0, loss_item => [{23545, 1}, {20315, 1}],
      eqm_reset_val => 12, lucky_val => 130};
get_reset({1, 7, 40, 0}) ->
    #{loss_coin => 0, loss_item => [{23520, 1}, {20310, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({1, 7, 50, 0}) ->
    #{loss_coin => 0, loss_item => [{23525, 1}, {20311, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({1, 7, 60, 0}) ->
    #{loss_coin => 0, loss_item => [{23530, 1}, {20312, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({1, 7, 70, 0}) ->
    #{loss_coin => 0, loss_item => [{23535, 1}, {20313, 1}],
      eqm_reset_val => 6, lucky_val => 150};
get_reset({1, 7, 80, 0}) ->
    #{loss_coin => 0, loss_item => [{23540, 1}, {20314, 1}],
      eqm_reset_val => 10, lucky_val => 130};
get_reset({1, 7, 90, 0}) ->
    #{loss_coin => 0, loss_item => [{23545, 1}, {20315, 1}],
      eqm_reset_val => 12, lucky_val => 130};
get_reset({1, 9, 40, 0}) ->
    #{loss_coin => 0, loss_item => [{23520, 1}, {20310, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({1, 9, 50, 0}) ->
    #{loss_coin => 0, loss_item => [{23525, 1}, {20311, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({1, 9, 60, 0}) ->
    #{loss_coin => 0, loss_item => [{23530, 1}, {20312, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({1, 9, 70, 0}) ->
    #{loss_coin => 0, loss_item => [{23535, 1}, {20313, 1}],
      eqm_reset_val => 6, lucky_val => 150};
get_reset({1, 9, 80, 0}) ->
    #{loss_coin => 0, loss_item => [{23540, 1}, {20314, 1}],
      eqm_reset_val => 10, lucky_val => 130};
get_reset({1, 9, 90, 0}) ->
    #{loss_coin => 0, loss_item => [{23545, 1}, {20315, 1}],
      eqm_reset_val => 12, lucky_val => 130};
get_reset({1, 10, 40, 0}) ->
    #{loss_coin => 0, loss_item => [{23520, 1}, {20320, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({1, 10, 50, 0}) ->
    #{loss_coin => 0, loss_item => [{23525, 1}, {20321, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({1, 10, 60, 0}) ->
    #{loss_coin => 0, loss_item => [{23530, 1}, {20322, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({1, 10, 70, 0}) ->
    #{loss_coin => 0, loss_item => [{23535, 1}, {20323, 1}],
      eqm_reset_val => 6, lucky_val => 150};
get_reset({1, 10, 80, 0}) ->
    #{loss_coin => 0, loss_item => [{23540, 1}, {20324, 1}],
      eqm_reset_val => 10, lucky_val => 130};
get_reset({1, 10, 90, 0}) ->
    #{loss_coin => 0, loss_item => [{23545, 1}, {20325, 1}],
      eqm_reset_val => 12, lucky_val => 130};
get_reset({1, 11, 40, 0}) ->
    #{loss_coin => 0, loss_item => [{23520, 1}, {20320, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({1, 11, 50, 0}) ->
    #{loss_coin => 0, loss_item => [{23525, 1}, {20321, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({1, 11, 60, 0}) ->
    #{loss_coin => 0, loss_item => [{23530, 1}, {20322, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({1, 11, 70, 0}) ->
    #{loss_coin => 0, loss_item => [{23535, 1}, {20323, 1}],
      eqm_reset_val => 6, lucky_val => 150};
get_reset({1, 11, 80, 0}) ->
    #{loss_coin => 0, loss_item => [{23540, 1}, {20324, 1}],
      eqm_reset_val => 10, lucky_val => 130};
get_reset({1, 11, 90, 0}) ->
    #{loss_coin => 0, loss_item => [{23545, 1}, {20325, 1}],
      eqm_reset_val => 12, lucky_val => 130};
get_reset({1, 12, 40, 0}) ->
    #{loss_coin => 0, loss_item => [{23520, 1}, {20320, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({1, 12, 50, 0}) ->
    #{loss_coin => 0, loss_item => [{23525, 1}, {20321, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({1, 12, 60, 0}) ->
    #{loss_coin => 0, loss_item => [{23530, 1}, {20322, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({1, 12, 70, 0}) ->
    #{loss_coin => 0, loss_item => [{23535, 1}, {20323, 1}],
      eqm_reset_val => 6, lucky_val => 150};
get_reset({1, 12, 80, 0}) ->
    #{loss_coin => 0, loss_item => [{23540, 1}, {20324, 1}],
      eqm_reset_val => 10, lucky_val => 130};
get_reset({1, 12, 90, 0}) ->
    #{loss_coin => 0, loss_item => [{23545, 1}, {20325, 1}],
      eqm_reset_val => 12, lucky_val => 130};
get_reset({1, 14, 40, 0}) ->
    #{loss_coin => 0, loss_item => [{23520, 1}, {20320, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({1, 14, 50, 0}) ->
    #{loss_coin => 0, loss_item => [{23525, 1}, {20321, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({1, 14, 60, 0}) ->
    #{loss_coin => 0, loss_item => [{23530, 1}, {20322, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({1, 14, 70, 0}) ->
    #{loss_coin => 0, loss_item => [{23535, 1}, {20323, 1}],
      eqm_reset_val => 6, lucky_val => 150};
get_reset({1, 14, 80, 0}) ->
    #{loss_coin => 0, loss_item => [{23540, 1}, {20324, 1}],
      eqm_reset_val => 10, lucky_val => 130};
get_reset({1, 14, 90, 0}) ->
    #{loss_coin => 0, loss_item => [{23545, 1}, {20325, 1}],
      eqm_reset_val => 12, lucky_val => 130};
get_reset({2, 2, 40, 0}) ->
    #{loss_coin => 0, loss_item => [{23521, 1}, {20310, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({2, 2, 50, 0}) ->
    #{loss_coin => 0, loss_item => [{23526, 1}, {20311, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({2, 2, 60, 0}) ->
    #{loss_coin => 0, loss_item => [{23531, 1}, {20312, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({2, 2, 70, 0}) ->
    #{loss_coin => 0, loss_item => [{23536, 1}, {20313, 1}],
      eqm_reset_val => 6, lucky_val => 150};
get_reset({2, 2, 80, 0}) ->
    #{loss_coin => 0, loss_item => [{23541, 1}, {20314, 1}],
      eqm_reset_val => 10, lucky_val => 130};
get_reset({2, 2, 90, 0}) ->
    #{loss_coin => 0, loss_item => [{23546, 1}, {20315, 1}],
      eqm_reset_val => 12, lucky_val => 130};
get_reset({2, 6, 40, 0}) ->
    #{loss_coin => 0, loss_item => [{23521, 1}, {20310, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({2, 6, 50, 0}) ->
    #{loss_coin => 0, loss_item => [{23526, 1}, {20311, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({2, 6, 60, 0}) ->
    #{loss_coin => 0, loss_item => [{23531, 1}, {20312, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({2, 6, 70, 0}) ->
    #{loss_coin => 0, loss_item => [{23536, 1}, {20313, 1}],
      eqm_reset_val => 6, lucky_val => 150};
get_reset({2, 6, 80, 0}) ->
    #{loss_coin => 0, loss_item => [{23541, 1}, {20314, 1}],
      eqm_reset_val => 10, lucky_val => 130};
get_reset({2, 6, 90, 0}) ->
    #{loss_coin => 0, loss_item => [{23546, 1}, {20315, 1}],
      eqm_reset_val => 12, lucky_val => 130};
get_reset({2, 7, 40, 0}) ->
    #{loss_coin => 0, loss_item => [{23521, 1}, {20310, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({2, 7, 50, 0}) ->
    #{loss_coin => 0, loss_item => [{23526, 1}, {20311, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({2, 7, 60, 0}) ->
    #{loss_coin => 0, loss_item => [{23531, 1}, {20312, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({2, 7, 70, 0}) ->
    #{loss_coin => 0, loss_item => [{23536, 1}, {20313, 1}],
      eqm_reset_val => 6, lucky_val => 150};
get_reset({2, 7, 80, 0}) ->
    #{loss_coin => 0, loss_item => [{23541, 1}, {20314, 1}],
      eqm_reset_val => 10, lucky_val => 130};
get_reset({2, 7, 90, 0}) ->
    #{loss_coin => 0, loss_item => [{23546, 1}, {20315, 1}],
      eqm_reset_val => 12, lucky_val => 130};
get_reset({2, 9, 40, 0}) ->
    #{loss_coin => 0, loss_item => [{23521, 1}, {20310, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({2, 9, 50, 0}) ->
    #{loss_coin => 0, loss_item => [{23526, 1}, {20311, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({2, 9, 60, 0}) ->
    #{loss_coin => 0, loss_item => [{23531, 1}, {20312, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({2, 9, 70, 0}) ->
    #{loss_coin => 0, loss_item => [{23536, 1}, {20313, 1}],
      eqm_reset_val => 6, lucky_val => 150};
get_reset({2, 9, 80, 0}) ->
    #{loss_coin => 0, loss_item => [{23541, 1}, {20314, 1}],
      eqm_reset_val => 10, lucky_val => 130};
get_reset({2, 9, 90, 0}) ->
    #{loss_coin => 0, loss_item => [{23546, 1}, {20315, 1}],
      eqm_reset_val => 12, lucky_val => 130};
get_reset({2, 10, 40, 0}) ->
    #{loss_coin => 0, loss_item => [{23521, 1}, {20320, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({2, 10, 50, 0}) ->
    #{loss_coin => 0, loss_item => [{23526, 1}, {20321, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({2, 10, 60, 0}) ->
    #{loss_coin => 0, loss_item => [{23531, 1}, {20322, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({2, 10, 70, 0}) ->
    #{loss_coin => 0, loss_item => [{23536, 1}, {20323, 1}],
      eqm_reset_val => 6, lucky_val => 150};
get_reset({2, 10, 80, 0}) ->
    #{loss_coin => 0, loss_item => [{23541, 1}, {20324, 1}],
      eqm_reset_val => 10, lucky_val => 130};
get_reset({2, 10, 90, 0}) ->
    #{loss_coin => 0, loss_item => [{23546, 1}, {20325, 1}],
      eqm_reset_val => 12, lucky_val => 130};
get_reset({2, 11, 40, 0}) ->
    #{loss_coin => 0, loss_item => [{23521, 1}, {20320, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({2, 11, 50, 0}) ->
    #{loss_coin => 0, loss_item => [{23526, 1}, {20321, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({2, 11, 60, 0}) ->
    #{loss_coin => 0, loss_item => [{23531, 1}, {20322, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({2, 11, 70, 0}) ->
    #{loss_coin => 0, loss_item => [{23536, 1}, {20323, 1}],
      eqm_reset_val => 6, lucky_val => 150};
get_reset({2, 11, 80, 0}) ->
    #{loss_coin => 0, loss_item => [{23541, 1}, {20324, 1}],
      eqm_reset_val => 10, lucky_val => 130};
get_reset({2, 11, 90, 0}) ->
    #{loss_coin => 0, loss_item => [{23546, 1}, {20325, 1}],
      eqm_reset_val => 12, lucky_val => 130};
get_reset({2, 12, 40, 0}) ->
    #{loss_coin => 0, loss_item => [{23521, 1}, {20320, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({2, 12, 50, 0}) ->
    #{loss_coin => 0, loss_item => [{23526, 1}, {20321, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({2, 12, 60, 0}) ->
    #{loss_coin => 0, loss_item => [{23531, 1}, {20322, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({2, 12, 70, 0}) ->
    #{loss_coin => 0, loss_item => [{23536, 1}, {20323, 1}],
      eqm_reset_val => 6, lucky_val => 150};
get_reset({2, 12, 80, 0}) ->
    #{loss_coin => 0, loss_item => [{23541, 1}, {20324, 1}],
      eqm_reset_val => 10, lucky_val => 130};
get_reset({2, 12, 90, 0}) ->
    #{loss_coin => 0, loss_item => [{23546, 1}, {20325, 1}],
      eqm_reset_val => 12, lucky_val => 130};
get_reset({2, 14, 40, 0}) ->
    #{loss_coin => 0, loss_item => [{23521, 1}, {20320, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({2, 14, 50, 0}) ->
    #{loss_coin => 0, loss_item => [{23526, 1}, {20321, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({2, 14, 60, 0}) ->
    #{loss_coin => 0, loss_item => [{23531, 1}, {20322, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({2, 14, 70, 0}) ->
    #{loss_coin => 0, loss_item => [{23536, 1}, {20323, 1}],
      eqm_reset_val => 6, lucky_val => 150};
get_reset({2, 14, 80, 0}) ->
    #{loss_coin => 0, loss_item => [{23541, 1}, {20324, 1}],
      eqm_reset_val => 10, lucky_val => 130};
get_reset({2, 14, 90, 0}) ->
    #{loss_coin => 0, loss_item => [{23546, 1}, {20325, 1}],
      eqm_reset_val => 12, lucky_val => 130};
get_reset({3, 3, 40, 0}) ->
    #{loss_coin => 0, loss_item => [{23522, 1}, {20310, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({3, 3, 50, 0}) ->
    #{loss_coin => 0, loss_item => [{23527, 1}, {20311, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({3, 3, 60, 0}) ->
    #{loss_coin => 0, loss_item => [{23532, 1}, {20312, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({3, 3, 70, 0}) ->
    #{loss_coin => 0, loss_item => [{23537, 1}, {20313, 1}],
      eqm_reset_val => 6, lucky_val => 150};
get_reset({3, 3, 80, 0}) ->
    #{loss_coin => 0, loss_item => [{23542, 1}, {20314, 1}],
      eqm_reset_val => 10, lucky_val => 130};
get_reset({3, 3, 90, 0}) ->
    #{loss_coin => 0, loss_item => [{23547, 1}, {20315, 1}],
      eqm_reset_val => 12, lucky_val => 130};
get_reset({3, 6, 40, 0}) ->
    #{loss_coin => 0, loss_item => [{23522, 1}, {20310, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({3, 6, 50, 0}) ->
    #{loss_coin => 0, loss_item => [{23527, 1}, {20311, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({3, 6, 60, 0}) ->
    #{loss_coin => 0, loss_item => [{23532, 1}, {20312, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({3, 6, 70, 0}) ->
    #{loss_coin => 0, loss_item => [{23537, 1}, {20313, 1}],
      eqm_reset_val => 6, lucky_val => 150};
get_reset({3, 6, 80, 0}) ->
    #{loss_coin => 0, loss_item => [{23542, 1}, {20314, 1}],
      eqm_reset_val => 10, lucky_val => 130};
get_reset({3, 6, 90, 0}) ->
    #{loss_coin => 0, loss_item => [{23547, 1}, {20315, 1}],
      eqm_reset_val => 12, lucky_val => 130};
get_reset({3, 7, 40, 0}) ->
    #{loss_coin => 0, loss_item => [{23522, 1}, {20310, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({3, 7, 50, 0}) ->
    #{loss_coin => 0, loss_item => [{23527, 1}, {20311, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({3, 7, 60, 0}) ->
    #{loss_coin => 0, loss_item => [{23532, 1}, {20312, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({3, 7, 70, 0}) ->
    #{loss_coin => 0, loss_item => [{23537, 1}, {20313, 1}],
      eqm_reset_val => 6, lucky_val => 150};
get_reset({3, 7, 80, 0}) ->
    #{loss_coin => 0, loss_item => [{23542, 1}, {20314, 1}],
      eqm_reset_val => 10, lucky_val => 130};
get_reset({3, 7, 90, 0}) ->
    #{loss_coin => 0, loss_item => [{23547, 1}, {20315, 1}],
      eqm_reset_val => 12, lucky_val => 130};
get_reset({3, 9, 40, 0}) ->
    #{loss_coin => 0, loss_item => [{23522, 1}, {20310, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({3, 9, 50, 0}) ->
    #{loss_coin => 0, loss_item => [{23527, 1}, {20311, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({3, 9, 60, 0}) ->
    #{loss_coin => 0, loss_item => [{23532, 1}, {20312, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({3, 9, 70, 0}) ->
    #{loss_coin => 0, loss_item => [{23537, 1}, {20313, 1}],
      eqm_reset_val => 6, lucky_val => 150};
get_reset({3, 9, 80, 0}) ->
    #{loss_coin => 0, loss_item => [{23542, 1}, {20314, 1}],
      eqm_reset_val => 10, lucky_val => 130};
get_reset({3, 9, 90, 0}) ->
    #{loss_coin => 0, loss_item => [{23547, 1}, {20315, 1}],
      eqm_reset_val => 12, lucky_val => 130};
get_reset({3, 10, 40, 0}) ->
    #{loss_coin => 0, loss_item => [{23522, 1}, {20320, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({3, 10, 50, 0}) ->
    #{loss_coin => 0, loss_item => [{23527, 1}, {20321, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({3, 10, 60, 0}) ->
    #{loss_coin => 0, loss_item => [{23532, 1}, {20322, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({3, 10, 70, 0}) ->
    #{loss_coin => 0, loss_item => [{23537, 1}, {20323, 1}],
      eqm_reset_val => 6, lucky_val => 150};
get_reset({3, 10, 80, 0}) ->
    #{loss_coin => 0, loss_item => [{23542, 1}, {20324, 1}],
      eqm_reset_val => 10, lucky_val => 130};
get_reset({3, 10, 90, 0}) ->
    #{loss_coin => 0, loss_item => [{23547, 1}, {20325, 1}],
      eqm_reset_val => 12, lucky_val => 130};
get_reset({3, 11, 40, 0}) ->
    #{loss_coin => 0, loss_item => [{23522, 1}, {20320, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({3, 11, 50, 0}) ->
    #{loss_coin => 0, loss_item => [{23527, 1}, {20321, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({3, 11, 60, 0}) ->
    #{loss_coin => 0, loss_item => [{23532, 1}, {20322, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({3, 11, 70, 0}) ->
    #{loss_coin => 0, loss_item => [{23537, 1}, {20323, 1}],
      eqm_reset_val => 6, lucky_val => 150};
get_reset({3, 11, 80, 0}) ->
    #{loss_coin => 0, loss_item => [{23542, 1}, {20324, 1}],
      eqm_reset_val => 10, lucky_val => 130};
get_reset({3, 11, 90, 0}) ->
    #{loss_coin => 0, loss_item => [{23547, 1}, {20325, 1}],
      eqm_reset_val => 12, lucky_val => 130};
get_reset({3, 12, 40, 0}) ->
    #{loss_coin => 0, loss_item => [{23522, 1}, {20320, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({3, 12, 50, 0}) ->
    #{loss_coin => 0, loss_item => [{23527, 1}, {20321, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({3, 12, 60, 0}) ->
    #{loss_coin => 0, loss_item => [{23532, 1}, {20322, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({3, 12, 70, 0}) ->
    #{loss_coin => 0, loss_item => [{23537, 1}, {20323, 1}],
      eqm_reset_val => 6, lucky_val => 150};
get_reset({3, 12, 80, 0}) ->
    #{loss_coin => 0, loss_item => [{23542, 1}, {20324, 1}],
      eqm_reset_val => 10, lucky_val => 130};
get_reset({3, 12, 90, 0}) ->
    #{loss_coin => 0, loss_item => [{23547, 1}, {20325, 1}],
      eqm_reset_val => 12, lucky_val => 130};
get_reset({3, 14, 40, 0}) ->
    #{loss_coin => 0, loss_item => [{23522, 1}, {20320, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({3, 14, 50, 0}) ->
    #{loss_coin => 0, loss_item => [{23527, 1}, {20321, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({3, 14, 60, 0}) ->
    #{loss_coin => 0, loss_item => [{23532, 1}, {20322, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({3, 14, 70, 0}) ->
    #{loss_coin => 0, loss_item => [{23537, 1}, {20323, 1}],
      eqm_reset_val => 6, lucky_val => 150};
get_reset({3, 14, 80, 0}) ->
    #{loss_coin => 0, loss_item => [{23542, 1}, {20324, 1}],
      eqm_reset_val => 10, lucky_val => 130};
get_reset({3, 14, 90, 0}) ->
    #{loss_coin => 0, loss_item => [{23547, 1}, {20325, 1}],
      eqm_reset_val => 12, lucky_val => 130};
get_reset({4, 4, 40, 0}) ->
    #{loss_coin => 0, loss_item => [{23523, 1}, {20310, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({4, 4, 50, 0}) ->
    #{loss_coin => 0, loss_item => [{23528, 1}, {20311, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({4, 4, 60, 0}) ->
    #{loss_coin => 0, loss_item => [{23533, 1}, {20312, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({4, 4, 70, 0}) ->
    #{loss_coin => 0, loss_item => [{23538, 1}, {20313, 1}],
      eqm_reset_val => 6, lucky_val => 150};
get_reset({4, 4, 80, 0}) ->
    #{loss_coin => 0, loss_item => [{23543, 1}, {20314, 1}],
      eqm_reset_val => 10, lucky_val => 130};
get_reset({4, 4, 90, 0}) ->
    #{loss_coin => 0, loss_item => [{23548, 1}, {20315, 1}],
      eqm_reset_val => 12, lucky_val => 130};
get_reset({4, 6, 40, 0}) ->
    #{loss_coin => 0, loss_item => [{23523, 1}, {20310, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({4, 6, 50, 0}) ->
    #{loss_coin => 0, loss_item => [{23528, 1}, {20311, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({4, 6, 60, 0}) ->
    #{loss_coin => 0, loss_item => [{23533, 1}, {20312, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({4, 6, 70, 0}) ->
    #{loss_coin => 0, loss_item => [{23538, 1}, {20313, 1}],
      eqm_reset_val => 6, lucky_val => 150};
get_reset({4, 6, 80, 0}) ->
    #{loss_coin => 0, loss_item => [{23543, 1}, {20314, 1}],
      eqm_reset_val => 10, lucky_val => 130};
get_reset({4, 6, 90, 0}) ->
    #{loss_coin => 0, loss_item => [{23548, 1}, {20315, 1}],
      eqm_reset_val => 12, lucky_val => 130};
get_reset({4, 7, 40, 0}) ->
    #{loss_coin => 0, loss_item => [{23523, 1}, {20310, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({4, 7, 50, 0}) ->
    #{loss_coin => 0, loss_item => [{23528, 1}, {20311, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({4, 7, 60, 0}) ->
    #{loss_coin => 0, loss_item => [{23533, 1}, {20312, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({4, 7, 70, 0}) ->
    #{loss_coin => 0, loss_item => [{23538, 1}, {20313, 1}],
      eqm_reset_val => 6, lucky_val => 150};
get_reset({4, 7, 80, 0}) ->
    #{loss_coin => 0, loss_item => [{23543, 1}, {20314, 1}],
      eqm_reset_val => 10, lucky_val => 130};
get_reset({4, 7, 90, 0}) ->
    #{loss_coin => 0, loss_item => [{23548, 1}, {20315, 1}],
      eqm_reset_val => 12, lucky_val => 130};
get_reset({4, 9, 40, 0}) ->
    #{loss_coin => 0, loss_item => [{23523, 1}, {20310, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({4, 9, 50, 0}) ->
    #{loss_coin => 0, loss_item => [{23528, 1}, {20311, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({4, 9, 60, 0}) ->
    #{loss_coin => 0, loss_item => [{23533, 1}, {20312, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({4, 9, 70, 0}) ->
    #{loss_coin => 0, loss_item => [{23538, 1}, {20313, 1}],
      eqm_reset_val => 6, lucky_val => 150};
get_reset({4, 9, 80, 0}) ->
    #{loss_coin => 0, loss_item => [{23543, 1}, {20314, 1}],
      eqm_reset_val => 10, lucky_val => 130};
get_reset({4, 9, 90, 0}) ->
    #{loss_coin => 0, loss_item => [{23548, 1}, {20315, 1}],
      eqm_reset_val => 12, lucky_val => 130};
get_reset({4, 10, 40, 0}) ->
    #{loss_coin => 0, loss_item => [{23523, 1}, {20320, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({4, 10, 50, 0}) ->
    #{loss_coin => 0, loss_item => [{23528, 1}, {20321, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({4, 10, 60, 0}) ->
    #{loss_coin => 0, loss_item => [{23533, 1}, {20322, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({4, 10, 70, 0}) ->
    #{loss_coin => 0, loss_item => [{23538, 1}, {20323, 1}],
      eqm_reset_val => 6, lucky_val => 150};
get_reset({4, 10, 80, 0}) ->
    #{loss_coin => 0, loss_item => [{23543, 1}, {20324, 1}],
      eqm_reset_val => 10, lucky_val => 130};
get_reset({4, 10, 90, 0}) ->
    #{loss_coin => 0, loss_item => [{23548, 1}, {20325, 1}],
      eqm_reset_val => 12, lucky_val => 130};
get_reset({4, 11, 40, 0}) ->
    #{loss_coin => 0, loss_item => [{23523, 1}, {20320, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({4, 11, 50, 0}) ->
    #{loss_coin => 0, loss_item => [{23528, 1}, {20321, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({4, 11, 60, 0}) ->
    #{loss_coin => 0, loss_item => [{23533, 1}, {20322, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({4, 11, 70, 0}) ->
    #{loss_coin => 0, loss_item => [{23538, 1}, {20323, 1}],
      eqm_reset_val => 6, lucky_val => 150};
get_reset({4, 11, 80, 0}) ->
    #{loss_coin => 0, loss_item => [{23543, 1}, {20324, 1}],
      eqm_reset_val => 10, lucky_val => 130};
get_reset({4, 11, 90, 0}) ->
    #{loss_coin => 0, loss_item => [{23548, 1}, {20325, 1}],
      eqm_reset_val => 12, lucky_val => 130};
get_reset({4, 12, 40, 0}) ->
    #{loss_coin => 0, loss_item => [{23523, 1}, {20320, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({4, 12, 50, 0}) ->
    #{loss_coin => 0, loss_item => [{23528, 1}, {20321, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({4, 12, 60, 0}) ->
    #{loss_coin => 0, loss_item => [{23533, 1}, {20322, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({4, 12, 70, 0}) ->
    #{loss_coin => 0, loss_item => [{23538, 1}, {20323, 1}],
      eqm_reset_val => 6, lucky_val => 150};
get_reset({4, 12, 80, 0}) ->
    #{loss_coin => 0, loss_item => [{23543, 1}, {20324, 1}],
      eqm_reset_val => 10, lucky_val => 130};
get_reset({4, 12, 90, 0}) ->
    #{loss_coin => 0, loss_item => [{23548, 1}, {20325, 1}],
      eqm_reset_val => 12, lucky_val => 130};
get_reset({4, 14, 40, 0}) ->
    #{loss_coin => 0, loss_item => [{23523, 1}, {20320, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({4, 14, 50, 0}) ->
    #{loss_coin => 0, loss_item => [{23528, 1}, {20321, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({4, 14, 60, 0}) ->
    #{loss_coin => 0, loss_item => [{23533, 1}, {20322, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({4, 14, 70, 0}) ->
    #{loss_coin => 0, loss_item => [{23538, 1}, {20323, 1}],
      eqm_reset_val => 6, lucky_val => 150};
get_reset({4, 14, 80, 0}) ->
    #{loss_coin => 0, loss_item => [{23543, 1}, {20324, 1}],
      eqm_reset_val => 10, lucky_val => 130};
get_reset({4, 14, 90, 0}) ->
    #{loss_coin => 0, loss_item => [{23548, 1}, {20325, 1}],
      eqm_reset_val => 12, lucky_val => 130};
get_reset({5, 5, 40, 0}) ->
    #{loss_coin => 0, loss_item => [{23524, 1}, {20310, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({5, 5, 50, 0}) ->
    #{loss_coin => 0, loss_item => [{23529, 1}, {20311, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({5, 5, 60, 0}) ->
    #{loss_coin => 0, loss_item => [{23534, 1}, {20312, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({5, 5, 70, 0}) ->
    #{loss_coin => 0, loss_item => [{23539, 1}, {20313, 1}],
      eqm_reset_val => 6, lucky_val => 150};
get_reset({5, 5, 80, 0}) ->
    #{loss_coin => 0, loss_item => [{23544, 1}, {20314, 1}],
      eqm_reset_val => 10, lucky_val => 130};
get_reset({5, 5, 90, 0}) ->
    #{loss_coin => 0, loss_item => [{23549, 1}, {20315, 1}],
      eqm_reset_val => 12, lucky_val => 130};
get_reset({5, 6, 40, 0}) ->
    #{loss_coin => 0, loss_item => [{23524, 1}, {20310, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({5, 6, 50, 0}) ->
    #{loss_coin => 0, loss_item => [{23529, 1}, {20311, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({5, 6, 60, 0}) ->
    #{loss_coin => 0, loss_item => [{23534, 1}, {20312, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({5, 6, 70, 0}) ->
    #{loss_coin => 0, loss_item => [{23539, 1}, {20313, 1}],
      eqm_reset_val => 6, lucky_val => 150};
get_reset({5, 6, 80, 0}) ->
    #{loss_coin => 0, loss_item => [{23544, 1}, {20314, 1}],
      eqm_reset_val => 10, lucky_val => 130};
get_reset({5, 6, 90, 0}) ->
    #{loss_coin => 0, loss_item => [{23549, 1}, {20315, 1}],
      eqm_reset_val => 12, lucky_val => 130};
get_reset({5, 7, 40, 0}) ->
    #{loss_coin => 0, loss_item => [{23524, 1}, {20310, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({5, 7, 50, 0}) ->
    #{loss_coin => 0, loss_item => [{23529, 1}, {20311, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({5, 7, 60, 0}) ->
    #{loss_coin => 0, loss_item => [{23534, 1}, {20312, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({5, 7, 70, 0}) ->
    #{loss_coin => 0, loss_item => [{23539, 1}, {20313, 1}],
      eqm_reset_val => 6, lucky_val => 150};
get_reset({5, 7, 80, 0}) ->
    #{loss_coin => 0, loss_item => [{23544, 1}, {20314, 1}],
      eqm_reset_val => 10, lucky_val => 130};
get_reset({5, 7, 90, 0}) ->
    #{loss_coin => 0, loss_item => [{23549, 1}, {20315, 1}],
      eqm_reset_val => 12, lucky_val => 130};
get_reset({5, 9, 40, 0}) ->
    #{loss_coin => 0, loss_item => [{23524, 1}, {20310, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({5, 9, 50, 0}) ->
    #{loss_coin => 0, loss_item => [{23529, 1}, {20311, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({5, 9, 60, 0}) ->
    #{loss_coin => 0, loss_item => [{23534, 1}, {20312, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({5, 9, 70, 0}) ->
    #{loss_coin => 0, loss_item => [{23539, 1}, {20313, 1}],
      eqm_reset_val => 6, lucky_val => 150};
get_reset({5, 9, 80, 0}) ->
    #{loss_coin => 0, loss_item => [{23544, 1}, {20314, 1}],
      eqm_reset_val => 10, lucky_val => 130};
get_reset({5, 9, 90, 0}) ->
    #{loss_coin => 0, loss_item => [{23549, 1}, {20315, 1}],
      eqm_reset_val => 12, lucky_val => 130};
get_reset({5, 10, 40, 0}) ->
    #{loss_coin => 0, loss_item => [{23524, 1}, {20320, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({5, 10, 50, 0}) ->
    #{loss_coin => 0, loss_item => [{23529, 1}, {20321, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({5, 10, 60, 0}) ->
    #{loss_coin => 0, loss_item => [{23534, 1}, {20322, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({5, 10, 70, 0}) ->
    #{loss_coin => 0, loss_item => [{23539, 1}, {20323, 1}],
      eqm_reset_val => 6, lucky_val => 150};
get_reset({5, 10, 80, 0}) ->
    #{loss_coin => 0, loss_item => [{23544, 1}, {20324, 1}],
      eqm_reset_val => 10, lucky_val => 130};
get_reset({5, 10, 90, 0}) ->
    #{loss_coin => 0, loss_item => [{23549, 1}, {20325, 1}],
      eqm_reset_val => 12, lucky_val => 130};
get_reset({5, 11, 40, 0}) ->
    #{loss_coin => 0, loss_item => [{23524, 1}, {20320, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({5, 11, 50, 0}) ->
    #{loss_coin => 0, loss_item => [{23529, 1}, {20321, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({5, 11, 60, 0}) ->
    #{loss_coin => 0, loss_item => [{23534, 1}, {20322, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({5, 11, 70, 0}) ->
    #{loss_coin => 0, loss_item => [{23539, 1}, {20323, 1}],
      eqm_reset_val => 6, lucky_val => 150};
get_reset({5, 11, 80, 0}) ->
    #{loss_coin => 0, loss_item => [{23544, 1}, {20324, 1}],
      eqm_reset_val => 10, lucky_val => 130};
get_reset({5, 11, 90, 0}) ->
    #{loss_coin => 0, loss_item => [{23549, 1}, {20325, 1}],
      eqm_reset_val => 12, lucky_val => 130};
get_reset({5, 12, 40, 0}) ->
    #{loss_coin => 0, loss_item => [{23524, 1}, {20320, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({5, 12, 50, 0}) ->
    #{loss_coin => 0, loss_item => [{23529, 1}, {20321, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({5, 12, 60, 0}) ->
    #{loss_coin => 0, loss_item => [{23534, 1}, {20322, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({5, 12, 70, 0}) ->
    #{loss_coin => 0, loss_item => [{23539, 1}, {20323, 1}],
      eqm_reset_val => 6, lucky_val => 150};
get_reset({5, 12, 80, 0}) ->
    #{loss_coin => 0, loss_item => [{23544, 1}, {20324, 1}],
      eqm_reset_val => 10, lucky_val => 130};
get_reset({5, 12, 90, 0}) ->
    #{loss_coin => 0, loss_item => [{23549, 1}, {20325, 1}],
      eqm_reset_val => 12, lucky_val => 130};
get_reset({5, 14, 40, 0}) ->
    #{loss_coin => 0, loss_item => [{23524, 1}, {20320, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({5, 14, 50, 0}) ->
    #{loss_coin => 0, loss_item => [{23529, 1}, {20321, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({5, 14, 60, 0}) ->
    #{loss_coin => 0, loss_item => [{23534, 1}, {20322, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({5, 14, 70, 0}) ->
    #{loss_coin => 0, loss_item => [{23539, 1}, {20323, 1}],
      eqm_reset_val => 6, lucky_val => 150};
get_reset({5, 14, 80, 0}) ->
    #{loss_coin => 0, loss_item => [{23544, 1}, {20324, 1}],
      eqm_reset_val => 10, lucky_val => 130};
get_reset({5, 14, 90, 0}) ->
    #{loss_coin => 0, loss_item => [{23549, 1}, {20325, 1}],
      eqm_reset_val => 12, lucky_val => 130};
get_reset({6, 21, 40, 1}) ->
    #{loss_coin => 0, loss_item => [{21850, 1}, {20310, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({6, 21, 50, 1}) ->
    #{loss_coin => 0, loss_item => [{21852, 1}, {20311, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({6, 21, 60, 1}) ->
    #{loss_coin => 0, loss_item => [{21854, 1}, {20312, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({6, 21, 70, 1}) ->
    #{loss_coin => 0, loss_item => [{21856, 1}, {20313, 1}],
      eqm_reset_val => 6, lucky_val => 150};
get_reset({6, 21, 80, 1}) ->
    #{loss_coin => 0, loss_item => [{21858, 1}, {20314, 1}],
      eqm_reset_val => 10, lucky_val => 130};
get_reset({6, 21, 90, 1}) ->
    #{loss_coin => 0, loss_item => [{21860, 1}, {20315, 1}],
      eqm_reset_val => 12, lucky_val => 130};
get_reset({6, 6, 40, 1}) ->
    #{loss_coin => 0, loss_item => [{21850, 1}, {20310, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({6, 6, 50, 1}) ->
    #{loss_coin => 0, loss_item => [{21852, 1}, {20311, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({6, 6, 60, 1}) ->
    #{loss_coin => 0, loss_item => [{21854, 1}, {20312, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({6, 6, 70, 1}) ->
    #{loss_coin => 0, loss_item => [{21856, 1}, {20313, 1}],
      eqm_reset_val => 6, lucky_val => 150};
get_reset({6, 6, 80, 1}) ->
    #{loss_coin => 0, loss_item => [{21858, 1}, {20314, 1}],
      eqm_reset_val => 10, lucky_val => 130};
get_reset({6, 6, 90, 1}) ->
    #{loss_coin => 0, loss_item => [{21860, 1}, {20315, 1}],
      eqm_reset_val => 12, lucky_val => 130};
get_reset({6, 7, 40, 1}) ->
    #{loss_coin => 0, loss_item => [{21850, 1}, {20310, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({6, 7, 50, 1}) ->
    #{loss_coin => 0, loss_item => [{21852, 1}, {20311, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({6, 7, 60, 1}) ->
    #{loss_coin => 0, loss_item => [{21854, 1}, {20312, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({6, 7, 70, 1}) ->
    #{loss_coin => 0, loss_item => [{21856, 1}, {20313, 1}],
      eqm_reset_val => 6, lucky_val => 150};
get_reset({6, 7, 80, 1}) ->
    #{loss_coin => 0, loss_item => [{21858, 1}, {20314, 1}],
      eqm_reset_val => 10, lucky_val => 130};
get_reset({6, 7, 90, 1}) ->
    #{loss_coin => 0, loss_item => [{21860, 1}, {20315, 1}],
      eqm_reset_val => 12, lucky_val => 130};
get_reset({6, 9, 40, 1}) ->
    #{loss_coin => 0, loss_item => [{21850, 1}, {20310, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({6, 9, 50, 1}) ->
    #{loss_coin => 0, loss_item => [{21852, 1}, {20311, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({6, 9, 60, 1}) ->
    #{loss_coin => 0, loss_item => [{21854, 1}, {20312, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({6, 9, 70, 1}) ->
    #{loss_coin => 0, loss_item => [{21856, 1}, {20313, 1}],
      eqm_reset_val => 6, lucky_val => 150};
get_reset({6, 9, 80, 1}) ->
    #{loss_coin => 0, loss_item => [{21858, 1}, {20314, 1}],
      eqm_reset_val => 10, lucky_val => 130};
get_reset({6, 9, 90, 1}) ->
    #{loss_coin => 0, loss_item => [{21860, 1}, {20315, 1}],
      eqm_reset_val => 12, lucky_val => 130};
get_reset({6, 10, 40, 1}) ->
    #{loss_coin => 0, loss_item => [{21850, 1}, {20320, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({6, 10, 50, 1}) ->
    #{loss_coin => 0, loss_item => [{21852, 1}, {20321, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({6, 10, 60, 1}) ->
    #{loss_coin => 0, loss_item => [{21854, 1}, {20322, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({6, 10, 70, 1}) ->
    #{loss_coin => 0, loss_item => [{21856, 1}, {20323, 1}],
      eqm_reset_val => 6, lucky_val => 150};
get_reset({6, 10, 80, 1}) ->
    #{loss_coin => 0, loss_item => [{21858, 1}, {20324, 1}],
      eqm_reset_val => 10, lucky_val => 130};
get_reset({6, 10, 90, 1}) ->
    #{loss_coin => 0, loss_item => [{21860, 1}, {20325, 1}],
      eqm_reset_val => 12, lucky_val => 130};
get_reset({6, 11, 40, 1}) ->
    #{loss_coin => 0, loss_item => [{21850, 1}, {20320, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({6, 11, 50, 1}) ->
    #{loss_coin => 0, loss_item => [{21852, 1}, {20321, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({6, 11, 60, 1}) ->
    #{loss_coin => 0, loss_item => [{21854, 1}, {20322, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({6, 11, 70, 1}) ->
    #{loss_coin => 0, loss_item => [{21856, 1}, {20323, 1}],
      eqm_reset_val => 6, lucky_val => 150};
get_reset({6, 11, 80, 1}) ->
    #{loss_coin => 0, loss_item => [{21858, 1}, {20324, 1}],
      eqm_reset_val => 10, lucky_val => 130};
get_reset({6, 11, 90, 1}) ->
    #{loss_coin => 0, loss_item => [{21860, 1}, {20325, 1}],
      eqm_reset_val => 12, lucky_val => 130};
get_reset({6, 12, 40, 1}) ->
    #{loss_coin => 0, loss_item => [{21850, 1}, {20320, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({6, 12, 50, 1}) ->
    #{loss_coin => 0, loss_item => [{21852, 1}, {20321, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({6, 12, 60, 1}) ->
    #{loss_coin => 0, loss_item => [{21854, 1}, {20322, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({6, 12, 70, 1}) ->
    #{loss_coin => 0, loss_item => [{21856, 1}, {20323, 1}],
      eqm_reset_val => 6, lucky_val => 150};
get_reset({6, 12, 80, 1}) ->
    #{loss_coin => 0, loss_item => [{21858, 1}, {20324, 1}],
      eqm_reset_val => 10, lucky_val => 130};
get_reset({6, 12, 90, 1}) ->
    #{loss_coin => 0, loss_item => [{21860, 1}, {20325, 1}],
      eqm_reset_val => 12, lucky_val => 130};
get_reset({6, 14, 40, 1}) ->
    #{loss_coin => 0, loss_item => [{21850, 1}, {20320, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({6, 14, 50, 1}) ->
    #{loss_coin => 0, loss_item => [{21852, 1}, {20321, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({6, 14, 60, 1}) ->
    #{loss_coin => 0, loss_item => [{21854, 1}, {20322, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({6, 14, 70, 1}) ->
    #{loss_coin => 0, loss_item => [{21856, 1}, {20323, 1}],
      eqm_reset_val => 6, lucky_val => 150};
get_reset({6, 14, 80, 1}) ->
    #{loss_coin => 0, loss_item => [{21858, 1}, {20324, 1}],
      eqm_reset_val => 10, lucky_val => 130};
get_reset({6, 14, 90, 1}) ->
    #{loss_coin => 0, loss_item => [{21860, 1}, {20325, 1}],
      eqm_reset_val => 12, lucky_val => 130};
get_reset({6, 21, 40, 0}) ->
    #{loss_coin => 0, loss_item => [{21851, 1}, {20310, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({6, 21, 50, 0}) ->
    #{loss_coin => 0, loss_item => [{21853, 1}, {20311, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({6, 21, 60, 0}) ->
    #{loss_coin => 0, loss_item => [{21855, 1}, {20312, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({6, 21, 70, 0}) ->
    #{loss_coin => 0, loss_item => [{21857, 1}, {20313, 1}],
      eqm_reset_val => 6, lucky_val => 150};
get_reset({6, 21, 80, 0}) ->
    #{loss_coin => 0, loss_item => [{21859, 1}, {20314, 1}],
      eqm_reset_val => 10, lucky_val => 130};
get_reset({6, 21, 90, 0}) ->
    #{loss_coin => 0, loss_item => [{21861, 1}, {20315, 1}],
      eqm_reset_val => 12, lucky_val => 130};
get_reset({6, 6, 40, 0}) ->
    #{loss_coin => 0, loss_item => [{21851, 1}, {20310, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({6, 6, 50, 0}) ->
    #{loss_coin => 0, loss_item => [{21853, 1}, {20311, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({6, 6, 60, 0}) ->
    #{loss_coin => 0, loss_item => [{21855, 1}, {20312, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({6, 6, 70, 0}) ->
    #{loss_coin => 0, loss_item => [{21857, 1}, {20313, 1}],
      eqm_reset_val => 6, lucky_val => 150};
get_reset({6, 6, 80, 0}) ->
    #{loss_coin => 0, loss_item => [{21859, 1}, {20314, 1}],
      eqm_reset_val => 10, lucky_val => 130};
get_reset({6, 6, 90, 0}) ->
    #{loss_coin => 0, loss_item => [{21861, 1}, {20315, 1}],
      eqm_reset_val => 12, lucky_val => 130};
get_reset({6, 7, 40, 0}) ->
    #{loss_coin => 0, loss_item => [{21851, 1}, {20310, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({6, 7, 50, 0}) ->
    #{loss_coin => 0, loss_item => [{21853, 1}, {20311, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({6, 7, 60, 0}) ->
    #{loss_coin => 0, loss_item => [{21855, 1}, {20312, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({6, 7, 70, 0}) ->
    #{loss_coin => 0, loss_item => [{21857, 1}, {20313, 1}],
      eqm_reset_val => 6, lucky_val => 150};
get_reset({6, 7, 80, 0}) ->
    #{loss_coin => 0, loss_item => [{21859, 1}, {20314, 1}],
      eqm_reset_val => 10, lucky_val => 130};
get_reset({6, 7, 90, 0}) ->
    #{loss_coin => 0, loss_item => [{21861, 1}, {20315, 1}],
      eqm_reset_val => 12, lucky_val => 130};
get_reset({6, 9, 40, 0}) ->
    #{loss_coin => 0, loss_item => [{21851, 1}, {20310, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({6, 9, 50, 0}) ->
    #{loss_coin => 0, loss_item => [{21853, 1}, {20311, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({6, 9, 60, 0}) ->
    #{loss_coin => 0, loss_item => [{21855, 1}, {20312, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({6, 9, 70, 0}) ->
    #{loss_coin => 0, loss_item => [{21857, 1}, {20313, 1}],
      eqm_reset_val => 6, lucky_val => 150};
get_reset({6, 9, 80, 0}) ->
    #{loss_coin => 0, loss_item => [{21859, 1}, {20314, 1}],
      eqm_reset_val => 10, lucky_val => 130};
get_reset({6, 9, 90, 0}) ->
    #{loss_coin => 0, loss_item => [{21861, 1}, {20315, 1}],
      eqm_reset_val => 12, lucky_val => 130};
get_reset({6, 10, 40, 0}) ->
    #{loss_coin => 0, loss_item => [{21851, 1}, {20320, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({6, 10, 50, 0}) ->
    #{loss_coin => 0, loss_item => [{21853, 1}, {20321, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({6, 10, 60, 0}) ->
    #{loss_coin => 0, loss_item => [{21855, 1}, {20322, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({6, 10, 70, 0}) ->
    #{loss_coin => 0, loss_item => [{21857, 1}, {20323, 1}],
      eqm_reset_val => 6, lucky_val => 150};
get_reset({6, 10, 80, 0}) ->
    #{loss_coin => 0, loss_item => [{21859, 1}, {20324, 1}],
      eqm_reset_val => 10, lucky_val => 130};
get_reset({6, 10, 90, 0}) ->
    #{loss_coin => 0, loss_item => [{21861, 1}, {20325, 1}],
      eqm_reset_val => 12, lucky_val => 130};
get_reset({6, 11, 40, 0}) ->
    #{loss_coin => 0, loss_item => [{21851, 1}, {20320, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({6, 11, 50, 0}) ->
    #{loss_coin => 0, loss_item => [{21853, 1}, {20321, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({6, 11, 60, 0}) ->
    #{loss_coin => 0, loss_item => [{21855, 1}, {20322, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({6, 11, 70, 0}) ->
    #{loss_coin => 0, loss_item => [{21857, 1}, {20323, 1}],
      eqm_reset_val => 6, lucky_val => 150};
get_reset({6, 11, 80, 0}) ->
    #{loss_coin => 0, loss_item => [{21859, 1}, {20324, 1}],
      eqm_reset_val => 10, lucky_val => 130};
get_reset({6, 11, 90, 0}) ->
    #{loss_coin => 0, loss_item => [{21861, 1}, {20325, 1}],
      eqm_reset_val => 12, lucky_val => 130};
get_reset({6, 12, 40, 0}) ->
    #{loss_coin => 0, loss_item => [{21851, 1}, {20320, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({6, 12, 50, 0}) ->
    #{loss_coin => 0, loss_item => [{21853, 1}, {20321, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({6, 12, 60, 0}) ->
    #{loss_coin => 0, loss_item => [{21855, 1}, {20322, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({6, 12, 70, 0}) ->
    #{loss_coin => 0, loss_item => [{21857, 1}, {20323, 1}],
      eqm_reset_val => 6, lucky_val => 150};
get_reset({6, 12, 80, 0}) ->
    #{loss_coin => 0, loss_item => [{21859, 1}, {20324, 1}],
      eqm_reset_val => 10, lucky_val => 130};
get_reset({6, 12, 90, 0}) ->
    #{loss_coin => 0, loss_item => [{21861, 1}, {20325, 1}],
      eqm_reset_val => 12, lucky_val => 130};
get_reset({6, 14, 40, 0}) ->
    #{loss_coin => 0, loss_item => [{21851, 1}, {20320, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({6, 14, 50, 0}) ->
    #{loss_coin => 0, loss_item => [{21853, 1}, {20321, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({6, 14, 60, 0}) ->
    #{loss_coin => 0, loss_item => [{21855, 1}, {20322, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({6, 14, 70, 0}) ->
    #{loss_coin => 0, loss_item => [{21857, 1}, {20323, 1}],
      eqm_reset_val => 6, lucky_val => 150};
get_reset({6, 14, 80, 0}) ->
    #{loss_coin => 0, loss_item => [{21859, 1}, {20324, 1}],
      eqm_reset_val => 10, lucky_val => 130};
get_reset({6, 14, 90, 0}) ->
    #{loss_coin => 0, loss_item => [{21861, 1}, {20325, 1}],
      eqm_reset_val => 12, lucky_val => 130};
get_reset({6, 21, 100, 1}) ->
    #{loss_coin => 0, loss_item => [{21862, 1}, {20316, 1}],
      eqm_reset_val => 15, lucky_val => 130};
get_reset({6, 6, 100, 1}) ->
    #{loss_coin => 0, loss_item => [{21862, 1}, {20316, 1}],
      eqm_reset_val => 15, lucky_val => 130};
get_reset({6, 7, 100, 1}) ->
    #{loss_coin => 0, loss_item => [{21862, 1}, {20316, 1}],
      eqm_reset_val => 15, lucky_val => 130};
get_reset({6, 9, 100, 1}) ->
    #{loss_coin => 0, loss_item => [{21862, 1}, {20316, 1}],
      eqm_reset_val => 15, lucky_val => 130};
get_reset({6, 10, 100, 1}) ->
    #{loss_coin => 0, loss_item => [{21862, 1}, {20326, 1}],
      eqm_reset_val => 15, lucky_val => 130};
get_reset({6, 11, 100, 1}) ->
    #{loss_coin => 0, loss_item => [{21862, 1}, {20326, 1}],
      eqm_reset_val => 15, lucky_val => 130};
get_reset({6, 12, 100, 1}) ->
    #{loss_coin => 0, loss_item => [{21862, 1}, {20326, 1}],
      eqm_reset_val => 15, lucky_val => 130};
get_reset({6, 14, 100, 1}) ->
    #{loss_coin => 0, loss_item => [{21862, 1}, {20326, 1}],
      eqm_reset_val => 15, lucky_val => 130};
get_reset({6, 21, 100, 0}) ->
    #{loss_coin => 0, loss_item => [{21863, 1}, {20316, 1}],
      eqm_reset_val => 15, lucky_val => 130};
get_reset({6, 6, 100, 0}) ->
    #{loss_coin => 0, loss_item => [{21863, 1}, {20316, 1}],
      eqm_reset_val => 15, lucky_val => 130};
get_reset({6, 7, 100, 0}) ->
    #{loss_coin => 0, loss_item => [{21863, 1}, {20316, 1}],
      eqm_reset_val => 15, lucky_val => 130};
get_reset({6, 9, 100, 0}) ->
    #{loss_coin => 0, loss_item => [{21863, 1}, {20316, 1}],
      eqm_reset_val => 15, lucky_val => 130};
get_reset({6, 10, 100, 0}) ->
    #{loss_coin => 0, loss_item => [{21863, 1}, {20326, 1}],
      eqm_reset_val => 15, lucky_val => 130};
get_reset({6, 11, 100, 0}) ->
    #{loss_coin => 0, loss_item => [{21863, 1}, {20326, 1}],
      eqm_reset_val => 15, lucky_val => 130};
get_reset({6, 12, 100, 0}) ->
    #{loss_coin => 0, loss_item => [{21863, 1}, {20326, 1}],
      eqm_reset_val => 15, lucky_val => 130};
get_reset({6, 14, 100, 0}) ->
    #{loss_coin => 0, loss_item => [{21863, 1}, {20326, 1}],
      eqm_reset_val => 15, lucky_val => 130};
get_reset({7, 22, 40, 1}) ->
    #{loss_coin => 0, loss_item => [{21960, 1}, {20310, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({7, 22, 50, 1}) ->
    #{loss_coin => 0, loss_item => [{21962, 1}, {20311, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({7, 22, 60, 1}) ->
    #{loss_coin => 0, loss_item => [{21964, 1}, {20312, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({7, 22, 70, 1}) ->
    #{loss_coin => 0, loss_item => [{21966, 1}, {20313, 1}],
      eqm_reset_val => 6, lucky_val => 150};
get_reset({7, 22, 80, 1}) ->
    #{loss_coin => 0, loss_item => [{21968, 1}, {20314, 1}],
      eqm_reset_val => 10, lucky_val => 130};
get_reset({7, 22, 90, 1}) ->
    #{loss_coin => 0, loss_item => [{21970, 1}, {20315, 1}],
      eqm_reset_val => 12, lucky_val => 130};
get_reset({7, 6, 40, 1}) ->
    #{loss_coin => 0, loss_item => [{21960, 1}, {20310, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({7, 6, 50, 1}) ->
    #{loss_coin => 0, loss_item => [{21962, 1}, {20311, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({7, 6, 60, 1}) ->
    #{loss_coin => 0, loss_item => [{21964, 1}, {20312, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({7, 6, 70, 1}) ->
    #{loss_coin => 0, loss_item => [{21966, 1}, {20313, 1}],
      eqm_reset_val => 6, lucky_val => 150};
get_reset({7, 6, 80, 1}) ->
    #{loss_coin => 0, loss_item => [{21968, 1}, {20314, 1}],
      eqm_reset_val => 10, lucky_val => 130};
get_reset({7, 6, 90, 1}) ->
    #{loss_coin => 0, loss_item => [{21970, 1}, {20315, 1}],
      eqm_reset_val => 12, lucky_val => 130};
get_reset({7, 7, 40, 1}) ->
    #{loss_coin => 0, loss_item => [{21960, 1}, {20310, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({7, 7, 50, 1}) ->
    #{loss_coin => 0, loss_item => [{21962, 1}, {20311, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({7, 7, 60, 1}) ->
    #{loss_coin => 0, loss_item => [{21964, 1}, {20312, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({7, 7, 70, 1}) ->
    #{loss_coin => 0, loss_item => [{21966, 1}, {20313, 1}],
      eqm_reset_val => 6, lucky_val => 150};
get_reset({7, 7, 80, 1}) ->
    #{loss_coin => 0, loss_item => [{21968, 1}, {20314, 1}],
      eqm_reset_val => 10, lucky_val => 130};
get_reset({7, 7, 90, 1}) ->
    #{loss_coin => 0, loss_item => [{21970, 1}, {20315, 1}],
      eqm_reset_val => 12, lucky_val => 130};
get_reset({7, 9, 40, 1}) ->
    #{loss_coin => 0, loss_item => [{21960, 1}, {20310, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({7, 9, 50, 1}) ->
    #{loss_coin => 0, loss_item => [{21962, 1}, {20311, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({7, 9, 60, 1}) ->
    #{loss_coin => 0, loss_item => [{21964, 1}, {20312, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({7, 9, 70, 1}) ->
    #{loss_coin => 0, loss_item => [{21966, 1}, {20313, 1}],
      eqm_reset_val => 6, lucky_val => 150};
get_reset({7, 9, 80, 1}) ->
    #{loss_coin => 0, loss_item => [{21968, 1}, {20314, 1}],
      eqm_reset_val => 10, lucky_val => 130};
get_reset({7, 9, 90, 1}) ->
    #{loss_coin => 0, loss_item => [{21970, 1}, {20315, 1}],
      eqm_reset_val => 12, lucky_val => 130};
get_reset({7, 10, 40, 1}) ->
    #{loss_coin => 0, loss_item => [{21960, 1}, {20310, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({7, 10, 50, 1}) ->
    #{loss_coin => 0, loss_item => [{21962, 1}, {20311, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({7, 10, 60, 1}) ->
    #{loss_coin => 0, loss_item => [{21964, 1}, {20312, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({7, 10, 70, 1}) ->
    #{loss_coin => 0, loss_item => [{21966, 1}, {20313, 1}],
      eqm_reset_val => 6, lucky_val => 150};
get_reset({7, 10, 80, 1}) ->
    #{loss_coin => 0, loss_item => [{21968, 1}, {20314, 1}],
      eqm_reset_val => 10, lucky_val => 130};
get_reset({7, 10, 90, 1}) ->
    #{loss_coin => 0, loss_item => [{21970, 1}, {20315, 1}],
      eqm_reset_val => 12, lucky_val => 130};
get_reset({7, 11, 40, 1}) ->
    #{loss_coin => 0, loss_item => [{21960, 1}, {20310, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({7, 11, 50, 1}) ->
    #{loss_coin => 0, loss_item => [{21962, 1}, {20311, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({7, 11, 60, 1}) ->
    #{loss_coin => 0, loss_item => [{21964, 1}, {20312, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({7, 11, 70, 1}) ->
    #{loss_coin => 0, loss_item => [{21966, 1}, {20313, 1}],
      eqm_reset_val => 6, lucky_val => 150};
get_reset({7, 11, 80, 1}) ->
    #{loss_coin => 0, loss_item => [{21968, 1}, {20314, 1}],
      eqm_reset_val => 10, lucky_val => 130};
get_reset({7, 11, 90, 1}) ->
    #{loss_coin => 0, loss_item => [{21970, 1}, {20315, 1}],
      eqm_reset_val => 12, lucky_val => 130};
get_reset({7, 12, 40, 1}) ->
    #{loss_coin => 0, loss_item => [{21960, 1}, {20310, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({7, 12, 50, 1}) ->
    #{loss_coin => 0, loss_item => [{21962, 1}, {20311, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({7, 12, 60, 1}) ->
    #{loss_coin => 0, loss_item => [{21964, 1}, {20312, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({7, 12, 70, 1}) ->
    #{loss_coin => 0, loss_item => [{21966, 1}, {20313, 1}],
      eqm_reset_val => 6, lucky_val => 150};
get_reset({7, 12, 80, 1}) ->
    #{loss_coin => 0, loss_item => [{21968, 1}, {20314, 1}],
      eqm_reset_val => 10, lucky_val => 130};
get_reset({7, 12, 90, 1}) ->
    #{loss_coin => 0, loss_item => [{21970, 1}, {20315, 1}],
      eqm_reset_val => 12, lucky_val => 130};
get_reset({7, 14, 40, 1}) ->
    #{loss_coin => 0, loss_item => [{21960, 1}, {20310, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({7, 14, 50, 1}) ->
    #{loss_coin => 0, loss_item => [{21962, 1}, {20311, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({7, 14, 60, 1}) ->
    #{loss_coin => 0, loss_item => [{21964, 1}, {20312, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({7, 14, 70, 1}) ->
    #{loss_coin => 0, loss_item => [{21966, 1}, {20313, 1}],
      eqm_reset_val => 6, lucky_val => 150};
get_reset({7, 14, 80, 1}) ->
    #{loss_coin => 0, loss_item => [{21968, 1}, {20314, 1}],
      eqm_reset_val => 10, lucky_val => 130};
get_reset({7, 14, 90, 1}) ->
    #{loss_coin => 0, loss_item => [{21970, 1}, {20315, 1}],
      eqm_reset_val => 12, lucky_val => 130};
get_reset({7, 22, 40, 0}) ->
    #{loss_coin => 0, loss_item => [{21961, 1}, {20310, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({7, 22, 50, 0}) ->
    #{loss_coin => 0, loss_item => [{21963, 1}, {20311, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({7, 22, 60, 0}) ->
    #{loss_coin => 0, loss_item => [{21965, 1}, {20312, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({7, 22, 70, 0}) ->
    #{loss_coin => 0, loss_item => [{21967, 1}, {20313, 1}],
      eqm_reset_val => 6, lucky_val => 150};
get_reset({7, 22, 80, 0}) ->
    #{loss_coin => 0, loss_item => [{21969, 1}, {20314, 1}],
      eqm_reset_val => 10, lucky_val => 130};
get_reset({7, 22, 90, 0}) ->
    #{loss_coin => 0, loss_item => [{21971, 1}, {20315, 1}],
      eqm_reset_val => 12, lucky_val => 130};
get_reset({7, 6, 40, 0}) ->
    #{loss_coin => 0, loss_item => [{21961, 1}, {20310, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({7, 6, 50, 0}) ->
    #{loss_coin => 0, loss_item => [{21963, 1}, {20311, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({7, 6, 60, 0}) ->
    #{loss_coin => 0, loss_item => [{21965, 1}, {20312, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({7, 6, 70, 0}) ->
    #{loss_coin => 0, loss_item => [{21967, 1}, {20313, 1}],
      eqm_reset_val => 6, lucky_val => 150};
get_reset({7, 6, 80, 0}) ->
    #{loss_coin => 0, loss_item => [{21969, 1}, {20314, 1}],
      eqm_reset_val => 10, lucky_val => 130};
get_reset({7, 6, 90, 0}) ->
    #{loss_coin => 0, loss_item => [{21971, 1}, {20315, 1}],
      eqm_reset_val => 12, lucky_val => 130};
get_reset({7, 7, 40, 0}) ->
    #{loss_coin => 0, loss_item => [{21961, 1}, {20310, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({7, 7, 50, 0}) ->
    #{loss_coin => 0, loss_item => [{21963, 1}, {20311, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({7, 7, 60, 0}) ->
    #{loss_coin => 0, loss_item => [{21965, 1}, {20312, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({7, 7, 70, 0}) ->
    #{loss_coin => 0, loss_item => [{21967, 1}, {20313, 1}],
      eqm_reset_val => 6, lucky_val => 150};
get_reset({7, 7, 80, 0}) ->
    #{loss_coin => 0, loss_item => [{21969, 1}, {20314, 1}],
      eqm_reset_val => 10, lucky_val => 130};
get_reset({7, 7, 90, 0}) ->
    #{loss_coin => 0, loss_item => [{21971, 1}, {20315, 1}],
      eqm_reset_val => 12, lucky_val => 130};
get_reset({7, 9, 40, 0}) ->
    #{loss_coin => 0, loss_item => [{21961, 1}, {20310, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({7, 9, 50, 0}) ->
    #{loss_coin => 0, loss_item => [{21963, 1}, {20311, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({7, 9, 60, 0}) ->
    #{loss_coin => 0, loss_item => [{21965, 1}, {20312, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({7, 9, 70, 0}) ->
    #{loss_coin => 0, loss_item => [{21967, 1}, {20313, 1}],
      eqm_reset_val => 6, lucky_val => 150};
get_reset({7, 9, 80, 0}) ->
    #{loss_coin => 0, loss_item => [{21969, 1}, {20314, 1}],
      eqm_reset_val => 10, lucky_val => 130};
get_reset({7, 9, 90, 0}) ->
    #{loss_coin => 0, loss_item => [{21971, 1}, {20315, 1}],
      eqm_reset_val => 12, lucky_val => 130};
get_reset({7, 10, 40, 0}) ->
    #{loss_coin => 0, loss_item => [{21961, 1}, {20310, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({7, 10, 50, 0}) ->
    #{loss_coin => 0, loss_item => [{21963, 1}, {20311, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({7, 10, 60, 0}) ->
    #{loss_coin => 0, loss_item => [{21965, 1}, {20312, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({7, 10, 70, 0}) ->
    #{loss_coin => 0, loss_item => [{21967, 1}, {20313, 1}],
      eqm_reset_val => 6, lucky_val => 150};
get_reset({7, 10, 80, 0}) ->
    #{loss_coin => 0, loss_item => [{21969, 1}, {20314, 1}],
      eqm_reset_val => 10, lucky_val => 130};
get_reset({7, 10, 90, 0}) ->
    #{loss_coin => 0, loss_item => [{21971, 1}, {20315, 1}],
      eqm_reset_val => 12, lucky_val => 130};
get_reset({7, 11, 40, 0}) ->
    #{loss_coin => 0, loss_item => [{21961, 1}, {20310, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({7, 11, 50, 0}) ->
    #{loss_coin => 0, loss_item => [{21963, 1}, {20311, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({7, 11, 60, 0}) ->
    #{loss_coin => 0, loss_item => [{21965, 1}, {20312, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({7, 11, 70, 0}) ->
    #{loss_coin => 0, loss_item => [{21967, 1}, {20313, 1}],
      eqm_reset_val => 6, lucky_val => 150};
get_reset({7, 11, 80, 0}) ->
    #{loss_coin => 0, loss_item => [{21969, 1}, {20314, 1}],
      eqm_reset_val => 10, lucky_val => 130};
get_reset({7, 11, 90, 0}) ->
    #{loss_coin => 0, loss_item => [{21971, 1}, {20315, 1}],
      eqm_reset_val => 12, lucky_val => 130};
get_reset({7, 12, 40, 0}) ->
    #{loss_coin => 0, loss_item => [{21961, 1}, {20310, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({7, 12, 50, 0}) ->
    #{loss_coin => 0, loss_item => [{21963, 1}, {20311, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({7, 12, 60, 0}) ->
    #{loss_coin => 0, loss_item => [{21965, 1}, {20312, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({7, 12, 70, 0}) ->
    #{loss_coin => 0, loss_item => [{21967, 1}, {20313, 1}],
      eqm_reset_val => 6, lucky_val => 150};
get_reset({7, 12, 80, 0}) ->
    #{loss_coin => 0, loss_item => [{21969, 1}, {20314, 1}],
      eqm_reset_val => 10, lucky_val => 130};
get_reset({7, 12, 90, 0}) ->
    #{loss_coin => 0, loss_item => [{21971, 1}, {20315, 1}],
      eqm_reset_val => 12, lucky_val => 130};
get_reset({7, 14, 40, 0}) ->
    #{loss_coin => 0, loss_item => [{21961, 1}, {20310, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({7, 14, 50, 0}) ->
    #{loss_coin => 0, loss_item => [{21963, 1}, {20311, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({7, 14, 60, 0}) ->
    #{loss_coin => 0, loss_item => [{21965, 1}, {20312, 1}],
      eqm_reset_val => 0, lucky_val => 150};
get_reset({7, 14, 70, 0}) ->
    #{loss_coin => 0, loss_item => [{21967, 1}, {20313, 1}],
      eqm_reset_val => 6, lucky_val => 150};
get_reset({7, 14, 80, 0}) ->
    #{loss_coin => 0, loss_item => [{21969, 1}, {20314, 1}],
      eqm_reset_val => 10, lucky_val => 130};
get_reset({7, 14, 90, 0}) ->
    #{loss_coin => 0, loss_item => [{21971, 1}, {20315, 1}],
      eqm_reset_val => 12, lucky_val => 130};
get_reset({7, 22, 100, 1}) ->
    #{loss_coin => 0, loss_item => [{21972, 1}, {20316, 1}],
      eqm_reset_val => 15, lucky_val => 130};
get_reset({7, 6, 100, 1}) ->
    #{loss_coin => 0, loss_item => [{21972, 1}, {20316, 1}],
      eqm_reset_val => 15, lucky_val => 130};
get_reset({7, 7, 100, 1}) ->
    #{loss_coin => 0, loss_item => [{21972, 1}, {20316, 1}],
      eqm_reset_val => 15, lucky_val => 130};
get_reset({7, 9, 100, 1}) ->
    #{loss_coin => 0, loss_item => [{21972, 1}, {20316, 1}],
      eqm_reset_val => 15, lucky_val => 130};
get_reset({7, 10, 100, 1}) ->
    #{loss_coin => 0, loss_item => [{21972, 1}, {20316, 1}],
      eqm_reset_val => 15, lucky_val => 130};
get_reset({7, 11, 100, 1}) ->
    #{loss_coin => 0, loss_item => [{21972, 1}, {20316, 1}],
      eqm_reset_val => 15, lucky_val => 130};
get_reset({7, 12, 100, 1}) ->
    #{loss_coin => 0, loss_item => [{21972, 1}, {20316, 1}],
      eqm_reset_val => 15, lucky_val => 130};
get_reset({7, 14, 100, 1}) ->
    #{loss_coin => 0, loss_item => [{21972, 1}, {20316, 1}],
      eqm_reset_val => 15, lucky_val => 130};
get_reset({7, 22, 100, 0}) ->
    #{loss_coin => 0, loss_item => [{21973, 1}, {20316, 1}],
      eqm_reset_val => 15, lucky_val => 130};
get_reset({7, 6, 100, 0}) ->
    #{loss_coin => 0, loss_item => [{21973, 1}, {20316, 1}],
      eqm_reset_val => 15, lucky_val => 130};
get_reset({7, 7, 100, 0}) ->
    #{loss_coin => 0, loss_item => [{21973, 1}, {20316, 1}],
      eqm_reset_val => 15, lucky_val => 130};
get_reset({7, 9, 100, 0}) ->
    #{loss_coin => 0, loss_item => [{21973, 1}, {20316, 1}],
      eqm_reset_val => 15, lucky_val => 130};
get_reset({7, 10, 100, 0}) ->
    #{loss_coin => 0, loss_item => [{21973, 1}, {20316, 1}],
      eqm_reset_val => 15, lucky_val => 130};
get_reset({7, 11, 100, 0}) ->
    #{loss_coin => 0, loss_item => [{21973, 1}, {20316, 1}],
      eqm_reset_val => 15, lucky_val => 130};
get_reset({7, 12, 100, 0}) ->
    #{loss_coin => 0, loss_item => [{21973, 1}, {20316, 1}],
      eqm_reset_val => 15, lucky_val => 130};
get_reset({7, 14, 100, 0}) ->
    #{loss_coin => 0, loss_item => [{21973, 1}, {20316, 1}],
      eqm_reset_val => 15, lucky_val => 130};
get_reset({1, 1, 100, 1}) ->
    #{loss_coin => 0, loss_item => [{21801, 1}, {20316, 1}],
      eqm_reset_val => 15, lucky_val => 130};
get_reset({1, 6, 100, 1}) ->
    #{loss_coin => 0, loss_item => [{21801, 1}, {20316, 1}],
      eqm_reset_val => 15, lucky_val => 130};
get_reset({1, 7, 100, 1}) ->
    #{loss_coin => 0, loss_item => [{21801, 1}, {20316, 1}],
      eqm_reset_val => 15, lucky_val => 130};
get_reset({1, 9, 100, 1}) ->
    #{loss_coin => 0, loss_item => [{21801, 1}, {20316, 1}],
      eqm_reset_val => 15, lucky_val => 130};
get_reset({1, 10, 100, 1}) ->
    #{loss_coin => 0, loss_item => [{21801, 1}, {20326, 1}],
      eqm_reset_val => 15, lucky_val => 130};
get_reset({1, 11, 100, 1}) ->
    #{loss_coin => 0, loss_item => [{21801, 1}, {20326, 1}],
      eqm_reset_val => 15, lucky_val => 130};
get_reset({1, 12, 100, 1}) ->
    #{loss_coin => 0, loss_item => [{21801, 1}, {20326, 1}],
      eqm_reset_val => 15, lucky_val => 130};
get_reset({1, 14, 100, 1}) ->
    #{loss_coin => 0, loss_item => [{21801, 1}, {20326, 1}],
      eqm_reset_val => 15, lucky_val => 130};
get_reset({1, 1, 100, 0}) ->
    #{loss_coin => 0, loss_item => [{21806, 1}, {20316, 1}],
      eqm_reset_val => 15, lucky_val => 130};
get_reset({1, 6, 100, 0}) ->
    #{loss_coin => 0, loss_item => [{21806, 1}, {20316, 1}],
      eqm_reset_val => 15, lucky_val => 130};
get_reset({1, 7, 100, 0}) ->
    #{loss_coin => 0, loss_item => [{21806, 1}, {20316, 1}],
      eqm_reset_val => 15, lucky_val => 130};
get_reset({1, 9, 100, 0}) ->
    #{loss_coin => 0, loss_item => [{21806, 1}, {20316, 1}],
      eqm_reset_val => 15, lucky_val => 130};
get_reset({1, 10, 100, 0}) ->
    #{loss_coin => 0, loss_item => [{21806, 1}, {20326, 1}],
      eqm_reset_val => 15, lucky_val => 130};
get_reset({1, 11, 100, 0}) ->
    #{loss_coin => 0, loss_item => [{21806, 1}, {20326, 1}],
      eqm_reset_val => 15, lucky_val => 130};
get_reset({1, 12, 100, 0}) ->
    #{loss_coin => 0, loss_item => [{21806, 1}, {20326, 1}],
      eqm_reset_val => 15, lucky_val => 130};
get_reset({1, 14, 100, 0}) ->
    #{loss_coin => 0, loss_item => [{21806, 1}, {20326, 1}],
      eqm_reset_val => 15, lucky_val => 130};
get_reset({2, 2, 100, 1}) ->
    #{loss_coin => 0, loss_item => [{21802, 1}, {20316, 1}],
      eqm_reset_val => 15, lucky_val => 130};
get_reset({2, 6, 100, 1}) ->
    #{loss_coin => 0, loss_item => [{21802, 1}, {20316, 1}],
      eqm_reset_val => 15, lucky_val => 130};
get_reset({2, 7, 100, 1}) ->
    #{loss_coin => 0, loss_item => [{21802, 1}, {20316, 1}],
      eqm_reset_val => 15, lucky_val => 130};
get_reset({2, 9, 100, 1}) ->
    #{loss_coin => 0, loss_item => [{21802, 1}, {20316, 1}],
      eqm_reset_val => 15, lucky_val => 130};
get_reset({2, 10, 100, 1}) ->
    #{loss_coin => 0, loss_item => [{21802, 1}, {20326, 1}],
      eqm_reset_val => 15, lucky_val => 130};
get_reset({2, 11, 100, 1}) ->
    #{loss_coin => 0, loss_item => [{21802, 1}, {20326, 1}],
      eqm_reset_val => 15, lucky_val => 130};
get_reset({2, 12, 100, 1}) ->
    #{loss_coin => 0, loss_item => [{21802, 1}, {20326, 1}],
      eqm_reset_val => 15, lucky_val => 130};
get_reset({2, 14, 100, 1}) ->
    #{loss_coin => 0, loss_item => [{21802, 1}, {20326, 1}],
      eqm_reset_val => 15, lucky_val => 130};
get_reset({2, 2, 100, 0}) ->
    #{loss_coin => 0, loss_item => [{21807, 1}, {20316, 1}],
      eqm_reset_val => 15, lucky_val => 130};
get_reset({2, 6, 100, 0}) ->
    #{loss_coin => 0, loss_item => [{21807, 1}, {20316, 1}],
      eqm_reset_val => 15, lucky_val => 130};
get_reset({2, 7, 100, 0}) ->
    #{loss_coin => 0, loss_item => [{21807, 1}, {20316, 1}],
      eqm_reset_val => 15, lucky_val => 130};
get_reset({2, 9, 100, 0}) ->
    #{loss_coin => 0, loss_item => [{21807, 1}, {20316, 1}],
      eqm_reset_val => 15, lucky_val => 130};
get_reset({2, 10, 100, 0}) ->
    #{loss_coin => 0, loss_item => [{21807, 1}, {20326, 1}],
      eqm_reset_val => 15, lucky_val => 130};
get_reset({2, 11, 100, 0}) ->
    #{loss_coin => 0, loss_item => [{21807, 1}, {20326, 1}],
      eqm_reset_val => 15, lucky_val => 130};
get_reset({2, 12, 100, 0}) ->
    #{loss_coin => 0, loss_item => [{21807, 1}, {20326, 1}],
      eqm_reset_val => 15, lucky_val => 130};
get_reset({2, 14, 100, 0}) ->
    #{loss_coin => 0, loss_item => [{21807, 1}, {20326, 1}],
      eqm_reset_val => 15, lucky_val => 130};
get_reset({3, 3, 100, 1}) ->
    #{loss_coin => 0, loss_item => [{21803, 1}, {20316, 1}],
      eqm_reset_val => 15, lucky_val => 130};
get_reset({3, 6, 100, 1}) ->
    #{loss_coin => 0, loss_item => [{21803, 1}, {20316, 1}],
      eqm_reset_val => 15, lucky_val => 130};
get_reset({3, 7, 100, 1}) ->
    #{loss_coin => 0, loss_item => [{21803, 1}, {20316, 1}],
      eqm_reset_val => 15, lucky_val => 130};
get_reset({3, 9, 100, 1}) ->
    #{loss_coin => 0, loss_item => [{21803, 1}, {20316, 1}],
      eqm_reset_val => 15, lucky_val => 130};
get_reset({3, 10, 100, 1}) ->
    #{loss_coin => 0, loss_item => [{21803, 1}, {20326, 1}],
      eqm_reset_val => 15, lucky_val => 130};
get_reset({3, 11, 100, 1}) ->
    #{loss_coin => 0, loss_item => [{21803, 1}, {20326, 1}],
      eqm_reset_val => 15, lucky_val => 130};
get_reset({3, 12, 100, 1}) ->
    #{loss_coin => 0, loss_item => [{21803, 1}, {20326, 1}],
      eqm_reset_val => 15, lucky_val => 130};
get_reset({3, 14, 100, 1}) ->
    #{loss_coin => 0, loss_item => [{21803, 1}, {20326, 1}],
      eqm_reset_val => 15, lucky_val => 130};
get_reset({3, 3, 100, 0}) ->
    #{loss_coin => 0, loss_item => [{21808, 1}, {20316, 1}],
      eqm_reset_val => 15, lucky_val => 130};
get_reset({3, 6, 100, 0}) ->
    #{loss_coin => 0, loss_item => [{21808, 1}, {20316, 1}],
      eqm_reset_val => 15, lucky_val => 130};
get_reset({3, 7, 100, 0}) ->
    #{loss_coin => 0, loss_item => [{21808, 1}, {20316, 1}],
      eqm_reset_val => 15, lucky_val => 130};
get_reset({3, 9, 100, 0}) ->
    #{loss_coin => 0, loss_item => [{21808, 1}, {20316, 1}],
      eqm_reset_val => 15, lucky_val => 130};
get_reset({3, 10, 100, 0}) ->
    #{loss_coin => 0, loss_item => [{21808, 1}, {20326, 1}],
      eqm_reset_val => 15, lucky_val => 130};
get_reset({3, 11, 100, 0}) ->
    #{loss_coin => 0, loss_item => [{21808, 1}, {20326, 1}],
      eqm_reset_val => 15, lucky_val => 130};
get_reset({3, 12, 100, 0}) ->
    #{loss_coin => 0, loss_item => [{21808, 1}, {20326, 1}],
      eqm_reset_val => 15, lucky_val => 130};
get_reset({3, 14, 100, 0}) ->
    #{loss_coin => 0, loss_item => [{21808, 1}, {20326, 1}],
      eqm_reset_val => 15, lucky_val => 130};
get_reset({4, 4, 100, 1}) ->
    #{loss_coin => 0, loss_item => [{21804, 1}, {20316, 1}],
      eqm_reset_val => 15, lucky_val => 130};
get_reset({4, 6, 100, 1}) ->
    #{loss_coin => 0, loss_item => [{21804, 1}, {20316, 1}],
      eqm_reset_val => 15, lucky_val => 130};
get_reset({4, 7, 100, 1}) ->
    #{loss_coin => 0, loss_item => [{21804, 1}, {20316, 1}],
      eqm_reset_val => 15, lucky_val => 130};
get_reset({4, 9, 100, 1}) ->
    #{loss_coin => 0, loss_item => [{21804, 1}, {20316, 1}],
      eqm_reset_val => 15, lucky_val => 130};
get_reset({4, 10, 100, 1}) ->
    #{loss_coin => 0, loss_item => [{21804, 1}, {20326, 1}],
      eqm_reset_val => 15, lucky_val => 130};
get_reset({4, 11, 100, 1}) ->
    #{loss_coin => 0, loss_item => [{21804, 1}, {20326, 1}],
      eqm_reset_val => 15, lucky_val => 130};
get_reset({4, 12, 100, 1}) ->
    #{loss_coin => 0, loss_item => [{21804, 1}, {20326, 1}],
      eqm_reset_val => 15, lucky_val => 130};
get_reset({4, 14, 100, 1}) ->
    #{loss_coin => 0, loss_item => [{21804, 1}, {20326, 1}],
      eqm_reset_val => 15, lucky_val => 130};
get_reset({4, 4, 100, 0}) ->
    #{loss_coin => 0, loss_item => [{21809, 1}, {20316, 1}],
      eqm_reset_val => 15, lucky_val => 130};
get_reset({4, 6, 100, 0}) ->
    #{loss_coin => 0, loss_item => [{21809, 1}, {20316, 1}],
      eqm_reset_val => 15, lucky_val => 130};
get_reset({4, 7, 100, 0}) ->
    #{loss_coin => 0, loss_item => [{21809, 1}, {20316, 1}],
      eqm_reset_val => 15, lucky_val => 130};
get_reset({4, 9, 100, 0}) ->
    #{loss_coin => 0, loss_item => [{21809, 1}, {20316, 1}],
      eqm_reset_val => 15, lucky_val => 130};
get_reset({4, 10, 100, 0}) ->
    #{loss_coin => 0, loss_item => [{21809, 1}, {20326, 1}],
      eqm_reset_val => 15, lucky_val => 130};
get_reset({4, 11, 100, 0}) ->
    #{loss_coin => 0, loss_item => [{21809, 1}, {20326, 1}],
      eqm_reset_val => 15, lucky_val => 130};
get_reset({4, 12, 100, 0}) ->
    #{loss_coin => 0, loss_item => [{21809, 1}, {20326, 1}],
      eqm_reset_val => 15, lucky_val => 130};
get_reset({4, 14, 100, 0}) ->
    #{loss_coin => 0, loss_item => [{21809, 1}, {20326, 1}],
      eqm_reset_val => 15, lucky_val => 130};
get_reset({5, 5, 100, 1}) ->
    #{loss_coin => 0, loss_item => [{21805, 1}, {20316, 1}],
      eqm_reset_val => 15, lucky_val => 130};
get_reset({5, 6, 100, 1}) ->
    #{loss_coin => 0, loss_item => [{21805, 1}, {20316, 1}],
      eqm_reset_val => 15, lucky_val => 130};
get_reset({5, 7, 100, 1}) ->
    #{loss_coin => 0, loss_item => [{21805, 1}, {20316, 1}],
      eqm_reset_val => 15, lucky_val => 130};
get_reset({5, 9, 100, 1}) ->
    #{loss_coin => 0, loss_item => [{21805, 1}, {20316, 1}],
      eqm_reset_val => 15, lucky_val => 130};
get_reset({5, 10, 100, 1}) ->
    #{loss_coin => 0, loss_item => [{21805, 1}, {20326, 1}],
      eqm_reset_val => 15, lucky_val => 130};
get_reset({5, 11, 100, 1}) ->
    #{loss_coin => 0, loss_item => [{21805, 1}, {20326, 1}],
      eqm_reset_val => 15, lucky_val => 130};
get_reset({5, 12, 100, 1}) ->
    #{loss_coin => 0, loss_item => [{21805, 1}, {20326, 1}],
      eqm_reset_val => 15, lucky_val => 130};
get_reset({5, 14, 100, 1}) ->
    #{loss_coin => 0, loss_item => [{21805, 1}, {20326, 1}],
      eqm_reset_val => 15, lucky_val => 130};
get_reset({5, 5, 100, 0}) ->
    #{loss_coin => 0, loss_item => [{21810, 1}, {20316, 1}],
      eqm_reset_val => 15, lucky_val => 130};
get_reset({5, 6, 100, 0}) ->
    #{loss_coin => 0, loss_item => [{21810, 1}, {20316, 1}],
      eqm_reset_val => 15, lucky_val => 130};
get_reset({5, 7, 100, 0}) ->
    #{loss_coin => 0, loss_item => [{21810, 1}, {20316, 1}],
      eqm_reset_val => 15, lucky_val => 130};
get_reset({5, 9, 100, 0}) ->
    #{loss_coin => 0, loss_item => [{21810, 1}, {20316, 1}],
      eqm_reset_val => 15, lucky_val => 130};
get_reset({5, 10, 100, 0}) ->
    #{loss_coin => 0, loss_item => [{21810, 1}, {20326, 1}],
      eqm_reset_val => 15, lucky_val => 130};
get_reset({5, 11, 100, 0}) ->
    #{loss_coin => 0, loss_item => [{21810, 1}, {20326, 1}],
      eqm_reset_val => 15, lucky_val => 130};
get_reset({5, 12, 100, 0}) ->
    #{loss_coin => 0, loss_item => [{21810, 1}, {20326, 1}],
      eqm_reset_val => 15, lucky_val => 130};
get_reset({5, 14, 100, 0}) ->
    #{loss_coin => 0, loss_item => [{21810, 1}, {20326, 1}],
      eqm_reset_val => 15, lucky_val => 130};
get_reset({7, 22, 110, 1}) ->
    #{loss_coin => 0, loss_item => [{21974, 1}, {20317, 1}],
      eqm_reset_val => 15, lucky_val => 140};
get_reset({7, 6, 110, 1}) ->
    #{loss_coin => 0, loss_item => [{21974, 1}, {20317, 1}],
      eqm_reset_val => 15, lucky_val => 140};
get_reset({7, 7, 110, 1}) ->
    #{loss_coin => 0, loss_item => [{21974, 1}, {20317, 1}],
      eqm_reset_val => 15, lucky_val => 140};
get_reset({7, 9, 110, 1}) ->
    #{loss_coin => 0, loss_item => [{21974, 1}, {20317, 1}],
      eqm_reset_val => 15, lucky_val => 140};
get_reset({7, 10, 110, 1}) ->
    #{loss_coin => 0, loss_item => [{21974, 1}, {20317, 1}],
      eqm_reset_val => 15, lucky_val => 140};
get_reset({7, 11, 110, 1}) ->
    #{loss_coin => 0, loss_item => [{21974, 1}, {20317, 1}],
      eqm_reset_val => 15, lucky_val => 140};
get_reset({7, 12, 110, 1}) ->
    #{loss_coin => 0, loss_item => [{21974, 1}, {20317, 1}],
      eqm_reset_val => 15, lucky_val => 140};
get_reset({7, 14, 110, 1}) ->
    #{loss_coin => 0, loss_item => [{21974, 1}, {20317, 1}],
      eqm_reset_val => 15, lucky_val => 140};
get_reset({7, 22, 110, 0}) ->
    #{loss_coin => 0, loss_item => [{21975, 1}, {20317, 1}],
      eqm_reset_val => 15, lucky_val => 140};
get_reset({7, 6, 110, 0}) ->
    #{loss_coin => 0, loss_item => [{21975, 1}, {20317, 1}],
      eqm_reset_val => 15, lucky_val => 140};
get_reset({7, 7, 110, 0}) ->
    #{loss_coin => 0, loss_item => [{21975, 1}, {20317, 1}],
      eqm_reset_val => 15, lucky_val => 140};
get_reset({7, 9, 110, 0}) ->
    #{loss_coin => 0, loss_item => [{21975, 1}, {20317, 1}],
      eqm_reset_val => 15, lucky_val => 140};
get_reset({7, 10, 110, 0}) ->
    #{loss_coin => 0, loss_item => [{21975, 1}, {20317, 1}],
      eqm_reset_val => 15, lucky_val => 140};
get_reset({7, 11, 110, 0}) ->
    #{loss_coin => 0, loss_item => [{21975, 1}, {20317, 1}],
      eqm_reset_val => 15, lucky_val => 140};
get_reset({7, 12, 110, 0}) ->
    #{loss_coin => 0, loss_item => [{21975, 1}, {20317, 1}],
      eqm_reset_val => 15, lucky_val => 140};
get_reset({7, 14, 110, 0}) ->
    #{loss_coin => 0, loss_item => [{21975, 1}, {20317, 1}],
      eqm_reset_val => 15, lucky_val => 140};
get_reset({6, 21, 110, 1}) ->
    #{loss_coin => 0, loss_item => [{22015, 1}, {20317, 1}],
      eqm_reset_val => 15, lucky_val => 140};
get_reset({6, 6, 110, 1}) ->
    #{loss_coin => 0, loss_item => [{22015, 1}, {20317, 1}],
      eqm_reset_val => 15, lucky_val => 140};
get_reset({6, 7, 110, 1}) ->
    #{loss_coin => 0, loss_item => [{22015, 1}, {20317, 1}],
      eqm_reset_val => 15, lucky_val => 140};
get_reset({6, 9, 110, 1}) ->
    #{loss_coin => 0, loss_item => [{22015, 1}, {20317, 1}],
      eqm_reset_val => 15, lucky_val => 140};
get_reset({6, 10, 110, 1}) ->
    #{loss_coin => 0, loss_item => [{22015, 1}, {20317, 1}],
      eqm_reset_val => 15, lucky_val => 140};
get_reset({6, 11, 110, 1}) ->
    #{loss_coin => 0, loss_item => [{22015, 1}, {20317, 1}],
      eqm_reset_val => 15, lucky_val => 140};
get_reset({6, 12, 110, 1}) ->
    #{loss_coin => 0, loss_item => [{22015, 1}, {20317, 1}],
      eqm_reset_val => 15, lucky_val => 140};
get_reset({6, 14, 110, 1}) ->
    #{loss_coin => 0, loss_item => [{22015, 1}, {20317, 1}],
      eqm_reset_val => 15, lucky_val => 140};
get_reset({6, 21, 110, 0}) ->
    #{loss_coin => 0, loss_item => [{22021, 1}, {20317, 1}],
      eqm_reset_val => 15, lucky_val => 140};
get_reset({6, 6, 110, 0}) ->
    #{loss_coin => 0, loss_item => [{22021, 1}, {20317, 1}],
      eqm_reset_val => 15, lucky_val => 140};
get_reset({6, 7, 110, 0}) ->
    #{loss_coin => 0, loss_item => [{22021, 1}, {20317, 1}],
      eqm_reset_val => 15, lucky_val => 140};
get_reset({6, 9, 110, 0}) ->
    #{loss_coin => 0, loss_item => [{22021, 1}, {20317, 1}],
      eqm_reset_val => 15, lucky_val => 140};
get_reset({6, 10, 110, 0}) ->
    #{loss_coin => 0, loss_item => [{22021, 1}, {20317, 1}],
      eqm_reset_val => 15, lucky_val => 140};
get_reset({6, 11, 110, 0}) ->
    #{loss_coin => 0, loss_item => [{22021, 1}, {20317, 1}],
      eqm_reset_val => 15, lucky_val => 140};
get_reset({6, 12, 110, 0}) ->
    #{loss_coin => 0, loss_item => [{22021, 1}, {20317, 1}],
      eqm_reset_val => 15, lucky_val => 140};
get_reset({6, 14, 110, 0}) ->
    #{loss_coin => 0, loss_item => [{22021, 1}, {20317, 1}],
      eqm_reset_val => 15, lucky_val => 140};
get_reset({1, 1, 110, 1}) ->
    #{loss_coin => 0, loss_item => [{22010, 1}, {20317, 1}],
      eqm_reset_val => 15, lucky_val => 140};
get_reset({1, 6, 110, 1}) ->
    #{loss_coin => 0, loss_item => [{22010, 1}, {20327, 1}],
      eqm_reset_val => 15, lucky_val => 140};
get_reset({1, 7, 110, 1}) ->
    #{loss_coin => 0, loss_item => [{22010, 1}, {20327, 1}],
      eqm_reset_val => 15, lucky_val => 140};
get_reset({1, 9, 110, 1}) ->
    #{loss_coin => 0, loss_item => [{22010, 1}, {20327, 1}],
      eqm_reset_val => 15, lucky_val => 140};
get_reset({1, 10, 110, 1}) ->
    #{loss_coin => 0, loss_item => [{22010, 1}, {20327, 1}],
      eqm_reset_val => 15, lucky_val => 140};
get_reset({1, 11, 110, 1}) ->
    #{loss_coin => 0, loss_item => [{22010, 1}, {20317, 1}],
      eqm_reset_val => 15, lucky_val => 140};
get_reset({1, 12, 110, 1}) ->
    #{loss_coin => 0, loss_item => [{22010, 1}, {20317, 1}],
      eqm_reset_val => 15, lucky_val => 140};
get_reset({1, 14, 110, 1}) ->
    #{loss_coin => 0, loss_item => [{22010, 1}, {20317, 1}],
      eqm_reset_val => 15, lucky_val => 140};
get_reset({1, 1, 110, 0}) ->
    #{loss_coin => 0, loss_item => [{22016, 1}, {20317, 1}],
      eqm_reset_val => 15, lucky_val => 140};
get_reset({1, 6, 110, 0}) ->
    #{loss_coin => 0, loss_item => [{22016, 1}, {20327, 1}],
      eqm_reset_val => 15, lucky_val => 140};
get_reset({1, 7, 110, 0}) ->
    #{loss_coin => 0, loss_item => [{22016, 1}, {20327, 1}],
      eqm_reset_val => 15, lucky_val => 140};
get_reset({1, 9, 110, 0}) ->
    #{loss_coin => 0, loss_item => [{22016, 1}, {20327, 1}],
      eqm_reset_val => 15, lucky_val => 140};
get_reset({1, 10, 110, 0}) ->
    #{loss_coin => 0, loss_item => [{22016, 1}, {20327, 1}],
      eqm_reset_val => 15, lucky_val => 140};
get_reset({1, 11, 110, 0}) ->
    #{loss_coin => 0, loss_item => [{22016, 1}, {20317, 1}],
      eqm_reset_val => 15, lucky_val => 140};
get_reset({1, 12, 110, 0}) ->
    #{loss_coin => 0, loss_item => [{22016, 1}, {20317, 1}],
      eqm_reset_val => 15, lucky_val => 140};
get_reset({1, 14, 110, 0}) ->
    #{loss_coin => 0, loss_item => [{22016, 1}, {20317, 1}],
      eqm_reset_val => 15, lucky_val => 140};
get_reset({2, 2, 110, 1}) ->
    #{loss_coin => 0, loss_item => [{22011, 1}, {20317, 1}],
      eqm_reset_val => 15, lucky_val => 140};
get_reset({2, 6, 110, 1}) ->
    #{loss_coin => 0, loss_item => [{22011, 1}, {20327, 1}],
      eqm_reset_val => 15, lucky_val => 140};
get_reset({2, 7, 110, 1}) ->
    #{loss_coin => 0, loss_item => [{22011, 1}, {20327, 1}],
      eqm_reset_val => 15, lucky_val => 140};
get_reset({2, 9, 110, 1}) ->
    #{loss_coin => 0, loss_item => [{22011, 1}, {20327, 1}],
      eqm_reset_val => 15, lucky_val => 140};
get_reset({2, 10, 110, 1}) ->
    #{loss_coin => 0, loss_item => [{22011, 1}, {20327, 1}],
      eqm_reset_val => 15, lucky_val => 140};
get_reset({2, 11, 110, 1}) ->
    #{loss_coin => 0, loss_item => [{22011, 1}, {20317, 1}],
      eqm_reset_val => 15, lucky_val => 140};
get_reset({2, 12, 110, 1}) ->
    #{loss_coin => 0, loss_item => [{22011, 1}, {20317, 1}],
      eqm_reset_val => 15, lucky_val => 140};
get_reset({2, 14, 110, 1}) ->
    #{loss_coin => 0, loss_item => [{22011, 1}, {20317, 1}],
      eqm_reset_val => 15, lucky_val => 140};
get_reset({2, 2, 110, 0}) ->
    #{loss_coin => 0, loss_item => [{22017, 1}, {20317, 1}],
      eqm_reset_val => 15, lucky_val => 140};
get_reset({2, 6, 110, 0}) ->
    #{loss_coin => 0, loss_item => [{22017, 1}, {20327, 1}],
      eqm_reset_val => 15, lucky_val => 140};
get_reset({2, 7, 110, 0}) ->
    #{loss_coin => 0, loss_item => [{22017, 1}, {20327, 1}],
      eqm_reset_val => 15, lucky_val => 140};
get_reset({2, 9, 110, 0}) ->
    #{loss_coin => 0, loss_item => [{22017, 1}, {20327, 1}],
      eqm_reset_val => 15, lucky_val => 140};
get_reset({2, 10, 110, 0}) ->
    #{loss_coin => 0, loss_item => [{22017, 1}, {20327, 1}],
      eqm_reset_val => 15, lucky_val => 140};
get_reset({2, 11, 110, 0}) ->
    #{loss_coin => 0, loss_item => [{22017, 1}, {20317, 1}],
      eqm_reset_val => 15, lucky_val => 140};
get_reset({2, 12, 110, 0}) ->
    #{loss_coin => 0, loss_item => [{22017, 1}, {20317, 1}],
      eqm_reset_val => 15, lucky_val => 140};
get_reset({2, 14, 110, 0}) ->
    #{loss_coin => 0, loss_item => [{22017, 1}, {20317, 1}],
      eqm_reset_val => 15, lucky_val => 140};
get_reset({3, 3, 110, 1}) ->
    #{loss_coin => 0, loss_item => [{22012, 1}, {20317, 1}],
      eqm_reset_val => 15, lucky_val => 140};
get_reset({3, 6, 110, 1}) ->
    #{loss_coin => 0, loss_item => [{22012, 1}, {20327, 1}],
      eqm_reset_val => 15, lucky_val => 140};
get_reset({3, 7, 110, 1}) ->
    #{loss_coin => 0, loss_item => [{22012, 1}, {20327, 1}],
      eqm_reset_val => 15, lucky_val => 140};
get_reset({3, 9, 110, 1}) ->
    #{loss_coin => 0, loss_item => [{22012, 1}, {20327, 1}],
      eqm_reset_val => 15, lucky_val => 140};
get_reset({3, 10, 110, 1}) ->
    #{loss_coin => 0, loss_item => [{22012, 1}, {20327, 1}],
      eqm_reset_val => 15, lucky_val => 140};
get_reset({3, 11, 110, 1}) ->
    #{loss_coin => 0, loss_item => [{22012, 1}, {20317, 1}],
      eqm_reset_val => 15, lucky_val => 140};
get_reset({3, 12, 110, 1}) ->
    #{loss_coin => 0, loss_item => [{22012, 1}, {20317, 1}],
      eqm_reset_val => 15, lucky_val => 140};
get_reset({3, 14, 110, 1}) ->
    #{loss_coin => 0, loss_item => [{22012, 1}, {20317, 1}],
      eqm_reset_val => 15, lucky_val => 140};
get_reset({3, 3, 110, 0}) ->
    #{loss_coin => 0, loss_item => [{22018, 1}, {20317, 1}],
      eqm_reset_val => 15, lucky_val => 140};
get_reset({3, 6, 110, 0}) ->
    #{loss_coin => 0, loss_item => [{22018, 1}, {20327, 1}],
      eqm_reset_val => 15, lucky_val => 140};
get_reset({3, 7, 110, 0}) ->
    #{loss_coin => 0, loss_item => [{22018, 1}, {20327, 1}],
      eqm_reset_val => 15, lucky_val => 140};
get_reset({3, 9, 110, 0}) ->
    #{loss_coin => 0, loss_item => [{22018, 1}, {20327, 1}],
      eqm_reset_val => 15, lucky_val => 140};
get_reset({3, 10, 110, 0}) ->
    #{loss_coin => 0, loss_item => [{22018, 1}, {20327, 1}],
      eqm_reset_val => 15, lucky_val => 140};
get_reset({3, 11, 110, 0}) ->
    #{loss_coin => 0, loss_item => [{22018, 1}, {20317, 1}],
      eqm_reset_val => 15, lucky_val => 140};
get_reset({3, 12, 110, 0}) ->
    #{loss_coin => 0, loss_item => [{22018, 1}, {20317, 1}],
      eqm_reset_val => 15, lucky_val => 140};
get_reset({3, 14, 110, 0}) ->
    #{loss_coin => 0, loss_item => [{22018, 1}, {20317, 1}],
      eqm_reset_val => 15, lucky_val => 140};
get_reset({4, 4, 110, 1}) ->
    #{loss_coin => 0, loss_item => [{22013, 1}, {20317, 1}],
      eqm_reset_val => 15, lucky_val => 140};
get_reset({4, 6, 110, 1}) ->
    #{loss_coin => 0, loss_item => [{22013, 1}, {20327, 1}],
      eqm_reset_val => 15, lucky_val => 140};
get_reset({4, 7, 110, 1}) ->
    #{loss_coin => 0, loss_item => [{22013, 1}, {20327, 1}],
      eqm_reset_val => 15, lucky_val => 140};
get_reset({4, 9, 110, 1}) ->
    #{loss_coin => 0, loss_item => [{22013, 1}, {20327, 1}],
      eqm_reset_val => 15, lucky_val => 140};
get_reset({4, 10, 110, 1}) ->
    #{loss_coin => 0, loss_item => [{22013, 1}, {20327, 1}],
      eqm_reset_val => 15, lucky_val => 140};
get_reset({4, 11, 110, 1}) ->
    #{loss_coin => 0, loss_item => [{22013, 1}, {20317, 1}],
      eqm_reset_val => 15, lucky_val => 140};
get_reset({4, 12, 110, 1}) ->
    #{loss_coin => 0, loss_item => [{22013, 1}, {20317, 1}],
      eqm_reset_val => 15, lucky_val => 140};
get_reset({4, 14, 110, 1}) ->
    #{loss_coin => 0, loss_item => [{22013, 1}, {20317, 1}],
      eqm_reset_val => 15, lucky_val => 140};
get_reset({4, 4, 110, 0}) ->
    #{loss_coin => 0, loss_item => [{22019, 1}, {20317, 1}],
      eqm_reset_val => 15, lucky_val => 140};
get_reset({4, 6, 110, 0}) ->
    #{loss_coin => 0, loss_item => [{22019, 1}, {20327, 1}],
      eqm_reset_val => 15, lucky_val => 140};
get_reset({4, 7, 110, 0}) ->
    #{loss_coin => 0, loss_item => [{22019, 1}, {20327, 1}],
      eqm_reset_val => 15, lucky_val => 140};
get_reset({4, 9, 110, 0}) ->
    #{loss_coin => 0, loss_item => [{22019, 1}, {20327, 1}],
      eqm_reset_val => 15, lucky_val => 140};
get_reset({4, 10, 110, 0}) ->
    #{loss_coin => 0, loss_item => [{22019, 1}, {20327, 1}],
      eqm_reset_val => 15, lucky_val => 140};
get_reset({4, 11, 110, 0}) ->
    #{loss_coin => 0, loss_item => [{22019, 1}, {20317, 1}],
      eqm_reset_val => 15, lucky_val => 140};
get_reset({4, 12, 110, 0}) ->
    #{loss_coin => 0, loss_item => [{22019, 1}, {20317, 1}],
      eqm_reset_val => 15, lucky_val => 140};
get_reset({4, 14, 110, 0}) ->
    #{loss_coin => 0, loss_item => [{22019, 1}, {20317, 1}],
      eqm_reset_val => 15, lucky_val => 140};
get_reset({5, 5, 110, 1}) ->
    #{loss_coin => 0, loss_item => [{22014, 1}, {20317, 1}],
      eqm_reset_val => 15, lucky_val => 140};
get_reset({5, 6, 110, 1}) ->
    #{loss_coin => 0, loss_item => [{22014, 1}, {20327, 1}],
      eqm_reset_val => 15, lucky_val => 140};
get_reset({5, 7, 110, 1}) ->
    #{loss_coin => 0, loss_item => [{22014, 1}, {20327, 1}],
      eqm_reset_val => 15, lucky_val => 140};
get_reset({5, 9, 110, 1}) ->
    #{loss_coin => 0, loss_item => [{22014, 1}, {20327, 1}],
      eqm_reset_val => 15, lucky_val => 140};
get_reset({5, 10, 110, 1}) ->
    #{loss_coin => 0, loss_item => [{22014, 1}, {20327, 1}],
      eqm_reset_val => 15, lucky_val => 140};
get_reset({5, 11, 110, 1}) ->
    #{loss_coin => 0, loss_item => [{22014, 1}, {20317, 1}],
      eqm_reset_val => 15, lucky_val => 140};
get_reset({5, 12, 110, 1}) ->
    #{loss_coin => 0, loss_item => [{22014, 1}, {20317, 1}],
      eqm_reset_val => 15, lucky_val => 140};
get_reset({5, 14, 110, 1}) ->
    #{loss_coin => 0, loss_item => [{22014, 1}, {20317, 1}],
      eqm_reset_val => 15, lucky_val => 140};
get_reset({5, 5, 110, 0}) ->
    #{loss_coin => 0, loss_item => [{22020, 1}, {20317, 1}],
      eqm_reset_val => 15, lucky_val => 140};
get_reset({5, 6, 110, 0}) ->
    #{loss_coin => 0, loss_item => [{22020, 1}, {20327, 1}],
      eqm_reset_val => 15, lucky_val => 140};
get_reset({5, 7, 110, 0}) ->
    #{loss_coin => 0, loss_item => [{22020, 1}, {20327, 1}],
      eqm_reset_val => 15, lucky_val => 140};
get_reset({5, 9, 110, 0}) ->
    #{loss_coin => 0, loss_item => [{22020, 1}, {20327, 1}],
      eqm_reset_val => 15, lucky_val => 140};
get_reset({5, 10, 110, 0}) ->
    #{loss_coin => 0, loss_item => [{22020, 1}, {20327, 1}],
      eqm_reset_val => 15, lucky_val => 140};
get_reset({5, 11, 110, 0}) ->
    #{loss_coin => 0, loss_item => [{22020, 1}, {20317, 1}],
      eqm_reset_val => 15, lucky_val => 140};
get_reset({5, 12, 110, 0}) ->
    #{loss_coin => 0, loss_item => [{22020, 1}, {20317, 1}],
      eqm_reset_val => 15, lucky_val => 140};
get_reset({5, 14, 110, 0}) ->
    #{loss_coin => 0, loss_item => [{22020, 1}, {20317, 1}],
      eqm_reset_val => 15, lucky_val => 140};
get_reset({7, 22, 120, 1}) ->
    #{loss_coin => 0, loss_item => [{22036, 1}, {20318, 1}],
      eqm_reset_val => 15, lucky_val => 150};
get_reset({7, 6, 120, 1}) ->
    #{loss_coin => 0, loss_item => [{22036, 1}, {20318, 1}],
      eqm_reset_val => 15, lucky_val => 150};
get_reset({7, 7, 120, 1}) ->
    #{loss_coin => 0, loss_item => [{22036, 1}, {20318, 1}],
      eqm_reset_val => 15, lucky_val => 150};
get_reset({7, 9, 120, 1}) ->
    #{loss_coin => 0, loss_item => [{22036, 1}, {20318, 1}],
      eqm_reset_val => 15, lucky_val => 150};
get_reset({7, 10, 120, 1}) ->
    #{loss_coin => 0, loss_item => [{22036, 1}, {20318, 1}],
      eqm_reset_val => 15, lucky_val => 150};
get_reset({7, 11, 120, 1}) ->
    #{loss_coin => 0, loss_item => [{22036, 1}, {20318, 1}],
      eqm_reset_val => 15, lucky_val => 150};
get_reset({7, 12, 120, 1}) ->
    #{loss_coin => 0, loss_item => [{22036, 1}, {20318, 1}],
      eqm_reset_val => 15, lucky_val => 150};
get_reset({7, 14, 120, 1}) ->
    #{loss_coin => 0, loss_item => [{22036, 1}, {20318, 1}],
      eqm_reset_val => 15, lucky_val => 150};
get_reset({7, 22, 120, 0}) ->
    #{loss_coin => 0, loss_item => [{22043, 1}, {20318, 1}],
      eqm_reset_val => 15, lucky_val => 150};
get_reset({7, 6, 120, 0}) ->
    #{loss_coin => 0, loss_item => [{22043, 1}, {20318, 1}],
      eqm_reset_val => 15, lucky_val => 150};
get_reset({7, 7, 120, 0}) ->
    #{loss_coin => 0, loss_item => [{22043, 1}, {20318, 1}],
      eqm_reset_val => 15, lucky_val => 150};
get_reset({7, 9, 120, 0}) ->
    #{loss_coin => 0, loss_item => [{22043, 1}, {20318, 1}],
      eqm_reset_val => 15, lucky_val => 150};
get_reset({7, 10, 120, 0}) ->
    #{loss_coin => 0, loss_item => [{22043, 1}, {20318, 1}],
      eqm_reset_val => 15, lucky_val => 150};
get_reset({7, 11, 120, 0}) ->
    #{loss_coin => 0, loss_item => [{22043, 1}, {20318, 1}],
      eqm_reset_val => 15, lucky_val => 150};
get_reset({7, 12, 120, 0}) ->
    #{loss_coin => 0, loss_item => [{22043, 1}, {20318, 1}],
      eqm_reset_val => 15, lucky_val => 150};
get_reset({7, 14, 120, 0}) ->
    #{loss_coin => 0, loss_item => [{22043, 1}, {20318, 1}],
      eqm_reset_val => 15, lucky_val => 150};
get_reset({6, 21, 120, 1}) ->
    #{loss_coin => 0, loss_item => [{22035, 1}, {20318, 1}],
      eqm_reset_val => 15, lucky_val => 150};
get_reset({6, 6, 120, 1}) ->
    #{loss_coin => 0, loss_item => [{22035, 1}, {20318, 1}],
      eqm_reset_val => 15, lucky_val => 150};
get_reset({6, 7, 120, 1}) ->
    #{loss_coin => 0, loss_item => [{22035, 1}, {20318, 1}],
      eqm_reset_val => 15, lucky_val => 150};
get_reset({6, 9, 120, 1}) ->
    #{loss_coin => 0, loss_item => [{22035, 1}, {20318, 1}],
      eqm_reset_val => 15, lucky_val => 150};
get_reset({6, 10, 120, 1}) ->
    #{loss_coin => 0, loss_item => [{22035, 1}, {20318, 1}],
      eqm_reset_val => 15, lucky_val => 150};
get_reset({6, 11, 120, 1}) ->
    #{loss_coin => 0, loss_item => [{22035, 1}, {20318, 1}],
      eqm_reset_val => 15, lucky_val => 150};
get_reset({6, 12, 120, 1}) ->
    #{loss_coin => 0, loss_item => [{22035, 1}, {20318, 1}],
      eqm_reset_val => 15, lucky_val => 150};
get_reset({6, 14, 120, 1}) ->
    #{loss_coin => 0, loss_item => [{22035, 1}, {20318, 1}],
      eqm_reset_val => 15, lucky_val => 150};
get_reset({6, 21, 120, 0}) ->
    #{loss_coin => 0, loss_item => [{22042, 1}, {20318, 1}],
      eqm_reset_val => 15, lucky_val => 150};
get_reset({6, 6, 120, 0}) ->
    #{loss_coin => 0, loss_item => [{22042, 1}, {20318, 1}],
      eqm_reset_val => 15, lucky_val => 150};
get_reset({6, 7, 120, 0}) ->
    #{loss_coin => 0, loss_item => [{22042, 1}, {20318, 1}],
      eqm_reset_val => 15, lucky_val => 150};
get_reset({6, 9, 120, 0}) ->
    #{loss_coin => 0, loss_item => [{22042, 1}, {20318, 1}],
      eqm_reset_val => 15, lucky_val => 150};
get_reset({6, 10, 120, 0}) ->
    #{loss_coin => 0, loss_item => [{22042, 1}, {20318, 1}],
      eqm_reset_val => 15, lucky_val => 150};
get_reset({6, 11, 120, 0}) ->
    #{loss_coin => 0, loss_item => [{22042, 1}, {20318, 1}],
      eqm_reset_val => 15, lucky_val => 150};
get_reset({6, 12, 120, 0}) ->
    #{loss_coin => 0, loss_item => [{22042, 1}, {20318, 1}],
      eqm_reset_val => 15, lucky_val => 150};
get_reset({6, 14, 120, 0}) ->
    #{loss_coin => 0, loss_item => [{22042, 1}, {20318, 1}],
      eqm_reset_val => 15, lucky_val => 150};
get_reset({1, 1, 120, 1}) ->
    #{loss_coin => 0, loss_item => [{22030, 1}, {20318, 1}],
      eqm_reset_val => 15, lucky_val => 150};
get_reset({1, 6, 120, 1}) ->
    #{loss_coin => 0, loss_item => [{22030, 1}, {20328, 1}],
      eqm_reset_val => 15, lucky_val => 150};
get_reset({1, 7, 120, 1}) ->
    #{loss_coin => 0, loss_item => [{22030, 1}, {20328, 1}],
      eqm_reset_val => 15, lucky_val => 150};
get_reset({1, 9, 120, 1}) ->
    #{loss_coin => 0, loss_item => [{22030, 1}, {20328, 1}],
      eqm_reset_val => 15, lucky_val => 150};
get_reset({1, 10, 120, 1}) ->
    #{loss_coin => 0, loss_item => [{22030, 1}, {20328, 1}],
      eqm_reset_val => 15, lucky_val => 150};
get_reset({1, 11, 120, 1}) ->
    #{loss_coin => 0, loss_item => [{22030, 1}, {20318, 1}],
      eqm_reset_val => 15, lucky_val => 150};
get_reset({1, 12, 120, 1}) ->
    #{loss_coin => 0, loss_item => [{22030, 1}, {20318, 1}],
      eqm_reset_val => 15, lucky_val => 150};
get_reset({1, 14, 120, 1}) ->
    #{loss_coin => 0, loss_item => [{22030, 1}, {20318, 1}],
      eqm_reset_val => 15, lucky_val => 150};
get_reset({1, 1, 120, 0}) ->
    #{loss_coin => 0, loss_item => [{22037, 1}, {20318, 1}],
      eqm_reset_val => 15, lucky_val => 150};
get_reset({1, 6, 120, 0}) ->
    #{loss_coin => 0, loss_item => [{22037, 1}, {20328, 1}],
      eqm_reset_val => 15, lucky_val => 150};
get_reset({1, 7, 120, 0}) ->
    #{loss_coin => 0, loss_item => [{22037, 1}, {20328, 1}],
      eqm_reset_val => 15, lucky_val => 150};
get_reset({1, 9, 120, 0}) ->
    #{loss_coin => 0, loss_item => [{22037, 1}, {20328, 1}],
      eqm_reset_val => 15, lucky_val => 150};
get_reset({1, 10, 120, 0}) ->
    #{loss_coin => 0, loss_item => [{22037, 1}, {20328, 1}],
      eqm_reset_val => 15, lucky_val => 150};
get_reset({1, 11, 120, 0}) ->
    #{loss_coin => 0, loss_item => [{22037, 1}, {20318, 1}],
      eqm_reset_val => 15, lucky_val => 150};
get_reset({1, 12, 120, 0}) ->
    #{loss_coin => 0, loss_item => [{22037, 1}, {20318, 1}],
      eqm_reset_val => 15, lucky_val => 150};
get_reset({1, 14, 120, 0}) ->
    #{loss_coin => 0, loss_item => [{22037, 1}, {20318, 1}],
      eqm_reset_val => 15, lucky_val => 150};
get_reset({2, 2, 120, 1}) ->
    #{loss_coin => 0, loss_item => [{22031, 1}, {20318, 1}],
      eqm_reset_val => 15, lucky_val => 150};
get_reset({2, 6, 120, 1}) ->
    #{loss_coin => 0, loss_item => [{22031, 1}, {20328, 1}],
      eqm_reset_val => 15, lucky_val => 150};
get_reset({2, 7, 120, 1}) ->
    #{loss_coin => 0, loss_item => [{22031, 1}, {20328, 1}],
      eqm_reset_val => 15, lucky_val => 150};
get_reset({2, 9, 120, 1}) ->
    #{loss_coin => 0, loss_item => [{22031, 1}, {20328, 1}],
      eqm_reset_val => 15, lucky_val => 150};
get_reset({2, 10, 120, 1}) ->
    #{loss_coin => 0, loss_item => [{22031, 1}, {20328, 1}],
      eqm_reset_val => 15, lucky_val => 150};
get_reset({2, 11, 120, 1}) ->
    #{loss_coin => 0, loss_item => [{22031, 1}, {20318, 1}],
      eqm_reset_val => 15, lucky_val => 150};
get_reset({2, 12, 120, 1}) ->
    #{loss_coin => 0, loss_item => [{22031, 1}, {20318, 1}],
      eqm_reset_val => 15, lucky_val => 150};
get_reset({2, 14, 120, 1}) ->
    #{loss_coin => 0, loss_item => [{22031, 1}, {20318, 1}],
      eqm_reset_val => 15, lucky_val => 150};
get_reset({2, 2, 120, 0}) ->
    #{loss_coin => 0, loss_item => [{22038, 1}, {20318, 1}],
      eqm_reset_val => 15, lucky_val => 150};
get_reset({2, 6, 120, 0}) ->
    #{loss_coin => 0, loss_item => [{22038, 1}, {20328, 1}],
      eqm_reset_val => 15, lucky_val => 150};
get_reset({2, 7, 120, 0}) ->
    #{loss_coin => 0, loss_item => [{22038, 1}, {20328, 1}],
      eqm_reset_val => 15, lucky_val => 150};
get_reset({2, 9, 120, 0}) ->
    #{loss_coin => 0, loss_item => [{22038, 1}, {20328, 1}],
      eqm_reset_val => 15, lucky_val => 150};
get_reset({2, 10, 120, 0}) ->
    #{loss_coin => 0, loss_item => [{22038, 1}, {20328, 1}],
      eqm_reset_val => 15, lucky_val => 150};
get_reset({2, 11, 120, 0}) ->
    #{loss_coin => 0, loss_item => [{22038, 1}, {20318, 1}],
      eqm_reset_val => 15, lucky_val => 150};
get_reset({2, 12, 120, 0}) ->
    #{loss_coin => 0, loss_item => [{22038, 1}, {20318, 1}],
      eqm_reset_val => 15, lucky_val => 150};
get_reset({2, 14, 120, 0}) ->
    #{loss_coin => 0, loss_item => [{22038, 1}, {20318, 1}],
      eqm_reset_val => 15, lucky_val => 150};
get_reset({3, 3, 120, 1}) ->
    #{loss_coin => 0, loss_item => [{22032, 1}, {20318, 1}],
      eqm_reset_val => 15, lucky_val => 150};
get_reset({3, 6, 120, 1}) ->
    #{loss_coin => 0, loss_item => [{22032, 1}, {20328, 1}],
      eqm_reset_val => 15, lucky_val => 150};
get_reset({3, 7, 120, 1}) ->
    #{loss_coin => 0, loss_item => [{22032, 1}, {20328, 1}],
      eqm_reset_val => 15, lucky_val => 150};
get_reset({3, 9, 120, 1}) ->
    #{loss_coin => 0, loss_item => [{22032, 1}, {20328, 1}],
      eqm_reset_val => 15, lucky_val => 150};
get_reset({3, 10, 120, 1}) ->
    #{loss_coin => 0, loss_item => [{22032, 1}, {20328, 1}],
      eqm_reset_val => 15, lucky_val => 150};
get_reset({3, 11, 120, 1}) ->
    #{loss_coin => 0, loss_item => [{22032, 1}, {20318, 1}],
      eqm_reset_val => 15, lucky_val => 150};
get_reset({3, 12, 120, 1}) ->
    #{loss_coin => 0, loss_item => [{22032, 1}, {20318, 1}],
      eqm_reset_val => 15, lucky_val => 150};
get_reset({3, 14, 120, 1}) ->
    #{loss_coin => 0, loss_item => [{22032, 1}, {20318, 1}],
      eqm_reset_val => 15, lucky_val => 150};
get_reset({3, 3, 120, 0}) ->
    #{loss_coin => 0, loss_item => [{22039, 1}, {20318, 1}],
      eqm_reset_val => 15, lucky_val => 150};
get_reset({3, 6, 120, 0}) ->
    #{loss_coin => 0, loss_item => [{22039, 1}, {20328, 1}],
      eqm_reset_val => 15, lucky_val => 150};
get_reset({3, 7, 120, 0}) ->
    #{loss_coin => 0, loss_item => [{22039, 1}, {20328, 1}],
      eqm_reset_val => 15, lucky_val => 150};
get_reset({3, 9, 120, 0}) ->
    #{loss_coin => 0, loss_item => [{22039, 1}, {20328, 1}],
      eqm_reset_val => 15, lucky_val => 150};
get_reset({3, 10, 120, 0}) ->
    #{loss_coin => 0, loss_item => [{22039, 1}, {20328, 1}],
      eqm_reset_val => 15, lucky_val => 150};
get_reset({3, 11, 120, 0}) ->
    #{loss_coin => 0, loss_item => [{22039, 1}, {20318, 1}],
      eqm_reset_val => 15, lucky_val => 150};
get_reset({3, 12, 120, 0}) ->
    #{loss_coin => 0, loss_item => [{22039, 1}, {20318, 1}],
      eqm_reset_val => 15, lucky_val => 150};
get_reset({3, 14, 120, 0}) ->
    #{loss_coin => 0, loss_item => [{22039, 1}, {20318, 1}],
      eqm_reset_val => 15, lucky_val => 150};
get_reset({4, 4, 120, 1}) ->
    #{loss_coin => 0, loss_item => [{22033, 1}, {20318, 1}],
      eqm_reset_val => 15, lucky_val => 150};
get_reset({4, 6, 120, 1}) ->
    #{loss_coin => 0, loss_item => [{22033, 1}, {20328, 1}],
      eqm_reset_val => 15, lucky_val => 150};
get_reset({4, 7, 120, 1}) ->
    #{loss_coin => 0, loss_item => [{22033, 1}, {20328, 1}],
      eqm_reset_val => 15, lucky_val => 150};
get_reset({4, 9, 120, 1}) ->
    #{loss_coin => 0, loss_item => [{22033, 1}, {20328, 1}],
      eqm_reset_val => 15, lucky_val => 150};
get_reset({4, 10, 120, 1}) ->
    #{loss_coin => 0, loss_item => [{22033, 1}, {20328, 1}],
      eqm_reset_val => 15, lucky_val => 150};
get_reset({4, 11, 120, 1}) ->
    #{loss_coin => 0, loss_item => [{22033, 1}, {20318, 1}],
      eqm_reset_val => 15, lucky_val => 150};
get_reset({4, 12, 120, 1}) ->
    #{loss_coin => 0, loss_item => [{22033, 1}, {20318, 1}],
      eqm_reset_val => 15, lucky_val => 150};
get_reset({4, 14, 120, 1}) ->
    #{loss_coin => 0, loss_item => [{22033, 1}, {20318, 1}],
      eqm_reset_val => 15, lucky_val => 150};
get_reset({4, 4, 120, 0}) ->
    #{loss_coin => 0, loss_item => [{22040, 1}, {20318, 1}],
      eqm_reset_val => 15, lucky_val => 150};
get_reset({4, 6, 120, 0}) ->
    #{loss_coin => 0, loss_item => [{22040, 1}, {20328, 1}],
      eqm_reset_val => 15, lucky_val => 150};
get_reset({4, 7, 120, 0}) ->
    #{loss_coin => 0, loss_item => [{22040, 1}, {20328, 1}],
      eqm_reset_val => 15, lucky_val => 150};
get_reset({4, 9, 120, 0}) ->
    #{loss_coin => 0, loss_item => [{22040, 1}, {20328, 1}],
      eqm_reset_val => 15, lucky_val => 150};
get_reset({4, 10, 120, 0}) ->
    #{loss_coin => 0, loss_item => [{22040, 1}, {20328, 1}],
      eqm_reset_val => 15, lucky_val => 150};
get_reset({4, 11, 120, 0}) ->
    #{loss_coin => 0, loss_item => [{22040, 1}, {20318, 1}],
      eqm_reset_val => 15, lucky_val => 150};
get_reset({4, 12, 120, 0}) ->
    #{loss_coin => 0, loss_item => [{22040, 1}, {20318, 1}],
      eqm_reset_val => 15, lucky_val => 150};
get_reset({4, 14, 120, 0}) ->
    #{loss_coin => 0, loss_item => [{22040, 1}, {20318, 1}],
      eqm_reset_val => 15, lucky_val => 150};
get_reset({5, 5, 120, 1}) ->
    #{loss_coin => 0, loss_item => [{22034, 1}, {20318, 1}],
      eqm_reset_val => 15, lucky_val => 150};
get_reset({5, 6, 120, 1}) ->
    #{loss_coin => 0, loss_item => [{22034, 1}, {20328, 1}],
      eqm_reset_val => 15, lucky_val => 150};
get_reset({5, 7, 120, 1}) ->
    #{loss_coin => 0, loss_item => [{22034, 1}, {20328, 1}],
      eqm_reset_val => 15, lucky_val => 150};
get_reset({5, 9, 120, 1}) ->
    #{loss_coin => 0, loss_item => [{22034, 1}, {20328, 1}],
      eqm_reset_val => 15, lucky_val => 150};
get_reset({5, 10, 120, 1}) ->
    #{loss_coin => 0, loss_item => [{22034, 1}, {20328, 1}],
      eqm_reset_val => 15, lucky_val => 150};
get_reset({5, 11, 120, 1}) ->
    #{loss_coin => 0, loss_item => [{22034, 1}, {20318, 1}],
      eqm_reset_val => 15, lucky_val => 150};
get_reset({5, 12, 120, 1}) ->
    #{loss_coin => 0, loss_item => [{22034, 1}, {20318, 1}],
      eqm_reset_val => 15, lucky_val => 150};
get_reset({5, 14, 120, 1}) ->
    #{loss_coin => 0, loss_item => [{22034, 1}, {20318, 1}],
      eqm_reset_val => 15, lucky_val => 150};
get_reset({5, 5, 120, 0}) ->
    #{loss_coin => 0, loss_item => [{22041, 1}, {20318, 1}],
      eqm_reset_val => 15, lucky_val => 150};
get_reset({5, 6, 120, 0}) ->
    #{loss_coin => 0, loss_item => [{22041, 1}, {20328, 1}],
      eqm_reset_val => 15, lucky_val => 150};
get_reset({5, 7, 120, 0}) ->
    #{loss_coin => 0, loss_item => [{22041, 1}, {20328, 1}],
      eqm_reset_val => 15, lucky_val => 150};
get_reset({5, 9, 120, 0}) ->
    #{loss_coin => 0, loss_item => [{22041, 1}, {20328, 1}],
      eqm_reset_val => 15, lucky_val => 150};
get_reset({5, 10, 120, 0}) ->
    #{loss_coin => 0, loss_item => [{22041, 1}, {20328, 1}],
      eqm_reset_val => 15, lucky_val => 150};
get_reset({5, 11, 120, 0}) ->
    #{loss_coin => 0, loss_item => [{22041, 1}, {20318, 1}],
      eqm_reset_val => 15, lucky_val => 150};
get_reset({5, 12, 120, 0}) ->
    #{loss_coin => 0, loss_item => [{22041, 1}, {20318, 1}],
      eqm_reset_val => 15, lucky_val => 150};
get_reset({5, 14, 120, 0}) ->
    #{loss_coin => 0, loss_item => [{22041, 1}, {20318, 1}],
      eqm_reset_val => 15, lucky_val => 150};
get_reset(_) -> false.

get_enchant({_, 0}) ->
    #{need_lev => 40, base_ratio => 1000, need_break => 0,
      loss_enchant => 0, break_loss_enchant => 0,
      max_lev_loss_enchant => [],
      allow_luck => [20021, 20022], allow_protect => [],
      need_coin => 2000, need_item => [{20020, 1}],
      need_role_lev => 45};
get_enchant({_, 1}) ->
    #{need_lev => 40, base_ratio => 1000, need_break => 0,
      loss_enchant => 1, break_loss_enchant => 1,
      max_lev_loss_enchant => [],
      allow_luck => [20021, 20022], allow_protect => [],
      need_coin => 3000, need_item => [{20020, 1}],
      need_role_lev => 45};
get_enchant({_, 2}) ->
    #{need_lev => 40, base_ratio => 1000, need_break => 0,
      loss_enchant => 2, break_loss_enchant => 2,
      max_lev_loss_enchant => [],
      allow_luck => [20021, 20022], allow_protect => [],
      need_coin => 5000, need_item => [{20020, 1}],
      need_role_lev => 45};
get_enchant({_, 3}) ->
    #{need_lev => 40, base_ratio => 700, need_break => 0,
      loss_enchant => 2, break_loss_enchant => 3,
      max_lev_loss_enchant => [],
      allow_luck => [20021, 20022], allow_protect => [],
      need_coin => 8000, need_item => [{20020, 1}],
      need_role_lev => 45};
get_enchant({_, 4}) ->
    #{need_lev => 40, base_ratio => 580, need_break => 0,
      loss_enchant => 3, break_loss_enchant => 4,
      max_lev_loss_enchant => [],
      allow_luck => [20021, 20022], allow_protect => [],
      need_coin => 10000, need_item => [{20020, 4}],
      need_role_lev => 50};
get_enchant({_, 5}) ->
    #{need_lev => 50, base_ratio => 500, need_break => 0,
      loss_enchant => 4, break_loss_enchant => 5,
      max_lev_loss_enchant => [],
      allow_luck => [20021, 20022], allow_protect => [],
      need_coin => 20000, need_item => [{20020, 4}],
      need_role_lev => 50};
get_enchant({_, 6}) ->
    #{need_lev => 50, base_ratio => 450, need_break => 0,
      loss_enchant => 5, break_loss_enchant => 6,
      max_lev_loss_enchant => [],
      allow_luck => [20021, 20022], allow_protect => [20008],
      need_coin => 30000, need_item => [{20020, 4}],
      need_role_lev => 50};
get_enchant({_, 7}) ->
    #{need_lev => 50, base_ratio => 350, need_break => 0,
      loss_enchant => 6, break_loss_enchant => 7,
      max_lev_loss_enchant => [],
      allow_luck => [20021, 20022, 20023],
      allow_protect => [20009], need_coin => 50000,
      need_item => [{20020, 4}], need_role_lev => 50};
get_enchant({_, 8}) ->
    #{need_lev => 60, base_ratio => 300, need_break => 0,
      loss_enchant => 7, break_loss_enchant => 8,
      max_lev_loss_enchant => [],
      allow_luck => [20021, 20022, 20016],
      allow_protect => [20010, 20024], need_coin => 80000,
      need_item => [{20020, 8}], need_role_lev => 50};
get_enchant({_, 9}) ->
    #{need_lev => 70, base_ratio => 150, need_break => 0,
      loss_enchant => 8, break_loss_enchant => 9,
      max_lev_loss_enchant => [],
      allow_luck => [20021, 20022],
      allow_protect => [20011, 20024], need_coin => 100000,
      need_item => [{20020, 8}], need_role_lev => 60};
get_enchant({_, 10}) ->
    #{need_lev => 70, base_ratio => 120, need_break => 0,
      loss_enchant => 9, break_loss_enchant => 10,
      max_lev_loss_enchant => [],
      allow_luck => [20021, 20022],
      allow_protect => [20012, 20024], need_coin => 100000,
      need_item => [{20020, 8}], need_role_lev => 80};
get_enchant({_, 11}) ->
    #{need_lev => 80, base_ratio => 80, need_break => 0,
      loss_enchant => 10, break_loss_enchant => 10,
      max_lev_loss_enchant => [{13, 11}, {14, 11}],
      allow_luck => [20021, 20022],
      allow_protect => [20015, 20024], need_coin => 120000,
      need_item => [{20020, 8}], need_role_lev => 85};
get_enchant({_, 12}) ->
    #{need_lev => 90, base_ratio => 80, need_break => 1,
      loss_enchant => 11, break_loss_enchant => 11,
      max_lev_loss_enchant => [],
      allow_luck => [20022, 20404],
      allow_protect => [20401, 20024], need_coin => 120000,
      need_item => [{20400, 8}], need_role_lev => 90};
get_enchant({_, 13}) ->
    #{need_lev => 100, base_ratio => 80, need_break => 1,
      loss_enchant => 12, break_loss_enchant => 12,
      max_lev_loss_enchant => [],
      allow_luck => [20022, 20404],
      allow_protect => [20402, 20024], need_coin => 120000,
      need_item => [{20400, 8}], need_role_lev => 100};
get_enchant({_, 14}) ->
    #{need_lev => 100, base_ratio => 80, need_break => 1,
      loss_enchant => 13, break_loss_enchant => 13,
      max_lev_loss_enchant => [],
      allow_luck => [20022, 20404],
      allow_protect => [20403, 20024], need_coin => 120000,
      need_item => [{20400, 12}], need_role_lev => 100};
get_enchant(_) -> false.

get_growth(4) -> 18;
get_growth(5) -> 36;
get_growth(6) -> 72;
get_growth(7) -> 120;
get_growth(8) -> 180;
get_growth(9) -> 600;
get_growth(10) -> 1000;
get_growth(11) -> 2000;
get_growth(12) -> 4000;
get_growth(13) -> 4000;
get_growth(14) -> 4000;
get_growth(15) -> 4000;
get_growth(_) -> false.

growth_add({3, 4, 0}) -> 4;
growth_add({3, 5, 0}) -> 4;
growth_add({4, 5, 0}) -> 8;
growth_add({3, 6, 0}) -> 4;
growth_add({4, 6, 0}) -> 8;
growth_add({5, 6, 0}) -> 15;
growth_add({3, 7, 0}) -> 4;
growth_add({4, 7, 0}) -> 8;
growth_add({5, 7, 0}) -> 15;
growth_add({6, 7, 0}) -> 25;
growth_add({3, 8, 0}) -> 4;
growth_add({4, 8, 0}) -> 8;
growth_add({5, 8, 0}) -> 15;
growth_add({6, 8, 0}) -> 25;
growth_add({7, 8, 0}) -> 38;
growth_add({3, 9, 0}) -> 4;
growth_add({4, 9, 0}) -> 8;
growth_add({5, 9, 0}) -> 15;
growth_add({6, 9, 0}) -> 25;
growth_add({7, 9, 0}) -> 38;
growth_add({8, 9, 0}) -> 130;
growth_add({3, 10, 0}) -> 4;
growth_add({4, 10, 0}) -> 8;
growth_add({5, 10, 0}) -> 15;
growth_add({6, 10, 0}) -> 25;
growth_add({7, 10, 0}) -> 38;
growth_add({8, 10, 0}) -> 130;
growth_add({9, 10, 0}) -> 220;
growth_add({3, 11, 0}) -> 4;
growth_add({4, 11, 0}) -> 8;
growth_add({5, 11, 0}) -> 15;
growth_add({6, 11, 0}) -> 25;
growth_add({7, 11, 0}) -> 38;
growth_add({8, 11, 0}) -> 130;
growth_add({9, 11, 0}) -> 220;
growth_add({10, 11, 0}) -> 500;
growth_add({3, 12, 0}) -> 4;
growth_add({4, 12, 0}) -> 8;
growth_add({5, 12, 0}) -> 15;
growth_add({6, 12, 0}) -> 25;
growth_add({7, 12, 0}) -> 38;
growth_add({8, 12, 0}) -> 130;
growth_add({9, 12, 0}) -> 220;
growth_add({10, 12, 0}) -> 500;
growth_add({11, 12, 0}) -> 1000;
growth_add({3, 11, 1}) -> 0;
growth_add({4, 11, 1}) -> 0;
growth_add({5, 11, 1}) -> 0;
growth_add({6, 11, 1}) -> 0;
growth_add({7, 11, 1}) -> 0;
growth_add({8, 11, 1}) -> 0;
growth_add({9, 11, 1}) -> 0;
growth_add({10, 11, 1}) -> 100;
growth_add({3, 12, 1}) -> 0;
growth_add({4, 12, 1}) -> 0;
growth_add({5, 12, 1}) -> 0;
growth_add({6, 12, 1}) -> 0;
growth_add({7, 12, 1}) -> 0;
growth_add({8, 12, 1}) -> 0;
growth_add({9, 12, 1}) -> 0;
growth_add({10, 12, 1}) -> 100;
growth_add({11, 12, 1}) -> 400;
growth_add({3, 13, 1}) -> 0;
growth_add({4, 13, 1}) -> 0;
growth_add({5, 13, 1}) -> 0;
growth_add({6, 13, 1}) -> 0;
growth_add({7, 13, 1}) -> 0;
growth_add({8, 13, 1}) -> 0;
growth_add({9, 13, 1}) -> 0;
growth_add({10, 13, 1}) -> 90;
growth_add({11, 13, 1}) -> 400;
growth_add({12, 13, 1}) -> 700;
growth_add({3, 14, 1}) -> 0;
growth_add({4, 14, 1}) -> 0;
growth_add({5, 14, 1}) -> 0;
growth_add({6, 14, 1}) -> 0;
growth_add({7, 14, 1}) -> 0;
growth_add({8, 14, 1}) -> 0;
growth_add({9, 14, 1}) -> 0;
growth_add({10, 14, 1}) -> 0;
growth_add({11, 14, 1}) -> 90;
growth_add({12, 14, 1}) -> 225;
growth_add({13, 14, 1}) -> 450;
growth_add({3, 15, 1}) -> 0;
growth_add({4, 15, 1}) -> 0;
growth_add({5, 15, 1}) -> 0;
growth_add({6, 15, 1}) -> 0;
growth_add({7, 15, 1}) -> 0;
growth_add({8, 15, 1}) -> 0;
growth_add({9, 15, 1}) -> 0;
growth_add({10, 15, 1}) -> 0;
growth_add({11, 15, 1}) -> 90;
growth_add({12, 15, 1}) -> 200;
growth_add({13, 15, 1}) -> 350;
growth_add({14, 15, 1}) -> 500;
growth_add(_) -> 0.

item_to_luck(20021) -> 60;
item_to_luck(20022) -> 120;
item_to_luck(20404) -> 150;
item_to_luck(20023) -> 1000;
item_to_luck(20016) -> 1000;
item_to_luck(_) -> 0.

get_halo_id({15, 1}) -> 101510;
get_halo_id({15, 2}) -> 101510;
get_halo_id({15, 3}) -> 101510;
get_halo_id({15, 4}) -> 101510;
get_halo_id({15, 5}) -> 101510;
get_halo_id({15, 6}) -> 101510;
get_halo_id({15, 7}) -> 101510;
get_halo_id(_) -> false.

get_stone(20800) ->
    #{type => 1, lev => 1, need_eqm_lev => 30,
      next_id => 20820, attr => [{1, 160}], max_exp => 2};
get_stone(20801) ->
    #{type => 4, lev => 1, need_eqm_lev => 30,
      next_id => 20821, attr => [{4, 20}], max_exp => 2};
get_stone(20802) ->
    #{type => 5, lev => 1, need_eqm_lev => 30,
      next_id => 20822, attr => [{5, 16}], max_exp => 2};
get_stone(20803) ->
    #{type => 6, lev => 1, need_eqm_lev => 30,
      next_id => 20823, attr => [{6, 30}], max_exp => 2};
get_stone(20804) ->
    #{type => 7, lev => 1, need_eqm_lev => 30,
      next_id => 20824, attr => [{7, 24}], max_exp => 2};
get_stone(20805) ->
    #{type => 3, lev => 1, need_eqm_lev => 30,
      next_id => 20825, attr => [{3, 6}], max_exp => 2};
get_stone(20806) ->
    #{type => 2, lev => 1, need_eqm_lev => 30,
      next_id => 20826, attr => [{2, 50}], max_exp => 2};
get_stone(20807) ->
    #{type => 43, lev => 1, need_eqm_lev => 30,
      next_id => 20827, attr => [{43, 20}], max_exp => 2};
get_stone(20820) ->
    #{type => 1, lev => 2, need_eqm_lev => 30,
      next_id => 20840, attr => [{1, 320}], max_exp => 4};
get_stone(20821) ->
    #{type => 4, lev => 2, need_eqm_lev => 30,
      next_id => 20841, attr => [{4, 40}], max_exp => 4};
get_stone(20822) ->
    #{type => 5, lev => 2, need_eqm_lev => 30,
      next_id => 20842, attr => [{5, 32}], max_exp => 4};
get_stone(20823) ->
    #{type => 6, lev => 2, need_eqm_lev => 30,
      next_id => 20843, attr => [{6, 60}], max_exp => 4};
get_stone(20824) ->
    #{type => 7, lev => 2, need_eqm_lev => 30,
      next_id => 20844, attr => [{7, 48}], max_exp => 4};
get_stone(20825) ->
    #{type => 3, lev => 2, need_eqm_lev => 30,
      next_id => 20845, attr => [{3, 12}], max_exp => 4};
get_stone(20826) ->
    #{type => 2, lev => 2, need_eqm_lev => 30,
      next_id => 20846, attr => [{2, 100}], max_exp => 4};
get_stone(20827) ->
    #{type => 43, lev => 2, need_eqm_lev => 30,
      next_id => 20847, attr => [{43, 40}], max_exp => 4};
get_stone(20840) ->
    #{type => 1, lev => 3, need_eqm_lev => 50,
      next_id => 20860, attr => [{1, 480}], max_exp => 8};
get_stone(20841) ->
    #{type => 4, lev => 3, need_eqm_lev => 50,
      next_id => 20861, attr => [{4, 60}], max_exp => 8};
get_stone(20842) ->
    #{type => 5, lev => 3, need_eqm_lev => 50,
      next_id => 20862, attr => [{5, 48}], max_exp => 8};
get_stone(20843) ->
    #{type => 6, lev => 3, need_eqm_lev => 50,
      next_id => 20863, attr => [{6, 90}], max_exp => 8};
get_stone(20844) ->
    #{type => 7, lev => 3, need_eqm_lev => 50,
      next_id => 20864, attr => [{7, 72}], max_exp => 8};
get_stone(20845) ->
    #{type => 3, lev => 3, need_eqm_lev => 50,
      next_id => 20865, attr => [{3, 18}], max_exp => 8};
get_stone(20846) ->
    #{type => 2, lev => 3, need_eqm_lev => 50,
      next_id => 20866, attr => [{2, 150}], max_exp => 8};
get_stone(20847) ->
    #{type => 43, lev => 3, need_eqm_lev => 50,
      next_id => 20867, attr => [{43, 60}], max_exp => 8};
get_stone(20860) ->
    #{type => 1, lev => 4, need_eqm_lev => 50,
      next_id => 20880, attr => [{1, 640}], max_exp => 16};
get_stone(20861) ->
    #{type => 4, lev => 4, need_eqm_lev => 50,
      next_id => 20881, attr => [{4, 80}], max_exp => 16};
get_stone(20862) ->
    #{type => 5, lev => 4, need_eqm_lev => 50,
      next_id => 20882, attr => [{5, 64}], max_exp => 16};
get_stone(20863) ->
    #{type => 6, lev => 4, need_eqm_lev => 50,
      next_id => 20883, attr => [{6, 120}], max_exp => 16};
get_stone(20864) ->
    #{type => 7, lev => 4, need_eqm_lev => 50,
      next_id => 20884, attr => [{7, 96}], max_exp => 16};
get_stone(20865) ->
    #{type => 3, lev => 4, need_eqm_lev => 50,
      next_id => 20885, attr => [{3, 24}], max_exp => 16};
get_stone(20866) ->
    #{type => 2, lev => 4, need_eqm_lev => 50,
      next_id => 20886, attr => [{2, 200}], max_exp => 16};
get_stone(20867) ->
    #{type => 43, lev => 4, need_eqm_lev => 50,
      next_id => 20887, attr => [{43, 80}], max_exp => 16};
get_stone(20880) ->
    #{type => 1, lev => 5, need_eqm_lev => 60,
      next_id => 20900, attr => [{1, 800}], max_exp => 32};
get_stone(20881) ->
    #{type => 4, lev => 5, need_eqm_lev => 60,
      next_id => 20901, attr => [{4, 100}], max_exp => 32};
get_stone(20882) ->
    #{type => 5, lev => 5, need_eqm_lev => 60,
      next_id => 20902, attr => [{5, 80}], max_exp => 32};
get_stone(20883) ->
    #{type => 6, lev => 5, need_eqm_lev => 60,
      next_id => 20903, attr => [{6, 150}], max_exp => 32};
get_stone(20884) ->
    #{type => 7, lev => 5, need_eqm_lev => 60,
      next_id => 20904, attr => [{7, 120}], max_exp => 32};
get_stone(20885) ->
    #{type => 3, lev => 5, need_eqm_lev => 60,
      next_id => 20905, attr => [{3, 30}], max_exp => 32};
get_stone(20886) ->
    #{type => 2, lev => 5, need_eqm_lev => 60,
      next_id => 20906, attr => [{2, 250}], max_exp => 32};
get_stone(20887) ->
    #{type => 43, lev => 5, need_eqm_lev => 60,
      next_id => 20907, attr => [{43, 100}], max_exp => 32};
get_stone(20900) ->
    #{type => 1, lev => 6, need_eqm_lev => 60,
      next_id => 20920, attr => [{1, 960}], max_exp => 64};
get_stone(20901) ->
    #{type => 4, lev => 6, need_eqm_lev => 60,
      next_id => 20921, attr => [{4, 120}], max_exp => 64};
get_stone(20902) ->
    #{type => 5, lev => 6, need_eqm_lev => 60,
      next_id => 20922, attr => [{5, 96}], max_exp => 64};
get_stone(20903) ->
    #{type => 6, lev => 6, need_eqm_lev => 60,
      next_id => 20923, attr => [{6, 180}], max_exp => 64};
get_stone(20904) ->
    #{type => 7, lev => 6, need_eqm_lev => 60,
      next_id => 20924, attr => [{7, 144}], max_exp => 64};
get_stone(20905) ->
    #{type => 3, lev => 6, need_eqm_lev => 60,
      next_id => 20925, attr => [{3, 36}], max_exp => 64};
get_stone(20906) ->
    #{type => 2, lev => 6, need_eqm_lev => 60,
      next_id => 20926, attr => [{2, 300}], max_exp => 64};
get_stone(20907) ->
    #{type => 43, lev => 6, need_eqm_lev => 60,
      next_id => 20927, attr => [{43, 120}], max_exp => 64};
get_stone(20920) ->
    #{type => 1, lev => 7, need_eqm_lev => 70,
      next_id => 20940, attr => [{1, 1120}], max_exp => 128};
get_stone(20921) ->
    #{type => 4, lev => 7, need_eqm_lev => 70,
      next_id => 20941, attr => [{4, 140}], max_exp => 128};
get_stone(20922) ->
    #{type => 5, lev => 7, need_eqm_lev => 70,
      next_id => 20942, attr => [{5, 112}], max_exp => 128};
get_stone(20923) ->
    #{type => 6, lev => 7, need_eqm_lev => 70,
      next_id => 20943, attr => [{6, 210}], max_exp => 128};
get_stone(20924) ->
    #{type => 7, lev => 7, need_eqm_lev => 70,
      next_id => 20944, attr => [{7, 168}], max_exp => 128};
get_stone(20925) ->
    #{type => 3, lev => 7, need_eqm_lev => 70,
      next_id => 20945, attr => [{3, 42}], max_exp => 128};
get_stone(20926) ->
    #{type => 2, lev => 7, need_eqm_lev => 70,
      next_id => 20946, attr => [{2, 350}], max_exp => 128};
get_stone(20927) ->
    #{type => 43, lev => 7, need_eqm_lev => 70,
      next_id => 20947, attr => [{43, 140}], max_exp => 128};
get_stone(20940) ->
    #{type => 1, lev => 8, need_eqm_lev => 80,
      next_id => 20960, attr => [{1, 1280}], max_exp => 256};
get_stone(20941) ->
    #{type => 4, lev => 8, need_eqm_lev => 80,
      next_id => 20961, attr => [{4, 160}], max_exp => 256};
get_stone(20942) ->
    #{type => 5, lev => 8, need_eqm_lev => 80,
      next_id => 20962, attr => [{5, 128}], max_exp => 256};
get_stone(20943) ->
    #{type => 6, lev => 8, need_eqm_lev => 80,
      next_id => 20963, attr => [{6, 240}], max_exp => 256};
get_stone(20944) ->
    #{type => 7, lev => 8, need_eqm_lev => 80,
      next_id => 20964, attr => [{7, 192}], max_exp => 256};
get_stone(20945) ->
    #{type => 3, lev => 8, need_eqm_lev => 80,
      next_id => 20965, attr => [{3, 48}], max_exp => 256};
get_stone(20946) ->
    #{type => 2, lev => 8, need_eqm_lev => 80,
      next_id => 20966, attr => [{2, 400}], max_exp => 256};
get_stone(20947) ->
    #{type => 43, lev => 8, need_eqm_lev => 80,
      next_id => 20967, attr => [{43, 160}], max_exp => 256};
get_stone(20960) ->
    #{type => 1, lev => 9, need_eqm_lev => 80,
      next_id => 20980, attr => [{1, 1440}], max_exp => 512};
get_stone(20961) ->
    #{type => 4, lev => 9, need_eqm_lev => 80,
      next_id => 20981, attr => [{4, 180}], max_exp => 512};
get_stone(20962) ->
    #{type => 5, lev => 9, need_eqm_lev => 80,
      next_id => 20982, attr => [{5, 144}], max_exp => 512};
get_stone(20963) ->
    #{type => 6, lev => 9, need_eqm_lev => 80,
      next_id => 20983, attr => [{6, 270}], max_exp => 512};
get_stone(20964) ->
    #{type => 7, lev => 9, need_eqm_lev => 80,
      next_id => 20984, attr => [{7, 216}], max_exp => 512};
get_stone(20965) ->
    #{type => 3, lev => 9, need_eqm_lev => 80,
      next_id => 20985, attr => [{3, 54}], max_exp => 512};
get_stone(20966) ->
    #{type => 2, lev => 9, need_eqm_lev => 80,
      next_id => 20986, attr => [{2, 450}], max_exp => 512};
get_stone(20967) ->
    #{type => 43, lev => 9, need_eqm_lev => 80,
      next_id => 20987, attr => [{43, 180}], max_exp => 512};
get_stone(20980) ->
    #{type => 1, lev => 10, need_eqm_lev => 100,
      attr => [{1, 1600}], max_exp => 9999};
get_stone(20981) ->
    #{type => 4, lev => 10, need_eqm_lev => 100,
      attr => [{4, 200}], max_exp => 9999};
get_stone(20982) ->
    #{type => 5, lev => 10, need_eqm_lev => 100,
      attr => [{5, 160}], max_exp => 9999};
get_stone(20983) ->
    #{type => 6, lev => 10, need_eqm_lev => 100,
      attr => [{6, 300}], max_exp => 9999};
get_stone(20984) ->
    #{type => 7, lev => 10, need_eqm_lev => 100,
      attr => [{7, 240}], max_exp => 9999};
get_stone(20985) ->
    #{type => 3, lev => 10, need_eqm_lev => 100,
      attr => [{3, 60}], max_exp => 9999};
get_stone(20986) ->
    #{type => 2, lev => 10, need_eqm_lev => 100,
      attr => [{2, 500}], max_exp => 9999};
get_stone(20987) ->
    #{type => 43, lev => 10, need_eqm_lev => 100,
      attr => [{43, 200}], max_exp => 9999};
get_stone(20808) ->
    #{type => 1, lev => 1, need_eqm_lev => 70,
      next_id => 20828, attr => [{1, 160}], max_exp => 25};
get_stone(20809) ->
    #{type => 4, lev => 1, need_eqm_lev => 70,
      next_id => 20829, attr => [{4, 20}], max_exp => 25};
get_stone(20810) ->
    #{type => 5, lev => 1, need_eqm_lev => 70,
      next_id => 20830, attr => [{5, 16}], max_exp => 25};
get_stone(20811) ->
    #{type => 6, lev => 1, need_eqm_lev => 70,
      next_id => 20831, attr => [{6, 30}], max_exp => 25};
get_stone(20812) ->
    #{type => 7, lev => 1, need_eqm_lev => 70,
      next_id => 20832, attr => [{7, 24}], max_exp => 25};
get_stone(20813) ->
    #{type => 3, lev => 1, need_eqm_lev => 70,
      next_id => 20833, attr => [{3, 6}], max_exp => 25};
get_stone(20814) ->
    #{type => 8, lev => 1, need_eqm_lev => 70,
      next_id => 20834, attr => [{8, 3}], max_exp => 25};
get_stone(20815) ->
    #{type => 9, lev => 1, need_eqm_lev => 70,
      next_id => 20835, attr => [{9, 3}], max_exp => 25};
get_stone(20816) ->
    #{type => 10, lev => 1, need_eqm_lev => 70,
      next_id => 20836, attr => [{10, 3}], max_exp => 25};
get_stone(20817) ->
    #{type => 11, lev => 1, need_eqm_lev => 70,
      next_id => 20837, attr => [{11, 3}], max_exp => 25};
get_stone(20828) ->
    #{type => 1, lev => 2, need_eqm_lev => 70,
      next_id => 20848, attr => [{1, 320}], max_exp => 40};
get_stone(20829) ->
    #{type => 4, lev => 2, need_eqm_lev => 70,
      next_id => 20849, attr => [{4, 40}], max_exp => 40};
get_stone(20830) ->
    #{type => 5, lev => 2, need_eqm_lev => 70,
      next_id => 20850, attr => [{5, 32}], max_exp => 40};
get_stone(20831) ->
    #{type => 6, lev => 2, need_eqm_lev => 70,
      next_id => 20851, attr => [{6, 60}], max_exp => 40};
get_stone(20832) ->
    #{type => 7, lev => 2, need_eqm_lev => 70,
      next_id => 20852, attr => [{7, 48}], max_exp => 40};
get_stone(20833) ->
    #{type => 3, lev => 2, need_eqm_lev => 70,
      next_id => 20853, attr => [{3, 12}], max_exp => 40};
get_stone(20834) ->
    #{type => 8, lev => 2, need_eqm_lev => 70,
      next_id => 20854, attr => [{8, 6}], max_exp => 40};
get_stone(20835) ->
    #{type => 9, lev => 2, need_eqm_lev => 70,
      next_id => 20855, attr => [{9, 6}], max_exp => 40};
get_stone(20836) ->
    #{type => 10, lev => 2, need_eqm_lev => 70,
      next_id => 20856, attr => [{10, 6}], max_exp => 40};
get_stone(20837) ->
    #{type => 11, lev => 2, need_eqm_lev => 70,
      next_id => 20857, attr => [{11, 6}], max_exp => 40};
get_stone(20848) ->
    #{type => 1, lev => 3, need_eqm_lev => 70,
      next_id => 20868, attr => [{1, 480}], max_exp => 60};
get_stone(20849) ->
    #{type => 4, lev => 3, need_eqm_lev => 70,
      next_id => 20869, attr => [{4, 60}], max_exp => 60};
get_stone(20850) ->
    #{type => 5, lev => 3, need_eqm_lev => 70,
      next_id => 20870, attr => [{5, 48}], max_exp => 60};
get_stone(20851) ->
    #{type => 6, lev => 3, need_eqm_lev => 70,
      next_id => 20871, attr => [{6, 90}], max_exp => 60};
get_stone(20852) ->
    #{type => 7, lev => 3, need_eqm_lev => 70,
      next_id => 20872, attr => [{7, 72}], max_exp => 60};
get_stone(20853) ->
    #{type => 3, lev => 3, need_eqm_lev => 70,
      next_id => 20873, attr => [{3, 18}], max_exp => 60};
get_stone(20854) ->
    #{type => 8, lev => 3, need_eqm_lev => 70,
      next_id => 20874, attr => [{8, 9}], max_exp => 60};
get_stone(20855) ->
    #{type => 9, lev => 3, need_eqm_lev => 70,
      next_id => 20875, attr => [{9, 9}], max_exp => 60};
get_stone(20856) ->
    #{type => 10, lev => 3, need_eqm_lev => 70,
      next_id => 20876, attr => [{10, 9}], max_exp => 60};
get_stone(20857) ->
    #{type => 11, lev => 3, need_eqm_lev => 70,
      next_id => 20877, attr => [{11, 9}], max_exp => 60};
get_stone(20868) ->
    #{type => 1, lev => 4, need_eqm_lev => 70,
      next_id => 20888, attr => [{1, 640}], max_exp => 90};
get_stone(20869) ->
    #{type => 4, lev => 4, need_eqm_lev => 70,
      next_id => 20889, attr => [{4, 80}], max_exp => 90};
get_stone(20870) ->
    #{type => 5, lev => 4, need_eqm_lev => 70,
      next_id => 20890, attr => [{5, 64}], max_exp => 90};
get_stone(20871) ->
    #{type => 6, lev => 4, need_eqm_lev => 70,
      next_id => 20891, attr => [{6, 120}], max_exp => 90};
get_stone(20872) ->
    #{type => 7, lev => 4, need_eqm_lev => 70,
      next_id => 20892, attr => [{7, 96}], max_exp => 90};
get_stone(20873) ->
    #{type => 3, lev => 4, need_eqm_lev => 70,
      next_id => 20893, attr => [{3, 24}], max_exp => 90};
get_stone(20874) ->
    #{type => 8, lev => 4, need_eqm_lev => 70,
      next_id => 20894, attr => [{8, 12}], max_exp => 90};
get_stone(20875) ->
    #{type => 9, lev => 4, need_eqm_lev => 70,
      next_id => 20895, attr => [{9, 12}], max_exp => 90};
get_stone(20876) ->
    #{type => 10, lev => 4, need_eqm_lev => 70,
      next_id => 20896, attr => [{10, 12}], max_exp => 90};
get_stone(20877) ->
    #{type => 11, lev => 4, need_eqm_lev => 70,
      next_id => 20897, attr => [{11, 12}], max_exp => 90};
get_stone(20888) ->
    #{type => 1, lev => 5, need_eqm_lev => 70,
      next_id => 20908, attr => [{1, 800}], max_exp => 125};
get_stone(20889) ->
    #{type => 4, lev => 5, need_eqm_lev => 70,
      next_id => 20909, attr => [{4, 100}], max_exp => 125};
get_stone(20890) ->
    #{type => 5, lev => 5, need_eqm_lev => 70,
      next_id => 20910, attr => [{5, 80}], max_exp => 125};
get_stone(20891) ->
    #{type => 6, lev => 5, need_eqm_lev => 70,
      next_id => 20911, attr => [{6, 150}], max_exp => 125};
get_stone(20892) ->
    #{type => 7, lev => 5, need_eqm_lev => 70,
      next_id => 20912, attr => [{7, 120}], max_exp => 125};
get_stone(20893) ->
    #{type => 3, lev => 5, need_eqm_lev => 70,
      next_id => 20913, attr => [{3, 30}], max_exp => 125};
get_stone(20894) ->
    #{type => 8, lev => 5, need_eqm_lev => 70,
      next_id => 20914, attr => [{8, 15}], max_exp => 125};
get_stone(20895) ->
    #{type => 9, lev => 5, need_eqm_lev => 70,
      next_id => 20915, attr => [{9, 15}], max_exp => 125};
get_stone(20896) ->
    #{type => 10, lev => 5, need_eqm_lev => 70,
      next_id => 20916, attr => [{10, 15}], max_exp => 125};
get_stone(20897) ->
    #{type => 11, lev => 5, need_eqm_lev => 70,
      next_id => 20917, attr => [{11, 15}], max_exp => 125};
get_stone(20908) ->
    #{type => 1, lev => 6, need_eqm_lev => 80,
      next_id => 20928, attr => [{1, 960}], max_exp => 200};
get_stone(20909) ->
    #{type => 4, lev => 6, need_eqm_lev => 80,
      next_id => 20929, attr => [{4, 120}], max_exp => 200};
get_stone(20910) ->
    #{type => 5, lev => 6, need_eqm_lev => 80,
      next_id => 20930, attr => [{5, 96}], max_exp => 200};
get_stone(20911) ->
    #{type => 6, lev => 6, need_eqm_lev => 80,
      next_id => 20931, attr => [{6, 180}], max_exp => 200};
get_stone(20912) ->
    #{type => 7, lev => 6, need_eqm_lev => 80,
      next_id => 20932, attr => [{7, 144}], max_exp => 200};
get_stone(20913) ->
    #{type => 3, lev => 6, need_eqm_lev => 80,
      next_id => 20933, attr => [{3, 36}], max_exp => 200};
get_stone(20914) ->
    #{type => 8, lev => 6, need_eqm_lev => 80,
      next_id => 20934, attr => [{8, 18}], max_exp => 200};
get_stone(20915) ->
    #{type => 9, lev => 6, need_eqm_lev => 80,
      next_id => 20935, attr => [{9, 18}], max_exp => 200};
get_stone(20916) ->
    #{type => 10, lev => 6, need_eqm_lev => 80,
      next_id => 20936, attr => [{10, 18}], max_exp => 200};
get_stone(20917) ->
    #{type => 11, lev => 6, need_eqm_lev => 80,
      next_id => 20937, attr => [{11, 18}], max_exp => 200};
get_stone(20928) ->
    #{type => 1, lev => 7, need_eqm_lev => 80,
      next_id => 20948, attr => [{1, 1120}], max_exp => 300};
get_stone(20929) ->
    #{type => 4, lev => 7, need_eqm_lev => 80,
      next_id => 20949, attr => [{4, 140}], max_exp => 300};
get_stone(20930) ->
    #{type => 5, lev => 7, need_eqm_lev => 80,
      next_id => 20950, attr => [{5, 112}], max_exp => 300};
get_stone(20931) ->
    #{type => 6, lev => 7, need_eqm_lev => 80,
      next_id => 20951, attr => [{6, 210}], max_exp => 300};
get_stone(20932) ->
    #{type => 7, lev => 7, need_eqm_lev => 80,
      next_id => 20952, attr => [{7, 168}], max_exp => 300};
get_stone(20933) ->
    #{type => 3, lev => 7, need_eqm_lev => 80,
      next_id => 20953, attr => [{3, 42}], max_exp => 300};
get_stone(20934) ->
    #{type => 8, lev => 7, need_eqm_lev => 80,
      next_id => 20954, attr => [{8, 21}], max_exp => 300};
get_stone(20935) ->
    #{type => 9, lev => 7, need_eqm_lev => 80,
      next_id => 20955, attr => [{9, 21}], max_exp => 300};
get_stone(20936) ->
    #{type => 10, lev => 7, need_eqm_lev => 80,
      next_id => 20956, attr => [{10, 21}], max_exp => 300};
get_stone(20937) ->
    #{type => 11, lev => 7, need_eqm_lev => 80,
      next_id => 20957, attr => [{11, 21}], max_exp => 300};
get_stone(20948) ->
    #{type => 1, lev => 8, need_eqm_lev => 80,
      next_id => 20968, attr => [{1, 1280}], max_exp => 450};
get_stone(20949) ->
    #{type => 4, lev => 8, need_eqm_lev => 80,
      next_id => 20969, attr => [{4, 160}], max_exp => 450};
get_stone(20950) ->
    #{type => 5, lev => 8, need_eqm_lev => 80,
      next_id => 20970, attr => [{5, 128}], max_exp => 450};
get_stone(20951) ->
    #{type => 6, lev => 8, need_eqm_lev => 80,
      next_id => 20971, attr => [{6, 240}], max_exp => 450};
get_stone(20952) ->
    #{type => 7, lev => 8, need_eqm_lev => 80,
      next_id => 20972, attr => [{7, 192}], max_exp => 450};
get_stone(20953) ->
    #{type => 3, lev => 8, need_eqm_lev => 80,
      next_id => 20973, attr => [{3, 48}], max_exp => 450};
get_stone(20954) ->
    #{type => 8, lev => 8, need_eqm_lev => 80,
      next_id => 20974, attr => [{8, 24}], max_exp => 450};
get_stone(20955) ->
    #{type => 9, lev => 8, need_eqm_lev => 80,
      next_id => 20975, attr => [{9, 24}], max_exp => 450};
get_stone(20956) ->
    #{type => 10, lev => 8, need_eqm_lev => 80,
      next_id => 20976, attr => [{10, 24}], max_exp => 450};
get_stone(20957) ->
    #{type => 11, lev => 8, need_eqm_lev => 80,
      next_id => 20977, attr => [{11, 24}], max_exp => 450};
get_stone(20968) ->
    #{type => 1, lev => 9, need_eqm_lev => 90,
      next_id => 20988, attr => [{1, 1440}], max_exp => 675};
get_stone(20969) ->
    #{type => 4, lev => 9, need_eqm_lev => 90,
      next_id => 20989, attr => [{4, 180}], max_exp => 675};
get_stone(20970) ->
    #{type => 5, lev => 9, need_eqm_lev => 90,
      next_id => 20990, attr => [{5, 144}], max_exp => 675};
get_stone(20971) ->
    #{type => 6, lev => 9, need_eqm_lev => 90,
      next_id => 20991, attr => [{6, 270}], max_exp => 675};
get_stone(20972) ->
    #{type => 7, lev => 9, need_eqm_lev => 90,
      next_id => 20992, attr => [{7, 216}], max_exp => 675};
get_stone(20973) ->
    #{type => 3, lev => 9, need_eqm_lev => 90,
      next_id => 20993, attr => [{3, 54}], max_exp => 675};
get_stone(20974) ->
    #{type => 8, lev => 9, need_eqm_lev => 90,
      next_id => 20994, attr => [{8, 27}], max_exp => 675};
get_stone(20975) ->
    #{type => 9, lev => 9, need_eqm_lev => 90,
      next_id => 20995, attr => [{9, 27}], max_exp => 675};
get_stone(20976) ->
    #{type => 10, lev => 9, need_eqm_lev => 90,
      next_id => 20996, attr => [{10, 27}], max_exp => 675};
get_stone(20977) ->
    #{type => 11, lev => 9, need_eqm_lev => 90,
      next_id => 20997, attr => [{11, 27}], max_exp => 675};
get_stone(20988) ->
    #{type => 1, lev => 10, need_eqm_lev => 90,
      next_id => 21008, attr => [{1, 1600}], max_exp => 1000};
get_stone(20989) ->
    #{type => 4, lev => 10, need_eqm_lev => 90,
      next_id => 21009, attr => [{4, 200}], max_exp => 1000};
get_stone(20990) ->
    #{type => 5, lev => 10, need_eqm_lev => 90,
      next_id => 21010, attr => [{5, 160}], max_exp => 1000};
get_stone(20991) ->
    #{type => 6, lev => 10, need_eqm_lev => 90,
      next_id => 21011, attr => [{6, 300}], max_exp => 1000};
get_stone(20992) ->
    #{type => 7, lev => 10, need_eqm_lev => 90,
      next_id => 21012, attr => [{7, 240}], max_exp => 1000};
get_stone(20993) ->
    #{type => 3, lev => 10, need_eqm_lev => 90,
      next_id => 21013, attr => [{3, 60}], max_exp => 1000};
get_stone(20994) ->
    #{type => 8, lev => 10, need_eqm_lev => 90,
      next_id => 21014, attr => [{8, 30}], max_exp => 1000};
get_stone(20995) ->
    #{type => 9, lev => 10, need_eqm_lev => 90,
      next_id => 21015, attr => [{9, 30}], max_exp => 1000};
get_stone(20996) ->
    #{type => 10, lev => 10, need_eqm_lev => 90,
      next_id => 21016, attr => [{10, 30}], max_exp => 1000};
get_stone(20997) ->
    #{type => 11, lev => 10, need_eqm_lev => 90,
      next_id => 21017, attr => [{11, 30}], max_exp => 1000};
get_stone(21008) ->
    #{type => 1, lev => 11, need_eqm_lev => 90,
      next_id => 21028, attr => [{1, 1760}], max_exp => 1500};
get_stone(21009) ->
    #{type => 4, lev => 11, need_eqm_lev => 90,
      next_id => 21029, attr => [{4, 220}], max_exp => 1500};
get_stone(21010) ->
    #{type => 5, lev => 11, need_eqm_lev => 90,
      next_id => 21030, attr => [{5, 176}], max_exp => 1500};
get_stone(21011) ->
    #{type => 6, lev => 11, need_eqm_lev => 90,
      next_id => 21031, attr => [{6, 330}], max_exp => 1500};
get_stone(21012) ->
    #{type => 7, lev => 11, need_eqm_lev => 90,
      next_id => 21032, attr => [{7, 264}], max_exp => 1500};
get_stone(21013) ->
    #{type => 3, lev => 11, need_eqm_lev => 90,
      next_id => 21033, attr => [{3, 66}], max_exp => 1500};
get_stone(21014) ->
    #{type => 8, lev => 11, need_eqm_lev => 90,
      next_id => 21034, attr => [{8, 33}], max_exp => 1500};
get_stone(21015) ->
    #{type => 9, lev => 11, need_eqm_lev => 90,
      next_id => 21035, attr => [{9, 33}], max_exp => 1500};
get_stone(21016) ->
    #{type => 10, lev => 11, need_eqm_lev => 90,
      next_id => 21036, attr => [{10, 33}], max_exp => 1500};
get_stone(21017) ->
    #{type => 11, lev => 11, need_eqm_lev => 90,
      next_id => 21037, attr => [{11, 33}], max_exp => 1500};
get_stone(21028) ->
    #{type => 1, lev => 12, need_eqm_lev => 90,
      attr => [{1, 1920}]};
get_stone(21029) ->
    #{type => 4, lev => 12, need_eqm_lev => 90,
      attr => [{4, 240}]};
get_stone(21030) ->
    #{type => 5, lev => 12, need_eqm_lev => 90,
      attr => [{5, 192}]};
get_stone(21031) ->
    #{type => 6, lev => 12, need_eqm_lev => 90,
      attr => [{6, 360}]};
get_stone(21032) ->
    #{type => 7, lev => 12, need_eqm_lev => 90,
      attr => [{7, 288}]};
get_stone(21033) ->
    #{type => 3, lev => 12, need_eqm_lev => 90,
      attr => [{3, 72}]};
get_stone(21034) ->
    #{type => 8, lev => 12, need_eqm_lev => 90,
      attr => [{8, 36}]};
get_stone(21035) ->
    #{type => 9, lev => 12, need_eqm_lev => 90,
      attr => [{9, 36}]};
get_stone(21036) ->
    #{type => 10, lev => 12, need_eqm_lev => 90,
      attr => [{10, 36}]};
get_stone(21037) ->
    #{type => 11, lev => 12, need_eqm_lev => 90,
      attr => [{11, 36}]};
get_stone(_) -> false.

get_embed(1) -> [{4, 2}, {5, 2}, {43, 2}];
get_embed(4) -> [{4, 2}, {5, 2}, {43, 2}];
get_embed(2) -> [{4, 2}, {5, 2}, {43, 2}];
get_embed(3) -> [{4, 2}, {5, 2}, {43, 2}];
get_embed(5) -> [{4, 2}, {5, 2}, {43, 2}];
get_embed(21) -> [{4, 2}, {5, 2}, {43, 2}];
get_embed(22) -> [{4, 2}, {5, 2}, {43, 2}];
get_embed(9) -> [{1, 2}, {4, 2}, {3, 2}];
get_embed(7) -> [{5, 2}, {7, 2}];
get_embed(6) -> [{4, 2}, {7, 2}];
get_embed(10) -> [{5, 2}, {6, 2}, {43, 2}];
get_embed(11) -> [{1, 2}, {2, 2}];
get_embed(12) -> [{7, 2}, {6, 2}];
get_embed(14) -> [{3, 2}, {2, 2}];
get_embed(_) -> false.

get_hero_embed(1) -> [{20814, 1}, {20815, 1}];
get_hero_embed(4) -> [{20814, 1}, {20815, 1}];
get_hero_embed(2) -> [{20814, 1}, {20815, 1}];
get_hero_embed(3) -> [{20814, 1}, {20815, 1}];
get_hero_embed(5) -> [{20814, 1}, {20815, 1}];
get_hero_embed(21) -> [{20814, 1}, {20815, 1}];
get_hero_embed(22) -> [{20814, 1}, {20815, 1}];
get_hero_embed(9) ->
    [{20808, 1}, {20813, 1}, {20816, 1}];
get_hero_embed(7) ->
    [{20810, 1}, {20812, 1}, {20817, 1}];
get_hero_embed(6) ->
    [{20809, 1}, {20811, 1}, {20814, 1}];
get_hero_embed(10) ->
    [{20811, 1}, {20812, 1}, {20815, 1}];
get_hero_embed(11) -> [{20808, 1}, {20816, 1}];
get_hero_embed(12) -> [{20811, 1}, {20812, 1}];
get_hero_embed(14) -> [{20813, 1}, {20817, 1}];
get_hero_embed(_) -> false.

stone_val(20800) -> {1, 1};
stone_val(20801) -> {4, 1};
stone_val(20802) -> {5, 1};
stone_val(20803) -> {6, 1};
stone_val(20804) -> {7, 1};
stone_val(20805) -> {3, 1};
stone_val(20806) -> {2, 1};
stone_val(20807) -> {43, 1};
stone_val(_) -> false.

hero_stone_val(20808) ->
    #{lev => 1, exp => 5, loss => [{21098, 1}]};
hero_stone_val(20828) ->
    #{lev => 2, exp => 5, loss => [{21098, 1}]};
hero_stone_val(20848) ->
    #{lev => 3, exp => 5, loss => [{21098, 1}]};
hero_stone_val(20868) ->
    #{lev => 4, exp => 5, loss => [{21098, 1}]};
hero_stone_val(20888) ->
    #{lev => 5, exp => 5, loss => [{21098, 1}]};
hero_stone_val(20908) ->
    #{lev => 6, exp => 5, loss => [{21098, 1}]};
hero_stone_val(20928) ->
    #{lev => 7, exp => 5, loss => [{21098, 1}]};
hero_stone_val(20948) ->
    #{lev => 8, exp => 5, loss => [{21098, 1}]};
hero_stone_val(20968) ->
    #{lev => 9, exp => 5, loss => [{21098, 1}]};
hero_stone_val(20988) ->
    #{lev => 10, exp => 5, loss => [{21098, 1}]};
hero_stone_val(21008) ->
    #{lev => 11, exp => 5, loss => [{21098, 1}]};
hero_stone_val(21028) ->
    #{lev => 12, exp => 5, loss => [{21098, 1}]};
hero_stone_val(20809) ->
    #{lev => 1, exp => 5, loss => [{21098, 1}]};
hero_stone_val(20829) ->
    #{lev => 2, exp => 5, loss => [{21098, 1}]};
hero_stone_val(20849) ->
    #{lev => 3, exp => 5, loss => [{21098, 1}]};
hero_stone_val(20869) ->
    #{lev => 4, exp => 5, loss => [{21098, 1}]};
hero_stone_val(20889) ->
    #{lev => 5, exp => 5, loss => [{21098, 1}]};
hero_stone_val(20909) ->
    #{lev => 6, exp => 5, loss => [{21098, 1}]};
hero_stone_val(20929) ->
    #{lev => 7, exp => 5, loss => [{21098, 1}]};
hero_stone_val(20949) ->
    #{lev => 8, exp => 5, loss => [{21098, 1}]};
hero_stone_val(20969) ->
    #{lev => 9, exp => 5, loss => [{21098, 1}]};
hero_stone_val(20989) ->
    #{lev => 10, exp => 5, loss => [{21098, 1}]};
hero_stone_val(21009) ->
    #{lev => 11, exp => 5, loss => [{21098, 1}]};
hero_stone_val(21029) ->
    #{lev => 12, exp => 5, loss => [{21098, 1}]};
hero_stone_val(20810) ->
    #{lev => 1, exp => 5, loss => [{21098, 1}]};
hero_stone_val(20830) ->
    #{lev => 2, exp => 5, loss => [{21098, 1}]};
hero_stone_val(20850) ->
    #{lev => 3, exp => 5, loss => [{21098, 1}]};
hero_stone_val(20870) ->
    #{lev => 4, exp => 5, loss => [{21098, 1}]};
hero_stone_val(20890) ->
    #{lev => 5, exp => 5, loss => [{21098, 1}]};
hero_stone_val(20910) ->
    #{lev => 6, exp => 5, loss => [{21098, 1}]};
hero_stone_val(20930) ->
    #{lev => 7, exp => 5, loss => [{21098, 1}]};
hero_stone_val(20950) ->
    #{lev => 8, exp => 5, loss => [{21098, 1}]};
hero_stone_val(20970) ->
    #{lev => 9, exp => 5, loss => [{21098, 1}]};
hero_stone_val(20990) ->
    #{lev => 10, exp => 5, loss => [{21098, 1}]};
hero_stone_val(21010) ->
    #{lev => 11, exp => 5, loss => [{21098, 1}]};
hero_stone_val(21030) ->
    #{lev => 12, exp => 5, loss => [{21098, 1}]};
hero_stone_val(20811) ->
    #{lev => 1, exp => 5, loss => [{21098, 1}]};
hero_stone_val(20831) ->
    #{lev => 2, exp => 5, loss => [{21098, 1}]};
hero_stone_val(20851) ->
    #{lev => 3, exp => 5, loss => [{21098, 1}]};
hero_stone_val(20871) ->
    #{lev => 4, exp => 5, loss => [{21098, 1}]};
hero_stone_val(20891) ->
    #{lev => 5, exp => 5, loss => [{21098, 1}]};
hero_stone_val(20911) ->
    #{lev => 6, exp => 5, loss => [{21098, 1}]};
hero_stone_val(20931) ->
    #{lev => 7, exp => 5, loss => [{21098, 1}]};
hero_stone_val(20951) ->
    #{lev => 8, exp => 5, loss => [{21098, 1}]};
hero_stone_val(20971) ->
    #{lev => 9, exp => 5, loss => [{21098, 1}]};
hero_stone_val(20991) ->
    #{lev => 10, exp => 5, loss => [{21098, 1}]};
hero_stone_val(21011) ->
    #{lev => 11, exp => 5, loss => [{21098, 1}]};
hero_stone_val(21031) ->
    #{lev => 12, exp => 5, loss => [{21098, 1}]};
hero_stone_val(20812) ->
    #{lev => 1, exp => 5, loss => [{21098, 1}]};
hero_stone_val(20832) ->
    #{lev => 2, exp => 5, loss => [{21098, 1}]};
hero_stone_val(20852) ->
    #{lev => 3, exp => 5, loss => [{21098, 1}]};
hero_stone_val(20872) ->
    #{lev => 4, exp => 5, loss => [{21098, 1}]};
hero_stone_val(20892) ->
    #{lev => 5, exp => 5, loss => [{21098, 1}]};
hero_stone_val(20912) ->
    #{lev => 6, exp => 5, loss => [{21098, 1}]};
hero_stone_val(20932) ->
    #{lev => 7, exp => 5, loss => [{21098, 1}]};
hero_stone_val(20952) ->
    #{lev => 8, exp => 5, loss => [{21098, 1}]};
hero_stone_val(20972) ->
    #{lev => 9, exp => 5, loss => [{21098, 1}]};
hero_stone_val(20992) ->
    #{lev => 10, exp => 5, loss => [{21098, 1}]};
hero_stone_val(21012) ->
    #{lev => 11, exp => 5, loss => [{21098, 1}]};
hero_stone_val(21032) ->
    #{lev => 12, exp => 5, loss => [{21098, 1}]};
hero_stone_val(20813) ->
    #{lev => 1, exp => 5, loss => [{21098, 1}]};
hero_stone_val(20833) ->
    #{lev => 2, exp => 5, loss => [{21098, 1}]};
hero_stone_val(20853) ->
    #{lev => 3, exp => 5, loss => [{21098, 1}]};
hero_stone_val(20873) ->
    #{lev => 4, exp => 5, loss => [{21098, 1}]};
hero_stone_val(20893) ->
    #{lev => 5, exp => 5, loss => [{21098, 1}]};
hero_stone_val(20913) ->
    #{lev => 6, exp => 5, loss => [{21098, 1}]};
hero_stone_val(20933) ->
    #{lev => 7, exp => 5, loss => [{21098, 1}]};
hero_stone_val(20953) ->
    #{lev => 8, exp => 5, loss => [{21098, 1}]};
hero_stone_val(20973) ->
    #{lev => 9, exp => 5, loss => [{21098, 1}]};
hero_stone_val(20993) ->
    #{lev => 10, exp => 5, loss => [{21098, 1}]};
hero_stone_val(21013) ->
    #{lev => 11, exp => 5, loss => [{21098, 1}]};
hero_stone_val(21033) ->
    #{lev => 12, exp => 5, loss => [{21098, 1}]};
hero_stone_val(20814) ->
    #{lev => 1, exp => 5, loss => [{21098, 1}]};
hero_stone_val(20834) ->
    #{lev => 2, exp => 5, loss => [{21098, 1}]};
hero_stone_val(20854) ->
    #{lev => 3, exp => 5, loss => [{21098, 1}]};
hero_stone_val(20874) ->
    #{lev => 4, exp => 5, loss => [{21098, 1}]};
hero_stone_val(20894) ->
    #{lev => 5, exp => 5, loss => [{21098, 1}]};
hero_stone_val(20914) ->
    #{lev => 6, exp => 5, loss => [{21098, 1}]};
hero_stone_val(20934) ->
    #{lev => 7, exp => 5, loss => [{21098, 1}]};
hero_stone_val(20954) ->
    #{lev => 8, exp => 5, loss => [{21098, 1}]};
hero_stone_val(20974) ->
    #{lev => 9, exp => 5, loss => [{21098, 1}]};
hero_stone_val(20994) ->
    #{lev => 10, exp => 5, loss => [{21098, 1}]};
hero_stone_val(21014) ->
    #{lev => 11, exp => 5, loss => [{21098, 1}]};
hero_stone_val(21034) ->
    #{lev => 12, exp => 5, loss => [{21098, 1}]};
hero_stone_val(20815) ->
    #{lev => 1, exp => 5, loss => [{21098, 1}]};
hero_stone_val(20835) ->
    #{lev => 2, exp => 5, loss => [{21098, 1}]};
hero_stone_val(20855) ->
    #{lev => 3, exp => 5, loss => [{21098, 1}]};
hero_stone_val(20875) ->
    #{lev => 4, exp => 5, loss => [{21098, 1}]};
hero_stone_val(20895) ->
    #{lev => 5, exp => 5, loss => [{21098, 1}]};
hero_stone_val(20915) ->
    #{lev => 6, exp => 5, loss => [{21098, 1}]};
hero_stone_val(20935) ->
    #{lev => 7, exp => 5, loss => [{21098, 1}]};
hero_stone_val(20955) ->
    #{lev => 8, exp => 5, loss => [{21098, 1}]};
hero_stone_val(20975) ->
    #{lev => 9, exp => 5, loss => [{21098, 1}]};
hero_stone_val(20995) ->
    #{lev => 10, exp => 5, loss => [{21098, 1}]};
hero_stone_val(21015) ->
    #{lev => 11, exp => 5, loss => [{21098, 1}]};
hero_stone_val(21035) ->
    #{lev => 12, exp => 5, loss => [{21098, 1}]};
hero_stone_val(20816) ->
    #{lev => 1, exp => 5, loss => [{21098, 1}]};
hero_stone_val(20836) ->
    #{lev => 2, exp => 5, loss => [{21098, 1}]};
hero_stone_val(20856) ->
    #{lev => 3, exp => 5, loss => [{21098, 1}]};
hero_stone_val(20876) ->
    #{lev => 4, exp => 5, loss => [{21098, 1}]};
hero_stone_val(20896) ->
    #{lev => 5, exp => 5, loss => [{21098, 1}]};
hero_stone_val(20916) ->
    #{lev => 6, exp => 5, loss => [{21098, 1}]};
hero_stone_val(20936) ->
    #{lev => 7, exp => 5, loss => [{21098, 1}]};
hero_stone_val(20956) ->
    #{lev => 8, exp => 5, loss => [{21098, 1}]};
hero_stone_val(20976) ->
    #{lev => 9, exp => 5, loss => [{21098, 1}]};
hero_stone_val(20996) ->
    #{lev => 10, exp => 5, loss => [{21098, 1}]};
hero_stone_val(21016) ->
    #{lev => 11, exp => 5, loss => [{21098, 1}]};
hero_stone_val(21036) ->
    #{lev => 12, exp => 5, loss => [{21098, 1}]};
hero_stone_val(20817) ->
    #{lev => 1, exp => 5, loss => [{21098, 1}]};
hero_stone_val(20837) ->
    #{lev => 2, exp => 5, loss => [{21098, 1}]};
hero_stone_val(20857) ->
    #{lev => 3, exp => 5, loss => [{21098, 1}]};
hero_stone_val(20877) ->
    #{lev => 4, exp => 5, loss => [{21098, 1}]};
hero_stone_val(20897) ->
    #{lev => 5, exp => 5, loss => [{21098, 1}]};
hero_stone_val(20917) ->
    #{lev => 6, exp => 5, loss => [{21098, 1}]};
hero_stone_val(20937) ->
    #{lev => 7, exp => 5, loss => [{21098, 1}]};
hero_stone_val(20957) ->
    #{lev => 8, exp => 5, loss => [{21098, 1}]};
hero_stone_val(20977) ->
    #{lev => 9, exp => 5, loss => [{21098, 1}]};
hero_stone_val(20997) ->
    #{lev => 10, exp => 5, loss => [{21098, 1}]};
hero_stone_val(21017) ->
    #{lev => 11, exp => 5, loss => [{21098, 1}]};
hero_stone_val(21037) ->
    #{lev => 12, exp => 5, loss => [{21098, 1}]};
hero_stone_val(_) -> false.

hero_stone_cost(20808) -> [{21098, 3}];
hero_stone_cost(20809) -> [{21098, 3}];
hero_stone_cost(20810) -> [{21098, 3}];
hero_stone_cost(20811) -> [{21098, 3}];
hero_stone_cost(20812) -> [{21098, 3}];
hero_stone_cost(20813) -> [{21098, 3}];
hero_stone_cost(20814) -> [{21098, 3}];
hero_stone_cost(20815) -> [{21098, 3}];
hero_stone_cost(20816) -> [{21098, 3}];
hero_stone_cost(20817) -> [{21098, 3}];
hero_stone_cost(_) -> false.

remove_stone(20800) ->
    #{base_id => 20800, val => 1, loss => []};
remove_stone(20801) ->
    #{base_id => 20801, val => 1, loss => []};
remove_stone(20802) ->
    #{base_id => 20802, val => 1, loss => []};
remove_stone(20803) ->
    #{base_id => 20803, val => 1, loss => []};
remove_stone(20804) ->
    #{base_id => 20804, val => 1, loss => []};
remove_stone(20805) ->
    #{base_id => 20805, val => 1, loss => []};
remove_stone(20806) ->
    #{base_id => 20806, val => 1, loss => []};
remove_stone(20807) ->
    #{base_id => 20807, val => 1, loss => []};
remove_stone(20820) ->
    #{base_id => 20800, val => 1, loss => []};
remove_stone(20821) ->
    #{base_id => 20801, val => 1, loss => []};
remove_stone(20822) ->
    #{base_id => 20802, val => 1, loss => []};
remove_stone(20823) ->
    #{base_id => 20803, val => 1, loss => []};
remove_stone(20824) ->
    #{base_id => 20804, val => 1, loss => []};
remove_stone(20825) ->
    #{base_id => 20805, val => 1, loss => []};
remove_stone(20826) ->
    #{base_id => 20806, val => 1, loss => []};
remove_stone(20827) ->
    #{base_id => 20807, val => 1, loss => []};
remove_stone(20840) ->
    #{base_id => 20800, val => 3, loss => []};
remove_stone(20841) ->
    #{base_id => 20801, val => 3, loss => []};
remove_stone(20842) ->
    #{base_id => 20802, val => 3, loss => []};
remove_stone(20843) ->
    #{base_id => 20803, val => 3, loss => []};
remove_stone(20844) ->
    #{base_id => 20804, val => 3, loss => []};
remove_stone(20845) ->
    #{base_id => 20805, val => 3, loss => []};
remove_stone(20846) ->
    #{base_id => 20806, val => 3, loss => []};
remove_stone(20847) ->
    #{base_id => 20807, val => 3, loss => []};
remove_stone(20860) ->
    #{base_id => 20800, val => 7, loss => []};
remove_stone(20861) ->
    #{base_id => 20801, val => 7, loss => []};
remove_stone(20862) ->
    #{base_id => 20802, val => 7, loss => []};
remove_stone(20863) ->
    #{base_id => 20803, val => 7, loss => []};
remove_stone(20864) ->
    #{base_id => 20804, val => 7, loss => []};
remove_stone(20865) ->
    #{base_id => 20805, val => 7, loss => []};
remove_stone(20866) ->
    #{base_id => 20806, val => 7, loss => []};
remove_stone(20867) ->
    #{base_id => 20807, val => 7, loss => []};
remove_stone(20880) ->
    #{base_id => 20800, val => 15, loss => []};
remove_stone(20881) ->
    #{base_id => 20801, val => 15, loss => []};
remove_stone(20882) ->
    #{base_id => 20802, val => 15, loss => []};
remove_stone(20883) ->
    #{base_id => 20803, val => 15, loss => []};
remove_stone(20884) ->
    #{base_id => 20804, val => 15, loss => []};
remove_stone(20885) ->
    #{base_id => 20805, val => 15, loss => []};
remove_stone(20886) ->
    #{base_id => 20806, val => 15, loss => []};
remove_stone(20887) ->
    #{base_id => 20807, val => 15, loss => []};
remove_stone(20900) ->
    #{base_id => 20800, val => 31, loss => []};
remove_stone(20901) ->
    #{base_id => 20801, val => 31, loss => []};
remove_stone(20902) ->
    #{base_id => 20802, val => 31, loss => []};
remove_stone(20903) ->
    #{base_id => 20803, val => 31, loss => []};
remove_stone(20904) ->
    #{base_id => 20804, val => 31, loss => []};
remove_stone(20905) ->
    #{base_id => 20805, val => 31, loss => []};
remove_stone(20906) ->
    #{base_id => 20806, val => 31, loss => []};
remove_stone(20907) ->
    #{base_id => 20807, val => 31, loss => []};
remove_stone(20920) ->
    #{base_id => 20800, val => 63, loss => []};
remove_stone(20921) ->
    #{base_id => 20801, val => 63, loss => []};
remove_stone(20922) ->
    #{base_id => 20802, val => 63, loss => []};
remove_stone(20923) ->
    #{base_id => 20803, val => 63, loss => []};
remove_stone(20924) ->
    #{base_id => 20804, val => 63, loss => []};
remove_stone(20925) ->
    #{base_id => 20805, val => 63, loss => []};
remove_stone(20926) ->
    #{base_id => 20806, val => 63, loss => []};
remove_stone(20927) ->
    #{base_id => 20807, val => 63, loss => []};
remove_stone(20940) ->
    #{base_id => 20800, val => 127, loss => []};
remove_stone(20941) ->
    #{base_id => 20801, val => 127, loss => []};
remove_stone(20942) ->
    #{base_id => 20802, val => 127, loss => []};
remove_stone(20943) ->
    #{base_id => 20803, val => 127, loss => []};
remove_stone(20944) ->
    #{base_id => 20804, val => 127, loss => []};
remove_stone(20945) ->
    #{base_id => 20805, val => 127, loss => []};
remove_stone(20946) ->
    #{base_id => 20806, val => 127, loss => []};
remove_stone(20947) ->
    #{base_id => 20807, val => 127, loss => []};
remove_stone(20960) ->
    #{base_id => 20800, val => 255, loss => []};
remove_stone(20961) ->
    #{base_id => 20801, val => 255, loss => []};
remove_stone(20962) ->
    #{base_id => 20802, val => 255, loss => []};
remove_stone(20963) ->
    #{base_id => 20803, val => 255, loss => []};
remove_stone(20964) ->
    #{base_id => 20804, val => 255, loss => []};
remove_stone(20965) ->
    #{base_id => 20805, val => 255, loss => []};
remove_stone(20966) ->
    #{base_id => 20806, val => 255, loss => []};
remove_stone(20967) ->
    #{base_id => 20807, val => 255, loss => []};
remove_stone(20980) ->
    #{base_id => 20800, val => 511, loss => []};
remove_stone(20981) ->
    #{base_id => 20801, val => 511, loss => []};
remove_stone(20982) ->
    #{base_id => 20802, val => 511, loss => []};
remove_stone(20983) ->
    #{base_id => 20803, val => 511, loss => []};
remove_stone(20984) ->
    #{base_id => 20804, val => 511, loss => []};
remove_stone(20985) ->
    #{base_id => 20805, val => 511, loss => []};
remove_stone(20986) ->
    #{base_id => 20806, val => 511, loss => []};
remove_stone(20987) ->
    #{base_id => 20807, val => 511, loss => []};
remove_stone(_) -> false.

remove_hero_stone(20808) ->
    #{gain => [{21098, 3}], loss => []};
remove_hero_stone(20809) ->
    #{gain => [{21098, 3}], loss => []};
remove_hero_stone(20810) ->
    #{gain => [{21098, 3}], loss => []};
remove_hero_stone(20811) ->
    #{gain => [{21098, 3}], loss => []};
remove_hero_stone(20812) ->
    #{gain => [{21098, 3}], loss => []};
remove_hero_stone(20813) ->
    #{gain => [{21098, 3}], loss => []};
remove_hero_stone(20814) ->
    #{gain => [{21098, 3}], loss => []};
remove_hero_stone(20815) ->
    #{gain => [{21098, 3}], loss => []};
remove_hero_stone(20816) ->
    #{gain => [{21098, 3}], loss => []};
remove_hero_stone(20817) ->
    #{gain => [{21098, 3}], loss => []};
remove_hero_stone(20828) ->
    #{gain => [{21098, 8}], loss => []};
remove_hero_stone(20829) ->
    #{gain => [{21098, 8}], loss => []};
remove_hero_stone(20830) ->
    #{gain => [{21098, 8}], loss => []};
remove_hero_stone(20831) ->
    #{gain => [{21098, 8}], loss => []};
remove_hero_stone(20832) ->
    #{gain => [{21098, 8}], loss => []};
remove_hero_stone(20833) ->
    #{gain => [{21098, 8}], loss => []};
remove_hero_stone(20834) ->
    #{gain => [{21098, 8}], loss => []};
remove_hero_stone(20835) ->
    #{gain => [{21098, 8}], loss => []};
remove_hero_stone(20836) ->
    #{gain => [{21098, 8}], loss => []};
remove_hero_stone(20837) ->
    #{gain => [{21098, 8}], loss => []};
remove_hero_stone(20848) ->
    #{gain => [{21098, 16}], loss => []};
remove_hero_stone(20849) ->
    #{gain => [{21098, 16}], loss => []};
remove_hero_stone(20850) ->
    #{gain => [{21098, 16}], loss => []};
remove_hero_stone(20851) ->
    #{gain => [{21098, 16}], loss => []};
remove_hero_stone(20852) ->
    #{gain => [{21098, 16}], loss => []};
remove_hero_stone(20853) ->
    #{gain => [{21098, 16}], loss => []};
remove_hero_stone(20854) ->
    #{gain => [{21098, 16}], loss => []};
remove_hero_stone(20855) ->
    #{gain => [{21098, 16}], loss => []};
remove_hero_stone(20856) ->
    #{gain => [{21098, 16}], loss => []};
remove_hero_stone(20857) ->
    #{gain => [{21098, 16}], loss => []};
remove_hero_stone(20868) ->
    #{gain => [{21098, 28}], loss => []};
remove_hero_stone(20869) ->
    #{gain => [{21098, 28}], loss => []};
remove_hero_stone(20870) ->
    #{gain => [{21098, 28}], loss => []};
remove_hero_stone(20871) ->
    #{gain => [{21098, 28}], loss => []};
remove_hero_stone(20872) ->
    #{gain => [{21098, 28}], loss => []};
remove_hero_stone(20873) ->
    #{gain => [{21098, 28}], loss => []};
remove_hero_stone(20874) ->
    #{gain => [{21098, 28}], loss => []};
remove_hero_stone(20875) ->
    #{gain => [{21098, 28}], loss => []};
remove_hero_stone(20876) ->
    #{gain => [{21098, 28}], loss => []};
remove_hero_stone(20877) ->
    #{gain => [{21098, 28}], loss => []};
remove_hero_stone(20888) ->
    #{gain => [{21098, 46}], loss => []};
remove_hero_stone(20889) ->
    #{gain => [{21098, 46}], loss => []};
remove_hero_stone(20890) ->
    #{gain => [{21098, 46}], loss => []};
remove_hero_stone(20891) ->
    #{gain => [{21098, 46}], loss => []};
remove_hero_stone(20892) ->
    #{gain => [{21098, 46}], loss => []};
remove_hero_stone(20893) ->
    #{gain => [{21098, 46}], loss => []};
remove_hero_stone(20894) ->
    #{gain => [{21098, 46}], loss => []};
remove_hero_stone(20895) ->
    #{gain => [{21098, 46}], loss => []};
remove_hero_stone(20896) ->
    #{gain => [{21098, 46}], loss => []};
remove_hero_stone(20897) ->
    #{gain => [{21098, 46}], loss => []};
remove_hero_stone(20908) ->
    #{gain => [{21098, 58}], loss => []};
remove_hero_stone(20909) ->
    #{gain => [{21098, 58}], loss => []};
remove_hero_stone(20910) ->
    #{gain => [{21098, 58}], loss => []};
remove_hero_stone(20911) ->
    #{gain => [{21098, 58}], loss => []};
remove_hero_stone(20912) ->
    #{gain => [{21098, 58}], loss => []};
remove_hero_stone(20913) ->
    #{gain => [{21098, 58}], loss => []};
remove_hero_stone(20914) ->
    #{gain => [{21098, 58}], loss => []};
remove_hero_stone(20915) ->
    #{gain => [{21098, 58}], loss => []};
remove_hero_stone(20916) ->
    #{gain => [{21098, 58}], loss => []};
remove_hero_stone(20917) ->
    #{gain => [{21098, 58}], loss => []};
remove_hero_stone(20928) ->
    #{gain => [{21098, 91}], loss => []};
remove_hero_stone(20929) ->
    #{gain => [{21098, 91}], loss => []};
remove_hero_stone(20930) ->
    #{gain => [{21098, 91}], loss => []};
remove_hero_stone(20931) ->
    #{gain => [{21098, 91}], loss => []};
remove_hero_stone(20932) ->
    #{gain => [{21098, 91}], loss => []};
remove_hero_stone(20933) ->
    #{gain => [{21098, 91}], loss => []};
remove_hero_stone(20934) ->
    #{gain => [{21098, 91}], loss => []};
remove_hero_stone(20935) ->
    #{gain => [{21098, 91}], loss => []};
remove_hero_stone(20936) ->
    #{gain => [{21098, 91}], loss => []};
remove_hero_stone(20937) ->
    #{gain => [{21098, 91}], loss => []};
remove_hero_stone(20948) ->
    #{gain => [{21098, 141}], loss => []};
remove_hero_stone(20949) ->
    #{gain => [{21098, 141}], loss => []};
remove_hero_stone(20950) ->
    #{gain => [{21098, 141}], loss => []};
remove_hero_stone(20951) ->
    #{gain => [{21098, 141}], loss => []};
remove_hero_stone(20952) ->
    #{gain => [{21098, 141}], loss => []};
remove_hero_stone(20953) ->
    #{gain => [{21098, 141}], loss => []};
remove_hero_stone(20954) ->
    #{gain => [{21098, 141}], loss => []};
remove_hero_stone(20955) ->
    #{gain => [{21098, 141}], loss => []};
remove_hero_stone(20956) ->
    #{gain => [{21098, 141}], loss => []};
remove_hero_stone(20957) ->
    #{gain => [{21098, 141}], loss => []};
remove_hero_stone(20968) ->
    #{gain => [{21098, 216}], loss => []};
remove_hero_stone(20969) ->
    #{gain => [{21098, 216}], loss => []};
remove_hero_stone(20970) ->
    #{gain => [{21098, 216}], loss => []};
remove_hero_stone(20971) ->
    #{gain => [{21098, 216}], loss => []};
remove_hero_stone(20972) ->
    #{gain => [{21098, 216}], loss => []};
remove_hero_stone(20973) ->
    #{gain => [{21098, 216}], loss => []};
remove_hero_stone(20974) ->
    #{gain => [{21098, 216}], loss => []};
remove_hero_stone(20975) ->
    #{gain => [{21098, 216}], loss => []};
remove_hero_stone(20976) ->
    #{gain => [{21098, 216}], loss => []};
remove_hero_stone(20977) ->
    #{gain => [{21098, 216}], loss => []};
remove_hero_stone(20988) ->
    #{gain => [{21098, 328}], loss => []};
remove_hero_stone(20989) ->
    #{gain => [{21098, 328}], loss => []};
remove_hero_stone(20990) ->
    #{gain => [{21098, 328}], loss => []};
remove_hero_stone(20991) ->
    #{gain => [{21098, 328}], loss => []};
remove_hero_stone(20992) ->
    #{gain => [{21098, 328}], loss => []};
remove_hero_stone(20993) ->
    #{gain => [{21098, 328}], loss => []};
remove_hero_stone(20994) ->
    #{gain => [{21098, 328}], loss => []};
remove_hero_stone(20995) ->
    #{gain => [{21098, 328}], loss => []};
remove_hero_stone(20996) ->
    #{gain => [{21098, 328}], loss => []};
remove_hero_stone(20997) ->
    #{gain => [{21098, 328}], loss => []};
remove_hero_stone(21008) ->
    #{gain => [{21098, 496}], loss => []};
remove_hero_stone(21009) ->
    #{gain => [{21098, 496}], loss => []};
remove_hero_stone(21010) ->
    #{gain => [{21098, 496}], loss => []};
remove_hero_stone(21011) ->
    #{gain => [{21098, 496}], loss => []};
remove_hero_stone(21012) ->
    #{gain => [{21098, 496}], loss => []};
remove_hero_stone(21013) ->
    #{gain => [{21098, 496}], loss => []};
remove_hero_stone(21014) ->
    #{gain => [{21098, 496}], loss => []};
remove_hero_stone(21015) ->
    #{gain => [{21098, 496}], loss => []};
remove_hero_stone(21016) ->
    #{gain => [{21098, 496}], loss => []};
remove_hero_stone(21017) ->
    #{gain => [{21098, 496}], loss => []};
remove_hero_stone(21028) ->
    #{gain => [{21098, 746}], loss => []};
remove_hero_stone(21029) ->
    #{gain => [{21098, 746}], loss => []};
remove_hero_stone(21030) ->
    #{gain => [{21098, 746}], loss => []};
remove_hero_stone(21031) ->
    #{gain => [{21098, 746}], loss => []};
remove_hero_stone(21032) ->
    #{gain => [{21098, 746}], loss => []};
remove_hero_stone(21033) ->
    #{gain => [{21098, 746}], loss => []};
remove_hero_stone(21034) ->
    #{gain => [{21098, 746}], loss => []};
remove_hero_stone(21035) ->
    #{gain => [{21098, 746}], loss => []};
remove_hero_stone(21036) ->
    #{gain => [{21098, 746}], loss => []};
remove_hero_stone(21037) ->
    #{gain => [{21098, 746}], loss => []};
remove_hero_stone(_) -> false.

stone_degrade(20908) ->
    #{subtract_exp => 60, pre_id => 20888};
stone_degrade(20909) ->
    #{subtract_exp => 60, pre_id => 20889};
stone_degrade(20910) ->
    #{subtract_exp => 60, pre_id => 20890};
stone_degrade(20911) ->
    #{subtract_exp => 60, pre_id => 20891};
stone_degrade(20912) ->
    #{subtract_exp => 60, pre_id => 20892};
stone_degrade(20913) ->
    #{subtract_exp => 60, pre_id => 20893};
stone_degrade(20914) ->
    #{subtract_exp => 60, pre_id => 20894};
stone_degrade(20915) ->
    #{subtract_exp => 60, pre_id => 20895};
stone_degrade(20916) ->
    #{subtract_exp => 60, pre_id => 20896};
stone_degrade(20917) ->
    #{subtract_exp => 60, pre_id => 20897};
stone_degrade(20928) ->
    #{subtract_exp => 100, pre_id => 20908};
stone_degrade(20929) ->
    #{subtract_exp => 100, pre_id => 20909};
stone_degrade(20930) ->
    #{subtract_exp => 100, pre_id => 20910};
stone_degrade(20931) ->
    #{subtract_exp => 100, pre_id => 20911};
stone_degrade(20932) ->
    #{subtract_exp => 100, pre_id => 20912};
stone_degrade(20933) ->
    #{subtract_exp => 100, pre_id => 20913};
stone_degrade(20934) ->
    #{subtract_exp => 100, pre_id => 20914};
stone_degrade(20935) ->
    #{subtract_exp => 100, pre_id => 20915};
stone_degrade(20936) ->
    #{subtract_exp => 100, pre_id => 20916};
stone_degrade(20937) ->
    #{subtract_exp => 100, pre_id => 20917};
stone_degrade(20948) ->
    #{subtract_exp => 150, pre_id => 20928};
stone_degrade(20949) ->
    #{subtract_exp => 150, pre_id => 20929};
stone_degrade(20950) ->
    #{subtract_exp => 150, pre_id => 20930};
stone_degrade(20951) ->
    #{subtract_exp => 150, pre_id => 20931};
stone_degrade(20952) ->
    #{subtract_exp => 150, pre_id => 20932};
stone_degrade(20953) ->
    #{subtract_exp => 150, pre_id => 20933};
stone_degrade(20954) ->
    #{subtract_exp => 150, pre_id => 20934};
stone_degrade(20955) ->
    #{subtract_exp => 150, pre_id => 20935};
stone_degrade(20956) ->
    #{subtract_exp => 150, pre_id => 20936};
stone_degrade(20957) ->
    #{subtract_exp => 150, pre_id => 20937};
stone_degrade(20968) ->
    #{subtract_exp => 225, pre_id => 20948};
stone_degrade(20969) ->
    #{subtract_exp => 225, pre_id => 20949};
stone_degrade(20970) ->
    #{subtract_exp => 225, pre_id => 20950};
stone_degrade(20971) ->
    #{subtract_exp => 225, pre_id => 20951};
stone_degrade(20972) ->
    #{subtract_exp => 225, pre_id => 20952};
stone_degrade(20973) ->
    #{subtract_exp => 225, pre_id => 20953};
stone_degrade(20974) ->
    #{subtract_exp => 225, pre_id => 20954};
stone_degrade(20975) ->
    #{subtract_exp => 225, pre_id => 20955};
stone_degrade(20976) ->
    #{subtract_exp => 225, pre_id => 20956};
stone_degrade(20977) ->
    #{subtract_exp => 225, pre_id => 20957};
stone_degrade(20988) ->
    #{subtract_exp => 335, pre_id => 20968};
stone_degrade(20989) ->
    #{subtract_exp => 335, pre_id => 20969};
stone_degrade(20990) ->
    #{subtract_exp => 335, pre_id => 20970};
stone_degrade(20991) ->
    #{subtract_exp => 335, pre_id => 20971};
stone_degrade(20992) ->
    #{subtract_exp => 335, pre_id => 20972};
stone_degrade(20993) ->
    #{subtract_exp => 335, pre_id => 20973};
stone_degrade(20994) ->
    #{subtract_exp => 335, pre_id => 20974};
stone_degrade(20995) ->
    #{subtract_exp => 335, pre_id => 20975};
stone_degrade(20996) ->
    #{subtract_exp => 335, pre_id => 20976};
stone_degrade(20997) ->
    #{subtract_exp => 335, pre_id => 20977};
stone_degrade(21008) ->
    #{subtract_exp => 500, pre_id => 20988};
stone_degrade(21009) ->
    #{subtract_exp => 500, pre_id => 20989};
stone_degrade(21010) ->
    #{subtract_exp => 500, pre_id => 20990};
stone_degrade(21011) ->
    #{subtract_exp => 500, pre_id => 20991};
stone_degrade(21012) ->
    #{subtract_exp => 500, pre_id => 20992};
stone_degrade(21013) ->
    #{subtract_exp => 500, pre_id => 20993};
stone_degrade(21014) ->
    #{subtract_exp => 500, pre_id => 20994};
stone_degrade(21015) ->
    #{subtract_exp => 500, pre_id => 20995};
stone_degrade(21016) ->
    #{subtract_exp => 500, pre_id => 20996};
stone_degrade(21017) ->
    #{subtract_exp => 500, pre_id => 20997};
stone_degrade(21028) ->
    #{subtract_exp => 750, pre_id => 21008};
stone_degrade(21029) ->
    #{subtract_exp => 750, pre_id => 21009};
stone_degrade(21030) ->
    #{subtract_exp => 750, pre_id => 21010};
stone_degrade(21031) ->
    #{subtract_exp => 750, pre_id => 21011};
stone_degrade(21032) ->
    #{subtract_exp => 750, pre_id => 21012};
stone_degrade(21033) ->
    #{subtract_exp => 750, pre_id => 21013};
stone_degrade(21034) ->
    #{subtract_exp => 750, pre_id => 21014};
stone_degrade(21035) ->
    #{subtract_exp => 750, pre_id => 21015};
stone_degrade(21036) ->
    #{subtract_exp => 750, pre_id => 21016};
stone_degrade(21037) ->
    #{subtract_exp => 750, pre_id => 21017};
stone_degrade(_) -> false.

get_transform(40) -> [{29006, 1}];
get_transform(50) -> [{29006, 2}];
get_transform(60) -> [{29006, 3}];
get_transform(70) -> [{29006, 5}];
get_transform(80) -> [{29006, 8}];
get_transform(90) -> [{29007, 3}];
get_transform(100) -> [{29007, 3}];
get_transform(110) -> [{29007, 5}];
get_transform(120) -> [{29007, 8}];
get_transform(_) -> false.

get_skill_transform(40) -> [{22212, 1}];
get_skill_transform(50) -> [{22212, 1}];
get_skill_transform(60) -> [{22212, 2}];
get_skill_transform(70) -> [{22212, 3}];
get_skill_transform(80) -> [{22212, 5}];
get_skill_transform(90) -> [{22212, 8}];
get_skill_transform(100) -> [{22212, 10}];
get_skill_transform(110) -> [{22212, 12}];
get_skill_transform(120) -> [{22212, 15}];
get_skill_transform(_) -> false.

get_reset_reward() -> [{22589, 1}].

get_comprehend({1, 1, 1}) ->
    #{classes => 1, type => 1, lev => 80, craft => 1,
      loss => [{20653, 3}], min_val => 3, max_val => 6,
      attr_type => [{101, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      looks => 11101, looks_active_val => 5, lock_loss => [],
      lockable => 0, fashion_id => 11101};
get_comprehend({1, 6, 1}) ->
    #{classes => 1, type => 6, lev => 80, craft => 1,
      loss => [{20655, 3}], min_val => 2, max_val => 5,
      attr_type => [{101, 100}, {104, 100}],
      attr_val => [{2, 350}, {3, 380}, {4, 200}, {5, 70}],
      lock_loss => [], lockable => 0};
get_comprehend({1, 7, 1}) ->
    #{classes => 1, type => 7, lev => 80, craft => 1,
      loss => [{20655, 3}], min_val => 2, max_val => 5,
      attr_type => [{101, 100}, {102, 100}],
      attr_val => [{2, 350}, {3, 380}, {4, 200}, {5, 70}],
      lock_loss => [], lockable => 0};
get_comprehend({1, 9, 1}) ->
    #{classes => 1, type => 9, lev => 80, craft => 1,
      loss => [{20655, 3}], min_val => 2, max_val => 5,
      attr_type => [{101, 100}, {102, 100}],
      attr_val => [{2, 350}, {3, 380}, {4, 200}, {5, 70}],
      lock_loss => [], lockable => 0};
get_comprehend({1, 10, 1}) ->
    #{classes => 1, type => 10, lev => 80, craft => 1,
      loss => [{20654, 3}], min_val => 2, max_val => 5,
      attr_type => [{102, 100}, {105, 100}],
      attr_val => [{2, 350}, {3, 380}, {4, 200}, {5, 70}],
      lock_loss => [], lockable => 0};
get_comprehend({1, 11, 1}) ->
    #{classes => 1, type => 11, lev => 80, craft => 1,
      loss => [{20654, 3}], min_val => 2, max_val => 5,
      attr_type => [{101, 100}, {105, 100}],
      attr_val => [{2, 350}, {3, 380}, {4, 200}, {5, 70}],
      lock_loss => [], lockable => 0};
get_comprehend({1, 12, 1}) ->
    #{classes => 1, type => 12, lev => 80, craft => 1,
      loss => [{20654, 3}], min_val => 2, max_val => 5,
      attr_type => [{102, 100}, {104, 100}],
      attr_val => [{2, 350}, {3, 380}, {4, 200}, {5, 70}],
      lock_loss => [], lockable => 0};
get_comprehend({1, 14, 1}) ->
    #{classes => 1, type => 14, lev => 80, craft => 1,
      loss => [{20654, 3}], min_val => 2, max_val => 5,
      attr_type => [{104, 100}, {105, 100}],
      attr_val => [{2, 350}, {3, 380}, {4, 200}, {5, 70}],
      lock_loss => [], lockable => 0};
get_comprehend({1, 1, 2}) ->
    #{classes => 1, type => 1, lev => 85, craft => 2,
      loss => [{20653, 5}], min_val => 3, max_val => 6,
      attr_type => [{101, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [], lockable => 0};
get_comprehend({1, 6, 2}) ->
    #{classes => 1, type => 6, lev => 85, craft => 2,
      loss => [{20655, 5}], min_val => 2, max_val => 5,
      attr_type => [{101, 100}, {104, 100}],
      attr_val => [{2, 350}, {3, 380}, {4, 200}, {5, 70}],
      lock_loss => [], lockable => 0};
get_comprehend({1, 7, 2}) ->
    #{classes => 1, type => 7, lev => 85, craft => 2,
      loss => [{20655, 5}], min_val => 2, max_val => 5,
      attr_type => [{101, 100}, {102, 100}],
      attr_val => [{2, 350}, {3, 380}, {4, 200}, {5, 70}],
      lock_loss => [], lockable => 0};
get_comprehend({1, 9, 2}) ->
    #{classes => 1, type => 9, lev => 85, craft => 2,
      loss => [{20655, 5}], min_val => 2, max_val => 5,
      attr_type => [{101, 100}, {102, 100}],
      attr_val => [{2, 350}, {3, 380}, {4, 200}, {5, 70}],
      lock_loss => [], lockable => 0};
get_comprehend({1, 10, 2}) ->
    #{classes => 1, type => 10, lev => 85, craft => 2,
      loss => [{20654, 5}], min_val => 2, max_val => 5,
      attr_type => [{102, 100}, {105, 100}],
      attr_val => [{2, 350}, {3, 380}, {4, 200}, {5, 70}],
      lock_loss => [], lockable => 0};
get_comprehend({1, 11, 2}) ->
    #{classes => 1, type => 11, lev => 85, craft => 2,
      loss => [{20654, 5}], min_val => 2, max_val => 5,
      attr_type => [{101, 100}, {105, 100}],
      attr_val => [{2, 350}, {3, 380}, {4, 200}, {5, 70}],
      lock_loss => [], lockable => 0};
get_comprehend({1, 12, 2}) ->
    #{classes => 1, type => 12, lev => 85, craft => 2,
      loss => [{20654, 5}], min_val => 2, max_val => 5,
      attr_type => [{102, 100}, {104, 100}],
      attr_val => [{2, 350}, {3, 380}, {4, 200}, {5, 70}],
      lock_loss => [], lockable => 0};
get_comprehend({1, 14, 2}) ->
    #{classes => 1, type => 14, lev => 85, craft => 2,
      loss => [{20654, 5}], min_val => 2, max_val => 5,
      attr_type => [{104, 100}, {105, 100}],
      attr_val => [{2, 350}, {3, 380}, {4, 200}, {5, 70}],
      lock_loss => [], lockable => 0};
get_comprehend({1, 1, 3}) ->
    #{classes => 1, type => 1, lev => 90, craft => 3,
      loss => [{20656, 3}], min_val => 4, max_val => 7,
      attr_type => [{101, 100}, {104, 100}],
      attr_val => [{4, 350}, {5, 380}, {6, 200}, {7, 70}],
      looks => 11103, looks_active_val => 6,
      lock_loss => [{20649, 2}], lockable => 1,
      fashion_id => 11103};
get_comprehend({1, 6, 3}) ->
    #{classes => 1, type => 6, lev => 90, craft => 3,
      loss => [{20658, 3}], min_val => 3, max_val => 6,
      attr_type => [{101, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 1}], lockable => 1};
get_comprehend({1, 7, 3}) ->
    #{classes => 1, type => 7, lev => 90, craft => 3,
      loss => [{20658, 3}], min_val => 3, max_val => 6,
      attr_type => [{101, 100}, {102, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 1}], lockable => 1};
get_comprehend({1, 9, 3}) ->
    #{classes => 1, type => 9, lev => 90, craft => 3,
      loss => [{20658, 3}], min_val => 3, max_val => 6,
      attr_type => [{101, 100}, {102, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 1}], lockable => 1};
get_comprehend({1, 10, 3}) ->
    #{classes => 1, type => 10, lev => 90, craft => 3,
      loss => [{20657, 3}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 1}], lockable => 1};
get_comprehend({1, 11, 3}) ->
    #{classes => 1, type => 11, lev => 90, craft => 3,
      loss => [{20657, 3}], min_val => 3, max_val => 6,
      attr_type => [{101, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 1}], lockable => 1};
get_comprehend({1, 12, 3}) ->
    #{classes => 1, type => 12, lev => 90, craft => 3,
      loss => [{20657, 3}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 1}], lockable => 1};
get_comprehend({1, 14, 3}) ->
    #{classes => 1, type => 14, lev => 90, craft => 3,
      loss => [{20657, 3}], min_val => 3, max_val => 6,
      attr_type => [{104, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 1}], lockable => 1};
get_comprehend({1, 1, 4}) ->
    #{classes => 1, type => 1, lev => 92, craft => 4,
      loss => [{20656, 4}], min_val => 4, max_val => 7,
      attr_type => [{101, 100}, {104, 100}],
      attr_val => [{4, 350}, {5, 380}, {6, 200}, {7, 70}],
      lock_loss => [{20649, 3}], lockable => 1};
get_comprehend({1, 6, 4}) ->
    #{classes => 1, type => 6, lev => 92, craft => 4,
      loss => [{20658, 4}], min_val => 3, max_val => 6,
      attr_type => [{101, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 2}], lockable => 1};
get_comprehend({1, 7, 4}) ->
    #{classes => 1, type => 7, lev => 92, craft => 4,
      loss => [{20658, 4}], min_val => 3, max_val => 6,
      attr_type => [{101, 100}, {102, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 2}], lockable => 1};
get_comprehend({1, 9, 4}) ->
    #{classes => 1, type => 9, lev => 92, craft => 4,
      loss => [{20658, 4}], min_val => 3, max_val => 6,
      attr_type => [{101, 100}, {102, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 2}], lockable => 1};
get_comprehend({1, 10, 4}) ->
    #{classes => 1, type => 10, lev => 92, craft => 4,
      loss => [{20657, 4}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 2}], lockable => 1};
get_comprehend({1, 11, 4}) ->
    #{classes => 1, type => 11, lev => 92, craft => 4,
      loss => [{20657, 4}], min_val => 3, max_val => 6,
      attr_type => [{101, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 2}], lockable => 1};
get_comprehend({1, 12, 4}) ->
    #{classes => 1, type => 12, lev => 92, craft => 4,
      loss => [{20657, 4}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 2}], lockable => 1};
get_comprehend({1, 14, 4}) ->
    #{classes => 1, type => 14, lev => 92, craft => 4,
      loss => [{20657, 4}], min_val => 3, max_val => 6,
      attr_type => [{104, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 2}], lockable => 1};
get_comprehend({1, 1, 5}) ->
    #{classes => 1, type => 1, lev => 94, craft => 5,
      loss => [{20656, 5}], min_val => 4, max_val => 7,
      attr_type => [{101, 100}, {104, 100}],
      attr_val => [{4, 350}, {5, 380}, {6, 200}, {7, 70}],
      looks => 11102, looks_active_val => 6,
      lock_loss => [{20649, 5}], lockable => 1,
      fashion_id => 11102};
get_comprehend({1, 6, 5}) ->
    #{classes => 1, type => 6, lev => 94, craft => 5,
      loss => [{20658, 5}], min_val => 3, max_val => 6,
      attr_type => [{101, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 3}], lockable => 1};
get_comprehend({1, 7, 5}) ->
    #{classes => 1, type => 7, lev => 94, craft => 5,
      loss => [{20658, 5}], min_val => 3, max_val => 6,
      attr_type => [{101, 100}, {102, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 3}], lockable => 1};
get_comprehend({1, 9, 5}) ->
    #{classes => 1, type => 9, lev => 94, craft => 5,
      loss => [{20658, 5}], min_val => 3, max_val => 6,
      attr_type => [{101, 100}, {102, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 3}], lockable => 1};
get_comprehend({1, 10, 5}) ->
    #{classes => 1, type => 10, lev => 94, craft => 5,
      loss => [{20657, 5}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 3}], lockable => 1};
get_comprehend({1, 11, 5}) ->
    #{classes => 1, type => 11, lev => 94, craft => 5,
      loss => [{20657, 5}], min_val => 3, max_val => 6,
      attr_type => [{101, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 3}], lockable => 1};
get_comprehend({1, 12, 5}) ->
    #{classes => 1, type => 12, lev => 94, craft => 5,
      loss => [{20657, 5}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 3}], lockable => 1};
get_comprehend({1, 14, 5}) ->
    #{classes => 1, type => 14, lev => 94, craft => 5,
      loss => [{20657, 5}], min_val => 3, max_val => 6,
      attr_type => [{104, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 3}], lockable => 1};
get_comprehend({1, 1, 6}) ->
    #{classes => 1, type => 1, lev => 96, craft => 6,
      loss => [{20656, 5}], min_val => 4, max_val => 7,
      attr_type => [{101, 100}, {104, 100}],
      attr_val => [{4, 350}, {5, 380}, {6, 200}, {7, 70}],
      lock_loss => [{20649, 6}], lockable => 1};
get_comprehend({1, 6, 6}) ->
    #{classes => 1, type => 6, lev => 96, craft => 6,
      loss => [{20658, 5}], min_val => 3, max_val => 6,
      attr_type => [{101, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 4}], lockable => 1};
get_comprehend({1, 7, 6}) ->
    #{classes => 1, type => 7, lev => 96, craft => 6,
      loss => [{20658, 5}], min_val => 3, max_val => 6,
      attr_type => [{101, 100}, {102, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 4}], lockable => 1};
get_comprehend({1, 9, 6}) ->
    #{classes => 1, type => 9, lev => 96, craft => 6,
      loss => [{20658, 5}], min_val => 3, max_val => 6,
      attr_type => [{101, 100}, {102, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 4}], lockable => 1};
get_comprehend({1, 10, 6}) ->
    #{classes => 1, type => 10, lev => 96, craft => 6,
      loss => [{20657, 5}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 4}], lockable => 1};
get_comprehend({1, 11, 6}) ->
    #{classes => 1, type => 11, lev => 96, craft => 6,
      loss => [{20657, 5}], min_val => 3, max_val => 6,
      attr_type => [{101, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 4}], lockable => 1};
get_comprehend({1, 12, 6}) ->
    #{classes => 1, type => 12, lev => 96, craft => 6,
      loss => [{20657, 5}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 4}], lockable => 1};
get_comprehend({1, 14, 6}) ->
    #{classes => 1, type => 14, lev => 96, craft => 6,
      loss => [{20657, 5}], min_val => 3, max_val => 6,
      attr_type => [{104, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 4}], lockable => 1};
get_comprehend({1, 1, 7}) ->
    #{classes => 1, type => 1, lev => 97, craft => 7,
      loss => [{20656, 6}], min_val => 4, max_val => 7,
      attr_type => [{101, 100}, {104, 100}],
      attr_val => [{4, 350}, {5, 380}, {6, 200}, {7, 70}],
      looks => 11104, looks_active_val => 6,
      lock_loss => [{20649, 8}], lockable => 1,
      fashion_id => 11104};
get_comprehend({1, 6, 7}) ->
    #{classes => 1, type => 6, lev => 97, craft => 7,
      loss => [{20658, 6}], min_val => 3, max_val => 6,
      attr_type => [{101, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 5}], lockable => 1};
get_comprehend({1, 7, 7}) ->
    #{classes => 1, type => 7, lev => 97, craft => 7,
      loss => [{20658, 6}], min_val => 3, max_val => 6,
      attr_type => [{101, 100}, {102, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 5}], lockable => 1};
get_comprehend({1, 9, 7}) ->
    #{classes => 1, type => 9, lev => 97, craft => 7,
      loss => [{20658, 6}], min_val => 3, max_val => 6,
      attr_type => [{101, 100}, {102, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 5}], lockable => 1};
get_comprehend({1, 10, 7}) ->
    #{classes => 1, type => 10, lev => 97, craft => 7,
      loss => [{20657, 6}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 5}], lockable => 1};
get_comprehend({1, 11, 7}) ->
    #{classes => 1, type => 11, lev => 97, craft => 7,
      loss => [{20657, 6}], min_val => 3, max_val => 6,
      attr_type => [{101, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 5}], lockable => 1};
get_comprehend({1, 12, 7}) ->
    #{classes => 1, type => 12, lev => 97, craft => 7,
      loss => [{20657, 6}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 5}], lockable => 1};
get_comprehend({1, 14, 7}) ->
    #{classes => 1, type => 14, lev => 97, craft => 7,
      loss => [{20657, 6}], min_val => 3, max_val => 6,
      attr_type => [{104, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 5}], lockable => 1};
get_comprehend({1, 1, 8}) ->
    #{classes => 1, type => 1, lev => 98, craft => 8,
      loss => [{20656, 8}], min_val => 4, max_val => 7,
      attr_type => [{101, 100}, {104, 100}],
      attr_val => [{4, 350}, {5, 380}, {6, 200}, {7, 70}],
      lock_loss => [{20649, 10}], lockable => 1};
get_comprehend({1, 6, 8}) ->
    #{classes => 1, type => 6, lev => 98, craft => 8,
      loss => [{20658, 8}], min_val => 3, max_val => 6,
      attr_type => [{101, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 6}], lockable => 1};
get_comprehend({1, 7, 8}) ->
    #{classes => 1, type => 7, lev => 98, craft => 8,
      loss => [{20658, 8}], min_val => 3, max_val => 6,
      attr_type => [{101, 100}, {102, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 6}], lockable => 1};
get_comprehend({1, 9, 8}) ->
    #{classes => 1, type => 9, lev => 98, craft => 8,
      loss => [{20658, 8}], min_val => 3, max_val => 6,
      attr_type => [{101, 100}, {102, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 6}], lockable => 1};
get_comprehend({1, 10, 8}) ->
    #{classes => 1, type => 10, lev => 98, craft => 8,
      loss => [{20657, 8}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 6}], lockable => 1};
get_comprehend({1, 11, 8}) ->
    #{classes => 1, type => 11, lev => 98, craft => 8,
      loss => [{20657, 8}], min_val => 3, max_val => 6,
      attr_type => [{101, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 6}], lockable => 1};
get_comprehend({1, 12, 8}) ->
    #{classes => 1, type => 12, lev => 98, craft => 8,
      loss => [{20657, 8}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 6}], lockable => 1};
get_comprehend({1, 14, 8}) ->
    #{classes => 1, type => 14, lev => 98, craft => 8,
      loss => [{20657, 8}], min_val => 3, max_val => 6,
      attr_type => [{104, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 6}], lockable => 1};
get_comprehend({1, 1, 9}) ->
    #{classes => 1, type => 1, lev => 100, craft => 9,
      loss => [{20659, 3}], min_val => 4, max_val => 7,
      attr_type => [{101, 100}, {104, 100}],
      attr_val => [{4, 350}, {5, 380}, {6, 200}, {7, 70}],
      lock_loss => [{20649, 12}], lockable => 1};
get_comprehend({1, 6, 9}) ->
    #{classes => 1, type => 6, lev => 100, craft => 9,
      loss => [{20661, 3}], min_val => 3, max_val => 6,
      attr_type => [{101, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 7}], lockable => 1};
get_comprehend({1, 7, 9}) ->
    #{classes => 1, type => 7, lev => 100, craft => 9,
      loss => [{20661, 3}], min_val => 3, max_val => 6,
      attr_type => [{101, 100}, {102, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 7}], lockable => 1};
get_comprehend({1, 9, 9}) ->
    #{classes => 1, type => 9, lev => 100, craft => 9,
      loss => [{20661, 3}], min_val => 3, max_val => 6,
      attr_type => [{101, 100}, {102, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 7}], lockable => 1};
get_comprehend({1, 10, 9}) ->
    #{classes => 1, type => 10, lev => 100, craft => 9,
      loss => [{20660, 3}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 7}], lockable => 1};
get_comprehend({1, 11, 9}) ->
    #{classes => 1, type => 11, lev => 100, craft => 9,
      loss => [{20660, 3}], min_val => 3, max_val => 6,
      attr_type => [{101, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 7}], lockable => 1};
get_comprehend({1, 12, 9}) ->
    #{classes => 1, type => 12, lev => 100, craft => 9,
      loss => [{20660, 3}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 7}], lockable => 1};
get_comprehend({1, 14, 9}) ->
    #{classes => 1, type => 14, lev => 100, craft => 9,
      loss => [{20660, 3}], min_val => 3, max_val => 6,
      attr_type => [{104, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 7}], lockable => 1};
get_comprehend({1, 1, 10}) ->
    #{classes => 1, type => 1, lev => 102, craft => 10,
      loss => [{20659, 5}], min_val => 4, max_val => 7,
      attr_type => [{101, 100}, {104, 100}],
      attr_val => [{4, 350}, {5, 380}, {6, 200}, {7, 70}],
      lock_loss => [{20649, 15}], lockable => 1};
get_comprehend({1, 6, 10}) ->
    #{classes => 1, type => 6, lev => 102, craft => 10,
      loss => [{20661, 5}], min_val => 3, max_val => 6,
      attr_type => [{101, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 9}], lockable => 1};
get_comprehend({1, 7, 10}) ->
    #{classes => 1, type => 7, lev => 102, craft => 10,
      loss => [{20661, 5}], min_val => 3, max_val => 6,
      attr_type => [{101, 100}, {102, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 9}], lockable => 1};
get_comprehend({1, 9, 10}) ->
    #{classes => 1, type => 9, lev => 102, craft => 10,
      loss => [{20661, 5}], min_val => 3, max_val => 6,
      attr_type => [{101, 100}, {102, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 9}], lockable => 1};
get_comprehend({1, 10, 10}) ->
    #{classes => 1, type => 10, lev => 102, craft => 10,
      loss => [{20660, 5}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 9}], lockable => 1};
get_comprehend({1, 11, 10}) ->
    #{classes => 1, type => 11, lev => 102, craft => 10,
      loss => [{20660, 5}], min_val => 3, max_val => 6,
      attr_type => [{101, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 9}], lockable => 1};
get_comprehend({1, 12, 10}) ->
    #{classes => 1, type => 12, lev => 102, craft => 10,
      loss => [{20660, 5}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 9}], lockable => 1};
get_comprehend({1, 14, 10}) ->
    #{classes => 1, type => 14, lev => 102, craft => 10,
      loss => [{20660, 5}], min_val => 3, max_val => 6,
      attr_type => [{104, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 9}], lockable => 1};
get_comprehend({1, 1, 11}) ->
    #{classes => 1, type => 1, lev => 105, craft => 11,
      loss => [{20659, 6}], min_val => 2, max_val => 5,
      attr_type => [{101, 100}, {104, 100}],
      attr_val => [{2, 350}, {3, 380}, {4, 200}, {5, 70}],
      lock_loss => [{20649, 18}], lockable => 1};
get_comprehend({1, 6, 11}) ->
    #{classes => 1, type => 6, lev => 105, craft => 11,
      loss => [{20661, 6}], min_val => 1, max_val => 4,
      attr_type => [{101, 100}, {104, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 12}], lockable => 1};
get_comprehend({1, 7, 11}) ->
    #{classes => 1, type => 7, lev => 105, craft => 11,
      loss => [{20661, 6}], min_val => 1, max_val => 4,
      attr_type => [{101, 100}, {102, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 12}], lockable => 1};
get_comprehend({1, 9, 11}) ->
    #{classes => 1, type => 9, lev => 105, craft => 11,
      loss => [{20661, 6}], min_val => 1, max_val => 4,
      attr_type => [{101, 100}, {102, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 12}], lockable => 1};
get_comprehend({1, 10, 11}) ->
    #{classes => 1, type => 10, lev => 105, craft => 11,
      loss => [{20660, 6}], min_val => 1, max_val => 4,
      attr_type => [{102, 100}, {105, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 12}], lockable => 1};
get_comprehend({1, 11, 11}) ->
    #{classes => 1, type => 11, lev => 105, craft => 11,
      loss => [{20660, 6}], min_val => 1, max_val => 4,
      attr_type => [{101, 100}, {105, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 12}], lockable => 1};
get_comprehend({1, 12, 11}) ->
    #{classes => 1, type => 12, lev => 105, craft => 11,
      loss => [{20660, 6}], min_val => 1, max_val => 4,
      attr_type => [{102, 100}, {104, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 12}], lockable => 1};
get_comprehend({1, 14, 11}) ->
    #{classes => 1, type => 14, lev => 105, craft => 11,
      loss => [{20660, 6}], min_val => 1, max_val => 4,
      attr_type => [{104, 100}, {105, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 12}], lockable => 1};
get_comprehend({1, 1, 12}) ->
    #{classes => 1, type => 1, lev => 108, craft => 12,
      loss => [{20659, 8}], min_val => 2, max_val => 5,
      attr_type => [{101, 100}, {104, 100}],
      attr_val => [{2, 350}, {3, 380}, {4, 200}, {5, 70}],
      lock_loss => [{20649, 20}], lockable => 1};
get_comprehend({1, 6, 12}) ->
    #{classes => 1, type => 6, lev => 108, craft => 12,
      loss => [{20661, 8}], min_val => 1, max_val => 4,
      attr_type => [{101, 100}, {104, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 15}], lockable => 1};
get_comprehend({1, 7, 12}) ->
    #{classes => 1, type => 7, lev => 108, craft => 12,
      loss => [{20661, 8}], min_val => 1, max_val => 4,
      attr_type => [{101, 100}, {102, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 15}], lockable => 1};
get_comprehend({1, 9, 12}) ->
    #{classes => 1, type => 9, lev => 108, craft => 12,
      loss => [{20661, 8}], min_val => 1, max_val => 4,
      attr_type => [{101, 100}, {102, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 15}], lockable => 1};
get_comprehend({1, 10, 12}) ->
    #{classes => 1, type => 10, lev => 108, craft => 12,
      loss => [{20660, 8}], min_val => 1, max_val => 4,
      attr_type => [{102, 100}, {105, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 15}], lockable => 1};
get_comprehend({1, 11, 12}) ->
    #{classes => 1, type => 11, lev => 108, craft => 12,
      loss => [{20660, 8}], min_val => 1, max_val => 4,
      attr_type => [{101, 100}, {105, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 15}], lockable => 1};
get_comprehend({1, 12, 12}) ->
    #{classes => 1, type => 12, lev => 108, craft => 12,
      loss => [{20660, 8}], min_val => 1, max_val => 4,
      attr_type => [{102, 100}, {104, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 15}], lockable => 1};
get_comprehend({1, 14, 12}) ->
    #{classes => 1, type => 14, lev => 108, craft => 12,
      loss => [{20660, 8}], min_val => 1, max_val => 4,
      attr_type => [{104, 100}, {105, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 15}], lockable => 1};
get_comprehend({1, 1, 13}) ->
    #{classes => 1, type => 1, lev => 110, craft => 13,
      loss => [{20662, 3}], min_val => 2, max_val => 5,
      attr_type => [{101, 100}, {104, 100}],
      attr_val => [{2, 350}, {3, 380}, {4, 200}, {5, 70}],
      lock_loss => [{20649, 25}], lockable => 1};
get_comprehend({1, 6, 13}) ->
    #{classes => 1, type => 6, lev => 110, craft => 13,
      loss => [{20664, 3}], min_val => 1, max_val => 4,
      attr_type => [{101, 100}, {104, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 20}], lockable => 1};
get_comprehend({1, 7, 13}) ->
    #{classes => 1, type => 7, lev => 110, craft => 13,
      loss => [{20664, 3}], min_val => 1, max_val => 4,
      attr_type => [{101, 100}, {102, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 20}], lockable => 1};
get_comprehend({1, 9, 13}) ->
    #{classes => 1, type => 9, lev => 110, craft => 13,
      loss => [{20664, 3}], min_val => 1, max_val => 4,
      attr_type => [{101, 100}, {102, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 20}], lockable => 1};
get_comprehend({1, 10, 13}) ->
    #{classes => 1, type => 10, lev => 110, craft => 13,
      loss => [{20663, 3}], min_val => 1, max_val => 4,
      attr_type => [{102, 100}, {105, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 20}], lockable => 1};
get_comprehend({1, 11, 13}) ->
    #{classes => 1, type => 11, lev => 110, craft => 13,
      loss => [{20663, 3}], min_val => 1, max_val => 4,
      attr_type => [{101, 100}, {105, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 20}], lockable => 1};
get_comprehend({1, 12, 13}) ->
    #{classes => 1, type => 12, lev => 110, craft => 13,
      loss => [{20663, 3}], min_val => 1, max_val => 4,
      attr_type => [{102, 100}, {104, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 20}], lockable => 1};
get_comprehend({1, 14, 13}) ->
    #{classes => 1, type => 14, lev => 110, craft => 13,
      loss => [{20663, 3}], min_val => 1, max_val => 4,
      attr_type => [{104, 100}, {105, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 20}], lockable => 1};
get_comprehend({2, 2, 1}) ->
    #{classes => 2, type => 2, lev => 80, craft => 1,
      loss => [{20653, 3}], min_val => 3, max_val => 6,
      attr_type => [{103, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      looks => 11201, looks_active_val => 5, lock_loss => [],
      lockable => 0, fashion_id => 11201};
get_comprehend({2, 6, 1}) ->
    #{classes => 2, type => 6, lev => 80, craft => 1,
      loss => [{20655, 3}], min_val => 2, max_val => 5,
      attr_type => [{102, 100}, {104, 100}],
      attr_val => [{2, 350}, {3, 380}, {4, 200}, {5, 70}],
      lock_loss => [], lockable => 0};
get_comprehend({2, 7, 1}) ->
    #{classes => 2, type => 7, lev => 80, craft => 1,
      loss => [{20655, 3}], min_val => 2, max_val => 5,
      attr_type => [{103, 100}, {102, 100}],
      attr_val => [{2, 350}, {3, 380}, {4, 200}, {5, 70}],
      lock_loss => [], lockable => 0};
get_comprehend({2, 9, 1}) ->
    #{classes => 2, type => 9, lev => 80, craft => 1,
      loss => [{20655, 3}], min_val => 2, max_val => 5,
      attr_type => [{102, 100}, {105, 100}],
      attr_val => [{2, 350}, {3, 380}, {4, 200}, {5, 70}],
      lock_loss => [], lockable => 0};
get_comprehend({2, 10, 1}) ->
    #{classes => 2, type => 10, lev => 80, craft => 1,
      loss => [{20654, 3}], min_val => 2, max_val => 5,
      attr_type => [{103, 100}, {105, 100}],
      attr_val => [{2, 350}, {3, 380}, {4, 200}, {5, 70}],
      lock_loss => [], lockable => 0};
get_comprehend({2, 11, 1}) ->
    #{classes => 2, type => 11, lev => 80, craft => 1,
      loss => [{20654, 3}], min_val => 2, max_val => 5,
      attr_type => [{105, 100}, {104, 100}],
      attr_val => [{2, 350}, {3, 380}, {4, 200}, {5, 70}],
      lock_loss => [], lockable => 0};
get_comprehend({2, 12, 1}) ->
    #{classes => 2, type => 12, lev => 80, craft => 1,
      loss => [{20654, 3}], min_val => 2, max_val => 5,
      attr_type => [{103, 100}, {102, 100}],
      attr_val => [{2, 350}, {3, 380}, {4, 200}, {5, 70}],
      lock_loss => [], lockable => 0};
get_comprehend({2, 14, 1}) ->
    #{classes => 2, type => 14, lev => 80, craft => 1,
      loss => [{20654, 3}], min_val => 2, max_val => 5,
      attr_type => [{103, 100}, {104, 100}],
      attr_val => [{2, 350}, {3, 380}, {4, 200}, {5, 70}],
      lock_loss => [], lockable => 0};
get_comprehend({2, 2, 2}) ->
    #{classes => 2, type => 2, lev => 85, craft => 2,
      loss => [{20653, 5}], min_val => 3, max_val => 6,
      attr_type => [{103, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [], lockable => 0};
get_comprehend({2, 6, 2}) ->
    #{classes => 2, type => 6, lev => 85, craft => 2,
      loss => [{20655, 5}], min_val => 2, max_val => 5,
      attr_type => [{102, 100}, {104, 100}],
      attr_val => [{2, 350}, {3, 380}, {4, 200}, {5, 70}],
      lock_loss => [], lockable => 0};
get_comprehend({2, 7, 2}) ->
    #{classes => 2, type => 7, lev => 85, craft => 2,
      loss => [{20655, 5}], min_val => 2, max_val => 5,
      attr_type => [{103, 100}, {102, 100}],
      attr_val => [{2, 350}, {3, 380}, {4, 200}, {5, 70}],
      lock_loss => [], lockable => 0};
get_comprehend({2, 9, 2}) ->
    #{classes => 2, type => 9, lev => 85, craft => 2,
      loss => [{20655, 5}], min_val => 2, max_val => 5,
      attr_type => [{102, 100}, {105, 100}],
      attr_val => [{2, 350}, {3, 380}, {4, 200}, {5, 70}],
      lock_loss => [], lockable => 0};
get_comprehend({2, 10, 2}) ->
    #{classes => 2, type => 10, lev => 85, craft => 2,
      loss => [{20654, 5}], min_val => 2, max_val => 5,
      attr_type => [{103, 100}, {105, 100}],
      attr_val => [{2, 350}, {3, 380}, {4, 200}, {5, 70}],
      lock_loss => [], lockable => 0};
get_comprehend({2, 11, 2}) ->
    #{classes => 2, type => 11, lev => 85, craft => 2,
      loss => [{20654, 5}], min_val => 2, max_val => 5,
      attr_type => [{105, 100}, {104, 100}],
      attr_val => [{2, 350}, {3, 380}, {4, 200}, {5, 70}],
      lock_loss => [], lockable => 0};
get_comprehend({2, 12, 2}) ->
    #{classes => 2, type => 12, lev => 85, craft => 2,
      loss => [{20654, 5}], min_val => 2, max_val => 5,
      attr_type => [{103, 100}, {102, 100}],
      attr_val => [{2, 350}, {3, 380}, {4, 200}, {5, 70}],
      lock_loss => [], lockable => 0};
get_comprehend({2, 14, 2}) ->
    #{classes => 2, type => 14, lev => 85, craft => 2,
      loss => [{20654, 5}], min_val => 2, max_val => 5,
      attr_type => [{103, 100}, {104, 100}],
      attr_val => [{2, 350}, {3, 380}, {4, 200}, {5, 70}],
      lock_loss => [], lockable => 0};
get_comprehend({2, 2, 3}) ->
    #{classes => 2, type => 2, lev => 90, craft => 3,
      loss => [{20656, 3}], min_val => 4, max_val => 7,
      attr_type => [{103, 100}, {105, 100}],
      attr_val => [{4, 350}, {5, 380}, {6, 200}, {7, 70}],
      looks => 11202, looks_active_val => 6,
      lock_loss => [{20649, 2}], lockable => 1,
      fashion_id => 11202};
get_comprehend({2, 6, 3}) ->
    #{classes => 2, type => 6, lev => 90, craft => 3,
      loss => [{20658, 3}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 1}], lockable => 1};
get_comprehend({2, 7, 3}) ->
    #{classes => 2, type => 7, lev => 90, craft => 3,
      loss => [{20658, 3}], min_val => 3, max_val => 6,
      attr_type => [{103, 100}, {102, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 1}], lockable => 1};
get_comprehend({2, 9, 3}) ->
    #{classes => 2, type => 9, lev => 90, craft => 3,
      loss => [{20658, 3}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 1}], lockable => 1};
get_comprehend({2, 10, 3}) ->
    #{classes => 2, type => 10, lev => 90, craft => 3,
      loss => [{20657, 3}], min_val => 3, max_val => 6,
      attr_type => [{103, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 1}], lockable => 1};
get_comprehend({2, 11, 3}) ->
    #{classes => 2, type => 11, lev => 90, craft => 3,
      loss => [{20657, 3}], min_val => 3, max_val => 6,
      attr_type => [{105, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 1}], lockable => 1};
get_comprehend({2, 12, 3}) ->
    #{classes => 2, type => 12, lev => 90, craft => 3,
      loss => [{20657, 3}], min_val => 3, max_val => 6,
      attr_type => [{103, 100}, {102, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 1}], lockable => 1};
get_comprehend({2, 14, 3}) ->
    #{classes => 2, type => 14, lev => 90, craft => 3,
      loss => [{20657, 3}], min_val => 3, max_val => 6,
      attr_type => [{103, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 1}], lockable => 1};
get_comprehend({2, 2, 4}) ->
    #{classes => 2, type => 2, lev => 92, craft => 4,
      loss => [{20656, 4}], min_val => 4, max_val => 7,
      attr_type => [{103, 100}, {105, 100}],
      attr_val => [{4, 350}, {5, 380}, {6, 200}, {7, 70}],
      lock_loss => [{20649, 3}], lockable => 1};
get_comprehend({2, 6, 4}) ->
    #{classes => 2, type => 6, lev => 92, craft => 4,
      loss => [{20658, 4}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 2}], lockable => 1};
get_comprehend({2, 7, 4}) ->
    #{classes => 2, type => 7, lev => 92, craft => 4,
      loss => [{20658, 4}], min_val => 3, max_val => 6,
      attr_type => [{103, 100}, {102, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 2}], lockable => 1};
get_comprehend({2, 9, 4}) ->
    #{classes => 2, type => 9, lev => 92, craft => 4,
      loss => [{20658, 4}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 2}], lockable => 1};
get_comprehend({2, 10, 4}) ->
    #{classes => 2, type => 10, lev => 92, craft => 4,
      loss => [{20657, 4}], min_val => 3, max_val => 6,
      attr_type => [{103, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 2}], lockable => 1};
get_comprehend({2, 11, 4}) ->
    #{classes => 2, type => 11, lev => 92, craft => 4,
      loss => [{20657, 4}], min_val => 3, max_val => 6,
      attr_type => [{105, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 2}], lockable => 1};
get_comprehend({2, 12, 4}) ->
    #{classes => 2, type => 12, lev => 92, craft => 4,
      loss => [{20657, 4}], min_val => 3, max_val => 6,
      attr_type => [{103, 100}, {102, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 2}], lockable => 1};
get_comprehend({2, 14, 4}) ->
    #{classes => 2, type => 14, lev => 92, craft => 4,
      loss => [{20657, 4}], min_val => 3, max_val => 6,
      attr_type => [{103, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 2}], lockable => 1};
get_comprehend({2, 2, 5}) ->
    #{classes => 2, type => 2, lev => 94, craft => 5,
      loss => [{20656, 5}], min_val => 4, max_val => 7,
      attr_type => [{103, 100}, {105, 100}],
      attr_val => [{4, 350}, {5, 380}, {6, 200}, {7, 70}],
      looks => 11203, looks_active_val => 6,
      lock_loss => [{20649, 5}], lockable => 1,
      fashion_id => 11203};
get_comprehend({2, 6, 5}) ->
    #{classes => 2, type => 6, lev => 94, craft => 5,
      loss => [{20658, 5}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 3}], lockable => 1};
get_comprehend({2, 7, 5}) ->
    #{classes => 2, type => 7, lev => 94, craft => 5,
      loss => [{20658, 5}], min_val => 3, max_val => 6,
      attr_type => [{103, 100}, {102, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 3}], lockable => 1};
get_comprehend({2, 9, 5}) ->
    #{classes => 2, type => 9, lev => 94, craft => 5,
      loss => [{20658, 5}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 3}], lockable => 1};
get_comprehend({2, 10, 5}) ->
    #{classes => 2, type => 10, lev => 94, craft => 5,
      loss => [{20657, 5}], min_val => 3, max_val => 6,
      attr_type => [{103, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 3}], lockable => 1};
get_comprehend({2, 11, 5}) ->
    #{classes => 2, type => 11, lev => 94, craft => 5,
      loss => [{20657, 5}], min_val => 3, max_val => 6,
      attr_type => [{105, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 3}], lockable => 1};
get_comprehend({2, 12, 5}) ->
    #{classes => 2, type => 12, lev => 94, craft => 5,
      loss => [{20657, 5}], min_val => 3, max_val => 6,
      attr_type => [{103, 100}, {102, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 3}], lockable => 1};
get_comprehend({2, 14, 5}) ->
    #{classes => 2, type => 14, lev => 94, craft => 5,
      loss => [{20657, 5}], min_val => 3, max_val => 6,
      attr_type => [{103, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 3}], lockable => 1};
get_comprehend({2, 2, 6}) ->
    #{classes => 2, type => 2, lev => 96, craft => 6,
      loss => [{20656, 5}], min_val => 4, max_val => 7,
      attr_type => [{103, 100}, {105, 100}],
      attr_val => [{4, 350}, {5, 380}, {6, 200}, {7, 70}],
      lock_loss => [{20649, 6}], lockable => 1};
get_comprehend({2, 6, 6}) ->
    #{classes => 2, type => 6, lev => 96, craft => 6,
      loss => [{20658, 5}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 4}], lockable => 1};
get_comprehend({2, 7, 6}) ->
    #{classes => 2, type => 7, lev => 96, craft => 6,
      loss => [{20658, 5}], min_val => 3, max_val => 6,
      attr_type => [{103, 100}, {102, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 4}], lockable => 1};
get_comprehend({2, 9, 6}) ->
    #{classes => 2, type => 9, lev => 96, craft => 6,
      loss => [{20658, 5}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 4}], lockable => 1};
get_comprehend({2, 10, 6}) ->
    #{classes => 2, type => 10, lev => 96, craft => 6,
      loss => [{20657, 5}], min_val => 3, max_val => 6,
      attr_type => [{103, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 4}], lockable => 1};
get_comprehend({2, 11, 6}) ->
    #{classes => 2, type => 11, lev => 96, craft => 6,
      loss => [{20657, 5}], min_val => 3, max_val => 6,
      attr_type => [{105, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 4}], lockable => 1};
get_comprehend({2, 12, 6}) ->
    #{classes => 2, type => 12, lev => 96, craft => 6,
      loss => [{20657, 5}], min_val => 3, max_val => 6,
      attr_type => [{103, 100}, {102, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 4}], lockable => 1};
get_comprehend({2, 14, 6}) ->
    #{classes => 2, type => 14, lev => 96, craft => 6,
      loss => [{20657, 5}], min_val => 3, max_val => 6,
      attr_type => [{103, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 4}], lockable => 1};
get_comprehend({2, 2, 7}) ->
    #{classes => 2, type => 2, lev => 97, craft => 7,
      loss => [{20656, 6}], min_val => 4, max_val => 7,
      attr_type => [{103, 100}, {105, 100}],
      attr_val => [{4, 350}, {5, 380}, {6, 200}, {7, 70}],
      looks => 11204, looks_active_val => 6,
      lock_loss => [{20649, 8}], lockable => 1,
      fashion_id => 11204};
get_comprehend({2, 6, 7}) ->
    #{classes => 2, type => 6, lev => 97, craft => 7,
      loss => [{20658, 6}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 5}], lockable => 1};
get_comprehend({2, 7, 7}) ->
    #{classes => 2, type => 7, lev => 97, craft => 7,
      loss => [{20658, 6}], min_val => 3, max_val => 6,
      attr_type => [{103, 100}, {102, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 5}], lockable => 1};
get_comprehend({2, 9, 7}) ->
    #{classes => 2, type => 9, lev => 97, craft => 7,
      loss => [{20658, 6}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 5}], lockable => 1};
get_comprehend({2, 10, 7}) ->
    #{classes => 2, type => 10, lev => 97, craft => 7,
      loss => [{20657, 6}], min_val => 3, max_val => 6,
      attr_type => [{103, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 5}], lockable => 1};
get_comprehend({2, 11, 7}) ->
    #{classes => 2, type => 11, lev => 97, craft => 7,
      loss => [{20657, 6}], min_val => 3, max_val => 6,
      attr_type => [{105, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 5}], lockable => 1};
get_comprehend({2, 12, 7}) ->
    #{classes => 2, type => 12, lev => 97, craft => 7,
      loss => [{20657, 6}], min_val => 3, max_val => 6,
      attr_type => [{103, 100}, {102, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 5}], lockable => 1};
get_comprehend({2, 14, 7}) ->
    #{classes => 2, type => 14, lev => 97, craft => 7,
      loss => [{20657, 6}], min_val => 3, max_val => 6,
      attr_type => [{103, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 5}], lockable => 1};
get_comprehend({2, 2, 8}) ->
    #{classes => 2, type => 2, lev => 98, craft => 8,
      loss => [{20656, 8}], min_val => 4, max_val => 7,
      attr_type => [{103, 100}, {105, 100}],
      attr_val => [{4, 350}, {5, 380}, {6, 200}, {7, 70}],
      lock_loss => [{20649, 10}], lockable => 1};
get_comprehend({2, 6, 8}) ->
    #{classes => 2, type => 6, lev => 98, craft => 8,
      loss => [{20658, 8}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 6}], lockable => 1};
get_comprehend({2, 7, 8}) ->
    #{classes => 2, type => 7, lev => 98, craft => 8,
      loss => [{20658, 8}], min_val => 3, max_val => 6,
      attr_type => [{103, 100}, {102, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 6}], lockable => 1};
get_comprehend({2, 9, 8}) ->
    #{classes => 2, type => 9, lev => 98, craft => 8,
      loss => [{20658, 8}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 6}], lockable => 1};
get_comprehend({2, 10, 8}) ->
    #{classes => 2, type => 10, lev => 98, craft => 8,
      loss => [{20657, 8}], min_val => 3, max_val => 6,
      attr_type => [{103, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 6}], lockable => 1};
get_comprehend({2, 11, 8}) ->
    #{classes => 2, type => 11, lev => 98, craft => 8,
      loss => [{20657, 8}], min_val => 3, max_val => 6,
      attr_type => [{105, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 6}], lockable => 1};
get_comprehend({2, 12, 8}) ->
    #{classes => 2, type => 12, lev => 98, craft => 8,
      loss => [{20657, 8}], min_val => 3, max_val => 6,
      attr_type => [{103, 100}, {102, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 6}], lockable => 1};
get_comprehend({2, 14, 8}) ->
    #{classes => 2, type => 14, lev => 98, craft => 8,
      loss => [{20657, 8}], min_val => 3, max_val => 6,
      attr_type => [{103, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 6}], lockable => 1};
get_comprehend({2, 2, 9}) ->
    #{classes => 2, type => 2, lev => 100, craft => 9,
      loss => [{20659, 3}], min_val => 4, max_val => 7,
      attr_type => [{103, 100}, {105, 100}],
      attr_val => [{4, 350}, {5, 380}, {6, 200}, {7, 70}],
      lock_loss => [{20649, 12}], lockable => 1};
get_comprehend({2, 6, 9}) ->
    #{classes => 2, type => 6, lev => 100, craft => 9,
      loss => [{20661, 3}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 7}], lockable => 1};
get_comprehend({2, 7, 9}) ->
    #{classes => 2, type => 7, lev => 100, craft => 9,
      loss => [{20661, 3}], min_val => 3, max_val => 6,
      attr_type => [{103, 100}, {102, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 7}], lockable => 1};
get_comprehend({2, 9, 9}) ->
    #{classes => 2, type => 9, lev => 100, craft => 9,
      loss => [{20661, 3}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 7}], lockable => 1};
get_comprehend({2, 10, 9}) ->
    #{classes => 2, type => 10, lev => 100, craft => 9,
      loss => [{20660, 3}], min_val => 3, max_val => 6,
      attr_type => [{103, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 7}], lockable => 1};
get_comprehend({2, 11, 9}) ->
    #{classes => 2, type => 11, lev => 100, craft => 9,
      loss => [{20660, 3}], min_val => 3, max_val => 6,
      attr_type => [{105, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 7}], lockable => 1};
get_comprehend({2, 12, 9}) ->
    #{classes => 2, type => 12, lev => 100, craft => 9,
      loss => [{20660, 3}], min_val => 3, max_val => 6,
      attr_type => [{103, 100}, {102, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 7}], lockable => 1};
get_comprehend({2, 14, 9}) ->
    #{classes => 2, type => 14, lev => 100, craft => 9,
      loss => [{20660, 3}], min_val => 3, max_val => 6,
      attr_type => [{103, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 7}], lockable => 1};
get_comprehend({2, 2, 10}) ->
    #{classes => 2, type => 2, lev => 102, craft => 10,
      loss => [{20659, 5}], min_val => 4, max_val => 7,
      attr_type => [{103, 100}, {105, 100}],
      attr_val => [{4, 350}, {5, 380}, {6, 200}, {7, 70}],
      lock_loss => [{20649, 15}], lockable => 1};
get_comprehend({2, 6, 10}) ->
    #{classes => 2, type => 6, lev => 102, craft => 10,
      loss => [{20661, 5}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 9}], lockable => 1};
get_comprehend({2, 7, 10}) ->
    #{classes => 2, type => 7, lev => 102, craft => 10,
      loss => [{20661, 5}], min_val => 3, max_val => 6,
      attr_type => [{103, 100}, {102, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 9}], lockable => 1};
get_comprehend({2, 9, 10}) ->
    #{classes => 2, type => 9, lev => 102, craft => 10,
      loss => [{20661, 5}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 9}], lockable => 1};
get_comprehend({2, 10, 10}) ->
    #{classes => 2, type => 10, lev => 102, craft => 10,
      loss => [{20660, 5}], min_val => 3, max_val => 6,
      attr_type => [{103, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 9}], lockable => 1};
get_comprehend({2, 11, 10}) ->
    #{classes => 2, type => 11, lev => 102, craft => 10,
      loss => [{20660, 5}], min_val => 3, max_val => 6,
      attr_type => [{105, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 9}], lockable => 1};
get_comprehend({2, 12, 10}) ->
    #{classes => 2, type => 12, lev => 102, craft => 10,
      loss => [{20660, 5}], min_val => 3, max_val => 6,
      attr_type => [{103, 100}, {102, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 9}], lockable => 1};
get_comprehend({2, 14, 10}) ->
    #{classes => 2, type => 14, lev => 102, craft => 10,
      loss => [{20660, 5}], min_val => 3, max_val => 6,
      attr_type => [{103, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 9}], lockable => 1};
get_comprehend({2, 2, 11}) ->
    #{classes => 2, type => 2, lev => 105, craft => 11,
      loss => [{20659, 6}], min_val => 2, max_val => 5,
      attr_type => [{103, 100}, {105, 100}],
      attr_val => [{2, 350}, {3, 380}, {4, 200}, {5, 70}],
      lock_loss => [{20649, 18}], lockable => 1};
get_comprehend({2, 6, 11}) ->
    #{classes => 2, type => 6, lev => 105, craft => 11,
      loss => [{20661, 6}], min_val => 1, max_val => 4,
      attr_type => [{102, 100}, {104, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 12}], lockable => 1};
get_comprehend({2, 7, 11}) ->
    #{classes => 2, type => 7, lev => 105, craft => 11,
      loss => [{20661, 6}], min_val => 1, max_val => 4,
      attr_type => [{103, 100}, {102, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 12}], lockable => 1};
get_comprehend({2, 9, 11}) ->
    #{classes => 2, type => 9, lev => 105, craft => 11,
      loss => [{20661, 6}], min_val => 1, max_val => 4,
      attr_type => [{102, 100}, {105, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 12}], lockable => 1};
get_comprehend({2, 10, 11}) ->
    #{classes => 2, type => 10, lev => 105, craft => 11,
      loss => [{20660, 6}], min_val => 1, max_val => 4,
      attr_type => [{103, 100}, {105, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 12}], lockable => 1};
get_comprehend({2, 11, 11}) ->
    #{classes => 2, type => 11, lev => 105, craft => 11,
      loss => [{20660, 6}], min_val => 1, max_val => 4,
      attr_type => [{105, 100}, {104, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 12}], lockable => 1};
get_comprehend({2, 12, 11}) ->
    #{classes => 2, type => 12, lev => 105, craft => 11,
      loss => [{20660, 6}], min_val => 1, max_val => 4,
      attr_type => [{103, 100}, {102, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 12}], lockable => 1};
get_comprehend({2, 14, 11}) ->
    #{classes => 2, type => 14, lev => 105, craft => 11,
      loss => [{20660, 6}], min_val => 1, max_val => 4,
      attr_type => [{103, 100}, {104, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 12}], lockable => 1};
get_comprehend({2, 2, 12}) ->
    #{classes => 2, type => 2, lev => 108, craft => 12,
      loss => [{20659, 8}], min_val => 2, max_val => 5,
      attr_type => [{103, 100}, {105, 100}],
      attr_val => [{2, 350}, {3, 380}, {4, 200}, {5, 70}],
      lock_loss => [{20649, 20}], lockable => 1};
get_comprehend({2, 6, 12}) ->
    #{classes => 2, type => 6, lev => 108, craft => 12,
      loss => [{20661, 8}], min_val => 1, max_val => 4,
      attr_type => [{102, 100}, {104, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 15}], lockable => 1};
get_comprehend({2, 7, 12}) ->
    #{classes => 2, type => 7, lev => 108, craft => 12,
      loss => [{20661, 8}], min_val => 1, max_val => 4,
      attr_type => [{103, 100}, {102, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 15}], lockable => 1};
get_comprehend({2, 9, 12}) ->
    #{classes => 2, type => 9, lev => 108, craft => 12,
      loss => [{20661, 8}], min_val => 1, max_val => 4,
      attr_type => [{102, 100}, {105, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 15}], lockable => 1};
get_comprehend({2, 10, 12}) ->
    #{classes => 2, type => 10, lev => 108, craft => 12,
      loss => [{20660, 8}], min_val => 1, max_val => 4,
      attr_type => [{103, 100}, {105, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 15}], lockable => 1};
get_comprehend({2, 11, 12}) ->
    #{classes => 2, type => 11, lev => 108, craft => 12,
      loss => [{20660, 8}], min_val => 1, max_val => 4,
      attr_type => [{105, 100}, {104, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 15}], lockable => 1};
get_comprehend({2, 12, 12}) ->
    #{classes => 2, type => 12, lev => 108, craft => 12,
      loss => [{20660, 8}], min_val => 1, max_val => 4,
      attr_type => [{103, 100}, {102, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 15}], lockable => 1};
get_comprehend({2, 14, 12}) ->
    #{classes => 2, type => 14, lev => 108, craft => 12,
      loss => [{20660, 8}], min_val => 1, max_val => 4,
      attr_type => [{103, 100}, {104, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 15}], lockable => 1};
get_comprehend({2, 2, 13}) ->
    #{classes => 2, type => 2, lev => 110, craft => 13,
      loss => [{20662, 3}], min_val => 2, max_val => 5,
      attr_type => [{103, 100}, {105, 100}],
      attr_val => [{2, 350}, {3, 380}, {4, 200}, {5, 70}],
      lock_loss => [{20649, 25}], lockable => 1};
get_comprehend({2, 6, 13}) ->
    #{classes => 2, type => 6, lev => 110, craft => 13,
      loss => [{20664, 3}], min_val => 1, max_val => 4,
      attr_type => [{102, 100}, {104, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 20}], lockable => 1};
get_comprehend({2, 7, 13}) ->
    #{classes => 2, type => 7, lev => 110, craft => 13,
      loss => [{20664, 3}], min_val => 1, max_val => 4,
      attr_type => [{103, 100}, {102, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 20}], lockable => 1};
get_comprehend({2, 9, 13}) ->
    #{classes => 2, type => 9, lev => 110, craft => 13,
      loss => [{20664, 3}], min_val => 1, max_val => 4,
      attr_type => [{102, 100}, {105, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 20}], lockable => 1};
get_comprehend({2, 10, 13}) ->
    #{classes => 2, type => 10, lev => 110, craft => 13,
      loss => [{20663, 3}], min_val => 1, max_val => 4,
      attr_type => [{103, 100}, {105, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 20}], lockable => 1};
get_comprehend({2, 11, 13}) ->
    #{classes => 2, type => 11, lev => 110, craft => 13,
      loss => [{20663, 3}], min_val => 1, max_val => 4,
      attr_type => [{105, 100}, {104, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 20}], lockable => 1};
get_comprehend({2, 12, 13}) ->
    #{classes => 2, type => 12, lev => 110, craft => 13,
      loss => [{20663, 3}], min_val => 1, max_val => 4,
      attr_type => [{103, 100}, {102, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 20}], lockable => 1};
get_comprehend({2, 14, 13}) ->
    #{classes => 2, type => 14, lev => 110, craft => 13,
      loss => [{20663, 3}], min_val => 1, max_val => 4,
      attr_type => [{103, 100}, {104, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 20}], lockable => 1};
get_comprehend({3, 3, 1}) ->
    #{classes => 3, type => 3, lev => 80, craft => 1,
      loss => [{20653, 3}], min_val => 3, max_val => 6,
      attr_type => [{101, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      looks => 11301, looks_active_val => 5, lock_loss => [],
      lockable => 0, fashion_id => 11301};
get_comprehend({3, 6, 1}) ->
    #{classes => 3, type => 6, lev => 80, craft => 1,
      loss => [{20655, 3}], min_val => 2, max_val => 5,
      attr_type => [{101, 100}, {104, 100}],
      attr_val => [{2, 350}, {3, 380}, {4, 200}, {5, 70}],
      lock_loss => [], lockable => 0};
get_comprehend({3, 7, 1}) ->
    #{classes => 3, type => 7, lev => 80, craft => 1,
      loss => [{20655, 3}], min_val => 2, max_val => 5,
      attr_type => [{101, 100}, {102, 100}],
      attr_val => [{2, 350}, {3, 380}, {4, 200}, {5, 70}],
      lock_loss => [], lockable => 0};
get_comprehend({3, 9, 1}) ->
    #{classes => 3, type => 9, lev => 80, craft => 1,
      loss => [{20655, 3}], min_val => 2, max_val => 5,
      attr_type => [{101, 100}, {102, 100}],
      attr_val => [{2, 350}, {3, 380}, {4, 200}, {5, 70}],
      lock_loss => [], lockable => 0};
get_comprehend({3, 10, 1}) ->
    #{classes => 3, type => 10, lev => 80, craft => 1,
      loss => [{20654, 3}], min_val => 2, max_val => 5,
      attr_type => [{102, 100}, {105, 100}],
      attr_val => [{2, 350}, {3, 380}, {4, 200}, {5, 70}],
      lock_loss => [], lockable => 0};
get_comprehend({3, 11, 1}) ->
    #{classes => 3, type => 11, lev => 80, craft => 1,
      loss => [{20654, 3}], min_val => 2, max_val => 5,
      attr_type => [{101, 100}, {105, 100}],
      attr_val => [{2, 350}, {3, 380}, {4, 200}, {5, 70}],
      lock_loss => [], lockable => 0};
get_comprehend({3, 12, 1}) ->
    #{classes => 3, type => 12, lev => 80, craft => 1,
      loss => [{20654, 3}], min_val => 2, max_val => 5,
      attr_type => [{102, 100}, {104, 100}],
      attr_val => [{2, 350}, {3, 380}, {4, 200}, {5, 70}],
      lock_loss => [], lockable => 0};
get_comprehend({3, 14, 1}) ->
    #{classes => 3, type => 14, lev => 80, craft => 1,
      loss => [{20654, 3}], min_val => 2, max_val => 5,
      attr_type => [{104, 100}, {105, 100}],
      attr_val => [{2, 350}, {3, 380}, {4, 200}, {5, 70}],
      lock_loss => [], lockable => 0};
get_comprehend({3, 3, 2}) ->
    #{classes => 3, type => 3, lev => 85, craft => 2,
      loss => [{20653, 5}], min_val => 3, max_val => 6,
      attr_type => [{101, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [], lockable => 0};
get_comprehend({3, 6, 2}) ->
    #{classes => 3, type => 6, lev => 85, craft => 2,
      loss => [{20655, 5}], min_val => 2, max_val => 5,
      attr_type => [{101, 100}, {104, 100}],
      attr_val => [{2, 350}, {3, 380}, {4, 200}, {5, 70}],
      lock_loss => [], lockable => 0};
get_comprehend({3, 7, 2}) ->
    #{classes => 3, type => 7, lev => 85, craft => 2,
      loss => [{20655, 5}], min_val => 2, max_val => 5,
      attr_type => [{101, 100}, {102, 100}],
      attr_val => [{2, 350}, {3, 380}, {4, 200}, {5, 70}],
      lock_loss => [], lockable => 0};
get_comprehend({3, 9, 2}) ->
    #{classes => 3, type => 9, lev => 85, craft => 2,
      loss => [{20655, 5}], min_val => 2, max_val => 5,
      attr_type => [{101, 100}, {102, 100}],
      attr_val => [{2, 350}, {3, 380}, {4, 200}, {5, 70}],
      lock_loss => [], lockable => 0};
get_comprehend({3, 10, 2}) ->
    #{classes => 3, type => 10, lev => 85, craft => 2,
      loss => [{20654, 5}], min_val => 2, max_val => 5,
      attr_type => [{102, 100}, {105, 100}],
      attr_val => [{2, 350}, {3, 380}, {4, 200}, {5, 70}],
      lock_loss => [], lockable => 0};
get_comprehend({3, 11, 2}) ->
    #{classes => 3, type => 11, lev => 85, craft => 2,
      loss => [{20654, 5}], min_val => 2, max_val => 5,
      attr_type => [{101, 100}, {105, 100}],
      attr_val => [{2, 350}, {3, 380}, {4, 200}, {5, 70}],
      lock_loss => [], lockable => 0};
get_comprehend({3, 12, 2}) ->
    #{classes => 3, type => 12, lev => 85, craft => 2,
      loss => [{20654, 5}], min_val => 2, max_val => 5,
      attr_type => [{102, 100}, {104, 100}],
      attr_val => [{2, 350}, {3, 380}, {4, 200}, {5, 70}],
      lock_loss => [], lockable => 0};
get_comprehend({3, 14, 2}) ->
    #{classes => 3, type => 14, lev => 85, craft => 2,
      loss => [{20654, 5}], min_val => 2, max_val => 5,
      attr_type => [{104, 100}, {105, 100}],
      attr_val => [{2, 350}, {3, 380}, {4, 200}, {5, 70}],
      lock_loss => [], lockable => 0};
get_comprehend({3, 3, 3}) ->
    #{classes => 3, type => 3, lev => 90, craft => 3,
      loss => [{20656, 3}], min_val => 4, max_val => 7,
      attr_type => [{101, 100}, {104, 100}],
      attr_val => [{4, 350}, {5, 380}, {6, 200}, {7, 70}],
      looks => 11302, looks_active_val => 6,
      lock_loss => [{20649, 2}], lockable => 1,
      fashion_id => 11302};
get_comprehend({3, 6, 3}) ->
    #{classes => 3, type => 6, lev => 90, craft => 3,
      loss => [{20658, 3}], min_val => 3, max_val => 6,
      attr_type => [{101, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 1}], lockable => 1};
get_comprehend({3, 7, 3}) ->
    #{classes => 3, type => 7, lev => 90, craft => 3,
      loss => [{20658, 3}], min_val => 3, max_val => 6,
      attr_type => [{101, 100}, {102, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 1}], lockable => 1};
get_comprehend({3, 9, 3}) ->
    #{classes => 3, type => 9, lev => 90, craft => 3,
      loss => [{20658, 3}], min_val => 3, max_val => 6,
      attr_type => [{101, 100}, {102, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 1}], lockable => 1};
get_comprehend({3, 10, 3}) ->
    #{classes => 3, type => 10, lev => 90, craft => 3,
      loss => [{20657, 3}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 1}], lockable => 1};
get_comprehend({3, 11, 3}) ->
    #{classes => 3, type => 11, lev => 90, craft => 3,
      loss => [{20657, 3}], min_val => 3, max_val => 6,
      attr_type => [{101, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 1}], lockable => 1};
get_comprehend({3, 12, 3}) ->
    #{classes => 3, type => 12, lev => 90, craft => 3,
      loss => [{20657, 3}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 1}], lockable => 1};
get_comprehend({3, 14, 3}) ->
    #{classes => 3, type => 14, lev => 90, craft => 3,
      loss => [{20657, 3}], min_val => 3, max_val => 6,
      attr_type => [{104, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 1}], lockable => 1};
get_comprehend({3, 3, 4}) ->
    #{classes => 3, type => 3, lev => 92, craft => 4,
      loss => [{20656, 4}], min_val => 4, max_val => 7,
      attr_type => [{101, 100}, {104, 100}],
      attr_val => [{4, 350}, {5, 380}, {6, 200}, {7, 70}],
      lock_loss => [{20649, 3}], lockable => 1};
get_comprehend({3, 6, 4}) ->
    #{classes => 3, type => 6, lev => 92, craft => 4,
      loss => [{20658, 4}], min_val => 3, max_val => 6,
      attr_type => [{101, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 2}], lockable => 1};
get_comprehend({3, 7, 4}) ->
    #{classes => 3, type => 7, lev => 92, craft => 4,
      loss => [{20658, 4}], min_val => 3, max_val => 6,
      attr_type => [{101, 100}, {102, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 2}], lockable => 1};
get_comprehend({3, 9, 4}) ->
    #{classes => 3, type => 9, lev => 92, craft => 4,
      loss => [{20658, 4}], min_val => 3, max_val => 6,
      attr_type => [{101, 100}, {102, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 2}], lockable => 1};
get_comprehend({3, 10, 4}) ->
    #{classes => 3, type => 10, lev => 92, craft => 4,
      loss => [{20657, 4}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 2}], lockable => 1};
get_comprehend({3, 11, 4}) ->
    #{classes => 3, type => 11, lev => 92, craft => 4,
      loss => [{20657, 4}], min_val => 3, max_val => 6,
      attr_type => [{101, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 2}], lockable => 1};
get_comprehend({3, 12, 4}) ->
    #{classes => 3, type => 12, lev => 92, craft => 4,
      loss => [{20657, 4}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 2}], lockable => 1};
get_comprehend({3, 14, 4}) ->
    #{classes => 3, type => 14, lev => 92, craft => 4,
      loss => [{20657, 4}], min_val => 3, max_val => 6,
      attr_type => [{104, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 2}], lockable => 1};
get_comprehend({3, 3, 5}) ->
    #{classes => 3, type => 3, lev => 94, craft => 5,
      loss => [{20656, 5}], min_val => 4, max_val => 7,
      attr_type => [{101, 100}, {104, 100}],
      attr_val => [{4, 350}, {5, 380}, {6, 200}, {7, 70}],
      looks => 11303, looks_active_val => 6,
      lock_loss => [{20649, 5}], lockable => 1,
      fashion_id => 11303};
get_comprehend({3, 6, 5}) ->
    #{classes => 3, type => 6, lev => 94, craft => 5,
      loss => [{20658, 5}], min_val => 3, max_val => 6,
      attr_type => [{101, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 3}], lockable => 1};
get_comprehend({3, 7, 5}) ->
    #{classes => 3, type => 7, lev => 94, craft => 5,
      loss => [{20658, 5}], min_val => 3, max_val => 6,
      attr_type => [{101, 100}, {102, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 3}], lockable => 1};
get_comprehend({3, 9, 5}) ->
    #{classes => 3, type => 9, lev => 94, craft => 5,
      loss => [{20658, 5}], min_val => 3, max_val => 6,
      attr_type => [{101, 100}, {102, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 3}], lockable => 1};
get_comprehend({3, 10, 5}) ->
    #{classes => 3, type => 10, lev => 94, craft => 5,
      loss => [{20657, 5}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 3}], lockable => 1};
get_comprehend({3, 11, 5}) ->
    #{classes => 3, type => 11, lev => 94, craft => 5,
      loss => [{20657, 5}], min_val => 3, max_val => 6,
      attr_type => [{101, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 3}], lockable => 1};
get_comprehend({3, 12, 5}) ->
    #{classes => 3, type => 12, lev => 94, craft => 5,
      loss => [{20657, 5}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 3}], lockable => 1};
get_comprehend({3, 14, 5}) ->
    #{classes => 3, type => 14, lev => 94, craft => 5,
      loss => [{20657, 5}], min_val => 3, max_val => 6,
      attr_type => [{104, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 3}], lockable => 1};
get_comprehend({3, 3, 6}) ->
    #{classes => 3, type => 3, lev => 96, craft => 6,
      loss => [{20656, 5}], min_val => 4, max_val => 7,
      attr_type => [{101, 100}, {104, 100}],
      attr_val => [{4, 350}, {5, 380}, {6, 200}, {7, 70}],
      lock_loss => [{20649, 6}], lockable => 1};
get_comprehend({3, 6, 6}) ->
    #{classes => 3, type => 6, lev => 96, craft => 6,
      loss => [{20658, 5}], min_val => 3, max_val => 6,
      attr_type => [{101, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 4}], lockable => 1};
get_comprehend({3, 7, 6}) ->
    #{classes => 3, type => 7, lev => 96, craft => 6,
      loss => [{20658, 5}], min_val => 3, max_val => 6,
      attr_type => [{101, 100}, {102, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 4}], lockable => 1};
get_comprehend({3, 9, 6}) ->
    #{classes => 3, type => 9, lev => 96, craft => 6,
      loss => [{20658, 5}], min_val => 3, max_val => 6,
      attr_type => [{101, 100}, {102, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 4}], lockable => 1};
get_comprehend({3, 10, 6}) ->
    #{classes => 3, type => 10, lev => 96, craft => 6,
      loss => [{20657, 5}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 4}], lockable => 1};
get_comprehend({3, 11, 6}) ->
    #{classes => 3, type => 11, lev => 96, craft => 6,
      loss => [{20657, 5}], min_val => 3, max_val => 6,
      attr_type => [{101, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 4}], lockable => 1};
get_comprehend({3, 12, 6}) ->
    #{classes => 3, type => 12, lev => 96, craft => 6,
      loss => [{20657, 5}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 4}], lockable => 1};
get_comprehend({3, 14, 6}) ->
    #{classes => 3, type => 14, lev => 96, craft => 6,
      loss => [{20657, 5}], min_val => 3, max_val => 6,
      attr_type => [{104, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 4}], lockable => 1};
get_comprehend({3, 3, 7}) ->
    #{classes => 3, type => 3, lev => 97, craft => 7,
      loss => [{20656, 6}], min_val => 4, max_val => 7,
      attr_type => [{101, 100}, {104, 100}],
      attr_val => [{4, 350}, {5, 380}, {6, 200}, {7, 70}],
      looks => 11304, looks_active_val => 6,
      lock_loss => [{20649, 8}], lockable => 1,
      fashion_id => 11304};
get_comprehend({3, 6, 7}) ->
    #{classes => 3, type => 6, lev => 97, craft => 7,
      loss => [{20658, 6}], min_val => 3, max_val => 6,
      attr_type => [{101, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 5}], lockable => 1};
get_comprehend({3, 7, 7}) ->
    #{classes => 3, type => 7, lev => 97, craft => 7,
      loss => [{20658, 6}], min_val => 3, max_val => 6,
      attr_type => [{101, 100}, {102, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 5}], lockable => 1};
get_comprehend({3, 9, 7}) ->
    #{classes => 3, type => 9, lev => 97, craft => 7,
      loss => [{20658, 6}], min_val => 3, max_val => 6,
      attr_type => [{101, 100}, {102, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 5}], lockable => 1};
get_comprehend({3, 10, 7}) ->
    #{classes => 3, type => 10, lev => 97, craft => 7,
      loss => [{20657, 6}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 5}], lockable => 1};
get_comprehend({3, 11, 7}) ->
    #{classes => 3, type => 11, lev => 97, craft => 7,
      loss => [{20657, 6}], min_val => 3, max_val => 6,
      attr_type => [{101, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 5}], lockable => 1};
get_comprehend({3, 12, 7}) ->
    #{classes => 3, type => 12, lev => 97, craft => 7,
      loss => [{20657, 6}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 5}], lockable => 1};
get_comprehend({3, 14, 7}) ->
    #{classes => 3, type => 14, lev => 97, craft => 7,
      loss => [{20657, 6}], min_val => 3, max_val => 6,
      attr_type => [{104, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 5}], lockable => 1};
get_comprehend({3, 3, 8}) ->
    #{classes => 3, type => 3, lev => 98, craft => 8,
      loss => [{20656, 8}], min_val => 4, max_val => 7,
      attr_type => [{101, 100}, {104, 100}],
      attr_val => [{4, 350}, {5, 380}, {6, 200}, {7, 70}],
      lock_loss => [{20649, 10}], lockable => 1};
get_comprehend({3, 6, 8}) ->
    #{classes => 3, type => 6, lev => 98, craft => 8,
      loss => [{20658, 8}], min_val => 3, max_val => 6,
      attr_type => [{101, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 6}], lockable => 1};
get_comprehend({3, 7, 8}) ->
    #{classes => 3, type => 7, lev => 98, craft => 8,
      loss => [{20658, 8}], min_val => 3, max_val => 6,
      attr_type => [{101, 100}, {102, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 6}], lockable => 1};
get_comprehend({3, 9, 8}) ->
    #{classes => 3, type => 9, lev => 98, craft => 8,
      loss => [{20658, 8}], min_val => 3, max_val => 6,
      attr_type => [{101, 100}, {102, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 6}], lockable => 1};
get_comprehend({3, 10, 8}) ->
    #{classes => 3, type => 10, lev => 98, craft => 8,
      loss => [{20657, 8}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 6}], lockable => 1};
get_comprehend({3, 11, 8}) ->
    #{classes => 3, type => 11, lev => 98, craft => 8,
      loss => [{20657, 8}], min_val => 3, max_val => 6,
      attr_type => [{101, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 6}], lockable => 1};
get_comprehend({3, 12, 8}) ->
    #{classes => 3, type => 12, lev => 98, craft => 8,
      loss => [{20657, 8}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 6}], lockable => 1};
get_comprehend({3, 14, 8}) ->
    #{classes => 3, type => 14, lev => 98, craft => 8,
      loss => [{20657, 8}], min_val => 3, max_val => 6,
      attr_type => [{104, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 6}], lockable => 1};
get_comprehend({3, 3, 9}) ->
    #{classes => 3, type => 3, lev => 100, craft => 9,
      loss => [{20659, 3}], min_val => 4, max_val => 7,
      attr_type => [{101, 100}, {104, 100}],
      attr_val => [{4, 350}, {5, 380}, {6, 200}, {7, 70}],
      lock_loss => [{20649, 12}], lockable => 1};
get_comprehend({3, 6, 9}) ->
    #{classes => 3, type => 6, lev => 100, craft => 9,
      loss => [{20661, 3}], min_val => 3, max_val => 6,
      attr_type => [{101, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 7}], lockable => 1};
get_comprehend({3, 7, 9}) ->
    #{classes => 3, type => 7, lev => 100, craft => 9,
      loss => [{20661, 3}], min_val => 3, max_val => 6,
      attr_type => [{101, 100}, {102, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 7}], lockable => 1};
get_comprehend({3, 9, 9}) ->
    #{classes => 3, type => 9, lev => 100, craft => 9,
      loss => [{20661, 3}], min_val => 3, max_val => 6,
      attr_type => [{101, 100}, {102, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 7}], lockable => 1};
get_comprehend({3, 10, 9}) ->
    #{classes => 3, type => 10, lev => 100, craft => 9,
      loss => [{20660, 3}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 7}], lockable => 1};
get_comprehend({3, 11, 9}) ->
    #{classes => 3, type => 11, lev => 100, craft => 9,
      loss => [{20660, 3}], min_val => 3, max_val => 6,
      attr_type => [{101, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 7}], lockable => 1};
get_comprehend({3, 12, 9}) ->
    #{classes => 3, type => 12, lev => 100, craft => 9,
      loss => [{20660, 3}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 7}], lockable => 1};
get_comprehend({3, 14, 9}) ->
    #{classes => 3, type => 14, lev => 100, craft => 9,
      loss => [{20660, 3}], min_val => 3, max_val => 6,
      attr_type => [{104, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 7}], lockable => 1};
get_comprehend({3, 3, 10}) ->
    #{classes => 3, type => 3, lev => 102, craft => 10,
      loss => [{20659, 5}], min_val => 4, max_val => 7,
      attr_type => [{101, 100}, {104, 100}],
      attr_val => [{4, 350}, {5, 380}, {6, 200}, {7, 70}],
      lock_loss => [{20649, 15}], lockable => 1};
get_comprehend({3, 6, 10}) ->
    #{classes => 3, type => 6, lev => 102, craft => 10,
      loss => [{20661, 5}], min_val => 3, max_val => 6,
      attr_type => [{101, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 9}], lockable => 1};
get_comprehend({3, 7, 10}) ->
    #{classes => 3, type => 7, lev => 102, craft => 10,
      loss => [{20661, 5}], min_val => 3, max_val => 6,
      attr_type => [{101, 100}, {102, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 9}], lockable => 1};
get_comprehend({3, 9, 10}) ->
    #{classes => 3, type => 9, lev => 102, craft => 10,
      loss => [{20661, 5}], min_val => 3, max_val => 6,
      attr_type => [{101, 100}, {102, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 9}], lockable => 1};
get_comprehend({3, 10, 10}) ->
    #{classes => 3, type => 10, lev => 102, craft => 10,
      loss => [{20660, 5}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 9}], lockable => 1};
get_comprehend({3, 11, 10}) ->
    #{classes => 3, type => 11, lev => 102, craft => 10,
      loss => [{20660, 5}], min_val => 3, max_val => 6,
      attr_type => [{101, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 9}], lockable => 1};
get_comprehend({3, 12, 10}) ->
    #{classes => 3, type => 12, lev => 102, craft => 10,
      loss => [{20660, 5}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 9}], lockable => 1};
get_comprehend({3, 14, 10}) ->
    #{classes => 3, type => 14, lev => 102, craft => 10,
      loss => [{20660, 5}], min_val => 3, max_val => 6,
      attr_type => [{104, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 9}], lockable => 1};
get_comprehend({3, 3, 11}) ->
    #{classes => 3, type => 3, lev => 105, craft => 11,
      loss => [{20659, 6}], min_val => 2, max_val => 5,
      attr_type => [{101, 100}, {104, 100}],
      attr_val => [{2, 350}, {3, 380}, {4, 200}, {5, 70}],
      lock_loss => [{20649, 18}], lockable => 1};
get_comprehend({3, 6, 11}) ->
    #{classes => 3, type => 6, lev => 105, craft => 11,
      loss => [{20661, 6}], min_val => 1, max_val => 4,
      attr_type => [{101, 100}, {104, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 12}], lockable => 1};
get_comprehend({3, 7, 11}) ->
    #{classes => 3, type => 7, lev => 105, craft => 11,
      loss => [{20661, 6}], min_val => 1, max_val => 4,
      attr_type => [{101, 100}, {102, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 12}], lockable => 1};
get_comprehend({3, 9, 11}) ->
    #{classes => 3, type => 9, lev => 105, craft => 11,
      loss => [{20661, 6}], min_val => 1, max_val => 4,
      attr_type => [{101, 100}, {102, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 12}], lockable => 1};
get_comprehend({3, 10, 11}) ->
    #{classes => 3, type => 10, lev => 105, craft => 11,
      loss => [{20660, 6}], min_val => 1, max_val => 4,
      attr_type => [{102, 100}, {105, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 12}], lockable => 1};
get_comprehend({3, 11, 11}) ->
    #{classes => 3, type => 11, lev => 105, craft => 11,
      loss => [{20660, 6}], min_val => 1, max_val => 4,
      attr_type => [{101, 100}, {105, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 12}], lockable => 1};
get_comprehend({3, 12, 11}) ->
    #{classes => 3, type => 12, lev => 105, craft => 11,
      loss => [{20660, 6}], min_val => 1, max_val => 4,
      attr_type => [{102, 100}, {104, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 12}], lockable => 1};
get_comprehend({3, 14, 11}) ->
    #{classes => 3, type => 14, lev => 105, craft => 11,
      loss => [{20660, 6}], min_val => 1, max_val => 4,
      attr_type => [{104, 100}, {105, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 12}], lockable => 1};
get_comprehend({3, 3, 12}) ->
    #{classes => 3, type => 3, lev => 108, craft => 12,
      loss => [{20659, 8}], min_val => 2, max_val => 5,
      attr_type => [{101, 100}, {104, 100}],
      attr_val => [{2, 350}, {3, 380}, {4, 200}, {5, 70}],
      lock_loss => [{20649, 20}], lockable => 1};
get_comprehend({3, 6, 12}) ->
    #{classes => 3, type => 6, lev => 108, craft => 12,
      loss => [{20661, 8}], min_val => 1, max_val => 4,
      attr_type => [{101, 100}, {104, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 15}], lockable => 1};
get_comprehend({3, 7, 12}) ->
    #{classes => 3, type => 7, lev => 108, craft => 12,
      loss => [{20661, 8}], min_val => 1, max_val => 4,
      attr_type => [{101, 100}, {102, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 15}], lockable => 1};
get_comprehend({3, 9, 12}) ->
    #{classes => 3, type => 9, lev => 108, craft => 12,
      loss => [{20661, 8}], min_val => 1, max_val => 4,
      attr_type => [{101, 100}, {102, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 15}], lockable => 1};
get_comprehend({3, 10, 12}) ->
    #{classes => 3, type => 10, lev => 108, craft => 12,
      loss => [{20660, 8}], min_val => 1, max_val => 4,
      attr_type => [{102, 100}, {105, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 15}], lockable => 1};
get_comprehend({3, 11, 12}) ->
    #{classes => 3, type => 11, lev => 108, craft => 12,
      loss => [{20660, 8}], min_val => 1, max_val => 4,
      attr_type => [{101, 100}, {105, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 15}], lockable => 1};
get_comprehend({3, 12, 12}) ->
    #{classes => 3, type => 12, lev => 108, craft => 12,
      loss => [{20660, 8}], min_val => 1, max_val => 4,
      attr_type => [{102, 100}, {104, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 15}], lockable => 1};
get_comprehend({3, 14, 12}) ->
    #{classes => 3, type => 14, lev => 108, craft => 12,
      loss => [{20660, 8}], min_val => 1, max_val => 4,
      attr_type => [{104, 100}, {105, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 15}], lockable => 1};
get_comprehend({3, 3, 13}) ->
    #{classes => 3, type => 3, lev => 110, craft => 13,
      loss => [{20662, 3}], min_val => 2, max_val => 5,
      attr_type => [{101, 100}, {104, 100}],
      attr_val => [{2, 350}, {3, 380}, {4, 200}, {5, 70}],
      lock_loss => [{20649, 25}], lockable => 1};
get_comprehend({3, 6, 13}) ->
    #{classes => 3, type => 6, lev => 110, craft => 13,
      loss => [{20664, 3}], min_val => 1, max_val => 4,
      attr_type => [{101, 100}, {104, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 20}], lockable => 1};
get_comprehend({3, 7, 13}) ->
    #{classes => 3, type => 7, lev => 110, craft => 13,
      loss => [{20664, 3}], min_val => 1, max_val => 4,
      attr_type => [{101, 100}, {102, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 20}], lockable => 1};
get_comprehend({3, 9, 13}) ->
    #{classes => 3, type => 9, lev => 110, craft => 13,
      loss => [{20664, 3}], min_val => 1, max_val => 4,
      attr_type => [{101, 100}, {102, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 20}], lockable => 1};
get_comprehend({3, 10, 13}) ->
    #{classes => 3, type => 10, lev => 110, craft => 13,
      loss => [{20663, 3}], min_val => 1, max_val => 4,
      attr_type => [{102, 100}, {105, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 20}], lockable => 1};
get_comprehend({3, 11, 13}) ->
    #{classes => 3, type => 11, lev => 110, craft => 13,
      loss => [{20663, 3}], min_val => 1, max_val => 4,
      attr_type => [{101, 100}, {105, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 20}], lockable => 1};
get_comprehend({3, 12, 13}) ->
    #{classes => 3, type => 12, lev => 110, craft => 13,
      loss => [{20663, 3}], min_val => 1, max_val => 4,
      attr_type => [{102, 100}, {104, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 20}], lockable => 1};
get_comprehend({3, 14, 13}) ->
    #{classes => 3, type => 14, lev => 110, craft => 13,
      loss => [{20663, 3}], min_val => 1, max_val => 4,
      attr_type => [{104, 100}, {105, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 20}], lockable => 1};
get_comprehend({4, 4, 1}) ->
    #{classes => 4, type => 4, lev => 80, craft => 1,
      loss => [{20653, 3}], min_val => 3, max_val => 6,
      attr_type => [{104, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      looks => 11401, looks_active_val => 5, lock_loss => [],
      lockable => 0, fashion_id => 11401};
get_comprehend({4, 6, 1}) ->
    #{classes => 4, type => 6, lev => 80, craft => 1,
      loss => [{20655, 3}], min_val => 2, max_val => 5,
      attr_type => [{102, 100}, {104, 100}],
      attr_val => [{2, 350}, {3, 380}, {4, 200}, {5, 70}],
      lock_loss => [], lockable => 0};
get_comprehend({4, 7, 1}) ->
    #{classes => 4, type => 7, lev => 80, craft => 1,
      loss => [{20655, 3}], min_val => 2, max_val => 5,
      attr_type => [{103, 100}, {102, 100}],
      attr_val => [{2, 350}, {3, 380}, {4, 200}, {5, 70}],
      lock_loss => [], lockable => 0};
get_comprehend({4, 9, 1}) ->
    #{classes => 4, type => 9, lev => 80, craft => 1,
      loss => [{20655, 3}], min_val => 2, max_val => 5,
      attr_type => [{102, 100}, {105, 100}],
      attr_val => [{2, 350}, {3, 380}, {4, 200}, {5, 70}],
      lock_loss => [], lockable => 0};
get_comprehend({4, 10, 1}) ->
    #{classes => 4, type => 10, lev => 80, craft => 1,
      loss => [{20654, 3}], min_val => 2, max_val => 5,
      attr_type => [{102, 100}, {105, 100}],
      attr_val => [{2, 350}, {3, 380}, {4, 200}, {5, 70}],
      lock_loss => [], lockable => 0};
get_comprehend({4, 11, 1}) ->
    #{classes => 4, type => 11, lev => 80, craft => 1,
      loss => [{20654, 3}], min_val => 2, max_val => 5,
      attr_type => [{105, 100}, {104, 100}],
      attr_val => [{2, 350}, {3, 380}, {4, 200}, {5, 70}],
      lock_loss => [], lockable => 0};
get_comprehend({4, 12, 1}) ->
    #{classes => 4, type => 12, lev => 80, craft => 1,
      loss => [{20654, 3}], min_val => 2, max_val => 5,
      attr_type => [{102, 100}, {104, 100}],
      attr_val => [{2, 350}, {3, 380}, {4, 200}, {5, 70}],
      lock_loss => [], lockable => 0};
get_comprehend({4, 14, 1}) ->
    #{classes => 4, type => 14, lev => 80, craft => 1,
      loss => [{20654, 3}], min_val => 2, max_val => 5,
      attr_type => [{104, 100}, {105, 100}],
      attr_val => [{2, 350}, {3, 380}, {4, 200}, {5, 70}],
      lock_loss => [], lockable => 0};
get_comprehend({4, 4, 2}) ->
    #{classes => 4, type => 4, lev => 85, craft => 2,
      loss => [{20653, 5}], min_val => 3, max_val => 6,
      attr_type => [{104, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [], lockable => 0};
get_comprehend({4, 6, 2}) ->
    #{classes => 4, type => 6, lev => 85, craft => 2,
      loss => [{20655, 5}], min_val => 2, max_val => 5,
      attr_type => [{102, 100}, {104, 100}],
      attr_val => [{2, 350}, {3, 380}, {4, 200}, {5, 70}],
      lock_loss => [], lockable => 0};
get_comprehend({4, 7, 2}) ->
    #{classes => 4, type => 7, lev => 85, craft => 2,
      loss => [{20655, 5}], min_val => 2, max_val => 5,
      attr_type => [{103, 100}, {102, 100}],
      attr_val => [{2, 350}, {3, 380}, {4, 200}, {5, 70}],
      lock_loss => [], lockable => 0};
get_comprehend({4, 9, 2}) ->
    #{classes => 4, type => 9, lev => 85, craft => 2,
      loss => [{20655, 5}], min_val => 2, max_val => 5,
      attr_type => [{102, 100}, {105, 100}],
      attr_val => [{2, 350}, {3, 380}, {4, 200}, {5, 70}],
      lock_loss => [], lockable => 0};
get_comprehend({4, 10, 2}) ->
    #{classes => 4, type => 10, lev => 85, craft => 2,
      loss => [{20654, 5}], min_val => 2, max_val => 5,
      attr_type => [{102, 100}, {105, 100}],
      attr_val => [{2, 350}, {3, 380}, {4, 200}, {5, 70}],
      lock_loss => [], lockable => 0};
get_comprehend({4, 11, 2}) ->
    #{classes => 4, type => 11, lev => 85, craft => 2,
      loss => [{20654, 5}], min_val => 2, max_val => 5,
      attr_type => [{105, 100}, {104, 100}],
      attr_val => [{2, 350}, {3, 380}, {4, 200}, {5, 70}],
      lock_loss => [], lockable => 0};
get_comprehend({4, 12, 2}) ->
    #{classes => 4, type => 12, lev => 85, craft => 2,
      loss => [{20654, 5}], min_val => 2, max_val => 5,
      attr_type => [{102, 100}, {104, 100}],
      attr_val => [{2, 350}, {3, 380}, {4, 200}, {5, 70}],
      lock_loss => [], lockable => 0};
get_comprehend({4, 14, 2}) ->
    #{classes => 4, type => 14, lev => 85, craft => 2,
      loss => [{20654, 5}], min_val => 2, max_val => 5,
      attr_type => [{104, 100}, {105, 100}],
      attr_val => [{2, 350}, {3, 380}, {4, 200}, {5, 70}],
      lock_loss => [], lockable => 0};
get_comprehend({4, 4, 3}) ->
    #{classes => 4, type => 4, lev => 90, craft => 3,
      loss => [{20656, 3}], min_val => 4, max_val => 7,
      attr_type => [{104, 100}, {105, 100}],
      attr_val => [{4, 350}, {5, 380}, {6, 200}, {7, 70}],
      looks => 11402, looks_active_val => 6,
      lock_loss => [{20649, 2}], lockable => 1,
      fashion_id => 11402};
get_comprehend({4, 6, 3}) ->
    #{classes => 4, type => 6, lev => 90, craft => 3,
      loss => [{20658, 3}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 1}], lockable => 1};
get_comprehend({4, 7, 3}) ->
    #{classes => 4, type => 7, lev => 90, craft => 3,
      loss => [{20658, 3}], min_val => 3, max_val => 6,
      attr_type => [{103, 100}, {102, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 1}], lockable => 1};
get_comprehend({4, 9, 3}) ->
    #{classes => 4, type => 9, lev => 90, craft => 3,
      loss => [{20658, 3}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 1}], lockable => 1};
get_comprehend({4, 10, 3}) ->
    #{classes => 4, type => 10, lev => 90, craft => 3,
      loss => [{20657, 3}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 1}], lockable => 1};
get_comprehend({4, 11, 3}) ->
    #{classes => 4, type => 11, lev => 90, craft => 3,
      loss => [{20657, 3}], min_val => 3, max_val => 6,
      attr_type => [{105, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 1}], lockable => 1};
get_comprehend({4, 12, 3}) ->
    #{classes => 4, type => 12, lev => 90, craft => 3,
      loss => [{20657, 3}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 1}], lockable => 1};
get_comprehend({4, 14, 3}) ->
    #{classes => 4, type => 14, lev => 90, craft => 3,
      loss => [{20657, 3}], min_val => 3, max_val => 6,
      attr_type => [{104, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 1}], lockable => 1};
get_comprehend({4, 4, 4}) ->
    #{classes => 4, type => 4, lev => 92, craft => 4,
      loss => [{20656, 4}], min_val => 4, max_val => 7,
      attr_type => [{104, 100}, {105, 100}],
      attr_val => [{4, 350}, {5, 380}, {6, 200}, {7, 70}],
      lock_loss => [{20649, 3}], lockable => 1};
get_comprehend({4, 6, 4}) ->
    #{classes => 4, type => 6, lev => 92, craft => 4,
      loss => [{20658, 4}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 2}], lockable => 1};
get_comprehend({4, 7, 4}) ->
    #{classes => 4, type => 7, lev => 92, craft => 4,
      loss => [{20658, 4}], min_val => 3, max_val => 6,
      attr_type => [{103, 100}, {102, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 2}], lockable => 1};
get_comprehend({4, 9, 4}) ->
    #{classes => 4, type => 9, lev => 92, craft => 4,
      loss => [{20658, 4}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 2}], lockable => 1};
get_comprehend({4, 10, 4}) ->
    #{classes => 4, type => 10, lev => 92, craft => 4,
      loss => [{20657, 4}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 2}], lockable => 1};
get_comprehend({4, 11, 4}) ->
    #{classes => 4, type => 11, lev => 92, craft => 4,
      loss => [{20657, 4}], min_val => 3, max_val => 6,
      attr_type => [{105, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 2}], lockable => 1};
get_comprehend({4, 12, 4}) ->
    #{classes => 4, type => 12, lev => 92, craft => 4,
      loss => [{20657, 4}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 2}], lockable => 1};
get_comprehend({4, 14, 4}) ->
    #{classes => 4, type => 14, lev => 92, craft => 4,
      loss => [{20657, 4}], min_val => 3, max_val => 6,
      attr_type => [{104, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 2}], lockable => 1};
get_comprehend({4, 4, 5}) ->
    #{classes => 4, type => 4, lev => 94, craft => 5,
      loss => [{20656, 5}], min_val => 4, max_val => 7,
      attr_type => [{104, 100}, {105, 100}],
      attr_val => [{4, 350}, {5, 380}, {6, 200}, {7, 70}],
      looks => 11403, looks_active_val => 6,
      lock_loss => [{20649, 5}], lockable => 1,
      fashion_id => 11403};
get_comprehend({4, 6, 5}) ->
    #{classes => 4, type => 6, lev => 94, craft => 5,
      loss => [{20658, 5}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 3}], lockable => 1};
get_comprehend({4, 7, 5}) ->
    #{classes => 4, type => 7, lev => 94, craft => 5,
      loss => [{20658, 5}], min_val => 3, max_val => 6,
      attr_type => [{103, 100}, {102, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 3}], lockable => 1};
get_comprehend({4, 9, 5}) ->
    #{classes => 4, type => 9, lev => 94, craft => 5,
      loss => [{20658, 5}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 3}], lockable => 1};
get_comprehend({4, 10, 5}) ->
    #{classes => 4, type => 10, lev => 94, craft => 5,
      loss => [{20657, 5}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 3}], lockable => 1};
get_comprehend({4, 11, 5}) ->
    #{classes => 4, type => 11, lev => 94, craft => 5,
      loss => [{20657, 5}], min_val => 3, max_val => 6,
      attr_type => [{105, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 3}], lockable => 1};
get_comprehend({4, 12, 5}) ->
    #{classes => 4, type => 12, lev => 94, craft => 5,
      loss => [{20657, 5}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 3}], lockable => 1};
get_comprehend({4, 14, 5}) ->
    #{classes => 4, type => 14, lev => 94, craft => 5,
      loss => [{20657, 5}], min_val => 3, max_val => 6,
      attr_type => [{104, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 3}], lockable => 1};
get_comprehend({4, 4, 6}) ->
    #{classes => 4, type => 4, lev => 96, craft => 6,
      loss => [{20656, 5}], min_val => 4, max_val => 7,
      attr_type => [{104, 100}, {105, 100}],
      attr_val => [{4, 350}, {5, 380}, {6, 200}, {7, 70}],
      lock_loss => [{20649, 6}], lockable => 1};
get_comprehend({4, 6, 6}) ->
    #{classes => 4, type => 6, lev => 96, craft => 6,
      loss => [{20658, 5}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 4}], lockable => 1};
get_comprehend({4, 7, 6}) ->
    #{classes => 4, type => 7, lev => 96, craft => 6,
      loss => [{20658, 5}], min_val => 3, max_val => 6,
      attr_type => [{103, 100}, {102, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 4}], lockable => 1};
get_comprehend({4, 9, 6}) ->
    #{classes => 4, type => 9, lev => 96, craft => 6,
      loss => [{20658, 5}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 4}], lockable => 1};
get_comprehend({4, 10, 6}) ->
    #{classes => 4, type => 10, lev => 96, craft => 6,
      loss => [{20657, 5}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 4}], lockable => 1};
get_comprehend({4, 11, 6}) ->
    #{classes => 4, type => 11, lev => 96, craft => 6,
      loss => [{20657, 5}], min_val => 3, max_val => 6,
      attr_type => [{105, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 4}], lockable => 1};
get_comprehend({4, 12, 6}) ->
    #{classes => 4, type => 12, lev => 96, craft => 6,
      loss => [{20657, 5}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 4}], lockable => 1};
get_comprehend({4, 14, 6}) ->
    #{classes => 4, type => 14, lev => 96, craft => 6,
      loss => [{20657, 5}], min_val => 3, max_val => 6,
      attr_type => [{104, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 4}], lockable => 1};
get_comprehend({4, 4, 7}) ->
    #{classes => 4, type => 4, lev => 97, craft => 7,
      loss => [{20656, 6}], min_val => 4, max_val => 7,
      attr_type => [{104, 100}, {105, 100}],
      attr_val => [{4, 350}, {5, 380}, {6, 200}, {7, 70}],
      looks => 11404, looks_active_val => 6,
      lock_loss => [{20649, 8}], lockable => 1,
      fashion_id => 11404};
get_comprehend({4, 6, 7}) ->
    #{classes => 4, type => 6, lev => 97, craft => 7,
      loss => [{20658, 6}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 5}], lockable => 1};
get_comprehend({4, 7, 7}) ->
    #{classes => 4, type => 7, lev => 97, craft => 7,
      loss => [{20658, 6}], min_val => 3, max_val => 6,
      attr_type => [{103, 100}, {102, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 5}], lockable => 1};
get_comprehend({4, 9, 7}) ->
    #{classes => 4, type => 9, lev => 97, craft => 7,
      loss => [{20658, 6}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 5}], lockable => 1};
get_comprehend({4, 10, 7}) ->
    #{classes => 4, type => 10, lev => 97, craft => 7,
      loss => [{20657, 6}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 5}], lockable => 1};
get_comprehend({4, 11, 7}) ->
    #{classes => 4, type => 11, lev => 97, craft => 7,
      loss => [{20657, 6}], min_val => 3, max_val => 6,
      attr_type => [{105, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 5}], lockable => 1};
get_comprehend({4, 12, 7}) ->
    #{classes => 4, type => 12, lev => 97, craft => 7,
      loss => [{20657, 6}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 5}], lockable => 1};
get_comprehend({4, 14, 7}) ->
    #{classes => 4, type => 14, lev => 97, craft => 7,
      loss => [{20657, 6}], min_val => 3, max_val => 6,
      attr_type => [{104, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 5}], lockable => 1};
get_comprehend({4, 4, 8}) ->
    #{classes => 4, type => 4, lev => 98, craft => 8,
      loss => [{20656, 8}], min_val => 4, max_val => 7,
      attr_type => [{104, 100}, {105, 100}],
      attr_val => [{4, 350}, {5, 380}, {6, 200}, {7, 70}],
      lock_loss => [{20649, 10}], lockable => 1};
get_comprehend({4, 6, 8}) ->
    #{classes => 4, type => 6, lev => 98, craft => 8,
      loss => [{20658, 8}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 6}], lockable => 1};
get_comprehend({4, 7, 8}) ->
    #{classes => 4, type => 7, lev => 98, craft => 8,
      loss => [{20658, 8}], min_val => 3, max_val => 6,
      attr_type => [{103, 100}, {102, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 6}], lockable => 1};
get_comprehend({4, 9, 8}) ->
    #{classes => 4, type => 9, lev => 98, craft => 8,
      loss => [{20658, 8}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 6}], lockable => 1};
get_comprehend({4, 10, 8}) ->
    #{classes => 4, type => 10, lev => 98, craft => 8,
      loss => [{20657, 8}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 6}], lockable => 1};
get_comprehend({4, 11, 8}) ->
    #{classes => 4, type => 11, lev => 98, craft => 8,
      loss => [{20657, 8}], min_val => 3, max_val => 6,
      attr_type => [{105, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 6}], lockable => 1};
get_comprehend({4, 12, 8}) ->
    #{classes => 4, type => 12, lev => 98, craft => 8,
      loss => [{20657, 8}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 6}], lockable => 1};
get_comprehend({4, 14, 8}) ->
    #{classes => 4, type => 14, lev => 98, craft => 8,
      loss => [{20657, 8}], min_val => 3, max_val => 6,
      attr_type => [{104, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 6}], lockable => 1};
get_comprehend({4, 4, 9}) ->
    #{classes => 4, type => 4, lev => 100, craft => 9,
      loss => [{20659, 3}], min_val => 4, max_val => 7,
      attr_type => [{104, 100}, {105, 100}],
      attr_val => [{4, 350}, {5, 380}, {6, 200}, {7, 70}],
      lock_loss => [{20649, 12}], lockable => 1};
get_comprehend({4, 6, 9}) ->
    #{classes => 4, type => 6, lev => 100, craft => 9,
      loss => [{20661, 3}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 7}], lockable => 1};
get_comprehend({4, 7, 9}) ->
    #{classes => 4, type => 7, lev => 100, craft => 9,
      loss => [{20661, 3}], min_val => 3, max_val => 6,
      attr_type => [{103, 100}, {102, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 7}], lockable => 1};
get_comprehend({4, 9, 9}) ->
    #{classes => 4, type => 9, lev => 100, craft => 9,
      loss => [{20661, 3}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 7}], lockable => 1};
get_comprehend({4, 10, 9}) ->
    #{classes => 4, type => 10, lev => 100, craft => 9,
      loss => [{20660, 3}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 7}], lockable => 1};
get_comprehend({4, 11, 9}) ->
    #{classes => 4, type => 11, lev => 100, craft => 9,
      loss => [{20660, 3}], min_val => 3, max_val => 6,
      attr_type => [{105, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 7}], lockable => 1};
get_comprehend({4, 12, 9}) ->
    #{classes => 4, type => 12, lev => 100, craft => 9,
      loss => [{20660, 3}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 7}], lockable => 1};
get_comprehend({4, 14, 9}) ->
    #{classes => 4, type => 14, lev => 100, craft => 9,
      loss => [{20660, 3}], min_val => 3, max_val => 6,
      attr_type => [{104, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 7}], lockable => 1};
get_comprehend({4, 4, 10}) ->
    #{classes => 4, type => 4, lev => 102, craft => 10,
      loss => [{20659, 5}], min_val => 4, max_val => 7,
      attr_type => [{104, 100}, {105, 100}],
      attr_val => [{4, 350}, {5, 380}, {6, 200}, {7, 70}],
      lock_loss => [{20649, 15}], lockable => 1};
get_comprehend({4, 6, 10}) ->
    #{classes => 4, type => 6, lev => 102, craft => 10,
      loss => [{20661, 5}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 9}], lockable => 1};
get_comprehend({4, 7, 10}) ->
    #{classes => 4, type => 7, lev => 102, craft => 10,
      loss => [{20661, 5}], min_val => 3, max_val => 6,
      attr_type => [{103, 100}, {102, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 9}], lockable => 1};
get_comprehend({4, 9, 10}) ->
    #{classes => 4, type => 9, lev => 102, craft => 10,
      loss => [{20661, 5}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 9}], lockable => 1};
get_comprehend({4, 10, 10}) ->
    #{classes => 4, type => 10, lev => 102, craft => 10,
      loss => [{20660, 5}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 9}], lockable => 1};
get_comprehend({4, 11, 10}) ->
    #{classes => 4, type => 11, lev => 102, craft => 10,
      loss => [{20660, 5}], min_val => 3, max_val => 6,
      attr_type => [{105, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 9}], lockable => 1};
get_comprehend({4, 12, 10}) ->
    #{classes => 4, type => 12, lev => 102, craft => 10,
      loss => [{20660, 5}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 9}], lockable => 1};
get_comprehend({4, 14, 10}) ->
    #{classes => 4, type => 14, lev => 102, craft => 10,
      loss => [{20660, 5}], min_val => 3, max_val => 6,
      attr_type => [{104, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 9}], lockable => 1};
get_comprehend({4, 4, 11}) ->
    #{classes => 4, type => 4, lev => 105, craft => 11,
      loss => [{20659, 6}], min_val => 2, max_val => 5,
      attr_type => [{104, 100}, {105, 100}],
      attr_val => [{2, 350}, {3, 380}, {4, 200}, {5, 70}],
      lock_loss => [{20649, 18}], lockable => 1};
get_comprehend({4, 6, 11}) ->
    #{classes => 4, type => 6, lev => 105, craft => 11,
      loss => [{20661, 6}], min_val => 1, max_val => 4,
      attr_type => [{102, 100}, {104, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 12}], lockable => 1};
get_comprehend({4, 7, 11}) ->
    #{classes => 4, type => 7, lev => 105, craft => 11,
      loss => [{20661, 6}], min_val => 1, max_val => 4,
      attr_type => [{103, 100}, {102, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 12}], lockable => 1};
get_comprehend({4, 9, 11}) ->
    #{classes => 4, type => 9, lev => 105, craft => 11,
      loss => [{20661, 6}], min_val => 1, max_val => 4,
      attr_type => [{102, 100}, {105, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 12}], lockable => 1};
get_comprehend({4, 10, 11}) ->
    #{classes => 4, type => 10, lev => 105, craft => 11,
      loss => [{20660, 6}], min_val => 1, max_val => 4,
      attr_type => [{102, 100}, {105, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 12}], lockable => 1};
get_comprehend({4, 11, 11}) ->
    #{classes => 4, type => 11, lev => 105, craft => 11,
      loss => [{20660, 6}], min_val => 1, max_val => 4,
      attr_type => [{105, 100}, {104, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 12}], lockable => 1};
get_comprehend({4, 12, 11}) ->
    #{classes => 4, type => 12, lev => 105, craft => 11,
      loss => [{20660, 6}], min_val => 1, max_val => 4,
      attr_type => [{102, 100}, {104, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 12}], lockable => 1};
get_comprehend({4, 14, 11}) ->
    #{classes => 4, type => 14, lev => 105, craft => 11,
      loss => [{20660, 6}], min_val => 1, max_val => 4,
      attr_type => [{104, 100}, {105, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 12}], lockable => 1};
get_comprehend({4, 4, 12}) ->
    #{classes => 4, type => 4, lev => 108, craft => 12,
      loss => [{20659, 8}], min_val => 2, max_val => 5,
      attr_type => [{104, 100}, {105, 100}],
      attr_val => [{2, 350}, {3, 380}, {4, 200}, {5, 70}],
      lock_loss => [{20649, 20}], lockable => 1};
get_comprehend({4, 6, 12}) ->
    #{classes => 4, type => 6, lev => 108, craft => 12,
      loss => [{20661, 8}], min_val => 1, max_val => 4,
      attr_type => [{102, 100}, {104, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 15}], lockable => 1};
get_comprehend({4, 7, 12}) ->
    #{classes => 4, type => 7, lev => 108, craft => 12,
      loss => [{20661, 8}], min_val => 1, max_val => 4,
      attr_type => [{103, 100}, {102, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 15}], lockable => 1};
get_comprehend({4, 9, 12}) ->
    #{classes => 4, type => 9, lev => 108, craft => 12,
      loss => [{20661, 8}], min_val => 1, max_val => 4,
      attr_type => [{102, 100}, {105, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 15}], lockable => 1};
get_comprehend({4, 10, 12}) ->
    #{classes => 4, type => 10, lev => 108, craft => 12,
      loss => [{20660, 8}], min_val => 1, max_val => 4,
      attr_type => [{102, 100}, {105, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 15}], lockable => 1};
get_comprehend({4, 11, 12}) ->
    #{classes => 4, type => 11, lev => 108, craft => 12,
      loss => [{20660, 8}], min_val => 1, max_val => 4,
      attr_type => [{105, 100}, {104, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 15}], lockable => 1};
get_comprehend({4, 12, 12}) ->
    #{classes => 4, type => 12, lev => 108, craft => 12,
      loss => [{20660, 8}], min_val => 1, max_val => 4,
      attr_type => [{102, 100}, {104, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 15}], lockable => 1};
get_comprehend({4, 14, 12}) ->
    #{classes => 4, type => 14, lev => 108, craft => 12,
      loss => [{20660, 8}], min_val => 1, max_val => 4,
      attr_type => [{104, 100}, {105, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 15}], lockable => 1};
get_comprehend({4, 4, 13}) ->
    #{classes => 4, type => 4, lev => 110, craft => 13,
      loss => [{20662, 3}], min_val => 2, max_val => 5,
      attr_type => [{104, 100}, {105, 100}],
      attr_val => [{2, 350}, {3, 380}, {4, 200}, {5, 70}],
      lock_loss => [{20649, 25}], lockable => 1};
get_comprehend({4, 6, 13}) ->
    #{classes => 4, type => 6, lev => 110, craft => 13,
      loss => [{20664, 3}], min_val => 1, max_val => 4,
      attr_type => [{102, 100}, {104, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 20}], lockable => 1};
get_comprehend({4, 7, 13}) ->
    #{classes => 4, type => 7, lev => 110, craft => 13,
      loss => [{20664, 3}], min_val => 1, max_val => 4,
      attr_type => [{103, 100}, {102, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 20}], lockable => 1};
get_comprehend({4, 9, 13}) ->
    #{classes => 4, type => 9, lev => 110, craft => 13,
      loss => [{20664, 3}], min_val => 1, max_val => 4,
      attr_type => [{102, 100}, {105, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 20}], lockable => 1};
get_comprehend({4, 10, 13}) ->
    #{classes => 4, type => 10, lev => 110, craft => 13,
      loss => [{20663, 3}], min_val => 1, max_val => 4,
      attr_type => [{102, 100}, {105, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 20}], lockable => 1};
get_comprehend({4, 11, 13}) ->
    #{classes => 4, type => 11, lev => 110, craft => 13,
      loss => [{20663, 3}], min_val => 1, max_val => 4,
      attr_type => [{105, 100}, {104, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 20}], lockable => 1};
get_comprehend({4, 12, 13}) ->
    #{classes => 4, type => 12, lev => 110, craft => 13,
      loss => [{20663, 3}], min_val => 1, max_val => 4,
      attr_type => [{102, 100}, {104, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 20}], lockable => 1};
get_comprehend({4, 14, 13}) ->
    #{classes => 4, type => 14, lev => 110, craft => 13,
      loss => [{20663, 3}], min_val => 1, max_val => 4,
      attr_type => [{104, 100}, {105, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 20}], lockable => 1};
get_comprehend({5, 5, 1}) ->
    #{classes => 5, type => 5, lev => 80, craft => 1,
      loss => [{20653, 3}], min_val => 3, max_val => 6,
      attr_type => [{104, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      looks => 11501, looks_active_val => 5, lock_loss => [],
      lockable => 0, fashion_id => 11501};
get_comprehend({5, 6, 1}) ->
    #{classes => 5, type => 6, lev => 80, craft => 1,
      loss => [{20655, 3}], min_val => 2, max_val => 5,
      attr_type => [{102, 100}, {104, 100}],
      attr_val => [{2, 350}, {3, 380}, {4, 200}, {5, 70}],
      lock_loss => [], lockable => 0};
get_comprehend({5, 7, 1}) ->
    #{classes => 5, type => 7, lev => 80, craft => 1,
      loss => [{20655, 3}], min_val => 2, max_val => 5,
      attr_type => [{103, 100}, {102, 100}],
      attr_val => [{2, 350}, {3, 380}, {4, 200}, {5, 70}],
      lock_loss => [], lockable => 0};
get_comprehend({5, 9, 1}) ->
    #{classes => 5, type => 9, lev => 80, craft => 1,
      loss => [{20655, 3}], min_val => 2, max_val => 5,
      attr_type => [{102, 100}, {105, 100}],
      attr_val => [{2, 350}, {3, 380}, {4, 200}, {5, 70}],
      lock_loss => [], lockable => 0};
get_comprehend({5, 10, 1}) ->
    #{classes => 5, type => 10, lev => 80, craft => 1,
      loss => [{20654, 3}], min_val => 2, max_val => 5,
      attr_type => [{102, 100}, {105, 100}],
      attr_val => [{2, 350}, {3, 380}, {4, 200}, {5, 70}],
      lock_loss => [], lockable => 0};
get_comprehend({5, 11, 1}) ->
    #{classes => 5, type => 11, lev => 80, craft => 1,
      loss => [{20654, 3}], min_val => 2, max_val => 5,
      attr_type => [{105, 100}, {104, 100}],
      attr_val => [{2, 350}, {3, 380}, {4, 200}, {5, 70}],
      lock_loss => [], lockable => 0};
get_comprehend({5, 12, 1}) ->
    #{classes => 5, type => 12, lev => 80, craft => 1,
      loss => [{20654, 3}], min_val => 2, max_val => 5,
      attr_type => [{102, 100}, {104, 100}],
      attr_val => [{2, 350}, {3, 380}, {4, 200}, {5, 70}],
      lock_loss => [], lockable => 0};
get_comprehend({5, 14, 1}) ->
    #{classes => 5, type => 14, lev => 80, craft => 1,
      loss => [{20654, 3}], min_val => 2, max_val => 5,
      attr_type => [{104, 100}, {105, 100}],
      attr_val => [{2, 350}, {3, 380}, {4, 200}, {5, 70}],
      lock_loss => [], lockable => 0};
get_comprehend({5, 5, 2}) ->
    #{classes => 5, type => 5, lev => 85, craft => 2,
      loss => [{20653, 5}], min_val => 3, max_val => 6,
      attr_type => [{104, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [], lockable => 0};
get_comprehend({5, 6, 2}) ->
    #{classes => 5, type => 6, lev => 85, craft => 2,
      loss => [{20655, 5}], min_val => 2, max_val => 5,
      attr_type => [{102, 100}, {104, 100}],
      attr_val => [{2, 350}, {3, 380}, {4, 200}, {5, 70}],
      lock_loss => [], lockable => 0};
get_comprehend({5, 7, 2}) ->
    #{classes => 5, type => 7, lev => 85, craft => 2,
      loss => [{20655, 5}], min_val => 2, max_val => 5,
      attr_type => [{103, 100}, {102, 100}],
      attr_val => [{2, 350}, {3, 380}, {4, 200}, {5, 70}],
      lock_loss => [], lockable => 0};
get_comprehend({5, 9, 2}) ->
    #{classes => 5, type => 9, lev => 85, craft => 2,
      loss => [{20655, 5}], min_val => 2, max_val => 5,
      attr_type => [{102, 100}, {105, 100}],
      attr_val => [{2, 350}, {3, 380}, {4, 200}, {5, 70}],
      lock_loss => [], lockable => 0};
get_comprehend({5, 10, 2}) ->
    #{classes => 5, type => 10, lev => 85, craft => 2,
      loss => [{20654, 5}], min_val => 2, max_val => 5,
      attr_type => [{102, 100}, {105, 100}],
      attr_val => [{2, 350}, {3, 380}, {4, 200}, {5, 70}],
      lock_loss => [], lockable => 0};
get_comprehend({5, 11, 2}) ->
    #{classes => 5, type => 11, lev => 85, craft => 2,
      loss => [{20654, 5}], min_val => 2, max_val => 5,
      attr_type => [{105, 100}, {104, 100}],
      attr_val => [{2, 350}, {3, 380}, {4, 200}, {5, 70}],
      lock_loss => [], lockable => 0};
get_comprehend({5, 12, 2}) ->
    #{classes => 5, type => 12, lev => 85, craft => 2,
      loss => [{20654, 5}], min_val => 2, max_val => 5,
      attr_type => [{102, 100}, {104, 100}],
      attr_val => [{2, 350}, {3, 380}, {4, 200}, {5, 70}],
      lock_loss => [], lockable => 0};
get_comprehend({5, 14, 2}) ->
    #{classes => 5, type => 14, lev => 85, craft => 2,
      loss => [{20654, 5}], min_val => 2, max_val => 5,
      attr_type => [{104, 100}, {105, 100}],
      attr_val => [{2, 350}, {3, 380}, {4, 200}, {5, 70}],
      lock_loss => [], lockable => 0};
get_comprehend({5, 5, 3}) ->
    #{classes => 5, type => 5, lev => 90, craft => 3,
      loss => [{20656, 3}], min_val => 4, max_val => 7,
      attr_type => [{104, 100}, {105, 100}],
      attr_val => [{4, 350}, {5, 380}, {6, 200}, {7, 70}],
      looks => 11502, looks_active_val => 6,
      lock_loss => [{20649, 2}], lockable => 1,
      fashion_id => 11502};
get_comprehend({5, 6, 3}) ->
    #{classes => 5, type => 6, lev => 90, craft => 3,
      loss => [{20658, 3}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 1}], lockable => 1};
get_comprehend({5, 7, 3}) ->
    #{classes => 5, type => 7, lev => 90, craft => 3,
      loss => [{20658, 3}], min_val => 3, max_val => 6,
      attr_type => [{103, 100}, {102, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 1}], lockable => 1};
get_comprehend({5, 9, 3}) ->
    #{classes => 5, type => 9, lev => 90, craft => 3,
      loss => [{20658, 3}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 1}], lockable => 1};
get_comprehend({5, 10, 3}) ->
    #{classes => 5, type => 10, lev => 90, craft => 3,
      loss => [{20657, 3}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 1}], lockable => 1};
get_comprehend({5, 11, 3}) ->
    #{classes => 5, type => 11, lev => 90, craft => 3,
      loss => [{20657, 3}], min_val => 3, max_val => 6,
      attr_type => [{105, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 1}], lockable => 1};
get_comprehend({5, 12, 3}) ->
    #{classes => 5, type => 12, lev => 90, craft => 3,
      loss => [{20657, 3}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 1}], lockable => 1};
get_comprehend({5, 14, 3}) ->
    #{classes => 5, type => 14, lev => 90, craft => 3,
      loss => [{20657, 3}], min_val => 3, max_val => 6,
      attr_type => [{104, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 1}], lockable => 1};
get_comprehend({5, 5, 4}) ->
    #{classes => 5, type => 5, lev => 92, craft => 4,
      loss => [{20656, 4}], min_val => 4, max_val => 7,
      attr_type => [{104, 100}, {105, 100}],
      attr_val => [{4, 350}, {5, 380}, {6, 200}, {7, 70}],
      lock_loss => [{20649, 3}], lockable => 1};
get_comprehend({5, 6, 4}) ->
    #{classes => 5, type => 6, lev => 92, craft => 4,
      loss => [{20658, 4}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 2}], lockable => 1};
get_comprehend({5, 7, 4}) ->
    #{classes => 5, type => 7, lev => 92, craft => 4,
      loss => [{20658, 4}], min_val => 3, max_val => 6,
      attr_type => [{103, 100}, {102, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 2}], lockable => 1};
get_comprehend({5, 9, 4}) ->
    #{classes => 5, type => 9, lev => 92, craft => 4,
      loss => [{20658, 4}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 2}], lockable => 1};
get_comprehend({5, 10, 4}) ->
    #{classes => 5, type => 10, lev => 92, craft => 4,
      loss => [{20657, 4}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 2}], lockable => 1};
get_comprehend({5, 11, 4}) ->
    #{classes => 5, type => 11, lev => 92, craft => 4,
      loss => [{20657, 4}], min_val => 3, max_val => 6,
      attr_type => [{105, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 2}], lockable => 1};
get_comprehend({5, 12, 4}) ->
    #{classes => 5, type => 12, lev => 92, craft => 4,
      loss => [{20657, 4}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 2}], lockable => 1};
get_comprehend({5, 14, 4}) ->
    #{classes => 5, type => 14, lev => 92, craft => 4,
      loss => [{20657, 4}], min_val => 3, max_val => 6,
      attr_type => [{104, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 2}], lockable => 1};
get_comprehend({5, 5, 5}) ->
    #{classes => 5, type => 5, lev => 94, craft => 5,
      loss => [{20656, 5}], min_val => 4, max_val => 7,
      attr_type => [{104, 100}, {105, 100}],
      attr_val => [{4, 350}, {5, 380}, {6, 200}, {7, 70}],
      looks => 11503, looks_active_val => 6,
      lock_loss => [{20649, 5}], lockable => 1,
      fashion_id => 11503};
get_comprehend({5, 6, 5}) ->
    #{classes => 5, type => 6, lev => 94, craft => 5,
      loss => [{20658, 5}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 3}], lockable => 1};
get_comprehend({5, 7, 5}) ->
    #{classes => 5, type => 7, lev => 94, craft => 5,
      loss => [{20658, 5}], min_val => 3, max_val => 6,
      attr_type => [{103, 100}, {102, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 3}], lockable => 1};
get_comprehend({5, 9, 5}) ->
    #{classes => 5, type => 9, lev => 94, craft => 5,
      loss => [{20658, 5}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 3}], lockable => 1};
get_comprehend({5, 10, 5}) ->
    #{classes => 5, type => 10, lev => 94, craft => 5,
      loss => [{20657, 5}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 3}], lockable => 1};
get_comprehend({5, 11, 5}) ->
    #{classes => 5, type => 11, lev => 94, craft => 5,
      loss => [{20657, 5}], min_val => 3, max_val => 6,
      attr_type => [{105, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 3}], lockable => 1};
get_comprehend({5, 12, 5}) ->
    #{classes => 5, type => 12, lev => 94, craft => 5,
      loss => [{20657, 5}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 3}], lockable => 1};
get_comprehend({5, 14, 5}) ->
    #{classes => 5, type => 14, lev => 94, craft => 5,
      loss => [{20657, 5}], min_val => 3, max_val => 6,
      attr_type => [{104, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 3}], lockable => 1};
get_comprehend({5, 5, 6}) ->
    #{classes => 5, type => 5, lev => 96, craft => 6,
      loss => [{20656, 5}], min_val => 4, max_val => 7,
      attr_type => [{104, 100}, {105, 100}],
      attr_val => [{4, 350}, {5, 380}, {6, 200}, {7, 70}],
      lock_loss => [{20649, 6}], lockable => 1};
get_comprehend({5, 6, 6}) ->
    #{classes => 5, type => 6, lev => 96, craft => 6,
      loss => [{20658, 5}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 4}], lockable => 1};
get_comprehend({5, 7, 6}) ->
    #{classes => 5, type => 7, lev => 96, craft => 6,
      loss => [{20658, 5}], min_val => 3, max_val => 6,
      attr_type => [{103, 100}, {102, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 4}], lockable => 1};
get_comprehend({5, 9, 6}) ->
    #{classes => 5, type => 9, lev => 96, craft => 6,
      loss => [{20658, 5}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 4}], lockable => 1};
get_comprehend({5, 10, 6}) ->
    #{classes => 5, type => 10, lev => 96, craft => 6,
      loss => [{20657, 5}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 4}], lockable => 1};
get_comprehend({5, 11, 6}) ->
    #{classes => 5, type => 11, lev => 96, craft => 6,
      loss => [{20657, 5}], min_val => 3, max_val => 6,
      attr_type => [{105, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 4}], lockable => 1};
get_comprehend({5, 12, 6}) ->
    #{classes => 5, type => 12, lev => 96, craft => 6,
      loss => [{20657, 5}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 4}], lockable => 1};
get_comprehend({5, 14, 6}) ->
    #{classes => 5, type => 14, lev => 96, craft => 6,
      loss => [{20657, 5}], min_val => 3, max_val => 6,
      attr_type => [{104, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 4}], lockable => 1};
get_comprehend({5, 5, 7}) ->
    #{classes => 5, type => 5, lev => 97, craft => 7,
      loss => [{20656, 6}], min_val => 4, max_val => 7,
      attr_type => [{104, 100}, {105, 100}],
      attr_val => [{4, 350}, {5, 380}, {6, 200}, {7, 70}],
      looks => 11504, looks_active_val => 6,
      lock_loss => [{20649, 8}], lockable => 1,
      fashion_id => 11504};
get_comprehend({5, 6, 7}) ->
    #{classes => 5, type => 6, lev => 97, craft => 7,
      loss => [{20658, 6}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 5}], lockable => 1};
get_comprehend({5, 7, 7}) ->
    #{classes => 5, type => 7, lev => 97, craft => 7,
      loss => [{20658, 6}], min_val => 3, max_val => 6,
      attr_type => [{103, 100}, {102, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 5}], lockable => 1};
get_comprehend({5, 9, 7}) ->
    #{classes => 5, type => 9, lev => 97, craft => 7,
      loss => [{20658, 6}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 5}], lockable => 1};
get_comprehend({5, 10, 7}) ->
    #{classes => 5, type => 10, lev => 97, craft => 7,
      loss => [{20657, 6}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 5}], lockable => 1};
get_comprehend({5, 11, 7}) ->
    #{classes => 5, type => 11, lev => 97, craft => 7,
      loss => [{20657, 6}], min_val => 3, max_val => 6,
      attr_type => [{105, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 5}], lockable => 1};
get_comprehend({5, 12, 7}) ->
    #{classes => 5, type => 12, lev => 97, craft => 7,
      loss => [{20657, 6}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 5}], lockable => 1};
get_comprehend({5, 14, 7}) ->
    #{classes => 5, type => 14, lev => 97, craft => 7,
      loss => [{20657, 6}], min_val => 3, max_val => 6,
      attr_type => [{104, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 5}], lockable => 1};
get_comprehend({5, 5, 8}) ->
    #{classes => 5, type => 5, lev => 98, craft => 8,
      loss => [{20656, 8}], min_val => 4, max_val => 7,
      attr_type => [{104, 100}, {105, 100}],
      attr_val => [{4, 350}, {5, 380}, {6, 200}, {7, 70}],
      lock_loss => [{20649, 10}], lockable => 1};
get_comprehend({5, 6, 8}) ->
    #{classes => 5, type => 6, lev => 98, craft => 8,
      loss => [{20658, 8}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 6}], lockable => 1};
get_comprehend({5, 7, 8}) ->
    #{classes => 5, type => 7, lev => 98, craft => 8,
      loss => [{20658, 8}], min_val => 3, max_val => 6,
      attr_type => [{103, 100}, {102, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 6}], lockable => 1};
get_comprehend({5, 9, 8}) ->
    #{classes => 5, type => 9, lev => 98, craft => 8,
      loss => [{20658, 8}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 6}], lockable => 1};
get_comprehend({5, 10, 8}) ->
    #{classes => 5, type => 10, lev => 98, craft => 8,
      loss => [{20657, 8}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 6}], lockable => 1};
get_comprehend({5, 11, 8}) ->
    #{classes => 5, type => 11, lev => 98, craft => 8,
      loss => [{20657, 8}], min_val => 3, max_val => 6,
      attr_type => [{105, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 6}], lockable => 1};
get_comprehend({5, 12, 8}) ->
    #{classes => 5, type => 12, lev => 98, craft => 8,
      loss => [{20657, 8}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 6}], lockable => 1};
get_comprehend({5, 14, 8}) ->
    #{classes => 5, type => 14, lev => 98, craft => 8,
      loss => [{20657, 8}], min_val => 3, max_val => 6,
      attr_type => [{104, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 6}], lockable => 1};
get_comprehend({5, 5, 9}) ->
    #{classes => 5, type => 5, lev => 100, craft => 9,
      loss => [{20659, 3}], min_val => 4, max_val => 7,
      attr_type => [{104, 100}, {105, 100}],
      attr_val => [{4, 350}, {5, 380}, {6, 200}, {7, 70}],
      lock_loss => [{20649, 12}], lockable => 1};
get_comprehend({5, 6, 9}) ->
    #{classes => 5, type => 6, lev => 100, craft => 9,
      loss => [{20661, 3}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 7}], lockable => 1};
get_comprehend({5, 7, 9}) ->
    #{classes => 5, type => 7, lev => 100, craft => 9,
      loss => [{20661, 3}], min_val => 3, max_val => 6,
      attr_type => [{103, 100}, {102, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 7}], lockable => 1};
get_comprehend({5, 9, 9}) ->
    #{classes => 5, type => 9, lev => 100, craft => 9,
      loss => [{20661, 3}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 7}], lockable => 1};
get_comprehend({5, 10, 9}) ->
    #{classes => 5, type => 10, lev => 100, craft => 9,
      loss => [{20660, 3}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 7}], lockable => 1};
get_comprehend({5, 11, 9}) ->
    #{classes => 5, type => 11, lev => 100, craft => 9,
      loss => [{20660, 3}], min_val => 3, max_val => 6,
      attr_type => [{105, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 7}], lockable => 1};
get_comprehend({5, 12, 9}) ->
    #{classes => 5, type => 12, lev => 100, craft => 9,
      loss => [{20660, 3}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 7}], lockable => 1};
get_comprehend({5, 14, 9}) ->
    #{classes => 5, type => 14, lev => 100, craft => 9,
      loss => [{20660, 3}], min_val => 3, max_val => 6,
      attr_type => [{104, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 7}], lockable => 1};
get_comprehend({5, 5, 10}) ->
    #{classes => 5, type => 5, lev => 102, craft => 10,
      loss => [{20659, 5}], min_val => 4, max_val => 7,
      attr_type => [{104, 100}, {105, 100}],
      attr_val => [{4, 350}, {5, 380}, {6, 200}, {7, 70}],
      lock_loss => [{20649, 15}], lockable => 1};
get_comprehend({5, 6, 10}) ->
    #{classes => 5, type => 6, lev => 102, craft => 10,
      loss => [{20661, 5}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 9}], lockable => 1};
get_comprehend({5, 7, 10}) ->
    #{classes => 5, type => 7, lev => 102, craft => 10,
      loss => [{20661, 5}], min_val => 3, max_val => 6,
      attr_type => [{103, 100}, {102, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 9}], lockable => 1};
get_comprehend({5, 9, 10}) ->
    #{classes => 5, type => 9, lev => 102, craft => 10,
      loss => [{20661, 5}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 9}], lockable => 1};
get_comprehend({5, 10, 10}) ->
    #{classes => 5, type => 10, lev => 102, craft => 10,
      loss => [{20660, 5}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 9}], lockable => 1};
get_comprehend({5, 11, 10}) ->
    #{classes => 5, type => 11, lev => 102, craft => 10,
      loss => [{20660, 5}], min_val => 3, max_val => 6,
      attr_type => [{105, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 9}], lockable => 1};
get_comprehend({5, 12, 10}) ->
    #{classes => 5, type => 12, lev => 102, craft => 10,
      loss => [{20660, 5}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 9}], lockable => 1};
get_comprehend({5, 14, 10}) ->
    #{classes => 5, type => 14, lev => 102, craft => 10,
      loss => [{20660, 5}], min_val => 3, max_val => 6,
      attr_type => [{104, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 9}], lockable => 1};
get_comprehend({5, 5, 11}) ->
    #{classes => 5, type => 5, lev => 105, craft => 11,
      loss => [{20659, 6}], min_val => 2, max_val => 5,
      attr_type => [{104, 100}, {105, 100}],
      attr_val => [{2, 350}, {3, 380}, {4, 200}, {5, 70}],
      lock_loss => [{20649, 18}], lockable => 1};
get_comprehend({5, 6, 11}) ->
    #{classes => 5, type => 6, lev => 105, craft => 11,
      loss => [{20661, 6}], min_val => 1, max_val => 4,
      attr_type => [{102, 100}, {104, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 12}], lockable => 1};
get_comprehend({5, 7, 11}) ->
    #{classes => 5, type => 7, lev => 105, craft => 11,
      loss => [{20661, 6}], min_val => 1, max_val => 4,
      attr_type => [{103, 100}, {102, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 12}], lockable => 1};
get_comprehend({5, 9, 11}) ->
    #{classes => 5, type => 9, lev => 105, craft => 11,
      loss => [{20661, 6}], min_val => 1, max_val => 4,
      attr_type => [{102, 100}, {105, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 12}], lockable => 1};
get_comprehend({5, 10, 11}) ->
    #{classes => 5, type => 10, lev => 105, craft => 11,
      loss => [{20660, 6}], min_val => 1, max_val => 4,
      attr_type => [{102, 100}, {105, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 12}], lockable => 1};
get_comprehend({5, 11, 11}) ->
    #{classes => 5, type => 11, lev => 105, craft => 11,
      loss => [{20660, 6}], min_val => 1, max_val => 4,
      attr_type => [{105, 100}, {104, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 12}], lockable => 1};
get_comprehend({5, 12, 11}) ->
    #{classes => 5, type => 12, lev => 105, craft => 11,
      loss => [{20660, 6}], min_val => 1, max_val => 4,
      attr_type => [{102, 100}, {104, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 12}], lockable => 1};
get_comprehend({5, 14, 11}) ->
    #{classes => 5, type => 14, lev => 105, craft => 11,
      loss => [{20660, 6}], min_val => 1, max_val => 4,
      attr_type => [{104, 100}, {105, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 12}], lockable => 1};
get_comprehend({5, 5, 12}) ->
    #{classes => 5, type => 5, lev => 108, craft => 12,
      loss => [{20659, 8}], min_val => 2, max_val => 5,
      attr_type => [{104, 100}, {105, 100}],
      attr_val => [{2, 350}, {3, 380}, {4, 200}, {5, 70}],
      lock_loss => [{20649, 20}], lockable => 1};
get_comprehend({5, 6, 12}) ->
    #{classes => 5, type => 6, lev => 108, craft => 12,
      loss => [{20661, 8}], min_val => 1, max_val => 4,
      attr_type => [{102, 100}, {104, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 15}], lockable => 1};
get_comprehend({5, 7, 12}) ->
    #{classes => 5, type => 7, lev => 108, craft => 12,
      loss => [{20661, 8}], min_val => 1, max_val => 4,
      attr_type => [{103, 100}, {102, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 15}], lockable => 1};
get_comprehend({5, 9, 12}) ->
    #{classes => 5, type => 9, lev => 108, craft => 12,
      loss => [{20661, 8}], min_val => 1, max_val => 4,
      attr_type => [{102, 100}, {105, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 15}], lockable => 1};
get_comprehend({5, 10, 12}) ->
    #{classes => 5, type => 10, lev => 108, craft => 12,
      loss => [{20660, 8}], min_val => 1, max_val => 4,
      attr_type => [{102, 100}, {105, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 15}], lockable => 1};
get_comprehend({5, 11, 12}) ->
    #{classes => 5, type => 11, lev => 108, craft => 12,
      loss => [{20660, 8}], min_val => 1, max_val => 4,
      attr_type => [{105, 100}, {104, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 15}], lockable => 1};
get_comprehend({5, 12, 12}) ->
    #{classes => 5, type => 12, lev => 108, craft => 12,
      loss => [{20660, 8}], min_val => 1, max_val => 4,
      attr_type => [{102, 100}, {104, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 15}], lockable => 1};
get_comprehend({5, 14, 12}) ->
    #{classes => 5, type => 14, lev => 108, craft => 12,
      loss => [{20660, 8}], min_val => 1, max_val => 4,
      attr_type => [{104, 100}, {105, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 15}], lockable => 1};
get_comprehend({5, 5, 13}) ->
    #{classes => 5, type => 5, lev => 110, craft => 13,
      loss => [{20662, 3}], min_val => 2, max_val => 5,
      attr_type => [{104, 100}, {105, 100}],
      attr_val => [{2, 350}, {3, 380}, {4, 200}, {5, 70}],
      lock_loss => [{20649, 25}], lockable => 1};
get_comprehend({5, 6, 13}) ->
    #{classes => 5, type => 6, lev => 110, craft => 13,
      loss => [{20664, 3}], min_val => 1, max_val => 4,
      attr_type => [{102, 100}, {104, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 20}], lockable => 1};
get_comprehend({5, 7, 13}) ->
    #{classes => 5, type => 7, lev => 110, craft => 13,
      loss => [{20664, 3}], min_val => 1, max_val => 4,
      attr_type => [{103, 100}, {102, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 20}], lockable => 1};
get_comprehend({5, 9, 13}) ->
    #{classes => 5, type => 9, lev => 110, craft => 13,
      loss => [{20664, 3}], min_val => 1, max_val => 4,
      attr_type => [{102, 100}, {105, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 20}], lockable => 1};
get_comprehend({5, 10, 13}) ->
    #{classes => 5, type => 10, lev => 110, craft => 13,
      loss => [{20663, 3}], min_val => 1, max_val => 4,
      attr_type => [{102, 100}, {105, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 20}], lockable => 1};
get_comprehend({5, 11, 13}) ->
    #{classes => 5, type => 11, lev => 110, craft => 13,
      loss => [{20663, 3}], min_val => 1, max_val => 4,
      attr_type => [{105, 100}, {104, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 20}], lockable => 1};
get_comprehend({5, 12, 13}) ->
    #{classes => 5, type => 12, lev => 110, craft => 13,
      loss => [{20663, 3}], min_val => 1, max_val => 4,
      attr_type => [{102, 100}, {104, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 20}], lockable => 1};
get_comprehend({5, 14, 13}) ->
    #{classes => 5, type => 14, lev => 110, craft => 13,
      loss => [{20663, 3}], min_val => 1, max_val => 4,
      attr_type => [{104, 100}, {105, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 20}], lockable => 1};
get_comprehend({6, 21, 1}) ->
    #{classes => 6, type => 21, lev => 80, craft => 1,
      loss => [{20653, 3}], min_val => 3, max_val => 6,
      attr_type => [{103, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      looks => 11601, looks_active_val => 5, lock_loss => [],
      lockable => 0, fashion_id => 11601};
get_comprehend({6, 6, 1}) ->
    #{classes => 6, type => 6, lev => 80, craft => 1,
      loss => [{20655, 3}], min_val => 2, max_val => 5,
      attr_type => [{102, 100}, {104, 100}],
      attr_val => [{2, 350}, {3, 380}, {4, 200}, {5, 70}],
      lock_loss => [], lockable => 0};
get_comprehend({6, 7, 1}) ->
    #{classes => 6, type => 7, lev => 80, craft => 1,
      loss => [{20655, 3}], min_val => 2, max_val => 5,
      attr_type => [{103, 100}, {102, 100}],
      attr_val => [{2, 350}, {3, 380}, {4, 200}, {5, 70}],
      lock_loss => [], lockable => 0};
get_comprehend({6, 9, 1}) ->
    #{classes => 6, type => 9, lev => 80, craft => 1,
      loss => [{20655, 3}], min_val => 2, max_val => 5,
      attr_type => [{102, 100}, {105, 100}],
      attr_val => [{2, 350}, {3, 380}, {4, 200}, {5, 70}],
      lock_loss => [], lockable => 0};
get_comprehend({6, 10, 1}) ->
    #{classes => 6, type => 10, lev => 80, craft => 1,
      loss => [{20654, 3}], min_val => 2, max_val => 5,
      attr_type => [{103, 100}, {105, 100}],
      attr_val => [{2, 350}, {3, 380}, {4, 200}, {5, 70}],
      lock_loss => [], lockable => 0};
get_comprehend({6, 11, 1}) ->
    #{classes => 6, type => 11, lev => 80, craft => 1,
      loss => [{20654, 3}], min_val => 2, max_val => 5,
      attr_type => [{105, 100}, {104, 100}],
      attr_val => [{2, 350}, {3, 380}, {4, 200}, {5, 70}],
      lock_loss => [], lockable => 0};
get_comprehend({6, 12, 1}) ->
    #{classes => 6, type => 12, lev => 80, craft => 1,
      loss => [{20654, 3}], min_val => 2, max_val => 5,
      attr_type => [{103, 100}, {102, 100}],
      attr_val => [{2, 350}, {3, 380}, {4, 200}, {5, 70}],
      lock_loss => [], lockable => 0};
get_comprehend({6, 14, 1}) ->
    #{classes => 6, type => 14, lev => 80, craft => 1,
      loss => [{20654, 3}], min_val => 2, max_val => 5,
      attr_type => [{103, 100}, {104, 100}],
      attr_val => [{2, 350}, {3, 380}, {4, 200}, {5, 70}],
      lock_loss => [], lockable => 0};
get_comprehend({6, 21, 2}) ->
    #{classes => 6, type => 21, lev => 85, craft => 2,
      loss => [{20653, 5}], min_val => 3, max_val => 6,
      attr_type => [{103, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [], lockable => 0};
get_comprehend({6, 6, 2}) ->
    #{classes => 6, type => 6, lev => 85, craft => 2,
      loss => [{20655, 5}], min_val => 2, max_val => 5,
      attr_type => [{102, 100}, {104, 100}],
      attr_val => [{2, 350}, {3, 380}, {4, 200}, {5, 70}],
      lock_loss => [], lockable => 0};
get_comprehend({6, 7, 2}) ->
    #{classes => 6, type => 7, lev => 85, craft => 2,
      loss => [{20655, 5}], min_val => 2, max_val => 5,
      attr_type => [{103, 100}, {102, 100}],
      attr_val => [{2, 350}, {3, 380}, {4, 200}, {5, 70}],
      lock_loss => [], lockable => 0};
get_comprehend({6, 9, 2}) ->
    #{classes => 6, type => 9, lev => 85, craft => 2,
      loss => [{20655, 5}], min_val => 2, max_val => 5,
      attr_type => [{102, 100}, {105, 100}],
      attr_val => [{2, 350}, {3, 380}, {4, 200}, {5, 70}],
      lock_loss => [], lockable => 0};
get_comprehend({6, 10, 2}) ->
    #{classes => 6, type => 10, lev => 85, craft => 2,
      loss => [{20654, 5}], min_val => 2, max_val => 5,
      attr_type => [{103, 100}, {105, 100}],
      attr_val => [{2, 350}, {3, 380}, {4, 200}, {5, 70}],
      lock_loss => [], lockable => 0};
get_comprehend({6, 11, 2}) ->
    #{classes => 6, type => 11, lev => 85, craft => 2,
      loss => [{20654, 5}], min_val => 2, max_val => 5,
      attr_type => [{105, 100}, {104, 100}],
      attr_val => [{2, 350}, {3, 380}, {4, 200}, {5, 70}],
      lock_loss => [], lockable => 0};
get_comprehend({6, 12, 2}) ->
    #{classes => 6, type => 12, lev => 85, craft => 2,
      loss => [{20654, 5}], min_val => 2, max_val => 5,
      attr_type => [{103, 100}, {102, 100}],
      attr_val => [{2, 350}, {3, 380}, {4, 200}, {5, 70}],
      lock_loss => [], lockable => 0};
get_comprehend({6, 14, 2}) ->
    #{classes => 6, type => 14, lev => 85, craft => 2,
      loss => [{20654, 5}], min_val => 2, max_val => 5,
      attr_type => [{103, 100}, {104, 100}],
      attr_val => [{2, 350}, {3, 380}, {4, 200}, {5, 70}],
      lock_loss => [], lockable => 0};
get_comprehend({6, 21, 3}) ->
    #{classes => 6, type => 21, lev => 90, craft => 3,
      loss => [{20656, 3}], min_val => 4, max_val => 7,
      attr_type => [{103, 100}, {105, 100}],
      attr_val => [{4, 350}, {5, 380}, {6, 200}, {7, 70}],
      looks => 11602, looks_active_val => 6,
      lock_loss => [{20649, 2}], lockable => 1,
      fashion_id => 11602};
get_comprehend({6, 6, 3}) ->
    #{classes => 6, type => 6, lev => 90, craft => 3,
      loss => [{20658, 3}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 1}], lockable => 1};
get_comprehend({6, 7, 3}) ->
    #{classes => 6, type => 7, lev => 90, craft => 3,
      loss => [{20658, 3}], min_val => 3, max_val => 6,
      attr_type => [{103, 100}, {102, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 1}], lockable => 1};
get_comprehend({6, 9, 3}) ->
    #{classes => 6, type => 9, lev => 90, craft => 3,
      loss => [{20658, 3}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 1}], lockable => 1};
get_comprehend({6, 10, 3}) ->
    #{classes => 6, type => 10, lev => 90, craft => 3,
      loss => [{20657, 3}], min_val => 3, max_val => 6,
      attr_type => [{103, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 1}], lockable => 1};
get_comprehend({6, 11, 3}) ->
    #{classes => 6, type => 11, lev => 90, craft => 3,
      loss => [{20657, 3}], min_val => 3, max_val => 6,
      attr_type => [{105, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 1}], lockable => 1};
get_comprehend({6, 12, 3}) ->
    #{classes => 6, type => 12, lev => 90, craft => 3,
      loss => [{20657, 3}], min_val => 3, max_val => 6,
      attr_type => [{103, 100}, {102, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 1}], lockable => 1};
get_comprehend({6, 14, 3}) ->
    #{classes => 6, type => 14, lev => 90, craft => 3,
      loss => [{20657, 3}], min_val => 3, max_val => 6,
      attr_type => [{103, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 1}], lockable => 1};
get_comprehend({6, 21, 4}) ->
    #{classes => 6, type => 21, lev => 92, craft => 4,
      loss => [{20656, 4}], min_val => 4, max_val => 7,
      attr_type => [{103, 100}, {105, 100}],
      attr_val => [{4, 350}, {5, 380}, {6, 200}, {7, 70}],
      lock_loss => [{20649, 3}], lockable => 1};
get_comprehend({6, 6, 4}) ->
    #{classes => 6, type => 6, lev => 92, craft => 4,
      loss => [{20658, 4}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 2}], lockable => 1};
get_comprehend({6, 7, 4}) ->
    #{classes => 6, type => 7, lev => 92, craft => 4,
      loss => [{20658, 4}], min_val => 3, max_val => 6,
      attr_type => [{103, 100}, {102, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 2}], lockable => 1};
get_comprehend({6, 9, 4}) ->
    #{classes => 6, type => 9, lev => 92, craft => 4,
      loss => [{20658, 4}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 2}], lockable => 1};
get_comprehend({6, 10, 4}) ->
    #{classes => 6, type => 10, lev => 92, craft => 4,
      loss => [{20657, 4}], min_val => 3, max_val => 6,
      attr_type => [{103, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 2}], lockable => 1};
get_comprehend({6, 11, 4}) ->
    #{classes => 6, type => 11, lev => 92, craft => 4,
      loss => [{20657, 4}], min_val => 3, max_val => 6,
      attr_type => [{105, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 2}], lockable => 1};
get_comprehend({6, 12, 4}) ->
    #{classes => 6, type => 12, lev => 92, craft => 4,
      loss => [{20657, 4}], min_val => 3, max_val => 6,
      attr_type => [{103, 100}, {102, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 2}], lockable => 1};
get_comprehend({6, 14, 4}) ->
    #{classes => 6, type => 14, lev => 92, craft => 4,
      loss => [{20657, 4}], min_val => 3, max_val => 6,
      attr_type => [{103, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 2}], lockable => 1};
get_comprehend({6, 21, 5}) ->
    #{classes => 6, type => 21, lev => 94, craft => 5,
      loss => [{20656, 5}], min_val => 4, max_val => 7,
      attr_type => [{103, 100}, {105, 100}],
      attr_val => [{4, 350}, {5, 380}, {6, 200}, {7, 70}],
      looks => 11603, looks_active_val => 6,
      lock_loss => [{20649, 5}], lockable => 1,
      fashion_id => 11603};
get_comprehend({6, 6, 5}) ->
    #{classes => 6, type => 6, lev => 94, craft => 5,
      loss => [{20658, 5}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 3}], lockable => 1};
get_comprehend({6, 7, 5}) ->
    #{classes => 6, type => 7, lev => 94, craft => 5,
      loss => [{20658, 5}], min_val => 3, max_val => 6,
      attr_type => [{103, 100}, {102, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 3}], lockable => 1};
get_comprehend({6, 9, 5}) ->
    #{classes => 6, type => 9, lev => 94, craft => 5,
      loss => [{20658, 5}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 3}], lockable => 1};
get_comprehend({6, 10, 5}) ->
    #{classes => 6, type => 10, lev => 94, craft => 5,
      loss => [{20657, 5}], min_val => 3, max_val => 6,
      attr_type => [{103, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 3}], lockable => 1};
get_comprehend({6, 11, 5}) ->
    #{classes => 6, type => 11, lev => 94, craft => 5,
      loss => [{20657, 5}], min_val => 3, max_val => 6,
      attr_type => [{105, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 3}], lockable => 1};
get_comprehend({6, 12, 5}) ->
    #{classes => 6, type => 12, lev => 94, craft => 5,
      loss => [{20657, 5}], min_val => 3, max_val => 6,
      attr_type => [{103, 100}, {102, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 3}], lockable => 1};
get_comprehend({6, 14, 5}) ->
    #{classes => 6, type => 14, lev => 94, craft => 5,
      loss => [{20657, 5}], min_val => 3, max_val => 6,
      attr_type => [{103, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 3}], lockable => 1};
get_comprehend({6, 21, 6}) ->
    #{classes => 6, type => 21, lev => 96, craft => 6,
      loss => [{20656, 5}], min_val => 4, max_val => 7,
      attr_type => [{103, 100}, {105, 100}],
      attr_val => [{4, 350}, {5, 380}, {6, 200}, {7, 70}],
      lock_loss => [{20649, 6}], lockable => 1};
get_comprehend({6, 6, 6}) ->
    #{classes => 6, type => 6, lev => 96, craft => 6,
      loss => [{20658, 5}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 4}], lockable => 1};
get_comprehend({6, 7, 6}) ->
    #{classes => 6, type => 7, lev => 96, craft => 6,
      loss => [{20658, 5}], min_val => 3, max_val => 6,
      attr_type => [{103, 100}, {102, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 4}], lockable => 1};
get_comprehend({6, 9, 6}) ->
    #{classes => 6, type => 9, lev => 96, craft => 6,
      loss => [{20658, 5}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 4}], lockable => 1};
get_comprehend({6, 10, 6}) ->
    #{classes => 6, type => 10, lev => 96, craft => 6,
      loss => [{20657, 5}], min_val => 3, max_val => 6,
      attr_type => [{103, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 4}], lockable => 1};
get_comprehend({6, 11, 6}) ->
    #{classes => 6, type => 11, lev => 96, craft => 6,
      loss => [{20657, 5}], min_val => 3, max_val => 6,
      attr_type => [{105, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 4}], lockable => 1};
get_comprehend({6, 12, 6}) ->
    #{classes => 6, type => 12, lev => 96, craft => 6,
      loss => [{20657, 5}], min_val => 3, max_val => 6,
      attr_type => [{103, 100}, {102, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 4}], lockable => 1};
get_comprehend({6, 14, 6}) ->
    #{classes => 6, type => 14, lev => 96, craft => 6,
      loss => [{20657, 5}], min_val => 3, max_val => 6,
      attr_type => [{103, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 4}], lockable => 1};
get_comprehend({6, 21, 7}) ->
    #{classes => 6, type => 21, lev => 97, craft => 7,
      loss => [{20656, 6}], min_val => 4, max_val => 7,
      attr_type => [{103, 100}, {105, 100}],
      attr_val => [{4, 350}, {5, 380}, {6, 200}, {7, 70}],
      looks => 11604, looks_active_val => 6,
      lock_loss => [{20649, 8}], lockable => 1,
      fashion_id => 11604};
get_comprehend({6, 6, 7}) ->
    #{classes => 6, type => 6, lev => 97, craft => 7,
      loss => [{20658, 6}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 5}], lockable => 1};
get_comprehend({6, 7, 7}) ->
    #{classes => 6, type => 7, lev => 97, craft => 7,
      loss => [{20658, 6}], min_val => 3, max_val => 6,
      attr_type => [{103, 100}, {102, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 5}], lockable => 1};
get_comprehend({6, 9, 7}) ->
    #{classes => 6, type => 9, lev => 97, craft => 7,
      loss => [{20658, 6}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 5}], lockable => 1};
get_comprehend({6, 10, 7}) ->
    #{classes => 6, type => 10, lev => 97, craft => 7,
      loss => [{20657, 6}], min_val => 3, max_val => 6,
      attr_type => [{103, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 5}], lockable => 1};
get_comprehend({6, 11, 7}) ->
    #{classes => 6, type => 11, lev => 97, craft => 7,
      loss => [{20657, 6}], min_val => 3, max_val => 6,
      attr_type => [{105, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 5}], lockable => 1};
get_comprehend({6, 12, 7}) ->
    #{classes => 6, type => 12, lev => 97, craft => 7,
      loss => [{20657, 6}], min_val => 3, max_val => 6,
      attr_type => [{103, 100}, {102, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 5}], lockable => 1};
get_comprehend({6, 14, 7}) ->
    #{classes => 6, type => 14, lev => 97, craft => 7,
      loss => [{20657, 6}], min_val => 3, max_val => 6,
      attr_type => [{103, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 5}], lockable => 1};
get_comprehend({6, 21, 8}) ->
    #{classes => 6, type => 21, lev => 98, craft => 8,
      loss => [{20656, 8}], min_val => 4, max_val => 7,
      attr_type => [{103, 100}, {105, 100}],
      attr_val => [{4, 350}, {5, 380}, {6, 200}, {7, 70}],
      lock_loss => [{20649, 10}], lockable => 1};
get_comprehend({6, 6, 8}) ->
    #{classes => 6, type => 6, lev => 98, craft => 8,
      loss => [{20658, 8}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 6}], lockable => 1};
get_comprehend({6, 7, 8}) ->
    #{classes => 6, type => 7, lev => 98, craft => 8,
      loss => [{20658, 8}], min_val => 3, max_val => 6,
      attr_type => [{103, 100}, {102, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 6}], lockable => 1};
get_comprehend({6, 9, 8}) ->
    #{classes => 6, type => 9, lev => 98, craft => 8,
      loss => [{20658, 8}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 6}], lockable => 1};
get_comprehend({6, 10, 8}) ->
    #{classes => 6, type => 10, lev => 98, craft => 8,
      loss => [{20657, 8}], min_val => 3, max_val => 6,
      attr_type => [{103, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 6}], lockable => 1};
get_comprehend({6, 11, 8}) ->
    #{classes => 6, type => 11, lev => 98, craft => 8,
      loss => [{20657, 8}], min_val => 3, max_val => 6,
      attr_type => [{105, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 6}], lockable => 1};
get_comprehend({6, 12, 8}) ->
    #{classes => 6, type => 12, lev => 98, craft => 8,
      loss => [{20657, 8}], min_val => 3, max_val => 6,
      attr_type => [{103, 100}, {102, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 6}], lockable => 1};
get_comprehend({6, 14, 8}) ->
    #{classes => 6, type => 14, lev => 98, craft => 8,
      loss => [{20657, 8}], min_val => 3, max_val => 6,
      attr_type => [{103, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 6}], lockable => 1};
get_comprehend({6, 21, 9}) ->
    #{classes => 6, type => 21, lev => 100, craft => 9,
      loss => [{20659, 3}], min_val => 4, max_val => 7,
      attr_type => [{103, 100}, {105, 100}],
      attr_val => [{4, 350}, {5, 380}, {6, 200}, {7, 70}],
      lock_loss => [{20649, 12}], lockable => 1};
get_comprehend({6, 6, 9}) ->
    #{classes => 6, type => 6, lev => 100, craft => 9,
      loss => [{20661, 3}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 7}], lockable => 1};
get_comprehend({6, 7, 9}) ->
    #{classes => 6, type => 7, lev => 100, craft => 9,
      loss => [{20661, 3}], min_val => 3, max_val => 6,
      attr_type => [{103, 100}, {102, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 7}], lockable => 1};
get_comprehend({6, 9, 9}) ->
    #{classes => 6, type => 9, lev => 100, craft => 9,
      loss => [{20661, 3}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 7}], lockable => 1};
get_comprehend({6, 10, 9}) ->
    #{classes => 6, type => 10, lev => 100, craft => 9,
      loss => [{20660, 3}], min_val => 3, max_val => 6,
      attr_type => [{103, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 7}], lockable => 1};
get_comprehend({6, 11, 9}) ->
    #{classes => 6, type => 11, lev => 100, craft => 9,
      loss => [{20660, 3}], min_val => 3, max_val => 6,
      attr_type => [{105, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 7}], lockable => 1};
get_comprehend({6, 12, 9}) ->
    #{classes => 6, type => 12, lev => 100, craft => 9,
      loss => [{20660, 3}], min_val => 3, max_val => 6,
      attr_type => [{103, 100}, {102, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 7}], lockable => 1};
get_comprehend({6, 14, 9}) ->
    #{classes => 6, type => 14, lev => 100, craft => 9,
      loss => [{20660, 3}], min_val => 3, max_val => 6,
      attr_type => [{103, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 7}], lockable => 1};
get_comprehend({6, 21, 10}) ->
    #{classes => 6, type => 21, lev => 102, craft => 10,
      loss => [{20659, 5}], min_val => 4, max_val => 7,
      attr_type => [{103, 100}, {105, 100}],
      attr_val => [{4, 350}, {5, 380}, {6, 200}, {7, 70}],
      lock_loss => [{20649, 15}], lockable => 1};
get_comprehend({6, 6, 10}) ->
    #{classes => 6, type => 6, lev => 102, craft => 10,
      loss => [{20661, 5}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 9}], lockable => 1};
get_comprehend({6, 7, 10}) ->
    #{classes => 6, type => 7, lev => 102, craft => 10,
      loss => [{20661, 5}], min_val => 3, max_val => 6,
      attr_type => [{103, 100}, {102, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 9}], lockable => 1};
get_comprehend({6, 9, 10}) ->
    #{classes => 6, type => 9, lev => 102, craft => 10,
      loss => [{20661, 5}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 9}], lockable => 1};
get_comprehend({6, 10, 10}) ->
    #{classes => 6, type => 10, lev => 102, craft => 10,
      loss => [{20660, 5}], min_val => 3, max_val => 6,
      attr_type => [{103, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 9}], lockable => 1};
get_comprehend({6, 11, 10}) ->
    #{classes => 6, type => 11, lev => 102, craft => 10,
      loss => [{20660, 5}], min_val => 3, max_val => 6,
      attr_type => [{105, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 9}], lockable => 1};
get_comprehend({6, 12, 10}) ->
    #{classes => 6, type => 12, lev => 102, craft => 10,
      loss => [{20660, 5}], min_val => 3, max_val => 6,
      attr_type => [{103, 100}, {102, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 9}], lockable => 1};
get_comprehend({6, 14, 10}) ->
    #{classes => 6, type => 14, lev => 102, craft => 10,
      loss => [{20660, 5}], min_val => 3, max_val => 6,
      attr_type => [{103, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 9}], lockable => 1};
get_comprehend({6, 21, 11}) ->
    #{classes => 6, type => 21, lev => 105, craft => 11,
      loss => [{20659, 6}], min_val => 2, max_val => 5,
      attr_type => [{103, 100}, {105, 100}],
      attr_val => [{2, 350}, {3, 380}, {4, 200}, {5, 70}],
      lock_loss => [{20649, 18}], lockable => 1};
get_comprehend({6, 6, 11}) ->
    #{classes => 6, type => 6, lev => 105, craft => 11,
      loss => [{20661, 6}], min_val => 1, max_val => 4,
      attr_type => [{102, 100}, {104, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 12}], lockable => 1};
get_comprehend({6, 7, 11}) ->
    #{classes => 6, type => 7, lev => 105, craft => 11,
      loss => [{20661, 6}], min_val => 1, max_val => 4,
      attr_type => [{103, 100}, {102, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 12}], lockable => 1};
get_comprehend({6, 9, 11}) ->
    #{classes => 6, type => 9, lev => 105, craft => 11,
      loss => [{20661, 6}], min_val => 1, max_val => 4,
      attr_type => [{102, 100}, {105, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 12}], lockable => 1};
get_comprehend({6, 10, 11}) ->
    #{classes => 6, type => 10, lev => 105, craft => 11,
      loss => [{20660, 6}], min_val => 1, max_val => 4,
      attr_type => [{103, 100}, {105, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 12}], lockable => 1};
get_comprehend({6, 11, 11}) ->
    #{classes => 6, type => 11, lev => 105, craft => 11,
      loss => [{20660, 6}], min_val => 1, max_val => 4,
      attr_type => [{105, 100}, {104, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 12}], lockable => 1};
get_comprehend({6, 12, 11}) ->
    #{classes => 6, type => 12, lev => 105, craft => 11,
      loss => [{20660, 6}], min_val => 1, max_val => 4,
      attr_type => [{103, 100}, {102, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 12}], lockable => 1};
get_comprehend({6, 14, 11}) ->
    #{classes => 6, type => 14, lev => 105, craft => 11,
      loss => [{20660, 6}], min_val => 1, max_val => 4,
      attr_type => [{103, 100}, {104, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 12}], lockable => 1};
get_comprehend({6, 21, 12}) ->
    #{classes => 6, type => 21, lev => 108, craft => 12,
      loss => [{20659, 8}], min_val => 2, max_val => 5,
      attr_type => [{103, 100}, {105, 100}],
      attr_val => [{2, 350}, {3, 380}, {4, 200}, {5, 70}],
      lock_loss => [{20649, 20}], lockable => 1};
get_comprehend({6, 6, 12}) ->
    #{classes => 6, type => 6, lev => 108, craft => 12,
      loss => [{20661, 8}], min_val => 1, max_val => 4,
      attr_type => [{102, 100}, {104, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 15}], lockable => 1};
get_comprehend({6, 7, 12}) ->
    #{classes => 6, type => 7, lev => 108, craft => 12,
      loss => [{20661, 8}], min_val => 1, max_val => 4,
      attr_type => [{103, 100}, {102, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 15}], lockable => 1};
get_comprehend({6, 9, 12}) ->
    #{classes => 6, type => 9, lev => 108, craft => 12,
      loss => [{20661, 8}], min_val => 1, max_val => 4,
      attr_type => [{102, 100}, {105, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 15}], lockable => 1};
get_comprehend({6, 10, 12}) ->
    #{classes => 6, type => 10, lev => 108, craft => 12,
      loss => [{20660, 8}], min_val => 1, max_val => 4,
      attr_type => [{103, 100}, {105, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 15}], lockable => 1};
get_comprehend({6, 11, 12}) ->
    #{classes => 6, type => 11, lev => 108, craft => 12,
      loss => [{20660, 8}], min_val => 1, max_val => 4,
      attr_type => [{105, 100}, {104, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 15}], lockable => 1};
get_comprehend({6, 12, 12}) ->
    #{classes => 6, type => 12, lev => 108, craft => 12,
      loss => [{20660, 8}], min_val => 1, max_val => 4,
      attr_type => [{103, 100}, {102, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 15}], lockable => 1};
get_comprehend({6, 14, 12}) ->
    #{classes => 6, type => 14, lev => 108, craft => 12,
      loss => [{20660, 8}], min_val => 1, max_val => 4,
      attr_type => [{103, 100}, {104, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 15}], lockable => 1};
get_comprehend({6, 21, 13}) ->
    #{classes => 6, type => 21, lev => 110, craft => 13,
      loss => [{20662, 3}], min_val => 2, max_val => 5,
      attr_type => [{103, 100}, {105, 100}],
      attr_val => [{2, 350}, {3, 380}, {4, 200}, {5, 70}],
      lock_loss => [{20649, 25}], lockable => 1};
get_comprehend({6, 6, 13}) ->
    #{classes => 6, type => 6, lev => 110, craft => 13,
      loss => [{20664, 3}], min_val => 1, max_val => 4,
      attr_type => [{102, 100}, {104, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 20}], lockable => 1};
get_comprehend({6, 7, 13}) ->
    #{classes => 6, type => 7, lev => 110, craft => 13,
      loss => [{20664, 3}], min_val => 1, max_val => 4,
      attr_type => [{103, 100}, {102, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 20}], lockable => 1};
get_comprehend({6, 9, 13}) ->
    #{classes => 6, type => 9, lev => 110, craft => 13,
      loss => [{20664, 3}], min_val => 1, max_val => 4,
      attr_type => [{102, 100}, {105, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 20}], lockable => 1};
get_comprehend({6, 10, 13}) ->
    #{classes => 6, type => 10, lev => 110, craft => 13,
      loss => [{20663, 3}], min_val => 1, max_val => 4,
      attr_type => [{103, 100}, {105, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 20}], lockable => 1};
get_comprehend({6, 11, 13}) ->
    #{classes => 6, type => 11, lev => 110, craft => 13,
      loss => [{20663, 3}], min_val => 1, max_val => 4,
      attr_type => [{105, 100}, {104, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 20}], lockable => 1};
get_comprehend({6, 12, 13}) ->
    #{classes => 6, type => 12, lev => 110, craft => 13,
      loss => [{20663, 3}], min_val => 1, max_val => 4,
      attr_type => [{103, 100}, {102, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 20}], lockable => 1};
get_comprehend({6, 14, 13}) ->
    #{classes => 6, type => 14, lev => 110, craft => 13,
      loss => [{20663, 3}], min_val => 1, max_val => 4,
      attr_type => [{103, 100}, {104, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 20}], lockable => 1};
get_comprehend({7, 22, 1}) ->
    #{classes => 7, type => 22, lev => 80, craft => 1,
      loss => [{20653, 3}], min_val => 3, max_val => 6,
      attr_type => [{101, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      looks => 11701, looks_active_val => 5, lock_loss => [],
      lockable => 0, fashion_id => 11701};
get_comprehend({7, 6, 1}) ->
    #{classes => 7, type => 6, lev => 80, craft => 1,
      loss => [{20655, 3}], min_val => 2, max_val => 5,
      attr_type => [{101, 100}, {104, 100}],
      attr_val => [{2, 350}, {3, 380}, {4, 200}, {5, 70}],
      lock_loss => [], lockable => 0};
get_comprehend({7, 7, 1}) ->
    #{classes => 7, type => 7, lev => 80, craft => 1,
      loss => [{20655, 3}], min_val => 2, max_val => 5,
      attr_type => [{101, 100}, {102, 100}],
      attr_val => [{2, 350}, {3, 380}, {4, 200}, {5, 70}],
      lock_loss => [], lockable => 0};
get_comprehend({7, 9, 1}) ->
    #{classes => 7, type => 9, lev => 80, craft => 1,
      loss => [{20655, 3}], min_val => 2, max_val => 5,
      attr_type => [{101, 100}, {102, 100}],
      attr_val => [{2, 350}, {3, 380}, {4, 200}, {5, 70}],
      lock_loss => [], lockable => 0};
get_comprehend({7, 10, 1}) ->
    #{classes => 7, type => 10, lev => 80, craft => 1,
      loss => [{20654, 3}], min_val => 2, max_val => 5,
      attr_type => [{102, 100}, {105, 100}],
      attr_val => [{2, 350}, {3, 380}, {4, 200}, {5, 70}],
      lock_loss => [], lockable => 0};
get_comprehend({7, 11, 1}) ->
    #{classes => 7, type => 11, lev => 80, craft => 1,
      loss => [{20654, 3}], min_val => 2, max_val => 5,
      attr_type => [{101, 100}, {105, 100}],
      attr_val => [{2, 350}, {3, 380}, {4, 200}, {5, 70}],
      lock_loss => [], lockable => 0};
get_comprehend({7, 12, 1}) ->
    #{classes => 7, type => 12, lev => 80, craft => 1,
      loss => [{20654, 3}], min_val => 2, max_val => 5,
      attr_type => [{102, 100}, {104, 100}],
      attr_val => [{2, 350}, {3, 380}, {4, 200}, {5, 70}],
      lock_loss => [], lockable => 0};
get_comprehend({7, 14, 1}) ->
    #{classes => 7, type => 14, lev => 80, craft => 1,
      loss => [{20654, 3}], min_val => 2, max_val => 5,
      attr_type => [{104, 100}, {105, 100}],
      attr_val => [{2, 350}, {3, 380}, {4, 200}, {5, 70}],
      lock_loss => [], lockable => 0};
get_comprehend({7, 22, 2}) ->
    #{classes => 7, type => 22, lev => 85, craft => 2,
      loss => [{20653, 5}], min_val => 3, max_val => 6,
      attr_type => [{101, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [], lockable => 0};
get_comprehend({7, 6, 2}) ->
    #{classes => 7, type => 6, lev => 85, craft => 2,
      loss => [{20655, 5}], min_val => 2, max_val => 5,
      attr_type => [{101, 100}, {104, 100}],
      attr_val => [{2, 350}, {3, 380}, {4, 200}, {5, 70}],
      lock_loss => [], lockable => 0};
get_comprehend({7, 7, 2}) ->
    #{classes => 7, type => 7, lev => 85, craft => 2,
      loss => [{20655, 5}], min_val => 2, max_val => 5,
      attr_type => [{101, 100}, {102, 100}],
      attr_val => [{2, 350}, {3, 380}, {4, 200}, {5, 70}],
      lock_loss => [], lockable => 0};
get_comprehend({7, 9, 2}) ->
    #{classes => 7, type => 9, lev => 85, craft => 2,
      loss => [{20655, 5}], min_val => 2, max_val => 5,
      attr_type => [{101, 100}, {102, 100}],
      attr_val => [{2, 350}, {3, 380}, {4, 200}, {5, 70}],
      lock_loss => [], lockable => 0};
get_comprehend({7, 10, 2}) ->
    #{classes => 7, type => 10, lev => 85, craft => 2,
      loss => [{20654, 5}], min_val => 2, max_val => 5,
      attr_type => [{102, 100}, {105, 100}],
      attr_val => [{2, 350}, {3, 380}, {4, 200}, {5, 70}],
      lock_loss => [], lockable => 0};
get_comprehend({7, 11, 2}) ->
    #{classes => 7, type => 11, lev => 85, craft => 2,
      loss => [{20654, 5}], min_val => 2, max_val => 5,
      attr_type => [{101, 100}, {105, 100}],
      attr_val => [{2, 350}, {3, 380}, {4, 200}, {5, 70}],
      lock_loss => [], lockable => 0};
get_comprehend({7, 12, 2}) ->
    #{classes => 7, type => 12, lev => 85, craft => 2,
      loss => [{20654, 5}], min_val => 2, max_val => 5,
      attr_type => [{102, 100}, {104, 100}],
      attr_val => [{2, 350}, {3, 380}, {4, 200}, {5, 70}],
      lock_loss => [], lockable => 0};
get_comprehend({7, 14, 2}) ->
    #{classes => 7, type => 14, lev => 85, craft => 2,
      loss => [{20654, 5}], min_val => 2, max_val => 5,
      attr_type => [{104, 100}, {105, 100}],
      attr_val => [{2, 350}, {3, 380}, {4, 200}, {5, 70}],
      lock_loss => [], lockable => 0};
get_comprehend({7, 22, 3}) ->
    #{classes => 7, type => 22, lev => 90, craft => 3,
      loss => [{20656, 3}], min_val => 4, max_val => 7,
      attr_type => [{101, 100}, {104, 100}],
      attr_val => [{4, 350}, {5, 380}, {6, 200}, {7, 70}],
      looks => 11702, looks_active_val => 6,
      lock_loss => [{20649, 2}], lockable => 1,
      fashion_id => 11702};
get_comprehend({7, 6, 3}) ->
    #{classes => 7, type => 6, lev => 90, craft => 3,
      loss => [{20658, 3}], min_val => 3, max_val => 6,
      attr_type => [{101, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 1}], lockable => 1};
get_comprehend({7, 7, 3}) ->
    #{classes => 7, type => 7, lev => 90, craft => 3,
      loss => [{20658, 3}], min_val => 3, max_val => 6,
      attr_type => [{101, 100}, {102, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 1}], lockable => 1};
get_comprehend({7, 9, 3}) ->
    #{classes => 7, type => 9, lev => 90, craft => 3,
      loss => [{20658, 3}], min_val => 3, max_val => 6,
      attr_type => [{101, 100}, {102, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 1}], lockable => 1};
get_comprehend({7, 10, 3}) ->
    #{classes => 7, type => 10, lev => 90, craft => 3,
      loss => [{20657, 3}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 1}], lockable => 1};
get_comprehend({7, 11, 3}) ->
    #{classes => 7, type => 11, lev => 90, craft => 3,
      loss => [{20657, 3}], min_val => 3, max_val => 6,
      attr_type => [{101, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 1}], lockable => 1};
get_comprehend({7, 12, 3}) ->
    #{classes => 7, type => 12, lev => 90, craft => 3,
      loss => [{20657, 3}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 1}], lockable => 1};
get_comprehend({7, 14, 3}) ->
    #{classes => 7, type => 14, lev => 90, craft => 3,
      loss => [{20657, 3}], min_val => 3, max_val => 6,
      attr_type => [{104, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 1}], lockable => 1};
get_comprehend({7, 22, 4}) ->
    #{classes => 7, type => 22, lev => 92, craft => 4,
      loss => [{20656, 4}], min_val => 4, max_val => 7,
      attr_type => [{101, 100}, {104, 100}],
      attr_val => [{4, 350}, {5, 380}, {6, 200}, {7, 70}],
      lock_loss => [{20649, 3}], lockable => 1};
get_comprehend({7, 6, 4}) ->
    #{classes => 7, type => 6, lev => 92, craft => 4,
      loss => [{20658, 4}], min_val => 3, max_val => 6,
      attr_type => [{101, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 2}], lockable => 1};
get_comprehend({7, 7, 4}) ->
    #{classes => 7, type => 7, lev => 92, craft => 4,
      loss => [{20658, 4}], min_val => 3, max_val => 6,
      attr_type => [{101, 100}, {102, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 2}], lockable => 1};
get_comprehend({7, 9, 4}) ->
    #{classes => 7, type => 9, lev => 92, craft => 4,
      loss => [{20658, 4}], min_val => 3, max_val => 6,
      attr_type => [{101, 100}, {102, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 2}], lockable => 1};
get_comprehend({7, 10, 4}) ->
    #{classes => 7, type => 10, lev => 92, craft => 4,
      loss => [{20657, 4}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 2}], lockable => 1};
get_comprehend({7, 11, 4}) ->
    #{classes => 7, type => 11, lev => 92, craft => 4,
      loss => [{20657, 4}], min_val => 3, max_val => 6,
      attr_type => [{101, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 2}], lockable => 1};
get_comprehend({7, 12, 4}) ->
    #{classes => 7, type => 12, lev => 92, craft => 4,
      loss => [{20657, 4}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 2}], lockable => 1};
get_comprehend({7, 14, 4}) ->
    #{classes => 7, type => 14, lev => 92, craft => 4,
      loss => [{20657, 4}], min_val => 3, max_val => 6,
      attr_type => [{104, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 2}], lockable => 1};
get_comprehend({7, 22, 5}) ->
    #{classes => 7, type => 22, lev => 94, craft => 5,
      loss => [{20656, 5}], min_val => 4, max_val => 7,
      attr_type => [{101, 100}, {104, 100}],
      attr_val => [{4, 350}, {5, 380}, {6, 200}, {7, 70}],
      looks => 11703, looks_active_val => 6,
      lock_loss => [{20649, 5}], lockable => 1,
      fashion_id => 11703};
get_comprehend({7, 6, 5}) ->
    #{classes => 7, type => 6, lev => 94, craft => 5,
      loss => [{20658, 5}], min_val => 3, max_val => 6,
      attr_type => [{101, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 3}], lockable => 1};
get_comprehend({7, 7, 5}) ->
    #{classes => 7, type => 7, lev => 94, craft => 5,
      loss => [{20658, 5}], min_val => 3, max_val => 6,
      attr_type => [{101, 100}, {102, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 3}], lockable => 1};
get_comprehend({7, 9, 5}) ->
    #{classes => 7, type => 9, lev => 94, craft => 5,
      loss => [{20658, 5}], min_val => 3, max_val => 6,
      attr_type => [{101, 100}, {102, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 3}], lockable => 1};
get_comprehend({7, 10, 5}) ->
    #{classes => 7, type => 10, lev => 94, craft => 5,
      loss => [{20657, 5}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 3}], lockable => 1};
get_comprehend({7, 11, 5}) ->
    #{classes => 7, type => 11, lev => 94, craft => 5,
      loss => [{20657, 5}], min_val => 3, max_val => 6,
      attr_type => [{101, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 3}], lockable => 1};
get_comprehend({7, 12, 5}) ->
    #{classes => 7, type => 12, lev => 94, craft => 5,
      loss => [{20657, 5}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 3}], lockable => 1};
get_comprehend({7, 14, 5}) ->
    #{classes => 7, type => 14, lev => 94, craft => 5,
      loss => [{20657, 5}], min_val => 3, max_val => 6,
      attr_type => [{104, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 3}], lockable => 1};
get_comprehend({7, 22, 6}) ->
    #{classes => 7, type => 22, lev => 96, craft => 6,
      loss => [{20656, 5}], min_val => 4, max_val => 7,
      attr_type => [{101, 100}, {104, 100}],
      attr_val => [{4, 350}, {5, 380}, {6, 200}, {7, 70}],
      lock_loss => [{20649, 6}], lockable => 1};
get_comprehend({7, 6, 6}) ->
    #{classes => 7, type => 6, lev => 96, craft => 6,
      loss => [{20658, 5}], min_val => 3, max_val => 6,
      attr_type => [{101, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 4}], lockable => 1};
get_comprehend({7, 7, 6}) ->
    #{classes => 7, type => 7, lev => 96, craft => 6,
      loss => [{20658, 5}], min_val => 3, max_val => 6,
      attr_type => [{101, 100}, {102, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 4}], lockable => 1};
get_comprehend({7, 9, 6}) ->
    #{classes => 7, type => 9, lev => 96, craft => 6,
      loss => [{20658, 5}], min_val => 3, max_val => 6,
      attr_type => [{101, 100}, {102, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 4}], lockable => 1};
get_comprehend({7, 10, 6}) ->
    #{classes => 7, type => 10, lev => 96, craft => 6,
      loss => [{20657, 5}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 4}], lockable => 1};
get_comprehend({7, 11, 6}) ->
    #{classes => 7, type => 11, lev => 96, craft => 6,
      loss => [{20657, 5}], min_val => 3, max_val => 6,
      attr_type => [{101, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 4}], lockable => 1};
get_comprehend({7, 12, 6}) ->
    #{classes => 7, type => 12, lev => 96, craft => 6,
      loss => [{20657, 5}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 4}], lockable => 1};
get_comprehend({7, 14, 6}) ->
    #{classes => 7, type => 14, lev => 96, craft => 6,
      loss => [{20657, 5}], min_val => 3, max_val => 6,
      attr_type => [{104, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 4}], lockable => 1};
get_comprehend({7, 22, 7}) ->
    #{classes => 7, type => 22, lev => 97, craft => 7,
      loss => [{20656, 6}], min_val => 4, max_val => 7,
      attr_type => [{101, 100}, {104, 100}],
      attr_val => [{4, 350}, {5, 380}, {6, 200}, {7, 70}],
      looks => 11704, looks_active_val => 6,
      lock_loss => [{20649, 8}], lockable => 1,
      fashion_id => 11704};
get_comprehend({7, 6, 7}) ->
    #{classes => 7, type => 6, lev => 97, craft => 7,
      loss => [{20658, 6}], min_val => 3, max_val => 6,
      attr_type => [{101, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 5}], lockable => 1};
get_comprehend({7, 7, 7}) ->
    #{classes => 7, type => 7, lev => 97, craft => 7,
      loss => [{20658, 6}], min_val => 3, max_val => 6,
      attr_type => [{101, 100}, {102, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 5}], lockable => 1};
get_comprehend({7, 9, 7}) ->
    #{classes => 7, type => 9, lev => 97, craft => 7,
      loss => [{20658, 6}], min_val => 3, max_val => 6,
      attr_type => [{101, 100}, {102, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 5}], lockable => 1};
get_comprehend({7, 10, 7}) ->
    #{classes => 7, type => 10, lev => 97, craft => 7,
      loss => [{20657, 6}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 5}], lockable => 1};
get_comprehend({7, 11, 7}) ->
    #{classes => 7, type => 11, lev => 97, craft => 7,
      loss => [{20657, 6}], min_val => 3, max_val => 6,
      attr_type => [{101, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 5}], lockable => 1};
get_comprehend({7, 12, 7}) ->
    #{classes => 7, type => 12, lev => 97, craft => 7,
      loss => [{20657, 6}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 5}], lockable => 1};
get_comprehend({7, 14, 7}) ->
    #{classes => 7, type => 14, lev => 97, craft => 7,
      loss => [{20657, 6}], min_val => 3, max_val => 6,
      attr_type => [{104, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 5}], lockable => 1};
get_comprehend({7, 22, 8}) ->
    #{classes => 7, type => 22, lev => 98, craft => 8,
      loss => [{20656, 8}], min_val => 4, max_val => 7,
      attr_type => [{101, 100}, {104, 100}],
      attr_val => [{4, 350}, {5, 380}, {6, 200}, {7, 70}],
      lock_loss => [{20649, 10}], lockable => 1};
get_comprehend({7, 6, 8}) ->
    #{classes => 7, type => 6, lev => 98, craft => 8,
      loss => [{20658, 8}], min_val => 3, max_val => 6,
      attr_type => [{101, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 6}], lockable => 1};
get_comprehend({7, 7, 8}) ->
    #{classes => 7, type => 7, lev => 98, craft => 8,
      loss => [{20658, 8}], min_val => 3, max_val => 6,
      attr_type => [{101, 100}, {102, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 6}], lockable => 1};
get_comprehend({7, 9, 8}) ->
    #{classes => 7, type => 9, lev => 98, craft => 8,
      loss => [{20658, 8}], min_val => 3, max_val => 6,
      attr_type => [{101, 100}, {102, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 6}], lockable => 1};
get_comprehend({7, 10, 8}) ->
    #{classes => 7, type => 10, lev => 98, craft => 8,
      loss => [{20657, 8}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 6}], lockable => 1};
get_comprehend({7, 11, 8}) ->
    #{classes => 7, type => 11, lev => 98, craft => 8,
      loss => [{20657, 8}], min_val => 3, max_val => 6,
      attr_type => [{101, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 6}], lockable => 1};
get_comprehend({7, 12, 8}) ->
    #{classes => 7, type => 12, lev => 98, craft => 8,
      loss => [{20657, 8}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 6}], lockable => 1};
get_comprehend({7, 14, 8}) ->
    #{classes => 7, type => 14, lev => 98, craft => 8,
      loss => [{20657, 8}], min_val => 3, max_val => 6,
      attr_type => [{104, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 6}], lockable => 1};
get_comprehend({7, 22, 9}) ->
    #{classes => 7, type => 22, lev => 100, craft => 9,
      loss => [{20659, 3}], min_val => 4, max_val => 7,
      attr_type => [{101, 100}, {104, 100}],
      attr_val => [{4, 350}, {5, 380}, {6, 200}, {7, 70}],
      lock_loss => [{20649, 12}], lockable => 1};
get_comprehend({7, 6, 9}) ->
    #{classes => 7, type => 6, lev => 100, craft => 9,
      loss => [{20661, 3}], min_val => 3, max_val => 6,
      attr_type => [{101, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 7}], lockable => 1};
get_comprehend({7, 7, 9}) ->
    #{classes => 7, type => 7, lev => 100, craft => 9,
      loss => [{20661, 3}], min_val => 3, max_val => 6,
      attr_type => [{101, 100}, {102, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 7}], lockable => 1};
get_comprehend({7, 9, 9}) ->
    #{classes => 7, type => 9, lev => 100, craft => 9,
      loss => [{20661, 3}], min_val => 3, max_val => 6,
      attr_type => [{101, 100}, {102, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 7}], lockable => 1};
get_comprehend({7, 10, 9}) ->
    #{classes => 7, type => 10, lev => 100, craft => 9,
      loss => [{20660, 3}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 7}], lockable => 1};
get_comprehend({7, 11, 9}) ->
    #{classes => 7, type => 11, lev => 100, craft => 9,
      loss => [{20660, 3}], min_val => 3, max_val => 6,
      attr_type => [{101, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 7}], lockable => 1};
get_comprehend({7, 12, 9}) ->
    #{classes => 7, type => 12, lev => 100, craft => 9,
      loss => [{20660, 3}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 7}], lockable => 1};
get_comprehend({7, 14, 9}) ->
    #{classes => 7, type => 14, lev => 100, craft => 9,
      loss => [{20660, 3}], min_val => 3, max_val => 6,
      attr_type => [{104, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 7}], lockable => 1};
get_comprehend({7, 22, 10}) ->
    #{classes => 7, type => 22, lev => 102, craft => 10,
      loss => [{20659, 5}], min_val => 4, max_val => 7,
      attr_type => [{101, 100}, {104, 100}],
      attr_val => [{4, 350}, {5, 380}, {6, 200}, {7, 70}],
      lock_loss => [{20649, 15}], lockable => 1};
get_comprehend({7, 6, 10}) ->
    #{classes => 7, type => 6, lev => 102, craft => 10,
      loss => [{20661, 5}], min_val => 3, max_val => 6,
      attr_type => [{101, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 9}], lockable => 1};
get_comprehend({7, 7, 10}) ->
    #{classes => 7, type => 7, lev => 102, craft => 10,
      loss => [{20661, 5}], min_val => 3, max_val => 6,
      attr_type => [{101, 100}, {102, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 9}], lockable => 1};
get_comprehend({7, 9, 10}) ->
    #{classes => 7, type => 9, lev => 102, craft => 10,
      loss => [{20661, 5}], min_val => 3, max_val => 6,
      attr_type => [{101, 100}, {102, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 9}], lockable => 1};
get_comprehend({7, 10, 10}) ->
    #{classes => 7, type => 10, lev => 102, craft => 10,
      loss => [{20660, 5}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 9}], lockable => 1};
get_comprehend({7, 11, 10}) ->
    #{classes => 7, type => 11, lev => 102, craft => 10,
      loss => [{20660, 5}], min_val => 3, max_val => 6,
      attr_type => [{101, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 9}], lockable => 1};
get_comprehend({7, 12, 10}) ->
    #{classes => 7, type => 12, lev => 102, craft => 10,
      loss => [{20660, 5}], min_val => 3, max_val => 6,
      attr_type => [{102, 100}, {104, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 9}], lockable => 1};
get_comprehend({7, 14, 10}) ->
    #{classes => 7, type => 14, lev => 102, craft => 10,
      loss => [{20660, 5}], min_val => 3, max_val => 6,
      attr_type => [{104, 100}, {105, 100}],
      attr_val => [{3, 350}, {4, 380}, {5, 200}, {6, 70}],
      lock_loss => [{20649, 9}], lockable => 1};
get_comprehend({7, 22, 11}) ->
    #{classes => 7, type => 22, lev => 105, craft => 11,
      loss => [{20659, 6}], min_val => 2, max_val => 5,
      attr_type => [{101, 100}, {104, 100}],
      attr_val => [{2, 350}, {3, 380}, {4, 200}, {5, 70}],
      lock_loss => [{20649, 18}], lockable => 1};
get_comprehend({7, 6, 11}) ->
    #{classes => 7, type => 6, lev => 105, craft => 11,
      loss => [{20661, 6}], min_val => 1, max_val => 4,
      attr_type => [{101, 100}, {104, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 12}], lockable => 1};
get_comprehend({7, 7, 11}) ->
    #{classes => 7, type => 7, lev => 105, craft => 11,
      loss => [{20661, 6}], min_val => 1, max_val => 4,
      attr_type => [{101, 100}, {102, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 12}], lockable => 1};
get_comprehend({7, 9, 11}) ->
    #{classes => 7, type => 9, lev => 105, craft => 11,
      loss => [{20661, 6}], min_val => 1, max_val => 4,
      attr_type => [{101, 100}, {102, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 12}], lockable => 1};
get_comprehend({7, 10, 11}) ->
    #{classes => 7, type => 10, lev => 105, craft => 11,
      loss => [{20660, 6}], min_val => 1, max_val => 4,
      attr_type => [{102, 100}, {105, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 12}], lockable => 1};
get_comprehend({7, 11, 11}) ->
    #{classes => 7, type => 11, lev => 105, craft => 11,
      loss => [{20660, 6}], min_val => 1, max_val => 4,
      attr_type => [{101, 100}, {105, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 12}], lockable => 1};
get_comprehend({7, 12, 11}) ->
    #{classes => 7, type => 12, lev => 105, craft => 11,
      loss => [{20660, 6}], min_val => 1, max_val => 4,
      attr_type => [{102, 100}, {104, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 12}], lockable => 1};
get_comprehend({7, 14, 11}) ->
    #{classes => 7, type => 14, lev => 105, craft => 11,
      loss => [{20660, 6}], min_val => 1, max_val => 4,
      attr_type => [{104, 100}, {105, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 12}], lockable => 1};
get_comprehend({7, 22, 12}) ->
    #{classes => 7, type => 22, lev => 108, craft => 12,
      loss => [{20659, 8}], min_val => 2, max_val => 5,
      attr_type => [{101, 100}, {104, 100}],
      attr_val => [{2, 350}, {3, 380}, {4, 200}, {5, 70}],
      lock_loss => [{20649, 20}], lockable => 1};
get_comprehend({7, 6, 12}) ->
    #{classes => 7, type => 6, lev => 108, craft => 12,
      loss => [{20661, 8}], min_val => 1, max_val => 4,
      attr_type => [{101, 100}, {104, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 15}], lockable => 1};
get_comprehend({7, 7, 12}) ->
    #{classes => 7, type => 7, lev => 108, craft => 12,
      loss => [{20661, 8}], min_val => 1, max_val => 4,
      attr_type => [{101, 100}, {102, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 15}], lockable => 1};
get_comprehend({7, 9, 12}) ->
    #{classes => 7, type => 9, lev => 108, craft => 12,
      loss => [{20661, 8}], min_val => 1, max_val => 4,
      attr_type => [{101, 100}, {102, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 15}], lockable => 1};
get_comprehend({7, 10, 12}) ->
    #{classes => 7, type => 10, lev => 108, craft => 12,
      loss => [{20660, 8}], min_val => 1, max_val => 4,
      attr_type => [{102, 100}, {105, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 15}], lockable => 1};
get_comprehend({7, 11, 12}) ->
    #{classes => 7, type => 11, lev => 108, craft => 12,
      loss => [{20660, 8}], min_val => 1, max_val => 4,
      attr_type => [{101, 100}, {105, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 15}], lockable => 1};
get_comprehend({7, 12, 12}) ->
    #{classes => 7, type => 12, lev => 108, craft => 12,
      loss => [{20660, 8}], min_val => 1, max_val => 4,
      attr_type => [{102, 100}, {104, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 15}], lockable => 1};
get_comprehend({7, 14, 12}) ->
    #{classes => 7, type => 14, lev => 108, craft => 12,
      loss => [{20660, 8}], min_val => 1, max_val => 4,
      attr_type => [{104, 100}, {105, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 15}], lockable => 1};
get_comprehend({7, 22, 13}) ->
    #{classes => 7, type => 22, lev => 110, craft => 13,
      loss => [{20662, 3}], min_val => 2, max_val => 5,
      attr_type => [{101, 100}, {104, 100}],
      attr_val => [{2, 350}, {3, 380}, {4, 200}, {5, 70}],
      lock_loss => [{20649, 25}], lockable => 1};
get_comprehend({7, 6, 13}) ->
    #{classes => 7, type => 6, lev => 110, craft => 13,
      loss => [{20664, 3}], min_val => 1, max_val => 4,
      attr_type => [{101, 100}, {104, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 20}], lockable => 1};
get_comprehend({7, 7, 13}) ->
    #{classes => 7, type => 7, lev => 110, craft => 13,
      loss => [{20664, 3}], min_val => 1, max_val => 4,
      attr_type => [{101, 100}, {102, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 20}], lockable => 1};
get_comprehend({7, 9, 13}) ->
    #{classes => 7, type => 9, lev => 110, craft => 13,
      loss => [{20664, 3}], min_val => 1, max_val => 4,
      attr_type => [{101, 100}, {102, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 20}], lockable => 1};
get_comprehend({7, 10, 13}) ->
    #{classes => 7, type => 10, lev => 110, craft => 13,
      loss => [{20663, 3}], min_val => 1, max_val => 4,
      attr_type => [{102, 100}, {105, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 20}], lockable => 1};
get_comprehend({7, 11, 13}) ->
    #{classes => 7, type => 11, lev => 110, craft => 13,
      loss => [{20663, 3}], min_val => 1, max_val => 4,
      attr_type => [{101, 100}, {105, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 20}], lockable => 1};
get_comprehend({7, 12, 13}) ->
    #{classes => 7, type => 12, lev => 110, craft => 13,
      loss => [{20663, 3}], min_val => 1, max_val => 4,
      attr_type => [{102, 100}, {104, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 20}], lockable => 1};
get_comprehend({7, 14, 13}) ->
    #{classes => 7, type => 14, lev => 110, craft => 13,
      loss => [{20663, 3}], min_val => 1, max_val => 4,
      attr_type => [{104, 100}, {105, 100}],
      attr_val => [{1, 350}, {2, 380}, {3, 200}, {4, 70}],
      lock_loss => [{20649, 20}], lockable => 1};
get_comprehend(_) -> false.

get_comprehend_looks(11101) -> {1, 5};
get_comprehend_looks(11103) -> {3, 6};
get_comprehend_looks(11102) -> {5, 6};
get_comprehend_looks(11104) -> {7, 6};
get_comprehend_looks(11201) -> {1, 5};
get_comprehend_looks(11202) -> {3, 6};
get_comprehend_looks(11203) -> {5, 6};
get_comprehend_looks(11204) -> {7, 6};
get_comprehend_looks(11301) -> {1, 5};
get_comprehend_looks(11302) -> {3, 6};
get_comprehend_looks(11303) -> {5, 6};
get_comprehend_looks(11304) -> {7, 6};
get_comprehend_looks(11401) -> {1, 5};
get_comprehend_looks(11402) -> {3, 6};
get_comprehend_looks(11403) -> {5, 6};
get_comprehend_looks(11404) -> {7, 6};
get_comprehend_looks(11501) -> {1, 5};
get_comprehend_looks(11502) -> {3, 6};
get_comprehend_looks(11503) -> {5, 6};
get_comprehend_looks(11504) -> {7, 6};
get_comprehend_looks(11601) -> {1, 5};
get_comprehend_looks(11602) -> {3, 6};
get_comprehend_looks(11603) -> {5, 6};
get_comprehend_looks(11604) -> {7, 6};
get_comprehend_looks(11701) -> {1, 5};
get_comprehend_looks(11702) -> {3, 6};
get_comprehend_looks(11703) -> {5, 6};
get_comprehend_looks(11704) -> {7, 6};
get_comprehend_looks(_) -> false.

enchant_fail_reward({7, 0}) ->
    #enchant_fail_reward{val = 7, is_break = 0,
                         item_list = [{23103, 0, 1}], title = lang:get("强化礼包"),
                         msg =
                             lang:get("星辰学院捎来一份<color='#ffff00'>强化+8安慰礼包</color>，祝你在"
                                      "接下来能够拥有好运气！")};
enchant_fail_reward({8, 0}) ->
    #enchant_fail_reward{val = 8, is_break = 0,
                         item_list = [{23104, 0, 1}], title = lang:get("强化礼包"),
                         msg =
                             lang:get("星辰学院捎来一份<color='#ffff00'>强化+9安慰礼包</color>，祝你在"
                                      "接下来能够拥有好运气！")};
enchant_fail_reward({9, 0}) ->
    #enchant_fail_reward{val = 9, is_break = 0,
                         item_list = [{23105, 0, 1}], title = lang:get("强化礼包"),
                         msg =
                             lang:get("星辰学院捎来一份<color='#ffff00'>强化+10安慰礼包</color>，祝你"
                                      "在接下来能够拥有好运气！")};
enchant_fail_reward({10, 0}) ->
    #enchant_fail_reward{val = 10, is_break = 0,
                         item_list = [{23106, 0, 1}], title = lang:get("强化礼包"),
                         msg =
                             lang:get("星辰学院捎来一份<color='#ffff00'>强化+11安慰礼包</color>，祝你"
                                      "在接下来能够拥有好运气！")};
enchant_fail_reward({11, 0}) ->
    #enchant_fail_reward{val = 11, is_break = 0,
                         item_list = [{23107, 0, 1}], title = lang:get("强化礼包"),
                         msg =
                             lang:get("星辰学院捎来一份<color='#ffff00'>强化+12安慰礼包</color>，祝你"
                                      "在接下来能够拥有好运气！")};
enchant_fail_reward({11, 1}) ->
    #enchant_fail_reward{val = 11, is_break = 1,
                         item_list = [{23131, 0, 1}], title = lang:get("强化礼包"),
                         msg =
                             lang:get("星辰学院捎来一份<color='#ffff00'>强化+12安慰礼包</color>，祝你"
                                      "在接下来能够拥有好运气！")};
enchant_fail_reward({12, 1}) ->
    #enchant_fail_reward{val = 12, is_break = 1,
                         item_list = [{23132, 0, 1}], title = lang:get("强化礼包"),
                         msg =
                             lang:get("星辰学院捎来一份<color='#ffff00'>强化+13安慰礼包</color>，祝你"
                                      "在接下来能够拥有好运气！")};
enchant_fail_reward({13, 1}) ->
    #enchant_fail_reward{val = 13, is_break = 1,
                         item_list = [{23133, 0, 1}], title = lang:get("强化礼包"),
                         msg =
                             lang:get("星辰学院捎来一份<color='#ffff00'>强化+14安慰礼包</color>，祝你"
                                      "在接下来能够拥有好运气！")};
enchant_fail_reward({14, 1}) ->
    #enchant_fail_reward{val = 14, is_break = 1,
                         item_list = [{23134, 0, 1}], title = lang:get("强化礼包"),
                         msg =
                             lang:get("星辰学院捎来一份<color='#ffff00'>强化+15安慰礼包</color>，祝你"
                                      "在接下来能够拥有好运气！")};
enchant_fail_reward(_) -> false.

get_break_enchant(1) ->
    #{need_lev => 90, need_enchant => 12,
      need_item => [{20405, 1}]};
get_break_enchant(2) ->
    #{need_lev => 90, need_enchant => 12,
      need_item => [{20405, 1}]};
get_break_enchant(3) ->
    #{need_lev => 90, need_enchant => 12,
      need_item => [{20405, 1}]};
get_break_enchant(4) ->
    #{need_lev => 90, need_enchant => 12,
      need_item => [{20405, 1}]};
get_break_enchant(5) ->
    #{need_lev => 90, need_enchant => 12,
      need_item => [{20405, 1}]};
get_break_enchant(21) ->
    #{need_lev => 90, need_enchant => 12,
      need_item => [{20405, 1}]};
get_break_enchant(22) ->
    #{need_lev => 90, need_enchant => 12,
      need_item => [{20405, 1}]};
get_break_enchant(6) ->
    #{need_lev => 90, need_enchant => 12,
      need_item => [{20405, 1}]};
get_break_enchant(7) ->
    #{need_lev => 90, need_enchant => 12,
      need_item => [{20405, 1}]};
get_break_enchant(9) ->
    #{need_lev => 90, need_enchant => 12,
      need_item => [{20405, 1}]};
get_break_enchant(10) ->
    #{need_lev => 90, need_enchant => 12,
      need_item => [{20405, 1}]};
get_break_enchant(11) ->
    #{need_lev => 90, need_enchant => 12,
      need_item => [{20405, 1}]};
get_break_enchant(12) ->
    #{need_lev => 90, need_enchant => 12,
      need_item => [{20405, 1}]};
get_break_enchant(14) ->
    #{need_lev => 90, need_enchant => 12,
      need_item => [{20405, 1}]};
get_break_enchant(_) -> false.

get_decompose(20662) -> #{gain => [{20659, 3}]};
get_decompose(20663) -> #{gain => [{20660, 3}]};
get_decompose(20664) -> #{gain => [{20661, 3}]};
get_decompose(20659) -> #{gain => [{20656, 3}]};
get_decompose(20660) -> #{gain => [{20657, 3}]};
get_decompose(20661) -> #{gain => [{20658, 3}]};
get_decompose(20656) -> #{gain => [{20653, 3}]};
get_decompose(20657) -> #{gain => [{20654, 3}]};
get_decompose(20658) -> #{gain => [{20655, 3}]};
get_decompose(_) -> false.

get_stone_classes_modify(20800) -> {20800, 1, 1};
get_stone_classes_modify(20801) -> {20801, 1, 1};
get_stone_classes_modify(20802) -> {20802, 1, 1};
get_stone_classes_modify(20803) -> {20803, 1, 1};
get_stone_classes_modify(20804) -> {20804, 1, 1};
get_stone_classes_modify(20805) -> {20805, 1, 1};
get_stone_classes_modify(20806) -> {20806, 1, 1};
get_stone_classes_modify(20807) -> {20807, 1, 1};
get_stone_classes_modify(20820) -> {20800, 3, 2};
get_stone_classes_modify(20821) -> {20801, 3, 2};
get_stone_classes_modify(20822) -> {20802, 3, 2};
get_stone_classes_modify(20823) -> {20803, 3, 2};
get_stone_classes_modify(20824) -> {20804, 3, 2};
get_stone_classes_modify(20825) -> {20805, 3, 2};
get_stone_classes_modify(20826) -> {20806, 3, 2};
get_stone_classes_modify(20827) -> {20807, 3, 2};
get_stone_classes_modify(20840) -> {20800, 7, 3};
get_stone_classes_modify(20841) -> {20801, 7, 3};
get_stone_classes_modify(20842) -> {20802, 7, 3};
get_stone_classes_modify(20843) -> {20803, 7, 3};
get_stone_classes_modify(20844) -> {20804, 7, 3};
get_stone_classes_modify(20845) -> {20805, 7, 3};
get_stone_classes_modify(20846) -> {20806, 7, 3};
get_stone_classes_modify(20847) -> {20807, 7, 3};
get_stone_classes_modify(20860) -> {20800, 15, 4};
get_stone_classes_modify(20861) -> {20801, 15, 4};
get_stone_classes_modify(20862) -> {20802, 15, 4};
get_stone_classes_modify(20863) -> {20803, 15, 4};
get_stone_classes_modify(20864) -> {20804, 15, 4};
get_stone_classes_modify(20865) -> {20805, 15, 4};
get_stone_classes_modify(20866) -> {20806, 15, 4};
get_stone_classes_modify(20867) -> {20807, 15, 4};
get_stone_classes_modify(20880) -> {20800, 31, 5};
get_stone_classes_modify(20881) -> {20801, 31, 5};
get_stone_classes_modify(20882) -> {20802, 31, 5};
get_stone_classes_modify(20883) -> {20803, 31, 5};
get_stone_classes_modify(20884) -> {20804, 31, 5};
get_stone_classes_modify(20885) -> {20805, 31, 5};
get_stone_classes_modify(20886) -> {20806, 31, 5};
get_stone_classes_modify(20887) -> {20807, 31, 5};
get_stone_classes_modify(20900) -> {20800, 63, 6};
get_stone_classes_modify(20901) -> {20801, 63, 6};
get_stone_classes_modify(20902) -> {20802, 63, 6};
get_stone_classes_modify(20903) -> {20803, 63, 6};
get_stone_classes_modify(20904) -> {20804, 63, 6};
get_stone_classes_modify(20905) -> {20805, 63, 6};
get_stone_classes_modify(20906) -> {20806, 63, 6};
get_stone_classes_modify(20907) -> {20807, 63, 6};
get_stone_classes_modify(20920) -> {20800, 127, 7};
get_stone_classes_modify(20921) -> {20801, 127, 7};
get_stone_classes_modify(20922) -> {20802, 127, 7};
get_stone_classes_modify(20923) -> {20803, 127, 7};
get_stone_classes_modify(20924) -> {20804, 127, 7};
get_stone_classes_modify(20925) -> {20805, 127, 7};
get_stone_classes_modify(20926) -> {20806, 127, 7};
get_stone_classes_modify(20927) -> {20807, 127, 7};
get_stone_classes_modify(20940) -> {20800, 255, 8};
get_stone_classes_modify(20941) -> {20801, 255, 8};
get_stone_classes_modify(20942) -> {20802, 255, 8};
get_stone_classes_modify(20943) -> {20803, 255, 8};
get_stone_classes_modify(20944) -> {20804, 255, 8};
get_stone_classes_modify(20945) -> {20805, 255, 8};
get_stone_classes_modify(20946) -> {20806, 255, 8};
get_stone_classes_modify(20947) -> {20807, 255, 8};
get_stone_classes_modify(20960) -> {20800, 511, 9};
get_stone_classes_modify(20961) -> {20801, 511, 9};
get_stone_classes_modify(20962) -> {20802, 511, 9};
get_stone_classes_modify(20963) -> {20803, 511, 9};
get_stone_classes_modify(20964) -> {20804, 511, 9};
get_stone_classes_modify(20965) -> {20805, 511, 9};
get_stone_classes_modify(20966) -> {20806, 511, 9};
get_stone_classes_modify(20967) -> {20807, 511, 9};
get_stone_classes_modify(20980) -> {20800, 1023, 10};
get_stone_classes_modify(20981) -> {20801, 1023, 10};
get_stone_classes_modify(20982) -> {20802, 1023, 10};
get_stone_classes_modify(20983) -> {20803, 1023, 10};
get_stone_classes_modify(20984) -> {20804, 1023, 10};
get_stone_classes_modify(20985) -> {20805, 1023, 10};
get_stone_classes_modify(20986) -> {20806, 1023, 10};
get_stone_classes_modify(20987) -> {20807, 1023, 10};
get_stone_classes_modify(_) -> false.

get_target_stone_id({20800, 1}) -> 20800;
get_target_stone_id({20801, 1}) -> 20801;
get_target_stone_id({20802, 1}) -> 20802;
get_target_stone_id({20803, 1}) -> 20803;
get_target_stone_id({20804, 1}) -> 20804;
get_target_stone_id({20805, 1}) -> 20805;
get_target_stone_id({20806, 1}) -> 20806;
get_target_stone_id({20807, 1}) -> 20807;
get_target_stone_id({20800, 2}) -> 20820;
get_target_stone_id({20801, 2}) -> 20821;
get_target_stone_id({20802, 2}) -> 20822;
get_target_stone_id({20803, 2}) -> 20823;
get_target_stone_id({20804, 2}) -> 20824;
get_target_stone_id({20805, 2}) -> 20825;
get_target_stone_id({20806, 2}) -> 20826;
get_target_stone_id({20807, 2}) -> 20827;
get_target_stone_id({20800, 3}) -> 20840;
get_target_stone_id({20801, 3}) -> 20841;
get_target_stone_id({20802, 3}) -> 20842;
get_target_stone_id({20803, 3}) -> 20843;
get_target_stone_id({20804, 3}) -> 20844;
get_target_stone_id({20805, 3}) -> 20845;
get_target_stone_id({20806, 3}) -> 20846;
get_target_stone_id({20807, 3}) -> 20847;
get_target_stone_id({20800, 4}) -> 20860;
get_target_stone_id({20801, 4}) -> 20861;
get_target_stone_id({20802, 4}) -> 20862;
get_target_stone_id({20803, 4}) -> 20863;
get_target_stone_id({20804, 4}) -> 20864;
get_target_stone_id({20805, 4}) -> 20865;
get_target_stone_id({20806, 4}) -> 20866;
get_target_stone_id({20807, 4}) -> 20867;
get_target_stone_id({20800, 5}) -> 20880;
get_target_stone_id({20801, 5}) -> 20881;
get_target_stone_id({20802, 5}) -> 20882;
get_target_stone_id({20803, 5}) -> 20883;
get_target_stone_id({20804, 5}) -> 20884;
get_target_stone_id({20805, 5}) -> 20885;
get_target_stone_id({20806, 5}) -> 20886;
get_target_stone_id({20807, 5}) -> 20887;
get_target_stone_id({20800, 6}) -> 20900;
get_target_stone_id({20801, 6}) -> 20901;
get_target_stone_id({20802, 6}) -> 20902;
get_target_stone_id({20803, 6}) -> 20903;
get_target_stone_id({20804, 6}) -> 20904;
get_target_stone_id({20805, 6}) -> 20905;
get_target_stone_id({20806, 6}) -> 20906;
get_target_stone_id({20807, 6}) -> 20907;
get_target_stone_id({20800, 7}) -> 20920;
get_target_stone_id({20801, 7}) -> 20921;
get_target_stone_id({20802, 7}) -> 20922;
get_target_stone_id({20803, 7}) -> 20923;
get_target_stone_id({20804, 7}) -> 20924;
get_target_stone_id({20805, 7}) -> 20925;
get_target_stone_id({20806, 7}) -> 20926;
get_target_stone_id({20807, 7}) -> 20927;
get_target_stone_id({20800, 8}) -> 20940;
get_target_stone_id({20801, 8}) -> 20941;
get_target_stone_id({20802, 8}) -> 20942;
get_target_stone_id({20803, 8}) -> 20943;
get_target_stone_id({20804, 8}) -> 20944;
get_target_stone_id({20805, 8}) -> 20945;
get_target_stone_id({20806, 8}) -> 20946;
get_target_stone_id({20807, 8}) -> 20947;
get_target_stone_id({20800, 9}) -> 20960;
get_target_stone_id({20801, 9}) -> 20961;
get_target_stone_id({20802, 9}) -> 20962;
get_target_stone_id({20803, 9}) -> 20963;
get_target_stone_id({20804, 9}) -> 20964;
get_target_stone_id({20805, 9}) -> 20965;
get_target_stone_id({20806, 9}) -> 20966;
get_target_stone_id({20807, 9}) -> 20967;
get_target_stone_id({20800, 10}) -> 20980;
get_target_stone_id({20801, 10}) -> 20981;
get_target_stone_id({20802, 10}) -> 20982;
get_target_stone_id({20803, 10}) -> 20983;
get_target_stone_id({20804, 10}) -> 20984;
get_target_stone_id({20805, 10}) -> 20985;
get_target_stone_id({20806, 10}) -> 20986;
get_target_stone_id({20807, 10}) -> 20987;
get_target_stone_id(_) -> false.

get_comprehend_discount(90) -> {3, 1, 75, 45};
get_comprehend_discount(95) -> {5, 3, 75, 45};
get_comprehend_discount(100) -> {7, 5, 75, 45};
get_comprehend_discount(105) -> {8, 6, 75, 45};
get_comprehend_discount(110) -> {9, 7, 75, 45};
get_comprehend_discount(115) -> {10, 8, 75, 45};
get_comprehend_discount(120) -> {11, 9, 75, 45};
get_comprehend_discount(125) -> {12, 10, 75, 45};
get_comprehend_discount(_) -> false.

get_target_skill_trans({80, 0}) ->
    {[{22212, 55}],
     [{22212, 50}],
     [{22212, 30}],
     [{22212, 30}],
     [{22212, 20}],
     [{22212, 25}],
     [{22212, 25}],
     [{22212, 25}]};
get_target_skill_trans({90, 0}) ->
    {[{22212, 88}],
     [{22212, 80}],
     [{22212, 48}],
     [{22212, 48}],
     [{22212, 32}],
     [{22212, 40}],
     [{22212, 40}],
     [{22212, 40}]};
get_target_skill_trans({100, 0}) ->
    {[{22212, 110}],
     [{22212, 100}],
     [{22212, 60}],
     [{22212, 60}],
     [{22212, 40}],
     [{22212, 50}],
     [{22212, 50}],
     [{22212, 50}]};
get_target_skill_trans({110, 0}) ->
    {[{22212, 132}],
     [{22212, 120}],
     [{22212, 72}],
     [{22212, 72}],
     [{22212, 48}],
     [{22212, 60}],
     [{22212, 60}],
     [{22212, 60}]};
get_target_skill_trans({120, 0}) ->
    {[{22212, 165}],
     [{22212, 150}],
     [{22212, 90}],
     [{22212, 90}],
     [{22212, 60}],
     [{22212, 75}],
     [{22212, 75}],
     [{22212, 75}]};
get_target_skill_trans(_) -> false.

