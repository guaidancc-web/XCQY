-file("src/data/attr_data.erl", 1).

-module(attr_data).

-export([get_fc/1,
         get_classes_base/1,
         get_point_attr/1,
         auto_point/1,
         get_score/1,
         rename_gold/1,
         change_point_price/1]).

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

-file("src/data/attr_data.erl", 19).

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

-file("src/data/attr_data.erl", 20).

get_fc({1, 1}) -> 200;
get_fc({1, 4}) -> 1400;
get_fc({1, 5}) -> 1;
get_fc({1, 6}) -> 1400;
get_fc({1, 7}) -> 1400;
get_fc({1, 3}) -> 9000;
get_fc({2, 1}) -> 200;
get_fc({2, 4}) -> 1;
get_fc({2, 5}) -> 1400;
get_fc({2, 6}) -> 1400;
get_fc({2, 7}) -> 1400;
get_fc({2, 3}) -> 9000;
get_fc({3, 1}) -> 200;
get_fc({3, 4}) -> 1400;
get_fc({3, 5}) -> 1;
get_fc({3, 6}) -> 1400;
get_fc({3, 7}) -> 1400;
get_fc({3, 3}) -> 9000;
get_fc({4, 1}) -> 200;
get_fc({4, 4}) -> 1400;
get_fc({4, 5}) -> 1;
get_fc({4, 6}) -> 1400;
get_fc({4, 7}) -> 1400;
get_fc({4, 3}) -> 9000;
get_fc({5, 1}) -> 200;
get_fc({5, 4}) -> 1;
get_fc({5, 5}) -> 1400;
get_fc({5, 6}) -> 1400;
get_fc({5, 7}) -> 1400;
get_fc({5, 3}) -> 9000;
get_fc({6, 1}) -> 200;
get_fc({6, 4}) -> 1;
get_fc({6, 5}) -> 1400;
get_fc({6, 6}) -> 1400;
get_fc({6, 7}) -> 1400;
get_fc({6, 3}) -> 9000;
get_fc({7, 1}) -> 200;
get_fc({7, 4}) -> 1;
get_fc({7, 5}) -> 1400;
get_fc({7, 6}) -> 1400;
get_fc({7, 7}) -> 1400;
get_fc({7, 3}) -> 9000;
get_fc(_) -> 0.

