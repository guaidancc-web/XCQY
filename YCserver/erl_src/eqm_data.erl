-file("src/data/eqm_data.erl", 1).

-module(eqm_data).

-export([get_base_attr/2,
         get_base_ratio/0,
         get_first_base/1,
         get_first_step/0,
         get_first_type/0,
         get_init/1,
         get_lev_attr/1,
         get_enchant_attr/1,
         enchant_attr/1,
         get_effect_attr/1,
         enchant_award/1,
         get_eqm_id/1,
         get_hole_reply_count/1,
         get_classes_effect_skill/1,
         get_comprehend_attr/1,
         get_comprehend_ignore/1,
         get_effect_skill/1,
         get_classes_modify_comprehend_attr/1,
         get_classes_modify_effect_skill/1]).

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

-file("src/data/eqm_data.erl", 31).

-file("inc/attr.hrl", 1).

-record(attr_base,
        {type = 0 :: non_neg_integer(),
         name = 0 :: pos_integer(),
         flag = 0 :: non_neg_integer(),
         calc_type = 0 :: non_neg_integer(),
         val = 0 :: non_neg_integer()}).

-record(attr,
        {ver = 3,
         fc = 0 :: non_neg_integer(),
         speed = 260 :: pos_integer(),
         hp_max = 0 :: non_neg_integer(),
         mp_max = 0 :: non_neg_integer(),
         atk_speed = 0 :: non_neg_integer(),
         phy_dmg = 0 :: non_neg_integer(),
         magic_dmg = 0 :: non_neg_integer(),
         phy_def = 0 :: non_neg_integer(),
         magic_def = 0 :: non_neg_integer(),
         crit = 0 :: non_neg_integer(),
         tenacity = 0 :: non_neg_integer(),
         accuracy = 0 :: non_neg_integer(),
         evasion = 0 :: non_neg_integer(),
         holy_dmg = 0 :: non_neg_integer(),
         crit_dmg = 0 :: non_neg_integer(),
         crit_dmg_def = 0 :: non_neg_integer(),
         dmg_ratio = 0 :: non_neg_integer(),
         def_ratio = 0 :: non_neg_integer(),
         enhance_control = 0 :: non_neg_integer(),
         anti_control = 0 :: non_neg_integer(),
         escape = 0 :: non_neg_integer(),
         anti_escape = 0 :: non_neg_integer(),
         capture = 0 :: non_neg_integer(),
         phy_def_ratio = 0 :: non_neg_integer(),
         magic_def_ratio = 0 :: non_neg_integer(),
         phy_accuracy = 0 :: non_neg_integer(),
         magic_accuracy = 0 :: non_neg_integer(),
         phy_evasion = 0 :: non_neg_integer(),
         magic_evasion = 0 :: non_neg_integer(),
         phy_crit = 0 :: non_neg_integer(),
         magic_crit = 0 :: non_neg_integer(),
         phy_tenacity = 0 :: non_neg_integer(),
         magic_tenacity = 0 :: non_neg_integer(),
         heal_val = 0 :: non_neg_integer(),
         heal_ratio = 0 :: non_neg_integer(),
         eff_heal_ratio = 0 :: non_neg_integer(),
         phy_dmg_ratio = 0 :: non_neg_integer(),
         magic_dmg_ratio = 0 :: non_neg_integer(),
         strength = 0,
         constitution = 0,
         magic = 0,
         agility = 0,
         endurance = 0,
         exp_ratio = 0}).

-record(attr_calc,
        {attr :: undefined | #attr{},
         attr_no_ratio :: undefined | #attr{},
         ratio :: undefined | #attr{},
         attr_no_fc :: undefined | #attr{},
         ratio_no_fc :: undefined | #attr{}}).

-record(m_attr_point,
        {ver = 2,
         ext_point = [],
         first_free = 0,
         valid_plan = 1,
         plan_data = [],
         change_plan_times = 0}).

-record(attr_point_plan,
        {index = 1 :: pos_integer(),
         plan_name = [],
         strength = 0 :: pos_integer(),
         constitution = 0 :: non_neg_integer(),
         magic = 0 :: non_neg_integer(),
         agility = 0 :: non_neg_integer(),
         endurance = 0 :: non_neg_integer(),
         pre_str = 0,
         pre_con = 0,
         pre_magic = 0,
         pre_agi = 0,
         pre_end = 0}).

-file("src/data/eqm_data.erl", 32).

get_base_attr(1, 1) ->
    [#attr_base{type = 0, calc_type = 1, name = 4,
                val = 42},
     #attr_base{type = 0, calc_type = 1, name = 5, val = 15},
     #attr_base{type = 0, calc_type = 1, name = 43,
                val = 40}];
get_base_attr(1, 10) ->
    [#attr_base{type = 0, calc_type = 1, name = 4,
                val = 125},
     #attr_base{type = 0, calc_type = 1, name = 5, val = 45},
     #attr_base{type = 0, calc_type = 1, name = 43,
                val = 119}];
get_base_attr(1, 20) ->
    [#attr_base{type = 0, calc_type = 1, name = 4,
                val = 292},
     #attr_base{type = 0, calc_type = 1, name = 5,
                val = 105},
     #attr_base{type = 0, calc_type = 1, name = 43,
                val = 276}];
get_base_attr(1, 30) ->
    [#attr_base{type = 0, calc_type = 1, name = 4,
                val = 459},
     #attr_base{type = 0, calc_type = 1, name = 5,
                val = 165},
     #attr_base{type = 0, calc_type = 1, name = 43,
                val = 433}];
get_base_attr(1, 40) ->
    [#attr_base{type = 0, calc_type = 1, name = 4,
                val = 625},
     #attr_base{type = 0, calc_type = 1, name = 5,
                val = 225},
     #attr_base{type = 0, calc_type = 1, name = 43,
                val = 591}];
get_base_attr(1, 50) ->
    [#attr_base{type = 0, calc_type = 1, name = 4,
                val = 792},
     #attr_base{type = 0, calc_type = 1, name = 5,
                val = 285},
     #attr_base{type = 0, calc_type = 1, name = 43,
                val = 748}];
get_base_attr(1, 60) ->
    [#attr_base{type = 0, calc_type = 1, name = 4,
                val = 959},
     #attr_base{type = 0, calc_type = 1, name = 5,
                val = 345},
     #attr_base{type = 0, calc_type = 1, name = 43,
                val = 906}];
get_base_attr(1, 70) ->
    [#attr_base{type = 0, calc_type = 1, name = 4,
                val = 1125},
     #attr_base{type = 0, calc_type = 1, name = 5,
                val = 405},
     #attr_base{type = 0, calc_type = 1, name = 43,
                val = 1063}];
get_base_attr(1, 80) ->
    [#attr_base{type = 0, calc_type = 1, name = 4,
                val = 1292},
     #attr_base{type = 0, calc_type = 1, name = 5,
                val = 465},
     #attr_base{type = 0, calc_type = 1, name = 43,
                val = 1221}];
get_base_attr(1, 90) ->
    [#attr_base{type = 0, calc_type = 1, name = 4,
                val = 1459},
     #attr_base{type = 0, calc_type = 1, name = 5,
                val = 525},
     #attr_base{type = 0, calc_type = 1, name = 43,
                val = 1378}];
get_base_attr(1, 100) ->
    [#attr_base{type = 0, calc_type = 1, name = 4,
                val = 1584},
     #attr_base{type = 0, calc_type = 1, name = 5,
                val = 570},
     #attr_base{type = 0, calc_type = 1, name = 43,
                val = 1496}];
get_base_attr(1, 110) ->
    [#attr_base{type = 0, calc_type = 1, name = 4,
                val = 1709},
     #attr_base{type = 0, calc_type = 1, name = 5,
                val = 615},
     #attr_base{type = 0, calc_type = 1, name = 43,
                val = 1614}];
get_base_attr(1, 120) ->
    [#attr_base{type = 0, calc_type = 1, name = 4,
                val = 1834},
     #attr_base{type = 0, calc_type = 1, name = 5,
                val = 661},
     #attr_base{type = 0, calc_type = 1, name = 43,
                val = 1732}];
get_base_attr(2, 1) ->
    [#attr_base{type = 0, calc_type = 1, name = 4,
                val = 42},
     #attr_base{type = 0, calc_type = 1, name = 5, val = 15},
     #attr_base{type = 0, calc_type = 1, name = 43,
                val = 40}];
get_base_attr(2, 10) ->
    [#attr_base{type = 0, calc_type = 1, name = 4,
                val = 125},
     #attr_base{type = 0, calc_type = 1, name = 5, val = 45},
     #attr_base{type = 0, calc_type = 1, name = 43,
                val = 119}];
get_base_attr(2, 20) ->
    [#attr_base{type = 0, calc_type = 1, name = 4,
                val = 292},
     #attr_base{type = 0, calc_type = 1, name = 5,
                val = 105},
     #attr_base{type = 0, calc_type = 1, name = 43,
                val = 276}];
get_base_attr(2, 30) ->
    [#attr_base{type = 0, calc_type = 1, name = 4,
                val = 459},
     #attr_base{type = 0, calc_type = 1, name = 5,
                val = 165},
     #attr_base{type = 0, calc_type = 1, name = 43,
                val = 433}];
get_base_attr(2, 40) ->
    [#attr_base{type = 0, calc_type = 1, name = 4,
                val = 625},
     #attr_base{type = 0, calc_type = 1, name = 5,
                val = 225},
     #attr_base{type = 0, calc_type = 1, name = 43,
                val = 591}];
get_base_attr(2, 50) ->
    [#attr_base{type = 0, calc_type = 1, name = 4,
                val = 792},
     #attr_base{type = 0, calc_type = 1, name = 5,
                val = 285},
     #attr_base{type = 0, calc_type = 1, name = 43,
                val = 748}];
get_base_attr(2, 60) ->
    [#attr_base{type = 0, calc_type = 1, name = 4,
                val = 959},
     #attr_base{type = 0, calc_type = 1, name = 5,
                val = 345},
     #attr_base{type = 0, calc_type = 1, name = 43,
                val = 906}];
get_base_attr(2, 70) ->
    [#attr_base{type = 0, calc_type = 1, name = 4,
                val = 1125},
     #attr_base{type = 0, calc_type = 1, name = 5,
                val = 405},
     #attr_base{type = 0, calc_type = 1, name = 43,
                val = 1063}];
get_base_attr(2, 80) ->
    [#attr_base{type = 0, calc_type = 1, name = 4,
                val = 1292},
     #attr_base{type = 0, calc_type = 1, name = 5,
                val = 465},
     #attr_base{type = 0, calc_type = 1, name = 43,
                val = 1221}];
get_base_attr(2, 90) ->
    [#attr_base{type = 0, calc_type = 1, name = 4,
                val = 1459},
     #attr_base{type = 0, calc_type = 1, name = 5,
                val = 525},
     #attr_base{type = 0, calc_type = 1, name = 43,
                val = 1378}];
get_base_attr(2, 100) ->
    [#attr_base{type = 0, calc_type = 1, name = 4,
                val = 1584},
     #attr_base{type = 0, calc_type = 1, name = 5,
                val = 570},
     #attr_base{type = 0, calc_type = 1, name = 43,
                val = 1496}];
get_base_attr(2, 110) ->
    [#attr_base{type = 0, calc_type = 1, name = 4,
                val = 1709},
     #attr_base{type = 0, calc_type = 1, name = 5,
                val = 615},
     #attr_base{type = 0, calc_type = 1, name = 43,
                val = 1614}];
get_base_attr(2, 120) ->
    [#attr_base{type = 0, calc_type = 1, name = 4,
                val = 1834},
     #attr_base{type = 0, calc_type = 1, name = 5,
                val = 661},
     #attr_base{type = 0, calc_type = 1, name = 43,
                val = 1732}];
get_base_attr(3, 1) ->
    [#attr_base{type = 0, calc_type = 1, name = 4,
                val = 42},
     #attr_base{type = 0, calc_type = 1, name = 5, val = 15},
     #attr_base{type = 0, calc_type = 1, name = 43,
                val = 40}];
get_base_attr(3, 10) ->
    [#attr_base{type = 0, calc_type = 1, name = 4,
                val = 125},
     #attr_base{type = 0, calc_type = 1, name = 5, val = 45},
     #attr_base{type = 0, calc_type = 1, name = 43,
                val = 119}];
get_base_attr(3, 20) ->
    [#attr_base{type = 0, calc_type = 1, name = 4,
                val = 292},
     #attr_base{type = 0, calc_type = 1, name = 5,
                val = 105},
     #attr_base{type = 0, calc_type = 1, name = 43,
                val = 276}];
get_base_attr(3, 30) ->
    [#attr_base{type = 0, calc_type = 1, name = 4,
                val = 459},
     #attr_base{type = 0, calc_type = 1, name = 5,
                val = 165},
     #attr_base{type = 0, calc_type = 1, name = 43,
                val = 433}];
get_base_attr(3, 40) ->
    [#attr_base{type = 0, calc_type = 1, name = 4,
                val = 625},
     #attr_base{type = 0, calc_type = 1, name = 5,
                val = 225},
     #attr_base{type = 0, calc_type = 1, name = 43,
                val = 591}];
get_base_attr(3, 50) ->
    [#attr_base{type = 0, calc_type = 1, name = 4,
                val = 792},
     #attr_base{type = 0, calc_type = 1, name = 5,
                val = 285},
     #attr_base{type = 0, calc_type = 1, name = 43,
                val = 748}];
get_base_attr(3, 60) ->
    [#attr_base{type = 0, calc_type = 1, name = 4,
                val = 959},
     #attr_base{type = 0, calc_type = 1, name = 5,
                val = 345},
     #attr_base{type = 0, calc_type = 1, name = 43,
                val = 906}];
get_base_attr(3, 70) ->
    [#attr_base{type = 0, calc_type = 1, name = 4,
                val = 1125},
     #attr_base{type = 0, calc_type = 1, name = 5,
                val = 405},
     #attr_base{type = 0, calc_type = 1, name = 43,
                val = 1063}];
get_base_attr(3, 80) ->
    [#attr_base{type = 0, calc_type = 1, name = 4,
                val = 1292},
     #attr_base{type = 0, calc_type = 1, name = 5,
                val = 465},
     #attr_base{type = 0, calc_type = 1, name = 43,
                val = 1221}];
get_base_attr(3, 90) ->
    [#attr_base{type = 0, calc_type = 1, name = 4,
                val = 1459},
     #attr_base{type = 0, calc_type = 1, name = 5,
                val = 525},
     #attr_base{type = 0, calc_type = 1, name = 43,
                val = 1378}];
get_base_attr(3, 100) ->
    [#attr_base{type = 0, calc_type = 1, name = 4,
                val = 1584},
     #attr_base{type = 0, calc_type = 1, name = 5,
                val = 570},
     #attr_base{type = 0, calc_type = 1, name = 43,
                val = 1496}];
get_base_attr(3, 110) ->
    [#attr_base{type = 0, calc_type = 1, name = 4,
                val = 1709},
     #attr_base{type = 0, calc_type = 1, name = 5,
                val = 615},
     #attr_base{type = 0, calc_type = 1, name = 43,
                val = 1614}];
get_base_attr(3, 120) ->
    [#attr_base{type = 0, calc_type = 1, name = 4,
                val = 1834},
     #attr_base{type = 0, calc_type = 1, name = 5,
                val = 661},
     #attr_base{type = 0, calc_type = 1, name = 43,
                val = 1732}];
get_base_attr(4, 1) ->
    [#attr_base{type = 0, calc_type = 1, name = 4,
                val = 42},
     #attr_base{type = 0, calc_type = 1, name = 5, val = 15},
     #attr_base{type = 0, calc_type = 1, name = 43,
                val = 40}];
get_base_attr(4, 10) ->
    [#attr_base{type = 0, calc_type = 1, name = 4,
                val = 125},
     #attr_base{type = 0, calc_type = 1, name = 5, val = 45},
     #attr_base{type = 0, calc_type = 1, name = 43,
                val = 119}];
get_base_attr(4, 20) ->
    [#attr_base{type = 0, calc_type = 1, name = 4,
                val = 292},
     #attr_base{type = 0, calc_type = 1, name = 5,
                val = 105},
     #attr_base{type = 0, calc_type = 1, name = 43,
                val = 276}];
get_base_attr(4, 30) ->
    [#attr_base{type = 0, calc_type = 1, name = 4,
                val = 459},
     #attr_base{type = 0, calc_type = 1, name = 5,
                val = 165},
     #attr_base{type = 0, calc_type = 1, name = 43,
                val = 433}];
get_base_attr(4, 40) ->
    [#attr_base{type = 0, calc_type = 1, name = 4,
                val = 625},
     #attr_base{type = 0, calc_type = 1, name = 5,
                val = 225},
     #attr_base{type = 0, calc_type = 1, name = 43,
                val = 591}];
get_base_attr(4, 50) ->
    [#attr_base{type = 0, calc_type = 1, name = 4,
                val = 792},
     #attr_base{type = 0, calc_type = 1, name = 5,
                val = 285},
     #attr_base{type = 0, calc_type = 1, name = 43,
                val = 748}];
get_base_attr(4, 60) ->
    [#attr_base{type = 0, calc_type = 1, name = 4,
                val = 959},
     #attr_base{type = 0, calc_type = 1, name = 5,
                val = 345},
     #attr_base{type = 0, calc_type = 1, name = 43,
                val = 906}];
get_base_attr(4, 70) ->
    [#attr_base{type = 0, calc_type = 1, name = 4,
                val = 1125},
     #attr_base{type = 0, calc_type = 1, name = 5,
                val = 405},
     #attr_base{type = 0, calc_type = 1, name = 43,
                val = 1063}];
get_base_attr(4, 80) ->
    [#attr_base{type = 0, calc_type = 1, name = 4,
                val = 1292},
     #attr_base{type = 0, calc_type = 1, name = 5,
                val = 465},
     #attr_base{type = 0, calc_type = 1, name = 43,
                val = 1221}];
get_base_attr(4, 90) ->
    [#attr_base{type = 0, calc_type = 1, name = 4,
                val = 1459},
     #attr_base{type = 0, calc_type = 1, name = 5,
                val = 525},
     #attr_base{type = 0, calc_type = 1, name = 43,
                val = 1378}];
get_base_attr(4, 100) ->
    [#attr_base{type = 0, calc_type = 1, name = 4,
                val = 1584},
     #attr_base{type = 0, calc_type = 1, name = 5,
                val = 570},
     #attr_base{type = 0, calc_type = 1, name = 43,
                val = 1496}];
get_base_attr(4, 110) ->
    [#attr_base{type = 0, calc_type = 1, name = 4,
                val = 1709},
     #attr_base{type = 0, calc_type = 1, name = 5,
                val = 615},
     #attr_base{type = 0, calc_type = 1, name = 43,
                val = 1614}];
get_base_attr(4, 120) ->
    [#attr_base{type = 0, calc_type = 1, name = 4,
                val = 1834},
     #attr_base{type = 0, calc_type = 1, name = 5,
                val = 661},
     #attr_base{type = 0, calc_type = 1, name = 43,
                val = 1732}];
get_base_attr(5, 1) ->
    [#attr_base{type = 0, calc_type = 1, name = 4,
                val = 42},
     #attr_base{type = 0, calc_type = 1, name = 5, val = 15},
     #attr_base{type = 0, calc_type = 1, name = 43,
                val = 40}];
get_base_attr(5, 10) ->
    [#attr_base{type = 0, calc_type = 1, name = 4,
                val = 125},
     #attr_base{type = 0, calc_type = 1, name = 5, val = 45},
     #attr_base{type = 0, calc_type = 1, name = 43,
                val = 119}];
get_base_attr(5, 20) ->
    [#attr_base{type = 0, calc_type = 1, name = 4,
                val = 292},
     #attr_base{type = 0, calc_type = 1, name = 5,
                val = 105},
     #attr_base{type = 0, calc_type = 1, name = 43,
                val = 276}];
get_base_attr(5, 30) ->
    [#attr_base{type = 0, calc_type = 1, name = 4,
                val = 459},
     #attr_base{type = 0, calc_type = 1, name = 5,
                val = 165},
     #attr_base{type = 0, calc_type = 1, name = 43,
                val = 433}];
get_base_attr(5, 40) ->
    [#attr_base{type = 0, calc_type = 1, name = 4,
                val = 625},
     #attr_base{type = 0, calc_type = 1, name = 5,
                val = 225},
     #attr_base{type = 0, calc_type = 1, name = 43,
                val = 591}];
get_base_attr(5, 50) ->
    [#attr_base{type = 0, calc_type = 1, name = 4,
                val = 792},
     #attr_base{type = 0, calc_type = 1, name = 5,
                val = 285},
     #attr_base{type = 0, calc_type = 1, name = 43,
                val = 748}];
get_base_attr(5, 60) ->
    [#attr_base{type = 0, calc_type = 1, name = 4,
                val = 959},
     #attr_base{type = 0, calc_type = 1, name = 5,
                val = 345},
     #attr_base{type = 0, calc_type = 1, name = 43,
                val = 906}];
get_base_attr(5, 70) ->
    [#attr_base{type = 0, calc_type = 1, name = 4,
                val = 1125},
     #attr_base{type = 0, calc_type = 1, name = 5,
                val = 405},
     #attr_base{type = 0, calc_type = 1, name = 43,
                val = 1063}];
get_base_attr(5, 80) ->
    [#attr_base{type = 0, calc_type = 1, name = 4,
                val = 1292},
     #attr_base{type = 0, calc_type = 1, name = 5,
                val = 465},
     #attr_base{type = 0, calc_type = 1, name = 43,
                val = 1221}];
get_base_attr(5, 90) ->
    [#attr_base{type = 0, calc_type = 1, name = 4,
                val = 1459},
     #attr_base{type = 0, calc_type = 1, name = 5,
                val = 525},
     #attr_base{type = 0, calc_type = 1, name = 43,
                val = 1378}];
get_base_attr(5, 100) ->
    [#attr_base{type = 0, calc_type = 1, name = 4,
                val = 1584},
     #attr_base{type = 0, calc_type = 1, name = 5,
                val = 570},
     #attr_base{type = 0, calc_type = 1, name = 43,
                val = 1496}];
get_base_attr(5, 110) ->
    [#attr_base{type = 0, calc_type = 1, name = 4,
                val = 1709},
     #attr_base{type = 0, calc_type = 1, name = 5,
                val = 615},
     #attr_base{type = 0, calc_type = 1, name = 43,
                val = 1614}];
get_base_attr(5, 120) ->
    [#attr_base{type = 0, calc_type = 1, name = 4,
                val = 1834},
     #attr_base{type = 0, calc_type = 1, name = 5,
                val = 661},
     #attr_base{type = 0, calc_type = 1, name = 43,
                val = 1732}];
get_base_attr(21, 1) ->
    [#attr_base{type = 0, calc_type = 1, name = 4,
                val = 42},
     #attr_base{type = 0, calc_type = 1, name = 5, val = 15},
     #attr_base{type = 0, calc_type = 1, name = 43,
                val = 40}];
get_base_attr(21, 10) ->
    [#attr_base{type = 0, calc_type = 1, name = 4,
                val = 125},
     #attr_base{type = 0, calc_type = 1, name = 5, val = 45},
     #attr_base{type = 0, calc_type = 1, name = 43,
                val = 119}];
get_base_attr(21, 20) ->
    [#attr_base{type = 0, calc_type = 1, name = 4,
                val = 292},
     #attr_base{type = 0, calc_type = 1, name = 5,
                val = 105},
     #attr_base{type = 0, calc_type = 1, name = 43,
                val = 276}];
get_base_attr(21, 30) ->
    [#attr_base{type = 0, calc_type = 1, name = 4,
                val = 459},
     #attr_base{type = 0, calc_type = 1, name = 5,
                val = 165},
     #attr_base{type = 0, calc_type = 1, name = 43,
                val = 433}];
get_base_attr(21, 40) ->
    [#attr_base{type = 0, calc_type = 1, name = 4,
                val = 625},
     #attr_base{type = 0, calc_type = 1, name = 5,
                val = 225},
     #attr_base{type = 0, calc_type = 1, name = 43,
                val = 591}];
get_base_attr(21, 50) ->
    [#attr_base{type = 0, calc_type = 1, name = 4,
                val = 792},
     #attr_base{type = 0, calc_type = 1, name = 5,
                val = 285},
     #attr_base{type = 0, calc_type = 1, name = 43,
                val = 748}];
get_base_attr(21, 60) ->
    [#attr_base{type = 0, calc_type = 1, name = 4,
                val = 959},
     #attr_base{type = 0, calc_type = 1, name = 5,
                val = 345},
     #attr_base{type = 0, calc_type = 1, name = 43,
                val = 906}];
get_base_attr(21, 70) ->
    [#attr_base{type = 0, calc_type = 1, name = 4,
                val = 1125},
     #attr_base{type = 0, calc_type = 1, name = 5,
                val = 405},
     #attr_base{type = 0, calc_type = 1, name = 43,
                val = 1063}];
get_base_attr(21, 80) ->
    [#attr_base{type = 0, calc_type = 1, name = 4,
                val = 1292},
     #attr_base{type = 0, calc_type = 1, name = 5,
                val = 465},
     #attr_base{type = 0, calc_type = 1, name = 43,
                val = 1221}];
get_base_attr(21, 90) ->
    [#attr_base{type = 0, calc_type = 1, name = 4,
                val = 1459},
     #attr_base{type = 0, calc_type = 1, name = 5,
                val = 525},
     #attr_base{type = 0, calc_type = 1, name = 43,
                val = 1378}];
get_base_attr(21, 100) ->
    [#attr_base{type = 0, calc_type = 1, name = 4,
                val = 1584},
     #attr_base{type = 0, calc_type = 1, name = 5,
                val = 570},
     #attr_base{type = 0, calc_type = 1, name = 43,
                val = 1496}];
get_base_attr(21, 110) ->
    [#attr_base{type = 0, calc_type = 1, name = 4,
                val = 1709},
     #attr_base{type = 0, calc_type = 1, name = 5,
                val = 615},
     #attr_base{type = 0, calc_type = 1, name = 43,
                val = 1614}];
get_base_attr(21, 120) ->
    [#attr_base{type = 0, calc_type = 1, name = 4,
                val = 1834},
     #attr_base{type = 0, calc_type = 1, name = 5,
                val = 661},
     #attr_base{type = 0, calc_type = 1, name = 43,
                val = 1732}];
get_base_attr(22, 1) ->
    [#attr_base{type = 0, calc_type = 1, name = 4,
                val = 42},
     #attr_base{type = 0, calc_type = 1, name = 5, val = 15},
     #attr_base{type = 0, calc_type = 1, name = 43,
                val = 40}];
get_base_attr(22, 10) ->
    [#attr_base{type = 0, calc_type = 1, name = 4,
                val = 125},
     #attr_base{type = 0, calc_type = 1, name = 5, val = 45},
     #attr_base{type = 0, calc_type = 1, name = 43,
                val = 119}];
get_base_attr(22, 20) ->
    [#attr_base{type = 0, calc_type = 1, name = 4,
                val = 292},
     #attr_base{type = 0, calc_type = 1, name = 5,
                val = 105},
     #attr_base{type = 0, calc_type = 1, name = 43,
                val = 276}];
get_base_attr(22, 30) ->
    [#attr_base{type = 0, calc_type = 1, name = 4,
                val = 459},
     #attr_base{type = 0, calc_type = 1, name = 5,
                val = 165},
     #attr_base{type = 0, calc_type = 1, name = 43,
                val = 433}];
get_base_attr(22, 40) ->
    [#attr_base{type = 0, calc_type = 1, name = 4,
                val = 625},
     #attr_base{type = 0, calc_type = 1, name = 5,
                val = 225},
     #attr_base{type = 0, calc_type = 1, name = 43,
                val = 591}];
get_base_attr(22, 50) ->
    [#attr_base{type = 0, calc_type = 1, name = 4,
                val = 792},
     #attr_base{type = 0, calc_type = 1, name = 5,
                val = 285},
     #attr_base{type = 0, calc_type = 1, name = 43,
                val = 748}];
get_base_attr(22, 60) ->
    [#attr_base{type = 0, calc_type = 1, name = 4,
                val = 959},
     #attr_base{type = 0, calc_type = 1, name = 5,
                val = 345},
     #attr_base{type = 0, calc_type = 1, name = 43,
                val = 906}];
get_base_attr(22, 70) ->
    [#attr_base{type = 0, calc_type = 1, name = 4,
                val = 1125},
     #attr_base{type = 0, calc_type = 1, name = 5,
                val = 405},
     #attr_base{type = 0, calc_type = 1, name = 43,
                val = 1063}];
get_base_attr(22, 80) ->
    [#attr_base{type = 0, calc_type = 1, name = 4,
                val = 1292},
     #attr_base{type = 0, calc_type = 1, name = 5,
                val = 465},
     #attr_base{type = 0, calc_type = 1, name = 43,
                val = 1221}];
get_base_attr(22, 90) ->
    [#attr_base{type = 0, calc_type = 1, name = 4,
                val = 1459},
     #attr_base{type = 0, calc_type = 1, name = 5,
                val = 525},
     #attr_base{type = 0, calc_type = 1, name = 43,
                val = 1378}];
get_base_attr(22, 100) ->
    [#attr_base{type = 0, calc_type = 1, name = 4,
                val = 1584},
     #attr_base{type = 0, calc_type = 1, name = 5,
                val = 570},
     #attr_base{type = 0, calc_type = 1, name = 43,
                val = 1496}];
get_base_attr(22, 110) ->
    [#attr_base{type = 0, calc_type = 1, name = 4,
                val = 1709},
     #attr_base{type = 0, calc_type = 1, name = 5,
                val = 615},
     #attr_base{type = 0, calc_type = 1, name = 43,
                val = 1614}];
get_base_attr(22, 120) ->
    [#attr_base{type = 0, calc_type = 1, name = 4,
                val = 1834},
     #attr_base{type = 0, calc_type = 1, name = 5,
                val = 661},
     #attr_base{type = 0, calc_type = 1, name = 43,
                val = 1732}];
get_base_attr(6, 1) ->
    [#attr_base{type = 0, calc_type = 1, name = 4,
                val = 18},
     #attr_base{type = 0, calc_type = 1, name = 26,
                val = 4}];
get_base_attr(6, 10) ->
    [#attr_base{type = 0, calc_type = 1, name = 4,
                val = 54},
     #attr_base{type = 0, calc_type = 1, name = 26,
                val = 12}];
get_base_attr(6, 20) ->
    [#attr_base{type = 0, calc_type = 1, name = 4,
                val = 125},
     #attr_base{type = 0, calc_type = 1, name = 26,
                val = 26}];
get_base_attr(6, 30) ->
    [#attr_base{type = 0, calc_type = 1, name = 4,
                val = 197},
     #attr_base{type = 0, calc_type = 1, name = 26,
                val = 41}];
get_base_attr(6, 40) ->
    [#attr_base{type = 0, calc_type = 1, name = 4,
                val = 268},
     #attr_base{type = 0, calc_type = 1, name = 26,
                val = 56}];
get_base_attr(6, 50) ->
    [#attr_base{type = 0, calc_type = 1, name = 4,
                val = 340},
     #attr_base{type = 0, calc_type = 1, name = 26,
                val = 71}];
get_base_attr(6, 60) ->
    [#attr_base{type = 0, calc_type = 1, name = 4,
                val = 411},
     #attr_base{type = 0, calc_type = 1, name = 26,
                val = 86}];
get_base_attr(6, 70) ->
    [#attr_base{type = 0, calc_type = 1, name = 4,
                val = 483},
     #attr_base{type = 0, calc_type = 1, name = 26,
                val = 100}];
get_base_attr(6, 80) ->
    [#attr_base{type = 0, calc_type = 1, name = 4,
                val = 554},
     #attr_base{type = 0, calc_type = 1, name = 26,
                val = 115}];
get_base_attr(6, 90) ->
    [#attr_base{type = 0, calc_type = 1, name = 4,
                val = 625},
     #attr_base{type = 0, calc_type = 1, name = 26,
                val = 130}];
get_base_attr(6, 100) ->
    [#attr_base{type = 0, calc_type = 1, name = 4,
                val = 679},
     #attr_base{type = 0, calc_type = 1, name = 26,
                val = 141}];
get_base_attr(6, 110) ->
    [#attr_base{type = 0, calc_type = 1, name = 4,
                val = 733},
     #attr_base{type = 0, calc_type = 1, name = 26,
                val = 152}];
get_base_attr(6, 120) ->
    [#attr_base{type = 0, calc_type = 1, name = 4,
                val = 786},
     #attr_base{type = 0, calc_type = 1, name = 26,
                val = 163}];
get_base_attr(7, 1) ->
    [#attr_base{type = 0, calc_type = 1, name = 5,
                val = 28},
     #attr_base{type = 0, calc_type = 1, name = 7, val = 8}];
get_base_attr(7, 10) ->
    [#attr_base{type = 0, calc_type = 1, name = 5,
                val = 84},
     #attr_base{type = 0, calc_type = 1, name = 7,
                val = 23}];
get_base_attr(7, 20) ->
    [#attr_base{type = 0, calc_type = 1, name = 5,
                val = 195},
     #attr_base{type = 0, calc_type = 1, name = 7,
                val = 52}];
get_base_attr(7, 30) ->
    [#attr_base{type = 0, calc_type = 1, name = 5,
                val = 307},
     #attr_base{type = 0, calc_type = 1, name = 7,
                val = 82}];
get_base_attr(7, 40) ->
    [#attr_base{type = 0, calc_type = 1, name = 5,
                val = 418},
     #attr_base{type = 0, calc_type = 1, name = 7,
                val = 112}];
get_base_attr(7, 50) ->
    [#attr_base{type = 0, calc_type = 1, name = 5,
                val = 530},
     #attr_base{type = 0, calc_type = 1, name = 7,
                val = 142}];
get_base_attr(7, 60) ->
    [#attr_base{type = 0, calc_type = 1, name = 5,
                val = 641},
     #attr_base{type = 0, calc_type = 1, name = 7,
                val = 171}];
get_base_attr(7, 70) ->
    [#attr_base{type = 0, calc_type = 1, name = 5,
                val = 753},
     #attr_base{type = 0, calc_type = 1, name = 7,
                val = 201}];
get_base_attr(7, 80) ->
    [#attr_base{type = 0, calc_type = 1, name = 5,
                val = 864},
     #attr_base{type = 0, calc_type = 1, name = 7,
                val = 270}];
get_base_attr(7, 90) ->
    [#attr_base{type = 0, calc_type = 1, name = 5,
                val = 975},
     #attr_base{type = 0, calc_type = 1, name = 7,
                val = 305}];
get_base_attr(7, 100) ->
    [#attr_base{type = 0, calc_type = 1, name = 5,
                val = 1059},
     #attr_base{type = 0, calc_type = 1, name = 7,
                val = 331}];
get_base_attr(7, 110) ->
    [#attr_base{type = 0, calc_type = 1, name = 5,
                val = 1143},
     #attr_base{type = 0, calc_type = 1, name = 7,
                val = 356}];
get_base_attr(7, 120) ->
    [#attr_base{type = 0, calc_type = 1, name = 5,
                val = 1226},
     #attr_base{type = 0, calc_type = 1, name = 7,
                val = 382}];
get_base_attr(9, 1) ->
    [#attr_base{type = 0, calc_type = 1, name = 1,
                val = 26},
     #attr_base{type = 0, calc_type = 1, name = 25,
                val = 4}];
get_base_attr(9, 10) ->
    [#attr_base{type = 0, calc_type = 1, name = 1,
                val = 76},
     #attr_base{type = 0, calc_type = 1, name = 25,
                val = 12}];
get_base_attr(9, 20) ->
    [#attr_base{type = 0, calc_type = 1, name = 1,
                val = 177},
     #attr_base{type = 0, calc_type = 1, name = 25,
                val = 26}];
get_base_attr(9, 30) ->
    [#attr_base{type = 0, calc_type = 1, name = 1,
                val = 278},
     #attr_base{type = 0, calc_type = 1, name = 25,
                val = 41}];
get_base_attr(9, 40) ->
    [#attr_base{type = 0, calc_type = 1, name = 1,
                val = 378},
     #attr_base{type = 0, calc_type = 1, name = 25,
                val = 56}];
get_base_attr(9, 50) ->
    [#attr_base{type = 0, calc_type = 1, name = 1,
                val = 479},
     #attr_base{type = 0, calc_type = 1, name = 25,
                val = 71}];
get_base_attr(9, 60) ->
    [#attr_base{type = 0, calc_type = 1, name = 1,
                val = 580},
     #attr_base{type = 0, calc_type = 1, name = 25,
                val = 86}];
get_base_attr(9, 70) ->
    [#attr_base{type = 0, calc_type = 1, name = 1,
                val = 681},
     #attr_base{type = 0, calc_type = 1, name = 25,
                val = 100}];
get_base_attr(9, 80) ->
    [#attr_base{type = 0, calc_type = 1, name = 1,
                val = 782},
     #attr_base{type = 0, calc_type = 1, name = 25,
                val = 115}];
get_base_attr(9, 90) ->
    [#attr_base{type = 0, calc_type = 1, name = 1,
                val = 882},
     #attr_base{type = 0, calc_type = 1, name = 25,
                val = 130}];
get_base_attr(9, 100) ->
    [#attr_base{type = 0, calc_type = 1, name = 1,
                val = 958},
     #attr_base{type = 0, calc_type = 1, name = 25,
                val = 141}];
get_base_attr(9, 110) ->
    [#attr_base{type = 0, calc_type = 1, name = 1,
                val = 1034},
     #attr_base{type = 0, calc_type = 1, name = 25,
                val = 152}];
get_base_attr(9, 120) ->
    [#attr_base{type = 0, calc_type = 1, name = 1,
                val = 1109},
     #attr_base{type = 0, calc_type = 1, name = 25,
                val = 163}];
get_base_attr(10, 1) ->
    [#attr_base{type = 0, calc_type = 1, name = 6,
                val = 19}];
get_base_attr(10, 10) ->
    [#attr_base{type = 0, calc_type = 1, name = 6,
                val = 57}];
get_base_attr(10, 20) ->
    [#attr_base{type = 0, calc_type = 1, name = 6,
                val = 133}];
get_base_attr(10, 30) ->
    [#attr_base{type = 0, calc_type = 1, name = 6,
                val = 209}];
get_base_attr(10, 40) ->
    [#attr_base{type = 0, calc_type = 1, name = 6,
                val = 285}];
get_base_attr(10, 50) ->
    [#attr_base{type = 0, calc_type = 1, name = 6,
                val = 361}];
get_base_attr(10, 60) ->
    [#attr_base{type = 0, calc_type = 1, name = 6,
                val = 437}];
get_base_attr(10, 70) ->
    [#attr_base{type = 0, calc_type = 1, name = 6,
                val = 512}];
get_base_attr(10, 80) ->
    [#attr_base{type = 0, calc_type = 1, name = 6,
                val = 672}];
get_base_attr(10, 90) ->
    [#attr_base{type = 0, calc_type = 1, name = 6,
                val = 759}];
get_base_attr(10, 100) ->
    [#attr_base{type = 0, calc_type = 1, name = 6,
                val = 824}];
get_base_attr(10, 110) ->
    [#attr_base{type = 0, calc_type = 1, name = 6,
                val = 888}];
get_base_attr(10, 120) ->
    [#attr_base{type = 0, calc_type = 1, name = 6,
                val = 954}];
get_base_attr(11, 1) ->
    [#attr_base{type = 0, calc_type = 1, name = 1,
                val = 59},
     #attr_base{type = 0, calc_type = 1, name = 6, val = 3}];
get_base_attr(11, 10) ->
    [#attr_base{type = 0, calc_type = 1, name = 1,
                val = 177},
     #attr_base{type = 0, calc_type = 1, name = 6, val = 9}];
get_base_attr(11, 20) ->
    [#attr_base{type = 0, calc_type = 1, name = 1,
                val = 412},
     #attr_base{type = 0, calc_type = 1, name = 6,
                val = 19}];
get_base_attr(11, 30) ->
    [#attr_base{type = 0, calc_type = 1, name = 1,
                val = 647},
     #attr_base{type = 0, calc_type = 1, name = 6,
                val = 30}];
get_base_attr(11, 40) ->
    [#attr_base{type = 0, calc_type = 1, name = 1,
                val = 882},
     #attr_base{type = 0, calc_type = 1, name = 6,
                val = 41}];
get_base_attr(11, 50) ->
    [#attr_base{type = 0, calc_type = 1, name = 1,
                val = 1118},
     #attr_base{type = 0, calc_type = 1, name = 6,
                val = 52}];
get_base_attr(11, 60) ->
    [#attr_base{type = 0, calc_type = 1, name = 1,
                val = 1353},
     #attr_base{type = 0, calc_type = 1, name = 6,
                val = 63}];
get_base_attr(11, 70) ->
    [#attr_base{type = 0, calc_type = 1, name = 1,
                val = 1588},
     #attr_base{type = 0, calc_type = 1, name = 6,
                val = 74}];
get_base_attr(11, 80) ->
    [#attr_base{type = 0, calc_type = 1, name = 1,
                val = 1823},
     #attr_base{type = 0, calc_type = 1, name = 6,
                val = 96}];
get_base_attr(11, 90) ->
    [#attr_base{type = 0, calc_type = 1, name = 1,
                val = 2058},
     #attr_base{type = 0, calc_type = 1, name = 6,
                val = 109}];
get_base_attr(11, 100) ->
    [#attr_base{type = 0, calc_type = 1, name = 1,
                val = 2235},
     #attr_base{type = 0, calc_type = 1, name = 6,
                val = 119}];
get_base_attr(11, 110) ->
    [#attr_base{type = 0, calc_type = 1, name = 1,
                val = 2411},
     #attr_base{type = 0, calc_type = 1, name = 6,
                val = 128}];
get_base_attr(11, 120) ->
    [#attr_base{type = 0, calc_type = 1, name = 1,
                val = 2588},
     #attr_base{type = 0, calc_type = 1, name = 6,
                val = 138}];
get_base_attr(12, 1) ->
    [#attr_base{type = 0, calc_type = 1, name = 2,
                val = 234},
     #attr_base{type = 0, calc_type = 1, name = 7,
                val = 12}];
get_base_attr(12, 10) ->
    [#attr_base{type = 0, calc_type = 1, name = 2,
                val = 312},
     #attr_base{type = 0, calc_type = 1, name = 7,
                val = 34}];
get_base_attr(12, 20) ->
    [#attr_base{type = 0, calc_type = 1, name = 2,
                val = 390},
     #attr_base{type = 0, calc_type = 1, name = 7,
                val = 78}];
get_base_attr(12, 30) ->
    [#attr_base{type = 0, calc_type = 1, name = 2,
                val = 468},
     #attr_base{type = 0, calc_type = 1, name = 7,
                val = 123}];
get_base_attr(12, 40) ->
    [#attr_base{type = 0, calc_type = 1, name = 2,
                val = 546},
     #attr_base{type = 0, calc_type = 1, name = 7,
                val = 168}];
get_base_attr(12, 50) ->
    [#attr_base{type = 0, calc_type = 1, name = 2,
                val = 624},
     #attr_base{type = 0, calc_type = 1, name = 7,
                val = 212}];
get_base_attr(12, 60) ->
    [#attr_base{type = 0, calc_type = 1, name = 2,
                val = 702},
     #attr_base{type = 0, calc_type = 1, name = 7,
                val = 257}];
get_base_attr(12, 70) ->
    [#attr_base{type = 0, calc_type = 1, name = 2,
                val = 780},
     #attr_base{type = 0, calc_type = 1, name = 7,
                val = 301}];
get_base_attr(12, 80) ->
    [#attr_base{type = 0, calc_type = 1, name = 2,
                val = 858},
     #attr_base{type = 0, calc_type = 1, name = 7,
                val = 405}];
get_base_attr(12, 90) ->
    [#attr_base{type = 0, calc_type = 1, name = 2,
                val = 936},
     #attr_base{type = 0, calc_type = 1, name = 7,
                val = 455}];
get_base_attr(12, 100) ->
    [#attr_base{type = 0, calc_type = 1, name = 2,
                val = 1014},
     #attr_base{type = 0, calc_type = 1, name = 7,
                val = 496}];
get_base_attr(12, 110) ->
    [#attr_base{type = 0, calc_type = 1, name = 2,
                val = 1092},
     #attr_base{type = 0, calc_type = 1, name = 7,
                val = 534}];
get_base_attr(12, 120) ->
    [#attr_base{type = 0, calc_type = 1, name = 2,
                val = 1170},
     #attr_base{type = 0, calc_type = 1, name = 7,
                val = 573}];
get_base_attr(14, 1) ->
    [#attr_base{type = 0, calc_type = 1, name = 3, val = 3},
     #attr_base{type = 0, calc_type = 1, name = 6, val = 6}];
get_base_attr(14, 10) ->
    [#attr_base{type = 0, calc_type = 1, name = 3, val = 7},
     #attr_base{type = 0, calc_type = 1, name = 6,
                val = 17}];
get_base_attr(14, 20) ->
    [#attr_base{type = 0, calc_type = 1, name = 3,
                val = 16},
     #attr_base{type = 0, calc_type = 1, name = 6,
                val = 38}];
get_base_attr(14, 30) ->
    [#attr_base{type = 0, calc_type = 1, name = 3,
                val = 25},
     #attr_base{type = 0, calc_type = 1, name = 6,
                val = 60}];
get_base_attr(14, 40) ->
    [#attr_base{type = 0, calc_type = 1, name = 3,
                val = 34},
     #attr_base{type = 0, calc_type = 1, name = 6,
                val = 82}];
get_base_attr(14, 50) ->
    [#attr_base{type = 0, calc_type = 1, name = 3,
                val = 43},
     #attr_base{type = 0, calc_type = 1, name = 6,
                val = 103}];
get_base_attr(14, 60) ->
    [#attr_base{type = 0, calc_type = 1, name = 3,
                val = 52},
     #attr_base{type = 0, calc_type = 1, name = 6,
                val = 125}];
get_base_attr(14, 70) ->
    [#attr_base{type = 0, calc_type = 1, name = 3,
                val = 60},
     #attr_base{type = 0, calc_type = 1, name = 6,
                val = 147}];
get_base_attr(14, 80) ->
    [#attr_base{type = 0, calc_type = 1, name = 3,
                val = 69},
     #attr_base{type = 0, calc_type = 1, name = 6,
                val = 192}];
get_base_attr(14, 90) ->
    [#attr_base{type = 0, calc_type = 1, name = 3,
                val = 78},
     #attr_base{type = 0, calc_type = 1, name = 6,
                val = 218}];
get_base_attr(14, 100) ->
    [#attr_base{type = 0, calc_type = 1, name = 3,
                val = 85},
     #attr_base{type = 0, calc_type = 1, name = 6,
                val = 236}];
get_base_attr(14, 110) ->
    [#attr_base{type = 0, calc_type = 1, name = 3,
                val = 92},
     #attr_base{type = 0, calc_type = 1, name = 6,
                val = 255}];
get_base_attr(14, 120) ->
    [#attr_base{type = 0, calc_type = 1, name = 3,
                val = 92},
     #attr_base{type = 0, calc_type = 1, name = 6,
                val = 274}];
get_base_attr(_, _) -> [].

get_base_ratio() ->
    [{1, 40, 1, 1, 800, 0},
     {1, 40, 1, 2, 830, 0},
     {1, 40, 1, 3, 860, 0},
     {1, 40, 1, 4, 890, 0},
     {1, 40, 1, 5, 920, 0},
     {1, 40, 1, 6, 940, 220},
     {1, 40, 1, 7, 950, 220},
     {1, 40, 1, 8, 960, 220},
     {1, 40, 1, 9, 980, 220},
     {1, 40, 1, 10, 1000, 0},
     {1, 40, 1, 11, 1010, 0},
     {1, 40, 1, 12, 1020, 0},
     {1, 40, 1, 13, 1030, 40},
     {1, 40, 1, 14, 1040, 40},
     {1, 40, 1, 15, 1050, 40},
     {1, 40, 2, 1, 800, 0},
     {1, 40, 2, 2, 830, 0},
     {1, 40, 2, 3, 860, 0},
     {1, 40, 2, 4, 890, 0},
     {1, 40, 2, 5, 920, 0},
     {1, 40, 2, 6, 940, 220},
     {1, 40, 2, 7, 950, 220},
     {1, 40, 2, 8, 970, 220},
     {1, 40, 2, 9, 990, 220},
     {1, 40, 2, 10, 1000, 0},
     {1, 40, 2, 11, 1010, 0},
     {1, 40, 2, 12, 1020, 0},
     {1, 40, 2, 13, 1030, 40},
     {1, 40, 2, 14, 1040, 40},
     {1, 40, 2, 15, 1050, 40},
     {1, 40, 3, 1, 800, 0},
     {1, 40, 3, 2, 830, 0},
     {1, 40, 3, 3, 860, 0},
     {1, 40, 3, 4, 890, 0},
     {1, 40, 3, 5, 920, 0},
     {1, 40, 3, 6, 940, 220},
     {1, 40, 3, 7, 950, 220},
     {1, 40, 3, 8, 970, 220},
     {1, 40, 3, 9, 990, 220},
     {1, 40, 3, 10, 1000, 0},
     {1, 40, 3, 11, 1010, 0},
     {1, 40, 3, 12, 1020, 0},
     {1, 40, 3, 13, 1030, 40},
     {1, 40, 3, 14, 1040, 40},
     {1, 40, 3, 15, 1050, 40},
     {1, 40, 4, 1, 800, 0},
     {1, 40, 4, 2, 830, 0},
     {1, 40, 4, 3, 860, 0},
     {1, 40, 4, 4, 890, 0},
     {1, 40, 4, 5, 920, 0},
     {1, 40, 4, 6, 940, 220},
     {1, 40, 4, 7, 950, 220},
     {1, 40, 4, 8, 970, 220},
     {1, 40, 4, 9, 990, 220},
     {1, 40, 4, 10, 1000, 0},
     {1, 40, 4, 11, 1010, 0},
     {1, 40, 4, 12, 1020, 0},
     {1, 40, 4, 13, 1030, 40},
     {1, 40, 4, 14, 1040, 40},
     {1, 40, 4, 15, 1050, 40},
     {1, 40, 5, 1, 800, 0},
     {1, 40, 5, 2, 830, 0},
     {1, 40, 5, 3, 860, 0},
     {1, 40, 5, 4, 890, 0},
     {1, 40, 5, 5, 920, 0},
     {1, 40, 5, 6, 940, 220},
     {1, 40, 5, 7, 950, 220},
     {1, 40, 5, 8, 970, 220},
     {1, 40, 5, 9, 990, 220},
     {1, 40, 5, 10, 1000, 0},
     {1, 40, 5, 11, 1010, 0},
     {1, 40, 5, 12, 1020, 0},
     {1, 40, 5, 13, 1030, 40},
     {1, 40, 5, 14, 1040, 40},
     {1, 40, 5, 15, 1050, 40},
     {1, 40, 6, 1, 800, 0},
     {1, 40, 6, 2, 830, 0},
     {1, 40, 6, 3, 860, 0},
     {1, 40, 6, 4, 890, 0},
     {1, 40, 6, 5, 920, 0},
     {1, 40, 6, 6, 940, 220},
     {1, 40, 6, 7, 950, 220},
     {1, 40, 6, 8, 970, 220},
     {1, 40, 6, 9, 990, 220},
     {1, 40, 6, 10, 1000, 0},
     {1, 40, 6, 11, 1010, 0},
     {1, 40, 6, 12, 1020, 0},
     {1, 40, 6, 13, 1030, 40},
     {1, 40, 6, 14, 1040, 40},
     {1, 40, 6, 15, 1050, 40},
     {1, 40, 7, 1, 800, 0},
     {1, 40, 7, 2, 830, 0},
     {1, 40, 7, 3, 860, 0},
     {1, 40, 7, 4, 890, 0},
     {1, 40, 7, 5, 920, 0},
     {1, 40, 7, 6, 940, 220},
     {1, 40, 7, 7, 950, 220},
     {1, 40, 7, 8, 970, 220},
     {1, 40, 7, 9, 990, 220},
     {1, 40, 7, 10, 1000, 0},
     {1, 40, 7, 11, 1010, 0},
     {1, 40, 7, 12, 1020, 0},
     {1, 40, 7, 13, 1030, 40},
     {1, 40, 7, 14, 1040, 40},
     {1, 40, 7, 15, 1050, 40},
     {1, 40, 25, 1, 800, 0},
     {1, 40, 25, 2, 830, 0},
     {1, 40, 25, 3, 860, 0},
     {1, 40, 25, 4, 890, 0},
     {1, 40, 25, 5, 920, 0},
     {1, 40, 25, 6, 940, 220},
     {1, 40, 25, 7, 950, 220},
     {1, 40, 25, 8, 970, 220},
     {1, 40, 25, 9, 990, 220},
     {1, 40, 25, 10, 1000, 0},
     {1, 40, 25, 11, 1010, 0},
     {1, 40, 25, 12, 1020, 0},
     {1, 40, 25, 13, 1030, 40},
     {1, 40, 25, 14, 1040, 40},
     {1, 40, 25, 15, 1050, 40},
     {1, 40, 26, 1, 800, 0},
     {1, 40, 26, 2, 830, 0},
     {1, 40, 26, 3, 860, 0},
     {1, 40, 26, 4, 890, 0},
     {1, 40, 26, 5, 920, 0},
     {1, 40, 26, 6, 940, 220},
     {1, 40, 26, 7, 950, 220},
     {1, 40, 26, 8, 970, 220},
     {1, 40, 26, 9, 990, 220},
     {1, 40, 26, 10, 1000, 0},
     {1, 40, 26, 11, 1010, 0},
     {1, 40, 26, 12, 1020, 0},
     {1, 40, 26, 13, 1030, 40},
     {1, 40, 26, 14, 1040, 40},
     {1, 40, 26, 15, 1050, 40},
     {1, 40, 43, 1, 800, 0},
     {1, 40, 43, 2, 830, 0},
     {1, 40, 43, 3, 860, 0},
     {1, 40, 43, 4, 890, 0},
     {1, 40, 43, 5, 920, 0},
     {1, 40, 43, 6, 940, 220},
     {1, 40, 43, 7, 950, 220},
     {1, 40, 43, 8, 970, 220},
     {1, 40, 43, 9, 990, 220},
     {1, 40, 43, 10, 1000, 0},
     {1, 40, 43, 11, 1010, 0},
     {1, 40, 43, 12, 1020, 0},
     {1, 40, 43, 13, 1030, 40},
     {1, 40, 43, 14, 1040, 40},
     {1, 40, 43, 15, 1050, 40},
     {50, 60, 1, 1, 800, 0},
     {50, 60, 1, 2, 830, 0},
     {50, 60, 1, 3, 860, 0},
     {50, 60, 1, 4, 890, 0},
     {50, 60, 1, 5, 920, 70},
     {50, 60, 1, 6, 940, 110},
     {50, 60, 1, 7, 950, 240},
     {50, 60, 1, 8, 970, 240},
     {50, 60, 1, 9, 990, 220},
     {50, 60, 1, 10, 1000, 0},
     {50, 60, 1, 11, 1010, 0},
     {50, 60, 1, 12, 1020, 0},
     {50, 60, 1, 13, 1030, 40},
     {50, 60, 1, 14, 1040, 40},
     {50, 60, 1, 15, 1050, 40},
     {50, 60, 2, 1, 800, 0},
     {50, 60, 2, 2, 830, 0},
     {50, 60, 2, 3, 860, 0},
     {50, 60, 2, 4, 890, 0},
     {50, 60, 2, 5, 920, 70},
     {50, 60, 2, 6, 940, 110},
     {50, 60, 2, 7, 950, 240},
     {50, 60, 2, 8, 970, 240},
     {50, 60, 2, 9, 990, 220},
     {50, 60, 2, 10, 1000, 0},
     {50, 60, 2, 11, 1010, 0},
     {50, 60, 2, 12, 1020, 0},
     {50, 60, 2, 13, 1030, 40},
     {50, 60, 2, 14, 1040, 40},
     {50, 60, 2, 15, 1050, 40},
     {50, 60, 3, 1, 800, 0},
     {50, 60, 3, 2, 830, 0},
     {50, 60, 3, 3, 860, 0},
     {50, 60, 3, 4, 890, 0},
     {50, 60, 3, 5, 920, 70},
     {50, 60, 3, 6, 940, 110},
     {50, 60, 3, 7, 950, 240},
     {50, 60, 3, 8, 970, 240},
     {50, 60, 3, 9, 990, 220},
     {50, 60, 3, 10, 1000, 0},
     {50, 60, 3, 11, 1010, 0},
     {50, 60, 3, 12, 1020, 0},
     {50, 60, 3, 13, 1030, 40},
     {50, 60, 3, 14, 1040, 40},
     {50, 60, 3, 15, 1050, 40},
     {50, 60, 4, 1, 800, 0},
     {50, 60, 4, 2, 830, 0},
     {50, 60, 4, 3, 860, 0},
     {50, 60, 4, 4, 890, 0},
     {50, 60, 4, 5, 920, 70},
     {50, 60, 4, 6, 940, 110},
     {50, 60, 4, 7, 950, 240},
     {50, 60, 4, 8, 970, 240},
     {50, 60, 4, 9, 990, 220},
     {50, 60, 4, 10, 1000, 0},
     {50, 60, 4, 11, 1010, 0},
     {50, 60, 4, 12, 1020, 0},
     {50, 60, 4, 13, 1030, 40},
     {50, 60, 4, 14, 1040, 40},
     {50, 60, 4, 15, 1050, 40},
     {50, 60, 5, 1, 800, 0},
     {50, 60, 5, 2, 830, 0},
     {50, 60, 5, 3, 860, 0},
     {50, 60, 5, 4, 890, 0},
     {50, 60, 5, 5, 920, 70},
     {50, 60, 5, 6, 940, 110},
     {50, 60, 5, 7, 950, 240},
     {50, 60, 5, 8, 970, 240},
     {50, 60, 5, 9, 990, 220},
     {50, 60, 5, 10, 1000, 0},
     {50, 60, 5, 11, 1010, 0},
     {50, 60, 5, 12, 1020, 0},
     {50, 60, 5, 13, 1030, 40},
     {50, 60, 5, 14, 1040, 40},
     {50, 60, 5, 15, 1050, 40},
     {50, 60, 6, 1, 800, 0},
     {50, 60, 6, 2, 830, 0},
     {50, 60, 6, 3, 860, 0},
     {50, 60, 6, 4, 890, 0},
     {50, 60, 6, 5, 920, 70},
     {50, 60, 6, 6, 940, 110},
     {50, 60, 6, 7, 950, 240},
     {50, 60, 6, 8, 970, 240},
     {50, 60, 6, 9, 990, 220},
     {50, 60, 6, 10, 1000, 0},
     {50, 60, 6, 11, 1010, 0},
     {50, 60, 6, 12, 1020, 0},
     {50, 60, 6, 13, 1030, 40},
     {50, 60, 6, 14, 1040, 40},
     {50, 60, 6, 15, 1050, 40},
     {50, 60, 7, 1, 800, 0},
     {50, 60, 7, 2, 830, 0},
     {50, 60, 7, 3, 860, 0},
     {50, 60, 7, 4, 890, 0},
     {50, 60, 7, 5, 920, 70},
     {50, 60, 7, 6, 940, 110},
     {50, 60, 7, 7, 950, 240},
     {50, 60, 7, 8, 970, 240},
     {50, 60, 7, 9, 990, 220},
     {50, 60, 7, 10, 1000, 0},
     {50, 60, 7, 11, 1010, 0},
     {50, 60, 7, 12, 1020, 0},
     {50, 60, 7, 13, 1030, 40},
     {50, 60, 7, 14, 1040, 40},
     {50, 60, 7, 15, 1050, 40},
     {50, 60, 25, 1, 800, 0},
     {50, 60, 25, 2, 830, 0},
     {50, 60, 25, 3, 860, 0},
     {50, 60, 25, 4, 890, 0},
     {50, 60, 25, 5, 920, 70},
     {50, 60, 25, 6, 940, 110},
     {50, 60, 25, 7, 950, 240},
     {50, 60, 25, 8, 970, 240},
     {50, 60, 25, 9, 990, 220},
     {50, 60, 25, 10, 1000, 0},
     {50, 60, 25, 11, 1010, 0},
     {50, 60, 25, 12, 1020, 0},
     {50, 60, 25, 13, 1030, 40},
     {50, 60, 25, 14, 1040, 40},
     {50, 60, 25, 15, 1050, 40},
     {50, 60, 26, 1, 800, 0},
     {50, 60, 26, 2, 830, 0},
     {50, 60, 26, 3, 860, 0},
     {50, 60, 26, 4, 890, 0},
     {50, 60, 26, 5, 920, 70},
     {50, 60, 26, 6, 940, 110},
     {50, 60, 26, 7, 950, 240},
     {50, 60, 26, 8, 970, 240},
     {50, 60, 26, 9, 990, 220},
     {50, 60, 26, 10, 1000, 0},
     {50, 60, 26, 11, 1010, 0},
     {50, 60, 26, 12, 1020, 0},
     {50, 60, 26, 13, 1030, 40},
     {50, 60, 26, 14, 1040, 40},
     {50, 60, 26, 15, 1050, 40},
     {50, 60, 43, 1, 800, 0},
     {50, 60, 43, 2, 830, 0},
     {50, 60, 43, 3, 860, 0},
     {50, 60, 43, 4, 890, 0},
     {50, 60, 43, 5, 920, 70},
     {50, 60, 43, 6, 940, 110},
     {50, 60, 43, 7, 950, 240},
     {50, 60, 43, 8, 970, 240},
     {50, 60, 43, 9, 990, 220},
     {50, 60, 43, 10, 1000, 0},
     {50, 60, 43, 11, 1010, 0},
     {50, 60, 43, 12, 1020, 0},
     {50, 60, 43, 13, 1030, 40},
     {50, 60, 43, 14, 1040, 40},
     {50, 60, 43, 15, 1050, 40},
     {70, 200, 1, 1, 800, 0},
     {70, 200, 1, 2, 830, 0},
     {70, 200, 1, 3, 860, 80},
     {70, 200, 1, 4, 890, 120},
     {70, 200, 1, 5, 920, 120},
     {70, 200, 1, 6, 940, 120},
     {70, 200, 1, 7, 950, 150},
     {70, 200, 1, 8, 970, 150},
     {70, 200, 1, 9, 990, 150},
     {70, 200, 1, 10, 1000, 0},
     {70, 200, 1, 11, 1010, 0},
     {70, 200, 1, 12, 1020, 0},
     {70, 200, 1, 13, 1030, 40},
     {70, 200, 1, 14, 1040, 40},
     {70, 200, 1, 15, 1050, 30},
     {70, 200, 2, 1, 800, 0},
     {70, 200, 2, 2, 830, 0},
     {70, 200, 2, 3, 860, 80},
     {70, 200, 2, 4, 890, 120},
     {70, 200, 2, 5, 920, 120},
     {70, 200, 2, 6, 940, 120},
     {70, 200, 2, 7, 950, 150},
     {70, 200, 2, 8, 970, 150},
     {70, 200, 2, 9, 990, 150},
     {70, 200, 2, 10, 1000, 0},
     {70, 200, 2, 11, 1010, 0},
     {70, 200, 2, 12, 1020, 0},
     {70, 200, 2, 13, 1030, 40},
     {70, 200, 2, 14, 1040, 40},
     {70, 200, 2, 15, 1050, 30},
     {70, 200, 3, 1, 800, 0},
     {70, 200, 3, 2, 830, 0},
     {70, 200, 3, 3, 860, 80},
     {70, 200, 3, 4, 890, 120},
     {70, 200, 3, 5, 920, 120},
     {70, 200, 3, 6, 940, 120},
     {70, 200, 3, 7, 950, 150},
     {70, 200, 3, 8, 970, 150},
     {70, 200, 3, 9, 990, 150},
     {70, 200, 3, 10, 1000, 0},
     {70, 200, 3, 11, 1010, 0},
     {70, 200, 3, 12, 1020, 0},
     {70, 200, 3, 13, 1030, 40},
     {70, 200, 3, 14, 1040, 40},
     {70, 200, 3, 15, 1050, 30},
     {70, 200, 4, 1, 800, 0},
     {70, 200, 4, 2, 830, 0},
     {70, 200, 4, 3, 860, 80},
     {70, 200, 4, 4, 890, 120},
     {70, 200, 4, 5, 920, 120},
     {70, 200, 4, 6, 940, 120},
     {70, 200, 4, 7, 950, 150},
     {70, 200, 4, 8, 970, 150},
     {70, 200, 4, 9, 990, 150},
     {70, 200, 4, 10, 1000, 0},
     {70, 200, 4, 11, 1010, 0},
     {70, 200, 4, 12, 1020, 0},
     {70, 200, 4, 13, 1030, 40},
     {70, 200, 4, 14, 1040, 40},
     {70, 200, 4, 15, 1050, 30},
     {70, 200, 5, 1, 800, 0},
     {70, 200, 5, 2, 830, 0},
     {70, 200, 5, 3, 860, 80},
     {70, 200, 5, 4, 890, 120},
     {70, 200, 5, 5, 920, 120},
     {70, 200, 5, 6, 940, 120},
     {70, 200, 5, 7, 950, 150},
     {70, 200, 5, 8, 970, 150},
     {70, 200, 5, 9, 990, 150},
     {70, 200, 5, 10, 1000, 0},
     {70, 200, 5, 11, 1010, 0},
     {70, 200, 5, 12, 1020, 0},
     {70, 200, 5, 13, 1030, 40},
     {70, 200, 5, 14, 1040, 40},
     {70, 200, 5, 15, 1050, 30},
     {70, 200, 6, 1, 800, 0},
     {70, 200, 6, 2, 830, 0},
     {70, 200, 6, 3, 860, 80},
     {70, 200, 6, 4, 890, 120},
     {70, 200, 6, 5, 920, 120},
     {70, 200, 6, 6, 940, 120},
     {70, 200, 6, 7, 950, 150},
     {70, 200, 6, 8, 970, 150},
     {70, 200, 6, 9, 990, 150},
     {70, 200, 6, 10, 1000, 0},
     {70, 200, 6, 11, 1010, 0},
     {70, 200, 6, 12, 1020, 0},
     {70, 200, 6, 13, 1030, 40},
     {70, 200, 6, 14, 1040, 40},
     {70, 200, 6, 15, 1050, 30},
     {70, 200, 7, 1, 800, 0},
     {70, 200, 7, 2, 830, 0},
     {70, 200, 7, 3, 860, 80},
     {70, 200, 7, 4, 890, 120},
     {70, 200, 7, 5, 920, 120},
     {70, 200, 7, 6, 940, 120},
     {70, 200, 7, 7, 950, 150},
     {70, 200, 7, 8, 970, 150},
     {70, 200, 7, 9, 990, 150},
     {70, 200, 7, 10, 1000, 0},
     {70, 200, 7, 11, 1010, 0},
     {70, 200, 7, 12, 1020, 0},
     {70, 200, 7, 13, 1030, 40},
     {70, 200, 7, 14, 1040, 40},
     {70, 200, 7, 15, 1050, 30},
     {70, 200, 25, 1, 800, 0},
     {70, 200, 25, 2, 830, 0},
     {70, 200, 25, 3, 860, 80},
     {70, 200, 25, 4, 890, 120},
     {70, 200, 25, 5, 920, 120},
     {70, 200, 25, 6, 940, 120},
     {70, 200, 25, 7, 950, 150},
     {70, 200, 25, 8, 970, 150},
     {70, 200, 25, 9, 990, 150},
     {70, 200, 25, 10, 1000, 0},
     {70, 200, 25, 11, 1010, 0},
     {70, 200, 25, 12, 1020, 0},
     {70, 200, 25, 13, 1030, 40},
     {70, 200, 25, 14, 1040, 40},
     {70, 200, 25, 15, 1050, 30},
     {70, 200, 26, 1, 800, 0},
     {70, 200, 26, 2, 830, 0},
     {70, 200, 26, 3, 860, 80},
     {70, 200, 26, 4, 890, 120},
     {70, 200, 26, 5, 920, 120},
     {70, 200, 26, 6, 940, 120},
     {70, 200, 26, 7, 950, 150},
     {70, 200, 26, 8, 970, 150},
     {70, 200, 26, 9, 990, 150},
     {70, 200, 26, 10, 1000, 0},
     {70, 200, 26, 11, 1010, 0},
     {70, 200, 26, 12, 1020, 0},
     {70, 200, 26, 13, 1030, 40},
     {70, 200, 26, 14, 1040, 40},
     {70, 200, 26, 15, 1050, 30},
     {70, 200, 43, 1, 800, 0},
     {70, 200, 43, 2, 830, 0},
     {70, 200, 43, 3, 860, 80},
     {70, 200, 43, 4, 890, 120},
     {70, 200, 43, 5, 920, 120},
     {70, 200, 43, 6, 940, 120},
     {70, 200, 43, 7, 950, 150},
     {70, 200, 43, 8, 970, 150},
     {70, 200, 43, 9, 990, 150},
     {70, 200, 43, 10, 1000, 0},
     {70, 200, 43, 11, 1010, 0},
     {70, 200, 43, 12, 1020, 0},
     {70, 200, 43, 13, 1030, 40},
     {70, 200, 43, 14, 1040, 40},
     {70, 200, 43, 15, 1050, 30}].

get_first_base(30) -> 9;
get_first_base(40) -> 13;
get_first_base(50) -> 16;
get_first_base(60) -> 19;
get_first_base(70) -> 22;
get_first_base(80) -> 25;
get_first_base(90) -> 28;
get_first_base(100) -> 31;
get_first_base(110) -> 34;
get_first_base(120) -> 37;
get_first_base(_) -> 0.

get_first_type() ->
    [{1, 200, 750, 0},
     {2, 210, 1000, 0},
     {3, 220, 1300, -300},
     {4, 185, 580, 580},
     {5, 185, 650, 650},
     {0, 0, 0, 0}].

get_first_step() ->
    [{1, 40, 1, 700, 0},
     {1, 40, 2, 730, 0},
     {1, 40, 3, 760, 0},
     {1, 40, 4, 790, 0},
     {1, 40, 5, 820, 0},
     {1, 40, 6, 850, 200},
     {1, 40, 7, 880, 200},
     {1, 40, 8, 910, 200},
     {1, 40, 9, 940, 200},
     {1, 40, 10, 970, 100},
     {1, 40, 11, 1000, 100},
     {50, 50, 1, 700, 0},
     {50, 50, 2, 730, 0},
     {50, 50, 3, 760, 0},
     {50, 50, 4, 790, 0},
     {50, 50, 5, 820, 120},
     {50, 50, 6, 850, 160},
     {50, 50, 7, 880, 180},
     {50, 50, 8, 910, 180},
     {50, 50, 9, 940, 160},
     {50, 50, 10, 970, 120},
     {50, 50, 11, 1000, 80},
     {60, 200, 1, 700, 10},
     {60, 200, 2, 730, 20},
     {60, 200, 3, 760, 50},
     {60, 200, 4, 790, 110},
     {60, 200, 5, 820, 140},
     {60, 200, 6, 850, 180},
     {60, 200, 7, 880, 180},
     {60, 200, 8, 910, 140},
     {60, 200, 9, 940, 120},
     {60, 200, 10, 970, 80},
     {60, 200, 11, 1000, 70}].

get_init(1) ->
    [10002,
     10003,
     10004,
     10006,
     10001,
     10501,
     10502,
     10504];
get_init(2) ->
    [10102,
     10103,
     10104,
     10106,
     10101,
     10501,
     10502,
     10504];
get_init(3) ->
    [10202,
     10203,
     10204,
     10206,
     10201,
     10501,
     10502,
     10504];
get_init(4) ->
    [10302,
     10303,
     10304,
     10306,
     10301,
     10501,
     10502,
     10504];
get_init(5) ->
    [10402,
     10403,
     10404,
     10406,
     10401,
     10501,
     10502,
     10504];
get_init(6) ->
    [10602,
     10603,
     10604,
     10606,
     10601,
     10501,
     10502,
     10504];
get_init(7) ->
    [10702,
     10703,
     10704,
     10706,
     10701,
     10501,
     10502,
     10504];
get_init(_Classes) -> [].

get_lev_attr({30, 1}) -> [{1, 120}, {4, 80}];
get_lev_attr({40, 1}) -> [{1, 150}, {4, 110}];
get_lev_attr({50, 1}) -> [{1, 190}, {4, 130}];
get_lev_attr({60, 1}) -> [{1, 220}, {4, 160}];
get_lev_attr({70, 1}) -> [{1, 260}, {4, 180}];
get_lev_attr({80, 1}) -> [{1, 290}, {4, 200}];
get_lev_attr({90, 1}) -> [{1, 320}, {4, 220}];
get_lev_attr({100, 1}) -> [{1, 350}, {4, 240}];
get_lev_attr({110, 1}) -> [{1, 380}, {4, 260}];
get_lev_attr({120, 1}) -> [{1, 400}, {4, 280}];
get_lev_attr({30, 2}) -> [{1, 120}, {5, 60}];
get_lev_attr({40, 2}) -> [{1, 150}, {5, 80}];
get_lev_attr({50, 2}) -> [{1, 190}, {5, 90}];
get_lev_attr({60, 2}) -> [{1, 220}, {5, 110}];
get_lev_attr({70, 2}) -> [{1, 260}, {5, 130}];
get_lev_attr({80, 2}) -> [{1, 290}, {5, 150}];
get_lev_attr({90, 2}) -> [{1, 320}, {5, 170}];
get_lev_attr({100, 2}) -> [{1, 350}, {5, 190}];
get_lev_attr({110, 2}) -> [{1, 380}, {5, 210}];
get_lev_attr({120, 2}) -> [{1, 400}, {5, 230}];
get_lev_attr({30, 3}) -> [{1, 120}, {4, 80}];
get_lev_attr({40, 3}) -> [{1, 150}, {4, 110}];
get_lev_attr({50, 3}) -> [{1, 190}, {4, 130}];
get_lev_attr({60, 3}) -> [{1, 220}, {4, 160}];
get_lev_attr({70, 3}) -> [{1, 260}, {4, 180}];
get_lev_attr({80, 3}) -> [{1, 290}, {4, 200}];
get_lev_attr({90, 3}) -> [{1, 320}, {4, 220}];
get_lev_attr({100, 3}) -> [{1, 350}, {4, 240}];
get_lev_attr({110, 3}) -> [{1, 380}, {4, 260}];
get_lev_attr({120, 3}) -> [{1, 400}, {4, 280}];
get_lev_attr({30, 4}) -> [{1, 120}, {7, 30}];
get_lev_attr({40, 4}) -> [{1, 150}, {7, 50}];
get_lev_attr({50, 4}) -> [{1, 190}, {7, 70}];
get_lev_attr({60, 4}) -> [{1, 220}, {7, 90}];
get_lev_attr({70, 4}) -> [{1, 260}, {7, 110}];
get_lev_attr({80, 4}) -> [{1, 290}, {7, 130}];
get_lev_attr({90, 4}) -> [{1, 320}, {7, 150}];
get_lev_attr({100, 4}) -> [{1, 350}, {7, 170}];
get_lev_attr({110, 4}) -> [{1, 380}, {7, 190}];
get_lev_attr({120, 4}) -> [{1, 400}, {7, 210}];
get_lev_attr({30, 5}) -> [{1, 120}, {43, 30}];
get_lev_attr({40, 5}) -> [{1, 150}, {43, 50}];
get_lev_attr({50, 5}) -> [{1, 190}, {43, 70}];
get_lev_attr({60, 5}) -> [{1, 220}, {43, 90}];
get_lev_attr({70, 5}) -> [{1, 260}, {43, 110}];
get_lev_attr({80, 5}) -> [{1, 290}, {43, 130}];
get_lev_attr({90, 5}) -> [{1, 320}, {43, 150}];
get_lev_attr({100, 5}) -> [{1, 350}, {43, 170}];
get_lev_attr({110, 5}) -> [{1, 380}, {43, 190}];
get_lev_attr({120, 5}) -> [{1, 400}, {43, 210}];
get_lev_attr({30, 6}) -> [{1, 120}, {5, 60}];
get_lev_attr({40, 6}) -> [{1, 150}, {5, 80}];
get_lev_attr({50, 6}) -> [{1, 190}, {5, 90}];
get_lev_attr({60, 6}) -> [{1, 220}, {5, 110}];
get_lev_attr({70, 6}) -> [{1, 260}, {5, 130}];
get_lev_attr({80, 6}) -> [{1, 290}, {5, 150}];
get_lev_attr({90, 6}) -> [{1, 320}, {5, 170}];
get_lev_attr({100, 6}) -> [{1, 350}, {5, 190}];
get_lev_attr({110, 6}) -> [{1, 380}, {5, 210}];
get_lev_attr({120, 6}) -> [{1, 400}, {5, 230}];
get_lev_attr({30, 7}) -> [{1, 120}, {4, 80}];
get_lev_attr({40, 7}) -> [{1, 150}, {4, 110}];
get_lev_attr({50, 7}) -> [{1, 190}, {4, 130}];
get_lev_attr({60, 7}) -> [{1, 220}, {4, 160}];
get_lev_attr({70, 7}) -> [{1, 260}, {4, 180}];
get_lev_attr({80, 7}) -> [{1, 290}, {4, 200}];
get_lev_attr({90, 7}) -> [{1, 320}, {4, 220}];
get_lev_attr({100, 7}) -> [{1, 350}, {4, 240}];
get_lev_attr({110, 7}) -> [{1, 380}, {4, 260}];
get_lev_attr({120, 7}) -> [{1, 400}, {4, 280}];
get_lev_attr(_Lev) -> false.

get_enchant_attr(Lev) when Lev >= 15 ->
    {[], [{62000, 3}, {62100, 3}, {62200, 3}]};
get_enchant_attr(Lev) when Lev >= 14 ->
    {[], [{62000, 2}, {62100, 3}, {62200, 3}]};
get_enchant_attr(Lev) when Lev >= 13 ->
    {[], [{62000, 2}, {62100, 2}, {62200, 3}]};
get_enchant_attr(Lev) when Lev >= 12 ->
    {[], [{62000, 2}, {62100, 2}, {62200, 2}]};
get_enchant_attr(Lev) when Lev >= 11 ->
    {[], [{62000, 1}, {62100, 2}, {62200, 2}]};
get_enchant_attr(Lev) when Lev >= 10 ->
    {[], [{62000, 1}, {62100, 1}, {62200, 2}]};
get_enchant_attr(Lev) when Lev >= 9 ->
    {[], [{62000, 1}, {62100, 1}, {62200, 1}]};
get_enchant_attr(Lev) when Lev >= 8 ->
    {[], [{62000, 1}, {62100, 1}]};
get_enchant_attr(Lev) when Lev >= 7 ->
    {[], [{62000, 1}]};
get_enchant_attr(_Lev) -> false.

enchant_attr({1, 0}) ->
    [{1, 0},
     {3, 0},
     {4, 0},
     {5, 0},
     {6, 0},
     {7, 0},
     {25, 0},
     {26, 0},
     {43, 0},
     {2, 0}];
enchant_attr({4, 0}) ->
    [{1, 0},
     {3, 0},
     {4, 0},
     {5, 0},
     {6, 0},
     {7, 0},
     {25, 0},
     {26, 0},
     {43, 0},
     {2, 0}];
enchant_attr({2, 0}) ->
    [{1, 0},
     {3, 0},
     {4, 0},
     {5, 0},
     {6, 0},
     {7, 0},
     {25, 0},
     {26, 0},
     {43, 0},
     {2, 0}];
enchant_attr({3, 0}) ->
    [{1, 0},
     {3, 0},
     {4, 0},
     {5, 0},
     {6, 0},
     {7, 0},
     {25, 0},
     {26, 0},
     {43, 0},
     {2, 0}];
enchant_attr({5, 0}) ->
    [{1, 0},
     {3, 0},
     {4, 0},
     {5, 0},
     {6, 0},
     {7, 0},
     {25, 0},
     {26, 0},
     {43, 0},
     {2, 0}];
enchant_attr({21, 0}) ->
    [{1, 0},
     {3, 0},
     {4, 0},
     {5, 0},
     {6, 0},
     {7, 0},
     {25, 0},
     {26, 0},
     {43, 0},
     {2, 0}];
enchant_attr({22, 0}) ->
    [{1, 0},
     {3, 0},
     {4, 0},
     {5, 0},
     {6, 0},
     {7, 0},
     {25, 0},
     {26, 0},
     {43, 0},
     {2, 0}];
enchant_attr({6, 0}) ->
    [{1, 0},
     {3, 0},
     {4, 0},
     {5, 0},
     {6, 0},
     {7, 0},
     {25, 0},
     {26, 0},
     {43, 0},
     {2, 0}];
enchant_attr({7, 0}) ->
    [{1, 0},
     {3, 0},
     {4, 0},
     {5, 0},
     {6, 0},
     {7, 0},
     {25, 0},
     {26, 0},
     {43, 0},
     {2, 0}];
enchant_attr({9, 0}) ->
    [{1, 0},
     {3, 0},
     {4, 0},
     {5, 0},
     {6, 0},
     {7, 0},
     {25, 0},
     {26, 0},
     {43, 0},
     {2, 0}];
enchant_attr({10, 0}) ->
    [{1, 0},
     {3, 0},
     {4, 0},
     {5, 0},
     {6, 0},
     {7, 0},
     {25, 0},
     {26, 0},
     {43, 0},
     {2, 0}];
enchant_attr({11, 0}) ->
    [{1, 0},
     {3, 0},
     {4, 0},
     {5, 0},
     {6, 0},
     {7, 0},
     {25, 0},
     {26, 0},
     {43, 0},
     {2, 0}];
enchant_attr({12, 0}) ->
    [{1, 0},
     {3, 0},
     {4, 0},
     {5, 0},
     {6, 0},
     {7, 0},
     {25, 0},
     {26, 0},
     {43, 0},
     {2, 0}];
enchant_attr({14, 0}) ->
    [{1, 0},
     {3, 0},
     {4, 0},
     {5, 0},
     {6, 0},
     {7, 0},
     {25, 0},
     {26, 0},
     {43, 0},
     {2, 0}];
enchant_attr({1, 1}) ->
    [{1, 60},
     {3, 40},
     {4, 20},
     {5, 20},
     {6, 60},
     {7, 60},
     {25, 20},
     {26, 20},
     {43, 20},
     {2, 40}];
enchant_attr({4, 1}) ->
    [{1, 60},
     {3, 40},
     {4, 20},
     {5, 20},
     {6, 60},
     {7, 60},
     {25, 20},
     {26, 20},
     {43, 20},
     {2, 40}];
enchant_attr({2, 1}) ->
    [{1, 60},
     {3, 40},
     {4, 20},
     {5, 20},
     {6, 60},
     {7, 60},
     {25, 20},
     {26, 20},
     {43, 20},
     {2, 40}];
enchant_attr({3, 1}) ->
    [{1, 60},
     {3, 40},
     {4, 20},
     {5, 20},
     {6, 60},
     {7, 60},
     {25, 20},
     {26, 20},
     {43, 20},
     {2, 40}];
enchant_attr({5, 1}) ->
    [{1, 60},
     {3, 40},
     {4, 20},
     {5, 20},
     {6, 60},
     {7, 60},
     {25, 20},
     {26, 20},
     {43, 20},
     {2, 40}];
enchant_attr({21, 1}) ->
    [{1, 60},
     {3, 40},
     {4, 20},
     {5, 20},
     {6, 60},
     {7, 60},
     {25, 20},
     {26, 20},
     {43, 20},
     {2, 40}];
enchant_attr({22, 1}) ->
    [{1, 60},
     {3, 40},
     {4, 20},
     {5, 20},
     {6, 60},
     {7, 60},
     {25, 20},
     {26, 20},
     {43, 20},
     {2, 40}];
enchant_attr({6, 1}) ->
    [{1, 60},
     {3, 40},
     {4, 20},
     {5, 20},
     {6, 60},
     {7, 60},
     {25, 20},
     {26, 20},
     {43, 20},
     {2, 40}];
enchant_attr({7, 1}) ->
    [{1, 60},
     {3, 40},
     {4, 20},
     {5, 20},
     {6, 60},
     {7, 60},
     {25, 20},
     {26, 20},
     {43, 20},
     {2, 40}];
enchant_attr({9, 1}) ->
    [{1, 60},
     {3, 40},
     {4, 20},
     {5, 20},
     {6, 60},
     {7, 60},
     {25, 20},
     {26, 20},
     {43, 20},
     {2, 40}];
enchant_attr({10, 1}) ->
    [{1, 60},
     {3, 40},
     {4, 20},
     {5, 20},
     {6, 60},
     {7, 60},
     {25, 20},
     {26, 20},
     {43, 20},
     {2, 40}];
enchant_attr({11, 1}) ->
    [{1, 60},
     {3, 40},
     {4, 20},
     {5, 20},
     {6, 60},
     {7, 60},
     {25, 20},
     {26, 20},
     {43, 20},
     {2, 40}];
enchant_attr({12, 1}) ->
    [{1, 60},
     {3, 40},
     {4, 20},
     {5, 20},
     {6, 60},
     {7, 60},
     {25, 20},
     {26, 20},
     {43, 20},
     {2, 40}];
enchant_attr({14, 1}) ->
    [{1, 60},
     {3, 40},
     {4, 20},
     {5, 20},
     {6, 60},
     {7, 60},
     {25, 20},
     {26, 20},
     {43, 20},
     {2, 40}];
enchant_attr({1, 2}) ->
    [{1, 120},
     {3, 80},
     {4, 40},
     {5, 40},
     {6, 120},
     {7, 120},
     {25, 40},
     {26, 40},
     {43, 40},
     {2, 80}];
enchant_attr({4, 2}) ->
    [{1, 120},
     {3, 80},
     {4, 40},
     {5, 40},
     {6, 120},
     {7, 120},
     {25, 40},
     {26, 40},
     {43, 40},
     {2, 80}];
enchant_attr({2, 2}) ->
    [{1, 120},
     {3, 80},
     {4, 40},
     {5, 40},
     {6, 120},
     {7, 120},
     {25, 40},
     {26, 40},
     {43, 40},
     {2, 80}];
enchant_attr({3, 2}) ->
    [{1, 120},
     {3, 80},
     {4, 40},
     {5, 40},
     {6, 120},
     {7, 120},
     {25, 40},
     {26, 40},
     {43, 40},
     {2, 80}];
enchant_attr({5, 2}) ->
    [{1, 120},
     {3, 80},
     {4, 40},
     {5, 40},
     {6, 120},
     {7, 120},
     {25, 40},
     {26, 40},
     {43, 40},
     {2, 80}];
enchant_attr({21, 2}) ->
    [{1, 120},
     {3, 80},
     {4, 40},
     {5, 40},
     {6, 120},
     {7, 120},
     {25, 40},
     {26, 40},
     {43, 40},
     {2, 80}];
enchant_attr({22, 2}) ->
    [{1, 120},
     {3, 80},
     {4, 40},
     {5, 40},
     {6, 120},
     {7, 120},
     {25, 40},
     {26, 40},
     {43, 40},
     {2, 80}];
enchant_attr({6, 2}) ->
    [{1, 120},
     {3, 80},
     {4, 40},
     {5, 40},
     {6, 120},
     {7, 120},
     {25, 40},
     {26, 40},
     {43, 40},
     {2, 80}];
enchant_attr({7, 2}) ->
    [{1, 120},
     {3, 80},
     {4, 40},
     {5, 40},
     {6, 120},
     {7, 120},
     {25, 40},
     {26, 40},
     {43, 40},
     {2, 80}];
enchant_attr({9, 2}) ->
    [{1, 120},
     {3, 80},
     {4, 40},
     {5, 40},
     {6, 120},
     {7, 120},
     {25, 40},
     {26, 40},
     {43, 40},
     {2, 80}];
enchant_attr({10, 2}) ->
    [{1, 120},
     {3, 80},
     {4, 40},
     {5, 40},
     {6, 120},
     {7, 120},
     {25, 40},
     {26, 40},
     {43, 40},
     {2, 80}];
enchant_attr({11, 2}) ->
    [{1, 120},
     {3, 80},
     {4, 40},
     {5, 40},
     {6, 120},
     {7, 120},
     {25, 40},
     {26, 40},
     {43, 40},
     {2, 80}];
enchant_attr({12, 2}) ->
    [{1, 120},
     {3, 80},
     {4, 40},
     {5, 40},
     {6, 120},
     {7, 120},
     {25, 40},
     {26, 40},
     {43, 40},
     {2, 80}];
enchant_attr({14, 2}) ->
    [{1, 120},
     {3, 80},
     {4, 40},
     {5, 40},
     {6, 120},
     {7, 120},
     {25, 40},
     {26, 40},
     {43, 40},
     {2, 80}];
enchant_attr({1, 3}) ->
    [{1, 180},
     {3, 120},
     {4, 60},
     {5, 60},
     {6, 180},
     {7, 180},
     {25, 60},
     {26, 60},
     {43, 60},
     {2, 120}];
enchant_attr({4, 3}) ->
    [{1, 180},
     {3, 120},
     {4, 60},
     {5, 60},
     {6, 180},
     {7, 180},
     {25, 60},
     {26, 60},
     {43, 60},
     {2, 120}];
enchant_attr({2, 3}) ->
    [{1, 180},
     {3, 120},
     {4, 60},
     {5, 60},
     {6, 180},
     {7, 180},
     {25, 60},
     {26, 60},
     {43, 60},
     {2, 120}];
enchant_attr({3, 3}) ->
    [{1, 180},
     {3, 120},
     {4, 60},
     {5, 60},
     {6, 180},
     {7, 180},
     {25, 60},
     {26, 60},
     {43, 60},
     {2, 120}];
enchant_attr({5, 3}) ->
    [{1, 180},
     {3, 120},
     {4, 60},
     {5, 60},
     {6, 180},
     {7, 180},
     {25, 60},
     {26, 60},
     {43, 60},
     {2, 120}];
enchant_attr({21, 3}) ->
    [{1, 180},
     {3, 120},
     {4, 60},
     {5, 60},
     {6, 180},
     {7, 180},
     {25, 60},
     {26, 60},
     {43, 60},
     {2, 120}];
enchant_attr({22, 3}) ->
    [{1, 180},
     {3, 120},
     {4, 60},
     {5, 60},
     {6, 180},
     {7, 180},
     {25, 60},
     {26, 60},
     {43, 60},
     {2, 120}];
enchant_attr({6, 3}) ->
    [{1, 180},
     {3, 120},
     {4, 60},
     {5, 60},
     {6, 180},
     {7, 180},
     {25, 60},
     {26, 60},
     {43, 60},
     {2, 120}];
enchant_attr({7, 3}) ->
    [{1, 180},
     {3, 120},
     {4, 60},
     {5, 60},
     {6, 180},
     {7, 180},
     {25, 60},
     {26, 60},
     {43, 60},
     {2, 120}];
enchant_attr({9, 3}) ->
    [{1, 180},
     {3, 120},
     {4, 60},
     {5, 60},
     {6, 180},
     {7, 180},
     {25, 60},
     {26, 60},
     {43, 60},
     {2, 120}];
enchant_attr({10, 3}) ->
    [{1, 180},
     {3, 120},
     {4, 60},
     {5, 60},
     {6, 180},
     {7, 180},
     {25, 60},
     {26, 60},
     {43, 60},
     {2, 120}];
enchant_attr({11, 3}) ->
    [{1, 180},
     {3, 120},
     {4, 60},
     {5, 60},
     {6, 180},
     {7, 180},
     {25, 60},
     {26, 60},
     {43, 60},
     {2, 120}];
enchant_attr({12, 3}) ->
    [{1, 180},
     {3, 120},
     {4, 60},
     {5, 60},
     {6, 180},
     {7, 180},
     {25, 60},
     {26, 60},
     {43, 60},
     {2, 120}];
enchant_attr({14, 3}) ->
    [{1, 180},
     {3, 120},
     {4, 60},
     {5, 60},
     {6, 180},
     {7, 180},
     {25, 60},
     {26, 60},
     {43, 60},
     {2, 120}];
enchant_attr({1, 4}) ->
    [{1, 240},
     {3, 160},
     {4, 80},
     {5, 80},
     {6, 240},
     {7, 240},
     {25, 80},
     {26, 80},
     {43, 80},
     {2, 160}];
enchant_attr({4, 4}) ->
    [{1, 240},
     {3, 160},
     {4, 80},
     {5, 80},
     {6, 240},
     {7, 240},
     {25, 80},
     {26, 80},
     {43, 80},
     {2, 160}];
enchant_attr({2, 4}) ->
    [{1, 240},
     {3, 160},
     {4, 80},
     {5, 80},
     {6, 240},
     {7, 240},
     {25, 80},
     {26, 80},
     {43, 80},
     {2, 160}];
enchant_attr({3, 4}) ->
    [{1, 240},
     {3, 160},
     {4, 80},
     {5, 80},
     {6, 240},
     {7, 240},
     {25, 80},
     {26, 80},
     {43, 80},
     {2, 160}];
enchant_attr({5, 4}) ->
    [{1, 240},
     {3, 160},
     {4, 80},
     {5, 80},
     {6, 240},
     {7, 240},
     {25, 80},
     {26, 80},
     {43, 80},
     {2, 160}];
enchant_attr({21, 4}) ->
    [{1, 240},
     {3, 160},
     {4, 80},
     {5, 80},
     {6, 240},
     {7, 240},
     {25, 80},
     {26, 80},
     {43, 80},
     {2, 160}];
enchant_attr({22, 4}) ->
    [{1, 240},
     {3, 160},
     {4, 80},
     {5, 80},
     {6, 240},
     {7, 240},
     {25, 80},
     {26, 80},
     {43, 80},
     {2, 160}];
enchant_attr({6, 4}) ->
    [{1, 240},
     {3, 160},
     {4, 80},
     {5, 80},
     {6, 240},
     {7, 240},
     {25, 80},
     {26, 80},
     {43, 80},
     {2, 160}];
enchant_attr({7, 4}) ->
    [{1, 240},
     {3, 160},
     {4, 80},
     {5, 80},
     {6, 240},
     {7, 240},
     {25, 80},
     {26, 80},
     {43, 80},
     {2, 160}];
enchant_attr({9, 4}) ->
    [{1, 240},
     {3, 160},
     {4, 80},
     {5, 80},
     {6, 240},
     {7, 240},
     {25, 80},
     {26, 80},
     {43, 80},
     {2, 160}];
enchant_attr({10, 4}) ->
    [{1, 240},
     {3, 160},
     {4, 80},
     {5, 80},
     {6, 240},
     {7, 240},
     {25, 80},
     {26, 80},
     {43, 80},
     {2, 160}];
enchant_attr({11, 4}) ->
    [{1, 240},
     {3, 160},
     {4, 80},
     {5, 80},
     {6, 240},
     {7, 240},
     {25, 80},
     {26, 80},
     {43, 80},
     {2, 160}];
enchant_attr({12, 4}) ->
    [{1, 240},
     {3, 160},
     {4, 80},
     {5, 80},
     {6, 240},
     {7, 240},
     {25, 80},
     {26, 80},
     {43, 80},
     {2, 160}];
enchant_attr({14, 4}) ->
    [{1, 240},
     {3, 160},
     {4, 80},
     {5, 80},
     {6, 240},
     {7, 240},
     {25, 80},
     {26, 80},
     {43, 80},
     {2, 160}];
enchant_attr({1, 5}) ->
    [{1, 300},
     {3, 200},
     {4, 100},
     {5, 100},
     {6, 300},
     {7, 300},
     {25, 100},
     {26, 100},
     {43, 100},
     {2, 200}];
enchant_attr({4, 5}) ->
    [{1, 300},
     {3, 200},
     {4, 100},
     {5, 100},
     {6, 300},
     {7, 300},
     {25, 100},
     {26, 100},
     {43, 100},
     {2, 200}];
enchant_attr({2, 5}) ->
    [{1, 300},
     {3, 200},
     {4, 100},
     {5, 100},
     {6, 300},
     {7, 300},
     {25, 100},
     {26, 100},
     {43, 100},
     {2, 200}];
enchant_attr({3, 5}) ->
    [{1, 300},
     {3, 200},
     {4, 100},
     {5, 100},
     {6, 300},
     {7, 300},
     {25, 100},
     {26, 100},
     {43, 100},
     {2, 200}];
enchant_attr({5, 5}) ->
    [{1, 300},
     {3, 200},
     {4, 100},
     {5, 100},
     {6, 300},
     {7, 300},
     {25, 100},
     {26, 100},
     {43, 100},
     {2, 200}];
enchant_attr({21, 5}) ->
    [{1, 300},
     {3, 200},
     {4, 100},
     {5, 100},
     {6, 300},
     {7, 300},
     {25, 100},
     {26, 100},
     {43, 100},
     {2, 200}];
enchant_attr({22, 5}) ->
    [{1, 300},
     {3, 200},
     {4, 100},
     {5, 100},
     {6, 300},
     {7, 300},
     {25, 100},
     {26, 100},
     {43, 100},
     {2, 200}];
enchant_attr({6, 5}) ->
    [{1, 300},
     {3, 200},
     {4, 100},
     {5, 100},
     {6, 300},
     {7, 300},
     {25, 100},
     {26, 100},
     {43, 100},
     {2, 200}];
enchant_attr({7, 5}) ->
    [{1, 300},
     {3, 200},
     {4, 100},
     {5, 100},
     {6, 300},
     {7, 300},
     {25, 100},
     {26, 100},
     {43, 100},
     {2, 200}];
enchant_attr({9, 5}) ->
    [{1, 300},
     {3, 200},
     {4, 100},
     {5, 100},
     {6, 300},
     {7, 300},
     {25, 100},
     {26, 100},
     {43, 100},
     {2, 200}];
enchant_attr({10, 5}) ->
    [{1, 300},
     {3, 200},
     {4, 100},
     {5, 100},
     {6, 300},
     {7, 300},
     {25, 100},
     {26, 100},
     {43, 100},
     {2, 200}];
enchant_attr({11, 5}) ->
    [{1, 300},
     {3, 200},
     {4, 100},
     {5, 100},
     {6, 300},
     {7, 300},
     {25, 100},
     {26, 100},
     {43, 100},
     {2, 200}];
enchant_attr({12, 5}) ->
    [{1, 300},
     {3, 200},
     {4, 100},
     {5, 100},
     {6, 300},
     {7, 300},
     {25, 100},
     {26, 100},
     {43, 100},
     {2, 200}];
enchant_attr({14, 5}) ->
    [{1, 300},
     {3, 200},
     {4, 100},
     {5, 100},
     {6, 300},
     {7, 300},
     {25, 100},
     {26, 100},
     {43, 100},
     {2, 200}];
enchant_attr({1, 6}) ->
    [{1, 360},
     {3, 240},
     {4, 120},
     {5, 120},
     {6, 360},
     {7, 360},
     {25, 120},
     {26, 120},
     {43, 120},
     {2, 240}];
enchant_attr({4, 6}) ->
    [{1, 360},
     {3, 240},
     {4, 120},
     {5, 120},
     {6, 360},
     {7, 360},
     {25, 120},
     {26, 120},
     {43, 120},
     {2, 240}];
enchant_attr({2, 6}) ->
    [{1, 360},
     {3, 240},
     {4, 120},
     {5, 120},
     {6, 360},
     {7, 360},
     {25, 120},
     {26, 120},
     {43, 120},
     {2, 240}];
enchant_attr({3, 6}) ->
    [{1, 360},
     {3, 240},
     {4, 120},
     {5, 120},
     {6, 360},
     {7, 360},
     {25, 120},
     {26, 120},
     {43, 120},
     {2, 240}];
enchant_attr({5, 6}) ->
    [{1, 360},
     {3, 240},
     {4, 120},
     {5, 120},
     {6, 360},
     {7, 360},
     {25, 120},
     {26, 120},
     {43, 120},
     {2, 240}];
enchant_attr({21, 6}) ->
    [{1, 360},
     {3, 240},
     {4, 120},
     {5, 120},
     {6, 360},
     {7, 360},
     {25, 120},
     {26, 120},
     {43, 120},
     {2, 240}];
enchant_attr({22, 6}) ->
    [{1, 360},
     {3, 240},
     {4, 120},
     {5, 120},
     {6, 360},
     {7, 360},
     {25, 120},
     {26, 120},
     {43, 120},
     {2, 240}];
enchant_attr({6, 6}) ->
    [{1, 360},
     {3, 240},
     {4, 120},
     {5, 120},
     {6, 360},
     {7, 360},
     {25, 120},
     {26, 120},
     {43, 120},
     {2, 240}];
enchant_attr({7, 6}) ->
    [{1, 360},
     {3, 240},
     {4, 120},
     {5, 120},
     {6, 360},
     {7, 360},
     {25, 120},
     {26, 120},
     {43, 120},
     {2, 240}];
enchant_attr({9, 6}) ->
    [{1, 360},
     {3, 240},
     {4, 120},
     {5, 120},
     {6, 360},
     {7, 360},
     {25, 120},
     {26, 120},
     {43, 120},
     {2, 240}];
enchant_attr({10, 6}) ->
    [{1, 360},
     {3, 240},
     {4, 120},
     {5, 120},
     {6, 360},
     {7, 360},
     {25, 120},
     {26, 120},
     {43, 120},
     {2, 240}];
enchant_attr({11, 6}) ->
    [{1, 360},
     {3, 240},
     {4, 120},
     {5, 120},
     {6, 360},
     {7, 360},
     {25, 120},
     {26, 120},
     {43, 120},
     {2, 240}];
enchant_attr({12, 6}) ->
    [{1, 360},
     {3, 240},
     {4, 120},
     {5, 120},
     {6, 360},
     {7, 360},
     {25, 120},
     {26, 120},
     {43, 120},
     {2, 240}];
enchant_attr({14, 6}) ->
    [{1, 360},
     {3, 240},
     {4, 120},
     {5, 120},
     {6, 360},
     {7, 360},
     {25, 120},
     {26, 120},
     {43, 120},
     {2, 240}];
enchant_attr({1, 7}) ->
    [{1, 420},
     {3, 280},
     {4, 140},
     {5, 140},
     {6, 420},
     {7, 420},
     {25, 140},
     {26, 140},
     {43, 140},
     {2, 280}];
enchant_attr({4, 7}) ->
    [{1, 420},
     {3, 280},
     {4, 140},
     {5, 140},
     {6, 420},
     {7, 420},
     {25, 140},
     {26, 140},
     {43, 140},
     {2, 280}];
enchant_attr({2, 7}) ->
    [{1, 420},
     {3, 280},
     {4, 140},
     {5, 140},
     {6, 420},
     {7, 420},
     {25, 140},
     {26, 140},
     {43, 140},
     {2, 280}];
enchant_attr({3, 7}) ->
    [{1, 420},
     {3, 280},
     {4, 140},
     {5, 140},
     {6, 420},
     {7, 420},
     {25, 140},
     {26, 140},
     {43, 140},
     {2, 280}];
enchant_attr({5, 7}) ->
    [{1, 420},
     {3, 280},
     {4, 140},
     {5, 140},
     {6, 420},
     {7, 420},
     {25, 140},
     {26, 140},
     {43, 140},
     {2, 280}];
enchant_attr({21, 7}) ->
    [{1, 420},
     {3, 280},
     {4, 140},
     {5, 140},
     {6, 420},
     {7, 420},
     {25, 140},
     {26, 140},
     {43, 140},
     {2, 280}];
enchant_attr({22, 7}) ->
    [{1, 420},
     {3, 280},
     {4, 140},
     {5, 140},
     {6, 420},
     {7, 420},
     {25, 140},
     {26, 140},
     {43, 140},
     {2, 280}];
enchant_attr({6, 7}) ->
    [{1, 420},
     {3, 280},
     {4, 140},
     {5, 140},
     {6, 420},
     {7, 420},
     {25, 140},
     {26, 140},
     {43, 140},
     {2, 280}];
enchant_attr({7, 7}) ->
    [{1, 420},
     {3, 280},
     {4, 140},
     {5, 140},
     {6, 420},
     {7, 420},
     {25, 140},
     {26, 140},
     {43, 140},
     {2, 280}];
enchant_attr({9, 7}) ->
    [{1, 420},
     {3, 280},
     {4, 140},
     {5, 140},
     {6, 420},
     {7, 420},
     {25, 140},
     {26, 140},
     {43, 140},
     {2, 280}];
enchant_attr({10, 7}) ->
    [{1, 420},
     {3, 280},
     {4, 140},
     {5, 140},
     {6, 420},
     {7, 420},
     {25, 140},
     {26, 140},
     {43, 140},
     {2, 280}];
enchant_attr({11, 7}) ->
    [{1, 420},
     {3, 280},
     {4, 140},
     {5, 140},
     {6, 420},
     {7, 420},
     {25, 140},
     {26, 140},
     {43, 140},
     {2, 280}];
enchant_attr({12, 7}) ->
    [{1, 420},
     {3, 280},
     {4, 140},
     {5, 140},
     {6, 420},
     {7, 420},
     {25, 140},
     {26, 140},
     {43, 140},
     {2, 280}];
enchant_attr({14, 7}) ->
    [{1, 420},
     {3, 280},
     {4, 140},
     {5, 140},
     {6, 420},
     {7, 420},
     {25, 140},
     {26, 140},
     {43, 140},
     {2, 280}];
enchant_attr({1, 8}) ->
    [{1, 480},
     {3, 320},
     {4, 160},
     {5, 160},
     {6, 480},
     {7, 480},
     {25, 160},
     {26, 160},
     {43, 160},
     {2, 320}];
enchant_attr({4, 8}) ->
    [{1, 480},
     {3, 320},
     {4, 160},
     {5, 160},
     {6, 480},
     {7, 480},
     {25, 160},
     {26, 160},
     {43, 160},
     {2, 320}];
enchant_attr({2, 8}) ->
    [{1, 480},
     {3, 320},
     {4, 160},
     {5, 160},
     {6, 480},
     {7, 480},
     {25, 160},
     {26, 160},
     {43, 160},
     {2, 320}];
enchant_attr({3, 8}) ->
    [{1, 480},
     {3, 320},
     {4, 160},
     {5, 160},
     {6, 480},
     {7, 480},
     {25, 160},
     {26, 160},
     {43, 160},
     {2, 320}];
enchant_attr({5, 8}) ->
    [{1, 480},
     {3, 320},
     {4, 160},
     {5, 160},
     {6, 480},
     {7, 480},
     {25, 160},
     {26, 160},
     {43, 160},
     {2, 320}];
enchant_attr({21, 8}) ->
    [{1, 480},
     {3, 320},
     {4, 160},
     {5, 160},
     {6, 480},
     {7, 480},
     {25, 160},
     {26, 160},
     {43, 160},
     {2, 320}];
enchant_attr({22, 8}) ->
    [{1, 480},
     {3, 320},
     {4, 160},
     {5, 160},
     {6, 480},
     {7, 480},
     {25, 160},
     {26, 160},
     {43, 160},
     {2, 320}];
enchant_attr({6, 8}) ->
    [{1, 480},
     {3, 320},
     {4, 160},
     {5, 160},
     {6, 480},
     {7, 480},
     {25, 160},
     {26, 160},
     {43, 160},
     {2, 320}];
enchant_attr({7, 8}) ->
    [{1, 480},
     {3, 320},
     {4, 160},
     {5, 160},
     {6, 480},
     {7, 480},
     {25, 160},
     {26, 160},
     {43, 160},
     {2, 320}];
enchant_attr({9, 8}) ->
    [{1, 480},
     {3, 320},
     {4, 160},
     {5, 160},
     {6, 480},
     {7, 480},
     {25, 160},
     {26, 160},
     {43, 160},
     {2, 320}];
enchant_attr({10, 8}) ->
    [{1, 480},
     {3, 320},
     {4, 160},
     {5, 160},
     {6, 480},
     {7, 480},
     {25, 160},
     {26, 160},
     {43, 160},
     {2, 320}];
enchant_attr({11, 8}) ->
    [{1, 480},
     {3, 320},
     {4, 160},
     {5, 160},
     {6, 480},
     {7, 480},
     {25, 160},
     {26, 160},
     {43, 160},
     {2, 320}];
enchant_attr({12, 8}) ->
    [{1, 480},
     {3, 320},
     {4, 160},
     {5, 160},
     {6, 480},
     {7, 480},
     {25, 160},
     {26, 160},
     {43, 160},
     {2, 320}];
enchant_attr({14, 8}) ->
    [{1, 480},
     {3, 320},
     {4, 160},
     {5, 160},
     {6, 480},
     {7, 480},
     {25, 160},
     {26, 160},
     {43, 160},
     {2, 320}];
enchant_attr({1, 9}) ->
    [{1, 540},
     {3, 360},
     {4, 180},
     {5, 180},
     {6, 540},
     {7, 540},
     {25, 180},
     {26, 180},
     {43, 180},
     {2, 360}];
enchant_attr({4, 9}) ->
    [{1, 540},
     {3, 360},
     {4, 180},
     {5, 180},
     {6, 540},
     {7, 540},
     {25, 180},
     {26, 180},
     {43, 180},
     {2, 360}];
enchant_attr({2, 9}) ->
    [{1, 540},
     {3, 360},
     {4, 180},
     {5, 180},
     {6, 540},
     {7, 540},
     {25, 180},
     {26, 180},
     {43, 180},
     {2, 360}];
enchant_attr({3, 9}) ->
    [{1, 540},
     {3, 360},
     {4, 180},
     {5, 180},
     {6, 540},
     {7, 540},
     {25, 180},
     {26, 180},
     {43, 180},
     {2, 360}];
enchant_attr({5, 9}) ->
    [{1, 540},
     {3, 360},
     {4, 180},
     {5, 180},
     {6, 540},
     {7, 540},
     {25, 180},
     {26, 180},
     {43, 180},
     {2, 360}];
enchant_attr({21, 9}) ->
    [{1, 540},
     {3, 360},
     {4, 180},
     {5, 180},
     {6, 540},
     {7, 540},
     {25, 180},
     {26, 180},
     {43, 180},
     {2, 360}];
enchant_attr({22, 9}) ->
    [{1, 540},
     {3, 360},
     {4, 180},
     {5, 180},
     {6, 540},
     {7, 540},
     {25, 180},
     {26, 180},
     {43, 180},
     {2, 360}];
enchant_attr({6, 9}) ->
    [{1, 540},
     {3, 360},
     {4, 180},
     {5, 180},
     {6, 540},
     {7, 540},
     {25, 180},
     {26, 180},
     {43, 180},
     {2, 360}];
enchant_attr({7, 9}) ->
    [{1, 540},
     {3, 360},
     {4, 180},
     {5, 180},
     {6, 540},
     {7, 540},
     {25, 180},
     {26, 180},
     {43, 180},
     {2, 360}];
enchant_attr({9, 9}) ->
    [{1, 540},
     {3, 360},
     {4, 180},
     {5, 180},
     {6, 540},
     {7, 540},
     {25, 180},
     {26, 180},
     {43, 180},
     {2, 360}];
enchant_attr({10, 9}) ->
    [{1, 540},
     {3, 360},
     {4, 180},
     {5, 180},
     {6, 540},
     {7, 540},
     {25, 180},
     {26, 180},
     {43, 180},
     {2, 360}];
enchant_attr({11, 9}) ->
    [{1, 540},
     {3, 360},
     {4, 180},
     {5, 180},
     {6, 540},
     {7, 540},
     {25, 180},
     {26, 180},
     {43, 180},
     {2, 360}];
enchant_attr({12, 9}) ->
    [{1, 540},
     {3, 360},
     {4, 180},
     {5, 180},
     {6, 540},
     {7, 540},
     {25, 180},
     {26, 180},
     {43, 180},
     {2, 360}];
enchant_attr({14, 9}) ->
    [{1, 540},
     {3, 360},
     {4, 180},
     {5, 180},
     {6, 540},
     {7, 540},
     {25, 180},
     {26, 180},
     {43, 180},
     {2, 360}];
enchant_attr({1, 10}) ->
    [{1, 600},
     {3, 400},
     {4, 200},
     {5, 200},
     {6, 600},
     {7, 600},
     {25, 200},
     {26, 200},
     {43, 200},
     {2, 400}];
enchant_attr({4, 10}) ->
    [{1, 600},
     {3, 400},
     {4, 200},
     {5, 200},
     {6, 600},
     {7, 600},
     {25, 200},
     {26, 200},
     {43, 200},
     {2, 400}];
enchant_attr({2, 10}) ->
    [{1, 600},
     {3, 400},
     {4, 200},
     {5, 200},
     {6, 600},
     {7, 600},
     {25, 200},
     {26, 200},
     {43, 200},
     {2, 400}];
enchant_attr({3, 10}) ->
    [{1, 600},
     {3, 400},
     {4, 200},
     {5, 200},
     {6, 600},
     {7, 600},
     {25, 200},
     {26, 200},
     {43, 200},
     {2, 400}];
enchant_attr({5, 10}) ->
    [{1, 600},
     {3, 400},
     {4, 200},
     {5, 200},
     {6, 600},
     {7, 600},
     {25, 200},
     {26, 200},
     {43, 200},
     {2, 400}];
enchant_attr({21, 10}) ->
    [{1, 600},
     {3, 400},
     {4, 200},
     {5, 200},
     {6, 600},
     {7, 600},
     {25, 200},
     {26, 200},
     {43, 200},
     {2, 400}];
enchant_attr({22, 10}) ->
    [{1, 600},
     {3, 400},
     {4, 200},
     {5, 200},
     {6, 600},
     {7, 600},
     {25, 200},
     {26, 200},
     {43, 200},
     {2, 400}];
enchant_attr({6, 10}) ->
    [{1, 600},
     {3, 400},
     {4, 200},
     {5, 200},
     {6, 600},
     {7, 600},
     {25, 200},
     {26, 200},
     {43, 200},
     {2, 400}];
enchant_attr({7, 10}) ->
    [{1, 600},
     {3, 400},
     {4, 200},
     {5, 200},
     {6, 600},
     {7, 600},
     {25, 200},
     {26, 200},
     {43, 200},
     {2, 400}];
enchant_attr({9, 10}) ->
    [{1, 600},
     {3, 400},
     {4, 200},
     {5, 200},
     {6, 600},
     {7, 600},
     {25, 200},
     {26, 200},
     {43, 200},
     {2, 400}];
enchant_attr({10, 10}) ->
    [{1, 600},
     {3, 400},
     {4, 200},
     {5, 200},
     {6, 600},
     {7, 600},
     {25, 200},
     {26, 200},
     {43, 200},
     {2, 400}];
enchant_attr({11, 10}) ->
    [{1, 600},
     {3, 400},
     {4, 200},
     {5, 200},
     {6, 600},
     {7, 600},
     {25, 200},
     {26, 200},
     {43, 200},
     {2, 400}];
enchant_attr({12, 10}) ->
    [{1, 600},
     {3, 400},
     {4, 200},
     {5, 200},
     {6, 600},
     {7, 600},
     {25, 200},
     {26, 200},
     {43, 200},
     {2, 400}];
enchant_attr({14, 10}) ->
    [{1, 600},
     {3, 400},
     {4, 200},
     {5, 200},
     {6, 600},
     {7, 600},
     {25, 200},
     {26, 200},
     {43, 200},
     {2, 400}];
enchant_attr({1, 11}) ->
    [{1, 660},
     {3, 440},
     {4, 220},
     {5, 220},
     {6, 660},
     {7, 660},
     {25, 220},
     {26, 220},
     {43, 220},
     {2, 440}];
enchant_attr({4, 11}) ->
    [{1, 660},
     {3, 440},
     {4, 220},
     {5, 220},
     {6, 660},
     {7, 660},
     {25, 220},
     {26, 220},
     {43, 220},
     {2, 440}];
enchant_attr({2, 11}) ->
    [{1, 660},
     {3, 440},
     {4, 220},
     {5, 220},
     {6, 660},
     {7, 660},
     {25, 220},
     {26, 220},
     {43, 220},
     {2, 440}];
enchant_attr({3, 11}) ->
    [{1, 660},
     {3, 440},
     {4, 220},
     {5, 220},
     {6, 660},
     {7, 660},
     {25, 220},
     {26, 220},
     {43, 220},
     {2, 440}];
enchant_attr({5, 11}) ->
    [{1, 660},
     {3, 440},
     {4, 220},
     {5, 220},
     {6, 660},
     {7, 660},
     {25, 220},
     {26, 220},
     {43, 220},
     {2, 440}];
enchant_attr({21, 11}) ->
    [{1, 660},
     {3, 440},
     {4, 220},
     {5, 220},
     {6, 660},
     {7, 660},
     {25, 220},
     {26, 220},
     {43, 220},
     {2, 440}];
enchant_attr({22, 11}) ->
    [{1, 660},
     {3, 440},
     {4, 220},
     {5, 220},
     {6, 660},
     {7, 660},
     {25, 220},
     {26, 220},
     {43, 220},
     {2, 440}];
enchant_attr({6, 11}) ->
    [{1, 660},
     {3, 440},
     {4, 220},
     {5, 220},
     {6, 660},
     {7, 660},
     {25, 220},
     {26, 220},
     {43, 220},
     {2, 440}];
enchant_attr({7, 11}) ->
    [{1, 660},
     {3, 440},
     {4, 220},
     {5, 220},
     {6, 660},
     {7, 660},
     {25, 220},
     {26, 220},
     {43, 220},
     {2, 440}];
enchant_attr({9, 11}) ->
    [{1, 660},
     {3, 440},
     {4, 220},
     {5, 220},
     {6, 660},
     {7, 660},
     {25, 220},
     {26, 220},
     {43, 220},
     {2, 440}];
enchant_attr({10, 11}) ->
    [{1, 660},
     {3, 440},
     {4, 220},
     {5, 220},
     {6, 660},
     {7, 660},
     {25, 220},
     {26, 220},
     {43, 220},
     {2, 440}];
enchant_attr({11, 11}) ->
    [{1, 660},
     {3, 440},
     {4, 220},
     {5, 220},
     {6, 660},
     {7, 660},
     {25, 220},
     {26, 220},
     {43, 220},
     {2, 440}];
enchant_attr({12, 11}) ->
    [{1, 660},
     {3, 440},
     {4, 220},
     {5, 220},
     {6, 660},
     {7, 660},
     {25, 220},
     {26, 220},
     {43, 220},
     {2, 440}];
enchant_attr({14, 11}) ->
    [{1, 660},
     {3, 440},
     {4, 220},
     {5, 220},
     {6, 660},
     {7, 660},
     {25, 220},
     {26, 220},
     {43, 220},
     {2, 440}];
enchant_attr({1, 12}) ->
    [{1, 720},
     {3, 480},
     {4, 240},
     {5, 240},
     {6, 720},
     {7, 720},
     {25, 240},
     {26, 240},
     {43, 240},
     {2, 480}];
enchant_attr({4, 12}) ->
    [{1, 720},
     {3, 480},
     {4, 240},
     {5, 240},
     {6, 720},
     {7, 720},
     {25, 240},
     {26, 240},
     {43, 240},
     {2, 480}];
enchant_attr({2, 12}) ->
    [{1, 720},
     {3, 480},
     {4, 240},
     {5, 240},
     {6, 720},
     {7, 720},
     {25, 240},
     {26, 240},
     {43, 240},
     {2, 480}];
enchant_attr({3, 12}) ->
    [{1, 720},
     {3, 480},
     {4, 240},
     {5, 240},
     {6, 720},
     {7, 720},
     {25, 240},
     {26, 240},
     {43, 240},
     {2, 480}];
enchant_attr({5, 12}) ->
    [{1, 720},
     {3, 480},
     {4, 240},
     {5, 240},
     {6, 720},
     {7, 720},
     {25, 240},
     {26, 240},
     {43, 240},
     {2, 480}];
enchant_attr({21, 12}) ->
    [{1, 720},
     {3, 480},
     {4, 240},
     {5, 240},
     {6, 720},
     {7, 720},
     {25, 240},
     {26, 240},
     {43, 240},
     {2, 480}];
enchant_attr({22, 12}) ->
    [{1, 720},
     {3, 480},
     {4, 240},
     {5, 240},
     {6, 720},
     {7, 720},
     {25, 240},
     {26, 240},
     {43, 240},
     {2, 480}];
enchant_attr({6, 12}) ->
    [{1, 720},
     {3, 480},
     {4, 240},
     {5, 240},
     {6, 720},
     {7, 720},
     {25, 240},
     {26, 240},
     {43, 240},
     {2, 480}];
enchant_attr({7, 12}) ->
    [{1, 720},
     {3, 480},
     {4, 240},
     {5, 240},
     {6, 720},
     {7, 720},
     {25, 240},
     {26, 240},
     {43, 240},
     {2, 480}];
enchant_attr({9, 12}) ->
    [{1, 720},
     {3, 480},
     {4, 240},
     {5, 240},
     {6, 720},
     {7, 720},
     {25, 240},
     {26, 240},
     {43, 240},
     {2, 480}];
enchant_attr({10, 12}) ->
    [{1, 720},
     {3, 480},
     {4, 240},
     {5, 240},
     {6, 720},
     {7, 720},
     {25, 240},
     {26, 240},
     {43, 240},
     {2, 480}];
enchant_attr({11, 12}) ->
    [{1, 720},
     {3, 480},
     {4, 240},
     {5, 240},
     {6, 720},
     {7, 720},
     {25, 240},
     {26, 240},
     {43, 240},
     {2, 480}];
enchant_attr({12, 12}) ->
    [{1, 720},
     {3, 480},
     {4, 240},
     {5, 240},
     {6, 720},
     {7, 720},
     {25, 240},
     {26, 240},
     {43, 240},
     {2, 480}];
enchant_attr({14, 12}) ->
    [{1, 720},
     {3, 480},
     {4, 240},
     {5, 240},
     {6, 720},
     {7, 720},
     {25, 240},
     {26, 240},
     {43, 240},
     {2, 480}];
enchant_attr({1, 13}) ->
    [{1, 750},
     {3, 520},
     {4, 260},
     {5, 260},
     {6, 750},
     {7, 750},
     {25, 260},
     {26, 260},
     {43, 260},
     {2, 520}];
enchant_attr({4, 13}) ->
    [{1, 750},
     {3, 520},
     {4, 260},
     {5, 260},
     {6, 750},
     {7, 750},
     {25, 260},
     {26, 260},
     {43, 260},
     {2, 520}];
enchant_attr({2, 13}) ->
    [{1, 750},
     {3, 520},
     {4, 260},
     {5, 260},
     {6, 750},
     {7, 750},
     {25, 260},
     {26, 260},
     {43, 260},
     {2, 520}];
enchant_attr({3, 13}) ->
    [{1, 750},
     {3, 520},
     {4, 260},
     {5, 260},
     {6, 750},
     {7, 750},
     {25, 260},
     {26, 260},
     {43, 260},
     {2, 520}];
enchant_attr({5, 13}) ->
    [{1, 750},
     {3, 520},
     {4, 260},
     {5, 260},
     {6, 750},
     {7, 750},
     {25, 260},
     {26, 260},
     {43, 260},
     {2, 520}];
enchant_attr({21, 13}) ->
    [{1, 750},
     {3, 520},
     {4, 260},
     {5, 260},
     {6, 750},
     {7, 750},
     {25, 260},
     {26, 260},
     {43, 260},
     {2, 520}];
enchant_attr({22, 13}) ->
    [{1, 750},
     {3, 520},
     {4, 260},
     {5, 260},
     {6, 750},
     {7, 750},
     {25, 260},
     {26, 260},
     {43, 260},
     {2, 520}];
enchant_attr({6, 13}) ->
    [{1, 750},
     {3, 520},
     {4, 260},
     {5, 260},
     {6, 750},
     {7, 750},
     {25, 260},
     {26, 260},
     {43, 260},
     {2, 520}];
enchant_attr({7, 13}) ->
    [{1, 750},
     {3, 520},
     {4, 260},
     {5, 260},
     {6, 750},
     {7, 750},
     {25, 260},
     {26, 260},
     {43, 260},
     {2, 520}];
enchant_attr({9, 13}) ->
    [{1, 750},
     {3, 520},
     {4, 260},
     {5, 260},
     {6, 750},
     {7, 750},
     {25, 260},
     {26, 260},
     {43, 260},
     {2, 520}];
enchant_attr({10, 13}) ->
    [{1, 750},
     {3, 520},
     {4, 260},
     {5, 260},
     {6, 750},
     {7, 750},
     {25, 260},
     {26, 260},
     {43, 260},
     {2, 520}];
enchant_attr({11, 13}) ->
    [{1, 750},
     {3, 520},
     {4, 260},
     {5, 260},
     {6, 750},
     {7, 750},
     {25, 260},
     {26, 260},
     {43, 260},
     {2, 520}];
enchant_attr({12, 13}) ->
    [{1, 750},
     {3, 520},
     {4, 260},
     {5, 260},
     {6, 750},
     {7, 750},
     {25, 260},
     {26, 260},
     {43, 260},
     {2, 520}];
enchant_attr({14, 13}) ->
    [{1, 750},
     {3, 520},
     {4, 260},
     {5, 260},
     {6, 750},
     {7, 750},
     {25, 260},
     {26, 260},
     {43, 260},
     {2, 520}];
enchant_attr({1, 14}) ->
    [{1, 770},
     {3, 550},
     {4, 280},
     {5, 280},
     {6, 770},
     {7, 770},
     {25, 280},
     {26, 280},
     {43, 280},
     {2, 550}];
enchant_attr({4, 14}) ->
    [{1, 770},
     {3, 550},
     {4, 280},
     {5, 280},
     {6, 770},
     {7, 770},
     {25, 280},
     {26, 280},
     {43, 280},
     {2, 550}];
enchant_attr({2, 14}) ->
    [{1, 770},
     {3, 550},
     {4, 280},
     {5, 280},
     {6, 770},
     {7, 770},
     {25, 280},
     {26, 280},
     {43, 280},
     {2, 550}];
enchant_attr({3, 14}) ->
    [{1, 770},
     {3, 550},
     {4, 280},
     {5, 280},
     {6, 770},
     {7, 770},
     {25, 280},
     {26, 280},
     {43, 280},
     {2, 550}];
enchant_attr({5, 14}) ->
    [{1, 770},
     {3, 550},
     {4, 280},
     {5, 280},
     {6, 770},
     {7, 770},
     {25, 280},
     {26, 280},
     {43, 280},
     {2, 550}];
enchant_attr({21, 14}) ->
    [{1, 770},
     {3, 550},
     {4, 280},
     {5, 280},
     {6, 770},
     {7, 770},
     {25, 280},
     {26, 280},
     {43, 280},
     {2, 550}];
enchant_attr({22, 14}) ->
    [{1, 770},
     {3, 550},
     {4, 280},
     {5, 280},
     {6, 770},
     {7, 770},
     {25, 280},
     {26, 280},
     {43, 280},
     {2, 550}];
enchant_attr({6, 14}) ->
    [{1, 770},
     {3, 550},
     {4, 280},
     {5, 280},
     {6, 770},
     {7, 770},
     {25, 280},
     {26, 280},
     {43, 280},
     {2, 550}];
enchant_attr({7, 14}) ->
    [{1, 770},
     {3, 550},
     {4, 280},
     {5, 280},
     {6, 770},
     {7, 770},
     {25, 280},
     {26, 280},
     {43, 280},
     {2, 550}];
enchant_attr({9, 14}) ->
    [{1, 770},
     {3, 550},
     {4, 280},
     {5, 280},
     {6, 770},
     {7, 770},
     {25, 280},
     {26, 280},
     {43, 280},
     {2, 550}];
enchant_attr({10, 14}) ->
    [{1, 770},
     {3, 550},
     {4, 280},
     {5, 280},
     {6, 770},
     {7, 770},
     {25, 280},
     {26, 280},
     {43, 280},
     {2, 550}];
enchant_attr({11, 14}) ->
    [{1, 770},
     {3, 550},
     {4, 280},
     {5, 280},
     {6, 770},
     {7, 770},
     {25, 280},
     {26, 280},
     {43, 280},
     {2, 550}];
enchant_attr({12, 14}) ->
    [{1, 770},
     {3, 550},
     {4, 280},
     {5, 280},
     {6, 770},
     {7, 770},
     {25, 280},
     {26, 280},
     {43, 280},
     {2, 550}];
enchant_attr({14, 14}) ->
    [{1, 770},
     {3, 550},
     {4, 280},
     {5, 280},
     {6, 770},
     {7, 770},
     {25, 280},
     {26, 280},
     {43, 280},
     {2, 550}];
enchant_attr({1, 15}) ->
    [{1, 790},
     {3, 580},
     {4, 300},
     {5, 300},
     {6, 790},
     {7, 790},
     {25, 300},
     {26, 300},
     {43, 300},
     {2, 580}];
enchant_attr({4, 15}) ->
    [{1, 790},
     {3, 580},
     {4, 300},
     {5, 300},
     {6, 790},
     {7, 790},
     {25, 300},
     {26, 300},
     {43, 300},
     {2, 580}];
enchant_attr({2, 15}) ->
    [{1, 790},
     {3, 580},
     {4, 300},
     {5, 300},
     {6, 790},
     {7, 790},
     {25, 300},
     {26, 300},
     {43, 300},
     {2, 580}];
enchant_attr({3, 15}) ->
    [{1, 790},
     {3, 580},
     {4, 300},
     {5, 300},
     {6, 790},
     {7, 790},
     {25, 300},
     {26, 300},
     {43, 300},
     {2, 580}];
enchant_attr({5, 15}) ->
    [{1, 790},
     {3, 580},
     {4, 300},
     {5, 300},
     {6, 790},
     {7, 790},
     {25, 300},
     {26, 300},
     {43, 300},
     {2, 580}];
enchant_attr({21, 15}) ->
    [{1, 790},
     {3, 580},
     {4, 300},
     {5, 300},
     {6, 790},
     {7, 790},
     {25, 300},
     {26, 300},
     {43, 300},
     {2, 580}];
enchant_attr({22, 15}) ->
    [{1, 790},
     {3, 580},
     {4, 300},
     {5, 300},
     {6, 790},
     {7, 790},
     {25, 300},
     {26, 300},
     {43, 300},
     {2, 580}];
enchant_attr({6, 15}) ->
    [{1, 790},
     {3, 580},
     {4, 300},
     {5, 300},
     {6, 790},
     {7, 790},
     {25, 300},
     {26, 300},
     {43, 300},
     {2, 580}];
enchant_attr({7, 15}) ->
    [{1, 790},
     {3, 580},
     {4, 300},
     {5, 300},
     {6, 790},
     {7, 790},
     {25, 300},
     {26, 300},
     {43, 300},
     {2, 580}];
enchant_attr({9, 15}) ->
    [{1, 790},
     {3, 580},
     {4, 300},
     {5, 300},
     {6, 790},
     {7, 790},
     {25, 300},
     {26, 300},
     {43, 300},
     {2, 580}];
enchant_attr({10, 15}) ->
    [{1, 790},
     {3, 580},
     {4, 300},
     {5, 300},
     {6, 790},
     {7, 790},
     {25, 300},
     {26, 300},
     {43, 300},
     {2, 580}];
enchant_attr({11, 15}) ->
    [{1, 790},
     {3, 580},
     {4, 300},
     {5, 300},
     {6, 790},
     {7, 790},
     {25, 300},
     {26, 300},
     {43, 300},
     {2, 580}];
enchant_attr({12, 15}) ->
    [{1, 790},
     {3, 580},
     {4, 300},
     {5, 300},
     {6, 790},
     {7, 790},
     {25, 300},
     {26, 300},
     {43, 300},
     {2, 580}];
enchant_attr({14, 15}) ->
    [{1, 790},
     {3, 580},
     {4, 300},
     {5, 300},
     {6, 790},
     {7, 790},
     {25, 300},
     {26, 300},
     {43, 300},
     {2, 580}];
enchant_attr(_) -> [].

get_effect_attr({1, 40}) ->
    [{1, [{100, 10001}, {100, 10002}], 40},
     {1,
      [{100, 81000}, {100, 81001}, {150, 50}, {151, 200}],
      60},
     {1, [], 900}];
get_effect_attr({6, 40}) ->
    [{1, [{100, 10001}, {100, 10002}], 40},
     {1, [{100, 81002}, {150, 50}, {151, 200}], 60},
     {1, [], 900},
     {2, [{100, 20001}, {100, 20002}], 40},
     {2, [{100, 81002}, {150, 50}, {151, 200}], 60},
     {2, [], 900},
     {3, [{100, 30001}, {100, 30002}], 40},
     {3, [{100, 81002}, {150, 50}, {151, 200}], 60},
     {3, [], 900},
     {4, [{100, 40001}, {100, 40002}], 40},
     {4, [{100, 81002}, {150, 50}, {151, 200}], 60},
     {4, [], 900},
     {5, [{100, 50001}, {100, 50002}], 40},
     {5, [{100, 81002}, {150, 50}, {151, 200}], 60},
     {5, [], 900},
     {6, [{100, 69001}, {100, 69002}], 40},
     {6, [{100, 81002}, {150, 50}, {151, 200}], 60},
     {6, [], 900},
     {7, [{100, 69501}, {100, 69502}], 40},
     {7, [{100, 81002}, {150, 50}, {151, 200}], 60},
     {7, [], 900}];
get_effect_attr({2, 40}) ->
    [{2, [{100, 20001}, {100, 20002}], 40},
     {2,
      [{100, 81000}, {100, 81001}, {150, 50}, {151, 200}],
      60},
     {2, [], 900}];
get_effect_attr({3, 40}) ->
    [{3, [{100, 30001}, {100, 30002}], 40},
     {3,
      [{100, 81000}, {100, 81001}, {150, 50}, {151, 200}],
      60},
     {3, [], 900}];
get_effect_attr({4, 40}) ->
    [{4, [{100, 40001}, {100, 40002}], 40},
     {4,
      [{100, 81000}, {100, 81001}, {150, 50}, {151, 200}],
      60},
     {4, [], 900}];
get_effect_attr({5, 40}) ->
    [{5, [{100, 50001}, {100, 50002}], 40},
     {5,
      [{100, 81000}, {100, 81001}, {150, 50}, {151, 200}],
      60},
     {5, [], 900}];
get_effect_attr({21, 40}) ->
    [{6, [{100, 69001}, {100, 69002}], 40},
     {6,
      [{100, 81000}, {100, 81001}, {150, 50}, {151, 200}],
      60},
     {6, [], 900}];
get_effect_attr({22, 40}) ->
    [{7, [{100, 69501}, {100, 69502}], 40},
     {7,
      [{100, 81000}, {100, 81001}, {150, 50}, {151, 200}],
      60},
     {7, [], 900}];
get_effect_attr({7, 40}) ->
    [{0,
      [{100, 81003},
       {100, 81004},
       {100, 81005},
       {100, 81006},
       {150, 50},
       {151, 200}],
      100},
     {0, [], 900}];
get_effect_attr({9, 40}) ->
    [{0,
      [{100, 81007},
       {100, 81008},
       {100, 81009},
       {100, 81023},
       {150, 50},
       {151, 200}],
      100},
     {0, [], 900}];
get_effect_attr({10, 40}) ->
    [{0,
      [{100, 81010}, {100, 81011}, {150, 50}, {151, 200}],
      100},
     {0, [], 900}];
get_effect_attr({11, 40}) ->
    [{0,
      [{100, 81012},
       {100, 81013},
       {100, 81021},
       {150, 50},
       {151, 200}],
      75},
     {0, [], 925}];
get_effect_attr({12, 40}) ->
    [{0,
      [{100, 81014},
       {100, 81015},
       {100, 81022},
       {150, 50},
       {151, 200}],
      100},
     {0, [], 900}];
get_effect_attr({14, 40}) ->
    [{0,
      [{100, 81016},
       {100, 81017},
       {100, 81018},
       {150, 50},
       {151, 200}],
      100},
     {0, [], 900}];
get_effect_attr({1, 50}) ->
    [{1, [{100, 10001}, {100, 10002}, {100, 10004}], 40},
     {1,
      [{100, 81000}, {100, 81001}, {150, 50}, {151, 200}],
      60},
     {1, [], 900}];
get_effect_attr({6, 50}) ->
    [{1, [{100, 10001}, {100, 10002}, {100, 10004}], 40},
     {1, [{100, 81002}, {150, 50}, {151, 200}], 60},
     {1, [], 900},
     {2, [{100, 20001}, {100, 20002}, {100, 20003}], 40},
     {2, [{100, 81002}, {150, 50}, {151, 200}], 60},
     {2, [], 900},
     {3, [{100, 30001}, {100, 30002}, {100, 30003}], 40},
     {3, [{100, 81002}, {150, 50}, {151, 200}], 60},
     {3, [], 900},
     {4, [{100, 40001}, {100, 40002}, {100, 40004}], 40},
     {4, [{100, 81002}, {150, 50}, {151, 200}], 60},
     {4, [], 900},
     {5, [{100, 50001}, {100, 50002}, {100, 50003}], 40},
     {5, [{100, 81002}, {150, 50}, {151, 200}], 60},
     {5, [], 900},
     {6, [{100, 69001}, {100, 69002}, {100, 69003}], 40},
     {6, [{100, 81002}, {150, 50}, {151, 200}], 60},
     {6, [], 900},
     {7, [{100, 69501}, {100, 69502}, {100, 69503}], 40},
     {7, [{100, 81002}, {150, 50}, {151, 200}], 60},
     {7, [], 900}];
get_effect_attr({2, 50}) ->
    [{2, [{100, 20001}, {100, 20002}, {100, 20003}], 40},
     {2,
      [{100, 81000}, {100, 81001}, {150, 50}, {151, 200}],
      60},
     {2, [], 900}];
get_effect_attr({3, 50}) ->
    [{3, [{100, 30001}, {100, 30002}, {100, 30003}], 40},
     {3,
      [{100, 81000}, {100, 81001}, {150, 50}, {151, 200}],
      60},
     {3, [], 900}];
get_effect_attr({4, 50}) ->
    [{4, [{100, 40001}, {100, 40002}, {100, 40004}], 40},
     {4,
      [{100, 81000}, {100, 81001}, {150, 50}, {151, 200}],
      60},
     {4, [], 900}];
get_effect_attr({5, 50}) ->
    [{5, [{100, 50001}, {100, 50002}, {100, 50003}], 40},
     {5,
      [{100, 81000}, {100, 81001}, {150, 50}, {151, 200}],
      60},
     {5, [], 900}];
get_effect_attr({21, 50}) ->
    [{6, [{100, 69001}, {100, 69002}, {100, 69003}], 40},
     {6,
      [{100, 81000}, {100, 81001}, {150, 50}, {151, 200}],
      60},
     {6, [], 900}];
get_effect_attr({22, 50}) ->
    [{7, [{100, 69501}, {100, 69502}, {100, 69503}], 40},
     {7,
      [{100, 81000}, {100, 81001}, {150, 50}, {151, 200}],
      60},
     {7, [], 900}];
get_effect_attr({7, 50}) ->
    [{0,
      [{100, 81003},
       {100, 81004},
       {100, 81005},
       {100, 81006},
       {150, 50},
       {151, 200}],
      100},
     {0, [], 900}];
get_effect_attr({9, 50}) ->
    [{0,
      [{100, 81007},
       {100, 81008},
       {100, 81009},
       {100, 81023},
       {150, 50},
       {151, 200}],
      100},
     {0, [], 900}];
get_effect_attr({10, 50}) ->
    [{0,
      [{100, 81010}, {100, 81011}, {150, 50}, {151, 200}],
      100},
     {0, [], 900}];
get_effect_attr({11, 50}) ->
    [{0,
      [{100, 81012},
       {100, 81013},
       {100, 81021},
       {150, 50},
       {151, 200}],
      75},
     {0, [], 925}];
get_effect_attr({12, 50}) ->
    [{0,
      [{100, 81014},
       {100, 81015},
       {100, 81022},
       {150, 50},
       {151, 200}],
      100},
     {0, [], 900}];
get_effect_attr({14, 50}) ->
    [{0,
      [{100, 81016},
       {100, 81017},
       {100, 81018},
       {150, 50},
       {151, 200}],
      100},
     {0, [], 900}];
get_effect_attr({1, 60}) ->
    [{1,
      [{100, 10001},
       {100, 10002},
       {100, 10003},
       {100, 10004},
       {100, 10005}],
      50},
     {1,
      [{100, 81000}, {100, 81001}, {150, 50}, {151, 200}],
      70},
     {1, [], 880}];
get_effect_attr({6, 60}) ->
    [{1,
      [{100, 10001},
       {100, 10002},
       {100, 10003},
       {100, 10004},
       {100, 10005}],
      50},
     {1, [{100, 81002}, {150, 50}, {151, 200}], 70},
     {1, [], 880},
     {2,
      [{100, 20001},
       {100, 20002},
       {100, 20003},
       {100, 20006},
       {100, 20005}],
      50},
     {2, [{100, 81002}, {150, 50}, {151, 200}], 70},
     {2, [], 880},
     {3,
      [{100, 30001},
       {100, 30002},
       {100, 30003},
       {100, 30004},
       {100, 30005}],
      50},
     {3, [{100, 81002}, {150, 50}, {151, 200}], 70},
     {3, [], 880},
     {4,
      [{100, 40001},
       {100, 40002},
       {100, 40003},
       {100, 40004},
       {100, 40005}],
      50},
     {4, [{100, 81002}, {150, 50}, {151, 200}], 70},
     {4, [], 880},
     {5,
      [{100, 50001},
       {100, 50002},
       {100, 50003},
       {100, 50004},
       {100, 50005}],
      50},
     {5, [{100, 81002}, {150, 50}, {151, 200}], 70},
     {5, [], 880},
     {6,
      [{100, 69001},
       {100, 69002},
       {100, 69003},
       {100, 69004},
       {100, 69005}],
      50},
     {6, [{100, 81002}, {150, 50}, {151, 200}], 70},
     {6, [], 880},
     {7,
      [{100, 69501},
       {100, 69502},
       {100, 69503},
       {100, 69504},
       {100, 69505}],
      50},
     {7, [{100, 81002}, {150, 50}, {151, 200}], 70},
     {7, [], 880}];
get_effect_attr({2, 60}) ->
    [{2,
      [{100, 20001},
       {100, 20002},
       {100, 20003},
       {100, 20006},
       {100, 20005}],
      50},
     {2,
      [{100, 81000}, {100, 81001}, {150, 50}, {151, 200}],
      70},
     {2, [], 880}];
get_effect_attr({3, 60}) ->
    [{3,
      [{100, 30001},
       {100, 30002},
       {100, 30003},
       {100, 30004},
       {100, 30005}],
      50},
     {3,
      [{100, 81000}, {100, 81001}, {150, 50}, {151, 200}],
      70},
     {3, [], 880}];
get_effect_attr({4, 60}) ->
    [{4,
      [{100, 40001},
       {100, 40002},
       {100, 40003},
       {100, 40004},
       {100, 40005}],
      50},
     {4,
      [{100, 81000}, {100, 81001}, {150, 50}, {151, 200}],
      70},
     {4, [], 880}];
get_effect_attr({5, 60}) ->
    [{5,
      [{100, 50001},
       {100, 50002},
       {100, 50003},
       {100, 50004},
       {100, 50005}],
      50},
     {5,
      [{100, 81000}, {100, 81001}, {150, 50}, {151, 200}],
      70},
     {5, [], 880}];
get_effect_attr({21, 60}) ->
    [{6,
      [{100, 69001},
       {100, 69002},
       {100, 69003},
       {100, 69004},
       {100, 69005}],
      50},
     {6,
      [{100, 81000}, {100, 81001}, {150, 50}, {151, 200}],
      70},
     {6, [], 880}];
get_effect_attr({22, 60}) ->
    [{7,
      [{100, 69501},
       {100, 69502},
       {100, 69503},
       {100, 69504},
       {100, 69505}],
      50},
     {7,
      [{100, 81000}, {100, 81001}, {150, 50}, {151, 200}],
      70},
     {7, [], 880}];
get_effect_attr({7, 60}) ->
    [{0,
      [{100, 81003},
       {100, 81004},
       {100, 81005},
       {100, 81006},
       {150, 50},
       {151, 200}],
      120},
     {0, [], 880}];
get_effect_attr({9, 60}) ->
    [{0,
      [{100, 81007},
       {100, 81008},
       {100, 81009},
       {100, 81023},
       {150, 50},
       {151, 200}],
      120},
     {0, [], 880}];
get_effect_attr({10, 60}) ->
    [{0,
      [{100, 81010}, {100, 81011}, {150, 50}, {151, 200}],
      120},
     {0, [], 880}];
get_effect_attr({11, 60}) ->
    [{0,
      [{100, 81012},
       {100, 81013},
       {100, 81021},
       {150, 50},
       {151, 200}],
      75},
     {0, [], 925}];
get_effect_attr({12, 60}) ->
    [{0,
      [{100, 81014},
       {100, 81015},
       {100, 81022},
       {150, 50},
       {151, 200}],
      120},
     {0, [], 880}];
get_effect_attr({14, 60}) ->
    [{0,
      [{100, 81016},
       {100, 81017},
       {100, 81018},
       {150, 50},
       {151, 200}],
      120},
     {0, [], 880}];
get_effect_attr({1, 70}) ->
    [{1,
      [{100, 10001},
       {100, 10002},
       {100, 10003},
       {100, 10004},
       {100, 10005},
       {100, 10006},
       {100, 10007}],
      50},
     {1,
      [{100, 81000}, {100, 81001}, {150, 50}, {151, 200}],
      70},
     {1, [], 880}];
get_effect_attr({6, 70}) ->
    [{1,
      [{100, 10001},
       {100, 10002},
       {100, 10003},
       {100, 10004},
       {100, 10005},
       {100, 10006},
       {100, 10007}],
      50},
     {1, [{100, 81002}, {150, 50}, {151, 200}], 70},
     {1, [], 880},
     {2,
      [{100, 20001},
       {100, 20002},
       {100, 20003},
       {100, 20006},
       {100, 20005},
       {100, 20004},
       {100, 20007}],
      50},
     {2, [{100, 81002}, {150, 50}, {151, 200}], 70},
     {2, [], 880},
     {3,
      [{100, 30001},
       {100, 30002},
       {100, 30003},
       {100, 30004},
       {100, 30005},
       {100, 30006},
       {100, 30007}],
      50},
     {3, [{100, 81002}, {150, 50}, {151, 200}], 70},
     {3, [], 880},
     {4,
      [{100, 40001},
       {100, 40002},
       {100, 40003},
       {100, 40004},
       {100, 40005},
       {100, 40006},
       {100, 40007}],
      50},
     {4, [{100, 81002}, {150, 50}, {151, 200}], 70},
     {4, [], 880},
     {5,
      [{100, 50001},
       {100, 50002},
       {100, 50003},
       {100, 50004},
       {100, 50005},
       {100, 50006},
       {100, 50007}],
      50},
     {5, [{100, 81002}, {150, 50}, {151, 200}], 70},
     {5, [], 880},
     {6,
      [{100, 69001},
       {100, 69002},
       {100, 69003},
       {100, 69004},
       {100, 69005},
       {100, 69006},
       {100, 69007}],
      50},
     {6, [{100, 81002}, {150, 50}, {151, 200}], 70},
     {6, [], 880},
     {7,
      [{100, 69501},
       {100, 69502},
       {100, 69503},
       {100, 69504},
       {100, 69505},
       {100, 69506},
       {100, 69507}],
      50},
     {7, [{100, 81002}, {150, 50}, {151, 200}], 70},
     {7, [], 880}];
get_effect_attr({2, 70}) ->
    [{2,
      [{100, 20001},
       {100, 20002},
       {100, 20003},
       {100, 20006},
       {100, 20005},
       {100, 20004},
       {100, 20007}],
      50},
     {2,
      [{100, 81000}, {100, 81001}, {150, 50}, {151, 200}],
      70},
     {2, [], 880}];
get_effect_attr({3, 70}) ->
    [{3,
      [{100, 30001},
       {100, 30002},
       {100, 30003},
       {100, 30004},
       {100, 30005},
       {100, 30006},
       {100, 30007}],
      50},
     {3,
      [{100, 81000}, {100, 81001}, {150, 50}, {151, 200}],
      70},
     {3, [], 880}];
get_effect_attr({4, 70}) ->
    [{4,
      [{100, 40001},
       {100, 40002},
       {100, 40003},
       {100, 40004},
       {100, 40005},
       {100, 40006},
       {100, 40007}],
      50},
     {4,
      [{100, 81000}, {100, 81001}, {150, 50}, {151, 200}],
      70},
     {4, [], 880}];
get_effect_attr({5, 70}) ->
    [{5,
      [{100, 50001},
       {100, 50002},
       {100, 50003},
       {100, 50004},
       {100, 50005},
       {100, 50006},
       {100, 50007}],
      50},
     {5,
      [{100, 81000}, {100, 81001}, {150, 50}, {151, 200}],
      70},
     {5, [], 880}];
get_effect_attr({21, 70}) ->
    [{6,
      [{100, 69001},
       {100, 69002},
       {100, 69003},
       {100, 69004},
       {100, 69005},
       {100, 69006},
       {100, 69007}],
      50},
     {6,
      [{100, 81000}, {100, 81001}, {150, 50}, {151, 200}],
      70},
     {6, [], 880}];
get_effect_attr({22, 70}) ->
    [{7,
      [{100, 69501},
       {100, 69502},
       {100, 69503},
       {100, 69504},
       {100, 69505},
       {100, 69506},
       {100, 69507}],
      50},
     {7,
      [{100, 81000}, {100, 81001}, {150, 50}, {151, 200}],
      70},
     {7, [], 880}];
get_effect_attr({7, 70}) ->
    [{0,
      [{100, 81003},
       {100, 81004},
       {100, 81005},
       {100, 81006},
       {150, 50},
       {151, 200}],
      120},
     {0, [], 880}];
get_effect_attr({9, 70}) ->
    [{0,
      [{100, 81007},
       {100, 81008},
       {100, 81009},
       {100, 81023},
       {150, 50},
       {151, 200}],
      120},
     {0, [], 880}];
get_effect_attr({10, 70}) ->
    [{0,
      [{100, 81010}, {100, 81011}, {150, 50}, {151, 200}],
      120},
     {0, [], 880}];
get_effect_attr({11, 70}) ->
    [{0,
      [{100, 81012},
       {100, 81013},
       {100, 81021},
       {150, 50},
       {151, 200}],
      75},
     {0, [], 925}];
get_effect_attr({12, 70}) ->
    [{0,
      [{100, 81014},
       {100, 81015},
       {100, 81022},
       {150, 50},
       {151, 200}],
      120},
     {0, [], 880}];
get_effect_attr({14, 70}) ->
    [{0,
      [{100, 81016},
       {100, 81017},
       {100, 81018},
       {150, 50},
       {151, 200}],
      120},
     {0, [], 880}];
get_effect_attr({1, 80}) ->
    [{1,
      [{100, 10001},
       {100, 10002},
       {100, 10003},
       {100, 10004},
       {100, 10005},
       {100, 10006},
       {100, 10007}],
      55},
     {1,
      [{100, 81000}, {100, 81001}, {150, 50}, {151, 200}],
      65},
     {1, [], 880}];
get_effect_attr({6, 80}) ->
    [{1,
      [{100, 10001},
       {100, 10002},
       {100, 10003},
       {100, 10004},
       {100, 10005},
       {100, 10006},
       {100, 10007}],
      55},
     {1, [{100, 81002}, {150, 50}, {151, 200}], 65},
     {1, [], 880},
     {2,
      [{100, 20001},
       {100, 20002},
       {100, 20003},
       {100, 20006},
       {100, 20005},
       {100, 20004},
       {100, 20007}],
      55},
     {2, [{100, 81002}, {150, 50}, {151, 200}], 65},
     {2, [], 880},
     {3,
      [{100, 30001},
       {100, 30002},
       {100, 30003},
       {100, 30004},
       {100, 30005},
       {100, 30006},
       {100, 30007}],
      55},
     {3, [{100, 81002}, {150, 50}, {151, 200}], 65},
     {3, [], 880},
     {4,
      [{100, 40001},
       {100, 40002},
       {100, 40003},
       {100, 40004},
       {100, 40005},
       {100, 40006},
       {100, 40007}],
      55},
     {4, [{100, 81002}, {150, 50}, {151, 200}], 65},
     {4, [], 880},
     {5,
      [{100, 50001},
       {100, 50002},
       {100, 50003},
       {100, 50004},
       {100, 50005},
       {100, 50006},
       {100, 50007}],
      55},
     {5, [{100, 81002}, {150, 50}, {151, 200}], 65},
     {5, [], 880},
     {6,
      [{100, 69001},
       {100, 69002},
       {100, 69003},
       {100, 69004},
       {100, 69005},
       {100, 69006},
       {100, 69007}],
      55},
     {6, [{100, 81002}, {150, 50}, {151, 200}], 65},
     {6, [], 880},
     {7,
      [{100, 69501},
       {100, 69502},
       {100, 69503},
       {100, 69504},
       {100, 69505},
       {100, 69506},
       {100, 69507}],
      55},
     {7, [{100, 81002}, {150, 50}, {151, 200}], 65},
     {7, [], 880}];
get_effect_attr({2, 80}) ->
    [{2,
      [{100, 20001},
       {100, 20002},
       {100, 20003},
       {100, 20006},
       {100, 20005},
       {100, 20004},
       {100, 20007}],
      55},
     {2,
      [{100, 81000}, {100, 81001}, {150, 50}, {151, 200}],
      65},
     {2, [], 880}];
get_effect_attr({3, 80}) ->
    [{3,
      [{100, 30001},
       {100, 30002},
       {100, 30003},
       {100, 30004},
       {100, 30005},
       {100, 30006},
       {100, 30007}],
      55},
     {3,
      [{100, 81000}, {100, 81001}, {150, 50}, {151, 200}],
      65},
     {3, [], 880}];
get_effect_attr({4, 80}) ->
    [{4,
      [{100, 40001},
       {100, 40002},
       {100, 40003},
       {100, 40004},
       {100, 40005},
       {100, 40006},
       {100, 40007}],
      55},
     {4,
      [{100, 81000}, {100, 81001}, {150, 50}, {151, 200}],
      65},
     {4, [], 880}];
get_effect_attr({5, 80}) ->
    [{5,
      [{100, 50001},
       {100, 50002},
       {100, 50003},
       {100, 50004},
       {100, 50005},
       {100, 50006},
       {100, 50007}],
      55},
     {5,
      [{100, 81000}, {100, 81001}, {150, 50}, {151, 200}],
      65},
     {5, [], 880}];
get_effect_attr({21, 80}) ->
    [{6,
      [{100, 69001},
       {100, 69002},
       {100, 69003},
       {100, 69004},
       {100, 69005},
       {100, 69006},
       {100, 69007}],
      55},
     {6,
      [{100, 81000}, {100, 81001}, {150, 50}, {151, 200}],
      65},
     {6, [], 880}];
get_effect_attr({22, 80}) ->
    [{7,
      [{100, 69501},
       {100, 69502},
       {100, 69503},
       {100, 69504},
       {100, 69505},
       {100, 69506},
       {100, 69507}],
      55},
     {7,
      [{100, 81000}, {100, 81001}, {150, 50}, {151, 200}],
      65},
     {7, [], 880}];
get_effect_attr({7, 80}) ->
    [{0,
      [{100, 81003},
       {100, 81004},
       {100, 81005},
       {100, 81006},
       {150, 50},
       {151, 200}],
      100},
     {0, [], 900}];
get_effect_attr({9, 80}) ->
    [{0,
      [{100, 81007},
       {100, 81008},
       {100, 81009},
       {100, 81023},
       {150, 50},
       {151, 200}],
      100},
     {0, [], 900}];
get_effect_attr({10, 80}) ->
    [{0,
      [{100, 81010}, {100, 81011}, {150, 50}, {151, 200}],
      100},
     {0, [], 900}];
get_effect_attr({11, 80}) ->
    [{0,
      [{100, 81012},
       {100, 81013},
       {100, 81021},
       {150, 50},
       {151, 200}],
      80},
     {0, [], 920}];
get_effect_attr({12, 80}) ->
    [{0,
      [{100, 81014},
       {100, 81015},
       {100, 81022},
       {150, 50},
       {151, 200}],
      100},
     {0, [], 900}];
get_effect_attr({14, 80}) ->
    [{0,
      [{100, 81016},
       {100, 81017},
       {100, 81018},
       {150, 50},
       {151, 200}],
      100},
     {0, [], 900}];
get_effect_attr({1, 90}) ->
    [{1,
      [{100, 10001},
       {100, 10002},
       {100, 10003},
       {100, 10004},
       {100, 10005},
       {100, 10006},
       {100, 10007}],
      65},
     {1,
      [{100, 81000}, {100, 81001}, {150, 50}, {151, 200}],
      65},
     {1, [], 870}];
get_effect_attr({6, 90}) ->
    [{1,
      [{100, 10001},
       {100, 10002},
       {100, 10003},
       {100, 10004},
       {100, 10005},
       {100, 10006},
       {100, 10007}],
      65},
     {1, [{100, 81002}, {150, 50}, {151, 200}], 65},
     {1, [], 870},
     {2,
      [{100, 20001},
       {100, 20002},
       {100, 20003},
       {100, 20006},
       {100, 20005},
       {100, 20004},
       {100, 20007}],
      65},
     {2, [{100, 81002}, {150, 50}, {151, 200}], 65},
     {2, [], 870},
     {3,
      [{100, 30001},
       {100, 30002},
       {100, 30003},
       {100, 30004},
       {100, 30005},
       {100, 30006},
       {100, 30007}],
      65},
     {3, [{100, 81002}, {150, 50}, {151, 200}], 65},
     {3, [], 870},
     {4,
      [{100, 40001},
       {100, 40002},
       {100, 40003},
       {100, 40004},
       {100, 40005},
       {100, 40006},
       {100, 40007}],
      65},
     {4, [{100, 81002}, {150, 50}, {151, 200}], 65},
     {4, [], 870},
     {5,
      [{100, 50001},
       {100, 50002},
       {100, 50003},
       {100, 50004},
       {100, 50005},
       {100, 50006},
       {100, 50007}],
      65},
     {5, [{100, 81002}, {150, 50}, {151, 200}], 65},
     {5, [], 870},
     {6,
      [{100, 69001},
       {100, 69002},
       {100, 69003},
       {100, 69004},
       {100, 69005},
       {100, 69006},
       {100, 69007}],
      65},
     {6, [{100, 81002}, {150, 50}, {151, 200}], 65},
     {6, [], 870},
     {7,
      [{100, 69501},
       {100, 69502},
       {100, 69503},
       {100, 69504},
       {100, 69505},
       {100, 69506},
       {100, 69507}],
      65},
     {7, [{100, 81002}, {150, 50}, {151, 200}], 65},
     {7, [], 870}];
get_effect_attr({2, 90}) ->
    [{2,
      [{100, 20001},
       {100, 20002},
       {100, 20003},
       {100, 20006},
       {100, 20005},
       {100, 20004},
       {100, 20007}],
      65},
     {2,
      [{100, 81000}, {100, 81001}, {150, 50}, {151, 200}],
      65},
     {2, [], 870}];
get_effect_attr({3, 90}) ->
    [{3,
      [{100, 30001},
       {100, 30002},
       {100, 30003},
       {100, 30004},
       {100, 30005},
       {100, 30006},
       {100, 30007}],
      65},
     {3,
      [{100, 81000}, {100, 81001}, {150, 50}, {151, 200}],
      65},
     {3, [], 870}];
get_effect_attr({4, 90}) ->
    [{4,
      [{100, 40001},
       {100, 40002},
       {100, 40003},
       {100, 40004},
       {100, 40005},
       {100, 40006},
       {100, 40007}],
      65},
     {4,
      [{100, 81000}, {100, 81001}, {150, 50}, {151, 200}],
      65},
     {4, [], 870}];
get_effect_attr({5, 90}) ->
    [{5,
      [{100, 50001},
       {100, 50002},
       {100, 50003},
       {100, 50004},
       {100, 50005},
       {100, 50006},
       {100, 50007}],
      65},
     {5,
      [{100, 81000}, {100, 81001}, {150, 50}, {151, 200}],
      65},
     {5, [], 870}];
get_effect_attr({21, 90}) ->
    [{6,
      [{100, 69001},
       {100, 69002},
       {100, 69003},
       {100, 69004},
       {100, 69005},
       {100, 69006},
       {100, 69007}],
      65},
     {6,
      [{100, 81000}, {100, 81001}, {150, 50}, {151, 200}],
      65},
     {6, [], 870}];
get_effect_attr({22, 90}) ->
    [{7,
      [{100, 69501},
       {100, 69502},
       {100, 69503},
       {100, 69504},
       {100, 69505},
       {100, 69506},
       {100, 69507}],
      65},
     {7,
      [{100, 81000}, {100, 81001}, {150, 50}, {151, 200}],
      65},
     {7, [], 870}];
get_effect_attr({7, 90}) ->
    [{0,
      [{100, 81003},
       {100, 81004},
       {100, 81005},
       {100, 81006},
       {150, 50},
       {151, 200}],
      70},
     {0, [], 930}];
get_effect_attr({9, 90}) ->
    [{0,
      [{100, 81007},
       {100, 81008},
       {100, 81009},
       {100, 81023},
       {150, 50},
       {151, 200}],
      70},
     {0, [], 930}];
get_effect_attr({10, 90}) ->
    [{0,
      [{100, 81010}, {100, 81011}, {150, 50}, {151, 200}],
      110},
     {0, [], 890}];
get_effect_attr({11, 90}) ->
    [{0,
      [{100, 81012},
       {100, 81013},
       {100, 81021},
       {150, 50},
       {151, 200}],
      90},
     {0, [], 910}];
get_effect_attr({12, 90}) ->
    [{0,
      [{100, 81014},
       {100, 81015},
       {100, 81022},
       {150, 50},
       {151, 200}],
      70},
     {0, [], 930}];
get_effect_attr({14, 90}) ->
    [{0,
      [{100, 81016},
       {100, 81017},
       {100, 81018},
       {150, 50},
       {151, 200}],
      70},
     {0, [], 930}];
get_effect_attr({1, 100}) ->
    [{1,
      [{100, 10001},
       {100, 10002},
       {100, 10003},
       {100, 10004},
       {100, 10005},
       {100, 10006},
       {100, 10007}],
      65},
     {1,
      [{100, 81000}, {100, 81001}, {150, 50}, {151, 200}],
      65},
     {1, [], 870}];
get_effect_attr({6, 100}) ->
    [{1,
      [{100, 10001},
       {100, 10002},
       {100, 10003},
       {100, 10004},
       {100, 10005},
       {100, 10006},
       {100, 10007}],
      65},
     {1, [{100, 81002}, {150, 50}, {151, 200}], 65},
     {1, [], 870},
     {2,
      [{100, 20001},
       {100, 20002},
       {100, 20003},
       {100, 20006},
       {100, 20005},
       {100, 20004},
       {100, 20007}],
      65},
     {2, [{100, 81002}, {150, 50}, {151, 200}], 65},
     {2, [], 870},
     {3,
      [{100, 30001},
       {100, 30002},
       {100, 30003},
       {100, 30004},
       {100, 30005},
       {100, 30006},
       {100, 30007}],
      65},
     {3, [{100, 81002}, {150, 50}, {151, 200}], 65},
     {3, [], 870},
     {4,
      [{100, 40001},
       {100, 40002},
       {100, 40003},
       {100, 40004},
       {100, 40005},
       {100, 40006},
       {100, 40007}],
      65},
     {4, [{100, 81002}, {150, 50}, {151, 200}], 65},
     {4, [], 870},
     {5,
      [{100, 50001},
       {100, 50002},
       {100, 50003},
       {100, 50004},
       {100, 50005},
       {100, 50006},
       {100, 50007}],
      65},
     {5, [{100, 81002}, {150, 50}, {151, 200}], 65},
     {5, [], 870},
     {6,
      [{100, 69001},
       {100, 69002},
       {100, 69003},
       {100, 69004},
       {100, 69005},
       {100, 69006},
       {100, 69007}],
      65},
     {6, [{100, 81002}, {150, 50}, {151, 200}], 65},
     {6, [], 870},
     {7,
      [{100, 69501},
       {100, 69502},
       {100, 69503},
       {100, 69504},
       {100, 69505},
       {100, 69506},
       {100, 69507}],
      65},
     {7, [{100, 81002}, {150, 50}, {151, 200}], 65},
     {7, [], 870}];
get_effect_attr({2, 100}) ->
    [{2,
      [{100, 20001},
       {100, 20002},
       {100, 20003},
       {100, 20006},
       {100, 20005},
       {100, 20004},
       {100, 20007}],
      65},
     {2,
      [{100, 81000}, {100, 81001}, {150, 50}, {151, 200}],
      65},
     {2, [], 870}];
get_effect_attr({3, 100}) ->
    [{3,
      [{100, 30001},
       {100, 30002},
       {100, 30003},
       {100, 30004},
       {100, 30005},
       {100, 30006},
       {100, 30007}],
      65},
     {3,
      [{100, 81000}, {100, 81001}, {150, 50}, {151, 200}],
      65},
     {3, [], 870}];
get_effect_attr({4, 100}) ->
    [{4,
      [{100, 40001},
       {100, 40002},
       {100, 40003},
       {100, 40004},
       {100, 40005},
       {100, 40006},
       {100, 40007}],
      65},
     {4,
      [{100, 81000}, {100, 81001}, {150, 50}, {151, 200}],
      65},
     {4, [], 870}];
get_effect_attr({5, 100}) ->
    [{5,
      [{100, 50001},
       {100, 50002},
       {100, 50003},
       {100, 50004},
       {100, 50005},
       {100, 50006},
       {100, 50007}],
      65},
     {5,
      [{100, 81000}, {100, 81001}, {150, 50}, {151, 200}],
      65},
     {5, [], 870}];
get_effect_attr({21, 100}) ->
    [{6,
      [{100, 69001},
       {100, 69002},
       {100, 69003},
       {100, 69004},
       {100, 69005},
       {100, 69006},
       {100, 69007}],
      65},
     {6,
      [{100, 81000}, {100, 81001}, {150, 50}, {151, 200}],
      65},
     {6, [], 870}];
get_effect_attr({22, 100}) ->
    [{7,
      [{100, 69501},
       {100, 69502},
       {100, 69503},
       {100, 69504},
       {100, 69505},
       {100, 69506},
       {100, 69507}],
      65},
     {7,
      [{100, 81000}, {100, 81001}, {150, 50}, {151, 200}],
      65},
     {7, [], 870}];
get_effect_attr({7, 100}) ->
    [{0,
      [{100, 81003},
       {100, 81004},
       {100, 81005},
       {100, 81006},
       {150, 50},
       {151, 200}],
      70},
     {0, [], 930}];
get_effect_attr({9, 100}) ->
    [{0,
      [{100, 81007},
       {100, 81008},
       {100, 81009},
       {100, 81023},
       {150, 50},
       {151, 200}],
      70},
     {0, [], 930}];
get_effect_attr({10, 100}) ->
    [{0,
      [{100, 81010}, {100, 81011}, {150, 50}, {151, 200}],
      110},
     {0, [], 890}];
get_effect_attr({11, 100}) ->
    [{0,
      [{100, 81012},
       {100, 81013},
       {100, 81021},
       {150, 50},
       {151, 200}],
      110},
     {0, [], 890}];
get_effect_attr({12, 100}) ->
    [{0,
      [{100, 81014},
       {100, 81015},
       {100, 81022},
       {150, 50},
       {151, 200}],
      70},
     {0, [], 930}];
get_effect_attr({14, 100}) ->
    [{0,
      [{100, 81016},
       {100, 81017},
       {100, 81018},
       {150, 50},
       {151, 200}],
      70},
     {0, [], 930}];
get_effect_attr({1, 110}) ->
    [{1,
      [{100, 10001},
       {100, 10002},
       {100, 10003},
       {100, 10004},
       {100, 10005},
       {100, 10006},
       {100, 10007}],
      50},
     {1,
      [{100, 81000}, {100, 81001}, {150, 50}, {151, 200}],
      50},
     {1, [], 900}];
get_effect_attr({6, 110}) ->
    [{1,
      [{100, 10001},
       {100, 10002},
       {100, 10003},
       {100, 10004},
       {100, 10005},
       {100, 10006},
       {100, 10007}],
      50},
     {1, [{100, 81002}, {150, 50}, {151, 200}], 50},
     {1, [], 900},
     {2,
      [{100, 20001},
       {100, 20002},
       {100, 20003},
       {100, 20006},
       {100, 20005},
       {100, 20004},
       {100, 20007}],
      50},
     {2, [{100, 81002}, {150, 50}, {151, 200}], 50},
     {2, [], 900},
     {3,
      [{100, 30001},
       {100, 30002},
       {100, 30003},
       {100, 30004},
       {100, 30005},
       {100, 30006},
       {100, 30007}],
      50},
     {3, [{100, 81002}, {150, 50}, {151, 200}], 50},
     {3, [], 900},
     {4,
      [{100, 40001},
       {100, 40002},
       {100, 40003},
       {100, 40004},
       {100, 40005},
       {100, 40006},
       {100, 40007}],
      50},
     {4, [{100, 81002}, {150, 50}, {151, 200}], 50},
     {4, [], 900},
     {5,
      [{100, 50001},
       {100, 50002},
       {100, 50003},
       {100, 50004},
       {100, 50005},
       {100, 50006},
       {100, 50007}],
      50},
     {5, [{100, 81002}, {150, 50}, {151, 200}], 50},
     {5, [], 900},
     {6,
      [{100, 69001},
       {100, 69002},
       {100, 69003},
       {100, 69004},
       {100, 69005},
       {100, 69006},
       {100, 69007}],
      50},
     {6, [{100, 81002}, {150, 50}, {151, 200}], 50},
     {6, [], 900},
     {7,
      [{100, 69501},
       {100, 69502},
       {100, 69503},
       {100, 69504},
       {100, 69505},
       {100, 69506},
       {100, 69507}],
      50},
     {7, [{100, 81002}, {150, 50}, {151, 200}], 50},
     {7, [], 900}];
get_effect_attr({2, 110}) ->
    [{2,
      [{100, 20001},
       {100, 20002},
       {100, 20003},
       {100, 20006},
       {100, 20005},
       {100, 20004},
       {100, 20007}],
      50},
     {2,
      [{100, 81000}, {100, 81001}, {150, 50}, {151, 200}],
      50},
     {2, [], 900}];
get_effect_attr({3, 110}) ->
    [{3,
      [{100, 30001},
       {100, 30002},
       {100, 30003},
       {100, 30004},
       {100, 30005},
       {100, 30006},
       {100, 30007}],
      50},
     {3,
      [{100, 81000}, {100, 81001}, {150, 50}, {151, 200}],
      50},
     {3, [], 900}];
get_effect_attr({4, 110}) ->
    [{4,
      [{100, 40001},
       {100, 40002},
       {100, 40003},
       {100, 40004},
       {100, 40005},
       {100, 40006},
       {100, 40007}],
      50},
     {4,
      [{100, 81000}, {100, 81001}, {150, 50}, {151, 200}],
      50},
     {4, [], 900}];
get_effect_attr({5, 110}) ->
    [{5,
      [{100, 50001},
       {100, 50002},
       {100, 50003},
       {100, 50004},
       {100, 50005},
       {100, 50006},
       {100, 50007}],
      50},
     {5,
      [{100, 81000}, {100, 81001}, {150, 50}, {151, 200}],
      50},
     {5, [], 900}];
get_effect_attr({21, 110}) ->
    [{6,
      [{100, 69001},
       {100, 69002},
       {100, 69003},
       {100, 69004},
       {100, 69005},
       {100, 69006},
       {100, 69007}],
      50},
     {6,
      [{100, 81000}, {100, 81001}, {150, 50}, {151, 200}],
      50},
     {6, [], 900}];
get_effect_attr({22, 110}) ->
    [{7,
      [{100, 69501},
       {100, 69502},
       {100, 69503},
       {100, 69504},
       {100, 69505},
       {100, 69506},
       {100, 69507}],
      50},
     {7,
      [{100, 81000}, {100, 81001}, {150, 50}, {151, 200}],
      50},
     {7, [], 900}];
get_effect_attr({7, 110}) ->
    [{0,
      [{100, 81003},
       {100, 81004},
       {100, 81005},
       {100, 81006},
       {150, 50},
       {151, 200}],
      60},
     {0, [], 940}];
get_effect_attr({9, 110}) ->
    [{0,
      [{100, 81007},
       {100, 81008},
       {100, 81009},
       {100, 81023},
       {150, 50},
       {151, 200}],
      60},
     {0, [], 940}];
get_effect_attr({10, 110}) ->
    [{0,
      [{100, 81010}, {100, 81011}, {150, 50}, {151, 200}],
      100},
     {0, [], 900}];
get_effect_attr({11, 110}) ->
    [{0,
      [{100, 81012},
       {100, 81013},
       {100, 81021},
       {150, 50},
       {151, 200}],
      100},
     {0, [], 900}];
get_effect_attr({12, 110}) ->
    [{0,
      [{100, 81014},
       {100, 81015},
       {100, 81022},
       {150, 50},
       {151, 200}],
      60},
     {0, [], 940}];
get_effect_attr({14, 110}) ->
    [{0,
      [{100, 81016},
       {100, 81017},
       {100, 81018},
       {150, 50},
       {151, 200}],
      60},
     {0, [], 940}];
get_effect_attr({1, 120}) ->
    [{1,
      [{100, 10001},
       {100, 10002},
       {100, 10003},
       {100, 10004},
       {100, 10005},
       {100, 10006},
       {100, 10007}],
      50},
     {1,
      [{100, 81000}, {100, 81001}, {150, 50}, {151, 200}],
      50},
     {1, [], 900}];
get_effect_attr({6, 120}) ->
    [{1,
      [{100, 10001},
       {100, 10002},
       {100, 10003},
       {100, 10004},
       {100, 10005},
       {100, 10006},
       {100, 10007}],
      50},
     {1, [{100, 81002}, {150, 50}, {151, 200}], 50},
     {1, [], 900},
     {2,
      [{100, 20001},
       {100, 20002},
       {100, 20003},
       {100, 20006},
       {100, 20005},
       {100, 20004},
       {100, 20007}],
      50},
     {2, [{100, 81002}, {150, 50}, {151, 200}], 50},
     {2, [], 900},
     {3,
      [{100, 30001},
       {100, 30002},
       {100, 30003},
       {100, 30004},
       {100, 30005},
       {100, 30006},
       {100, 30007}],
      50},
     {3, [{100, 81002}, {150, 50}, {151, 200}], 50},
     {3, [], 900},
     {4,
      [{100, 40001},
       {100, 40002},
       {100, 40003},
       {100, 40004},
       {100, 40005},
       {100, 40006},
       {100, 40007}],
      50},
     {4, [{100, 81002}, {150, 50}, {151, 200}], 50},
     {4, [], 900},
     {5,
      [{100, 50001},
       {100, 50002},
       {100, 50003},
       {100, 50004},
       {100, 50005},
       {100, 50006},
       {100, 50007}],
      50},
     {5, [{100, 81002}, {150, 50}, {151, 200}], 50},
     {5, [], 900},
     {6,
      [{100, 69001},
       {100, 69002},
       {100, 69003},
       {100, 69004},
       {100, 69005},
       {100, 69006},
       {100, 69007}],
      50},
     {6, [{100, 81002}, {150, 50}, {151, 200}], 50},
     {6, [], 900},
     {7,
      [{100, 69501},
       {100, 69502},
       {100, 69503},
       {100, 69504},
       {100, 69505},
       {100, 69506},
       {100, 69507}],
      50},
     {7, [{100, 81002}, {150, 50}, {151, 200}], 50},
     {7, [], 900}];
get_effect_attr({2, 120}) ->
    [{2,
      [{100, 20001},
       {100, 20002},
       {100, 20003},
       {100, 20006},
       {100, 20005},
       {100, 20004},
       {100, 20007}],
      50},
     {2,
      [{100, 81000}, {100, 81001}, {150, 50}, {151, 200}],
      50},
     {2, [], 900}];
get_effect_attr({3, 120}) ->
    [{3,
      [{100, 30001},
       {100, 30002},
       {100, 30003},
       {100, 30004},
       {100, 30005},
       {100, 30006},
       {100, 30007}],
      50},
     {3,
      [{100, 81000}, {100, 81001}, {150, 50}, {151, 200}],
      50},
     {3, [], 900}];
get_effect_attr({4, 120}) ->
    [{4,
      [{100, 40001},
       {100, 40002},
       {100, 40003},
       {100, 40004},
       {100, 40005},
       {100, 40006},
       {100, 40007}],
      50},
     {4,
      [{100, 81000}, {100, 81001}, {150, 50}, {151, 200}],
      50},
     {4, [], 900}];
get_effect_attr({5, 120}) ->
    [{5,
      [{100, 50001},
       {100, 50002},
       {100, 50003},
       {100, 50004},
       {100, 50005},
       {100, 50006},
       {100, 50007}],
      50},
     {5,
      [{100, 81000}, {100, 81001}, {150, 50}, {151, 200}],
      50},
     {5, [], 900}];
get_effect_attr({21, 120}) ->
    [{6,
      [{100, 69001},
       {100, 69002},
       {100, 69003},
       {100, 69004},
       {100, 69005},
       {100, 69006},
       {100, 69007}],
      50},
     {6,
      [{100, 81000}, {100, 81001}, {150, 50}, {151, 200}],
      50},
     {6, [], 900}];
get_effect_attr({22, 120}) ->
    [{7,
      [{100, 69501},
       {100, 69502},
       {100, 69503},
       {100, 69504},
       {100, 69505},
       {100, 69506},
       {100, 69507}],
      50},
     {7,
      [{100, 81000}, {100, 81001}, {150, 50}, {151, 200}],
      50},
     {7, [], 900}];
get_effect_attr({7, 120}) ->
    [{0,
      [{100, 81003},
       {100, 81004},
       {100, 81005},
       {100, 81006},
       {150, 50},
       {151, 200}],
      60},
     {0, [], 940}];
get_effect_attr({9, 120}) ->
    [{0,
      [{100, 81007},
       {100, 81008},
       {100, 81009},
       {100, 81023},
       {150, 50},
       {151, 200}],
      60},
     {0, [], 940}];
get_effect_attr({10, 120}) ->
    [{0,
      [{100, 81010}, {100, 81011}, {150, 50}, {151, 200}],
      100},
     {0, [], 900}];
get_effect_attr({11, 120}) ->
    [{0,
      [{100, 81012},
       {100, 81013},
       {100, 81021},
       {150, 50},
       {151, 200}],
      100},
     {0, [], 900}];
get_effect_attr({12, 120}) ->
    [{0,
      [{100, 81014},
       {100, 81015},
       {100, 81022},
       {150, 50},
       {151, 200}],
      60},
     {0, [], 940}];
get_effect_attr({14, 120}) ->
    [{0,
      [{100, 81016},
       {100, 81017},
       {100, 81018},
       {150, 50},
       {151, 200}],
      60},
     {0, [], 940}];
get_effect_attr(_) -> [].

get_effect_skill({7, 90}) ->
    [{0, [{100, 88014}], 20},
     {0, [{100, 88026}], 20},
     {0, [{100, 88033}], 20},
     {0, [{100, 88018}], 20},
     {0, [{100, 88007}], 20},
     {0, [{100, 88020}], 20},
     {0, [], 880}];
get_effect_skill({9, 90}) ->
    [{0, [{100, 88009}], 20},
     {0, [{100, 88025}], 15},
     {0, [{100, 88005}], 20},
     {0, [{100, 88034}], 15},
     {0, [{100, 88006}], 20},
     {0, [{100, 88012}], 15},
     {0, [{100, 88007}], 15},
     {0, [], 880}];
get_effect_skill({12, 90}) ->
    [{0, [{100, 88021}], 20},
     {0, [{100, 88032}], 20},
     {0, [{100, 88016}], 20},
     {0, [{100, 88003}], 20},
     {0, [{100, 88202}], 20},
     {0, [{100, 88203}], 20},
     {0, [], 880}];
get_effect_skill({14, 90}) ->
    [{0, [{100, 88018}], 20},
     {0, [{100, 88004}], 20},
     {0, [{100, 88027}], 20},
     {0, [{100, 88200}], 20},
     {0, [{100, 88201}], 20},
     {0, [{100, 88019}], 20},
     {0, [], 880}];
get_effect_skill({7, 100}) ->
    [{0, [{100, 88014}], 20},
     {0, [{100, 88026}], 20},
     {0, [{100, 88033}], 20},
     {0, [{100, 88018}], 20},
     {0, [{100, 88007}], 20},
     {0, [{100, 88020}], 20},
     {0, [], 880}];
get_effect_skill({9, 100}) ->
    [{0, [{100, 88009}], 20},
     {0, [{100, 88025}], 15},
     {0, [{100, 88005}], 20},
     {0, [{100, 88034}], 15},
     {0, [{100, 88006}], 20},
     {0, [{100, 88012}], 15},
     {0, [{100, 88007}], 15},
     {0, [], 880}];
get_effect_skill({12, 100}) ->
    [{0, [{100, 88021}], 20},
     {0, [{100, 88032}], 20},
     {0, [{100, 88016}], 20},
     {0, [{100, 88003}], 20},
     {0, [{100, 88202}], 20},
     {0, [{100, 88203}], 20},
     {0, [], 880}];
get_effect_skill({14, 100}) ->
    [{0, [{100, 88018}], 20},
     {0, [{100, 88004}], 20},
     {0, [{100, 88027}], 20},
     {0, [{100, 88200}], 20},
     {0, [{100, 88201}], 20},
     {0, [{100, 88019}], 20},
     {0, [], 880}];
get_effect_skill({7, 110}) ->
    [{0, [{100, 88014}], 20},
     {0, [{100, 88026}], 20},
     {0, [{100, 88033}], 20},
     {0, [{100, 88018}], 20},
     {0, [{100, 88007}], 20},
     {0, [{100, 88020}], 20},
     {0, [], 880}];
get_effect_skill({9, 110}) ->
    [{0, [{100, 88009}], 20},
     {0, [{100, 88025}], 15},
     {0, [{100, 88005}], 20},
     {0, [{100, 88034}], 15},
     {0, [{100, 88006}], 20},
     {0, [{100, 88012}], 15},
     {0, [{100, 88007}], 15},
     {0, [], 880}];
get_effect_skill({12, 110}) ->
    [{0, [{100, 88021}], 20},
     {0, [{100, 88032}], 20},
     {0, [{100, 88016}], 20},
     {0, [{100, 88003}], 20},
     {0, [{100, 88202}], 20},
     {0, [{100, 88203}], 20},
     {0, [], 880}];
get_effect_skill({14, 110}) ->
    [{0, [{100, 88018}], 20},
     {0, [{100, 88004}], 20},
     {0, [{100, 88027}], 20},
     {0, [{100, 88200}], 20},
     {0, [{100, 88201}], 20},
     {0, [{100, 88019}], 20},
     {0, [], 880}];
get_effect_skill({7, 120}) ->
    [{0, [{100, 88014}], 20},
     {0, [{100, 88026}], 20},
     {0, [{100, 88033}], 20},
     {0, [{100, 88018}], 20},
     {0, [{100, 88007}], 20},
     {0, [{100, 88020}], 20},
     {0, [], 880}];
get_effect_skill({9, 120}) ->
    [{0, [{100, 88009}], 20},
     {0, [{100, 88025}], 15},
     {0, [{100, 88005}], 20},
     {0, [{100, 88034}], 15},
     {0, [{100, 88006}], 20},
     {0, [{100, 88012}], 15},
     {0, [{100, 88007}], 15},
     {0, [], 880}];
get_effect_skill({12, 120}) ->
    [{0, [{100, 88021}], 20},
     {0, [{100, 88032}], 20},
     {0, [{100, 88016}], 20},
     {0, [{100, 88003}], 20},
     {0, [{100, 88202}], 20},
     {0, [{100, 88203}], 20},
     {0, [], 880}];
get_effect_skill({14, 120}) ->
    [{0, [{100, 88018}], 20},
     {0, [{100, 88004}], 20},
     {0, [{100, 88027}], 20},
     {0, [{100, 88200}], 20},
     {0, [{100, 88201}], 20},
     {0, [{100, 88019}], 20},
     {0, [], 880}];
get_effect_skill(_) -> [].

enchant_award({1, Lev}) when Lev >= 15 ->
    {15, [{54, 30}]};
enchant_award({1, Lev}) when Lev >= 14 ->
    {14, [{54, 30}]};
enchant_award({1, Lev}) when Lev >= 13 ->
    {13, [{54, 30}]};
enchant_award({1, Lev}) when Lev >= 12 ->
    {12, [{54, 30}]};
enchant_award({1, Lev}) when Lev >= 11 ->
    {11, [{54, 25}]};
enchant_award({1, Lev}) when Lev >= 10 ->
    {10, [{54, 20}]};
enchant_award({1, Lev}) when Lev >= 9 ->
    {9, [{54, 16}]};
enchant_award({1, Lev}) when Lev >= 8 ->
    {8, [{54, 13}]};
enchant_award({1, Lev}) when Lev >= 7 ->
    {7, [{54, 10}]};
enchant_award({4, Lev}) when Lev >= 15 ->
    {15, [{54, 30}]};
enchant_award({4, Lev}) when Lev >= 14 ->
    {14, [{54, 30}]};
enchant_award({4, Lev}) when Lev >= 13 ->
    {13, [{54, 30}]};
enchant_award({4, Lev}) when Lev >= 12 ->
    {12, [{54, 30}]};
enchant_award({4, Lev}) when Lev >= 11 ->
    {11, [{54, 25}]};
enchant_award({4, Lev}) when Lev >= 10 ->
    {10, [{54, 20}]};
enchant_award({4, Lev}) when Lev >= 9 ->
    {9, [{54, 16}]};
enchant_award({4, Lev}) when Lev >= 8 ->
    {8, [{54, 13}]};
enchant_award({4, Lev}) when Lev >= 7 ->
    {7, [{54, 10}]};
enchant_award({3, Lev}) when Lev >= 15 ->
    {15, [{54, 30}]};
enchant_award({3, Lev}) when Lev >= 14 ->
    {14, [{54, 30}]};
enchant_award({3, Lev}) when Lev >= 13 ->
    {13, [{54, 30}]};
enchant_award({3, Lev}) when Lev >= 12 ->
    {12, [{54, 30}]};
enchant_award({3, Lev}) when Lev >= 11 ->
    {11, [{54, 25}]};
enchant_award({3, Lev}) when Lev >= 10 ->
    {10, [{54, 20}]};
enchant_award({3, Lev}) when Lev >= 9 ->
    {9, [{54, 16}]};
enchant_award({3, Lev}) when Lev >= 8 ->
    {8, [{54, 13}]};
enchant_award({3, Lev}) when Lev >= 7 ->
    {7, [{54, 10}]};
enchant_award({2, Lev}) when Lev >= 15 ->
    {15, [{55, 30}]};
enchant_award({2, Lev}) when Lev >= 14 ->
    {14, [{55, 30}]};
enchant_award({2, Lev}) when Lev >= 13 ->
    {13, [{55, 30}]};
enchant_award({2, Lev}) when Lev >= 12 ->
    {12, [{55, 30}]};
enchant_award({2, Lev}) when Lev >= 11 ->
    {11, [{55, 25}]};
enchant_award({2, Lev}) when Lev >= 10 ->
    {10, [{55, 20}]};
enchant_award({2, Lev}) when Lev >= 9 ->
    {9, [{55, 16}]};
enchant_award({2, Lev}) when Lev >= 8 ->
    {8, [{55, 13}]};
enchant_award({2, Lev}) when Lev >= 7 ->
    {7, [{55, 10}]};
enchant_award({5, Lev}) when Lev >= 15 ->
    {15, [{33, 30}]};
enchant_award({5, Lev}) when Lev >= 14 ->
    {14, [{33, 30}]};
enchant_award({5, Lev}) when Lev >= 13 ->
    {13, [{33, 30}]};
enchant_award({5, Lev}) when Lev >= 12 ->
    {12, [{33, 30}]};
enchant_award({5, Lev}) when Lev >= 11 ->
    {11, [{33, 25}]};
enchant_award({5, Lev}) when Lev >= 10 ->
    {10, [{33, 20}]};
enchant_award({5, Lev}) when Lev >= 9 ->
    {9, [{33, 16}]};
enchant_award({5, Lev}) when Lev >= 8 ->
    {8, [{33, 13}]};
enchant_award({5, Lev}) when Lev >= 7 ->
    {7, [{33, 10}]};
enchant_award({21, Lev}) when Lev >= 15 ->
    {15, [{55, 30}]};
enchant_award({21, Lev}) when Lev >= 14 ->
    {14, [{55, 30}]};
enchant_award({21, Lev}) when Lev >= 13 ->
    {13, [{55, 30}]};
enchant_award({21, Lev}) when Lev >= 12 ->
    {12, [{55, 30}]};
enchant_award({21, Lev}) when Lev >= 11 ->
    {11, [{55, 25}]};
enchant_award({21, Lev}) when Lev >= 10 ->
    {10, [{55, 20}]};
enchant_award({21, Lev}) when Lev >= 9 ->
    {9, [{55, 16}]};
enchant_award({21, Lev}) when Lev >= 8 ->
    {8, [{55, 13}]};
enchant_award({21, Lev}) when Lev >= 7 ->
    {7, [{55, 10}]};
enchant_award({22, Lev}) when Lev >= 15 ->
    {15, [{54, 30}]};
enchant_award({22, Lev}) when Lev >= 14 ->
    {14, [{54, 30}]};
enchant_award({22, Lev}) when Lev >= 13 ->
    {13, [{54, 30}]};
enchant_award({22, Lev}) when Lev >= 12 ->
    {12, [{54, 30}]};
enchant_award({22, Lev}) when Lev >= 11 ->
    {11, [{54, 25}]};
enchant_award({22, Lev}) when Lev >= 10 ->
    {10, [{54, 20}]};
enchant_award({22, Lev}) when Lev >= 9 ->
    {9, [{54, 16}]};
enchant_award({22, Lev}) when Lev >= 8 ->
    {8, [{54, 13}]};
enchant_award({22, Lev}) when Lev >= 7 ->
    {7, [{54, 10}]};
enchant_award({10, Lev}) when Lev >= 15 ->
    {15, [{56, 30}]};
enchant_award({10, Lev}) when Lev >= 14 ->
    {14, [{56, 30}]};
enchant_award({10, Lev}) when Lev >= 13 ->
    {13, [{56, 30}]};
enchant_award({10, Lev}) when Lev >= 12 ->
    {12, [{56, 30}]};
enchant_award({10, Lev}) when Lev >= 11 ->
    {11, [{56, 25}]};
enchant_award({10, Lev}) when Lev >= 10 ->
    {10, [{56, 20}]};
enchant_award({10, Lev}) when Lev >= 9 ->
    {9, [{56, 16}]};
enchant_award({10, Lev}) when Lev >= 8 ->
    {8, [{56, 13}]};
enchant_award({10, Lev}) when Lev >= 7 ->
    {7, [{56, 10}]};
enchant_award({12, Lev}) when Lev >= 15 ->
    {15, [{57, 30}]};
enchant_award({12, Lev}) when Lev >= 14 ->
    {14, [{57, 30}]};
enchant_award({12, Lev}) when Lev >= 13 ->
    {13, [{57, 30}]};
enchant_award({12, Lev}) when Lev >= 12 ->
    {12, [{57, 30}]};
enchant_award({12, Lev}) when Lev >= 11 ->
    {11, [{57, 25}]};
enchant_award({12, Lev}) when Lev >= 10 ->
    {10, [{57, 20}]};
enchant_award({12, Lev}) when Lev >= 9 ->
    {9, [{57, 16}]};
enchant_award({12, Lev}) when Lev >= 8 ->
    {8, [{57, 13}]};
enchant_award({12, Lev}) when Lev >= 7 ->
    {7, [{57, 10}]};
enchant_award(_) -> {0, []}.

get_eqm_id({1, 1, 1}) -> 10001;
get_eqm_id({1, 10, 1}) -> 10002;
get_eqm_id({1, 11, 1}) -> 10003;
get_eqm_id({1, 12, 1}) -> 10004;
get_eqm_id({1, 14, 1}) -> 10006;
get_eqm_id({1, 1, 10}) -> 10011;
get_eqm_id({1, 10, 10}) -> 10012;
get_eqm_id({1, 11, 10}) -> 10013;
get_eqm_id({1, 12, 10}) -> 10014;
get_eqm_id({1, 14, 10}) -> 10016;
get_eqm_id({1, 1, 20}) -> 10021;
get_eqm_id({1, 10, 20}) -> 10022;
get_eqm_id({1, 11, 20}) -> 10023;
get_eqm_id({1, 12, 20}) -> 10024;
get_eqm_id({1, 14, 20}) -> 10026;
get_eqm_id({1, 1, 30}) -> 10031;
get_eqm_id({1, 10, 30}) -> 10032;
get_eqm_id({1, 11, 30}) -> 10033;
get_eqm_id({1, 12, 30}) -> 10034;
get_eqm_id({1, 14, 30}) -> 10036;
get_eqm_id({1, 1, 40}) -> 10041;
get_eqm_id({1, 10, 40}) -> 10042;
get_eqm_id({1, 11, 40}) -> 10043;
get_eqm_id({1, 12, 40}) -> 10044;
get_eqm_id({1, 14, 40}) -> 10046;
get_eqm_id({1, 1, 50}) -> 10051;
get_eqm_id({1, 10, 50}) -> 10052;
get_eqm_id({1, 11, 50}) -> 10053;
get_eqm_id({1, 12, 50}) -> 10054;
get_eqm_id({1, 14, 50}) -> 10056;
get_eqm_id({1, 1, 60}) -> 10061;
get_eqm_id({1, 10, 60}) -> 10062;
get_eqm_id({1, 11, 60}) -> 10063;
get_eqm_id({1, 12, 60}) -> 10064;
get_eqm_id({1, 14, 60}) -> 10066;
get_eqm_id({1, 1, 70}) -> 10071;
get_eqm_id({1, 10, 70}) -> 10072;
get_eqm_id({1, 11, 70}) -> 10073;
get_eqm_id({1, 12, 70}) -> 10074;
get_eqm_id({1, 14, 70}) -> 10076;
get_eqm_id({1, 1, 80}) -> 10081;
get_eqm_id({1, 10, 80}) -> 10082;
get_eqm_id({1, 11, 80}) -> 10083;
get_eqm_id({1, 12, 80}) -> 10084;
get_eqm_id({1, 14, 80}) -> 10086;
get_eqm_id({1, 1, 90}) -> 10091;
get_eqm_id({1, 10, 90}) -> 10092;
get_eqm_id({1, 11, 90}) -> 10093;
get_eqm_id({1, 12, 90}) -> 10094;
get_eqm_id({1, 14, 90}) -> 10096;
get_eqm_id({2, 2, 1}) -> 10101;
get_eqm_id({2, 10, 1}) -> 10102;
get_eqm_id({2, 11, 1}) -> 10103;
get_eqm_id({2, 12, 1}) -> 10104;
get_eqm_id({2, 14, 1}) -> 10106;
get_eqm_id({2, 2, 10}) -> 10111;
get_eqm_id({2, 10, 10}) -> 10112;
get_eqm_id({2, 11, 10}) -> 10113;
get_eqm_id({2, 12, 10}) -> 10114;
get_eqm_id({2, 14, 10}) -> 10116;
get_eqm_id({2, 2, 20}) -> 10121;
get_eqm_id({2, 10, 20}) -> 10122;
get_eqm_id({2, 11, 20}) -> 10123;
get_eqm_id({2, 12, 20}) -> 10124;
get_eqm_id({2, 14, 20}) -> 10126;
get_eqm_id({2, 2, 30}) -> 10131;
get_eqm_id({2, 10, 30}) -> 10132;
get_eqm_id({2, 11, 30}) -> 10133;
get_eqm_id({2, 12, 30}) -> 10134;
get_eqm_id({2, 14, 30}) -> 10136;
get_eqm_id({2, 2, 40}) -> 10141;
get_eqm_id({2, 10, 40}) -> 10142;
get_eqm_id({2, 11, 40}) -> 10143;
get_eqm_id({2, 12, 40}) -> 10144;
get_eqm_id({2, 14, 40}) -> 10146;
get_eqm_id({2, 2, 50}) -> 10151;
get_eqm_id({2, 10, 50}) -> 10152;
get_eqm_id({2, 11, 50}) -> 10153;
get_eqm_id({2, 12, 50}) -> 10154;
get_eqm_id({2, 14, 50}) -> 10156;
get_eqm_id({2, 2, 60}) -> 10161;
get_eqm_id({2, 10, 60}) -> 10162;
get_eqm_id({2, 11, 60}) -> 10163;
get_eqm_id({2, 12, 60}) -> 10164;
get_eqm_id({2, 14, 60}) -> 10166;
get_eqm_id({2, 2, 70}) -> 10171;
get_eqm_id({2, 10, 70}) -> 10172;
get_eqm_id({2, 11, 70}) -> 10173;
get_eqm_id({2, 12, 70}) -> 10174;
get_eqm_id({2, 14, 70}) -> 10176;
get_eqm_id({2, 2, 80}) -> 10181;
get_eqm_id({2, 10, 80}) -> 10182;
get_eqm_id({2, 11, 80}) -> 10183;
get_eqm_id({2, 12, 80}) -> 10184;
get_eqm_id({2, 14, 80}) -> 10186;
get_eqm_id({2, 2, 90}) -> 10191;
get_eqm_id({2, 10, 90}) -> 10192;
get_eqm_id({2, 11, 90}) -> 10193;
get_eqm_id({2, 12, 90}) -> 10194;
get_eqm_id({2, 14, 90}) -> 10196;
get_eqm_id({3, 3, 1}) -> 10201;
get_eqm_id({3, 10, 1}) -> 10202;
get_eqm_id({3, 11, 1}) -> 10203;
get_eqm_id({3, 12, 1}) -> 10204;
get_eqm_id({3, 14, 1}) -> 10206;
get_eqm_id({3, 3, 10}) -> 10211;
get_eqm_id({3, 10, 10}) -> 10212;
get_eqm_id({3, 11, 10}) -> 10213;
get_eqm_id({3, 12, 10}) -> 10214;
get_eqm_id({3, 14, 10}) -> 10216;
get_eqm_id({3, 3, 20}) -> 10221;
get_eqm_id({3, 10, 20}) -> 10222;
get_eqm_id({3, 11, 20}) -> 10223;
get_eqm_id({3, 12, 20}) -> 10224;
get_eqm_id({3, 14, 20}) -> 10226;
get_eqm_id({3, 3, 30}) -> 10231;
get_eqm_id({3, 10, 30}) -> 10232;
get_eqm_id({3, 11, 30}) -> 10233;
get_eqm_id({3, 12, 30}) -> 10234;
get_eqm_id({3, 14, 30}) -> 10236;
get_eqm_id({3, 3, 40}) -> 10241;
get_eqm_id({3, 10, 40}) -> 10242;
get_eqm_id({3, 11, 40}) -> 10243;
get_eqm_id({3, 12, 40}) -> 10244;
get_eqm_id({3, 14, 40}) -> 10246;
get_eqm_id({3, 3, 50}) -> 10251;
get_eqm_id({3, 10, 50}) -> 10252;
get_eqm_id({3, 11, 50}) -> 10253;
get_eqm_id({3, 12, 50}) -> 10254;
get_eqm_id({3, 14, 50}) -> 10256;
get_eqm_id({3, 3, 60}) -> 10261;
get_eqm_id({3, 10, 60}) -> 10262;
get_eqm_id({3, 11, 60}) -> 10263;
get_eqm_id({3, 12, 60}) -> 10264;
get_eqm_id({3, 14, 60}) -> 10266;
get_eqm_id({3, 3, 70}) -> 10271;
get_eqm_id({3, 10, 70}) -> 10272;
get_eqm_id({3, 11, 70}) -> 10273;
get_eqm_id({3, 12, 70}) -> 10274;
get_eqm_id({3, 14, 70}) -> 10276;
get_eqm_id({3, 3, 80}) -> 10281;
get_eqm_id({3, 10, 80}) -> 10282;
get_eqm_id({3, 11, 80}) -> 10283;
get_eqm_id({3, 12, 80}) -> 10284;
get_eqm_id({3, 14, 80}) -> 10286;
get_eqm_id({3, 3, 90}) -> 10291;
get_eqm_id({3, 10, 90}) -> 10292;
get_eqm_id({3, 11, 90}) -> 10293;
get_eqm_id({3, 12, 90}) -> 10294;
get_eqm_id({3, 14, 90}) -> 10296;
get_eqm_id({4, 4, 1}) -> 10301;
get_eqm_id({4, 10, 1}) -> 10302;
get_eqm_id({4, 11, 1}) -> 10303;
get_eqm_id({4, 12, 1}) -> 10304;
get_eqm_id({4, 14, 1}) -> 10306;
get_eqm_id({4, 4, 10}) -> 10311;
get_eqm_id({4, 10, 10}) -> 10312;
get_eqm_id({4, 11, 10}) -> 10313;
get_eqm_id({4, 12, 10}) -> 10314;
get_eqm_id({4, 14, 10}) -> 10316;
get_eqm_id({4, 4, 20}) -> 10321;
get_eqm_id({4, 10, 20}) -> 10322;
get_eqm_id({4, 11, 20}) -> 10323;
get_eqm_id({4, 12, 20}) -> 10324;
get_eqm_id({4, 14, 20}) -> 10326;
get_eqm_id({4, 4, 30}) -> 10331;
get_eqm_id({4, 10, 30}) -> 10332;
get_eqm_id({4, 11, 30}) -> 10333;
get_eqm_id({4, 12, 30}) -> 10334;
get_eqm_id({4, 14, 30}) -> 10336;
get_eqm_id({4, 4, 40}) -> 10341;
get_eqm_id({4, 10, 40}) -> 10342;
get_eqm_id({4, 11, 40}) -> 10343;
get_eqm_id({4, 12, 40}) -> 10344;
get_eqm_id({4, 14, 40}) -> 10346;
get_eqm_id({4, 4, 50}) -> 10351;
get_eqm_id({4, 10, 50}) -> 10352;
get_eqm_id({4, 11, 50}) -> 10353;
get_eqm_id({4, 12, 50}) -> 10354;
get_eqm_id({4, 14, 50}) -> 10356;
get_eqm_id({4, 4, 60}) -> 10361;
get_eqm_id({4, 10, 60}) -> 10362;
get_eqm_id({4, 11, 60}) -> 10363;
get_eqm_id({4, 12, 60}) -> 10364;
get_eqm_id({4, 14, 60}) -> 10366;
get_eqm_id({4, 4, 70}) -> 10371;
get_eqm_id({4, 10, 70}) -> 10372;
get_eqm_id({4, 11, 70}) -> 10373;
get_eqm_id({4, 12, 70}) -> 10374;
get_eqm_id({4, 14, 70}) -> 10376;
get_eqm_id({4, 4, 80}) -> 10381;
get_eqm_id({4, 10, 80}) -> 10382;
get_eqm_id({4, 11, 80}) -> 10383;
get_eqm_id({4, 12, 80}) -> 10384;
get_eqm_id({4, 14, 80}) -> 10386;
get_eqm_id({4, 4, 90}) -> 10391;
get_eqm_id({4, 10, 90}) -> 10392;
get_eqm_id({4, 11, 90}) -> 10393;
get_eqm_id({4, 12, 90}) -> 10394;
get_eqm_id({4, 14, 90}) -> 10396;
get_eqm_id({5, 5, 1}) -> 10401;
get_eqm_id({5, 10, 1}) -> 10402;
get_eqm_id({5, 11, 1}) -> 10403;
get_eqm_id({5, 12, 1}) -> 10404;
get_eqm_id({5, 14, 1}) -> 10406;
get_eqm_id({5, 5, 10}) -> 10411;
get_eqm_id({5, 10, 10}) -> 10412;
get_eqm_id({5, 11, 10}) -> 10413;
get_eqm_id({5, 12, 10}) -> 10414;
get_eqm_id({5, 14, 10}) -> 10416;
get_eqm_id({5, 5, 20}) -> 10421;
get_eqm_id({5, 10, 20}) -> 10422;
get_eqm_id({5, 11, 20}) -> 10423;
get_eqm_id({5, 12, 20}) -> 10424;
get_eqm_id({5, 14, 20}) -> 10426;
get_eqm_id({5, 5, 30}) -> 10431;
get_eqm_id({5, 10, 30}) -> 10432;
get_eqm_id({5, 11, 30}) -> 10433;
get_eqm_id({5, 12, 30}) -> 10434;
get_eqm_id({5, 14, 30}) -> 10436;
get_eqm_id({5, 5, 40}) -> 10441;
get_eqm_id({5, 10, 40}) -> 10442;
get_eqm_id({5, 11, 40}) -> 10443;
get_eqm_id({5, 12, 40}) -> 10444;
get_eqm_id({5, 14, 40}) -> 10446;
get_eqm_id({5, 5, 50}) -> 10451;
get_eqm_id({5, 10, 50}) -> 10452;
get_eqm_id({5, 11, 50}) -> 10453;
get_eqm_id({5, 12, 50}) -> 10454;
get_eqm_id({5, 14, 50}) -> 10456;
get_eqm_id({5, 5, 60}) -> 10461;
get_eqm_id({5, 10, 60}) -> 10462;
get_eqm_id({5, 11, 60}) -> 10463;
get_eqm_id({5, 12, 60}) -> 10464;
get_eqm_id({5, 14, 60}) -> 10466;
get_eqm_id({5, 5, 70}) -> 10471;
get_eqm_id({5, 10, 70}) -> 10472;
get_eqm_id({5, 11, 70}) -> 10473;
get_eqm_id({5, 12, 70}) -> 10474;
get_eqm_id({5, 14, 70}) -> 10476;
get_eqm_id({5, 5, 80}) -> 10481;
get_eqm_id({5, 10, 80}) -> 10482;
get_eqm_id({5, 11, 80}) -> 10483;
get_eqm_id({5, 12, 80}) -> 10484;
get_eqm_id({5, 14, 80}) -> 10486;
get_eqm_id({5, 5, 90}) -> 10491;
get_eqm_id({5, 10, 90}) -> 10492;
get_eqm_id({5, 11, 90}) -> 10493;
get_eqm_id({5, 12, 90}) -> 10494;
get_eqm_id({5, 14, 90}) -> 10496;
get_eqm_id({6, 21, 1}) -> 10601;
get_eqm_id({6, 10, 1}) -> 10602;
get_eqm_id({6, 11, 1}) -> 10603;
get_eqm_id({6, 12, 1}) -> 10604;
get_eqm_id({6, 14, 1}) -> 10606;
get_eqm_id({6, 21, 10}) -> 10611;
get_eqm_id({6, 10, 10}) -> 10612;
get_eqm_id({6, 11, 10}) -> 10613;
get_eqm_id({6, 12, 10}) -> 10614;
get_eqm_id({6, 14, 10}) -> 10616;
get_eqm_id({6, 21, 20}) -> 10621;
get_eqm_id({6, 10, 20}) -> 10622;
get_eqm_id({6, 11, 20}) -> 10623;
get_eqm_id({6, 12, 20}) -> 10624;
get_eqm_id({6, 14, 20}) -> 10626;
get_eqm_id({6, 21, 30}) -> 10631;
get_eqm_id({6, 10, 30}) -> 10632;
get_eqm_id({6, 11, 30}) -> 10633;
get_eqm_id({6, 12, 30}) -> 10634;
get_eqm_id({6, 14, 30}) -> 10636;
get_eqm_id({6, 21, 40}) -> 10641;
get_eqm_id({6, 10, 40}) -> 10642;
get_eqm_id({6, 11, 40}) -> 10643;
get_eqm_id({6, 12, 40}) -> 10644;
get_eqm_id({6, 14, 40}) -> 10646;
get_eqm_id({6, 21, 50}) -> 10651;
get_eqm_id({6, 10, 50}) -> 10652;
get_eqm_id({6, 11, 50}) -> 10653;
get_eqm_id({6, 12, 50}) -> 10654;
get_eqm_id({6, 14, 50}) -> 10656;
get_eqm_id({6, 21, 60}) -> 10661;
get_eqm_id({6, 10, 60}) -> 10662;
get_eqm_id({6, 11, 60}) -> 10663;
get_eqm_id({6, 12, 60}) -> 10664;
get_eqm_id({6, 14, 60}) -> 10666;
get_eqm_id({6, 21, 70}) -> 10671;
get_eqm_id({6, 10, 70}) -> 10672;
get_eqm_id({6, 11, 70}) -> 10673;
get_eqm_id({6, 12, 70}) -> 10674;
get_eqm_id({6, 14, 70}) -> 10676;
get_eqm_id({6, 21, 80}) -> 10681;
get_eqm_id({6, 10, 80}) -> 10682;
get_eqm_id({6, 11, 80}) -> 10683;
get_eqm_id({6, 12, 80}) -> 10684;
get_eqm_id({6, 14, 80}) -> 10686;
get_eqm_id({6, 21, 90}) -> 10691;
get_eqm_id({6, 10, 90}) -> 10692;
get_eqm_id({6, 11, 90}) -> 10693;
get_eqm_id({6, 12, 90}) -> 10694;
get_eqm_id({6, 14, 90}) -> 10696;
get_eqm_id({1, 6, 1}) -> 10501;
get_eqm_id({1, 7, 1}) -> 10502;
get_eqm_id({1, 9, 1}) -> 10504;
get_eqm_id({1, 6, 10}) -> 10511;
get_eqm_id({1, 7, 10}) -> 10512;
get_eqm_id({1, 9, 10}) -> 10514;
get_eqm_id({1, 6, 20}) -> 10521;
get_eqm_id({1, 7, 20}) -> 10522;
get_eqm_id({1, 9, 20}) -> 10524;
get_eqm_id({1, 6, 30}) -> 10531;
get_eqm_id({1, 7, 30}) -> 10532;
get_eqm_id({1, 9, 30}) -> 10534;
get_eqm_id({1, 6, 40}) -> 10541;
get_eqm_id({1, 7, 40}) -> 10542;
get_eqm_id({1, 9, 40}) -> 10544;
get_eqm_id({1, 6, 50}) -> 10551;
get_eqm_id({1, 7, 50}) -> 10552;
get_eqm_id({1, 9, 50}) -> 10554;
get_eqm_id({1, 6, 60}) -> 10561;
get_eqm_id({1, 7, 60}) -> 10562;
get_eqm_id({1, 9, 60}) -> 10564;
get_eqm_id({1, 6, 70}) -> 10571;
get_eqm_id({1, 7, 70}) -> 10572;
get_eqm_id({1, 9, 70}) -> 10574;
get_eqm_id({1, 6, 80}) -> 10581;
get_eqm_id({1, 7, 80}) -> 10582;
get_eqm_id({1, 9, 80}) -> 10584;
get_eqm_id({1, 6, 90}) -> 10591;
get_eqm_id({1, 7, 90}) -> 10592;
get_eqm_id({1, 9, 90}) -> 10594;
get_eqm_id({1, 1, 100}) -> 12001;
get_eqm_id({1, 10, 100}) -> 12006;
get_eqm_id({1, 11, 100}) -> 12007;
get_eqm_id({1, 12, 100}) -> 12008;
get_eqm_id({1, 14, 100}) -> 12009;
get_eqm_id({1, 7, 100}) -> 12010;
get_eqm_id({1, 9, 100}) -> 12011;
get_eqm_id({1, 6, 100}) -> 12012;
get_eqm_id({2, 6, 1}) -> 10501;
get_eqm_id({2, 7, 1}) -> 10502;
get_eqm_id({2, 9, 1}) -> 10504;
get_eqm_id({2, 6, 10}) -> 10511;
get_eqm_id({2, 7, 10}) -> 10512;
get_eqm_id({2, 9, 10}) -> 10514;
get_eqm_id({2, 6, 20}) -> 10521;
get_eqm_id({2, 7, 20}) -> 10522;
get_eqm_id({2, 9, 20}) -> 10524;
get_eqm_id({2, 6, 30}) -> 10531;
get_eqm_id({2, 7, 30}) -> 10532;
get_eqm_id({2, 9, 30}) -> 10534;
get_eqm_id({2, 6, 40}) -> 10541;
get_eqm_id({2, 7, 40}) -> 10542;
get_eqm_id({2, 9, 40}) -> 10544;
get_eqm_id({2, 6, 50}) -> 10551;
get_eqm_id({2, 7, 50}) -> 10552;
get_eqm_id({2, 9, 50}) -> 10554;
get_eqm_id({2, 6, 60}) -> 10561;
get_eqm_id({2, 7, 60}) -> 10562;
get_eqm_id({2, 9, 60}) -> 10564;
get_eqm_id({2, 6, 70}) -> 10571;
get_eqm_id({2, 7, 70}) -> 10572;
get_eqm_id({2, 9, 70}) -> 10574;
get_eqm_id({2, 6, 80}) -> 10581;
get_eqm_id({2, 7, 80}) -> 10582;
get_eqm_id({2, 9, 80}) -> 10584;
get_eqm_id({2, 6, 90}) -> 10591;
get_eqm_id({2, 7, 90}) -> 10592;
get_eqm_id({2, 9, 90}) -> 10594;
get_eqm_id({2, 2, 100}) -> 12002;
get_eqm_id({2, 10, 100}) -> 12006;
get_eqm_id({2, 11, 100}) -> 12007;
get_eqm_id({2, 12, 100}) -> 12008;
get_eqm_id({2, 14, 100}) -> 12009;
get_eqm_id({2, 7, 100}) -> 12010;
get_eqm_id({2, 9, 100}) -> 12011;
get_eqm_id({2, 6, 100}) -> 12012;
get_eqm_id({3, 6, 1}) -> 10501;
get_eqm_id({3, 7, 1}) -> 10502;
get_eqm_id({3, 9, 1}) -> 10504;
get_eqm_id({3, 6, 10}) -> 10511;
get_eqm_id({3, 7, 10}) -> 10512;
get_eqm_id({3, 9, 10}) -> 10514;
get_eqm_id({3, 6, 20}) -> 10521;
get_eqm_id({3, 7, 20}) -> 10522;
get_eqm_id({3, 9, 20}) -> 10524;
get_eqm_id({3, 6, 30}) -> 10531;
get_eqm_id({3, 7, 30}) -> 10532;
get_eqm_id({3, 9, 30}) -> 10534;
get_eqm_id({3, 6, 40}) -> 10541;
get_eqm_id({3, 7, 40}) -> 10542;
get_eqm_id({3, 9, 40}) -> 10544;
get_eqm_id({3, 6, 50}) -> 10551;
get_eqm_id({3, 7, 50}) -> 10552;
get_eqm_id({3, 9, 50}) -> 10554;
get_eqm_id({3, 6, 60}) -> 10561;
get_eqm_id({3, 7, 60}) -> 10562;
get_eqm_id({3, 9, 60}) -> 10564;
get_eqm_id({3, 6, 70}) -> 10571;
get_eqm_id({3, 7, 70}) -> 10572;
get_eqm_id({3, 9, 70}) -> 10574;
get_eqm_id({3, 6, 80}) -> 10581;
get_eqm_id({3, 7, 80}) -> 10582;
get_eqm_id({3, 9, 80}) -> 10584;
get_eqm_id({3, 6, 90}) -> 10591;
get_eqm_id({3, 7, 90}) -> 10592;
get_eqm_id({3, 9, 90}) -> 10594;
get_eqm_id({3, 3, 100}) -> 12003;
get_eqm_id({3, 10, 100}) -> 12006;
get_eqm_id({3, 11, 100}) -> 12007;
get_eqm_id({3, 12, 100}) -> 12008;
get_eqm_id({3, 14, 100}) -> 12009;
get_eqm_id({3, 7, 100}) -> 12010;
get_eqm_id({3, 9, 100}) -> 12011;
get_eqm_id({3, 6, 100}) -> 12012;
get_eqm_id({4, 6, 1}) -> 10501;
get_eqm_id({4, 7, 1}) -> 10502;
get_eqm_id({4, 9, 1}) -> 10504;
get_eqm_id({4, 6, 10}) -> 10511;
get_eqm_id({4, 7, 10}) -> 10512;
get_eqm_id({4, 9, 10}) -> 10514;
get_eqm_id({4, 6, 20}) -> 10521;
get_eqm_id({4, 7, 20}) -> 10522;
get_eqm_id({4, 9, 20}) -> 10524;
get_eqm_id({4, 6, 30}) -> 10531;
get_eqm_id({4, 7, 30}) -> 10532;
get_eqm_id({4, 9, 30}) -> 10534;
get_eqm_id({4, 6, 40}) -> 10541;
get_eqm_id({4, 7, 40}) -> 10542;
get_eqm_id({4, 9, 40}) -> 10544;
get_eqm_id({4, 6, 50}) -> 10551;
get_eqm_id({4, 7, 50}) -> 10552;
get_eqm_id({4, 9, 50}) -> 10554;
get_eqm_id({4, 6, 60}) -> 10561;
get_eqm_id({4, 7, 60}) -> 10562;
get_eqm_id({4, 9, 60}) -> 10564;
get_eqm_id({4, 6, 70}) -> 10571;
get_eqm_id({4, 7, 70}) -> 10572;
get_eqm_id({4, 9, 70}) -> 10574;
get_eqm_id({4, 6, 80}) -> 10581;
get_eqm_id({4, 7, 80}) -> 10582;
get_eqm_id({4, 9, 80}) -> 10584;
get_eqm_id({4, 6, 90}) -> 10591;
get_eqm_id({4, 7, 90}) -> 10592;
get_eqm_id({4, 9, 90}) -> 10594;
get_eqm_id({4, 4, 100}) -> 12004;
get_eqm_id({4, 10, 100}) -> 12006;
get_eqm_id({4, 11, 100}) -> 12007;
get_eqm_id({4, 12, 100}) -> 12008;
get_eqm_id({4, 14, 100}) -> 12009;
get_eqm_id({4, 7, 100}) -> 12010;
get_eqm_id({4, 9, 100}) -> 12011;
get_eqm_id({4, 6, 100}) -> 12012;
get_eqm_id({5, 6, 1}) -> 10501;
get_eqm_id({5, 7, 1}) -> 10502;
get_eqm_id({5, 9, 1}) -> 10504;
get_eqm_id({5, 6, 10}) -> 10511;
get_eqm_id({5, 7, 10}) -> 10512;
get_eqm_id({5, 9, 10}) -> 10514;
get_eqm_id({5, 6, 20}) -> 10521;
get_eqm_id({5, 7, 20}) -> 10522;
get_eqm_id({5, 9, 20}) -> 10524;
get_eqm_id({5, 6, 30}) -> 10531;
get_eqm_id({5, 7, 30}) -> 10532;
get_eqm_id({5, 9, 30}) -> 10534;
get_eqm_id({5, 6, 40}) -> 10541;
get_eqm_id({5, 7, 40}) -> 10542;
get_eqm_id({5, 9, 40}) -> 10544;
get_eqm_id({5, 6, 50}) -> 10551;
get_eqm_id({5, 7, 50}) -> 10552;
get_eqm_id({5, 9, 50}) -> 10554;
get_eqm_id({5, 6, 60}) -> 10561;
get_eqm_id({5, 7, 60}) -> 10562;
get_eqm_id({5, 9, 60}) -> 10564;
get_eqm_id({5, 6, 70}) -> 10571;
get_eqm_id({5, 7, 70}) -> 10572;
get_eqm_id({5, 9, 70}) -> 10574;
get_eqm_id({5, 6, 80}) -> 10581;
get_eqm_id({5, 7, 80}) -> 10582;
get_eqm_id({5, 9, 80}) -> 10584;
get_eqm_id({5, 6, 90}) -> 10591;
get_eqm_id({5, 7, 90}) -> 10592;
get_eqm_id({5, 9, 90}) -> 10594;
get_eqm_id({5, 5, 100}) -> 12005;
get_eqm_id({5, 10, 100}) -> 12006;
get_eqm_id({5, 11, 100}) -> 12007;
get_eqm_id({5, 12, 100}) -> 12008;
get_eqm_id({5, 14, 100}) -> 12009;
get_eqm_id({5, 7, 100}) -> 12010;
get_eqm_id({5, 9, 100}) -> 12011;
get_eqm_id({5, 6, 100}) -> 12012;
get_eqm_id({6, 6, 1}) -> 10501;
get_eqm_id({6, 7, 1}) -> 10502;
get_eqm_id({6, 9, 1}) -> 10504;
get_eqm_id({6, 6, 10}) -> 10511;
get_eqm_id({6, 7, 10}) -> 10512;
get_eqm_id({6, 9, 10}) -> 10514;
get_eqm_id({6, 6, 20}) -> 10521;
get_eqm_id({6, 7, 20}) -> 10522;
get_eqm_id({6, 9, 20}) -> 10524;
get_eqm_id({6, 6, 30}) -> 10531;
get_eqm_id({6, 7, 30}) -> 10532;
get_eqm_id({6, 9, 30}) -> 10534;
get_eqm_id({6, 6, 40}) -> 10541;
get_eqm_id({6, 7, 40}) -> 10542;
get_eqm_id({6, 9, 40}) -> 10544;
get_eqm_id({6, 6, 50}) -> 10551;
get_eqm_id({6, 7, 50}) -> 10552;
get_eqm_id({6, 9, 50}) -> 10554;
get_eqm_id({6, 6, 60}) -> 10561;
get_eqm_id({6, 7, 60}) -> 10562;
get_eqm_id({6, 9, 60}) -> 10564;
get_eqm_id({6, 6, 70}) -> 10571;
get_eqm_id({6, 7, 70}) -> 10572;
get_eqm_id({6, 9, 70}) -> 10574;
get_eqm_id({6, 6, 80}) -> 10581;
get_eqm_id({6, 7, 80}) -> 10582;
get_eqm_id({6, 9, 80}) -> 10584;
get_eqm_id({6, 6, 90}) -> 10591;
get_eqm_id({6, 7, 90}) -> 10592;
get_eqm_id({6, 9, 90}) -> 10594;
get_eqm_id({6, 21, 100}) -> 12013;
get_eqm_id({6, 10, 100}) -> 12006;
get_eqm_id({6, 11, 100}) -> 12007;
get_eqm_id({6, 12, 100}) -> 12008;
get_eqm_id({6, 14, 100}) -> 12009;
get_eqm_id({6, 7, 100}) -> 12010;
get_eqm_id({6, 9, 100}) -> 12011;
get_eqm_id({6, 6, 100}) -> 12012;
get_eqm_id({1, 1, 110}) -> 12021;
get_eqm_id({1, 10, 110}) -> 12027;
get_eqm_id({1, 11, 110}) -> 12028;
get_eqm_id({1, 12, 110}) -> 12029;
get_eqm_id({1, 14, 110}) -> 12030;
get_eqm_id({1, 7, 110}) -> 12031;
get_eqm_id({1, 9, 110}) -> 12032;
get_eqm_id({1, 6, 110}) -> 12033;
get_eqm_id({2, 2, 110}) -> 12022;
get_eqm_id({2, 10, 110}) -> 12027;
get_eqm_id({2, 11, 110}) -> 12028;
get_eqm_id({2, 12, 110}) -> 12029;
get_eqm_id({2, 14, 110}) -> 12030;
get_eqm_id({2, 7, 110}) -> 12031;
get_eqm_id({2, 9, 110}) -> 12032;
get_eqm_id({2, 6, 110}) -> 12033;
get_eqm_id({3, 3, 110}) -> 12023;
get_eqm_id({3, 10, 110}) -> 12027;
get_eqm_id({3, 11, 110}) -> 12028;
get_eqm_id({3, 12, 110}) -> 12029;
get_eqm_id({3, 14, 110}) -> 12030;
get_eqm_id({3, 7, 110}) -> 12031;
get_eqm_id({3, 9, 110}) -> 12032;
get_eqm_id({3, 6, 110}) -> 12033;
get_eqm_id({4, 4, 110}) -> 12024;
get_eqm_id({4, 10, 110}) -> 12027;
get_eqm_id({4, 11, 110}) -> 12028;
get_eqm_id({4, 12, 110}) -> 12029;
get_eqm_id({4, 14, 110}) -> 12030;
get_eqm_id({4, 7, 110}) -> 12031;
get_eqm_id({4, 9, 110}) -> 12032;
get_eqm_id({4, 6, 110}) -> 12033;
get_eqm_id({5, 5, 110}) -> 12025;
get_eqm_id({5, 10, 110}) -> 12027;
get_eqm_id({5, 11, 110}) -> 12028;
get_eqm_id({5, 12, 110}) -> 12029;
get_eqm_id({5, 14, 110}) -> 12030;
get_eqm_id({5, 7, 110}) -> 12031;
get_eqm_id({5, 9, 110}) -> 12032;
get_eqm_id({5, 6, 110}) -> 12033;
get_eqm_id({6, 21, 110}) -> 12026;
get_eqm_id({6, 10, 110}) -> 12027;
get_eqm_id({6, 11, 110}) -> 12028;
get_eqm_id({6, 12, 110}) -> 12029;
get_eqm_id({6, 14, 110}) -> 12030;
get_eqm_id({6, 7, 110}) -> 12031;
get_eqm_id({6, 9, 110}) -> 12032;
get_eqm_id({6, 6, 110}) -> 12033;
get_eqm_id({1, 1, 120}) -> 12100;
get_eqm_id({1, 10, 120}) -> 12107;
get_eqm_id({1, 11, 120}) -> 12108;
get_eqm_id({1, 12, 120}) -> 12109;
get_eqm_id({1, 14, 120}) -> 12110;
get_eqm_id({1, 7, 120}) -> 12111;
get_eqm_id({1, 9, 120}) -> 12112;
get_eqm_id({1, 6, 120}) -> 12113;
get_eqm_id({2, 2, 120}) -> 12101;
get_eqm_id({2, 10, 120}) -> 12107;
get_eqm_id({2, 11, 120}) -> 12108;
get_eqm_id({2, 12, 120}) -> 12109;
get_eqm_id({2, 14, 120}) -> 12110;
get_eqm_id({2, 7, 120}) -> 12111;
get_eqm_id({2, 9, 120}) -> 12112;
get_eqm_id({2, 6, 120}) -> 12113;
get_eqm_id({3, 3, 120}) -> 12102;
get_eqm_id({3, 10, 120}) -> 12107;
get_eqm_id({3, 11, 120}) -> 12108;
get_eqm_id({3, 12, 120}) -> 12109;
get_eqm_id({3, 14, 120}) -> 12110;
get_eqm_id({3, 7, 120}) -> 12111;
get_eqm_id({3, 9, 120}) -> 12112;
get_eqm_id({3, 6, 120}) -> 12113;
get_eqm_id({4, 4, 120}) -> 12103;
get_eqm_id({4, 10, 120}) -> 12107;
get_eqm_id({4, 11, 120}) -> 12108;
get_eqm_id({4, 12, 120}) -> 12109;
get_eqm_id({4, 14, 120}) -> 12110;
get_eqm_id({4, 7, 120}) -> 12111;
get_eqm_id({4, 9, 120}) -> 12112;
get_eqm_id({4, 6, 120}) -> 12113;
get_eqm_id({5, 5, 120}) -> 12104;
get_eqm_id({5, 10, 120}) -> 12107;
get_eqm_id({5, 11, 120}) -> 12108;
get_eqm_id({5, 12, 120}) -> 12109;
get_eqm_id({5, 14, 120}) -> 12110;
get_eqm_id({5, 7, 120}) -> 12111;
get_eqm_id({5, 9, 120}) -> 12112;
get_eqm_id({5, 6, 120}) -> 12113;
get_eqm_id({6, 21, 120}) -> 12105;
get_eqm_id({6, 10, 120}) -> 12107;
get_eqm_id({6, 11, 120}) -> 12108;
get_eqm_id({6, 12, 120}) -> 12109;
get_eqm_id({6, 14, 120}) -> 12110;
get_eqm_id({6, 7, 120}) -> 12111;
get_eqm_id({6, 9, 120}) -> 12112;
get_eqm_id({6, 6, 120}) -> 12113;
get_eqm_id({7, 22, 1}) -> 10701;
get_eqm_id({7, 10, 1}) -> 10702;
get_eqm_id({7, 11, 1}) -> 10703;
get_eqm_id({7, 12, 1}) -> 10704;
get_eqm_id({7, 14, 1}) -> 10706;
get_eqm_id({7, 22, 10}) -> 10711;
get_eqm_id({7, 10, 10}) -> 10712;
get_eqm_id({7, 11, 10}) -> 10713;
get_eqm_id({7, 12, 10}) -> 10714;
get_eqm_id({7, 14, 10}) -> 10716;
get_eqm_id({7, 22, 20}) -> 10721;
get_eqm_id({7, 10, 20}) -> 10722;
get_eqm_id({7, 11, 20}) -> 10723;
get_eqm_id({7, 12, 20}) -> 10724;
get_eqm_id({7, 14, 20}) -> 10726;
get_eqm_id({7, 22, 30}) -> 10731;
get_eqm_id({7, 10, 30}) -> 10732;
get_eqm_id({7, 11, 30}) -> 10733;
get_eqm_id({7, 12, 30}) -> 10734;
get_eqm_id({7, 14, 30}) -> 10736;
get_eqm_id({7, 22, 40}) -> 10741;
get_eqm_id({7, 10, 40}) -> 10742;
get_eqm_id({7, 11, 40}) -> 10743;
get_eqm_id({7, 12, 40}) -> 10744;
get_eqm_id({7, 14, 40}) -> 10746;
get_eqm_id({7, 22, 50}) -> 10751;
get_eqm_id({7, 10, 50}) -> 10752;
get_eqm_id({7, 11, 50}) -> 10753;
get_eqm_id({7, 12, 50}) -> 10754;
get_eqm_id({7, 14, 50}) -> 10756;
get_eqm_id({7, 22, 60}) -> 10761;
get_eqm_id({7, 10, 60}) -> 10762;
get_eqm_id({7, 11, 60}) -> 10763;
get_eqm_id({7, 12, 60}) -> 10764;
get_eqm_id({7, 14, 60}) -> 10766;
get_eqm_id({7, 22, 70}) -> 10771;
get_eqm_id({7, 10, 70}) -> 10772;
get_eqm_id({7, 11, 70}) -> 10773;
get_eqm_id({7, 12, 70}) -> 10774;
get_eqm_id({7, 14, 70}) -> 10776;
get_eqm_id({7, 22, 80}) -> 10781;
get_eqm_id({7, 10, 80}) -> 10782;
get_eqm_id({7, 11, 80}) -> 10783;
get_eqm_id({7, 12, 80}) -> 10784;
get_eqm_id({7, 14, 80}) -> 10786;
get_eqm_id({7, 22, 90}) -> 10791;
get_eqm_id({7, 10, 90}) -> 10792;
get_eqm_id({7, 11, 90}) -> 10793;
get_eqm_id({7, 12, 90}) -> 10794;
get_eqm_id({7, 14, 90}) -> 10796;
get_eqm_id({7, 6, 1}) -> 10501;
get_eqm_id({7, 7, 1}) -> 10502;
get_eqm_id({7, 9, 1}) -> 10504;
get_eqm_id({7, 6, 10}) -> 10511;
get_eqm_id({7, 7, 10}) -> 10512;
get_eqm_id({7, 9, 10}) -> 10514;
get_eqm_id({7, 6, 20}) -> 10521;
get_eqm_id({7, 7, 20}) -> 10522;
get_eqm_id({7, 9, 20}) -> 10524;
get_eqm_id({7, 6, 30}) -> 10531;
get_eqm_id({7, 7, 30}) -> 10532;
get_eqm_id({7, 9, 30}) -> 10534;
get_eqm_id({7, 6, 40}) -> 10541;
get_eqm_id({7, 7, 40}) -> 10542;
get_eqm_id({7, 9, 40}) -> 10544;
get_eqm_id({7, 6, 50}) -> 10551;
get_eqm_id({7, 7, 50}) -> 10552;
get_eqm_id({7, 9, 50}) -> 10554;
get_eqm_id({7, 6, 60}) -> 10561;
get_eqm_id({7, 7, 60}) -> 10562;
get_eqm_id({7, 9, 60}) -> 10564;
get_eqm_id({7, 6, 70}) -> 10571;
get_eqm_id({7, 7, 70}) -> 10572;
get_eqm_id({7, 9, 70}) -> 10574;
get_eqm_id({7, 6, 80}) -> 10581;
get_eqm_id({7, 7, 80}) -> 10582;
get_eqm_id({7, 9, 80}) -> 10584;
get_eqm_id({7, 6, 90}) -> 10591;
get_eqm_id({7, 7, 90}) -> 10592;
get_eqm_id({7, 9, 90}) -> 10594;
get_eqm_id({7, 22, 100}) -> 12014;
get_eqm_id({7, 10, 100}) -> 12006;
get_eqm_id({7, 11, 100}) -> 12007;
get_eqm_id({7, 12, 100}) -> 12008;
get_eqm_id({7, 14, 100}) -> 12009;
get_eqm_id({7, 7, 100}) -> 12010;
get_eqm_id({7, 9, 100}) -> 12011;
get_eqm_id({7, 6, 100}) -> 12012;
get_eqm_id({7, 22, 110}) -> 12020;
get_eqm_id({7, 10, 110}) -> 12027;
get_eqm_id({7, 11, 110}) -> 12028;
get_eqm_id({7, 12, 110}) -> 12029;
get_eqm_id({7, 14, 110}) -> 12030;
get_eqm_id({7, 7, 110}) -> 12031;
get_eqm_id({7, 9, 110}) -> 12032;
get_eqm_id({7, 6, 110}) -> 12033;
get_eqm_id({7, 22, 120}) -> 12106;
get_eqm_id({7, 10, 120}) -> 12107;
get_eqm_id({7, 11, 120}) -> 12108;
get_eqm_id({7, 12, 120}) -> 12109;
get_eqm_id({7, 14, 120}) -> 12110;
get_eqm_id({7, 7, 120}) -> 12111;
get_eqm_id({7, 9, 120}) -> 12112;
get_eqm_id({7, 6, 120}) -> 12113;
get_eqm_id(_) -> 0.

get_hole_reply_count(20808) -> 3;
get_hole_reply_count(20809) -> 3;
get_hole_reply_count(20810) -> 3;
get_hole_reply_count(20811) -> 3;
get_hole_reply_count(20812) -> 3;
get_hole_reply_count(20813) -> 3;
get_hole_reply_count(20814) -> 3;
get_hole_reply_count(20815) -> 3;
get_hole_reply_count(20816) -> 3;
get_hole_reply_count(20817) -> 3;
get_hole_reply_count(20828) -> 8;
get_hole_reply_count(20829) -> 8;
get_hole_reply_count(20830) -> 8;
get_hole_reply_count(20831) -> 8;
get_hole_reply_count(20832) -> 8;
get_hole_reply_count(20833) -> 8;
get_hole_reply_count(20834) -> 8;
get_hole_reply_count(20835) -> 8;
get_hole_reply_count(20836) -> 8;
get_hole_reply_count(20837) -> 8;
get_hole_reply_count(20848) -> 16;
get_hole_reply_count(20849) -> 16;
get_hole_reply_count(20850) -> 16;
get_hole_reply_count(20851) -> 16;
get_hole_reply_count(20852) -> 16;
get_hole_reply_count(20853) -> 16;
get_hole_reply_count(20854) -> 16;
get_hole_reply_count(20855) -> 16;
get_hole_reply_count(20856) -> 16;
get_hole_reply_count(20857) -> 16;
get_hole_reply_count(20868) -> 28;
get_hole_reply_count(20869) -> 28;
get_hole_reply_count(20870) -> 28;
get_hole_reply_count(20871) -> 28;
get_hole_reply_count(20872) -> 28;
get_hole_reply_count(20873) -> 28;
get_hole_reply_count(20874) -> 28;
get_hole_reply_count(20875) -> 28;
get_hole_reply_count(20876) -> 28;
get_hole_reply_count(20877) -> 28;
get_hole_reply_count(20888) -> 46;
get_hole_reply_count(20889) -> 46;
get_hole_reply_count(20890) -> 46;
get_hole_reply_count(20891) -> 46;
get_hole_reply_count(20892) -> 46;
get_hole_reply_count(20893) -> 46;
get_hole_reply_count(20894) -> 46;
get_hole_reply_count(20895) -> 46;
get_hole_reply_count(20896) -> 46;
get_hole_reply_count(20897) -> 46;
get_hole_reply_count(20908) -> 71;
get_hole_reply_count(20909) -> 71;
get_hole_reply_count(20910) -> 71;
get_hole_reply_count(20911) -> 71;
get_hole_reply_count(20912) -> 71;
get_hole_reply_count(20913) -> 71;
get_hole_reply_count(20914) -> 71;
get_hole_reply_count(20915) -> 71;
get_hole_reply_count(20916) -> 71;
get_hole_reply_count(20917) -> 71;
get_hole_reply_count(20928) -> 111;
get_hole_reply_count(20929) -> 111;
get_hole_reply_count(20930) -> 111;
get_hole_reply_count(20931) -> 111;
get_hole_reply_count(20932) -> 111;
get_hole_reply_count(20933) -> 111;
get_hole_reply_count(20934) -> 111;
get_hole_reply_count(20935) -> 111;
get_hole_reply_count(20936) -> 111;
get_hole_reply_count(20937) -> 111;
get_hole_reply_count(20948) -> 171;
get_hole_reply_count(20949) -> 171;
get_hole_reply_count(20950) -> 171;
get_hole_reply_count(20951) -> 171;
get_hole_reply_count(20952) -> 171;
get_hole_reply_count(20953) -> 171;
get_hole_reply_count(20954) -> 171;
get_hole_reply_count(20955) -> 171;
get_hole_reply_count(20956) -> 171;
get_hole_reply_count(20957) -> 171;
get_hole_reply_count(20968) -> 261;
get_hole_reply_count(20969) -> 261;
get_hole_reply_count(20970) -> 261;
get_hole_reply_count(20971) -> 261;
get_hole_reply_count(20972) -> 261;
get_hole_reply_count(20973) -> 261;
get_hole_reply_count(20974) -> 261;
get_hole_reply_count(20975) -> 261;
get_hole_reply_count(20976) -> 261;
get_hole_reply_count(20977) -> 261;
get_hole_reply_count(20988) -> 396;
get_hole_reply_count(20989) -> 396;
get_hole_reply_count(20990) -> 396;
get_hole_reply_count(20991) -> 396;
get_hole_reply_count(20992) -> 396;
get_hole_reply_count(20993) -> 396;
get_hole_reply_count(20994) -> 396;
get_hole_reply_count(20995) -> 396;
get_hole_reply_count(20996) -> 396;
get_hole_reply_count(20997) -> 396;
get_hole_reply_count(21008) -> 596;
get_hole_reply_count(21009) -> 596;
get_hole_reply_count(21010) -> 596;
get_hole_reply_count(21011) -> 596;
get_hole_reply_count(21012) -> 596;
get_hole_reply_count(21013) -> 596;
get_hole_reply_count(21014) -> 596;
get_hole_reply_count(21015) -> 596;
get_hole_reply_count(21016) -> 596;
get_hole_reply_count(21017) -> 596;
get_hole_reply_count(21028) -> 896;
get_hole_reply_count(21029) -> 896;
get_hole_reply_count(21030) -> 896;
get_hole_reply_count(21031) -> 896;
get_hole_reply_count(21032) -> 896;
get_hole_reply_count(21033) -> 896;
get_hole_reply_count(21034) -> 896;
get_hole_reply_count(21035) -> 896;
get_hole_reply_count(21036) -> 896;
get_hole_reply_count(21037) -> 896;
get_hole_reply_count(_) -> 0.

get_classes_effect_skill({1, 40, 1}) ->
    [{10001, 50}, {10002, 50}];
get_classes_effect_skill({1, 50, 1}) ->
    [{10001, 50}, {10002, 50}, {10004, 50}];
get_classes_effect_skill({1, 60, 1}) ->
    [{10001, 50},
     {10002, 50},
     {10003, 50},
     {10004, 50},
     {10005, 50}];
get_classes_effect_skill({1, 70, 1}) ->
    [{10001, 50},
     {10002, 50},
     {10003, 50},
     {10004, 50},
     {10005, 50},
     {10006, 50},
     {10007, 50}];
get_classes_effect_skill({1, 80, 1}) ->
    [{10001, 50},
     {10002, 50},
     {10003, 50},
     {10004, 50},
     {10005, 50},
     {10006, 50},
     {10007, 50}];
get_classes_effect_skill({1, 90, 1}) ->
    [{10001, 50},
     {10002, 50},
     {10003, 50},
     {10004, 50},
     {10005, 50},
     {10006, 50},
     {10007, 50}];
get_classes_effect_skill({1, 100, 1}) ->
    [{10001, 50},
     {10002, 50},
     {10003, 50},
     {10004, 50},
     {10005, 50},
     {10006, 50},
     {10007, 50}];
get_classes_effect_skill({1, 110, 1}) ->
    [{10001, 50},
     {10002, 50},
     {10003, 50},
     {10004, 50},
     {10005, 50},
     {10006, 50},
     {10007, 50}];
get_classes_effect_skill({1, 120, 1}) ->
    [{10001, 50},
     {10002, 50},
     {10003, 50},
     {10004, 50},
     {10005, 50},
     {10006, 50},
     {10007, 50}];
get_classes_effect_skill({6, 40, 1}) ->
    [{10001, 50}, {10002, 50}];
get_classes_effect_skill({6, 50, 1}) ->
    [{10001, 50}, {10002, 50}, {10004, 50}];
get_classes_effect_skill({6, 60, 1}) ->
    [{10001, 50},
     {10002, 50},
     {10003, 50},
     {10004, 50},
     {10005, 50}];
get_classes_effect_skill({6, 70, 1}) ->
    [{10001, 50},
     {10002, 50},
     {10003, 50},
     {10004, 50},
     {10005, 50},
     {10006, 50},
     {10007, 50}];
get_classes_effect_skill({6, 80, 1}) ->
    [{10001, 50},
     {10002, 50},
     {10003, 50},
     {10004, 50},
     {10005, 50},
     {10006, 50},
     {10007, 50}];
get_classes_effect_skill({6, 90, 1}) ->
    [{10001, 50},
     {10002, 50},
     {10003, 50},
     {10004, 50},
     {10005, 50},
     {10006, 50},
     {10007, 50}];
get_classes_effect_skill({6, 100, 1}) ->
    [{10001, 50},
     {10002, 50},
     {10003, 50},
     {10004, 50},
     {10005, 50},
     {10006, 50},
     {10007, 50}];
get_classes_effect_skill({6, 110, 1}) ->
    [{10001, 50},
     {10002, 50},
     {10003, 50},
     {10004, 50},
     {10005, 50},
     {10006, 50},
     {10007, 50}];
get_classes_effect_skill({6, 120, 1}) ->
    [{10001, 50},
     {10002, 50},
     {10003, 50},
     {10004, 50},
     {10005, 50},
     {10006, 50},
     {10007, 50}];
get_classes_effect_skill({2, 40, 2}) ->
    [{20001, 50}, {20002, 50}];
get_classes_effect_skill({2, 50, 2}) ->
    [{20001, 50}, {20002, 50}, {20003, 50}];
get_classes_effect_skill({2, 60, 2}) ->
    [{20001, 50},
     {20002, 50},
     {20003, 50},
     {20005, 50},
     {20006, 50}];
get_classes_effect_skill({2, 70, 2}) ->
    [{20001, 50},
     {20002, 50},
     {20003, 50},
     {20004, 50},
     {20005, 50},
     {20006, 50},
     {20007, 50}];
get_classes_effect_skill({2, 80, 2}) ->
    [{20001, 50},
     {20002, 50},
     {20003, 50},
     {20004, 50},
     {20005, 50},
     {20006, 50},
     {20007, 50}];
get_classes_effect_skill({2, 90, 2}) ->
    [{20001, 50},
     {20002, 50},
     {20003, 50},
     {20004, 50},
     {20005, 50},
     {20006, 50},
     {20007, 50}];
get_classes_effect_skill({2, 100, 2}) ->
    [{20001, 50},
     {20002, 50},
     {20003, 50},
     {20004, 50},
     {20005, 50},
     {20006, 50},
     {20007, 50}];
get_classes_effect_skill({2, 110, 2}) ->
    [{20001, 50},
     {20002, 50},
     {20003, 50},
     {20004, 50},
     {20005, 50},
     {20006, 50},
     {20007, 50}];
get_classes_effect_skill({2, 120, 2}) ->
    [{20001, 50},
     {20002, 50},
     {20003, 50},
     {20004, 50},
     {20005, 50},
     {20006, 50},
     {20007, 50}];
get_classes_effect_skill({6, 40, 2}) ->
    [{20001, 50}, {20002, 50}];
get_classes_effect_skill({6, 50, 2}) ->
    [{20001, 50}, {20002, 50}, {20003, 50}];
get_classes_effect_skill({6, 60, 2}) ->
    [{20001, 50},
     {20002, 50},
     {20003, 50},
     {20005, 50},
     {20006, 50}];
get_classes_effect_skill({6, 70, 2}) ->
    [{20001, 50},
     {20002, 50},
     {20003, 50},
     {20004, 50},
     {20005, 50},
     {20006, 50},
     {20007, 50}];
get_classes_effect_skill({6, 80, 2}) ->
    [{20001, 50},
     {20002, 50},
     {20003, 50},
     {20004, 50},
     {20005, 50},
     {20006, 50},
     {20007, 50}];
get_classes_effect_skill({6, 90, 2}) ->
    [{20001, 50},
     {20002, 50},
     {20003, 50},
     {20004, 50},
     {20005, 50},
     {20006, 50},
     {20007, 50}];
get_classes_effect_skill({6, 100, 2}) ->
    [{20001, 50},
     {20002, 50},
     {20003, 50},
     {20004, 50},
     {20005, 50},
     {20006, 50},
     {20007, 50}];
get_classes_effect_skill({6, 110, 2}) ->
    [{20001, 50},
     {20002, 50},
     {20003, 50},
     {20004, 50},
     {20005, 50},
     {20006, 50},
     {20007, 50}];
get_classes_effect_skill({6, 120, 2}) ->
    [{20001, 50},
     {20002, 50},
     {20003, 50},
     {20004, 50},
     {20005, 50},
     {20006, 50},
     {20007, 50}];
get_classes_effect_skill({3, 40, 3}) ->
    [{30001, 50}, {30002, 50}];
get_classes_effect_skill({3, 50, 3}) ->
    [{30001, 50}, {30002, 50}, {30003, 50}];
get_classes_effect_skill({3, 60, 3}) ->
    [{30001, 50},
     {30002, 50},
     {30003, 50},
     {30004, 50},
     {30005, 50}];
get_classes_effect_skill({3, 70, 3}) ->
    [{30001, 50},
     {30002, 50},
     {30003, 50},
     {30004, 50},
     {30005, 50},
     {30006, 50},
     {30007, 50}];
get_classes_effect_skill({3, 80, 3}) ->
    [{30001, 50},
     {30002, 50},
     {30003, 50},
     {30004, 50},
     {30005, 50},
     {30006, 50},
     {30007, 50}];
get_classes_effect_skill({3, 90, 3}) ->
    [{30001, 50},
     {30002, 50},
     {30003, 50},
     {30004, 50},
     {30005, 50},
     {30006, 50},
     {30007, 50}];
get_classes_effect_skill({3, 100, 3}) ->
    [{30001, 50},
     {30002, 50},
     {30003, 50},
     {30004, 50},
     {30005, 50},
     {30006, 50},
     {30007, 50}];
get_classes_effect_skill({3, 110, 3}) ->
    [{30001, 50},
     {30002, 50},
     {30003, 50},
     {30004, 50},
     {30005, 50},
     {30006, 50},
     {30007, 50}];
get_classes_effect_skill({3, 120, 3}) ->
    [{30001, 50},
     {30002, 50},
     {30003, 50},
     {30004, 50},
     {30005, 50},
     {30006, 50},
     {30007, 50}];
get_classes_effect_skill({6, 40, 3}) ->
    [{30001, 50}, {30002, 50}];
get_classes_effect_skill({6, 50, 3}) ->
    [{30001, 50}, {30002, 50}, {30003, 50}];
get_classes_effect_skill({6, 60, 3}) ->
    [{30001, 50},
     {30002, 50},
     {30003, 50},
     {30004, 50},
     {30005, 50}];
get_classes_effect_skill({6, 70, 3}) ->
    [{30001, 50},
     {30002, 50},
     {30003, 50},
     {30004, 50},
     {30005, 50},
     {30006, 50},
     {30007, 50}];
get_classes_effect_skill({6, 80, 3}) ->
    [{30001, 50},
     {30002, 50},
     {30003, 50},
     {30004, 50},
     {30005, 50},
     {30006, 50},
     {30007, 50}];
get_classes_effect_skill({6, 90, 3}) ->
    [{30001, 50},
     {30002, 50},
     {30003, 50},
     {30004, 50},
     {30005, 50},
     {30006, 50},
     {30007, 50}];
get_classes_effect_skill({6, 100, 3}) ->
    [{30001, 50},
     {30002, 50},
     {30003, 50},
     {30004, 50},
     {30005, 50},
     {30006, 50},
     {30007, 50}];
get_classes_effect_skill({6, 110, 3}) ->
    [{30001, 50},
     {30002, 50},
     {30003, 50},
     {30004, 50},
     {30005, 50},
     {30006, 50},
     {30007, 50}];
get_classes_effect_skill({6, 120, 3}) ->
    [{30001, 50},
     {30002, 50},
     {30003, 50},
     {30004, 50},
     {30005, 50},
     {30006, 50},
     {30007, 50}];
get_classes_effect_skill({4, 40, 4}) ->
    [{40001, 50}, {40002, 50}];
get_classes_effect_skill({4, 50, 4}) ->
    [{40001, 50}, {40002, 50}, {40004, 50}];
get_classes_effect_skill({4, 60, 4}) ->
    [{40001, 50},
     {40002, 50},
     {40003, 50},
     {40004, 50},
     {40005, 50}];
get_classes_effect_skill({4, 70, 4}) ->
    [{40001, 50},
     {40002, 50},
     {40003, 50},
     {40004, 50},
     {40005, 50},
     {40006, 50},
     {40007, 50}];
get_classes_effect_skill({4, 80, 4}) ->
    [{40001, 50},
     {40002, 50},
     {40003, 50},
     {40004, 50},
     {40005, 50},
     {40006, 50},
     {40007, 50}];
get_classes_effect_skill({4, 90, 4}) ->
    [{40001, 50},
     {40002, 50},
     {40003, 50},
     {40004, 50},
     {40005, 50},
     {40006, 50},
     {40007, 50}];
get_classes_effect_skill({4, 100, 4}) ->
    [{40001, 50},
     {40002, 50},
     {40003, 50},
     {40004, 50},
     {40005, 50},
     {40006, 50},
     {40007, 50}];
get_classes_effect_skill({4, 110, 4}) ->
    [{40001, 50},
     {40002, 50},
     {40003, 50},
     {40004, 50},
     {40005, 50},
     {40006, 50},
     {40007, 50}];
get_classes_effect_skill({4, 120, 4}) ->
    [{40001, 50},
     {40002, 50},
     {40003, 50},
     {40004, 50},
     {40005, 50},
     {40006, 50},
     {40007, 50}];
get_classes_effect_skill({6, 40, 4}) ->
    [{40001, 50}, {40002, 50}];
get_classes_effect_skill({6, 50, 4}) ->
    [{40001, 50}, {40002, 50}, {40004, 50}];
get_classes_effect_skill({6, 60, 4}) ->
    [{40001, 50},
     {40002, 50},
     {40003, 50},
     {40004, 50},
     {40005, 50}];
get_classes_effect_skill({6, 70, 4}) ->
    [{40001, 50},
     {40002, 50},
     {40003, 50},
     {40004, 50},
     {40005, 50},
     {40006, 50},
     {40007, 50}];
get_classes_effect_skill({6, 80, 4}) ->
    [{40001, 50},
     {40002, 50},
     {40003, 50},
     {40004, 50},
     {40005, 50},
     {40006, 50},
     {40007, 50}];
get_classes_effect_skill({6, 90, 4}) ->
    [{40001, 50},
     {40002, 50},
     {40003, 50},
     {40004, 50},
     {40005, 50},
     {40006, 50},
     {40007, 50}];
get_classes_effect_skill({6, 100, 4}) ->
    [{40001, 50},
     {40002, 50},
     {40003, 50},
     {40004, 50},
     {40005, 50},
     {40006, 50},
     {40007, 50}];
get_classes_effect_skill({6, 110, 4}) ->
    [{40001, 50},
     {40002, 50},
     {40003, 50},
     {40004, 50},
     {40005, 50},
     {40006, 50},
     {40007, 50}];
get_classes_effect_skill({6, 120, 4}) ->
    [{40001, 50},
     {40002, 50},
     {40003, 50},
     {40004, 50},
     {40005, 50},
     {40006, 50},
     {40007, 50}];
get_classes_effect_skill({5, 40, 5}) ->
    [{50001, 50}, {50002, 50}];
get_classes_effect_skill({5, 50, 5}) ->
    [{50001, 50}, {50002, 50}, {50003, 50}];
get_classes_effect_skill({5, 60, 5}) ->
    [{50001, 50},
     {50002, 50},
     {50003, 50},
     {50004, 50},
     {50005, 50}];
get_classes_effect_skill({5, 70, 5}) ->
    [{50001, 50},
     {50002, 50},
     {50003, 50},
     {50004, 50},
     {50005, 50},
     {50006, 50},
     {50007, 50}];
get_classes_effect_skill({5, 80, 5}) ->
    [{50001, 50},
     {50002, 50},
     {50003, 50},
     {50004, 50},
     {50005, 50},
     {50006, 50},
     {50007, 50}];
get_classes_effect_skill({5, 90, 5}) ->
    [{50001, 50},
     {50002, 50},
     {50003, 50},
     {50004, 50},
     {50005, 50},
     {50006, 50},
     {50007, 50}];
get_classes_effect_skill({5, 100, 5}) ->
    [{50001, 50},
     {50002, 50},
     {50003, 50},
     {50004, 50},
     {50005, 50},
     {50006, 50},
     {50007, 50}];
get_classes_effect_skill({5, 110, 5}) ->
    [{50001, 50},
     {50002, 50},
     {50003, 50},
     {50004, 50},
     {50005, 50},
     {50006, 50},
     {50007, 50}];
get_classes_effect_skill({5, 120, 5}) ->
    [{50001, 50},
     {50002, 50},
     {50003, 50},
     {50004, 50},
     {50005, 50},
     {50006, 50},
     {50007, 50}];
get_classes_effect_skill({6, 40, 5}) ->
    [{50001, 50}, {50002, 50}];
get_classes_effect_skill({6, 50, 5}) ->
    [{50001, 50}, {50002, 50}, {50003, 50}];
get_classes_effect_skill({6, 60, 5}) ->
    [{50001, 50},
     {50002, 50},
     {50003, 50},
     {50004, 50},
     {50005, 50}];
get_classes_effect_skill({6, 70, 5}) ->
    [{50001, 50},
     {50002, 50},
     {50003, 50},
     {50004, 50},
     {50005, 50},
     {50006, 50},
     {50007, 50}];
get_classes_effect_skill({6, 80, 5}) ->
    [{50001, 50},
     {50002, 50},
     {50003, 50},
     {50004, 50},
     {50005, 50},
     {50006, 50},
     {50007, 50}];
get_classes_effect_skill({6, 90, 5}) ->
    [{50001, 50},
     {50002, 50},
     {50003, 50},
     {50004, 50},
     {50005, 50},
     {50006, 50},
     {50007, 50}];
get_classes_effect_skill({6, 100, 5}) ->
    [{50001, 50},
     {50002, 50},
     {50003, 50},
     {50004, 50},
     {50005, 50},
     {50006, 50},
     {50007, 50}];
get_classes_effect_skill({6, 110, 5}) ->
    [{50001, 50},
     {50002, 50},
     {50003, 50},
     {50004, 50},
     {50005, 50},
     {50006, 50},
     {50007, 50}];
get_classes_effect_skill({6, 120, 5}) ->
    [{50001, 50},
     {50002, 50},
     {50003, 50},
     {50004, 50},
     {50005, 50},
     {50006, 50},
     {50007, 50}];
get_classes_effect_skill({21, 40, 6}) ->
    [{69001, 50}, {69002, 50}];
get_classes_effect_skill({21, 50, 6}) ->
    [{69001, 50}, {69002, 50}, {69003, 50}];
get_classes_effect_skill({21, 60, 6}) ->
    [{69001, 50},
     {69002, 50},
     {69003, 50},
     {69004, 50},
     {69005, 50}];
get_classes_effect_skill({21, 70, 6}) ->
    [{69001, 50},
     {69002, 50},
     {69003, 50},
     {69004, 50},
     {69005, 50},
     {69006, 50},
     {69007, 50}];
get_classes_effect_skill({21, 80, 6}) ->
    [{69001, 50},
     {69002, 50},
     {69003, 50},
     {69004, 50},
     {69005, 50},
     {69006, 50},
     {69007, 50}];
get_classes_effect_skill({21, 90, 6}) ->
    [{69001, 50},
     {69002, 50},
     {69003, 50},
     {69004, 50},
     {69005, 50},
     {69006, 50},
     {69007, 50}];
get_classes_effect_skill({21, 100, 6}) ->
    [{69001, 50},
     {69002, 50},
     {69003, 50},
     {69004, 50},
     {69005, 50},
     {69006, 50},
     {69007, 50}];
get_classes_effect_skill({21, 110, 6}) ->
    [{69001, 50},
     {69002, 50},
     {69003, 50},
     {69004, 50},
     {69005, 50},
     {69006, 50},
     {69007, 50}];
get_classes_effect_skill({21, 120, 6}) ->
    [{69001, 50},
     {69002, 50},
     {69003, 50},
     {69004, 50},
     {69005, 50},
     {69006, 50},
     {69007, 50}];
get_classes_effect_skill({6, 40, 6}) ->
    [{69001, 50}, {69002, 50}];
get_classes_effect_skill({6, 50, 6}) ->
    [{69001, 50}, {69002, 50}, {69003, 50}];
get_classes_effect_skill({6, 60, 6}) ->
    [{69001, 50},
     {69002, 50},
     {69003, 50},
     {69004, 50},
     {69005, 50}];
get_classes_effect_skill({6, 70, 6}) ->
    [{69001, 50},
     {69002, 50},
     {69003, 50},
     {69004, 50},
     {69005, 50},
     {69006, 50},
     {69007, 50}];
get_classes_effect_skill({6, 80, 6}) ->
    [{69001, 50},
     {69002, 50},
     {69003, 50},
     {69004, 50},
     {69005, 50},
     {69006, 50},
     {69007, 50}];
get_classes_effect_skill({6, 90, 6}) ->
    [{69001, 50},
     {69002, 50},
     {69003, 50},
     {69004, 50},
     {69005, 50},
     {69006, 50},
     {69007, 50}];
get_classes_effect_skill({6, 100, 6}) ->
    [{69001, 50},
     {69002, 50},
     {69003, 50},
     {69004, 50},
     {69005, 50},
     {69006, 50},
     {69007, 50}];
get_classes_effect_skill({6, 110, 6}) ->
    [{69001, 50},
     {69002, 50},
     {69003, 50},
     {69004, 50},
     {69005, 50},
     {69006, 50},
     {69007, 50}];
get_classes_effect_skill({6, 120, 6}) ->
    [{69001, 50},
     {69002, 50},
     {69003, 50},
     {69004, 50},
     {69005, 50},
     {69006, 50},
     {69007, 50}];
get_classes_effect_skill({22, 40, 7}) ->
    [{69501, 50}, {69502, 50}];
get_classes_effect_skill({22, 50, 7}) ->
    [{69501, 50}, {69502, 50}, {69503, 50}];
get_classes_effect_skill({22, 60, 7}) ->
    [{69501, 50},
     {69502, 50},
     {69503, 50},
     {69504, 50},
     {69505, 50}];
get_classes_effect_skill({22, 70, 7}) ->
    [{69501, 50},
     {69502, 50},
     {69503, 50},
     {69504, 50},
     {69505, 50},
     {69506, 50},
     {69507, 50}];
get_classes_effect_skill({22, 80, 7}) ->
    [{69501, 50},
     {69502, 50},
     {69503, 50},
     {69504, 50},
     {69505, 50},
     {69506, 50},
     {69507, 50}];
get_classes_effect_skill({22, 90, 7}) ->
    [{69501, 50},
     {69502, 50},
     {69503, 50},
     {69504, 50},
     {69505, 50},
     {69506, 50},
     {69507, 50}];
get_classes_effect_skill({22, 100, 7}) ->
    [{69501, 50},
     {69502, 50},
     {69503, 50},
     {69504, 50},
     {69505, 50},
     {69506, 50},
     {69507, 50}];
get_classes_effect_skill({22, 110, 7}) ->
    [{69501, 50},
     {69502, 50},
     {69503, 50},
     {69504, 50},
     {69505, 50},
     {69506, 50},
     {69507, 50}];
get_classes_effect_skill({22, 120, 7}) ->
    [{69501, 50},
     {69502, 50},
     {69503, 50},
     {69504, 50},
     {69505, 50},
     {69506, 50},
     {69507, 50}];
get_classes_effect_skill({6, 40, 7}) ->
    [{69501, 50}, {69502, 50}];
get_classes_effect_skill({6, 50, 7}) ->
    [{69501, 50}, {69502, 50}, {69503, 50}];
get_classes_effect_skill({6, 60, 7}) ->
    [{69501, 50},
     {69502, 50},
     {69503, 50},
     {69504, 50},
     {69505, 50}];
get_classes_effect_skill({6, 70, 7}) ->
    [{69501, 50},
     {69502, 50},
     {69503, 50},
     {69504, 50},
     {69505, 50},
     {69506, 50},
     {69507, 50}];
get_classes_effect_skill({6, 80, 7}) ->
    [{69501, 50},
     {69502, 50},
     {69503, 50},
     {69504, 50},
     {69505, 50},
     {69506, 50},
     {69507, 50}];
get_classes_effect_skill({6, 90, 7}) ->
    [{69501, 50},
     {69502, 50},
     {69503, 50},
     {69504, 50},
     {69505, 50},
     {69506, 50},
     {69507, 50}];
get_classes_effect_skill({6, 100, 7}) ->
    [{69501, 50},
     {69502, 50},
     {69503, 50},
     {69504, 50},
     {69505, 50},
     {69506, 50},
     {69507, 50}];
get_classes_effect_skill({6, 110, 7}) ->
    [{69501, 50},
     {69502, 50},
     {69503, 50},
     {69504, 50},
     {69505, 50},
     {69506, 50},
     {69507, 50}];
get_classes_effect_skill({6, 120, 7}) ->
    [{69501, 50},
     {69502, 50},
     {69503, 50},
     {69504, 50},
     {69505, 50},
     {69506, 50},
     {69507, 50}];
get_classes_effect_skill(_) -> [].

get_comprehend_attr({1, 1}) -> [];
get_comprehend_attr({2, 1}) -> [];
get_comprehend_attr({3, 1}) -> [{1, 86}, {4, 26}];
get_comprehend_attr({4, 1}) -> [{1, 86}, {4, 26}];
get_comprehend_attr({5, 1}) -> [{1, 127}, {4, 38}];
get_comprehend_attr({6, 1}) -> [{1, 127}, {4, 38}];
get_comprehend_attr({7, 1}) ->
    [{1, 175}, {4, 52}, {3, 6}];
get_comprehend_attr({8, 1}) ->
    [{1, 215}, {4, 64}, {3, 9}];
get_comprehend_attr({9, 1}) ->
    [{1, 258}, {4, 77}, {3, 12}];
get_comprehend_attr({10, 1}) ->
    [{1, 304}, {4, 91}, {3, 15}];
get_comprehend_attr({11, 1}) ->
    [{1, 304}, {4, 91}, {3, 15}];
get_comprehend_attr({12, 1}) ->
    [{1, 304}, {4, 91}, {3, 15}];
get_comprehend_attr({13, 1}) ->
    [{1, 304}, {4, 91}, {3, 15}];
get_comprehend_attr({1, 2}) -> [];
get_comprehend_attr({2, 2}) -> [];
get_comprehend_attr({3, 2}) -> [{1, 86}, {5, 21}];
get_comprehend_attr({4, 2}) -> [{1, 86}, {5, 21}];
get_comprehend_attr({5, 2}) -> [{1, 127}, {5, 30}];
get_comprehend_attr({6, 2}) -> [{1, 127}, {5, 30}];
get_comprehend_attr({7, 2}) ->
    [{1, 175}, {5, 42}, {6, 22}];
get_comprehend_attr({8, 2}) ->
    [{1, 215}, {5, 51}, {6, 31}];
get_comprehend_attr({9, 2}) ->
    [{1, 258}, {5, 62}, {6, 40}];
get_comprehend_attr({10, 2}) ->
    [{1, 304}, {5, 72}, {6, 47}];
get_comprehend_attr({11, 2}) ->
    [{1, 304}, {5, 72}, {6, 47}];
get_comprehend_attr({12, 2}) ->
    [{1, 304}, {5, 72}, {6, 47}];
get_comprehend_attr({13, 2}) ->
    [{1, 304}, {5, 72}, {6, 47}];
get_comprehend_attr({1, 3}) -> [];
get_comprehend_attr({2, 3}) -> [];
get_comprehend_attr({3, 3}) -> [{1, 86}, {4, 26}];
get_comprehend_attr({4, 3}) -> [{1, 86}, {4, 26}];
get_comprehend_attr({5, 3}) -> [{1, 127}, {4, 38}];
get_comprehend_attr({6, 3}) -> [{1, 127}, {4, 38}];
get_comprehend_attr({7, 3}) ->
    [{1, 175}, {4, 52}, {3, 6}];
get_comprehend_attr({8, 3}) ->
    [{1, 215}, {4, 64}, {3, 9}];
get_comprehend_attr({9, 3}) ->
    [{1, 258}, {4, 77}, {3, 12}];
get_comprehend_attr({10, 3}) ->
    [{1, 304}, {4, 91}, {3, 15}];
get_comprehend_attr({11, 3}) ->
    [{1, 304}, {4, 91}, {3, 15}];
get_comprehend_attr({12, 3}) ->
    [{1, 304}, {4, 91}, {3, 15}];
get_comprehend_attr({13, 3}) ->
    [{1, 304}, {4, 91}, {3, 15}];
get_comprehend_attr({1, 4}) -> [];
get_comprehend_attr({2, 4}) -> [];
get_comprehend_attr({3, 4}) -> [{1, 86}, {3, 4}];
get_comprehend_attr({4, 4}) -> [{1, 86}, {3, 4}];
get_comprehend_attr({5, 4}) -> [{1, 127}, {3, 6}];
get_comprehend_attr({6, 4}) -> [{1, 127}, {3, 6}];
get_comprehend_attr({7, 4}) ->
    [{1, 175}, {3, 8}, {7, 17}];
get_comprehend_attr({8, 4}) ->
    [{1, 215}, {3, 10}, {7, 25}];
get_comprehend_attr({9, 4}) ->
    [{1, 258}, {3, 12}, {7, 32}];
get_comprehend_attr({10, 4}) ->
    [{1, 304}, {3, 15}, {7, 38}];
get_comprehend_attr({11, 4}) ->
    [{1, 304}, {3, 15}, {7, 38}];
get_comprehend_attr({12, 4}) ->
    [{1, 304}, {3, 15}, {7, 38}];
get_comprehend_attr({13, 4}) ->
    [{1, 304}, {3, 15}, {7, 38}];
get_comprehend_attr({1, 5}) -> [];
get_comprehend_attr({2, 5}) -> [];
get_comprehend_attr({3, 5}) -> [{1, 120}, {33, 45}];
get_comprehend_attr({4, 5}) -> [{1, 120}, {33, 45}];
get_comprehend_attr({5, 5}) -> [{1, 190}, {33, 70}];
get_comprehend_attr({6, 5}) -> [{1, 190}, {33, 70}];
get_comprehend_attr({7, 5}) ->
    [{1, 260}, {6, 22}, {33, 110}];
get_comprehend_attr({8, 5}) ->
    [{1, 290}, {6, 31}, {33, 130}];
get_comprehend_attr({9, 5}) ->
    [{1, 320}, {6, 40}, {33, 150}];
get_comprehend_attr({10, 5}) ->
    [{1, 350}, {6, 47}, {33, 170}];
get_comprehend_attr({11, 5}) ->
    [{1, 350}, {6, 47}, {33, 170}];
get_comprehend_attr({12, 5}) ->
    [{1, 350}, {6, 47}, {33, 170}];
get_comprehend_attr({13, 5}) ->
    [{1, 350}, {6, 47}, {33, 170}];
get_comprehend_attr({1, 6}) -> [];
get_comprehend_attr({2, 6}) -> [];
get_comprehend_attr({3, 6}) -> [{1, 86}, {5, 21}];
get_comprehend_attr({4, 6}) -> [{1, 86}, {5, 21}];
get_comprehend_attr({5, 6}) -> [{1, 127}, {5, 30}];
get_comprehend_attr({6, 6}) -> [{1, 127}, {5, 30}];
get_comprehend_attr({7, 6}) ->
    [{1, 175}, {5, 42}, {6, 22}];
get_comprehend_attr({8, 6}) ->
    [{1, 215}, {5, 51}, {6, 31}];
get_comprehend_attr({9, 6}) ->
    [{1, 258}, {5, 62}, {6, 40}];
get_comprehend_attr({10, 6}) ->
    [{1, 304}, {5, 72}, {6, 47}];
get_comprehend_attr({11, 6}) ->
    [{1, 304}, {5, 72}, {6, 47}];
get_comprehend_attr({12, 6}) ->
    [{1, 304}, {5, 72}, {6, 47}];
get_comprehend_attr({13, 6}) ->
    [{1, 304}, {5, 72}, {6, 47}];
get_comprehend_attr({1, 7}) -> [];
get_comprehend_attr({2, 7}) -> [];
get_comprehend_attr({3, 7}) -> [{1, 86}, {4, 26}];
get_comprehend_attr({4, 7}) -> [{1, 86}, {4, 26}];
get_comprehend_attr({5, 7}) -> [{1, 127}, {4, 38}];
get_comprehend_attr({6, 7}) -> [{1, 127}, {4, 38}];
get_comprehend_attr({7, 7}) ->
    [{1, 175}, {4, 52}, {7, 17}];
get_comprehend_attr({8, 7}) ->
    [{1, 215}, {4, 64}, {7, 25}];
get_comprehend_attr({9, 7}) ->
    [{1, 258}, {4, 77}, {7, 32}];
get_comprehend_attr({10, 7}) ->
    [{1, 304}, {4, 91}, {7, 38}];
get_comprehend_attr({11, 7}) ->
    [{1, 304}, {4, 91}, {7, 38}];
get_comprehend_attr({12, 7}) ->
    [{1, 304}, {4, 91}, {7, 38}];
get_comprehend_attr({13, 7}) ->
    [{1, 304}, {4, 91}, {7, 38}];
get_comprehend_attr(_Lev) -> false.

get_comprehend_ignore({1, 1}) -> 0;
get_comprehend_ignore({2, 1}) -> 0;
get_comprehend_ignore({3, 1}) -> 1;
get_comprehend_ignore({4, 1}) -> 0;
get_comprehend_ignore({5, 1}) -> 1;
get_comprehend_ignore({6, 1}) -> 0;
get_comprehend_ignore({7, 1}) -> 1;
get_comprehend_ignore({8, 1}) -> 1;
get_comprehend_ignore({9, 1}) -> 1;
get_comprehend_ignore({10, 1}) -> 1;
get_comprehend_ignore({11, 1}) -> 0;
get_comprehend_ignore({12, 1}) -> 0;
get_comprehend_ignore({13, 1}) -> 0;
get_comprehend_ignore({1, 2}) -> 0;
get_comprehend_ignore({2, 2}) -> 0;
get_comprehend_ignore({3, 2}) -> 1;
get_comprehend_ignore({4, 2}) -> 0;
get_comprehend_ignore({5, 2}) -> 1;
get_comprehend_ignore({6, 2}) -> 0;
get_comprehend_ignore({7, 2}) -> 1;
get_comprehend_ignore({8, 2}) -> 1;
get_comprehend_ignore({9, 2}) -> 1;
get_comprehend_ignore({10, 2}) -> 1;
get_comprehend_ignore({11, 2}) -> 0;
get_comprehend_ignore({12, 2}) -> 0;
get_comprehend_ignore({13, 2}) -> 0;
get_comprehend_ignore({1, 3}) -> 0;
get_comprehend_ignore({2, 3}) -> 0;
get_comprehend_ignore({3, 3}) -> 1;
get_comprehend_ignore({4, 3}) -> 0;
get_comprehend_ignore({5, 3}) -> 1;
get_comprehend_ignore({6, 3}) -> 0;
get_comprehend_ignore({7, 3}) -> 1;
get_comprehend_ignore({8, 3}) -> 1;
get_comprehend_ignore({9, 3}) -> 1;
get_comprehend_ignore({10, 3}) -> 1;
get_comprehend_ignore({11, 3}) -> 0;
get_comprehend_ignore({12, 3}) -> 0;
get_comprehend_ignore({13, 3}) -> 0;
get_comprehend_ignore({1, 4}) -> 0;
get_comprehend_ignore({2, 4}) -> 0;
get_comprehend_ignore({3, 4}) -> 1;
get_comprehend_ignore({4, 4}) -> 0;
get_comprehend_ignore({5, 4}) -> 1;
get_comprehend_ignore({6, 4}) -> 0;
get_comprehend_ignore({7, 4}) -> 1;
get_comprehend_ignore({8, 4}) -> 1;
get_comprehend_ignore({9, 4}) -> 1;
get_comprehend_ignore({10, 4}) -> 1;
get_comprehend_ignore({11, 4}) -> 0;
get_comprehend_ignore({12, 4}) -> 0;
get_comprehend_ignore({13, 4}) -> 0;
get_comprehend_ignore({1, 5}) -> 0;
get_comprehend_ignore({2, 5}) -> 0;
get_comprehend_ignore({3, 5}) -> 1;
get_comprehend_ignore({4, 5}) -> 0;
get_comprehend_ignore({5, 5}) -> 1;
get_comprehend_ignore({6, 5}) -> 0;
get_comprehend_ignore({7, 5}) -> 1;
get_comprehend_ignore({8, 5}) -> 1;
get_comprehend_ignore({9, 5}) -> 1;
get_comprehend_ignore({10, 5}) -> 1;
get_comprehend_ignore({11, 5}) -> 0;
get_comprehend_ignore({12, 5}) -> 0;
get_comprehend_ignore({13, 5}) -> 0;
get_comprehend_ignore({1, 6}) -> 0;
get_comprehend_ignore({2, 6}) -> 0;
get_comprehend_ignore({3, 6}) -> 1;
get_comprehend_ignore({4, 6}) -> 0;
get_comprehend_ignore({5, 6}) -> 1;
get_comprehend_ignore({6, 6}) -> 0;
get_comprehend_ignore({7, 6}) -> 1;
get_comprehend_ignore({8, 6}) -> 1;
get_comprehend_ignore({9, 6}) -> 1;
get_comprehend_ignore({10, 6}) -> 1;
get_comprehend_ignore({11, 6}) -> 0;
get_comprehend_ignore({12, 6}) -> 0;
get_comprehend_ignore({13, 6}) -> 0;
get_comprehend_ignore({1, 7}) -> 0;
get_comprehend_ignore({2, 7}) -> 0;
get_comprehend_ignore({3, 7}) -> 1;
get_comprehend_ignore({4, 7}) -> 0;
get_comprehend_ignore({5, 7}) -> 1;
get_comprehend_ignore({6, 7}) -> 0;
get_comprehend_ignore({7, 7}) -> 1;
get_comprehend_ignore({8, 7}) -> 1;
get_comprehend_ignore({9, 7}) -> 1;
get_comprehend_ignore({10, 7}) -> 1;
get_comprehend_ignore({11, 7}) -> 0;
get_comprehend_ignore({12, 7}) -> 0;
get_comprehend_ignore({13, 7}) -> 0;
get_comprehend_ignore(_Lev) -> 0.

get_classes_modify_comprehend_attr({1, 2, 2}) ->
    #{classes => 1, target_classes => 2, type => 1,
      target_type => 2, attr1 => 101, target_attr1 => 103,
      attr2 => 104, target_attr2 => 105};
get_classes_modify_comprehend_attr({1, 2, 6}) ->
    #{classes => 1, target_classes => 2, type => 6,
      target_type => 6, attr1 => 101, target_attr1 => 102,
      attr2 => 104, target_attr2 => 104};
get_classes_modify_comprehend_attr({1, 2, 7}) ->
    #{classes => 1, target_classes => 2, type => 7,
      target_type => 7, attr1 => 101, target_attr1 => 103,
      attr2 => 102, target_attr2 => 102};
get_classes_modify_comprehend_attr({1, 2, 9}) ->
    #{classes => 1, target_classes => 2, type => 9,
      target_type => 9, attr1 => 101, target_attr1 => 105,
      attr2 => 102, target_attr2 => 102};
get_classes_modify_comprehend_attr({1, 2, 10}) ->
    #{classes => 1, target_classes => 2, type => 10,
      target_type => 10, attr1 => 105, target_attr1 => 103,
      attr2 => 102, target_attr2 => 105};
get_classes_modify_comprehend_attr({1, 2, 11}) ->
    #{classes => 1, target_classes => 2, type => 11,
      target_type => 11, attr1 => 101, target_attr1 => 105,
      attr2 => 105, target_attr2 => 104};
get_classes_modify_comprehend_attr({1, 2, 12}) ->
    #{classes => 1, target_classes => 2, type => 12,
      target_type => 12, attr1 => 104, target_attr1 => 103,
      attr2 => 102, target_attr2 => 102};
get_classes_modify_comprehend_attr({1, 2, 14}) ->
    #{classes => 1, target_classes => 2, type => 14,
      target_type => 14, attr1 => 104, target_attr1 => 103,
      attr2 => 105, target_attr2 => 104};
get_classes_modify_comprehend_attr({1, 4, 4}) ->
    #{classes => 1, target_classes => 4, type => 1,
      target_type => 4, attr1 => 101, target_attr1 => 104,
      attr2 => 104, target_attr2 => 105};
get_classes_modify_comprehend_attr({1, 4, 6}) ->
    #{classes => 1, target_classes => 4, type => 6,
      target_type => 6, attr1 => 101, target_attr1 => 102,
      attr2 => 104, target_attr2 => 104};
get_classes_modify_comprehend_attr({1, 4, 7}) ->
    #{classes => 1, target_classes => 4, type => 7,
      target_type => 7, attr1 => 101, target_attr1 => 102,
      attr2 => 102, target_attr2 => 103};
get_classes_modify_comprehend_attr({1, 4, 9}) ->
    #{classes => 1, target_classes => 4, type => 9,
      target_type => 9, attr1 => 101, target_attr1 => 105,
      attr2 => 102, target_attr2 => 102};
get_classes_modify_comprehend_attr({1, 4, 10}) ->
    #{classes => 1, target_classes => 4, type => 10,
      target_type => 10, attr1 => 105, target_attr1 => 105,
      attr2 => 102, target_attr2 => 102};
get_classes_modify_comprehend_attr({1, 4, 11}) ->
    #{classes => 1, target_classes => 4, type => 11,
      target_type => 11, attr1 => 101, target_attr1 => 104,
      attr2 => 105, target_attr2 => 105};
get_classes_modify_comprehend_attr({1, 4, 12}) ->
    #{classes => 1, target_classes => 4, type => 12,
      target_type => 12, attr1 => 104, target_attr1 => 104,
      attr2 => 102, target_attr2 => 102};
get_classes_modify_comprehend_attr({1, 4, 14}) ->
    #{classes => 1, target_classes => 4, type => 14,
      target_type => 14, attr1 => 104, target_attr1 => 104,
      attr2 => 105, target_attr2 => 105};
get_classes_modify_comprehend_attr({1, 5, 5}) ->
    #{classes => 1, target_classes => 5, type => 1,
      target_type => 5, attr1 => 101, target_attr1 => 104,
      attr2 => 104, target_attr2 => 105};
get_classes_modify_comprehend_attr({1, 5, 6}) ->
    #{classes => 1, target_classes => 5, type => 6,
      target_type => 6, attr1 => 101, target_attr1 => 102,
      attr2 => 104, target_attr2 => 104};
get_classes_modify_comprehend_attr({1, 5, 7}) ->
    #{classes => 1, target_classes => 5, type => 7,
      target_type => 7, attr1 => 101, target_attr1 => 102,
      attr2 => 102, target_attr2 => 103};
get_classes_modify_comprehend_attr({1, 5, 9}) ->
    #{classes => 1, target_classes => 5, type => 9,
      target_type => 9, attr1 => 101, target_attr1 => 105,
      attr2 => 102, target_attr2 => 102};
get_classes_modify_comprehend_attr({1, 5, 10}) ->
    #{classes => 1, target_classes => 5, type => 10,
      target_type => 10, attr1 => 105, target_attr1 => 105,
      attr2 => 102, target_attr2 => 102};
get_classes_modify_comprehend_attr({1, 5, 11}) ->
    #{classes => 1, target_classes => 5, type => 11,
      target_type => 11, attr1 => 101, target_attr1 => 104,
      attr2 => 105, target_attr2 => 105};
get_classes_modify_comprehend_attr({1, 5, 12}) ->
    #{classes => 1, target_classes => 5, type => 12,
      target_type => 12, attr1 => 104, target_attr1 => 104,
      attr2 => 102, target_attr2 => 102};
get_classes_modify_comprehend_attr({1, 5, 14}) ->
    #{classes => 1, target_classes => 5, type => 14,
      target_type => 14, attr1 => 104, target_attr1 => 104,
      attr2 => 105, target_attr2 => 105};
get_classes_modify_comprehend_attr({1, 6, 21}) ->
    #{classes => 1, target_classes => 6, type => 1,
      target_type => 21, attr1 => 101, target_attr1 => 103,
      attr2 => 104, target_attr2 => 105};
get_classes_modify_comprehend_attr({1, 6, 6}) ->
    #{classes => 1, target_classes => 6, type => 6,
      target_type => 6, attr1 => 101, target_attr1 => 102,
      attr2 => 104, target_attr2 => 104};
get_classes_modify_comprehend_attr({1, 6, 7}) ->
    #{classes => 1, target_classes => 6, type => 7,
      target_type => 7, attr1 => 101, target_attr1 => 103,
      attr2 => 102, target_attr2 => 102};
get_classes_modify_comprehend_attr({1, 6, 9}) ->
    #{classes => 1, target_classes => 6, type => 9,
      target_type => 9, attr1 => 101, target_attr1 => 105,
      attr2 => 102, target_attr2 => 102};
get_classes_modify_comprehend_attr({1, 6, 10}) ->
    #{classes => 1, target_classes => 6, type => 10,
      target_type => 10, attr1 => 105, target_attr1 => 103,
      attr2 => 102, target_attr2 => 105};
get_classes_modify_comprehend_attr({1, 6, 11}) ->
    #{classes => 1, target_classes => 6, type => 11,
      target_type => 11, attr1 => 101, target_attr1 => 105,
      attr2 => 105, target_attr2 => 104};
get_classes_modify_comprehend_attr({1, 6, 12}) ->
    #{classes => 1, target_classes => 6, type => 12,
      target_type => 12, attr1 => 104, target_attr1 => 103,
      attr2 => 102, target_attr2 => 102};
get_classes_modify_comprehend_attr({1, 6, 14}) ->
    #{classes => 1, target_classes => 6, type => 14,
      target_type => 14, attr1 => 104, target_attr1 => 103,
      attr2 => 105, target_attr2 => 104};
get_classes_modify_comprehend_attr({2, 1, 1}) ->
    #{classes => 2, target_classes => 1, type => 2,
      target_type => 1, attr1 => 103, target_attr1 => 101,
      attr2 => 105, target_attr2 => 104};
get_classes_modify_comprehend_attr({2, 1, 6}) ->
    #{classes => 2, target_classes => 1, type => 6,
      target_type => 6, attr1 => 102, target_attr1 => 101,
      attr2 => 104, target_attr2 => 104};
get_classes_modify_comprehend_attr({2, 1, 7}) ->
    #{classes => 2, target_classes => 1, type => 7,
      target_type => 7, attr1 => 103, target_attr1 => 101,
      attr2 => 102, target_attr2 => 102};
get_classes_modify_comprehend_attr({2, 1, 9}) ->
    #{classes => 2, target_classes => 1, type => 9,
      target_type => 9, attr1 => 105, target_attr1 => 101,
      attr2 => 102, target_attr2 => 102};
get_classes_modify_comprehend_attr({2, 1, 10}) ->
    #{classes => 2, target_classes => 1, type => 10,
      target_type => 10, attr1 => 103, target_attr1 => 105,
      attr2 => 105, target_attr2 => 102};
get_classes_modify_comprehend_attr({2, 1, 11}) ->
    #{classes => 2, target_classes => 1, type => 11,
      target_type => 11, attr1 => 105, target_attr1 => 101,
      attr2 => 104, target_attr2 => 105};
get_classes_modify_comprehend_attr({2, 1, 12}) ->
    #{classes => 2, target_classes => 1, type => 12,
      target_type => 12, attr1 => 103, target_attr1 => 104,
      attr2 => 102, target_attr2 => 102};
get_classes_modify_comprehend_attr({2, 1, 14}) ->
    #{classes => 2, target_classes => 1, type => 14,
      target_type => 14, attr1 => 103, target_attr1 => 104,
      attr2 => 104, target_attr2 => 105};
get_classes_modify_comprehend_attr({2, 3, 3}) ->
    #{classes => 2, target_classes => 3, type => 2,
      target_type => 3, attr1 => 103, target_attr1 => 101,
      attr2 => 105, target_attr2 => 104};
get_classes_modify_comprehend_attr({2, 3, 6}) ->
    #{classes => 2, target_classes => 3, type => 6,
      target_type => 6, attr1 => 102, target_attr1 => 101,
      attr2 => 104, target_attr2 => 104};
get_classes_modify_comprehend_attr({2, 3, 7}) ->
    #{classes => 2, target_classes => 3, type => 7,
      target_type => 7, attr1 => 103, target_attr1 => 101,
      attr2 => 102, target_attr2 => 102};
get_classes_modify_comprehend_attr({2, 3, 9}) ->
    #{classes => 2, target_classes => 3, type => 9,
      target_type => 9, attr1 => 105, target_attr1 => 101,
      attr2 => 102, target_attr2 => 102};
get_classes_modify_comprehend_attr({2, 3, 10}) ->
    #{classes => 2, target_classes => 3, type => 10,
      target_type => 10, attr1 => 103, target_attr1 => 105,
      attr2 => 105, target_attr2 => 102};
get_classes_modify_comprehend_attr({2, 3, 11}) ->
    #{classes => 2, target_classes => 3, type => 11,
      target_type => 11, attr1 => 105, target_attr1 => 101,
      attr2 => 104, target_attr2 => 105};
get_classes_modify_comprehend_attr({2, 3, 12}) ->
    #{classes => 2, target_classes => 3, type => 12,
      target_type => 12, attr1 => 103, target_attr1 => 104,
      attr2 => 102, target_attr2 => 102};
get_classes_modify_comprehend_attr({2, 3, 14}) ->
    #{classes => 2, target_classes => 3, type => 14,
      target_type => 14, attr1 => 103, target_attr1 => 104,
      attr2 => 104, target_attr2 => 105};
get_classes_modify_comprehend_attr({2, 4, 4}) ->
    #{classes => 2, target_classes => 4, type => 2,
      target_type => 4, attr1 => 103, target_attr1 => 104,
      attr2 => 105, target_attr2 => 105};
get_classes_modify_comprehend_attr({2, 4, 6}) ->
    #{classes => 2, target_classes => 4, type => 6,
      target_type => 6, attr1 => 102, target_attr1 => 102,
      attr2 => 104, target_attr2 => 104};
get_classes_modify_comprehend_attr({2, 4, 7}) ->
    #{classes => 2, target_classes => 4, type => 7,
      target_type => 7, attr1 => 103, target_attr1 => 102,
      attr2 => 102, target_attr2 => 103};
get_classes_modify_comprehend_attr({2, 4, 9}) ->
    #{classes => 2, target_classes => 4, type => 9,
      target_type => 9, attr1 => 105, target_attr1 => 105,
      attr2 => 102, target_attr2 => 102};
get_classes_modify_comprehend_attr({2, 4, 10}) ->
    #{classes => 2, target_classes => 4, type => 10,
      target_type => 10, attr1 => 103, target_attr1 => 105,
      attr2 => 105, target_attr2 => 102};
get_classes_modify_comprehend_attr({2, 4, 11}) ->
    #{classes => 2, target_classes => 4, type => 11,
      target_type => 11, attr1 => 105, target_attr1 => 105,
      attr2 => 104, target_attr2 => 104};
get_classes_modify_comprehend_attr({2, 4, 12}) ->
    #{classes => 2, target_classes => 4, type => 12,
      target_type => 12, attr1 => 103, target_attr1 => 104,
      attr2 => 102, target_attr2 => 102};
get_classes_modify_comprehend_attr({2, 4, 14}) ->
    #{classes => 2, target_classes => 4, type => 14,
      target_type => 14, attr1 => 103, target_attr1 => 104,
      attr2 => 104, target_attr2 => 105};
get_classes_modify_comprehend_attr({2, 5, 5}) ->
    #{classes => 2, target_classes => 5, type => 2,
      target_type => 5, attr1 => 103, target_attr1 => 104,
      attr2 => 105, target_attr2 => 105};
get_classes_modify_comprehend_attr({2, 5, 6}) ->
    #{classes => 2, target_classes => 5, type => 6,
      target_type => 6, attr1 => 102, target_attr1 => 102,
      attr2 => 104, target_attr2 => 104};
get_classes_modify_comprehend_attr({2, 5, 7}) ->
    #{classes => 2, target_classes => 5, type => 7,
      target_type => 7, attr1 => 103, target_attr1 => 102,
      attr2 => 102, target_attr2 => 103};
get_classes_modify_comprehend_attr({2, 5, 9}) ->
    #{classes => 2, target_classes => 5, type => 9,
      target_type => 9, attr1 => 105, target_attr1 => 105,
      attr2 => 102, target_attr2 => 102};
get_classes_modify_comprehend_attr({2, 5, 10}) ->
    #{classes => 2, target_classes => 5, type => 10,
      target_type => 10, attr1 => 103, target_attr1 => 105,
      attr2 => 105, target_attr2 => 102};
get_classes_modify_comprehend_attr({2, 5, 11}) ->
    #{classes => 2, target_classes => 5, type => 11,
      target_type => 11, attr1 => 105, target_attr1 => 105,
      attr2 => 104, target_attr2 => 104};
get_classes_modify_comprehend_attr({2, 5, 12}) ->
    #{classes => 2, target_classes => 5, type => 12,
      target_type => 12, attr1 => 103, target_attr1 => 104,
      attr2 => 102, target_attr2 => 102};
get_classes_modify_comprehend_attr({2, 5, 14}) ->
    #{classes => 2, target_classes => 5, type => 14,
      target_type => 14, attr1 => 103, target_attr1 => 104,
      attr2 => 104, target_attr2 => 105};
get_classes_modify_comprehend_attr({2, 7, 22}) ->
    #{classes => 2, target_classes => 7, type => 2,
      target_type => 22, attr1 => 103, target_attr1 => 101,
      attr2 => 105, target_attr2 => 104};
get_classes_modify_comprehend_attr({2, 7, 6}) ->
    #{classes => 2, target_classes => 7, type => 6,
      target_type => 6, attr1 => 102, target_attr1 => 101,
      attr2 => 104, target_attr2 => 104};
get_classes_modify_comprehend_attr({2, 7, 7}) ->
    #{classes => 2, target_classes => 7, type => 7,
      target_type => 7, attr1 => 103, target_attr1 => 101,
      attr2 => 102, target_attr2 => 102};
get_classes_modify_comprehend_attr({2, 7, 9}) ->
    #{classes => 2, target_classes => 7, type => 9,
      target_type => 9, attr1 => 105, target_attr1 => 101,
      attr2 => 102, target_attr2 => 102};
get_classes_modify_comprehend_attr({2, 7, 10}) ->
    #{classes => 2, target_classes => 7, type => 10,
      target_type => 10, attr1 => 103, target_attr1 => 105,
      attr2 => 105, target_attr2 => 102};
get_classes_modify_comprehend_attr({2, 7, 11}) ->
    #{classes => 2, target_classes => 7, type => 11,
      target_type => 11, attr1 => 105, target_attr1 => 101,
      attr2 => 104, target_attr2 => 105};
get_classes_modify_comprehend_attr({2, 7, 12}) ->
    #{classes => 2, target_classes => 7, type => 12,
      target_type => 12, attr1 => 103, target_attr1 => 104,
      attr2 => 102, target_attr2 => 102};
get_classes_modify_comprehend_attr({2, 7, 14}) ->
    #{classes => 2, target_classes => 7, type => 14,
      target_type => 14, attr1 => 103, target_attr1 => 104,
      attr2 => 104, target_attr2 => 105};
get_classes_modify_comprehend_attr({3, 2, 2}) ->
    #{classes => 3, target_classes => 2, type => 3,
      target_type => 2, attr1 => 101, target_attr1 => 103,
      attr2 => 104, target_attr2 => 105};
get_classes_modify_comprehend_attr({3, 2, 6}) ->
    #{classes => 3, target_classes => 2, type => 6,
      target_type => 6, attr1 => 101, target_attr1 => 102,
      attr2 => 104, target_attr2 => 104};
get_classes_modify_comprehend_attr({3, 2, 7}) ->
    #{classes => 3, target_classes => 2, type => 7,
      target_type => 7, attr1 => 101, target_attr1 => 103,
      attr2 => 102, target_attr2 => 102};
get_classes_modify_comprehend_attr({3, 2, 9}) ->
    #{classes => 3, target_classes => 2, type => 9,
      target_type => 9, attr1 => 101, target_attr1 => 105,
      attr2 => 102, target_attr2 => 102};
get_classes_modify_comprehend_attr({3, 2, 10}) ->
    #{classes => 3, target_classes => 2, type => 10,
      target_type => 10, attr1 => 105, target_attr1 => 103,
      attr2 => 102, target_attr2 => 105};
get_classes_modify_comprehend_attr({3, 2, 11}) ->
    #{classes => 3, target_classes => 2, type => 11,
      target_type => 11, attr1 => 101, target_attr1 => 105,
      attr2 => 105, target_attr2 => 104};
get_classes_modify_comprehend_attr({3, 2, 12}) ->
    #{classes => 3, target_classes => 2, type => 12,
      target_type => 12, attr1 => 104, target_attr1 => 103,
      attr2 => 102, target_attr2 => 102};
get_classes_modify_comprehend_attr({3, 2, 14}) ->
    #{classes => 3, target_classes => 2, type => 14,
      target_type => 14, attr1 => 104, target_attr1 => 103,
      attr2 => 105, target_attr2 => 104};
get_classes_modify_comprehend_attr({3, 4, 4}) ->
    #{classes => 3, target_classes => 4, type => 3,
      target_type => 4, attr1 => 101, target_attr1 => 104,
      attr2 => 104, target_attr2 => 105};
get_classes_modify_comprehend_attr({3, 4, 6}) ->
    #{classes => 3, target_classes => 4, type => 6,
      target_type => 6, attr1 => 101, target_attr1 => 102,
      attr2 => 104, target_attr2 => 104};
get_classes_modify_comprehend_attr({3, 4, 7}) ->
    #{classes => 3, target_classes => 4, type => 7,
      target_type => 7, attr1 => 101, target_attr1 => 102,
      attr2 => 102, target_attr2 => 103};
get_classes_modify_comprehend_attr({3, 4, 9}) ->
    #{classes => 3, target_classes => 4, type => 9,
      target_type => 9, attr1 => 101, target_attr1 => 105,
      attr2 => 102, target_attr2 => 102};
get_classes_modify_comprehend_attr({3, 4, 10}) ->
    #{classes => 3, target_classes => 4, type => 10,
      target_type => 10, attr1 => 105, target_attr1 => 105,
      attr2 => 102, target_attr2 => 102};
get_classes_modify_comprehend_attr({3, 4, 11}) ->
    #{classes => 3, target_classes => 4, type => 11,
      target_type => 11, attr1 => 101, target_attr1 => 104,
      attr2 => 105, target_attr2 => 105};
get_classes_modify_comprehend_attr({3, 4, 12}) ->
    #{classes => 3, target_classes => 4, type => 12,
      target_type => 12, attr1 => 104, target_attr1 => 104,
      attr2 => 102, target_attr2 => 102};
get_classes_modify_comprehend_attr({3, 4, 14}) ->
    #{classes => 3, target_classes => 4, type => 14,
      target_type => 14, attr1 => 104, target_attr1 => 104,
      attr2 => 105, target_attr2 => 105};
get_classes_modify_comprehend_attr({3, 5, 5}) ->
    #{classes => 3, target_classes => 5, type => 3,
      target_type => 5, attr1 => 101, target_attr1 => 104,
      attr2 => 104, target_attr2 => 105};
get_classes_modify_comprehend_attr({3, 5, 6}) ->
    #{classes => 3, target_classes => 5, type => 6,
      target_type => 6, attr1 => 101, target_attr1 => 102,
      attr2 => 104, target_attr2 => 104};
get_classes_modify_comprehend_attr({3, 5, 7}) ->
    #{classes => 3, target_classes => 5, type => 7,
      target_type => 7, attr1 => 101, target_attr1 => 102,
      attr2 => 102, target_attr2 => 103};
get_classes_modify_comprehend_attr({3, 5, 9}) ->
    #{classes => 3, target_classes => 5, type => 9,
      target_type => 9, attr1 => 101, target_attr1 => 105,
      attr2 => 102, target_attr2 => 102};
get_classes_modify_comprehend_attr({3, 5, 10}) ->
    #{classes => 3, target_classes => 5, type => 10,
      target_type => 10, attr1 => 105, target_attr1 => 105,
      attr2 => 102, target_attr2 => 102};
get_classes_modify_comprehend_attr({3, 5, 11}) ->
    #{classes => 3, target_classes => 5, type => 11,
      target_type => 11, attr1 => 101, target_attr1 => 104,
      attr2 => 105, target_attr2 => 105};
get_classes_modify_comprehend_attr({3, 5, 12}) ->
    #{classes => 3, target_classes => 5, type => 12,
      target_type => 12, attr1 => 104, target_attr1 => 104,
      attr2 => 102, target_attr2 => 102};
get_classes_modify_comprehend_attr({3, 5, 14}) ->
    #{classes => 3, target_classes => 5, type => 14,
      target_type => 14, attr1 => 104, target_attr1 => 104,
      attr2 => 105, target_attr2 => 105};
get_classes_modify_comprehend_attr({3, 6, 21}) ->
    #{classes => 3, target_classes => 6, type => 3,
      target_type => 21, attr1 => 101, target_attr1 => 103,
      attr2 => 104, target_attr2 => 105};
get_classes_modify_comprehend_attr({3, 6, 6}) ->
    #{classes => 3, target_classes => 6, type => 6,
      target_type => 6, attr1 => 101, target_attr1 => 102,
      attr2 => 104, target_attr2 => 104};
get_classes_modify_comprehend_attr({3, 6, 7}) ->
    #{classes => 3, target_classes => 6, type => 7,
      target_type => 7, attr1 => 101, target_attr1 => 103,
      attr2 => 102, target_attr2 => 102};
get_classes_modify_comprehend_attr({3, 6, 9}) ->
    #{classes => 3, target_classes => 6, type => 9,
      target_type => 9, attr1 => 101, target_attr1 => 105,
      attr2 => 102, target_attr2 => 102};
get_classes_modify_comprehend_attr({3, 6, 10}) ->
    #{classes => 3, target_classes => 6, type => 10,
      target_type => 10, attr1 => 105, target_attr1 => 103,
      attr2 => 102, target_attr2 => 105};
get_classes_modify_comprehend_attr({3, 6, 11}) ->
    #{classes => 3, target_classes => 6, type => 11,
      target_type => 11, attr1 => 101, target_attr1 => 105,
      attr2 => 105, target_attr2 => 104};
get_classes_modify_comprehend_attr({3, 6, 12}) ->
    #{classes => 3, target_classes => 6, type => 12,
      target_type => 12, attr1 => 104, target_attr1 => 103,
      attr2 => 102, target_attr2 => 102};
get_classes_modify_comprehend_attr({3, 6, 14}) ->
    #{classes => 3, target_classes => 6, type => 14,
      target_type => 14, attr1 => 104, target_attr1 => 103,
      attr2 => 105, target_attr2 => 104};
get_classes_modify_comprehend_attr({4, 1, 1}) ->
    #{classes => 4, target_classes => 1, type => 4,
      target_type => 1, attr1 => 104, target_attr1 => 101,
      attr2 => 105, target_attr2 => 104};
get_classes_modify_comprehend_attr({4, 1, 6}) ->
    #{classes => 4, target_classes => 1, type => 6,
      target_type => 6, attr1 => 102, target_attr1 => 101,
      attr2 => 104, target_attr2 => 104};
get_classes_modify_comprehend_attr({4, 1, 7}) ->
    #{classes => 4, target_classes => 1, type => 7,
      target_type => 7, attr1 => 102, target_attr1 => 101,
      attr2 => 103, target_attr2 => 102};
get_classes_modify_comprehend_attr({4, 1, 9}) ->
    #{classes => 4, target_classes => 1, type => 9,
      target_type => 9, attr1 => 105, target_attr1 => 101,
      attr2 => 102, target_attr2 => 102};
get_classes_modify_comprehend_attr({4, 1, 10}) ->
    #{classes => 4, target_classes => 1, type => 10,
      target_type => 10, attr1 => 105, target_attr1 => 105,
      attr2 => 102, target_attr2 => 102};
get_classes_modify_comprehend_attr({4, 1, 11}) ->
    #{classes => 4, target_classes => 1, type => 11,
      target_type => 11, attr1 => 104, target_attr1 => 101,
      attr2 => 105, target_attr2 => 105};
get_classes_modify_comprehend_attr({4, 1, 12}) ->
    #{classes => 4, target_classes => 1, type => 12,
      target_type => 12, attr1 => 104, target_attr1 => 104,
      attr2 => 102, target_attr2 => 102};
get_classes_modify_comprehend_attr({4, 1, 14}) ->
    #{classes => 4, target_classes => 1, type => 14,
      target_type => 14, attr1 => 104, target_attr1 => 104,
      attr2 => 105, target_attr2 => 105};
get_classes_modify_comprehend_attr({4, 2, 2}) ->
    #{classes => 4, target_classes => 2, type => 4,
      target_type => 2, attr1 => 104, target_attr1 => 103,
      attr2 => 105, target_attr2 => 105};
get_classes_modify_comprehend_attr({4, 2, 6}) ->
    #{classes => 4, target_classes => 2, type => 6,
      target_type => 6, attr1 => 102, target_attr1 => 102,
      attr2 => 104, target_attr2 => 104};
get_classes_modify_comprehend_attr({4, 2, 7}) ->
    #{classes => 4, target_classes => 2, type => 7,
      target_type => 7, attr1 => 102, target_attr1 => 103,
      attr2 => 103, target_attr2 => 102};
get_classes_modify_comprehend_attr({4, 2, 9}) ->
    #{classes => 4, target_classes => 2, type => 9,
      target_type => 9, attr1 => 105, target_attr1 => 105,
      attr2 => 102, target_attr2 => 102};
get_classes_modify_comprehend_attr({4, 2, 10}) ->
    #{classes => 4, target_classes => 2, type => 10,
      target_type => 10, attr1 => 105, target_attr1 => 103,
      attr2 => 102, target_attr2 => 105};
get_classes_modify_comprehend_attr({4, 2, 11}) ->
    #{classes => 4, target_classes => 2, type => 11,
      target_type => 11, attr1 => 104, target_attr1 => 104,
      attr2 => 105, target_attr2 => 105};
get_classes_modify_comprehend_attr({4, 2, 12}) ->
    #{classes => 4, target_classes => 2, type => 12,
      target_type => 12, attr1 => 104, target_attr1 => 103,
      attr2 => 102, target_attr2 => 102};
get_classes_modify_comprehend_attr({4, 2, 14}) ->
    #{classes => 4, target_classes => 2, type => 14,
      target_type => 14, attr1 => 104, target_attr1 => 103,
      attr2 => 105, target_attr2 => 104};
get_classes_modify_comprehend_attr({4, 3, 3}) ->
    #{classes => 4, target_classes => 3, type => 4,
      target_type => 3, attr1 => 104, target_attr1 => 101,
      attr2 => 105, target_attr2 => 104};
get_classes_modify_comprehend_attr({4, 3, 6}) ->
    #{classes => 4, target_classes => 3, type => 6,
      target_type => 6, attr1 => 102, target_attr1 => 101,
      attr2 => 104, target_attr2 => 104};
get_classes_modify_comprehend_attr({4, 3, 7}) ->
    #{classes => 4, target_classes => 3, type => 7,
      target_type => 7, attr1 => 102, target_attr1 => 101,
      attr2 => 103, target_attr2 => 102};
get_classes_modify_comprehend_attr({4, 3, 9}) ->
    #{classes => 4, target_classes => 3, type => 9,
      target_type => 9, attr1 => 105, target_attr1 => 101,
      attr2 => 102, target_attr2 => 102};
get_classes_modify_comprehend_attr({4, 3, 10}) ->
    #{classes => 4, target_classes => 3, type => 10,
      target_type => 10, attr1 => 105, target_attr1 => 105,
      attr2 => 102, target_attr2 => 102};
get_classes_modify_comprehend_attr({4, 3, 11}) ->
    #{classes => 4, target_classes => 3, type => 11,
      target_type => 11, attr1 => 104, target_attr1 => 101,
      attr2 => 105, target_attr2 => 105};
get_classes_modify_comprehend_attr({4, 3, 12}) ->
    #{classes => 4, target_classes => 3, type => 12,
      target_type => 12, attr1 => 104, target_attr1 => 104,
      attr2 => 102, target_attr2 => 102};
get_classes_modify_comprehend_attr({4, 3, 14}) ->
    #{classes => 4, target_classes => 3, type => 14,
      target_type => 14, attr1 => 104, target_attr1 => 104,
      attr2 => 105, target_attr2 => 105};
get_classes_modify_comprehend_attr({4, 6, 21}) ->
    #{classes => 4, target_classes => 6, type => 4,
      target_type => 21, attr1 => 104, target_attr1 => 103,
      attr2 => 105, target_attr2 => 105};
get_classes_modify_comprehend_attr({4, 6, 6}) ->
    #{classes => 4, target_classes => 6, type => 6,
      target_type => 6, attr1 => 102, target_attr1 => 102,
      attr2 => 104, target_attr2 => 104};
get_classes_modify_comprehend_attr({4, 6, 7}) ->
    #{classes => 4, target_classes => 6, type => 7,
      target_type => 7, attr1 => 102, target_attr1 => 103,
      attr2 => 103, target_attr2 => 102};
get_classes_modify_comprehend_attr({4, 6, 9}) ->
    #{classes => 4, target_classes => 6, type => 9,
      target_type => 9, attr1 => 105, target_attr1 => 105,
      attr2 => 102, target_attr2 => 102};
get_classes_modify_comprehend_attr({4, 6, 10}) ->
    #{classes => 4, target_classes => 6, type => 10,
      target_type => 10, attr1 => 105, target_attr1 => 103,
      attr2 => 102, target_attr2 => 105};
get_classes_modify_comprehend_attr({4, 6, 11}) ->
    #{classes => 4, target_classes => 6, type => 11,
      target_type => 11, attr1 => 104, target_attr1 => 104,
      attr2 => 105, target_attr2 => 105};
get_classes_modify_comprehend_attr({4, 6, 12}) ->
    #{classes => 4, target_classes => 6, type => 12,
      target_type => 12, attr1 => 104, target_attr1 => 103,
      attr2 => 102, target_attr2 => 102};
get_classes_modify_comprehend_attr({4, 6, 14}) ->
    #{classes => 4, target_classes => 6, type => 14,
      target_type => 14, attr1 => 104, target_attr1 => 103,
      attr2 => 105, target_attr2 => 104};
get_classes_modify_comprehend_attr({4, 7, 22}) ->
    #{classes => 4, target_classes => 7, type => 4,
      target_type => 22, attr1 => 104, target_attr1 => 101,
      attr2 => 105, target_attr2 => 104};
get_classes_modify_comprehend_attr({4, 7, 6}) ->
    #{classes => 4, target_classes => 7, type => 6,
      target_type => 6, attr1 => 102, target_attr1 => 101,
      attr2 => 104, target_attr2 => 104};
get_classes_modify_comprehend_attr({4, 7, 7}) ->
    #{classes => 4, target_classes => 7, type => 7,
      target_type => 7, attr1 => 102, target_attr1 => 101,
      attr2 => 103, target_attr2 => 102};
get_classes_modify_comprehend_attr({4, 7, 9}) ->
    #{classes => 4, target_classes => 7, type => 9,
      target_type => 9, attr1 => 105, target_attr1 => 101,
      attr2 => 102, target_attr2 => 102};
get_classes_modify_comprehend_attr({4, 7, 10}) ->
    #{classes => 4, target_classes => 7, type => 10,
      target_type => 10, attr1 => 105, target_attr1 => 105,
      attr2 => 102, target_attr2 => 102};
get_classes_modify_comprehend_attr({4, 7, 11}) ->
    #{classes => 4, target_classes => 7, type => 11,
      target_type => 11, attr1 => 104, target_attr1 => 101,
      attr2 => 105, target_attr2 => 105};
get_classes_modify_comprehend_attr({4, 7, 12}) ->
    #{classes => 4, target_classes => 7, type => 12,
      target_type => 12, attr1 => 104, target_attr1 => 104,
      attr2 => 102, target_attr2 => 102};
get_classes_modify_comprehend_attr({4, 7, 14}) ->
    #{classes => 4, target_classes => 7, type => 14,
      target_type => 14, attr1 => 104, target_attr1 => 104,
      attr2 => 105, target_attr2 => 105};
get_classes_modify_comprehend_attr({5, 1, 1}) ->
    #{classes => 5, target_classes => 1, type => 5,
      target_type => 1, attr1 => 104, target_attr1 => 101,
      attr2 => 105, target_attr2 => 104};
get_classes_modify_comprehend_attr({5, 1, 6}) ->
    #{classes => 5, target_classes => 1, type => 6,
      target_type => 6, attr1 => 102, target_attr1 => 101,
      attr2 => 104, target_attr2 => 104};
get_classes_modify_comprehend_attr({5, 1, 7}) ->
    #{classes => 5, target_classes => 1, type => 7,
      target_type => 7, attr1 => 102, target_attr1 => 101,
      attr2 => 103, target_attr2 => 102};
get_classes_modify_comprehend_attr({5, 1, 9}) ->
    #{classes => 5, target_classes => 1, type => 9,
      target_type => 9, attr1 => 105, target_attr1 => 101,
      attr2 => 102, target_attr2 => 102};
get_classes_modify_comprehend_attr({5, 1, 10}) ->
    #{classes => 5, target_classes => 1, type => 10,
      target_type => 10, attr1 => 105, target_attr1 => 105,
      attr2 => 102, target_attr2 => 102};
get_classes_modify_comprehend_attr({5, 1, 11}) ->
    #{classes => 5, target_classes => 1, type => 11,
      target_type => 11, attr1 => 104, target_attr1 => 101,
      attr2 => 105, target_attr2 => 105};
get_classes_modify_comprehend_attr({5, 1, 12}) ->
    #{classes => 5, target_classes => 1, type => 12,
      target_type => 12, attr1 => 104, target_attr1 => 104,
      attr2 => 102, target_attr2 => 102};
get_classes_modify_comprehend_attr({5, 1, 14}) ->
    #{classes => 5, target_classes => 1, type => 14,
      target_type => 14, attr1 => 104, target_attr1 => 104,
      attr2 => 105, target_attr2 => 105};
get_classes_modify_comprehend_attr({5, 2, 2}) ->
    #{classes => 5, target_classes => 2, type => 5,
      target_type => 2, attr1 => 104, target_attr1 => 103,
      attr2 => 105, target_attr2 => 105};
get_classes_modify_comprehend_attr({5, 2, 6}) ->
    #{classes => 5, target_classes => 2, type => 6,
      target_type => 6, attr1 => 102, target_attr1 => 102,
      attr2 => 104, target_attr2 => 104};
get_classes_modify_comprehend_attr({5, 2, 7}) ->
    #{classes => 5, target_classes => 2, type => 7,
      target_type => 7, attr1 => 102, target_attr1 => 103,
      attr2 => 103, target_attr2 => 102};
get_classes_modify_comprehend_attr({5, 2, 9}) ->
    #{classes => 5, target_classes => 2, type => 9,
      target_type => 9, attr1 => 105, target_attr1 => 105,
      attr2 => 102, target_attr2 => 102};
get_classes_modify_comprehend_attr({5, 2, 10}) ->
    #{classes => 5, target_classes => 2, type => 10,
      target_type => 10, attr1 => 105, target_attr1 => 103,
      attr2 => 102, target_attr2 => 105};
get_classes_modify_comprehend_attr({5, 2, 11}) ->
    #{classes => 5, target_classes => 2, type => 11,
      target_type => 11, attr1 => 104, target_attr1 => 104,
      attr2 => 105, target_attr2 => 105};
get_classes_modify_comprehend_attr({5, 2, 12}) ->
    #{classes => 5, target_classes => 2, type => 12,
      target_type => 12, attr1 => 104, target_attr1 => 103,
      attr2 => 102, target_attr2 => 102};
get_classes_modify_comprehend_attr({5, 2, 14}) ->
    #{classes => 5, target_classes => 2, type => 14,
      target_type => 14, attr1 => 104, target_attr1 => 103,
      attr2 => 105, target_attr2 => 104};
get_classes_modify_comprehend_attr({5, 3, 3}) ->
    #{classes => 5, target_classes => 3, type => 5,
      target_type => 3, attr1 => 104, target_attr1 => 101,
      attr2 => 105, target_attr2 => 104};
get_classes_modify_comprehend_attr({5, 3, 6}) ->
    #{classes => 5, target_classes => 3, type => 6,
      target_type => 6, attr1 => 102, target_attr1 => 101,
      attr2 => 104, target_attr2 => 104};
get_classes_modify_comprehend_attr({5, 3, 7}) ->
    #{classes => 5, target_classes => 3, type => 7,
      target_type => 7, attr1 => 102, target_attr1 => 101,
      attr2 => 103, target_attr2 => 102};
get_classes_modify_comprehend_attr({5, 3, 9}) ->
    #{classes => 5, target_classes => 3, type => 9,
      target_type => 9, attr1 => 105, target_attr1 => 101,
      attr2 => 102, target_attr2 => 102};
get_classes_modify_comprehend_attr({5, 3, 10}) ->
    #{classes => 5, target_classes => 3, type => 10,
      target_type => 10, attr1 => 105, target_attr1 => 105,
      attr2 => 102, target_attr2 => 102};
get_classes_modify_comprehend_attr({5, 3, 11}) ->
    #{classes => 5, target_classes => 3, type => 11,
      target_type => 11, attr1 => 104, target_attr1 => 101,
      attr2 => 105, target_attr2 => 105};
get_classes_modify_comprehend_attr({5, 3, 12}) ->
    #{classes => 5, target_classes => 3, type => 12,
      target_type => 12, attr1 => 104, target_attr1 => 104,
      attr2 => 102, target_attr2 => 102};
get_classes_modify_comprehend_attr({5, 3, 14}) ->
    #{classes => 5, target_classes => 3, type => 14,
      target_type => 14, attr1 => 104, target_attr1 => 104,
      attr2 => 105, target_attr2 => 105};
get_classes_modify_comprehend_attr({5, 6, 21}) ->
    #{classes => 5, target_classes => 6, type => 5,
      target_type => 21, attr1 => 104, target_attr1 => 103,
      attr2 => 105, target_attr2 => 105};
get_classes_modify_comprehend_attr({5, 6, 6}) ->
    #{classes => 5, target_classes => 6, type => 6,
      target_type => 6, attr1 => 102, target_attr1 => 102,
      attr2 => 104, target_attr2 => 104};
get_classes_modify_comprehend_attr({5, 6, 7}) ->
    #{classes => 5, target_classes => 6, type => 7,
      target_type => 7, attr1 => 102, target_attr1 => 103,
      attr2 => 103, target_attr2 => 102};
get_classes_modify_comprehend_attr({5, 6, 9}) ->
    #{classes => 5, target_classes => 6, type => 9,
      target_type => 9, attr1 => 105, target_attr1 => 105,
      attr2 => 102, target_attr2 => 102};
get_classes_modify_comprehend_attr({5, 6, 10}) ->
    #{classes => 5, target_classes => 6, type => 10,
      target_type => 10, attr1 => 105, target_attr1 => 103,
      attr2 => 102, target_attr2 => 105};
get_classes_modify_comprehend_attr({5, 6, 11}) ->
    #{classes => 5, target_classes => 6, type => 11,
      target_type => 11, attr1 => 104, target_attr1 => 104,
      attr2 => 105, target_attr2 => 105};
get_classes_modify_comprehend_attr({5, 6, 12}) ->
    #{classes => 5, target_classes => 6, type => 12,
      target_type => 12, attr1 => 104, target_attr1 => 103,
      attr2 => 102, target_attr2 => 102};
get_classes_modify_comprehend_attr({5, 6, 14}) ->
    #{classes => 5, target_classes => 6, type => 14,
      target_type => 14, attr1 => 104, target_attr1 => 103,
      attr2 => 105, target_attr2 => 104};
get_classes_modify_comprehend_attr({5, 7, 22}) ->
    #{classes => 5, target_classes => 7, type => 5,
      target_type => 22, attr1 => 104, target_attr1 => 101,
      attr2 => 105, target_attr2 => 104};
get_classes_modify_comprehend_attr({5, 7, 6}) ->
    #{classes => 5, target_classes => 7, type => 6,
      target_type => 6, attr1 => 102, target_attr1 => 101,
      attr2 => 104, target_attr2 => 104};
get_classes_modify_comprehend_attr({5, 7, 7}) ->
    #{classes => 5, target_classes => 7, type => 7,
      target_type => 7, attr1 => 102, target_attr1 => 101,
      attr2 => 103, target_attr2 => 102};
get_classes_modify_comprehend_attr({5, 7, 9}) ->
    #{classes => 5, target_classes => 7, type => 9,
      target_type => 9, attr1 => 105, target_attr1 => 101,
      attr2 => 102, target_attr2 => 102};
get_classes_modify_comprehend_attr({5, 7, 10}) ->
    #{classes => 5, target_classes => 7, type => 10,
      target_type => 10, attr1 => 105, target_attr1 => 105,
      attr2 => 102, target_attr2 => 102};
get_classes_modify_comprehend_attr({5, 7, 11}) ->
    #{classes => 5, target_classes => 7, type => 11,
      target_type => 11, attr1 => 104, target_attr1 => 101,
      attr2 => 105, target_attr2 => 105};
get_classes_modify_comprehend_attr({5, 7, 12}) ->
    #{classes => 5, target_classes => 7, type => 12,
      target_type => 12, attr1 => 104, target_attr1 => 104,
      attr2 => 102, target_attr2 => 102};
get_classes_modify_comprehend_attr({5, 7, 14}) ->
    #{classes => 5, target_classes => 7, type => 14,
      target_type => 14, attr1 => 104, target_attr1 => 104,
      attr2 => 105, target_attr2 => 105};
get_classes_modify_comprehend_attr({6, 1, 1}) ->
    #{classes => 6, target_classes => 1, type => 21,
      target_type => 1, attr1 => 103, target_attr1 => 101,
      attr2 => 105, target_attr2 => 104};
get_classes_modify_comprehend_attr({6, 1, 6}) ->
    #{classes => 6, target_classes => 1, type => 6,
      target_type => 6, attr1 => 102, target_attr1 => 101,
      attr2 => 104, target_attr2 => 104};
get_classes_modify_comprehend_attr({6, 1, 7}) ->
    #{classes => 6, target_classes => 1, type => 7,
      target_type => 7, attr1 => 103, target_attr1 => 101,
      attr2 => 102, target_attr2 => 102};
get_classes_modify_comprehend_attr({6, 1, 9}) ->
    #{classes => 6, target_classes => 1, type => 9,
      target_type => 9, attr1 => 105, target_attr1 => 101,
      attr2 => 102, target_attr2 => 102};
get_classes_modify_comprehend_attr({6, 1, 10}) ->
    #{classes => 6, target_classes => 1, type => 10,
      target_type => 10, attr1 => 103, target_attr1 => 105,
      attr2 => 105, target_attr2 => 102};
get_classes_modify_comprehend_attr({6, 1, 11}) ->
    #{classes => 6, target_classes => 1, type => 11,
      target_type => 11, attr1 => 105, target_attr1 => 101,
      attr2 => 104, target_attr2 => 105};
get_classes_modify_comprehend_attr({6, 1, 12}) ->
    #{classes => 6, target_classes => 1, type => 12,
      target_type => 12, attr1 => 103, target_attr1 => 104,
      attr2 => 102, target_attr2 => 102};
get_classes_modify_comprehend_attr({6, 1, 14}) ->
    #{classes => 6, target_classes => 1, type => 14,
      target_type => 14, attr1 => 103, target_attr1 => 104,
      attr2 => 104, target_attr2 => 105};
get_classes_modify_comprehend_attr({6, 3, 3}) ->
    #{classes => 6, target_classes => 3, type => 21,
      target_type => 3, attr1 => 103, target_attr1 => 101,
      attr2 => 105, target_attr2 => 104};
get_classes_modify_comprehend_attr({6, 3, 6}) ->
    #{classes => 6, target_classes => 3, type => 6,
      target_type => 6, attr1 => 102, target_attr1 => 101,
      attr2 => 104, target_attr2 => 104};
get_classes_modify_comprehend_attr({6, 3, 7}) ->
    #{classes => 6, target_classes => 3, type => 7,
      target_type => 7, attr1 => 103, target_attr1 => 101,
      attr2 => 102, target_attr2 => 102};
get_classes_modify_comprehend_attr({6, 3, 9}) ->
    #{classes => 6, target_classes => 3, type => 9,
      target_type => 9, attr1 => 105, target_attr1 => 101,
      attr2 => 102, target_attr2 => 102};
get_classes_modify_comprehend_attr({6, 3, 10}) ->
    #{classes => 6, target_classes => 3, type => 10,
      target_type => 10, attr1 => 103, target_attr1 => 105,
      attr2 => 105, target_attr2 => 102};
get_classes_modify_comprehend_attr({6, 3, 11}) ->
    #{classes => 6, target_classes => 3, type => 11,
      target_type => 11, attr1 => 105, target_attr1 => 101,
      attr2 => 104, target_attr2 => 105};
get_classes_modify_comprehend_attr({6, 3, 12}) ->
    #{classes => 6, target_classes => 3, type => 12,
      target_type => 12, attr1 => 103, target_attr1 => 104,
      attr2 => 102, target_attr2 => 102};
get_classes_modify_comprehend_attr({6, 3, 14}) ->
    #{classes => 6, target_classes => 3, type => 14,
      target_type => 14, attr1 => 103, target_attr1 => 104,
      attr2 => 104, target_attr2 => 105};
get_classes_modify_comprehend_attr({6, 4, 4}) ->
    #{classes => 6, target_classes => 4, type => 21,
      target_type => 4, attr1 => 103, target_attr1 => 104,
      attr2 => 105, target_attr2 => 105};
get_classes_modify_comprehend_attr({6, 4, 6}) ->
    #{classes => 6, target_classes => 4, type => 6,
      target_type => 6, attr1 => 102, target_attr1 => 102,
      attr2 => 104, target_attr2 => 104};
get_classes_modify_comprehend_attr({6, 4, 7}) ->
    #{classes => 6, target_classes => 4, type => 7,
      target_type => 7, attr1 => 103, target_attr1 => 102,
      attr2 => 102, target_attr2 => 103};
get_classes_modify_comprehend_attr({6, 4, 9}) ->
    #{classes => 6, target_classes => 4, type => 9,
      target_type => 9, attr1 => 105, target_attr1 => 105,
      attr2 => 102, target_attr2 => 102};
get_classes_modify_comprehend_attr({6, 4, 10}) ->
    #{classes => 6, target_classes => 4, type => 10,
      target_type => 10, attr1 => 103, target_attr1 => 105,
      attr2 => 105, target_attr2 => 102};
get_classes_modify_comprehend_attr({6, 4, 11}) ->
    #{classes => 6, target_classes => 4, type => 11,
      target_type => 11, attr1 => 104, target_attr1 => 104,
      attr2 => 105, target_attr2 => 105};
get_classes_modify_comprehend_attr({6, 4, 12}) ->
    #{classes => 6, target_classes => 4, type => 12,
      target_type => 12, attr1 => 103, target_attr1 => 104,
      attr2 => 102, target_attr2 => 102};
get_classes_modify_comprehend_attr({6, 4, 14}) ->
    #{classes => 6, target_classes => 4, type => 14,
      target_type => 14, attr1 => 103, target_attr1 => 104,
      attr2 => 104, target_attr2 => 105};
get_classes_modify_comprehend_attr({6, 5, 5}) ->
    #{classes => 6, target_classes => 5, type => 21,
      target_type => 5, attr1 => 103, target_attr1 => 104,
      attr2 => 105, target_attr2 => 105};
get_classes_modify_comprehend_attr({6, 5, 6}) ->
    #{classes => 6, target_classes => 5, type => 6,
      target_type => 6, attr1 => 102, target_attr1 => 102,
      attr2 => 104, target_attr2 => 104};
get_classes_modify_comprehend_attr({6, 5, 7}) ->
    #{classes => 6, target_classes => 5, type => 7,
      target_type => 7, attr1 => 103, target_attr1 => 102,
      attr2 => 102, target_attr2 => 103};
get_classes_modify_comprehend_attr({6, 5, 9}) ->
    #{classes => 6, target_classes => 5, type => 9,
      target_type => 9, attr1 => 105, target_attr1 => 105,
      attr2 => 102, target_attr2 => 102};
get_classes_modify_comprehend_attr({6, 5, 10}) ->
    #{classes => 6, target_classes => 5, type => 10,
      target_type => 10, attr1 => 103, target_attr1 => 105,
      attr2 => 105, target_attr2 => 102};
get_classes_modify_comprehend_attr({6, 5, 11}) ->
    #{classes => 6, target_classes => 5, type => 11,
      target_type => 11, attr1 => 104, target_attr1 => 104,
      attr2 => 105, target_attr2 => 105};
get_classes_modify_comprehend_attr({6, 5, 12}) ->
    #{classes => 6, target_classes => 5, type => 12,
      target_type => 12, attr1 => 103, target_attr1 => 104,
      attr2 => 102, target_attr2 => 102};
get_classes_modify_comprehend_attr({6, 5, 14}) ->
    #{classes => 6, target_classes => 5, type => 14,
      target_type => 14, attr1 => 103, target_attr1 => 104,
      attr2 => 104, target_attr2 => 105};
get_classes_modify_comprehend_attr({6, 7, 22}) ->
    #{classes => 6, target_classes => 7, type => 21,
      target_type => 22, attr1 => 103, target_attr1 => 101,
      attr2 => 105, target_attr2 => 104};
get_classes_modify_comprehend_attr({6, 7, 6}) ->
    #{classes => 6, target_classes => 7, type => 6,
      target_type => 6, attr1 => 102, target_attr1 => 101,
      attr2 => 104, target_attr2 => 104};
get_classes_modify_comprehend_attr({6, 7, 7}) ->
    #{classes => 6, target_classes => 7, type => 7,
      target_type => 7, attr1 => 103, target_attr1 => 101,
      attr2 => 102, target_attr2 => 102};
get_classes_modify_comprehend_attr({6, 7, 9}) ->
    #{classes => 6, target_classes => 7, type => 9,
      target_type => 9, attr1 => 105, target_attr1 => 101,
      attr2 => 102, target_attr2 => 102};
get_classes_modify_comprehend_attr({6, 7, 10}) ->
    #{classes => 6, target_classes => 7, type => 10,
      target_type => 10, attr1 => 103, target_attr1 => 105,
      attr2 => 105, target_attr2 => 102};
get_classes_modify_comprehend_attr({6, 7, 11}) ->
    #{classes => 6, target_classes => 7, type => 11,
      target_type => 11, attr1 => 105, target_attr1 => 101,
      attr2 => 104, target_attr2 => 105};
get_classes_modify_comprehend_attr({6, 7, 12}) ->
    #{classes => 6, target_classes => 7, type => 12,
      target_type => 12, attr1 => 103, target_attr1 => 104,
      attr2 => 102, target_attr2 => 102};
get_classes_modify_comprehend_attr({6, 7, 14}) ->
    #{classes => 6, target_classes => 7, type => 14,
      target_type => 14, attr1 => 103, target_attr1 => 104,
      attr2 => 104, target_attr2 => 105};
get_classes_modify_comprehend_attr({7, 2, 2}) ->
    #{classes => 7, target_classes => 2, type => 22,
      target_type => 2, attr1 => 101, target_attr1 => 103,
      attr2 => 104, target_attr2 => 105};
get_classes_modify_comprehend_attr({7, 2, 6}) ->
    #{classes => 7, target_classes => 2, type => 6,
      target_type => 6, attr1 => 101, target_attr1 => 102,
      attr2 => 104, target_attr2 => 104};
get_classes_modify_comprehend_attr({7, 2, 7}) ->
    #{classes => 7, target_classes => 2, type => 7,
      target_type => 7, attr1 => 101, target_attr1 => 103,
      attr2 => 102, target_attr2 => 102};
get_classes_modify_comprehend_attr({7, 2, 9}) ->
    #{classes => 7, target_classes => 2, type => 9,
      target_type => 9, attr1 => 101, target_attr1 => 105,
      attr2 => 102, target_attr2 => 102};
get_classes_modify_comprehend_attr({7, 2, 10}) ->
    #{classes => 7, target_classes => 2, type => 10,
      target_type => 10, attr1 => 105, target_attr1 => 103,
      attr2 => 102, target_attr2 => 105};
get_classes_modify_comprehend_attr({7, 2, 11}) ->
    #{classes => 7, target_classes => 2, type => 11,
      target_type => 11, attr1 => 101, target_attr1 => 105,
      attr2 => 105, target_attr2 => 104};
get_classes_modify_comprehend_attr({7, 2, 12}) ->
    #{classes => 7, target_classes => 2, type => 12,
      target_type => 12, attr1 => 104, target_attr1 => 103,
      attr2 => 102, target_attr2 => 102};
get_classes_modify_comprehend_attr({7, 2, 14}) ->
    #{classes => 7, target_classes => 2, type => 14,
      target_type => 14, attr1 => 104, target_attr1 => 103,
      attr2 => 105, target_attr2 => 104};
get_classes_modify_comprehend_attr({7, 4, 4}) ->
    #{classes => 7, target_classes => 4, type => 22,
      target_type => 4, attr1 => 101, target_attr1 => 104,
      attr2 => 104, target_attr2 => 105};
get_classes_modify_comprehend_attr({7, 4, 6}) ->
    #{classes => 7, target_classes => 4, type => 6,
      target_type => 6, attr1 => 101, target_attr1 => 102,
      attr2 => 104, target_attr2 => 104};
get_classes_modify_comprehend_attr({7, 4, 7}) ->
    #{classes => 7, target_classes => 4, type => 7,
      target_type => 7, attr1 => 101, target_attr1 => 102,
      attr2 => 102, target_attr2 => 103};
get_classes_modify_comprehend_attr({7, 4, 9}) ->
    #{classes => 7, target_classes => 4, type => 9,
      target_type => 9, attr1 => 101, target_attr1 => 105,
      attr2 => 102, target_attr2 => 102};
get_classes_modify_comprehend_attr({7, 4, 10}) ->
    #{classes => 7, target_classes => 4, type => 10,
      target_type => 10, attr1 => 105, target_attr1 => 105,
      attr2 => 102, target_attr2 => 102};
get_classes_modify_comprehend_attr({7, 4, 11}) ->
    #{classes => 7, target_classes => 4, type => 11,
      target_type => 11, attr1 => 101, target_attr1 => 104,
      attr2 => 105, target_attr2 => 105};
get_classes_modify_comprehend_attr({7, 4, 12}) ->
    #{classes => 7, target_classes => 4, type => 12,
      target_type => 12, attr1 => 104, target_attr1 => 104,
      attr2 => 102, target_attr2 => 102};
get_classes_modify_comprehend_attr({7, 4, 14}) ->
    #{classes => 7, target_classes => 4, type => 14,
      target_type => 14, attr1 => 104, target_attr1 => 104,
      attr2 => 105, target_attr2 => 105};
get_classes_modify_comprehend_attr({7, 5, 5}) ->
    #{classes => 7, target_classes => 5, type => 22,
      target_type => 5, attr1 => 101, target_attr1 => 104,
      attr2 => 104, target_attr2 => 105};
get_classes_modify_comprehend_attr({7, 5, 6}) ->
    #{classes => 7, target_classes => 5, type => 6,
      target_type => 6, attr1 => 101, target_attr1 => 102,
      attr2 => 104, target_attr2 => 104};
get_classes_modify_comprehend_attr({7, 5, 7}) ->
    #{classes => 7, target_classes => 5, type => 7,
      target_type => 7, attr1 => 101, target_attr1 => 102,
      attr2 => 102, target_attr2 => 103};
get_classes_modify_comprehend_attr({7, 5, 9}) ->
    #{classes => 7, target_classes => 5, type => 9,
      target_type => 9, attr1 => 101, target_attr1 => 105,
      attr2 => 102, target_attr2 => 102};
get_classes_modify_comprehend_attr({7, 5, 10}) ->
    #{classes => 7, target_classes => 5, type => 10,
      target_type => 10, attr1 => 105, target_attr1 => 105,
      attr2 => 102, target_attr2 => 102};
get_classes_modify_comprehend_attr({7, 5, 11}) ->
    #{classes => 7, target_classes => 5, type => 11,
      target_type => 11, attr1 => 101, target_attr1 => 104,
      attr2 => 105, target_attr2 => 105};
get_classes_modify_comprehend_attr({7, 5, 12}) ->
    #{classes => 7, target_classes => 5, type => 12,
      target_type => 12, attr1 => 104, target_attr1 => 104,
      attr2 => 102, target_attr2 => 102};
get_classes_modify_comprehend_attr({7, 5, 14}) ->
    #{classes => 7, target_classes => 5, type => 14,
      target_type => 14, attr1 => 104, target_attr1 => 104,
      attr2 => 105, target_attr2 => 105};
get_classes_modify_comprehend_attr({7, 6, 21}) ->
    #{classes => 7, target_classes => 6, type => 22,
      target_type => 21, attr1 => 101, target_attr1 => 103,
      attr2 => 104, target_attr2 => 105};
get_classes_modify_comprehend_attr({7, 6, 6}) ->
    #{classes => 7, target_classes => 6, type => 6,
      target_type => 6, attr1 => 101, target_attr1 => 102,
      attr2 => 104, target_attr2 => 104};
get_classes_modify_comprehend_attr({7, 6, 7}) ->
    #{classes => 7, target_classes => 6, type => 7,
      target_type => 7, attr1 => 101, target_attr1 => 103,
      attr2 => 102, target_attr2 => 102};
get_classes_modify_comprehend_attr({7, 6, 9}) ->
    #{classes => 7, target_classes => 6, type => 9,
      target_type => 9, attr1 => 101, target_attr1 => 105,
      attr2 => 102, target_attr2 => 102};
get_classes_modify_comprehend_attr({7, 6, 10}) ->
    #{classes => 7, target_classes => 6, type => 10,
      target_type => 10, attr1 => 105, target_attr1 => 103,
      attr2 => 102, target_attr2 => 105};
get_classes_modify_comprehend_attr({7, 6, 11}) ->
    #{classes => 7, target_classes => 6, type => 11,
      target_type => 11, attr1 => 101, target_attr1 => 105,
      attr2 => 105, target_attr2 => 104};
get_classes_modify_comprehend_attr({7, 6, 12}) ->
    #{classes => 7, target_classes => 6, type => 12,
      target_type => 12, attr1 => 104, target_attr1 => 103,
      attr2 => 102, target_attr2 => 102};
get_classes_modify_comprehend_attr({7, 6, 14}) ->
    #{classes => 7, target_classes => 6, type => 14,
      target_type => 14, attr1 => 104, target_attr1 => 103,
      attr2 => 105, target_attr2 => 104};
get_classes_modify_comprehend_attr(_) -> false.

get_classes_modify_effect_skill(10001) ->
    #{skill_id => 10001, sword_skill_id => 10001,
      archer_skill_id => 30001, templar_skill_id => 69501,
      mage_skill_id => 20001, moon_skill_id => 69001,
      orc_skill_id => 40001, devine_skill => 50001};
get_classes_modify_effect_skill(10002) ->
    #{skill_id => 10002, sword_skill_id => 10002,
      archer_skill_id => 30002, templar_skill_id => 69502,
      mage_skill_id => 20002, moon_skill_id => 69002,
      orc_skill_id => 40002, devine_skill => 50002};
get_classes_modify_effect_skill(10003) ->
    #{skill_id => 10003, sword_skill_id => 10003,
      archer_skill_id => 30003, templar_skill_id => 69503,
      mage_skill_id => 20003, moon_skill_id => 69003,
      orc_skill_id => 40003, devine_skill => 50003};
get_classes_modify_effect_skill(10004) ->
    #{skill_id => 10004, sword_skill_id => 10004,
      archer_skill_id => 30004, templar_skill_id => 69504,
      mage_skill_id => 20004, moon_skill_id => 69004,
      orc_skill_id => 40004, devine_skill => 50004};
get_classes_modify_effect_skill(10005) ->
    #{skill_id => 10005, sword_skill_id => 10005,
      archer_skill_id => 30005, templar_skill_id => 69505,
      mage_skill_id => 20005, moon_skill_id => 69005,
      orc_skill_id => 40005, devine_skill => 50005};
get_classes_modify_effect_skill(10006) ->
    #{skill_id => 10006, sword_skill_id => 10006,
      archer_skill_id => 30006, templar_skill_id => 69506,
      mage_skill_id => 20006, moon_skill_id => 69006,
      orc_skill_id => 40006, devine_skill => 50006};
get_classes_modify_effect_skill(10007) ->
    #{skill_id => 10007, sword_skill_id => 10007,
      archer_skill_id => 30007, templar_skill_id => 69507,
      mage_skill_id => 20007, moon_skill_id => 69007,
      orc_skill_id => 40007, devine_skill => 50007};
get_classes_modify_effect_skill(20001) ->
    #{skill_id => 20001, sword_skill_id => 10001,
      archer_skill_id => 30001, templar_skill_id => 69501,
      mage_skill_id => 20001, moon_skill_id => 69001,
      orc_skill_id => 40001, devine_skill => 50001};
get_classes_modify_effect_skill(20002) ->
    #{skill_id => 20002, sword_skill_id => 10002,
      archer_skill_id => 30002, templar_skill_id => 69502,
      mage_skill_id => 20002, moon_skill_id => 69002,
      orc_skill_id => 40002, devine_skill => 50002};
get_classes_modify_effect_skill(20003) ->
    #{skill_id => 20003, sword_skill_id => 10003,
      archer_skill_id => 30003, templar_skill_id => 69503,
      mage_skill_id => 20003, moon_skill_id => 69003,
      orc_skill_id => 40003, devine_skill => 50003};
get_classes_modify_effect_skill(20004) ->
    #{skill_id => 20004, sword_skill_id => 10004,
      archer_skill_id => 30004, templar_skill_id => 69504,
      mage_skill_id => 20004, moon_skill_id => 69004,
      orc_skill_id => 40004, devine_skill => 50004};
get_classes_modify_effect_skill(20005) ->
    #{skill_id => 20005, sword_skill_id => 10005,
      archer_skill_id => 30005, templar_skill_id => 69505,
      mage_skill_id => 20005, moon_skill_id => 69005,
      orc_skill_id => 40005, devine_skill => 50005};
get_classes_modify_effect_skill(20006) ->
    #{skill_id => 20006, sword_skill_id => 10006,
      archer_skill_id => 30006, templar_skill_id => 69506,
      mage_skill_id => 20006, moon_skill_id => 69006,
      orc_skill_id => 40006, devine_skill => 50006};
get_classes_modify_effect_skill(20007) ->
    #{skill_id => 20007, sword_skill_id => 10007,
      archer_skill_id => 30007, templar_skill_id => 69507,
      mage_skill_id => 20007, moon_skill_id => 69007,
      orc_skill_id => 40007, devine_skill => 50007};
get_classes_modify_effect_skill(30001) ->
    #{skill_id => 30001, sword_skill_id => 10001,
      archer_skill_id => 30001, templar_skill_id => 69501,
      mage_skill_id => 20001, moon_skill_id => 69001,
      orc_skill_id => 40001, devine_skill => 50001};
get_classes_modify_effect_skill(30002) ->
    #{skill_id => 30002, sword_skill_id => 10002,
      archer_skill_id => 30002, templar_skill_id => 69502,
      mage_skill_id => 20002, moon_skill_id => 69002,
      orc_skill_id => 40002, devine_skill => 50002};
get_classes_modify_effect_skill(30003) ->
    #{skill_id => 30003, sword_skill_id => 10003,
      archer_skill_id => 30003, templar_skill_id => 69503,
      mage_skill_id => 20003, moon_skill_id => 69003,
      orc_skill_id => 40003, devine_skill => 50003};
get_classes_modify_effect_skill(30004) ->
    #{skill_id => 30004, sword_skill_id => 10004,
      archer_skill_id => 30004, templar_skill_id => 69504,
      mage_skill_id => 20004, moon_skill_id => 69004,
      orc_skill_id => 40004, devine_skill => 50004};
get_classes_modify_effect_skill(30005) ->
    #{skill_id => 30005, sword_skill_id => 10005,
      archer_skill_id => 30005, templar_skill_id => 69505,
      mage_skill_id => 20005, moon_skill_id => 69005,
      orc_skill_id => 40005, devine_skill => 50005};
get_classes_modify_effect_skill(30006) ->
    #{skill_id => 30006, sword_skill_id => 10006,
      archer_skill_id => 30006, templar_skill_id => 69506,
      mage_skill_id => 20006, moon_skill_id => 69006,
      orc_skill_id => 40006, devine_skill => 50006};
get_classes_modify_effect_skill(30007) ->
    #{skill_id => 30007, sword_skill_id => 10007,
      archer_skill_id => 30007, templar_skill_id => 69507,
      mage_skill_id => 20007, moon_skill_id => 69007,
      orc_skill_id => 40007, devine_skill => 50007};
get_classes_modify_effect_skill(40001) ->
    #{skill_id => 40001, sword_skill_id => 10001,
      archer_skill_id => 30001, templar_skill_id => 69501,
      mage_skill_id => 20001, moon_skill_id => 69001,
      orc_skill_id => 40001, devine_skill => 50001};
get_classes_modify_effect_skill(40002) ->
    #{skill_id => 40002, sword_skill_id => 10002,
      archer_skill_id => 30002, templar_skill_id => 69502,
      mage_skill_id => 20002, moon_skill_id => 69002,
      orc_skill_id => 40002, devine_skill => 50002};
get_classes_modify_effect_skill(40003) ->
    #{skill_id => 40003, sword_skill_id => 10003,
      archer_skill_id => 30003, templar_skill_id => 69503,
      mage_skill_id => 20003, moon_skill_id => 69003,
      orc_skill_id => 40003, devine_skill => 50003};
get_classes_modify_effect_skill(40004) ->
    #{skill_id => 40004, sword_skill_id => 10004,
      archer_skill_id => 30004, templar_skill_id => 69504,
      mage_skill_id => 20004, moon_skill_id => 69004,
      orc_skill_id => 40004, devine_skill => 50004};
get_classes_modify_effect_skill(40005) ->
    #{skill_id => 40005, sword_skill_id => 10005,
      archer_skill_id => 30005, templar_skill_id => 69505,
      mage_skill_id => 20005, moon_skill_id => 69005,
      orc_skill_id => 40005, devine_skill => 50005};
get_classes_modify_effect_skill(40006) ->
    #{skill_id => 40006, sword_skill_id => 10006,
      archer_skill_id => 30006, templar_skill_id => 69506,
      mage_skill_id => 20006, moon_skill_id => 69006,
      orc_skill_id => 40006, devine_skill => 50006};
get_classes_modify_effect_skill(40007) ->
    #{skill_id => 40007, sword_skill_id => 10007,
      archer_skill_id => 30007, templar_skill_id => 69507,
      mage_skill_id => 20007, moon_skill_id => 69007,
      orc_skill_id => 40007, devine_skill => 50007};
get_classes_modify_effect_skill(50001) ->
    #{skill_id => 50001, sword_skill_id => 10001,
      archer_skill_id => 30001, templar_skill_id => 69501,
      mage_skill_id => 20001, moon_skill_id => 69001,
      orc_skill_id => 40001, devine_skill => 50001};
get_classes_modify_effect_skill(50002) ->
    #{skill_id => 50002, sword_skill_id => 10002,
      archer_skill_id => 30002, templar_skill_id => 69502,
      mage_skill_id => 20002, moon_skill_id => 69002,
      orc_skill_id => 40002, devine_skill => 50002};
get_classes_modify_effect_skill(50003) ->
    #{skill_id => 50003, sword_skill_id => 10003,
      archer_skill_id => 30003, templar_skill_id => 69503,
      mage_skill_id => 20003, moon_skill_id => 69003,
      orc_skill_id => 40003, devine_skill => 50003};
get_classes_modify_effect_skill(50004) ->
    #{skill_id => 50004, sword_skill_id => 10004,
      archer_skill_id => 30004, templar_skill_id => 69504,
      mage_skill_id => 20004, moon_skill_id => 69004,
      orc_skill_id => 40004, devine_skill => 50004};
get_classes_modify_effect_skill(50005) ->
    #{skill_id => 50005, sword_skill_id => 10005,
      archer_skill_id => 30005, templar_skill_id => 69505,
      mage_skill_id => 20005, moon_skill_id => 69005,
      orc_skill_id => 40005, devine_skill => 50005};
get_classes_modify_effect_skill(50006) ->
    #{skill_id => 50006, sword_skill_id => 10006,
      archer_skill_id => 30006, templar_skill_id => 69506,
      mage_skill_id => 20006, moon_skill_id => 69006,
      orc_skill_id => 40006, devine_skill => 50006};
get_classes_modify_effect_skill(50007) ->
    #{skill_id => 50007, sword_skill_id => 10007,
      archer_skill_id => 30007, templar_skill_id => 69507,
      mage_skill_id => 20007, moon_skill_id => 69007,
      orc_skill_id => 40007, devine_skill => 50007};
get_classes_modify_effect_skill(69001) ->
    #{skill_id => 69001, sword_skill_id => 10001,
      archer_skill_id => 30001, templar_skill_id => 69501,
      mage_skill_id => 20001, moon_skill_id => 69001,
      orc_skill_id => 40001, devine_skill => 50001};
get_classes_modify_effect_skill(69002) ->
    #{skill_id => 69002, sword_skill_id => 10002,
      archer_skill_id => 30002, templar_skill_id => 69502,
      mage_skill_id => 20002, moon_skill_id => 69002,
      orc_skill_id => 40002, devine_skill => 50002};
get_classes_modify_effect_skill(69003) ->
    #{skill_id => 69003, sword_skill_id => 10003,
      archer_skill_id => 30003, templar_skill_id => 69503,
      mage_skill_id => 20003, moon_skill_id => 69003,
      orc_skill_id => 40003, devine_skill => 50003};
get_classes_modify_effect_skill(69004) ->
    #{skill_id => 69004, sword_skill_id => 10004,
      archer_skill_id => 30004, templar_skill_id => 69504,
      mage_skill_id => 20004, moon_skill_id => 69004,
      orc_skill_id => 40004, devine_skill => 50004};
get_classes_modify_effect_skill(69005) ->
    #{skill_id => 69005, sword_skill_id => 10005,
      archer_skill_id => 30005, templar_skill_id => 69505,
      mage_skill_id => 20005, moon_skill_id => 69005,
      orc_skill_id => 40005, devine_skill => 50005};
get_classes_modify_effect_skill(69006) ->
    #{skill_id => 69006, sword_skill_id => 10006,
      archer_skill_id => 30006, templar_skill_id => 69506,
      mage_skill_id => 20006, moon_skill_id => 69006,
      orc_skill_id => 40006, devine_skill => 50006};
get_classes_modify_effect_skill(69007) ->
    #{skill_id => 69007, sword_skill_id => 10007,
      archer_skill_id => 30007, templar_skill_id => 69507,
      mage_skill_id => 20007, moon_skill_id => 69007,
      orc_skill_id => 40007, devine_skill => 50007};
get_classes_modify_effect_skill(69501) ->
    #{skill_id => 69501, sword_skill_id => 10001,
      archer_skill_id => 30001, templar_skill_id => 69501,
      mage_skill_id => 20001, moon_skill_id => 69001,
      orc_skill_id => 40001, devine_skill => 50001};
get_classes_modify_effect_skill(69502) ->
    #{skill_id => 69502, sword_skill_id => 10002,
      archer_skill_id => 30002, templar_skill_id => 69502,
      mage_skill_id => 20002, moon_skill_id => 69002,
      orc_skill_id => 40002, devine_skill => 50002};
get_classes_modify_effect_skill(69503) ->
    #{skill_id => 69503, sword_skill_id => 10003,
      archer_skill_id => 30003, templar_skill_id => 69503,
      mage_skill_id => 20003, moon_skill_id => 69003,
      orc_skill_id => 40003, devine_skill => 50003};
get_classes_modify_effect_skill(69504) ->
    #{skill_id => 69504, sword_skill_id => 10004,
      archer_skill_id => 30004, templar_skill_id => 69504,
      mage_skill_id => 20004, moon_skill_id => 69004,
      orc_skill_id => 40004, devine_skill => 50004};
get_classes_modify_effect_skill(69505) ->
    #{skill_id => 69505, sword_skill_id => 10005,
      archer_skill_id => 30005, templar_skill_id => 69505,
      mage_skill_id => 20005, moon_skill_id => 69005,
      orc_skill_id => 40005, devine_skill => 50005};
get_classes_modify_effect_skill(69506) ->
    #{skill_id => 69506, sword_skill_id => 10006,
      archer_skill_id => 30006, templar_skill_id => 69506,
      mage_skill_id => 20006, moon_skill_id => 69006,
      orc_skill_id => 40006, devine_skill => 50006};
get_classes_modify_effect_skill(69507) ->
    #{skill_id => 69507, sword_skill_id => 10007,
      archer_skill_id => 30007, templar_skill_id => 69507,
      mage_skill_id => 20007, moon_skill_id => 69007,
      orc_skill_id => 40007, devine_skill => 50007};
get_classes_modify_effect_skill(_) -> false.

