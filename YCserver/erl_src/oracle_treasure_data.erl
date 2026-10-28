-file("src/data/oracle_treasure_data.erl", 1).

-module(oracle_treasure_data).

-export([get_unit_info/1,
         get_attr_rate/1,
         get_card/1,
         get_wave_info/1,
         get_rank_reward/1,
         get_all_units/0,
         get_show_star/1]).

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

-file("src/data/oracle_treasure_data.erl", 22).

get_unit_info({32027, 1}) ->
    #{index => 32027, star => 1, offer => 8, stage => 1,
      unit_id => 32027, map_x => 2212, map_y => 255};
get_unit_info({32027, 2}) ->
    #{index => 32027, star => 2, offer => 8, stage => 1,
      unit_id => 32027, map_x => 2212, map_y => 255};
get_unit_info({32027, 3}) ->
    #{index => 32027, star => 3, offer => 8, stage => 1,
      unit_id => 32027, map_x => 2212, map_y => 255};
get_unit_info({32027, 4}) ->
    #{index => 32027, star => 4, offer => 8, stage => 1,
      unit_id => 32027, map_x => 2212, map_y => 255};
get_unit_info({32027, 5}) ->
    #{index => 32027, star => 5, offer => 8, stage => 1,
      unit_id => 32027, map_x => 2212, map_y => 255};
get_unit_info({32030, 1}) ->
    #{index => 32030, star => 1, offer => 8, stage => 1,
      unit_id => 32030, map_x => 412, map_y => 1061};
get_unit_info({32030, 2}) ->
    #{index => 32030, star => 2, offer => 8, stage => 1,
      unit_id => 32030, map_x => 412, map_y => 1061};
get_unit_info({32030, 3}) ->
    #{index => 32030, star => 3, offer => 8, stage => 1,
      unit_id => 32030, map_x => 412, map_y => 1061};
get_unit_info({32030, 4}) ->
    #{index => 32030, star => 4, offer => 8, stage => 1,
      unit_id => 32030, map_x => 412, map_y => 1061};
get_unit_info({32030, 5}) ->
    #{index => 32030, star => 5, offer => 8, stage => 1,
      unit_id => 32030, map_x => 412, map_y => 1061};
get_unit_info({32028, 1}) ->
    #{index => 32028, star => 1, offer => 8, stage => 1,
      unit_id => 32028, map_x => 2291, map_y => 1110};
get_unit_info({32028, 2}) ->
    #{index => 32028, star => 2, offer => 8, stage => 1,
      unit_id => 32028, map_x => 2291, map_y => 1110};
get_unit_info({32028, 3}) ->
    #{index => 32028, star => 3, offer => 8, stage => 1,
      unit_id => 32028, map_x => 2291, map_y => 1110};
get_unit_info({32028, 4}) ->
    #{index => 32028, star => 4, offer => 8, stage => 1,
      unit_id => 32028, map_x => 2291, map_y => 1110};
get_unit_info({32028, 5}) ->
    #{index => 32028, star => 5, offer => 8, stage => 1,
      unit_id => 32028, map_x => 2291, map_y => 1110};
get_unit_info({32029, 1}) ->
    #{index => 32029, star => 1, offer => 8, stage => 1,
      unit_id => 32029, map_x => 506, map_y => 183};
get_unit_info({32029, 2}) ->
    #{index => 32029, star => 2, offer => 8, stage => 1,
      unit_id => 32029, map_x => 506, map_y => 183};
get_unit_info({32029, 3}) ->
    #{index => 32029, star => 3, offer => 8, stage => 1,
      unit_id => 32029, map_x => 506, map_y => 183};
get_unit_info({32029, 4}) ->
    #{index => 32029, star => 4, offer => 8, stage => 1,
      unit_id => 32029, map_x => 506, map_y => 183};
get_unit_info({32029, 5}) ->
    #{index => 32029, star => 5, offer => 8, stage => 1,
      unit_id => 32029, map_x => 506, map_y => 183};
get_unit_info({32031, 1}) ->
    #{index => 32031, star => 1, offer => 10, stage => 2,
      unit_id => 32031, map_x => 1366, map_y => 683};