get_classes_base({1, 1}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 468,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({2, 1}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 498,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({3, 1}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 514,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({4, 1}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 529,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({5, 1}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 546,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({6, 1}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 561,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({7, 1}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 576,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({8, 1}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 592,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({9, 1}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 607,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({10, 1}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 624,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({11, 1}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 639,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({12, 1}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 654,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({13, 1}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 670,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({14, 1}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 685,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({15, 1}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 702,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({16, 1}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 717,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({17, 1}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 732,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({18, 1}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 748,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({19, 1}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 763,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({20, 1}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 780,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({21, 1}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 795,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({22, 1}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 810,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({23, 1}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 826,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({24, 1}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 841,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({25, 1}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 858,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({26, 1}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 873,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({27, 1}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 888,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({28, 1}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 904,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({29, 1}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 919,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({30, 1}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 936,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({31, 1}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 951,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({32, 1}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 966,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({33, 1}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 982,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({34, 1}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 997,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({35, 1}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1014,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({36, 1}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1029,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({37, 1}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1044,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({38, 1}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1060,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({39, 1}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1075,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({40, 1}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1092,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({41, 1}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1107,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({42, 1}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1122,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({43, 1}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1138,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({44, 1}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1153,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({45, 1}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1170,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({46, 1}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1185,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({47, 1}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1200,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({48, 1}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1216,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({49, 1}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1231,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({50, 1}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1248,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({51, 1}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1263,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({52, 1}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1278,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({53, 1}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1294,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({54, 1}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1309,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({55, 1}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1326,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({56, 1}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1341,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({57, 1}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1356,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({58, 1}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1372,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({59, 1}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1387,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({60, 1}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1404,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({61, 1}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1419,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({62, 1}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1434,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({63, 1}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1450,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({64, 1}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1465,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({65, 1}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1482,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({66, 1}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1497,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({67, 1}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1512,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({68, 1}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1528,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({69, 1}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1543,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({70, 1}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1560,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({71, 1}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1575,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({72, 1}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1590,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({73, 1}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1606,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({74, 1}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1621,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({75, 1}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1638,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({76, 1}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1653,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({77, 1}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1668,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({78, 1}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1684,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({79, 1}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1699,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({80, 1}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1716,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({81, 1}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1731,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({82, 1}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1746,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({83, 1}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1762,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({84, 1}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1777,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({85, 1}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1794,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({86, 1}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1809,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({87, 1}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1824,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({88, 1}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1840,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({89, 1}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1855,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({90, 1}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1872,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({91, 1}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1887,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({92, 1}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1902,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({93, 1}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1918,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({94, 1}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1933,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({95, 1}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1950,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({96, 1}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1965,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({97, 1}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1980,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({98, 1}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1996,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({99, 1}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2011,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({100, 1}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({101, 1}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({102, 1}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({103, 1}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({104, 1}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({105, 1}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({106, 1}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({107, 1}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({108, 1}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({109, 1}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({110, 1}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({111, 1}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({112, 1}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({113, 1}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({114, 1}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({115, 1}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({116, 1}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({117, 1}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({118, 1}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({119, 1}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({120, 1}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({121, 1}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({122, 1}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({123, 1}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({124, 1}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({125, 1}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({126, 1}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({127, 1}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({128, 1}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({129, 1}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({130, 1}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({1, 2}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 468,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({2, 2}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 498,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({3, 2}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 514,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({4, 2}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 529,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({5, 2}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 546,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({6, 2}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 561,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({7, 2}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 576,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({8, 2}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 592,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({9, 2}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 607,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({10, 2}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 624,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({11, 2}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 639,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({12, 2}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 654,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({13, 2}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 670,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({14, 2}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 685,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({15, 2}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 702,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({16, 2}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 717,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({17, 2}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 732,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({18, 2}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 748,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({19, 2}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 763,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({20, 2}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 780,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({21, 2}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 795,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({22, 2}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 810,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({23, 2}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 826,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({24, 2}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 841,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({25, 2}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 858,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({26, 2}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 873,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({27, 2}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 888,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({28, 2}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 904,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({29, 2}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 919,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({30, 2}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 936,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({31, 2}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 951,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({32, 2}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 966,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({33, 2}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 982,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({34, 2}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 997,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({35, 2}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1014,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({36, 2}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1029,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({37, 2}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1044,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({38, 2}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1060,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({39, 2}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1075,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({40, 2}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1092,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({41, 2}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1107,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({42, 2}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1122,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({43, 2}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1138,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({44, 2}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1153,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({45, 2}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1170,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({46, 2}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1185,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({47, 2}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1200,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({48, 2}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1216,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({49, 2}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1231,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({50, 2}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1248,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({51, 2}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1263,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({52, 2}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1278,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({53, 2}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1294,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({54, 2}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1309,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({55, 2}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1326,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({56, 2}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1341,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({57, 2}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1356,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({58, 2}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1372,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({59, 2}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1387,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({60, 2}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1404,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({61, 2}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1419,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({62, 2}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1434,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({63, 2}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1450,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({64, 2}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1465,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({65, 2}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1482,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({66, 2}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1497,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({67, 2}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1512,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({68, 2}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1528,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({69, 2}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1543,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({70, 2}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1560,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({71, 2}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1575,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({72, 2}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1590,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({73, 2}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1606,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({74, 2}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1621,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({75, 2}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1638,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({76, 2}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1653,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({77, 2}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1668,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({78, 2}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1684,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({79, 2}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1699,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({80, 2}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1716,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({81, 2}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1731,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({82, 2}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1746,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({83, 2}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1762,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({84, 2}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1777,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({85, 2}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1794,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({86, 2}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1809,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({87, 2}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1824,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({88, 2}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1840,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({89, 2}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1855,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({90, 2}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1872,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({91, 2}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1887,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({92, 2}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1902,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({93, 2}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1918,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({94, 2}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1933,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({95, 2}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1950,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({96, 2}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1965,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({97, 2}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1980,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({98, 2}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1996,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({99, 2}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2011,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({100, 2}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({101, 2}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({102, 2}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({103, 2}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({104, 2}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({105, 2}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({106, 2}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({107, 2}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({108, 2}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({109, 2}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({110, 2}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({111, 2}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({112, 2}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({113, 2}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({114, 2}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({115, 2}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({116, 2}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({117, 2}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({118, 2}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({119, 2}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({120, 2}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({121, 2}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({122, 2}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({123, 2}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({124, 2}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({125, 2}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({126, 2}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({127, 2}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({128, 2}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({129, 2}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({130, 2}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({1, 3}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 468,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({2, 3}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 498,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({3, 3}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 514,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({4, 3}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 529,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({5, 3}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 546,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({6, 3}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 561,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({7, 3}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 576,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({8, 3}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 592,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({9, 3}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 607,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({10, 3}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 624,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({11, 3}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 639,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({12, 3}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 654,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({13, 3}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 670,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({14, 3}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 685,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({15, 3}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 702,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({16, 3}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 717,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({17, 3}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 732,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({18, 3}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 748,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({19, 3}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 763,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({20, 3}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 780,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({21, 3}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 795,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({22, 3}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 810,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({23, 3}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 826,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({24, 3}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 841,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({25, 3}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 858,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({26, 3}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 873,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({27, 3}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 888,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({28, 3}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 904,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({29, 3}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 919,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({30, 3}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 936,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({31, 3}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 951,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({32, 3}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 966,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({33, 3}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 982,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({34, 3}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 997,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({35, 3}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1014,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({36, 3}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1029,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({37, 3}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1044,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({38, 3}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1060,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({39, 3}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1075,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({40, 3}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1092,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({41, 3}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1107,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({42, 3}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1122,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({43, 3}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1138,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({44, 3}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1153,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({45, 3}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1170,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({46, 3}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1185,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({47, 3}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1200,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({48, 3}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1216,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({49, 3}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1231,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({50, 3}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1248,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({51, 3}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1263,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({52, 3}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1278,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({53, 3}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1294,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({54, 3}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1309,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({55, 3}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1326,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({56, 3}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1341,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({57, 3}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1356,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({58, 3}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1372,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({59, 3}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1387,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({60, 3}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1404,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({61, 3}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1419,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({62, 3}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1434,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({63, 3}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1450,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({64, 3}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1465,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({65, 3}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1482,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({66, 3}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1497,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({67, 3}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1512,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({68, 3}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1528,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({69, 3}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1543,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({70, 3}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1560,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({71, 3}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1575,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({72, 3}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1590,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({73, 3}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1606,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({74, 3}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1621,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({75, 3}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1638,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({76, 3}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1653,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({77, 3}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1668,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({78, 3}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1684,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({79, 3}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1699,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({80, 3}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1716,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({81, 3}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1731,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({82, 3}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1746,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({83, 3}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1762,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({84, 3}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1777,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({85, 3}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1794,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({86, 3}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1809,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({87, 3}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1824,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({88, 3}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1840,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({89, 3}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1855,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({90, 3}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1872,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({91, 3}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1887,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({92, 3}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1902,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({93, 3}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1918,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({94, 3}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1933,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({95, 3}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1950,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({96, 3}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1965,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({97, 3}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1980,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({98, 3}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1996,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({99, 3}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2011,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({100, 3}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({101, 3}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({102, 3}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({103, 3}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({104, 3}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({105, 3}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({106, 3}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({107, 3}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({108, 3}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({109, 3}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({110, 3}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({111, 3}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({112, 3}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({113, 3}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({114, 3}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({115, 3}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({116, 3}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({117, 3}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({118, 3}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({119, 3}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({120, 3}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({121, 3}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({122, 3}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({123, 3}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({124, 3}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({125, 3}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({126, 3}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({127, 3}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({128, 3}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({129, 3}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({130, 3}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({1, 4}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 468,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({2, 4}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 498,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({3, 4}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 514,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({4, 4}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 529,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({5, 4}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 546,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({6, 4}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 561,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({7, 4}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 576,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({8, 4}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 592,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({9, 4}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 607,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({10, 4}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 624,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({11, 4}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 639,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({12, 4}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 654,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({13, 4}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 670,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({14, 4}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 685,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({15, 4}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 702,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({16, 4}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 717,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({17, 4}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 732,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({18, 4}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 748,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({19, 4}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 763,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({20, 4}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 780,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({21, 4}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 795,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({22, 4}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 810,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({23, 4}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 826,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({24, 4}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 841,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({25, 4}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 858,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({26, 4}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 873,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({27, 4}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 888,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({28, 4}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 904,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({29, 4}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 919,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({30, 4}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 936,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({31, 4}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 951,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({32, 4}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 966,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({33, 4}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 982,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({34, 4}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 997,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({35, 4}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1014,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({36, 4}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1029,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({37, 4}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1044,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({38, 4}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1060,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({39, 4}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1075,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({40, 4}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1092,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({41, 4}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1107,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({42, 4}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1122,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({43, 4}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1138,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({44, 4}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1153,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({45, 4}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1170,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({46, 4}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1185,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({47, 4}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1200,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({48, 4}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1216,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({49, 4}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1231,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({50, 4}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1248,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({51, 4}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1263,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({52, 4}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1278,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({53, 4}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1294,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({54, 4}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1309,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({55, 4}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1326,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({56, 4}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1341,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({57, 4}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1356,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({58, 4}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1372,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({59, 4}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1387,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({60, 4}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1404,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({61, 4}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1419,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({62, 4}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1434,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({63, 4}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1450,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({64, 4}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1465,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({65, 4}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1482,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({66, 4}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1497,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({67, 4}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1512,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({68, 4}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1528,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({69, 4}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1543,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({70, 4}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1560,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({71, 4}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1575,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({72, 4}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1590,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({73, 4}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1606,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({74, 4}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1621,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({75, 4}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1638,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({76, 4}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1653,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({77, 4}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1668,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({78, 4}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1684,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({79, 4}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1699,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({80, 4}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1716,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({81, 4}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1731,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({82, 4}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1746,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({83, 4}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1762,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({84, 4}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1777,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({85, 4}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1794,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({86, 4}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1809,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({87, 4}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1824,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({88, 4}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1840,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({89, 4}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1855,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({90, 4}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1872,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({91, 4}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1887,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({92, 4}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1902,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({93, 4}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1918,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({94, 4}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1933,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({95, 4}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1950,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({96, 4}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1965,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({97, 4}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1980,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({98, 4}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1996,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({99, 4}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2011,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({100, 4}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({101, 4}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({102, 4}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({103, 4}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({104, 4}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({105, 4}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({106, 4}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({107, 4}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({108, 4}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({109, 4}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({110, 4}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({111, 4}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({112, 4}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({113, 4}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({114, 4}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({115, 4}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({116, 4}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({117, 4}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({118, 4}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({119, 4}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({120, 4}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({121, 4}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({122, 4}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({123, 4}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({124, 4}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({125, 4}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({126, 4}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({127, 4}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({128, 4}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({129, 4}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({130, 4}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({1, 5}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 468,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({2, 5}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 498,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({3, 5}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 514,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({4, 5}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 529,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({5, 5}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 546,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({6, 5}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 561,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({7, 5}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 576,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({8, 5}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 592,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({9, 5}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 607,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({10, 5}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 624,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({11, 5}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 639,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({12, 5}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 654,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({13, 5}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 670,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({14, 5}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 685,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({15, 5}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 702,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({16, 5}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 717,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({17, 5}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 732,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({18, 5}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 748,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({19, 5}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 763,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({20, 5}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 780,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({21, 5}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 795,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({22, 5}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 810,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({23, 5}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 826,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({24, 5}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 841,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({25, 5}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 858,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({26, 5}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 873,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({27, 5}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 888,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({28, 5}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 904,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({29, 5}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 919,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({30, 5}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 936,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({31, 5}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 951,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({32, 5}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 966,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({33, 5}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 982,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({34, 5}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 997,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({35, 5}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1014,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({36, 5}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1029,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({37, 5}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1044,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({38, 5}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1060,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({39, 5}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1075,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({40, 5}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1092,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({41, 5}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1107,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({42, 5}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1122,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({43, 5}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1138,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({44, 5}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1153,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({45, 5}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1170,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({46, 5}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1185,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({47, 5}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1200,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({48, 5}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1216,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({49, 5}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1231,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({50, 5}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1248,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({51, 5}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1263,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({52, 5}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1278,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({53, 5}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1294,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({54, 5}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1309,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({55, 5}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1326,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({56, 5}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1341,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({57, 5}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1356,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({58, 5}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1372,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({59, 5}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1387,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({60, 5}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1404,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({61, 5}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1419,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({62, 5}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1434,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({63, 5}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1450,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({64, 5}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1465,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({65, 5}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1482,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({66, 5}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1497,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({67, 5}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1512,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({68, 5}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1528,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({69, 5}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1543,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({70, 5}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1560,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({71, 5}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1575,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({72, 5}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1590,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({73, 5}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1606,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({74, 5}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1621,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({75, 5}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1638,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({76, 5}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1653,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({77, 5}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1668,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({78, 5}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1684,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({79, 5}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1699,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({80, 5}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1716,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({81, 5}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1731,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({82, 5}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1746,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({83, 5}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1762,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({84, 5}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1777,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({85, 5}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1794,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({86, 5}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1809,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({87, 5}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1824,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({88, 5}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1840,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({89, 5}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1855,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({90, 5}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1872,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({91, 5}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1887,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({92, 5}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1902,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({93, 5}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1918,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({94, 5}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1933,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({95, 5}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1950,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({96, 5}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1965,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({97, 5}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1980,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({98, 5}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1996,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({99, 5}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2011,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({100, 5}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({101, 5}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({102, 5}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({103, 5}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({104, 5}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({105, 5}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({106, 5}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({107, 5}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({108, 5}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({109, 5}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({110, 5}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({111, 5}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({112, 5}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({113, 5}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({114, 5}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({115, 5}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({116, 5}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({117, 5}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({118, 5}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({119, 5}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({120, 5}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({121, 5}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({122, 5}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({123, 5}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({124, 5}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({125, 5}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({126, 5}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({127, 5}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({128, 5}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({129, 5}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({130, 5}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({1, 6}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 468,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({2, 6}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 498,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({3, 6}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 514,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({4, 6}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 529,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({5, 6}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 546,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({6, 6}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 561,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({7, 6}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 576,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({8, 6}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 592,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({9, 6}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 607,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({10, 6}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 624,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({11, 6}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 639,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({12, 6}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 654,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({13, 6}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 670,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({14, 6}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 685,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({15, 6}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 702,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({16, 6}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 717,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({17, 6}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 732,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({18, 6}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 748,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({19, 6}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 763,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({20, 6}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 780,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({21, 6}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 795,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({22, 6}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 810,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({23, 6}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 826,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({24, 6}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 841,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({25, 6}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 858,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({26, 6}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 873,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({27, 6}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 888,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({28, 6}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 904,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({29, 6}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 919,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({30, 6}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 936,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({31, 6}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 951,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({32, 6}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 966,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({33, 6}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 982,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({34, 6}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 997,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({35, 6}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1014,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({36, 6}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1029,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({37, 6}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1044,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({38, 6}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1060,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({39, 6}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1075,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({40, 6}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1092,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({41, 6}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1107,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({42, 6}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1122,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({43, 6}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1138,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({44, 6}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1153,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({45, 6}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1170,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({46, 6}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1185,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({47, 6}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1200,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({48, 6}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1216,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({49, 6}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1231,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({50, 6}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1248,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({51, 6}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1263,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({52, 6}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1278,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({53, 6}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1294,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({54, 6}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1309,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({55, 6}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1326,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({56, 6}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1341,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({57, 6}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1356,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({58, 6}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1372,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({59, 6}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1387,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({60, 6}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1404,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({61, 6}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1419,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({62, 6}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1434,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({63, 6}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1450,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({64, 6}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1465,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({65, 6}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1482,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({66, 6}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1497,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({67, 6}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1512,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({68, 6}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1528,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({69, 6}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1543,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({70, 6}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1560,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({71, 6}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1575,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({72, 6}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1590,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({73, 6}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1606,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({74, 6}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1621,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({75, 6}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1638,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({76, 6}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1653,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({77, 6}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1668,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({78, 6}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1684,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({79, 6}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1699,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({80, 6}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1716,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({81, 6}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1731,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({82, 6}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1746,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({83, 6}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1762,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({84, 6}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1777,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({85, 6}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1794,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({86, 6}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1809,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({87, 6}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1824,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({88, 6}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1840,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({89, 6}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1855,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({90, 6}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1872,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({91, 6}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1887,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({92, 6}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1902,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({93, 6}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1918,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({94, 6}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1933,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({95, 6}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1950,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({96, 6}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1965,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({97, 6}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1980,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({98, 6}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1996,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({99, 6}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2011,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({100, 6}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({101, 6}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({102, 6}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({103, 6}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({104, 6}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({105, 6}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({106, 6}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({107, 6}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({108, 6}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({109, 6}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({110, 6}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({111, 6}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({112, 6}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({113, 6}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({114, 6}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({115, 6}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({116, 6}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({117, 6}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({118, 6}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({119, 6}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({120, 6}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({121, 6}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({122, 6}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({123, 6}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({124, 6}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({125, 6}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({126, 6}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({127, 6}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({128, 6}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({129, 6}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({130, 6}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({1, 7}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 468,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({2, 7}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 498,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({3, 7}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 514,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({4, 7}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 529,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({5, 7}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 546,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({6, 7}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 561,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({7, 7}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 576,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({8, 7}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 592,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({9, 7}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 607,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({10, 7}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 624,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({11, 7}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 639,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({12, 7}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 654,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({13, 7}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 670,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({14, 7}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 685,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({15, 7}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 702,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({16, 7}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 717,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({17, 7}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 732,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({18, 7}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 748,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({19, 7}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 763,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({20, 7}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 780,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({21, 7}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 795,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({22, 7}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 810,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({23, 7}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 826,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({24, 7}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 841,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({25, 7}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 858,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({26, 7}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 873,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({27, 7}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 888,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({28, 7}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 904,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({29, 7}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 919,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({30, 7}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 936,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({31, 7}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 951,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({32, 7}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 966,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({33, 7}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 982,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({34, 7}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 997,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({35, 7}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1014,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({36, 7}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1029,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({37, 7}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1044,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({38, 7}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1060,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({39, 7}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1075,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({40, 7}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1092,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({41, 7}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1107,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({42, 7}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1122,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({43, 7}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1138,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({44, 7}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1153,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({45, 7}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1170,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({46, 7}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1185,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({47, 7}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1200,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({48, 7}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1216,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({49, 7}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1231,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({50, 7}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1248,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({51, 7}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1263,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({52, 7}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1278,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({53, 7}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1294,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({54, 7}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1309,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({55, 7}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1326,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({56, 7}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1341,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({57, 7}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1356,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({58, 7}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1372,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({59, 7}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1387,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({60, 7}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1404,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({61, 7}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1419,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({62, 7}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1434,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({63, 7}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1450,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({64, 7}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1465,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({65, 7}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1482,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({66, 7}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1497,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({67, 7}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1512,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({68, 7}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1528,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({69, 7}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1543,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({70, 7}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1560,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({71, 7}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1575,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({72, 7}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1590,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({73, 7}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1606,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({74, 7}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1621,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({75, 7}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1638,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({76, 7}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1653,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({77, 7}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1668,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({78, 7}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1684,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({79, 7}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1699,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({80, 7}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1716,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({81, 7}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1731,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({82, 7}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1746,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({83, 7}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1762,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({84, 7}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1777,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({85, 7}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1794,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({86, 7}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1809,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({87, 7}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1824,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({88, 7}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1840,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({89, 7}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1855,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({90, 7}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1872,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({91, 7}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1887,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({92, 7}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1902,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({93, 7}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1918,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({94, 7}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1933,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({95, 7}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1950,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({96, 7}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1965,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({97, 7}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1980,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({98, 7}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 1996,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({99, 7}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2011,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({100, 7}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({101, 7}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({102, 7}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({103, 7}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({104, 7}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({105, 7}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({106, 7}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({107, 7}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({108, 7}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({109, 7}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({110, 7}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({111, 7}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({112, 7}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({113, 7}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({114, 7}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({115, 7}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({116, 7}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({117, 7}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({118, 7}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({119, 7}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({120, 7}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({121, 7}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({122, 7}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({123, 7}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({124, 7}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({125, 7}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({126, 7}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({127, 7}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({128, 7}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({129, 7}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base({130, 7}) ->
    #attr{speed = 0, hp_max = 1, mp_max = 2028,
          atk_speed = 0, phy_dmg = 0, magic_dmg = 0, phy_def = 0,
          magic_def = 0, crit = 0, tenacity = 0, accuracy = 0,
          evasion = 0, holy_dmg = 0, crit_dmg = 0,
          enhance_control = 0};
get_classes_base(_) -> #attr{}.

get_point_attr({102, 1, 1}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 1, 2}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 1, 3}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 1, 4}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 1, 5}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 1, 6}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 1, 7}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 1, 8}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 1, 9}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 1, 10}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 1, 11}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 1, 12}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 1, 13}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 1, 14}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 1, 15}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 1, 16}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 1, 17}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 1, 18}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 1, 19}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 1, 20}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 1, 21}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 1, 22}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 1, 23}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 1, 24}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 1, 25}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 1, 26}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 1, 27}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 1, 28}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 1, 29}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 1, 30}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 1, 31}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 1, 32}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 1, 33}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 1, 34}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 1, 35}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 1, 36}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 1, 37}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 1, 38}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 1, 39}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 1, 40}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 1, 41}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 1, 42}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 1, 43}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 1, 44}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 1, 45}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 1, 46}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 1, 47}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 1, 48}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 1, 49}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 1, 50}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 1, 51}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 1, 52}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 1, 53}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 1, 54}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 1, 55}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 1, 56}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 1, 57}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 1, 58}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 1, 59}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 1, 60}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 1, 61}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 1, 62}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 1, 63}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 1, 64}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 1, 65}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 1, 66}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 1, 67}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 1, 68}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 1, 69}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 1, 70}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 1, 71}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 1, 72}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 1, 73}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 1, 74}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 1, 75}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 1, 76}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 1, 77}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 1, 78}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 1, 79}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 1, 80}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 1, 81}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 1, 82}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 1, 83}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 1, 84}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 1, 85}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 1, 86}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 1, 87}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 1, 88}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 1, 89}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 1, 90}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 1, 91}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 1, 92}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 1, 93}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 1, 94}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 1, 95}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 1, 96}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 1, 97}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 1, 98}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 1, 99}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 1, 100}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 1, 101}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 1, 102}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 1, 103}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 1, 104}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 1, 105}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 1, 106}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 1, 107}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 1, 108}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 1, 109}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 1, 110}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 1, 111}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 1, 112}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 1, 113}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 1, 114}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 1, 115}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 1, 116}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 1, 117}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 1, 118}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 1, 119}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 1, 120}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 1, 121}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 1, 122}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 1, 123}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 1, 124}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 1, 125}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 1, 126}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 1, 127}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 1, 128}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 1, 129}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 1, 130}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({101, 1, 1}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 1, 2}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 1, 3}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 1, 4}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 1, 5}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 1, 6}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 1, 7}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 1, 8}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 1, 9}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 1, 10}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 1, 11}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 1, 12}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 1, 13}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 1, 14}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 1, 15}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 1, 16}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 1, 17}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 1, 18}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 1, 19}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 1, 20}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 1, 21}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 1, 22}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 1, 23}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 1, 24}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 1, 25}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 1, 26}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 1, 27}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 1, 28}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 1, 29}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 1, 30}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 1, 31}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 1, 32}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 1, 33}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 1, 34}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 1, 35}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 1, 36}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 1, 37}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 1, 38}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 1, 39}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 1, 40}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 1, 41}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 1, 42}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 1, 43}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 1, 44}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 1, 45}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 1, 46}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 1, 47}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 1, 48}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 1, 49}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 1, 50}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 1, 51}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 1, 52}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 1, 53}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 1, 54}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 1, 55}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 1, 56}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 1, 57}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 1, 58}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 1, 59}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 1, 60}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 1, 61}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 1, 62}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 1, 63}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 1, 64}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 1, 65}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 1, 66}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 1, 67}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 1, 68}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 1, 69}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 1, 70}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 1, 71}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 1, 72}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 1, 73}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 1, 74}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 1, 75}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 1, 76}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 1, 77}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 1, 78}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 1, 79}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 1, 80}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 1, 81}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 1, 82}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 1, 83}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 1, 84}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 1, 85}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 1, 86}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 1, 87}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 1, 88}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 1, 89}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 1, 90}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 1, 91}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 1, 92}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 1, 93}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 1, 94}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 1, 95}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 1, 96}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 1, 97}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 1, 98}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 1, 99}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 1, 100}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 1, 101}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 1, 102}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 1, 103}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 1, 104}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 1, 105}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 1, 106}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 1, 107}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 1, 108}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 1, 109}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 1, 110}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 1, 111}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 1, 112}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 1, 113}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 1, 114}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 1, 115}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 1, 116}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 1, 117}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 1, 118}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 1, 119}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 1, 120}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 1, 121}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 1, 122}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 1, 123}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 1, 124}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 1, 125}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 1, 126}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 1, 127}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 1, 128}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 1, 129}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 1, 130}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({103, 1, 1}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 1, 2}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 1, 3}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 1, 4}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 1, 5}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 1, 6}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 1, 7}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 1, 8}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 1, 9}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 1, 10}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 1, 11}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 1, 12}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 1, 13}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 1, 14}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 1, 15}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 1, 16}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 1, 17}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 1, 18}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 1, 19}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 1, 20}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 1, 21}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 1, 22}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 1, 23}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 1, 24}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 1, 25}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 1, 26}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 1, 27}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 1, 28}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 1, 29}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 1, 30}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 1, 31}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 1, 32}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 1, 33}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 1, 34}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 1, 35}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 1, 36}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 1, 37}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 1, 38}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 1, 39}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 1, 40}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 1, 41}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 1, 42}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 1, 43}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 1, 44}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 1, 45}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 1, 46}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 1, 47}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 1, 48}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 1, 49}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 1, 50}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 1, 51}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 1, 52}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 1, 53}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 1, 54}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 1, 55}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 1, 56}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 1, 57}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 1, 58}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 1, 59}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 1, 60}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 1, 61}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 1, 62}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 1, 63}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 1, 64}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 1, 65}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 1, 66}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 1, 67}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 1, 68}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 1, 69}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 1, 70}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 1, 71}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 1, 72}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 1, 73}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 1, 74}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 1, 75}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 1, 76}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 1, 77}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 1, 78}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 1, 79}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 1, 80}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 1, 81}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 1, 82}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 1, 83}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 1, 84}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 1, 85}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 1, 86}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 1, 87}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 1, 88}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 1, 89}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 1, 90}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 1, 91}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 1, 92}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 1, 93}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 1, 94}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 1, 95}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 1, 96}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 1, 97}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 1, 98}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 1, 99}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 1, 100}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 1, 101}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 1, 102}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 1, 103}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 1, 104}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 1, 105}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 1, 106}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 1, 107}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 1, 108}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 1, 109}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 1, 110}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 1, 111}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 1, 112}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 1, 113}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 1, 114}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 1, 115}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 1, 116}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 1, 117}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 1, 118}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 1, 119}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 1, 120}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 1, 121}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 1, 122}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 1, 123}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 1, 124}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 1, 125}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 1, 126}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 1, 127}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 1, 128}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 1, 129}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 1, 130}) -> [{5, 350}, {7, 280}];
get_point_attr({104, 1, 1}) -> [{3, 100}];
get_point_attr({104, 1, 2}) -> [{3, 100}];
get_point_attr({104, 1, 3}) -> [{3, 100}];
get_point_attr({104, 1, 4}) -> [{3, 100}];
get_point_attr({104, 1, 5}) -> [{3, 100}];
get_point_attr({104, 1, 6}) -> [{3, 100}];
get_point_attr({104, 1, 7}) -> [{3, 100}];
get_point_attr({104, 1, 8}) -> [{3, 100}];
get_point_attr({104, 1, 9}) -> [{3, 100}];
get_point_attr({104, 1, 10}) -> [{3, 100}];
get_point_attr({104, 1, 11}) -> [{3, 100}];
get_point_attr({104, 1, 12}) -> [{3, 100}];
get_point_attr({104, 1, 13}) -> [{3, 100}];
get_point_attr({104, 1, 14}) -> [{3, 100}];
get_point_attr({104, 1, 15}) -> [{3, 100}];
get_point_attr({104, 1, 16}) -> [{3, 100}];
get_point_attr({104, 1, 17}) -> [{3, 100}];
get_point_attr({104, 1, 18}) -> [{3, 100}];
get_point_attr({104, 1, 19}) -> [{3, 100}];
get_point_attr({104, 1, 20}) -> [{3, 100}];
get_point_attr({104, 1, 21}) -> [{3, 100}];
get_point_attr({104, 1, 22}) -> [{3, 100}];
get_point_attr({104, 1, 23}) -> [{3, 100}];
get_point_attr({104, 1, 24}) -> [{3, 100}];
get_point_attr({104, 1, 25}) -> [{3, 100}];
get_point_attr({104, 1, 26}) -> [{3, 100}];
get_point_attr({104, 1, 27}) -> [{3, 100}];
get_point_attr({104, 1, 28}) -> [{3, 100}];
get_point_attr({104, 1, 29}) -> [{3, 100}];
get_point_attr({104, 1, 30}) -> [{3, 100}];
get_point_attr({104, 1, 31}) -> [{3, 100}];
get_point_attr({104, 1, 32}) -> [{3, 100}];
get_point_attr({104, 1, 33}) -> [{3, 100}];
get_point_attr({104, 1, 34}) -> [{3, 100}];
get_point_attr({104, 1, 35}) -> [{3, 100}];
get_point_attr({104, 1, 36}) -> [{3, 100}];
get_point_attr({104, 1, 37}) -> [{3, 100}];
get_point_attr({104, 1, 38}) -> [{3, 100}];
get_point_attr({104, 1, 39}) -> [{3, 100}];
get_point_attr({104, 1, 40}) -> [{3, 100}];
get_point_attr({104, 1, 41}) -> [{3, 100}];
get_point_attr({104, 1, 42}) -> [{3, 100}];
get_point_attr({104, 1, 43}) -> [{3, 100}];
get_point_attr({104, 1, 44}) -> [{3, 100}];
get_point_attr({104, 1, 45}) -> [{3, 100}];
get_point_attr({104, 1, 46}) -> [{3, 100}];
get_point_attr({104, 1, 47}) -> [{3, 100}];
get_point_attr({104, 1, 48}) -> [{3, 100}];
get_point_attr({104, 1, 49}) -> [{3, 100}];
get_point_attr({104, 1, 50}) -> [{3, 100}];
get_point_attr({104, 1, 51}) -> [{3, 100}];
get_point_attr({104, 1, 52}) -> [{3, 100}];
get_point_attr({104, 1, 53}) -> [{3, 100}];
get_point_attr({104, 1, 54}) -> [{3, 100}];
get_point_attr({104, 1, 55}) -> [{3, 100}];
get_point_attr({104, 1, 56}) -> [{3, 100}];
get_point_attr({104, 1, 57}) -> [{3, 100}];
get_point_attr({104, 1, 58}) -> [{3, 100}];
get_point_attr({104, 1, 59}) -> [{3, 100}];
get_point_attr({104, 1, 60}) -> [{3, 100}];
get_point_attr({104, 1, 61}) -> [{3, 100}];
get_point_attr({104, 1, 62}) -> [{3, 100}];
get_point_attr({104, 1, 63}) -> [{3, 100}];
get_point_attr({104, 1, 64}) -> [{3, 100}];
get_point_attr({104, 1, 65}) -> [{3, 100}];
get_point_attr({104, 1, 66}) -> [{3, 100}];
get_point_attr({104, 1, 67}) -> [{3, 100}];
get_point_attr({104, 1, 68}) -> [{3, 100}];
get_point_attr({104, 1, 69}) -> [{3, 100}];
get_point_attr({104, 1, 70}) -> [{3, 100}];
get_point_attr({104, 1, 71}) -> [{3, 100}];
get_point_attr({104, 1, 72}) -> [{3, 100}];
get_point_attr({104, 1, 73}) -> [{3, 100}];
get_point_attr({104, 1, 74}) -> [{3, 100}];
get_point_attr({104, 1, 75}) -> [{3, 100}];
get_point_attr({104, 1, 76}) -> [{3, 100}];
get_point_attr({104, 1, 77}) -> [{3, 100}];
get_point_attr({104, 1, 78}) -> [{3, 100}];
get_point_attr({104, 1, 79}) -> [{3, 100}];
get_point_attr({104, 1, 80}) -> [{3, 100}];
get_point_attr({104, 1, 81}) -> [{3, 100}];
get_point_attr({104, 1, 82}) -> [{3, 100}];
get_point_attr({104, 1, 83}) -> [{3, 100}];
get_point_attr({104, 1, 84}) -> [{3, 100}];
get_point_attr({104, 1, 85}) -> [{3, 100}];
get_point_attr({104, 1, 86}) -> [{3, 100}];
get_point_attr({104, 1, 87}) -> [{3, 100}];
get_point_attr({104, 1, 88}) -> [{3, 100}];
get_point_attr({104, 1, 89}) -> [{3, 100}];
get_point_attr({104, 1, 90}) -> [{3, 100}];
get_point_attr({104, 1, 91}) -> [{3, 100}];
get_point_attr({104, 1, 92}) -> [{3, 100}];
get_point_attr({104, 1, 93}) -> [{3, 100}];
get_point_attr({104, 1, 94}) -> [{3, 100}];
get_point_attr({104, 1, 95}) -> [{3, 100}];
get_point_attr({104, 1, 96}) -> [{3, 100}];
get_point_attr({104, 1, 97}) -> [{3, 100}];
get_point_attr({104, 1, 98}) -> [{3, 100}];
get_point_attr({104, 1, 99}) -> [{3, 100}];
get_point_attr({104, 1, 100}) -> [{3, 100}];
get_point_attr({104, 1, 101}) -> [{3, 100}];
get_point_attr({104, 1, 102}) -> [{3, 100}];
get_point_attr({104, 1, 103}) -> [{3, 100}];
get_point_attr({104, 1, 104}) -> [{3, 100}];
get_point_attr({104, 1, 105}) -> [{3, 100}];
get_point_attr({104, 1, 106}) -> [{3, 100}];
get_point_attr({104, 1, 107}) -> [{3, 100}];
get_point_attr({104, 1, 108}) -> [{3, 100}];
get_point_attr({104, 1, 109}) -> [{3, 100}];
get_point_attr({104, 1, 110}) -> [{3, 100}];
get_point_attr({104, 1, 111}) -> [{3, 100}];
get_point_attr({104, 1, 112}) -> [{3, 100}];
get_point_attr({104, 1, 113}) -> [{3, 100}];
get_point_attr({104, 1, 114}) -> [{3, 100}];
get_point_attr({104, 1, 115}) -> [{3, 100}];
get_point_attr({104, 1, 116}) -> [{3, 100}];
get_point_attr({104, 1, 117}) -> [{3, 100}];
get_point_attr({104, 1, 118}) -> [{3, 100}];
get_point_attr({104, 1, 119}) -> [{3, 100}];
get_point_attr({104, 1, 120}) -> [{3, 100}];
get_point_attr({104, 1, 121}) -> [{3, 100}];
get_point_attr({104, 1, 122}) -> [{3, 100}];
get_point_attr({104, 1, 123}) -> [{3, 100}];
get_point_attr({104, 1, 124}) -> [{3, 100}];
get_point_attr({104, 1, 125}) -> [{3, 100}];
get_point_attr({104, 1, 126}) -> [{3, 100}];
get_point_attr({104, 1, 127}) -> [{3, 100}];
get_point_attr({104, 1, 128}) -> [{3, 100}];
get_point_attr({104, 1, 129}) -> [{3, 100}];
get_point_attr({104, 1, 130}) -> [{3, 100}];
get_point_attr({105, 1, 1}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 1, 2}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 1, 3}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 1, 4}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 1, 5}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 1, 6}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 1, 7}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 1, 8}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 1, 9}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 1, 10}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 1, 11}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 1, 12}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 1, 13}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 1, 14}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 1, 15}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 1, 16}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 1, 17}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 1, 18}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 1, 19}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 1, 20}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 1, 21}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 1, 22}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 1, 23}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 1, 24}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 1, 25}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 1, 26}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 1, 27}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 1, 28}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 1, 29}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 1, 30}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 1, 31}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 1, 32}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 1, 33}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 1, 34}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 1, 35}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 1, 36}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 1, 37}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 1, 38}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 1, 39}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 1, 40}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 1, 41}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 1, 42}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 1, 43}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 1, 44}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 1, 45}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 1, 46}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 1, 47}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 1, 48}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 1, 49}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 1, 50}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 1, 51}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 1, 52}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 1, 53}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 1, 54}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 1, 55}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 1, 56}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 1, 57}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 1, 58}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 1, 59}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 1, 60}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 1, 61}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 1, 62}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 1, 63}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 1, 64}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 1, 65}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 1, 66}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 1, 67}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 1, 68}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 1, 69}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 1, 70}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 1, 71}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 1, 72}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 1, 73}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 1, 74}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 1, 75}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 1, 76}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 1, 77}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 1, 78}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 1, 79}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 1, 80}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 1, 81}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 1, 82}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 1, 83}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 1, 84}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 1, 85}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 1, 86}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 1, 87}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 1, 88}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 1, 89}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 1, 90}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 1, 91}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 1, 92}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 1, 93}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 1, 94}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 1, 95}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 1, 96}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 1, 97}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 1, 98}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 1, 99}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 1, 100}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 1, 101}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 1, 102}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 1, 103}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 1, 104}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 1, 105}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 1, 106}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 1, 107}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 1, 108}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 1, 109}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 1, 110}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 1, 111}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 1, 112}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 1, 113}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 1, 114}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 1, 115}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 1, 116}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 1, 117}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 1, 118}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 1, 119}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 1, 120}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 1, 121}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 1, 122}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 1, 123}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 1, 124}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 1, 125}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 1, 126}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 1, 127}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 1, 128}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 1, 129}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 1, 130}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({102, 2, 1}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 2, 2}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 2, 3}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 2, 4}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 2, 5}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 2, 6}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 2, 7}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 2, 8}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 2, 9}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 2, 10}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 2, 11}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 2, 12}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 2, 13}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 2, 14}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 2, 15}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 2, 16}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 2, 17}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 2, 18}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 2, 19}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 2, 20}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 2, 21}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 2, 22}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 2, 23}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 2, 24}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 2, 25}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 2, 26}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 2, 27}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 2, 28}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 2, 29}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 2, 30}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 2, 31}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 2, 32}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 2, 33}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 2, 34}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 2, 35}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 2, 36}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 2, 37}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 2, 38}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 2, 39}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 2, 40}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 2, 41}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 2, 42}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 2, 43}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 2, 44}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 2, 45}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 2, 46}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 2, 47}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 2, 48}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 2, 49}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 2, 50}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 2, 51}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 2, 52}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 2, 53}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 2, 54}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 2, 55}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 2, 56}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 2, 57}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 2, 58}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 2, 59}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 2, 60}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 2, 61}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 2, 62}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 2, 63}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 2, 64}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 2, 65}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 2, 66}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 2, 67}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 2, 68}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 2, 69}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 2, 70}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 2, 71}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 2, 72}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 2, 73}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 2, 74}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 2, 75}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 2, 76}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 2, 77}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 2, 78}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 2, 79}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 2, 80}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 2, 81}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 2, 82}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 2, 83}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 2, 84}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 2, 85}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 2, 86}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 2, 87}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 2, 88}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 2, 89}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 2, 90}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 2, 91}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 2, 92}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 2, 93}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 2, 94}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 2, 95}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 2, 96}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 2, 97}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 2, 98}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 2, 99}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 2, 100}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 2, 101}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 2, 102}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 2, 103}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 2, 104}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 2, 105}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 2, 106}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 2, 107}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 2, 108}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 2, 109}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 2, 110}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 2, 111}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 2, 112}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 2, 113}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 2, 114}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 2, 115}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 2, 116}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 2, 117}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 2, 118}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 2, 119}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 2, 120}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 2, 121}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 2, 122}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 2, 123}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 2, 124}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 2, 125}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 2, 126}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 2, 127}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 2, 128}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 2, 129}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 2, 130}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({101, 2, 1}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 2, 2}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 2, 3}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 2, 4}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 2, 5}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 2, 6}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 2, 7}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 2, 8}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 2, 9}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 2, 10}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 2, 11}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 2, 12}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 2, 13}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 2, 14}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 2, 15}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 2, 16}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 2, 17}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 2, 18}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 2, 19}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 2, 20}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 2, 21}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 2, 22}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 2, 23}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 2, 24}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 2, 25}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 2, 26}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 2, 27}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 2, 28}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 2, 29}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 2, 30}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 2, 31}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 2, 32}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 2, 33}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 2, 34}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 2, 35}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 2, 36}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 2, 37}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 2, 38}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 2, 39}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 2, 40}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 2, 41}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 2, 42}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 2, 43}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 2, 44}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 2, 45}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 2, 46}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 2, 47}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 2, 48}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 2, 49}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 2, 50}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 2, 51}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 2, 52}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 2, 53}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 2, 54}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 2, 55}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 2, 56}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 2, 57}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 2, 58}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 2, 59}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 2, 60}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 2, 61}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 2, 62}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 2, 63}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 2, 64}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 2, 65}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 2, 66}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 2, 67}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 2, 68}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 2, 69}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 2, 70}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 2, 71}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 2, 72}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 2, 73}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 2, 74}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 2, 75}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 2, 76}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 2, 77}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 2, 78}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 2, 79}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 2, 80}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 2, 81}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 2, 82}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 2, 83}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 2, 84}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 2, 85}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 2, 86}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 2, 87}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 2, 88}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 2, 89}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 2, 90}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 2, 91}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 2, 92}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 2, 93}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 2, 94}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 2, 95}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 2, 96}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 2, 97}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 2, 98}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 2, 99}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 2, 100}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 2, 101}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 2, 102}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 2, 103}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 2, 104}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 2, 105}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 2, 106}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 2, 107}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 2, 108}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 2, 109}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 2, 110}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 2, 111}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 2, 112}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 2, 113}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 2, 114}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 2, 115}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 2, 116}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 2, 117}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 2, 118}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 2, 119}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 2, 120}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 2, 121}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 2, 122}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 2, 123}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 2, 124}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 2, 125}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 2, 126}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 2, 127}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 2, 128}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 2, 129}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 2, 130}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({103, 2, 1}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 2, 2}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 2, 3}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 2, 4}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 2, 5}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 2, 6}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 2, 7}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 2, 8}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 2, 9}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 2, 10}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 2, 11}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 2, 12}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 2, 13}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 2, 14}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 2, 15}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 2, 16}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 2, 17}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 2, 18}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 2, 19}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 2, 20}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 2, 21}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 2, 22}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 2, 23}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 2, 24}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 2, 25}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 2, 26}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 2, 27}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 2, 28}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 2, 29}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 2, 30}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 2, 31}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 2, 32}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 2, 33}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 2, 34}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 2, 35}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 2, 36}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 2, 37}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 2, 38}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 2, 39}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 2, 40}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 2, 41}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 2, 42}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 2, 43}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 2, 44}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 2, 45}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 2, 46}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 2, 47}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 2, 48}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 2, 49}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 2, 50}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 2, 51}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 2, 52}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 2, 53}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 2, 54}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 2, 55}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 2, 56}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 2, 57}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 2, 58}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 2, 59}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 2, 60}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 2, 61}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 2, 62}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 2, 63}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 2, 64}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 2, 65}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 2, 66}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 2, 67}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 2, 68}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 2, 69}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 2, 70}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 2, 71}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 2, 72}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 2, 73}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 2, 74}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 2, 75}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 2, 76}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 2, 77}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 2, 78}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 2, 79}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 2, 80}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 2, 81}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 2, 82}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 2, 83}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 2, 84}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 2, 85}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 2, 86}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 2, 87}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 2, 88}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 2, 89}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 2, 90}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 2, 91}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 2, 92}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 2, 93}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 2, 94}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 2, 95}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 2, 96}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 2, 97}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 2, 98}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 2, 99}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 2, 100}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 2, 101}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 2, 102}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 2, 103}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 2, 104}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 2, 105}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 2, 106}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 2, 107}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 2, 108}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 2, 109}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 2, 110}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 2, 111}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 2, 112}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 2, 113}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 2, 114}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 2, 115}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 2, 116}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 2, 117}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 2, 118}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 2, 119}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 2, 120}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 2, 121}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 2, 122}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 2, 123}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 2, 124}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 2, 125}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 2, 126}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 2, 127}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 2, 128}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 2, 129}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 2, 130}) -> [{5, 350}, {7, 280}];
get_point_attr({104, 2, 1}) -> [{3, 100}];
get_point_attr({104, 2, 2}) -> [{3, 100}];
get_point_attr({104, 2, 3}) -> [{3, 100}];
get_point_attr({104, 2, 4}) -> [{3, 100}];
get_point_attr({104, 2, 5}) -> [{3, 100}];
get_point_attr({104, 2, 6}) -> [{3, 100}];
get_point_attr({104, 2, 7}) -> [{3, 100}];
get_point_attr({104, 2, 8}) -> [{3, 100}];
get_point_attr({104, 2, 9}) -> [{3, 100}];
get_point_attr({104, 2, 10}) -> [{3, 100}];
get_point_attr({104, 2, 11}) -> [{3, 100}];
get_point_attr({104, 2, 12}) -> [{3, 100}];
get_point_attr({104, 2, 13}) -> [{3, 100}];
get_point_attr({104, 2, 14}) -> [{3, 100}];
get_point_attr({104, 2, 15}) -> [{3, 100}];
get_point_attr({104, 2, 16}) -> [{3, 100}];
get_point_attr({104, 2, 17}) -> [{3, 100}];
get_point_attr({104, 2, 18}) -> [{3, 100}];
get_point_attr({104, 2, 19}) -> [{3, 100}];
get_point_attr({104, 2, 20}) -> [{3, 100}];
get_point_attr({104, 2, 21}) -> [{3, 100}];
get_point_attr({104, 2, 22}) -> [{3, 100}];
get_point_attr({104, 2, 23}) -> [{3, 100}];
get_point_attr({104, 2, 24}) -> [{3, 100}];
get_point_attr({104, 2, 25}) -> [{3, 100}];
get_point_attr({104, 2, 26}) -> [{3, 100}];
get_point_attr({104, 2, 27}) -> [{3, 100}];
get_point_attr({104, 2, 28}) -> [{3, 100}];
get_point_attr({104, 2, 29}) -> [{3, 100}];
get_point_attr({104, 2, 30}) -> [{3, 100}];
get_point_attr({104, 2, 31}) -> [{3, 100}];
get_point_attr({104, 2, 32}) -> [{3, 100}];
get_point_attr({104, 2, 33}) -> [{3, 100}];
get_point_attr({104, 2, 34}) -> [{3, 100}];
get_point_attr({104, 2, 35}) -> [{3, 100}];
get_point_attr({104, 2, 36}) -> [{3, 100}];
get_point_attr({104, 2, 37}) -> [{3, 100}];
get_point_attr({104, 2, 38}) -> [{3, 100}];
get_point_attr({104, 2, 39}) -> [{3, 100}];
get_point_attr({104, 2, 40}) -> [{3, 100}];
get_point_attr({104, 2, 41}) -> [{3, 100}];
get_point_attr({104, 2, 42}) -> [{3, 100}];
get_point_attr({104, 2, 43}) -> [{3, 100}];
get_point_attr({104, 2, 44}) -> [{3, 100}];
get_point_attr({104, 2, 45}) -> [{3, 100}];
get_point_attr({104, 2, 46}) -> [{3, 100}];
get_point_attr({104, 2, 47}) -> [{3, 100}];
get_point_attr({104, 2, 48}) -> [{3, 100}];
get_point_attr({104, 2, 49}) -> [{3, 100}];
get_point_attr({104, 2, 50}) -> [{3, 100}];
get_point_attr({104, 2, 51}) -> [{3, 100}];
get_point_attr({104, 2, 52}) -> [{3, 100}];
get_point_attr({104, 2, 53}) -> [{3, 100}];
get_point_attr({104, 2, 54}) -> [{3, 100}];
get_point_attr({104, 2, 55}) -> [{3, 100}];
get_point_attr({104, 2, 56}) -> [{3, 100}];
get_point_attr({104, 2, 57}) -> [{3, 100}];
get_point_attr({104, 2, 58}) -> [{3, 100}];
get_point_attr({104, 2, 59}) -> [{3, 100}];
get_point_attr({104, 2, 60}) -> [{3, 100}];
get_point_attr({104, 2, 61}) -> [{3, 100}];
get_point_attr({104, 2, 62}) -> [{3, 100}];
get_point_attr({104, 2, 63}) -> [{3, 100}];
get_point_attr({104, 2, 64}) -> [{3, 100}];
get_point_attr({104, 2, 65}) -> [{3, 100}];
get_point_attr({104, 2, 66}) -> [{3, 100}];
get_point_attr({104, 2, 67}) -> [{3, 100}];
get_point_attr({104, 2, 68}) -> [{3, 100}];
get_point_attr({104, 2, 69}) -> [{3, 100}];
get_point_attr({104, 2, 70}) -> [{3, 100}];
get_point_attr({104, 2, 71}) -> [{3, 100}];
get_point_attr({104, 2, 72}) -> [{3, 100}];
get_point_attr({104, 2, 73}) -> [{3, 100}];
get_point_attr({104, 2, 74}) -> [{3, 100}];
get_point_attr({104, 2, 75}) -> [{3, 100}];
get_point_attr({104, 2, 76}) -> [{3, 100}];
get_point_attr({104, 2, 77}) -> [{3, 100}];
get_point_attr({104, 2, 78}) -> [{3, 100}];
get_point_attr({104, 2, 79}) -> [{3, 100}];
get_point_attr({104, 2, 80}) -> [{3, 100}];
get_point_attr({104, 2, 81}) -> [{3, 100}];
get_point_attr({104, 2, 82}) -> [{3, 100}];
get_point_attr({104, 2, 83}) -> [{3, 100}];
get_point_attr({104, 2, 84}) -> [{3, 100}];
get_point_attr({104, 2, 85}) -> [{3, 100}];
get_point_attr({104, 2, 86}) -> [{3, 100}];
get_point_attr({104, 2, 87}) -> [{3, 100}];
get_point_attr({104, 2, 88}) -> [{3, 100}];
get_point_attr({104, 2, 89}) -> [{3, 100}];
get_point_attr({104, 2, 90}) -> [{3, 100}];
get_point_attr({104, 2, 91}) -> [{3, 100}];
get_point_attr({104, 2, 92}) -> [{3, 100}];
get_point_attr({104, 2, 93}) -> [{3, 100}];
get_point_attr({104, 2, 94}) -> [{3, 100}];
get_point_attr({104, 2, 95}) -> [{3, 100}];
get_point_attr({104, 2, 96}) -> [{3, 100}];
get_point_attr({104, 2, 97}) -> [{3, 100}];
get_point_attr({104, 2, 98}) -> [{3, 100}];
get_point_attr({104, 2, 99}) -> [{3, 100}];
get_point_attr({104, 2, 100}) -> [{3, 100}];
get_point_attr({104, 2, 101}) -> [{3, 100}];
get_point_attr({104, 2, 102}) -> [{3, 100}];
get_point_attr({104, 2, 103}) -> [{3, 100}];
get_point_attr({104, 2, 104}) -> [{3, 100}];
get_point_attr({104, 2, 105}) -> [{3, 100}];
get_point_attr({104, 2, 106}) -> [{3, 100}];
get_point_attr({104, 2, 107}) -> [{3, 100}];
get_point_attr({104, 2, 108}) -> [{3, 100}];
get_point_attr({104, 2, 109}) -> [{3, 100}];
get_point_attr({104, 2, 110}) -> [{3, 100}];
get_point_attr({104, 2, 111}) -> [{3, 100}];
get_point_attr({104, 2, 112}) -> [{3, 100}];
get_point_attr({104, 2, 113}) -> [{3, 100}];
get_point_attr({104, 2, 114}) -> [{3, 100}];
get_point_attr({104, 2, 115}) -> [{3, 100}];
get_point_attr({104, 2, 116}) -> [{3, 100}];
get_point_attr({104, 2, 117}) -> [{3, 100}];
get_point_attr({104, 2, 118}) -> [{3, 100}];
get_point_attr({104, 2, 119}) -> [{3, 100}];
get_point_attr({104, 2, 120}) -> [{3, 100}];
get_point_attr({104, 2, 121}) -> [{3, 100}];
get_point_attr({104, 2, 122}) -> [{3, 100}];
get_point_attr({104, 2, 123}) -> [{3, 100}];
get_point_attr({104, 2, 124}) -> [{3, 100}];
get_point_attr({104, 2, 125}) -> [{3, 100}];
get_point_attr({104, 2, 126}) -> [{3, 100}];
get_point_attr({104, 2, 127}) -> [{3, 100}];
get_point_attr({104, 2, 128}) -> [{3, 100}];
get_point_attr({104, 2, 129}) -> [{3, 100}];
get_point_attr({104, 2, 130}) -> [{3, 100}];
get_point_attr({105, 2, 1}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 2, 2}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 2, 3}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 2, 4}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 2, 5}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 2, 6}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 2, 7}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 2, 8}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 2, 9}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 2, 10}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 2, 11}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 2, 12}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 2, 13}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 2, 14}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 2, 15}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 2, 16}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 2, 17}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 2, 18}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 2, 19}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 2, 20}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 2, 21}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 2, 22}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 2, 23}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 2, 24}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 2, 25}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 2, 26}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 2, 27}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 2, 28}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 2, 29}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 2, 30}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 2, 31}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 2, 32}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 2, 33}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 2, 34}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 2, 35}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 2, 36}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 2, 37}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 2, 38}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 2, 39}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 2, 40}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 2, 41}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 2, 42}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 2, 43}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 2, 44}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 2, 45}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 2, 46}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 2, 47}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 2, 48}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 2, 49}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 2, 50}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 2, 51}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 2, 52}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 2, 53}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 2, 54}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 2, 55}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 2, 56}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 2, 57}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 2, 58}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 2, 59}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 2, 60}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 2, 61}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 2, 62}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 2, 63}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 2, 64}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 2, 65}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 2, 66}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 2, 67}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 2, 68}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 2, 69}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 2, 70}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 2, 71}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 2, 72}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 2, 73}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 2, 74}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 2, 75}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 2, 76}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 2, 77}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 2, 78}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 2, 79}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 2, 80}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 2, 81}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 2, 82}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 2, 83}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 2, 84}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 2, 85}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 2, 86}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 2, 87}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 2, 88}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 2, 89}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 2, 90}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 2, 91}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 2, 92}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 2, 93}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 2, 94}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 2, 95}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 2, 96}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 2, 97}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 2, 98}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 2, 99}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 2, 100}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 2, 101}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 2, 102}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 2, 103}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 2, 104}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 2, 105}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 2, 106}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 2, 107}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 2, 108}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 2, 109}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 2, 110}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 2, 111}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 2, 112}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 2, 113}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 2, 114}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 2, 115}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 2, 116}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 2, 117}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 2, 118}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 2, 119}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 2, 120}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 2, 121}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 2, 122}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 2, 123}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 2, 124}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 2, 125}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 2, 126}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 2, 127}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 2, 128}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 2, 129}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 2, 130}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({102, 3, 1}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 3, 2}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 3, 3}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 3, 4}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 3, 5}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 3, 6}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 3, 7}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 3, 8}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 3, 9}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 3, 10}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 3, 11}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 3, 12}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 3, 13}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 3, 14}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 3, 15}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 3, 16}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 3, 17}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 3, 18}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 3, 19}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 3, 20}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 3, 21}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 3, 22}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 3, 23}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 3, 24}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 3, 25}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 3, 26}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 3, 27}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 3, 28}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 3, 29}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 3, 30}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 3, 31}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 3, 32}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 3, 33}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 3, 34}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 3, 35}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 3, 36}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 3, 37}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 3, 38}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 3, 39}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 3, 40}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 3, 41}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 3, 42}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 3, 43}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 3, 44}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 3, 45}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 3, 46}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 3, 47}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 3, 48}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 3, 49}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 3, 50}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 3, 51}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 3, 52}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 3, 53}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 3, 54}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 3, 55}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 3, 56}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 3, 57}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 3, 58}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 3, 59}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 3, 60}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 3, 61}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 3, 62}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 3, 63}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 3, 64}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 3, 65}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 3, 66}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 3, 67}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 3, 68}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 3, 69}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 3, 70}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 3, 71}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 3, 72}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 3, 73}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 3, 74}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 3, 75}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 3, 76}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 3, 77}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 3, 78}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 3, 79}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 3, 80}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 3, 81}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 3, 82}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 3, 83}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 3, 84}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 3, 85}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 3, 86}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 3, 87}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 3, 88}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 3, 89}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 3, 90}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 3, 91}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 3, 92}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 3, 93}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 3, 94}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 3, 95}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 3, 96}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 3, 97}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 3, 98}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 3, 99}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 3, 100}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 3, 101}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 3, 102}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 3, 103}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 3, 104}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 3, 105}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 3, 106}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 3, 107}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 3, 108}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 3, 109}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 3, 110}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 3, 111}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 3, 112}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 3, 113}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 3, 114}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 3, 115}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 3, 116}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 3, 117}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 3, 118}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 3, 119}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 3, 120}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 3, 121}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 3, 122}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 3, 123}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 3, 124}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 3, 125}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 3, 126}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 3, 127}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 3, 128}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 3, 129}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 3, 130}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({101, 3, 1}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 3, 2}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 3, 3}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 3, 4}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 3, 5}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 3, 6}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 3, 7}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 3, 8}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 3, 9}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 3, 10}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 3, 11}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 3, 12}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 3, 13}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 3, 14}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 3, 15}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 3, 16}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 3, 17}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 3, 18}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 3, 19}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 3, 20}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 3, 21}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 3, 22}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 3, 23}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 3, 24}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 3, 25}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 3, 26}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 3, 27}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 3, 28}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 3, 29}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 3, 30}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 3, 31}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 3, 32}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 3, 33}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 3, 34}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 3, 35}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 3, 36}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 3, 37}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 3, 38}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 3, 39}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 3, 40}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 3, 41}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 3, 42}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 3, 43}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 3, 44}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 3, 45}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 3, 46}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 3, 47}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 3, 48}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 3, 49}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 3, 50}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 3, 51}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 3, 52}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 3, 53}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 3, 54}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 3, 55}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 3, 56}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 3, 57}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 3, 58}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 3, 59}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 3, 60}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 3, 61}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 3, 62}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 3, 63}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 3, 64}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 3, 65}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 3, 66}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 3, 67}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 3, 68}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 3, 69}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 3, 70}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 3, 71}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 3, 72}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 3, 73}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 3, 74}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 3, 75}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 3, 76}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 3, 77}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 3, 78}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 3, 79}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 3, 80}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 3, 81}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 3, 82}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 3, 83}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 3, 84}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 3, 85}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 3, 86}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 3, 87}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 3, 88}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 3, 89}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 3, 90}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 3, 91}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 3, 92}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 3, 93}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 3, 94}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 3, 95}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 3, 96}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 3, 97}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 3, 98}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 3, 99}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 3, 100}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 3, 101}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 3, 102}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 3, 103}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 3, 104}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 3, 105}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 3, 106}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 3, 107}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 3, 108}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 3, 109}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 3, 110}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 3, 111}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 3, 112}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 3, 113}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 3, 114}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 3, 115}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 3, 116}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 3, 117}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 3, 118}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 3, 119}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 3, 120}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 3, 121}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 3, 122}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 3, 123}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 3, 124}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 3, 125}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 3, 126}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 3, 127}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 3, 128}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 3, 129}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 3, 130}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({103, 3, 1}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 3, 2}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 3, 3}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 3, 4}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 3, 5}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 3, 6}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 3, 7}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 3, 8}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 3, 9}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 3, 10}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 3, 11}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 3, 12}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 3, 13}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 3, 14}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 3, 15}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 3, 16}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 3, 17}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 3, 18}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 3, 19}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 3, 20}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 3, 21}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 3, 22}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 3, 23}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 3, 24}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 3, 25}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 3, 26}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 3, 27}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 3, 28}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 3, 29}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 3, 30}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 3, 31}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 3, 32}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 3, 33}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 3, 34}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 3, 35}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 3, 36}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 3, 37}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 3, 38}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 3, 39}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 3, 40}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 3, 41}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 3, 42}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 3, 43}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 3, 44}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 3, 45}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 3, 46}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 3, 47}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 3, 48}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 3, 49}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 3, 50}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 3, 51}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 3, 52}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 3, 53}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 3, 54}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 3, 55}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 3, 56}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 3, 57}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 3, 58}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 3, 59}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 3, 60}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 3, 61}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 3, 62}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 3, 63}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 3, 64}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 3, 65}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 3, 66}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 3, 67}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 3, 68}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 3, 69}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 3, 70}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 3, 71}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 3, 72}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 3, 73}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 3, 74}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 3, 75}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 3, 76}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 3, 77}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 3, 78}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 3, 79}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 3, 80}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 3, 81}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 3, 82}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 3, 83}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 3, 84}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 3, 85}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 3, 86}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 3, 87}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 3, 88}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 3, 89}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 3, 90}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 3, 91}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 3, 92}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 3, 93}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 3, 94}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 3, 95}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 3, 96}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 3, 97}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 3, 98}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 3, 99}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 3, 100}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 3, 101}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 3, 102}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 3, 103}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 3, 104}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 3, 105}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 3, 106}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 3, 107}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 3, 108}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 3, 109}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 3, 110}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 3, 111}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 3, 112}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 3, 113}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 3, 114}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 3, 115}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 3, 116}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 3, 117}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 3, 118}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 3, 119}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 3, 120}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 3, 121}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 3, 122}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 3, 123}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 3, 124}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 3, 125}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 3, 126}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 3, 127}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 3, 128}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 3, 129}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 3, 130}) -> [{5, 350}, {7, 280}];
get_point_attr({104, 3, 1}) -> [{3, 100}];
get_point_attr({104, 3, 2}) -> [{3, 100}];
get_point_attr({104, 3, 3}) -> [{3, 100}];
get_point_attr({104, 3, 4}) -> [{3, 100}];
get_point_attr({104, 3, 5}) -> [{3, 100}];
get_point_attr({104, 3, 6}) -> [{3, 100}];
get_point_attr({104, 3, 7}) -> [{3, 100}];
get_point_attr({104, 3, 8}) -> [{3, 100}];
get_point_attr({104, 3, 9}) -> [{3, 100}];
get_point_attr({104, 3, 10}) -> [{3, 100}];
get_point_attr({104, 3, 11}) -> [{3, 100}];
get_point_attr({104, 3, 12}) -> [{3, 100}];
get_point_attr({104, 3, 13}) -> [{3, 100}];
get_point_attr({104, 3, 14}) -> [{3, 100}];
get_point_attr({104, 3, 15}) -> [{3, 100}];
get_point_attr({104, 3, 16}) -> [{3, 100}];
get_point_attr({104, 3, 17}) -> [{3, 100}];
get_point_attr({104, 3, 18}) -> [{3, 100}];
get_point_attr({104, 3, 19}) -> [{3, 100}];
get_point_attr({104, 3, 20}) -> [{3, 100}];
get_point_attr({104, 3, 21}) -> [{3, 100}];
get_point_attr({104, 3, 22}) -> [{3, 100}];
get_point_attr({104, 3, 23}) -> [{3, 100}];
get_point_attr({104, 3, 24}) -> [{3, 100}];
get_point_attr({104, 3, 25}) -> [{3, 100}];
get_point_attr({104, 3, 26}) -> [{3, 100}];
get_point_attr({104, 3, 27}) -> [{3, 100}];
get_point_attr({104, 3, 28}) -> [{3, 100}];
get_point_attr({104, 3, 29}) -> [{3, 100}];
get_point_attr({104, 3, 30}) -> [{3, 100}];
get_point_attr({104, 3, 31}) -> [{3, 100}];
get_point_attr({104, 3, 32}) -> [{3, 100}];
get_point_attr({104, 3, 33}) -> [{3, 100}];
get_point_attr({104, 3, 34}) -> [{3, 100}];
get_point_attr({104, 3, 35}) -> [{3, 100}];
get_point_attr({104, 3, 36}) -> [{3, 100}];
get_point_attr({104, 3, 37}) -> [{3, 100}];
get_point_attr({104, 3, 38}) -> [{3, 100}];
get_point_attr({104, 3, 39}) -> [{3, 100}];
get_point_attr({104, 3, 40}) -> [{3, 100}];
get_point_attr({104, 3, 41}) -> [{3, 100}];
get_point_attr({104, 3, 42}) -> [{3, 100}];
get_point_attr({104, 3, 43}) -> [{3, 100}];
get_point_attr({104, 3, 44}) -> [{3, 100}];
get_point_attr({104, 3, 45}) -> [{3, 100}];
get_point_attr({104, 3, 46}) -> [{3, 100}];
get_point_attr({104, 3, 47}) -> [{3, 100}];
get_point_attr({104, 3, 48}) -> [{3, 100}];
get_point_attr({104, 3, 49}) -> [{3, 100}];
get_point_attr({104, 3, 50}) -> [{3, 100}];
get_point_attr({104, 3, 51}) -> [{3, 100}];
get_point_attr({104, 3, 52}) -> [{3, 100}];
get_point_attr({104, 3, 53}) -> [{3, 100}];
get_point_attr({104, 3, 54}) -> [{3, 100}];
get_point_attr({104, 3, 55}) -> [{3, 100}];
get_point_attr({104, 3, 56}) -> [{3, 100}];
get_point_attr({104, 3, 57}) -> [{3, 100}];
get_point_attr({104, 3, 58}) -> [{3, 100}];
get_point_attr({104, 3, 59}) -> [{3, 100}];
get_point_attr({104, 3, 60}) -> [{3, 100}];
get_point_attr({104, 3, 61}) -> [{3, 100}];
get_point_attr({104, 3, 62}) -> [{3, 100}];
get_point_attr({104, 3, 63}) -> [{3, 100}];
get_point_attr({104, 3, 64}) -> [{3, 100}];
get_point_attr({104, 3, 65}) -> [{3, 100}];
get_point_attr({104, 3, 66}) -> [{3, 100}];
get_point_attr({104, 3, 67}) -> [{3, 100}];
get_point_attr({104, 3, 68}) -> [{3, 100}];
get_point_attr({104, 3, 69}) -> [{3, 100}];
get_point_attr({104, 3, 70}) -> [{3, 100}];
get_point_attr({104, 3, 71}) -> [{3, 100}];
get_point_attr({104, 3, 72}) -> [{3, 100}];
get_point_attr({104, 3, 73}) -> [{3, 100}];
get_point_attr({104, 3, 74}) -> [{3, 100}];
get_point_attr({104, 3, 75}) -> [{3, 100}];
get_point_attr({104, 3, 76}) -> [{3, 100}];
get_point_attr({104, 3, 77}) -> [{3, 100}];
get_point_attr({104, 3, 78}) -> [{3, 100}];
get_point_attr({104, 3, 79}) -> [{3, 100}];
get_point_attr({104, 3, 80}) -> [{3, 100}];
get_point_attr({104, 3, 81}) -> [{3, 100}];
get_point_attr({104, 3, 82}) -> [{3, 100}];
get_point_attr({104, 3, 83}) -> [{3, 100}];
get_point_attr({104, 3, 84}) -> [{3, 100}];
get_point_attr({104, 3, 85}) -> [{3, 100}];
get_point_attr({104, 3, 86}) -> [{3, 100}];
get_point_attr({104, 3, 87}) -> [{3, 100}];
get_point_attr({104, 3, 88}) -> [{3, 100}];
get_point_attr({104, 3, 89}) -> [{3, 100}];
get_point_attr({104, 3, 90}) -> [{3, 100}];
get_point_attr({104, 3, 91}) -> [{3, 100}];
get_point_attr({104, 3, 92}) -> [{3, 100}];
get_point_attr({104, 3, 93}) -> [{3, 100}];
get_point_attr({104, 3, 94}) -> [{3, 100}];
get_point_attr({104, 3, 95}) -> [{3, 100}];
get_point_attr({104, 3, 96}) -> [{3, 100}];
get_point_attr({104, 3, 97}) -> [{3, 100}];
get_point_attr({104, 3, 98}) -> [{3, 100}];
get_point_attr({104, 3, 99}) -> [{3, 100}];
get_point_attr({104, 3, 100}) -> [{3, 100}];
get_point_attr({104, 3, 101}) -> [{3, 100}];
get_point_attr({104, 3, 102}) -> [{3, 100}];
get_point_attr({104, 3, 103}) -> [{3, 100}];
get_point_attr({104, 3, 104}) -> [{3, 100}];
get_point_attr({104, 3, 105}) -> [{3, 100}];
get_point_attr({104, 3, 106}) -> [{3, 100}];
get_point_attr({104, 3, 107}) -> [{3, 100}];
get_point_attr({104, 3, 108}) -> [{3, 100}];
get_point_attr({104, 3, 109}) -> [{3, 100}];
get_point_attr({104, 3, 110}) -> [{3, 100}];
get_point_attr({104, 3, 111}) -> [{3, 100}];
get_point_attr({104, 3, 112}) -> [{3, 100}];
get_point_attr({104, 3, 113}) -> [{3, 100}];
get_point_attr({104, 3, 114}) -> [{3, 100}];
get_point_attr({104, 3, 115}) -> [{3, 100}];
get_point_attr({104, 3, 116}) -> [{3, 100}];
get_point_attr({104, 3, 117}) -> [{3, 100}];
get_point_attr({104, 3, 118}) -> [{3, 100}];
get_point_attr({104, 3, 119}) -> [{3, 100}];
get_point_attr({104, 3, 120}) -> [{3, 100}];
get_point_attr({104, 3, 121}) -> [{3, 100}];
get_point_attr({104, 3, 122}) -> [{3, 100}];
get_point_attr({104, 3, 123}) -> [{3, 100}];
get_point_attr({104, 3, 124}) -> [{3, 100}];
get_point_attr({104, 3, 125}) -> [{3, 100}];
get_point_attr({104, 3, 126}) -> [{3, 100}];
get_point_attr({104, 3, 127}) -> [{3, 100}];
get_point_attr({104, 3, 128}) -> [{3, 100}];
get_point_attr({104, 3, 129}) -> [{3, 100}];
get_point_attr({104, 3, 130}) -> [{3, 100}];
get_point_attr({105, 3, 1}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 3, 2}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 3, 3}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 3, 4}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 3, 5}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 3, 6}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 3, 7}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 3, 8}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 3, 9}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 3, 10}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 3, 11}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 3, 12}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 3, 13}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 3, 14}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 3, 15}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 3, 16}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 3, 17}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 3, 18}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 3, 19}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 3, 20}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 3, 21}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 3, 22}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 3, 23}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 3, 24}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 3, 25}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 3, 26}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 3, 27}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 3, 28}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 3, 29}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 3, 30}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 3, 31}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 3, 32}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 3, 33}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 3, 34}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 3, 35}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 3, 36}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 3, 37}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 3, 38}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 3, 39}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 3, 40}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 3, 41}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 3, 42}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 3, 43}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 3, 44}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 3, 45}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 3, 46}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 3, 47}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 3, 48}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 3, 49}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 3, 50}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 3, 51}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 3, 52}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 3, 53}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 3, 54}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 3, 55}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 3, 56}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 3, 57}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 3, 58}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 3, 59}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 3, 60}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 3, 61}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 3, 62}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 3, 63}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 3, 64}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 3, 65}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 3, 66}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 3, 67}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 3, 68}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 3, 69}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 3, 70}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 3, 71}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 3, 72}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 3, 73}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 3, 74}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 3, 75}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 3, 76}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 3, 77}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 3, 78}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 3, 79}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 3, 80}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 3, 81}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 3, 82}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 3, 83}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 3, 84}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 3, 85}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 3, 86}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 3, 87}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 3, 88}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 3, 89}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 3, 90}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 3, 91}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 3, 92}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 3, 93}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 3, 94}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 3, 95}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 3, 96}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 3, 97}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 3, 98}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 3, 99}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 3, 100}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 3, 101}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 3, 102}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 3, 103}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 3, 104}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 3, 105}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 3, 106}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 3, 107}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 3, 108}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 3, 109}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 3, 110}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 3, 111}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 3, 112}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 3, 113}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 3, 114}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 3, 115}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 3, 116}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 3, 117}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 3, 118}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 3, 119}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 3, 120}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 3, 121}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 3, 122}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 3, 123}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 3, 124}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 3, 125}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 3, 126}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 3, 127}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 3, 128}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 3, 129}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 3, 130}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({102, 4, 1}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 4, 2}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 4, 3}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 4, 4}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 4, 5}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 4, 6}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 4, 7}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 4, 8}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 4, 9}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 4, 10}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 4, 11}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 4, 12}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 4, 13}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 4, 14}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 4, 15}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 4, 16}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 4, 17}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 4, 18}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 4, 19}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 4, 20}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 4, 21}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 4, 22}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 4, 23}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 4, 24}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 4, 25}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 4, 26}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 4, 27}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 4, 28}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 4, 29}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 4, 30}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 4, 31}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 4, 32}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 4, 33}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 4, 34}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 4, 35}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 4, 36}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 4, 37}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 4, 38}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 4, 39}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 4, 40}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 4, 41}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 4, 42}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 4, 43}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 4, 44}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 4, 45}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 4, 46}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 4, 47}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 4, 48}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 4, 49}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 4, 50}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 4, 51}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 4, 52}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 4, 53}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 4, 54}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 4, 55}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 4, 56}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 4, 57}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 4, 58}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 4, 59}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 4, 60}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 4, 61}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 4, 62}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 4, 63}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 4, 64}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 4, 65}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 4, 66}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 4, 67}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 4, 68}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 4, 69}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 4, 70}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 4, 71}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 4, 72}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 4, 73}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 4, 74}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 4, 75}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 4, 76}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 4, 77}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 4, 78}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 4, 79}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 4, 80}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 4, 81}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 4, 82}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 4, 83}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 4, 84}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 4, 85}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 4, 86}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 4, 87}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 4, 88}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 4, 89}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 4, 90}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 4, 91}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 4, 92}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 4, 93}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 4, 94}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 4, 95}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 4, 96}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 4, 97}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 4, 98}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 4, 99}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 4, 100}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 4, 101}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 4, 102}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 4, 103}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 4, 104}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 4, 105}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 4, 106}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 4, 107}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 4, 108}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 4, 109}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 4, 110}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 4, 111}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 4, 112}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 4, 113}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 4, 114}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 4, 115}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 4, 116}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 4, 117}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 4, 118}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 4, 119}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 4, 120}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 4, 121}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 4, 122}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 4, 123}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 4, 124}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 4, 125}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 4, 126}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 4, 127}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 4, 128}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 4, 129}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 4, 130}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({101, 4, 1}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 4, 2}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 4, 3}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 4, 4}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 4, 5}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 4, 6}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 4, 7}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 4, 8}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 4, 9}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 4, 10}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 4, 11}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 4, 12}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 4, 13}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 4, 14}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 4, 15}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 4, 16}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 4, 17}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 4, 18}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 4, 19}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 4, 20}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 4, 21}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 4, 22}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 4, 23}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 4, 24}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 4, 25}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 4, 26}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 4, 27}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 4, 28}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 4, 29}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 4, 30}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 4, 31}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 4, 32}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 4, 33}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 4, 34}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 4, 35}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 4, 36}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 4, 37}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 4, 38}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 4, 39}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 4, 40}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 4, 41}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 4, 42}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 4, 43}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 4, 44}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 4, 45}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 4, 46}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 4, 47}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 4, 48}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 4, 49}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 4, 50}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 4, 51}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 4, 52}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 4, 53}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 4, 54}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 4, 55}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 4, 56}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 4, 57}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 4, 58}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 4, 59}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 4, 60}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 4, 61}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 4, 62}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 4, 63}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 4, 64}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 4, 65}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 4, 66}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 4, 67}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 4, 68}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 4, 69}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 4, 70}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 4, 71}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 4, 72}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 4, 73}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 4, 74}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 4, 75}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 4, 76}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 4, 77}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 4, 78}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 4, 79}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 4, 80}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 4, 81}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 4, 82}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 4, 83}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 4, 84}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 4, 85}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 4, 86}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 4, 87}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 4, 88}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 4, 89}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 4, 90}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 4, 91}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 4, 92}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 4, 93}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 4, 94}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 4, 95}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 4, 96}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 4, 97}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 4, 98}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 4, 99}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 4, 100}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 4, 101}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 4, 102}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 4, 103}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 4, 104}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 4, 105}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 4, 106}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 4, 107}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 4, 108}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 4, 109}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 4, 110}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 4, 111}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 4, 112}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 4, 113}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 4, 114}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 4, 115}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 4, 116}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 4, 117}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 4, 118}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 4, 119}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 4, 120}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 4, 121}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 4, 122}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 4, 123}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 4, 124}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 4, 125}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 4, 126}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 4, 127}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 4, 128}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 4, 129}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 4, 130}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({103, 4, 1}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 4, 2}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 4, 3}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 4, 4}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 4, 5}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 4, 6}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 4, 7}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 4, 8}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 4, 9}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 4, 10}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 4, 11}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 4, 12}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 4, 13}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 4, 14}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 4, 15}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 4, 16}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 4, 17}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 4, 18}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 4, 19}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 4, 20}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 4, 21}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 4, 22}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 4, 23}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 4, 24}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 4, 25}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 4, 26}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 4, 27}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 4, 28}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 4, 29}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 4, 30}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 4, 31}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 4, 32}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 4, 33}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 4, 34}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 4, 35}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 4, 36}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 4, 37}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 4, 38}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 4, 39}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 4, 40}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 4, 41}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 4, 42}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 4, 43}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 4, 44}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 4, 45}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 4, 46}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 4, 47}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 4, 48}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 4, 49}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 4, 50}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 4, 51}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 4, 52}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 4, 53}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 4, 54}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 4, 55}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 4, 56}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 4, 57}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 4, 58}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 4, 59}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 4, 60}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 4, 61}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 4, 62}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 4, 63}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 4, 64}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 4, 65}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 4, 66}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 4, 67}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 4, 68}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 4, 69}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 4, 70}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 4, 71}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 4, 72}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 4, 73}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 4, 74}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 4, 75}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 4, 76}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 4, 77}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 4, 78}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 4, 79}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 4, 80}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 4, 81}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 4, 82}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 4, 83}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 4, 84}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 4, 85}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 4, 86}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 4, 87}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 4, 88}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 4, 89}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 4, 90}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 4, 91}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 4, 92}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 4, 93}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 4, 94}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 4, 95}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 4, 96}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 4, 97}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 4, 98}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 4, 99}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 4, 100}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 4, 101}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 4, 102}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 4, 103}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 4, 104}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 4, 105}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 4, 106}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 4, 107}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 4, 108}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 4, 109}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 4, 110}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 4, 111}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 4, 112}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 4, 113}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 4, 114}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 4, 115}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 4, 116}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 4, 117}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 4, 118}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 4, 119}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 4, 120}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 4, 121}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 4, 122}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 4, 123}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 4, 124}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 4, 125}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 4, 126}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 4, 127}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 4, 128}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 4, 129}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 4, 130}) -> [{5, 350}, {7, 280}];
get_point_attr({104, 4, 1}) -> [{3, 100}];
get_point_attr({104, 4, 2}) -> [{3, 100}];
get_point_attr({104, 4, 3}) -> [{3, 100}];
get_point_attr({104, 4, 4}) -> [{3, 100}];
get_point_attr({104, 4, 5}) -> [{3, 100}];
get_point_attr({104, 4, 6}) -> [{3, 100}];
get_point_attr({104, 4, 7}) -> [{3, 100}];
get_point_attr({104, 4, 8}) -> [{3, 100}];
get_point_attr({104, 4, 9}) -> [{3, 100}];
get_point_attr({104, 4, 10}) -> [{3, 100}];
get_point_attr({104, 4, 11}) -> [{3, 100}];
get_point_attr({104, 4, 12}) -> [{3, 100}];
get_point_attr({104, 4, 13}) -> [{3, 100}];
get_point_attr({104, 4, 14}) -> [{3, 100}];
get_point_attr({104, 4, 15}) -> [{3, 100}];
get_point_attr({104, 4, 16}) -> [{3, 100}];
get_point_attr({104, 4, 17}) -> [{3, 100}];
get_point_attr({104, 4, 18}) -> [{3, 100}];
get_point_attr({104, 4, 19}) -> [{3, 100}];
get_point_attr({104, 4, 20}) -> [{3, 100}];
get_point_attr({104, 4, 21}) -> [{3, 100}];
get_point_attr({104, 4, 22}) -> [{3, 100}];
get_point_attr({104, 4, 23}) -> [{3, 100}];
get_point_attr({104, 4, 24}) -> [{3, 100}];
get_point_attr({104, 4, 25}) -> [{3, 100}];
get_point_attr({104, 4, 26}) -> [{3, 100}];
get_point_attr({104, 4, 27}) -> [{3, 100}];
get_point_attr({104, 4, 28}) -> [{3, 100}];
get_point_attr({104, 4, 29}) -> [{3, 100}];
get_point_attr({104, 4, 30}) -> [{3, 100}];
get_point_attr({104, 4, 31}) -> [{3, 100}];
get_point_attr({104, 4, 32}) -> [{3, 100}];
get_point_attr({104, 4, 33}) -> [{3, 100}];
get_point_attr({104, 4, 34}) -> [{3, 100}];
get_point_attr({104, 4, 35}) -> [{3, 100}];
get_point_attr({104, 4, 36}) -> [{3, 100}];
get_point_attr({104, 4, 37}) -> [{3, 100}];
get_point_attr({104, 4, 38}) -> [{3, 100}];
get_point_attr({104, 4, 39}) -> [{3, 100}];
get_point_attr({104, 4, 40}) -> [{3, 100}];
get_point_attr({104, 4, 41}) -> [{3, 100}];
get_point_attr({104, 4, 42}) -> [{3, 100}];
get_point_attr({104, 4, 43}) -> [{3, 100}];
get_point_attr({104, 4, 44}) -> [{3, 100}];
get_point_attr({104, 4, 45}) -> [{3, 100}];
get_point_attr({104, 4, 46}) -> [{3, 100}];
get_point_attr({104, 4, 47}) -> [{3, 100}];
get_point_attr({104, 4, 48}) -> [{3, 100}];
get_point_attr({104, 4, 49}) -> [{3, 100}];
get_point_attr({104, 4, 50}) -> [{3, 100}];
get_point_attr({104, 4, 51}) -> [{3, 100}];
get_point_attr({104, 4, 52}) -> [{3, 100}];
get_point_attr({104, 4, 53}) -> [{3, 100}];
get_point_attr({104, 4, 54}) -> [{3, 100}];
get_point_attr({104, 4, 55}) -> [{3, 100}];
get_point_attr({104, 4, 56}) -> [{3, 100}];
get_point_attr({104, 4, 57}) -> [{3, 100}];
get_point_attr({104, 4, 58}) -> [{3, 100}];
get_point_attr({104, 4, 59}) -> [{3, 100}];
get_point_attr({104, 4, 60}) -> [{3, 100}];
get_point_attr({104, 4, 61}) -> [{3, 100}];
get_point_attr({104, 4, 62}) -> [{3, 100}];
get_point_attr({104, 4, 63}) -> [{3, 100}];
get_point_attr({104, 4, 64}) -> [{3, 100}];
get_point_attr({104, 4, 65}) -> [{3, 100}];
get_point_attr({104, 4, 66}) -> [{3, 100}];
get_point_attr({104, 4, 67}) -> [{3, 100}];
get_point_attr({104, 4, 68}) -> [{3, 100}];
get_point_attr({104, 4, 69}) -> [{3, 100}];
get_point_attr({104, 4, 70}) -> [{3, 100}];
get_point_attr({104, 4, 71}) -> [{3, 100}];
get_point_attr({104, 4, 72}) -> [{3, 100}];
get_point_attr({104, 4, 73}) -> [{3, 100}];
get_point_attr({104, 4, 74}) -> [{3, 100}];
get_point_attr({104, 4, 75}) -> [{3, 100}];
get_point_attr({104, 4, 76}) -> [{3, 100}];
get_point_attr({104, 4, 77}) -> [{3, 100}];
get_point_attr({104, 4, 78}) -> [{3, 100}];
get_point_attr({104, 4, 79}) -> [{3, 100}];
get_point_attr({104, 4, 80}) -> [{3, 100}];
get_point_attr({104, 4, 81}) -> [{3, 100}];
get_point_attr({104, 4, 82}) -> [{3, 100}];
get_point_attr({104, 4, 83}) -> [{3, 100}];
get_point_attr({104, 4, 84}) -> [{3, 100}];
get_point_attr({104, 4, 85}) -> [{3, 100}];
get_point_attr({104, 4, 86}) -> [{3, 100}];
get_point_attr({104, 4, 87}) -> [{3, 100}];
get_point_attr({104, 4, 88}) -> [{3, 100}];
get_point_attr({104, 4, 89}) -> [{3, 100}];
get_point_attr({104, 4, 90}) -> [{3, 100}];
get_point_attr({104, 4, 91}) -> [{3, 100}];
get_point_attr({104, 4, 92}) -> [{3, 100}];
get_point_attr({104, 4, 93}) -> [{3, 100}];
get_point_attr({104, 4, 94}) -> [{3, 100}];
get_point_attr({104, 4, 95}) -> [{3, 100}];
get_point_attr({104, 4, 96}) -> [{3, 100}];
get_point_attr({104, 4, 97}) -> [{3, 100}];
get_point_attr({104, 4, 98}) -> [{3, 100}];
get_point_attr({104, 4, 99}) -> [{3, 100}];
get_point_attr({104, 4, 100}) -> [{3, 100}];
get_point_attr({104, 4, 101}) -> [{3, 100}];
get_point_attr({104, 4, 102}) -> [{3, 100}];
get_point_attr({104, 4, 103}) -> [{3, 100}];
get_point_attr({104, 4, 104}) -> [{3, 100}];
get_point_attr({104, 4, 105}) -> [{3, 100}];
get_point_attr({104, 4, 106}) -> [{3, 100}];
get_point_attr({104, 4, 107}) -> [{3, 100}];
get_point_attr({104, 4, 108}) -> [{3, 100}];
get_point_attr({104, 4, 109}) -> [{3, 100}];
get_point_attr({104, 4, 110}) -> [{3, 100}];
get_point_attr({104, 4, 111}) -> [{3, 100}];
get_point_attr({104, 4, 112}) -> [{3, 100}];
get_point_attr({104, 4, 113}) -> [{3, 100}];
get_point_attr({104, 4, 114}) -> [{3, 100}];
get_point_attr({104, 4, 115}) -> [{3, 100}];
get_point_attr({104, 4, 116}) -> [{3, 100}];
get_point_attr({104, 4, 117}) -> [{3, 100}];
get_point_attr({104, 4, 118}) -> [{3, 100}];
get_point_attr({104, 4, 119}) -> [{3, 100}];
get_point_attr({104, 4, 120}) -> [{3, 100}];
get_point_attr({104, 4, 121}) -> [{3, 100}];
get_point_attr({104, 4, 122}) -> [{3, 100}];
get_point_attr({104, 4, 123}) -> [{3, 100}];
get_point_attr({104, 4, 124}) -> [{3, 100}];
get_point_attr({104, 4, 125}) -> [{3, 100}];
get_point_attr({104, 4, 126}) -> [{3, 100}];
get_point_attr({104, 4, 127}) -> [{3, 100}];
get_point_attr({104, 4, 128}) -> [{3, 100}];
get_point_attr({104, 4, 129}) -> [{3, 100}];
get_point_attr({104, 4, 130}) -> [{3, 100}];
get_point_attr({105, 4, 1}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 4, 2}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 4, 3}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 4, 4}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 4, 5}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 4, 6}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 4, 7}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 4, 8}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 4, 9}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 4, 10}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 4, 11}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 4, 12}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 4, 13}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 4, 14}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 4, 15}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 4, 16}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 4, 17}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 4, 18}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 4, 19}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 4, 20}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 4, 21}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 4, 22}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 4, 23}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 4, 24}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 4, 25}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 4, 26}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 4, 27}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 4, 28}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 4, 29}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 4, 30}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 4, 31}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 4, 32}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 4, 33}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 4, 34}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 4, 35}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 4, 36}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 4, 37}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 4, 38}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 4, 39}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 4, 40}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 4, 41}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 4, 42}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 4, 43}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 4, 44}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 4, 45}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 4, 46}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 4, 47}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 4, 48}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 4, 49}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 4, 50}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 4, 51}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 4, 52}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 4, 53}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 4, 54}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 4, 55}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 4, 56}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 4, 57}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 4, 58}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 4, 59}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 4, 60}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 4, 61}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 4, 62}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 4, 63}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 4, 64}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 4, 65}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 4, 66}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 4, 67}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 4, 68}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 4, 69}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 4, 70}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 4, 71}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 4, 72}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 4, 73}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 4, 74}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 4, 75}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 4, 76}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 4, 77}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 4, 78}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 4, 79}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 4, 80}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 4, 81}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 4, 82}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 4, 83}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 4, 84}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 4, 85}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 4, 86}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 4, 87}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 4, 88}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 4, 89}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 4, 90}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 4, 91}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 4, 92}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 4, 93}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 4, 94}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 4, 95}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 4, 96}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 4, 97}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 4, 98}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 4, 99}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 4, 100}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 4, 101}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 4, 102}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 4, 103}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 4, 104}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 4, 105}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 4, 106}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 4, 107}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 4, 108}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 4, 109}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 4, 110}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 4, 111}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 4, 112}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 4, 113}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 4, 114}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 4, 115}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 4, 116}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 4, 117}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 4, 118}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 4, 119}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 4, 120}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 4, 121}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 4, 122}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 4, 123}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 4, 124}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 4, 125}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 4, 126}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 4, 127}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 4, 128}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 4, 129}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 4, 130}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({102, 5, 1}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 5, 2}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 5, 3}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 5, 4}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 5, 5}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 5, 6}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 5, 7}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 5, 8}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 5, 9}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 5, 10}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 5, 11}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 5, 12}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 5, 13}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 5, 14}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 5, 15}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 5, 16}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 5, 17}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 5, 18}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 5, 19}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 5, 20}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 5, 21}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 5, 22}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 5, 23}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 5, 24}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 5, 25}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 5, 26}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 5, 27}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 5, 28}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 5, 29}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 5, 30}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 5, 31}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 5, 32}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 5, 33}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 5, 34}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 5, 35}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 5, 36}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 5, 37}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 5, 38}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 5, 39}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 5, 40}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 5, 41}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 5, 42}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 5, 43}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 5, 44}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 5, 45}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 5, 46}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 5, 47}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 5, 48}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 5, 49}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 5, 50}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 5, 51}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 5, 52}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 5, 53}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 5, 54}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 5, 55}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 5, 56}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 5, 57}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 5, 58}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 5, 59}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 5, 60}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 5, 61}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 5, 62}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 5, 63}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 5, 64}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 5, 65}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 5, 66}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 5, 67}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 5, 68}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 5, 69}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 5, 70}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 5, 71}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 5, 72}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 5, 73}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 5, 74}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 5, 75}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 5, 76}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 5, 77}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 5, 78}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 5, 79}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 5, 80}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 5, 81}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 5, 82}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 5, 83}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 5, 84}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 5, 85}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 5, 86}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 5, 87}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 5, 88}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 5, 89}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 5, 90}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 5, 91}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 5, 92}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 5, 93}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 5, 94}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 5, 95}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 5, 96}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 5, 97}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 5, 98}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 5, 99}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 5, 100}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 5, 101}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 5, 102}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 5, 103}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 5, 104}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 5, 105}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 5, 106}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 5, 107}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 5, 108}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 5, 109}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 5, 110}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 5, 111}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 5, 112}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 5, 113}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 5, 114}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 5, 115}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 5, 116}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 5, 117}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 5, 118}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 5, 119}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 5, 120}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 5, 121}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 5, 122}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 5, 123}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 5, 124}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 5, 125}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 5, 126}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 5, 127}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 5, 128}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 5, 129}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 5, 130}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({101, 5, 1}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 5, 2}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 5, 3}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 5, 4}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 5, 5}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 5, 6}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 5, 7}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 5, 8}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 5, 9}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 5, 10}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 5, 11}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 5, 12}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 5, 13}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 5, 14}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 5, 15}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 5, 16}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 5, 17}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 5, 18}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 5, 19}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 5, 20}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 5, 21}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 5, 22}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 5, 23}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 5, 24}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 5, 25}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 5, 26}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 5, 27}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 5, 28}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 5, 29}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 5, 30}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 5, 31}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 5, 32}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 5, 33}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 5, 34}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 5, 35}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 5, 36}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 5, 37}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 5, 38}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 5, 39}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 5, 40}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 5, 41}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 5, 42}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 5, 43}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 5, 44}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 5, 45}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 5, 46}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 5, 47}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 5, 48}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 5, 49}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 5, 50}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 5, 51}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 5, 52}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 5, 53}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 5, 54}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 5, 55}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 5, 56}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 5, 57}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 5, 58}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 5, 59}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 5, 60}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 5, 61}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 5, 62}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 5, 63}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 5, 64}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 5, 65}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 5, 66}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 5, 67}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 5, 68}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 5, 69}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 5, 70}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 5, 71}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 5, 72}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 5, 73}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 5, 74}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 5, 75}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 5, 76}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 5, 77}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 5, 78}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 5, 79}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 5, 80}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 5, 81}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 5, 82}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 5, 83}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 5, 84}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 5, 85}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 5, 86}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 5, 87}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 5, 88}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 5, 89}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 5, 90}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 5, 91}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 5, 92}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 5, 93}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 5, 94}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 5, 95}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 5, 96}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 5, 97}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 5, 98}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 5, 99}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 5, 100}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 5, 101}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 5, 102}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 5, 103}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 5, 104}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 5, 105}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 5, 106}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 5, 107}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 5, 108}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 5, 109}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 5, 110}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 5, 111}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 5, 112}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 5, 113}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 5, 114}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 5, 115}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 5, 116}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 5, 117}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 5, 118}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 5, 119}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 5, 120}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 5, 121}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 5, 122}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 5, 123}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 5, 124}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 5, 125}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 5, 126}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 5, 127}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 5, 128}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 5, 129}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 5, 130}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({103, 5, 1}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 5, 2}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 5, 3}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 5, 4}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 5, 5}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 5, 6}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 5, 7}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 5, 8}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 5, 9}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 5, 10}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 5, 11}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 5, 12}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 5, 13}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 5, 14}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 5, 15}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 5, 16}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 5, 17}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 5, 18}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 5, 19}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 5, 20}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 5, 21}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 5, 22}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 5, 23}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 5, 24}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 5, 25}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 5, 26}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 5, 27}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 5, 28}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 5, 29}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 5, 30}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 5, 31}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 5, 32}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 5, 33}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 5, 34}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 5, 35}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 5, 36}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 5, 37}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 5, 38}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 5, 39}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 5, 40}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 5, 41}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 5, 42}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 5, 43}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 5, 44}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 5, 45}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 5, 46}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 5, 47}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 5, 48}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 5, 49}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 5, 50}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 5, 51}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 5, 52}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 5, 53}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 5, 54}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 5, 55}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 5, 56}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 5, 57}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 5, 58}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 5, 59}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 5, 60}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 5, 61}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 5, 62}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 5, 63}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 5, 64}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 5, 65}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 5, 66}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 5, 67}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 5, 68}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 5, 69}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 5, 70}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 5, 71}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 5, 72}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 5, 73}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 5, 74}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 5, 75}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 5, 76}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 5, 77}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 5, 78}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 5, 79}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 5, 80}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 5, 81}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 5, 82}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 5, 83}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 5, 84}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 5, 85}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 5, 86}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 5, 87}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 5, 88}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 5, 89}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 5, 90}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 5, 91}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 5, 92}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 5, 93}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 5, 94}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 5, 95}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 5, 96}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 5, 97}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 5, 98}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 5, 99}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 5, 100}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 5, 101}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 5, 102}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 5, 103}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 5, 104}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 5, 105}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 5, 106}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 5, 107}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 5, 108}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 5, 109}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 5, 110}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 5, 111}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 5, 112}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 5, 113}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 5, 114}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 5, 115}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 5, 116}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 5, 117}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 5, 118}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 5, 119}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 5, 120}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 5, 121}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 5, 122}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 5, 123}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 5, 124}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 5, 125}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 5, 126}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 5, 127}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 5, 128}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 5, 129}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 5, 130}) -> [{5, 350}, {7, 280}];
get_point_attr({104, 5, 1}) -> [{3, 100}];
get_point_attr({104, 5, 2}) -> [{3, 100}];
get_point_attr({104, 5, 3}) -> [{3, 100}];
get_point_attr({104, 5, 4}) -> [{3, 100}];
get_point_attr({104, 5, 5}) -> [{3, 100}];
get_point_attr({104, 5, 6}) -> [{3, 100}];
get_point_attr({104, 5, 7}) -> [{3, 100}];
get_point_attr({104, 5, 8}) -> [{3, 100}];
get_point_attr({104, 5, 9}) -> [{3, 100}];
get_point_attr({104, 5, 10}) -> [{3, 100}];
get_point_attr({104, 5, 11}) -> [{3, 100}];
get_point_attr({104, 5, 12}) -> [{3, 100}];
get_point_attr({104, 5, 13}) -> [{3, 100}];
get_point_attr({104, 5, 14}) -> [{3, 100}];
get_point_attr({104, 5, 15}) -> [{3, 100}];
get_point_attr({104, 5, 16}) -> [{3, 100}];
get_point_attr({104, 5, 17}) -> [{3, 100}];
get_point_attr({104, 5, 18}) -> [{3, 100}];
get_point_attr({104, 5, 19}) -> [{3, 100}];
get_point_attr({104, 5, 20}) -> [{3, 100}];
get_point_attr({104, 5, 21}) -> [{3, 100}];
get_point_attr({104, 5, 22}) -> [{3, 100}];
get_point_attr({104, 5, 23}) -> [{3, 100}];
get_point_attr({104, 5, 24}) -> [{3, 100}];
get_point_attr({104, 5, 25}) -> [{3, 100}];
get_point_attr({104, 5, 26}) -> [{3, 100}];
get_point_attr({104, 5, 27}) -> [{3, 100}];
get_point_attr({104, 5, 28}) -> [{3, 100}];
get_point_attr({104, 5, 29}) -> [{3, 100}];
get_point_attr({104, 5, 30}) -> [{3, 100}];
get_point_attr({104, 5, 31}) -> [{3, 100}];
get_point_attr({104, 5, 32}) -> [{3, 100}];
get_point_attr({104, 5, 33}) -> [{3, 100}];
get_point_attr({104, 5, 34}) -> [{3, 100}];
get_point_attr({104, 5, 35}) -> [{3, 100}];
get_point_attr({104, 5, 36}) -> [{3, 100}];
get_point_attr({104, 5, 37}) -> [{3, 100}];
get_point_attr({104, 5, 38}) -> [{3, 100}];
get_point_attr({104, 5, 39}) -> [{3, 100}];
get_point_attr({104, 5, 40}) -> [{3, 100}];
get_point_attr({104, 5, 41}) -> [{3, 100}];
get_point_attr({104, 5, 42}) -> [{3, 100}];
get_point_attr({104, 5, 43}) -> [{3, 100}];
get_point_attr({104, 5, 44}) -> [{3, 100}];
get_point_attr({104, 5, 45}) -> [{3, 100}];
get_point_attr({104, 5, 46}) -> [{3, 100}];
get_point_attr({104, 5, 47}) -> [{3, 100}];
get_point_attr({104, 5, 48}) -> [{3, 100}];
get_point_attr({104, 5, 49}) -> [{3, 100}];
get_point_attr({104, 5, 50}) -> [{3, 100}];
get_point_attr({104, 5, 51}) -> [{3, 100}];
get_point_attr({104, 5, 52}) -> [{3, 100}];
get_point_attr({104, 5, 53}) -> [{3, 100}];
get_point_attr({104, 5, 54}) -> [{3, 100}];
get_point_attr({104, 5, 55}) -> [{3, 100}];
get_point_attr({104, 5, 56}) -> [{3, 100}];
get_point_attr({104, 5, 57}) -> [{3, 100}];
get_point_attr({104, 5, 58}) -> [{3, 100}];
get_point_attr({104, 5, 59}) -> [{3, 100}];
get_point_attr({104, 5, 60}) -> [{3, 100}];
get_point_attr({104, 5, 61}) -> [{3, 100}];
get_point_attr({104, 5, 62}) -> [{3, 100}];
get_point_attr({104, 5, 63}) -> [{3, 100}];
get_point_attr({104, 5, 64}) -> [{3, 100}];
get_point_attr({104, 5, 65}) -> [{3, 100}];
get_point_attr({104, 5, 66}) -> [{3, 100}];
get_point_attr({104, 5, 67}) -> [{3, 100}];
get_point_attr({104, 5, 68}) -> [{3, 100}];
get_point_attr({104, 5, 69}) -> [{3, 100}];
get_point_attr({104, 5, 70}) -> [{3, 100}];
get_point_attr({104, 5, 71}) -> [{3, 100}];
get_point_attr({104, 5, 72}) -> [{3, 100}];
get_point_attr({104, 5, 73}) -> [{3, 100}];
get_point_attr({104, 5, 74}) -> [{3, 100}];
get_point_attr({104, 5, 75}) -> [{3, 100}];
get_point_attr({104, 5, 76}) -> [{3, 100}];
get_point_attr({104, 5, 77}) -> [{3, 100}];
get_point_attr({104, 5, 78}) -> [{3, 100}];
get_point_attr({104, 5, 79}) -> [{3, 100}];
get_point_attr({104, 5, 80}) -> [{3, 100}];
get_point_attr({104, 5, 81}) -> [{3, 100}];
get_point_attr({104, 5, 82}) -> [{3, 100}];
get_point_attr({104, 5, 83}) -> [{3, 100}];
get_point_attr({104, 5, 84}) -> [{3, 100}];
get_point_attr({104, 5, 85}) -> [{3, 100}];
get_point_attr({104, 5, 86}) -> [{3, 100}];
get_point_attr({104, 5, 87}) -> [{3, 100}];
get_point_attr({104, 5, 88}) -> [{3, 100}];
get_point_attr({104, 5, 89}) -> [{3, 100}];
get_point_attr({104, 5, 90}) -> [{3, 100}];
get_point_attr({104, 5, 91}) -> [{3, 100}];
get_point_attr({104, 5, 92}) -> [{3, 100}];
get_point_attr({104, 5, 93}) -> [{3, 100}];
get_point_attr({104, 5, 94}) -> [{3, 100}];
get_point_attr({104, 5, 95}) -> [{3, 100}];
get_point_attr({104, 5, 96}) -> [{3, 100}];
get_point_attr({104, 5, 97}) -> [{3, 100}];
get_point_attr({104, 5, 98}) -> [{3, 100}];
get_point_attr({104, 5, 99}) -> [{3, 100}];
get_point_attr({104, 5, 100}) -> [{3, 100}];
get_point_attr({104, 5, 101}) -> [{3, 100}];
get_point_attr({104, 5, 102}) -> [{3, 100}];
get_point_attr({104, 5, 103}) -> [{3, 100}];
get_point_attr({104, 5, 104}) -> [{3, 100}];
get_point_attr({104, 5, 105}) -> [{3, 100}];
get_point_attr({104, 5, 106}) -> [{3, 100}];
get_point_attr({104, 5, 107}) -> [{3, 100}];
get_point_attr({104, 5, 108}) -> [{3, 100}];
get_point_attr({104, 5, 109}) -> [{3, 100}];
get_point_attr({104, 5, 110}) -> [{3, 100}];
get_point_attr({104, 5, 111}) -> [{3, 100}];
get_point_attr({104, 5, 112}) -> [{3, 100}];
get_point_attr({104, 5, 113}) -> [{3, 100}];
get_point_attr({104, 5, 114}) -> [{3, 100}];
get_point_attr({104, 5, 115}) -> [{3, 100}];
get_point_attr({104, 5, 116}) -> [{3, 100}];
get_point_attr({104, 5, 117}) -> [{3, 100}];
get_point_attr({104, 5, 118}) -> [{3, 100}];
get_point_attr({104, 5, 119}) -> [{3, 100}];
get_point_attr({104, 5, 120}) -> [{3, 100}];
get_point_attr({104, 5, 121}) -> [{3, 100}];
get_point_attr({104, 5, 122}) -> [{3, 100}];
get_point_attr({104, 5, 123}) -> [{3, 100}];
get_point_attr({104, 5, 124}) -> [{3, 100}];
get_point_attr({104, 5, 125}) -> [{3, 100}];
get_point_attr({104, 5, 126}) -> [{3, 100}];
get_point_attr({104, 5, 127}) -> [{3, 100}];
get_point_attr({104, 5, 128}) -> [{3, 100}];
get_point_attr({104, 5, 129}) -> [{3, 100}];
get_point_attr({104, 5, 130}) -> [{3, 100}];
get_point_attr({105, 5, 1}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 5, 2}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 5, 3}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 5, 4}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 5, 5}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 5, 6}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 5, 7}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 5, 8}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 5, 9}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 5, 10}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 5, 11}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 5, 12}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 5, 13}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 5, 14}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 5, 15}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 5, 16}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 5, 17}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 5, 18}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 5, 19}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 5, 20}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 5, 21}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 5, 22}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 5, 23}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 5, 24}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 5, 25}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 5, 26}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 5, 27}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 5, 28}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 5, 29}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 5, 30}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 5, 31}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 5, 32}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 5, 33}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 5, 34}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 5, 35}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 5, 36}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 5, 37}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 5, 38}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 5, 39}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 5, 40}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 5, 41}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 5, 42}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 5, 43}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 5, 44}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 5, 45}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 5, 46}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 5, 47}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 5, 48}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 5, 49}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 5, 50}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 5, 51}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 5, 52}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 5, 53}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 5, 54}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 5, 55}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 5, 56}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 5, 57}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 5, 58}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 5, 59}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 5, 60}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 5, 61}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 5, 62}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 5, 63}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 5, 64}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 5, 65}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 5, 66}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 5, 67}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 5, 68}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 5, 69}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 5, 70}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 5, 71}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 5, 72}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 5, 73}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 5, 74}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 5, 75}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 5, 76}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 5, 77}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 5, 78}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 5, 79}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 5, 80}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 5, 81}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 5, 82}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 5, 83}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 5, 84}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 5, 85}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 5, 86}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 5, 87}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 5, 88}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 5, 89}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 5, 90}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 5, 91}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 5, 92}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 5, 93}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 5, 94}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 5, 95}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 5, 96}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 5, 97}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 5, 98}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 5, 99}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 5, 100}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 5, 101}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 5, 102}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 5, 103}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 5, 104}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 5, 105}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 5, 106}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 5, 107}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 5, 108}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 5, 109}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 5, 110}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 5, 111}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 5, 112}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 5, 113}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 5, 114}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 5, 115}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 5, 116}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 5, 117}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 5, 118}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 5, 119}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 5, 120}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 5, 121}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 5, 122}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 5, 123}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 5, 124}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 5, 125}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 5, 126}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 5, 127}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 5, 128}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 5, 129}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 5, 130}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({102, 6, 1}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 6, 2}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 6, 3}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 6, 4}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 6, 5}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 6, 6}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 6, 7}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 6, 8}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 6, 9}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 6, 10}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 6, 11}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 6, 12}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 6, 13}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 6, 14}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 6, 15}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 6, 16}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 6, 17}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 6, 18}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 6, 19}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 6, 20}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 6, 21}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 6, 22}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 6, 23}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 6, 24}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 6, 25}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 6, 26}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 6, 27}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 6, 28}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 6, 29}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 6, 30}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 6, 31}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 6, 32}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 6, 33}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 6, 34}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 6, 35}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 6, 36}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 6, 37}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 6, 38}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 6, 39}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 6, 40}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 6, 41}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 6, 42}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 6, 43}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 6, 44}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 6, 45}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 6, 46}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 6, 47}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 6, 48}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 6, 49}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 6, 50}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 6, 51}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 6, 52}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 6, 53}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 6, 54}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 6, 55}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 6, 56}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 6, 57}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 6, 58}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 6, 59}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 6, 60}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 6, 61}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 6, 62}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 6, 63}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 6, 64}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 6, 65}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 6, 66}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 6, 67}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 6, 68}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 6, 69}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 6, 70}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 6, 71}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 6, 72}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 6, 73}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 6, 74}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 6, 75}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 6, 76}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 6, 77}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 6, 78}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 6, 79}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 6, 80}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 6, 81}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 6, 82}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 6, 83}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 6, 84}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 6, 85}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 6, 86}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 6, 87}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 6, 88}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 6, 89}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 6, 90}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 6, 91}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 6, 92}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 6, 93}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 6, 94}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 6, 95}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 6, 96}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 6, 97}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 6, 98}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 6, 99}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 6, 100}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 6, 101}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 6, 102}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 6, 103}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 6, 104}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 6, 105}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 6, 106}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 6, 107}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 6, 108}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 6, 109}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 6, 110}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 6, 111}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 6, 112}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 6, 113}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 6, 114}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 6, 115}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 6, 116}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 6, 117}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 6, 118}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 6, 119}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 6, 120}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 6, 121}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 6, 122}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 6, 123}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 6, 124}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 6, 125}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 6, 126}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 6, 127}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 6, 128}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 6, 129}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({102, 6, 130}) ->
    [{1, 3500}, {7, 20}, {3, 10}];
