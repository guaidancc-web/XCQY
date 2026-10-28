-file("src/data/camp_gift_custom_data.erl", 1).

-module(camp_gift_custom_data).

-export([gifts/0,
         gift/1,
         gift_item/1,
         gift_items/1,
         extra_reward/0,
         get_key_val/1]).

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

-file("src/data/camp_gift_custom_data.erl", 21).

gifts() -> [1, 2, 3, 4, 5, 6, 7, 8, 9].

gift(1) ->
    #{id => 1, start_time => 1574179200,
      end_time => 1574265599, limit_times => 1, pos => 1,
      custom_loss => [{90002, 300}],
      all_loss => [{90002, 688}], count => 3};
gift(2) ->
    #{id => 2, start_time => 1574179200,
      end_time => 1574265599, limit_times => 1, pos => 2,
      custom_loss => [{90002, 628}],
      all_loss => [{90002, 1380}], count => 3};
gift(3) ->
    #{id => 3, start_time => 1574179200,
      end_time => 1574265599, limit_times => 1, pos => 3,
      custom_loss => [{90002, 1380}],
      all_loss => [{90002, 2480}], count => 3};
gift(4) ->
    #{id => 4, start_time => 1574265600,
      end_time => 1574351999, limit_times => 1, pos => 1,
      custom_loss => [{90002, 300}],
      all_loss => [{90002, 688}], count => 3};
gift(5) ->
    #{id => 5, start_time => 1574265600,
      end_time => 1574351999, limit_times => 1, pos => 2,
      custom_loss => [{90002, 628}],
      all_loss => [{90002, 1380}], count => 3};
gift(6) ->
    #{id => 6, start_time => 1574265600,
      end_time => 1574351999, limit_times => 1, pos => 3,
      custom_loss => [{90002, 1580}],
      all_loss => [{90002, 2880}], count => 3};
gift(7) ->
    #{id => 7, start_time => 1574352000,
      end_time => 1574438399, limit_times => 1, pos => 1,
      custom_loss => [{90002, 300}],
      all_loss => [{90002, 688}], count => 3};
gift(8) ->
    #{id => 8, start_time => 1574352000,
      end_time => 1574438399, limit_times => 1, pos => 2,
      custom_loss => [{90002, 628}],
      all_loss => [{90002, 1380}], count => 3};
gift(9) ->
    #{id => 9, start_time => 1574352000,
      end_time => 1574438399, limit_times => 1, pos => 3,
      custom_loss => [{90002, 1680}],
      all_loss => [{90002, 3280}], count => 3};
gift(_) -> false.

gift_item(1) ->
    #{id => 1, item_id => 20020, item_num => 5,
      classes => 0, sex => 2, lev_min => 1, lev_max => 89,
      break_min => 0, break_max => 1, pos => 1};
gift_item(2) ->
    #{id => 1, item_id => 22306, item_num => 1,
      classes => 0, sex => 2, lev_min => 90, lev_max => 200,
      break_min => 0, break_max => 1, pos => 1};
gift_item(3) ->
    #{id => 1, item_id => 20022, item_num => 1,
      classes => 0, sex => 2, lev_min => 1, lev_max => 200,
      break_min => 0, break_max => 1, pos => 1};
gift_item(4) ->
    #{id => 1, item_id => 22212, item_num => 1,
      classes => 0, sex => 2, lev_min => 1, lev_max => 200,
      break_min => 0, break_max => 1, pos => 1};
gift_item(5) ->
    #{id => 1, item_id => 22216, item_num => 1,
      classes => 0, sex => 2, lev_min => 1, lev_max => 200,
      break_min => 0, break_max => 1, pos => 2};
gift_item(6) ->
    #{id => 1, item_id => 22396, item_num => 1,
      classes => 0, sex => 2, lev_min => 1, lev_max => 200,
      break_min => 0, break_max => 1, pos => 2};
gift_item(7) ->
    #{id => 1, item_id => 21098, item_num => 4,
      classes => 0, sex => 2, lev_min => 1, lev_max => 200,
      break_min => 0, break_max => 1, pos => 2};
gift_item(8) ->
    #{id => 1, item_id => 90026, item_num => 100,
      classes => 0, sex => 2, lev_min => 1, lev_max => 200,
      break_min => 0, break_max => 1, pos => 3};
