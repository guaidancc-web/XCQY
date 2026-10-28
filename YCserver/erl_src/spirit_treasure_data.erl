-file("src/data/spirit_treasure_data.erl", 1).

-module(spirit_treasure_data).

-export([get_cross_list/1,
         get_group_list/1,
         get_cross_group/1,
         get_unit_info/1,
         get_attr_rate/1,
         get_card/1,
         get_wave_info/1,
         get_rank_reward/1,
         get_all_group/0,
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

-file("src/data/spirit_treasure_data.erl", 26).

get_cross_list({"local_center", 9000}) ->
    [#{plat_zone => {"local", 1}, group => 1},
     #{plat_zone => {"local", 2}, group => 1},
     #{plat_zone => {"local", 3}, group => 1},
     #{plat_zone => {"local", 4}, group => 1}];
get_cross_list({"dev_center", 9000}) ->
    [#{plat_zone => {"dev", 1}, group => 2},
     #{plat_zone => {"dev", 2}, group => 2}];
get_cross_list({"center", 9000}) ->
    [#{plat_zone => {"beta", 17}, group => 3},
     #{plat_zone => {"beta", 33}, group => 3},
     #{plat_zone => {"mix", 49}, group => 30},
     #{plat_zone => {"mix", 1}, group => 30},
     #{plat_zone => {"unite", 1}, group => 52},
     #{plat_zone => {"unite", 65}, group => 52},
     #{plat_zone => {"mix", 113}, group => 53},
     #{plat_zone => {"mix", 177}, group => 53},
     #{plat_zone => {"mix", 241}, group => 60},
     #{plat_zone => {"unite", 129}, group => 60},
     #{plat_zone => {"mix", 305}, group => 44},
     #{plat_zone => {"unite", 225}, group => 44},
     #{plat_zone => {"mix", 337}, group => 54},
     #{plat_zone => {"unite", 257}, group => 54},
     #{plat_zone => {"unite", 289}, group => 45},
     #{plat_zone => {"unite", 305}, group => 45},
     #{plat_zone => {"unite", 321}, group => 59},
     #{plat_zone => {"unite", 329}, group => 59},
     #{plat_zone => {"mix", 385}, group => 41},
     #{plat_zone => {"unite", 337}, group => 41},
     #{plat_zone => {"mix", 393}, group => 66},
     #{plat_zone => {"unite", 345}, group => 66},
     #{plat_zone => {"mix", 401}, group => 56},
     #{plat_zone => {"unite", 357}, group => 56},
     #{plat_zone => {"unite", 359}, group => 70},
     #{plat_zone => {"unite", 361}, group => 70},
     #{plat_zone => {"mix", 405}, group => 71},
     #{plat_zone => {"unite", 363}, group => 71},
     #{plat_zone => {"mix", 409}, group => 65},
     #{plat_zone => {"unite", 365}, group => 65},
     #{plat_zone => {"mix", 411}, group => 67},
     #{plat_zone => {"unite", 367}, group => 67},
     #{plat_zone => {"mix", 413}, group => 69},
     #{plat_zone => {"unite", 369}, group => 69},
     #{plat_zone => {"mix", 415}, group => 72},
     #{plat_zone => {"unite", 371}, group => 72},
     #{plat_zone => {"mix", 416}, group => 73},
     #{plat_zone => {"unite", 372}, group => 73},
     #{plat_zone => {"mix", 417}, group => 74},
     #{plat_zone => {"unite", 373}, group => 74},
     #{plat_zone => {"mix", 418}, group => 75},
     #{plat_zone => {"unite", 374}, group => 75}];
get_cross_list(_) -> [].

get_group_list({{"local_center", 9000}, 1}) ->
    [{"local", 1},
     {"local", 2},
     {"local", 3},
     {"local", 4}];
get_group_list({{"dev_center", 9000}, 2}) ->
    [{"dev", 1}, {"dev", 2}];
get_group_list({{"center", 9000}, 3}) ->
    [{"beta", 17}, {"beta", 33}];
get_group_list({{"center", 9000}, 30}) ->
    [{"mix", 49}, {"mix", 1}];
get_group_list({{"center", 9000}, 52}) ->
    [{"unite", 1}, {"unite", 65}];
get_group_list({{"center", 9000}, 53}) ->
    [{"mix", 113}, {"mix", 177}];
get_group_list({{"center", 9000}, 60}) ->
    [{"mix", 241}, {"unite", 129}];
get_group_list({{"center", 9000}, 44}) ->
    [{"mix", 305}, {"unite", 225}];
get_group_list({{"center", 9000}, 54}) ->
    [{"mix", 337}, {"unite", 257}];
get_group_list({{"center", 9000}, 45}) ->
    [{"unite", 289}, {"unite", 305}];
get_group_list({{"center", 9000}, 59}) ->
    [{"unite", 321}, {"unite", 329}];
get_group_list({{"center", 9000}, 41}) ->
    [{"mix", 385}, {"unite", 337}];
get_group_list({{"center", 9000}, 66}) ->
    [{"mix", 393}, {"unite", 345}];
get_group_list({{"center", 9000}, 56}) ->
    [{"mix", 401}, {"unite", 357}];
get_group_list({{"center", 9000}, 70}) ->
    [{"unite", 359}, {"unite", 361}];
get_group_list({{"center", 9000}, 71}) ->
    [{"mix", 405}, {"unite", 363}];
get_group_list({{"center", 9000}, 65}) ->
    [{"mix", 409}, {"unite", 365}];
get_group_list({{"center", 9000}, 67}) ->
    [{"mix", 411}, {"unite", 367}];
get_group_list({{"center", 9000}, 69}) ->
    [{"mix", 413}, {"unite", 369}];
get_group_list({{"center", 9000}, 72}) ->
    [{"mix", 415}, {"unite", 371}];
get_group_list({{"center", 9000}, 73}) ->
    [{"mix", 416}, {"unite", 372}];
get_group_list({{"center", 9000}, 74}) ->
    [{"mix", 417}, {"unite", 373}];
get_group_list({{"center", 9000}, 75}) ->
    [{"mix", 418}, {"unite", 374}];
get_group_list(_) -> [].

get_cross_group({"local", 1}) -> 1;
get_cross_group({"local", 2}) -> 1;
get_cross_group({"local", 3}) -> 1;
get_cross_group({"local", 4}) -> 1;
get_cross_group({"dev", 1}) -> 2;
get_cross_group({"dev", 2}) -> 2;
get_cross_group({"beta", 17}) -> 3;
get_cross_group({"beta", 33}) -> 3;
get_cross_group({"mix", 49}) -> 30;
get_cross_group({"mix", 1}) -> 30;
get_cross_group({"unite", 1}) -> 52;
get_cross_group({"unite", 65}) -> 52;
get_cross_group({"mix", 113}) -> 53;
get_cross_group({"mix", 177}) -> 53;
get_cross_group({"mix", 241}) -> 60;
get_cross_group({"unite", 129}) -> 60;
get_cross_group({"mix", 305}) -> 44;
get_cross_group({"unite", 225}) -> 44;
get_cross_group({"mix", 337}) -> 54;
get_cross_group({"unite", 257}) -> 54;
get_cross_group({"unite", 289}) -> 45;
get_cross_group({"unite", 305}) -> 45;
get_cross_group({"unite", 321}) -> 59;
get_cross_group({"unite", 329}) -> 59;
get_cross_group({"mix", 385}) -> 41;
get_cross_group({"unite", 337}) -> 41;
get_cross_group({"mix", 393}) -> 66;
get_cross_group({"unite", 345}) -> 66;
get_cross_group({"mix", 401}) -> 56;
get_cross_group({"unite", 357}) -> 56;
get_cross_group({"unite", 359}) -> 70;
get_cross_group({"unite", 361}) -> 70;
get_cross_group({"mix", 405}) -> 71;
get_cross_group({"unite", 363}) -> 71;
get_cross_group({"mix", 409}) -> 65;
get_cross_group({"unite", 365}) -> 65;
get_cross_group({"mix", 411}) -> 67;
get_cross_group({"unite", 367}) -> 67;
get_cross_group({"mix", 413}) -> 69;
get_cross_group({"unite", 369}) -> 69;
get_cross_group({"mix", 415}) -> 72;
get_cross_group({"unite", 371}) -> 72;
get_cross_group({"mix", 416}) -> 73;
get_cross_group({"unite", 372}) -> 73;
get_cross_group({"mix", 417}) -> 74;
get_cross_group({"unite", 373}) -> 74;
get_cross_group({"mix", 418}) -> 75;
get_cross_group({"unite", 374}) -> 75;
get_cross_group(_) -> 0.

get_unit_info({32000, 1}) ->
    #{index => 32000, star => 1, offer => 8, stage => 1,
      unit_id => 32000, map_x => 2212, map_y => 255};
get_unit_info({32000, 2}) ->
    #{index => 32000, star => 2, offer => 8, stage => 1,
      unit_id => 32000, map_x => 2212, map_y => 255};
get_unit_info({32000, 3}) ->
    #{index => 32000, star => 3, offer => 8, stage => 1,
      unit_id => 32000, map_x => 2212, map_y => 255};
get_unit_info({32000, 4}) ->
    #{index => 32000, star => 4, offer => 8, stage => 1,
      unit_id => 32000, map_x => 2212, map_y => 255};
get_unit_info({32000, 5}) ->
    #{index => 32000, star => 5, offer => 8, stage => 1,
      unit_id => 32000, map_x => 2212, map_y => 255};