get_point_attr({101, 6, 1}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 6, 2}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 6, 3}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 6, 4}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 6, 5}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 6, 6}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 6, 7}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 6, 8}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 6, 9}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 6, 10}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 6, 11}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 6, 12}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 6, 13}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 6, 14}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 6, 15}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 6, 16}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 6, 17}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 6, 18}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 6, 19}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 6, 20}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 6, 21}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 6, 22}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 6, 23}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 6, 24}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 6, 25}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 6, 26}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 6, 27}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 6, 28}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 6, 29}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 6, 30}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 6, 31}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 6, 32}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 6, 33}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 6, 34}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 6, 35}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 6, 36}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 6, 37}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 6, 38}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 6, 39}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 6, 40}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 6, 41}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 6, 42}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 6, 43}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 6, 44}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 6, 45}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 6, 46}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 6, 47}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 6, 48}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 6, 49}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 6, 50}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 6, 51}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 6, 52}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 6, 53}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 6, 54}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 6, 55}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 6, 56}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 6, 57}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 6, 58}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 6, 59}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 6, 60}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 6, 61}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 6, 62}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 6, 63}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 6, 64}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 6, 65}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 6, 66}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 6, 67}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 6, 68}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 6, 69}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 6, 70}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 6, 71}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 6, 72}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 6, 73}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 6, 74}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 6, 75}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 6, 76}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 6, 77}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 6, 78}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 6, 79}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 6, 80}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 6, 81}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 6, 82}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 6, 83}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 6, 84}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 6, 85}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 6, 86}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 6, 87}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 6, 88}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 6, 89}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 6, 90}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 6, 91}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 6, 92}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 6, 93}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 6, 94}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 6, 95}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 6, 96}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 6, 97}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 6, 98}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 6, 99}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 6, 100}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 6, 101}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 6, 102}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 6, 103}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 6, 104}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 6, 105}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 6, 106}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 6, 107}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 6, 108}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 6, 109}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 6, 110}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 6, 111}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 6, 112}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 6, 113}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 6, 114}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 6, 115}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 6, 116}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 6, 117}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 6, 118}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 6, 119}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 6, 120}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 6, 121}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 6, 122}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 6, 123}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 6, 124}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 6, 125}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 6, 126}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 6, 127}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 6, 128}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 6, 129}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 6, 130}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({103, 6, 1}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 6, 2}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 6, 3}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 6, 4}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 6, 5}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 6, 6}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 6, 7}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 6, 8}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 6, 9}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 6, 10}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 6, 11}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 6, 12}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 6, 13}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 6, 14}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 6, 15}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 6, 16}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 6, 17}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 6, 18}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 6, 19}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 6, 20}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 6, 21}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 6, 22}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 6, 23}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 6, 24}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 6, 25}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 6, 26}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 6, 27}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 6, 28}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 6, 29}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 6, 30}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 6, 31}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 6, 32}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 6, 33}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 6, 34}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 6, 35}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 6, 36}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 6, 37}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 6, 38}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 6, 39}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 6, 40}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 6, 41}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 6, 42}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 6, 43}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 6, 44}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 6, 45}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 6, 46}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 6, 47}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 6, 48}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 6, 49}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 6, 50}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 6, 51}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 6, 52}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 6, 53}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 6, 54}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 6, 55}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 6, 56}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 6, 57}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 6, 58}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 6, 59}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 6, 60}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 6, 61}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 6, 62}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 6, 63}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 6, 64}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 6, 65}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 6, 66}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 6, 67}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 6, 68}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 6, 69}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 6, 70}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 6, 71}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 6, 72}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 6, 73}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 6, 74}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 6, 75}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 6, 76}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 6, 77}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 6, 78}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 6, 79}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 6, 80}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 6, 81}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 6, 82}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 6, 83}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 6, 84}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 6, 85}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 6, 86}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 6, 87}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 6, 88}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 6, 89}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 6, 90}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 6, 91}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 6, 92}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 6, 93}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 6, 94}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 6, 95}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 6, 96}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 6, 97}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 6, 98}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 6, 99}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 6, 100}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 6, 101}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 6, 102}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 6, 103}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 6, 104}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 6, 105}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 6, 106}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 6, 107}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 6, 108}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 6, 109}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 6, 110}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 6, 111}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 6, 112}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 6, 113}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 6, 114}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 6, 115}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 6, 116}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 6, 117}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 6, 118}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 6, 119}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 6, 120}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 6, 121}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 6, 122}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 6, 123}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 6, 124}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 6, 125}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 6, 126}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 6, 127}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 6, 128}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 6, 129}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 6, 130}) -> [{5, 350}, {7, 280}];
get_point_attr({104, 6, 1}) -> [{3, 100}, {6, 120}];
get_point_attr({104, 6, 2}) -> [{3, 100}, {6, 120}];
get_point_attr({104, 6, 3}) -> [{3, 100}, {6, 120}];
get_point_attr({104, 6, 4}) -> [{3, 100}, {6, 120}];
get_point_attr({104, 6, 5}) -> [{3, 100}, {6, 120}];
get_point_attr({104, 6, 6}) -> [{3, 100}, {6, 120}];
get_point_attr({104, 6, 7}) -> [{3, 100}, {6, 120}];
get_point_attr({104, 6, 8}) -> [{3, 100}, {6, 120}];
get_point_attr({104, 6, 9}) -> [{3, 100}, {6, 120}];
get_point_attr({104, 6, 10}) -> [{3, 100}, {6, 120}];
get_point_attr({104, 6, 11}) -> [{3, 100}, {6, 120}];
get_point_attr({104, 6, 12}) -> [{3, 100}, {6, 120}];
get_point_attr({104, 6, 13}) -> [{3, 100}, {6, 120}];
get_point_attr({104, 6, 14}) -> [{3, 100}, {6, 120}];
get_point_attr({104, 6, 15}) -> [{3, 100}, {6, 120}];
get_point_attr({104, 6, 16}) -> [{3, 100}, {6, 120}];
get_point_attr({104, 6, 17}) -> [{3, 100}, {6, 120}];
get_point_attr({104, 6, 18}) -> [{3, 100}, {6, 120}];
get_point_attr({104, 6, 19}) -> [{3, 100}, {6, 120}];
get_point_attr({104, 6, 20}) -> [{3, 100}, {6, 120}];
get_point_attr({104, 6, 21}) -> [{3, 100}, {6, 120}];
get_point_attr({104, 6, 22}) -> [{3, 100}, {6, 120}];
get_point_attr({104, 6, 23}) -> [{3, 100}, {6, 120}];
get_point_attr({104, 6, 24}) -> [{3, 100}, {6, 120}];
get_point_attr({104, 6, 25}) -> [{3, 100}, {6, 120}];
get_point_attr({104, 6, 26}) -> [{3, 100}, {6, 120}];
get_point_attr({104, 6, 27}) -> [{3, 100}, {6, 120}];
get_point_attr({104, 6, 28}) -> [{3, 100}, {6, 120}];
get_point_attr({104, 6, 29}) -> [{3, 100}, {6, 120}];
get_point_attr({104, 6, 30}) -> [{3, 100}, {6, 120}];
get_point_attr({104, 6, 31}) -> [{3, 100}, {6, 120}];
get_point_attr({104, 6, 32}) -> [{3, 100}, {6, 120}];
get_point_attr({104, 6, 33}) -> [{3, 100}, {6, 120}];
get_point_attr({104, 6, 34}) -> [{3, 100}, {6, 120}];
get_point_attr({104, 6, 35}) -> [{3, 100}, {6, 120}];
get_point_attr({104, 6, 36}) -> [{3, 100}, {6, 120}];
get_point_attr({104, 6, 37}) -> [{3, 100}, {6, 120}];
get_point_attr({104, 6, 38}) -> [{3, 100}, {6, 120}];
get_point_attr({104, 6, 39}) -> [{3, 100}, {6, 120}];
get_point_attr({104, 6, 40}) -> [{3, 100}, {6, 120}];
get_point_attr({104, 6, 41}) -> [{3, 100}, {6, 120}];
get_point_attr({104, 6, 42}) -> [{3, 100}, {6, 120}];
get_point_attr({104, 6, 43}) -> [{3, 100}, {6, 120}];
get_point_attr({104, 6, 44}) -> [{3, 100}, {6, 120}];
get_point_attr({104, 6, 45}) -> [{3, 100}, {6, 120}];
get_point_attr({104, 6, 46}) -> [{3, 100}, {6, 120}];
get_point_attr({104, 6, 47}) -> [{3, 100}, {6, 120}];
get_point_attr({104, 6, 48}) -> [{3, 100}, {6, 120}];
get_point_attr({104, 6, 49}) -> [{3, 100}, {6, 120}];
get_point_attr({104, 6, 50}) -> [{3, 100}, {6, 120}];
get_point_attr({104, 6, 51}) -> [{3, 100}, {6, 120}];
get_point_attr({104, 6, 52}) -> [{3, 100}, {6, 120}];
get_point_attr({104, 6, 53}) -> [{3, 100}, {6, 120}];
get_point_attr({104, 6, 54}) -> [{3, 100}, {6, 120}];
get_point_attr({104, 6, 55}) -> [{3, 100}, {6, 120}];
get_point_attr({104, 6, 56}) -> [{3, 100}, {6, 120}];
get_point_attr({104, 6, 57}) -> [{3, 100}, {6, 120}];
get_point_attr({104, 6, 58}) -> [{3, 100}, {6, 120}];
get_point_attr({104, 6, 59}) -> [{3, 100}, {6, 120}];
get_point_attr({104, 6, 60}) -> [{3, 100}, {6, 120}];
get_point_attr({104, 6, 61}) -> [{3, 100}, {6, 120}];
get_point_attr({104, 6, 62}) -> [{3, 100}, {6, 120}];
get_point_attr({104, 6, 63}) -> [{3, 100}, {6, 120}];
get_point_attr({104, 6, 64}) -> [{3, 100}, {6, 120}];
get_point_attr({104, 6, 65}) -> [{3, 100}, {6, 120}];
get_point_attr({104, 6, 66}) -> [{3, 100}, {6, 120}];
get_point_attr({104, 6, 67}) -> [{3, 100}, {6, 120}];
get_point_attr({104, 6, 68}) -> [{3, 100}, {6, 120}];
get_point_attr({104, 6, 69}) -> [{3, 100}, {6, 120}];
get_point_attr({104, 6, 70}) -> [{3, 100}, {6, 120}];
get_point_attr({104, 6, 71}) -> [{3, 100}, {6, 120}];
get_point_attr({104, 6, 72}) -> [{3, 100}, {6, 120}];
get_point_attr({104, 6, 73}) -> [{3, 100}, {6, 120}];
get_point_attr({104, 6, 74}) -> [{3, 100}, {6, 120}];
get_point_attr({104, 6, 75}) -> [{3, 100}, {6, 120}];
get_point_attr({104, 6, 76}) -> [{3, 100}, {6, 120}];
get_point_attr({104, 6, 77}) -> [{3, 100}, {6, 120}];
get_point_attr({104, 6, 78}) -> [{3, 100}, {6, 120}];
get_point_attr({104, 6, 79}) -> [{3, 100}, {6, 120}];
get_point_attr({104, 6, 80}) -> [{3, 100}, {6, 120}];
get_point_attr({104, 6, 81}) -> [{3, 100}, {6, 120}];
get_point_attr({104, 6, 82}) -> [{3, 100}, {6, 120}];
get_point_attr({104, 6, 83}) -> [{3, 100}, {6, 120}];
get_point_attr({104, 6, 84}) -> [{3, 100}, {6, 120}];
get_point_attr({104, 6, 85}) -> [{3, 100}, {6, 120}];
get_point_attr({104, 6, 86}) -> [{3, 100}, {6, 120}];
get_point_attr({104, 6, 87}) -> [{3, 100}, {6, 120}];
get_point_attr({104, 6, 88}) -> [{3, 100}, {6, 120}];
get_point_attr({104, 6, 89}) -> [{3, 100}, {6, 120}];
get_point_attr({104, 6, 90}) -> [{3, 100}, {6, 120}];
get_point_attr({104, 6, 91}) -> [{3, 100}, {6, 120}];
get_point_attr({104, 6, 92}) -> [{3, 100}, {6, 120}];
get_point_attr({104, 6, 93}) -> [{3, 100}, {6, 120}];
get_point_attr({104, 6, 94}) -> [{3, 100}, {6, 120}];
get_point_attr({104, 6, 95}) -> [{3, 100}, {6, 120}];
get_point_attr({104, 6, 96}) -> [{3, 100}, {6, 120}];
get_point_attr({104, 6, 97}) -> [{3, 100}, {6, 120}];
get_point_attr({104, 6, 98}) -> [{3, 100}, {6, 120}];
get_point_attr({104, 6, 99}) -> [{3, 100}, {6, 120}];
get_point_attr({104, 6, 100}) -> [{3, 100}, {6, 120}];
get_point_attr({104, 6, 101}) -> [{3, 100}, {6, 120}];
get_point_attr({104, 6, 102}) -> [{3, 100}, {6, 120}];
get_point_attr({104, 6, 103}) -> [{3, 100}, {6, 120}];
get_point_attr({104, 6, 104}) -> [{3, 100}, {6, 120}];
get_point_attr({104, 6, 105}) -> [{3, 100}, {6, 120}];
get_point_attr({104, 6, 106}) -> [{3, 100}, {6, 120}];
get_point_attr({104, 6, 107}) -> [{3, 100}, {6, 120}];
get_point_attr({104, 6, 108}) -> [{3, 100}, {6, 120}];
get_point_attr({104, 6, 109}) -> [{3, 100}, {6, 120}];
get_point_attr({104, 6, 110}) -> [{3, 100}, {6, 120}];
get_point_attr({104, 6, 111}) -> [{3, 100}, {6, 120}];
get_point_attr({104, 6, 112}) -> [{3, 100}, {6, 120}];
get_point_attr({104, 6, 113}) -> [{3, 100}, {6, 120}];
get_point_attr({104, 6, 114}) -> [{3, 100}, {6, 120}];
get_point_attr({104, 6, 115}) -> [{3, 100}, {6, 120}];
get_point_attr({104, 6, 116}) -> [{3, 100}, {6, 120}];
get_point_attr({104, 6, 117}) -> [{3, 100}, {6, 120}];
get_point_attr({104, 6, 118}) -> [{3, 100}, {6, 120}];
get_point_attr({104, 6, 119}) -> [{3, 100}, {6, 120}];
get_point_attr({104, 6, 120}) -> [{3, 100}, {6, 120}];
get_point_attr({104, 6, 121}) -> [{3, 100}, {6, 120}];
get_point_attr({104, 6, 122}) -> [{3, 100}, {6, 120}];
get_point_attr({104, 6, 123}) -> [{3, 100}, {6, 120}];
get_point_attr({104, 6, 124}) -> [{3, 100}, {6, 120}];
get_point_attr({104, 6, 125}) -> [{3, 100}, {6, 120}];
get_point_attr({104, 6, 126}) -> [{3, 100}, {6, 120}];
get_point_attr({104, 6, 127}) -> [{3, 100}, {6, 120}];
get_point_attr({104, 6, 128}) -> [{3, 100}, {6, 120}];
get_point_attr({104, 6, 129}) -> [{3, 100}, {6, 120}];
get_point_attr({104, 6, 130}) -> [{3, 100}, {6, 120}];
get_point_attr({105, 6, 1}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 6, 2}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 6, 3}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 6, 4}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 6, 5}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 6, 6}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 6, 7}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 6, 8}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 6, 9}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 6, 10}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 6, 11}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 6, 12}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 6, 13}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 6, 14}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 6, 15}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 6, 16}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 6, 17}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 6, 18}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 6, 19}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 6, 20}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 6, 21}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 6, 22}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 6, 23}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 6, 24}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 6, 25}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 6, 26}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 6, 27}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 6, 28}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 6, 29}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 6, 30}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 6, 31}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 6, 32}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 6, 33}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 6, 34}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 6, 35}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 6, 36}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 6, 37}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 6, 38}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 6, 39}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 6, 40}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 6, 41}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 6, 42}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 6, 43}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 6, 44}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 6, 45}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 6, 46}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 6, 47}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 6, 48}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 6, 49}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 6, 50}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 6, 51}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 6, 52}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 6, 53}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 6, 54}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 6, 55}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 6, 56}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 6, 57}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 6, 58}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 6, 59}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 6, 60}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 6, 61}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 6, 62}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 6, 63}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 6, 64}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 6, 65}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 6, 66}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 6, 67}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 6, 68}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 6, 69}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 6, 70}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 6, 71}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 6, 72}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 6, 73}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 6, 74}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 6, 75}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 6, 76}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 6, 77}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 6, 78}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 6, 79}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 6, 80}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 6, 81}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 6, 82}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 6, 83}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 6, 84}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 6, 85}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 6, 86}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 6, 87}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 6, 88}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 6, 89}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 6, 90}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 6, 91}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 6, 92}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 6, 93}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 6, 94}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 6, 95}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 6, 96}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 6, 97}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 6, 98}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 6, 99}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 6, 100}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 6, 101}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 6, 102}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 6, 103}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 6, 104}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 6, 105}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 6, 106}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 6, 107}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 6, 108}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 6, 109}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 6, 110}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 6, 111}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 6, 112}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 6, 113}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 6, 114}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 6, 115}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 6, 116}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 6, 117}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 6, 118}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 6, 119}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 6, 120}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 6, 121}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 6, 122}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 6, 123}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 6, 124}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 6, 125}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 6, 126}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 6, 127}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 6, 128}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 6, 129}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 6, 130}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({102, 7, 1}) ->
    [{1, 3500}, {7, 70}, {3, 10}];