get_unit_info(_) -> false.

get_attr_rate({32027, 0}) -> 1000;
get_attr_rate({32027, 1}) -> 1020;
get_attr_rate({32027, 2}) -> 1040;
get_attr_rate({32027, 3}) -> 1060;
get_attr_rate({32027, 4}) -> 1080;
get_attr_rate({32027, 5}) -> 1100;
get_attr_rate({32027, 6}) -> 1120;
get_attr_rate({32027, 7}) -> 1140;
get_attr_rate({32027, 8}) -> 1160;
get_attr_rate({32027, 9}) -> 1180;
get_attr_rate({32027, 10}) -> 1200;
get_attr_rate({32027, 11}) -> 1220;
get_attr_rate({32027, 12}) -> 1240;
get_attr_rate({32027, 13}) -> 1260;
get_attr_rate({32027, 14}) -> 1280;
get_attr_rate({32027, 15}) -> 1300;
get_attr_rate({32027, 16}) -> 1350;
get_attr_rate({32027, 17}) -> 1400;
get_attr_rate({32027, 18}) -> 1440;
get_attr_rate({32027, 19}) -> 1470;
get_attr_rate({32027, 20}) -> 1500;
get_attr_rate({32027, 21}) -> 1525;
get_attr_rate({32027, 22}) -> 1550;
get_attr_rate({32027, 23}) -> 1575;
get_attr_rate({32027, 24}) -> 1600;
get_attr_rate({32027, 25}) -> 1625;
get_attr_rate({32027, 26}) -> 1650;
get_attr_rate({32027, 27}) -> 1675;
get_attr_rate({32027, 28}) -> 1700;
get_attr_rate({32027, 29}) -> 1725;
get_attr_rate({32027, 30}) -> 1750;
get_attr_rate({32027, 31}) -> 1775;
get_attr_rate({32027, 32}) -> 1800;
get_attr_rate({32027, 33}) -> 1825;
get_attr_rate({32027, 34}) -> 1850;
get_attr_rate({32027, 35}) -> 1875;
get_attr_rate({32027, 36}) -> 1900;
get_attr_rate({32027, 37}) -> 1925;
get_attr_rate({32027, 38}) -> 1950;
get_attr_rate({32027, 39}) -> 1975;
get_attr_rate({32027, 40}) -> 2000;
get_attr_rate({32030, 0}) -> 1000;
get_attr_rate({32030, 1}) -> 1020;
get_attr_rate({32030, 2}) -> 1040;
get_attr_rate({32030, 3}) -> 1060;
get_attr_rate({32030, 4}) -> 1080;
get_attr_rate({32030, 5}) -> 1100;
get_attr_rate({32030, 6}) -> 1120;
get_attr_rate({32030, 7}) -> 1140;
get_attr_rate({32030, 8}) -> 1160;
get_attr_rate({32030, 9}) -> 1180;
get_attr_rate({32030, 10}) -> 1200;
get_attr_rate({32030, 11}) -> 1220;
get_attr_rate({32030, 12}) -> 1240;
get_attr_rate({32030, 13}) -> 1260;
get_attr_rate({32030, 14}) -> 1280;
get_attr_rate({32030, 15}) -> 1300;
get_attr_rate({32030, 16}) -> 1350;
get_attr_rate({32030, 17}) -> 1400;
get_attr_rate({32030, 18}) -> 1440;
get_attr_rate({32030, 19}) -> 1470;
get_attr_rate({32030, 20}) -> 1500;
get_attr_rate({32030, 21}) -> 1525;
get_attr_rate({32030, 22}) -> 1550;
get_attr_rate({32030, 23}) -> 1575;
get_attr_rate({32030, 24}) -> 1600;
get_attr_rate({32030, 25}) -> 1625;
get_attr_rate({32030, 26}) -> 1650;
get_attr_rate({32030, 27}) -> 1675;
get_attr_rate({32030, 28}) -> 1700;
get_attr_rate({32030, 29}) -> 1725;
get_attr_rate({32030, 30}) -> 1750;
get_attr_rate({32030, 31}) -> 1775;
get_attr_rate({32030, 32}) -> 1800;
get_attr_rate({32030, 33}) -> 1825;
get_attr_rate({32030, 34}) -> 1850;
get_attr_rate({32030, 35}) -> 1875;
get_attr_rate({32030, 36}) -> 1900;
get_attr_rate({32030, 37}) -> 1925;
get_attr_rate({32030, 38}) -> 1950;
get_attr_rate({32030, 39}) -> 1975;
get_attr_rate({32030, 40}) -> 2000;
get_attr_rate({32028, 0}) -> 1000;
get_attr_rate({32028, 1}) -> 1020;
get_attr_rate({32028, 2}) -> 1040;
get_attr_rate({32028, 3}) -> 1060;
get_attr_rate({32028, 4}) -> 1080;
get_attr_rate({32028, 5}) -> 1100;
get_attr_rate({32028, 6}) -> 1120;
get_attr_rate({32028, 7}) -> 1140;
get_attr_rate({32028, 8}) -> 1160;
get_attr_rate({32028, 9}) -> 1180;
get_attr_rate({32028, 10}) -> 1200;
get_attr_rate({32028, 11}) -> 1220;
get_attr_rate({32028, 12}) -> 1240;
get_attr_rate({32028, 13}) -> 1260;
get_attr_rate({32028, 14}) -> 1280;
get_attr_rate({32028, 15}) -> 1300;
get_attr_rate({32028, 16}) -> 1350;
get_attr_rate({32028, 17}) -> 1400;
get_attr_rate({32028, 18}) -> 1440;
get_attr_rate({32028, 19}) -> 1470;
get_attr_rate({32028, 20}) -> 1500;
get_attr_rate({32028, 21}) -> 1525;
get_attr_rate({32028, 22}) -> 1550;
get_attr_rate({32028, 23}) -> 1575;
get_attr_rate({32028, 24}) -> 1600;
get_attr_rate({32028, 25}) -> 1625;
get_attr_rate({32028, 26}) -> 1650;
get_attr_rate({32028, 27}) -> 1675;
get_attr_rate({32028, 28}) -> 1700;
get_attr_rate({32028, 29}) -> 1725;
get_attr_rate({32028, 30}) -> 1750;
get_attr_rate({32028, 31}) -> 1775;
get_attr_rate({32028, 32}) -> 1800;
get_attr_rate({32028, 33}) -> 1825;
get_attr_rate({32028, 34}) -> 1850;
get_attr_rate({32028, 35}) -> 1875;
get_attr_rate({32028, 36}) -> 1900;
get_attr_rate({32028, 37}) -> 1925;
get_attr_rate({32028, 38}) -> 1950;
get_attr_rate({32028, 39}) -> 1975;
get_attr_rate({32028, 40}) -> 2000;
get_attr_rate({32029, 0}) -> 1000;
get_attr_rate({32029, 1}) -> 1020;
get_attr_rate({32029, 2}) -> 1040;
get_attr_rate({32029, 3}) -> 1060;
get_attr_rate({32029, 4}) -> 1080;
get_attr_rate({32029, 5}) -> 1100;
get_attr_rate({32029, 6}) -> 1120;
get_attr_rate({32029, 7}) -> 1140;
get_attr_rate({32029, 8}) -> 1160;
get_attr_rate({32029, 9}) -> 1180;
get_attr_rate({32029, 10}) -> 1200;
get_attr_rate({32029, 11}) -> 1220;
get_attr_rate({32029, 12}) -> 1240;
get_attr_rate({32029, 13}) -> 1260;
get_attr_rate({32029, 14}) -> 1280;
get_attr_rate({32029, 15}) -> 1300;
get_attr_rate({32029, 16}) -> 1350;
get_attr_rate({32029, 17}) -> 1400;
get_attr_rate({32029, 18}) -> 1440;
get_attr_rate({32029, 19}) -> 1470;
get_attr_rate({32029, 20}) -> 1500;
get_attr_rate({32029, 21}) -> 1525;
get_attr_rate({32029, 22}) -> 1550;
get_attr_rate({32029, 23}) -> 1575;
get_attr_rate({32029, 24}) -> 1600;
get_attr_rate({32029, 25}) -> 1625;
get_attr_rate({32029, 26}) -> 1650;
get_attr_rate({32029, 27}) -> 1675;
get_attr_rate({32029, 28}) -> 1700;
get_attr_rate({32029, 29}) -> 1725;
get_attr_rate({32029, 30}) -> 1750;
get_attr_rate({32029, 31}) -> 1775;
get_attr_rate({32029, 32}) -> 1800;
get_attr_rate({32029, 33}) -> 1825;
get_attr_rate({32029, 34}) -> 1850;
get_attr_rate({32029, 35}) -> 1875;
get_attr_rate({32029, 36}) -> 1900;
get_attr_rate({32029, 37}) -> 1925;
get_attr_rate({32029, 38}) -> 1950;
get_attr_rate({32029, 39}) -> 1975;
get_attr_rate({32029, 40}) -> 2000;
get_attr_rate({32031, 0}) -> 1000;
get_attr_rate(_) -> false.

