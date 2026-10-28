-file("src/data/drop_data.erl", 1).

-module(drop_data).

-export([get_rule/1,
         get_super_list/1,
         get_normal_list/1,
         can_get_item/1,
         get_cast/1]).

-file("inc/drop.hrl", 1).

-record(drop_rule,
        {unit_id = 0,
         type = 1,
         super_r = 0,
         first_r = 0,
         second_r = 0,
         third_r = 0}).

-record(drop_base,
        {unit_id = 0,
         item_id = 0,
         num = 0,
         ratio = 0,
         classes = 0,
         lev_min = 0,
         lev_max = 0,
         notice = 0,
         sound_effect = 0}).

-file("src/data/drop_data.erl", 18).

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

-file("src/data/drop_data.erl", 19).

get_rule(50021) ->
    #drop_rule{unit_id = 50021, type = 3, super_r = 0,
               first_r = 10000, second_r = 0, third_r = 0};
get_rule(50022) ->
    #drop_rule{unit_id = 50022, type = 3, super_r = 0,
               first_r = 10000, second_r = 0, third_r = 0};
get_rule(50023) ->
    #drop_rule{unit_id = 50023, type = 3, super_r = 0,
               first_r = 10000, second_r = 0, third_r = 0};
get_rule(50039) ->
    #drop_rule{unit_id = 50039, type = 3, super_r = 0,
               first_r = 10000, second_r = 0, third_r = 0};
get_rule(50041) ->
    #drop_rule{unit_id = 50041, type = 3, super_r = 0,
               first_r = 10000, second_r = 0, third_r = 0};
get_rule(50042) ->
    #drop_rule{unit_id = 50042, type = 3, super_r = 0,
               first_r = 10000, second_r = 0, third_r = 0};
get_rule(50043) ->
    #drop_rule{unit_id = 50043, type = 3, super_r = 0,
               first_r = 10000, second_r = 0, third_r = 0};
get_rule(50059) ->
    #drop_rule{unit_id = 50059, type = 3, super_r = 0,
               first_r = 10000, second_r = 0, third_r = 0};
get_rule(51000) ->
    #drop_rule{unit_id = 51000, type = 3, super_r = 640,
               second_r = 10000, third_r = 0};
get_rule(51005) ->
    #drop_rule{unit_id = 51005, type = 3, super_r = 640,
               second_r = 10000, third_r = 0};
get_rule(51009) ->
    #drop_rule{unit_id = 51009, type = 3, super_r = 640,
               second_r = 10000, third_r = 0};
get_rule(51013) ->
    #drop_rule{unit_id = 51013, type = 3, super_r = 0,
               first_r = 10000, third_r = 0};
get_rule(50521) ->
    #drop_rule{unit_id = 50521, type = 3, super_r = 0,
               first_r = 10000, second_r = 0, third_r = 0};
get_rule(50522) ->
    #drop_rule{unit_id = 50522, type = 3, super_r = 0,
               first_r = 10000, second_r = 0, third_r = 0};
get_rule(50523) ->
    #drop_rule{unit_id = 50523, type = 3, super_r = 0,
               first_r = 10000, second_r = 0, third_r = 0};
get_rule(50539) ->
    #drop_rule{unit_id = 50539, type = 3, super_r = 0,
               first_r = 10000, second_r = 0, third_r = 0};
get_rule(50541) ->
    #drop_rule{unit_id = 50541, type = 3, super_r = 0,
               first_r = 10000, second_r = 0, third_r = 0};
get_rule(50542) ->
    #drop_rule{unit_id = 50542, type = 3, super_r = 0,
               first_r = 10000, second_r = 0, third_r = 0};
get_rule(50543) ->
    #drop_rule{unit_id = 50543, type = 3, super_r = 0,
               first_r = 10000, second_r = 0, third_r = 0};
get_rule(50559) ->
    #drop_rule{unit_id = 50559, type = 3, super_r = 0,
               first_r = 10000, second_r = 0, third_r = 0};
get_rule(51100) ->
    #drop_rule{unit_id = 51100, type = 3, super_r = 0,
               first_r = 10000, second_r = 0, third_r = 0};
get_rule(51105) ->
    #drop_rule{unit_id = 51105, type = 3, super_r = 0,
               first_r = 10000, second_r = 0, third_r = 0};
get_rule(51109) ->
    #drop_rule{unit_id = 51109, type = 3, super_r = 0,
               first_r = 10000, second_r = 0, third_r = 0};
get_rule(51113) ->
    #drop_rule{unit_id = 51113, type = 3, super_r = 0,
               first_r = 10000, second_r = 0, third_r = 0};
get_rule(52011) ->
    #drop_rule{unit_id = 52011, type = 3, super_r = 0,
               first_r = 10000, second_r = 0, third_r = 0};
get_rule(52021) ->
    #drop_rule{unit_id = 52021, type = 3, super_r = 0,
               first_r = 10000, second_r = 0, third_r = 0};
get_rule(52041) ->
    #drop_rule{unit_id = 52041, type = 3, super_r = 0,
               first_r = 10000, second_r = 0, third_r = 0};
get_rule(52051) ->
    #drop_rule{unit_id = 52051, type = 3, super_r = 0,
               first_r = 10000, second_r = 0, third_r = 0};
get_rule(52071) ->
    #drop_rule{unit_id = 52071, type = 3, super_r = 0,
               first_r = 10000, second_r = 0, third_r = 0};
get_rule(52081) ->
    #drop_rule{unit_id = 52081, type = 3, super_r = 0,
               first_r = 10000, second_r = 0, third_r = 0};
get_rule(51201) ->
    #drop_rule{unit_id = 51201, type = 3, super_r = 640,
               second_r = 10000, third_r = 0};
get_rule(51205) ->
    #drop_rule{unit_id = 51205, type = 3, super_r = 640,
               second_r = 10000, third_r = 0};
get_rule(51208) ->
    #drop_rule{unit_id = 51208, type = 3, super_r = 640,
               second_r = 10000, third_r = 0};
get_rule(58001) ->
    #drop_rule{unit_id = 58001, type = 3, super_r = 10000,
               first_r = 0, second_r = 10000, third_r = 0};
get_rule(58006) ->
    #drop_rule{unit_id = 58006, type = 3, super_r = 10000,
               first_r = 0, second_r = 10000, third_r = 0};
get_rule(58048) ->
    #drop_rule{unit_id = 58048, type = 3, super_r = 100,
               first_r = 0, second_r = 0, third_r = 0};
get_rule(58058) ->
    #drop_rule{unit_id = 58058, type = 3, super_r = 100,
               first_r = 0, second_r = 0, third_r = 0};
get_rule(58045) ->
    #drop_rule{unit_id = 58045, type = 3, super_r = 100,
               first_r = 0, second_r = 0, third_r = 0};
get_rule(58055) ->
    #drop_rule{unit_id = 58055, type = 3, super_r = 100,
               first_r = 0, second_r = 0, third_r = 0};
get_rule(32000) ->
    #drop_rule{unit_id = 32000, type = 3, super_r = 100,
               first_r = 0, second_r = 0, third_r = 0};
get_rule(32001) ->
    #drop_rule{unit_id = 32001, type = 3, super_r = 100,
               first_r = 0, second_r = 0, third_r = 0};
get_rule(32002) ->
    #drop_rule{unit_id = 32002, type = 3, super_r = 100,
               first_r = 0, second_r = 0, third_r = 0};
get_rule(32003) ->
    #drop_rule{unit_id = 32003, type = 3, super_r = 100,
               first_r = 0, second_r = 0, third_r = 0};
get_rule(60000) ->
    #drop_rule{unit_id = 60000, type = 3, super_r = 15,
               first_r = 0, second_r = 250};
get_rule(60001) ->
    #drop_rule{unit_id = 60001, type = 3, super_r = 15,
               first_r = 0, second_r = 250};
get_rule(60002) ->
    #drop_rule{unit_id = 60002, type = 3, super_r = 15,
               first_r = 0, second_r = 250};
get_rule(60003) ->
    #drop_rule{unit_id = 60003, type = 3, super_r = 15,
               first_r = 0, second_r = 250};
get_rule(60004) ->
    #drop_rule{unit_id = 60004, type = 3, super_r = 15,
               first_r = 0, second_r = 250};
get_rule(66019) ->
    #drop_rule{unit_id = 66019, type = 3, super_r = 500,
               first_r = 500, second_r = 0, third_r = 0};
get_rule(61008) ->
    #drop_rule{unit_id = 61008, type = 3, super_r = 10000,
               first_r = 0, second_r = 0, third_r = 0};
get_rule(61009) ->
    #drop_rule{unit_id = 61009, type = 3, super_r = 10000,
               first_r = 0, second_r = 0, third_r = 0};
get_rule(74020) ->
    #drop_rule{unit_id = 74020, type = 3, super_r = 10000,
               first_r = 0, second_r = 0, third_r = 0};
get_rule(79600) ->
    #drop_rule{unit_id = 79600, type = 1, super_r = 0,
               first_r = 2500, second_r = 0, third_r = 0};
get_rule(79605) ->
    #drop_rule{unit_id = 79605, type = 1, super_r = 0,
               first_r = 2500, second_r = 0, third_r = 0};
get_rule(79624) ->
    #drop_rule{unit_id = 79624, type = 1, super_r = 0,
               first_r = 1200, second_r = 0, third_r = 0};
get_rule(79610) ->
    #drop_rule{unit_id = 79610, type = 1, super_r = 0,
               first_r = 1200, second_r = 0, third_r = 0};
get_rule(76011) ->
    #drop_rule{unit_id = 76011, type = 3, super_r = 10000,
               first_r = 0, second_r = 10000, third_r = 0};
get_rule(76015) ->
    #drop_rule{unit_id = 76015, type = 3, super_r = 10000,
               first_r = 0, second_r = 10000, third_r = 0};
get_rule(76128) ->
    #drop_rule{unit_id = 76128, type = 3, super_r = 10000,
               first_r = 0, second_r = 10000, third_r = 0};
get_rule(76120) ->
    #drop_rule{unit_id = 76120, type = 3, super_r = 10000,
               first_r = 0, second_r = 10000, third_r = 0};
get_rule(76300) ->
    #drop_rule{unit_id = 76300, type = 3, super_r = 10000,
               first_r = 0, second_r = 10000, third_r = 0};
get_rule(76330) ->
    #drop_rule{unit_id = 76330, type = 3, super_r = 10000,
               first_r = 0, second_r = 0, third_r = 0};
get_rule(76653) ->
    #drop_rule{unit_id = 76653, type = 3, super_r = 10000,
               first_r = 0, second_r = 5000, third_r = 0};
get_rule(76620) ->
    #drop_rule{unit_id = 76620, type = 3, super_r = 10000,
               first_r = 0, second_r = 10000, third_r = 0};
get_rule(76680) ->
    #drop_rule{unit_id = 76680, type = 3, super_r = 5000,
               first_r = 10000, second_r = 0, third_r = 0};
get_rule(74200) ->
    #drop_rule{unit_id = 74200, type = 3, super_r = 5000,
               first_r = 0, second_r = 0, third_r = 0};
get_rule(74210) ->
    #drop_rule{unit_id = 74210, type = 3, super_r = 10000,
               first_r = 0, second_r = 0, third_r = 0};
get_rule(74220) ->
    #drop_rule{unit_id = 74220, type = 3, super_r = 10000,
               first_r = 0, second_r = 0, third_r = 0};
get_rule(74230) ->
    #drop_rule{unit_id = 74230, type = 3, super_r = 10000,
               first_r = 0, second_r = 0, third_r = 0};
get_rule(74241) ->
    #drop_rule{unit_id = 74241, type = 3, super_r = 10000,
               first_r = 0, second_r = 0, third_r = 0};
get_rule(74242) ->
    #drop_rule{unit_id = 74242, type = 3, super_r = 10000,
               first_r = 0, second_r = 0, third_r = 0};
get_rule(74243) ->
    #drop_rule{unit_id = 74243, type = 3, super_r = 10000,
               first_r = 0, second_r = 0, third_r = 0};
get_rule(74244) ->
    #drop_rule{unit_id = 74244, type = 3, super_r = 10000,
               first_r = 0, second_r = 0, third_r = 0};
get_rule(74245) ->
    #drop_rule{unit_id = 74245, type = 3, super_r = 10000,
               first_r = 0, second_r = 0, third_r = 0};
get_rule(74250) ->
    #drop_rule{unit_id = 74250, type = 3, super_r = 0,
               first_r = 0, second_r = 10000, third_r = 0};
get_rule(74251) ->
    #drop_rule{unit_id = 74251, type = 3, super_r = 0,
               first_r = 0, second_r = 10000, third_r = 0};
get_rule(74130) ->
    #drop_rule{unit_id = 74130, type = 3, super_r = 10000,
               first_r = 0, second_r = 10000, third_r = 0};
get_rule(74131) ->
    #drop_rule{unit_id = 74131, type = 3, super_r = 10000,
               first_r = 0, second_r = 10000, third_r = 0};
get_rule(74132) ->
    #drop_rule{unit_id = 74132, type = 3, super_r = 10000,
               first_r = 0, second_r = 10000, third_r = 0};
get_rule(74133) ->
    #drop_rule{unit_id = 74133, type = 3, super_r = 10000,
               first_r = 0, second_r = 10000, third_r = 0};
get_rule(74134) ->
    #drop_rule{unit_id = 74134, type = 3, super_r = 10000,
               first_r = 0, second_r = 0, third_r = 0};
get_rule(74135) ->
    #drop_rule{unit_id = 74135, type = 3, super_r = 10000,
               first_r = 0, second_r = 0, third_r = 0};
get_rule(76900) ->
    #drop_rule{unit_id = 76900, type = 3, super_r = 10000,
               first_r = 0, second_r = 10000, third_r = 0};
get_rule(78015) ->
    #drop_rule{unit_id = 78015, type = 3, super_r = 1500,
               first_r = 0, second_r = 0, third_r = 0};
get_rule(78016) ->
    #drop_rule{unit_id = 78016, type = 3, super_r = 1500,
               first_r = 0, second_r = 0, third_r = 0};
get_rule(78017) ->
    #drop_rule{unit_id = 78017, type = 3, super_r = 1500,
               first_r = 0, second_r = 0, third_r = 0};
get_rule(80000) ->
    #drop_rule{unit_id = 80000, type = 3, super_r = 10000,
               first_r = 0, second_r = 0, third_r = 0};