get_point_attr({102, 7, 2}) ->
    [{1, 3500}, {7, 70}, {3, 10}];
get_point_attr({102, 7, 3}) ->
    [{1, 3500}, {7, 70}, {3, 10}];
get_point_attr({102, 7, 4}) ->
    [{1, 3500}, {7, 70}, {3, 10}];
get_point_attr({102, 7, 5}) ->
    [{1, 3500}, {7, 70}, {3, 10}];
get_point_attr({102, 7, 6}) ->
    [{1, 3500}, {7, 70}, {3, 10}];
get_point_attr({102, 7, 7}) ->
    [{1, 3500}, {7, 70}, {3, 10}];
get_point_attr({102, 7, 8}) ->
    [{1, 3500}, {7, 70}, {3, 10}];
get_point_attr({102, 7, 9}) ->
    [{1, 3500}, {7, 70}, {3, 10}];
get_point_attr({102, 7, 10}) ->
    [{1, 3500}, {7, 70}, {3, 10}];
get_point_attr({102, 7, 11}) ->
    [{1, 3500}, {7, 70}, {3, 10}];
get_point_attr({102, 7, 12}) ->
    [{1, 3500}, {7, 70}, {3, 10}];
get_point_attr({102, 7, 13}) ->
    [{1, 3500}, {7, 70}, {3, 10}];