get_card(32027) ->
    [#{base_id => 21220, num => 2,
       base_reward => [{22906, 5}], flag => 1, exp_mod => 3348,
       honor_id => 11510, rate => 80, show_rate => 100,
       is_notice => 0},
     #{base_id => 20034, num => 2,
       base_reward => [{22906, 5}], flag => 1, exp_mod => 3348,
       honor_id => 11510, rate => 60, show_rate => 100,
       is_notice => 0},
     #{base_id => 20002, num => 1,
       base_reward => [{22906, 5}], flag => 1, exp_mod => 3348,
       honor_id => 11510, rate => 55, show_rate => 100,
       is_notice => 0},
     #{base_id => 20000, num => 1,
       base_reward => [{22906, 5}], flag => 1, exp_mod => 3348,
       honor_id => 11510, rate => 50, show_rate => 100,
       is_notice => 0},
     #{base_id => 20025, num => 1,
       base_reward => [{22906, 5}], flag => 1, exp_mod => 3348,
       honor_id => 11510, rate => 50, show_rate => 100,
       is_notice => 0},
     #{base_id => 20020, num => 2,
       base_reward => [{22906, 5}], flag => 1, exp_mod => 3348,
       honor_id => 11510, rate => 50, show_rate => 100,
       is_notice => 0},
     #{base_id => 21420, num => 1,
       base_reward => [{22906, 5}], flag => 1, exp_mod => 3348,
       honor_id => 11510, rate => 230, show_rate => 100,
       is_notice => 0},
     #{base_id => 21421, num => 1,
       base_reward => [{22906, 5}], flag => 1, exp_mod => 3348,
       honor_id => 11510, rate => 150, show_rate => 100,
       is_notice => 0},
     #{base_id => 21422, num => 1,
       base_reward => [{22906, 5}], flag => 1, exp_mod => 3348,
       honor_id => 11510, rate => 60, show_rate => 100,
       is_notice => 0},
     #{base_id => 20046, num => 1,
       base_reward => [{22906, 5}], flag => 1, exp_mod => 3348,
       honor_id => 11510, rate => 30, show_rate => 100,
       is_notice => 1},
     #{base_id => 20087, num => 1,
       base_reward => [{22906, 5}], flag => 1, exp_mod => 3348,
       honor_id => 11510, rate => 80, show_rate => 100,
       is_notice => 1},
     #{base_id => 21100, num => 1,
       base_reward => [{22906, 5}], flag => 1, exp_mod => 3348,
       honor_id => 11510, rate => 80, show_rate => 100,
       is_notice => 1},
     #{base_id => 20095, num => 1,
       base_reward => [{22906, 5}], flag => 1, exp_mod => 3348,
       honor_id => 11510, rate => 10, show_rate => 100,
       is_notice => 1},
     #{base_id => 20075, num => 1,
       base_reward => [{22906, 5}], flag => 1, exp_mod => 3348,
       honor_id => 11510, rate => 10, show_rate => 100,
       is_notice => 1},
     #{base_id => 20616, num => 1,
       base_reward => [{22906, 5}], flag => 1, exp_mod => 3348,
       honor_id => 11510, rate => 5, show_rate => 100,
       is_notice => 1},
     #{base_id => 20014, num => 1,
       base_reward => [{22906, 5}], flag => 1, exp_mod => 3348,
       honor_id => 11510, rate => 2, show_rate => 100,
       is_notice => 1}];