get_unit_info({32001, 1}) ->
    #{index => 32001, star => 1, offer => 8, stage => 1,
      unit_id => 32001, map_x => 412, map_y => 1061};
get_unit_info({32001, 2}) ->
    #{index => 32001, star => 2, offer => 8, stage => 1,
      unit_id => 32001, map_x => 412, map_y => 1061};
get_unit_info({32001, 3}) ->
    #{index => 32001, star => 3, offer => 8, stage => 1,
      unit_id => 32001, map_x => 412, map_y => 1061};
get_unit_info({32001, 4}) ->
    #{index => 32001, star => 4, offer => 8, stage => 1,
      unit_id => 32001, map_x => 412, map_y => 1061};
get_unit_info({32001, 5}) ->
    #{index => 32001, star => 5, offer => 8, stage => 1,
      unit_id => 32001, map_x => 412, map_y => 1061};
get_unit_info({32002, 1}) ->
    #{index => 32002, star => 1, offer => 8, stage => 1,
      unit_id => 32002, map_x => 506, map_y => 183};
get_unit_info({32002, 2}) ->
    #{index => 32002, star => 2, offer => 8, stage => 1,
      unit_id => 32002, map_x => 506, map_y => 183};
get_unit_info({32002, 3}) ->
    #{index => 32002, star => 3, offer => 8, stage => 1,
      unit_id => 32002, map_x => 506, map_y => 183};