get_point_attr({102, 7, 14}) ->
    [{1, 3500}, {7, 70}, {3, 10}];
get_point_attr({102, 7, 15}) ->
    [{1, 3500}, {7, 70}, {3, 10}];
get_point_attr({102, 7, 16}) ->
    [{1, 3500}, {7, 70}, {3, 10}];
get_point_attr({102, 7, 17}) ->
    [{1, 3500}, {7, 70}, {3, 10}];
get_point_attr({102, 7, 18}) ->
    [{1, 3500}, {7, 70}, {3, 10}];
get_point_attr({102, 7, 19}) ->
    [{1, 3500}, {7, 70}, {3, 10}];
get_point_attr({102, 7, 20}) ->
    [{1, 3500}, {7, 70}, {3, 10}];
get_point_attr({102, 7, 21}) ->
    [{1, 3500}, {7, 70}, {3, 10}];
get_point_attr({102, 7, 22}) ->
    [{1, 3500}, {7, 70}, {3, 10}];
get_point_attr({102, 7, 23}) ->
    [{1, 3500}, {7, 70}, {3, 10}];
get_point_attr({102, 7, 24}) ->
    [{1, 3500}, {7, 70}, {3, 10}];
get_point_attr({102, 7, 25}) ->
    [{1, 3500}, {7, 70}, {3, 10}];