get_card(32030) ->
    [#{base_id => 21220, num => 2,
       base_reward => [{22906, 5}], flag => 1, exp_mod => 3348,
       honor_id => 11513, rate => 80, show_rate => 100,
       is_notice => 0},
     #{base_id => 20034, num => 2,
       base_reward => [{22906, 5}], flag => 1, exp_mod => 3348,
       honor_id => 11513, rate => 60, show_rate => 100,
       is_notice => 0},
     #{base_id => 20002, num => 1,
       base_reward => [{22906, 5}], flag => 1, exp_mod => 3348,
       honor_id => 11513, rate => 55, show_rate => 100,
       is_notice => 0},
     #{base_id => 20000, num => 1,
       base_reward => [{22906, 5}], flag => 1, exp_mod => 3348,
       honor_id => 11513, rate => 50, show_rate => 100,
       is_notice => 0},
     #{base_id => 20025, num => 1,
       base_reward => [{22906, 5}], flag => 1, exp_mod => 3348,
       honor_id => 11513, rate => 50, show_rate => 100,
       is_notice => 0},
     #{base_id => 20020, num => 2,
       base_reward => [{22906, 5}], flag => 1, exp_mod => 3348,
       honor_id => 11513, rate => 50, show_rate => 100,
       is_notice => 0},
     #{base_id => 21420, num => 1,
       base_reward => [{22906, 5}], flag => 1, exp_mod => 3348,
       honor_id => 11513, rate => 230, show_rate => 100,
       is_notice => 0},
     #{base_id => 21421, num => 1,
       base_reward => [{22906, 5}], flag => 1, exp_mod => 3348,
       honor_id => 11513, rate => 150, show_rate => 100,
       is_notice => 0},
     #{base_id => 21422, num => 1,
       base_reward => [{22906, 5}], flag => 1, exp_mod => 3348,
       honor_id => 11513, rate => 60, show_rate => 100,
       is_notice => 0},
     #{base_id => 20046, num => 1,
       base_reward => [{22906, 5}], flag => 1, exp_mod => 3348,
       honor_id => 11513, rate => 30, show_rate => 100,
       is_notice => 1},
     #{base_id => 20087, num => 1,
       base_reward => [{22906, 5}], flag => 1, exp_mod => 3348,
       honor_id => 11513, rate => 80, show_rate => 100,
       is_notice => 1},
     #{base_id => 21100, num => 1,
       base_reward => [{22906, 5}], flag => 1, exp_mod => 3348,
       honor_id => 11513, rate => 80, show_rate => 100,
       is_notice => 1},
     #{base_id => 20095, num => 1,
       base_reward => [{22906, 5}], flag => 1, exp_mod => 3348,
       honor_id => 11513, rate => 10, show_rate => 100,
       is_notice => 1},
     #{base_id => 20075, num => 1,
       base_reward => [{22906, 5}], flag => 1, exp_mod => 3348,
       honor_id => 11513, rate => 10, show_rate => 100,
       is_notice => 1},
     #{base_id => 20616, num => 1,
       base_reward => [{22906, 5}], flag => 1, exp_mod => 3348,
       honor_id => 11513, rate => 5, show_rate => 100,
       is_notice => 1},
     #{base_id => 20014, num => 1,
       base_reward => [{22906, 5}], flag => 1, exp_mod => 3348,
       honor_id => 11513, rate => 2, show_rate => 100,
       is_notice => 1}];