gift_item(9) ->
    #{id => 1, item_id => 90003, item_num => 5000,
      classes => 0, sex => 2, lev_min => 1, lev_max => 200,
      break_min => 0, break_max => 1, pos => 3};
gift_item(10) ->
    #{id => 1, item_id => 90000, item_num => 500000,
      classes => 0, sex => 2, lev_min => 1, lev_max => 200,
      break_min => 0, break_max => 1, pos => 3};
gift_item(11) ->
    #{id => 2, item_id => 20755, item_num => 1,
      classes => 0, sex => 2, lev_min => 1, lev_max => 200,
      break_min => 0, break_max => 1, pos => 1};
gift_item(12) ->
    #{id => 2, item_id => 20545, item_num => 3,
      classes => 0, sex => 2, lev_min => 1, lev_max => 200,
      break_min => 0, break_max => 1, pos => 1};
gift_item(13) ->
    #{id => 2, item_id => 20616, item_num => 1,
      classes => 0, sex => 2, lev_min => 1, lev_max => 200,
      break_min => 0, break_max => 1, pos => 1};
gift_item(14) ->
    #{id => 2, item_id => 22249, item_num => 2,
      classes => 0, sex => 2, lev_min => 1, lev_max => 200,
      break_min => 0, break_max => 1, pos => 2};
gift_item(15) ->
    #{id => 2, item_id => 22248, item_num => 1,
      classes => 0, sex => 2, lev_min => 1, lev_max => 200,
      break_min => 0, break_max => 1, pos => 2};
gift_item(16) ->
    #{id => 2, item_id => 20053, item_num => 1,
      classes => 0, sex => 2, lev_min => 1, lev_max => 200,
      break_min => 0, break_max => 1, pos => 2};
gift_item(17) ->
    #{id => 2, item_id => 90026, item_num => 100,
      classes => 0, sex => 2, lev_min => 1, lev_max => 200,
      break_min => 0, break_max => 1, pos => 3};
gift_item(18) ->
    #{id => 2, item_id => 90003, item_num => 5000,
      classes => 0, sex => 2, lev_min => 1, lev_max => 200,
      break_min => 0, break_max => 1, pos => 3};
gift_item(19) ->
    #{id => 2, item_id => 90000, item_num => 500000,
      classes => 0, sex => 2, lev_min => 1, lev_max => 200,
      break_min => 0, break_max => 1, pos => 3};
gift_item(20) ->
    #{id => 3, item_id => 70726, item_num => 1,
      classes => 0, sex => 0, lev_min => 1, lev_max => 200,
      break_min => 0, break_max => 1, pos => 1};
gift_item(21) ->
    #{id => 3, item_id => 70730, item_num => 1,
      classes => 0, sex => 1, lev_min => 1, lev_max => 200,
      break_min => 0, break_max => 1, pos => 1};
gift_item(22) ->
    #{id => 3, item_id => 70949, item_num => 1,
      classes => 0, sex => 0, lev_min => 1, lev_max => 200,
      break_min => 0, break_max => 1, pos => 1};
gift_item(23) ->
    #{id => 3, item_id => 70953, item_num => 1,
      classes => 0, sex => 1, lev_min => 1, lev_max => 200,
      break_min => 0, break_max => 1, pos => 1};
gift_item(24) ->
    #{id => 3, item_id => 21244, item_num => 2,
      classes => 0, sex => 2, lev_min => 1, lev_max => 89,
      break_min => 0, break_max => 1, pos => 2};
gift_item(25) ->
    #{id => 3, item_id => 21256, item_num => 1,
      classes => 0, sex => 2, lev_min => 90, lev_max => 200,
      break_min => 0, break_max => 1, pos => 2};
gift_item(26) ->
    #{id => 3, item_id => 23740, item_num => 1,
      classes => 0, sex => 2, lev_min => 1, lev_max => 200,
      break_min => 0, break_max => 1, pos => 2};
gift_item(27) ->
    #{id => 3, item_id => 22447, item_num => 1,
      classes => 0, sex => 2, lev_min => 1, lev_max => 200,
      break_min => 0, break_max => 1, pos => 2};
gift_item(28) ->
    #{id => 3, item_id => 90026, item_num => 100,
      classes => 0, sex => 2, lev_min => 1, lev_max => 200,
      break_min => 0, break_max => 1, pos => 3};