get_point_attr({102, 7, 26}) ->
    [{1, 3500}, {7, 70}, {3, 10}];
get_point_attr({102, 7, 27}) ->
    [{1, 3500}, {7, 70}, {3, 10}];
get_point_attr({102, 7, 28}) ->
    [{1, 3500}, {7, 70}, {3, 10}];
get_point_attr({102, 7, 29}) ->
    [{1, 3500}, {7, 70}, {3, 10}];
get_point_attr({102, 7, 30}) ->
    [{1, 3500}, {7, 70}, {3, 10}];
get_point_attr({102, 7, 31}) ->
    [{1, 3500}, {7, 70}, {3, 10}];
get_point_attr({102, 7, 32}) ->
    [{1, 3500}, {7, 70}, {3, 10}];
get_point_attr({102, 7, 33}) ->
    [{1, 3500}, {7, 70}, {3, 10}];
get_point_attr({102, 7, 34}) ->
    [{1, 3500}, {7, 70}, {3, 10}];
get_point_attr({102, 7, 35}) ->
    [{1, 3500}, {7, 70}, {3, 10}];
get_point_attr({102, 7, 36}) ->
    [{1, 3500}, {7, 70}, {3, 10}];
get_point_attr({102, 7, 37}) ->
    [{1, 3500}, {7, 70}, {3, 10}];