get_card(32028) ->
    [#{base_id => 21220, num => 2,
       base_reward => [{22906, 5}], flag => 1, exp_mod => 3348,
       honor_id => 11512, rate => 80, show_rate => 100,
       is_notice => 0},
     #{base_id => 20034, num => 2,
       base_reward => [{22906, 5}], flag => 1, exp_mod => 3348,
       honor_id => 11512, rate => 60, show_rate => 100,
       is_notice => 0},
     #{base_id => 20002, num => 1,
       base_reward => [{22906, 5}], flag => 1, exp_mod => 3348,
       honor_id => 11512, rate => 55, show_rate => 100,
       is_notice => 0},
     #{base_id => 20000, num => 1,
       base_reward => [{22906, 5}], flag => 1, exp_mod => 3348,
       honor_id => 11512, rate => 50, show_rate => 100,
       is_notice => 0},
     #{base_id => 20025, num => 1,
       base_reward => [{22906, 5}], flag => 1, exp_mod => 3348,
       honor_id => 11512, rate => 50, show_rate => 100,
       is_notice => 0},
     #{base_id => 20020, num => 2,
       base_reward => [{22906, 5}], flag => 1, exp_mod => 3348,
       honor_id => 11512, rate => 50, show_rate => 100,
       is_notice => 0},
     #{base_id => 21420, num => 1,
       base_reward => [{22906, 5}], flag => 1, exp_mod => 3348,
       honor_id => 11512, rate => 230, show_rate => 100,
       is_notice => 0},
     #{base_id => 21421, num => 1,
       base_reward => [{22906, 5}], flag => 1, exp_mod => 3348,
       honor_id => 11512, rate => 150, show_rate => 100,
       is_notice => 0},
     #{base_id => 21422, num => 1,
       base_reward => [{22906, 5}], flag => 1, exp_mod => 3348,
       honor_id => 11512, rate => 60, show_rate => 100,
       is_notice => 0},
     #{base_id => 20046, num => 1,
       base_reward => [{22906, 5}], flag => 1, exp_mod => 3348,
       honor_id => 11512, rate => 30, show_rate => 100,
       is_notice => 1},
     #{base_id => 20087, num => 1,
       base_reward => [{22906, 5}], flag => 1, exp_mod => 3348,
       honor_id => 11512, rate => 80, show_rate => 100,
       is_notice => 1},
     #{base_id => 21100, num => 1,
       base_reward => [{22906, 5}], flag => 1, exp_mod => 3348,
       honor_id => 11512, rate => 80, show_rate => 100,
       is_notice => 1},
     #{base_id => 20095, num => 1,
       base_reward => [{22906, 5}], flag => 1, exp_mod => 3348,
       honor_id => 11512, rate => 10, show_rate => 100,
       is_notice => 1},
     #{base_id => 20075, num => 1,
       base_reward => [{22906, 5}], flag => 1, exp_mod => 3348,
       honor_id => 11512, rate => 10, show_rate => 100,
       is_notice => 1},
     #{base_id => 20616, num => 1,
       base_reward => [{22906, 5}], flag => 1, exp_mod => 3348,
       honor_id => 11512, rate => 5, show_rate => 100,
       is_notice => 1},
     #{base_id => 20014, num => 1,
       base_reward => [{22906, 5}], flag => 1, exp_mod => 3348,
       honor_id => 11512, rate => 2, show_rate => 100,
       is_notice => 1}];