get_rule(80001) ->
    #drop_rule{unit_id = 80001, type = 3, super_r = 10000,
               first_r = 0, second_r = 0, third_r = 0};
get_rule(80002) ->
    #drop_rule{unit_id = 80002, type = 3, super_r = 10000,
               first_r = 0, second_r = 0, third_r = 0};
get_rule(80003) ->
    #drop_rule{unit_id = 80003, type = 3, super_r = 10000,
               first_r = 0, second_r = 0, third_r = 0};
get_rule(80004) ->
    #drop_rule{unit_id = 80004, type = 3, super_r = 10000,
               first_r = 0, second_r = 0, third_r = 0};
get_rule(80005) ->
    #drop_rule{unit_id = 80005, type = 3, super_r = 10000,
               first_r = 0, second_r = 0, third_r = 0};
get_rule(80006) ->
    #drop_rule{unit_id = 80006, type = 3, super_r = 10000,
               first_r = 0, second_r = 0, third_r = 0};
get_rule(80007) ->
    #drop_rule{unit_id = 80007, type = 3, super_r = 10000,
               first_r = 0, second_r = 0, third_r = 0};
get_rule(91113) ->
    #drop_rule{unit_id = 91113, type = 3, super_r = 40,
               first_r = 0, second_r = 0, third_r = 0};
get_rule(91114) ->
    #drop_rule{unit_id = 91114, type = 3, super_r = 40,
               first_r = 0, second_r = 0, third_r = 0};
get_rule(91115) ->
    #drop_rule{unit_id = 91115, type = 3, super_r = 40,
               first_r = 0, second_r = 0, third_r = 0};
get_rule(91116) ->
    #drop_rule{unit_id = 91116, type = 3, super_r = 40,
               first_r = 0, second_r = 0, third_r = 0};
get_rule(91117) ->
    #drop_rule{unit_id = 91117, type = 3, super_r = 40,
               first_r = 0, second_r = 0, third_r = 0};
get_rule(91118) ->
    #drop_rule{unit_id = 91118, type = 3, super_r = 40,
               first_r = 0, second_r = 0, third_r = 0};
get_rule(91119) ->
    #drop_rule{unit_id = 91119, type = 3, super_r = 40,
               first_r = 0, second_r = 0, third_r = 0};
get_rule(91120) ->
    #drop_rule{unit_id = 91120, type = 3, super_r = 40,
               first_r = 0, second_r = 0, third_r = 0};
get_rule(91121) ->
    #drop_rule{unit_id = 91121, type = 3, super_r = 40,
               first_r = 0, second_r = 0, third_r = 0};
get_rule(91122) ->
    #drop_rule{unit_id = 91122, type = 3, super_r = 40,
               first_r = 0, second_r = 0, third_r = 0};
get_rule(91123) ->
    #drop_rule{unit_id = 91123, type = 3, super_r = 40,
               first_r = 0, second_r = 0, third_r = 0};
get_rule(91124) ->
    #drop_rule{unit_id = 91124, type = 3, super_r = 40,
               first_r = 0, second_r = 0, third_r = 0};
get_rule(91125) ->
    #drop_rule{unit_id = 91125, type = 3, super_r = 50,
               first_r = 0, second_r = 0, third_r = 0};
get_rule(91126) ->
    #drop_rule{unit_id = 91126, type = 3, super_r = 50,
               first_r = 0, second_r = 0, third_r = 0};
get_rule(91127) ->
    #drop_rule{unit_id = 91127, type = 3, super_r = 12,
               first_r = 0, second_r = 0, third_r = 0};
get_rule(91128) ->
    #drop_rule{unit_id = 91128, type = 3, super_r = 12,
               first_r = 0, second_r = 0, third_r = 0};
get_rule(91129) ->
    #drop_rule{unit_id = 91129, type = 3, super_r = 12,
               first_r = 0, second_r = 0, third_r = 0};
get_rule(91130) ->
    #drop_rule{unit_id = 91130, type = 3, super_r = 12,
               first_r = 0, second_r = 0, third_r = 0};
get_rule(91131) ->
    #drop_rule{unit_id = 91131, type = 3, super_r = 12,
               first_r = 0, second_r = 0, third_r = 0};
get_rule(91132) ->
    #drop_rule{unit_id = 91132, type = 3, super_r = 12,
               first_r = 0, second_r = 0, third_r = 0};
get_rule(91133) ->
    #drop_rule{unit_id = 91133, type = 3, super_r = 12,
               first_r = 0, second_r = 0, third_r = 0};
get_rule(91134) ->
    #drop_rule{unit_id = 91134, type = 3, super_r = 12,
               first_r = 0, second_r = 0, third_r = 0};
get_rule(91135) ->
    #drop_rule{unit_id = 91135, type = 3, super_r = 12,
               first_r = 0, second_r = 0, third_r = 0};
get_rule(91136) ->
    #drop_rule{unit_id = 91136, type = 3, super_r = 12,
               first_r = 0, second_r = 0, third_r = 0};
get_rule(91137) ->
    #drop_rule{unit_id = 91137, type = 3, super_r = 12,
               first_r = 0, second_r = 0, third_r = 0};
get_rule(_NpcId) -> false.

get_super_list(60000) ->
    [#drop_base{unit_id = 60000, item_id = 21230, num = 1,
                ratio = 500, classes = 0, lev_min = 105, lev_max = 200,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 60000, item_id = 21231, num = 1,
                ratio = 500, classes = 0, lev_min = 105, lev_max = 200,
                notice = 0, sound_effect = 0}];
get_super_list(60001) ->
    [#drop_base{unit_id = 60001, item_id = 21230, num = 1,
                ratio = 500, classes = 0, lev_min = 105, lev_max = 200,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 60001, item_id = 21231, num = 1,
                ratio = 500, classes = 0, lev_min = 105, lev_max = 200,
                notice = 0, sound_effect = 0}];
get_super_list(60002) ->
    [#drop_base{unit_id = 60002, item_id = 21230, num = 1,
                ratio = 500, classes = 0, lev_min = 105, lev_max = 200,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 60002, item_id = 21231, num = 1,
                ratio = 500, classes = 0, lev_min = 105, lev_max = 200,
                notice = 0, sound_effect = 0}];
get_super_list(60003) ->
    [#drop_base{unit_id = 60003, item_id = 21230, num = 1,
                ratio = 500, classes = 0, lev_min = 105, lev_max = 200,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 60003, item_id = 21231, num = 1,
                ratio = 500, classes = 0, lev_min = 105, lev_max = 200,
                notice = 0, sound_effect = 0}];
get_super_list(60004) ->
    [#drop_base{unit_id = 60004, item_id = 21230, num = 1,
                ratio = 500, classes = 0, lev_min = 105, lev_max = 200,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 60004, item_id = 21231, num = 1,
                ratio = 500, classes = 0, lev_min = 105, lev_max = 200,
                notice = 0, sound_effect = 0}];
get_super_list(61008) ->
    [#drop_base{unit_id = 61008, item_id = 21525, num = 1,
                ratio = 72, classes = 0, notice = 1, sound_effect = 0},
     #drop_base{unit_id = 61008, item_id = 21521, num = 1,
                ratio = 72, classes = 0, notice = 1, sound_effect = 0},
     #drop_base{unit_id = 61008, item_id = 21522, num = 1,
                ratio = 72, classes = 0, notice = 1, sound_effect = 0},
     #drop_base{unit_id = 61008, item_id = 21524, num = 1,
                ratio = 72, classes = 0, notice = 1, sound_effect = 0},
     #drop_base{unit_id = 61008, item_id = 20042, num = 1,
                ratio = 33, classes = 0, notice = 1, sound_effect = 0},
     #drop_base{unit_id = 61008, item_id = 20000, num = 1,
                ratio = 60, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 61008, item_id = 20006, num = 3,
                ratio = 840, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 61008, item_id = 20087, num = 1,
                ratio = 30, classes = 0, notice = 1, sound_effect = 0},
     #drop_base{unit_id = 61008, item_id = 20005, num = 1,
                ratio = 81, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 61008, item_id = 90000,
                num = 50000, ratio = 1450, classes = 0, notice = 0,
                sound_effect = 0},
     #drop_base{unit_id = 61008, item_id = 23833, num = 1,
                ratio = 200, classes = 0, lev_min = 90, lev_max = 200,
                notice = 1, sound_effect = 0},
     #drop_base{unit_id = 61008, item_id = 22450, num = 1,
                ratio = 210, classes = 0, lev_min = 50, lev_max = 200,
                notice = 1, sound_effect = 0},
     #drop_base{unit_id = 61008, item_id = 22791, num = 1,
                ratio = 1, classes = 0, lev_min = 50, lev_max = 200,
                notice = 1, sound_effect = 0},
     #drop_base{unit_id = 61008, item_id = 22792, num = 1,
                ratio = 1, classes = 0, lev_min = 50, lev_max = 200,
                notice = 1, sound_effect = 0},
     #drop_base{unit_id = 61008, item_id = 22793, num = 1,
                ratio = 1, classes = 0, lev_min = 50, lev_max = 200,
                notice = 1, sound_effect = 0},
     #drop_base{unit_id = 61008, item_id = 22794, num = 1,
                ratio = 1, classes = 0, lev_min = 50, lev_max = 200,
                notice = 1, sound_effect = 0},
     #drop_base{unit_id = 61008, item_id = 22795, num = 1,
                ratio = 1, classes = 0, lev_min = 50, lev_max = 200,
                notice = 1, sound_effect = 0},
     #drop_base{unit_id = 61008, item_id = 22831, num = 1,
                ratio = 1, classes = 0, lev_min = 50, lev_max = 200,
                notice = 1, sound_effect = 0},
     #drop_base{unit_id = 61008, item_id = 22832, num = 1,
                ratio = 1, classes = 0, lev_min = 50, lev_max = 200,
                notice = 1, sound_effect = 0},
     #drop_base{unit_id = 61008, item_id = 22833, num = 1,
                ratio = 1, classes = 0, lev_min = 50, lev_max = 200,
                notice = 1, sound_effect = 0}];
get_super_list(61009) ->
    [#drop_base{unit_id = 61009, item_id = 22450, num = 1,
                ratio = 1000, classes = 0, notice = 0,
                sound_effect = 0}];
get_super_list(74020) ->
    [#drop_base{unit_id = 74020, item_id = 20052, num = 1,
                ratio = 100, classes = 0, notice = 0,
                sound_effect = 0}];
get_super_list(66019) ->
    [#drop_base{unit_id = 66019, item_id = 20000, num = 1,
                ratio = 60, classes = 0, lev_min = 30, lev_max = 200,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 66019, item_id = 20004, num = 1,
                ratio = 200, classes = 0, lev_min = 30, lev_max = 200,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 66019, item_id = 20006, num = 5,
                ratio = 200, classes = 0, lev_min = 30, lev_max = 200,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 66019, item_id = 20025, num = 1,
                ratio = 40, classes = 0, lev_min = 30, lev_max = 200,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 66019, item_id = 21220, num = 1,
                ratio = 160, classes = 0, lev_min = 30, lev_max = 200,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 66019, item_id = 20060, num = 1,
                ratio = 160, classes = 0, lev_min = 30, lev_max = 200,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 66019, item_id = 20615, num = 1,
                ratio = 60, classes = 0, lev_min = 30, lev_max = 200,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 66019, item_id = 20616, num = 1,
                ratio = 20, classes = 0, lev_min = 30, lev_max = 200,
                notice = 1, sound_effect = 0},
     #drop_base{unit_id = 66019, item_id = 22210, num = 1,
                ratio = 80, classes = 0, lev_min = 30, lev_max = 200,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 66019, item_id = 22426, num = 1,
                ratio = 20, classes = 0, lev_min = 30, lev_max = 200,
                notice = 1, sound_effect = 0}];
get_super_list(76011) ->
    [#drop_base{unit_id = 76011, item_id = 90051, num = 15,
                ratio = 1000, classes = 0, notice = 0,
                sound_effect = 0}];
get_super_list(76015) ->
    [#drop_base{unit_id = 76015, item_id = 20006, num = 15,
                ratio = 60, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 76015, item_id = 20020, num = 3,
                ratio = 35, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 76015, item_id = 20025, num = 2,
                ratio = 50, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 76015, item_id = 20060, num = 3,
                ratio = 20, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 76015, item_id = 20087, num = 1,
                ratio = 50, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 76015, item_id = 20615, num = 1,
                ratio = 50, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 76015, item_id = 20021, num = 1,
                ratio = 50, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 76015, item_id = 20616, num = 1,
                ratio = 25, classes = 0, notice = 1, sound_effect = 1},
     #drop_base{unit_id = 76015, item_id = 20034, num = 2,
                ratio = 60, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 76015, item_id = 20042, num = 1,
                ratio = 80, classes = 0, notice = 1, sound_effect = 1},
     #drop_base{unit_id = 76015, item_id = 20002, num = 1,
                ratio = 80, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 76015, item_id = 20045, num = 3,
                ratio = 40, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 76015, item_id = 20046, num = 1,
                ratio = 80, classes = 0, notice = 1, sound_effect = 1},
     #drop_base{unit_id = 76015, item_id = 21100, num = 1,
                ratio = 70, classes = 0, notice = 1, sound_effect = 1},
     #drop_base{unit_id = 76015, item_id = 21101, num = 1,
                ratio = 30, classes = 0, notice = 1, sound_effect = 1},
     #drop_base{unit_id = 76015, item_id = 20617, num = 1,
                ratio = 5, classes = 0, notice = 1, sound_effect = 1},
     #drop_base{unit_id = 76015, item_id = 20074, num = 1,
                ratio = 40, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 76015, item_id = 20075, num = 1,
                ratio = 5, classes = 0, notice = 1, sound_effect = 1},
     #drop_base{unit_id = 76015, item_id = 20095, num = 1,
                ratio = 20, classes = 0, notice = 1, sound_effect = 1},
     #drop_base{unit_id = 76015, item_id = 20038, num = 1,
                ratio = 10, classes = 0, notice = 1, sound_effect = 1},
     #drop_base{unit_id = 76015, item_id = 29102, num = 1,
                ratio = 40, classes = 0, notice = 1, sound_effect = 1},
     #drop_base{unit_id = 76015, item_id = 20072, num = 1,
                ratio = 40, classes = 0, notice = 1, sound_effect = 1},
     #drop_base{unit_id = 76015, item_id = 29120, num = 1,
                ratio = 60, classes = 0, notice = 0, sound_effect = 0}];