get_point_attr({102, 7, 38}) ->
    [{1, 3500}, {7, 70}, {3, 10}];
get_point_attr({102, 7, 39}) ->
    [{1, 3500}, {7, 70}, {3, 10}];
get_point_attr({102, 7, 40}) ->
    [{1, 3500}, {7, 70}, {3, 10}];
get_point_attr({102, 7, 41}) ->
    [{1, 3500}, {7, 70}, {3, 10}];
get_point_attr({102, 7, 42}) ->
    [{1, 3500}, {7, 70}, {3, 10}];
get_point_attr({102, 7, 43}) ->
    [{1, 3500}, {7, 70}, {3, 10}];
get_point_attr({102, 7, 44}) ->
    [{1, 3500}, {7, 70}, {3, 10}];
get_point_attr({102, 7, 45}) ->
    [{1, 3500}, {7, 70}, {3, 10}];
get_point_attr({102, 7, 46}) ->
    [{1, 3500}, {7, 70}, {3, 10}];
get_point_attr({102, 7, 47}) ->
    [{1, 3500}, {7, 70}, {3, 10}];
get_point_attr({102, 7, 48}) ->
    [{1, 3500}, {7, 70}, {3, 10}];
get_point_attr({102, 7, 49}) ->
    [{1, 3500}, {7, 70}, {3, 10}];
get_point_attr({102, 7, 50}) ->
    [{1, 3500}, {7, 70}, {3, 10}];
get_point_attr({102, 7, 51}) ->
    [{1, 3500}, {7, 70}, {3, 10}];
get_point_attr({102, 7, 52}) ->
    [{1, 3500}, {7, 70}, {3, 10}];
get_point_attr({102, 7, 53}) ->
    [{1, 3500}, {7, 70}, {3, 10}];
get_point_attr({102, 7, 54}) ->
    [{1, 3500}, {7, 70}, {3, 10}];
get_point_attr({102, 7, 55}) ->
    [{1, 3500}, {7, 70}, {3, 10}];
get_point_attr({102, 7, 56}) ->
    [{1, 3500}, {7, 70}, {3, 10}];
get_point_attr({102, 7, 57}) ->
    [{1, 3500}, {7, 70}, {3, 10}];
get_point_attr({102, 7, 58}) ->
    [{1, 3500}, {7, 70}, {3, 10}];
get_point_attr({102, 7, 59}) ->
    [{1, 3500}, {7, 70}, {3, 10}];
get_point_attr({102, 7, 60}) ->
    [{1, 3500}, {7, 70}, {3, 10}];
get_point_attr({102, 7, 61}) ->
    [{1, 3500}, {7, 70}, {3, 10}];
get_point_attr({102, 7, 62}) ->
    [{1, 3500}, {7, 70}, {3, 10}];
get_point_attr({102, 7, 63}) ->
    [{1, 3500}, {7, 70}, {3, 10}];
get_point_attr({102, 7, 64}) ->
    [{1, 3500}, {7, 70}, {3, 10}];
get_point_attr({102, 7, 65}) ->
    [{1, 3500}, {7, 70}, {3, 10}];
get_point_attr({102, 7, 66}) ->
    [{1, 3500}, {7, 70}, {3, 10}];
get_point_attr({102, 7, 67}) ->
    [{1, 3500}, {7, 70}, {3, 10}];
get_point_attr({102, 7, 68}) ->
    [{1, 3500}, {7, 70}, {3, 10}];
get_point_attr({102, 7, 69}) ->
    [{1, 3500}, {7, 70}, {3, 10}];
get_point_attr({102, 7, 70}) ->
    [{1, 3500}, {7, 70}, {3, 10}];
get_point_attr({102, 7, 71}) ->
    [{1, 3500}, {7, 70}, {3, 10}];
get_point_attr({102, 7, 72}) ->
    [{1, 3500}, {7, 70}, {3, 10}];
get_point_attr({102, 7, 73}) ->
    [{1, 3500}, {7, 70}, {3, 10}];
get_point_attr({102, 7, 74}) ->
    [{1, 3500}, {7, 70}, {3, 10}];
get_point_attr({102, 7, 75}) ->
    [{1, 3500}, {7, 70}, {3, 10}];
get_point_attr({102, 7, 76}) ->
    [{1, 3500}, {7, 70}, {3, 10}];
get_point_attr({102, 7, 77}) ->
    [{1, 3500}, {7, 70}, {3, 10}];
get_point_attr({102, 7, 78}) ->
    [{1, 3500}, {7, 70}, {3, 10}];
get_point_attr({102, 7, 79}) ->
    [{1, 3500}, {7, 70}, {3, 10}];
get_point_attr({102, 7, 80}) ->
    [{1, 3500}, {7, 70}, {3, 10}];
get_point_attr({102, 7, 81}) ->
    [{1, 3500}, {7, 70}, {3, 10}];
get_point_attr({102, 7, 82}) ->
    [{1, 3500}, {7, 70}, {3, 10}];
get_point_attr({102, 7, 83}) ->
    [{1, 3500}, {7, 70}, {3, 10}];
get_point_attr({102, 7, 84}) ->
    [{1, 3500}, {7, 70}, {3, 10}];
get_point_attr({102, 7, 85}) ->
    [{1, 3500}, {7, 70}, {3, 10}];
get_point_attr({102, 7, 86}) ->
    [{1, 3500}, {7, 70}, {3, 10}];
get_point_attr({102, 7, 87}) ->
    [{1, 3500}, {7, 70}, {3, 10}];
get_point_attr({102, 7, 88}) ->
    [{1, 3500}, {7, 70}, {3, 10}];
get_point_attr({102, 7, 89}) ->
    [{1, 3500}, {7, 70}, {3, 10}];
get_point_attr({102, 7, 90}) ->
    [{1, 3500}, {7, 70}, {3, 10}];
get_point_attr({102, 7, 91}) ->
    [{1, 3500}, {7, 70}, {3, 10}];
get_point_attr({102, 7, 92}) ->
    [{1, 3500}, {7, 70}, {3, 10}];
get_point_attr({102, 7, 93}) ->
    [{1, 3500}, {7, 70}, {3, 10}];
get_point_attr({102, 7, 94}) ->
    [{1, 3500}, {7, 70}, {3, 10}];
get_point_attr({102, 7, 95}) ->
    [{1, 3500}, {7, 70}, {3, 10}];
get_point_attr({102, 7, 96}) ->
    [{1, 3500}, {7, 70}, {3, 10}];
get_point_attr({102, 7, 97}) ->
    [{1, 3500}, {7, 70}, {3, 10}];
get_point_attr({102, 7, 98}) ->
    [{1, 3500}, {7, 70}, {3, 10}];
get_point_attr({102, 7, 99}) ->
    [{1, 3500}, {7, 70}, {3, 10}];
get_point_attr({102, 7, 100}) ->
    [{1, 3500}, {7, 70}, {3, 10}];
get_point_attr({102, 7, 101}) ->
    [{1, 3500}, {7, 70}, {3, 10}];
get_point_attr({102, 7, 102}) ->
    [{1, 3500}, {7, 70}, {3, 10}];
get_point_attr({102, 7, 103}) ->
    [{1, 3500}, {7, 70}, {3, 10}];
get_point_attr({102, 7, 104}) ->
    [{1, 3500}, {7, 70}, {3, 10}];
get_point_attr({102, 7, 105}) ->
    [{1, 3500}, {7, 70}, {3, 10}];
get_point_attr({102, 7, 106}) ->
    [{1, 3500}, {7, 70}, {3, 10}];
get_point_attr({102, 7, 107}) ->
    [{1, 3500}, {7, 70}, {3, 10}];
get_point_attr({102, 7, 108}) ->
    [{1, 3500}, {7, 70}, {3, 10}];
get_point_attr({102, 7, 109}) ->
    [{1, 3500}, {7, 70}, {3, 10}];
get_point_attr({102, 7, 110}) ->
    [{1, 3500}, {7, 70}, {3, 10}];
get_point_attr({102, 7, 111}) ->
    [{1, 3500}, {7, 70}, {3, 10}];
get_point_attr({102, 7, 112}) ->
    [{1, 3500}, {7, 70}, {3, 10}];
get_point_attr({102, 7, 113}) ->
    [{1, 3500}, {7, 70}, {3, 10}];
get_point_attr({102, 7, 114}) ->
    [{1, 3500}, {7, 70}, {3, 10}];
get_point_attr({102, 7, 115}) ->
    [{1, 3500}, {7, 70}, {3, 10}];
get_point_attr({102, 7, 116}) ->
    [{1, 3500}, {7, 70}, {3, 10}];
get_point_attr({102, 7, 117}) ->
    [{1, 3500}, {7, 70}, {3, 10}];
get_point_attr({102, 7, 118}) ->
    [{1, 3500}, {7, 70}, {3, 10}];
get_point_attr({102, 7, 119}) ->
    [{1, 3500}, {7, 70}, {3, 10}];
get_point_attr({102, 7, 120}) ->
    [{1, 3500}, {7, 70}, {3, 10}];
get_point_attr({102, 7, 121}) ->
    [{1, 3500}, {7, 70}, {3, 10}];
get_point_attr({102, 7, 122}) ->
    [{1, 3500}, {7, 70}, {3, 10}];
get_point_attr({102, 7, 123}) ->
    [{1, 3500}, {7, 70}, {3, 10}];
get_point_attr({102, 7, 124}) ->
    [{1, 3500}, {7, 70}, {3, 10}];
get_point_attr({102, 7, 125}) ->
    [{1, 3500}, {7, 70}, {3, 10}];
get_point_attr({102, 7, 126}) ->
    [{1, 3500}, {7, 70}, {3, 10}];
get_point_attr({102, 7, 127}) ->
    [{1, 3500}, {7, 70}, {3, 10}];
get_point_attr({102, 7, 128}) ->
    [{1, 3500}, {7, 70}, {3, 10}];
get_point_attr({102, 7, 129}) ->
    [{1, 3500}, {7, 70}, {3, 10}];
get_point_attr({102, 7, 130}) ->
    [{1, 3500}, {7, 70}, {3, 10}];
get_point_attr({101, 7, 1}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 7, 2}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 7, 3}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 7, 4}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 7, 5}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 7, 6}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 7, 7}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 7, 8}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 7, 9}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 7, 10}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 7, 11}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 7, 12}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 7, 13}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 7, 14}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 7, 15}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 7, 16}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 7, 17}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 7, 18}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 7, 19}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 7, 20}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 7, 21}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 7, 22}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 7, 23}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 7, 24}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 7, 25}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 7, 26}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 7, 27}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 7, 28}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 7, 29}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 7, 30}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 7, 31}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 7, 32}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 7, 33}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 7, 34}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 7, 35}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 7, 36}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 7, 37}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 7, 38}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 7, 39}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 7, 40}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 7, 41}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 7, 42}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 7, 43}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 7, 44}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 7, 45}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 7, 46}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 7, 47}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 7, 48}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 7, 49}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 7, 50}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 7, 51}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 7, 52}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 7, 53}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 7, 54}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 7, 55}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 7, 56}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 7, 57}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 7, 58}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 7, 59}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 7, 60}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 7, 61}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 7, 62}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 7, 63}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 7, 64}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 7, 65}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 7, 66}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 7, 67}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 7, 68}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 7, 69}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 7, 70}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 7, 71}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 7, 72}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 7, 73}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 7, 74}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 7, 75}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 7, 76}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 7, 77}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 7, 78}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 7, 79}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 7, 80}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 7, 81}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 7, 82}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 7, 83}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 7, 84}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 7, 85}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 7, 86}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 7, 87}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 7, 88}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 7, 89}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 7, 90}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 7, 91}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 7, 92}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 7, 93}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 7, 94}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 7, 95}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 7, 96}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 7, 97}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 7, 98}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 7, 99}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 7, 100}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 7, 101}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 7, 102}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 7, 103}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 7, 104}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 7, 105}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 7, 106}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 7, 107}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 7, 108}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 7, 109}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 7, 110}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 7, 111}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 7, 112}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 7, 113}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 7, 114}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 7, 115}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 7, 116}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 7, 117}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 7, 118}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 7, 119}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 7, 120}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 7, 121}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 7, 122}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 7, 123}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 7, 124}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 7, 125}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 7, 126}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 7, 127}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 7, 128}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 7, 129}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({101, 7, 130}) ->
    [{4, 350}, {7, 100}, {3, 10}];
get_point_attr({103, 7, 1}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 7, 2}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 7, 3}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 7, 4}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 7, 5}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 7, 6}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 7, 7}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 7, 8}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 7, 9}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 7, 10}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 7, 11}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 7, 12}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 7, 13}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 7, 14}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 7, 15}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 7, 16}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 7, 17}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 7, 18}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 7, 19}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 7, 20}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 7, 21}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 7, 22}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 7, 23}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 7, 24}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 7, 25}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 7, 26}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 7, 27}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 7, 28}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 7, 29}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 7, 30}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 7, 31}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 7, 32}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 7, 33}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 7, 34}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 7, 35}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 7, 36}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 7, 37}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 7, 38}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 7, 39}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 7, 40}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 7, 41}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 7, 42}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 7, 43}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 7, 44}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 7, 45}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 7, 46}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 7, 47}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 7, 48}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 7, 49}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 7, 50}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 7, 51}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 7, 52}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 7, 53}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 7, 54}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 7, 55}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 7, 56}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 7, 57}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 7, 58}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 7, 59}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 7, 60}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 7, 61}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 7, 62}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 7, 63}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 7, 64}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 7, 65}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 7, 66}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 7, 67}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 7, 68}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 7, 69}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 7, 70}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 7, 71}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 7, 72}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 7, 73}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 7, 74}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 7, 75}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 7, 76}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 7, 77}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 7, 78}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 7, 79}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 7, 80}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 7, 81}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 7, 82}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 7, 83}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 7, 84}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 7, 85}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 7, 86}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 7, 87}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 7, 88}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 7, 89}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 7, 90}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 7, 91}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 7, 92}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 7, 93}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 7, 94}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 7, 95}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 7, 96}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 7, 97}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 7, 98}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 7, 99}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 7, 100}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 7, 101}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 7, 102}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 7, 103}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 7, 104}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 7, 105}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 7, 106}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 7, 107}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 7, 108}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 7, 109}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 7, 110}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 7, 111}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 7, 112}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 7, 113}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 7, 114}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 7, 115}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 7, 116}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 7, 117}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 7, 118}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 7, 119}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 7, 120}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 7, 121}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 7, 122}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 7, 123}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 7, 124}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 7, 125}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 7, 126}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 7, 127}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 7, 128}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 7, 129}) -> [{5, 350}, {7, 280}];
get_point_attr({103, 7, 130}) -> [{5, 350}, {7, 280}];
get_point_attr({104, 7, 1}) -> [{3, 100}];
get_point_attr({104, 7, 2}) -> [{3, 100}];
get_point_attr({104, 7, 3}) -> [{3, 100}];
get_point_attr({104, 7, 4}) -> [{3, 100}];
get_point_attr({104, 7, 5}) -> [{3, 100}];
get_point_attr({104, 7, 6}) -> [{3, 100}];
get_point_attr({104, 7, 7}) -> [{3, 100}];
get_point_attr({104, 7, 8}) -> [{3, 100}];
get_point_attr({104, 7, 9}) -> [{3, 100}];
get_point_attr({104, 7, 10}) -> [{3, 100}];
get_point_attr({104, 7, 11}) -> [{3, 100}];
get_point_attr({104, 7, 12}) -> [{3, 100}];
get_point_attr({104, 7, 13}) -> [{3, 100}];
get_point_attr({104, 7, 14}) -> [{3, 100}];
get_point_attr({104, 7, 15}) -> [{3, 100}];
get_point_attr({104, 7, 16}) -> [{3, 100}];
get_point_attr({104, 7, 17}) -> [{3, 100}];
get_point_attr({104, 7, 18}) -> [{3, 100}];
get_point_attr({104, 7, 19}) -> [{3, 100}];
get_point_attr({104, 7, 20}) -> [{3, 100}];
get_point_attr({104, 7, 21}) -> [{3, 100}];
get_point_attr({104, 7, 22}) -> [{3, 100}];
get_point_attr({104, 7, 23}) -> [{3, 100}];
get_point_attr({104, 7, 24}) -> [{3, 100}];
get_point_attr({104, 7, 25}) -> [{3, 100}];
get_point_attr({104, 7, 26}) -> [{3, 100}];
get_point_attr({104, 7, 27}) -> [{3, 100}];
get_point_attr({104, 7, 28}) -> [{3, 100}];
get_point_attr({104, 7, 29}) -> [{3, 100}];
get_point_attr({104, 7, 30}) -> [{3, 100}];
get_point_attr({104, 7, 31}) -> [{3, 100}];
get_point_attr({104, 7, 32}) -> [{3, 100}];
get_point_attr({104, 7, 33}) -> [{3, 100}];
get_point_attr({104, 7, 34}) -> [{3, 100}];
get_point_attr({104, 7, 35}) -> [{3, 100}];
get_point_attr({104, 7, 36}) -> [{3, 100}];
get_point_attr({104, 7, 37}) -> [{3, 100}];
get_point_attr({104, 7, 38}) -> [{3, 100}];
get_point_attr({104, 7, 39}) -> [{3, 100}];
get_point_attr({104, 7, 40}) -> [{3, 100}];
get_point_attr({104, 7, 41}) -> [{3, 100}];
get_point_attr({104, 7, 42}) -> [{3, 100}];
get_point_attr({104, 7, 43}) -> [{3, 100}];
get_point_attr({104, 7, 44}) -> [{3, 100}];
get_point_attr({104, 7, 45}) -> [{3, 100}];
get_point_attr({104, 7, 46}) -> [{3, 100}];
get_point_attr({104, 7, 47}) -> [{3, 100}];
get_point_attr({104, 7, 48}) -> [{3, 100}];
get_point_attr({104, 7, 49}) -> [{3, 100}];
get_point_attr({104, 7, 50}) -> [{3, 100}];
get_point_attr({104, 7, 51}) -> [{3, 100}];
get_point_attr({104, 7, 52}) -> [{3, 100}];
get_point_attr({104, 7, 53}) -> [{3, 100}];
get_point_attr({104, 7, 54}) -> [{3, 100}];
get_point_attr({104, 7, 55}) -> [{3, 100}];
get_point_attr({104, 7, 56}) -> [{3, 100}];
get_point_attr({104, 7, 57}) -> [{3, 100}];
get_point_attr({104, 7, 58}) -> [{3, 100}];
get_point_attr({104, 7, 59}) -> [{3, 100}];
get_point_attr({104, 7, 60}) -> [{3, 100}];
get_point_attr({104, 7, 61}) -> [{3, 100}];
get_point_attr({104, 7, 62}) -> [{3, 100}];
get_point_attr({104, 7, 63}) -> [{3, 100}];
get_point_attr({104, 7, 64}) -> [{3, 100}];
get_point_attr({104, 7, 65}) -> [{3, 100}];
get_point_attr({104, 7, 66}) -> [{3, 100}];
get_point_attr({104, 7, 67}) -> [{3, 100}];
get_point_attr({104, 7, 68}) -> [{3, 100}];
get_point_attr({104, 7, 69}) -> [{3, 100}];
get_point_attr({104, 7, 70}) -> [{3, 100}];
get_point_attr({104, 7, 71}) -> [{3, 100}];
get_point_attr({104, 7, 72}) -> [{3, 100}];
get_point_attr({104, 7, 73}) -> [{3, 100}];
get_point_attr({104, 7, 74}) -> [{3, 100}];
get_point_attr({104, 7, 75}) -> [{3, 100}];
get_point_attr({104, 7, 76}) -> [{3, 100}];
get_point_attr({104, 7, 77}) -> [{3, 100}];
get_point_attr({104, 7, 78}) -> [{3, 100}];
get_point_attr({104, 7, 79}) -> [{3, 100}];
get_point_attr({104, 7, 80}) -> [{3, 100}];
get_point_attr({104, 7, 81}) -> [{3, 100}];
get_point_attr({104, 7, 82}) -> [{3, 100}];
get_point_attr({104, 7, 83}) -> [{3, 100}];
get_point_attr({104, 7, 84}) -> [{3, 100}];
get_point_attr({104, 7, 85}) -> [{3, 100}];
get_point_attr({104, 7, 86}) -> [{3, 100}];
get_point_attr({104, 7, 87}) -> [{3, 100}];
get_point_attr({104, 7, 88}) -> [{3, 100}];
get_point_attr({104, 7, 89}) -> [{3, 100}];
get_point_attr({104, 7, 90}) -> [{3, 100}];
get_point_attr({104, 7, 91}) -> [{3, 100}];
get_point_attr({104, 7, 92}) -> [{3, 100}];
get_point_attr({104, 7, 93}) -> [{3, 100}];
get_point_attr({104, 7, 94}) -> [{3, 100}];
get_point_attr({104, 7, 95}) -> [{3, 100}];
get_point_attr({104, 7, 96}) -> [{3, 100}];
get_point_attr({104, 7, 97}) -> [{3, 100}];
get_point_attr({104, 7, 98}) -> [{3, 100}];
get_point_attr({104, 7, 99}) -> [{3, 100}];
get_point_attr({104, 7, 100}) -> [{3, 100}];
get_point_attr({104, 7, 101}) -> [{3, 100}];
get_point_attr({104, 7, 102}) -> [{3, 100}];
get_point_attr({104, 7, 103}) -> [{3, 100}];
get_point_attr({104, 7, 104}) -> [{3, 100}];
get_point_attr({104, 7, 105}) -> [{3, 100}];
get_point_attr({104, 7, 106}) -> [{3, 100}];
get_point_attr({104, 7, 107}) -> [{3, 100}];
get_point_attr({104, 7, 108}) -> [{3, 100}];
get_point_attr({104, 7, 109}) -> [{3, 100}];
get_point_attr({104, 7, 110}) -> [{3, 100}];
get_point_attr({104, 7, 111}) -> [{3, 100}];
get_point_attr({104, 7, 112}) -> [{3, 100}];
get_point_attr({104, 7, 113}) -> [{3, 100}];
get_point_attr({104, 7, 114}) -> [{3, 100}];
get_point_attr({104, 7, 115}) -> [{3, 100}];
get_point_attr({104, 7, 116}) -> [{3, 100}];
get_point_attr({104, 7, 117}) -> [{3, 100}];
get_point_attr({104, 7, 118}) -> [{3, 100}];
get_point_attr({104, 7, 119}) -> [{3, 100}];
get_point_attr({104, 7, 120}) -> [{3, 100}];
get_point_attr({104, 7, 121}) -> [{3, 100}];
get_point_attr({104, 7, 122}) -> [{3, 100}];
get_point_attr({104, 7, 123}) -> [{3, 100}];
get_point_attr({104, 7, 124}) -> [{3, 100}];
get_point_attr({104, 7, 125}) -> [{3, 100}];
get_point_attr({104, 7, 126}) -> [{3, 100}];
get_point_attr({104, 7, 127}) -> [{3, 100}];
get_point_attr({104, 7, 128}) -> [{3, 100}];
get_point_attr({104, 7, 129}) -> [{3, 100}];
get_point_attr({104, 7, 130}) -> [{3, 100}];
get_point_attr({105, 7, 1}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 7, 2}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 7, 3}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 7, 4}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 7, 5}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 7, 6}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 7, 7}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 7, 8}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 7, 9}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 7, 10}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 7, 11}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 7, 12}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 7, 13}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 7, 14}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 7, 15}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 7, 16}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 7, 17}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 7, 18}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 7, 19}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 7, 20}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 7, 21}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 7, 22}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 7, 23}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 7, 24}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 7, 25}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 7, 26}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 7, 27}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 7, 28}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 7, 29}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 7, 30}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 7, 31}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 7, 32}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 7, 33}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 7, 34}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 7, 35}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 7, 36}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 7, 37}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 7, 38}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 7, 39}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 7, 40}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 7, 41}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 7, 42}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 7, 43}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 7, 44}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 7, 45}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 7, 46}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 7, 47}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 7, 48}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 7, 49}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 7, 50}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 7, 51}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 7, 52}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 7, 53}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 7, 54}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 7, 55}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 7, 56}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 7, 57}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 7, 58}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 7, 59}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 7, 60}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 7, 61}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 7, 62}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 7, 63}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 7, 64}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 7, 65}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 7, 66}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 7, 67}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 7, 68}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 7, 69}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 7, 70}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 7, 71}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 7, 72}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 7, 73}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 7, 74}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 7, 75}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 7, 76}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 7, 77}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 7, 78}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 7, 79}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 7, 80}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 7, 81}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 7, 82}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 7, 83}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 7, 84}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 7, 85}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 7, 86}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 7, 87}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 7, 88}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 7, 89}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 7, 90}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 7, 91}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 7, 92}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 7, 93}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 7, 94}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 7, 95}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 7, 96}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 7, 97}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 7, 98}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 7, 99}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 7, 100}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 7, 101}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 7, 102}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 7, 103}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 7, 104}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 7, 105}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 7, 106}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 7, 107}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 7, 108}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 7, 109}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 7, 110}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 7, 111}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 7, 112}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 7, 113}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 7, 114}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 7, 115}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 7, 116}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 7, 117}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 7, 118}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 7, 119}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 7, 120}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 7, 121}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 7, 122}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 7, 123}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 7, 124}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 7, 125}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 7, 126}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 7, 127}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 7, 128}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 7, 129}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr({105, 7, 130}) ->
    [{6, 700}, {7, 20}, {3, 10}];