get_card(32029) ->
    [#{base_id => 21220, num => 2,
       base_reward => [{22906, 5}], flag => 1, exp_mod => 3348,
       honor_id => 11511, rate => 80, show_rate => 100,
       is_notice => 0},
     #{base_id => 20034, num => 2,
       base_reward => [{22906, 5}], flag => 1, exp_mod => 3348,
       honor_id => 11511, rate => 60, show_rate => 100,
       is_notice => 0},
     #{base_id => 20002, num => 1,
       base_reward => [{22906, 5}], flag => 1, exp_mod => 3348,
       honor_id => 11511, rate => 55, show_rate => 100,
       is_notice => 0},
     #{base_id => 20000, num => 1,
       base_reward => [{22906, 5}], flag => 1, exp_mod => 3348,
       honor_id => 11511, rate => 50, show_rate => 100,
       is_notice => 0},
     #{base_id => 20025, num => 1,
       base_reward => [{22906, 5}], flag => 1, exp_mod => 3348,
       honor_id => 11511, rate => 50, show_rate => 100,
       is_notice => 0},
     #{base_id => 20020, num => 2,
       base_reward => [{22906, 5}], flag => 1, exp_mod => 3348,
       honor_id => 11511, rate => 50, show_rate => 100,
       is_notice => 0},
     #{base_id => 21420, num => 1,
       base_reward => [{22906, 5}], flag => 1, exp_mod => 3348,
       honor_id => 11511, rate => 230, show_rate => 100,
       is_notice => 0},
     #{base_id => 21421, num => 1,
       base_reward => [{22906, 5}], flag => 1, exp_mod => 3348,
       honor_id => 11511, rate => 150, show_rate => 100,
       is_notice => 0},
     #{base_id => 21422, num => 1,
       base_reward => [{22906, 5}], flag => 1, exp_mod => 3348,
       honor_id => 11511, rate => 60, show_rate => 100,
       is_notice => 0},
     #{base_id => 20046, num => 1,
       base_reward => [{22906, 5}], flag => 1, exp_mod => 3348,
       honor_id => 11511, rate => 30, show_rate => 100,
       is_notice => 1},
     #{base_id => 20087, num => 1,
       base_reward => [{22906, 5}], flag => 1, exp_mod => 3348,
       honor_id => 11511, rate => 80, show_rate => 100,
       is_notice => 1},
     #{base_id => 21100, num => 1,
       base_reward => [{22906, 5}], flag => 1, exp_mod => 3348,
       honor_id => 11511, rate => 80, show_rate => 100,
       is_notice => 1},
     #{base_id => 20095, num => 1,
       base_reward => [{22906, 5}], flag => 1, exp_mod => 3348,
       honor_id => 11511, rate => 10, show_rate => 100,
       is_notice => 1},
     #{base_id => 20075, num => 1,
       base_reward => [{22906, 5}], flag => 1, exp_mod => 3348,
       honor_id => 11511, rate => 10, show_rate => 100,
       is_notice => 1},
     #{base_id => 20616, num => 1,
       base_reward => [{22906, 5}], flag => 1, exp_mod => 3348,
       honor_id => 11511, rate => 5, show_rate => 100,
       is_notice => 1},
     #{base_id => 20014, num => 1,
       base_reward => [{22906, 5}], flag => 1, exp_mod => 3348,
       honor_id => 11511, rate => 2, show_rate => 100,
       is_notice => 1}];