get_unit_info({32002, 4}) ->
    #{index => 32002, star => 4, offer => 8, stage => 1,
      unit_id => 32002, map_x => 506, map_y => 183};
get_unit_info({32002, 5}) ->
    #{index => 32002, star => 5, offer => 8, stage => 1,
      unit_id => 32002, map_x => 506, map_y => 183};
get_unit_info({32003, 1}) ->
    #{index => 32003, star => 1, offer => 8, stage => 1,
      unit_id => 32003, map_x => 2291, map_y => 1110};
get_unit_info({32003, 2}) ->
    #{index => 32003, star => 2, offer => 8, stage => 1,
      unit_id => 32003, map_x => 2291, map_y => 1110};
get_unit_info({32003, 3}) ->
    #{index => 32003, star => 3, offer => 8, stage => 1,
      unit_id => 32003, map_x => 2291, map_y => 1110};
get_unit_info({32003, 4}) ->
    #{index => 32003, star => 4, offer => 8, stage => 1,
      unit_id => 32003, map_x => 2291, map_y => 1110};
get_unit_info({32003, 5}) ->
    #{index => 32003, star => 5, offer => 8, stage => 1,
      unit_id => 32003, map_x => 2291, map_y => 1110};
get_unit_info({32004, 1}) ->
    #{index => 32004, star => 1, offer => 10, stage => 2,
      unit_id => 32004, map_x => 1366, map_y => 683};
get_unit_info(_) -> false.