get_super_list(76126) ->
    [#drop_base{unit_id = 76126, item_id = 23601, num = 1,
                ratio = 130, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 76126, item_id = 23602, num = 1,
                ratio = 130, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 76126, item_id = 20006, num = 5,
                ratio = 42, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 76126, item_id = 20013, num = 1,
                ratio = 40, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 76126, item_id = 20025, num = 1,
                ratio = 20, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 76126, item_id = 20060, num = 1,
                ratio = 25, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 76126, item_id = 20045, num = 1,
                ratio = 30, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 76126, item_id = 20046, num = 1,
                ratio = 10, classes = 0, notice = 1, sound_effect = 1},
     #drop_base{unit_id = 76126, item_id = 21130, num = 1,
                ratio = 10, classes = 0, notice = 1, sound_effect = 1},
     #drop_base{unit_id = 76126, item_id = 21100, num = 1,
                ratio = 15, classes = 0, notice = 1, sound_effect = 1},
     #drop_base{unit_id = 76126, item_id = 20087, num = 1,
                ratio = 50, classes = 0, notice = 1, sound_effect = 1},
     #drop_base{unit_id = 76126, item_id = 20615, num = 1,
                ratio = 27, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 76126, item_id = 20616, num = 1,
                ratio = 2, classes = 0, notice = 1, sound_effect = 1},
     #drop_base{unit_id = 76126, item_id = 20095, num = 1,
                ratio = 2, classes = 0, notice = 1, sound_effect = 1},
     #drop_base{unit_id = 76126, item_id = 20074, num = 1,
                ratio = 32, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 76126, item_id = 20075, num = 1,
                ratio = 2, classes = 0, notice = 1, sound_effect = 1},
     #drop_base{unit_id = 76126, item_id = 20021, num = 1,
                ratio = 70, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 76126, item_id = 20052, num = 1,
                ratio = 80, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 76126, item_id = 20045, num = 1,
                ratio = 52, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 76126, item_id = 29120, num = 1,
                ratio = 180, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 76126, item_id = 20007, num = 1,
                ratio = 51, classes = 0, notice = 0, sound_effect = 0}];
get_super_list(76127) ->
    [#drop_base{unit_id = 76127, item_id = 23601, num = 1,
                ratio = 130, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 76127, item_id = 23602, num = 1,
                ratio = 130, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 76127, item_id = 20006, num = 5,
                ratio = 42, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 76127, item_id = 20013, num = 1,
                ratio = 40, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 76127, item_id = 20025, num = 1,
                ratio = 20, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 76127, item_id = 20060, num = 1,
                ratio = 25, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 76127, item_id = 20045, num = 1,
                ratio = 30, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 76127, item_id = 20046, num = 1,
                ratio = 10, classes = 0, notice = 1, sound_effect = 1},
     #drop_base{unit_id = 76127, item_id = 21130, num = 1,
                ratio = 10, classes = 0, notice = 1, sound_effect = 1},
     #drop_base{unit_id = 76127, item_id = 21100, num = 1,
                ratio = 15, classes = 0, notice = 1, sound_effect = 1},
     #drop_base{unit_id = 76127, item_id = 20087, num = 1,
                ratio = 50, classes = 0, notice = 1, sound_effect = 1},
     #drop_base{unit_id = 76127, item_id = 20615, num = 1,
                ratio = 27, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 76127, item_id = 20616, num = 1,
                ratio = 2, classes = 0, notice = 1, sound_effect = 1},
     #drop_base{unit_id = 76127, item_id = 20095, num = 1,
                ratio = 2, classes = 0, notice = 1, sound_effect = 1},
     #drop_base{unit_id = 76127, item_id = 20074, num = 1,
                ratio = 32, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 76127, item_id = 20075, num = 1,
                ratio = 2, classes = 0, notice = 1, sound_effect = 1},
     #drop_base{unit_id = 76127, item_id = 20021, num = 1,
                ratio = 70, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 76127, item_id = 20052, num = 1,
                ratio = 80, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 76127, item_id = 20045, num = 1,
                ratio = 52, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 76127, item_id = 29120, num = 1,
                ratio = 180, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 76127, item_id = 20007, num = 1,
                ratio = 51, classes = 0, notice = 0, sound_effect = 0}];
get_super_list(76128) ->
    [#drop_base{unit_id = 76128, item_id = 23601, num = 1,
                ratio = 130, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 76128, item_id = 23602, num = 1,
                ratio = 130, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 76128, item_id = 20006, num = 5,
                ratio = 42, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 76128, item_id = 20013, num = 1,
                ratio = 40, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 76128, item_id = 20025, num = 1,
                ratio = 20, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 76128, item_id = 20060, num = 1,
                ratio = 25, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 76128, item_id = 20045, num = 1,
                ratio = 30, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 76128, item_id = 20046, num = 1,
                ratio = 10, classes = 0, notice = 1, sound_effect = 1},
     #drop_base{unit_id = 76128, item_id = 21130, num = 1,
                ratio = 10, classes = 0, notice = 1, sound_effect = 1},
     #drop_base{unit_id = 76128, item_id = 21100, num = 1,
                ratio = 15, classes = 0, notice = 1, sound_effect = 1},
     #drop_base{unit_id = 76128, item_id = 20087, num = 1,
                ratio = 50, classes = 0, notice = 1, sound_effect = 1},
     #drop_base{unit_id = 76128, item_id = 20615, num = 1,
                ratio = 27, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 76128, item_id = 20616, num = 1,
                ratio = 2, classes = 0, notice = 1, sound_effect = 1},
     #drop_base{unit_id = 76128, item_id = 20095, num = 1,
                ratio = 2, classes = 0, notice = 1, sound_effect = 1},
     #drop_base{unit_id = 76128, item_id = 20074, num = 1,
                ratio = 32, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 76128, item_id = 20075, num = 1,
                ratio = 2, classes = 0, notice = 1, sound_effect = 1},
     #drop_base{unit_id = 76128, item_id = 20021, num = 1,
                ratio = 70, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 76128, item_id = 20052, num = 1,
                ratio = 80, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 76128, item_id = 20045, num = 1,
                ratio = 52, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 76128, item_id = 29120, num = 1,
                ratio = 180, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 76128, item_id = 20007, num = 1,
                ratio = 51, classes = 0, notice = 0, sound_effect = 0}];
get_super_list(76120) ->
    [#drop_base{unit_id = 76120, item_id = 20006, num = 15,
                ratio = 60, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 76120, item_id = 20020, num = 2,
                ratio = 35, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 76120, item_id = 20025, num = 2,
                ratio = 50, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 76120, item_id = 20060, num = 2,
                ratio = 20, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 76120, item_id = 20087, num = 1,
                ratio = 50, classes = 0, notice = 1, sound_effect = 1},
     #drop_base{unit_id = 76120, item_id = 20615, num = 1,
                ratio = 50, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 76120, item_id = 20021, num = 1,
                ratio = 50, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 76120, item_id = 20616, num = 1,
                ratio = 25, classes = 0, notice = 1, sound_effect = 1},
     #drop_base{unit_id = 76120, item_id = 20034, num = 1,
                ratio = 60, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 76120, item_id = 20031, num = 1,
                ratio = 80, classes = 0, notice = 1, sound_effect = 1},
     #drop_base{unit_id = 76120, item_id = 20002, num = 1,
                ratio = 80, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 76120, item_id = 20045, num = 2,
                ratio = 40, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 76120, item_id = 20046, num = 1,
                ratio = 80, classes = 0, notice = 1, sound_effect = 1},
     #drop_base{unit_id = 76120, item_id = 21100, num = 1,
                ratio = 70, classes = 0, notice = 1, sound_effect = 1},
     #drop_base{unit_id = 76120, item_id = 21130, num = 1,
                ratio = 30, classes = 0, notice = 1, sound_effect = 1},
     #drop_base{unit_id = 76120, item_id = 20617, num = 1,
                ratio = 5, classes = 0, notice = 1, sound_effect = 1},
     #drop_base{unit_id = 76120, item_id = 20074, num = 1,
                ratio = 40, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 76120, item_id = 20075, num = 1,
                ratio = 5, classes = 0, notice = 1, sound_effect = 1},
     #drop_base{unit_id = 76120, item_id = 20095, num = 1,
                ratio = 20, classes = 0, notice = 1, sound_effect = 1},
     #drop_base{unit_id = 76120, item_id = 20038, num = 1,
                ratio = 10, classes = 0, notice = 1, sound_effect = 1},
     #drop_base{unit_id = 76120, item_id = 29102, num = 1,
                ratio = 40, classes = 0, notice = 1, sound_effect = 1},
     #drop_base{unit_id = 76120, item_id = 20072, num = 1,
                ratio = 40, classes = 0, notice = 1, sound_effect = 1},
     #drop_base{unit_id = 76120, item_id = 29120, num = 1,
                ratio = 60, classes = 0, notice = 0, sound_effect = 0}];
get_super_list(76330) ->
    [#drop_base{unit_id = 76330, item_id = 20006, num = 5,
                ratio = 80, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 76330, item_id = 20000, num = 1,
                ratio = 90, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 76330, item_id = 20034, num = 1,
                ratio = 80, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 76330, item_id = 20045, num = 1,
                ratio = 89, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 76330, item_id = 20013, num = 1,
                ratio = 63, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 76330, item_id = 20025, num = 1,
                ratio = 90, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 76330, item_id = 21220, num = 1,
                ratio = 90, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 76330, item_id = 20087, num = 1,
                ratio = 60, classes = 0, lev_min = 1, lev_max = 200,
                notice = 1, sound_effect = 0},
     #drop_base{unit_id = 76330, item_id = 20038, num = 1,
                ratio = 5, classes = 0, lev_min = 1, lev_max = 200,
                notice = 1, sound_effect = 0},
     #drop_base{unit_id = 76330, item_id = 21100, num = 1,
                ratio = 55, classes = 0, lev_min = 1, lev_max = 200,
                notice = 1, sound_effect = 0},
     #drop_base{unit_id = 76330, item_id = 20022, num = 1,
                ratio = 40, classes = 0, lev_min = 1, lev_max = 79,
                notice = 1, sound_effect = 0},
     #drop_base{unit_id = 76330, item_id = 23556, num = 2,
                ratio = 40, classes = 0, lev_min = 80, lev_max = 200,
                notice = 1, sound_effect = 0},
     #drop_base{unit_id = 76330, item_id = 20046, num = 1,
                ratio = 10, classes = 0, lev_min = 1, lev_max = 200,
                notice = 1, sound_effect = 0},
     #drop_base{unit_id = 76330, item_id = 20075, num = 1,
                ratio = 10, classes = 0, lev_min = 1, lev_max = 200,
                notice = 1, sound_effect = 0},
     #drop_base{unit_id = 76330, item_id = 20616, num = 1,
                ratio = 8, classes = 0, lev_min = 1, lev_max = 200,
                notice = 1, sound_effect = 0},
     #drop_base{unit_id = 76330, item_id = 20095, num = 1,
                ratio = 15, classes = 0, lev_min = 1, lev_max = 200,
                notice = 1, sound_effect = 0},
     #drop_base{unit_id = 76330, item_id = 20617, num = 1,
                ratio = 5, classes = 0, lev_min = 1, lev_max = 200,
                notice = 1, sound_effect = 0},
     #drop_base{unit_id = 76330, item_id = 20021, num = 2,
                ratio = 50, classes = 0, lev_min = 1, lev_max = 79,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 76330, item_id = 22306, num = 1,
                ratio = 50, classes = 0, lev_min = 80, lev_max = 200,
                notice = 1, sound_effect = 0},
     #drop_base{unit_id = 76330, item_id = 29102, num = 1,
                ratio = 40, classes = 0, lev_min = 1, lev_max = 200,
                notice = 1, sound_effect = 0},
     #drop_base{unit_id = 76330, item_id = 20072, num = 1,
                ratio = 40, classes = 0, lev_min = 1, lev_max = 200,
                notice = 1, sound_effect = 0},
     #drop_base{unit_id = 76330, item_id = 71538, num = 1,
                ratio = 80, classes = 0, lev_min = 1, lev_max = 200,
                notice = 1, sound_effect = 0}];
get_super_list(76653) ->
    [#drop_base{unit_id = 76653, item_id = 90051, num = 20,
                ratio = 100, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0}];
get_super_list(76620) ->
    [#drop_base{unit_id = 76620, item_id = 27000, num = 2,
                ratio = 167, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 76620, item_id = 27001, num = 2,
                ratio = 167, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 76620, item_id = 27002, num = 2,
                ratio = 56, classes = 0, notice = 1, sound_effect = 0},
     #drop_base{unit_id = 76620, item_id = 27003, num = 2,
                ratio = 167, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 76620, item_id = 27004, num = 2,
                ratio = 167, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 76620, item_id = 27005, num = 2,
                ratio = 166, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 76620, item_id = 27006, num = 2,
                ratio = 55, classes = 0, notice = 1, sound_effect = 0},
     #drop_base{unit_id = 76620, item_id = 27007, num = 2,
                ratio = 55, classes = 0, notice = 1, sound_effect = 0}];
get_super_list(74200) ->
    [#drop_base{unit_id = 74200, item_id = 21098, num = 1,
                ratio = 6125, classes = 0, notice = 0,
                sound_effect = 0},
     #drop_base{unit_id = 74200, item_id = 21420, num = 1,
                ratio = 500, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 74200, item_id = 21421, num = 1,
                ratio = 250, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 74200, item_id = 21422, num = 1,
                ratio = 125, classes = 0, notice = 1, sound_effect = 1},
     #drop_base{unit_id = 74200, item_id = 21423, num = 1,
                ratio = 0, classes = 0, notice = 1, sound_effect = 1},
     #drop_base{unit_id = 74200, item_id = 21424, num = 1,
                ratio = 0, classes = 0, notice = 1, sound_effect = 1},
     #drop_base{unit_id = 74200, item_id = 21425, num = 1,
                ratio = 0, classes = 0, notice = 1, sound_effect = 1},
     #drop_base{unit_id = 74200, item_id = 21426, num = 1,
                ratio = 0, classes = 0, notice = 1, sound_effect = 1},
     #drop_base{unit_id = 74200, item_id = 20006, num = 3,
                ratio = 2750, classes = 0, notice = 0,
                sound_effect = 0},
     #drop_base{unit_id = 74200, item_id = 20034, num = 1,
                ratio = 250, classes = 0, notice = 0,
                sound_effect = 0}];