get_card(_) -> [].

get_wave_info(1) ->
    #{wave => 1, unit_id => 32031, honor_id => 11514,
      exp_mod => 3362, item_reward => [{22901, 2}]};
get_wave_info(2) ->
    #{wave => 2, unit_id => 83012, honor_id => 11515,
      exp_mod => 3363, item_reward => [{22902, 3}]};
get_wave_info(3) ->
    #{wave => 3, unit_id => 83013, honor_id => 11516,
      exp_mod => 3364, item_reward => [{22903, 4}]};
get_wave_info(4) ->
    #{wave => 4, unit_id => 83015, honor_id => 11517,
      exp_mod => 3365, item_reward => [{22904, 5}]};
get_wave_info(5) ->
    #{wave => 5, unit_id => 83011, honor_id => 11518,
      exp_mod => 3366, item_reward => [{22905, 6}]};
get_wave_info(_) -> false.

get_rank_reward(Rank)
    when Rank >= 1 andalso Rank =< 10 ->
    [{24057, 1}];
get_rank_reward(_) -> [].

get_all_units() -> [32028, 32030, 32029, 32031, 32027].

get_show_star(Num)
    when Num >= 1000 andalso Num =< 1160 ->
    1;
get_show_star(Num)
    when Num >= 1180 andalso Num =< 1350 ->
    2;
get_show_star(Num)
    when Num >= 1360 andalso Num =< 1600 ->
    3;
get_show_star(Num)
    when Num >= 1610 andalso Num =< 1800 ->
    4;
get_show_star(Num)
    when Num >= 1810 andalso Num =< 2000 ->
    5;
get_show_star(Num)
    when Num >= 2010 andalso Num =< 10000 ->
    6;
get_show_star(_) -> false.