get_attr_rate({32000, 0}) -> 1000;
get_attr_rate({32000, 1}) -> 1020;
get_attr_rate({32000, 2}) -> 1040;
get_attr_rate({32000, 3}) -> 1060;
get_attr_rate({32000, 4}) -> 1080;
get_attr_rate({32000, 5}) -> 1100;
get_attr_rate({32000, 6}) -> 1120;
get_attr_rate({32000, 7}) -> 1140;
get_attr_rate({32000, 8}) -> 1160;
get_attr_rate({32000, 9}) -> 1180;
get_attr_rate({32000, 10}) -> 1200;
get_attr_rate({32000, 11}) -> 1220;
get_attr_rate({32000, 12}) -> 1240;
get_attr_rate({32000, 13}) -> 1260;
get_attr_rate({32000, 14}) -> 1280;
get_attr_rate({32000, 15}) -> 1300;
get_attr_rate({32000, 16}) -> 1350;
get_attr_rate({32000, 17}) -> 1400;
get_attr_rate({32000, 18}) -> 1440;
get_attr_rate({32000, 19}) -> 1470;
get_attr_rate({32000, 20}) -> 1500;
get_attr_rate({32000, 21}) -> 1525;
get_attr_rate({32000, 22}) -> 1550;
get_attr_rate({32000, 23}) -> 1575;
get_attr_rate({32000, 24}) -> 1600;
get_attr_rate({32000, 25}) -> 1625;
get_attr_rate({32000, 26}) -> 1650;
get_attr_rate({32000, 27}) -> 1675;
get_attr_rate({32000, 28}) -> 1700;
get_attr_rate({32000, 29}) -> 1725;
get_attr_rate({32000, 30}) -> 1750;
get_attr_rate({32000, 31}) -> 1775;
get_attr_rate({32000, 32}) -> 1800;
get_attr_rate({32000, 33}) -> 1825;
get_attr_rate({32000, 34}) -> 1850;
get_attr_rate({32000, 35}) -> 1875;
get_attr_rate({32000, 36}) -> 1900;
get_attr_rate({32000, 37}) -> 1925;
get_attr_rate({32000, 38}) -> 1950;
get_attr_rate({32000, 39}) -> 1975;
get_attr_rate({32000, 40}) -> 2000;
get_attr_rate({32001, 0}) -> 1000;
get_attr_rate({32001, 1}) -> 1020;
get_attr_rate({32001, 2}) -> 1040;
get_attr_rate({32001, 3}) -> 1060;
get_attr_rate({32001, 4}) -> 1080;
get_attr_rate({32001, 5}) -> 1100;
get_attr_rate({32001, 6}) -> 1120;
get_attr_rate({32001, 7}) -> 1140;
get_attr_rate({32001, 8}) -> 1160;
get_attr_rate({32001, 9}) -> 1180;
get_attr_rate({32001, 10}) -> 1200;
get_attr_rate({32001, 11}) -> 1220;
get_attr_rate({32001, 12}) -> 1240;
get_attr_rate({32001, 13}) -> 1260;
get_attr_rate({32001, 14}) -> 1280;
get_attr_rate({32001, 15}) -> 1300;
get_attr_rate({32001, 16}) -> 1350;
get_attr_rate({32001, 17}) -> 1400;
get_attr_rate({32001, 18}) -> 1440;
get_attr_rate({32001, 19}) -> 1470;
get_attr_rate({32001, 20}) -> 1500;
get_attr_rate({32001, 21}) -> 1525;
get_attr_rate({32001, 22}) -> 1550;
get_attr_rate({32001, 23}) -> 1575;
get_attr_rate({32001, 24}) -> 1600;
get_attr_rate({32001, 25}) -> 1625;
get_attr_rate({32001, 26}) -> 1650;
get_attr_rate({32001, 27}) -> 1675;
get_attr_rate({32001, 28}) -> 1700;
get_attr_rate({32001, 29}) -> 1725;
get_attr_rate({32001, 30}) -> 1750;
get_attr_rate({32001, 31}) -> 1775;
get_attr_rate({32001, 32}) -> 1800;
get_attr_rate({32001, 33}) -> 1825;
get_attr_rate({32001, 34}) -> 1850;
get_attr_rate({32001, 35}) -> 1875;
get_attr_rate({32001, 36}) -> 1900;
get_attr_rate({32001, 37}) -> 1925;
get_attr_rate({32001, 38}) -> 1950;
get_attr_rate({32001, 39}) -> 1975;
get_attr_rate({32001, 40}) -> 2000;
get_attr_rate({32002, 0}) -> 1000;
get_attr_rate({32002, 1}) -> 1020;
get_attr_rate({32002, 2}) -> 1040;
get_attr_rate({32002, 3}) -> 1060;
get_attr_rate({32002, 4}) -> 1080;
get_attr_rate({32002, 5}) -> 1100;
get_attr_rate({32002, 6}) -> 1120;
get_attr_rate({32002, 7}) -> 1140;
get_attr_rate({32002, 8}) -> 1160;
get_attr_rate({32002, 9}) -> 1180;
get_attr_rate({32002, 10}) -> 1200;
get_attr_rate({32002, 11}) -> 1220;
get_attr_rate({32002, 12}) -> 1240;
get_attr_rate({32002, 13}) -> 1260;
get_attr_rate({32002, 14}) -> 1280;
get_attr_rate({32002, 15}) -> 1300;
get_attr_rate({32002, 16}) -> 1350;
get_attr_rate({32002, 17}) -> 1400;
get_attr_rate({32002, 18}) -> 1440;
get_attr_rate({32002, 19}) -> 1470;
get_attr_rate({32002, 20}) -> 1500;
get_attr_rate({32002, 21}) -> 1525;
get_attr_rate({32002, 22}) -> 1550;
get_attr_rate({32002, 23}) -> 1575;
get_attr_rate({32002, 24}) -> 1600;
get_attr_rate({32002, 25}) -> 1625;
get_attr_rate({32002, 26}) -> 1650;
get_attr_rate({32002, 27}) -> 1675;
get_attr_rate({32002, 28}) -> 1700;
get_attr_rate({32002, 29}) -> 1725;
get_attr_rate({32002, 30}) -> 1750;
get_attr_rate({32002, 31}) -> 1775;
get_attr_rate({32002, 32}) -> 1800;
get_attr_rate({32002, 33}) -> 1825;
get_attr_rate({32002, 34}) -> 1850;
get_attr_rate({32002, 35}) -> 1875;
get_attr_rate({32002, 36}) -> 1900;
get_attr_rate({32002, 37}) -> 1925;
get_attr_rate({32002, 38}) -> 1950;
get_attr_rate({32002, 39}) -> 1975;
get_attr_rate({32002, 40}) -> 2000;
get_attr_rate({32003, 0}) -> 1000;
get_attr_rate({32003, 1}) -> 1020;
get_attr_rate({32003, 2}) -> 1040;
get_attr_rate({32003, 3}) -> 1060;
get_attr_rate({32003, 4}) -> 1080;
get_attr_rate({32003, 5}) -> 1100;
get_attr_rate({32003, 6}) -> 1120;
get_attr_rate({32003, 7}) -> 1140;
get_attr_rate({32003, 8}) -> 1160;
get_attr_rate({32003, 9}) -> 1180;
get_attr_rate({32003, 10}) -> 1200;
get_attr_rate({32003, 11}) -> 1220;
get_attr_rate({32003, 12}) -> 1240;
get_attr_rate({32003, 13}) -> 1260;
get_attr_rate({32003, 14}) -> 1280;
get_attr_rate({32003, 15}) -> 1300;
get_attr_rate({32003, 16}) -> 1350;
get_attr_rate({32003, 17}) -> 1400;
get_attr_rate({32003, 18}) -> 1440;
get_attr_rate({32003, 19}) -> 1470;
get_attr_rate({32003, 20}) -> 1500;
get_attr_rate({32003, 21}) -> 1525;
get_attr_rate({32003, 22}) -> 1550;
get_attr_rate({32003, 23}) -> 1575;
get_attr_rate({32003, 24}) -> 1600;
get_attr_rate({32003, 25}) -> 1625;
get_attr_rate({32003, 26}) -> 1650;
get_attr_rate({32003, 27}) -> 1675;
get_attr_rate({32003, 28}) -> 1700;
get_attr_rate({32003, 29}) -> 1725;
get_attr_rate({32003, 30}) -> 1750;
get_attr_rate({32003, 31}) -> 1775;
get_attr_rate({32003, 32}) -> 1800;
get_attr_rate({32003, 33}) -> 1825;
get_attr_rate({32003, 34}) -> 1850;
get_attr_rate({32003, 35}) -> 1875;
get_attr_rate({32003, 36}) -> 1900;
get_attr_rate({32003, 37}) -> 1925;
get_attr_rate({32003, 38}) -> 1950;
get_attr_rate({32003, 39}) -> 1975;
get_attr_rate({32003, 40}) -> 2000;
get_attr_rate({32004, 0}) -> 1000;
get_attr_rate(_) -> false.

