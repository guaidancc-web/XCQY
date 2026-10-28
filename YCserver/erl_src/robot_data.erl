-file("src/data/robot_data.erl", 1).

-module(robot_data).

-export([get/1]).

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

-file("src/data/robot_data.erl", 15).

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

-file("src/data/robot_data.erl", 17).

get({20, 1}) ->
    #{attr =>
          #attr{hp_max = 1344, mp_max = 390, atk_speed = 53,
                phy_dmg = 762, magic_dmg = 355, phy_def = 396,
                magic_def = 246, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 26, anti_control = 26},
      skills => [{10001, 20}, {10002, 20}, {10003, 20}]};
get({21, 1}) ->
    #{attr =>
          #attr{hp_max = 1365, mp_max = 399, atk_speed = 53,
                phy_dmg = 771, magic_dmg = 356, phy_def = 402,
                magic_def = 249, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 26, anti_control = 26},
      skills => [{10001, 21}, {10002, 21}, {10003, 21}]};
get({22, 1}) ->
    #{attr =>
          #attr{hp_max = 1409, mp_max = 417, atk_speed = 55,
                phy_dmg = 790, magic_dmg = 360, phy_def = 416,
                magic_def = 257, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 26, anti_control = 26},
      skills => [{10001, 22}, {10002, 22}, {10003, 22}]};
get({23, 1}) ->
    #{attr =>
          #attr{hp_max = 1452, mp_max = 436, atk_speed = 57,
                phy_dmg = 809, magic_dmg = 362, phy_def = 429,
                magic_def = 266, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 26, anti_control = 26},
      skills => [{10001, 23}, {10002, 23}, {10003, 23}]};
get({24, 1}) ->
    #{attr =>
          #attr{hp_max = 1496, mp_max = 455, atk_speed = 59,
                phy_dmg = 828, magic_dmg = 365, phy_def = 442,
                magic_def = 274, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 26, anti_control = 26},
      skills => [{10001, 24}, {10002, 24}, {10003, 24}]};
get({25, 1}) ->
    #{attr =>
          #attr{hp_max = 1561, mp_max = 483, atk_speed = 62,
                phy_dmg = 856, magic_dmg = 371, phy_def = 462,
                magic_def = 286, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 26, anti_control = 26},
      skills =>
          [{10001, 25}, {10002, 25}, {10003, 25}, {10004, 25}]};
get({26, 1}) ->
    #{attr =>
          #attr{hp_max = 1608, mp_max = 492, atk_speed = 63,
                phy_dmg = 890, magic_dmg = 390, phy_def = 475,
                magic_def = 295, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 27, anti_control = 27},
      skills =>
          [{10001, 26}, {10002, 26}, {10003, 26}, {10004, 26}]};
get({27, 1}) ->
    #{attr =>
          #attr{hp_max = 1701, mp_max = 511, atk_speed = 67,
                phy_dmg = 956, magic_dmg = 429, phy_def = 504,
                magic_def = 312, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 30, anti_control = 30},
      skills =>
          [{10001, 27}, {10002, 27}, {10003, 27}, {10004, 27}]};
get({28, 1}) ->
    #{attr =>
          #attr{hp_max = 1795, mp_max = 531, atk_speed = 71,
                phy_dmg = 1024, magic_dmg = 468, phy_def = 532,
                magic_def = 330, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 33, anti_control = 33},
      skills =>
          [{10001, 28}, {10002, 28}, {10003, 28}, {10004, 28}]};
get({29, 1}) ->
    #{attr =>
          #attr{hp_max = 1888, mp_max = 550, atk_speed = 74,
                phy_dmg = 1091, magic_dmg = 507, phy_def = 559,
                magic_def = 348, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 36, anti_control = 36},
      skills =>
          [{10001, 29}, {10002, 29}, {10003, 29}, {10004, 29}]};
get({30, 1}) ->
    #{attr =>
          #attr{hp_max = 2029, mp_max = 579, atk_speed = 80,
                phy_dmg = 1192, magic_dmg = 566, phy_def = 602,
                magic_def = 375, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 41, anti_control = 41},
      skills =>
          [{10001, 30}, {10002, 30}, {10003, 30}, {10004, 30}]};
get({31, 1}) ->
    #{attr =>
          #attr{hp_max = 2050, mp_max = 580, atk_speed = 80,
                phy_dmg = 1202, magic_dmg = 569, phy_def = 613,
                magic_def = 380, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 41, anti_control = 41},
      skills =>
          [{10001, 31}, {10002, 31}, {10003, 31}, {10004, 31}]};
get({32, 1}) ->
    #{attr =>
          #attr{hp_max = 2094, mp_max = 584, atk_speed = 82,
                phy_dmg = 1224, magic_dmg = 574, phy_def = 638,
                magic_def = 391, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 41, anti_control = 41},
      skills =>
          [{10001, 32}, {10002, 32}, {10003, 32}, {10004, 32}]};
get({33, 1}) ->
    #{attr =>
          #attr{hp_max = 2137, mp_max = 588, atk_speed = 84,
                phy_dmg = 1246, magic_dmg = 581, phy_def = 662,
                magic_def = 402, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 41, anti_control = 41},
      skills =>
          [{10001, 33}, {10002, 33}, {10003, 33}, {10004, 33}]};
get({34, 1}) ->
    #{attr =>
          #attr{hp_max = 2181, mp_max = 592, atk_speed = 86,
                phy_dmg = 1267, magic_dmg = 587, phy_def = 685,
                magic_def = 413, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 41, anti_control = 41},
      skills =>
          [{10001, 34}, {10002, 34}, {10003, 34}, {10004, 34}]};
get({35, 1}) ->
    #{attr =>
          #attr{hp_max = 2246, mp_max = 598, atk_speed = 89,
                phy_dmg = 1300, magic_dmg = 596, phy_def = 722,
                magic_def = 430, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 41, anti_control = 41},
      skills =>
          [{10001, 35},
           {10002, 35},
           {10003, 35},
           {10004, 35},
           {10005, 35}]};
get({36, 1}) ->
    #{attr =>
          #attr{hp_max = 2376, mp_max = 599, atk_speed = 91,
                phy_dmg = 1349, magic_dmg = 616, phy_def = 748,
                magic_def = 443, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 41, anti_control = 41},
      skills =>
          [{10001, 36},
           {10002, 36},
           {10003, 36},
           {10004, 36},
           {10005, 36}]};
get({37, 1}) ->
    #{attr =>
          #attr{hp_max = 2635, mp_max = 603, atk_speed = 96,
                phy_dmg = 1448, magic_dmg = 658, phy_def = 800,
                magic_def = 470, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 41, anti_control = 41},
      skills =>
          [{10001, 37},
           {10002, 37},
           {10003, 37},
           {10004, 37},
           {10005, 37}]};
get({38, 1}) ->
    #{attr =>
          #attr{hp_max = 2895, mp_max = 607, atk_speed = 102,
                phy_dmg = 1548, magic_dmg = 700, phy_def = 854,
                magic_def = 496, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 41, anti_control = 41},
      skills =>
          [{10001, 38},
           {10002, 38},
           {10003, 38},
           {10004, 38},
           {10005, 38}]};
get({39, 1}) ->
    #{attr =>
          #attr{hp_max = 3155, mp_max = 610, atk_speed = 107,
                phy_dmg = 1648, magic_dmg = 741, phy_def = 906,
                magic_def = 523, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 41, anti_control = 41},
      skills =>
          [{10001, 39},
           {10002, 39},
           {10003, 39},
           {10004, 39},
           {10005, 39}]};
get({40, 1}) ->
    #{attr =>
          #attr{hp_max = 3545, mp_max = 616, atk_speed = 115,
                phy_dmg = 1797, magic_dmg = 804, phy_def = 985,
                magic_def = 564, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 41, anti_control = 41},
      skills =>
          [{10001, 40},
           {10002, 40},
           {10003, 40},
           {10004, 40},
           {10005, 40}]};
get({41, 1}) ->
    #{attr =>
          #attr{hp_max = 3625, mp_max = 625, atk_speed = 118,
                phy_dmg = 1824, magic_dmg = 810, phy_def = 1006,
                magic_def = 582, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 42, anti_control = 42},
      skills =>
          [{10001, 41},
           {10002, 41},
           {10003, 41},
           {10004, 41},
           {10005, 41}]};
get({42, 1}) ->
    #{attr =>
          #attr{hp_max = 3786, mp_max = 645, atk_speed = 125,
                phy_dmg = 1879, magic_dmg = 822, phy_def = 1049,
                magic_def = 619, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 45, anti_control = 45},
      skills =>
          [{10001, 42},
           {10002, 42},
           {10003, 42},
           {10004, 42},
           {10005, 42}]};
get({43, 1}) ->
    #{attr =>
          #attr{hp_max = 3947, mp_max = 664, atk_speed = 133,
                phy_dmg = 1934, magic_dmg = 835, phy_def = 1093,
                magic_def = 657, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 48, anti_control = 48},
      skills =>
          [{10001, 43},
           {10002, 43},
           {10003, 43},
           {10004, 43},
           {10005, 43}]};
get({44, 1}) ->
    #{attr =>
          #attr{hp_max = 4107, mp_max = 683, atk_speed = 140,
                phy_dmg = 1988, magic_dmg = 846, phy_def = 1137,
                magic_def = 694, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 51, anti_control = 51},
      skills =>
          [{10001, 44},
           {10002, 44},
           {10003, 44},
           {10004, 44},
           {10005, 44}]};
get({45, 1}) ->
    #{attr =>
          #attr{hp_max = 4349, mp_max = 713, atk_speed = 151,
                phy_dmg = 2071, magic_dmg = 865, phy_def = 1202,
                magic_def = 750, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 56, anti_control = 56},
      skills =>
          [{10001, 45},
           {10002, 45},
           {10003, 45},
           {10004, 45},
           {10005, 45},
           {10006, 45}]};
get({46, 1}) ->
    #{attr =>
          #attr{hp_max = 4419, mp_max = 720, atk_speed = 154,
                phy_dmg = 2115, magic_dmg = 893, phy_def = 1227,
                magic_def = 762, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 56, anti_control = 56},
      skills =>
          [{10001, 46},
           {10002, 46},
           {10003, 46},
           {10004, 46},
           {10005, 46},
           {10006, 46}]};
get({47, 1}) ->
    #{attr =>
          #attr{hp_max = 4559, mp_max = 734, atk_speed = 160,
                phy_dmg = 2206, magic_dmg = 948, phy_def = 1276,
                magic_def = 789, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 57, anti_control = 57},
      skills =>
          [{10001, 47},
           {10002, 47},
           {10003, 47},
           {10004, 47},
           {10005, 47},
           {10006, 47}]};
get({48, 1}) ->
    #{attr =>
          #attr{hp_max = 4700, mp_max = 749, atk_speed = 166,
                phy_dmg = 2298, magic_dmg = 1004, phy_def = 1326,
                magic_def = 815, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 59, anti_control = 59},
      skills =>
          [{10001, 48},
           {10002, 48},
           {10003, 48},
           {10004, 48},
           {10005, 48},
           {10006, 48}]};
get({49, 1}) ->
    #{attr =>
          #attr{hp_max = 4840, mp_max = 764, atk_speed = 172,
                phy_dmg = 2389, magic_dmg = 1060, phy_def = 1375,
                magic_def = 840, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 60, anti_control = 60},
      skills =>
          [{10001, 49},
           {10002, 49},
           {10003, 49},
           {10004, 49},
           {10005, 49},
           {10006, 49}]};
get({50, 1}) ->
    #{attr =>
          #attr{hp_max = 5051, mp_max = 786, atk_speed = 182,
                phy_dmg = 2526, magic_dmg = 1143, phy_def = 1450,
                magic_def = 880, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 62, anti_control = 62},
      skills =>
          [{10001, 50},
           {10002, 50},
           {10003, 50},
           {10004, 50},
           {10005, 50},
           {10006, 50}]};
get({51, 1}) ->
    #{attr =>
          #attr{hp_max = 5106, mp_max = 802, atk_speed = 185,
                phy_dmg = 2555, magic_dmg = 1155, phy_def = 1464,
                magic_def = 892, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 64, anti_control = 64},
      skills =>
          [{10001, 51},
           {10002, 51},
           {10003, 51},
           {10004, 51},
           {10005, 51},
           {10006, 51}]};
get({52, 1}) ->
    #{attr =>
          #attr{hp_max = 5217, mp_max = 835, atk_speed = 191,
                phy_dmg = 2614, magic_dmg = 1178, phy_def = 1495,
                magic_def = 916, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 68, anti_control = 68},
      skills =>
          [{10001, 52},
           {10002, 52},
           {10003, 52},
           {10004, 52},
           {10005, 52},
           {10006, 52}]};
get({53, 1}) ->
    #{attr =>
          #attr{hp_max = 5329, mp_max = 869, atk_speed = 197,
                phy_dmg = 2674, magic_dmg = 1200, phy_def = 1525,
                magic_def = 941, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 73, anti_control = 73},
      skills =>
          [{10001, 53},
           {10002, 53},
           {10003, 53},
           {10004, 53},
           {10005, 53},
           {10006, 53}]};
get({54, 1}) ->
    #{attr =>
          #attr{hp_max = 5440, mp_max = 902, atk_speed = 203,
                phy_dmg = 2734, magic_dmg = 1223, phy_def = 1556,
                magic_def = 965, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 78, anti_control = 78},
      skills =>
          [{10001, 54},
           {10002, 54},
           {10003, 54},
           {10004, 54},
           {10005, 54},
           {10006, 54}]};
get({55, 1}) ->
    #{attr =>
          #attr{hp_max = 5607, mp_max = 952, atk_speed = 213,
                phy_dmg = 2823, magic_dmg = 1258, phy_def = 1601,
                magic_def = 1002, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 85, anti_control = 85},
      skills =>
          [{10001, 55},
           {10002, 55},
           {10003, 55},
           {10004, 55},
           {10005, 55},
           {10006, 55},
           {10007, 55}]};
get({56, 1}) ->
    #{attr =>
          #attr{hp_max = 5719, mp_max = 957, atk_speed = 215,
                phy_dmg = 2876, magic_dmg = 1286, phy_def = 1632,
                magic_def = 1027, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 85, anti_control = 85},
      skills =>
          [{10001, 56},
           {10002, 56},
           {10003, 56},
           {10004, 56},
           {10005, 56},
           {10006, 56},
           {10007, 56}]};
get({57, 1}) ->
    #{attr =>
          #attr{hp_max = 5943, mp_max = 967, atk_speed = 221,
                phy_dmg = 2983, magic_dmg = 1342, phy_def = 1692,
                magic_def = 1080, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 86, anti_control = 86},
      skills =>
          [{10001, 57},
           {10002, 57},
           {10003, 57},
           {10004, 57},
           {10005, 57},
           {10006, 57},
           {10007, 57}]};
get({58, 1}) ->
    #{attr =>
          #attr{hp_max = 6168, mp_max = 977, atk_speed = 227,
                phy_dmg = 3091, magic_dmg = 1398, phy_def = 1753,
                magic_def = 1133, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 87, anti_control = 87},
      skills =>
          [{10001, 58},
           {10002, 58},
           {10003, 58},
           {10004, 58},
           {10005, 58},
           {10006, 58},
           {10007, 58}]};
get({59, 1}) ->
    #{attr =>
          #attr{hp_max = 6392, mp_max = 987, atk_speed = 232,
                phy_dmg = 3198, magic_dmg = 1453, phy_def = 1814,
                magic_def = 1185, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 87, anti_control = 87},
      skills =>
          [{10001, 59},
           {10002, 59},
           {10003, 59},
           {10004, 59},
           {10005, 59},
           {10006, 59},
           {10007, 59}]};
get({60, 1}) ->
    #{attr =>
          #attr{hp_max = 6729, mp_max = 1002, atk_speed = 241,
                phy_dmg = 3360, magic_dmg = 1538, phy_def = 1906,
                magic_def = 1264, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 89, anti_control = 89},
      skills =>
          [{10001, 60},
           {10002, 60},
           {10003, 60},
           {10004, 60},
           {10005, 60},
           {10006, 60},
           {10007, 60}]};
get({61, 1}) ->
    #{attr =>
          #attr{hp_max = 6811, mp_max = 1017, atk_speed = 246,
                phy_dmg = 3394, magic_dmg = 1545, phy_def = 1925,
                magic_def = 1288, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 91, anti_control = 91},
      skills =>
          [{10001, 61},
           {10002, 61},
           {10003, 61},
           {10004, 61},
           {10005, 61},
           {10006, 61},
           {10007, 61}]};
get({62, 1}) ->
    #{attr =>
          #attr{hp_max = 6978, mp_max = 1047, atk_speed = 256,
                phy_dmg = 3462, magic_dmg = 1562, phy_def = 1965,
                magic_def = 1335, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 95, anti_control = 95},
      skills =>
          [{10001, 62},
           {10002, 62},
           {10003, 62},
           {10004, 62},
           {10005, 62},
           {10006, 62},
           {10007, 62}]};
get({63, 1}) ->
    #{attr =>
          #attr{hp_max = 7144, mp_max = 1077, atk_speed = 266,
                phy_dmg = 3531, magic_dmg = 1579, phy_def = 2004,
                magic_def = 1383, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 100,
                anti_control = 100},
      skills =>
          [{10001, 63},
           {10002, 63},
           {10003, 63},
           {10004, 63},
           {10005, 63},
           {10006, 63},
           {10007, 63}]};
get({64, 1}) ->
    #{attr =>
          #attr{hp_max = 7310, mp_max = 1107, atk_speed = 276,
                phy_dmg = 3599, magic_dmg = 1596, phy_def = 2043,
                magic_def = 1430, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 105,
                anti_control = 105},
      skills =>
          [{10001, 64},
           {10002, 64},
           {10003, 64},
           {10004, 64},
           {10005, 64},
           {10006, 64},
           {10007, 64}]};
get({65, 1}) ->
    #{attr =>
          #attr{hp_max = 7560, mp_max = 1153, atk_speed = 291,
                phy_dmg = 3703, magic_dmg = 1622, phy_def = 2103,
                magic_def = 1502, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 112,
                anti_control = 112},
      skills =>
          [{10001, 65},
           {10002, 65},
           {10003, 65},
           {10004, 65},
           {10005, 65},
           {10006, 65},
           {10007, 65}]};
get({66, 1}) ->
    #{attr =>
          #attr{hp_max = 7646, mp_max = 1158, atk_speed = 295,
                phy_dmg = 3751, magic_dmg = 1653, phy_def = 2127,
                magic_def = 1515, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 112,
                anti_control = 112},
      skills =>
          [{10001, 66},
           {10002, 66},
           {10003, 66},
           {10004, 66},
           {10005, 66},
           {10006, 66},
           {10007, 66}]};
get({67, 1}) ->
    #{attr =>
          #attr{hp_max = 7819, mp_max = 1169, atk_speed = 304,
                phy_dmg = 3850, magic_dmg = 1713, phy_def = 2175,
                magic_def = 1541, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 113,
                anti_control = 113},
      skills =>
          [{10001, 67},
           {10002, 67},
           {10003, 67},
           {10004, 67},
           {10005, 67},
           {10006, 67},
           {10007, 67}]};
get({68, 1}) ->
    #{attr =>
          #attr{hp_max = 7992, mp_max = 1180, atk_speed = 313,
                phy_dmg = 3948, magic_dmg = 1774, phy_def = 2224,
                magic_def = 1568, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 114,
                anti_control = 114},
      skills =>
          [{10001, 68},
           {10002, 68},
           {10003, 68},
           {10004, 68},
           {10005, 68},
           {10006, 68},
           {10007, 68}]};
get({69, 1}) ->
    #{attr =>
          #attr{hp_max = 8166, mp_max = 1190, atk_speed = 322,
                phy_dmg = 4046, magic_dmg = 1835, phy_def = 2273,
                magic_def = 1594, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 114,
                anti_control = 114},
      skills =>
          [{10001, 69},
           {10002, 69},
           {10003, 69},
           {10004, 69},
           {10005, 69},
           {10006, 69},
           {10007, 69}]};
get({70, 1}) ->
    #{attr =>
          #attr{hp_max = 8426, mp_max = 1207, atk_speed = 336,
                phy_dmg = 4194, magic_dmg = 1927, phy_def = 2346,
                magic_def = 1634, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 116,
                anti_control = 116},
      skills =>
          [{10001, 70},
           {10002, 70},
           {10003, 70},
           {10004, 70},
           {10005, 70},
           {10006, 70},
           {10007, 70}]};
get({71, 1}) ->
    #{attr =>
          #attr{hp_max = 8550, mp_max = 1224, atk_speed = 340,
                phy_dmg = 4256, magic_dmg = 1955, phy_def = 2380,
                magic_def = 1658, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 117,
                anti_control = 117},
      skills =>
          [{10001, 71},
           {10002, 71},
           {10003, 71},
           {10004, 71},
           {10005, 71},
           {10006, 71},
           {10007, 71}]};
get({72, 1}) ->
    #{attr =>
          #attr{hp_max = 8675, mp_max = 1242, atk_speed = 345,
                phy_dmg = 4318, magic_dmg = 1984, phy_def = 2415,
                magic_def = 1682, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 119,
                anti_control = 119},
      skills =>
          [{10001, 72},
           {10002, 72},
           {10003, 72},
           {10004, 72},
           {10005, 72},
           {10006, 72},
           {10007, 72}]};
get({73, 1}) ->
    #{attr =>
          #attr{hp_max = 8800, mp_max = 1260, atk_speed = 350,
                phy_dmg = 4380, magic_dmg = 2012, phy_def = 2450,
                magic_def = 1706, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 121,
                anti_control = 121},
      skills =>
          [{10001, 73},
           {10002, 73},
           {10003, 73},
           {10004, 73},
           {10005, 73},
           {10006, 73},
           {10007, 73}]};
get({74, 1}) ->
    #{attr =>
          #attr{hp_max = 8925, mp_max = 1278, atk_speed = 355,
                phy_dmg = 4442, magic_dmg = 2041, phy_def = 2485,
                magic_def = 1730, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 122,
                anti_control = 122},
      skills =>
          [{10001, 74},
           {10002, 74},
           {10003, 74},
           {10004, 74},
           {10005, 74},
           {10006, 74},
           {10007, 74}]};
get({75, 1}) ->
    #{attr =>
          #attr{hp_max = 9050, mp_max = 1296, atk_speed = 360,
                phy_dmg = 4504, magic_dmg = 2069, phy_def = 2519,
                magic_def = 1755, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 124,
                anti_control = 124},
      skills =>
          [{10001, 75},
           {10002, 75},
           {10003, 75},
           {10004, 75},
           {10005, 75},
           {10006, 75},
           {10007, 75}]};
get({76, 1}) ->
    #{attr =>
          #attr{hp_max = 9174, mp_max = 1314, atk_speed = 365,
                phy_dmg = 4566, magic_dmg = 2098, phy_def = 2554,
                magic_def = 1779, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 126,
                anti_control = 126},
      skills =>
          [{10001, 76},
           {10002, 76},
           {10003, 76},
           {10004, 76},
           {10005, 76},
           {10006, 76},
           {10007, 76}]};
get({77, 1}) ->
    #{attr =>
          #attr{hp_max = 9299, mp_max = 1332, atk_speed = 370,
                phy_dmg = 4628, magic_dmg = 2126, phy_def = 2589,
                magic_def = 1803, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 128,
                anti_control = 128},
      skills =>
          [{10001, 77},
           {10002, 77},
           {10003, 77},
           {10004, 77},
           {10005, 77},
           {10006, 77},
           {10007, 77}]};
get({78, 1}) ->
    #{attr =>
          #attr{hp_max = 9424, mp_max = 1350, atk_speed = 375,
                phy_dmg = 4691, magic_dmg = 2155, phy_def = 2624,
                magic_def = 1827, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 129,
                anti_control = 129},
      skills =>
          [{10001, 78},
           {10002, 78},
           {10003, 78},
           {10004, 78},
           {10005, 78},
           {10006, 78},
           {10007, 78}]};
get({79, 1}) ->
    #{attr =>
          #attr{hp_max = 9549, mp_max = 1367, atk_speed = 380,
                phy_dmg = 4753, magic_dmg = 2183, phy_def = 2658,
                magic_def = 1851, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 131,
                anti_control = 131},
      skills =>
          [{10001, 79},
           {10002, 79},
           {10003, 79},
           {10004, 79},
           {10005, 79},
           {10006, 79},
           {10007, 79}]};
get({80, 1}) ->
    #{attr =>
          #attr{hp_max = 9674, mp_max = 1385, atk_speed = 385,
                phy_dmg = 4815, magic_dmg = 2212, phy_def = 2693,
                magic_def = 1876, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 133,
                anti_control = 133},
      skills =>
          [{10001, 80},
           {10002, 80},
           {10003, 80},
           {10004, 80},
           {10005, 80},
           {10006, 80},
           {10007, 80}]};
get({81, 1}) ->
    #{attr =>
          #attr{hp_max = 9799, mp_max = 1403, atk_speed = 390,
                phy_dmg = 4877, magic_dmg = 2241, phy_def = 2728,
                magic_def = 1900, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 134,
                anti_control = 134},
      skills =>
          [{10001, 80},
           {10002, 80},
           {10003, 80},
           {10004, 80},
           {10005, 80},
           {10006, 80},
           {10007, 80}]};
get({82, 1}) ->
    #{attr =>
          #attr{hp_max = 9923, mp_max = 1421, atk_speed = 395,
                phy_dmg = 4939, magic_dmg = 2269, phy_def = 2763,
                magic_def = 1924, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 136,
                anti_control = 136},
      skills =>
          [{10001, 80},
           {10002, 80},
           {10003, 80},
           {10004, 80},
           {10005, 80},
           {10006, 80},
           {10007, 80}]};
get({83, 1}) ->
    #{attr =>
          #attr{hp_max = 10048, mp_max = 1439, atk_speed = 400,
                phy_dmg = 5001, magic_dmg = 2298, phy_def = 2797,
                magic_def = 1948, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 138,
                anti_control = 138},
      skills =>
          [{10001, 80},
           {10002, 80},
           {10003, 80},
           {10004, 80},
           {10005, 80},
           {10006, 80},
           {10007, 80}]};
get({84, 1}) ->
    #{attr =>
          #attr{hp_max = 10173, mp_max = 1457, atk_speed = 405,
                phy_dmg = 5063, magic_dmg = 2326, phy_def = 2832,
                magic_def = 1972, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 140,
                anti_control = 140},
      skills =>
          [{10001, 80},
           {10002, 80},
           {10003, 80},
           {10004, 80},
           {10005, 80},
           {10006, 80},
           {10007, 80}]};
get({85, 1}) ->
    #{attr =>
          #attr{hp_max = 10298, mp_max = 1475, atk_speed = 410,
                phy_dmg = 5126, magic_dmg = 2355, phy_def = 2867,
                magic_def = 1997, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 141,
                anti_control = 141},
      skills =>
          [{10001, 80},
           {10002, 80},
           {10003, 80},
           {10004, 80},
           {10005, 80},
           {10006, 80},
           {10007, 80}]};
get({86, 1}) ->
    #{attr =>
          #attr{hp_max = 10423, mp_max = 1493, atk_speed = 415,
                phy_dmg = 5188, magic_dmg = 2383, phy_def = 2902,
                magic_def = 2021, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 143,
                anti_control = 143},
      skills =>
          [{10001, 80},
           {10002, 80},
           {10003, 80},
           {10004, 80},
           {10005, 80},
           {10006, 80},
           {10007, 80}]};
get({87, 1}) ->
    #{attr =>
          #attr{hp_max = 10548, mp_max = 1510, atk_speed = 420,
                phy_dmg = 5250, magic_dmg = 2412, phy_def = 2936,
                magic_def = 2045, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 145,
                anti_control = 145},
      skills =>
          [{10001, 80},
           {10002, 80},
           {10003, 80},
           {10004, 80},
           {10005, 80},
           {10006, 80},
           {10007, 80}]};
get({88, 1}) ->
    #{attr =>
          #attr{hp_max = 10672, mp_max = 1528, atk_speed = 425,
                phy_dmg = 5312, magic_dmg = 2440, phy_def = 2971,
                magic_def = 2069, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 146,
                anti_control = 146},
      skills =>
          [{10001, 80},
           {10002, 80},
           {10003, 80},
           {10004, 80},
           {10005, 80},
           {10006, 80},
           {10007, 80}]};
get({89, 1}) ->
    #{attr =>
          #attr{hp_max = 10797, mp_max = 1546, atk_speed = 430,
                phy_dmg = 5374, magic_dmg = 2469, phy_def = 3006,
                magic_def = 2093, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 148,
                anti_control = 148},
      skills =>
          [{10001, 80},
           {10002, 80},
           {10003, 80},
           {10004, 80},
           {10005, 80},
           {10006, 80},
           {10007, 80}]};
get({90, 1}) ->
    #{attr =>
          #attr{hp_max = 10922, mp_max = 1564, atk_speed = 435,
                phy_dmg = 5436, magic_dmg = 2497, phy_def = 3041,
                magic_def = 2118, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 150,
                anti_control = 150},
      skills =>
          [{10001, 80},
           {10002, 80},
           {10003, 80},
           {10004, 80},
           {10005, 80},
           {10006, 80},
           {10007, 80}]};
get({91, 1}) ->
    #{attr =>
          #attr{hp_max = 11016, mp_max = 1578, atk_speed = 439,
                phy_dmg = 5483, magic_dmg = 2519, phy_def = 3067,
                magic_def = 2136, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 151,
                anti_control = 151},
      skills =>
          [{10001, 80},
           {10002, 80},
           {10003, 80},
           {10004, 80},
           {10005, 80},
           {10006, 80},
           {10007, 80}]};
get({92, 1}) ->
    #{attr =>
          #attr{hp_max = 11109, mp_max = 1591, atk_speed = 443,
                phy_dmg = 5529, magic_dmg = 2540, phy_def = 3093,
                magic_def = 2154, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 152,
                anti_control = 152},
      skills =>
          [{10001, 80},
           {10002, 80},
           {10003, 80},
           {10004, 80},
           {10005, 80},
           {10006, 80},
           {10007, 80}]};
get({93, 1}) ->
    #{attr =>
          #attr{hp_max = 11203, mp_max = 1604, atk_speed = 446,
                phy_dmg = 5576, magic_dmg = 2562, phy_def = 3119,
                magic_def = 2172, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 154,
                anti_control = 154},
      skills =>
          [{10001, 80},
           {10002, 80},
           {10003, 80},
           {10004, 80},
           {10005, 80},
           {10006, 80},
           {10007, 80}]};
get({94, 1}) ->
    #{attr =>
          #attr{hp_max = 11297, mp_max = 1618, atk_speed = 450,
                phy_dmg = 5623, magic_dmg = 2583, phy_def = 3145,
                magic_def = 2190, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 155,
                anti_control = 155},
      skills =>
          [{10001, 80},
           {10002, 80},
           {10003, 80},
           {10004, 80},
           {10005, 80},
           {10006, 80},
           {10007, 80}]};
get({95, 1}) ->
    #{attr =>
          #attr{hp_max = 11390, mp_max = 1631, atk_speed = 454,
                phy_dmg = 5669, magic_dmg = 2605, phy_def = 3171,
                magic_def = 2208, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 156,
                anti_control = 156},
      skills =>
          [{10001, 80},
           {10002, 80},
           {10003, 80},
           {10004, 80},
           {10005, 80},
           {10006, 80},
           {10007, 80}]};
get({96, 1}) ->
    #{attr =>
          #attr{hp_max = 11484, mp_max = 1645, atk_speed = 457,
                phy_dmg = 5716, magic_dmg = 2626, phy_def = 3197,
                magic_def = 2227, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 158,
                anti_control = 158},
      skills =>
          [{10001, 80},
           {10002, 80},
           {10003, 80},
           {10004, 80},
           {10005, 80},
           {10006, 80},
           {10007, 80}]};
get({97, 1}) ->
    #{attr =>
          #attr{hp_max = 11577, mp_max = 1658, atk_speed = 461,
                phy_dmg = 5762, magic_dmg = 2647, phy_def = 3223,
                magic_def = 2245, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 159,
                anti_control = 159},
      skills =>
          [{10001, 80},
           {10002, 80},
           {10003, 80},
           {10004, 80},
           {10005, 80},
           {10006, 80},
           {10007, 80}]};
get({98, 1}) ->
    #{attr =>
          #attr{hp_max = 11671, mp_max = 1671, atk_speed = 465,
                phy_dmg = 5809, magic_dmg = 2669, phy_def = 3249,
                magic_def = 2263, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 160,
                anti_control = 160},
      skills =>
          [{10001, 80},
           {10002, 80},
           {10003, 80},
           {10004, 80},
           {10005, 80},
           {10006, 80},
           {10007, 80}]};
get({99, 1}) ->
    #{attr =>
          #attr{hp_max = 11765, mp_max = 1685, atk_speed = 469,
                phy_dmg = 5856, magic_dmg = 2690, phy_def = 3275,
                magic_def = 2281, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 161,
                anti_control = 161},
      skills =>
          [{10001, 80},
           {10002, 80},
           {10003, 80},
           {10004, 80},
           {10005, 80},
           {10006, 80},
           {10007, 80}]};
get({100, 1}) ->
    #{attr =>
          #attr{hp_max = 11858, mp_max = 1698, atk_speed = 472,
                phy_dmg = 5902, magic_dmg = 2712, phy_def = 3301,
                magic_def = 2299, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 163,
                anti_control = 163},
      skills =>
          [{10001, 80},
           {10002, 80},
           {10003, 80},
           {10004, 80},
           {10005, 80},
           {10006, 80},
           {10007, 80}]};
get({101, 1}) ->
    #{attr =>
          #attr{hp_max = 11952, mp_max = 1712, atk_speed = 476,
                phy_dmg = 5949, magic_dmg = 2733, phy_def = 3327,
                magic_def = 2317, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 164,
                anti_control = 164},
      skills =>
          [{10001, 80},
           {10002, 80},
           {10003, 80},
           {10004, 80},
           {10005, 80},
           {10006, 80},
           {10007, 80}]};
get({102, 1}) ->
    #{attr =>
          #attr{hp_max = 12046, mp_max = 1725, atk_speed = 480,
                phy_dmg = 5995, magic_dmg = 2754, phy_def = 3353,
                magic_def = 2336, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 165,
                anti_control = 165},
      skills =>
          [{10001, 80},
           {10002, 80},
           {10003, 80},
           {10004, 80},
           {10005, 80},
           {10006, 80},
           {10007, 80}]};
get({103, 1}) ->
    #{attr =>
          #attr{hp_max = 12139, mp_max = 1738, atk_speed = 484,
                phy_dmg = 6042, magic_dmg = 2776, phy_def = 3379,
                magic_def = 2354, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 167,
                anti_control = 167},
      skills =>
          [{10001, 80},
           {10002, 80},
           {10003, 80},
           {10004, 80},
           {10005, 80},
           {10006, 80},
           {10007, 80}]};
get({104, 1}) ->
    #{attr =>
          #attr{hp_max = 12233, mp_max = 1752, atk_speed = 487,
                phy_dmg = 6089, magic_dmg = 2797, phy_def = 3406,
                magic_def = 2372, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 168,
                anti_control = 168},
      skills =>
          [{10001, 80},
           {10002, 80},
           {10003, 80},
           {10004, 80},
           {10005, 80},
           {10006, 80},
           {10007, 80}]};
get({105, 1}) ->
    #{attr =>
          #attr{hp_max = 12326, mp_max = 1765, atk_speed = 491,
                phy_dmg = 6135, magic_dmg = 2819, phy_def = 3432,
                magic_def = 2390, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 169,
                anti_control = 169},
      skills =>
          [{10001, 80},
           {10002, 80},
           {10003, 80},
           {10004, 80},
           {10005, 80},
           {10006, 80},
           {10007, 80}]};
get({106, 1}) ->
    #{attr =>
          #attr{hp_max = 12420, mp_max = 1779, atk_speed = 495,
                phy_dmg = 6182, magic_dmg = 2840, phy_def = 3458,
                magic_def = 2408, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 170,
                anti_control = 170},
      skills =>
          [{10001, 80},
           {10002, 80},
           {10003, 80},
           {10004, 80},
           {10005, 80},
           {10006, 80},
           {10007, 80}]};
get({107, 1}) ->
    #{attr =>
          #attr{hp_max = 12514, mp_max = 1792, atk_speed = 499,
                phy_dmg = 6228, magic_dmg = 2861, phy_def = 3484,
                magic_def = 2426, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 172,
                anti_control = 172},
      skills =>
          [{10001, 80},
           {10002, 80},
           {10003, 80},
           {10004, 80},
           {10005, 80},
           {10006, 80},
           {10007, 80}]};
get({108, 1}) ->
    #{attr =>
          #attr{hp_max = 12607, mp_max = 1806, atk_speed = 502,
                phy_dmg = 6275, magic_dmg = 2883, phy_def = 3510,
                magic_def = 2444, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 173,
                anti_control = 173},
      skills =>
          [{10001, 80},
           {10002, 80},
           {10003, 80},
           {10004, 80},
           {10005, 80},
           {10006, 80},
           {10007, 80}]};
get({109, 1}) ->
    #{attr =>
          #attr{hp_max = 12701, mp_max = 1819, atk_speed = 506,
                phy_dmg = 6322, magic_dmg = 2904, phy_def = 3536,
                magic_def = 2463, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 174,
                anti_control = 174},
      skills =>
          [{10001, 80},
           {10002, 80},
           {10003, 80},
           {10004, 80},
           {10005, 80},
           {10006, 80},
           {10007, 80}]};
get({110, 1}) ->
    #{attr =>
          #attr{hp_max = 12795, mp_max = 1832, atk_speed = 510,
                phy_dmg = 6368, magic_dmg = 2926, phy_def = 3562,
                magic_def = 2481, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{10001, 80},
           {10002, 80},
           {10003, 80},
           {10004, 80},
           {10005, 80},
           {10006, 80},
           {10007, 80}]};
get({111, 1}) ->
    #{attr =>
          #attr{hp_max = 12795, mp_max = 1832, atk_speed = 510,
                phy_dmg = 6368, magic_dmg = 2926, phy_def = 3562,
                magic_def = 2481, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{10001, 80},
           {10002, 80},
           {10003, 80},
           {10004, 80},
           {10005, 80},
           {10006, 80},
           {10007, 80}]};
get({112, 1}) ->
    #{attr =>
          #attr{hp_max = 12795, mp_max = 1832, atk_speed = 510,
                phy_dmg = 6368, magic_dmg = 2926, phy_def = 3562,
                magic_def = 2481, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{10001, 80},
           {10002, 80},
           {10003, 80},
           {10004, 80},
           {10005, 80},
           {10006, 80},
           {10007, 80}]};
get({113, 1}) ->
    #{attr =>
          #attr{hp_max = 12795, mp_max = 1832, atk_speed = 510,
                phy_dmg = 6368, magic_dmg = 2926, phy_def = 3562,
                magic_def = 2481, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{10001, 80},
           {10002, 80},
           {10003, 80},
           {10004, 80},
           {10005, 80},
           {10006, 80},
           {10007, 80}]};
get({114, 1}) ->
    #{attr =>
          #attr{hp_max = 12795, mp_max = 1832, atk_speed = 510,
                phy_dmg = 6368, magic_dmg = 2926, phy_def = 3562,
                magic_def = 2481, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{10001, 80},
           {10002, 80},
           {10003, 80},
           {10004, 80},
           {10005, 80},
           {10006, 80},
           {10007, 80}]};
get({115, 1}) ->
    #{attr =>
          #attr{hp_max = 12795, mp_max = 1832, atk_speed = 510,
                phy_dmg = 6368, magic_dmg = 2926, phy_def = 3562,
                magic_def = 2481, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{10001, 80},
           {10002, 80},
           {10003, 80},
           {10004, 80},
           {10005, 80},
           {10006, 80},
           {10007, 80}]};
get({116, 1}) ->
    #{attr =>
          #attr{hp_max = 12795, mp_max = 1832, atk_speed = 510,
                phy_dmg = 6368, magic_dmg = 2926, phy_def = 3562,
                magic_def = 2481, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{10001, 80},
           {10002, 80},
           {10003, 80},
           {10004, 80},
           {10005, 80},
           {10006, 80},
           {10007, 80}]};
get({117, 1}) ->
    #{attr =>
          #attr{hp_max = 12795, mp_max = 1832, atk_speed = 510,
                phy_dmg = 6368, magic_dmg = 2926, phy_def = 3562,
                magic_def = 2481, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{10001, 80},
           {10002, 80},
           {10003, 80},
           {10004, 80},
           {10005, 80},
           {10006, 80},
           {10007, 80}]};
get({118, 1}) ->
    #{attr =>
          #attr{hp_max = 12795, mp_max = 1832, atk_speed = 510,
                phy_dmg = 6368, magic_dmg = 2926, phy_def = 3562,
                magic_def = 2481, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{10001, 80},
           {10002, 80},
           {10003, 80},
           {10004, 80},
           {10005, 80},
           {10006, 80},
           {10007, 80}]};
get({119, 1}) ->
    #{attr =>
          #attr{hp_max = 12795, mp_max = 1832, atk_speed = 510,
                phy_dmg = 6368, magic_dmg = 2926, phy_def = 3562,
                magic_def = 2481, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{10001, 80},
           {10002, 80},
           {10003, 80},
           {10004, 80},
           {10005, 80},
           {10006, 80},
           {10007, 80}]};
get({120, 1}) ->
    #{attr =>
          #attr{hp_max = 12795, mp_max = 1832, atk_speed = 510,
                phy_dmg = 6368, magic_dmg = 2926, phy_def = 3562,
                magic_def = 2481, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{10001, 80},
           {10002, 80},
           {10003, 80},
           {10004, 80},
           {10005, 80},
           {10006, 80},
           {10007, 80}]};
get({121, 1}) ->
    #{attr =>
          #attr{hp_max = 12795, mp_max = 1832, atk_speed = 510,
                phy_dmg = 6368, magic_dmg = 2926, phy_def = 3562,
                magic_def = 2481, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{10001, 80},
           {10002, 80},
           {10003, 80},
           {10004, 80},
           {10005, 80},
           {10006, 80},
           {10007, 80}]};
get({122, 1}) ->
    #{attr =>
          #attr{hp_max = 12795, mp_max = 1832, atk_speed = 510,
                phy_dmg = 6368, magic_dmg = 2926, phy_def = 3562,
                magic_def = 2481, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{10001, 80},
           {10002, 80},
           {10003, 80},
           {10004, 80},
           {10005, 80},
           {10006, 80},
           {10007, 80}]};
get({123, 1}) ->
    #{attr =>
          #attr{hp_max = 12795, mp_max = 1832, atk_speed = 510,
                phy_dmg = 6368, magic_dmg = 2926, phy_def = 3562,
                magic_def = 2481, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{10001, 80},
           {10002, 80},
           {10003, 80},
           {10004, 80},
           {10005, 80},
           {10006, 80},
           {10007, 80}]};
get({124, 1}) ->
    #{attr =>
          #attr{hp_max = 12795, mp_max = 1832, atk_speed = 510,
                phy_dmg = 6368, magic_dmg = 2926, phy_def = 3562,
                magic_def = 2481, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{10001, 80},
           {10002, 80},
           {10003, 80},
           {10004, 80},
           {10005, 80},
           {10006, 80},
           {10007, 80}]};
get({125, 1}) ->
    #{attr =>
          #attr{hp_max = 12795, mp_max = 1832, atk_speed = 510,
                phy_dmg = 6368, magic_dmg = 2926, phy_def = 3562,
                magic_def = 2481, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{10001, 80},
           {10002, 80},
           {10003, 80},
           {10004, 80},
           {10005, 80},
           {10006, 80},
           {10007, 80}]};
get({126, 1}) ->
    #{attr =>
          #attr{hp_max = 12795, mp_max = 1832, atk_speed = 510,
                phy_dmg = 6368, magic_dmg = 2926, phy_def = 3562,
                magic_def = 2481, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{10001, 80},
           {10002, 80},
           {10003, 80},
           {10004, 80},
           {10005, 80},
           {10006, 80},
           {10007, 80}]};
get({127, 1}) ->
    #{attr =>
          #attr{hp_max = 12795, mp_max = 1832, atk_speed = 510,
                phy_dmg = 6368, magic_dmg = 2926, phy_def = 3562,
                magic_def = 2481, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{10001, 80},
           {10002, 80},
           {10003, 80},
           {10004, 80},
           {10005, 80},
           {10006, 80},
           {10007, 80}]};
get({128, 1}) ->
    #{attr =>
          #attr{hp_max = 12795, mp_max = 1832, atk_speed = 510,
                phy_dmg = 6368, magic_dmg = 2926, phy_def = 3562,
                magic_def = 2481, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{10001, 80},
           {10002, 80},
           {10003, 80},
           {10004, 80},
           {10005, 80},
           {10006, 80},
           {10007, 80}]};
get({129, 1}) ->
    #{attr =>
          #attr{hp_max = 12795, mp_max = 1832, atk_speed = 510,
                phy_dmg = 6368, magic_dmg = 2926, phy_def = 3562,
                magic_def = 2481, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{10001, 80},
           {10002, 80},
           {10003, 80},
           {10004, 80},
           {10005, 80},
           {10006, 80},
           {10007, 80}]};
get({130, 1}) ->
    #{attr =>
          #attr{hp_max = 12795, mp_max = 1832, atk_speed = 510,
                phy_dmg = 6368, magic_dmg = 2926, phy_def = 3562,
                magic_def = 2481, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{10001, 80},
           {10002, 80},
           {10003, 80},
           {10004, 80},
           {10005, 80},
           {10006, 80},
           {10007, 80}]};
get({20, 2}) ->
    #{attr =>
          #attr{hp_max = 1344, mp_max = 390, atk_speed = 45,
                phy_dmg = 466, magic_dmg = 642, phy_def = 396,
                magic_def = 390, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 26, anti_control = 26},
      skills => [{20001, 20}, {20002, 20}, {20003, 20}]};
get({21, 2}) ->
    #{attr =>
          #attr{hp_max = 1365, mp_max = 399, atk_speed = 45,
                phy_dmg = 467, magic_dmg = 650, phy_def = 402,
                magic_def = 398, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 26, anti_control = 26},
      skills => [{20001, 21}, {20002, 21}, {20003, 21}]};
get({22, 2}) ->
    #{attr =>
          #attr{hp_max = 1409, mp_max = 417, atk_speed = 47,
                phy_dmg = 471, magic_dmg = 668, phy_def = 416,
                magic_def = 413, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 26, anti_control = 26},
      skills => [{20001, 22}, {20002, 22}, {20003, 22}]};
get({23, 2}) ->
    #{attr =>
          #attr{hp_max = 1452, mp_max = 436, atk_speed = 48,
                phy_dmg = 474, magic_dmg = 687, phy_def = 429,
                magic_def = 429, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 26, anti_control = 26},
      skills => [{20001, 23}, {20002, 23}, {20003, 23}]};
get({24, 2}) ->
    #{attr =>
          #attr{hp_max = 1496, mp_max = 455, atk_speed = 49,
                phy_dmg = 476, magic_dmg = 705, phy_def = 442,
                magic_def = 445, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 26, anti_control = 26},
      skills => [{20001, 24}, {20002, 24}, {20003, 24}]};
get({25, 2}) ->
    #{attr =>
          #attr{hp_max = 1561, mp_max = 483, atk_speed = 52,
                phy_dmg = 482, magic_dmg = 733, phy_def = 462,
                magic_def = 469, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 26, anti_control = 26},
      skills =>
          [{20001, 25}, {20002, 25}, {20003, 25}, {20006, 25}]};
get({26, 2}) ->
    #{attr =>
          #attr{hp_max = 1608, mp_max = 492, atk_speed = 53,
                phy_dmg = 508, magic_dmg = 760, phy_def = 475,
                magic_def = 481, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 27, anti_control = 27},
      skills =>
          [{20001, 26}, {20002, 26}, {20003, 26}, {20006, 26}]};
get({27, 2}) ->
    #{attr =>
          #attr{hp_max = 1701, mp_max = 511, atk_speed = 56,
                phy_dmg = 559, magic_dmg = 814, phy_def = 504,
                magic_def = 506, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 30, anti_control = 30},
      skills =>
          [{20001, 27}, {20002, 27}, {20003, 27}, {20006, 27}]};
get({28, 2}) ->
    #{attr =>
          #attr{hp_max = 1795, mp_max = 531, atk_speed = 60,
                phy_dmg = 611, magic_dmg = 868, phy_def = 532,
                magic_def = 532, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 33, anti_control = 33},
      skills =>
          [{20001, 28}, {20002, 28}, {20003, 28}, {20006, 28}]};
get({29, 2}) ->
    #{attr =>
          #attr{hp_max = 1888, mp_max = 550, atk_speed = 63,
                phy_dmg = 663, magic_dmg = 921, phy_def = 559,
                magic_def = 557, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 36, anti_control = 36},
      skills =>
          [{20001, 29}, {20002, 29}, {20003, 29}, {20006, 29}]};
get({30, 2}) ->
    #{attr =>
          #attr{hp_max = 2029, mp_max = 579, atk_speed = 68,
                phy_dmg = 741, magic_dmg = 1003, phy_def = 602,
                magic_def = 595, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 41, anti_control = 41},
      skills =>
          [{20001, 30}, {20002, 30}, {20003, 30}, {20006, 30}]};
get({31, 2}) ->
    #{attr =>
          #attr{hp_max = 2050, mp_max = 580, atk_speed = 68,
                phy_dmg = 743, magic_dmg = 1013, phy_def = 613,
                magic_def = 604, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 41, anti_control = 41},
      skills =>
          [{20001, 31}, {20002, 31}, {20003, 31}, {20006, 31}]};
get({32, 2}) ->
    #{attr =>
          #attr{hp_max = 2094, mp_max = 584, atk_speed = 70,
                phy_dmg = 749, magic_dmg = 1034, phy_def = 638,
                magic_def = 623, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 41, anti_control = 41},
      skills =>
          [{20001, 32}, {20002, 32}, {20003, 32}, {20006, 32}]};
get({33, 2}) ->
    #{attr =>
          #attr{hp_max = 2137, mp_max = 588, atk_speed = 71,
                phy_dmg = 756, magic_dmg = 1055, phy_def = 662,
                magic_def = 642, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 41, anti_control = 41},
      skills =>
          [{20001, 33}, {20002, 33}, {20003, 33}, {20006, 33}]};
get({34, 2}) ->
    #{attr =>
          #attr{hp_max = 2181, mp_max = 592, atk_speed = 72,
                phy_dmg = 761, magic_dmg = 1076, phy_def = 685,
                magic_def = 660, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 41, anti_control = 41},
      skills =>
          [{20001, 34}, {20002, 34}, {20003, 34}, {20006, 34}]};
get({35, 2}) ->
    #{attr =>
          #attr{hp_max = 2246, mp_max = 598, atk_speed = 75,
                phy_dmg = 771, magic_dmg = 1108, phy_def = 722,
                magic_def = 688, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 41, anti_control = 41},
      skills =>
          [{20001, 35},
           {20002, 35},
           {20003, 35},
           {20006, 35},
           {20005, 35}]};
get({36, 2}) ->
    #{attr =>
          #attr{hp_max = 2388, mp_max = 604, atk_speed = 76,
                phy_dmg = 791, magic_dmg = 1152, phy_def = 748,
                magic_def = 705, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 41, anti_control = 41},
      skills =>
          [{20001, 36},
           {20002, 36},
           {20003, 36},
           {20006, 36},
           {20005, 36}]};
get({37, 2}) ->
    #{attr =>
          #attr{hp_max = 2671, mp_max = 618, atk_speed = 80,
                phy_dmg = 832, magic_dmg = 1240, phy_def = 800,
                magic_def = 740, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 41, anti_control = 41},
      skills =>
          [{20001, 37},
           {20002, 37},
           {20003, 37},
           {20006, 37},
           {20005, 37}]};
get({38, 2}) ->
    #{attr =>
          #attr{hp_max = 2955, mp_max = 632, atk_speed = 84,
                phy_dmg = 873, magic_dmg = 1329, phy_def = 854,
                magic_def = 774, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 41, anti_control = 41},
      skills =>
          [{20001, 38},
           {20002, 38},
           {20003, 38},
           {20006, 38},
           {20005, 38}]};
get({39, 2}) ->
    #{attr =>
          #attr{hp_max = 3239, mp_max = 645, atk_speed = 88,
                phy_dmg = 912, magic_dmg = 1417, phy_def = 906,
                magic_def = 808, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 41, anti_control = 41},
      skills =>
          [{20001, 39},
           {20002, 39},
           {20003, 39},
           {20006, 39},
           {20005, 39}]};
get({40, 2}) ->
    #{attr =>
          #attr{hp_max = 3665, mp_max = 666, atk_speed = 94,
                phy_dmg = 974, magic_dmg = 1550, phy_def = 985,
                magic_def = 860, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 41, anti_control = 41},
      skills =>
          [{20001, 40},
           {20002, 40},
           {20003, 40},
           {20006, 40},
           {20005, 40}]};
get({41, 2}) ->
    #{attr =>
          #attr{hp_max = 3757, mp_max = 680, atk_speed = 96,
                phy_dmg = 987, magic_dmg = 1567, phy_def = 1006,
                magic_def = 882, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 42, anti_control = 42},
      skills =>
          [{20001, 41},
           {20002, 41},
           {20003, 41},
           {20006, 41},
           {20005, 41}]};
get({42, 2}) ->
    #{attr =>
          #attr{hp_max = 3942, mp_max = 710, atk_speed = 102,
                phy_dmg = 1012, magic_dmg = 1602, phy_def = 1049,
                magic_def = 927, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 45, anti_control = 45},
      skills =>
          [{20001, 42},
           {20002, 42},
           {20003, 42},
           {20006, 42},
           {20005, 42}]};
get({43, 2}) ->
    #{attr =>
          #attr{hp_max = 4127, mp_max = 739, atk_speed = 107,
                phy_dmg = 1038, magic_dmg = 1637, phy_def = 1093,
                magic_def = 972, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 48, anti_control = 48},
      skills =>
          [{20001, 43},
           {20002, 43},
           {20003, 43},
           {20006, 43},
           {20005, 43}]};
get({44, 2}) ->
    #{attr =>
          #attr{hp_max = 4311, mp_max = 768, atk_speed = 112,
                phy_dmg = 1064, magic_dmg = 1672, phy_def = 1137,
                magic_def = 1017, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 51, anti_control = 51},
      skills =>
          [{20001, 44},
           {20002, 44},
           {20003, 44},
           {20006, 44},
           {20005, 44}]};
get({45, 2}) ->
    #{attr =>
          #attr{hp_max = 4589, mp_max = 813, atk_speed = 121,
                phy_dmg = 1102, magic_dmg = 1725, phy_def = 1202,
                magic_def = 1084, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 56, anti_control = 56},
      skills =>
          [{20001, 45},
           {20002, 45},
           {20003, 45},
           {20006, 45},
           {20005, 45},
           {20004, 45}]};
get({46, 2}) ->
    #{attr =>
          #attr{hp_max = 4671, mp_max = 825, atk_speed = 123,
                phy_dmg = 1132, magic_dmg = 1765, phy_def = 1227,
                magic_def = 1101, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 56, anti_control = 56},
      skills =>
          [{20001, 46},
           {20002, 46},
           {20003, 46},
           {20006, 46},
           {20005, 46},
           {20004, 46}]};
get({47, 2}) ->
    #{attr =>
          #attr{hp_max = 4835, mp_max = 849, atk_speed = 127,
                phy_dmg = 1191, magic_dmg = 1845, phy_def = 1276,
                magic_def = 1135, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 57, anti_control = 57},
      skills =>
          [{20001, 47},
           {20002, 47},
           {20003, 47},
           {20006, 47},
           {20005, 47},
           {20004, 47}]};
get({48, 2}) ->
    #{attr =>
          #attr{hp_max = 5000, mp_max = 874, atk_speed = 132,
                phy_dmg = 1251, magic_dmg = 1926, phy_def = 1326,
                magic_def = 1168, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 59, anti_control = 59},
      skills =>
          [{20001, 48},
           {20002, 48},
           {20003, 48},
           {20006, 48},
           {20005, 48},
           {20004, 48}]};
get({49, 2}) ->
    #{attr =>
          #attr{hp_max = 5164, mp_max = 899, atk_speed = 137,
                phy_dmg = 1311, magic_dmg = 2006, phy_def = 1375,
                magic_def = 1201, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 60, anti_control = 60},
      skills =>
          [{20001, 49},
           {20002, 49},
           {20003, 49},
           {20006, 49},
           {20005, 49},
           {20004, 49}]};
get({50, 2}) ->
    #{attr =>
          #attr{hp_max = 5411, mp_max = 936, atk_speed = 144,
                phy_dmg = 1400, magic_dmg = 2128, phy_def = 1450,
                magic_def = 1253, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 62, anti_control = 62},
      skills =>
          [{20001, 50},
           {20002, 50},
           {20003, 50},
           {20006, 50},
           {20005, 50},
           {20004, 50}]};
get({51, 2}) ->
    #{attr =>
          #attr{hp_max = 5466, mp_max = 952, atk_speed = 146,
                phy_dmg = 1422, magic_dmg = 2147, phy_def = 1464,
                magic_def = 1268, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 64, anti_control = 64},
      skills =>
          [{20001, 51},
           {20002, 51},
           {20003, 51},
           {20006, 51},
           {20005, 51},
           {20004, 51}]};
get({52, 2}) ->
    #{attr =>
          #attr{hp_max = 5577, mp_max = 985, atk_speed = 152,
                phy_dmg = 1465, magic_dmg = 2185, phy_def = 1495,
                magic_def = 1300, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 68, anti_control = 68},
      skills =>
          [{20001, 52},
           {20002, 52},
           {20003, 52},
           {20006, 52},
           {20005, 52},
           {20004, 52}]};
get({53, 2}) ->
    #{attr =>
          #attr{hp_max = 5689, mp_max = 1019, atk_speed = 158,
                phy_dmg = 1510, magic_dmg = 2223, phy_def = 1525,
                magic_def = 1332, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 73, anti_control = 73},
      skills =>
          [{20001, 53},
           {20002, 53},
           {20003, 53},
           {20006, 53},
           {20005, 53},
           {20004, 53}]};
get({54, 2}) ->
    #{attr =>
          #attr{hp_max = 5800, mp_max = 1052, atk_speed = 164,
                phy_dmg = 1554, magic_dmg = 2261, phy_def = 1556,
                magic_def = 1364, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 78, anti_control = 78},
      skills =>
          [{20001, 54},
           {20002, 54},
           {20003, 54},
           {20006, 54},
           {20005, 54},
           {20004, 54}]};
get({55, 2}) ->
    #{attr =>
          #attr{hp_max = 5967, mp_max = 1102, atk_speed = 173,
                phy_dmg = 1620, magic_dmg = 2318, phy_def = 1601,
                magic_def = 1412, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 85, anti_control = 85},
      skills =>
          [{20001, 55},
           {20002, 55},
           {20003, 55},
           {20006, 55},
           {20005, 55},
           {20004, 55},
           {20007, 55}]};
get({56, 2}) ->
    #{attr =>
          #attr{hp_max = 6115, mp_max = 1112, atk_speed = 173,
                phy_dmg = 1649, magic_dmg = 2368, phy_def = 1637,
                magic_def = 1433, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 85, anti_control = 85},
      skills =>
          [{20001, 56},
           {20002, 56},
           {20003, 56},
           {20006, 56},
           {20005, 56},
           {20004, 56},
           {20007, 56}]};
get({57, 2}) ->
    #{attr =>
          #attr{hp_max = 6411, mp_max = 1132, atk_speed = 175,
                phy_dmg = 1707, magic_dmg = 2469, phy_def = 1710,
                magic_def = 1475, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 86, anti_control = 86},
      skills =>
          [{20001, 57},
           {20002, 57},
           {20003, 57},
           {20006, 57},
           {20005, 57},
           {20004, 57},
           {20007, 57}]};
get({58, 2}) ->
    #{attr =>
          #attr{hp_max = 6708, mp_max = 1152, atk_speed = 177,
                phy_dmg = 1765, magic_dmg = 2569, phy_def = 1782,
                magic_def = 1517, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 87, anti_control = 87},
      skills =>
          [{20001, 58},
           {20002, 58},
           {20003, 58},
           {20006, 58},
           {20005, 58},
           {20004, 58},
           {20007, 58}]};
get({59, 2}) ->
    #{attr =>
          #attr{hp_max = 7004, mp_max = 1172, atk_speed = 179,
                phy_dmg = 1823, magic_dmg = 2670, phy_def = 1854,
                magic_def = 1558, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 87, anti_control = 87},
      skills =>
          [{20001, 59},
           {20002, 59},
           {20003, 59},
           {20006, 59},
           {20005, 59},
           {20004, 59},
           {20007, 59}]};
get({60, 2}) ->
    #{attr =>
          #attr{hp_max = 7449, mp_max = 1202, atk_speed = 182,
                phy_dmg = 1910, magic_dmg = 2821, phy_def = 1963,
                magic_def = 1621, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 89, anti_control = 89},
      skills =>
          [{20001, 60},
           {20002, 60},
           {20003, 60},
           {20006, 60},
           {20005, 60},
           {20004, 60},
           {20007, 60}]};
get({61, 2}) ->
    #{attr =>
          #attr{hp_max = 7555, mp_max = 1217, atk_speed = 185,
                phy_dmg = 1928, magic_dmg = 2846, phy_def = 1988,
                magic_def = 1639, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 91, anti_control = 91},
      skills =>
          [{20001, 61},
           {20002, 61},
           {20003, 61},
           {20006, 61},
           {20005, 61},
           {20004, 61},
           {20007, 61}]};
get({62, 2}) ->
    #{attr =>
          #attr{hp_max = 7770, mp_max = 1247, atk_speed = 192,
                phy_dmg = 1965, magic_dmg = 2897, phy_def = 2039,
                magic_def = 1676, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 95, anti_control = 95},
      skills =>
          [{20001, 62},
           {20002, 62},
           {20003, 62},
           {20006, 62},
           {20005, 62},
           {20004, 62},
           {20007, 62}]};
get({63, 2}) ->
    #{attr =>
          #attr{hp_max = 7984, mp_max = 1277, atk_speed = 199,
                phy_dmg = 2003, magic_dmg = 2947, phy_def = 2090,
                magic_def = 1713, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 100,
                anti_control = 100},
      skills =>
          [{20001, 63},
           {20002, 63},
           {20003, 63},
           {20006, 63},
           {20005, 63},
           {20004, 63},
           {20007, 63}]};
get({64, 2}) ->
    #{attr =>
          #attr{hp_max = 8198, mp_max = 1307, atk_speed = 206,
                phy_dmg = 2040, magic_dmg = 2998, phy_def = 2140,
                magic_def = 1750, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 105,
                anti_control = 105},
      skills =>
          [{20001, 64},
           {20002, 64},
           {20003, 64},
           {20006, 64},
           {20005, 64},
           {20004, 64},
           {20007, 64}]};
get({65, 2}) ->
    #{attr =>
          #attr{hp_max = 8520, mp_max = 1353, atk_speed = 217,
                phy_dmg = 2096, magic_dmg = 3075, phy_def = 2217,
                magic_def = 1806, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 112,
                anti_control = 112},
      skills =>
          [{20001, 65},
           {20002, 65},
           {20003, 65},
           {20006, 65},
           {20005, 65},
           {20004, 65},
           {20007, 65}]};
get({66, 2}) ->
    #{attr =>
          #attr{hp_max = 8618, mp_max = 1363, atk_speed = 220,
                phy_dmg = 2128, magic_dmg = 3118, phy_def = 2241,
                magic_def = 1823, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 112,
                anti_control = 112},
      skills =>
          [{20001, 66},
           {20002, 66},
           {20003, 66},
           {20006, 66},
           {20005, 66},
           {20004, 66},
           {20007, 66}]};
get({67, 2}) ->
    #{attr =>
          #attr{hp_max = 8815, mp_max = 1384, atk_speed = 228,
                phy_dmg = 2190, magic_dmg = 3207, phy_def = 2289,
                magic_def = 1857, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 113,
                anti_control = 113},
      skills =>
          [{20001, 67},
           {20002, 67},
           {20003, 67},
           {20006, 67},
           {20005, 67},
           {20004, 67},
           {20007, 67}]};
get({68, 2}) ->
    #{attr =>
          #attr{hp_max = 9012, mp_max = 1405, atk_speed = 236,
                phy_dmg = 2254, magic_dmg = 3296, phy_def = 2338,
                magic_def = 1891, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 114,
                anti_control = 114},
      skills =>
          [{20001, 68},
           {20002, 68},
           {20003, 68},
           {20006, 68},
           {20005, 68},
           {20004, 68},
           {20007, 68}]};
get({69, 2}) ->
    #{attr =>
          #attr{hp_max = 9210, mp_max = 1425, atk_speed = 243,
                phy_dmg = 2318, magic_dmg = 3384, phy_def = 2387,
                magic_def = 1924, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 114,
                anti_control = 114},
      skills =>
          [{20001, 69},
           {20002, 69},
           {20003, 69},
           {20006, 69},
           {20005, 69},
           {20004, 69},
           {20007, 69}]};
get({70, 2}) ->
    #{attr =>
          #attr{hp_max = 9506, mp_max = 1457, atk_speed = 255,
                phy_dmg = 2413, magic_dmg = 3517, phy_def = 2460,
                magic_def = 1976, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 116,
                anti_control = 116},
      skills =>
          [{20001, 70},
           {20002, 70},
           {20003, 70},
           {20006, 70},
           {20005, 70},
           {20004, 70},
           {20007, 70}]};
get({71, 2}) ->
    #{attr =>
          #attr{hp_max = 9646, mp_max = 1478, atk_speed = 258,
                phy_dmg = 2448, magic_dmg = 3569, phy_def = 2496,
                magic_def = 2005, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 117,
                anti_control = 117},
      skills =>
          [{20001, 71},
           {20002, 71},
           {20003, 71},
           {20006, 71},
           {20005, 71},
           {20004, 71},
           {20007, 71}]};
get({72, 2}) ->
    #{attr =>
          #attr{hp_max = 9787, mp_max = 1500, atk_speed = 262,
                phy_dmg = 2484, magic_dmg = 3621, phy_def = 2532,
                magic_def = 2034, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 119,
                anti_control = 119},
      skills =>
          [{20001, 72},
           {20002, 72},
           {20003, 72},
           {20006, 72},
           {20005, 72},
           {20004, 72},
           {20007, 72}]};
get({73, 2}) ->
    #{attr =>
          #attr{hp_max = 9928, mp_max = 1521, atk_speed = 266,
                phy_dmg = 2520, magic_dmg = 3673, phy_def = 2569,
                magic_def = 2063, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 121,
                anti_control = 121},
      skills =>
          [{20001, 73},
           {20002, 73},
           {20003, 73},
           {20006, 73},
           {20005, 73},
           {20004, 73},
           {20007, 73}]};
get({74, 2}) ->
    #{attr =>
          #attr{hp_max = 10069, mp_max = 1543, atk_speed = 270,
                phy_dmg = 2555, magic_dmg = 3725, phy_def = 2605,
                magic_def = 2093, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 122,
                anti_control = 122},
      skills =>
          [{20001, 74},
           {20002, 74},
           {20003, 74},
           {20006, 74},
           {20005, 74},
           {20004, 74},
           {20007, 74}]};
get({75, 2}) ->
    #{attr =>
          #attr{hp_max = 10210, mp_max = 1564, atk_speed = 273,
                phy_dmg = 2591, magic_dmg = 3777, phy_def = 2642,
                magic_def = 2122, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 124,
                anti_control = 124},
      skills =>
          [{20001, 75},
           {20002, 75},
           {20003, 75},
           {20006, 75},
           {20005, 75},
           {20004, 75},
           {20007, 75}]};
get({76, 2}) ->
    #{attr =>
          #attr{hp_max = 10350, mp_max = 1586, atk_speed = 277,
                phy_dmg = 2627, magic_dmg = 3829, phy_def = 2678,
                magic_def = 2151, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 126,
                anti_control = 126},
      skills =>
          [{20001, 76},
           {20002, 76},
           {20003, 76},
           {20006, 76},
           {20005, 76},
           {20004, 76},
           {20007, 76}]};
get({77, 2}) ->
    #{attr =>
          #attr{hp_max = 10491, mp_max = 1608, atk_speed = 281,
                phy_dmg = 2663, magic_dmg = 3881, phy_def = 2715,
                magic_def = 2180, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 128,
                anti_control = 128},
      skills =>
          [{20001, 77},
           {20002, 77},
           {20003, 77},
           {20006, 77},
           {20005, 77},
           {20004, 77},
           {20007, 77}]};
get({78, 2}) ->
    #{attr =>
          #attr{hp_max = 10632, mp_max = 1629, atk_speed = 285,
                phy_dmg = 2698, magic_dmg = 3933, phy_def = 2751,
                magic_def = 2210, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 129,
                anti_control = 129},
      skills =>
          [{20001, 78},
           {20002, 78},
           {20003, 78},
           {20006, 78},
           {20005, 78},
           {20004, 78},
           {20007, 78}]};
get({79, 2}) ->
    #{attr =>
          #attr{hp_max = 10773, mp_max = 1651, atk_speed = 289,
                phy_dmg = 2734, magic_dmg = 3985, phy_def = 2788,
                magic_def = 2239, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 131,
                anti_control = 131},
      skills =>
          [{20001, 79},
           {20002, 79},
           {20003, 79},
           {20006, 79},
           {20005, 79},
           {20004, 79},
           {20007, 79}]};
get({80, 2}) ->
    #{attr =>
          #attr{hp_max = 10914, mp_max = 1672, atk_speed = 292,
                phy_dmg = 2770, magic_dmg = 4038, phy_def = 2824,
                magic_def = 2268, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 133,
                anti_control = 133},
      skills =>
          [{20001, 80},
           {20002, 80},
           {20003, 80},
           {20006, 80},
           {20005, 80},
           {20004, 80},
           {20007, 80}]};
get({81, 2}) ->
    #{attr =>
          #attr{hp_max = 11055, mp_max = 1694, atk_speed = 296,
                phy_dmg = 2806, magic_dmg = 4090, phy_def = 2860,
                magic_def = 2298, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 134,
                anti_control = 134},
      skills =>
          [{20001, 80},
           {20002, 80},
           {20003, 80},
           {20006, 80},
           {20005, 80},
           {20004, 80},
           {20007, 80}]};
get({82, 2}) ->
    #{attr =>
          #attr{hp_max = 11195, mp_max = 1716, atk_speed = 300,
                phy_dmg = 2841, magic_dmg = 4142, phy_def = 2897,
                magic_def = 2327, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 136,
                anti_control = 136},
      skills =>
          [{20001, 80},
           {20002, 80},
           {20003, 80},
           {20006, 80},
           {20005, 80},
           {20004, 80},
           {20007, 80}]};
get({83, 2}) ->
    #{attr =>
          #attr{hp_max = 11336, mp_max = 1737, atk_speed = 304,
                phy_dmg = 2877, magic_dmg = 4194, phy_def = 2933,
                magic_def = 2356, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 138,
                anti_control = 138},
      skills =>
          [{20001, 80},
           {20002, 80},
           {20003, 80},
           {20006, 80},
           {20005, 80},
           {20004, 80},
           {20007, 80}]};
get({84, 2}) ->
    #{attr =>
          #attr{hp_max = 11477, mp_max = 1759, atk_speed = 307,
                phy_dmg = 2913, magic_dmg = 4246, phy_def = 2970,
                magic_def = 2385, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 140,
                anti_control = 140},
      skills =>
          [{20001, 80},
           {20002, 80},
           {20003, 80},
           {20006, 80},
           {20005, 80},
           {20004, 80},
           {20007, 80}]};
get({85, 2}) ->
    #{attr =>
          #attr{hp_max = 11618, mp_max = 1780, atk_speed = 311,
                phy_dmg = 2949, magic_dmg = 4298, phy_def = 3006,
                magic_def = 2415, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 141,
                anti_control = 141},
      skills =>
          [{20001, 80},
           {20002, 80},
           {20003, 80},
           {20006, 80},
           {20005, 80},
           {20004, 80},
           {20007, 80}]};
get({86, 2}) ->
    #{attr =>
          #attr{hp_max = 11759, mp_max = 1802, atk_speed = 315,
                phy_dmg = 2984, magic_dmg = 4350, phy_def = 3043,
                magic_def = 2444, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 143,
                anti_control = 143},
      skills =>
          [{20001, 80},
           {20002, 80},
           {20003, 80},
           {20006, 80},
           {20005, 80},
           {20004, 80},
           {20007, 80}]};
get({87, 2}) ->
    #{attr =>
          #attr{hp_max = 11900, mp_max = 1823, atk_speed = 319,
                phy_dmg = 3020, magic_dmg = 4402, phy_def = 3079,
                magic_def = 2473, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 145,
                anti_control = 145},
      skills =>
          [{20001, 80},
           {20002, 80},
           {20003, 80},
           {20006, 80},
           {20005, 80},
           {20004, 80},
           {20007, 80}]};
get({88, 2}) ->
    #{attr =>
          #attr{hp_max = 12040, mp_max = 1845, atk_speed = 323,
                phy_dmg = 3056, magic_dmg = 4454, phy_def = 3116,
                magic_def = 2502, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 146,
                anti_control = 146},
      skills =>
          [{20001, 80},
           {20002, 80},
           {20003, 80},
           {20006, 80},
           {20005, 80},
           {20004, 80},
           {20007, 80}]};
get({89, 2}) ->
    #{attr =>
          #attr{hp_max = 12181, mp_max = 1867, atk_speed = 326,
                phy_dmg = 3092, magic_dmg = 4506, phy_def = 3152,
                magic_def = 2532, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 148,
                anti_control = 148},
      skills =>
          [{20001, 80},
           {20002, 80},
           {20003, 80},
           {20006, 80},
           {20005, 80},
           {20004, 80},
           {20007, 80}]};
get({90, 2}) ->
    #{attr =>
          #attr{hp_max = 12322, mp_max = 1888, atk_speed = 330,
                phy_dmg = 3127, magic_dmg = 4559, phy_def = 3188,
                magic_def = 2561, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 150,
                anti_control = 150},
      skills =>
          [{20001, 80},
           {20002, 80},
           {20003, 80},
           {20006, 80},
           {20005, 80},
           {20004, 80},
           {20007, 80}]};
get({91, 2}) ->
    #{attr =>
          #attr{hp_max = 12428, mp_max = 1904, atk_speed = 333,
                phy_dmg = 3154, magic_dmg = 4598, phy_def = 3216,
                magic_def = 2583, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 151,
                anti_control = 151},
      skills =>
          [{20001, 80},
           {20002, 80},
           {20003, 80},
           {20006, 80},
           {20005, 80},
           {20004, 80},
           {20007, 80}]};
get({92, 2}) ->
    #{attr =>
          #attr{hp_max = 12533, mp_max = 1921, atk_speed = 336,
                phy_dmg = 3181, magic_dmg = 4637, phy_def = 3243,
                magic_def = 2605, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 152,
                anti_control = 152},
      skills =>
          [{20001, 80},
           {20002, 80},
           {20003, 80},
           {20006, 80},
           {20005, 80},
           {20004, 80},
           {20007, 80}]};
get({93, 2}) ->
    #{attr =>
          #attr{hp_max = 12639, mp_max = 1937, atk_speed = 339,
                phy_dmg = 3208, magic_dmg = 4676, phy_def = 3270,
                magic_def = 2627, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 154,
                anti_control = 154},
      skills =>
          [{20001, 80},
           {20002, 80},
           {20003, 80},
           {20006, 80},
           {20005, 80},
           {20004, 80},
           {20007, 80}]};
get({94, 2}) ->
    #{attr =>
          #attr{hp_max = 12745, mp_max = 1953, atk_speed = 341,
                phy_dmg = 3235, magic_dmg = 4715, phy_def = 3298,
                magic_def = 2649, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 155,
                anti_control = 155},
      skills =>
          [{20001, 80},
           {20002, 80},
           {20003, 80},
           {20006, 80},
           {20005, 80},
           {20004, 80},
           {20007, 80}]};
get({95, 2}) ->
    #{attr =>
          #attr{hp_max = 12850, mp_max = 1969, atk_speed = 344,
                phy_dmg = 3262, magic_dmg = 4754, phy_def = 3325,
                magic_def = 2671, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 156,
                anti_control = 156},
      skills =>
          [{20001, 80},
           {20002, 80},
           {20003, 80},
           {20006, 80},
           {20005, 80},
           {20004, 80},
           {20007, 80}]};
get({96, 2}) ->
    #{attr =>
          #attr{hp_max = 12956, mp_max = 1985, atk_speed = 347,
                phy_dmg = 3288, magic_dmg = 4793, phy_def = 3352,
                magic_def = 2693, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 158,
                anti_control = 158},
      skills =>
          [{20001, 80},
           {20002, 80},
           {20003, 80},
           {20006, 80},
           {20005, 80},
           {20004, 80},
           {20007, 80}]};
get({97, 2}) ->
    #{attr =>
          #attr{hp_max = 13061, mp_max = 2002, atk_speed = 350,
                phy_dmg = 3315, magic_dmg = 4832, phy_def = 3380,
                magic_def = 2715, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 159,
                anti_control = 159},
      skills =>
          [{20001, 80},
           {20002, 80},
           {20003, 80},
           {20006, 80},
           {20005, 80},
           {20004, 80},
           {20007, 80}]};
get({98, 2}) ->
    #{attr =>
          #attr{hp_max = 13167, mp_max = 2018, atk_speed = 353,
                phy_dmg = 3342, magic_dmg = 4871, phy_def = 3407,
                magic_def = 2737, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 160,
                anti_control = 160},
      skills =>
          [{20001, 80},
           {20002, 80},
           {20003, 80},
           {20006, 80},
           {20005, 80},
           {20004, 80},
           {20007, 80}]};
get({99, 2}) ->
    #{attr =>
          #attr{hp_max = 13273, mp_max = 2034, atk_speed = 356,
                phy_dmg = 3369, magic_dmg = 4910, phy_def = 3434,
                magic_def = 2759, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 161,
                anti_control = 161},
      skills =>
          [{20001, 80},
           {20002, 80},
           {20003, 80},
           {20006, 80},
           {20005, 80},
           {20004, 80},
           {20007, 80}]};
get({100, 2}) ->
    #{attr =>
          #attr{hp_max = 13378, mp_max = 2050, atk_speed = 358,
                phy_dmg = 3396, magic_dmg = 4949, phy_def = 3462,
                magic_def = 2781, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 163,
                anti_control = 163},
      skills =>
          [{20001, 80},
           {20002, 80},
           {20003, 80},
           {20006, 80},
           {20005, 80},
           {20004, 80},
           {20007, 80}]};
get({101, 2}) ->
    #{attr =>
          #attr{hp_max = 13484, mp_max = 2066, atk_speed = 361,
                phy_dmg = 3422, magic_dmg = 4988, phy_def = 3489,
                magic_def = 2802, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 164,
                anti_control = 164},
      skills =>
          [{20001, 80},
           {20002, 80},
           {20003, 80},
           {20006, 80},
           {20005, 80},
           {20004, 80},
           {20007, 80}]};
get({102, 2}) ->
    #{attr =>
          #attr{hp_max = 13590, mp_max = 2082, atk_speed = 364,
                phy_dmg = 3449, magic_dmg = 5028, phy_def = 3516,
                magic_def = 2824, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 165,
                anti_control = 165},
      skills =>
          [{20001, 80},
           {20002, 80},
           {20003, 80},
           {20006, 80},
           {20005, 80},
           {20004, 80},
           {20007, 80}]};
get({103, 2}) ->
    #{attr =>
          #attr{hp_max = 13695, mp_max = 2099, atk_speed = 367,
                phy_dmg = 3476, magic_dmg = 5067, phy_def = 3544,
                magic_def = 2846, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 167,
                anti_control = 167},
      skills =>
          [{20001, 80},
           {20002, 80},
           {20003, 80},
           {20006, 80},
           {20005, 80},
           {20004, 80},
           {20007, 80}]};
get({104, 2}) ->
    #{attr =>
          #attr{hp_max = 13801, mp_max = 2115, atk_speed = 370,
                phy_dmg = 3503, magic_dmg = 5106, phy_def = 3571,
                magic_def = 2868, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 168,
                anti_control = 168},
      skills =>
          [{20001, 80},
           {20002, 80},
           {20003, 80},
           {20006, 80},
           {20005, 80},
           {20004, 80},
           {20007, 80}]};
get({105, 2}) ->
    #{attr =>
          #attr{hp_max = 13906, mp_max = 2131, atk_speed = 373,
                phy_dmg = 3530, magic_dmg = 5145, phy_def = 3598,
                magic_def = 2890, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 169,
                anti_control = 169},
      skills =>
          [{20001, 80},
           {20002, 80},
           {20003, 80},
           {20006, 80},
           {20005, 80},
           {20004, 80},
           {20007, 80}]};
get({106, 2}) ->
    #{attr =>
          #attr{hp_max = 14012, mp_max = 2147, atk_speed = 375,
                phy_dmg = 3556, magic_dmg = 5184, phy_def = 3626,
                magic_def = 2912, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 170,
                anti_control = 170},
      skills =>
          [{20001, 80},
           {20002, 80},
           {20003, 80},
           {20006, 80},
           {20005, 80},
           {20004, 80},
           {20007, 80}]};
get({107, 2}) ->
    #{attr =>
          #attr{hp_max = 14118, mp_max = 2163, atk_speed = 378,
                phy_dmg = 3583, magic_dmg = 5223, phy_def = 3653,
                magic_def = 2934, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 172,
                anti_control = 172},
      skills =>
          [{20001, 80},
           {20002, 80},
           {20003, 80},
           {20006, 80},
           {20005, 80},
           {20004, 80},
           {20007, 80}]};
get({108, 2}) ->
    #{attr =>
          #attr{hp_max = 14223, mp_max = 2180, atk_speed = 381,
                phy_dmg = 3610, magic_dmg = 5262, phy_def = 3680,
                magic_def = 2956, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 173,
                anti_control = 173},
      skills =>
          [{20001, 80},
           {20002, 80},
           {20003, 80},
           {20006, 80},
           {20005, 80},
           {20004, 80},
           {20007, 80}]};
get({109, 2}) ->
    #{attr =>
          #attr{hp_max = 14329, mp_max = 2196, atk_speed = 384,
                phy_dmg = 3637, magic_dmg = 5301, phy_def = 3708,
                magic_def = 2978, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 174,
                anti_control = 174},
      skills =>
          [{20001, 80},
           {20002, 80},
           {20003, 80},
           {20006, 80},
           {20005, 80},
           {20004, 80},
           {20007, 80}]};
get({110, 2}) ->
    #{attr =>
          #attr{hp_max = 14435, mp_max = 2212, atk_speed = 387,
                phy_dmg = 3664, magic_dmg = 5340, phy_def = 3735,
                magic_def = 3000, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{20001, 80},
           {20002, 80},
           {20003, 80},
           {20006, 80},
           {20005, 80},
           {20004, 80},
           {20007, 80}]};
get({111, 2}) ->
    #{attr =>
          #attr{hp_max = 14435, mp_max = 2212, atk_speed = 387,
                phy_dmg = 3664, magic_dmg = 5340, phy_def = 3735,
                magic_def = 3000, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{20001, 80},
           {20002, 80},
           {20003, 80},
           {20006, 80},
           {20005, 80},
           {20004, 80},
           {20007, 80}]};
get({112, 2}) ->
    #{attr =>
          #attr{hp_max = 14435, mp_max = 2212, atk_speed = 387,
                phy_dmg = 3664, magic_dmg = 5340, phy_def = 3735,
                magic_def = 3000, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{20001, 80},
           {20002, 80},
           {20003, 80},
           {20006, 80},
           {20005, 80},
           {20004, 80},
           {20007, 80}]};
get({113, 2}) ->
    #{attr =>
          #attr{hp_max = 14435, mp_max = 2212, atk_speed = 387,
                phy_dmg = 3664, magic_dmg = 5340, phy_def = 3735,
                magic_def = 3000, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{20001, 80},
           {20002, 80},
           {20003, 80},
           {20006, 80},
           {20005, 80},
           {20004, 80},
           {20007, 80}]};
get({114, 2}) ->
    #{attr =>
          #attr{hp_max = 14435, mp_max = 2212, atk_speed = 387,
                phy_dmg = 3664, magic_dmg = 5340, phy_def = 3735,
                magic_def = 3000, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{20001, 80},
           {20002, 80},
           {20003, 80},
           {20006, 80},
           {20005, 80},
           {20004, 80},
           {20007, 80}]};
get({115, 2}) ->
    #{attr =>
          #attr{hp_max = 14435, mp_max = 2212, atk_speed = 387,
                phy_dmg = 3664, magic_dmg = 5340, phy_def = 3735,
                magic_def = 3000, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{20001, 80},
           {20002, 80},
           {20003, 80},
           {20006, 80},
           {20005, 80},
           {20004, 80},
           {20007, 80}]};
get({116, 2}) ->
    #{attr =>
          #attr{hp_max = 14435, mp_max = 2212, atk_speed = 387,
                phy_dmg = 3664, magic_dmg = 5340, phy_def = 3735,
                magic_def = 3000, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{20001, 80},
           {20002, 80},
           {20003, 80},
           {20006, 80},
           {20005, 80},
           {20004, 80},
           {20007, 80}]};
get({117, 2}) ->
    #{attr =>
          #attr{hp_max = 14435, mp_max = 2212, atk_speed = 387,
                phy_dmg = 3664, magic_dmg = 5340, phy_def = 3735,
                magic_def = 3000, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{20001, 80},
           {20002, 80},
           {20003, 80},
           {20006, 80},
           {20005, 80},
           {20004, 80},
           {20007, 80}]};
get({118, 2}) ->
    #{attr =>
          #attr{hp_max = 14435, mp_max = 2212, atk_speed = 387,
                phy_dmg = 3664, magic_dmg = 5340, phy_def = 3735,
                magic_def = 3000, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{20001, 80},
           {20002, 80},
           {20003, 80},
           {20006, 80},
           {20005, 80},
           {20004, 80},
           {20007, 80}]};
get({119, 2}) ->
    #{attr =>
          #attr{hp_max = 14435, mp_max = 2212, atk_speed = 387,
                phy_dmg = 3664, magic_dmg = 5340, phy_def = 3735,
                magic_def = 3000, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{20001, 80},
           {20002, 80},
           {20003, 80},
           {20006, 80},
           {20005, 80},
           {20004, 80},
           {20007, 80}]};
get({120, 2}) ->
    #{attr =>
          #attr{hp_max = 14435, mp_max = 2212, atk_speed = 387,
                phy_dmg = 3664, magic_dmg = 5340, phy_def = 3735,
                magic_def = 3000, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{20001, 80},
           {20002, 80},
           {20003, 80},
           {20006, 80},
           {20005, 80},
           {20004, 80},
           {20007, 80}]};
get({121, 2}) ->
    #{attr =>
          #attr{hp_max = 14435, mp_max = 2212, atk_speed = 387,
                phy_dmg = 3664, magic_dmg = 5340, phy_def = 3735,
                magic_def = 3000, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{20001, 80},
           {20002, 80},
           {20003, 80},
           {20006, 80},
           {20005, 80},
           {20004, 80},
           {20007, 80}]};
get({122, 2}) ->
    #{attr =>
          #attr{hp_max = 14435, mp_max = 2212, atk_speed = 387,
                phy_dmg = 3664, magic_dmg = 5340, phy_def = 3735,
                magic_def = 3000, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{20001, 80},
           {20002, 80},
           {20003, 80},
           {20006, 80},
           {20005, 80},
           {20004, 80},
           {20007, 80}]};
get({123, 2}) ->
    #{attr =>
          #attr{hp_max = 14435, mp_max = 2212, atk_speed = 387,
                phy_dmg = 3664, magic_dmg = 5340, phy_def = 3735,
                magic_def = 3000, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{20001, 80},
           {20002, 80},
           {20003, 80},
           {20006, 80},
           {20005, 80},
           {20004, 80},
           {20007, 80}]};
get({124, 2}) ->
    #{attr =>
          #attr{hp_max = 14435, mp_max = 2212, atk_speed = 387,
                phy_dmg = 3664, magic_dmg = 5340, phy_def = 3735,
                magic_def = 3000, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{20001, 80},
           {20002, 80},
           {20003, 80},
           {20006, 80},
           {20005, 80},
           {20004, 80},
           {20007, 80}]};
get({125, 2}) ->
    #{attr =>
          #attr{hp_max = 14435, mp_max = 2212, atk_speed = 387,
                phy_dmg = 3664, magic_dmg = 5340, phy_def = 3735,
                magic_def = 3000, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{20001, 80},
           {20002, 80},
           {20003, 80},
           {20006, 80},
           {20005, 80},
           {20004, 80},
           {20007, 80}]};
get({126, 2}) ->
    #{attr =>
          #attr{hp_max = 14435, mp_max = 2212, atk_speed = 387,
                phy_dmg = 3664, magic_dmg = 5340, phy_def = 3735,
                magic_def = 3000, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{20001, 80},
           {20002, 80},
           {20003, 80},
           {20006, 80},
           {20005, 80},
           {20004, 80},
           {20007, 80}]};
get({127, 2}) ->
    #{attr =>
          #attr{hp_max = 14435, mp_max = 2212, atk_speed = 387,
                phy_dmg = 3664, magic_dmg = 5340, phy_def = 3735,
                magic_def = 3000, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{20001, 80},
           {20002, 80},
           {20003, 80},
           {20006, 80},
           {20005, 80},
           {20004, 80},
           {20007, 80}]};
get({128, 2}) ->
    #{attr =>
          #attr{hp_max = 14435, mp_max = 2212, atk_speed = 387,
                phy_dmg = 3664, magic_dmg = 5340, phy_def = 3735,
                magic_def = 3000, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{20001, 80},
           {20002, 80},
           {20003, 80},
           {20006, 80},
           {20005, 80},
           {20004, 80},
           {20007, 80}]};
get({129, 2}) ->
    #{attr =>
          #attr{hp_max = 14435, mp_max = 2212, atk_speed = 387,
                phy_dmg = 3664, magic_dmg = 5340, phy_def = 3735,
                magic_def = 3000, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{20001, 80},
           {20002, 80},
           {20003, 80},
           {20006, 80},
           {20005, 80},
           {20004, 80},
           {20007, 80}]};
get({130, 2}) ->
    #{attr =>
          #attr{hp_max = 14435, mp_max = 2212, atk_speed = 387,
                phy_dmg = 3664, magic_dmg = 5340, phy_def = 3735,
                magic_def = 3000, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{20001, 80},
           {20002, 80},
           {20003, 80},
           {20006, 80},
           {20005, 80},
           {20004, 80},
           {20007, 80}]};
get({20, 3}) ->
    #{attr =>
          #attr{hp_max = 1344, mp_max = 390, atk_speed = 70,
                phy_dmg = 719, magic_dmg = 355, phy_def = 269,
                magic_def = 242, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 26, anti_control = 26},
      skills => [{30001, 20}, {30002, 20}, {30003, 20}]};
get({21, 3}) ->
    #{attr =>
          #attr{hp_max = 1365, mp_max = 390, atk_speed = 71,
                phy_dmg = 726, magic_dmg = 356, phy_def = 275,
                magic_def = 246, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 26, anti_control = 26},
      skills => [{30001, 21}, {30002, 21}, {30003, 21}]};
get({22, 3}) ->
    #{attr =>
          #attr{hp_max = 1409, mp_max = 390, atk_speed = 73,
                phy_dmg = 743, magic_dmg = 360, phy_def = 287,
                magic_def = 253, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 26, anti_control = 26},
      skills => [{30001, 22}, {30002, 22}, {30003, 22}]};
get({23, 3}) ->
    #{attr =>
          #attr{hp_max = 1452, mp_max = 390, atk_speed = 76,
                phy_dmg = 760, magic_dmg = 362, phy_def = 300,
                magic_def = 262, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 26, anti_control = 26},
      skills => [{30001, 23}, {30002, 23}, {30003, 23}]};
get({24, 3}) ->
    #{attr =>
          #attr{hp_max = 1496, mp_max = 390, atk_speed = 79,
                phy_dmg = 776, magic_dmg = 365, phy_def = 312,
                magic_def = 269, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 26, anti_control = 26},
      skills => [{30001, 24}, {30002, 24}, {30003, 24}]};
get({25, 3}) ->
    #{attr =>
          #attr{hp_max = 1561, mp_max = 390, atk_speed = 83,
                phy_dmg = 801, magic_dmg = 371, phy_def = 331,
                magic_def = 282, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 26, anti_control = 26},
      skills =>
          [{30001, 25}, {30002, 25}, {30003, 25}, {30004, 25}]};
get({26, 3}) ->
    #{attr =>
          #attr{hp_max = 1608, mp_max = 397, atk_speed = 85,
                phy_dmg = 834, magic_dmg = 390, phy_def = 342,
                magic_def = 290, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 27, anti_control = 27},
      skills =>
          [{30001, 26}, {30002, 26}, {30003, 26}, {30004, 26}]};
get({27, 3}) ->
    #{attr =>
          #attr{hp_max = 1701, mp_max = 413, atk_speed = 89,
                phy_dmg = 898, magic_dmg = 429, phy_def = 364,
                magic_def = 307, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 30, anti_control = 30},
      skills =>
          [{30001, 27}, {30002, 27}, {30003, 27}, {30004, 27}]};
get({28, 3}) ->
    #{attr =>
          #attr{hp_max = 1795, mp_max = 429, atk_speed = 94,
                phy_dmg = 964, magic_dmg = 468, phy_def = 387,
                magic_def = 325, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 33, anti_control = 33},
      skills =>
          [{30001, 28}, {30002, 28}, {30003, 28}, {30004, 28}]};
get({29, 3}) ->
    #{attr =>
          #attr{hp_max = 1888, mp_max = 444, atk_speed = 99,
                phy_dmg = 1028, magic_dmg = 507, phy_def = 409,
                magic_def = 342, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 36, anti_control = 36},
      skills =>
          [{30001, 29}, {30002, 29}, {30003, 29}, {30004, 29}]};
get({30, 3}) ->
    #{attr =>
          #attr{hp_max = 2029, mp_max = 468, atk_speed = 106,
                phy_dmg = 1126, magic_dmg = 566, phy_def = 443,
                magic_def = 369, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 41, anti_control = 41},
      skills =>
          [{30001, 30}, {30002, 30}, {30003, 30}, {30004, 30}]};
get({31, 3}) ->
    #{attr =>
          #attr{hp_max = 2050, mp_max = 468, atk_speed = 107,
                phy_dmg = 1136, magic_dmg = 569, phy_def = 448,
                magic_def = 378, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 41, anti_control = 41},
      skills =>
          [{30001, 31}, {30002, 31}, {30003, 31}, {30004, 31}]};
get({32, 3}) ->
    #{attr =>
          #attr{hp_max = 2094, mp_max = 468, atk_speed = 109,
                phy_dmg = 1155, magic_dmg = 574, phy_def = 458,
                magic_def = 395, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 41, anti_control = 41},
      skills =>
          [{30001, 32}, {30002, 32}, {30003, 32}, {30004, 32}]};
get({33, 3}) ->
    #{attr =>
          #attr{hp_max = 2137, mp_max = 468, atk_speed = 112,
                phy_dmg = 1175, magic_dmg = 581, phy_def = 470,
                magic_def = 413, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 41, anti_control = 41},
      skills =>
          [{30001, 33}, {30002, 33}, {30003, 33}, {30004, 33}]};
get({34, 3}) ->
    #{attr =>
          #attr{hp_max = 2181, mp_max = 468, atk_speed = 115,
                phy_dmg = 1194, magic_dmg = 587, phy_def = 480,
                magic_def = 430, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 41, anti_control = 41},
      skills =>
          [{30001, 34}, {30002, 34}, {30003, 34}, {30004, 34}]};
get({35, 3}) ->
    #{attr =>
          #attr{hp_max = 2246, mp_max = 468, atk_speed = 119,
                phy_dmg = 1223, magic_dmg = 596, phy_def = 496,
                magic_def = 456, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 41, anti_control = 41},
      skills =>
          [{30001, 35},
           {30002, 35},
           {30003, 35},
           {30004, 35},
           {30005, 35}]};
get({36, 3}) ->
    #{attr =>
          #attr{hp_max = 2376, mp_max = 468, atk_speed = 122,
                phy_dmg = 1270, magic_dmg = 616, phy_def = 516,
                magic_def = 472, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 41, anti_control = 41},
      skills =>
          [{30001, 36},
           {30002, 36},
           {30003, 36},
           {30004, 36},
           {30005, 36}]};
get({37, 3}) ->
    #{attr =>
          #attr{hp_max = 2635, mp_max = 468, atk_speed = 130,
                phy_dmg = 1363, magic_dmg = 658, phy_def = 556,
                magic_def = 504, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 41, anti_control = 41},
      skills =>
          [{30001, 37},
           {30002, 37},
           {30003, 37},
           {30004, 37},
           {30005, 37}]};
get({38, 3}) ->
    #{attr =>
          #attr{hp_max = 2895, mp_max = 468, atk_speed = 137,
                phy_dmg = 1457, magic_dmg = 700, phy_def = 596,
                magic_def = 536, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 41, anti_control = 41},
      skills =>
          [{30001, 38},
           {30002, 38},
           {30003, 38},
           {30004, 38},
           {30005, 38}]};
get({39, 3}) ->
    #{attr =>
          #attr{hp_max = 3155, mp_max = 468, atk_speed = 144,
                phy_dmg = 1550, magic_dmg = 741, phy_def = 636,
                magic_def = 569, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 41, anti_control = 41},
      skills =>
          [{30001, 39},
           {30002, 39},
           {30003, 39},
           {30004, 39},
           {30005, 39}]};
get({40, 3}) ->
    #{attr =>
          #attr{hp_max = 3545, mp_max = 468, atk_speed = 156,
                phy_dmg = 1691, magic_dmg = 804, phy_def = 697,
                magic_def = 617, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 41, anti_control = 41},
      skills =>
          [{30001, 40},
           {30002, 40},
           {30003, 40},
           {30004, 40},
           {30005, 40}]};
get({41, 3}) ->
    #{attr =>
          #attr{hp_max = 3625, mp_max = 492, atk_speed = 160,
                phy_dmg = 1714, magic_dmg = 810, phy_def = 712,
                magic_def = 633, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 42, anti_control = 42},
      skills =>
          [{30001, 41},
           {30002, 41},
           {30003, 41},
           {30004, 41},
           {30005, 41}]};
get({42, 3}) ->
    #{attr =>
          #attr{hp_max = 3786, mp_max = 541, atk_speed = 169,
                phy_dmg = 1764, magic_dmg = 822, phy_def = 743,
                magic_def = 667, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 45, anti_control = 45},
      skills =>
          [{30001, 42},
           {30002, 42},
           {30003, 42},
           {30004, 42},
           {30005, 42}]};
get({43, 3}) ->
    #{attr =>
          #attr{hp_max = 3947, mp_max = 590, atk_speed = 179,
                phy_dmg = 1812, magic_dmg = 835, phy_def = 775,
                magic_def = 702, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 48, anti_control = 48},
      skills =>
          [{30001, 43},
           {30002, 43},
           {30003, 43},
           {30004, 43},
           {30005, 43}]};
get({44, 3}) ->
    #{attr =>
          #attr{hp_max = 4107, mp_max = 639, atk_speed = 188,
                phy_dmg = 1861, magic_dmg = 846, phy_def = 805,
                magic_def = 736, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 51, anti_control = 51},
      skills =>
          [{30001, 44},
           {30002, 44},
           {30003, 44},
           {30004, 44},
           {30005, 44}]};
get({45, 3}) ->
    #{attr =>
          #attr{hp_max = 4349, mp_max = 713, atk_speed = 202,
                phy_dmg = 1935, magic_dmg = 865, phy_def = 853,
                magic_def = 787, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 56, anti_control = 56},
      skills =>
          [{30001, 45},
           {30002, 45},
           {30003, 45},
           {30004, 45},
           {30005, 45},
           {30006, 45}]};
get({46, 3}) ->
    #{attr =>
          #attr{hp_max = 4419, mp_max = 720, atk_speed = 206,
                phy_dmg = 1976, magic_dmg = 893, phy_def = 871,
                magic_def = 802, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 56, anti_control = 56},
      skills =>
          [{30001, 46},
           {30002, 46},
           {30003, 46},
           {30004, 46},
           {30005, 46},
           {30006, 46}]};
get({47, 3}) ->
    #{attr =>
          #attr{hp_max = 4559, mp_max = 734, atk_speed = 214,
                phy_dmg = 2062, magic_dmg = 948, phy_def = 908,
                magic_def = 833, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 57, anti_control = 57},
      skills =>
          [{30001, 47},
           {30002, 47},
           {30003, 47},
           {30004, 47},
           {30005, 47},
           {30006, 47}]};
get({48, 3}) ->
    #{attr =>
          #attr{hp_max = 4700, mp_max = 749, atk_speed = 223,
                phy_dmg = 2147, magic_dmg = 1004, phy_def = 946,
                magic_def = 863, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 59, anti_control = 59},
      skills =>
          [{30001, 48},
           {30002, 48},
           {30003, 48},
           {30004, 48},
           {30005, 48},
           {30006, 48}]};
get({49, 3}) ->
    #{attr =>
          #attr{hp_max = 4840, mp_max = 764, atk_speed = 231,
                phy_dmg = 2231, magic_dmg = 1060, phy_def = 983,
                magic_def = 893, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 60, anti_control = 60},
      skills =>
          [{30001, 49},
           {30002, 49},
           {30003, 49},
           {30004, 49},
           {30005, 49},
           {30006, 49}]};
get({50, 3}) ->
    #{attr =>
          #attr{hp_max = 5051, mp_max = 786, atk_speed = 244,
                phy_dmg = 2359, magic_dmg = 1143, phy_def = 1039,
                magic_def = 939, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 62, anti_control = 62},
      skills =>
          [{30001, 50},
           {30002, 50},
           {30003, 50},
           {30004, 50},
           {30005, 50},
           {30006, 50}]};
get({51, 3}) ->
    #{attr =>
          #attr{hp_max = 5106, mp_max = 802, atk_speed = 249,
                phy_dmg = 2388, magic_dmg = 1155, phy_def = 1050,
                magic_def = 950, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 64, anti_control = 64},
      skills =>
          [{30001, 51},
           {30002, 51},
           {30003, 51},
           {30004, 51},
           {30005, 51},
           {30006, 51}]};
get({52, 3}) ->
    #{attr =>
          #attr{hp_max = 5217, mp_max = 835, atk_speed = 260,
                phy_dmg = 2445, magic_dmg = 1178, phy_def = 1074,
                magic_def = 975, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 68, anti_control = 68},
      skills =>
          [{30001, 52},
           {30002, 52},
           {30003, 52},
           {30004, 52},
           {30005, 52},
           {30006, 52}]};
get({53, 3}) ->
    #{attr =>
          #attr{hp_max = 5329, mp_max = 869, atk_speed = 271,
                phy_dmg = 2503, magic_dmg = 1200, phy_def = 1098,
                magic_def = 1000, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 73, anti_control = 73},
      skills =>
          [{30001, 53},
           {30002, 53},
           {30003, 53},
           {30004, 53},
           {30005, 53},
           {30006, 53}]};
get({54, 3}) ->
    #{attr =>
          #attr{hp_max = 5440, mp_max = 902, atk_speed = 281,
                phy_dmg = 2560, magic_dmg = 1223, phy_def = 1121,
                magic_def = 1024, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 78, anti_control = 78},
      skills =>
          [{30001, 54},
           {30002, 54},
           {30003, 54},
           {30004, 54},
           {30005, 54},
           {30006, 54}]};
get({55, 3}) ->
    #{attr =>
          #attr{hp_max = 5607, mp_max = 952, atk_speed = 298,
                phy_dmg = 2646, magic_dmg = 1258, phy_def = 1157,
                magic_def = 1061, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 85, anti_control = 85},
      skills =>
          [{30001, 55},
           {30002, 55},
           {30003, 55},
           {30004, 55},
           {30005, 55},
           {30006, 55},
           {30007, 55}]};
get({56, 3}) ->
    #{attr =>
          #attr{hp_max = 5719, mp_max = 957, atk_speed = 302,
                phy_dmg = 2700, magic_dmg = 1286, phy_def = 1186,
                magic_def = 1080, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 85, anti_control = 85},
      skills =>
          [{30001, 56},
           {30002, 56},
           {30003, 56},
           {30004, 56},
           {30005, 56},
           {30006, 56},
           {30007, 56}]};
get({57, 3}) ->
    #{attr =>
          #attr{hp_max = 5943, mp_max = 967, atk_speed = 310,
                phy_dmg = 2809, magic_dmg = 1342, phy_def = 1246,
                magic_def = 1118, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 86, anti_control = 86},
      skills =>
          [{30001, 57},
           {30002, 57},
           {30003, 57},
           {30004, 57},
           {30005, 57},
           {30006, 57},
           {30007, 57}]};
get({58, 3}) ->
    #{attr =>
          #attr{hp_max = 6168, mp_max = 977, atk_speed = 318,
                phy_dmg = 2918, magic_dmg = 1398, phy_def = 1307,
                magic_def = 1157, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 87, anti_control = 87},
      skills =>
          [{30001, 58},
           {30002, 58},
           {30003, 58},
           {30004, 58},
           {30005, 58},
           {30006, 58},
           {30007, 58}]};
get({59, 3}) ->
    #{attr =>
          #attr{hp_max = 6392, mp_max = 987, atk_speed = 326,
                phy_dmg = 3027, magic_dmg = 1453, phy_def = 1367,
                magic_def = 1195, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 87, anti_control = 87},
      skills =>
          [{30001, 59},
           {30002, 59},
           {30003, 59},
           {30004, 59},
           {30005, 59},
           {30006, 59},
           {30007, 59}]};
get({60, 3}) ->
    #{attr =>
          #attr{hp_max = 6729, mp_max = 1002, atk_speed = 339,
                phy_dmg = 3191, magic_dmg = 1538, phy_def = 1457,
                magic_def = 1253, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 89, anti_control = 89},
      skills =>
          [{30001, 60},
           {30002, 60},
           {30003, 60},
           {30004, 60},
           {30005, 60},
           {30006, 60},
           {30007, 60}]};
get({61, 3}) ->
    #{attr =>
          #attr{hp_max = 6811, mp_max = 1017, atk_speed = 344,
                phy_dmg = 3227, magic_dmg = 1545, phy_def = 1479,
                magic_def = 1267, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 91, anti_control = 91},
      skills =>
          [{30001, 61},
           {30002, 61},
           {30003, 61},
           {30004, 61},
           {30005, 61},
           {30006, 61},
           {30007, 61}]};
get({62, 3}) ->
    #{attr =>
          #attr{hp_max = 6978, mp_max = 1047, atk_speed = 355,
                phy_dmg = 3301, magic_dmg = 1562, phy_def = 1522,
                magic_def = 1296, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 95, anti_control = 95},
      skills =>
          [{30001, 62},
           {30002, 62},
           {30003, 62},
           {30004, 62},
           {30005, 62},
           {30006, 62},
           {30007, 62}]};
get({63, 3}) ->
    #{attr =>
          #attr{hp_max = 7144, mp_max = 1077, atk_speed = 367,
                phy_dmg = 3375, magic_dmg = 1579, phy_def = 1567,
                magic_def = 1326, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 100,
                anti_control = 100},
      skills =>
          [{30001, 63},
           {30002, 63},
           {30003, 63},
           {30004, 63},
           {30005, 63},
           {30006, 63},
           {30007, 63}]};
get({64, 3}) ->
    #{attr =>
          #attr{hp_max = 7310, mp_max = 1107, atk_speed = 378,
                phy_dmg = 3449, magic_dmg = 1596, phy_def = 1611,
                magic_def = 1355, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 105,
                anti_control = 105},
      skills =>
          [{30001, 64},
           {30002, 64},
           {30003, 64},
           {30004, 64},
           {30005, 64},
           {30006, 64},
           {30007, 64}]};
get({65, 3}) ->
    #{attr =>
          #attr{hp_max = 7560, mp_max = 1153, atk_speed = 395,
                phy_dmg = 3560, magic_dmg = 1622, phy_def = 1677,
                magic_def = 1400, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 112,
                anti_control = 112},
      skills =>
          [{30001, 65},
           {30002, 65},
           {30003, 65},
           {30004, 65},
           {30005, 65},
           {30006, 65},
           {30007, 65}]};
get({66, 3}) ->
    #{attr =>
          #attr{hp_max = 7646, mp_max = 1158, atk_speed = 400,
                phy_dmg = 3606, magic_dmg = 1653, phy_def = 1695,
                magic_def = 1415, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 112,
                anti_control = 112},
      skills =>
          [{30001, 66},
           {30002, 66},
           {30003, 66},
           {30004, 66},
           {30005, 66},
           {30006, 66},
           {30007, 66}]};
get({67, 3}) ->
    #{attr =>
          #attr{hp_max = 7819, mp_max = 1169, atk_speed = 412,
                phy_dmg = 3698, magic_dmg = 1713, phy_def = 1731,
                magic_def = 1445, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 113,
                anti_control = 113},
      skills =>
          [{30001, 67},
           {30002, 67},
           {30003, 67},
           {30004, 67},
           {30005, 67},
           {30006, 67},
           {30007, 67}]};
get({68, 3}) ->
    #{attr =>
          #attr{hp_max = 7992, mp_max = 1180, atk_speed = 423,
                phy_dmg = 3791, magic_dmg = 1774, phy_def = 1767,
                magic_def = 1476, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 114,
                anti_control = 114},
      skills =>
          [{30001, 68},
           {30002, 68},
           {30003, 68},
           {30004, 68},
           {30005, 68},
           {30006, 68},
           {30007, 68}]};
get({69, 3}) ->
    #{attr =>
          #attr{hp_max = 8166, mp_max = 1190, atk_speed = 434,
                phy_dmg = 3883, magic_dmg = 1835, phy_def = 1804,
                magic_def = 1506, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 114,
                anti_control = 114},
      skills =>
          [{30001, 69},
           {30002, 69},
           {30003, 69},
           {30004, 69},
           {30005, 69},
           {30006, 69},
           {30007, 69}]};
get({70, 3}) ->
    #{attr =>
          #attr{hp_max = 8426, mp_max = 1207, atk_speed = 452,
                phy_dmg = 4022, magic_dmg = 1927, phy_def = 1859,
                magic_def = 1552, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 116,
                anti_control = 116},
      skills =>
          [{30001, 70},
           {30002, 70},
           {30003, 70},
           {30004, 70},
           {30005, 70},
           {30006, 70},
           {30007, 70}]};
get({71, 3}) ->
    #{attr =>
          #attr{hp_max = 8550, mp_max = 1224, atk_speed = 458,
                phy_dmg = 4081, magic_dmg = 1955, phy_def = 1886,
                magic_def = 1574, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 117,
                anti_control = 117},
      skills =>
          [{30001, 71},
           {30002, 71},
           {30003, 71},
           {30004, 71},
           {30005, 71},
           {30006, 71},
           {30007, 71}]};
get({72, 3}) ->
    #{attr =>
          #attr{hp_max = 8675, mp_max = 1242, atk_speed = 465,
                phy_dmg = 4141, magic_dmg = 1984, phy_def = 1914,
                magic_def = 1597, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 119,
                anti_control = 119},
      skills =>
          [{30001, 72},
           {30002, 72},
           {30003, 72},
           {30004, 72},
           {30005, 72},
           {30006, 72},
           {30007, 72}]};
get({73, 3}) ->
    #{attr =>
          #attr{hp_max = 8800, mp_max = 1260, atk_speed = 472,
                phy_dmg = 4200, magic_dmg = 2012, phy_def = 1941,
                magic_def = 1620, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 121,
                anti_control = 121},
      skills =>
          [{30001, 73},
           {30002, 73},
           {30003, 73},
           {30004, 73},
           {30005, 73},
           {30006, 73},
           {30007, 73}]};
get({74, 3}) ->
    #{attr =>
          #attr{hp_max = 8925, mp_max = 1278, atk_speed = 478,
                phy_dmg = 4260, magic_dmg = 2041, phy_def = 1969,
                magic_def = 1643, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 122,
                anti_control = 122},
      skills =>
          [{30001, 74},
           {30002, 74},
           {30003, 74},
           {30004, 74},
           {30005, 74},
           {30006, 74},
           {30007, 74}]};
get({75, 3}) ->
    #{attr =>
          #attr{hp_max = 9050, mp_max = 1296, atk_speed = 485,
                phy_dmg = 4319, magic_dmg = 2069, phy_def = 1996,
                magic_def = 1666, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 124,
                anti_control = 124},
      skills =>
          [{30001, 75},
           {30002, 75},
           {30003, 75},
           {30004, 75},
           {30005, 75},
           {30006, 75},
           {30007, 75}]};
get({76, 3}) ->
    #{attr =>
          #attr{hp_max = 9174, mp_max = 1314, atk_speed = 492,
                phy_dmg = 4379, magic_dmg = 2098, phy_def = 2024,
                magic_def = 1689, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 126,
                anti_control = 126},
      skills =>
          [{30001, 76},
           {30002, 76},
           {30003, 76},
           {30004, 76},
           {30005, 76},
           {30006, 76},
           {30007, 76}]};
get({77, 3}) ->
    #{attr =>
          #attr{hp_max = 9299, mp_max = 1332, atk_speed = 498,
                phy_dmg = 4439, magic_dmg = 2126, phy_def = 2051,
                magic_def = 1712, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 128,
                anti_control = 128},
      skills =>
          [{30001, 77},
           {30002, 77},
           {30003, 77},
           {30004, 77},
           {30005, 77},
           {30006, 77},
           {30007, 77}]};
get({78, 3}) ->
    #{attr =>
          #attr{hp_max = 9424, mp_max = 1350, atk_speed = 505,
                phy_dmg = 4498, magic_dmg = 2155, phy_def = 2079,
                magic_def = 1735, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 129,
                anti_control = 129},
      skills =>
          [{30001, 78},
           {30002, 78},
           {30003, 78},
           {30004, 78},
           {30005, 78},
           {30006, 78},
           {30007, 78}]};
get({79, 3}) ->
    #{attr =>
          #attr{hp_max = 9549, mp_max = 1367, atk_speed = 512,
                phy_dmg = 4558, magic_dmg = 2183, phy_def = 2106,
                magic_def = 1758, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 131,
                anti_control = 131},
      skills =>
          [{30001, 79},
           {30002, 79},
           {30003, 79},
           {30004, 79},
           {30005, 79},
           {30006, 79},
           {30007, 79}]};
get({80, 3}) ->
    #{attr =>
          #attr{hp_max = 9674, mp_max = 1385, atk_speed = 518,
                phy_dmg = 4617, magic_dmg = 2212, phy_def = 2134,
                magic_def = 1781, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 133,
                anti_control = 133},
      skills =>
          [{30001, 80},
           {30002, 80},
           {30003, 80},
           {30004, 80},
           {30005, 80},
           {30006, 80},
           {30007, 80}]};
get({81, 3}) ->
    #{attr =>
          #attr{hp_max = 9799, mp_max = 1403, atk_speed = 525,
                phy_dmg = 4677, magic_dmg = 2241, phy_def = 2161,
                magic_def = 1804, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 134,
                anti_control = 134},
      skills =>
          [{30001, 80},
           {30002, 80},
           {30003, 80},
           {30004, 80},
           {30005, 80},
           {30006, 80},
           {30007, 80}]};
get({82, 3}) ->
    #{attr =>
          #attr{hp_max = 9923, mp_max = 1421, atk_speed = 532,
                phy_dmg = 4737, magic_dmg = 2269, phy_def = 2189,
                magic_def = 1827, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 136,
                anti_control = 136},
      skills =>
          [{30001, 80},
           {30002, 80},
           {30003, 80},
           {30004, 80},
           {30005, 80},
           {30006, 80},
           {30007, 80}]};
get({83, 3}) ->
    #{attr =>
          #attr{hp_max = 10048, mp_max = 1439, atk_speed = 539,
                phy_dmg = 4796, magic_dmg = 2298, phy_def = 2217,
                magic_def = 1850, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 138,
                anti_control = 138},
      skills =>
          [{30001, 80},
           {30002, 80},
           {30003, 80},
           {30004, 80},
           {30005, 80},
           {30006, 80},
           {30007, 80}]};
get({84, 3}) ->
    #{attr =>
          #attr{hp_max = 10173, mp_max = 1457, atk_speed = 545,
                phy_dmg = 4856, magic_dmg = 2326, phy_def = 2244,
                magic_def = 1873, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 140,
                anti_control = 140},
      skills =>
          [{30001, 80},
           {30002, 80},
           {30003, 80},
           {30004, 80},
           {30005, 80},
           {30006, 80},
           {30007, 80}]};
get({85, 3}) ->
    #{attr =>
          #attr{hp_max = 10298, mp_max = 1475, atk_speed = 552,
                phy_dmg = 4915, magic_dmg = 2355, phy_def = 2272,
                magic_def = 1896, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 141,
                anti_control = 141},
      skills =>
          [{30001, 80},
           {30002, 80},
           {30003, 80},
           {30004, 80},
           {30005, 80},
           {30006, 80},
           {30007, 80}]};
get({86, 3}) ->
    #{attr =>
          #attr{hp_max = 10423, mp_max = 1493, atk_speed = 559,
                phy_dmg = 4975, magic_dmg = 2383, phy_def = 2299,
                magic_def = 1919, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 143,
                anti_control = 143},
      skills =>
          [{30001, 80},
           {30002, 80},
           {30003, 80},
           {30004, 80},
           {30005, 80},
           {30006, 80},
           {30007, 80}]};
get({87, 3}) ->
    #{attr =>
          #attr{hp_max = 10548, mp_max = 1510, atk_speed = 565,
                phy_dmg = 5034, magic_dmg = 2412, phy_def = 2327,
                magic_def = 1942, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 145,
                anti_control = 145},
      skills =>
          [{30001, 80},
           {30002, 80},
           {30003, 80},
           {30004, 80},
           {30005, 80},
           {30006, 80},
           {30007, 80}]};
get({88, 3}) ->
    #{attr =>
          #attr{hp_max = 10672, mp_max = 1528, atk_speed = 572,
                phy_dmg = 5094, magic_dmg = 2440, phy_def = 2354,
                magic_def = 1965, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 146,
                anti_control = 146},
      skills =>
          [{30001, 80},
           {30002, 80},
           {30003, 80},
           {30004, 80},
           {30005, 80},
           {30006, 80},
           {30007, 80}]};
get({89, 3}) ->
    #{attr =>
          #attr{hp_max = 10797, mp_max = 1546, atk_speed = 579,
                phy_dmg = 5154, magic_dmg = 2469, phy_def = 2382,
                magic_def = 1988, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 148,
                anti_control = 148},
      skills =>
          [{30001, 80},
           {30002, 80},
           {30003, 80},
           {30004, 80},
           {30005, 80},
           {30006, 80},
           {30007, 80}]};
get({90, 3}) ->
    #{attr =>
          #attr{hp_max = 10922, mp_max = 1564, atk_speed = 585,
                phy_dmg = 5213, magic_dmg = 2497, phy_def = 2409,
                magic_def = 2011, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 150,
                anti_control = 150},
      skills =>
          [{30001, 80},
           {30002, 80},
           {30003, 80},
           {30004, 80},
           {30005, 80},
           {30006, 80},
           {30007, 80}]};
get({91, 3}) ->
    #{attr =>
          #attr{hp_max = 11016, mp_max = 1578, atk_speed = 590,
                phy_dmg = 5258, magic_dmg = 2519, phy_def = 2430,
                magic_def = 2029, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 151,
                anti_control = 151},
      skills =>
          [{30001, 80},
           {30002, 80},
           {30003, 80},
           {30004, 80},
           {30005, 80},
           {30006, 80},
           {30007, 80}]};
get({92, 3}) ->
    #{attr =>
          #attr{hp_max = 11109, mp_max = 1591, atk_speed = 595,
                phy_dmg = 5303, magic_dmg = 2540, phy_def = 2451,
                magic_def = 2046, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 152,
                anti_control = 152},
      skills =>
          [{30001, 80},
           {30002, 80},
           {30003, 80},
           {30004, 80},
           {30005, 80},
           {30006, 80},
           {30007, 80}]};
get({93, 3}) ->
    #{attr =>
          #attr{hp_max = 11203, mp_max = 1604, atk_speed = 600,
                phy_dmg = 5347, magic_dmg = 2562, phy_def = 2471,
                magic_def = 2063, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 154,
                anti_control = 154},
      skills =>
          [{30001, 80},
           {30002, 80},
           {30003, 80},
           {30004, 80},
           {30005, 80},
           {30006, 80},
           {30007, 80}]};
get({94, 3}) ->
    #{attr =>
          #attr{hp_max = 11297, mp_max = 1618, atk_speed = 606,
                phy_dmg = 5392, magic_dmg = 2583, phy_def = 2492,
                magic_def = 2080, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 155,
                anti_control = 155},
      skills =>
          [{30001, 80},
           {30002, 80},
           {30003, 80},
           {30004, 80},
           {30005, 80},
           {30006, 80},
           {30007, 80}]};
get({95, 3}) ->
    #{attr =>
          #attr{hp_max = 11390, mp_max = 1631, atk_speed = 611,
                phy_dmg = 5437, magic_dmg = 2605, phy_def = 2513,
                magic_def = 2098, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 156,
                anti_control = 156},
      skills =>
          [{30001, 80},
           {30002, 80},
           {30003, 80},
           {30004, 80},
           {30005, 80},
           {30006, 80},
           {30007, 80}]};
get({96, 3}) ->
    #{attr =>
          #attr{hp_max = 11484, mp_max = 1645, atk_speed = 616,
                phy_dmg = 5481, magic_dmg = 2626, phy_def = 2533,
                magic_def = 2115, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 158,
                anti_control = 158},
      skills =>
          [{30001, 80},
           {30002, 80},
           {30003, 80},
           {30004, 80},
           {30005, 80},
           {30006, 80},
           {30007, 80}]};
get({97, 3}) ->
    #{attr =>
          #attr{hp_max = 11577, mp_max = 1658, atk_speed = 621,
                phy_dmg = 5526, magic_dmg = 2647, phy_def = 2554,
                magic_def = 2132, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 159,
                anti_control = 159},
      skills =>
          [{30001, 80},
           {30002, 80},
           {30003, 80},
           {30004, 80},
           {30005, 80},
           {30006, 80},
           {30007, 80}]};
get({98, 3}) ->
    #{attr =>
          #attr{hp_max = 11671, mp_max = 1671, atk_speed = 626,
                phy_dmg = 5571, magic_dmg = 2669, phy_def = 2575,
                magic_def = 2149, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 160,
                anti_control = 160},
      skills =>
          [{30001, 80},
           {30002, 80},
           {30003, 80},
           {30004, 80},
           {30005, 80},
           {30006, 80},
           {30007, 80}]};
get({99, 3}) ->
    #{attr =>
          #attr{hp_max = 11765, mp_max = 1685, atk_speed = 631,
                phy_dmg = 5615, magic_dmg = 2690, phy_def = 2595,
                magic_def = 2167, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 161,
                anti_control = 161},
      skills =>
          [{30001, 80},
           {30002, 80},
           {30003, 80},
           {30004, 80},
           {30005, 80},
           {30006, 80},
           {30007, 80}]};
get({100, 3}) ->
    #{attr =>
          #attr{hp_max = 11858, mp_max = 1698, atk_speed = 636,
                phy_dmg = 5660, magic_dmg = 2712, phy_def = 2616,
                magic_def = 2184, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 163,
                anti_control = 163},
      skills =>
          [{30001, 80},
           {30002, 80},
           {30003, 80},
           {30004, 80},
           {30005, 80},
           {30006, 80},
           {30007, 80}]};
get({101, 3}) ->
    #{attr =>
          #attr{hp_max = 11952, mp_max = 1712, atk_speed = 641,
                phy_dmg = 5705, magic_dmg = 2733, phy_def = 2637,
                magic_def = 2201, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 164,
                anti_control = 164},
      skills =>
          [{30001, 80},
           {30002, 80},
           {30003, 80},
           {30004, 80},
           {30005, 80},
           {30006, 80},
           {30007, 80}]};
get({102, 3}) ->
    #{attr =>
          #attr{hp_max = 12046, mp_max = 1725, atk_speed = 646,
                phy_dmg = 5749, magic_dmg = 2754, phy_def = 2657,
                magic_def = 2218, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 165,
                anti_control = 165},
      skills =>
          [{30001, 80},
           {30002, 80},
           {30003, 80},
           {30004, 80},
           {30005, 80},
           {30006, 80},
           {30007, 80}]};
get({103, 3}) ->
    #{attr =>
          #attr{hp_max = 12139, mp_max = 1738, atk_speed = 651,
                phy_dmg = 5794, magic_dmg = 2776, phy_def = 2678,
                magic_def = 2236, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 167,
                anti_control = 167},
      skills =>
          [{30001, 80},
           {30002, 80},
           {30003, 80},
           {30004, 80},
           {30005, 80},
           {30006, 80},
           {30007, 80}]};
get({104, 3}) ->
    #{attr =>
          #attr{hp_max = 12233, mp_max = 1752, atk_speed = 656,
                phy_dmg = 5839, magic_dmg = 2797, phy_def = 2698,
                magic_def = 2253, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 168,
                anti_control = 168},
      skills =>
          [{30001, 80},
           {30002, 80},
           {30003, 80},
           {30004, 80},
           {30005, 80},
           {30006, 80},
           {30007, 80}]};
get({105, 3}) ->
    #{attr =>
          #attr{hp_max = 12326, mp_max = 1765, atk_speed = 661,
                phy_dmg = 5884, magic_dmg = 2819, phy_def = 2719,
                magic_def = 2270, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 169,
                anti_control = 169},
      skills =>
          [{30001, 80},
           {30002, 80},
           {30003, 80},
           {30004, 80},
           {30005, 80},
           {30006, 80},
           {30007, 80}]};
get({106, 3}) ->
    #{attr =>
          #attr{hp_max = 12420, mp_max = 1779, atk_speed = 666,
                phy_dmg = 5928, magic_dmg = 2840, phy_def = 2740,
                magic_def = 2287, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 170,
                anti_control = 170},
      skills =>
          [{30001, 80},
           {30002, 80},
           {30003, 80},
           {30004, 80},
           {30005, 80},
           {30006, 80},
           {30007, 80}]};
get({107, 3}) ->
    #{attr =>
          #attr{hp_max = 12514, mp_max = 1792, atk_speed = 671,
                phy_dmg = 5973, magic_dmg = 2861, phy_def = 2760,
                magic_def = 2305, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 172,
                anti_control = 172},
      skills =>
          [{30001, 80},
           {30002, 80},
           {30003, 80},
           {30004, 80},
           {30005, 80},
           {30006, 80},
           {30007, 80}]};
get({108, 3}) ->
    #{attr =>
          #attr{hp_max = 12607, mp_max = 1806, atk_speed = 676,
                phy_dmg = 6018, magic_dmg = 2883, phy_def = 2781,
                magic_def = 2322, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 173,
                anti_control = 173},
      skills =>
          [{30001, 80},
           {30002, 80},
           {30003, 80},
           {30004, 80},
           {30005, 80},
           {30006, 80},
           {30007, 80}]};
get({109, 3}) ->
    #{attr =>
          #attr{hp_max = 12701, mp_max = 1819, atk_speed = 681,
                phy_dmg = 6062, magic_dmg = 2904, phy_def = 2802,
                magic_def = 2339, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 174,
                anti_control = 174},
      skills =>
          [{30001, 80},
           {30002, 80},
           {30003, 80},
           {30004, 80},
           {30005, 80},
           {30006, 80},
           {30007, 80}]};
get({110, 3}) ->
    #{attr =>
          #attr{hp_max = 12795, mp_max = 1832, atk_speed = 686,
                phy_dmg = 6107, magic_dmg = 2926, phy_def = 2822,
                magic_def = 2356, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{30001, 80},
           {30002, 80},
           {30003, 80},
           {30004, 80},
           {30005, 80},
           {30006, 80},
           {30007, 80}]};
get({111, 3}) ->
    #{attr =>
          #attr{hp_max = 12795, mp_max = 1832, atk_speed = 686,
                phy_dmg = 6107, magic_dmg = 2926, phy_def = 2822,
                magic_def = 2356, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{30001, 80},
           {30002, 80},
           {30003, 80},
           {30004, 80},
           {30005, 80},
           {30006, 80},
           {30007, 80}]};
get({112, 3}) ->
    #{attr =>
          #attr{hp_max = 12795, mp_max = 1832, atk_speed = 686,
                phy_dmg = 6107, magic_dmg = 2926, phy_def = 2822,
                magic_def = 2356, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{30001, 80},
           {30002, 80},
           {30003, 80},
           {30004, 80},
           {30005, 80},
           {30006, 80},
           {30007, 80}]};
get({113, 3}) ->
    #{attr =>
          #attr{hp_max = 12795, mp_max = 1832, atk_speed = 686,
                phy_dmg = 6107, magic_dmg = 2926, phy_def = 2822,
                magic_def = 2356, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{30001, 80},
           {30002, 80},
           {30003, 80},
           {30004, 80},
           {30005, 80},
           {30006, 80},
           {30007, 80}]};
get({114, 3}) ->
    #{attr =>
          #attr{hp_max = 12795, mp_max = 1832, atk_speed = 686,
                phy_dmg = 6107, magic_dmg = 2926, phy_def = 2822,
                magic_def = 2356, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{30001, 80},
           {30002, 80},
           {30003, 80},
           {30004, 80},
           {30005, 80},
           {30006, 80},
           {30007, 80}]};
get({115, 3}) ->
    #{attr =>
          #attr{hp_max = 12795, mp_max = 1832, atk_speed = 686,
                phy_dmg = 6107, magic_dmg = 2926, phy_def = 2822,
                magic_def = 2356, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{30001, 80},
           {30002, 80},
           {30003, 80},
           {30004, 80},
           {30005, 80},
           {30006, 80},
           {30007, 80}]};
get({116, 3}) ->
    #{attr =>
          #attr{hp_max = 12795, mp_max = 1832, atk_speed = 686,
                phy_dmg = 6107, magic_dmg = 2926, phy_def = 2822,
                magic_def = 2356, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{30001, 80},
           {30002, 80},
           {30003, 80},
           {30004, 80},
           {30005, 80},
           {30006, 80},
           {30007, 80}]};
get({117, 3}) ->
    #{attr =>
          #attr{hp_max = 12795, mp_max = 1832, atk_speed = 686,
                phy_dmg = 6107, magic_dmg = 2926, phy_def = 2822,
                magic_def = 2356, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{30001, 80},
           {30002, 80},
           {30003, 80},
           {30004, 80},
           {30005, 80},
           {30006, 80},
           {30007, 80}]};
get({118, 3}) ->
    #{attr =>
          #attr{hp_max = 12795, mp_max = 1832, atk_speed = 686,
                phy_dmg = 6107, magic_dmg = 2926, phy_def = 2822,
                magic_def = 2356, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{30001, 80},
           {30002, 80},
           {30003, 80},
           {30004, 80},
           {30005, 80},
           {30006, 80},
           {30007, 80}]};
get({119, 3}) ->
    #{attr =>
          #attr{hp_max = 12795, mp_max = 1832, atk_speed = 686,
                phy_dmg = 6107, magic_dmg = 2926, phy_def = 2822,
                magic_def = 2356, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{30001, 80},
           {30002, 80},
           {30003, 80},
           {30004, 80},
           {30005, 80},
           {30006, 80},
           {30007, 80}]};
get({120, 3}) ->
    #{attr =>
          #attr{hp_max = 12795, mp_max = 1832, atk_speed = 686,
                phy_dmg = 6107, magic_dmg = 2926, phy_def = 2822,
                magic_def = 2356, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{30001, 80},
           {30002, 80},
           {30003, 80},
           {30004, 80},
           {30005, 80},
           {30006, 80},
           {30007, 80}]};
get({121, 3}) ->
    #{attr =>
          #attr{hp_max = 12795, mp_max = 1832, atk_speed = 686,
                phy_dmg = 6107, magic_dmg = 2926, phy_def = 2822,
                magic_def = 2356, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{30001, 80},
           {30002, 80},
           {30003, 80},
           {30004, 80},
           {30005, 80},
           {30006, 80},
           {30007, 80}]};
get({122, 3}) ->
    #{attr =>
          #attr{hp_max = 12795, mp_max = 1832, atk_speed = 686,
                phy_dmg = 6107, magic_dmg = 2926, phy_def = 2822,
                magic_def = 2356, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{30001, 80},
           {30002, 80},
           {30003, 80},
           {30004, 80},
           {30005, 80},
           {30006, 80},
           {30007, 80}]};
get({123, 3}) ->
    #{attr =>
          #attr{hp_max = 12795, mp_max = 1832, atk_speed = 686,
                phy_dmg = 6107, magic_dmg = 2926, phy_def = 2822,
                magic_def = 2356, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{30001, 80},
           {30002, 80},
           {30003, 80},
           {30004, 80},
           {30005, 80},
           {30006, 80},
           {30007, 80}]};
get({124, 3}) ->
    #{attr =>
          #attr{hp_max = 12795, mp_max = 1832, atk_speed = 686,
                phy_dmg = 6107, magic_dmg = 2926, phy_def = 2822,
                magic_def = 2356, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{30001, 80},
           {30002, 80},
           {30003, 80},
           {30004, 80},
           {30005, 80},
           {30006, 80},
           {30007, 80}]};
get({125, 3}) ->
    #{attr =>
          #attr{hp_max = 12795, mp_max = 1832, atk_speed = 686,
                phy_dmg = 6107, magic_dmg = 2926, phy_def = 2822,
                magic_def = 2356, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{30001, 80},
           {30002, 80},
           {30003, 80},
           {30004, 80},
           {30005, 80},
           {30006, 80},
           {30007, 80}]};
get({126, 3}) ->
    #{attr =>
          #attr{hp_max = 12795, mp_max = 1832, atk_speed = 686,
                phy_dmg = 6107, magic_dmg = 2926, phy_def = 2822,
                magic_def = 2356, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{30001, 80},
           {30002, 80},
           {30003, 80},
           {30004, 80},
           {30005, 80},
           {30006, 80},
           {30007, 80}]};
get({127, 3}) ->
    #{attr =>
          #attr{hp_max = 12795, mp_max = 1832, atk_speed = 686,
                phy_dmg = 6107, magic_dmg = 2926, phy_def = 2822,
                magic_def = 2356, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{30001, 80},
           {30002, 80},
           {30003, 80},
           {30004, 80},
           {30005, 80},
           {30006, 80},
           {30007, 80}]};
get({128, 3}) ->
    #{attr =>
          #attr{hp_max = 12795, mp_max = 1832, atk_speed = 686,
                phy_dmg = 6107, magic_dmg = 2926, phy_def = 2822,
                magic_def = 2356, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{30001, 80},
           {30002, 80},
           {30003, 80},
           {30004, 80},
           {30005, 80},
           {30006, 80},
           {30007, 80}]};
get({129, 3}) ->
    #{attr =>
          #attr{hp_max = 12795, mp_max = 1832, atk_speed = 686,
                phy_dmg = 6107, magic_dmg = 2926, phy_def = 2822,
                magic_def = 2356, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{30001, 80},
           {30002, 80},
           {30003, 80},
           {30004, 80},
           {30005, 80},
           {30006, 80},
           {30007, 80}]};
get({130, 3}) ->
    #{attr =>
          #attr{hp_max = 12795, mp_max = 1832, atk_speed = 686,
                phy_dmg = 6107, magic_dmg = 2926, phy_def = 2822,
                magic_def = 2356, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{30001, 80},
           {30002, 80},
           {30003, 80},
           {30004, 80},
           {30005, 80},
           {30006, 80},
           {30007, 80}]};
get({20, 4}) ->
    #{attr =>
          #attr{hp_max = 3482, mp_max = 390, atk_speed = 53,
                phy_dmg = 466, magic_dmg = 355, phy_def = 545,
                magic_def = 188, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 26, anti_control = 26},
      skills => [{40001, 20}, {40002, 20}, {40003, 20}]};
get({21, 4}) ->
    #{attr =>
          #attr{hp_max = 3559, mp_max = 390, atk_speed = 53,
                phy_dmg = 467, magic_dmg = 356, phy_def = 555,
                magic_def = 192, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 26, anti_control = 26},
      skills => [{40001, 21}, {40002, 21}, {40003, 21}]};
get({22, 4}) ->
    #{attr =>
          #attr{hp_max = 3715, mp_max = 390, atk_speed = 55,
                phy_dmg = 471, magic_dmg = 360, phy_def = 576,
                magic_def = 202, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 26, anti_control = 26},
      skills => [{40001, 22}, {40002, 22}, {40003, 22}]};
get({23, 4}) ->
    #{attr =>
          #attr{hp_max = 3871, mp_max = 390, atk_speed = 57,
                phy_dmg = 474, magic_dmg = 362, phy_def = 597,
                magic_def = 212, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 26, anti_control = 26},
      skills => [{40001, 23}, {40002, 23}, {40003, 23}]};
get({24, 4}) ->
    #{attr =>
          #attr{hp_max = 4027, mp_max = 390, atk_speed = 59,
                phy_dmg = 476, magic_dmg = 365, phy_def = 618,
                magic_def = 222, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 26, anti_control = 26},
      skills => [{40001, 24}, {40002, 24}, {40003, 24}]};
get({25, 4}) ->
    #{attr =>
          #attr{hp_max = 4261, mp_max = 390, atk_speed = 62,
                phy_dmg = 482, magic_dmg = 371, phy_def = 650,
                magic_def = 237, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 26, anti_control = 26},
      skills =>
          [{40001, 25}, {40002, 25}, {40003, 25}, {40004, 25}]};
get({26, 4}) ->
    #{attr =>
          #attr{hp_max = 4364, mp_max = 397, atk_speed = 63,
                phy_dmg = 508, magic_dmg = 390, phy_def = 667,
                magic_def = 245, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 27, anti_control = 27},
      skills =>
          [{40001, 26}, {40002, 26}, {40003, 26}, {40004, 26}]};
get({27, 4}) ->
    #{attr =>
          #attr{hp_max = 4570, mp_max = 413, atk_speed = 67,
                phy_dmg = 559, magic_dmg = 429, phy_def = 703,
                magic_def = 260, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 30, anti_control = 30},
      skills =>
          [{40001, 27}, {40002, 27}, {40003, 27}, {40004, 27}]};
get({28, 4}) ->
    #{attr =>
          #attr{hp_max = 4776, mp_max = 429, atk_speed = 71,
                phy_dmg = 611, magic_dmg = 468, phy_def = 740,
                magic_def = 276, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 33, anti_control = 33},
      skills =>
          [{40001, 28}, {40002, 28}, {40003, 28}, {40004, 28}]};
get({29, 4}) ->
    #{attr =>
          #attr{hp_max = 4982, mp_max = 444, atk_speed = 74,
                phy_dmg = 663, magic_dmg = 507, phy_def = 775,
                magic_def = 291, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 36, anti_control = 36},
      skills =>
          [{40001, 29}, {40002, 29}, {40003, 29}, {40004, 29}]};
get({30, 4}) ->
    #{attr =>
          #attr{hp_max = 5292, mp_max = 468, atk_speed = 80,
                phy_dmg = 741, magic_dmg = 566, phy_def = 829,
                magic_def = 315, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 41, anti_control = 41},
      skills =>
          [{40001, 30}, {40002, 30}, {40003, 30}, {40004, 30}]};
get({31, 4}) ->
    #{attr =>
          #attr{hp_max = 5369, mp_max = 481, atk_speed = 80,
                phy_dmg = 743, magic_dmg = 569, phy_def = 840,
                magic_def = 319, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 41, anti_control = 41},
      skills =>
          [{40001, 31}, {40002, 31}, {40003, 31}, {40004, 31}]};
get({32, 4}) ->
    #{attr =>
          #attr{hp_max = 5525, mp_max = 507, atk_speed = 82,
                phy_dmg = 749, magic_dmg = 574, phy_def = 864,
                magic_def = 328, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 41, anti_control = 41},
      skills =>
          [{40001, 32}, {40002, 32}, {40003, 32}, {40004, 32}]};
get({33, 4}) ->
    #{attr =>
          #attr{hp_max = 5681, mp_max = 533, atk_speed = 84,
                phy_dmg = 756, magic_dmg = 581, phy_def = 889,
                magic_def = 337, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 41, anti_control = 41},
      skills =>
          [{40001, 33}, {40002, 33}, {40003, 33}, {40004, 33}]};
get({34, 4}) ->
    #{attr =>
          #attr{hp_max = 5837, mp_max = 559, atk_speed = 86,
                phy_dmg = 761, magic_dmg = 587, phy_def = 912,
                magic_def = 345, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 41, anti_control = 41},
      skills =>
          [{40001, 34}, {40002, 34}, {40003, 34}, {40004, 34}]};
get({35, 4}) ->
    #{attr =>
          #attr{hp_max = 6071, mp_max = 598, atk_speed = 89,
                phy_dmg = 771, magic_dmg = 596, phy_def = 949,
                magic_def = 360, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 41, anti_control = 41},
      skills =>
          [{40001, 35},
           {40002, 35},
           {40003, 35},
           {40004, 35},
           {40005, 35}]};
get({36, 4}) ->
    #{attr =>
          #attr{hp_max = 6269, mp_max = 599, atk_speed = 91,
                phy_dmg = 793, magic_dmg = 616, phy_def = 990,
                magic_def = 376, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 41, anti_control = 41},
      skills =>
          [{40001, 36},
           {40002, 36},
           {40003, 36},
           {40004, 36},
           {40005, 36}]};
get({37, 4}) ->
    #{attr =>
          #attr{hp_max = 6665, mp_max = 603, atk_speed = 96,
                phy_dmg = 837, magic_dmg = 658, phy_def = 1076,
                magic_def = 410, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 41, anti_control = 41},
      skills =>
          [{40001, 37},
           {40002, 37},
           {40003, 37},
           {40004, 37},
           {40005, 37}]};
get({38, 4}) ->
    #{attr =>
          #attr{hp_max = 7062, mp_max = 607, atk_speed = 102,
                phy_dmg = 882, magic_dmg = 700, phy_def = 1161,
                magic_def = 444, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 41, anti_control = 41},
      skills =>
          [{40001, 38},
           {40002, 38},
           {40003, 38},
           {40004, 38},
           {40005, 38}]};
get({39, 4}) ->
    #{attr =>
          #attr{hp_max = 7458, mp_max = 610, atk_speed = 107,
                phy_dmg = 926, magic_dmg = 741, phy_def = 1247,
                magic_def = 477, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 41, anti_control = 41},
      skills =>
          [{40001, 39},
           {40002, 39},
           {40003, 39},
           {40004, 39},
           {40005, 39}]};
get({40, 4}) ->
    #{attr =>
          #attr{hp_max = 8052, mp_max = 616, atk_speed = 115,
                phy_dmg = 993, magic_dmg = 804, phy_def = 1375,
                magic_def = 529, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 41, anti_control = 41},
      skills =>
          [{40001, 40},
           {40002, 40},
           {40003, 40},
           {40004, 40},
           {40005, 40}]};
get({41, 4}) ->
    #{attr =>
          #attr{hp_max = 8201, mp_max = 625, atk_speed = 118,
                phy_dmg = 1007, magic_dmg = 810, phy_def = 1398,
                magic_def = 546, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 42, anti_control = 42},
      skills =>
          [{40001, 41},
           {40002, 41},
           {40003, 41},
           {40004, 41},
           {40005, 41}]};
get({42, 4}) ->
    #{attr =>
          #attr{hp_max = 8498, mp_max = 645, atk_speed = 125,
                phy_dmg = 1037, magic_dmg = 822, phy_def = 1444,
                magic_def = 582, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 45, anti_control = 45},
      skills =>
          [{40001, 42},
           {40002, 42},
           {40003, 42},
           {40004, 42},
           {40005, 42}]};
get({43, 4}) ->
    #{attr =>
          #attr{hp_max = 8796, mp_max = 664, atk_speed = 133,
                phy_dmg = 1066, magic_dmg = 835, phy_def = 1492,
                magic_def = 618, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 48, anti_control = 48},
      skills =>
          [{40001, 43},
           {40002, 43},
           {40003, 43},
           {40004, 43},
           {40005, 43}]};
get({44, 4}) ->
    #{attr =>
          #attr{hp_max = 9093, mp_max = 683, atk_speed = 140,
                phy_dmg = 1096, magic_dmg = 846, phy_def = 1539,
                magic_def = 653, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 51, anti_control = 51},
      skills =>
          [{40001, 44},
           {40002, 44},
           {40003, 44},
           {40004, 44},
           {40005, 44}]};
get({45, 4}) ->
    #{attr =>
          #attr{hp_max = 9539, mp_max = 713, atk_speed = 151,
                phy_dmg = 1140, magic_dmg = 865, phy_def = 1609,
                magic_def = 707, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 56, anti_control = 56},
      skills =>
          [{40001, 45},
           {40002, 45},
           {40003, 45},
           {40004, 45},
           {40005, 45},
           {40006, 45}]};
get({46, 4}) ->
    #{attr =>
          #attr{hp_max = 9677, mp_max = 720, atk_speed = 154,
                phy_dmg = 1172, magic_dmg = 893, phy_def = 1636,
                magic_def = 722, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 56, anti_control = 56},
      skills =>
          [{40001, 46},
           {40002, 46},
           {40003, 46},
           {40004, 46},
           {40005, 46},
           {40006, 46}]};
get({47, 4}) ->
    #{attr =>
          #attr{hp_max = 9954, mp_max = 734, atk_speed = 160,
                phy_dmg = 1235, magic_dmg = 948, phy_def = 1691,
                magic_def = 755, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 57, anti_control = 57},
      skills =>
          [{40001, 47},
           {40002, 47},
           {40003, 47},
           {40004, 47},
           {40005, 47},
           {40006, 47}]};
get({48, 4}) ->
    #{attr =>
          #attr{hp_max = 10231, mp_max = 749, atk_speed = 166,
                phy_dmg = 1298, magic_dmg = 1004, phy_def = 1747,
                magic_def = 787, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 59, anti_control = 59},
      skills =>
          [{40001, 48},
           {40002, 48},
           {40003, 48},
           {40004, 48},
           {40005, 48},
           {40006, 48}]};
get({49, 4}) ->
    #{attr =>
          #attr{hp_max = 10508, mp_max = 764, atk_speed = 172,
                phy_dmg = 1362, magic_dmg = 1060, phy_def = 1802,
                magic_def = 819, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 60, anti_control = 60},
      skills =>
          [{40001, 49},
           {40002, 49},
           {40003, 49},
           {40004, 49},
           {40005, 49},
           {40006, 49}]};
get({50, 4}) ->
    #{attr =>
          #attr{hp_max = 10923, mp_max = 786, atk_speed = 182,
                phy_dmg = 1457, magic_dmg = 1143, phy_def = 1884,
                magic_def = 868, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 62, anti_control = 62},
      skills =>
          [{40001, 50},
           {40002, 50},
           {40003, 50},
           {40004, 50},
           {40005, 50},
           {40006, 50}]};
get({51, 4}) ->
    #{attr =>
          #attr{hp_max = 11035, mp_max = 802, atk_speed = 185,
                phy_dmg = 1479, magic_dmg = 1155, phy_def = 1902,
                magic_def = 878, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 64, anti_control = 64},
      skills =>
          [{40001, 51},
           {40002, 51},
           {40003, 51},
           {40004, 51},
           {40005, 51},
           {40006, 51}]};
get({52, 4}) ->
    #{attr =>
          #attr{hp_max = 11259, mp_max = 835, atk_speed = 191,
                phy_dmg = 1522, magic_dmg = 1178, phy_def = 1939,
                magic_def = 899, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 68, anti_control = 68},
      skills =>
          [{40001, 52},
           {40002, 52},
           {40003, 52},
           {40004, 52},
           {40005, 52},
           {40006, 52}]};
get({53, 4}) ->
    #{attr =>
          #attr{hp_max = 11483, mp_max = 869, atk_speed = 197,
                phy_dmg = 1567, magic_dmg = 1200, phy_def = 1976,
                magic_def = 921, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 73, anti_control = 73},
      skills =>
          [{40001, 53},
           {40002, 53},
           {40003, 53},
           {40004, 53},
           {40005, 53},
           {40006, 53}]};
get({54, 4}) ->
    #{attr =>
          #attr{hp_max = 11706, mp_max = 902, atk_speed = 203,
                phy_dmg = 1611, magic_dmg = 1223, phy_def = 2013,
                magic_def = 943, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 78, anti_control = 78},
      skills =>
          [{40001, 54},
           {40002, 54},
           {40003, 54},
           {40004, 54},
           {40005, 54},
           {40006, 54}]};
get({55, 4}) ->
    #{attr =>
          #attr{hp_max = 12042, mp_max = 952, atk_speed = 213,
                phy_dmg = 1677, magic_dmg = 1258, phy_def = 2069,
                magic_def = 975, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 85, anti_control = 85},
      skills =>
          [{40001, 55},
           {40002, 55},
           {40003, 55},
           {40004, 55},
           {40005, 55},
           {40006, 55},
           {40007, 55}]};
get({56, 4}) ->
    #{attr =>
          #attr{hp_max = 12246, mp_max = 957, atk_speed = 214,
                phy_dmg = 1711, magic_dmg = 1286, phy_def = 2112,
                magic_def = 999, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 85, anti_control = 85},
      skills =>
          [{40001, 56},
           {40002, 56},
           {40003, 56},
           {40004, 56},
           {40005, 56},
           {40006, 56},
           {40007, 56}]};
get({57, 4}) ->
    #{attr =>
          #attr{hp_max = 12655, mp_max = 967, atk_speed = 217,
                phy_dmg = 1781, magic_dmg = 1342, phy_def = 2201,
                magic_def = 1048, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 86, anti_control = 86},
      skills =>
          [{40001, 57},
           {40002, 57},
           {40003, 57},
           {40004, 57},
           {40005, 57},
           {40006, 57},
           {40007, 57}]};
get({58, 4}) ->
    #{attr =>
          #attr{hp_max = 13064, mp_max = 977, atk_speed = 221,
                phy_dmg = 1850, magic_dmg = 1398, phy_def = 2289,
                magic_def = 1098, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 87, anti_control = 87},
      skills =>
          [{40001, 58},
           {40002, 58},
           {40003, 58},
           {40004, 58},
           {40005, 58},
           {40006, 58},
           {40007, 58}]};
get({59, 4}) ->
    #{attr =>
          #attr{hp_max = 13473, mp_max = 987, atk_speed = 224,
                phy_dmg = 1919, magic_dmg = 1453, phy_def = 2376,
                magic_def = 1147, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 87, anti_control = 87},
      skills =>
          [{40001, 59},
           {40002, 59},
           {40003, 59},
           {40004, 59},
           {40005, 59},
           {40006, 59},
           {40007, 59}]};
get({60, 4}) ->
    #{attr =>
          #attr{hp_max = 14086, mp_max = 1002, atk_speed = 229,
                phy_dmg = 2024, magic_dmg = 1538, phy_def = 2509,
                magic_def = 1221, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 89, anti_control = 89},
      skills =>
          [{40001, 60},
           {40002, 60},
           {40003, 60},
           {40004, 60},
           {40005, 60},
           {40006, 60},
           {40007, 60}]};
get({61, 4}) ->
    #{attr =>
          #attr{hp_max = 14249, mp_max = 1017, atk_speed = 232,
                phy_dmg = 2046, magic_dmg = 1545, phy_def = 2542,
                magic_def = 1238, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 91, anti_control = 91},
      skills =>
          [{40001, 61},
           {40002, 61},
           {40003, 61},
           {40004, 61},
           {40005, 61},
           {40006, 61},
           {40007, 61}]};
get({62, 4}) ->
    #{attr =>
          #attr{hp_max = 14576, mp_max = 1047, atk_speed = 240,
                phy_dmg = 2090, magic_dmg = 1562, phy_def = 2607,
                magic_def = 1274, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 95, anti_control = 95},
      skills =>
          [{40001, 62},
           {40002, 62},
           {40003, 62},
           {40004, 62},
           {40005, 62},
           {40006, 62},
           {40007, 62}]};
get({63, 4}) ->
    #{attr =>
          #attr{hp_max = 14903, mp_max = 1077, atk_speed = 248,
                phy_dmg = 2136, magic_dmg = 1579, phy_def = 2673,
                magic_def = 1311, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 100,
                anti_control = 100},
      skills =>
          [{40001, 63},
           {40002, 63},
           {40003, 63},
           {40004, 63},
           {40005, 63},
           {40006, 63},
           {40007, 63}]};
get({64, 4}) ->
    #{attr =>
          #attr{hp_max = 15229, mp_max = 1107, atk_speed = 255,
                phy_dmg = 2181, magic_dmg = 1596, phy_def = 2738,
                magic_def = 1346, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 105,
                anti_control = 105},
      skills =>
          [{40001, 64},
           {40002, 64},
           {40003, 64},
           {40004, 64},
           {40005, 64},
           {40006, 64},
           {40007, 64}]};
get({65, 4}) ->
    #{attr =>
          #attr{hp_max = 15720, mp_max = 1153, atk_speed = 267,
                phy_dmg = 2248, magic_dmg = 1622, phy_def = 2837,
                magic_def = 1400, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 112,
                anti_control = 112},
      skills =>
          [{40001, 65},
           {40002, 65},
           {40003, 65},
           {40004, 65},
           {40005, 65},
           {40006, 65},
           {40007, 65}]};
get({66, 4}) ->
    #{attr =>
          #attr{hp_max = 15874, mp_max = 1158, atk_speed = 271,
                phy_dmg = 2281, magic_dmg = 1653, phy_def = 2866,
                magic_def = 1415, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 112,
                anti_control = 112},
      skills =>
          [{40001, 66},
           {40002, 66},
           {40003, 66},
           {40004, 66},
           {40005, 66},
           {40006, 66},
           {40007, 66}]};
get({67, 4}) ->
    #{attr =>
          #attr{hp_max = 16184, mp_max = 1169, atk_speed = 280,
                phy_dmg = 2348, magic_dmg = 1713, phy_def = 2924,
                magic_def = 1447, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 113,
                anti_control = 113},
      skills =>
          [{40001, 67},
           {40002, 67},
           {40003, 67},
           {40004, 67},
           {40005, 67},
           {40006, 67},
           {40007, 67}]};
get({68, 4}) ->
    #{attr =>
          #attr{hp_max = 16494, mp_max = 1180, atk_speed = 289,
                phy_dmg = 2415, magic_dmg = 1774, phy_def = 2982,
                magic_def = 1480, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 114,
                anti_control = 114},
      skills =>
          [{40001, 68},
           {40002, 68},
           {40003, 68},
           {40004, 68},
           {40005, 68},
           {40006, 68},
           {40007, 68}]};
get({69, 4}) ->
    #{attr =>
          #attr{hp_max = 16803, mp_max = 1190, atk_speed = 298,
                phy_dmg = 2483, magic_dmg = 1835, phy_def = 3039,
                magic_def = 1512, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 114,
                anti_control = 114},
      skills =>
          [{40001, 69},
           {40002, 69},
           {40003, 69},
           {40004, 69},
           {40005, 69},
           {40006, 69},
           {40007, 69}]};
get({70, 4}) ->
    #{attr =>
          #attr{hp_max = 17268, mp_max = 1207, atk_speed = 312,
                phy_dmg = 2584, magic_dmg = 1927, phy_def = 3126,
                magic_def = 1560, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 116,
                anti_control = 116},
      skills =>
          [{40001, 70},
           {40002, 70},
           {40003, 70},
           {40004, 70},
           {40005, 70},
           {40006, 70},
           {40007, 70}]};
get({71, 4}) ->
    #{attr =>
          #attr{hp_max = 17523, mp_max = 1224, atk_speed = 316,
                phy_dmg = 2622, magic_dmg = 1955, phy_def = 3172,
                magic_def = 1583, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 117,
                anti_control = 117},
      skills =>
          [{40001, 71},
           {40002, 71},
           {40003, 71},
           {40004, 71},
           {40005, 71},
           {40006, 71},
           {40007, 71}]};
get({72, 4}) ->
    #{attr =>
          #attr{hp_max = 17779, mp_max = 1242, atk_speed = 321,
                phy_dmg = 2660, magic_dmg = 1984, phy_def = 3218,
                magic_def = 1606, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 119,
                anti_control = 119},
      skills =>
          [{40001, 72},
           {40002, 72},
           {40003, 72},
           {40004, 72},
           {40005, 72},
           {40006, 72},
           {40007, 72}]};
get({73, 4}) ->
    #{attr =>
          #attr{hp_max = 18035, mp_max = 1260, atk_speed = 325,
                phy_dmg = 2698, magic_dmg = 2012, phy_def = 3264,
                magic_def = 1629, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 121,
                anti_control = 121},
      skills =>
          [{40001, 73},
           {40002, 73},
           {40003, 73},
           {40004, 73},
           {40005, 73},
           {40006, 73},
           {40007, 73}]};
get({74, 4}) ->
    #{attr =>
          #attr{hp_max = 18291, mp_max = 1278, atk_speed = 330,
                phy_dmg = 2737, magic_dmg = 2041, phy_def = 3311,
                magic_def = 1652, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 122,
                anti_control = 122},
      skills =>
          [{40001, 74},
           {40002, 74},
           {40003, 74},
           {40004, 74},
           {40005, 74},
           {40006, 74},
           {40007, 74}]};
get({75, 4}) ->
    #{attr =>
          #attr{hp_max = 18547, mp_max = 1296, atk_speed = 335,
                phy_dmg = 2775, magic_dmg = 2069, phy_def = 3357,
                magic_def = 1675, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 124,
                anti_control = 124},
      skills =>
          [{40001, 75},
           {40002, 75},
           {40003, 75},
           {40004, 75},
           {40005, 75},
           {40006, 75},
           {40007, 75}]};
get({76, 4}) ->
    #{attr =>
          #attr{hp_max = 18802, mp_max = 1314, atk_speed = 339,
                phy_dmg = 2813, magic_dmg = 2098, phy_def = 3403,
                magic_def = 1698, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 126,
                anti_control = 126},
      skills =>
          [{40001, 76},
           {40002, 76},
           {40003, 76},
           {40004, 76},
           {40005, 76},
           {40006, 76},
           {40007, 76}]};
get({77, 4}) ->
    #{attr =>
          #attr{hp_max = 19058, mp_max = 1332, atk_speed = 344,
                phy_dmg = 2851, magic_dmg = 2126, phy_def = 3450,
                magic_def = 1721, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 128,
                anti_control = 128},
      skills =>
          [{40001, 77},
           {40002, 77},
           {40003, 77},
           {40004, 77},
           {40005, 77},
           {40006, 77},
           {40007, 77}]};
get({78, 4}) ->
    #{attr =>
          #attr{hp_max = 19314, mp_max = 1350, atk_speed = 348,
                phy_dmg = 2890, magic_dmg = 2155, phy_def = 3496,
                magic_def = 1744, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 129,
                anti_control = 129},
      skills =>
          [{40001, 78},
           {40002, 78},
           {40003, 78},
           {40004, 78},
           {40005, 78},
           {40006, 78},
           {40007, 78}]};
get({79, 4}) ->
    #{attr =>
          #attr{hp_max = 19570, mp_max = 1367, atk_speed = 353,
                phy_dmg = 2928, magic_dmg = 2183, phy_def = 3542,
                magic_def = 1768, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 131,
                anti_control = 131},
      skills =>
          [{40001, 79},
           {40002, 79},
           {40003, 79},
           {40004, 79},
           {40005, 79},
           {40006, 79},
           {40007, 79}]};
get({80, 4}) ->
    #{attr =>
          #attr{hp_max = 19826, mp_max = 1385, atk_speed = 358,
                phy_dmg = 2966, magic_dmg = 2212, phy_def = 3589,
                magic_def = 1791, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 133,
                anti_control = 133},
      skills =>
          [{40001, 80},
           {40002, 80},
           {40003, 80},
           {40004, 80},
           {40005, 80},
           {40006, 80},
           {40007, 80}]};
get({81, 4}) ->
    #{attr =>
          #attr{hp_max = 20082, mp_max = 1403, atk_speed = 362,
                phy_dmg = 3005, magic_dmg = 2241, phy_def = 3635,
                magic_def = 1814, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 134,
                anti_control = 134},
      skills =>
          [{40001, 80},
           {40002, 80},
           {40003, 80},
           {40004, 80},
           {40005, 80},
           {40006, 80},
           {40007, 80}]};
get({82, 4}) ->
    #{attr =>
          #attr{hp_max = 20337, mp_max = 1421, atk_speed = 367,
                phy_dmg = 3043, magic_dmg = 2269, phy_def = 3681,
                magic_def = 1837, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 136,
                anti_control = 136},
      skills =>
          [{40001, 80},
           {40002, 80},
           {40003, 80},
           {40004, 80},
           {40005, 80},
           {40006, 80},
           {40007, 80}]};
get({83, 4}) ->
    #{attr =>
          #attr{hp_max = 20593, mp_max = 1439, atk_speed = 372,
                phy_dmg = 3081, magic_dmg = 2298, phy_def = 3728,
                magic_def = 1860, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 138,
                anti_control = 138},
      skills =>
          [{40001, 80},
           {40002, 80},
           {40003, 80},
           {40004, 80},
           {40005, 80},
           {40006, 80},
           {40007, 80}]};
get({84, 4}) ->
    #{attr =>
          #attr{hp_max = 20849, mp_max = 1457, atk_speed = 376,
                phy_dmg = 3119, magic_dmg = 2326, phy_def = 3774,
                magic_def = 1883, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 140,
                anti_control = 140},
      skills =>
          [{40001, 80},
           {40002, 80},
           {40003, 80},
           {40004, 80},
           {40005, 80},
           {40006, 80},
           {40007, 80}]};
get({85, 4}) ->
    #{attr =>
          #attr{hp_max = 21105, mp_max = 1475, atk_speed = 381,
                phy_dmg = 3158, magic_dmg = 2355, phy_def = 3820,
                magic_def = 1906, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 141,
                anti_control = 141},
      skills =>
          [{40001, 80},
           {40002, 80},
           {40003, 80},
           {40004, 80},
           {40005, 80},
           {40006, 80},
           {40007, 80}]};
get({86, 4}) ->
    #{attr =>
          #attr{hp_max = 21361, mp_max = 1493, atk_speed = 385,
                phy_dmg = 3196, magic_dmg = 2383, phy_def = 3866,
                magic_def = 1929, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 143,
                anti_control = 143},
      skills =>
          [{40001, 80},
           {40002, 80},
           {40003, 80},
           {40004, 80},
           {40005, 80},
           {40006, 80},
           {40007, 80}]};
get({87, 4}) ->
    #{attr =>
          #attr{hp_max = 21616, mp_max = 1510, atk_speed = 390,
                phy_dmg = 3234, magic_dmg = 2412, phy_def = 3913,
                magic_def = 1952, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 145,
                anti_control = 145},
      skills =>
          [{40001, 80},
           {40002, 80},
           {40003, 80},
           {40004, 80},
           {40005, 80},
           {40006, 80},
           {40007, 80}]};
get({88, 4}) ->
    #{attr =>
          #attr{hp_max = 21872, mp_max = 1528, atk_speed = 395,
                phy_dmg = 3273, magic_dmg = 2440, phy_def = 3959,
                magic_def = 1976, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 146,
                anti_control = 146},
      skills =>
          [{40001, 80},
           {40002, 80},
           {40003, 80},
           {40004, 80},
           {40005, 80},
           {40006, 80},
           {40007, 80}]};
get({89, 4}) ->
    #{attr =>
          #attr{hp_max = 22128, mp_max = 1546, atk_speed = 399,
                phy_dmg = 3311, magic_dmg = 2469, phy_def = 4005,
                magic_def = 1999, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 148,
                anti_control = 148},
      skills =>
          [{40001, 80},
           {40002, 80},
           {40003, 80},
           {40004, 80},
           {40005, 80},
           {40006, 80},
           {40007, 80}]};
get({90, 4}) ->
    #{attr =>
          #attr{hp_max = 22384, mp_max = 1564, atk_speed = 404,
                phy_dmg = 3349, magic_dmg = 2497, phy_def = 4052,
                magic_def = 2022, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 150,
                anti_control = 150},
      skills =>
          [{40001, 80},
           {40002, 80},
           {40003, 80},
           {40004, 80},
           {40005, 80},
           {40006, 80},
           {40007, 80}]};
get({91, 4}) ->
    #{attr =>
          #attr{hp_max = 22576, mp_max = 1578, atk_speed = 407,
                phy_dmg = 3378, magic_dmg = 2519, phy_def = 4086,
                magic_def = 2039, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 151,
                anti_control = 151},
      skills =>
          [{40001, 80},
           {40002, 80},
           {40003, 80},
           {40004, 80},
           {40005, 80},
           {40006, 80},
           {40007, 80}]};
get({92, 4}) ->
    #{attr =>
          #attr{hp_max = 22768, mp_max = 1591, atk_speed = 411,
                phy_dmg = 3407, magic_dmg = 2540, phy_def = 4121,
                magic_def = 2056, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 152,
                anti_control = 152},
      skills =>
          [{40001, 80},
           {40002, 80},
           {40003, 80},
           {40004, 80},
           {40005, 80},
           {40006, 80},
           {40007, 80}]};
get({93, 4}) ->
    #{attr =>
          #attr{hp_max = 22960, mp_max = 1604, atk_speed = 414,
                phy_dmg = 3435, magic_dmg = 2562, phy_def = 4156,
                magic_def = 2074, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 154,
                anti_control = 154},
      skills =>
          [{40001, 80},
           {40002, 80},
           {40003, 80},
           {40004, 80},
           {40005, 80},
           {40006, 80},
           {40007, 80}]};
get({94, 4}) ->
    #{attr =>
          #attr{hp_max = 23151, mp_max = 1618, atk_speed = 418,
                phy_dmg = 3464, magic_dmg = 2583, phy_def = 4191,
                magic_def = 2091, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 155,
                anti_control = 155},
      skills =>
          [{40001, 80},
           {40002, 80},
           {40003, 80},
           {40004, 80},
           {40005, 80},
           {40006, 80},
           {40007, 80}]};
get({95, 4}) ->
    #{attr =>
          #attr{hp_max = 23343, mp_max = 1631, atk_speed = 421,
                phy_dmg = 3493, magic_dmg = 2605, phy_def = 4225,
                magic_def = 2108, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 156,
                anti_control = 156},
      skills =>
          [{40001, 80},
           {40002, 80},
           {40003, 80},
           {40004, 80},
           {40005, 80},
           {40006, 80},
           {40007, 80}]};
get({96, 4}) ->
    #{attr =>
          #attr{hp_max = 23535, mp_max = 1645, atk_speed = 425,
                phy_dmg = 3521, magic_dmg = 2626, phy_def = 4260,
                magic_def = 2126, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 158,
                anti_control = 158},
      skills =>
          [{40001, 80},
           {40002, 80},
           {40003, 80},
           {40004, 80},
           {40005, 80},
           {40006, 80},
           {40007, 80}]};
get({97, 4}) ->
    #{attr =>
          #attr{hp_max = 23727, mp_max = 1658, atk_speed = 428,
                phy_dmg = 3550, magic_dmg = 2647, phy_def = 4295,
                magic_def = 2143, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 159,
                anti_control = 159},
      skills =>
          [{40001, 80},
           {40002, 80},
           {40003, 80},
           {40004, 80},
           {40005, 80},
           {40006, 80},
           {40007, 80}]};
get({98, 4}) ->
    #{attr =>
          #attr{hp_max = 23919, mp_max = 1671, atk_speed = 432,
                phy_dmg = 3579, magic_dmg = 2669, phy_def = 4330,
                magic_def = 2160, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 160,
                anti_control = 160},
      skills =>
          [{40001, 80},
           {40002, 80},
           {40003, 80},
           {40004, 80},
           {40005, 80},
           {40006, 80},
           {40007, 80}]};
get({99, 4}) ->
    #{attr =>
          #attr{hp_max = 24111, mp_max = 1685, atk_speed = 435,
                phy_dmg = 3608, magic_dmg = 2690, phy_def = 4364,
                magic_def = 2178, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 161,
                anti_control = 161},
      skills =>
          [{40001, 80},
           {40002, 80},
           {40003, 80},
           {40004, 80},
           {40005, 80},
           {40006, 80},
           {40007, 80}]};
get({100, 4}) ->
    #{attr =>
          #attr{hp_max = 24303, mp_max = 1698, atk_speed = 439,
                phy_dmg = 3636, magic_dmg = 2712, phy_def = 4399,
                magic_def = 2195, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 163,
                anti_control = 163},
      skills =>
          [{40001, 80},
           {40002, 80},
           {40003, 80},
           {40004, 80},
           {40005, 80},
           {40006, 80},
           {40007, 80}]};
get({101, 4}) ->
    #{attr =>
          #attr{hp_max = 24494, mp_max = 1712, atk_speed = 442,
                phy_dmg = 3665, magic_dmg = 2733, phy_def = 4434,
                magic_def = 2212, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 164,
                anti_control = 164},
      skills =>
          [{40001, 80},
           {40002, 80},
           {40003, 80},
           {40004, 80},
           {40005, 80},
           {40006, 80},
           {40007, 80}]};
get({102, 4}) ->
    #{attr =>
          #attr{hp_max = 24686, mp_max = 1725, atk_speed = 446,
                phy_dmg = 3694, magic_dmg = 2754, phy_def = 4469,
                magic_def = 2230, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 165,
                anti_control = 165},
      skills =>
          [{40001, 80},
           {40002, 80},
           {40003, 80},
           {40004, 80},
           {40005, 80},
           {40006, 80},
           {40007, 80}]};
get({103, 4}) ->
    #{attr =>
          #attr{hp_max = 24878, mp_max = 1738, atk_speed = 449,
                phy_dmg = 3722, magic_dmg = 2776, phy_def = 4503,
                magic_def = 2247, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 167,
                anti_control = 167},
      skills =>
          [{40001, 80},
           {40002, 80},
           {40003, 80},
           {40004, 80},
           {40005, 80},
           {40006, 80},
           {40007, 80}]};
get({104, 4}) ->
    #{attr =>
          #attr{hp_max = 25070, mp_max = 1752, atk_speed = 452,
                phy_dmg = 3751, magic_dmg = 2797, phy_def = 4538,
                magic_def = 2264, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 168,
                anti_control = 168},
      skills =>
          [{40001, 80},
           {40002, 80},
           {40003, 80},
           {40004, 80},
           {40005, 80},
           {40006, 80},
           {40007, 80}]};
get({105, 4}) ->
    #{attr =>
          #attr{hp_max = 25262, mp_max = 1765, atk_speed = 456,
                phy_dmg = 3780, magic_dmg = 2819, phy_def = 4573,
                magic_def = 2282, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 169,
                anti_control = 169},
      skills =>
          [{40001, 80},
           {40002, 80},
           {40003, 80},
           {40004, 80},
           {40005, 80},
           {40006, 80},
           {40007, 80}]};
get({106, 4}) ->
    #{attr =>
          #attr{hp_max = 25454, mp_max = 1779, atk_speed = 459,
                phy_dmg = 3809, magic_dmg = 2840, phy_def = 4607,
                magic_def = 2299, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 170,
                anti_control = 170},
      skills =>
          [{40001, 80},
           {40002, 80},
           {40003, 80},
           {40004, 80},
           {40005, 80},
           {40006, 80},
           {40007, 80}]};
get({107, 4}) ->
    #{attr =>
          #attr{hp_max = 25646, mp_max = 1792, atk_speed = 463,
                phy_dmg = 3837, magic_dmg = 2861, phy_def = 4642,
                magic_def = 2316, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 172,
                anti_control = 172},
      skills =>
          [{40001, 80},
           {40002, 80},
           {40003, 80},
           {40004, 80},
           {40005, 80},
           {40006, 80},
           {40007, 80}]};
get({108, 4}) ->
    #{attr =>
          #attr{hp_max = 25838, mp_max = 1806, atk_speed = 466,
                phy_dmg = 3866, magic_dmg = 2883, phy_def = 4677,
                magic_def = 2334, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 173,
                anti_control = 173},
      skills =>
          [{40001, 80},
           {40002, 80},
           {40003, 80},
           {40004, 80},
           {40005, 80},
           {40006, 80},
           {40007, 80}]};
get({109, 4}) ->
    #{attr =>
          #attr{hp_max = 26029, mp_max = 1819, atk_speed = 470,
                phy_dmg = 3895, magic_dmg = 2904, phy_def = 4712,
                magic_def = 2351, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 174,
                anti_control = 174},
      skills =>
          [{40001, 80},
           {40002, 80},
           {40003, 80},
           {40004, 80},
           {40005, 80},
           {40006, 80},
           {40007, 80}]};
get({110, 4}) ->
    #{attr =>
          #attr{hp_max = 26221, mp_max = 1832, atk_speed = 473,
                phy_dmg = 3923, magic_dmg = 2926, phy_def = 4746,
                magic_def = 2368, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{40001, 80},
           {40002, 80},
           {40003, 80},
           {40004, 80},
           {40005, 80},
           {40006, 80},
           {40007, 80}]};
get({111, 4}) ->
    #{attr =>
          #attr{hp_max = 26221, mp_max = 1832, atk_speed = 473,
                phy_dmg = 3923, magic_dmg = 2926, phy_def = 4746,
                magic_def = 2368, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{40001, 80},
           {40002, 80},
           {40003, 80},
           {40004, 80},
           {40005, 80},
           {40006, 80},
           {40007, 80}]};
get({112, 4}) ->
    #{attr =>
          #attr{hp_max = 26221, mp_max = 1832, atk_speed = 473,
                phy_dmg = 3923, magic_dmg = 2926, phy_def = 4746,
                magic_def = 2368, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{40001, 80},
           {40002, 80},
           {40003, 80},
           {40004, 80},
           {40005, 80},
           {40006, 80},
           {40007, 80}]};
get({113, 4}) ->
    #{attr =>
          #attr{hp_max = 26221, mp_max = 1832, atk_speed = 473,
                phy_dmg = 3923, magic_dmg = 2926, phy_def = 4746,
                magic_def = 2368, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{40001, 80},
           {40002, 80},
           {40003, 80},
           {40004, 80},
           {40005, 80},
           {40006, 80},
           {40007, 80}]};
get({114, 4}) ->
    #{attr =>
          #attr{hp_max = 26221, mp_max = 1832, atk_speed = 473,
                phy_dmg = 3923, magic_dmg = 2926, phy_def = 4746,
                magic_def = 2368, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{40001, 80},
           {40002, 80},
           {40003, 80},
           {40004, 80},
           {40005, 80},
           {40006, 80},
           {40007, 80}]};
get({115, 4}) ->
    #{attr =>
          #attr{hp_max = 26221, mp_max = 1832, atk_speed = 473,
                phy_dmg = 3923, magic_dmg = 2926, phy_def = 4746,
                magic_def = 2368, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{40001, 80},
           {40002, 80},
           {40003, 80},
           {40004, 80},
           {40005, 80},
           {40006, 80},
           {40007, 80}]};
get({116, 4}) ->
    #{attr =>
          #attr{hp_max = 26221, mp_max = 1832, atk_speed = 473,
                phy_dmg = 3923, magic_dmg = 2926, phy_def = 4746,
                magic_def = 2368, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{40001, 80},
           {40002, 80},
           {40003, 80},
           {40004, 80},
           {40005, 80},
           {40006, 80},
           {40007, 80}]};
get({117, 4}) ->
    #{attr =>
          #attr{hp_max = 26221, mp_max = 1832, atk_speed = 473,
                phy_dmg = 3923, magic_dmg = 2926, phy_def = 4746,
                magic_def = 2368, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{40001, 80},
           {40002, 80},
           {40003, 80},
           {40004, 80},
           {40005, 80},
           {40006, 80},
           {40007, 80}]};
get({118, 4}) ->
    #{attr =>
          #attr{hp_max = 26221, mp_max = 1832, atk_speed = 473,
                phy_dmg = 3923, magic_dmg = 2926, phy_def = 4746,
                magic_def = 2368, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{40001, 80},
           {40002, 80},
           {40003, 80},
           {40004, 80},
           {40005, 80},
           {40006, 80},
           {40007, 80}]};
get({119, 4}) ->
    #{attr =>
          #attr{hp_max = 26221, mp_max = 1832, atk_speed = 473,
                phy_dmg = 3923, magic_dmg = 2926, phy_def = 4746,
                magic_def = 2368, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{40001, 80},
           {40002, 80},
           {40003, 80},
           {40004, 80},
           {40005, 80},
           {40006, 80},
           {40007, 80}]};
get({120, 4}) ->
    #{attr =>
          #attr{hp_max = 26221, mp_max = 1832, atk_speed = 473,
                phy_dmg = 3923, magic_dmg = 2926, phy_def = 4746,
                magic_def = 2368, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{40001, 80},
           {40002, 80},
           {40003, 80},
           {40004, 80},
           {40005, 80},
           {40006, 80},
           {40007, 80}]};
get({121, 4}) ->
    #{attr =>
          #attr{hp_max = 26221, mp_max = 1832, atk_speed = 473,
                phy_dmg = 3923, magic_dmg = 2926, phy_def = 4746,
                magic_def = 2368, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{40001, 80},
           {40002, 80},
           {40003, 80},
           {40004, 80},
           {40005, 80},
           {40006, 80},
           {40007, 80}]};
get({122, 4}) ->
    #{attr =>
          #attr{hp_max = 26221, mp_max = 1832, atk_speed = 473,
                phy_dmg = 3923, magic_dmg = 2926, phy_def = 4746,
                magic_def = 2368, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{40001, 80},
           {40002, 80},
           {40003, 80},
           {40004, 80},
           {40005, 80},
           {40006, 80},
           {40007, 80}]};
get({123, 4}) ->
    #{attr =>
          #attr{hp_max = 26221, mp_max = 1832, atk_speed = 473,
                phy_dmg = 3923, magic_dmg = 2926, phy_def = 4746,
                magic_def = 2368, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{40001, 80},
           {40002, 80},
           {40003, 80},
           {40004, 80},
           {40005, 80},
           {40006, 80},
           {40007, 80}]};
get({124, 4}) ->
    #{attr =>
          #attr{hp_max = 26221, mp_max = 1832, atk_speed = 473,
                phy_dmg = 3923, magic_dmg = 2926, phy_def = 4746,
                magic_def = 2368, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{40001, 80},
           {40002, 80},
           {40003, 80},
           {40004, 80},
           {40005, 80},
           {40006, 80},
           {40007, 80}]};
get({125, 4}) ->
    #{attr =>
          #attr{hp_max = 26221, mp_max = 1832, atk_speed = 473,
                phy_dmg = 3923, magic_dmg = 2926, phy_def = 4746,
                magic_def = 2368, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{40001, 80},
           {40002, 80},
           {40003, 80},
           {40004, 80},
           {40005, 80},
           {40006, 80},
           {40007, 80}]};
get({126, 4}) ->
    #{attr =>
          #attr{hp_max = 26221, mp_max = 1832, atk_speed = 473,
                phy_dmg = 3923, magic_dmg = 2926, phy_def = 4746,
                magic_def = 2368, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{40001, 80},
           {40002, 80},
           {40003, 80},
           {40004, 80},
           {40005, 80},
           {40006, 80},
           {40007, 80}]};
get({127, 4}) ->
    #{attr =>
          #attr{hp_max = 26221, mp_max = 1832, atk_speed = 473,
                phy_dmg = 3923, magic_dmg = 2926, phy_def = 4746,
                magic_def = 2368, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{40001, 80},
           {40002, 80},
           {40003, 80},
           {40004, 80},
           {40005, 80},
           {40006, 80},
           {40007, 80}]};
get({128, 4}) ->
    #{attr =>
          #attr{hp_max = 26221, mp_max = 1832, atk_speed = 473,
                phy_dmg = 3923, magic_dmg = 2926, phy_def = 4746,
                magic_def = 2368, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{40001, 80},
           {40002, 80},
           {40003, 80},
           {40004, 80},
           {40005, 80},
           {40006, 80},
           {40007, 80}]};
get({129, 4}) ->
    #{attr =>
          #attr{hp_max = 26221, mp_max = 1832, atk_speed = 473,
                phy_dmg = 3923, magic_dmg = 2926, phy_def = 4746,
                magic_def = 2368, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{40001, 80},
           {40002, 80},
           {40003, 80},
           {40004, 80},
           {40005, 80},
           {40006, 80},
           {40007, 80}]};
get({130, 4}) ->
    #{attr =>
          #attr{hp_max = 26221, mp_max = 1832, atk_speed = 473,
                phy_dmg = 3923, magic_dmg = 2926, phy_def = 4746,
                magic_def = 2368, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{40001, 80},
           {40002, 80},
           {40003, 80},
           {40004, 80},
           {40005, 80},
           {40006, 80},
           {40007, 80}]};
get({20, 5}) ->
    #{attr =>
          #attr{hp_max = 2769, mp_max = 390, atk_speed = 87,
                phy_dmg = 466, magic_dmg = 355, phy_def = 418,
                magic_def = 181, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 26, anti_control = 26},
      skills => [{50001, 20}, {50002, 20}, {50003, 20}]};
get({21, 5}) ->
    #{attr =>
          #attr{hp_max = 2828, mp_max = 390, atk_speed = 90,
                phy_dmg = 467, magic_dmg = 356, phy_def = 425,
                magic_def = 183, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 26, anti_control = 26},
      skills => [{50001, 21}, {50002, 21}, {50003, 21}]};
get({22, 5}) ->
    #{attr =>
          #attr{hp_max = 2946, mp_max = 390, atk_speed = 97,
                phy_dmg = 471, magic_dmg = 360, phy_def = 439,
                magic_def = 188, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 26, anti_control = 26},
      skills => [{50001, 22}, {50002, 22}, {50003, 22}]};
get({23, 5}) ->
    #{attr =>
          #attr{hp_max = 3065, mp_max = 390, atk_speed = 105,
                phy_dmg = 474, magic_dmg = 362, phy_def = 455,
                magic_def = 192, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 26, anti_control = 26},
      skills => [{50001, 23}, {50002, 23}, {50003, 23}]};
get({24, 5}) ->
    #{attr =>
          #attr{hp_max = 3183, mp_max = 390, atk_speed = 112,
                phy_dmg = 476, magic_dmg = 365, phy_def = 469,
                magic_def = 197, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 26, anti_control = 26},
      skills => [{50001, 24}, {50002, 24}, {50003, 24}]};
get({25, 5}) ->
    #{attr =>
          #attr{hp_max = 3361, mp_max = 390, atk_speed = 123,
                phy_dmg = 482, magic_dmg = 371, phy_def = 491,
                magic_def = 205, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 26, anti_control = 26},
      skills =>
          [{50001, 25}, {50002, 25}, {50003, 25}, {50004, 25}]};
get({26, 5}) ->
    #{attr =>
          #attr{hp_max = 3445, mp_max = 397, atk_speed = 126,
                phy_dmg = 508, magic_dmg = 390, phy_def = 505,
                magic_def = 211, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 27, anti_control = 27},
      skills =>
          [{50001, 26}, {50002, 26}, {50003, 26}, {50004, 26}]};
get({27, 5}) ->
    #{attr =>
          #attr{hp_max = 3614, mp_max = 413, atk_speed = 132,
                phy_dmg = 559, magic_dmg = 429, phy_def = 533,
                magic_def = 226, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 30, anti_control = 30},
      skills =>
          [{50001, 27}, {50002, 27}, {50003, 27}, {50004, 27}]};
get({28, 5}) ->
    #{attr =>
          #attr{hp_max = 3783, mp_max = 429, atk_speed = 138,
                phy_dmg = 611, magic_dmg = 468, phy_def = 563,
                magic_def = 240, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 33, anti_control = 33},
      skills =>
          [{50001, 28}, {50002, 28}, {50003, 28}, {50004, 28}]};
get({29, 5}) ->
    #{attr =>
          #attr{hp_max = 3951, mp_max = 444, atk_speed = 144,
                phy_dmg = 663, magic_dmg = 507, phy_def = 592,
                magic_def = 254, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 36, anti_control = 36},
      skills =>
          [{50001, 29}, {50002, 29}, {50003, 29}, {50004, 29}]};
get({30, 5}) ->
    #{attr =>
          #attr{hp_max = 4204, mp_max = 468, atk_speed = 153,
                phy_dmg = 741, magic_dmg = 566, phy_def = 636,
                magic_def = 276, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 41, anti_control = 41},
      skills =>
          [{50001, 30}, {50002, 30}, {50003, 30}, {50004, 30}]};
get({31, 5}) ->
    #{attr =>
          #attr{hp_max = 4263, mp_max = 468, atk_speed = 155,
                phy_dmg = 743, magic_dmg = 569, phy_def = 645,
                magic_def = 283, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 41, anti_control = 41},
      skills =>
          [{50001, 31}, {50002, 31}, {50003, 31}, {50004, 31}]};
get({32, 5}) ->
    #{attr =>
          #attr{hp_max = 4381, mp_max = 468, atk_speed = 159,
                phy_dmg = 749, magic_dmg = 574, phy_def = 662,
                magic_def = 297, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 41, anti_control = 41},
      skills =>
          [{50001, 32}, {50002, 32}, {50003, 32}, {50004, 32}]};
get({33, 5}) ->
    #{attr =>
          #attr{hp_max = 4500, mp_max = 468, atk_speed = 164,
                phy_dmg = 756, magic_dmg = 581, phy_def = 679,
                magic_def = 311, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 41, anti_control = 41},
      skills =>
          [{50001, 33}, {50002, 33}, {50003, 33}, {50004, 33}]};
get({34, 5}) ->
    #{attr =>
          #attr{hp_max = 4618, mp_max = 468, atk_speed = 168,
                phy_dmg = 761, magic_dmg = 587, phy_def = 696,
                magic_def = 325, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 41, anti_control = 41},
      skills =>
          [{50001, 34}, {50002, 34}, {50003, 34}, {50004, 34}]};
get({35, 5}) ->
    #{attr =>
          #attr{hp_max = 4796, mp_max = 468, atk_speed = 175,
                phy_dmg = 771, magic_dmg = 596, phy_def = 722,
                magic_def = 347, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 41, anti_control = 41},
      skills =>
          [{50001, 35},
           {50002, 35},
           {50003, 35},
           {50004, 35},
           {50005, 35}]};
get({36, 5}) ->
    #{attr =>
          #attr{hp_max = 4963, mp_max = 468, atk_speed = 179,
                phy_dmg = 791, magic_dmg = 616, phy_def = 742,
                magic_def = 363, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 41, anti_control = 41},
      skills =>
          [{50001, 36},
           {50002, 36},
           {50003, 36},
           {50004, 36},
           {50005, 36}]};
get({37, 5}) ->
    #{attr =>
          #attr{hp_max = 5298, mp_max = 468, atk_speed = 188,
                phy_dmg = 832, magic_dmg = 658, phy_def = 783,
                magic_def = 397, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 41, anti_control = 41},
      skills =>
          [{50001, 37},
           {50002, 37},
           {50003, 37},
           {50004, 37},
           {50005, 37}]};
get({38, 5}) ->
    #{attr =>
          #attr{hp_max = 5633, mp_max = 468, atk_speed = 197,
                phy_dmg = 873, magic_dmg = 700, phy_def = 825,
                magic_def = 431, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 41, anti_control = 41},
      skills =>
          [{50001, 38},
           {50002, 38},
           {50003, 38},
           {50004, 38},
           {50005, 38}]};
get({39, 5}) ->
    #{attr =>
          #attr{hp_max = 5967, mp_max = 468, atk_speed = 205,
                phy_dmg = 912, magic_dmg = 741, phy_def = 866,
                magic_def = 464, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 41, anti_control = 41},
      skills =>
          [{50001, 39},
           {50002, 39},
           {50003, 39},
           {50004, 39},
           {50005, 39}]};
get({40, 5}) ->
    #{attr =>
          #attr{hp_max = 6470, mp_max = 468, atk_speed = 219,
                phy_dmg = 974, magic_dmg = 804, phy_def = 928,
                magic_def = 514, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 41, anti_control = 41},
      skills =>
          [{50001, 40},
           {50002, 40},
           {50003, 40},
           {50004, 40},
           {50005, 40}]};
get({41, 5}) ->
    #{attr =>
          #attr{hp_max = 6588, mp_max = 492, atk_speed = 224,
                phy_dmg = 987, magic_dmg = 810, phy_def = 943,
                magic_def = 532, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 42, anti_control = 42},
      skills =>
          [{50001, 41},
           {50002, 41},
           {50003, 41},
           {50004, 41},
           {50005, 41}]};
get({42, 5}) ->
    #{attr =>
          #attr{hp_max = 6823, mp_max = 541, atk_speed = 235,
                phy_dmg = 1012, magic_dmg = 822, phy_def = 975,
                magic_def = 567, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 45, anti_control = 45},
      skills =>
          [{50001, 42},
           {50002, 42},
           {50003, 42},
           {50004, 42},
           {50005, 42}]};
get({43, 5}) ->
    #{attr =>
          #attr{hp_max = 7059, mp_max = 590, atk_speed = 246,
                phy_dmg = 1038, magic_dmg = 835, phy_def = 1007,
                magic_def = 603, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 48, anti_control = 48},
      skills =>
          [{50001, 43},
           {50002, 43},
           {50003, 43},
           {50004, 43},
           {50005, 43}]};
get({44, 5}) ->
    #{attr =>
          #attr{hp_max = 7295, mp_max = 639, atk_speed = 256,
                phy_dmg = 1064, magic_dmg = 846, phy_def = 1040,
                magic_def = 638, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 51, anti_control = 51},
      skills =>
          [{50001, 44},
           {50002, 44},
           {50003, 44},
           {50004, 44},
           {50005, 44}]};
get({45, 5}) ->
    #{attr =>
          #attr{hp_max = 7649, mp_max = 713, atk_speed = 273,
                phy_dmg = 1102, magic_dmg = 865, phy_def = 1088,
                magic_def = 691, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 56, anti_control = 56},
      skills =>
          [{50001, 45},
           {50002, 45},
           {50003, 45},
           {50004, 45},
           {50005, 45},
           {50006, 45}]};
get({46, 5}) ->
    #{attr =>
          #attr{hp_max = 7756, mp_max = 720, atk_speed = 278,
                phy_dmg = 1132, magic_dmg = 893, phy_def = 1107,
                magic_def = 706, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 56, anti_control = 56},
      skills =>
          [{50001, 46},
           {50002, 46},
           {50003, 46},
           {50004, 46},
           {50005, 46},
           {50006, 46}]};
get({47, 5}) ->
    #{attr =>
          #attr{hp_max = 7971, mp_max = 734, atk_speed = 288,
                phy_dmg = 1191, magic_dmg = 948, phy_def = 1145,
                magic_def = 738, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 57, anti_control = 57},
      skills =>
          [{50001, 47},
           {50002, 47},
           {50003, 47},
           {50004, 47},
           {50005, 47},
           {50006, 47}]};
get({48, 5}) ->
    #{attr =>
          #attr{hp_max = 8187, mp_max = 749, atk_speed = 298,
                phy_dmg = 1251, magic_dmg = 1004, phy_def = 1183,
                magic_def = 770, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 59, anti_control = 59},
      skills =>
          [{50001, 48},
           {50002, 48},
           {50003, 48},
           {50004, 48},
           {50005, 48},
           {50006, 48}]};
get({49, 5}) ->
    #{attr =>
          #attr{hp_max = 8403, mp_max = 764, atk_speed = 308,
                phy_dmg = 1311, magic_dmg = 1060, phy_def = 1221,
                magic_def = 801, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 60, anti_control = 60},
      skills =>
          [{50001, 49},
           {50002, 49},
           {50003, 49},
           {50004, 49},
           {50005, 49},
           {50006, 49}]};
get({50, 5}) ->
    #{attr =>
          #attr{hp_max = 8726, mp_max = 786, atk_speed = 323,
                phy_dmg = 1400, magic_dmg = 1143, phy_def = 1279,
                magic_def = 849, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 62, anti_control = 62},
      skills =>
          [{50001, 50},
           {50002, 50},
           {50003, 50},
           {50004, 50},
           {50005, 50},
           {50006, 50}]};
get({51, 5}) ->
    #{attr =>
          #attr{hp_max = 8819, mp_max = 802, atk_speed = 327,
                phy_dmg = 1422, magic_dmg = 1155, phy_def = 1293,
                magic_def = 859, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 64, anti_control = 64},
      skills =>
          [{50001, 51},
           {50002, 51},
           {50003, 51},
           {50004, 51},
           {50005, 51},
           {50006, 51}]};
get({52, 5}) ->
    #{attr =>
          #attr{hp_max = 9005, mp_max = 835, atk_speed = 335,
                phy_dmg = 1465, magic_dmg = 1178, phy_def = 1324,
                magic_def = 880, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 68, anti_control = 68},
      skills =>
          [{50001, 52},
           {50002, 52},
           {50003, 52},
           {50004, 52},
           {50005, 52},
           {50006, 52}]};
get({53, 5}) ->
    #{attr =>
          #attr{hp_max = 9192, mp_max = 869, atk_speed = 344,
                phy_dmg = 1510, magic_dmg = 1200, phy_def = 1354,
                magic_def = 901, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 73, anti_control = 73},
      skills =>
          [{50001, 53},
           {50002, 53},
           {50003, 53},
           {50004, 53},
           {50005, 53},
           {50006, 53}]};
get({54, 5}) ->
    #{attr =>
          #attr{hp_max = 9378, mp_max = 902, atk_speed = 353,
                phy_dmg = 1554, magic_dmg = 1223, phy_def = 1385,
                magic_def = 922, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 78, anti_control = 78},
      skills =>
          [{50001, 54},
           {50002, 54},
           {50003, 54},
           {50004, 54},
           {50005, 54},
           {50006, 54}]};
get({55, 5}) ->
    #{attr =>
          #attr{hp_max = 9657, mp_max = 952, atk_speed = 366,
                phy_dmg = 1620, magic_dmg = 1258, phy_def = 1430,
                magic_def = 954, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 85, anti_control = 85},
      skills =>
          [{50001, 55},
           {50002, 55},
           {50003, 55},
           {50004, 55},
           {50005, 55},
           {50006, 55},
           {50007, 55}]};
get({56, 5}) ->
    #{attr =>
          #attr{hp_max = 9831, mp_max = 957, atk_speed = 369,
                phy_dmg = 1649, magic_dmg = 1286, phy_def = 1461,
                magic_def = 978, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 85, anti_control = 85},
      skills =>
          [{50001, 56},
           {50002, 56},
           {50003, 56},
           {50004, 56},
           {50005, 56},
           {50006, 56},
           {50007, 56}]};
get({57, 5}) ->
    #{attr =>
          #attr{hp_max = 10178, mp_max = 967, atk_speed = 376,
                phy_dmg = 1707, magic_dmg = 1342, phy_def = 1521,
                magic_def = 1027, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 86, anti_control = 86},
      skills =>
          [{50001, 57},
           {50002, 57},
           {50003, 57},
           {50004, 57},
           {50005, 57},
           {50006, 57},
           {50007, 57}]};
get({58, 5}) ->
    #{attr =>
          #attr{hp_max = 10525, mp_max = 977, atk_speed = 384,
                phy_dmg = 1765, magic_dmg = 1398, phy_def = 1582,
                magic_def = 1077, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 87, anti_control = 87},
      skills =>
          [{50001, 58},
           {50002, 58},
           {50003, 58},
           {50004, 58},
           {50005, 58},
           {50006, 58},
           {50007, 58}]};
get({59, 5}) ->
    #{attr =>
          #attr{hp_max = 10872, mp_max = 987, atk_speed = 391,
                phy_dmg = 1823, magic_dmg = 1453, phy_def = 1643,
                magic_def = 1125, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 87, anti_control = 87},
      skills =>
          [{50001, 59},
           {50002, 59},
           {50003, 59},
           {50004, 59},
           {50005, 59},
           {50006, 59},
           {50007, 59}]};
get({60, 5}) ->
    #{attr =>
          #attr{hp_max = 11394, mp_max = 1002, atk_speed = 402,
                phy_dmg = 1910, magic_dmg = 1538, phy_def = 1735,
                magic_def = 1199, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 89, anti_control = 89},
      skills =>
          [{50001, 60},
           {50002, 60},
           {50003, 60},
           {50004, 60},
           {50005, 60},
           {50006, 60},
           {50007, 60}]};
get({61, 5}) ->
    #{attr =>
          #attr{hp_max = 11538, mp_max = 1017, atk_speed = 407,
                phy_dmg = 1928, magic_dmg = 1545, phy_def = 1760,
                magic_def = 1216, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 91, anti_control = 91},
      skills =>
          [{50001, 61},
           {50002, 61},
           {50003, 61},
           {50004, 61},
           {50005, 61},
           {50006, 61},
           {50007, 61}]};
get({62, 5}) ->
    #{attr =>
          #attr{hp_max = 11827, mp_max = 1047, atk_speed = 417,
                phy_dmg = 1965, magic_dmg = 1562, phy_def = 1811,
                magic_def = 1252, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 95, anti_control = 95},
      skills =>
          [{50001, 62},
           {50002, 62},
           {50003, 62},
           {50004, 62},
           {50005, 62},
           {50006, 62},
           {50007, 62}]};
get({63, 5}) ->
    #{attr =>
          #attr{hp_max = 12117, mp_max = 1077, atk_speed = 427,
                phy_dmg = 2003, magic_dmg = 1579, phy_def = 1862,
                magic_def = 1287, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 100,
                anti_control = 100},
      skills =>
          [{50001, 63},
           {50002, 63},
           {50003, 63},
           {50004, 63},
           {50005, 63},
           {50006, 63},
           {50007, 63}]};
get({64, 5}) ->
    #{attr =>
          #attr{hp_max = 12405, mp_max = 1107, atk_speed = 437,
                phy_dmg = 2040, magic_dmg = 1596, phy_def = 1912,
                magic_def = 1322, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 105,
                anti_control = 105},
      skills =>
          [{50001, 64},
           {50002, 64},
           {50003, 64},
           {50004, 64},
           {50005, 64},
           {50006, 64},
           {50007, 64}]};
get({65, 5}) ->
    #{attr =>
          #attr{hp_max = 12840, mp_max = 1153, atk_speed = 452,
                phy_dmg = 2096, magic_dmg = 1622, phy_def = 1989,
                magic_def = 1375, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 112,
                anti_control = 112},
      skills =>
          [{50001, 65},
           {50002, 65},
           {50003, 65},
           {50004, 65},
           {50005, 65},
           {50006, 65},
           {50007, 65}]};
get({66, 5}) ->
    #{attr =>
          #attr{hp_max = 12963, mp_max = 1158, atk_speed = 458,
                phy_dmg = 2128, magic_dmg = 1653, phy_def = 2007,
                magic_def = 1390, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 112,
                anti_control = 112},
      skills =>
          [{50001, 66},
           {50002, 66},
           {50003, 66},
           {50004, 66},
           {50005, 66},
           {50006, 66},
           {50007, 66}]};
get({67, 5}) ->
    #{attr =>
          #attr{hp_max = 13212, mp_max = 1169, atk_speed = 470,
                phy_dmg = 2190, magic_dmg = 1713, phy_def = 2044,
                magic_def = 1423, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 113,
                anti_control = 113},
      skills =>
          [{50001, 67},
           {50002, 67},
           {50003, 67},
           {50004, 67},
           {50005, 67},
           {50006, 67},
           {50007, 67}]};
get({68, 5}) ->
    #{attr =>
          #attr{hp_max = 13460, mp_max = 1180, atk_speed = 483,
                phy_dmg = 2254, magic_dmg = 1774, phy_def = 2082,
                magic_def = 1454, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 114,
                anti_control = 114},
      skills =>
          [{50001, 68},
           {50002, 68},
           {50003, 68},
           {50004, 68},
           {50005, 68},
           {50006, 68},
           {50007, 68}]};
get({69, 5}) ->
    #{attr =>
          #attr{hp_max = 13708, mp_max = 1190, atk_speed = 496,
                phy_dmg = 2318, magic_dmg = 1835, phy_def = 2119,
                magic_def = 1485, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 114,
                anti_control = 114},
      skills =>
          [{50001, 69},
           {50002, 69},
           {50003, 69},
           {50004, 69},
           {50005, 69},
           {50006, 69},
           {50007, 69}]};
get({70, 5}) ->
    #{attr =>
          #attr{hp_max = 14081, mp_max = 1207, atk_speed = 515,
                phy_dmg = 2413, magic_dmg = 1927, phy_def = 2175,
                magic_def = 1534, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 116,
                anti_control = 116},
      skills =>
          [{50001, 70},
           {50002, 70},
           {50003, 70},
           {50004, 70},
           {50005, 70},
           {50006, 70},
           {50007, 70}]};
get({71, 5}) ->
    #{attr =>
          #attr{hp_max = 14289, mp_max = 1224, atk_speed = 522,
                phy_dmg = 2448, magic_dmg = 1955, phy_def = 2207,
                magic_def = 1556, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 117,
                anti_control = 117},
      skills =>
          [{50001, 71},
           {50002, 71},
           {50003, 71},
           {50004, 71},
           {50005, 71},
           {50006, 71},
           {50007, 71}]};
get({72, 5}) ->
    #{attr =>
          #attr{hp_max = 14498, mp_max = 1242, atk_speed = 530,
                phy_dmg = 2484, magic_dmg = 1984, phy_def = 2239,
                magic_def = 1579, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 119,
                anti_control = 119},
      skills =>
          [{50001, 72},
           {50002, 72},
           {50003, 72},
           {50004, 72},
           {50005, 72},
           {50006, 72},
           {50007, 72}]};
get({73, 5}) ->
    #{attr =>
          #attr{hp_max = 14706, mp_max = 1260, atk_speed = 537,
                phy_dmg = 2520, magic_dmg = 2012, phy_def = 2271,
                magic_def = 1602, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 121,
                anti_control = 121},
      skills =>
          [{50001, 73},
           {50002, 73},
           {50003, 73},
           {50004, 73},
           {50005, 73},
           {50006, 73},
           {50007, 73}]};
get({74, 5}) ->
    #{attr =>
          #attr{hp_max = 14915, mp_max = 1278, atk_speed = 545,
                phy_dmg = 2555, magic_dmg = 2041, phy_def = 2303,
                magic_def = 1624, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 122,
                anti_control = 122},
      skills =>
          [{50001, 74},
           {50002, 74},
           {50003, 74},
           {50004, 74},
           {50005, 74},
           {50006, 74},
           {50007, 74}]};
get({75, 5}) ->
    #{attr =>
          #attr{hp_max = 15124, mp_max = 1296, atk_speed = 553,
                phy_dmg = 2591, magic_dmg = 2069, phy_def = 2336,
                magic_def = 1647, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 124,
                anti_control = 124},
      skills =>
          [{50001, 75},
           {50002, 75},
           {50003, 75},
           {50004, 75},
           {50005, 75},
           {50006, 75},
           {50007, 75}]};
get({76, 5}) ->
    #{attr =>
          #attr{hp_max = 15332, mp_max = 1314, atk_speed = 560,
                phy_dmg = 2627, magic_dmg = 2098, phy_def = 2368,
                magic_def = 1670, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 126,
                anti_control = 126},
      skills =>
          [{50001, 76},
           {50002, 76},
           {50003, 76},
           {50004, 76},
           {50005, 76},
           {50006, 76},
           {50007, 76}]};
get({77, 5}) ->
    #{attr =>
          #attr{hp_max = 15541, mp_max = 1332, atk_speed = 568,
                phy_dmg = 2663, magic_dmg = 2126, phy_def = 2400,
                magic_def = 1693, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 128,
                anti_control = 128},
      skills =>
          [{50001, 77},
           {50002, 77},
           {50003, 77},
           {50004, 77},
           {50005, 77},
           {50006, 77},
           {50007, 77}]};
get({78, 5}) ->
    #{attr =>
          #attr{hp_max = 15749, mp_max = 1350, atk_speed = 576,
                phy_dmg = 2698, magic_dmg = 2155, phy_def = 2432,
                magic_def = 1715, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 129,
                anti_control = 129},
      skills =>
          [{50001, 78},
           {50002, 78},
           {50003, 78},
           {50004, 78},
           {50005, 78},
           {50006, 78},
           {50007, 78}]};
get({79, 5}) ->
    #{attr =>
          #attr{hp_max = 15958, mp_max = 1367, atk_speed = 583,
                phy_dmg = 2734, magic_dmg = 2183, phy_def = 2465,
                magic_def = 1738, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 131,
                anti_control = 131},
      skills =>
          [{50001, 79},
           {50002, 79},
           {50003, 79},
           {50004, 79},
           {50005, 79},
           {50006, 79},
           {50007, 79}]};
get({80, 5}) ->
    #{attr =>
          #attr{hp_max = 16167, mp_max = 1385, atk_speed = 591,
                phy_dmg = 2770, magic_dmg = 2212, phy_def = 2497,
                magic_def = 1761, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 133,
                anti_control = 133},
      skills =>
          [{50001, 80},
           {50002, 80},
           {50003, 80},
           {50004, 80},
           {50005, 80},
           {50006, 80},
           {50007, 80}]};
get({81, 5}) ->
    #{attr =>
          #attr{hp_max = 16375, mp_max = 1403, atk_speed = 598,
                phy_dmg = 2806, magic_dmg = 2241, phy_def = 2529,
                magic_def = 1783, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 134,
                anti_control = 134},
      skills =>
          [{50001, 80},
           {50002, 80},
           {50003, 80},
           {50004, 80},
           {50005, 80},
           {50006, 80},
           {50007, 80}]};
get({82, 5}) ->
    #{attr =>
          #attr{hp_max = 16584, mp_max = 1421, atk_speed = 606,
                phy_dmg = 2841, magic_dmg = 2269, phy_def = 2561,
                magic_def = 1806, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 136,
                anti_control = 136},
      skills =>
          [{50001, 80},
           {50002, 80},
           {50003, 80},
           {50004, 80},
           {50005, 80},
           {50006, 80},
           {50007, 80}]};
get({83, 5}) ->
    #{attr =>
          #attr{hp_max = 16792, mp_max = 1439, atk_speed = 614,
                phy_dmg = 2877, magic_dmg = 2298, phy_def = 2593,
                magic_def = 1829, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 138,
                anti_control = 138},
      skills =>
          [{50001, 80},
           {50002, 80},
           {50003, 80},
           {50004, 80},
           {50005, 80},
           {50006, 80},
           {50007, 80}]};
get({84, 5}) ->
    #{attr =>
          #attr{hp_max = 17001, mp_max = 1457, atk_speed = 621,
                phy_dmg = 2913, magic_dmg = 2326, phy_def = 2626,
                magic_def = 1852, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 140,
                anti_control = 140},
      skills =>
          [{50001, 80},
           {50002, 80},
           {50003, 80},
           {50004, 80},
           {50005, 80},
           {50006, 80},
           {50007, 80}]};
get({85, 5}) ->
    #{attr =>
          #attr{hp_max = 17210, mp_max = 1475, atk_speed = 629,
                phy_dmg = 2949, magic_dmg = 2355, phy_def = 2658,
                magic_def = 1874, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 141,
                anti_control = 141},
      skills =>
          [{50001, 80},
           {50002, 80},
           {50003, 80},
           {50004, 80},
           {50005, 80},
           {50006, 80},
           {50007, 80}]};
get({86, 5}) ->
    #{attr =>
          #attr{hp_max = 17418, mp_max = 1493, atk_speed = 637,
                phy_dmg = 2984, magic_dmg = 2383, phy_def = 2690,
                magic_def = 1897, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 143,
                anti_control = 143},
      skills =>
          [{50001, 80},
           {50002, 80},
           {50003, 80},
           {50004, 80},
           {50005, 80},
           {50006, 80},
           {50007, 80}]};
get({87, 5}) ->
    #{attr =>
          #attr{hp_max = 17627, mp_max = 1510, atk_speed = 644,
                phy_dmg = 3020, magic_dmg = 2412, phy_def = 2722,
                magic_def = 1920, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 145,
                anti_control = 145},
      skills =>
          [{50001, 80},
           {50002, 80},
           {50003, 80},
           {50004, 80},
           {50005, 80},
           {50006, 80},
           {50007, 80}]};
get({88, 5}) ->
    #{attr =>
          #attr{hp_max = 17835, mp_max = 1528, atk_speed = 652,
                phy_dmg = 3056, magic_dmg = 2440, phy_def = 2755,
                magic_def = 1943, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 146,
                anti_control = 146},
      skills =>
          [{50001, 80},
           {50002, 80},
           {50003, 80},
           {50004, 80},
           {50005, 80},
           {50006, 80},
           {50007, 80}]};
get({89, 5}) ->
    #{attr =>
          #attr{hp_max = 18044, mp_max = 1546, atk_speed = 659,
                phy_dmg = 3092, magic_dmg = 2469, phy_def = 2787,
                magic_def = 1965, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 148,
                anti_control = 148},
      skills =>
          [{50001, 80},
           {50002, 80},
           {50003, 80},
           {50004, 80},
           {50005, 80},
           {50006, 80},
           {50007, 80}]};
get({90, 5}) ->
    #{attr =>
          #attr{hp_max = 18253, mp_max = 1564, atk_speed = 667,
                phy_dmg = 3127, magic_dmg = 2497, phy_def = 2819,
                magic_def = 1988, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 150,
                anti_control = 150},
      skills =>
          [{50001, 80},
           {50002, 80},
           {50003, 80},
           {50004, 80},
           {50005, 80},
           {50006, 80},
           {50007, 80}]};
get({91, 5}) ->
    #{attr =>
          #attr{hp_max = 18409, mp_max = 1578, atk_speed = 673,
                phy_dmg = 3154, magic_dmg = 2519, phy_def = 2843,
                magic_def = 2005, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 151,
                anti_control = 151},
      skills =>
          [{50001, 80},
           {50002, 80},
           {50003, 80},
           {50004, 80},
           {50005, 80},
           {50006, 80},
           {50007, 80}]};
get({92, 5}) ->
    #{attr =>
          #attr{hp_max = 18566, mp_max = 1591, atk_speed = 679,
                phy_dmg = 3181, magic_dmg = 2540, phy_def = 2867,
                magic_def = 2022, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 152,
                anti_control = 152},
      skills =>
          [{50001, 80},
           {50002, 80},
           {50003, 80},
           {50004, 80},
           {50005, 80},
           {50006, 80},
           {50007, 80}]};
get({93, 5}) ->
    #{attr =>
          #attr{hp_max = 18722, mp_max = 1604, atk_speed = 684,
                phy_dmg = 3208, magic_dmg = 2562, phy_def = 2891,
                magic_def = 2039, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 154,
                anti_control = 154},
      skills =>
          [{50001, 80},
           {50002, 80},
           {50003, 80},
           {50004, 80},
           {50005, 80},
           {50006, 80},
           {50007, 80}]};
get({94, 5}) ->
    #{attr =>
          #attr{hp_max = 18878, mp_max = 1618, atk_speed = 690,
                phy_dmg = 3235, magic_dmg = 2583, phy_def = 2916,
                magic_def = 2056, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 155,
                anti_control = 155},
      skills =>
          [{50001, 80},
           {50002, 80},
           {50003, 80},
           {50004, 80},
           {50005, 80},
           {50006, 80},
           {50007, 80}]};
get({95, 5}) ->
    #{attr =>
          #attr{hp_max = 19035, mp_max = 1631, atk_speed = 696,
                phy_dmg = 3262, magic_dmg = 2605, phy_def = 2940,
                magic_def = 2073, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 156,
                anti_control = 156},
      skills =>
          [{50001, 80},
           {50002, 80},
           {50003, 80},
           {50004, 80},
           {50005, 80},
           {50006, 80},
           {50007, 80}]};
get({96, 5}) ->
    #{attr =>
          #attr{hp_max = 19191, mp_max = 1645, atk_speed = 701,
                phy_dmg = 3288, magic_dmg = 2626, phy_def = 2964,
                magic_def = 2090, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 158,
                anti_control = 158},
      skills =>
          [{50001, 80},
           {50002, 80},
           {50003, 80},
           {50004, 80},
           {50005, 80},
           {50006, 80},
           {50007, 80}]};
get({97, 5}) ->
    #{attr =>
          #attr{hp_max = 19348, mp_max = 1658, atk_speed = 707,
                phy_dmg = 3315, magic_dmg = 2647, phy_def = 2988,
                magic_def = 2107, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 159,
                anti_control = 159},
      skills =>
          [{50001, 80},
           {50002, 80},
           {50003, 80},
           {50004, 80},
           {50005, 80},
           {50006, 80},
           {50007, 80}]};
get({98, 5}) ->
    #{attr =>
          #attr{hp_max = 19504, mp_max = 1671, atk_speed = 713,
                phy_dmg = 3342, magic_dmg = 2669, phy_def = 3012,
                magic_def = 2124, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 160,
                anti_control = 160},
      skills =>
          [{50001, 80},
           {50002, 80},
           {50003, 80},
           {50004, 80},
           {50005, 80},
           {50006, 80},
           {50007, 80}]};
get({99, 5}) ->
    #{attr =>
          #attr{hp_max = 19661, mp_max = 1685, atk_speed = 719,
                phy_dmg = 3369, magic_dmg = 2690, phy_def = 3036,
                magic_def = 2141, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 161,
                anti_control = 161},
      skills =>
          [{50001, 80},
           {50002, 80},
           {50003, 80},
           {50004, 80},
           {50005, 80},
           {50006, 80},
           {50007, 80}]};
get({100, 5}) ->
    #{attr =>
          #attr{hp_max = 19817, mp_max = 1698, atk_speed = 724,
                phy_dmg = 3396, magic_dmg = 2712, phy_def = 3061,
                magic_def = 2158, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 163,
                anti_control = 163},
      skills =>
          [{50001, 80},
           {50002, 80},
           {50003, 80},
           {50004, 80},
           {50005, 80},
           {50006, 80},
           {50007, 80}]};
get({101, 5}) ->
    #{attr =>
          #attr{hp_max = 19974, mp_max = 1712, atk_speed = 730,
                phy_dmg = 3422, magic_dmg = 2733, phy_def = 3085,
                magic_def = 2176, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 164,
                anti_control = 164},
      skills =>
          [{50001, 80},
           {50002, 80},
           {50003, 80},
           {50004, 80},
           {50005, 80},
           {50006, 80},
           {50007, 80}]};
get({102, 5}) ->
    #{attr =>
          #attr{hp_max = 20130, mp_max = 1725, atk_speed = 736,
                phy_dmg = 3449, magic_dmg = 2754, phy_def = 3109,
                magic_def = 2193, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 165,
                anti_control = 165},
      skills =>
          [{50001, 80},
           {50002, 80},
           {50003, 80},
           {50004, 80},
           {50005, 80},
           {50006, 80},
           {50007, 80}]};
get({103, 5}) ->
    #{attr =>
          #attr{hp_max = 20287, mp_max = 1738, atk_speed = 741,
                phy_dmg = 3476, magic_dmg = 2776, phy_def = 3133,
                magic_def = 2210, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 167,
                anti_control = 167},
      skills =>
          [{50001, 80},
           {50002, 80},
           {50003, 80},
           {50004, 80},
           {50005, 80},
           {50006, 80},
           {50007, 80}]};
get({104, 5}) ->
    #{attr =>
          #attr{hp_max = 20443, mp_max = 1752, atk_speed = 747,
                phy_dmg = 3503, magic_dmg = 2797, phy_def = 3157,
                magic_def = 2227, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 168,
                anti_control = 168},
      skills =>
          [{50001, 80},
           {50002, 80},
           {50003, 80},
           {50004, 80},
           {50005, 80},
           {50006, 80},
           {50007, 80}]};
get({105, 5}) ->
    #{attr =>
          #attr{hp_max = 20599, mp_max = 1765, atk_speed = 753,
                phy_dmg = 3530, magic_dmg = 2819, phy_def = 3181,
                magic_def = 2244, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 169,
                anti_control = 169},
      skills =>
          [{50001, 80},
           {50002, 80},
           {50003, 80},
           {50004, 80},
           {50005, 80},
           {50006, 80},
           {50007, 80}]};
get({106, 5}) ->
    #{attr =>
          #attr{hp_max = 20756, mp_max = 1779, atk_speed = 759,
                phy_dmg = 3556, magic_dmg = 2840, phy_def = 3206,
                magic_def = 2261, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 170,
                anti_control = 170},
      skills =>
          [{50001, 80},
           {50002, 80},
           {50003, 80},
           {50004, 80},
           {50005, 80},
           {50006, 80},
           {50007, 80}]};
get({107, 5}) ->
    #{attr =>
          #attr{hp_max = 20912, mp_max = 1792, atk_speed = 764,
                phy_dmg = 3583, magic_dmg = 2861, phy_def = 3230,
                magic_def = 2278, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 172,
                anti_control = 172},
      skills =>
          [{50001, 80},
           {50002, 80},
           {50003, 80},
           {50004, 80},
           {50005, 80},
           {50006, 80},
           {50007, 80}]};
get({108, 5}) ->
    #{attr =>
          #attr{hp_max = 21069, mp_max = 1806, atk_speed = 770,
                phy_dmg = 3610, magic_dmg = 2883, phy_def = 3254,
                magic_def = 2295, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 173,
                anti_control = 173},
      skills =>
          [{50001, 80},
           {50002, 80},
           {50003, 80},
           {50004, 80},
           {50005, 80},
           {50006, 80},
           {50007, 80}]};
get({109, 5}) ->
    #{attr =>
          #attr{hp_max = 21225, mp_max = 1819, atk_speed = 776,
                phy_dmg = 3637, magic_dmg = 2904, phy_def = 3278,
                magic_def = 2312, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 174,
                anti_control = 174},
      skills =>
          [{50001, 80},
           {50002, 80},
           {50003, 80},
           {50004, 80},
           {50005, 80},
           {50006, 80},
           {50007, 80}]};
get({110, 5}) ->
    #{attr =>
          #attr{hp_max = 21382, mp_max = 1832, atk_speed = 782,
                phy_dmg = 3664, magic_dmg = 2926, phy_def = 3302,
                magic_def = 2329, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{50001, 80},
           {50002, 80},
           {50003, 80},
           {50004, 80},
           {50005, 80},
           {50006, 80},
           {50007, 80}]};
get({111, 5}) ->
    #{attr =>
          #attr{hp_max = 21382, mp_max = 1832, atk_speed = 782,
                phy_dmg = 3664, magic_dmg = 2926, phy_def = 3302,
                magic_def = 2329, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{50001, 80},
           {50002, 80},
           {50003, 80},
           {50004, 80},
           {50005, 80},
           {50006, 80},
           {50007, 80}]};
get({112, 5}) ->
    #{attr =>
          #attr{hp_max = 21382, mp_max = 1832, atk_speed = 782,
                phy_dmg = 3664, magic_dmg = 2926, phy_def = 3302,
                magic_def = 2329, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{50001, 80},
           {50002, 80},
           {50003, 80},
           {50004, 80},
           {50005, 80},
           {50006, 80},
           {50007, 80}]};
get({113, 5}) ->
    #{attr =>
          #attr{hp_max = 21382, mp_max = 1832, atk_speed = 782,
                phy_dmg = 3664, magic_dmg = 2926, phy_def = 3302,
                magic_def = 2329, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{50001, 80},
           {50002, 80},
           {50003, 80},
           {50004, 80},
           {50005, 80},
           {50006, 80},
           {50007, 80}]};
get({114, 5}) ->
    #{attr =>
          #attr{hp_max = 21382, mp_max = 1832, atk_speed = 782,
                phy_dmg = 3664, magic_dmg = 2926, phy_def = 3302,
                magic_def = 2329, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{50001, 80},
           {50002, 80},
           {50003, 80},
           {50004, 80},
           {50005, 80},
           {50006, 80},
           {50007, 80}]};
get({115, 5}) ->
    #{attr =>
          #attr{hp_max = 21382, mp_max = 1832, atk_speed = 782,
                phy_dmg = 3664, magic_dmg = 2926, phy_def = 3302,
                magic_def = 2329, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{50001, 80},
           {50002, 80},
           {50003, 80},
           {50004, 80},
           {50005, 80},
           {50006, 80},
           {50007, 80}]};
get({116, 5}) ->
    #{attr =>
          #attr{hp_max = 21382, mp_max = 1832, atk_speed = 782,
                phy_dmg = 3664, magic_dmg = 2926, phy_def = 3302,
                magic_def = 2329, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{50001, 80},
           {50002, 80},
           {50003, 80},
           {50004, 80},
           {50005, 80},
           {50006, 80},
           {50007, 80}]};
get({117, 5}) ->
    #{attr =>
          #attr{hp_max = 21382, mp_max = 1832, atk_speed = 782,
                phy_dmg = 3664, magic_dmg = 2926, phy_def = 3302,
                magic_def = 2329, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{50001, 80},
           {50002, 80},
           {50003, 80},
           {50004, 80},
           {50005, 80},
           {50006, 80},
           {50007, 80}]};
get({118, 5}) ->
    #{attr =>
          #attr{hp_max = 21382, mp_max = 1832, atk_speed = 782,
                phy_dmg = 3664, magic_dmg = 2926, phy_def = 3302,
                magic_def = 2329, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{50001, 80},
           {50002, 80},
           {50003, 80},
           {50004, 80},
           {50005, 80},
           {50006, 80},
           {50007, 80}]};
get({119, 5}) ->
    #{attr =>
          #attr{hp_max = 21382, mp_max = 1832, atk_speed = 782,
                phy_dmg = 3664, magic_dmg = 2926, phy_def = 3302,
                magic_def = 2329, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{50001, 80},
           {50002, 80},
           {50003, 80},
           {50004, 80},
           {50005, 80},
           {50006, 80},
           {50007, 80}]};
get({120, 5}) ->
    #{attr =>
          #attr{hp_max = 21382, mp_max = 1832, atk_speed = 782,
                phy_dmg = 3664, magic_dmg = 2926, phy_def = 3302,
                magic_def = 2329, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{50001, 80},
           {50002, 80},
           {50003, 80},
           {50004, 80},
           {50005, 80},
           {50006, 80},
           {50007, 80}]};
get({121, 5}) ->
    #{attr =>
          #attr{hp_max = 21382, mp_max = 1832, atk_speed = 782,
                phy_dmg = 3664, magic_dmg = 2926, phy_def = 3302,
                magic_def = 2329, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{50001, 80},
           {50002, 80},
           {50003, 80},
           {50004, 80},
           {50005, 80},
           {50006, 80},
           {50007, 80}]};
get({122, 5}) ->
    #{attr =>
          #attr{hp_max = 21382, mp_max = 1832, atk_speed = 782,
                phy_dmg = 3664, magic_dmg = 2926, phy_def = 3302,
                magic_def = 2329, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{50001, 80},
           {50002, 80},
           {50003, 80},
           {50004, 80},
           {50005, 80},
           {50006, 80},
           {50007, 80}]};
get({123, 5}) ->
    #{attr =>
          #attr{hp_max = 21382, mp_max = 1832, atk_speed = 782,
                phy_dmg = 3664, magic_dmg = 2926, phy_def = 3302,
                magic_def = 2329, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{50001, 80},
           {50002, 80},
           {50003, 80},
           {50004, 80},
           {50005, 80},
           {50006, 80},
           {50007, 80}]};
get({124, 5}) ->
    #{attr =>
          #attr{hp_max = 21382, mp_max = 1832, atk_speed = 782,
                phy_dmg = 3664, magic_dmg = 2926, phy_def = 3302,
                magic_def = 2329, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{50001, 80},
           {50002, 80},
           {50003, 80},
           {50004, 80},
           {50005, 80},
           {50006, 80},
           {50007, 80}]};
get({125, 5}) ->
    #{attr =>
          #attr{hp_max = 21382, mp_max = 1832, atk_speed = 782,
                phy_dmg = 3664, magic_dmg = 2926, phy_def = 3302,
                magic_def = 2329, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{50001, 80},
           {50002, 80},
           {50003, 80},
           {50004, 80},
           {50005, 80},
           {50006, 80},
           {50007, 80}]};
get({126, 5}) ->
    #{attr =>
          #attr{hp_max = 21382, mp_max = 1832, atk_speed = 782,
                phy_dmg = 3664, magic_dmg = 2926, phy_def = 3302,
                magic_def = 2329, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{50001, 80},
           {50002, 80},
           {50003, 80},
           {50004, 80},
           {50005, 80},
           {50006, 80},
           {50007, 80}]};
get({127, 5}) ->
    #{attr =>
          #attr{hp_max = 21382, mp_max = 1832, atk_speed = 782,
                phy_dmg = 3664, magic_dmg = 2926, phy_def = 3302,
                magic_def = 2329, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{50001, 80},
           {50002, 80},
           {50003, 80},
           {50004, 80},
           {50005, 80},
           {50006, 80},
           {50007, 80}]};
get({128, 5}) ->
    #{attr =>
          #attr{hp_max = 21382, mp_max = 1832, atk_speed = 782,
                phy_dmg = 3664, magic_dmg = 2926, phy_def = 3302,
                magic_def = 2329, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{50001, 80},
           {50002, 80},
           {50003, 80},
           {50004, 80},
           {50005, 80},
           {50006, 80},
           {50007, 80}]};
get({129, 5}) ->
    #{attr =>
          #attr{hp_max = 21382, mp_max = 1832, atk_speed = 782,
                phy_dmg = 3664, magic_dmg = 2926, phy_def = 3302,
                magic_def = 2329, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{50001, 80},
           {50002, 80},
           {50003, 80},
           {50004, 80},
           {50005, 80},
           {50006, 80},
           {50007, 80}]};
get({130, 5}) ->
    #{attr =>
          #attr{hp_max = 21382, mp_max = 1832, atk_speed = 782,
                phy_dmg = 3664, magic_dmg = 2926, phy_def = 3302,
                magic_def = 2329, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{50001, 80},
           {50002, 80},
           {50003, 80},
           {50004, 80},
           {50005, 80},
           {50006, 80},
           {50007, 80}]};
get({20, 6}) ->
    #{attr =>
          #attr{hp_max = 1344, mp_max = 390, atk_speed = 45,
                phy_dmg = 466, magic_dmg = 642, phy_def = 396,
                magic_def = 390, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 26, anti_control = 26},
      skills => [{69001, 20}, {69002, 20}, {69003, 20}]};
get({21, 6}) ->
    #{attr =>
          #attr{hp_max = 1365, mp_max = 399, atk_speed = 45,
                phy_dmg = 467, magic_dmg = 650, phy_def = 402,
                magic_def = 398, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 26, anti_control = 26},
      skills => [{69001, 21}, {69002, 21}, {69003, 21}]};
get({22, 6}) ->
    #{attr =>
          #attr{hp_max = 1409, mp_max = 417, atk_speed = 47,
                phy_dmg = 471, magic_dmg = 668, phy_def = 416,
                magic_def = 413, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 26, anti_control = 26},
      skills => [{69001, 22}, {69002, 22}, {69003, 22}]};
get({23, 6}) ->
    #{attr =>
          #attr{hp_max = 1452, mp_max = 436, atk_speed = 48,
                phy_dmg = 474, magic_dmg = 687, phy_def = 429,
                magic_def = 429, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 26, anti_control = 26},
      skills => [{69001, 23}, {69002, 23}, {69003, 23}]};
get({24, 6}) ->
    #{attr =>
          #attr{hp_max = 1496, mp_max = 455, atk_speed = 49,
                phy_dmg = 476, magic_dmg = 705, phy_def = 442,
                magic_def = 445, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 26, anti_control = 26},
      skills => [{69001, 24}, {69002, 24}, {69003, 24}]};
get({25, 6}) ->
    #{attr =>
          #attr{hp_max = 1561, mp_max = 483, atk_speed = 52,
                phy_dmg = 482, magic_dmg = 733, phy_def = 462,
                magic_def = 469, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 26, anti_control = 26},
      skills =>
          [{69001, 25}, {69002, 25}, {69003, 25}, {69006, 25}]};
get({26, 6}) ->
    #{attr =>
          #attr{hp_max = 1608, mp_max = 492, atk_speed = 53,
                phy_dmg = 508, magic_dmg = 760, phy_def = 475,
                magic_def = 481, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 27, anti_control = 27},
      skills =>
          [{69001, 26}, {69002, 26}, {69003, 26}, {69006, 26}]};
get({27, 6}) ->
    #{attr =>
          #attr{hp_max = 1701, mp_max = 511, atk_speed = 56,
                phy_dmg = 559, magic_dmg = 814, phy_def = 504,
                magic_def = 506, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 30, anti_control = 30},
      skills =>
          [{69001, 27}, {69002, 27}, {69003, 27}, {69006, 27}]};
get({28, 6}) ->
    #{attr =>
          #attr{hp_max = 1795, mp_max = 531, atk_speed = 60,
                phy_dmg = 611, magic_dmg = 868, phy_def = 532,
                magic_def = 532, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 33, anti_control = 33},
      skills =>
          [{69001, 28}, {69002, 28}, {69003, 28}, {69006, 28}]};
get({29, 6}) ->
    #{attr =>
          #attr{hp_max = 1888, mp_max = 550, atk_speed = 63,
                phy_dmg = 663, magic_dmg = 921, phy_def = 559,
                magic_def = 557, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 36, anti_control = 36},
      skills =>
          [{69001, 29}, {69002, 29}, {69003, 29}, {69006, 29}]};
get({30, 6}) ->
    #{attr =>
          #attr{hp_max = 2029, mp_max = 579, atk_speed = 68,
                phy_dmg = 741, magic_dmg = 1003, phy_def = 602,
                magic_def = 595, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 41, anti_control = 41},
      skills =>
          [{69001, 30}, {69002, 30}, {69003, 30}, {69006, 30}]};
get({31, 6}) ->
    #{attr =>
          #attr{hp_max = 2050, mp_max = 580, atk_speed = 68,
                phy_dmg = 743, magic_dmg = 1013, phy_def = 613,
                magic_def = 604, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 41, anti_control = 41},
      skills =>
          [{69001, 31}, {69002, 31}, {69003, 31}, {69006, 31}]};
get({32, 6}) ->
    #{attr =>
          #attr{hp_max = 2094, mp_max = 584, atk_speed = 70,
                phy_dmg = 749, magic_dmg = 1034, phy_def = 638,
                magic_def = 623, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 41, anti_control = 41},
      skills =>
          [{69001, 32}, {69002, 32}, {69003, 32}, {69006, 32}]};
get({33, 6}) ->
    #{attr =>
          #attr{hp_max = 2137, mp_max = 588, atk_speed = 71,
                phy_dmg = 756, magic_dmg = 1055, phy_def = 662,
                magic_def = 642, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 41, anti_control = 41},
      skills =>
          [{69001, 33}, {69002, 33}, {69003, 33}, {69006, 33}]};
get({34, 6}) ->
    #{attr =>
          #attr{hp_max = 2181, mp_max = 592, atk_speed = 72,
                phy_dmg = 761, magic_dmg = 1076, phy_def = 685,
                magic_def = 660, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 41, anti_control = 41},
      skills =>
          [{69001, 34}, {69002, 34}, {69003, 34}, {69006, 34}]};
get({35, 6}) ->
    #{attr =>
          #attr{hp_max = 2246, mp_max = 598, atk_speed = 75,
                phy_dmg = 771, magic_dmg = 1108, phy_def = 722,
                magic_def = 688, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 41, anti_control = 41},
      skills =>
          [{69001, 35},
           {69002, 35},
           {69003, 35},
           {69006, 35},
           {69005, 35}]};
get({36, 6}) ->
    #{attr =>
          #attr{hp_max = 2388, mp_max = 604, atk_speed = 76,
                phy_dmg = 791, magic_dmg = 1152, phy_def = 748,
                magic_def = 705, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 41, anti_control = 41},
      skills =>
          [{69001, 36},
           {69002, 36},
           {69003, 36},
           {69006, 36},
           {69005, 36}]};
get({37, 6}) ->
    #{attr =>
          #attr{hp_max = 2671, mp_max = 618, atk_speed = 80,
                phy_dmg = 832, magic_dmg = 1240, phy_def = 800,
                magic_def = 740, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 41, anti_control = 41},
      skills =>
          [{69001, 37},
           {69002, 37},
           {69003, 37},
           {69006, 37},
           {69005, 37}]};
get({38, 6}) ->
    #{attr =>
          #attr{hp_max = 2955, mp_max = 632, atk_speed = 84,
                phy_dmg = 873, magic_dmg = 1329, phy_def = 854,
                magic_def = 774, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 41, anti_control = 41},
      skills =>
          [{69001, 38},
           {69002, 38},
           {69003, 38},
           {69006, 38},
           {69005, 38}]};
get({39, 6}) ->
    #{attr =>
          #attr{hp_max = 3239, mp_max = 645, atk_speed = 88,
                phy_dmg = 912, magic_dmg = 1417, phy_def = 906,
                magic_def = 808, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 41, anti_control = 41},
      skills =>
          [{69001, 39},
           {69002, 39},
           {69003, 39},
           {69006, 39},
           {69005, 39}]};
get({40, 6}) ->
    #{attr =>
          #attr{hp_max = 3665, mp_max = 666, atk_speed = 94,
                phy_dmg = 974, magic_dmg = 1550, phy_def = 985,
                magic_def = 860, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 41, anti_control = 41},
      skills =>
          [{69001, 40},
           {69002, 40},
           {69003, 40},
           {69006, 40},
           {69005, 40}]};
get({41, 6}) ->
    #{attr =>
          #attr{hp_max = 3757, mp_max = 680, atk_speed = 96,
                phy_dmg = 987, magic_dmg = 1567, phy_def = 1006,
                magic_def = 882, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 42, anti_control = 42},
      skills =>
          [{69001, 41},
           {69002, 41},
           {69003, 41},
           {69006, 41},
           {69005, 41}]};
get({42, 6}) ->
    #{attr =>
          #attr{hp_max = 3942, mp_max = 710, atk_speed = 102,
                phy_dmg = 1012, magic_dmg = 1602, phy_def = 1049,
                magic_def = 927, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 45, anti_control = 45},
      skills =>
          [{69001, 42},
           {69002, 42},
           {69003, 42},
           {69006, 42},
           {69005, 42}]};
get({43, 6}) ->
    #{attr =>
          #attr{hp_max = 4127, mp_max = 739, atk_speed = 107,
                phy_dmg = 1038, magic_dmg = 1637, phy_def = 1093,
                magic_def = 972, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 48, anti_control = 48},
      skills =>
          [{69001, 43},
           {69002, 43},
           {69003, 43},
           {69006, 43},
           {69005, 43}]};
get({44, 6}) ->
    #{attr =>
          #attr{hp_max = 4311, mp_max = 768, atk_speed = 112,
                phy_dmg = 1064, magic_dmg = 1672, phy_def = 1137,
                magic_def = 1017, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 51, anti_control = 51},
      skills =>
          [{69001, 44},
           {69002, 44},
           {69003, 44},
           {69006, 44},
           {69005, 44}]};
get({45, 6}) ->
    #{attr =>
          #attr{hp_max = 4589, mp_max = 813, atk_speed = 121,
                phy_dmg = 1102, magic_dmg = 1725, phy_def = 1202,
                magic_def = 1084, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 56, anti_control = 56},
      skills =>
          [{69001, 45},
           {69002, 45},
           {69003, 45},
           {69006, 45},
           {69005, 45},
           {69004, 45}]};
get({46, 6}) ->
    #{attr =>
          #attr{hp_max = 4671, mp_max = 825, atk_speed = 123,
                phy_dmg = 1132, magic_dmg = 1765, phy_def = 1227,
                magic_def = 1101, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 56, anti_control = 56},
      skills =>
          [{69001, 46},
           {69002, 46},
           {69003, 46},
           {69006, 46},
           {69005, 46},
           {69004, 46}]};
get({47, 6}) ->
    #{attr =>
          #attr{hp_max = 4835, mp_max = 849, atk_speed = 127,
                phy_dmg = 1191, magic_dmg = 1845, phy_def = 1276,
                magic_def = 1135, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 57, anti_control = 57},
      skills =>
          [{69001, 47},
           {69002, 47},
           {69003, 47},
           {69006, 47},
           {69005, 47},
           {69004, 47}]};
get({48, 6}) ->
    #{attr =>
          #attr{hp_max = 5000, mp_max = 874, atk_speed = 132,
                phy_dmg = 1251, magic_dmg = 1926, phy_def = 1326,
                magic_def = 1168, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 59, anti_control = 59},
      skills =>
          [{69001, 48},
           {69002, 48},
           {69003, 48},
           {69006, 48},
           {69005, 48},
           {69004, 48}]};
get({49, 6}) ->
    #{attr =>
          #attr{hp_max = 5164, mp_max = 899, atk_speed = 137,
                phy_dmg = 1311, magic_dmg = 2006, phy_def = 1375,
                magic_def = 1201, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 60, anti_control = 60},
      skills =>
          [{69001, 49},
           {69002, 49},
           {69003, 49},
           {69006, 49},
           {69005, 49},
           {69004, 49}]};
get({50, 6}) ->
    #{attr =>
          #attr{hp_max = 5411, mp_max = 936, atk_speed = 144,
                phy_dmg = 1400, magic_dmg = 2128, phy_def = 1450,
                magic_def = 1253, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 62, anti_control = 62},
      skills =>
          [{69001, 50},
           {69002, 50},
           {69003, 50},
           {69006, 50},
           {69005, 50},
           {69004, 50}]};
get({51, 6}) ->
    #{attr =>
          #attr{hp_max = 5466, mp_max = 952, atk_speed = 146,
                phy_dmg = 1422, magic_dmg = 2147, phy_def = 1464,
                magic_def = 1268, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 64, anti_control = 64},
      skills =>
          [{69001, 51},
           {69002, 51},
           {69003, 51},
           {69006, 51},
           {69005, 51},
           {69004, 51}]};
get({52, 6}) ->
    #{attr =>
          #attr{hp_max = 5577, mp_max = 985, atk_speed = 152,
                phy_dmg = 1465, magic_dmg = 2185, phy_def = 1495,
                magic_def = 1300, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 68, anti_control = 68},
      skills =>
          [{69001, 52},
           {69002, 52},
           {69003, 52},
           {69006, 52},
           {69005, 52},
           {69004, 52}]};
get({53, 6}) ->
    #{attr =>
          #attr{hp_max = 5689, mp_max = 1019, atk_speed = 158,
                phy_dmg = 1510, magic_dmg = 2223, phy_def = 1525,
                magic_def = 1332, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 73, anti_control = 73},
      skills =>
          [{69001, 53},
           {69002, 53},
           {69003, 53},
           {69006, 53},
           {69005, 53},
           {69004, 53}]};
get({54, 6}) ->
    #{attr =>
          #attr{hp_max = 5800, mp_max = 1052, atk_speed = 164,
                phy_dmg = 1554, magic_dmg = 2261, phy_def = 1556,
                magic_def = 1364, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 78, anti_control = 78},
      skills =>
          [{69001, 54},
           {69002, 54},
           {69003, 54},
           {69006, 54},
           {69005, 54},
           {69004, 54}]};
get({55, 6}) ->
    #{attr =>
          #attr{hp_max = 5967, mp_max = 1102, atk_speed = 173,
                phy_dmg = 1620, magic_dmg = 2318, phy_def = 1601,
                magic_def = 1412, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 85, anti_control = 85},
      skills =>
          [{69001, 55},
           {69002, 55},
           {69003, 55},
           {69006, 55},
           {69005, 55},
           {69004, 55},
           {69007, 55}]};
get({56, 6}) ->
    #{attr =>
          #attr{hp_max = 6115, mp_max = 1112, atk_speed = 173,
                phy_dmg = 1649, magic_dmg = 2368, phy_def = 1637,
                magic_def = 1433, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 85, anti_control = 85},
      skills =>
          [{69001, 56},
           {69002, 56},
           {69003, 56},
           {69006, 56},
           {69005, 56},
           {69004, 56},
           {69007, 56}]};
get({57, 6}) ->
    #{attr =>
          #attr{hp_max = 6411, mp_max = 1132, atk_speed = 175,
                phy_dmg = 1707, magic_dmg = 2469, phy_def = 1710,
                magic_def = 1475, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 86, anti_control = 86},
      skills =>
          [{69001, 57},
           {69002, 57},
           {69003, 57},
           {69006, 57},
           {69005, 57},
           {69004, 57},
           {69007, 57}]};
get({58, 6}) ->
    #{attr =>
          #attr{hp_max = 6708, mp_max = 1152, atk_speed = 177,
                phy_dmg = 1765, magic_dmg = 2569, phy_def = 1782,
                magic_def = 1517, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 87, anti_control = 87},
      skills =>
          [{69001, 58},
           {69002, 58},
           {69003, 58},
           {69006, 58},
           {69005, 58},
           {69004, 58},
           {69007, 58}]};
get({59, 6}) ->
    #{attr =>
          #attr{hp_max = 7004, mp_max = 1172, atk_speed = 179,
                phy_dmg = 1823, magic_dmg = 2670, phy_def = 1854,
                magic_def = 1558, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 87, anti_control = 87},
      skills =>
          [{69001, 59},
           {69002, 59},
           {69003, 59},
           {69006, 59},
           {69005, 59},
           {69004, 59},
           {69007, 59}]};
get({60, 6}) ->
    #{attr =>
          #attr{hp_max = 7449, mp_max = 1202, atk_speed = 182,
                phy_dmg = 1910, magic_dmg = 2821, phy_def = 1963,
                magic_def = 1621, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 89, anti_control = 89},
      skills =>
          [{69001, 60},
           {69002, 60},
           {69003, 60},
           {69006, 60},
           {69005, 60},
           {69004, 60},
           {69007, 60}]};
get({61, 6}) ->
    #{attr =>
          #attr{hp_max = 7555, mp_max = 1217, atk_speed = 185,
                phy_dmg = 1928, magic_dmg = 2846, phy_def = 1988,
                magic_def = 1639, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 91, anti_control = 91},
      skills =>
          [{69001, 61},
           {69002, 61},
           {69003, 61},
           {69006, 61},
           {69005, 61},
           {69004, 61},
           {69007, 61}]};
get({62, 6}) ->
    #{attr =>
          #attr{hp_max = 7770, mp_max = 1247, atk_speed = 192,
                phy_dmg = 1965, magic_dmg = 2897, phy_def = 2039,
                magic_def = 1676, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 95, anti_control = 95},
      skills =>
          [{69001, 62},
           {69002, 62},
           {69003, 62},
           {69006, 62},
           {69005, 62},
           {69004, 62},
           {69007, 62}]};
get({63, 6}) ->
    #{attr =>
          #attr{hp_max = 7984, mp_max = 1277, atk_speed = 199,
                phy_dmg = 2003, magic_dmg = 2947, phy_def = 2090,
                magic_def = 1713, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 100,
                anti_control = 100},
      skills =>
          [{69001, 63},
           {69002, 63},
           {69003, 63},
           {69006, 63},
           {69005, 63},
           {69004, 63},
           {69007, 63}]};
get({64, 6}) ->
    #{attr =>
          #attr{hp_max = 8198, mp_max = 1307, atk_speed = 206,
                phy_dmg = 2040, magic_dmg = 2998, phy_def = 2140,
                magic_def = 1750, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 105,
                anti_control = 105},
      skills =>
          [{69001, 64},
           {69002, 64},
           {69003, 64},
           {69006, 64},
           {69005, 64},
           {69004, 64},
           {69007, 64}]};
get({65, 6}) ->
    #{attr =>
          #attr{hp_max = 8520, mp_max = 1353, atk_speed = 217,
                phy_dmg = 2096, magic_dmg = 3075, phy_def = 2217,
                magic_def = 1806, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 112,
                anti_control = 112},
      skills =>
          [{69001, 65},
           {69002, 65},
           {69003, 65},
           {69006, 65},
           {69005, 65},
           {69004, 65},
           {69007, 65}]};
get({66, 6}) ->
    #{attr =>
          #attr{hp_max = 8618, mp_max = 1363, atk_speed = 220,
                phy_dmg = 2128, magic_dmg = 3118, phy_def = 2241,
                magic_def = 1823, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 112,
                anti_control = 112},
      skills =>
          [{69001, 66},
           {69002, 66},
           {69003, 66},
           {69006, 66},
           {69005, 66},
           {69004, 66},
           {69007, 66}]};
get({67, 6}) ->
    #{attr =>
          #attr{hp_max = 8815, mp_max = 1384, atk_speed = 228,
                phy_dmg = 2190, magic_dmg = 3207, phy_def = 2289,
                magic_def = 1857, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 113,
                anti_control = 113},
      skills =>
          [{69001, 67},
           {69002, 67},
           {69003, 67},
           {69006, 67},
           {69005, 67},
           {69004, 67},
           {69007, 67}]};
get({68, 6}) ->
    #{attr =>
          #attr{hp_max = 9012, mp_max = 1405, atk_speed = 236,
                phy_dmg = 2254, magic_dmg = 3296, phy_def = 2338,
                magic_def = 1891, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 114,
                anti_control = 114},
      skills =>
          [{69001, 68},
           {69002, 68},
           {69003, 68},
           {69006, 68},
           {69005, 68},
           {69004, 68},
           {69007, 68}]};
get({69, 6}) ->
    #{attr =>
          #attr{hp_max = 9210, mp_max = 1425, atk_speed = 243,
                phy_dmg = 2318, magic_dmg = 3384, phy_def = 2387,
                magic_def = 1924, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 114,
                anti_control = 114},
      skills =>
          [{69001, 69},
           {69002, 69},
           {69003, 69},
           {69006, 69},
           {69005, 69},
           {69004, 69},
           {69007, 69}]};
get({70, 6}) ->
    #{attr =>
          #attr{hp_max = 9506, mp_max = 1457, atk_speed = 255,
                phy_dmg = 2413, magic_dmg = 3517, phy_def = 2460,
                magic_def = 1976, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 116,
                anti_control = 116},
      skills =>
          [{69001, 70},
           {69002, 70},
           {69003, 70},
           {69006, 70},
           {69005, 70},
           {69004, 70},
           {69007, 70}]};
get({71, 6}) ->
    #{attr =>
          #attr{hp_max = 9646, mp_max = 1478, atk_speed = 258,
                phy_dmg = 2448, magic_dmg = 3569, phy_def = 2496,
                magic_def = 2005, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 117,
                anti_control = 117},
      skills =>
          [{69001, 71},
           {69002, 71},
           {69003, 71},
           {69006, 71},
           {69005, 71},
           {69004, 71},
           {69007, 71}]};
get({72, 6}) ->
    #{attr =>
          #attr{hp_max = 9787, mp_max = 1500, atk_speed = 262,
                phy_dmg = 2484, magic_dmg = 3621, phy_def = 2532,
                magic_def = 2034, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 119,
                anti_control = 119},
      skills =>
          [{69001, 72},
           {69002, 72},
           {69003, 72},
           {69006, 72},
           {69005, 72},
           {69004, 72},
           {69007, 72}]};
get({73, 6}) ->
    #{attr =>
          #attr{hp_max = 9928, mp_max = 1521, atk_speed = 266,
                phy_dmg = 2520, magic_dmg = 3673, phy_def = 2569,
                magic_def = 2063, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 121,
                anti_control = 121},
      skills =>
          [{69001, 73},
           {69002, 73},
           {69003, 73},
           {69006, 73},
           {69005, 73},
           {69004, 73},
           {69007, 73}]};
get({74, 6}) ->
    #{attr =>
          #attr{hp_max = 10069, mp_max = 1543, atk_speed = 270,
                phy_dmg = 2555, magic_dmg = 3725, phy_def = 2605,
                magic_def = 2093, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 122,
                anti_control = 122},
      skills =>
          [{69001, 74},
           {69002, 74},
           {69003, 74},
           {69006, 74},
           {69005, 74},
           {69004, 74},
           {69007, 74}]};
get({75, 6}) ->
    #{attr =>
          #attr{hp_max = 10210, mp_max = 1564, atk_speed = 273,
                phy_dmg = 2591, magic_dmg = 3777, phy_def = 2642,
                magic_def = 2122, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 124,
                anti_control = 124},
      skills =>
          [{69001, 75},
           {69002, 75},
           {69003, 75},
           {69006, 75},
           {69005, 75},
           {69004, 75},
           {69007, 75}]};
get({76, 6}) ->
    #{attr =>
          #attr{hp_max = 10350, mp_max = 1586, atk_speed = 277,
                phy_dmg = 2627, magic_dmg = 3829, phy_def = 2678,
                magic_def = 2151, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 126,
                anti_control = 126},
      skills =>
          [{69001, 76},
           {69002, 76},
           {69003, 76},
           {69006, 76},
           {69005, 76},
           {69004, 76},
           {69007, 76}]};
get({77, 6}) ->
    #{attr =>
          #attr{hp_max = 10491, mp_max = 1608, atk_speed = 281,
                phy_dmg = 2663, magic_dmg = 3881, phy_def = 2715,
                magic_def = 2180, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 128,
                anti_control = 128},
      skills =>
          [{69001, 77},
           {69002, 77},
           {69003, 77},
           {69006, 77},
           {69005, 77},
           {69004, 77},
           {69007, 77}]};
get({78, 6}) ->
    #{attr =>
          #attr{hp_max = 10632, mp_max = 1629, atk_speed = 285,
                phy_dmg = 2698, magic_dmg = 3933, phy_def = 2751,
                magic_def = 2210, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 129,
                anti_control = 129},
      skills =>
          [{69001, 78},
           {69002, 78},
           {69003, 78},
           {69006, 78},
           {69005, 78},
           {69004, 78},
           {69007, 78}]};
get({79, 6}) ->
    #{attr =>
          #attr{hp_max = 10773, mp_max = 1651, atk_speed = 289,
                phy_dmg = 2734, magic_dmg = 3985, phy_def = 2788,
                magic_def = 2239, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 131,
                anti_control = 131},
      skills =>
          [{69001, 79},
           {69002, 79},
           {69003, 79},
           {69006, 79},
           {69005, 79},
           {69004, 79},
           {69007, 79}]};
get({80, 6}) ->
    #{attr =>
          #attr{hp_max = 10914, mp_max = 1672, atk_speed = 292,
                phy_dmg = 2770, magic_dmg = 4038, phy_def = 2824,
                magic_def = 2268, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 133,
                anti_control = 133},
      skills =>
          [{69001, 80},
           {69002, 80},
           {69003, 80},
           {69006, 80},
           {69005, 80},
           {69004, 80},
           {69007, 80}]};
get({81, 6}) ->
    #{attr =>
          #attr{hp_max = 11055, mp_max = 1694, atk_speed = 296,
                phy_dmg = 2806, magic_dmg = 4090, phy_def = 2860,
                magic_def = 2298, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 134,
                anti_control = 134},
      skills =>
          [{69001, 80},
           {69002, 80},
           {69003, 80},
           {69006, 80},
           {69005, 80},
           {69004, 80},
           {69007, 80}]};
get({82, 6}) ->
    #{attr =>
          #attr{hp_max = 11195, mp_max = 1716, atk_speed = 300,
                phy_dmg = 2841, magic_dmg = 4142, phy_def = 2897,
                magic_def = 2327, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 136,
                anti_control = 136},
      skills =>
          [{69001, 80},
           {69002, 80},
           {69003, 80},
           {69006, 80},
           {69005, 80},
           {69004, 80},
           {69007, 80}]};
get({83, 6}) ->
    #{attr =>
          #attr{hp_max = 11336, mp_max = 1737, atk_speed = 304,
                phy_dmg = 2877, magic_dmg = 4194, phy_def = 2933,
                magic_def = 2356, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 138,
                anti_control = 138},
      skills =>
          [{69001, 80},
           {69002, 80},
           {69003, 80},
           {69006, 80},
           {69005, 80},
           {69004, 80},
           {69007, 80}]};
get({84, 6}) ->
    #{attr =>
          #attr{hp_max = 11477, mp_max = 1759, atk_speed = 307,
                phy_dmg = 2913, magic_dmg = 4246, phy_def = 2970,
                magic_def = 2385, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 140,
                anti_control = 140},
      skills =>
          [{69001, 80},
           {69002, 80},
           {69003, 80},
           {69006, 80},
           {69005, 80},
           {69004, 80},
           {69007, 80}]};
get({85, 6}) ->
    #{attr =>
          #attr{hp_max = 11618, mp_max = 1780, atk_speed = 311,
                phy_dmg = 2949, magic_dmg = 4298, phy_def = 3006,
                magic_def = 2415, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 141,
                anti_control = 141},
      skills =>
          [{69001, 80},
           {69002, 80},
           {69003, 80},
           {69006, 80},
           {69005, 80},
           {69004, 80},
           {69007, 80}]};
get({86, 6}) ->
    #{attr =>
          #attr{hp_max = 11759, mp_max = 1802, atk_speed = 315,
                phy_dmg = 2984, magic_dmg = 4350, phy_def = 3043,
                magic_def = 2444, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 143,
                anti_control = 143},
      skills =>
          [{69001, 80},
           {69002, 80},
           {69003, 80},
           {69006, 80},
           {69005, 80},
           {69004, 80},
           {69007, 80}]};
get({87, 6}) ->
    #{attr =>
          #attr{hp_max = 11900, mp_max = 1823, atk_speed = 319,
                phy_dmg = 3020, magic_dmg = 4402, phy_def = 3079,
                magic_def = 2473, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 145,
                anti_control = 145},
      skills =>
          [{69001, 80},
           {69002, 80},
           {69003, 80},
           {69006, 80},
           {69005, 80},
           {69004, 80},
           {69007, 80}]};
get({88, 6}) ->
    #{attr =>
          #attr{hp_max = 12040, mp_max = 1845, atk_speed = 323,
                phy_dmg = 3056, magic_dmg = 4454, phy_def = 3116,
                magic_def = 2502, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 146,
                anti_control = 146},
      skills =>
          [{69001, 80},
           {69002, 80},
           {69003, 80},
           {69006, 80},
           {69005, 80},
           {69004, 80},
           {69007, 80}]};
get({89, 6}) ->
    #{attr =>
          #attr{hp_max = 12181, mp_max = 1867, atk_speed = 326,
                phy_dmg = 3092, magic_dmg = 4506, phy_def = 3152,
                magic_def = 2532, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 148,
                anti_control = 148},
      skills =>
          [{69001, 80},
           {69002, 80},
           {69003, 80},
           {69006, 80},
           {69005, 80},
           {69004, 80},
           {69007, 80}]};
get({90, 6}) ->
    #{attr =>
          #attr{hp_max = 12322, mp_max = 1888, atk_speed = 330,
                phy_dmg = 3127, magic_dmg = 4559, phy_def = 3188,
                magic_def = 2561, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 150,
                anti_control = 150},
      skills =>
          [{69001, 80},
           {69002, 80},
           {69003, 80},
           {69006, 80},
           {69005, 80},
           {69004, 80},
           {69007, 80}]};
get({91, 6}) ->
    #{attr =>
          #attr{hp_max = 12428, mp_max = 1904, atk_speed = 333,
                phy_dmg = 3154, magic_dmg = 4598, phy_def = 3216,
                magic_def = 2583, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 151,
                anti_control = 151},
      skills =>
          [{69001, 80},
           {69002, 80},
           {69003, 80},
           {69006, 80},
           {69005, 80},
           {69004, 80},
           {69007, 80}]};
get({92, 6}) ->
    #{attr =>
          #attr{hp_max = 12533, mp_max = 1921, atk_speed = 336,
                phy_dmg = 3181, magic_dmg = 4637, phy_def = 3243,
                magic_def = 2605, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 152,
                anti_control = 152},
      skills =>
          [{69001, 80},
           {69002, 80},
           {69003, 80},
           {69006, 80},
           {69005, 80},
           {69004, 80},
           {69007, 80}]};
get({93, 6}) ->
    #{attr =>
          #attr{hp_max = 12639, mp_max = 1937, atk_speed = 339,
                phy_dmg = 3208, magic_dmg = 4676, phy_def = 3270,
                magic_def = 2627, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 154,
                anti_control = 154},
      skills =>
          [{69001, 80},
           {69002, 80},
           {69003, 80},
           {69006, 80},
           {69005, 80},
           {69004, 80},
           {69007, 80}]};
get({94, 6}) ->
    #{attr =>
          #attr{hp_max = 12745, mp_max = 1953, atk_speed = 341,
                phy_dmg = 3235, magic_dmg = 4715, phy_def = 3298,
                magic_def = 2649, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 155,
                anti_control = 155},
      skills =>
          [{69001, 80},
           {69002, 80},
           {69003, 80},
           {69006, 80},
           {69005, 80},
           {69004, 80},
           {69007, 80}]};
get({95, 6}) ->
    #{attr =>
          #attr{hp_max = 12850, mp_max = 1969, atk_speed = 344,
                phy_dmg = 3262, magic_dmg = 4754, phy_def = 3325,
                magic_def = 2671, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 156,
                anti_control = 156},
      skills =>
          [{69001, 80},
           {69002, 80},
           {69003, 80},
           {69006, 80},
           {69005, 80},
           {69004, 80},
           {69007, 80}]};
get({96, 6}) ->
    #{attr =>
          #attr{hp_max = 12956, mp_max = 1985, atk_speed = 347,
                phy_dmg = 3288, magic_dmg = 4793, phy_def = 3352,
                magic_def = 2693, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 158,
                anti_control = 158},
      skills =>
          [{69001, 80},
           {69002, 80},
           {69003, 80},
           {69006, 80},
           {69005, 80},
           {69004, 80},
           {69007, 80}]};
get({97, 6}) ->
    #{attr =>
          #attr{hp_max = 13061, mp_max = 2002, atk_speed = 350,
                phy_dmg = 3315, magic_dmg = 4832, phy_def = 3380,
                magic_def = 2715, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 159,
                anti_control = 159},
      skills =>
          [{69001, 80},
           {69002, 80},
           {69003, 80},
           {69006, 80},
           {69005, 80},
           {69004, 80},
           {69007, 80}]};
get({98, 6}) ->
    #{attr =>
          #attr{hp_max = 13167, mp_max = 2018, atk_speed = 353,
                phy_dmg = 3342, magic_dmg = 4871, phy_def = 3407,
                magic_def = 2737, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 160,
                anti_control = 160},
      skills =>
          [{69001, 80},
           {69002, 80},
           {69003, 80},
           {69006, 80},
           {69005, 80},
           {69004, 80},
           {69007, 80}]};
get({99, 6}) ->
    #{attr =>
          #attr{hp_max = 13273, mp_max = 2034, atk_speed = 356,
                phy_dmg = 3369, magic_dmg = 4910, phy_def = 3434,
                magic_def = 2759, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 161,
                anti_control = 161},
      skills =>
          [{69001, 80},
           {69002, 80},
           {69003, 80},
           {69006, 80},
           {69005, 80},
           {69004, 80},
           {69007, 80}]};
get({100, 6}) ->
    #{attr =>
          #attr{hp_max = 13378, mp_max = 2050, atk_speed = 358,
                phy_dmg = 3396, magic_dmg = 4949, phy_def = 3462,
                magic_def = 2781, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 163,
                anti_control = 163},
      skills =>
          [{69001, 80},
           {69002, 80},
           {69003, 80},
           {69006, 80},
           {69005, 80},
           {69004, 80},
           {69007, 80}]};
get({101, 6}) ->
    #{attr =>
          #attr{hp_max = 13484, mp_max = 2066, atk_speed = 361,
                phy_dmg = 3422, magic_dmg = 4988, phy_def = 3489,
                magic_def = 2802, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 164,
                anti_control = 164},
      skills =>
          [{69001, 80},
           {69002, 80},
           {69003, 80},
           {69006, 80},
           {69005, 80},
           {69004, 80},
           {69007, 80}]};
get({102, 6}) ->
    #{attr =>
          #attr{hp_max = 13590, mp_max = 2082, atk_speed = 364,
                phy_dmg = 3449, magic_dmg = 5028, phy_def = 3516,
                magic_def = 2824, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 165,
                anti_control = 165},
      skills =>
          [{69001, 80},
           {69002, 80},
           {69003, 80},
           {69006, 80},
           {69005, 80},
           {69004, 80},
           {69007, 80}]};
get({103, 6}) ->
    #{attr =>
          #attr{hp_max = 13695, mp_max = 2099, atk_speed = 367,
                phy_dmg = 3476, magic_dmg = 5067, phy_def = 3544,
                magic_def = 2846, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 167,
                anti_control = 167},
      skills =>
          [{69001, 80},
           {69002, 80},
           {69003, 80},
           {69006, 80},
           {69005, 80},
           {69004, 80},
           {69007, 80}]};
get({104, 6}) ->
    #{attr =>
          #attr{hp_max = 13801, mp_max = 2115, atk_speed = 370,
                phy_dmg = 3503, magic_dmg = 5106, phy_def = 3571,
                magic_def = 2868, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 168,
                anti_control = 168},
      skills =>
          [{69001, 80},
           {69002, 80},
           {69003, 80},
           {69006, 80},
           {69005, 80},
           {69004, 80},
           {69007, 80}]};
get({105, 6}) ->
    #{attr =>
          #attr{hp_max = 13906, mp_max = 2131, atk_speed = 373,
                phy_dmg = 3530, magic_dmg = 5145, phy_def = 3598,
                magic_def = 2890, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 169,
                anti_control = 169},
      skills =>
          [{69001, 80},
           {69002, 80},
           {69003, 80},
           {69006, 80},
           {69005, 80},
           {69004, 80},
           {69007, 80}]};
get({106, 6}) ->
    #{attr =>
          #attr{hp_max = 14012, mp_max = 2147, atk_speed = 375,
                phy_dmg = 3556, magic_dmg = 5184, phy_def = 3626,
                magic_def = 2912, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 170,
                anti_control = 170},
      skills =>
          [{69001, 80},
           {69002, 80},
           {69003, 80},
           {69006, 80},
           {69005, 80},
           {69004, 80},
           {69007, 80}]};
get({107, 6}) ->
    #{attr =>
          #attr{hp_max = 14118, mp_max = 2163, atk_speed = 378,
                phy_dmg = 3583, magic_dmg = 5223, phy_def = 3653,
                magic_def = 2934, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 172,
                anti_control = 172},
      skills =>
          [{69001, 80},
           {69002, 80},
           {69003, 80},
           {69006, 80},
           {69005, 80},
           {69004, 80},
           {69007, 80}]};
get({108, 6}) ->
    #{attr =>
          #attr{hp_max = 14223, mp_max = 2180, atk_speed = 381,
                phy_dmg = 3610, magic_dmg = 5262, phy_def = 3680,
                magic_def = 2956, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 173,
                anti_control = 173},
      skills =>
          [{69001, 80},
           {69002, 80},
           {69003, 80},
           {69006, 80},
           {69005, 80},
           {69004, 80},
           {69007, 80}]};
get({109, 6}) ->
    #{attr =>
          #attr{hp_max = 14329, mp_max = 2196, atk_speed = 384,
                phy_dmg = 3637, magic_dmg = 5301, phy_def = 3708,
                magic_def = 2978, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 174,
                anti_control = 174},
      skills =>
          [{69001, 80},
           {69002, 80},
           {69003, 80},
           {69006, 80},
           {69005, 80},
           {69004, 80},
           {69007, 80}]};
get({110, 6}) ->
    #{attr =>
          #attr{hp_max = 14435, mp_max = 2212, atk_speed = 387,
                phy_dmg = 3664, magic_dmg = 5340, phy_def = 3735,
                magic_def = 3000, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{69001, 80},
           {69002, 80},
           {69003, 80},
           {69006, 80},
           {69005, 80},
           {69004, 80},
           {69007, 80}]};
get({111, 6}) ->
    #{attr =>
          #attr{hp_max = 14435, mp_max = 2212, atk_speed = 387,
                phy_dmg = 3664, magic_dmg = 5340, phy_def = 3735,
                magic_def = 3000, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{69001, 80},
           {69002, 80},
           {69003, 80},
           {69006, 80},
           {69005, 80},
           {69004, 80},
           {69007, 80}]};
get({112, 6}) ->
    #{attr =>
          #attr{hp_max = 14435, mp_max = 2212, atk_speed = 387,
                phy_dmg = 3664, magic_dmg = 5340, phy_def = 3735,
                magic_def = 3000, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{69001, 80},
           {69002, 80},
           {69003, 80},
           {69006, 80},
           {69005, 80},
           {69004, 80},
           {69007, 80}]};
get({113, 6}) ->
    #{attr =>
          #attr{hp_max = 14435, mp_max = 2212, atk_speed = 387,
                phy_dmg = 3664, magic_dmg = 5340, phy_def = 3735,
                magic_def = 3000, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{69001, 80},
           {69002, 80},
           {69003, 80},
           {69006, 80},
           {69005, 80},
           {69004, 80},
           {69007, 80}]};
get({114, 6}) ->
    #{attr =>
          #attr{hp_max = 14435, mp_max = 2212, atk_speed = 387,
                phy_dmg = 3664, magic_dmg = 5340, phy_def = 3735,
                magic_def = 3000, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{69001, 80},
           {69002, 80},
           {69003, 80},
           {69006, 80},
           {69005, 80},
           {69004, 80},
           {69007, 80}]};
get({115, 6}) ->
    #{attr =>
          #attr{hp_max = 14435, mp_max = 2212, atk_speed = 387,
                phy_dmg = 3664, magic_dmg = 5340, phy_def = 3735,
                magic_def = 3000, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{69001, 80},
           {69002, 80},
           {69003, 80},
           {69006, 80},
           {69005, 80},
           {69004, 80},
           {69007, 80}]};
get({116, 6}) ->
    #{attr =>
          #attr{hp_max = 14435, mp_max = 2212, atk_speed = 387,
                phy_dmg = 3664, magic_dmg = 5340, phy_def = 3735,
                magic_def = 3000, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{69001, 80},
           {69002, 80},
           {69003, 80},
           {69006, 80},
           {69005, 80},
           {69004, 80},
           {69007, 80}]};
get({117, 6}) ->
    #{attr =>
          #attr{hp_max = 14435, mp_max = 2212, atk_speed = 387,
                phy_dmg = 3664, magic_dmg = 5340, phy_def = 3735,
                magic_def = 3000, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{69001, 80},
           {69002, 80},
           {69003, 80},
           {69006, 80},
           {69005, 80},
           {69004, 80},
           {69007, 80}]};
get({118, 6}) ->
    #{attr =>
          #attr{hp_max = 14435, mp_max = 2212, atk_speed = 387,
                phy_dmg = 3664, magic_dmg = 5340, phy_def = 3735,
                magic_def = 3000, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{69001, 80},
           {69002, 80},
           {69003, 80},
           {69006, 80},
           {69005, 80},
           {69004, 80},
           {69007, 80}]};
get({119, 6}) ->
    #{attr =>
          #attr{hp_max = 14435, mp_max = 2212, atk_speed = 387,
                phy_dmg = 3664, magic_dmg = 5340, phy_def = 3735,
                magic_def = 3000, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{69001, 80},
           {69002, 80},
           {69003, 80},
           {69006, 80},
           {69005, 80},
           {69004, 80},
           {69007, 80}]};
get({120, 6}) ->
    #{attr =>
          #attr{hp_max = 14435, mp_max = 2212, atk_speed = 387,
                phy_dmg = 3664, magic_dmg = 5340, phy_def = 3735,
                magic_def = 3000, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{69001, 80},
           {69002, 80},
           {69003, 80},
           {69006, 80},
           {69005, 80},
           {69004, 80},
           {69007, 80}]};
get({121, 6}) ->
    #{attr =>
          #attr{hp_max = 14435, mp_max = 2212, atk_speed = 387,
                phy_dmg = 3664, magic_dmg = 5340, phy_def = 3735,
                magic_def = 3000, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{69001, 80},
           {69002, 80},
           {69003, 80},
           {69006, 80},
           {69005, 80},
           {69004, 80},
           {69007, 80}]};
get({122, 6}) ->
    #{attr =>
          #attr{hp_max = 14435, mp_max = 2212, atk_speed = 387,
                phy_dmg = 3664, magic_dmg = 5340, phy_def = 3735,
                magic_def = 3000, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{69001, 80},
           {69002, 80},
           {69003, 80},
           {69006, 80},
           {69005, 80},
           {69004, 80},
           {69007, 80}]};
get({123, 6}) ->
    #{attr =>
          #attr{hp_max = 14435, mp_max = 2212, atk_speed = 387,
                phy_dmg = 3664, magic_dmg = 5340, phy_def = 3735,
                magic_def = 3000, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{69001, 80},
           {69002, 80},
           {69003, 80},
           {69006, 80},
           {69005, 80},
           {69004, 80},
           {69007, 80}]};
get({124, 6}) ->
    #{attr =>
          #attr{hp_max = 14435, mp_max = 2212, atk_speed = 387,
                phy_dmg = 3664, magic_dmg = 5340, phy_def = 3735,
                magic_def = 3000, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{69001, 80},
           {69002, 80},
           {69003, 80},
           {69006, 80},
           {69005, 80},
           {69004, 80},
           {69007, 80}]};
get({125, 6}) ->
    #{attr =>
          #attr{hp_max = 14435, mp_max = 2212, atk_speed = 387,
                phy_dmg = 3664, magic_dmg = 5340, phy_def = 3735,
                magic_def = 3000, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{69001, 80},
           {69002, 80},
           {69003, 80},
           {69006, 80},
           {69005, 80},
           {69004, 80},
           {69007, 80}]};
get({126, 6}) ->
    #{attr =>
          #attr{hp_max = 14435, mp_max = 2212, atk_speed = 387,
                phy_dmg = 3664, magic_dmg = 5340, phy_def = 3735,
                magic_def = 3000, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{69001, 80},
           {69002, 80},
           {69003, 80},
           {69006, 80},
           {69005, 80},
           {69004, 80},
           {69007, 80}]};
get({127, 6}) ->
    #{attr =>
          #attr{hp_max = 14435, mp_max = 2212, atk_speed = 387,
                phy_dmg = 3664, magic_dmg = 5340, phy_def = 3735,
                magic_def = 3000, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{69001, 80},
           {69002, 80},
           {69003, 80},
           {69006, 80},
           {69005, 80},
           {69004, 80},
           {69007, 80}]};
get({128, 6}) ->
    #{attr =>
          #attr{hp_max = 14435, mp_max = 2212, atk_speed = 387,
                phy_dmg = 3664, magic_dmg = 5340, phy_def = 3735,
                magic_def = 3000, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{69001, 80},
           {69002, 80},
           {69003, 80},
           {69006, 80},
           {69005, 80},
           {69004, 80},
           {69007, 80}]};
get({129, 6}) ->
    #{attr =>
          #attr{hp_max = 14435, mp_max = 2212, atk_speed = 387,
                phy_dmg = 3664, magic_dmg = 5340, phy_def = 3735,
                magic_def = 3000, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{69001, 80},
           {69002, 80},
           {69003, 80},
           {69006, 80},
           {69005, 80},
           {69004, 80},
           {69007, 80}]};
get({130, 6}) ->
    #{attr =>
          #attr{hp_max = 14435, mp_max = 2212, atk_speed = 387,
                phy_dmg = 3664, magic_dmg = 5340, phy_def = 3735,
                magic_def = 3000, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{69001, 80},
           {69002, 80},
           {69003, 80},
           {69006, 80},
           {69005, 80},
           {69004, 80},
           {69007, 80}]};
get({20, 7}) ->
    #{attr =>
          #attr{hp_max = 1344, mp_max = 390, atk_speed = 53,
                phy_dmg = 762, magic_dmg = 355, phy_def = 396,
                magic_def = 246, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 26, anti_control = 26},
      skills => [{69501, 20}, {69502, 20}, {69503, 20}]};
get({21, 7}) ->
    #{attr =>
          #attr{hp_max = 1365, mp_max = 399, atk_speed = 53,
                phy_dmg = 771, magic_dmg = 356, phy_def = 402,
                magic_def = 249, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 26, anti_control = 26},
      skills => [{69501, 21}, {69502, 21}, {69503, 21}]};
get({22, 7}) ->
    #{attr =>
          #attr{hp_max = 1409, mp_max = 417, atk_speed = 55,
                phy_dmg = 790, magic_dmg = 360, phy_def = 416,
                magic_def = 257, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 26, anti_control = 26},
      skills => [{69501, 22}, {69502, 22}, {69503, 22}]};
get({23, 7}) ->
    #{attr =>
          #attr{hp_max = 1452, mp_max = 436, atk_speed = 57,
                phy_dmg = 809, magic_dmg = 362, phy_def = 429,
                magic_def = 266, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 26, anti_control = 26},
      skills => [{69501, 23}, {69502, 23}, {69503, 23}]};
get({24, 7}) ->
    #{attr =>
          #attr{hp_max = 1496, mp_max = 455, atk_speed = 59,
                phy_dmg = 828, magic_dmg = 365, phy_def = 442,
                magic_def = 274, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 26, anti_control = 26},
      skills => [{69501, 24}, {69502, 24}, {69503, 24}]};
get({25, 7}) ->
    #{attr =>
          #attr{hp_max = 1561, mp_max = 483, atk_speed = 62,
                phy_dmg = 856, magic_dmg = 371, phy_def = 462,
                magic_def = 286, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 26, anti_control = 26},
      skills =>
          [{69501, 25}, {69502, 25}, {69503, 25}, {69504, 25}]};
get({26, 7}) ->
    #{attr =>
          #attr{hp_max = 1608, mp_max = 492, atk_speed = 63,
                phy_dmg = 890, magic_dmg = 390, phy_def = 475,
                magic_def = 295, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 27, anti_control = 27},
      skills =>
          [{69501, 26}, {69502, 26}, {69503, 26}, {69504, 26}]};
get({27, 7}) ->
    #{attr =>
          #attr{hp_max = 1701, mp_max = 511, atk_speed = 67,
                phy_dmg = 956, magic_dmg = 429, phy_def = 504,
                magic_def = 312, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 30, anti_control = 30},
      skills =>
          [{69501, 27}, {69502, 27}, {69503, 27}, {69504, 27}]};
get({28, 7}) ->
    #{attr =>
          #attr{hp_max = 1795, mp_max = 531, atk_speed = 71,
                phy_dmg = 1024, magic_dmg = 468, phy_def = 532,
                magic_def = 330, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 33, anti_control = 33},
      skills =>
          [{69501, 28}, {69502, 28}, {69503, 28}, {69504, 28}]};
get({29, 7}) ->
    #{attr =>
          #attr{hp_max = 1888, mp_max = 550, atk_speed = 74,
                phy_dmg = 1091, magic_dmg = 507, phy_def = 559,
                magic_def = 348, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 36, anti_control = 36},
      skills =>
          [{69501, 29}, {69502, 29}, {69503, 29}, {69504, 29}]};
get({30, 7}) ->
    #{attr =>
          #attr{hp_max = 2029, mp_max = 579, atk_speed = 80,
                phy_dmg = 1192, magic_dmg = 566, phy_def = 602,
                magic_def = 375, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 41, anti_control = 41},
      skills =>
          [{69501, 30}, {69502, 30}, {69503, 30}, {69504, 30}]};
get({31, 7}) ->
    #{attr =>
          #attr{hp_max = 2050, mp_max = 580, atk_speed = 80,
                phy_dmg = 1202, magic_dmg = 569, phy_def = 613,
                magic_def = 380, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 41, anti_control = 41},
      skills =>
          [{69501, 31}, {69502, 31}, {69503, 31}, {69504, 31}]};
get({32, 7}) ->
    #{attr =>
          #attr{hp_max = 2094, mp_max = 584, atk_speed = 82,
                phy_dmg = 1224, magic_dmg = 574, phy_def = 638,
                magic_def = 391, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 41, anti_control = 41},
      skills =>
          [{69501, 32}, {69502, 32}, {69503, 32}, {69504, 32}]};
get({33, 7}) ->
    #{attr =>
          #attr{hp_max = 2137, mp_max = 588, atk_speed = 84,
                phy_dmg = 1246, magic_dmg = 581, phy_def = 662,
                magic_def = 402, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 41, anti_control = 41},
      skills =>
          [{69501, 33}, {69502, 33}, {69503, 33}, {69504, 33}]};
get({34, 7}) ->
    #{attr =>
          #attr{hp_max = 2181, mp_max = 592, atk_speed = 86,
                phy_dmg = 1267, magic_dmg = 587, phy_def = 685,
                magic_def = 413, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 41, anti_control = 41},
      skills =>
          [{69501, 34}, {69502, 34}, {69503, 34}, {69504, 34}]};
get({35, 7}) ->
    #{attr =>
          #attr{hp_max = 2246, mp_max = 598, atk_speed = 89,
                phy_dmg = 1300, magic_dmg = 596, phy_def = 722,
                magic_def = 430, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 41, anti_control = 41},
      skills =>
          [{69501, 35},
           {69502, 35},
           {69503, 35},
           {69504, 35},
           {69505, 35}]};
get({36, 7}) ->
    #{attr =>
          #attr{hp_max = 2376, mp_max = 599, atk_speed = 91,
                phy_dmg = 1349, magic_dmg = 616, phy_def = 748,
                magic_def = 443, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 41, anti_control = 41},
      skills =>
          [{69501, 36},
           {69502, 36},
           {69503, 36},
           {69504, 36},
           {69505, 36}]};
get({37, 7}) ->
    #{attr =>
          #attr{hp_max = 2635, mp_max = 603, atk_speed = 96,
                phy_dmg = 1448, magic_dmg = 658, phy_def = 800,
                magic_def = 470, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 41, anti_control = 41},
      skills =>
          [{69501, 37},
           {69502, 37},
           {69503, 37},
           {69504, 37},
           {69505, 37}]};
get({38, 7}) ->
    #{attr =>
          #attr{hp_max = 2895, mp_max = 607, atk_speed = 102,
                phy_dmg = 1548, magic_dmg = 700, phy_def = 854,
                magic_def = 496, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 41, anti_control = 41},
      skills =>
          [{69501, 38},
           {69502, 38},
           {69503, 38},
           {69504, 38},
           {69505, 38}]};
get({39, 7}) ->
    #{attr =>
          #attr{hp_max = 3155, mp_max = 610, atk_speed = 107,
                phy_dmg = 1648, magic_dmg = 741, phy_def = 906,
                magic_def = 523, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 41, anti_control = 41},
      skills =>
          [{69501, 39},
           {69502, 39},
           {69503, 39},
           {69504, 39},
           {69505, 39}]};
get({40, 7}) ->
    #{attr =>
          #attr{hp_max = 3545, mp_max = 616, atk_speed = 115,
                phy_dmg = 1797, magic_dmg = 804, phy_def = 985,
                magic_def = 564, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 41, anti_control = 41},
      skills =>
          [{69501, 40},
           {69502, 40},
           {69503, 40},
           {69504, 40},
           {69505, 40}]};
get({41, 7}) ->
    #{attr =>
          #attr{hp_max = 3625, mp_max = 625, atk_speed = 118,
                phy_dmg = 1824, magic_dmg = 810, phy_def = 1006,
                magic_def = 582, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 42, anti_control = 42},
      skills =>
          [{69501, 41},
           {69502, 41},
           {69503, 41},
           {69504, 41},
           {69505, 41}]};
get({42, 7}) ->
    #{attr =>
          #attr{hp_max = 3786, mp_max = 645, atk_speed = 125,
                phy_dmg = 1879, magic_dmg = 822, phy_def = 1049,
                magic_def = 619, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 45, anti_control = 45},
      skills =>
          [{69501, 42},
           {69502, 42},
           {69503, 42},
           {69504, 42},
           {69505, 42}]};
get({43, 7}) ->
    #{attr =>
          #attr{hp_max = 3947, mp_max = 664, atk_speed = 133,
                phy_dmg = 1934, magic_dmg = 835, phy_def = 1093,
                magic_def = 657, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 48, anti_control = 48},
      skills =>
          [{69501, 43},
           {69502, 43},
           {69503, 43},
           {69504, 43},
           {69505, 43}]};
get({44, 7}) ->
    #{attr =>
          #attr{hp_max = 4107, mp_max = 683, atk_speed = 140,
                phy_dmg = 1988, magic_dmg = 846, phy_def = 1137,
                magic_def = 694, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 51, anti_control = 51},
      skills =>
          [{69501, 44},
           {69502, 44},
           {69503, 44},
           {69504, 44},
           {69505, 44}]};
get({45, 7}) ->
    #{attr =>
          #attr{hp_max = 4349, mp_max = 713, atk_speed = 151,
                phy_dmg = 2071, magic_dmg = 865, phy_def = 1202,
                magic_def = 750, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 56, anti_control = 56},
      skills =>
          [{69501, 45},
           {69502, 45},
           {69503, 45},
           {69504, 45},
           {69505, 45},
           {69506, 45}]};
get({46, 7}) ->
    #{attr =>
          #attr{hp_max = 4419, mp_max = 720, atk_speed = 154,
                phy_dmg = 2115, magic_dmg = 893, phy_def = 1227,
                magic_def = 762, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 56, anti_control = 56},
      skills =>
          [{69501, 46},
           {69502, 46},
           {69503, 46},
           {69504, 46},
           {69505, 46},
           {69506, 46}]};
get({47, 7}) ->
    #{attr =>
          #attr{hp_max = 4559, mp_max = 734, atk_speed = 160,
                phy_dmg = 2206, magic_dmg = 948, phy_def = 1276,
                magic_def = 789, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 57, anti_control = 57},
      skills =>
          [{69501, 47},
           {69502, 47},
           {69503, 47},
           {69504, 47},
           {69505, 47},
           {69506, 47}]};
get({48, 7}) ->
    #{attr =>
          #attr{hp_max = 4700, mp_max = 749, atk_speed = 166,
                phy_dmg = 2298, magic_dmg = 1004, phy_def = 1326,
                magic_def = 815, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 59, anti_control = 59},
      skills =>
          [{69501, 48},
           {69502, 48},
           {69503, 48},
           {69504, 48},
           {69505, 48},
           {69506, 48}]};
get({49, 7}) ->
    #{attr =>
          #attr{hp_max = 4840, mp_max = 764, atk_speed = 172,
                phy_dmg = 2389, magic_dmg = 1060, phy_def = 1375,
                magic_def = 840, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 60, anti_control = 60},
      skills =>
          [{69501, 49},
           {69502, 49},
           {69503, 49},
           {69504, 49},
           {69505, 49},
           {69506, 49}]};
get({50, 7}) ->
    #{attr =>
          #attr{hp_max = 5051, mp_max = 786, atk_speed = 182,
                phy_dmg = 2526, magic_dmg = 1143, phy_def = 1450,
                magic_def = 880, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 62, anti_control = 62},
      skills =>
          [{69501, 50},
           {69502, 50},
           {69503, 50},
           {69504, 50},
           {69505, 50},
           {69506, 50}]};
get({51, 7}) ->
    #{attr =>
          #attr{hp_max = 5106, mp_max = 802, atk_speed = 185,
                phy_dmg = 2555, magic_dmg = 1155, phy_def = 1464,
                magic_def = 892, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 64, anti_control = 64},
      skills =>
          [{69501, 51},
           {69502, 51},
           {69503, 51},
           {69504, 51},
           {69505, 51},
           {69506, 51}]};
get({52, 7}) ->
    #{attr =>
          #attr{hp_max = 5217, mp_max = 835, atk_speed = 191,
                phy_dmg = 2614, magic_dmg = 1178, phy_def = 1495,
                magic_def = 916, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 68, anti_control = 68},
      skills =>
          [{69501, 52},
           {69502, 52},
           {69503, 52},
           {69504, 52},
           {69505, 52},
           {69506, 52}]};
get({53, 7}) ->
    #{attr =>
          #attr{hp_max = 5329, mp_max = 869, atk_speed = 197,
                phy_dmg = 2674, magic_dmg = 1200, phy_def = 1525,
                magic_def = 941, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 73, anti_control = 73},
      skills =>
          [{69501, 53},
           {69502, 53},
           {69503, 53},
           {69504, 53},
           {69505, 53},
           {69506, 53}]};
get({54, 7}) ->
    #{attr =>
          #attr{hp_max = 5440, mp_max = 902, atk_speed = 203,
                phy_dmg = 2734, magic_dmg = 1223, phy_def = 1556,
                magic_def = 965, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 78, anti_control = 78},
      skills =>
          [{69501, 54},
           {69502, 54},
           {69503, 54},
           {69504, 54},
           {69505, 54},
           {69506, 54}]};
get({55, 7}) ->
    #{attr =>
          #attr{hp_max = 5607, mp_max = 952, atk_speed = 213,
                phy_dmg = 2823, magic_dmg = 1258, phy_def = 1601,
                magic_def = 1002, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 85, anti_control = 85},
      skills =>
          [{69501, 55},
           {69502, 55},
           {69503, 55},
           {69504, 55},
           {69505, 55},
           {69506, 55},
           {69507, 55}]};
get({56, 7}) ->
    #{attr =>
          #attr{hp_max = 5719, mp_max = 957, atk_speed = 215,
                phy_dmg = 2876, magic_dmg = 1286, phy_def = 1632,
                magic_def = 1027, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 85, anti_control = 85},
      skills =>
          [{69501, 56},
           {69502, 56},
           {69503, 56},
           {69504, 56},
           {69505, 56},
           {69506, 56},
           {69507, 56}]};
get({57, 7}) ->
    #{attr =>
          #attr{hp_max = 5943, mp_max = 967, atk_speed = 221,
                phy_dmg = 2983, magic_dmg = 1342, phy_def = 1692,
                magic_def = 1080, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 86, anti_control = 86},
      skills =>
          [{69501, 57},
           {69502, 57},
           {69503, 57},
           {69504, 57},
           {69505, 57},
           {69506, 57},
           {69507, 57}]};
get({58, 7}) ->
    #{attr =>
          #attr{hp_max = 6168, mp_max = 977, atk_speed = 227,
                phy_dmg = 3091, magic_dmg = 1398, phy_def = 1753,
                magic_def = 1133, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 87, anti_control = 87},
      skills =>
          [{69501, 58},
           {69502, 58},
           {69503, 58},
           {69504, 58},
           {69505, 58},
           {69506, 58},
           {69507, 58}]};
get({59, 7}) ->
    #{attr =>
          #attr{hp_max = 6392, mp_max = 987, atk_speed = 232,
                phy_dmg = 3198, magic_dmg = 1453, phy_def = 1814,
                magic_def = 1185, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 87, anti_control = 87},
      skills =>
          [{69501, 59},
           {69502, 59},
           {69503, 59},
           {69504, 59},
           {69505, 59},
           {69506, 59},
           {69507, 59}]};
get({60, 7}) ->
    #{attr =>
          #attr{hp_max = 6729, mp_max = 1002, atk_speed = 241,
                phy_dmg = 3360, magic_dmg = 1538, phy_def = 1906,
                magic_def = 1264, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 89, anti_control = 89},
      skills =>
          [{69501, 60},
           {69502, 60},
           {69503, 60},
           {69504, 60},
           {69505, 60},
           {69506, 60},
           {69507, 60}]};
get({61, 7}) ->
    #{attr =>
          #attr{hp_max = 6811, mp_max = 1017, atk_speed = 246,
                phy_dmg = 3394, magic_dmg = 1545, phy_def = 1925,
                magic_def = 1288, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 91, anti_control = 91},
      skills =>
          [{69501, 61},
           {69502, 61},
           {69503, 61},
           {69504, 61},
           {69505, 61},
           {69506, 61},
           {69507, 61}]};
get({62, 7}) ->
    #{attr =>
          #attr{hp_max = 6978, mp_max = 1047, atk_speed = 256,
                phy_dmg = 3462, magic_dmg = 1562, phy_def = 1965,
                magic_def = 1335, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 95, anti_control = 95},
      skills =>
          [{69501, 62},
           {69502, 62},
           {69503, 62},
           {69504, 62},
           {69505, 62},
           {69506, 62},
           {69507, 62}]};
get({63, 7}) ->
    #{attr =>
          #attr{hp_max = 7144, mp_max = 1077, atk_speed = 266,
                phy_dmg = 3531, magic_dmg = 1579, phy_def = 2004,
                magic_def = 1383, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 100,
                anti_control = 100},
      skills =>
          [{69501, 63},
           {69502, 63},
           {69503, 63},
           {69504, 63},
           {69505, 63},
           {69506, 63},
           {69507, 63}]};
get({64, 7}) ->
    #{attr =>
          #attr{hp_max = 7310, mp_max = 1107, atk_speed = 276,
                phy_dmg = 3599, magic_dmg = 1596, phy_def = 2043,
                magic_def = 1430, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 105,
                anti_control = 105},
      skills =>
          [{69501, 64},
           {69502, 64},
           {69503, 64},
           {69504, 64},
           {69505, 64},
           {69506, 64},
           {69507, 64}]};
get({65, 7}) ->
    #{attr =>
          #attr{hp_max = 7560, mp_max = 1153, atk_speed = 291,
                phy_dmg = 3703, magic_dmg = 1622, phy_def = 2103,
                magic_def = 1502, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 112,
                anti_control = 112},
      skills =>
          [{69501, 65},
           {69502, 65},
           {69503, 65},
           {69504, 65},
           {69505, 65},
           {69506, 65},
           {69507, 65}]};
get({66, 7}) ->
    #{attr =>
          #attr{hp_max = 7646, mp_max = 1158, atk_speed = 295,
                phy_dmg = 3751, magic_dmg = 1653, phy_def = 2127,
                magic_def = 1515, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 112,
                anti_control = 112},
      skills =>
          [{69501, 66},
           {69502, 66},
           {69503, 66},
           {69504, 66},
           {69505, 66},
           {69506, 66},
           {69507, 66}]};
get({67, 7}) ->
    #{attr =>
          #attr{hp_max = 7819, mp_max = 1169, atk_speed = 304,
                phy_dmg = 3850, magic_dmg = 1713, phy_def = 2175,
                magic_def = 1541, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 113,
                anti_control = 113},
      skills =>
          [{69501, 67},
           {69502, 67},
           {69503, 67},
           {69504, 67},
           {69505, 67},
           {69506, 67},
           {69507, 67}]};
get({68, 7}) ->
    #{attr =>
          #attr{hp_max = 7992, mp_max = 1180, atk_speed = 313,
                phy_dmg = 3948, magic_dmg = 1774, phy_def = 2224,
                magic_def = 1568, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 114,
                anti_control = 114},
      skills =>
          [{69501, 68},
           {69502, 68},
           {69503, 68},
           {69504, 68},
           {69505, 68},
           {69506, 68},
           {69507, 68}]};
get({69, 7}) ->
    #{attr =>
          #attr{hp_max = 8166, mp_max = 1190, atk_speed = 322,
                phy_dmg = 4046, magic_dmg = 1835, phy_def = 2273,
                magic_def = 1594, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 114,
                anti_control = 114},
      skills =>
          [{69501, 69},
           {69502, 69},
           {69503, 69},
           {69504, 69},
           {69505, 69},
           {69506, 69},
           {69507, 69}]};
get({70, 7}) ->
    #{attr =>
          #attr{hp_max = 8426, mp_max = 1207, atk_speed = 336,
                phy_dmg = 4194, magic_dmg = 1927, phy_def = 2346,
                magic_def = 1634, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 116,
                anti_control = 116},
      skills =>
          [{69501, 70},
           {69502, 70},
           {69503, 70},
           {69504, 70},
           {69505, 70},
           {69506, 70},
           {69507, 70}]};
get({71, 7}) ->
    #{attr =>
          #attr{hp_max = 8550, mp_max = 1224, atk_speed = 340,
                phy_dmg = 4256, magic_dmg = 1955, phy_def = 2380,
                magic_def = 1658, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 117,
                anti_control = 117},
      skills =>
          [{69501, 71},
           {69502, 71},
           {69503, 71},
           {69504, 71},
           {69505, 71},
           {69506, 71},
           {69507, 71}]};
get({72, 7}) ->
    #{attr =>
          #attr{hp_max = 8675, mp_max = 1242, atk_speed = 345,
                phy_dmg = 4318, magic_dmg = 1984, phy_def = 2415,
                magic_def = 1682, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 119,
                anti_control = 119},
      skills =>
          [{69501, 72},
           {69502, 72},
           {69503, 72},
           {69504, 72},
           {69505, 72},
           {69506, 72},
           {69507, 72}]};
get({73, 7}) ->
    #{attr =>
          #attr{hp_max = 8800, mp_max = 1260, atk_speed = 350,
                phy_dmg = 4380, magic_dmg = 2012, phy_def = 2450,
                magic_def = 1706, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 121,
                anti_control = 121},
      skills =>
          [{69501, 73},
           {69502, 73},
           {69503, 73},
           {69504, 73},
           {69505, 73},
           {69506, 73},
           {69507, 73}]};
get({74, 7}) ->
    #{attr =>
          #attr{hp_max = 8925, mp_max = 1278, atk_speed = 355,
                phy_dmg = 4442, magic_dmg = 2041, phy_def = 2485,
                magic_def = 1730, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 122,
                anti_control = 122},
      skills =>
          [{69501, 74},
           {69502, 74},
           {69503, 74},
           {69504, 74},
           {69505, 74},
           {69506, 74},
           {69507, 74}]};
get({75, 7}) ->
    #{attr =>
          #attr{hp_max = 9050, mp_max = 1296, atk_speed = 360,
                phy_dmg = 4504, magic_dmg = 2069, phy_def = 2519,
                magic_def = 1755, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 124,
                anti_control = 124},
      skills =>
          [{69501, 75},
           {69502, 75},
           {69503, 75},
           {69504, 75},
           {69505, 75},
           {69506, 75},
           {69507, 75}]};
get({76, 7}) ->
    #{attr =>
          #attr{hp_max = 9174, mp_max = 1314, atk_speed = 365,
                phy_dmg = 4566, magic_dmg = 2098, phy_def = 2554,
                magic_def = 1779, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 126,
                anti_control = 126},
      skills =>
          [{69501, 76},
           {69502, 76},
           {69503, 76},
           {69504, 76},
           {69505, 76},
           {69506, 76},
           {69507, 76}]};
get({77, 7}) ->
    #{attr =>
          #attr{hp_max = 9299, mp_max = 1332, atk_speed = 370,
                phy_dmg = 4628, magic_dmg = 2126, phy_def = 2589,
                magic_def = 1803, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 128,
                anti_control = 128},
      skills =>
          [{69501, 77},
           {69502, 77},
           {69503, 77},
           {69504, 77},
           {69505, 77},
           {69506, 77},
           {69507, 77}]};
get({78, 7}) ->
    #{attr =>
          #attr{hp_max = 9424, mp_max = 1350, atk_speed = 375,
                phy_dmg = 4691, magic_dmg = 2155, phy_def = 2624,
                magic_def = 1827, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 129,
                anti_control = 129},
      skills =>
          [{69501, 78},
           {69502, 78},
           {69503, 78},
           {69504, 78},
           {69505, 78},
           {69506, 78},
           {69507, 78}]};
get({79, 7}) ->
    #{attr =>
          #attr{hp_max = 9549, mp_max = 1367, atk_speed = 380,
                phy_dmg = 4753, magic_dmg = 2183, phy_def = 2658,
                magic_def = 1851, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 131,
                anti_control = 131},
      skills =>
          [{69501, 79},
           {69502, 79},
           {69503, 79},
           {69504, 79},
           {69505, 79},
           {69506, 79},
           {69507, 79}]};
get({80, 7}) ->
    #{attr =>
          #attr{hp_max = 9674, mp_max = 1385, atk_speed = 385,
                phy_dmg = 4815, magic_dmg = 2212, phy_def = 2693,
                magic_def = 1876, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 133,
                anti_control = 133},
      skills =>
          [{69501, 80},
           {69502, 80},
           {69503, 80},
           {69504, 80},
           {69505, 80},
           {69506, 80},
           {69507, 80}]};
get({81, 7}) ->
    #{attr =>
          #attr{hp_max = 9799, mp_max = 1403, atk_speed = 390,
                phy_dmg = 4877, magic_dmg = 2241, phy_def = 2728,
                magic_def = 1900, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 134,
                anti_control = 134},
      skills =>
          [{69501, 80},
           {69502, 80},
           {69503, 80},
           {69504, 80},
           {69505, 80},
           {69506, 80},
           {69507, 80}]};
get({82, 7}) ->
    #{attr =>
          #attr{hp_max = 9923, mp_max = 1421, atk_speed = 395,
                phy_dmg = 4939, magic_dmg = 2269, phy_def = 2763,
                magic_def = 1924, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 136,
                anti_control = 136},
      skills =>
          [{69501, 80},
           {69502, 80},
           {69503, 80},
           {69504, 80},
           {69505, 80},
           {69506, 80},
           {69507, 80}]};
get({83, 7}) ->
    #{attr =>
          #attr{hp_max = 10048, mp_max = 1439, atk_speed = 400,
                phy_dmg = 5001, magic_dmg = 2298, phy_def = 2797,
                magic_def = 1948, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 138,
                anti_control = 138},
      skills =>
          [{69501, 80},
           {69502, 80},
           {69503, 80},
           {69504, 80},
           {69505, 80},
           {69506, 80},
           {69507, 80}]};
get({84, 7}) ->
    #{attr =>
          #attr{hp_max = 10173, mp_max = 1457, atk_speed = 405,
                phy_dmg = 5063, magic_dmg = 2326, phy_def = 2832,
                magic_def = 1972, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 140,
                anti_control = 140},
      skills =>
          [{69501, 80},
           {69502, 80},
           {69503, 80},
           {69504, 80},
           {69505, 80},
           {69506, 80},
           {69507, 80}]};
get({85, 7}) ->
    #{attr =>
          #attr{hp_max = 10298, mp_max = 1475, atk_speed = 410,
                phy_dmg = 5126, magic_dmg = 2355, phy_def = 2867,
                magic_def = 1997, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 141,
                anti_control = 141},
      skills =>
          [{69501, 80},
           {69502, 80},
           {69503, 80},
           {69504, 80},
           {69505, 80},
           {69506, 80},
           {69507, 80}]};
get({86, 7}) ->
    #{attr =>
          #attr{hp_max = 10423, mp_max = 1493, atk_speed = 415,
                phy_dmg = 5188, magic_dmg = 2383, phy_def = 2902,
                magic_def = 2021, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 143,
                anti_control = 143},
      skills =>
          [{69501, 80},
           {69502, 80},
           {69503, 80},
           {69504, 80},
           {69505, 80},
           {69506, 80},
           {69507, 80}]};
get({87, 7}) ->
    #{attr =>
          #attr{hp_max = 10548, mp_max = 1510, atk_speed = 420,
                phy_dmg = 5250, magic_dmg = 2412, phy_def = 2936,
                magic_def = 2045, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 145,
                anti_control = 145},
      skills =>
          [{69501, 80},
           {69502, 80},
           {69503, 80},
           {69504, 80},
           {69505, 80},
           {69506, 80},
           {69507, 80}]};
get({88, 7}) ->
    #{attr =>
          #attr{hp_max = 10672, mp_max = 1528, atk_speed = 425,
                phy_dmg = 5312, magic_dmg = 2440, phy_def = 2971,
                magic_def = 2069, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 146,
                anti_control = 146},
      skills =>
          [{69501, 80},
           {69502, 80},
           {69503, 80},
           {69504, 80},
           {69505, 80},
           {69506, 80},
           {69507, 80}]};
get({89, 7}) ->
    #{attr =>
          #attr{hp_max = 10797, mp_max = 1546, atk_speed = 430,
                phy_dmg = 5374, magic_dmg = 2469, phy_def = 3006,
                magic_def = 2093, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 148,
                anti_control = 148},
      skills =>
          [{69501, 80},
           {69502, 80},
           {69503, 80},
           {69504, 80},
           {69505, 80},
           {69506, 80},
           {69507, 80}]};
get({90, 7}) ->
    #{attr =>
          #attr{hp_max = 10922, mp_max = 1564, atk_speed = 435,
                phy_dmg = 5436, magic_dmg = 2497, phy_def = 3041,
                magic_def = 2118, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 150,
                anti_control = 150},
      skills =>
          [{69501, 80},
           {69502, 80},
           {69503, 80},
           {69504, 80},
           {69505, 80},
           {69506, 80},
           {69507, 80}]};
get({91, 7}) ->
    #{attr =>
          #attr{hp_max = 11016, mp_max = 1578, atk_speed = 439,
                phy_dmg = 5483, magic_dmg = 2519, phy_def = 3067,
                magic_def = 2136, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 151,
                anti_control = 151},
      skills =>
          [{69501, 80},
           {69502, 80},
           {69503, 80},
           {69504, 80},
           {69505, 80},
           {69506, 80},
           {69507, 80}]};
get({92, 7}) ->
    #{attr =>
          #attr{hp_max = 11109, mp_max = 1591, atk_speed = 443,
                phy_dmg = 5529, magic_dmg = 2540, phy_def = 3093,
                magic_def = 2154, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 152,
                anti_control = 152},
      skills =>
          [{69501, 80},
           {69502, 80},
           {69503, 80},
           {69504, 80},
           {69505, 80},
           {69506, 80},
           {69507, 80}]};
get({93, 7}) ->
    #{attr =>
          #attr{hp_max = 11203, mp_max = 1604, atk_speed = 446,
                phy_dmg = 5576, magic_dmg = 2562, phy_def = 3119,
                magic_def = 2172, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 154,
                anti_control = 154},
      skills =>
          [{69501, 80},
           {69502, 80},
           {69503, 80},
           {69504, 80},
           {69505, 80},
           {69506, 80},
           {69507, 80}]};
get({94, 7}) ->
    #{attr =>
          #attr{hp_max = 11297, mp_max = 1618, atk_speed = 450,
                phy_dmg = 5623, magic_dmg = 2583, phy_def = 3145,
                magic_def = 2190, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 155,
                anti_control = 155},
      skills =>
          [{69501, 80},
           {69502, 80},
           {69503, 80},
           {69504, 80},
           {69505, 80},
           {69506, 80},
           {69507, 80}]};
get({95, 7}) ->
    #{attr =>
          #attr{hp_max = 11390, mp_max = 1631, atk_speed = 454,
                phy_dmg = 5669, magic_dmg = 2605, phy_def = 3171,
                magic_def = 2208, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 156,
                anti_control = 156},
      skills =>
          [{69501, 80},
           {69502, 80},
           {69503, 80},
           {69504, 80},
           {69505, 80},
           {69506, 80},
           {69507, 80}]};
get({96, 7}) ->
    #{attr =>
          #attr{hp_max = 11484, mp_max = 1645, atk_speed = 457,
                phy_dmg = 5716, magic_dmg = 2626, phy_def = 3197,
                magic_def = 2227, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 158,
                anti_control = 158},
      skills =>
          [{69501, 80},
           {69502, 80},
           {69503, 80},
           {69504, 80},
           {69505, 80},
           {69506, 80},
           {69507, 80}]};
get({97, 7}) ->
    #{attr =>
          #attr{hp_max = 11577, mp_max = 1658, atk_speed = 461,
                phy_dmg = 5762, magic_dmg = 2647, phy_def = 3223,
                magic_def = 2245, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 159,
                anti_control = 159},
      skills =>
          [{69501, 80},
           {69502, 80},
           {69503, 80},
           {69504, 80},
           {69505, 80},
           {69506, 80},
           {69507, 80}]};
get({98, 7}) ->
    #{attr =>
          #attr{hp_max = 11671, mp_max = 1671, atk_speed = 465,
                phy_dmg = 5809, magic_dmg = 2669, phy_def = 3249,
                magic_def = 2263, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 160,
                anti_control = 160},
      skills =>
          [{69501, 80},
           {69502, 80},
           {69503, 80},
           {69504, 80},
           {69505, 80},
           {69506, 80},
           {69507, 80}]};
get({99, 7}) ->
    #{attr =>
          #attr{hp_max = 11765, mp_max = 1685, atk_speed = 469,
                phy_dmg = 5856, magic_dmg = 2690, phy_def = 3275,
                magic_def = 2281, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 161,
                anti_control = 161},
      skills =>
          [{69501, 80},
           {69502, 80},
           {69503, 80},
           {69504, 80},
           {69505, 80},
           {69506, 80},
           {69507, 80}]};
get({100, 7}) ->
    #{attr =>
          #attr{hp_max = 11858, mp_max = 1698, atk_speed = 472,
                phy_dmg = 5902, magic_dmg = 2712, phy_def = 3301,
                magic_def = 2299, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 163,
                anti_control = 163},
      skills =>
          [{69501, 80},
           {69502, 80},
           {69503, 80},
           {69504, 80},
           {69505, 80},
           {69506, 80},
           {69507, 80}]};
get({101, 7}) ->
    #{attr =>
          #attr{hp_max = 11952, mp_max = 1712, atk_speed = 476,
                phy_dmg = 5949, magic_dmg = 2733, phy_def = 3327,
                magic_def = 2317, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 164,
                anti_control = 164},
      skills =>
          [{69501, 80},
           {69502, 80},
           {69503, 80},
           {69504, 80},
           {69505, 80},
           {69506, 80},
           {69507, 80}]};
get({102, 7}) ->
    #{attr =>
          #attr{hp_max = 12046, mp_max = 1725, atk_speed = 480,
                phy_dmg = 5995, magic_dmg = 2754, phy_def = 3353,
                magic_def = 2336, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 165,
                anti_control = 165},
      skills =>
          [{69501, 80},
           {69502, 80},
           {69503, 80},
           {69504, 80},
           {69505, 80},
           {69506, 80},
           {69507, 80}]};
get({103, 7}) ->
    #{attr =>
          #attr{hp_max = 12139, mp_max = 1738, atk_speed = 484,
                phy_dmg = 6042, magic_dmg = 2776, phy_def = 3379,
                magic_def = 2354, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 167,
                anti_control = 167},
      skills =>
          [{69501, 80},
           {69502, 80},
           {69503, 80},
           {69504, 80},
           {69505, 80},
           {69506, 80},
           {69507, 80}]};
get({104, 7}) ->
    #{attr =>
          #attr{hp_max = 12233, mp_max = 1752, atk_speed = 487,
                phy_dmg = 6089, magic_dmg = 2797, phy_def = 3406,
                magic_def = 2372, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 168,
                anti_control = 168},
      skills =>
          [{69501, 80},
           {69502, 80},
           {69503, 80},
           {69504, 80},
           {69505, 80},
           {69506, 80},
           {69507, 80}]};
get({105, 7}) ->
    #{attr =>
          #attr{hp_max = 12326, mp_max = 1765, atk_speed = 491,
                phy_dmg = 6135, magic_dmg = 2819, phy_def = 3432,
                magic_def = 2390, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 169,
                anti_control = 169},
      skills =>
          [{69501, 80},
           {69502, 80},
           {69503, 80},
           {69504, 80},
           {69505, 80},
           {69506, 80},
           {69507, 80}]};
get({106, 7}) ->
    #{attr =>
          #attr{hp_max = 12420, mp_max = 1779, atk_speed = 495,
                phy_dmg = 6182, magic_dmg = 2840, phy_def = 3458,
                magic_def = 2408, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 170,
                anti_control = 170},
      skills =>
          [{69501, 80},
           {69502, 80},
           {69503, 80},
           {69504, 80},
           {69505, 80},
           {69506, 80},
           {69507, 80}]};
get({107, 7}) ->
    #{attr =>
          #attr{hp_max = 12514, mp_max = 1792, atk_speed = 499,
                phy_dmg = 6228, magic_dmg = 2861, phy_def = 3484,
                magic_def = 2426, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 172,
                anti_control = 172},
      skills =>
          [{69501, 80},
           {69502, 80},
           {69503, 80},
           {69504, 80},
           {69505, 80},
           {69506, 80},
           {69507, 80}]};
get({108, 7}) ->
    #{attr =>
          #attr{hp_max = 12607, mp_max = 1806, atk_speed = 502,
                phy_dmg = 6275, magic_dmg = 2883, phy_def = 3510,
                magic_def = 2444, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 173,
                anti_control = 173},
      skills =>
          [{69501, 80},
           {69502, 80},
           {69503, 80},
           {69504, 80},
           {69505, 80},
           {69506, 80},
           {69507, 80}]};
get({109, 7}) ->
    #{attr =>
          #attr{hp_max = 12701, mp_max = 1819, atk_speed = 506,
                phy_dmg = 6322, magic_dmg = 2904, phy_def = 3536,
                magic_def = 2463, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 174,
                anti_control = 174},
      skills =>
          [{69501, 80},
           {69502, 80},
           {69503, 80},
           {69504, 80},
           {69505, 80},
           {69506, 80},
           {69507, 80}]};
get({110, 7}) ->
    #{attr =>
          #attr{hp_max = 12795, mp_max = 1832, atk_speed = 510,
                phy_dmg = 6368, magic_dmg = 2926, phy_def = 3562,
                magic_def = 2481, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{69501, 80},
           {69502, 80},
           {69503, 80},
           {69504, 80},
           {69505, 80},
           {69506, 80},
           {69507, 80}]};
get({111, 7}) ->
    #{attr =>
          #attr{hp_max = 12795, mp_max = 1832, atk_speed = 510,
                phy_dmg = 6368, magic_dmg = 2926, phy_def = 3562,
                magic_def = 2481, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{69501, 80},
           {69502, 80},
           {69503, 80},
           {69504, 80},
           {69505, 80},
           {69506, 80},
           {69507, 80}]};
get({112, 7}) ->
    #{attr =>
          #attr{hp_max = 12795, mp_max = 1832, atk_speed = 510,
                phy_dmg = 6368, magic_dmg = 2926, phy_def = 3562,
                magic_def = 2481, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{69501, 80},
           {69502, 80},
           {69503, 80},
           {69504, 80},
           {69505, 80},
           {69506, 80},
           {69507, 80}]};
get({113, 7}) ->
    #{attr =>
          #attr{hp_max = 12795, mp_max = 1832, atk_speed = 510,
                phy_dmg = 6368, magic_dmg = 2926, phy_def = 3562,
                magic_def = 2481, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{69501, 80},
           {69502, 80},
           {69503, 80},
           {69504, 80},
           {69505, 80},
           {69506, 80},
           {69507, 80}]};
get({114, 7}) ->
    #{attr =>
          #attr{hp_max = 12795, mp_max = 1832, atk_speed = 510,
                phy_dmg = 6368, magic_dmg = 2926, phy_def = 3562,
                magic_def = 2481, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{69501, 80},
           {69502, 80},
           {69503, 80},
           {69504, 80},
           {69505, 80},
           {69506, 80},
           {69507, 80}]};
get({115, 7}) ->
    #{attr =>
          #attr{hp_max = 12795, mp_max = 1832, atk_speed = 510,
                phy_dmg = 6368, magic_dmg = 2926, phy_def = 3562,
                magic_def = 2481, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{69501, 80},
           {69502, 80},
           {69503, 80},
           {69504, 80},
           {69505, 80},
           {69506, 80},
           {69507, 80}]};
get({116, 7}) ->
    #{attr =>
          #attr{hp_max = 12795, mp_max = 1832, atk_speed = 510,
                phy_dmg = 6368, magic_dmg = 2926, phy_def = 3562,
                magic_def = 2481, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{69501, 80},
           {69502, 80},
           {69503, 80},
           {69504, 80},
           {69505, 80},
           {69506, 80},
           {69507, 80}]};
get({117, 7}) ->
    #{attr =>
          #attr{hp_max = 12795, mp_max = 1832, atk_speed = 510,
                phy_dmg = 6368, magic_dmg = 2926, phy_def = 3562,
                magic_def = 2481, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{69501, 80},
           {69502, 80},
           {69503, 80},
           {69504, 80},
           {69505, 80},
           {69506, 80},
           {69507, 80}]};
get({118, 7}) ->
    #{attr =>
          #attr{hp_max = 12795, mp_max = 1832, atk_speed = 510,
                phy_dmg = 6368, magic_dmg = 2926, phy_def = 3562,
                magic_def = 2481, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{69501, 80},
           {69502, 80},
           {69503, 80},
           {69504, 80},
           {69505, 80},
           {69506, 80},
           {69507, 80}]};
get({119, 7}) ->
    #{attr =>
          #attr{hp_max = 12795, mp_max = 1832, atk_speed = 510,
                phy_dmg = 6368, magic_dmg = 2926, phy_def = 3562,
                magic_def = 2481, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{69501, 80},
           {69502, 80},
           {69503, 80},
           {69504, 80},
           {69505, 80},
           {69506, 80},
           {69507, 80}]};
get({120, 7}) ->
    #{attr =>
          #attr{hp_max = 12795, mp_max = 1832, atk_speed = 510,
                phy_dmg = 6368, magic_dmg = 2926, phy_def = 3562,
                magic_def = 2481, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{69501, 80},
           {69502, 80},
           {69503, 80},
           {69504, 80},
           {69505, 80},
           {69506, 80},
           {69507, 80}]};
get({121, 7}) ->
    #{attr =>
          #attr{hp_max = 12795, mp_max = 1832, atk_speed = 510,
                phy_dmg = 6368, magic_dmg = 2926, phy_def = 3562,
                magic_def = 2481, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{69501, 80},
           {69502, 80},
           {69503, 80},
           {69504, 80},
           {69505, 80},
           {69506, 80},
           {69507, 80}]};
get({122, 7}) ->
    #{attr =>
          #attr{hp_max = 12795, mp_max = 1832, atk_speed = 510,
                phy_dmg = 6368, magic_dmg = 2926, phy_def = 3562,
                magic_def = 2481, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{69501, 80},
           {69502, 80},
           {69503, 80},
           {69504, 80},
           {69505, 80},
           {69506, 80},
           {69507, 80}]};
get({123, 7}) ->
    #{attr =>
          #attr{hp_max = 12795, mp_max = 1832, atk_speed = 510,
                phy_dmg = 6368, magic_dmg = 2926, phy_def = 3562,
                magic_def = 2481, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{69501, 80},
           {69502, 80},
           {69503, 80},
           {69504, 80},
           {69505, 80},
           {69506, 80},
           {69507, 80}]};
get({124, 7}) ->
    #{attr =>
          #attr{hp_max = 12795, mp_max = 1832, atk_speed = 510,
                phy_dmg = 6368, magic_dmg = 2926, phy_def = 3562,
                magic_def = 2481, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{69501, 80},
           {69502, 80},
           {69503, 80},
           {69504, 80},
           {69505, 80},
           {69506, 80},
           {69507, 80}]};
get({125, 7}) ->
    #{attr =>
          #attr{hp_max = 12795, mp_max = 1832, atk_speed = 510,
                phy_dmg = 6368, magic_dmg = 2926, phy_def = 3562,
                magic_def = 2481, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{69501, 80},
           {69502, 80},
           {69503, 80},
           {69504, 80},
           {69505, 80},
           {69506, 80},
           {69507, 80}]};
get({126, 7}) ->
    #{attr =>
          #attr{hp_max = 12795, mp_max = 1832, atk_speed = 510,
                phy_dmg = 6368, magic_dmg = 2926, phy_def = 3562,
                magic_def = 2481, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{69501, 80},
           {69502, 80},
           {69503, 80},
           {69504, 80},
           {69505, 80},
           {69506, 80},
           {69507, 80}]};
get({127, 7}) ->
    #{attr =>
          #attr{hp_max = 12795, mp_max = 1832, atk_speed = 510,
                phy_dmg = 6368, magic_dmg = 2926, phy_def = 3562,
                magic_def = 2481, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{69501, 80},
           {69502, 80},
           {69503, 80},
           {69504, 80},
           {69505, 80},
           {69506, 80},
           {69507, 80}]};
get({128, 7}) ->
    #{attr =>
          #attr{hp_max = 12795, mp_max = 1832, atk_speed = 510,
                phy_dmg = 6368, magic_dmg = 2926, phy_def = 3562,
                magic_def = 2481, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{69501, 80},
           {69502, 80},
           {69503, 80},
           {69504, 80},
           {69505, 80},
           {69506, 80},
           {69507, 80}]};
get({129, 7}) ->
    #{attr =>
          #attr{hp_max = 12795, mp_max = 1832, atk_speed = 510,
                phy_dmg = 6368, magic_dmg = 2926, phy_def = 3562,
                magic_def = 2481, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{69501, 80},
           {69502, 80},
           {69503, 80},
           {69504, 80},
           {69505, 80},
           {69506, 80},
           {69507, 80}]};
get({130, 7}) ->
    #{attr =>
          #attr{hp_max = 12795, mp_max = 1832, atk_speed = 510,
                phy_dmg = 6368, magic_dmg = 2926, phy_def = 3562,
                magic_def = 2481, crit = 0, tenacity = 0, accuracy = 0,
                evasion = 0, holy_dmg = 0, crit_dmg = 0, dmg_ratio = 0,
                def_ratio = 0, enhance_control = 176,
                anti_control = 176},
      skills =>
          [{69501, 80},
           {69502, 80},
           {69503, 80},
           {69504, 80},
           {69505, 80},
           {69506, 80},
           {69507, 80}]};
get(_) -> false.