gift_item(29) ->
    #{id => 3, item_id => 90003, item_num => 5000,
      classes => 0, sex => 2, lev_min => 1, lev_max => 200,
      break_min => 0, break_max => 1, pos => 3};
gift_item(30) ->
    #{id => 3, item_id => 90000, item_num => 500000,
      classes => 0, sex => 2, lev_min => 1, lev_max => 200,
      break_min => 0, break_max => 1, pos => 3};
gift_item(31) ->
    #{id => 4, item_id => 20020, item_num => 5,
      classes => 0, sex => 2, lev_min => 1, lev_max => 89,
      break_min => 0, break_max => 1, pos => 1};
gift_item(32) ->
    #{id => 4, item_id => 22306, item_num => 1,
      classes => 0, sex => 2, lev_min => 90, lev_max => 200,
      break_min => 0, break_max => 1, pos => 1};
gift_item(33) ->
    #{id => 4, item_id => 20022, item_num => 1,
      classes => 0, sex => 2, lev_min => 1, lev_max => 200,
      break_min => 0, break_max => 1, pos => 1};
gift_item(34) ->
    #{id => 4, item_id => 22212, item_num => 1,
      classes => 0, sex => 2, lev_min => 1, lev_max => 200,
      break_min => 0, break_max => 1, pos => 1};
gift_item(35) ->
    #{id => 4, item_id => 22216, item_num => 1,
      classes => 0, sex => 2, lev_min => 1, lev_max => 200,
      break_min => 0, break_max => 1, pos => 2};
gift_item(36) ->
    #{id => 4, item_id => 22396, item_num => 1,
      classes => 0, sex => 2, lev_min => 1, lev_max => 200,
      break_min => 0, break_max => 1, pos => 2};
gift_item(37) ->
    #{id => 4, item_id => 21098, item_num => 4,
      classes => 0, sex => 2, lev_min => 1, lev_max => 200,
      break_min => 0, break_max => 1, pos => 2};
gift_item(38) ->
    #{id => 4, item_id => 90026, item_num => 100,
      classes => 0, sex => 2, lev_min => 1, lev_max => 200,
      break_min => 0, break_max => 1, pos => 3};
gift_item(39) ->
    #{id => 4, item_id => 90003, item_num => 5000,
      classes => 0, sex => 2, lev_min => 1, lev_max => 200,
      break_min => 0, break_max => 1, pos => 3};
gift_item(40) ->
    #{id => 4, item_id => 90000, item_num => 500000,
      classes => 0, sex => 2, lev_min => 1, lev_max => 200,
      break_min => 0, break_max => 1, pos => 3};
gift_item(41) ->
    #{id => 5, item_id => 20755, item_num => 1,
      classes => 0, sex => 2, lev_min => 1, lev_max => 200,
      break_min => 0, break_max => 1, pos => 1};
gift_item(42) ->
    #{id => 5, item_id => 20545, item_num => 3,
      classes => 0, sex => 2, lev_min => 1, lev_max => 200,
      break_min => 0, break_max => 1, pos => 1};
gift_item(43) ->
    #{id => 5, item_id => 20616, item_num => 1,
      classes => 0, sex => 2, lev_min => 1, lev_max => 200,
      break_min => 0, break_max => 1, pos => 1};
gift_item(44) ->
    #{id => 5, item_id => 22249, item_num => 2,
      classes => 0, sex => 2, lev_min => 1, lev_max => 200,
      break_min => 0, break_max => 1, pos => 2};
gift_item(45) ->
    #{id => 5, item_id => 22248, item_num => 1,
      classes => 0, sex => 2, lev_min => 1, lev_max => 200,
      break_min => 0, break_max => 1, pos => 2};
gift_item(46) ->
    #{id => 5, item_id => 20053, item_num => 1,
      classes => 0, sex => 2, lev_min => 1, lev_max => 200,
      break_min => 0, break_max => 1, pos => 2};
gift_item(47) ->
    #{id => 5, item_id => 90026, item_num => 100,
      classes => 0, sex => 2, lev_min => 1, lev_max => 200,
      break_min => 0, break_max => 1, pos => 3};