get_card(32000) ->
    [#{base_id => 20046, num => 1,
       base_reward => [{22699, 5}], flag => 1, exp_mod => 3348,
       honor_id => 11503, rate => 15, show_rate => 100,
       is_notice => 1},
     #{base_id => 20052, num => 1,
       base_reward => [{22699, 5}], flag => 1, exp_mod => 3348,
       honor_id => 11503, rate => 80, show_rate => 100,
       is_notice => 0},
     #{base_id => 20087, num => 1,
       base_reward => [{22699, 5}], flag => 1, exp_mod => 3348,
       honor_id => 11503, rate => 30, show_rate => 100,
       is_notice => 1},
     #{base_id => 21100, num => 1,
       base_reward => [{22699, 5}], flag => 1, exp_mod => 3348,
       honor_id => 11503, rate => 30, show_rate => 100,
       is_notice => 1},
     #{base_id => 20095, num => 1,
       base_reward => [{22699, 5}], flag => 1, exp_mod => 3348,
       honor_id => 11503, rate => 5, show_rate => 100,
       is_notice => 1},
     #{base_id => 20075, num => 1,
       base_reward => [{22699, 5}], flag => 1, exp_mod => 3348,
       honor_id => 11503, rate => 5, show_rate => 100,
       is_notice => 1},
     #{base_id => 20616, num => 1,
       base_reward => [{22699, 5}], flag => 1, exp_mod => 3348,
       honor_id => 11503, rate => 2, show_rate => 100,
       is_notice => 1},
     #{base_id => 20021, num => 1,
       base_reward => [{22699, 5}], flag => 1, exp_mod => 3348,
       honor_id => 11503, rate => 50, show_rate => 100,
       is_notice => 0},
     #{base_id => 20034, num => 1,
       base_reward => [{22699, 5}], flag => 1, exp_mod => 3348,
       honor_id => 11503, rate => 60, show_rate => 100,
       is_notice => 0},
     #{base_id => 20045, num => 1,
       base_reward => [{22699, 5}], flag => 1, exp_mod => 3348,
       honor_id => 11503, rate => 55, show_rate => 100,
       is_notice => 0},
     #{base_id => 20000, num => 1,
       base_reward => [{22699, 5}], flag => 1, exp_mod => 3348,
       honor_id => 11503, rate => 50, show_rate => 100,
       is_notice => 0},
     #{base_id => 20025, num => 1,
       base_reward => [{22699, 5}], flag => 1, exp_mod => 3348,
       honor_id => 11503, rate => 50, show_rate => 100,
       is_notice => 0},
     #{base_id => 20020, num => 1,
       base_reward => [{22699, 5}], flag => 1, exp_mod => 3348,
       honor_id => 11503, rate => 58, show_rate => 100,
       is_notice => 0},
     #{base_id => 21420, num => 1,
       base_reward => [{22699, 5}], flag => 1, exp_mod => 3348,
       honor_id => 11503, rate => 300, show_rate => 100,
       is_notice => 0},
     #{base_id => 21421, num => 1,
       base_reward => [{22699, 5}], flag => 1, exp_mod => 3348,
       honor_id => 11503, rate => 150, show_rate => 100,
       is_notice => 0},
     #{base_id => 21422, num => 1,
       base_reward => [{22699, 5}], flag => 1, exp_mod => 3348,
       honor_id => 11503, rate => 60, show_rate => 100,
       is_notice => 0}];