get_super_list(74210) ->
    [#drop_base{unit_id = 74210, item_id = 21098, num = 1,
                ratio = 7800, classes = 0, notice = 0,
                sound_effect = 0},
     #drop_base{unit_id = 74210, item_id = 21098, num = 2,
                ratio = 3000, classes = 0, notice = 0,
                sound_effect = 0},
     #drop_base{unit_id = 74210, item_id = 21420, num = 1,
                ratio = 1095, classes = 0, notice = 0,
                sound_effect = 0},
     #drop_base{unit_id = 74210, item_id = 21421, num = 1,
                ratio = 1215, classes = 0, notice = 0,
                sound_effect = 0},
     #drop_base{unit_id = 74210, item_id = 21422, num = 1,
                ratio = 870, classes = 0, notice = 1, sound_effect = 1},
     #drop_base{unit_id = 74210, item_id = 21423, num = 1,
                ratio = 510, classes = 0, notice = 1, sound_effect = 1},
     #drop_base{unit_id = 74210, item_id = 21424, num = 1,
                ratio = 0, classes = 0, notice = 1, sound_effect = 1},
     #drop_base{unit_id = 74210, item_id = 21425, num = 1,
                ratio = 0, classes = 0, notice = 1, sound_effect = 1},
     #drop_base{unit_id = 74210, item_id = 21426, num = 1,
                ratio = 0, classes = 0, notice = 1, sound_effect = 1},
     #drop_base{unit_id = 74210, item_id = 21380, num = 1,
                ratio = 75, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 74210, item_id = 21381, num = 1,
                ratio = 75, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 74210, item_id = 21382, num = 1,
                ratio = 75, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 74210, item_id = 21383, num = 1,
                ratio = 75, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 74210, item_id = 21384, num = 1,
                ratio = 45, classes = 0, notice = 1, sound_effect = 1},
     #drop_base{unit_id = 74210, item_id = 21385, num = 1,
                ratio = 45, classes = 0, notice = 1, sound_effect = 1},
     #drop_base{unit_id = 74210, item_id = 21386, num = 1,
                ratio = 30, classes = 0, notice = 1, sound_effect = 1},
     #drop_base{unit_id = 74210, item_id = 21387, num = 1,
                ratio = 15, classes = 0, notice = 1, sound_effect = 1},
     #drop_base{unit_id = 74210, item_id = 21388, num = 1,
                ratio = 15, classes = 0, notice = 1, sound_effect = 1},
     #drop_base{unit_id = 74210, item_id = 21389, num = 1,
                ratio = 15, classes = 0, notice = 1, sound_effect = 1},
     #drop_base{unit_id = 74210, item_id = 21390, num = 1,
                ratio = 15, classes = 0, notice = 1, sound_effect = 1},
     #drop_base{unit_id = 74210, item_id = 21391, num = 1,
                ratio = 15, classes = 0, notice = 1, sound_effect = 1},
     #drop_base{unit_id = 74210, item_id = 21392, num = 1,
                ratio = 15, classes = 0, notice = 1, sound_effect = 1}];
get_super_list(74220) ->
    [#drop_base{unit_id = 74220, item_id = 21098, num = 1,
                ratio = 6000, classes = 0, notice = 0,
                sound_effect = 0},
     #drop_base{unit_id = 74220, item_id = 21098, num = 2,
                ratio = 4050, classes = 0, notice = 0,
                sound_effect = 0},
     #drop_base{unit_id = 74220, item_id = 21420, num = 1,
                ratio = 1095, classes = 0, notice = 0,
                sound_effect = 0},
     #drop_base{unit_id = 74220, item_id = 21421, num = 1,
                ratio = 1185, classes = 0, notice = 0,
                sound_effect = 0},
     #drop_base{unit_id = 74220, item_id = 21422, num = 1,
                ratio = 1245, classes = 0, notice = 1,
                sound_effect = 1},
     #drop_base{unit_id = 74220, item_id = 21423, num = 1,
                ratio = 585, classes = 0, notice = 1, sound_effect = 1},
     #drop_base{unit_id = 74220, item_id = 21424, num = 1,
                ratio = 330, classes = 0, notice = 1, sound_effect = 1},
     #drop_base{unit_id = 74220, item_id = 21425, num = 1,
                ratio = 0, classes = 0, notice = 1, sound_effect = 1},
     #drop_base{unit_id = 74220, item_id = 21426, num = 1,
                ratio = 0, classes = 0, notice = 1, sound_effect = 1},
     #drop_base{unit_id = 74220, item_id = 21380, num = 1,
                ratio = 75, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 74220, item_id = 21381, num = 1,
                ratio = 75, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 74220, item_id = 21382, num = 1,
                ratio = 75, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 74220, item_id = 21383, num = 1,
                ratio = 75, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 74220, item_id = 21384, num = 1,
                ratio = 45, classes = 0, notice = 1, sound_effect = 1},
     #drop_base{unit_id = 74220, item_id = 21385, num = 1,
                ratio = 45, classes = 0, notice = 1, sound_effect = 1},
     #drop_base{unit_id = 74220, item_id = 21386, num = 1,
                ratio = 30, classes = 0, notice = 1, sound_effect = 1},
     #drop_base{unit_id = 74220, item_id = 21387, num = 1,
                ratio = 15, classes = 0, notice = 1, sound_effect = 1},
     #drop_base{unit_id = 74220, item_id = 21388, num = 1,
                ratio = 15, classes = 0, notice = 1, sound_effect = 1},
     #drop_base{unit_id = 74220, item_id = 21389, num = 1,
                ratio = 15, classes = 0, notice = 1, sound_effect = 1},
     #drop_base{unit_id = 74220, item_id = 21390, num = 1,
                ratio = 15, classes = 0, notice = 1, sound_effect = 1},
     #drop_base{unit_id = 74220, item_id = 21391, num = 1,
                ratio = 15, classes = 0, notice = 1, sound_effect = 1},
     #drop_base{unit_id = 74220, item_id = 21392, num = 1,
                ratio = 15, classes = 0, notice = 1, sound_effect = 1}];
get_super_list(74230) ->
    [#drop_base{unit_id = 74230, item_id = 21098, num = 2,
                ratio = 11100, classes = 0, notice = 0,
                sound_effect = 0},
     #drop_base{unit_id = 74230, item_id = 21420, num = 1,
                ratio = 525, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 74230, item_id = 21421, num = 1,
                ratio = 870, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 74230, item_id = 21422, num = 1,
                ratio = 870, classes = 0, notice = 1, sound_effect = 1},
     #drop_base{unit_id = 74230, item_id = 21423, num = 1,
                ratio = 690, classes = 0, notice = 1, sound_effect = 1},
     #drop_base{unit_id = 74230, item_id = 21424, num = 1,
                ratio = 435, classes = 0, notice = 1, sound_effect = 1},
     #drop_base{unit_id = 74230, item_id = 21425, num = 1,
                ratio = 0, classes = 0, notice = 1, sound_effect = 1},
     #drop_base{unit_id = 74230, item_id = 21426, num = 1,
                ratio = 0, classes = 0, notice = 1, sound_effect = 1},
     #drop_base{unit_id = 74230, item_id = 21380, num = 1,
                ratio = 75, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 74230, item_id = 21381, num = 1,
                ratio = 75, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 74230, item_id = 21382, num = 1,
                ratio = 75, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 74230, item_id = 21383, num = 1,
                ratio = 75, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 74230, item_id = 21384, num = 1,
                ratio = 45, classes = 0, notice = 1, sound_effect = 1},
     #drop_base{unit_id = 74230, item_id = 21385, num = 1,
                ratio = 45, classes = 0, notice = 1, sound_effect = 1},
     #drop_base{unit_id = 74230, item_id = 21386, num = 1,
                ratio = 30, classes = 0, notice = 1, sound_effect = 1},
     #drop_base{unit_id = 74230, item_id = 21387, num = 1,
                ratio = 15, classes = 0, notice = 1, sound_effect = 1},
     #drop_base{unit_id = 74230, item_id = 21388, num = 1,
                ratio = 15, classes = 0, notice = 1, sound_effect = 1},
     #drop_base{unit_id = 74230, item_id = 21389, num = 1,
                ratio = 15, classes = 0, notice = 1, sound_effect = 1},
     #drop_base{unit_id = 74230, item_id = 21390, num = 1,
                ratio = 15, classes = 0, notice = 1, sound_effect = 1},
     #drop_base{unit_id = 74230, item_id = 21391, num = 1,
                ratio = 15, classes = 0, notice = 1, sound_effect = 1},
     #drop_base{unit_id = 74230, item_id = 21392, num = 1,
                ratio = 15, classes = 0, notice = 1, sound_effect = 1}];
get_super_list(74241) ->
    [#drop_base{unit_id = 74241, item_id = 21098, num = 4,
                ratio = 580, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 74241, item_id = 21098, num = 6,
                ratio = 205, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 74241, item_id = 21420, num = 2,
                ratio = 100, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 74241, item_id = 21421, num = 2,
                ratio = 60, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 74241, item_id = 21422, num = 2,
                ratio = 35, classes = 0, notice = 1, sound_effect = 1},
     #drop_base{unit_id = 74241, item_id = 21423, num = 2,
                ratio = 20, classes = 0, notice = 1, sound_effect = 1},
     #drop_base{unit_id = 74241, item_id = 21424, num = 2,
                ratio = 0, classes = 0, notice = 1, sound_effect = 1},
     #drop_base{unit_id = 74241, item_id = 21425, num = 2,
                ratio = 0, classes = 0, notice = 1, sound_effect = 1},
     #drop_base{unit_id = 74241, item_id = 21426, num = 2,
                ratio = 0, classes = 0, notice = 1, sound_effect = 1}];
get_super_list(74242) ->
    [#drop_base{unit_id = 74242, item_id = 21098, num = 4,
                ratio = 450, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 74242, item_id = 21098, num = 6,
                ratio = 260, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 74242, item_id = 21420, num = 2,
                ratio = 120, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 74242, item_id = 21421, num = 2,
                ratio = 80, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 74242, item_id = 21422, num = 2,
                ratio = 50, classes = 0, notice = 1, sound_effect = 1},
     #drop_base{unit_id = 74242, item_id = 21423, num = 2,
                ratio = 40, classes = 0, notice = 1, sound_effect = 1},
     #drop_base{unit_id = 74242, item_id = 21424, num = 2,
                ratio = 0, classes = 0, notice = 1, sound_effect = 1},
     #drop_base{unit_id = 74242, item_id = 21425, num = 2,
                ratio = 0, classes = 0, notice = 1, sound_effect = 1},
     #drop_base{unit_id = 74242, item_id = 21426, num = 2,
                ratio = 0, classes = 0, notice = 1, sound_effect = 1}];
get_super_list(74243) ->
    [#drop_base{unit_id = 74243, item_id = 21098, num = 4,
                ratio = 100, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 74243, item_id = 21098, num = 6,
                ratio = 360, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 74243, item_id = 21420, num = 2,
                ratio = 120, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 74243, item_id = 21421, num = 2,
                ratio = 220, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 74243, item_id = 21422, num = 2,
                ratio = 120, classes = 0, notice = 1, sound_effect = 1},
     #drop_base{unit_id = 74243, item_id = 21423, num = 2,
                ratio = 50, classes = 0, notice = 1, sound_effect = 1},
     #drop_base{unit_id = 74243, item_id = 21424, num = 2,
                ratio = 30, classes = 0, notice = 1, sound_effect = 1},
     #drop_base{unit_id = 74243, item_id = 21425, num = 2,
                ratio = 0, classes = 0, notice = 1, sound_effect = 1},
     #drop_base{unit_id = 74243, item_id = 21426, num = 2,
                ratio = 0, classes = 0, notice = 1, sound_effect = 1}];
get_super_list(74244) ->
    [#drop_base{unit_id = 74244, item_id = 21098, num = 4,
                ratio = 0, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 74244, item_id = 21098, num = 6,
                ratio = 500, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 74244, item_id = 21420, num = 2,
                ratio = 60, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 74244, item_id = 21421, num = 2,
                ratio = 210, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 74244, item_id = 21422, num = 2,
                ratio = 130, classes = 0, notice = 1, sound_effect = 1},
     #drop_base{unit_id = 74244, item_id = 21423, num = 2,
                ratio = 60, classes = 0, notice = 1, sound_effect = 1},
     #drop_base{unit_id = 74244, item_id = 21424, num = 2,
                ratio = 40, classes = 0, notice = 1, sound_effect = 1},
     #drop_base{unit_id = 74244, item_id = 21425, num = 2,
                ratio = 0, classes = 0, notice = 1, sound_effect = 1},
     #drop_base{unit_id = 74244, item_id = 21426, num = 2,
                ratio = 0, classes = 0, notice = 1, sound_effect = 1}];
get_super_list(74245) ->
    [#drop_base{unit_id = 74245, item_id = 21098, num = 4,
                ratio = 0, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 74245, item_id = 21098, num = 6,
                ratio = 400, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 74245, item_id = 21420, num = 2,
                ratio = 0, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 74245, item_id = 21421, num = 2,
                ratio = 200, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 74245, item_id = 21422, num = 2,
                ratio = 160, classes = 0, notice = 1, sound_effect = 1},
     #drop_base{unit_id = 74245, item_id = 21423, num = 2,
                ratio = 130, classes = 0, notice = 1, sound_effect = 1},
     #drop_base{unit_id = 74245, item_id = 21424, num = 2,
                ratio = 65, classes = 0, notice = 1, sound_effect = 1},
     #drop_base{unit_id = 74245, item_id = 21425, num = 2,
                ratio = 45, classes = 0, notice = 1, sound_effect = 1},
     #drop_base{unit_id = 74245, item_id = 21426, num = 2,
                ratio = 0, classes = 0, notice = 1, sound_effect = 1}];