gift_item(48) ->
    #{id => 5, item_id => 90003, item_num => 5000,
      classes => 0, sex => 2, lev_min => 1, lev_max => 200,
      break_min => 0, break_max => 1, pos => 3};
gift_item(49) ->
    #{id => 5, item_id => 90000, item_num => 500000,
      classes => 0, sex => 2, lev_min => 1, lev_max => 200,
      break_min => 0, break_max => 1, pos => 3};
gift_item(50) ->
    #{id => 6, item_id => 29687, item_num => 1,
      classes => 0, sex => 2, lev_min => 1, lev_max => 200,
      break_min => 0, break_max => 1, pos => 1};
gift_item(51) ->
    #{id => 6, item_id => 70107, item_num => 1,
      classes => 0, sex => 2, lev_min => 1, lev_max => 200,
      break_min => 0, break_max => 1, pos => 1};
gift_item(52) ->
    #{id => 6, item_id => 21244, item_num => 2,
      classes => 0, sex => 2, lev_min => 1, lev_max => 89,
      break_min => 0, break_max => 1, pos => 2};
gift_item(53) ->
    #{id => 6, item_id => 21256, item_num => 1,
      classes => 0, sex => 2, lev_min => 90, lev_max => 200,
      break_min => 0, break_max => 1, pos => 2};
gift_item(54) ->
    #{id => 6, item_id => 23740, item_num => 1,
      classes => 0, sex => 2, lev_min => 1, lev_max => 200,
      break_min => 0, break_max => 1, pos => 2};
gift_item(55) ->
    #{id => 6, item_id => 22447, item_num => 1,
      classes => 0, sex => 2, lev_min => 1, lev_max => 200,
      break_min => 0, break_max => 1, pos => 2};
gift_item(56) ->
    #{id => 6, item_id => 90026, item_num => 100,
      classes => 0, sex => 2, lev_min => 1, lev_max => 200,
      break_min => 0, break_max => 1, pos => 3};
gift_item(57) ->
    #{id => 6, item_id => 90003, item_num => 5000,
      classes => 0, sex => 2, lev_min => 1, lev_max => 200,
      break_min => 0, break_max => 1, pos => 3};
gift_item(58) ->
    #{id => 6, item_id => 90000, item_num => 500000,
      classes => 0, sex => 2, lev_min => 1, lev_max => 200,
      break_min => 0, break_max => 1, pos => 3};
gift_item(59) ->
    #{id => 7, item_id => 20020, item_num => 5,
      classes => 0, sex => 2, lev_min => 1, lev_max => 89,
      break_min => 0, break_max => 1, pos => 1};
gift_item(60) ->
    #{id => 7, item_id => 22306, item_num => 1,
      classes => 0, sex => 2, lev_min => 90, lev_max => 200,
      break_min => 0, break_max => 1, pos => 1};
gift_item(61) ->
    #{id => 7, item_id => 20022, item_num => 1,
      classes => 0, sex => 2, lev_min => 1, lev_max => 200,
      break_min => 0, break_max => 1, pos => 1};
gift_item(62) ->
    #{id => 7, item_id => 22212, item_num => 1,
      classes => 0, sex => 2, lev_min => 1, lev_max => 200,
      break_min => 0, break_max => 1, pos => 1};
gift_item(63) ->
    #{id => 7, item_id => 22216, item_num => 1,
      classes => 0, sex => 2, lev_min => 1, lev_max => 200,
      break_min => 0, break_max => 1, pos => 2};
gift_item(64) ->
    #{id => 7, item_id => 22396, item_num => 1,
      classes => 0, sex => 2, lev_min => 1, lev_max => 200,
      break_min => 0, break_max => 1, pos => 2};
gift_item(65) ->
    #{id => 7, item_id => 21098, item_num => 4,
      classes => 0, sex => 2, lev_min => 1, lev_max => 200,
      break_min => 0, break_max => 1, pos => 2};
gift_item(66) ->
    #{id => 7, item_id => 90026, item_num => 100,
      classes => 0, sex => 2, lev_min => 1, lev_max => 200,
      break_min => 0, break_max => 1, pos => 3};
gift_item(67) ->
    #{id => 7, item_id => 90003, item_num => 5000,
      classes => 0, sex => 2, lev_min => 1, lev_max => 200,
      break_min => 0, break_max => 1, pos => 3};