get_card(32001) ->
    [#{base_id => 20046, num => 1,
       base_reward => [{22699, 5}], flag => 1, exp_mod => 3348,
       honor_id => 11501, rate => 15, show_rate => 100,
       is_notice => 1},
     #{base_id => 20052, num => 1,
       base_reward => [{22699, 5}], flag => 1, exp_mod => 3348,
       honor_id => 11501, rate => 80, show_rate => 100,
       is_notice => 0},
     #{base_id => 20087, num => 1,
       base_reward => [{22699, 5}], flag => 1, exp_mod => 3348,
       honor_id => 11501, rate => 30, show_rate => 100,
       is_notice => 1},
     #{base_id => 21100, num => 1,
       base_reward => [{22699, 5}], flag => 1, exp_mod => 3348,
       honor_id => 11501, rate => 30, show_rate => 100,
       is_notice => 1},
     #{base_id => 20095, num => 1,
       base_reward => [{22699, 5}], flag => 1, exp_mod => 3348,
       honor_id => 11501, rate => 5, show_rate => 100,
       is_notice => 1},
     #{base_id => 20075, num => 1,
       base_reward => [{22699, 5}], flag => 1, exp_mod => 3348,
       honor_id => 11501, rate => 5, show_rate => 100,
       is_notice => 1},
     #{base_id => 20616, num => 1,
       base_reward => [{22699, 5}], flag => 1, exp_mod => 3348,
       honor_id => 11501, rate => 2, show_rate => 100,
       is_notice => 1},
     #{base_id => 20021, num => 1,
       base_reward => [{22699, 5}], flag => 1, exp_mod => 3348,
       honor_id => 11501, rate => 50, show_rate => 100,
       is_notice => 0},
     #{base_id => 20034, num => 1,
       base_reward => [{22699, 5}], flag => 1, exp_mod => 3348,
       honor_id => 11501, rate => 60, show_rate => 100,
       is_notice => 0},
     #{base_id => 20045, num => 1,
       base_reward => [{22699, 5}], flag => 1, exp_mod => 3348,
       honor_id => 11501, rate => 55, show_rate => 100,
       is_notice => 0},
     #{base_id => 20000, num => 1,
       base_reward => [{22699, 5}], flag => 1, exp_mod => 3348,
       honor_id => 11501, rate => 50, show_rate => 100,
       is_notice => 0},
     #{base_id => 20025, num => 1,
       base_reward => [{22699, 5}], flag => 1, exp_mod => 3348,
       honor_id => 11501, rate => 50, show_rate => 100,
       is_notice => 0},
     #{base_id => 20020, num => 1,
       base_reward => [{22699, 5}], flag => 1, exp_mod => 3348,
       honor_id => 11501, rate => 58, show_rate => 100,
       is_notice => 0},
     #{base_id => 21420, num => 1,
       base_reward => [{22699, 5}], flag => 1, exp_mod => 3348,
       honor_id => 11501, rate => 300, show_rate => 100,
       is_notice => 0},
     #{base_id => 21421, num => 1,
       base_reward => [{22699, 5}], flag => 1, exp_mod => 3348,
       honor_id => 11501, rate => 150, show_rate => 100,
       is_notice => 0},
     #{base_id => 21422, num => 1,
       base_reward => [{22699, 5}], flag => 1, exp_mod => 3348,
       honor_id => 11501, rate => 60, show_rate => 100,
       is_notice => 0}];