get_super_list(74250) ->
    [#drop_base{unit_id = 74250, item_id = 20006, num = 5,
                ratio = 220, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 74250, item_id = 21220, num = 1,
                ratio = 180, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 74250, item_id = 20046, num = 1,
                ratio = 25, classes = 0, notice = 1, sound_effect = 1},
     #drop_base{unit_id = 74250, item_id = 20020, num = 1,
                ratio = 80, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 74250, item_id = 20025, num = 1,
                ratio = 130, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 74250, item_id = 20087, num = 1,
                ratio = 60, classes = 0, notice = 1, sound_effect = 1},
     #drop_base{unit_id = 74250, item_id = 21100, num = 1,
                ratio = 20, classes = 0, notice = 1, sound_effect = 1},
     #drop_base{unit_id = 74250, item_id = 20095, num = 1,
                ratio = 2, classes = 0, notice = 1, sound_effect = 1},
     #drop_base{unit_id = 74250, item_id = 20075, num = 1,
                ratio = 2, classes = 0, notice = 1, sound_effect = 1},
     #drop_base{unit_id = 74250, item_id = 20616, num = 1,
                ratio = 4, classes = 0, notice = 1, sound_effect = 1},
     #drop_base{unit_id = 74250, item_id = 20617, num = 1,
                ratio = 1, classes = 0, notice = 1, sound_effect = 1},
     #drop_base{unit_id = 74250, item_id = 20021, num = 1,
                ratio = 60, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 74250, item_id = 20088, num = 1,
                ratio = 40, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 74250, item_id = 20034, num = 1,
                ratio = 80, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 74250, item_id = 20045, num = 1,
                ratio = 96, classes = 0, notice = 0, sound_effect = 0}];
get_super_list(74251) ->
    [#drop_base{unit_id = 74251, item_id = 20006, num = 5,
                ratio = 220, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 74251, item_id = 21220, num = 1,
                ratio = 180, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 74251, item_id = 20046, num = 1,
                ratio = 25, classes = 0, notice = 1, sound_effect = 1},
     #drop_base{unit_id = 74251, item_id = 20020, num = 1,
                ratio = 80, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 74251, item_id = 20025, num = 1,
                ratio = 130, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 74251, item_id = 20087, num = 1,
                ratio = 60, classes = 0, notice = 1, sound_effect = 1},
     #drop_base{unit_id = 74251, item_id = 21100, num = 1,
                ratio = 20, classes = 0, notice = 1, sound_effect = 1},
     #drop_base{unit_id = 74251, item_id = 20095, num = 1,
                ratio = 2, classes = 0, notice = 1, sound_effect = 1},
     #drop_base{unit_id = 74251, item_id = 20075, num = 1,
                ratio = 2, classes = 0, notice = 1, sound_effect = 1},
     #drop_base{unit_id = 74251, item_id = 20616, num = 1,
                ratio = 4, classes = 0, notice = 1, sound_effect = 1},
     #drop_base{unit_id = 74251, item_id = 20617, num = 1,
                ratio = 1, classes = 0, notice = 1, sound_effect = 1},
     #drop_base{unit_id = 74251, item_id = 20021, num = 1,
                ratio = 60, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 74251, item_id = 20088, num = 1,
                ratio = 40, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 74251, item_id = 20034, num = 1,
                ratio = 80, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 74251, item_id = 20045, num = 1,
                ratio = 96, classes = 0, notice = 0, sound_effect = 0}];
get_super_list(74130) ->
    [#drop_base{unit_id = 74130, item_id = 20006, num = 5,
                ratio = 366, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 74130, item_id = 20000, num = 1,
                ratio = 10, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 74130, item_id = 20046, num = 1,
                ratio = 5, classes = 0, lev_min = 1, lev_max = 200,
                notice = 1, sound_effect = 0},
     #drop_base{unit_id = 74130, item_id = 22456, num = 1,
                ratio = 10, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 74130, item_id = 20087, num = 1,
                ratio = 10, classes = 0, lev_min = 1, lev_max = 200,
                notice = 1, sound_effect = 0},
     #drop_base{unit_id = 74130, item_id = 20616, num = 1,
                ratio = 1, classes = 0, lev_min = 1, lev_max = 200,
                notice = 1, sound_effect = 0},
     #drop_base{unit_id = 74130, item_id = 20076, num = 1,
                ratio = 1, classes = 0, lev_min = 1, lev_max = 200,
                notice = 1, sound_effect = 0},
     #drop_base{unit_id = 74130, item_id = 20755, num = 1,
                ratio = 2, classes = 0, lev_min = 1, lev_max = 200,
                notice = 1, sound_effect = 0},
     #drop_base{unit_id = 74130, item_id = 21100, num = 1,
                ratio = 4, classes = 0, lev_min = 1, lev_max = 200,
                notice = 1, sound_effect = 0},
     #drop_base{unit_id = 74130, item_id = 20095, num = 1,
                ratio = 1, classes = 0, lev_min = 1, lev_max = 200,
                notice = 1, sound_effect = 0},
     #drop_base{unit_id = 74130, item_id = 20020, num = 1,
                ratio = 15, classes = 0, lev_min = 1, lev_max = 79,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 74130, item_id = 20021, num = 1,
                ratio = 15, classes = 0, lev_min = 1, lev_max = 79,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 74130, item_id = 20045, num = 1,
                ratio = 30, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 74130, item_id = 22306, num = 1,
                ratio = 10, classes = 0, lev_min = 80, lev_max = 200,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 74130, item_id = 23556, num = 1,
                ratio = 10, classes = 0, lev_min = 80, lev_max = 200,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 74130, item_id = 21098, num = 1,
                ratio = 10, classes = 0, lev_min = 80, lev_max = 200,
                notice = 0, sound_effect = 0}];
get_super_list(74131) ->
    [#drop_base{unit_id = 74131, item_id = 20034, num = 1,
                ratio = 100, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 74131, item_id = 22450, num = 1,
                ratio = 120, classes = 0, lev_min = 1, lev_max = 200,
                notice = 1, sound_effect = 0},
     #drop_base{unit_id = 74131, item_id = 20013, num = 1,
                ratio = 100, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 74131, item_id = 20088, num = 1,
                ratio = 100, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 74131, item_id = 20025, num = 1,
                ratio = 100, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 74131, item_id = 20000, num = 1,
                ratio = 100, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 74131, item_id = 20087, num = 1,
                ratio = 68, classes = 0, lev_min = 1, lev_max = 200,
                notice = 1, sound_effect = 0},
     #drop_base{unit_id = 74131, item_id = 20002, num = 1,
                ratio = 80, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 74131, item_id = 21100, num = 1,
                ratio = 75, classes = 0, lev_min = 1, lev_max = 200,
                notice = 1, sound_effect = 0},
     #drop_base{unit_id = 74131, item_id = 20039, num = 1,
                ratio = 50, classes = 0, lev_min = 1, lev_max = 200,
                notice = 1, sound_effect = 0},
     #drop_base{unit_id = 74131, item_id = 21101, num = 1,
                ratio = 20, classes = 0, lev_min = 1, lev_max = 200,
                notice = 1, sound_effect = 0},
     #drop_base{unit_id = 74131, item_id = 20617, num = 1,
                ratio = 2, classes = 0, lev_min = 1, lev_max = 200,
                notice = 1, sound_effect = 0},
     #drop_base{unit_id = 74131, item_id = 20075, num = 1,
                ratio = 3, classes = 0, lev_min = 1, lev_max = 200,
                notice = 1, sound_effect = 0},
     #drop_base{unit_id = 74131, item_id = 20616, num = 1,
                ratio = 5, classes = 0, lev_min = 1, lev_max = 200,
                notice = 1, sound_effect = 0},
     #drop_base{unit_id = 74131, item_id = 20095, num = 1,
                ratio = 9, classes = 0, lev_min = 1, lev_max = 200,
                notice = 1, sound_effect = 0},
     #drop_base{unit_id = 74131, item_id = 20038, num = 1,
                ratio = 3, classes = 0, lev_min = 1, lev_max = 200,
                notice = 1, sound_effect = 0},
     #drop_base{unit_id = 74131, item_id = 70362, num = 1,
                ratio = 25, classes = 0, lev_min = 1, lev_max = 200,
                notice = 1, sound_effect = 0},
     #drop_base{unit_id = 74131, item_id = 20545, num = 1,
                ratio = 40, classes = 0, lev_min = 1, lev_max = 200,
                notice = 1, sound_effect = 0}];
get_super_list(74132) ->
    [#drop_base{unit_id = 74132, item_id = 90000,
                num = 50000, ratio = 100, classes = 0, notice = 0,
                sound_effect = 0},
     #drop_base{unit_id = 74132, item_id = 90003, num = 2000,
                ratio = 100, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 74132, item_id = 90020, num = 10,
                ratio = 50, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 74132, item_id = 21420, num = 1,
                ratio = 60, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 74132, item_id = 21421, num = 1,
                ratio = 40, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 74132, item_id = 21422, num = 1,
                ratio = 20, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 74132, item_id = 21423, num = 1,
                ratio = 10, classes = 0, notice = 1, sound_effect = 0},
     #drop_base{unit_id = 74132, item_id = 21098, num = 1,
                ratio = 100, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 74132, item_id = 23594, num = 1,
                ratio = 20, classes = 0, notice = 1, sound_effect = 0},
     #drop_base{unit_id = 74132, item_id = 20020, num = 1,
                ratio = 150, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 74132, item_id = 20025, num = 1,
                ratio = 150, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 74132, item_id = 20052, num = 1,
                ratio = 150, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 74132, item_id = 20034, num = 1,
                ratio = 40, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 74132, item_id = 29375, num = 1,
                ratio = 5, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 74132, item_id = 29378, num = 1,
                ratio = 5, classes = 0, notice = 0, sound_effect = 0}];
get_super_list(74133) ->
    [#drop_base{unit_id = 74133, item_id = 22205, num = 1,
                ratio = 5, classes = 0, notice = 1, sound_effect = 0},
     #drop_base{unit_id = 74133, item_id = 23594, num = 1,
                ratio = 35, classes = 0, notice = 1, sound_effect = 0},
     #drop_base{unit_id = 74133, item_id = 29371, num = 1,
                ratio = 4, classes = 0, notice = 1, sound_effect = 0},
     #drop_base{unit_id = 74133, item_id = 29380, num = 1,
                ratio = 6, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 74133, item_id = 29379, num = 1,
                ratio = 8, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 74133, item_id = 29378, num = 1,
                ratio = 16, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 74133, item_id = 29370, num = 1,
                ratio = 4, classes = 0, notice = 1, sound_effect = 0},
     #drop_base{unit_id = 74133, item_id = 29377, num = 1,
                ratio = 6, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 74133, item_id = 29376, num = 1,
                ratio = 8, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 74133, item_id = 29375, num = 1,
                ratio = 16, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 74133, item_id = 23550, num = 1,
                ratio = 12, classes = 0, notice = 1, sound_effect = 0},
     #drop_base{unit_id = 74133, item_id = 23554, num = 1,
                ratio = 26, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 74133, item_id = 23555, num = 1,
                ratio = 42, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 74133, item_id = 23556, num = 1,
                ratio = 60, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 74133, item_id = 20014, num = 1,
                ratio = 2, classes = 0, notice = 1, sound_effect = 0},
     #drop_base{unit_id = 74133, item_id = 20072, num = 1,
                ratio = 50, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 74133, item_id = 20038, num = 1,
                ratio = 2, classes = 0, notice = 1, sound_effect = 0},
     #drop_base{unit_id = 74133, item_id = 20095, num = 1,
                ratio = 3, classes = 0, notice = 1, sound_effect = 0},
     #drop_base{unit_id = 74133, item_id = 22595, num = 1,
                ratio = 92, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 74133, item_id = 29103, num = 1,
                ratio = 50, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 74133, item_id = 21422, num = 1,
                ratio = 30, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 74133, item_id = 21423, num = 1,
                ratio = 20, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 74133, item_id = 21424, num = 1,
                ratio = 15, classes = 0, notice = 1, sound_effect = 0},
     #drop_base{unit_id = 74133, item_id = 21425, num = 1,
                ratio = 10, classes = 0, notice = 1, sound_effect = 0},
     #drop_base{unit_id = 74133, item_id = 21098, num = 3,
                ratio = 100, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 74133, item_id = 20046, num = 1,
                ratio = 80, classes = 0, notice = 1, sound_effect = 0},
     #drop_base{unit_id = 74133, item_id = 22585, num = 1,
                ratio = 100, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 74133, item_id = 20616, num = 1,
                ratio = 20, classes = 0, notice = 1, sound_effect = 0},
     #drop_base{unit_id = 74133, item_id = 20617, num = 1,
                ratio = 1, classes = 0, notice = 1, sound_effect = 0},
     #drop_base{unit_id = 74133, item_id = 20075, num = 1,
                ratio = 12, classes = 0, notice = 1, sound_effect = 0},
     #drop_base{unit_id = 74133, item_id = 20076, num = 1,
                ratio = 5, classes = 0, notice = 1, sound_effect = 0},
     #drop_base{unit_id = 74133, item_id = 20025, num = 3,
                ratio = 80, classes = 0, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 74133, item_id = 22216, num = 1,
                ratio = 80, classes = 0, notice = 1, sound_effect = 0}];
get_super_list(78015) ->
    [#drop_base{unit_id = 78015, item_id = 23700, num = 1,
                ratio = 10000, classes = 0, lev_min = 99, lev_max = 100,
                notice = 0, sound_effect = 0}];
get_super_list(78016) ->
    [#drop_base{unit_id = 78016, item_id = 23700, num = 1,
                ratio = 10000, classes = 0, lev_min = 99, lev_max = 100,
                notice = 0, sound_effect = 0}];
get_super_list(78017) ->
    [#drop_base{unit_id = 78017, item_id = 23700, num = 1,
                ratio = 10000, classes = 0, lev_min = 99, lev_max = 100,
                notice = 0, sound_effect = 0}];
get_super_list(74134) ->
    [#drop_base{unit_id = 74134, item_id = 20052, num = 1,
                ratio = 60, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 74134, item_id = 90000,
                num = 300000, ratio = 50, classes = 0, lev_min = 1,
                lev_max = 200, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 74134, item_id = 20025, num = 1,
                ratio = 40, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 74134, item_id = 20006, num = 3,
                ratio = 150, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 74134, item_id = 90000,
                num = 20000, ratio = 200, classes = 0, lev_min = 1,
                lev_max = 200, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 74134, item_id = 90000,
                num = 30000, ratio = 300, classes = 0, lev_min = 1,
                lev_max = 200, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 74134, item_id = 90000,
                num = 50000, ratio = 200, classes = 0, lev_min = 1,
                lev_max = 200, notice = 0, sound_effect = 0}];