gift_item(68) ->
    #{id => 7, item_id => 90000, item_num => 500000,
      classes => 0, sex => 2, lev_min => 1, lev_max => 200,
      break_min => 0, break_max => 1, pos => 3};
gift_item(69) ->
    #{id => 8, item_id => 20755, item_num => 1,
      classes => 0, sex => 2, lev_min => 1, lev_max => 200,
      break_min => 0, break_max => 1, pos => 1};
gift_item(70) ->
    #{id => 8, item_id => 20545, item_num => 3,
      classes => 0, sex => 2, lev_min => 1, lev_max => 200,
      break_min => 0, break_max => 1, pos => 1};
gift_item(71) ->
    #{id => 8, item_id => 20616, item_num => 1,
      classes => 0, sex => 2, lev_min => 1, lev_max => 200,
      break_min => 0, break_max => 1, pos => 1};
gift_item(72) ->
    #{id => 8, item_id => 22249, item_num => 2,
      classes => 0, sex => 2, lev_min => 1, lev_max => 200,
      break_min => 0, break_max => 1, pos => 2};
gift_item(73) ->
    #{id => 8, item_id => 22248, item_num => 1,
      classes => 0, sex => 2, lev_min => 1, lev_max => 200,
      break_min => 0, break_max => 1, pos => 2};
gift_item(74) ->
    #{id => 8, item_id => 20053, item_num => 1,
      classes => 0, sex => 2, lev_min => 1, lev_max => 200,
      break_min => 0, break_max => 1, pos => 2};
gift_item(75) ->
    #{id => 8, item_id => 90026, item_num => 100,
      classes => 0, sex => 2, lev_min => 1, lev_max => 200,
      break_min => 0, break_max => 1, pos => 3};
gift_item(76) ->
    #{id => 8, item_id => 90003, item_num => 5000,
      classes => 0, sex => 2, lev_min => 1, lev_max => 200,
      break_min => 0, break_max => 1, pos => 3};
gift_item(77) ->
    #{id => 8, item_id => 90000, item_num => 500000,
      classes => 0, sex => 2, lev_min => 1, lev_max => 200,
      break_min => 0, break_max => 1, pos => 3};
gift_item(78) ->
    #{id => 9, item_id => 70861, item_num => 1,
      classes => 1, sex => 2, lev_min => 1, lev_max => 200,
      break_min => 0, break_max => 1, pos => 1};
gift_item(79) ->
    #{id => 9, item_id => 70862, item_num => 1,
      classes => 2, sex => 2, lev_min => 1, lev_max => 200,
      break_min => 0, break_max => 1, pos => 1};
gift_item(80) ->
    #{id => 9, item_id => 70863, item_num => 1,
      classes => 3, sex => 2, lev_min => 1, lev_max => 200,
      break_min => 0, break_max => 1, pos => 1};
gift_item(81) ->
    #{id => 9, item_id => 70864, item_num => 1,
      classes => 4, sex => 2, lev_min => 1, lev_max => 200,
      break_min => 0, break_max => 1, pos => 1};
gift_item(82) ->
    #{id => 9, item_id => 70865, item_num => 1,
      classes => 5, sex => 2, lev_min => 1, lev_max => 200,
      break_min => 0, break_max => 1, pos => 1};
gift_item(83) ->
    #{id => 9, item_id => 70866, item_num => 1,
      classes => 6, sex => 2, lev_min => 1, lev_max => 200,
      break_min => 0, break_max => 1, pos => 1};
gift_item(84) ->
    #{id => 9, item_id => 70867, item_num => 1,
      classes => 7, sex => 2, lev_min => 1, lev_max => 200,
      break_min => 0, break_max => 1, pos => 1};
gift_item(85) ->
    #{id => 9, item_id => 70386, item_num => 1,
      classes => 1, sex => 2, lev_min => 1, lev_max => 200,
      break_min => 0, break_max => 1, pos => 1};
gift_item(86) ->
    #{id => 9, item_id => 70387, item_num => 1,
      classes => 2, sex => 2, lev_min => 1, lev_max => 200,
      break_min => 0, break_max => 1, pos => 1};
gift_item(87) ->
    #{id => 9, item_id => 70388, item_num => 1,
      classes => 3, sex => 2, lev_min => 1, lev_max => 200,
      break_min => 0, break_max => 1, pos => 1};