get_card(32002) ->
    [#{base_id => 20046, num => 1,
       base_reward => [{22699, 5}], flag => 1, exp_mod => 3348,
       honor_id => 11502, rate => 15, show_rate => 100,
       is_notice => 1},
     #{base_id => 20052, num => 1,
       base_reward => [{22699, 5}], flag => 1, exp_mod => 3348,
       honor_id => 11502, rate => 80, show_rate => 100,
       is_notice => 0},
     #{base_id => 20087, num => 1,
       base_reward => [{22699, 5}], flag => 1, exp_mod => 3348,
       honor_id => 11502, rate => 30, show_rate => 100,
       is_notice => 1},
     #{base_id => 21100, num => 1,
       base_reward => [{22699, 5}], flag => 1, exp_mod => 3348,
       honor_id => 11502, rate => 30, show_rate => 100,
       is_notice => 1},
     #{base_id => 20095, num => 1,
       base_reward => [{22699, 5}], flag => 1, exp_mod => 3348,
       honor_id => 11502, rate => 5, show_rate => 100,
       is_notice => 1},
     #{base_id => 20075, num => 1,
       base_reward => [{22699, 5}], flag => 1, exp_mod => 3348,
       honor_id => 11502, rate => 5, show_rate => 100,
       is_notice => 1},
     #{base_id => 20616, num => 1,
       base_reward => [{22699, 5}], flag => 1, exp_mod => 3348,
       honor_id => 11502, rate => 2, show_rate => 100,
       is_notice => 1},
     #{base_id => 20021, num => 1,
       base_reward => [{22699, 5}], flag => 1, exp_mod => 3348,
       honor_id => 11502, rate => 50, show_rate => 100,
       is_notice => 0},
     #{base_id => 20034, num => 1,
       base_reward => [{22699, 5}], flag => 1, exp_mod => 3348,
       honor_id => 11502, rate => 60, show_rate => 100,
       is_notice => 0},
     #{base_id => 20045, num => 1,
       base_reward => [{22699, 5}], flag => 1, exp_mod => 3348,
       honor_id => 11502, rate => 55, show_rate => 100,
       is_notice => 0},
     #{base_id => 20000, num => 1,
       base_reward => [{22699, 5}], flag => 1, exp_mod => 3348,
       honor_id => 11502, rate => 50, show_rate => 100,
       is_notice => 0},
     #{base_id => 20025, num => 1,
       base_reward => [{22699, 5}], flag => 1, exp_mod => 3348,
       honor_id => 11502, rate => 50, show_rate => 100,
       is_notice => 0},
     #{base_id => 20020, num => 1,
       base_reward => [{22699, 5}], flag => 1, exp_mod => 3348,
       honor_id => 11502, rate => 58, show_rate => 100,
       is_notice => 0},
     #{base_id => 21420, num => 1,
       base_reward => [{22699, 5}], flag => 1, exp_mod => 3348,
       honor_id => 11502, rate => 300, show_rate => 100,
       is_notice => 0},
     #{base_id => 21421, num => 1,
       base_reward => [{22699, 5}], flag => 1, exp_mod => 3348,
       honor_id => 11502, rate => 150, show_rate => 100,
       is_notice => 0},
     #{base_id => 21422, num => 1,
       base_reward => [{22699, 5}], flag => 1, exp_mod => 3348,
       honor_id => 11502, rate => 60, show_rate => 100,
       is_notice => 0}];