get_super_list(74135) ->
    [#drop_base{unit_id = 74135, item_id = 20087, num = 1,
                ratio = 20, classes = 0, lev_min = 1, lev_max = 200,
                notice = 1, sound_effect = 0},
     #drop_base{unit_id = 74135, item_id = 20075, num = 1,
                ratio = 2, classes = 0, lev_min = 1, lev_max = 200,
                notice = 1, sound_effect = 0},
     #drop_base{unit_id = 74135, item_id = 20022, num = 1,
                ratio = 5, classes = 0, lev_min = 1, lev_max = 200,
                notice = 1, sound_effect = 0},
     #drop_base{unit_id = 74135, item_id = 21100, num = 1,
                ratio = 6, classes = 0, lev_min = 1, lev_max = 200,
                notice = 1, sound_effect = 0},
     #drop_base{unit_id = 74135, item_id = 20034, num = 1,
                ratio = 150, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 74135, item_id = 20095, num = 1,
                ratio = 1, classes = 0, lev_min = 1, lev_max = 200,
                notice = 1, sound_effect = 0},
     #drop_base{unit_id = 74135, item_id = 23555, num = 1,
                ratio = 30, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 74135, item_id = 29103, num = 1,
                ratio = 15, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 74135, item_id = 20052, num = 1,
                ratio = 500, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 74135, item_id = 20000, num = 1,
                ratio = 20, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 74135, item_id = 20025, num = 1,
                ratio = 20, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 74135, item_id = 20006, num = 5,
                ratio = 81, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 74135, item_id = 20020, num = 1,
                ratio = 150, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0}];
get_super_list(76680) ->
    [#drop_base{unit_id = 76680, item_id = 29024, num = 1,
                ratio = 100, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0}];
get_super_list(76900) ->
    [#drop_base{unit_id = 76900, item_id = 90051, num = 20,
                ratio = 0, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0}];
get_super_list(80000) ->
    [#drop_base{unit_id = 80000, item_id = 21710, num = 1,
                ratio = 10000, classes = 0, lev_min = 80, lev_max = 200,
                notice = 1, sound_effect = 0}];
get_super_list(80001) ->
    [#drop_base{unit_id = 80001, item_id = 21711, num = 1,
                ratio = 10000, classes = 0, lev_min = 80, lev_max = 200,
                notice = 1, sound_effect = 0}];
get_super_list(80002) ->
    [#drop_base{unit_id = 80002, item_id = 21712, num = 1,
                ratio = 10000, classes = 0, lev_min = 80, lev_max = 200,
                notice = 1, sound_effect = 0}];
get_super_list(80003) ->
    [#drop_base{unit_id = 80003, item_id = 21715, num = 1,
                ratio = 10000, classes = 0, lev_min = 80, lev_max = 200,
                notice = 1, sound_effect = 0}];
get_super_list(80004) ->
    [#drop_base{unit_id = 80004, item_id = 21714, num = 1,
                ratio = 10000, classes = 0, lev_min = 80, lev_max = 200,
                notice = 1, sound_effect = 0}];
get_super_list(80005) ->
    [#drop_base{unit_id = 80005, item_id = 21713, num = 1,
                ratio = 10000, classes = 0, lev_min = 80, lev_max = 200,
                notice = 1, sound_effect = 0}];
get_super_list(80006) ->
    [#drop_base{unit_id = 80006, item_id = 21728, num = 1,
                ratio = 10000, classes = 0, lev_min = 80, lev_max = 200,
                notice = 1, sound_effect = 0}];
get_super_list(80007) ->
    [#drop_base{unit_id = 80007, item_id = 21729, num = 1,
                ratio = 10000, classes = 0, lev_min = 80, lev_max = 200,
                notice = 1, sound_effect = 0}];
get_super_list(91113) ->
    [#drop_base{unit_id = 91113, item_id = 20760, num = 1,
                ratio = 10000, classes = 0, lev_min = 45, lev_max = 54,
                notice = 0, sound_effect = 0}];
get_super_list(91114) ->
    [#drop_base{unit_id = 91114, item_id = 20760, num = 1,
                ratio = 10000, classes = 0, lev_min = 45, lev_max = 54,
                notice = 0, sound_effect = 0}];
get_super_list(91115) ->
    [#drop_base{unit_id = 91115, item_id = 20760, num = 1,
                ratio = 10000, classes = 0, lev_min = 45, lev_max = 54,
                notice = 0, sound_effect = 0}];
get_super_list(91116) ->
    [#drop_base{unit_id = 91116, item_id = 20760, num = 1,
                ratio = 10000, classes = 0, lev_min = 45, lev_max = 54,
                notice = 0, sound_effect = 0}];
get_super_list(91117) ->
    [#drop_base{unit_id = 91117, item_id = 20760, num = 1,
                ratio = 10000, classes = 0, lev_min = 45, lev_max = 54,
                notice = 0, sound_effect = 0}];
get_super_list(91118) ->
    [#drop_base{unit_id = 91118, item_id = 20760, num = 1,
                ratio = 10000, classes = 0, lev_min = 55, lev_max = 69,
                notice = 0, sound_effect = 0}];
get_super_list(91119) ->
    [#drop_base{unit_id = 91119, item_id = 20760, num = 1,
                ratio = 10000, classes = 0, lev_min = 55, lev_max = 69,
                notice = 0, sound_effect = 0}];
get_super_list(91120) ->
    [#drop_base{unit_id = 91120, item_id = 20760, num = 1,
                ratio = 10000, classes = 0, lev_min = 55, lev_max = 69,
                notice = 0, sound_effect = 0}];
get_super_list(91121) ->
    [#drop_base{unit_id = 91121, item_id = 20760, num = 1,
                ratio = 10000, classes = 0, lev_min = 65, lev_max = 79,
                notice = 0, sound_effect = 0}];
get_super_list(91122) ->
    [#drop_base{unit_id = 91122, item_id = 20760, num = 1,
                ratio = 10000, classes = 0, lev_min = 65, lev_max = 79,
                notice = 0, sound_effect = 0}];
get_super_list(91123) ->
    [#drop_base{unit_id = 91123, item_id = 20760, num = 1,
                ratio = 10000, classes = 0, lev_min = 65, lev_max = 79,
                notice = 0, sound_effect = 0}];
get_super_list(91124) ->
    [#drop_base{unit_id = 91124, item_id = 20760, num = 1,
                ratio = 10000, classes = 0, lev_min = 75, lev_max = 84,
                notice = 0, sound_effect = 0}];
get_super_list(91125) ->
    [#drop_base{unit_id = 91125, item_id = 20760, num = 1,
                ratio = 10000, classes = 0, lev_min = 75, lev_max = 84,
                notice = 0, sound_effect = 0}];
get_super_list(91126) ->
    [#drop_base{unit_id = 91126, item_id = 20760, num = 1,
                ratio = 10000, classes = 0, lev_min = 75, lev_max = 84,
                notice = 0, sound_effect = 0}];
get_super_list(91127) ->
    [#drop_base{unit_id = 91127, item_id = 20760, num = 1,
                ratio = 500, classes = 0, lev_min = 86, lev_max = 89,
                notice = 0, sound_effect = 0}];
get_super_list(91128) ->
    [#drop_base{unit_id = 91128, item_id = 20760, num = 1,
                ratio = 500, classes = 0, lev_min = 86, lev_max = 89,
                notice = 0, sound_effect = 0}];
get_super_list(91129) ->
    [#drop_base{unit_id = 91129, item_id = 20760, num = 1,
                ratio = 500, classes = 0, lev_min = 86, lev_max = 89,
                notice = 0, sound_effect = 0}];
get_super_list(91130) ->
    [#drop_base{unit_id = 91130, item_id = 20761, num = 1,
                ratio = 500, classes = 0, lev_min = 90, lev_max = 99,
                notice = 0, sound_effect = 0}];
get_super_list(91131) ->
    [#drop_base{unit_id = 91131, item_id = 20761, num = 1,
                ratio = 500, classes = 0, lev_min = 90, lev_max = 99,
                notice = 0, sound_effect = 0}];
get_super_list(91132) ->
    [#drop_base{unit_id = 91132, item_id = 20761, num = 1,
                ratio = 500, classes = 0, lev_min = 90, lev_max = 99,
                notice = 0, sound_effect = 0}];
get_super_list(91133) ->
    [#drop_base{unit_id = 91133, item_id = 20761, num = 1,
                ratio = 500, classes = 0, lev_min = 100, lev_max = 200,
                notice = 0, sound_effect = 0}];
get_super_list(91134) ->
    [#drop_base{unit_id = 91134, item_id = 20761, num = 1,
                ratio = 500, classes = 0, lev_min = 100, lev_max = 200,
                notice = 0, sound_effect = 0}];
get_super_list(91135) ->
    [#drop_base{unit_id = 91135, item_id = 20761, num = 1,
                ratio = 500, classes = 0, lev_min = 100, lev_max = 200,
                notice = 0, sound_effect = 0}];
get_super_list(91136) ->
    [#drop_base{unit_id = 91136, item_id = 20761, num = 1,
                ratio = 500, classes = 0, lev_min = 100, lev_max = 200,
                notice = 0, sound_effect = 0}];
get_super_list(91137) ->
    [#drop_base{unit_id = 91137, item_id = 20761, num = 1,
                ratio = 500, classes = 0, lev_min = 100, lev_max = 200,
                notice = 0, sound_effect = 0}];
get_super_list(51201) ->
    [#drop_base{unit_id = 51201, item_id = 21243, num = 1,
                ratio = 10000, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0}];
get_super_list(51205) ->
    [#drop_base{unit_id = 51205, item_id = 21243, num = 1,
                ratio = 10000, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0}];
get_super_list(51208) ->
    [#drop_base{unit_id = 51208, item_id = 21243, num = 1,
                ratio = 10000, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0}];
get_super_list(51000) ->
    [#drop_base{unit_id = 51000, item_id = 21243, num = 1,
                ratio = 10000, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0}];
get_super_list(51005) ->
    [#drop_base{unit_id = 51005, item_id = 21243, num = 1,
                ratio = 10000, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0}];
get_super_list(51009) ->
    [#drop_base{unit_id = 51009, item_id = 21243, num = 1,
                ratio = 10000, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0}];
get_super_list(58001) ->
    [#drop_base{unit_id = 58001, item_id = 23734, num = 1,
                ratio = 350, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 58001, item_id = 23734, num = 2,
                ratio = 350, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 58001, item_id = 90000,
                num = 50000, ratio = 200, classes = 0, lev_min = 1,
                lev_max = 200, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 58001, item_id = 21243, num = 1,
                ratio = 100, classes = 0, lev_min = 1, lev_max = 200,
                notice = 1, sound_effect = 0}];
get_super_list(58006) ->
    [#drop_base{unit_id = 58006, item_id = 23734, num = 1,
                ratio = 350, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 58006, item_id = 23734, num = 2,
                ratio = 350, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 58006, item_id = 90000,
                num = 100000, ratio = 200, classes = 0, lev_min = 1,
                lev_max = 200, notice = 0, sound_effect = 0},
     #drop_base{unit_id = 58006, item_id = 21255, num = 1,
                ratio = 100, classes = 0, lev_min = 1, lev_max = 200,
                notice = 1, sound_effect = 0}];
get_super_list(58048) ->
    [#drop_base{unit_id = 58048, item_id = 22796, num = 1,
                ratio = 100, classes = 0, lev_min = 1, lev_max = 200,
                notice = 1, sound_effect = 0}];
get_super_list(58058) ->
    [#drop_base{unit_id = 58058, item_id = 22796, num = 1,
                ratio = 100, classes = 0, lev_min = 1, lev_max = 200,
                notice = 1, sound_effect = 0}];
get_super_list(58045) ->
    [#drop_base{unit_id = 58045, item_id = 22797, num = 1,
                ratio = 100, classes = 0, lev_min = 1, lev_max = 200,
                notice = 1, sound_effect = 0}];
get_super_list(58055) ->
    [#drop_base{unit_id = 58055, item_id = 22797, num = 1,
                ratio = 100, classes = 0, lev_min = 1, lev_max = 200,
                notice = 1, sound_effect = 0}];
get_super_list(32000) ->
    [#drop_base{unit_id = 32000, item_id = 22822, num = 1,
                ratio = 100, classes = 0, lev_min = 1, lev_max = 200,
                notice = 1, sound_effect = 0}];
get_super_list(32001) ->
    [#drop_base{unit_id = 32001, item_id = 22823, num = 1,
                ratio = 100, classes = 0, lev_min = 1, lev_max = 200,
                notice = 1, sound_effect = 0}];
get_super_list(32002) ->
    [#drop_base{unit_id = 32002, item_id = 22824, num = 1,
                ratio = 100, classes = 0, lev_min = 1, lev_max = 200,
                notice = 1, sound_effect = 0}];
get_super_list(32003) ->
    [#drop_base{unit_id = 32003, item_id = 22825, num = 1,
                ratio = 100, classes = 0, lev_min = 1, lev_max = 200,
                notice = 1, sound_effect = 0}];
get_super_list(_NpcId) -> [].

get_normal_list(60000) ->
    [#drop_base{unit_id = 60000, item_id = 20760, num = 1,
                ratio = 750, classes = 0, lev_min = 43, lev_max = 90,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 60000, item_id = 20761, num = 1,
                ratio = 250, classes = 0, lev_min = 88, lev_max = 200,
                notice = 0, sound_effect = 0}];
get_normal_list(60001) ->
    [#drop_base{unit_id = 60001, item_id = 20760, num = 1,
                ratio = 750, classes = 0, lev_min = 43, lev_max = 90,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 60001, item_id = 20761, num = 1,
                ratio = 250, classes = 0, lev_min = 88, lev_max = 200,
                notice = 0, sound_effect = 0}];
get_normal_list(60002) ->
    [#drop_base{unit_id = 60002, item_id = 20760, num = 1,
                ratio = 750, classes = 0, lev_min = 43, lev_max = 90,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 60002, item_id = 20761, num = 1,
                ratio = 250, classes = 0, lev_min = 88, lev_max = 200,
                notice = 0, sound_effect = 0}];