get_point_attr(_) -> [].

auto_point({1, 1}) -> {4, 0, 0, 0, 1};
auto_point({2, 1}) -> {4, 0, 0, 0, 1};
auto_point({3, 1}) -> {4, 0, 0, 0, 1};
auto_point({4, 1}) -> {4, 0, 0, 0, 1};
auto_point({5, 1}) -> {4, 0, 0, 0, 1};
auto_point({6, 1}) -> {4, 0, 0, 0, 1};
auto_point({7, 1}) -> {4, 0, 0, 0, 1};
auto_point({8, 1}) -> {4, 0, 0, 0, 1};
auto_point({9, 1}) -> {4, 0, 0, 0, 1};
auto_point({10, 1}) -> {4, 0, 0, 0, 1};
auto_point({11, 1}) -> {4, 0, 0, 0, 1};
auto_point({12, 1}) -> {4, 0, 0, 0, 1};
auto_point({13, 1}) -> {4, 0, 0, 0, 1};
auto_point({14, 1}) -> {4, 0, 0, 0, 1};
auto_point({15, 1}) -> {4, 0, 0, 0, 1};
auto_point({16, 1}) -> {4, 0, 0, 0, 1};
auto_point({17, 1}) -> {4, 0, 0, 0, 1};
auto_point({18, 1}) -> {4, 0, 0, 0, 1};
auto_point({19, 1}) -> {4, 0, 0, 0, 1};
auto_point({20, 1}) -> {4, 0, 0, 0, 1};
auto_point({21, 1}) -> {4, 0, 0, 0, 1};
auto_point({22, 1}) -> {4, 0, 0, 0, 1};
auto_point({23, 1}) -> {4, 0, 0, 0, 1};
auto_point({24, 1}) -> {4, 0, 0, 0, 1};
auto_point({25, 1}) -> {4, 0, 0, 0, 1};
auto_point({26, 1}) -> {4, 0, 0, 0, 1};
auto_point({27, 1}) -> {4, 0, 0, 0, 1};
auto_point({28, 1}) -> {4, 0, 0, 0, 1};
auto_point({29, 1}) -> {4, 0, 0, 0, 1};
auto_point({1, 4}) -> {0, 1, 0, 3, 1};
auto_point({2, 4}) -> {0, 1, 0, 3, 1};
auto_point({3, 4}) -> {0, 1, 0, 3, 1};
auto_point({4, 4}) -> {0, 1, 0, 3, 1};
auto_point({5, 4}) -> {0, 1, 0, 3, 1};
auto_point({6, 4}) -> {0, 1, 0, 3, 1};
auto_point({7, 4}) -> {0, 1, 0, 3, 1};
auto_point({8, 4}) -> {0, 1, 0, 3, 1};
auto_point({9, 4}) -> {0, 1, 0, 3, 1};
auto_point({10, 4}) -> {0, 1, 0, 3, 1};
auto_point({11, 4}) -> {0, 1, 0, 3, 1};
auto_point({12, 4}) -> {0, 1, 0, 3, 1};
auto_point({13, 4}) -> {0, 1, 0, 3, 1};
auto_point({14, 4}) -> {0, 1, 0, 3, 1};
auto_point({15, 4}) -> {0, 1, 0, 3, 1};
auto_point({16, 4}) -> {0, 1, 0, 3, 1};
auto_point({17, 4}) -> {0, 1, 0, 3, 1};
auto_point({18, 4}) -> {0, 1, 0, 3, 1};
auto_point({19, 4}) -> {0, 1, 0, 3, 1};
auto_point({20, 4}) -> {0, 1, 0, 3, 1};
auto_point({21, 4}) -> {0, 1, 0, 3, 1};
auto_point({22, 4}) -> {0, 1, 0, 3, 1};
auto_point({23, 4}) -> {0, 1, 0, 3, 1};
auto_point({24, 4}) -> {0, 1, 0, 3, 1};
auto_point({25, 4}) -> {0, 1, 0, 3, 1};
auto_point({26, 4}) -> {0, 1, 0, 3, 1};
auto_point({27, 4}) -> {0, 1, 0, 3, 1};
auto_point({28, 4}) -> {0, 1, 0, 3, 1};
auto_point({29, 4}) -> {0, 1, 0, 3, 1};
auto_point({1, 2}) -> {0, 0, 4, 0, 1};
auto_point({2, 2}) -> {0, 0, 4, 0, 1};
auto_point({3, 2}) -> {0, 0, 4, 0, 1};
auto_point({4, 2}) -> {0, 0, 4, 0, 1};
auto_point({5, 2}) -> {0, 0, 4, 0, 1};
auto_point({6, 2}) -> {0, 0, 4, 0, 1};
auto_point({7, 2}) -> {0, 0, 4, 0, 1};
auto_point({8, 2}) -> {0, 0, 4, 0, 1};
auto_point({9, 2}) -> {0, 0, 4, 0, 1};
auto_point({10, 2}) -> {0, 0, 4, 0, 1};
auto_point({11, 2}) -> {0, 0, 4, 0, 1};
auto_point({12, 2}) -> {0, 0, 4, 0, 1};
auto_point({13, 2}) -> {0, 0, 4, 0, 1};
auto_point({14, 2}) -> {0, 0, 4, 0, 1};
auto_point({15, 2}) -> {0, 0, 4, 0, 1};
auto_point({16, 2}) -> {0, 0, 4, 0, 1};
auto_point({17, 2}) -> {0, 0, 4, 0, 1};
auto_point({18, 2}) -> {0, 0, 4, 0, 1};
auto_point({19, 2}) -> {0, 0, 4, 0, 1};
auto_point({20, 2}) -> {0, 0, 4, 0, 1};
auto_point({21, 2}) -> {0, 0, 4, 0, 1};
auto_point({22, 2}) -> {0, 0, 4, 0, 1};
auto_point({23, 2}) -> {0, 0, 4, 0, 1};
auto_point({24, 2}) -> {0, 0, 4, 0, 1};
auto_point({25, 2}) -> {0, 0, 4, 0, 1};
auto_point({26, 2}) -> {0, 0, 4, 0, 1};
auto_point({27, 2}) -> {0, 0, 4, 0, 1};
auto_point({28, 2}) -> {0, 0, 4, 0, 1};
auto_point({29, 2}) -> {0, 0, 4, 0, 1};
auto_point({1, 3}) -> {4, 0, 0, 1, 0};
auto_point({2, 3}) -> {4, 0, 0, 1, 0};
auto_point({3, 3}) -> {4, 0, 0, 1, 0};
auto_point({4, 3}) -> {4, 0, 0, 1, 0};
auto_point({5, 3}) -> {4, 0, 0, 1, 0};
auto_point({6, 3}) -> {4, 0, 0, 1, 0};
auto_point({7, 3}) -> {4, 0, 0, 1, 0};
auto_point({8, 3}) -> {4, 0, 0, 1, 0};
auto_point({9, 3}) -> {4, 0, 0, 1, 0};
auto_point({10, 3}) -> {4, 0, 0, 1, 0};
auto_point({11, 3}) -> {4, 0, 0, 1, 0};
auto_point({12, 3}) -> {4, 0, 0, 1, 0};
auto_point({13, 3}) -> {4, 0, 0, 1, 0};
auto_point({14, 3}) -> {4, 0, 0, 1, 0};
auto_point({15, 3}) -> {4, 0, 0, 1, 0};
auto_point({16, 3}) -> {4, 0, 0, 1, 0};
auto_point({17, 3}) -> {4, 0, 0, 1, 0};
auto_point({18, 3}) -> {4, 0, 0, 1, 0};
auto_point({19, 3}) -> {4, 0, 0, 1, 0};
auto_point({20, 3}) -> {4, 0, 0, 1, 0};
auto_point({21, 3}) -> {4, 0, 0, 1, 0};
auto_point({22, 3}) -> {4, 0, 0, 1, 0};
auto_point({23, 3}) -> {4, 0, 0, 1, 0};
auto_point({24, 3}) -> {4, 0, 0, 1, 0};
auto_point({25, 3}) -> {4, 0, 0, 1, 0};
auto_point({26, 3}) -> {4, 0, 0, 1, 0};
auto_point({27, 3}) -> {4, 0, 0, 1, 0};
auto_point({28, 3}) -> {4, 0, 0, 1, 0};
auto_point({29, 3}) -> {4, 0, 0, 1, 0};
auto_point({1, 5}) -> {0, 2, 0, 1, 2};
auto_point({2, 5}) -> {0, 2, 0, 1, 2};
auto_point({3, 5}) -> {0, 2, 0, 1, 2};
auto_point({4, 5}) -> {0, 2, 0, 1, 2};
auto_point({5, 5}) -> {0, 2, 0, 1, 2};
auto_point({6, 5}) -> {0, 2, 0, 1, 2};
auto_point({7, 5}) -> {0, 2, 0, 1, 2};
auto_point({8, 5}) -> {0, 2, 0, 1, 2};
auto_point({9, 5}) -> {0, 2, 0, 1, 2};
auto_point({10, 5}) -> {0, 2, 0, 1, 2};
auto_point({11, 5}) -> {0, 2, 0, 1, 2};
auto_point({12, 5}) -> {0, 2, 0, 1, 2};
auto_point({13, 5}) -> {0, 2, 0, 1, 2};
auto_point({14, 5}) -> {0, 2, 0, 1, 2};
auto_point({15, 5}) -> {0, 2, 0, 1, 2};
auto_point({16, 5}) -> {0, 2, 0, 1, 2};
auto_point({17, 5}) -> {0, 2, 0, 1, 2};
auto_point({18, 5}) -> {0, 2, 0, 1, 2};
auto_point({19, 5}) -> {0, 2, 0, 1, 2};
auto_point({20, 5}) -> {0, 2, 0, 1, 2};
auto_point({21, 5}) -> {0, 2, 0, 1, 2};
auto_point({22, 5}) -> {0, 2, 0, 1, 2};
auto_point({23, 5}) -> {0, 2, 0, 1, 2};
auto_point({24, 5}) -> {0, 2, 0, 1, 2};
auto_point({25, 5}) -> {0, 2, 0, 1, 2};
auto_point({26, 5}) -> {0, 2, 0, 1, 2};
auto_point({27, 5}) -> {0, 2, 0, 1, 2};
auto_point({28, 5}) -> {0, 2, 0, 1, 2};
auto_point({29, 5}) -> {0, 2, 0, 1, 2};
auto_point({1, 6}) -> {0, 0, 4, 0, 1};
auto_point({2, 6}) -> {0, 0, 4, 0, 1};
auto_point({3, 6}) -> {0, 0, 4, 0, 1};
auto_point({4, 6}) -> {0, 0, 4, 0, 1};
auto_point({5, 6}) -> {0, 0, 4, 0, 1};
auto_point({6, 6}) -> {0, 0, 4, 0, 1};
auto_point({7, 6}) -> {0, 0, 4, 0, 1};
auto_point({8, 6}) -> {0, 0, 4, 0, 1};
auto_point({9, 6}) -> {0, 0, 4, 0, 1};
auto_point({10, 6}) -> {0, 0, 4, 0, 1};
auto_point({11, 6}) -> {0, 0, 4, 0, 1};
auto_point({12, 6}) -> {0, 0, 4, 0, 1};
auto_point({13, 6}) -> {0, 0, 4, 0, 1};
auto_point({14, 6}) -> {0, 0, 4, 0, 1};
auto_point({15, 6}) -> {0, 0, 4, 0, 1};
auto_point({16, 6}) -> {0, 0, 4, 0, 1};
auto_point({17, 6}) -> {0, 0, 4, 0, 1};
auto_point({18, 6}) -> {0, 0, 4, 0, 1};
auto_point({19, 6}) -> {0, 0, 4, 0, 1};
auto_point({20, 6}) -> {0, 0, 4, 0, 1};
auto_point({21, 6}) -> {0, 0, 4, 0, 1};
auto_point({22, 6}) -> {0, 0, 4, 0, 1};
auto_point({23, 6}) -> {0, 0, 4, 0, 1};
auto_point({24, 6}) -> {0, 0, 4, 0, 1};
auto_point({25, 6}) -> {0, 0, 4, 0, 1};
auto_point({26, 6}) -> {0, 0, 4, 0, 1};
auto_point({27, 6}) -> {0, 0, 4, 0, 1};
auto_point({28, 6}) -> {0, 0, 4, 0, 1};
auto_point({29, 6}) -> {0, 0, 4, 0, 1};
auto_point({1, 7}) -> {4, 1, 0, 0, 0};
auto_point({2, 7}) -> {4, 1, 0, 0, 0};
auto_point({3, 7}) -> {4, 1, 0, 0, 0};
auto_point({4, 7}) -> {4, 1, 0, 0, 0};
auto_point({5, 7}) -> {4, 1, 0, 0, 0};
auto_point({6, 7}) -> {4, 1, 0, 0, 0};
auto_point({7, 7}) -> {4, 1, 0, 0, 0};
auto_point({8, 7}) -> {4, 1, 0, 0, 0};
auto_point({9, 7}) -> {4, 1, 0, 0, 0};
auto_point({10, 7}) -> {4, 1, 0, 0, 0};
auto_point({11, 7}) -> {4, 1, 0, 0, 0};
auto_point({12, 7}) -> {4, 1, 0, 0, 0};
auto_point({13, 7}) -> {4, 1, 0, 0, 0};
auto_point({14, 7}) -> {4, 1, 0, 0, 0};
auto_point({15, 7}) -> {4, 1, 0, 0, 0};
auto_point({16, 7}) -> {4, 1, 0, 0, 0};
auto_point({17, 7}) -> {4, 1, 0, 0, 0};
auto_point({18, 7}) -> {4, 1, 0, 0, 0};
auto_point({19, 7}) -> {4, 1, 0, 0, 0};
auto_point({20, 7}) -> {4, 1, 0, 0, 0};
auto_point({21, 7}) -> {4, 1, 0, 0, 0};
auto_point({22, 7}) -> {4, 1, 0, 0, 0};
auto_point({23, 7}) -> {4, 1, 0, 0, 0};
auto_point({24, 7}) -> {4, 1, 0, 0, 0};
auto_point({25, 7}) -> {4, 1, 0, 0, 0};
auto_point({26, 7}) -> {4, 1, 0, 0, 0};
auto_point({27, 7}) -> {4, 1, 0, 0, 0};
auto_point({28, 7}) -> {4, 1, 0, 0, 0};
auto_point({29, 7}) -> {4, 1, 0, 0, 0};
auto_point(_) -> false.

get_score(1) -> 20;
get_score(3) -> 1100;
get_score(4) -> 112;
get_score(5) -> 112;
get_score(6) -> 112;
get_score(7) -> 112;
get_score(8) -> 350;
get_score(9) -> 350;
get_score(10) -> 500;
get_score(11) -> 500;
get_score(21) -> 133;
get_score(101) -> 1500;
get_score(102) -> 1500;
get_score(103) -> 1500;
get_score(104) -> 1500;
get_score(105) -> 1500;
get_score(25) -> 500;
get_score(26) -> 500;
get_score(_) -> 0.

rename_gold(Time) when Time >= 2 -> 1000;
rename_gold(Time) when Time >= 1 -> 800;
rename_gold(Time) when Time >= 0 -> 500;
rename_gold(_) -> 100.

change_point_price(Times) when Times >= 10 -> 500000;
change_point_price(Times) when Times >= 9 -> 500000;
change_point_price(Times) when Times >= 8 -> 500000;
change_point_price(Times) when Times >= 7 -> 500000;
change_point_price(Times) when Times >= 6 -> 500000;
change_point_price(Times) when Times >= 5 -> 350000;
change_point_price(Times) when Times >= 4 -> 200000;
change_point_price(Times) when Times >= 3 -> 120000;
change_point_price(Times) when Times >= 2 -> 60000;
change_point_price(Times) when Times >= 1 -> 0;
change_point_price(_) -> 50000.