get_card(32003) ->
    [#{base_id => 20046, num => 1,
       base_reward => [{22699, 5}], flag => 1, exp_mod => 3348,
       honor_id => 11504, rate => 15, show_rate => 100,
       is_notice => 1},
     #{base_id => 20052, num => 1,
       base_reward => [{22699, 5}], flag => 1, exp_mod => 3348,
       honor_id => 11504, rate => 80, show_rate => 100,
       is_notice => 0},
     #{base_id => 20087, num => 1,
       base_reward => [{22699, 5}], flag => 1, exp_mod => 3348,
       honor_id => 11504, rate => 30, show_rate => 100,
       is_notice => 1},
     #{base_id => 21100, num => 1,
       base_reward => [{22699, 5}], flag => 1, exp_mod => 3348,
       honor_id => 11504, rate => 30, show_rate => 100,
       is_notice => 1},
     #{base_id => 20095, num => 1,
       base_reward => [{22699, 5}], flag => 1, exp_mod => 3348,
       honor_id => 11504, rate => 5, show_rate => 100,
       is_notice => 1},
     #{base_id => 20075, num => 1,
       base_reward => [{22699, 5}], flag => 1, exp_mod => 3348,
       honor_id => 11504, rate => 5, show_rate => 100,
       is_notice => 1},
     #{base_id => 20616, num => 1,
       base_reward => [{22699, 5}], flag => 1, exp_mod => 3348,
       honor_id => 11504, rate => 2, show_rate => 100,
       is_notice => 1},
     #{base_id => 20021, num => 1,
       base_reward => [{22699, 5}], flag => 1, exp_mod => 3348,
       honor_id => 11504, rate => 50, show_rate => 100,
       is_notice => 0},
     #{base_id => 20034, num => 1,
       base_reward => [{22699, 5}], flag => 1, exp_mod => 3348,
       honor_id => 11504, rate => 60, show_rate => 100,
       is_notice => 0},
     #{base_id => 20045, num => 1,
       base_reward => [{22699, 5}], flag => 1, exp_mod => 3348,
       honor_id => 11504, rate => 55, show_rate => 100,
       is_notice => 0},
     #{base_id => 20000, num => 1,
       base_reward => [{22699, 5}], flag => 1, exp_mod => 3348,
       honor_id => 11504, rate => 50, show_rate => 100,
       is_notice => 0},
     #{base_id => 20025, num => 1,
       base_reward => [{22699, 5}], flag => 1, exp_mod => 3348,
       honor_id => 11504, rate => 50, show_rate => 100,
       is_notice => 0},
     #{base_id => 20020, num => 1,
       base_reward => [{22699, 5}], flag => 1, exp_mod => 3348,
       honor_id => 11504, rate => 58, show_rate => 100,
       is_notice => 0},
     #{base_id => 21420, num => 1,
       base_reward => [{22699, 5}], flag => 1, exp_mod => 3348,
       honor_id => 11504, rate => 300, show_rate => 100,
       is_notice => 0},
     #{base_id => 21421, num => 1,
       base_reward => [{22699, 5}], flag => 1, exp_mod => 3348,
       honor_id => 11504, rate => 150, show_rate => 100,
       is_notice => 0},
     #{base_id => 21422, num => 1,
       base_reward => [{22699, 5}], flag => 1, exp_mod => 3348,
       honor_id => 11504, rate => 60, show_rate => 100,
       is_notice => 0}];
get_card(_) -> [].

get_wave_info(1) ->
    #{wave => 1, unit_id => 32004, honor_id => 11505,
      exp_mod => 3362, item_reward => [{22694, 2}]};
get_wave_info(2) ->
    #{wave => 2, unit_id => 81860, honor_id => 11506,
      exp_mod => 3363, item_reward => [{22695, 3}]};
get_wave_info(3) ->
    #{wave => 3, unit_id => 81850, honor_id => 11507,
      exp_mod => 3364, item_reward => [{22696, 4}]};
get_wave_info(4) ->
    #{wave => 4, unit_id => 81870, honor_id => 11508,
      exp_mod => 3365, item_reward => [{22697, 5}]};
get_wave_info(5) ->
    #{wave => 5, unit_id => 32005, honor_id => 11509,
      exp_mod => 3366, item_reward => [{22698, 6}]};
get_wave_info(_) -> false.

get_rank_reward(Rank)
    when Rank >= 1 andalso Rank =< 10 ->
    [{24054, 1}];
get_rank_reward(_) -> [].

get_all_group() ->
    [41,
     2,
     73,
     52,
     70,
     69,
     66,
     45,
     60,
     59,
     3,
     56,
     74,
     53,
     71,
     67,
     75,
     1,
     54,
     72,
     30,
     65,
     44].

get_all_units() -> [32000, 32004, 32001, 32002, 32003].

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