get_normal_list(60003) ->
    [#drop_base{unit_id = 60003, item_id = 20760, num = 1,
                ratio = 750, classes = 0, lev_min = 43, lev_max = 90,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 60003, item_id = 20761, num = 1,
                ratio = 250, classes = 0, lev_min = 88, lev_max = 200,
                notice = 0, sound_effect = 0}];
get_normal_list(60004) ->
    [#drop_base{unit_id = 60004, item_id = 20760, num = 1,
                ratio = 750, classes = 0, lev_min = 43, lev_max = 90,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 60004, item_id = 20761, num = 1,
                ratio = 250, classes = 0, lev_min = 88, lev_max = 200,
                notice = 0, sound_effect = 0}];
get_normal_list(50021) ->
    [#drop_base{unit_id = 50021, item_id = 21220, num = 1,
                ratio = 1000, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0}];
get_normal_list(50022) ->
    [#drop_base{unit_id = 50022, item_id = 21220, num = 1,
                ratio = 1000, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0}];
get_normal_list(50023) ->
    [#drop_base{unit_id = 50023, item_id = 21220, num = 1,
                ratio = 1000, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0}];
get_normal_list(50041) ->
    [#drop_base{unit_id = 50041, item_id = 21220, num = 1,
                ratio = 1000, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0}];
get_normal_list(50042) ->
    [#drop_base{unit_id = 50042, item_id = 21220, num = 1,
                ratio = 1000, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0}];
get_normal_list(50043) ->
    [#drop_base{unit_id = 50043, item_id = 21220, num = 1,
                ratio = 1000, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0}];
get_normal_list(51000) ->
    [#drop_base{unit_id = 51000, item_id = 21220, num = 1,
                ratio = 1000, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0}];
get_normal_list(51005) ->
    [#drop_base{unit_id = 51005, item_id = 21220, num = 1,
                ratio = 1000, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0}];
get_normal_list(51009) ->
    [#drop_base{unit_id = 51009, item_id = 21220, num = 1,
                ratio = 1000, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0}];
get_normal_list(51201) ->
    [#drop_base{unit_id = 51201, item_id = 21220, num = 1,
                ratio = 1000, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0}];
get_normal_list(51205) ->
    [#drop_base{unit_id = 51205, item_id = 21220, num = 1,
                ratio = 1000, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0}];
get_normal_list(51208) ->
    [#drop_base{unit_id = 51208, item_id = 21220, num = 1,
                ratio = 1000, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0}];
get_normal_list(79600) ->
    [#drop_base{unit_id = 79600, item_id = 20078, num = 1,
                ratio = 167, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 79600, item_id = 20079, num = 1,
                ratio = 167, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 79600, item_id = 20080, num = 1,
                ratio = 167, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 79600, item_id = 20081, num = 1,
                ratio = 167, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 79600, item_id = 20082, num = 1,
                ratio = 166, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 79600, item_id = 20084, num = 1,
                ratio = 166, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0}];
get_normal_list(79605) ->
    [#drop_base{unit_id = 79605, item_id = 20078, num = 1,
                ratio = 167, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 79605, item_id = 20079, num = 1,
                ratio = 167, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 79605, item_id = 20080, num = 1,
                ratio = 167, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 79605, item_id = 20081, num = 1,
                ratio = 167, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 79605, item_id = 20082, num = 1,
                ratio = 166, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 79605, item_id = 20084, num = 1,
                ratio = 166, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0}];
get_normal_list(79610) ->
    [#drop_base{unit_id = 79610, item_id = 20078, num = 1,
                ratio = 167, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 79610, item_id = 20079, num = 1,
                ratio = 167, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 79610, item_id = 20080, num = 1,
                ratio = 167, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 79610, item_id = 20081, num = 1,
                ratio = 167, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 79610, item_id = 20082, num = 1,
                ratio = 166, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 79610, item_id = 20084, num = 1,
                ratio = 166, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0}];
get_normal_list(79624) ->
    [#drop_base{unit_id = 79624, item_id = 20078, num = 1,
                ratio = 167, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 79624, item_id = 20079, num = 1,
                ratio = 167, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 79624, item_id = 20080, num = 1,
                ratio = 167, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 79624, item_id = 20081, num = 1,
                ratio = 167, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 79624, item_id = 20082, num = 1,
                ratio = 166, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 79624, item_id = 20084, num = 1,
                ratio = 166, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0}];
get_normal_list(76011) ->
    [#drop_base{unit_id = 76011, item_id = 20000, num = 1,
                ratio = 130, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 76011, item_id = 20034, num = 1,
                ratio = 130, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 76011, item_id = 20013, num = 1,
                ratio = 130, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 76011, item_id = 20025, num = 1,
                ratio = 140, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 76011, item_id = 20087, num = 1,
                ratio = 80, classes = 0, lev_min = 1, lev_max = 200,
                notice = 1, sound_effect = 1},
     #drop_base{unit_id = 76011, item_id = 21100, num = 1,
                ratio = 110, classes = 0, lev_min = 1, lev_max = 200,
                notice = 1, sound_effect = 1},
     #drop_base{unit_id = 76011, item_id = 20022, num = 1,
                ratio = 40, classes = 0, lev_min = 1, lev_max = 79,
                notice = 1, sound_effect = 1},
     #drop_base{unit_id = 76011, item_id = 23556, num = 2,
                ratio = 40, classes = 0, lev_min = 80, lev_max = 200,
                notice = 1, sound_effect = 1},
     #drop_base{unit_id = 76011, item_id = 20038, num = 1,
                ratio = 10, classes = 0, lev_min = 1, lev_max = 200,
                notice = 1, sound_effect = 1},
     #drop_base{unit_id = 76011, item_id = 20021, num = 2,
                ratio = 100, classes = 0, lev_min = 1, lev_max = 79,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 76011, item_id = 22306, num = 1,
                ratio = 100, classes = 0, lev_min = 80, lev_max = 200,
                notice = 1, sound_effect = 1},
     #drop_base{unit_id = 76011, item_id = 71446, num = 1,
                ratio = 130, classes = 0, lev_min = 1, lev_max = 200,
                notice = 1, sound_effect = 1}];
get_normal_list(76015) ->
    [#drop_base{unit_id = 76015, item_id = 29000, num = 2,
                ratio = 400, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 76015, item_id = 29001, num = 2,
                ratio = 400, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 76015, item_id = 29002, num = 1,
                ratio = 100, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 76015, item_id = 29003, num = 1,
                ratio = 100, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0}];
get_normal_list(52011) ->
    [#drop_base{unit_id = 52011, item_id = 20653, num = 1,
                ratio = 133, classes = 0, lev_min = 1, lev_max = 200,
                notice = 1, sound_effect = 0},
     #drop_base{unit_id = 52011, item_id = 20654, num = 1,
                ratio = 460, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 52011, item_id = 20655, num = 1,
                ratio = 357, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 52011, item_id = 22215, num = 2,
                ratio = 50, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0}];
get_normal_list(52021) ->
    [#drop_base{unit_id = 52021, item_id = 20653, num = 1,
                ratio = 133, classes = 0, lev_min = 1, lev_max = 200,
                notice = 1, sound_effect = 0},
     #drop_base{unit_id = 52021, item_id = 20654, num = 1,
                ratio = 460, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 52021, item_id = 20655, num = 1,
                ratio = 357, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 52021, item_id = 22215, num = 2,
                ratio = 50, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0}];
get_normal_list(52041) ->
    [#drop_base{unit_id = 52041, item_id = 20653, num = 1,
                ratio = 133, classes = 0, lev_min = 1, lev_max = 200,
                notice = 1, sound_effect = 0},
     #drop_base{unit_id = 52041, item_id = 20654, num = 1,
                ratio = 460, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 52041, item_id = 20655, num = 1,
                ratio = 357, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 52041, item_id = 22215, num = 2,
                ratio = 50, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0}];
get_normal_list(52051) ->
    [#drop_base{unit_id = 52051, item_id = 20653, num = 1,
                ratio = 133, classes = 0, lev_min = 1, lev_max = 200,
                notice = 1, sound_effect = 0},
     #drop_base{unit_id = 52051, item_id = 20654, num = 1,
                ratio = 460, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 52051, item_id = 20655, num = 1,
                ratio = 357, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 52051, item_id = 22215, num = 2,
                ratio = 50, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0}];
get_normal_list(52071) ->
    [#drop_base{unit_id = 52071, item_id = 20653, num = 1,
                ratio = 133, classes = 0, lev_min = 1, lev_max = 200,
                notice = 1, sound_effect = 0},
     #drop_base{unit_id = 52071, item_id = 20654, num = 1,
                ratio = 460, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 52071, item_id = 20655, num = 1,
                ratio = 357, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 52071, item_id = 22215, num = 2,
                ratio = 50, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0}];
get_normal_list(52081) ->
    [#drop_base{unit_id = 52081, item_id = 20653, num = 1,
                ratio = 133, classes = 0, lev_min = 1, lev_max = 200,
                notice = 1, sound_effect = 0},
     #drop_base{unit_id = 52081, item_id = 20654, num = 1,
                ratio = 460, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 52081, item_id = 20655, num = 1,
                ratio = 357, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 52081, item_id = 22215, num = 2,
                ratio = 50, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0}];
get_normal_list(76126) ->
    [#drop_base{unit_id = 76126, item_id = 23601, num = 1,
                ratio = 245, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 76126, item_id = 23601, num = 2,
                ratio = 245, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 76126, item_id = 23602, num = 1,
                ratio = 205, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 76126, item_id = 23602, num = 2,
                ratio = 205, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 76126, item_id = 23603, num = 1,
                ratio = 100, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0}];
get_normal_list(76127) ->
    [#drop_base{unit_id = 76127, item_id = 23601, num = 1,
                ratio = 245, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 76127, item_id = 23601, num = 2,
                ratio = 245, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 76127, item_id = 23602, num = 1,
                ratio = 205, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 76127, item_id = 23602, num = 2,
                ratio = 205, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 76127, item_id = 23603, num = 1,
                ratio = 100, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0}];
get_normal_list(76128) ->
    [#drop_base{unit_id = 76128, item_id = 23601, num = 1,
                ratio = 245, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 76128, item_id = 23601, num = 2,
                ratio = 245, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 76128, item_id = 23602, num = 1,
                ratio = 205, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 76128, item_id = 23602, num = 2,
                ratio = 205, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 76128, item_id = 23603, num = 1,
                ratio = 100, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0}];
get_normal_list(76120) ->
    [#drop_base{unit_id = 76120, item_id = 23601, num = 2,
                ratio = 400, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 76120, item_id = 23602, num = 2,
                ratio = 400, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 76120, item_id = 23603, num = 1,
                ratio = 100, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 76120, item_id = 23604, num = 1,
                ratio = 100, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0}];
get_normal_list(76653) ->
    [#drop_base{unit_id = 76653, item_id = 20006, num = 10,
                ratio = 100, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 76653, item_id = 20000, num = 1,
                ratio = 110, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 76653, item_id = 20005, num = 2,
                ratio = 100, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 76653, item_id = 20013, num = 1,
                ratio = 100, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 76653, item_id = 20025, num = 2,
                ratio = 103, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 76653, item_id = 21220, num = 3,
                ratio = 110, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 76653, item_id = 20087, num = 1,
                ratio = 80, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 76653, item_id = 20038, num = 1,
                ratio = 5, classes = 0, lev_min = 1, lev_max = 200,
                notice = 1, sound_effect = 0},
     #drop_base{unit_id = 76653, item_id = 21100, num = 1,
                ratio = 55, classes = 0, lev_min = 1, lev_max = 200,
                notice = 1, sound_effect = 0},
     #drop_base{unit_id = 76653, item_id = 70945, num = 1,
                ratio = 80, classes = 0, lev_min = 1, lev_max = 200,
                notice = 1, sound_effect = 0},
     #drop_base{unit_id = 76653, item_id = 20046, num = 1,
                ratio = 55, classes = 0, lev_min = 1, lev_max = 200,
                notice = 1, sound_effect = 0},
     #drop_base{unit_id = 76653, item_id = 20075, num = 1,
                ratio = 15, classes = 0, lev_min = 1, lev_max = 200,
                notice = 1, sound_effect = 0},
     #drop_base{unit_id = 76653, item_id = 20095, num = 1,
                ratio = 15, classes = 0, lev_min = 1, lev_max = 200,
                notice = 1, sound_effect = 0},
     #drop_base{unit_id = 76653, item_id = 20617, num = 1,
                ratio = 2, classes = 0, lev_min = 1, lev_max = 200,
                notice = 1, sound_effect = 0},
     #drop_base{unit_id = 76653, item_id = 20021, num = 2,
                ratio = 70, classes = 0, lev_min = 1, lev_max = 79,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 76653, item_id = 22306, num = 1,
                ratio = 70, classes = 0, lev_min = 80, lev_max = 200,
                notice = 0, sound_effect = 0}];
get_normal_list(76300) ->
    [#drop_base{unit_id = 76300, item_id = 20006, num = 5,
                ratio = 100, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 76300, item_id = 20000, num = 1,
                ratio = 110, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 76300, item_id = 20045, num = 1,
                ratio = 103, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 76300, item_id = 20013, num = 1,
                ratio = 78, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 76300, item_id = 20025, num = 1,
                ratio = 100, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 76300, item_id = 21220, num = 1,
                ratio = 100, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 76300, item_id = 20087, num = 1,
                ratio = 70, classes = 0, lev_min = 1, lev_max = 200,
                notice = 1, sound_effect = 0},
     #drop_base{unit_id = 76300, item_id = 20038, num = 1,
                ratio = 5, classes = 0, lev_min = 1, lev_max = 200,
                notice = 1, sound_effect = 0},
     #drop_base{unit_id = 76300, item_id = 21100, num = 1,
                ratio = 65, classes = 0, lev_min = 1, lev_max = 200,
                notice = 1, sound_effect = 0},
     #drop_base{unit_id = 76300, item_id = 20022, num = 1,
                ratio = 60, classes = 0, lev_min = 1, lev_max = 79,
                notice = 1, sound_effect = 0},
     #drop_base{unit_id = 76300, item_id = 23556, num = 2,
                ratio = 60, classes = 0, lev_min = 80, lev_max = 200,
                notice = 1, sound_effect = 0},
     #drop_base{unit_id = 76300, item_id = 20046, num = 1,
                ratio = 30, classes = 0, lev_min = 1, lev_max = 200,
                notice = 1, sound_effect = 0},
     #drop_base{unit_id = 76300, item_id = 20075, num = 1,
                ratio = 5, classes = 0, lev_min = 1, lev_max = 200,
                notice = 1, sound_effect = 0},
     #drop_base{unit_id = 76300, item_id = 20616, num = 1,
                ratio = 3, classes = 0, lev_min = 1, lev_max = 200,
                notice = 1, sound_effect = 0},
     #drop_base{unit_id = 76300, item_id = 20095, num = 1,
                ratio = 10, classes = 0, lev_min = 1, lev_max = 200,
                notice = 1, sound_effect = 0},
     #drop_base{unit_id = 76300, item_id = 20617, num = 1,
                ratio = 1, classes = 0, lev_min = 1, lev_max = 200,
                notice = 1, sound_effect = 0},
     #drop_base{unit_id = 76300, item_id = 20021, num = 2,
                ratio = 60, classes = 0, lev_min = 1, lev_max = 79,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 76300, item_id = 22306, num = 1,
                ratio = 60, classes = 0, lev_min = 80, lev_max = 200,
                notice = 1, sound_effect = 0},
     #drop_base{unit_id = 76300, item_id = 71507, num = 1,
                ratio = 100, classes = 0, lev_min = 1, lev_max = 200,
                notice = 1, sound_effect = 0}];