gift_item(88) ->
    #{id => 9, item_id => 70389, item_num => 1,
      classes => 4, sex => 2, lev_min => 1, lev_max => 200,
      break_min => 0, break_max => 1, pos => 1};
gift_item(89) ->
    #{id => 9, item_id => 70390, item_num => 1,
      classes => 5, sex => 2, lev_min => 1, lev_max => 200,
      break_min => 0, break_max => 1, pos => 1};
gift_item(90) ->
    #{id => 9, item_id => 70391, item_num => 1,
      classes => 6, sex => 2, lev_min => 1, lev_max => 200,
      break_min => 0, break_max => 1, pos => 1};
gift_item(91) ->
    #{id => 9, item_id => 70392, item_num => 1,
      classes => 7, sex => 2, lev_min => 1, lev_max => 200,
      break_min => 0, break_max => 1, pos => 1};
gift_item(92) ->
    #{id => 9, item_id => 21244, item_num => 2,
      classes => 0, sex => 2, lev_min => 1, lev_max => 89,
      break_min => 0, break_max => 1, pos => 2};
gift_item(93) ->
    #{id => 9, item_id => 21256, item_num => 1,
      classes => 0, sex => 2, lev_min => 90, lev_max => 200,
      break_min => 0, break_max => 1, pos => 2};
gift_item(94) ->
    #{id => 9, item_id => 23740, item_num => 1,
      classes => 0, sex => 2, lev_min => 1, lev_max => 200,
      break_min => 0, break_max => 1, pos => 2};
gift_item(95) ->
    #{id => 9, item_id => 22447, item_num => 1,
      classes => 0, sex => 2, lev_min => 1, lev_max => 200,
      break_min => 0, break_max => 1, pos => 2};
gift_item(96) ->
    #{id => 9, item_id => 90026, item_num => 100,
      classes => 0, sex => 2, lev_min => 1, lev_max => 200,
      break_min => 0, break_max => 1, pos => 3};
gift_item(97) ->
    #{id => 9, item_id => 90003, item_num => 5000,
      classes => 0, sex => 2, lev_min => 1, lev_max => 200,
      break_min => 0, break_max => 1, pos => 3};
gift_item(98) ->
    #{id => 9, item_id => 90000, item_num => 500000,
      classes => 0, sex => 2, lev_min => 1, lev_max => 200,
      break_min => 0, break_max => 1, pos => 3};
gift_item(_) -> false.

gift_items(1) -> [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
gift_items(2) -> [11, 12, 13, 14, 15, 16, 17, 18, 19];
gift_items(3) ->
    [20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30];
gift_items(4) ->
    [31, 32, 33, 34, 35, 36, 37, 38, 39, 40];
gift_items(5) -> [41, 42, 43, 44, 45, 46, 47, 48, 49];
gift_items(6) -> [50, 51, 52, 53, 54, 55, 56, 57, 58];
gift_items(7) ->
    [59, 60, 61, 62, 63, 64, 65, 66, 67, 68];
gift_items(8) -> [69, 70, 71, 72, 73, 74, 75, 76, 77];
gift_items(9) ->
    [78,
     79,
     80,
     81,
     82,
     83,
     84,
     85,
     86,
     87,
     88,
     89,
     90,
     91,
     92,
     93,
     94,
     95,
     96,
     97,
     98];
gift_items(_) -> false.

extra_reward() ->
    [#{need_gift => [1, 2, 3], reward => [{23740, 1}]},
     #{need_gift => [4, 5, 6], reward => [{23740, 1}]},
     #{need_gift => [7, 8, 9], reward => [{23740, 1}]}].

get_key_val(1) ->
    #{id => 1, val_txt1 => lang:get("已达购买上限，无法再购买")};
get_key_val(2) ->
    #{id => 2, val_txt1 => lang:get("定制礼包"),
      val_txt2 => lang:get("亲爱的玩家，由于您的背包已满，奖励通过邮件发放")};
get_key_val(3) ->
    #{id => 3, val_txt1 => lang:get("定制礼包额外奖励"),
      val_txt2 => lang:get("亲爱的玩家，这是您在定制选购活动中额外获得的奖励，请查收")};
get_key_val(_) -> false.