get_normal_list(74130) ->
    [#drop_base{unit_id = 74130, item_id = 71396, num = 1,
                ratio = 450, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 74130, item_id = 71397, num = 1,
                ratio = 450, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 74130, item_id = 71398, num = 1,
                ratio = 100, classes = 0, lev_min = 1, lev_max = 200,
                notice = 1, sound_effect = 0}];
get_normal_list(74132) ->
    [#drop_base{unit_id = 74132, item_id = 90025, num = 5,
                ratio = 100, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0}];
get_normal_list(74133) ->
    [#drop_base{unit_id = 74133, item_id = 90025, num = 30,
                ratio = 100, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0}];
get_normal_list(74250) ->
    [#drop_base{unit_id = 74250, item_id = 90020, num = 3,
                ratio = 1000, classes = 0, notice = 0,
                sound_effect = 0}];
get_normal_list(74251) ->
    [#drop_base{unit_id = 74251, item_id = 90020, num = 2,
                ratio = 1000, classes = 0, notice = 0,
                sound_effect = 0}];
get_normal_list(76620) ->
    [#drop_base{unit_id = 76620, item_id = 20006, num = 10,
                ratio = 100, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 76620, item_id = 20000, num = 1,
                ratio = 110, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 76620, item_id = 20005, num = 2,
                ratio = 100, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 76620, item_id = 20013, num = 1,
                ratio = 100, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 76620, item_id = 20025, num = 2,
                ratio = 103, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 76620, item_id = 21220, num = 3,
                ratio = 110, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 76620, item_id = 20087, num = 1,
                ratio = 80, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 76620, item_id = 20038, num = 1,
                ratio = 5, classes = 0, lev_min = 1, lev_max = 200,
                notice = 1, sound_effect = 0},
     #drop_base{unit_id = 76620, item_id = 21100, num = 1,
                ratio = 55, classes = 0, lev_min = 1, lev_max = 200,
                notice = 1, sound_effect = 0},
     #drop_base{unit_id = 76620, item_id = 20022, num = 1,
                ratio = 80, classes = 0, lev_min = 1, lev_max = 200,
                notice = 1, sound_effect = 0},
     #drop_base{unit_id = 76620, item_id = 20046, num = 1,
                ratio = 55, classes = 0, lev_min = 1, lev_max = 200,
                notice = 1, sound_effect = 0},
     #drop_base{unit_id = 76620, item_id = 20075, num = 1,
                ratio = 15, classes = 0, lev_min = 1, lev_max = 200,
                notice = 1, sound_effect = 0},
     #drop_base{unit_id = 76620, item_id = 20095, num = 1,
                ratio = 15, classes = 0, lev_min = 1, lev_max = 200,
                notice = 1, sound_effect = 0},
     #drop_base{unit_id = 76620, item_id = 20617, num = 1,
                ratio = 2, classes = 0, lev_min = 1, lev_max = 200,
                notice = 1, sound_effect = 0},
     #drop_base{unit_id = 76620, item_id = 20021, num = 2,
                ratio = 70, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 76620, item_id = 22306, num = 1,
                ratio = 70, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0}];
get_normal_list(76680) ->
    [#drop_base{unit_id = 76680, item_id = 29020, num = 1,
                ratio = 330, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 76680, item_id = 29021, num = 1,
                ratio = 330, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 76680, item_id = 29022, num = 1,
                ratio = 330, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 76680, item_id = 29023, num = 1,
                ratio = 10, classes = 0, lev_min = 1, lev_max = 200,
                notice = 1, sound_effect = 0}];
get_normal_list(76900) ->
    [#drop_base{unit_id = 76900, item_id = 20006, num = 8,
                ratio = 110, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 76900, item_id = 20000, num = 1,
                ratio = 120, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 76900, item_id = 20005, num = 2,
                ratio = 120, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 76900, item_id = 20013, num = 1,
                ratio = 100, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 76900, item_id = 20025, num = 1,
                ratio = 100, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 76900, item_id = 21220, num = 2,
                ratio = 120, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 76900, item_id = 20087, num = 1,
                ratio = 80, classes = 0, lev_min = 1, lev_max = 200,
                notice = 1, sound_effect = 0},
     #drop_base{unit_id = 76900, item_id = 20038, num = 1,
                ratio = 5, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 76900, item_id = 21100, num = 1,
                ratio = 55, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 76900, item_id = 20022, num = 1,
                ratio = 30, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 76900, item_id = 20046, num = 1,
                ratio = 25, classes = 0, lev_min = 1, lev_max = 200,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 76900, item_id = 20075, num = 1,
                ratio = 15, classes = 0, lev_min = 1, lev_max = 200,
                notice = 1, sound_effect = 0},
     #drop_base{unit_id = 76900, item_id = 20616, num = 1,
                ratio = 2, classes = 0, lev_min = 1, lev_max = 200,
                notice = 1, sound_effect = 0},
     #drop_base{unit_id = 76900, item_id = 20095, num = 1,
                ratio = 15, classes = 0, lev_min = 1, lev_max = 200,
                notice = 1, sound_effect = 0},
     #drop_base{unit_id = 76900, item_id = 20014, num = 1,
                ratio = 2, classes = 0, lev_min = 1, lev_max = 200,
                notice = 1, sound_effect = 0},
     #drop_base{unit_id = 76900, item_id = 71166, num = 1,
                ratio = 25, classes = 0, lev_min = 1, lev_max = 200,
                notice = 1, sound_effect = 0},
     #drop_base{unit_id = 76900, item_id = 20617, num = 1,
                ratio = 1, classes = 0, lev_min = 1, lev_max = 200,
                notice = 1, sound_effect = 0},
     #drop_base{unit_id = 76900, item_id = 20021, num = 2,
                ratio = 50, classes = 0, lev_min = 1, lev_max = 79,
                notice = 0, sound_effect = 0},
     #drop_base{unit_id = 76900, item_id = 22306, num = 1,
                ratio = 50, classes = 0, lev_min = 80, lev_max = 200,
                notice = 1, sound_effect = 0}];
get_normal_list(_NpcId) -> [].

can_get_item(50021) -> 0;
can_get_item(50022) -> 0;
can_get_item(50023) -> 0;
can_get_item(50039) -> 0;
can_get_item(50041) -> 0;
can_get_item(50042) -> 0;
can_get_item(50043) -> 0;
can_get_item(50059) -> 0;
can_get_item(51000) -> 0;
can_get_item(51005) -> 0;
can_get_item(51009) -> 0;
can_get_item(51013) -> 0;
can_get_item(50521) -> 0;
can_get_item(50522) -> 0;
can_get_item(50523) -> 0;
can_get_item(50539) -> 0;
can_get_item(50541) -> 0;
can_get_item(50542) -> 0;
can_get_item(50543) -> 0;
can_get_item(50559) -> 0;
can_get_item(51100) -> 0;
can_get_item(51105) -> 0;
can_get_item(51109) -> 0;
can_get_item(51113) -> 0;
can_get_item(52011) -> 0;
can_get_item(52021) -> 0;
can_get_item(52041) -> 0;
can_get_item(52051) -> 0;
can_get_item(52071) -> 0;
can_get_item(52081) -> 0;
can_get_item(51201) -> 0;
can_get_item(51205) -> 0;
can_get_item(51208) -> 0;
can_get_item(58001) -> 0;
can_get_item(58006) -> 0;
can_get_item(58048) -> 0;
can_get_item(58058) -> 0;
can_get_item(58045) -> 0;
can_get_item(58055) -> 0;
can_get_item(32000) -> 0;
can_get_item(32001) -> 0;
can_get_item(32002) -> 0;
can_get_item(32003) -> 0;
can_get_item(60000) -> 0;
can_get_item(60001) -> 0;
can_get_item(60002) -> 0;
can_get_item(60003) -> 0;
can_get_item(60004) -> 0;
can_get_item(66019) -> 0;
can_get_item(61008) -> 1;
can_get_item(61009) -> 1;
can_get_item(74020) -> 1;
can_get_item(79600) -> 0;
can_get_item(79605) -> 0;
can_get_item(79624) -> 0;
can_get_item(79610) -> 0;
can_get_item(76011) -> 1;
can_get_item(76015) -> 0;
can_get_item(76128) -> 1;
can_get_item(76120) -> 1;
can_get_item(76300) -> 1;
can_get_item(76330) -> 1;
can_get_item(76653) -> 1;
can_get_item(76620) -> 1;
can_get_item(76680) -> 1;
can_get_item(74200) -> 1;
can_get_item(74210) -> 1;
can_get_item(74220) -> 1;
can_get_item(74230) -> 1;
can_get_item(74241) -> 1;
can_get_item(74242) -> 1;
can_get_item(74243) -> 1;
can_get_item(74244) -> 1;
can_get_item(74245) -> 1;
can_get_item(74250) -> 1;
can_get_item(74251) -> 1;
can_get_item(74130) -> 1;
can_get_item(74131) -> 1;
can_get_item(74132) -> 1;
can_get_item(74133) -> 1;
can_get_item(74134) -> 1;
can_get_item(74135) -> 1;
can_get_item(76900) -> 1;
can_get_item(78015) -> 1;
can_get_item(78016) -> 1;
can_get_item(78017) -> 1;
can_get_item(80000) -> 1;
can_get_item(80001) -> 1;
can_get_item(80002) -> 1;
can_get_item(80003) -> 1;
can_get_item(80004) -> 1;
can_get_item(80005) -> 1;
can_get_item(80006) -> 1;
can_get_item(80007) -> 1;
can_get_item(91113) -> 0;
can_get_item(91114) -> 0;
can_get_item(91115) -> 0;
can_get_item(91116) -> 0;
can_get_item(91117) -> 0;
can_get_item(91118) -> 0;
can_get_item(91119) -> 0;
can_get_item(91120) -> 0;
can_get_item(91121) -> 0;
can_get_item(91122) -> 0;
can_get_item(91123) -> 0;
can_get_item(91124) -> 0;
can_get_item(91125) -> 0;
can_get_item(91126) -> 0;
can_get_item(91127) -> 0;
can_get_item(91128) -> 0;
can_get_item(91129) -> 0;
can_get_item(91130) -> 0;
can_get_item(91131) -> 0;
can_get_item(91132) -> 0;
can_get_item(91133) -> 0;
can_get_item(91134) -> 0;
can_get_item(91135) -> 0;
can_get_item(91136) -> 0;
can_get_item(91137) -> 0;
can_get_item(_) -> 0.

get_cast(76653) -> lang:get("清凉一夏");
get_cast(91113) -> lang:get("精英飞刃忍者");
get_cast(91114) -> lang:get("精英雪狐");
get_cast(91115) -> lang:get("精英飞刃忍者");
get_cast(91116) -> lang:get("精英雪狐");
get_cast(91117) -> lang:get("精英犀牛战士");
get_cast(91118) -> lang:get("精英森林巨人");
get_cast(91119) -> lang:get("精英人鱼精灵");
get_cast(91120) -> lang:get("精英狼");
get_cast(91121) -> lang:get("精英炎魔");
get_cast(91122) -> lang:get("精英功夫熊");
get_cast(91123) -> lang:get("精英剑齿虎");
get_cast(91124) -> lang:get("精英石头人");
get_cast(91125) -> lang:get("精英雷暴");
get_cast(91126) -> lang:get("精英剑灵");
get_cast(91127) -> lang:get("精英血伯爵");
get_cast(91128) -> lang:get("精英雷霆战神");
get_cast(91129) -> lang:get("精英月光女神");
get_cast(91130) -> lang:get("精英蝴蝶花姬");
get_cast(91131) -> lang:get("精英死亡骑士");
get_cast(91132) -> lang:get("精英幻影剑客");
get_cast(91133) -> lang:get("精英蝴蝶花姬");
get_cast(91134) -> lang:get("精英死亡骑士");
get_cast(91135) -> lang:get("精英幻影剑客");
get_cast(91136) -> lang:get("精英龙魂猎人");
get_cast(91137) -> lang:get("精英石灵儿");
get_cast(50021) -> lang:get("副本[精灵公主]");
get_cast(50041) -> lang:get("副本[熔火之心]");
get_cast(51000) -> lang:get("副本[水帘洞天]");
get_cast(51201) -> lang:get("副本[遗忘洞穴]");
get_cast(76015) -> lang:get("春节活动");
get_cast(52011) -> lang:get("副本[夺宝奇兵]");
get_cast(52021) -> lang:get("副本[夺宝奇兵]");
get_cast(52041) -> lang:get("副本[夺宝奇兵]");
get_cast(52051) -> lang:get("副本[夺宝奇兵]");
get_cast(52071) -> lang:get("副本[夺宝奇兵]");
get_cast(52081) -> lang:get("副本[夺宝奇兵]");
get_cast(76126) -> lang:get("清河妖");
get_cast(76120) -> lang:get("讨伐妖王");
get_cast(74130) -> lang:get("中秋活动");
get_cast(74132) -> lang:get("中秋活动");
get_cast(74133) -> lang:get("中秋活动");
get_cast(_) -> false.

